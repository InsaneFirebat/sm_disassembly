
org $A68000


; Common to all enemy code banks

;;; $8000: Grapple AI - no interaction. Also unfreezes enemies(!) ;;;
CommonA6_GrappleAI_NoInteraction:
; Used by skultera, Draygon body, fire arc, Phantoon, etecoon, dachora and WS ghost
    JSL GrappleAI_SwitchEnemyAIToMainAI
    RTL


;;; $8005: Grapple AI - Samus latches on ;;;
CommonA6_GrappleAI_SamusLatchesOn:
; Used by gripper and Crocomire
    JSL GrappleAI_SamusLatchesOnWithGrapple
    RTL


;;; $800A: Grapple AI - kill enemy ;;;
CommonA6_GrappleAI_KillEnemy:
; Common
    JSL GrappleAI_EnemyGrappleDeath
    RTL


;;; $800F: Grapple AI - cancel grapple beam ;;;
CommonA6_GrappleAI_CancelGrappleBeam:
; Common
    JSL GrappleAI_SwitchToFrozenAI
    RTL


;;; $8014: Grapple AI - Samus latches on - no invincibility ;;;
CommonA6_GrappleAI_SamusLatchesOn_NoInvincibility:
; Used by powamp
    JSL GrappleAI_SamusLatchesOnWithGrapple_NoInvincibility
    RTL


;;; $8019: Unused. Grapple AI - Samus latches on - paralyse enemy ;;;
UNUSED_CommonA6_GrappleAI_SamusLatchesOn_ParalyzeEnemy_A68019:
    JSL GrappleAI_SamusLatchesOnWithGrapple_ParalyzeEnemy
    RTL


;;; $801E: Grapple AI - hurt Samus ;;;
CommonA6_GrappleAI_HurtSamus:
; Used by WS spark
; Hurt reaction happens in $9B:B932
    JSL GrappleAI_SwitchToFrozenAI_duplicate
    RTL


;;; $8023: Normal enemy touch AI ;;;
CommonA6_NormalEnemyTouchAI:
    JSL NormalEnemyTouchAI
    RTL


;;; $8028: Normal touch AI - no death check ;;;
CommonA6_NormalTouchAI_NoDeathCheck:
    JSL NormalEnemyTouchAI_NoDeathCheck_External
    RTL


;;; $802D: Normal enemy shot AI ;;;
CommonA6_NormalEnemyShotAI:
    JSL NormalEnemyShotAI
    RTL


;;; $8032: Normal enemy shot AI - no death check, no enemy shot graphic ;;;
CommonA6_NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic:
    JSL NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External
    RTL


;;; $8037: Normal enemy power bomb AI ;;;
CommonA6_NormalEnemyPowerBombAI:
    JSL NormalEnemyPowerBombAI
    RTL


;;; $803C: Normal enemy power bomb AI - no death check ;;;
CommonA6_NormalEnemyPowerBombAI_NoDeathCheck:
; Kraid's power bomb AI
    JSL NormalEnemyPowerBombAI_NoDeathCheck_External
    RTL


;;; $8041: Normal enemy frozen AI ;;;
CommonA6_NormalEnemyFrozenAI:
    JSL NormalEnemyFrozenAI
    RTL


;;; $8046: Creates a dud shot ;;;
CommonA6_CreateADudShot:
    JSL CreateADudShot
    RTL


;;; $804B: RTS ;;;
RTS_A6804B:
    RTS


;;; $804C: RTL ;;;
RTL_A6804C:
    RTL


;;; $804D: Spritemap - nothing ;;;
Spritemap_CommonA6_Nothing:
    dw $0000


;;; $804F: Extended spritemap - nothing ;;;
ExtendedSpritemap_CommonA6_Nothing:
    dw $0001
    dw $0000,$0000
    dw Spritemap_CommonA6_Nothing
    dw Hitbox_CommonA6_Nothing


;;; $8059: Hitbox - nothing ;;;
Hitbox_CommonA6_Nothing:
; [n entries] [[left offset] [top offset] [right offset] [bottom offset] [p touch] [p shot]]...
    dw $0001
    dw $0000,$0000,$0000,$0000
    dw CommonA6_NormalEnemyTouchAI
    dw CommonA6_NormalEnemyShotAI


;;; $8067: Instruction list - delete enemy ;;;
InstList_CommonA6_DeleteEnemy:
    dw Instruction_CommonA6_DeleteEnemy


;;; $8069: Two NOPs ;;;
NOPNOP_A68069:
; Used as palette by respawning enemy placeholder and Draygon's eye o_O
    NOP
    NOP


;;; $806B: Instruction - Enemy.var5 = [[Y]] ;;;
Instruction_CommonA6_Enemy0FB2_InY:
; Used only by torizos (for enemy movement function) and escape etecoon (for enemy function)
    LDA.W $0000,Y
    STA.W Enemy.var5,X
    INY
    INY
    RTL


;;; $8074: Instruction - Enemy.var5 = RTS ;;;
Instruction_CommonA6_SetEnemy0FB2ToRTS:
    LDA.W #RTS_A6807B
    STA.W Enemy.var5,X
    RTL


RTS_A6807B:
    RTS


;;; $807C: Instruction - delete enemy ;;;
Instruction_CommonA6_DeleteEnemy:
    LDA.W Enemy.properties,X
    ORA.W #$0200
    STA.W Enemy.properties,X
    PLA
    PEA.W ProcessEnemyInstructions_return-1
    RTL


;;; $808A: Instruction - call function [[Y]] ;;;
Instruction_CommonA6_CallFunctionInY:
    LDA.W $0000,Y
    STA.B DP_Temp12
    PHY
    PHX
    PEA .manualReturn-1
    JMP.W (DP_Temp12)

  .manualReturn:
    PLX
    PLY
    INY
    INY
    RTL


;;; $809C: Instruction - call function [[Y]] with A = [[Y] + 2] ;;;
Instruction_CommonA6_CallFunctionInY_WithA:
    LDA.W $0000,Y
    STA.B DP_Temp12
    LDA.W $0002,Y
    PHY
    PHX
    PEA .manualReturn-1
    JMP.W (DP_Temp12)

  .manualReturn:
    PLX
    PLY
    TYA
    CLC
    ADC.W #$0004
    TAY
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $80B5: Unused. Instruction - call external function [[Y]] ;;;
UNUSED_Instruction_CommonA6_CallExternalFunctionInY_A680B5:
    LDA.W $0000,Y
    STA.B DP_Temp12
    LDA.W $0001,Y
    STA.B DP_Temp13
    PHX
    PHY
    JSL .externalFunction
    PLY
    PLX
    INY
    INY
    INY
    RTL

  .externalFunction:
    JML.W [DP_Temp12]


;;; $80CE: Unused. Instruction - call external function [[Y]] with A = [[Y] + 3] ;;;
UNUSED_Inst_CommonA6_CallExternalFunctionInY_WithA_A680CE:
    LDA.W $0000,Y
    STA.B DP_Temp12
    LDA.W $0001,Y
    STA.B DP_Temp13
    LDA.W $0003,Y
    PHX
    PHY
    JSL .externalFunction
    PLY
    PLX
    TYA
    CLC
    ADC.W #$0005
    TAY
    RTL

  .externalFunction:
    JML.W [DP_Temp12]
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $80ED: Instruction - go to [[Y]] ;;;
Instruction_CommonA6_GotoY:
    LDA.W $0000,Y
    TAY
    RTL


;;; $80F2: Instruction - go to [[Y]] + ±[[Y]] ;;;
Instruction_CommonA6_GotoY_PlusY:
    STY.B DP_Temp12
    DEY
    LDA.W $0000,Y
    XBA
    BMI .highByte
    AND.W #$00FF
    BRA +

  .highByte:
    ORA.W #$FF00

+   CLC
    ADC.B DP_Temp12
    TAY
    RTL


;;; $8108: Instruction - decrement timer and go to [[Y]] if non-zero ;;;
Instruction_CommonA6_DecrementTimer_GotoYIfNonZero:
    DEC.W Enemy.loopCounter,X
    BNE Instruction_CommonA6_GotoY
    INY
    INY
    RTL


;;; $8110: Instruction - decrement timer and go to [[Y]] if non-zero ;;;
Instruction_CommonA6_DecrementTimer_GotoYIfNonZero_duplicate:
    DEC.W Enemy.loopCounter,X
    BNE Instruction_CommonA6_GotoY
    INY
    INY
    RTL


;;; $8118: Instruction - decrement timer and go to [Y] + ±[[Y]] if non-zero ;;;
Instruction_CommonA6_DecrementTimer_GotoY_PlusY_IfNonZero:
    SEP #$20
    DEC.W Enemy.loopCounter,X
    REP #$20
    BNE Instruction_CommonA6_GotoY_PlusY
    INY
    RTL


;;; $8123: Instruction - timer = [[Y]] ;;;
Instruction_CommonA6_TimerInY:
    LDA.W $0000,Y
    STA.W Enemy.loopCounter,X
    INY
    INY
    RTL


;;; $812C: Instruction - skip next instruction ;;;
Instruction_CommonA6_SkipNextInstruction:
    INY
    INY
    RTL


;;; $812F: Instruction - sleep ;;;
Instruction_CommonA6_Sleep:
    DEY
    DEY
    TYA
    STA.W Enemy.instList,X
    PLA
    PEA.W ProcessEnemyInstructions_return-1
    RTL


;;; $813A: Instruction - wait [[Y]] frames ;;;
Instruction_CommonA6_WaitYFrames:
; Set instruction timer and terminate processing enemy instructions
; Used for running a delay that doesn't update graphics,
; useful for e.g. GT eye beam attack ($AA:D10D), implemented by an instruction list that has no graphical instructions,
; which allows it to be called from multiple different poses
    LDA.W $0000,Y
    STA.W Enemy.instTimer,X
    INY
    INY
    TYA
    STA.W Enemy.instList,X
    PLA
    PEA.W ProcessEnemyInstructions_return-1
    RTL


;;; $814B: Instruction - transfer [[Y]] bytes from [[Y] + 2] to VRAM [[Y] + 5] ;;;
Instruction_CommonA6_TransferYBytesInYToVRAM:
    PHX
    LDX.W VRAMWriteStack
    LDA.W $0000,Y
    STA.B VRAMWrite.size,X
    LDA.W $0002,Y
    STA.B VRAMWrite.src,X
    LDA.W $0003,Y
    STA.B VRAMWrite.src+1,X
    LDA.W $0005,Y
    STA.B $D5,X
    TXA
    CLC
    ADC.W #$0007
    STA.W VRAMWriteStack
    TYA
    CLC
    ADC.W #$0007
    TAY
    PLX
    RTL


;;; $8173: Instruction - enable off-screen processing ;;;
Instruction_CommonA6_EnableOffScreenProcessing:
    LDA.W Enemy.properties,X
    ORA.W #$0800
    STA.W Enemy.properties,X
    RTL


;;; $817D: Instruction - disable off-screen processing ;;;
Instruction_CommonA6_DisableOffScreenProcessing:
    LDA.W Enemy.properties,X
    AND.W #$F7FF
    STA.W Enemy.properties,X
    RTL


;;; $8187: Common enemy speeds - linearly increasing ;;;
CommonA6EnemySpeeds_LinearlyIncreasing:
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
CommonA6EnemySpeeds_QuadraticallyIncreasing:
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


;;; $8687: Palette - enemy $DFBF (boulder) ;;;
Palette_Boulder:
    dw $3800,$49EF,$45CE,$3D8C,$396B,$3529,$2D08,$28C6
    dw $20A5,$1C63,$2506,$1CC4,$1083,$0841,$6EF7,$0000


;;; $86A7: Instruction list - facing left ;;;
InstList_Boulder_FacingLeft:
    dw $0008,Spritemap_Boulder_0
    dw $0008,Spritemap_Boulder_1
    dw $0008,Spritemap_Boulder_2
    dw $0008,Spritemap_Boulder_3
    dw $0008,Spritemap_Boulder_4
    dw $0008,Spritemap_Boulder_5
    dw $0008,Spritemap_Boulder_6
    dw $0008,Spritemap_Boulder_7
    dw Instruction_Common_GotoY
    dw InstList_Boulder_FacingLeft


;;; $86CB: Instruction list - facing right ;;;
InstList_Boulder_FacingRight:
    dw $0008,Spritemap_Boulder_0
    dw $0008,Spritemap_Boulder_7
    dw $0008,Spritemap_Boulder_6
    dw $0008,Spritemap_Boulder_5
    dw $0008,Spritemap_Boulder_4
    dw $0008,Spritemap_Boulder_3
    dw $0008,Spritemap_Boulder_2
    dw $0008,Spritemap_Boulder_1
    dw Instruction_Common_GotoY
    dw InstList_Boulder_FacingRight


;;; $86EF: Bounce speed table indices ;;;
BounceSpeedTableIndices:
; Y speed table index * 100h. Indexed by [enemy bounce index] * 2
    dw $0000,$1000,$1800


;;; $86F5: Initialisation AI - enemy $DFBF (boulder) ;;;
InitAI_Boulder:
    LDX.W EnemyIndex
    STZ.W Boulder.YSpeedTableIndex,X
    LDA.W #$0000
    STA.W Boulder.XSpeedTableIndex,X
    LDA.W #$0002
    STA.W Boulder.bounceIndex,X
    LDA.W #Function_Boulder_WaitForSamusToGetNear
    STA.W Boulder.function,X
    LDA.W Enemy.XPosition,X
    STA.L Boulder.spawnXPosition,X
    LDA.W Enemy.YPosition,X
    STA.L Boulder.fallingTargetYPosition,X
    STA.L Boulder.previousEnemyYPosition,X
    LDA.W Enemy.YSubPosition,X
    STA.L Boulder.previousEnemyYSubPosition,X
    LDA.W Enemy.init1+1,X
    AND.W #$00FF
    BNE .notRolling
    LDA.W #$0001
    STA.L Boulder.type,X

  .notRolling:
    EOR.W #$FFFF
    INC
    CLC
    ADC.L Boulder.fallingTargetYPosition,X
    STA.W Enemy.YPosition,X
    LDA.W Enemy.init1,X
    AND.W #$00FF
    EOR.W #$FFFF
    INC
    STA.L Boulder.XProximity,X
    LDA.W Enemy.instList,X
    AND.W #$00FF
    STA.L Boulder.YProximity,X
    LDA.W #InstList_Boulder_FacingLeft
    STA.W Enemy.instList,X
    LDA.W Enemy.init0+1,X
    AND.W #$00FF
    STA.W Boulder.direction,X
    BNE .left
    LDA.L Boulder.XProximity,X
    EOR.W #$FFFF
    INC
    STA.L Boulder.XProximity,X
    LDA.W #InstList_Boulder_FacingRight
    STA.W Enemy.instList,X

  .left:
    LDA.W #$0002
    STA.L Boulder.minimumDistanceFromGround,X
    LDA.W Enemy.init0,X
    AND.W #$00FF
    BEQ .return
    LDA.W #$0005
    STA.L Boulder.minimumDistanceFromGround,X

  .return:
    RTL


;;; $8793: Main AI - enemy $DFBF (boulder) ;;;
MainAI_Boulder:
    LDX.W EnemyIndex
    JSR.W (Boulder.function,X)
    RTL


;;; $879A: Boulder function - wait for Samus to get near ;;;
Function_Boulder_WaitForSamusToGetNear:
    LDX.W EnemyIndex
    JSL Get_SamusY_minus_EnemyY
    BMI .return
    CMP.L Boulder.YProximity,X
    BPL .return
    LDA.W Boulder.direction,X
    BNE .left
    JSL Get_SamusX_minus_EnemyX
    BMI .return
    CMP.L Boulder.XProximity,X
    BPL .return
    LDA.W #Function_Boulder_Falling
    STA.W Boulder.function,X
    LDA.L Boulder.type,X
    BEQ .return
    LDA.W #Function_Boulder_Rolling
    STA.W Boulder.function,X
    BRA .return


  .left:
    JSL Get_SamusX_minus_EnemyX
    BPL .return
    CMP.L Boulder.XProximity,X
    BMI .return
    LDA.W #Function_Boulder_Falling
    STA.W Boulder.function,X
    LDA.L Boulder.type,X
    BEQ .return
    LDA.W #Function_Boulder_Rolling
    STA.W Boulder.function,X

  .return:
    RTS


;;; $87ED: Boulder function - falling ;;;
Function_Boulder_Falling:
    LDX.W EnemyIndex
    LDA.W Boulder.YSpeedTableIndex,X
    AND.W #$FF00
    XBA
    ASL
    ASL
    ASL
    TAY
    JSR MoveBoulderVertically
    LDA.W Enemy.YPosition,X
    CMP.L Boulder.fallingTargetYPosition,X
    BMI .notReachedTarget
    LDA.L Boulder.fallingTargetYPosition,X
    STA.W Enemy.YPosition,X
    LDA.W #Function_Boulder_Bounce_Rising
    STA.W Boulder.function,X
    LDA.W #$2000
    STA.W Boulder.YSpeedTableIndex,X
    BRA .return

  .notReachedTarget:
    LDA.W Boulder.YSpeedTableIndex,X
    CLC
    ADC.W #$0100
    STA.W Boulder.YSpeedTableIndex,X
    CMP.W #$5000
    BMI .return
    LDA.W #$5000
    STA.W Boulder.YSpeedTableIndex,X

  .return:
    RTS


;;; $8832: Boulder function - bounce - rising ;;;
Function_Boulder_Bounce_Rising:
    LDX.W EnemyIndex
    LDA.W Boulder.YSpeedTableIndex,X
    AND.W #$FF00
    XBA
    ASL
    ASL
    ASL
    INC
    INC
    INC
    INC
    TAY
    JSR MoveBoulderVertically
    LDA.W Boulder.YSpeedTableIndex,X
    SEC
    SBC.W #$0100
    STA.W Boulder.YSpeedTableIndex,X
    BPL .negativeSpeedTableIndex
    STZ.W Boulder.YSpeedTableIndex,X
    LDA.W #Function_Boulder_Bounce_Falling
    STA.W Boulder.function,X
    BRA .return

  .negativeSpeedTableIndex:
    LDA.W Boulder.XSpeedTableIndex,X
    AND.W #$FF00
    XBA
    ASL
    ASL
    ASL
    TAY
    LDA.W Boulder.direction,X
    BEQ .right
    INY
    INY
    INY
    INY

  .right:
    JSR MoveBoulderHorizontally
    LDA.W Boulder.XSpeedTableIndex,X
    CLC
    ADC.W #$0020
    STA.W Boulder.XSpeedTableIndex,X
    CMP.W #$5000
    BMI .return
    LDA.W #$5000
    STA.W Boulder.XSpeedTableIndex,X

  .return:
    RTS


;;; $888B: Boulder function - bounce - falling ;;;
Function_Boulder_Bounce_Falling:
    LDX.W EnemyIndex
    LDA.W Boulder.YSpeedTableIndex,X
    AND.W #$FF00
    XBA
    ASL
    ASL
    ASL
    TAY
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing,Y
    STA.B DP_Temp12
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+2,Y
    STA.B DP_Temp14
    JSL MoveEnemyDownBy_14_12
    BCC .noCollision
    LDA.W #$0042
    JSL QueueSound_Lib2_Max6
    LDA.W Boulder.direction,X
    CMP.W #$0002
    BNE .right
    LDA.W Enemy.properties,X
    ORA.W #$0200
    STA.W Enemy.properties,X
    LDA.W Enemy.XPosition,X
    STA.B DP_Temp12
    LDA.W Enemy.YPosition,X
    STA.B DP_Temp14
    LDA.W #$0011
    LDY.W #EnemyProjectile_MiscDust
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W #$0043
    JSL QueueSound_Lib2_Max6
    BRA .return

  .right:
    LDA.W #Function_Boulder_Bounce_Rising
    STA.W Boulder.function,X
    LDA.W Boulder.bounceIndex,X
    DEC
    ASL
    TAY
    LDA.W BounceSpeedTableIndices+2,Y
    STA.W Boulder.YSpeedTableIndex,X
    DEC.W Boulder.bounceIndex,X
    BPL .return
    LDA.W Enemy.YPosition,X
    STA.L Boulder.previousEnemyYPosition,X
    LDA.W Enemy.YSubPosition,X
    STA.L Boulder.previousEnemyYSubPosition,X
    LDA.W #Function_Boulder_Rolling
    STA.W Boulder.function,X
    BRA .return

  .noCollision:
    LDA.W Boulder.YSpeedTableIndex,X
    CLC
    ADC.W #$0100
    STA.W Boulder.YSpeedTableIndex,X
    LDA.W Boulder.XSpeedTableIndex,X
    AND.W #$FF00
    XBA
    ASL
    ASL
    ASL
    TAY
    LDA.W Boulder.direction,X
    BEQ ..right
    INY
    INY
    INY
    INY

  ..right:
    JSR MoveBoulderHorizontally
    LDA.W Boulder.XSpeedTableIndex,X
    CLC
    ADC.W #$0020
    STA.W Boulder.XSpeedTableIndex,X
    CMP.W #$5000
    BMI .return
    LDA.W #$5000
    STA.W Boulder.XSpeedTableIndex,X

  .return:
    RTS


;;; $8942: Boulder function - rolling ;;;
Function_Boulder_Rolling:
    LDX.W EnemyIndex
    LDA.W Boulder.XSpeedTableIndex,X
    AND.W #$FF00
    XBA
    ASL
    ASL
    ASL
    TAY
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing,Y
    STA.B DP_Temp12
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+2,Y
    CLC
    ADC.L Boulder.minimumDistanceFromGround,X
    STA.B DP_Temp14
    PHY
    JSL MoveEnemyDownBy_14_12
    PLY
    LDA.W Enemy.YPosition,X
    SEC
    SBC.L Boulder.minimumDistanceFromGround,X
    STA.W Enemy.YPosition,X
    LDA.W Boulder.direction,X
    BEQ .right
    INY
    INY
    INY
    INY

  .right:
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing,Y
    STA.B DP_Temp12
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+2,Y
    STA.B DP_Temp14
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCC .notCollidedWithWall
    LDA.W Enemy.properties,X
    ORA.W #$0100
    ORA.W #$0200
    STA.W Enemy.properties,X
    LDA.W #Function_Boulder_LoadEnemyIndex
    STA.W Boulder.function,X
    LDA.W #$0042
    JSL QueueSound_Lib2_Max6
    LDA.W Enemy.XPosition,X
    STA.B DP_Temp12
    LDA.W Enemy.YPosition,X
    STA.B DP_Temp14
    LDA.W #$0011
    LDY.W #EnemyProjectile_MiscDust
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W #$0043
    JSL QueueSound_Lib2_Max6
    BRA .return

  .notCollidedWithWall:
    LDA.W Boulder.XSpeedTableIndex,X
    CLC
    ADC.W #$0040
    STA.W Boulder.XSpeedTableIndex,X
    CMP.W #$4000
    BMI +
    LDA.W #$4000
    STA.W Boulder.XSpeedTableIndex,X

+   LDA.W Enemy.YPosition,X
    CMP.L Boulder.previousEnemyYPosition,X
    BNE .return
    LDA.W Enemy.YSubPosition,X
    CMP.L Boulder.previousEnemyYSubPosition,X
    BNE .return
    LDA.W #$0000
    STA.L Boulder.minimumDistanceFromGround,X

  .return:
    LDA.W Enemy.YPosition,X
    STA.L Boulder.previousEnemyYPosition,X
    LDA.W Enemy.YSubPosition,X
    STA.L Boulder.previousEnemyYSubPosition,X
    RTS


;;; $89FC: RTS ;;;
Function_Boulder_LoadEnemyIndex:
    LDX.W EnemyIndex
    RTS


;;; $8A00: Move boulder horizontally ;;;
MoveBoulderHorizontally:
;; Parameters:
;;     Y: Quadratic speed table index
    LDX.W EnemyIndex
    LDA.W Enemy.XSubPosition,X
    CLC
    ADC.W CommonEnemySpeeds_QuadraticallyIncreasing,Y
    BCC +
    INC.W Enemy.XPosition,X

+   STA.W Enemy.XSubPosition,X
    LDA.W Enemy.XPosition,X
    CLC
    ADC.W CommonEnemySpeeds_QuadraticallyIncreasing+2,Y
    STA.W Enemy.XPosition,X
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $8A1D: Unused. Move boulder horizontally with linear speed table ;;;
UNUSED_MoveBoulderHorizontallyWithLinearSpeedTable_A68A1D:
;; Parameters:
;;     Y: Linear speed table index
    LDX.W EnemyIndex
    LDA.W Enemy.XSubPosition,X
    CLC
    ADC.W CommonEnemySpeeds_LinearlyIncreasing+2,Y
    BCC +
    INC.W Enemy.XPosition,X

+   STA.W Enemy.XSubPosition,X
    LDA.W Enemy.XPosition,X
    CLC
    ADC.W CommonEnemySpeeds_LinearlyIncreasing,Y
    STA.W Enemy.XPosition,X
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8A3A: Move boulder vertically ;;;
MoveBoulderVertically:
;; Parameters:
;;     Y: Quadratic speed table index
    LDX.W EnemyIndex
    LDA.W Enemy.YSubPosition,X
    CLC
    ADC.W CommonEnemySpeeds_QuadraticallyIncreasing,Y
    BCC +
    INC.W Enemy.YPosition,X

+   STA.W Enemy.YSubPosition,X
    LDA.W Enemy.YPosition,X
    CLC
    ADC.W CommonEnemySpeeds_QuadraticallyIncreasing+2,Y
    STA.W Enemy.YPosition,X
    RTS


;;; $8A57: RTL ;;;
RTL_A68A57:
    RTL


;;; $8A58: RTL ;;;
RTL_A68A58:
    RTL


;;; $8A59: Boulder spritemaps ;;;
Spritemap_Boulder_0:
    dw $0004
    %spritemapEntry(1, $00, $00, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $00, $F0, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $100)

Spritemap_Boulder_1:
    dw $0004
    %spritemapEntry(1, $00, $00, 0, 0, 2, 0, $162)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $160)
    %spritemapEntry(1, $00, $F0, 0, 0, 2, 0, $142)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $140)

Spritemap_Boulder_2:
    dw $0004
    %spritemapEntry(1, $00, $00, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $00, $F0, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $104)

Spritemap_Boulder_3:
    dw $0004
    %spritemapEntry(1, $00, $00, 0, 0, 2, 0, $166)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $164)
    %spritemapEntry(1, $00, $F0, 0, 0, 2, 0, $146)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $144)

Spritemap_Boulder_4:
    dw $0004
    %spritemapEntry(1, $00, $00, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $00, $F0, 0, 0, 2, 0, $10A)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $108)

Spritemap_Boulder_5:
    dw $0004
    %spritemapEntry(1, $00, $00, 0, 0, 2, 0, $16A)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $168)
    %spritemapEntry(1, $00, $F0, 0, 0, 2, 0, $14A)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $148)

Spritemap_Boulder_6:
    dw $0004
    %spritemapEntry(1, $00, $00, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $12C)
    %spritemapEntry(1, $00, $F0, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $10C)

Spritemap_Boulder_7:
    dw $0004
    %spritemapEntry(1, $00, $00, 0, 0, 2, 0, $16E)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $16C)
    %spritemapEntry(1, $00, $F0, 0, 0, 2, 0, $14E)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $14C)


;;; $8B09: Palette - enemy $DFFF/$E03F (spike platform) ;;;
Palette_Kzan:
    dw $3800,$62BA,$49F3,$2D4D,$0C44,$49F3,$356E,$20C9
    dw $1486,$241F,$1C17,$142F,$0C47,$0000,$0000,$0000


;;; $8B29: Instruction list - spike platform ;;;
InstList_Kzan:
    dw $0001,Spritemap_Kzan
    dw Instruction_Common_Sleep


;;; $8B2F: Initialisation AI - enemy $DFFF (spike platform top) ;;;
InitAI_KzanTop:
    LDX.W EnemyIndex
    LDA.W #InstList_Kzan
    STA.W Enemy.instList,X
    LDA.W #Function_Kzan_WaitingToFall
    STA.W Kzan.function,X
    LDA.W Enemy.init0,X
    AND.W #$00FF
    ASL
    ASL
    ASL
    STA.L Kzan.fallingYSpeedTableIndex,X
    TAX
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,X
    STA.B DP_Temp12
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,X
    STA.B DP_Temp14
    LDX.W EnemyIndex
    LDA.B DP_Temp14
    STA.W Kzan.initialFallingYSubSpeed,X
    LDA.B DP_Temp12
    STA.W Kzan.initialFallingYSpeed,X
    LDA.W Enemy.init1,X
    AND.W #$FF00
    XBA
    CLC
    ADC.W Enemy.YPosition,X
    STA.W Kzan.fallingTargetYPosition,X
    LDA.W Enemy.YPosition,X
    STA.W Kzan.risingTargetYPosition,X
    LDA.W Enemy.init1,X
    AND.W #$00FF
    STA.L Kzan.fallWaitTimerResetValue,X
    STA.W Kzan.fallWaitTimer,X
    RTL


;;; $8B85: Initialisation AI - enemy $E03F (spike platform bottom) ;;;
InitAI_KzanBottom:
    LDX.W EnemyIndex
    LDA.W Enemy[-1].XPosition,X
    STA.W Enemy.XPosition,X
    LDA.W Enemy[-1].YPosition,X
    CLC
    ADC.W #$000C
    STA.W Enemy.YPosition,X
    RTL


;;; $8B99: Main AI - enemy $E03F (spike platform bottom) ;;;
MainAI_KzanBottom:
    LDX.W EnemyIndex                                                     ; Same as init AI
    LDA.W Enemy[-1].XPosition,X
    STA.W Enemy.XPosition,X
    LDA.W Enemy[-1].YPosition,X
    CLC
    ADC.W #$000C
    STA.W Enemy.YPosition,X
    RTL


;;; $8BAD: Main AI - enemy $DFFF (spike platform top) ;;;
MainAI_KzanTop:
    LDX.W EnemyIndex
    JSR.W (Kzan.function,X)
    RTL


;;; $8BB4: Spike platform function - waiting to fall ;;;
Function_Kzan_WaitingToFall:
    PHX
    LDX.W EnemyIndex
    DEC.W Kzan.fallWaitTimer,X
    LDA.W Kzan.fallWaitTimer,X
    BNE .return
    LDA.L Kzan.fallWaitTimerResetValue,X
    STA.W Kzan.fallWaitTimer,X
    LDA.W Enemy.init0,X
    AND.W #$00FF
    ASL
    ASL
    ASL
    STA.L Kzan.fallingYSpeedTableIndex,X
    LDA.W #Function_Kzan_Falling
    STA.W Kzan.function,X

  .return:
    PLX
    RTS


;;; $8BDC: Spike platform function - falling ;;;
Function_Kzan_Falling:
    PHX
    LDX.W EnemyIndex
    LDA.W Enemy.YPosition,X
    STA.L Kzan.previousYPosition,X
    LDA.L Kzan.fallingYSpeedTableIndex,X
    TAX
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,X
    STA.B DP_Temp14
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,X
    STA.B DP_Temp12
    LDX.W EnemyIndex
    JSL MoveEnemyY_plus_12_14
    LDA.W Enemy.YPosition,X
    CMP.W Kzan.fallingTargetYPosition,X
    BMI .notReachedTarget
    LDA.W #$0040
    STA.L Kzan.riseWaitTimer,X
    LDA.W #Function_Kzan_WaitingToRise
    STA.W Kzan.function,X
    LDA.W Kzan.fallingTargetYPosition,X
    STA.W Enemy.YPosition,X
    LDA.W #$001B
    JSL QueueSound_Lib2_Max6

  .notReachedTarget:
    JSL CheckIfKzanIsTouchingSamusFromBelow
    BEQ .notTouchingSamusFromBelow
    LDA.W Enemy.YPosition,X
    SEC
    SBC.L Kzan.previousYPosition,X
    CLC
    ADC.W ExtraSamusYDisplacement
    STA.W ExtraSamusYDisplacement

  .notTouchingSamusFromBelow:
    LDA.L Kzan.fallingYSpeedTableIndex,X
    CLC
    ADC.W #$0008
    CMP.W #$0200
    BMI +
    LDA.W #$0200

+   STA.L Kzan.fallingYSpeedTableIndex,X
    PLX
    RTS


;;; $8C4A: Spike platform function - waiting to rise ;;;
Function_Kzan_WaitingToRise:
    LDA.L Kzan.riseWaitTimer,X
    DEC
    STA.L Kzan.riseWaitTimer,X
    BEQ .timerExpired
    RTS

  .timerExpired:
    LDA.W #Function_Kzan_Rising
    STA.W Kzan.function,X
    RTS


;;; $8C5D: Spike platform function - rising ;;;
Function_Kzan_Rising:
    PHX
    LDX.W EnemyIndex
    LDA.W Enemy.YPosition,X
    STA.L Kzan.previousYPosition,X
    LDA.W #$8000
    STA.B DP_Temp12
    LDA.W #$0000
    STA.B DP_Temp14
    JSL MoveEnemyY_minus_12_14
    LDA.W Enemy.YPosition,X
    CMP.W Kzan.risingTargetYPosition,X
    BPL .notReachedTarget
    LDA.W #Function_Kzan_WaitingToFall
    STA.W Kzan.function,X
    LDA.W Kzan.risingTargetYPosition,X
    STA.W Enemy.YPosition,X

  .notReachedTarget:
    JSL CheckIfKzanIsTouchingSamusFromBelow
    BEQ .notTouchingSamusFromBelow
    LDA.W Enemy.YPosition,X
    SEC
    SBC.L Kzan.previousYPosition,X
    CLC
    ADC.W ExtraSamusYDisplacement
    STA.W ExtraSamusYDisplacement

  .notTouchingSamusFromBelow:
    PLX
    RTS


;;; $8CA1: Check if spike platform is touching Samus from below ;;;
CheckIfKzanIsTouchingSamusFromBelow:
;; Returns:
;;     Zero: clear if touching Samus, otherwise set

; This is a copy+paste of $A0:ABE7 with the Y delta threshold changed from 3 to 5
    LDA.W SamusXPosition
    SEC
    SBC.W Enemy.XPosition,X
    BPL +
    EOR.W #$FFFF
    INC

+   SEC
    SBC.W SamusXRadius
    BCC .YPosition
    CMP.W Enemy.XHitboxRadius,X
    BCC .YPosition
    LDA.W #$0000
    RTL

  .YPosition:
    LDA.W SamusYPosition
    CLC
    ADC.W #$0005
    SEC
    SBC.W Enemy.YPosition,X
    BPL .returnNotTouchingSamus
    EOR.W #$FFFF
    INC
    SEC
    SBC.W SamusYRadius
    BCC .returnTouchingSamus
    CMP.W Enemy.YHitboxRadius,X
    BEQ .returnTouchingSamus
    BCC .returnTouchingSamus

  .returnNotTouchingSamus:
    LDA.W #$0000
    RTL

  .returnTouchingSamus:
    LDA.W #$FFFF
    RTL


;;; $8CE3: RTL ;;;
RTL_A68CE3:
    RTL


;;; $8CE4: RTL ;;;
RTL_A68CE4:
    RTL


;;; $8CE5: Spike platform spritemap ;;;
Spritemap_Kzan:
    dw $0004
    %spritemapEntry(1, $00, $04, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1F0, $04, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $00, $F4, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F0, $F4, 0, 0, 2, 0, $100)


;;; $8CFB: Palette - enemy $E07F (fire pillar) ;;;
Palette_Hibashi:
    dw $3800,$3E7F,$2DFD,$10FB,$0097,$73FF,$53FF,$37FF
    dw $17FF,$24DF,$189B,$1076,$0C50,$084B,$5EFF,$0880


;;; $8D1B: Instruction list - graphics part ;;;
InstList_Hibashi_GraphicsPart:
    dw Instruction_Hibashi_PlaySFX
    dw $0002,Spritemap_Hibashi_0
    dw Instruction_Hibashi_ActivityFrame0
    dw $0002,Spritemap_Hibashi_1
    dw Instruction_Hibashi_ActivityFrame1
    dw $0002,Spritemap_Hibashi_2
    dw Instruction_Hibashi_ActivityFrame2
    dw $0002,Spritemap_Hibashi_3
    dw Instruction_Hibashi_ActivityFrame3
    dw $0001,Spritemap_Hibashi_4
    dw Instruction_Hibashi_ActivityFrame4
    dw $0001,Spritemap_Hibashi_5
    dw Instruction_Hibashi_ActivityFrame5
    dw $0001,Spritemap_Hibashi_6
    dw Instruction_Hibashi_ActivityFrame6
    dw $0001,Spritemap_Hibashi_7
    dw Instruction_Hibashi_ActivityFrame7
    dw $0002,Spritemap_Hibashi_8
    dw Instruction_Hibashi_ActivityFrame8
    dw $0002,Spritemap_Hibashi_9
    dw Instruction_Hibashi_ActivityFrame9
    dw $0002,Spritemap_Hibashi_A
    dw Instruction_Hibashi_ActivityFrameA
    dw $0002,Spritemap_Hibashi_B
    dw Instruction_Hibashi_ActivityFrameB
    dw $0002,Spritemap_Hibashi_C
    dw Instruction_Hibashi_ActivityFrameC
    dw $0002,Spritemap_Hibashi_D
    dw Instruction_Hibashi_ActivityFrameD
    dw $0002,Spritemap_Hibashi_E
    dw Instruction_Hibashi_ActivityFrameE
    dw $0002,Spritemap_Hibashi_F
    dw Instruction_Hibashi_ActivityFrameF
    dw $0004,Spritemap_Hibashi_10
    dw Instruction_Hibashi_ActivityFrame10
    dw $0004,Spritemap_Hibashi_11
    dw Instruction_Hibashi_ActivityFrame11
    dw $0004,Spritemap_Hibashi_12
    dw Instruction_Hibashi_ActivityFrame12
    dw $0004,Spritemap_Hibashi_13
    dw Instruction_Hibashi_ActivityFrame13
    dw $0004,Spritemap_Hibashi_14
    dw Instruction_Hibashi_ActivityFrame14
    dw $0004,Spritemap_Hibashi_15
    dw Instruction_Hibashi_ActivityFrame15
    dw $0004,Spritemap_Hibashi_16
    dw Instruction_Hibashi_FinishActivity
    dw Instruction_Common_Sleep


;;; $8DA9: Instruction list - hitbox part ;;;
InstList_Hibashi_HitboxPart:
    dw $0002,Spritemap_Hibashi_0
    dw Instruction_Common_Sleep


;;; $8DAF: Instruction - queue fire pillar sound effect ;;;
Instruction_Hibashi_PlaySFX:
    PHX
    PHY
    LDA.W #$0061
    JSL QueueSound_Lib2_Max6
    PLY
    PLX
    RTL


;;; $8DBB: Y offsets ;;;
Hibashi_YOffset_0:
    dw $0005
Hibashi_YOffset_1:
    dw $000A
Hibashi_YOffset_2:
    dw $000F
Hibashi_YOffset_3:
    dw $0014
Hibashi_YOffset_4:
    dw $0019
Hibashi_YOffset_5:
    dw $001E
Hibashi_YOffset_6:
    dw $0023
Hibashi_YOffset_7:
    dw $0028
Hibashi_YOffset_8:
    dw $002D
Hibashi_YOffset_9:
    dw $0032
Hibashi_YOffset_A:
    dw $0037
Hibashi_YOffset_B:
    dw $003C
Hibashi_YOffset_C:
    dw $0041
Hibashi_YOffset_D:
    dw $0046
Hibashi_YOffset_E:
    dw $004B
Hibashi_YOffset_F:
    dw $0050
Hibashi_YOffset_10:
    dw $0055
Hibashi_YOffset_11:
    dw $005A
Hibashi_YOffset_12:
    dw $005F
Hibashi_YOffset_13:
    dw $0064
Hibashi_YOffset_14:
    dw $0069
Hibashi_YOffset_15:
    dw $006E


;;; $8DE7: Y radii ;;;
Hibashi_XOffset_0:
    dw $0018
Hibashi_XOffset_1:
    dw $0018
Hibashi_XOffset_2:
    dw $0018
Hibashi_XOffset_3:
    dw $0018
Hibashi_XOffset_4:
    dw $0018
Hibashi_XOffset_5:
    dw $0018
Hibashi_XOffset_6:
    dw $0018
Hibashi_XOffset_7:
    dw $0018
Hibashi_XOffset_8:
    dw $0018
Hibashi_XOffset_9:
    dw $0018
Hibashi_XOffset_A:
    dw $0018
Hibashi_XOffset_B:
    dw $0018
Hibashi_XOffset_C:
    dw $0018
Hibashi_XOffset_D:
    dw $0018
Hibashi_XOffset_E:
    dw $0018
Hibashi_XOffset_F:
    dw $0018
Hibashi_XOffset_10:
    dw $0018
Hibashi_XOffset_11:
    dw $0018
Hibashi_XOffset_12:
    dw $0014
Hibashi_XOffset_13:
    dw $0010
Hibashi_XOffset_14:
    dw $000C
Hibashi_XOffset_15:
    dw $0008


;;; $8E13: Instruction - activity frame 0 ;;;
Instruction_Hibashi_ActivityFrame0:
    LDX.W EnemyIndex
    LDA.W Hibashi.spawnYPosition,X
    SEC
    SBC.W Hibashi_YOffset_0
    STA.W Enemy[1].YPosition,X
    LDA.W Hibashi_XOffset_0
    STA.W Enemy[1].YHitboxRadius,X
    LDA.W #$0008
    STA.W Enemy[1].XHitboxRadius,X
    RTL


;;; $8E2D: Instruction - activity frame 1 ;;;
Instruction_Hibashi_ActivityFrame1:
    LDX.W EnemyIndex
    LDA.W Hibashi.spawnYPosition,X
    SEC
    SBC.W Hibashi_YOffset_1
    STA.W Enemy[1].YPosition,X
    LDA.W Hibashi_XOffset_1
    STA.W Enemy[1].YHitboxRadius,X
    RTL


;;; $8E41: Instruction - activity frame 2 ;;;
Instruction_Hibashi_ActivityFrame2:
    LDX.W EnemyIndex
    LDA.W Hibashi.spawnYPosition,X
    SEC
    SBC.W Hibashi_YOffset_2
    STA.W Enemy[1].YPosition,X
    LDA.W Hibashi_XOffset_2
    STA.W Enemy[1].YHitboxRadius,X
    RTL


;;; $8E55: Instruction - activity frame 3 ;;;
Instruction_Hibashi_ActivityFrame3:
    LDX.W EnemyIndex
    LDA.W Hibashi.spawnYPosition,X
    SEC
    SBC.W Hibashi_YOffset_3
    STA.W Enemy[1].YPosition,X
    LDA.W Hibashi_XOffset_3
    STA.W Enemy[1].YHitboxRadius,X
    RTL


;;; $8E69: Instruction - activity frame 4 ;;;
Instruction_Hibashi_ActivityFrame4:
    LDX.W EnemyIndex
    LDA.W Hibashi.spawnYPosition,X
    SEC
    SBC.W Hibashi_YOffset_4
    STA.W Enemy[1].YPosition,X
    LDA.W Hibashi_XOffset_4
    STA.W Enemy[1].YHitboxRadius,X
    RTL


;;; $8E7D: Instruction - activity frame 5 ;;;
Instruction_Hibashi_ActivityFrame5:
    LDX.W EnemyIndex
    LDA.W Hibashi.spawnYPosition,X
    SEC
    SBC.W Hibashi_YOffset_5
    STA.W Enemy[1].YPosition,X
    LDA.W Hibashi_XOffset_5
    STA.W Enemy[1].YHitboxRadius,X
    RTL


;;; $8E91: Instruction - activity frame 6 ;;;
Instruction_Hibashi_ActivityFrame6:
    LDX.W EnemyIndex
    LDA.W Hibashi.spawnYPosition,X
    SEC
    SBC.W Hibashi_YOffset_6
    STA.W Enemy[1].YPosition,X
    LDA.W Hibashi_XOffset_6
    STA.W Enemy[1].YHitboxRadius,X
    RTL


;;; $8EA5: Instruction - activity frame 7 ;;;
Instruction_Hibashi_ActivityFrame7:
    LDX.W EnemyIndex
    LDA.W Hibashi.spawnYPosition,X
    SEC
    SBC.W Hibashi_YOffset_7
    STA.W Enemy[1].YPosition,X
    LDA.W Hibashi_XOffset_7
    STA.W Enemy[1].YHitboxRadius,X
    RTL


;;; $8EB9: Instruction - activity frame 8 ;;;
Instruction_Hibashi_ActivityFrame8:
    LDX.W EnemyIndex
    LDA.W Hibashi.spawnYPosition,X
    SEC
    SBC.W Hibashi_YOffset_8
    STA.W Enemy[1].YPosition,X
    LDA.W Hibashi_XOffset_8
    STA.W Enemy[1].YHitboxRadius,X
    RTL


;;; $8ECD: Instruction - activity frame 9 ;;;
Instruction_Hibashi_ActivityFrame9:
    LDX.W EnemyIndex
    LDA.W Hibashi.spawnYPosition,X
    SEC
    SBC.W Hibashi_YOffset_9
    STA.W Enemy[1].YPosition,X
    LDA.W Hibashi_XOffset_9
    STA.W Enemy[1].YHitboxRadius,X
    RTL


;;; $8EE1: Instruction - activity frame Ah ;;;
Instruction_Hibashi_ActivityFrameA:
    LDX.W EnemyIndex
    LDA.W Hibashi.spawnYPosition,X
    SEC
    SBC.W Hibashi_YOffset_A
    STA.W Enemy[1].YPosition,X
    LDA.W Hibashi_XOffset_A
    STA.W Enemy[1].YHitboxRadius,X
    RTL


;;; $8EF5: Instruction - activity frame Bh ;;;
Instruction_Hibashi_ActivityFrameB:
    LDX.W EnemyIndex
    LDA.W Hibashi.spawnYPosition,X
    SEC
    SBC.W Hibashi_YOffset_B
    STA.W Enemy[1].YPosition,X
    LDA.W Hibashi_XOffset_B
    STA.W Enemy[1].YHitboxRadius,X
    RTL


;;; $8F09: Instruction - activity frame Ch ;;;
Instruction_Hibashi_ActivityFrameC:
    LDX.W EnemyIndex
    LDA.W Hibashi.spawnYPosition,X
    SEC
    SBC.W Hibashi_YOffset_C
    STA.W Enemy[1].YPosition,X
    LDA.W Hibashi_XOffset_C
    STA.W Enemy[1].YHitboxRadius,X
    RTL


;;; $8F1D: Instruction - activity frame Dh ;;;
Instruction_Hibashi_ActivityFrameD:
    LDX.W EnemyIndex
    LDA.W Hibashi.spawnYPosition,X
    SEC
    SBC.W Hibashi_YOffset_D
    STA.W Enemy[1].YPosition,X
    LDA.W Hibashi_XOffset_D
    STA.W Enemy[1].YHitboxRadius,X
    RTL


;;; $8F31: Instruction - activity frame Eh ;;;
Instruction_Hibashi_ActivityFrameE:
    LDX.W EnemyIndex
    LDA.W Hibashi.spawnYPosition,X
    SEC
    SBC.W Hibashi_YOffset_E
    STA.W Enemy[1].YPosition,X
    LDA.W Hibashi_XOffset_E
    STA.W Enemy[1].YHitboxRadius,X
    RTL


;;; $8F45: Instruction - activity frame Fh ;;;
Instruction_Hibashi_ActivityFrameF:
    LDX.W EnemyIndex
    LDA.W Hibashi.spawnYPosition,X
    SEC
    SBC.W Hibashi_YOffset_F
    STA.W Enemy[1].YPosition,X
    LDA.W Hibashi_XOffset_F
    STA.W Enemy[1].YHitboxRadius,X
    RTL


;;; $8F59: Instruction - activity frame 10h ;;;
Instruction_Hibashi_ActivityFrame10:
    LDX.W EnemyIndex
    LDA.W Hibashi.spawnYPosition,X
    SEC
    SBC.W Hibashi_YOffset_10
    STA.W Enemy[1].YPosition,X
    LDA.W Hibashi_XOffset_10
    STA.W Enemy[1].YHitboxRadius,X
    RTL


;;; $8F6D: Instruction - activity frame 11h ;;;
Instruction_Hibashi_ActivityFrame11:
    LDX.W EnemyIndex
    LDA.W Hibashi.spawnYPosition,X
    SEC
    SBC.W Hibashi_YOffset_11
    STA.W Enemy[1].YPosition,X
    LDA.W Hibashi_XOffset_11
    STA.W Enemy[1].YHitboxRadius,X
    RTL


;;; $8F81: Instruction - activity frame 12h ;;;
Instruction_Hibashi_ActivityFrame12:
    LDX.W EnemyIndex
    LDA.W Hibashi.spawnYPosition,X
    SEC
    SBC.W Hibashi_YOffset_12
    STA.W Enemy[1].YPosition,X
    LDA.W Hibashi_XOffset_12
    STA.W Enemy[1].YHitboxRadius,X
    RTL


;;; $8F95: Instruction - activity frame 13h ;;;
Instruction_Hibashi_ActivityFrame13:
    LDX.W EnemyIndex
    LDA.W Hibashi.spawnYPosition,X
    SEC
    SBC.W Hibashi_YOffset_13
    STA.W Enemy[1].YPosition,X
    LDA.W Hibashi_XOffset_13
    STA.W Enemy[1].YHitboxRadius,X
    RTL


;;; $8FA9: Instruction - activity frame 14h ;;;
Instruction_Hibashi_ActivityFrame14:
    LDX.W EnemyIndex
    LDA.W Hibashi.spawnYPosition,X
    SEC
    SBC.W Hibashi_YOffset_14
    STA.W Enemy[1].YPosition,X
    LDA.W Hibashi_XOffset_14
    STA.W Enemy[1].YHitboxRadius,X
    RTL


;;; $8FBD: Instruction - activity frame 15h ;;;
Instruction_Hibashi_ActivityFrame15:
    LDX.W EnemyIndex
    LDA.W Hibashi.spawnYPosition,X
    SEC
    SBC.W Hibashi_YOffset_15
    STA.W Enemy[1].YPosition,X
    LDA.W Hibashi_XOffset_15
    STA.W Enemy[1].YHitboxRadius,X
    RTL


;;; $8FD1: Instruction - finish activity ;;;
Instruction_Hibashi_FinishActivity:
    LDX.W EnemyIndex
    LDA.W #$0001
    STA.W Hibashi.finishedActivityFlag,X
    LDA.W #$0000
    STA.W Enemy[1].XHitboxRadius,X
    STA.W Enemy[1].YHitboxRadius,X
    LDA.W Hibashi.spawnYPosition,X
    STA.W Enemy.YPosition,X
    LDA.W Enemy.properties,X
    ORA.W #$0100
    STA.W Enemy.properties,X
    LDA.W Enemy[1].properties,X
    ORA.W #$0400
    STA.W Enemy[1].properties,X
    RTL


;;; $8FFC: Initialisation AI - enemy $E07F (fire pillar) ;;;
InitAI_Hibashi:
    LDX.W EnemyIndex
    LDA.W #InstList_Hibashi_HitboxPart
    STA.W Enemy.instList,X
    LDA.W Hibashi.part,X
    BNE .return
    LDA.W #InstList_Hibashi_GraphicsPart
    STA.W Enemy.instList,X
    LDA.W #Function_Hibashi_Inactive
    STA.W Hibashi.function,X
    LDA.W Enemy.YPosition,X
    STA.W Hibashi.spawnYPosition,X
    LDA.W #$0000
    STA.W Enemy.XHitboxRadius,X

  .return:
    RTL


;;; $9023: Main AI - enemy $E07F (fire pillar) ;;;
MainAI_Hibashi:
    LDX.W EnemyIndex
    LDA.W Hibashi.part,X
    BNE .return
    JSR.W (Hibashi.function,X)

  .return:
    RTL


;;; $902F: Fire pillar function - inactive ;;;
Function_Hibashi_Inactive:
    LDX.W EnemyIndex
    DEC.W Hibashi.inactiveTimer,X
    BPL .return
    LDA.W #Function_Hibashi_Active
    STA.W Hibashi.function,X
    STZ.W Hibashi.finishedActivityFlag,X
    LDA.W #$0001
    STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.W #InstList_Hibashi_GraphicsPart
    STA.W Enemy.instList,X
    LDA.W Enemy.properties,X
    AND.W #$FEFF
    STA.W Enemy.properties,X
    LDA.W Enemy[1].properties,X
    AND.W #$FBFF
    STA.W Enemy[1].properties,X

  .return:
    RTS


;;; $9062: Fire pillar function - active ;;;
Function_Hibashi_Active:
    LDX.W EnemyIndex
    LDA.W Hibashi.finishedActivityFlag,X
    BEQ .return
    LDA.W Hibashi.inactiveTimerResetValue,X
    STA.W Hibashi.inactiveTimer,X
    LDA.W Enemy.properties,X
    ORA.W #$0100
    STA.W Enemy.properties,X
    LDA.W #Function_Hibashi_Inactive
    STA.W Hibashi.function,X

  .return:
    RTS


;;; $9080: RTL ;;;
RTL_A69080:
    RTL


;;; $9081: RTL ;;;
RTL_A69081:
    RTL


;;; $9082: Fire pillar spritemaps ;;;
Spritemap_Hibashi_0:
    dw $0001
    %spritemapEntry(1, $1F9, $F9, 0, 0, 2, 0, $10E)

Spritemap_Hibashi_1:
    dw $0004
    %spritemapEntry(0, $05, $FF, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $1F4, $FF, 0, 1, 2, 0, $134)
    %spritemapEntry(1, $1F9, $F8, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F9, $F2, 0, 0, 2, 0, $100)

Spritemap_Hibashi_2:
    dw $0005
    %spritemapEntry(0, $05, $FF, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $1F4, $FF, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $1F9, $F8, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1F9, $F2, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F9, $EC, 0, 0, 2, 0, $100)

Spritemap_Hibashi_3:
    dw $0006
    %spritemapEntry(1, $1EC, $F7, 0, 1, 2, 0, $128)
    %spritemapEntry(1, $05, $F7, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $1F9, $F8, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1F9, $F0, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1F9, $EA, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F9, $E4, 0, 0, 2, 0, $100)

Spritemap_Hibashi_4:
    dw $0007
    %spritemapEntry(1, $1EC, $F7, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $05, $F7, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $1F9, $F8, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1F9, $F2, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1F9, $EA, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1F9, $E4, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F9, $DE, 0, 0, 2, 0, $100)

Spritemap_Hibashi_5:
    dw $0007
    %spritemapEntry(0, $05, $FF, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $1F4, $FF, 0, 1, 2, 0, $134)
    %spritemapEntry(1, $1F9, $F8, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1F9, $F0, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1F9, $E8, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1F9, $E2, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F9, $DC, 0, 0, 2, 0, $100)

Spritemap_Hibashi_6:
    dw $0007
    %spritemapEntry(0, $05, $FF, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $1F4, $FF, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $1F8, $F8, 1, 1, 2, 0, $106)
    %spritemapEntry(1, $1F9, $EE, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1F9, $E4, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1F9, $DE, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F9, $DA, 0, 0, 2, 0, $100)

Spritemap_Hibashi_7:
    dw $0007
    %spritemapEntry(1, $1EC, $F7, 0, 1, 2, 0, $128)
    %spritemapEntry(1, $05, $F7, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $1F8, $F8, 1, 1, 2, 0, $122)
    %spritemapEntry(1, $1F9, $EC, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1F9, $E2, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1F9, $DC, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F9, $D8, 0, 0, 2, 0, $100)

Spritemap_Hibashi_8:
    dw $0008
    %spritemapEntry(1, $1EC, $F7, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $05, $F7, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $1F9, $F8, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F9, $F0, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1F9, $E4, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1F9, $DA, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1F9, $D4, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F9, $D0, 0, 0, 2, 0, $100)

Spritemap_Hibashi_9:
    dw $0008
    %spritemapEntry(0, $05, $FF, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $1F4, $FF, 0, 1, 2, 0, $134)
    %spritemapEntry(1, $1F9, $F4, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F9, $E6, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1F9, $DA, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1F9, $D0, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1F9, $CA, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F9, $C6, 0, 0, 2, 0, $100)

Spritemap_Hibashi_A:
    dw $0009
    %spritemapEntry(0, $05, $FF, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $1F4, $FF, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $1F9, $F8, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1F9, $EC, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $E0, 1, 1, 2, 0, $106)
    %spritemapEntry(1, $1F9, $D4, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1F9, $CA, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1F9, $C4, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F9, $C0, 0, 0, 2, 0, $100)

Spritemap_Hibashi_B:
    dw $000D
    %spritemapEntry(1, $05, $F7, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $1EC, $F7, 0, 1, 2, 0, $128)
    %spritemapEntry(0, $02, $01, 0, 0, 2, 0, $137)
    %spritemapEntry(0, $1F8, $01, 0, 0, 2, 0, $136)
    %spritemapEntry(0, $02, $F7, 0, 0, 2, 0, $127)
    %spritemapEntry(0, $1F8, $F7, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1F9, $F0, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1F9, $E4, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $D8, 1, 1, 2, 0, $122)
    %spritemapEntry(1, $1F9, $CC, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1F9, $C2, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1F9, $BC, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F9, $B8, 0, 0, 2, 0, $100)

Spritemap_Hibashi_C:
    dw $000E
    %spritemapEntry(1, $05, $F7, 0, 0, 2, 0, $12C)
    %spritemapEntry(1, $1EC, $F7, 0, 1, 2, 0, $12C)
    %spritemapEntry(1, $1F9, $F8, 0, 0, 2, 0, $12E)
    %spritemapEntry(0, $02, $FD, 0, 0, 2, 0, $137)
    %spritemapEntry(0, $1F8, $FD, 0, 0, 2, 0, $136)
    %spritemapEntry(0, $02, $F3, 0, 0, 2, 0, $127)
    %spritemapEntry(0, $1F8, $F3, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1F9, $E8, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1F9, $DC, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F9, $D0, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1F9, $C4, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1F9, $BA, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1F9, $B4, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F9, $B0, 0, 0, 2, 0, $100)

Spritemap_Hibashi_D:
    dw $000E
    %spritemapEntry(1, $09, $F5, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $1E8, $F5, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $1F9, $F8, 0, 0, 2, 0, $12E)
    %spritemapEntry(0, $02, $F9, 0, 0, 2, 0, $137)
    %spritemapEntry(0, $1F8, $F9, 0, 0, 2, 0, $136)
    %spritemapEntry(0, $02, $EF, 0, 0, 2, 0, $127)
    %spritemapEntry(0, $1F8, $EF, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1F9, $E0, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1F9, $D4, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F9, $C8, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1F9, $BC, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1F9, $B2, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1F9, $AC, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F9, $A8, 0, 0, 2, 0, $100)

Spritemap_Hibashi_E:
    dw $000C
    %spritemapEntry(1, $1F9, $F4, 0, 0, 2, 0, $12E)
    %spritemapEntry(0, $02, $F1, 0, 0, 2, 0, $137)
    %spritemapEntry(0, $1F8, $F1, 0, 0, 2, 0, $136)
    %spritemapEntry(0, $02, $E7, 0, 0, 2, 0, $127)
    %spritemapEntry(0, $1F8, $E7, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1F9, $D8, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1F9, $CC, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F9, $C0, 1, 1, 2, 0, $106)
    %spritemapEntry(1, $1F9, $B4, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1F9, $AA, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1F9, $A4, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F9, $A0, 0, 0, 2, 0, $100)

Spritemap_Hibashi_F:
    dw $000E
    %spritemapEntry(0, $05, $FF, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $1F4, $FF, 0, 1, 2, 0, $134)
    %spritemapEntry(1, $1F9, $F0, 0, 0, 2, 0, $12E)
    %spritemapEntry(0, $02, $E9, 0, 0, 2, 0, $137)
    %spritemapEntry(0, $1F8, $E9, 0, 0, 2, 0, $136)
    %spritemapEntry(0, $02, $DF, 0, 0, 2, 0, $127)
    %spritemapEntry(0, $1F8, $DF, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1F9, $D0, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1F9, $C4, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $B8, 1, 1, 2, 0, $122)
    %spritemapEntry(1, $1F9, $AC, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1F9, $A2, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1F9, $9C, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F9, $98, 0, 0, 2, 0, $100)

Spritemap_Hibashi_10:
    dw $000D
    %spritemapEntry(0, $05, $FF, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $1F4, $FF, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $1F9, $DE, 0, 0, 2, 0, $12E)
    %spritemapEntry(0, $02, $D7, 0, 0, 2, 0, $137)
    %spritemapEntry(0, $1F8, $D7, 0, 0, 2, 0, $136)
    %spritemapEntry(0, $02, $CD, 0, 0, 2, 0, $127)
    %spritemapEntry(0, $1F8, $CD, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1F9, $C2, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1F9, $B6, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F9, $AC, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1F9, $A2, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1F9, $9A, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1F9, $96, 0, 0, 2, 0, $100)

Spritemap_Hibashi_11:
    dw $000C
    %spritemapEntry(1, $1F9, $CC, 0, 0, 2, 0, $12E)
    %spritemapEntry(0, $02, $C9, 0, 0, 2, 0, $137)
    %spritemapEntry(0, $1F8, $C9, 0, 0, 2, 0, $136)
    %spritemapEntry(0, $02, $BF, 0, 0, 2, 0, $127)
    %spritemapEntry(0, $1F8, $BF, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1F9, $B4, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1EC, $F7, 0, 1, 2, 0, $128)
    %spritemapEntry(1, $05, $F7, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $1F9, $AA, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F9, $A0, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1F9, $98, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1F8, $9A, 0, 0, 2, 0, $100)

Spritemap_Hibashi_12:
    dw $000B
    %spritemapEntry(1, $1F9, $C0, 0, 0, 2, 0, $12E)
    %spritemapEntry(0, $03, $BD, 0, 0, 2, 0, $137)
    %spritemapEntry(0, $1F9, $BD, 0, 0, 2, 0, $136)
    %spritemapEntry(0, $03, $B3, 0, 0, 2, 0, $127)
    %spritemapEntry(0, $1F9, $B3, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1FA, $AA, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1EC, $F7, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $05, $F7, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $1FA, $A0, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F9, $96, 1, 1, 2, 0, $106)
    %spritemapEntry(1, $1F9, $98, 1, 0, 2, 0, $100)

Spritemap_Hibashi_13:
    dw $0008
    %spritemapEntry(1, $1F9, $B6, 0, 0, 2, 0, $12E)
    %spritemapEntry(0, $02, $B5, 0, 0, 2, 0, $137)
    %spritemapEntry(0, $1F8, $B5, 0, 0, 2, 0, $136)
    %spritemapEntry(0, $02, $AB, 0, 0, 2, 0, $127)
    %spritemapEntry(0, $1F8, $AB, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1F9, $A2, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1F9, $9A, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F9, $9C, 0, 0, 2, 0, $10E)

Spritemap_Hibashi_14:
    dw $0006
    %spritemapEntry(1, $1F9, $AA, 0, 0, 2, 0, $12E)
    %spritemapEntry(0, $02, $AD, 0, 0, 2, 0, $137)
    %spritemapEntry(0, $1F8, $AD, 0, 0, 2, 0, $136)
    %spritemapEntry(0, $02, $A3, 0, 0, 2, 0, $127)
    %spritemapEntry(0, $1F8, $A3, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1F9, $9A, 0, 0, 2, 0, $126)

Spritemap_Hibashi_15:
    dw $0005
    %spritemapEntry(1, $1F9, $A4, 0, 0, 2, 0, $12E)
    %spritemapEntry(0, $02, $A5, 0, 0, 2, 0, $137)
    %spritemapEntry(0, $1F8, $A5, 0, 0, 2, 0, $136)
    %spritemapEntry(0, $02, $9B, 0, 0, 2, 0, $127)
    %spritemapEntry(0, $1F8, $9B, 0, 0, 2, 0, $126)

Spritemap_Hibashi_16:
    dw $0001
    %spritemapEntry(1, $1F9, $9C, 0, 0, 2, 0, $12E)


;;; $9470: Palette - enemy $E0BF (fire arc) ;;;
Palette_Puromi:
    dw $3800,$3E7F,$2DFD,$10FB,$0097,$73FF,$53FF,$37FF
    dw $17FF,$24DF,$189B,$1076,$0C50,$084B,$5EFF,$0880


;;; $9490: Instruction list ;;;
InstList_Puromi:
    dw $0003,Spritemap_Puromi_0
    dw $0003,Spritemap_Puromi_1
    dw $0003,Spritemap_Puromi_4
    dw $0003,Spritemap_Puromi_2
    dw $0003,Spritemap_Puromi_3
    dw $0003,Spritemap_Puromi_5
    dw $0003,Spritemap_Puromi_0
    dw $0003,Spritemap_Puromi_1
    dw $0003,Spritemap_Puromi_6
    dw $0003,Spritemap_Puromi_2
    dw $0003,Spritemap_Puromi_3
    dw $0003,Spritemap_Puromi_7
    dw Instruction_Common_GotoY
    dw InstList_Puromi


;;; $94C4: Initialisation AI - enemy $E0BF (fire arc) ;;;
InitAI_Puromi:
    LDX.W EnemyIndex
    LDA.W #InstList_Puromi
    STA.W Enemy.instList,X
    LDA.W Enemy.init0,X
    AND.W #$00FF
    STA.W Puromi.speedTableIndex,X
    LDA.W Enemy.init0+1,X
    AND.W #$00FF
    STA.W Puromi.arcRadius,X
    LDA.W Enemy.init1,X
    AND.W #$00FF
    STA.W Puromi.direction,X
    LDA.W Enemy.init1+1,X
    AND.W #$00FF
    STA.W Puromi.inactiveTimerResetValue,X
    STA.W Puromi.inactiveTimer,X
    LDA.W #Function_Puromi_Inactive
    STA.W Puromi.function,X
    LDA.W Puromi.direction,X
    ASL
    ASL
    TAY
    LDA.W .startAngle_clockwise,Y
    STA.L Puromi.startAngle,X
    STA.L Puromi.angle,X
    LDA.W .finishAngle_clockwise,Y
    STA.L Puromi.finishAngle,X
    LDA.W .angleBetweenBodyPartsDoubled_clockwise,Y
    STA.L Puromi.angleBetweenBodyPartsTimes2,X
    LDA.W .angleBetweenBodyParts_clockwise,Y
    STA.L Puromi.angleBetweenBodyParts,X
    LDA.W .risingExplosionAngle_clockwise,Y
    STA.L Puromi.risingExplosionAngle,X
    LDA.W .fallingExplosionAngle_clockwise,Y
    STA.L Puromi.fallingExplosionAngle,X
    LDA.W Puromi.speedTableIndex,X
    ASL
    ASL
    ASL
    TAY
    LDA.W Puromi.direction,X
    BNE .firingUp
    INY
    INY
    INY
    INY

  .firingUp:
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,Y
    STA.L Puromi.angleDelta,X
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,Y
    STA.L Puromi.subAngleDelta,X
    LDA.W Enemy.XPosition,X
    STA.L Puromi.arcOriginXPosition,X
    LDA.W Enemy.YPosition,X
    STA.L Puromi.arcOriginYPosition,X
    LDA.W Puromi.arcRadius,X
    STA.W Temp_Unknown0E32
    LDA.L Puromi.startAngle,X
    JSL EightBitCosineMultiplication_A0B0B2
    CLC
    ADC.L Puromi.arcOriginXPosition,X
    STA.L Puromi.bodyPartSpawnXPosition,X
    STA.W Enemy.XPosition,X
    LDA.W Puromi.arcRadius,X
    STA.W Temp_Unknown0E32
    LDA.L Puromi.startAngle,X
    JSL EightBitNegativeSineMultiplication_A0B0C6
    CLC
    ADC.L Puromi.arcOriginYPosition,X
    STA.L Puromi.bodyPartSpawnYPosition,X
    STA.W Enemy.YPosition,X
    LDA.W #$0008
    STA.L Puromi.bodyIndex,X

  .loopEnemyProjectiles:
    LDX.W EnemyIndex
    LDY.W #EnemyProjectile_Puromi
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    LDA.L Puromi.bodyIndex,X
    SEC
    SBC.W #$0002
    STA.L Puromi.bodyIndex,X
    BNE .loopEnemyProjectiles
    LDA.W #$0006
    STA.L Puromi.bodyIndex,X

  .loopSpirteObjects:
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X
    STA.B DP_Temp12
    LDA.W Enemy.YPosition,X
    STA.B DP_Temp14
    LDA.W #$002B
    STA.B DP_Temp16
    LDA.W Enemy.palette,X
    ORA.W Enemy.GFXOffset,X
    STA.L Puromi.graphicsIndices,X
    STA.B DP_Temp18
    JSL Create_Sprite_Object
    PHX
    LDA.L Puromi.bodyIndex,X
    CLC
    ADC.W EnemyIndex
    TAX
    LDA.B DP_Temp12
    STA.L Puromi.spriteObjectIndex0,X
    PLX
    LDA.L Puromi.bodyIndex,X
    SEC
    SBC.W #$0002
    STA.L Puromi.bodyIndex,X
    BNE .loopSpirteObjects
    RTL

;        _____________________ Clockwise
;       |             ________ Anticlockwise
;       |            |
  .startAngle_clockwise:
    dw $0190
  .finishAngle_clockwise:
    dw       $00F0
  .startAngle_antiClockwise:
    dw              $00F0
  .finishAngle_antiClockwise:
    dw                    $0190

  .angleBetweenBodyPartsDoubled_clockwise:
    dw $FFE8
  .angleBetweenBodyParts_clockwise:
    dw       $FFF4
  .angleBetweenBodyPartsDoubled_antiClockwise:
    dw              $0018
  .angleBetweenBodyParts_antiClockwise:
    dw                    $000C

  .risingExplosionAngle_clockwise:
    dw $0180
  .fallingExplosionAngle_clockwise:
    dw       $0100
  .risingExplosionAngle_antiClockwise:
    dw              $0100
  .fallingExplosionAngle_antiClockwise:
    dw                    $0180


;;; $960E: Main AI - enemy $E0BF (fire arc) ;;;
MainAI_Puromi:
    LDX.W EnemyIndex
    JSR.W (Puromi.function,X)
    RTL


;;; $9615: Fire arc function - inactive ;;;
Function_Puromi_Inactive:
    LDX.W EnemyIndex
    DEC.W Puromi.inactiveTimer,X
    BPL .return
    LDA.W Puromi.inactiveTimerResetValue,X
    STA.W Puromi.inactiveTimer,X
    LDA.L Puromi.startAngle,X
    STA.L Puromi.angle,X
    LDA.W #Function_Puromi_Active
    STA.W Puromi.function,X
    LDA.W #$0000
    STA.L Puromi.headExplosionReason,X
    STA.L Puromi.projectile0ExplosionReason,X
    STA.L Puromi.projectile1ExplosionReason,X
    STA.L Puromi.projectile2ExplosionReason,X
    STA.L Puromi.projectile3ExplosionReason,X
    STA.L Puromi.projectile4ExplosionReason,X
    STA.L ExtraEnemy7800+$1A,X
    STA.L ExtraEnemy7800+$1C,X
    STA.L ExtraEnemy7800+$1E,X
    STA.L Puromi.spriteObject0ExplosionReason,X
    STA.L Puromi.spriteObject1ExplosionReason,X
    STA.L Puromi.spriteObject2ExplosionReason,X
    STA.L Puromi.spriteObject3ExplosionReason,X
    STA.L ExtraEnemy7800+$38,X
    STA.L ExtraEnemy7800+$3A,X
    STA.L ExtraEnemy7800+$3C,X
    STA.L ExtraEnemy7800+$3E,X
    LDA.W Enemy.properties,X
    ORA.W #$0800
    STA.W Enemy.properties,X

  .return:
    RTS


;;; $9682: Fire arc function - active ;;;
Function_Puromi_Active:
    LDX.W EnemyIndex
    LDA.W Puromi.arcRadius,X
    STA.W Temp_Unknown0E32
    LDA.L Puromi.angle,X
    JSR CheckExplosionCondition
    STA.B DP_Temp1E
    PHA
    CMP.L Puromi.headExplosionReason,X
    BEQ .matchingExplosionReason
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X
    STA.B DP_Temp12
    LDA.W Enemy.YPosition,X
    STA.B DP_Temp14
    LDA.W #$002E
    STA.B DP_Temp16
    LDA.L Puromi.graphicsIndices,X
    STA.B DP_Temp18
    JSL Create_Sprite_Object
    LDA.W Enemy.XPosition,X
    STA.B DP_Temp12
    LDA.W Enemy.YPosition,X
    STA.B DP_Temp14
    LDA.B DP_Temp1A
    CLC
    ADC.W #$002C
    STA.B DP_Temp16
    LDA.L Puromi.graphicsIndices,X
    STA.B DP_Temp18
    JSL Create_Sprite_Object
    JSR PlayPuromiExplosionSFX

  .matchingExplosionReason:
    PLA
    STA.L Puromi.headExplosionReason,X
    LDA.L Puromi.angle,X
    JSR ClampAngle_CheckInactivityCondition
    JSL EightBitCosineMultiplication_A0B0B2
    CLC
    ADC.L Puromi.arcOriginXPosition,X
    STA.W Enemy.XPosition,X
    LDA.L Puromi.angle,X
    JSR ClampAngle_CheckInactivityCondition
    JSL EightBitNegativeSineMultiplication_A0B0C6
    CLC
    ADC.L Puromi.arcOriginYPosition,X
    STA.W Enemy.YPosition,X
    JSR HandlePuromiProjectiles
    JSR HandlePuromiSpriteObjects
    CLC
    LDA.L Puromi.subAngle,X
    ADC.L Puromi.subAngleDelta,X
    STA.L Puromi.subAngle,X
    LDA.L Puromi.angle,X
    ADC.L Puromi.angleDelta,X
    STA.L Puromi.angle,X
    RTS


;;; $9721: Handle fire arc enemy projectiles ;;;
HandlePuromiProjectiles:
    LDX.W EnemyIndex
    LDA.W #$0008
    STA.L Puromi.bodyIndex,X
    LDA.L Puromi.angle,X
    CLC
    ADC.L Puromi.angleBetweenBodyParts,X
    STA.B DP_Temp24

  .loop:
    LDX.W EnemyIndex
    LDA.B DP_Temp24
    SEC
    SBC.L Puromi.angleBetweenBodyPartsTimes2,X
    STA.B DP_Temp24
    PHX
    LDA.L Puromi.bodyIndex,X
    CLC
    ADC.W EnemyIndex
    TAX
    LDA.L Puromi.projectileIndex0,X
    TAY
    LDA.B DP_Temp24
    JSR CheckExplosionCondition
    STA.B DP_Temp1E
    PHA
    CMP.L Puromi.projectile0ExplosionReason,X
    BEQ .matchingExplosionReason
    PHX
    LDX.W EnemyIndex
    LDA.W EnemyProjectile_XPositions,Y
    STA.B DP_Temp12
    LDA.W EnemyProjectile_YPositions,Y
    STA.B DP_Temp14
    LDA.W #$002E
    STA.B DP_Temp16
    LDA.L Puromi.graphicsIndices,X
    STA.B DP_Temp18
    JSL Create_Sprite_Object
    LDA.W EnemyProjectile_XPositions,Y
    STA.B DP_Temp12
    LDA.W EnemyProjectile_YPositions,Y
    STA.B DP_Temp14
    LDA.B DP_Temp1A
    CLC
    ADC.W #$002C
    STA.B DP_Temp16
    LDA.L Puromi.graphicsIndices,X
    STA.B DP_Temp18
    JSL Create_Sprite_Object
    JSR PlayPuromiExplosionSFX
    PLX

  .matchingExplosionReason:
    PLA
    STA.L Puromi.projectile0ExplosionReason,X
    PLX
    LDA.B DP_Temp24
    JSR ClampAngle_CheckInactivityCondition
    JSL EightBitCosineMultiplication_A0B0B2
    CLC
    ADC.L Puromi.arcOriginXPosition,X
    STA.W EnemyProjectile_XPositions,Y
    LDA.B DP_Temp24
    JSR ClampAngle_CheckInactivityCondition
    JSL EightBitNegativeSineMultiplication_A0B0C6
    CLC
    ADC.L Puromi.arcOriginYPosition,X
    STA.W EnemyProjectile_YPositions,Y
    LDA.L Puromi.bodyIndex,X
    SEC
    SBC.W #$0002
    STA.L Puromi.bodyIndex,X
    BEQ +
    JMP .loop

+   LDA.B DP_Temp1C
    BEQ .return
    LDA.W #Function_Puromi_Inactive
    STA.W Puromi.function,X
    LDA.W Enemy.properties,X
    AND.W #$F7FF
    STA.W Enemy.properties,X

  .return:
    RTS


;;; $97E9: Handle fire arc sprite objects ;;;
HandlePuromiSpriteObjects:
    LDX.W EnemyIndex
    LDA.W #$0006
    STA.L Puromi.bodyIndex,X
    LDA.L Puromi.angle,X
    STA.B DP_Temp24

  .loop:
    LDX.W EnemyIndex
    LDA.B DP_Temp24
    SEC
    SBC.L Puromi.angleBetweenBodyPartsTimes2,X
    STA.B DP_Temp24
    PHX
    LDA.L Puromi.bodyIndex,X
    CLC
    ADC.W EnemyIndex
    TAX
    LDA.L Puromi.spriteObjectIndex0,X
    TAY
    LDA.B DP_Temp24
    JSR CheckExplosionCondition
    STA.B DP_Temp1E
    PHA
    CMP.L Puromi.spriteObject0ExplosionReason,X
    BEQ .matchingExplosionReason
    PHX
    LDX.W EnemyIndex
    LDA.L Puromi.graphicsIndices,X
    STA.B DP_Temp26
    TYX
    LDA.L SpriteObjects_XPositions,X
    STA.B DP_Temp12
    LDA.L SpriteObjects_YPositions,X
    STA.B DP_Temp14
    LDA.W #$002E
    STA.B DP_Temp16
    LDA.B DP_Temp26
    STA.B DP_Temp18
    JSL Create_Sprite_Object
    LDA.L SpriteObjects_XPositions,X
    STA.B DP_Temp12
    LDA.L SpriteObjects_YPositions,X
    STA.B DP_Temp14
    LDA.W #$002C
    CLC
    ADC.B DP_Temp1A
    STA.B DP_Temp16
    LDA.B DP_Temp26
    STA.B DP_Temp18
    JSL Create_Sprite_Object
    JSR PlayPuromiExplosionSFX
    PLX

  .matchingExplosionReason:
    PLA
    STA.L Puromi.spriteObject0ExplosionReason,X
    PLX
    LDA.B DP_Temp24
    JSR ClampAngle_CheckInactivityCondition
    JSL EightBitCosineMultiplication_A0B0B2
    CLC
    ADC.L Puromi.arcOriginXPosition,X
    STA.B DP_Temp20
    LDA.B DP_Temp24
    JSR ClampAngle_CheckInactivityCondition
    JSL EightBitNegativeSineMultiplication_A0B0C6
    CLC
    ADC.L Puromi.arcOriginYPosition,X
    STA.B DP_Temp22
    PHX
    TYX
    LDA.B DP_Temp20
    STA.L SpriteObjects_XPositions,X
    LDA.B DP_Temp22
    STA.L SpriteObjects_YPositions,X
    PLX
    LDA.L Puromi.bodyIndex,X
    SEC
    SBC.W #$0002
    STA.L Puromi.bodyIndex,X
    BEQ .return
    JMP .loop

  .return:
    RTS


;;; $98AD: Clamp angle and check inactivity condition ;;;
ClampAngle_CheckInactivityCondition:
;; Parameters:
;;     A: Angle
;; Returns:
;;     A: Clamped angle
;;     $1C: Inactivity flag. Matters only for the last body enemy projectile. 0 = activity, 1 = inactivity
    PHX
    PHA
    LDX.W EnemyIndex
    STZ.B DP_Temp1C
    LDA.W Puromi.direction,X
    BNE .notClockwise
    PLA
    CMP.L Puromi.finishAngle,X
    BMI .afterFinish
    CMP.L Puromi.startAngle,X
    BPL .beforeStart
    BRA .return

  .notClockwise:
    PLA
    CMP.L Puromi.finishAngle,X
    BPL .afterFinish
    CMP.L Puromi.startAngle,X
    BMI .beforeStart
    BRA .return

  .afterFinish:
    INC.B DP_Temp1C
    LDA.L Puromi.finishAngle,X
    BRA .return

  .beforeStart:
    LDA.L Puromi.startAngle,X
    BRA .return

  .return:
    PLX
    RTS


;;; $98E7: Check explosion condition ;;;
CheckExplosionCondition:
;; Parameters:
;;     A: Angle
;; Returns:
;;     A: Explosion reason. 0 = no explosion, 1 = rising, 2 = falling
;;     $1A: If returning [A] != 0, explosion side. 0 = right, 1 = left
    PHX
    PHA
    LDX.W EnemyIndex
    LDA.W Puromi.direction,X
    BNE .notClockwise
    PLA
    CMP.L Puromi.fallingExplosionAngle,X
    BMI .clockwiseFalling
    CMP.L Puromi.risingExplosionAngle,X
    BMI .clockwiseRising
    LDA.W #$0000
    BRA .return

  .notClockwise:
    PLA
    CMP.L Puromi.fallingExplosionAngle,X
    BPL .antiClockwiseFalling
    CMP.L Puromi.risingExplosionAngle,X
    BPL .antiClockwiseRising
    LDA.W #$0000
    BRA .return

  .clockwiseRising:
    LDA.W #$0001
    STA.B DP_Temp1A
    LDA.W #$0001
    BRA .return

  .clockwiseFalling:
    LDA.W #$0000
    STA.B DP_Temp1A
    LDA.W #$0002
    BRA .return

  .antiClockwiseRising:
    LDA.W #$0000
    STA.B DP_Temp1A
    LDA.W #$0001
    BRA .return

  .antiClockwiseFalling:
    LDA.W #$0001
    STA.B DP_Temp1A
    LDA.W #$0002
    BRA .return

  .return:
    PLX
    RTS


;;; $993F: Play fire arc explosion sound effect ;;;
PlayPuromiExplosionSFX:
;; Parameters:
;;     $1E: Explosion reason. 0 = no explosion, 1 = rising, 2 = falling
    PHY
    PHX
    LDA.B DP_Temp1E
    CMP.W #$0002
    BEQ .return
    LDA.W #$005E
    JSL QueueSound_Lib2_Max6

  .return:
    PLX
    PLY
    RTS


;;; $9952: RTL ;;;
RTL_A69952:
    RTL


;;; $9953: RTL ;;;
RTL_A69953:
    RTL


;;; $9954: Fire arc spritemaps ;;;
Spritemap_Puromi_0:
    dw $0001
    %spritemapEntry(1, $1F9, $F8, 0, 0, 2, 1, $10A)

Spritemap_Puromi_1:
    dw $0001
    %spritemapEntry(1, $1F9, $F8, 0, 0, 2, 1, $108)

Spritemap_Puromi_2:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 1, 1, 2, 1, $10A)

Spritemap_Puromi_3:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 1, 1, 2, 1, $108)

Spritemap_Puromi_4:
    dw $0001
    %spritemapEntry(1, $1F9, $F8, 0, 0, 2, 1, $106)

Spritemap_Puromi_5:
    dw $0001
    %spritemapEntry(1, $1F9, $F8, 0, 0, 2, 1, $122)

Spritemap_Puromi_6:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 1, 1, 2, 1, $106)

Spritemap_Puromi_7:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 1, 1, 2, 1, $122)


;;; $998C: Palette - enemy $E0FF (fake Kraid) ;;;
Palette_MiniKraid:
    dw $3800,$559D,$1816,$100D,$4B9F,$3F37,$36D0,$2E69
    dw $2608,$1DA6,$1125,$08C5,$0003,$094E,$1656,$0000


;;; $99AC: Instruction list - choose action ;;;
InstList_MiniKraid_ChooseAction:
    dw Instruction_MiniKraid_ChooseAction


;;; $99AE: Instruction list - step forwards - facing left ;;;
InstList_MiniKraid_StepForwards_FacingLeft:
    dw $0010,Spritemap_MiniKraid_Stepping_FacingLeft_0
    dw $000C,Spritemap_MiniKraid_Stepping_FacingLeft_1
    dw $0008,Spritemap_MiniKraid_Stepping_FacingLeft_2
    dw $000C,Spritemap_MiniKraid_Stepping_FacingLeft_3
    dw Instruction_MiniKraid_Move
    dw Instruction_Common_GotoY
    dw InstList_MiniKraid_ChooseAction


;;; $99C4: Instruction list - choose action ;;;
InstList_MiniKraid_ChooseAction_duplicate:
    dw Instruction_MiniKraid_ChooseAction


;;; $99C6: Instruction list - step backwards - facing left ;;;
InstList_MiniKraid_StepBackwards_FacingLeft:
    dw $0010,Spritemap_MiniKraid_Stepping_FacingLeft_0
    dw Instruction_MiniKraid_Move
    dw $000C,Spritemap_MiniKraid_Stepping_FacingLeft_3
    dw $0008,Spritemap_MiniKraid_Stepping_FacingLeft_2
    dw $000C,Spritemap_MiniKraid_Stepping_FacingLeft_1
    dw Instruction_Common_GotoY
    dw InstList_MiniKraid_ChooseAction_duplicate


;;; $99DC: Instruction list - fire spit - facing left ;;;
InstList_MiniKraid_FireSpit_FacingLeft:
    dw $0010,Spritemap_MiniKraid_FiringSpit_FacingLeft_0
    dw Instruction_MiniKraid_PlayCrySFX
    dw $0008,Spritemap_MiniKraid_FiringSpit_FacingLeft_1
    dw Instruction_MiniKraid_FireSpitLeft
    dw $0010,Spritemap_MiniKraid_FiringSpit_FacingLeft_2
    dw $0008,Spritemap_MiniKraid_FiringSpit_FacingLeft_1
    dw Instruction_Common_GotoY
    dw InstList_MiniKraid_ChooseAction


if !FEATURE_KEEP_UNREFERENCED
;;; $99F4: Unused. Instruction list - standing - facing left ;;;
UNUSED_InstList_MiniKraid_Standing_FacingLeft_A699F4:
    dw $7FFF,Spritemap_MiniKraid_FiringSpit_FacingLeft_0
    dw Instruction_Common_Sleep
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $99FA: Instruction list - choose action ;;;
InstList_MiniKraid_ChooseAction_duplicate_again2:
    dw Instruction_MiniKraid_ChooseAction


;;; $99FC: Instruction list - step forwards - facing right ;;;
InstList_MiniKraid_StepForwards_FacingRight:
    dw $0010,Spritemap_MiniKraid_Stepping_FacingRight_0
    dw $000C,Spritemap_MiniKraid_Stepping_FacingRight_1
    dw $0008,Spritemap_MiniKraid_Stepping_FacingRight_2
    dw $000C,Spritemap_MiniKraid_Stepping_FacingRight_3
    dw Instruction_MiniKraid_Move
    dw Instruction_Common_GotoY
    dw InstList_MiniKraid_ChooseAction_duplicate_again2


;;; $9A12: Instruction list - choose action ;;;
InstList_MiniKraid_ChooseAction_duplicate_again3:
    dw Instruction_MiniKraid_ChooseAction


;;; $9A14: Instruction list - step backwards - facing right ;;;
InstList_MiniKraid_StepBackwards_FacingRight:
    dw $0010,Spritemap_MiniKraid_Stepping_FacingRight_0
    dw Instruction_MiniKraid_Move
    dw $000C,Spritemap_MiniKraid_Stepping_FacingRight_3
    dw $0008,Spritemap_MiniKraid_Stepping_FacingRight_2
    dw $000C,Spritemap_MiniKraid_Stepping_FacingRight_1
    dw Instruction_Common_GotoY
    dw InstList_MiniKraid_ChooseAction_duplicate_again3


;;; $9A2A: Instruction list - fire spit - facing right ;;;
InstList_MiniKraid_FireSpit_FacingRight:
    dw $0010,Spritemap_MiniKraid_FiringSpit_FacingRight_0
    dw Instruction_MiniKraid_PlayCrySFX
    dw $0008,Spritemap_MiniKraid_FiringSpit_FacingRight_1
    dw Instruction_MiniKraid_FireSpitRight
    dw $0010,Spritemap_MiniKraid_FiringSpit_FacingRight_2
    dw $0008,Spritemap_MiniKraid_FiringSpit_FacingRight_1
    dw Instruction_Common_GotoY
    dw InstList_MiniKraid_ChooseAction_duplicate_again2


if !FEATURE_KEEP_UNREFERENCED
;;; $9A42: Unused. Instruction list - standing - facing right ;;;
UNUSED_InstList_MiniKraid_Standing_FacingRight_A69A42:
    dw $7FFF,Spritemap_MiniKraid_FiringSpit_FacingRight_0
    dw Instruction_Common_Sleep
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $9A48: Fake Kraid spit velocity table ;;;
MiniKraidSpitVelocityTable_leftward_X1:
    dw $FE00
MiniKraidSpitVelocityTable_leftward_Y1:
    dw       $FB00
MiniKraidSpitVelocityTable_leftward_X2:
    dw              $FC00
MiniKraidSpitVelocityTable_leftward_Y2:
    dw                    $FB00

MiniKraidSpitVelocityTable_rightward_X1:
    dw $0200
MiniKraidSpitVelocityTable_rightward_Y1:
    dw       $FB00
MiniKraidSpitVelocityTable_rightward_X2:
    dw              $0400
MiniKraidSpitVelocityTable_rightward_Y2:
    dw                    $FB00


;;; $9A58: Initialisation AI - enemy $E0FF (fake Kraid) ;;;
InitAI_MiniKraid:
    LDX.W EnemyIndex
    LDA.W RandomNumberSeed
    AND.W #$0003
    CLC
    ADC.W #$0002
    STA.W MiniKraid.stepCounter,X
    STA.W MiniKraid.spitTimer,X
    CLC
    ADC.W #$0040
    STA.L MiniKraid.topSpikeTimer,X
    CLC
    ADC.W #$0020
    STA.L MiniKraid.middleSpikeTimer,X
    CLC
    ADC.W #$FFD0
    STA.L MiniKraid.bottomSpikeTimer,X
    LDA.W #$0000
    STA.L MiniKraid.spikeTimerIndex,X
    LDA.W Enemy.properties,X
    ORA.W #$2000
    STA.W Enemy.properties,X
    LDA.W #$0001
    STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.W #$FFFC
    STA.W MiniKraid.XVelocity,X
    STA.W MiniKraid.direction,X
    LDY.W #InstList_MiniKraid_StepForwards_FacingLeft
    LDA.W Enemy.XPosition,X
    SEC
    SBC.W SamusXPosition
    BPL .keepLeft
    LDA.W #$0004
    STA.W MiniKraid.XVelocity,X
    STA.W MiniKraid.direction,X
    LDY.W #InstList_MiniKraid_StepForwards_FacingRight

  .keepLeft:
    TYA
    STA.W Enemy.instList,X
    RTL


;;; $9AC2: Main AI - enemy $E0FF (fake Kraid) ;;;
MainAI_MiniKraid:
    LDX.W EnemyIndex
    LDA.L MiniKraid.spikeTimerIndex,X
    TAY
    INC
    INC
    CMP.W #$0006
    BMI +
    LDA.W #$0000

+   STA.L MiniKraid.spikeTimerIndex,X
    JSR HandleMiniKraidSpike
    RTL


;;; $9ADC: Handle fake Kraid spike ;;;
HandleMiniKraidSpike:
;; Parameters:
;;     Y: Spike timer index

; Typo at $9B18 >_<;
; LDA $00FFFF will load the low byte from $80:FFFF (85h) and the high byte from $7E:0000 (garbage)
; There's no reason to do this `AND` at all, the zero flag is set appropriately by the call to $A0:AD70
; But because the return value in A is 0 or 1, and because bit 0 of [$80:FFFF] is set, this code happens to work out fine
    PHX
    TYA
    STX.B DP_Temp12
    CLC
    ADC.B DP_Temp12
    TAX
    LDA.L MiniKraid.topSpikeTimer,X
    BEQ .timerExpired
    DEC
    STA.L MiniKraid.topSpikeTimer,X
    PLX
    RTS

  .timerExpired:
    LDA.W RandomNumberSeed
    AND.W #$003F
    CLC
    ADC.W #$0010
    STA.L MiniKraid.topSpikeTimer,X
    TYA
    PLX
    STA.L MiniKraid.spikeIndex,X
    LDY.W #EnemyProjectile_MiniKraidSpikes_Left
    LDA.W MiniKraid.direction,X
    BMI .keepLeft
    LDY.W #EnemyProjectile_MiniKraidSpikes_Right

  .keepLeft:
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    JSL CheckIfEnemyCenterIsOnScreen
    AND.L $00FFFF                                                        ; >.<
    BNE .return
    LDA.W #$003F
    JSL QueueSound_Lib2_Max6

  .return:
    RTS


;;; $9B26: Instruction - move ;;;
Instruction_MiniKraid_Move:
    PHY
    LDX.W EnemyIndex
    LDA.W MiniKraid.spitTimer,X
    BEQ +
    DEC.W MiniKraid.spitTimer,X

+   DEC.W MiniKraid.stepCounter,X
    BNE .nonZeroCounter
    LDA.W RandomNumberSeed
    AND.W #$0003
    CLC
    ADC.W #$0007
    STA.W MiniKraid.stepCounter,X
    BRA .negateEnemyXVelocity

  .nonZeroCounter:
    LDA.W MiniKraid.XVelocity,X
    STA.B DP_Temp14
    STZ.B DP_Temp12
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCC .noCollision

  .negateEnemyXVelocity:
    LDA.W MiniKraid.XVelocity,X
    EOR.W #$FFFF
    INC
    STA.W MiniKraid.XVelocity,X

  .noCollision:
    LDA.W #$FFFC
    STA.W MiniKraid.direction,X
    LDA.W Enemy.XPosition,X
    SEC
    SBC.W SamusXPosition
    BPL .return
    LDA.W #$0004
    STA.W MiniKraid.direction,X

  .return:
    PLY
    RTL


;;; $9B74: Instruction - choose action ;;;
Instruction_MiniKraid_ChooseAction:
    LDX.W EnemyIndex
    LDA.W MiniKraid.spitTimer,X
    BNE .step
    LDA.W RandomNumberSeed
    AND.W #$0003
    CLC
    ADC.W #$0003
    STA.W MiniKraid.spitTimer,X
    LDY.W #InstList_MiniKraid_FireSpit_FacingRight
    LDA.W MiniKraid.direction,X
    BPL .return
    LDY.W #InstList_MiniKraid_FireSpit_FacingLeft
    RTL

  .step:
    LDA.W MiniKraid.direction,X
    BMI .left
    LDY.W #InstList_MiniKraid_StepForwards_FacingRight
    LDA.W MiniKraid.XVelocity,X
    BPL .return
    LDY.W #InstList_MiniKraid_StepBackwards_FacingRight

  .return:
    RTL

  .left:
    LDY.W #InstList_MiniKraid_StepForwards_FacingLeft
    LDA.W MiniKraid.XVelocity,X
    BMI .return
    LDY.W #InstList_MiniKraid_StepBackwards_FacingLeft
    RTL


;;; $9BB2: Instruction - play fake Kraid cry ;;;
Instruction_MiniKraid_PlayCrySFX:
; Another AND instruction typo (see HandleMiniKraidSpike)
    JSL CheckIfEnemyCenterIsOnScreen
    AND.L $00FFFF                                                        ; >.<
    BNE .return
    LDA.W #$0016
    JSL QueueSound_Lib2_Max6

  .return:
    RTL


;;; $9BC4: Instruction - fire spit left ;;;
Instruction_MiniKraid_FireSpitLeft:
    PHY
    LDY.W #$0000
    LDA.W #$FFFC                                                         ; fallthrough to FireMiniKraidSpit_Common


;;; $9BCB: Fire fake Kraid spit ;;;
FireMiniKraidSpit_Common:
;; Parameters:
;;     A: Spit X offset
;;     Y: Spit velocity table index
    LDX.W EnemyIndex
    PHY
    PHX
    STA.L MiniKraid.spitXOffset,X
    LDA.W MiniKraidSpitVelocityTable_leftward_X1,Y
    STA.L MiniKraid.spitXVelocity,X
    LDA.W MiniKraidSpitVelocityTable_leftward_Y1,Y
    STA.L MiniKraid.spitYVelocity,X
    LDY.W #EnemyProjectile_MiniKraidSpit
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    PLX
    PLY
    LDA.W MiniKraidSpitVelocityTable_leftward_X2,Y
    STA.L MiniKraid.spitXVelocity,X
    LDA.W MiniKraidSpitVelocityTable_leftward_Y2,Y
    STA.L MiniKraid.spitYVelocity,X
    LDY.W #EnemyProjectile_MiniKraidSpit
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    PLY
    RTL


;;; $9C02: Instruction - fire spit right ;;;
Instruction_MiniKraid_FireSpitRight:
    PHY
    LDY.W #$0008
    LDA.W #$0004
    BRA FireMiniKraidSpit_Common


if !FEATURE_KEEP_UNREFERENCED
;;; $9C0B: Unused. Fake Kraid power bomb reaction ;;;
UNUSED_PowerBombReaction_MiniKraid_A69C0B:
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X
    STA.L EnemyProjectileData_SpecialDeathItemDropXOriginPosition
    LDA.W Enemy.YPosition,X
    STA.L EnemyProjectileData_SpecialDeathItemDropYOriginPosition
    JSL NormalEnemyPowerBombAI_NoDeathCheck_External
    BRA Reaction_MiniKraid_Common
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $9C22: Enemy touch - enemy $E0FF (fake Kraid) ;;;
EnemyTouch_MiniKraid:
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X
    STA.L EnemyProjectileData_SpecialDeathItemDropXOriginPosition
    LDA.W Enemy.YPosition,X
    STA.L EnemyProjectileData_SpecialDeathItemDropYOriginPosition
    JSL NormalEnemyTouchAI_NoDeathCheck_External
    BRA Reaction_MiniKraid_Common


;;; $9C39: Power bomb reaction / enemy shot - enemy $E0FF (fake Kraid) ;;;
EnemyShot_PowerBombReaction_MiniKraid:
; Bug: the power bomb reaction should be pointing to UNUSED_PowerBombReaction_MiniKraid_A69C0B
; When this routine is called for power bomb reaction, $A0:A6A7 is called with garbage for the projectile index ($18A6)
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X
    STA.L EnemyProjectileData_SpecialDeathItemDropXOriginPosition
    LDA.W Enemy.YPosition,X
    STA.L EnemyProjectileData_SpecialDeathItemDropYOriginPosition
    JSL NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External
    BRA Reaction_MiniKraid_Common                                        ; >.<


;;; $9C50: Fake Kraid reaction ;;;
Reaction_MiniKraid_Common:
    LDX.W EnemyIndex
    LDA.W Enemy.health,X
    BNE .return
    LDA.W #$0003
    JSL EnemyDeath
    JSL MiniKraidDeathItemDropRoutine

  .return:
    RTL


;;; $9C64: Fake Kraid spritemaps ;;;
Spritemap_MiniKraid_Stepping_FacingLeft_0:
    dw $0010
    %spritemapEntry(0, $1E2, $17, 0, 0, 2, 0, $125)
    %spritemapEntry(1, $1EA, $0F, 0, 0, 2, 0, $116)
    %spritemapEntry(1, $1EA, $07, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1FB, $0F, 0, 0, 2, 0, $163)
    %spritemapEntry(1, $01, $0F, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $0D, $17, 0, 0, 2, 0, $120)
    %spritemapEntry(0, $1E8, $F2, 0, 0, 2, 0, $11E)
    %spritemapEntry(0, $14, $15, 0, 0, 2, 0, $130)
    %spritemapEntry(1, $1F0, $DF, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F8, $DF, 0, 0, 2, 0, $103)
    %spritemapEntry(1, $1F8, $EF, 0, 0, 2, 0, $123)
    %spritemapEntry(1, $1E8, $EF, 0, 0, 2, 0, $121)
    %spritemapEntry(1, $1F3, $0F, 0, 0, 2, 0, $162)
    %spritemapEntry(1, $1E3, $0F, 0, 0, 2, 0, $160)
    %spritemapEntry(1, $1F3, $FF, 0, 0, 2, 0, $142)
    %spritemapEntry(1, $1E3, $FF, 0, 0, 2, 0, $140)

Spritemap_MiniKraid_Stepping_FacingLeft_1:
    dw $0010
    %spritemapEntry(1, $1EA, $0F, 0, 0, 2, 0, $119)
    %spritemapEntry(1, $1EA, $07, 0, 0, 2, 0, $109)
    %spritemapEntry(0, $1E4, $17, 0, 0, 2, 0, $125)
    %spritemapEntry(1, $1FB, $0E, 0, 0, 2, 0, $163)
    %spritemapEntry(1, $02, $0D, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $0D, $15, 0, 0, 2, 0, $120)
    %spritemapEntry(0, $1E8, $F1, 0, 0, 2, 0, $11E)
    %spritemapEntry(0, $13, $17, 0, 0, 2, 0, $130)
    %spritemapEntry(1, $1F0, $DE, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F8, $DE, 0, 0, 2, 0, $103)
    %spritemapEntry(1, $1F8, $EE, 0, 0, 2, 0, $123)
    %spritemapEntry(1, $1E8, $EE, 0, 0, 2, 0, $121)
    %spritemapEntry(1, $1F3, $0E, 0, 0, 2, 0, $162)
    %spritemapEntry(1, $1E3, $0E, 0, 0, 2, 0, $160)
    %spritemapEntry(1, $1F3, $FE, 0, 0, 2, 0, $142)
    %spritemapEntry(1, $1E3, $FE, 0, 0, 2, 0, $140)

Spritemap_MiniKraid_Stepping_FacingLeft_2:
    dw $0010
    %spritemapEntry(0, $1E1, $14, 0, 0, 2, 0, $12B)
    %spritemapEntry(1, $1E9, $0C, 0, 0, 2, 0, $11C)
    %spritemapEntry(1, $1E9, $04, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1FB, $0D, 0, 0, 2, 0, $163)
    %spritemapEntry(1, $01, $0F, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $0D, $15, 0, 0, 2, 0, $120)
    %spritemapEntry(0, $1E8, $F0, 0, 0, 2, 0, $11E)
    %spritemapEntry(0, $14, $14, 0, 0, 2, 0, $130)
    %spritemapEntry(1, $1F0, $DD, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F8, $DD, 0, 0, 2, 0, $103)
    %spritemapEntry(1, $1F8, $ED, 0, 0, 2, 0, $123)
    %spritemapEntry(1, $1E8, $ED, 0, 0, 2, 0, $121)
    %spritemapEntry(1, $1F3, $0D, 0, 0, 2, 0, $162)
    %spritemapEntry(1, $1E3, $0D, 0, 0, 2, 0, $160)
    %spritemapEntry(1, $1F3, $FD, 0, 0, 2, 0, $142)
    %spritemapEntry(1, $1E3, $FD, 0, 0, 2, 0, $140)

Spritemap_MiniKraid_Stepping_FacingLeft_3:
    dw $0010
    %spritemapEntry(0, $1DA, $17, 0, 0, 2, 0, $154)
    %spritemapEntry(1, $1E2, $0F, 0, 0, 2, 0, $145)
    %spritemapEntry(1, $1EA, $07, 0, 0, 2, 0, $136)
    %spritemapEntry(1, $1FB, $0D, 0, 0, 2, 0, $163)
    %spritemapEntry(1, $02, $10, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $0D, $12, 0, 0, 2, 0, $120)
    %spritemapEntry(0, $1E8, $F0, 0, 0, 2, 0, $11E)
    %spritemapEntry(0, $13, $0F, 0, 0, 2, 0, $130)
    %spritemapEntry(1, $1F0, $DD, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F8, $DD, 0, 0, 2, 0, $103)
    %spritemapEntry(1, $1F8, $ED, 0, 0, 2, 0, $123)
    %spritemapEntry(1, $1E8, $ED, 0, 0, 2, 0, $121)
    %spritemapEntry(1, $1F3, $0D, 0, 0, 2, 0, $162)
    %spritemapEntry(1, $1E3, $0D, 0, 0, 2, 0, $160)
    %spritemapEntry(1, $1F3, $FD, 0, 0, 2, 0, $142)
    %spritemapEntry(1, $1E3, $FD, 0, 0, 2, 0, $140)

Spritemap_MiniKraid_FiringSpit_FacingLeft_0:
    dw $0010
    %spritemapEntry(0, $1E8, $F2, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1E2, $17, 0, 0, 2, 0, $125)
    %spritemapEntry(1, $1EA, $0F, 0, 0, 2, 0, $116)
    %spritemapEntry(1, $1EA, $07, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1FB, $0F, 0, 0, 2, 0, $163)
    %spritemapEntry(1, $02, $12, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $0F, $17, 0, 0, 2, 0, $120)
    %spritemapEntry(0, $16, $18, 0, 0, 2, 0, $130)
    %spritemapEntry(1, $1F0, $DF, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F8, $DF, 0, 0, 2, 0, $103)
    %spritemapEntry(1, $1F8, $EF, 0, 0, 2, 0, $123)
    %spritemapEntry(1, $1E8, $EF, 0, 0, 2, 0, $121)
    %spritemapEntry(1, $1F3, $0F, 0, 0, 2, 0, $162)
    %spritemapEntry(1, $1E3, $0F, 0, 0, 2, 0, $160)
    %spritemapEntry(1, $1F3, $FF, 0, 0, 2, 0, $142)
    %spritemapEntry(1, $1E3, $FF, 0, 0, 2, 0, $140)

Spritemap_MiniKraid_FiringSpit_FacingLeft_1:
    dw $0010
    %spritemapEntry(1, $1F8, $EF, 0, 0, 2, 0, $15A)
    %spritemapEntry(0, $1E8, $F2, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1F8, $DF, 0, 0, 2, 0, $13A)
    %spritemapEntry(1, $1E8, $EF, 0, 0, 2, 0, $158)
    %spritemapEntry(1, $1F0, $DF, 0, 0, 2, 0, $139)
    %spritemapEntry(0, $1E2, $17, 0, 0, 2, 0, $125)
    %spritemapEntry(1, $1EA, $0F, 0, 0, 2, 0, $116)
    %spritemapEntry(1, $1EA, $07, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1FB, $0F, 0, 0, 2, 0, $163)
    %spritemapEntry(1, $02, $12, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $0F, $17, 0, 0, 2, 0, $120)
    %spritemapEntry(0, $16, $18, 0, 0, 2, 0, $130)
    %spritemapEntry(1, $1F3, $0F, 0, 0, 2, 0, $162)
    %spritemapEntry(1, $1E3, $0F, 0, 0, 2, 0, $160)
    %spritemapEntry(1, $1F3, $FF, 0, 0, 2, 0, $142)
    %spritemapEntry(1, $1E3, $FF, 0, 0, 2, 0, $140)

Spritemap_MiniKraid_FiringSpit_FacingLeft_2:
    dw $0010
    %spritemapEntry(1, $1F0, $DF, 0, 0, 2, 0, $13D)
    %spritemapEntry(1, $1F8, $EF, 0, 0, 2, 0, $15E)
    %spritemapEntry(1, $1F8, $DF, 0, 0, 2, 0, $13E)
    %spritemapEntry(0, $1E8, $F2, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1E8, $EF, 0, 0, 2, 0, $158)
    %spritemapEntry(0, $1E2, $17, 0, 0, 2, 0, $125)
    %spritemapEntry(1, $1EA, $0F, 0, 0, 2, 0, $116)
    %spritemapEntry(1, $1EA, $07, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1FB, $0F, 0, 0, 2, 0, $163)
    %spritemapEntry(1, $02, $12, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $0F, $17, 0, 0, 2, 0, $120)
    %spritemapEntry(0, $16, $18, 0, 0, 2, 0, $130)
    %spritemapEntry(1, $1F3, $0F, 0, 0, 2, 0, $162)
    %spritemapEntry(1, $1E3, $0F, 0, 0, 2, 0, $160)
    %spritemapEntry(1, $1F3, $FF, 0, 0, 2, 0, $142)
    %spritemapEntry(1, $1E3, $FF, 0, 0, 2, 0, $140)

Spritemap_MiniKraid_Stepping_FacingRight_0:
    dw $0010
    %spritemapEntry(0, $16, $17, 0, 1, 2, 0, $125)
    %spritemapEntry(1, $06, $0F, 0, 1, 2, 0, $116)
    %spritemapEntry(1, $06, $07, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $1F5, $0F, 0, 1, 2, 0, $163)
    %spritemapEntry(1, $1EF, $0F, 0, 1, 2, 0, $100)
    %spritemapEntry(0, $1EB, $17, 0, 1, 2, 0, $120)
    %spritemapEntry(0, $10, $F2, 0, 1, 2, 0, $11E)
    %spritemapEntry(0, $1E4, $15, 0, 1, 2, 0, $130)
    %spritemapEntry(1, $00, $DF, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $1F8, $DF, 0, 1, 2, 0, $103)
    %spritemapEntry(1, $1F8, $EF, 0, 1, 2, 0, $123)
    %spritemapEntry(1, $08, $EF, 0, 1, 2, 0, $121)
    %spritemapEntry(1, $1FD, $0F, 0, 1, 2, 0, $162)
    %spritemapEntry(1, $0D, $0F, 0, 1, 2, 0, $160)
    %spritemapEntry(1, $1FD, $FF, 0, 1, 2, 0, $142)
    %spritemapEntry(1, $0D, $FF, 0, 1, 2, 0, $140)

Spritemap_MiniKraid_Stepping_FacingRight_1:
    dw $0010
    %spritemapEntry(1, $06, $0F, 0, 1, 2, 0, $119)
    %spritemapEntry(1, $06, $07, 0, 1, 2, 0, $109)
    %spritemapEntry(0, $14, $17, 0, 1, 2, 0, $125)
    %spritemapEntry(1, $1F5, $0E, 0, 1, 2, 0, $163)
    %spritemapEntry(1, $1EE, $0D, 0, 1, 2, 0, $100)
    %spritemapEntry(0, $1EB, $15, 0, 1, 2, 0, $120)
    %spritemapEntry(0, $10, $F1, 0, 1, 2, 0, $11E)
    %spritemapEntry(0, $1E5, $17, 0, 1, 2, 0, $130)
    %spritemapEntry(1, $00, $DE, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $1F8, $DE, 0, 1, 2, 0, $103)
    %spritemapEntry(1, $1F8, $EE, 0, 1, 2, 0, $123)
    %spritemapEntry(1, $08, $EE, 0, 1, 2, 0, $121)
    %spritemapEntry(1, $1FD, $0E, 0, 1, 2, 0, $162)
    %spritemapEntry(1, $0D, $0E, 0, 1, 2, 0, $160)
    %spritemapEntry(1, $1FD, $FE, 0, 1, 2, 0, $142)
    %spritemapEntry(1, $0D, $FE, 0, 1, 2, 0, $140)

Spritemap_MiniKraid_Stepping_FacingRight_2:
    dw $0010
    %spritemapEntry(0, $17, $14, 0, 1, 2, 0, $12B)
    %spritemapEntry(1, $07, $0C, 0, 1, 2, 0, $11C)
    %spritemapEntry(1, $07, $04, 0, 1, 2, 0, $10C)
    %spritemapEntry(1, $1F5, $0D, 0, 1, 2, 0, $163)
    %spritemapEntry(1, $1EF, $0F, 0, 1, 2, 0, $100)
    %spritemapEntry(0, $1EB, $15, 0, 1, 2, 0, $120)
    %spritemapEntry(0, $10, $F0, 0, 1, 2, 0, $11E)
    %spritemapEntry(0, $1E4, $14, 0, 1, 2, 0, $130)
    %spritemapEntry(1, $00, $DD, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $1F8, $DD, 0, 1, 2, 0, $103)
    %spritemapEntry(1, $1F8, $ED, 0, 1, 2, 0, $123)
    %spritemapEntry(1, $08, $ED, 0, 1, 2, 0, $121)
    %spritemapEntry(1, $1FD, $0D, 0, 1, 2, 0, $162)
    %spritemapEntry(1, $0D, $0D, 0, 1, 2, 0, $160)
    %spritemapEntry(1, $1FD, $FD, 0, 1, 2, 0, $142)
    %spritemapEntry(1, $0D, $FD, 0, 1, 2, 0, $140)

Spritemap_MiniKraid_Stepping_FacingRight_3:
    dw $0010
    %spritemapEntry(0, $1E, $17, 0, 1, 2, 0, $154)
    %spritemapEntry(1, $0E, $0F, 0, 1, 2, 0, $145)
    %spritemapEntry(1, $06, $07, 0, 1, 2, 0, $136)
    %spritemapEntry(1, $1F5, $0D, 0, 1, 2, 0, $163)
    %spritemapEntry(1, $1EE, $10, 0, 1, 2, 0, $100)
    %spritemapEntry(0, $1EB, $12, 0, 1, 2, 0, $120)
    %spritemapEntry(0, $10, $F0, 0, 1, 2, 0, $11E)
    %spritemapEntry(0, $1E5, $0F, 0, 1, 2, 0, $130)
    %spritemapEntry(1, $00, $DD, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $1F8, $DD, 0, 1, 2, 0, $103)
    %spritemapEntry(1, $1F8, $ED, 0, 1, 2, 0, $123)
    %spritemapEntry(1, $08, $ED, 0, 1, 2, 0, $121)
    %spritemapEntry(1, $1FD, $0D, 0, 1, 2, 0, $162)
    %spritemapEntry(1, $0D, $0D, 0, 1, 2, 0, $160)
    %spritemapEntry(1, $1FD, $FD, 0, 1, 2, 0, $142)
    %spritemapEntry(1, $0D, $FD, 0, 1, 2, 0, $140)

Spritemap_MiniKraid_FiringSpit_FacingRight_0:
    dw $0010
    %spritemapEntry(0, $10, $F2, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $16, $17, 0, 1, 2, 0, $125)
    %spritemapEntry(1, $06, $0F, 0, 1, 2, 0, $116)
    %spritemapEntry(1, $06, $07, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $1F5, $0F, 0, 1, 2, 0, $163)
    %spritemapEntry(1, $1EE, $12, 0, 1, 2, 0, $100)
    %spritemapEntry(0, $1E9, $17, 0, 1, 2, 0, $120)
    %spritemapEntry(0, $1E2, $18, 0, 1, 2, 0, $130)
    %spritemapEntry(1, $00, $DF, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $1F8, $DF, 0, 1, 2, 0, $103)
    %spritemapEntry(1, $1F8, $EF, 0, 1, 2, 0, $123)
    %spritemapEntry(1, $08, $EF, 0, 1, 2, 0, $121)
    %spritemapEntry(1, $1FD, $0F, 0, 1, 2, 0, $162)
    %spritemapEntry(1, $0D, $0F, 0, 1, 2, 0, $160)
    %spritemapEntry(1, $1FD, $FF, 0, 1, 2, 0, $142)
    %spritemapEntry(1, $0D, $FF, 0, 1, 2, 0, $140)

Spritemap_MiniKraid_FiringSpit_FacingRight_1:
    dw $0010
    %spritemapEntry(1, $1F8, $EF, 0, 1, 2, 0, $15A)
    %spritemapEntry(0, $10, $F2, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $1F8, $DF, 0, 1, 2, 0, $13A)
    %spritemapEntry(1, $08, $EF, 0, 1, 2, 0, $158)
    %spritemapEntry(1, $00, $DF, 0, 1, 2, 0, $139)
    %spritemapEntry(0, $16, $17, 0, 1, 2, 0, $125)
    %spritemapEntry(1, $06, $0F, 0, 1, 2, 0, $116)
    %spritemapEntry(1, $06, $07, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $1F5, $0F, 0, 1, 2, 0, $163)
    %spritemapEntry(1, $1EE, $12, 0, 1, 2, 0, $100)
    %spritemapEntry(0, $1E9, $17, 0, 1, 2, 0, $120)
    %spritemapEntry(0, $1E2, $18, 0, 1, 2, 0, $130)
    %spritemapEntry(1, $1FD, $0F, 0, 1, 2, 0, $162)
    %spritemapEntry(1, $0D, $0F, 0, 1, 2, 0, $160)
    %spritemapEntry(1, $1FD, $FF, 0, 1, 2, 0, $142)
    %spritemapEntry(1, $0D, $FF, 0, 1, 2, 0, $140)

Spritemap_MiniKraid_FiringSpit_FacingRight_2:
    dw $0010
    %spritemapEntry(1, $00, $DF, 0, 1, 2, 0, $13D)
    %spritemapEntry(1, $1F8, $EF, 0, 1, 2, 0, $15E)
    %spritemapEntry(1, $1F8, $DF, 0, 1, 2, 0, $13E)
    %spritemapEntry(0, $10, $F2, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $08, $EF, 0, 1, 2, 0, $158)
    %spritemapEntry(0, $16, $17, 0, 1, 2, 0, $125)
    %spritemapEntry(1, $06, $0F, 0, 1, 2, 0, $116)
    %spritemapEntry(1, $06, $07, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $1F5, $0F, 0, 1, 2, 0, $163)
    %spritemapEntry(1, $1EE, $12, 0, 1, 2, 0, $100)
    %spritemapEntry(0, $1E9, $17, 0, 1, 2, 0, $120)
    %spritemapEntry(0, $1E2, $18, 0, 1, 2, 0, $130)
    %spritemapEntry(1, $1FD, $0F, 0, 1, 2, 0, $162)
    %spritemapEntry(1, $0D, $0F, 0, 1, 2, 0, $160)
    %spritemapEntry(1, $1FD, $FF, 0, 1, 2, 0, $142)
    %spritemapEntry(1, $0D, $FF, 0, 1, 2, 0, $140)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_MiniKraid_A6A0E0:
    dw $0001
    %spritemapEntry(0, $1FD, $FD, 0, 0, 2, 0, $11F)

UNUSED_Spritemap_MiniKraid_A6A0E7:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $10F)

UNUSED_Spritemap_MiniKraid_A6A0EE:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 0, $10F)
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $A0F5: Initialisation AI - enemy $E13F/$E17F (Ridley) ;;;
InitAI_Ridley:
    LDX.W AreaIndex
    LDA.L SRAMMirror_Boss,X
    AND.W #$0001
    BEQ .notDead
    LDA.W $0F86
    AND.W #$FFFF
    ORA.W #$0700
    STA.W $0F86
    RTL

  .notDead:
    PHB
    PEA $7E7E
    PLB
    PLB
    LDA.W #$0000
    LDX.W #$0FFE

  .loopClearExtraRAM:
    STA.W $2000,X
    DEX
    DEX
    BPL .loopClearExtraRAM
    PLB
    JSL DisableMinimap_MarkBossRoomTilesExplored
    STZ.W $0FB4
    STZ.W $0FB6
    LDA.W #InstList_Ridley_FacingLeft_Initial
    JSR SetRidleyInstList
    LDA.W #$0E00
    STA.W $0F96
    STA.L $7E7818
    LDA.W $0F88
    ORA.W #$0004
    STA.W $0F88
    LDA.W #$0000
    STA.L $7E7802
    STA.L $7E781A
    STZ.W EarthquakeType
    STZ.W EarthquakeTimer
    JSR InitializeTailParts
    JSR InitializeRibAnimation
    LDA.W AreaIndex
    CMP.W #$0002
    BEQ .norfair
    JMP .ceres

  .norfair:
    LDA.W $0F86
    ORA.W #$1400
    STA.W $0F86
    LDA.W #$0060
    STA.W $0F7A
    LDA.W #$018A
    STA.W $0F7E
    LDA.W #Function_Ridley_Startup_Liftoff_FacingRight                   ; >_<
    LDA.W #Function_Ridley_Startup_FirstRun
    STA.W $0FA8
    STZ.W $0FAA
    STZ.W $0FAC
    LDA.W #$0005
    STA.W $0F9A
    LDA.W #$0000
    STA.L $7E7802                                                        ; >.<
    INC
    STA.L $7E7804
    LDA.W #$0040
    STA.L $7E8000
    LDA.W #$01A0
    STA.L $7E8002
    LDA.W #$0040
    STA.L $7E8004
    LDA.W #$00E0
    STA.L $7E8006
    LDA.W #$0002
    STA.L $7E7820
    LDA.W #$0078
    STA.L $7E7838
    LDY.W #Palette_NorfairRidleyInit
    LDX.W #$0140
    LDA.W #$0020
    JSL WriteAColorsFromYToTargetColorIndexX
    LDX.W #$00E2
    LDX.W #$0000
    LDY.W #$000F
    LDA.W #$0000

  .loopClearPalettes:
    STA.L $7EC2E2,X
    STA.L $7EC3E2,X
    INX
    INX
    DEY
    BNE .loopClearPalettes
    RTL

  .ceres:
    LDA.W $0F86
    ORA.W #$1400
    STA.W $0F86
    LDA.W #$00BA
    STA.W $0F7A
    LDA.W #$00A9
    STA.W $0F7E
    LDA.W #$0000
    STA.W CeresStatus
    STA.L $7E7820
    STA.L $7E7804
    INC
    STA.L $7E2002
    LDA.W #$000F
    STA.L $7E7838
    LDA.W #Function_Ridley_Startup_FirstRun
    STA.W $0FA8
    STZ.W $0FAA
    STZ.W $0FAC
    LDA.W #$FFE0
    STA.L $7E8000
    LDA.W #$00B0
    STA.L $7E8002
    LDA.W #$0028
    STA.L $7E8004
    LDA.W #$00E0
    STA.L $7E8006
    LDY.W #Palette_CeresRidleyInit
    LDX.W #$0140
    LDA.W #$0020
    JSL WriteAColorsFromYToTargetColorIndexX
    LDX.W #$01E2
    LDY.W #$000F
    LDA.W #$0000

  .loopClearSpritePalette7:
    STA.L $7EC200,X
    INX
    INX
    DEY
    BNE .loopClearSpritePalette7
    LDA.W #InstList_BabyMetroidCutscene_0
    STA.L $7E7806
    LDA.W #$0001
    STA.L $7E7808
    LDA.W #UpdateBabyMetroidPosition_CarriedInArms
    STA.L $7E8800
    LDA.W #$0005
    STA.L $7E780E
    LDA.W #$0000
    JSL QueueMusicDataOrTrack_8FrameDelay
    RTL


;;; $A288: Main AI - enemy $E13F (Ceres Ridley) ;;;
MainAI_RidleyCeres:
    LDA.W #$7FFF
    STA.W Enemy.health
    PEA .manualReturn-1
    JMP.W ($0FA8)

  .manualReturn:
    LDA.W CeresStatus
    BNE .return
    LDA.L $7E7804
    BEQ HandleBabyMetroidCapsuleInteractions
    JSR MakeRidleysWingsAndTailFlashWhenHit
    JSR HandleMovementAndMainBodyWallCollisions
    JSR HandleWingFlapping
    JSR RNGChanceToChooseNewTailSwingDelay
    JSR HandleRidleyTailAI
    JSR DetermineAndSetCeresRidleysColorPalette
    JSR AnimateRidleysRibs
    JSR DrawRidleyTail
    JSR DrawRidleysWings
    BRA HandleBabyMetroidCapsuleInteractions


  .return:
    RTL


;;; $A2BD:  ;;;
RNGChanceToChooseNewTailSwingDelay:
; 1/100 chance of setting 7E:201E to 8-17 (all hex numbers)
    LDA.W RandomNumberSeed
    CMP.W #$FF00
    BCC .return
    LDA.W RandomNumberSeed                                               ; >.<
    AND.W #$000F
    ADC.W #$0007
    STA.L $7E201E

  .return:
    RTS


;;; $A2D3: Hurt AI - enemy $E13F (Ceres Ridley) ;;;
HurtAI_RidleyCeres:
    JSR MakeRidleysWingsAndTailFlashWhenHit
    JSR DrawRidleyTail
    JSR DrawRidleysWings                                               ; fallthrough to HandleBabyMetroidCapsuleInteractions


;;; $A2DC:  ;;;
HandleBabyMetroidCapsuleInteractions:
    JSR HandleCarryingBabyMetroid
    LDA.L $7E7804
    BEQ EnemyGraphicsDrawnHook_RidleyCeres_DrawBabyMetroidAndDoor
    LDA.W #EnemyGraphicsDrawnHook_RidleyCeres_DrawBabyMetroidAndDoor>>8&$FF00
    STA.W $178D
    LDA.W #EnemyGraphicsDrawnHook_RidleyCeres_DrawBabyMetroidAndDoor
    STA.W $178C
    RTL


;;; $A2F2: Enemy graphics drawn hook - Ceres Ridley - draw Baby Metroid and door ;;;
EnemyGraphicsDrawnHook_RidleyCeres_DrawBabyMetroidAndDoor:
; Enemy 1 is the Ceres door
    LDA.W CeresStatus
    BNE .skipBaby
    JSR DrawBabyMetroid

  .skipBaby:
    LDA.W $0FEA
    BEQ .return
    LDA.W EarthquakeTimer
    AND.W #$0003
    TAX
    LDA.W CeresDoorOffsetsDuringEarthquake,X
    CLC
    ADC.W $0FBA
    STA.B $14
    LDA.W $0FBE
    STA.B $12
    LDA.W #$0400
    STA.B $16
    LDY.W #Spritemap_CeresDoor
    JSL AddSpritemapToOAM

  .return:
    RTL


;;; $A321: Ceres Ridley door X offsets during earthquake ;;;
CeresDoorOffsetsDuringEarthquake:
; Actually, this table is being indexed in one byte increments, meaning these values should have been 8-bit.
; Only the lower 8 bits are used in practice, so the resulting actual read values are as if:
;    db 00, 00, FC, FF
    dw $0000,$FFFC,$FFFF,$0003


;;; $A329: Spritemap - Ceres Ridley door ;;;
Spritemap_CeresDoor:
    dw $0008
    %spritemapEntry(0, $00, $18, 1, 0, 2, 0, $D1)
    %spritemapEntry(0, $00, $E0, 0, 0, 2, 0, $D1)
    %spritemapEntry(0, $00, $10, 1, 0, 2, 0, $D3)
    %spritemapEntry(0, $00, $E8, 0, 0, 2, 0, $D3)
    %spritemapEntry(0, $00, $00, 1, 0, 2, 0, $F2)
    %spritemapEntry(0, $00, $08, 1, 0, 2, 0, $E2)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $F2)
    %spritemapEntry(0, $00, $F0, 0, 0, 2, 0, $E2)


;;; $A353: RTL ;;;
RTL_A6A353:
    RTL


;;; $A354: Ridley function ;;;
Function_Ridley_ResetSpeeds:
; Clear speeds, that's it
    STZ.W $0FAA
    STZ.W $0FAC
    RTS


;;; $A35B: Ridley function ;;;
Function_Ridley_Startup_FirstRun:
; Startup, 1st run
    LDA.W $0797
    BNE Function_Ridley_Startup_InitalWait_return
    LDA.W #Function_Ridley_Startup_InitalWait
    STA.W $0FA8
    LDA.W #$0200
    LDY.W AreaIndex
    CPY.W #$0002
    BNE .notNorfar
    LDA.W #$00AA

  .notNorfar:
    STA.W $0FB2                                                          ; fallthrough to Function_Ridley_Startup_InitalWait


;;; $A377: Ridley function ;;;
Function_Ridley_Startup_InitalWait:
; Startup, initial wait
    DEC.W $0FB2
    BPL .return
    LDA.W #Function_Ridley_Startup_EyesAppear_Wait
    STA.W $0FA8
    STZ.W $0FB0
    STZ.W $0FB2

  .return:
    RTS


;;; $A389: Ridley function ;;;
Function_Ridley_Startup_EyesAppear_Wait:
; Startup, eyes appear + wait
    LDA.W $0FB0
    BMI .return
    TAY
    INC.W $0FB2
    LDA.W $0FB2
    CMP.W #$0001
    BCC .return
    STZ.W $0FB2
    TYX
    LDA.W CeresRidleyEyeFadeInIndices,X
    AND.W #$00FF
    CMP.W #$00FF
    BEQ .done
    STA.B $12
    ASL
    CLC
    ADC.B $12
    ASL
    TAY
    INX
    STX.W $0FB0
    LDX.W #$01F8
    LDA.W CeresRidleyEyeFadeInColors_0,Y
    STA.L $7EC000,X
    LDA.W CeresRidleyEyeFadeInColors_1,Y
    STA.L $7EC002,X
    LDA.W CeresRidleyEyeFadeInColors_2,Y
    STA.L $7EC004,X

  .return:
    RTS

  .done:
    STZ.W $0FB0
    LDA.W #Function_Ridley_Startup_MainBodyAppears
    STA.W $0FA8
    LDA.W #$0001
    STA.L $7E7804
    RTS


;;; $A3DF: Ridley function ;;;
Function_Ridley_Startup_MainBodyAppears:
; Startup, main body appears
    INC.W $0FB2
    LDA.W $0FB2
    CMP.W #$0002
    BCC .return
    STZ.W $0FB2
    LDY.W $0FB0
    LDA.W #$0122
    STA.B $12
    LDA.W #$01E2
    STA.B $14
    LDA.W #$000B

  .loop:
    PHA
    LDA.W Palette_Ridley_FadeIn,Y
    LDX.B $12
    STA.L $7EC000,X
    LDX.B $14
    STA.L $7EC000,X
    INY
    INY
    INC.B $12
    INC.B $12
    INC.B $14
    INC.B $14
    PLA
    DEC
    BNE .loop
    CPY.W #$0160
    BCS .done
    STY.W $0FB0

  .return:
    RTS

  .done:
    LDA.W AreaIndex
    CMP.W #$0002
    BNE .notCeres
    LDA.W #$0002
    STA.W $0F9A

  .notCeres:
    LDA.W $0F86
    AND.W #$FBFF
    STA.W $0F86
    LDY.W #$0000
    STY.W $0FB0
    LDA.W #Function_Ridley_Startup_RidleyRoars
    STA.W $0FA8
    LDA.W #$0004
    STA.W $0FB2
    LDA.W #$0005
    JSL QueueMusicDataOrTrack_8FrameDelay
    RTS


;;; $A455: Ridley function ;;;
Function_Ridley_Startup_RidleyRoars:
; Startup, Ridley roars
    DEC.W $0FB2
    BPL .return
    LDA.W #InstList_Ridley_FacingLeft_OpeningRoar
    JSR SetRidleyInstList
    STZ.W $0FB2
    LDA.W #Function_Ridley_Startup_ColorBGInNorfair_RaiseAcid_MainAI
    STA.W $0FA8
    LDA.W AreaIndex
    CMP.W #$0002
    BEQ .return
    LDA.W #$00FC
    STA.W $0FB2

  .return:
    RTS


;;; $A478: Ridley function ;;;
Function_Ridley_Startup_ColorBGInNorfair_RaiseAcid_MainAI:
; Startup, color background in Norfair, raise acid, start main AI
    LDA.W AreaIndex
    CMP.W #$0002
    BNE .ceres
    DEC.W $0FB2
    BPL Function_Ridley_Startup_RidleyRoars_return
    LDA.W #$0002
    STA.W $0FB2
    LDA.W $0FB0
    INC
    STA.W $0FB0
    DEC
    JSR AdjustRidleyBackgroundColorsIfNecessary
    BCC Function_Ridley_Startup_RidleyRoars_return
    LDA.W #$01B8
    STA.W $197A
    LDA.W #$FFA0
    STA.W $197C
    LDA.W #$0020
    STA.W $1980
    BRA .merge

  .ceres:
    DEC.W $0FB2
    BPL Function_Ridley_Startup_RidleyRoars_return

  .merge:
    STZ.W $0FB0
    LDA.W #InstList_RidleyCeres_FacingLeft_FlyUp_StartMainAI
    JSR SetRidleyInstList
    LDA.W #$0008
    STA.L $7E7810
    STA.L $7E7812
    JSR SetAllTailPartsToMoving
    LDA.W #$0001
    STA.L $7E2000
    LDA.W #Function_Ridley_ResetSpeeds
    STA.W $0FA8
    RTS


;;; $A4D6:  ;;;
AdjustRidleyBackgroundColorsIfNecessary:
; Adjust background colors if necessary
    ASL
    TAX
    LDY.W .pointers,X
    BNE .adjust
    SEC
    RTS

  .adjust:
    LDX.W #$00E2
    LDA.W #$000E
    JSL WriteAColorsFromYtoColorIndexX
    CLC
    RTS

  .pointers:
    dw .palette0
    dw .palette1
    dw .palette2
    dw .palette3
    dw .palette4
    dw .palette5
    dw .palette6
    dw .palette7
    dw .palette8
    dw .palette9
    dw .paletteA
    dw .paletteB
    dw .paletteC
    dw .paletteD
    dw .paletteE
    dw $0000

  .palette0:
    dw $0001,$0001,$0001,$0000,$0000,$0000,$0000,$0001
    dw $0000,$0000,$0000,$0000,$0000,$0842

  .palette1:
    dw $0023,$0003,$0003,$0001,$0001,$0000,$0000,$0001
    dw $0001,$0000,$0000,$0001,$0001,$1084

  .palette2:
    dw $0044,$0024,$0004,$0402,$0001,$0000,$0000,$0002
    dw $0001,$0000,$0000,$0001,$0001,$18C6

  .palette3:
    dw $0065,$0025,$0005,$0403,$0002,$0001,$0000,$0003
    dw $0002,$0001,$0000,$0002,$0002,$2108

  .palette4:
    dw $0087,$0047,$0007,$0404,$0402,$0001,$0000,$0004
    dw $0003,$0001,$0000,$0402,$0003,$294A

  .palette5:
    dw $0088,$0048,$0008,$0804,$0403,$0001,$0000,$0005
    dw $0003,$0001,$0000,$0403,$0003,$318C

  .palette6:
    dw $00AA,$004A,$002A,$0805,$0403,$0001,$0000,$0406
    dw $0004,$0001,$0000,$0403,$0004,$39CE

  .palette7:
    dw $00CB,$006B,$002B,$0806,$0404,$0002,$0000,$0407
    dw $0004,$0002,$0000,$0404,$0004,$4210

  .palette8:
    dw $00ED,$006D,$002D,$0C07,$0404,$0002,$0000,$0408
    dw $0005,$0002,$0000,$0404,$0005,$4A52

  .palette9:
    dw $010E,$008E,$002E,$0C08,$0805,$0002,$0000,$0409
    dw $0006,$0002,$0000,$0805,$0006,$5294

  .paletteA:
    dw $0110,$0090,$0030,$0C08,$0805,$0003,$0000,$040A
    dw $0006,$0003,$0000,$0805,$0006,$5AD6

  .paletteB:
    dw $0131,$0091,$0031,$1009,$0806,$0003,$0000,$040B
    dw $0007,$0003,$0000,$0806,$0007,$6318

  .paletteC:
    dw $0153,$00B3,$0033,$100A,$0807,$0003,$0000,$040C
    dw $0007,$0003,$0000,$0807,$0007,$6B5A

  .paletteD:
    dw $0574,$04B4,$0434,$100B,$0807,$0403,$0000,$040D
    dw $0408,$0003,$0000,$0807,$0408,$77BD

  .paletteE:
    dw $0596,$04D6,$0456,$140C,$0C08,$0404,$0000,$080E
    dw $0409,$0004,$0000,$0C08,$0409,$7FFF


;;; $A6AF: Ridley function ;;;
Function_RidleyCeres_StartupLiftoff_FacingLeft:
; Startup liftoff, facing left (Ceres)
    LDA.W $0FAC
    CLC
    ADC.W #$FFF0
    STA.W $0FAC
    LDA.W $0F7E
    CMP.W #$0070
    BMI .reachedTarget
    RTS

  .reachedTarget:
    LDA.W #Function_RidleyCeres_StartupLiftoff_FacingLeft_SlowingDown
    STA.W $0FA8                                                          ; fallthrough to Function_RidleyCeres_StartupLiftoff_FacingLeft_SlowingDown


;;; $A6C8: Ridley function ;;;
Function_RidleyCeres_StartupLiftoff_FacingLeft_SlowingDown:
; Startup liftoff, facing left and slowing down (Ceres)
    LDA.W $0FAC
    CLC
    ADC.W #$0014
    STA.W $0FAC
    LDA.W $0F7E
    CMP.W #$0050
    BPL .return
    LDA.W #Function_RidleyCeres_MainAI
    STA.W $0FA8
    LDA.W #$0001
    STA.L $7E7802

  .return:
    RTS


;;; $A6E8: Ridley function ;;;
Function_RidleyCeres_MainAI:
; Ceres main AI?
    LDA.L $7E781A
    CMP.W #$0064
    BCS .shot100Times
    LDA.W $09C2
    CMP.W #$001E
    BPL .SamusNotLowEnergy
    LDA.W #$0000
    STA.L $7E7802
    LDA.W #Function_RidleyCeres_FlyAwayToEndFight
    STA.W $0FA8
    JMP Function_RidleyCeres_FlyAwayToEndFight

  .shot100Times:
    LDA.W #$0000
    STA.L $7E7802
    LDA.W #Function_RidleyCeres_InitializeBabyMetroidDrop
    STA.W $0FA8
    JMP Function_RidleyCeres_InitializeBabyMetroidDrop

  .SamusNotLowEnergy:
    JSR CeresRidleyAttackCooldown_FlyToPosition
    BCC .notReachedTarget
    LDA.L $7E7800
    INC
    STA.L $7E7800
    CMP.W #$007C
    BCC .return
    NOP

  .notReachedTarget:
    LDA.W RandomNumberSeed
    AND.W #$000F
    ASL
    TAX
    LDA.W .pointers,X
    STA.W $0FA8
    LDA.W #$0000
    STA.L $7E7800

  .return:
    RTS

  .pointers:
    dw Function_RidleyCeres_StartFireballing
    dw Function_RidleyCeres_StartFireballing
    dw Function_RidleyCeres_StartFireballing
    dw Function_RidleyCeres_StartFireballing
    dw Function_RidleyCeres_StartLunging
    dw Function_RidleyCeres_StartLunging
    dw Function_RidleyCeres_StartLunging
    dw Function_RidleyCeres_StartLunging
    dw Function_RidleyCeres_StartLunging
    dw Function_RidleyCeres_StartFireballing
    dw Function_RidleyCeres_StartSwoop
    dw Function_RidleyCeres_StartSwoop
    dw Function_RidleyCeres_StartSwoop
    dw Function_RidleyCeres_StartSwoop
    dw Function_RidleyCeres_StartSwoop
    dw Function_RidleyCeres_StartFireballing


;;; $A763:  ;;;
CeresRidleyAttackCooldown_FlyToPosition:
; Ceres Ridley attack cooldown; fly towards (C0h, 64h) (return carry set if reached, carry clear otherwise)
    LDX.W #$00C0
    LDY.W #$0064
    STX.B $12
    STY.B $14
    LDX.W #$0000
    LDY.W #$0000
    JSR AccelerateCeresRidleyTowardDesiredXY
    LDA.W #$0008
    STA.B $16
    STA.B $18
    JSL CheckForEnemyCollisionWithRectangle
    RTS


;;; $A782: Ridley function ;;;
Function_RidleyCeres_StartFireballing:
; Ceres Ridley fireballing
    LDA.W $0FAC
    BPL +
    EOR.W #$FFFF
    INC

+   CMP.W #$0080
    BCS +
    LDA.W #$0080

+   BIT.W $0FAC
    BPL +
    EOR.W #$FFFF
    INC

+   STA.W $0FAC
    LDA.W $0F7A
    STA.B $12
    LDA.W #$0058
    STA.B $14
    LDX.W #$0000
    LDY.W #$0000
    JSR AccelerateCeresRidleyTowardDesiredXY
    LDA.W $0F7E
    CMP.W #$0050
    BMI .reachedTarget
    CMP.W #$0080
    BPL .return
    LDA.W $0F7A
    STA.L $7E782E
    LDA.W $0F7E
    STA.L $7E7830
    LDA.W #InstList_Ridley_FacingLeft_Fireballing_0
    JSR SetRidleyInstList
    LDA.W #Function_RidleyCeres_Fireballing
    STA.W $0FA8
    LDA.W #$00E0
    STA.L $7E7800
    JMP Function_RidleyCeres_Fireballing

  .return:
    RTS

  .reachedTarget:
    LDA.L $7E7800
    INC
    STA.L $7E7800
    CMP.W #$0030
    BCC .return
    LDA.W #Function_RidleyCeres_StartSwoop
    STA.W $0FA8
    RTS


;;; $A7F9: Ridley function ;;;
Function_RidleyCeres_Fireballing:
    LDA.W RandomNumberSeed
    AND.W #$0007
    BIT.W RandomNumberSeed
    BPL +
    EOR.W #$FFFF
    INC

+   STA.B $16
    LDA.L $7E782E
    ADC.B $16
    STA.B $12
    LDA.L $7E7830
    ADC.B $16
    STA.B $14
    LDX.W #$0000
    LDY.W #$0000
    JSR AccelerateCeresRidleyTowardDesiredXY
    LDA.L $7E7800
    DEC
    STA.L $7E7800
    BPL .return
    LDA.W #$0000
    STA.L $7E7800
    LDA.W #Function_RidleyCeres_MainAI
    STA.W $0FA8

  .return:
    RTS


;;; $A83C: Ridley function ;;;
Function_RidleyCeres_StartLunging:
; Ceres Ridley start lunging
    LDA.W #InstList_RidleyCeres_FacingLeft_Lunging
    JSR SetRidleyInstList
    LDA.W #Function_RidleyCeres_Lunging
    STA.W $0FA8
    LDA.W #$0040
    STA.W $0FB2                                                          ; fallthrough to Function_RidleyCeres_Lunging


;;; $A84E: Ridley function ;;;
Function_RidleyCeres_Lunging:
    LDA.W SamusXPosition
    STA.B $12
    LDA.W SamusYPosition
    SEC
    SBC.W #$0044
    CMP.W #$0040
    BPL +
    LDA.W #$0040

+   STA.B $14
    LDX.W #$0000
    LDY.W #$000D
    JSR AccelerateCeresRidleyTowardDesiredXY
    LDA.W #$0002
    STA.B $16
    STA.B $18
    JSL CheckForEnemyCollisionWithRectangle
    BCC .collision
    DEC.W $0FB2
    BPL .return

  .collision:
    LDA.W #$0000
    STA.L $7E7800
    LDA.W #Function_RidleyCeres_MainAI
    STA.W $0FA8

  .return:
    RTS


;;; $A88D: Ridley function ;;;
Function_RidleyCeres_StartSwoop:
; Ceres Ridley start swoop
    LDA.W #Function_RidleyCeres_FlyToSwoopSetupPosition
    STA.W $0FA8
    LDA.W #$000A
    STA.W $0FB2
    LDA.W #$0000
    STA.L $7E7814
    STA.L $7E2002                                                        ; fallthrough to Function_Ridley_Ceres_FlyToSwoopSetupPosition


;;; $A8A4: Ridley function ;;;
Function_RidleyCeres_FlyToSwoopSetupPosition:
; Ceres Ridley fly towards (C0h, 50h) to swoop
    LDX.W #$00C0
    LDY.W #$0050
    STX.B $12
    STY.B $14
    LDX.W #$0000
    LDY.W #$0001
    JSR AccelerateCeresRidleyTowardDesiredXY
    LDA.W $0F7E
    CMP.W #$0060
    BMI .reachedTarget
    RTS

  .reachedTarget:
    LDA.W #Function_RidleyCeres_Swoop
    STA.W $0FA8
    LDA.W #$000A
    STA.W $0FB2
    LDA.W #$0000
    STA.L $7E7814
    RTS


;;; $A8D4: Ridley function ;;;
Function_RidleyCeres_Swoop:
; Ceres Ridley swoop
    LDA.W #$FFE0
    STA.B $12
    LDA.W #$FC00
    STA.B $14
    LDA.W #$0300
    STA.B $16
    JSR UpdateRidleysUSwoopSpeedAndAngle
    DEC.W $0FB2
    BPL .return
    LDA.W #Function_RidleyCeres_SwoopingDownLeft
    STA.W $0FA8
    LDA.W #$0024
    STA.W $0FB2

  .return:
    RTS


;;; $A8F8: Ridley function ;;;
Function_RidleyCeres_SwoopingDownLeft:
    LDA.W #$FE00
    STA.B $12
    LDA.W #$C000
    STA.B $14
    LDA.W #$0300
    STA.B $16
    JSR UpdateRidleysUSwoopSpeedAndAngle
    DEC.W $0FB2
    BPL .return
    LDA.W #Function_RidleyCeres_SwoopingUpRight
    STA.W $0FA8
    LDA.W #$001C
    STA.W $0FB2
    LDA.W #$0001
    STA.L $7E2004

  .return:
    RTS


;;; $A923: Ridley function ;;;
Function_RidleyCeres_SwoopingUpRight:
    LDA.W #$FE00
    STA.B $12
    LDA.W #$8800
    STA.B $14
    LDA.W #$0300
    STA.B $16
    JSR UpdateRidleysUSwoopSpeedAndAngle
    DEC.W $0FB2
    BPL .return
    LDA.W #Function_RidleyCeres_EndOfSwoop
    STA.W $0FA8
    LDA.W #$0001
    STA.W $0FB2

  .return:
    RTS


;;; $A947: Ridley function ;;;
Function_RidleyCeres_EndOfSwoop:
    LDA.W #$FD00
    STA.B $12
    LDA.W #$8800
    STA.B $14
    LDA.W #$0300
    STA.B $16
    JSR UpdateRidleysUSwoopSpeedAndAngle
    DEC.W $0FB2
    BPL .return
    LDA.W #Function_RidleyCeres_MainAI
    STA.W $0FA8
    LDA.W #$0000
    STA.L $7E7800
    INC
    STA.L $7E2002

  .return:
    RTS


;;; $A971: Ridley function ;;;
Function_RidleyCeres_FlyAwayToEndFight:
; Ceres Ridley flying away after Samus has low health or after he picks up baby metroid
    LDA.W #$FF40
    STA.L $7E8000
    LDA.W #$00C0
    STA.B $12
    LDA.W #$FF80
    STA.B $14
    LDX.W #$0000
    LDY.W #$0001
    JSR AccelerateCeresRidleyTowardDesiredXY
    LDA.W $0F7E
    CMP.W #$FF80
    BMI .reachedTarget

  .return:
    RTS

  .reachedTarget:
    LDA.W #Function_RidleyCeres_SpawnWallsAndUpdatePalettesForGetaway
    STA.W $0FA8
    LDA.W #$0040
    STA.W $0FB2                                                          ; fallthrough to Function_RidleyCeres_SpawnWallsAndUpdatePalettesForGetaway


;;; $A9A0: Ridley function ;;;
Function_RidleyCeres_SpawnWallsAndUpdatePalettesForGetaway:
    DEC.W $0FB2
    BPL Function_RidleyCeres_FlyAwayToEndFight_return
    JSR SpawnWallsDuringCeresRidleyGetawayCutscene
    STZ.W $0FAA
    STZ.W $0FAC
    LDA.W #$0000
    STA.L $7E2000
    LDA.W #Function_RidleyCeres_DisableAI_SetupMode7Ridley
    STA.W $0FA8
    LDY.W #.BG2Palette5
    LDX.W #$00A2
    LDA.W #$000F
    JSL WriteAColorsFromYtoColorIndexX
    LDY.W #.spritePalette7
    LDX.W #$0042
    LDA.W #$0008
    JSL WriteAColorsFromYtoColorIndexX
    LDY.W #.spritePalette7
    LDX.W #$01E2
    LDA.W #$0008
    JSL WriteAColorsFromYtoColorIndexX
    RTS

  .BG2Palette5:
; BG1/2 palette 5 colours 1..Fh
    dw $0421,$0401,$0000,$0000,$0421,$0001,$0000,$0000
    dw $0422,$0002,$0001,$0022,$0021,$0001,$0000

  .spritePalette7:
; Sprite palette 7 colours 1..8
    dw $7E20,$6560,$2060,$1000,$7940,$5D00,$4CA0,$3CA0


;;; $AA11: Ridley function ;;;
Function_RidleyCeres_DisableAI_SetupMode7Ridley:
    LDA.W #RTS_A6AA4F
    STA.W $0FA8
    LDA.W #$0001
    STA.W CeresStatus
    JMP SetupMode7ForCeresRidleyEscape


;;; $AA20: Spawn walls during Ceres Ridley getaway cutscene ;;;
SpawnWallsDuringCeresRidleyGetawayCutscene:
    LDX.W #.leftWall
    JSL SpawnEnemy
    LDX.W #.rightWall
    JSL SpawnEnemy
    RTS

;        _______________________________________ X position
;       |      _________________________________ Y position
;       |     |      ___________________________ Initialisation parameter
;       |     |     |      _____________________ Properties
;       |     |     |     |      _______________ Extra properties
;       |     |     |     |     |      _________ Parameter 1
;       |     |     |     |     |     |      ___ Parameter 2
;       |     |     |     |     |     |     |
  .leftWall:
    dw EnemyHeaders_CeresDoor
    dw $0008,$007F,$0000,$2800,$0000,$0005,$0000
  .rightWall:
    dw EnemyHeaders_CeresDoor
    dw $00F8,$007F,$0000,$2800,$0000,$0006,$0000


;;; $AA4F: RTS. Ridley function ;;;
RTS_A6AA4F:
    RTS


;;; $AA50: Ridley function ;;;
Function_RidleyCeres_CycleEmergencyTextColors:
    JSR CycleEmergencyTextColors
    RTS


;;; $AA54:  ;;;
SetupMode7ForCeresRidleyEscape:
    SEP #$20
    LDA.B #$07
    STA.B $56
    REP #$20
    LDA.W #$0001
    STA.W $0783
    SEP #$20
    LDA.B #$80
    STA.B $5F
    REP #$20
    LDA.W #$0100
    STA.B $78
    STA.B $7A
    STA.B $7C
    STA.B $7E
    LDA.W #$0040
    STA.B $80
    STA.B $82
    LDA.W #$0000
    STA.L $7E8024
    STA.L $7E8026
    LDA.W #$0001
    STA.L $7E7814
    LDA.W #$FF80
    STA.L $7E8028
    STA.B $B1
    LDA.W #$0020
    STA.L $7E802A
    STA.B $B3
    LDA.W #$0800
    STA.L $7E8020
    LDA.W #$0400
    STA.L $7E8022
    RTS


;;; $AAAF: Handle Ceres Ridley getaway cutscene ;;;
HandleCeresRidleyGetawayCutscene:
    PHB
    PHK
    PLB
    LDA.L $7E8024
    BNE .return
    JSR ExecuteCeresRidleyGetawayCutscene

  .return:
    PLB
    RTL


;;; $AABD:  ;;;
ExecuteCeresRidleyGetawayCutscene:
    LDA.L $7E8026
    TAX
    INC
    INC
    STA.L $7E8026
    CPX.W #$0000
    BNE .notFirstExecution
    LDA.W #$004E
    JSL QueueSound_Lib2_Max6

  .notFirstExecution:
    CPX.W #$00D0
    BNE .dontPushSamus
    JSL SetSamusToBePushedOutOfCeresRidleysWay
    LDA.W #$0023
    STA.W EarthquakeType
    LDA.W #$0040
    STA.W EarthquakeTimer

  .dontPushSamus:
    LDA.W CeresRidleyMode7GetawayBackgroundParameters,X
    CMP.W #$FFFF
    BEQ .done
    STA.L $7E8020
    LDA.L $7E802A
    CLC
    ADC.W CeresRidleyGetawayYVelocityTable,X
    STA.L $7E802A
    STA.B $B3
    LDA.L $7E8028
    SEC
    SBC.W CeresRidleyGetawayXVelocityTable,X
    STA.L $7E8028
    STA.B $B1
    LDA.L $7E8020
    JSR RidleyCeres_UpdateBG12Palette5
    LDA.L $7E7814
    CLC
    ADC.W #$0030
    STA.L $7E7814
    JSR HandleCeresRidleyMode7TransformationMatrix
    JSR AnimateMode7BabyMetroidCapsuleDuringGetaway
    JSR AnimateMode7RidleyWings
    RTS

  .done:
    LDA.L $7E8024
    INC
    STA.L $7E8024
    SEP #$20
    LDA.B #$09
    STA.B $56
    REP #$20                                                             ; >.<
    SEP #$20                                                             ; >.<
    STZ.B $5F
    REP #$20
    STZ.B $78
    STZ.B $7A
    STZ.B $7C
    STZ.B $7E
    STZ.B $80
    STZ.B $82
    STZ.B $B1
    STZ.B $B3
    LDA.W #CeresRidleyPostGetawayFunctionHandler
    STA.W $0FA8
    STZ.W $0FB2
    RTS


;;; $AB5F:  ;;;
HandleCeresRidleyMode7TransformationMatrix:
; >_<;
    LDA.L $7E7814
    XBA
    AND.W #$00FF
    STA.B $12
    LDA.W #$0100
    JSL Mode7Math_A6AC1E
    STA.B $18
    BIT.B $18
    BPL +
    EOR.W #$FFFF
    INC

+   STA.B $26
    LDA.L $7E8020
    STA.B $28
    JSR Mode7Math_A6AC58
    LDA.B $2B
    BIT.B $18
    BPL +
    EOR.W #$FFFF
    INC

+   STA.B $78
    LDA.W #$0100
    JSL Mode7Math_A6AC0E
    STA.B $18
    BIT.B $18
    BPL +
    EOR.W #$FFFF
    INC

+   STA.B $26
    LDA.L $7E8020
    STA.B $28
    JSR Mode7Math_A6AC58
    LDA.B $2B
    BIT.B $18
    BPL +
    EOR.W #$FFFF
    INC

+   STA.B $7A
    LDA.W #$0100
    JSL Mode7Math_A6AC0E
    EOR.W #$FFFF
    INC
    STA.B $18
    BIT.B $18
    BPL +
    EOR.W #$FFFF
    INC

+   STA.B $26
    LDA.L $7E8020
    STA.B $28
    JSR Mode7Math_A6AC58
    LDA.B $2B
    BIT.B $18
    BPL +
    EOR.W #$FFFF
    INC

+   STA.B $7C
    LDA.W #$0100
    JSL Mode7Math_A6AC1E
    STA.B $18
    BIT.B $18
    BPL +
    EOR.W #$FFFF
    INC

+   STA.B $26
    LDA.L $7E8020
    STA.B $28
    JSR Mode7Math_A6AC58
    LDA.B $2B
    BIT.B $18
    BPL +
    EOR.W #$FFFF
    INC

+   STA.B $7E
    RTS


;;; $AC0E:  ;;;
Mode7Math_A6AC0E:
    STA.B $14
    BIT.B $14
    BPL +
    EOR.W #$FFFF
    INC

+   STA.B $26
    LDA.B $12
    BRA Mode7Math_Common_A6AC30


;;; $AC1E:  ;;;
Mode7Math_A6AC1E:
    STA.B $14
    BIT.B $14
    BPL +
    EOR.W #$FFFF
    INC

+   STA.B $26
    LDA.B $12
    CLC
    ADC.W #$0040                                                         ; fallthrough to Mode7Math_Common_A6AC30


;;; $AC30:  ;;;
Mode7Math_Common_A6AC30:
    ASL
    AND.W #$01FE
    TAX
    LDA.L SineCosineTables_8bitSine_SignExtended,X
    BEQ .return
    STA.B $16
    BPL +
    EOR.W #$FFFF
    INC

+   STA.B $28
    JSR Mode7Math_A6AC58
    LDA.B $14
    EOR.B $16
    BMI +
    LDA.B $2B
    RTL

+   LDA.B $2B
    EOR.W #$FFFF
    INC

  .return:
    RTL


;;; $AC58:  ;;;
Mode7Math_A6AC58:
    PHX
    PHY
    PHA
    PHP
    REP #$20
    SEP #$10
    LDX.B $26
    STX.W $4202
    LDX.B $28
    STX.W $4203
    NOP
    NOP
    NOP
    LDA.W $4216
    STA.B $2A
    LDX.B $27
    STX.W $4202
    LDX.B $29
    STX.W $4203
    NOP
    NOP
    NOP
    LDX.W $4216
    STX.B $2C
    LDY.W $4217
    LDX.B $27
    STX.W $4202
    LDX.B $28
    STX.W $4203
    NOP
    NOP
    LDA.B $2B
    CLC
    ADC.W $4216
    STA.B $2B
    BCC +
    INY

+   LDX.B $26
    STX.W $4202
    LDX.B $29
    STX.W $4203
    NOP
    NOP
    LDA.B $2B
    CLC
    ADC.W $4216
    STA.B $2B
    BCC +
    INY

+   STY.B $2D
    PLP
    PLA
    PLY
    PLX
    RTS


;;; $ACBC:  ;;;
AnimateMode7BabyMetroidCapsuleDuringGetaway:
    LDA.W NMI_FrameCounter
    AND.W #$0003
    BNE .return
    LDA.L $7E802C
    INC
    AND.W #$0003
    STA.L $7E802C
    ASL
    TAY
    LDX.W .pointers,Y
    JSL QueueMode7Transfers

  .return:
    RTS

  .pointers:
    dw .tilemapEntry0
    dw .tilemapEntry1
    dw .tilemapEntry2
    dw .tilemapEntry1

;                        ______________________ Control. 80h = write to VRAM tilemap
;                       |   ___________________ Source address
;                       |  |       ____________ Size, Destination address (VRAM)
;                       |  |      |          __ VRAM address increment mode
;                       |  |      |         |
  .tilemapEntry0:
    db $80                                                               ; Control. 80h = write to VRAM tilemap
    dl .tilemap0                                                         ; Source address
    dw $0002,$0504                                                       ; Size, Destination address (VRAM)
    db $00                                                               ; VRAM address increment mode
    db $80                                                               ; Control. 80h = write to VRAM tilemap
    dl .tilemap1                                                         ; Source address
    dw $0002,$0584                                                       ; Size, Destination address (VRAM)
    db $00                                                               ; VRAM address increment mode
    db $00

  .tilemapEntry1:
    db $80                                                               ; Control. 80h = write to VRAM tilemap
    dl .tilemap2                                                         ; Source address
    dw $0002,$0504                                                       ; Size, Destination address (VRAM)
    db $00                                                               ; VRAM address increment mode
    db $80                                                               ; Control. 80h = write to VRAM tilemap
    dl .tilemap3                                                         ; Source address
    dw $0002,$0584                                                       ; Size, Destination address (VRAM)
    db $00                                                               ; VRAM address increment mode
    db $00

  .tilemapEntry2:
    db $80                                                               ; Control. 80h = write to VRAM tilemap
    dl .tilemap4                                                         ; Source address
    dw $0002,$0504                                                       ; Size, Destination address (VRAM)
    db $00                                                               ; VRAM address increment mode
    db $80                                                               ; Control. 80h = write to VRAM tilemap
    dl .tilemap5                                                         ; Source address
    dw $0002,$0584                                                       ; Size, Destination address (VRAM)
    db $00                                                               ; VRAM address increment mode
    db $00

  .tilemap0:
    db $59,$5A

  .tilemap1:
    db $69,$6A

  .tilemap2:
    db $8A,$8B

  .tilemap3:
    db $8C,$8D

  .tilemap4:
    db $8E,$8F

  .tilemap5:
    db $9D,$9E


;;; $AD27:  ;;;
AnimateMode7RidleyWings:
    LDA.W NMI_FrameCounter
    AND.W #$0007
    BNE .return
    LDA.L $7E802E
    INC
    AND.W #$0001
    STA.L $7E802E
    ASL
    TAY
    LDX.W .pointers,Y
    JSL QueueMode7Transfers

  .return:
    RTS

  .pointers:
    dw .tilemapEntry0
    dw .tilemapEntry1

  .tilemapEntry0:
    db $80                                                               ; Control. 80h = write to VRAM tilemap
    dl .tilemap0                                                         ; Source address
    dw $0004,$000B                                                       ; Size, Destination address (VRAM)
    db $00                                                               ; VRAM address increment mode
    db $80                                                               ; Control. 80h = write to VRAM tilemap
    dl .tilemap2                                                         ; Source address
    dw $000E,$0080                                                       ; Size, Destination address (VRAM)
    db $00                                                               ; VRAM address increment mode
    db $80                                                               ; Control. 80h = write to VRAM tilemap
    dl .tilemap4                                                         ; Source address
    dw $000E,$0100                                                       ; Size, Destination address (VRAM)
    db $00                                                               ; VRAM address increment mode
    db $80                                                               ; Control. 80h = write to VRAM tilemap
    dl .tilemap6                                                         ; Source address
    dw $000C,$0181                                                       ; Size, Destination address (VRAM)
    db $00                                                               ; VRAM address increment mode
    db $80                                                               ; Control. 80h = write to VRAM tilemap
    dl .tilemap8                                                         ; Source address
    dw $000F,$0201                                                       ; Size, Destination address (VRAM)
    db $00                                                               ; VRAM address increment mode
    db $80                                                               ; Control. 80h = write to VRAM tilemap
    dl .tilemapA                                                         ; Source address
    dw $0010,$0280                                                       ; Size, Destination address (VRAM)
    db $00                                                               ; VRAM address increment mode
    db $00

  .tilemapEntry1:
    db $80                                                               ; Control. 80h = write to VRAM tilemap
    dl .tilemap1                                                         ; Source address
    dw $0004,$000B                                                       ; Size, Destination address (VRAM)
    db $00                                                               ; VRAM address increment mode
    db $80                                                               ; Control. 80h = write to VRAM tilemap
    dl .tilemap3                                                         ; Source address
    dw $000E,$0080                                                       ; Size, Destination address (VRAM)
    db $00                                                               ; VRAM address increment mode
    db $80                                                               ; Control. 80h = write to VRAM tilemap
    dl .tilemap5                                                         ; Source address
    dw $000E,$0100                                                       ; Size, Destination address (VRAM)
    db $00                                                               ; VRAM address increment mode
    db $80                                                               ; Control. 80h = write to VRAM tilemap
    dl .tilemap7                                                         ; Source address
    dw $000C,$0181                                                       ; Size, Destination address (VRAM)
    db $00                                                               ; VRAM address increment mode
    db $80                                                               ; Control. 80h = write to VRAM tilemap
    dl .tilemap9                                                         ; Source address
    dw $000F,$0201                                                       ; Size, Destination address (VRAM)
    db $00                                                               ; VRAM address increment mode
    db $80                                                               ; Control. 80h = write to VRAM tilemap
    dl .tilemapB                                                         ; Source address
    dw $0010,$0280                                                       ; Size, Destination address (VRAM)
    db $00                                                               ; VRAM address increment mode
    db $00

  .tilemap0:
    db $00,$01,$02,$03

  .tilemap1:
    db $FF,$FF,$FF,$FF

  .tilemap2:
    db $04,$05,$06,$07,$08,$09,$FF,$FF,$0A,$0B,$0C,$0D,$0E,$0F

  .tilemap3:
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF

  .tilemap4:
    db $10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$1A,$1B,$1C,$A8

  .tilemap5:
    db $FF,$FF,$FF,$FF,$FF,$FF,$20,$17,$AA,$FF,$FF,$FF,$FF,$FF

  .tilemap6:
    db $21,$22,$23,$24,$25,$26,$27,$28,$29,$2A,$2B,$2C

  .tilemap7:
    db $FF,$FF,$FF,$FF,$FF,$26,$27,$28,$FF,$FF,$FF,$FF

  .tilemap8:
    db $FF,$FF,$1D,$1E,$1F,$30,$31,$32,$33,$34,$FF,$FF,$FF,$FF,$FF

  .tilemap9:
    db $91,$92,$93,$94,$95,$30,$31,$32,$96,$97,$98,$99,$9A,$98,$9C

  .tilemapA:
    db $FF,$FF,$FF,$FF,$2E,$2F,$40,$41,$42,$43,$44,$FF,$FF,$FF,$FF,$FF

  .tilemapB:
    db $90,$9F,$A0,$A1,$A2,$A3,$40,$41,$42,$A4,$A5,$A6,$A7,$7D,$83,$2D


;;; $AE4D:  ;;;
CeresRidleyMode7GetawayBackgroundParameters:
    dw $0800,$0800,$0800,$0800,$0800,$0800,$0800,$0800
    dw $0800,$0800,$0800,$0800,$0800,$0800,$0800,$0800
    dw $0800,$0800,$0800,$0800,$0800,$0800,$0800,$0800
    dw $0800,$0800,$0800,$0800,$0800,$0800,$0800,$0800
    dw $07F0,$07E0,$07D0,$07C0,$07B0,$07A0,$0790,$0780
    dw $0770,$0760,$0750,$0740,$0730,$0720,$0710,$0700
    dw $06E0,$06C0,$06A0,$0680,$0660,$0640,$0620,$0600
    dw $05E0,$05C0,$05A0,$0580,$0560,$0540,$0520,$0500
    dw $04E0,$04C0,$04A0,$0480,$0460,$0440,$0430,$0400
    dw $03E0,$03C0,$03A0,$0380,$0360,$0340,$0320,$0300
    dw $02E0,$02C0,$02A0,$0280,$0260,$0240,$0230,$0200
    dw $01E0,$01C0,$01A0,$0180,$0160,$0140,$0120,$0100
    dw $00F0,$00E0,$00D0,$00C0,$00B0,$00A0,$0090,$0080
    dw $0070,$0060,$0050,$0040,$0030,$0020,$0020,$0020
    dw $FFFF


;;; $AF2F: Ceres Ridley getaway Y velocity table ;;;
CeresRidleyGetawayYVelocityTable:
    dw $FFFA,$FFFA,$FFFA,$FFFA,$FFFA,$FFFA,$FFFA,$FFFA
    dw $FFFA,$FFFA,$FFFA,$FFFA,$FFFC,$FFFC,$FFFC,$FFFC
    dw $FFFC,$FFFC,$FFFC,$FFFC,$FFFC,$FFFC,$FFFE,$FFFE
    dw $FFFE,$FFFE,$FFFE,$FFFE,$FFFE,$FFFF,$FFFF,$FFFF
    dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF
    dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0001,$0001,$0001,$0001,$0001,$0001,$0001,$0001
    dw $0002,$0002,$0002,$0002,$0002,$0002,$0002,$0002
    dw $0003,$0004,$0006,$0008,$000A,$000C,$000E,$0010
    dw $0014,$0018,$002C,$0030,$0080,$0100,$0100,$0100


;;; $B00F: Ceres Ridley getaway X velocity table ;;;
CeresRidleyGetawayXVelocityTable:
    dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF
    dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF
    dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF
    dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF
    dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF
    dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF
    dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF
    dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF
    dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF
    dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0001,$0001,$0001,$0001,$0001,$0001,$0001,$0001
    dw $0002,$0002,$0003,$0003,$0004,$0004,$0005,$0005
    dw $0008,$000C,$0010,$0014,$0020,$0020,$0020,$0020


;;; $B0EF:  ;;;
RidleyCeres_UpdateBG12Palette5:
    XBA
    AND.W #$00FF
    ASL
    ASL
    ASL
    ASL
    ASL
    ADC.W #.palette0
    TAY
    LDX.W #$00A2
    LDA.W #$000F
    JSL WriteAColorsFromYtoColorIndexX
    RTS

; BG1/2 palette 5 colours 1..Fh
  .palette0:
    dw $56BA,$41B2,$1447,$0403,$4E15,$3570,$24CB,$1868
    dw $5E5F,$183F,$1014,$031F,$01DA,$00F5,$0C63,$0000

  .palette1:
    dw $4E78,$3D90,$1026,$0402,$45F3,$314F,$20AA,$1447
    dw $561D,$143D,$0C12,$02DD,$01B8,$00D3,$0842,$0000

  .palette2:
    dw $4A56,$356F,$1026,$0002,$41B2,$2D2D,$1CA9,$1447
    dw $51FA,$141A,$0C11,$029A,$0196,$00D2,$0842,$0000

  .palette3:
    dw $4214,$314E,$1025,$0002,$3D90,$290C,$1C88,$1046
    dw $49D8,$1018,$0C10,$0278,$0174,$00B0,$0842,$0000

  .palette4:
    dw $3DF3,$2D2D,$0C25,$0002,$396F,$250B,$1888,$1045
    dw $41B6,$1016,$0C0E,$0236,$0153,$00AF,$0842,$0000

  .palette5:
    dw $39D1,$290C,$0C24,$0002,$314E,$20EA,$1887,$1045
    dw $3D94,$1014,$080D,$0214,$0131,$008E,$0842,$0000

  .palette6:
    dw $318F,$24EA,$0C24,$0001,$2D2C,$1CC9,$1466,$0C24
    dw $3552,$0C12,$080C,$01D2,$010F,$008C,$0421,$0000

  .palette7:
    dw $252C,$1CC8,$0823,$0001,$20E9,$18A7,$1045,$0823
    dw $290E,$080E,$0409,$016E,$00CC,$0069,$0421,$0000

  .palette8:
    dw $1CE8,$1486,$0402,$0001,$18A7,$1065,$0C43,$0822
    dw $1CCA,$080A,$0406,$010A,$0088,$0047,$0421,$0000


;;; $B227: Main AI - enemy $E17F (Ridley) ;;;
MainAI_Ridley:
    LDA.L $7E8008
    SEC
    SBC.W #$0004
    BPL .greaterThan4
    LDA.W #$0000

  .greaterThan4:
    STA.L $7E8008
    JSR HandleRidleySamusInteractionBit
    JSR PowerBombCheck
    PEA .manualReturn-1
    JMP.W ($0FA8)

  .manualReturn:
    LDA.L $7E7804
    BEQ .notActiveNotHoldingSamus
    JSR MakeRidleysWingsAndTailFlashWhenHit
    JSR HandleMovementAndMainBodyWallCollisions
    JSR HandleWingFlapping
    JSR HandleRidleyTailAI
    JSR KillProjectilesWithRidleyTailTip
    JSR DrawRidleyTail
    JSR DrawRidleysWings
    JSR AnimateRidleysRibs
    LDA.L $7E7836
    BEQ .notActiveNotHoldingSamus
    JSR MoveSamusToWithinRidleysClawsIfHolding

  .notActiveNotHoldingSamus:
    JSR DetermineAndSetRidleySpeedAndColorPalette
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $B26F:  ;;;
UNUSED_Ridley_TrySamusGrab_A6B26F:
    LDA.L $7E783C
    ORA.L $7E7836
    BNE .return
    LDX.W #$0004
    LDY.W #$0004
    JSR AttemptToGrabSamus_SkipSpinCheck
    BCS .gotoGrabSamus

  .return:
    RTS

  .gotoGrabSamus:
    JMP GrabSamus
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $B288:  ;;;
RidleyHurtAIMaxTimer:
    dw $0008


;;; $B28A: Time is frozen AI - enemy $E17F (Ridley) ;;;
TimeIsFrozenAI_Ridley:
; The only time is frozen AI in the game!
    LDA.W #$0000
    STA.L $7E8008
    LDA.W #$0001
    STA.W $0FA4                                                          ; fallthrough to HurtAI_Ridley


;;; $B297: Hurt AI - enemy $E17F (Ridley) ;;;
HurtAI_Ridley:
    LDA.W $0FA4
    AND.W #$0001
    BNE .timeIsFrozen
    JSR HandleRidleySamusInteractionBit
    JSR PowerBombCheck
    PEA .manualReturn-1
    JMP.W ($0FA8)

  .manualReturn:
    LDA.L $7E7804
    BEQ .checkHoldingSamus
    JSR HandleMovementAndMainBodyWallCollisions
    JSR HandleWingFlapping
    JSR HandleRidleyTailAI

  .timeIsFrozen:
    JSR KillProjectilesWithRidleyTailTip
    JSR MakeRidleysWingsAndTailFlashWhenHit
    JSR DrawRidleyTail
    JSR DrawRidleysWings
    JSR DetermineAndSetRidleySpeedAndColorPalette
    JSR AnimateRidleysRibs
    LDA.L $7E8008
    CLC
    ADC.W #$0001
    CMP.W RidleyHurtAIMaxTimer
    BMI +
    LDA.W RidleyHurtAIMaxTimer

+   STA.L $7E8008
    LDA.L $7E8008                                                        ; >.<
    CMP.W RidleyHurtAIMaxTimer
    BMI .return

  .checkHoldingSamus:
    LDA.L $7E7836
    BEQ .return
    JSR MoveSamusToWithinRidleysClawsIfHolding

  .return:
    RTL


;;; $B2F3: Ridley function ;;;
Function_Ridley_Startup_Liftoff_FacingRight:
; Startup liftoff, facing right
    LDX.W #$0040
    LDY.W #$0100
    STX.B $12
    STY.B $14
    LDX.W #$0000
    LDY.W #$000E
    JSR AccelerateRidleyTowardDesiredXYPosition_NoDecelerationBoost
    LDA.W #$0008
    STA.B $16
    STA.B $18
    JSL CheckForEnemyCollisionWithRectangle
    BCC .collision
    RTS

  .collision:
    LDA.W #$0001
    STA.L $7E7802
    LDA.W #DetermineAndExecuteNewRidleyAIScript
    STA.W $0FA8                                                          ; fallthrough to DetermineAndExecuteNewRidleyAIScript


;;; $B321: Ridley function ;;;
DetermineAndExecuteNewRidleyAIScript:
; Get new AI script (main battle engine)
    JSR GetNewRidleyAIScript
    JSL GenerateRandomNumber
    AND.W #$0007
    ASL
    TAY
    LDA.B ($12),Y
    STA.W $0FA8
    JMP.W ($0FA8)


;;; $B335:  ;;;
GetNewRidleyAIScript:
; Get new AI script
    LDA.W $0A1F
    AND.W #$00FF
    CMP.W #$0003
    BNE .SamusNotSpinJumping
    LDA.W #CheckIfRidleyBelowHalfHealth_spinJumping
    STA.B $12
    RTS

  .SamusNotSpinJumping:
    LDA.W Enemy.health
    BNE .RidleyNotDead
    LDA.W #CheckIfRidleyBelowHalfHealth_zeroHealth
    STA.B $12
    LDA.L $7E800A
    INC
    STA.L $7E800A
    RTS

  .RidleyNotDead:
    CMP.W #$3840
    BPL .notBelowHalfHealth
    LDY.W #CheckIfRidleyBelowHalfHealth_belowHalfHealth
    STY.B $12
    RTS

  .notBelowHalfHealth:
    JSR CheckIfSamusIsBelowTailbounceThreshold
    BCC .SamusYBelow160
    LDY.W #CheckIfRidleyBelowHalfHealth_SamusYAbove160
    STY.B $12
    RTS

  .SamusYBelow160:
    JSR CheckIfSpinJumpGrapplingDamageBoosting
    BCC CheckIfRidleyBelowHalfHealth
    LDY.W #CheckIfRidleyBelowHalfHealth_notSpinJumpGrappleDamageBoost
    STY.B $12
    RTS


;;; $B37B:  ;;;
CheckIfRidleyBelowHalfHealth:
    LDY.W #.belowHalfHealth
    LDA.W Enemy.health
    CMP.W #$2328
    BPL .notBelowHalf
    LDY.W #.aboveHalfHealth

  .notBelowHalf:
    STY.B $12
    RTS

  .belowHalfHealth:
    dw Function_Ridley_FlyToTailbouncingStartPosition
    dw Function_Ridley_FlyToTailbouncingStartPosition
    dw Function_Ridley_FlyToTailbouncingStartPosition
    dw Function_Ridley_FlyToTailbouncingStartPosition
    dw Function_Ridley_StartUSwoop
    dw Function_Ridley_StartUSwoop
    dw Function_Ridley_StartUSwoop
    dw Function_Ridley_StartUSwoop

  .aboveHalfHealth:
    dw Function_Ridley_StartUSwoop
    dw Function_Ridley_StartUSwoop
    dw Function_Ridley_StartUSwoop
    dw Function_Ridley_StartUSwoop
    dw Function_Ridley_FlyToTailbouncingStartPosition
    dw Function_Ridley_FlyToTailbouncingStartPosition
    dw Function_Ridley_FlyToTailbouncingStartPosition
    dw Function_Ridley_FlyToTailbouncingStartPosition

  .notSpinJumpGrappleDamageBoost:
    dw CheckFor_Deathswoop_PowerBombDodge_MoveToCenter_RamGrabSamus
    dw CheckFor_Deathswoop_PowerBombDodge_MoveToCenter_RamGrabSamus
    dw CheckFor_Deathswoop_PowerBombDodge_MoveToCenter_RamGrabSamus
    dw CheckFor_Deathswoop_PowerBombDodge_MoveToCenter_RamGrabSamus
    dw CheckFor_Deathswoop_PowerBombDodge_MoveToCenter_RamGrabSamus
    dw CheckFor_Deathswoop_PowerBombDodge_MoveToCenter_RamGrabSamus
    dw Function_Ridley_FlyToTailbouncingStartPosition
    dw Function_Ridley_FlyToTailbouncingStartPosition

  .SamusYAbove160:
    dw Function_Ridley_FlyToTailbouncingStartPosition
    dw Function_Ridley_FlyToTailbouncingStartPosition
    dw Function_Ridley_FlyToTailbouncingStartPosition
    dw Function_Ridley_FlyToTailbouncingStartPosition
    dw Function_Ridley_FlyToTailbouncingStartPosition
    dw Function_Ridley_FlyToTailbouncingStartPosition
    dw Function_Ridley_FlyToTailbouncingStartPosition
    dw Function_Ridley_FlyToTailbouncingStartPosition

  .spinJumping:
    dw Function_Ridley_ConsiderTailbouncing
    dw Function_Ridley_ConsiderTailbouncing
    dw Function_Ridley_ConsiderTailbouncing
    dw Function_Ridley_ConsiderTailbouncing
    dw Function_Ridley_ConsiderTailbouncing
    dw Function_Ridley_ConsiderTailbouncing
    dw Function_Ridley_ConsiderTailbouncing
    dw Function_Ridley_ConsiderTailbouncing

  .zeroHealth:
    dw CheckFor_Deathswoop_PowerBombDodge_MoveToCenter_RamGrabSamus
    dw CheckFor_Deathswoop_PowerBombDodge_MoveToCenter_RamGrabSamus
    dw CheckFor_Deathswoop_PowerBombDodge_MoveToCenter_RamGrabSamus
    dw CheckFor_Deathswoop_PowerBombDodge_MoveToCenter_RamGrabSamus
    dw CheckFor_Deathswoop_PowerBombDodge_MoveToCenter_RamGrabSamus
    dw CheckFor_Deathswoop_PowerBombDodge_MoveToCenter_RamGrabSamus
    dw CheckFor_Deathswoop_PowerBombDodge_MoveToCenter_RamGrabSamus
    dw CheckFor_Deathswoop_PowerBombDodge_MoveToCenter_RamGrabSamus


;;; $B3EC: Ridley function ;;;
Function_Ridley_InitializeMovementToCenter:
; Initailize movement to center
    LDA.W #Function_Ridley_MoveToCenterSide
    STA.W $0FA8
    LDA.W #$0080
    STA.W $0FB2                                                          ; fallthrough to Function_Ridley_MoveToCenterSide


;;; $B3F8: Ridley function ;;;
Function_Ridley_MoveToCenterSide:
; Move to center side
    DEC.W $0FB2
    BMI .collision
    LDX.W #$00C0
    LDA.L $7E7820
    BEQ .facingLeft
    LDX.W #$0060

  .facingLeft:
    STX.B $12
    LDY.W #$0100
    STY.B $14
    JSR GetRidleyAccelerationDivisorIndex
    LDX.W #$0000
    JSR AccelerateRidleyTowardDesiredXYPosition_NoDecelerationBoost
    LDA.W #$0008
    STA.B $16
    STA.B $18
    JSL CheckForEnemyCollisionWithRectangle
    BCC .collision
    RTS

  .collision:
    LDA.W #DetermineAndExecuteNewRidleyAIScript
    STA.W $0FA8
    RTS


;;; $B42E:  ;;;
GetRidleyAccelerationDivisorIndex:
; Y = 4, 8, A, or C, depending on general speed byte
    LDA.L $7E7824
    ASL
    TAY
    LDA.W .accelerationDivisorIndex,Y
    TAY
    RTS

  .accelerationDivisorIndex:
    dw $0004,$0008,$000A,$000C


;;; $B441: Ridley function ;;;
Function_Ridley_StartUSwoop:
; Chose to do a U swoop
    LDA.W #Function_Ridley_FlyToUSwoopStartingPosition
    STA.W $0FA8
    LDA.W #$000A
    STA.L $7E7800
    LDA.W #$0000
    STA.L $7E7814                                                        ; fallthrough to Function_Ridley_FlyToUSwoopStartingPosition


;;; $B455: Ridley function ;;;
Function_Ridley_FlyToUSwoopStartingPosition:
; Fly to U swoop start
    LDX.W #$00C0
    LDA.L $7E7820
    BEQ .facingLeft
    LDX.W #$0040

  .facingLeft:
    STX.B $12
    LDY.W #$0080
    STY.B $14
    LDX.W #$0000
    LDY.W #$0001
    JSR AccelerateRidleyTowardDesiredXYPosition_NoDecelerationBoost
    LDA.W #$0008
    STA.B $16
    STA.B $18
    JSL CheckForEnemyCollisionWithRectangle
    BCS .return
    LDA.W #Function_Ridley_USwoop_FirstDive
    STA.W $0FA8
    LDA.W #$0020
    STA.L $7E7800
    LDA.W #$0000
    STA.L $7E7814

  .return:
    RTS


;;; $B493: Ridley function ;;;
Function_Ridley_USwoop_FirstDive:
; U swoop, first dive
    LDA.L $7E7820
    BNE .notFacingLeft
    LDA.W #$FFE0
    STA.B $12
    LDA.W #$FE00
    STA.B $14
    BRA +

  .notFacingLeft:
    LDA.W #$0020
    STA.B $12
    LDA.W #$0200
    STA.B $14

+   LDA.W #$0480
    STA.B $16
    JSR UpdateRidleysUSwoopSpeedAndAngle
    LDA.L $7E7800
    BEQ .timerExpired
    DEC
    STA.L $7E7800
    RTS

  .timerExpired:
    LDA.W #Function_Ridley_USwoop_DiveToHalfwayPoint
    STA.W $0FA8
    LDA.W #$0014
    STA.L $7E7800
    RTS


;;; $B4D1: Ridley function ;;;
Function_Ridley_USwoop_DiveToHalfwayPoint:
; U swoop, dive to half point
    LDA.L $7E7820
    BNE .facingRight
    LDA.W #$FEC0
    STA.B $12
    LDA.W #$C000
    STA.B $14
    BRA +

  .facingRight:
    LDA.W #$0140
    STA.B $12
    LDA.W #$4000
    STA.B $14

+   LDA.W #$0500
    STA.B $16
    JSR UpdateRidleysUSwoopSpeedAndAngle
    LDA.L $7E7800
    BEQ .timerExpired
    DEC
    STA.L $7E7800
    RTS

  .timerExpired:
    LDA.W #Function_Ridley_USwoop_ClimbAfterHalfwayPoint
    STA.W $0FA8
    LDA.W #$0010
    STA.L $7E7800
    LDA.W #$0001
    STA.L $7E2004
    RTS


;;; $B516: Ridley function ;;;
Function_Ridley_USwoop_ClimbAfterHalfwayPoint:
; U swoop, climb after half point
    LDA.L $7E7820
    BNE .facingRight
    LDA.W #$FE00
    STA.B $12
    LDA.W #$8800
    STA.B $14
    BRA +

  .facingRight:
    LDA.W #$0200
    STA.B $12
    LDA.W #$7800
    STA.B $14

+   LDA.W #$0300
    STA.B $16
    JSR UpdateRidleysUSwoopSpeedAndAngle
    LDA.L $7E7800
    BEQ .timerExpired
    DEC
    STA.L $7E7800
    RTS

  .timerExpired:
    LDA.W #Function_Ridley_USwoop_FinalClimb
    STA.W $0FA8
    LDA.W #$0020
    STA.L $7E7800
    RTS


;;; $B554: Ridley function ;;;
Function_Ridley_USwoop_FinalClimb:
; U Swoop, still climbing
    LDA.L $7E7820
    BNE .facingRight
    LDA.W #$FC00
    STA.B $12
    LDA.W #$8800
    STA.B $14
    BRA +

  .facingRight:
    LDA.W #$0400
    STA.B $12
    LDA.W #$7800
    STA.B $14

+   LDA.W #$0300
    STA.B $16
    JSR UpdateRidleysUSwoopSpeedAndAngle
    LDA.L $7E7800
    BEQ .timerExpired
    DEC
    STA.L $7E7800
    RTS

  .timerExpired:
    LDA.W #Function_Ridley_USwoop_End
    STA.W $0FA8
    LDA.W #$0020
    STA.L $7E7800
    JMP TurnAroundIfFacingAwayFromRoomCenter


;;; $B594: Ridley function ;;;
Function_Ridley_USwoop_End:
; U Swoop End (Chooses CheckFor_Deathswoop_PowerBombDodge_MoveToCenter_RamGrabSamus for next script if Samus is not spinjumping, else DetermineAndExecuteNewRidleyAIScript)
    STZ.B $12
    LDA.W #$8000
    STA.B $14
    LDA.W #$01C0
    STA.B $16
    JSR UpdateRidleysUSwoopSpeedAndAngle
    LDA.L $7E7800
    BEQ .timerExpired
    DEC
    STA.L $7E7800
    RTS

  .timerExpired:
    JSR CheckIfSpinJumpGrapplingDamageBoosting
    LDY.W #DetermineAndExecuteNewRidleyAIScript
    BCC +
    LDY.W #CheckFor_Deathswoop_PowerBombDodge_MoveToCenter_RamGrabSamus

+   STY.W $0FA8
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $B5BE:  ;;;
UNUSED_A6B5BE:
    dw $FFE0,$0000,$0020
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $B5C4: Ridley function ;;;
Function_Ridley_ConsiderTailbouncing:
; Consider tailbouncing
    LDA.W #$000B
    STA.L $7E201E
    LDA.W #$0180
    STA.L $7E2012
    LDA.W #Function_Ridley_ConsideringTailbouncing
    STA.W $0FA8
    LDA.W RandomNumberSeed
    AND.W #$001F
    CLC
    ADC.W #$0020
    STA.W $0FB2                                                          ; fallthrough to Function_Ridley_ConsideringTailbouncing


;;; $B5E5: Ridley function ;;;
Function_Ridley_ConsideringTailbouncing:
    LDA.L $7E7820
    ASL
    TAY
    LDA.W .targetXPosition,Y
    STA.B $12
    JSR FlyTowardTargetXPositionAndSamusYPosition
    BCC .spinJumping
    JMP SetupRidleyTailForTailbouncing

  .spinJumping:
    DEC.W $0FB2
    BPL .return
    LDA.W #Function_Ridley_HoverWhileSamusIsSpinJumping
    STA.W $0FA8
    LDA.W #$0080
    STA.W $0FB2
    JMP TurnAroundIfFacingAwayFromRoomCenter

  .return:
    RTS

  .targetXPosition:
; target X positions, indexed by facing direction: left, turning, right
    dw $00C0,$0080,$0040


;;; $B613: Ridley function ;;;
Function_Ridley_HoverWhileSamusIsSpinJumping:
; Hover since Samus is spinjumping
    LDA.L $7E7820
    ASL
    TAY
    LDA.W .targetXPosition,Y
    STA.B $12
    JSR FlyTowardTargetXPositionAndSamusYPosition
    BCC .spinJumping
    JMP SetupRidleyTailForTailbouncing

  .spinJumping:
    DEC.W $0FB2
    BPL .return
    LDA.W #Function_Ridley_ConsideringTailbouncing
    STA.W $0FA8
    LDA.W #$0080
    STA.W $0FB2
    JMP TurnAroundIfFacingAwayFromRoomCenter

  .return:
    RTS

  .targetXPosition:
; target X positions, indexed by facing direction: left, turning, right
    dw $0040,$0080,$00C0


;;; $B641:  ;;;
FlyTowardTargetXPositionAndSamusYPosition:
; Fly towards $12 (X position) / Samus's Y position
; If Samus is not spin jumping, SEC before RTS. Else CLC and randomly fireball if allowed.
    LDA.W SamusYPosition
    CMP.W #$0160
    BMI .minY160
    LDA.W #$0160

  .minY160:
    STA.B $14
    LDX.W #$0000
    JSR GetRidleyAccelerationDivisorIndex
    JSR AccelerateRidleyTowardDesiredXYPosition_NoDecelerationBoost
    LDA.W #$0001
    STA.L $7E2004
    LDA.W $0A1F
    AND.W #$00FF
    CMP.W #$0003
    BNE .returnSamusSpinJumping
    LDA.W RandomNumberSeed
    AND.W #$00FF
    CMP.W #$0080
    BCC .returnSamusNotSpinJumping
    LDA.L $7E781E
    BNE .returnSamusNotSpinJumping
    LDA.L $7E7820
    DEC
    BEQ .returnSamusNotSpinJumping
    LDA.W #InstList_Ridley_FacingLeft_Fireballing_0
    JSR SetRidleyInstList

  .returnSamusNotSpinJumping:
    CLC
    RTS

  .returnSamusSpinJumping:
    SEC
    RTS


;;; $B68B:  ;;;
SetupRidleyTailForTailbouncing:
    LDA.W #$00F0
    STA.L $7E2012
    LDA.W #$0010
    STA.L $7E201E
    LDA.W #$0001
    STA.L $7E2000
    LDA.W #Function_Ridley_FlyToTailbouncingStartPosition
    STA.W $0FA8
    RTS


;;; $B6A7: Ridley function ;;;
Function_Ridley_FlyToTailbouncingStartPosition:
; Fly to start Tailbouncing
    LDA.W $0F7E
    CMP.W #$0120
    BMI .startTailbouncing
    LDA.L $7E7820
    ASL
    TAY
    LDA.W .targetXPositions,Y
    STA.B $12
    LDA.W #$0120
    STA.B $14
    LDX.W #$0000
    LDY.W #$0000
    JMP AccelerateRidleyTowardDesiredXYPosition_NoDecelerationBoost

  .targetXPositions:
    dw $00B0,$0080,$0060

  .startTailbouncing:
    JSR TurnAroundIfFacingAwayFromRoomCenter
    LDA.W #Function_Ridley_StartTailbouncing
    STA.W $0FA8
    LDA.W #$0020
    STA.W $0FB2                                                          ; fallthrough to Function_Ridley_StartTailbouncing


;;; $B6DD: Ridley function ;;;
Function_Ridley_StartTailbouncing:
; Start tailbouncing
    LDA.W $0F7A
    STA.B $12
    LDA.W #$0120
    STA.B $14
    LDX.W #$0000
    LDY.W #$0000
    JSR AccelerateRidleyTowardDesiredXYPosition_NoDecelerationBoost
    DEC.W $0FB2
    BPL .return
    JSR Function_RidleyTail_StartTailbouncing
    JSR SetSpeedsForTailbouncing
    LDA.W #Function_Ridley_Tailbouncing_AttemptToGrabSamus
    STA.W $0FA8
    LDA.W RandomNumberSeed
    AND.W #$003F
    ADC.W #$0080
    STA.W $0FB2

  .return:
    RTS


;;; $B70E: Ridley function ;;;
Function_Ridley_Tailbouncing_AttemptToGrabSamus:
; Main tailbouncing
    JSR AttemptToGrabSamus
    BCC .grabFailed
    JSR RidleyGrabbedSamus_ResetTailAI
    JMP GrabbingSamus_SetMinimumYSpeed_ResetTailAI

  .return:
    RTS

  .grabFailed:
    LDA.W $0FAC
    CLC
    ADC.L $7E200C
    CMP.W #$0600
    BMI .minimum600
    LDA.W #$0600

  .minimum600:
    STA.W $0FAC
    JSR CheckForTailbounceCollisionWithSolidBlock
    BCC .return
    LDA.L $7E20A4
    STA.B $12
    LDA.L $7E20A6
    CLC
    ADC.W #$000C
    STA.B $14
    LDA.W #$0009
    LDY.W #EnemyProjectile_MiscDust
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W #$0076
    JSL QueueSound_Lib2_Max6
    LDA.W #$000D
    STA.W EarthquakeType
    LDA.W #$0004
    STA.W EarthquakeTimer
    JSR CheckForTurnaroundDuringTailbounce_RandomlyChangeDirection
    JSR SetSpeedsForTailbouncing
    LDX.W #InitializeTailParts_distanceFromRidleyToTailParts
    LDY.W #$2026
    JSR UpdateTailPartRAMFromXToY
    LDA.W #$0C00
    STA.L $7E2028
    STA.L $7E203C
    STA.L $7E2050
    STA.L $7E2064
    STA.L $7E2078
    STA.L $7E208C
    STA.L $7E20A0
    LDA.W #$0004
    STA.L $7E2000
    LDA.L $7E800C
    INC
    CMP.W #$0002
    BMI .everyOtherBounce
    LDA.L $7E7820
    DEC
    BEQ .RidleyTurning
    LDA.W #InstList_Ridley_FacingLeft_Fireballing_0
    JSR SetRidleyInstList

  .RidleyTurning:
    LDA.W #$0000

  .everyOtherBounce:
    STA.L $7E800C
    LDA.W #Function_Ridley_Tailbouncing_HitGround
    STA.W $0FA8
    RTS


;;; $B7B9: Ridley function ;;;
Function_Ridley_Tailbouncing_HitGround:
; Tailbouncing, hit ground
    JSR CheckIfSamusIsBelowTailbounceThreshold
    BCC .nextFunction
    DEC.W $0FB2
    BMI .nextFunction
    LDA.W $0FAC
    CLC
    ADC.L $7E200E
    STA.W $0FAC
    BMI .return
    LDA.W #$0000
    STA.W $0FAC
    LDA.W #Function_Ridley_Tailbouncing_AttemptToGrabSamus
    STA.W $0FA8

  .return:
    RTS

  .nextFunction:
    JSR RidleyGrabbedSamus_ResetTailAI
    LDA.W #DetermineAndExecuteNewRidleyAIScript
    STA.W $0FA8
    RTS


;;; $B7E7:  ;;;
CheckForTailbounceCollisionWithSolidBlock:
    LDA.L $7E20A4
    TAX
    LDA.L $7E20A6
    CLC
    ADC.W #$0010
    TAY
    JSL CheckForCollisionWithNonAirBlock
    BCS .return
    LDA.L $7E2090
    TAX
    LDA.L $7E2092
    CLC
    ADC.W #$0012
    TAY
    JSL CheckForCollisionWithNonAirBlock
    BCS .return
    LDA.L $7E207C
    TAX
    LDA.L $7E207E
    CLC
    ADC.W #$0012
    TAY
    JSL CheckForCollisionWithNonAirBlock
    BCS .return
    LDA.L $7E2068
    TAX
    LDA.L $7E206A
    CLC
    ADC.W #$0012
    TAY
    JSL CheckForCollisionWithNonAirBlock
    BCS .return
    LDA.L $7E2054
    TAX
    LDA.L $7E2056
    CLC
    ADC.W #$0012
    TAY
    JSL CheckForCollisionWithNonAirBlock
    BCS .return
    NOP                                                                  ; >.<

  .return:
    RTS


;;; $B84D:  ;;;
RidleyGrabbedSamus_ResetTailAI:
    LDA.W #$0001
    STA.L $7E2000
    STA.L $7E2014
    RTS


;;; $B859:  ;;;
AttemptToGrabSamus:
; Attempt to grab Samus
    JSR CheckIfSpinJumpGrapplingDamageBoosting
    BCS .grab
    RTS

  .grab:
    LDX.W #$0004
    LDY.W #$0004                                                         ; fallthrough to AttemptToGrabSamus_SkipSpinCheck


AttemptToGrabSamus_SkipSpinCheck:
    STX.B $16
    STY.B $18
    LDA.L $7E7820
    ASL
    TAY
    LDA.W HoldingSamusXDispacement,Y
    CLC
    ADC.W $0F7A
    STA.B $12
    LDA.L $7E783A
    TAY
    LDA.W HoldingSamusYDispacement,Y
    CLC
    ADC.W $0F7E
    STA.B $14
    JMP EfficientCollisionDetectionForSamusAt_12_14


;;; $B889:  ;;;
GrabbingSamus_SetMinimumYSpeed_ResetTailAI:
    LDA.W $0FAC
    BMI +
    EOR.W #$FFFF
    INC

+   CMP.W #$FE00
    BMI +
    LDA.W #$FE00

+   STA.W $0FAC
    JSR RidleyGrabbedSamus_ResetTailAI
    LDA.W #Function_Ridley_InPositionToGrabSamus_NoPowerBomb
    STA.W $0FA8
    JMP Function_Ridley_InPositionToGrabSamus_NoPowerBomb


;;; $B8A9:  ;;;
CheckForTurnaroundDuringTailbounce_RandomlyChangeDirection:
    LDA.W $0FAA
    BNE .storeXSpeed
    LDA.W #$00C0
    BIT.W $0F79
    BPL +
    EOR.W #$FFFF
    INC

+   STA.W $0FAA

  .storeXSpeed:
    LDA.W $0F7A
    SEC
    SBC.W SamusXPosition
    EOR.W $0FAA
    BMI +
    LDA.W $0F7A
    CMP.L $7E8004
    BMI .crossedLeftBoundary
    CMP.L $7E8006
    BPL .crossedRightBoundary
    LDA.W RandomNumberSeed
    CMP.W #$0555
    BCC .return

  .changeDirection:
    LDA.W $0FAA
    EOR.W #$FFFF
    INC
    STA.W $0FAA

  .return:
    RTS

+   LDA.W $0F7A
    CMP.L $7E8004
    BMI .crossedLeftBoundary
    CMP.L $7E8006
    BPL .crossedRightBoundary
    LDA.W RandomNumberSeed
    CMP.W #$0555
    BCC .changeDirection
    RTS

  .crossedLeftBoundary:
    LDA.W $0FAA
    BMI .changeDirection
    RTS

  .crossedRightBoundary:
    LDA.W $0FAA
    BPL .changeDirection
    RTS


;;; $B90F:  ;;;
SetSpeedsForTailbouncing:
; Set speeds for tailbouncing (depends on random and speed
    LDA.W RandomNumberSeed
    AND.W #$0003
    ASL
    TAY
    LDA.W .XSpeedPointers,Y
    STA.B $12
    LDA.W .YSpeedPointers,Y
    STA.B $14
    LDA.L $7E7824
    CLC
    ADC.W #$0002
    ASL
    TAY
    LDA.W .acceleration,Y
    STA.L $7E200E
    LDA.W .store7E200C,Y
    STA.L $7E200C
    LDA.B ($14),Y
    STA.W $0FAC
    LDA.B ($12),Y
    LDX.W $0FAA
    BPL +
    EOR.W #$FFFF
    INC

+   STA.W $0FAA
    RTS

  .acceleration:
; tailbouncing accel/delays?/thresholds?, indexed by Ridley speedup ($7E7824)
    dw $000A,$0010,$0020,$0030,$0040,$0050
  .store7E200C:
    dw $0010,$0020,$0040,$0080,$0400,$0500

; speed table pointers, indexed randomly
  .XSpeedPointers:
    dw .randomXSpeed0
    dw .randomXSpeed1
    dw .randomXSpeed2
    dw .randomXSpeed3
  .YSpeedPointers:
    dw .randomYSpeed0
    dw .randomYSpeed1
    dw .randomYSpeed2
    dw .randomYSpeed3

  .randomXSpeed0:
    dw $0058,$0070,$00A0,$00A8,$00B0,$00B8                               ; slow

  .randomXSpeed1:
    dw $0078,$0090,$00C0,$00C8,$00D0,$00D8

  .randomXSpeed2:
    dw $0098,$00B0,$00E0,$00E8,$00F0,$00F8

  .randomXSpeed3:
    dw $00B8,$00D0,$0100,$0108,$0110,$0118                               ; fast

  .randomYSpeed0:
    dw $FE60,$FDE0,$FCE0,$FC20,$FA80,$F980                               ; slow

  .randomYSpeed1:
    dw $FE00,$FD80,$FC80,$FBC0,$FA60,$F960

  .randomYSpeed2:
    dw $FDE0,$FD60,$FC60,$FB80,$FA40,$F940

  .randomYSpeed3:
    dw $FDC0,$FD40,$FC40,$FB60,$FA20,$F920                               ; fast


;;; $B9D5:  ;;;
HoldingSamusXDispacement:
; indexed by Ridley facing direction: left, turning, right
    dw $000C,$0000,$FFF4

HoldingSamusYDispacement:
; indexed by $7E783A, which is always 0 in Norfair and never read in Ceres
    dw $0023,$002E,$0038


;;; $B9E1:  ;;;
MoveSamusToWithinRidleysClawsIfHolding:
; If holding Samus, move Samus to within Ridley's claws
    LDA.L $7E7828
    BEQ .noSamusXDisplacement
    STA.B $12
    BPL +
    EOR.W #$FFFF
    INC

+   SEC
    SBC.W #$0004
    BPL .positive
    LDA.W #$0000
    BRA +

  .positive:
    BIT.B $12
    BPL +
    EOR.W #$FFFF
    INC

+   STA.L $7E7828

  .noSamusXDisplacement:
    LDA.L $7E782A
    BEQ .noSamusYDisplacement
    STA.B $12
    BPL +
    EOR.W #$FFFF
    INC

+   SEC
    SBC.W #$0004
    BPL .positive2
    LDA.W #$0000
    BRA +

  .positive2:
    BIT.B $12
    BPL +
    EOR.W #$FFFF
    INC

+   STA.L $7E782A

  .noSamusYDisplacement:
    LDA.L $7E7820
    ASL
    TAY
    LDA.W HoldingSamusXDispacement,Y
    ADC.W $0F7A
    CLC
    ADC.L $7E7828
    STA.W SamusXPosition
    LDA.L $7E783A
    TAY
    LDA.W HoldingSamusYDispacement,Y
    CLC
    ADC.W $0F7E
    CLC
    ADC.L $7E782A
    STA.W SamusYPosition
    RTS


;;; $BA54:  ;;;
SetDisplacementForRidleyGrabbingSamus:
; Set displacement for Ridley grabbing Samus
    LDA.L $7E7820
    ASL
    TAY
    LDA.W HoldingSamusXDispacement,Y
    ADC.W $0F7A
    SEC
    SBC.W SamusXPosition
    EOR.W #$FFFF
    INC
    STA.L $7E7828
    LDA.L $7E783A
    TAY
    LDA.W HoldingSamusYDispacement,Y
    CLC
    ADC.W $0F7E
    SEC
    SBC.W SamusYPosition
    EOR.W #$FFFF
    INC
    STA.L $7E782A
    RTS


;;; $BA85:  ;;;
CheckIfRidleyIsReadyToExplode:
    LDA.L $7E800A
    CMP.W #$000A
    BMI .notDead
    JSL SetRidleyAsDead
    LDA.W #Function_Ridley_FinalRoar
    STA.W $0FA8
    JMP Function_Ridley_FinalRoar

  .notDead:
    LDA.W $0CEE
    BEQ .noPowerBomb
    LDA.W #Function_Ridley_DodgingPowerbomb_MaybeHoldingSamus
    STA.W $0FA8
    JMP Function_Ridley_DodgingPowerbomb_MaybeHoldingSamus

  .noPowerBomb:
    LDA.W #Function_Ridley_InitializeMovementToCenter
    STA.W $0FA8
    LDA.W #$0001
    STA.L $7E2004
    RTS


;;; $BAB7: Ridley function ;;;
CheckFor_Deathswoop_PowerBombDodge_MoveToCenter_RamGrabSamus:
; Check to do Deathswoop/Powerbomb dodge/Move-to-Center, or attempt to ram/grab Samus
; Deathswoop/Powerbomb dodge/Move if:
;     Samus is spinjumping, Ridley has collided with a wall, Samus is behind or above Ridley
    JSR CheckIfSpinJumpGrapplingDamageBoosting
    BCC CheckIfRidleyIsReadyToExplode
    LDA.L $7E783E
    BNE CheckIfRidleyIsReadyToExplode
    LDA.L $7E7820
    ASL
    TAY
    LDA.W .signedBitmask,Y
    STA.B $12
    LDA.W $0F7A
    SEC
    SBC.W SamusXPosition
    STA.B $14
    EOR.B $12
    BPL +
    LDA.B $14
    BPL .positive
    EOR.W #$FFFF
    INC

  .positive:
    CMP.W #$0020
    BPL CheckIfRidleyIsReadyToExplode

+   LDA.W $0F7E
    CLC
    ADC.W #$0023
    SEC
    SBC.W SamusYPosition
    BPL CheckIfRidleyIsReadyToExplode
    LDX.W #$FFF0
    LDA.L $7E7820
    BEQ .facingLeft
    LDX.W #$0010

  .facingLeft:
    TXA
    CLC
    ADC.W SamusXPosition
    STA.B $12
    LDA.W SamusYPosition
    CLC
    ADC.W #$FFFC
    STA.B $14
    LDX.W #$0000
    LDA.L $7E7824
    ASL
    TAY
    LDA.W .accelerationDivisorIndex,Y
    TAY
    JSR AccelerateRidleyTowardDesiredXYPosition_NoDecelerationBoost
    LDA.L $7E7820
    ASL
    TAY
    LDA.W HoldingSamusXDispacement,Y
    CLC
    ADC.W $0F7A
    STA.B $12
    LDA.W #$0023
    CLC
    ADC.W $0F7E
    STA.B $14
    LDA.W #$0008
    STA.B $16
    LDA.W #$000C
    STA.B $18
    JSR EfficientCollisionDetectionForSamusAt_12_14
    BCS .collision
    RTS

  .signedBitmask:
; indexed by Ridley facing direction
; left, turning, right
    dw $0000,$0000,$8000

  .accelerationDivisorIndex:
; acceleration divisor index
    dw $0001,$0003,$0007,$000A

  .collision:
    LDA.W $0FAC
    EOR.W #$FFFF
    INC
    STA.W $0FAC
    LDA.W Enemy.health
    BEQ .dead
    LDA.W $0CEE
    LDA.W $0CEE
    BEQ Function_Ridley_InPositionToGrabSamus_NoPowerBomb
    JSR GrabSamus
    LDA.W #Function_Ridley_DodgingPowerbomb_MaybeHoldingSamus
    STA.W $0FA8
    JMP Function_Ridley_DodgingPowerbomb_MaybeHoldingSamus

  .dead:
    LDA.L $7E7836
    BNE .holdingSamus
    JSR GrabSamus

  .holdingSamus:
    JSL SetRidleyAsDead
    LDA.W #Function_Ridley_MoveToDeathSpot
    STA.W $0FA8
    JMP Function_Ridley_MoveToDeathSpot


;;; $BB8F: Ridley function ;;;
Function_Ridley_InPositionToGrabSamus_NoPowerBomb:
; Ridley in position to grab Samus, no powerbombs
    LDA.L $7E7820
    ASL
    TAY
    LDA.W TargetXPositionHoldingSamus,Y
    STA.L $7E782E
    LDA.W $0F7E
    CLC
    ADC.W #$FFC0
    CMP.W #$0100
    BPL .minimum100
    LDA.W #$0100

  .minimum100:
    STA.L $7E7830
    LDA.L $7E7836
    BNE .holdingSamus
    JSR GrabSamus

  .holdingSamus:
    LDA.W #Function_Ridley_HoldingSamus_MoveTowardTargetPosition
    STA.W $0FA8
    LDA.W #$0020
    STA.W $0FB2                                                          ; fallthrough to Function_Ridley_HoldingSamus_MoveTowardTargetPosition


;;; $BBC4: Ridley function ;;;
Function_Ridley_HoldingSamus_MoveTowardTargetPosition:
; Ridley is holding Samus, move towards target position then go to next script
    LDA.L $7E782E
    STA.B $12
    LDA.L $7E7830
    STA.B $14
    LDX.W #$0000
    LDY.W #$0000
    JSR AccelerateRidleyTowardDesiredXYPosition_NoDecelerationBoost
    DEC.W $0FB2
    BPL .return
    LDA.W #Function_Ridley_DropSamus
    STA.W $0FA8
    LDA.W #$0020
    STA.W $0FB2

  .return:
    RTS


TargetXPositionHoldingSamus:
; target X when holding Samus
    dw $0040,$0000,$00D0


;;; $BBF1: Ridley function ;;;
Function_Ridley_DropSamus:
; Drop Samus
    DEC.W $0FB2
    BMI .release
    LDA.L $7E782E
    STA.B $12
    LDA.W #$0100
    STA.B $14
    LDX.W #$0000
    LDY.W #$0000
    JMP AccelerateRidleyTowardDesiredXYPosition_NoDecelerationBoost

  .release:
    LDA.W #$0008
    STA.L $7E201E
    LDA.W #$00F0
    STA.L $7E2012
    JSR ReleaseSamus
    LDA.W #Function_Ridley_FallBackIntoPositionAfterDroppingSamus
    STA.W $0FA8
    LDA.W #$0040
    STA.W $0FB2
    RTS


if !FEATURE_KEEP_UNREFERENCED
UNUSED_A6BC28:
    dw $00B0,$0000,$0050
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $BC2E: Ridley function ;;;
Function_Ridley_FallBackIntoPositionAfterDroppingSamus:
; Short time after dropping Samus, before returning to DetermineAndExecuteNewRidleyAIScript
    DEC.W $0FB2
    BMI .timerExpired
    LDA.L $7E7820
    ASL
    TAY
    LDA.W .targetXPositions,Y
    STA.B $12
    LDA.W #$00E0
    STA.B $14
    LDX.W #$0000
    LDY.W #$0000
    JSR AccelerateRidleyTowardDesiredXYPosition_NoDecelerationBoost
    RTS

  .timerExpired:
    LDA.W #$0010
    STA.L $7E201E
    LDA.W #$00F0
    STA.L $7E2012
    LDA.W #DetermineAndExecuteNewRidleyAIScript
    STA.W $0FA8
    RTS

  .targetXPositions:
; indexed by facing direction: left, turning, right
    dw $00B0,$0000,$0050


;;; $BC68:  ;;;
GrabSamus:
; Grab Samus
    JSR SetDisplacementForRidleyGrabbingSamus
    LDA.W $0F86
    ORA.W #$0400
    STA.W $0F86
    LDA.W #$0001
    STA.L $7E7836
    DEC
    JSL Run_Samus_Command
    SEC
    JMP TransferGraphicsForRidleysClawsHoldingSamusOrBabyMetroid


;;; $BC84:  ;;;
ReleaseSamus:
; Release Samus
    LDA.W #$0001
    STA.L $7E2004
    STA.L $7E2000
    LDA.L $7E7802
    BMI .dead
    JSR CheckIfSpinJumpGrapplingDamageBoosting
    LDA.W #$0006
    BVS +
    LDA.W #$000A

+   STA.L $7E783C

  .dead:
    LDA.W #$0000
    STA.L $7E7836
    INC
    JSL Run_Samus_Command
    CLC
    JMP TransferGraphicsForRidleysClawsHoldingSamusOrBabyMetroid


;;; $BCB4:  ;;;
HandleRidleySamusInteractionBit:
; Handles Enemy/Samus interaction bit
    LDA.L $7E7802
    BMI .return
    BEQ .ridleyInactive
    JSR CheckIfRidleyIsOnScreen
    BCC .onScreen
    LDA.W $0F86
    ORA.W #$0400
    STA.W $0F86
    RTS

  .onScreen:
    LDA.W $0F86
    AND.W #$FBFF
    STA.W $0F86

  .ridleyInactive:
    LDA.L $7E783C
    BEQ .return
    DEC
    STA.L $7E783C
    BNE .return
    LDA.L $7E7802
    BMI .return
    LDA.W $0F86
    AND.W #$FBFF
    STA.W $0F86

  .return:
    RTS


;;; $BCF1:  ;;;
CheckIfSpinJumpGrapplingDamageBoosting:
; CLC if spin jump, grappling, or spin back from hurt
    LDA.W $0A1F
    AND.W #$00FF
    PHX
    TAX
    BIT.W .movementTypes_minus1,X
    BMI .notSpinGrappleDamage
    PLX
    CLC
    RTS

  .notSpinGrappleDamage:
    PLX
    SEC

  .movementTypes_minus1:
    RTS

  .movementTypes:
; indexed by movement type
; minus 1 trick to get target into high byte
    db $80 ; 0: Standing
    db $80 ; 1: Running
    db $80 ; 2: Normal jumping
    db $00 ; 3: Spin jumping
    db $FF ; 4: Morph ball - on ground
    db $80 ; 5: Crouching
    db $80 ; 6: Falling
    db $FF ; 7: Unused
    db $FF ; 8: Morph ball - falling
    db $FF ; 9: Unused
    db $80 ; Ah: Knockback / crystal flash ending
    db $00 ; Bh: Unused
    db $00 ; Ch: Unused
    db $80 ; Dh: Unused
    db $80 ; Eh: Turning around - on ground
    db $80 ; Fh: Crouching/standing/morphing/unmorphing transition
    db $80 ; 10h: Moonwalking
    db $FF ; 11h: Spring ball - on ground
    db $FF ; 12h: Spring ball - in air
    db $FF ; 13h: Spring ball - falling
    db $80 ; 14h: Wall jumping
    db $80 ; 15h: Ran into a wall
    db $00 ; 16h: Grappling
    db $80 ; 17h: Turning around - jumping
    db $80 ; 18h: Turning around - falling
    db $00 ; 19h: Damage boost
    db $00 ; 1Ah: Grabbed by Draygon
    db $80 ; 1Bh: Shinespark / crystal flash / drained by metroid / damaged by MB's attacks


;;; $BD20:  ;;;
CheckIfSamusIsBelowTailbounceThreshold:
; Check if Y is below #$0160 (tail bounce Y position threshold?)
    LDA.W SamusYPosition
    CMP.W #$0160
    BPL .aboveThreshold
    CLC
    RTS

  .aboveThreshold:
    SEC
    RTS


;;; $BD2C:  ;;;
PowerBombCheck:
; Power Bomb Check/Reaction
    LDA.L $7E7802
    BMI .return
    BEQ .return
    CMP.W #$0002
    BEQ .return
    LDA.W $0CEE
    BEQ .return
    LDA.L $7E7836
    BNE .return
    JSR RidleyGrabbedSamus_ResetTailAI
    LDY.W #CheckFor_Deathswoop_PowerBombDodge_MoveToCenter_RamGrabSamus
    STY.W $0FA8

  .return:
    RTS


;;; $BD4E: Ridley function ;;;
Function_Ridley_DodgingPowerbomb_MaybeHoldingSamus:
; Ridley is dodging a power bomb (may be holding Samus)
    LDA.W $0CEE
    BEQ .powerBombActive
    LDA.W #$0002
    STA.L $7E7802
    LDY.W #$0050
    LDA.W $0CE2
    CMP.W #$0080
    BPL +
    LDY.W #$00C0

+   STY.B $12
    LDY.W #$00C0
    LDA.W $0CE4
    CMP.W #$0100
    BPL +
    LDY.W #$0180

+   STY.B $14
    LDX.W #$0000
    JSR GetRidleyAccelerationDivisorIndex
    JMP AccelerateRidleyTowardDesiredXYPosition_NoDecelerationBoost

  .powerBombActive:
    LDA.W #$0001
    STA.L $7E7802
    LDY.W #DetermineAndExecuteNewRidleyAIScript
    LDA.L $7E7836
    BEQ .notHoldingSamus
    LDY.W #Function_Ridley_InPositionToGrabSamus_NoPowerBomb

  .notHoldingSamus:
    STY.W $0FA8
    RTS


;;; $BD9A: Ridley function ;;;
Function_RidleyCeres_InitializeBabyMetroidDrop:
; Ceres Ridley initialise baby metroid drop
    LDA.W #$00C0
    STA.B $12
    LDA.W #$0080
    STA.B $14
    LDX.W #$0000
    LDY.W #$0001
    JSR AccelerateCeresRidleyTowardDesiredXY
    LDA.W $0F7A
    CMP.W #$00C0
    BMI .return
    LDA.W #Function_RidleyCeres_DropBabyMetroid
    STA.W $0FA8

  .return:
    RTS


;;; $BDBC: Ridley function ;;;
Function_RidleyCeres_DropBabyMetroid:
; Ceres Ridley baby metroid drop
    LDA.W #$FF40
    STA.L $7E8000
    LDA.W #$00C0
    STA.B $12
    LDA.W #$FF80
    STA.B $14
    LDX.W #$0000
    LDY.W #$0001
    JSR AccelerateCeresRidleyTowardDesiredXY
    LDA.W $0F7E
    CMP.W #$0020
    BPL Function_RidleyCeres_PickupBabyMetroid_return
    LDA.W #DropBabyMetroid
    STA.L $7E8800
    LDA.W #Function_RidleyCeres_PickupBabyMetroidDelay
    STA.W $0FA8
    LDA.W #$0015
    STA.W $0FB2
    RTS


;;; $BDF2: Ridley function ;;;
Function_RidleyCeres_PickupBabyMetroidDelay:
; Ceres Ridley pickup baby metroid delay
    DEC.W $0FB2
    BPL Function_RidleyCeres_PickupBabyMetroid_return
    LDA.W #InstList_RidleyCeres_FacingLeft_ExtendLegs
    JSR SetRidleyInstList
    LDA.W #Function_RidleyCeres_PickupBabyMetroid
    STA.W $0FA8                                                          ; fallthrough to Function_RidleyCeres_PickupBabyMetroid


;;; $BE03: Ridley function ;;;
Function_RidleyCeres_PickupBabyMetroid:
; Ceres Ridley baby metroid pickup
    LDA.L $7E8804
    CLC
    ADC.W #$FFF6
    STA.B $12
    LDA.L $7E8808
    CLC
    ADC.W #$FFC8
    STA.B $14
    LDX.W #$0000
    LDY.W #$000C
    JSR AccelerateRidleyTowardDesiredXYPosition_NoDecelerationBoost
    LDA.W #$000E
    CLC
    ADC.W $0F7A
    STA.B $12
    LDA.W #$0042
    CLC
    ADC.W $0F7E
    STA.B $14
    LDA.W #$0004
    STA.B $16
    LDA.W #$0004
    STA.B $18
    JSR CheckIfRidleyIsWithinRangeToPickupBabyMetroid
    BCS Function_RidleyCeres_PickupBabyMetroid_holding

  .return:
    RTS


Function_RidleyCeres_PickupBabyMetroid_holding:
    LDA.W #$0001
    STA.L $7E7836
    SEC
    JSR TransferGraphicsForRidleysClawsHoldingSamusOrBabyMetroid
    LDA.W #$FE00
    STA.W $0FAC
    LDA.W #UpdateBabyMetroidPosition_CarriedInFeet
    STA.L $7E8800
    LDA.W #Function_RidleyCeres_FlyAwayToEndFight
    STA.W $0FA8
    RTS


;;; $BE61:  ;;;
CheckIfRidleyIsWithinRangeToPickupBabyMetroid:
    LDA.L $7E8804
    SEC
    SBC.B $12
    BPL +
    EOR.W #$FFFF
    INC

+   SEC
    SBC.W #$0004
    BCC +
    CMP.B $16
    BCS .returnNotGrabbed

+   LDA.L $7E8808
    SEC
    SBC.B $14
    BPL +
    EOR.W #$FFFF
    INC

+   SEC
    SBC.W #$0004
    BCC .returnGrabbed
    CMP.B $18
    BCC .returnGrabbed

  .returnNotGrabbed:
    CLC
    RTS

  .returnGrabbed:
    SEC
    RTS


;;; $BE93:  ;;;
HandleCarryingBabyMetroid:
    LDA.L $7E8800
    STA.B $12
    JMP.W ($0012)


;;; $BE9C:  ;;;
UpdateBabyMetroidPosition_CarriedInArms:
    LDA.W #$FFF0
    CLC
    ADC.W $0F7A
    STA.L $7E8804
    LDA.W #$0016
    CLC
    ADC.W $0F7E
    STA.L $7E8808
    RTS


;;; $BEB3:  ;;;
UpdateBabyMetroidPosition_CarriedInFeet:
    LDA.W #$000E
    CLC
    ADC.W $0F7A
    STA.L $7E8804
    LDA.W #$0042
    CLC
    ADC.W $0F7E
    STA.L $7E8808
    RTS


;;; $BECA:  ;;;
DropBabyMetroid:
; Initialise baby metroid falling to ground
    LDA.W #$0000
    STA.L $7E880A
    STA.L $7E880C
    LDA.W #BabyMetroidDropped
    STA.L $7E8800                                                        ; fallthrough to BabyMetroidDropped


;;; $BEDC:  ;;;
BabyMetroidDropped:
; Baby metroid falls to ground
    LDA.L $7E880C
    CLC
    ADC.W #$0008
    STA.L $7E880C
    SEP #$20
    CLC
    ADC.L $7E8807
    STA.L $7E8807
    REP #$20
    AND.W #$FF00
    XBA
    BPL +
    ORA.W #$FF00

+   ADC.L $7E8808
    STA.L $7E8808
    CMP.W #$00C0
    BMI .return
    LDA.W #$00C0
    STA.L $7E8808
    LDA.W #.return
    STA.L $7E8800

  .return:
    RTS


;;; $BF1A: Draw baby metroid ;;;
DrawBabyMetroid:
    LDA.W #$7806
    JSR GetBabyMetroidSpritemapPointerFromInstList
    LDA.L $7E8804
    STA.B $12
    LDA.L $7E8808
    STA.B $14
    STZ.B $16
    JMP RidleyGeneralUseDrawing


;;; $BF31: Baby metroid instruction list ;;;
InstList_BabyMetroidCutscene_0:
    dw Instruction_BabyMetroidCutscene_GotoXIfNotFalling
    dw InstList_BabyMetroidCutscene_1
    dw $000A,Spritemap_BabyMetroidCutscene_HorizontalSquish
    dw $000A,Spritemap_BabyMetroidCutscene_Round
    dw $000A,Spritemap_BabyMetroidCutscene_VerticalSquish
    dw $000A,Spritemap_BabyMetroidCutscene_Round
    dw Instruction_BabyMetroidCutscene_GotoXIfNotFalling
    dw InstList_BabyMetroidCutscene_1
    dw $000A,Spritemap_BabyMetroidCutscene_HorizontalSquish
    dw $000A,Spritemap_BabyMetroidCutscene_Round
    dw $000A,Spritemap_BabyMetroidCutscene_VerticalSquish
    dw $000A,Spritemap_BabyMetroidCutscene_Round

InstList_BabyMetroidCutscene_1:
    dw Instruction_BabyMetroidCutscene_PlayCrySFXOrGotoX
    dw InstList_BabyMetroidCutscene_0
    dw Instruction_BabyMetroidCutscene_UpdateColors
    dw Palette_BabyMetroidCutscene_HorizontalSquish
    dw $0006,Spritemap_BabyMetroidCutscene_HorizontalSquish
    dw Instruction_BabyMetroidCutscene_UpdateColors
    dw Palette_BabyMetroidCutscene_Round
    dw $0005,Spritemap_BabyMetroidCutscene_Round
    dw Instruction_BabyMetroidCutscene_UpdateColors
    dw Palette_BabyMetroidCutscene_VerticalSquish
    dw $0004,Spritemap_BabyMetroidCutscene_VerticalSquish
    dw Instruction_BabyMetroidCutscene_UpdateColors
    dw Palette_BabyMetroidCutscene_Round
    dw $0003,Spritemap_BabyMetroidCutscene_Round
    dw Instruction_BabyMetroidCutscene_UpdateColors
    dw Palette_BabyMetroidCutscene_HorizontalSquish
    dw $0002,Spritemap_BabyMetroidCutscene_HorizontalSquish
    dw Instruction_BabyMetroidCutscene_UpdateColors
    dw Palette_BabyMetroidCutscene_Round
    dw $0003,Spritemap_BabyMetroidCutscene_Round
    dw Instruction_BabyMetroidCutscene_UpdateColors
    dw Palette_BabyMetroidCutscene_VerticalSquish
    dw $0004,Spritemap_BabyMetroidCutscene_VerticalSquish
    dw Instruction_BabyMetroidCutscene_UpdateColors
    dw Palette_BabyMetroidCutscene_Round
    dw $0005,Spritemap_BabyMetroidCutscene_Round
    dw Instruction_BabyMetroidCutscene_UpdateColors
    dw Palette_BabyMetroidCutscene_HorizontalSquish
    dw $0006,Spritemap_BabyMetroidCutscene_HorizontalSquish
    dw Instruction_BabyMetroidCutscene_UpdateColors
    dw Palette_BabyMetroidCutscene_Round
    dw $0007,Spritemap_BabyMetroidCutscene_Round
    dw Instruction_BabyMetroidCutscene_UpdateColors
    dw Palette_BabyMetroidCutscene_VerticalSquish
    dw $0008,Spritemap_BabyMetroidCutscene_VerticalSquish
    dw Instruction_BabyMetroidCutscene_UpdateColors
    dw Palette_BabyMetroidCutscene_Round
    dw $0009,Spritemap_BabyMetroidCutscene_Round
    dw Instruction_BabyMetroidCutscene_UpdateColors
    dw Palette_BabyMetroidCutscene_EndOfInstList
    dw Instruction_BabyMetroidCutscene_GotoXIfNotFalling
    dw InstList_BabyMetroidCutscene_1
    dw Instruction_BabyMetroidCutscene_GotoX
    dw InstList_BabyMetroidCutscene_0


;;; $BFC9: Baby metroid instruction ;;;
Instruction_BabyMetroidCutscene_PlayCrySFXOrGotoX:
    LDA.L $7E880C
    BNE .playSFX
    LDA.W RandomNumberSeed
    AND.W #$0001
    BNE Instruction_BabyMetroidCutscene_GotoX

  .playSFX:
    LDA.W #$0024
    JSL QueueSound_Lib3_Max6                                           ; fallthrough to Instruction_BabyMetroidCutscene_NextInstruction


;;; $BFDE: X += 2 ;;;
Instruction_BabyMetroidCutscene_NextInstruction:
    INX
    INX
    RTS


;;; $BFE1: Baby metroid instruction ;;;
Instruction_BabyMetroidCutscene_UpdateColors:
    LDY.W $0000,X
    PHX
    LDX.W #$0162
    LDA.W #$000F
    JSL WriteAColorsFromYtoColorIndexX
    PLX
    BRA Instruction_BabyMetroidCutscene_NextInstruction


;;; $BFF2: Baby metroid instruction ;;;
Instruction_BabyMetroidCutscene_GotoXIfNotFalling:
    LDA.L $7E880C
    BEQ Instruction_BabyMetroidCutscene_NextInstruction                  ; fallthrough to Instruction_BabyMetroidCutscene_GotoX


;;; $BFF8: Baby metroid instruction - go to [[X]] ;;;
Instruction_BabyMetroidCutscene_GotoX:
    LDA.W $0000,X
    TAX
    RTS


;;; $BFFD: Baby metroid spritemaps ;;;
Spritemap_BabyMetroidCutscene_HorizontalSquish:
    dw $0005
    %spritemapEntry(0, $00, $08, 1, 1, 3, 2, $10D)
    %spritemapEntry(0, $1F8, $08, 1, 0, 3, 2, $10D)
    %spritemapEntry(0, $00, $F0, 0, 1, 3, 2, $10D)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 3, 2, $10D)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 3, $142)

Spritemap_BabyMetroidCutscene_Round:
    dw $0005
    %spritemapEntry(0, $00, $08, 1, 1, 3, 2, $10D)
    %spritemapEntry(0, $1F8, $08, 1, 0, 3, 2, $10D)
    %spritemapEntry(0, $00, $F0, 0, 1, 3, 2, $10D)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 3, 2, $10D)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 3, $14C)

Spritemap_BabyMetroidCutscene_VerticalSquish:
    dw $0005
    %spritemapEntry(0, $00, $08, 1, 1, 3, 2, $10D)
    %spritemapEntry(0, $1F8, $08, 1, 0, 3, 2, $10D)
    %spritemapEntry(0, $00, $F0, 0, 1, 3, 2, $10D)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 3, 2, $10D)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 3, $14E)


;;; $C04E: Ridley function ;;;
CeresRidleyPostGetawayFunctionHandler:
    LDX.W $0FB2
    JMP.W (.pointers,X)

  .pointers:
    dw PostGetawayFunction_UpdateColors_TransferTimerSpriteTiles
    dw PostGetawayFunction_TransferTimerBackgroundTiles
    dw PostGetawayFunction_TransferEscapeTiles_ProcessEmergencyText
    dw PostGetawayFunction_SetupCeresEscapeTimer
    dw PostGetawayFunction_Wait20f_QueueTilemapTransfers
    dw PostGetawayFunction_CycleEmergencyTextColors_HandleTyping
    dw PostGetawayFunction_CycleEmergencyTextColors_StartEscape


;;; $C062:  ;;;
PostGetawayFunction_UpdateColors_TransferTimerSpriteTiles:
    LDA.L $7EC002
    STA.L $7EC0C2
    LDA.L $7EC006
    STA.L $7EC0C6
    LDA.L $7EC022
    STA.L $7EC0A2
    LDA.L $7EC026
    STA.L $7EC0A6
    LDX.W #ZebesEscapeTimerSpriteTileTransferEntries_size
    STX.W $0FB0
    INC.W $0FB2
    INC.W $0FB2                                                          ; fallthrough to PostGetawayFunction_TransferTimerBackgroundTiles


PostGetawayFunction_TransferTimerBackgroundTiles:
    JSR ProcessEscapeTimerTileTransfers
    BCC PostGetawayFunction_TransferEscapeTiles_ProcessEmergencyText_return
    LDX.W #CeresEscapeTimerBG12TransferEntries_size
    STX.W $0FB0
    INC.W $0FB2
    INC.W $0FB2                                                          ; fallthrough to PostGetawayFunction_TransferEscapeTiles_ProcessEmergencyText


PostGetawayFunction_TransferEscapeTiles_ProcessEmergencyText:
    JSR ProcessEscapeTimerTileTransfers
    BCC .return
    INC.W $0FB2
    INC.W $0FB2
    JSR DrawEmergencyText
    LDA.W #$0080
    STA.W $0FB0
    LDA.W #$0007
    JSL QueueMusicDataOrTrack_8FrameDelay

  .return:
    RTS


;;; $C0BB: Set up Ceres escape timer ;;;
PostGetawayFunction_SetupCeresEscapeTimer:
    JSR CycleEmergencyTextColors
    DEC.W $0FB0
    BNE .return
    LDA.W #TypewriterText_CeresEscapeTimer
    STA.L $7E8036
    LDA.W #$0000
    STA.L $7E8038
    STA.L $7E803A
    STA.L $7E803C
    STA.L $7E803E
    LDA.W #$0020
    STA.W $0FB0
    LDA.W $09E2
    BNE .japanText
    INC.W $0FB2
    INC.W $0FB2

  .japanText:
    INC.W $0FB2
    INC.W $0FB2

  .return:
    RTS


;;; $C0F5:  ;;;
PostGetawayFunction_Wait20f_QueueTilemapTransfers:
    DEC.W $0FB0
    BNE PostGetawayFunction_CycleEmergencyTextColors_HandleTyping
    INC.W $0FB2
    INC.W $0FB2
    JSL QueueCeresEscapeJapaneseTextTilemapTransfers                   ; fallthrough to PostGetawayFunction_CycleEmergencyTextColors_HandleTyping


;;; $C104:  ;;;
PostGetawayFunction_CycleEmergencyTextColors_HandleTyping:
    JSR CycleEmergencyTextColors
    LDA.W #$3582
    JSL HandleTypewriterText_External
    BCC .return
    INC.W $0FB2
    INC.W $0FB2

  .return:
    RTS


;;; $C117:  ;;;
PostGetawayFunction_CycleEmergencyTextColors_StartEscape:
    JSR CycleEmergencyTextColors
    JSR Function_Ridley_ResetSpeeds
    STZ.W $0FB2
    LDA.W #Function_RidleyCeres_CycleEmergencyTextColors
    STA.W $0FA8
    LDA.W #$0001
    STA.W $0943
    INC
    STA.W CeresStatus
    DEC
    JSL SetBossBitsInAForCurrentArea
    RTS


;;; $C136:  ;;;
DrawEmergencyText:
; Display 'EMERGENCY' text
    LDX.W #.tilemapEntry
    LDY.W VRAMWriteStack
    LDA.W $0000,X
    STA.W VRAMWrite.size,Y                                               ; >.<
    LDA.W $0003,X
    STA.W VRAMWrite.src+1,Y                                              ; >.<
    LDA.W $0002,X
    STA.W VRAMWrite.src,Y                                                ; >.<
    LDA.W $0005,X
    STA.W VRAMWrite.dest,Y                                               ; >.<
    TYA
    CLC
    ADC.W #$0007
    STA.W VRAMWriteStack
    RTS

  .tilemapEntry:
    dw $0012
    dl .emergencyTilemap
    dw $50CB

  .emergencyTilemap:
;       E     M     E     R     G     E     N     C     Y
    dw $3986,$398E,$3986,$3993,$3988,$3986,$398F,$3984,$399A


if !FEATURE_KEEP_UNREFERENCED
;;; $C176:  ;;;
UNUSED_CycleColor_A6C176:
    LDX.W #$0016
    LDA.L $7E8032
    INC
    CMP.W #$0020
    BMI +
    LDA.W #$FFE1

+   STA.L $7E8032
    LDA.L $7E8032
    BPL +
    EOR.W #$FFFF
    INC

+   AND.W #$001F
    STA.L $7EC000,X
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $C19C:  ;;;
CycleEmergencyTextColors:
    LDA.L PaletteChangeNumerator
    ORA.W $0797
    BEQ +

  .return:
    RTS

+   LDA.W NMI_FrameCounter
    AND.W #$0003
    BNE .return
    LDA.L $7E8030
    INC
    CMP.W #$0010
    BCC .cycle
    LDA.W #$0000

  .cycle:
    STA.L $7E8030
    ASL
    ADC.L $7E8030
    ASL
    TAY
    LDX.W #$00C2
    LDA.W .emergencyColor0,Y
    STA.L $7EC000,X
    LDA.W .emergencyColor1,Y
    STA.L $7EC002,X
    LDA.W .emergencyColor2,Y
    STA.L $7EC004,X
    RTS

; BG1/2 palette 6 colors 1..3
; EMERGENCY text palettes
  .emergencyColor0:
    dw $02DF

  .emergencyColor1:
    dw       $01D7

  .emergencyColor2:
    dw             $00AC
    dw $06BE,$05B7,$04AC
    dw $0A9E,$09B7,$08AD
    dw $0E7D,$0D97,$0CAE
    dw $125D,$1197,$10AF
    dw $1A3C,$1977,$18B0
    dw $1E1C,$1D77,$1CB0
    dw $21FB,$2157,$20B1
    dw $25DB,$2557,$24D2
    dw $21FB,$2157,$20B1
    dw $1E1C,$1D77,$1CB0
    dw $1A3C,$1977,$18B0
    dw $125D,$1197,$10AF
    dw $0E7D,$0D97,$0CAE
    dw $0A9E,$09B7,$08AD
    dw $06BE,$05B7,$04AC


;;; $C23F: Set up Zebes escape typewriter ;;;
SetupZebesEscapeTypewriter:
    LDA.L $7EC0FA
    STA.L $7EC13A
    LDA.L $7EC0FC
    STA.L $7EC13C
    LDA.W #TypewriterText_ZebesEscapeTimer
    STA.L $7E8036
    LDA.W #$0000
    STA.L $7E8038
    STA.L $7E803A
    STA.L $7E803C
    STA.L $7E803E
    STZ.B $B5
    STZ.B $B7
    RTL


;;; $C26E: Process escape timer tile transfers ;;;
ProcessEscapeTimerTileTransfers:
    LDX.W $0FB0
    LDY.W VRAMWriteStack
    LDA.W $0000,X
    BEQ .returnCarrySet
    STA.W VRAMWrite.size,Y                                               ; >.<
    LDA.W $0003,X
    STA.W VRAMWrite.src+1,Y                                              ; >.<
    LDA.W $0002,X
    STA.W VRAMWrite.src,Y                                                ; >.<
    LDA.W $0005,X
    STA.W VRAMWrite.dest,Y                                               ; >.<
    TYA
    CLC
    ADC.W #$0007
    STA.W VRAMWriteStack
    TXA
    ADC.W #$0007
    STA.W $0FB0
    TAX
    LDA.W $0000,X
    BEQ .returnCarrySet
    CLC
    RTS

  .returnCarrySet:
    SEC
    RTS


;;; $C2A7: Handle typewriter text (external) ;;;
HandleTypewriterText_External:
    STA.B DP_Temp12
    PHB
    PHK
    PLB
    JSR HandleTypewriterText
    PLB
    RTL


;;; $C2B1: Handle typewriter text ;;;
HandleTypewriterText:
;; Returns:
;;     Carry: Set if finished, clear otherwise

; Incrementally writes text like "TIME BOMB SET EVACUATE IMMEDIATELY",
    LDA.L $7E803A
    BEQ .timerExpired
    DEC
    STA.L $7E803A
    RTS

  .timerExpired:
    LDA.L $7E803C
    STA.L $7E803A
    LDA.L $7E8036
    TAX

  .loop:
    LDA.W $0000,X
    BNE +
    SEC
    RTS

+   CMP.W #$0001
    BNE +
    INX
    INX
    LDA.W $0000,X
    STA.L $7E803C
    INX
    INX
    JMP .loop

+   CMP.W #$000D
    BNE +
    INX
    INX
    LDA.W $0000,X
    STA.L $7E8038
    INX
    INX
    JMP .loop

+   AND.W #$00FF
    CMP.W #$0020
    BNE +
    LDA.L $7E8038
    INC
    STA.L $7E8038
    INX
    TXA
    STA.L $7E8036
    CLC
    RTS

+   CMP.W #$0021
    BNE +
    LDA.W #$005B

+   PHA
    TXA
    INC
    STA.L $7E8036
    LDY.W VRAMWriteStack
    LDA.W #$0002
    STA.W VRAMWrite.size,Y                                               ; >.<
    LDA.W #$7E00
    STA.W VRAMWrite.src+1,Y                                              ; >.<
    PLA
    SEC
    SBC.W #$0041
    CLC
    ADC.B $12
    STA.L $7E8034
    LDA.W #$8034                                                         ; $7E
    STA.W VRAMWrite.src,Y                                                ; >.<
    LDA.L $7E8038
    STA.W VRAMWrite.dest,Y                                               ; >.<
    INC
    STA.L $7E8038
    TYA
    CLC
    ADC.W #$0007
    STA.W VRAMWriteStack
    LDA.L $7E803E
    INC
    STA.L $7E803E
    CMP.W #$0002
    BMI .returnStillTyping
    LDA.W #$0000
    STA.L $7E803E
    LDA.W AreaIndex
    CMP.W #$0006
    BNE .introTypewriterSFX
    LDA.W #$0045
    JSL QueueSound_Lib2_Max3
    BRA .returnStillTyping

  .introTypewriterSFX:
    LDA.W #$000D
    JSL QueueSound_Lib3_Max3

  .returnStillTyping:
    CLC
    RTS


;;; $C383:  ;;;
QueueCeresEscapeJapaneseTextTilemapTransfers:
    LDX.W #TypewriterCeresEscapeJapaneseTextTilemapTransfer_size
    PHB
    PHK
    PLB
    LDY.W VRAMWriteStack

  .loop:
    LDA.W $0000,X
    BEQ .done
    STA.W VRAMWrite.size,Y                                               ; >.<
    LDA.W $0003,X
    STA.W VRAMWrite.src+1,Y                                              ; >.<
    LDA.W $0002,X
    STA.W VRAMWrite.src,Y                                                ; >.<
    LDA.W $0005,X
    STA.W VRAMWrite.dest,Y                                               ; >.<
    TYA
    CLC
    ADC.W #$0007
    TAY
    TXA
    ADC.W #$0007
    TAX
    BRA .loop

  .done:
    STY.W VRAMWriteStack
    PLB
    RTL


;;; $C3B8: Tilemap transfer entries ;;;
TypewriterCeresEscapeJapaneseTextTilemapTransfer:
  .size:
    dw $0018
  .src:
    dl TypewriterCeresEscapeJapanTextTilemap_Line0_Row0
  .VRAM:
    dw $528A

    dw $0018                                                             ; Size
    dl TypewriterCeresEscapeJapanTextTilemap_Line0_Row1                  ; Source address
    dw $52AA                                                             ; VRAM address

    dw $0016                                                             ; Size
    dl TypewriterCeresEscapeJapanTextTilemap_Line1_Row0                  ; Source address
    dw $52CA                                                             ; VRAM address

    dw $0016                                                             ; Size
    dl TypewriterCeresEscapeJapanTextTilemap_Line1_Row1                  ; Source address
    dw $52EA                                                             ; VRAM address

    dw $0000                                                             ; Zero terminator

if !FEATURE_KEEP_UNREFERENCED
UNUSED_TypewriterCeresEscapeJapanTextTilemapTransfer_A6C3D6:
    dw $0018                                                             ; Size
    dl TypewriterCeresEscapeJapanTextTilemap_Line0_Row0                  ; Source address
    dw $4A8A                                                             ; VRAM address

    dw $0018                                                             ; Size
    dl TypewriterCeresEscapeJapanTextTilemap_Line0_Row1                  ; Source address
    dw $4AAA                                                             ; VRAM address

    dw $0016                                                             ; Size
    dl TypewriterCeresEscapeJapanTextTilemap_Line1_Row0                  ; Source address
    dw $4ACA                                                             ; VRAM address

    dw $0016                                                             ; Size
    dl TypewriterCeresEscapeJapanTextTilemap_Line1_Row1                  ; Source address
    dw $4AEA                                                             ; VRAM address

    dw $0000                                                             ; Zero terminator
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $C3F4: Tilemaps ;;;
; Ceres Escape Japanese text
; uses two tile high text
; first line
TypewriterCeresEscapeJapanTextTilemap_Line0_Row0:
    dw $3DA0,$3DA1,$3DA2,$3DA3,$3DA4,$3DA5,$3DA6,$3DA7
    dw $3DAF,$3DA8,$3DAF,$3DA9

TypewriterCeresEscapeJapanTextTilemap_Line0_Row1:
    dw $3DB0,$3DB1,$3DB2,$3DB3,$3DB4,$3DB5,$3DB6,$3DB7
    dw $3DBF,$3DB8,$3DBF,$3DB9

; second line
TypewriterCeresEscapeJapanTextTilemap_Line1_Row0:
    dw $3DA9,$3DAA,$3DAB,$3DAC,$3DAD,$3DAE,$3DAF,$3D9C
    dw $3D9D,$3D9E,$3D9F

TypewriterCeresEscapeJapanTextTilemap_Line1_Row1:
    dw $3DB9,$3DBA,$3DBB,$3DBC,$3DBD,$3DBE,$3DBF,$3DC0
    dw $3DC1,$3DC2,$3DC3


;;; $C450: Typewriter text - Ceres escape timer ;;;
TypewriterText_CeresEscapeTimer:
    dw $0001,$0002                                                       ; Timer reset value = 2
    dw $000D,$5105                                                       ; VRAM tilemap address = $5105 (BG1 tile (5, 8))
    db "SELF DESTRUCT SEQUENCE"
    dw $000D,$5145                                                       ; VRAM tilemap address = $5145 (BG1 tile (5, Ah))
    db "ACTIVATED EVACUATE"
    dw $000D,$5185                                                       ; VRAM tilemap address = $5185 (BG1 tile (5, Ch))
    db "COLONY IMMEDIATELY"
    dw $0000


;;; $C49C: Typewriter text - Zebes escape timer ;;;
TypewriterText_ZebesEscapeTimer:
    dw $0001,$0002                                                       ; Timer reset value = 2
    dw $000D,$4905                                                       ; VRAM tilemap address = $4905 (BG2 tile (5, 8))
    db "TIME BOMB SET!"
    dw $000D,$4945                                                       ; VRAM tilemap address = $4945 (BG2 tile (5, Ah))
    db "ESCAPE IMMEDIATELY!"
    dw $0000


;;; $C4CB: Zebes escape timer sprite tile transfer entries ;;;
ZebesEscapeTimerSpriteTileTransferEntries:
; Escape timer numbers
  .size:
    dw $0200
  .src:
    dl Tiles_EscapeTimer_0
  .VRAM:
    dw $7E00

    dw $0120                                                             ; Size
    dl Tiles_EscapeTimer_1                                               ; Source address
    dw $7F00                                                             ; VRAM address

; Escape timer text
    dw $0200                                                             ; Size
    dl Tiles_EscapeTimerText_0                                           ; Source address
    dw $7820                                                             ; VRAM address

    dw $0200                                                             ; Size
    dl Tiles_EscapeTimerText_1                                           ; Source address
    dw $7920                                                             ; VRAM address

    dw $0200                                                             ; Size
    dl Tiles_EscapeTimerText_2                                           ; Source address
    dw $7A20                                                             ; VRAM address

    dw $0200                                                             ; Size
    dl Tiles_EscapeTimerText_3                                           ; Source address
    dw $7B20                                                             ; VRAM address

    dw $0100                                                             ; Size
    dl Tiles_EscapeTimerText_4                                           ; Source address
    dw $7C20                                                             ; VRAM address

    dw $0000                                                             ; Zero terminator


;;; $C4FE: Ceres escape timer BG1/2 tile transfer entries ;;;
CeresEscapeTimerBG12TransferEntries:
; Escape timer text
  .size:
    dw $0200
  .src:
    dl Tiles_EscapeTimerText_0
  .VRAM:
    dw $1820

    dw $0200                                                             ; Size
    dl Tiles_EscapeTimerText_1                                           ; Source address
    dw $1920                                                             ; VRAM address

    dw $0200                                                             ; Size
    dl Tiles_EscapeTimerText_2                                           ; Source address
    dw $1A20                                                             ; VRAM address

    dw $0200                                                             ; Size
    dl Tiles_EscapeTimerText_3                                           ; Source address
    dw $1B20                                                             ; VRAM address

    dw $0100                                                             ; Size
    dl Tiles_EscapeTimerText_4                                           ; Source address
    dw $1C20                                                             ; VRAM address

; Ceres door tiles
    dw $0200                                                             ; Size
    dl Tiles_CeresDoor_0                                                 ; Source address
    dw $0D00                                                             ; VRAM address

    dw $0200                                                             ; Size
    dl Tiles_CeresDoor_1                                                 ; Source address
    dw $0E00                                                             ; VRAM address

    dw $0200                                                             ; Size
    dl Tiles_CeresDoor_2                                                 ; Source address
    dw $0F00                                                             ; VRAM address

    dw $0000                                                             ; Zero terminator


;;; $C538: Ridley function ;;;
Function_Ridley_MoveToDeathSpot:
; Move Ridley towards 80,148
    JSR MoveRidleyToDeathSpot
    BCC Function_Ridley_FinalRoar
    RTS


;;; $C53E: Ridley function ;;;
Function_Ridley_FinalRoar:
; Final roar
    LDA.W #InstList_Ridley_FacingLeft_DeathRoar
    JSR SetRidleyInstList
    LDA.W #Function_Ridley_MoveToDeathSpot_Wait_LowerAcid
    STA.W $0FA8
    LDA.W #$0020
    STA.W $0FB2

  .return:
    RTS


;;; $C551: Ridley function ;;;
Function_Ridley_MoveToDeathSpot_Wait_LowerAcid:
; Move to death spot, wait, then lower acid
    JSR MoveRidleyToDeathSpot
    DEC.W $0FB2
    BPL Function_Ridley_FinalRoar_return
    STZ.W $0FAA
    STZ.W $0FAC
    LDA.W #$0210
    STA.W $197A
    LDA.W #$0040
    STA.W $197C
    LDA.W #$0001
    STA.W $1980
    LDA.W #$0000
    STA.L $7E800E
    STA.L $7E8010
    LDA.W #Function_Ridley_DeathExplosions_DropSamusIfNeeded
    STA.W $0FA8
    LDA.W #$00A0
    STA.W $0FB2                                                          ; fallthrough to Function_Ridley_DeathExplosions_DropSamusIfNeeded


;;; $C588: Ridley function ;;;
Function_Ridley_DeathExplosions_DropSamusIfNeeded:
; Explosions for death. After a while, drop Samus if needed
    JSR SpawnRidleyExplosions
    DEC.W $0FB2
    BPL Function_Ridley_FinalRoar_return
    LDA.L $7E7836
    BEQ .notHoldingSamus
    JSR ReleaseSamus

  .notHoldingSamus:
    LDA.W #Function_Ridley_DisableRidley
    STA.W $0FA8
    STZ.W $0FAA
    STZ.W $0FAC
    JMP SpawnRidleyExplosionEnemies


;;; $C5A8: Ridley function ;;;
Function_Ridley_DisableRidley:
; Disable Ridley
    JSR SpawnRidleyExplosions
    LDA.W #$0000
    STA.L $7E7804
    LDA.W $0F86
    ORA.W #$0100
    STA.W $0F86
    LDA.W #Function_Ridley_Wait20Frames
    STA.W $0FA8
    LDA.W #$0020
    STA.W $0FB2
    RTS


;;; $C5C8: Ridley function ;;;
Function_Ridley_Wait20Frames:
; Wait 20 frames
    DEC.W $0FB2
    BPL Function_Ridley_FinalRoar_return
    LDA.W #Function_Ridley_Wait100f_SpawnDrops_ChangeMusic_MarkBossDead
    STA.W $0FA8
    LDA.W #$0100
    STA.W $0FB2
    RTS


;;; $C5DA: Ridley function ;;;
Function_Ridley_Wait100f_SpawnDrops_ChangeMusic_MarkBossDead:
; Wait 100 frames, then drop items, change music, and set boss bit
    DEC.W $0FB2
    BPL .return
    LDA.W #$0001
    JSL SetBossBitsInAForCurrentArea
    JSL RidleyDeathItemDropRoutine
    LDA.W #$0003
    JSL QueueMusicDataOrTrack_8FrameDelay
    LDA.W $0F86
    ORA.W #$0200
    STA.W $0F86
    LDA.W #.return
    STA.W $0FA8

  .return:
    RTS


;;; $C601:  ;;;
MoveRidleyToDeathSpot:
; Move to death spot, CLC when near it
    LDX.W #$0080
    STX.B $12
    LDY.W #$0148
    STY.B $14
    LDX.W #$0000
    LDY.W #$0000
    LDA.W #$0010
    JSR AccelerateRidleyTowardDesiredXYPosition
    LDA.W #$0004
    STA.B $16
    STA.B $18
    JSL CheckForEnemyCollisionWithRectangle
    RTS


;;; $C623:  ;;;
SpawnRidleyExplosions:
; Keep playing explosions
    LDA.L $7E800E
    DEC
    BMI .timerExpired
    STA.L $7E800E
    RTS

  .timerExpired:
    LDA.W #$0004
    STA.L $7E800E
    LDA.L $7E8010
    INC
    CMP.W #$000A
    BMI .notA
    LDA.W #$0000

  .notA:
    STA.L $7E8010
    ASL
    ASL
    TAY
    LDA.W .XPosition,Y
    CLC
    ADC.W $0F7A
    STA.B $12
    LDA.W .YPosition,Y
    CLC
    ADC.W $0F7E
    STA.B $14
    LDA.W #$0003
    LDY.W #EnemyProjectile_MiscDust
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W #$0024
    JSL QueueSound_Lib2_Max3
    RTS

; explosion X,Y offsets
  .XPosition:
    dw $FFE8
  .YPosition:
    dw       $FFE8, $FFEC,$0014, $0010,$FFE2, $001E,$FFFD, $000E,$FFF3
    dw $FFFE,$0012, $FFFE,$FFE0, $FFE1,$0008, $FFFC,$FFF6, $0013,$0013


;;; $C696: Initialisation AI - enemy $E1BF (Ridley explosion) ;;;
InitAI_RidleyExplosion:
    LDX.W EnemyIndex
    LDA.W #$0001
    STA.W $0F94,X
    STZ.W $0F90,X
    STZ.W $0F98,X
    LDA.W #$0E00
    STA.W $0F96,X
    LDY.W $0FB4,X
    LDA.W .lifetimes,Y
    STA.W $0FB2,X
    JSL GenerateRandomNumber
    AND.W #$0130
    BIT.W RandomNumberSeed
    BPL +
    EOR.W #$FFFF
    INC

+   STA.W $0FAA,X
    STZ.W $0FAC,X
    TYX
    JMP.W (.initPointers,X)

  .lifetimes:
; Life times. Indexed by enemy parameter 1
    dw $0048,$0050,$0058,$0060,$0068,$0070,$0078,$0028
    dw $0030,$0038,$0080,$0040

  .initPointers:
; Initialisation pointers. Indexed by enemy parameter 1
    dw RidleyExplosionInitialization_0
    dw RidleyExplosionInitialization_2
    dw RidleyExplosionInitialization_4
    dw RidleyExplosionInitialization_6
    dw RidleyExplosionInitialization_8
    dw RidleyExplosionInitialization_A
    dw RidleyExplosionInitialization_C
    dw RidleyExplosionInitialization_E
    dw RidleyExplosionInitialization_10
    dw RidleyExplosionInitialization_12
    dw RidleyExplosionInitialization_14
    dw RidleyExplosionInitialization_16


;;; $C6FE: Ridley explosion initialisation - index = 0 ;;;
RidleyExplosionInitialization_0:
    LDX.W EnemyIndex
    LDA.L $7E202C
    STA.W $0F7A,X
    LDA.L $7E202E
    STA.W $0F7E,X
    LDA.W #InstList_RidleyTail_Large
    STA.W $0F92,X
    RTL


;;; $C716: Ridley explosion initialisation - index = 2 ;;;
RidleyExplosionInitialization_2:
    LDX.W EnemyIndex
    LDA.L $7E2040
    STA.W $0F7A,X
    LDA.L $7E2042
    STA.W $0F7E,X
    LDA.W #InstList_RidleyTail_Large
    STA.W $0F92,X
    RTL


;;; $C72E: Ridley explosion initialisation - index = 4 ;;;
RidleyExplosionInitialization_4:
    LDX.W EnemyIndex
    LDA.L $7E2054
    STA.W $0F7A,X
    LDA.L $7E2056
    STA.W $0F7E,X
    LDA.W #InstList_RidleyTail_Medium
    STA.W $0F92,X
    RTL


;;; $C746: Ridley explosion initialisation - index = 6 ;;;
RidleyExplosionInitialization_6:
    LDX.W EnemyIndex
    LDA.L $7E2068
    STA.W $0F7A,X
    LDA.L $7E206A
    STA.W $0F7E,X
    LDA.W #InstList_RidleyTail_Medium
    STA.W $0F92,X
    RTL


;;; $C75E: Ridley explosion initialisation - index = 8 ;;;
RidleyExplosionInitialization_8:
    LDX.W EnemyIndex
    LDA.L $7E207C
    STA.W $0F7A,X
    LDA.L $7E207E
    STA.W $0F7E,X
    LDA.W #InstList_RidleyTail_Small
    STA.W $0F92,X
    RTL


;;; $C776: Ridley explosion initialisation - index = Ah ;;;
RidleyExplosionInitialization_A:
    LDX.W EnemyIndex
    LDA.L $7E2090
    STA.W $0F7A,X
    LDA.L $7E2092
    STA.W $0F7E,X
    LDA.W #InstList_RidleyTail_Small
    STA.W $0F92,X
    RTL


;;; $C78E: Ridley explosion initialisation - index = Ch ;;;
RidleyExplosionInitialization_C:
    LDX.W EnemyIndex
    LDA.L $7E20A4
    STA.W $0F7A,X
    LDA.L $7E20A6
    STA.W $0F7E,X
    LDA.L $7E20A2
    CLC
    ADC.L $7E208E
    CLC
    ADC.W #$0008
    AND.W #$00F0
    LSR
    LSR
    LSR
    TAY
    LDA.W .instListPointers,Y
    STA.W $0F92,X
    RTL

  .instListPointers:
    dw InstList_RidleyTailTip_PointingDown
    dw InstList_RidleyTailTip_PointingDownDownRight
    dw InstList_RidleyTailTip_PointingDownRight
    dw InstList_RidleyTailTip_PointingRightDownRight
    dw InstList_RidleyTailTip_PointingRight
    dw InstList_RidleyTailTip_PointingRightUpRight
    dw InstList_RidleyTailTip_PointingUpRight
    dw InstList_RidleyTailTip_PointingUpUpRight
    dw InstList_RidleyTailTip_PointingUp
    dw InstList_RidleyTailTip_PointingUpUpLeft
    dw InstList_RidleyTailTip_PointingUpLeft
    dw InstList_RidleyTailTip_PointingLeftUpLeft
    dw InstList_RidleyTailTip_PointingLeft
    dw InstList_RidleyTailTip_PointingLeftDownLeft
    dw InstList_RidleyTailTip_PointingDownLeft
    dw InstList_RidleyTailTip_PointingDownDownLeft


;;; $C7DA: Ridley explosion initialisation - index = Eh ;;;
RidleyExplosionInitialization_E:
    LDY.W #$0000
    LDA.L $7E7820
    BEQ .right
    LDY.W #$0002

  .right:
    LDX.W EnemyIndex
    LDA.W .XOffsetFromRidleyXPosition,Y
    CLC
    ADC.W $0F7A
    STA.W $0F7A,X
    LDA.W #$0000
    CLC
    ADC.W $0F7E
    STA.W $0F7E,X
    LDA.W .instListPointer,Y
    STA.W $0F92,X
    RTL

  .XOffsetFromRidleyXPosition:
    dw $0000,$0000

  .instListPointer:
    dw InstList_RidleyWings_FullyRaised_FacingLeft
    dw InstList_RidleyWings_FullyRaised_FacingRight


;;; $C80C: Ridley explosion initialisation - index = 10h ;;;
RidleyExplosionInitialization_10:
    LDY.W #$0000
    LDA.L $7E7820
    BEQ .right
    LDY.W #$0002

  .right:
    LDX.W EnemyIndex
    LDA.W .XOffsetFromRidleyXPosition,Y
    CLC
    ADC.W $0F7A
    STA.W $0F7A,X
    LDA.W #$0016
    CLC
    ADC.W $0F7E
    STA.W $0F7E,X
    LDA.W .instListPointer,Y
    STA.W $0F92,X
    RTL

  .XOffsetFromRidleyXPosition:
    dw $000F,$FFF1

  .instListPointer:
    dw InstList_RidleyLegs_PulledUp_FacingLeft
    dw InstList_RidleyLegs_PulledUp_FacingRight


;;; $C83E: Ridley explosion initialisation - index = 12h ;;;
RidleyExplosionInitialization_12:
    LDY.W #$0000
    LDA.L $7E7820
    BEQ .right
    LDY.W #$0002

  .right:
    LDX.W EnemyIndex
    LDA.W .XOffsetFromRidleyXPosition,Y
    CLC
    ADC.W $0F7A
    STA.W $0F7A,X
    LDA.W #$FFE8
    CLC
    ADC.W $0F7E
    STA.W $0F7E,X
    LDA.W .instListPointer,Y
    STA.W $0F92,X
    RTL

  .XOffsetFromRidleyXPosition:
    dw $FFFD,$0003

  .instListPointer:
    dw InstList_RidleyHead_MouthOpen_FacingLeft
    dw InstList_RidleyHead_MouthOpen_FacingRight


;;; $C870: Ridley explosion initialisation - index = 14h ;;;
RidleyExplosionInitialization_14:
    LDY.W #$0000
    LDA.L $7E7820
    BEQ .right
    LDY.W #$0002

  .right:
    LDX.W EnemyIndex
    LDA.W .XOffsetFromRidleyXPosition,Y
    CLC
    ADC.W $0F7A
    STA.W $0F7A,X
    LDA.W #$0000
    CLC
    ADC.W $0F7E
    STA.W $0F7E,X
    LDA.W .instListPointer,Y
    STA.W $0F92,X
    RTL

  .XOffsetFromRidleyXPosition:
    dw $0010,$FFF0

  .instListPointer:
    dw InstList_RidleyTorso_FacingLeft
    dw InstList_RidleyTorso_FacingRight


;;; $C8A2: Ridley explosion initialisation - index = 16h ;;;
RidleyExplosionInitialization_16:
    LDY.W #$0000
    LDA.L $7E7820
    BEQ .right
    LDY.W #$0002

  .right:
    LDX.W EnemyIndex
    LDA.W .XOffsetFromRidleyXPosition,Y
    CLC
    ADC.W $0F7A
    STA.W $0F7A,X
    LDA.W #$0007
    CLC
    ADC.W $0F7E
    STA.W $0F7E,X
    LDA.W .instListPointer,Y
    STA.W $0F92,X
    RTL

  .XOffsetFromRidleyXPosition:
    dw $0008,$FFF8

  .instListPointer:
    dw InstList_RidleyClaw_FacingLeft
    dw InstList_RidleyClaw_FacingRight


;;; $C8D4: Main AI - enemy $E1BF (Ridley explosion) ;;;
MainAI_RidleyExplosion:
    LDX.W EnemyIndex
    JSR HandleFlickering
    LDA.W $0FAA,X
    BPL +
    EOR.W #$FFFF
    INC

+   CLC
    ADC.W #$FFFC
    BPL +
    LDA.W #$0000

+   BIT.W $0FAA,X
    BPL +
    EOR.W #$FFFF
    INC

+   STA.W $0FAA,X
    LDA.W $0FAC,X
    CLC
    ADC.W #$0004
    STA.W $0FAC,X
    JSL MoveEnemyAccordingToVelocity
    DEC.W $0FB2,X
    BPL .return
    LDA.W #$0000
    JML EnemyDeath

  .return:
    RTL


;;; $C913: Handle flickering ;;;
HandleFlickering:
    LDA.W $0FA4,X
    AND.W #$0001
    STA.W $0FA4,X
    BEQ .visible
    LDA.W $0F86,X
    ORA.W #$0100
    STA.W $0F86,X
    RTS

  .visible:
    LDA.W $0F86,X
    AND.W #$FEFF
    STA.W $0F86,X
    RTS


;;; $C932: Spawn Ridley explosion enemies ;;;
SpawnRidleyExplosionEnemies:
    LDX.W #RidleyExplosionEntry_6
    JSL SpawnEnemy
    LDX.W #RidleyExplosionEntry_5
    JSL SpawnEnemy
    LDX.W #RidleyExplosionEntry_4
    JSL SpawnEnemy
    LDX.W #RidleyExplosionEntry_3
    JSL SpawnEnemy
    LDX.W #RidleyExplosionEntry_2
    JSL SpawnEnemy
    LDX.W #RidleyExplosionEntry_1
    JSL SpawnEnemy
    LDX.W #RidleyExplosionEntry_0
    JSL SpawnEnemy
    LDX.W #RidleyExplosionEntry_7
    JSL SpawnEnemy
    LDX.W #RidleyExplosionEntry_8
    JSL SpawnEnemy
    LDX.W #RidleyExplosionEntry_A
    JSL SpawnEnemy
    LDX.W #RidleyExplosionEntry_9
    JSL SpawnEnemy
    LDX.W #RidleyExplosionEntry_B
    JSL SpawnEnemy
    RTS

;        ______________________________________ X position
;       |      ________________________________ Y position
;       |     |      __________________________ Initialisation parameter
;       |     |     |      ____________________ Properties
;       |     |     |     |      ______________ Extra properties
;       |     |     |     |     |      ________ Parameter 1
;       |     |     |     |     |     |     ___ Parameter 2
;       |     |     |     |     |     |    |
RidleyExplosionEntry_0:
    dw EnemyHeaders_RidleyExplosion                                      ; Ridley explosion 6
    dw $0000,$0000,$0000,$2C00,$0000,$0000,$0000

RidleyExplosionEntry_1:
    dw EnemyHeaders_RidleyExplosion                                      ; Ridley explosion 5
    dw $0000,$0000,$0000,$2C00,$0000,$0002,$0000

RidleyExplosionEntry_2:
    dw EnemyHeaders_RidleyExplosion                                      ; Ridley explosion 4
    dw $0000,$0000,$0000,$2C00,$0000,$0004,$0000

RidleyExplosionEntry_3:
    dw EnemyHeaders_RidleyExplosion                                      ; Ridley explosion 3
    dw $0000,$0000,$0000,$2C00,$0000,$0006,$0000

RidleyExplosionEntry_4:
    dw EnemyHeaders_RidleyExplosion                                      ; Ridley explosion 2
    dw $0000,$0000,$0000,$2C00,$0000,$0008,$0000

RidleyExplosionEntry_5:
    dw EnemyHeaders_RidleyExplosion                                      ; Ridley explosion 1
    dw $0000,$0000,$0000,$2C00,$0000,$000A,$0000

RidleyExplosionEntry_6:
    dw EnemyHeaders_RidleyExplosion                                      ; Ridley explosion 0
    dw $0000,$0000,$0000,$2C00,$0000,$000C,$0000

RidleyExplosionEntry_7:
    dw EnemyHeaders_RidleyExplosion                                      ; Ridley explosion 7
    dw $0000,$0000,$0000,$2C00,$0000,$000E,$0000

RidleyExplosionEntry_8:
    dw EnemyHeaders_RidleyExplosion                                      ; Ridley explosion 8
    dw $0000,$0000,$0000,$2C00,$0000,$0010,$0000

RidleyExplosionEntry_9:
    dw EnemyHeaders_RidleyExplosion                                      ; Ridley explosion A
    dw $0000,$0000,$0000,$2C00,$0000,$0012,$0000

RidleyExplosionEntry_A:
    dw EnemyHeaders_RidleyExplosion                                      ; Ridley explosion 9
    dw $0000,$0000,$0000,$2C00,$0000,$0014,$0000

RidleyExplosionEntry_B:
    dw EnemyHeaders_RidleyExplosion                                      ; Ridley explosion B
    dw $0000,$0000,$0000,$2C00,$0000,$0016,$0000


;;; $CA47: Instruction list -  ;;;
InstList_RidleyTail_Large:
    dw $0001,Spritemap_RidleyTail_Large
    dw Instruction_Common_Sleep


;;; $CA4D: Instruction list -  ;;;
InstList_RidleyTail_Medium:
    dw $0001,Spritemap_RidleyTail_Medium
    dw Instruction_Common_Sleep


;;; $CA53: Instruction list -  ;;;
InstList_RidleyTail_Small:
    dw $0001,Spritemap_RidleyTail_Small
    dw Instruction_Common_Sleep


;;; $CA59: Instruction list -  ;;;
InstList_RidleyWings_FullyRaised_FacingLeft:
    dw $0001,Spritemap_RidleyWings_FacingLeft_FullyRaised
    dw Instruction_Common_Sleep


;;; $CA5F: Instruction list -  ;;;
InstList_RidleyWings_FullyRaised_FacingRight:
    dw $0001,Spritemap_RidleyWings_FacingRight_FullyRaised
    dw Instruction_Common_Sleep


;;; $CA65: Instruction list -  ;;;
InstList_RidleyLegs_PulledUp_FacingLeft:
    dw $0001,Spritemap_Ridley_FacingLeft_Legs_PulledUp
    dw Instruction_Common_Sleep


;;; $CA6B: Instruction list -  ;;;
InstList_RidleyLegs_PulledUp_FacingRight:
    dw $0001,Spritemap_Ridley_FacingRight_Legs_PulledUp
    dw Instruction_Common_Sleep


;;; $CA71: Instruction list -  ;;;
InstList_RidleyHead_MouthOpen_FacingLeft:
    dw $0001,Spritemap_Ridley_FacingLeft_HeadNeck_MouthOpen
    dw Instruction_Common_Sleep


;;; $CA77: Instruction list -  ;;;
InstList_RidleyHead_MouthOpen_FacingRight:
    dw $0001,Spritemap_Ridley_FacingRight_HeadNeck_MouthOpen
    dw Instruction_Common_Sleep


;;; $CA7D: Instruction list -  ;;;
InstList_RidleyTorso_FacingLeft:
    dw $0001,Spritemap_Ridley_FacingLeft_Torso
    dw Instruction_Common_Sleep


;;; $CA83: Instruction list -  ;;;
InstList_RidleyTorso_FacingRight:
    dw $0001,Spritemap_Ridley_FacingRight_Torso
    dw Instruction_Common_Sleep


;;; $CA89: Instruction list -  ;;;
InstList_RidleyClaw_FacingLeft:
    dw $0001,Spritemap_Ridley_FacingLeft_Claws
    dw Instruction_Common_Sleep


;;; $CA8F: Instruction list -  ;;;
InstList_RidleyClaw_FacingRight:
    dw $0001,Spritemap_Ridley_FacingRight_Claws
    dw Instruction_Common_Sleep


;;; $CA95: Instruction list -  ;;;
InstList_RidleyTailTip_PointingDown:
    dw $0001,Spritemap_RidleyTailTip_PointingDown
    dw Instruction_Common_Sleep


;;; $CA9B: Instruction list -  ;;;
InstList_RidleyTailTip_PointingDownDownRight:
    dw $0001,Spritemap_RidleyTailTip_PointingDownDownRight
    dw Instruction_Common_Sleep


;;; $CAA1: Instruction list -  ;;;
InstList_RidleyTailTip_PointingDownRight:
    dw $0001,Spritemap_RidleyTailTip_PointingDownRight
    dw Instruction_Common_Sleep


;;; $CAA7: Instruction list -  ;;;
InstList_RidleyTailTip_PointingRightDownRight:
    dw $0001,Spritemap_RidleyTailTip_PointingRightDownRight
    dw Instruction_Common_Sleep


;;; $CAAD: Instruction list -  ;;;
InstList_RidleyTailTip_PointingRight:
    dw $0001,Spritemap_RidleyTailTip_PointingRight
    dw Instruction_Common_Sleep


;;; $CAB3: Instruction list -  ;;;
InstList_RidleyTailTip_PointingRightUpRight:
    dw $0001,Spritemap_RidleyTailTip_PointingRightUpRight
    dw Instruction_Common_Sleep


;;; $CAB9: Instruction list -  ;;;
InstList_RidleyTailTip_PointingUpRight:
    dw $0001,Spritemap_RidleyTailTip_PointingUpRight
    dw Instruction_Common_Sleep


;;; $CABF: Instruction list -  ;;;
InstList_RidleyTailTip_PointingUpUpRight:
    dw $0001,Spritemap_RidleyTailTip_PointingUpUpRight
    dw Instruction_Common_Sleep


;;; $CAC5: Instruction list -  ;;;
InstList_RidleyTailTip_PointingUp:
    dw $0001,Spritemap_RidleyTailTip_PointingUp
    dw Instruction_Common_Sleep


;;; $CACB: Instruction list -  ;;;
InstList_RidleyTailTip_PointingUpUpLeft:
    dw $0001,Spritemap_RidleyTailTip_PointingUpUpLeft
    dw Instruction_Common_Sleep


;;; $CAD1: Instruction list -  ;;;
InstList_RidleyTailTip_PointingUpLeft:
    dw $0001,Spritemap_RidleyTailTip_PointingUpLeft
    dw Instruction_Common_Sleep


;;; $CAD7: Instruction list -  ;;;
InstList_RidleyTailTip_PointingLeftUpLeft:
    dw $0001,Spritemap_RidleyTailTip_PointingLeftUpLeft
    dw Instruction_Common_Sleep


;;; $CADD: Instruction list -  ;;;
InstList_RidleyTailTip_PointingLeft:
    dw $0001,Spritemap_RidleyTailTip_PointingLeft
    dw Instruction_Common_Sleep


;;; $CAE3: Instruction list -  ;;;
InstList_RidleyTailTip_PointingLeftDownLeft:
    dw $0001,Spritemap_RidleyTailTip_PointingLeftDownLeft
    dw Instruction_Common_Sleep


;;; $CAE9: Instruction list -  ;;;
InstList_RidleyTailTip_PointingDownLeft:
    dw $0001,Spritemap_RidleyTailTip_PointingDownLeft
    dw Instruction_Common_Sleep


;;; $CAEF: Instruction list -  ;;;
InstList_RidleyTailTip_PointingDownDownLeft:
    dw $0001,Spritemap_RidleyTailTip_PointingDownDownLeft
    dw Instruction_Common_Sleep


;;; $CAF5:  ;;;
HandleRidleyTailAI:
; Run Tail AI: Sound, control AI, X/Y positions, tail extension, hurt Samus
    JSR PlaySwishingSFXIfTailIsMovingFast
    LDA.L $7E2000
    ASL
    TAX
    JSR.W (.pointers,X)
    PHB
    PEA $7E7E
    PLB
    PLB
    JSR UpdateRidleyTailPositions
    JSR RidleyTailExtending
    PLB
    LDA.W $0F86
    AND.W #$0400
    ORA.W $18A8
    ORA.L $7E7836
    BNE .return
    JMP RidleyTail_vs_Samus_Interaction

  .return:
    RTS

  .pointers:
; indexed by $7E2000, tail AI index
    dw .return
    dw Function_RidleyTail_FlingingAtSamus
    dw Function_RidleyTail_StartTailbouncing
    dw Function_RidleyTail_StillStartingTailbouncing
    dw Function_RidleyTail_DuringTailbouncing
    dw Function_RidleyTail_StartExtendingDuringTailbouncing
    dw Function_RidleyTail_ContinueExtendingDuringTailbouncing
    dw Function_RidleyTail_StrictTailbouncingExtending
    dw Function_RidleyTail_TailSpin


;;; $CB33:  ;;;
Function_RidleyTail_StartTailbouncing:
    LDA.W #$0008
    STA.L $7E2014
    JSR Function_RidleyTail_2_3_6_7_Common
    LDA.W #$0003
    STA.L $7E2000
    RTS


;;; $CB45:  ;;;
Function_RidleyTail_StillStartingTailbouncing:
    LDA.W #$0008
    STA.L $7E2014
    BRA Function_RidleyTail_2_3_6_7_Common


;;; $CB4E:  ;;;
Function_RidleyTail_ContinueExtendingDuringTailbouncing:
    LDA.W #$0003
    STA.L $7E2014
    JSR Function_RidleyTail_2_3_6_7_Common
    LDA.W #$0006
    STA.L $7E2000
    RTS


;;; $CB60:  ;;;
Function_RidleyTail_StrictTailbouncingExtending:
    LDA.W #$0002
    STA.L $7E2014
    JSR Function_RidleyTail_2_3_6_7_Common
    LDA.W #$0007
    STA.L $7E2000
    RTS


;;; $CB72:  ;;;
Function_RidleyTail_2_3_6_7_Common:
    LDA.L $7E7820
    BNE .notFacingLeft
    LDA.W #$4000
    STA.L $7E201C
    LDA.W #$FFFF
    STA.L $7E201A
    BRA +

  .notFacingLeft:
    LDA.W #$4000
    STA.L $7E201A
    LDA.W #$FFFF
    STA.L $7E201C

+   JSR Function_RidleyTail_DuringTailbouncing
    LDA.L $7E2020
    ORA.L $7E2034
    ORA.L $7E2048
    ORA.L $7E205C
    ORA.L $7E2070
    ORA.L $7E2084
    ORA.L $7E2098
    BEQ .duringTailbouncing
    RTS

  .duringTailbouncing:
    LDA.W #$0004
    STA.L $7E2000
    RTS


;;; $CBC0:  ;;;
Function_RidleyTail_FlingingAtSamus:
    LDA.W #RidleyTailAI_FlingTailAtSamus
    STA.B $12
    BRA ExecuteRidleyTailAI


;;; $CBC7:  ;;;
Function_RidleyTail_DuringTailbouncing:
    LDA.W #Function_Ridley_Tailbouncing
    STA.B $12
    BRA ExecuteRidleyTailAI


;;; $CBCE:  ;;;
Function_RidleyTail_StartExtendingDuringTailbouncing:
    LDA.W #ExtendTailForTailbouncing
    STA.B $12
    BRA ExecuteRidleyTailAI


;;; $CBD5:  ;;;
Function_RidleyTail_TailSpin:
    LDA.W #SwingRidleyTailInCircles
    STA.B $12
    BRA ExecuteRidleyTailAI                                              ; >.<


;;; $CBDC:  ;;;
ExecuteRidleyTailAI:
    PHB
    PEA $7E7E
    PLB
    PLB
    PEA .manualReturn-1
    JMP.W ($0012)

  .manualReturn:
    LDA.W #$0007
    LDX.W #$0000

  .loop:
    PHA
    JSR SetRidleyTailAngles
    TXA
    CLC
    ADC.W #$0014
    TAX
    PLA
    DEC
    BNE .loop
    PLB
    RTS


;;; $CBFE:  ;;;
SetMinMaxTailAnglesBasedOnDirection:
; Set min and max tail angles based on direction
    LDA.W $7820
    ASL
    TAX
    LDA.L .minAngle,X
    STA.W $2016
    LDA.L .maxAngle,X
    STA.W $2018
    RTS

; indexed by facing direction
  .minAngle:
    dw $3FF0,$3FF0,$3FC0
  .maxAngle:
    dw $4040,$4040,$4010


;;; $CC1E:  ;;;
CheckIfAllTailPartsAreRotating:
; SEC if all tail parts are rotating, else CLC
    LDA.W $2020
    AND.W $2034
    AND.W $2048
    AND.W $205C
    AND.W $2070
    AND.W $2084
    AND.W $2098
    BEQ .returnNotAllRotating
    SEC
    RTS

  .returnNotAllRotating:
    CLC
    RTS


;;; $CC39:  ;;;
RidleyTailAI_FlingTailAtSamus:
; Fling tail at Samus
; Setup max angles (CBFE), then if tail is 'prepped' (all tail parts rotating, target angle not set yet, $2004 (trigger?) is set), target an angle
; Target angle is first projectile near tail tip, in a 8x8 tile square centered on tail tip, or Samus. Max rotational speed, 8
; If no tail parts are currently moving, start the first one moving
    JSR SetMinMaxTailAnglesBasedOnDirection
    JSR CheckIfAllTailPartsAreRotating
    BCC .notAllPartsRotating
    JSR HandleRidleyTailFlingTrigger

  .notAllPartsRotating:
    LDA.W $2020
    ORA.W $2034
    ORA.W $2048
    ORA.W $205C
    ORA.W $2070
    ORA.W $2084
    ORA.W $2098
    BEQ .noPartsMoving
    RTS

  .noPartsMoving:
    LDA.W #$8000
    STA.W $2020
    LDA.W #$FFFF
    STA.W $201A
    STA.W $201C
    LDA.W #$0002
    LDY.W SamusXPosition
    CPY.W #$0070
    BCS .SamusNotLeftSide
    LDA.W #$0001

  .SamusNotLeftSide:
    STA.W $2014
    RTS


;;; $CC7D:  ;;;
HandleRidleyTailFlingTrigger:
    LDA.W $2004
    BEQ .notFlingingTail
    LDA.W $201C
    AND.W $201A
    BMI .notRotating

  .notFlingingTail:
    LDA.W $2002
    BEQ .done
    LDA.W RandomNumberSeed
    AND.W #$00FF
    CMP.W #$00F0
    BCS .notRotating
    LDA.W SamusXPosition
    SEC
    SBC.W $0F7A
    BPL .rightOfRidley
    EOR.W #$FFFF
    INC

  .rightOfRidley:
    CMP.W #$0080
    BCS .done
    LDA.W #$0000
    BRA +

  .notRotating:
    LDA.W $2004
    DEC

+   JSR TargetAnAngleTowardMissileOrSamus
    PLA

  .done:
    STZ.W $2004
    RTS


;;; $CCBD:  ;;;
SwingRidleyTailInCircles:
; Swing tail in circles
    JSR SetMinMaxTailAnglesBasedOnDirection
    JSR CheckIfAllTailPartsAreRotating
    BCC .notAllPartsRotating
    JSR HandleTailFlingWhileSwingingInCircles

  .notAllPartsRotating:
    LDA.L $7E2020
    ORA.L $7E2034
    ORA.L $7E2048
    ORA.L $7E205C
    ORA.L $7E2070
    ORA.L $7E2084
    ORA.L $7E2098
    BEQ .noTailPartsMoving
    RTS

  .noTailPartsMoving:
    LDA.W #$8000
    STA.L $7E2020
    LDA.W #$FFFF
    STA.L $7E201A
    STA.L $7E201C
    LDA.W #$0002
    LDY.W SamusXPosition
    CPY.W #$0070
    BCS +
    LDA.W #$0001

+   STA.L $7E2014
    RTS


;;; $CD0C:  ;;;
HandleTailFlingWhileSwingingInCircles:
    LDA.W $2004
    BEQ .return
    LDA.W $201C
    AND.W $201A
    BPL .return
    LDA.W #$0001
    JSR TargetAnAngleTowardMissileOrSamus
    PLA
    STZ.W $2004

  .return:
    RTS


;;; $CD24:  ;;;
Function_Ridley_Tailbouncing:
; Tail bouncing
    JSR SetMinMaxTailAnglesBasedOnDirection
    JSR CheckIfAllTailPartsAreRotating
    BCC .checkMoving
    LDA.W RandomNumberSeed
    AND.W #$00FF
    CMP.W #$00F0
    BCS .randomlySkipDistanceCheck
    LDA.W SamusXPosition
    SEC
    SBC.L $000F7A
    BPL .SamusOnRight
    EOR.W #$FFFF
    INC

  .SamusOnRight:
    CMP.W #$0080
    BCS .checkMoving

  .randomlySkipDistanceCheck:
    LDA.W $201C
    AND.W $201A
    BPL .checkMoving
    LDA.W #$3F00
    STA.W $201A
    LDA.W #$0008
    STA.W $2014
    RTS

  .checkMoving:
    LDA.W $2020
    ORA.W $2034
    ORA.W $2048
    ORA.W $205C
    ORA.W $2070
    ORA.W $2084
    ORA.W $2098
    BEQ .tailPartsMoving
    RTS

  .tailPartsMoving:
    BIT.W $0FAC
    BMI .movingUp
    LDA.W #$0005
    STA.W $2000

  .movingUp:
    LDA.W #$FFFF
    STA.W $201A
    STA.W $201C
    LDA.W $2010
    BNE .decrementTimer

  .done:
    STA.W $2014
    RTS

  .decrementTimer:
    DEC
    STA.W $2010
    BNE .done
    LDA.W #$8000
    STA.W $2020
    JSR SetRidleyTailAnglesTo40XX
    LDA.W #$0008
    STA.W $2014
    RTS


;;; $CDAA:  ;;;
ExtendTailForTailbouncing:
; Extend tail. Happens only while tail bouncing, moving downwards, and no tail parts currently rotating
    JSR SetMinMaxTailAnglesBasedOnDirection
    JSR CheckIfAllTailPartsAreRotating
    BCC .checkTailPartsMoving
    LDA.W RandomNumberSeed
    AND.W #$00FF
    CMP.W #$00F0
    BCS .randomlySkipDistanceCheck
    LDA.W SamusXPosition
    SEC
    SBC.L $000F7A
    BPL .SamusOnRight
    EOR.W #$FFFF
    INC

  .SamusOnRight:
    CMP.W #$0080
    BCS .checkTailPartsMoving

  .randomlySkipDistanceCheck:
    LDA.W $201C
    AND.W $201A
    BPL .checkTailPartsMoving
    LDA.W #$3F00
    STA.W $201A
    LDA.W #$0008
    STA.W $2014
    RTS

  .checkTailPartsMoving:
    LDA.W $2020
    ORA.W $2034
    ORA.W $2048
    ORA.W $205C
    ORA.W $2070
    ORA.W $2084
    ORA.W $2098
    BEQ .tailPartMoving
    RTS

  .tailPartMoving:
    BIT.W $0FAC
    BMI .RidleyMovingUp
    LDA.W #$0006
    STA.W $2000
    LDA.W #$0A00
    STA.W $2028
    STA.W $203C
    STA.W $2050
    STA.W $2064
    STA.W $2078
    STA.W $208C
    STA.W $20A0
    LDA.W #$4000
    STA.W $202A
    STA.W $203E
    STA.W $2052
    STA.W $2066
    STA.W $207A
    STA.W $208E
    STA.W $20A2
    LDA.W #$8000
    STA.W $2020

  .RidleyMovingUp:
    LDA.W #$FFFF
    STA.W $201A
    STA.W $201C
    LDA.W $2010
    BNE .decrementTimer
    JMP .done

  .decrementTimer:
    DEC
    STA.W $2010
    BNE .done
    LDA.W #$8000
    STA.W $2020
    JSR SetRidleyTailAnglesTo40XX
    LDA.W #$0008

  .done:
    STA.W $2014
    RTS


;;; $CE65:  ;;;
SetRidleyTailAnglesTo40XX:
; Set angles to 40XX, XX is previous angle (fifth part is actually first part's 40XX)
    LDA.W $202A
    AND.W #$00FF
    ORA.W #$4000
    STA.W $202A
    LDA.W $203E
    AND.W #$00FF
    ORA.W #$4000
    STA.W $203E
    LDA.W $2052
    AND.W #$00FF
    ORA.W #$4000
    STA.W $2052
    LDA.W $2066
    AND.W #$00FF
    ORA.W #$4000
    STA.W $2066
    LDA.W $202A
    AND.W #$04FF
    ORA.W #$4000
    STA.W $207A
    LDA.W $208E
    AND.W #$00FF
    ORA.W #$4000
    STA.W $208E
    LDA.W $20A2
    AND.W #$00FF
    ORA.W #$4000
    STA.W $20A2
    RTS


;;; $CEBA:  ;;;
UpdateRidleyTailPositions:
; Update tail positions
    LDA.W $0F7E
    CLC
    ADC.W $2032
    CLC
    ADC.W #$0010
    STA.W $202E
    CLC
    ADC.W $2046
    STA.W $2042
    CLC
    ADC.W $205A
    STA.W $2056
    CLC
    ADC.W $206E
    STA.W $206A
    CLC
    ADC.W $2082
    STA.W $207E
    CLC
    ADC.W $2096
    STA.W $2092
    CLC
    ADC.W $20AA
    STA.W $20A6
    LDA.W $7820
    DEC
    BEQ .facingForward
    INC
    ASL
    TAX
    LDA.L .XPositionOffsets,X
    ADC.W $2030

  .facingForward:
    CLC
    ADC.W $0F7A
    STA.W $202C
    LDA.W $7820
    DEC
    BNE .notFacingForward
    LDA.W $0F7A
    STA.W $2040
    STA.W $2054
    STA.W $2068
    STA.W $207C
    STA.W $2090
    STA.W $20A4
    BRA .return

  .notFacingForward:
    LDA.W $202C
    CLC
    ADC.W $2044
    STA.W $2040
    CLC
    ADC.W $2058
    STA.W $2054
    CLC
    ADC.W $206C
    STA.W $2068
    CLC
    ADC.W $2080
    STA.W $207C
    CLC
    ADC.W $2094
    STA.W $2090
    CLC
    ADC.W $20A8
    STA.W $20A4

  .return:
    RTS

  .XPositionOffsets:
    dw $0020,$0000,$FFE0


;;; $CF5A:  ;;;
RidleyTailExtending:
; Tail extending
    LDA.W $203C
    BEQ .reachedTargetDistanceFromPreviousTailPart
    CMP.W $203A
    BPL +
    LDA.W #$0000
    STA.W $203C

+   LDA.W $203A
    CLC
    ADC.W $2012
    CMP.W #$1800
    BMI +
    LDA.W #$1800

+   STA.W $203A
    BRA +

  .reachedTargetDistanceFromPreviousTailPart:
    LDA.W #$0800
    CMP.W $203A
    BPL +
    LDA.W $203A
    SEC
    SBC.W #$0080
    STA.W $203A

+   LDA.W $2050
    BEQ .reachedTargetDistanceFromPreviousTailPart2
    CMP.W $204E
    BPL +
    LDA.W #$0000
    STA.W $2050

+   LDA.W $204E
    CLC
    ADC.W $2012
    CMP.W #$1800
    BMI +
    LDA.W #$1800

+   STA.W $204E
    BRA +

  .reachedTargetDistanceFromPreviousTailPart2:
    LDA.W #$0800
    CMP.W $204E
    BPL +
    LDA.W $204E
    SEC
    SBC.W #$0080
    STA.W $204E

+   LDA.W $2064
    BEQ .reachedTargetDistanceFromPreviousTailPart3
    CMP.W $2062
    BPL +
    LDA.W #$0000
    STA.W $2064

+   LDA.W $2062
    CLC
    ADC.W $2012
    CMP.W #$1600
    BMI +
    LDA.W #$1600

+   STA.W $2062
    BRA +

  .reachedTargetDistanceFromPreviousTailPart3:
    LDA.W #$0800
    CMP.W $2062
    BPL +
    LDA.W $2062
    SEC
    SBC.W #$0080
    STA.W $2062

+   LDA.W $2078
    BEQ .reachedTargetDistanceFromPreviousTailPart4
    CMP.W $2076
    BPL +
    LDA.W #$0000
    STA.W $2078

+   LDA.W $2076
    CLC
    ADC.W $2012
    CMP.W #$1600
    BMI +
    LDA.W #$1600

+   STA.W $2076
    BRA +

  .reachedTargetDistanceFromPreviousTailPart4:
    LDA.W #$0800
    CMP.W $2076
    BPL +
    LDA.W $2076
    SEC
    SBC.W #$0080
    STA.W $2076

+   LDA.W $208C
    BEQ .reachedTargetDistanceFromPreviousTailPart5
    CMP.W $208A
    BPL +
    LDA.W #$0000
    STA.W $208C

+   LDA.W $208A
    CLC
    ADC.W $2012
    CMP.W #$1200
    BMI +
    LDA.W #$1200

+   STA.W $208A
    BRA +

  .reachedTargetDistanceFromPreviousTailPart5:
    LDA.W #$0800
    CMP.W $208A
    BPL +
    LDA.W $208A
    SEC
    SBC.W #$0080
    STA.W $208A

+   LDA.W $20A0
    BEQ .reachedTargetDistanceFromPreviousTailPart6
    CMP.W $209E
    BPL +
    LDA.W #$0000
    STA.W $20A0

+   LDA.W $209E
    CLC
    ADC.W $2012
    CMP.W #$0500
    BMI +
    LDA.W #$0500

+   STA.W $209E
    BRA .return

  .reachedTargetDistanceFromPreviousTailPart6:
    LDA.W #$0500
    CMP.W $209E
    BPL .return
    LDA.W $209E
    SEC
    SBC.W #$0080
    STA.W $209E

  .return:
    RTS


;;; $D09F:  ;;;
SetRidleyTailAngles:
    LDA.W $2020,X
    BMI .tailPartMoving
    LDA.W $202A,X
    JMP .notMoving

  .stopTailPartMovement:
    STZ.W $2020,X
    STZ.W $2022,X
    LDA.W $2024,X
    EOR.W #$8000
    STA.W $2024,X
    RTS

-   LDA.W $2022,X
    CLC
    ADC.W $2014
    STA.W $2022,X
    RTS

  .tailPartMoving:
    LDA.W $2022,X
    CMP.W $201E
    BCC -
    CMP.W #$FFFF
    BEQ +
    LDA.W #$FFFF
    STA.W $2022,X
    LDA.W #$8000
    STA.W $2034,X
    LDA.W $2024,X
    STA.W $2038,X

+   LDA.W $2024,X
    BMI .clockwiseRotation
    LDA.W $201C
    BMI .noCounterClockwiseTarget
    LDA.W #$0C00
    STA.W $2028,X
    LDA.W $202A,X
    CLC
    ADC.W $2014
    CMP.W $201C
    BMI .storeAngle
    TXA
    BEQ +
    LDA.W $200C,X
    BNE .tailPartMoving2

+   LDA.W $201C
    STA.W $202A,X
    JMP .stopTailPartMovement

  .noCounterClockwiseTarget:
    LDA.W $202A,X
    CLC
    ADC.W $2014
    CMP.W $2018
    BMI .storeAngle

  .tailPartMoving2:
    LDA.W #$8000
    STA.W $2024,X
    LDA.W $2018
    BRA .storeAngle

  .clockwiseRotation:
    LDA.W $201A
    BMI .noClockwiseTarget
    LDA.W #$0C00
    STA.W $2028,X
    LDA.W $202A,X
    SEC
    SBC.W $2014
    DEC
    CMP.W $201A
    BPL .incrementAngle
    TXA
    BEQ +
    LDA.W $200C,X
    BNE .tailPartMoving3

+   LDA.W $201A
    STA.W $202A,X
    JMP .stopTailPartMovement

  .noClockwiseTarget:
    LDA.W $202A,X
    SEC
    SBC.W $2014
    DEC
    CMP.W $2016
    BPL .incrementAngle

  .tailPartMoving3:
    LDA.W #$0000
    STA.W $2024,X
    LDA.W $2016
    BRA .storeAngle

  .incrementAngle:
    INC

  .storeAngle:
    STA.W $202A,X

  .notMoving:
    AND.W #$00FF
    STA.B $12
    TXA
    BEQ .firstTailPart
    LDA.B $12
    CLC
    ADC.W $2016,X
    AND.W #$00FF
    STA.B $12

  .firstTailPart:
    LDA.W $2026,X
    XBA
    AND.W #$00FF
    JSL GetSineMathInA_A9C460
    STA.W $2030,X
    LDA.W $2026,X
    XBA
    AND.W #$00FF
    JSL GetCosineMathInA_A9C465
    STA.W $2032,X
    RTS


;;; $D19D:  ;;;
TargetAnAngleTowardMissileOrSamus:
; Target an angle (towards a missile or Samus) for tail.
; Note: Actual angle is actually twice the angle chosen, since each tail segment doubles it
; Also, tail circles 2*A amount of times first
    AND.W #$00FF
    XBA
    STA.W $200A
    LDA.W $7820
    DEC
    BEQ .returnUpper
    LDA.W $7802
    BEQ .returnUpper
    JSR TargetAMissileOrSuperMissileIfAvailable
    BCC .noProjectiles
    LDA.B $12
    SBC.W $202C
    STA.B $12
    LDA.B $14
    SEC
    SBC.W $202E
    STA.B $14
    BRA +

  .returnUpper:
    RTS

  .noProjectiles:
    LDA.W SamusXPosition
    SEC
    SBC.W $202C
    STA.B $12
    LDA.W SamusYPosition
    CLC
    ADC.W #$0018
    SEC
    SBC.W $202E
    STA.B $14

+   PHB
    PHK
    PLB
    JSL CalculateAngleOf_12_14_Offset
    PLB
    SEC
    SBC.W #$0080
    EOR.W #$FFFF
    INC
    AND.W #$00FF
    STA.B $12
    LDA.W $7820
    BNE .facingRight
    LDA.B $12
    CMP.W #$0018
    BCC +
    CMP.W #$00E8
    BCS +
    LDA.W #$00E8

+   CLC
    ADC.W #$3F00
    SEC
    SBC.W $200A
    CMP.W $202A
    BCS .returnMiddle
    STA.W $201A
    LDA.W #$0008
    STA.W $2014

  .returnMiddle:
    RTS

  .facingRight:
    LDA.B $12
    CMP.W #$0018
    BCC +
    CMP.W #$00E8
    BCS +
    LDA.W #$0018

+   CLC
    ADC.W #$4000
    CLC
    ADC.W $200A
    CMP.W $202A
    BCC .returnLower
    STA.W $201C
    LDA.W #$0008
    STA.W $2014

  .returnLower:
    RTS


;;; $D242:  ;;;
TargetAMissileOrSuperMissileIfAvailable:
; Target a missile/super missile if available
    LDA.W $20A4
    STA.B $12
    LDA.W $20A6
    STA.B $14
    LDA.W #$0040
    STA.B $16
    STA.B $18
    LDA.W $0CCE
    BNE .checkProjectiles
    CLC
    RTS

  .checkProjectiles:
    LDY.W #$0000

  .loop:
    LDA.W $0C19,Y
    AND.W #$000F
    DEC
    BEQ .missileOrSuperMissile
    DEC
    BNE .nextProjectile

  .missileOrSuperMissile:
    LDA.W $0B64,Y
    SEC
    SBC.B $12
    BPL +
    EOR.W #$FFFF
    INC

+   SEC
    SBC.W $0BB4,Y
    BCC +
    CMP.B $16
    BCS .nextProjectile

+   LDA.W $0B78,Y
    SEC
    SBC.B $14
    BPL +
    EOR.W #$FFFF
    INC

+   SEC
    SBC.W $0BC8,Y
    BCC .targetProjectile
    CMP.B $18
    BCC .targetProjectile

  .nextProjectile:
    INY
    INY
    CPY.W #$000A
    BMI .loop
    CLC
    RTS

  .targetProjectile:
    LDA.W $0B64,Y
    STA.B $12
    LDA.W $0B78,Y
    STA.B $14
    SEC
    RTS


;;; $D2AA:  ;;;
PlaySwishingSFXIfTailIsMovingFast:
; Play swishing sound if tail is moving quickly
    LDA.L $7E2014
    CMP.W #$0008
    BMI .noSFX
    LDA.L $7E781C
    INC
    STA.L $7E781C
    CMP.W #$0010
    BMI .return
    LDA.L $7E781E
    BNE .noSFX
    LDA.W #$0021
    JSL QueueSound_Lib3_Max6

  .noSFX:
    LDA.W #$0000
    STA.L $7E781C

  .return:
    RTS


;;; $D2D6:  ;;;
InitializeTailParts:
; Initializes a ton of variables from 7E:2012 to 7E:20A7. I'm *guessing* they're for his tail
    LDA.W #$0001
    STA.L $7E2014
    LDA.W #$3FF0
    STA.L $7E2016
    LDA.W #$4040
    STA.L $7E2018
    LDA.W #$FFFF
    STA.L $7E201A
    STA.L $7E201C
    LDA.W #$00F0
    STA.L $7E2012
    LDA.W #$0010
    STA.L $7E201E
    INC
    STA.L $7E2022
    STA.L $7E2036
    STA.L $7E204A
    STA.L $7E205E
    STA.L $7E2072
    STA.L $7E2086
    STA.L $7E209A
    LDX.W #.rotationDirection
    LDY.W #$2024
    JSR UpdateTailPartRAMFromXToY
    LDX.W #.distanceFromRidleyToTailParts
    LDY.W #$2026
    JSR UpdateTailPartRAMFromXToY
    LDX.W #.angleOfTailPart
    LDY.W #$202A
    JSR UpdateTailPartRAMFromXToY
    LDX.W #.XPositionOfTailPart
    LDY.W #$202C
    JSR UpdateTailPartRAMFromXToY
    LDX.W #.YPositionOfTailPart
    LDY.W #$202E
    JSR UpdateTailPartRAMFromXToY
    LDA.W #$0000
    STA.L $7E2020
    STA.L $7E2034
    STA.L $7E2048
    STA.L $7E205C
    STA.L $7E2070
    STA.L $7E2084
    STA.L $7E2098
    RTS

  .rotationDirection:
; $7E2024: Rotation direction = clockwise
    dw $8000,$8000,$8000,$8000,$8000,$8000,$8000

  .distanceFromRidleyToTailParts:
; $7E2026: Distance from Ridley to tail parts
    dw $0200,$0800,$0800,$0800,$0800,$0800,$0500

  .angleOfTailPart:
; $7E202A: Angle of this tail part
    dw $4000,$4010,$4020,$4030,$4040,$4050,$4060

  .XPositionOfTailPart:
; $7E202C: X position of this tail part
    dw $0000,$0003,$0007,$0007,$0003,$FFFD,$FFFC

  .YPositionOfTailPart:
; $7E202E: Y position of this tail part
    dw $0002,$0007,$0003,$FFFD,$FFF9,$FFF9,$FFFF


;;; $D3B4:  ;;;
UpdateTailPartRAMFromXToY:
; Copy 7 entries from (X) to 7E:(Y), 7E:(Y+14), 7E:(Y+28), 7E:(Y+3C), etc.
    LDA.W #$007E
    STA.B $14
    STY.B $12
    LDY.W #$0000
    LDA.W #$0007

  .loop:
    PHA
    LDA.W $0000,X
    STA.B [$12],Y
    INX
    INX
    TYA
    CLC
    ADC.W #$0014
    TAY
    PLA
    DEC
    BNE .loop
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $D3D4:  ;;;
UNUSED_SetAllTailPartsToNotMoving_A6D3D4:
    LDA.W #$0000
    BRA SetAllTailPartsToMovingOrNotMoving
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $D3D9:  ;;;
SetAllTailPartsToMoving:
; Set all tail parts to moving
    LDA.W #$8000                                                         ; fallthrough to SetAllTailPartsToMovingOrNotMoving


;;; $D3DC:  ;;;
SetAllTailPartsToMovingOrNotMoving:
    STA.L $7E2020
    STA.L $7E2034
    STA.L $7E2048
    STA.L $7E205C
    STA.L $7E2070
    STA.L $7E2084
    STA.L $7E2098
    RTS


;;; $D3F9:  ;;;
Update_TailRotationDirection_Angle_DistanceFromRidley:
    PHX
    PHY
    LDX.W #InitializeTailParts_distanceFromRidleyToTailParts
    LDY.W #$2026
    JSR UpdateTailPartRAMFromXToY
    LDY.W #$0007
    LDX.W #$0000

  .loop:
    LDA.L $7E202A,X
    EOR.W #$FFFF
    INC
    CLC
    ADC.W #$8000
    STA.L $7E202A,X
    LDA.L $7E2024,X
    ORA.W #$8000
    STA.L $7E2024,X
    TXA
    CLC
    ADC.W #$0014
    TAX
    DEY
    BNE .loop
    PLY
    PLX
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $D431:  ;;;
UNUSED_CheckIfAllTailPartsAreMoving_A6D431:
    LDA.L $7E2020
    AND.L $7E2034
    AND.L $7E2048
    AND.L $7E205C
    AND.L $7E2070
    AND.L $7E2084
    AND.L $7E2098
    BNE .allPartsMoving
    CLC
    RTS

  .allPartsMoving:
    SEC
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $D453: Deal suit-adjusted enemy damage to Samus ;;;
DealSuitAdjustedEnemyDamageToSamus:
    LDX.W EnemyIndex
    LDA.W $0F78,X
    TAX
    LDA.L $A00006,X
    JSL Suit_Damage_Division
    JSL Deal_A_Damage_to_Samus
    RTL


;;; $D467: Set Ridley instruction list ;;;
SetRidleyInstList:
    STA.W $0F92
    LDA.W #$0001
    STA.W $0F94
    STZ.W $0F90
    RTS


;;; $D474:  ;;;
DetermineAndSetRidleySpeedAndColorPalette:
; Determine and set Ridley's speed and color pallete
    LDA.W #$0000
    LDY.W Enemy.health
    CPY.W #$2328
    BCS +
    INC
    CPY.W #$1518
    BCS +
    INC
    CPY.W #$0708
    BCS +
    INC

+   STA.L $7E7824
    DEC
    STA.B $12
    BMI HandleRidleyHealthBasedPalette_return                            ; fallthrough to HandleRidleyHealthBasedPalette


;;; $D495:  ;;;
HandleRidleyHealthBasedPalette:
    LDA.L PaletteChangeNumerator
    BNE .return
    LDA.B $12
    ASL
    ASL
    ASL
    SEC
    SBC.B $12
    ASL
    ASL
    CLC
    ADC.W #Palette_Ridley_HealthBased_Below9000
    TAY
    LDX.W #$01E2
    LDA.W #$000E
    JSL WriteAColorsFromYtoColorIndexX

  .return:
    RTS


;;; $D4B5:  ;;;
DetermineAndSetCeresRidleysColorPalette:
; Determine and set Ridley's color pallete
    LDA.L $7E7802
    BEQ HandleRidleyHealthBasedPalette_return
    LDA.L $7E781A
    CMP.W #$0032
    BCC HandleRidleyHealthBasedPalette_return
    LDY.W #$0000
    CMP.W #$0046
    BCC .paletteChosen
    LDY.W #$0001
    CMP.W #$005A                                                         ; >.< where's the BCC?
    LDY.W #$0002

  .paletteChosen:
    STY.B $12
    JMP HandleRidleyHealthBasedPalette


;;; $D4DA:  ;;;
MakeRidleysWingsAndTailFlashWhenHit:
; Make wings/tail flash when hit
    PHX
    LDX.W #$0E00
    LDA.W $0F9C
    BEQ .noFlash
    DEC
    BEQ .noFlash
    LDA.W $0E44
    INC
    AND.W #$0002
    BEQ .noFlash
    LDX.W #$0000

  .noFlash:
    TXA
    STA.L $7E7818
    PLX
    RTS


;;; $D4F9: Check for collision with non-air block ;;;
CheckForCollisionWithNonAirBlock:
;; Parameters:
;;     X: X position
;;     Y: Y position
;; Returns:
;;     Carry: Set if collision, clear otherwise
    TYA
    LSR
    LSR
    LSR
    LSR
    SEP #$20
    STA.W $4202
    LDA.W $07A5
    STA.W $4203
    REP #$20
    TXA
    LSR
    LSR
    LSR
    LSR
    CLC
    ADC.W $4216
    ASL
    TAX
    LDA.L $7F0002,X
    AND.W #$F000
    BNE .collision
    CLC
    RTL

  .collision:
    SEC
    RTL


;;; $D523:  ;;;
AccelerateRidleyTowardDesiredXYPosition_NoDecelerationBoost:
; Accelerates Ridley towards the desired X/Y ($12/$14).
; No deceleration boost ($1A), Y is index value to find acceleration divisor ($18), X is enemy's index
    LDA.W #$0000                                                         ; fallthrough to AccelerateRidleyTowardDesiredXYPosition


;;; $D526:  ;;;
AccelerateRidleyTowardDesiredXYPosition:
; Accelerates Ridley towards the desired X/Y ($12/$14).
; A is deceleration boost, Y is index value to find acceleration divisor ($18), X is enemy's index
    STA.B $1A
    LDA.W RidleyAccelerationDivisorIndex,Y
    AND.W #$00FF
    STA.B $18
    JSR AccelerateRidleyTowardDesiredXPosition
    LDA.W $0F7E,X
    SEC
    SBC.B $14
    BEQ .return
    BPL .belowTarget
    EOR.W #$FFFF
    INC
    STA.W $4204
    SEP #$20
    LDA.B $18
    STA.W $4206
    REP #$20
    XBA
    XBA
    NOP
    NOP
    LDA.W $4214
    BNE +
    INC

+   STA.B $16
    LDA.W $0FAC,X
    BPL +
    CLC
    ADC.B $1A
    CLC
    ADC.W #$0008
    ADC.B $16

+   ADC.B $16
    CMP.W #$0500
    BMI +
    LDA.W #$0500

+   STA.W $0FAC,X

  .return:
    RTS

  .belowTarget:
    STA.W $4204
    SEP #$20
    LDA.B $18
    STA.W $4206
    REP #$20
    XBA
    XBA
    NOP
    NOP
    LDA.W $4214
    BNE +
    INC

+   STA.B $16
    LDA.W $0FAC,X
    BMI +
    SEC
    SBC.B $1A
    SEC
    SBC.W #$0008
    SBC.B $16

+   SBC.B $16
    CMP.W #$FB00
    BPL +
    LDA.W #$FB00

+   STA.W $0FAC,X
    RTS


;;; $D5A9:  ;;;
AccelerateRidleyTowardDesiredXPosition:
; Accelerates Ridley towards the desired X position ($12).
; Deceleration boost in $1A, acceleration divisor in $18, X is enemy's index
    LDA.W $0F7A,X
    SEC
    SBC.B $12
    BEQ .return
    BPL .rightOfTarget
    EOR.W #$FFFF
    INC
    STA.W $4204
    SEP #$20
    LDA.B $18
    STA.W $4206
    REP #$20
    XBA
    XBA
    NOP
    NOP
    LDA.W $4214
    BNE +
    INC

+   STA.B $16
    LDA.W $0FAA,X
    BPL +
    CLC
    ADC.B $1A
    CLC
    ADC.W #$0008
    ADC.B $16

+   ADC.B $16
    CMP.W #$0500
    BMI +
    LDA.W #$0500

+   STA.W $0FAA,X

  .return:
    RTS

  .rightOfTarget:
    STA.W $4204
    SEP #$20
    LDA.B $18
    STA.W $4206
    REP #$20
    XBA
    XBA
    NOP
    NOP
    LDA.W $4214
    BNE +
    INC

+   STA.B $16
    LDA.W $0FAA,X
    BMI +
    SEC
    SBC.B $1A
    SEC
    SBC.W #$0008
    SBC.B $16

+   SBC.B $16
    CMP.W #$FB00
    BPL +
    LDA.W #$FB00

+   STA.W $0FAA,X
    RTS


;;; $D61F:  ;;;
RidleyAccelerationDivisorIndex:
    db $10,$0F,$0E,$0D,$0C,$0B,$0A,$09,$08,$07,$06,$05,$04,$03,$02,$01


;;; $D62F:  ;;;
AccelerateCeresRidleyTowardDesiredXY:
    LDA.W CeresRidleyAccelerationDivisorIndex,Y
    AND.W #$00FF
    STA.B $18
    JSR CalculateRidleyXSpeed
    LDA.W $0F7E,X
    SEC
    SBC.B $14
    BEQ .return
    BPL .positive
    EOR.W #$FFFF
    INC
    STA.W $4204
    SEP #$20
    LDA.B $18
    STA.W $4206
    REP #$20
    XBA
    XBA
    NOP
    NOP
    LDA.W $4214
    BNE +
    INC

+   STA.B $16
    LDA.W $0FAC,X
    BPL .moveDown
    ADC.B $16
    ADC.B $16

  .moveDown:
    ADC.B $16
    CMP.W #$0500
    BMI .storeYSpeed
    LDA.W #$0500

  .storeYSpeed:
    STA.W $0FAC,X

  .return:
    RTS

  .positive:
    STA.W $4204
    SEP #$20
    LDA.B $18
    STA.W $4206
    REP #$20
    XBA
    XBA
    NOP
    NOP
    LDA.W $4214
    BNE +
    INC

+   STA.B $16
    LDA.W $0FAC,X
    BMI .movingUp
    SBC.B $16
    SBC.B $16

  .movingUp:
    SBC.B $16
    CMP.W #$FB00
    BPL +
    LDA.W #$FB00

+   STA.W $0FAC,X
    RTS


;;; $D6A6:  ;;;
CalculateRidleyXSpeed:
    LDA.W $0F7A,X
    SEC
    SBC.B $12
    BEQ .return
    BPL .moveLeft
    EOR.W #$FFFF
    INC
    STA.W $4204
    SEP #$20
    LDA.B $18
    STA.W $4206
    REP #$20
    XBA
    XBA
    NOP
    NOP
    LDA.W $4214
    BNE +
    INC

+   STA.B $16
    LDA.W $0FAA,X
    BPL .movingRight
    ADC.B $16
    ADC.B $16

  .movingRight:
    ADC.B $16
    CMP.W #$0500
    BMI +
    LDA.W #$0500

+   STA.W $0FAA,X

  .return:
    RTS

  .moveLeft:
    STA.W $4204
    SEP #$20
    LDA.B $18
    STA.W $4206
    REP #$20
    XBA
    XBA
    NOP
    NOP
    LDA.W $4214
    BNE +
    INC

+   STA.B $16
    LDA.W $0FAA,X
    BMI .movingLeft
    SBC.B $16
    SBC.B $16

  .movingLeft:
    SBC.B $16
    CMP.W #$FB00
    BPL +
    LDA.W #$FB00

+   STA.W $0FAA,X
    RTS


;;; $D712:  ;;;
CeresRidleyAccelerationDivisorIndex:
    db $10,$0F,$0E,$0D,$0C,$0B,$0A,$09,$08,$07,$06,$05,$04,$03,$02,$01


if !FEATURE_KEEP_UNREFERENCED
UNUSED_A6D722:
;;; $D722:  ;;;
    LDA.W #$0200
    STA.B $16
    STZ.B $1C
    JSR UNUSED_A6D798
    JSR UNUSED_A6D734
    LSR.B $1C
    LSR.B $1C
    RTS


;;; $D734:  ;;;
UNUSED_A6D734:
    LDA.W $0F7E,X
    SEC
    SBC.B $14
    BPL .unknown
    LDA.W $0FAC,X
    CLC
    ADC.B $16
    CMP.W #$0500
    BMI +
    LDA.W #$0500

+   STA.W $0FAC,X
    AND.W #$FF00
    XBA
    BPL +
    ORA.W #$FF00

+   CLC
    ADC.W $0F7E,X
    CMP.B $14
    BMI .returnUpper
    STZ.W $0FAC,X
    LDA.B $14
    STA.W $0F7E,X
    INC.B $1C

  .returnUpper:
    RTS

  .unknown:
    LDA.W $0FAC,X
    SEC
    SBC.B $16
    CMP.W #$FB00
    BPL +
    LDA.W #$FB00

+   STA.W $0FAC,X
    AND.W #$FF00
    XBA
    BPL +
    ORA.W #$FF00

+   CLC
    ADC.W $0F7E,X
    CMP.B $14
    BEQ +
    BPL .returnLower

+   STZ.W $0FAC,X
    LDA.B $14
    STA.W $0F7E,X
    INC.B $1C

  .returnLower:
    RTS


;;; $D798:  ;;;
UNUSED_A6D798:
    LDA.W $0F7A,X
    SEC
    SBC.B $12
    BPL .unknown
    EOR.W #$FFFF
    INC
    LDA.W $0FAA,X
    CLC
    ADC.B $16
    CMP.W #$0500
    BMI +
    LDA.W #$0500

+   STA.W $0FAA,X
    AND.W #$FF00
    XBA
    BPL +
    ORA.W #$FF00

+   CLC
    ADC.W $0F7A,X
    CMP.B $12
    BMI .returnUpper
    STZ.W $0FAA,X
    LDA.B $12
    STA.W $0F7A,X
    INC.B $1C

  .returnUpper:
    RTS

  .unknown:
    LDA.W $0FAA,X
    SEC
    SBC.B $16
    CMP.W #$FB00
    BPL +
    LDA.W #$FB00

+   STA.W $0FAA,X
    AND.W #$FF00
    XBA
    BPL +
    ORA.W #$FF00

+   CLC
    ADC.W $0F7A,X
    CMP.B $12
    BEQ +
    BPL .returnLower

+   STZ.W $0FAA,X
    LDA.B $12
    STA.W $0F7A,X
    INC.B $1C

  .returnLower:
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $D800:  ;;;
UpdateRidleysUSwoopSpeedAndAngle:
; Update Ridley's U Swoop speed and U Swoop angle, and calculate current X and Y speed
    LDA.B $16
    CMP.L $7E7816
    BEQ .checkAngle
    BPL +
    LDA.L $7E7816
    SEC
    SBC.W #$0020
    CMP.B $16
    BPL .storeSwoopSpeed
    LDA.B $16

  .storeSwoopSpeed:
    STA.L $7E7816
    BRA .checkAngle

+   LDA.L $7E7816
    CLC
    ADC.W #$0020
    CMP.B $16
    BMI +
    LDA.B $16

+   STA.L $7E7816

  .checkAngle:
    LDA.B $12
    BMI .negativeTargetAngle
    CLC
    ADC.L $7E7814
    CMP.B $14
    BMI .calculateAngle
    BRA +

  .negativeTargetAngle:
    CLC
    ADC.L $7E7814
    CMP.B $14
    BPL .calculateAngle

+   LDA.B $14

  .calculateAngle:
    STA.L $7E7814
    XBA
    AND.W #$00FF
    STA.B $12
    LDA.L $7E7816
    JSL CalculateXVelocityFromSpeedAndAngle
    STA.W $0FAA
    LDA.L $7E7816
    JSL CalculateYVelocityFromSpeedAndAngle
    STA.W $0FAC
    RTS


;;; $D86B:  ;;;
HandleMovementAndMainBodyWallCollisions:
; Handles movement and main body wall collisions
    LDA.W #$0000
    STA.L $7E783E
    LDX.W EnemyIndex
    LDA.W $0FAA,X
    SEP #$20
    CLC
    ADC.W $0F7D,X
    STA.W $0F7D,X
    REP #$20
    AND.W #$FF00
    XBA
    BPL .checkLeftWall
    ORA.W #$FF00

  .checkLeftWall:
    ADC.W $0F7A,X
    CMP.L $7E8004
    BPL .checkRightWall
    JSR CeresRidleyRoomShaking
    LDA.L $7E8004
    STA.W $0F7A,X
    STZ.W $0FAA,X
    LDA.W #$0001
    STA.L $7E783E
    BRA .getYSpeed


  .checkRightWall:
    CMP.L $7E8006
    BMI +
    STZ.W $0FAA,X
    LDA.W #$0002
    STA.L $7E783E
    LDA.L $7E8006

+   STA.W $0F7A,X

  .getYSpeed:
    LDA.W $0FAC,X
    SEP #$20
    CLC
    ADC.W $0F81,X
    STA.W $0F81,X
    REP #$20
    AND.W #$FF00
    XBA
    BPL .checkTopWall
    ORA.W #$FF00

  .checkTopWall:
    ADC.W $0F7E,X
    CMP.L $7E8000
    BPL .checkBottomWall
    LDA.L $7E8000
    STA.W $0F7E,X
    STZ.W $0FAC,X
    LDA.L $7E783E                                                        ; >_<
    LDA.W #$0004
    STA.L $7E783E
    RTS

  .checkBottomWall:
    CMP.L $7E8002
    BMI .done
    STZ.W $0FAC,X
    LDA.L $7E783E
    LDA.W #$0008
    STA.L $7E783E
    LDA.L $7E8002

  .done:
    STA.W $0F7E,X
    RTS


;;; $D914:  ;;;
CeresRidleyRoomShaking:
; Cause room shaking, only happens in Ceres. Has unreachable code for Norfair room shaking
    LDA.W AreaIndex
    CMP.W #$0002
    BEQ .return
    LDA.W $0FAA,X
    BPL .movingRight
    EOR.W #$FFFF
    INC

  .movingRight:
    STA.B $12
    LDA.W $0FAC,X
    BPL .movingDown
    EOR.W #$FFFF
    INC

  .movingDown:
    CMP.B $12
    BCS .XSpeedGreater
    LDA.B $12

  .XSpeedGreater:
    CMP.W #$0280
    BCC .return
    LDA.W AreaIndex
    CMP.W #$0002
    BEQ .norfair
    LDA.W #$0021
    BRA +

  .norfair:
    LDA.W #$0018                                                         ; dead code

+   STA.W EarthquakeType
    LDA.W #$000C
    STA.W EarthquakeTimer

  .return:
    RTS


;;; $D955:  ;;;
TurnAroundIfFacingAwayFromRoomCenter:
; Turn around if facing away from the center of the room (facing a wall)
    LDA.L $7E7820
    BEQ .facingLeft
    DEC
    BEQ .return
    LDA.W $0F79
    BPL .return
    LDA.W #InstList_Ridley_TurnFromRightToLeft
    BRA +

  .facingLeft:
    LDA.W $0F79
    BMI .return
    LDA.W #InstList_Ridley_TurnFromLeftToRight

+   STA.W $0F92
    LDA.W #$0002
    STA.W $0F94
    STZ.W $0F90

  .return:
    RTS


;;; $D97D:  ;;;
HandleWingFlapping:
; Handle wing flapping
    JSR CalculateWingFlapSpeed
    LDA.L $7E7812
    SEC
    SBC.L $7E7810
    STA.L $7E7812
    BPL .return
    LDA.W #$0020
    STA.L $7E7812
    LDA.L $7E780E
    INC
    CMP.W #$000A
    BCC .lessThanA
    LDA.W #$0000

  .lessThanA:
    STA.L $7E780E

  .return:
    RTS


;;; $D9A8:  ;;;
CalculateWingFlapSpeed:
; Calculate wing flap speed
    LDA.W $0FAA
    BPL +
    EOR.W #$FFFF
    INC

+   STA.B $12
    LDA.W $0FAC
    BPL +
    EOR.W #$FFFF
    INC

+   CLC
    ADC.B $12
    BNE .RidleyMoving
    STA.L $7E7810
    RTS

  .RidleyMoving:
    SEC
    SBC.B $12
    CMP.B $12
    BPL .YSpeedGreater
    LDA.B $12

  .YSpeedGreater:
    ASL
    ASL
    AND.W #$0F00
    XBA
    ASL
    CMP.W #$000E
    BCC .maxE
    LDA.W #$000E

  .maxE:
    TAX
    LDA.W .wingFlapSpeeds,X
    BIT.W $0FAC
    BMI .movingUp
    LSR

  .movingUp:
    STA.L $7E7810
    RTS

  .wingFlapSpeeds:
    dw $000C,$000E,$0010,$0012,$001C,$0020,$0028,$0030


;;; $D9FD:  ;;;
InitializeRibAnimation:
    LDA.W #RidleyRib_AnimationData
    STA.L $7E780A
    LDA.W #$0001
    STA.L $7E780C

  .return:
    RTS


;;; $DA0C:  ;;;
AnimateRidleysRibs:
; Animate Ridley's ribs
    LDA.L $7E780C
    DEC
    STA.L $7E780C
    BNE InitializeRibAnimation_return
    LDA.L $7E780A

  .loop:
    TAX
    LDA.W $0000,X
    BPL .timer
    STA.L $7E780A
    BRA .loop

  .timer:
    STA.L $7E780C
    LDY.W VRAMWriteStack
    LDA.W #Tiles_RidleysRibsAndClaws_0>>8&$FF00
    STA.W VRAMWrite.src+1,Y                                              ; >.<
    STA.W VRAMWrite[1].src+1,Y                                           ; >.<
    LDA.W $0002,X
    STA.W VRAMWrite.src,Y                                                ; >.<
    LDA.W $0004,X
    STA.W VRAMWrite[1].src,Y                                             ; >.<
    LDA.W #$7220
    STA.W VRAMWrite.dest,Y                                               ; >.<
    LDA.W #$7320
    STA.W VRAMWrite[1].dest,Y                                            ; >.<
    LDA.W #$0040
    STA.W VRAMWrite.size,Y                                               ; >.<
    STA.W VRAMWrite[1].size,Y                                            ; >.<
    TYA
    CLC
    ADC.W #$000E
    TAY
    STY.W VRAMWriteStack
    LDA.W #$0000
    STA.W VRAMWrite.size,Y
    TXA
    CLC
    ADC.W #$0006
    STA.L $7E780A
    RTS


RidleyRib_AnimationData:
; timer, src0, src1 (bank $B0)
    dw $0014
    dw Tiles_Ridley_1
    dw Tiles_Ridley_2

    dw $0014
    dw Tiles_RidleysRibsAndClaws_0
    dw Tiles_RidleysRibsAndClaws_3

    dw $0014
    dw Tiles_RidleysRibsAndClaws_1
    dw Tiles_RidleysRibsAndClaws_4

    dw $0014
    dw Tiles_RidleysRibsAndClaws_0
    dw Tiles_RidleysRibsAndClaws_3


if !FEATURE_KEEP_UNREFERENCED
UNUSED_RidleyRibAnimationDataPointer_A6DA89:
; indexed by $7E780A
    dw RidleyRib_AnimationData                                           ; Unused?
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $DA8B:  ;;;
TransferGraphicsForRidleysClawsHoldingSamusOrBabyMetroid:
    LDX.W #RidleyClawGraphicsPointers_released
    BCC .notHolding
    LDX.W #RidleyClawGraphicsPointers_holding

  .notHolding:
    LDY.W VRAMWriteStack
    LDA.W #Tiles_RidleysRibsAndClaws_0>>8&$FF00
    STA.W VRAMWrite.src+1,Y                                              ; >.<
    STA.W VRAMWrite[1].src+1,Y                                           ; >.<
    LDA.W $0000,X
    STA.W VRAMWrite.src,Y                                                ; >.<
    LDA.W $0002,X
    STA.W VRAMWrite[1].src,Y                                             ; >.<
    LDA.W #$7AC0
    STA.W VRAMWrite.dest,Y                                               ; >.<
    LDA.W #$7BC0
    STA.W VRAMWrite[1].dest,Y                                            ; >.<
    LDA.W #$0080
    STA.W VRAMWrite.size,Y                                               ; >.<
    STA.W VRAMWrite[1].size,Y                                            ; >.<
    TYA
    CLC
    ADC.W #$000E
    TAY
    STY.W VRAMWriteStack
    LDA.W #$0000
    STA.W VRAMWrite.size,Y
    RTS

; src0, src1 (bank $B0)
RidleyClawGraphicsPointers_released:
    dw Tiles_Ridley_3
    dw Tiles_Ridley_4

RidleyClawGraphicsPointers_holding:
    dw Tiles_RidleysRibsAndClaws_2
    dw Tiles_RidleysRibsAndClaws_5


;;; $DAD8:  ;;;
DrawRidleysWings:
; Drawing routine for Ridley's wings
    LDA.L $7E7820
    BEQ .facingLeft
    DEC
    BEQ .return
    LDA.W #$000A

  .facingLeft:
    CLC
    ADC.L $7E780E
    ASL
    TAX
    LDY.W .spritemapPointersLeft,X
    LDA.L $7E7818
    STA.B $16
    LDA.W $0F7A
    STA.B $12
    LDA.W $0F7E
    STA.B $14
    JMP RidleyGeneralUseDrawing

  .return:
    RTS

  .spritemapPointersLeft:
    dw Spritemap_RidleyWings_FacingLeft_FullyRaised
    dw Spritemap_RidleyWings_FacingLeft_MostlyRaised
    dw Spritemap_RidleyWings_FacingLeft_SlightlyRaised
    dw Spritemap_RidleyWings_FacingLeft_SlightlyLowered
    dw Spritemap_RidleyWings_FacingLeft_MostlyLowered
    dw Spritemap_RidleyWings_FacingLeft_FullyLowered
    dw Spritemap_RidleyWings_FacingLeft_MostlyLowered
    dw Spritemap_RidleyWings_FacingLeft_SlightlyLowered
    dw Spritemap_RidleyWings_FacingLeft_SlightlyRaised
    dw Spritemap_RidleyWings_FacingLeft_MostlyRaised

  .spritemapPointersRight:
    dw Spritemap_RidleyWings_FacingRight_FullyRaised
    dw Spritemap_RidleyWings_FacingRight_MostlyRaised
    dw Spritemap_RidleyWings_FacingRight_SlightlyRaised
    dw Spritemap_RidleyWings_FacingRight_SlightlyLowered
    dw Spritemap_RidleyWings_FacingRight_MostlyLowered
    dw Spritemap_RidleyWings_FacingRight_FullyLowered
    dw Spritemap_RidleyWings_FacingRight_MostlyLowered
    dw Spritemap_RidleyWings_FacingRight_SlightlyLowered
    dw Spritemap_RidleyWings_FacingRight_SlightlyRaised
    dw Spritemap_RidleyWings_FacingRight_MostlyRaised


;;; $DB2A:  ;;;
DrawRidleyTail:
; Draw tail
    LDA.W $0F86
    AND.W #$0100
    BEQ .notInvisible
    RTS

  .notInvisible:
    LDA.L $7E20A4
    STA.B $12
    LDA.L $7E20A6
    STA.B $14
    LDA.L $7E20A2
    CLC
    ADC.L $7E208E
    CLC
    ADC.W #$0008
    AND.W #$00F0
    LSR
    LSR
    LSR
    TAX
    LDY.W RidleyTailTipSpritemapPointers,X
    JSR GeneralPurposeRidleyDrawing_SetPalette
    LDA.L $7E2092
    STA.B $14
    LDA.L $7E2090
    STA.B $12
    LDY.W #Spritemap_RidleyTail_Small
    JSR GeneralPurposeRidleyDrawing_SetPalette
    LDA.L $7E207C
    STA.B $12
    LDA.L $7E207E
    STA.B $14
    LDY.W #Spritemap_RidleyTail_Small
    JSR GeneralPurposeRidleyDrawing_SetPalette
    LDA.L $7E2068
    STA.B $12
    LDA.L $7E206A
    STA.B $14
    LDY.W #Spritemap_RidleyTail_Medium
    JSR GeneralPurposeRidleyDrawing_SetPalette
    LDA.L $7E2054
    STA.B $12
    LDA.L $7E2056
    STA.B $14
    LDY.W #Spritemap_RidleyTail_Medium
    JSR GeneralPurposeRidleyDrawing_SetPalette
    LDA.L $7E2040
    STA.B $12
    LDA.L $7E2042
    STA.B $14
    LDY.W #Spritemap_RidleyTail_Large
    JSR GeneralPurposeRidleyDrawing_SetPalette
    LDA.L $7E202C
    STA.B $12
    LDA.L $7E202E
    STA.B $14
    LDY.W #Spritemap_RidleyTail_Large                                    ; fallthrough to GeneralPurposeRidleyDrawing


;;; $DBC2:  ;;;
GeneralPurposeRidleyDrawing_SetPalette:
; General use draw, 7E7818 has pallete (wing/tail), Y is pointer to sprite data
    LDA.L $7E7818
    STA.B $16
    JMP RidleyGeneralUseDrawing


;;; $DBCB:  ;;;
GetBabyMetroidSpritemapPointerFromInstList:
; Calculate graphic to use.
; JSR to with an address (in ram) of a pointer followed by a counter,
; data at pointer (to rom) should be a counter (frame duration) followed by a graphic pointer,
; OR a pointer to code.
    STA.B $00
    INC
    INC
    STA.B $03
    SEP #$20
    LDA.B #$7E
    STA.B $02
    STA.B $05
    REP #$20
    LDA.B [$00]
    BMI .pointer
    PLA
    RTS

  .pointer:
    TAX
    LDA.W $0000,X
    BMI .instruction
    CMP.B [$03]
    BNE .timerDoesNotMatchCounter
    INX
    INX
    INX
    INX

  .manualReturn:
    LDA.W $0000,X
    BPL .notInstruction

  .instruction:
    STA.B $06
    INX
    INX
    PEA .manualReturn-1
    JMP.W ($0006)

  .notInstruction:
    LDA.W #$0001
    STA.B [$03]
    TXA
    STA.B [$00]
    LDY.W $0002,X
    RTS

  .timerDoesNotMatchCounter:
    LDA.B [$03]
    INC
    STA.B [$03]
    LDY.W $0002,X
    RTS


;;; $DC13:  ;;;
RidleyGeneralUseDrawing:
; General use draw, $16 has pallete, Y is pointer to sprite data.
    LDA.W $0000,Y
    INY
    INY
    STA.B $18
    LDX.W $0590
    CLC

  .loop:
    LDA.W $0001,Y
    AND.W #$FF00
    BPL +
    ORA.W #$00FF

+   XBA
    CLC
    ADC.B $14
    SEC
    SBC.W $0915
    BMI .next
    CMP.W #$00E0
    BPL .next
    STA.B $1A
    LDA.W $0000,Y
    ADC.B $12
    SEC
    SBC.W $0911
    STA.W $0370,X
    AND.W #$0100
    BEQ +
    LDA.L MapOfOAMIndexToHighOAM_address,X
    STA.B $1C
    LDA.B ($1C)
    ORA.L MapOfOAMIndex_highXPosBit,X
    STA.B ($1C)

+   LDA.W $0000,Y
    BPL +
    LDA.L MapOfOAMIndexToHighOAM_address,X
    STA.B $1C
    LDA.B ($1C)
    ORA.L MapOfOAMIndex_sizeBit,X
    STA.B ($1C)

+   LDA.B $1A
    STA.W $0371,X
    LDA.W $0003,Y
    ORA.B $16
    STA.W $0372,X
    TXA
    CLC
    ADC.W #$0004
    AND.W #$01FF
    TAX

  .next:
    TYA
    CLC
    ADC.W #$0005
    TAY
    DEC.B $18
    BNE .loop
    STX.W $0590
    RTS


;;; $DC90: Spritemaps ;;;
Spritemap_RidleyTail_Large:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $1E0)

Spritemap_RidleyTail_Medium:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $1E2)

Spritemap_RidleyTail_Small:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $1E4)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_RidleyTail_Large_A6DCA5:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 1, 3, 0, $1E0)

UNUSED_Spritemap_RidleyTail_Medium_A6DCAC:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 1, 3, 0, $1E2)

UNUSED_Spritemap_RidleyTail_Small_A6DCB3:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 1, 3, 0, $1E4)
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $DCBA: Spritemap pointers ;;;
RidleyTailTipSpritemapPointers:
    dw Spritemap_RidleyTailTip_PointingDown
    dw Spritemap_RidleyTailTip_PointingDownDownRight
    dw Spritemap_RidleyTailTip_PointingDownRight
    dw Spritemap_RidleyTailTip_PointingRightDownRight
    dw Spritemap_RidleyTailTip_PointingRight
    dw Spritemap_RidleyTailTip_PointingRightUpRight
    dw Spritemap_RidleyTailTip_PointingUpRight
    dw Spritemap_RidleyTailTip_PointingUpUpRight
    dw Spritemap_RidleyTailTip_PointingUp
    dw Spritemap_RidleyTailTip_PointingUpUpLeft
    dw Spritemap_RidleyTailTip_PointingUpLeft
    dw Spritemap_RidleyTailTip_PointingLeftUpLeft
    dw Spritemap_RidleyTailTip_PointingLeft
    dw Spritemap_RidleyTailTip_PointingLeftDownLeft
    dw Spritemap_RidleyTailTip_PointingDownLeft
    dw Spritemap_RidleyTailTip_PointingDownDownLeft


;;; $DCDA: Spritemaps ;;;
Spritemap_RidleyTailTip_PointingLeft:
    dw $0001
    %spritemapEntry(1, $43F0, $F8, 0, 0, 3, 0, $1E6)

Spritemap_RidleyTailTip_PointingLeftUpLeft:
    dw $0001
    %spritemapEntry(1, $43F0, $F4, 0, 0, 3, 0, $1E8)

Spritemap_RidleyTailTip_PointingUpLeft:
    dw $0001
    %spritemapEntry(1, $43F2, $F3, 0, 0, 3, 0, $1EA)

Spritemap_RidleyTailTip_PointingUpUpLeft:
    dw $0001
    %spritemapEntry(1, $43F4, $F0, 0, 0, 3, 0, $1EC)

Spritemap_RidleyTailTip_PointingUp:
    dw $0001
    %spritemapEntry(1, $43F8, $F0, 0, 0, 3, 0, $1EE)

Spritemap_RidleyTailTip_PointingUpUpRight:
    dw $0001
    %spritemapEntry(1, $43FC, $F0, 0, 1, 3, 0, $1EC)

Spritemap_RidleyTailTip_PointingUpRight:
    dw $0001
    %spritemapEntry(1, $43FE, $F3, 0, 1, 3, 0, $1EA)

Spritemap_RidleyTailTip_PointingRightUpRight:
    dw $0001
    %spritemapEntry(1, $4200, $F4, 0, 1, 3, 0, $1E8)

Spritemap_RidleyTailTip_PointingRight:
    dw $0001
    %spritemapEntry(1, $4200, $F8, 0, 1, 3, 0, $1E6)

Spritemap_RidleyTailTip_PointingRightDownRight:
    dw $0001
    %spritemapEntry(1, $4200, $FC, 1, 1, 3, 0, $1E8)

Spritemap_RidleyTailTip_PointingDownRight:
    dw $0001
    %spritemapEntry(1, $43FE, $FE, 1, 1, 3, 0, $1EA)

Spritemap_RidleyTailTip_PointingDownDownRight:
    dw $0001
    %spritemapEntry(1, $43FC, $00, 1, 1, 3, 0, $1EC)

Spritemap_RidleyTailTip_PointingDown:
    dw $0001
    %spritemapEntry(1, $43F9, $00, 1, 1, 3, 0, $1EE)

Spritemap_RidleyTailTip_PointingDownDownLeft:
    dw $0001
    %spritemapEntry(1, $43F4, $FF, 1, 0, 3, 0, $1EC)

Spritemap_RidleyTailTip_PointingDownLeft:
    dw $0001
    %spritemapEntry(1, $43F2, $FE, 1, 0, 3, 0, $1EA)

Spritemap_RidleyTailTip_PointingLeftDownLeft:
    dw $0001
    %spritemapEntry(1, $43F0, $FC, 1, 0, 3, 0, $1E8)

Spritemap_RidleyWings_FacingLeft_FullyRaised:
    dw $0006
    %spritemapEntry(0, $2C, $D7, 0, 0, 3, 0, $108)
    %spritemapEntry(0, $0C, $EF, 0, 0, 3, 0, $128)
    %spritemapEntry(1, $421C, $DF, 0, 0, 3, 0, $116)
    %spritemapEntry(1, $420C, $DF, 0, 0, 3, 0, $114)
    %spritemapEntry(1, $421C, $D7, 0, 0, 3, 0, $106)
    %spritemapEntry(1, $420C, $D7, 0, 0, 3, 0, $104)

Spritemap_RidleyWings_FacingLeft_MostlyRaised:
    dw $0005
    %spritemapEntry(0, $2C, $E4, 0, 0, 3, 0, $11D)
    %spritemapEntry(1, $421C, $E4, 0, 0, 3, 0, $11B)
    %spritemapEntry(1, $420C, $E4, 0, 0, 3, 0, $119)
    %spritemapEntry(1, $421C, $DC, 0, 0, 3, 0, $10B)
    %spritemapEntry(1, $420C, $DC, 0, 0, 3, 0, $109)

Spritemap_RidleyWings_FacingLeft_SlightlyRaised:
    dw $0003
    %spritemapEntry(0, $2C, $F0, 0, 0, 3, 0, $148)
    %spritemapEntry(1, $421C, $E8, 0, 0, 3, 0, $136)
    %spritemapEntry(1, $420C, $E8, 0, 0, 3, 0, $134)

Spritemap_RidleyWings_FacingLeft_SlightlyLowered:
    dw $0003
    %spritemapEntry(0, $2C, $E8, 1, 0, 3, 0, $148)
    %spritemapEntry(1, $421C, $E8, 1, 0, 3, 0, $136)
    %spritemapEntry(1, $420C, $E8, 1, 0, 3, 0, $134)

Spritemap_RidleyWings_FacingLeft_MostlyLowered:
    dw $0005
    %spritemapEntry(0, $2C, $F2, 1, 0, 3, 0, $11D)
    %spritemapEntry(1, $421C, $EA, 1, 0, 3, 0, $11B)
    %spritemapEntry(1, $420C, $EA, 1, 0, 3, 0, $119)
    %spritemapEntry(1, $421C, $F2, 1, 0, 3, 0, $10B)
    %spritemapEntry(1, $420C, $F2, 1, 0, 3, 0, $109)

Spritemap_RidleyWings_FacingLeft_FullyLowered:
    dw $0006
    %spritemapEntry(0, $2C, $FF, 1, 0, 3, 0, $108)
    %spritemapEntry(0, $0C, $E7, 1, 0, 3, 0, $128)
    %spritemapEntry(1, $421C, $EF, 1, 0, 3, 0, $116)
    %spritemapEntry(1, $420C, $EF, 1, 0, 3, 0, $114)
    %spritemapEntry(1, $421C, $F7, 1, 0, 3, 0, $106)
    %spritemapEntry(1, $420C, $F7, 1, 0, 3, 0, $104)

Spritemap_RidleyWings_FacingRight_FullyRaised:
    dw $0006
    %spritemapEntry(0, $1CC, $D7, 0, 1, 3, 0, $108)
    %spritemapEntry(0, $1EC, $EF, 0, 1, 3, 0, $128)
    %spritemapEntry(1, $43D4, $DF, 0, 1, 3, 0, $116)
    %spritemapEntry(1, $43E4, $DF, 0, 1, 3, 0, $114)
    %spritemapEntry(1, $43D4, $D7, 0, 1, 3, 0, $106)
    %spritemapEntry(1, $43E4, $D7, 0, 1, 3, 0, $104)

Spritemap_RidleyWings_FacingRight_MostlyRaised:
    dw $0005
    %spritemapEntry(0, $1CC, $E4, 0, 1, 3, 0, $11D)
    %spritemapEntry(1, $43D4, $E4, 0, 1, 3, 0, $11B)
    %spritemapEntry(1, $43E4, $E4, 0, 1, 3, 0, $119)
    %spritemapEntry(1, $43D4, $DC, 0, 1, 3, 0, $10B)
    %spritemapEntry(1, $43E4, $DC, 0, 1, 3, 0, $109)

Spritemap_RidleyWings_FacingRight_SlightlyRaised:
    dw $0003
    %spritemapEntry(0, $1CC, $F0, 0, 1, 3, 0, $148)
    %spritemapEntry(1, $43D4, $E8, 0, 1, 3, 0, $136)
    %spritemapEntry(1, $43E4, $E8, 0, 1, 3, 0, $134)

Spritemap_RidleyWings_FacingRight_SlightlyLowered:
    dw $0003
    %spritemapEntry(0, $1CC, $E8, 1, 1, 3, 0, $148)
    %spritemapEntry(1, $43D4, $E8, 1, 1, 3, 0, $136)
    %spritemapEntry(1, $43E4, $E8, 1, 1, 3, 0, $134)

Spritemap_RidleyWings_FacingRight_MostlyLowered:
    dw $0005
    %spritemapEntry(0, $1CC, $F2, 1, 1, 3, 0, $11D)
    %spritemapEntry(1, $43D4, $EA, 1, 1, 3, 0, $11B)
    %spritemapEntry(1, $43E4, $EA, 1, 1, 3, 0, $119)
    %spritemapEntry(1, $43D4, $F2, 1, 1, 3, 0, $10B)
    %spritemapEntry(1, $43E4, $F2, 1, 1, 3, 0, $109)

Spritemap_RidleyWings_FacingRight_FullyLowered:
    dw $0006
    %spritemapEntry(0, $1CC, $FF, 1, 1, 3, 0, $108)
    %spritemapEntry(0, $1EC, $E7, 1, 1, 3, 0, $128)
    %spritemapEntry(1, $43D4, $EF, 1, 1, 3, 0, $116)
    %spritemapEntry(1, $43E4, $EF, 1, 1, 3, 0, $114)
    %spritemapEntry(1, $43D4, $F7, 1, 1, 3, 0, $106)
    %spritemapEntry(1, $43E4, $F7, 1, 1, 3, 0, $104)


;;; $DE7A:  ;;;
CheckIfRidleyIsOnScreen:
; Checks if Ridley is on screen
    LDA.W $0F7E
    BMI .offScreen
    CLC
    ADC.W #$0020
    SEC
    SBC.W $0915
    BMI .offScreen
    CMP.W #$0120
    BPL .offScreen
    LDA.W $0F7A
    BMI .offScreen
    CLC
    ADC.W #$0020
    SEC
    SBC.W $0911
    BMI .offScreen
    CMP.W #$0140
    BPL .offScreen
    CLC
    RTS

  .offScreen:
    SEC
    RTS


;;; $DEA6:  ;;;
RidleyTail_vs_SamusProjectile_CollisionDetection:
; Check Tail/Projectile collisions
    LDA.W $0CCE
    BNE .projectilesToCheck
    CLC
    RTS

  .projectilesToCheck:
    LDY.W #$0000

  .loop:
    LDA.W $0C18,Y
    BPL .nextProjectile
    XBA
    AND.W #$000F
    CMP.W #$0003
    BPL .nextProjectile
    LDA.W $0B64,Y
    SEC
    SBC.B $12
    BPL +
    EOR.W #$FFFF
    INC

+   SEC
    SBC.W $0BB4,Y
    BCC .checkYPosition
    CMP.B $16
    BCS .nextProjectile

  .checkYPosition:
    LDA.W $0B78,Y
    SEC
    SBC.B $14
    BPL +
    EOR.W #$FFFF
    INC

+   SEC
    SBC.W $0BC8,Y
    BCC .collision
    CMP.B $18
    BCC .collision

  .nextProjectile:
    INY
    INY
    CPY.W #$000A
    BMI .loop
    CLC
    RTS

  .collision:
    LDA.B $12
    STA.W $0B64,Y
    LDA.B $14
    STA.W $0B78,Y
    LDA.W $0C04,Y
    ORA.W #$0010
    STA.W $0C04,Y
    SEC
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $DF08:  ;;;
UNUSED_ChangeRidleyProjectileDirection_A6DF08:
    LDA.W $0C04,Y
    AND.W #$000F
    CMP.W #$0007
    BNE .notFacingLeft
    LDA.W #$0001
    BRA .done

  .notFacingLeft:
    CMP.W #$0002
    BNE .notLeftOrRight
    LDA.W #$0008
    BRA .done

  .notLeftOrRight:
    LDA.W #$0005

  .done:
    STA.W $0C04,Y
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $DF29:  ;;;
EfficientCollisionDetectionForSamusAt_12_14:
; Efficient collision detection for Samus and $12/$14 (size of $12/$14 is $16/$18). SEC if collision
    LDA.W SamusXPosition
    SEC
    SBC.B $12
    BPL +
    EOR.W #$FFFF
    INC

+   SEC
    SBC.W SamusXRadius
    BCC +
    CMP.B $16
    BCS .returnNoCollision

+   LDA.W SamusYPosition
    SEC
    SBC.B $14
    BPL +
    EOR.W #$FFFF
    INC

+   SEC
    SBC.W SamusYRadius
    BCC .returnCollision
    CMP.B $18
    BCC .returnCollision

  .returnNoCollision:
    CLC
    RTS

  .returnCollision:
    SEC
    RTS


RidleyHitbox_vs_Samus_Collision:
    JSL NormalEnemyTouchAI_NoDeathCheck_External
    JMP RTL_A6DFB6                                                     ; >.<


if !FEATURE_KEEP_UNREFERENCED
;;; $DF60:  ;;;
UNUSED_RidleyDamagesSamus_A6DF60:
    JSR UNUSED_RidleyDamagesSamus_A6DF66
    JMP RTL_A6DFB6


UNUSED_RidleyDamagesSamus_A6DF66:
    JSL DealSuitAdjustedEnemyDamageToSamus
    LDA.W #$0060
    STA.W $18A8
    LDA.W #$0005
    STA.W $18AA
    LDY.W #$0000
    LDX.W EnemyIndex
    LDA.W SamusXPosition
    SEC
    SBC.W $0F7A,X
    BMI .left
    INY

  .left:
    STY.W $0A54
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $DF8A: Enemy shot - enemy $E13F/$E17F (Ridley) ;;;
EnemyShot_Ridley:
    LDA.W AreaIndex
    CMP.W #$0002
    BEQ .NorfairRidley
    LDY.W #$000D
    LDA.W $0F9C
    BEQ .oddFlashTimer
    LSR
    BCC .oddFlashTimer
    INY

  .oddFlashTimer:
    STY.W $0F9C
    LDA.L $7E781A
    INC
    STA.L $7E781A
    BRA RTL_A6DFB6

  .NorfairRidley:
    JSL NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External
    BRA RTL_A6DFB6


;;; $DFB2: Power bomb reaction - enemy $E13F/$E17F (Ridley) ;;;
PowerBombReaction_Ridley:
    JSL NormalEnemyPowerBombAI_NoDeathCheck_External                   ; fallthrough to RTL_A6DFB6


;;; $DFB6: RTL. Ridley reaction ;;;
RTL_A6DFB6:
    RTL


;;; $DFB7:  ;;;
SetRidleyAsDead:
; Set 7802 to dead, disable Samus/Ridley interaction, next AI script is Function_Ridley_MoveToDeathSpot
    LDA.W Enemy.health
    BNE .return
    LDA.L $7E7802
    BMI .return
    LDA.W #$FFFF
    STA.L $7E7802
    LDA.W $0F86
    ORA.W #$0400
    STA.W $0F86
    LDA.W #Function_Ridley_MoveToDeathSpot
    STA.W $0FA8

  .return:
    RTL


;;; $DFD9:  ;;;
RidleyTail_vs_Samus_Interaction:
; Tail/Samus interaction
    LDA.W #$000E
    STA.B $16
    STA.B $18
    LDA.L $7E20A4
    STA.B $12
    LDA.L $7E20A6
    STA.B $14
    JSR EfficientCollisionDetectionForSamusAt_12_14
    BCC .return
    LDA.L $7E7838
    JSL Suit_Damage_Division
    JSL Deal_A_Damage_to_Samus
    LDA.W #$0060
    STA.W $18A8
    LDA.W #$0005
    STA.W $18AA
    LDY.W #$0000
    LDA.W SamusXPosition
    SEC
    SBC.L $7E20A4
    BMI .knockbackDirection
    INY

  .knockbackDirection:
    STY.W $0A54

  .return:
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $E01B:  ;;;
UNUSED_ProjectileCollision_A6E01B:
    LDX.W EnemyIndex
    LDA.W $0B64
    SEC
    SBC.W $0F7A,X
    STA.B $12
    LDA.W $0B78
    SEC
    SBC.W $0F7E,X
    STA.B $14
    JSL CalculateAngleOf_12_14_Offset
    SEC
    SBC.W #$0080
    EOR.W #$FFFF
    INC
    CLC
    ADC.W #$0080
    AND.W #$00FF
    STA.B $12
    LDA.W $18A6
    ASL
    TAX
    LDA.W $0C2C,X
    ASL
    ASL
    CMP.W #$0300
    BCC +
    LDA.W #$0300

+   PHA
    JSL CalculateXVelocityFromSpeedAndAngle
    STA.B $12
    LDX.W EnemyIndex
    EOR.W $0FAA,X
    BPL +
    LDA.B $12
    CLC
    ADC.W $0FAA,X
    STA.W $0FAA,X

+   PLA
    JSL CalculateYVelocityFromSpeedAndAngle
    STA.B $12
    LDX.W EnemyIndex
    EOR.W $0FAC,X
    BPL .return
    LDA.B $12
    CLC
    ADC.W $0FAC,X
    STA.W $0FAC,X

  .return:
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $E088:  ;;;
KillProjectilesWithRidleyTailTip:
; Tail tip kills projectiles
    LDA.W $0F86
    AND.W #$0400
    BEQ .notIntangible
    RTS

  .notIntangible:
    LDA.W #$000E
    STA.B $16
    STA.B $18
    LDA.L $7E20A4
    STA.B $12
    LDA.L $7E20A6
    STA.B $14
    JSR RidleyTail_vs_SamusProjectile_CollisionDetection
    BCS TailProjectileCollision
    LDA.W #$000A
    STA.B $16
    STA.B $18
    LDA.L $7E2090
    STA.B $12
    LDA.L $7E2092
    STA.B $14
    JSR RidleyTail_vs_SamusProjectile_CollisionDetection
    BCS TailProjectileCollision
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $E0C2:  ;;;
UNUSED_TailProjectileCollision_A6E0C2:
    LDA.L $7E207C
    STA.B $12
    LDA.L $7E207E
    STA.B $14
    JSR RidleyTail_vs_SamusProjectile_CollisionDetection
    BCS TailProjectileCollision
    LDA.W #$000B
    STA.B $16
    STA.B $18
    LDA.L $7E2068
    STA.B $12
    LDA.L $7E206A
    STA.B $14
    JSR RidleyTail_vs_SamusProjectile_CollisionDetection
    BCS TailProjectileCollision
    LDA.L $7E2054
    STA.B $12
    LDA.L $7E2056
    STA.B $14
    JSR RidleyTail_vs_SamusProjectile_CollisionDetection
    BCS TailProjectileCollision
    LDA.W #$000D
    STA.B $16
    STA.B $18
    LDA.L $7E2040
    STA.B $12
    LDA.L $7E2042
    STA.B $14
    JSR RidleyTail_vs_SamusProjectile_CollisionDetection
    BCS TailProjectileCollision
    LDA.L $7E202C
    STA.B $12
    LDA.L $7E202E
    STA.B $14
    JSR RidleyTail_vs_SamusProjectile_CollisionDetection
    BCS TailProjectileCollision
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $E126:  ;;;
TailProjectileCollision:
    LDA.W $0B64,Y
    STA.B $12
    LDA.W $0B78,Y
    STA.B $14
    LDA.W $0C19,Y
    AND.W #$000F
    LDY.W #$000C
    DEC
    BNE .notAMissile
    LDA.W #$003D
    JSL QueueSound_Lib1_Max6
    LDY.W #$0006

  .notAMissile:
    TYA
    LDY.W #EnemyProjectile_MiscDust
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    RTS


;;; $E14F: Palette - enemy $E13F/$E17F (Ridley) ;;;
Palette_Ridley:
    dw $0000,$56BA,$41B2,$1447,$0403,$4E15,$3570,$24CB
    dw $1868,$5E5F,$183F,$1014,$031F,$01DA,$00F5,$0C63


;;; $E16F: Palettes ;;;
Palette_CeresRidleyInit:
; Ceres Ridley init, sprite palette 2
    dw $0000,$7E20,$6560,$2060,$1000,$7940,$5D00,$4CA0
    dw $3CA0,$43FF,$0113,$000F,$175C,$0299,$01D6,$57E0

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Palette_Ridley_A6E18F:
    dw $0000,$6BF5,$06E1,$0641,$05A1,$5E5F,$183F,$1014
    dw $080A,$0404,$4F9F,$3ED8,$2E12,$6F70,$7FFF,$5EE0
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $E1AF: Palette - enemy $E1BF (Ridley explosion) ;;;
Palette_RidleyExplosion_0:
    dw $3800,$56BA,$41B2,$1447,$0403,$4E15,$3570,$24CB

Palette_RidleyExplosion_1:
    dw $1868,$5E5F,$183F,$1014,$031F,$01DA,$00F5,$0C63


;;; $E1CF: Palettes ;;;
; Enemy $E1FF (Ceres steam) palette points to Palette_CeresSteam, right in the middle of this section...
Palette_NorfairRidleyInit:
; Norfair Ridley init, sprite palette 2
    dw $3800,$6B5A,$5652,$28E7,$1863,$62B5,$4A10,$396B
    dw $3129,$43FF,$0113,$000F,$175C,$0299,$01D6,$3BE0

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Palette_Ridley_A6E1EF:
    dw $3800
endif ; !FEATURE_KEEP_UNREFERENCED

Palette_BabyMetroidCutscene_EndOfInstList:
    dw $6BF5,$06E1,$0641,$05A1,$5E5F,$183F,$1014,$080A
    dw $0404,$4F9F,$3ED8,$2E12,$6F70,$7FFF,$5EE0

Palette_BabyMetroidCutscene_HorizontalSquish:
    dw $6BF5,$06E1,$0641,$05A1,$5E5F,$183F,$1014,$080A
    dw $0404,$4F9F,$3ED8,$2E12,$6F70,$7FFF,$5EE0

Palette_BabyMetroidCutscene_Round:
    dw $77F8,$1344,$12A4,$1204,$6ABF,$249F,$1C77,$146D
    dw $1067

Palette_CeresSteam:
    dw $5BFF,$4B38,$3A72,$7BD3,$7FFF,$6B43

Palette_BabyMetroidCutscene_VerticalSquish:
    dw $7FFB,$1FA7,$1F07,$1E67,$771F,$30FF,$28DA,$20D0
    dw $1CCA,$67FF,$579B,$46D5,$7BD6,$7FFF,$77A6


;;; $E269:  ;;;
CeresRidleyEyeFadeInIndices:
; Ceres Ridley: indices into color data below ($E2AA)
;   indexed by $0FB0
;   reads F first and increments $0FB0 every frame
    db $0F,$0E,$0D,$0C,$0B,$0A,$09,$08,$07,$06,$05,$04,$03,$02,$01,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $FF


;;; $E2AA:  ;;;
CeresRidleyEyeFadeInColors:
; Ceres Ridley: eye glow fade in? colors
; indexed by $0FB0 * 6 + CeresRidleyEyeFadeInIndices
  .0:
    dw $031F
  .1:
    dw       $01DA
  .2:
    dw             $00F5
    dw $02DD,$01B8,$00D3
    dw $029A,$0196,$00D2
    dw $0278,$0174,$00B0
    dw $0236,$0153,$00AF
    dw $0214,$0131,$008E
    dw $01D2,$010F,$008C
    dw $0190,$00ED,$006B
    dw $016E,$00CC,$0069
    dw $012C,$00AA,$0048
    dw $010A,$0088,$0047
    dw $00C8,$0067,$0025
    dw $0086,$0045,$0024
    dw $0064,$0023,$0022
    dw $0022,$0021,$0001
    dw $0000,$0000,$0000


;;; $E30A:  ;;;
Palette_Ridley_FadeIn:
; Ceres / Norfair Ridley
; Fade in palettes
; Sprite palette 1 and 7
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0421,$0401,$0000,$0000,$0421
    dw $0001,$0000,$0000,$0422,$0002,$0001,$0843,$0822
    dw $0001,$0000,$0842,$0422,$0401,$0001,$0C44,$0004
    dw $0002,$1085,$0C43,$0401,$0000,$0C64,$0843,$0422
    dw $0401,$1066,$0406,$0004,$14A7,$1064,$0401,$0000
    dw $1485,$0C64,$0823,$0402,$1888,$0408,$0405,$1CE8
    dw $1486,$0402,$0001,$18A7,$1065,$0C43,$0822,$1CCA
    dw $080A,$0406,$210A,$18A7,$0802,$0001,$1CC8,$1486
    dw $0C44,$0823,$24EC,$080C,$0408,$252C,$1CC8,$0823
    dw $0001,$20E9,$18A7,$1045,$0823,$290E,$080E,$0409
    dw $2D6D,$20E9,$0823,$0001,$290B,$1CA8,$1065,$0C24
    dw $3130,$0C10,$080A,$318F,$24EA,$0C24,$0001,$2D2C
    dw $1CC9,$1466,$0C24,$3552,$0C12,$080C,$39D1,$290C
    dw $0C24,$0002,$314E,$20EA,$1887,$1045,$3D94,$1014
    dw $080D,$3DF3,$2D2D,$0C25,$0002,$396F,$250B,$1888
    dw $1045,$41B6,$1016,$0C0E,$4214,$314E,$1025,$0002
    dw $3D90,$290C,$1C88,$1046,$49D8,$1018,$0C10,$4A56
    dw $356F,$1026,$0002,$41B2,$2D2D,$1CA9,$1447,$51FA
    dw $141A,$0C11,$4E78,$3D90,$1026,$0402,$45F3,$314F
    dw $20AA,$1447,$561D,$143D,$0C12,$56BA,$41B2,$1447
    dw $0403,$4E15,$3570,$24CB,$1868,$5E5F,$183F,$1014


;;; $E46A:  ;;;
Palette_Ridley_HealthBased_Below9000:
    dw $4E7A,$3D73,$1449,$0405,$45D6,$3151,$20AD,$184A,$561F,$183F,$1015,$02BF,$019A,$00D6 ; < 9000

Palette_Ridley_HealthBased_Below5400:
    dw $4A5A,$3973,$142A,$0407,$45B6,$3132,$20AE,$184B,$51FF,$183F,$1015,$029F,$019A,$00D6 ; < 5400

Palette_Ridley_HealthBased_Below1800:
    dw $4A3B,$3954,$142B,$0808,$41B7,$2D33,$20AF,$184C,$4DDF,$183F,$1016,$067F,$057B,$04B7 ; < 1800


;;; $E4BE: Instruction ;;;
Instruction_Ridley_QueueRoarSFX:
    LDA.W #$0059
    STA.L $7E781E
    JSL QueueSound_Lib2_Max6
    RTL


;;; $E4CA: Instruction ;;;
Instruction_Ridley_ResetRoarFlag:
    LDA.W #$0000
    STA.L $7E781E
    RTL


;;; $E4D2: Instruction ;;;
Inst_Ridley_GotoYAndSetTimerTo8IfNotNorfairOrSamusLowEnergy:
; If in Norfair or Samus is below 30 health, go to next instruction. Else go to argument, and set main AI script timer to 8
    LDA.W AreaIndex
    CMP.W #$0002
    BEQ Instruction_Ridley_SkipToNextInstruction
    LDA.W $09C2
    CMP.W #$001E
    BPL Instruction_Ridley_SkipToNextInstruction
    LDA.W #$0008
    STA.L $7E7800                                                        ; fallthrough to Instruction_Ridley_GotoY


;;; $E4E9: Instruction - go to [[Y]] ;;;
Instruction_Ridley_GotoY:
    LDA.W $0000,Y
    TAY
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $E4EE: Instruction ;;;
UNUSED_Instruction_RidleyCeres_GotoYIfNotHoldingBaby_A6E4EE:
    LDA.L $7E7836
    BNE Instruction_Ridley_GotoY
    INY
    INY
    BRA Instruction_Ridley_GotoY


;;; $E4F8: Instruction ;;;
UNUSED_Instruction_RidleyCeres_GotoYIfHoldingBaby_A6E4F8:
    LDA.L $7E7836
    BEQ Instruction_Ridley_GotoY
    INY
    INY
    RTL
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $E501: Instruction ;;;
Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement:
    LDA.W SamusXPosition
    STA.W $0B10
    LDA.W SamusYPosition
    STA.W $0B14
    LDA.W $0000,Y
    STA.L $7E783A                                                        ; fallthrough to Instruction_Ridley_SkipToNextInstruction


;;; $E514: Y += 2 ;;;
Instruction_Ridley_SkipToNextInstruction:
    INY
    INY
    RTL


;;; $E517: Instruction ;;;
Instruction_Ridley_GotoYIfNotFacingLeft:
; Move on to next command if Ridley is facing left, else go to argument.
    LDA.L $7E7820
    BEQ Instruction_Ridley_SkipToNextInstruction
    BRA Instruction_Ridley_GotoY


;;; $E51F: Instruction ;;;
Instruction_Ridley_MoveRidleyWithArgsInY:
; Add the following bytes to Ridley's X / Y position
    LDA.W $0000,Y
    CLC
    ADC.W $0F7A
    STA.W $0F7A
    LDA.W $0002,Y
    CLC
    ADC.W $0F7E
    STA.W $0F7E
    INY
    INY
    INY
    INY
    RTL


;;; $E538: Instruction list -  ;;;
InstList_Ridley_FacingLeft_Initial:
; Initialization (draws and avoids crashing)
    dw Instruction_Ridley_GotoYIfNotFacingLeft
    dw InstList_Ridley_FacingRight_Initial
    dw $000C,ExtendedSpritemap_Ridley_FacingLeft
    dw Instruction_Common_Sleep


;;; $E542: Instruction list -  ;;;
InstList_Ridley_FacingRight_Initial:
    dw $000C,ExtendedSpritemap_Ridley_FacingRight
    dw Instruction_Common_Sleep


;;; $E548: Instruction list -  ;;;
InstList_RidleyCeres_FacingLeft_Lunging:
    dw Instruction_Ridley_GotoYIfNotFacingLeft
    dw UNUSED_InstList_RidleyCeres_FacingRight_Lunging_A6E576
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement,$0000
    dw $0004,ExtendedSpritemap_Ridley_FacingLeft
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement,$0002
    dw $0006,ExtendedSpritemap_Ridley_FacingLeft_LegsHalfExtended
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement,$0004
    dw $0050,ExtendedSpritemap_Ridley_FacingLeft_LegsExtended
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement,$0002
    dw $0006,ExtendedSpritemap_Ridley_FacingLeft_LegsHalfExtended
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement,$0000
    dw $0004,ExtendedSpritemap_Ridley_FacingLeft
    dw Instruction_Common_Sleep


;;; $E576: Instruction list -  ;;;
UNUSED_InstList_RidleyCeres_FacingRight_Lunging_A6E576:
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement,$0000
    dw $0004,ExtendedSpritemap_Ridley_FacingRight
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement,$0002
    dw $0006,ExtendedSpritemap_Ridley_FacingRight_LegsHalfExtended
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement,$0004
    dw $0050,ExtendedSpritemap_Ridley_FacingRight_LegsExtended
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement,$0002
    dw $0006,ExtendedSpritemap_Ridley_FacingRight_LegsHalfExtended
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement,$0000
    dw $0004,ExtendedSpritemap_Ridley_FacingRight
    dw Instruction_Common_Sleep


if !FEATURE_KEEP_UNREFERENCED
;;; $E5A0: Instruction list -  ;;;
UNUSED_InstList_RidleyCeres_FacingLeft_A6E5A0:
    dw Instruction_Ridley_GotoYIfNotFacingLeft
    dw UNUSED_InstList_RidleyCeres_FacingRight_A6E5FE
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement,$0000
    dw $0002,ExtendedSpritemap_Ridley_FacingLeft
    dw UNUSED_Instruction_RidleyCeres_GotoYIfHoldingBaby_A6E4F8
    dw UNUSED_InstList_RidleyCeres_FacingLeft_HoldingBaby_A6E5B2
    dw Instruction_Common_Sleep


;;; $E5B2: Instruction list -  ;;;
UNUSED_InstList_RidleyCeres_FacingLeft_HoldingBaby_A6E5B2:
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement,$0002
    dw $0003,ExtendedSpritemap_Ridley_FacingLeft_LegsHalfExtended
    dw UNUSED_Instruction_RidleyCeres_GotoYIfHoldingBaby_A6E4F8
    dw UNUSED_InstList_RidleyCeres_FacingLeft_HoldingBaby_A6E5C8

UNUSED_InstList_RidleyCeres_FacingLeft_HoldingBaby_A6E5BE:
    dw $0001,ExtendedSpritemap_Ridley_FacingLeft_LegsHalfExtended
    dw UNUSED_Instruction_RidleyCeres_GotoYIfNotHoldingBaby_A6E4EE
    dw UNUSED_InstList_RidleyCeres_FacingLeft_HoldingBaby_A6E5BE
    dw UNUSED_InstList_RidleyCeres_FacingLeft_HoldingBaby_A6E5F4

UNUSED_InstList_RidleyCeres_FacingLeft_HoldingBaby_A6E5C8:
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement,$0004
    dw $0004,ExtendedSpritemap_Ridley_FacingLeft_LegsExtended
    dw UNUSED_Instruction_RidleyCeres_GotoYIfHoldingBaby_A6E4F8
    dw UNUSED_InstList_RidleyCeres_FacingLeft_HoldingBaby_A6E5DE

UNUSED_InstList_RidleyCeres_FacingLeft_HoldingBaby_A6E5D4:
    dw $0001,ExtendedSpritemap_Ridley_FacingLeft_LegsExtended
    dw UNUSED_Instruction_RidleyCeres_GotoYIfNotHoldingBaby_A6E4EE
    dw UNUSED_InstList_RidleyCeres_FacingLeft_HoldingBaby_A6E5D4
    dw UNUSED_InstList_RidleyCeres_FacingLeft_HoldingBaby_A6E5DE

UNUSED_InstList_RidleyCeres_FacingLeft_HoldingBaby_A6E5DE:
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement,$0002
    dw $0003,ExtendedSpritemap_Ridley_FacingLeft_LegsHalfExtended
    dw UNUSED_Instruction_RidleyCeres_GotoYIfHoldingBaby_A6E4F8
    dw UNUSED_InstList_RidleyCeres_FacingLeft_HoldingBaby_A6E5F4

UNUSED_InstList_RidleyCeres_FacingLeft_HoldingBaby_A6E5EA:
    dw $0001,ExtendedSpritemap_Ridley_FacingLeft_LegsHalfExtended
    dw UNUSED_Instruction_RidleyCeres_GotoYIfNotHoldingBaby_A6E4EE
    dw UNUSED_InstList_RidleyCeres_FacingLeft_HoldingBaby_A6E5EA
    dw UNUSED_InstList_RidleyCeres_FacingLeft_HoldingBaby_A6E5F4

UNUSED_InstList_RidleyCeres_FacingLeft_HoldingBaby_A6E5F4:
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement,$0000
    dw $0002,ExtendedSpritemap_Ridley_FacingLeft
    dw Instruction_Common_Sleep


;;; $E5FE: Instruction list -  ;;;
UNUSED_InstList_RidleyCeres_FacingRight_A6E5FE:
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement,$0000
    dw $0002,ExtendedSpritemap_Ridley_FacingRight
    dw UNUSED_Instruction_RidleyCeres_GotoYIfHoldingBaby_A6E4F8
    dw UNUSED_InstList_RidleyCeres_FacingRight_HoldingBaby_A6E60C
    dw Instruction_Common_Sleep


;;; $E60C: Instruction list -  ;;;
UNUSED_InstList_RidleyCeres_FacingRight_HoldingBaby_A6E60C:
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement,$0002
    dw $0003,ExtendedSpritemap_Ridley_FacingRight_LegsHalfExtended
    dw UNUSED_Instruction_RidleyCeres_GotoYIfHoldingBaby_A6E4F8
    dw UNUSED_InstList_RidleyCeres_FacingRight_HoldingBaby_A6E622

UNUSED_InstList_RidleyCeres_FacingRight_HoldingBaby_A6E618:
    dw $0001,ExtendedSpritemap_Ridley_FacingRight_LegsHalfExtended
    dw UNUSED_Instruction_RidleyCeres_GotoYIfNotHoldingBaby_A6E4EE
    dw UNUSED_InstList_RidleyCeres_FacingRight_HoldingBaby_A6E618
    dw UNUSED_InstList_RidleyCeres_FacingRight_HoldingBaby_A6E64E

UNUSED_InstList_RidleyCeres_FacingRight_HoldingBaby_A6E622:
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement,$0004
    dw $0004,ExtendedSpritemap_Ridley_FacingRight_LegsExtended
    dw UNUSED_Instruction_RidleyCeres_GotoYIfHoldingBaby_A6E4F8
    dw UNUSED_InstList_RidleyCeres_FacingRight_HoldingBaby_A6E638

UNUSED_InstList_RidleyCeres_FacingRight_HoldingBaby_A6E62E:
    dw $0001,ExtendedSpritemap_Ridley_FacingLeft_LegsExtended
    dw UNUSED_Instruction_RidleyCeres_GotoYIfNotHoldingBaby_A6E4EE
    dw UNUSED_InstList_RidleyCeres_FacingRight_HoldingBaby_A6E62E
    dw UNUSED_InstList_RidleyCeres_FacingRight_HoldingBaby_A6E638

UNUSED_InstList_RidleyCeres_FacingRight_HoldingBaby_A6E638:
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement,$0002
    dw $0003,ExtendedSpritemap_Ridley_FacingRight_LegsHalfExtended
    dw UNUSED_Instruction_RidleyCeres_GotoYIfHoldingBaby_A6E4F8
    dw UNUSED_InstList_RidleyCeres_FacingRight_HoldingBaby_A6E64E

UNUSED_InstList_RidleyCeres_FacingRight_HoldingBaby_A6E644:
    dw $0001,ExtendedSpritemap_Ridley_FacingLeft_LegsHalfExtended
    dw UNUSED_Instruction_RidleyCeres_GotoYIfNotHoldingBaby_A6E4EE
    dw UNUSED_InstList_RidleyCeres_FacingRight_HoldingBaby_A6E644
    dw UNUSED_InstList_RidleyCeres_FacingRight_HoldingBaby_A6E64E

UNUSED_InstList_RidleyCeres_FacingRight_HoldingBaby_A6E64E:
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement,$0000
    dw $0002,ExtendedSpritemap_Ridley_FacingRight
    dw Instruction_Common_Sleep
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $E658: Instruction list -  ;;;
InstList_RidleyCeres_FacingLeft_ExtendLegs:
    dw Instruction_Ridley_GotoYIfNotFacingLeft
    dw InstList_RidleyCeres_FacingRight_ExtendLegs
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement,$0000
    dw $0004,ExtendedSpritemap_Ridley_FacingLeft
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement,$0002
    dw $0006,ExtendedSpritemap_Ridley_FacingLeft_LegsHalfExtended
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement,$0004
    dw $0001,ExtendedSpritemap_Ridley_FacingLeft_LegsExtended
    dw Instruction_Common_Sleep


;;; $E676: Instruction list -  ;;;
InstList_RidleyCeres_FacingRight_ExtendLegs:
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement,$0000
    dw $0004,ExtendedSpritemap_Ridley_FacingRight
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement,$0002
    dw $0006,ExtendedSpritemap_Ridley_FacingRight_LegsHalfExtended
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement,$0004
    dw $0001,ExtendedSpritemap_Ridley_FacingRight_LegsExtended
    dw Instruction_Common_Sleep


;;; $E690: Instruction list -  ;;;
InstList_Ridley_FacingLeft_OpeningRoar:
; Opening roar and close mouth
    dw Instruction_Ridley_GotoYIfNotFacingLeft
    dw InstList_Ridley_FacingRight_OpeningRoar
    dw $0006,ExtendedSpritemap_Ridley_FacingLeft
    dw Instruction_Ridley_QueueRoarSFX
    dw $0008,ExtendedSpritemap_Ridley_FacingLeft_MouthHalfOpen
    dw $0060,ExtendedSpritemap_Ridley_FacingLeft_MouthOpen
    dw $0008,ExtendedSpritemap_Ridley_FacingLeft_MouthHalfOpen
    dw Instruction_Ridley_ResetRoarFlag
    dw $0001,ExtendedSpritemap_Ridley_FacingLeft
    dw Instruction_Common_Sleep


;;; $E6AE: Instruction list -  ;;;
InstList_Ridley_FacingRight_OpeningRoar:
    dw $0006,ExtendedSpritemap_Ridley_FacingRight
    dw Instruction_Ridley_QueueRoarSFX
    dw $0008,ExtendedSpritemap_Ridley_FacingRight_MouthHalfOpen
    dw $0060,ExtendedSpritemap_Ridley_FacingRight_MouthOpen
    dw $0008,ExtendedSpritemap_Ridley_FacingRight_MouthHalfOpen
    dw Instruction_Ridley_ResetRoarFlag
    dw $0001,ExtendedSpritemap_Ridley_FacingRight
    dw Instruction_Common_Sleep


;;; $E6C8: Instruction list -  ;;;
InstList_Ridley_FacingLeft_DeathRoar:
    dw Instruction_Ridley_GotoYIfNotFacingLeft
    dw InstList_Ridley_FacingRight_DeathRoar
    dw $0006,ExtendedSpritemap_Ridley_FacingLeft
    dw Instruction_Ridley_QueueRoarSFX
    dw $0008,ExtendedSpritemap_Ridley_FacingLeft_MouthHalfOpen
    dw $0010,ExtendedSpritemap_Ridley_FacingLeft_MouthOpen
    dw Instruction_Ridley_ResetRoarFlag
    dw Instruction_Common_Sleep


;;; $E6DE: Instruction list -  ;;;
InstList_Ridley_FacingRight_DeathRoar:
    dw $0006,ExtendedSpritemap_Ridley_FacingRight
    dw Instruction_Ridley_QueueRoarSFX
    dw $0008,ExtendedSpritemap_Ridley_FacingRight_MouthHalfOpen
    dw $0010,ExtendedSpritemap_Ridley_FacingRight_MouthOpen
    dw Instruction_Ridley_ResetRoarFlag
    dw Instruction_Common_Sleep


;;; $E6F0: Instruction list -  ;;;
InstList_Ridley_TurnFromLeftToRight:
; Turn from left to right
    dw Instruction_Ridley_SetDirectionToForwardTurning
    dw $0001,ExtendedSpritemap_Ridley_FacingLeft
    dw $0008,ExtendedSpritemap_Ridley_FacingForward
    dw Instruction_Ridley_SetDirectionToRight_UpdateTailParts
    dw $0001,ExtendedSpritemap_Ridley_FacingForward
    dw $0001,ExtendedSpritemap_Ridley_FacingRight
    dw Instruction_Common_Sleep


;;; $E706: Instruction list -  ;;;
InstList_Ridley_TurnFromRightToLeft:
; Turn from right to left
    dw Instruction_Ridley_SetDirectionToForwardTurning
    dw $0001,ExtendedSpritemap_Ridley_FacingRight
    dw $0008,ExtendedSpritemap_Ridley_FacingForward
    dw Instruction_Ridley_SetDirectionToLeft_UpdateTailParts
    dw $0001,ExtendedSpritemap_Ridley_FacingForward
    dw $0001,ExtendedSpritemap_Ridley_FacingLeft
    dw Instruction_Common_Sleep


;;; $E71C: Instruction ;;;
Instruction_Ridley_SetDirectionToLeft_UpdateTailParts:
; Set 7E:7820 to 0 (Ridley is facing left) and JSR to D3F9 (Updates a bunch of tail values.
; Includes JSR UpdateTailPartRAMFromXToY
    LDA.W #$0000
    STA.L $7E7820
    JSR Update_TailRotationDirection_Angle_DistanceFromRidley
    RTL


;;; $E727: Instruction ;;;
Instruction_Ridley_SetDirectionToForwardTurning:
; Set 7E:7820 to 1 (Ridley is facing forward / turning)
    LDA.W #$0001
    STA.L $7E7820
    RTL


;;; $E72F: Instruction ;;;
Instruction_Ridley_SetDirectionToRight_UpdateTailParts:
; Set 7E:7820 to 2 (Ridley is facing right) and JSR to D3F9 (Updates a bunch of tail values.
; Includes UpdateTailPartRAMFromXToY
    LDA.W #$0002
    STA.L $7E7820
    JSR Update_TailRotationDirection_Angle_DistanceFromRidley
    RTL


;;; $E73A: Instruction list -  ;;;
InstList_Ridley_FacingLeft_Fireballing_0:
; Fireballing
    dw Instruction_Ridley_GotoYIfNotFacingLeft
    dw InstList_Ridley_FacingRight_Fireballing_0
    dw Inst_Ridley_GotoYAndSetTimerTo8IfNotNorfairOrSamusLowEnergy
    dw InstList_Ridley_FacingLeft_Fireballing_1
    dw $0008,ExtendedSpritemap_Ridley_FacingLeft
    dw Instruction_Ridley_QueueRoarSFX
    dw $0008,ExtendedSpritemap_Ridley_FacingLeft_MouthHalfOpen
    dw $0002,ExtendedSpritemap_Ridley_FacingLeft_MouthOpen
    dw Instruction_Ridley_CalculateFireballAngleAndXYSpeeds
    dw FireLeadsFireball
    dw $0005,ExtendedSpritemap_Ridley_FacingLeft_MouthOpen
    dw Instruction_Ridley_CalculateFireballAngleAndXYSpeeds
    dw FireTrailsFireball
    dw $0005,ExtendedSpritemap_Ridley_FacingLeft_MouthOpen
    dw Instruction_Ridley_CalculateFireballAngleAndXYSpeeds
    dw FireTrailsFireball
    dw $0005,ExtendedSpritemap_Ridley_FacingLeft_MouthOpen
    dw Instruction_Ridley_CalculateFireballAngleAndXYSpeeds
    dw FireTrailsFireball
    dw $0030,ExtendedSpritemap_Ridley_FacingLeft_MouthOpen
    dw $0008,ExtendedSpritemap_Ridley_FacingLeft_MouthHalfOpen
    dw Inst_Ridley_GotoYAndSetTimerTo8IfNotNorfairOrSamusLowEnergy
    dw InstList_Ridley_FacingLeft_Fireballing_1
    dw $0020,ExtendedSpritemap_Ridley_FacingLeft
    dw Instruction_Ridley_CalculateFireballAngleAndXYSpeeds
    dw Instruction_Ridley_QueueRoarSFX
    dw $0008,ExtendedSpritemap_Ridley_FacingLeft_MouthHalfOpen
    dw $0002,ExtendedSpritemap_Ridley_FacingLeft_MouthOpen
    dw Instruction_Ridley_CalculateFireballAngleAndXYSpeeds
    dw FireLeadsFireball
    dw $0005,ExtendedSpritemap_Ridley_FacingLeft_MouthOpen
    dw Instruction_Ridley_CalculateFireballAngleAndXYSpeeds
    dw FireTrailsFireball
    dw $0005,ExtendedSpritemap_Ridley_FacingLeft_MouthOpen
    dw Instruction_Ridley_CalculateFireballAngleAndXYSpeeds
    dw FireTrailsFireball
    dw $0005,ExtendedSpritemap_Ridley_FacingLeft_MouthOpen
    dw Instruction_Ridley_CalculateFireballAngleAndXYSpeeds
    dw FireTrailsFireball
    dw $0030,ExtendedSpritemap_Ridley_FacingLeft_MouthOpen
    dw $0008,ExtendedSpritemap_Ridley_FacingLeft_MouthHalfOpen

InstList_Ridley_FacingLeft_Fireballing_1:
    dw Instruction_Ridley_ResetRoarFlag
    dw $0001,ExtendedSpritemap_Ridley_FacingLeft
    dw Instruction_Common_Sleep


;;; $E7B4: Instruction list -  ;;;
InstList_Ridley_FacingRight_Fireballing_0:
    dw Inst_Ridley_GotoYAndSetTimerTo8IfNotNorfairOrSamusLowEnergy
    dw InstList_Ridley_FacingRight_Fireballing_1
    dw $0008,ExtendedSpritemap_Ridley_FacingRight
    dw Instruction_Ridley_QueueRoarSFX
    dw $0008,ExtendedSpritemap_Ridley_FacingRight_MouthHalfOpen
    dw $0002,ExtendedSpritemap_Ridley_FacingRight_MouthOpen
    dw Instruction_Ridley_CalculateFireballAngleAndXYSpeeds
    dw FireLeadsFireball
    dw $0005,ExtendedSpritemap_Ridley_FacingRight_MouthOpen
    dw Instruction_Ridley_CalculateFireballAngleAndXYSpeeds
    dw FireTrailsFireball
    dw $0005,ExtendedSpritemap_Ridley_FacingRight_MouthOpen
    dw Instruction_Ridley_CalculateFireballAngleAndXYSpeeds
    dw FireTrailsFireball
    dw $0005,ExtendedSpritemap_Ridley_FacingRight_MouthOpen
    dw Instruction_Ridley_CalculateFireballAngleAndXYSpeeds
    dw FireTrailsFireball
    dw $0030,ExtendedSpritemap_Ridley_FacingRight_MouthOpen
    dw $0008,ExtendedSpritemap_Ridley_FacingRight_MouthHalfOpen
    dw Inst_Ridley_GotoYAndSetTimerTo8IfNotNorfairOrSamusLowEnergy
    dw InstList_Ridley_FacingRight_Fireballing_1
    dw $0020,ExtendedSpritemap_Ridley_FacingRight
    dw Instruction_Ridley_QueueRoarSFX
    dw $0008,ExtendedSpritemap_Ridley_FacingRight_MouthHalfOpen
    dw $0002,ExtendedSpritemap_Ridley_FacingRight_MouthOpen
    dw Instruction_Ridley_CalculateFireballAngleAndXYSpeeds
    dw FireLeadsFireball
    dw $0005,ExtendedSpritemap_Ridley_FacingRight_MouthOpen
    dw Instruction_Ridley_CalculateFireballAngleAndXYSpeeds
    dw FireTrailsFireball
    dw $0005,ExtendedSpritemap_Ridley_FacingRight_MouthOpen
    dw Instruction_Ridley_CalculateFireballAngleAndXYSpeeds
    dw FireTrailsFireball
    dw $0005,ExtendedSpritemap_Ridley_FacingRight_MouthOpen
    dw Instruction_Ridley_CalculateFireballAngleAndXYSpeeds
    dw FireTrailsFireball
    dw $0030,ExtendedSpritemap_Ridley_FacingRight_MouthOpen
    dw $0008,ExtendedSpritemap_Ridley_FacingRight_MouthHalfOpen

InstList_Ridley_FacingRight_Fireballing_1:
    dw Instruction_Ridley_ResetRoarFlag
    dw $0001,ExtendedSpritemap_Ridley_FacingRight
    dw Instruction_Common_Sleep


if !FEATURE_KEEP_UNREFERENCED
;;; $E828: Unused ;;;
UNUSED_SpawnUnusedEnemyProjectiles_A6E828:
    LDA.W #$0000
    JSL UNUSED_SpawnUnusedEnemyProjectile_A6E840
    LDA.W #$0001
    JSL UNUSED_SpawnUnusedEnemyProjectile_A6E840
    LDA.W #$0002
    JSL UNUSED_SpawnUnusedEnemyProjectile_A6E840
    LDA.W #$0003                                                         ; fallthrough to UNUSED_SpawnUnusedEnemyProjectile_A6E840


;;; $E840:  ;;;
UNUSED_SpawnUnusedEnemyProjectile_A6E840:
    STA.W $0FB4
    PHY
    LDY.W #UNUSED_EnemyProjectile_Ridley_869634
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    PLY
    RTL
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $E84D: Instruction ;;;
Instruction_Ridley_CalculateFireballAngleAndXYSpeeds:
; Calculate fireball angle and X/Y speeds
    PHX
    PHY
    LDA.L $7E7820
    BNE .facingRight
    LDA.W #$FFE7
    CLC
    ADC.W $0F7A
    STA.B $12
    LDA.W SamusXPosition
    SEC
    SBC.B $12
    STA.B $12
    LDA.W #$FFD5
    CLC
    ADC.W $0F7E
    STA.B $14
    LDA.W SamusYPosition
    SEC
    SBC.B $14
    STA.B $14
    JSL CalculateAngleOf_12_14_Offset
    SEC
    SBC.W #$0080
    EOR.W #$FFFF
    INC
    AND.W #$00FF
    CMP.W #$00B0
    BCS .checkEB
    CMP.W #$0040
    BCC .loadEB
    LDA.W #$00B0
    BRA +

  .checkEB:
    CMP.W #$00EB
    BCC +

  .loadEB:
    LDA.W #$00EB

+   STA.B $12
    BRA .merge

  .facingRight:
    LDA.W #$0019
    CLC
    ADC.W $0F7A
    STA.B $12
    LDA.W SamusXPosition
    SEC
    SBC.B $12
    STA.B $12
    LDA.W #$FFD5
    CLC
    ADC.W $0F7E
    STA.B $14
    LDA.W SamusYPosition
    SEC
    SBC.B $14
    STA.B $14
    JSL CalculateAngleOf_12_14_Offset
    SEC
    SBC.W #$0080
    EOR.W #$FFFF
    INC
    AND.W #$00FF
    CMP.W #$0050
    BCC .check15
    CMP.W #$00C0
    BCS .load15
    LDA.W #$0050
    BRA +

  .check15:
    CMP.W #$0015
    BCS +

  .load15:
    LDA.W #$0015

+   STA.B $12

  .merge:
    LDA.W #$0500
    JSL CalculateXVelocityFromSpeedAndAngle
    STA.L $7E7832
    LDA.W #$0500
    JSL CalculateYVelocityFromSpeedAndAngle
    STA.L $7E7834
    PLY
    PLX
    RTL


;;; $E904: Instruction ;;;
FireLeadsFireball:
; Fires lead fireball
    LDA.W #$0000
    BRA SpawnRidleyFireball


;;; $E909: Instruction ;;;
FireTrailsFireball:
; Fires following fireball
    LDA.W #$000E                                                         ; fallthrough to SpawnRidleyFireball


;;; $E90C:  ;;;
SpawnRidleyFireball:
    STA.W $1995
    LDA.L $7E7820
    PHY
    LDY.W #EnemyProjectile_RidleysFireball
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    PLY
    RTL


;;; $E91D: Instruction list -  ;;;
InstList_RidleyCeres_FacingLeft_FlyUp_StartMainAI:
; Fly up and start main AI, I guess
    dw Instruction_Ridley_GotoYIfNotFacingLeft
    dw InstList_RidleyCeres_FacingRight_FlyUp_StartMainAI
    dw $0003,ExtendedSpritemap_Ridley_FacingLeft
    dw Instruction_Ridley_MoveRidleyWithArgsInY,$0001,$FFF4
    dw $0004,ExtendedSpritemap_Ridley_FacingLeft_LegsHalfExtended
    dw Instruction_Ridley_MoveRidleyWithArgsInY,$FFFC,$FFF8
    dw $0005,ExtendedSpritemap_Ridley_FacingLeft_LegsExtended
    dw Instruction_RidleyCeres_SetRidleyMainAI_SetVerticalSpeed
    dw $0011,ExtendedSpritemap_Ridley_FacingLeft_LegsHalfExtended
    dw $0011,ExtendedSpritemap_Ridley_FacingLeft
    dw Instruction_Common_Sleep


;;; $E945: Instruction list -  ;;;
InstList_RidleyCeres_FacingRight_FlyUp_StartMainAI:
    dw $0003,ExtendedSpritemap_Ridley_FacingRight
    dw Instruction_Ridley_MoveRidleyWithArgsInY,$FFFF,$FFF4
    dw $0004,ExtendedSpritemap_Ridley_FacingRight_LegsHalfExtended
    dw Instruction_Ridley_MoveRidleyWithArgsInY,$0004,$FFF8
    dw $0005,ExtendedSpritemap_Ridley_FacingRight_LegsExtended
    dw Instruction_Ridley_SetRidleyMainAI_SetVerticalSpeed
    dw $0011,ExtendedSpritemap_Ridley_FacingRight_LegsHalfExtended
    dw $0011,ExtendedSpritemap_Ridley_FacingRight
    dw Instruction_Common_Sleep


;;; $E969: Instruction ;;;
Instruction_RidleyCeres_SetRidleyMainAI_SetVerticalSpeed:
; Set Ridley's main AI to Function_RidleyCeres_StartupLiftoff_FacingLeft, and vertical speed to FEA0. (Ceres)
    LDA.W #Function_RidleyCeres_StartupLiftoff_FacingLeft
    STA.W $0FA8
    LDA.W #$FEA0
    STA.W $0FAC
    RTL


;;; $E976: Instruction ;;;
Instruction_Ridley_SetRidleyMainAI_SetVerticalSpeed:
; Set Ridley's main AI to Function_Ridley_Startup_Liftoff_FacingRight, and vertical speed to FEA0. (Norfair)
    LDA.W #Function_Ridley_Startup_Liftoff_FacingRight
    STA.W $0FA8
    LDA.W #$FEA0
    STA.W $0FAC
    RTL


;;; $E983: Ridley extended spritemaps ;;;
ExtendedSpritemap_Ridley_FacingLeft:
    dw $0004
    dw $000F,$0016
    dw Spritemap_Ridley_FacingLeft_Legs_PulledUp
    dw Hitbox_Ridley_FacingLeft_LegsPulledUp
    dw $FFF8,$0007
    dw Spritemap_Ridley_FacingLeft_Claws
    dw Hitbox_Ridley_FacingLeft_Claws
    dw $0010,$0000
    dw Spritemap_Ridley_FacingLeft_Torso
    dw Hitbox_Ridley_FacingLeft_Torso
    dw $FFFD,$FFE8
    dw Spritemap_Ridley_FacingLeft_HeadNeck_MouthClosed
    dw Hitbox_Ridley_FacingLeft_MouthClosed

ExtendedSpritemap_Ridley_FacingRight:
    dw $0004
    dw $FFF1,$0016
    dw Spritemap_Ridley_FacingRight_Legs_PulledUp
    dw Hitbox_Ridley_FacingRight_LegsPulledUp
    dw $0008,$0007
    dw Spritemap_Ridley_FacingRight_Claws
    dw Hitbox_Ridley_FacingRight_Claws
    dw $FFF0,$0000
    dw Spritemap_Ridley_FacingRight_Torso
    dw Hitbox_Ridley_FacingRight_Torso
    dw $0003,$FFE8
    dw Spritemap_Ridley_FacingRight_HeadNeck_MouthClosed
    dw Hitbox_Ridley_FacingRight_MouthClosed

ExtendedSpritemap_Ridley_FacingLeft_MouthHalfOpen:
    dw $0004
    dw $000F,$0016
    dw Spritemap_Ridley_FacingLeft_Legs_PulledUp
    dw Hitbox_Ridley_FacingLeft_LegsPulledUp
    dw $FFF8,$0007
    dw Spritemap_Ridley_FacingLeft_Claws
    dw Hitbox_Ridley_FacingLeft_Claws
    dw $0010,$0000
    dw Spritemap_Ridley_FacingLeft_Torso
    dw Hitbox_Ridley_FacingLeft_Torso
    dw $FFFD,$FFE8
    dw Spritemap_Ridley_FacingLeft_HeadNeck_MouthHalfOpened
    dw Hitbox_Ridley_FacingLeft_MouthHalfOpen

ExtendedSpritemap_Ridley_FacingLeft_MouthOpen:
    dw $0004
    dw $000F,$0016
    dw Spritemap_Ridley_FacingLeft_Legs_PulledUp
    dw Hitbox_Ridley_FacingLeft_LegsPulledUp
    dw $FFF8,$0007
    dw Spritemap_Ridley_FacingLeft_Claws
    dw Hitbox_Ridley_FacingLeft_Claws
    dw $0010,$0000
    dw Spritemap_Ridley_FacingLeft_Torso
    dw Hitbox_Ridley_FacingLeft_Torso
    dw $FFFD,$FFE8
    dw Spritemap_Ridley_FacingLeft_HeadNeck_MouthOpen
    dw Hitbox_Ridley_FacingLeft_MouthOpen

ExtendedSpritemap_Ridley_FacingRight_MouthHalfOpen:
    dw $0004
    dw $FFF1,$0016
    dw Spritemap_Ridley_FacingRight_Legs_PulledUp
    dw Hitbox_Ridley_FacingRight_LegsPulledUp
    dw $0008,$0007
    dw Spritemap_Ridley_FacingRight_Claws
    dw Hitbox_Ridley_FacingRight_Claws
    dw $FFF0,$0000
    dw Spritemap_Ridley_FacingRight_Torso
    dw Hitbox_Ridley_FacingRight_Torso
    dw $0003,$FFE8
    dw Spritemap_Ridley_FacingRight_HeadNeck_MouthHalfOpened
    dw Hitbox_Ridley_FacingRight_MouthHalfOpened

ExtendedSpritemap_Ridley_FacingRight_MouthOpen:
    dw $0004
    dw $FFF1,$0016
    dw Spritemap_Ridley_FacingRight_Legs_PulledUp
    dw Hitbox_Ridley_FacingRight_LegsPulledUp
    dw $0008,$0007
    dw Spritemap_Ridley_FacingRight_Claws
    dw Hitbox_Ridley_FacingRight_Claws
    dw $FFF0,$0000
    dw Spritemap_Ridley_FacingRight_Torso
    dw Hitbox_Ridley_FacingRight_Torso
    dw $0003,$FFE8
    dw Spritemap_Ridley_FacingRight_HeadNeck_MouthOpen
    dw Hitbox_Ridley_FacingRight_MouthOpen

ExtendedSpritemap_Ridley_FacingLeft_LegsHalfExtended:
    dw $0004
    dw $000F,$0016
    dw Spritemap_Ridley_FacingLeft_Legs_HalfExtended
    dw Hitbox_Ridley_FacingLeft_LegsHalfExtended
    dw $FFF8,$0007
    dw Spritemap_Ridley_FacingLeft_Claws
    dw Hitbox_Ridley_FacingLeft_Claws
    dw $0010,$0000
    dw Spritemap_Ridley_FacingLeft_Torso
    dw Hitbox_Ridley_FacingLeft_Torso
    dw $FFFD,$FFE8
    dw Spritemap_Ridley_FacingLeft_HeadNeck_MouthClosed
    dw Hitbox_Ridley_FacingLeft_MouthClosed

ExtendedSpritemap_Ridley_FacingLeft_LegsExtended:
    dw $0004
    dw $000F,$0016
    dw Spritemap_Ridley_FacingLeft_Legs_Extended
    dw Hitbox_Ridley_FacingLeft_LegsExtended
    dw $FFF8,$0007
    dw Spritemap_Ridley_FacingLeft_Claws
    dw Hitbox_Ridley_FacingLeft_Claws
    dw $0010,$0000
    dw Spritemap_Ridley_FacingLeft_Torso
    dw Hitbox_Ridley_FacingLeft_Torso
    dw $FFFD,$FFE8
    dw Spritemap_Ridley_FacingLeft_HeadNeck_MouthClosed
    dw Hitbox_Ridley_FacingLeft_MouthClosed

ExtendedSpritemap_Ridley_FacingRight_LegsHalfExtended:
    dw $0004
    dw $FFF1,$0016
    dw Spritemap_Ridley_FacingRight_Legs_HalfExtended
    dw Hitbox_Ridley_FacingRight_LegsHalfExtended
    dw $0008,$0007
    dw Spritemap_Ridley_FacingRight_Claws
    dw Hitbox_Ridley_FacingRight_Claws
    dw $FFF0,$0000
    dw Spritemap_Ridley_FacingRight_Torso
    dw Hitbox_Ridley_FacingRight_Torso
    dw $0003,$FFE8
    dw Spritemap_Ridley_FacingRight_HeadNeck_MouthClosed
    dw Hitbox_Ridley_FacingRight_MouthClosed

ExtendedSpritemap_Ridley_FacingRight_LegsExtended:
    dw $0004
    dw $FFF1,$0016
    dw Spritemap_Ridley_FacingRight_Legs_Extended
    dw Hitbox_Ridley_FacingRight_LegsExtended
    dw $0008,$0007
    dw Spritemap_Ridley_FacingRight_Claws
    dw Hitbox_Ridley_FacingRight_Claws
    dw $FFF0,$0000
    dw Spritemap_Ridley_FacingRight_Torso
    dw Hitbox_Ridley_FacingRight_Torso
    dw $0003,$FFE8
    dw Spritemap_Ridley_FacingRight_HeadNeck_MouthClosed
    dw Hitbox_Ridley_FacingRight_MouthClosed

ExtendedSpritemap_Ridley_FacingForward:
    dw $0001
    dw $0000,$FFFA
    dw Spritemap_Ridley_FacingForward
    dw Hitbox_Ridley_FacingForward


;;; $EAE1: Ridley hitboxes ;;;
Hitbox_Ridley_FacingLeft_MouthClosed:
    dw $0002
    dw $FFF4,$FFE6,$000B,$000D
    dw RidleyHitbox_vs_Samus_Collision
    dw EnemyShot_Ridley
    dw $FFE8,$0003,$FFF3,$0015
    dw RidleyHitbox_vs_Samus_Collision
    dw EnemyShot_Ridley

Hitbox_Ridley_FacingLeft_MouthHalfOpen:
    dw $0002
    dw $FFD7,$FFED,$FFEB,$FFF7
    dw RidleyHitbox_vs_Samus_Collision
    dw EnemyShot_Ridley
    dw $FFEC,$FFE3,$000B,$0005
    dw RidleyHitbox_vs_Samus_Collision
    dw EnemyShot_Ridley

Hitbox_Ridley_FacingLeft_MouthOpen:
    dw $0002
    dw $FFDB,$FFD8,$FFF2,$FFE1
    dw RidleyHitbox_vs_Samus_Collision
    dw EnemyShot_Ridley
    dw $FFE7,$FFE1,$0009,$0006
    dw RidleyHitbox_vs_Samus_Collision
    dw EnemyShot_Ridley

Hitbox_Ridley_FacingLeft_LegsPulledUp:
    dw $0001
    dw $FFF1,$FFF6,$0007,$0002
    dw RidleyHitbox_vs_Samus_Collision
    dw EnemyShot_Ridley

Hitbox_Ridley_FacingLeft_LegsHalfExtended:
    dw $0001
    dw $FFEF,$FFF7,$0006,$000F
    dw RidleyHitbox_vs_Samus_Collision
    dw EnemyShot_Ridley

Hitbox_Ridley_FacingLeft_LegsExtended:
    dw $0001
    dw $FFF2,$FFFF,$000A,$0017
    dw RidleyHitbox_vs_Samus_Collision
    dw EnemyShot_Ridley

Hitbox_Ridley_FacingLeft_Claws:
    dw $0001
    dw $FFF1,$FFFE,$FFFF,$0008
    dw RidleyHitbox_vs_Samus_Collision
    dw EnemyShot_Ridley

Hitbox_Ridley_FacingLeft_Torso:
    dw $0001
    dw $FFF0,$FFEC,$000C,$0015
    dw RidleyHitbox_vs_Samus_Collision
    dw EnemyShot_Ridley

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitbox_Ridley_FacingLeft_A6EB75:
    dw $0001
    dw $FFF0,$FFEC,$000C,$0015
    dw RidleyHitbox_vs_Samus_Collision
    dw EnemyShot_Ridley

UNUSED_Hitbox_Ridley_FacingLeft_A6EB83:
    dw $0001
    dw $FFF0,$FFEC,$000C,$0015
    dw RidleyHitbox_vs_Samus_Collision
    dw EnemyShot_Ridley
endif ; !FEATURE_KEEP_UNREFERENCED

Hitbox_Ridley_FacingForward:
    dw $0002
    dw $FFF0,$FFE0,$0010,$0022
    dw RidleyHitbox_vs_Samus_Collision
    dw EnemyShot_Ridley
    dw $FFF8,$FFD3,$0008,$FFDF
    dw RidleyHitbox_vs_Samus_Collision
    dw EnemyShot_Ridley

Hitbox_Ridley_FacingRight_MouthClosed:
    dw $0002
    dw $FFF4,$FFE7,$000B,$000D
    dw RidleyHitbox_vs_Samus_Collision
    dw EnemyShot_Ridley
    dw $000C,$0005,$0018,$0014
    dw RidleyHitbox_vs_Samus_Collision
    dw EnemyShot_Ridley

Hitbox_Ridley_FacingRight_MouthHalfOpened:
    dw $0002
    dw $FFF3,$FFE3,$0014,$0005
    dw RidleyHitbox_vs_Samus_Collision
    dw EnemyShot_Ridley
    dw $0015,$FFEE,$0027,$FFF8
    dw RidleyHitbox_vs_Samus_Collision
    dw EnemyShot_Ridley

Hitbox_Ridley_FacingRight_MouthOpen:
    dw $0002
    dw $FFF6,$FFE1,$0019,$0008
    dw RidleyHitbox_vs_Samus_Collision
    dw EnemyShot_Ridley
    dw $000D,$FFD6,$0023,$FFE0
    dw RidleyHitbox_vs_Samus_Collision
    dw EnemyShot_Ridley

Hitbox_Ridley_FacingRight_LegsPulledUp:
    dw $0001
    dw $FFF6,$FFF6,$0011,$0002
    dw RidleyHitbox_vs_Samus_Collision
    dw EnemyShot_Ridley

Hitbox_Ridley_FacingRight_LegsHalfExtended:
    dw $0001
    dw $FFF7,$FFF8,$0011,$000F
    dw RidleyHitbox_vs_Samus_Collision
    dw EnemyShot_Ridley

Hitbox_Ridley_FacingRight_LegsExtended:
    dw $0001
    dw $FFF5,$FFF8,$000E,$0017
    dw RidleyHitbox_vs_Samus_Collision
    dw EnemyShot_Ridley

Hitbox_Ridley_FacingRight_Claws:
    dw $0001
    dw $0001,$FFFE,$000E,$0009
    dw RidleyHitbox_vs_Samus_Collision
    dw EnemyShot_Ridley

Hitbox_Ridley_FacingRight_Torso:
    dw $0001
    dw $FFF3,$FFEA,$000E,$0015
    dw RidleyHitbox_vs_Samus_Collision
    dw EnemyShot_Ridley

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitbox_Ridley_FacingRight_A6EC3F:
    dw $0001
    dw $FFF3,$FFEA,$000E,$0015
    dw RidleyHitbox_vs_Samus_Collision
    dw EnemyShot_Ridley

UNUSED_Hitbox_Ridley_FacingRight_A6EC4D:
    dw $0001
    dw $FFF3,$FFEA,$000E,$0015
    dw RidleyHitbox_vs_Samus_Collision
    dw EnemyShot_Ridley
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $EC5B: Ridley spritemaps ;;;
Spritemap_Ridley_FacingLeft_HeadNeck_MouthClosed:
    dw $000C
    %spritemapEntry(0, $1E4, $12, 0, 0, 3, 0, $154)
    %spritemapEntry(0, $04, $0A, 0, 0, 3, 0, $159)
    %spritemapEntry(0, $04, $02, 0, 0, 3, 0, $149)
    %spritemapEntry(0, $1FC, $0A, 0, 0, 3, 0, $17B)
    %spritemapEntry(0, $1F4, $0A, 0, 0, 3, 0, $17A)
    %spritemapEntry(0, $1FC, $02, 0, 0, 3, 0, $16B)
    %spritemapEntry(0, $1F4, $02, 0, 0, 3, 0, $16A)
    %spritemapEntry(1, $1E4, $02, 0, 0, 3, 0, $168)
    %spritemapEntry(1, $1FC, $F2, 0, 0, 3, 0, $166)
    %spritemapEntry(1, $1EC, $F2, 0, 0, 3, 0, $164)
    %spritemapEntry(1, $04, $E2, 0, 0, 3, 0, $162)
    %spritemapEntry(1, $1F4, $E2, 0, 0, 3, 0, $160)

Spritemap_Ridley_FacingLeft_HeadNeck_MouthHalfOpened:
    dw $000D
    %spritemapEntry(0, $06, $F0, 0, 0, 3, 0, $14A)
    %spritemapEntry(0, $1F6, $08, 0, 0, 3, 0, $1BB)
    %spritemapEntry(0, $1F6, $00, 0, 0, 3, 0, $13D)
    %spritemapEntry(0, $06, $F8, 0, 0, 3, 0, $15A)
    %spritemapEntry(1, $1FE, $00, 0, 0, 3, 0, $188)
    %spritemapEntry(1, $1F6, $F0, 0, 0, 3, 0, $186)
    %spritemapEntry(0, $1EE, $00, 0, 0, 3, 0, $156)
    %spritemapEntry(0, $1E6, $00, 0, 0, 3, 0, $155)
    %spritemapEntry(1, $1E6, $F0, 0, 0, 3, 0, $184)
    %spritemapEntry(1, $06, $E0, 0, 0, 3, 0, $182)
    %spritemapEntry(1, $1F6, $E0, 0, 0, 3, 0, $180)
    %spritemapEntry(1, $1E6, $E0, 0, 0, 3, 0, $16E)
    %spritemapEntry(1, $1D6, $E8, 0, 0, 3, 0, $16C)

Spritemap_Ridley_FacingLeft_HeadNeck_MouthOpen:
    dw $000F
    %spritemapEntry(0, $1E0, $05, 0, 0, 3, 0, $158)
    %spritemapEntry(0, $00, $DD, 0, 0, 3, 0, $14B)
    %spritemapEntry(0, $1E8, $05, 0, 0, 3, 0, $138)
    %spritemapEntry(0, $1F8, $05, 0, 0, 3, 0, $13A)
    %spritemapEntry(0, $1F0, $05, 0, 0, 3, 0, $139)
    %spritemapEntry(0, $08, $05, 0, 0, 3, 0, $13C)
    %spritemapEntry(0, $00, $05, 0, 0, 3, 0, $13B)
    %spritemapEntry(0, $1D8, $D5, 0, 0, 3, 0, $157)
    %spritemapEntry(1, $00, $F5, 0, 0, 3, 0, $1A5)
    %spritemapEntry(1, $1F8, $F5, 0, 0, 3, 0, $1A4)
    %spritemapEntry(1, $1E8, $F5, 0, 0, 3, 0, $1A2)
    %spritemapEntry(1, $00, $E5, 0, 0, 3, 0, $1A0)
    %spritemapEntry(1, $1F0, $E5, 0, 0, 3, 0, $18E)
    %spritemapEntry(1, $1F0, $D5, 0, 0, 3, 0, $18C)
    %spritemapEntry(1, $1E0, $D5, 0, 0, 3, 0, $18A)

Spritemap_Ridley_FacingLeft_Legs_PulledUp:
    dw $0007
    %spritemapEntry(1, $1FA, $FF, 0, 0, 3, 0, $1AE)
    %spritemapEntry(1, $1EA, $FF, 0, 0, 3, 0, $1AC)
    %spritemapEntry(0, $08, $F8, 0, 0, 3, 0, $1BA)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 0, $1B9)
    %spritemapEntry(0, $08, $F0, 0, 0, 3, 0, $1AA)
    %spritemapEntry(0, $00, $F0, 0, 0, 3, 0, $1A9)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 3, 0, $1A7)

Spritemap_Ridley_FacingLeft_Legs_HalfExtended:
    dw $0006
    %spritemapEntry(0, $1F9, $04, 0, 0, 3, 0, $1AB)
    %spritemapEntry(0, $1F1, $04, 0, 0, 3, 0, $15B)
    %spritemapEntry(1, $1F9, $0B, 0, 0, 3, 0, $1AE)
    %spritemapEntry(1, $1E9, $0B, 0, 0, 3, 0, $1AC)
    %spritemapEntry(1, $1FE, $F4, 0, 0, 3, 0, $1C2)
    %spritemapEntry(1, $1EE, $F4, 0, 0, 3, 0, $1C0)

Spritemap_Ridley_FacingLeft_Legs_Extended:
    dw $0006
    %spritemapEntry(0, $1EF, $08, 0, 0, 3, 0, $1BB)
    %spritemapEntry(1, $1F7, $08, 0, 0, 3, 0, $1CE)
    %spritemapEntry(1, $1FD, $13, 0, 0, 3, 0, $1AE)
    %spritemapEntry(1, $1ED, $13, 0, 0, 3, 0, $1AC)
    %spritemapEntry(1, $1FE, $F8, 0, 0, 3, 0, $1C6)
    %spritemapEntry(1, $1EE, $F8, 0, 0, 3, 0, $1C4)

Spritemap_Ridley_FacingLeft_Claws:
    dw $0001
    %spritemapEntry(1, $1F0, $FC, 0, 0, 3, 0, $140)

Spritemap_Ridley_FacingLeft_Torso:
    dw $0006
    %spritemapEntry(1, $1E8, $03, 0, 0, 3, 0, $1CC)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 3, 0, $120)
    %spritemapEntry(1, $00, $F8, 0, 0, 3, 0, $122)
    %spritemapEntry(1, $1FE, $06, 0, 0, 3, 0, $122)
    %spritemapEntry(1, $00, $E8, 0, 0, 3, 0, $102)
    %spritemapEntry(1, $1F0, $E8, 0, 0, 3, 0, $100)

Spritemap_Ridley_FacingForward:
    dw $0020
    %spritemapEntry(0, $00, $20, 0, 1, 3, 0, $FB)
    %spritemapEntry(0, $10, $20, 0, 1, 3, 0, $EA)
    %spritemapEntry(0, $10, $18, 0, 1, 3, 0, $FA)
    %spritemapEntry(0, $08, $20, 0, 1, 3, 0, $EB)
    %spritemapEntry(0, $08, $D8, 0, 1, 3, 0, $F0)
    %spritemapEntry(0, $10, $00, 0, 1, 3, 0, $E0)
    %spritemapEntry(0, $10, $F8, 0, 1, 3, 0, $FD)
    %spritemapEntry(0, $10, $F0, 0, 1, 3, 0, $ED)
    %spritemapEntry(0, $00, $D8, 0, 1, 3, 0, $F1)
    %spritemapEntry(0, $00, $D0, 0, 1, 3, 0, $E1)
    %spritemapEntry(0, $10, $E8, 0, 1, 3, 0, $FC)
    %spritemapEntry(0, $10, $E0, 0, 1, 3, 0, $EC)
    %spritemapEntry(1, $00, $10, 0, 1, 3, 0, $E8)
    %spritemapEntry(1, $00, $00, 0, 1, 3, 0, $E6)
    %spritemapEntry(1, $00, $F0, 0, 1, 3, 0, $E4)
    %spritemapEntry(1, $00, $E0, 0, 1, 3, 0, $E2)
    %spritemapEntry(0, $1F8, $20, 0, 0, 3, 0, $FB)
    %spritemapEntry(0, $1E8, $20, 0, 0, 3, 0, $EA)
    %spritemapEntry(0, $1E8, $18, 0, 0, 3, 0, $FA)
    %spritemapEntry(0, $1F0, $20, 0, 0, 3, 0, $EB)
    %spritemapEntry(0, $1F0, $D8, 0, 0, 3, 0, $F0)
    %spritemapEntry(0, $1E8, $00, 0, 0, 3, 0, $E0)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 3, 0, $FD)
    %spritemapEntry(0, $1E8, $F0, 0, 0, 3, 0, $ED)
    %spritemapEntry(0, $1F8, $D8, 0, 0, 3, 0, $F1)
    %spritemapEntry(0, $1F8, $D0, 0, 0, 3, 0, $E1)
    %spritemapEntry(0, $1E8, $E8, 0, 0, 3, 0, $FC)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $EC)
    %spritemapEntry(1, $1F0, $10, 0, 0, 3, 0, $E8)
    %spritemapEntry(1, $1F0, $00, 0, 0, 3, 0, $E6)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 3, 0, $E4)
    %spritemapEntry(1, $1F0, $E0, 0, 0, 3, 0, $E2)

Spritemap_Ridley_FacingRight_HeadNeck_MouthClosed:
    dw $000C
    %spritemapEntry(0, $14, $12, 0, 1, 3, 0, $154)
    %spritemapEntry(0, $1F4, $0A, 0, 1, 3, 0, $159)
    %spritemapEntry(0, $1F4, $02, 0, 1, 3, 0, $149)
    %spritemapEntry(0, $1FC, $0A, 0, 1, 3, 0, $17B)
    %spritemapEntry(0, $04, $0A, 0, 1, 3, 0, $17A)
    %spritemapEntry(0, $1FC, $02, 0, 1, 3, 0, $16B)
    %spritemapEntry(0, $04, $02, 0, 1, 3, 0, $16A)
    %spritemapEntry(1, $0C, $02, 0, 1, 3, 0, $168)
    %spritemapEntry(1, $1F4, $F2, 0, 1, 3, 0, $166)
    %spritemapEntry(1, $04, $F2, 0, 1, 3, 0, $164)
    %spritemapEntry(1, $1EC, $E2, 0, 1, 3, 0, $162)
    %spritemapEntry(1, $1FC, $E2, 0, 1, 3, 0, $160)

Spritemap_Ridley_FacingRight_HeadNeck_MouthHalfOpened:
    dw $000D
    %spritemapEntry(0, $1F2, $F0, 0, 1, 3, 0, $14A)
    %spritemapEntry(0, $02, $08, 0, 1, 3, 0, $1BB)
    %spritemapEntry(0, $02, $00, 0, 1, 3, 0, $13D)
    %spritemapEntry(0, $1F2, $F8, 0, 1, 3, 0, $15A)
    %spritemapEntry(1, $1F2, $00, 0, 1, 3, 0, $188)
    %spritemapEntry(1, $1FA, $F0, 0, 1, 3, 0, $186)
    %spritemapEntry(0, $0A, $00, 0, 1, 3, 0, $156)
    %spritemapEntry(0, $12, $00, 0, 1, 3, 0, $155)
    %spritemapEntry(1, $0A, $F0, 0, 1, 3, 0, $184)
    %spritemapEntry(1, $1EA, $E0, 0, 1, 3, 0, $182)
    %spritemapEntry(1, $1FA, $E0, 0, 1, 3, 0, $180)
    %spritemapEntry(1, $0A, $E0, 0, 1, 3, 0, $16E)
    %spritemapEntry(1, $1A, $E8, 0, 1, 3, 0, $16C)

Spritemap_Ridley_FacingRight_HeadNeck_MouthOpen:
    dw $000F
    %spritemapEntry(0, $18, $05, 0, 1, 3, 0, $158)
    %spritemapEntry(0, $1F8, $DD, 0, 1, 3, 0, $14B)
    %spritemapEntry(0, $10, $05, 0, 1, 3, 0, $138)
    %spritemapEntry(0, $00, $05, 0, 1, 3, 0, $13A)
    %spritemapEntry(0, $08, $05, 0, 1, 3, 0, $139)
    %spritemapEntry(0, $1F0, $05, 0, 1, 3, 0, $13C)
    %spritemapEntry(0, $1F8, $05, 0, 1, 3, 0, $13B)
    %spritemapEntry(0, $20, $D5, 0, 1, 3, 0, $157)
    %spritemapEntry(1, $1F0, $F5, 0, 1, 3, 0, $1A5)
    %spritemapEntry(1, $1F8, $F5, 0, 1, 3, 0, $1A4)
    %spritemapEntry(1, $08, $F5, 0, 1, 3, 0, $1A2)
    %spritemapEntry(1, $1F0, $E5, 0, 1, 3, 0, $1A0)
    %spritemapEntry(1, $00, $E5, 0, 1, 3, 0, $18E)
    %spritemapEntry(1, $00, $D5, 0, 1, 3, 0, $18C)
    %spritemapEntry(1, $10, $D5, 0, 1, 3, 0, $18A)

Spritemap_Ridley_FacingRight_Legs_PulledUp:
    dw $0007
    %spritemapEntry(1, $1F6, $FF, 0, 1, 3, 0, $1AE)
    %spritemapEntry(1, $06, $FF, 0, 1, 3, 0, $1AC)
    %spritemapEntry(0, $1F0, $F8, 0, 1, 3, 0, $1BA)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 3, 0, $1B9)
    %spritemapEntry(0, $1F0, $F0, 0, 1, 3, 0, $1AA)
    %spritemapEntry(0, $1F8, $F0, 0, 1, 3, 0, $1A9)
    %spritemapEntry(1, $00, $F0, 0, 1, 3, 0, $1A7)

Spritemap_Ridley_FacingRight_Legs_HalfExtended:
    dw $0006
    %spritemapEntry(0, $1FF, $04, 0, 1, 3, 0, $1AB)
    %spritemapEntry(0, $07, $04, 0, 1, 3, 0, $15B)
    %spritemapEntry(1, $1F7, $0B, 0, 1, 3, 0, $1AE)
    %spritemapEntry(1, $07, $0B, 0, 1, 3, 0, $1AC)
    %spritemapEntry(1, $1F2, $F4, 0, 1, 3, 0, $1C2)
    %spritemapEntry(1, $02, $F4, 0, 1, 3, 0, $1C0)

Spritemap_Ridley_FacingRight_Legs_Extended:
    dw $0006
    %spritemapEntry(0, $09, $08, 0, 1, 3, 0, $1BB)
    %spritemapEntry(1, $1F9, $08, 0, 1, 3, 0, $1CE)
    %spritemapEntry(1, $1F3, $13, 0, 1, 3, 0, $1AE)
    %spritemapEntry(1, $03, $13, 0, 1, 3, 0, $1AC)
    %spritemapEntry(1, $1F2, $F8, 0, 1, 3, 0, $1C6)
    %spritemapEntry(1, $02, $F8, 0, 1, 3, 0, $1C4)

Spritemap_Ridley_FacingRight_Claws:
    dw $0001
    %spritemapEntry(1, $00, $FC, 0, 1, 3, 0, $140)

Spritemap_Ridley_FacingRight_Torso:
    dw $0006
    %spritemapEntry(1, $08, $03, 0, 1, 3, 0, $1CC)
    %spritemapEntry(1, $00, $F8, 0, 1, 3, 0, $120)
    %spritemapEntry(1, $1F0, $F8, 0, 1, 3, 0, $122)
    %spritemapEntry(1, $1F2, $06, 0, 1, 3, 0, $122)
    %spritemapEntry(1, $1F0, $E8, 0, 1, 3, 0, $102)
    %spritemapEntry(1, $00, $E8, 0, 1, 3, 0, $100)


;;; $EFB1: Initialisation AI - enemy $E1FF (Ceres steam) ;;;
InitAI_CeresSteam:
    LDX.W EnemyIndex
    STZ.W Enemy.GFXOffset,X
    LDA.W Enemy.properties,X
    ORA.W #$2000
    STA.W Enemy.properties,X
    LDA.W Enemy.properties2,X
    ORA.W #$0004
    STA.W Enemy.properties2,X
    LDA.W #$0001
    STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.W #$0A00
    STA.W Enemy.palette,X
    JSL GenerateRandomNumber
    AND.W #$001F
    INC
    STA.W Steam.activationTimer,X
    LDA.W Enemy.init0,X
    ASL
    TAY
    LDA.W InitAI_CeresSteam_instListPointers,Y
    STA.W Enemy.instList,X
    LDA.W InitAI_CeresSteam_initialFunctionPointers,Y
    STA.W Steam.function,X

  .return:
    RTL


; Indexed by [enemy parameter 1] * 2
InitAI_CeresSteam_instListPointers:
    dw InstList_CeresSteam_Up_0
    dw InstList_CeresSteam_Left_0
    dw InstList_CeresSteam_Down_0
    dw InstList_CeresSteam_Right_0
    dw InstList_CeresSteam_Left_0
    dw InstList_CeresSteam_Right_0

InitAI_CeresSteam_initialFunctionPointers:
    dw InitAI_CeresSteam_return
    dw InitAI_CeresSteam_return
    dw InitAI_CeresSteam_return
    dw InitAI_CeresSteam_return
    dw Func_CeresSteam_CalculateGraphicalOffsetInRotatingElevRoom
    dw Func_CeresSteam_CalculateGraphicalOffsetInRotatingElevRoom


;;; $F00D: Main AI - enemy $E1FF (Ceres steam) ;;;
MainAI_CeresSteam:
    LDX.W EnemyIndex
    LDA.W #$7FFF
    STA.W Enemy.health,X
    JMP.W (Steam.function,X)


;;; $F019: Ceres steam function - calculate graphical offset in rotating elevator room ;;;
Func_CeresSteam_CalculateGraphicalOffsetInRotatingElevRoom:
    LDA.W Enemy.XPosition,X
    STA.B DP_Temp12
    LDA.W Enemy.YPosition,X
    STA.B DP_Temp14
    JSL Calculate_CeresSteamPosition_InRotatingElevatorRoom
    LDX.W EnemyIndex
    LDA.B DP_Temp12
    SEC
    SBC.W Enemy.XPosition,X
    STA.L EnemySpawnData.graphicalXOffset,X
    LDA.B DP_Temp14
    SEC
    SBC.W Enemy.YPosition,X
    STA.L EnemySpawnData.graphicalYOffset,X
    RTL


;;; $F03F: Enemy touch - enemy $E1FF (Ceres steam) ;;;
EnemyTouch_CeresSteam:
    LDX.W EnemyIndex
    LDA.W #$7FFF
    STA.W Enemy.health,X
    JSL NormalEnemyTouchAI
    RTL


;;; $F04D: Instruction list - Ceres steam - up ;;;
InstList_CeresSteam_Up_0:
    dw Instruction_CeresSteam_SetToIntangibleAndInvisible
    dw $0001,ExtendedSpritemap_CeresSteam_Up_0
    dw Instruction_CeresSteam_DecActivationTimer_Decide_GotoYOrY2
    dw InstList_CeresSteam_Up_0
    dw InstList_CeresSteam_Up_2

InstList_CeresSteam_Up_1:
    dw Instruction_CeresSteam_SetToIntangibleAndInvisible
    dw $0040,ExtendedSpritemap_CeresSteam_Up_0
    dw Instruction_CeresSteam_SetToTangibleAndVisible

InstList_CeresSteam_Up_2:
    dw $0003,ExtendedSpritemap_CeresSteam_Up_0
    dw $0003,ExtendedSpritemap_CeresSteam_Up_1
    dw $0003,ExtendedSpritemap_CeresSteam_Up_2
    dw $0003,ExtendedSpritemap_CeresSteam_Up_3
    dw $0003,ExtendedSpritemap_CeresSteam_Up_4
    dw $0003,ExtendedSpritemap_CeresSteam_Up_5
    dw $0003,ExtendedSpritemap_CeresSteam_Up_6
    dw Instruction_Common_GotoY
    dw InstList_CeresSteam_Up_1


;;; $F081: Instruction list - Ceres steam - left ;;;
InstList_CeresSteam_Left_0:
    dw Instruction_CeresSteam_SetToIntangibleAndInvisible
    dw $0001,ExtendedSpritemap_CeresSteam_Left_0
    dw Instruction_CeresSteam_DecActivationTimer_Decide_GotoYOrY2
    dw InstList_CeresSteam_Left_0
    dw InstList_CeresSteam_Left_2

InstList_CeresSteam_Left_1:
    dw Instruction_CeresSteam_SetToIntangibleAndInvisible
    dw $0040,ExtendedSpritemap_CeresSteam_Left_0
    dw Instruction_CeresSteam_SetToTangibleAndVisible

InstList_CeresSteam_Left_2:
    dw $0003,ExtendedSpritemap_CeresSteam_Left_0
    dw $0003,ExtendedSpritemap_CeresSteam_Left_1
    dw $0003,ExtendedSpritemap_CeresSteam_Left_2
    dw $0003,ExtendedSpritemap_CeresSteam_Left_3
    dw $0003,ExtendedSpritemap_CeresSteam_Left_4
    dw $0003,ExtendedSpritemap_CeresSteam_Left_5
    dw $0003,ExtendedSpritemap_CeresSteam_Left_6
    dw Instruction_Common_GotoY
    dw InstList_CeresSteam_Left_1


;;; $F0B5: Instruction list - Ceres steam - down ;;;
InstList_CeresSteam_Down_0:
    dw Instruction_CeresSteam_SetToIntangibleAndInvisible
    dw $0001,ExtendedSpritemap_CeresSteam_Down_0
    dw Instruction_CeresSteam_DecActivationTimer_Decide_GotoYOrY2
    dw InstList_CeresSteam_Down_0
    dw InstList_CeresSteam_Down_2

InstList_CeresSteam_Down_1:
    dw Instruction_CeresSteam_SetToIntangibleAndInvisible
    dw $0040,ExtendedSpritemap_CeresSteam_Down_0
    dw Instruction_CeresSteam_SetToTangibleAndVisible

InstList_CeresSteam_Down_2:
    dw $0003,ExtendedSpritemap_CeresSteam_Down_0
    dw $0003,ExtendedSpritemap_CeresSteam_Down_1
    dw $0003,ExtendedSpritemap_CeresSteam_Down_2
    dw $0003,ExtendedSpritemap_CeresSteam_Down_3
    dw $0003,ExtendedSpritemap_CeresSteam_Down_4
    dw $0003,ExtendedSpritemap_CeresSteam_Down_5
    dw $0003,ExtendedSpritemap_CeresSteam_Down_6
    dw Instruction_Common_GotoY
    dw InstList_CeresSteam_Down_1


;;; $F0E9: Instruction list - Ceres steam - right ;;;
InstList_CeresSteam_Right_0:
    dw Instruction_CeresSteam_SetToIntangibleAndInvisible
    dw $0001,ExtendedSpritemap_CeresSteam_Right_0
    dw Instruction_CeresSteam_DecActivationTimer_Decide_GotoYOrY2
    dw InstList_CeresSteam_Right_0
    dw InstList_CeresSteam_Right_2

InstList_CeresSteam_Right_1:
    dw Instruction_CeresSteam_SetToIntangibleAndInvisible
    dw $0040,ExtendedSpritemap_CeresSteam_Right_0
    dw Instruction_CeresSteam_SetToTangibleAndVisible

InstList_CeresSteam_Right_2:
    dw $0003,ExtendedSpritemap_CeresSteam_Right_0
    dw $0003,ExtendedSpritemap_CeresSteam_Right_1
    dw $0003,ExtendedSpritemap_CeresSteam_Right_2
    dw $0003,ExtendedSpritemap_CeresSteam_Right_3
    dw $0003,ExtendedSpritemap_CeresSteam_Right_4
    dw $0003,ExtendedSpritemap_CeresSteam_Right_5
    dw $0003,ExtendedSpritemap_CeresSteam_Right_6
    dw Instruction_Common_GotoY
    dw InstList_CeresSteam_Right_1


;;; $F11D: Instruction - hide enemy ;;;
Instruction_CeresSteam_SetToIntangibleAndInvisible:
    LDA.W Enemy.properties,X
    ORA.W #$0500
    STA.W Enemy.properties,X
    RTL


;;; $F127: Instruction - decrement activation timer and go to [[Y]] if non-zero, otherwise show enemy and go to [[Y] + 2] ;;;
Instruction_CeresSteam_DecActivationTimer_Decide_GotoYOrY2:
    DEC.W Steam.activationTimer,X
    BEQ .gotoY2
    LDA.W $0000,Y
    TAY
    RTL

  .gotoY2:
    LDA.W $0002,Y
    TAY                                                                  ; fallthrough to Instruction_CeresSteam_SetToTangibleAndVisible


;;; $F135: Instruction - show enemy ;;;
Instruction_CeresSteam_SetToTangibleAndVisible:
    LDA.W Enemy.properties,X
    AND.W #$FBFF                                                         ; >.< #$FAFF
    AND.W #$FEFF
    STA.W Enemy.properties,X
    RTL


;;; $F142: Ceres steam extended spritemaps ;;;
; Top byte of extended spritemap size is ignored...
ExtendedSpritemap_CeresSteam_Up_0:
    dw $1001
    dw $0000,$0000
    dw Spritemap_CeresSteam_Up_0
    dw Hitbox_CeresSteam_Up_0

ExtendedSpritemap_CeresSteam_Up_1:
    dw $1001
    dw $0000,$0000
    dw Spritemap_CeresSteam_Up_1
    dw Hitbox_CeresSteam_Up_1

ExtendedSpritemap_CeresSteam_Up_2:
    dw $1001
    dw $0000,$0000
    dw Spritemap_CeresSteam_Up_2
    dw Hitbox_CeresSteam_Up_2

ExtendedSpritemap_CeresSteam_Up_3:
    dw $1001
    dw $0000,$0000
    dw Spritemap_CeresSteam_Up_3
    dw Hitbox_CeresSteam_Up_3

ExtendedSpritemap_CeresSteam_Up_4:
    dw $1001
    dw $0000,$0000
    dw Spritemap_CeresSteam_Up_4
    dw Hitbox_CeresSteam_Up_4

ExtendedSpritemap_CeresSteam_Up_5:
    dw $1001
    dw $0000,$0000
    dw Spritemap_CeresSteam_Up_5
    dw Hitbox_CeresSteam_Nothing

ExtendedSpritemap_CeresSteam_Up_6:
    dw $1001
    dw $0000,$0000
    dw Spritemap_CeresSteam_Up_6
    dw Hitbox_CeresSteam_Nothing

ExtendedSpritemap_CeresSteam_Left_0:
    dw $1001
    dw $0000,$0000
    dw Spritemap_CeresSteam_Left_0
    dw Hitbox_CeresSteam_Left_0

ExtendedSpritemap_CeresSteam_Left_1:
    dw $1001
    dw $0000,$0000
    dw Spritemap_CeresSteam_Left_1
    dw Hitbox_CeresSteam_Left_1

ExtendedSpritemap_CeresSteam_Left_2:
    dw $1001
    dw $0000,$0000
    dw Spritemap_CeresSteam_Left_2
    dw Hitbox_CeresSteam_Left_2

ExtendedSpritemap_CeresSteam_Left_3:
    dw $1001
    dw $0000,$0000
    dw Spritemap_CeresSteam_Left_3
    dw Hitbox_CeresSteam_Left_3

ExtendedSpritemap_CeresSteam_Left_4:
    dw $1001
    dw $0000,$0000
    dw Spritemap_CeresSteam_Left_4
    dw Hitbox_CeresSteam_Left_4

ExtendedSpritemap_CeresSteam_Left_5:
    dw $1001
    dw $0000,$0000
    dw Spritemap_CeresSteam_Left_5
    dw Hitbox_CeresSteam_Nothing

ExtendedSpritemap_CeresSteam_Left_6:
    dw $1001
    dw $0000,$0000
    dw Spritemap_CeresSteam_Left_6
    dw Hitbox_CeresSteam_Nothing

ExtendedSpritemap_CeresSteam_Down_0:
    dw $1001
    dw $0000,$0000
    dw Spritemap_CeresSteam_Down_0
    dw Hitbox_CeresSteam_Down_0

ExtendedSpritemap_CeresSteam_Down_1:
    dw $1001
    dw $0000,$0000
    dw Spritemap_CeresSteam_Down_1
    dw Hitbox_CeresSteam_Down_1

ExtendedSpritemap_CeresSteam_Down_2:
    dw $1001
    dw $0000,$0000
    dw Spritemap_CeresSteam_Down_2
    dw Hitbox_CeresSteam_Down_2

ExtendedSpritemap_CeresSteam_Down_3:
    dw $1001
    dw $0000,$0000
    dw Spritemap_CeresSteam_Down_3
    dw Hitbox_CeresSteam_Down_3

ExtendedSpritemap_CeresSteam_Down_4:
    dw $1001
    dw $0000,$0000
    dw Spritemap_CeresSteam_Down_4
    dw Hitbox_CeresSteam_Down_4

ExtendedSpritemap_CeresSteam_Down_5:
    dw $1001
    dw $0000,$0000
    dw Spritemap_CeresSteam_Down_5
    dw Hitbox_CeresSteam_Nothing

ExtendedSpritemap_CeresSteam_Down_6:
    dw $1001
    dw $0000,$0000
    dw Spritemap_CeresSteam_Down_6
    dw Hitbox_CeresSteam_Nothing

ExtendedSpritemap_CeresSteam_Right_0:
    dw $1001
    dw $0000,$0000
    dw Spritemap_CeresSteam_Right_0
    dw Hitbox_CeresSteam_Right_0

ExtendedSpritemap_CeresSteam_Right_1:
    dw $1001
    dw $0000,$0000
    dw Spritemap_CeresSteam_Right_1
    dw Hitbox_CeresSteam_Right_1

ExtendedSpritemap_CeresSteam_Right_2:
    dw $1001
    dw $0000,$0000
    dw Spritemap_CeresSteam_Right_2
    dw Hitbox_CeresSteam_Right_2

ExtendedSpritemap_CeresSteam_Right_3:
    dw $1001
    dw $0000,$0000
    dw Spritemap_CeresSteam_Right_3
    dw Hitbox_CeresSteam_Right_3

ExtendedSpritemap_CeresSteam_Right_4:
    dw $1001
    dw $0000,$0000
    dw Spritemap_CeresSteam_Right_4
    dw Hitbox_CeresSteam_Right_4

ExtendedSpritemap_CeresSteam_Right_5:
    dw $1001
    dw $0000,$0000
    dw Spritemap_CeresSteam_Right_5
    dw Hitbox_CeresSteam_Nothing

ExtendedSpritemap_CeresSteam_Right_6:
    dw $1001
    dw $0000,$0000
    dw Spritemap_CeresSteam_Right_6
    dw Hitbox_CeresSteam_Nothing


;;; $F25A: Ceres steam hitboxes ;;;
Hitbox_CeresSteam_Nothing:
    dw $0000

Hitbox_CeresSteam_Up_0:
    dw $0001
    dw $FFF8,$FFF0,$0007,$FFFF
    dw EnemyTouch_CeresSteam
    dw RTL_A6804C

Hitbox_CeresSteam_Up_1:
    dw $0001
    dw $FFF8,$FFE9,$0007,$FFFE
    dw EnemyTouch_CeresSteam
    dw RTL_A6804C

Hitbox_CeresSteam_Up_2:
    dw $0001
    dw $FFF8,$FFE0,$0007,$FFF8
    dw EnemyTouch_CeresSteam
    dw RTL_A6804C

Hitbox_CeresSteam_Up_3:
    dw $0001
    dw $FFF8,$FFD8,$0007,$FFF0
    dw EnemyTouch_CeresSteam
    dw RTL_A6804C

Hitbox_CeresSteam_Up_4:
    dw $0001
    dw $FFF8,$FFD8,$0006,$FFE8
    dw EnemyTouch_CeresSteam
    dw RTL_A6804C

Hitbox_CeresSteam_Left_0:
    dw $0001
    dw $FFF0,$FFF8,$FFFF,$0007
    dw EnemyTouch_CeresSteam
    dw RTL_A6804C

Hitbox_CeresSteam_Left_1:
    dw $0001
    dw $FFE8,$FFF8,$FFFE,$0007
    dw EnemyTouch_CeresSteam
    dw RTL_A6804C

Hitbox_CeresSteam_Left_2:
    dw $0001
    dw $FFE0,$FFF9,$FFF7,$0007
    dw EnemyTouch_CeresSteam
    dw RTL_A6804C

Hitbox_CeresSteam_Left_3:
    dw $0001
    dw $FFD8,$FFF7,$FFEF,$0005
    dw EnemyTouch_CeresSteam
    dw RTL_A6804C

Hitbox_CeresSteam_Left_4:
    dw $0001
    dw $FFD8,$FFF5,$FFE6,$0002
    dw EnemyTouch_CeresSteam
    dw RTL_A6804C

Hitbox_CeresSteam_Down_0:
    dw $0001
    dw $FFF8,$0000,$0007,$000E
    dw EnemyTouch_CeresSteam
    dw RTL_A6804C

Hitbox_CeresSteam_Down_1:
    dw $0001
    dw $FFF8,$0000,$0007,$0017
    dw EnemyTouch_CeresSteam
    dw RTL_A6804C

Hitbox_CeresSteam_Down_2:
    dw $0001
    dw $FFF8,$0008,$0007,$001F
    dw EnemyTouch_CeresSteam
    dw RTL_A6804C

Hitbox_CeresSteam_Down_3:
    dw $0001
    dw $FFF8,$000F,$0007,$0027
    dw EnemyTouch_CeresSteam
    dw RTL_A6804C

Hitbox_CeresSteam_Down_4:
    dw $0001
    dw $FFF8,$0017,$0006,$0026
    dw EnemyTouch_CeresSteam
    dw RTL_A6804C

Hitbox_CeresSteam_Right_0:
    dw $0001
    dw $0000,$FFF8,$000F,$0007
    dw EnemyTouch_CeresSteam
    dw RTL_A6804C

Hitbox_CeresSteam_Right_1:
    dw $0001
    dw $0001,$FFF8,$0017,$0007
    dw EnemyTouch_CeresSteam
    dw RTL_A6804C

Hitbox_CeresSteam_Right_2:
    dw $0001
    dw $0009,$FFF8,$001F,$0007
    dw EnemyTouch_CeresSteam
    dw RTL_A6804C

Hitbox_CeresSteam_Right_3:
    dw $0001
    dw $0012,$FFF7,$0026,$0005
    dw EnemyTouch_CeresSteam
    dw RTL_A6804C

Hitbox_CeresSteam_Right_4:
    dw $0001
    dw $0019,$FFF5,$0028,$0003
    dw EnemyTouch_CeresSteam
    dw RTL_A6804C


;;; $F374: Ceres steam spritemaps ;;;
Spritemap_CeresSteam_Up_0:
    dw $0001
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $7C)

Spritemap_CeresSteam_Up_1:
    dw $0002
    %spritemapEntry(1, $1F8, $E8, 0, 0, 2, 0, $7C)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $7E)

Spritemap_CeresSteam_Up_2:
    dw $0003
    %spritemapEntry(1, $1F8, $E0, 0, 0, 2, 0, $7C)
    %spritemapEntry(1, $1F8, $E8, 0, 0, 2, 0, $7E)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $9A)

Spritemap_CeresSteam_Up_3:
    dw $0004
    %spritemapEntry(1, $1F8, $D7, 0, 0, 2, 0, $7C)
    %spritemapEntry(1, $1F8, $E0, 0, 0, 2, 0, $7E)
    %spritemapEntry(1, $1F8, $E8, 0, 0, 2, 0, $9A)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $9C)

Spritemap_CeresSteam_Up_4:
    dw $0003
    %spritemapEntry(1, $1F8, $D6, 0, 0, 2, 0, $7E)
    %spritemapEntry(1, $1F8, $E0, 0, 0, 2, 0, $9A)
    %spritemapEntry(1, $1F8, $E8, 0, 0, 2, 0, $9C)

Spritemap_CeresSteam_Up_5:
    dw $0002
    %spritemapEntry(1, $1F8, $D5, 0, 0, 2, 0, $9A)
    %spritemapEntry(1, $1F8, $E0, 0, 0, 2, 0, $9C)

Spritemap_CeresSteam_Up_6:
    dw $0001
    %spritemapEntry(1, $1F8, $D3, 0, 0, 2, 0, $9C)

Spritemap_CeresSteam_Left_0:
    dw $0001
    %spritemapEntry(1, $1F0, $F8, 0, 0, 2, 0, $7C)

Spritemap_CeresSteam_Left_1:
    dw $0002
    %spritemapEntry(1, $1E8, $F8, 0, 0, 2, 0, $7C)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 2, 0, $7E)

Spritemap_CeresSteam_Left_2:
    dw $0003
    %spritemapEntry(1, $1E0, $F8, 0, 0, 2, 0, $7C)
    %spritemapEntry(1, $1E8, $F8, 0, 0, 2, 0, $7E)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 2, 0, $9A)

Spritemap_CeresSteam_Left_3:
    dw $0004
    %spritemapEntry(1, $1D8, $F6, 0, 0, 2, 0, $7C)
    %spritemapEntry(1, $1E0, $F8, 0, 0, 2, 0, $7E)
    %spritemapEntry(1, $1E8, $F8, 0, 0, 2, 0, $9A)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 2, 0, $9C)

Spritemap_CeresSteam_Left_4:
    dw $0003
    %spritemapEntry(1, $1D7, $F4, 0, 0, 2, 0, $7E)
    %spritemapEntry(1, $1E0, $F6, 0, 0, 2, 0, $9A)
    %spritemapEntry(1, $1E8, $F8, 0, 0, 2, 0, $9C)

Spritemap_CeresSteam_Left_5:
    dw $0002
    %spritemapEntry(1, $1D6, $F2, 0, 0, 2, 0, $9A)
    %spritemapEntry(1, $1E0, $F4, 0, 0, 2, 0, $9C)

Spritemap_CeresSteam_Left_6:
    dw $0001
    %spritemapEntry(1, $1D5, $F0, 0, 0, 2, 0, $9C)

Spritemap_CeresSteam_Down_0:
    dw $0001
    %spritemapEntry(1, $1F8, $00, 1, 0, 2, 0, $7C)

Spritemap_CeresSteam_Down_1:
    dw $0002
    %spritemapEntry(1, $1F8, $08, 1, 0, 2, 0, $7C)
    %spritemapEntry(1, $1F8, $00, 1, 0, 2, 0, $7E)

Spritemap_CeresSteam_Down_2:
    dw $0003
    %spritemapEntry(1, $1F8, $10, 1, 0, 2, 0, $7C)
    %spritemapEntry(1, $1F8, $08, 1, 0, 2, 0, $7E)
    %spritemapEntry(1, $1F8, $00, 1, 0, 2, 0, $9A)

Spritemap_CeresSteam_Down_3:
    dw $0004
    %spritemapEntry(1, $1F8, $18, 1, 0, 2, 0, $7C)
    %spritemapEntry(1, $1F8, $10, 1, 0, 2, 0, $7E)
    %spritemapEntry(1, $1F8, $08, 1, 0, 2, 0, $9A)
    %spritemapEntry(1, $1F8, $00, 1, 0, 2, 0, $9C)

Spritemap_CeresSteam_Down_4:
    dw $0003
    %spritemapEntry(1, $1F8, $18, 1, 0, 2, 0, $7E)
    %spritemapEntry(1, $1F8, $10, 1, 0, 2, 0, $9A)
    %spritemapEntry(1, $1F8, $08, 1, 0, 2, 0, $9C)

Spritemap_CeresSteam_Down_5:
    dw $0002
    %spritemapEntry(1, $1F8, $18, 1, 0, 2, 0, $9A)
    %spritemapEntry(1, $1F8, $10, 1, 0, 2, 0, $9C)

Spritemap_CeresSteam_Down_6:
    dw $0001
    %spritemapEntry(1, $1F8, $18, 1, 0, 2, 0, $9C)

Spritemap_CeresSteam_Right_0:
    dw $0001
    %spritemapEntry(1, $00, $F8, 0, 1, 2, 0, $7C)

Spritemap_CeresSteam_Right_1:
    dw $0002
    %spritemapEntry(1, $08, $F8, 0, 1, 2, 0, $7C)
    %spritemapEntry(1, $00, $F8, 0, 1, 2, 0, $7E)

Spritemap_CeresSteam_Right_2:
    dw $0003
    %spritemapEntry(1, $10, $F8, 0, 1, 2, 0, $7C)
    %spritemapEntry(1, $08, $F8, 0, 1, 2, 0, $7E)
    %spritemapEntry(1, $00, $F8, 0, 1, 2, 0, $9A)

Spritemap_CeresSteam_Right_3:
    dw $0004
    %spritemapEntry(1, $18, $F6, 0, 1, 2, 0, $7C)
    %spritemapEntry(1, $10, $F8, 0, 1, 2, 0, $7E)
    %spritemapEntry(1, $08, $F8, 0, 1, 2, 0, $9A)
    %spritemapEntry(1, $00, $F8, 0, 1, 2, 0, $9C)

Spritemap_CeresSteam_Right_4:
    dw $0003
    %spritemapEntry(1, $19, $F4, 0, 1, 2, 0, $7E)
    %spritemapEntry(1, $10, $F6, 0, 1, 2, 0, $9A)
    %spritemapEntry(1, $08, $F8, 0, 1, 2, 0, $9C)

Spritemap_CeresSteam_Right_5:
    dw $0002
    %spritemapEntry(1, $1A, $F2, 0, 1, 2, 0, $9A)
    %spritemapEntry(1, $10, $F4, 0, 1, 2, 0, $9C)

Spritemap_CeresSteam_Right_6:
    dw $0001
    %spritemapEntry(1, $1B, $F0, 0, 1, 2, 0, $9C)


;;; $F4EC: Ceres door palettes ;;;
Palette_CeresDoor_BeforeEscape:
; Before escape sequence
    dw $0000,$7E20,$6560,$2060,$1000,$7940,$5D00,$4CA0
    dw $3CA0,$43FF,$0113,$000F,$175C,$0299,$01D6,$57E0

Palette_CeresDoor_DuringEscape:
; During escape sequence
    dw $3800,$6B5A,$5652,$28E7,$1863,$62B5,$4A10,$396B
    dw $3129,$43FF,$0113,$000F,$175C,$0299,$01D6,$3BE0


;;; $F52C: Ceres door instruction list pointers ;;;
InstListPointers_CeresDoor:
; Indexed by [enemy parameter 1]
    dw InstList_CeresDoor_Normal_FacingRight
    dw InstList_CeresDoor_Normal_FacingLeft_0
    dw InstList_CeresDoor_RotatingElevRoom_PreExploDoorOverlay_0
    dw InstList_CeresDoor_RidleysRoom_FacingRight_0
    dw InstList_CeresDoor_RotatingElevatorRoom_InvisibleWall_0
    dw InstList_CeresDoor_RidleyEscapeMode7LeftWall_0
    dw InstList_CeresDoor_RidleyEscapeMode7RightWall_0


;;; $F53A: Instruction list - parameter 1 = 3 (Ridley's room facing right) ;;;
InstList_CeresDoor_RidleysRoom_FacingRight_0:
    dw Instruction_CeresDoor_SetAsIntangible
    dw Instruction_CeresDoor_SetAsInvisible
    dw $0002,Spritemap_CeresDoor_FacingRight_Open
    dw Instruction_CeresDoor_SetAsTangible
    dw Instruction_CeresDoor_SetAsVisible
    dw $0002,Spritemap_CeresDoor_FacingRight_Open
    dw $0002,Spritemap_CeresDoor_FacingRight_OpeningFrame3
    dw $0002,Spritemap_CeresDoor_FacingRight_OpeningFrame2
    dw $0002,Spritemap_CeresDoor_FacingRight_OpeningFrame1
    dw Instruction_CeresDoor_SetDrawnByRidleyFlag
    dw $0001,Spritemap_CeresDoor_FacingRight_Closed
    dw Instruction_CeresDoor_SetAsInvisible

InstList_CeresDoor_RidleysRoom_FacingRight_1:
    dw $0002,Spritemap_CeresDoor_FacingRight_Closed
    dw Instruction_CeresDoor_GotoYIfAreaBossIsAlive
    dw InstList_CeresDoor_RidleysRoom_FacingRight_1
    dw Instruction_CeresDoor_SetAsVisible_ClearDrawnByRidleyFlag
    dw Instruction_Common_GotoY
    dw InstList_CeresDoor_Closed_FacingRight_0


;;; $F56C: Instruction list - parameter 1 = 0 (normal facing right) ;;;
InstList_CeresDoor_Normal_FacingRight:
    dw Instruction_CeresDoor_SetAsIntangible
    dw Instruction_CeresDoor_SetAsInvisible
    dw $0002,Spritemap_CeresDoor_FacingRight_Closed
    dw Inst_CeresDoor_GotoYIfSamusIsNotWithing30Pixels
    dw InstList_CeresDoor_Closed_FacingRight_0


;;; $F578: Instruction list - Ceres door facing right - open ;;;
InstList_CeresDoor_Open_FacingRight_0:
    dw $0002,Spritemap_CeresDoor_FacingRight_Open
    dw Inst_CeresDoor_GotoYIfSamusIsNotWithing30Pixels
    dw InstList_CeresDoor_Open_FacingRight_1
    dw Instruction_Common_GotoY
    dw InstList_CeresDoor_Open_FacingRight_0

InstList_CeresDoor_Open_FacingRight_1:
    dw Instruction_CeresDoor_SetAsTangible
    dw Instruction_CeresDoor_SetAsVisible
    dw $0005,Spritemap_CeresDoor_FacingRight_Open
    dw $0005,Spritemap_CeresDoor_FacingRight_OpeningFrame3
    dw $0005,Spritemap_CeresDoor_FacingRight_OpeningFrame2
    dw $0005,Spritemap_CeresDoor_FacingRight_OpeningFrame1


;;; $F598: Instruction list - Ceres door facing right - closed ;;;
InstList_CeresDoor_Closed_FacingRight_0:
    dw Instruction_CeresDoor_SetAsTangible
    dw Instruction_CeresDoor_SetAsVisible

InstList_CeresDoor_Closed_FacingRight_1:
    dw $0002,Spritemap_CeresDoor_FacingRight_Closed
    dw Inst_CeresDoor_GotoYIfSamusIsNotWithing30Pixels
    dw InstList_CeresDoor_Closed_FacingRight_1
    dw Instruction_CeresDoor_QueueOpeningSFX
    dw $0005,Spritemap_CeresDoor_FacingRight_OpeningFrame1
    dw $0005,Spritemap_CeresDoor_FacingRight_OpeningFrame2
    dw $0005,Spritemap_CeresDoor_FacingRight_OpeningFrame3
    dw $0005,Spritemap_CeresDoor_FacingRight_Open
    dw Instruction_CeresDoor_SetAsIntangible
    dw Instruction_CeresDoor_SetAsInvisible
    dw Instruction_Common_GotoY
    dw InstList_CeresDoor_Open_FacingRight_0


;;; $F5BE: Instruction list - parameter 1 = 1 (normal facing left) ;;;
InstList_CeresDoor_Normal_FacingLeft_0:
    dw Instruction_CeresDoor_SetAsIntangible
    dw Instruction_CeresDoor_SetAsInvisible
    dw $0002,Spritemap_CeresDoor_FacingRight_Closed
    dw Inst_CeresDoor_GotoYIfSamusIsNotWithing30Pixels
    dw InstList_CeresDoor_Normal_FacingLeft_3

InstList_CeresDoor_Normal_FacingLeft_1:
    dw $0002,Spritemap_CeresDoor_FacingLeft_Closed
    dw Inst_CeresDoor_GotoYIfSamusIsNotWithing30Pixels
    dw InstList_CeresDoor_Normal_FacingLeft_2
    dw Instruction_Common_GotoY
    dw InstList_CeresDoor_Normal_FacingLeft_1

InstList_CeresDoor_Normal_FacingLeft_2:
    dw Instruction_CeresDoor_SetAsTangible
    dw Instruction_CeresDoor_SetAsVisible
    dw $0005,Spritemap_CeresDoor_FacingLeft_Open
    dw $0005,Spritemap_CeresDoor_FacingLeft_OpeningFrame3
    dw $0005,Spritemap_CeresDoor_FacingLeft_OpeningFrame2
    dw $0005,Spritemap_CeresDoor_FacingLeft_OpeningFrame1

InstList_CeresDoor_Normal_FacingLeft_3:
    dw Instruction_CeresDoor_SetAsTangible
    dw Instruction_CeresDoor_SetAsVisible

InstList_CeresDoor_Normal_FacingLeft_4:
    dw $0002,Spritemap_CeresDoor_FacingLeft_Closed
    dw Inst_CeresDoor_GotoYIfSamusIsNotWithing30Pixels
    dw InstList_CeresDoor_Normal_FacingLeft_4
    dw Instruction_CeresDoor_QueueOpeningSFX
    dw $0005,Spritemap_CeresDoor_FacingLeft_OpeningFrame1
    dw $0005,Spritemap_CeresDoor_FacingLeft_OpeningFrame2
    dw $0005,Spritemap_CeresDoor_FacingLeft_OpeningFrame3
    dw $0005,Spritemap_CeresDoor_FacingLeft_Open
    dw Instruction_CeresDoor_SetAsIntangible
    dw Instruction_CeresDoor_SetAsInvisible
    dw Instruction_Common_GotoY
    dw InstList_CeresDoor_Normal_FacingLeft_1


;;; $F610: Instruction list - parameter 1 = 2 (rotating elevator room pre-explosion door overlay) ;;;
InstList_CeresDoor_RotatingElevRoom_PreExploDoorOverlay_0:
    dw Instruction_CeresDoor_SetAsIntangible

InstList_CeresDoor_RotatingElevRoom_PreExploDoorOverlay_1:
    dw $0001,Spritemap_CeresDoor_RotatingElevRoomPreExplosionDoorOverlay
    dw Instruction_Common_GotoY
    dw InstList_CeresDoor_RotatingElevRoom_PreExploDoorOverlay_1


;;; $F61A: Instruction list - parameter 1 = 4 (rotating elevator room invisible wall) ;;;
InstList_CeresDoor_RotatingElevatorRoom_InvisibleWall_0:
    dw Instruction_CeresDoor_GotoYIfCeresRidleyHasNotEscaped
    dw InstList_CeresDoor_Normal_FacingLeft_0
    dw Instruction_CeresDoor_SetAsTangible
    dw Instruction_CeresDoor_SetAsInvisible

InstList_CeresDoor_RotatingElevatorRoom_InvisibleWall_1:
    dw $0001,Spritemap_CeresDoor_FacingLeft_Closed
    dw Instruction_Common_GotoY
    dw InstList_CeresDoor_RotatingElevatorRoom_InvisibleWall_1


;;; $F62A: Instruction list - parameter 1 = 5 (Ridley escape mode 7 left wall) ;;;
InstList_CeresDoor_RidleyEscapeMode7LeftWall_0:
    dw Instruction_CeresDoor_SetAsIntangible

InstList_CeresDoor_RidleyEscapeMode7LeftWall_1:
    dw $0001,Spritemap_CeresDoor_RidleyEscapeMode7LeftWall
    dw Instruction_Common_GotoY
    dw InstList_CeresDoor_RidleyEscapeMode7LeftWall_1


;;; $F634: Instruction list - parameter 1 = 6 (Ridley escape mode 7 right wall) ;;;
InstList_CeresDoor_RidleyEscapeMode7RightWall_0:
    dw Instruction_CeresDoor_SetAsIntangible

InstList_CeresDoor_RidleyEscapeMode7RightWall_1:
    dw $0001,Spritemap_CeresDoor_RidleyEscapeMode7RightWall
    dw Instruction_Common_GotoY
    dw InstList_CeresDoor_RidleyEscapeMode7RightWall_1


;;; $F63E: Instruction - go to [[Y]] if Samus is not within 30h pixels ;;;
Inst_CeresDoor_GotoYIfSamusIsNotWithing30Pixels:
; Measure with taxicab distance
    LDA.W Enemy.XPosition,X
    SEC
    SBC.W SamusXPosition
    BPL +
    EOR.W #$FFFF
    INC

+   CMP.W #$0030
    BCS Inst_CeresDoor_GotoYIfSamusIsNotWithin30Pixels_gotoY
    LDA.W Enemy.YPosition,X
    SEC
    SBC.W SamusYPosition
    BPL +
    EOR.W #$FFFF
    INC

+   CMP.W #$0030
    BCS Inst_CeresDoor_GotoYIfSamusIsNotWithin30Pixels_gotoY             ; fallthrough to Inst_CeresDoor_GotoYIfSamusIsNotWithin30Pixels_outOfRange


Inst_CeresDoor_GotoYIfSamusIsNotWithin30Pixels_outOfRange:
    INY
    INY
    RTL


Inst_CeresDoor_GotoYIfSamusIsNotWithin30Pixels_gotoY:
    LDA.W $0000,Y
    TAY
    RTL


;;; $F66A: Instruction - go to [[Y]] if area boss is alive ;;;
Instruction_CeresDoor_GotoYIfAreaBossIsAlive:
    PHX
    LDX.W AreaIndex
    LDA.L SRAMMirror_Boss,X
    PLX
    LSR
    BCC Inst_CeresDoor_GotoYIfSamusIsNotWithin30Pixels_gotoY
    BRA Inst_CeresDoor_GotoYIfSamusIsNotWithin30Pixels_outOfRange


;;; $F678: Instruction - go to [[Y]] if Ceres Ridley has not escaped ;;;
Instruction_CeresDoor_GotoYIfCeresRidleyHasNotEscaped:
    LDA.W CeresStatus
    BEQ Inst_CeresDoor_GotoYIfSamusIsNotWithin30Pixels_gotoY
    BRA Inst_CeresDoor_GotoYIfSamusIsNotWithin30Pixels_outOfRange


;;; $F67F: Set Ceres elevator room to rotate if Ridley has escaped ;;;
SetElevatorRoomToRotateIfRidleyHasEscaped:
    LDA.W CeresStatus
    BEQ .return
    LDA.W #$8000
    STA.W CeresStatus

  .return:
    RTL


;;; $F68B: Instruction - set enemy as intangible ;;;
Instruction_CeresDoor_SetAsIntangible:
    LDA.W Enemy.properties,X
    ORA.W #$0400
    STA.W Enemy.properties,X
    RTL


;;; $F695: Instruction - set enemy as tangible ;;;
Instruction_CeresDoor_SetAsTangible:
    LDA.W Enemy.properties,X
    AND.W #$FBFF
    STA.W Enemy.properties,X
    RTL


;;; $F69F: Instruction - set drawn by Ridley flag ;;;
Instruction_CeresDoor_SetDrawnByRidleyFlag:
    LDA.W #$0001
    STA.W CeresDoor.drawnByRidleyFlag,X
    RTL


;;; $F6A6: Instruction - set enemy as invisible ;;;
Instruction_CeresDoor_SetAsInvisible:
    LDA.W Enemy.properties,X
    ORA.W #$0100
    STA.W Enemy.properties,X
    RTL


;;; $F6B0: Instruction - set enemy as visible, clear drawn by Ridley flag ;;;
Instruction_CeresDoor_SetAsVisible_ClearDrawnByRidleyFlag:
    STZ.W CeresDoor.drawnByRidleyFlag,X                                  ; fallthrough to Instruction_CeresDoor_SetAsVisible


;;; $F6B3: Instruction - set enemy as visible ;;;
Instruction_CeresDoor_SetAsVisible:
    LDA.W Enemy.properties,X
    AND.W #$FEFF
    STA.W Enemy.properties,X
    RTL


;;; $F6BD: Instruction - queue Ceres door opening sound effect ;;;
Instruction_CeresDoor_QueueOpeningSFX:
    LDA.W #$002C
    JSL QueueSound_Lib3_Max6
    RTL


;;; $F6C5: Initialisation AI - enemy $E23F (Ceres door) ;;;
InitAI_CeresDoor:
    LDX.W EnemyIndex
    LDA.W #Spritemap_CeresDoor_Placeholder
    STA.W Enemy.spritemap,X
    LDA.W #$0001
    STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    STZ.W Enemy.GFXOffset,X
    LDA.W #$0400
    STA.W Enemy.palette,X
    LDA.W Enemy.init0,X
    ASL
    TAY
    LDA.W .functionPointers,Y
    STA.W CeresDoor.function,X
    LDA.W InstListPointers_CeresDoor,Y
    STA.W Enemy.instList,X
    STZ.W CeresDoor.drawnByRidleyFlag,X
    JSR LoadRotatingElevatorRoomPreExplosioNDoorOverlayTilesIfNeeded
    LDA.W CeresStatus
    BNE .escapeSequence
    LDA.W Enemy.init0,X
    CMP.W #$0003
    BNE .notRidleysRoom
    LDY.W #Palette_CeresDoor_BeforeEscape+2
    LDX.W #$0142
    LDA.W #$000F
    JSL WriteAColorsFromYToTargetColorIndexX
    RTL

  .notRidleysRoom:
    LDY.W #Palette_CeresDoor_BeforeEscape+2
    BRA .merge

  .escapeSequence:
    LDY.W #Palette_CeresDoor_DuringEscape+2

  .merge:
    LDA.W #$0E00
    STA.W Enemy.palette,X
    LDX.W #$01E2
    LDA.W #$000F
    JSL WriteAColorsFromYToTargetColorIndexX
    RTL

  .functionPointers:
; Function pointers, indexed by [enemy parameter 1]
    dw Function_CeresDoor_HandleEarthquakeDuringEscape                   ; 0: Normal facing right
    dw Function_CeresDoor_HandleEarthquakeDuringEscape                   ; 1: Normal facing left
    dw Function_CeresDoor_RotatingElevatorRoom_Default                   ; 2: Rotating elevator room pre-explosion door overlay
    dw Function_CeresDoor_HandleEarthquakeDuringEscapeInRidleysRoom      ; 3: Ridley's room (facing right)
    dw Function_CeresDoor_HandleEarthquakeDuringEscape                   ; 4: Rotating elevator room invisible wall
    dw Function_CeresDoor_RidleyEscapeMode7Wall                          ; 5: Ridley escape mode 7 left wall
    dw Function_CeresDoor_RidleyEscapeMode7Wall                          ; 6: Ridley escape mode 7 right wall


;;; $F739: Load rotating elevator room pre-explosion door overlay tiles if needed ;;;
LoadRotatingElevatorRoomPreExplosioNDoorOverlayTilesIfNeeded:
    LDA.W Enemy.init0,X
    CMP.W #$0002
    BNE .return
    LDY.W VRAMWriteStack
    LDA.W #$0400
    STA.W VRAMWrite.size,Y                                               ; >.<
    LDA.W #Tiles_CeresElevatorRoomDoor>>8&$FF00
    STA.W VRAMWrite.src+1,Y                                              ; >.<
    LDA.W #Tiles_CeresElevatorRoomDoor
    STA.W VRAMWrite.src,Y                                                ; >.<
    LDA.W #$7000
    STA.W VRAMWrite.dest,Y                                               ; >.<
    TYA
    CLC
    ADC.W #$0007
    STA.W VRAMWriteStack

  .return:
    RTS


;;; $F765: Main AI - enemy $E23F (Ceres door) ;;;
MainAI_CeresDoor:
    LDX.W EnemyIndex
    JMP.W (CeresDoor.function,X)


;;; $F76B: Ceres door function - handle earthquake during escape ;;;
Function_CeresDoor_HandleEarthquakeDuringEscape:
    LDY.W #$0014
    BRA HandleEarthquakeDuringEscape


;;; $F770: Ceres door function - handle earthquake during escape in Ridley's room ;;;
Function_CeresDoor_HandleEarthquakeDuringEscapeInRidleysRoom:
    LDY.W #$001D                                                         ; fallthrough to HandleEarthquakeDuringEscape


;;; $F773: Handle Ceres door earthquake during escape ;;;
HandleEarthquakeDuringEscape:
;; Parameters:
;;     Y: Earthquake type. Must have 1 pixel displacement
    LDA.W CeresStatus
    CMP.W #$0002
    BCC .return
    LDA.W EarthquakeTimer
    BNE .return
    LDA.W RandomNumberSeed
    AND.W #$0FFF
    CMP.W #$0080
    BCC .random
    LDA.W #$0002
    STA.W EarthquakeTimer
    TYA
    STA.W EarthquakeType
    RTL

  .random:
    LDA.W #$0004
    STA.W EarthquakeTimer
    TYA
    CLC
    ADC.W #$0006
    STA.W EarthquakeType

  .return:
    RTL


;;; $F7A5: Ceres door function - Ridley escape mode 7 wall ;;;
Function_CeresDoor_RidleyEscapeMode7Wall:
    LDX.W EnemyIndex
    JSL Instruction_CeresDoor_SetAsInvisible
    LDA.W CeresStatus
    LSR
    BCC .return
    LDA.W #$0E00
    STA.W Enemy.palette,X
    JSL Instruction_CeresDoor_SetAsVisible

  .return:
    RTL


;;; $F7BD: Ceres door function - rotating elevator room - default ;;;
Function_CeresDoor_RotatingElevatorRoom_Default:
    JSL Function_CeresDoor_RotatingElevatorRoom_ElevatorAnimations
    LDA.W CeresStatus
    CMP.W #$0002
    BCC .return
    LDA.W #Function_CeresDoor_RotatingElevatorRoom_Rumbling_Explosions
    STA.W CeresDoor.function,X
    LDA.W #$0030
    STA.W CeresDoor.rumblingTimer,X
    STZ.W CeresDoor.CeresDoorRumbleTimer
    STZ.W CeresDoor.CeresDoorRumbleIndex

  .return:
    RTL


;;; $F7DC: Ceres door function - rotating elevator room - rumbling and explosions ;;;
Function_CeresDoor_RotatingElevatorRoom_Rumbling_Explosions:
    DEC.W CeresDoor.rumblingTimer,X
    BPL .enemyRumbleTimerNotExpired
    LDA.W Enemy.properties,X
    ORA.W #$0100
    STA.W Enemy.properties,X
    LDA.W #Function_CeresDoor_RotatingElevatorRoom_ElevatorAnimations
    STA.W CeresDoor.function,X
    JMP SetElevatorRoomToRotateIfRidleyHasEscaped

  .enemyRumbleTimerNotExpired:
    DEC.W CeresDoor.CeresDoorRumbleTimer
    BPL .return
    LDA.W #$0004
    STA.W CeresDoor.CeresDoorRumbleTimer
    DEC.W CeresDoor.CeresDoorRumbleIndex
    BPL .ceresDoorTimerNotExpired
    LDA.W #$0003
    STA.W CeresDoor.CeresDoorRumbleIndex

  .ceresDoorTimerNotExpired:
    LDA.W CeresDoor.CeresDoorRumbleIndex
    ASL
    ASL
    TAY
    LDA.W .XOffset,Y
    CLC
    ADC.W Enemy.XPosition,X
    STA.B DP_Temp12
    LDA.W .YOffset,Y
    CLC
    ADC.W Enemy.YPosition,X
    STA.B DP_Temp14
    LDY.W #$0003
    JSL GenerateRandomNumber
    CMP.W #$4000
    BCS .noSmoke
    LDY.W #$000C

  .noSmoke:
    TYA
    LDY.W #EnemyProjectile_MiscDust
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W #$0025
    JSL QueueSound_Lib2_Max6

  .return:
    RTL

; Rumble offsets
  .XOffset:
    dw $FFFC
  .YOffset:
    dw       $FFF8
    dw $0000,$0004
    dw $FFFE,$0016
    dw $0002,$000C


;;; $F850: Ceres door function - rotating elevator room - handle Ceres elevator animations ;;;
Function_CeresDoor_RotatingElevatorRoom_ElevatorAnimations:
    PHX
    JSR AnimateCeresElevatorPlatform
    LDA.L PaletteChangeNumerator
    BNE .return
    LDA.W NMI_FrameCounter
    AND.W #$0038
    ASL
    ADC.W #.paletteAnimation
    TAY
    LDX.W #$0052
    LDA.W #$0006
    JSL WriteAColorsFromYtoColorIndexX

  .return:
    PLX
    RTL

  .paletteAnimation:
; Elevator beacon palette animation
    dw $5BFF,$15B8,$14B4,$17DF,$02FC,$0239,$0000,$0000
    dw $47FF,$0113,$000F,$175C,$0299,$01D6,$0000,$0000
    dw $335A,$006E,$000A,$02B7,$01F4,$0131,$0000,$0000
    dw $1EB5,$0009,$0005,$0212,$014E,$008C,$0000,$0000
    dw $1EB5,$0009,$0005,$0212,$014E,$008C,$0000,$0000
    dw $335A,$006E,$000A,$02B7,$01F4,$0131,$0000,$0000
    dw $47FF,$0113,$000F,$175C,$0299,$01D6,$0000,$0000
    dw $5BFF,$15B8,$14B4,$17DF,$02FC,$0239,$0000,$0000


;;; $F8F1: Animate Ceres elevator platform ;;;
AnimateCeresElevatorPlatform:
    LDA.W NMI_FrameCounter
    AND.W #$0002
    TAY
    LDX.W .mode7TransferPointers,Y
    JSL QueueMode7Transfers
    RTS

  .mode7TransferPointers:
    dw Mode7Transfer_CeresElevatorPlatform_light
    dw Mode7Transfer_CeresElevatorPlatform_dark


Mode7Transfer_CeresElevatorPlatform_light:
    db $80                                                               ; Control. 80h = write to VRAM tilemap. 0 = terminator
    dl CeresElevatorPlatform_light                                       ; Source address
    dw $0004,$060E                                                       ; Size.Destination address (VRAM)
    db $00                                                               ; VRAM address increment mode
    db $00

Mode7Transfer_CeresElevatorPlatform_dark:
    db $80                                                               ; Control. 80h = write to VRAM tilemap. 0 = terminator
    dl CeresElevatorPlatform_dark                                        ; Source address
    dw $0004,$060E                                                       ; Size.Destination address (VRAM)
    db $00                                                               ; VRAM address increment mode
    db $00

CeresElevatorPlatform:
  .light:
    db $68,$69,$69,$78

  .dark:
    db $8D,$8E,$8E,$79


;;; $F920: RTL. Enemy touch / enemy shot - enemy $E23F (Ceres door) ;;;
RTL_A6F920:
    RTL


;;; $F921: Ceres door spritemaps ;;;
Spritemap_CeresDoor_RotatingElevRoomPreExplosionDoorOverlay:
    dw $000C
    %spritemapEntry(1, $1F8, $18, 1, 1, 2, 0, $E0)
    %spritemapEntry(1, $1F8, $08, 0, 1, 2, 0, $E4)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $E4)
    %spritemapEntry(1, $1F8, $E8, 0, 1, 2, 0, $E0)
    %spritemapEntry(1, $4208, $28, 0, 0, 2, 0, $10A)
    %spritemapEntry(1, $43F8, $28, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $4208, $18, 1, 0, 2, 0, $104)
    %spritemapEntry(1, $4208, $08, 1, 0, 2, 0, $106)
    %spritemapEntry(1, $4208, $F8, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $4208, $E8, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $4208, $D8, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $43F8, $D8, 0, 0, 2, 0, $100)

Spritemap_CeresDoor_FacingLeft_Closed:
    dw $0008
    %spritemapEntry(0, $1F8, $18, 1, 1, 2, 0, $D1)
    %spritemapEntry(0, $1F8, $10, 1, 1, 2, 0, $D3)
    %spritemapEntry(0, $1F8, $E0, 0, 1, 2, 0, $D1)
    %spritemapEntry(0, $1F8, $E8, 0, 1, 2, 0, $D3)
    %spritemapEntry(0, $1F8, $00, 1, 1, 2, 0, $F2)
    %spritemapEntry(0, $1F8, $08, 1, 1, 2, 0, $E2)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 0, $F2)
    %spritemapEntry(0, $1F8, $F0, 0, 1, 2, 0, $E2)

Spritemap_CeresDoor_FacingLeft_OpeningFrame1:
    dw $0008
    %spritemapEntry(0, $1F8, $10, 1, 1, 2, 0, $F3)
    %spritemapEntry(0, $1F8, $18, 1, 1, 2, 0, $E3)
    %spritemapEntry(0, $1F8, $E8, 0, 1, 2, 0, $F3)
    %spritemapEntry(0, $1F8, $E0, 0, 1, 2, 0, $E3)
    %spritemapEntry(0, $1FA, $00, 1, 1, 2, 0, $F2)
    %spritemapEntry(0, $1FA, $08, 1, 1, 2, 0, $E2)
    %spritemapEntry(0, $1FA, $F8, 0, 1, 2, 0, $F2)
    %spritemapEntry(0, $1FA, $F0, 0, 1, 2, 0, $E2)

Spritemap_CeresDoor_FacingLeft_OpeningFrame2:
    dw $0006
    %spritemapEntry(0, $1F8, $18, 1, 1, 2, 0, $D0)
    %spritemapEntry(0, $1F8, $E0, 0, 1, 2, 0, $D0)
    %spritemapEntry(0, $1FC, $00, 1, 1, 2, 0, $F2)
    %spritemapEntry(0, $1FC, $08, 1, 1, 2, 0, $E2)
    %spritemapEntry(0, $1FC, $F8, 0, 1, 2, 0, $F2)
    %spritemapEntry(0, $1FC, $F0, 0, 1, 2, 0, $E2)

Spritemap_CeresDoor_FacingLeft_OpeningFrame3:
    dw $0006
    %spritemapEntry(0, $1F8, $E0, 0, 1, 2, 0, $D2)
    %spritemapEntry(0, $1F8, $18, 1, 1, 2, 0, $D2)
    %spritemapEntry(0, $1FE, $00, 1, 1, 2, 0, $F2)
    %spritemapEntry(0, $1FE, $08, 1, 1, 2, 0, $E2)
    %spritemapEntry(0, $1FE, $F8, 0, 1, 2, 0, $F2)
    %spritemapEntry(0, $1FE, $F0, 0, 1, 2, 0, $E2)

Spritemap_CeresDoor_FacingLeft_Open:
    dw $0006
    %spritemapEntry(0, $1FA, $18, 1, 1, 2, 0, $D2)
    %spritemapEntry(0, $1FA, $E0, 0, 1, 2, 0, $D2)
    %spritemapEntry(0, $1FF, $00, 1, 1, 2, 0, $F2)
    %spritemapEntry(0, $1FF, $08, 1, 1, 2, 0, $E2)
    %spritemapEntry(0, $1FF, $F8, 0, 1, 2, 0, $F2)
    %spritemapEntry(0, $1FF, $F0, 0, 1, 2, 0, $E2)

Spritemap_CeresDoor_FacingRight_Closed:
    dw $0008
    %spritemapEntry(0, $00, $18, 1, 0, 2, 0, $D1)
    %spritemapEntry(0, $00, $E0, 0, 0, 2, 0, $D1)
    %spritemapEntry(0, $00, $10, 1, 0, 2, 0, $D3)
    %spritemapEntry(0, $00, $E8, 0, 0, 2, 0, $D3)
    %spritemapEntry(0, $00, $00, 1, 0, 2, 0, $F2)
    %spritemapEntry(0, $00, $08, 1, 0, 2, 0, $E2)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $F2)
    %spritemapEntry(0, $00, $F0, 0, 0, 2, 0, $E2)

Spritemap_CeresDoor_FacingRight_OpeningFrame1:
    dw $0008
    %spritemapEntry(0, $00, $10, 1, 0, 2, 0, $F3)
    %spritemapEntry(0, $00, $18, 1, 0, 2, 0, $E3)
    %spritemapEntry(0, $00, $E8, 0, 0, 2, 0, $F3)
    %spritemapEntry(0, $00, $E0, 0, 0, 2, 0, $E3)
    %spritemapEntry(0, $1FE, $00, 1, 0, 2, 0, $F2)
    %spritemapEntry(0, $1FE, $08, 1, 0, 2, 0, $E2)
    %spritemapEntry(0, $1FE, $F8, 0, 0, 2, 0, $F2)
    %spritemapEntry(0, $1FE, $F0, 0, 0, 2, 0, $E2)

Spritemap_CeresDoor_FacingRight_OpeningFrame2:
    dw $0006
    %spritemapEntry(0, $00, $18, 1, 0, 2, 0, $D0)
    %spritemapEntry(0, $00, $E0, 0, 0, 2, 0, $D0)
    %spritemapEntry(0, $1FC, $00, 1, 0, 2, 0, $F2)
    %spritemapEntry(0, $1FC, $08, 1, 0, 2, 0, $E2)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 0, $F2)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 2, 0, $E2)

Spritemap_CeresDoor_FacingRight_OpeningFrame3:
    dw $0006
    %spritemapEntry(0, $00, $18, 1, 0, 2, 0, $D2)
    %spritemapEntry(0, $00, $E0, 0, 0, 2, 0, $D2)
    %spritemapEntry(0, $1FA, $00, 1, 0, 2, 0, $F2)
    %spritemapEntry(0, $1FA, $08, 1, 0, 2, 0, $E2)
    %spritemapEntry(0, $1FA, $F8, 0, 0, 2, 0, $F2)
    %spritemapEntry(0, $1FA, $F0, 0, 0, 2, 0, $E2)

Spritemap_CeresDoor_FacingRight_Open:
    dw $0006
    %spritemapEntry(0, $1FE, $18, 1, 0, 2, 0, $D2)
    %spritemapEntry(0, $1FE, $E0, 0, 0, 2, 0, $D2)
    %spritemapEntry(0, $1F9, $00, 1, 0, 2, 0, $F2)
    %spritemapEntry(0, $1F9, $08, 1, 0, 2, 0, $E2)
    %spritemapEntry(0, $1F9, $F8, 0, 0, 2, 0, $F2)
    %spritemapEntry(0, $1F9, $F0, 0, 0, 2, 0, $E2)

Spritemap_CeresDoor_Placeholder:
    dw $0001
    %spritemapEntry(0, $08, $08, 0, 0, 2, 0, $20)

Spritemap_CeresDoor_RidleyEscapeMode7LeftWall:
    dw $0013
    %spritemapEntry(1, $43F8, $40, 0, 0, 0, 2, $E6)
    %spritemapEntry(1, $43F8, $20, 0, 0, 0, 2, $E8)
    %spritemapEntry(1, $43F8, $D0, 1, 0, 0, 2, $E8)
    %spritemapEntry(1, $4218, $20, 0, 0, 0, 2, $EE)
    %spritemapEntry(1, $43F8, $80, 0, 0, 0, 2, $E6)
    %spritemapEntry(1, $43F8, $A0, 0, 0, 0, 2, $E6)
    %spritemapEntry(1, $43F8, $B0, 0, 0, 0, 2, $E6)
    %spritemapEntry(1, $43F8, $90, 0, 0, 0, 2, $E6)
    %spritemapEntry(1, $43F8, $C0, 0, 0, 0, 2, $E6)
    %spritemapEntry(1, $4218, $40, 0, 0, 0, 2, $EE)
    %spritemapEntry(1, $4218, $30, 0, 0, 0, 2, $EE)
    %spritemapEntry(1, $4208, $40, 0, 0, 0, 2, $EE)
    %spritemapEntry(1, $4208, $30, 0, 0, 0, 2, $EE)
    %spritemapEntry(1, $4208, $20, 0, 0, 0, 2, $EE)
    %spritemapEntry(1, $43F8, $30, 0, 0, 0, 2, $E6)
    %spritemapEntry(1, $43F8, $00, 1, 0, 0, 2, $E4)
    %spritemapEntry(1, $43F8, $10, 1, 0, 0, 2, $E0)
    %spritemapEntry(1, $43F8, $F0, 0, 0, 0, 2, $E4)
    %spritemapEntry(1, $43F8, $E0, 0, 0, 0, 2, $E0)

Spritemap_CeresDoor_RidleyEscapeMode7RightWall:
    dw $000D
    %spritemapEntry(1, $43F8, $80, 0, 0, 0, 2, $E6)
    %spritemapEntry(1, $43F8, $90, 0, 0, 0, 2, $E6)
    %spritemapEntry(1, $43F8, $A0, 0, 0, 0, 2, $E6)
    %spritemapEntry(1, $43F8, $B0, 0, 0, 0, 2, $E6)
    %spritemapEntry(1, $43F8, $C0, 0, 0, 0, 2, $E6)
    %spritemapEntry(1, $43F8, $D0, 0, 0, 0, 2, $E6)
    %spritemapEntry(1, $43F8, $E0, 0, 0, 0, 2, $E6)
    %spritemapEntry(1, $43F8, $F0, 0, 0, 0, 2, $E6)
    %spritemapEntry(1, $43F8, $00, 0, 0, 0, 2, $E6)
    %spritemapEntry(1, $43F8, $10, 0, 0, 0, 2, $E6)
    %spritemapEntry(1, $43F8, $20, 0, 0, 0, 2, $E6)
    %spritemapEntry(1, $43F8, $40, 1, 0, 0, 2, $E8)
    %spritemapEntry(1, $43F8, $30, 0, 0, 0, 2, $E6)


;;; $FB72: Initialisation AI - enemy $E27F (zebetites) ;;;
InitAI_Zebetite:
    LDX.W EnemyIndex
    LDA.W Enemy.properties,X
    ORA.W #$A000
    STA.W Enemy.properties,X
    LDA.W #$0001
    STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.W #$0400
    STA.W Enemy.palette,X
    LDA.W #$0080
    STA.W Enemy.GFXOffset,X
    STZ.W Enemy.var2,X
    LDY.W #Function_Zebetite_SpawnBottomZebetiteIfNeeded
    LDA.W Enemy.init0,X
    BEQ .setFunctionPointer
    LDY.W #Function_Zebetite_WaitForDoorTransitionToFinish

  .setFunctionPointer:
    TYA
    STA.W Zebetite.function,X
    STZ.B DP_Temp12
    LDA.W #$0005
    JSL CheckIfEvent_inA_HasHappened
    ROL.B DP_Temp12
    LDA.W #$0004
    JSL CheckIfEvent_inA_HasHappened
    ROL.B DP_Temp12
    LDA.W #$0003
    JSL CheckIfEvent_inA_HasHappened
    ROL.B DP_Temp12
    LDA.B DP_Temp12
    STA.W Zebetite.destroyedCounter,X
    CMP.W #$0004
    BMI .notAllDestroyed
    LDA.W Enemy.properties,X
    ORA.W #$0200
    STA.W Enemy.properties,X
    RTL

  .notAllDestroyed:
    ASL
    TAY
    LDA.W .multipartFlag,Y
    STA.W Zebetite.multiPartFlag,X
    LDA.W .height,Y
    STA.W Enemy.YHitboxRadius,X
    LDA.W .instListPointer,Y
    STA.W Enemy.instList,X
    LDA.W .XPosition,Y
    STA.W Enemy.XPosition,X
    LDA.W Enemy.init0,X
    BEQ .zeroParam1
    LDA.W .YPosition_nonZero,Y
    STA.W Enemy.YPosition,X
    RTL

  .zeroParam1:
    LDA.W .YPosition_zero,Y
    STA.W Enemy.YPosition,X
    RTL

; Indexed by zebetites destroyed counter
;       0     1     2     3
  .multipartFlag:
    dw $0000,$8000,$0000,$8000

  .height:
    dw $0018,$0008,$0018,$0008

  .instListPointer:
    dw InstList_Big_HealthGreaterThanEqualTo800
    dw InstList_Small_HealthGreaterThanEqualTo800
    dw InstList_Big_HealthGreaterThanEqualTo800
    dw InstList_Small_HealthGreaterThanEqualTo800

  .XPosition:
    dw $0338,$0278,$01B8,$00F8

  .YPosition_zero:
; Y position - [enemy parameter 1] = 0
    dw $006F,$0047,$006F,$0047

  .YPosition_nonZero:
; Y position - [enemy parameter 1] != 0
    dw $006F,$0097,$006F,$0097


;;; $FC33: Main AI - enemy $E27F (zebetites) ;;;
MainAI_Zebetite:
    LDX.W EnemyIndex
    LDA.W EarthquakeTimer
    BNE .function
    STZ.W Enemy.shakeTimer,X

  .function:
    JMP.W (Zebetite.function,X)


;;; $FC41: Zebetites function - spawn bottom zebetite if needed ;;;
Function_Zebetite_SpawnBottomZebetiteIfNeeded:
    LDA.W Zebetite.multiPartFlag,X
    BPL .notNeeded
    JSR SpawnBottomZebetite
    LDA.W EnemyIndex
    STA.W Zebetite.otherPartEnemyIndex,X
    TAY
    TXA
    TYX
    STA.W Zebetite.otherPartEnemyIndex,X

  .notNeeded:
    LDA.W #Function_Zebetite_WaitForDoorTransitionToFinish
    STA.W Zebetite.function,X                                            ; fallthrough to Function_Zebetite_WaitForDoorTransitionToFinish


;;; $FC5B: Zebetites function - wait for door transition to finish ;;;
Function_Zebetite_WaitForDoorTransitionToFinish:
    LDA.W DoorTransitionFlagElevatorsZebetites
    BEQ .finished
    RTL

  .finished:
    LDA.W #Function_Zebetite_Active
    STA.W Zebetite.function,X                                            ; fallthrough to Function_Zebetite_Active


;;; $FC67: Zebetites function - active ;;;
Function_Zebetite_Active:
    JSR HandleZebetitePaletteAnimation
    JSR SetZebetiteInstList
    LDX.W EnemyIndex
    LDA.W Enemy.health,X
    BEQ .destroyed
    CLC
    ADC.W #$0001
    CMP.W #$03E8
    BMI +
    LDA.W #$03E8

+   STA.W Enemy.health,X
    RTL

  .destroyed:
    LDA.W Enemy.init0,X
    BEQ .singlePart

  .noMore:
    LDA.W #$0000
    JML EnemyDeath

  .singlePart:
    JSR MarkZebetiteDestroyedEvent
    LDX.W EnemyIndex
    LDA.W Zebetite.destroyedCounter,X
    CMP.W #$0004
    BPL .noMore
    LDA.W #$0000
    JSL EnemyDeath
    JSR SpawnTopZebetite
    RTL


;;; $FCAA: Mark zebetite destroyed event ;;;
MarkZebetiteDestroyedEvent:
; Increment destroyed counter and painstakingly convert this to mark/unmark event routine calls,
; which are a long-winded way of writing `$7E:D820 = [$7E:D820] & ~(7 << 3) | Zebetite.destroyedCounter << 3`
    LDX.W EnemyIndex
    LDA.W Zebetite.destroyedCounter,X
    INC
    STA.W Zebetite.destroyedCounter,X
    STA.B DP_Temp12
    LDY.W #$0003
    ROR.B DP_Temp12
    JSR MarkUnmarkZebetiteDestroyedCounterEvent
    LDY.W #$0004
    ROR.B DP_Temp12
    JSR MarkUnmarkZebetiteDestroyedCounterEvent
    LDY.W #$0005
    ROR.B DP_Temp12                                                      ; fallthrough to MarkUnmarkZebetiteDestroyedCounterEvent


;;; $FCCB: Mark/unmark zebetite destroyed counter event ;;;
MarkUnmarkZebetiteDestroyedCounterEvent:
;; Parameters:
;;     Y: Event number. 3 + (destroyed counter bit index)
;;     Carry: Zebetite bit
    BCC .unmark
    TYA
    JSL MarkEvent_inA
    RTS

  .unmark:
    TYA
    JSL UnmarkEvent_inA
    RTS


;;; $FCD9: Spawn top zebetite ;;;
SpawnTopZebetite:
;; Returns:
;;     X: New enemy index
    LDX.W #.enemy
    JSL SpawnEnemy
    RTS

  .enemy:
;        _______________________________________ X position
;       |      _________________________________ Y position
;       |     |      ___________________________ Initialisation parameter
;       |     |     |      _____________________ Properties
;       |     |     |     |      _______________ Extra properties
;       |     |     |     |     |      _________ Parameter 1
;       |     |     |     |     |     |      ___ Parameter 2
;       |     |     |     |     |     |     |
    dw EnemyHeaders_Zebetite
    dw $0000,$0000,$0000,$2000,$0000,$0000,$0000


;;; $FCF1: Spawn bottom zebetite ;;;
SpawnBottomZebetite:
;; Returns:
;;     X: New enemy index
    LDX.W #.enemy
    JSL SpawnEnemy
    RTS

  .enemy:
;        _______________________________________ X position
;       |      _________________________________ Y position
;       |     |      ___________________________ Initialisation parameter
;       |     |     |      _____________________ Properties
;       |     |     |     |      _______________ Extra properties
;       |     |     |     |     |      _________ Parameter 1
;       |     |     |     |     |     |      ___ Parameter 2
;       |     |     |     |     |     |     |
    dw EnemyHeaders_Zebetite
    dw $0000,$0000,$0000,$2000,$0000,$0002,$0000


;;; $FD09: Set zebetite instruction list ;;;
SetZebetiteInstList:
    LDX.W EnemyIndex
    LDY.W #$0000
    LDA.W Enemy.health,X
    CMP.W #$0320
    BPL .indexInY
    LDY.W #$0002
    CMP.W #$0258
    BPL .indexInY
    LDY.W #$0004
    CMP.W #$0190
    BPL .indexInY
    LDY.W #$0006
    CMP.W #$00C8
    BPL .indexInY
    LDY.W #$0008

  .indexInY:
    LDA.W .bigZebetite,Y
    BIT.W Zebetite.multiPartFlag,X
    BPL .keepBig
    LDA.W .smallZebetite,Y

  .keepBig:
    STA.W Enemy.instList,X
    LDA.W #$0001
    STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    RTS

  .bigZebetite:
    dw InstList_Big_HealthGreaterThanEqualTo800                          ; HP >= 800
    dw InstList_Big_HealthLessThan800                                    ; HP < 800
    dw InstList_Big_HealthLessThan600                                    ; HP < 600
    dw InstList_Big_HealthLessThan400                                    ; HP < 400
    dw InstList_Big_HealthLessThan200                                    ; HP < 200

  .smallZebetite:
    dw InstList_Small_HealthGreaterThanEqualTo800                        ; HP >= 800
    dw InstList_Small_HealthLessThan800                                  ; HP < 800
    dw InstList_Small_HealthLessThan600                                  ; HP < 600
    dw InstList_Small_HealthLessThan400                                  ; HP < 400
    dw InstList_Small_HealthLessThan200                                  ; HP < 200


;;; $FD5E: Handle zebetites palette animation ;;;
HandleZebetitePaletteAnimation:
; Enemy.var2 is Mother Brain's RAM >_<;
; Presumably this was supposed to be `Enemy.var2,X`, MB doesn't use that RAM address (possibly because this routine was causing an inexplicable bug),
; so it's fine, but zebetites initialisation does use `Enemy.var2,X`, so one of two routines has to be wrong
    LDA.L PaletteChangeNumerator
    BNE .return
    LDX.W EnemyIndex
    LDA.W Enemy.init0,X
    BNE .return
    LDA.W Enemy.var2
    INC
    AND.W #$0007
    STA.W Enemy.var2
    ASL
    ASL
    ADC.W #.colors
    TAY
    LDX.W #$0158
    LDA.W #$0002
    JSL WriteAColorsFromYtoColorIndexX

  .return:
    RTS

  .colors:
    dw $005F,$0037
    dw $003F,$0019
    dw $003F,$001B
    dw $001F,$001D
    dw $001F,$001F
    dw $001F,$001D
    dw $003F,$001B
    dw $003F,$0019


;;; $FDA7: Enemy touch - enemy $E27F (zebetites) ;;;
EnemyTouch_Zebetite:
    JSL NormalEnemyTouchAI_NoDeathCheck_External
    RTL


;;; $FDAC: Enemy shot - enemy $E27F (zebetites) ;;;
EnemyShot_Zebetite:
; This code should probably check that the zebetite is a multipart one before doing this code with the other part
    PHA
    LDA.W #$0009
    JSL QueueSound_Lib3_Max6
    PLA
    JSL NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External
    LDX.W EnemyIndex
    LDY.W Zebetite.otherPartEnemyIndex,X
    LDA.W Enemy.health,X
    STA.W Enemy.health,Y
    LDA.W Enemy.flashTimer,X
    STA.W Enemy.flashTimer,Y
    RTL


;;; $FDCC: Instruction list - big zebetite - HP >= 800 ;;;
InstList_Big_HealthGreaterThanEqualTo800:
    dw $0001
    dw Spritemap_Zebetite_Big_HealthGreaterThanEqualTo800
    dw Instruction_Common_Sleep


;;; $FDD2: Instruction list - big zebetite - HP < 800 ;;;
InstList_Big_HealthLessThan800:
    dw $0001
    dw SpritemapZebetite_Big_HealthLessThan800
    dw Instruction_Common_Sleep


;;; $FDD8: Instruction list - big zebetite - HP < 600 ;;;
InstList_Big_HealthLessThan600:
    dw $0001
    dw SpritemapZebetite_Big_HealthLessThan600
    dw Instruction_Common_Sleep


;;; $FDDE: Instruction list - big zebetite - HP < 400 ;;;
InstList_Big_HealthLessThan400:
    dw $0001
    dw SpritemapZebetite_Big_HealthLessThan400
    dw Instruction_Common_Sleep


;;; $FDE4: Instruction list - big zebetite - HP < 200 ;;;
InstList_Big_HealthLessThan200:
    dw $0001
    dw SpritemapZebetite_Big_HealthLessThan200
    dw Instruction_Common_Sleep


;;; $FDEA: Instruction list - small zebetite pair - HP >= 800 ;;;
InstList_Small_HealthGreaterThanEqualTo800:
    dw $0001
    dw Spritemap_Zebetite_Small_HealthGreaterThanEqualTo800
    dw Instruction_Common_Sleep


;;; $FDF0: Instruction list - small zebetite pair - HP < 800 ;;;
InstList_Small_HealthLessThan800:
    dw $0001
    dw SpritemapZebetite_Small_HealthLessThan800
    dw Instruction_Common_Sleep


;;; $FDF6: Instruction list - small zebetite pair - HP < 600 ;;;
InstList_Small_HealthLessThan600:
    dw $0001
    dw SpritemapZebetite_Small_HealthLessThan600
    dw Instruction_Common_Sleep


;;; $FDFC: Instruction list - small zebetite pair - HP < 400 ;;;
InstList_Small_HealthLessThan400:
    dw $0001
    dw SpritemapZebetite_Small_HealthLessThan400
    dw Instruction_Common_Sleep


;;; $FE02: Instruction list - small zebetite pair - HP < 200 ;;;
InstList_Small_HealthLessThan200:
    dw $0001
    dw SpritemapZebetite_Small_HealthLessThan200
    dw Instruction_Common_Sleep


;;; $FE08: Spritemaps - zebetites ;;;
Spritemap_Zebetite_Big_HealthGreaterThanEqualTo800:
    dw $0003
    %spritemapEntry(1, $43F8, $08, 0, 0, 3, 0, $10C)
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $10C)
    %spritemapEntry(1, $43F8, $E8, 0, 0, 3, 0, $10C)

SpritemapZebetite_Big_HealthLessThan800:
    dw $0003
    %spritemapEntry(1, $43F8, $08, 0, 0, 3, 0, $10E)
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $10E)
    %spritemapEntry(1, $43F8, $E8, 0, 0, 3, 0, $10E)

SpritemapZebetite_Big_HealthLessThan600:
    dw $0006
    %spritemapEntry(0, $1FC, $10, 0, 0, 3, 0, $121)
    %spritemapEntry(0, $1FC, $08, 0, 0, 3, 0, $120)
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 0, $121)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 0, $120)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 3, 0, $121)
    %spritemapEntry(0, $1FC, $E8, 0, 0, 3, 0, $120)

SpritemapZebetite_Big_HealthLessThan400:
    dw $0006
    %spritemapEntry(0, $1FC, $10, 0, 0, 3, 0, $123)
    %spritemapEntry(0, $1FC, $08, 0, 0, 3, 0, $122)
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 0, $123)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 0, $122)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 3, 0, $123)
    %spritemapEntry(0, $1FC, $E8, 0, 0, 3, 0, $122)

SpritemapZebetite_Big_HealthLessThan200:
    dw $0006
    %spritemapEntry(0, $1FC, $10, 0, 0, 3, 0, $125)
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 0, $125)
    %spritemapEntry(0, $1FC, $08, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 3, 0, $125)
    %spritemapEntry(0, $1FC, $E8, 0, 0, 3, 0, $124)

Spritemap_Zebetite_Small_HealthGreaterThanEqualTo800:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $10C)

SpritemapZebetite_Small_HealthLessThan800:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $10E)

SpritemapZebetite_Small_HealthLessThan600:
    dw $0002
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 0, $121)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 0, $120)

SpritemapZebetite_Small_HealthLessThan400:
    dw $0002
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 0, $123)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 0, $122)

SpritemapZebetite_Small_HealthLessThan200:
    dw $0002
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 0, $125)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 0, $124)


Freespace_BankA6_FEBC:
; $144 bytes
