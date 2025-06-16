
org $A08000


; Loading the game:
;     $8A1E - load enemies - at $80:A0CA (start gameplay)
;     $8CD7 - initialise enemies and transfer tiles to VRAM - at $82:80C9/80F9/814C (game state 6/1Fh/28h), executed 6 times for 6 frames

; Main gameplay (game state 8):
;     $8EB6 - determine which enemies to process
;     $9785 - Samus / projectile interaction handler
;     $8FD4 - main enemy routine
;         $9758 - enemy collision handling
;         $C26A - process enemy instructions
;         $9423 - add enemy to drawing queue
;     $A8F0 - Samus / solid enemy collision detection, executed at least twice
;     $9894 - enemy projectile / Samus collision detection
;     $996C - enemy projectile / projectile collision detection
;     $A306 - process enemy power bomb interaction
;     $884D - draw Samus, projectiles, enemies and enemy projectiles
;         $944A - write enemy OAM
;         $88C4 - execute enemy graphics drawn hook
;     $9726 - handle queuing enemy BG2 tilemap VRAM transfer
;     $8687 - handle room shaking
;     $9169 - decrement Samus hurt timers and clear active enemy indices

; Door transition whilst screen is fading out (game state Ah/Bh):
;     $8EB6 - determine which enemies to process
;     $8FD4 - main enemy routine
;     $884D - draw Samus, enemies and enemy projectiles

; Door transition whilst screen is scrolling (game state Bh):
;     Enemy tiles are processed via enemy set data by $82:DFD1 during door transition function $E4A9
;     $8A1E - load enemies - at $82:E4A9
;         $896F - load enemy set data (just mirrors enemy set into RAM ($7E:D559), debug/pointless)
;         $8A6D - clear enemy data and process enemy set
;             $8D64 - process enemy set (from ROM directly) (loads enemy palettes and allocates space for tiles (EnemyTileData_Size, $7E:EF5C))
;         $8C6C - load enemy tile data (loads enemy tiles into $7E:7000 from enemy loading data (EnemyTileData_Size), this data is then DMA'd by $8CD7 (but not $8A9E))
;     $8A9E - initialise enemies - at $82:E4A9 (clear enemy tiles ($7E:7000), load enemy population data into enemy data)
;         $8BF3 - load enemy GFX indices (determines enemy VRAM tiles index and palette index ($0F98/96 / $7E:7006/08) from enemy set (again, from ROM directly))
;         $88D0 - record enemy spawn data (mirrors enemy population data to $7E:701E..39)
;         $8BE9 - execute enemy initialisation AI

; Door transition whilst screen is fading in (game state Bh):
;     $8EB6 - determine which enemies to process
;     $8FD4 - main enemy routine
;     $884D - draw Samus, enemies and enemy projectiles
;     $9726 - handle queuing enemy BG2 tilemap VRAM transfer


; Common to all enemy code banks

;;; $8000: Grapple AI - no interaction. Also unfreezes enemies(!) ;;;
Common_GrappleAI_NoInteraction:
; Used by skultera, Draygon body, fire arc, Phantoon, etecoon, dachora and WS ghost
    JSL GrappleAI_SwitchEnemyAIToMainAI
    RTL


;;; $8005: Grapple AI - Samus latches on ;;;
Common_GrappleAI_SamusLatchesOn:
; Used by gripper and Crocomire
    JSL GrappleAI_SamusLatchesOnWithGrapple
    RTL


;;; $800A: Grapple AI - kill enemy ;;;
Common_GrappleAI_KillEnemy:
; Common
    JSL GrappleAI_EnemyGrappleDeath
    RTL


;;; $800F: Grapple AI - cancel grapple beam ;;;
Common_GrappleAI_CancelGrappleBeam:
; Common
    JSL GrappleAI_SwitchToFrozenAI
    RTL


;;; $8014: Grapple AI - Samus latches on - no invincibility ;;;
Common_GrappleAI_SamusLatchesOn_NoInvincibility:
; Used by powamp
    JSL GrappleAI_SamusLatchesOnWithGrapple_NoInvincibility
    RTL


;;; $8019: Unused. Grapple AI - Samus latches on - paralyse enemy ;;;
UNUSED_Common_GrappleAI_SamusLatchesOn_ParalyzeEnemy_A08019:
    JSL GrappleAI_SamusLatchesOnWithGrapple_ParalyzeEnemy
    RTL


;;; $801E: Grapple AI - hurt Samus ;;;
Common_GrappleAI_HurtSamus:
; Used by WS spark
; Hurt reaction happens in $9B:B932
    JSL GrappleAI_SwitchToFrozenAI_duplicate
    RTL


;;; $8023: Normal enemy touch AI ;;;
Common_NormalEnemyTouchAI:
    JSL NormalEnemyTouchAI
    RTL


;;; $8028: Normal touch AI - no death check ;;;
Common_NormalTouchAI_NoDeathCheck:
    JSL NormalEnemyTouchAI_NoDeathCheck_External
    RTL


;;; $802D: Normal enemy shot AI ;;;
Common_NormalEnemyShotAI:
    JSL NormalEnemyShotAI
    RTL


;;; $8032: Normal enemy shot AI - no death check, no enemy shot graphic ;;;
Common_NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic:
    JSL NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External
    RTL


;;; $8037: Normal enemy power bomb AI ;;;
Common_NormalEnemyPowerBombAI:
    JSL NormalEnemyPowerBombAI
    RTL


;;; $803C: Normal enemy power bomb AI - no death check ;;;
Common_NormalEnemyPowerBombAI_NoDeathCheck:
; Kraid's power bomb AI
    JSL NormalEnemyPowerBombAI_NoDeathCheck_External
    RTL


;;; $8041: Normal enemy frozen AI ;;;
Common_NormalEnemyFrozenAI:
    JSL NormalEnemyFrozenAI
    RTL


;;; $8046: Creates a dud shot ;;;
Common_CreateADudShot:
    JSL CreateADudShot
    RTL


;;; $804B: RTS ;;;
RTS_A0804B:
    RTS


;;; $804C: RTL ;;;
RTL_A0804C:
    RTL


;;; $804D: Spritemap - nothing ;;;
Spritemap_Common_Nothing:
    dw $0000


;;; $804F: Extended spritemap - nothing ;;;
ExtendedSpritemap_Common_Nothing:
    dw $0001,$0000,$0000
    dw Spritemap_Common_Nothing
    dw Hitbox_Common_Nothing


;;; $8059: Hitbox - nothing ;;;
Hitbox_Common_Nothing:
; [n entries] [[left offset] [top offset] [right offset] [bottom offset] [p touch] [p shot]]...
    dw $0001,$0000,$0000,$0000,$0000
    dw Common_NormalEnemyTouchAI
    dw Common_NormalEnemyShotAI


;;; $8067: Instruction list - delete enemy ;;;
InstList_Common_DeleteEnemy:
    dw Instruction_Common_DeleteEnemy


;;; $8069: Two NOPs ;;;
NOPNOP_A08069:
; Used as palette by respawning enemy placeholder and Draygon's eye o_O
    NOP #2

Instruction_Common_Enemy0FB2_InY:
; Used only by torizos (for enemy movement function) and escape etecoon (for enemy function)
    LDA.W $0000,Y : STA.W Enemy.var5,X
    INY #2
    RTL


;;; $806B: Instruction - Enemy.var5 = [[Y]] ;;;
Instruction_Common_SetEnemy0FB2ToRTS:
; Used only by torizos (for enemy movement function) and escape etecoon (for enemy function)
    LDA.W #RTS_A0807B : STA.W Enemy.var5,X
    RTL


RTS_A0807B:
    RTS


;;; $807C: Instruction - delete enemy ;;;
Instruction_Common_DeleteEnemy:
    LDA.W Enemy.properties,X : ORA.W #$0200 : STA.W Enemy.properties,X
    PLA
    PEA ProcessEnemyInstructions_return-1
    RTL


;;; $808A: Instruction - call function [[Y]] ;;;
Instruction_Common_CallFunctionInY:
    LDA.W $0000,Y : STA.B DP_Temp12
    PHY : PHX
    PEA .manualReturn-1
    JMP.W (DP_Temp12)

  .manualReturn:
    PLX : PLY
    INY #2
    RTL


;;; $809C: Instruction - call function [[Y]] with A = [[Y] + 2] ;;;
Instruction_Common_CallFunctionInY_WithA:
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
UNUSED_Instruction_Common_CallExternalFunctionInY_A080B5:
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
UNUSED_Inst_Common_CallExternalFunctionInY_WithA_A080CE:
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
Instruction_Common_GotoY:
    LDA.W $0000,Y : TAY
    RTL


;;; $80F2: Instruction - go to [[Y]] + ±[[Y]] ;;;
Instruction_Common_GotoY_PlusY:
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
Instruction_Common_DecrementTimer_GotoYIfNonZero:
    DEC.W Enemy.loopCounter,X : BNE Instruction_Common_GotoY
    INY #2
    RTL


;;; $8110: Instruction - decrement timer and go to [[Y]] if non-zero ;;;
Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate:
    DEC.W Enemy.loopCounter,X : BNE Instruction_Common_GotoY
    INY #2
    RTL


;;; $8118: Instruction - decrement timer and go to [Y] + ±[[Y]] if non-zero ;;;
Instruction_Common_DecrementTimer_GotoY_PlusY_IfNonZero:
    SEP #$20
    DEC.W Enemy.loopCounter,X
    REP #$20
    BNE Instruction_Common_GotoY_PlusY
    INY
    RTL


;;; $8123: Instruction - timer = [[Y]] ;;;
Instruction_Common_TimerInY:
    LDA.W $0000,Y : STA.W Enemy.loopCounter,X
    INY #2
    RTL


;;; $812C: Instruction - skip next instruction ;;;
Instruction_Common_SkipNextInstruction:
    INY #2
    RTL


;;; $812F: Instruction - sleep ;;;
Instruction_Common_Sleep:
    DEY #2
    TYA : STA.W Enemy.instList,X
    PLA
    PEA ProcessEnemyInstructions_return-1
    RTL


;;; $813A: Instruction - wait [[Y]] frames ;;;
Instruction_Common_WaitYFrames:
; Set instruction timer and terminate processing enemy instructions
; Used for running a delay that doesn't update graphics,
; useful for e.g. GT eye beam attack ($AA:D10D), implemented by an instruction list that has no graphical instructions,
; which allows it to be called from multiple different poses
    LDA.W $0000,Y : STA.W Enemy.instTimer,X
    INY #2
    TYA : STA.W Enemy.instList,X
    PLA
    PEA ProcessEnemyInstructions_return-1
    RTL


;;; $814B: Instruction - transfer [[Y]] bytes from [[Y] + 2] to VRAM [[Y] + 5] ;;;
Instruction_Common_TransferYBytesInYToVRAM:
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
Instruction_Common_EnableOffScreenProcessing:
    LDA.W Enemy.properties,X : ORA.W #$0800 : STA.W Enemy.properties,X
    RTL


;;; $817D: Instruction - disable off-screen processing ;;;
Instruction_Common_DisableOffScreenProcessing:
    LDA.W Enemy.properties,X : AND.W #$F7FF : STA.W Enemy.properties,X
    RTL


;;; $8187: Common enemy speeds - linearly increasing ;;;
CommonEnemySpeeds_LinearlyIncreasing:
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
CommonEnemySpeeds_QuadraticallyIncreasing:
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


;;; $8687: Handle room shaking ;;;
Handle_Room_Shaking:
; Enemy projectile shaking is handled by $86:8427
    PHB
    PEA BGShakeDisplacements>>8&$FF00 : PLB : PLB
    REP #$30
    LDA.W EarthquakeTimer : BEQ .return
    LDA.W TimeIsFrozenFlag : BNE .return
    LDA.W EarthquakeType : CMP.W #$0024 : BPL .return
    ASL #3 : TAX
    LDA.W EarthquakeTimer : BIT.W #$0002 : BEQ .timerExpired
    LDA.W BGShakeDisplacements_BG1X,X : EOR.W #$FFFF : INC
    CLC : ADC.B DP_BG1XScroll : STA.B DP_BG1XScroll
    LDA.W BGShakeDisplacements_BG1Y,X : EOR.W #$FFFF : INC
    CLC : ADC.B DP_BG1YScroll : STA.B DP_BG1YScroll
    LDA.W BGShakeDisplacements_BG2X,X : EOR.W #$FFFF : INC
    CLC : ADC.B DP_BG2XScroll : STA.B DP_BG2XScroll
    LDA.W BGShakeDisplacements_BG2Y,X : EOR.W #$FFFF : INC
    CLC : ADC.B DP_BG2YScroll : STA.B DP_BG2YScroll
    BRA .decrementEarthquakeTimer

  .timerExpired:
    LDA.B DP_BG1XScroll : CLC : ADC.W BGShakeDisplacements_BG1X,X : STA.B DP_BG1XScroll
    LDA.B DP_BG1YScroll : CLC : ADC.W BGShakeDisplacements_BG1Y,X : STA.B DP_BG1YScroll
    LDA.B DP_BG2XScroll : CLC : ADC.W BGShakeDisplacements_BG2X,X : STA.B DP_BG2XScroll
    LDA.B DP_BG2YScroll : CLC : ADC.W BGShakeDisplacements_BG2Y,X : STA.B DP_BG2YScroll

  .decrementEarthquakeTimer:
    DEC.W EarthquakeTimer
    LDA.W EarthquakeType : CMP.W #$0012 : BMI .return
    JSR SetAllActiveEnemiesToShakeHorizontallyFor2Frames

  .return:
    INC.W NumberOfTimesRoomShakingExecuted
    PLB
    RTL


;;; $8712: Set all active enemies to shake horizontally for two frames ;;;
SetAllActiveEnemiesToShakeHorizontallyFor2Frames:
    PHY : PHX
    LDY.W #$0000

  .loop:
    LDA.W ActiveEnemyIndices,Y : CMP.W #$FFFF : BEQ .return
    TAX
    LDA.W #$0002 : STA.W Enemy.shakeTimer,X
    INY #2
    BRA .loop

  .return:
    PLX : PLY
    RTS


;;; $872D: BG shake displacements ;;;
BGShakeDisplacements:
; Enemy projectile shaking displacements are at $86:846B
;      /------horizontal------\ /------vertical------\   /------diagonal------\
;       BG1X  BG1Y  BG2X  BG2Y
  .BG1X:
    dw $0001
  .BG1Y:
    dw       $0000
  .BG2X:
    dw             $0000
  .BG2Y:
    dw                   $0000, $0000,$0001,$0000,$0000, $0001,$0001,$0000,$0000 ;\
    dw $0002,$0000,$0000,$0000, $0000,$0002,$0000,$0000, $0002,$0002,$0000,$0000 ;} BG1 only
    dw $0003,$0000,$0000,$0000, $0000,$0003,$0000,$0000, $0003,$0003,$0000,$0000 ;/
    dw $0001,$0000,$0001,$0000, $0000,$0001,$0000,$0001, $0001,$0001,$0001,$0001 ;\
    dw $0002,$0000,$0002,$0000, $0000,$0002,$0000,$0002, $0002,$0002,$0002,$0002 ;} BG1 and BG2
    dw $0003,$0000,$0003,$0000, $0000,$0003,$0000,$0003, $0003,$0003,$0003,$0003 ;/
    dw $0001,$0000,$0001,$0000, $0000,$0001,$0000,$0001, $0001,$0001,$0001,$0001 ;\
    dw $0002,$0000,$0002,$0000, $0000,$0002,$0000,$0002, $0002,$0002,$0002,$0002 ;} BG1 and BG2 and enemies
    dw $0003,$0000,$0003,$0000, $0000,$0003,$0000,$0003, $0003,$0003,$0003,$0003 ;/
    dw $0000,$0000,$0001,$0000, $0000,$0000,$0000,$0001, $0000,$0000,$0001,$0001 ;\
    dw $0000,$0000,$0002,$0000, $0000,$0000,$0000,$0002, $0000,$0000,$0002,$0002 ;} BG2 only and enemies
    dw $0000,$0000,$0003,$0000, $0000,$0000,$0000,$0003, $0000,$0000,$0003,$0003 ;/


;;; $884D: Draw Samus, projectiles, enemies and enemy projectiles ;;;
Draw_Samus_Projectiles_Enemies_and_Enemy_Projectiles:
    PHB
    PEA AddressesForEnemyDrawingQueues>>8&$FF00 : PLB : PLB
    REP #$30
    JSL DrawSpriteObjects
    JSL DrawBombsAndProjectileExplosions
    JSL Draw_HighPriority_EnemyProjectile
    STZ.W Temp_Layer

  .loopMain:
    LDA.W Temp_Layer : CMP.W #$0008 : BEQ .finish
    CMP.W #$0003 : BNE .layerNot3
    JSL DrawSamusAndProjectiles
    BRA .layerNot6

  .layerNot3:
    CMP.W #$0006 : BNE .layerNot6
    JSL Draw_LowPriority_EnemyProjectile

  .layerNot6:
    LDA.W Temp_Layer : ASL : TAY
    LDA.W EnemyDrawingQueues_Sizes,Y : BEQ .next
    STA.W Temp_DrawingQueueSizeBackup
    LDA.W AddressesForEnemyDrawingQueues,Y : STA.W Temp_DrawingQueueAddr
    LDA.W #$0000 : STA.W EnemyDrawingQueues_Sizes,Y

  .loopOAM:
    STA.W Temp_DrawingQueueIndex0E38
    CLC : ADC.W Temp_DrawingQueueAddr : TAX
    LDA.W $0000,X
    STZ.W $0000,X
    STA.W EnemyIndex
    JSR WriteEnemyOAM_IfNotFrozenOrInvincibleFrame
    LDA.W Temp_DrawingQueueIndex0E38 : INC #2 : CMP.W Temp_DrawingQueueSizeBackup : BNE .loopOAM

  .next:
    INC.W Temp_Layer
    BRA .loopMain

  .finish:
    PHB
    JSL .executeHook
    PLB
    BRA .return

  .executeHook:
    LDA.W EnemyGraphicsDrawnHook+2 : XBA : PHA : PLB : PLB
    JML.W [EnemyGraphicsDrawnHook]

  .return:
    PLB
    RTL


;;; $88D0: Record enemy spawn data ;;;
Record_EnemySpawnData:
;; Parameters:
;;     Y: Enemy index

; Used almost exclusively by debug enemy spawner. Rinka uses X/Y position
    PHX : PHY
    TYX
    LDA.W Enemy.ID,X : STA.L EnemyTileData+$1E,X
    LDA.W Enemy.XPosition,X : STA.L EnemyTileData+$20,X
    LDA.W Enemy.YPosition,X : STA.L EnemyTileData+$22,X
    LDA.W Enemy.instList,X : STA.L EnemyTileData+$24,X
    LDA.W Enemy.properties,X : STA.L EnemyTileData+$26,X
    LDA.W Enemy.properties2,X : STA.L EnemyTileData+$28,X
    LDA.W Enemy.init0,X : STA.L EnemyTileData+$2A,X
    LDA.W Enemy.init1,X : STA.L EnemyTileData+$2C,X
    STZ.B DP_Temp12 : STZ.B DP_Temp14 : STZ.B DP_Temp16
    STZ.B DP_Temp18 : STZ.B DP_Temp1A : STZ.B DP_Temp1C
    PHX
    LDA.W Enemy.ID,X : TAX
    LDA.L EnemyHeaders_name,X : BEQ .doneName
    TAX
    LDA.L EnemyNames_name,X : STA.B DP_Temp12
    LDA.L EnemyNames_name+2,X : STA.B DP_Temp14
    LDA.L EnemyNames_name+4,X : STA.B DP_Temp16
    LDA.L EnemyNames_name+6,X : STA.B DP_Temp18
    LDA.L EnemyNames_name+8,X : STA.B DP_Temp1A
    LDA.L EnemyNames_spritemap,X : STA.B DP_Temp1C

  .doneName:
    PLX
    LDA.B DP_Temp12 : STA.L EnemyTileData+$2E,X
    LDA.B DP_Temp14 : STA.L EnemyTileData+$30,X
    LDA.B DP_Temp16 : STA.L EnemyTileData+$32,X
    LDA.B DP_Temp18 : STA.L EnemyTileData+$34,X
    LDA.B DP_Temp1A : STA.L EnemyTileData+$36,X
    LDA.B DP_Temp1C : STA.L EnemyTileData+$38,X
    PLY : PLX
    RTL


;;; $896F: Debug. Load enemy set data ;;;
Debug_LoadEnemySetData:
; This enemy set data is never used, not even by the enemy debugger. This routine serves no purpose
    LDA.W #$0000
    LDX.W #$0000
    LDY.W #$00A0

  .loopUpper:
    STA.L EnemySetName,X
    INX #2
    DEY #2 : BNE .loopUpper
    LDA.W EnemySetPointer : SEC : SBC.W #$0007 : TAX
    LDA.L EnemySetNames,X : STA.L EnemySetName
    LDA.L EnemySetNames+2,X : STA.L EnemySetName+2
    LDA.L EnemySetNames+4,X : STA.L EnemySetName+4
    LDA.L EnemySetNames+6,X : STA.L EnemySetName+6
    LDY.W #$0007
    LDA.W EnemySetPointer : TAX

  .loop:
    LDA.L EnemySets_ID,X : CMP.W #$FFFF : BEQ .return
    PHX
    TAX
    LDA.L EnemyHeaders_name,X : BNE .hasName
    LDA.W #EnemyName_NoData

  .hasName:
    TAX
    LDA.L EnemyNames_name,X : STA.B DP_Temp12
    LDA.L EnemyNames_name+2,X : STA.B DP_Temp14
    LDA.L EnemyNames_name+4,X : STA.B DP_Temp16
    LDA.L EnemyNames_name+6,X : STA.B DP_Temp18
    LDA.L EnemyNames_name+8,X : STA.B DP_Temp1A
    TYX
    LDA.B DP_Temp12 : STA.L EnemySetName,X
    LDA.B DP_Temp14 : STA.L EnemySetName+2,X
    LDA.B DP_Temp16 : STA.L EnemySetName+4,X
    LDA.B DP_Temp18 : STA.L EnemySetName+6,X
    LDA.B DP_Temp1A : STA.L EnemySetName+8,X
    PLX : PHX
    LDA.L EnemySets_palette,X
    TYX
    STA.L EnemySetName+$A,X
    PLX
    TYA : CLC : ADC.W #$000C : TAY
    TXA : CLC : ADC.W #$0004 : TAX
    BRA .loop

  .return:
    RTL


;;; $8A1E: Load enemies (load and process enemy set, clear enemy data, load enemy tile data) ;;;
Load_Enemies:
; Called when loading the game, and during door transition
; This routine loads enemy tile data, which during door transition has already loaded by $82:DFD1, making the call to $8C6C a fairly hefty waste of time
; Aside from loading tile data, this routine also loads palette data, and the enemy GFX data needed for respawn
    PHP : PHB
    PEA Load_Enemies>>8&$FF00 : PLB : PLB ; this seems pointless
    REP #$30
    JSL Debug_LoadEnemySetData
    STZ.W DebugTimeIsFrozenForEnemies : STZ.W BossID
    LDA.W #RTL_A0804C>>16 : STA.W EnemyGraphicsDrawnHook+2
    LDA.W #RTL_A0804C : STA.W EnemyGraphicsDrawnHook
    LDA.W #RTL_A0804C>>16 : STA.W unused1790+2
    LDA.W #RTL_A0804C : STA.W unused1790
    LDA.W #$0800 : STA.W EnemyBG2TilemapSize
    STZ.W unused179E : STZ.W unused17A0
    STZ.W BossID ; >.<
    JSL ClearEnemyData_ProcessEnemySet
    JSL LoadEnemyTileData
    STZ.W EnemyTileData_SrcAddr : STZ.W DisableSamusVsProjectileInteraction
    JSL ClearSpriteObjects
    PLB : PLP
    RTL


;;; $8A6D: Clear enemy data and process enemy set ;;;
ClearEnemyData_ProcessEnemySet:
    PHP : PHB
    PEA ClearEnemyData_ProcessEnemySet>>8&$FF00 : PLB : PLB
    REP #$30
    LDA.W #$0000
    LDY.W #$0800
    LDX.W #$0000

  .loop:
    STA.L Enemy.ID,X
    INX
    DEY
    INX
    DEY : BNE .loop
    LDX.W EnemyPopulationPointer
    LDA.L EnemyPopulations_ID,X : CMP.W #$FFFF : BNE .processEnemySet
    JMP .return

  .processEnemySet:
    JSR ProcessEnemySet_LoadPalettesAndEnemyLoadingData

  .return:
    PLB : PLP
    RTL


;;; $8A9E: Initialise enemies ;;;
Initialise_Enemies:
    PHP
    PHB
    LDY.W #$1400
    LDX.W #$0000
    LDA.W #$0000

  .loopExtraEnemyRAM:
    STA.L EnemyTileData,X
    INX #2
    DEY : BNE .loopExtraEnemyRAM
    PEA EnemyHeaders>>8&$FF00 : PLB : PLB
    REP #$30
    STZ.W neverRead0E4E
    STZ.W NumberOfEnemiesKilled : STZ.W GlobalOffScreenEnemyProcessingFlag
    LDX.W #$011E
    LDA.W #$0000

  .loopExtraEnemyProjectileRAM:
    STA.L EnemyProjectileData_CollisionOptions,X
    DEX #2 : BPL .loopExtraEnemyProjectileRAM
    LDX.W #$0022
    LDA.W #$FFFF

  .loopEnemyProjectileKilledEnemyIndices:
    STA.L EnemyProjectileData_KilledEnemyIndex,X
    DEX #2 : BPL .loopEnemyProjectileKilledEnemyIndices
    LDX.W EnemyPopulationPointer
    LDA.L EnemyPopulations_ID,X : CMP.W #$FFFF : BNE +
    JMP .return

+   STZ.W neverRead0E48
    LDY.W #$0000

  .loop:
    JSR LoadEnemyGFXIndices
    PHX
    LDA.L EnemyPopulations_ID,X : TAX
    LDA.W $0008,X : STA.W Enemy.XHitboxRadius,Y
    LDA.W $000A,X : STA.W Enemy.YHitboxRadius,Y
    LDA.W $0004,X : STA.W Enemy.health,Y
    LDA.W $0039,X : AND.W #$00FF : STA.W Enemy.layer,Y
    LDA.W $000C,X : STA.W Enemy.bank,Y
    LDA.W $0010,X : BEQ +
    STA.W BossID

+   PLX
    LDA.L EnemyPopulations_ID,X : STA.W Enemy.ID,Y
    LDA.L EnemyPopulations_XPosition,X : STA.W Enemy.XPosition,Y
    LDA.L EnemyPopulations_YPosition,X : STA.W Enemy.YPosition,Y
    LDA.L EnemyPopulations_init,X : STA.W Enemy.instList,Y
    LDA.L EnemyPopulations_properties,X : STA.W Enemy.properties,Y
    LDA.L EnemyPopulations_extraProperties,X : STA.W Enemy.properties2,Y
    LDA.L EnemyPopulations_param1,X : STA.W Enemy.init0,Y
    LDA.L EnemyPopulations_param2,X : STA.W Enemy.init1,Y
    LDA.W #$0000 : STA.W Enemy.frameCounter,Y : STA.W Enemy.loopCounter,Y
    LDA.W #$0001 : STA.W Enemy.instTimer,Y
    LDA.W #$0000 : STA.W Enemy.frameCounter,Y
    JSL Record_EnemySpawnData
    PHX : PHY
    STY.W EnemyIndex
    LDX.W Enemy.ID,Y
    LDA.W $0012,X : STA.W EnemyAIPointer
    LDA.W $000C,X : STA.W EnemyAIPointer+2
    PHB
    JSL .executeInitAI
    PLB
    PLY : PLX
    LDA.W #$0000 : STA.W Enemy.spritemap,Y
    LDA.W Enemy.properties,Y : BIT.W #$2000 : BEQ .noInstructions
    PHX : PHY
    LDX.W #Spritemap_Common_Nothing
    LDA.W Enemy.properties2,Y : BIT.W #$0004 : BEQ +
    LDX.W #ExtendedSpritemap_Common_Nothing

+   TXA : STA.W Enemy.spritemap,Y
    PLY : PLX

  .noInstructions:
    TYA : CLC : ADC.W #$0040 : TAY
    TXA : CLC : ADC.W #$0010 : TAX
    LDA.L EnemyPopulations_ID,X : CMP.W #$FFFF : BEQ +
    JMP .loop

+   STY.W FirstFreeEnemyIndex
    TYA : LSR #6 : STA.W neverRead0E4E
    LDA.L EnemyPopulations_XPosition,X : AND.W #$00FF : STA.W NumberOfEnemiesRequiredToKill

  .return:
    PLB : PLP
    RTL

  .executeInitAI:
; Execute enemy initialisation AI
    LDA.W Enemy.bank,Y : XBA : PHA : PLB : PLB
    JML.W [EnemyAIPointer]


;;; $8BF3: Load enemy GFX indices ;;;
LoadEnemyGFXIndices:
;; Parameters:
;;     X: Enemy population index
;;     Y: Enemy data index
    PHX : PHY
    STX.B DP_Temp12
    STY.B DP_Temp14
    LDA.W EnemySetPointer : STA.B DP_Temp1C
    STZ.B DP_Temp1E

  .loop:
    LDX.B DP_Temp12
    LDA.L EnemyPopulations_ID,X
    LDX.B DP_Temp1C
    CMP.L EnemySets_ID,X : BEQ .found
    LDA.L EnemySets_ID,X : CMP.W #$FFFF : BEQ .notFound
    LDA.L EnemySets_ID,X : TAX ; >.<
    LDA.W $0000,X : LSR #5 : CLC : ADC.B DP_Temp1E : STA.B DP_Temp1E
    LDA.B DP_Temp1C : CLC : ADC.W #$0004 : STA.B DP_Temp1C
    BRA .loop

  .notFound:
    LDX.B DP_Temp14
    STZ.W Enemy.GFXOffset,X
    LDA.W #$0000 : STA.L EnemySpawnData.VRAMTilesIndex,X
    LDA.W #$0A00 : STA.W Enemy.palette,X : STA.L EnemySpawnData.paletteIndex,X
    PLY : PLX
    RTS

  .found:
    LDX.B DP_Temp1C
    LDA.L EnemySets_palette,X : AND.W #$000F : XBA : ASL
    LDX.B DP_Temp14
    STA.W Enemy.palette,X : STA.L EnemySpawnData.paletteIndex,X
    LDA.B DP_Temp1E : STA.W Enemy.GFXOffset,X : STA.L EnemySpawnData.VRAMTilesIndex,X
    PLY : PLX
    RTS


;;; $8C6C: Load enemy tile data ;;;
LoadEnemyTileData:
; Loads enemy tile data to $7E:7000+, this is then transferred to VRAM when loading the game, but ignored and cleared during door transition >_>
; Note how this routine can't load enemy graphics from hirom banks due to setting the DB to the tile data bank (which kills short address accesses to WRAM)
    REP #$30
    LDX.W #$01FE

  .loopSprites:
    LDA.L Tiles_Standard_Sprite_1,X : STA.L EnemyTileData,X
    DEX #2 : BPL .loopSprites
    LDA.W EnemyTileData_StackPointer : BEQ .return
    LDX.W #$0000
    PHB

  .loopEnemies:
    LDA.W EnemyTileData_Pointer,X : TAY
    CLC : ADC.W EnemyTileData_Size,X : STA.B DP_Temp12
    LDA.W EnemyTileData_Pointer+1,X : PHA : PLB : PLB
    TXA : CLC : ADC.W #$0007 : PHA
    LDA.W EnemyTileData_Offset,X : TAX

  .loopTiles:
    LDA.W $0000,Y : STA.L EnemyTileData,X
    LDA.W $0002,Y : STA.L EnemyTileData+2,X
    LDA.W $0004,Y : STA.L EnemyTileData+4,X
    LDA.W $0006,Y : STA.L EnemyTileData+6,X
    TXA : CLC : ADC.W #$0008 : TAX
    TYA : CLC : ADC.W #$0008 : TAY
    CPY.B DP_Temp12 : BNE .loopTiles
    PLX : CPX.W EnemyTileData_StackPointer : BNE .loopEnemies
    STZ.W EnemyTileData_StackPointer
    PLB

  .return:
    RTL


;;; $8CD7: Transfer enemy tiles to VRAM and initialise enemies ;;;
TransferEnemyTilesToVRAM_InitialiseEnemies:
; To be executed 6 times
    REP #$30
    LDA.W EnemyTileData_SrcAddr : BNE .nonZeroSrcAddr
    LDA.W #EnemyTileData : STA.W EnemyTileData_SrcAddr
    LDX.W #$6C00 : STX.W EnemyTileData_DestAddr

  .nonZeroSrcAddr:
    CMP.W #$FFFF : BNE .notFFFF
    RTL

  .notFFFF:
    CMP.W #$FFFE : BNE .notFFFE
    JSL Initialise_Enemies
    LDA.W #$FFFF : STA.W EnemyTileData_SrcAddr
    RTL

  .notFFFE:
    CMP.W #$9800 : BEQ .finish
    LDX.W VRAMWriteStack
    LDA.W #$0800 : STA.B VRAMWrite.size,X
    LDA.W EnemyTileData_SrcAddr : STA.B VRAMWrite.src,X
    CLC : ADC.W #$0800 : STA.W EnemyTileData_SrcAddr
    LDA.W #EnemyTileData>>16 : STA.B VRAMWrite.src+2,X
    LDA.W EnemyTileData_DestAddr : STA.B VRAMWrite.dest,X
    CLC : ADC.W #$0400 : STA.W EnemyTileData_DestAddr
    TXA : CLC : ADC.W #$0007 : STA.W VRAMWriteStack
    RTL

  .finish:
    LDA.W #$FFFE
    STA.W EnemyTileData_SrcAddr
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $8D3A: Unused. Load enemy width, height, health, layer and bank ;;;
UNUSED_LoadEnemyWidthHeightHealthLayerBank_A08D3A:
    PHX : PHY
    LDA.W $0000,X : TAX
    LDA.W $0008,X : STA.W Enemy.XHitboxRadius,Y
    LDA.W $000A,X : STA.W Enemy.YHitboxRadius,Y
    LDA.W $0004,X : STA.W Enemy.health,Y
    LDA.W $0039,X : AND.W #$00FF : STA.W Enemy.layer,Y
    LDA.W $000C,X : STA.W Enemy.bank,Y
    PLY : PLX
    RTL
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8D64: Process enemy set (load palettes and enemy loading data) ;;;
ProcessEnemySet_LoadPalettesAndEnemyLoadingData:
    PHX : PHY
    STZ.W EnemyTileData_StackPointer
    LDA.W #$0800 : STA.B DP_Temp1E
    LDA.W #$0000
    STA.L EnemyGFXData_IDs : STA.L EnemyGFXData_IDs+2
    STA.L EnemyGFXData_IDs+4 : STA.L EnemyGFXData_IDs+6
    STA.L EnemyGFXData_TilesIndex : STA.L EnemyGFXData_TilesIndex+2
    STA.L EnemyGFXData_TilesIndex+4 : STA.L EnemyGFXData_TilesIndex+6
    STA.L EnemyGFXData_PaletteIndices : STA.L EnemyGFXData_PaletteIndices+2
    STA.L EnemyGFXData_PaletteIndices+4 : STA.L EnemyGFXData_PaletteIndices+6
    STA.L EnemyGFXData_StackPointer : STA.L EnemyGFXData_NextTilesIndex
    LDA.W EnemySetPointer : STA.B DP_Temp1C

  .loop:
    TAX
    LDA.L EnemySets_ID,X : CMP.W #$FFFF : BNE .notFFFF
    JMP .return

  .notFFFF:
    TAX
    LDA.W $0000,X : STA.B DP_Temp12
    LDA.W $0002,X : STA.B DP_Temp14
    LDA.W $000C,X : STA.W Temp_Bank
    LDX.B DP_Temp1C
    LDA.L EnemySets_palette,X : AND.W #$00FF : CLC : ADC.W #$0008
    JSL MultiplyBy20_A0B002
    CLC : ADC.W #TargetPalettes_BGP0 : STA.B DP_Temp16
    PHB
    LDA.W Temp_Bank : XBA : PHA : PLB : PLB
    LDA.W #$0010 : STA.W Temp_EnemySetLoopCounter
    LDX.B DP_Temp16
    LDY.B DP_Temp14

  .loopTargetEnemyPalette:
    LDA.W $0000,Y : STA.L Palettes&$FF0000,X
    INX #2
    INY #2
    DEC.W Temp_EnemySetLoopCounter : BNE .loopTargetEnemyPalette
    PLB
    LDX.B DP_Temp1C
    LDA.L EnemySets_ID,X : TAX
    LDA.W $0036,X : STA.B DP_Temp16
    LDA.W $0038,X : AND.W #$00FF : STA.B DP_Temp1A
    LDX.W EnemyTileData_StackPointer
    LDA.B DP_Temp12 : AND.W #$7FFF : STA.W EnemyTileData_Size,X
    LDA.B DP_Temp16 : STA.W EnemyTileData_Pointer,X
    LDA.B DP_Temp1E : BIT.B DP_Temp12 : BPL .noMSB
    PHX
    LDX.B DP_Temp1C
    LDA.L EnemySets_palette,X : AND.W #$3000 : LSR #3
    PLX

  .noMSB:
    STA.W EnemyTileData_Offset,X
    SEP #$20
    LDA.B DP_Temp1A : STA.W EnemyTileData_Pointer+2,X
    REP #$20
    LDA.W EnemyTileData_StackPointer : CLC : ADC.W #$0007 : STA.W EnemyTileData_StackPointer
    PHX : PHY
    LDA.L EnemyGFXData_StackPointer : TAX
    LDA.L EnemyGFXData_NextTilesIndex : STA.L EnemyGFXData_TilesIndex,X
    PHX
    LDX.B DP_Temp1C
    LDA.L EnemySets_ID,X
    PLX
    STA.L EnemyGFXData_IDs,X
    PHX
    LDX.B DP_Temp1C
    LDA.L EnemySets_palette,X
    PLX
    STA.L EnemyGFXData_PaletteIndices,X
    LDA.L EnemyGFXData_StackPointer : CLC : ADC.W #$0002 : STA.L EnemyGFXData_StackPointer
    PLY : PLX
    LDA.B DP_Temp12 : LSR #5 : CLC : ADC.L EnemyGFXData_NextTilesIndex : STA.L EnemyGFXData_NextTilesIndex
    LDX.B DP_Temp1C
    LDA.L EnemySets_ID,X : TAX
    LDA.W $0000,X : CLC : ADC.B DP_Temp1E : STA.B DP_Temp1E
    LDA.B DP_Temp1C : CLC : ADC.W #$0004 : STA.B DP_Temp1C
    JMP .loop

  .return:
    PLY : PLX
    RTS


;;; $8EB6: Determine which enemies to process ;;;
Determine_Which_Enemies_to_Process:
    PHB
    PEA Determine_Which_Enemies_to_Process>>8&$FF00 : PLB : PLB
    REP #$30
    INC.W neverRead0E46
    STZ.W EnemyIndex
    STZ.W ActiveEnemyIndicesStackPointer : STZ.W InteractiveEnemyIndicesStackPointer
    LDA.W GlobalOffScreenEnemyProcessingFlag : BEQ .resetIndex
    JMP .loopProcessOffscreen

  .resetIndex:
    LDX.W #$0000 ; >_<
    LDY.W #$0000

  .loop:
    LDX.W EnemyIndex
    LDA.W Enemy.ID,X : BEQ .next
    CMP.W #EnemyHeaders_Respawn : BEQ .next
    LDA.W Enemy.properties,X : BIT.W #$0200 : BEQ ..notDeleted
    STZ.W Enemy.ID,X
    JMP .next

  ..notDeleted:
    BIT.W #$0800 : BNE .activeEnemies
    LDA.W Enemy.AI,X : BIT.W #$0004 : BNE .activeEnemies
    LDA.W Enemy.XPosition,X : CLC : ADC.W Enemy.XHitboxRadius,X : CMP.W Layer1XPosition : BMI .next
    LDA.W Layer1XPosition : CLC : ADC.W #$0100
    CLC : ADC.W Enemy.XHitboxRadius,X : CMP.W Enemy.XPosition,X : BMI .next
    LDA.W Enemy.YPosition,X : CLC : ADC.W #$0008 : CMP.W Layer1YPosition : BMI .next
    LDA.W Layer1YPosition : CLC : ADC.W #$00F8 : CMP.W Enemy.YPosition,X : BMI .next

  .activeEnemies:
    TXA
    LDY.W ActiveEnemyIndicesStackPointer
    STA.W ActiveEnemyIndices,Y
    INY #2 : STY.W ActiveEnemyIndicesStackPointer
    LDA.W Enemy.properties,X : BIT.W #$0400 : BNE .next
    TXA
    LDY.W InteractiveEnemyIndicesStackPointer
    STA.W InteractiveEnemyIndices,Y
    INY #2 : STY.W InteractiveEnemyIndicesStackPointer

  .next:
    LDA.W EnemyIndex : CLC : ADC.W #$0040 : STA.W EnemyIndex
    CMP.W #$0800 : BPL .done
    JMP .loop

  .done:
    LDA.W #$FFFF
    LDY.W ActiveEnemyIndicesStackPointer
    STA.W ActiveEnemyIndices,Y
    LDY.W InteractiveEnemyIndicesStackPointer
    STA.W InteractiveEnemyIndices,Y
    PLB
    RTL

  .loopProcessOffscreen:
    LDX.W EnemyIndex
    LDA.W Enemy.ID,X : BEQ .nextProcessOffscreen
    CMP.W #EnemyHeaders_Respawn : BEQ .nextProcessOffscreen
    LDA.W Enemy.properties,X : BIT.W #$0200 : BEQ ..notDeleted
    STZ.W Enemy.ID,X
    BRA .nextProcessOffscreen

  ..notDeleted:
    TXA
    LDY.W ActiveEnemyIndicesStackPointer
    STA.W ActiveEnemyIndices,Y : STA.W InteractiveEnemyIndices,Y
    INY #2 : STY.W ActiveEnemyIndicesStackPointer
    LDA.W Enemy.properties,X : BIT.W #$0400 : BNE .nextProcessOffscreen
    TXA
    LDY.W InteractiveEnemyIndicesStackPointer
    STA.W InteractiveEnemyIndices,Y
    INY #2 : STY.W InteractiveEnemyIndicesStackPointer

  .nextProcessOffscreen:
    LDA.W EnemyIndex : CLC : ADC.W #$0040 : STA.W EnemyIndex
    CMP.W #$0800 : BMI .loopProcessOffscreen
    LDA.W #$FFFF
    LDY.W ActiveEnemyIndicesStackPointer
    STA.W ActiveEnemyIndices,Y
    LDY.W InteractiveEnemyIndicesStackPointer
    STA.W InteractiveEnemyIndices,Y
    PLB
    RTL


;;; $8FD4: Main enemy routine ;;;
Main_Enemy_Routine:
; If [first unused enemy index] != 0:
; {
;     If [enemy index to shake] != FFFFh:
;         Enemy [enemy index to shake] shake timer = 40h
;         Enemy index to shake = FFFFh
;
;     Interactive enemy indices index = 0 (used for some collision routines)
;
;     Active enemy indices index = 0
;     While [active enemy index] != FFFFh:
;     {
;         Enemy index = [active enemy index]
;         Enemy data pointer = Enemy.ID + [enemy index]
;         Enemy AI bank = [enemy bank]
;
;         If enemy is tangible:
;         {
;             If [enemy invincibility timer] != 0:
;                 Decrement enemy invincibility timer
;             Else if sprite interactions enabled:
;             {
;                 If time is not frozen and enemy time is not frozen:
;                     Enemy collision handling
;                     If [enemy ID] = 0: (enemy was killed?)
;                         Go to BRANCH_DRAW_ENEMY_END
;
;                 If enemy is paralysed:
;                     Go to BRANCH_PROCESS_AI_END
;             }
;         }
;
;         Enable enemy drawing
;         If time is frozen or enemy time is frozen:
;         {
;             If [enemy time is frozen AI pointer] != 0:
;                 Enemy AI pointer = [enemy time is frozen AI pointer]
;                 Execute enemy AI pointer in enemy bank
;         }
;         Else:
;         {
;             X = 0
;             If [enemy AI handler] != 0:
;                 X = bit index of lowest set bit of enemy AI handler
;
;             Enemy AI pointer = [[enemy ID] + 18h + [X] * 2]
;             Execute enemy AI pointer in enemy bank
;             Increment enemy frame counter
;             If enemy processes instructions:
;                 Enemy processing stage = 2
;                 Process enemy instructions
;         }
;
;         BRANCH_PROCESS_AI_END:
;         If enemy is paralysed:
;             If [enemy flash timer] = 1 or [enemy frozen timer] = 1:
;                 Enemy death
;
;         If (enemy is on-screen or enemy uses extended spritemap format) and enemy is not deleted and enemy is not invisible and enemy drawing is enabled:
;             Add enemy to drawing queue
;
;         BRANCH_DRAW_ENEMY_END:
;         If [enemy flash timer] != 0 and time is not frozen and enemy time is not frozen:
;             Decrement enemy flash timer
;             If [enemy flash timer] < 8:
;                 Unset enemy hurt AI
;
;         Active enemy indices index += 2
;     }
;
;     Handle sprite objects
;     Increment number of times main enemy routine has been executed
;     Enemy indices when Samus collides with solid enemy = FFFFh
;     Distances between Samus and enemy when Samus collides with solid enemy = 0
; }
    PHB
    PEA EnemyHeaders>>8&$FF00 : PLB : PLB
    REP #$30
    LDA.W FirstFreeEnemyIndex : BNE .processEnemies
    JMP .return

  .processEnemies:
    LDA.W EnemyIndexToShake : CMP.W #$FFFF : BEQ .resetEnemyIndices
    TAX
    LDA.W #$0040 : STA.W Enemy.shakeTimer,X
    LDA.W #$FFFF : STA.W EnemyIndexToShake

  .resetEnemyIndices:
    STZ.W InteractiveEnemyIndicesIndex : STZ.W ActiveEnemyIndicesIndex

  .loop:
    LDY.W ActiveEnemyIndicesIndex
    LDA.W ActiveEnemyIndices,Y : CMP.W #$FFFF : BNE ..notFFFF
    JMP .return

  ..notFFFF:
    STA.W EnemyIndex
    TAX
    CLC : ADC.W #Enemy.ID : STA.W EnemyDataPointer
    LDA.W Enemy.bank,X : STA.W EnemyAIPointer+2
    LDA.W Enemy.properties,X : BIT.W #$0400 : BNE .interactEnd
    LDA.W Enemy.invincibilityTimer,X : BEQ .notInvincible
    DEC.W Enemy.invincibilityTimer,X
    JMP .interactEnd

  .notInvincible:
    LDA.W DebugDisableSpriteInteractions : BNE .interactEnd
    LDA.W TimeIsFrozenFlag : ORA.W DebugTimeIsFrozenForEnemies : BNE .checkParalyzed
    JSR EnemyCollisionHandling
    LDX.W EnemyIndex
    LDA.W Enemy.ID,X : BNE .checkParalyzed
    JMP .drawEnemyEnd

  .checkParalyzed:
    LDX.W EnemyIndex
    LDA.W Enemy.properties2,X : BIT.W #$0001 : BNE .processAIEnd

  .interactEnd:
    STZ.W DisableDrawingOfEnemies
    LDA.W TimeIsFrozenFlag : ORA.W DebugTimeIsFrozenForEnemies : BEQ .timeNotFrozen
    LDA.W Enemy.ID,X : TAY
    LDA.W $0020,Y : BEQ .processAIEnd
    STA.W EnemyAIPointer
    BRA .determineAIEnd

  .timeNotFrozen:
    LDX.W #$0000
    LDY.W EnemyIndex
    LDA.W Enemy.AI,Y : BEQ +

  .loopBitIndex:
    INX
    LSR : BCS +
    BRA .loopBitIndex

+   TXA : ASL : CLC : ADC.W Enemy.ID,Y : TAX
    LDA.W $0018,X : STA.W EnemyAIPointer

  .determineAIEnd:
    PHB
    JSL .executeAI
    PLB
    BRA +

  .executeAI:
    LDX.W EnemyIndex
    LDA.W Enemy.bank,X : STA.W EnemyAIPointer+2 : XBA : PHA : PLB : PLB
    JML.W [EnemyAIPointer]

+   LDA.W TimeIsFrozenFlag : ORA.W DebugTimeIsFrozenForEnemies : BNE .processAIEnd
    LDX.W EnemyIndex
    INC.W Enemy.frameCounter,X
    LDA.W Enemy.properties,X : BIT.W #$2000 : BEQ .processAIEnd
    LDA.W #$0002 : STA.L EnemyProcessingStage
    JSR ProcessEnemyInstructions

  .processAIEnd:
    LDX.W EnemyIndex
    LDA.W Enemy.properties2,X : BIT.W #$0001 : BEQ .paralysedEnd
    LDA.W Enemy.flashTimer,X : CMP.W #$0001 : BEQ +
    LDA.W Enemy.freezeTimer,X : CMP.W #$0001 : BNE .paralysedEnd

+   LDA.W #$0000 : STA.L EnemyTileData+2,X
    LDA.W #$0000
    JSL EnemyDeath

  .paralysedEnd:
    LDX.W EnemyIndex
    LDA.W Enemy.properties2,X : BIT.W #$0004 : BNE +
    JSL CheckIfEnemyIsOnScreen
    BEQ +
    BRA .drawEnemyEnd

+   LDX.W EnemyIndex
    LDA.W Enemy.properties,X : BIT.W #$0300 : BNE .drawEnemyEnd
    LDA.W DisableDrawingOfEnemies : BIT.W #$0001 : BNE .drawEnemyEnd
    JSR AddEnemyToDrawingQueue

  .drawEnemyEnd:
    LDX.W EnemyIndex
    LDA.W Enemy.flashTimer,X : BEQ +
    LDA.W TimeIsFrozenFlag : ORA.W DebugTimeIsFrozenForEnemies : BNE +
    DEC.W Enemy.flashTimer,X
    LDA.W Enemy.flashTimer,X : CMP.W #$0008 : BPL +
    LDA.W Enemy.AI,X : AND.W #$FFFD : STA.W Enemy.AI,X

+   INC.W ActiveEnemyIndicesIndex : INC.W ActiveEnemyIndicesIndex
    JMP .loop

  .return:
    JSL HandleSpriteObjects
    INC.W NumberOfTimesMainEnemyRoutineExecuted
    LDA.W #$FFFF
    STA.W EnemyIndexSamusCollidesLeft : STA.W EnemyIndexSamusCollidesRight
    STA.W EnemyIndexSamusCollidesUp : STA.W EnemyIndexSamusCollidesDown
    STZ.W neverRead1834 : STZ.W neverRead1836
    STZ.W neverRead1838 : STZ.W neverRead183A
    PLB
    RTL


;;; $9169: Decrement Samus hurt timers and clear active enemy indices lists ;;;
DecrementSamusHurtTimers_ClearActiveEnemyIndicesLists:
    LDA.W SamusInvincibilityTimer : BEQ +
    DEC.W SamusInvincibilityTimer

+   LDA.W SamusKnockbackTimer : BEQ +
    DEC.W SamusKnockbackTimer

+   LDA.W ProjectileInvincibilityTImer : BEQ +
    DEC.W ProjectileInvincibilityTImer

+   LDA.W #$FFFF : STA.W InteractiveEnemyIndices : STA.W ActiveEnemyIndices
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $918B: Unused. Logging routine for a specific vertical enemy reaction ;;;
UNUSED_LoggingRoutineForASpecificVertcalEnemyReaction_A0918B:
    PHB
    LDA.W LogIndex : BNE .nonZeroIndex
    LDA.W #EnemyLogging.executionCount

  .nonZeroIndex:
    TAX
    LDA.W NumberOfTimesMainEnemyRoutineExecuted : STA.L EnemyLogging.executionCount&$FF00FF,X
    LDA.W Enemy[2].YPosition : STA.L EnemyLogging.enemy2YPosition&$FF00FF,X
    LDA.W Enemy[2].YSubPosition : STA.L EnemyLogging.enemy2YSubPosition&$FF00FF,X
    LDA.W ExtraSamusYDisplacement : STA.L EnemyLogging.extraSamusYDisplacement&$FF00FF,X
    LDA.W ExtraSamusYSubDisplacement : STA.L EnemyLogging.decreasingMomentumFlag&$FF00FF,X
    LDA.W SamusYPosition : STA.L EnemyLogging.SamusYPosition&$FF00FF,X
    LDA.W SamusYSubPosition : STA.L EnemyLogging.SamusYSubPosition&$FF00FF,X
    LDA.W SamusYSpeed : STA.L EnemyLogging.SamusYSpeed&$FF00FF,X
    LDA.W SamusYSubSpeed : STA.L EnemyLogging.SamusYSubSpeed&$FF00FF,X
    LDA.W SamusYRadius : STA.L EnemyLogging.SamusYRadius&$FF00FF,X
    LDA.W Pose : STA.L EnemyLogging.SamusPose&$FF00FF,X
    LDA.W PoseXDirection : STA.L EnemyLogging.SamusMovementTypeXDirection&$FF00FF,X
    LDA.W #$0000 : STA.L EnemyLogging.unknown18&$FF00FF,X : STA.L EnemyLogging.unknown1A&$FF00FF,X
    STA.L EnemyLogging.unknown1C&$FF00FF,X : STA.L EnemyLogging.unknown1E&$FF00FF,X
    TXA : CLC : ADC.W #$0020 : CMP.W #$9800 : BMI .return
    LDA.W #$0000

  .return:
    STA.W LogIndex
    PLB
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $920E: Spawn enemy drops ;;;
Spawn_Enemy_Drops:
;; Parameters:
;;     A: Enemy header pointer (to check drop rates)
;;     $12: X position
;;     $14: Y position

; Used for boss deaths and enemy projectiles, but not normal enemy death
    PHP : PHB : PHX : PHY
    STA.W Temp_EnemyHeaderPointer
    PEA Spawn_Enemy_Drops>>8&$FF00 : PLB : PLB ; seems pointless
    REP #$30
    LDY.W #EnemyProjectile_EnemyDeathPickup
    LDA.W Temp_EnemyProjectileInitParam
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    PLX : PLY : PLB : PLP
    RTL


;;; $922B: Delete enemy and any connected enemies ;;;
DeleteEnemyAndAnyConnectedEnemies:
; This is called only by rinkas in Mother Brain's room when deleted due to Mother Brain first form defeat
; Rinka has 1 part >_>;
    PHB
    LDX.W EnemyIndex : PHX ; >.<
    LDA.W Enemy.ID,X : TAX
    LDA.L EnemyHeaders_numberOfParts,X : BNE +
    INC

+   TAY
    PLX

  .loop:
    STZ.W Enemy.ID,X
    TXA : CLC : ADC.W #$0040 : TAX
    DEY : BNE .loop
    PLB
    RTL


;;; $924B: Debug. Spawn enemy to enemy index [Y] ;;;
Debug_SpawnEnemy_ToEnemyIndex_inY:
;; Parameters:
;;     X: New enemy population data
;;     Y: New enemy index
    PHB
    STX.W Temp_PopulationDataPointer
    STY.W NewEnemyIndex
    LDA.W EnemyIndex : STA.W BackupEnemyIndex
    LDA.W EnemyAIPointer : STA.W BackupEnemyAIPointer
    LDA.W EnemyAIPointer+2 : STA.W BackupEnemyAIPointer+2
    LDA.W $0000,X : TAX
    LDA.L EnemyHeaders_numberOfParts,X : AND.W #$00FF : STA.W Temp_NumberOfEnemyPartsToSpawn
    JMP SpawnEnemy_AlwaysSucceed


;;; $9275: Spawn enemy ;;;
SpawnEnemy:
;; Parameters:
;;     X: New enemy population data
;; Returns:
;;     A: 0 if successfully spawned, FFFFh otherwise
;;     X: New enemy index (or 800h if failed to spawn)

; This routine attempts to find (number of enemy parts) consecutive free enemy slots, and calls $92DB if it succeeds
; It has a couple problems for multi-part enemies
; Looking forward at $92DB, Temp_NumberOfEnemyPartsToSpawn is supposed to be the number of enemy parts (non-decremented). Further evidenced by the debug spawn routine above
; $0E22 should be reset back to [number of enemy parts] - 1 as part of LOOP_FIRST_ENEMY,
; otherwise after finding one free slot and then finding one occupied slot,
; the loop will try to find one fewer consecutive slots
    PHB
    STX.W Temp_PopulationDataPointer
    LDA.W EnemyIndex : STA.W BackupEnemyIndex
    LDA.W EnemyAIPointer : STA.W BackupEnemyAIPointer
    LDA.W EnemyAIPointer+2 : STA.W BackupEnemyAIPointer+2
    LDA.W $0000,X : TAY
    PHX
    TAX
    LDA.L EnemyHeaders_numberOfParts,X
    PLX
    DEC : BPL +
    LDA.W #$0000

+   STA.W Temp_SpawnEnemyLoopCounter : STA.W Temp_NumberOfEnemyPartsToSpawn
    STZ.W NewEnemyIndex

  .loopFirstEnemy:
    LDX.W NewEnemyIndex
    LDA.W Enemy.ID,X : BNE .next

  .loopOtherEnemies:
    LDA.W Enemy.ID,X : BNE .next
    LDA.W Temp_SpawnEnemyLoopCounter : BEQ SpawnEnemy_AlwaysSucceed
    DEC.W Temp_SpawnEnemyLoopCounter
    TXA : CLC : ADC.W #$0040 : TAX
    CPX.W #$0800 : BMI .loopOtherEnemies
    BRA .notFound

  .next:
    LDA.W NewEnemyIndex : CLC : ADC.W #$0040 : STA.W NewEnemyIndex
    CMP.W #$0800 : BMI .loopFirstEnemy

  .notFound:
    LDA.W #$FFFF
    PLB
    RTL


;;; $92DB: Spawn enemy ;;;
SpawnEnemy_AlwaysSucceed:
;; Parameters:
;;     Temp_PopulationDataPointer: New enemy population data
;;     $0E26: Number of enemy parts to spawn. 0 acts like 1 (thanks to the BEQ at $93E2)
;; Returns:
;;     A: 0. This routine doesn't check if it's overwriting an enemy or not and has no bounds checking, so it always succeeds
;;     X: New enemy index
    LDY.W NewEnemyIndex
    LDX.W Temp_PopulationDataPointer
    LDA.W $0000,X
    LDX.W #$0000
    CMP.L EnemyGFXData_IDs : BEQ .graphics
    LDX.W #$0002
    CMP.L EnemyGFXData_IDs+2 : BEQ .graphics
    LDX.W #$0004
    CMP.L EnemyGFXData_IDs+4 : BEQ .graphics
    LDX.W #$0006
    CMP.L EnemyGFXData_IDs+6 : BEQ .graphics
    LDA.W #$0000 : STA.W Enemy.GFXOffset,Y : STA.W Enemy.palette,Y
    BRA +

  .graphics:
    LDA.L EnemyGFXData_TilesIndex,X : STA.W Enemy.GFXOffset,Y
    LDA.L EnemyGFXData_PaletteIndices,X : XBA : ASL : STA.W Enemy.palette,Y

+   LDX.W Temp_PopulationDataPointer
    LDA.W $0000,X : TAX
    LDA.L EnemyHeaders_width,X : STA.W Enemy.XHitboxRadius,Y
    LDA.L EnemyHeaders_height,X : STA.W Enemy.YHitboxRadius,Y
    LDA.L EnemyHeaders_health,X : STA.W Enemy.health,Y
    LDA.L EnemyHeaders_layer,X : AND.W #$00FF : STA.W Enemy.layer,Y
    LDA.L EnemyHeaders_bank,X : STA.W Enemy.bank,Y
    LDX.W Temp_PopulationDataPointer
    LDA.W $0000,X : STA.W Enemy.ID,Y
    LDA.W $0002,X : STA.W Enemy.XPosition,Y
    LDA.W $0004,X : STA.W Enemy.YPosition,Y
    LDA.W $0006,X : STA.W Enemy.instList,Y
    LDA.W $0008,X : STA.W Enemy.properties,Y
    LDA.W $000A,X : STA.W Enemy.properties2,Y
    LDA.W $000C,X : STA.W Enemy.init0,Y
    LDA.W $000E,X : STA.W Enemy.init1,Y
    LDA.W #$0000 : STA.W Enemy.frameCounter,Y : STA.W Enemy.loopCounter,Y
    STA.W Enemy.var0,Y : STA.W Enemy.var1,Y
    STA.W Enemy.var2,Y : STA.W Enemy.var3,Y
    STA.W Enemy.var4,Y : STA.W Enemy.var5,Y
    LDA.W #$0001 : STA.W Enemy.instTimer,Y
    LDA.W #$0000 : STA.W Enemy.frameCounter,Y
    JSL Record_EnemySpawnData
    PHX : PHY
    STY.W EnemyIndex
    LDX.W Enemy.ID,Y
    LDA.L EnemyHeaders_initAI,X : CMP.W #$8000 : BMI .processInstructions
    STA.W EnemyAIPointer
    LDA.L EnemyHeaders_bank,X : STA.W EnemyAIPointer+2
    PHB
    JSL .executeAI
    PLB

  .processInstructions:
    PLY : PLX
    LDA.W Enemy.properties,Y : BIT.W #$2000 : BEQ .nextEnemy
    LDA.W #Spritemap_Common_Nothing : STA.W Enemy.spritemap,Y

  .nextEnemy:
    LDA.W Temp_NumberOfEnemyPartsToSpawn : BEQ .setAI
    DEC.W Temp_NumberOfEnemyPartsToSpawn : BEQ .setAI
    LDA.W NewEnemyIndex : CLC : ADC.W #$0040 : STA.W NewEnemyIndex
    LDA.W Temp_PopulationDataPointer : CLC : ADC.W #$0010 : STA.W Temp_PopulationDataPointer
    JMP SpawnEnemy_AlwaysSucceed

  .setAI:
    LDA.W BackupEnemyAIPointer : STA.W EnemyAIPointer
    LDA.W BackupEnemyAIPointer+2 : STA.W EnemyAIPointer+2
    LDA.W BackupEnemyIndex : STA.W EnemyIndex
    LDX.W NewEnemyIndex
    LDA.W #$0000
    PLB
    RTL

  .executeAI:
; Execute enemy AI pointer
    LDA.W Enemy.bank-1,Y : PHA : PLB : PLB
    JML.W [EnemyAIPointer]


;;; $9423: Add enemy to drawing queue ;;;
AddEnemyToDrawingQueue:
    PHX : PHY
    LDX.W EnemyIndex
    LDA.W Enemy.layer,X : ASL : STA.W Temp_DrawingQueueIndex0E34
    TAY
    LDA.W AddressesForEnemyDrawingQueues,Y : CLC : ADC.W EnemyDrawingQueues_Sizes,Y : TAY
    LDA.W EnemyIndex : STA.W $0000,Y
    LDX.W Temp_DrawingQueueIndex0E34
    INC.W EnemyDrawingQueues_Sizes,X : INC.W EnemyDrawingQueues_Sizes,X
    PLY : PLX
    RTS


;;; $944A: Write enemy OAM (if not on frozen or invincible frame) ;;;
WriteEnemyOAM_IfNotFrozenOrInvincibleFrame:
    PHB
    LDX.W EnemyIndex
    LDA.W Enemy.bank-1,X : PHA : PLB : PLB
    REP #$30
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : SEC : SBC.W Layer1XPosition
    CLC : ADC.L EnemySpawnData.graphicalXOffset,X : STA.W Temp_XPositionOnScreen : STA.B DP_Temp14
    LDA.W Enemy.YPosition,X : SEC : SBC.W Layer1YPosition
    CLC : ADC.L EnemySpawnData.graphicalYOffset,X : STA.W Temp_YPositionOnScreen : STA.B DP_Temp12
    LDA.W Enemy.shakeTimer,X : BEQ .noShake
    LDA.W Enemy.frameCounter,X : AND.W #$0002 : BEQ .zeroCounter
    DEC.B DP_Temp14
    DEC.W Temp_XPositionOnScreen
    BRA .decrementShakeTimer

  .zeroCounter:
    INC.B DP_Temp14
    INC.W Temp_XPositionOnScreen

  .decrementShakeTimer:
    DEC.W Enemy.shakeTimer,X

  .noShake:
    LDA.W Enemy.flashTimer,X : BEQ .timerExpired
    LDA.W NumberOfTimesMainEnemyRoutineExecuted : AND.W #$0002 : BEQ .timerExpired
    LDA.W #$0000
    BRA .determinedPalette

  .timerExpired:
    LDA.W Enemy.freezeTimer,X : BEQ .useEnemyPalette
    CMP.W #$005A : BCS .palette6
    BIT.W #$0002 : BEQ .useEnemyPalette

  .palette6:
    LDA.W #$0C00
    BRA .determinedPalette

  .useEnemyPalette:
    LDA.W Enemy.palette,X

  .determinedPalette:
    STA.B DP_Temp03
    LDA.W Enemy.GFXOffset,X : STA.B DP_Temp00
    LDA.W Enemy.properties2,X : BIT.W #$0004 : BNE .extendedSpritemap
    LDA.W Enemy.ID,X : STA.L neverReadF37E
    LDA.W Enemy.instList,X : STA.L neverReadF37A
    LDA.W EnemyIndex : STA.L neverReadF37C
    LDA.W #$0001 : STA.L EnemyProcessingStage
    LDY.W Enemy.spritemap,X
    JSL AddSpritemapToOAM_WithBaseTileNumber_8AB8
    PLB
    RTS

  .extendedSpritemap:
    LDA.W Enemy.spritemap,X : CMP.W #$8000

  .crash:
    BMI .crash
    TAY
    LDA.W $0000,Y : AND.W #$00FF : STA.W RemainingEnemySpritemapEntries
    INY #2

  .loop:
    LDA.W $0004,Y : STA.B DP_Temp16
    TAX
    LDA.W $0000,X : CMP.W #$FFFE : BNE .notExtendedSpritemap
    LDA.W $0000,Y : CLC : ADC.W Temp_XPositionOnScreen : STA.B DP_Temp14
    LDA.W $0002,Y : CLC : ADC.W Temp_YPositionOnScreen : STA.B DP_Temp12
    LDX.W EnemyIndex
    LDA.W Enemy.properties2,X : AND.W #$8000 : BEQ .next
    JSR ProcessExtendedTilemap
    BRA .next

  .notExtendedSpritemap:
    LDA.W $0000,Y : CLC : ADC.W Temp_XPositionOnScreen : STA.B DP_Temp14
    ADC.W #$0080 : BIT.W #$FE00 : BNE .next
    LDA.W $0002,Y : CLC : ADC.W Temp_YPositionOnScreen : STA.B DP_Temp12
    ADC.W #$0080 : BIT.W #$FE00 : BNE .next
    PHY
    LDA.B DP_Temp12 : BIT.W #$FF00 : BNE .offScreen
    LDY.B DP_Temp16
    JSL AddSpritemapToOAM_WithBaseTileNumber_8B22
    BRA .pullY

  .offScreen:
    LDY.B DP_Temp16
    JSL AddSpritemapToOAM_WithBaseTileNumber_Offscreen_8B96

  .pullY:
    PLY

  .next:
    TYA : CLC : ADC.W #$0008 : TAY
    DEC.W RemainingEnemySpritemapEntries : BNE .loop
    PLB
    RTS


;;; $957E: Normal enemy frozen AI ;;;
NormalEnemyFrozenAI:
    PHX : PHY
    LDX.W EnemyIndex
    STZ.W Enemy.flashTimer,X
    LDA.W Enemy.freezeTimer,X : BEQ .unsetFrozenAI
    DEC.W Enemy.freezeTimer,X
    LDA.W EquippedBeams : AND.W #$0002 : BEQ .unsetFrozenAI
    LDA.W #$0001
    BRA .return

  .unsetFrozenAI:
    LDA.W Enemy.AI,X : AND.W #$FFFB : STA.W Enemy.AI,X : STA.W Enemy.freezeTimer,X
    LDA.W #$0000

  .return:
    PLY : PLX
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $95AD: Unused. Execute enemy AI ;;;
UNUSED_ExecuteEnemyAI_A095AD:
    PHB : PHP
    PEA UNUSED_ExecuteEnemyAI_A095AD>>8&$FF00 : PLB : PLB
    REP #$30
    LDX.W #$0000
    LDY.W EnemyIndex
    LDA.W Enemy.AI,Y : BEQ +

  .loop:
    INX
    LSR : BCS +
    BRA .loop

+   TXA : ASL : CLC : ADC.W Enemy.ID,Y : TAX
    LDA.W $0018,X : STA.W EnemyAIPointer
    LDA.W Enemy.bank,Y : STA.W EnemyAIPointer+2
    JSL .executeAI
    PLP : PLB
    RTL

  .executeAI:
; Execute enemy AI pointer
    LDX.W EnemyIndex
    LDA.W Enemy.bank,X : STA.W EnemyAIPointer+2 : XBA : PHA : PLB : PLB
    JML.W [EnemyAIPointer]


;;; $95F1: Unused. Respawn enemy ;;;
UNUSED_RespawnEnemy_A095F1:
; See $86:F264 for the used routine
    PHB
    PEA UNUSED_RespawnEnemy_A095F1>>8&$FF00 : PLB : PLB
    REP #$30
    LDA.W EnemyIndex : LSR #2 : STA.B DP_Temp12
    LDA.W EnemyPopulationPointer : CLC : ADC.B DP_Temp12 : TAX
    LDY.W EnemyIndex
    LDA.L EnemyPopulations_ID,X : STA.W Enemy.ID,Y
    LDA.L EnemyPopulations_XPosition,X : STA.W Enemy.XPosition,Y
    LDA.L EnemyPopulations_YPosition,X : STA.W Enemy.YPosition,Y
    LDA.L EnemyPopulations_init,X : STA.W Enemy.instList,Y
    LDA.L EnemyPopulations_properties,X : STA.W Enemy.properties,Y
    LDA.L EnemyPopulations_extraProperties,X : STA.W Enemy.properties2,Y
    LDA.L EnemyPopulations_param1,X : STA.W Enemy.init0,Y
    LDA.L EnemyPopulations_param2,X : STA.W Enemy.init1,Y
    PHX
    TYX
    LDA.L EnemySpawnData.VRAMTilesIndex,X : AND.W #$0E00 : STA.W Enemy.palette,X
    LDA.L EnemySpawnData.VRAMTilesIndex,X : AND.W #$01FF : STA.W Enemy.GFXOffset,X
    PLX
    LDA.W #$0000 : STA.W Enemy.freezeTimer,Y : STA.W Enemy.flashTimer,Y
    STA.W Enemy.invincibilityTimer,Y : STA.W Enemy.loopCounter,Y
    STA.W Enemy.frameCounter,Y
    STA.W Enemy.var0,Y : STA.W Enemy.var1,Y
    STA.W Enemy.var2,Y : STA.W Enemy.var3,Y
    STA.W Enemy.var4,Y : STA.W Enemy.var5,Y
    LDA.W #$0001 : STA.W Enemy.instTimer,Y
    LDX.W EnemyIndex
    LDA.W Enemy.ID,X : TAX
    LDA.W $0012,X : STA.W EnemyAIPointer
    LDA.W $0008,X : STA.W Enemy.XHitboxRadius,Y
    LDA.W $000A,X : STA.W Enemy.YHitboxRadius,Y
    LDA.W $0004,X : STA.W Enemy.health,Y
    LDA.W $0039,X : AND.W #$00FF : STA.W Enemy.layer,Y
    LDA.W $000C,X : STA.W Enemy.bank,Y : STA.W EnemyAIPointer+2
    JSL .executeAI
    PLB
    RTL

  .executeAI:
    LDX.W EnemyIndex
    LDA.W Enemy.bank,X : STA.W EnemyAIPointer+2 : XBA : PHA : PLB : PLB
    JML.W [EnemyAIPointer]
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $96CA: Process extended tilemap ;;;
ProcessExtendedTilemap:
;; Parameters:
;;     [$16]: Pointer to extended tilemap

; Crashes if writing >= 2800h bytes

; Extended tilemap format:
;     FFFE                      ; Enables extended tilemap
;     dddd nnnn xxxx xxxx [...] ; First entry
;     dddd nnnn xxxx xxxx [...] ; Second entry
;     [...]                     ; Other entries
;     FFFF                      ; Terminator
; where
;     d: Destination address (in bank $7E)
;     n: Number of tiles (size of tilemap / 2)
;     x: Tilemap
    PHY
    LDY.B DP_Temp16
    INY #2

  .loop:
    LDA.W $0000,Y : CMP.W #$FFFF : BEQ .return
    TAX
    LDA.W $0002,Y : STA.W NumberOfExtendedTilemapTiles
    INY #4
    LSR : BCC .unrolled

  .innerLoop:
    LDA.W $0000,Y : STA.L EnemyBG2Tilemap&$FF0000,X
    INX #2
    INY #2
    DEC.W NumberOfExtendedTilemapTiles : BNE .innerLoop
    JMP .loop

  .unrolled:
    LDA.W $0000,Y : STA.L EnemyBG2Tilemap&$FF0000,X
    LDA.W $0002,Y : STA.L (EnemyBG2Tilemap&$FF0000)+2,X
    INX #4
    INY #4
    CPX.W #$2800

  .crash:
    BPL .crash
    DEC.W NumberOfExtendedTilemapTiles : DEC.W NumberOfExtendedTilemapTiles
    LDA.W NumberOfExtendedTilemapTiles : BNE .unrolled
    JMP .loop

  .return:
    INC.W RequestEnemyBG2TilemapTransferFlag
    PLY
    RTS


;;; $9726: Handle queuing enemy BG2 tilemap VRAM transfer ;;;
Handle_Queuing_Enemy_BG2_Tilemap_VRAM_Transfer:
; Used by Phantoon, Draygon, Crocomire and Mother Brain
    LDA.W RequestEnemyBG2TilemapTransferFlag : BEQ .clearTransferFlag
    LDA.W TimeIsFrozenFlag : ORA.W DebugTimeIsFrozenForEnemies : BNE .clearTransferFlag
    LDX.W VRAMWriteStack
    LDA.W EnemyBG2TilemapSize : STA.B VRAMWrite.size,X
    LDA.W #EnemyBG2Tilemap : STA.B VRAMWrite.src,X
    LDA.W #EnemyBG2Tilemap>>16 : STA.B VRAMWrite.src+2,X
    LDA.W #$4800 : STA.B VRAMWrite.dest,X
    LDA.W VRAMWriteStack : CLC : ADC.W #$0007 : STA.W VRAMWriteStack

  .clearTransferFlag:
    STZ.W RequestEnemyBG2TilemapTransferFlag
    RTL


;;; $9758: Enemy collision handling ;;;
EnemyCollisionHandling:
    PHP : PHB
    PEA EnemyCollisionHandling>>8&$FF00 : PLB : PLB ; pointless
    REP #$30
    LDX.W EnemyIndex
    LDA.W Enemy.properties2,X : BIT.W #$0004 : BEQ .notExtendedSpritemap
    JSR Enemy_vs_Projectile_CollisionHandling_ExtendedSpritemap
    JSR Enemy_vs_Bomb_CollisionHandling_ExtendedSpritemap
    JSR EnemySamusCollisionHandling_ExtendedSpritemap
    PLB : PLP
    RTS

  .notExtendedSpritemap:
    JSR Enemy_vs_ProjectileCollisionHandling
    JSR Enemy_vs_Bomb_CollisionHandling
    JSR Enemy_vs_Samus_CollisionHandling
    PLB : PLP
    RTS


;;; $9784: RTL ;;;
RTL_A09784:
    RTL


;;; $9785: Samus / projectile interaction handling ;;;
Samus_Projectiles_Interaction_Handling:
; Handles bomb jumps and damage due to reflected projectiles
    PHB
    PEA Samus_Projectiles_Interaction_Handling>>8&$FF00 : PLB : PLB
    REP #$30
    LDA.W #$000A : STA.L EnemyProcessingStage
    LDA.W DisableSamusVsProjectileInteraction : BNE .returnUpper
    LDA.W #$0005 : STA.W EnemySpritemapEntryYPositionDuringCollision
    LDA.W SamusProjectile_BombCounter : BNE .bombIsActive
    LDA.W SamusProjectile_ProjectileCounter : BNE .projectileIsActive

  .returnUpper:
    PLB
    RTL

  .bombIsActive:
    LDA.W #$000A : STA.W EnemySpritemapEntryYPositionDuringCollision

  .projectileIsActive:
    LDA.W ProjectileInvincibilityTImer : BEQ .checkContactDamage
    PLB
    RTL

  .checkContactDamage:
    LDA.W ContactDamageIndex : BEQ .resetProjectileIndex
    PLB
    RTL

  .resetProjectileIndex:
    STZ.W CollisionIndex

  .loop:
    LDA.W CollisionIndex : ASL : TAY
    LDA.W SamusProjectile_Damages,Y : BNE .hasDamage
    JMP .next

  .hasDamage:
    LDA.W SamusProjectile_Types,Y : BIT.W #$8000 : BNE .gotoNext
    AND.W #$0F00 : CMP.W #$0700 : BMI .interactive

  .gotoNext:
    JMP .next

  .interactive:
    LDA.W SamusProjectile_Directions,Y : AND.W #$0010 : BNE .gotoNext
    LDA.W SamusProjectile_XPositions,Y : SEC : SBC.W SamusXPosition : BPL +
    EOR.W #$FFFF : INC

+   SEC : SBC.W SamusProjectile_XRadii,Y : BCC +
    CMP.W SamusXRadius : BCS .gotoNext

+   LDA.W SamusProjectile_YPositions,Y : SEC : SBC.W SamusYPosition : BPL +
    EOR.W #$FFFF : INC

+   SEC : SBC.W SamusProjectile_YRadii,Y : BCC .checkBombType
    CMP.W SamusYRadius : BCC .checkBombType
    BRA .next

  .checkBombType:
    LDA.W SamusProjectile_Types,Y : AND.W #$FF00 : CMP.W #$0300 : BEQ .checkBombTimer
    CMP.W #$0500 : BNE .notABomb

  .checkBombTimer:
    LDA.W SamusProjectile_Variables,Y : CMP.W #$0008 : BNE .next
    LDA.W SamusXPosition : CMP.W SamusProjectile_XPositions,Y : BEQ .straight
    BMI .left
    LDA.W #$0003
    BRA .storeBombJumpDirection

  .left:
    LDA.W #$0001
    BRA .storeBombJumpDirection

  .straight:
    LDA.W #$0002

  .storeBombJumpDirection:
    STA.W BombJumpDirection
    BRA .next

  .notABomb:
    LDA.W SamusProjectile_Directions,Y : ORA.W #$0010 : STA.W SamusProjectile_Directions,Y
    LDA.W SamusProjectile_Damages,Y
    JSL Suit_Damage_Division
    JSL Deal_A_Damage_to_Samus
    LDA.W #$0060 : STA.W SamusInvincibilityTimer
    LDA.W #$0005 : STA.W SamusKnockbackTimer
    LDY.W #$0000
    LDA.W SamusXPosition : SEC : SBC.W EnemyProjectile_XPositions,X : BMI .storeKnockbackDirection
    LDY.W #$0001

  .storeKnockbackDirection:
    STY.W KnockbackXDirection
    BRA .returnLower

  .next:
    INC.W CollisionIndex
    LDA.W CollisionIndex : CMP.W EnemySpritemapEntryYPositionDuringCollision : BEQ .returnLower
    JMP .loop

  .returnLower:
    PLB
    RTL


;;; $9894: Enemy projectile / Samus collision handling ;;;
EnemyProjectile_Samus_Collision_Handling:
    PHP : PHB
    PEA EnemyProjectile_Samus_Collision_Handling>>8&$FF00 : PLB : PLB
    REP #$30
    LDA.W #$000B : STA.L EnemyProcessingStage
    LDA.W SamusInvincibilityTimer : BEQ .notInvincible
    PLB : PLP
    RTL

  .notInvincible:
    LDA.W ContactDamageIndex : BNE .return
    LDA.W #$0022 : STA.W CollisionIndex

  .loop:
    LDX.W CollisionIndex
    LDA.W EnemyProjectile_ID,X : BEQ .next
    LDA.W EnemyProjectile_Properties,X : BIT.W #$2000 : BNE .next
    LDA.W EnemyProjectile_Radii,X : AND.W #$00FF : BNE .hasXHitbox
    JMP .next

  .hasXHitbox:
    STA.W Temp_ProjectileXRadius
    LDA.W EnemyProjectile_Radii+1,X : AND.W #$00FF : BEQ .next
    STA.W Temp_ProjectileYRadius
    LDA.W SamusXPosition : SEC : SBC.W EnemyProjectile_XPositions,X : BPL +
    EOR.W #$FFFF : INC

+   SEC : SBC.W SamusXRadius : BCC .checkY
    CMP.W Temp_ProjectileXRadius : BCS .next

  .checkY:
    LDA.W SamusYPosition : SEC : SBC.W EnemyProjectile_YPositions,X : BPL +
    EOR.W #$FFFF : INC

+   SEC : SBC.W SamusYRadius : BCC .handleCollision
    CMP.W Temp_ProjectileYRadius : BCC .handleCollision
    BRA .next

  .handleCollision:
    JSR HandleEnemyProjectileCollisionWithSamus

  .next:
    DEC.W CollisionIndex : DEC.W CollisionIndex
    LDA.W CollisionIndex : BPL .loop

  .return:
    PLB : PLP
    RTL


;;; $9923: Handle enemy projectile collision with Samus ;;;
HandleEnemyProjectileCollisionWithSamus:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W #$0060 : STA.W SamusInvincibilityTimer
    LDA.W #$0005 : STA.W SamusKnockbackTimer
    TXY
    LDX.W EnemyProjectile_ID,Y
    LDA.L EnemyProjectiles_properties,X : BEQ .checkContact
    STA.W EnemyProjectile_InstListPointers,Y
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,Y

  .checkContact:
    TYX
    BIT.W EnemyProjectile_Properties,X : BVS .dontDelete
    STZ.W EnemyProjectile_ID,X

  .dontDelete:
    LDA.W EnemyProjectile_Properties,X : AND.W #$0FFF
    JSL Suit_Damage_Division
    JSL Deal_A_Damage_to_Samus
    LDY.W #$0000
    LDA.W SamusXPosition : SEC : SBC.W EnemyProjectile_XPositions,X : BMI .knockbackDirection
    LDY.W #$0001

  .knockbackDirection:
    STY.W KnockbackXDirection
    RTS


;;; $996C: Enemy projectile / projectile collision handling ;;;
Projectile_vs_Projectile_Collision_Handling:
    PHP : PHB
    PEA Projectile_vs_Projectile_Collision_Handling>>8&$FF00 : PLB : PLB
    REP #$30
    LDA.W #$000C : STA.L EnemyProcessingStage
    LDA.W SamusProjectile_ProjectileCounter : BNE .setIndex
    PLB : PLP
    RTL

  .setIndex:
    LDA.W #$0022 : STA.W CollisionIndex

  .loopEnemyProjectile:
    LDX.W CollisionIndex
    LDA.W EnemyProjectile_ID,X : BEQ .nextEnemyProjectile
    LDA.W EnemyProjectile_Properties,X : BPL .nextEnemyProjectile
    LDY.W #$0000

  .loopProjectile:
    LDA.L EnemyProjectileData_CollisionOptions,X : CMP.W #$0002 : BEQ .nextEnemyProjectile
    LDA.W SamusProjectile_Types,Y : BEQ .nextProjectile
    AND.W #$0F00 : CMP.W #$0300 : BEQ .nextProjectile
    CMP.W #$0500 : BEQ .nextProjectile
    CMP.W #$0700 : BPL .nextProjectile
    LDA.W SamusProjectile_XPositions,Y : AND.W #$FFE0 : STA.B DP_Temp12
    LDA.W EnemyProjectile_XPositions,X : AND.W #$FFE0 : CMP.B DP_Temp12 : BNE .nextProjectile
    LDA.W SamusProjectile_YPositions,Y : AND.W #$FFE0 : STA.B DP_Temp12
    LDA.W EnemyProjectile_YPositions,X : AND.W #$FFE0 : CMP.B DP_Temp12 : BNE .nextProjectile
    JSR HandleEnemyProjectileCollisionWithProjectile

  .nextProjectile:
    INY #2 : CPY.W #$000A : BMI .loopProjectile

  .nextEnemyProjectile:
    DEC.W CollisionIndex : DEC.W CollisionIndex
    LDA.W CollisionIndex : BMI .return
    JMP .loopEnemyProjectile

  .return:
    PLB : PLP
    RTL


;;; $99F9: Handle enemy projectile collision with projectile ;;;
HandleEnemyProjectileCollisionWithProjectile:
;; Parameters:
;;     X: Enemy projectile index
;;     Y: Projectile index

; Code at $9A3D for creating the dud shot graphics uses the wrong index register for the projectile position,
; meaning the sprite object usually doesn't appear (used for fire arc and Botwoon)

; Why does getting shot mask off all the property bits?
; The first ASM instructions of the shot instruction list *are* executed in time to disable Samus collision before the next check,
; but the low priority is applied for drawing this frame
    LDA.W SamusProjectile_Types,Y : BIT.W #$0008 : BNE .plasmaBeam
    LDA.W SamusProjectile_Directions,Y : ORA.W #$0010 : STA.W SamusProjectile_Directions,Y

  .plasmaBeam:
    LDA.L EnemyProjectileData_CollisionOptions,X : CMP.W #$0001 : BEQ .buggyDudShot
    LDA.W SamusProjectile_Types,Y
    PHY
    TXY
    STA.W EnemyProjectile_CollidedProjectileType,Y
    LDX.W EnemyProjectile_ID,Y
    LDA.L EnemyProjectiles_hitInstList,X : STA.W EnemyProjectile_InstListPointers,Y
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,Y
    LDA.W #RTS_8684FB : STA.W EnemyProjectile_PreInstructions,Y
    LDA.W EnemyProjectile_Properties,Y : AND.W #$0FFF : STA.W EnemyProjectile_Properties,Y
    TYX
    PLY
    RTS

  .buggyDudShot:
    LDA.W SamusProjectile_XPositions,X : STA.B DP_Temp12
    LDA.W SamusProjectile_YPositions,X : STA.B DP_Temp14
    LDA.W #$0006 : STA.B DP_Temp16
    STZ.B DP_Temp18
    JSL Create_Sprite_Object
    LDA.W #$003D
    JSL QueueSound_Lib1_Max6
    RTS


;;; $9A5A: Enemy / Samus collision handling - extended spritemap ;;;
EnemySamusCollisionHandling_ExtendedSpritemap:
; This routine disables Samus' invincibility if she is using blue suit or screw attack (unless there are no tangible enemies)
    PHB
    LDX.W EnemyIndex
    LDA.W Enemy.bank,X : STA.W EnemyAIPointer+2 : XBA : PHA : PLB : PLB
    LDA.W #$0006 : STA.L EnemyProcessingStage
    LDY.W EnemyIndex
    LDA.W Enemy.spritemap,Y : BEQ .returnUpper
    LDA.W Enemy.ID,X : TAX
    LDA.L EnemyHeaders_enemyTouch,X : CMP.W #RTL_A0804C : BEQ .returnUpper
    CMP.W #RTS_A0804B : BNE .touch

  .returnUpper:
    PLB
    RTS

  .touch:
    LDA.W ContactDamageIndex : BEQ .normalContact
    STZ.W SamusInvincibilityTimer
    BRA .notInvincible

  .normalContact:
    LDA.W SamusInvincibilityTimer : BNE .returnUpper

  .notInvincible:
    LDX.W EnemyIndex
    LDA.W Enemy.spritemap,X : CMP.W #$8000 : BMI .returnUpper
    LDA.W SamusXPosition : CLC : ADC.W SamusXRadius : STA.W SamusRightBoundaryForEnemyVsSamusCollisions
    LDA.W SamusXPosition : SEC : SBC.W SamusXRadius : STA.W SamusLeftBoundaryForEnemyVsSamusCollisions
    LDA.W SamusYPosition : CLC : ADC.W SamusYRadius : STA.W SamusBottomBoundaryForEnemyVsSamusCollisions
    LDA.W SamusYPosition : SEC : SBC.W SamusYRadius : STA.W SamusTopBoundaryForEnemyVsSamusCollisions
    LDA.W Enemy.spritemap,X : TAX
    LDA.W $0000,X : AND.W #$00FF : STA.W RemainingEnemySpritemapEntries
    INX #2 : STX.W EnemySpritemapEntryPointerDuringCollision

  .loopSpritemapEntries:
    LDX.W EnemySpritemapEntryPointerDuringCollision
    LDY.W EnemyIndex
    LDA.W Enemy.XPosition,Y : CLC : ADC.W $0000,X : STA.W EnemySpritemapEntryXPositionDuringCollision
    LDA.W Enemy.YPosition,Y : CLC : ADC.W $0002,X : STA.W EnemySpritemapEntryYPositionDuringCollision
    LDA.W $0006,X : TAX
    LDA.W $0000,X : BEQ .nextSpritemapEntry
    STA.W RemainingEnemyHitboxEntries
    INX #2 : STX.W EnemyHitboxEntryPointerDuringCollision

  .loopHitboxes:
    LDX.W EnemyHitboxEntryPointerDuringCollision
    LDA.W EnemySpritemapEntryXPositionDuringCollision : CLC : ADC.W $0000,X
    CMP.W SamusRightBoundaryForEnemyVsSamusCollisions : BPL .nextHitboxEntry
    LDA.W EnemySpritemapEntryXPositionDuringCollision : CLC : ADC.W $0004,X
    CMP.W SamusLeftBoundaryForEnemyVsSamusCollisions : BMI .nextHitboxEntry
    LDA.W EnemySpritemapEntryYPositionDuringCollision : CLC : ADC.W $0002,X
    CMP.W SamusBottomBoundaryForEnemyVsSamusCollisions : BPL .nextHitboxEntry
    LDA.W EnemySpritemapEntryYPositionDuringCollision : CLC : ADC.W $0006,X
    CMP.W SamusTopBoundaryForEnemyVsSamusCollisions : BMI .nextHitboxEntry
    JSL .executeAI
    BRA .returnLower

  .executeAI:
    LDX.W EnemyHitboxEntryPointerDuringCollision
    LDA.W $0008,X : STA.W EnemyAIPointer
    JML.W [EnemyAIPointer]

  .nextHitboxEntry:
    LDA.W EnemyHitboxEntryPointerDuringCollision : CLC : ADC.W #$000C : STA.W EnemyHitboxEntryPointerDuringCollision
    DEC.W RemainingEnemyHitboxEntries
    LDA.W RemainingEnemyHitboxEntries : BEQ .nextSpritemapEntry
    BMI .nextSpritemapEntry
    JMP .loopHitboxes

  .nextSpritemapEntry:
    LDA.W EnemySpritemapEntryPointerDuringCollision : CLC
    ADC.W #$0008 : STA.W EnemySpritemapEntryPointerDuringCollision
    DEC.W RemainingEnemySpritemapEntries
    LDA.W RemainingEnemySpritemapEntries : BEQ .returnLower
    BMI .returnLower
    JMP .loopSpritemapEntries

  .returnLower:
    PLB
    RTS


;;; $9B7F: Enemy / projectile collision handling - extended spritemap ;;;
Enemy_vs_Projectile_CollisionHandling_ExtendedSpritemap:
    PHB
    LDX.W EnemyIndex
    LDA.W Enemy.bank,X : STA.W EnemyAIPointer+2 : XBA : PHA : PLB : PLB
    LDA.W #$0003 : STA.L EnemyProcessingStage
    LDA.W SamusProjectile_ProjectileCounter : BNE .nonZeroCounter
    PLB
    RTS

  .nonZeroCounter:
    STA.W ProjectileCounterMirror
    LDY.W EnemyIndex
    LDA.W Enemy.spritemap,Y : BEQ .returnUpper
    CMP.W #ExtendedSpritemap_Common_Nothing : BEQ .returnUpper
    LDX.W Enemy.ID,Y
    LDA.L EnemyHeaders_enemyShot,X : CMP.W #RTL_A0804C : BEQ .returnUpper
    CMP.W #RTS_A0804B : BNE +

  .returnUpper:
    PLB
    RTS

+   LDX.W EnemyIndex
    LDA.W Enemy.properties,X : BIT.W #$0400 : BNE .returnUpper
    LDA.W Enemy.invincibilityTimer,X : BNE .returnUpper
    LDA.W Enemy.ID,X : CMP.W #EnemyHeaders_Respawn : BEQ .returnUpper
    STZ.W CollisionIndex

  .loopProjectiles:
    LDX.W EnemyIndex
    LDA.W CollisionIndex : ASL : TAY
    LDA.W SamusProjectile_Types,Y : BEQ .gotoNextProjectile
    AND.W #$0F00 : CMP.W #$0300 : BEQ .gotoNextProjectile
    CMP.W #$0500 : BEQ .gotoNextProjectile
    CMP.W #$0700 : BMI .validProjectile

  .gotoNextProjectile:
    JMP .nextProjectile

  .validProjectile:
    LDX.W EnemyIndex
    LDA.W Enemy.spritemap,X : CMP.W #$8000

  .crash:
    BMI .crash
    TAX
    LDA.W $0000,X : AND.W #$00FF : STA.W RemainingEnemySpritemapEntries
    INX #2 : STX.W EnemySpritemapEntryPointerDuringCollision

  .loopSpritemapEntries:
    LDX.W EnemySpritemapEntryPointerDuringCollision
    LDY.W EnemyIndex
    LDA.W Enemy.XPosition,Y : CLC : ADC.W $0000,X : STA.W EnemySpritemapEntryXPositionDuringCollision
    LDA.W Enemy.YPosition,Y : CLC : ADC.W $0002,X : STA.W EnemySpritemapEntryYPositionDuringCollision
    LDA.W $0006,X : TAX
    LDA.W $0000,X : BNE .entriesRemaining
    JMP .nextSpritemapEntry

  .entriesRemaining:
    STA.W RemainingEnemyHitboxEntries
    INX #2 : STX.W EnemyHitboxEntryPointerDuringCollision

  .loopHitboxes:
    LDX.W EnemyHitboxEntryPointerDuringCollision
    LDA.W CollisionIndex : ASL : TAY
    LDA.W $0000,X : CLC : ADC.W EnemySpritemapEntryXPositionDuringCollision : STA.W EnemyLeftBoundaryForEnemyVsProjectileCollisions
    LDA.W SamusProjectile_XPositions,Y : CLC : ADC.W SamusProjectile_XRadii,Y
    CMP.W EnemyLeftBoundaryForEnemyVsProjectileCollisions : BPL +
    JMP .nextHitbox

+   LDA.W $0004,X : CLC : ADC.W EnemySpritemapEntryXPositionDuringCollision : STA.W EnemyRightBoundaryForEnemyVsProjectileCollisions
    LDA.W SamusProjectile_XPositions,Y : SEC : SBC.W SamusProjectile_XRadii,Y
    CMP.W EnemyRightBoundaryForEnemyVsProjectileCollisions : BPL .nextHitbox
    LDA.W $0002,X : CLC : ADC.W EnemySpritemapEntryYPositionDuringCollision : STA.W EnemyBottomBoundaryForEnemyVsProjectileCollisions
    LDA.W SamusProjectile_YPositions,Y : CLC : ADC.W SamusProjectile_YRadii,Y
    CMP.W EnemyBottomBoundaryForEnemyVsProjectileCollisions : BMI .nextHitbox
    LDA.W $0006,X : CLC : ADC.W EnemySpritemapEntryYPositionDuringCollision : STA.W EnemyTopBoundaryForEnemyVsProjectileCollisions
    LDA.W SamusProjectile_YPositions,Y : SEC : SBC.W SamusProjectile_YRadii,Y
    CMP.W EnemyTopBoundaryForEnemyVsProjectileCollisions : BPL .nextHitbox
    LDA.W SamusProjectile_Types,Y : AND.W #$0F00 : CMP.W #$0200 : BNE .notSuperMissile
    LDA.W #$001E : STA.W EarthquakeTimer
    LDA.W #$0012 : STA.W EarthquakeType

  .notSuperMissile:
    LDX.W EnemyIndex
    LDA.W Enemy.properties,X : BIT.W #$1000 : BNE .delete
    LDA.W SamusProjectile_Types,Y : AND.W #$0008
    BNE .noDelete

  .delete:
    LDA.W SamusProjectile_Directions,Y : ORA.W #$0010 : STA.W SamusProjectile_Directions,Y

  .noDelete:
    JSL .executeCollision
    BRA .returnLower

  .nextHitbox:
    LDA.W EnemyHitboxEntryPointerDuringCollision : CLC : ADC.W #$000C : STA.W EnemyHitboxEntryPointerDuringCollision
    DEC.W RemainingEnemyHitboxEntries : BEQ .nextSpritemapEntry
    BMI .nextSpritemapEntry
    JMP .loopHitboxes

  .nextSpritemapEntry:
    LDA.W EnemySpritemapEntryPointerDuringCollision : CLC : ADC.W #$0008 : STA.W EnemySpritemapEntryPointerDuringCollision
    DEC.W RemainingEnemySpritemapEntries : BEQ .nextProjectile
    BMI .nextProjectile
    JMP .loopSpritemapEntries

  .nextProjectile:
    INC.W CollisionIndex
    LDA.W CollisionIndex : CMP.W #$0005 : BPL .returnLower
    JMP .loopProjectiles

  .returnLower:
    PLB
    RTS

  .executeCollision:
    LDX.W EnemyHitboxEntryPointerDuringCollision
    LDA.W $000A,X : STA.W EnemyAIPointer
    JML.W [EnemyAIPointer]


;;; $9D23: Enemy / bomb collision handling - extended spritemap ;;;
Enemy_vs_Bomb_CollisionHandling_ExtendedSpritemap:
; I don't really see any reason why this routine should be separate from $9B7F
    PHB
    LDX.W EnemyIndex
    LDA.W Enemy.bank,X : STA.W EnemyAIPointer+2 : XBA : PHA : PLB : PLB
    LDA.W #$0004 : STA.L EnemyProcessingStage
    LDY.W EnemyIndex
    LDA.W Enemy.spritemap,Y : BEQ .returnUpper
    LDX.W EnemyIndex
    LDA.W Enemy.properties,X : BIT.W #$0400 : BNE .returnUpper
    LDA.W Enemy.invincibilityTimer,X : BNE .returnUpper
    LDY.W EnemyIndex
    LDX.W Enemy.ID,Y
    LDA.L EnemyHeaders_enemyShot,X : CMP.W #RTL_A0804C : BEQ .returnUpper
    CMP.W #RTS_A0804B : BNE +

  .returnUpper:
    PLB
    RTS

+   LDA.W SamusProjectile_BombCounter : BEQ .returnUpper
    LDA.W #$0005 : STA.W CollisionIndex

  .loopProjectiles:
    LDX.W EnemyIndex
    LDA.W CollisionIndex : ASL : TAY
    LDA.W SamusProjectile_XPositions,Y : BNE .notZeroX
    JMP .nextProjectile

  .notZeroX:
    LDA.W SamusProjectile_Types,Y : BEQ .gotoNextProjectile
    AND.W #$0F00 : CMP.W #$0500 : BEQ .bomb

  .gotoNextProjectile:
    JMP .nextProjectile

  .bomb:
    LDA.W SamusProjectile_Variables,Y : BEQ .timerExpired
    JMP .nextProjectile

  .timerExpired:
    LDA.W Enemy.spritemap,X : CMP.W #$8000

  .crash:
    BMI .crash
    TAX
    LDA.W $0000,X : AND.W #$00FF : STA.W RemainingEnemySpritemapEntries
    INX #2 : STX.W EnemySpritemapEntryPointerDuringCollision

  .loopSpritemapEntries:
    LDX.W EnemySpritemapEntryPointerDuringCollision
    LDY.W EnemyIndex
    LDA.W Enemy.XPosition,Y : CLC : ADC.W $0000,X : STA.W EnemySpritemapEntryXPositionDuringCollision
    LDA.W Enemy.YPosition,Y : CLC : ADC.W $0002,X : STA.W EnemySpritemapEntryYPositionDuringCollision
    LDA.W $0006,X : TAX
    LDA.W $0000,X : BNE +
    JMP .nextSpritemapEntry

+   STA.W RemainingEnemyHitboxEntries
    INX #2 : STX.W EnemyHitboxEntryPointerDuringCollision

  .loopHitboxes:
    LDX.W EnemyHitboxEntryPointerDuringCollision
    LDA.W CollisionIndex : ASL : TAY
    LDA.W $0000,X : CLC : ADC.W EnemySpritemapEntryXPositionDuringCollision : STA.W EnemyLeftBoundaryForEnemyVsProjectileCollisions
    LDA.W SamusProjectile_XPositions,Y : CLC : ADC.W SamusProjectile_XRadii,Y
    CMP.W EnemyLeftBoundaryForEnemyVsProjectileCollisions : BPL +
    JMP .nextHitbox

+   LDA.W $0004,X : CLC : ADC.W EnemySpritemapEntryXPositionDuringCollision : STA.W EnemyRightBoundaryForEnemyVsProjectileCollisions
    LDA.W SamusProjectile_XPositions,Y : SEC : SBC.W SamusProjectile_XRadii,Y
    CMP.W EnemyRightBoundaryForEnemyVsProjectileCollisions : BPL .nextHitbox
    LDA.W $0002,X : CLC : ADC.W EnemySpritemapEntryYPositionDuringCollision : STA.W EnemyBottomBoundaryForEnemyVsProjectileCollisions
    LDA.W SamusProjectile_YPositions,Y : CLC : ADC.W SamusProjectile_YRadii,Y
    CMP.W EnemyBottomBoundaryForEnemyVsProjectileCollisions : BMI .nextHitbox
    LDA.W $0006,X : CLC : ADC.W EnemySpritemapEntryYPositionDuringCollision : STA.W EnemyTopBoundaryForEnemyVsProjectileCollisions
    LDA.W SamusProjectile_YPositions,Y : SEC : SBC.W SamusProjectile_YRadii,Y
    CMP.W EnemyTopBoundaryForEnemyVsProjectileCollisions : BPL .nextHitbox
    LDA.W SamusProjectile_Directions,Y : ORA.W #$0010 : STA.W SamusProjectile_Directions,Y
    JSL .executeCollision
    BRA .returnLower

  .nextHitbox:
    LDA.W EnemyHitboxEntryPointerDuringCollision : CLC : ADC.W #$000C : STA.W EnemyHitboxEntryPointerDuringCollision
    DEC.W RemainingEnemyHitboxEntries
    LDA.W RemainingEnemyHitboxEntries : BEQ .nextSpritemapEntry
    BMI .nextSpritemapEntry
    JMP .loopHitboxes

  .nextSpritemapEntry:
    LDA.W EnemySpritemapEntryPointerDuringCollision : CLC : ADC.W #$0008 : STA.W EnemySpritemapEntryPointerDuringCollision
    DEC.W RemainingEnemySpritemapEntries
    LDA.W RemainingEnemySpritemapEntries : BEQ .nextProjectile
    BMI .nextProjectile
    JMP .loopSpritemapEntries

  .nextProjectile:
    INC.W CollisionIndex
    LDA.W CollisionIndex : CMP.W #$000A : BEQ .returnLower
    JMP .loopProjectiles

  .returnLower:
    PLB
    RTS

  .executeCollision:
    LDX.W EnemyHitboxEntryPointerDuringCollision
    LDA.W $000A,X : STA.W EnemyAIPointer
    JML.W [EnemyAIPointer]


;;; $9E9A: Enemy / grapple beam collision detection ;;;
EnemyGrappleBeamCollisionDetection:
;; Returns:
;;     A: Grapple reaction index
;;     {
;;         0: Otherwise
;;         1: Enemy grapple AI = $8005 - Samus latches on
;;         2: Enemy grapple AI = $800A - kill enemy
;;         3: Enemy grapple AI = $800F - cancel grapple beam
;;         4: Enemy grapple AI = $8014 - Samus latches on - no invincibility
;;         5: Enemy grapple AI = $8019 - Samus latches on - paralyse enemy
;;         6: Enemy grapple AI = $801E - hurt Samus
;;     }
;;     $12: Collided enemy ID if collision, otherwise 0

; Grapple reaction indices 1/4/5 set the grapple beam's end position to the enemy's position.
; Collision detection ignores the extended hitbox format
    PHB : PHX : PHY
    LDA.W #$000D
    JSL Run_Samus_Command
    BNE +
    JMP .grappleIndexDetermined

+   STZ.W CollisionIndex : STZ.W InteractiveEnemyIndicesIndex

  .loop:
    LDY.W InteractiveEnemyIndicesIndex
    LDA.W InteractiveEnemyIndices,Y : STA.W EnemyIndex
    CMP.W #$FFFF : BNE .notFFFF
    STZ.B DP_Temp12
    LDA.W #$0000
    PLY : PLX : PLB
    RTL

  .notFFFF:
    TAX
    LDA.W Enemy.invincibilityTimer,X : BNE .next
    LDA.W Enemy.XPosition,X : SEC : SBC.W GrappleBeam_EndXPosition : BPL +
    EOR.W #$FFFF : INC

+   SEC : SBC.W Enemy.XHitboxRadius,X : BCC .Y
    CMP.W #$0008 : BCS .next

  .Y:
    LDA.W Enemy.YPosition,X : SEC : SBC.W GrappleBeam_EndYPosition : BPL +
    EOR.W #$FFFF : INC

+   SEC : SBC.W Enemy.YHitboxRadius,X : BCC .hit
    CMP.W #$0008 : BCC .hit

  .next:
    INC.W InteractiveEnemyIndicesIndex : INC.W InteractiveEnemyIndicesIndex
    JMP .loop

  .hit:
    LDA.W #$0001 : STA.W Enemy.AI,X
    LDY.W #$0000
    LDA.W Enemy.ID,X : TAX
    LDA.L EnemyHeaders_grappleAI,X : CMP.W #Common_GrappleAI_NoInteraction : BEQ .grappleIndexDetermined
    LDY.W #$0001
    CMP.W #Common_GrappleAI_SamusLatchesOn : BEQ .grappleIndexDetermined
    INY
    CMP.W #Common_GrappleAI_KillEnemy : BEQ .grappleIndexDetermined
    INY
    CMP.W #Common_GrappleAI_CancelGrappleBeam : BEQ .grappleIndexDetermined
    INY
    CMP.W #Common_GrappleAI_SamusLatchesOn_NoInvincibility : BEQ .grappleIndexDetermined
    INY
    CMP.W #UNUSED_Common_GrappleAI_SamusLatchesOn_ParalyzeEnemy_A08019 : BEQ .grappleIndexDetermined
    INY
    CMP.W #Common_GrappleAI_HurtSamus : BEQ .grappleIndexDetermined
    LDY.W #$0000

  .grappleIndexDetermined:
    STX.B DP_Temp12
    TYA : CMP.W #$0001 : BEQ .attachGrapple
    CMP.W #$0004 : BEQ .attachGrapple
    CMP.W #$0005 : BEQ .attachGrapple

  .return:
    PLY : PLX : PLB
    RTL

  .attachGrapple:
    PHA
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : STA.W GrappleBeam_EndXPosition
    LDA.W Enemy.YPosition,X : STA.W GrappleBeam_EndYPosition
    PLA
    BRA .return


;;; $9F6D: Switch enemy AI to main AI ;;;
GrappleAI_SwitchEnemyAIToMainAI:
    LDX.W EnemyIndex
    STZ.W Enemy.AI,X : STZ.W Enemy.invincibilityTimer,X
    STZ.W Enemy.freezeTimer,X : STZ.W Enemy.shakeTimer,X
    RTL


;;; $9F7D: Samus latches on with grapple ;;;
GrappleAI_SamusLatchesOnWithGrapple:
    LDX.W EnemyIndex : LDX.W EnemyIndex ; >_<
    LDA.W Enemy.XPosition,X : STA.W GrappleBeam_EndXPosition
    LDA.W Enemy.YPosition,X : STA.W GrappleBeam_EndYPosition
    LDX.W EnemyIndex ; >.<
    LDA.W Enemy.freezeTimer,X : BNE .frozen
    LDX.W EnemyIndex ; >.<
    LDA.W Enemy.ID,X : TAX
    LDA.L EnemyHeaders_hurtAITime,X : AND.W #$00FF : BNE .main
    LDA.W #$0004

  .main:
    LDX.W EnemyIndex
    STA.W Enemy.flashTimer,X
    LDX.W EnemyIndex : LDX.W EnemyIndex ; >.<
    STZ.W Enemy.AI,X
    RTL

  .frozen:
    LDX.W EnemyIndex ; >.<
    LDA.W #$0004 : STA.W Enemy.AI,X
    RTL


;;; $9FC4: Enemy grapple death ;;;
GrappleAI_EnemyGrappleDeath:
    LDX.W EnemyIndex : LDX.W EnemyIndex ; >.<
    LDA.W #$0004 : STA.L EnemyTileData+2,X
    LDA.W #$0000
    JSL EnemyDeath
    LDX.W EnemyIndex ; >.<
    STZ.W Enemy.AI,X
    RTL


;;; $9FDF: Switch to frozen AI ;;;
GrappleAI_SwitchToFrozenAI:
    LDX.W EnemyIndex
    LDA.W #$0004 : STA.W Enemy.AI,X
    RTL


;;; $9FE9: Samus latches on with grapple - no invincibility ;;;
GrappleAI_SamusLatchesOnWithGrapple_NoInvincibility:
    LDX.W EnemyIndex
    LDA.W Enemy.freezeTimer,X : BNE .frozen
    LDX.W EnemyIndex ; >.<
    LDA.W Enemy.ID,X : TAX
    LDA.L EnemyHeaders_mainAI,X : STA.W EnemyAIPointer
    PHB
    JSL .executeAI
    PLB
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : STA.W GrappleBeam_EndXPosition
    LDA.W Enemy.YPosition,X : STA.W GrappleBeam_EndYPosition
    STZ.W Enemy.AI,X
    RTL

  .executeAI:
    LDX.W EnemyIndex
    LDA.W Enemy.bank,X : STA.W EnemyAIPointer+2 : XBA : PHA : PLB : PLB
    JML.W [EnemyAIPointer]

  .frozen:
    LDX.W EnemyIndex ; >.<
    LDA.W Enemy.XPosition,X : STA.W GrappleBeam_EndXPosition
    LDA.W Enemy.YPosition,X : STA.W GrappleBeam_EndYPosition
    LDA.W #$0004 : STA.W Enemy.AI,X
    RTL


;;; $A03E: Samus latches on with grapple - paralyse enemy ;;;
GrappleAI_SamusLatchesOnWithGrapple_ParalyzeEnemy:
    LDX.W EnemyIndex : LDX.W EnemyIndex ; >.<
    LDA.W Enemy.ID,X : TAX
    LDA.L EnemyHeaders_hurtAITime,X : AND.W #$00FF : BNE +
    LDA.W #$0004

+   LDX.W EnemyIndex
    STA.W Enemy.flashTimer,X
    LDX.W EnemyIndex : LDX.W EnemyIndex ; >.<
    STZ.W Enemy.AI,X
    LDX.W EnemyIndex ; >.<
    LDA.W Enemy.properties2,X : ORA.W #$0001 : STA.W Enemy.properties2,X
    RTL


;;; $A070: Switch to frozen AI ;;;
GrappleAI_SwitchToFrozenAI_duplicate:
; Clone of GrappleAI_SwitchToFrozenAI
    LDX.W EnemyIndex
    LDA.W #$0004 : STA.W Enemy.AI,X
    RTL


;;; $A07A: Enemy / Samus collision handling ;;;
Enemy_vs_Samus_CollisionHandling:
; $A091 is the cause of screw attack cancelling invincibility (need to check $9A8B too)
; Not the cause of crystal flash insta-death, that would be $90:D6D6
    PHB
    REP #$30
    PEA EnemyHeaders>>8&$FF00 : PLB : PLB
    LDA.W #$0009 : STA.L EnemyProcessingStage
    LDY.W EnemyIndex
    LDA.W Enemy.spritemap,Y : BEQ .return
    LDA.W ContactDamageIndex : BEQ .normalContactDamage
    STZ.W SamusInvincibilityTimer
    BRA .tangible

  .normalContactDamage:
    LDA.W SamusInvincibilityTimer : BEQ .tangible
    LDX.W EnemyIndex
    LDA.W Enemy.ID,X : CMP.W #EnemyHeaders_Respawn : BNE .return
    LDA.L EnemyTileData,X : BEQ .return
    CMP.W #$0008 : BNE .tangible

  .return:
    PLB
    RTS

  .tangible:
    LDX.W EnemyIndex
    LDY.W Enemy.ID,X
    LDA.W $0030,Y : CMP.W #RTL_A0804C : BEQ ..return
    CMP.W #RTS_A0804B : BNE .hasTouchAI

  ..return:
    PLB
    RTS

  .hasTouchAI:
    LDX.W EnemyIndex
    LDA.W SamusXPosition : SEC : SBC.W Enemy.XPosition,X : BPL +
    EOR.W #$FFFF : INC

+   SEC : SBC.W SamusXRadius : BCC ..Y
    CMP.W Enemy.XHitboxRadius,X : BCS ..return

  ..Y:
    LDA.W SamusYPosition : SEC : SBC.W Enemy.YPosition,X : BPL +
    EOR.W #$FFFF : INC

+   SEC : SBC.W SamusYRadius : BCC +
    CMP.W Enemy.YHitboxRadius,X : BCC +

  ..return:
    PLB
    RTS

+   LDX.W EnemyIndex ; >.<
    LDA.W Enemy.spritemap,X : ASL : STA.B DP_Temp14
    LDX.W EnemyIndex ; >.<
    LDA.W Enemy.ID,X : CMP.W #EnemyHeaders_Respawn : BEQ .gotoExecuteEnemyTouch
    LDY.W EnemyIndex ; >.< TXY
    LDA.W Enemy.freezeTimer,Y : BEQ .gotoExecuteEnemyTouch
    PLB
    RTS

  .gotoExecuteEnemyTouch:
    JSL .executeEnemyTouch
    PLB
    RTS

  .executeEnemyTouch:
; Execute enemy touch
    LDY.W EnemyIndex ; >.<
    LDA.W Enemy.bank,Y : XBA : PHA : PLB : PLB
    LDX.W Enemy.ID,Y
    LDA.L EnemyHeaders_enemyTouch,X : STA.W EnemyAIPointer
    LDA.W Enemy.bank,Y : STA.W EnemyAIPointer+2
    JML.W [EnemyAIPointer]


;;; $A143: Enemy / projectile collision handling ;;;
Enemy_vs_ProjectileCollisionHandling:
    PHB
    LDX.W EnemyIndex
    LDA.W Enemy.bank,X : STA.W EnemyAIPointer+2 : XBA : PHA : PLB : PLB
    LDA.W #$0007 : STA.L EnemyProcessingStage
    LDA.W SamusProjectile_ProjectileCounter : BNE .nonZeroCounter

  .returnUpper:
    PLB
    RTS

  .nonZeroCounter:
    LDY.W EnemyIndex
    LDA.W Enemy.spritemap,Y : BEQ .returnUpper
    CMP.W #Spritemap_Common_Nothing : BEQ .returnUpper
    LDA.W Enemy.properties,Y : BIT.W #$0400 : BNE .returnUpper
    LDA.W Enemy.ID,Y : CMP.W #EnemyHeaders_Respawn : BEQ .returnUpper
    LDA.W Enemy.invincibilityTimer,Y : BNE .returnUpper
    STZ.W CollisionIndex

  .loop:
    LDX.W EnemyIndex ; >.<
    LDA.W CollisionIndex : ASL : TAY
    LDA.W SamusProjectile_Types,Y : BEQ .gotoNextProjectile
    AND.W #$0F00 : CMP.W #$0300 : BEQ .gotoNextProjectile
    CMP.W #$0500 : BEQ .gotoNextProjectile
    CMP.W #$0700 : BMI .validProjectile

  .gotoNextProjectile:
    JMP .nextProjectile

  .validProjectile:
    LDA.W SamusProjectile_XPositions,Y : SEC : SBC.W Enemy.XPosition,X : BPL +
    EOR.W #$FFFF : INC

+   SEC : SBC.W SamusProjectile_XRadii,Y : BCC .Y
    CMP.W Enemy.XHitboxRadius,X : BCS .nextProjectile

  .Y:
    LDA.W SamusProjectile_YPositions,Y : SEC : SBC.W Enemy.YPosition,X : BPL +
    EOR.W #$FFFF : INC

+   SEC : SBC.W SamusProjectile_YRadii,Y : BCC .checkSuper
    CMP.W Enemy.YHitboxRadius,X : BCC .checkSuper
    BRA .nextProjectile

  .checkSuper:
    LDA.W SamusProjectile_Types,Y : AND.W #$0F00 : CMP.W #$0200 : BNE .checkPlasma
    LDA.W #$001E : STA.W EarthquakeTimer
    LDA.W #$0012 : STA.W EarthquakeType

  .checkPlasma:
    LDA.W CollisionIndex : ASL : TAY
    LDX.W EnemyIndex ; >.<
    LDA.W Enemy.properties,X : BIT.W #$1000 : BNE .delete
    LDA.W SamusProjectile_Types,Y : BIT.W #$0008 : BNE .noDelete

  .delete:
    LDA.W SamusProjectile_Directions,Y : ORA.W #$0010 : STA.W SamusProjectile_Directions,Y

  .noDelete:
    JSL .executeEnemyShot
    BRA .returnLower

  .nextProjectile:
    INC.W CollisionIndex
    LDA.W CollisionIndex : CMP.W #$0005 : BEQ .returnLower
    JMP .loop

  .returnLower:
    PLB
    RTS

  .executeEnemyShot:
; Execute enemy shot
    LDY.W EnemyIndex
    LDX.W Enemy.ID,Y
    LDA.L EnemyHeaders_enemyShot,X : STA.W EnemyAIPointer
    JML.W [EnemyAIPointer]


;;; $A236: Enemy / bomb collision handling ;;;
Enemy_vs_Bomb_CollisionHandling:
    PHB
    LDX.W EnemyIndex
    LDA.W Enemy.bank,X : STA.W EnemyAIPointer+2 : XBA : PHA : PLB : PLB
    LDA.W #$0008 : STA.L EnemyProcessingStage
    LDA.W SamusProjectile_BombCounter : BNE .nonZeroCounter

  .returnUpper:
    PLB
    RTS

  .nonZeroCounter:
    LDY.W EnemyIndex
    LDA.W Enemy.spritemap,Y : BEQ .returnUpper
    LDY.W EnemyIndex ; >.<
    LDA.W Enemy.invincibilityTimer,Y : BNE .returnUpper
    LDA.W Enemy.ID,Y : CMP.W #EnemyHeaders_Respawn : BEQ .returnUpper
    LDA.W #$0005 : STA.W CollisionIndex

  .loop:
    LDX.W EnemyIndex ; >.<
    LDA.W CollisionIndex : ASL : TAY
    LDA.W SamusProjectile_Types,Y : BNE .projectileType
    JMP .next

  .projectileType:
    LDA.W SamusProjectile_Variables,Y : BNE .next
    LDA.W SamusProjectile_Types,Y : AND.W #$0F00 : CMP.W #$0500 : BEQ .bomb
    LDA.W SamusProjectile_Types,Y : BIT.W #$8000 : BNE .bomb
    JMP .next

  .bomb:
    LDA.W SamusProjectile_XPositions,Y : SEC : SBC.W Enemy.XPosition,X : BPL +
    EOR.W #$FFFF : INC

+   SEC : SBC.W SamusProjectile_XRadii,Y : BCC .Y
    CMP.W Enemy.XHitboxRadius,X : BCS .next

  .Y:
    LDA.W SamusProjectile_YPositions,Y : SEC : SBC.W Enemy.YPosition,X : BPL +
    EOR.W #$FFFF : INC

+   SEC : SBC.W SamusProjectile_YRadii,Y : BCC +
    CMP.W Enemy.YHitboxRadius,X : BCC +
    BRA .next


+   LDA.W CollisionIndex : ASL : TAY
    LDA.W SamusProjectile_Variables,Y : BNE .next
    LDA.W SamusProjectile_Directions,Y : ORA.W #$0010 : STA.W SamusProjectile_Directions,Y
    JSL .executeEnemyShot
    BRA .returnLower

  .next:
    INC.W CollisionIndex
    LDA.W CollisionIndex : CMP.W #$000A : BEQ .returnLower
    JMP .loop

  .returnLower:
    PLB
    RTS

  .executeEnemyShot:
; Execute enemy shot
    LDY.W EnemyIndex
    LDX.W Enemy.ID,Y
    LDA.L EnemyHeaders_enemyShot,X : STA.W EnemyAIPointer
    JML.W [EnemyAIPointer]


;;; $A306: Process enemy power bomb interaction ;;;
Process_Enemy_PowerBomb_Interaction:
; This routine is relying on $12 and $14 (the calculated power bomb explosion radius) not being modified over the course of the loop(!)
; This doesn't hold true if an enemy is killed by the power bomb (see e.g. $A3E6) >_>;
; For respawning enemies, $12 = 4000h in their enemy death, making power bombs effectively infinite wide for the remaining enemies that frame
; For non-respawning enemies, $12 = 0 in their enemy death, making power bombs effectively zero sized for the remaining enemies that frame
    PHB
    LDA.W #$0005 : STA.L EnemyProcessingStage
    LDA.W SamusProjectile_PowerBombExplosionRadius+1 : AND.W #$00FF : STA.B DP_Temp12 : BNE .hasRadius
    PLB
    RTL

  .hasRadius:
    LSR : ADC.B DP_Temp12 : LSR : STA.B DP_Temp14
    LDA.W #$07C0 : STA.W EnemyIndex

  .loop:
    LDX.W EnemyIndex ; TAX
    LDA.W Enemy.invincibilityTimer,X : BNE .next
    LDA.W Enemy.ID,X : BEQ .next
    CMP.W #EnemyHeaders_Respawn : BEQ .next
    TAX
    LDA.L EnemyHeaders_vulnerabilities,X : BNE +
    LDA.W #EnemyVulnerabilities_Default

+   TAX
    LDA.L EnemyVulnerabilities_powerBomb,X : AND.W #$007F : BEQ .next
    LDX.W EnemyIndex
    LDA.W SamusProjectile_PowerBombExplosionXPosition : SEC : SBC.W Enemy.XPosition,X : BPL +
    EOR.W #$FFFF : INC

+   CMP.B DP_Temp12 : BCS .next
    LDA.W SamusProjectile_PowerBombExplosionYPosition : SEC : SBC.W Enemy.YPosition,X : BPL +
    EOR.W #$FFFF : INC

+   CMP.B DP_Temp14 : BCS .next
    LDA.W Enemy.ID,X : TAX
    LDA.L EnemyHeaders_powerBombReaction,X : BNE .enemyAI
    LDA.W #Common_NormalEnemyPowerBombAI

  .enemyAI:
    STA.W EnemyAIPointer
    JSL .executeEnemyAI
    LDX.W EnemyIndex
    LDA.W Enemy.properties,X : ORA.W #$0800 : STA.W Enemy.properties,X

  .next:
    LDA.W EnemyIndex : SEC : SBC.W #$0040 : STA.W EnemyIndex : BPL .loop
    PLB
    RTL

  .executeEnemyAI:
; Execute enemy AI
    LDX.W EnemyIndex
    LDA.W Enemy.bank,X : STA.W EnemyAIPointer+2 : XBA : PHA : PLB : PLB
    JML.W [EnemyAIPointer]


;;; $A3AF: Enemy death ;;;
EnemyDeath:
;; Parameter:
;;     A: Death animation. Range 0..4
;;         0: Small explosion. Used by grapple killed, power bomb killed, refill candy, fire pillar, boulder, creepy crawlies, skree, Norfair fireball, fireflea, waver, rinka, polyp, fly, owtch, puyo, boyon, zebetite, bang
;;         1: Killed by Samus contact. Also used by bang
;;         2: Normal explosion. Used by super missile killed default, atomic / robot / ghost, bull / floater / oum / yard / fish, fune, sidehopper, desgeega, mochtroid, slug, sciser, metaree, chute, rio, squeept, rio, cacatac
;;         3: Fake Kraid explosion
;;         4: Big explosion. Used by space pirates, Shaktool, ki-hunter, dragon, kago, yapping maw, evir, metroid, super-sidehopper/desgeega, tatori
    PHP : PHB
    PEA EnemyDeath>>8&$FF00 : PLB : PLB ; pointless?
    REP #$30
    PHA
    LDA.W Enemy.AI,X : CMP.W #$0001 : BNE .checkA
    LDA.W #GrappleBeamFunction_Dropped : STA.W GrappleBeam_Function

  .checkA:
    PLA : CMP.W #$0005 : BMI .AIsValid
    LDA.W #$0000

  .AIsValid:
    STA.W Temp_DeathExplosionType
    LDX.W EnemyIndex
    LDY.W #EnemyProjectile_EnemyDeathExplosion
    LDA.W Temp_DeathExplosionType
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    LDA.W Enemy.properties,X : AND.W #$4000 : STA.B DP_Temp12
    LDY.W #$003E
    LDX.W EnemyIndex ; >.<

  .loopClearEnemySlot:
    STZ.W Enemy.ID,X
    INX #2
    DEY #2 : BPL .loopClearEnemySlot
    LDA.B DP_Temp12 : BEQ .incEnemiesKilled
    LDX.W EnemyIndex ; >.<
    LDA.W #EnemyHeaders_Respawn : STA.W Enemy.ID,X
    LDA.W #$00A3 : STA.W Enemy.bank,X

  .incEnemiesKilled:
    INC.W NumberOfEnemiesKilled
    PLB : PLP
    RTL


;;; $A410: Rinka death ;;;
RinkaDeath:
;; Parameter:
;;     A: Death animation. Range 0..4
;;         0/3/4: Small explosion
;;         1: Killed by Samus contact
;;         2: Normal explosion
    PHP : PHB
    PEA RinkaDeath>>8&$FF00
    PLB : PLB ; pointless
    REP #$30
    CMP.W #$0003 : BMI .AIsValid
    LDA.W #$0000

  .AIsValid:
    STA.W Temp_DeathExplosionType
    LDX.W EnemyIndex
    LDY.W #EnemyProjectile_EnemyDeathExplosion
    LDA.W Temp_DeathExplosionType
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    LDA.W Enemy.properties,X : AND.W #$4000 : STA.B DP_Temp12
    LDY.W #$003E
    LDX.W EnemyIndex

  .loopClearEnemySlot:
    STZ.W Enemy.ID,X
    INX #2
    DEY #2 : BPL .loopClearEnemySlot
    LDA.B DP_Temp12 : BEQ .return
    LDX.W EnemyIndex ; >.<
    LDA.W #EnemyHeaders_Respawn : STA.W Enemy.ID,X
    LDA.W #$00A3 : STA.W Enemy.bank,X

  .return:
    PLB : PLP
    RTL


;;; $A45E: Suit damage division ;;;
Suit_Damage_Division:
;; Parameter:
;;     A: Damage
;; Returns:
;;     A/$12: Damage divided by 1/2/4 if power/varia/gravity suit equipped
    STA.B DP_Temp12
    LDA.W $09A2 : BIT.W #$0020 : BNE .quarterDamage
    LSR : BCC .fullDamage
    LSR.B DP_Temp12

  .fullDamage:
    LDA.B DP_Temp12
    RTL

  .quarterDamage:
    ; >.< LDA $12 : LSR #2 : STA $12
    LSR.B DP_Temp12 : LSR.B DP_Temp12
    LDA.B DP_Temp12
    RTL


;;; $A477: Normal enemy touch AI ;;;
NormalEnemyTouchAI:
    LDX.W EnemyIndex
    JSR NormalEnemyTouchAI_NoDeathCheck
    LDX.W EnemyIndex
    LDA.W Enemy.health,X : BNE .return
    LDA.W #$0006 : STA.L EnemyTileData+2,X
    LDA.W #$0001
    JSL EnemyDeath

  .return:
    LDX.W EnemyIndex
    RTL


;;; $A497: Normal enemy touch AI - no death check (external) ;;;
NormalEnemyTouchAI_NoDeathCheck_External:
    LDX.W EnemyIndex
    JSR NormalEnemyTouchAI_NoDeathCheck
    LDX.W EnemyIndex
    RTL


;;; $A4A1: Normal enemy touch AI - no death check ;;;
NormalEnemyTouchAI_NoDeathCheck:
; Damage values:
;     Speed boosting:      $A4AF
;     Shinesparking:       $A4BA
;     Screw attack:        $A4C2
;     Pseudo screw attack: $A4CC
    LDA.W ContactDamageIndex : BNE .notNormal
    JMP .normalSamus

  .notNormal:
    CLC : ADC.W #$000F : STA.B DP_Temp14
    LDY.W #$01F4
    LDA.W ContactDamageIndex : CMP.W #$0001 : BEQ .damageCalculated
    LDY.W #$012C
    CMP.W #$0002 : BEQ .damageCalculated
    LDY.W #$07D0
    CMP.W #$0003 : BEQ .damageCalculated
    INC.B DP_Temp14
    LDY.W #$00C8
    CMP.W #$0004 : BNE .defaultDamage
    LDA.W #$0004
    JSL Run_Samus_Command
    BRA .damageCalculated

  .defaultDamage:
    LDY.W #$00C8

  .damageCalculated:
    STY.B DP_Temp16
    LDX.W EnemyIndex
    LDA.W Enemy.ID,X : TAX
    LDA.L EnemyHeaders_vulnerabilities,X : BNE .nonZero
    LDA.W #EnemyVulnerabilities_Default

  .nonZero:
    CLC : ADC.B DP_Temp14 : TAX
    LDA.L EnemyVulnerabilities_power,X : STA.W Temp_BeamVulnerability
    AND.W #$007F : STA.W Temp_DamageMultiplier : BEQ .return
    CMP.W #$00FF : BEQ .return
    LDA.W Temp_DamageMultiplier : STA.B DP_Temp28
    LDA.B DP_Temp16 : LSR : STA.B DP_Temp26
    JSL Multiplication_32bit_A0B6FF
    LDA.B DP_Temp2A : BEQ .return
    STA.B DP_Temp12
    BRA .damage

  .return:
    RTS

  .damage:
    LDX.W EnemyIndex : LDX.W EnemyIndex ; >_<
    LDA.W Enemy.ID,X : TAX
    LDA.L EnemyHeaders_hurtAITime,X : AND.W #$00FF : BNE .hurtTimerNotExpired
    LDA.W #$0004

  .hurtTimerNotExpired:
    LDX.W EnemyIndex
    STA.W Enemy.flashTimer,X
    LDA.W Enemy.AI,X : ORA.W #$0002 : STA.W Enemy.AI,X
    STZ.W SamusInvincibilityTimer : STZ.W SamusKnockbackTimer
    LDA.W Enemy.health,X : SEC : SBC.B DP_Temp12 : BPL .storeHealth
    LDA.W #$0000

  .storeHealth:
    STA.W Enemy.health,X
    LDA.W #$000B
    JSL QueueSound_Lib2_Max1
    RTS

  .normalSamus:
    LDX.W EnemyIndex
    LDA.W Enemy.ID,X : TAX
    LDA.L EnemyHeaders_damage,X
    JSL Suit_Damage_Division
    JSL Deal_A_Damage_to_Samus
    LDA.W #$0060 : STA.W SamusInvincibilityTimer
    LDA.W #$0005 : STA.W SamusKnockbackTimer
    LDY.W #$0000
    LDX.W EnemyIndex
    LDA.W SamusXPosition : SEC : SBC.W Enemy.XPosition,X : BMI .storeKnockbackDirection
    LDY.W #$0001

  .storeKnockbackDirection:
    STY.W KnockbackXDirection
    RTS


;;; $A597: Normal enemy power bomb AI ;;;
NormalEnemyPowerBombAI:
    LDX.W EnemyIndex
    JSR NormalEnemyPowerBombAI_NoDeathCheck
    LDX.W EnemyIndex
    LDA.W Enemy.health,X : BNE .return
    LDA.W #$0003 : STA.L EnemyTileData+2,X
    LDA.W #$0000
    JSL EnemyDeath

  .return:
    LDX.W EnemyIndex
    RTL


;;; $A5B7: Normal enemy power bomb AI - no death check (external) ;;;
NormalEnemyPowerBombAI_NoDeathCheck_External:
; Called by rinka, fake Kraid, Kraid, Draygon, Ridley, Mother Brain
    LDX.W EnemyIndex
    JSR NormalEnemyPowerBombAI_NoDeathCheck
    LDX.W EnemyIndex
    RTL


;;; $A5C1: Normal enemy power bomb AI - no death check ;;;
NormalEnemyPowerBombAI_NoDeathCheck:
    LDX.W EnemyIndex
    LDA.W Enemy.ID,X : TAX
    LDA.L EnemyHeaders_vulnerabilities,X : BNE .XNonZero
    LDA.W #EnemyVulnerabilities_Default

  .XNonZero:
    TAX
    LDA.L EnemyVulnerabilities_powerBomb,X : AND.W #$00FF : CMP.W #$00FF : BEQ .return
    AND.W #$007F : STA.W Temp_DamageMultiplier : BEQ .return
    LDA.W #$00C8 : LSR : STA.B DP_Temp26 ; >.<
    LDA.W Temp_DamageMultiplier : STA.B DP_Temp28
    JSL Multiplication_32bit_A0B6FF
    LDA.B DP_Temp2A : STA.W EnemySpritemapEntryXPositionDuringCollision : BEQ .return
    LDX.W EnemyIndex
    LDA.W #$0030 : STA.W Enemy.invincibilityTimer,X
    LDX.W EnemyIndex ; >.<
    LDA.W Enemy.ID,X : TAX
    LDA.L EnemyHeaders_hurtAITime,X : AND.W #$00FF : BNE .ANonZero
    LDA.W #$0004

  .ANonZero:
    CLC : ADC.W #$0008
    LDX.W EnemyIndex
    STA.W Enemy.flashTimer,X
    LDA.W Enemy.AI,X : ORA.W #$0002 : STA.W Enemy.AI,X
    LDA.W Enemy.health,X : SEC : SBC.W EnemySpritemapEntryXPositionDuringCollision : BEQ .zeroHealth
    BCS .storeHealth

  .zeroHealth:
    LDA.W #$0000

  .storeHealth:
    STA.W Enemy.health,X

  .return:
    RTS


;;; $A63D: Normal enemy shot AI ;;;
NormalEnemyShotAI:
    STZ.W Temp_ShotAIHitFlag
    LDX.W EnemyIndex
    JSR NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic
    LDX.W EnemyIndex
    LDA.W Temp_ShotAIHitFlag : BEQ .notHit
    LDX.W EnemyIndex ; >.<
    LDA.W Enemy.XPosition,X : STA.B DP_Temp12
    LDA.W Enemy.YPosition,X : STA.B DP_Temp14
    LDA.W #$0037 : STA.B DP_Temp16
    STZ.B DP_Temp18
    JSL Create_Sprite_Object

  .notHit:
    LDA.W Enemy.health,X : BNE .return
    LDA.W CollisionIndex : ASL : TAY
    LDA.W SamusProjectile_Types,Y : XBA : AND.W #$000F : STA.L EnemyTileData+2,X
    LDY.W #$0002
    CMP.W #$0002 : BEQ .superMissile
    LDA.W Enemy.ID,X : TAX
    LDA.L EnemyHeaders_deathAnimation,X : BEQ .deathAnimationInY

  .deathAnimationInY:
    TAY
    BRA .enemyDeath

  .superMissile:
    LDA.W Enemy.ID,X : TAX
    LDA.L EnemyHeaders_deathAnimation,X : CMP.W #$0003 : BMI .enemyDeath
    TAY

  .enemyDeath:
    TYA
    JSL EnemyDeath

  .return:
    LDX.W EnemyIndex
    RTL


;;; $A6A7: Normal enemy shot AI - no death check, no enemy shot graphic (external) ;;;
NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External:
    STZ.W Temp_ShotAIHitFlag
    LDX.W EnemyIndex
    JSR NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic
    LDX.W EnemyIndex
    RTL


;;; $A6B4: Normal enemy shot AI - no death check ;;;
NormalEnemyShotAI_NoDeathCheck:
; Used by Spore Spawn
; Shame it's not used by NormalEnemyShotAI
    STZ.W Temp_ShotAIHitFlag
    LDX.W EnemyIndex
    JSR NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic
    LDA.W Temp_ShotAIHitFlag : BEQ .return
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : STA.B DP_Temp12
    LDA.W Enemy.YPosition,X : STA.B DP_Temp14
    LDA.W #$0037 : STA.B DP_Temp16 : STZ.B DP_Temp18
    JSL Create_Sprite_Object

  .return:
    LDX.W EnemyIndex
    RTL


;;; $A6DE: Normal enemy shot AI - no death check, no enemy shot graphic ;;;
NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic:
; Vulnerability format:
;     v = f000dddd
;     If v = FFh:
;         Freeze, no damage
;     Else:
;         d: Damage multiplier * 2
;         f: Does not freeze
    PHB
    LDA.W CollisionIndex : ASL : TAX
    LDA.W SamusProjectile_Damages,X : STA.W EnemySpritemapEntryXPositionDuringCollision
    LDA.W SamusProjectile_Types,X : STA.B DP_Temp12
    PHX
    LDX.W EnemyIndex
    LDA.W Enemy.ID,X : TAX
    LDA.L EnemyHeaders_vulnerabilities,X : BNE .nonZero
    LDA.W #EnemyVulnerabilities_Default

  .nonZero:
    STA.B DP_Temp14
    LDA.B DP_Temp12 : BIT.W #$0F00 : BNE .notBeam
    LDA.B DP_Temp12 : AND.W #$000F : CLC : ADC.B DP_Temp14 : TAX
    LDA.L EnemyVulnerabilities_power,X : AND.W #$00FF : STA.W Temp_BeamVulnerability
    AND.W #$007F : STA.W Temp_DamageMultiplier
    LDA.W Temp_BeamVulnerability : CMP.W #$00FF : BNE .checkCharge
    JMP .freeze

  .checkCharge:
    LDA.B DP_Temp12 : BIT.W #$0010 : BEQ .calculateDamage
    LDX.B DP_Temp14
    LDA.L EnemyVulnerabilities_chargedBeam,X : AND.W #$00FF : CMP.W #$00FF : BEQ .noDamage
    AND.W #$000F : BEQ .noDamage
    STA.W Temp_DamageMultiplier

  .calculateDamage:
    LDA.W EnemySpritemapEntryXPositionDuringCollision : LSR : STA.B DP_Temp26
    LDA.W Temp_DamageMultiplier : STA.B DP_Temp28
    JSL Multiplication_32bit_A0B6FF
    LDA.B DP_Temp2A : BEQ .noDamage
    STA.W EnemySpritemapEntryXPositionDuringCollision
    JMP .damage

  .notBeam:
    AND.W #$0F00 : CMP.W #$0100 : BEQ +
    CMP.W #$0200 : BNE .notMissile

+   XBA : CLC : ADC.B DP_Temp14 : TAX
    LDA.L EnemyVulnerabilities_plasmaIceWave,X : AND.W #$007F : STA.W Temp_DamageMultiplier
    BRA .calculateDamage

  .notMissile:
    CMP.W #$0500 : BNE .checkPowerBomb
    LDX.B DP_Temp14
    LDA.L EnemyVulnerabilities_bomb,X : AND.W #$007F : STA.W Temp_DamageMultiplier
    BRA .calculateDamage

  .checkPowerBomb:
    CMP.W #$0300 : BNE .noDamage
    LDX.B DP_Temp14
    LDA.L EnemyVulnerabilities_powerBomb,X : AND.W #$007F : STA.W Temp_DamageMultiplier
    JMP .calculateDamage

  .noDamage:
    LDA.W CollisionIndex : ASL : TAX
    LDA.W SamusProjectile_Directions,X : ORA.W #$0010 : STA.W SamusProjectile_Directions,X
    LDA.W SamusProjectile_XPositions,X : STA.B DP_Temp12
    LDA.W SamusProjectile_YPositions,X : STA.B DP_Temp14
    LDA.W #$0006 : STA.B DP_Temp16
    STZ.B DP_Temp18
    JSL Create_Sprite_Object
    LDA.W #$003D
    JSL QueueSound_Lib1_Max3
    PLX : PLB
    RTS

  .freeze:
    LDX.W EnemyIndex
    LDA.W Enemy.freezeTimer,X : BNE .timerNotExpired
    LDA.W #$000A
    JSL QueueSound_Lib3_Max3

  .timerNotExpired:
    LDY.W #$0190
    LDA.W AreaIndex : CMP.W #$0002 : BNE .notNorfair
    LDY.W #$012C

  .notNorfair:
    TYA : STA.W Enemy.freezeTimer,X
    LDA.W Enemy.AI,X : ORA.W #$0004 : STA.W Enemy.AI,X
    LDA.W #$000A : STA.W Enemy.invincibilityTimer,X
    PLX : PLB
    RTS

  .damage:
    PLX
    LDX.W EnemyIndex : LDX.W EnemyIndex ; >.<
    LDA.W Enemy.ID,X : TAX
    LDA.L EnemyHeaders_hurtAITime,X : AND.W #$00FF : BNE +
    LDA.W #$0004

+   CLC : ADC.W #$0008
    LDX.W EnemyIndex
    STA.W Enemy.flashTimer,X
    LDA.W Enemy.AI,X : ORA.W #$0002 : STA.W Enemy.AI,X
    LDA.W Enemy.freezeTimer,X : BNE .noFlashNoCry
    PHX : PHY
    LDA.W Enemy.ID,X : TAX
    LDA.L EnemyHeaders_cry,X : BEQ .setEnemyHit
    JSL QueueSound_Lib2_Max3

  .setEnemyHit:
    PLY : PLX
    INC.W Temp_ShotAIHitFlag

  .noFlashNoCry:
    LDX.W EnemyIndex ; >.<
    LDA.W CollisionIndex : ASL : TAY
    LDA.W SamusProjectile_Types,Y : BIT.W #$0008 : BEQ .notPlasma
    LDA.W #$0010 : STA.W Enemy.invincibilityTimer,X

  .notPlasma:
    LDA.W Enemy.health,X : SEC : SBC.W EnemySpritemapEntryXPositionDuringCollision : BEQ .checkKill
    BCS .return

  .checkKill:
    LDA.W CollisionIndex : ASL : TAY
    LDA.W SamusProjectile_Types,Y : AND.W #$0002 : BEQ .enemyHealthZero
    LDA.W Temp_BeamVulnerability : AND.W #$00F0 : CMP.W #$0080 : BEQ .enemyHealthZero
    LDA.W Enemy.freezeTimer,X : BNE .enemyHealthZero
    LDY.W #$0190
    LDA.W AreaIndex : CMP.W #$0002 : BNE ..notNorfair
    LDY.W #$012C

  ..notNorfair:
    TYA : STA.W Enemy.freezeTimer,X
    LDA.W Enemy.AI,X : ORA.W #$0004 : STA.W Enemy.AI,X
    LDA.W #$000A : STA.W Enemy.invincibilityTimer,X
    LDA.W #$000A
    JSL QueueSound_Lib3_Max3
    PLB
    RTS

  .enemyHealthZero:
    LDA.W #$0000

  .return:
    STA.W Enemy.health,X
    PLB
    RTS


;;; $A8BC: Creates a dud shot ;;;
CreateADudShot:
    PHX : PHY
    LDA.W CollisionIndex : ASL : TAX
    LDA.W SamusProjectile_XPositions,X : STA.B DP_Temp12
    LDA.W SamusProjectile_YPositions,X : STA.B DP_Temp14
    LDA.W #$0006 : STA.B DP_Temp16
    STZ.B DP_Temp18
    JSL Create_Sprite_Object
    LDA.W #$003D
    JSL QueueSound_Lib1_Max3
    LDA.W CollisionIndex : ASL : TAX
    LDA.W SamusProjectile_Directions,X : ORA.W #$0010 : STA.W SamusProjectile_Directions,X
    PLY : PLX
    RTL


;;; $A8F0: Samus / solid enemy collision detection ;;;
Samus_vs_SolidEnemy_CollisionDetection:
;; Parameters:
;;     $12.$14: Distance to check for collision
;; Returns:
;;     A: FFFFh if collision detected, 0 otherwise
;;     $12: If collision detected: distance to collision
;;     $14: If collision detected: 0
;;     $16: If collision detected: index of colliding enemy

; Solid enemy means an interactive enemy (InteractiveEnemyIndices) that is either frozen or whose hitbox is solid to Samus ([enemy properties] & 8000h != 0)
; If Samus is already partly within a solid enemy, that doesn't count as a collision

; Amazingly, there are no subroutine calls in here

; This routine considers it a collision if Samus' front boundary is one pixel in front of an enemy's front boundary,
; which seems to be important for moving solid enemies
; (otherwise if this routine were called with [$12].[$14] = 0.0, no collision would be detected even if the enemy is moving towards Samus)
; If you NOP'd out the INC at $A9A9 for example, you can do a short hop on one of the rising platform enemies and fall straight through

; The BEQs at $A931/A959/A980/A9A7 I can't make sense of based on the above logic. Seems like the increments/decrements should be unconditional
; Perhaps it affects the logic for choosing between .touching and .notTouching(?) Didn't notice any jank when NOP'ing the BEQs

; On the zebetite skip:
; The way this behaviour is implemented is effectively just incrementing the $12 parameter (unfortunately not written so straight forwardly)
; Consequently, Samus can collide with enemies one pixel further than she should be able to reach (i.e. one pixel further than in block collision),
; which explains why Samus collides with the frozen rinka in the zebetite skip, even though it's 2 pixels deep into the wall
; Because a collision is reported in this case, no Samus block collision detection is done, meaning Samus doesn't collide with the wall,
; and because the zebetite's right boundary is aligned with the wall (one pixel further right than the rinka's),
; Samus is now horizontally inside the zebetite, and so no horizontal collision will be detected due to the zebetite
    PHP : PHB
    PEA Samus_vs_SolidEnemy_CollisionDetection>>8&$FF00 : PLB : PLB ; pointless?
    REP #$30
    LDA.W InteractiveEnemyIndicesStackPointer : BEQ .returnZeroUpper
    BRA .execute

  .returnZeroUpper:
    LDA.W #$0000
    PLB : PLP
    RTL

  .execute:
    LDA.W CollisionMovementDirection : AND.W #$0003 : ASL : TAX
    JMP.W (.pointers,X)

  .pointers:
    dw .left
    dw .right
    dw .up
    dw .down

  .left:
    LDA.B DP_Temp12 : EOR.W #$FFFF : INC
    CLC : ADC.W SamusXPosition : STA.W SamusTargetXPosition
    LDA.W SamusXSubPosition : SEC : SBC.B DP_Temp14 : BCS ..checkTargetSubposition
    DEC.W SamusTargetXPosition

  ..checkTargetSubposition:
    BEQ ..zeroTarget
    DEC.W SamusTargetXPosition

  ..zeroTarget:
    LDA.W SamusYPosition : STA.W SamusTargetYPosition
    LDA.W SamusYSubPosition : STA.W SamusTargetYSubPosition
    JMP .targetPositionSet

  .right:
    LDA.B DP_Temp12 : CLC : ADC.W SamusXPosition : STA.W SamusTargetXPosition
    LDA.B DP_Temp14 : CLC : ADC.W SamusXSubPosition : BCC ..checkTargetSubposition
    INC.W SamusTargetXPosition

  ..checkTargetSubposition:
    BEQ ..zeroTarget
    INC.W SamusTargetXPosition

  ..zeroTarget:
    LDA.W SamusYPosition : STA.W SamusTargetYPosition
    LDA.W SamusYSubPosition : STA.W SamusTargetYSubPosition
    BRA .targetPositionSet

  .up:
    LDA.W SamusYPosition : SEC : SBC.B DP_Temp12 : STA.W SamusTargetYPosition
    LDA.W SamusYSubPosition : SEC : SBC.B DP_Temp14 : BCS ..checkTargetSubposition
    DEC.W SamusTargetYPosition

  ..checkTargetSubposition:
    BEQ ..zeroTarget
    DEC.W SamusTargetYPosition

  ..zeroTarget:
    LDA.W SamusXPosition : STA.W SamusTargetXPosition
    LDA.W SamusXSubPosition : STA.W SamusTargetXSubPosition
    BRA .targetPositionSet

  .down:
    LDA.B DP_Temp12 : CLC : ADC.W SamusYPosition : STA.W SamusTargetYPosition
    LDA.B DP_Temp14 : CLC : ADC.W SamusYSubPosition : BCC ..checkTargetSubposition
    INC.W SamusTargetYPosition

  ..checkTargetSubposition:
    BEQ ..zeroTarget
    INC.W SamusTargetYPosition

  ..zeroTarget:
    LDA.W SamusXPosition : STA.W SamusTargetXPosition
    LDA.W SamusXSubPosition : STA.W SamusTargetXSubPosition

  .targetPositionSet:
    LDA.W SamusXRadius : STA.W SamusXRadiusMirror
    LDA.W SamusYRadius : STA.W SamusYRadiusMirror
    STZ.W CollisionIndex : STZ.W InteractiveEnemyIndicesIndex

  .loop:
    LDY.W InteractiveEnemyIndicesIndex
    LDA.W InteractiveEnemyIndices,Y : CMP.W #$FFFF : BNE .valid
    JMP .returnZeroLower

  .valid:
    STA.W CollisionIndex
    TAX
    LDA.W Enemy.freezeTimer,X : BNE .notFrozenNotSolid
    LDA.W Enemy.properties,X : BIT.W #$8000 : BNE .notFrozenNotSolid
    JMP .next

  .notFrozenNotSolid:
    TXA : CLC : ADC.W #Enemy.XPosition : TAX
    LDY.W #SamusTargetXPosition
    LDA.B DP_Temp00,X : SEC : SBC.W $0000,Y : BPL +
    EOR.W #$FFFF : INC

+   SEC : SBC.B DP_Temp08,X : BCC .checkY
    CMP.W $0008,Y : BCS .gotoNext

  .checkY:
    LDA.B DP_Temp04,X : SEC : SBC.W $0004,Y : BPL +
    EOR.W #$FFFF : INC

+   SEC : SBC.B DP_Temp0A,X : BCC .collision
    CMP.W $000A,Y : BCC .collision

  .gotoNext:
    JMP .next

  .collision:
    LDA.W CollisionMovementDirection : AND.W #$0003 : ASL : TAX
    JMP.W (.collisionPointers,X)

  .collisionPointers:
    dw .collisionLeft
    dw .collisionRight
    dw .collisionUp
    dw .collisionDown

  .collisionLeft:
    LDX.W CollisionIndex
    LDA.W Enemy.XPosition,X : CLC : ADC.W Enemy.XHitboxRadius,X : STA.W Temp_RightBottomBoundaryPosition
    LDA.W SamusXPosition : SEC : SBC.W SamusXRadius
    SEC : SBC.W Temp_RightBottomBoundaryPosition : BEQ ..gotoTouching
    BPL ..gotoNotTouching
    JMP .gotoNextLower

  ..gotoNotTouching:
    JMP .notTouching

  ..gotoTouching:
    JMP .touching

  .collisionRight:
    LDX.W CollisionIndex
    LDA.W SamusXPosition : CLC : ADC.W SamusXRadius : STA.W Temp_RightBottomBoundaryPosition
    LDA.W Enemy.XPosition,X : SEC : SBC.W Enemy.XHitboxRadius,X
    SEC : SBC.W Temp_RightBottomBoundaryPosition : BEQ .touching
    BPL ..gotoNotTouching
    JMP .gotoNextLower

  ..gotoNotTouching:
    JMP .notTouching

  .collisionUp:
    LDX.W CollisionIndex
    LDA.W Enemy.YPosition,X : CLC : ADC.W Enemy.YHitboxRadius,X : STA.W Temp_RightBottomBoundaryPosition
    LDA.W SamusYPosition : SEC : SBC.W SamusYRadius
    SEC : SBC.W Temp_RightBottomBoundaryPosition : BEQ .touching
    BPL ..gotoNotTouching
    JMP .gotoNextLower

  ..gotoNotTouching:
    JMP .notTouching

  .collisionDown:
    LDX.W CollisionIndex
    LDA.W SamusYPosition : CLC : ADC.W SamusYRadius : STA.W Temp_RightBottomBoundaryPosition
    LDA.W Enemy.YPosition,X : SEC : SBC.W Enemy.YHitboxRadius,X
    SEC : SBC.W Temp_RightBottomBoundaryPosition : BEQ .touching
    BPL .notTouching
    JMP .gotoNextLower

  .next:
    INC.W InteractiveEnemyIndicesIndex
    INC.W InteractiveEnemyIndicesIndex
    JMP .loop

  .touching:
    STZ.W SamusYSubPosition
    LDX.W CollisionIndex
    LDA.W SamusXPosition : STA.W neverRead184A
    LDA.W SamusXSubPosition : STA.W neverRead184C
    LDA.W Enemy.XPosition,X : STA.W neverRead184E
    LDA.W Enemy.XSubPosition,X : STA.W neverRead1850
    LDA.B DP_Temp12 : STA.W neverRead1852
    LDA.B DP_Temp14 : STA.W neverRead1854
    LDA.W SamusYPosition : STA.W neverRead1856
    LDA.W SamusYSubPosition : STA.W neverRead1858
    LDA.W #$0001 : STA.W neverRead185A
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W CollisionIndex : STA.B DP_Temp16
    LDA.W CollisionMovementDirection : AND.W #$0003 : ASL : TAX
    LDA.W CollisionIndex : STA.W EnemyIndexSamusCollidesLeft,X
    STZ.W neverRead1834,X
    LDA.W #$FFFF
    PLB : PLP
    RTL

  .notTouching:
    PHA
    LDX.W CollisionIndex
    LDA.W SamusXPosition : STA.W neverRead184A
    LDA.W SamusXSubPosition : STA.W neverRead184C
    LDA.W Enemy.XPosition,X : STA.W neverRead184E
    LDA.W Enemy.XSubPosition,X : STA.W neverRead1850
    LDA.B DP_Temp12 : STA.W neverRead1852
    LDA.B DP_Temp14 : STA.W neverRead1854
    LDA.W SamusYPosition : STA.W neverRead1856
    LDA.W SamusYSubPosition : STA.W neverRead1858
    LDA.W #$0002 : STA.W neverRead185A
    LDA.W CollisionMovementDirection : AND.W #$0003 : ASL : TAX
    PLA : STA.B DP_Temp12 : STA.W neverRead1834,X
    STZ.B DP_Temp14
    LDA.W CollisionIndex : STA.B DP_Temp16
    LDA.W CollisionIndex : STA.W EnemyIndexSamusCollidesLeft,X ; >.<
    LDA.W #$FFFF
    PLB : PLP
    RTL

  .returnZeroLower:
    LDA.W #$0000
    PLB : PLP
    RTL

  .gotoNextLower:
    JMP .next

if !FEATURE_KEEP_UNREFERENCED
  .unused:
    PHA
    LDX.W CollisionIndex
    LDA.W SamusXPosition : STA.W neverRead184A
    LDA.W SamusXSubPosition : STA.W neverRead184C
    LDA.W Enemy.XPosition,X : STA.W neverRead184E
    LDA.W Enemy.XSubPosition,X : STA.W neverRead1850
    LDA.B DP_Temp12 : STA.W neverRead1852
    LDA.B DP_Temp14 : STA.W neverRead1854
    LDA.W SamusYPosition : STA.W neverRead1856
    LDA.W SamusYSubPosition : STA.W neverRead1858
    LDA.W #$0003 : STA.W neverRead185A
    LDA.W CollisionMovementDirection : AND.W #$0003 : ASL : TAX
    PLA : EOR.W #$FFFF : INC : STA.B DP_Temp12 : STA.W neverRead1834,X
    STZ.B DP_Temp14
    LDA.W CollisionIndex : STA.B DP_Temp16
    LDA.W CollisionIndex : STA.W EnemyIndexSamusCollidesLeft,X
    LDA.W #$FFFF
    PLB : PLP
    RTL

  ..return:
    LDA.W #$0000
    PLB : PLP
    RTL
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $ABE7: Check if enemy is touching Samus from below ;;;
CheckIfEnemyIsTouchingSamusFromBelow:
;; Returns:
;;     A: FFFFh if touching Samus, otherwise 0
    LDA.W SamusXPosition : SEC : SBC.W Enemy.XPosition,X : BPL +
    EOR.W #$FFFF : INC

+   SEC : SBC.W SamusXRadius : BCC .checkY
    CMP.W Enemy.XHitboxRadius,X : BCC .checkY
    LDA.W #$0000
    RTL

  .checkY:
    LDA.W SamusYPosition : CLC : ADC.W #$0003
    SEC : SBC.W Enemy.YPosition,X : BPL .noTouch
    EOR.W #$FFFF : INC
    SEC : SBC.W SamusYRadius : BCC .touching
    CMP.W Enemy.YHitboxRadius,X : BEQ .touching
    BCC .touching

  .noTouch:
    LDA.W #$0000
    RTL

  .touching:
    LDA.W #$FFFF
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $AC29: Unused. Check if Samus is touching enemy from above ;;;
UNUSED_CheckIfEnemyIsTouchingSamusFromAbove_A0AC29:
;; Returns:
;;     A: FFFFh if touching Samus, otherwise 0
    LDA.W SamusXPosition : SEC : SBC.W Enemy.XPosition,X : BPL +
    EOR.W #$FFFF : INC

+   SEC : SBC.W SamusXRadius : BCC .checkY
    CMP.W Enemy.XHitboxRadius,X : BCC .checkY
    LDA.W #$0000
    RTL

  .checkY:
    LDA.W SamusYPosition : SEC : SBC.W Enemy.YPosition,X : BPL .noTouch
    EOR.W #$FFFF : INC
    SEC : SBC.W SamusYRadius : BCC .touching
    CMP.W Enemy.YHitboxRadius,X : BEQ .touching
    BCC .touching

  .noTouch:
    LDA.W #$0000
    RTL

  .touching:
    LDA.W #$FFFF
    RTL
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $AC67: Check if enemy is touching Samus ;;;
CheckIfEnemyIsTouchingSamus:
;; Returns:
;;     A: FFFFh if touching Samus, otherwise 0
    LDA.W SamusXPosition : SEC : SBC.W Enemy.XPosition,X : BPL +
    EOR.W #$FFFF : INC

+   SEC : SBC.W SamusXRadius : BCC .checkY
    CMP.W Enemy.XHitboxRadius,X : BCC .checkY
    CMP.W #$0008 : BCC .checkY
    LDA.W #$0000
    RTL

  .checkY:
    LDA.W SamusYPosition : SEC : SBC.W Enemy.YPosition,X : BPL +
    EOR.W #$FFFF : INC

+   SEC : SBC.W SamusYRadius : BCC .touching
    CMP.W Enemy.YHitboxRadius,X : BCC .touching
    LDA.W #$0000
    RTL

  .touching:
    LDA.W #$FFFF
    RTL


;;; $ACA8: Calculate distance and angle of Samus from enemy ;;;
CalculateDistanceAndAngleOfSamusFromEnemy:
;; Parameters:
;;     Temp_XPosition: Enemy X position
;;     Temp_YPosition: Enemy Y position
;;     Temp_SamusXPosition: Samus X position
;;     Temp_SamusYPosition: Samus Y position
;; Returns:
;;     Carry: Set if error, clear otherwise
;;     A: If carry clear, distance from enemy to Samus
;;     $0E3A: If carry clear, angle from enemy to Samus

; Called by yapping maw only
; Avoids sqrt and division operations with the identity
;     sqrt(x² + y²) = x cos(arctan(x, y)) + y sin(arctan(x, y))
; (tweaked to account for SM's angle convention)
; Slightly unfortunate second call to $C0AE, would have been sufficient to call it once to get $0E3A and normalise the quadrant with
;     LDA $0E3A : AND #$007F : CMP #$0040 : BCS + : EOR #$007F : INC : + : STA $0E24
    PHX : PHY
    LDA.W Temp_SamusXPosition : SEC : SBC.W Temp_XPosition : STA.W Temp_XDistanceFromEnemyToSamus : BPL +
    EOR.W #$FFFF : INC

+   CMP.W #$00FF : BPL .returnError
    STA.B DP_Temp12 : STA.W Temp_AbsoluteXDistanceFromEnemyToSamus
    LDA.W Temp_SamusYPosition : SEC
    SBC.W Temp_YPosition : STA.W Temp_YDistanceFromEnemyToSamus : BPL +
    EOR.W #$FFFF : INC

+   CMP.W #$00FF : BPL .returnError
    STA.B DP_Temp14 : STA.W Temp_AbsoluteYDistanceFromEnemyToSamus
    JSL CalculateAngleOf_12_14_Offset
    STA.W Temp_AngleFromEnemyToSamusReflectedDownRight
    LDA.W Temp_AbsoluteXDistanceFromEnemyToSamus : STA.W Temp_XPosition
    LDA.W Temp_AngleFromEnemyToSamusReflectedDownRight
    JSL EightBitNegativeSineMultiplication_A0B0C6
    BIT.W #$8000 : BEQ +
    EOR.W #$FFFF : INC

+   STA.W Temp_XSquaredDividedByRadius
    LDA.W Temp_AbsoluteYDistanceFromEnemyToSamus : STA.W Temp_XPosition
    LDA.W Temp_AngleFromEnemyToSamusReflectedDownRight
    JSL EightBitCosineMultiplication_A0B0B2
    BIT.W #$8000 : BEQ +
    EOR.W #$FFFF : INC

+   CLC : ADC.W Temp_XSquaredDividedByRadius : PHA
    LDA.W Temp_XDistanceFromEnemyToSamus : STA.B DP_Temp12
    LDA.W Temp_YDistanceFromEnemyToSamus : STA.B DP_Temp14
    JSL CalculateAngleOf_12_14_Offset
    STA.W Temp_AngleFromEnemyToSamus
    PLA : PLY : PLX
    CLC
    RTL

  .returnError:
    PLY : PLX : SEC
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $AD33: Unused. Enemy.var4 = max(0, Enemy.var4 - 1). If Enemy.var4 = 0, A = 1, else A = 0 ;;;
UNUSED_EnemyVariable_ZeroOrMax_A0AD33:
    PHB
    SEP #$20
    LDA.B #UNUSED_EnemyVariable_ZeroOrMax_A0AD33>>16 : PHA : PLB
    REP #$30
    LDA.W Enemy.var4,X : BEQ UNUSED_SignedA_ZeroIsSpecialCase_A0AD4A
    DEC.W Enemy.var4,X : BEQ UNUSED_SignedA_ZeroIsSpecialCase_A0AD4A
    LDA.W #$0000
    RTL


;;; $AD4F: Unused. A = sgn([A]) (zero is special case) ;;;
UNUSED_SignedA_ZeroIsSpecialCase_A0AD4A:
    LDA.W #$0001
    PLB
    RTL

    BNE .notZero
    LDA.W #$0000
    RTL

  .notZero:
    CMP.W #$8000 : BMI .return1
    LDA.W #$FFFF
    RTL

  .return1:
    LDA.W #$0001
    RTL


;;; $AD62: Unused. A = |[A]| ;;;
UNUSED_NegateA_A0AD62:
    TAY
    AND.W #$8000 : BNE +
    TYA
    RTL

+   TYA : EOR.W #$FFFF : INC
    RTL
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $AD70: Check if enemy centre is on screen or not ;;;
CheckIfEnemyCenterIsOnScreen:
;; Returns:
;;     A/zero: 0/set if enemy centre is on screen, 1/clear otherwise
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : CMP.W Layer1XPosition : BMI .offScreen
    LDA.W Layer1XPosition : CLC : ADC.W #$0100 : CMP.W Enemy.XPosition,X : BMI .offScreen
    LDA.W Enemy.YPosition,X : CMP.W Layer1YPosition : BMI .offScreen
    LDA.W Layer1YPosition : CLC : ADC.W #$0100 : CMP.W Enemy.YPosition,X : BMI .offScreen
    LDA.W #$0000
    RTL

  .offScreen:
    LDA.W #$0001
    RTL


;;; $ADA3: Check if enemy centre is over [A] pixels off-screen ;;;
CheckIfEnemyCenterIsOverAPixelsOffScreen:
;; Parameters:
;;     A: Target off-screen distance
;; Returns:
;;     Zero: Clear if enemy centre is over [A] pixels off-screen, set otherwise

; Called by evir only
    PHX
    STA.B DP_Temp12
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : CLC : ADC.B DP_Temp12 : CMP.W Layer1XPosition : BMI .offScreen
    LDA.W Layer1XPosition : CLC : ADC.W #$0100
    CLC : ADC.B DP_Temp12 : CMP.W Enemy.XPosition,X : BMI .offScreen
    LDA.W Enemy.YPosition,X : CLC : ADC.B DP_Temp12 : CMP.W Layer1YPosition : BMI .offScreen
    LDA.W Layer1YPosition : CLC : ADC.W #$0100
    CLC : ADC.B DP_Temp12 : CMP.W Enemy.YPosition,X : BMI .offScreen
    PLX
    LDA.W #$0000
    RTL

  .offScreen:
    PLX
    LDA.W #$0001
    RTL


;;; $ADE7: Check if enemy is on screen or not off screen ;;;
CheckIfEnemyIsOnScreen:
;; Returns:
;;     A/zero: 0/set if enemy centre is on screen, 1/clear otherwise
    PHX
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : CLC : ADC.W Enemy.XHitboxRadius,X : CMP.W Layer1XPosition : BMI .offScreen
    LDA.W Layer1XPosition : CLC : ADC.W #$0100
    CLC : ADC.W Enemy.XHitboxRadius,X : CMP.W Enemy.XPosition,X : BMI .offScreen
    LDA.W Enemy.YPosition,X : CLC : ADC.W #$0008 : CMP.W Layer1YPosition : BMI .offScreen
    LDA.W Layer1YPosition : CLC : ADC.W #$00F8 : CMP.W Enemy.YPosition,X : BMI .offScreen
    PLX
    LDA.W #$0000
    RTL

  .offScreen:
    PLX
    LDA.W #$0001
    RTL


;;; $AE29: Determine direction of Samus from enemy ;;;
DetermineDirectionOfSamusFromEnemy:
;; Returns:
;;     A: Direction
;;         0: Up         - Samus is not within 2 block rows of enemy, is within 2 block columns of enemy, and Samus is above enemy
;;         1: Up-right   - Samus is not within 2 blocks of enemy, Samus is right of enemy, and Samus is above enemy
;;         2: Right      - Samus is within 2 block rows of enemy and Samus is right of enemy
;;         3: Down-right - Samus is not within 2 blocks of enemy, Samus is right of enemy, and Samus is below enemy
;;         4: Down       - Samus is not within 2 block rows of enemy, is within 2 block columns of enemy, and Samus is below enemy
;;         6: Down-left  - Samus is not within 2 blocks of enemy, Samus is left of enemy, and Samus is below enemy
;;         7: Left       - Samus is within 2 block rows of enemy and Samus is left of enemy
;;         8: Up-left    - Samus is not within 2 blocks of enemy, Samus is left of enemy, and Samus is above enemy

; Graphically, return values are as follows where # is the enemy and each numeral is a block
; 8888 0000 1111
; 8888 0000 1111
; 8888 0000 1111
; 7777 7722 2222
; 7777 7722 2222
; 7777 77#2 2222
; 7777 7722 2222
; 6666 4444 3333
; 6666 4444 3333
; 6666 4444 3333

; Note that 5 and 9 cannot be returned, but otherwise these values match up with the projectile directions (SamusProjectile_Directions)
    LDX.W EnemyIndex
    LDA.W #$0020
    JSL IsSamusWithingAPixelRowsOfEnemy
    BEQ .notLeftNorRight
    LDY.W #$0002
    JSL Get_SamusX_minus_EnemyX
    BPL +
    LDY.W #$0007

+   TYA
    RTL

  .notLeftNorRight:
    LDA.W #$0020
    JSL IsSamusWithinAPixelColumnsOfEnemy
    BEQ .notAboveOrBelow
    LDY.W #$0004
    JSL Get_SamusY_minus_EnemyY
    BPL +
    LDY.W #$0000

+   TYA
    RTL

  .notAboveOrBelow:
    JSL Get_SamusX_minus_EnemyX
    BMI .notDiagonallyRight
    LDY.W #$0003
    JSL Get_SamusY_minus_EnemyY
    BPL +
    LDY.W #$0001

+   TYA
    RTL

  .notDiagonallyRight:
    LDY.W #$0006
    JSL Get_SamusY_minus_EnemyY
    BPL +
    LDY.W #$0008

+   TYA
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $AE7C: Unused. Proto instruction list handler ;;;
UNUSED_ProtoInstructionListHandler_A0AE7C:
; Uses $A0:002A(!) as pointer to instruction list pointer table, indexed by Enemy.instList * 2
; Enemy Enemy.loopCounter is the instruction list pointer, and these instruction lists terminate with FFFFh and loop with FFFEh
; No support for ASM commands
    LDX.W EnemyIndex
    LDA.W Enemy.ID,X : TAX
    LDA.L EnemyHeaders_sidehopperVariantIndex,X : STA.W Temp_InstListIndex
    LDX.W EnemyIndex
    LDA.W Enemy.instList,X : ASL : CLC : ADC.W Temp_InstListIndex : TAY
    LDX.W $0000,Y : TXY
    LDX.W EnemyIndex
    LDA.W Enemy.instTimer,X : BEQ +
    CMP.W #$0001 : BEQ +
    DEC.W Enemy.instTimer,X
    LDA.W #$0000
    RTL

+   STY.B DP_Temp00
    LDY.W Enemy.loopCounter,X

  .loop:
    LDA.B (DP_Temp00),Y : CMP.W #$FFFF : BEQ .return1
    CMP.W #$FFFE : BNE .notTerminated
    LDY.W #$0000
    JMP .loop

  .notTerminated:
    STA.W Enemy.spritemap,X
    INY #2
    LDA.B (DP_Temp00),Y : STA.W Enemy.instTimer,X
    INY #2
    TYA : STA.W Enemy.loopCounter,X
    LDA.W #$0000
    RTL

  .return1:
    LDA.W #$0001
    RTL
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $AEDD: A = [Samus Y position] - [enemy Y position] ;;;
Get_SamusY_minus_EnemyY:
    LDA.W SamusYPosition : SEC : SBC.W Enemy.YPosition,X
    RTL


;;; $AEE5: A = [Samus X position] - [enemy X position] ;;;
Get_SamusX_minus_EnemyX:
    LDA.W SamusXPosition : SEC : SBC.W Enemy.XPosition,X
    RTL


;;; $AEED: Is Samus within [A] pixel rows of enemy ;;;
IsSamusWithingAPixelRowsOfEnemy:
    STA.W Temp_Threshold
    LDY.W SamusYPosition
    LDA.W Enemy.YPosition,X : TAX
    JSL GetSignedYMinusX_A0B07D
    LDX.W EnemyIndex
    CMP.W Temp_Threshold : BPL .returnZero
    LDA.W #$0001
    RTL

  .returnZero:
    LDA.W #$0000
    RTL


;;; $AF0B: Is Samus within [A] pixel columns of enemy ;;;
IsSamusWithinAPixelColumnsOfEnemy:
    STA.W Temp_Threshold
    LDY.W SamusXPosition
    LDA.W Enemy.XPosition,X : TAX
    JSL GetSignedYMinusX_A0B07D
    LDX.W EnemyIndex
    CMP.W Temp_Threshold : BPL .returnZero
    LDA.W #$0001
    RTL

  .returnZero:
    LDA.W #$0000
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $AF29: Unused. Enemy X += [$14].[$12] ;;;
UNUSED_MoveEnemyX_NoCollision_A0AF29:
; Unused. Clone of MoveEnemyX_plus_12_14
    LDA.W Enemy.XSubPosition,X : CLC : ADC.B DP_Temp12 : STA.W Enemy.XSubPosition,X
    LDA.W Enemy.XPosition,X : ADC.B DP_Temp14 : STA.W Enemy.XPosition,X
    RTL


;;; $AF3B: Unused. Enemy Y += [$14].[$12] ;;;
UNUSED_MoveEnemyY_NoCollision_A0AF3B:
; Unused. Clone of MoveEnemyY_plus_12_14
    LDA.W Enemy.YSubPosition,X : CLC : ADC.B DP_Temp12 : STA.W Enemy.YSubPosition,X
    LDA.W Enemy.YPosition,X : ADC.B DP_Temp14 : STA.W Enemy.YPosition,X
    RTL


;;; $AF4D: Unused. Move enemy left/right/up/down by [$14].[$12] ;;;
UNUSED_MoveEnemy_12_14_A0AF4D:
; Broken. Uses X for jump table index, but is needed for enemy index
    ASL : TAX
    JMP.W (.pointers,X)

  .pointers:
    dw MoveEnemyX_minus_12_14
    dw MoveEnemyX_plus_12_14
    dw MoveEnemyY_minus_12_14
    dw MoveEnemyY_plus_12_14
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $AF5A: Enemy X -= [$14].[$12] ;;;
MoveEnemyX_minus_12_14:
    LDA.W Enemy.XSubPosition,X : SEC : SBC.B DP_Temp12 : STA.W Enemy.XSubPosition,X
    LDA.W Enemy.XPosition,X : SBC.B DP_Temp14 : STA.W Enemy.XPosition,X
    RTL


;;; $AF6C: Enemy X += [$14].[$12] ;;;
MoveEnemyX_plus_12_14:
    LDA.W Enemy.XSubPosition,X : CLC : ADC.B DP_Temp12 : STA.W Enemy.XSubPosition,X
    LDA.W Enemy.XPosition,X : ADC.B DP_Temp14 : STA.W Enemy.XPosition,X
    RTL


;;; $AF7E: Enemy Y -= [$14].[$12] ;;;
MoveEnemyY_minus_12_14:
    LDA.W Enemy.YSubPosition,X : SEC : SBC.B DP_Temp12 : STA.W Enemy.YSubPosition,X
    LDA.W Enemy.YPosition,X : SBC.B DP_Temp14 : STA.W Enemy.YPosition,X
    RTL


;;; $AF90: Enemy Y += [$14].[$12] ;;;
MoveEnemyY_plus_12_14:
    LDA.W Enemy.YSubPosition,X : CLC : ADC.B DP_Temp12 : STA.W Enemy.YSubPosition,X
    LDA.W Enemy.YPosition,X : ADC.B DP_Temp14 : STA.W Enemy.YPosition,X
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $AFA2: Unused. Extra Samus X displacement = [Samus X position] - [$14].[$12] ;;;
UNUSED_MoveSamus_ExtraXDisplacement_minus_12_14_A0AFA2:
    LDA.W SamusXSubPosition : SEC : SBC.B DP_Temp12 : STA.W ExtraSamusXSubDisplacement
    LDA.W SamusXPosition : SBC.B DP_Temp14 : STA.W ExtraSamusXDisplacement
    RTL


;;; $AFB4: Unused. Extra Samus X displacement = [Samus X position] + [$14].[$12] ;;;
UNUSED_MoveSamus_ExtraXDisplacement_plus_12_14_A0AFB4:
    LDA.W SamusXSubPosition : CLC : ADC.B DP_Temp12 : STA.W ExtraSamusXSubDisplacement
    LDA.W SamusXPosition : ADC.B DP_Temp14 : STA.W ExtraSamusXDisplacement
    RTL


;;; $AFC6: Unused. Extra Samus Y displacement = [Samus X position] - [$14].[$12] ;;;
UNUSED_MoveSamus_ExtraYDisplacement_minus_12_14_A0AFC6:
    LDA.W SamusYSubPosition : SEC : SBC.B DP_Temp12 : STA.W ExtraSamusYSubDisplacement
    LDA.W SamusYPosition : SBC.B DP_Temp14 : STA.W ExtraSamusYDisplacement
    RTL


;;; $AFD8: Unused. Extra Samus Y displacement = [Samus X position] + [$14].[$12] ;;;
UNUSED_MoveSamus_ExtraYDisplacement_plus_12_14_A0AFD8:
    LDA.W SamusYSubPosition : CLC : ADC.B DP_Temp12 : STA.W ExtraSamusYSubDisplacement
    LDA.W SamusYPosition : ADC.B DP_Temp14 : STA.W ExtraSamusYDisplacement
    RTL
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $AFEA: Sign extend A ;;;
Sign_Extend_A:
    STA.W Temp_Operand
    AND.W #$0080 : BEQ +
    LDA.W Temp_Operand : ORA.W #$FF00
    RTL

+   LDA.W Temp_Operand
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $AFFD: Unused. A *= 10h ;;;
UNUSED_MultiplyBy10_A0AFFD:
    ASL #4
    RTL
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $B002: A *= 20h ;;;
MultiplyBy20_A0B002:
; Used by ProcessEnemySet_LoadPalettesAndEnemyLoadingData to convert palette index to palette bits
    ASL #5
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $B008: Unused. A *= 30h ;;;
UNUSED_MultiplyBy30_A0B008:
    ASL #4 : STA.W Temp_Operand
    CLC : ADC.W Temp_Operand
    CLC : ADC.W Temp_Operand
    RTL


;;; $B018: Unused. A *= 40h ;;;
UNUSED_MultiplyBy40_A0B018:
    ASL #6
    RTL


;;; $B01F: Unused. A = xxyz -> A = xxzy ;;;
UNUSED_SwapLowByteNybbles_A0B01F:
    PHA
    AND.W #$FF00 : STA.W Temp_SwapNybbles
    PLA : AND.W #$00FF : STA.W Temp_Unknown0E32
    SEP #$20 ; >_<
    XBA
    REP #$20
    ORA.W Temp_Unknown0E32
    LSR #4 : AND.W #$00FF : ORA.W Temp_SwapNybbles
    RTL


;;; $B040: Unused. A = xyzz -> A = yxzz ;;;
UNUSED_SwapHighByteNybbles_A0B040:
    PHA
    AND.W #$00FF : STA.W Temp_SwapNybbles
    PLA : AND.W #$FF00 : STA.W Temp_Unknown0E32
    SEP #$20 ; >_<
    XBA
    REP #$20
    ORA.W Temp_Unknown0E32 : ASL #4 : AND.W #$FF00 : ORA.W Temp_SwapNybbles
    RTL


;;; $B061: Unused. A = xxyy -> A = yyxx ;;;
UNUSED_XBA_A0B060:
; Whoever wrote these three nybble swapping routines must've thought XBA had to be done in 8-bit mode
    SEP #$20 ; >_<
    XBA
    REP #$20
    RTL
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $B067: A = |[A]| ;;;
NegateA_A0B067:
    STA.W Temp_Unknown0E32
    AND.W #$8000 : BEQ +
    LDA.W Temp_Unknown0E32 : EOR.W #$FFFF : INC : STA.W Temp_Unknown0E32

+   LDA.W Temp_Unknown0E32
    RTL


;;; $B07D: A = |[Y] - [X]| ;;;
GetSignedYMinusX_A0B07D:
    PHX : PHY
    TXA : STA.W Temp_Unknown0E32 ; >.< STX
    TYA : SEC : SBC.W Temp_Unknown0E32 : STA.W Temp_Unknown0E34
    AND.W #$8000 : BEQ +
    LDA.W Temp_Unknown0E34 : EOR.W #$FFFF : INC : STA.W Temp_Unknown0E34

+   LDA.W Temp_Unknown0E34
    PLY : PLX
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $B0A0: Unused. A = -[A] ;;;
UNUSED_GetNegativeA_A0B0A0:
    EOR.W #$FFFF : INC
    RTL


;;; $B0A5: Unused. A = sgn([A]) (zero counts as positive) ;;;
UNUSED_SignedA_ZeroCountsAsPositive_A0B0A5:
    AND.W #$8000 : BEQ +
    LDA.W #$FFFF
    RTL

+   LDA.W #$0001
    RTL
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $B0B2: 8-bit cosine multiplication ;;;
EightBitCosineMultiplication_A0B0B2:
; $0E36.$0E38 = cos([A] * pi / 80h) * FFh * Temp_Unknown0E32 / 100h

; Bug. Only accurate for angles in the range C0h..3Fh (see EightBitSineMultiplication_A0B0DA)
    CLC : ADC.W #$0040 : AND.W #$00FF : STA.W Temp_Unknown0E34
    PHX : PHY : PHB
    JSR EightBitSineMultiplication_A0B0DA
    PLB : PLY : PLX
    RTL


;;; $B0C6: 8-bit negative sine multiplication ;;;
EightBitNegativeSineMultiplication_A0B0C6:
; $0E36.$0E38 = -sin([A] * pi / 80h) * FFh * Temp_Unknown0E32 / 100h

; Bug. Only accurate for angles in the range 80h..FFh (see EightBitSineMultiplication_A0B0DA)
    CLC : ADC.W #$0080 : AND.W #$00FF : STA.W Temp_Unknown0E34
    PHX : PHY : PHB
    JSR EightBitSineMultiplication_A0B0DA
    PLB : PLY : PLX
    RTL


;;; $B0DA: 8-bit sine multiplication ;;;
EightBitSineMultiplication_A0B0DA:
; $0E36.$0E38 = sin(Temp_Unknown0E34 * pi / 80h) * FFh * Temp_Unknown0E32 / 100h

; Bug. Only accurate for angles in the range 0..7Fh because the negation code of $B11B..2E does not do a correct multi-word increment.
; Accurate code would be more like:
;     LDA $0E38 : EOR #$FFFF : CLC : ADC #$0001 : STA $0E38
;     LDA $0E36 : EOR #$FFFF : ADC #$0000 : STA $0E36

; Results for negative angles with this bug are almost always 1.0 greater than they should be
    SEP #$20
    LDA.B #SineCosineTables_8bitSine>>16 : PHA : PLB
    REP #$30
    LDA.W Temp_Unknown0E34 : AND.W #$007F : TAY
    LDA.W SineCosineTables_8bitSine,Y : AND.W #$00FF
    SEP #$20
    STA.W $4202
    LDA.W Temp_Unknown0E32 : STA.W $4203
    NOP #5
    REP #$20
    LDA.W $4216 : XBA : PHA
    AND.W #$00FF : STA.W Temp_SineProduct
    PLA : AND.W #$FF00 : STA.W Temp_SineProductFractionalPart
    LDA.W Temp_Unknown0E34 : AND.W #$0080 : BEQ .return
    LDA.W Temp_SineProduct : EOR.W #$FFFF : INC : STA.W Temp_SineProduct
    LDA.W Temp_SineProductFractionalPart : EOR.W #$FFFF : INC : STA.W Temp_SineProductFractionalPart

  .return:
    LDA.W Temp_SineProduct
    RTS


;;; $B133: Addresses for enemy drawing queues ;;;
AddressesForEnemyDrawingQueues:
; Indexed by [enemy layer] * 2
    dw EnemyDrawingQueues_Layer0
    dw EnemyDrawingQueues_Layer1
    dw EnemyDrawingQueues_Layer2
    dw EnemyDrawingQueues_Layer3
    dw EnemyDrawingQueues_Layer4
    dw EnemyDrawingQueues_Layer5
    dw EnemyDrawingQueues_Layer6
    dw EnemyDrawingQueues_Layer7


; Generate 16-bit tables with
;     [int((0x7FFF+0.5) * math.sin(i * math.pi / 0x80)) for i in range(0x40 * n_quadrants)]

; Generate sign-extended 8-bit tables with
;     [0x100 * math.sin(i * math.pi / 0x80) for i in range(0x40 * n_quadrants)]

; 8-bit table is the same as the 8-bit signed-extended first half, except cos(0) is capped at FFh

; "8-bit" table range = 0..FFh, positive values only (i.e. the first two quadrants only)
; "16-bit" table range = -7FFFh..7FFFh
; "16-bit sign-extended" table range = -100h..100h
SineCosineTables_8bitSine:
; 8-bit sine
    db $00,$06,$0C,$12,$19,$1F,$25,$2B,$31,$38,$3E,$44,$4A,$50,$56,$5C
    db $61,$67,$6D,$73,$78,$7E,$83,$88,$8E,$93,$98,$9D,$A2,$A7,$AB,$B0
    db $B5,$B9,$BD,$C1,$C5,$C9,$CD,$D1,$D4,$D8,$DB,$DE,$E1,$E4,$E7,$EA
    db $EC,$EE,$F1,$F3,$F4,$F6,$F8,$F9,$FB,$FC,$FD,$FE,$FE,$FF,$FF,$FF

SineCosineTables_8bitCosine:
; 8-bit cosine
    db $FF,$FF,$FF,$FF,$FE,$FE,$FD,$FC,$FB,$F9,$F8,$F6,$F4,$F3,$F1,$EE
    db $EC,$EA,$E7,$E4,$E1,$DE,$DB,$D8,$D4,$D1,$CD,$C9,$C5,$C1,$BD,$B9
    db $B5,$B0,$AB,$A7,$A2,$9D,$98,$93,$8E,$88,$83,$7E,$78,$73,$6D,$67
    db $61,$5C,$56,$50,$4A,$44,$3E,$38,$31,$2B,$25,$1F,$19,$12,$0C,$06

SineCosineTables_16bitSine:
; 16-bit sine
    dw $0000,$0324,$0647,$096A,$0C8B,$0FAB,$12C7,$15E1
    dw $18F8,$1C0B,$1F19,$2223,$2527,$2826,$2B1F,$2E10
    dw $30FB,$33DE,$36B9,$398C,$3C56,$3F17,$41CD,$447A
    dw $471C,$49B3,$4C3F,$4EBF,$5133,$539A,$55F5,$5842
    dw $5A82,$5CB3,$5ED7,$60EB,$62F1,$64E8,$66CF,$68A6
    dw $6A6D,$6C23,$6DC9,$6F5E,$70E2,$7254,$73B5,$7504
    dw $7641,$776B,$7884,$7989,$7A7C,$7B5C,$7C29,$7CE3
    dw $7D89,$7E1D,$7E9C,$7F09,$7F61,$7FA6,$7FD8,$7FF5

SineCosineTables_16bitCosine:
; 16-bit cosine
    dw $7FFF,$7FF5,$7FD8,$7FA6,$7F61,$7F09,$7E9C,$7E1D
    dw $7D89,$7CE3,$7C29,$7B5C,$7A7C,$7989,$7884,$776B
    dw $7641,$7504,$73B5,$7254,$70E2,$6F5E,$6DC9,$6C23
    dw $6A6D,$68A6,$66CF,$64E8,$62F1,$60EB,$5ED7,$5CB3
    dw $5A82,$5842,$55F5,$539A,$5133,$4EBF,$4C3F,$49B3
    dw $471C,$447A,$41CD,$3F17,$3C56,$398C,$36B9,$33DE
    dw $30FB,$2E10,$2B1F,$2826,$2527,$2223,$1F19,$1C0B
    dw $18F8,$15E1,$12C7,$0FAB,$0C8B,$096A,$0647,$0324

SineCosineTables_16bitNegativeSine:
; 16-bit negative sine
    dw $0000,$FCDC,$F9B9,$F696,$F375,$F055,$ED39,$EA1F
    dw $E708,$E3F5,$E0E7,$DDDD,$DAD9,$D7DA,$D4E1,$D1F0
    dw $CF05,$CC22,$C947,$C674,$C3AA,$C0E9,$BE33,$BB86
    dw $B8E4,$B64D,$B3C1,$B141,$AECD,$AC66,$AA0B,$A7BE
    dw $A57E,$A34D,$A129,$9F15,$9D0F,$9B18,$9931,$975A
    dw $9593,$93DD,$9237,$90A2,$8F1E,$8DAC,$8C4B,$8AFC
    dw $89BF,$8895,$877C,$8677,$8584,$84A4,$83D7,$831D
    dw $8277,$81E3,$8164,$80F7,$809F,$805A,$8028,$800B

SineCosineTables_16bitNegativeCosine:
; 16-bit negative cosine
    dw $8001,$800B,$8028,$805A,$809F,$80F7,$8164,$81E3
    dw $8277,$831D,$83D7,$84A4,$8584,$8677,$877C,$8895
    dw $89BF,$8AFC,$8C4B,$8DAC,$8F1E,$90A2,$9237,$93DD
    dw $9593,$975A,$9931,$9B18,$9D0F,$9F15,$A129,$A34D
    dw $A57E,$A7BE,$AA0B,$AC66,$AECD,$B141,$B3C1,$B64D
    dw $B8E4,$BB86,$BE33,$C0E9,$C3AA,$C674,$C947,$CC22
    dw $CF05,$D1F0,$D4E1,$D7DA,$DAD9,$DDDD,$E0E7,$E3F5
    dw $E708,$EA1F,$ED39,$F055,$F375,$F696,$F9B9,$FCDC

SineCosineTables_NegativeCosine_SignExtended:
; 8-bit negative cosine, sign-extended
    dw $FF00,$FF01,$FF01,$FF01,$FF02,$FF02,$FF03,$FF04
    dw $FF05,$FF07,$FF08,$FF0A,$FF0C,$FF0D,$FF0F,$FF12
    dw $FF14,$FF16,$FF19,$FF1C,$FF1F,$FF22,$FF25,$FF28
    dw $FF2C,$FF2F,$FF33,$FF37,$FF3B,$FF3F,$FF43,$FF47
    dw $FF4B,$FF50,$FF55,$FF59,$FF5E,$FF63,$FF68,$FF6D
    dw $FF72,$FF78,$FF7D,$FF82,$FF88,$FF8D,$FF93,$FF99
    dw $FF9F,$FFA4,$FFAA,$FFB0,$FFB6,$FFBC,$FFC2,$FFC8
    dw $FFCF,$FFD5,$FFDB,$FFE1,$FFE7,$FFEE,$FFF4,$FFFA

SineCosineTables_8bitSine_SignExtended:
; 8-bit sine, sign-extended
    dw $0000,$0006,$000C,$0012,$0019,$001F,$0025,$002B
    dw $0031,$0038,$003E,$0044,$004A,$0050,$0056,$005C
    dw $0061,$0067,$006D,$0073,$0078,$007E,$0083,$0088
    dw $008E,$0093,$0098,$009D,$00A2,$00A7,$00AB,$00B0
    dw $00B5,$00B9,$00BD,$00C1,$00C5,$00C9,$00CD,$00D1
    dw $00D4,$00D8,$00DB,$00DE,$00E1,$00E4,$00E7,$00EA
    dw $00EC,$00EE,$00F1,$00F3,$00F4,$00F6,$00F8,$00F9
    dw $00FB,$00FC,$00FD,$00FE,$00FE,$00FF,$00FF,$00FF

SineCosineTables_8bitCosine_SignExtended:
; 8-bit cosine, sign-extended
    dw $0100,$00FF,$00FF,$00FF,$00FE,$00FE,$00FD,$00FC
    dw $00FB,$00F9,$00F8,$00F6,$00F4,$00F3,$00F1,$00EE
    dw $00EC,$00EA,$00E7,$00E4,$00E1,$00DE,$00DB,$00D8
    dw $00D4,$00D1,$00CD,$00C9,$00C5,$00C1,$00BD,$00B9
    dw $00B5,$00B0,$00AB,$00A7,$00A2,$009D,$0098,$0093
    dw $008E,$0088,$0083,$007E,$0078,$0073,$006D,$0067
    dw $0061,$005C,$0056,$0050,$004A,$0044,$003E,$0038
    dw $0031,$002B,$0025,$001F,$0019,$0012,$000C,$0006

SineCosineTables_8bitNegativeSign_SignExtended:
; 8-bit negative sine, sign-extended
    dw $0000,$FFFA,$FFF4,$FFEE,$FFE7,$FFE1,$FFDB,$FFD5
    dw $FFCF,$FFC8,$FFC2,$FFBC,$FFB6,$FFB0,$FFAA,$FFA4
    dw $FF9F,$FF99,$FF93,$FF8D,$FF88,$FF82,$FF7D,$FF78
    dw $FF72,$FF6D,$FF68,$FF63,$FF5E,$FF59,$FF55,$FF50
    dw $FF4B,$FF47,$FF43,$FF3F,$FF3B,$FF37,$FF33,$FF2F
    dw $FF2C,$FF28,$FF25,$FF22,$FF1F,$FF1C,$FF19,$FF16
    dw $FF14,$FF12,$FF0F,$FF0D,$FF0C,$FF0A,$FF08,$FF07
    dw $FF05,$FF04,$FF03,$FF02,$FF02,$FF01,$FF01,$FF01

SineCosineTables_8bitNegativeCosign_SignExtended:
; 8-bit negative cosine, sign-extended
    dw $FF00,$FF01,$FF01,$FF01,$FF02,$FF02,$FF03,$FF04
    dw $FF05,$FF07,$FF08,$FF0A,$FF0C,$FF0D,$FF0F,$FF12
    dw $FF14,$FF16,$FF19,$FF1C,$FF1F,$FF22,$FF25,$FF28
    dw $FF2C,$FF2F,$FF33,$FF37,$FF3B,$FF3F,$FF43,$FF47
    dw $FF4B,$FF50,$FF55,$FF59,$FF5E,$FF63,$FF68,$FF6D
    dw $FF72,$FF78,$FF7D,$FF82,$FF88,$FF8D,$FF93,$FF99
    dw $FF9F,$FFA4,$FFAA,$FFB0,$FFB6,$FFBC,$FFC2,$FFC8
    dw $FFCF,$FFD5,$FFDB,$FFE1,$FFE7,$FFEE,$FFF4,$FFFA


;;; $B643: ($16.$18, $1A.$1C) = ([$14] * |cos([$12] * pi / 80h)|, [$14] * |sin([$12] * pi / 80h)|) ;;;
Do_Some_Math_With_Sine_Cosine_Terrible_Label_Name:
; All arithmetic done here is unsigned, so [$14] should be positive
; Uses the standard maths convention for angle(!)

; Standard maths angle convention:
;          40h
;           |
;     80h   #    0
;
;          C0h
;
; Where # is the origin and | is the negative y axis
    PHB : PHX
    PEA UnsignedSineTable>>8&$FF00 : PLB : PLB
    REP #$30
    LDA.B DP_Temp12 : CLC : ADC.W #$0080 : AND.W #$007F : ASL : TAX
    LDA.L UnsignedSineTable,X : STA.B DP_Temp26
    LDA.B DP_Temp14 : STA.B DP_Temp28
    JSL Multiplication_32bit_A0B6FF
    LDA.B DP_Temp2C : STA.B DP_Temp1A
    LDA.B DP_Temp2A : STA.B DP_Temp1C
    LDA.B DP_Temp12 : CLC : ADC.W #$0040 : AND.W #$007F : ASL : TAX
    LDA.L UnsignedSineTable,X : STA.B DP_Temp26
    LDA.B DP_Temp14 : STA.B DP_Temp28
    JSL Multiplication_32bit_A0B6FF
    LDA.B DP_Temp2C : STA.B DP_Temp16
    LDA.B DP_Temp2A : STA.B DP_Temp18
    PLX : PLB
    RTL


;;; $B691: Move enemy according to angle and X/Y speeds ;;;
MoveEnemyAccordingToAngleAndXYSpeeds:
;; Parameters:
;;     Temp_AngleToMove: Angle. Standard maths angle convention
;;     Temp_XSpeed.Temp_XSubSpeed: X speed
;;     Temp_YSpeed.Temp_YSubSpeed: Y speed

; Standard maths angle convention:
;          40h
;           |
;     80h   #    0
;
;          C0h
;
; Where # is the origin and | is the negative y axis
    PHX
    LDX.W EnemyIndex
    LDA.W Temp_AngleToMove : CLC : ADC.W #$0040 : BIT.W #$0080 : BNE .greaterThanEqualTo80
    LDA.W Enemy.XSubPosition,X : CLC : ADC.W Temp_XSubSpeed : STA.W Enemy.XSubPosition,X
    LDA.W Enemy.XPosition,X : ADC.W Temp_XSpeed : STA.W Enemy.XPosition,X
    BRA +

  .greaterThanEqualTo80:
    LDA.W Enemy.XSubPosition,X : SEC : SBC.W Temp_XSubSpeed : STA.W Enemy.XSubPosition,X
    LDA.W Enemy.XPosition,X : SBC.W Temp_XSpeed : STA.W Enemy.XPosition,X

+   LDA.W Temp_AngleToMove : CLC : ADC.W #$0080 : BIT.W #$0080 : BNE .lessThan80
    LDA.W Enemy.YSubPosition,X : CLC : ADC.W Temp_YSubSpeed : STA.W Enemy.YSubPosition,X
    LDA.W Enemy.YPosition,X : ADC.W Temp_YSpeed : STA.W Enemy.YPosition,X
    BRA .return

  .lessThan80:
    LDA.W Enemy.YSubPosition,X : SEC : SBC.W Temp_YSubSpeed : STA.W Enemy.YSubPosition,X
    LDA.W Enemy.YPosition,X : SBC.W Temp_YSpeed : STA.W Enemy.YPosition,X

  .return:
    PLX
    RTL


;;; $B6FF: 16bit ($26) * 16bit ($28) = 32bit ($2A) ;;;
Multiplication_32bit_A0B6FF:
;; Parameters:
;;     $26: Multiplicand. Let $26 = a + b * 100h
;;     $28: Multiplicand. Let $28 = c + d * 100h
;; Returns:
;;     $2A..2D: 32-bit result
    PHX : PHY : PHP
    REP #$20 : SEP #$10
    LDX.B DP_Temp26 : STX.W $4202
    LDX.B DP_Temp28 : STX.W $4203
    NOP #3
    LDA.W $4216 : STA.B DP_Temp2A
    LDX.B DP_Temp27 : STX.W $4202
    LDX.B DP_Temp29 : STX.W $4203
    NOP #3
    LDX.W $4216 : STX.B DP_Temp2C
    LDY.W $4217
    LDX.B DP_Temp27 : STX.W $4202
    LDX.B DP_Temp28 : STX.W $4203
    NOP #2
    LDA.B DP_Temp2B : CLC : ADC.W $4216 : STA.B DP_Temp2B : BCC .carryClear
    INY

  .carryClear:
    LDX.B DP_Temp26 : STX.W $4202
    LDX.B DP_Temp29 : STX.W $4203
    NOP #2
    LDA.B DP_Temp2B : CLC : ADC.W $4216 : STA.B DP_Temp2B : BCC .carryClearAgain
    INY

  .carryClearAgain:
    STY.B DP_Temp2D
    PLP : PLY : PLX
    RTL


;;; $B761: 32-bit unsigned division ;;;
UnsignedDivision_32bit_A0B761:
;; Parameters:
;;     $2A..2D: Dividend
;;     $2E..31: Divisor
;; Returns:
;;     $26..29: Remainder
;;     $2A..2D: Quotient

; Called by Draygon
; Very slow. When profiled on a Draygon fight, I got:
;     Minimum: ~14.5k master cycles (10.6 scanlines)
;     Average: ~16.2k master cycles (11.9 scanlines)
;     Maximum: ~17.3k master cycles (12.7 scanlines)
    PHP : PHB
    PHK : PLB
    REP #$30
    STZ.B DP_Temp28 : STZ.B DP_Temp26
    LDA.B DP_Temp30 : ORA.B DP_Temp2E : BNE .loopCounter
    STZ.B DP_Temp2C : STZ.B DP_Temp2A
    BRA .return

  .loopCounter:
    LDX.W #$0021
    CLC

  .loop:
    ROL.B DP_Temp2A
    ROL.B DP_Temp2C
    DEX : BEQ .return
    ROL.B DP_Temp26
    ROL.B DP_Temp28
    LDA.B DP_Temp28 : ORA.B DP_Temp26 : BEQ .loop
    LDA.B DP_Temp26 : SEC : SBC.B DP_Temp2E : TAY
    LDA.B DP_Temp28 : SBC.B DP_Temp30 : BCC .loop
    STA.B DP_Temp28
    STY.B DP_Temp26
    BRA .loop

  .return:
    PLB : PLP
    RTL


;;; $B7A1: Cap scrolling speed ;;;
CapScrollingSpeed:
; Called by Draygon and yapping maw
    PHX : PHY
    LDA.W SamusYPosition : SEC : SBC.W SamusPreviousYPosition : STA.B DP_Temp12
    JSL NegateA_A0B067
    CMP.W #$000C : BMI .YPositionEnd
    LDY.W #$FFF4
    LDA.B DP_Temp12 : BMI .negative
    LDY.W #$000C

  .negative:
    TYA : CLC : ADC.W SamusYPosition : STA.W SamusPreviousYPosition

  .YPositionEnd:
    LDA.W SamusXPosition : SEC : SBC.W SamusPreviousXPosition : STA.B DP_Temp12
    JSL NegateA_A0B067
    CMP.W #$000C : BMI .retrun
    LDY.W #$FFF4
    LDA.B DP_Temp12 : BMI +
    LDY.W #$000C

+   TYA : CLC : ADC.W SamusXPosition : STA.W SamusPreviousXPosition

  .retrun:
    PLY : PLX
    RTL


;;; $B7EE: Unsigned sine table ;;;
UnsignedSineTable:
; sin(t * pi / 80h) * FFFFh
    dw $0000,$0648,$0C8F,$12D5,$1917,$1F56,$258F,$2BC3
    dw $31F1,$3816,$3E33,$4447,$4A4F,$504D,$563E,$5C21
    dw $61F7,$67BD,$6D73,$7319,$78AC,$7E2E,$839B,$88F5
    dw $8E39,$9367,$987F,$9D7F,$A266,$A735,$ABEA,$B085
    dw $B504,$B967,$BDAE,$C1D7,$C5E3,$C9D0,$CD9E,$D14C
    dw $D4DA,$D847,$DB93,$DEBD,$E1C4,$E4A9,$E76A,$EA08
    dw $EC82,$EED7,$F108,$F313,$F4F9,$F6B9,$F852,$F9C6
    dw $FB13,$FC3A,$FD39,$FE12,$FEC3,$FF4D,$FFB0,$FFEB
    dw $FFFF,$FFEB,$FFB0,$FF4D,$FEC3,$FE12,$FD39,$FC3A
    dw $FB13,$F9C6,$F852,$F6B9,$F4F9,$F313,$F108,$EED7
    dw $EC82,$EA08,$E76A,$E4A9,$E1C4,$DEBD,$DB93,$D847
    dw $D4DA,$D14C,$CD9E,$C9D0,$C5E3,$C1D7,$BDAE,$B967
    dw $B504,$B085,$ABEA,$A735,$A266,$9D7F,$987F,$9367
    dw $8E39,$88F5,$839B,$7E2E,$78AC,$7319,$6D73,$67BD
    dw $61F7,$5C21,$563E,$504D,$4A4F,$4447,$3E33,$3816
    dw $31F1,$2BC3,$258F,$1F56,$1917,$12D5,$0C8F,$0648


;;; $B8EE: Fake Kraid death item drop routine ;;;
MiniKraidDeathItemDropRoutine:
    PHX : PHY : PHP
    LDA.W #$0004 : STA.W NumberOfDrops

  .loop:
    JSL GenerateRandomNumber
    AND.W #$001F : SEC : SBC.W #$0010
    CLC : ADC.L EnemyProjectileData_SpecialDeathItemDropXOriginPosition : STA.B DP_Temp12
    LDA.W RandomNumberSeed : AND.W #$1F00 : XBA : SEC : SBC.W #$0010
    CLC : ADC.L EnemyProjectileData_SpecialDeathItemDropYOriginPosition : STA.B DP_Temp14
    LDA.W #EnemyHeaders_MiniKraid
    JSL Spawn_Enemy_Drops
    DEC.W NumberOfDrops : BNE .loop
    PLP : PLY : PLX
    RTL


;;; $B92B: Gold ninja space pirate death item drop routine ;;;
MetalNinjaPirateDeathItemDropRoutine:
    PHX : PHY : PHP
    LDA.W #$0005 : STA.W NumberOfDrops

  .loop:
    JSL GenerateRandomNumber
    AND.W #$001F : SEC : SBC.W #$0010
    CLC : ADC.L EnemyProjectileData_SpecialDeathItemDropXOriginPosition : STA.B DP_Temp12
    LDA.W RandomNumberSeed : AND.W #$1F00 : XBA : SEC : SBC.W #$0010
    CLC : ADC.L EnemyProjectileData_SpecialDeathItemDropYOriginPosition : STA.B DP_Temp14
    LDA.W #EnemyHeaders_PirateGoldNinja
    JSL Spawn_Enemy_Drops
    DEC.W NumberOfDrops : BNE .loop
    PLP : PLY : PLX
    RTL


;;; $B968: Metroid death item drop routine ;;;
MetroidDeathItemDropRoutine:
    PHX : PHY : PHP
    LDA.W #$0005 : STA.W NumberOfDrops

  .loop:
    JSL GenerateRandomNumber
    AND.W #$001F : SEC : SBC.W #$0010
    CLC : ADC.L EnemyProjectileData_SpecialDeathItemDropXOriginPosition : STA.B DP_Temp12
    LDA.W RandomNumberSeed : AND.W #$1F00 : XBA : SEC : SBC.W #$0010
    CLC : ADC.L EnemyProjectileData_SpecialDeathItemDropYOriginPosition : STA.B DP_Temp14
    LDA.W #EnemyHeaders_Metroid
    JSL Spawn_Enemy_Drops
    DEC.W NumberOfDrops : BNE .loop
    PLP : PLY : PLX
    RTL


;;; $B9A5: Ridley death item drop routine ;;;
RidleyDeathItemDropRoutine:
    PHX : PHY : PHP
    LDA.W #$0010 : STA.W NumberOfDrops

  .loop:
    JSL GenerateRandomNumber
    AND.W #$007F : CLC : ADC.W #$0040 : STA.B DP_Temp12
    LDA.W RandomNumberSeed : AND.W #$3F00 : XBA : CLC : ADC.W #$0140 : STA.B DP_Temp14
    LDA.W #EnemyHeaders_Ridley
    JSL Spawn_Enemy_Drops
    DEC.W NumberOfDrops : BNE .loop
    PLP : PLY : PLX
    RTL


;;; $B9D8: Crocomire death item drop routine ;;;
CrocomireDeathItemDropRoutine:
    PHX : PHY : PHP
    LDA.W #$0010 : STA.W NumberOfDrops

  .loop:
    JSL GenerateRandomNumber
    AND.W #$007F : CLC : ADC.W #$0240 : STA.B DP_Temp12
    LDA.W RandomNumberSeed
    AND.W #$3F00 : XBA : CLC : ADC.W #$0060 : STA.B DP_Temp14
    LDA.W #EnemyHeaders_Crocomire
    JSL Spawn_Enemy_Drops
    DEC.W NumberOfDrops : BNE .loop
    PLP : PLY : PLX
    RTL


;;; $BA0B: Phantoon death item drop routine ;;;
PhantoonDeathItemDropRoutine:
    PHX : PHY : PHP
    LDA.W #$0010 : STA.W NumberOfDrops

  .loop:
    JSL GenerateRandomNumber
    AND.W #$007F : CLC : ADC.W #$0040 : STA.B DP_Temp12
    LDA.W RandomNumberSeed : AND.W #$3F00 : XBA : CLC : ADC.W #$0060 : STA.B DP_Temp14
    LDA.W #EnemyHeaders_PhantoonBody
    JSL Spawn_Enemy_Drops
    DEC.W NumberOfDrops : BNE .loop
    PLP : PLY : PLX
    RTL


;;; $BA3E: Botwoon death item drop routine ;;;
BotwoonDeathItemDropRoutine:
    PHX : PHY : PHP
    LDA.W #$0010 : STA.W NumberOfDrops

  .loop:
    JSL GenerateRandomNumber
    AND.W #$007F : CLC : ADC.W #$0040 : STA.B DP_Temp12
    LDA.W RandomNumberSeed : AND.W #$3F00 : XBA : CLC : ADC.W #$0080 : STA.B DP_Temp14
    LDA.W #EnemyHeaders_Botwoon
    JSL Spawn_Enemy_Drops
    DEC.W NumberOfDrops : BNE .loop
    PLP : PLY : PLX
    RTL


;;; $BA71: Kraid death item drop routine ;;;
KraidDeathItemDropRoutine:
    PHX : PHY : PHP
    LDA.W #$0010 : STA.W NumberOfDrops

  .loop:
    JSL GenerateRandomNumber
    AND.W #$00FF : CLC : ADC.W #$0080 : STA.B DP_Temp12
    LDA.W RandomNumberSeed : AND.W #$3F00 : XBA : CLC : ADC.W #$0160 : STA.B DP_Temp14
    LDA.W #EnemyHeaders_Kraid
    JSL Spawn_Enemy_Drops
    DEC.W NumberOfDrops : BNE .loop
    PLP : PLY : PLX
    RTL


;;; $BAA4: Bomb Torizo death item drop routine ;;;
BombTorizoDeathItemDropRoutine:
    PHX : PHY : PHP
    LDA.W #$0010 : STA.W NumberOfDrops

  .loop:
    JSL GenerateRandomNumber
    AND.W #$007F : CLC : ADC.W #$0040 : STA.B DP_Temp12
    LDA.W RandomNumberSeed : AND.W #$3F00 : XBA : CLC : ADC.W #$0060 : STA.B DP_Temp14
    LDA.W #EnemyHeaders_BombTorizo
    JSL Spawn_Enemy_Drops
    DEC.W NumberOfDrops : BNE .loop
    PLP : PLY : PLX
    RTL


;;; $BAD7: Golden Torizo death item drop routine ;;;
GoldenTorizoDeathItemDropRoutine:
    PHX : PHY : PHP
    LDA.W #$0010 : STA.W NumberOfDrops

  .loop:
    JSL GenerateRandomNumber
    AND.W #$00FF : CLC : ADC.W #$0080 : STA.B DP_Temp12
    LDA.W RandomNumberSeed : AND.W #$3F00 : XBA : CLC : ADC.W #$0120 : STA.B DP_Temp14
    LDA.W #EnemyHeaders_BombTorizo
    JSL Spawn_Enemy_Drops
    DEC.W NumberOfDrops : BNE .loop
    PLP : PLY : PLX
    RTL


;;; $BB0A: Spore Spawn death item drop routine ;;;
SporeSpawnDeathItemDropRoutine:
    PHX : PHY : PHP
    LDA.W #$0010 : STA.W NumberOfDrops

  .loop:
    JSL GenerateRandomNumber
    AND.W #$007F : CLC : ADC.W #$0040 : STA.B DP_Temp12
    LDA.W RandomNumberSeed : AND.W #$3F00 : XBA : CLC : ADC.W #$0210 : STA.B DP_Temp14
    LDA.W #EnemyHeaders_SporeSpawn
    JSL Spawn_Enemy_Drops
    DEC.W NumberOfDrops : BNE .loop
    PLP : PLY : PLX
    RTL


;;; $BB3D: Draygon death item drop routine ;;;
DraygonDeathItemDropRoutine:
    PHX : PHY : PHP
    LDA.W #$0010 : STA.W NumberOfDrops

  .loop:
    JSL GenerateRandomNumber
    AND.W #$00FF : CLC : ADC.W #$0080 : STA.B DP_Temp12
    LDA.W RandomNumberSeed : AND.W #$3F00 : XBA : CLC : ADC.W #$0160 : STA.B DP_Temp14
    LDA.W #EnemyHeaders_DraygonBody
    JSL Spawn_Enemy_Drops
    DEC.W NumberOfDrops : BNE .loop
    PLP : PLY : PLX
    RTL


;;; $BB70: Calculate the block containing a pixel position ;;;
CalculateTheBlockContainingAPixelPosition:
;; Parameters:
;;     [S] + 4: Y position
;;     [S] + 6: X position

; Call after pushing a X then Y pixel position onto the stack (2 bytes each)
; CurrentBlockIndex is set to the block index. The stack is cleaned up (do not try to pop Y and X position from stack)
    LDA.B $04,S : LSR #4
    SEP #$20
    STA.W $4202
    LDA.W RoomWidthBlocks : STA.W $4203
    REP #$20
    LDA.B $06,S : LSR #4 : CLC : ADC.W $4216 : STA.W CurrentBlockIndex
    LDA.B $02,S : STA.B $06,S
    LDA.B $01,S : STA.B $05,S
    PLA : PLA
    RTL


;;; $BB9B: Check if X distance between enemy and Samus is at least [A] ;;;
CheckIfXDistanceBetweenEnemyAndSamusIsAtLeastA:
;; Returns:
;;     Carry: Set if X distance between enemy and Samus is at least [A], clear otherwise
    PHA
    LDA.W SamusXPosition : SEC : SBC.W Enemy.XPosition,X : BPL +
    EOR.W #$FFFF : INC

+   CMP.B $01,S
    PLA
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $BBAD: Unused. Check if Y distance between enemy and Samus is at least [A] ;;;
UNUSED_CheckIfYDistanceBetweenEnemyAndSamusIsAtLeastA_A0BBAD:
;; Returns:
;;     Carry: Set if Y distance between enemy and Samus is at least [A], clear otherwise
    PHA
    LDA.W SamusYPosition : SEC : SBC.W Enemy.YPosition,X : BPL +
    EOR.W #$FFFF : INC

+   CMP.B $01,S
    PLA
    RTL
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $BBBF: Check for horizontal "solid" block collision ;;;
CheckForHorizontalSolidBlockCollision:
;; Parameters:
;;     $14.$12: Distance to check for collision (signed)
;; Returns:
;;     Carry: Set if collision, clear otherwise
    PHB
    SEP #$20
    LDA.B #CheckForHorizontalSolidBlockCollision>>16 : PHA : PLB ; pointless?
    REP #$30
    PHX
    LDA.W Enemy.YPosition,X : SEC : SBC.W Enemy.YHitboxRadius,X : AND.W #$FFF0 : STA.B DP_Temp1A
    LDA.W Enemy.YPosition,X : CLC : ADC.W Enemy.YHitboxRadius,X
    DEC : SEC : SBC.B DP_Temp1A
    LSR #4 : STA.B DP_Temp1A
    LDA.W Enemy.YPosition,X : SEC : SBC.W Enemy.YHitboxRadius,X : LSR #4
    SEP #$20
    STA.W $4202
    LDA.W RoomWidthBlocks : STA.W $4203
    REP #$20
    LDA.W Enemy.XSubPosition,X : CLC : ADC.B DP_Temp12 : STA.B DP_Temp16
    LDA.W Enemy.XPosition,X : ADC.B DP_Temp14 : STA.B DP_Temp18
    BIT.B DP_Temp14 : BMI .targetLeftBoundary
    CLC : ADC.W Enemy.XHitboxRadius,X : DEC
    BRA +

  .targetLeftBoundary:
    SEC : SBC.W Enemy.XHitboxRadius,X

+   STA.B DP_Temp22
    LSR #4 : CLC : ADC.W $4216 : ASL : TAX

  .loop:
    LDA.L LevelData,X : BMI +
    TXA : CLC : ADC.W RoomWidthBlocks : ADC.W RoomWidthBlocks : TAX
    DEC.B DP_Temp1A : BPL .loop
    PLX
    CLC
    PLB
    RTL

+   PLX
    STZ.B DP_Temp12
    LDA.B DP_Temp22 : BIT.B DP_Temp14 : BMI .movingLeft
    AND.W #$FFF0 : SEC : SBC.W Enemy.XHitboxRadius,X
    SEC : SBC.W Enemy.XPosition,X : BPL +
    LDA.W #$0000

+   STA.B DP_Temp14
    SEC
    PLB
    RTL

  .movingLeft:
    ORA.W #$000F : SEC : ADC.W Enemy.XHitboxRadius,X
    SEC : SBC.W Enemy.XPosition,X : BMI +
    LDA.W #$0000

+   EOR.W #$FFFF : INC : STA.B DP_Temp14
    SEC
    PLB
    RTL


;;; $BC76: Check for vertical "solid" block collision ;;;
CheckForVerticalSolidBlockCollision:
;; Parameters:
;;     $14.$12: Distance to check for collision (signed)
;; Returns:
;;     Carry: Set if collision, clear otherwise
    PHB
    SEP #$20
    LDA.B #CheckForVerticalSolidBlockCollision>>16 : PHA : PLB
    REP #$30
    PHX
    LDA.W Enemy.XPosition,X : SEC : SBC.W Enemy.XHitboxRadius,X : AND.W #$FFF0 : STA.B DP_Temp1A
    LDA.W Enemy.XPosition,X : CLC : ADC.W Enemy.XHitboxRadius,X : DEC
    SEC : SBC.B DP_Temp1A : LSR #4 : STA.B DP_Temp1A
    LDA.W Enemy.YSubPosition,X : CLC : ADC.B DP_Temp12 : STA.B DP_Temp16
    LDA.W Enemy.YPosition,X : ADC.B DP_Temp14 : STA.B DP_Temp18
    BIT.B DP_Temp14 : BMI .targetFrontBoundary
    CLC : ADC.W Enemy.YHitboxRadius,X : DEC
    BRA +

  .targetFrontBoundary:
    SEC : SBC.W Enemy.YHitboxRadius,X

+   STA.B DP_Temp22
    LSR #4
    SEP #$20
    STA.W $4202
    LDA.W RoomWidthBlocks : STA.W $4203
    REP #$20
    LDA.W Enemy.XPosition,X : SEC : SBC.W Enemy.XHitboxRadius,X
    LSR #4 : CLC : ADC.W $4216 : ASL : TAX

  .loop:
    LDA.L LevelData,X : BMI +
    INX #2
    DEC.B DP_Temp1A : BPL .loop
    PLX
    CLC
    PLB
    RTL

+   PLX
    STZ.B DP_Temp12
    LDA.B DP_Temp22 : BIT.B DP_Temp14 : BMI .movingUp
    AND.W #$FFF0 : SEC : SBC.W Enemy.YHitboxRadius,X
    SEC : SBC.W Enemy.YPosition,X : BPL .returnCarrySet
    LDA.W #$0000

  .returnCarrySet:
    STA.B DP_Temp14
    SEC
    PLB
    RTL

  .movingUp:
    ORA.W #$000F : SEC : ADC.W Enemy.YHitboxRadius,X
    SEC : SBC.W Enemy.YPosition,X : BMI +
    LDA.W #$0000

+   EOR.W #$FFFF : INC : STA.B DP_Temp14
    SEC
    PLB
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $BD26: Unused. Move enemy right by [$14].[$12], no block collision reactions ;;;
UNUSED_MoveEnemyRight_NoBlockCollisionReactions_A0BD26:
;; Parameters:
;;     A: Direction. 0 = left, 1 = right
;;     $14.$12: Distance to move (signed)
;; Returns:
;;     Carry: Set if collision, clear otherwise
    PHB
    SEP #$20
    LDA.B #UNUSED_MoveEnemyRight_NoBlockCollisionReactions_A0BD26>>16 : PHA : PLB
    REP #$30
    PHX
    STA.B DP_Temp1C
    LDA.W Enemy.YPosition,X : SEC : SBC.W Enemy.YHitboxRadius,X : AND.W #$FFF0 : STA.B DP_Temp1A
    LDA.W Enemy.YPosition,X : CLC : ADC.W Enemy.YHitboxRadius,X : DEC
    SEC : SBC.B DP_Temp1A : LSR #4 : STA.B DP_Temp1A
    LDA.W Enemy.YPosition,X : SEC : SBC.W Enemy.YHitboxRadius,X : LSR #4
    SEP #$20
    STA.W $4202
    LDA.W RoomWidthBlocks : STA.W $4203
    REP #$20
    LDA.B DP_Temp1C : LSR : BCC .zero1C
    LDA.W Enemy.XSubPosition,X : CLC : ADC.B DP_Temp12 : STA.B DP_Temp16
    LDA.W Enemy.XPosition,X : ADC.B DP_Temp14 : STA.B DP_Temp18
    CLC : ADC.W Enemy.XHitboxRadius,X : DEC
    BRA +

  .zero1C:
    LDA.W Enemy.XSubPosition,X : SEC : SBC.B DP_Temp12 : STA.B DP_Temp16
    LDA.W Enemy.XPosition,X : SBC.B DP_Temp14 : STA.B DP_Temp18
    SEC : SBC.W Enemy.XHitboxRadius,X

+   STA.B DP_Temp22
    LSR #4 : CLC : ADC.W $4216 : ASL : TAX

  .loop:
    LDA.L LevelData,X : BMI +
    TXA : CLC : ADC.W RoomWidthBlocks : ADC.W RoomWidthBlocks : TAX
    DEC.B DP_Temp1A : BPL .loop
    PLX
    LDA.B DP_Temp16 : STA.W Enemy.XSubPosition,X
    LDA.B DP_Temp18 : STA.W Enemy.XPosition,X
    CLC
    PLB
    RTL

+   PLX
    STZ.W Enemy.XSubPosition,X
    LDA.B DP_Temp1C : LSR : BCC .movingLeft
    LDA.B DP_Temp22 : AND.W #$FFF0 : SEC : SBC.W Enemy.XHitboxRadius,X
    CMP.W Enemy.XPosition,X : BMI .returnCarrySetUpper
    STA.W Enemy.XPosition,X

  .returnCarrySetUpper:
    SEC
    PLB
    RTL

  .movingLeft:
    LDA.B DP_Temp22 : ORA.W #$000F : SEC : ADC.W Enemy.XHitboxRadius,X
    SEC : CMP.W Enemy.XPosition,X : BEQ .storeX
    BPL .returnCarrySetLower

  .storeX:
    STA.W Enemy.XPosition,X

  .returnCarrySetLower:
    SEC
    PLB
    RTL


;;; $BDF6: Unused. Move enemy down by [$14].[$12], no block collision reactions ;;;
UNUSED_MoveEnemyDown_NoBlockCollisionReactions_A0BDF6:
;; Parameters:
;;     A: Direction. 0 = up, 1 = down
;;     $14.$12: Distance to move (unsigned)
;; Returns:
;;     Carry: Set if collision, clear otherwise
    PHB
    SEP #$20
    LDA.B #UNUSED_MoveEnemyDown_NoBlockCollisionReactions_A0BDF6>>16 : PHA : PLB
    REP #$30
    STA.B DP_Temp1C
    PHX
    LDA.W Enemy.XPosition,X : SEC : SBC.W Enemy.XHitboxRadius,X : AND.W #$FFF0 : STA.B DP_Temp1A
    LDA.W Enemy.XPosition,X : CLC : ADC.W Enemy.XHitboxRadius,X : DEC
    SEC : SBC.B DP_Temp1A : LSR #4 : STA.B DP_Temp1A
    LDA.B DP_Temp1C : LSR : BCC .zero1C
    LDA.W Enemy.YSubPosition,X : CLC : ADC.B DP_Temp12 : STA.B DP_Temp16
    LDA.W Enemy.YPosition,X : ADC.B DP_Temp14 : STA.B DP_Temp18
    CLC : ADC.W Enemy.YHitboxRadius,X : DEC
    BRA +

  .zero1C:
    LDA.W Enemy.YSubPosition,X : SEC : SBC.B DP_Temp12 : STA.B DP_Temp16
    LDA.W Enemy.YPosition,X : SBC.B DP_Temp14 : STA.B DP_Temp18
    SEC : SBC.W Enemy.YHitboxRadius,X

+   STA.B DP_Temp22
    LSR #4
    SEP #$20
    STA.W $4202
    LDA.W RoomWidthBlocks : STA.W $4203
    REP #$20
    LDA.W Enemy.XPosition,X : SEC : SBC.W Enemy.XHitboxRadius,X
    LSR #4 : CLC : ADC.W $4216 : ASL : TAX

  .loop:
    LDA.L LevelData,X : BMI +
    INX #2
    DEC.B DP_Temp1A : BPL .loop
    PLX
    LDA.B DP_Temp16 : STA.W Enemy.YSubPosition,X
    LDA.B DP_Temp18 : STA.W Enemy.YPosition,X
    CLC
    PLB
    RTL

+   PLX
    STZ.W Enemy.YSubPosition,X
    LDA.B DP_Temp1C : LSR : BCC .movingUp
    LDA.B DP_Temp22 : AND.W #$FFF0 : SEC : SBC.W Enemy.YHitboxRadius,X
    CMP.W Enemy.YPosition,X : BMI .returnCarrySetUpper
    STA.W Enemy.YPosition,X

  .returnCarrySetUpper:
    SEC
    PLB
    RTL

  .movingUp:
    LDA.B DP_Temp22 : ORA.W #$000F : SEC : ADC.W Enemy.YHitboxRadius,X
    SEC : CMP.W Enemy.YPosition,X : BEQ .storeY ; >.<
    BPL .returnCarrySetLower

  .storeY:
    STA.W Enemy.YPosition,X

  .returnCarrySetLower:
    SEC
    PLB
    RTL


;;; $BEBF: Unused. Check for horizontal "solid" block collision ;;;
UNUSED_CheckForHorizontalSolidBlockCollision_A0BEBF:
;; Parameters:
;;     A: Direction. 0 = left, 1 = right
;;     $14.$12: Distance to check for collision (unsigned)
;; Returns:
;;     Carry: Set if collision, clear otherwise
    STA.B DP_Temp1C
    PHB
    SEP #$20
    LDA.B #UNUSED_CheckForHorizontalSolidBlockCollision_A0BEBF>>16 : PHA : PLB
    REP #$30
    PHX
    LDA.W Enemy.YPosition,X : SEC : SBC.W Enemy.YHitboxRadius,X
    AND.W #$FFF0 : STA.B DP_Temp1A
    LDA.W Enemy.YPosition,X : CLC : ADC.W Enemy.YHitboxRadius,X
    DEC : SEC : SBC.B DP_Temp1A : LSR #4 : STA.B DP_Temp1A
    LDA.W Enemy.YPosition,X : SEC : SBC.W Enemy.YHitboxRadius,X : LSR #4
    SEP #$20
    STA.W $4202
    LDA.W RoomWidthBlocks : STA.W $4203
    REP #$20
    LDA.B DP_Temp1C : LSR : BCC .zero1C
    LDA.W Enemy.XSubPosition,X : CLC : ADC.B DP_Temp12 : STA.B DP_Temp16
    LDA.W Enemy.XPosition,X : ADC.B DP_Temp14 : STA.B DP_Temp18
    CLC : ADC.W Enemy.XHitboxRadius,X : DEC
    BRA +

  .zero1C:
    LDA.W Enemy.XSubPosition,X : SEC : SBC.B DP_Temp12 : STA.B DP_Temp16
    LDA.W Enemy.XPosition,X : SBC.B DP_Temp14 : STA.B DP_Temp18
    SEC : SBC.W Enemy.XHitboxRadius,X

+   STA.B DP_Temp22
    LSR #4 : CLC : ADC.W $4216 : ASL : TAX

  .loop:
    LDA.L LevelData,X : BMI +
    TXA : CLC : ADC.W RoomWidthBlocks : ADC.W RoomWidthBlocks : TAX
    DEC.B DP_Temp1A : BPL .loop
    PLX
    CLC
    PLB
    RTL

+   PLX
    STZ.B DP_Temp12
    LDA.B DP_Temp1C : LSR : BCC .movingLeft
    LDA.B DP_Temp22 : AND.W #$FFF0 : SEC : SBC.W Enemy.XHitboxRadius,X : SBC.W Enemy.XPosition,X : BPL +
    LDA.W #$0000

+   STA.B DP_Temp14
    SEC
    PLB
    RTL

  .movingLeft:
    LDA.B DP_Temp22 : ORA.W #$000F : SEC : ADC.W Enemy.XHitboxRadius,X
    SEC : SBC.W Enemy.XPosition,X : BMI +
    LDA.W #$0000

+   EOR.W #$FFFF : INC : STA.B DP_Temp14
    SEC
    PLB
    RTL
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $BF8A: Check for vertical "solid" block collision ;;;
CheckForVerticalSolidBlockCollision_SkreeMetaree:
;; Parameters:
;;     A: Bit 0 = direction. Clear = up, set = down
;;     X: Enemy index
;;     $14.$12: Distance to check for collision (unsigned)
;; Returns:
;;     Carry: Set if collision, clear otherwise

; Used by skree/metaree. Only used for downwards direction
    STA.B DP_Temp1C
    PHB
    SEP #$20
    LDA.B #CheckForVerticalSolidBlockCollision_SkreeMetaree>>16 : PHA : PLB
    REP #$30
    PHX
    LDA.W Enemy.XPosition,X : SEC : SBC.W Enemy.XHitboxRadius,X : AND.W #$FFF0 : STA.B DP_Temp1A
    LDA.W Enemy.XPosition,X : CLC : ADC.W Enemy.XHitboxRadius,X : DEC
    SEC : SBC.B DP_Temp1A : LSR #4 : STA.B DP_Temp1A
    LDA.B DP_Temp1C : LSR : BCC .zero1C
    LDA.W Enemy.YSubPosition,X : CLC : ADC.B DP_Temp12 : STA.B DP_Temp16
    LDA.W Enemy.YPosition,X : ADC.B DP_Temp14 : STA.B DP_Temp18
    CLC : ADC.W Enemy.YHitboxRadius,X : DEC
    BRA +

  .zero1C:
    LDA.W Enemy.YSubPosition,X : SEC : SBC.B DP_Temp12 : STA.B DP_Temp16
    LDA.W Enemy.YPosition,X : SBC.B DP_Temp14 : STA.B DP_Temp18
    SEC : SBC.W Enemy.YHitboxRadius,X

+   STA.B DP_Temp22
    LSR #4
    SEP #$20
    STA.W $4202
    LDA.W RoomWidthBlocks : STA.W $4203
    REP #$20
    LDA.W Enemy.XPosition,X : SEC : SBC.W Enemy.XHitboxRadius,X
    LSR #4 : CLC : ADC.W $4216 : ASL : TAX

  .loop:
    LDA.L LevelData,X : BMI +
    INX #2
    DEC.B DP_Temp1A : BPL .loop
    PLX
    CLC
    PLB
    RTL

+   PLX
    STZ.B DP_Temp12
    LDA.B DP_Temp1C : LSR : BCC .movingUp
    LDA.B DP_Temp22 : AND.W #$FFF0 : SEC : SBC.W Enemy.YHitboxRadius,X : SBC.W Enemy.YPosition,X : BPL +
    LDA.W #$0000

+   STA.B DP_Temp14
    SEC
    PLB
    RTL

  .movingUp:
    LDA.B DP_Temp22 : ORA.W #$000F : SEC : ADC.W Enemy.YHitboxRadius,X
    SEC : SBC.W Enemy.YPosition,X : BMI +
    LDA.W #$0000

+   EOR.W #$FFFF : INC : STA.B DP_Temp14
    SEC
    PLB
    RTL


;;; $C04E: Calculate angle of Samus from enemy projectile ;;;
CalculateAngleOfSamusFromEnemyProjectile:
;; Parameters:
;;     X: Origin enemy projectile index
;; Returns:
;;     A: The angle between the line from the enemy projectile to Samus and the negative y axis in 100h / (2 pi) radians

; Graphically:
;           0
;           |
;     C0h   #   40h
;
;          80h
;
; Where # is the origin enemy projectile and | is the negative y axis

; Assumes Samus and enemy are with FFh pixels of each other in both dimensions
; Used by Golden Torizo super missile
    PHP
    REP #$30
    LDA.W SamusXPosition : SEC : SBC.W EnemyProjectile_XPositions,X : STA.B DP_Temp12
    LDA.W SamusYPosition : SEC : SBC.W EnemyProjectile_YPositions,X : STA.B DP_Temp14
    JMP CalculateAngleOfXYOffset


;;; $C066: Calculate angle of Samus from enemy ;;;
CalculateAngleOfSamusFromEnemy:
;; Parameters:
;;     X: Origin enemy index
;; Returns:
;;     A: The angle between the line from the enemy to Samus and the negative y axis in 100h / (2 pi) radians

; Graphically:
;           0
;           |
;     C0h   #   40h
;
;          80h
;
; Where # is the origin enemy and | is the negative y axis

; Assumes Samus and enemy are with FFh pixels of each other in both dimensions
    PHP
    REP #$30
    LDA.W SamusXPosition : SEC : SBC.W Enemy.XPosition,X : STA.B DP_Temp12
    LDA.W SamusYPosition : SEC : SBC.W Enemy.YPosition,X : STA.B DP_Temp14
    JMP CalculateAngleOfXYOffset


if !FEATURE_KEEP_UNREFERENCED
;;; $C07E: Unused. Calculate angle of enemy [Y] from enemy [X] ;;;
UNUSED_CalculateAngleOfEnemyYFromEnemyX_A0C07E:
;; Parameters:
;;     X: Origin enemy index
;;     Y: Target enemy index
;; Returns:
;;     A: The angle between the line from enemy [X] to enemy [Y] and the negative y axis in 100h / (2 pi) radians

; Graphically:
;           0
;           |
;     C0h   #   40h
;
;          80h
;
; Where # is the origin enemy and | is the negative y axis
    PHP
    REP #$30
    LDA.W Enemy.XPosition,Y : SEC : SBC.W Enemy.XPosition,X : STA.B DP_Temp12
    LDA.W Enemy.YPosition,Y : SEC : SBC.W Enemy.YPosition,X : STA.B DP_Temp14
    JMP CalculateAngleOfXYOffset
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $C096: Calculate angle of enemy [X] from enemy [Y] ;;;
CalculateAngleOfEnemyYFromEnemyX:
;; Parameters:
;;     X: Target enemy index
;;     Y: Origin enemy index
;; Returns:
;;     A: The angle between the line from enemy [Y] to enemy [X] and the negative y axis in 100h / (2 pi) radians

; Graphically:
;           0
;           |
;     C0h   #   40h
;
;          80h
;
; Where # is the origin enemy and | is the negative y axis

; Assumes enemies are with FFh pixels of each other in both dimensions

; Used by shaktool
    PHP
    REP #$30
    LDA.W Enemy.XPosition,X : SEC : SBC.W Enemy.XPosition,Y : STA.B DP_Temp12
    LDA.W Enemy.YPosition,X : SEC : SBC.W Enemy.YPosition,Y : STA.B DP_Temp14
    JMP CalculateAngleOfXYOffset


;;; $C0AE: Calculate angle of ([$12], [$14]) offset ;;;
CalculateAngleOf_12_14_Offset:
;; Parameters:
;;     $12: X offset
;;     $14: Y offset
;; Returns:
;;     A: The angle between the line from (0, 0) to (x, y) and the negative y axis in 100h / (2 pi) radians

; Graphically:
;           0
;           |
;     C0h   #   40h
;
;          80h
;
; Where # is the origin and | is the negative y axis

; Assumes -FFh <= x,y <= FFh
    PHP
    REP #$30
; fallthrough to CalculateAngleOfXYOffset


;;; $C0B1: Calculate angle of (x, y) offset ;;;
CalculateAngleOfXYOffset:
;; Parameters:
;;     $12: X offset
;;     $14: Y offset
;; Returns:
;;     A: The angle between the line from (0, 0) to (x, y) and the negative y axis in 100h / (2 pi) radians

; Graphically:
;           0
;           |
;     C0h   #   40h
;
;          80h
;
; Where # is the origin and | is the negative y axis

; Assumes PSR has been pushed
; Assumes -FFh <= x,y <= FFh

; Determines the result octant from the signs of the parameter co-ordinates,
; then approximates the inverse tangent within the octant as:
;     100h/(2 pi) arctan(z) ~= 32 z
; Which is approximating the taylor series around zero up to the second order:
;     100h/(2 pi) arctan(z) ~= 40.7 z
    PHX
    LDX.W #$0000
    LDA.B DP_Temp12 : BPL .positive12
    LDX.W #$0004
    EOR.W #$FFFF : INC

  .positive12:
    STA.B DP_Temp12
    LDA.B DP_Temp14 : BPL .positive14
    INX #2
    EOR.W #$FFFF : INC

  .positive14:
    STA.B DP_Temp14
    CMP.B DP_Temp12 : BCC .lowerOctant
    SEP #$20
    STZ.W $4204
    LDA.B DP_Temp12 : STA.W $4205
    LDA.B DP_Temp14 : STA.W $4206
    NOP
    REP #$20
    JSR.W (.pointers,X)
    PLX : PLP
    RTL

  .pointers:
    dw CalculateAngleOfXYOffset_BottomRightLowerOctant
    dw CalculateAngleOfXYOffset_TopRightUpperOctant
    dw CalculateAngleOfXYOffset_BottomLeftLowerOctant
    dw CalculateAngleOfXYOffset_TopLeftUpperOctant

  .lowerOctant:
    SEP #$20
    STZ.W $4204
    LDA.B DP_Temp14 : STA.W $4205
    LDA.B DP_Temp12 : STA.W $4206
    NOP
    REP #$20
    JSR.W (..pointers,X)
    PLX : PLP
    RTL

  ..pointers:
    dw CalculateAngleOfXYOffset_BottomRightUpperOctant
    dw CalculateAngleOfXYOffset_TopRightLowerOctant
    dw CalculateAngleOfXYOffset_BottomLeftUpperOctant
    dw CalculateAngleOfXYOffset_TopLeftLowerOctant


;;; $C112: Calculate angle of (x, y) offset - bottom right upper octant ;;;
CalculateAngleOfXYOffset_BottomRightUpperOctant:
; A = 40h + quotient / 8
    LDA.W $4214 : LSR #3 : CLC : ADC.W #$0040 : AND.W #$00FF
    RTS


;;; $C120: Calculate angle of (x, y) offset - bottom right lower octant ;;;
CalculateAngleOfXYOffset_BottomRightLowerOctant:
; A = 80h - quotient / 8
    LDA.W $4214 : LSR #3 : STA.B DP_Temp12
    LDA.W #$0080 : SEC : SBC.B DP_Temp12 : AND.W #$00FF
    RTS


;;; $C132: Calculate angle of (x, y) offset - top right upper octant ;;;
CalculateAngleOfXYOffset_TopRightUpperOctant:
    LDA.W $4214 : LSR #3 : AND.W #$00FF
    RTS


;;; $C13C: Calculate angle of (x, y) offset - top right lower octant ;;;
CalculateAngleOfXYOffset_TopRightLowerOctant:
; A = 40h - quotient / 8
    LDA.W $4214 : LSR #3 : STA.B DP_Temp12
    LDA.W #$0040 : SEC : SBC.B DP_Temp12 : AND.W #$00FF
    RTS


;;; $C14E: Calculate angle of (x, y) offset - bottom left lower octant ;;;
CalculateAngleOfXYOffset_BottomLeftLowerOctant:
; A = 80h + quotient / 8
    LDA.W $4214 : LSR #3 : CLC : ADC.W #$0080 : AND.W #$00FF
    RTS


;;; $C15C: Calculate angle of (x, y) offset - bottom left upper octant ;;;
CalculateAngleOfXYOffset_BottomLeftUpperOctant:
; A = C0h - quotient / 8
    LDA.W $4214 : LSR #3 : STA.B DP_Temp12
    LDA.W #$00C0 : SEC : SBC.B DP_Temp12 : AND.W #$00FF
    RTS


;;; $C16E: Calculate angle of (x, y) offset - top left lower octant ;;;
CalculateAngleOfXYOffset_TopLeftLowerOctant:
; A = C0h + quotient / 8
    LDA.W $4214 : LSR #3 : CLC : ADC.W #$00C0 : AND.W #$00FF
    RTS


;;; $C17C: Calculate angle of (x, y) offset - top left upper octant ;;;
CalculateAngleOfXYOffset_TopLeftUpperOctant:
; A = 100h - quotient / 8
    LDA.W $4214 : LSR #3 : STA.B DP_Temp12
    LDA.W #$0100 : SEC : SBC.B DP_Temp12 : AND.W #$00FF
    RTS


;;; $C18E: Check if enemy is horizontally off-screen ;;;
CheckIfEnemyIsHorizontallyOffScreen:
;; Parameters:
;;     X: Enemy index
;; Returns:
;;     A/carry: Set if off-screen, clear otherwise
    LDA.W Enemy.XPosition,X : BMI .offScreen
    CLC : ADC.W Enemy.XHitboxRadius,X
    SEC : SBC.W Layer1XPosition : BMI .offScreen
    SEC : SBC.W #$0100
    SEC : SBC.W Enemy.XHitboxRadius,X : BPL .offScreen
    LDA.W #$0000
    CLC
    RTL

  .offScreen:
    LDA.W #$0001
    SEC
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $C1B1: Unused. Check if enemy is vertically off-screen ;;;
UNUSED_CheckIfEnemyIsVerticallyOffScreen_A0C1B1:
;; Parameters:
;;     X: Enemy index
;; Returns:
;;     A/carry: Set if off-screen, clear otherwise
    LDA.W Enemy.YPosition,X : BMI .offScreen
    CLC : ADC.W Enemy.YHitboxRadius,X
    SEC : SBC.W Layer1YPosition : BMI .offScreen
    SEC : SBC.W #$0100
    SEC : SBC.W Enemy.YHitboxRadius,X : BPL .offScreen
    LDA.W #$0000
    CLC
    RTL

  .offScreen:
    LDA.W #$0001
    SEC
    RTL


;;; $C1D4: Unused. Assess Samus threat level ;;;
UNUSED_AssessSamusThreatLevel_A0C1D4:
; ?
    LDA.W MaxEnergy : STA.W $4204
    SEP #$20
    LDA.B #$03 : STA.W $4206
    REP #$20
    NOP #3
    LDA.W $4214 : CMP.W Energy : BCC +
    LDA.W #$0001
    BRA .store12

+   ASL : CMP.W Energy : BCC .load3
    LDA.W #$0002
    BRA .store12

  .load3:
    LDA.W #$0003

  .store12:
    STA.B DP_Temp12
    LDA.W CollectedBeams : AND.W #$000F : EOR.W #$FFFF : STA.B DP_Temp16
    LDA.W CollectedItems : EOR.W #$FFFF : STA.B DP_Temp18
    LDA.W #$0000 : LSR.B DP_Temp16 : BCS +
    ADC.W #$0002

+   LSR.B DP_Temp16 : BCS +
    ADC.W #$0001

+   LSR.B DP_Temp16 : BCS +
    ADC.W #$0003

+   LSR.B DP_Temp16 : BCS +
    ADC.W #$0003

+   LSR.B DP_Temp18 : BCS +
    ADC.W #$0000

+   LSR.B DP_Temp18 : BCS +
    ADC.W #$0000

+   LSR.B DP_Temp18 : BCS +
    ADC.W #$0000

+   LSR.B DP_Temp18 : BCS +
    ADC.W #$0003

+   CLC : ADC.W SuperMissiles
    CLC : ADC.W PowerBombs : STA.B DP_Temp14
    CMP.W #$000B : BCC .return
    INC.B DP_Temp12
    CMP.W #$001E : BCC .return
    INC.B DP_Temp12

  .return:
    RTL
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $C26A: Process enemy instructions ;;;
ProcessEnemyInstructions:
    PHB
    LDX.W EnemyIndex
    LDA.W Enemy.AI,X : AND.W #$0004 : BNE .return
    DEC.W Enemy.instTimer,X : BNE .noUpdate
    LDA.W Enemy.bank-1,X : PHA : PLB : PLB
    LDY.W Enemy.instList,X

  .loop:
    LDA.W $0000,Y : BPL .timer
    STA.W EnemyAIPointer
    INY #2
    PHK : PEA .loop-1
    JML.W [EnemyAIPointer]


  .timer:
    STA.W Enemy.instTimer,X
    LDA.W $0002,Y : STA.W Enemy.spritemap,X
    TYA : CLC : ADC.W #$0004 : STA.W Enemy.instList,X
    LDA.W Enemy.properties2,X : ORA.W #$8000 : STA.W Enemy.properties2,X

  .return:
; Sleep/wait/delete instructions return to here
    PLB
    RTS

  .noUpdate:
    LDA.W Enemy.properties2,X : AND.W #$7FFF : STA.W Enemy.properties2,X
    PLB
    RTS


;;; $C2BC: Clear carry ;;;
CLCRTS_A0C2BC:
    CLC
    RTS


;;; $C2BE: Set carry ;;;
SECRTS_A0C2BE:
    SEC
    RTS


;;; $C2C0: Enemy block collision reaction - spike ;;;
EnemyBlockCollisionReaction_Spike:
;; Returns:
;;     Carry: Set if collision, clear otherwise
    LDX.W CurrentBlockIndex
    LDA.L BTS,X : AND.W #$007F : ASL : TAX
    LDA.L .PLMs,X : BEQ .returnCollision
    JSL Spawn_PLM_to_CurrentBlockIndex
    CLC
    RTS

  .returnCollision:
    SEC
    RTS

  .PLMs:
    dw $0000
    dw $0000
    dw $0000
    dw $0000
    dw $0000
    dw $0000
    dw $0000
    dw $0000
    dw $0000
    dw $0000
    dw $0000
    dw $0000
    dw $0000
    dw $0000
    dw $0000
    dw PLMEntries_EnemyBreakableBlock


;;; $C2FA: Enemy block collision reaction - horizontal - slope ;;;
EnemyBlockCollisionReaction_Horizontal_Slope:
;; Parameters:
;;     $14.$12: Distance to check for collision
;;     $1A: Target boundary position (left/right)
;;     $1C: Number of blocks left to check (0 if final (bottom) block)
;;     $1E: Enemy Y block span
;;     $20: In non-square slope collision:
;;         8000h: Process slopes
;;         4000h: Treat slopes as walls
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $14.$12: If carry clear, adjusted distance to move Samus
    LDX.W CurrentBlockIndex
    LDA.L BTS,X : AND.W #$001F : CMP.W #$0005 : BCS .nonSquare
    JMP EnemyBlockCollisionReaction_Horizontal_Slope_Square

  .nonSquare:
    LDA.L BTS,X : AND.W #$00FF : STA.W CurrentSlopeBTS
    JMP EnemyBlockCollisionReaction_Horizontal_Slope_NonSquare


;;; $C319: Enemy block collision reaction - vertical - slope ;;;
EnemyBlockCollisionReaction_Vertical_Slope:
;; Parameters:
;;     A: [Block BTS] & 1Fh
;;     X: Block index
;;     $18: Target Y position
;;     $1A: Target boundary position (top/bottom)
;;     $1C: Number of blocks left to check (0 if final (rightmost) block)
;;     $1E: Enemy X block span
;; Returns:
;;     Carry: Set if collision, clear otherwise
    LDX.W CurrentBlockIndex
    LDA.L BTS,X : AND.W #$001F : CMP.W #$0005 : BCS .nonSquare
    JMP EnemyBlockCollisionReaction_Vertical_Slope_Square

  .nonSquare:
    JMP EnemyBlockCollisionReaction_Vertical_Slope_NonSquare


;;; $C32E: Enemy block collision reaction - horizontal - slope - square ;;;
EnemyBlockCollisionReaction_Horizontal_Slope_Square:
;; Parameters:
;;     A: [Block BTS] & 1Fh
;;     X: Block index
;;     $1A: Target boundary position (left/right)
;;     $1C: Number of blocks left to check (0 if final (bottom) block)
;;     $1E: Enemy Y block span
;; Returns:
;;     Carry: Set if collision, clear otherwise
    ASL #2 : STA.W SolidSlopeDefinitionTableBaseIndex
    LDA.L BTS-1,X : ROL #3 : AND.W #$0003 : STA.W SlopeCollisionFlipFlags
    LDA.B DP_Temp1A : AND.W #$0008 : LSR #3
    EOR.W SlopeCollisionFlipFlags : ADC.W SolidSlopeDefinitionTableBaseIndex : TAX
    LDY.W EnemyIndex
    LDA.B DP_Temp1C : BNE .topBlockCheck
    LDA.W Enemy.YPosition,Y : CLC : ADC.W Enemy.YHitboxRadius,Y
    DEC : AND.W #$0008 : BNE .checkBothHalves
    LDA.L SquareSlopeDefinitions_BankA0-1,X : BMI .solid
    BRA .returnNoCollision

  .topBlockCheck:
    CMP.B DP_Temp1E : BNE .checkBothHalves
    LDA.W Enemy.YPosition,Y : SEC : SBC.W Enemy.YHitboxRadius,Y : AND.W #$0008 : BNE .checkBottomHalf

  .checkBothHalves:
    LDA.L SquareSlopeDefinitions_BankA0-1,X : BMI .solid

  .checkBottomHalf:
    TXA : EOR.W #$0002 : TAX
    LDA.L SquareSlopeDefinitions_BankA0-1,X : BMI .solid

  .returnNoCollision:
    CLC
    RTS

  .solid:
    SEC
    RTS

  .deadCode:
; Looks like code that was RTS'd out from a time where these collision reaction set the enemy position directly (now moved to MoveEnemyRightBy_14_12_Common_solid)
    TYX
    STZ.W Enemy.XSubPosition,X
    LDA.B DP_Temp1A : BIT.B DP_Temp14 : BMI ..right
    AND.W #$FFF8 : SEC : SBC.W Enemy.XHitboxRadius,X : STA.W Enemy.XPosition,X
    SEC
    RTS

  ..right:
    ORA.W #$0007 : SEC : ADC.W Enemy.XHitboxRadius,X : STA.W Enemy.XPosition,X
    SEC
    RTS


;;; $C3B2: Enemy block collision reaction - vertical - slope - square ;;;
EnemyBlockCollisionReaction_Vertical_Slope_Square:
;; Parameters:
;;     A: [Block BTS] & 1Fh
;;     X: Block index
;;     $1A: Target boundary position (top/bottom)
;;     $1C: Number of blocks left to check (0 if final (rightmost) block)
;;     $1E: Enemy X block span
;; Returns:
;;     Carry: Set if collision, clear otherwise
    ASL #2 : STA.W SolidSlopeDefinitionTableBaseIndex
    LDA.L BTS-1,X : ROL #3 : AND.W #$0003 : STA.W SlopeCollisionFlipFlags
    LDA.B DP_Temp1A : AND.W #$0008 : LSR #2
    EOR.W SlopeCollisionFlipFlags : ADC.W SolidSlopeDefinitionTableBaseIndex : TAX
    LDY.W EnemyIndex
    LDA.B DP_Temp1C : BNE .leftmostBlockCheck
    LDA.W Enemy.XPosition,Y : CLC : ADC.W Enemy.XHitboxRadius,Y
    DEC : AND.W #$0008 : BNE .checkBothHalves
    LDA.L SquareSlopeDefinitions_BankA0-1,X : BMI .solid
    BRA .returnNoCollision

  .leftmostBlockCheck:
    CMP.B DP_Temp1E : BNE .checkBothHalves
    LDA.W Enemy.XPosition,Y : SEC : SBC.W Enemy.XHitboxRadius,Y : AND.W #$0008 : BNE .checkRightHalf

  .checkBothHalves:
    LDA.L SquareSlopeDefinitions_BankA0-1,X : BMI .solid

  .checkRightHalf:
    TXA : EOR.W #$0001 : TAX
    LDA.L SquareSlopeDefinitions_BankA0-1,X : BMI .solid

  .returnNoCollision:
    CLC
    RTS

  .solid:
    SEC
    RTS

  .deadCode:
; Looks like code that was RTS'd out. Without this code, enemies don't align with slopes when the collide with them,
; e.g. an enemy falling at 5px/frame can "land" 4px above a half-height slope
    TYX
    STZ.W Enemy.YSubPosition,X
    LDA.B DP_Temp1A : BIT.B DP_Temp14 : BMI ..bottom
    AND.W #$FFF8 : SEC : SBC.W Enemy.YHitboxRadius,X : STA.W Enemy.YPosition,X
    SEC
    RTS

  ..bottom:
    ORA.W #$0007 : SEC : ADC.W Enemy.YHitboxRadius,X : STA.W Enemy.YPosition,X
    SEC
    RTS


;;; $C435: Square slope definitions ;;;
SquareSlopeDefinitions_BankA0:
; Copy of $94:8E54 for enemies
; 7Fh- = air, 80h+ = solid

;        _____________ Top-left
;       |    _________ Top-right
;       |   |    _____ Bottom-left
;       |   |   |    _ Bottom-right
;       |   |   |   |
    db $00,$01,$82,$83 ; 0: Half height
    db $00,$81,$02,$83 ; 1: Half width
    db $00,$01,$02,$83 ; 2: Quarter
    db $00,$81,$82,$83 ; 3: Three-quarters
    db $80,$81,$82,$83 ; 4: Whole


;;; $C449: Enemy block collision reaction - horizontal - slope - non-square ;;;
EnemyBlockCollisionReaction_Horizontal_Slope_NonSquare:
;; Parameters:
;;     $14.$12: Distance to check for collision
;;     $1A: Target boundary position (left/right)
;;     $1C: Number of blocks left to check (0 if final (bottom) block)
;;     $1E: Enemy Y block span
;;     $20: In non-square slope collision:
;;         8000h: Process slopes
;;         4000h: Treat slopes as walls
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $14.$12: If carry clear, adjusted distance to move Samus
    BIT.B DP_Temp20 : BMI .processSlopes
    BVS .returnCollision
    CLC
    RTS

  .returnCollision:
    SEC
    RTS

  .processSlopes:
    LDA.W CurrentSlopeBTS : AND.W #$001F : ASL #2 : TAX
    LDA.B DP_Temp14 : BPL +
    LDA.L .adjustedDistanceMult,X : TAY
    LDA.B DP_Temp13 : EOR.W #$FFFF : INC
    JSL A_Y_16bit_UnsignedMultiplication
    LDA.W MultiplicationResult : EOR.W #$FFFF : CLC : ADC.W #$0001 : STA.B DP_Temp12
    LDA.W MultiplicationResult+2 : EOR.W #$FFFF : ADC.W #$0000 : STA.B DP_Temp14
    CLC
    RTS

+   LDA.L .adjustedDistanceMult,X : TAY
    LDA.B DP_Temp13
    JSL A_Y_16bit_UnsignedMultiplication
    LDA.W MultiplicationResult : STA.B DP_Temp12
    LDA.W MultiplicationResult+2 : STA.B DP_Temp14
    CLC
    RTS

;        _________ Unused. Seem to be additive speed modifiers in the $94:8586 version of this table
;       |      ___ Adjusted distance multiplier * 100h
;       |     |
  .unused:
    dw $0000
  .adjustedDistanceMult:
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


;;; $C51F: Enemy block collision reaction - vertical - slope - non-square ;;;
EnemyBlockCollisionReaction_Vertical_Slope_NonSquare:
;; Parameters:
;;     $14: Distance to check for collision
;;     $18: Target Y position
;; Returns:
;;     Carry: Set if collision, clear otherwise
    LDY.W EnemyIndex
    LDA.B DP_Temp14 : BPL +
    JMP .up

+   LDX.W CurrentBlockIndex : STX.W $4204
    SEP #$20
    LDA.W RoomWidthBlocks : STA.W $4206
    REP #$20
    LDA.W Enemy.XPosition,Y : LSR #4 : CMP.W $4216 : BEQ +
    CLC
    RTS

+   LDA.B DP_Temp18 : CLC : ADC.W Enemy.YHitboxRadius,Y
    DEC : AND.W #$000F : STA.W TargetBottomTopYOffset
    LDA.L BTS,X : AND.W #$001F : ASL #4 : STA.W SlopeCollisionDefinitionTableBaseIndex
    LDA.L BTS-1,X : BMI .returnUpper
    ASL : BMI .blockBTS40
    LDA.W Enemy.XPosition,Y
    BRA +

  .blockBTS40:
    LDA.W Enemy.XPosition,Y : EOR.W #$000F

+   AND.W #$000F : CLC : ADC.W SlopeCollisionDefinitionTableBaseIndex : TAX
    LDA.L SlopeDefinitions_SlopeTopXOffsetByYPixel,X : AND.W #$001F
    SEC : SBC.W TargetBottomTopYOffset : DEC : BEQ +
    BPL .returnUpper

+   CLC : ADC.B DP_Temp18 : STA.W Enemy.YPosition,Y
    LDA.W #$FFFF : STA.W Enemy.YSubPosition,Y
    SEC
    RTS

  .returnUpper:
    CLC
    RTS

  .up:
    LDX.W CurrentBlockIndex : STX.W $4204
    SEP #$20
    LDA.W RoomWidthBlocks : STA.W $4206
    REP #$20
    LDA.W Enemy.XPosition,Y : LSR #4 : CMP.W $4216 : BEQ +
    CLC
    RTS

+   LDA.B DP_Temp18 : SEC : SBC.W Enemy.YHitboxRadius,Y
    AND.W #$000F : EOR.W #$000F : STA.W TargetBottomTopYOffset
    LDA.L BTS,X : AND.W #$001F : ASL #4 : STA.W SlopeCollisionDefinitionTableBaseIndex
    LDA.L BTS-1,X : BPL .returnLower
    ASL : BMI ..blockBTS40
    LDA.W Enemy.XPosition,Y
    BRA +

  ..blockBTS40:
    LDA.W Enemy.XPosition,Y : EOR.W #$000F

+   AND.W #$000F : CLC : ADC.W SlopeCollisionDefinitionTableBaseIndex : TAX
    LDA.L SlopeDefinitions_SlopeTopXOffsetByYPixel,X : AND.W #$001F
    SEC : SBC.W TargetBottomTopYOffset : DEC : BEQ +
    BPL .returnLower

+   EOR.W #$FFFF : INC
    CLC : ADC.B DP_Temp18 : STA.W Enemy.YPosition,Y
    LDA.W #$0000 : STA.W Enemy.YSubPosition,Y
    SEC
    RTS

  .returnLower:
    CLC
    RTS


;;; $C619: Enemy block collision reaction - horizontal extension ;;;
EnemyBlockCollisionReaction_HorizontalExtension:
;; Returns:
;;     Carry: Clear. No collision

; Clone of $94:9411
; If BTS is 0, acts like air
; Otherwise, offsets block index by block BTS, updates X, and loops back to the `JSR (xxxx, X)` instruction that jumped to here
    LDX.W CurrentBlockIndex
    LDA.L BTS,X : AND.W #$00FF : BEQ .return
    BIT.W #$0080 : BNE .highByte
    AND.W #$00FF
    BRA +

  .highByte:
    ORA.W #$FF00

+   CLC : ADC.W CurrentBlockIndex : STA.W CurrentBlockIndex
    ASL : TAX
    LDA.L LevelData,X : AND.W #$F000 : XBA : LSR #3 : TAX
    PLA : SEC : SBC.W #$0003 : PHA

  .return:
    CLC
    RTS


;;; $C64F: Enemy block collision reaction - vertical extension ;;;
EnemyBlockCollisionReaction_VerticalExtension:
;; Returns:
;;     Carry: Clear. No collision

; Clone of $94:9447
; If BTS is 0, acts like air
; Otherwise, offsets block index by block BTS, updates X, and loops back to the `JSR (xxxx, X)` instruction that jumped to here
    LDX.W CurrentBlockIndex
    LDA.L BTS,X : AND.W #$00FF : BEQ .return
    BIT.W #$0080 : BNE .highByte
    STA.W CollisionVariable
    LDA.W CurrentBlockIndex

-   CLC : ADC.W RoomWidthBlocks
    DEC.W CollisionVariable : BNE -
    JMP +

  .highByte:
    ORA.W #$FF00 : STA.W CollisionVariable
    LDA.W CurrentBlockIndex

  .loop:
    SEC : SBC.W RoomWidthBlocks
    INC.W CollisionVariable : BNE .loop

+   STA.W CurrentBlockIndex : ASL : TAX
    LDA.L LevelData,X : AND.W #$F000 : XBA : LSR #3 : TAX
    PLA : SEC : SBC.W #$0003 : PHA

  .return:
    CLC
    RTS


;;; $C69D: Move enemy right by [$14].[$12], treat slopes as walls ;;;
MoveEnemyRightBy_14_12_TreatSlopesAsWalls:
;; Parameters:
;;     X: Enemy index
;;     $14.$12: Distance to move (signed)
;; Returns:
;;     Carry: Set if collision, clear otherwise

; Used by oum
    LDA.W #$4000 : STA.B DP_Temp20
    BRA MoveEnemyRightBy_14_12_Common


;;; $C6A4: Move enemy right by [$14].[$12], process slopes ;;;
MoveEnemyRightBy_14_12_ProcessSlopes:
;; Parameters:
;;     X: Enemy index
;;     $14.$12: Distance to move (signed)
;; Returns:
;;     Carry: Set if collision, clear otherwise

; Call $A0:C8AD if this routine returns carry clear to adjust the enemy's position for any slopes
; Used by yard and Wrecked Ship orange zoomer
    LDA.W #$8000 : STA.B DP_Temp20
    BRA MoveEnemyRightBy_14_12_Common


;;; $C6AB: Move enemy right by [$14].[$12], ignore slopes ;;;
MoveEnemyRightBy_14_12_IgnoreSlopes:
;; Parameters:
;;     X: Enemy index
;;     $14.$12: Distance to move (signed)
;; Returns:
;;     Carry: Set if collision, clear otherwise

; This is the commonly used one
    STZ.B DP_Temp20
; fallthrough to MoveEnemyRightBy_14_12_Common


;;; $C6AD: Move enemy right by [$14].[$12] ;;;
MoveEnemyRightBy_14_12_Common:
;; Parameters:
;;     X: Enemy index
;;     $14.$12: Distance to move (signed)
;;     $20: In non-square slope collision:
;;         8000h: Process slopes
;;         4000h: Treat slopes as walls
;; Returns:
;;     Carry: Set if collision, clear otherwise
    LDA.B DP_Temp12 : ORA.B DP_Temp14 : BNE .notZero
    CLC
    RTL

  .notZero:
    PHX
    LDA.W Enemy.YPosition,X : SEC : SBC.W Enemy.YHitboxRadius,X
    AND.W #$FFF0 : STA.B DP_Temp1C
    LDA.W Enemy.YPosition,X : CLC : ADC.W Enemy.YHitboxRadius,X : DEC
    SEC : SBC.B DP_Temp1C : LSR #4 : STA.B DP_Temp1C : STA.B DP_Temp1E
    LDA.W Enemy.YPosition,X : SEC : SBC.W Enemy.YHitboxRadius,X : LSR #4
    SEP #$20
    STA.W $4202
    LDA.W RoomWidthBlocks : STA.W $4203
    REP #$20
    LDA.W Enemy.XSubPosition,X : CLC : ADC.B DP_Temp12 : STA.B DP_Temp16
    LDA.W Enemy.XPosition,X : ADC.B DP_Temp14 : STA.B DP_Temp18
    BIT.B DP_Temp14 : BMI .targetLeftBoundary
    CLC : ADC.W Enemy.XHitboxRadius,X : DEC
    BRA +

  .targetLeftBoundary:
    SEC : SBC.W Enemy.XHitboxRadius,X

+   STA.B DP_Temp1A
    LSR #4 : CLC : ADC.W $4216 : ASL : TAX

  .loop:
    LDA.L LevelData,X
    JSR EnemyHorizontalBlockReaction
    BCS .solid
    TXA : CLC : ADC.W RoomWidthBlocks : ADC.W RoomWidthBlocks : TAX
    DEC.B DP_Temp1C : BPL .loop
    PLX
    LDA.B DP_Temp12 : CLC : ADC.W Enemy.XSubPosition,X : STA.W Enemy.XSubPosition,X
    LDA.B DP_Temp14 : ADC.W Enemy.XPosition,X : STA.W Enemy.XPosition,X
    CLC
    RTL

; Nothing points here, dead code
    PLX
    SEC
    RTL

  .solid:
    PLX
    LDA.B DP_Temp1A : BIT.B DP_Temp14 : BMI .movingLeft
    AND.W #$FFF0 : SEC : SBC.W Enemy.XHitboxRadius,X : CMP.W Enemy.XPosition,X : BCC +
    STA.W Enemy.XPosition,X

+   LDA.W #$FFFF : STA.W Enemy.XSubPosition,X
    SEC
    RTL

  .movingLeft:
    ORA.W #$000F : SEC : ADC.W Enemy.XHitboxRadius,X : CMP.W Enemy.XPosition,X : BEQ .storeX
    BCS .storeSubX

  .storeX:
    STA.W Enemy.XPosition,X

  .storeSubX:
    STZ.W Enemy.XSubPosition,X
    SEC
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $C778: Unused. Move enemy down by [$14].[$12] ;;;
UNUSED_MoveEnemyDownBy_14_12_A0C778:
;; Parameters:
;;     X: Enemy index
;;     $12: Y suboffset to move by
;;     $14: Y offset to move by
;; Returns:
;;     Carry: Set if collided with wall
    LDA.W #$4000 : STA.B DP_Temp20
    BRA MoveEnemyDownBy_14_12_BranchEntry


;;; $C77F: Unused. Move enemy down by [$14].[$12] ;;;
UNUSED_MoveEnemyDownBy_14_12_A0C77F:
;; Parameters:
;;     X: Enemy index
;;     $12: Y suboffset to move by
;;     $14: Y offset to move by
;; Returns:
;;     Carry: Set if collided with wall
    LDA.W #$8000 : STA.B DP_Temp20
    BRA MoveEnemyDownBy_14_12_BranchEntry
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $C786: Move enemy down by [$14].[$12] ;;;
MoveEnemyDownBy_14_12:
;; Parameters:
;;     X: Enemy index
;;     $14.$12: Distance to move (signed)
;; Returns:
;;     Carry: Set if collision, clear otherwise

; This is the commonly (and only) used one
    STZ.B DP_Temp20
; fallthrough to MoveEnemyDownBy_14_12_BranchEntry


;;; $C788: Move enemy down by [$14].[$12] ;;;
MoveEnemyDownBy_14_12_BranchEntry:
;; Parameters:
;;     X: Enemy index
;;     $14.$12: Distance to move (signed)
;; Returns:
;;     Carry: Set if collision, clear otherwise

; The value of $20 actually has no effect for vertical movement
    LDA.B DP_Temp12 : ORA.B DP_Temp14 : BNE .notZero
    CLC
    RTL

  .notZero:
    PHX
    LDA.W Enemy.XPosition,X : SEC : SBC.W Enemy.XHitboxRadius,X : AND.W #$FFF0 : STA.B DP_Temp1C
    LDA.W Enemy.XPosition,X : CLC : ADC.W Enemy.XHitboxRadius,X : DEC
    SEC : SBC.B DP_Temp1C : LSR #4 : STA.B DP_Temp1C : STA.B DP_Temp1E
    LDA.W Enemy.YSubPosition,X : CLC : ADC.B DP_Temp12 : STA.B DP_Temp16
    LDA.W Enemy.YPosition,X : ADC.B DP_Temp14 : STA.B DP_Temp18
    BIT.B DP_Temp14 : BMI .targetFrontBoundary
    CLC : ADC.W Enemy.YHitboxRadius,X : DEC
    BRA +

  .targetFrontBoundary:
    SEC : SBC.W Enemy.YHitboxRadius,X

+   STA.B DP_Temp1A
    LSR #4
    SEP #$20
    STA.W $4202
    LDA.W RoomWidthBlocks : STA.W $4203
    REP #$20
    LDA.W Enemy.XPosition,X : SEC : SBC.W Enemy.XHitboxRadius,X
    LSR #4 : CLC : ADC.W $4216 : ASL : TAX

  .loop:
    LDA.L LevelData,X
    JSR EnemyVerticalBlockReaction
    BCS .solid
    INX #2
    DEC.B DP_Temp1C : BPL .loop
    PLX
    LDA.B DP_Temp16 : STA.W Enemy.YSubPosition,X
    LDA.B DP_Temp18 : STA.W Enemy.YPosition,X
    CLC
    RTL

; Nothing points here, dead code
    PLX
    SEC
    RTL

  .solid:
    PLX
    LDA.B DP_Temp1A : BIT.B DP_Temp14 : BMI .movingUp
    AND.W #$FFF0 : SEC : SBC.W Enemy.YHitboxRadius,X : CMP.W Enemy.YPosition,X : BCC +
    STA.W Enemy.YPosition,X

+   LDA.W #$FFFF : STA.W Enemy.YSubPosition,X
    SEC
    RTL

  .movingUp:
    ORA.W #$000F : SEC : ADC.W Enemy.YHitboxRadius,X : CMP.W Enemy.YPosition,X : BEQ .storeX
    BCS .storeSubX

  .storeX:
    STA.W Enemy.YPosition,X

  .storeSubX:
    STZ.W Enemy.YSubPosition,X
    SEC
    RTL


;;; $C845: Enemy horizontal block reaction ;;;
EnemyHorizontalBlockReaction:
;; Parameters
;;     A: Block
;;     X: Block index (multiple of 2)
;;     $14.$12: Distance to check for collision
;;     $1A: Target boundary position (left/right)
;;     $1C: Number of blocks left to check (0 if final (bottom) block)
;;     $1E: Enemy Y block span
;;     $20: In non-square slope collision:
;;         8000h: Process slopes
;;         4000h: Treat slopes as walls
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $14.$12: If carry clear, adjusted distance to move Samus
    PHX
    TXY
    AND.W #$F000 : XBA : LSR #3 : TAX
    TYA : LSR : STA.W CurrentBlockIndex
    JSR.W (.pointers,X)
    PLX
    RTS

  .pointers:
    dw CLCRTS_A0C2BC                                                     ;  0: Air
    dw EnemyBlockCollisionReaction_Horizontal_Slope                      ; *1: Slope
    dw CLCRTS_A0C2BC                                                     ;  2: Spike air
    dw CLCRTS_A0C2BC                                                     ;  3: Special air
    dw CLCRTS_A0C2BC                                                     ;  4: Shootable air
    dw EnemyBlockCollisionReaction_HorizontalExtension                   ; *5: Horizontal extension
    dw CLCRTS_A0C2BC                                                     ;  6: Unused air
    dw CLCRTS_A0C2BC                                                     ;  7: Bombable air
    dw SECRTS_A0C2BE                                                     ;  8: Solid block
    dw SECRTS_A0C2BE                                                     ;  9: Door block
    dw EnemyBlockCollisionReaction_Spike                                 ; *Ah: Spike block
    dw SECRTS_A0C2BE                                                     ;  Bh: Special block
    dw SECRTS_A0C2BE                                                     ;  Ch: Shootable block
    dw EnemyBlockCollisionReaction_VerticalExtension                     ; *Dh: Vertical extension
    dw SECRTS_A0C2BE                                                     ;  Eh: Grapple block
    dw SECRTS_A0C2BE                                                     ;  Fh: Bombable block


;;; $C879: Enemy vertical block reaction ;;;
EnemyVerticalBlockReaction:
;; Parameters
;;     A: Block
;;     X: Block index (multiple of 2)
;;     $14.$12: Distance to check for collision
;;     $18: Target Y position
;;     $1A: Target boundary position (top/bottom)
;;     $1C: Number of blocks left to check (0 if final (rightmost) block)
;;     $1E: Enemy X block span
;; Returns:
;;     Carry: Set if collision, clear otherwise
    PHX
    TXY
    AND.W #$F000 : XBA : LSR #3 : TAX
    TYA : LSR : STA.W CurrentBlockIndex
    JSR.W (.pointers,X)
    PLX
    RTS

  .pointers:
    dw CLCRTS_A0C2BC                                                     ;  0: Air
    dw EnemyBlockCollisionReaction_Vertical_Slope                        ; *1: Slope
    dw CLCRTS_A0C2BC                                                     ;  2: Spike air
    dw CLCRTS_A0C2BC                                                     ;  3: Special air
    dw CLCRTS_A0C2BC                                                     ;  4: Shootable air
    dw EnemyBlockCollisionReaction_HorizontalExtension                   ; *5: Horizontal extension
    dw CLCRTS_A0C2BC                                                     ;  6: Unused air
    dw CLCRTS_A0C2BC                                                     ;  7: Bombable air
    dw SECRTS_A0C2BE                                                     ;  8: Solid block
    dw SECRTS_A0C2BE                                                     ;  9: Door block
    dw EnemyBlockCollisionReaction_Spike                                 ; *Ah: Spike block
    dw SECRTS_A0C2BE                                                     ;  Bh: Special block
    dw SECRTS_A0C2BE                                                     ;  Ch: Shootable block
    dw EnemyBlockCollisionReaction_VerticalExtension                     ; *Dh: Vertical extension
    dw SECRTS_A0C2BE                                                     ;  Eh: Grapple block
    dw SECRTS_A0C2BE                                                     ;  Fh: Bombable block


;;; $C8AD: Align enemy Y position with non-square slope ;;;
AlignEnemyYPositionWIthNonSquareSlope:
;; Parameters:
;;     X: Enemy index
;; Returns:
;;     Carry: Set if position was adjusted by slope, otherwise clear

; Align enemy vertically to slopes if currently in contact with slopes
; Call this after MoveEnemyRightBy_14_12_ProcessSlopes if it returns carry clear
    PHY : PHX
    CLC
    PHP
    TXY
    LDA.W Enemy.XPosition,Y : PHA
    LDA.W Enemy.YPosition,Y : CLC : ADC.W Enemy.YHitboxRadius,Y : DEC : PHA
    JSL CalculateTheBlockContainingAPixelPosition
    LDA.W CurrentBlockIndex : ASL : TAX
    LDA.L LevelData,X : AND.W #$F000 : CMP.W #$1000 : BNE .enemyTopCheck
    LDX.W CurrentBlockIndex
    LDA.L BTS,X : AND.W #$001F : CMP.W #$0005 : BCC .enemyTopCheck
    PLP : SEC : PHP
    LDA.W Enemy.YPosition,Y : CLC : ADC.W Enemy.YHitboxRadius,Y
    DEC : AND.W #$000F : STA.W TargetBottomTopYOffset
    LDA.L BTS,X : AND.W #$001F : ASL #4 : STA.W SlopeCollisionDefinitionTableBaseIndex
    LDA.L BTS-1,X : BMI .enemyTopCheck
    ASL : BMI .blockBTS40
    LDA.W Enemy.XPosition,Y
    BRA +

  .blockBTS40:
    LDA.W Enemy.XPosition,Y : EOR.W #$000F

+   AND.W #$000F : CLC : ADC.W SlopeCollisionDefinitionTableBaseIndex : TAX
    LDA.L SlopeDefinitions_SlopeTopXOffsetByYPixel,X : AND.W #$001F : SEC : SBC.W TargetBottomTopYOffset
    DEC : BPL .enemyTopCheck
    CLC : ADC.W Enemy.YPosition,Y : STA.W Enemy.YPosition,Y

  .enemyTopCheck:
    LDA.W Enemy.XPosition,Y : PHA
    LDA.W Enemy.YPosition,Y : SEC : SBC.W Enemy.YHitboxRadius,Y : PHA
    JSL CalculateTheBlockContainingAPixelPosition
    LDA.W CurrentBlockIndex : ASL : TAX
    LDA.L LevelData,X : AND.W #$F000 : CMP.W #$1000 : BNE .return
    LDX.W CurrentBlockIndex
    LDA.L BTS,X : AND.W #$001F : CMP.W #$0005 : BCC .return
    PLP : SEC : PHP
    LDA.W Enemy.YPosition,Y : SEC : SBC.W Enemy.YHitboxRadius,Y
    AND.W #$000F : EOR.W #$000F : STA.W TargetBottomTopYOffset
    LDA.L BTS,X : AND.W #$001F : ASL #4 : STA.W SlopeCollisionDefinitionTableBaseIndex
    LDA.L BTS-1,X : BPL .return
    ASL : BMI ..blockBTS40
    LDA.W Enemy.XPosition,Y
    BRA +

  ..blockBTS40:
    LDA.W Enemy.XPosition,Y : EOR.W #$000F

+   AND.W #$000F : CLC : ADC.W SlopeCollisionDefinitionTableBaseIndex : TAX
    LDA.L SlopeDefinitions_SlopeTopXOffsetByYPixel,X : AND.W #$001F : SEC : SBC.W TargetBottomTopYOffset
    DEC : BEQ +
    BPL .return

+   EOR.W #$FFFF : INC : CLC : ADC.W Enemy.YPosition,Y : STA.W Enemy.YPosition,Y

  .return:
    PLP : PLX : PLY
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $C9BF: Unused. Common enemy projectile speeds - linearly increasing ;;;
UNUSED_CommonEnemyProjectileSpeeds_LinearlyIncreasing_A0C9BF:
; Clone of CommonEnemySpeeds_LinearlyIncreasing
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
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $CBC7: Common enemy projectile speeds - quadratically increasing ;;;
CommonEnemyProjectileSpeeds_QuadraticallyIncreasing:
; Clone of CommonEnemySpeeds_QuadraticallyIncreasing
; Used by Botwoon's body when dying and falling to the floor, and polyp rock
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


;;; $CEBF: Enemy headers ;;;
; see labels.asm for EnemyHeaders:
EnemyHeaders_Boyon:
    %EnemyHeader(\
    %tileDataSize($0400),
    %palette(Palette_Boyon),
    %health(1000),
    %damage(10),
    %width(8),
    %height(8),
    %bank(InitAI_Boyon>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_Boyon),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Boyon),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A2804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(Common_NormalEnemyShotAI),
    %spritemap(0),
    %tileData(Tiles_Boyon),
    %layer(5),
    %drops(EnemyDropChances_Boyon),
    %vulnerabilities(EnemyVulnerabilities_Boyon),
    %name(EnemyName_Boyon))

EnemyHeaders_Stoke:
    %EnemyHeader(\
    %tileDataSize($0400),
    %palette(Palette_Stoke),
    %health(20),
    %damage(40),
    %width(8),
    %height(8),
    %bank(InitAI_Stoke>>16),
    %hurtAITime(0),
    %cry($0053),
    %bossID(0),
    %initAI(InitAI_Stoke),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Stoke),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A2804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(Common_NormalEnemyShotAI),
    %spritemap(0),
    %tileData(Tiles_Stoke),
    %layer(5),
    %drops(EnemyDropChances_Stoke),
    %vulnerabilities(EnemyVulnerabilities_Default),
    %name(EnemyName_Stoke))

EnemyHeaders_MamaTurtle:
    %EnemyHeader(\
    %tileDataSize($0C00),
    %palette(Palette_MamaTurtle_BabyTurtle),
    %health(20000),
    %damage(200),
    %width(20),
    %height(16),
    %bank(InitAI_MamaTurtle>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_MamaTurtle),
    %parts(5),
    %unused(0),
    %mainAI(MainAI_MamaTurtle),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A2804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(4),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_MamaTurtle),
    %enemyShot(Common_NormalEnemyShotAI),
    %spritemap(0),
    %tileData(Tiles_MamaTurtle_BabyTurtle),
    %layer(5),
    %drops(EnemyDropChances_MamaTurtle_BabyTurtle),
    %vulnerabilities(EnemyVulnerabilities_Indestructible),
    %name(EnemyName_MamaTurtle))

EnemyHeaders_BabyTurtle:
    %EnemyHeader(\
    %tileDataSize($0C00),
    %palette(Palette_MamaTurtle_BabyTurtle),
    %health(20000),
    %damage(0),
    %width(8),
    %height(5),
    %bank(InitAI_BabyTurtle>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_BabyTurtle),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_BabyTurtle),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A2804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_BabyTurtle),
    %enemyShot(EnemyShot_BabyTurtle),
    %spritemap(0),
    %tileData(Tiles_MamaTurtle_BabyTurtle),
    %layer(5),
    %drops(EnemyDropChances_MamaTurtle_BabyTurtle),
    %vulnerabilities(EnemyVulnerabilities_Indestructible),
    %name(0))

EnemyHeaders_Puyo:
    %EnemyHeader(\
    %tileDataSize($0200),
    %palette(Palette_Puyo),
    %health(100),
    %damage(60),
    %width(8),
    %height(4),
    %bank(InitAI_Puyo>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_Puyo),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Puyo),
    %grappleAI(Common_GrappleAI_KillEnemy),
    %hurtAI(RTL_A2804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(Common_NormalEnemyShotAI),
    %spritemap(0),
    %tileData(Tiles_Puyo),
    %layer(5),
    %drops(EnemyDropChances_Puyo),
    %vulnerabilities(EnemyVulnerabilities_Default),
    %name(EnemyName_Puyo))

EnemyHeaders_Cacatac:
    %EnemyHeader(\
    %tileDataSize($0400),
    %palette(Palette_Cacatac),
    %health(60),
    %damage(20),
    %width(8),
    %height(8),
    %bank(InitAI_Cacatac>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_Cacatac),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Cacatac),
    %grappleAI(Common_GrappleAI_KillEnemy),
    %hurtAI(RTL_A2804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(2),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(Common_NormalEnemyShotAI),
    %spritemap(0),
    %tileData(Tiles_Cacatac),
    %layer(5),
    %drops(EnemyDropChances_Cacatac),
    %vulnerabilities(EnemyVulnerabilities_Default),
    %name(EnemyName_Cacatac))

EnemyHeaders_Owtch:
    %EnemyHeader(\
    %tileDataSize($0400),
    %palette(Palette_Owtch),
    %health(20),
    %damage(100),
    %width(8),
    %height(8),
    %bank(InitAI_Owtch>>16),
    %hurtAITime(0),
    %cry($003E),
    %bossID(0),
    %initAI(InitAI_Owtch),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Owtch),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A2804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(EnemyShot_Owtch),
    %spritemap(0),
    %tileData(Tiles_Owtch),
    %layer(5),
    %drops(EnemyDropChances_Owtch),
    %vulnerabilities(EnemyVulnerabilities_Owtch),
    %name(EnemyName_Owtch))

EnemyHeaders_ShipTop:
    %EnemyHeader(\
    %tileDataSize($1000),
    %palette(Palette_Ship),
    %health(20),
    %damage(40),
    %width($5C),
    %height($28),
    %bank(InitAI_ShipTop>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_ShipTop),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_ShipTop),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A2804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(RTL_A0804C),
    %variantIndex(0),
    %enemyTouch(RTL_A2804C),
    %enemyShot(RTL_A2804C),
    %spritemap(0),
    %tileData(Tiles_Ship),
    %layer(2),
    %drops(EnemyDropChances_ShipTop_ShipBottomEntrance),
    %vulnerabilities(EnemyVulnerabilities_Default),
    %name(0))

EnemyHeaders_ShipBottomEntrance:
    %EnemyHeader(\
    %tileDataSize($0200),
    %palette(Palette_Ship),
    %health(20),
    %damage(40),
    %width($60),
    %height($28),
    %bank(InitAI_ShipBottomEntrance>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_ShipBottomEntrance),
    %parts(1),
    %unused(0),
    %mainAI(RTL_A2804C),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A2804C),
    %frozenAI(RTL_A2804C),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(RTL_A2804C),
    %variantIndex(0),
    %enemyTouch(RTL_A2804C),
    %enemyShot(RTL_A2804C),
    %spritemap(0),
    %tileData(Tiles_Ship),
    %layer(2),
    %drops(EnemyDropChances_ShipTop_ShipBottomEntrance),
    %vulnerabilities(EnemyVulnerabilities_Default),
    %name(0))

EnemyHeaders_Mellow:
    %EnemyHeader(\
    %tileDataSize($0400),
    %palette(Palette_Mellow),
    %health(9),
    %damage(8),
    %width(8),
    %height(4),
    %bank(InitAI_Mellow_Mella_Menu>>16),
    %hurtAITime(0),
    %cry($0020),
    %bossID(0),
    %initAI(InitAI_Mellow_Mella_Menu),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Mellow_Mella_Menu),
    %grappleAI(Common_GrappleAI_KillEnemy),
    %hurtAI(RTL_A2804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(InstList_Mellow_Mella_Menu),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(Common_NormalEnemyShotAI),
    %spritemap(UNUSED_FlySpritemapPointers_A2B204),
    %tileData(Tiles_Mellow),
    %layer(5),
    %drops(EnemyDropChances_Mellow),
    %vulnerabilities(EnemyVulnerabilities_Default),
    %name(EnemyName_Mellow))

EnemyHeaders_Mella:
    %EnemyHeader(\
    %tileDataSize($0400),
    %palette(Palette_Mella),
    %health(30),
    %damage(16),
    %width(8),
    %height(4),
    %bank(InitAI_Mellow_Mella_Menu>>16),
    %hurtAITime(0),
    %cry($0020),
    %bossID(0),
    %initAI(InitAI_Mellow_Mella_Menu),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Mellow_Mella_Menu),
    %grappleAI(Common_GrappleAI_KillEnemy),
    %hurtAI(RTL_A2804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(UNUSED_PointerToUnusedData_A2B22C),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(Common_NormalEnemyShotAI),
    %spritemap(UNUSED_SpritemapPointers_Mella_A2B25C),
    %tileData(Tiles_Mella),
    %layer(5),
    %drops(EnemyDropChances_Mella),
    %vulnerabilities(EnemyVulnerabilities_Mella),
    %name(EnemyName_Mella))

EnemyHeaders_Menu:
    %EnemyHeader(\
    %tileDataSize($0400),
    %palette(Palette_Menu),
    %health(100),
    %damage(60),
    %width(8),
    %height(8),
    %bank(InitAI_Mellow_Mella_Menu>>16),
    %hurtAITime(0),
    %cry($0020),
    %bossID(0),
    %initAI(InitAI_Mellow_Mella_Menu),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Mellow_Mella_Menu),
    %grappleAI(Common_GrappleAI_KillEnemy),
    %hurtAI(RTL_A2804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(UNUSED_DataPointer_A2B284),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(Common_NormalEnemyShotAI),
    %spritemap(UNUSED_SpritemapPointers_Menu_A2B2B4),
    %tileData(Tiles_Menu),
    %layer(5),
    %drops(EnemyDropChances_Menu),
    %vulnerabilities(EnemyVulnerabilities_Default),
    %name(EnemyName_Menu))

EnemyHeaders_Multiviola:
    %EnemyHeader(\
    %tileDataSize($0400),
    %palette(Palette_Multiviola),
    %health(90),
    %damage(50),
    %width(8),
    %height(8),
    %bank(InitAI_Multiviola>>16),
    %hurtAITime(0),
    %cry($003E),
    %bossID(0),
    %initAI(InitAI_Multiviola),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Multiviola),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A2804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(InstList_Multiviola),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(Common_NormalEnemyShotAI),
    %spritemap(0),
    %tileData(Tiles_Multiviola),
    %layer(5),
    %drops(EnemyDropChances_Multiviola),
    %vulnerabilities(EnemyVulnerabilities_Multiviola),
    %name(EnemyName_Multiviola))

EnemyHeaders_LavaRocks:
    %EnemyHeader(\
    %tileDataSize($0600),
    %palette(Palette_Polyp_Rinka),
    %health(1),
    %damage(4),
    %width(4),
    %height(4),
    %bank(InitAI_Polyp>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_Polyp),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Polyp),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A2804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(Common_NormalEnemyShotAI),
    %spritemap(0),
    %tileData(Tiles_Polyp_Rinka),
    %layer(5),
    %drops(EnemyDropChances_Polyp),
    %vulnerabilities(EnemyVulnerabilities_Indestructible),
    %name(EnemyName_Polyp))

EnemyHeaders_Rinka:
    %EnemyHeader(\
    %tileDataSize($0600),
    %palette(Palette_Polyp_Rinka),
    %health(10),
    %damage(40),
    %width(8),
    %height(8),
    %bank(InitAI_Rinka>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_Rinka),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Rinka),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A2804C),
    %frozenAI(FrozenAI_Rinka),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(PowerBombReaction_Rinka),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_Rinka),
    %enemyShot(EnemyShot_Rinka),
    %spritemap(0),
    %tileData(Tiles_Polyp_Rinka),
    %layer(2),
    %drops(EnemyDropChances_Rinka),
    %vulnerabilities(EnemyVulnerabilities_Default),
    %name(EnemyName_Rinka))

EnemyHeaders_Rio:
    %EnemyHeader(\
    %tileDataSize($0400),
    %palette(Palette_Rio),
    %health(45),
    %damage(15),
    %width(16),
    %height(7),
    %bank(InitAI_Rio>>16),
    %hurtAITime(0),
    %cry($0036),
    %bossID(0),
    %initAI(InitAI_Rio),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Rio),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A2804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(2),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(Common_NormalEnemyShotAI),
    %spritemap(0),
    %tileData(Tiles_Rio),
    %layer(5),
    %drops(EnemyDropChances_Rio),
    %vulnerabilities(EnemyVulnerabilities_Default),
    %name(EnemyName_Rio))

EnemyHeaders_Squeept:
    %EnemyHeader(\
    %tileDataSize($0400),
    %palette(Palette_Squeept),
    %health(300),
    %damage(50),
    %width(8),
    %height(12),
    %bank(InitAI_Squeept>>16),
    %hurtAITime(0),
    %cry($0036),
    %bossID(0),
    %initAI(InitAI_Squeept),
    %parts(2),
    %unused(0),
    %mainAI(MainAI_Squeept),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A2804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(2),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(Common_NormalEnemyShotAI),
    %spritemap(0),
    %tileData(Tiles_Squeept),
    %layer(5),
    %drops(EnemyDropChances_Squeept),
    %vulnerabilities(EnemyVulnerabilities_Squeept_Ripper2_Ripper_Tripper),
    %name(EnemyName_Squeept))

EnemyHeaders_Geruta:
    %EnemyHeader(\
    %tileDataSize($0600),
    %palette(Palette_Geruta),
    %health(120),
    %damage(60),
    %width(16),
    %height(9),
    %bank(InitAI_Geruta>>16),
    %hurtAITime(0),
    %cry($0036),
    %bossID(0),
    %initAI(InitAI_Geruta),
    %parts(2),
    %unused(0),
    %mainAI(MainAI_Geruta),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A2804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(2),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(Common_NormalEnemyShotAI),
    %spritemap(0),
    %tileData(Tiles_Geruta),
    %layer(5),
    %drops(EnemyDropChances_Geruta),
    %vulnerabilities(EnemyVulnerabilities_Geruta),
    %name(EnemyName_Geruta))

EnemyHeaders_Holtz:
    %EnemyHeader(\
    %tileDataSize($0800),
    %palette(Palette_Holtz),
    %health(900),
    %damage(120),
    %width(16),
    %height(10),
    %bank(InitAI_Holtz>>16),
    %hurtAITime(0),
    %cry($005F),
    %bossID(0),
    %initAI(InitAI_Holtz),
    %parts(2),
    %unused(0),
    %mainAI(MainAI_Holtz),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A2804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(2),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(Common_NormalEnemyShotAI),
    %spritemap(0),
    %tileData(Tiles_Holtz),
    %layer(5),
    %drops(EnemyDropChances_Holtz),
    %vulnerabilities(EnemyVulnerabilities_Holtz),
    %name(EnemyName_Holtz))

EnemyHeaders_Oum:
    %EnemyHeader(\
    %tileDataSize($0800),
    %palette(Palette_Oum),
    %health(300),
    %damage(100),
    %width(16),
    %height(16),
    %bank(InitAI_Oum>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_Oum),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Oum),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A2804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(2),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_Oum_DoesNotHurtSamus),
    %enemyShot(EnemyShot_Oum),
    %spritemap(0),
    %tileData(Tiles_Oum),
    %layer(5),
    %drops(EnemyDropChances_Oum),
    %vulnerabilities(EnemyVulnerabilities_Indestructible),
    %name(EnemyName_Oum))

EnemyHeaders_Choot:
    %EnemyHeader(\
    %tileDataSize($0400),
    %palette(Palette_Choot),
    %health(100),
    %damage(80),
    %width(16),
    %height(5),
    %bank(InitAI_Choot>>16),
    %hurtAITime(0),
    %cry($0022),
    %bossID(0),
    %initAI(InitAI_Choot),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Choot),
    %grappleAI(Common_GrappleAI_KillEnemy),
    %hurtAI(RTL_A2804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(2),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(Common_NormalEnemyShotAI),
    %spritemap(0),
    %tileData(Tiles_Choot),
    %layer(5),
    %drops(EnemyDropChances_Choot),
    %vulnerabilities(EnemyVulnerabilities_Default),
    %name(EnemyName_Choot))

EnemyHeaders_GRipper:
    %EnemyHeader(\
    %tileDataSize($0400),
    %palette(Palette_GRipper),
    %health(200),
    %damage(10),
    %width(8),
    %height(8),
    %bank(InitAI_GRipper>>16),
    %hurtAITime(0),
    %cry($003E),
    %bossID(0),
    %initAI(InitAI_GRipper),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_GRipper),
    %grappleAI(Common_GrappleAI_SamusLatchesOn),
    %hurtAI(RTL_A2804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(EnemyShot_GRipper_Ripper2),
    %spritemap(0),
    %tileData(Tiles_Ripper),
    %layer(5),
    %drops(EnemyDropChances_GRipper_Ripper2),
    %vulnerabilities(EnemyVulnerabilities_GRipper),
    %name(EnemyName_GRipper_Ripper2))

EnemyHeaders_Ripper2:
    %EnemyHeader(\
    %tileDataSize($0400),
    %palette(Palette_Ripper2),
    %health(200),
    %damage(10),
    %width(8),
    %height(4),
    %bank(InitAI_Ripper2>>16),
    %hurtAITime(0),
    %cry($003E),
    %bossID(0),
    %initAI(InitAI_Ripper2),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Ripper2),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A2804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(InstList_Ripper_MovingRight),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(EnemyShot_GRipper_Ripper2),
    %spritemap(0),
    %tileData(Tiles_Ripper),
    %layer(5),
    %drops(EnemyDropChances_GRipper_Ripper2),
    %vulnerabilities(EnemyVulnerabilities_Squeept_Ripper2_Ripper_Tripper),
    %name(EnemyName_GRipper_Ripper2))

EnemyHeaders_Ripper:
    %EnemyHeader(\
    %tileDataSize($0400),
    %palette(Palette_Ripper),
    %health(200),
    %damage(5),
    %width(8),
    %height(4),
    %bank(InitAI_Ripper>>16),
    %hurtAITime(0),
    %cry($003E),
    %bossID(0),
    %initAI(InitAI_Ripper),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Ripper),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A2804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(InstList_Ripper_MovingRight),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(Common_NormalEnemyShotAI),
    %spritemap(SpritemapPointers_Ripper),
    %tileData(Tiles_Ripper),
    %layer(5),
    %drops(EnemyDropChances_Ripper),
    %vulnerabilities(EnemyVulnerabilities_Squeept_Ripper2_Ripper_Tripper),
    %name(EnemyName_Ripper))

EnemyHeaders_Dragon:
    %EnemyHeader(\
    %tileDataSize($0600),
    %palette(Palette_Dragon),
    %health(300),
    %damage(24),
    %width(8),
    %height($1C),
    %bank(InitAI_Dragon>>16),
    %hurtAITime(0),
    %cry($0036),
    %bossID(0),
    %initAI(InitAI_Dragon),
    %parts(2),
    %unused(0),
    %mainAI(MainAI_Dragon),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A2804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(4),
    %powerBombReaction(PowerBombReaction_Dragon),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_Dragon),
    %enemyShot(EnemyShot_Dragon),
    %spritemap(0),
    %tileData(Tiles_Dragon),
    %layer(5),
    %drops(EnemyDropChances_Dragon),
    %vulnerabilities(EnemyVulnerabilities_Dragon),
    %name(EnemyName_Dragon))

EnemyHeaders_ShutterGrowing:
    %EnemyHeader(\
    %tileDataSize($0400),
    %palette(Palette_Shutters),
    %health(20),
    %damage(40),
    %width(8),
    %height(8),
    %bank(InitAI_ShutterGrowing>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_ShutterGrowing),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_ShutterGrowing),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A2804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(RTL_A0804C),
    %variantIndex(0),
    %enemyTouch(RTL_A2804C),
    %enemyShot(Common_NormalEnemyShotAI),
    %spritemap(0),
    %tileData(Tiles_Shutter),
    %layer(5),
    %drops(EnemyDropChances_Shutter_Kamer_BabyMetroidCutscene),
    %vulnerabilities(EnemyVulnerabilities_NonDestructibleShutter),
    %name(EnemyName_ShutterGrowing))

EnemyHeaders_ShutterShootable:
    %EnemyHeader(\
    %tileDataSize($0400),
    %palette(Palette_Shutters),
    %health(20),
    %damage(40),
    %width(8),
    %height($20),
    %bank(InitAI_ShutterShootable_ShutterDestroyable>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_ShutterShootable_ShutterDestroyable),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_ShutterShootable_ShutterDestroyable_Kamer),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A2804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(PowerBombReaction_ShutterShootable_ShutterDestroyable_Kamer),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_ShutterShootable_ShutterDestroyable_Kamer),
    %enemyShot(EnemyShot_ShutterShootable_Kamer),
    %spritemap(0),
    %tileData(Tiles_Shutter),
    %layer(5),
    %drops(EnemyDropChances_Shutter_Kamer_BabyMetroidCutscene),
    %vulnerabilities(EnemyVulnerabilities_NonDestructibleShutter),
    %name(EnemyName_Shutter2_Kamer))

EnemyHeaders_ShutterHorizShootable:
    %EnemyHeader(\
    %tileDataSize($0400),
    %palette(Palette_Shutters),
    %health(20),
    %damage(40),
    %width($20),
    %height(8),
    %bank(InitAI_ShutterHorizShootable>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_ShutterHorizShootable),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_ShutterHorizShootable),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A2804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(PowerBombReaction_CommonReaction_HorizontalShutter),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_ShutterHorizShootable),
    %enemyShot(EnemyShot_ShutterHorizShootable),
    %spritemap(0),
    %tileData(Tiles_Shutter),
    %layer(5),
    %drops(EnemyDropChances_Shutter_Kamer_BabyMetroidCutscene),
    %vulnerabilities(EnemyVulnerabilities_NonDestructibleShutter),
    %name(EnemyName_Shutter2_Kamer))

EnemyHeaders_ShutterDestroyable:
    %EnemyHeader(\
    %tileDataSize($0400),
    %palette(Palette_Shutters),
    %health(20),
    %damage(40),
    %width(8),
    %height($20),
    %bank(InitAI_ShutterShootable_ShutterDestroyable>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_ShutterShootable_ShutterDestroyable),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_ShutterShootable_ShutterDestroyable_Kamer),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A2804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(PowerBombReaction_ShutterShootable_ShutterDestroyable_Kamer),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_ShutterShootable_ShutterDestroyable_Kamer),
    %enemyShot(EnemyTouch_ShutterDestroyable),
    %spritemap(0),
    %tileData(Tiles_Shutter),
    %layer(5),
    %drops(EnemyDropChances_Shutter_Kamer_BabyMetroidCutscene),
    %vulnerabilities(EnemyVulnerabilities_ShutterDestroyable),
    %name(EnemyName_Shutter2_Kamer))

EnemyHeaders_Kamer:
    %EnemyHeader(\
    %tileDataSize($0400),
    %palette(Palette_Kamer),
    %health(20),
    %damage(40),
    %width(16),
    %height(8),
    %bank(InitAI_Kamer>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_Kamer),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_ShutterShootable_ShutterDestroyable_Kamer),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A2804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(PowerBombReaction_ShutterShootable_ShutterDestroyable_Kamer),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_ShutterShootable_ShutterDestroyable_Kamer),
    %enemyShot(EnemyShot_ShutterShootable_Kamer),
    %spritemap(0),
    %tileData(Tiles_Kamer),
    %layer(5),
    %drops(EnemyDropChances_Shutter_Kamer_BabyMetroidCutscene),
    %vulnerabilities(EnemyVulnerabilities_NonDestructibleShutter),
    %name(EnemyName_Shutter2_Kamer))

EnemyHeaders_Waver:
    %EnemyHeader(\
    %tileDataSize($0600),
    %palette(Palette_Waver),
    %health(30),
    %damage(10),
    %width(8),
    %height(8),
    %bank(InitAI_Waver>>16),
    %hurtAITime(0),
    %cry($0047),
    %bossID(0),
    %initAI(InitAI_Waver),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Waver),
    %grappleAI(Common_GrappleAI_KillEnemy),
    %hurtAI(RTL_A3804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(Common_NormalEnemyShotAI),
    %spritemap(0),
    %tileData(Tiles_Waver),
    %layer(5),
    %drops(EnemyDropChances_Waver),
    %vulnerabilities(EnemyVulnerabilities_Default),
    %name(EnemyName_Waver))

EnemyHeaders_Metaree:
    %EnemyHeader(\
    %tileDataSize($0600),
    %palette(Palette_Metaree),
    %health(50),
    %damage(50),
    %width(8),
    %height(12),
    %bank(InitAI_Metaree>>16),
    %hurtAITime(0),
    %cry($0021),
    %bossID(0),
    %initAI(InitAI_Metaree),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Metaree),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A3804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(2),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(EnemyShot_Metaree),
    %spritemap(0),
    %tileData(Tiles_Metaree),
    %layer(5),
    %drops(EnemyDropChances_Metaree),
    %vulnerabilities(EnemyVulnerabilities_Metaree),
    %name(EnemyName_Metaree))

EnemyHeaders_Fireflea:
    %EnemyHeader(\
    %tileDataSize($0600),
    %palette(Palette_Fireflea),
    %health(20),
    %damage(4),
    %width(8),
    %height(8),
    %bank(InitAI_Fireflea>>16),
    %hurtAITime(0),
    %cry($0020),
    %bossID(0),
    %initAI(InitAI_Fireflea),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Fireflea),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A3804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(PowerBombReaction_Fireflea),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_Fireflea),
    %enemyShot(EnemyShot_Fireflea),
    %spritemap(0),
    %tileData(Tiles_Fireflea),
    %layer(5),
    %drops(EnemyDropChances_Fireflea),
    %vulnerabilities(EnemyVulnerabilities_Default),
    %name(EnemyName_Fireflea))

EnemyHeaders_Skultera:
    %EnemyHeader(\
    %tileDataSize($0600),
    %palette(Palette_Skultera),
    %health(300),
    %damage(80),
    %width(13),
    %height(11),
    %bank(InitAI_Skultera>>16),
    %hurtAITime(0),
    %cry($0049),
    %bossID(0),
    %initAI(InitAI_Skultera),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Skultera),
    %grappleAI(Common_GrappleAI_NoInteraction),
    %hurtAI(RTL_A3804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(2),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(Common_NormalEnemyShotAI),
    %spritemap(UNUSED_SpritemapPointers_Skultera),
    %tileData(Tiles_Skultera),
    %layer(5),
    %drops(EnemyDropChances_Skultera),
    %vulnerabilities(EnemyVulnerabilities_Default),
    %name(EnemyName_Skultera))

EnemyHeaders_Elevator:
    %EnemyHeader(\
    %tileDataSize(0),
    %palette(0),
    %health(40),
    %damage(15),
    %width(16),
    %height(8),
    %bank(InitAI_Elevator>>16),
    %hurtAITime(0),
    %cry($0059),
    %bossID(0),
    %initAI(InitAI_Elevator),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_GrappleAI_FrozenAI_Elevator),
    %grappleAI(MainAI_GrappleAI_FrozenAI_Elevator),
    %hurtAI(RTL_A3804C),
    %frozenAI(MainAI_GrappleAI_FrozenAI_Elevator),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(RTL_A0804C),
    %variantIndex(0),
    %enemyTouch(RTL_A3804C),
    %enemyShot(RTL_A3804C),
    %spritemap(0),
    %tileData(0),
    %layer(5),
    %drops(0),
    %vulnerabilities(0),
    %name(0))

EnemyHeaders_Sciser:
    %EnemyHeader(\
    %tileDataSize($0400),
    %palette(Palette_Sciser),
    %health(200),
    %damage(120),
    %width(8),
    %height(8),
    %bank(InitAI_Sciser>>16),
    %hurtAITime(0),
    %cry($0049),
    %bossID(0),
    %initAI(InitAI_Sciser),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Crawlers),
    %grappleAI(Common_GrappleAI_KillEnemy),
    %hurtAI(RTL_A3804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(2),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(Common_NormalEnemyShotAI),
    %spritemap(0),
    %tileData(Tiles_Sciser),
    %layer(5),
    %drops(EnemyDropChances_Sciser),
    %vulnerabilities(EnemyVulnerabilities_Sciser_Zero),
    %name(EnemyName_Sciser))

EnemyHeaders_Zero:
    %EnemyHeader(\
    %tileDataSize($0400),
    %palette(Palette_Zero),
    %health(50),
    %damage(40),
    %width(8),
    %height(8),
    %bank(InitAI_Zero>>16),
    %hurtAITime(0),
    %cry($0023),
    %bossID(0),
    %initAI(InitAI_Zero),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Crawlers),
    %grappleAI(Common_GrappleAI_KillEnemy),
    %hurtAI(RTL_A3804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(2),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(Common_NormalEnemyShotAI),
    %spritemap(0),
    %tileData(Tiles_Zero),
    %layer(5),
    %drops(EnemyDropChances_Zero),
    %vulnerabilities(EnemyVulnerabilities_Sciser_Zero),
    %name(EnemyName_Zero))

EnemyHeaders_Tripper:
    %EnemyHeader(\
    %tileDataSize($0400),
    %palette(Palette_Tripper),
    %health(20),
    %damage(40),
    %width(16),
    %height(8),
    %bank(InitAI_Tripper>>16),
    %hurtAITime(0),
    %cry($003E),
    %bossID(0),
    %initAI(InitAI_Tripper),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Tripper_Kamer2),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A3804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(RTL_A39F07),
    %enemyShot(EnemyShot_Tripper),
    %spritemap(0),
    %tileData(Tiles_Tripper),
    %layer(5),
    %drops(EnemyDropChances_Tripper_Kamer2),
    %vulnerabilities(EnemyVulnerabilities_Squeept_Ripper2_Ripper_Tripper),
    %name(EnemyName_Tripper))

EnemyHeaders_Kamer2:
    %EnemyHeader(\
    %tileDataSize($0400),
    %palette(Palette_Kamer2),
    %health(20),
    %damage(40),
    %width(16),
    %height(8),
    %bank(InitAI_Kamer2>>16),
    %hurtAITime(0),
    %cry($003E),
    %bossID(0),
    %initAI(InitAI_Kamer2),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Tripper_Kamer2),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A3804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(RTL_A39F07),
    %enemyShot(Common_NormalEnemyShotAI),
    %spritemap(0),
    %tileData(Tiles_Kamer),
    %layer(5),
    %drops(EnemyDropChances_Tripper_Kamer2),
    %vulnerabilities(EnemyVulnerabilities_Indestructible),
    %name(EnemyName_Tripper))

EnemyHeaders_Sbug:
    %EnemyHeader(\
    %tileDataSize($0200),
    %palette(Palette_Sbug),
    %health(20),
    %damage(40),
    %width(4),
    %height(4),
    %bank(InitAI_Sbug>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_Sbug),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Sbug),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A3804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(Common_NormalEnemyShotAI),
    %spritemap(0),
    %tileData(Tiles_Sbug),
    %layer(5),
    %drops(EnemyDropChances_Sbug_Sbug2),
    %vulnerabilities(EnemyVulnerabilities_Indestructible),
    %name(EnemyName_Sbug))

EnemyHeaders_Sbug2:
    %EnemyHeader(\
    %tileDataSize($8200),
    %palette(Palette_Sbug),
    %health(20),
    %damage(40),
    %width(4),
    %height(4),
    %bank(InitAI_Sbug>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_Sbug),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Sbug),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A3804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(Common_NormalEnemyShotAI),
    %spritemap(0),
    %tileData(Tiles_Sbug),
    %layer(5),
    %drops(EnemyDropChances_Sbug_Sbug2),
    %vulnerabilities(EnemyVulnerabilities_Indestructible),
    %name(EnemyName_Sbug))

EnemyHeaders_Mochtroid:
    %EnemyHeader(\
    %tileDataSize($0400),
    %palette(Palette_Mochtroid),
    %health(100),
    %damage(90),
    %width(10),
    %height(12),
    %bank(InitAI_Mochtroid>>16),
    %hurtAITime(0),
    %cry($0058),
    %bossID(0),
    %initAI(InitAI_Mochtroid),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Mochtroid),
    %grappleAI(Common_GrappleAI_KillEnemy),
    %hurtAI(RTL_A3804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(2),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_Mochtroid),
    %enemyShot(EnemyShot_Mochtroid),
    %spritemap(0),
    %tileData(Tiles_Mochtroid),
    %layer(5),
    %drops(EnemyDropChances_Mochtroid),
    %vulnerabilities(EnemyVulnerabilities_Default),
    %name(EnemyName_Mochtroid))

EnemyHeaders_Sidehopper:
    %EnemyHeader(\
    %tileDataSize($0400),
    %palette(Palette_Sidehopper),
    %health(60),
    %damage(20),
    %width(16),
    %height(13),
    %bank(InitAI_Hopper>>16),
    %hurtAITime(0),
    %cry($0023),
    %bossID(0),
    %initAI(InitAI_Hopper),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Hopper),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A3804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(2),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(Common_NormalEnemyShotAI),
    %spritemap(0),
    %tileData(Tiles_Sidehopper),
    %layer(5),
    %drops(EnemyDropChances_Sidehopper),
    %vulnerabilities(EnemyVulnerabilities_Default),
    %name(EnemyName_Sidehopper))

EnemyHeaders_Dessgeega:
    %EnemyHeader(\
    %tileDataSize($0400),
    %palette(Palette_Dessgeega),
    %health(120),
    %damage(80),
    %width(16),
    %height(13),
    %bank(InitAI_Hopper>>16),
    %hurtAITime(0),
    %cry($005F),
    %bossID(0),
    %initAI(InitAI_Hopper),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Hopper),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A3804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(2),
    %powerBombReaction(0),
    %variantIndex(3),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(Common_NormalEnemyShotAI),
    %spritemap(0),
    %tileData(Tiles_Dessgeega),
    %layer(5),
    %drops(EnemyDropChances_Dessgeega),
    %vulnerabilities(EnemyVulnerabilities_Default),
    %name(EnemyName_Dessgeega))

EnemyHeaders_SidehopperLarge:
    %EnemyHeader(\
    %tileDataSize($0600),
    %palette(Palette_SidehopperLarge),
    %health(320),
    %damage(80),
    %width($18),
    %height($14),
    %bank(InitAI_Hopper>>16),
    %hurtAITime(0),
    %cry($0023),
    %bossID(0),
    %initAI(InitAI_Hopper),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Hopper),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A3804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(4),
    %powerBombReaction(0),
    %variantIndex(1),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(Common_NormalEnemyShotAI),
    %spritemap(0),
    %tileData(Tiles_SidehopperLarge),
    %layer(5),
    %drops(EnemyDropChances_SidehopperLarge_SidehopperTourian),
    %vulnerabilities(EnemyVulnerabilities_Default),
    %name(EnemyName_SidehopperLarge_SidehopperTourian))

EnemyHeaders_SidehopperTourian:
    %EnemyHeader(\
    %tileDataSize($0600),
    %palette(Palette_SidehopperTourian),
    %health(1500),
    %damage(120),
    %width($18),
    %height($14),
    %bank(InitAI_Hopper>>16),
    %hurtAITime(0),
    %cry($0023),
    %bossID(0),
    %initAI(InitAI_Hopper),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Hopper),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A3804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(4),
    %powerBombReaction(0),
    %variantIndex(1),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(Common_NormalEnemyShotAI),
    %spritemap(0),
    %tileData(Tiles_SidehopperLarge),
    %layer(5),
    %drops(EnemyDropChances_SidehopperLarge_SidehopperTourian),
    %vulnerabilities(EnemyVulnerabilities_SidehopperTourian),
    %name(EnemyName_SidehopperLarge_SidehopperTourian))

EnemyHeaders_DessgeegaLarge:
    %EnemyHeader(\
    %tileDataSize($0400),
    %palette(Palette_DessgeegaLarge),
    %health(800),
    %damage(160),
    %width($18),
    %height($14),
    %bank(InitAI_Hopper>>16),
    %hurtAITime(0),
    %cry($0030),
    %bossID(0),
    %initAI(InitAI_Hopper),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Hopper),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A3804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(4),
    %powerBombReaction(0),
    %variantIndex(2),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(Common_NormalEnemyShotAI),
    %spritemap(0),
    %tileData(Tiles_DessgeegaLarge),
    %layer(5),
    %drops(EnemyDropChances_DessgeegaLarge),
    %vulnerabilities(EnemyVulnerabilities_DessgeegaLarge),
    %name(EnemyName_DessgeegaLarge))

EnemyHeaders_Zoa:
    %EnemyHeader(\
    %tileDataSize($0400),
    %palette(Palette_Zoa),
    %health(40),
    %damage(15),
    %width(8),
    %height(8),
    %bank(InitAI_Zoa>>16),
    %hurtAITime(0),
    %cry($0049),
    %bossID(0),
    %initAI(InitAI_Zoa),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Zoa),
    %grappleAI(Common_GrappleAI_KillEnemy),
    %hurtAI(RTL_A3804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(Common_NormalEnemyShotAI),
    %spritemap(0),
    %tileData(Tiles_Zoa),
    %layer(5),
    %drops(EnemyDropChances_Zoa),
    %vulnerabilities(EnemyVulnerabilities_Default),
    %name(EnemyName_Zoa))

EnemyHeaders_Viola:
    %EnemyHeader(\
    %tileDataSize($0400),
    %palette(Palette_Viola),
    %health(30),
    %damage(15),
    %width(8),
    %height(8),
    %bank(InitAI_Viola>>16),
    %hurtAITime(0),
    %cry($005F),
    %bossID(0),
    %initAI(InitAI_Viola),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Crawlers),
    %grappleAI(Common_GrappleAI_KillEnemy),
    %hurtAI(RTL_A3804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(InstList_Viola_UpsideDown),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(Common_NormalEnemyShotAI),
    %spritemap(0),
    %tileData(Tiles_Viola),
    %layer(5),
    %drops(EnemyDropChances_Viola),
    %vulnerabilities(EnemyVulnerabilities_Viola_Yard_HZoomer_Zeela_Sova_Zoomer),
    %name(EnemyName_Viola))

EnemyHeaders_Respawn:
    %EnemyHeader(\
    %tileDataSize(0),
    %palette(NOPNOP_A38069),
    %health(0),
    %damage(0),
    %width(8),
    %height(8),
    %bank(RTL_A3804C>>16),
    %hurtAITime(0),
    %cry($0059),
    %bossID(0),
    %initAI(RTL_A3804C),
    %parts(1),
    %unused(0),
    %mainAI(RTL_A3804C),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A3804C),
    %frozenAI(RTL_A3804C),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(RTL_A3804C),
    %enemyShot(RTL_A3804C),
    %spritemap(0),
    %tileData(Tiles_Metroid),
    %layer(0),
    %drops(0),
    %vulnerabilities(0),
    %name(0))

EnemyHeaders_Bang:
    %EnemyHeader(\
    %tileDataSize($1000),
    %palette(Palette_Bang),
    %health(10),
    %damage(4),
    %width(16),
    %height(16),
    %bank(InitAI_Bang>>16),
    %hurtAITime(0),
    %cry($0056),
    %bossID(0),
    %initAI(InitAI_Bang),
    %parts(3),
    %unused(0),
    %mainAI(MainAI_Bang),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A3804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(4),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(EnemyShot_Bang),
    %spritemap(0),
    %tileData(Tiles_Bang),
    %layer(5),
    %drops(EnemyDropChances_Bang),
    %vulnerabilities(EnemyVulnerabilities_Bang),
    %name(EnemyName_Bang))

EnemyHeaders_Skree:
    %EnemyHeader(\
    %tileDataSize($0400),
    %palette(Palette_Skree),
    %health(15),
    %damage(10),
    %width(8),
    %height(12),
    %bank(InitAI_Skree>>16),
    %hurtAITime(0),
    %cry($0021),
    %bossID(0),
    %initAI(InitAI_Skree),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Skree),
    %grappleAI(Common_GrappleAI_KillEnemy),
    %hurtAI(RTL_A3804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(EnemyShot_Skree),
    %spritemap(0),
    %tileData(Tiles_Skree),
    %layer(5),
    %drops(EnemyDropChances_Skree),
    %vulnerabilities(EnemyVulnerabilities_Default),
    %name(EnemyName_Skree))

EnemyHeaders_Yard:
    %EnemyHeader(\
    %tileDataSize($0800),
    %palette(Palette_Yard),
    %health(10),
    %damage(100),
    %width(8),
    %height(8),
    %bank(InitAI_Yard>>16),
    %hurtAITime(0),
    %cry($003E),
    %bossID(0),
    %initAI(InitAI_Yard),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Yard),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A3804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(2),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_Yard),
    %enemyShot(EnemyShot_Yard),
    %spritemap(0),
    %tileData(Tiles_Yard),
    %layer(5),
    %drops(EnemyDropChances_Yard),
    %vulnerabilities(EnemyVulnerabilities_Viola_Yard_HZoomer_Zeela_Sova_Zoomer),
    %name(EnemyName_Yard))

EnemyHeaders_Reflec:
    %EnemyHeader(\
    %tileDataSize($0600),
    %palette(Palette_Reflec),
    %health(200),
    %damage(30),
    %width(16),
    %height(16),
    %bank(InitAI_Reflec>>16),
    %hurtAITime(0),
    %cry($0057),
    %bossID(0),
    %initAI(InitAI_Reflec),
    %parts(1),
    %unused(0),
    %mainAI(RTL_A3DC1B),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A3804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(2),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(RTL_A3804C),
    %enemyShot(EnemyShot_Reflec),
    %spritemap(0),
    %tileData(Tiles_Reflec),
    %layer(5),
    %drops(EnemyDropChances_Reflec),
    %vulnerabilities(EnemyVulnerabilities_Indestructible),
    %name(EnemyName_Reflec))

EnemyHeaders_HZoomer:
    %EnemyHeader(\
    %tileDataSize($0600),
    %palette(Palette_HZoomer),
    %health(15),
    %damage(5),
    %width(8),
    %height(8),
    %bank(InitAI_HZoomer>>16),
    %hurtAITime(0),
    %cry($0023),
    %bossID(0),
    %initAI(InitAI_HZoomer),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_HZoomer),
    %grappleAI(Common_GrappleAI_KillEnemy),
    %hurtAI(RTL_A3804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(Common_NormalEnemyShotAI),
    %spritemap(0),
    %tileData(Tiles_Zoomer),
    %layer(5),
    %drops(EnemyDropChances_HZoomer),
    %vulnerabilities(EnemyVulnerabilities_Viola_Yard_HZoomer_Zeela_Sova_Zoomer),
    %name(EnemyName_HZoomer))

EnemyHeaders_Zeela:
    %EnemyHeader(\
    %tileDataSize($0600),
    %palette(Palette_Zeela),
    %health(30),
    %damage(10),
    %width(8),
    %height(8),
    %bank(InitAI_Zeela>>16),
    %hurtAITime(0),
    %cry($0023),
    %bossID(0),
    %initAI(InitAI_Zeela),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Crawlers),
    %grappleAI(Common_GrappleAI_KillEnemy),
    %hurtAI(RTL_A3804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(Common_NormalEnemyShotAI),
    %spritemap(0),
    %tileData(Tiles_Zeela),
    %layer(5),
    %drops(EnemyDropChances_Zeela),
    %vulnerabilities(EnemyVulnerabilities_Viola_Yard_HZoomer_Zeela_Sova_Zoomer),
    %name(EnemyName_Zeela))

EnemyHeaders_Sova:
    %EnemyHeader(\
    %tileDataSize($0600),
    %palette(Palette_Sova),
    %health(40),
    %damage(20),
    %width(8),
    %height(8),
    %bank(InitAI_Sova>>16),
    %hurtAITime(0),
    %cry($0023),
    %bossID(0),
    %initAI(InitAI_Sova),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Crawlers),
    %grappleAI(Common_GrappleAI_KillEnemy),
    %hurtAI(RTL_A3804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(Common_NormalEnemyShotAI),
    %spritemap(0),
    %tileData(Tiles_Sova),
    %layer(5),
    %drops(EnemyDropChances_Sova),
    %vulnerabilities(EnemyVulnerabilities_Viola_Yard_HZoomer_Zeela_Sova_Zoomer),
    %name(EnemyName_Sova))

EnemyHeaders_Zoomer:
    %EnemyHeader(\
    %tileDataSize($0600),
    %palette(Palette_Zoomer),
    %health(15),
    %damage(5),
    %width(8),
    %height(8),
    %bank(InitAI_Zoomer_MZoomer>>16),
    %hurtAITime(0),
    %cry($0023),
    %bossID(0),
    %initAI(InitAI_Zoomer_MZoomer),
    %parts(1),
    %unused(1),
    %mainAI(MainAI_Crawlers),
    %grappleAI(Common_GrappleAI_KillEnemy),
    %hurtAI(RTL_A3804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(Common_NormalEnemyShotAI),
    %spritemap(0),
    %tileData(Tiles_Zoomer),
    %layer(5),
    %drops(EnemyDropChances_Zoomer),
    %vulnerabilities(EnemyVulnerabilities_Viola_Yard_HZoomer_Zeela_Sova_Zoomer),
    %name(EnemyName_Zoomer))

EnemyHeaders_MZoomer:
    %EnemyHeader(\
    %tileDataSize($0600),
    %palette(Palette_MZoomer),
    %health(15),
    %damage(5),
    %width(8),
    %height(8),
    %bank(InitAI_Zoomer_MZoomer>>16),
    %hurtAITime(0),
    %cry($0023),
    %bossID(0),
    %initAI(InitAI_Zoomer_MZoomer),
    %parts(1),
    %unused(1),
    %mainAI(MainAI_Crawlers),
    %grappleAI(Common_GrappleAI_KillEnemy),
    %hurtAI(RTL_A3804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(Common_NormalEnemyShotAI),
    %spritemap(0),
    %tileData(Tiles_Zoomer),
    %layer(5),
    %drops(EnemyDropChances_MZoomer),
    %vulnerabilities(EnemyVulnerabilities_MZoomer),
    %name(EnemyName_MZoomer))

EnemyHeaders_Metroid:
    %EnemyHeader(\
    %tileDataSize($1000),
    %palette(Palette_Metroid),
    %health(500),
    %damage(120),
    %width(10),
    %height(10),
    %bank(InitAI_Metroid>>16),
    %hurtAITime(0),
    %cry($005A),
    %bossID(0),
    %initAI(InitAI_Metroid),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Metroid),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(HurtAI_Metroid),
    %frozenAI(FrozenAI_Metroid),
    %timeIsFrozen(0),
    %deathAnimation(4),
    %powerBombReaction(PowerBombReaction_Metroid),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_Metroid),
    %enemyShot(EnemyShot_Metroid),
    %spritemap(0),
    %tileData(Tiles_Metroid),
    %layer(5),
    %drops(EnemyDropChances_Metroid),
    %vulnerabilities(EnemyVulnerabilities_Metroid),
    %name(EnemyName_Metroid))

EnemyHeaders_Crocomire:
    %EnemyHeader(\
    %tileDataSize($A600),
    %palette(Palette_Crocomire),
    %health(32767),
    %damage(40),
    %width($30),
    %height($38),
    %bank(InitAI_Crocomire>>16),
    %hurtAITime(0),
    %cry($0005),
    %bossID(6),
    %initAI(InitAI_Crocomire),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Crocomire),
    %grappleAI(Common_GrappleAI_SamusLatchesOn),
    %hurtAI(HurtAI_Crocomire),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(PowerBombReaction_Crocomire),
    %variantIndex(0),
    %enemyTouch(RTL_A4B950),
    %enemyShot(0),
    %spritemap(0),
    %tileData(Tiles_Crocomire),
    %layer(5),
    %drops(EnemyDropChances_Crocomire),
    %vulnerabilities(EnemyVulnerabilities_Crocomire_CrocomireTongue),
    %name(0))

EnemyHeaders_CrocomireTongue:
    %EnemyHeader(\
    %tileDataSize($2000),
    %palette(Palette_Crocomire),
    %health(32767),
    %damage(40),
    %width(8),
    %height(8),
    %bank(InitAI_CrocomireTongue>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(6),
    %initAI(InitAI_CrocomireTongue),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_CrocomireTongue),
    %grappleAI(Common_GrappleAI_SamusLatchesOn),
    %hurtAI(RTL_A4804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(Common_NormalEnemyShotAI),
    %spritemap(0),
    %tileData(Tiles_Crocomire),
    %layer(5),
    %drops(EnemyDropChances_CrocomireTongue),
    %vulnerabilities(EnemyVulnerabilities_Crocomire_CrocomireTongue),
    %name(0))

EnemyHeaders_DraygonBody:
    %EnemyHeader(\
    %tileDataSize($2000),
    %palette(Palette_Draygon_Sprite7),
    %health(6000),
    %damage(160),
    %width($40),
    %height($40),
    %bank(InitAI_DraygonBody>>16),
    %hurtAITime(4),
    %cry(0),
    %bossID(8),
    %initAI(InitAI_DraygonBody),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_DraygonBody),
    %grappleAI(Common_GrappleAI_NoInteraction),
    %hurtAI(HurtAI_Draygon),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(PowerBombReaction_Draygon),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_Draygon),
    %enemyShot(EnemyShot_Draygon),
    %spritemap(0),
    %tileData(Tiles_Draygon),
    %layer(5),
    %drops(EnemyDropChances_DraygonBody_DraygonTail_DraygonArms),
    %vulnerabilities(EnemyVulnerabilities_Draygon_Body_Eye_Tail_Arms),
    %name(0))

EnemyHeaders_DraygonEye:
    %EnemyHeader(\
    %tileDataSize($1800),
    %palette(NOPNOP_A58069),
    %health(6000),
    %damage(160),
    %width(2),
    %height(2),
    %bank(InitAI_DraygonEye>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_DraygonEye),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_DraygonEye),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A5804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(RTL_A0804C),
    %variantIndex(0),
    %enemyTouch(RTL_A5804C),
    %enemyShot(RTL_A5804C),
    %spritemap(0),
    %tileData(Tiles_Draygon),
    %layer(5),
    %drops(EnemyDropChances_DraygonEye),
    %vulnerabilities(EnemyVulnerabilities_Draygon_Body_Eye_Tail_Arms),
    %name(0))

EnemyHeaders_DraygonTail:
    %EnemyHeader(\
    %tileDataSize($1800),
    %palette(Palette_Draygon_Sprite7),
    %health(6000),
    %damage(160),
    %width($10),
    %height($20),
    %bank(InitAI_DraygonTail>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_DraygonTail),
    %parts(1),
    %unused(0),
    %mainAI(RTL_A5C5AA),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A5804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(RTL_A0804C),
    %variantIndex(0),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(Common_NormalEnemyShotAI),
    %spritemap(0),
    %tileData(Tiles_Draygon),
    %layer(5),
    %drops(EnemyDropChances_DraygonBody_DraygonTail_DraygonArms),
    %vulnerabilities(EnemyVulnerabilities_Draygon_Body_Eye_Tail_Arms),
    %name(0))

EnemyHeaders_DraygonArms:
    %EnemyHeader(\
    %tileDataSize($1800),
    %palette(Palette_Draygon_Sprite7),
    %health(6000),
    %damage(160),
    %width($18),
    %height($18),
    %bank(InitAI_DraygonArms>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_DraygonArms),
    %parts(1),
    %unused(0),
    %mainAI(RTL_A5C5C4),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A5804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(RTL_A0804C),
    %variantIndex(0),
    %enemyTouch(RTL_A5804C),
    %enemyShot(RTL_A5804C),
    %spritemap(0),
    %tileData(Tiles_Draygon),
    %layer(5),
    %drops(EnemyDropChances_DraygonBody_DraygonTail_DraygonArms),
    %vulnerabilities(EnemyVulnerabilities_Draygon_Body_Eye_Tail_Arms),
    %name(0))

EnemyHeaders_SporeSpawn:
    %EnemyHeader(\
    %tileDataSize($0E00),
    %palette(Palette_SporeSpawn),
    %health(960),
    %damage(12),
    %width($30),
    %height($20),
    %bank(InitAI_SporeSpawn>>16),
    %hurtAITime(4),
    %cry($002C),
    %bossID(4),
    %initAI(InitAI_SporeSpawn),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_SporeSpawn),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A5804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(PowerBombReaction_SporeSpawn),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_SporeSpawn),
    %enemyShot(EnemyShot_SporeSpawn_Vulnerable),
    %spritemap(0),
    %tileData(Tiles_SporeSpawn),
    %layer(2),
    %drops(EnemyDropChances_SporeSpawn),
    %vulnerabilities(EnemyVulnerabilities_SporeSpawn),
    %name(0))

EnemyHeaders_SporeSpawnStalk:
    %EnemyHeader(\
    %tileDataSize($0E00),
    %palette(Palette_SporeSpawn),
    %health(960),
    %damage(12),
    %width($13),
    %height($13),
    %bank(InitAI_SporeSpawn>>16),
    %hurtAITime(8),
    %cry(0),
    %bossID(4),
    %initAI(InitAI_SporeSpawn),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_SporeSpawn),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A5804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_SporeSpawn),
    %enemyShot(EnemyShot_SporeSpawn_Vulnerable),
    %spritemap(0),
    %tileData(Tiles_SporeSpawn),
    %layer(5),
    %drops(EnemyDropChances_SporeSpawnStalk),
    %vulnerabilities(EnemyVulnerabilities_SporeSpawn),
    %name(0))

EnemyHeaders_Boulder:
    %EnemyHeader(\
    %tileDataSize($1000),
    %palette(Palette_Boulder),
    %health(20),
    %damage(40),
    %width(16),
    %height(16),
    %bank(InitAI_Boulder>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_Boulder),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Boulder),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A6804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(Common_NormalEnemyShotAI),
    %spritemap(0),
    %tileData(Tiles_Boulder),
    %layer(5),
    %drops(EnemyDropChances_Boulder),
    %vulnerabilities(EnemyVulnerabilities_Boulder),
    %name(EnemyName_Boulder))

EnemyHeaders_KzanTop:
    %EnemyHeader(\
    %tileDataSize($0400),
    %palette(Palette_Kzan),
    %health(500),
    %damage(200),
    %width(16),
    %height(12),
    %bank(InitAI_KzanTop>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_KzanTop),
    %parts(2),
    %unused(0),
    %mainAI(MainAI_KzanTop),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A6804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(RTL_A6804C),
    %spritemap(0),
    %tileData(Tiles_Kzan),
    %layer(5),
    %drops(EnemyDropChances_KzanTop_KzanBottom),
    %vulnerabilities(EnemyVulnerabilities_Indestructible),
    %name(EnemyName_KzanTop))

EnemyHeaders_KzanBottom:
    %EnemyHeader(\
    %tileDataSize($0200),
    %palette(Palette_Kzan),
    %health(500),
    %damage(200),
    %width(16),
    %height(2),
    %bank(InitAI_KzanBottom>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_KzanBottom),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_KzanBottom),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A6804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(RTL_A6804C),
    %spritemap(0),
    %tileData(Tiles_Kzan),
    %layer(5),
    %drops(EnemyDropChances_KzanTop_KzanBottom),
    %vulnerabilities(EnemyVulnerabilities_Indestructible),
    %name(0))

EnemyHeaders_Hibashi:
    %EnemyHeader(\
    %tileDataSize($0800),
    %palette(Palette_Hibashi),
    %health(20),
    %damage(30),
    %width(8),
    %height(8),
    %bank(InitAI_Hibashi>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_Hibashi),
    %parts(2),
    %unused(0),
    %mainAI(MainAI_Hibashi),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A6804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(RTL_A6804C),
    %spritemap(0),
    %tileData(Tiles_Hibashi_Puromi),
    %layer(5),
    %drops(EnemyDropChances_Hibashi),
    %vulnerabilities(EnemyVulnerabilities_Indestructible),
    %name(EnemyName_Hibashi))

EnemyHeaders_Puromi:
    %EnemyHeader(\
    %tileDataSize($0800),
    %palette(Palette_Puromi),
    %health(40),
    %damage(50),
    %width(8),
    %height(8),
    %bank(InitAI_Puromi>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_Puromi),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Puromi),
    %grappleAI(Common_GrappleAI_NoInteraction),
    %hurtAI(RTL_A6804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(RTL_A6804C),
    %spritemap(0),
    %tileData(Tiles_Hibashi_Puromi),
    %layer(5),
    %drops(EnemyDropChances_Puromi),
    %vulnerabilities(EnemyVulnerabilities_Indestructible),
    %name(EnemyName_Puromi))

EnemyHeaders_MiniKraid:
    %EnemyHeader(\
    %tileDataSize($1000),
    %palette(Palette_MiniKraid),
    %health(400),
    %damage(100),
    %width($20),
    %height($18),
    %bank(InitAI_MiniKraid>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_MiniKraid),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_MiniKraid),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A6804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(3),
    %powerBombReaction(EnemyShot_PowerBombReaction_MiniKraid),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_MiniKraid),
    %enemyShot(EnemyShot_PowerBombReaction_MiniKraid),
    %spritemap(0),
    %tileData(Tiles_MiniKraid),
    %layer(5),
    %drops(EnemyDropChances_MiniKraid),
    %vulnerabilities(EnemyVulnerabilities_MiniKraid),
    %name(EnemyName_MiniKraid))

EnemyHeaders_RidleyCeres:
    %EnemyHeader(\
    %tileDataSize($2000),
    %palette(Palette_Ridley),
    %health(32767),
    %damage(5),
    %width(8),
    %height(8),
    %bank(InitAI_Ridley>>16),
    %hurtAITime(8),
    %cry(0),
    %bossID(1),
    %initAI(InitAI_Ridley),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_RidleyCeres),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(HurtAI_RidleyCeres),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(PowerBombReaction_Ridley),
    %variantIndex(0),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(EnemyShot_Ridley),
    %spritemap(0),
    %tileData(Tiles_Ridley_0),
    %layer(5),
    %drops(EnemyDropChances_Ridley_RidleyCeres),
    %vulnerabilities(EnemyVulnerabilities_Ridley_RidleyCeres),
    %name(0))

EnemyHeaders_Ridley:
    %EnemyHeader(\
    %tileDataSize($2000),
    %palette(Palette_Ridley),
    %health(18000),
    %damage(160),
    %width(8),
    %height(8),
    %bank(InitAI_Ridley>>16),
    %hurtAITime(8),
    %cry(0),
    %bossID(5),
    %initAI(InitAI_Ridley),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Ridley),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(HurtAI_Ridley),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(TimeIsFrozenAI_Ridley),
    %deathAnimation(0),
    %powerBombReaction(PowerBombReaction_Ridley),
    %variantIndex(0),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(EnemyShot_Ridley),
    %spritemap(0),
    %tileData(Tiles_Ridley_0),
    %layer(2),
    %drops(EnemyDropChances_Ridley_RidleyCeres),
    %vulnerabilities(EnemyVulnerabilities_Ridley_RidleyCeres),
    %name(0))

EnemyHeaders_RidleyExplosion:
    %EnemyHeader(\
    %tileDataSize($8400),
    %palette(Palette_RidleyExplosion_0),
    %health(18000),
    %damage(160),
    %width(8),
    %height(8),
    %bank(InitAI_RidleyExplosion>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_RidleyExplosion),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_RidleyExplosion),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A6804C),
    %frozenAI(RTL_A6804C),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(RTL_A0804C),
    %variantIndex(0),
    %enemyTouch(RTL_A6804C),
    %enemyShot(RTL_A6804C),
    %spritemap(0),
    %tileData(Tiles_RidleyExplosion),
    %layer(5),
    %drops(0),
    %vulnerabilities(EnemyVulnerabilities_Indestructible),
    %name(0))

EnemyHeaders_Steam:
    %EnemyHeader(\
    %tileDataSize(0),
    %palette(Palette_CeresSteam),
    %health(32767),
    %damage(0),
    %width(8),
    %height(8),
    %bank(InitAI_CeresSteam>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_CeresSteam),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_CeresSteam),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A6804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_CeresSteam),
    %enemyShot(RTL_A6804C),
    %spritemap(0),
    %tileData(EnemyHeaders_CeresDoor),
    %layer(5),
    %drops(EnemyDropChances_Steam_Dachora_DachoraEscape),
    %vulnerabilities(EnemyVulnerabilities_Indestructible),
    %name(0))

EnemyHeaders_CeresDoor:
    %EnemyHeader(\
    %tileDataSize($8600),
    %palette(Palette_CeresDoor_BeforeEscape),
    %health(40),
    %damage(15),
    %width(8),
    %height($20),
    %bank(InitAI_CeresDoor>>16),
    %hurtAITime(0),
    %cry($0059),
    %bossID(0),
    %initAI(InitAI_CeresDoor),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_CeresDoor),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A6804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(InstListPointers_CeresDoor),
    %enemyTouch(RTL_A6F920),
    %enemyShot(RTL_A6F920),
    %spritemap(InitAI_Zebetite),
    %tileData(Tiles_CeresDoor_0),
    %layer(2),
    %drops(0),
    %vulnerabilities(0),
    %name(0))

EnemyHeaders_Zebetite:
    %EnemyHeader(\
    %tileDataSize(0),
    %palette(0),
    %health(1000),
    %damage(0),
    %width(8),
    %height($18),
    %bank(InitAI_Zebetite>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_Zebetite),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Zebetite),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A6804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_Zebetite),
    %enemyShot(EnemyShot_Zebetite),
    %spritemap(0),
    %tileData(Tiles_MotherBrainHead),
    %layer(5),
    %drops(0),
    %vulnerabilities(EnemyVulnerabilities_Zebetite),
    %name(0))

EnemyHeaders_Kraid:
    %EnemyHeader(\
    %tileDataSize($1E00),
    %palette(Palette_Kraid),
    %health(1000),
    %damage(20),
    %width($38),
    %height($90),
    %bank(InitAI_Kraid>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(3),
    %initAI(InitAI_Kraid),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Kraid),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A7804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(Common_NormalEnemyPowerBombAI_NoDeathCheck),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_Kraid),
    %enemyShot(RTL_A7804C),
    %spritemap(0),
    %tileData(Tiles_Kraid),
    %layer(5),
    %drops(EnemyDropChances_Kraid),
    %vulnerabilities(EnemyVulnerabilities_Kraid),
    %name(0))

EnemyHeaders_KraidArm:
    %EnemyHeader(\
    %tileDataSize($1E00),
    %palette(Palette_Kraid),
    %health(1000),
    %damage(20),
    %width($30),
    %height($30),
    %bank(InitAI_KraidArm>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_KraidArm),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_KraidArm),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A7804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_KraidArm),
    %enemyShot(RTL_A794B5),
    %spritemap(0),
    %tileData(Tiles_Kraid),
    %layer(5),
    %drops(0),
    %vulnerabilities(EnemyVulnerabilities_KraidArm_KraidFoot),
    %name(0))

EnemyHeaders_KraidLintTop:
    %EnemyHeader(\
    %tileDataSize($1E00),
    %palette(Palette_Kraid),
    %health(1000),
    %damage(10),
    %width($18),
    %height(8),
    %bank(InitAI_KraidLintTop>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_KraidLintTop),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_KraidLintTop),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A7804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(RTL_A7948F),
    %enemyShot(Common_NormalEnemyShotAI),
    %spritemap(0),
    %tileData(Tiles_Kraid),
    %layer(5),
    %drops(0),
    %vulnerabilities(EnemyVulnerabilities_Kraid_LintTop_LintMiddle_LintBottom),
    %name(0))

EnemyHeaders_KraidLintMiddle:
    %EnemyHeader(\
    %tileDataSize($1E00),
    %palette(Palette_Kraid),
    %health(1000),
    %damage(10),
    %width($18),
    %height(8),
    %bank(InitAI_KraidLintMiddle>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_KraidLintMiddle),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_KraidLintMiddle),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A7804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(RTL_A7948F),
    %enemyShot(Common_NormalEnemyShotAI),
    %spritemap(0),
    %tileData(Tiles_Kraid),
    %layer(5),
    %drops(0),
    %vulnerabilities(EnemyVulnerabilities_Kraid_LintTop_LintMiddle_LintBottom),
    %name(0))

EnemyHeaders_KraidLintBottom:
    %EnemyHeader(\
    %tileDataSize($1E00),
    %palette(Palette_Kraid),
    %health(1000),
    %damage(10),
    %width($18),
    %height(8),
    %bank(InitAI_KraidLintBottom>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_KraidLintBottom),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_KraidLintBottom),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A7804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(RTL_A7948F),
    %enemyShot(Common_NormalEnemyShotAI),
    %spritemap(0),
    %tileData(Tiles_Kraid),
    %layer(5),
    %drops(0),
    %vulnerabilities(EnemyVulnerabilities_Kraid_LintTop_LintMiddle_LintBottom),
    %name(0))

EnemyHeaders_KraidFoot:
    %EnemyHeader(\
    %tileDataSize($1E00),
    %palette(Palette_Kraid),
    %health(1000),
    %damage(20),
    %width(8),
    %height(8),
    %bank(InitAI_KraidFoot>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_KraidFoot),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_KraidFoot),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A7804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(RTL_A7948F),
    %enemyShot(RTL_A794B5),
    %spritemap(0),
    %tileData(Tiles_Kraid),
    %layer(5),
    %drops(EnemyDropChances_KraidNail_KraidFoot),
    %vulnerabilities(EnemyVulnerabilities_KraidArm_KraidFoot),
    %name(0))

EnemyHeaders_KraidNail:
    %EnemyHeader(\
    %tileDataSize($1E00),
    %palette(Palette_Kraid),
    %health(10),
    %damage(10),
    %width(8),
    %height(8),
    %bank(InitAI_KraidNail>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_KraidNail),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_KraidNail),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A7804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_KraidNail),
    %enemyShot(Common_NormalEnemyShotAI),
    %spritemap(0),
    %tileData(Tiles_Kraid),
    %layer(5),
    %drops(EnemyDropChances_KraidNail_KraidFoot),
    %vulnerabilities(EnemyVulnerabilities_KraidNail_KraidNailBad),
    %name(0))

EnemyHeaders_KraidNailBad:
    %EnemyHeader(\
    %tileDataSize($1E00),
    %palette(Palette_Kraid),
    %health(10),
    %damage(10),
    %width(8),
    %height(8),
    %bank(InitAI_KraidNailBad>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_KraidNailBad),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_KraidNailBad),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A7804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_KraidNailBad),
    %enemyShot(Common_NormalEnemyShotAI),
    %spritemap(0),
    %tileData(Tiles_Kraid),
    %layer(5),
    %drops(0),
    %vulnerabilities(EnemyVulnerabilities_KraidNail_KraidNailBad),
    %name(0))

EnemyHeaders_PhantoonBody:
    %EnemyHeader(\
    %tileDataSize($0C00),
    %palette(Palette_Phantoon),
    %health(2500),
    %damage(40),
    %width(8),
    %height(8),
    %bank(InitAI_PhantoonBody>>16),
    %hurtAITime(8),
    %cry(0),
    %bossID(7),
    %initAI(InitAI_PhantoonBody),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Phantoon),
    %grappleAI(Common_GrappleAI_NoInteraction),
    %hurtAI(HurtAI_Phantoon),
    %frozenAI(RTL_A7804C),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(RTL_A7DD9A),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_Phantoon),
    %enemyShot(EnemyShot_Phantoon),
    %spritemap(0),
    %tileData(Tiles_Phantoon),
    %layer(5),
    %drops(EnemyDropChances_Phantoon_Body_Tentacles_Mouth),
    %vulnerabilities(EnemyVulnerabilities_Phantoon_Body_Eye_Tentacles_Mouth),
    %name(0))

EnemyHeaders_PhantoonEye:
    %EnemyHeader(\
    %tileDataSize($0400),
    %palette(Palette_Phantoon),
    %health(2500),
    %damage(40),
    %width(8),
    %height(8),
    %bank(InitAI_Phantoon_Eye_Tentacles_Mouth>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_Phantoon_Eye_Tentacles_Mouth),
    %parts(1),
    %unused(0),
    %mainAI(RTL_A7804C),
    %grappleAI(Common_GrappleAI_NoInteraction),
    %hurtAI(RTL_A7804C),
    %frozenAI(RTL_A7804C),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(RTL_A0804C),
    %variantIndex(0),
    %enemyTouch(RTL_A7804C),
    %enemyShot(RTL_A7804C),
    %spritemap(0),
    %tileData(Tiles_Phantoon),
    %layer(5),
    %drops(EnemyDropChances_PhantoonEye),
    %vulnerabilities(EnemyVulnerabilities_Phantoon_Body_Eye_Tentacles_Mouth),
    %name(0))

EnemyHeaders_PhantoonTentacles:
    %EnemyHeader(\
    %tileDataSize($0400),
    %palette(Palette_Phantoon),
    %health(2500),
    %damage(40),
    %width(8),
    %height(8),
    %bank(InitAI_Phantoon_Eye_Tentacles_Mouth>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_Phantoon_Eye_Tentacles_Mouth),
    %parts(1),
    %unused(0),
    %mainAI(RTL_A7E011),
    %grappleAI(Common_GrappleAI_NoInteraction),
    %hurtAI(RTL_A7804C),
    %frozenAI(RTL_A7804C),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(RTL_A0804C),
    %variantIndex(0),
    %enemyTouch(RTL_A7804C),
    %enemyShot(RTL_A7804C),
    %spritemap(0),
    %tileData(Tiles_Phantoon),
    %layer(5),
    %drops(EnemyDropChances_Phantoon_Body_Tentacles_Mouth),
    %vulnerabilities(EnemyVulnerabilities_Phantoon_Body_Eye_Tentacles_Mouth),
    %name(0))

EnemyHeaders_PhantoonMouth:
    %EnemyHeader(\
    %tileDataSize($0400),
    %palette(Palette_Phantoon),
    %health(2500),
    %damage(40),
    %width(8),
    %height(8),
    %bank(InitAI_Phantoon_Eye_Tentacles_Mouth>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_Phantoon_Eye_Tentacles_Mouth),
    %parts(1),
    %unused(0),
    %mainAI(RTL_A7E011),
    %grappleAI(Common_GrappleAI_NoInteraction),
    %hurtAI(RTL_A7804C),
    %frozenAI(RTL_A7804C),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(RTL_A0804C),
    %variantIndex(0),
    %enemyTouch(RTL_A7804C),
    %enemyShot(RTL_A7804C),
    %spritemap(0),
    %tileData(Tiles_Phantoon),
    %layer(5),
    %drops(EnemyDropChances_Phantoon_Body_Tentacles_Mouth),
    %vulnerabilities(EnemyVulnerabilities_Phantoon_Body_Eye_Tentacles_Mouth),
    %name(0))

EnemyHeaders_Etecoon:
    %EnemyHeader(\
    %tileDataSize($0600),
    %palette(Palette_Etecoon),
    %health(32767),
    %damage(0),
    %width(6),
    %height(7),
    %bank(InitAI_Etecoon>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_Etecoon),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Etecoon),
    %grappleAI(Common_GrappleAI_NoInteraction),
    %hurtAI(RTL_A7804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(RTL_A0804C),
    %variantIndex(0),
    %enemyTouch(RTL_A7804C),
    %enemyShot(RTL_A7804C),
    %spritemap(0),
    %tileData(Tiles_Etecoon),
    %layer(5),
    %drops(EnemyDropChances_Etecoon_EtecoonEscape),
    %vulnerabilities(0),
    %name(0))

EnemyHeaders_Dachora:
    %EnemyHeader(\
    %tileDataSize($0C00),
    %palette(Palette_Dachora),
    %health(32767),
    %damage(0),
    %width(8),
    %height($18),
    %bank(InitAI_Dachora>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_Dachora),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Dachora),
    %grappleAI(Common_GrappleAI_NoInteraction),
    %hurtAI(RTL_A7804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(RTL_A0804C),
    %variantIndex(0),
    %enemyTouch(RTL_A7804C),
    %enemyShot(RTL_A7804C),
    %spritemap(0),
    %tileData(Tiles_Dachora),
    %layer(5),
    %drops(EnemyDropChances_Steam_Dachora_DachoraEscape),
    %vulnerabilities(0),
    %name(0))

EnemyHeaders_Evir:
    %EnemyHeader(\
    %tileDataSize($0600),
    %palette(Palette_Evir),
    %health(300),
    %damage(100),
    %width($10),
    %height($14),
    %bank(InitAI_Evir>>16),
    %hurtAITime(0),
    %cry($004A),
    %bossID(0),
    %initAI(InitAI_Evir),
    %parts(3),
    %unused(0),
    %mainAI(MainAI_Evir),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A8804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(4),
    %powerBombReaction(PowerBombReaction_Evir),
    %variantIndex(0),
    %enemyTouch(EnemyShot_Evir),
    %enemyShot(EnemyTouch_Evir),
    %spritemap(0),
    %tileData(Tiles_Evir),
    %layer(5),
    %drops(EnemyDropChances_Evir_EvirProjectile),
    %vulnerabilities(EnemyVulnerabilities_Evir),
    %name(EnemyName_Evir))

EnemyHeaders_EvirProjectile:
    %EnemyHeader(\
    %tileDataSize($0600),
    %palette(Palette_Evir),
    %health(300),
    %damage(100),
    %width(8),
    %height(8),
    %bank(InitAI_EvirProjectile>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_EvirProjectile),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_EvirProjectile),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A8804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(RTL_A0804C),
    %variantIndex(0),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(RTL_A8804C),
    %spritemap(0),
    %tileData(Tiles_Evir),
    %layer(5),
    %drops(EnemyDropChances_Evir_EvirProjectile),
    %vulnerabilities(EnemyVulnerabilities_EvirProjectile),
    %name(0))

EnemyHeaders_Eye:
    %EnemyHeader(\
    %tileDataSize($0400),
    %palette(Palette_Eye),
    %health(20),
    %damage(0),
    %width(8),
    %height(8),
    %bank(InitAI_Eye>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_Eye),
    %parts(2),
    %unused(0),
    %mainAI(MainAI_Eye),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A8804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(RTL_A8804C),
    %spritemap(0),
    %tileData(Tiles_Eye),
    %layer(5),
    %drops(EnemyDropChances_Eye),
    %vulnerabilities(EnemyVulnerabilities_Indestructible),
    %name(EnemyName_Eye))

EnemyHeaders_Fune:
    %EnemyHeader(\
    %tileDataSize($0800),
    %palette(Palette_Fune),
    %health(20),
    %damage(10),
    %width(16),
    %height(16),
    %bank(InitAI_Fune_Namihe>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_Fune_Namihe),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Fune_Namihe),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A8804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(2),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(Common_NormalEnemyShotAI),
    %spritemap(0),
    %tileData(Tiles_Fune_Namihe),
    %layer(5),
    %drops(EnemyDropChances_Fune),
    %vulnerabilities(EnemyVulnerabilities_Fune_Magdollite),
    %name(EnemyName_Fune))

EnemyHeaders_Namihe:
    %EnemyHeader(\
    %tileDataSize($0800),
    %palette(Palette_Namihe),
    %health(20),
    %damage(10),
    %width(16),
    %height(16),
    %bank(InitAI_Fune_Namihe>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_Fune_Namihe),
    %parts(3),
    %unused(0),
    %mainAI(MainAI_Fune_Namihe),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A8804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(2),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(Common_NormalEnemyShotAI),
    %spritemap(0),
    %tileData(Tiles_Fune_Namihe),
    %layer(5),
    %drops(EnemyDropChances_Namihe),
    %vulnerabilities(EnemyVulnerabilities_Namihe),
    %name(EnemyName_Namihe))

EnemyHeaders_Coven:
    %EnemyHeader(\
    %tileDataSize($0400),
    %palette(Palette_Coven),
    %health(300),
    %damage(60),
    %width(16),
    %height(16),
    %bank(InitAI_Coven>>16),
    %hurtAITime(0),
    %cry($0051),
    %bossID(0),
    %initAI(InitAI_Coven),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Coven),
    %grappleAI(Common_GrappleAI_NoInteraction),
    %hurtAI(RTL_A8804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(2),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(Common_NormalEnemyShotAI),
    %spritemap(0),
    %tileData(Tiles_Coven),
    %layer(5),
    %drops(EnemyDropChances_Coven),
    %vulnerabilities(EnemyVulnerabilities_Default),
    %name(EnemyName_Coven))

EnemyHeaders_YappingMaw:
    %EnemyHeader(\
    %tileDataSize($0400),
    %palette(Palette_YappingMaw),
    %health(20),
    %damage(30),
    %width(8),
    %height(8),
    %bank(InitAI_YappingMaw>>16),
    %hurtAITime(0),
    %cry($003E),
    %bossID(0),
    %initAI(InitAI_YappingMaw),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_YappingMaw),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A8804C),
    %frozenAI(FrozenAI_YappingMaw),
    %timeIsFrozen(0),
    %deathAnimation(4),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_YappingMaw),
    %enemyShot(EnemyShot_YappingMaw),
    %spritemap(0),
    %tileData(Tiles_YappingMaw),
    %layer(5),
    %drops(EnemyDropChances_YappingMaw),
    %vulnerabilities(EnemyVulnerabilities_YappingMaw),
    %name(EnemyName_YappingMaw))

EnemyHeaders_Kago:
    %EnemyHeader(\
    %tileDataSize($0800),
    %palette(Palette_Kago),
    %health(1600),
    %damage(0),
    %width(16),
    %height(16),
    %bank(InitAI_Kago>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_Kago),
    %parts(9),
    %unused(0),
    %mainAI(MainAI_Kago),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A8804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(4),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(EnemyShot_Kago),
    %spritemap(0),
    %tileData(Tiles_Kago),
    %layer(5),
    %drops(EnemyDropChances_Kago),
    %vulnerabilities(EnemyVulnerabilities_Kago),
    %name(EnemyName_Kago))

EnemyHeaders_Magdollite:
    %EnemyHeader(\
    %tileDataSize($0600),
    %palette(Palette_Magdollite),
    %health(20),
    %damage(40),
    %width(8),
    %height(8),
    %bank(InitAI_Magdollite>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_Magdollite),
    %parts(3),
    %unused(0),
    %mainAI(MainAI_Magdollite),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A8804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(4),
    %powerBombReaction(PowerBombReaction_Magdollite),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_Magdollite),
    %enemyShot(EnemyShot_Magdollite),
    %spritemap(0),
    %tileData(Tiles_Magdollite),
    %layer(5),
    %drops(EnemyDropChances_Magdollite),
    %vulnerabilities(EnemyVulnerabilities_Fune_Magdollite),
    %name(EnemyName_Magdollite))

EnemyHeaders_Beetom:
    %EnemyHeader(\
    %tileDataSize($0600),
    %palette(Palette_Beetom),
    %health(60),
    %damage(10),
    %width(8),
    %height(8),
    %bank(InitAI_Beetom>>16),
    %hurtAITime(0),
    %cry($0055),
    %bossID(0),
    %initAI(InitAI_Beetom),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Beetom),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A8804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_Beetom),
    %enemyShot(EnemyShot_Beetom),
    %spritemap(0),
    %tileData(Tiles_Beetom),
    %layer(5),
    %drops(EnemyDropChances_Beetom),
    %vulnerabilities(EnemyVulnerabilities_Beetom),
    %name(EnemyName_Beetom))

EnemyHeaders_Powamp:
    %EnemyHeader(\
    %tileDataSize($0400),
    %palette(Palette_Powamp),
    %health(10),
    %damage(100),
    %width(8),
    %height(16),
    %bank(InitAI_Powamp>>16),
    %hurtAITime(0),
    %cry($006A),
    %bossID(0),
    %initAI(InitAI_Powamp),
    %parts(2),
    %unused(0),
    %mainAI(MainAI_Powamp),
    %grappleAI(Common_GrappleAI_SamusLatchesOn_NoInvincibility),
    %hurtAI(RTL_A8804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(2),
    %powerBombReaction(PowerBombReaction_Powamp),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_Powamp),
    %enemyShot(EnemyShot_Powamp),
    %spritemap(0),
    %tileData(Tiles_Powamp),
    %layer(5),
    %drops(EnemyDropChances_Powamp),
    %vulnerabilities(EnemyVulnerabilities_Powamp),
    %name(EnemyName_Powamp))

EnemyHeaders_Robot:
    %EnemyHeader(\
    %tileDataSize($0C00),
    %palette(Palette_Robot),
    %health(800),
    %damage(80),
    %width(12),
    %height($20),
    %bank(InitAI_Robot>>16),
    %hurtAITime(0),
    %cry($0068),
    %bossID(0),
    %initAI(InitAI_Robot),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Robot),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A8804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(2),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_Robot),
    %enemyShot(EnemyShot_Robot),
    %spritemap(0),
    %tileData(Tiles_Robot),
    %layer(5),
    %drops(EnemyDropChances_Robot),
    %vulnerabilities(EnemyVulnerabilities_Indestructible),
    %name(EnemyName_Robot))

EnemyHeaders_RobotNoPower:
    %EnemyHeader(\
    %tileDataSize($0C00),
    %palette(Palette_Robot),
    %health(450),
    %damage(80),
    %width(12),
    %height($20),
    %bank(InitAI_RobotNoPower>>16),
    %hurtAITime(0),
    %cry($0068),
    %bossID(0),
    %initAI(InitAI_RobotNoPower),
    %parts(1),
    %unused(0),
    %mainAI(RTL_A8CC66),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A8804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_Robot),
    %enemyShot(EnemyShot_RobotNoPower),
    %spritemap(0),
    %tileData(Tiles_Robot),
    %layer(5),
    %drops(EnemyDropChances_RobotNoPower),
    %vulnerabilities(EnemyVulnerabilities_Indestructible),
    %name(EnemyName_RobotNoPower))

EnemyHeaders_Bull:
    %EnemyHeader(\
    %tileDataSize($0600),
    %palette(Palette_Bull),
    %health(100),
    %damage(10),
    %width(8),
    %height(8),
    %bank(InitAI_Bull>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_Bull),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Bull),
    %grappleAI(Common_GrappleAI_KillEnemy),
    %hurtAI(RTL_A8804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(2),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(EnemyShot_Bull),
    %spritemap(0),
    %tileData(Tiles_Bull),
    %layer(5),
    %drops(EnemyDropChances_Bull),
    %vulnerabilities(EnemyVulnerabilities_Bull),
    %name(EnemyName_Bull))

EnemyHeaders_Alcoon:
    %EnemyHeader(\
    %tileDataSize($0800),
    %palette(Palette_Alcoon),
    %health(200),
    %damage(50),
    %width(8),
    %height($18),
    %bank(InitAI_Alcoon>>16),
    %hurtAITime(0),
    %cry($005F),
    %bossID(0),
    %initAI(InitAI_Alcoon),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Alcoon),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A8804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(4),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(Common_NormalEnemyShotAI),
    %spritemap(0),
    %tileData(Tiles_Alcoon),
    %layer(5),
    %drops(EnemyDropChances_Alcoon),
    %vulnerabilities(EnemyVulnerabilities_Alcoon),
    %name(EnemyName_Alcoon))

EnemyHeaders_Atomic:
    %EnemyHeader(\
    %tileDataSize($0400),
    %palette(Palette_Atomic),
    %health(250),
    %damage(40),
    %width(8),
    %height(8),
    %bank(InitAI_Atomic>>16),
    %hurtAITime(0),
    %cry($003E),
    %bossID(0),
    %initAI(InitAI_Atomic),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Atomic),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A8804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(2),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(Common_NormalEnemyShotAI),
    %spritemap(0),
    %tileData(Tiles_Atomic),
    %layer(5),
    %drops(EnemyDropChances_Atomic),
    %vulnerabilities(EnemyVulnerabilities_Default),
    %name(EnemyName_Atomic))

EnemyHeaders_Spark:
    %EnemyHeader(\
    %tileDataSize($0200),
    %palette(Palette_Spark),
    %health(80),
    %damage(30),
    %width(8),
    %height(8),
    %bank(InitAI_Spark>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_Spark),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Spark),
    %grappleAI(Common_GrappleAI_HurtSamus),
    %hurtAI(RTL_A8804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(EnemyShot_Spark),
    %spritemap(0),
    %tileData(Tiles_Spark),
    %layer(5),
    %drops(EnemyDropChances_Spark),
    %vulnerabilities(EnemyVulnerabilities_Indestructible),
    %name(EnemyName_Spark))

EnemyHeaders_FaceBlock:
    %EnemyHeader(\
    %tileDataSize($0200),
    %palette(Palette_FaceBlock),
    %health(20),
    %damage(0),
    %width(8),
    %height(8),
    %bank(InitAI_FaceBlock>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_FaceBlock),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_FaceBlock),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A8804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(RTL_A8804C),
    %enemyShot(EnemyShot_FaceBlock),
    %spritemap(0),
    %tileData(Tiles_FaceBlock),
    %layer(2),
    %drops(EnemyDropChances_FaceBlock),
    %vulnerabilities(EnemyVulnerabilities_Indestructible),
    %name(EnemyName_FaceBlock))

EnemyHeaders_KihunterGreen:
    %EnemyHeader(\
    %tileDataSize($1000),
    %palette(Palette_KihunterGreen),
    %health(60),
    %damage(20),
    %width(8),
    %height($12),
    %bank(InitAI_Kihunter>>16),
    %hurtAITime(0),
    %cry($0066),
    %bossID(0),
    %initAI(InitAI_Kihunter),
    %parts(2),
    %unused(0),
    %mainAI(MainAI_Kihunter),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A8804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(4),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(EnemyShot_Kihunter),
    %spritemap(0),
    %tileData(Tiles_Kihunter),
    %layer(5),
    %drops(EnemyDropChances_KihunterGreen_KihunterGreenWings),
    %vulnerabilities(EnemyVulnerabilities_KihunterGreen_KihunterGreenWings),
    %name(EnemyName_KihunterGreen))

EnemyHeaders_KihunterGreenWings:
    %EnemyHeader(\
    %tileDataSize($0200),
    %palette(Palette_KihunterGreen),
    %health(60),
    %damage(20),
    %width(10),
    %height(10),
    %bank(InitAI_KihunterWings>>16),
    %hurtAITime(0),
    %cry($0066),
    %bossID(0),
    %initAI(InitAI_KihunterWings),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_KihunterWings),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A8804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(4),
    %powerBombReaction(RTL_A0804C),
    %variantIndex(0),
    %enemyTouch(RTL_A8804C),
    %enemyShot(RTL_A8804C),
    %spritemap(0),
    %tileData(Tiles_Kihunter),
    %layer(5),
    %drops(EnemyDropChances_KihunterGreen_KihunterGreenWings),
    %vulnerabilities(EnemyVulnerabilities_KihunterGreen_KihunterGreenWings),
    %name(0))

EnemyHeaders_KihunterYellow:
    %EnemyHeader(\
    %tileDataSize($1000),
    %palette(Palette_KihunterYellow),
    %health(360),
    %damage(60),
    %width(8),
    %height($12),
    %bank(InitAI_Kihunter>>16),
    %hurtAITime(0),
    %cry($0066),
    %bossID(0),
    %initAI(InitAI_Kihunter),
    %parts(2),
    %unused(0),
    %mainAI(MainAI_Kihunter),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A8804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(4),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(EnemyShot_Kihunter),
    %spritemap(0),
    %tileData(Tiles_Kihunter),
    %layer(5),
    %drops(EnemyDropChances_KihunterYellow_KihunterYellowWings),
    %vulnerabilities(EnemyVulnerabilities_KihunterYellow_KihunterYellowWings),
    %name(EnemyName_KihunterYellow))

EnemyHeaders_KihunterYellowWings:
    %EnemyHeader(\
    %tileDataSize($0200),
    %palette(Palette_KihunterYellow),
    %health(360),
    %damage(60),
    %width(10),
    %height(10),
    %bank(InitAI_KihunterWings>>16),
    %hurtAITime(0),
    %cry($0066),
    %bossID(0),
    %initAI(InitAI_KihunterWings),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_KihunterWings),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A8804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(4),
    %powerBombReaction(RTL_A0804C),
    %variantIndex(0),
    %enemyTouch(RTL_A8804C),
    %enemyShot(RTL_A8804C),
    %spritemap(0),
    %tileData(Tiles_Kihunter),
    %layer(5),
    %drops(EnemyDropChances_KihunterYellow_KihunterYellowWings),
    %vulnerabilities(EnemyVulnerabilities_KihunterYellow_KihunterYellowWings),
    %name(0))

EnemyHeaders_KihunterRed:
    %EnemyHeader(\
    %tileDataSize($1000),
    %palette(Palette_KihunterRed),
    %health(1800),
    %damage(200),
    %width(8),
    %height($12),
    %bank(InitAI_Kihunter>>16),
    %hurtAITime(0),
    %cry($0066),
    %bossID(0),
    %initAI(InitAI_Kihunter),
    %parts(2),
    %unused(0),
    %mainAI(MainAI_Kihunter),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A8804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(4),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(EnemyShot_Kihunter),
    %spritemap(0),
    %tileData(Tiles_Kihunter),
    %layer(5),
    %drops(EnemyDropChances_KihunterRed_KihunterRedWings),
    %vulnerabilities(EnemyVulnerabilities_KihunterRed_KihunterRedWings),
    %name(EnemyName_KihunterRed))

EnemyHeaders_KihunterRedWings:
    %EnemyHeader(\
    %tileDataSize($0200),
    %palette(Palette_KihunterRed),
    %health(1800),
    %damage(200),
    %width(10),
    %height(10),
    %bank(InitAI_KihunterWings>>16),
    %hurtAITime(0),
    %cry($0066),
    %bossID(0),
    %initAI(InitAI_KihunterWings),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_KihunterWings),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A8804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(4),
    %powerBombReaction(RTL_A0804C),
    %variantIndex(0),
    %enemyTouch(RTL_A8804C),
    %enemyShot(RTL_A8804C),
    %spritemap(0),
    %tileData(Tiles_Kihunter),
    %layer(5),
    %drops(EnemyDropChances_KihunterRed_KihunterRedWings),
    %vulnerabilities(EnemyVulnerabilities_KihunterRed_KihunterRedWings),
    %name(0))

EnemyHeaders_MotherBrainHead:
    %EnemyHeader(\
    %tileDataSize($1000),
    %palette(Palette_MotherBrain),
    %health(18000),
    %damage(120),
    %width($10),
    %height($10),
    %bank(InitAI_MotherBrainHead>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID($A),
    %initAI(InitAI_MotherBrainHead),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_HurtAI_MotherBrainHead),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(MainAI_HurtAI_MotherBrainHead),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(PowerBombReaction_MotherBrain),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_MotherBrainHead),
    %enemyShot(EnemyShot_MotherBrainHead),
    %spritemap(0),
    %tileData(Tiles_MotherBrainHead),
    %layer(5),
    %drops(EnemyDropChances_MotherBrainHead),
    %vulnerabilities(EnemyVulnerabilities_MotherBrainHead),
    %name(0))

EnemyHeaders_MotherBrainBody:
    %EnemyHeader(\
    %tileDataSize($8600),
    %palette(Palette_MotherBrain),
    %health(18000),
    %damage(120),
    %width(8),
    %height(8),
    %bank(InitAI_MotherBrainBody>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_MotherBrainBody),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_HurtAI_MotherBrainBody),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(MainAI_HurtAI_MotherBrainBody),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(PowerBombReaction_MotherBrain),
    %variantIndex(0),
    %enemyTouch(RTL_A9B5C5),
    %enemyShot(EnemyShot_MotherBrainBody),
    %spritemap(0),
    %tileData(Tiles_MotherBrainBody),
    %layer(5),
    %drops(EnemyDropChances_MotherBrainBody_BombTorizo),
    %vulnerabilities(EnemyVulnerabilities_MotherBrainBody),
    %name(0))

EnemyHeaders_BabyMetroidCutscene:
    %EnemyHeader(\
    %tileDataSize(0),
    %palette(Palette_BabyMetroid),
    %health(3200),
    %damage(40),
    %width($24),
    %height($24),
    %bank(InitAI_BabyMetroidCutscene>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_BabyMetroidCutscene),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_BabyMetroidCutscene),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A9804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_BabyMetroidCutscene),
    %enemyShot(RTL_A9804C),
    %spritemap(0),
    %tileData(Tiles_BabyMetroid),
    %layer(2),
    %drops(EnemyDropChances_Shutter_Kamer_BabyMetroidCutscene),
    %vulnerabilities(EnemyVulnerabilities_Default),
    %name(0))

EnemyHeaders_MotherBrainTubes:
    %EnemyHeader(\
    %tileDataSize(0),
    %palette(Palette_MotherBrain),
    %health(1000),
    %damage(0),
    %width(0),
    %height(0),
    %bank(InitAI_MotherBrainTubes>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_MotherBrainTubes),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_MotherBrainTubes),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A9804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(RTL_A9804C),
    %enemyShot(RTL_A9804C),
    %spritemap(0),
    %tileData(Tiles_MotherBrainHead),
    %layer(5),
    %drops(0),
    %vulnerabilities(EnemyVulnerabilities_Default),
    %name(0))

EnemyHeaders_CorpseTorizo:
    %EnemyHeader(\
    %tileDataSize($1800),
    %palette(Palette_CorpseTorizo),
    %health(1000),
    %damage(0),
    %width($10),
    %height($28),
    %bank(InitAI_CorpseTorizo>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_CorpseTorizo),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_CorpseTorizo),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A9804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(PowerBombReaction_CorpseTorizo),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_EnemyShot_CorpseTorizo),
    %enemyShot(EnemyTouch_EnemyShot_CorpseTorizo),
    %spritemap(0),
    %tileData(Tiles_CorpseTorizo),
    %layer(5),
    %drops(EnemyDropChances_Shutter_Kamer_BabyMetroidCutscene),
    %vulnerabilities(EnemyVulnerabilities_Corpse_BabyMetroid),
    %name(0))

EnemyHeaders_CorpseSidehopper:
    %EnemyHeader(\
    %tileDataSize($0E00),
    %palette(Palette_CorpseCommon),
    %health(320),
    %damage(80),
    %width($16),
    %height(12),
    %bank(InitAI_CorpseSidehopper>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_CorpseSidehopper),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_HurtAI_CorpseEnemies),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(MainAI_HurtAI_CorpseEnemies),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(PowerBombReaction_CorpseSidehopper),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_CorpseSidehopper),
    %enemyShot(EnemyShot_CorpseSidehopper),
    %spritemap(0),
    %tileData(Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree),
    %layer(5),
    %drops(0),
    %vulnerabilities(EnemyVulnerabilities_Corpse_BabyMetroid),
    %name(0))

EnemyHeaders_CorpseSidehopper2:
    %EnemyHeader(\
    %tileDataSize($0600),
    %palette(Palette_CorpseSidehopper2),
    %health(320),
    %damage(80),
    %width($16),
    %height(12),
    %bank(InitAI_CorpseSidehopper>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_CorpseSidehopper),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_HurtAI_CorpseEnemies),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A9804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(EnemyShot_CorpseSidehopper),
    %variantIndex(0),
    %enemyTouch(EnemyShot_CorpseSidehopper),
    %enemyShot(EnemyShot_CorpseSidehopper),
    %spritemap(0),
    %tileData(Tiles_SidehopperLarge),
    %layer(5),
    %drops(0),
    %vulnerabilities(EnemyVulnerabilities_Corpse_BabyMetroid),
    %name(0))

EnemyHeaders_CorpseZoomer:
    %EnemyHeader(\
    %tileDataSize(0),
    %palette(Palette_CorpseCommon),
    %health(1000),
    %damage(0),
    %width(10),
    %height(8),
    %bank(InitAI_CorpseZoomer>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_CorpseZoomer),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_HurtAI_CorpseEnemies),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A9804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(PowerBombReaction_CorpseZoomer),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_EnemyShot_CorpseZoomer),
    %enemyShot(EnemyTouch_EnemyShot_CorpseZoomer),
    %spritemap(0),
    %tileData(Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree),
    %layer(5),
    %drops(0),
    %vulnerabilities(EnemyVulnerabilities_Corpse_BabyMetroid),
    %name(0))

EnemyHeaders_CorpseRipper:
    %EnemyHeader(\
    %tileDataSize(0),
    %palette(Palette_CorpseCommon),
    %health(1000),
    %damage(0),
    %width(11),
    %height(6),
    %bank(InitAI_CorpseRipper>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_CorpseRipper),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_HurtAI_CorpseEnemies),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A9804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(PowerBombReaction_CorpseRipper),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_EnemyShot_CorpseRipper),
    %enemyShot(EnemyTouch_EnemyShot_CorpseRipper),
    %spritemap(0),
    %tileData(Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree),
    %layer(5),
    %drops(0),
    %vulnerabilities(EnemyVulnerabilities_Corpse_BabyMetroid),
    %name(0))

EnemyHeaders_CorpseSkree:
    %EnemyHeader(\
    %tileDataSize(0),
    %palette(Palette_CorpseCommon),
    %health(1000),
    %damage(0),
    %width(12),
    %height($10),
    %bank(InitAI_CorpseSkree>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_CorpseSkree),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_HurtAI_CorpseEnemies),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A9804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(PowerBombReaction_CorpseSkree),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_EnemyShot_CorpseSkree),
    %enemyShot(EnemyTouch_EnemyShot_CorpseSkree),
    %spritemap(0),
    %tileData(Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree),
    %layer(5),
    %drops(0),
    %vulnerabilities(EnemyVulnerabilities_Corpse_BabyMetroid),
    %name(0))

EnemyHeaders_BabyMetroid:
    %EnemyHeader(\
    %tileDataSize($0C00),
    %palette(Palette_BabyMetroid),
    %health(3200),
    %damage(40),
    %width($28),
    %height($28),
    %bank(InitAI_BabyMetroid>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_BabyMetroid),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_BabyMetroid),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_A9804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(PowerBombReaction_BabyMetroid),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_BabyMetroid),
    %enemyShot(EnemyShot_BabyMetroid),
    %spritemap(0),
    %tileData(Tiles_BabyMetroid),
    %layer(2),
    %drops(0),
    %vulnerabilities(EnemyVulnerabilities_Corpse_BabyMetroid),
    %name(0))

EnemyHeaders_BombTorizo:
    %EnemyHeader(\
    %tileDataSize($2000),
    %palette(Palette_Torizo_OrbProjectile),
    %health(800),
    %damage(8),
    %width($12),
    %height($30),
    %bank(InitAI_Torizo>>16),
    %hurtAITime(8),
    %cry($0027),
    %bossID(2),
    %initAI(InitAI_Torizo),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_BombTorizo),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(HurtAI_BombTorizo),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_Torizo),
    %enemyShot(EnemyShot_Torizo_Normal),
    %spritemap(0),
    %tileData(Tiles_BombTorizo_GoldenTorizo),
    %layer(5),
    %drops(EnemyDropChances_MotherBrainBody_BombTorizo),
    %vulnerabilities(EnemyVulnerabilities_BombTorizo_BombTorizoOrb),
    %name(0))

EnemyHeaders_BombTorizoOrb:
    %EnemyHeader(\
    %tileDataSize($2000),
    %palette(Palette_Torizo_OrbProjectile),
    %health(800),
    %damage(8),
    %width($12),
    %height($30),
    %bank(InitAI_Torizo>>16),
    %hurtAITime(8),
    %cry($0027),
    %bossID(2),
    %initAI(InitAI_Torizo),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_BombTorizo),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(HurtAI_BombTorizo),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_Torizo),
    %enemyShot(EnemyShot_Torizo_Normal),
    %spritemap(0),
    %tileData(Tiles_BombTorizo_GoldenTorizo),
    %layer(5),
    %drops(EnemyDropChances_BombTorizoOrb),
    %vulnerabilities(EnemyVulnerabilities_BombTorizo_BombTorizoOrb),
    %name(0))

EnemyHeaders_GoldenTorizo:
    %EnemyHeader(\
    %tileDataSize($2000),
    %palette(Palette_Torizo_OrbProjectile),
    %health(13500),
    %damage(160),
    %width($12),
    %height($30),
    %bank(InitAI_Torizo>>16),
    %hurtAITime(8),
    %cry($0027),
    %bossID(2),
    %initAI(InitAI_Torizo),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_GoldenTorizo),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(HurtAI_GoldenTorizo),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_Torizo),
    %enemyShot(ShotReaction_GoldenTorizo_Normal),
    %spritemap(0),
    %tileData(Tiles_BombTorizo_GoldenTorizo),
    %layer(5),
    %drops(EnemyDropChances_GoldenTorizo),
    %vulnerabilities(EnemyVulnerabilities_GoldenTorizo_GoldenTorizoOrb),
    %name(0))

EnemyHeaders_GoldenTorizoOrb:
    %EnemyHeader(\
    %tileDataSize($2000),
    %palette(Palette_Torizo_OrbProjectile),
    %health(13500),
    %damage(160),
    %width($12),
    %height($30),
    %bank(InitAI_Torizo>>16),
    %hurtAITime(8),
    %cry($0027),
    %bossID(2),
    %initAI(InitAI_Torizo),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_GoldenTorizo),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(HurtAI_GoldenTorizo),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_Torizo),
    %enemyShot(ShotReaction_GoldenTorizo_Normal),
    %spritemap(0),
    %tileData(Tiles_BombTorizo_GoldenTorizo),
    %layer(5),
    %drops(EnemyDropChances_GoldenTorizoOrb),
    %vulnerabilities(EnemyVulnerabilities_GoldenTorizo_GoldenTorizoOrb),
    %name(0))

EnemyHeaders_TourianStatue:
    %EnemyHeader(\
    %tileDataSize($1600),
    %palette(Palettes_TourianStatue_Ridley),
    %health(3000),
    %damage(3000),
    %width(0),
    %height(0),
    %bank(InitAI_TourianStatue>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_TourianStatue),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_TourianStatue),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_AA804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(RTL_A0804C),
    %variantIndex(0),
    %enemyTouch(RTL_AA804C),
    %enemyShot(RTL_AA804C),
    %spritemap(0),
    %tileData(Tiles_TourianStatue),
    %layer(6),
    %drops(0),
    %vulnerabilities(EnemyVulnerabilities_Default),
    %name(0))

EnemyHeaders_TourianStatueGhost:
    %EnemyHeader(\
    %tileDataSize($8600),
    %palette(Palettes_TourianStatue_Ridley),
    %health(3000),
    %damage(3000),
    %width(0),
    %height(0),
    %bank(RTL_AA804C>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(RTL_AA804C),
    %parts(1),
    %unused(0),
    %mainAI(RTL_AA804C),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_AA804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(RTL_A0804C),
    %variantIndex(0),
    %enemyTouch(RTL_AA804C),
    %enemyShot(RTL_AA804C),
    %spritemap(0),
    %tileData(Tiles_TourianStatuesSoul),
    %layer(6),
    %drops(0),
    %vulnerabilities(EnemyVulnerabilities_Default),
    %name(0))

EnemyHeaders_Shaktool:
    %EnemyHeader(\
    %tileDataSize($0400),
    %palette(Palette_Shaktool),
    %health(300),
    %damage(120),
    %width(6),
    %height(6),
    %bank(InitAI_Shaktool>>16),
    %hurtAITime(8),
    %cry($0069),
    %bossID(0),
    %initAI(InitAI_Shaktool),
    %parts(7),
    %unused(0),
    %mainAI(MainAI_HurtAI_Shaktool),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(MainAI_HurtAI_Shaktool),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(4),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_Shaktool),
    %enemyShot(EnemyShot_Shaktool),
    %spritemap(0),
    %tileData(Tiles_Shaktool),
    %layer(5),
    %drops(EnemyDropChances_Shaktool),
    %vulnerabilities(EnemyVulnerabilities_Shaktool),
    %name(EnemyName_GoldenTorizo))

EnemyHeaders_NoobTubeCrack:
    %EnemyHeader(\
    %tileDataSize($1800),
    %palette(Palette_NoobTubeCrack_Initial),
    %health(20),
    %damage(40),
    %width(0),
    %height(0),
    %bank(InitAI_NoobTubeCrack>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_NoobTubeCrack),
    %parts(1),
    %unused(0),
    %mainAI(RTL_AA804C),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_AA804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(RTL_AA804C),
    %enemyShot(RTL_AA804C),
    %spritemap(0),
    %tileData(Tiles_NoobTubeCrack),
    %layer(5),
    %drops(EnemyDropChances_NoobTubeCrack_Chozo),
    %vulnerabilities(EnemyVulnerabilities_Default),
    %name(0))

EnemyHeaders_Chozo:
    %EnemyHeader(\
    %tileDataSize($1200),
    %palette(Palette_Chozo_WreckedShip_SpritePalette1),
    %health(20),
    %damage(40),
    %width($10),
    %height($24),
    %bank(InitAI_Chozo>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_Chozo),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Chozo),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_AA804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(RTL_AAE7DB),
    %enemyShot(RTL_AAE7DC),
    %spritemap(0),
    %tileData(Tiles_Chozo),
    %layer(5),
    %drops(EnemyDropChances_NoobTubeCrack_Chozo),
    %vulnerabilities(EnemyVulnerabilities_Indestructible),
    %name(0))

if !FEATURE_KEEP_UNREFERENCED
UNUSED_BunchOf2s_A0F13F:
; Unused. Random bunch of 2s
; Impossible to speculate on; the only other long list of 2s in the game is scroll data
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
    db $02,$02,$02,$02
endif ; !FEATURE_KEEP_UNREFERENCED

; Weirdo discontinuity, enemy banks jump from $A2..AA to $B2..B3
UNUSED_EnemyHeaders_SpinningTurtleEye_A0F153:
    %EnemyHeader(\
    %tileDataSize($0200),
    %palette(UNUSED_Palette_SpinningTurtleEye_B38687),
    %health(20),
    %damage(40),
    %width(8),
    %height(8),
    %bank(UNUSED_InitAI_SpinningTurtleEye_B386FB>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(UNUSED_InitAI_SpinningTurtleEye_B386FB),
    %parts(1),
    %unused(0),
    %mainAI(UNUSED_MainAI_SpinningTurtleEye_B3870E),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_B3804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(Common_NormalEnemyShotAI),
    %spritemap(0),
    %tileData(UNUSED_Tiles_SpinningTurtleEye_B7FB00),
    %layer(5),
    %drops(0),
    %vulnerabilities(0),
    %name(0))

EnemyHeaders_Zeb:
    %EnemyHeader(\
    %tileDataSize($0400),
    %palette(Palette_Zeb),
    %health(9),
    %damage(6),
    %width(8),
    %height(8),
    %bank(InitAI_Zeb_Zebbo>>16),
    %hurtAITime(0),
    %cry($0022),
    %bossID(0),
    %initAI(InitAI_Zeb_Zebbo),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Zeb_Zebbo),
    %grappleAI(Common_GrappleAI_KillEnemy),
    %hurtAI(RTL_B3804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(Common_NormalEnemyShotAI),
    %spritemap(0),
    %tileData(Tiles_Zeb),
    %layer(5),
    %drops(EnemyDropChances_Zeb),
    %vulnerabilities(EnemyVulnerabilities_Default),
    %name(EnemyName_Zeb))

EnemyHeaders_Zebbo:
    %EnemyHeader(\
    %tileDataSize($0400),
    %palette(Palette_Zebbo),
    %health(30),
    %damage(20),
    %width(8),
    %height(8),
    %bank(InitAI_Zeb_Zebbo>>16),
    %hurtAITime(0),
    %cry($0022),
    %bossID(0),
    %initAI(InitAI_Zeb_Zebbo),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Zeb_Zebbo),
    %grappleAI(Common_GrappleAI_KillEnemy),
    %hurtAI(RTL_B3804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(Common_NormalEnemyShotAI),
    %spritemap(0),
    %tileData(Tiles_Zebbo),
    %layer(5),
    %drops(EnemyDropChances_Zebbo),
    %vulnerabilities(EnemyVulnerabilities_Default),
    %name(EnemyName_Zebbo))

EnemyHeaders_Gamet:
    %EnemyHeader(\
    %tileDataSize($0400),
    %palette(Palette_Gamet),
    %health(20),
    %damage(16),
    %width(8),
    %height(8),
    %bank(InitAI_Gamet>>16),
    %hurtAITime(0),
    %cry($0022),
    %bossID(0),
    %initAI(InitAI_Gamet),
    %parts(5),
    %unused(0),
    %mainAI(MainAI_Gamet),
    %grappleAI(Common_GrappleAI_KillEnemy),
    %hurtAI(RTL_B3804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(Common_NormalEnemyShotAI),
    %spritemap(0),
    %tileData(Tiles_Gamet),
    %layer(5),
    %drops(EnemyDropChances_Gamet),
    %vulnerabilities(EnemyVulnerabilities_Default),
    %name(EnemyName_Gamet))

EnemyHeaders_Geega:
    %EnemyHeader(\
    %tileDataSize($0400),
    %palette(Palette_Geega),
    %health(10),
    %damage(10),
    %width(8),
    %height(8),
    %bank(InitAI_Geega>>16),
    %hurtAITime(0),
    %cry($0022),
    %bossID(0),
    %initAI(InitAI_Geega),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Geega),
    %grappleAI(Common_GrappleAI_KillEnemy),
    %hurtAI(RTL_B3804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(Common_NormalEnemyTouchAI),
    %enemyShot(Common_NormalEnemyShotAI),
    %spritemap(0),
    %tileData(Tiles_Geega),
    %layer(5),
    %drops(EnemyDropChances_Geega),
    %vulnerabilities(EnemyVulnerabilities_Default),
    %name(EnemyName_Geega))

EnemyHeaders_Botwoon:
    %EnemyHeader(\
    %tileDataSize($1800),
    %palette(Palette_Botwoon),
    %health(3000),
    %damage(120),
    %width(8),
    %height(8),
    %bank(InitAI_Botwoon>>16),
    %hurtAITime(0),
    %cry($005F),
    %bossID(9),
    %initAI(InitAI_Botwoon),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_Botwoon),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_B3804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(PowerBombReaction_Botwoon),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_Botwoon),
    %enemyShot(EnemyShot_Botwoon),
    %spritemap(0),
    %tileData(Tiles_Botwoon),
    %layer(5),
    %drops(EnemyDropChances_Botwoon),
    %vulnerabilities(EnemyVulnerabilities_Botwoon),
    %name(EnemyName_Botwoon))

EnemyHeaders_EtecoonEscape:
    %EnemyHeader(\
    %tileDataSize($0600),
    %palette(Palette_EtecoonEscape),
    %health(3000),
    %damage(3000),
    %width(6),
    %height(8),
    %bank(InitAI_EtecoonEscape>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_EtecoonEscape),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_EtecoonEscape),
    %grappleAI(Common_GrappleAI_NoInteraction),
    %hurtAI(RTL_B3804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(RTL_A0804C),
    %variantIndex(0),
    %enemyTouch(RTL_B3804C),
    %enemyShot(RTL_B3804C),
    %spritemap(0),
    %tileData(Tiles_Etecoon),
    %layer(5),
    %drops(EnemyDropChances_Etecoon_EtecoonEscape),
    %vulnerabilities(0),
    %name(0))

EnemyHeaders_DachoraEscape:
    %EnemyHeader(\
    %tileDataSize($0C00),
    %palette(Palette_DachoraEscape),
    %health(3000),
    %damage(3000),
    %width(8),
    %height($18),
    %bank(InitAI_DachoraEscape>>16),
    %hurtAITime(0),
    %cry(0),
    %bossID(0),
    %initAI(InitAI_DachoraEscape),
    %parts(1),
    %unused(0),
    %mainAI(RTL_B3EB1A),
    %grappleAI(Common_GrappleAI_NoInteraction),
    %hurtAI(RTL_B3804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(0),
    %powerBombReaction(RTL_A0804C),
    %variantIndex(0),
    %enemyTouch(RTL_B3804C),
    %enemyShot(RTL_B3804C),
    %spritemap(0),
    %tileData(Tiles_Dachora),
    %layer(5),
    %drops(EnemyDropChances_Steam_Dachora_DachoraEscape),
    %vulnerabilities(0),
    %name(0))

EnemyHeaders_PirateGreyWall:
    %EnemyHeader(\
    %tileDataSize($0C00),
    %palette(Palette_Pirate_Grey),
    %health(20),
    %damage(15),
    %width($10),
    %height($18),
    %bank(InitAI_PirateWall>>16),
    %hurtAITime(0),
    %cry($0021),
    %bossID(0),
    %initAI(InitAI_PirateWall),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_PirateWall),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_B2804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(4),
    %powerBombReaction(PowerBombReaction_Ninja_Walking_GreyWall),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_SpacePirate),
    %enemyShot(EnemyShot_SpacePirate_Normal),
    %spritemap(0),
    %tileData(Tiles_SpacePirate),
    %layer(5),
    %drops(EnemyDropChances_PirateGreyWall),
    %vulnerabilities(EnemyVulnerabilities_PirateGreyWall),
    %name(EnemyName_PirateGreyWall))

EnemyHeaders_PirateGreenWall:
    %EnemyHeader(\
    %tileDataSize($0C00),
    %palette(Palette_Pirate_Green),
    %health(90),
    %damage(20),
    %width($10),
    %height($18),
    %bank(InitAI_PirateWall>>16),
    %hurtAITime(0),
    %cry($0021),
    %bossID(0),
    %initAI(InitAI_PirateWall),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_PirateWall),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_B2804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(4),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_SpacePirate),
    %enemyShot(EnemyShot_SpacePirate_Normal),
    %spritemap(0),
    %tileData(Tiles_SpacePirate),
    %layer(5),
    %drops(EnemyDropChances_PirateGreenWall),
    %vulnerabilities(EnemyVulnerabilities_PirateGreyWall),
    %name(EnemyName_PirateGreenWall))

EnemyHeaders_PirateRedWall:
    %EnemyHeader(\
    %tileDataSize($0C00),
    %palette(Palette_Pirate_Red),
    %health(200),
    %damage(80),
    %width($10),
    %height($18),
    %bank(InitAI_PirateWall>>16),
    %hurtAITime(0),
    %cry($0021),
    %bossID(0),
    %initAI(InitAI_PirateWall),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_PirateWall),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_B2804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(4),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_SpacePirate),
    %enemyShot(EnemyShot_SpacePirate_Normal),
    %spritemap(0),
    %tileData(Tiles_SpacePirate),
    %layer(5),
    %drops(EnemyDropChances_PirateRedWall),
    %vulnerabilities(EnemyVulnerabilities_PirateRedWall),
    %name(EnemyName_PirateRedWall))

EnemyHeaders_PirateGoldWall:
    %EnemyHeader(\
    %tileDataSize($0C00),
    %palette(Palette_Pirate_Gold_NonNinja),
    %health(900),
    %damage(200),
    %width($10),
    %height($18),
    %bank(InitAI_PirateWall>>16),
    %hurtAITime(0),
    %cry($0021),
    %bossID(0),
    %initAI(InitAI_PirateWall),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_PirateWall),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_B2804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(4),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_SpacePirate),
    %enemyShot(EnemyShot_SpacePirate_Normal),
    %spritemap(0),
    %tileData(Tiles_SpacePirate),
    %layer(5),
    %drops(EnemyDropChances_PirateGoldWall),
    %vulnerabilities(EnemyVulnerabilities_PirateGoldWall_PirateGoldWalking),
    %name(EnemyName_PirateGoldWall))

EnemyHeaders_PirateMagentaWall:
    %EnemyHeader(\
    %tileDataSize($0C00),
    %palette(Palette_Pirate_Magenta),
    %health(300),
    %damage(160),
    %width($10),
    %height($18),
    %bank(InitAI_PirateWall>>16),
    %hurtAITime(0),
    %cry($0021),
    %bossID(0),
    %initAI(InitAI_PirateWall),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_PirateWall),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_B2804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(4),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_SpacePirate),
    %enemyShot(EnemyShot_SpacePirate_Normal),
    %spritemap(0),
    %tileData(Tiles_SpacePirate),
    %layer(5),
    %drops(EnemyDropChances_PirateMagentaWall),
    %vulnerabilities(EnemyVulnerabilities_PirateMagentaWall),
    %name(EnemyName_PirateMagentaWall))

EnemyHeaders_PirateSilverWall:
    %EnemyHeader(\
    %tileDataSize($0C00),
    %palette(Palette_Pirate_Silver_GoldNinja),
    %health(500),
    %damage(15),
    %width($10),
    %height($18),
    %bank(InitAI_PirateWall>>16),
    %hurtAITime(0),
    %cry($0021),
    %bossID(0),
    %initAI(InitAI_PirateWall),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_PirateWall),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_B2804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(4),
    %powerBombReaction(0),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_SpacePirate),
    %enemyShot(EnemyShot_SpacePirate_Normal),
    %spritemap(0),
    %tileData(Tiles_SpacePirate),
    %layer(5),
    %drops(EnemyDropChances_PirateSilverWall),
    %vulnerabilities(EnemyVulnerabilities_PirateSilverWall_PirateSilverWalking),
    %name(EnemyName_PirateSilverWall))

EnemyHeaders_PirateGreyNinja:
    %EnemyHeader(\
    %tileDataSize($1800),
    %palette(Palette_Pirate_Grey),
    %health(20),
    %damage(15),
    %width($10),
    %height($20),
    %bank(InitAI_PirateNinja>>16),
    %hurtAITime(0),
    %cry($0021),
    %bossID(0),
    %initAI(InitAI_PirateNinja),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_PirateNinja),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_B2804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(4),
    %powerBombReaction(PowerBombReaction_Ninja_Walking_GreyWall),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_SpacePirate),
    %enemyShot(EnemyShot_SpacePirate_Normal),
    %spritemap(0),
    %tileData(Tiles_SpacePirate),
    %layer(5),
    %drops(EnemyDropChances_PirateGreyNinja),
    %vulnerabilities(EnemyVulnerabilities_PirateNinja_Grey_Green_Red_Magenta),
    %name(EnemyName_PirateGreyNinja))

EnemyHeaders_PirateGreenNinja:
    %EnemyHeader(\
    %tileDataSize($1800),
    %palette(Palette_Pirate_Green),
    %health(90),
    %damage(20),
    %width($10),
    %height($20),
    %bank(InitAI_PirateNinja>>16),
    %hurtAITime(0),
    %cry($0021),
    %bossID(0),
    %initAI(InitAI_PirateNinja),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_PirateNinja),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_B2804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(4),
    %powerBombReaction(PowerBombReaction_Ninja_Walking_GreyWall),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_SpacePirate),
    %enemyShot(EnemyShot_SpacePirate_Normal),
    %spritemap(0),
    %tileData(Tiles_SpacePirate),
    %layer(5),
    %drops(EnemyDropChances_PirateGreenNinja),
    %vulnerabilities(EnemyVulnerabilities_PirateNinja_Grey_Green_Red_Magenta),
    %name(EnemyName_PirateGreenNinja))

EnemyHeaders_PirateRedNinja:
    %EnemyHeader(\
    %tileDataSize($1800),
    %palette(Palette_Pirate_Red),
    %health(200),
    %damage(80),
    %width($10),
    %height($20),
    %bank(InitAI_PirateNinja>>16),
    %hurtAITime(0),
    %cry($0021),
    %bossID(0),
    %initAI(InitAI_PirateNinja),
    %parts(1),
    %unused(1),
    %mainAI(MainAI_PirateNinja),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_B2804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(4),
    %powerBombReaction(PowerBombReaction_Ninja_Walking_GreyWall),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_SpacePirate),
    %enemyShot(EnemyShot_SpacePirate_Normal),
    %spritemap(0),
    %tileData(Tiles_SpacePirate),
    %layer(5),
    %drops(EnemyDropChances_PirateRedNinja),
    %vulnerabilities(EnemyVulnerabilities_PirateNinja_Grey_Green_Red_Magenta),
    %name(EnemyName_PirateRedNinja))

EnemyHeaders_PirateGoldNinja:
    %EnemyHeader(\
    %tileDataSize($1800),
    %palette(Palette_Pirate_Silver_GoldNinja),
    %health(1800),
    %damage(100),
    %width($10),
    %height($20),
    %bank(InitAI_PirateNinja>>16),
    %hurtAITime(0),
    %cry($0021),
    %bossID(0),
    %initAI(InitAI_PirateNinja),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_PirateNinja),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_B2804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(4),
    %powerBombReaction(PowerBombReaction_Ninja_Walking_GreyWall),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_SpacePirate),
    %enemyShot(EnemyShot_SpacePirate_Normal),
    %spritemap(0),
    %tileData(Tiles_SpacePirate),
    %layer(5),
    %drops(EnemyDropChances_PirateGoldNinja),
    %vulnerabilities(EnemyVulnerabilities_PirateGoldNinja),
    %name(EnemyName_PirateGoldNinja))

EnemyHeaders_PirateMagentaNinja:
    %EnemyHeader(\
    %tileDataSize($1800),
    %palette(Palette_Pirate_Magenta),
    %health(300),
    %damage(160),
    %width($10),
    %height($20),
    %bank(InitAI_PirateNinja>>16),
    %hurtAITime(0),
    %cry($0021),
    %bossID(0),
    %initAI(InitAI_PirateNinja),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_PirateNinja),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_B2804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(4),
    %powerBombReaction(PowerBombReaction_Ninja_Walking_GreyWall),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_SpacePirate),
    %enemyShot(EnemyShot_SpacePirate_Normal),
    %spritemap(0),
    %tileData(Tiles_SpacePirate),
    %layer(5),
    %drops(EnemyDropChances_PirateMagentaNinja),
    %vulnerabilities(EnemyVulnerabilities_PirateNinja_Grey_Green_Red_Magenta),
    %name(EnemyName_PirateMagentaNinja))

EnemyHeaders_PirateSilverNinja:
    %EnemyHeader(\
    %tileDataSize($1800),
    %palette(Palette_Pirate_Silver_GoldNinja),
    %health(500),
    %damage(15),
    %width($10),
    %height($20),
    %bank(InitAI_PirateNinja>>16),
    %hurtAITime(0),
    %cry($0021),
    %bossID(0),
    %initAI(InitAI_PirateNinja),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_PirateNinja),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_B2804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(4),
    %powerBombReaction(PowerBombReaction_Ninja_Walking_GreyWall),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_SpacePirate),
    %enemyShot(EnemyShot_SpacePirate_Normal),
    %spritemap(0),
    %tileData(Tiles_SpacePirate),
    %layer(5),
    %drops(EnemyDropChances_PirateSilverNinja),
    %vulnerabilities(EnemyVulnerabilities_PirateSilverNinja),
    %name(EnemyName_PirateSilverNinja))

EnemyHeaders_PirateGreyWalking:
    %EnemyHeader(\
    %tileDataSize($0C00),
    %palette(Palette_Pirate_Grey),
    %health(20),
    %damage(15),
    %width($10),
    %height($20),
    %bank(InitAI_PirateWalking>>16),
    %hurtAITime(0),
    %cry($0066),
    %bossID(0),
    %initAI(InitAI_PirateWalking),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_PirateWalking),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_B2804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(4),
    %powerBombReaction(PowerBombReaction_Ninja_Walking_GreyWall),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_SpacePirate),
    %enemyShot(EnemyShot_SpacePirate_Normal),
    %spritemap(0),
    %tileData(Tiles_SpacePirate),
    %layer(5),
    %drops(EnemyDropChances_PirateGreyWalking),
    %vulnerabilities(EnemyVulnerabilities_PirateGreyWalking),
    %name(EnemyName_PirateGreyWalking))

EnemyHeaders_PirateGreenWalking:
    %EnemyHeader(\
    %tileDataSize($0C00),
    %palette(Palette_Pirate_Green),
    %health(90),
    %damage(20),
    %width($10),
    %height($20),
    %bank(InitAI_PirateWalking>>16),
    %hurtAITime(0),
    %cry($0066),
    %bossID(0),
    %initAI(InitAI_PirateWalking),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_PirateWalking),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_B2804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(4),
    %powerBombReaction(PowerBombReaction_Ninja_Walking_GreyWall),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_SpacePirate),
    %enemyShot(EnemyShot_SpacePirate_Normal),
    %spritemap(0),
    %tileData(Tiles_SpacePirate),
    %layer(5),
    %drops(EnemyDropChances_PirateGreenWalking),
    %vulnerabilities(EnemyVulnerabilities_PirateGreenWalking),
    %name(EnemyName_PirateGreenWalking))

EnemyHeaders_PirateRedWalking:
    %EnemyHeader(\
    %tileDataSize($0C00),
    %palette(Palette_Pirate_Red),
    %health(200),
    %damage(80),
    %width($10),
    %height($20),
    %bank(InitAI_PirateWalking>>16),
    %hurtAITime(0),
    %cry($0066),
    %bossID(0),
    %initAI(InitAI_PirateWalking),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_PirateWalking),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_B2804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(4),
    %powerBombReaction(PowerBombReaction_Ninja_Walking_GreyWall),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_SpacePirate),
    %enemyShot(EnemyShot_SpacePirate_Normal),
    %spritemap(0),
    %tileData(Tiles_SpacePirate),
    %layer(5),
    %drops(EnemyDropChances_PirateRedWalking),
    %vulnerabilities(EnemyVulnerabilities_PirateRedWalking),
    %name(EnemyName_PirateRedWalking))

EnemyHeaders_PirateGoldWalking:
    %EnemyHeader(\
    %tileDataSize($0C00),
    %palette(Palette_Pirate_Gold_NonNinja),
    %health(900),
    %damage(200),
    %width($10),
    %height($20),
    %bank(InitAI_PirateWalking>>16),
    %hurtAITime(0),
    %cry($0066),
    %bossID(0),
    %initAI(InitAI_PirateWalking),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_PirateWalking),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_B2804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(4),
    %powerBombReaction(PowerBombReaction_Ninja_Walking_GreyWall),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_SpacePirate),
    %enemyShot(EnemyShot_SpacePirate_Normal),
    %spritemap(0),
    %tileData(Tiles_SpacePirate),
    %layer(5),
    %drops(EnemyDropChances_PirateGoldWalking),
    %vulnerabilities(EnemyVulnerabilities_PirateGoldWall_PirateGoldWalking),
    %name(EnemyName_PirateGoldWalking))

EnemyHeaders_PirateMagentaWalking:
    %EnemyHeader(\
    %tileDataSize($0C00),
    %palette(Palette_Pirate_Magenta),
    %health(300),
    %damage(160),
    %width($10),
    %height($20),
    %bank(InitAI_PirateWalking>>16),
    %hurtAITime(0),
    %cry($0066),
    %bossID(0),
    %initAI(InitAI_PirateWalking),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_PirateWalking),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_B2804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(4),
    %powerBombReaction(PowerBombReaction_Ninja_Walking_GreyWall),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_SpacePirate),
    %enemyShot(EnemyShot_SpacePirate_Normal),
    %spritemap(0),
    %tileData(Tiles_SpacePirate),
    %layer(5),
    %drops(EnemyDropChances_PirateMagentaWalking),
    %vulnerabilities(EnemyVulnerabilities_PirateMagentaWalking),
    %name(EnemyName_PirateMagentaWalking))

EnemyHeaders_PirateSilverWalking:
    %EnemyHeader(\
    %tileDataSize($0C00),
    %palette(Palette_Pirate_Silver_GoldNinja),
    %health(500),
    %damage(15),
    %width($10),
    %height($20),
    %bank(InitAI_PirateWalking>>16),
    %hurtAITime(0),
    %cry($0066),
    %bossID(0),
    %initAI(InitAI_PirateWalking),
    %parts(1),
    %unused(0),
    %mainAI(MainAI_PirateWalking),
    %grappleAI(Common_GrappleAI_CancelGrappleBeam),
    %hurtAI(RTL_B2804C),
    %frozenAI(Common_NormalEnemyFrozenAI),
    %timeIsFrozen(0),
    %deathAnimation(4),
    %powerBombReaction(PowerBombReaction_Ninja_Walking_GreyWall),
    %variantIndex(0),
    %enemyTouch(EnemyTouch_SpacePirate),
    %enemyShot(EnemyShot_SpacePirate_Normal),
    %spritemap(0),
    %tileData(Tiles_SpacePirate),
    %layer(5),
    %drops(EnemyDropChances_PirateSilverWalking),
    %vulnerabilities(EnemyVulnerabilities_PirateSilverWall_PirateSilverWalking),
    %name(EnemyName_PirateSilverWalking))


Freespace_BankA0_F7D3:
; $82D bytes
