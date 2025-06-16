
org $A88000


; Common to all enemy code banks

;;; $8000: Grapple AI - no interaction. Also unfreezes enemies(!) ;;;
CommonA8_GrappleAI_NoInteraction:
; Used by skultera, Draygon body, fire arc, Phantoon, etecoon, dachora and WS ghost
    JSL GrappleAI_SwitchEnemyAIToMainAI
    RTL


;;; $8005: Grapple AI - Samus latches on ;;;
CommonA8_GrappleAI_SamusLatchesOn:
; Used by gripper and Crocomire
    JSL GrappleAI_SamusLatchesOnWithGrapple
    RTL


;;; $800A: Grapple AI - kill enemy ;;;
CommonA8_GrappleAI_KillEnemy:
; Common
    JSL GrappleAI_EnemyGrappleDeath
    RTL


;;; $800F: Grapple AI - cancel grapple beam ;;;
CommonA8_GrappleAI_CancelGrappleBeam:
; Common
    JSL GrappleAI_SwitchToFrozenAI
    RTL


;;; $8014: Grapple AI - Samus latches on - no invincibility ;;;
CommonA8_GrappleAI_SamusLatchesOn_NoInvincibility:
; Used by powamp
    JSL GrappleAI_SamusLatchesOnWithGrapple_NoInvincibility
    RTL


;;; $8019: Unused. Grapple AI - Samus latches on - paralyse enemy ;;;
UNUSED_CommonA8_GrappleAI_SamusLatchesOn_ParalyzeEnemy_A88019:
    JSL GrappleAI_SamusLatchesOnWithGrapple_ParalyzeEnemy
    RTL


;;; $801E: Grapple AI - hurt Samus ;;;
CommonA8_GrappleAI_HurtSamus:
; Used by WS spark
; Hurt reaction happens in $9B:B932
    JSL GrappleAI_SwitchToFrozenAI_duplicate
    RTL


;;; $8023: Normal enemy touch AI ;;;
CommonA8_NormalEnemyTouchAI:
    JSL NormalEnemyTouchAI
    RTL


;;; $8028: Normal touch AI - no death check ;;;
CommonA8_NormalTouchAI_NoDeathCheck:
    JSL NormalEnemyTouchAI_NoDeathCheck_External
    RTL


;;; $802D: Normal enemy shot AI ;;;
CommonA8_NormalEnemyShotAI:
    JSL NormalEnemyShotAI
    RTL


;;; $8032: Normal enemy shot AI - no death check, no enemy shot graphic ;;;
CommonA8_NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic:
    JSL NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External
    RTL


;;; $8037: Normal enemy power bomb AI ;;;
CommonA8_NormalEnemyPowerBombAI:
    JSL NormalEnemyPowerBombAI
    RTL


;;; $803C: Normal enemy power bomb AI - no death check ;;;
CommonA8_NormalEnemyPowerBombAI_NoDeathCheck:
; Kraid's power bomb AI
    JSL NormalEnemyPowerBombAI_NoDeathCheck_External
    RTL


;;; $8041: Normal enemy frozen AI ;;;
CommonA8_NormalEnemyFrozenAI:
    JSL NormalEnemyFrozenAI
    RTL


;;; $8046: Creates a dud shot ;;;
CommonA8_CreateADudShot:
    JSL CreateADudShot
    RTL


;;; $804B: RTS ;;;
RTS_A8804B:
    RTS


;;; $804C: RTL ;;;
RTL_A8804C:
    RTL


;;; $804D: Spritemap - nothing ;;;
Spritemap_CommonA8_Nothing:
    dw $0000


;;; $804F: Extended spritemap - nothing ;;;
ExtendedSpritemap_CommonA8_Nothing:
    dw $0001
    dw $0000,$0000
    dw Spritemap_CommonA8_Nothing
    dw Hitbox_CommonA8_Nothing


;;; $8059: Hitbox - nothing ;;;
Hitbox_CommonA8_Nothing:
; [n entries] [[left offset] [top offset] [right offset] [bottom offset] [p touch] [p shot]]...
    dw $0001
    dw $0000,$0000,$0000,$0000
    dw CommonA8_NormalEnemyTouchAI
    dw CommonA8_NormalEnemyShotAI


;;; $8067: Instruction list - delete enemy ;;;
InstList_CommonA8_DeleteEnemy:
    dw Instruction_CommonA8_DeleteEnemy


;;; $8069: Two NOPs ;;;
NOPNOP_A88069:
; Used as palette by respawning enemy placeholder and Draygon's eye o_O
    NOP : NOP


;;; $806B: Instruction - Enemy.var5 = [[Y]] ;;;
Instruction_CommonA8_Enemy0FB2_InY:
; Used only by torizos (for enemy movement function) and escape etecoon (for enemy function)
    LDA.W $0000,Y : STA.W Enemy.var5,X
    INY #2
    RTL


;;; $8074: Instruction - Enemy.var5 = RTS ;;;
Instruction_CommonA8_SetEnemy0FB2ToRTS:
    LDA.W #RTS_A8807B : STA.W Enemy.var5,X
    RTL


RTS_A8807B:
    RTS


;;; $807C: Instruction - delete enemy ;;;
Instruction_CommonA8_DeleteEnemy:
    LDA.W Enemy.properties,X : ORA.W #$0200 : STA.W Enemy.properties,X
    PLA
    PEA.W ProcessEnemyInstructions_return-1
    RTL


;;; $808A: Instruction - call function [[Y]] ;;;
Instruction_CommonA8_CallFunctionInY:
    LDA.W $0000,Y : STA.B DP_Temp12
    PHY : PHX
    PEA .manualReturn-1
    JMP.W (DP_Temp12)

  .manualReturn:
    PLX : PLY
    INY #2
    RTL


;;; $809C: Instruction - call function [[Y]] with A = [[Y] + 2] ;;;
Instruction_CommonA8_CallFunctionInY_WithA:
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
UNUSED_Instruction_CommonA8_CallExternalFunctionInY_A880B5:
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
UNUSED_Inst_CommonA8_CallExternalFunctionInY_WithA_A880CE:
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
Instruction_CommonA8_GotoY:
    LDA.W $0000,Y : TAY
    RTL


;;; $80F2: Instruction - go to [[Y]] + ±[[Y]] ;;;
Instruction_CommonA8_GotoY_PlusY:
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
Instruction_CommonA8_DecrementTimer_GotoYIfNonZero:
    DEC.W Enemy.loopCounter,X : BNE Instruction_CommonA8_GotoY
    INY #2
    RTL


;;; $8110: Instruction - decrement timer and go to [[Y]] if non-zero ;;;
Instruction_CommonA8_DecrementTimer_GotoYIfNonZero_duplicate:
    DEC.W Enemy.loopCounter,X : BNE Instruction_CommonA8_GotoY
    INY #2
    RTL


;;; $8118: Instruction - decrement timer and go to [Y] + ±[[Y]] if non-zero ;;;
Instruction_CommonA8_DecrementTimer_GotoY_PlusY_IfNonZero:
    SEP #$20
    DEC.W Enemy.loopCounter,X
    REP #$20
    BNE Instruction_CommonA8_GotoY_PlusY
    INY
    RTL


;;; $8123: Instruction - timer = [[Y]] ;;;
Instruction_CommonA8_TimerInY:
    LDA.W $0000,Y : STA.W Enemy.loopCounter,X
    INY #2
    RTL


;;; $812C: Instruction - skip next instruction ;;;
Instruction_CommonA8_SkipNextInstruction:
    INY #2
    RTL


;;; $812F: Instruction - sleep ;;;
Instruction_CommonA8_Sleep:
    DEY #2
    TYA : STA.W Enemy.instList,X
    PLA
    PEA.W ProcessEnemyInstructions_return-1
    RTL


;;; $813A: Instruction - wait [[Y]] frames ;;;
Instruction_CommonA8_WaitYFrames:
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
Instruction_CommonA8_TransferYBytesInYToVRAM:
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
Instruction_CommonA8_EnableOffScreenProcessing:
    LDA.W Enemy.properties,X : ORA.W #$0800 : STA.W Enemy.properties,X
    RTL


;;; $817D: Instruction - disable off-screen processing ;;;
Instruction_CommonA8_DisableOffScreenProcessing:
    LDA.W Enemy.properties,X : AND.W #$F7FF : STA.W Enemy.properties,X
    RTL


;;; $8187: Common enemy speeds - linearly increasing ;;;
CommonA8EnemySpeeds_LinearlyIncreasing:
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
CommonA8EnemySpeeds_QuadraticallyIncreasing:
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


;;; $8687: Palette - enemy $E63F/$E67F (evir) ;;;
Palette_Evir:
    dw $3800,$57FF,$42F7,$0929,$00A5,$4F5A,$36B5,$2610
    dw $158C,$03FF,$02B9,$0170,$0069,$0BB1,$1EA9,$0145


;;; $86A7: Instruction list - evir body - facing left ;;;
InstList_Evir_Body_FacingLeft:
    dw $000A,Spritemap_Evir_0
    dw $000A,Spritemap_Evir_1
    dw $000A,Spritemap_Evir_2
    dw $000A,Spritemap_Evir_3
    dw $000A,Spritemap_Evir_4
    dw $000A,Spritemap_Evir_5
    dw Instruction_Common_GotoY
    dw InstList_Evir_Body_FacingLeft


;;; $86C3: Instruction list - evir arms - facing left ;;;
InstList_Evir_Arms_FacingLeft:
    dw $000A,Spritemap_Evir_6
    dw $000A,Spritemap_Evir_7
    dw $000A,Spritemap_Evir_8
    dw $000A,Spritemap_Evir_9
    dw $000A,Spritemap_Evir_6
    dw $000A,Spritemap_Evir_7
    dw $000A,Spritemap_Evir_8
    dw $000A,Spritemap_Evir_9
    dw $000A,Spritemap_Evir_6
    dw $000A,Spritemap_Evir_7
    dw $000A,Spritemap_Evir_8
    dw $000A,Spritemap_Evir_9
    dw $000A,Spritemap_Evir_6
    dw $000A,Spritemap_Evir_7
    dw $000A,Spritemap_Evir_8
    dw $000A,Spritemap_Evir_9
    dw $0030,Spritemap_Evir_A
    dw Instruction_Common_GotoY
    dw InstList_Evir_Arms_FacingLeft


;;; $870B: Instruction list - evir body - facing right ;;;
InstList_Evir_Body_FacingRight:
    dw $000A,Spritemap_Evir_D
    dw $000A,Spritemap_Evir_E
    dw $000A,Spritemap_Evir_F
    dw $000A,Spritemap_Evir_10
    dw $000A,Spritemap_Evir_11
    dw $000A,Spritemap_Evir_12
    dw Instruction_Common_GotoY
    dw InstList_Evir_Body_FacingRight


;;; $8727: Instruction list - evir arms - facing right ;;;
InstList_Evir_Arms_FacingRight:
    dw $000A,Spritemap_Evir_13
    dw $000A,Spritemap_Evir_14
    dw $000A,Spritemap_Evir_15
    dw $000A,Spritemap_Evir_16
    dw $000A,Spritemap_Evir_13
    dw $000A,Spritemap_Evir_14
    dw $000A,Spritemap_Evir_15
    dw $000A,Spritemap_Evir_16
    dw $000A,Spritemap_Evir_13
    dw $000A,Spritemap_Evir_14
    dw $000A,Spritemap_Evir_15
    dw $000A,Spritemap_Evir_16
    dw $000A,Spritemap_Evir_13
    dw $000A,Spritemap_Evir_14
    dw $000A,Spritemap_Evir_15
    dw $000A,Spritemap_Evir_16
    dw $0030,Spritemap_Evir_17
    dw Instruction_Common_GotoY
    dw InstList_Evir_Arms_FacingRight


;;; $876F: Instruction list - evir projectile - normal ;;;
InstList_Evir_Projectile_Normal:
    dw $0001,Spritemap_Evir_C
    dw Instruction_Common_Sleep


;;; $8775: Instruction list - evir projectile - regenerating ;;;
InstList_Evir_Projectile_Regenerating_0:
    dw Instruction_Evir_SetInitialRegenerationXOffset
    dw Instruction_Common_TimerInY,$0008
    dw Instruction_Evir_PlaySpitSFX

InstList_Evir_Projectile_Regenerating_1:
    dw $0008,Spritemap_Evir_B
    dw Instruction_Evir_AdvanceRegenerationXOffset
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate
    dw InstList_Evir_Projectile_Regenerating_1
    dw $0010,Spritemap_Evir_C
    dw Instruction_Evir_FinishRegeneration
    dw Instruction_Common_Sleep


;;; $878F: Instruction - queue evir spit sound effect ;;;
Instruction_Evir_PlaySpitSFX:
    PHX : PHY
    LDA.W #$005E
    JSL QueueSound_Lib2_Max6
    PLY : PLX
    RTL


;;; $879B: Instruction - set initial regeneration X offset ;;;
Instruction_Evir_SetInitialRegenerationXOffset:
    LDX.W EnemyIndex
    LDA.L Evir.instList-$80,X : CMP.W #InstList_Evir_Body_FacingRight : BEQ .facingRight
    LDA.W #$0008 : STA.W Enemy.var5,X
    BRA .return

  .facingRight:
    LDA.W #$FFF8 : STA.W Enemy.var5,X

  .return:
    RTL


;;; $87B6: Instruction - advance regeneration X offset ;;;
Instruction_Evir_AdvanceRegenerationXOffset:
    LDX.W EnemyIndex
    LDA.L Evir.instList-$80,X : CMP.W #InstList_Evir_Body_FacingRight : BEQ .facingRight
    DEC.W Enemy.var5,X
    BRA .return

  .facingRight:
    INC.W Enemy.var5,X

  .return:
    RTL


;;; $87CB: Instruction - finish regeneration ;;;
Instruction_Evir_FinishRegeneration:
    LDX.W EnemyIndex
    LDA.W #$0000 : STA.L Evir.regenerationFlag,X : STA.L Evir.movingFlag,X
    LDA.W #Function_EvirProjectile_Idle : STA.W Evir.function,X
    RTL


;;; $87E0: Initialisation AI - enemy $E63F (evir) ;;;
InitAI_Evir:
    LDX.W EnemyIndex
    LDA.W Enemy.init0,X : BNE .nonZeroParam1
    JSR SetEvirFacingDirection
    LDA.W Enemy.init1,X : AND.W #$00FF : ASL #3 : TAY
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,Y : STA.L Evir.downVelocity,X
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,Y : STA.L Evir.downSubVelocity,X
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+4,Y : STA.L Evir.upVelocity,X
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+6,Y : STA.L Evir.upSubVelocity,X
    LDA.W Enemy.init1+1,Y : AND.W #$00FF : LSR : STA.W Evir.movementTimer,X
    BRA +

  .nonZeroParam1:
    JSR HandleEvirArms
    LDA.W #$0004 : STA.W Enemy.layer,X

+   LDA.W #$0000 : STA.L Evir.movementDirection,X : STA.L Evir.instList,X
    LDA.W #Function_Evir_HandleBodyArms : STA.W Evir.function,X
    RTL


;;; $8838: Set evir facing direction ;;;
SetEvirFacingDirection:
    LDX.W EnemyIndex
    JSL Get_SamusX_minus_EnemyX
    BPL .SamusToTheRight
    LDA.W #$0000 : STA.W Evir.facingDirection,X
    BRA +

  .SamusToTheRight:
    LDA.W #$0001
    STA.W Evir.facingDirection,X

+   LDA.W #InstList_Evir_Body_FacingLeft : STA.L Evir.newInstList,X
    LDA.W Evir.facingDirection,X : BEQ .keepLeft
    LDA.W #InstList_Evir_Body_FacingRight : STA.L Evir.newInstList,X

  .keepLeft:
    JSR SetEvirInstList
    RTS


;;; $8866: Handle evir arms ;;;
HandleEvirArms:
    LDX.W EnemyIndex ; >.<
    LDA.W Enemy[-1].var1,X : STA.W Evir.facingDirection,X : BNE .facingRight
    LDA.W Enemy[-1].XPosition,X : SEC : SBC.W #$0004 : STA.W Enemy.XPosition,X
    LDA.W Enemy[-1].YPosition,X : CLC : ADC.W #$000A : STA.W Enemy.YPosition,X
    LDA.W #InstList_Evir_Arms_FacingLeft : STA.L Evir.newInstList,X
    JSR SetEvirInstList
    BRA .return

  .facingRight:
    LDA.W Enemy[-1].XPosition,X : CLC : ADC.W #$0004 : STA.W Enemy.XPosition,X
    LDA.W Enemy[-1].YPosition,X : CLC : ADC.W #$000A : STA.W Enemy.YPosition,X
    LDA.W #InstList_Evir_Arms_FacingRight : STA.L Evir.newInstList,X
    JSR SetEvirInstList

  .return:
    RTS


;;; $88B0: Initialisation AI - enemy $E67F (evir projectile) ;;;
InitAI_EvirProjectile:
    LDX.W EnemyIndex
    LDA.W #InstList_Evir_Projectile_Normal : STA.L Evir.newInstList,X
    JSR SetEvirInstList
    LDA.W Enemy[-2].palette,X : STA.W Enemy.palette,X
    LDA.W Enemy[-2].GFXOffset,X : STA.W Enemy.GFXOffset,X
    JSR ResetEvirProjectilePosition
    LDA.W #$0000 : STA.L Evir.instList,X : STA.L Evir.regenerationFlag,X
    STA.L Evir.movingFlag,X : STA.W Enemy.var5,X
    LDA.W #Function_EvirProjectile_Idle : STA.W Evir.function,X
    RTL


;;; $88E5: Reset evir projectile position ;;;
ResetEvirProjectilePosition:
    LDX.W EnemyIndex
    LDA.W Enemy[-2].var1,X : STA.W Evir.facingDirection,X : BNE .notUp
    LDA.W Enemy[-2].XPosition,X : SEC : SBC.W #$0004 : STA.W Enemy.XPosition,X
    LDA.W Enemy[-2].YPosition,X : CLC : ADC.W #$0012 : STA.W Enemy.YPosition,X
    BRA .return

  .notUp:
    LDA.W Enemy[-2].XPosition,X : CLC : ADC.W #$0004 : STA.W Enemy.XPosition,X
    LDA.W Enemy[-2].YPosition,X : CLC : ADC.W #$0012 : STA.W Enemy.YPosition,X

  .return:
    RTS


;;; $891B: Main AI - enemy $E63F (evir) ;;;
MainAI_Evir:
    LDX.W EnemyIndex
    JSR.W (Evir.function,X)
    RTL


;;; $8922: Evir function - handle body/arms ;;;
Function_Evir_HandleBodyArms:
    LDX.W EnemyIndex ; >.<
    LDA.W Enemy.init0,X
    BNE .notMaster
    JSR HandleEvirBody
    BRA .return

  .notMaster:
    JSR Call_HandleEvirArms

  .return:
    RTS


;;; $8933: Handle evir body ;;;
HandleEvirBody:
    LDX.W EnemyIndex ; >.<
    LDA.L Evir.regenerationFlag+$80,X : BNE .directionChosen
    JSR SetEvirFacingDirection

  .directionChosen:
    LDA.L Evir.movementDirection,X : BNE .sinking
    LDA.W Enemy.YPosition,X : CLC : ADC.L Evir.upVelocity,X : STA.W Enemy.YPosition,X
    LDA.W Enemy.YSubPosition,X : CLC : ADC.L Evir.upSubVelocity,X : BCC .storeYSubPosition
    INC.W Enemy.YPosition,X

  .storeYSubPosition:
    STA.W Enemy.YSubPosition,X
    BRA +

  .sinking:
    LDA.W Enemy.YPosition,X : CLC : ADC.L Evir.downVelocity,X : STA.W Enemy.YPosition,X
    LDA.W Enemy.YSubPosition,X : CLC : ADC.L Evir.downSubVelocity,X : BCC ..storeYSubPosition
    INC.W Enemy.YPosition,X

  ..storeYSubPosition:
    STA.W Enemy.YSubPosition,X

+   DEC.W Evir.movementTimer,X : BPL .return
    LDA.W Enemy.init1+1,X : AND.W #$00FF : STA.W Evir.movementTimer,X
    LDA.L Evir.movementDirection,X : EOR.W #$0001 : STA.L Evir.movementDirection,X

  .return:
    RTS


;;; $8997: Handle evir arms ;;;
Call_HandleEvirArms:
    LDX.W EnemyIndex ; >.<
    JSR HandleEvirArms
    RTS


;;; $899E: Main AI - enemy $E67F (evir projectile) ;;;
MainAI_EvirProjectile:
    LDX.W EnemyIndex
    LDA.W Enemy.freezeTimer,X : BNE .merge
    LDA.L Evir.movingFlag,X : BEQ .angleInitialized
    LDA.W Evir.facingDirection,X ; >_<
    LDA.W #InstList_Evir_Projectile_Normal : STA.L Evir.newInstList,X
    JSR SetEvirInstList
    BRA .merge

  .angleInitialized:
    LDA.L Evir.regenerationFlag,X : BEQ .doneSpawning
    LDA.W #InstList_Evir_Projectile_Regenerating_0 : STA.L Evir.newInstList,X
    JSR SetEvirInstList
    BRA .merge

  .doneSpawning:
    JSR ShootEvirProjectileAtSamus

  .merge:
    JSR.W (Evir.function,X)
    RTL


;;; $89D4: Shoot evir projectile at Samus ;;;
ShootEvirProjectileAtSamus:
    LDA.W EnemyIndex : SEC : SBC.W #$0080 : TAX
    LDA.W #$0080
    JSL IsSamusWithinAPixelColumnsOfEnemy
    BEQ .return
    LDA.W #$0004 : STA.W Temp_Unknown0E32
    JSL CalculateAngleOfSamusFromEnemy
    SEC : SBC.W #$0040 : AND.W #$00FF
    EOR.W #$FFFF : INC : STA.B DP_Temp16
    JSL EightBitCosineMultiplication_A0B0B2
    STA.L Evir.XVelocity,X
    LDA.W Temp_Unknown0E38 : STA.L Evir.XSubVelocity,X
    LDA.B DP_Temp16
    JSL EightBitNegativeSineMultiplication_A0B0C6
    STA.L Evir.YVelocity,X
    LDA.W Temp_Unknown0E38 : STA.L Evir.YSubVelocity,X
    LDA.W #InstList_Evir_Projectile_Normal : STA.L Evir.newInstList,X
    JSR SetEvirInstList
    LDA.W #$0001 : STA.L Evir.movingFlag,X
    LDA.W #Function_EvirProjectile_Moving : STA.W Evir.function,X

  .return:
    RTS


;;; $8A34: Evir projectile function - idle ;;;
Function_EvirProjectile_Idle:
    LDX.W EnemyIndex ; >.<
    JSR ResetEvirProjectilePosition
    RTS


;;; $8A3B: Evir projectile function - moving ;;;
Function_EvirProjectile_Moving:
    LDX.W EnemyIndex ; >.<
    JSR StartEvirProjectileRegeneratingIfFarOffScreen
    LDA.W Enemy.XPosition,X : CLC : ADC.L Evir.XVelocity,X : STA.W Enemy.XPosition,X
    LDA.W Enemy.XSubPosition,X : CLC : ADC.L Evir.XSubVelocity,X : BCC +
    INC.W Enemy.XPosition,X

+   STA.W Enemy.XSubPosition,X
    LDA.W Enemy.YPosition,X : CLC : ADC.L Evir.YVelocity,X : STA.W Enemy.YPosition,X
    LDA.W Enemy.YSubPosition,X : CLC : ADC.L Evir.YSubVelocity,X : BCC +
    INC.W Enemy.YPosition,X

+   STA.W Enemy.YSubPosition,X
    RTS


;;; $8A78: Evir projectile function - regenerating ;;;
Function_EvirProjectile_Regenerating:
    LDX.W EnemyIndex ; >.<
    LDA.W Enemy[-2].freezeTimer,X : BNE .return
    LDA.L Evir.regenerationFlag,X : BNE .notRegenerating
    LDA.W #InstList_Evir_Projectile_Normal : STA.L Evir.newInstList,X
    JSR SetEvirInstList
    LDA.W #$0000 : STA.L Evir.regenerationFlag,X : STA.L Evir.movingFlag,X
    LDA.W #Function_EvirProjectile_Idle : STA.W Evir.function,X
    BRA .return

  .notRegenerating:
    JSR ResetEvirProjectilePosition
    LDA.W Enemy.XPosition,X : CLC : ADC.W Enemy.var5,X : STA.W Enemy.XPosition,X

  .return:
    RTS


;;; $8AB1: Start evir projectile regenerating if far off-screen ;;;
StartEvirProjectileRegeneratingIfFarOffScreen:
    LDX.W EnemyIndex ; >.<
    LDA.W #$0100
    JSL CheckIfEnemyCenterIsOverAPixelsOffScreen
    BEQ .return
    LDA.W Enemy[-2].freezeTimer,X : BNE .return
    LDA.W #$0000 : STA.L Evir.movingFlag,X
    LDA.W #$0001 : STA.L Evir.regenerationFlag,X
    LDA.W #Function_EvirProjectile_Regenerating : STA.W Evir.function,X
    LDA.W #$0001 : STA.L Evir.regenerationFlag,X
    LDA.W #InstList_Evir_Projectile_Regenerating_0 : STA.L Evir.newInstList,X
    JSR SetEvirInstList

  .return:
    RTS


;;; $8AE8: Set evir instruction list ;;;
SetEvirInstList:
    LDX.W EnemyIndex
    LDA.L Evir.newInstList,X : CMP.L Evir.instList,X : BEQ .return
    STA.W Enemy.instList,X : STA.L Evir.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X

  .return:
    RTS


;;; $8B06: Enemy shot - enemy $E63F (evir) ;;;
EnemyShot_Evir:
    JSL CommonA8_NormalEnemyTouchAI
    BRA ContactReaction_Evir_Common


;;; $8B0C: Power bomb reaction - enemy $E63F (evir) ;;;
PowerBombReaction_Evir:
    JSL CommonA8_NormalEnemyPowerBombAI
    BRA ContactReaction_Evir_Common


;;; $8B12: Enemy touch - enemy $E63F (evir) ;;;
EnemyTouch_Evir:
    JSL NormalEnemyShotAI
; fallthrough to ContactReaction_Evir_Common


;;; $8B16: Evir shared contact reaction ;;;
ContactReaction_Evir_Common:
    LDX.W EnemyIndex
    LDA.W Enemy.health,X : BNE .notDead
    LDA.W Enemy[1].properties,X : ORA.W #$0200 : STA.W Enemy[1].properties,X
    LDA.W Enemy[2].properties,X : ORA.W #$0200 : STA.W Enemy[2].properties,X

  .notDead:
    LDA.W Enemy.freezeTimer,X : BEQ .return
    STA.W Enemy[1].freezeTimer,X
    LDA.W Enemy[1].AI,X : ORA.W #$0004 : STA.W Enemy[1].AI,X
    LDA.W Enemy[2].var2,X : CMP.W #Function_EvirProjectile_Moving : BEQ .return
    LDA.W Enemy[2].AI,X : ORA.W #$0004 : STA.W Enemy[2].AI,X
    LDA.W Enemy.freezeTimer,X : STA.W Enemy[2].freezeTimer,X

  .return:
    RTL


;;; $8B59: Evir spritemaps ;;;
Spritemap_Evir_0:
    dw $0009
    %spritemapEntry(1, $1FE, $FB, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1EE, $FB, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1FE, $EB, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1EE, $EB, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $02, $FB, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $01, $01, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $1FF, $07, 0, 0, 2, 0, $10C)
    %spritemapEntry(0, $1FE, $10, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1FE, $08, 0, 0, 2, 0, $125)

Spritemap_Evir_1:
    dw $0009
    %spritemapEntry(1, $1FE, $FB, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1EE, $FB, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1FE, $EB, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1EE, $EB, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $02, $FC, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $01, $02, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $1FF, $07, 0, 0, 2, 0, $10C)
    %spritemapEntry(0, $1FE, $10, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1FE, $08, 0, 0, 2, 0, $125)

Spritemap_Evir_2:
    dw $0009
    %spritemapEntry(1, $1FE, $FB, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1EE, $FB, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1FE, $EB, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1EE, $EB, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $02, $FD, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $01, $03, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $1FF, $08, 0, 0, 2, 0, $10C)
    %spritemapEntry(0, $1FE, $11, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1FE, $09, 0, 0, 2, 0, $125)

Spritemap_Evir_3:
    dw $0009
    %spritemapEntry(1, $1FE, $FB, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1EE, $FB, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1FE, $EB, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1EE, $EB, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $02, $FD, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $01, $04, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $1FF, $09, 0, 0, 2, 0, $10C)
    %spritemapEntry(0, $1FE, $12, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1FE, $0A, 0, 0, 2, 0, $125)

Spritemap_Evir_4:
    dw $0009
    %spritemapEntry(1, $1FE, $FB, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1EE, $FB, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1FE, $EB, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1EE, $EB, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $02, $FD, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $01, $04, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $1FF, $0A, 0, 0, 2, 0, $10C)
    %spritemapEntry(0, $1FE, $11, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1FE, $09, 0, 0, 2, 0, $125)

Spritemap_Evir_5:
    dw $0009
    %spritemapEntry(1, $1FE, $FB, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1EE, $FB, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1FE, $EB, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1EE, $EB, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $02, $FC, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $01, $03, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $1FF, $09, 0, 0, 2, 0, $10C)
    %spritemapEntry(0, $1FE, $10, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1FE, $08, 0, 0, 2, 0, $125)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Evir_A88C73:
    dw $0009
    %spritemapEntry(1, $1FE, $FB, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1EE, $FB, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1FE, $EB, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1EE, $EB, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $02, $FB, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $01, $01, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $1FF, $07, 0, 0, 2, 0, $10C)
    %spritemapEntry(0, $1FE, $10, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1FE, $08, 0, 0, 2, 0, $125)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Evir_6:
    dw $0005
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $123)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $02, $FC, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $1FE, $F4, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $1F6, $F4, 0, 0, 2, 0, $120)

Spritemap_Evir_7:
    dw $0005
    %spritemapEntry(0, $1FE, $F4, 0, 0, 2, 0, $123)
    %spritemapEntry(0, $1F6, $F4, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $02, $FC, 0, 0, 2, 0, $123)
    %spritemapEntry(0, $1FA, $FC, 0, 0, 2, 0, $122)

Spritemap_Evir_8:
    dw $0005
    %spritemapEntry(0, $1FE, $F4, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $123)
    %spritemapEntry(0, $02, $FC, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $1FA, $FC, 0, 0, 2, 0, $120)

Spritemap_Evir_9:
    dw $0006
    %spritemapEntry(0, $1FE, $F4, 0, 0, 2, 0, $123)
    %spritemapEntry(0, $1F6, $F4, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $120)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $02, $FC, 0, 0, 2, 0, $123)
    %spritemapEntry(0, $1FA, $FC, 0, 0, 2, 0, $122)

Spritemap_Evir_A:
    dw $0003
    %spritemapEntry(0, $1FE, $F4, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $02, $FC, 0, 0, 2, 0, $124)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Evir_A88D24:
    dw $0006
    %spritemapEntry(0, $1FE, $F4, 0, 0, 2, 0, $123)
    %spritemapEntry(0, $1F6, $F4, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $123)
    %spritemapEntry(0, $02, $FC, 0, 0, 2, 0, $123)
    %spritemapEntry(0, $1FA, $FC, 0, 0, 2, 0, $122)

UNUSED_Spritemap_Evir_A88D44:
    dw $0006
    %spritemapEntry(0, $1FE, $F4, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $1F6, $F4, 0, 0, 2, 0, $120)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $120)
    %spritemapEntry(0, $02, $FC, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $1FA, $FC, 0, 0, 2, 0, $120)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Evir_B:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 0, 2, 0, $128)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 0, $127)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $128)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $127)

Spritemap_Evir_C:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10E)

Spritemap_Evir_D:
    dw $0009
    %spritemapEntry(1, $1F2, $FB, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $02, $FB, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $1F2, $EB, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $02, $EB, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1EE, $FB, 0, 1, 2, 0, $108)
    %spritemapEntry(1, $1EF, $01, 0, 1, 2, 0, $108)
    %spritemapEntry(1, $1F1, $07, 0, 1, 2, 0, $10C)
    %spritemapEntry(0, $1FA, $10, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $1FA, $08, 0, 1, 2, 0, $125)

Spritemap_Evir_E:
    dw $0009
    %spritemapEntry(1, $1F2, $FB, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $02, $FB, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $1F2, $EB, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $02, $EB, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1EE, $FC, 0, 1, 2, 0, $108)
    %spritemapEntry(1, $1EF, $02, 0, 1, 2, 0, $108)
    %spritemapEntry(1, $1F1, $07, 0, 1, 2, 0, $10C)
    %spritemapEntry(0, $1FA, $10, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $1FA, $08, 0, 1, 2, 0, $125)

Spritemap_Evir_F:
    dw $0009
    %spritemapEntry(1, $1F2, $FB, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $02, $FB, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $1F2, $EB, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $02, $EB, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1EE, $FD, 0, 1, 2, 0, $108)
    %spritemapEntry(1, $1EF, $03, 0, 1, 2, 0, $108)
    %spritemapEntry(1, $1F1, $08, 0, 1, 2, 0, $10C)
    %spritemapEntry(0, $1FA, $11, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $1FA, $09, 0, 1, 2, 0, $125)

Spritemap_Evir_10:
    dw $0009
    %spritemapEntry(1, $1F2, $FB, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $02, $FB, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $1F2, $EB, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $02, $EB, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1EE, $FD, 0, 1, 2, 0, $108)
    %spritemapEntry(1, $1EF, $04, 0, 1, 2, 0, $108)
    %spritemapEntry(1, $1F1, $09, 0, 1, 2, 0, $10C)
    %spritemapEntry(0, $1FA, $12, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $1FA, $0A, 0, 1, 2, 0, $125)

Spritemap_Evir_11:
    dw $0009
    %spritemapEntry(1, $1F2, $FB, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $02, $FB, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $1F2, $EB, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $02, $EB, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1EE, $FD, 0, 1, 2, 0, $108)
    %spritemapEntry(1, $1EF, $04, 0, 1, 2, 0, $108)
    %spritemapEntry(1, $1F1, $0A, 0, 1, 2, 0, $10C)
    %spritemapEntry(0, $1FA, $11, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $1FA, $09, 0, 1, 2, 0, $125)

Spritemap_Evir_12:
    dw $0009
    %spritemapEntry(1, $1F2, $FB, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $02, $FB, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $1F2, $EB, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $02, $EB, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1EE, $FC, 0, 1, 2, 0, $108)
    %spritemapEntry(1, $1EF, $03, 0, 1, 2, 0, $108)
    %spritemapEntry(1, $1F1, $09, 0, 1, 2, 0, $10C)
    %spritemapEntry(0, $1FA, $10, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $1FA, $08, 0, 1, 2, 0, $125)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Evir_A88E9B:
    dw $0009
    %spritemapEntry(1, $1F2, $FB, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $02, $FB, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $1F2, $EB, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $02, $EB, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1EE, $FB, 0, 1, 2, 0, $108)
    %spritemapEntry(1, $1EF, $01, 0, 1, 2, 0, $108)
    %spritemapEntry(1, $1F1, $07, 0, 1, 2, 0, $10C)
    %spritemapEntry(0, $1FA, $10, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $1FA, $08, 0, 1, 2, 0, $125)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Evir_13:
    dw $0005
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 0, $123)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $1FA, $F4, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $02, $F4, 0, 1, 2, 0, $120)
    %spritemapEntry(0, $1F6, $FC, 0, 1, 2, 0, $124)

Spritemap_Evir_14:
    dw $0005
    %spritemapEntry(0, $1FA, $F4, 0, 1, 2, 0, $123)
    %spritemapEntry(0, $02, $F4, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 0, $124)
    %spritemapEntry(0, $1F6, $FC, 0, 1, 2, 0, $123)
    %spritemapEntry(0, $1FE, $FC, 0, 1, 2, 0, $122)

Spritemap_Evir_15:
    dw $0005
    %spritemapEntry(0, $1FA, $F4, 0, 1, 2, 0, $124)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 0, $123)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $1F6, $FC, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $1FE, $FC, 0, 1, 2, 0, $120)

Spritemap_Evir_16:
    dw $0006
    %spritemapEntry(0, $1FA, $F4, 0, 1, 2, 0, $123)
    %spritemapEntry(0, $02, $F4, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $120)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $1F6, $FC, 0, 1, 2, 0, $123)
    %spritemapEntry(0, $1FE, $FC, 0, 1, 2, 0, $122)

Spritemap_Evir_17:
    dw $0003
    %spritemapEntry(0, $1F6, $FC, 0, 1, 2, 0, $124)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 0, $124)
    %spritemapEntry(0, $1FA, $F4, 0, 1, 2, 0, $124)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Evir_A88F4C:
    dw $0006
    %spritemapEntry(0, $1FA, $F4, 0, 1, 2, 0, $123)
    %spritemapEntry(0, $02, $F4, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 0, $123)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $1F6, $FC, 0, 1, 2, 0, $123)
    %spritemapEntry(0, $1FE, $FC, 0, 1, 2, 0, $122)

UNUSED_Spritemap_Evir_A88F6C:
    dw $0006
    %spritemapEntry(0, $1FA, $F4, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $02, $F4, 0, 1, 2, 0, $120)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $120)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $1F6, $FC, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $1FE, $FC, 0, 1, 2, 0, $120)
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8F8C: Palette - enemy $E6BF (morph ball eye) ;;;
Palette_Eye:
    dw $3800,$72B2,$71C7,$2461,$1840,$7A8E,$660B,$4D03
    dw $4900,$7FE0,$7E80,$44E0,$2C20,$0000,$0000,$0000


;;; $8FAC: Instruction list - eye - active ;;;
InstList_Eye_Active:
; Indexed by [enemy angle] / 10h * 4, set every frame
    dw $000A,Spritemap_Eye_7
    dw $000A,Spritemap_Eye_7
    dw $000A,Spritemap_Eye_8
    dw $000A,Spritemap_Eye_9
    dw $000A,Spritemap_Eye_A
    dw $000A,Spritemap_Eye_B
    dw $000A,Spritemap_Eye_C
    dw $000A,Spritemap_Eye_D
    dw $000A,Spritemap_Eye_6
    dw $000A,Spritemap_Eye_5
    dw $000A,Spritemap_Eye_4
    dw $000A,Spritemap_Eye_3
    dw $000A,Spritemap_Eye_2
    dw $000A,Spritemap_Eye_1
    dw $000A,Spritemap_Eye_0
    dw $000A,Spritemap_Eye_0
    dw Instruction_Common_GotoY
    dw InstList_Eye_Active


;;; $8FF0: Instruction list - eye - facing right - deactivating ;;;
InstList_Eye_FacingRight_Deactivating:
    dw $0008,Spritemap_Eye_F
    dw $0030,Spritemap_Eye_3
    dw $0005,Spritemap_Eye_F


;;; $8FFC: Instruction list - eye - facing right - closed ;;;
InstList_Eye_FacingRight_Closed:
    dw $0030,Spritemap_Eye_E
    dw Instruction_Common_Sleep


;;; $9002: Instruction list - eye - facing left - deactivating ;;;
InstList_Eye_FacingLeft_Deactivating:
    dw $0008,Spritemap_Eye_11
    dw $0030,Spritemap_Eye_A
    dw $0005,Spritemap_Eye_11


;;; $900E: Instruction list - eye - facing left - closed ;;;
InstList_Eye_FacingLeft_Closed:
    dw $0030,Spritemap_Eye_10
    dw Instruction_Common_Sleep


;;; $9014: Instruction list - eye - activating - facing right ;;;
InstList_Eye_FacingRight_Activating:
    dw $0020,Spritemap_Eye_E
    dw $0005,Spritemap_Eye_F
    dw $0030,Spritemap_Eye_3
    dw $0008,Spritemap_Eye_F
    dw Instruction_Common_Sleep


;;; $9026: Instruction list - eye - activating - facing left ;;;
InstList_Eye_FacingLeft_Activating:
    dw $0020,Spritemap_Eye_10
    dw $0005,Spritemap_Eye_11
    dw $0030,Spritemap_Eye_A
    dw $0008,Spritemap_Eye_11
    dw Instruction_Common_Sleep


;;; $9038: Instruction list - mount - facing right ;;;
InstList_Eye_Mount_FacingRight:
    dw $0001,Spritemap_Eye_12
    dw Instruction_Common_Sleep


;;; $903E: Instruction list - mount - facing down ;;;
InstList_Eye_Mount_FacingDown:
    dw $0001,Spritemap_Eye_13
    dw Instruction_Common_Sleep


;;; $9044: Instruction list - mount - facing left ;;;
InstList_Eye_Mount_FacingLeft:
    dw $0001,Spritemap_Eye_14
    dw Instruction_Common_Sleep


;;; $904A: Instruction list - mount - facing up ;;;
InstList_Eye_Mount_FacingUp:
    dw $0001,Spritemap_Eye_15
    dw Instruction_Common_Sleep


;;; $9050: Morph ball eye proximities ;;;
EyeConstants:
  .XProximityToActivate:
    dw $0080

  .XProximityToDeactivate:
    dw $00B0

  .YProximityToActivate:
    dw $0080

  .YProximityToDeactivate:
    dw $0080


;;; $9058: Initialisation AI - enemy $E6BF (morph ball eye) ;;;
InitAI_Eye:
    LDX.W EnemyIndex
    LDA.W Enemy.properties,X : ORA.W #$2000 : STA.W Enemy.properties,X
    LDA.W #Spritemap_Common_Nothing : STA.W Enemy.spritemap,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.W Enemy.init1,X : BMI .mountPart
    LDA.W #Function_Eye_WaitForSamusToGetNear : STA.W Eye.function,X
    LDA.W Enemy.init0,X : BIT.W #$0001 : BEQ .facingRight
    LDA.W #InstList_Eye_FacingLeft_Closed : STA.W Enemy.instList,X
    BRA .return

  .facingRight:
    LDA.W #InstList_Eye_FacingRight_Closed : STA.W Enemy.instList,X
    BRA .return

  .mountPart:
    AND.W #$000F : ASL : TAY
    LDA.W Enemy.XPosition,X : CLC : ADC.W .XOffsets,Y : STA.W Enemy.XPosition,X
    LDA.W Enemy.YPosition,X : CLC : ADC.W .YOffsets,Y : STA.W Enemy.YPosition,X
    LDA.W #RTL_A891DC : STA.W Eye.function,X
    LDA.W .instListPointers,Y : STA.W Enemy.instList,X
    LDX.W #$01FE

  .loop:
    LDA.W #$00FF : STA.L EyeBeamWindow1HDMADataTable,X
    DEX #2 : BPL .loop

  .return:
    RTL

  .XOffsets:
    dw $FFF8,$0008,$0000,$0000

  .YOffsets:
    dw $0000,$0000,$FFF8,$0008

  .instListPointers:
    dw InstList_Eye_Mount_FacingLeft
    dw InstList_Eye_Mount_FacingRight
    dw InstList_Eye_Mount_FacingUp
    dw InstList_Eye_Mount_FacingDown


;;; $90E2: Main AI - enemy $E6BF (morph ball eye) ;;;
MainAI_Eye:
    LDX.W EnemyIndex
    LDA.W CollectedItems : BIT.W #$0004 : BEQ .return
    JMP.W (Eye.function,X)

  .return:
    RTL


;;; $90F1: Morph ball eye function - wait for Samus to get near ;;;
Function_Eye_WaitForSamusToGetNear:
    LDA.W EyeConstants_YProximityToActivate
    JSL IsSamusWithingAPixelRowsOfEnemy
    TAY : BEQ .return
    LDA.W EyeConstants_XProximityToActivate
    JSL IsSamusWithinAPixelColumnsOfEnemy
    TAY : BEQ .return
    LDA.W #$0020 : STA.W Eye.functionTimer,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W Enemy.init0,X : BIT.W #$0001 : BEQ .zeroParam
    LDA.W #InstList_Eye_FacingLeft_Activating : STA.W Enemy.instList,X
    BRA +

  .zeroParam:
    LDA.W #InstList_Eye_FacingRight_Activating : STA.W Enemy.instList,X

+   LDA.W #Function_Eye_Activating : STA.W Eye.function,X

  .return:
    RTL


;;; $912E: Morph ball eye function - activating ;;;
Function_Eye_Activating:
    DEC.W Eye.functionTimer,X : BEQ .timerExpired
    BPL .return

  .timerExpired:
    LDA.W #$0017
    JSL QueueSound_Lib2_Max6
    JSL Spawn_MorphBallEyeBeam_HDMAObject
    LDA.W #Function_Eye_Active : STA.W Eye.function,X
    LDA.W SamusXPosition : SEC : SBC.W Enemy.XPosition,X : STA.B DP_Temp12
    LDA.W SamusYPosition : SEC : SBC.W Enemy.YPosition,X : STA.B DP_Temp14
    JSL CalculateAngleOf_12_14_Offset
    STA.W Eye.angle,X

  .return:
    RTL


;;; $9160: Morph ball eye function - active ;;;
Function_Eye_Active:
    LDA.W EyeConstants_YProximityToDeactivate
    JSL IsSamusWithingAPixelRowsOfEnemy
    TAY : BEQ .notInProximity
    LDA.W EyeConstants_XProximityToDeactivate
    JSL IsSamusWithinAPixelColumnsOfEnemy
    TAY : BNE .inProximity

  .notInProximity:
    LDA.W #$0071
    JSL QueueSound_Lib2_Max6
    STZ.W Eye.activatedFlag,X
    LDA.W #$0020 : STA.W Eye.functionTimer,X
    LDA.W Enemy.init0,X : BIT.W #$0001 : BEQ .zeroParam
    LDA.W #InstList_Eye_FacingLeft_Deactivating : STA.W Enemy.instList,X
    BRA +

  .zeroParam:
    LDA.W #InstList_Eye_FacingRight_Deactivating : STA.W Enemy.instList,X

+   LDA.W #Function_Eye_Deactivating : STA.W Eye.function,X
    BRA .merge

  .inProximity:
    LDA.W SamusXPosition : SEC : SBC.W Enemy.XPosition,X : STA.B DP_Temp12
    LDA.W SamusYPosition : SEC : SBC.W Enemy.YPosition,X : STA.B DP_Temp14
    JSL CalculateAngleOf_12_14_Offset
    STA.W Eye.angle,X
    AND.W #$00F0 : LSR #2 : CLC : ADC.W #InstList_Eye_Active : STA.W Enemy.instList,X

  .merge:
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    RTL


;;; $91CE: Morph ball eye function - deactivating ;;;
Function_Eye_Deactivating:
    DEC.W Eye.functionTimer,X : BEQ .timerExpired
    BPL .return

  .timerExpired:
    LDA.W #Function_Eye_WaitForSamusToGetNear : STA.W Eye.function,X

  .return:
    RTL


;;; $91DC: RTL ;;;
RTL_A891DC:
    RTL


;;; $91DD: RTL ;;;
RTL_A891DD:
    RTL


;;; $91DE: RTL ;;;
RTL_A891DE:
    RTL


;;; $91DF: Morph ball eye spritemaps ;;;
Spritemap_Eye_0:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $100)

Spritemap_Eye_1:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $102)

Spritemap_Eye_2:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $104)

Spritemap_Eye_3:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $106)

Spritemap_Eye_4:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $108)

Spritemap_Eye_5:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10A)

Spritemap_Eye_6:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10C)

Spritemap_Eye_7:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $100)

Spritemap_Eye_8:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $102)

Spritemap_Eye_9:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $104)

Spritemap_Eye_A:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $106)

Spritemap_Eye_B:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $108)

Spritemap_Eye_C:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $10A)

Spritemap_Eye_D:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $10C)

Spritemap_Eye_E:
    dw $0004
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 0, $11F)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $11F)
    %spritemapEntry(0, $00, $00, 0, 0, 2, 0, $117)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $107)

Spritemap_Eye_F:
    dw $0004
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 0, $11E)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $11E)
    %spritemapEntry(0, $00, $00, 0, 0, 2, 0, $117)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $107)

Spritemap_Eye_10:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 2, 0, $11F)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $11F)
    %spritemapEntry(0, $1F8, $00, 0, 1, 2, 0, $117)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 0, $107)

Spritemap_Eye_11:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 2, 0, $11E)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $11E)
    %spritemapEntry(0, $1F8, $00, 0, 1, 2, 0, $117)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 0, $107)

Spritemap_Eye_12:
    dw $0002
    %spritemapEntry(0, $1FC, $00, 1, 0, 2, 0, $10E)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 0, $10E)

Spritemap_Eye_13:
    dw $0002
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 0, $10F)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 0, $10F)

Spritemap_Eye_14:
    dw $0002
    %spritemapEntry(0, $1FC, $00, 1, 1, 2, 0, $10E)
    %spritemapEntry(0, $1FC, $F8, 0, 1, 2, 0, $10E)

Spritemap_Eye_15:
    dw $0002
    %spritemapEntry(0, $00, $FC, 1, 1, 2, 0, $10F)
    %spritemapEntry(0, $1F8, $FC, 1, 0, 2, 0, $10F)

Spritemap_Eye_16:
    dw $0004
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 0, $11F)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $11F)
    %spritemapEntry(0, $00, $00, 0, 0, 2, 0, $117)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $107)

Spritemap_Eye_17:
    dw $0004
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 0, $11E)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $11E)
    %spritemapEntry(0, $00, $00, 0, 0, 2, 0, $117)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $107)

Spritemap_Eye_18:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 2, 0, $11F)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $11F)
    %spritemapEntry(0, $1F8, $00, 0, 1, 2, 0, $117)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 0, $107)

Spritemap_Eye_19:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 2, 0, $11E)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $11E)
    %spritemapEntry(0, $1F8, $00, 0, 1, 2, 0, $117)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 0, $107)

Spritemap_Eye_1A:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 2, 0, $11F)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $11F)
    %spritemapEntry(0, $1F8, $00, 0, 1, 2, 0, $117)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 0, $107)

Spritemap_Eye_1B:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 2, 0, $11E)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $11E)
    %spritemapEntry(0, $1F8, $00, 0, 1, 2, 0, $117)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 0, $107)

Spritemap_Eye_1C:
    dw $0004
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 0, $11F)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $11F)
    %spritemapEntry(0, $00, $00, 0, 0, 2, 0, $117)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $107)

Spritemap_Eye_1D:
    dw $0004
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 0, $11E)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $11E)
    %spritemapEntry(0, $00, $00, 0, 0, 2, 0, $117)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $107)


;;; $9379: Palette - enemy $E6FF (fune) ;;;
Palette_Fune:
    dw $3800,$4B9C,$3694,$0929,$0042,$3B18,$2A52,$19AD
    dw $116B,$7F5A,$7EC0,$6DE0,$54E0,$001D,$0014,$000A


;;; $9399: Instruction list - fune - facing left - idle ;;;
InstList_Fune_FacingLeft_Idling:
    dw $0001,Spritemap_Fune_FacingLeft_Idle_MouthClosed
    dw Instruction_Common_Sleep


;;; $939F: Instruction list - fune - facing left - active ;;;
InstList_Fune_FacingLeft_Active:
    dw $0010,Spritemap_Fune_FacingLeft_Idle_MouthClosed
    dw $0008,Spritemap_Fune_FacingLeft_StartOpeningMouth
    dw $0008,Spritemap_Fune_FacingLeft_MouthOpening1
    dw $0008,Spritemap_Fune_FacingLeft_MouthOpening2
    dw Instruction_Fune_SpawnFireball_FacingLeft
    dw Instruction_FuneNamihe_QueueSpitSFX
    dw $0010,Spritemap_Fune_FacingLeft_MouthMostOpen
    dw $0008,Spritemap_Fune_FacingLeft_MouthOpening2
    dw $0008,Spritemap_Fune_FacingLeft_MouthOpening1
    dw $0008,Spritemap_Fune_FacingLeft_StartOpeningMouth
    dw Instruction_FuneNamihe_FinishActivity
    dw Instruction_Common_GotoY
    dw InstList_Fune_FacingLeft_Idling


;;; $93C9: Instruction list - fune - facing right - idle ;;;
InstList_Fune_FacingRight_Idling:
    dw $0001,Spritemap_Fune_FacingRight_Idle_MouthClosed
    dw Instruction_Common_Sleep


;;; $93CF: Instruction list - fune - facing right - active ;;;
InstList_Fune_FacingRight_Active:
    dw $0010,Spritemap_Fune_FacingRight_Idle_MouthClosed
    dw $0008,Spritemap_Fune_FacingRight_StartOpeningMouth
    dw $0008,Spritemap_Fune_FacingRight_MouthOpening1
    dw $0008,Spritemap_Fune_FacingRight_MouthOpening2
    dw Instruction_Fune_SpawnFireball_FacingRight
    dw Instruction_FuneNamihe_QueueSpitSFX
    dw $0010,Spritemap_Fune_FacingRight_MouthMostOpen
    dw $0008,Spritemap_Fune_FacingRight_MouthOpening2
    dw $0008,Spritemap_Fune_FacingRight_MouthOpening1
    dw $0008,Spritemap_Fune_FacingRight_StartOpeningMouth
    dw Instruction_FuneNamihe_FinishActivity_duplicate
    dw Instruction_Common_GotoY
    dw InstList_Fune_FacingRight_Idling


;;; $93F9: Fune spritemaps ;;;
Spritemap_Fune_FacingLeft_Idle_MouthClosed:
    dw $0008
    %spritemapEntry(0, $08, $0C, 0, 0, 2, 0, $127)
    %spritemapEntry(0, $00, $0C, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $00, $FC, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $00, $EC, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1F0, $FC, 0, 0, 2, 0, $102)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $1F0, $EC, 0, 0, 2, 0, $100)

Spritemap_Fune_FacingLeft_StartOpeningMouth:
    dw $0008
    %spritemapEntry(0, $06, $0C, 0, 0, 2, 0, $127)
    %spritemapEntry(0, $1FE, $0C, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1FE, $FC, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1FE, $EC, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1EE, $FE, 0, 0, 2, 0, $102)
    %spritemapEntry(0, $1F6, $FC, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $1EE, $FC, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $1EE, $EC, 0, 0, 2, 0, $100)

Spritemap_Fune_FacingLeft_MouthOpening1:
    dw $0008
    %spritemapEntry(0, $04, $0C, 0, 0, 2, 0, $127)
    %spritemapEntry(0, $1FC, $0C, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1FC, $FC, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1FC, $EC, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1EC, $00, 0, 0, 2, 0, $102)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $1EC, $FC, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $1EC, $EC, 0, 0, 2, 0, $100)

Spritemap_Fune_FacingLeft_MouthOpening2:
    dw $0008
    %spritemapEntry(0, $02, $0C, 0, 0, 2, 0, $127)
    %spritemapEntry(0, $1FA, $0C, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1FA, $FC, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1FA, $EC, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1EA, $01, 0, 0, 2, 0, $102)
    %spritemapEntry(0, $1F2, $FC, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $1EA, $FC, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $1EA, $EC, 0, 0, 2, 0, $100)

Spritemap_Fune_FacingLeft_MouthMostOpen:
    dw $0008
    %spritemapEntry(0, $00, $0C, 0, 0, 2, 0, $127)
    %spritemapEntry(0, $1F8, $0C, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1F8, $FC, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1F8, $EC, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1E8, $03, 0, 0, 2, 0, $102)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $1E8, $FC, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $1E8, $EC, 0, 0, 2, 0, $100)

Spritemap_Fune_FacingRight_Idle_MouthClosed:
    dw $0008
    %spritemapEntry(0, $1F0, $0C, 0, 1, 2, 0, $127)
    %spritemapEntry(0, $1F8, $0C, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $1F0, $FC, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $1F0, $EC, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $00, $FC, 0, 1, 2, 0, $102)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $08, $FC, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $00, $EC, 0, 1, 2, 0, $100)

Spritemap_Fune_FacingRight_StartOpeningMouth:
    dw $0008
    %spritemapEntry(0, $1F2, $0C, 0, 1, 2, 0, $127)
    %spritemapEntry(0, $1FA, $0C, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $1F2, $FC, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $1F2, $EC, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $02, $FE, 0, 1, 2, 0, $102)
    %spritemapEntry(0, $02, $FC, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $0A, $FC, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $02, $EC, 0, 1, 2, 0, $100)

Spritemap_Fune_FacingRight_MouthOpening1:
    dw $0008
    %spritemapEntry(0, $1F4, $0C, 0, 1, 2, 0, $127)
    %spritemapEntry(0, $1FC, $0C, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $1F4, $FC, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $1F4, $EC, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $04, $00, 0, 1, 2, 0, $102)
    %spritemapEntry(0, $04, $FC, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $0C, $FC, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $04, $EC, 0, 1, 2, 0, $100)

Spritemap_Fune_FacingRight_MouthOpening2:
    dw $0008
    %spritemapEntry(0, $1F6, $0C, 0, 1, 2, 0, $127)
    %spritemapEntry(0, $1FE, $0C, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $1F6, $FC, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $1F6, $EC, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $06, $01, 0, 1, 2, 0, $102)
    %spritemapEntry(0, $06, $FC, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $0E, $FC, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $06, $EC, 0, 1, 2, 0, $100)

Spritemap_Fune_FacingRight_MouthMostOpen:
    dw $0008
    %spritemapEntry(0, $1F8, $0C, 0, 1, 2, 0, $127)
    %spritemapEntry(0, $00, $0C, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $1F8, $FC, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $1F8, $EC, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $07, $02, 0, 1, 2, 0, $102)
    %spritemapEntry(0, $08, $FC, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $10, $FC, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $08, $EC, 0, 1, 2, 0, $100)


;;; $959D: Palette - enemy $E73F (namihe) ;;;
Palette_Namihe:
    dw $3800,$4B9C,$3694,$0929,$0042,$3B18,$2A52,$19AD
    dw $116B,$7F5A,$7EC0,$6DE0,$54E0,$001D,$0014,$000A


;;; $95BD: Instruction list - namihe - facing left - idle ;;;
InstList_Namihe_FacingLeft_Idling:
    dw $0001,Spritemap_Namihe_FacingLeft_Idle_MouthEyeOpened
    dw Instruction_Common_Sleep


;;; $95C3: Instruction list - namihe - facing left - active ;;;
InstList_Namihe_FacingLeft_Active:
    dw $0008,Spritemap_Namihe_FacingLeft_Idle_MouthEyeOpened
    dw $0008,Spritemap_Namihe_FacingLeft_EyeOpened
    dw $0008,Spritemap_Namihe_FacingLeft_StartOpeningMouth
    dw $0008,Spritemap_Namihe_FacingLeft_MouthOpening1
    dw $0008,Spritemap_Namihe_FacingLeft_MouthOpening2
    dw Instruction_Namihe_SpawnFireball_FacingLeft
    dw Instruction_FuneNamihe_QueueSpitSFX
    dw $0008,Spritemap_Namihe_FacingLeft_MouthMostOpen
    dw $0008,Spritemap_Namihe_FacingLeft_MouthOpening2
    dw $0008,Spritemap_Namihe_FacingLeft_MouthOpening1
    dw $0008,Spritemap_Namihe_FacingLeft_StartOpeningMouth
    dw Instruction_FuneNamihe_FinishActivity
    dw Instruction_Common_GotoY
    dw InstList_Namihe_FacingLeft_Idling


;;; $95F1: Instruction list - namihe - facing right - idle ;;;
InstList_Namihe_FacingRight_Idling:
    dw $0001,Spritemap_Namihe_FacingRight_Idle_MouthEyeClosed
    dw Instruction_Common_Sleep


;;; $95F7: Instruction list - namihe - facing right - active ;;;
InstList_Namihe_FacingRight_Active:
    dw $0008,Spritemap_Namihe_FacingRight_Idle_MouthEyeClosed
    dw $0008,Spritemap_Namihe_FacingRight_EyeOpened
    dw $0008,Spritemap_Namihe_FacingRight_StartOpeningMouth
    dw $0008,Spritemap_Namihe_FacingRight_MouthOpening1
    dw $0008,Spritemap_Namihe_FacingRight_MouthOpening2
    dw Instruction_Namihe_SpawnFireball_FacingRight
    dw Instruction_FuneNamihe_QueueSpitSFX
    dw $0008,Spritemap_Namihe_FacingRight_MouthMostOpen
    dw $0008,Spritemap_Namihe_FacingRight_MouthOpening2
    dw $0008,Spritemap_Namihe_FacingRight_MouthOpening1
    dw $0008,Spritemap_Namihe_FacingRight_StartOpeningMouth
    dw Instruction_FuneNamihe_FinishActivity_duplicate
    dw Instruction_Common_GotoY
    dw InstList_Namihe_FacingRight_Idling


;;; $9625: Instruction - queue fune spits sound effect ;;;
Instruction_FuneNamihe_QueueSpitSFX:
    PHY : PHX
    LDA.W #$001F
    JSL QueueSound_Lib2_Max9
    PLX : PLY
    RTL


;;; $9631: Instruction - spawn leftwards namihe fireball ;;;
Instruction_Namihe_SpawnFireball_FacingLeft:
    PHY
    LDX.W EnemyIndex
    LDA.W Enemy.init1,X : AND.W #$00FF : STA.W EnemyProjectile_InitParam1
    LDA.W #$0000
    LDY.W #EnemyProjectile_NamiheFireball
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    PLY
    RTL


;;; $964A: Instruction - spawn rightwards namihe fireball ;;;
Instruction_Namihe_SpawnFireball_FacingRight:
    PHY
    LDX.W EnemyIndex
    LDA.W Enemy.init1,X : AND.W #$00FF : STA.W EnemyProjectile_InitParam1
    LDA.W #$0001
    LDY.W #EnemyProjectile_NamiheFireball
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    PLY
    RTL


;;; $9663: Instruction - spawn leftwards fune fireball ;;;
Instruction_Fune_SpawnFireball_FacingLeft:
    PHY
    LDX.W EnemyIndex
    LDA.W Enemy.init1,X : AND.W #$00FF : STA.W EnemyProjectile_InitParam1
    LDA.W #$0000
    LDY.W #EnemyProjectile_FuneFireball
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    PLY
    RTL


;;; $967C: Instruction - spawn rightwards fune fireball ;;;
Instruction_Fune_SpawnFireball_FacingRight:
    PHY
    LDX.W EnemyIndex
    LDA.W Enemy.init1,X : AND.W #$00FF : STA.W EnemyProjectile_InitParam1
    LDA.W #$0001
    LDY.W #EnemyProjectile_FuneFireball
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    PLY
    RTL


;;; $9695: Instruction - finish activity ;;;
Instruction_FuneNamihe_FinishActivity:
    LDX.W EnemyIndex
    LDA.W FuneNamihe.instListPointersPointer,X : INC #4 : STA.W FuneNamihe.instListPointersPointer,X
    LDA.W #Function_Fune_WaitForTimer : STA.W FuneNamihe.function,X
    LDA.W FuneNamihe.variantIndex,X : BEQ .return
    LDA.W #Function_Namihe_WaitForSamusToGetNear : STA.W FuneNamihe.function,X

  .return:
    RTL


;;; $96B4: Instruction - finish activity ;;;
Instruction_FuneNamihe_FinishActivity_duplicate:
; Clone of Instruction_FuneNamihe_FinishActivity
    LDX.W EnemyIndex
    LDA.W FuneNamihe.instListPointersPointer,X : INC #4 : STA.W FuneNamihe.instListPointersPointer,X
    LDA.W #Function_Fune_WaitForTimer : STA.W FuneNamihe.function,X
    LDA.W FuneNamihe.variantIndex,X : BEQ .return
    LDA.W #Function_Namihe_WaitForSamusToGetNear : STA.W FuneNamihe.function,X

  .return:
    RTL


;;; $96D3: Instruction list pointers ;;;
InstListPointers_Fune_Namihe:
    dw InstList_Fune_FacingLeft_Active
    dw InstList_Fune_FacingRight_Active
    dw InstList_Fune_FacingLeft_Idling
    dw InstList_Fune_FacingRight_Idling
    dw InstList_Namihe_FacingLeft_Active
    dw InstList_Namihe_FacingRight_Active
    dw InstList_Namihe_FacingLeft_Idling
    dw InstList_Namihe_FacingRight_Idling


;;; $96E3: Initialisation AI - enemy $E6FF/$E73F (fune / namihe) ;;;
InitAI_Fune_Namihe:
    LDX.W EnemyIndex
    LDA.W #InstListPointers_Fune_Namihe+$4 : STA.W FuneNamihe.instListPointersPointer,X
    LDA.W #Function_Fune_WaitForTimer : STA.W FuneNamihe.function,X
    LDA.W Enemy.init0,X : AND.W #$000F : STA.W FuneNamihe.variantIndex,X : BEQ .speciesDetermined
    LDA.W #InstListPointers_Fune_Namihe+$C : STA.W FuneNamihe.instListPointersPointer,X
    LDA.W #Function_Namihe_WaitForSamusToGetNear : STA.W FuneNamihe.function,X

  .speciesDetermined:
    LDA.W Enemy.init0,X : AND.W #$00F0 : BEQ .directionDetermined
    INC.W FuneNamihe.instListPointersPointer,X : INC.W FuneNamihe.instListPointersPointer,X

  .directionDetermined:
    JSR SetFuneNamiheInstList
    LDA.W Enemy.init1+1,X : AND.W #$00FF : STA.W FuneNamihe.YProximity,X
    LDA.W Enemy.init0+1,X : AND.W #$00FF : STA.W FuneNamihe.cooldownTime,X
    STZ.W FuneNamihe.cooldownTimer,X
    RTL


;;; $9730: Main AI - enemy $E6FF/$E73F (fune / namihe) ;;;
MainAI_Fune_Namihe:
    LDX.W EnemyIndex
    JSR.W (FuneNamihe.function,X)
    RTL


;;; $9737: Fune / namihe function - wait for timer (fune) ;;;
Function_Fune_WaitForTimer:
    LDX.W EnemyIndex ; >.<
    INC.W FuneNamihe.cooldownTimer,X
    LDA.W FuneNamihe.cooldownTimer,X : CMP.W FuneNamihe.cooldownTime,X : BMI .return
    LDA.W FuneNamihe.instListPointersPointer,X : DEC #4 : STA.W FuneNamihe.instListPointersPointer,X
    JSR SetFuneNamiheInstList
    LDA.W #RTS_A8978E : STA.W FuneNamihe.function,X
    STZ.W FuneNamihe.cooldownTimer,X

  .return:
    RTS


;;; $975C: Fune / namihe function - wait for Samus to get near (namihe) ;;;
Function_Namihe_WaitForSamusToGetNear:
    LDX.W EnemyIndex ; >.<
    LDA.W FuneNamihe.instListPointersPointer,X : STA.L ExtraEnemy7800,X
    JSR Namihe_CheckIfSamusIsInProximity
    BEQ .notInProximity
    LDA.L ExtraEnemy7800,X : STA.W FuneNamihe.instListPointersPointer,X
    DEC #4 : STA.L ExtraEnemy7800,X : STA.W FuneNamihe.instListPointersPointer,X
    JSR SetFuneNamiheInstList
    LDA.W #RTS_A8978F : STA.W FuneNamihe.function,X

  .notInProximity:
    LDA.L ExtraEnemy7800,X : STA.W FuneNamihe.instListPointersPointer,X
    RTS


;;; $978E: RTS ;;;
RTS_A8978E:
    RTS


;;; $978F: RTS ;;;
RTS_A8978F:
    RTS


;;; $9790: Check if Samus is in proximity ;;;
Namihe_CheckIfSamusIsInProximity:
;; Returns:
;;     Zero: Clear if Samus is in proximity, set otherwise
    LDX.W EnemyIndex ; >.<
    LDA.W FuneNamihe.YProximity,X
    JSL IsSamusWithingAPixelRowsOfEnemy
    RTS


;;; $979B: Set fune / namihe instruction list ;;;
SetFuneNamiheInstList:
    LDX.W EnemyIndex
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.W FuneNamihe.instListPointersPointer,X : TAY
    LDA.W $0000,Y : STA.W Enemy.instList,X
    RTS


;;; $97B2: RTL ;;;
RTL_A897B2:
    RTL


;;; $97B3: RTL ;;;
RTL_A897B3:
    RTL


;;; $97B4: Namihe spritemaps ;;;
Spritemap_Namihe_FacingLeft_Idle_MouthEyeOpened:
    dw $0008
    %spritemapEntry(0, $08, $0C, 0, 0, 2, 0, $127)
    %spritemapEntry(0, $00, $0C, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $00, $FC, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $00, $EC, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $106)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 0, $135)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $134)
    %spritemapEntry(1, $1F0, $EC, 0, 0, 2, 0, $104)

Spritemap_Namihe_FacingLeft_EyeOpened:
    dw $0008
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $106)
    %spritemapEntry(0, $1F8, $EC, 0, 0, 2, 0, $105)
    %spritemapEntry(0, $1F0, $EC, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1F0, $F4, 0, 0, 2, 0, $108)
    %spritemapEntry(0, $08, $0C, 0, 0, 2, 0, $127)
    %spritemapEntry(0, $00, $0C, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $00, $FC, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $00, $EC, 0, 0, 2, 0, $120)

Spritemap_Namihe_FacingLeft_StartOpeningMouth:
    dw $0008
    %spritemapEntry(1, $1EE, $02, 0, 0, 2, 0, $106)
    %spritemapEntry(0, $1F6, $EC, 0, 0, 2, 0, $105)
    %spritemapEntry(0, $1EE, $EC, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1EE, $F4, 0, 0, 2, 0, $108)
    %spritemapEntry(0, $06, $0C, 0, 0, 2, 0, $127)
    %spritemapEntry(0, $1FE, $0C, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1FE, $FC, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1FE, $EC, 0, 0, 2, 0, $120)

Spritemap_Namihe_FacingLeft_MouthOpening1:
    dw $0008
    %spritemapEntry(1, $1EC, $03, 0, 0, 2, 0, $106)
    %spritemapEntry(0, $1F4, $EC, 0, 0, 2, 0, $105)
    %spritemapEntry(0, $1EC, $EC, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1EC, $F4, 0, 0, 2, 0, $108)
    %spritemapEntry(0, $04, $0C, 0, 0, 2, 0, $127)
    %spritemapEntry(0, $1FC, $0C, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1FC, $FC, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1FC, $EC, 0, 0, 2, 0, $120)

Spritemap_Namihe_FacingLeft_MouthOpening2:
    dw $0008
    %spritemapEntry(1, $1EA, $04, 0, 0, 2, 0, $106)
    %spritemapEntry(0, $1F2, $EC, 0, 0, 2, 0, $105)
    %spritemapEntry(0, $1EA, $EC, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1EA, $F4, 0, 0, 2, 0, $108)
    %spritemapEntry(0, $02, $0C, 0, 0, 2, 0, $127)
    %spritemapEntry(0, $1FA, $0C, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1FA, $FC, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1FA, $EC, 0, 0, 2, 0, $120)

Spritemap_Namihe_FacingLeft_MouthMostOpen:
    dw $0008
    %spritemapEntry(1, $1E9, $05, 0, 0, 2, 0, $106)
    %spritemapEntry(0, $1F0, $EC, 0, 0, 2, 0, $105)
    %spritemapEntry(0, $1E8, $EC, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1E8, $F4, 0, 0, 2, 0, $108)
    %spritemapEntry(0, $00, $0C, 0, 0, 2, 0, $127)
    %spritemapEntry(0, $1F8, $0C, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1F8, $FC, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1F8, $EC, 0, 0, 2, 0, $120)

Spritemap_Namihe_FacingRight_Idle_MouthEyeClosed:
    dw $0008
    %spritemapEntry(0, $1F0, $0C, 0, 1, 2, 0, $127)
    %spritemapEntry(0, $1F8, $0C, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $1F0, $FC, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $1F0, $EC, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $00, $00, 0, 1, 2, 0, $106)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 0, $135)
    %spritemapEntry(0, $08, $FC, 0, 1, 2, 0, $134)
    %spritemapEntry(1, $00, $EC, 0, 1, 2, 0, $104)

Spritemap_Namihe_FacingRight_EyeOpened:
    dw $0008
    %spritemapEntry(1, $00, $00, 0, 1, 2, 0, $106)
    %spritemapEntry(0, $00, $EC, 0, 1, 2, 0, $105)
    %spritemapEntry(0, $08, $EC, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $00, $F4, 0, 1, 2, 0, $108)
    %spritemapEntry(0, $1F0, $0C, 0, 1, 2, 0, $127)
    %spritemapEntry(0, $1F8, $0C, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $1F0, $FC, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $1F0, $EC, 0, 1, 2, 0, $120)

Spritemap_Namihe_FacingRight_StartOpeningMouth:
    dw $0008
    %spritemapEntry(1, $02, $02, 0, 1, 2, 0, $106)
    %spritemapEntry(0, $02, $EC, 0, 1, 2, 0, $105)
    %spritemapEntry(0, $0A, $EC, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $02, $F4, 0, 1, 2, 0, $108)
    %spritemapEntry(0, $1F2, $0C, 0, 1, 2, 0, $127)
    %spritemapEntry(0, $1FA, $0C, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $1F2, $FC, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $1F2, $EC, 0, 1, 2, 0, $120)

Spritemap_Namihe_FacingRight_MouthOpening1:
    dw $0008
    %spritemapEntry(1, $04, $03, 0, 1, 2, 0, $106)
    %spritemapEntry(0, $04, $EC, 0, 1, 2, 0, $105)
    %spritemapEntry(0, $0C, $EC, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $04, $F4, 0, 1, 2, 0, $108)
    %spritemapEntry(0, $1F4, $0C, 0, 1, 2, 0, $127)
    %spritemapEntry(0, $1FC, $0C, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $1F4, $FC, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $1F4, $EC, 0, 1, 2, 0, $120)

Spritemap_Namihe_FacingRight_MouthOpening2:
    dw $0008
    %spritemapEntry(1, $06, $04, 0, 1, 2, 0, $106)
    %spritemapEntry(0, $06, $EC, 0, 1, 2, 0, $105)
    %spritemapEntry(0, $0E, $EC, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $06, $F4, 0, 1, 2, 0, $108)
    %spritemapEntry(0, $1F6, $0C, 0, 1, 2, 0, $127)
    %spritemapEntry(0, $1FE, $0C, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $1F6, $FC, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $1F6, $EC, 0, 1, 2, 0, $120)

Spritemap_Namihe_FacingRight_MouthMostOpen:
    dw $0008
    %spritemapEntry(1, $07, $05, 0, 1, 2, 0, $106)
    %spritemapEntry(0, $08, $EC, 0, 1, 2, 0, $105)
    %spritemapEntry(0, $10, $EC, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $08, $F4, 0, 1, 2, 0, $108)
    %spritemapEntry(0, $1F8, $0C, 0, 1, 2, 0, $127)
    %spritemapEntry(0, $00, $0C, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $1F8, $FC, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $1F8, $EC, 0, 1, 2, 0, $120)


;;; $99AC: Palette - enemy $E77F (coven) ;;;
Palette_Coven:
    dw $3800,$57FF,$42F7,$0929,$00A5,$4F5A,$36B5,$2610
    dw $1DCE,$01DF,$001F,$0018,$000A,$06B9,$00EA,$0045


if !FEATURE_KEEP_UNREFERENCED
;;; $99CC: Unused. Black palettes ;;;
UNUSED_Coven_BlackPalettes_A899CC:
    dw $3800,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $3800,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $3800,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $3800,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $3800,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $3800,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $9A8C: Instruction list - coven ;;;
InstList_Coven:
    dw $0010,Spritemap_Coven_0
    dw $0010,Spritemap_Coven_1
    dw $0010,Spritemap_Coven_2
    dw Instruction_Common_GotoY
    dw InstList_Coven


CovenConstants:
  .SamusMovementCounterThreshold:
; Number of times Samus has to move in the same direction to materialise
    dw $0010

  .SamusStationaryFramesThreshold:
; Number of frames Samus has to remain stationary to materialise
    dw $0040

  .HoveringYAccelerationDeceleration:
; Hovering Y acceleration/deceleration
    dw $1800

  .InitialHoveringYVelocity:
; Initial hovering Y velocity
    dw $0001

  .SleepTimer:
; Number of frames to sleep after dematerialising
    dw $0078

  .MaterializeTimer:
; Number of frames to be materialised for
    dw $0078

  .OffsetsFromSamusToMaterialize:
; X/Y offsets from Samus position to materialise when Samus has been moving a given direction
  ..X:
    dw $FFC0
  ..Y:
    dw       $FFC0 ; 0: Up-left
    dw $0000,$FFC0 ; 4: Up
    dw $0040,$0000 ; 8: Up-right
    dw $FFC0,$0000 ; Ch: Left
    dw $0000,$0000 ; 10h: None (dummy)
    dw $0040,$0000 ; 14h: Right
    dw $FFC0,$0040 ; 18h: Down-left
    dw $0000,$0040 ; 1Ch: Down
    dw $0040,$0040 ; 20h: Down-right


CovenPaletteTransitionDelayTable:
; Palette transition delay table
    dw $0001,$0008,$0001,$0008,$0001,$0007,$0001,$0007
    dw $0002,$0006,$0002,$0006,$0003,$0005,$0003,$0005
    dw $FFFF


;;; $9AEE: Initialisation AI - enemy $E77F (coven) ;;;
InitAI_Coven:
    LDX.W EnemyIndex
    LDA.W Enemy.properties,X : ORA.W #$2500 : STA.W Enemy.properties,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.W #InstList_Coven : STA.W Enemy.instList,X
    LDA.W #Function_Coven_Dematerialized_Asleep : STA.W Coven.function,X
    LDA.W CovenConstants_SleepTimer : CLC : ADC.W #$00A0 : STA.W Coven.functionTimer,X
    LDX.W EnemyIndex ; >.<
    LDA.W Enemy.palette,X : XBA : ASL #4
    CLC : ADC.W #$0100 : TAX
    LDA.W #$0010 : STA.B DP_Temp12
    LDA.W #$0000

  .loop:
    STA.L TargetPalettes_BGP0,X
    INX #2
    DEC.B DP_Temp12 : BPL .loop
    RTL


;;; $9B3C: Main AI - enemy $E77F (coven) ;;;
MainAI_Coven:
    LDX.W EnemyIndex
    JMP.W (Coven.function,X)


;;; $9B42: Coven function - materialising - fade to white ;;;
Function_Coven_Materialize_FadeToWhite:
; You only see this fade to white transition once where it transitions from the initial black palette
; On subsequent calls to this function, it will already have a white palette from the dematerialisation fade to white
    PHX
    JSR HandleFadeInTimerAndIndex
    LDY.W #$0010
    LDX.W EnemyIndex
    LDA.W Enemy.palette,X : XBA : ASL #4
    CLC : ADC.W #$0100 : TAX
    LDA.W #$0010 : STA.B DP_Temp12

  .loopUpper:
    LDA.L Palettes,X : AND.W #$001F : CMP.W #$001F : BPL .next
    LDA.L Palettes,X : CLC : ADC.W #$0421 : STA.L Palettes,X
    DEY

  .next:
    INX #2
    DEC.B DP_Temp12 : BNE .loopUpper
    CPY.W #$0010 : BMI .return
    LDX.W EnemyIndex
    LDA.W #Function_Coven_Materialize_FadeFromWhite : STA.W Coven.function,X
    LDA.W Enemy.palette,X : XBA : ASL #4
    CLC : ADC.W #$0100 : TAX
    LDY.W #$0000

  .loopLower:
    LDA.W Palette_Coven,Y : STA.L TargetPalettes_BGP0,X
    INX #2
    INY #2 : CPY.W #$0020 : BMI .loopLower

  .return:
    PLX
    RTL


;;; $9BAD: Coven function - materialising - fade from white ;;;
Function_Coven_Materialize_FadeFromWhite:
    JSR AdvanceCovenPaletteTransition
    PHA
    LDX.W EnemyIndex
    JSR HandleFadeInTimerAndIndex
    PLA : ORA.W Coven.functionTimer,X : BNE .return
    LDA.W Enemy.properties,X : AND.W #$FBFF : AND.W #$FEFF : STA.W Enemy.properties,X ; >.< #$FAFF
    LDA.W #Function_Coven_Materialized : STA.W Coven.function,X
    LDA.W Enemy.YPosition,X : STA.L Coven.hoverCenterYPosition,X
    LDA.W #$0001 : STA.W Coven.functionTimer,X
    LDA.W #$0002 : STA.W Coven.paletteTransitionDelayIndex,X
    LDA.W #$0000 : STA.L Coven.YSubVelocity,X
    LDA.W CovenConstants_InitialHoveringYVelocity : STA.L Coven.YVelocity,X
    LDA.W CovenConstants_MaterializeTimer : STA.W Coven.functionTimer,X
    LDA.W #$0004 : STA.L Coven.previousSamusXMovementDirection,X
    LDA.W SamusXPosition : STA.L Coven.previousSamusXPosition,X
    STA.L Coven.zoneLeftPosition,X : STA.L Coven.zoneRightPosition,X
    LDA.W #$000C : STA.L Coven.previousSamusYMovementDirection,X
    LDA.W SamusYPosition,X : STA.L Coven.previousSamusYPosition,X
    STA.L Coven.zoneTopPosition,X : STA.L Coven.zoneBottomPosition,X
    LDA.W CovenConstants_SamusStationaryFramesThreshold : STA.L Coven.lockOnTimer,X
    LDA.W CovenConstants_SamusMovementCounterThreshold : STA.L Coven.directedMovementTimer,X

  .return:
    RTL


;;; $9C31: Process coven palette transition delay ;;;
HandleFadeInTimerAndIndex:
    LDA.W Coven.functionTimer,X : BEQ .timerExpired
    DEC : STA.W Coven.functionTimer,X : BNE .return
    LDA.W Coven.paletteTransitionDelayIndex,X : TAY
    LDA.W CovenPaletteTransitionDelayTable,Y : BMI .terminator
    STA.W Coven.functionTimer,X
    TYA : INC #2 : STA.W Coven.paletteTransitionDelayIndex,X
    TYA : BIT.W #$0002 : BEQ .timerExpired

  .return:
    RTS

  .timerExpired:
    LDA.W Enemy.properties,X : AND.W #$FEFF : STA.W Enemy.properties,X
    RTS

  .terminator:
    LDA.W #$0000 : STA.W Coven.functionTimer,X : STA.W Coven.paletteTransitionDelayIndex,X
    RTS


;;; $9C69: Coven function - dematerialising ;;;
Function_Coven_Dematerializing:
    JSR AdvanceCovenPaletteTransition
    CMP.W #$0000 : BNE .return
    LDX.W EnemyIndex
    LDA.W #Function_Coven_Dematerialized_Asleep : STA.W Coven.function,X
    LDA.W Enemy.properties,X : ORA.W #$0100 : STA.W Enemy.properties,X
    LDA.W CovenConstants_SleepTimer : STA.W Coven.functionTimer,X

  .return:
    RTL


;;; $9C8A: Coven function - materialised ;;;
Function_Coven_Materialized:
    LDA.W Enemy.YSubPosition,X : CLC : ADC.L Coven.YSubVelocity,X : STA.W Enemy.YSubPosition,X
    LDA.W Enemy.YPosition,X : ADC.L Coven.YVelocity,X : STA.W Enemy.YPosition,X
    LDA.W Enemy.YPosition,X : CMP.L Coven.hoverCenterYPosition,X : BMI .subvelocity
    LDA.L Coven.YSubVelocity,X : SEC : SBC.W CovenConstants_HoveringYAccelerationDeceleration : STA.L Coven.YSubVelocity,X
    LDA.L Coven.YVelocity,X : SBC.W #$0000 : STA.L Coven.YVelocity,X
    BRA +

  .subvelocity:
    LDA.L Coven.YSubVelocity,X : CLC : ADC.W CovenConstants_HoveringYAccelerationDeceleration : STA.L Coven.YSubVelocity,X
    LDA.L Coven.YVelocity,X : ADC.W #$0000 : STA.L Coven.YVelocity,X

+   LDA.W Coven.functionTimer,X : DEC : STA.W Coven.functionTimer,X : BNE .return
    LDA.W #Function_Coven_Dematerializing : STA.W Coven.function,X
    LDA.W Enemy.properties,X : ORA.W #$0400 : STA.W Enemy.properties,X
    LDX.W EnemyIndex
    LDA.W Enemy.palette,X : XBA : ASL #4
    CLC : ADC.W #$0100 : TAX
    LDA.W #$0010 : STA.B DP_Temp12
    LDA.W #$7FFF

  .loop:
    STA.L TargetPalettes_BGP0,X
    INX #2
    DEC.B DP_Temp12 : BPL .loop

  .return:
    RTL


;;; $9D13: Coven function - dematerialised - asleep ;;;
Function_Coven_Dematerialized_Asleep:
    LDA.W Coven.functionTimer,X : BEQ .timerExpired
    DEC : STA.W Coven.functionTimer,X : BNE .return

  .timerExpired:
    LDA.W #$0001 : STA.W Coven.functionTimer,X
    LDA.W #$0002 : STA.W Coven.paletteTransitionDelayIndex,X
    LDA.W #Function_Coven_Dematerialized_Awake : STA.W Coven.function,X

  .return:
    RTL


;;; $9D31: RTL ;;;
RTL_A89D31:
    RTL


;;; $9D32: Coven stationary zone radii ;;;
; Number of pixels of tolerance to consider Samus stationary for the materialisation check
CovenStationaryZoneXRadius:
    dw $0001

CovenStationaryZoneYRadius:
    dw $0001


;;; $9D36: Coven function - dematerialised - awake ;;;
Function_Coven_Dematerialized_Awake:
; The Samus position loads at $9D45 / $9DC3 / $9DCD are erroneously being indexed by X, which is the enemy index
; Consequently, this code has unexpected results if the enemy is not enemy slot 0

; Materialise if Samus has moved at most 1px/frame for 40h frames (tracked by the "lock-on timer" and "zone" variables)
; or has moved more than 1px/frame in the same direction 10h times (tracked by the "directed movement timer" and "previous Samus" variables)
    LDA.W SamusXPosition : CMP.L Coven.zoneLeftPosition,X : BMI .breakLockOn
    CMP.L Coven.zoneRightPosition,X : BPL .breakLockOn
    LDA.W SamusYPosition,X : CMP.L Coven.zoneTopPosition,X : BMI .breakLockOn
    CMP.L Coven.zoneBottomPosition,X : BPL .breakLockOn
    LDA.L Coven.lockOnTimer,X : DEC : STA.L Coven.lockOnTimer,X : BEQ +
    JMP .updateZone

+   LDA.W #$0004 : STA.L Coven.previousSamusXMovementDirection,X
    LDA.W #$000C : STA.L Coven.previousSamusYMovementDirection,X
    BRA .materialize

  .breakLockOn:
    LDA.W CovenConstants_SamusStationaryFramesThreshold : STA.L Coven.lockOnTimer,X
    LDY.W #$0000
    LDA.W SamusXPosition : SEC : SBC.L Coven.previousSamusXPosition,X : BMI .checkXMovementDirection
    BEQ .noXMovement
    LDY.W #$0008
    BRA .checkXMovementDirection

  .noXMovement:
    LDY.W #$0004

  .checkXMovementDirection:
    TYA : CMP.L Coven.previousSamusXMovementDirection,X : BEQ .checkYMovement
    TYA : STA.L Coven.previousSamusXMovementDirection,X
    LDA.W CovenConstants_SamusMovementCounterThreshold : STA.L Coven.directedMovementTimer,X
    BRA .updateZone

  .materialize:
    LDA.W #Function_Coven_Materialize_FadeToWhite : STA.W Coven.function,X
    LDA.W CovenConstants_SamusStationaryFramesThreshold : STA.L Coven.lockOnTimer,X
    LDA.W CovenConstants_SamusMovementCounterThreshold : STA.L Coven.directedMovementTimer,X
    LDA.L Coven.previousSamusXMovementDirection,X : CLC : ADC.L Coven.previousSamusYMovementDirection,X : TAY
    LDA.W SamusXPosition,X : CLC : ADC.W CovenConstants_OffsetsFromSamusToMaterialize_X,Y : STA.W Enemy.XPosition,X
    LDA.W SamusYPosition,X : CLC : ADC.W CovenConstants_OffsetsFromSamusToMaterialize_Y,Y : STA.W Enemy.YPosition,X
    RTL

  .checkYMovement:
    LDY.W #$0000
    LDA.W SamusYPosition : SEC : SBC.L Coven.previousSamusYPosition,X : BMI .checkYMovementDirection
    BEQ .noYMovement
    LDY.W #$0018
    BRA .checkYMovementDirection

  .noYMovement:
    LDY.W #$000C

  .checkYMovementDirection:
    TYA : CMP.L Coven.previousSamusYMovementDirection,X : BEQ .matchingYMovementDirection
    TYA : STA.L Coven.previousSamusYMovementDirection,X
    LDA.W CovenConstants_SamusMovementCounterThreshold : STA.L Coven.directedMovementTimer,X
    BRA .updateZone

  .matchingYMovementDirection:
    LDA.L Coven.directedMovementTimer,X : DEC : STA.L Coven.directedMovementTimer,X : BEQ .materialize

  .updateZone:
    LDA.W SamusXPosition : STA.L Coven.previousSamusXPosition,X
    SEC : SBC.W CovenStationaryZoneXRadius : STA.L Coven.zoneLeftPosition,X
    LDA.W SamusXPosition : CLC : ADC.W CovenStationaryZoneXRadius : STA.L Coven.zoneRightPosition,X
    LDA.W SamusYPosition : STA.L Coven.previousSamusYPosition,X
    SEC : SBC.W CovenStationaryZoneYRadius : STA.L Coven.zoneTopPosition,X
    LDA.W SamusYPosition : CLC : ADC.W CovenStationaryZoneYRadius : STA.L Coven.zoneBottomPosition,X
    RTL


;;; $9E44: RTL ;;;
RTL_A89E44:
    RTL


;;; $9E45: RTL ;;;
RTL_A89E45:
    RTL


;;; $9E46: Coven spritemaps ;;;
Spritemap_Coven_0:
    dw $0004
    %spritemapEntry(1, $00, $00, 0, 0, 3, 0, $106)
    %spritemapEntry(1, $1F0, $00, 0, 0, 3, 0, $104)
    %spritemapEntry(1, $00, $F0, 0, 0, 3, 0, $102)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 3, 0, $100)

Spritemap_Coven_1:
    dw $0004
    %spritemapEntry(1, $00, $00, 0, 0, 3, 0, $10A)
    %spritemapEntry(1, $1F0, $00, 0, 0, 3, 0, $108)
    %spritemapEntry(1, $00, $F0, 0, 0, 3, 0, $102)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 3, 0, $100)

Spritemap_Coven_2:
    dw $0004
    %spritemapEntry(1, $00, $00, 0, 0, 3, 0, $10E)
    %spritemapEntry(1, $1F0, $00, 0, 0, 3, 0, $10C)
    %spritemapEntry(1, $00, $F0, 0, 0, 3, 0, $102)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 3, 0, $100)


;;; $9E88: Advance coven palette transition ;;;
AdvanceCovenPaletteTransition:
;; Returns:
;;     A: Zero if completed transition, non-zero otherwise
    PHP : PHX : PHY
    REP #$30
    LDY.W #$0000
    LDA.W DoorTransitionFlagEnemiesPause : BEQ .notDoorTransition
    JMP .return

  .notDoorTransition:
    LDX.W EnemyIndex
    LDA.W Enemy.palette,X : XBA : ASL #4
    CLC : ADC.W #$0100 : TAX
    CLC : ADC.W #$0020 : STA.B DP_Temp14

  .loop:
    LDA.L TargetPalettes_BGP0,X : CMP.L Palettes,X : BNE .notReachedTarget
    JMP .next

  .notReachedTarget:
    AND.W #$001F : STA.B DP_Temp12
    LDA.L Palettes,X : AND.W #$001F : CMP.B DP_Temp12 : BEQ .redEnd
    BPL .notReachedRedTarget
    INC
    BRA +

  .notReachedRedTarget:
    DEC

+   STA.B DP_Temp12
    LDA.L Palettes,X : AND.W #$FFE0 : ORA.B DP_Temp12 : STA.L Palettes,X
    INY

  .redEnd:
    LDA.L TargetPalettes_BGP0,X : AND.W #$03E0 : STA.B DP_Temp12
    LDA.L Palettes,X : AND.W #$03E0 : CMP.B DP_Temp12 : BEQ .greenEnd
    BPL .notReachedGreenTarget
    CLC : ADC.W #$0020
    BRA +

  .notReachedGreenTarget:
    SEC : SBC.W #$0020

+   STA.B DP_Temp12
    LDA.L Palettes,X : AND.W #$FC1F : ORA.B DP_Temp12 : STA.L Palettes,X
    INY

  .greenEnd:
    LDA.L TargetPalettes_BGP0,X : AND.W #$7C00 : STA.B DP_Temp12
    LDA.L Palettes,X : AND.W #$7C00 : CMP.B DP_Temp12 : BEQ .next
    BPL .notReachedBlueTarget
    CLC : ADC.W #$0400
    BRA +

  .notReachedBlueTarget:
    SEC : SBC.W #$0400

+   STA.B DP_Temp12
    LDA.L Palettes,X : AND.W #$83FF : ORA.B DP_Temp12 : STA.L Palettes,X
    INY

  .next:
    INX #2 : CPX.B DP_Temp14 : BPL .return
    JMP .loop

  .return:
    TYA
    PLY : PLX : PLP
    RTS


;;; $9F4F: Palette - enemy $E7BF (yapping maw) ;;;
Palette_YappingMaw:
    dw $3800,$57FF,$42F7,$0929,$00A5,$4F5A,$36B5,$2610
    dw $1DCE,$0000,$0000,$0000,$0000,$0000,$0000,$0000


;;; $9F6F: Instruction list - attacking - facing up / initial - facing up ;;;
InstList_YappingMaw_Attacking_FacingUp:
    dw $0005,Spritemap_YappingMaw_0
    dw $0003,Spritemap_YappingMaw_1
    dw Instruction_YappingMaw_QueueSFXIfOnScreen
    dw $0050,Spritemap_YappingMaw_2
    dw $0003,Spritemap_YappingMaw_1
    dw Instruction_Common_GotoY
    dw InstList_YappingMaw_Attacking_FacingUp


;;; $9F85: Instruction list - attacking - facing up-right ;;;
InstList_YappingMaw_Attacking_FacingUpRight:
    dw $0005,Spritemap_YappingMaw_3
    dw $0003,Spritemap_YappingMaw_4
    dw Instruction_YappingMaw_QueueSFXIfOnScreen
    dw $0050,Spritemap_YappingMaw_5
    dw $0003,Spritemap_YappingMaw_4
    dw Instruction_Common_GotoY
    dw InstList_YappingMaw_Attacking_FacingUpRight


;;; $9F9B: Instruction list - attacking - facing right ;;;
InstList_YappingMaw_Attacking_FacingRight:
    dw $0005,Spritemap_YappingMaw_6
    dw $0003,Spritemap_YappingMaw_7
    dw Instruction_YappingMaw_QueueSFXIfOnScreen
    dw $0050,Spritemap_YappingMaw_8
    dw $0003,Spritemap_YappingMaw_7
    dw Instruction_Common_GotoY
    dw InstList_YappingMaw_Attacking_FacingRight


;;; $9FB1: Instruction list - attacking - facing down-right ;;;
InstList_YappingMaw_Attacking_FacingDownRight:
    dw $0005,Spritemap_YappingMaw_9
    dw $0003,Spritemap_YappingMaw_A
    dw Instruction_YappingMaw_QueueSFXIfOnScreen
    dw $0050,Spritemap_YappingMaw_B
    dw $0003,Spritemap_YappingMaw_A
    dw Instruction_Common_GotoY
    dw InstList_YappingMaw_Attacking_FacingDownRight


;;; $9FC7: Instruction list - attacking - facing down / initial - facing down ;;;
InstList_YappingMaw_Attacking_FacingDown:
    dw $0005,Spritemap_YappingMaw_C
    dw $0003,Spritemap_YappingMaw_D
    dw Instruction_YappingMaw_QueueSFXIfOnScreen
    dw $0050,Spritemap_YappingMaw_E
    dw $0003,Spritemap_YappingMaw_D
    dw Instruction_Common_GotoY
    dw InstList_YappingMaw_Attacking_FacingDown


;;; $9FDD: Instruction list - attacking - facing down-left ;;;
InstList_YappingMaw_Attacking_FacingDownLeft:
    dw $0005,Spritemap_YappingMaw_F
    dw $0003,Spritemap_YappingMaw_10
    dw Instruction_YappingMaw_QueueSFXIfOnScreen
    dw $0050,Spritemap_YappingMaw_11
    dw $0003,Spritemap_YappingMaw_10
    dw Instruction_Common_GotoY
    dw InstList_YappingMaw_Attacking_FacingDownLeft


;;; $9FF3: Instruction list - attacking - facing left ;;;
InstList_YappingMaw_Attacking_FacingLeft:
    dw $0005,Spritemap_YappingMaw_12
    dw $0003,Spritemap_YappingMaw_13
    dw Instruction_YappingMaw_QueueSFXIfOnScreen
    dw $0050,Spritemap_YappingMaw_14
    dw $0003,Spritemap_YappingMaw_13
    dw Instruction_Common_GotoY
    dw InstList_YappingMaw_Attacking_FacingLeft


;;; $A009: Instruction list - attacking - facing up-left ;;;
InstList_YappingMaw_Attacking_FacingUpLeft:
    dw $0005,Spritemap_YappingMaw_15
    dw $0003,Spritemap_YappingMaw_16
    dw Instruction_YappingMaw_QueueSFXIfOnScreen
    dw $0050,Spritemap_YappingMaw_17
    dw $0003,Spritemap_YappingMaw_16
    dw Instruction_Common_GotoY
    dw InstList_YappingMaw_Attacking_FacingUpLeft


;;; $A01F: Instruction list - cooldown - facing up-right ;;;
InstList_YappingMaw_Cooldown_FacingUpRight:
    dw Instruction_YappingMaw_OffsetSamusUpRight
    dw $0004,Spritemap_YappingMaw_5


;;; $A025: Instruction list - cooldown - facing up ;;;
InstList_YappingMaw_Cooldown_FacingUp_0:
    dw Instruction_YappingMaw_OffsetSamusUp

InstList_YappingMaw_Cooldown_FacingUp_1:
    dw $0050,Spritemap_YappingMaw_2
    dw $0003,Spritemap_YappingMaw_1
    dw $0005,Spritemap_YappingMaw_0
    dw $0003,Spritemap_YappingMaw_1
    dw Instruction_YappingMaw_QueueSFXIfOnScreen
    dw Instruction_Common_GotoY
    dw InstList_YappingMaw_Cooldown_FacingUp_1


;;; $A03D: Instruction list - cooldown - facing up-left ;;;
InstList_YappingMaw_Cooldown_FacingUpLeft_0:
    dw Instruction_YappingMaw_OffsetSamusUpLeft
    dw $0004,Spritemap_YappingMaw_17
    dw Instruction_YappingMaw_OffsetSamusUp

InstList_YappingMaw_Cooldown_FacingUpLeft_1:
    dw $0050,Spritemap_YappingMaw_2
    dw $0003,Spritemap_YappingMaw_1
    dw $0005,Spritemap_YappingMaw_0
    dw $0003,Spritemap_YappingMaw_1
    dw Instruction_YappingMaw_QueueSFXIfOnScreen
    dw Instruction_Common_GotoY
    dw InstList_YappingMaw_Cooldown_FacingUpLeft_1


;;; $A05B: Instruction list - cooldown - facing down-right ;;;
InstList_YappingMaw_Cooldown_FacingDownRight:
    dw Instruction_YappingMaw_OffsetSamusDownRight
    dw $0004,Spritemap_YappingMaw_B


;;; $A061: Instruction list - cooldown - facing down ;;;
InstList_YappingMaw_Cooldown_FacingDown_0:
    dw Instruction_YappingMaw_OffsetSamusDown

InstList_YappingMaw_Cooldown_FacingDown_1:
    dw $0050,Spritemap_YappingMaw_E
    dw $0003,Spritemap_YappingMaw_D
    dw $0005,Spritemap_YappingMaw_C
    dw $0003,Spritemap_YappingMaw_D
    dw Instruction_YappingMaw_QueueSFXIfOnScreen
    dw Instruction_Common_GotoY
    dw InstList_YappingMaw_Cooldown_FacingDown_1


;;; $A079: Instruction list - cooldown - facing down-left ;;;
InstList_YappingMaw_Cooldown_FacingDownLeft_0:
    dw Instruction_YappingMaw_OffsetSamusDownLeft
    dw $0004,Spritemap_YappingMaw_11
    dw Instruction_YappingMaw_OffsetSamusDown

InstList_YappingMaw_Cooldown_FacingDownLeft_1:
    dw $0050,Spritemap_YappingMaw_E
    dw $0003,Spritemap_YappingMaw_D
    dw $0005,Spritemap_YappingMaw_C
    dw $0003,Spritemap_YappingMaw_D
    dw Instruction_YappingMaw_QueueSFXIfOnScreen
    dw Instruction_Common_GotoY
    dw InstList_YappingMaw_Cooldown_FacingDownLeft_1


;;; $A097: Yapping maw attack instruction list pointers ;;;
InstListPointers_YappingMaw:
; Indexed by [enemy $7E:8028]
    dw InstList_YappingMaw_Attacking_FacingUp
    dw InstList_YappingMaw_Attacking_FacingUpRight
    dw InstList_YappingMaw_Attacking_FacingRight
    dw InstList_YappingMaw_Attacking_FacingDownRight
    dw InstList_YappingMaw_Attacking_FacingDown
    dw InstList_YappingMaw_Attacking_FacingDownLeft
    dw InstList_YappingMaw_Attacking_FacingLeft
    dw InstList_YappingMaw_Attacking_FacingUpLeft


;;; $A0A7: Yapping maw Samus offsets ;;;
; Offset from enemy position to place Samus when grabbed
YappingMawSamusOffsets_X_Up:
    dw $0000
YappingMawSamusOffsets_Y_Up:
    dw $FFF0

YappingMawSamusOffsets_X_UpRight:
    dw $0008
YappingMawSamusOffsets_Y_UpRight:
    dw $FFF8

if !FEATURE_KEEP_UNREFERENCED
UNUSED_YappingMawSamusOffsets_X_Right_A8A0AF:
    dw $0010
UNUSED_YappingMawSamusOffsets_Y_Right_A8A0B1:
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED

YappingMawSamusOffsets_X_DownRight:
    dw $0008
YappingMawSamusOffsets_Y_DownRight:
    dw $0008

YappingMawSamusOffsets_X_Down:
    dw $0000
YappingMawSamusOffsets_Y_Down:
    dw $0010

YappingMawSamusOffsets_X_DownLeft:
    dw $FFF8
YappingMawSamusOffsets_Y_DownLeft:
    dw $0008

if !FEATURE_KEEP_UNREFERENCED
UNUSED_YappingMawSamusOffsets_X_Left_A8A0BF:
    dw $FFF0
UNUSED_YappingMawSamusOffsets_Y_Left_A8A0C1:
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED

YappingMawSamusOffsets_X_UpLeft:
    dw $FFF8
YappingMawSamusOffsets_Y_UpLeft:
    dw $FFF8


;;; $A0C7: Instruction - offset Samus up-right ;;;
Instruction_YappingMaw_OffsetSamusUpRight:
    LDX.W EnemyIndex
    LDA.W YappingMawSamusOffsets_X_UpRight : STA.L YappingMaw.SamusXOffset,X
    LDA.W YappingMawSamusOffsets_Y_UpRight : STA.L YappingMaw.SamusYOffset,X
    RTL


;;; $A0D9: Instruction - offset Samus up-left ;;;
Instruction_YappingMaw_OffsetSamusUpLeft:
    LDX.W EnemyIndex
    LDA.W YappingMawSamusOffsets_X_UpLeft : STA.L YappingMaw.SamusXOffset,X
    LDA.W YappingMawSamusOffsets_Y_UpLeft : STA.L YappingMaw.SamusYOffset,X
    RTL


;;; $A0EB: Instruction - offset Samus down-right ;;;
Instruction_YappingMaw_OffsetSamusDownRight:
    LDX.W EnemyIndex
    LDA.W YappingMawSamusOffsets_X_DownRight : STA.L YappingMaw.SamusXOffset,X
    LDA.W YappingMawSamusOffsets_Y_DownRight : STA.L YappingMaw.SamusYOffset,X
    RTL


;;; $A0FD: Instruction - offset Samus down-left ;;;
Instruction_YappingMaw_OffsetSamusDownLeft:
    LDX.W EnemyIndex
    LDA.W YappingMawSamusOffsets_X_DownLeft : STA.L YappingMaw.SamusXOffset,X
    LDA.W YappingMawSamusOffsets_Y_DownLeft : STA.L YappingMaw.SamusYOffset,X
    RTL


;;; $A10F: Instruction - offset Samus up ;;;
Instruction_YappingMaw_OffsetSamusUp:
    LDX.W EnemyIndex
    LDA.W YappingMawSamusOffsets_X_Up : STA.L YappingMaw.SamusXOffset,X
    LDA.W YappingMawSamusOffsets_Y_Up : STA.L YappingMaw.SamusYOffset,X
    RTL


;;; $A121: Instruction - offset Samus down ;;;
Instruction_YappingMaw_OffsetSamusDown:
    LDX.W EnemyIndex
    LDA.W YappingMawSamusOffsets_X_Down : STA.L YappingMaw.SamusXOffset,X
    LDA.W YappingMawSamusOffsets_Y_Down : STA.L YappingMaw.SamusYOffset,X
    RTL


;;; $A133: Instruction - queue yapping maw sound effect if on screen ;;;
Instruction_YappingMaw_QueueSFXIfOnScreen:
    PHY : PHX
    LDX.W EnemyIndex
    LDA.L ExtraEnemy8000+$2C,X : BNE .return
    LDA.W #$002F
    JSL QueueSound_Lib2_Max6

  .return:
    PLX : PLY
    RTL


;;; $A148: Initialisation AI - enemy $E7BF (yapping maw) ;;;
InitAI_YappingMaw:
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : STA.L YappingMaw.bodySegmentBaseXPosition,X
    LDA.W Enemy.YPosition,X : STA.L YappingMaw.bodySegmentBaseYPosition,X
    LDA.W #$0000 : STA.L YappingMaw.bodySegment1XOffset,X : STA.L YappingMaw.bodySegment1YOffset,X
    STA.L YappingMaw.bodySegment2XOffset,X : STA.L YappingMaw.bodySegment2YOffset,X
    STA.L YappingMaw.bodySegment3XOffset,X : STA.L YappingMaw.bodySegment3YOffset,X
    STA.L YappingMaw.headSegmentXOffset,X : STA.L YappingMaw.headSegmentYOffset,X
    STA.L YappingMaw.grabbingSamusFlag,X
    LDA.W Enemy.init0,X : STA.W YappingMaw.proximity,X
    LDA.W #$0040 : STA.W Enemy.var4,X
    LDA.W #InstList_YappingMaw_Attacking_FacingUp : STA.W Enemy.instList,X
    LDA.W #$0039 : STA.B DP_Temp24
    LDA.W #$0008 : STA.B DP_Temp22
    LDA.W Enemy.init1,X : BNE .keepUp
    LDA.W #InstList_YappingMaw_Attacking_FacingDown : STA.W Enemy.instList,X
    LDA.W #$0038 : STA.B DP_Temp24
    LDA.W #$FFF8 : STA.B DP_Temp22

  .keepUp:
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.W #Function_YappingMaw_Neutral : STA.W YappingMaw.function,X
    LDA.W Enemy.palette,X : AND.W #$0E00 : STA.L YappingMaw.initialPaletteIndex,X
    LDA.W #$0003 : STA.L YappingMaw.bodySegmentIndex,X

  .loop:
    LDX.W EnemyIndex
    LDY.W #EnemyProjectile_YappingMawsBody
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    LDX.W EnemyIndex
    LDA.L YappingMaw.bodySegmentIndex,X : DEC : STA.L YappingMaw.bodySegmentIndex,X : BPL .loop
    LDA.W Enemy.XPosition,X : STA.B DP_Temp12
    LDA.W Enemy.YPosition,X : CLC : ADC.B DP_Temp22 : STA.B DP_Temp14
    LDA.B DP_Temp24 : STA.B DP_Temp16
    LDA.W Enemy.palette,X : ORA.W Enemy.GFXOffset,X : STA.L ExtraEnemy8800+$E,X : STA.B DP_Temp18
    JSL Create_Sprite_Object
    LDA.B DP_Temp12 : STA.L YappingMaw.baseSpriteObjectIndex,X
    RTL


;;; $A211: Main AI - enemy $E7BF (yapping maw) ;;;
MainAI_YappingMaw:
    LDX.W EnemyIndex
    LDA.L YappingMaw.intangibilityTimer,X : DEC : STA.L YappingMaw.intangibilityTimer,X
    JSL CheckIfEnemyCenterIsOnScreen
    STA.L ExtraEnemy8000+$2C,X
    JSR.W (YappingMaw.function,X)
    JSR SetBodySegmentPosition_3
    JSR SetBodySegmentPosition_2
    JSR SetBodySegmentPosition_1
    JSR SetBodySegmentPosition_0
    RTL


;;; $A235: Yapping maw function - neutral ;;;
Function_YappingMaw_Neutral:
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : STA.W Temp_XPosition
    LDA.W Enemy.YPosition,X : STA.W Temp_YPosition
    LDA.W SamusXPosition : STA.W Temp_SamusXPosition
    LDA.W SamusYPosition : STA.W Temp_SamusYPosition
    JSL CalculateDistanceAndAngleOfSamusFromEnemy
    JSL NegateA_A0B067
    STA.L YappingMaw.targetLength,X
    CMP.W #$0020 : BMI .pointBlank
    CMP.W YappingMaw.proximity,X : BPL .return
    LDA.L YappingMaw.targetLength,X : CMP.W #$0040 : BMI + ; >_<
    LDA.W #$0040 : STA.L YappingMaw.targetLength,X

+   LDA.W Temp_AngleFromEnemyToSamus : STA.L YappingMaw.targetAngleSMConvention,X
    LDA.W #Function_YappingMaw_Attack : STA.W YappingMaw.function,X

  .return:
    RTS

  .pointBlank:
    LDA.W #$0030 : STA.L YappingMaw.intangibilityTimer,X
    RTS


;;; $A28C: Yapping maw function - attack ;;;
Function_YappingMaw_Attack:
    LDX.W EnemyIndex
    STZ.W YappingMaw.angle,X : STZ.W YappingMaw.subAngle,X : STZ.W YappingMaw.angularSpeedTableIndex,X
    LDA.L YappingMaw.targetLength,X : LSR : STA.L YappingMaw.length,X
    LDA.L YappingMaw.targetAngleSMConvention,X : SEC : SBC.W #$0040
    AND.W #$00FF : EOR.W #$FFFF : INC
    CLC : ADC.W #$0100 : AND.W #$00FF : STA.L YappingMaw.targetAngleMathsConvention,X
    CMP.W #$0080 : BPL .targetAngleGreaterThanEqualTo80
    LDA.W #$0000 : STA.L YappingMaw.aimingDownFlag,X
    BRA +

  .targetAngleGreaterThanEqualTo80:
    LDA.W #$0001 : STA.L YappingMaw.aimingDownFlag,X

+   JSR CalculateYappingMawOriginPosition
    LDA.L YappingMaw.targetAngleSMConvention,X : CLC : ADC.W #$0010
    AND.W #$00FF : LSR #5 : ASL : STA.L YappingMaw.instListTableIndex,X
    TAY
    LDA.W InstListPointers_YappingMaw,Y : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    TYA : ASL : TAY
    LDA.W YappingMawSamusOffsets_X_Up,Y : STA.L YappingMaw.SamusXOffset,X
    LDA.W YappingMawSamusOffsets_Y_Up,Y : STA.L YappingMaw.SamusYOffset,X
    LDA.W #Function_YappingMaw_Attacking : STA.W YappingMaw.function,X
    RTS


;;; $A310: Calculate yapping maw origin position ;;;
CalculateYappingMawOriginPosition:
    LDX.W EnemyIndex
    LDA.L YappingMaw.length,X : STA.W Temp_Unknown0E32
    LDA.W #$0080
    JSL Math_Cosine_A8A73E
    STA.L YappingMaw.originXPosition,X
    LDA.L YappingMaw.length,X : LSR : STA.W Temp_Unknown0E32
    LDA.W #$0080
    JSL Math_Sine_A8A742
    STA.L YappingMaw.originYPosition,X
    RTS


;;; $A339: Calculate body segment 1 velocities ;;;
CalculateBodySegment1Velocities:
    LDX.W EnemyIndex
    LDA.L YappingMaw.bodySegment1XOffset,X : STA.W Temp_Unknown0E32
    LDA.W #$0000
    JSL Math_Cosine_A8A73E
    STA.L ExtraEnemy7800+$20,X
    LDA.W #$0000
    JSL Math_Sine_A8A742
    STA.L ExtraEnemy7800+$22,X
    LDA.L YappingMaw.targetAngleMathsConvention,X
    JSL Math_Cosine_A8A73E
    SEC : SBC.L ExtraEnemy7800+$20,X : STA.L YappingMaw.bodySegment1XVelocity,X
    LDA.L YappingMaw.targetAngleMathsConvention,X
    JSL Math_Sine_A8A742
    SEC : SBC.L ExtraEnemy7800+$22,X : STA.L YappingMaw.bodySegment1YVelocity,X
    RTS


;;; $A37C: Calculate body segment 2 velocities ;;;
CalculateBodySegment2Velocities:
    LDX.W EnemyIndex
    LDA.L YappingMaw.bodySegment2XOffset,X : STA.W Temp_Unknown0E32
    LDA.W #$0000
    JSL Math_Cosine_A8A73E
    STA.L ExtraEnemy7800+$20,X
    LDA.W #$0000
    JSL Math_Sine_A8A742
    STA.L ExtraEnemy7800+$22,X
    LDA.L YappingMaw.targetAngleMathsConvention,X
    JSL Math_Cosine_A8A73E
    SEC : SBC.L ExtraEnemy7800+$20,X : STA.L YappingMaw.bodySegment2XVelocity,X
    LDA.L YappingMaw.targetAngleMathsConvention,X
    JSL Math_Sine_A8A742
    SEC : SBC.L ExtraEnemy7800+$22,X : STA.L YappingMaw.bodySegment2YVelocity,X
    RTS


;;; $A3BF: Calculate body segment 3 velocities ;;;
CalculateBodySegment3Velocities:
    LDX.W EnemyIndex
    LDA.L YappingMaw.bodySegment3XOffset,X : STA.W Temp_Unknown0E32
    LDA.W #$0000
    JSL Math_Cosine_A8A73E
    STA.L ExtraEnemy7800+$20,X
    LDA.W #$0000
    JSL Math_Sine_A8A742
    STA.L ExtraEnemy7800+$22,X
    LDA.L YappingMaw.targetAngleMathsConvention,X
    JSL Math_Cosine_A8A73E
    SEC : SBC.L ExtraEnemy7800+$20,X : STA.L YappingMaw.bodySegment3XVelocity,X
    LDA.L YappingMaw.targetAngleMathsConvention,X
    JSL Math_Sine_A8A742
    SEC : SBC.L ExtraEnemy7800+$22,X : STA.L YappingMaw.bodySegment3YVelocity,X
    RTS


;;; $A402: Calculate head segment velocities ;;;
CalculateHeadSegmentVelocities:
    LDX.W EnemyIndex
    LDA.L YappingMaw.headSegmentXOffset,X : STA.W Temp_Unknown0E32
    LDA.W #$0000
    JSL Math_Cosine_A8A73E
    STA.L ExtraEnemy7800+$20,X
    LDA.W #$0000
    JSL Math_Sine_A8A742
    STA.L ExtraEnemy7800+$22,X
    LDA.L YappingMaw.targetAngleMathsConvention,X
    JSL Math_Cosine_A8A73E
    SEC : SBC.L ExtraEnemy7800+$20,X : STA.L YappingMaw.headSegmentXVelocity,X
    LDA.L YappingMaw.targetAngleMathsConvention,X
    JSL Math_Sine_A8A742
    SEC : SBC.L ExtraEnemy7800+$22,X : STA.L YappingMaw.headSegmentYVelocity,X
    RTS


;;; $A445: Yapping maw function - attacking ;;;
Function_YappingMaw_Attacking:
; Eventually we end up approximating these rather complicated calculations for each segment:
;     Enemy segment X offset = ([enemy length] * cos([enemy segment angle] * pi / 80h) - [enemy origin X position]) * cos([enemy target angle] * pi / 80h)
;     Enemy segment Y offset = ([enemy length] * cos([enemy segment angle] * pi / 80h) - [enemy origin X position]) * -sin([enemy target angle] * pi / 80h) + [enemy length] / 2 * -sin([enemy segment angle] * pi / 80h) - [enemy origin Y position]

; TODO: deserving of a diagram? need to verify with lua script also
    LDX.W EnemyIndex
    LDA.W YappingMaw.angle,X : LSR #2 : STA.B DP_Temp14
    LDA.L YappingMaw.aimingDownFlag,X : BNE .notAimingDown
    SEC
    LDA.W #$0080 : SBC.B DP_Temp14 : STA.L YappingMaw.bodySegment1Angle,X
    SBC.B DP_Temp14 : STA.L YappingMaw.bodySegment2Angle,X
    SBC.B DP_Temp14 : STA.L YappingMaw.bodySegment3Angle,X
    SBC.B DP_Temp14 : STA.L YappingMaw.bodySegmentAngle,X
    BRA +

  .notAimingDown:
    CLC
    LDA.W #$0080 : ADC.B DP_Temp14 : STA.L YappingMaw.bodySegment1Angle,X
    ADC.B DP_Temp14 : STA.L YappingMaw.bodySegment2Angle,X
    ADC.B DP_Temp14 : STA.L YappingMaw.bodySegment3Angle,X
    ADC.B DP_Temp14 : STA.L YappingMaw.bodySegmentAngle,X

+   LDA.L YappingMaw.length,X : STA.W Temp_Unknown0E32
    LDA.L YappingMaw.bodySegment1Angle,X
    JSL Math_Cosine_A8A73E
    SEC : SBC.L YappingMaw.originXPosition,X : STA.L YappingMaw.bodySegment1XOffset,X
    LDA.L YappingMaw.bodySegment2Angle,X
    JSL Math_Cosine_A8A73E
    SEC : SBC.L YappingMaw.originXPosition,X : STA.L YappingMaw.bodySegment2XOffset,X
    LDA.L YappingMaw.bodySegment3Angle,X
    JSL Math_Cosine_A8A73E
    SEC : SBC.L YappingMaw.originXPosition,X : STA.L YappingMaw.bodySegment3XOffset,X
    LDA.L YappingMaw.bodySegmentAngle,X
    JSL Math_Cosine_A8A73E
    SEC : SBC.L YappingMaw.originXPosition,X : STA.L YappingMaw.headSegmentXOffset,X
    LDA.L YappingMaw.length,X
    LSR
    STA.W Temp_Unknown0E32
    LDA.L YappingMaw.bodySegment1Angle,X
    JSL Math_Sine_A8A742
    SEC : SBC.L YappingMaw.originYPosition,X : STA.L YappingMaw.bodySegment1YOffset,X
    LDA.L YappingMaw.bodySegment2Angle,X
    JSL Math_Sine_A8A742
    SEC : SBC.L YappingMaw.originYPosition,X : STA.L YappingMaw.bodySegment2YOffset,X
    LDA.L YappingMaw.bodySegment3Angle,X
    JSL Math_Sine_A8A742
    SEC : SBC.L YappingMaw.originYPosition,X : STA.L YappingMaw.bodySegment3YOffset,X
    LDA.L YappingMaw.bodySegmentAngle,X
    JSL Math_Sine_A8A742
    SEC : SBC.L YappingMaw.originYPosition,X : STA.L YappingMaw.headSegmentYOffset,X
    JSR CalculateBodySegment1Velocities
    JSR CalculateBodySegment2Velocities
    JSR CalculateBodySegment3Velocities
    JSR CalculateHeadSegmentVelocities
    CLC
    LDA.L YappingMaw.bodySegment1XOffset,X : ADC.L YappingMaw.bodySegment1XVelocity,X : STA.L YappingMaw.bodySegment1XOffset,X
    LDA.L YappingMaw.bodySegment1YOffset,X : ADC.L YappingMaw.bodySegment1YVelocity,X : STA.L YappingMaw.bodySegment1YOffset,X
    LDA.L YappingMaw.bodySegment2XOffset,X : ADC.L YappingMaw.bodySegment2XVelocity,X : STA.L YappingMaw.bodySegment2XOffset,X
    LDA.L YappingMaw.bodySegment2YOffset,X : ADC.L YappingMaw.bodySegment2YVelocity,X : STA.L YappingMaw.bodySegment2YOffset,X
    LDA.L YappingMaw.bodySegment3XOffset,X : ADC.L YappingMaw.bodySegment3XVelocity,X : STA.L YappingMaw.bodySegment3XOffset,X
    LDA.L YappingMaw.bodySegment3YOffset,X : ADC.L YappingMaw.bodySegment3YVelocity,X : STA.L YappingMaw.bodySegment3YOffset,X
    LDA.L YappingMaw.headSegmentXOffset,X : ADC.L YappingMaw.headSegmentXVelocity,X : STA.L YappingMaw.headSegmentXOffset,X
    LDA.L YappingMaw.headSegmentYOffset,X : ADC.L YappingMaw.headSegmentYVelocity,X : STA.L YappingMaw.headSegmentYOffset,X
    LDA.L YappingMaw.bodySegmentBaseXPosition,X : CLC : ADC.L YappingMaw.headSegmentXOffset,X : STA.W Enemy.XPosition,X
    LDA.L YappingMaw.bodySegmentBaseYPosition,X : CLC : ADC.L YappingMaw.headSegmentYOffset,X : STA.W Enemy.YPosition,X
    JSR UpdateYappingMawAngularSpeed
    LDA.W YappingMaw.angle,X : CMP.W #$0000 : BMI .cooldown
    CMP.W #$0080 : BMI .gotoMoveSamus
    LDA.W #$0080 : STA.W YappingMaw.angle,X
    STZ.W YappingMaw.subAngle,X
    INC.W YappingMaw.angularSpeedTableIndex,X : INC.W YappingMaw.angularSpeedTableIndex,X
    INC.W YappingMaw.angularSpeedTableIndex,X : INC.W YappingMaw.angularSpeedTableIndex,X
    BRA .gotoMoveSamus

  .cooldown:
    LDA.W #Function_YappingMaw_Cooldown : STA.W YappingMaw.function,X
    LDA.W #$0030 : STA.L YappingMaw.intangibilityTimer,X
    LDA.L YappingMaw.instListTableIndex,X : CMP.W #$0004 : BEQ .upRight
    CMP.W #$000C : BEQ .upLeft
    BRA .up

  .gotoMoveSamus:
    BRA .moveSamus

  .upRight:
    LDA.W #InstList_YappingMaw_Cooldown_FacingUpRight : STA.W Enemy.instList,X
    BRA .upMerge

  .upLeft:
    LDA.W #InstList_YappingMaw_Cooldown_FacingUpLeft_0 : STA.W Enemy.instList,X
    BRA .upMerge

  .up:
    LDA.W #InstList_YappingMaw_Cooldown_FacingUp_0 : STA.W Enemy.instList,X

  .upMerge:
    LDA.W Enemy.init1,X : BNE .return
    LDA.L YappingMaw.instListTableIndex,X : CMP.W #$0004 : BEQ .downRight
    CMP.W #$000C : BEQ .downLeft
    BRA .down

  .downRight:
    LDA.W #InstList_YappingMaw_Cooldown_FacingDownRight : STA.W Enemy.instList,X
    BRA .moveSamus

  .downLeft:
    LDA.W #InstList_YappingMaw_Cooldown_FacingDownLeft_0 : STA.W Enemy.instList,X
    BRA .moveSamus

  .down:
    LDA.W #InstList_YappingMaw_Cooldown_FacingDown_0 : STA.W Enemy.instList,X
    BRA .return

  .moveSamus:
    LDA.L YappingMaw.grabbingSamusFlag,X : BEQ .return
    JSR MoveSamusWithYappingMawPincers

  .return:
    RTS


;;; $A63E: Update yapping maw angular speed ;;;
UpdateYappingMawAngularSpeed:
    LDY.W YappingMaw.angularSpeedTableIndex,X
    LDA.W YappingMaw.angle,X : CLC : ADC.W CommonEnemySpeeds_QuadraticallyIncreasing+2,Y : STA.W YappingMaw.angle,X
    LDA.W YappingMaw.subAngle,X : CLC : ADC.W CommonEnemySpeeds_QuadraticallyIncreasing,Y : BCC +
    INC.W YappingMaw.angle,X

+   STA.W YappingMaw.subAngle,X
    LDA.W YappingMaw.angularSpeedTableIndex,X : CLC : ADC.W #$0008 : STA.W YappingMaw.angularSpeedTableIndex,X
    RTS


;;; $A665: Move Samus with yapping maw pincers ;;;
MoveSamusWithYappingMawPincers:
    LDX.W EnemyIndex
    LDA.W #$0003
    JSL Run_Samus_Command
    LDA.W Enemy.XPosition,X : CLC : ADC.L YappingMaw.SamusXOffset,X : STA.W SamusXPosition
    LDA.W Enemy.YPosition,X : CLC : ADC.L YappingMaw.SamusYOffset,X : STA.W SamusYPosition
    JSL CapScrollingSpeed
    RTS


;;; $A68A: Yapping maw function - cooldown ;;;
Function_YappingMaw_Cooldown:
; BUG: Yapping maw shinespark crash crash is an eventual consequence of the *reckless* setting of Samus pose input handler to $E913 (normal)
;      During shinespark, Samus pose input handler is supposed to be an RTS to disable transition table lookup
;      With transition table lookup allowed, and because the entries for shinespark poses are empty, if no buttons are being pressed,
;      then $91:8304 is executed, which sets prospective pose change command = stop
;      Hence, when $91:EB88 (update Samus pose) is called, $91:ECD0 (prospective pose change command 2 - stop) is executed,
;      which calls $91:DE53 (cancel speed boosting), which sets $0AAF = FFh with the intention of flagging the echoes to merge back into Samus
;      However, during shinespark crash, $0AAF is used as "shinespark crash echo circle phase",
;      which is a jump table index in $90:D346 (Samus movement handler - shinespark crash - echoes circle Samus),
;      which is only 3 entries long
;      The resulting jump pointer is loaded from $90:D57B, which happens to be $FEAD, which is in the free space of bank $90
;      Eventually, the PC lands on $0001 and starts executing from WRAM where a crash is inevitable
    LDX.W EnemyIndex
    LDA.L YappingMaw.grabbingSamusFlag,X : BEQ .notGrabbingSamus
    JSR MoveSamusWithYappingMawPincers

  .notGrabbingSamus:
    DEC.W Enemy.var4,X : BPL .return
    LDA.W PoseInputHandler : CMP.W #SamusPoseInputHandler_Demo : BEQ .return
    LDA.W #SamusPoseInputHandler_Normal : STA.W PoseInputHandler
    LDA.W #$0000 : STA.L YappingMaw.grabbingSamusFlag,X
    LDA.W #$0030 : STA.L YappingMaw.intangibilityTimer,X
    LDA.W #$0040 : STA.W Enemy.var4,X
    LDA.W #Function_YappingMaw_Neutral : STA.W YappingMaw.function,X

  .return:
    RTS


;;; $A6C4: Set body segment 0 position ;;;
SetBodySegmentPosition_0:
    LDX.W EnemyIndex
    LDA.L YappingMaw.bodySegment0ProjectileIndex,X : TAY
    LDA.L YappingMaw.bodySegmentBaseXPosition,X : STA.W EnemyProjectile_XPositions,Y
    LDA.L YappingMaw.bodySegmentBaseYPosition,X : STA.W EnemyProjectile_YPositions,Y
    RTS


;;; $A6DB: Set body segment 1 position ;;;
SetBodySegmentPosition_1:
    LDX.W EnemyIndex
    LDA.L YappingMaw.bodySegment1ProjectileIndex,X : TAY
    LDA.L YappingMaw.bodySegmentBaseXPosition,X : CLC : ADC.L YappingMaw.bodySegment1XOffset,X : STA.W EnemyProjectile_XPositions,Y
    LDA.L YappingMaw.bodySegmentBaseYPosition,X : CLC : ADC.L YappingMaw.bodySegment1YOffset,X : STA.W EnemyProjectile_YPositions,Y
    RTS


;;; $A6FC: Set body segment 2 position ;;;
SetBodySegmentPosition_2:
    LDX.W EnemyIndex
    LDA.L YappingMaw.bodySegment2ProjectileIndex,X : TAY
    LDA.L YappingMaw.bodySegmentBaseXPosition,X : CLC : ADC.L YappingMaw.bodySegment2XOffset,X : STA.W EnemyProjectile_XPositions,Y
    LDA.L YappingMaw.bodySegmentBaseYPosition,X : CLC : ADC.L YappingMaw.bodySegment2YOffset,X : STA.W EnemyProjectile_YPositions,Y
    RTS


;;; $A71D: Set body segment 3 position ;;;
SetBodySegmentPosition_3:
    LDX.W EnemyIndex
    LDA.L YappingMaw.bodySegment3ProjectileIndex,X : TAY
    LDA.L YappingMaw.bodySegmentBaseXPosition,X : CLC : ADC.L YappingMaw.bodySegment3XOffset,X : STA.W EnemyProjectile_XPositions,Y
    LDA.L YappingMaw.bodySegmentBaseYPosition,X : CLC : ADC.L YappingMaw.bodySegment3YOffset,X : STA.W EnemyProjectile_YPositions,Y
    RTS


;;; $A73E: A = [$0E32] * cos([A] * pi / 80h) ;;;
Math_Cosine_A8A73E:
;; Parameters:
;;     A: Angle
;;     $0E32: Radius
;; Returns:
;;     A: [$0E32] * cos([A] * pi / 80h)
    SEC : SBC.W #$0040
; fallthrough to Math_Sine_A8A742


;;; $A742: A = [$0E32] * -sin([A] * pi / 80h) ;;;
Math_Sine_A8A742:
;; Parameters:
;;     A: Angle
;;     $0E32: Radius
;; Returns:
;;     A: [$0E32] * -sin([A] * pi / 80h)
    STA.B DP_Temp12
    LDA.W #$0100 : SEC : SBC.B DP_Temp12
    AND.W #$00FF : ASL : TAX
    PHP
    STZ.B DP_Temp14 : STZ.B DP_Temp16
    LDA.L SineCosineTables_16bitSine,X : BPL +
    EOR.W #$FFFF : INC
    INC.B DP_Temp14

+   AND.W #$FF00 : XBA
    SEP #$20
    STA.W $4202
    LDA.W Temp_Unknown0E32 : BEQ +
    STA.W $4203
    NOP #3
    REP #$20
    LDA.W $4216 : AND.W #$FF00 : XBA : ASL : STA.B DP_Temp16
    LDA.B DP_Temp14 : BEQ +
    LDA.W $4216 : EOR.W #$FFFF : INC
    XBA : ASL : ORA.W #$FF00 : STA.B DP_Temp16

+   LDA.B DP_Temp16
    LDX.W EnemyIndex
    PLP
    RTL


;;; $A799: Enemy touch - enemy $E7BF (yapping maw) ;;;
EnemyTouch_YappingMaw:
    LDX.W EnemyIndex
    LDA.L YappingMaw.intangibilityTimer,X : BPL .return
    LDA.L YappingMaw.grabbingSamusFlag,X : BNE .return
    LDA.W #$0000 : STA.L YappingMaw.intangibilityTimer,X
    LDA.W #$0001 : STA.L YappingMaw.grabbingSamusFlag,X
    LDA.W #RTS_90E90E : STA.W PoseInputHandler

  .return:
    RTL


;;; $A7BD: Enemy shot - enemy $E7BF (yapping maw) ;;;
EnemyShot_YappingMaw:
; BUG: Yapping maw shinespark crash crash applies here too if a yapping maw is frozen or killed, see Function_YappingMaw_Cooldown
    JSL NormalEnemyShotAI
    LDX.W EnemyIndex
    LDA.W Enemy.health,X : BNE .alive
    LDA.L YappingMaw.bodySegment0ProjectileIndex,X : TAY
    LDA.W #$0000 : STA.W EnemyProjectile_ID,Y
    LDA.L YappingMaw.bodySegment1ProjectileIndex,X : TAY
    LDA.W #$0000 : STA.W EnemyProjectile_ID,Y
    LDA.L YappingMaw.bodySegment2ProjectileIndex,X : TAY
    LDA.W #$0000 : STA.W EnemyProjectile_ID,Y
    LDA.L YappingMaw.bodySegment3ProjectileIndex,X : TAY
    LDA.W #$0000 : STA.W EnemyProjectile_ID,Y
    PHX
    LDA.L YappingMaw.baseSpriteObjectIndex,X : TAX
    LDA.W #$0000 : STA.L SpriteObjects_InstListPointers,X
    PLX
    LDA.W PoseInputHandler : CMP.W #SamusPoseInputHandler_Demo : BEQ .notDemo
    LDA.W #SamusPoseInputHandler_Normal : STA.W PoseInputHandler

  .notDemo:
    LDA.W #$0000 : STA.L YappingMaw.grabbingSamusFlag,X
    BRA .return

  .alive:
    LDA.W Enemy.freezeTimer,X : BEQ .return
    LDA.W PoseInputHandler : CMP.W #SamusPoseInputHandler_Demo : BEQ .alsoNotDemo
    LDA.W #SamusPoseInputHandler_Normal : STA.W PoseInputHandler

  .alsoNotDemo:
    LDA.W #$0000 : STA.L YappingMaw.grabbingSamusFlag,X

  .return:
    RTL


;;; $A835: Frozen AI - enemy $E7BF (yapping maw) ;;;
FrozenAI_YappingMaw:
    JSL CommonA8_NormalEnemyFrozenAI
    LDA.L YappingMaw.bodySegment0ProjectileIndex,X : TAY
    JSR SetYappingMawBodySegmentFrozenPalette
    LDA.L YappingMaw.bodySegment1ProjectileIndex,X : TAY
    JSR SetYappingMawBodySegmentFrozenPalette
    LDA.L YappingMaw.bodySegment2ProjectileIndex,X : TAY
    JSR SetYappingMawBodySegmentFrozenPalette
    LDA.L YappingMaw.bodySegment3ProjectileIndex,X : TAY
    JSR SetYappingMawBodySegmentFrozenPalette
    JSR SetYappingMawBaseFrozenPalette
    RTL


;;; $A85D: Set yapping maw body segment frozen palette ;;;
SetYappingMawBodySegmentFrozenPalette:
;; Parameters:
;;     Y: Enemy projectile index
    LDX.W EnemyIndex
    LDA.W EnemyProjectile_GraphicsIndices,Y : AND.W #$F1FF : ORA.L YappingMaw.initialPaletteIndex,X : STA.W EnemyProjectile_GraphicsIndices,Y
    LDA.W Enemy.freezeTimer,X : BEQ .return
    LDA.W EnemyProjectile_GraphicsIndices,Y : AND.W #$F1FF : ORA.W #$0C00 : STA.W EnemyProjectile_GraphicsIndices,Y
    LDA.W Enemy.freezeTimer,X : CMP.W #$005A : BPL .return
    BIT.W #$0002 : BNE .return
    LDA.W EnemyProjectile_GraphicsIndices,Y : AND.W #$F1FF : ORA.L YappingMaw.initialPaletteIndex,X : STA.W EnemyProjectile_GraphicsIndices,Y

  .return:
    RTS


;;; $A899: Set yapping maw base frozen palette ;;;
SetYappingMawBaseFrozenPalette:
    LDX.W EnemyIndex
    LDA.L YappingMaw.initialPaletteIndex,X : STA.B DP_Temp12
    LDA.L YappingMaw.baseSpriteObjectIndex,X : STA.B DP_Temp14
    TAX
    LDA.L SpriteObjects_Palettes,X : AND.W #$F1FF : ORA.B DP_Temp12 : STA.L SpriteObjects_Palettes,X
    LDX.W EnemyIndex
    LDA.W Enemy.freezeTimer,X : BEQ .return
    LDX.B DP_Temp14
    LDA.L SpriteObjects_Palettes,X : AND.W #$F1FF : ORA.W #$0C00 : STA.L SpriteObjects_Palettes,X
    LDX.W EnemyIndex
    LDA.W Enemy.freezeTimer,X : CMP.W #$005A : BPL .return
    BIT.W #$0002 : BNE .return
    LDX.B DP_Temp14
    LDA.L SpriteObjects_Palettes,X : AND.W #$F1FF : ORA.B DP_Temp12 : STA.L SpriteObjects_Palettes,X

  .return:
    RTS


;;; $A8EE: Yapping maw spritemaps ;;;
Spritemap_YappingMaw_0:
    dw $0005
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $1F4, $FA, 0, 0, 2, 0, $10F)
    %spritemapEntry(0, $1EC, $FA, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $04, $FA, 0, 1, 2, 0, $10F)
    %spritemapEntry(0, $0C, $FA, 0, 1, 2, 0, $10E)

Spritemap_YappingMaw_1:
    dw $0003
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $04, $F0, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $1EC, $F0, 0, 0, 2, 0, $106)

Spritemap_YappingMaw_2:
    dw $0005
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $00, $F6, 0, 1, 2, 0, $10D)
    %spritemapEntry(0, $00, $EE, 0, 1, 2, 0, $10C)
    %spritemapEntry(0, $1F8, $F6, 0, 0, 2, 0, $10D)
    %spritemapEntry(0, $1F8, $EE, 0, 0, 2, 0, $10C)

Spritemap_YappingMaw_3:
    dw $0003
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F2, $EE, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $02, $FE, 1, 1, 2, 0, $108)

Spritemap_YappingMaw_4:
    dw $0005
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $102)
    %spritemapEntry(0, $05, $FD, 0, 1, 2, 0, $10F)
    %spritemapEntry(0, $0D, $FD, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $1FB, $F3, 0, 0, 2, 0, $10D)
    %spritemapEntry(0, $1FB, $EB, 0, 0, 2, 0, $10C)

Spritemap_YappingMaw_5:
    dw $0003
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $01, $F4, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $1FC, $EF, 0, 1, 2, 0, $108)

Spritemap_YappingMaw_6:
    dw $0005
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $104)
    %spritemapEntry(0, $1FE, $04, 1, 0, 2, 0, $10D)
    %spritemapEntry(0, $1FE, $0C, 1, 0, 2, 0, $10C)
    %spritemapEntry(0, $1FE, $F4, 0, 0, 2, 0, $10D)
    %spritemapEntry(0, $1FE, $EC, 0, 0, 2, 0, $10C)

Spritemap_YappingMaw_7:
    dw $0003
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $00, $EC, 0, 1, 2, 0, $108)
    %spritemapEntry(1, $00, $04, 1, 1, 2, 0, $108)

Spritemap_YappingMaw_8:
    dw $0005
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $104)
    %spritemapEntry(0, $03, $F8, 1, 1, 2, 0, $10F)
    %spritemapEntry(0, $0B, $F8, 1, 1, 2, 0, $10E)
    %spritemapEntry(0, $03, $00, 0, 1, 2, 0, $10F)
    %spritemapEntry(0, $0B, $00, 0, 1, 2, 0, $10E)

Spritemap_YappingMaw_9:
    dw $0003
    %spritemapEntry(1, $1F8, $F8, 1, 0, 2, 0, $102)
    %spritemapEntry(1, $1F2, $02, 1, 0, 2, 0, $106)
    %spritemapEntry(1, $02, $F2, 0, 1, 2, 0, $108)

Spritemap_YappingMaw_A:
    dw $0005
    %spritemapEntry(1, $1F8, $F8, 1, 0, 2, 0, $102)
    %spritemapEntry(0, $05, $FB, 1, 1, 2, 0, $10F)
    %spritemapEntry(0, $0D, $FB, 1, 1, 2, 0, $10E)
    %spritemapEntry(0, $1FB, $05, 1, 0, 2, 0, $10D)
    %spritemapEntry(0, $1FB, $0D, 1, 0, 2, 0, $10C)

Spritemap_YappingMaw_B:
    dw $0003
    %spritemapEntry(1, $1F8, $F8, 1, 0, 2, 0, $102)
    %spritemapEntry(1, $01, $FC, 1, 1, 2, 0, $106)
    %spritemapEntry(1, $1FC, $01, 1, 1, 2, 0, $108)

Spritemap_YappingMaw_C:
    dw $0005
    %spritemapEntry(1, $1F8, $F8, 1, 0, 2, 0, $100)
    %spritemapEntry(0, $1F4, $FE, 1, 0, 2, 0, $10F)
    %spritemapEntry(0, $1EC, $FE, 1, 0, 2, 0, $10E)
    %spritemapEntry(0, $04, $FE, 1, 1, 2, 0, $10F)
    %spritemapEntry(0, $0C, $FE, 1, 1, 2, 0, $10E)

Spritemap_YappingMaw_D:
    dw $0003
    %spritemapEntry(1, $1F8, $F8, 1, 0, 2, 0, $100)
    %spritemapEntry(1, $04, $00, 1, 1, 2, 0, $106)
    %spritemapEntry(1, $1EC, $00, 1, 0, 2, 0, $106)

Spritemap_YappingMaw_E:
    dw $0005
    %spritemapEntry(1, $1F8, $F8, 1, 0, 2, 0, $100)
    %spritemapEntry(0, $00, $02, 1, 1, 2, 0, $10D)
    %spritemapEntry(0, $00, $0A, 1, 1, 2, 0, $10C)
    %spritemapEntry(0, $1F8, $02, 1, 0, 2, 0, $10D)
    %spritemapEntry(0, $1F8, $0A, 1, 0, 2, 0, $10C)

Spritemap_YappingMaw_F:
    dw $0003
    %spritemapEntry(1, $1F8, $F8, 1, 1, 2, 0, $102)
    %spritemapEntry(1, $1FE, $02, 1, 1, 2, 0, $106)
    %spritemapEntry(1, $1EE, $F2, 0, 0, 2, 0, $108)

Spritemap_YappingMaw_10:
    dw $0005
    %spritemapEntry(1, $1F8, $F8, 1, 1, 2, 0, $102)
    %spritemapEntry(0, $1F3, $FB, 1, 0, 2, 0, $10F)
    %spritemapEntry(0, $1EB, $FB, 1, 0, 2, 0, $10E)
    %spritemapEntry(0, $1FD, $05, 1, 1, 2, 0, $10D)
    %spritemapEntry(0, $1FD, $0D, 1, 1, 2, 0, $10C)

Spritemap_YappingMaw_11:
    dw $0003
    %spritemapEntry(1, $1F8, $F8, 1, 1, 2, 0, $102)
    %spritemapEntry(1, $1EF, $FC, 1, 0, 2, 0, $106)
    %spritemapEntry(1, $1F4, $01, 1, 0, 2, 0, $108)

Spritemap_YappingMaw_12:
    dw $0005
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $104)
    %spritemapEntry(0, $1FA, $04, 1, 1, 2, 0, $10D)
    %spritemapEntry(0, $1FA, $0C, 1, 1, 2, 0, $10C)
    %spritemapEntry(0, $1FA, $F4, 0, 1, 2, 0, $10D)
    %spritemapEntry(0, $1FA, $EC, 0, 1, 2, 0, $10C)

Spritemap_YappingMaw_13:
    dw $0003
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $1F0, $EC, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $1F0, $04, 1, 0, 2, 0, $108)

Spritemap_YappingMaw_14:
    dw $0005
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $104)
    %spritemapEntry(0, $1F5, $F8, 1, 0, 2, 0, $10F)
    %spritemapEntry(0, $1ED, $F8, 1, 0, 2, 0, $10E)
    %spritemapEntry(0, $1F5, $00, 0, 0, 2, 0, $10F)
    %spritemapEntry(0, $1ED, $00, 0, 0, 2, 0, $10E)

Spritemap_YappingMaw_15:
    dw $0003
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $1FE, $EE, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $1EE, $FE, 1, 0, 2, 0, $108)

Spritemap_YappingMaw_16:
    dw $0005
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $102)
    %spritemapEntry(0, $1F3, $FD, 0, 0, 2, 0, $10F)
    %spritemapEntry(0, $1EB, $FD, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1FD, $F3, 0, 1, 2, 0, $10D)
    %spritemapEntry(0, $1FD, $EB, 0, 1, 2, 0, $10C)

Spritemap_YappingMaw_17:
    dw $0003
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $1EF, $F4, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1F4, $EF, 0, 0, 2, 0, $108)


;;; $AAFE: Palette - enemy $E7FF (kago) ;;;
Palette_Kago:
    dw $3800,$57FF,$42F7,$0929,$00A5,$4F5A,$36B5,$2610
    dw $1DCE,$01DF,$001F,$0018,$000A,$06B9,$00EA,$0045


;;; $AB1E: Instruction list - slow ;;;
InstList_Kago_Initial_SlowAnimation:
    dw $000A,Spritemap_Kago_0
    dw $000A,Spritemap_Kago_1
    dw $000A,Spritemap_Kago_2
    dw $000A,Spritemap_Kago_1
    dw Instruction_Common_GotoY
    dw InstList_Kago_Initial_SlowAnimation


;;; $AB32: Instruction list - fast ;;;
InstList_Kago_TakenHit_FastAnimation:
    dw $0003,Spritemap_Kago_0
    dw $0003,Spritemap_Kago_1
    dw $0003,Spritemap_Kago_2
    dw $0003,Spritemap_Kago_1
    dw Instruction_Common_GotoY
    dw InstList_Kago_TakenHit_FastAnimation


;;; $AB46: Initialisation AI - enemy $E7FF (kago) ;;;
InitAI_Kago:
; Hit counter is $7E:7808, how obscure
    LDX.W EnemyIndex
    LDA.W Enemy.properties,X : ORA.W #$2000 : STA.W Enemy.properties,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X : STZ.W Enemy.var4,X
    LDA.W #InstList_Kago_Initial_SlowAnimation : STA.W Enemy.instList,X
    LDA.W #Function_Kago_Nothing : STA.W Kago.function,X
    STZ.W Enemy.var5,X
    LDA.W Enemy.init0,X : STA.L Kago.hitCounter,X
    RTL


;;; $AB75: Main AI - enemy $E7FF (kago) ;;;
MainAI_Kago:
    LDX.W EnemyIndex
    JMP.W (Kago.function,X)


;;; $AB7B: Kago function - nothing ;;;
Function_Kago_Nothing:
    LDA.W #.return : STA.W Kago.function,X

  .return:
    RTL


;;; $AB82: RTL ;;;
RTL_A8AB82:
    RTL


;;; $AB83: Enemy shot - enemy $E7FF (kago) ;;;
EnemyShot_Kago:
    PHX : PHY
    JSL NormalEnemyShotAI
    LDA.W #$0002 : STA.W EarthquakeType
    LDA.W #$0010 : STA.W EarthquakeTimer
    LDX.W EnemyIndex
    LDA.W Kago.fastAnimationFlag,X : BNE .takenHit
    LDA.W #$0001 : STA.W Kago.fastAnimationFlag,X
    LDA.W #InstList_Kago_TakenHit_FastAnimation : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X

  .takenHit:
    LDA.L Kago.hitCounter,X : SEC : SBC.W #$0001 : STA.L Kago.hitCounter,X : BPL .notDead
    LDA.W #$0004
    JSL EnemyDeath
    LDX.W EnemyIndex
    LDA.W #$0001 : STA.W Enemy.var5,X

  .notDead:
    LDY.W #EnemyProjectile_KagoBug
    LDA.W Enemy.YPosition,X
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    PLY : PLX
    RTL


;;; $ABDA: Kago spritemaps ;;;
Spritemap_Kago_0:
    dw $0004
    %spritemapEntry(1, $00, $00, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $00, $F0, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $100)

Spritemap_Kago_1:
    dw $0004
    %spritemapEntry(1, $00, $00, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $00, $F0, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $104)

Spritemap_Kago_2:
    dw $0004
    %spritemapEntry(1, $00, $00, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $00, $F0, 0, 0, 2, 0, $10A)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $108)


;;; $AC1C: Palette - enemy $E83F (magdollite) ;;;
Palette_Magdollite:
    dw $3800,$001F,$001C,$0018,$0015,$7FFF,$3BE0,$2680,$1580


;;; $AC3C: Magdollite glow palettes ;;;
Palette_Magdollite_Glow_0:
    dw $023F
Palette_Magdollite_Glow_1:
    dw $00BD
Palette_Magdollite_Glow_2:
    dw $0014
Palette_Magdollite_Glow_3:
    dw $0010
    dw $0000,$0000,$0000

;                                                              Only these four colours are actually used
;                                                              |
    dw $3800,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000, $00BD,$0014,$0010,$023F, $0000,$0000,$0000
    dw $3800,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000, $0014,$0010,$023F,$00BD, $0000,$0000,$0000
    dw $3800,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000, $0010,$023F,$00BD,$0014, $0000,$0000,$0000


;;; $AC9C: Instruction list - head - facing left - idle ;;;
InstList_Magdollite_Idling_FacingLeft:
    dw $000D,Spritemap_Magdollite_FacingLeft_Head_0
    dw $000D,Spritemap_Magdollite_FacingLeft_Head_1
    dw $000D,Spritemap_Magdollite_FacingLeft_Head_2
    dw $000D,Spritemap_Magdollite_FacingLeft_Head_1
    dw Instruction_Common_GotoY
    dw InstList_Magdollite_Idling_FacingLeft


;;; $ACB0: Instruction list - hand - facing left - throwing lava ;;;
InstList_Magdollite_Slave2_ThrowFireballs_FacingLeft:
    dw Instruction_Magdollite_QueueSFXInY_Lib2_Max6_IfOnScreen
    dw $0061
    dw Instruction_Magdollite_SetWaitingFlag
    dw Instruction_Magdollite_SetCooldownTimerTo100
    dw $001A,Spritemap_Magdollite_FacingLeft_Fist_0
    dw $0008,Spritemap_Magdollite_FacingLeft_Fist_1
    dw Instruction_Magdollite_ShiftLeft8Pixels_Up4Pixels_FacingLeft
    dw $0005,Spritemap_Magdollite_FacingLeft_Hand_FingersStraight
    dw Instruction_Magdollite_SpawnLavaProjectile
    dw $0005,Spritemap_Magdollite_FacingLeft_Hand_FingersStraight
    dw Instruction_Magdollite_SpawnLavaProjectile
    dw $0005,Spritemap_Magdollite_FacingLeft_Hand_FingersStraight
    dw Instruction_Magdollite_SpawnLavaProjectile
    dw Instruction_Magdollite_ShiftLeft8Pixels_Up4Pixels_Left_dup
    dw $0005,Spritemap_Magdollite_FacingLeft_Hand_FingersCurled
    dw Instruction_Magdollite_ResetWaitingFlag
    dw Instruction_Common_Sleep


;;; $ACDE: Instruction list - head - facing left - submerge into lava ;;;
InstList_Magdollite_SplashIntoLavaAndFormBasePillar_Left_0:
    dw Instruction_Magdollite_SetWaitingFlag
    dw $0005,Spritemap_Magdollite_FacingLeft_Head_1
    dw Instruction_Magdollite_MoveDown2Pixels
    dw $0005,Spritemap_Magdollite_FacingLeft_Head_1
    dw $0005,Spritemap_Magdollite_FacingLeft_Head_PokingOutOfLava
    dw $0005,Spritemap_Magdollite_FacingLeft_Head_BarelyPokingOutOfLava
    dw Instruction_Magdollite_MoveDown2Pixels
    dw $0005,Spritemap_Magdollite_FacingLeft_Head_BarelyPokingOutOfLava
    dw Instruction_Magdollite_MoveDownBy18Pixels_SetSlavesAsVisible
    dw Instruction_Common_TimerInY
    dw $0018

InstList_Magdollite_SplashIntoLavaAndFormBasePillar_Left_1:
    dw Instruction_Magdollite_MoveBaseAndPillarUp1Pixel
    dw $0001,Spritemap_Magdollite_FacingLeft_WidePillarSection
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate
    dw InstList_Magdollite_SplashIntoLavaAndFormBasePillar_Left_1
    dw Instruction_Magdollite_ResetWaitingFlag
    dw Instruction_Common_Sleep


;;; $AD0C: Instruction list - head - facing left - emerge from lava ;;;
InstList_Magdollite_UnformBasePillar_SplashBackToIdle_Left_0:
    dw Instruction_Magdollite_SetWaitingFlag
    dw Instruction_Magdollite_RestoreInitialYPositions
    dw Instruction_Common_TimerInY
    dw $0018

InstList_Magdollite_UnformBasePillar_SplashBackToIdle_Left_1:
    dw Instruction_Magdollite_MoveBaseAndPillarDown1Pixel
    dw $0001,Spritemap_Magdollite_FacingLeft_WidePillarSection
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate
    dw InstList_Magdollite_UnformBasePillar_SplashBackToIdle_Left_1
    dw Instruction_Magdollite_MoveDown4Pixels_SetSlavesAsInvisible
    dw $0005,Spritemap_Magdollite_FacingLeft_Head_BarelyPokingOutOfLava
    dw Instruction_Magdollite_MoveUp2Pixels
    dw $0005,Spritemap_Magdollite_FacingLeft_Head_BarelyPokingOutOfLava
    dw $0005,Spritemap_Magdollite_FacingLeft_Head_PokingOutOfLava
    dw $0005,Spritemap_Magdollite_FacingLeft_Head_1
    dw Instruction_Magdollite_MoveUp2Pixels
    dw $0005,Spritemap_Magdollite_FacingLeft_Head_1
    dw Instruction_Magdollite_ResetWaitingFlag
    dw Instruction_Common_Sleep


;;; $AD3C: Instruction list - head - facing right - idle ;;;
InstList_Magdollite_Idling_FacingRight:
    dw $000D,Spritemap_Magdollite_FacingRight_Head_0
    dw $000D,Spritemap_Magdollite_FacingRight_Head_1
    dw $000D,Spritemap_Magdollite_FacingRight_Head_2
    dw $000D,Spritemap_Magdollite_FacingRight_Head_1
    dw Instruction_Common_GotoY
    dw InstList_Magdollite_Idling_FacingRight


;;; $AD50: Instruction list - hand - facing right - throwing lava ;;;
InstList_Magdollite_ThrowFireballs_FacingRight:
    dw Instruction_Magdollite_QueueSFXInY_Lib2_Max6_IfOnScreen
    dw $0061
    dw Instruction_Magdollite_SetWaitingFlag
    dw Instruction_Magdollite_SetCooldownTimerTo100
    dw $001A,Spritemap_Magdollite_FacingRight_Fist_0
    dw $0008,Spritemap_Magdollite_FacingRight_Fist_1
    dw Instruction_Magdollite_ShiftRight8Pixels_Up4Pixels_FaceRight
    dw $0005,Spritemap_Magdollite_FacingRight_Hand_FingersStraight
    dw Instruction_Magdollite_SpawnLavaProjectile
    dw $0005,Spritemap_Magdollite_FacingRight_Hand_FingersStraight
    dw Instruction_Magdollite_SpawnLavaProjectile
    dw $0005,Spritemap_Magdollite_FacingRight_Hand_FingersStraight
    dw Instruction_Magdollite_SpawnLavaProjectile
    dw Instruction_Magdollite_ShiftRight8Pixels_Up4Pixels_Right_dup
    dw $0005,Spritemap_Magdollite_FacingRight_Hand_FingersCurled
    dw Instruction_Magdollite_ResetWaitingFlag
    dw Instruction_Common_Sleep


;;; $AD7E: Instruction list - head - facing right - submerge into lava ;;;
InstList_Magdollite_SplashIntoLavaAndFormBasePillar_Right_0:
    dw Instruction_Magdollite_SetWaitingFlag
    dw $0005,Spritemap_Magdollite_FacingRight_Head_1
    dw Instruction_Magdollite_MoveDown2Pixels
    dw $0005,Spritemap_Magdollite_FacingRight_Head_1
    dw $0005,Spritemap_Magdollite_FacingRight_Head_PokingOutOfLava
    dw $0005,Spritemap_Magdollite_FacingRight_Head_BarelyPokingOutOfLava
    dw Instruction_Magdollite_MoveDown2Pixels
    dw $0005,Spritemap_Magdollite_FacingRight_Head_BarelyPokingOutOfLava
    dw Instruction_Magdollite_MoveDownBy18Pixels_SetSlavesAsVisible
    dw Instruction_Common_TimerInY
    dw $0018

InstList_Magdollite_SplashIntoLavaAndFormBasePillar_Right_1:
    dw Instruction_Magdollite_MoveBaseAndPillarUp1Pixel
    dw $0001,Spritemap_Magdollite_FacingRight_WidePillarSection
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate
    dw InstList_Magdollite_SplashIntoLavaAndFormBasePillar_Right_1
    dw Instruction_Magdollite_ResetWaitingFlag
    dw Instruction_Common_Sleep


;;; $ADAC: Instruction list - head - facing right - emerge from lava ;;;
InstList_Magdollite_UnformBasePillar_SplashBackToIdle_Right_0:
    dw Instruction_Magdollite_SetWaitingFlag
    dw Instruction_Magdollite_RestoreInitialYPositions
    dw Instruction_Common_TimerInY
    dw $0018

InstList_Magdollite_UnformBasePillar_SplashBackToIdle_Right_1:
    dw Instruction_Magdollite_MoveBaseAndPillarDown1Pixel
    dw $0001,Spritemap_Magdollite_FacingRight_WidePillarSection
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate
    dw InstList_Magdollite_UnformBasePillar_SplashBackToIdle_Right_1
    dw Instruction_Magdollite_MoveDown4Pixels_SetSlavesAsInvisible
    dw $0005,Spritemap_Magdollite_FacingRight_Head_BarelyPokingOutOfLava
    dw Instruction_Magdollite_MoveUp2Pixels
    dw $0005,Spritemap_Magdollite_FacingRight_Head_BarelyPokingOutOfLava
    dw $0005,Spritemap_Magdollite_FacingRight_Head_PokingOutOfLava
    dw $0005,Spritemap_Magdollite_FacingRight_Head_1
    dw Instruction_Magdollite_MoveUp2Pixels
    dw $0005,Spritemap_Magdollite_FacingRight_Head_1
    dw Instruction_Magdollite_ResetWaitingFlag
    dw Instruction_Common_Sleep


;;; $ADDC: Instruction list - arm - growth level 0 ;;;
InstList_Magdollite_Slave1_NarrowPillar_FacingLeft:
    dw $0001,Spritemap_Magdollite_FacingLeft_NarrowPillarSection
    dw Instruction_Common_Sleep


;;; $ADE2: Instruction list - arm - growth level 1 ;;;
InstList_Magdollite_Slave1_NarrowPillar_FacingRight:
    dw $0001,Spritemap_Magdollite_FacingRight_NarrowPillarSection
    dw Instruction_Common_Sleep


;;; $ADE8: Instruction list - arm - growth level 2 ;;;
InstList_Magdollite_Slave1_3xPillarStack:
    dw $0001,Spritemap_Magdollite_NarrowPillarStacks_3x
    dw Instruction_Common_Sleep


;;; $ADEE: Instruction list - arm - growth level 3 ;;;
InstList_Magdollite_Slave1_4xPillarStack:
    dw $0001,Spritemap_Magdollite_NarrowPillarStacks_4x
    dw Instruction_Common_Sleep


;;; $ADF4: Instruction list - arm - growth level 4 ;;;
InstList_Magdollite_Slave1_5xPillarStack:
    dw $0001,Spritemap_Magdollite_NarrowPillarStacks_5x
    dw Instruction_Common_Sleep


;;; $ADFA: Instruction list - arm - growth level 5 ;;;
InstList_Magdollite_Slave1_6xPillarStack:
    dw $0001,Spritemap_Magdollite_NarrowPillarStacks_6x
    dw Instruction_Common_Sleep


;;; $AE00: Instruction list - arm - growth level 6 ;;;
InstList_Magdollite_Slave1_7xPillarStack:
    dw $0001,Spritemap_Magdollite_NarrowPillarStacks_7x
    dw Instruction_Common_Sleep


;;; $AE06: Instruction list - arm - growth level 7 ;;;
InstList_Magdollite_Slave1_8xPillarStack:
    dw $0001,Spritemap_Magdollite_NarrowPillarStacks_8x
    dw Instruction_Common_Sleep


;;; $AE0C: Instruction list - hand - stub ;;;
InstList_Magdollite_Slave2_PillarCap:
    dw $0001,Spritemap_Magdollite_FacingLeft_PillarCap
    dw Instruction_Common_Sleep


;;; $AE12: Instruction - queue sound [[Y]], sound library 2, max queued sounds allowed = 6, if enemy is on-screen ;;;
Instruction_Magdollite_QueueSFXInY_Lib2_Max6_IfOnScreen:
    PHX : PHY
    JSL CheckIfEnemyCenterIsOnScreen
    BNE .offScreen
    LDA.W $0000,Y
    JSL QueueSound_Lib2_Max6

  .offScreen:
    PLY : PLX
    INY #2
    RTL


;;; $AE26: Instruction - move head down 2px ;;;
Instruction_Magdollite_MoveDown2Pixels:
    LDX.W EnemyIndex
    INC.W Enemy.YPosition,X : INC.W Enemy.YPosition,X
    RTL


;;; $AE30: Instruction - move head up 2px ;;;
Instruction_Magdollite_MoveUp2Pixels:
    LDX.W EnemyIndex
    DEC.W Enemy.YPosition,X : DEC.W Enemy.YPosition,X
    RTL


;;; $AE3A: Instruction - set animation active flag ;;;
Instruction_Magdollite_SetWaitingFlag:
    LDX.W EnemyIndex
    LDA.W #$0001 : STA.L Magdollite.animationActiveFlag,X
    RTL


;;; $AE45: Instruction - clear animation active flag ;;;
Instruction_Magdollite_ResetWaitingFlag:
    LDX.W EnemyIndex
    LDA.W #$0000 : STA.L Magdollite.animationActiveFlag,X
    RTL


;;; $AE50: Instruction - move head + arm up 1px ;;;
Instruction_Magdollite_MoveBaseAndPillarUp1Pixel:
    LDX.W EnemyIndex
    DEC.W Enemy.YPosition,X : DEC.W Enemy[1].YPosition,X
    RTL


;;; $AE5A: Instruction - move head + arm down 1px ;;;
Instruction_Magdollite_MoveBaseAndPillarDown1Pixel:
    LDX.W EnemyIndex
    INC.W Enemy.YPosition,X : INC.W Enemy[1].YPosition,X
    RTL


;;; $AE64: Instruction - set submerged head + arm position, make arm + hand visible ;;;
Instruction_Magdollite_MoveDownBy18Pixels_SetSlavesAsVisible:
    LDX.W EnemyIndex
    LDA.L Magdollite.YSpawnPosition,X : CLC : ADC.W #$0018 : STA.W Enemy.YPosition,X : STA.W Enemy[1].YPosition,X
    LDA.W Enemy[1].properties,X : AND.W #$FEFF : STA.W Enemy[1].properties,X
    LDA.W Enemy[2].properties,X : AND.W #$FEFF : STA.W Enemy[2].properties,X
    RTL


;;; $AE88: Instruction - reset head + arm position ;;;
Instruction_Magdollite_RestoreInitialYPositions:
    LDX.W EnemyIndex
    LDA.L Magdollite.YSpawnPosition,X : STA.W Enemy.YPosition,X : STA.W Enemy[1].YPosition,X
    RTL


;;; $AE96: Instruction - set emerged head + arm position, make arm + hand invisible ;;;
Instruction_Magdollite_MoveDown4Pixels_SetSlavesAsInvisible:
    LDX.W EnemyIndex
    LDA.L Magdollite.YSpawnPosition,X : CLC : ADC.W #$0004 : STA.W Enemy.YPosition,X : STA.W Enemy[1].YPosition,X
    LDA.W Enemy[1].properties,X : ORA.W #$0100 : STA.W Enemy[1].properties,X
    LDA.W Enemy[2].properties,X : ORA.W #$0100 : STA.W Enemy[2].properties,X
    RTL


;;; $AEBA: Instruction - spawn magdollite lava enemy projectile ;;;
Instruction_Magdollite_SpawnLavaProjectile:
    PHY
    LDX.W EnemyIndex
    LDY.W #EnemyProjectile_Magdollite
    LDA.W Magdollite.handDirection,X
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    PLY
    RTL


;;; $AECA: Instruction - set open hand position - facing right ;;;
Instruction_Magdollite_ShiftRight8Pixels_Up4Pixels_FaceRight:
    LDX.W EnemyIndex
    LDA.L Magdollite.throwXPosition,X : CLC : ADC.W #$0008 : STA.W Enemy.XPosition,X
    LDA.L Magdollite.throwYPosition,X : CLC : ADC.W #$FFFC : STA.W Enemy.YPosition,X
    RTL


;;; $AEE4: Instruction - set open hand position - facing left ;;;
Instruction_Magdollite_ShiftLeft8Pixels_Up4Pixels_FacingLeft:
    LDX.W EnemyIndex
    LDA.L Magdollite.throwXPosition,X : CLC : ADC.W #$FFF8 : STA.W Enemy.XPosition,X
    LDA.L Magdollite.throwYPosition,X : CLC : ADC.W #$FFFC : STA.W Enemy.YPosition,X
    RTL


;;; $AEFE: Instruction - set closed hand position - facing right ;;;
Instruction_Magdollite_ShiftRight8Pixels_Up4Pixels_Right_dup:
    LDX.W EnemyIndex
    LDA.L Magdollite.throwXPosition,X : CLC : ADC.W #$0008 : STA.W Enemy.XPosition,X
    LDA.L Magdollite.throwYPosition,X : CLC : ADC.W #$FFF8 : STA.W Enemy.YPosition,X
    RTL


;;; $AF18: Instruction - set closed hand position - facing left ;;;
Instruction_Magdollite_ShiftLeft8Pixels_Up4Pixels_Left_dup:
    LDX.W EnemyIndex
    LDA.L Magdollite.throwXPosition,X : CLC : ADC.W #$FFF8 : STA.W Enemy.XPosition,X
    LDA.L Magdollite.throwYPosition,X : CLC : ADC.W #$FFFC : STA.W Enemy.YPosition,X
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $AF32: Unused. Set hand throw position ;;;
UNUSED_Magdollite_RestoreXYPositions_A8AF32:
    LDX.W EnemyIndex
    LDA.L Magdollite.throwXPosition,X : STA.W Enemy.XPosition,X
    LDA.L Magdollite.throwYPosition,X : STA.W Enemy.YPosition,X
    RTL
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $AF44: Instruction - reset cooldown timer ;;;
Instruction_Magdollite_SetCooldownTimerTo100:
    LDX.W EnemyIndex
    LDA.W #$0100 : STA.L Magdollite.cooldownTimer,X
    RTL


;;; $AF4F: Initialisation function pointers ;;;
InitAIFunctionPointers:
    dw Function_Magdollite_Init_Master
    dw Function_Magdollite_Init_Slave1
    dw Function_Magdollite_Init_Slave2


;;; $AF55: Magdollite arm growth table ;;;
MagdolliteArmHeightThreshold:
; Indexed by Magdollite.armGrowthTableIndex. First entry is unused
    dw $0000,$0010,$0020,$0030,$0040,$0050,$0060,$0070,$0080

MagdolliteSlave1InstListPointers:
    dw InstList_Magdollite_Slave1_NarrowPillar_FacingLeft
    dw InstList_Magdollite_Slave1_NarrowPillar_FacingLeft
    dw InstList_Magdollite_Slave1_NarrowPillar_FacingRight
    dw InstList_Magdollite_Slave1_3xPillarStack
    dw InstList_Magdollite_Slave1_4xPillarStack
    dw InstList_Magdollite_Slave1_5xPillarStack
    dw InstList_Magdollite_Slave1_6xPillarStack
    dw InstList_Magdollite_Slave1_7xPillarStack
    dw InstList_Magdollite_Slave1_8xPillarStack

MagdolliteYOffsetAimingAtSamus:
; Hand Y offset
    dw $000C,$000C,$0014,$001C,$0024,$002C,$0034,$003C,$0044


;;; $AF8B: Initialisation AI - enemy $E83F (magdollite) ;;;
InitAI_Magdollite:
    LDX.W EnemyIndex
    LDA.W Enemy.init0,X : ASL : TAX
    JSR.W (InitAIFunctionPointers,X)
    JSR GetMagdolliteSpeeds
    JSR SetMagdolliteGraphicsDrawnHook
    RTL


;;; $AF9D: Magdollite initialisation function - head ;;;
Function_Magdollite_Init_Master:
    LDX.W EnemyIndex
    LDA.W #$0000 : STA.W Magdollite.instList,X
    STA.L Magdollite.headDirection,X : STA.L Magdollite.emergeNotReadyFlag,X
    LDA.W Enemy.YPosition,X : STA.L Magdollite.YSpawnPosition,X
    JSL Get_SamusX_minus_EnemyX
    BPL .keepLeft
    LDA.W #$0001 : STA.L Magdollite.headDirection,X

  .keepLeft:
    LDA.L Magdollite.headDirection,X ; >.<
    LDA.W #InstList_Magdollite_Idling_FacingLeft : STA.W Magdollite.newInstList,X
    LDA.L Magdollite.headDirection,X : BNE .keepLeft2
    LDA.W #InstList_Magdollite_Idling_FacingRight : STA.W Magdollite.newInstList,X

  .keepLeft2:
    JSR SetMagdolliteInstList
    LDA.W #Function_Magdollite_WaitForSamusToGetNear : STA.W Magdollite.function,X
    RTS


;;; $AFE2: Magdollite initialisation function - arm ;;;
Function_Magdollite_Init_Slave1:
    LDX.W EnemyIndex
    LDA.W Enemy.YPosition,X : STA.L Magdollite.YSpawnPosition,X
    LDA.W #$0000 : STA.W Magdollite.instList,X : STA.L Magdollite.finishedGrowingFlag,X
    LDA.W #$0001 : STA.L Magdollite.notEmergedFlag,X
    LDA.W #InstList_Magdollite_Slave1_NarrowPillar_FacingLeft : STA.W Magdollite.newInstList,X
    JSR SetMagdolliteInstList
    LDA.W Enemy.YPosition,X : CLC : ADC.W #$0020 : STA.W Enemy.YPosition,X
    LDA.W #Function_Magdollite_Slave1_WaitForAttackToBeTriggered : STA.W Magdollite.function,X
    LDA.W Enemy.properties,X : ORA.W #$0100 : STA.W Enemy.properties,X
    RTS


;;; $B020: Magdollite initialisation function - hand ;;;
Function_Magdollite_Init_Slave2:
    LDX.W EnemyIndex
    LDA.W Enemy.YPosition,X : STA.L Magdollite.YSpawnPosition,X
    LDA.W Enemy.XPosition,X : STA.L ExtraEnemy7800+$22,X
    LDA.W #$0000 : STA.W Magdollite.instList,X : STA.L Magdollite.cooldownTimer,X
    LDA.W #InstList_Magdollite_Slave2_PillarCap : STA.W Magdollite.newInstList,X
    JSR SetMagdolliteInstList
    LDA.W Enemy.YPosition,X : CLC : ADC.W #$0020 : STA.W Enemy.YPosition,X
    LDA.W #Function_Magdollite_Slave2_Idling_WaitingForTrigger : STA.W Magdollite.function,X
    LDA.W Enemy.properties,X : ORA.W #$0100 : STA.W Enemy.properties,X
    RTS


;;; $B05E: Set magdollite arm Y velocities ;;;
GetMagdolliteSpeeds:
    LDX.W EnemyIndex
    LDA.W Enemy.init1+1,X : AND.W #$00FF : ASL #3 : TAY
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,Y : STA.L Magdollite.downVelocity,X
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,Y : STA.L Magdollite.downSubVelocity,X
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+4,Y : STA.L Magdollite.upVelocity,X
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+6,Y : STA.L Magdollite.upSubVelocity,X
    RTS


;;; $B088: Set up magdollite palette cycling ;;;
SetMagdolliteGraphicsDrawnHook:
    LDA.W #EnemyGraphicsDrawnHook_Magdollite_PeriodicallyCyclePalettes : STA.W EnemyGraphicsDrawnHook
    LDA.W #EnemyGraphicsDrawnHook_Magdollite_PeriodicallyCyclePalettes>>16 : STA.W EnemyGraphicsDrawnHook+2
    LDA.W Enemy.palette,X : AND.W #$0E00 : LSR #4
    CLC : ADC.W #$0100 : STA.W EnemyPaletteCycle_PaletteIndex
    LDA.W #$0008 : STA.W EnemyPaletteCycle_Timer
    LDA.W #$0000 : STA.W EnemyPaletteCycle_ColorSetIndex
    RTS


;;; $B0B2: Enemy graphics drawn hook - magdollite - periodically cycle between palettes ;;;
EnemyGraphicsDrawnHook_Magdollite_PeriodicallyCyclePalettes:
; Why is this one implemented differently to the others? >_<;
    LDA.W DoorTransitionFlagEnemiesPause : BNE .return
    LDX.W EnemyIndex
    LDA.W EnemyPaletteCycle_Timer : DEC : STA.W EnemyPaletteCycle_Timer : BNE .return
    LDA.W #$0008 : STA.W EnemyPaletteCycle_Timer
    LDA.W EnemyPaletteCycle_ColorSetIndex : INC : STA.W EnemyPaletteCycle_ColorSetIndex
    AND.W #$0003 : ASL #5 : TAY
    LDA.W Palette_Magdollite_Glow_0,Y : STA.B DP_Temp12
    LDA.W Palette_Magdollite_Glow_1,Y : STA.B DP_Temp14
    LDA.W Palette_Magdollite_Glow_2,Y : STA.B DP_Temp16
    LDA.W Palette_Magdollite_Glow_3,Y : STA.B DP_Temp18
    LDA.W EnemyPaletteCycle_PaletteIndex : TAX
    LDA.B DP_Temp12 : STA.L Palettes+$12,X
    LDA.B DP_Temp14 : STA.L Palettes+$14,X
    LDA.B DP_Temp16 : STA.L Palettes+$16,X
    LDA.B DP_Temp18 : STA.L Palettes+$18,X

  .return:
    RTL


;;; $B10A: Main AI - enemy $E83F (magdollite) ;;;
MainAI_Magdollite:
    LDX.W EnemyIndex
    LDA.L Magdollite.cooldownTimer,X : DEC : STA.L Magdollite.cooldownTimer,X
    JSR.W (Magdollite.function,X)
    RTL


;;; $B11A: Magdollite function - idle ;;;
Function_Magdollite_WaitForSamusToGetNear:
    LDX.W EnemyIndex ; >.<
    LDA.W #$0000 : STA.L Magdollite.headDirection,X
    LDA.W #InstList_Magdollite_Idling_FacingLeft : STA.W Magdollite.newInstList,X
    JSL Get_SamusX_minus_EnemyX
    BMI .facingDirectionChosen
    LDA.W #InstList_Magdollite_Idling_FacingRight : STA.W Magdollite.newInstList,X
    LDA.W #$0001 : STA.L Magdollite.headDirection,X

  .facingDirectionChosen:
    JSR SetMagdolliteInstList
    LDA.L ExtraEnemy7800+$88,X : BPL .return
    LDA.W #$0000 : STA.L ExtraEnemy7800+$88,X
    LDA.W Enemy.init1,X : AND.W #$00FF
    JSL IsSamusWithinAPixelColumnsOfEnemy
    BEQ .return
    LDA.W #InstList_Magdollite_SplashIntoLavaAndFormBasePillar_Left_0 : STA.W Magdollite.newInstList,X
    LDA.L Magdollite.headDirection,X : BEQ .keepLeft
    LDA.W #InstList_Magdollite_SplashIntoLavaAndFormBasePillar_Right_0 : STA.W Magdollite.newInstList,X

  .keepLeft:
    JSR SetMagdolliteInstList
    LDA.W #Function_Magdollite_WaitUntilBasePillarFormed : STA.W Magdollite.function,X

  .return:
    RTS


;;; $B175: Magdollite function - wait until submerged ;;;
Function_Magdollite_WaitUntilBasePillarFormed:
    LDX.W EnemyIndex ; >.<
    LDA.L Magdollite.animationActiveFlag,X : BNE .return
    LDA.W #$0001 : STA.L Magdollite.emergeNotReadyFlag,X
    LDA.W #$0000 : STA.L ExtraEnemy7800+$5A,X
    LDA.W #Function_Magdollite_WaitForOtherPartsToFinish : STA.W Magdollite.function,X

  .return:
    RTS


;;; $B193: Magdollite function - emerge when ready ;;;
Function_Magdollite_WaitForOtherPartsToFinish:
    LDX.W EnemyIndex ; >.<
    LDA.L Magdollite.emergeNotReadyFlag,X : BNE .return
    LDA.W #InstList_Magdollite_UnformBasePillar_SplashBackToIdle_Left_0 : STA.W Magdollite.newInstList,X
    JSL Get_SamusX_minus_EnemyX
    BMI .facingDirectionChosen
    LDA.W #InstList_Magdollite_UnformBasePillar_SplashBackToIdle_Right_0 : STA.W Magdollite.newInstList,X

  .facingDirectionChosen:
    JSR SetMagdolliteInstList
    LDA.W #Function_Magdollite_UnformBasePillarBackToHeadIdling : STA.W Magdollite.function,X

  .return:
    RTS


;;; $B1B8: Magdollite function - wait until emerged ;;;
Function_Magdollite_UnformBasePillarBackToHeadIdling:
    LDX.W EnemyIndex ; >.<
    LDA.L Magdollite.animationActiveFlag,X : BNE .return
    LDA.W #InstList_Magdollite_Idling_FacingLeft : STA.W Magdollite.newInstList,X
    JSL Get_SamusX_minus_EnemyX
    BMI .facingDirectionChosen
    LDA.W #InstList_Magdollite_Idling_FacingRight : STA.W Magdollite.newInstList,X

  .facingDirectionChosen:
    JSR SetMagdolliteInstList
    LDA.W #Function_Magdollite_WaitForSamusToGetNear : STA.W Magdollite.function,X

  .return:
    RTS


;;; $B1DD: Magdollite function - wait until head submerged ;;;
Function_Magdollite_Slave1_WaitForAttackToBeTriggered:
    LDX.W EnemyIndex ; >.<
    LDA.L Magdollite.notEmergedFlag,X : BNE .return
    LDA.W #Function_Magdollite_Slave1_HandlePillarGrowth : STA.W Magdollite.function,X
    LDA.W #$0000 : STA.W Magdollite.negativeArmHeight,X : STA.L Magdollite.notEmergedFlag,X
    LDA.W #$0002 : STA.W Magdollite.armGrowthTableIndex,X
    LDA.L Magdollite.YSpawnPosition,X : STA.W Enemy.YPosition,X

  .return:
    RTS


;;; $B204: Magdollite function - growing arm ;;;
Function_Magdollite_Slave1_HandlePillarGrowth:
    LDX.W EnemyIndex ; >.<
    CLC
    LDA.W Enemy.YSubPosition,X : ADC.L Magdollite.upSubVelocity-$40,X : STA.W Enemy.YSubPosition,X : BCC +
    INC.W Magdollite.negativeArmHeight,X

+   LDA.W Enemy.YPosition,X : ADC.L Magdollite.upVelocity-$40,X : STA.W Enemy.YPosition,X
    CLC
    LDA.W Magdollite.negativeArmHeight,X : ADC.L Magdollite.upVelocity-$40,X : STA.W Magdollite.negativeArmHeight,X
    JSR Function_Magdollite_Slave1_AddPillarStacksToReachSamusHeight
    RTS


;;; $B230: Grow arm ;;;
Function_Magdollite_Slave1_AddPillarStacksToReachSamusHeight:
    LDA.W Magdollite.negativeArmHeight,X : EOR.W #$FFFF : INC : CMP.W #$006C : BPL .doneGrowing
    LDY.W Magdollite.armGrowthTableIndex,X
    LDA.W Enemy.YPosition,X : SEC : SBC.W MagdolliteYOffsetAimingAtSamus,Y : CMP.W SamusYPosition : BMI .doneGrowing
    LDA.W Magdollite.negativeArmHeight,X : EOR.W #$FFFF : INC : CMP.W MagdolliteArmHeightThreshold,Y : BPL .increasePillarStack
    BRA .return

  .doneGrowing:
    LDA.W #Function_Magdollite_Slave1_GetEnemyIndex : STA.W Magdollite.function,X
    LDA.W #$0001 : STA.L Magdollite.finishedGrowingFlag,X
    LDA.W Magdollite.negativeArmHeight,X : EOR.W #$FFFF : INC : CMP.W MagdolliteArmHeightThreshold,Y : BPL .increasePillarStack
    BRA .return

  .increasePillarStack:
    INC.W Magdollite.armGrowthTableIndex,X : INC.W Magdollite.armGrowthTableIndex,X
    LDA.W Enemy.YPosition,X : CLC : ADC.W #$0008 : STA.W Enemy.YPosition,X
    LDY.W Magdollite.armGrowthTableIndex,X
    LDA.W MagdolliteSlave1InstListPointers,Y : STA.W Magdollite.newInstList,X
    JSR SetMagdolliteInstList

  .return:
    RTS


;;; $B291: RTS ;;;
Function_Magdollite_Slave1_GetEnemyIndex:
    LDX.W EnemyIndex ; >.<
    RTS


;;; $B295: Magdollite function - shrinking arm ;;;
Function_Magdollite_Slave1_HandlePillarShrinking:
    LDX.W EnemyIndex ; >.<
    LDA.W Enemy.YPosition,X : CLC : ADC.L Magdollite.downVelocity-$40,X : STA.W Enemy.YPosition,X
    LDA.W Magdollite.negativeArmHeight,X : CLC : ADC.L Magdollite.downVelocity-$40,X : STA.W Magdollite.negativeArmHeight,X
    LDA.W Enemy.YSubPosition,X : CLC : ADC.L Magdollite.downSubVelocity-$40,X : BCC +
    INC.W Enemy.YPosition,X : INC.W Magdollite.negativeArmHeight,X

+   STA.W Enemy.YSubPosition,X
    JSR ShrinkMagdolliteArm
    RTS


;;; $B2C5: Shrink arm ;;;
ShrinkMagdolliteArm:
    LDY.W Magdollite.armGrowthTableIndex,X : DEY #2
    LDA.W Magdollite.negativeArmHeight,X : BPL .doneShrinking
    EOR.W #$FFFF : INC : CMP.W MagdolliteArmHeightThreshold,Y : BMI .removeTileAndRecenter
    BRA .return

  .removeTileAndRecenter:
    DEC.W Magdollite.armGrowthTableIndex,X : DEC.W Magdollite.armGrowthTableIndex,X
    LDA.W Enemy.YPosition,X : SEC : SBC.W #$0008 : STA.W Enemy.YPosition,X
    LDY.W Magdollite.armGrowthTableIndex,X
    LDA.W MagdolliteSlave1InstListPointers,Y : STA.W Magdollite.newInstList,X
    JSR SetMagdolliteInstList
    BRA .return

  .doneShrinking:
    LDA.W #$0001 : STA.L Magdollite.notEmergedFlag,X
    LDA.W #$0000 : STA.L Magdollite.emergeNotReadyFlag-$40,X
    LDA.W #Function_Magdollite_Slave1_WaitForAttackToBeTriggered : STA.W Magdollite.function,X

  .return:
    RTS


;;; $B30D: Magdollite function - idle ;;;
Function_Magdollite_Slave2_Idling_WaitingForTrigger:
    LDX.W EnemyIndex ; >.<
    LDA.W Enemy[-2].var5,X : CMP.W #Function_Magdollite_WaitUntilBasePillarFormed : BNE .return
    LDA.W #Function_Magdollite_Slave2_SetToThrowFireballsAfterGrowing : STA.W Magdollite.function,X

  .return:
    RTS


;;; $B31F: Magdollite function - wait until finished throwing lava and shrink arm ;;;
Function_Magdollite_Slave2_SetSlave1ToShrinkAfterFireballs:
    LDX.W EnemyIndex ; >.<
    LDA.L Magdollite.animationActiveFlag,X : BNE .done
    LDA.W #InstList_Magdollite_Slave2_PillarCap : STA.W Magdollite.newInstList,X
    JSR SetMagdolliteInstList
    LDA.W #Function_Magdollite_Slave1_HandlePillarShrinking : STA.W Enemy[-1].var5,X
    LDA.W #Function_Magdollite_Slave2_GoBackToIdlingAfterPillarShrinks : STA.W Magdollite.function,X
    LDA.W #$0000 : STA.L Magdollite.finishedGrowingFlag-$40,X
    LDA.L Magdollite.throwXPosition,X : STA.W Enemy.XPosition,X
    LDA.L Magdollite.throwYPosition,X : STA.W Enemy.YPosition,X

  .done:
    JSR SetMagdolliteYRadius
    RTS


;;; $B356: Magdollite function - wait until finished growing and throw lava ;;;
Function_Magdollite_Slave2_SetToThrowFireballsAfterGrowing:
    LDX.W EnemyIndex ; >.<
    LDA.L Magdollite.finishedGrowingFlag-$40,X : BEQ .waiting
    LDA.W #InstList_Magdollite_Slave2_ThrowFireballs_FacingLeft : STA.W Magdollite.newInstList,X
    LDA.W #$0000 : STA.W Magdollite.handDirection,X
    JSL Get_SamusX_minus_EnemyX
    BMI .directionChosen
    LDA.W #InstList_Magdollite_ThrowFireballs_FacingRight : STA.W Magdollite.newInstList,X
    LDA.W #$0001 : STA.W Magdollite.handDirection,X

  .directionChosen:
    JSR SetMagdolliteInstList
    LDA.W #Function_Magdollite_Slave2_SetSlave1ToShrinkAfterFireballs : STA.W Magdollite.function,X
    LDA.W Enemy.XPosition,X : STA.L Magdollite.throwXPosition,X
    LDA.W Enemy.YPosition,X : STA.L Magdollite.throwYPosition,X
    BRA .done

  .waiting:
    LDY.W Enemy[-1].var1,X
    LDA.W Enemy[-1].YPosition,X : SEC : SBC.W MagdolliteYOffsetAimingAtSamus,Y : STA.W Enemy.YPosition,X

  .done:
    JSR SetMagdolliteYRadius
    RTS


;;; $B3A7: Magdollite function - move with shrinking arm ;;;
Function_Magdollite_Slave2_GoBackToIdlingAfterPillarShrinks:
    LDX.W EnemyIndex ; >.<
    LDA.W Enemy[-2].var5,X : CMP.W #Function_Magdollite_WaitForSamusToGetNear : BNE .notWaitingForTrigger
    LDA.W #Function_Magdollite_Slave2_Idling_WaitingForTrigger : STA.W Magdollite.function,X
    BRA .done

  .notWaitingForTrigger:
    LDY.W Enemy[-1].var1,X
    LDA.W Enemy[-1].YPosition,X : SEC : SBC.W MagdolliteYOffsetAimingAtSamus,Y : STA.W Enemy.YPosition,X

  .done:
    JSR SetMagdolliteYRadius
    RTS


;;; $B3CB: Update magdollite head Y radius ;;;
SetMagdolliteYRadius:
    LDA.W Enemy[-2].YPosition,X : SEC : SBC.W Enemy.YPosition,X
    CLC : ADC.W #$0002 : STA.W Enemy[-2].YHitboxRadius,X
    CMP.W #$0008 : BPL .return
    LDA.W #$0008 : STA.W Enemy[-2].YHitboxRadius,X

  .return:
    RTS


;;; $B3E5: Set magdollite instruction list ;;;
SetMagdolliteInstList:
    LDX.W EnemyIndex
    LDA.W Magdollite.newInstList,X : CMP.W Magdollite.instList,X : BEQ .return
    STA.W Enemy.instList,X : STA.W Magdollite.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X

  .return:
    RTS


;;; $B400: Power bomb reaction - enemy $E83F (magdollite) ;;;
PowerBombReaction_Magdollite:
    JSL CommonA8_NormalEnemyPowerBombAI
    BRA ContactReaction_Magdollite_Common


;;; $B406: Enemy touch - enemy $E83F (magdollite) ;;;
EnemyTouch_Magdollite:
    JSL CommonA8_NormalEnemyTouchAI
    BRA ContactReaction_Magdollite_Common


;;; $B40C: Enemy shot - enemy $E83F (magdollite) ;;;
EnemyShot_Magdollite:
    JSL NormalEnemyShotAI
; fallthrough to ContactReaction_Magdollite_Common


;;; $B410: Magdollite shared contact reaction ;;;
ContactReaction_Magdollite_Common:
    LDX.W EnemyIndex
    LDA.W Enemy.health,X : BNE .notDead
    LDA.W Enemy[1].properties,X : ORA.W #$0200 : STA.W Enemy[1].properties,X
    LDA.W Enemy[2].properties,X : ORA.W #$0200 : STA.W Enemy[2].properties,X

  .notDead:
    LDA.W Enemy.freezeTimer,X : BEQ .return
    STA.W Enemy[1].freezeTimer,X : STA.W Enemy[2].freezeTimer,X
    LDA.W Enemy[1].AI,X : ORA.W #$0004 : STA.W Enemy[1].AI,X
    LDA.W Enemy[2].AI,X : ORA.W #$0004 : STA.W Enemy[2].AI,X

  .return:
    RTL


;;; $B448: Magdollite spritemaps ;;;
Spritemap_Magdollite_FacingLeft_Head_0:
    dw $0003
    %spritemapEntry(0, $04, $FF, 0, 0, 2, 0, $123)
    %spritemapEntry(0, $04, $F7, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1F4, $F7, 0, 0, 2, 0, $10A)

Spritemap_Magdollite_FacingLeft_Head_1:
    dw $0003
    %spritemapEntry(0, $04, $00, 0, 0, 2, 0, $123)
    %spritemapEntry(0, $04, $F8, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1F4, $F8, 0, 0, 2, 0, $10A)

Spritemap_Magdollite_FacingLeft_Head_2:
    dw $0003
    %spritemapEntry(0, $04, $01, 0, 0, 2, 0, $123)
    %spritemapEntry(0, $04, $F9, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1F4, $F9, 0, 0, 2, 0, $10A)

Spritemap_Magdollite_FacingLeft_Fist_0:
    dw $0003
    %spritemapEntry(0, $00, $04, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $1F8, $04, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1F8, $F4, 0, 0, 2, 0, $108)

Spritemap_Magdollite_FacingLeft_Fist_1:
    dw $0003
    %spritemapEntry(0, $1FD, $04, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $1F5, $04, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1F9, $F5, 0, 0, 2, 0, $108)

Spritemap_Magdollite_FacingLeft_Hand_FingersStraight:
    dw $0002
    %spritemapEntry(1, $00, $FC, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1F0, $F9, 0, 0, 2, 0, $104)

Spritemap_Magdollite_FacingLeft_Hand_FingersCurled:
    dw $0002
    %spritemapEntry(1, $00, $F8, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 2, 0, $100)

Spritemap_Magdollite_FacingLeft_PillarCap:
    dw $0002
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 0, $124)

Spritemap_Magdollite_FacingLeft_WidePillarSection:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10E)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Magdollite_Blank_A8B4C8:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10C)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Magdollite_FacingLeft_Head_PokingOutOfLava:
    dw $0003
    %spritemapEntry(0, $04, $FC, 0, 0, 2, 0, $128)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $127)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 0, $126)

Spritemap_Magdollite_FacingLeft_Head_BarelyPokingOutOfLava:
    dw $0003
    %spritemapEntry(0, $04, $FC, 0, 0, 2, 0, $12B)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $12A)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 0, $129)

Spritemap_Magdollite_FacingRight_Head_0:
    dw $0003
    %spritemapEntry(0, $1F4, $FF, 0, 1, 2, 0, $123)
    %spritemapEntry(0, $1F4, $F7, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $1FC, $F7, 0, 1, 2, 0, $10A)

Spritemap_Magdollite_FacingRight_Head_1:
    dw $0003
    %spritemapEntry(0, $1F4, $00, 0, 1, 2, 0, $123)
    %spritemapEntry(0, $1F4, $F8, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $1FC, $F8, 0, 1, 2, 0, $10A)

Spritemap_Magdollite_FacingRight_Head_2:
    dw $0003
    %spritemapEntry(0, $1F4, $01, 0, 1, 2, 0, $123)
    %spritemapEntry(0, $1F4, $F9, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $1FC, $F9, 0, 1, 2, 0, $10A)

Spritemap_Magdollite_FacingRight_Fist_0:
    dw $0003
    %spritemapEntry(0, $1F8, $04, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $00, $04, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $1F8, $F4, 0, 1, 2, 0, $108)

Spritemap_Magdollite_FacingRight_Fist_1:
    dw $0003
    %spritemapEntry(0, $1FB, $04, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $03, $04, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $1F7, $F5, 0, 1, 2, 0, $108)

Spritemap_Magdollite_FacingRight_Hand_FingersStraight:
    dw $0002
    %spritemapEntry(1, $1F0, $FC, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $00, $F9, 0, 1, 2, 0, $104)

Spritemap_Magdollite_FacingRight_Hand_FingersCurled:
    dw $0002
    %spritemapEntry(1, $1F0, $F8, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $00, $F8, 0, 1, 2, 0, $100)

if  !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Magdollite_FacingRight_PillarCap_A8B55E:
    dw $0002
    %spritemapEntry(0, $1F8, $FC, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 0, $124)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Magdollite_FacingRight_WidePillarSection:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $10E)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Magdollite_FacingRight_NarrowPillar_A8B571:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $10C)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Magdollite_FacingRight_Head_PokingOutOfLava:
    dw $0003
    %spritemapEntry(0, $1F4, $FC, 0, 1, 2, 0, $128)
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 0, $127)
    %spritemapEntry(0, $04, $FC, 0, 1, 2, 0, $126)

Spritemap_Magdollite_FacingRight_Head_BarelyPokingOutOfLava:
    dw $0003
    %spritemapEntry(0, $1F4, $FC, 0, 1, 2, 0, $12B)
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 0, $12A)
    %spritemapEntry(0, $04, $FC, 0, 1, 2, 0, $129)

Spritemap_Magdollite_FacingLeft_NarrowPillarSection:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10C)

Spritemap_Magdollite_FacingRight_NarrowPillarSection:
    dw $0002
    %spritemapEntry(1, $1F8, $00, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $10C)

Spritemap_Magdollite_NarrowPillarStacks_3x:
    dw $0003
    %spritemapEntry(1, $1F8, $08, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $E8, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10C)

Spritemap_Magdollite_NarrowPillarStacks_4x:
    dw $0004
    %spritemapEntry(1, $1F8, $10, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $00, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $E0, 0, 0, 2, 0, $10C)

Spritemap_Magdollite_NarrowPillarStacks_5x:
    dw $0005
    %spritemapEntry(1, $1F8, $18, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $08, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $D8, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $E8, 0, 0, 2, 0, $10C)

Spritemap_Magdollite_NarrowPillarStacks_6x:
    dw $0006
    %spritemapEntry(1, $1F8, $10, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $20, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $00, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $E0, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $D0, 0, 0, 2, 0, $10C)

Spritemap_Magdollite_NarrowPillarStacks_7x:
    dw $0007
    %spritemapEntry(1, $1F8, $28, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $18, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $08, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $E8, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $D8, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $C8, 0, 0, 2, 0, $10C)

Spritemap_Magdollite_NarrowPillarStacks_8x:
    dw $0008
    %spritemapEntry(1, $1F8, $30, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $00, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $20, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $10, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $E0, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $D0, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $C0, 0, 0, 2, 0, $10C)


;;; $B65E: Palette - enemy $E87F (beetom) ;;;
Palette_Beetom:
    dw $3800,$57FF,$42F7,$158C,$00A5,$4F5A,$36B5,$2610
    dw $1DCE,$1CDF,$4FE0,$3B20,$2A20,$1097,$6BDF,$042E


if !FEATURE_KEEP_UNREFERENCED
;;; $B67E: Unused. Beetom eye colours ;;;
UNUSED_BeetomEyeColors_A8B67E:
; Colours Ah..Ch
    dw $4FE0,$3B20,$2A20,$3BE0,$2680,$1580,$2740,$11E0
    dw $00E0,$12A0,$0140,$0040
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $B696: Instruction list - crawling - facing left ;;;
InstList_Beetom_Crawling_FacingLeft_0:
    dw Instruction_Common_DisableOffScreenProcessing

InstList_Beetom_Crawling_FacingLeft_1:
    dw $000A,Spritemap_Beetom_0
    dw $000A,Spritemap_Beetom_1
    dw $000A,Spritemap_Beetom_2
    dw $000A,Spritemap_Beetom_1
    dw Instruction_Common_GotoY
    dw InstList_Beetom_Crawling_FacingLeft_1


;;; $B6AC: Instruction list - hop - facing left ;;;
InstList_Beetom_Hop_FacingLeft:
    dw Instruction_Common_EnableOffScreenProcessing
    dw $0004,Spritemap_Beetom_3
    dw $0008,Spritemap_Beetom_4
    dw $0004,Spritemap_Beetom_3
    dw $0001,Spritemap_Beetom_0
    dw Instruction_Common_Sleep


if !FEATURE_KEEP_UNREFERENCED
;;; $B6C0: Unused. Instruction list - small hop - facing left ;;;
UNUSED_InstList_Beetom_SmallHop_FacingLeft_A8B6C0:
    dw Instruction_Common_EnableOffScreenProcessing
    dw $0004,Spritemap_Beetom_3
    dw $0001,Spritemap_Beetom_0
    dw Instruction_Common_Sleep
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $B6CC: Instruction list - draining Samus - facing left ;;;
InstList_Beetom_DrainingSamus_FacingLeft_0:
    dw $0005,Spritemap_Beetom_5
    dw $0005,Spritemap_Beetom_6
    dw $0005,Spritemap_Beetom_7
    dw $0030,Spritemap_Beetom_6
    dw Instruction_Beetom_Nothing

InstList_Beetom_DrainingSamus_FacingLeft_1:
    dw $0005,Spritemap_Beetom_8
    dw $0005,Spritemap_Beetom_9
    dw $0005,Spritemap_Beetom_A
    dw $0005,Spritemap_Beetom_9
    dw Instruction_Common_GotoY
    dw InstList_Beetom_DrainingSamus_FacingLeft_1


;;; $B6F2: Instruction list - crawling - facing right ;;;
InstList_Beetom_Crawling_FacingRight_0:
    dw Instruction_Common_DisableOffScreenProcessing

InstList_Beetom_Crawling_FacingRight_1:
    dw $000A,Spritemap_Beetom_B
    dw $000A,Spritemap_Beetom_C
    dw $000A,Spritemap_Beetom_D
    dw $000A,Spritemap_Beetom_C
    dw Instruction_Common_GotoY
    dw InstList_Beetom_Crawling_FacingRight_1


;;; $B708: Instruction list - hop - facing right ;;;
InstList_Beetom_Hop_FacingRight:
    dw Instruction_Common_EnableOffScreenProcessing
    dw $0004,Spritemap_Beetom_E
    dw $0008,Spritemap_Beetom_F
    dw $0004,Spritemap_Beetom_E
    dw $0001,Spritemap_Beetom_B
    dw Instruction_Common_Sleep


if !FEATURE_KEEP_UNREFERENCED
;;; $B71C: Unused. Instruction list - small hop - facing right ;;;
UNUSED_InstList_Beetom_SmallHop_FacingRight_A8B71C:
    dw Instruction_Common_EnableOffScreenProcessing
    dw $0004,Spritemap_Beetom_E
    dw $0001,Spritemap_Beetom_B
    dw Instruction_Common_Sleep
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $B728: Instruction list - draining Samus - facing right ;;;
InstList_Beetom_DrainingSamus_FacingRight_0:
    dw $0005,Spritemap_Beetom_10
    dw $0005,Spritemap_Beetom_11
    dw $0005,Spritemap_Beetom_12
    dw $0030,Spritemap_Beetom_11
    dw Instruction_Beetom_Nothing

InstList_Beetom_DrainingSamus_FacingRight_1:
    dw $0005,Spritemap_Beetom_13
    dw $0005,Spritemap_Beetom_14
    dw $0005,Spritemap_Beetom_15
    dw $0005,Spritemap_Beetom_14
    dw Instruction_Common_GotoY
    dw InstList_Beetom_DrainingSamus_FacingRight_1


;;; $B74E: Samus not in proximity beetom function pointers ;;;
SamusNotInProximityBeetomFunctionPointers:
    dw Function_Beetom_StartIdling ; Facing left
    dw Function_Beetom_StartIdling ; Facing right
    dw Function_Beetom_StartShortHopRight ; Facing left
    dw Function_Beetom_StartLongHopRight ; Facing right
    dw Function_Beetom_StartShortHopRight ; Facing left
    dw Function_Beetom_StartShortHopLeft ; Facing right
    dw Function_Beetom_StartLongHopLeft ; Facing left
    dw Function_Beetom_StartLongHopRight ; Facing right


;;; $B75E: Instruction - nothing ;;;
Instruction_Beetom_Nothing:
    LDX.W EnemyIndex
    RTL


;;; $B762: Set beetom instruction list ;;;
SetBeetomInstList:
    LDX.W EnemyIndex
    LDA.L Beetom.instList,X
    STA.W Enemy.instList,X
    LDA.W #$0001
    STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    RTS


;;; $B776: Initialisation AI - enemy $E87F (beetom) ;;;
InitAI_Beetom:
    LDX.W EnemyIndex
    LDA.W #$0000 : STA.W Beetom.functionTimer,X
    STA.W Beetom.function,X : STA.L Beetom.fallingFlag,X ; >.< 0 function pointer
    STA.L Beetom.attachedToSamusFlag,X : STA.W Enemy.var0,X
    LDA.W #$0040 : STA.W Beetom.buttonCounter,X
    LDA.B DP_Controller1Input : STA.W Beetom.previousController1Input,X
    LDA.W #$0017 : STA.W RandomNumberSeed
    LDA.W #$3000 : STA.B DP_Temp16
    LDA.W #$0004 : STA.B DP_Temp18
    JSR Beetom_CalculateInitialHopSpeed
    STA.L Beetom.initialShortLeapYSpeedIndex,X
    LDA.W #$4000 : STA.B DP_Temp16
    LDA.W #$0005 : STA.B DP_Temp18
    JSR Beetom_CalculateInitialHopSpeed
    STA.L Beetom.initialLongLeapYSpeedIndex,X
    LDA.W #$3000 : STA.B DP_Temp16
    LDA.W #$0003 : STA.B DP_Temp18
    JSR Beetom_CalculateInitialHopSpeed
    STA.L Beetom.initialLungeYSpeedIndex,X
    LDA.W #InstList_Beetom_Crawling_FacingRight_0 : STA.L Beetom.instList,X
    JSL Get_SamusX_minus_EnemyX
    BPL .SamusToTheLeft
    LDA.W #InstList_Beetom_Crawling_FacingLeft_0 : STA.L Beetom.instList,X

  .SamusToTheLeft:
    JSR SetBeetomInstList
    LDA.W #Function_Beetom_DecideAction : STA.W Beetom.function,X
    RTL


;;; $B7EF: Calculate initial hop speed ;;;
Beetom_CalculateInitialHopSpeed:
;; Parameters:
;;     $16: Target hop height. Unit 1/100h pixels
;;     $18: Y acceleration scalar
;; Returns:
;;     A: Initial Y speed table index
    STZ.B DP_Temp12 : STZ.B DP_Temp14

  .loop:
    LDA.B DP_Temp12 : CLC : ADC.B DP_Temp18 : STA.B DP_Temp12
    ASL #3 : TAY
    LDA.B DP_Temp14 : CLC : ADC.W CommonEnemySpeeds_QuadraticallyIncreasing+1,Y : STA.B DP_Temp14
    CMP.B DP_Temp16 : BMI .loop
    LDA.B DP_Temp12
    RTS


;;; $B80D: Main AI - enemy $E87F (beetom) ;;;
MainAI_Beetom:
    LDX.W EnemyIndex
    JSR.W (Beetom.function,X)
    RTL


;;; $B814: Beetom function - decide action ;;;
Function_Beetom_DecideAction:
    LDX.W EnemyIndex
    LDA.W #$0060
    JSL IsSamusWithinAPixelColumnsOfEnemy
    BEQ .notInProximity
    LDA.W #Function_Beetom_DecideAction_SamusInProximity : STA.W Beetom.function,X
    BRA .return

  .notInProximity:
    LDA.W #Function_Beetom_DecideAction_SamusNotInProximity : STA.W Beetom.function,X

  .return:
    RTS


;;; $B82F: Beetom function - decide action - Samus not in proximity ;;;
Function_Beetom_DecideAction_SamusNotInProximity:
    LDX.W EnemyIndex
    JSL GenerateRandomNumber
    LDA.W RandomNumberSeed : AND.W #$0007 : ASL : TAY
    LDA.W SamusNotInProximityBeetomFunctionPointers,Y : STA.W Beetom.function,X
    LDA.W RandomNumberSeed : AND.W #$0001 : STA.L Beetom.direction,X
    RTS


;;; $B84F: Beetom function - start idling ;;;
Function_Beetom_StartIdling:
    LDX.W EnemyIndex
    LDA.W #$0020 : STA.W Beetom.functionTimer,X
    LDA.W #Function_Beetom_Idling : STA.W Beetom.function,X
    RTS


;;; $B85F: Beetom function - start crawling left ;;;
Function_Beetom_StartCrawlingLeft:
    LDX.W EnemyIndex
    LDA.W #Function_Beetom_CrawlingLeft : STA.W Beetom.function,X
    LDA.W #InstList_Beetom_Crawling_FacingLeft_0 : STA.L Beetom.instList,X
    JSR SetBeetomInstList
    RTS


;;; $B873: Beetom function - start crawling right ;;;
Function_Beetom_StartCrawlingRight:
    LDX.W EnemyIndex
    LDA.W #Function_Beetom_CrawlingRight : STA.W Beetom.function,X
    LDA.W #InstList_Beetom_Crawling_FacingRight_0 : STA.L Beetom.instList,X
    JSR SetBeetomInstList
    RTS


;;; $B887: Beetom function - start short hop left ;;;
Function_Beetom_StartShortHopRight:
    LDX.W EnemyIndex
    LDA.L Beetom.initialShortLeapYSpeedIndex,X : STA.W Beetom.YSpeedTableIndex,X
    LDA.W #Function_Beetom_ShortHopLeft : STA.W Beetom.function,X
    LDA.W #$0000 : STA.L Beetom.fallingFlag,X
    LDA.W #InstList_Beetom_Hop_FacingLeft : STA.L Beetom.instList,X
    JSR SetBeetomInstList
    RTS


;;; $B8A9: Beetom function - start short hop right ;;;
Function_Beetom_StartShortHopLeft:
    LDX.W EnemyIndex
    LDA.L Beetom.initialShortLeapYSpeedIndex,X : STA.W Beetom.YSpeedTableIndex,X
    LDA.W #Function_Beetom_ShortHopRight : STA.W Beetom.function,X
    LDA.W #$0000 : STA.L Beetom.fallingFlag,X
    LDA.W #InstList_Beetom_Hop_FacingRight : STA.L Beetom.instList,X
    JSR SetBeetomInstList
    RTS


;;; $B8CB: Beetom function - start long hop left ;;;
Function_Beetom_StartLongHopLeft:
    LDX.W EnemyIndex
    LDA.L Beetom.initialLongLeapYSpeedIndex,X : STA.W Beetom.YSpeedTableIndex,X
    LDA.W #Function_Beetom_LongHopLeft : STA.W Beetom.function,X
    LDA.W #$0000 : STA.L Beetom.fallingFlag,X
    LDA.W #InstList_Beetom_Hop_FacingLeft : STA.L Beetom.instList,X
    JSR SetBeetomInstList
    RTS


;;; $B8ED: Beetom function - start long hop right ;;;
Function_Beetom_StartLongHopRight:
    LDX.W EnemyIndex
    LDA.L Beetom.initialLongLeapYSpeedIndex,X : STA.W Beetom.YSpeedTableIndex,X
    LDA.W #Function_Beetom_LongHopRight : STA.W Beetom.function,X
    LDA.W #$0000 : STA.L Beetom.fallingFlag,X
    LDA.W #InstList_Beetom_Hop_FacingRight : STA.L Beetom.instList,X
    JSR SetBeetomInstList
    RTS


;;; $B90F: Beetom function - decide action - Samus in proximity ;;;
Function_Beetom_DecideAction_SamusInProximity:
    LDX.W EnemyIndex
    LDA.L Beetom.initialLungeYSpeedIndex,X : STA.W Beetom.YSpeedTableIndex,X
    LDA.W #InstList_Beetom_Hop_FacingRight : STA.L Beetom.instList,X
    LDA.W #Function_Beetom_LungeRight : STA.W Beetom.function,X
    LDA.W #$0001 : STA.L Beetom.direction,X
    JSL Get_SamusX_minus_EnemyX
    BPL .SamusToTheLeft
    LDA.W #InstList_Beetom_Hop_FacingLeft : STA.L Beetom.instList,X
    LDA.W #Function_Beetom_LungeLeft : STA.W Beetom.function,X
    LDA.W #$0000 : STA.L Beetom.direction,X

  .SamusToTheLeft:
    JSR SetBeetomInstList
    LDA.W #$0000 : STA.L Beetom.fallingFlag,X
    RTS


;;; $B952: Beetom function - start draining Samus - facing left ;;;
Function_Beetom_StartDrainingSamus_FacingLeft:
    LDX.W EnemyIndex
    LDA.W #InstList_Beetom_DrainingSamus_FacingLeft_0 : STA.L Beetom.instList,X
    JSR SetBeetomInstList
    LDA.W #Function_Beetom_DrainingSamus_FacingLeft : STA.W Beetom.function,X
    RTS


;;; $B966: Beetom function - start draining Samus - facing right ;;;
Function_Beetom_StartDrainingSamus_FacingRight:
    LDX.W EnemyIndex
    LDA.W #InstList_Beetom_DrainingSamus_FacingRight_0 : STA.L Beetom.instList,X
    JSR SetBeetomInstList
    LDA.W #Function_Beetom_DrainingSamus_FacingRight : STA.W Beetom.function,X
    RTS


;;; $B97A: Beetom function - start dropping ;;;
Function_Beetom_StartDropping:
    LDX.W EnemyIndex
    LDA.W #InstList_Beetom_Crawling_FacingLeft_0 : STA.L Beetom.instList,X
    LDA.L Beetom.direction,X : BEQ .keepLeft
    LDA.W #InstList_Beetom_Crawling_FacingRight_0 : STA.L Beetom.instList,X

  .keepLeft:
    JSR SetBeetomInstList
    LDA.W #$0000 : STA.L Beetom.fallingFlag,X
    LDA.W #Function_Beetom_Dropping : STA.W Beetom.function,X
    RTS


;;; $B9A2: Beetom function - start being flung ;;;
Function_Beetom_StartBeingFlung:
    LDX.W EnemyIndex
    LDA.W #$0000 : STA.W Beetom.YSpeedTableIndex,X
    LDA.W #Function_Beetom_BeingFlung : STA.W Beetom.function,X
    RTS


;;; $B9B2: Beetom function - idling ;;;
Function_Beetom_Idling:
    LDX.W EnemyIndex
    DEC.W Beetom.functionTimer,X : BPL .return
    LDA.W #Function_Beetom_DecideAction : STA.W Beetom.function,X

  .return:
    RTS


;;; $B9C1: Beetom function - crawling left ;;;
Function_Beetom_CrawlingLeft:
    LDX.W EnemyIndex
    DEC.W Beetom.functionTimer,X : BMI .end
    LDA.W Enemy.XPosition,X : SEC : SBC.W #$0008 : STA.W Enemy.XPosition,X
    LDA.W #$0001 : STA.B DP_Temp14
    STZ.B DP_Temp12
    JSL MoveEnemyDownBy_14_12
    BCS .collidedWithBlock
    LDA.W #Function_Beetom_StartCrawlingRight : STA.W Beetom.function,X
    DEC.W Enemy.YPosition,X
    LDA.W Enemy.XPosition,X : CLC : ADC.W #$0008 : STA.W Enemy.XPosition,X
    BRA .return

  .collidedWithBlock:
    LDA.W Enemy.XPosition,X : CLC : ADC.W #$0008 : STA.W Enemy.XPosition,X
    LDA.W #$C000 : STA.B DP_Temp12
    LDA.W #$FFFF : STA.B DP_Temp14
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCC .return
    LDA.W #Function_Beetom_StartCrawlingRight : STA.W Beetom.function,X
    BRA .return

  .end:
    LDA.W #$0040 : STA.W Beetom.functionTimer,X
    LDA.W #Function_Beetom_DecideAction : STA.W Beetom.function,X

  .return:
    RTS


;;; $BA24: Beetom function - crawling right ;;;
Function_Beetom_CrawlingRight:
    LDX.W EnemyIndex
    DEC.W Beetom.functionTimer,X : BMI .end
    LDA.W Enemy.XPosition,X : CLC : ADC.W #$0008 : STA.W Enemy.XPosition,X
    LDA.W #$0001 : STA.B DP_Temp14
    STZ.B DP_Temp12
    JSL MoveEnemyDownBy_14_12
    BCS .collidedWithBlock
    LDA.W #Function_Beetom_StartCrawlingLeft : STA.W Beetom.function,X
    DEC.W Enemy.YPosition,X
    LDA.W Enemy.XPosition,X : SEC : SBC.W #$0008 : STA.W Enemy.XPosition,X
    BRA .return

  .collidedWithBlock:
    LDA.W Enemy.XPosition,X : SEC : SBC.W #$0008 : STA.W Enemy.XPosition,X
    LDA.W #$4000 : STA.B DP_Temp12
    STZ.B DP_Temp14
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCC .return
    LDA.W #Function_Beetom_StartCrawlingLeft : STA.W Beetom.function,X
    BRA .return

  .end:
    LDA.W #$0040 : STA.W Beetom.functionTimer,X
    LDA.W #Function_Beetom_DecideAction : STA.W Beetom.function,X

  .return:
    RTS


;;; $BA84: Beetom function - short hop left ;;;
Function_Beetom_ShortHopLeft:
    LDX.W EnemyIndex
    LDA.L Beetom.fallingFlag,X : BNE .falling
    JSR Function_Beetom_YMovement_ShortHop_Rising
    BRA +

  .falling:
    JSR Function_Beetom_YMovement_ShortHop_Falling

+   LDA.W #$FFFF : STA.B DP_Temp14
    LDA.W #$C000 : STA.B DP_Temp12
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCC .return
    LDA.L Beetom.direction,X : EOR.W #$0001 : STA.L Beetom.direction,X
    LDA.W #Function_Beetom_StartDropping : STA.W Beetom.function,X

  .return:
    RTS


;;; $BAB7: Beetom function - short hop right ;;;
Function_Beetom_ShortHopRight:
    LDX.W EnemyIndex
    LDA.L Beetom.fallingFlag,X : BNE .falling
    JSR Function_Beetom_YMovement_ShortHop_Rising
    BRA +

  .falling:
    JSR Function_Beetom_YMovement_ShortHop_Falling

+   STZ.B DP_Temp14
    LDA.W #$4000 : STA.B DP_Temp12
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCC .return
    LDA.L Beetom.direction,X : EOR.W #$0001 : STA.L Beetom.direction,X
    LDA.W #Function_Beetom_StartDropping : STA.W Beetom.function,X

  .return:
    RTS


;;; $BAE7: Beetom Y movement - short hop - rising ;;;
Function_Beetom_YMovement_ShortHop_Rising:
    LDA.W Beetom.YSpeedTableIndex,X : ASL #3 : TAY
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+6,Y : STA.B DP_Temp14
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+4,Y : STA.B DP_Temp12
    JSL MoveEnemyDownBy_14_12
    BCC .notCollidedWithBlock
    LDA.W #Function_Beetom_StartDropping : STA.W Beetom.function,X
    BRA .return

  .notCollidedWithBlock:
    LDA.W Beetom.YSpeedTableIndex,X : SEC : SBC.W #$0004 : STA.W Beetom.YSpeedTableIndex,X
    BPL .return
    LDA.W #$0000 : STA.W Beetom.YSpeedTableIndex,X
    LDA.W #$0001 : STA.L Beetom.fallingFlag,X

  .return:
    RTS


;;; $BB20: Beetom Y movement - short hop - falling ;;;
Function_Beetom_YMovement_ShortHop_Falling:
    LDA.W Beetom.YSpeedTableIndex,X : ASL #3 : TAY
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+2,Y : STA.B DP_Temp14
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing,Y : STA.B DP_Temp12
    JSL MoveEnemyDownBy_14_12
    BCC .notCollidedWithBlock
    LDA.W #Function_Beetom_DecideAction : STA.W Beetom.function,X
    BRA .return

  .notCollidedWithBlock:
    LDA.W Beetom.YSpeedTableIndex,X : CLC : ADC.W #$0004 : STA.W Beetom.YSpeedTableIndex,X
    CMP.W #$0040 : BMI .return
    LDA.W #$0040 : STA.W Beetom.YSpeedTableIndex,X

  .return:
    RTS


;;; $BB55: Beetom function - long hop left ;;;
Function_Beetom_LongHopLeft:
    LDX.W EnemyIndex
    LDA.L Beetom.fallingFlag,X : BNE .falling
    JSR Function_Beetom_YMovement_LongHop_Rising
    BRA +

  .falling:
    JSR Function_Beetom_YMovement_LongHop_Falling

+   LDA.W #$FFFF : STA.B DP_Temp14
    LDA.W #$C000 : STA.B DP_Temp12
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCC .return
    LDA.L Beetom.direction,X : EOR.W #$0001 : STA.L Beetom.direction,X
    LDA.W #Function_Beetom_StartDropping : STA.W Beetom.function,X

  .return:
    RTS


;;; $BB88: Beetom function - long hop right ;;;
Function_Beetom_LongHopRight:
    LDX.W EnemyIndex
    LDA.L Beetom.fallingFlag,X : BNE .falling
    JSR Function_Beetom_YMovement_LongHop_Rising
    BRA +

  .falling:
    JSR Function_Beetom_YMovement_LongHop_Falling

+   STZ.B DP_Temp14
    LDA.W #$4000 : STA.B DP_Temp12
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCC .return
    LDA.L Beetom.direction,X : EOR.W #$0001 : STA.L Beetom.direction,X
    LDA.W #Function_Beetom_StartDropping : STA.W Beetom.function,X

  .return:
    RTS


;;; $BBB8: Beetom Y movement - long hop - rising ;;;
Function_Beetom_YMovement_LongHop_Rising:
    LDA.W Beetom.YSpeedTableIndex,X : ASL #3 : TAY
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+6,Y : STA.B DP_Temp14
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+4,Y : STA.B DP_Temp12
    JSL MoveEnemyDownBy_14_12
    BCC .notCollidedWithBlock
    LDA.W #Function_Beetom_StartDropping : STA.W Beetom.function,X
    BRA .return

  .notCollidedWithBlock:
    LDA.W Beetom.YSpeedTableIndex,X : SEC : SBC.W #$0005 : STA.W Beetom.YSpeedTableIndex,X
    BPL .return
    LDA.W #$0000 : STA.W Beetom.YSpeedTableIndex,X
    LDA.W #$0001 : STA.L Beetom.fallingFlag,X

  .return:
    RTS


;;; $BBF1: Beetom Y movement - long hop - falling ;;;
Function_Beetom_YMovement_LongHop_Falling:
    LDA.W Beetom.YSpeedTableIndex,X : ASL #3 : TAY
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+2,Y : STA.B DP_Temp14
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing,Y : STA.B DP_Temp12
    JSL MoveEnemyDownBy_14_12
    BCC .notCollidedWithBlock
    LDA.W #Function_Beetom_DecideAction : STA.W Beetom.function,X
    BRA .return

  .notCollidedWithBlock:
    LDA.W Beetom.YSpeedTableIndex,X : CLC : ADC.W #$0005 : STA.W Beetom.YSpeedTableIndex,X
    CMP.W #$0040 : BMI .return
    LDA.W #$0040 : STA.W Beetom.YSpeedTableIndex,X

  .return:
    RTS


;;; $BC26: Beetom function - lunge left ;;;
Function_Beetom_LungeLeft:
    LDX.W EnemyIndex
    LDA.L Beetom.fallingFlag,X : BNE .falling
    JSR Function_Beetom_YMovement_Lunge_Rising
    BRA +

  .falling:
    JSR Function_Beetom_YMovement_Lunge_Falling

+   LDA.W #$0003 : EOR.W #$FFFF : INC : STA.B DP_Temp14
    STZ.B DP_Temp12
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCC .return
    LDA.L Beetom.direction,X : EOR.W #$0001 : STA.L Beetom.direction,X
    LDA.W #Function_Beetom_StartDropping : STA.W Beetom.function,X

  .return:
    RTS


;;; $BC5A: Beetom function - lunge right ;;;
Function_Beetom_LungeRight:
    LDX.W EnemyIndex
    LDA.L Beetom.fallingFlag,X : BNE .falling
    JSR Function_Beetom_YMovement_Lunge_Rising
    BRA +

  .falling:
    JSR Function_Beetom_YMovement_Lunge_Falling

+   LDA.W #$0003 : STA.B DP_Temp14
    STZ.B DP_Temp12
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCC .return
    LDA.L Beetom.direction,X : EOR.W #$0001 : STA.L Beetom.direction,X
    LDA.W #Function_Beetom_StartDropping : STA.W Beetom.function,X

  .return:
    RTS


;;; $BC8A: Beetom Y movement - lunge - rising ;;;
Function_Beetom_YMovement_Lunge_Rising:
    LDA.W Beetom.YSpeedTableIndex,X : ASL #3 : TAY
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+6,Y : STA.B DP_Temp14
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+4,Y : STA.B DP_Temp12
    JSL MoveEnemyDownBy_14_12
    BCC .notCollidedWithBlock
    LDA.W #Function_Beetom_StartDropping : STA.W Beetom.function,X
    BRA .return

  .notCollidedWithBlock:
    LDA.W Beetom.YSpeedTableIndex,X : SEC : SBC.W #$0005 : STA.W Beetom.YSpeedTableIndex,X
    BPL .return
    LDA.W #$0000 : STA.W Beetom.YSpeedTableIndex,X
    LDA.W #$0001 : STA.L Beetom.fallingFlag,X

  .return:
    RTS


Function_Beetom_YMovement_Lunge_Falling:
    LDA.W Beetom.YSpeedTableIndex,X : ASL #3 : TAY
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+2,Y : STA.B DP_Temp14
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing,Y : STA.B DP_Temp12
    JSL MoveEnemyDownBy_14_12
    BCC .notCollidedWithBlock
    LDA.W #Function_Beetom_DecideAction : STA.W Beetom.function,X
    BRA .return

  .notCollidedWithBlock:
    LDA.W Beetom.YSpeedTableIndex,X : CLC : ADC.W #$0003 : STA.W Beetom.YSpeedTableIndex,X
    CMP.W #$0040 : BMI .return
    LDA.W #$0040 : STA.W Beetom.YSpeedTableIndex,X

  .return:
    RTS


;;; $BCF8: Beetom function - draining Samus - facing left ;;;
Function_Beetom_DrainingSamus_FacingLeft:
    LDX.W EnemyIndex
    LDA.W Beetom.buttonCounter,X : BNE .attached
    STZ.B DP_Temp12
    LDA.W #$0010 : STA.B DP_Temp14
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCC .notCollidedWithWall
    LDA.W #$0001 : STA.L Beetom.direction,X
    STZ.B DP_Temp12
    LDA.W #$FFE0 : STA.B DP_Temp14
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes

  .notCollidedWithWall:
    LDA.W #$0000 : STA.L Beetom.attachedToSamusFlag,X
    LDA.W #Function_Beetom_StartBeingFlung : STA.W Beetom.function,X
    BRA .return

  .attached:
    LDA.W SamusXPosition : STA.W Enemy.XPosition,X
    LDA.W SamusYPosition : SEC : SBC.W #$0004 : STA.W Enemy.YPosition,X
    JSR UpdateBeetomButtonCounter

  .return:
    RTS


;;; $BD42: Beetom function - draining Samus - facing right ;;;
Function_Beetom_DrainingSamus_FacingRight:
    LDX.W EnemyIndex
    LDA.W Beetom.buttonCounter,X : BNE .attached
    STZ.B DP_Temp12
    LDA.W #$FFF0 : STA.B DP_Temp14
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCC .notCollidedWithWall
    LDA.W #$0000 : STA.L Beetom.direction,X
    STZ.B DP_Temp12
    LDA.W #$0020 : STA.B DP_Temp14
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes

  .notCollidedWithWall:
    LDA.W #$0000 : STA.L Beetom.attachedToSamusFlag,X
    LDA.W #Function_Beetom_StartBeingFlung : STA.W Beetom.function,X
    BRA .return

  .attached:
    LDA.W SamusXPosition : STA.W Enemy.XPosition,X
    LDA.W SamusYPosition : SEC : SBC.W #$0004 : STA.W Enemy.YPosition,X
    JSR UpdateBeetomButtonCounter

  .return:
    RTS


;;; $BD8C: Update beetom button counter ;;;
UpdateBeetomButtonCounter:
    LDX.W EnemyIndex
    LDA.B DP_Controller1Input : CMP.W Beetom.previousController1Input,X : BEQ .return
    STA.W Beetom.previousController1Input,X
    DEC.W Beetom.buttonCounter,X

  .return:
    RTS


;;; $BD9D: Beetom function - dropping ;;;
Function_Beetom_Dropping:
    LDX.W EnemyIndex
    LDA.W #$0003 : STA.B DP_Temp14
    LDA.W #$0000 : STA.B DP_Temp12
    JSL MoveEnemyDownBy_14_12
    BCC .return
    LDA.L Beetom.direction,X : BNE .keepLeft
    LDA.W #Function_Beetom_StartCrawlingLeft : STA.W Beetom.function,X
    BRA .return

  .keepLeft:
    LDA.W #Function_Beetom_StartCrawlingRight : STA.W Beetom.function,X

  .return:
    RTS


;;; $BDC5: Beetom function - being flung ;;;
Function_Beetom_BeingFlung:
    LDX.W EnemyIndex
    JSR Function_Beetom_Movement_BeingFlung
    RTS


;;; $BDCC: Beetom movement - being flung ;;;
Function_Beetom_Movement_BeingFlung:
    LDA.W Beetom.YSpeedTableIndex,X : ASL #3 : TAY
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+2,Y : STA.B DP_Temp14
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing,Y : STA.B DP_Temp12
    JSL MoveEnemyDownBy_14_12
    BCC .notCollidedWithBlock
    LDA.W #Function_Beetom_DecideAction : STA.W Beetom.function,X
    BRA +

  .notCollidedWithBlock:
    LDA.W Beetom.YSpeedTableIndex,X : CLC : ADC.W #$0001 : STA.W Beetom.YSpeedTableIndex,X
    CMP.W #$0040 : BMI +
    LDA.W #$0040 : STA.W Beetom.YSpeedTableIndex,X

+   LDA.L Beetom.direction,X : BNE .right
    LDA.W #$0002
    BRA +

  .right:
    LDA.W #$0002 : EOR.W #$FFFF : INC ; >.<

+   STA.B DP_Temp14
    STZ.B DP_Temp12
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCC .return
    LDA.L Beetom.direction,X : EOR.W #$0001 : STA.L Beetom.direction,X
    LDA.W #Function_Beetom_StartDropping : STA.W Beetom.function,X

  .return:
    RTS


;;; $BE2E: Enemy touch - enemy $E87F (beetom) ;;;
EnemyTouch_Beetom:
    LDX.W EnemyIndex
    LDA.L Beetom.attachedToSamusFlag,X : BNE .attached
    LDA.L Beetom.direction,X : BNE .right
    LDA.W #Function_Beetom_StartDrainingSamus_FacingLeft : STA.W Beetom.function,X
    BRA +

  .right:
    LDA.W #Function_Beetom_StartDrainingSamus_FacingRight : STA.W Beetom.function,X

+   LDA.W #$0001 : STA.L Beetom.attachedToSamusFlag,X
    LDA.W #$0040 : STA.W Beetom.buttonCounter,X
    LDA.W #$0002 : STA.W Enemy.layer,X
    LDA.W SamusXPosition : SEC : SBC.W Enemy.XPosition,X : STA.L ExtraEnemy7800+$C,X
    LDA.W SamusYPosition : SEC : SBC.W Enemy.YPosition,X : STA.L ExtraEnemy7800+$E,X

  .attached:
    LDA.W ContactDamageIndex : BNE .damage
    LDA.W NumberOfTimesMainEnemyRoutineExecuted : AND.W #$0007 : CMP.W #$0007 : BNE +
    LDA.W Energy : CMP.W #$001E : BMI +
    LDA.W #$002D
    JSL QueueSound_Lib3_Max6

+   LDA.W Enemy.frameCounter,X : AND.W #$003F : CMP.W #$003F : BNE .return

  .damage:
    JSL CommonA8_NormalEnemyTouchAI
    LDA.W #$0000 : STA.W SamusInvincibilityTimer : STA.W SamusKnockbackTimer

  .return:
    RTL


;;; $BEAC: Enemy shot - enemy $E87F (beetom) ;;;
EnemyShot_Beetom:
    JSL CommonA8_NormalEnemyShotAI
    LDX.W EnemyIndex
    LDA.W Enemy.freezeTimer,X : BEQ .return
    LDA.W Beetom.function,X : CMP.W #Function_Beetom_DrainingSamus_FacingRight : BEQ .startDropping
    CMP.W #Function_Beetom_DrainingSamus_FacingLeft : BNE .return

  .startDropping:
    LDA.W #Function_Beetom_StartDropping : STA.W Beetom.function,X

  .return:
    LDA.W #$0000 : STA.L Beetom.attachedToSamusFlag,X
    RTL


;;; $BED3: Beetom spritemaps ;;;
Spritemap_Beetom_0:
    dw $0005
    %spritemapEntry(0, $00, $FE, 0, 0, 2, 0, $11E)
    %spritemapEntry(0, $00, $F6, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $05, $00, 0, 0, 2, 0, $11F)
    %spritemapEntry(0, $05, $F8, 0, 0, 2, 0, $10F)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $100)

Spritemap_Beetom_1:
    dw $0005
    %spritemapEntry(0, $00, $FF, 0, 0, 2, 0, $11E)
    %spritemapEntry(0, $00, $F7, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $06, $00, 0, 0, 2, 0, $11F)
    %spritemapEntry(0, $05, $F9, 0, 0, 2, 0, $10F)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $102)

Spritemap_Beetom_2:
    dw $0005
    %spritemapEntry(0, $00, $00, 0, 0, 2, 0, $11E)
    %spritemapEntry(0, $01, $F8, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $07, $00, 0, 0, 2, 0, $11F)
    %spritemapEntry(0, $06, $FA, 0, 0, 2, 0, $10F)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $104)

Spritemap_Beetom_3:
    dw $0005
    %spritemapEntry(0, $07, $FE, 1, 0, 2, 0, $10D)
    %spritemapEntry(0, $1FF, $FE, 1, 0, 2, 0, $10C)
    %spritemapEntry(0, $0C, $FF, 0, 0, 2, 0, $10F)
    %spritemapEntry(0, $0D, $07, 0, 0, 2, 0, $11F)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $100)

Spritemap_Beetom_4:
    dw $0005
    %spritemapEntry(0, $0E, $0F, 0, 0, 2, 0, $11F)
    %spritemapEntry(0, $0C, $07, 0, 0, 2, 0, $10F)
    %spritemapEntry(0, $08, $02, 0, 0, 2, 0, $10D)
    %spritemapEntry(0, $00, $02, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $100)

Spritemap_Beetom_5:
    dw $0005
    %spritemapEntry(0, $02, $00, 0, 0, 2, 0, $10D)
    %spritemapEntry(0, $1FA, $00, 0, 0, 2, 0, $10C)
    %spritemapEntry(0, $00, $05, 0, 0, 2, 0, $11D)
    %spritemapEntry(0, $1F8, $05, 0, 0, 2, 0, $11C)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $106)

Spritemap_Beetom_6:
    dw $0005
    %spritemapEntry(0, $01, $00, 0, 0, 2, 0, $10D)
    %spritemapEntry(0, $1F9, $00, 0, 0, 2, 0, $10C)
    %spritemapEntry(0, $1FF, $05, 0, 0, 2, 0, $11D)
    %spritemapEntry(0, $1F8, $05, 0, 0, 2, 0, $11C)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $108)

Spritemap_Beetom_7:
    dw $0005
    %spritemapEntry(0, $00, $00, 0, 0, 2, 0, $10D)
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 0, $10C)
    %spritemapEntry(0, $1FE, $05, 0, 0, 2, 0, $11D)
    %spritemapEntry(0, $1F8, $05, 0, 0, 2, 0, $11C)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10A)

Spritemap_Beetom_8:
    dw $0006
    %spritemapEntry(0, $1FA, $F8, 0, 0, 2, 0, $120)
    %spritemapEntry(0, $02, $00, 0, 0, 2, 0, $10D)
    %spritemapEntry(0, $1FA, $00, 0, 0, 2, 0, $10C)
    %spritemapEntry(0, $00, $05, 0, 0, 2, 0, $11D)
    %spritemapEntry(0, $1F8, $05, 0, 0, 2, 0, $11C)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $106)

Spritemap_Beetom_9:
    dw $0006
    %spritemapEntry(0, $1FA, $F8, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $01, $00, 0, 0, 2, 0, $10D)
    %spritemapEntry(0, $1F9, $00, 0, 0, 2, 0, $10C)
    %spritemapEntry(0, $1FF, $05, 0, 0, 2, 0, $11D)
    %spritemapEntry(0, $1F8, $05, 0, 0, 2, 0, $11C)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $108)

Spritemap_Beetom_A:
    dw $0006
    %spritemapEntry(0, $1FA, $F8, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $00, $00, 0, 0, 2, 0, $10D)
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 0, $10C)
    %spritemapEntry(0, $1FE, $05, 0, 0, 2, 0, $11D)
    %spritemapEntry(0, $1F8, $05, 0, 0, 2, 0, $11C)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10A)

Spritemap_Beetom_B:
    dw $0005
    %spritemapEntry(0, $1F8, $FE, 0, 1, 2, 0, $11E)
    %spritemapEntry(0, $1F8, $F6, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $1F3, $00, 0, 1, 2, 0, $11F)
    %spritemapEntry(0, $1F3, $F8, 0, 1, 2, 0, $10F)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $100)

Spritemap_Beetom_C:
    dw $0005
    %spritemapEntry(0, $1F8, $FF, 0, 1, 2, 0, $11E)
    %spritemapEntry(0, $1F8, $F7, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $1F2, $00, 0, 1, 2, 0, $11F)
    %spritemapEntry(0, $1F3, $F9, 0, 1, 2, 0, $10F)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $102)

Spritemap_Beetom_D:
    dw $0005
    %spritemapEntry(0, $1F8, $00, 0, 1, 2, 0, $11E)
    %spritemapEntry(0, $1F7, $F8, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $1F1, $00, 0, 1, 2, 0, $11F)
    %spritemapEntry(0, $1F2, $FA, 0, 1, 2, 0, $10F)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $104)

Spritemap_Beetom_E:
    dw $0005
    %spritemapEntry(0, $1F1, $FE, 1, 1, 2, 0, $10D)
    %spritemapEntry(0, $1F9, $FE, 1, 1, 2, 0, $10C)
    %spritemapEntry(0, $1EC, $FF, 0, 1, 2, 0, $10F)
    %spritemapEntry(0, $1EB, $07, 0, 1, 2, 0, $11F)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $100)

Spritemap_Beetom_F:
    dw $0005
    %spritemapEntry(0, $1EA, $0F, 0, 1, 2, 0, $11F)
    %spritemapEntry(0, $1EC, $07, 0, 1, 2, 0, $10F)
    %spritemapEntry(0, $1F0, $02, 0, 1, 2, 0, $10D)
    %spritemapEntry(0, $1F8, $02, 0, 1, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $100)

Spritemap_Beetom_10:
    dw $0005
    %spritemapEntry(0, $1F6, $00, 0, 1, 2, 0, $10D)
    %spritemapEntry(0, $1FE, $00, 0, 1, 2, 0, $10C)
    %spritemapEntry(0, $1F8, $05, 0, 1, 2, 0, $11D)
    %spritemapEntry(0, $00, $05, 0, 1, 2, 0, $11C)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $106)

Spritemap_Beetom_11:
    dw $0005
    %spritemapEntry(0, $1F7, $00, 0, 1, 2, 0, $10D)
    %spritemapEntry(0, $1FF, $00, 0, 1, 2, 0, $10C)
    %spritemapEntry(0, $1F9, $05, 0, 1, 2, 0, $11D)
    %spritemapEntry(0, $00, $05, 0, 1, 2, 0, $11C)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $108)

Spritemap_Beetom_12:
    dw $0005
    %spritemapEntry(0, $1F8, $00, 0, 1, 2, 0, $10D)
    %spritemapEntry(0, $00, $00, 0, 1, 2, 0, $10C)
    %spritemapEntry(0, $1FA, $05, 0, 1, 2, 0, $11D)
    %spritemapEntry(0, $00, $05, 0, 1, 2, 0, $11C)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $10A)

Spritemap_Beetom_13:
    dw $0006
    %spritemapEntry(0, $1FE, $F8, 0, 1, 2, 0, $120)
    %spritemapEntry(0, $1F6, $00, 0, 1, 2, 0, $10D)
    %spritemapEntry(0, $1FE, $00, 0, 1, 2, 0, $10C)
    %spritemapEntry(0, $1F8, $05, 0, 1, 2, 0, $11D)
    %spritemapEntry(0, $00, $05, 0, 1, 2, 0, $11C)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $106)

Spritemap_Beetom_14:
    dw $0006
    %spritemapEntry(0, $1FE, $F8, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $1F7, $00, 0, 1, 2, 0, $10D)
    %spritemapEntry(0, $1FF, $00, 0, 1, 2, 0, $10C)
    %spritemapEntry(0, $1F9, $05, 0, 1, 2, 0, $11D)
    %spritemapEntry(0, $00, $05, 0, 1, 2, 0, $11C)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $108)

Spritemap_Beetom_15:
    dw $0006
    %spritemapEntry(0, $1FE, $F8, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $1F8, $00, 0, 1, 2, 0, $10D)
    %spritemapEntry(0, $00, $00, 0, 1, 2, 0, $10C)
    %spritemapEntry(0, $1FA, $05, 0, 1, 2, 0, $11D)
    %spritemapEntry(0, $00, $05, 0, 1, 2, 0, $11C)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $10A)


;;; $C143: Palette - enemy $E8BF (powamp) ;;;
Palette_Powamp:
    dw $3800,$57FF,$42F7,$0929,$00A5,$4F5A,$36B5,$2610
    dw $1DCE,$02FF,$01BF,$000F,$0008,$03FF,$0237,$00D1


;;; $C163: Instruction list - body - fast ;;;
InstList_Powamp_Body_FastAnimation:
    dw $0005,Spritemap_Powamp_Body_CheeksLowered
    dw $0005,Spritemap_Powamp_Body_CheeksLifting
    dw $0005,Spritemap_Powamp_Body_CheeksRaised
    dw Instruction_Common_GotoY
    dw InstList_Powamp_Body_FastAnimation


InstList_Powamp_Body_SlowAnimation:
    dw $0009,Spritemap_Powamp_Body_CheeksLowered
    dw $0009,Spritemap_Powamp_Body_CheeksLifting
    dw $0009,Spritemap_Powamp_Body_CheeksRaised
    dw Instruction_Common_GotoY
    dw InstList_Powamp_Body_SlowAnimation


;;; $C183: Instruction list - balloon - inflate ;;;
InstList_Powamp_Balloon_Inflate_0:
    dw $0001,Spritemap_Powamp_Balloon_Deflated

InstList_Powamp_Balloon_Inflate_1:
    dw $0006,Spritemap_Powamp_Balloon_Inflating

InstList_Powamp_Balloon_Inflate_2:
    dw $00A0,Spritemap_Powamp_Balloon_FullyInflated
    dw Instruction_Common_Sleep


;;; $C191: Instruction list - balloon - deflate ;;;
InstList_Powamp_Balloon_StartSinking:
    dw $0001,Spritemap_Powamp_Balloon_FullyInflated
    dw $0006,Spritemap_Powamp_Balloon_Inflating


;;; $C199: Instruction list - balloon - initial ;;;
InstList_Powamp_Balloon_Deflated:
    dw $00A0,Spritemap_Powamp_Balloon_Deflated
    dw Instruction_Common_Sleep



;;; $C19F: Powamp constants ;;;
PowampTravelDistanceWhenNotGrappled:
    dw $0040

PowampWiggleTable:
; Wiggle table. X offsets applied for 5 frames each in a loop
    dw $0000,$0001,$0002,$0003,$0002,$0001,$0000,$FFFF
    dw $FFFE,$FFFD,$FFFE,$FFFF

Powamp_YAccel_Rising:
    dw $0000,$0000

Powamp_YAccel_Sinking:
    dw $0000,$0000

Powamp_InitialYVelocity_Sinking:
    dw $0001,$0000

Powamp_InitialYVelocity_Rising:
    dw $FFFF,$8000


;;; $C1C9: Initialisation AI - enemy $E8BF (powamp) ;;;
InitAI_Powamp:
    LDX.W EnemyIndex
    LDA.W Enemy.properties,X : ORA.W #$2000 : STA.W Enemy.properties,X
    LDA.W #Spritemap_Common_Nothing : STA.W Enemy.spritemap,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.W Enemy.init0,X : BNE .balloon
    LDA.W #$003C : STA.W Powamp.functionTimer,X
    LDA.W #Function_Powamp_Deflated_Resting : STA.W Powamp.function,X
    LDA.W #InstList_Powamp_Body_SlowAnimation : STA.W Enemy.instList,X
    BRA .return

  .balloon:
    LDA.W Enemy.XPosition,X : STA.W Powamp.balloonSpawnXPosition,X
    LDA.W Enemy.YPosition,X : STA.W Powamp.balloonSpawnYPosition,X
    LDA.W #RTL_A8C568 : STA.W Powamp.function,X
    LDA.W #InstList_Powamp_Balloon_Deflated : STA.W Enemy.instList,X
    LDA.W Enemy.init1,X : STA.W Powamp.balloonGrappleTravelDistance,X

  .return:
    RTL


;;; $C21C: Main AI - enemy $E8BF (powamp) ;;;
MainAI_Powamp:
    LDX.W EnemyIndex
    JMP.W (Powamp.function,X)


;;; $C222: RTL ;;;
RTL_A8C222:
    RTL


;;; $C223: Spawn powamp spike enemy projectiles ;;;
FirePowampSpikesIn8Directions:
    LDY.W #$0007

  .loop:
    TYA
    PHY
    LDY.W #EnemyProjectile_Powamp
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    PLY : DEY : BPL .loop
    RTS


;;; $C234: Set powamp balloon Y position ;;;
HandlePowampBalloonYOffset:
    LDA.W Enemy[-1].instList,X : CMP.W #InstList_Powamp_Balloon_StartSinking : BPL .sinking
    SEC : SBC.W #$0004 : SEC : SBC.W #InstList_Powamp_Balloon_Inflate_0
    LSR : CMP.W #$0006 : BMI +
    LDA.W #$0000

+   TAY
    LDA.W Enemy.YPosition,X : CLC : ADC.W .risingYOffsets,Y : STA.W Enemy[-1].YPosition,X
    BRA .return

  .sinking:
    SEC : SBC.W #$0004 : SEC : SBC.W #InstList_Powamp_Balloon_StartSinking
    LSR : CMP.W #$0006 : BMI +
    LDA.W #$0000

+   TAY
    LDA.W Enemy.YPosition,X : CLC : ADC.W .sinkingYOffsets,Y : STA.W Enemy[-1].YPosition,X

  .return:
    RTS

; Balloon Y offsets. Indexed by animation frame into inflate/deflate instruction list
  .risingYOffsets:
    dw $FFF4,$FFF0,$FFEC

  .sinkingYOffsets:
    dw $FFEC,$FFF0,$FFF4


;;; $C283: Powamp function - body - deflated - resting ;;;
Function_Powamp_Deflated_Resting:
    DEC.W Powamp.functionTimer,X : BEQ .timerExpired
    BPL .done

  .timerExpired:
    LDA.W #$0001 : STA.W Enemy[-1].instTimer,X
    LDA.W #InstList_Powamp_Balloon_Inflate_0 : STA.W Enemy[-1].instList,X
    LDA.W #Function_Powamp_Inflating : STA.W Powamp.function,X
    LDA.W #$000A : STA.W Powamp.functionTimer,X

  .done:
    JSR HandlePowampBalloonYOffset
    RTL


;;; $C2A6: Powamp function - body - inflating ;;;
Function_Powamp_Inflating:
    DEC.W Powamp.functionTimer,X : BEQ .timerExpired
    BPL .done

  .timerExpired:
    LDA.W #Function_Powamp_Inflated_RiseToTargetHeight : STA.W Powamp.function,X
    LDA.W Powamp_InitialYVelocity_Rising : STA.W Powamp.YVelocity,X
    LDA.W Powamp_InitialYVelocity_Rising+2 : STA.W Powamp.YSubVelocity,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #InstList_Powamp_Body_FastAnimation : STA.W Enemy.instList,X

  .done:
    JSR HandlePowampBalloonYOffset
    RTL


;;; $C2CF: Powamp function - body - inflated - rise to target height ;;;
Function_Powamp_Inflated_RiseToTargetHeight:
    LDA.W Enemy.AI,X : BIT.W #$0001 : BEQ .notGrappleAI
    LDA.W #Function_Powamp_Grappled_RiseToTargetHeight : STA.W Powamp.function,X
    JMP Function_Powamp_Grappled_RiseToTargetHeight

  .notGrappleAI:
    DEC.W Powamp.wiggleTimer,X : BEQ .negativeTimer
    BPL .timerNotExpired

  .negativeTimer:
    LDA.W #$0005 : STA.W Powamp.wiggleTimer,X
    LDA.W Powamp.wiggleIndex,X : ASL : TAY
    LDA.W Enemy[-1].var0,X : CLC : ADC.W PowampWiggleTable,Y : STA.W Enemy[-1].XPosition,X : STA.W Enemy.XPosition,X
    LDA.W Powamp.wiggleIndex,X : INC : CMP.W #$000C : BMI .storeIndex
    LDA.W #$0000

  .storeIndex:
    STA.W Powamp.wiggleIndex,X

  .timerNotExpired:
    LDA.W Powamp.YSubVelocity,X : CLC : ADC.W Powamp_YAccel_Rising+2 : STA.W Powamp.YSubVelocity,X
    LDA.W Powamp.YVelocity,X : ADC.W Powamp_YAccel_Rising : STA.W Powamp.YVelocity,X
    LDA.W Powamp.YVelocity,X : STA.B DP_Temp14 ; >.<
    LDA.W Powamp.YSubVelocity,X : STA.B DP_Temp12
    JSL MoveEnemyDownBy_14_12
    BCS .doneRising
    LDA.W Enemy[-1].var1,X : SEC : SBC.W PowampTravelDistanceWhenNotGrappled : CMP.W Enemy.YPosition,X : BMI .done

  .doneRising:
    LDA.W Powamp.wiggleIndex,X : BEQ .centered
    CMP.W #$0006 : BEQ .centered
    LDA.W #Function_Powamp_Inflated_FinishWiggle : STA.W Powamp.function,X
    BRA .done

  .centered:
    LDA.W #Function_Powamp_Deflating : STA.W Powamp.function,X
    LDA.W #$000A : STA.W Powamp.functionTimer,X
    LDA.W #$0001 : STA.W Enemy[-1].instTimer,X
    LDA.W #InstList_Powamp_Balloon_StartSinking : STA.W Enemy[-1].instList,X

  .done:
    JSR HandlePowampBalloonYOffset
    RTL


;;; $C36B: Powamp function - body - inflated - finish wiggle ;;;
Function_Powamp_Inflated_FinishWiggle:
    DEC.W Powamp.wiggleTimer,X : BEQ .timerExpired
    BPL .continueRising

  .timerExpired:
    LDA.W #$0005 : STA.W Powamp.wiggleTimer,X
    LDA.W Powamp.wiggleIndex,X : ASL : TAY
    LDA.W Enemy[-1].var0,X : CLC : ADC.W PowampWiggleTable,Y : STA.W Enemy[-1].XPosition,X : STA.W Enemy.XPosition,X
    LDA.W Powamp.wiggleIndex,X : BEQ .centered
    CMP.W #$0006 : BEQ .centered
    INC : CMP.W #$000C : BMI .storeIndex
    LDA.W #$0000

  .storeIndex:
    STA.W Powamp.wiggleIndex,X
    BRA .continueRising

  .centered:
    LDA.W #Function_Powamp_Deflating : STA.W Powamp.function,X
    LDA.W #$000A : STA.W Powamp.functionTimer,X
    LDA.W #$0001 : STA.W Enemy[-1].instTimer,X
    LDA.W #InstList_Powamp_Balloon_StartSinking : STA.W Enemy[-1].instList,X
    BRA .return

  .continueRising:
    LDA.W Powamp.YSubVelocity,X : CLC : ADC.W Powamp_YAccel_Rising+2 : STA.W Powamp.YSubVelocity,X
    LDA.W Powamp.YVelocity,X : ADC.W Powamp_YAccel_Rising : STA.W Powamp.YVelocity,X
    LDA.W Powamp.YVelocity,X : STA.B DP_Temp14 ; >.<
    LDA.W Powamp.YSubVelocity,X : STA.B DP_Temp12
    JSL MoveEnemyDownBy_14_12

  .return:
    JSR HandlePowampBalloonYOffset
    RTL


;;; $C3E1: Powamp function - body - grappled - rise to target height ;;;
Function_Powamp_Grappled_RiseToTargetHeight:
    LDA.W Enemy.AI,X : BIT.W #$0001 : BNE .grappleAI
    LDA.W #Function_Powamp_Inflated_FinishWiggle : STA.W Powamp.function,X
    RTL

  .grappleAI:
    DEC.W Powamp.wiggleTimer,X : BEQ .timerExpired
    BPL .timerNotExpired

  .timerExpired:
    LDA.W #$0005 : STA.W Powamp.wiggleTimer,X
    LDA.W Powamp.wiggleIndex,X : ASL : TAY
    LDA.W Enemy[-1].var0,X : CLC : ADC.W PowampWiggleTable,Y : STA.W Enemy[-1].XPosition,X : STA.W Enemy.XPosition,X
    LDA.W Powamp.wiggleIndex,X : INC : CMP.W #$000C : BMI .storeIndex
    LDA.W #$0000

  .storeIndex:
    STA.W Powamp.wiggleIndex,X

  .timerNotExpired:
    LDA.W Powamp.YSubVelocity,X : CLC : ADC.W Powamp_YAccel_Rising+2 : STA.W Powamp.YSubVelocity,X
    LDA.W Powamp.YVelocity,X : ADC.W Powamp_YAccel_Rising : STA.W Powamp.YVelocity,X
    LDA.W Powamp.YVelocity,X : STA.B DP_Temp14 ; >.<
    LDA.W Powamp.YSubVelocity,X : STA.B DP_Temp12
    JSL MoveEnemyDownBy_14_12
    BCS .doneSinking
    LDA.W Enemy[-1].var1,X : SEC : SBC.W Enemy[-1].var3,X : CMP.W Enemy.YPosition,X : BMI .return

  .doneSinking:
    LDA.W Powamp.wiggleIndex,X : BEQ .centered
    CMP.W #$0006 : BEQ .centered
    LDA.W #Function_Powamp_Grappled_FinishWiggle : STA.W Powamp.function,X
    BRA .return

  .centered:
    LDA.W #Function_Powamp_Grappled_Resting : STA.W Powamp.function,X

  .return:
    JSR HandlePowampBalloonYOffset
    RTL


;;; $C469: Powamp function - body - grappled - finish wiggle ;;;
Function_Powamp_Grappled_FinishWiggle:
    LDA.W Enemy.AI,X : BIT.W #$0001 : BNE .GrappleAI
    LDA.W #Function_Powamp_Inflated_FinishWiggle : STA.W Powamp.function,X
    RTL

  .GrappleAI:
    DEC.W Powamp.wiggleTimer,X : BEQ .timerExpired
    BPL .continueRising

  .timerExpired:
    LDA.W #$0005 : STA.W Powamp.wiggleTimer,X
    LDA.W Powamp.wiggleIndex,X : ASL : TAY
    LDA.W Enemy[-1].var0,X : CLC : ADC.W PowampWiggleTable,Y : STA.W Enemy[-1].XPosition,X : STA.W Enemy.XPosition,X
    LDA.W Powamp.wiggleIndex,X : BEQ .centered
    CMP.W #$0006 : BEQ .centered
    INC : CMP.W #$000C : BMI .storeIndex
    LDA.W #$0000

  .storeIndex:
    STA.W Powamp.wiggleIndex,X
    BRA .continueRising

  .centered:
    LDA.W #Function_Powamp_Grappled_Resting : STA.W Powamp.function,X
    BRA .return

  .continueRising:
    LDA.W Powamp.YSubVelocity,X : CLC : ADC.W Powamp_YAccel_Rising+2 : STA.W Powamp.YSubVelocity,X
    LDA.W Powamp.YVelocity,X : ADC.W Powamp_YAccel_Rising : STA.W Powamp.YVelocity,X
    LDA.W Powamp.YVelocity,X : STA.B DP_Temp14 ; >.<
    LDA.W Powamp.YSubVelocity,X : STA.B DP_Temp12
    JSL MoveEnemyDownBy_14_12

  .return:
    JSR HandlePowampBalloonYOffset
    RTL


;;; $C4DC: Powamp function - body - grappled - resting ;;;
Function_Powamp_Grappled_Resting:
    LDA.W Enemy.AI,X : BIT.W #$0001 : BNE .done
    LDA.W #Function_Powamp_Deflating : STA.W Powamp.function,X
    LDA.W #$000A : STA.W Powamp.functionTimer,X
    LDA.W #$0001 : STA.W Enemy[-1].instTimer,X
    LDA.W #InstList_Powamp_Balloon_StartSinking : STA.W Enemy[-1].instList,X

  .done:
    JSR HandlePowampBalloonYOffset
    RTL


;;; $C500: Powamp function - body - deflating ;;;
Function_Powamp_Deflating:
    DEC.W Powamp.functionTimer,X : BEQ .timerExpired
    BPL .done

  .timerExpired:
    LDA.W #Function_Powamp_Deflated_Sinking : STA.W Powamp.function,X
    LDA.W Powamp_InitialYVelocity_Sinking : STA.W Powamp.YVelocity,X
    LDA.W Powamp_InitialYVelocity_Sinking+2 : STA.W Powamp.YSubVelocity,X

  .done:
    JSR HandlePowampBalloonYOffset
    RTL


;;; $C51D: Powamp function - body - deflated - sinking ;;;
Function_Powamp_Deflated_Sinking:
    LDA.W Powamp.YSubVelocity,X : CLC : ADC.W Powamp_YAccel_Sinking+2 : STA.W Powamp.YSubVelocity,X
    LDA.W Powamp.YVelocity,X : ADC.W Powamp_YAccel_Sinking : STA.W Powamp.YVelocity,X
    LDA.W Powamp.YVelocity,X : STA.B DP_Temp14 ; >.<
    LDA.W Powamp.YSubVelocity,X : STA.B DP_Temp12
    JSL MoveEnemyDownBy_14_12
    LDA.W Enemy.YPosition,X : CMP.W Enemy[-1].var1,X : BMI .done
    LDA.W Enemy[-1].var1,X : STA.W Enemy.YPosition,X
    LDA.W #Function_Powamp_Deflated_Resting : STA.W Powamp.function,X
    LDA.W #$003C : STA.W Powamp.functionTimer,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #InstList_Powamp_Body_SlowAnimation : STA.W Enemy.instList,X

  .done:
    JSR HandlePowampBalloonYOffset
    RTL


;;; $C568: RTL ;;;
RTL_A8C568:
    RTL


;;; $C569: Powamp function - body - fatal damage ;;;
Function_Powamp_FatalDamage:
    LDA.W Enemy[-1].instList,X : CMP.W #InstList_Powamp_Balloon_StartSinking : BMI +
    SEC : SBC.W #$0004 : SEC : SBC.W #InstList_Powamp_Balloon_StartSinking
    LSR : BEQ +
    TAY
    LDA.W .instListPointers,Y : STA.W Enemy[-1].instList,X
    LDA.W #$0001 : STA.W Enemy[-1].instTimer,X

+   LDA.W #Function_Powamp_DeathSequence : STA.W Powamp.function,X
    LDA.W #$0020 : STA.W Powamp.functionTimer,X
    JSR HandlePowampBalloonYOffset
    RTL

  .instListPointers:
; Pointers to animation frames in inflate instruction list
    dw InstList_Powamp_Balloon_Inflate_2
    dw InstList_Powamp_Balloon_Inflate_1
    dw InstList_Powamp_Balloon_Inflate_0


;;; $C59F: Powamp function - body - death sequence ;;;
Function_Powamp_DeathSequence:
    DEC.W Powamp.functionTimer,X : BEQ .timerExpired
    BPL .done

  .timerExpired:
    STZ.W Enemy[-1].health,X
    LDA.W Enemy[-1].properties,X : ORA.W #$0200 : STA.W Enemy[-1].properties,X
    JSR FirePowampSpikesIn8Directions
    JSL EnemyDeath
    RTL

  .done:
    JSR HandlePowampBalloonYOffset
    RTL


;;; $C5BE: Enemy touch - enemy $E8BF (powamp) ;;;
EnemyTouch_Powamp:
    LDX.W EnemyIndex
    LDA.W Enemy.init1,X : BNE .return
    LDA.W Enemy.palette,X : PHA
    JSL NormalEnemyTouchAI
    LDX.W EnemyIndex
    LDA.W Enemy.health,X : BEQ .dead
    PLA
    RTL

  .dead:
    LDA.W Enemy[-1].properties,X : ORA.W #$0200 : STA.W Enemy[-1].properties,X
    PLA : STA.W Enemy.palette,X
    JSR FirePowampSpikesIn8Directions
    LDA.W #$0A00 : STA.W Enemy.palette,X

  .return:
    RTL


;;; $C5EF: Enemy shot - enemy $E8BF (powamp) ;;;
EnemyShot_Powamp:
    PHB
    LDX.W EnemyIndex
    LDA.W Enemy.init1,X : BEQ .body
    PLB
    RTL

  .body:
    JSL NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External
    LDA.W Enemy.AI,X : BIT.W #$0004 : BEQ .notFrozenAI
    LDA.W Enemy.freezeTimer,X : STA.W Enemy[-1].freezeTimer,X
    LDA.W Enemy[-1].AI,X : ORA.W #$0004 : STA.W Enemy[-1].AI,X

  .notFrozenAI:
    LDA.W Enemy.AI,X : BIT.W #$0002 : BEQ .notHurtAI
    LDA.W Enemy.flashTimer,X : STA.W Enemy[-1].flashTimer,X
    LDA.W Enemy[-1].AI,X : ORA.W #$0002 : STA.W Enemy[-1].AI,X

  .notHurtAI:
    LDA.W Enemy.health,X : BNE .return
    LDA.W #Function_Powamp_FatalDamage : STA.W Powamp.function,X
    LDA.W #$0001 : STA.W Enemy.init1,X

  .return:
    PLB
    RTL


;;; $C63F: Power bomb reaction - enemy $E8BF (powamp) ;;;
PowerBombReaction_Powamp:
    JSL CommonA8_NormalEnemyPowerBombAI
    LDX.W EnemyIndex
    LDA.W Enemy.health,X : BNE .notDead
    LDA.W Enemy[-1].properties,X : ORA.W #$0200 : STA.W Enemy[-1].properties,X
    BRA .return

  .notDead:
    LDA.W Enemy.shakeTimer,X : STA.W Enemy[-1].shakeTimer,X
    LDA.W Enemy.invincibilityTimer,X : STA.W Enemy[-1].invincibilityTimer,X
    LDA.W Enemy.flashTimer,X : STA.W Enemy[-1].flashTimer,X
    LDA.W Enemy.freezeTimer,X : STA.W Enemy[-1].freezeTimer,X
    LDA.W Enemy.AI,X : STA.W Enemy[-1].AI,X

  .return:
    RTL


;;; $C675: Powamp spritemaps ;;;
Spritemap_Powamp_Body_CheeksLowered:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $100)

Spritemap_Powamp_Body_CheeksLifting:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $102)

Spritemap_Powamp_Body_CheeksRaised:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $104)

Spritemap_Powamp_Balloon_Deflated:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $10E)

Spritemap_Powamp_Balloon_Inflating:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $106)

Spritemap_Powamp_Balloon_FullyInflated:
    dw $0005
    %spritemapEntry(0, $04, $04, 0, 0, 2, 0, $10D)
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 0, $10C)
    %spritemapEntry(0, $1F4, $04, 0, 0, 2, 0, $10B)
    %spritemapEntry(1, $1FC, $F4, 0, 0, 2, 0, $109)
    %spritemapEntry(1, $1F4, $F4, 0, 0, 2, 0, $108)


;;; $C6B3: Palette - enemy $E8FF/$E93F (work robot) ;;;
Palette_Robot:
    dw $3800,$57FF,$42F7,$0929,$00A5,$4F5A,$36B5,$2610
    dw $1DCE,$001F,$0018,$000F,$0008,$000A,$03FF,$02B5


;;; $C6D3: Instruction list - work robot deactivated - neutral ;;;
InstList_RobotNoPower_Neutral:
    dw $7FFF,Spritemap_Robot_19
    dw Instruction_Common_Sleep


;;; $C6D9: Instruction list - work robot deactivated - leaning left ;;;
InstList_RobotNoPower_LeaningLeft:
    dw $7FFF,Spritemap_Robot_18
    dw Instruction_Common_Sleep


;;; $C6DF: Instruction list - work robot deactivated - leaning right ;;;
InstList_RobotNoPower_LeaningRight:
    dw $7FFF,Spritemap_Robot_1A
    dw Instruction_Common_Sleep


;;; $C6E5: Instruction list - initial ;;;
InstList_Robot_Initial:
    dw $0020,Spritemap_Robot_1


;;; $C6E9: Instruction list - facing left - walking forwards ;;;
InstList_Robot_FacingLeft_WalkingForwards_0:
    dw $0001,Spritemap_Robot_1

InstList_Robot_FacingLeft_WalkingForwards_1:
    dw $000A,Spritemap_Robot_1
    dw $0001,Spritemap_Robot_2
    dw Instruction_Robot_TryShootingLaserLeft
    dw $0009,Spritemap_Robot_2
    dw $0001,Spritemap_Robot_3
    dw Instruction_Robot_TryShootingLaserUpLeft
    dw $0009,Spritemap_Robot_3
    dw $000A,Spritemap_Robot_4
    dw Instruction_Robot_PlaySFXIfOnScreen
    dw Instruction_Robot_FacingLeft_MoveForward_HandleWallOrFall
    dw $000A,Spritemap_Robot_5
    dw Instruction_Robot_FacingLeft_MoveForward_HandleWallOrFall
    dw $000A,Spritemap_Robot_6
    dw $000A,Spritemap_Robot_7
    dw $000A,Spritemap_Robot_8
    dw $000A,Spritemap_Robot_9
    dw $000A,Spritemap_Robot_A
    dw Instruction_Robot_FacingLeft_MoveForward_HandleWallOrFall
    dw Instruction_Robot_PlaySFXIfOnScreen
    dw $000A,Spritemap_Robot_B
    dw Instruction_Robot_FacingLeft_MoveForward_HandleWallOrFall
    dw $0001,Spritemap_Robot_0
    dw Instruction_Robot_TryShootingLaserDownLeft
    dw $0009,Spritemap_Robot_0
    dw Instruction_Common_GotoY
    dw InstList_Robot_FacingLeft_WalkingForwards_1


;;; $C73F: Instruction list - facing left - hit wall moving forwards ;;;
InstList_Robot_FacingLeft_HitWallMovingForwards:
    dw $0001,Spritemap_Robot_B
    dw $000A,Spritemap_Robot_B
    dw Instruction_Robot_PlaySFXIfOnScreen
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleWallOrFall
    dw $000A,Spritemap_Robot_A
    dw $000A,Spritemap_Robot_9
    dw $000A,Spritemap_Robot_8
    dw $000A,Spritemap_Robot_7
    dw $000A,Spritemap_Robot_6
    dw Instruction_Robot_PlaySFXIfOnScreen
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleWallOrFall
    dw $000A,Spritemap_Robot_5
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleWallOrFall
    dw $000A,Spritemap_Robot_4
    dw $000A,Spritemap_Robot_3
    dw $000A,Spritemap_Robot_2
    dw $000A,Spritemap_Robot_1
    dw $000A,Spritemap_Robot_0
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleWallOrFall
    dw Instruction_Robot_PlaySFXIfOnScreen
    dw $000A,Spritemap_Robot_B
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleWallOrFall
    dw $000A,Spritemap_Robot_A
    dw $000A,Spritemap_Robot_9
    dw $000A,Spritemap_Robot_8
    dw $000A,Spritemap_Robot_7
    dw $000A,Spritemap_Robot_6
    dw Instruction_Robot_PlaySFXIfOnScreen
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleWallOrFall
    dw $000A,Spritemap_Robot_5
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleWallOrFall
    dw $000A,Spritemap_Robot_4
    dw $000A,Spritemap_Robot_3
    dw $000A,Spritemap_Robot_2
    dw $000A,Spritemap_Robot_1
    dw $000A,Spritemap_Robot_0
    dw Instruction_Robot_SetInstListTo_FacingRight_WalkingForwards


;;; $C7BB: Instruction list - facing left - shot - Samus is ahead ;;;
InstList_Robot_FacingLeft_Shot_SamusIsAhead:
    dw $0005,Spritemap_Robot_B
    dw Instruction_Robot_PlaySFXIfOnScreen
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleHittingWall
    dw $0005,Spritemap_Robot_A
    dw $0005,Spritemap_Robot_9
    dw $0005,Spritemap_Robot_8
    dw $0005,Spritemap_Robot_7
    dw $0005,Spritemap_Robot_6
    dw Instruction_Robot_PlaySFXIfOnScreen
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleHittingWall
    dw $0005,Spritemap_Robot_5
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleHittingWall
    dw $0005,Spritemap_Robot_4
    dw $0005,Spritemap_Robot_3
    dw $0005,Spritemap_Robot_2
    dw $0005,Spritemap_Robot_1
    dw $0005,Spritemap_Robot_0
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleHittingWall
    dw Instruction_Robot_PlaySFXIfOnScreen
    dw $0005,Spritemap_Robot_B
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleHittingWall
    dw $0005,Spritemap_Robot_A
    dw $0005,Spritemap_Robot_9
    dw $0005,Spritemap_Robot_8
    dw $0005,Spritemap_Robot_7
    dw $0005,Spritemap_Robot_6
    dw Instruction_Robot_PlaySFXIfOnScreen
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleHittingWall
    dw $0005,Spritemap_Robot_5
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleHittingWall
    dw $0005,Spritemap_Robot_4
    dw $0005,Spritemap_Robot_3
    dw $0005,Spritemap_Robot_2
    dw $0005,Spritemap_Robot_1
    dw $0005,Spritemap_Robot_0
    dw Instruction_Robot_SetInstListTo_FacingRight_WalkingForwards


;;; $C833: Instruction list - facing left - shot - Samus is behind ;;;
InstList_Robot_FacingLeft_Shot_SamusIsBehind:
    dw Instruction_Robot_PlaySFXIfOnScreen
    dw Instruction_Robot_FacingLeft_MoveForward_HandleHittingWall
    dw $0005,Spritemap_Robot_1
    dw $0005,Spritemap_Robot_2
    dw $0005,Spritemap_Robot_3
    dw $0005,Spritemap_Robot_4
    dw Instruction_Robot_PlaySFXIfOnScreen
    dw Instruction_Robot_FacingLeft_MoveForward_HandleHittingWall
    dw $0005,Spritemap_Robot_5
    dw Instruction_Robot_FacingLeft_MoveForward_HandleHittingWall
    dw $0005,Spritemap_Robot_6
    dw $0005,Spritemap_Robot_7
    dw $0005,Spritemap_Robot_8
    dw $0005,Spritemap_Robot_9
    dw $0005,Spritemap_Robot_A
    dw Instruction_Robot_FacingLeft_MoveForward_HandleHittingWall
    dw Instruction_Robot_PlaySFXIfOnScreen
    dw $0005,Spritemap_Robot_B
    dw Instruction_Robot_FacingLeft_MoveForward_HandleHittingWall
    dw $0005,Spritemap_Robot_0
    dw $0005,Spritemap_Robot_1
    dw $0005,Spritemap_Robot_2
    dw $0005,Spritemap_Robot_3
    dw $0005,Spritemap_Robot_4
    dw Instruction_Robot_PlaySFXIfOnScreen
    dw Instruction_Robot_FacingLeft_MoveForward_HandleHittingWall
    dw $0005,Spritemap_Robot_5
    dw Instruction_Robot_FacingLeft_MoveForward_HandleHittingWall
    dw $0005,Spritemap_Robot_6
    dw $0005,Spritemap_Robot_7
    dw $0005,Spritemap_Robot_8
    dw $0005,Spritemap_Robot_9
    dw $0005,Spritemap_Robot_A
    dw Instruction_Robot_FacingLeft_MoveForward_HandleHittingWall
    dw Instruction_Robot_PlaySFXIfOnScreen
    dw $0005,Spritemap_Robot_B
    dw Instruction_Robot_FacingLeft_MoveForward_HandleHittingWall
    dw $0005,Spritemap_Robot_0
    dw Instruction_Robot_Goto_FacingLeft_WalkingForwards


;;; $C8B1: Instruction list - facing left - shot laser down-left ;;;
InstList_Robot_FacingLeft_ShotLaserDownLeft:
    dw $0005,Spritemap_Robot_0
    dw $0002,Spritemap_Robot_B
    dw Instruction_Common_GotoY
    dw InstList_Robot_FacingLeft_LaserShotRecoil


;;; $C8BD: Instruction list - facing left - shot laser left ;;;
InstList_Robot_FacingLeft_ShotLaserLeft:
    dw $0005,Spritemap_Robot_1
    dw $0002,Spritemap_Robot_0
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleWallOrFall
    dw Instruction_Robot_PlaySFXIfOnScreen
    dw $000A,Spritemap_Robot_B
    dw Instruction_Common_GotoY
    dw InstList_Robot_FacingLeft_LaserShotRecoil


;;; $C8D1: Instruction list - facing left - shot laser up-left ;;;
InstList_Robot_FacingLeft_ShotLaserUpLeft:
    dw $0005,Spritemap_Robot_3
    dw $0002,Spritemap_Robot_2
    dw $0002,Spritemap_Robot_1
    dw $0004,Spritemap_Robot_0
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleWallOrFall
    dw Instruction_Robot_PlaySFXIfOnScreen
    dw $0004,Spritemap_Robot_B


;;; $C8E9: Instruction list - facing left - laser shot recoil ;;;
InstList_Robot_FacingLeft_LaserShotRecoil:
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleWallOrFall
    dw $0010,Spritemap_Robot_A
    dw $0005,Spritemap_Robot_9
    dw $0005,Spritemap_Robot_8
    dw $0005,Spritemap_Robot_7
    dw $0005,Spritemap_Robot_6
    dw Instruction_Robot_PlaySFXIfOnScreen
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleWallOrFall
    dw $000A,Spritemap_Robot_5
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleWallOrFall
    dw $000A,Spritemap_Robot_4
    dw $000A,Spritemap_Robot_3
    dw $0060,Spritemap_Robot_2
    dw Instruction_Robot_DecrementLaserCooldown
    dw Instruction_Common_GotoY
    dw InstList_Robot_FacingLeft_WalkingForwards_0


;;; $C91B: Instruction list - approaching a fall to the right ;;;
InstList_Robot_ApproachingAFallToTheRight:
    dw $0080,Spritemap_Robot_C
    dw $000A,Spritemap_Robot_D
    dw $000A,Spritemap_Robot_E
    dw Instruction_Robot_DecrementLaserCooldown
    dw Instruction_Common_GotoY
    dw InstList_Robot_FacingLeft_WalkingForwards_0


;;; $C92D: Instruction list - facing right - walking forwards ;;;
InstList_Robot_FacingRight_WalkingForwards_0:
    dw $0001,Spritemap_Robot_C

InstList_Robot_FacingRight_WalkingForwards_1:
    dw $0001,Spritemap_Robot_C
    dw Instruction_Robot_TryShootingLaserDownRight
    dw $0009,Spritemap_Robot_C
    dw Instruction_Robot_DecrementLaserCooldown
    dw $000A,Spritemap_Robot_D
    dw $0001,Spritemap_Robot_E
    dw Instruction_Robot_TryShootingLaserRight
    dw $0009,Spritemap_Robot_E
    dw $0001,Spritemap_Robot_F
    dw Instruction_Robot_TryShootingLaserUpRight
    dw $0009,Spritemap_Robot_F
    dw $000A,Spritemap_Robot_10
    dw Instruction_Robot_PlaySFXIfOnScreen
    dw Instruction_Robot_FacingRight_MoveForward_HandleWallOrFall
    dw $000A,Spritemap_Robot_11
    dw Instruction_Robot_FacingRight_MoveForward_HandleWallOrFall
    dw $000A,Spritemap_Robot_12
    dw $000A,Spritemap_Robot_13
    dw $000A,Spritemap_Robot_14
    dw $000A,Spritemap_Robot_15
    dw $000A,Spritemap_Robot_16
    dw Instruction_Robot_FacingRight_MoveForward_HandleWallOrFall
    dw Instruction_Robot_PlaySFXIfOnScreen
    dw $000A,Spritemap_Robot_17
    dw Instruction_Robot_FacingRight_MoveForward_HandleWallOrFall
    dw Instruction_Common_GotoY
    dw InstList_Robot_FacingRight_WalkingForwards_1


;;; $C985: Instruction list - facing right - hit wall moving forwards ;;;
InstList_Robot_FacingRight_HitWallMovingForwards:
    dw $0001,Spritemap_Robot_17
    dw $000A,Spritemap_Robot_17
    dw Instruction_Robot_PlaySFXIfOnScreen
    dw Instruction_Robot_FacingRight_MoveBackward_HandleWallOrFall
    dw $000A,Spritemap_Robot_16
    dw $000A,Spritemap_Robot_15
    dw $000A,Spritemap_Robot_14
    dw $000A,Spritemap_Robot_13
    dw $000A,Spritemap_Robot_12
    dw Instruction_Robot_PlaySFXIfOnScreen
    dw Instruction_Robot_FacingRight_MoveBackward_HandleWallOrFall
    dw $000A,Spritemap_Robot_11
    dw Instruction_Robot_FacingRight_MoveBackward_HandleWallOrFall
    dw $000A,Spritemap_Robot_10
    dw $000A,Spritemap_Robot_F
    dw $000A,Spritemap_Robot_E
    dw $000A,Spritemap_Robot_D
    dw $000A,Spritemap_Robot_C
    dw Instruction_Robot_PlaySFXIfOnScreen
    dw Instruction_Robot_FacingRight_MoveBackward_HandleWallOrFall
    dw $000A,Spritemap_Robot_17
    dw Instruction_Robot_FacingRight_MoveBackward_HandleWallOrFall
    dw $000A,Spritemap_Robot_16
    dw $000A,Spritemap_Robot_15
    dw $000A,Spritemap_Robot_14
    dw $000A,Spritemap_Robot_13
    dw $000A,Spritemap_Robot_12
    dw Instruction_Robot_PlaySFXIfOnScreen
    dw Instruction_Robot_FacingRight_MoveBackward_HandleWallOrFall
    dw $000A,Spritemap_Robot_11
    dw Instruction_Robot_FacingRight_MoveBackward_HandleWallOrFall
    dw $000A,Spritemap_Robot_10
    dw $000A,Spritemap_Robot_F
    dw $000A,Spritemap_Robot_E
    dw $000A,Spritemap_Robot_D
    dw $000A,Spritemap_Robot_C
    dw Instruction_Robot_Goto_FacingLeft_WalkingForwards


;;; $CA01: Instruction list - facing right - shot - Samus is ahead ;;;
InstList_Robot_FacingRight_Shot_SamusIsAhead:
    dw $0001,Spritemap_Robot_17
    dw $0005,Spritemap_Robot_17
    dw Instruction_Robot_PlaySFXIfOnScreen
    dw Instruction_Robot_FacingRight_MoveBackward_HandleHittingWall
    dw $0005,Spritemap_Robot_16
    dw $0005,Spritemap_Robot_15
    dw $0005,Spritemap_Robot_14
    dw $0005,Spritemap_Robot_13
    dw $0005,Spritemap_Robot_12
    dw Instruction_Robot_PlaySFXIfOnScreen
    dw Instruction_Robot_FacingRight_MoveBackward_HandleHittingWall
    dw $0005,Spritemap_Robot_11
    dw Instruction_Robot_FacingRight_MoveBackward_HandleHittingWall
    dw $0005,Spritemap_Robot_10
    dw $0005,Spritemap_Robot_F
    dw $0005,Spritemap_Robot_E
    dw $0005,Spritemap_Robot_D
    dw $0005,Spritemap_Robot_C
    dw Instruction_Robot_FacingRight_MoveBackward_HandleHittingWall
    dw Instruction_Robot_PlaySFXIfOnScreen
    dw $0005,Spritemap_Robot_17
    dw Instruction_Robot_FacingRight_MoveBackward_HandleHittingWall
    dw $0005,Spritemap_Robot_16
    dw $0005,Spritemap_Robot_15
    dw $0005,Spritemap_Robot_14
    dw $0005,Spritemap_Robot_13
    dw $0005,Spritemap_Robot_12
    dw Instruction_Robot_PlaySFXIfOnScreen
    dw Instruction_Robot_FacingRight_MoveBackward_HandleHittingWall
    dw $000A,Spritemap_Robot_11
    dw Instruction_Robot_FacingRight_MoveBackward_HandleHittingWall
    dw $0005,Spritemap_Robot_10
    dw $0005,Spritemap_Robot_F
    dw $0005,Spritemap_Robot_E
    dw $0005,Spritemap_Robot_D
    dw $0005,Spritemap_Robot_C
    dw Instruction_Robot_Goto_FacingLeft_WalkingForwards


;;; $CA7D: Instruction list - facing right - shot - Samus is behind ;;;
InstList_Robot_FacingRight_Shot_SamusIsBehind:
    dw Instruction_Robot_FacingRight_MoveForward_HandleHittingWall
    dw Instruction_Robot_PlaySFXIfOnScreen
    dw $0005,Spritemap_Robot_C
    dw $0005,Spritemap_Robot_D
    dw $0005,Spritemap_Robot_E
    dw $0005,Spritemap_Robot_F
    dw $0005,Spritemap_Robot_10
    dw Instruction_Robot_PlaySFXIfOnScreen
    dw Instruction_Robot_FacingRight_MoveForward_HandleHittingWall
    dw $0005,Spritemap_Robot_11
    dw Instruction_Robot_FacingRight_MoveForward_HandleHittingWall
    dw Instruction_Robot_PlaySFXIfOnScreen
    dw $0005,Spritemap_Robot_12
    dw $0005,Spritemap_Robot_13
    dw $0005,Spritemap_Robot_14
    dw $0005,Spritemap_Robot_15
    dw $0005,Spritemap_Robot_16
    dw Instruction_Robot_FacingRight_MoveForward_HandleHittingWall
    dw Instruction_Robot_PlaySFXIfOnScreen
    dw $0005,Spritemap_Robot_17
    dw Instruction_Robot_FacingRight_MoveForward_HandleHittingWall
    dw $0005,Spritemap_Robot_C
    dw $0005,Spritemap_Robot_D
    dw $0005,Spritemap_Robot_E
    dw $0005,Spritemap_Robot_F
    dw $0005,Spritemap_Robot_10
    dw Instruction_Robot_PlaySFXIfOnScreen
    dw Instruction_Robot_FacingRight_MoveForward_HandleHittingWall
    dw $0005,Spritemap_Robot_11
    dw Instruction_Robot_FacingRight_MoveForward_HandleHittingWall
    dw $0005,Spritemap_Robot_12
    dw $0005,Spritemap_Robot_13
    dw $0005,Spritemap_Robot_14
    dw $0005,Spritemap_Robot_15
    dw $0005,Spritemap_Robot_16
    dw Instruction_Robot_FacingRight_MoveForward_HandleHittingWall
    dw Instruction_Robot_PlaySFXIfOnScreen
    dw $0005,Spritemap_Robot_17
    dw Instruction_Robot_FacingRight_MoveForward_HandleHittingWall
    dw Instruction_Robot_SetInstListTo_FacingRight_WalkingForwards


;;; $CAFD: Instruction list - facing right - shot laser down-right ;;;
InstList_Robot_FacingRight_ShotLaserDownRight:
    dw $0005,Spritemap_Robot_C
    dw $0002,Spritemap_Robot_17
    dw Instruction_Common_GotoY
    dw InstList_Robot_FacingRight_LaserShotRecoil


;;; $CB09: Instruction list - facing right - shot laser right ;;;
InstList_Robot_FacingRight_ShotLaserRight:
    dw $0005,Spritemap_Robot_D
    dw $0002,Spritemap_Robot_C
    dw Instruction_Robot_PlaySFXIfOnScreen
    dw Instruction_Robot_FacingRight_MoveBackward_HandleWallOrFall
    dw $000A,Spritemap_Robot_17
    dw Instruction_Common_GotoY
    dw InstList_Robot_FacingRight_LaserShotRecoil


;;; $CB1D: Instruction list - facing right - shot laser up-right ;;;
InstList_Robot_FacingRight_ShotLaserUpRight:
    dw $0005,Spritemap_Robot_F
    dw $0002,Spritemap_Robot_E
    dw $0002,Spritemap_Robot_D
    dw $0004,Spritemap_Robot_C
    dw Instruction_Robot_PlaySFXIfOnScreen
    dw Instruction_Robot_FacingRight_MoveBackward_HandleWallOrFall
    dw $0004,Spritemap_Robot_17


;;; $CB35: Instruction list - facing right - laser shot recoil ;;;
InstList_Robot_FacingRight_LaserShotRecoil:
    dw Instruction_Robot_FacingRight_MoveBackward_HandleWallOrFall
    dw $0010,Spritemap_Robot_16
    dw $0005,Spritemap_Robot_15
    dw $0005,Spritemap_Robot_14
    dw $0005,Spritemap_Robot_13
    dw $0005,Spritemap_Robot_12
    dw Instruction_Robot_PlaySFXIfOnScreen
    dw Instruction_Robot_FacingRight_MoveBackward_HandleWallOrFall
    dw $000A,Spritemap_Robot_11
    dw Instruction_Robot_FacingRight_MoveBackward_HandleWallOrFall
    dw $000A,Spritemap_Robot_10
    dw $000A,Spritemap_Robot_F
    dw $0060,Spritemap_Robot_E
    dw Instruction_Common_GotoY
    dw InstList_Robot_FacingRight_WalkingForwards_0


;;; $CB65: Instruction list - approaching a fall to the left ;;;
InstList_Robot_ApproachingAFallToTheLeft:
    dw $0080,Spritemap_Robot_0
    dw $000A,Spritemap_Robot_1
    dw $000A,Spritemap_Robot_2
    dw Instruction_Robot_DecrementLaserCooldown
    dw Instruction_Common_GotoY
    dw InstList_Robot_FacingRight_WalkingForwards_0


;;; $CB77: Initialisation AI - enemy $E8FF (work robot) ;;;
InitAI_Robot:
    LDX.W AreaIndex
    LDA.L SRAMMirror_Boss,X : BIT.W #$0001 : BEQ InitAI_RobotNoPower
    LDX.W EnemyIndex
    SEP #$20
    LDA.B #EnemyGraphicsDrawnHook_Robot_PeriodicallyCyclePalettes>>16 : STA.W EnemyGraphicsDrawnHook+2
    REP #$20
    LDA.W #EnemyGraphicsDrawnHook_Robot_PeriodicallyCyclePalettes : STA.W EnemyGraphicsDrawnHook
    LDA.W Enemy.properties,X : ORA.W #$A000 : STA.W Enemy.properties,X
    LDA.W #$0004 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.W #InstList_Robot_Initial : STA.W Enemy.instList,X
    LDA.W #$FE00 : STA.W Robot.laserXVelocity,X
    LDA.W #$0001 : STA.L RobotPaletteAnimationTimer
    LDA.W #$0000 : STA.L RobotPaletteAnimationTableIndex : STA.W Robot.laserCooldown,X
    LDA.W Enemy.palette,X : STA.L RobotPaletteAnimationPaletteIndex
    RTL


;;; $CBCC: Initialisation AI - enemy $E93F (work robot deactivated) ;;;
InitAI_RobotNoPower:
; The color writes at $A8:CC1C have no effect for multiple reasons:
;     It writes to the active palette RAM instead of the target palette RAM, so room fade in immediately overwrites any changes
;     $7E:D652 is 0 until an *activated* robot gets initialised, so this effectively hardcodes the palette index to 0, but the robots never use palette 0
;     Even if there was an activated robot loaded at some point in some previous room, that robot's palette index would be unrelated to the current room's one
;     It wouldn't have any effect if there was an activated robot in the same room either, due to the active palette animation
;     In the pre-Phantoon hall, they use the roach's palette, so it has yellow eyes in that room(!)
    LDX.W EnemyIndex
    LDA.W Enemy.init0,X : CMP.W #$0000 : BMI .zeroParam1
    CMP.W #$0004 : BMI .valid

  .zeroParam1:
    LDA.W #$0000

  .valid:
    STA.W Enemy.init0,X
    ASL : TAY
    LDA.W .pointers,Y : STA.W Enemy.instList,X
    LDA.W Enemy.properties,X : ORA.W #$8000 : STA.W Enemy.properties,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.W #$0000 : STA.L RobotPaletteAnimationTimer
    LDA.W #$0000 : STA.W Robot.YSubVelocity,X ; >.<
    LDA.W #$0001 : STA.W Robot.YVelocity,X
    LDA.L RobotPaletteAnimationPaletteIndex : AND.W #$FF00 : XBA : ASL #4 : TAX
    LDA.W #$000A : STA.L Palettes_SpriteP0+$12,X : STA.L Palettes_SpriteP0+$14,X
    STA.L Palettes_SpriteP0+$16,X : STA.L Palettes_SpriteP0+$18,X
    RTL

  .pointers:
; Instruction list pointers. Indexed by [enemy parameter 1] * 2
    dw InstList_RobotNoPower_Neutral
    dw InstList_RobotNoPower_LeaningLeft
    dw InstList_RobotNoPower_LeaningRight


;;; $CC36: Main AI - enemy $E8FF (work robot) ;;;
MainAI_Robot:
    LDX.W EnemyIndex
    LDA.W Robot.YSubVelocity,X : STA.B DP_Temp12
    LDA.W Robot.YVelocity,X : STA.B DP_Temp14
    JSL MoveEnemyDownBy_14_12
    BCS RTL_A8CC66
    LDX.W EnemyIndex
    LDA.W Enemy.instTimer,X : INC : STA.W Enemy.instTimer,X
    LDA.W Robot.YSubVelocity,X : CLC : ADC.W #$8000 : STA.W Robot.YSubVelocity,X
    LDA.W Robot.YVelocity,X : ADC.W #$0000 : STA.W Robot.YVelocity,X
; fallthrough to MainAI_RobotNoPower


;;; $CC66: RTL. Main AI - enemy $E93F (work robot deactivated) ;;;
RTL_A8CC66:
    RTL


;;; $CC67: Enemy graphics drawn hook - work robot - periodically cycle between palettes ;;;
EnemyGraphicsDrawnHook_Robot_PeriodicallyCyclePalettes:
    LDA.W DoorTransitionFlagEnemiesPause : BNE .return
    LDA.L RobotPaletteAnimationTimer : BEQ .return
    DEC : STA.L RobotPaletteAnimationTimer : BNE .return
    PHX
    LDA.L RobotPaletteAnimationPaletteIndex : AND.W #$FF00 : XBA : ASL #4 : TAX
    LDA.L RobotPaletteAnimationTableIndex : TAY

  .again:
    LDA.W .paletteColor9,Y : BMI .zero
    STA.L Palettes_SpriteP0+$12,X
    LDA.W .paletteColorA,Y : STA.L Palettes_SpriteP0+$14,X
    LDA.W .paletteColorB,Y : STA.L Palettes_SpriteP0+$16,X
    LDA.W .paletteColorC,Y : STA.L Palettes_SpriteP0+$18,X
    LDA.W .timer,Y : STA.L RobotPaletteAnimationTimer
    TYA : CLC : ADC.W #$000A : STA.L RobotPaletteAnimationTableIndex
    PLX

  .return:
    RTL

  .zero:
    LDY.W #$0000
    BRA .again

; Robot palette animation table
;        ____________________________ Palette colours 9..Ch. Negative = terminator
;       |                         ___ Timer
;       |                        |
  .paletteColor9:
    dw $001F
  .paletteColorA:
    dw       $0018
  .paletteColorB:
    dw             $000F
  .paletteColorC:
    dw                   $0008
  .timer:
    dw                          $0040
    dw $0018,$000F,$0008,$001F, $0010
    dw $000F,$0008,$001F,$0018, $0010
    dw $0008,$001F,$0018,$000F, $0040
    dw $000F,$0008,$001F,$0018, $0010
    dw $0018,$000F,$0008,$001F, $0010
    dw $FFFF


;;; $CCFF: Decrement enemy laser cooldown ;;;
DecrementRobotLaserCooldown:
    LDA.W Robot.laserCooldown,X : BEQ .return
    DEC : STA.W Robot.laserCooldown,X

  .return:
    RTS


;;; $CD09: Instruction - facing left - move forwards, go to $C73F if hit wall, go to $CB65 if approaching a fall ;;;
Instruction_Robot_FacingLeft_MoveForward_HandleWallOrFall:
    PHX : PHY
    LDX.W EnemyIndex
    JSR DecrementRobotLaserCooldown
    LDA.W #$FE00 : STA.W Robot.laserXVelocity,X
    LDA.W #$0000 : STA.B DP_Temp12
    LDA.W #$FFFC : STA.B DP_Temp14
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCC .notCollidedWithWall
    LDA.W Robot.laserCooldown,X : CLC : ADC.W #$0008 : STA.W Robot.laserCooldown,X
    PLY
    LDY.W #InstList_Robot_FacingLeft_HitWallMovingForwards
    PLX
    RTL

  .notCollidedWithWall:
    JSL CheckIfEnemyIsTouchingSamusFromBelow
    AND.W #$FFFF : BEQ .notTouchingSamusFromBelow
    LDA.W #$0000 : STA.W ExtraSamusXSubDisplacement
    LDA.W #$FFFC : STA.W ExtraSamusXDisplacement

  .notTouchingSamusFromBelow:
    LDA.W Enemy.YPosition,X : STA.W Enemy.var3,X
    LDA.W Enemy.XPosition,X : STA.W Robot.backupXPosition,X
    SEC : SBC.W Enemy.XHitboxRadius,X : SEC : SBC.W Enemy.XHitboxRadius,X : STA.W Enemy.XPosition,X
    STZ.B DP_Temp12
    LDA.W #$0001 : STA.B DP_Temp14
    JSL MoveEnemyDownBy_14_12
    BCS .collidedWithBlock
    LDA.W Robot.laserCooldown,X : CLC : ADC.W #$0008 : STA.W Robot.laserCooldown,X
    LDA.W Robot.backupXPosition,X : STA.W Enemy.XPosition,X
    LDA.W Enemy.var3,X : STA.W Enemy.YPosition,X
    PLY
    LDX.W EnemyIndex
    LDA.W #$0200 : STA.W Robot.laserXVelocity,X
    LDY.W #InstList_Robot_ApproachingAFallToTheLeft
    PLX
    RTL

  .collidedWithBlock:
    LDA.W Robot.backupXPosition,X : STA.W Enemy.XPosition,X
    LDA.W Enemy.var3,X : STA.W Enemy.YPosition,X
    PLY : PLX
    RTL


;;; $CDA4: Instruction - facing left - move forwards, go to $C73F if hit wall ;;;
Instruction_Robot_FacingLeft_MoveForward_HandleHittingWall:
    PHX : PHY
    LDX.W EnemyIndex
    JSR DecrementRobotLaserCooldown
    LDA.W #$FE00 : STA.W Robot.laserXVelocity,X
    LDA.W #$0000 : STA.B DP_Temp12
    LDA.W #$FFFC : STA.B DP_Temp14
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCC .notCollidedWtihWall
    LDA.W Robot.laserCooldown,X : CLC : ADC.W #$0008 : STA.W Robot.laserCooldown,X
    PLY
    LDY.W #InstList_Robot_FacingLeft_HitWallMovingForwards
    PLX
    RTL

  .notCollidedWtihWall:
    JSL CheckIfEnemyIsTouchingSamusFromBelow
    AND.W #$FFFF : BEQ .return
    LDA.W #$0000 : STA.W ExtraSamusXSubDisplacement
    LDA.W #$FFFC : STA.W ExtraSamusXDisplacement

  .return:
    PLY : PLX
    RTL


;;; $CDEA: Instruction - facing left - move backwards, go to $C6E9 if hit wall, go to $C91B if approaching a fall ;;;
Instruction_Robot_FacingLeft_MoveBackward_HandleWallOrFall:
    PHX : PHY
    LDX.W EnemyIndex
    JSR DecrementRobotLaserCooldown
    LDA.W #$FE00 : STA.W Robot.laserXVelocity,X
    LDA.W #$0000 : STA.B DP_Temp12
    LDA.W #$0004 : STA.B DP_Temp14
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCC .notCollidedWithWall
    LDA.W Robot.laserCooldown,X : CLC : ADC.W #$0008 : STA.W Robot.laserCooldown,X
    PLY
    LDY.W #InstList_Robot_FacingLeft_WalkingForwards_0
    PLX
    RTL

  .notCollidedWithWall:
    JSL CheckIfEnemyIsTouchingSamusFromBelow
    AND.W #$FFFF : BEQ .notTouchingSamusFromBelow
    LDA.W #$0000 : STA.W ExtraSamusXSubDisplacement
    LDA.W #$0004 : STA.W ExtraSamusXDisplacement

  .notTouchingSamusFromBelow:
    LDA.W Enemy.YPosition,X : STA.W Enemy.var3,X
    LDA.W Enemy.XPosition,X : STA.W Robot.backupXPosition,X
    CLC : ADC.W Enemy.XHitboxRadius,X : CLC : ADC.W Enemy.XHitboxRadius,X : STA.W Enemy.XPosition,X
    STZ.B DP_Temp12
    LDA.W #$0001 : STA.B DP_Temp14
    JSL MoveEnemyDownBy_14_12
    BCS .collidedWithBlock
    LDA.W Robot.laserCooldown,X : CLC : ADC.W #$0008 : STA.W Robot.laserCooldown,X
    LDA.W Robot.backupXPosition,X : STA.W Enemy.XPosition,X
    LDA.W Enemy.var3,X : STA.W Enemy.YPosition,X
    PLY
    LDX.W EnemyIndex
    LDA.W #$FE00 : STA.W Robot.laserXVelocity,X
    LDY.W #InstList_Robot_ApproachingAFallToTheRight
    PLX
    RTL

  .collidedWithBlock:
    LDA.W Robot.backupXPosition,X : STA.W Enemy.XPosition,X
    LDA.W Enemy.var3,X : STA.W Enemy.YPosition,X
    PLY : PLX
    RTL


;;; $CE85: Instruction - facing left - move backwards, go to $C6E9 if hit wall ;;;
Instruction_Robot_FacingLeft_MoveBackward_HandleHittingWall:
    PHX : PHY
    LDX.W EnemyIndex
    JSR DecrementRobotLaserCooldown
    LDA.W #$FE00 : STA.W Robot.laserXVelocity,X
    LDA.W #$0000 : STA.B DP_Temp12
    LDA.W #$0004 : STA.B DP_Temp14
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCC .notCollidedWithWall
    LDA.W Robot.laserCooldown,X : CLC : ADC.W #$0008 : STA.W Robot.laserCooldown,X
    PLY
    LDY.W #InstList_Robot_FacingLeft_WalkingForwards_0
    PLX
    RTL

  .notCollidedWithWall:
    JSL CheckIfEnemyIsTouchingSamusFromBelow
    AND.W #$FFFF : BEQ .return
    LDA.W #$0000 : STA.W ExtraSamusXSubDisplacement
    LDA.W #$0004 : STA.W ExtraSamusXDisplacement

  .return:
    PLY : PLX
    RTL


;;; $CECB: Instruction - go to InstList_Robot_FacingRight_WalkingForwards_0 ;;;
Instruction_Robot_SetInstListTo_FacingRight_WalkingForwards:
    LDY.W #InstList_Robot_FacingRight_WalkingForwards_0
    RTL


;;; $CECF: Instruction - facing right - move forwards, go to $C985 if hit wall, go to $C91B if approaching a fall ;;;
Instruction_Robot_FacingRight_MoveForward_HandleWallOrFall:
    PHX : PHY
    LDX.W EnemyIndex
    JSR DecrementRobotLaserCooldown
    LDA.W #$0200 : STA.W Robot.laserXVelocity,X
    LDA.W #$0000 : STA.B DP_Temp12
    LDA.W #$0004 : STA.B DP_Temp14
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCC .notCollidedWithWall
    LDA.W Robot.laserCooldown,X : CLC : ADC.W #$0008 : STA.W Robot.laserCooldown,X
    PLY
    LDY.W #InstList_Robot_FacingRight_HitWallMovingForwards
    PLX
    RTL

  .notCollidedWithWall:
    JSL CheckIfEnemyIsTouchingSamusFromBelow
    AND.W #$FFFF : BEQ .notTouchingSamusFromBelow
    LDA.W #$0000 : STA.W ExtraSamusXSubDisplacement
    LDA.W #$0004 : STA.W ExtraSamusXDisplacement

  .notTouchingSamusFromBelow:
    LDA.W Enemy.YPosition,X : STA.W Enemy.var3,X
    LDA.W Enemy.XPosition,X : STA.W Robot.backupXPosition,X
    CLC : ADC.W Enemy.XHitboxRadius,X : CLC : ADC.W Enemy.XHitboxRadius,X : STA.W Enemy.XPosition,X
    STZ.B DP_Temp12
    LDA.W #$0001 : STA.B DP_Temp14
    JSL MoveEnemyDownBy_14_12
    BCS .collidedWithBlock
    LDA.W Robot.laserCooldown,X : CLC : ADC.W #$0008 : STA.W Robot.laserCooldown,X
    LDA.W Robot.backupXPosition,X : STA.W Enemy.XPosition,X
    LDA.W Enemy.var3,X : STA.W Enemy.YPosition,X
    PLY
    LDX.W EnemyIndex
    LDA.W #$FE00 : STA.W Robot.laserXVelocity,X
    LDY.W #InstList_Robot_ApproachingAFallToTheRight
    PLX
    RTL

  .collidedWithBlock:
    LDA.W Robot.backupXPosition,X : STA.W Enemy.XPosition,X
    LDA.W Enemy.var3,X : STA.W Enemy.YPosition,X
    PLY : PLX
    RTL


;;; $CF6A: Instruction - facing right - move forwards, go to $C985 if hit wall ;;;
Instruction_Robot_FacingRight_MoveForward_HandleHittingWall:
    PHX : PHY
    LDX.W EnemyIndex
    JSR DecrementRobotLaserCooldown
    LDA.W #$0200 : STA.W Robot.laserXVelocity,X
    LDA.W #$0000 : STA.B DP_Temp12
    LDA.W #$0004 : STA.B DP_Temp14
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCC .notCollidedWithWall
    LDA.W Robot.laserCooldown,X : CLC : ADC.W #$0008 : STA.W Robot.laserCooldown,X
    PLY
    LDY.W #InstList_Robot_FacingRight_HitWallMovingForwards
    PLX
    RTL

  .notCollidedWithWall:
    JSL CheckIfEnemyIsTouchingSamusFromBelow
    AND.W #$FFFF : BEQ .return
    LDA.W #$0000 : STA.W ExtraSamusXSubDisplacement
    LDA.W #$0004 : STA.W ExtraSamusXDisplacement

  .return:
    PLY : PLX
    RTL


;;; $CFB0: Instruction - facing right - move backwards, go to $C6E9 if hit wall, go to $CB65 if approaching a fall ;;;
Instruction_Robot_FacingRight_MoveBackward_HandleWallOrFall:
    PHX : PHY
    LDX.W EnemyIndex
    JSR DecrementRobotLaserCooldown
    LDA.W #$0200 : STA.W Robot.laserXVelocity,X
    LDA.W #$0000 : STA.B DP_Temp12
    LDA.W #$FFFC : STA.B DP_Temp14
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCC .notCollidedWithWall
    LDA.W Robot.laserCooldown,X : CLC : ADC.W #$0008 : STA.W Robot.laserCooldown,X
    PLY
    LDY.W #InstList_Robot_FacingLeft_WalkingForwards_0
    PLX
    RTL

  .notCollidedWithWall:
    JSL CheckIfEnemyIsTouchingSamusFromBelow
    AND.W #$FFFF : BEQ .notTouchingSamusFromBelow
    LDA.W #$0000 : STA.W ExtraSamusXSubDisplacement
    LDA.W #$FFFC : STA.W ExtraSamusXDisplacement

  .notTouchingSamusFromBelow:
    LDA.W Enemy.YPosition,X : STA.W Enemy.var3,X
    LDA.W Enemy.XPosition,X : STA.W Robot.backupXPosition,X
    SEC : SBC.W Enemy.XHitboxRadius,X : SEC : SBC.W Enemy.XHitboxRadius,X : STA.W Enemy.XPosition,X
    STZ.B DP_Temp12
    LDA.W #$0001 : STA.B DP_Temp14
    JSL MoveEnemyDownBy_14_12
    BCS .collidedWithBlock
    LDA.W Robot.laserCooldown,X : CLC : ADC.W #$0008 : STA.W Robot.laserCooldown,X
    LDA.W Enemy.var3,X : STA.W Enemy.YPosition,X
    LDA.W Robot.backupXPosition,X : STA.W Enemy.XPosition,X
    PLY
    LDX.W EnemyIndex
    LDA.W #$0200 : STA.W Robot.laserXVelocity,X
    LDY.W #InstList_Robot_ApproachingAFallToTheLeft
    PLX
    RTL

  .collidedWithBlock:
    LDA.W Enemy.var3,X : STA.W Enemy.YPosition,X
    LDA.W Robot.backupXPosition,X : STA.W Enemy.XPosition,X
    PLY : PLX
    RTL


;;; $D04B: Instruction - facing right - move backwards, go to $C6E9 if hit wall ;;;
Instruction_Robot_FacingRight_MoveBackward_HandleHittingWall:
    PHX : PHY
    LDX.W EnemyIndex
    JSR DecrementRobotLaserCooldown
    LDA.W #$0200 : STA.W Robot.laserXVelocity,X
    LDA.W #$0000 : STA.B DP_Temp12
    LDA.W #$FFFC : STA.B DP_Temp14
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCC .notCollidedWithWall
    LDA.W Robot.laserCooldown,X : CLC : ADC.W #$0008 : STA.W Robot.laserCooldown,X
    PLY
    LDY.W #InstList_Robot_FacingLeft_WalkingForwards_0
    PLX
    RTL

  .notCollidedWithWall:
    JSL CheckIfEnemyIsTouchingSamusFromBelow
    AND.W #$FFFF : BEQ .return
    LDA.W #$0000 : STA.W ExtraSamusXSubDisplacement
    LDA.W #$FFFC : STA.W ExtraSamusXDisplacement

  .return:
    PLY : PLX
    RTL


;;; $D091: Instruction - queue work robot sound effect if on screen ;;;
Instruction_Robot_PlaySFXIfOnScreen:
    PHX : PHY
    LDX.W EnemyIndex
    LDA.W Layer1XPosition : CMP.W Enemy.XPosition,X : BPL .return
    CLC : ADC.W #$0100 : CMP.W Enemy.XPosition,X : BMI .return
    LDA.W Layer1YPosition : CMP.W Enemy.YPosition,X : BPL .return
    CLC : ADC.W #$00E0 : CMP.W Enemy.YPosition,X : BMI .return
    LDA.W #$0068
    JSL QueueSound_Lib2_Max6

  .return:
    PLY : PLX
    RTL


;;; $D0C2: Instruction - go to InstList_Robot_FacingLeft_WalkingForwards_0 ;;;
Instruction_Robot_Goto_FacingLeft_WalkingForwards:
    LDY.W #InstList_Robot_FacingLeft_WalkingForwards_0
    RTL


;;; $D0C6: Instruction - try shooting laser up-right and go to $CB1D if so ;;;
Instruction_Robot_TryShootingLaserUpRight:
    LDA.W #InstList_Robot_FacingRight_ShotLaserUpRight : STA.B DP_Temp32
    LDA.W #EnemyProjectile_RobotLaser_UpRight : STA.B DP_Temp30
    BRA HandleFiringLaser_Upwards


;;; $D0D2: Instruction - try shooting laser up-left and go to $C8D1 if so ;;;
Instruction_Robot_TryShootingLaserUpLeft:
    LDA.W #InstList_Robot_FacingLeft_ShotLaserUpLeft : STA.B DP_Temp32
    LDA.W #EnemyProjectile_RobotLaser_UpLeft : STA.B DP_Temp30
; fallthrough to HandleFiringLaser_Upwards


;;; $D0DC: Handle firing laser - upwards ;;;
HandleFiringLaser_Upwards:
    LDA.W Robot.laserCooldown,X : BNE .timerNotExpired
    LDA.W RandomNumberSeed : AND.W #$001F : CLC : ADC.W #$0010 : STA.W Robot.laserCooldown,X
    PHX
    LDY.B DP_Temp30
    LDX.W EnemyIndex
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    PLX
    LDY.B DP_Temp32
    RTL

  .timerNotExpired:
    JSR DecrementRobotLaserCooldown
    RTL


;;; $D100: Instruction - try shooting laser horizontally and go to $CB09 if so ;;;
Instruction_Robot_TryShootingLaserRight:
    LDA.W #InstList_Robot_FacingRight_ShotLaserRight : STA.B DP_Temp32
    BRA HandleFiringLaser_Horizontal


;;; $D107: Instruction - try shooting laser horizontally and go to $C8BD if so ;;;
Instruction_Robot_TryShootingLaserLeft:
    LDA.W #InstList_Robot_FacingLeft_ShotLaserLeft : STA.B DP_Temp32
; fallthrough to HandleFiringLaser_Horizontal


;;; $D10C: Handle firing laser - horizontal ;;;
HandleFiringLaser_Horizontal:
    LDA.W Robot.laserCooldown,X : BNE .timerNotExpired
    LDA.W RandomNumberSeed : AND.W #$001F : CLC : ADC.W #$0010 : STA.W Robot.laserCooldown,X
    PHX
    LDY.W #EnemyProjectile_RobotLaser_Horizontal
    LDX.W EnemyIndex
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    PLX
    LDY.B DP_Temp32
    RTL

  .timerNotExpired:
    JSR DecrementRobotLaserCooldown
    RTL


;;; $D131: Instruction - try shooting laser down-right and go to $CAFD if so ;;;
Instruction_Robot_TryShootingLaserDownRight:
    LDA.W #EnemyProjectile_RobotLaser_DownRight : STA.B DP_Temp30
    LDA.W #InstList_Robot_FacingRight_ShotLaserDownRight : STA.B DP_Temp32
    BRA HandleFiringLaser_Downwards


;;; $D13D: Instruction - try shooting laser down-left and go to $C8B1 if so ;;;
Instruction_Robot_TryShootingLaserDownLeft:
    LDA.W #EnemyProjectile_RobotLaser_DownLeft : STA.B DP_Temp30
    LDA.W #InstList_Robot_FacingLeft_ShotLaserDownLeft : STA.B DP_Temp32
; fallthrough to HandleFiringLaser_Downwards


;;; $D147: Handle firing laser - downwards ;;;
HandleFiringLaser_Downwards:
    LDA.W Robot.laserCooldown,X : BNE .timerNotExpired
    LDA.W RandomNumberSeed : AND.W #$001F : CLC : ADC.W #$0010 : STA.W Robot.laserCooldown,X
    PHX
    LDY.B DP_Temp30
    LDX.W EnemyIndex
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    LDY.B DP_Temp32
    PLX
    RTL

  .timerNotExpired:
    JSR DecrementRobotLaserCooldown
    RTL


;;; $D16B: Instruction - decrement enemy laser cooldown ;;;
Instruction_Robot_DecrementLaserCooldown:
    PHX
    LDX.W EnemyIndex
    JSR DecrementRobotLaserCooldown
    PLX
    RTL


;;; $D174: Enemy touch - enemy $E8FF/$E93F (work robot) ;;;
EnemyTouch_Robot:
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : CMP.W SamusXPosition : BMI .rightOfSamus
    LDA.W #$FFFC : STA.W ExtraSamusXDisplacement
    RTL

  .rightOfSamus:
    LDA.W #$0004 : STA.W ExtraSamusXDisplacement
    RTL


;;; $D18D: Enemy shot - enemy $E93F (work robot deactivated) ;;;
EnemyShot_RobotNoPower:
    JSL NormalEnemyShotAI
    RTL


;;; $D192: Enemy shot - enemy $E8FF (work robot) ;;;
EnemyShot_Robot:
    REP #$30
    PHX : PHY
    LDX.W AreaIndex
    LDA.L SRAMMirror_Boss,X : BIT.W #$0001 : BEQ .return
    LDX.W EnemyIndex
    JSL NormalEnemyShotAI
    LDX.W EnemyIndex
    LDA.W Enemy.health,X : BEQ .return
    LDA.W Robot.laserXVelocity,X : BMI .facingLeft
    LDA.W SamusXPosition : CMP.W Enemy.XPosition,X : BMI .facingRight_behind
    LDA.W #InstList_Robot_FacingRight_Shot_SamusIsAhead
    BRA .merge

  .facingRight_behind:
    LDA.W #InstList_Robot_FacingRight_Shot_SamusIsBehind
    BRA .merge

  .return:
    PLY : PLX
    RTL

  .facingLeft:
    LDA.W SamusXPosition : CMP.W Enemy.XPosition,X : BPL .facingLeft_behind
    LDA.W #InstList_Robot_FacingLeft_Shot_SamusIsAhead

  .merge:
    STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W Robot.laserCooldown,X : CLC : ADC.W #$0040 : STA.W Robot.laserCooldown,X
    PLY : PLX
    RTL

  .facingLeft_behind:
    LDA.W #InstList_Robot_FacingLeft_Shot_SamusIsBehind
    BRA .merge


;;; $D1F1: Work robot spritemaps ;;;
Spritemap_Robot_0:
    dw $000C
    %spritemapEntry(1, $00, $01, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F0, $01, 0, 0, 2, 0, $12C)
    %spritemapEntry(0, $08, $17, 0, 0, 2, 0, $149)
    %spritemapEntry(0, $00, $17, 0, 0, 2, 0, $148)
    %spritemapEntry(1, $00, $07, 0, 0, 2, 0, $10C)
    %spritemapEntry(0, $00, $19, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1F8, $19, 0, 0, 2, 0, $14A)
    %spritemapEntry(1, $1F8, $09, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $00, $F1, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1F0, $F1, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $00, $E1, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F0, $E1, 0, 0, 2, 0, $100)

Spritemap_Robot_1:
    dw $000C
    %spritemapEntry(1, $01, $01, 0, 0, 2, 0, $146)
    %spritemapEntry(1, $1F1, $01, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $03, $18, 0, 0, 2, 0, $149)
    %spritemapEntry(0, $1FB, $18, 0, 0, 2, 0, $148)
    %spritemapEntry(1, $1FB, $08, 0, 0, 2, 0, $10C)
    %spritemapEntry(0, $00, $19, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1F8, $19, 0, 0, 2, 0, $14A)
    %spritemapEntry(1, $1F8, $09, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $00, $F1, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1F0, $F1, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $1FF, $E1, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1EF, $E1, 0, 0, 2, 0, $104)

Spritemap_Robot_2:
    dw $000C
    %spritemapEntry(1, $00, $01, 0, 0, 2, 0, $146)
    %spritemapEntry(1, $1F0, $01, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $1FF, $19, 0, 0, 2, 0, $149)
    %spritemapEntry(0, $1F7, $19, 0, 0, 2, 0, $148)
    %spritemapEntry(1, $1F7, $09, 0, 0, 2, 0, $10C)
    %spritemapEntry(0, $01, $19, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1F9, $19, 0, 0, 2, 0, $14A)
    %spritemapEntry(1, $1F9, $09, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $00, $F1, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1F0, $F1, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $00, $E1, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1F0, $E1, 0, 0, 2, 0, $104)

Spritemap_Robot_3:
    dw $000C
    %spritemapEntry(1, $1FF, $01, 0, 0, 2, 0, $146)
    %spritemapEntry(1, $1EF, $01, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $1FC, $18, 0, 0, 2, 0, $149)
    %spritemapEntry(0, $1F4, $18, 0, 0, 2, 0, $148)
    %spritemapEntry(1, $1F4, $08, 0, 0, 2, 0, $10C)
    %spritemapEntry(0, $00, $19, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1F8, $19, 0, 0, 2, 0, $14A)
    %spritemapEntry(1, $1F8, $09, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $00, $F1, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1F0, $F1, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $01, $E1, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1F1, $E1, 0, 0, 2, 0, $104)

Spritemap_Robot_4:
    dw $000C
    %spritemapEntry(1, $00, $01, 0, 0, 2, 0, $142)
    %spritemapEntry(1, $1F0, $01, 0, 0, 2, 0, $140)
    %spritemapEntry(0, $1F7, $16, 0, 0, 2, 0, $149)
    %spritemapEntry(0, $1EF, $16, 0, 0, 2, 0, $148)
    %spritemapEntry(1, $1EF, $06, 0, 0, 2, 0, $10C)
    %spritemapEntry(0, $01, $19, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1F9, $19, 0, 0, 2, 0, $14A)
    %spritemapEntry(1, $1F9, $09, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $00, $F1, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $1F0, $F1, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $00, $E1, 0, 0, 2, 0, $10A)
    %spritemapEntry(1, $1F0, $E1, 0, 0, 2, 0, $108)

Spritemap_Robot_5:
    dw $000C
    %spritemapEntry(1, $00, $01, 0, 0, 2, 0, $146)
    %spritemapEntry(1, $1F0, $01, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $1FC, $17, 0, 0, 2, 0, $149)
    %spritemapEntry(0, $1F4, $17, 0, 0, 2, 0, $148)
    %spritemapEntry(1, $1F4, $07, 0, 0, 2, 0, $10C)
    %spritemapEntry(0, $04, $19, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1FC, $19, 0, 0, 2, 0, $14A)
    %spritemapEntry(1, $1FC, $09, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $00, $F1, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1F0, $F1, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $00, $E1, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1F0, $E1, 0, 0, 2, 0, $104)

Spritemap_Robot_6:
    dw $000C
    %spritemapEntry(1, $00, $01, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F0, $01, 0, 0, 2, 0, $12C)
    %spritemapEntry(0, $00, $19, 0, 0, 2, 0, $149)
    %spritemapEntry(0, $1F8, $19, 0, 0, 2, 0, $148)
    %spritemapEntry(1, $1F8, $09, 0, 0, 2, 0, $10C)
    %spritemapEntry(0, $08, $17, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $00, $17, 0, 0, 2, 0, $14A)
    %spritemapEntry(1, $00, $07, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $00, $F1, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1F0, $F1, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $00, $E1, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F0, $E1, 0, 0, 2, 0, $100)

Spritemap_Robot_7:
    dw $000C
    %spritemapEntry(1, $01, $01, 0, 0, 2, 0, $146)
    %spritemapEntry(1, $1F1, $01, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $00, $19, 0, 0, 2, 0, $149)
    %spritemapEntry(0, $1F8, $19, 0, 0, 2, 0, $148)
    %spritemapEntry(1, $1F8, $09, 0, 0, 2, 0, $10C)
    %spritemapEntry(0, $03, $18, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1FB, $18, 0, 0, 2, 0, $14A)
    %spritemapEntry(1, $1FB, $08, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $00, $F1, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1F0, $F1, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $1FF, $E1, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1EF, $E1, 0, 0, 2, 0, $104)

Spritemap_Robot_8:
    dw $000C
    %spritemapEntry(1, $00, $01, 0, 0, 2, 0, $146)
    %spritemapEntry(1, $1F0, $01, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $1F8, $19, 0, 0, 2, 0, $148)
    %spritemapEntry(0, $00, $19, 0, 0, 2, 0, $149)
    %spritemapEntry(1, $1F8, $09, 0, 0, 2, 0, $10C)
    %spritemapEntry(0, $1FE, $19, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1F6, $19, 0, 0, 2, 0, $14A)
    %spritemapEntry(1, $1F6, $09, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $00, $F1, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1F0, $F1, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $00, $E1, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1F0, $E1, 0, 0, 2, 0, $104)

Spritemap_Robot_9:
    dw $000C
    %spritemapEntry(1, $1FF, $01, 0, 0, 2, 0, $146)
    %spritemapEntry(1, $1EF, $01, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $00, $19, 0, 0, 2, 0, $149)
    %spritemapEntry(0, $1F8, $19, 0, 0, 2, 0, $148)
    %spritemapEntry(1, $1F8, $09, 0, 0, 2, 0, $10C)
    %spritemapEntry(0, $1FC, $18, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1F4, $18, 0, 0, 2, 0, $14A)
    %spritemapEntry(1, $1F4, $08, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $00, $F1, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1F0, $F1, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $01, $E1, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1F1, $E1, 0, 0, 2, 0, $104)

Spritemap_Robot_A:
    dw $000C
    %spritemapEntry(1, $00, $01, 0, 0, 2, 0, $142)
    %spritemapEntry(1, $1F0, $01, 0, 0, 2, 0, $140)
    %spritemapEntry(0, $01, $19, 0, 0, 2, 0, $149)
    %spritemapEntry(0, $1F9, $19, 0, 0, 2, 0, $148)
    %spritemapEntry(1, $1F9, $09, 0, 0, 2, 0, $10C)
    %spritemapEntry(0, $1F7, $16, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1EF, $16, 0, 0, 2, 0, $14A)
    %spritemapEntry(1, $1EF, $06, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $00, $F1, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $1F0, $F1, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $00, $E1, 0, 0, 2, 0, $10A)
    %spritemapEntry(1, $1F0, $E1, 0, 0, 2, 0, $108)

Spritemap_Robot_B:
    dw $000C
    %spritemapEntry(1, $00, $01, 0, 0, 2, 0, $146)
    %spritemapEntry(1, $1F0, $01, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $04, $19, 0, 0, 2, 0, $149)
    %spritemapEntry(0, $1FC, $19, 0, 0, 2, 0, $148)
    %spritemapEntry(1, $1FC, $09, 0, 0, 2, 0, $10C)
    %spritemapEntry(0, $1FC, $17, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1F4, $17, 0, 0, 2, 0, $14A)
    %spritemapEntry(1, $1F4, $07, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $00, $F1, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1F0, $F1, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $00, $E1, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1F0, $E1, 0, 0, 2, 0, $104)

Spritemap_Robot_C:
    dw $000C
    %spritemapEntry(1, $1F0, $01, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $00, $01, 0, 1, 2, 0, $12C)
    %spritemapEntry(0, $1F0, $17, 0, 1, 2, 0, $149)
    %spritemapEntry(0, $1F8, $17, 0, 1, 2, 0, $148)
    %spritemapEntry(1, $1F0, $07, 0, 1, 2, 0, $10C)
    %spritemapEntry(0, $1F8, $19, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $00, $19, 0, 1, 2, 0, $14A)
    %spritemapEntry(1, $1F8, $09, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $1F0, $F1, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $00, $F1, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $1F0, $E1, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $00, $E1, 0, 1, 2, 0, $100)

Spritemap_Robot_D:
    dw $000C
    %spritemapEntry(1, $1EF, $01, 0, 1, 2, 0, $146)
    %spritemapEntry(1, $1FF, $01, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1F5, $18, 0, 1, 2, 0, $149)
    %spritemapEntry(0, $1FD, $18, 0, 1, 2, 0, $148)
    %spritemapEntry(1, $1F5, $08, 0, 1, 2, 0, $10C)
    %spritemapEntry(0, $1F8, $19, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $00, $19, 0, 1, 2, 0, $14A)
    %spritemapEntry(1, $1F8, $09, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $1F0, $F1, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $00, $F1, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $1F1, $E1, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $01, $E1, 0, 1, 2, 0, $104)

Spritemap_Robot_E:
    dw $000C
    %spritemapEntry(1, $1F0, $01, 0, 1, 2, 0, $146)
    %spritemapEntry(1, $00, $01, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1F9, $19, 0, 1, 2, 0, $149)
    %spritemapEntry(0, $01, $19, 0, 1, 2, 0, $148)
    %spritemapEntry(1, $1F9, $09, 0, 1, 2, 0, $10C)
    %spritemapEntry(0, $1F7, $19, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $1FF, $19, 0, 1, 2, 0, $14A)
    %spritemapEntry(1, $1F7, $09, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $1F0, $F1, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $00, $F1, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $1F0, $E1, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $00, $E1, 0, 1, 2, 0, $104)

Spritemap_Robot_F:
    dw $000C
    %spritemapEntry(1, $1F1, $01, 0, 1, 2, 0, $146)
    %spritemapEntry(1, $01, $01, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1FC, $18, 0, 1, 2, 0, $149)
    %spritemapEntry(0, $04, $18, 0, 1, 2, 0, $148)
    %spritemapEntry(1, $1FC, $08, 0, 1, 2, 0, $10C)
    %spritemapEntry(0, $1F8, $19, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $00, $19, 0, 1, 2, 0, $14A)
    %spritemapEntry(1, $1F8, $09, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $1F0, $F1, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $00, $F1, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $1EF, $E1, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $1FF, $E1, 0, 1, 2, 0, $104)

Spritemap_Robot_10:
    dw $000C
    %spritemapEntry(1, $1F0, $01, 0, 1, 2, 0, $142)
    %spritemapEntry(1, $00, $01, 0, 1, 2, 0, $140)
    %spritemapEntry(0, $01, $16, 0, 1, 2, 0, $149)
    %spritemapEntry(0, $09, $16, 0, 1, 2, 0, $148)
    %spritemapEntry(1, $01, $06, 0, 1, 2, 0, $10C)
    %spritemapEntry(0, $1F7, $19, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $1FF, $19, 0, 1, 2, 0, $14A)
    %spritemapEntry(1, $1F7, $09, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $1F0, $F1, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $00, $F1, 0, 1, 2, 0, $128)
    %spritemapEntry(1, $1F0, $E1, 0, 1, 2, 0, $10A)
    %spritemapEntry(1, $00, $E1, 0, 1, 2, 0, $108)

Spritemap_Robot_11:
    dw $000C
    %spritemapEntry(1, $1F0, $01, 0, 1, 2, 0, $146)
    %spritemapEntry(1, $00, $01, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1FC, $17, 0, 1, 2, 0, $149)
    %spritemapEntry(0, $04, $17, 0, 1, 2, 0, $148)
    %spritemapEntry(1, $1FC, $07, 0, 1, 2, 0, $10C)
    %spritemapEntry(0, $1F4, $19, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $1FC, $19, 0, 1, 2, 0, $14A)
    %spritemapEntry(1, $1F4, $09, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $1F0, $F1, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $00, $F1, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $1F0, $E1, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $00, $E1, 0, 1, 2, 0, $104)

Spritemap_Robot_12:
    dw $000C
    %spritemapEntry(1, $1F0, $01, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $00, $01, 0, 1, 2, 0, $12C)
    %spritemapEntry(0, $1F8, $19, 0, 1, 2, 0, $149)
    %spritemapEntry(0, $00, $19, 0, 1, 2, 0, $148)
    %spritemapEntry(1, $1F8, $09, 0, 1, 2, 0, $10C)
    %spritemapEntry(0, $1F0, $17, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $1F8, $17, 0, 1, 2, 0, $14A)
    %spritemapEntry(1, $1F0, $07, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $1F0, $F1, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $00, $F1, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $1F0, $E1, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $00, $E1, 0, 1, 2, 0, $100)

Spritemap_Robot_13:
    dw $000C
    %spritemapEntry(1, $1EF, $01, 0, 1, 2, 0, $146)
    %spritemapEntry(1, $1FF, $01, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1F8, $19, 0, 1, 2, 0, $149)
    %spritemapEntry(0, $00, $19, 0, 1, 2, 0, $148)
    %spritemapEntry(1, $1F8, $09, 0, 1, 2, 0, $10C)
    %spritemapEntry(0, $1F5, $18, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $1FD, $18, 0, 1, 2, 0, $14A)
    %spritemapEntry(1, $1F5, $08, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $1F0, $F1, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $00, $F1, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $1F1, $E1, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $01, $E1, 0, 1, 2, 0, $104)

Spritemap_Robot_14:
    dw $000C
    %spritemapEntry(1, $1F0, $01, 0, 1, 2, 0, $146)
    %spritemapEntry(1, $00, $01, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $00, $19, 0, 1, 2, 0, $148)
    %spritemapEntry(0, $1F8, $19, 0, 1, 2, 0, $149)
    %spritemapEntry(1, $1F8, $09, 0, 1, 2, 0, $10C)
    %spritemapEntry(0, $1FA, $19, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $02, $19, 0, 1, 2, 0, $14A)
    %spritemapEntry(1, $1FA, $09, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $1F0, $F1, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $00, $F1, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $1F0, $E1, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $00, $E1, 0, 1, 2, 0, $104)

Spritemap_Robot_15:
    dw $000C
    %spritemapEntry(1, $1F1, $01, 0, 1, 2, 0, $146)
    %spritemapEntry(1, $01, $01, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1F8, $19, 0, 1, 2, 0, $149)
    %spritemapEntry(0, $00, $19, 0, 1, 2, 0, $148)
    %spritemapEntry(1, $1F8, $09, 0, 1, 2, 0, $10C)
    %spritemapEntry(0, $1FC, $18, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $04, $18, 0, 1, 2, 0, $14A)
    %spritemapEntry(1, $1FC, $08, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $1F0, $F1, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $00, $F1, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $1EF, $E1, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $1FF, $E1, 0, 1, 2, 0, $104)

Spritemap_Robot_16:
    dw $000C
    %spritemapEntry(1, $1F0, $01, 0, 1, 2, 0, $142)
    %spritemapEntry(1, $00, $01, 0, 1, 2, 0, $140)
    %spritemapEntry(0, $1F7, $19, 0, 1, 2, 0, $149)
    %spritemapEntry(0, $1FF, $19, 0, 1, 2, 0, $148)
    %spritemapEntry(1, $1F7, $09, 0, 1, 2, 0, $10C)
    %spritemapEntry(0, $01, $16, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $09, $16, 0, 1, 2, 0, $14A)
    %spritemapEntry(1, $01, $06, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $1F0, $F1, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $00, $F1, 0, 1, 2, 0, $128)
    %spritemapEntry(1, $1F0, $E1, 0, 1, 2, 0, $10A)
    %spritemapEntry(1, $00, $E1, 0, 1, 2, 0, $108)

Spritemap_Robot_17:
    dw $000C
    %spritemapEntry(1, $1F0, $01, 0, 1, 2, 0, $146)
    %spritemapEntry(1, $00, $01, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1F4, $19, 0, 1, 2, 0, $149)
    %spritemapEntry(0, $1FC, $19, 0, 1, 2, 0, $148)
    %spritemapEntry(1, $1F4, $09, 0, 1, 2, 0, $10C)
    %spritemapEntry(0, $1FC, $17, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $04, $17, 0, 1, 2, 0, $14A)
    %spritemapEntry(1, $1FC, $07, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $1F0, $F1, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $00, $F1, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $1F0, $E1, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $00, $E1, 0, 1, 2, 0, $104)

Spritemap_Robot_18:
    dw $0006
    %spritemapEntry(1, $00, $01, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F0, $01, 0, 0, 2, 0, $12C)
    %spritemapEntry(1, $00, $F1, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1F0, $F1, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $00, $E1, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F0, $E1, 0, 0, 2, 0, $100)

Spritemap_Robot_19:
    dw $0006
    %spritemapEntry(1, $00, $01, 0, 0, 2, 0, $146)
    %spritemapEntry(1, $1F0, $01, 0, 0, 2, 0, $144)
    %spritemapEntry(1, $00, $F1, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1F0, $F1, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $00, $E1, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1F0, $E1, 0, 0, 2, 0, $104)

Spritemap_Robot_1A:
    dw $0006
    %spritemapEntry(1, $00, $01, 0, 0, 2, 0, $142)
    %spritemapEntry(1, $1F0, $01, 0, 0, 2, 0, $140)
    %spritemapEntry(1, $00, $F1, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $1F0, $F1, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $00, $E1, 0, 0, 2, 0, $10A)
    %spritemapEntry(1, $1F0, $E1, 0, 0, 2, 0, $108)


;;; $D821: Palette - enemy $E97F (bull) ;;;
Palette_Bull:
    dw $3800,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166
    dw $0924,$435A,$3694,$15AD,$0508,$03FF,$0237,$00D1


;;; $D841: Instruction list - normal ;;;
InstList_Bull_Normal:
    dw $000A,Spritemap_Bull_0
    dw $000A,Spritemap_Bull_1
    dw $000A,Spritemap_Bull_0
    dw $000A,Spritemap_Bull_2
    dw Instruction_Common_GotoY
    dw InstList_Bull_Normal


;;; $D855: Instruction list - shot ;;;
InstList_Bull_Shot_0:
    dw Instruction_Common_TimerInY,$0005

InstList_Bull_Shot_1:
    dw $0003,Spritemap_Bull_0
    dw $0003,Spritemap_Bull_1
    dw $0003,Spritemap_Bull_0
    dw $0003,Spritemap_Bull_2
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate
    dw InstList_Bull_Shot_1
    dw Instruction_Common_GotoY
    dw InstList_Bull_Normal


;;; $D871: Bull constants ;;;
BullConstants:
  .AngleToMove:
; Angle to move when shot by non-damaging projectile
  ..upFacingRight:
    dw $00C0
  ..upRight:
    dw $00E0
  ..right:
    dw $0000
  ..downRight:
    dw $0020
  ..downFacingRight:
    dw $0040
  ..downFacingLeft:
    dw $0040
  ..downLeft:
    dw $0060
  ..left:
    dw $0080
  ..upLeft:
    dw $00A0
  ..upFacingLeft:
    dw $00C0

  .MaxSpeeds:
; Max speeds. Indexed by [enemy parameter 2] * 2
    dw $03FF,$04FF,$05FF,$06FF,$07FF,$08FF,$09FF,$0AFF


;;; $D895: Bull acceleration interval table ;;;
BullAccelerationIntervalTable:
; Indexed by [enemy parameter 1] * 4
;        _________ Acceleration interval timer reset value
;       |      ___ Deceleration interval timer reset value
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


;;; $D8C9: Initialisation AI - enemy $E97F (bull) ;;;
InitAI_Bull:
    LDX.W EnemyIndex
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.W #InstList_Bull_Normal : STA.W Enemy.instList,X
    LDA.W Enemy.init0,X : ASL #2 : TAY
    LDA.W BullAccelerationIntervalTable_accel,Y : STA.L Bull.accelerationIntervalTimerResetValue,X : STA.W Bull.accelerationIntervalTimer,X
    LDA.W BullAccelerationIntervalTable_decel,Y : STA.L Bull.decelerationIntervalTimerResetValue,X
    LDA.W #$0010 : STA.W Bull.activationTimer,X
    LDA.W #Function_Bull_MovementDelay : STA.W Bull.function,X
    LDA.W Enemy.init1,X : ASL : TAY
    LDA.W BullConstants_MaxSpeeds,Y : STA.L Bull.maxSpeed,X
    RTL


;;; $D90B: Main AI - enemy $E97F (bull) ;;;
MainAI_Bull:
    LDX.W EnemyIndex
    LDA.L Bull.shotReactionDisableTimer,X : DEC : STA.L Bull.shotReactionDisableTimer,X : BNE .function
    LDA.W #$0001 : STA.L Bull.shotReactionDisableTimer,X
    LDA.W #$0000 : STA.L Bull.shotReactionDisableFlag,X

  .function:
    JSR.W (Bull.function,X)
    RTL


;;; $D92B: Bull function - movement delay ;;;
Function_Bull_MovementDelay:
    LDX.W EnemyIndex ; >.<
    DEC.W Bull.activationTimer,X : BNE .return
    LDA.W #$0010 : STA.W Bull.activationTimer,X
    LDA.W #Function_Bull_TargetSamus : STA.W Bull.function,X

  .return:
    RTS


;;; $D940: Bull function - target Samus ;;;
Function_Bull_TargetSamus:
    LDX.W EnemyIndex ; >.<
    JSL CalculateAngleOfSamusFromEnemy
    SEC : SBC.W #$0040 : AND.W #$00FF : STA.L Bull.angleToSamus,X : STA.L Bull.angle,X
    LDA.W #Function_Bull_Accelerating : STA.W Bull.function,X
    LDA.W #$0018 : STA.W Bull.accelerationDelta,X
    RTS


;;; $D963: Bull function - accelerating ;;;
Function_Bull_Accelerating:
    LDX.W EnemyIndex ; >.<
    LDA.W Bull.speed,X : CMP.L Bull.maxSpeed,X : BPL .maxSpeed
    JSR AccelerateBull

  .maxSpeed:
    JSR BullXMovement
    JSR BullYMovement
    JSR TriggerBullDecelerationIfTooFarOffTarget
    RTS


;;; $D97C: Bull function - decelerating ;;;
Function_Bull_Decelerating:
    LDX.W EnemyIndex ; >.<
    LDA.W Bull.speed,X : BEQ .stopped
    BMI .stopped
    LDA.W Bull.acceleration,X : BEQ .stopped
    BPL .decelerate

  .stopped:
    LDA.W #Function_Bull_MovementDelay : STA.W Bull.function,X
    LDA.W #$0000 : STA.W Bull.acceleration,X
    STA.W Bull.accelerationDelta,X : STA.W Bull.speed,X
    RTS

  .decelerate:
    JSR BullXMovement
    JSR BullYMovement
    JSR DecelerateBull
    RTS


;;; $D9AA: Trigger bull deceleration if too far off target ;;;
TriggerBullDecelerationIfTooFarOffTarget:
    LDX.W EnemyIndex
    JSL CalculateAngleOfSamusFromEnemy
    SEC : SBC.W #$0040 : AND.W #$00FF : STA.L Bull.angleToSamus,X
    SEC : SBC.L Bull.angle,X
    JSL Sign_Extend_A
    JSL NegateA_A0B067
    CMP.W #$0030 : BMI .return
    LDA.W #Function_Bull_Decelerating : STA.W Bull.function,X
    LDA.W #$0018 : STA.W Bull.accelerationDelta,X

  .return:
    RTS


;;; $D9DB: Bull X movement ;;;
BullXMovement:
    LDX.W EnemyIndex
    STZ.B DP_Temp1A
    LDA.L Bull.angle,X
    PHX
    CLC : ADC.W #$0040 : AND.W #$00FF : ASL : TAX
    LDA.L SineCosineTables_16bitSine,X : STA.B DP_Temp12
    PLX
    LDA.B DP_Temp12 : BPL .positive
    INC.B DP_Temp1A

  .positive:
    LDA.B DP_Temp12
    JSL NegateA_A0B067
    AND.W #$FF00 : XBA : STA.B DP_Temp16
    LDA.W Bull.speed,X : STA.B DP_Temp18
    JSR Math_24Bit_UnsignedMultiplication_A8DAB3
    LDA.B DP_Temp1A : BEQ .notLeft
    JSR Negate_1E_1C_A8DAF6

  .notLeft:
    CLC
    LDA.W Enemy.XSubPosition,X : ADC.B DP_Temp1C : STA.W Enemy.XSubPosition,X
    LDA.W Enemy.XPosition,X : ADC.B DP_Temp1E : STA.W Enemy.XPosition,X
    RTS


;;; $DA28: Bull Y movement ;;;
BullYMovement:
    LDX.W EnemyIndex
    STZ.B DP_Temp1A
    LDA.L Bull.angle,X
    PHX
    AND.W #$00FF : ASL : TAX
    LDA.L SineCosineTables_16bitSine,X : STA.B DP_Temp12
    PLX
    LDA.B DP_Temp12 : BPL .positive
    INC.B DP_Temp1A

  .positive:
    LDA.B DP_Temp12
    JSL NegateA_A0B067
    AND.W #$FF00 : XBA : STA.B DP_Temp16
    LDA.W Bull.speed,X : STA.B DP_Temp18
    JSR Math_24Bit_UnsignedMultiplication_A8DAB3
    LDA.B DP_Temp1A : BEQ .notUp
    JSR Negate_1E_1C_A8DAF6

  .notUp:
    CLC
    LDA.W Enemy.YSubPosition,X : ADC.B DP_Temp1C : STA.W Enemy.YSubPosition,X
    LDA.W Enemy.YPosition,X : ADC.B DP_Temp1E : STA.W Enemy.YPosition,X
    RTS


;;; $DA71: Accelerate bull ;;;
AccelerateBull:
    DEC.W Bull.accelerationIntervalTimer,X : BNE .return
    LDA.L Bull.accelerationIntervalTimerResetValue,X : STA.W Bull.accelerationIntervalTimer,X
    LDA.W Bull.acceleration,X : CLC : ADC.W Bull.accelerationDelta,X : STA.W Bull.acceleration,X
    LDA.W Bull.speed,X : CLC : ADC.W Bull.acceleration,X : STA.W Bull.speed,X

  .return:
    RTS


;;; $DA92: Decelerate bull ;;;
DecelerateBull:
    DEC.W Bull.accelerationIntervalTimer,X : BNE .return
    LDA.L Bull.decelerationIntervalTimerResetValue,X : STA.W Bull.accelerationIntervalTimer,X
    LDA.W Bull.acceleration,X : SEC : SBC.W Bull.accelerationDelta,X : STA.W Bull.acceleration,X
    LDA.W Bull.speed,X : SEC : SBC.W Bull.acceleration,X : STA.W Bull.speed,X

  .return:
    RTS


;;; $DAB3: $1E.$1C = [$16] * [$18] / 10000h (24-bit unsigned multiplication) ;;;
Math_24Bit_UnsignedMultiplication_A8DAB3:
; Let:
;     $16 = a
;     $18 = b + c * 100h
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


;;; $DAF6: Negate $1E.$1C ;;;
Negate_1E_1C_A8DAF6:
; Actual result is as follows:
;     If [$1E].[$1C] = 0.0:
;         Return
;
;     If [$1C] != 0:
;         $1E = -[$1E].[$1C]
;     Else:
;         $1E = -0.0001h - [$1E].[$1C]
    LDA.B DP_Temp1C : BNE .nonZero
    LDA.B DP_Temp1E : BEQ .return
    DEC.B DP_Temp1C
    BRA +

  .nonZero:
    LDA.B DP_Temp1C ; >.<
    LDA.W #$0000 : SEC : SBC.B DP_Temp1C : STA.B DP_Temp1C

+   LDA.B DP_Temp1E : EOR.W #$FFFF : STA.B DP_Temp1E

  .return:
    RTS


;;; $DB14: Enemy shot - enemy $E97F (bull) ;;;
EnemyShot_Bull:
    LDX.W EnemyIndex
    LDA.W Enemy.health,X : STA.L Bull.previousHealth,X
    JSL CommonA8_NormalEnemyShotAI
    LDA.W Enemy.health,X : CMP.L Bull.previousHealth,X : BEQ .noDamage
    RTL

  .noDamage:
    LDA.L Bull.shotReactionDisableFlag,X : BNE .return
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.W #InstList_Bull_Shot_0 : STA.W Enemy.instList,X
    LDA.W CollisionIndex : ASL : TAY
    LDA.W SamusProjectile_Directions,Y : AND.W #$000F : ASL : TAY
    LDA.W BullConstants_AngleToMove_upFacingRight,Y : STA.L Bull.angle,X
    LDA.W #$0100 : STA.W Bull.acceleration,X
    LDA.W #$0600 : STA.W Bull.speed,X
    LDA.W #Function_Bull_Decelerating : STA.W Bull.function,X
    LDA.W #$0030 : STA.L Bull.shotReactionDisableTimer,X
    LDA.W #$0001 : STA.L Bull.shotReactionDisableFlag,X

  .return:
    RTL


;;; $DB76: Bull spritemaps ;;;
Spritemap_Bull_0:
    dw $0004
    %spritemapEntry(1, $1F8, $00, 0, 0, 2, 0, $10A)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $109)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $107)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $106)

Spritemap_Bull_1:
    dw $0004
    %spritemapEntry(1, $1F8, $00, 0, 0, 2, 0, $10D)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $103)

Spritemap_Bull_2:
    dw $0007
    %spritemapEntry(0, $00, $08, 0, 0, 2, 0, $11F)
    %spritemapEntry(0, $00, $00, 0, 0, 2, 0, $10F)
    %spritemapEntry(0, $1F8, $08, 0, 0, 2, 0, $123)
    %spritemapEntry(0, $1F0, $08, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 2, 0, $110)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $101)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $100)


;;; $DBC7: Palette - enemy $E9BF (alcoon) ;;;
Palette_Alcoon:
    dw $3800,$02FF,$01BF,$000F,$0008,$01BF,$011B,$00BA
    dw $0011,$5A5C,$41B4,$290D,$1065,$03FF,$0237,$00D1


;;; $DBE7: Instruction list - facing left - walking ;;;
InstList_Alcoon_FacingLeft_Walking_0:
    dw Instruction_Alcoon_MoveHorizontally_TurnIfWallCollision

InstList_Alcoon_FacingLeft_Walking_1:
    dw $000A,Spritemap_Alcoon_FacingLeft_FrontFootForward
    dw Instruction_Alcoon_MoveHorizontally_TurnIfWallCollision
    dw $000A,Spritemap_Alcoon_FacingLeft_FeetTogether_FrontFootDown
    dw Instruction_Alcoon_MoveHorizontally_TurnIfWallCollision
    dw $000A,Spritemap_Alcoon_FacingLeft_FrontFootBack
    dw Instruction_Alcoon_DecrementStepCounter_MoveHorizontally
    dw $000A,Spritemap_Alcoon_FacingLeft_FeetTogether_BackFootForward
    dw Instruction_Common_GotoY
    dw InstList_Alcoon_FacingLeft_Walking_0


;;; $DC03: Instruction list - facing left - spawn fireballs ;;;
InstList_Alcoon_FacingLeft_SpawnFireballs:
    dw $0014,Spritemap_Alcoon_FacingLeft_WingFullyExtended_BackFootFoward
    dw $0009,Spritemap_Alcoon_FacingLeft_WingMovingForward_MouthEnlarging
    dw $0010,Spritemap_Alcoon_FacingLeft_WingForward_AboutToSpit
    dw $0003,Spritemap_Alcoon_FacingLeft_WingMovingForward_MouthEnlarging
    dw Instruction_Alcoon_SpawnAlcoonFireballHorizontally
    dw $000A,Spritemap_Alcoon_FacingLeft_WingExtended_MouthJustSpit
    dw $000A,Spritemap_Alcoon_FacingLeft_WingFullyExtended_BackFootFoward
    dw $0009,Spritemap_Alcoon_FacingLeft_WingMovingForward_MouthEnlarging
    dw $0010,Spritemap_Alcoon_FacingLeft_WingForward_AboutToSpit
    dw $0003,Spritemap_Alcoon_FacingLeft_WingMovingForward_MouthEnlarging
    dw Instruction_Alcoon_SpawnAlcoonFireballUpward
    dw $000A,Spritemap_Alcoon_FacingLeft_WingExtended_MouthJustSpit
    dw $000A,Spritemap_Alcoon_FacingLeft_WingFullyExtended_BackFootFoward
    dw $0009,Spritemap_Alcoon_FacingLeft_WingMovingForward_MouthEnlarging
    dw $0010,Spritemap_Alcoon_FacingLeft_WingForward_AboutToSpit
    dw $0003,Spritemap_Alcoon_FacingLeft_WingMovingForward_MouthEnlarging
    dw Instruction_Alcoon_SpawnAlcoonFireballDownward
    dw $0028,Spritemap_Alcoon_FacingLeft_WingExtended_MouthJustSpit
    dw Instruction_Alcoon_StartWalking
    dw $0001,Spritemap_Alcoon_FacingLeft_WingExtended_MouthJustSpit


;;; $DC4B: Instruction list - facing left - airborne - looking up ;;;
InstList_Alcoon_FacingLeft_Airborne_LookingUp:
    dw $7FFF,Spritemap_Alcoon_FacingLeft_LookingUp
    dw Instruction_Common_Sleep


;;; $DC51: Instruction list - facing left - airborne - looking forward ;;;
InstList_Alcoon_FacingLeft_Airborne_LookingForward:
    dw $7FFF,Spritemap_Alcoon_FacingLeft_FeetTogether_BackFootForward
    dw Instruction_Common_Sleep


;;; $DC57: Instruction list - facing right - walking ;;;
InstList_Alcoon_FacingRight_Walking_0:
    dw Instruction_Alcoon_MoveHorizontally_TurnIfWallCollision

InstList_Alcoon_FacingRight_Walking_1:
    dw $000A,Spritemap_Alcoon_FacingRight_FrontFootFoward
    dw Instruction_Alcoon_MoveHorizontally_TurnIfWallCollision
    dw $000A,Spritemap_Alcoon_FacingRight_FeetTogether_FrontFootBack
    dw Instruction_Alcoon_MoveHorizontally_TurnIfWallCollision
    dw $000A,Spritemap_Alcoon_FacingRight_FrontFootBack
    dw Instruction_Alcoon_DecrementStepCounter_MoveHorizontally
    dw $000A,Spritemap_Alcoon_FacingRight_FrontFootUp
    dw Instruction_Common_GotoY
    dw InstList_Alcoon_FacingRight_Walking_0


;;; $DC73: Instruction list - facing right - spawn fireballs ;;;
InstList_Alcoon_FacingRight_SpawnFireballs:
    dw $0014,Spritemap_Alcoon_FaceRight_WingFullyExtended_BackFootForward
    dw $0009,Spritemap_Alcoon_FaceRight_WingMovingForward_MouthEnlarging
    dw $0010,Spritemap_Alcoon_FacingRight_WingForward_AboutToSpit
    dw $0003,Spritemap_Alcoon_FaceRight_WingMovingForward_MouthEnlarging
    dw Instruction_Alcoon_SpawnAlcoonFireballHorizontally
    dw $000A,Spritemap_Alcoon_FacingRight_WingExtended_MouthJustSpit
    dw $000A,Spritemap_Alcoon_FaceRight_WingFullyExtended_BackFootForward
    dw $0009,Spritemap_Alcoon_FaceRight_WingMovingForward_MouthEnlarging
    dw $0010,Spritemap_Alcoon_FacingRight_WingForward_AboutToSpit
    dw $0003,Spritemap_Alcoon_FaceRight_WingMovingForward_MouthEnlarging
    dw Instruction_Alcoon_SpawnAlcoonFireballUpward
    dw $000A,Spritemap_Alcoon_FacingRight_WingExtended_MouthJustSpit
    dw $000A,Spritemap_Alcoon_FaceRight_WingFullyExtended_BackFootForward
    dw $0009,Spritemap_Alcoon_FaceRight_WingMovingForward_MouthEnlarging
    dw $0010,Spritemap_Alcoon_FacingRight_WingForward_AboutToSpit
    dw $0003,Spritemap_Alcoon_FaceRight_WingMovingForward_MouthEnlarging
    dw Instruction_Alcoon_SpawnAlcoonFireballDownward
    dw $0028,Spritemap_Alcoon_FacingRight_WingExtended_MouthJustSpit
    dw Instruction_Alcoon_StartWalking
    dw $0001,Spritemap_Alcoon_FacingRight_WingExtended_MouthJustSpit


;;; $DCBB: Instruction list - facing right - airborne - looking up ;;;
InstList_Alcoon_FacingRight_Airborne_LookingUp:
    dw $7FFF,Spritemap_Alcoon_FacingRight_LookingUp
    dw Instruction_Common_Sleep


;;; $DCC1: Instruction list - facing right - airborne - looking forward ;;;
InstList_Alcoon_FacingRight_Airborne_LookingForward:
    dw $7FFF,Spritemap_Alcoon_FacingRight_FrontFootUp
    dw Instruction_Common_Sleep


;;; $DCC7: Alcoon constants ;;;
AlcoonConstants_XThresholdToEmerge:
    dw $0050

if !FEATURE_KEEP_UNREFERENCED
UNUSED_AlcoonConstants_A8DCC9:
    dw $0040
endif ; !FEATURE_KEEP_UNREFERENCED

AlcoonConstants_XThresholdToHide:
    dw $0070


;;; $DCCD: Initialisation AI - enemy $E9BF (alcoon) ;;;
InitAI_Alcoon:
    LDX.W EnemyIndex
    LDA.W #$0000 : STA.L Alcoon.stepCounter,X
    LDA.W Enemy.YPosition,X : STA.W Alcoon.spawnYPosition,X
    LDA.W Enemy.XPosition,X : STA.L Alcoon.spawnXPosition,X
    LDA.W Enemy.properties,X : ORA.W #$2000 : STA.W Enemy.properties,X
    LDA.W #InstList_Alcoon_FacingLeft_Walking_0 : STA.W Enemy.instList,X
    LDA.W #Function_Alcoon_WaitForSamusToGetNear : STA.W Alcoon.function,X
    JSR SetupAlcoonJumpMovement

  .loopRising:
    LDA.W Alcoon.YSubVelocity,X : CLC : ADC.W Enemy.YSubPosition,X : STA.W Enemy.YSubPosition,X
    LDA.W Alcoon.YVelocity,X : ADC.W Enemy.YPosition,X : STA.W Enemy.YPosition,X
    JSR AlcoonYAcceleration
    BMI .loopRising

  .loopFalling:
    LDA.W Alcoon.YSubVelocity,X : STA.B DP_Temp12
    LDA.W Alcoon.YVelocity,X : STA.B DP_Temp14
    JSL MoveEnemyDownBy_14_12
    BCS .collidedWithBlock
    JSR AlcoonYAcceleration
    BRA .loopFalling

  .collidedWithBlock:
    LDA.W Enemy.YPosition,X : STA.L Alcoon.landingYPosition,X
    LDA.W Alcoon.spawnYPosition,X : STA.W Enemy.YPosition,X
    RTL


;;; $DD37: Set up jump movement ;;;
SetupAlcoonJumpMovement:
    LDA.W #$FFF4 : STA.W Alcoon.YVelocity,X
    LDA.W #$0000 : STA.W Alcoon.YSubVelocity,X : STA.W Alcoon.XVelocity,X
    STA.W Enemy.var4,X : STA.L Alcoon.YAcceleration,X
    LDA.W #$8000 : STA.L Alcoon.YSubAcceleration,X
    RTS


;;; $DD55: Alcoon Y acceleration ;;;
AlcoonYAcceleration:
    LDA.W Alcoon.YSubVelocity,X : CLC : ADC.L Alcoon.YSubAcceleration,X : STA.W Alcoon.YSubVelocity,X
    LDA.W Alcoon.YVelocity,X : ADC.L Alcoon.YAcceleration,X : STA.W Alcoon.YVelocity,X
    RTS


;;; $DD6B: Main AI - enemy $E9BF (alcoon) ;;;
MainAI_Alcoon:
    LDX.W EnemyIndex
    JMP.W (Alcoon.function,X)


;;; $DD71: Alcoon function - wait for Samus to get near ;;;
Function_Alcoon_WaitForSamusToGetNear:
    LDA.L Alcoon.landingYPosition,X : SEC : SBC.W SamusYPosition : BPL .SamusBelowSpawn
    EOR.W #$FFFF : INC

  .SamusBelowSpawn:
    CMP.W #$0020 : BPL .return
    LDA.W SamusXPosition : SEC : SBC.W Enemy.XPosition,X
    PHP
    BPL +
    EOR.W #$FFFF : INC

+   CMP.W AlcoonConstants_XThresholdToEmerge : BPL .returnPLP
    JSR SetupAlcoonJumpMovement
    LDY.W #InstList_Alcoon_FacingLeft_Airborne_LookingUp
    LDA.W #$FFFE
    PLP
    BMI .SamusToTheRight
    LDY.W #InstList_Alcoon_FacingRight_Airborne_LookingUp
    LDA.W #$0002

  .SamusToTheRight:
    STA.W Alcoon.XVelocity,X
    TYA : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #Function_Alcoon_Emerging_Rising : STA.W Alcoon.function,X
    LDA.W #$005E
    JSL QueueSound_Lib2_Max6

  .return:
    RTL

  .returnPLP:
    PLP
    RTL


;;; $DDC6: Alcoon function - emerging - rising ;;;
Function_Alcoon_Emerging_Rising:
    LDA.W Alcoon.YSubVelocity,X : CLC : ADC.W Enemy.YSubPosition,X : STA.W Enemy.YSubPosition,X
    LDA.W Alcoon.YVelocity,X : ADC.W Enemy.YPosition,X : STA.W Enemy.YPosition,X
    JSR AlcoonYAcceleration
    BMI .return

  .falling:
    LDA.W #Function_Alcoon_Emerging_Falling : STA.W Alcoon.function,X
    LDY.W #InstList_Alcoon_FacingLeft_Airborne_LookingForward
    LDA.W Alcoon.XVelocity,X : BMI .keepLeft
    LDY.W #InstList_Alcoon_FacingRight_Airborne_LookingForward

  .keepLeft:
    TYA : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X

  .return:
    RTL

; Nothing points here, dead code
    LDA.W #$0000 : STA.W Alcoon.YVelocity,X : STA.W Alcoon.YSubVelocity,X
    BRA .falling


;;; $DE05: Alcoon function - emerging - falling ;;;
Function_Alcoon_Emerging_Falling:
    LDA.W Alcoon.YSubVelocity,X : STA.B DP_Temp12
    LDA.W Alcoon.YVelocity,X : STA.B DP_Temp14
    JSL MoveEnemyDownBy_14_12
    BCS .collidedWithBlock
    JSR AlcoonYAcceleration
    RTL

  .collidedWithBlock:
    LDA.W SamusXPosition : SEC : SBC.W Enemy.XPosition,X
    PHP
    LDY.W #InstList_Alcoon_FacingLeft_Walking_0
    LDA.W #$FFFE
    PLP
    BMI .directionChosen
    LDA.W #$0002
    LDY.W #InstList_Alcoon_FacingRight_Walking_0

  .directionChosen:
    STA.W Alcoon.XVelocity,X
    TYA : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #Function_Alcoon_MoveHorizontally_SpitFireballsAtSamus : STA.W Alcoon.function,X
    LDA.W #$0001 : STA.L Alcoon.stepCounter,X ; >.<
    RTL


;;; $DE4B: Alcoon function - emerged ;;;
Function_Alcoon_MoveHorizontally_SpitFireballsAtSamus:
    STZ.B DP_Temp12
    LDA.W #$0002 : STA.B DP_Temp14
    JSL MoveEnemyDownBy_14_12
    LDA.L Alcoon.spawnXPosition,X : SEC : SBC.W Enemy.XPosition,X : BPL +
    EOR.W #$FFFF : INC

+   CMP.W AlcoonConstants_XThresholdToHide : BPL .farAway
    LDA.W SamusXPosition : SEC : SBC.W Enemy.XPosition,X
    PHP
    BPL +
    EOR.W #$FFFF : INC

+   LDA.L Alcoon.stepCounter,X : BNE .returnPLP
    PLP
    BMI .facingLeft
    LDY.W #InstList_Alcoon_FacingRight_SpawnFireballs
    LDA.W Alcoon.XVelocity,X : BPL .fireballs
    RTL

  .returnPLP:
    PLP
    RTL

  .facingLeft:
    LDY.W #InstList_Alcoon_FacingLeft_SpawnFireballs
    LDA.W Alcoon.XVelocity,X : BPL .return

  .fireballs:
    TYA : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #RTL_A8DECC : STA.W Alcoon.function,X

  .return:
    RTL

  .farAway:
    LDA.W #Function_Alcoon_Hiding_Rising : STA.W Alcoon.function,X
    LDA.W #$FFFC : STA.W Alcoon.YVelocity,X
    LDA.W #$0000 : STA.W Alcoon.YSubVelocity,X
    LDY.W #InstList_Alcoon_FacingLeft_Airborne_LookingForward
    LDA.W Alcoon.XVelocity,X : BMI +
    LDY.W #InstList_Alcoon_FacingRight_Airborne_LookingForward

+   TYA : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    RTL


;;; $DECC: RTL ;;;
RTL_A8DECC:
    RTL


;;; $DECD: Alcoon function - hiding - rising ;;;
Function_Alcoon_Hiding_Rising:
    LDA.W Alcoon.YSubVelocity,X : CLC : ADC.W Enemy.YSubPosition,X : STA.W Enemy.YSubPosition,X
    LDA.W Alcoon.YVelocity,X : ADC.W Enemy.YPosition,X : STA.W Enemy.YPosition,X
    JSR AlcoonYAcceleration
    BMI .return
    LDA.W #Function_Alcoon_Hiding_Falling : STA.W Alcoon.function,X

  .return:
    RTL


;;; $DEEC: Alcoon function - hiding - falling ;;;
Function_Alcoon_Hiding_Falling:
    LDA.W Alcoon.YSubVelocity,X : CLC : ADC.W Enemy.YSubPosition,X : STA.W Enemy.YSubPosition,X
    LDA.W Alcoon.YVelocity,X : ADC.W Enemy.YPosition,X : STA.W Enemy.YPosition,X
    CMP.W Alcoon.spawnYPosition,X : BPL .reachedTargetY
    JSR AlcoonYAcceleration
    RTL

  .reachedTargetY:
    LDA.W Alcoon.spawnYPosition,X : STA.W Enemy.YPosition,X
    LDA.L Alcoon.spawnXPosition,X : STA.W Enemy.XPosition,X
    LDA.W #Function_Alcoon_WaitForSamusToGetNear : STA.W Alcoon.function,X
    RTL


;;; $DF1C: Instruction - spawn alcoon fireball with Y velocity index 0 ;;;
Instruction_Alcoon_SpawnAlcoonFireballUpward:
    PHY
    LDA.W #$0000
; fallthrough to Instruction_Alcoon_SpawnAlcoonFireballUpward_loop


;;; $DF20: Spawn alcoon fireball with Y velocity index [A] ;;;
Instruction_Alcoon_SpawnAlcoonFireballUpward_loop:
;; Parameters:
;;     A: Y velocity index

; Expects a pushed Y
    LDY.W #EnemyProjectile_AlcoonFireball
    LDX.W EnemyIndex
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    LDA.W #$003F
    JSL QueueSound_Lib2_Max6
    PLY
    RTL


;;; $DF33: Instruction - spawn alcoon fireball with Y velocity index 2 ;;;
Instruction_Alcoon_SpawnAlcoonFireballHorizontally:
    PHY
    LDA.W #$0002
    BRA Instruction_Alcoon_SpawnAlcoonFireballUpward_loop


;;; $DF39: Instruction - spawn alcoon fireball with Y velocity index 4 ;;;
Instruction_Alcoon_SpawnAlcoonFireballDownward:
    PHY
    LDA.W #$0004
    BRA Instruction_Alcoon_SpawnAlcoonFireballUpward_loop


;;; $DF3F: Instruction - start walking ;;;
Instruction_Alcoon_StartWalking:
    LDX.W EnemyIndex
    LDA.W #Function_Alcoon_MoveHorizontally_SpitFireballsAtSamus : STA.W Alcoon.function,X
    LDA.W RandomNumberSeed : AND.W #$0003 : BNE +
    LDA.W #$0002

+   STA.L Alcoon.stepCounter,X
    LDY.W #InstList_Alcoon_FacingLeft_Walking_0
    LDA.W Alcoon.XVelocity,X : BMI .return
    LDY.W #InstList_Alcoon_FacingRight_Walking_0

  .return:
    RTL


;;; $DF63: Instruction - decrement step counter and move horizontally ;;;
Instruction_Alcoon_DecrementStepCounter_MoveHorizontally:
    LDX.W EnemyIndex
    LDA.L Alcoon.stepCounter,X : BEQ Instruction_Alcoon_MoveHorizontally_TurnIfWallCollision
    DEC : STA.L Alcoon.stepCounter,X
; fallthrough to Instruction_Alcoon_MoveHorizontally_TurnIfWallCollision


;;; $DF71: Instruction - move horizontally ;;;
Instruction_Alcoon_MoveHorizontally_TurnIfWallCollision:
    PHY
    LDX.W EnemyIndex
    STZ.B DP_Temp12
    LDA.W Alcoon.XVelocity,X : STA.B DP_Temp14
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCS .turnAround
    JSL AlignEnemyYPositionWIthNonSquareSlope
    PLY
    RTL

  .turnAround:
    PLY
    LDY.W #InstList_Alcoon_FacingLeft_Walking_1
    LDA.W Alcoon.XVelocity,X : BPL .directionChosen
    LDY.W #InstList_Alcoon_FacingRight_Walking_1

  .directionChosen:
    EOR.W #$FFFF : INC : STA.W Alcoon.XVelocity,X
    RTL


;;; $DF9C: RTL ;;;
RTL_A8DF9C:
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $DF9D: Unused. Normal enemy shot AI ;;;
UNUSED_NormalEnemyShotAI_A8DF9D:
    JSL NormalEnemyShotAI
    RTL
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $DFA2: Alcoon spritemaps ;;;
Spritemap_Alcoon_FacingLeft_FrontFootForward:
    dw $0006
    %spritemapEntry(1, $1FD, $F3, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $04, $FC, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10A)
    %spritemapEntry(1, $1F8, $08, 0, 0, 2, 0, $102)
    %spritemapEntry(0, $1ED, $F0, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $1F5, $E8, 0, 0, 2, 0, $100)

Spritemap_Alcoon_FacingLeft_FeetTogether_FrontFootDown:
    dw $0006
    %spritemapEntry(1, $04, $FB, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1FD, $F2, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1F8, $07, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1F8, $F7, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $1EE, $EF, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $1F6, $E7, 0, 0, 2, 0, $100)

Spritemap_Alcoon_FacingLeft_FrontFootBack:
    dw $0007
    %spritemapEntry(0, $1FD, $FB, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1FD, $F3, 0, 0, 2, 0, $13C)
    %spritemapEntry(1, $04, $FC, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1F8, $08, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $1EF, $F0, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $1F7, $E8, 0, 0, 2, 0, $100)

Spritemap_Alcoon_FacingLeft_FeetTogether_BackFootForward:
    dw $0006
    %spritemapEntry(1, $04, $FB, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1FD, $F2, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1F8, $07, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $1F8, $F7, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $1EE, $EF, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $1F6, $E7, 0, 0, 2, 0, $100)

Spritemap_Alcoon_FacingLeft_WingFullyExtended_BackFootFoward:
    dw $0006
    %spritemapEntry(1, $1FD, $F3, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $04, $FC, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $08, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $1EE, $F0, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $1F6, $E8, 0, 0, 2, 0, $100)

Spritemap_Alcoon_FacingLeft_WingMovingForward_MouthEnlarging:
    dw $0007
    %spritemapEntry(1, $1FE, $F3, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $05, $FC, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1F7, $F0, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F8, $08, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1F9, $F8, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $1F0, $F0, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $1F7, $E8, 0, 0, 2, 0, $100)

Spritemap_Alcoon_FacingLeft_WingForward_AboutToSpit:
    dw $0009
    %spritemapEntry(0, $00, $F0, 0, 0, 2, 0, $13B)
    %spritemapEntry(0, $1FE, $FB, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1FE, $F3, 0, 0, 2, 0, $13C)
    %spritemapEntry(1, $05, $FC, 0, 0, 2, 0, $120)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 2, 0, $12F)
    %spritemapEntry(1, $1F8, $08, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1F9, $F8, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $1F2, $F0, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $1F8, $E8, 0, 0, 2, 0, $100)

Spritemap_Alcoon_FacingLeft_WingExtended_MouthJustSpit:
    dw $0006
    %spritemapEntry(1, $1FD, $F3, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $04, $FC, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $1EE, $F0, 0, 0, 2, 0, $12B)
    %spritemapEntry(1, $1F8, $08, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10A)
    %spritemapEntry(1, $1F6, $E8, 0, 0, 2, 0, $100)

Spritemap_Alcoon_FacingLeft_LookingUp:
    dw $0006
    %spritemapEntry(1, $1FD, $F3, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $1FA, $E4, 0, 1, 2, 0, $13A)
    %spritemapEntry(1, $1FA, $EC, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $04, $FC, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1F8, $08, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10A)

Spritemap_Alcoon_FacingRight_FrontFootFoward:
    dw $0006
    %spritemapEntry(1, $1F3, $F3, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $1EC, $FC, 0, 1, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $10A)
    %spritemapEntry(1, $1F8, $08, 0, 1, 2, 0, $102)
    %spritemapEntry(0, $0B, $F0, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $1FB, $E8, 0, 1, 2, 0, $100)

Spritemap_Alcoon_FacingRight_FeetTogether_FrontFootBack:
    dw $0006
    %spritemapEntry(1, $1EC, $FB, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $1F3, $F2, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $1F8, $07, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $1F8, $F7, 0, 1, 2, 0, $10A)
    %spritemapEntry(0, $0A, $EF, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $1FA, $E7, 0, 1, 2, 0, $100)

Spritemap_Alcoon_FacingRight_FrontFootBack:
    dw $0007
    %spritemapEntry(0, $1FB, $FB, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $1FB, $F3, 0, 1, 2, 0, $13C)
    %spritemapEntry(1, $1EC, $FC, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $1F8, $08, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $10A)
    %spritemapEntry(0, $09, $F0, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $1F9, $E8, 0, 1, 2, 0, $100)

Spritemap_Alcoon_FacingRight_FrontFootUp:
    dw $0006
    %spritemapEntry(1, $1EC, $FB, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $1F3, $F2, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $1F8, $07, 0, 1, 2, 0, $108)
    %spritemapEntry(1, $1F8, $F7, 0, 1, 2, 0, $10A)
    %spritemapEntry(0, $0A, $EF, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $1FA, $E7, 0, 1, 2, 0, $100)

Spritemap_Alcoon_FaceRight_WingFullyExtended_BackFootForward:
    dw $0006
    %spritemapEntry(1, $1F3, $F3, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $1EC, $FC, 0, 1, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $08, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $10A)
    %spritemapEntry(0, $0A, $F0, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $1FA, $E8, 0, 1, 2, 0, $100)

Spritemap_Alcoon_FaceRight_WingMovingForward_MouthEnlarging:
    dw $0007
    %spritemapEntry(1, $1F2, $F3, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $1EB, $FC, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $01, $F0, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $1F8, $08, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $1F7, $F8, 0, 1, 2, 0, $10A)
    %spritemapEntry(0, $08, $F0, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $1F9, $E8, 0, 1, 2, 0, $100)

Spritemap_Alcoon_FacingRight_WingForward_AboutToSpit:
    dw $0009
    %spritemapEntry(0, $1F8, $F0, 0, 1, 2, 0, $13B)
    %spritemapEntry(0, $1FA, $FB, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $1FA, $F3, 0, 1, 2, 0, $13C)
    %spritemapEntry(1, $1EB, $FC, 0, 1, 2, 0, $120)
    %spritemapEntry(0, $00, $F0, 0, 1, 2, 0, $12F)
    %spritemapEntry(1, $1F8, $08, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $1F7, $F8, 0, 1, 2, 0, $10A)
    %spritemapEntry(0, $06, $F0, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $1F8, $E8, 0, 1, 2, 0, $100)

Spritemap_Alcoon_FacingRight_WingExtended_MouthJustSpit:
    dw $0006
    %spritemapEntry(1, $1F3, $F3, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $1EC, $FC, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $0A, $F0, 0, 1, 2, 0, $12B)
    %spritemapEntry(1, $1F8, $08, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $10A)
    %spritemapEntry(1, $1FA, $E8, 0, 1, 2, 0, $100)

Spritemap_Alcoon_FacingRight_LookingUp:
    dw $0006
    %spritemapEntry(1, $1F3, $F3, 0, 1, 2, 0, $124)
    %spritemapEntry(0, $1FE, $E4, 0, 0, 2, 0, $13A)
    %spritemapEntry(1, $1F6, $EC, 0, 1, 2, 0, $128)
    %spritemapEntry(1, $1EC, $FC, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $1F8, $08, 0, 1, 2, 0, $108)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $10A)

; Unused. X flipped version of the alcoon fireball enemy projectile
if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Alcoon_FireballProjectile_0_A8E214:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 0, $12C)

UNUSED_Spritemap_Alcoon_FireballProjectile_1_A8E21B:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 1, 2, 0, $12D)

UNUSED_Spritemap_Alcoon_FireballProjectile_2_A8E222:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 0, 2, 0, $12C)

UNUSED_Spritemap_Alcoon_FireballProjectile_3_A8E229:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $12D)
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $E230: Palette - enemy $E9FF (atomic) ;;;
Palette_Atomic:
    dw $3800,$7FFF,$56E0,$3180,$18C0,$6BC0,$5EC0,$4A20
    dw $35A0,$7FFF,$039C,$0237,$00D1,$03FF,$0237,$00D1


if !FEATURE_KEEP_UNREFERENCED
;;; $E250: Palettes - atomic ;;;
UNUSED_Palettes_Atomic_A8E250:
    dw $3800,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $3800,$7FFF,$6A40,$44E0,$2C20,$7F20,$7220,$5D80
    dw $4900,$03FF,$001F,$0016,$000E,$03FF,$0237,$00D1
    dw $3800,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166
    dw $0924,$435A,$3694,$15AD,$0508,$03FF,$0237,$00D1
    dw $3800,$7FFF,$6A40,$44E0,$2C20,$7F20,$7220,$5D80
    dw $4900,$7FFF,$039C,$0237,$00D1,$03FF,$0237,$00D1
    dw $3800,$02FF,$01BF,$000F,$0008,$01BF,$011B,$00BA
    dw $0011,$7FFF,$039C,$0237,$00D1,$03FF,$0237,$00D1
    dw $3800,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $E310: Instruction list - spinning up-right ;;;
InstList_Atomic_SpinningUpRight:
    dw $0008,Spritemap_Atomic_0
    dw $0008,Spritemap_Atomic_1
    dw $0008,Spritemap_Atomic_2
    dw $0008,Spritemap_Atomic_3
    dw $0008,Spritemap_Atomic_4
    dw $0008,Spritemap_Atomic_5
    dw Instruction_Common_GotoY
    dw InstList_Atomic_SpinningUpRight


;;; $E32C: Instruction list - spinning up-left ;;;
InstList_Atomic_SpinningUpLeft:
    dw $0008,Spritemap_Atomic_6
    dw $0008,Spritemap_Atomic_7
    dw $0008,Spritemap_Atomic_8
    dw $0008,Spritemap_Atomic_9
    dw $0008,Spritemap_Atomic_A
    dw $0008,Spritemap_Atomic_B
    dw Instruction_Common_GotoY
    dw InstList_Atomic_SpinningUpLeft


;;; $E348: Instruction list - spinning down-left ;;;
InstList_Atomic_SpinningDownLeft:
    dw $0008,Spritemap_Atomic_5
    dw $0008,Spritemap_Atomic_4
    dw $0008,Spritemap_Atomic_3
    dw $0008,Spritemap_Atomic_2
    dw $0008,Spritemap_Atomic_1
    dw $0008,Spritemap_Atomic_0
    dw Instruction_Common_GotoY
    dw InstList_Atomic_SpinningDownLeft


;;; $E364: Instruction list - spinning down-right ;;;
InstList_Atomic_SpinningDownRight:
    dw $0008,Spritemap_Atomic_B
    dw $0008,Spritemap_Atomic_A
    dw $0008,Spritemap_Atomic_9
    dw $0008,Spritemap_Atomic_8
    dw $0008,Spritemap_Atomic_7
    dw $0008,Spritemap_Atomic_6
    dw Instruction_Common_GotoY
    dw InstList_Atomic_SpinningDownRight


;;; $E380: Atomic instruction list pointers ;;;
AtomicInstListPointers:
; Indexed by [enemy parameter 1] * 2
    dw InstList_Atomic_SpinningUpRight
    dw InstList_Atomic_SpinningUpLeft
    dw InstList_Atomic_SpinningDownLeft
    dw InstList_Atomic_SpinningDownRight


;;; $E388: Initialisation AI - enemy $E9FF (atomic) ;;;
InitAI_Atomic:
    LDX.W EnemyIndex
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.W Enemy.init0,X : ASL : TAY
    LDA.W AtomicInstListPointers,Y : STA.W Enemy.instList,X
    LDA.W Enemy.init1,X : ASL #3 : TAY
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,Y : STA.L Atomic.speed,X
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,Y : STA.L Atomic.subSpeed,X
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+4,Y : STA.L Atomic.negativeSpeed,X
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+6,Y : STA.L Atomic.negativeSubSpeed,X
    RTL


;;; $E3C3: Main AI - enemy $E9FF (atomic) ;;;
MainAI_Atomic:
    LDX.W EnemyIndex
    JSR ChooseAtomicYMovementFunction
    JSR ChooseAtomicXMovementFunction
    LDX.W EnemyIndex
    JSR.W (Atomic.XMovementFunction,X)
    LDX.W EnemyIndex
    JSR.W (Atomic.YMovementFunction,X)
    RTL


;;; $E3D9: Set atomic Y movement function ;;;
ChooseAtomicYMovementFunction:
    LDX.W EnemyIndex
    LDA.W #Function_Atomic_MoveUp : STA.W Atomic.XMovementFunction,X
    JSL Get_SamusY_minus_EnemyY
    BMI .return
    LDA.W #Function_Atomic_MoveDown : STA.W Atomic.XMovementFunction,X

  .return:
    RTS


;;; $E3EF: Set atomic X movement function ;;;
ChooseAtomicXMovementFunction:
    LDX.W EnemyIndex
    LDA.W #Function_Atomic_MoveLeft : STA.W Atomic.YMovementFunction,X
    JSL Get_SamusX_minus_EnemyX
    BMI .return
    LDA.W #Function_Atomic_MoveRight : STA.W Atomic.YMovementFunction,X

  .return:
    RTS


;;; $E405: Atomic Y movement function - move up ;;;
Function_Atomic_MoveUp:
    LDX.W EnemyIndex
    LDA.W Enemy.YPosition,X : CLC : ADC.L Atomic.negativeSpeed,X : STA.W Enemy.YPosition,X
    LDA.W Enemy.YSubPosition,X : CLC : ADC.L Atomic.negativeSubSpeed,X : BCC .done
    INC.W Enemy.YPosition,X

  .done:
    STA.W Enemy.YSubPosition,X
    RTS


;;; $E424: Atomic Y movement function - move down ;;;
Function_Atomic_MoveDown:
    LDX.W EnemyIndex
    LDA.W Enemy.YPosition,X : CLC : ADC.L Atomic.speed,X : STA.W Enemy.YPosition,X
    LDA.W Enemy.YSubPosition,X : CLC : ADC.L Atomic.subSpeed,X : BCC .done
    INC.W Enemy.YPosition,X

  .done:
    STA.W Enemy.YSubPosition,X
    RTS


;;; $E443: Atomic X movement function - move left ;;;
Function_Atomic_MoveLeft:
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : CLC : ADC.L Atomic.negativeSpeed,X : STA.W Enemy.XPosition,X
    LDA.W Enemy.XSubPosition,X : CLC : ADC.L Atomic.negativeSubSpeed,X : BCC .done
    INC.W Enemy.XPosition,X

  .done:
    STA.W Enemy.XSubPosition,X
    RTS


;;; $E462: Atomic X movement function - move right ;;;
Function_Atomic_MoveRight:
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : CLC : ADC.L Atomic.speed,X : STA.W Enemy.XPosition,X
    LDA.W Enemy.XSubPosition,X : CLC : ADC.L Atomic.subSpeed,X : BCC .done
    INC.W Enemy.XPosition,X

  .done:
    STA.W Enemy.XSubPosition,X
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $E481: Unused. RTL ;;;
UNUSED_Atomic_GetEnemyIndex_A8E481:
    LDX.W EnemyIndex
    RTL


;;; $E485: Unused. RTL ;;;
UNUSED_Atomic_GetEnemyIndex_A8E485:
    LDX.W EnemyIndex
    RTL
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $E489: Spritemaps - atomic ;;;
Spritemap_Atomic_0:
    dw $0004
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 0, $103)
    %spritemapEntry(0, $04, $FC, 0, 0, 2, 0, $103)

Spritemap_Atomic_1:
    dw $0004
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $103)
    %spritemapEntry(0, $00, $00, 0, 0, 2, 0, $103)

Spritemap_Atomic_2:
    dw $0004
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 0, $103)
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 0, $103)

Spritemap_Atomic_3:
    dw $0004
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 0, $102)
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $01, $F7, 0, 0, 2, 0, $103)

Spritemap_Atomic_4:
    dw $0003
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $102)
    %spritemapEntry(0, $00, $00, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $100)

Spritemap_Atomic_5:
    dw $0004
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 0, $102)
    %spritemapEntry(0, $04, $FC, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $1F7, $01, 0, 0, 2, 0, $103)

Spritemap_Atomic_6:
    dw $0004
    %spritemapEntry(0, $00, $00, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 0, $103)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 0, $103)

Spritemap_Atomic_7:
    dw $0004
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $103)
    %spritemapEntry(0, $1F8, $00, 0, 1, 2, 0, $103)

Spritemap_Atomic_8:
    dw $0004
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $04, $FC, 0, 0, 2, 0, $103)
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 0, $103)

Spritemap_Atomic_9:
    dw $0004
    %spritemapEntry(0, $04, $FC, 0, 0, 2, 0, $102)
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $1F7, $F7, 0, 0, 2, 0, $103)

Spritemap_Atomic_A:
    dw $0003
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $102)
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $100)

Spritemap_Atomic_B:
    dw $0004
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 0, $102)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $01, $01, 0, 0, 2, 0, $103)


;;; $E587: Palette - enemy $EA3F (Wrecked Ship spark) ;;;
Palette_Spark:
    dw $3800,$7FFF,$3BE0,$2680,$1580,$6BFA,$4BF2,$2BEA
    dw $03E0,$0000,$0000,$0000,$0000,$0000,$0000,$0000


;;; $E5A7: Instruction list - activate ;;;
InstList_Spark_FlickerOn:
    dw Instruction_Spark_SetAsTangible
    dw $0001,Spritemap_Spark_Flickering_0
    dw $0002,Spritemap_Common_Nothing
    dw $0001,Spritemap_Spark_Flickering_0
    dw $0002,Spritemap_Common_Nothing
    dw $0001,Spritemap_Spark_Flickering_1
    dw $0002,Spritemap_Common_Nothing
    dw $0001,Spritemap_Spark_Flickering_1
    dw $0001,Spritemap_Common_Nothing
    dw $0002,Spritemap_Spark_Flickering_2
    dw $0002,Spritemap_Spark_Flickering_3


;;; $E5D1: Instruction list - active ;;;
InstList_Spark_Constant:
    dw $0003,Spritemap_Spark_Constant_0
    dw $0003,Spritemap_Spark_Constant_1
    dw $0003,Spritemap_Spark_Constant_2
    dw $0003,Spritemap_Spark_Constant_3
    dw Instruction_Common_GotoY
    dw InstList_Spark_Constant


;;; $E5E5: Instruction list - deactivate ;;;
InstList_Spark_FlickerOut:
    dw $0001,Spritemap_Spark_Flickering_0
    dw $0001,Spritemap_Spark_Flickering_0
    dw $0001,Spritemap_Spark_Flickering_1
    dw $0001,Spritemap_Spark_Flickering_1
    dw $0001,Spritemap_Spark_Flickering_2
    dw $0001,Spritemap_Common_Nothing
    dw $0001,Spritemap_Spark_Flickering_2
    dw $0001,Spritemap_Common_Nothing
    dw Instruction_Spark_SetAsIntangible
    dw Instruction_Common_Sleep


;;; $E609: Instruction list - emit falling sparks ;;;
InstList_Spark_EmitFallingSparks:
    dw $0003,Spritemap_Spark_Flickering_0
    dw $0003,Spritemap_Spark_Flickering_1
    dw $0003,Spritemap_Spark_Flickering_2
    dw $0003,Spritemap_Spark_Flickering_3
    dw Instruction_Common_GotoY
    dw InstList_Spark_EmitFallingSparks


;;; $E61D: Instruction - set enemy as intangible ;;;
Instruction_Spark_SetAsIntangible:
    LDX.W EnemyIndex
    LDA.W Enemy.properties,X : ORA.W #$0400 : STA.W Enemy.properties,X
    RTL


;;; $E62A: Instruction - set enemy as tangible ;;;
Instruction_Spark_SetAsTangible:
    LDX.W EnemyIndex
    LDA.W Enemy.properties,X : AND.W #$FBFF : STA.W Enemy.properties,X
    RTL


;;; $E637: Initialisation AI - enemy $EA3F (Wrecked Ship spark) ;;;
InitAI_Spark:
    LDX.W EnemyIndex
    LDA.W Enemy.init0,X : AND.W #$0003 : ASL : TAY
    LDA.W .functionPointers,Y : STA.W Spark.function,X
    LDA.W Enemy.init1,X : STA.W Spark.baseFunctionTime,X
    STZ.B DP_Temp12
    JSR SetSparkFunctionTimer
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W .instListPointers,Y : STA.W Enemy.instList,X
    STZ.W Enemy.loopCounter,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDX.W AreaIndex
    LDA.L SRAMMirror_Boss,X : AND.W #$0001 : BEQ .PhantoonAlive
    RTL

  .PhantoonAlive:
    LDX.W EnemyIndex
    LDA.W Enemy.properties,X : ORA.W $0100 : STA.W Enemy.properties,X ; >_<
    RTL

  .instListPointers:
    dw InstList_Spark_Constant
    dw InstList_Spark_Constant
    dw InstList_Spark_EmitFallingSparks

  .functionPointers:
    dw RTL_A8E694
    dw Function_Spark_Intermittent_Active
    dw Function_Spark_EmitFallingSparks


;;; $E68E: Main AI - enemy $EA3F (Wrecked Ship spark) ;;;
MainAI_Spark:
    LDX.W EnemyIndex
    JMP.W (Spark.function,X)


;;; $E694: RTL. Wrecked Ship spark function - always active ;;;
RTL_A8E694:
    RTL


;;; $E695: Wrecked Ship spark function - intermittent - inactive ;;;
Function_Spark_Intermittent_Inactive:
    LDA.W Spark.functionTimer,X : DEC : BEQ .timerExpired
    STA.W Spark.functionTimer,X
    RTL

  .timerExpired:
    LDA.W #Function_Spark_Intermittent_Active : STA.W Spark.function,X
    LDA.W #InstList_Spark_FlickerOn : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.B DP_Temp12
    JSR SetSparkFunctionTimer
    RTL


;;; $E6B7: Wrecked Ship spark function - intermittent - active ;;;
Function_Spark_Intermittent_Active:
    LDA.W Spark.functionTimer,X : DEC : BEQ .timerExpired
    STA.W Spark.functionTimer,X
    RTL

  .timerExpired:
    LDA.W #Function_Spark_Intermittent_Inactive : STA.W Spark.function,X
    LDA.W #InstList_Spark_FlickerOut : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #$0008 : STA.B DP_Temp12
    JSR SetSparkFunctionTimer
    RTL


;;; $E6DC: Wrecked Ship spark function - emit falling sparks ;;;
Function_Spark_EmitFallingSparks:
    LDA.W Spark.functionTimer,X : DEC : BEQ .timerExpired
    STA.W Spark.functionTimer,X
    RTL

  .timerExpired:
    LDX.W EnemyIndex
    LDY.W #EnemyProjectile_FallingSpark
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    STZ.B DP_Temp12
    JSR SetSparkFunctionTimer
    RTL


;;; $E6F6: Set Wrecked Ship spark function timer ;;;
SetSparkFunctionTimer:
;; Parameters:
;;     $12: Additional function time
    LDA.W Spark.baseFunctionTime,X : BPL .noRNG
    JSL GenerateRandomNumber
    AND.W #$003F : CLC : ADC.W #$0004

  .noRNG:
    CLC : ADC.B DP_Temp12 : STA.W Spark.functionTimer,X
    RTS


;;; $E70D: RTL ;;;
RTL_A8E70D:
    RTL


;;; $E70E: Enemy shot - enemy $EA3F (Wrecked Ship spark) ;;;
EnemyShot_Spark:
    PHX
    LDA.W CollisionIndex : ASL : TAX
    LDA.W SamusProjectile_Directions,X : AND.W #$FFEF : STA.W SamusProjectile_Directions,X
    PLX
    RTL


;;; $E71F: Spritemaps - Wrecked Ship spark ;;;
; Active
Spritemap_Spark_Constant_0:
    dw $0002
    %spritemapEntry(0, $1FC, $01, 0, 0, 3, 0, $103)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $100)

Spritemap_Spark_Constant_1:
    dw $0002
    %spritemapEntry(0, $1FC, $06, 0, 1, 3, 0, $104)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $101)

Spritemap_Spark_Constant_2:
    dw $0002
    %spritemapEntry(0, $1FC, $08, 0, 0, 3, 0, $105)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $102)

Spritemap_Spark_Constant_3:
    dw $0002
    %spritemapEntry(0, $1FC, $0A, 0, 0, 3, 0, $106)
    %spritemapEntry(0, $1FC, $FC, 0, 1, 3, 0, $101)

; Activate / deactivate / emit falling sparks
Spritemap_Spark_Flickering_0:
    dw $0005
    %spritemapEntry(0, $02, $FE, 0, 0, 3, 0, $109)
    %spritemapEntry(0, $1F6, $FC, 0, 0, 3, 0, $108)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 0, $107)
    %spritemapEntry(0, $1FC, $03, 0, 0, 3, 0, $103)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $100)

Spritemap_Spark_Flickering_1:
    dw $0005
    %spritemapEntry(0, $1F4, $FC, 0, 0, 3, 0, $109)
    %spritemapEntry(0, $04, $00, 0, 0, 3, 0, $10A)
    %spritemapEntry(0, $02, $F6, 0, 0, 3, 0, $108)
    %spritemapEntry(0, $1FC, $06, 0, 1, 3, 0, $104)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $101)

Spritemap_Spark_Flickering_2:
    dw $0004
    %spritemapEntry(0, $1F4, $FC, 0, 0, 3, 0, $10A)
    %spritemapEntry(0, $04, $F4, 0, 0, 3, 0, $109)
    %spritemapEntry(0, $1FC, $09, 0, 0, 3, 0, $105)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $102)

Spritemap_Spark_Flickering_3:
    dw $0003
    %spritemapEntry(0, $04, $F4, 0, 0, 3, 0, $10A)
    %spritemapEntry(0, $1FC, $0E, 0, 0, 3, 0, $106)
    %spritemapEntry(0, $1FC, $FC, 0, 1, 3, 0, $101)


;;; $E7AC: Palette - enemy $EA7F (blue Brinstar face block) ;;;
Palette_FaceBlock:
    dw $3800,$72B2,$71C7,$2461,$1840,$7A8E,$660B,$4D03
    dw $30A4,$30A4,$2461,$1840,$0800,$0000,$0000,$0000


;;; $E7CC: Blue Brinstar face block glow colours ;;;
FaceBlockGlowColors:
    dw $001F,$0012,$000A,$002B
    dw $051F,$0096,$0011,$0007
    dw $0A3F,$013B,$0018,$000D
    dw $0F3F,$01BF,$001F,$0012
    dw $0F3F,$01BF,$001F,$0012
    dw $0A3F,$013B,$0018,$000D
    dw $051F,$0096,$0011,$0007
    dw $001F,$0012,$000A,$002B


;;; $E80C: Instruction list - turning left ;;;
InstList_FaceBlock_TurningLeft:
    dw $0030,Spritemap_FaceBlock_FacingForward
    dw $0010,Spritemap_FaceBlock_TurningLeft
    dw $0010,Spritemap_FaceBlock_FacingLeft
    dw Instruction_Common_Sleep


;;; $E81A: Instruction list - turning right ;;;
InstList_FaceBlock_TurningRight:
    dw $0030,Spritemap_FaceBlock_FacingForward
    dw $0010,Spritemap_FaceBlock_TurningRight
    dw $0010,Spritemap_FaceBlock_FacingRight
    dw Instruction_Common_Sleep


;;; $E828: Instruction list - facing forward ;;;
InstList_FaceBlock_FacingForward:
    dw $0001,Spritemap_FaceBlock_FacingForward
    dw Instruction_Common_Sleep


;;; $E82E: Initialisation AI - enemy $EA7F (blue Brinstar face block) ;;;
InitAI_FaceBlock:
    LDX.W EnemyIndex
    LDA.W #InstList_FaceBlock_FacingForward : STA.W Enemy.instList,X
    LDY.W #EnemyGraphicsDrawnHook_FaceBlock_PeriodicallyCyclePalettes
    LDA.W CollectedItems : BIT.W #$0004 : BNE .morphBallCollected
    LDY.W #RTL_A8804C

  .morphBallCollected:
    STY.W EnemyGraphicsDrawnHook
    LDA.W #EnemyGraphicsDrawnHook_FaceBlock_PeriodicallyCyclePalettes>>16 : STA.W EnemyGraphicsDrawnHook+2
    LDA.W Enemy.palette,X : ASL #4 : AND.W #$FF00 : XBA : STA.W EnemyPaletteCycle_PaletteIndex
    LDA.W #$0010 : STA.W EnemyPaletteCycle_Timer
    LDA.W FaceBlock.directionToNotTurn,X : AND.W #$0001 : ROR #2 : STA.W FaceBlock.directionToNotTurn,X
    RTL


;;; $E86E: Enemy graphics drawn hook - blue Brinstar face block - periodically cycle between palettes ;;;
EnemyGraphicsDrawnHook_FaceBlock_PeriodicallyCyclePalettes:
; This enemy doesn't set EnemyPaletteCycle_ColorSetIndex to zero anywhere,
; so visiting a magdollite can cause this routine to execute with EnemyPaletteCycle_ColorSetIndex >= 8,
; giving this enemy a glitch palette for its first palette cycle
    LDA.W DoorTransitionFlagEnemiesPause : BNE .return
    LDA.W EnemyPaletteCycle_Timer : DEC : STA.W EnemyPaletteCycle_Timer : BNE .return
    LDA.W #$0010 : STA.W EnemyPaletteCycle_Timer
    LDA.W EnemyPaletteCycle_PaletteIndex : TAX
    LDA.W EnemyPaletteCycle_ColorSetIndex : ASL #3 : TAY
    LDA.W #$0004 : STA.W LoopCounterEnemyDeath

  .loopColors:
    LDA.W FaceBlockGlowColors,Y : STA.L Palettes_SpriteP0+$12,X
    INY #2
    INX #2
    DEC.W LoopCounterEnemyDeath : BNE .loopColors
    LDA.W EnemyPaletteCycle_ColorSetIndex : INC : AND.W #$0007 : STA.W EnemyPaletteCycle_ColorSetIndex

  .return:
    RTL


;;; $E8AE: Main AI - enemy $EA7F (blue Brinstar face block) ;;;
MainAI_FaceBlock:
    LDX.W EnemyIndex
    LDA.W CollectedItems : BIT.W #$0004 : BEQ .return
    LDY.W #EnemyGraphicsDrawnHook_FaceBlock_PeriodicallyCyclePalettes : STY.W EnemyGraphicsDrawnHook
    LDA.W Enemy.palette,X : ASL #4 : AND.W #$FF00 : XBA : STA.W EnemyPaletteCycle_PaletteIndex
    LDA.W FaceBlock.activatedFlag,X : BNE .return
    JSL Get_SamusY_minus_EnemyY
    JSL NegateA_A0B067
    CMP.W Enemy.init0,X : BPL .return
    JSL Get_SamusX_minus_EnemyX
    STA.W FaceBlock.directionToSamus,X
    JSL NegateA_A0B067
    CMP.W Enemy.init0,X : BPL .return
    LDA.W FaceBlock.directionToSamus,X : AND.W #$8000 : CMP.W FaceBlock.directionToNotTurn,X : BEQ .return
    LDY.W #InstList_FaceBlock_TurningLeft
    LDA.W FaceBlock.directionToSamus,X : BMI .keepLeft
    LDY.W #InstList_FaceBlock_TurningRight

  .keepLeft:
    TYA : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #$0001 : STA.W FaceBlock.activatedFlag,X ; >.<
    LDA.W #$0010 : STA.W EnemyPaletteCycle_Timer

  .return:
    RTL


;;; $E91C: RTL ;;;
RTL_A8E91C:
    RTL


;;; $E91D: Enemy shot - enemy $EA7F (blue Brinstar face block) ;;;
EnemyShot_FaceBlock:
; Undeletes the collided projectile!
    LDA.W CollisionIndex : ASL : TAX
    LDA.W SamusProjectile_Directions,X : AND.W #$FFEF : STA.W SamusProjectile_Directions,X
    RTL


;;; $E92C: Blue Brinstar face block spritemaps ;;;
Spritemap_FaceBlock_FacingForward:
    dw $0004
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $107)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 0, $106)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 0, $101)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $100)

Spritemap_FaceBlock_TurningLeft:
    dw $0004
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $109)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 0, $108)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 0, $103)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $102)

Spritemap_FaceBlock_FacingLeft:
    dw $0004
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $10B)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 0, $10A)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 0, $105)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $104)

Spritemap_FaceBlock_TurningRight:
    dw $0004
    %spritemapEntry(0, $1F8, $00, 0, 1, 3, 0, $109)
    %spritemapEntry(0, $00, $00, 0, 1, 3, 0, $108)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 3, 0, $103)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 0, $102)

Spritemap_FaceBlock_FacingRight:
    dw $0004
    %spritemapEntry(0, $1F8, $00, 0, 1, 3, 0, $10B)
    %spritemapEntry(0, $00, $00, 0, 1, 3, 0, $10A)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 3, 0, $105)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 0, $104)


;;; $E99A: Palette - enemy $EABF/$EAFF (green ki-hunter) ;;;
Palette_KihunterGreen:
    dw $3800,$4B57,$3A4D,$0CE2,$0040,$46B0,$2E0B,$1D66
    dw $1524,$48FF,$38B6,$246E,$1448,$03FF,$0237,$00D1


;;; $E9BA: Palette - enemy $EB3F/$EB7F (yellow ki-hunter) ;;;
Palette_KihunterYellow:
    dw $3800,$57FF,$42F7,$158C,$00A5,$4F5A,$36B5,$2610
    dw $1DCE,$03E0,$0301,$01A1,$00C1,$6BFA,$42B0,$1545


;;; $E9DA: Palette - enemy $EB7F/$EBBF (red ki-hunter) ;;;
Palette_KihunterRed:
    dw $3800,$5ADF,$3975,$0C0A,$0006,$4E1A,$2D33,$1C8E
    dw $102B,$6F11,$522A,$3124,$1824,$02FF,$01BF,$000F


;;; $E9FA: Instruction list - ki-hunter - idling - facing left ;;;
InstList_Kihunter_Idling_FacingLeft:
    dw $0002,Spritemap_Kihunter_Idling_FacingLeft_0
    dw $0002,Spritemap_Kihunter_Idling_FacingLeft_1
    dw $0001,Spritemap_Kihunter_Idling_FacingLeft_2
    dw Instruction_Kihunter_SetIdlingInstListsFacingForwards


;;; $EA08: Instruction list - ki-hunter - swiping - facing left ;;;
InstList_Kihunter_Swiping_FacingLeft:
    dw $0002,Spritemap_Kihunter_Swiping_FacingLeft_1
    dw $0006,Spritemap_Kihunter_Swiping_FacingLeft_2
    dw $0002,Spritemap_Kihunter_Swiping_FacingLeft_1
    dw $0002,Spritemap_Kihunter_Swiping_FacingLeft_0
    dw $0002,Spritemap_Kihunter_Swiping_FacingLeft_3
    dw $0020,Spritemap_Kihunter_Swiping_FacingLeft_4
    dw Instruction_Common_GotoY
    dw InstList_Kihunter_Idling_FacingLeft


;;; $EA24: Instruction list - ki-hunter - idling - facing right ;;;
InstList_Kihunter_Idling_FacingRight:
    dw $0002,Spritemap_Kihunter_Idling_FacingRight_0
    dw $0002,Spritemap_Kihunter_Idling_FacingRight_1
    dw $0001,Spritemap_Kihunter_Idling_FacingRight_2
    dw Instruction_Kihunter_SetIdlingInstListsFacingForwards


;;; $EA32: Instruction list - ki-hunter - swiping - facing right ;;;
InstList_Kihunter_Swiping_FacingRight:
    dw $0002,Spritemap_Kihunter_Swiping_FacingRight_1
    dw $0006,Spritemap_Kihunter_Swiping_FacingRight_2
    dw $0002,Spritemap_Kihunter_Swiping_FacingRight_1
    dw $0002,Spritemap_Kihunter_Swiping_FacingRight_0
    dw $0002,Spritemap_Kihunter_Swiping_FacingRight_3
    dw $0020,Spritemap_Kihunter_Swiping_FacingRight_4
    dw Instruction_Common_GotoY
    dw InstList_Kihunter_Idling_FacingRight


;;; $EA4E: Instruction list - ki-hunter wings - facing left ;;;
InstList_KihunterWings_FacingLeft:
    dw $0002,Spritemap_KihunterWings_FacingLeft_0
    dw $0002,Spritemap_KihunterWings_FacingLeft_1
    dw $0001,Spritemap_KihunterWings_FacingLeft_2
    dw Instruction_Common_GotoY
    dw InstList_KihunterWings_FacingLeft


;;; $EA5E: Instruction list - ki-hunter wings - facing right ;;;
InstList_KihunterWings_FacingRight:
    dw $0002,Spritemap_KihunterWings_FacingRight_0
    dw $0002,Spritemap_KihunterWings_FacingRight_1
    dw $0001,Spritemap_KihunterWings_FacingRight_2
    dw Instruction_Common_GotoY
    dw InstList_KihunterWings_FacingRight


if !FEATURE_KEEP_UNREFERENCED
;;; $EA6E: Unused. Instruction list - ki-hunter wings - falling - X flipped ;;;
UNUSED_InstList_KihunterWings_Falling_XFlipped_A8EA6E:
    dw $0010,UNUSED_Spritemap_KihunterWings_Falling_XFlipped_A8EBDF
    dw Instruction_Common_GotoY
    dw UNUSED_InstList_KihunterWings_Falling_XFlipped_A8EA6E


;;; $EA76: Unused. Instruction list - ki-hunter wings - falling - X flipped ;;;
UNUSED_InstList_KihunterWings_Falling_XFlipped_A8EA76:
; Spritemap UNUSED_Spritemap_KihunterWings_Falling_XFlipped_A8EBEB is a clone of Spritemap_Kihunter_6, so this instruction list is a clone of UNUSED_InstList_KihunterWings_Falling_XFlipped_A8EA6E
    dw $0010,UNUSED_Spritemap_KihunterWings_Falling_XFlipped_A8EBEB
    dw Instruction_Common_GotoY
    dw UNUSED_InstList_KihunterWings_Falling_XFlipped_A8EA76
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $EA7E: Instruction list - ki-hunter wings - falling ;;;
InstList_KihunterWings_Falling:
    dw $0001,Spritemap_KihunterWings_Falling
    dw Instruction_Common_Sleep


if !FEATURE_KEEP_UNREFERENCED
;;; $EA84: Unused. Instruction list - ki-hunter wings - falling ;;;
UNUSED_InstList_KihunterWings_Falling_A8EA84:
; Spritemap UNUSED_Spritemap_KihunterWings_Falling_A8ECB4 is a clone of Spritemap_KihunterWings_Falling, so this instruction list is a clone of InstList_KihunterWings_Falling
    dw $0001,UNUSED_Spritemap_KihunterWings_Falling_A8ECB4
    dw Instruction_Common_Sleep
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $EA8A: Instruction list - ki-hunter - hop - facing left ;;;
InstList_Kihunter_Hop_FacingLeft:
    dw $0008,Spritemap_Kihunter_Hop_FacingLeft_0
    dw $0008,Spritemap_Kihunter_Hop_FacingLeft_1
    dw $000B,Spritemap_Kihunter_Hop_FacingLeft_2
    dw $0002,Spritemap_Kihunter_Hop_FacingLeft_1
    dw $0002,Spritemap_Kihunter_Hop_FacingLeft_0
    dw Instruction_Kihunter_SetFunctionToHop
    dw $0001,Spritemap_Kihunter_Hop_FacingLeft_3
    dw Instruction_Common_Sleep


;;; $EAA6: Instruction list - ki-hunter - hop - facing right ;;;
InstList_Kihunter_Hop_FacingRight:
    dw $0008,Spritemap_Kihunter_Hop_FacingRight_0
    dw $0008,Spritemap_Kihunter_Hop_FacingRight_1
    dw $000B,Spritemap_Kihunter_Hop_FacingRight_2
    dw $0002,Spritemap_Kihunter_Hop_FacingRight_1
    dw $0002,Spritemap_Kihunter_Hop_FacingRight_0
    dw Instruction_Kihunter_SetFunctionToHop
    dw $0001,Spritemap_Kihunter_Hop_FacingRight_3
    dw Instruction_Common_Sleep


;;; $EAC2: Instruction list - ki-hunter - landed from hop - facing left ;;;
InstList_Kihunter_LandedFromHop_FacingLeft:
    dw $0008,Spritemap_Kihunter_Hop_FacingLeft_0
    dw $0008,Spritemap_Kihunter_Hop_FacingLeft_1
    dw $000B,Spritemap_Kihunter_Hop_FacingLeft_2
    dw $0008,Spritemap_Kihunter_Hop_FacingLeft_1
    dw Instruction_Kihunter_SetFunctionTo_Wingless_Thinking
    dw $0001,Spritemap_Kihunter_Hop_FacingLeft_0
    dw Instruction_Common_Sleep


;;; $EADA: Instruction list - ki-hunter - landed from hop - facing right ;;;
InstList_Kihunter_LandedFromHop_FacingRight:
    dw $0008,Spritemap_Kihunter_Hop_FacingRight_0
    dw $0008,Spritemap_Kihunter_Hop_FacingRight_1
    dw $000B,Spritemap_Kihunter_Hop_FacingRight_2
    dw $0008,Spritemap_Kihunter_Hop_FacingRight_1
    dw Instruction_Kihunter_SetFunctionTo_Wingless_Thinking
    dw $0001,Spritemap_Kihunter_Hop_FacingRight_0
    dw Instruction_Common_Sleep


;;; $EAF2: Instruction list - acid spit attack - facing left ;;;
InstList_Kihunter_AcidSpitAttack_FacingLeft:
    dw $0020,Spritemap_Kihunter_AcidSpitAttack_FacingLeft_0
    dw $0006,Spritemap_Kihunter_AcidSpitAttack_FacingLeft_1
    dw $0010,Spritemap_Kihunter_AcidSpitAttack_FacingLeft_2
    dw $0002,Spritemap_Kihunter_AcidSpitAttack_FacingLeft_3
    dw Instruction_Kihunter_FireAcidSpitLeft
    dw $0018,Spritemap_Kihunter_AcidSpitAttack_FacingLeft_4
    dw Instruction_Kihunter_SetFunctionTo_Wingless_Thinking
    dw $0001,Spritemap_Kihunter_AcidSpitAttack_FacingLeft_0
    dw Instruction_Common_Sleep


;;; $EB10: Instruction list - acid spit attack - facing right ;;;
InstList_Kihunter_AcidSpitAttack_FacingRight:
    dw $0020,Spritemap_Kihunter_AcidSpitAttack_FacingRight_0
    dw $0006,Spritemap_Kihunter_AcidSpitAttack_FacingRight_1
    dw $0010,Spritemap_Kihunter_AcidSpitAttack_FacingRight_2
    dw $0002,Spritemap_Kihunter_AcidSpitAttack_FacingRight_3
    dw Instruction_Kihunter_FireAcidSpitRight
    dw $0018,Spritemap_Kihunter_AcidSpitAttack_FacingRight_4
    dw Instruction_Kihunter_SetFunctionTo_Wingless_Thinking
    dw $0001,Spritemap_Kihunter_AcidSpitAttack_FacingRight_0
    dw Instruction_Common_Sleep


;;; $EB2E: Ki-hunter spritemaps ;;;
Spritemap_Kihunter_Idling_FacingLeft_0:
    dw $0008
    %spritemapEntry(0, $1E5, $03, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $43EB, $FE, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $43F4, $F8, 0, 0, 2, 0, $12C)
    %spritemapEntry(1, $43FD, $01, 0, 0, 2, 0, $11E)
    %spritemapEntry(1, $43FD, $09, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $4200, $00, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $43EF, $F0, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $1E2, $02, 0, 0, 2, 0, $10E)

Spritemap_Kihunter_Idling_FacingLeft_1:
    dw $0008
    %spritemapEntry(0, $1E5, $02, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $43EB, $FD, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $43F4, $F7, 0, 0, 2, 0, $12C)
    %spritemapEntry(1, $43FD, $00, 0, 0, 2, 0, $11E)
    %spritemapEntry(1, $43FD, $08, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $4200, $FF, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $43EF, $EF, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $1E2, $01, 0, 0, 2, 0, $10E)

Spritemap_Kihunter_Idling_FacingLeft_2:
    dw $0008
    %spritemapEntry(0, $1E5, $03, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $43EB, $FE, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $43F4, $F8, 0, 0, 2, 0, $12C)
    %spritemapEntry(1, $43FD, $01, 0, 0, 2, 0, $11E)
    %spritemapEntry(1, $43FD, $09, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $4200, $00, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $43EF, $F0, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $1E2, $02, 0, 0, 2, 0, $10E)

Spritemap_KihunterWings_FacingLeft_0:
    dw $0004
    %spritemapEntry(0, $0B, $E3, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $01, $E3, 0, 0, 2, 0, $143)
    %spritemapEntry(1, $4209, $EB, 0, 0, 2, 0, $141)
    %spritemapEntry(1, $4201, $EB, 0, 0, 2, 0, $140)

Spritemap_KihunterWings_FacingLeft_1:
    dw $0002
    %spritemapEntry(0, $12, $FB, 0, 0, 2, 0, $145)
    %spritemapEntry(1, $4202, $F3, 0, 0, 2, 0, $146)

Spritemap_KihunterWings_FacingLeft_2:
    dw $0003
    %spritemapEntry(0, $11, $F3, 0, 0, 2, 0, $155)
    %spritemapEntry(0, $09, $F3, 0, 0, 2, 0, $154)
    %spritemapEntry(0, $01, $F3, 0, 0, 2, 0, $153)

UNUSED_Spritemap_KihunterWings_Falling_XFlipped_A8EBDF:
    dw $0002
    %spritemapEntry(1, $43FC, $F8, 0, 0, 2, 0, $149)
    %spritemapEntry(1, $43F4, $F8, 0, 0, 2, 0, $148)

UNUSED_Spritemap_KihunterWings_Falling_XFlipped_A8EBEB:
    dw $0002
    %spritemapEntry(1, $43FC, $F8, 0, 0, 2, 0, $149)
    %spritemapEntry(1, $43F4, $F8, 0, 0, 2, 0, $148)

Spritemap_Kihunter_Idling_FacingRight_0:
    dw $0008
    %spritemapEntry(0, $13, $03, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $4205, $FE, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $43FC, $F8, 0, 1, 2, 0, $12C)
    %spritemapEntry(1, $43F3, $01, 0, 1, 2, 0, $11E)
    %spritemapEntry(1, $43F3, $09, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $43F0, $00, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $4201, $F0, 0, 1, 2, 0, $100)
    %spritemapEntry(0, $16, $02, 0, 1, 2, 0, $10E)

Spritemap_Kihunter_Idling_FacingRight_1:
    dw $0008
    %spritemapEntry(0, $13, $02, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $4205, $FD, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $43FC, $F7, 0, 1, 2, 0, $12C)
    %spritemapEntry(1, $43F3, $00, 0, 1, 2, 0, $11E)
    %spritemapEntry(1, $43F3, $08, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $43F0, $FF, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $4201, $EF, 0, 1, 2, 0, $100)
    %spritemapEntry(0, $16, $01, 0, 1, 2, 0, $10E)

Spritemap_Kihunter_Idling_FacingRight_2:
    dw $0008
    %spritemapEntry(0, $13, $03, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $4205, $FE, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $43FC, $F8, 0, 1, 2, 0, $12C)
    %spritemapEntry(1, $43F3, $01, 0, 1, 2, 0, $11E)
    %spritemapEntry(1, $43F3, $09, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $43F0, $00, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $4201, $F0, 0, 1, 2, 0, $100)
    %spritemapEntry(0, $16, $02, 0, 1, 2, 0, $10E)

Spritemap_KihunterWings_FacingRight_0:
    dw $0004
    %spritemapEntry(0, $1ED, $E3, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1F7, $E3, 0, 1, 2, 0, $143)
    %spritemapEntry(1, $43E7, $EB, 0, 1, 2, 0, $141)
    %spritemapEntry(1, $43EF, $EB, 0, 1, 2, 0, $140)

Spritemap_KihunterWings_FacingRight_1:
    dw $0002
    %spritemapEntry(0, $1E6, $FB, 0, 1, 2, 0, $145)
    %spritemapEntry(1, $43EE, $F3, 0, 1, 2, 0, $146)

Spritemap_KihunterWings_FacingRight_2:
    dw $0003
    %spritemapEntry(0, $1E7, $F3, 0, 1, 2, 0, $155)
    %spritemapEntry(0, $1EF, $F3, 0, 1, 2, 0, $154)
    %spritemapEntry(0, $1F7, $F3, 0, 1, 2, 0, $153)

Spritemap_KihunterWings_Falling:
    dw $0002
    %spritemapEntry(1, $43F4, $F8, 0, 1, 2, 0, $149)
    %spritemapEntry(1, $43FC, $F8, 0, 1, 2, 0, $148)

UNUSED_Spritemap_KihunterWings_Falling_A8ECB4:
    dw $0002
    %spritemapEntry(1, $43F4, $F8, 0, 1, 2, 0, $149)
    %spritemapEntry(1, $43FC, $F8, 0, 1, 2, 0, $148)

Spritemap_Kihunter_Swiping_FacingLeft_0:
    dw $0008
    %spritemapEntry(0, $1E5, $03, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $43EB, $FE, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $43F4, $F8, 0, 0, 2, 0, $12C)
    %spritemapEntry(1, $43FD, $01, 0, 0, 2, 0, $11E)
    %spritemapEntry(1, $43FD, $09, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $4200, $00, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $43EF, $F0, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $1E2, $02, 0, 0, 2, 0, $10E)

Spritemap_Kihunter_Swiping_FacingLeft_1:
    dw $0008
    %spritemapEntry(0, $1E9, $F5, 0, 0, 2, 0, $10F)
    %spritemapEntry(1, $43EC, $FA, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $43F4, $F8, 0, 0, 2, 0, $12C)
    %spritemapEntry(1, $43FD, $01, 0, 0, 2, 0, $11E)
    %spritemapEntry(1, $43FD, $09, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $4200, $00, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $43EF, $F0, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $1E6, $F4, 0, 0, 2, 0, $10F)

Spritemap_Kihunter_Swiping_FacingLeft_2:
    dw $0008
    %spritemapEntry(0, $1F0, $F5, 0, 0, 2, 0, $14F)
    %spritemapEntry(1, $43EC, $FA, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $43F4, $F8, 0, 0, 2, 0, $12C)
    %spritemapEntry(1, $43FD, $01, 0, 0, 2, 0, $11E)
    %spritemapEntry(1, $43FD, $09, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $4200, $00, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $43EF, $F0, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $1ED, $F4, 0, 0, 2, 0, $14F)

Spritemap_Kihunter_Swiping_FacingLeft_3:
    dw $0008
    %spritemapEntry(0, $1E8, $0F, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $43ED, $03, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $43F4, $F9, 0, 0, 2, 0, $12C)
    %spritemapEntry(1, $43FD, $01, 0, 0, 2, 0, $11E)
    %spritemapEntry(1, $43FD, $09, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $4200, $00, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $43EF, $F1, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $1E5, $0E, 0, 0, 2, 0, $10E)

Spritemap_Kihunter_Swiping_FacingLeft_4:
    dw $0008
    %spritemapEntry(1, $43ED, $03, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $1F0, $0F, 0, 0, 2, 0, $14E)
    %spritemapEntry(1, $43F4, $F9, 0, 0, 2, 0, $12C)
    %spritemapEntry(1, $43FD, $02, 0, 0, 2, 0, $11E)
    %spritemapEntry(1, $43FD, $0A, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $4200, $01, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $43EF, $F2, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $1ED, $0E, 0, 0, 2, 0, $14E)

Spritemap_Kihunter_Swiping_FacingRight_0:
    dw $0008
    %spritemapEntry(0, $13, $03, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $4205, $FE, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $43FC, $F8, 0, 1, 2, 0, $12C)
    %spritemapEntry(1, $43F3, $01, 0, 1, 2, 0, $11E)
    %spritemapEntry(1, $43F3, $09, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $43F0, $00, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $4201, $F0, 0, 1, 2, 0, $100)
    %spritemapEntry(0, $16, $02, 0, 1, 2, 0, $10E)

Spritemap_Kihunter_Swiping_FacingRight_1:
    dw $0008
    %spritemapEntry(0, $0F, $F5, 0, 1, 2, 0, $10F)
    %spritemapEntry(1, $4204, $FA, 0, 1, 2, 0, $128)
    %spritemapEntry(1, $43FC, $F8, 0, 1, 2, 0, $12C)
    %spritemapEntry(1, $43F3, $01, 0, 1, 2, 0, $11E)
    %spritemapEntry(1, $43F3, $09, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $43F0, $00, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $4201, $F0, 0, 1, 2, 0, $100)
    %spritemapEntry(0, $12, $F4, 0, 1, 2, 0, $10F)

Spritemap_Kihunter_Swiping_FacingRight_2:
    dw $0008
    %spritemapEntry(0, $08, $F5, 0, 1, 2, 0, $14F)
    %spritemapEntry(1, $4204, $FA, 0, 1, 2, 0, $128)
    %spritemapEntry(1, $43FC, $F8, 0, 1, 2, 0, $12C)
    %spritemapEntry(1, $43F3, $01, 0, 1, 2, 0, $11E)
    %spritemapEntry(1, $43F3, $09, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $43F0, $00, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $4201, $F0, 0, 1, 2, 0, $100)
    %spritemapEntry(0, $0B, $F4, 0, 1, 2, 0, $14F)

Spritemap_Kihunter_Swiping_FacingRight_3:
    dw $0008
    %spritemapEntry(0, $10, $0F, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $4203, $03, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $43FC, $F9, 0, 1, 2, 0, $12C)
    %spritemapEntry(1, $43F3, $01, 0, 1, 2, 0, $11E)
    %spritemapEntry(1, $43F3, $09, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $43F0, $00, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $4201, $F1, 0, 1, 2, 0, $100)
    %spritemapEntry(0, $13, $0E, 0, 1, 2, 0, $10E)

Spritemap_Kihunter_Swiping_FacingRight_4:
    dw $0008
    %spritemapEntry(1, $4203, $03, 0, 1, 2, 0, $124)
    %spritemapEntry(0, $08, $0F, 0, 1, 2, 0, $14E)
    %spritemapEntry(1, $43FC, $F9, 0, 1, 2, 0, $12C)
    %spritemapEntry(1, $43F3, $02, 0, 1, 2, 0, $11E)
    %spritemapEntry(1, $43F3, $0A, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $43F0, $01, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $4201, $F2, 0, 1, 2, 0, $100)
    %spritemapEntry(0, $0B, $0E, 0, 1, 2, 0, $14E)

Spritemap_Kihunter_Hop_FacingLeft_0:
    dw $0008
    %spritemapEntry(0, $1E3, $FF, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $43E9, $FA, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $43F2, $F4, 0, 0, 2, 0, $12C)
    %spritemapEntry(1, $43FA, $F8, 0, 0, 2, 0, $15E)
    %spritemapEntry(1, $43FA, $00, 0, 0, 2, 0, $16E)
    %spritemapEntry(1, $43FE, $FC, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $43EE, $ED, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $1E0, $FE, 0, 0, 2, 0, $10E)

Spritemap_Kihunter_Hop_FacingLeft_1:
    dw $0008
    %spritemapEntry(0, $1E3, $04, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $43E9, $FF, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $43F2, $F9, 0, 0, 2, 0, $12C)
    %spritemapEntry(1, $43FB, $00, 0, 0, 2, 0, $162)
    %spritemapEntry(1, $43FE, $01, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $43ED, $F1, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $1E0, $03, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $43F9, $FF, 0, 0, 2, 0, $162)

Spritemap_Kihunter_Hop_FacingLeft_2:
    dw $0008
    %spritemapEntry(0, $1E3, $07, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $43E9, $02, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $43F2, $FC, 0, 0, 2, 0, $12C)
    %spritemapEntry(1, $43FB, $00, 0, 0, 2, 0, $160)
    %spritemapEntry(1, $43FE, $04, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $43ED, $F4, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $1E0, $06, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $43F9, $FF, 0, 0, 2, 0, $160)

Spritemap_Kihunter_Hop_FacingLeft_3:
    dw $0008
    %spritemapEntry(0, $1E8, $00, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $43EE, $FB, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $43F7, $F5, 0, 0, 2, 0, $12C)
    %spritemapEntry(1, $4200, $FE, 0, 0, 2, 0, $11E)
    %spritemapEntry(1, $4200, $06, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $4203, $FD, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $43F3, $EE, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $1E5, $FF, 0, 0, 2, 0, $10E)

Spritemap_Kihunter_Hop_FacingRight_0:
    dw $0008
    %spritemapEntry(0, $15, $FF, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $4207, $FA, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $43FE, $F4, 0, 1, 2, 0, $12C)
    %spritemapEntry(1, $43F6, $F8, 0, 1, 2, 0, $15E)
    %spritemapEntry(1, $43F6, $00, 0, 1, 2, 0, $16E)
    %spritemapEntry(1, $43F2, $FC, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $4202, $ED, 0, 1, 2, 0, $100)
    %spritemapEntry(0, $18, $FE, 0, 1, 2, 0, $10E)

Spritemap_Kihunter_Hop_FacingRight_1:
    dw $0008
    %spritemapEntry(0, $15, $04, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $4207, $FF, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $43FE, $F9, 0, 1, 2, 0, $12C)
    %spritemapEntry(1, $43F5, $00, 0, 1, 2, 0, $162)
    %spritemapEntry(1, $43F2, $01, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $4203, $F1, 0, 1, 2, 0, $100)
    %spritemapEntry(0, $18, $03, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $43F7, $FF, 0, 1, 2, 0, $162)

Spritemap_Kihunter_Hop_FacingRight_2:
    dw $0008
    %spritemapEntry(0, $15, $07, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $4207, $02, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $43FE, $FC, 0, 1, 2, 0, $12C)
    %spritemapEntry(1, $43F5, $00, 0, 1, 2, 0, $160)
    %spritemapEntry(1, $43F2, $04, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $4203, $F4, 0, 1, 2, 0, $100)
    %spritemapEntry(0, $18, $06, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $43F7, $FF, 0, 1, 2, 0, $160)

Spritemap_Kihunter_Hop_FacingRight_3:
    dw $0008
    %spritemapEntry(0, $12, $FF, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $4204, $FA, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $43FB, $F4, 0, 1, 2, 0, $12C)
    %spritemapEntry(1, $43F0, $FE, 0, 1, 2, 0, $11E)
    %spritemapEntry(1, $43F0, $06, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $43EF, $FC, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $43FF, $ED, 0, 1, 2, 0, $100)
    %spritemapEntry(0, $15, $FE, 0, 1, 2, 0, $10E)

Spritemap_Kihunter_AcidSpitAttack_FacingLeft_0:
    dw $0008
    %spritemapEntry(0, $1E3, $FF, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $43E9, $FA, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $43F2, $F4, 0, 0, 2, 0, $12C)
    %spritemapEntry(1, $43FA, $F8, 0, 0, 2, 0, $15E)
    %spritemapEntry(1, $43FA, $00, 0, 0, 2, 0, $16E)
    %spritemapEntry(1, $43FE, $FC, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $43EE, $ED, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $1E0, $FE, 0, 0, 2, 0, $10E)

Spritemap_Kihunter_AcidSpitAttack_FacingLeft_1:
    dw $0009
    %spritemapEntry(0, $1E4, $FF, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $43EA, $FA, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $43F3, $F4, 0, 0, 2, 0, $12C)
    %spritemapEntry(1, $43FA, $F8, 0, 0, 2, 0, $15E)
    %spritemapEntry(1, $43FA, $00, 0, 0, 2, 0, $16E)
    %spritemapEntry(1, $43FE, $FC, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $43F2, $EC, 0, 0, 2, 0, $103)
    %spritemapEntry(1, $43EA, $EC, 0, 0, 2, 0, $102)
    %spritemapEntry(0, $1E1, $FE, 0, 0, 2, 0, $10E)

Spritemap_Kihunter_AcidSpitAttack_FacingLeft_2:
    dw $0009
    %spritemapEntry(0, $1E5, $FF, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $43EB, $FA, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $43F4, $F4, 0, 0, 2, 0, $12C)
    %spritemapEntry(1, $43FA, $F8, 0, 0, 2, 0, $15E)
    %spritemapEntry(1, $43FA, $00, 0, 0, 2, 0, $16E)
    %spritemapEntry(1, $43FD, $FC, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $43FC, $EC, 0, 0, 2, 0, $107)
    %spritemapEntry(1, $43EC, $EC, 0, 0, 2, 0, $105)
    %spritemapEntry(0, $1E2, $FE, 0, 0, 2, 0, $10E)

Spritemap_Kihunter_AcidSpitAttack_FacingLeft_3:
    dw $0009
    %spritemapEntry(0, $1E5, $FF, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $43EB, $FA, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $43F4, $F4, 0, 0, 2, 0, $12C)
    %spritemapEntry(1, $43FA, $F8, 0, 0, 2, 0, $15E)
    %spritemapEntry(1, $43FA, $00, 0, 0, 2, 0, $16E)
    %spritemapEntry(1, $43EB, $EC, 0, 0, 2, 0, $10A)
    %spritemapEntry(1, $43FB, $EC, 0, 0, 2, 0, $107)
    %spritemapEntry(1, $43FF, $FC, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $1E2, $FE, 0, 0, 2, 0, $10E)

Spritemap_Kihunter_AcidSpitAttack_FacingLeft_4:
    dw $0009
    %spritemapEntry(0, $1E4, $FF, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $43EA, $FA, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $43F3, $F4, 0, 0, 2, 0, $12C)
    %spritemapEntry(1, $43FA, $F8, 0, 0, 2, 0, $15E)
    %spritemapEntry(1, $43FA, $00, 0, 0, 2, 0, $16E)
    %spritemapEntry(1, $43FD, $FC, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $43EA, $EC, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $43FA, $EC, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $1E1, $FE, 0, 0, 2, 0, $10E)

Spritemap_Kihunter_AcidSpitAttack_FacingRight_0:
    dw $0008
    %spritemapEntry(0, $15, $FF, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $4207, $FA, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $43FE, $F4, 0, 1, 2, 0, $12C)
    %spritemapEntry(1, $43F6, $F8, 0, 1, 2, 0, $15E)
    %spritemapEntry(1, $43F6, $00, 0, 1, 2, 0, $16E)
    %spritemapEntry(1, $43F2, $FC, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $4202, $ED, 0, 1, 2, 0, $100)
    %spritemapEntry(0, $18, $FE, 0, 1, 2, 0, $10E)

Spritemap_Kihunter_AcidSpitAttack_FacingRight_1:
    dw $0009
    %spritemapEntry(0, $14, $FF, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $4206, $FA, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $43FD, $F4, 0, 1, 2, 0, $12C)
    %spritemapEntry(1, $43F6, $F8, 0, 1, 2, 0, $15E)
    %spritemapEntry(1, $43F6, $00, 0, 1, 2, 0, $16E)
    %spritemapEntry(1, $43F2, $FC, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $43FE, $EC, 0, 1, 2, 0, $103)
    %spritemapEntry(1, $4206, $EC, 0, 1, 2, 0, $102)
    %spritemapEntry(0, $17, $FE, 0, 1, 2, 0, $10E)

Spritemap_Kihunter_AcidSpitAttack_FacingRight_2:
    dw $0009
    %spritemapEntry(0, $13, $FF, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $4205, $FA, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $43FC, $F4, 0, 1, 2, 0, $12C)
    %spritemapEntry(1, $43F6, $F8, 0, 1, 2, 0, $15E)
    %spritemapEntry(1, $43F6, $00, 0, 1, 2, 0, $16E)
    %spritemapEntry(1, $43F3, $FC, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $43F4, $EC, 0, 1, 2, 0, $107)
    %spritemapEntry(1, $4204, $EC, 0, 1, 2, 0, $105)
    %spritemapEntry(0, $16, $FE, 0, 1, 2, 0, $10E)

Spritemap_Kihunter_AcidSpitAttack_FacingRight_3:
    dw $0009
    %spritemapEntry(0, $13, $FF, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $4205, $FA, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $43FC, $F4, 0, 1, 2, 0, $12C)
    %spritemapEntry(1, $43F6, $F8, 0, 1, 2, 0, $15E)
    %spritemapEntry(1, $43F6, $00, 0, 1, 2, 0, $16E)
    %spritemapEntry(1, $4205, $EC, 0, 1, 2, 0, $10A)
    %spritemapEntry(1, $43F5, $EC, 0, 1, 2, 0, $107)
    %spritemapEntry(1, $43F1, $FC, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $16, $FE, 0, 1, 2, 0, $10E)

Spritemap_Kihunter_AcidSpitAttack_FacingRight_4:
    dw $0009
    %spritemapEntry(0, $14, $FF, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $4206, $FA, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $43FD, $F4, 0, 1, 2, 0, $12C)
    %spritemapEntry(1, $43F6, $F8, 0, 1, 2, 0, $15E)
    %spritemapEntry(1, $43F6, $00, 0, 1, 2, 0, $16E)
    %spritemapEntry(1, $43F3, $FC, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $4206, $EC, 0, 1, 2, 0, $10C)
    %spritemapEntry(1, $43F6, $EC, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $17, $FE, 0, 1, 2, 0, $10E)


;;; $F180: Ki-hunter constants ;;;
KihunterConstants:
  .XProximityToActivateSwoop:
    dw $0060
  .fallingAcceleration_hop:
    dw $E000
  .fallingAcceleration_wingsClipped:
    dw $0000
  .fallingWingsArcRadius:
    dw $0030


;;; $F188: Initialisation AI - enemy $EABF/$EB3F/$EBBF (ki-hunter) ;;;
InitAI_Kihunter:
    LDX.W EnemyIndex
    LDA.W Enemy.properties,X : ORA.W #$2000 : STA.W Enemy.properties,X
    LDA.W #$0000 : STA.L Kihunter.winglessFlag,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.W #InstList_Kihunter_Idling_FacingLeft : STA.W Enemy.instList,X
    LDA.W #$0000 : STA.W Kihunter.arcAngle,X
    LDA.W #Function_Kihunter_Winged_IdleFlying : STA.W Kihunter.function,X
    LDA.W #$0000 : STA.L Kihunter.YSubVelocity,X ; >.<
    LDA.W #$0001 : STA.L Kihunter.YVelocity,X
    LDA.W #$0000 : STA.L Kihunter.XSubVelocity,X ; >.<
    LDA.W #$FFFF : STA.L Kihunter.XVelocity,X
    LDA.W Enemy.YPosition,X : SEC : SBC.W #$0010 : STA.L Kihunter.idleZoneTopPosition,X
    CLC : ADC.W #$0020 : STA.L Kihunter.idleZoneBottomPosition,X
    LDA.W Enemy.XPosition,X : STA.L Kihunter.spawnXPosition,X
    LDA.W Enemy.YPosition,X : STA.L Kihunter.spawnYPosition,X
    LDA.W Enemy.init0,X : BPL .return
    LDA.W #$0001 : STA.L Kihunter.winglessFlag,X
    LDA.W #Function_Kihunter_Wingless_InitialFalling : STA.W Kihunter.function,X
    LDA.W #$0000 : STA.L Kihunter.YSubVelocity,X
    LDA.W #$0001 : STA.L Kihunter.YVelocity,X ; >.<

  .return:
    RTL


;;; $F214: Initialisation AI - enemy $EAFF/$EB7F/$EBFF (ki-hunter wings) ;;;
InitAI_KihunterWings:
    LDX.W EnemyIndex
    LDA.W Enemy.properties,X : ORA.W #$2000 : STA.W Enemy.properties,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.W #InstList_KihunterWings_FacingLeft : STA.W Enemy.instList,X
    LDA.W Enemy[-1].YPosition,X : STA.W Enemy.YPosition,X
    LDA.W Enemy[-1].XPosition,X : STA.W Enemy.XPosition,X
    LDA.W #Function_KihunterWings_Attached : STA.W KihunterWings.function,X
    LDA.W Enemy[-1].palette,X : STA.W Enemy.palette,X
    LDA.W Enemy[-1].GFXOffset,X : STA.W Enemy.GFXOffset,X
    LDA.W Enemy[-1].init0,X : BPL .return
    LDA.W Enemy.properties,X : ORA.W #$0200 : STA.W Enemy.properties,X

  .return:
    RTL


;;; $F25C: Main AI - enemy $EABF/$EB3F/$EBBF (ki-hunter) ;;;
MainAI_Kihunter:
    LDX.W EnemyIndex
    JMP.W (Kihunter.function,X)


;;; $F262: Main AI - enemy $EAFF/$EB7F/$EBFF (ki-hunter wings) ;;;
MainAI_KihunterWings:
    LDX.W EnemyIndex
    JMP.W (KihunterWings.function,X)


;;; $F268: Ki-hunter function - winged - idle flying ;;;
Function_Kihunter_Winged_IdleFlying:
    LDA.L Kihunter.YSubVelocity,X : STA.B DP_Temp12
    LDA.L Kihunter.YVelocity,X : STA.B DP_Temp14
    JSL MoveEnemyDownBy_14_12
    BCS .collidedWithBlock
    LDA.W Enemy.YPosition,X : CMP.L Kihunter.idleZoneTopPosition,X : BMI .idleDown
    CMP.L Kihunter.idleZoneBottomPosition,X : BMI .noChangeY
    LDA.W #$FFFF
    BRA .changeY

  .collidedWithBlock:
    LDA.L Kihunter.YVelocity,X : EOR.W #$FFFF : INC
    BRA .changeY

  .idleDown:
    LDA.W #$0001

  .changeY:
    STA.L Kihunter.YVelocity,X

  .noChangeY:
    LDA.L Kihunter.XSubVelocity,X : STA.B DP_Temp12
    LDA.L Kihunter.XVelocity,X : STA.B DP_Temp14
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCC .noCollision
    LDY.W #$0000
    LDA.L Kihunter.XVelocity,X : EOR.W #$FFFF : INC : STA.L Kihunter.XVelocity,X : BMI .movingLeft
    LDY.W #$0004

  .movingLeft:
    LDA.W .instListPointers_kihunter,Y : STA.W Enemy.instList,X
    LDA.W .instListPointers_wings,Y : STA.W Enemy[1].instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X : STA.W Enemy[1].instTimer,X

  .noCollision:
    JSL AlignEnemyYPositionWIthNonSquareSlope
    LDA.W SamusXPosition : SEC : SBC.W Enemy.XPosition,X : STA.B DP_Temp12 : BPL +
    EOR.W #$FFFF : INC

+   STA.B DP_Temp14
    CMP.W KihunterConstants_XProximityToActivateSwoop : BMI +
    RTL

+   LDA.W SamusYPosition : SEC : SBC.W Enemy.YPosition,X : CMP.W #$0020 : BPL .outsideRange
    RTL

  .outsideRange:
    STA.B DP_Temp18
    LDA.B DP_Temp12 : BMI .rightOfSamus
    LDA.W #$0002 : STA.L Kihunter.arcAngularVelocityCap,X
    LDA.W #$0000 : STA.L Kihunter.arcAngularVelocity,X
    STA.L Kihunter.arcAngularSubVelocity,X : STA.L Kihunter.arcAngularAcceleration,X
    LDA.W #$2000 : STA.L Kihunter.arcAngularSubAcceleration,X
    LDA.W #$0080 : STA.W Kihunter.arcAngle,X
    LDA.W #$0001 : STA.L Kihunter.XVelocity,X
    LDA.W #$0090 : STA.L Kihunter.swipeTriggerAngle,X
    LDY.W #$0004
    BRA +

  .rightOfSamus:
    LDA.W #$FFFE : STA.L Kihunter.arcAngularVelocityCap,X
    LDA.W #$0000 : STA.L Kihunter.arcAngularVelocity,X : STA.L Kihunter.arcAngularSubVelocity,X
    LDA.W #$FFFF : STA.L Kihunter.arcAngularAcceleration,X : STA.L Kihunter.XVelocity,X
    LDA.W #$E000 : STA.L Kihunter.arcAngularSubAcceleration,X
    LDA.W #$00FF : STA.W Kihunter.arcAngle,X
    LDA.W #$00F0 : STA.L Kihunter.swipeTriggerAngle,X
    LDY.W #$0000

+   LDA.W .instListPointers_kihunter,Y : STA.W Enemy.instList,X
    LDA.W .instListPointers_wings,Y : STA.W Enemy[1].instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X : STA.W Enemy[1].instTimer,X
    LDA.W Enemy.XPosition,X : CLC : ADC.B DP_Temp12 : STA.W Kihunter.arcCenterXPosition,X
    LDA.W Enemy.YPosition,X : STA.W Kihunter.arcCenterYPosition,X
    LDA.W #Function_Kihunter_Winged_Swoop : STA.W Kihunter.function,X
    LDA.B DP_Temp18 : STA.L Kihunter.arcYRadius,X
    LDA.B DP_Temp14 : STA.L Kihunter.arcXRadius,X
    LDA.W #$0000 : STA.L Kihunter.swoopSwipeFlag,X
    RTL

  .instListPointers_kihunter:
    dw InstList_Kihunter_Idling_FacingLeft
  .instListPointers_wings:
    dw InstList_KihunterWings_FacingLeft
    dw InstList_Kihunter_Idling_FacingRight
    dw InstList_KihunterWings_FacingRight


;;; $F3B8: Ki-hunter function - winged - swoop ;;;
Function_Kihunter_Winged_Swoop:
    LDA.L Kihunter.arcAngularAcceleration,X : BPL .arcingRight
    LDA.W Kihunter.arcAngle,X : CMP.L Kihunter.swipeTriggerAngle,X : BPL .noInstListChange
    BRA +

  .arcingRight:
    LDA.W Kihunter.arcAngle,X : CMP.L Kihunter.swipeTriggerAngle,X : BMI .noInstListChange

+   LDA.L Kihunter.swoopSwipeFlag,X : BNE .noInstListChange
    LDA.W #$0001 : STA.L Kihunter.swoopSwipeFlag,X
    LDY.W #InstList_Kihunter_Swiping_FacingRight
    LDA.L Kihunter.arcAngularAcceleration,X : BPL .keepRight
    LDY.W #InstList_Kihunter_Swiping_FacingLeft

  .keepRight:
    TYA : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X

  .noInstListChange:
    LDA.L Kihunter.arcAngularAcceleration,X : BPL .rightwards
    LDA.L Kihunter.arcAngularSubVelocity,X : CLC : ADC.L Kihunter.arcAngularSubAcceleration,X : STA.L Kihunter.arcAngularSubVelocity,X
    LDA.L Kihunter.arcAngularVelocity,X : ADC.L Kihunter.arcAngularAcceleration,X : CMP.L Kihunter.arcAngularVelocityCap,X : BPL +
    LDA.L Kihunter.arcAngularVelocityCap,X

+   STA.L Kihunter.arcAngularVelocity,X
    LDA.W Kihunter.arcAngle,X : CLC : ADC.L Kihunter.arcAngularVelocity,X : STA.W Kihunter.arcAngle,X
    CMP.W #$0080 : BPL .swoopContinues
    LDA.W #Function_Kihunter_Winged_IdleFlying : STA.W Kihunter.function,X
    RTL

  .rightwards:
    LDA.L Kihunter.arcAngularSubVelocity,X : CLC : ADC.L Kihunter.arcAngularSubAcceleration,X : STA.L Kihunter.arcAngularSubVelocity,X
    LDA.L Kihunter.arcAngularVelocity,X : ADC.L Kihunter.arcAngularAcceleration,X : CMP.L Kihunter.arcAngularVelocityCap,X : BMI +
    LDA.L Kihunter.arcAngularVelocityCap,X

+   STA.L Kihunter.arcAngularVelocity,X
    LDA.W Kihunter.arcAngle,X : CLC : ADC.L Kihunter.arcAngularVelocity,X : STA.W Kihunter.arcAngle,X
    CMP.W #$0100 : BMI .swoopContinues
    LDA.W #Function_Kihunter_Winged_IdleFlying : STA.W Kihunter.function,X
    RTL

  .swoopContinues:
    LDA.L Kihunter.arcXRadius,X : STA.W Temp_Unknown0E32
    LDA.W Kihunter.arcAngle,X
    JSL EightBitCosineMultiplication_A0B0B2
    CLC : ADC.W Kihunter.arcCenterXPosition,X
    SEC : SBC.W Enemy.XPosition,X : STA.B DP_Temp14
    STZ.B DP_Temp12
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCS .collidedHorizontally
    JSL AlignEnemyYPositionWIthNonSquareSlope
    LDA.L Kihunter.arcYRadius,X : STA.W Temp_Unknown0E32
    LDA.W Kihunter.arcAngle,X
    JSL EightBitNegativeSineMultiplication_A0B0C6
    CLC : ADC.W Kihunter.arcCenterYPosition,X
    SEC : SBC.W Enemy.YPosition,X : STA.B DP_Temp14
    STZ.B DP_Temp12
    JSL MoveEnemyDownBy_14_12
    BCS .collidedVertically
    RTL

  .collidedHorizontally:
    LDA.L Kihunter.arcAngularAcceleration,X : BPL .arcRight
    LDA.W #$0000 : STA.L Kihunter.XSubVelocity,X
    LDA.W #$0001 : STA.L Kihunter.XVelocity,X
    BRA .collidedVertically

  .arcRight:
    LDA.W #$0000 : STA.L Kihunter.XSubVelocity,X
    LDA.W #$FFFF : STA.L Kihunter.XVelocity,X

  .collidedVertically:
    LDA.W #Function_Kihunter_Winged_BackOff : STA.W Kihunter.function,X
    LDA.W #$0000 : STA.L Kihunter.YSubVelocity,X
    LDA.W #$FFFF : STA.L Kihunter.YVelocity,X
    RTL


;;; $F4ED: Ki-hunter function - winged - back off ;;;
Function_Kihunter_Winged_BackOff:
    LDA.L Kihunter.XSubVelocity,X : STA.B DP_Temp12
    LDA.L Kihunter.XVelocity,X : STA.B DP_Temp14
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCS .collidedWithBlock
    JSL AlignEnemyYPositionWIthNonSquareSlope
    LDA.L Kihunter.YSubVelocity,X : STA.B DP_Temp12
    LDA.L Kihunter.YVelocity,X : STA.B DP_Temp14
    JSL MoveEnemyDownBy_14_12
    BCS .collidedWithBlock
    LDA.W Enemy.YPosition,X : CMP.L Kihunter.spawnYPosition,X : BMI .collidedWithBlock
    RTL

  .collidedWithBlock:
    LDA.W #Function_Kihunter_Winged_IdleFlying : STA.W Kihunter.function,X
    RTL


;;; $F526: Instruction - set idling instruction lists facing forwards ;;;
Instruction_Kihunter_SetIdlingInstListsFacingForwards:
    LDY.W #InstList_Kihunter_Idling_FacingLeft
    LDA.W #InstList_KihunterWings_FacingLeft : STA.B DP_Temp12
    LDA.L Kihunter.XVelocity,X : BMI .keepLeft
    LDY.W #InstList_Kihunter_Idling_FacingRight
    LDA.W #InstList_KihunterWings_FacingRight : STA.B DP_Temp12

  .keepLeft:
    TYA : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W Enemy[1].var0,X : CMP.W #Function_KihunterWings_Attached : BNE .return
    LDA.B DP_Temp12 : STA.W Enemy[1].instList,X
    LDA.W #$0001 : STA.W Enemy[1].instTimer,X

  .return:
    RTL


;;; $F55A: Ki-hunter function - wingless - initial falling ;;;
Function_Kihunter_Wingless_InitialFalling:
    LDA.L Kihunter.YSubVelocity,X : STA.B DP_Temp12
    LDA.L Kihunter.YVelocity,X : STA.B DP_Temp14
    JSL MoveEnemyDownBy_14_12
    BCC .notCollidedWithBlock
    LDA.W #Function_Kihunter_Wingless_PrepareToHop : STA.W Kihunter.function,X
    RTL

  .notCollidedWithBlock:
    LDA.L Kihunter.YSubVelocity,X : CLC : ADC.W KihunterConstants_fallingAcceleration_hop : STA.L Kihunter.YSubVelocity,X
    LDA.L Kihunter.YVelocity,X : ADC.W KihunterConstants_fallingAcceleration_wingsClipped : STA.L Kihunter.YVelocity,X
    RTL


;;; $F58B: Ki-hunter function - wingless - prepare to hop ;;;
Function_Kihunter_Wingless_PrepareToHop:
    LDA.W #RTL_A8F5E3 : STA.W Kihunter.function,X
    LDA.W #$0000 : STA.L Kihunter.YSubVelocity,X
    LDA.W RandomNumberSeed : AND.W #$0001 : CLC : ADC.W #$FFF8 : STA.L Kihunter.YVelocity,X
    LDA.W Enemy.XPosition,X : CMP.W SamusXPosition : BPL .rightOfSamus
    LDA.W #$0000 : STA.L Kihunter.XSubVelocity,X
    LDA.W #$0002 : STA.L Kihunter.XVelocity,X
    LDA.W #InstList_Kihunter_Hop_FacingRight : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    RTL

  .rightOfSamus:
    LDA.W #$0000 : STA.L Kihunter.XSubVelocity,X
    LDA.W #$FFFE : STA.L Kihunter.XVelocity,X
    LDA.W #InstList_Kihunter_Hop_FacingLeft : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
; fallthrough to RTL_A8F5E3


RTL_A8F5E3:
    RTL


;;; $F5E4: Instruction - enemy function = hop ;;;
Instruction_Kihunter_SetFunctionToHop:
    PHX
    LDX.W EnemyIndex
    LDA.W #Function_Kihunter_Wingless_Hop : STA.W Kihunter.function,X
    PLX
    RTL


;;; $F5F0: Ki-hunter function - wingless - hop ;;;
Function_Kihunter_Wingless_Hop:
    LDA.L Kihunter.YSubVelocity,X : STA.B DP_Temp12
    LDA.L Kihunter.YVelocity,X : STA.B DP_Temp14
    JSL MoveEnemyDownBy_14_12
    BCS .collidedVertically
    LDA.L Kihunter.XSubVelocity,X : STA.B DP_Temp12
    LDA.L Kihunter.XVelocity,X : STA.B DP_Temp14
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCS .collidedHorizontally
    JSL AlignEnemyYPositionWIthNonSquareSlope
    LDA.L Kihunter.YSubVelocity,X : CLC : ADC.W KihunterConstants_fallingAcceleration_hop : STA.L Kihunter.YSubVelocity,X
    LDA.L Kihunter.YVelocity,X : ADC.W KihunterConstants_fallingAcceleration_wingsClipped : STA.L Kihunter.YVelocity,X
    RTL

  .collidedHorizontally:
    LDA.L Kihunter.XVelocity,X : EOR.W #$FFFF : INC : STA.L Kihunter.XVelocity,X
    RTL

  .collidedVertically:
    LDA.L Kihunter.YVelocity,X : BMI .hitCeiling
    LDA.W #$0000 : STA.L Kihunter.YSubVelocity,X
    LDA.W #$FFFC : STA.L Kihunter.YVelocity,X
    LDA.W #RTL_A8F5E3 : STA.W Kihunter.function,X
    LDA.W #$000C : STA.L Kihunter.thinkingTimer,X
    LDY.W #InstList_Kihunter_LandedFromHop_FacingLeft
    LDA.W Enemy.instList,X : CMP.W #InstList_Kihunter_Hop_FacingRight : BMI .keepLeft
    LDY.W #InstList_Kihunter_LandedFromHop_FacingRight

  .keepLeft:
    TYA : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    RTL

  .hitCeiling:
    LDA.W #$0001 : STA.L Kihunter.YVelocity,X
    RTL


;;; $F67F: Instruction - enemy function = wingless - thinking ;;;
Instruction_Kihunter_SetFunctionTo_Wingless_Thinking:
    PHX
    LDX.W EnemyIndex
    LDA.W #Function_Kihunter_Wingless_Thinking : STA.W Kihunter.function,X
    PLX
    RTL


;;; $F68B: Ki-hunter function - wingless - thinking ;;;
Function_Kihunter_Wingless_Thinking:
    LDA.L Kihunter.thinkingTimer,X : DEC : STA.L Kihunter.thinkingTimer,X : BNE .return
    LDY.W #Function_Kihunter_Wingless_PrepareToHop
    LDA.W Enemy.XPosition,X : SEC : SBC.W SamusXPosition : BPL +
    EOR.W #$FFFF : INC

+   CMP.W #$0060 : BPL .keepHop
    LDY.W #Function_Kihunter_Wingless_FireAcidSpit

  .keepHop:
    TYA : STA.W Kihunter.function,X

  .return:
    RTL


;;; $F6B3: Ki-hunter function - wingless - fire acid spit ;;;
Function_Kihunter_Wingless_FireAcidSpit:
    LDY.W #InstList_Kihunter_AcidSpitAttack_FacingLeft
    LDA.W Enemy.XPosition,X : CMP.W SamusXPosition : BPL .keepLeft
    LDY.W #InstList_Kihunter_AcidSpitAttack_FacingRight

  .keepLeft:
    TYA : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #RTL_A8F5E3 : STA.W Kihunter.function,X
    RTL


;;; $F6D2: Instruction - fire acid spit left ;;;
Instruction_Kihunter_FireAcidSpitLeft:
    PHY
    LDY.W #EnemyProjectile_KiHunterAcidSpit_Left
    BRA FireAcidSpit


;;; $F6D8: Instruction - fire acid spit right ;;;
Instruction_Kihunter_FireAcidSpitRight:
    PHY
    LDY.W #EnemyProjectile_KiHunterAcidSpit_Right
; fallthrough to FireAcidSpit


;;; $F6DC: Fire acid spit ;;;
FireAcidSpit:
;; Parameters:
;;     Y: Enemy projectile ID

; Expects a pushed instruction list pointer
    LDA.W #$004C
    JSL QueueSound_Lib2_Max6
    LDX.W EnemyIndex
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    LDA.W #$0018 : STA.L Kihunter.thinkingTimer,X
    PLY
    RTL


;;; $F6F3: Ki-hunter wings function - attached ;;;
Function_KihunterWings_Attached:
    LDA.W Enemy[-1].XPosition,X : STA.W Enemy.XPosition,X
    LDA.W Enemy[-1].YPosition,X : STA.W Enemy.YPosition,X
    RTL


;;; $F700: RTL ;;;
RTL_A8F700:
    RTL


;;; $F701: Enemy shot - enemy $EABF/$EB3F/$EBBF (ki-hunter) ;;;
EnemyShot_Kihunter:
    JSL NormalEnemyShotAI
    LDX.W EnemyIndex
    LDA.W Enemy.health,X : BEQ .dead
    CMP.W Enemy[1].init0,X : BEQ .clipWings
    BMI .clipWings
    LDA.W Enemy.AI,X : STA.W Enemy[1].AI,X
    LDA.W Enemy.freezeTimer,X : STA.W Enemy[1].freezeTimer,X
    LDA.W Enemy.invincibilityTimer,X : STA.W Enemy[1].invincibilityTimer,X
    LDA.W Enemy.flashTimer,X : STA.W Enemy[1].flashTimer,X

  .returnUpper:
    RTL

  .dead:
    LDA.W #$0200 : STA.W Enemy[1].properties,X
    RTL

  .clipWings:
    LDA.L Kihunter.winglessFlag,X : BNE .returnUpper
    LDA.W #$0001 : STA.L Kihunter.winglessFlag,X
    LDA.W #Function_Kihunter_Wingless_InitialFalling : STA.W Kihunter.function,X
    LDA.W #$0000 : STA.L Kihunter.YSubVelocity,X
    LDA.W #$0001 : STA.L Kihunter.YVelocity,X
    PHX
    TXA : CLC : ADC.W #$0040 : STA.W EnemyIndex
    TAX
    LDA.W KihunterWings.function,X : CMP.W #Function_KihunterWings_Falling : BEQ .returnLower
    LDA.W Enemy.YPosition,X : STA.L Kihunter.XVelocity,X
    LDA.W Enemy.XPosition,X : STA.L Kihunter.YSubVelocity,X
    JSR DetermineFallingKihunterWingsSpeedTableIndexResetValue
    JSR DetermineFallingKihunterWingsLeftArcCenterOffsets
    JSR DetermineFallingKihunterWingsRightArcCenterOffsets
    LDA.W #$E000 : STA.W KihunterWings.arcAngle,X
    LDA.W #Function_KihunterWings_Falling : STA.W KihunterWings.function,X
    LDA.W #Function_KihunterWings_Falling_DriftingLeft : STA.L KihunterWings.fallingFunction,X
    LDA.L Kihunter.XVelocity,X : SEC : SBC.L Kihunter.idleZoneBottomPosition,X : STA.L Kihunter.XSubVelocity,X
    LDA.W Enemy.XPosition,X : STA.L Kihunter.arcAngularSubAcceleration,X
    LDA.L KihunterWings.speedTableResetValue,X : STA.W KihunterWings.speedTableIndex,X
    LDA.W #InstList_KihunterWings_Falling : STA.W Enemy.instList,X
    LDA.W #Spritemap_Common_Nothing : STA.W Enemy.spritemap,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.W Enemy.properties,X : ORA.W #$0800 : STA.W Enemy.properties,X

  .returnLower:
    PLA : STA.W EnemyIndex
    RTL


;;; $F7CF: Ki-hunter wings function - falling ;;;
Function_KihunterWings_Falling:
    LDX.W EnemyIndex
    LDA.L KihunterWings.fallingFunction,X : STA.B DP_Temp12
    JMP.W (DP_Temp12)


;;; $F7DB: Ki-hunter wings falling function - drifting left ;;;
Function_KihunterWings_Falling_DriftingLeft:
    LDX.W EnemyIndex
    LDA.W KihunterWings.speedTableIndex,X : AND.W #$FF00 : XBA : ASL #3 : TAY
    LDA.W KihunterWings.arcAngle,X : CLC : ADC.W CommonEnemySpeeds_QuadraticallyIncreasing+5,Y : STA.W KihunterWings.arcAngle,X
    LDA.W KihunterConstants_fallingWingsArcRadius : AND.W #$00FF : STA.W Temp_Unknown0E32
    LDA.W KihunterWings.arcAngle,X : XBA : AND.W #$00FF
    JSL EightBitNegativeSineMultiplication_A0B0C6
    SEC : SBC.L KihunterWings.leftArcCenterYOffset,X
    CLC : ADC.L KihunterWings.arcStartYPosition,X : STA.W Enemy.YPosition,X
    LDA.W KihunterConstants_fallingWingsArcRadius : AND.W #$00FF : STA.W Temp_Unknown0E32
    LDA.W KihunterWings.arcAngle,X : XBA : AND.W #$00FF
    JSL EightBitCosineMultiplication_A0B0B2
    SEC : SBC.L KihunterWings.leftArcCenterXOffset,X
    CLC : ADC.L KihunterWings.arcStartXPosition,X : STA.W Enemy.XPosition,X
    LDA.W KihunterWings.arcAngle,X : CMP.W #$C000 : BPL +
    JSR SetupFallingKihunterWingsDriftingRight
    RTL

+   LDA.W KihunterWings.speedTableIndex,X : SEC : SBC.W #$0180 : BPL .return
    LDA.W #$0100

  .return:
    STA.W KihunterWings.speedTableIndex,X
    RTL


;;; $F851: Determine falling ki-hunter wings left arc centre offsets ;;;
DetermineFallingKihunterWingsLeftArcCenterOffsets:
    LDX.W EnemyIndex
    LDA.W KihunterConstants_fallingWingsArcRadius : AND.W #$00FF : STA.W Temp_Unknown0E32
    LDA.W #$E000 : XBA ; >.<
    JSL EightBitCosineMultiplication_A0B0B2
    STA.L KihunterWings.leftArcCenterXOffset,X
    LDA.W KihunterConstants_fallingWingsArcRadius : AND.W #$00FF : STA.W Temp_Unknown0E32
    LDA.W #$E000 : XBA ; >.<
    JSL EightBitNegativeSineMultiplication_A0B0C6
    STA.L KihunterWings.leftArcCenterYOffset,X
    RTS


;;; $F87F: Determine falling ki-hunter wings right arc centre offsets ;;;
DetermineFallingKihunterWingsRightArcCenterOffsets:
    LDX.W EnemyIndex
    LDA.W KihunterConstants_fallingWingsArcRadius : AND.W #$00FF : STA.W Temp_Unknown0E32
    LDA.W #$A000 : XBA ; >.<
    JSL EightBitCosineMultiplication_A0B0B2
    STA.L KihunterWings.rightArcCenterXOffset,X
    LDA.W KihunterConstants_fallingWingsArcRadius : AND.W #$00FF : STA.W Temp_Unknown0E32
    LDA.W #$A000 : XBA ; >.<
    JSL EightBitNegativeSineMultiplication_A0B0C6
    STA.L KihunterWings.rightArcCenterYOffset,X
    RTS


;;; $F8AD: Ki-hunter wings falling function - drifting right ;;;
Function_KihunterWings_Falling_DriftingRight:
    LDX.W EnemyIndex
    LDA.W KihunterWings.speedTableIndex,X : AND.W #$FF00 : XBA : ASL #3 : TAY
    LDA.W KihunterWings.arcAngle,X : CLC : ADC.W CommonEnemySpeeds_QuadraticallyIncreasing+1,Y : STA.W KihunterWings.arcAngle,X
    LDA.W KihunterConstants_fallingWingsArcRadius : AND.W #$00FF : STA.W Temp_Unknown0E32
    LDA.W KihunterWings.arcAngle,X : XBA : AND.W #$00FF
    JSL EightBitNegativeSineMultiplication_A0B0C6
    SEC : SBC.L KihunterWings.rightArcCenterYOffset,X
    CLC : ADC.L KihunterWings.arcStartYPosition,X
    SEC : SBC.W Enemy.YPosition,X : STA.B DP_Temp14
    STZ.B DP_Temp12
    JSL MoveEnemyDownBy_14_12
    BCS .collidedVertically
    LDA.W KihunterConstants_fallingWingsArcRadius : AND.W #$00FF : STA.W Temp_Unknown0E32
    LDA.W KihunterWings.arcAngle,X : XBA : AND.W #$00FF
    JSL EightBitCosineMultiplication_A0B0B2
    SEC : SBC.L KihunterWings.rightArcCenterXOffset,X
    CLC : ADC.L KihunterWings.arcStartXPosition,X : STA.W Enemy.XPosition,X
    LDA.W KihunterWings.arcAngle,X : CMP.W #$C000 : BMI +
    JSR SetupFallingKihunterWingsDriftingLeft
    RTL

+   LDA.W KihunterWings.speedTableIndex,X : SEC : SBC.W #$0180 : BPL .return
    LDA.W #$0100

  .return:
    STA.W KihunterWings.speedTableIndex,X
    RTL

  .collidedVertically:
    LDA.W Enemy.properties,X : ORA.W #$0200 : STA.W Enemy.properties,X
    LDA.L KihunterWings.fallStartYPosition,X : STA.W Enemy.XPosition,X
    LDA.L KihunterWings.fallStartXPosition,X : STA.W Enemy.YPosition,X
    BRA .return


;;; $F947: Set up falling ki-hunter wings drifting left ;;;
SetupFallingKihunterWingsDriftingLeft:
    LDA.W #Function_KihunterWings_Falling_DriftingLeft : STA.L KihunterWings.fallingFunction,X
    LDA.L KihunterWings.speedTableResetValue,X : STA.W KihunterWings.speedTableIndex,X
    LDA.W #$E000 : STA.W KihunterWings.arcAngle,X
    LDA.W Enemy.XPosition,X : STA.L KihunterWings.arcStartXPosition,X
    LDA.W Enemy.YPosition,X : STA.L KihunterWings.arcStartYPosition,X
    RTS


;;; $F96A: Set up falling ki-hunter wings drifting right ;;;
SetupFallingKihunterWingsDriftingRight:
    LDA.W #Function_KihunterWings_Falling_DriftingRight : STA.L KihunterWings.fallingFunction,X
    LDA.L KihunterWings.speedTableResetValue,X : STA.W KihunterWings.speedTableIndex,X
    LDA.W #$A000 : STA.W KihunterWings.arcAngle,X
    LDA.W Enemy.XPosition,X : STA.L KihunterWings.arcStartXPosition,X
    LDA.W Enemy.YPosition,X : STA.L KihunterWings.arcStartYPosition,X
    RTS


;;; $F98D: Determine falling ki-hunter wings speed table index reset value ;;;
DetermineFallingKihunterWingsSpeedTableIndexResetValue:
    LDX.W EnemyIndex
    LDA.W #$0000 : STA.L KihunterWings.speedTableResetValue,X : STA.W KihunterWings.speedTableIndex,X

  .loop:
    LDA.L KihunterWings.speedTableResetValue,X : CLC : ADC.W #$0180 : STA.L KihunterWings.speedTableResetValue,X
    AND.W #$FF00 : XBA : ASL #3 : TAY
    LDA.W KihunterWings.angleAccumulator,X : CLC : ADC.W CommonEnemySpeeds_QuadraticallyIncreasing+1,Y : STA.W KihunterWings.angleAccumulator,X
    CMP.W #$2000 : BMI .loop
    RTS


Freespace_BankA8_F9BE:
; $642 bytes
