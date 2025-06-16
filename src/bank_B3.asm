
org $B38000


; Common to all enemy code banks

;;; $8000: Grapple AI - no interaction. Also unfreezes enemies(!) ;;;
CommonB3_GrappleAI_NoInteraction:
; Used by skultera, Draygon body, fire arc, Phantoon, etecoon, dachora and WS ghost
    JSL GrappleAI_SwitchEnemyAIToMainAI
    RTL


;;; $8005: Grapple AI - Samus latches on ;;;
CommonB3_GrappleAI_SamusLatchesOn:
; Used by gripper and Crocomire
    JSL GrappleAI_SamusLatchesOnWithGrapple
    RTL


;;; $800A: Grapple AI - kill enemy ;;;
CommonB3_GrappleAI_KillEnemy:
; Common
    JSL GrappleAI_EnemyGrappleDeath
    RTL


;;; $800F: Grapple AI - cancel grapple beam ;;;
CommonB3_GrappleAI_CancelGrappleBeam:
; Common
    JSL GrappleAI_SwitchToFrozenAI
    RTL


;;; $8014: Grapple AI - Samus latches on - no invincibility ;;;
CommonB3_GrappleAI_SamusLatchesOn_NoInvincibility:
; Used by powamp
    JSL GrappleAI_SamusLatchesOnWithGrapple_NoInvincibility
    RTL


;;; $8019: Unused. Grapple AI - Samus latches on - paralyse enemy ;;;
UNUSED_CommonB3_GrappleAI_SamusLatchesOn_ParalyzeEnemy_B38019:
    JSL GrappleAI_SamusLatchesOnWithGrapple_ParalyzeEnemy
    RTL


;;; $801E: Grapple AI - hurt Samus ;;;
CommonB3_GrappleAI_HurtSamus:
; Used by WS spark
; Hurt reaction happens in $9B:B932
    JSL GrappleAI_SwitchToFrozenAI_duplicate
    RTL


;;; $8023: Normal enemy touch AI ;;;
CommonB3_NormalEnemyTouchAI:
    JSL NormalEnemyTouchAI
    RTL


;;; $8028: Normal touch AI - no death check ;;;
CommonB3_NormalTouchAI_NoDeathCheck:
    JSL NormalEnemyTouchAI_NoDeathCheck_External
    RTL


;;; $802D: Normal enemy shot AI ;;;
CommonB3_NormalEnemyShotAI:
    JSL NormalEnemyShotAI
    RTL


;;; $8032: Normal enemy shot AI - no death check, no enemy shot graphic ;;;
CommonB3_NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic:
    JSL NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External
    RTL


;;; $8037: Normal enemy power bomb AI ;;;
CommonB3_NormalEnemyPowerBombAI:
    JSL NormalEnemyPowerBombAI
    RTL


;;; $803C: Normal enemy power bomb AI - no death check ;;;
CommonB3_NormalEnemyPowerBombAI_NoDeathCheck:
; Kraid's power bomb AI
    JSL NormalEnemyPowerBombAI_NoDeathCheck_External
    RTL


;;; $8041: Normal enemy frozen AI ;;;
CommonB3_NormalEnemyFrozenAI:
    JSL NormalEnemyFrozenAI
    RTL


;;; $8046: Creates a dud shot ;;;
CommonB3_CreateADudShot:
    JSL CreateADudShot
    RTL


;;; $804B: RTS ;;;
RTS_B3804B:
    RTS


;;; $804C: RTL ;;;
RTL_B3804C:
    RTL


;;; $804D: Spritemap - nothing ;;;
Spritemap_CommonB3_Nothing:
    dw $0000


;;; $804F: Extended spritemap - nothing ;;;
ExtendedSpritemap_CommonB3_Nothing:
    dw $0001
    dw $0000,$0000
    dw Spritemap_CommonB3_Nothing
    dw Hitbox_CommonB3_Nothing


;;; $8059: Hitbox - nothing ;;;
Hitbox_CommonB3_Nothing:
; [n entries] [[left offset] [top offset] [right offset] [bottom offset] [p touch] [p shot]]...
    dw $0001
    dw $0000,$0000,$0000,$0000
    dw CommonB3_NormalEnemyTouchAI
    dw CommonB3_NormalEnemyShotAI


;;; $8067: Instruction list - delete enemy ;;;
InstList_CommonB3_DeleteEnemy:
    dw Instruction_CommonB3_DeleteEnemy


;;; $8069: Two NOPs ;;;
NOPNOP_B38069:
; Used as palette by respawning enemy placeholder and Draygon's eye o_O
    NOP #2


;;; $806B: Instruction - Enemy.var5 = [[Y]] ;;;
Instruction_CommonB3_Enemy0FB2_InY:
; Used only by torizos (for enemy movement function) and escape etecoon (for enemy function)
    LDA.W $0000,Y : STA.W Enemy.var5,X
    INY #2
    RTL


;;; $8074: Instruction - Enemy.var5 = RTS ;;;
Instruction_CommonB3_SetEnemy0FB2ToRTS:
    LDA.W #RTS_B3807B : STA.W Enemy.var5,X
    RTL


RTS_B3807B:
    RTS


;;; $807C: Instruction - delete enemy ;;;
Instruction_CommonB3_DeleteEnemy:
    LDA.W Enemy.properties,X : ORA.W #$0200 : STA.W Enemy.properties,X
    PLA
    PEA.W ProcessEnemyInstructions_return-1
    RTL


;;; $808A: Instruction - call function [[Y]] ;;;
Instruction_CommonB3_CallFunctionInY:
    LDA.W $0000,Y : STA.B DP_Temp12
    PHY : PHX
    PEA .manualReturn-1
    JMP.W (DP_Temp12)

  .manualReturn:
    PLX : PLY
    INY #2
    RTL


;;; $809C: Instruction - call function [[Y]] with A = [[Y] + 2] ;;;
Instruction_CommonB3_CallFunctionInY_WithA:
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
UNUSED_Instruction_CommonB3_CallExternalFunctionInY_B380B5:
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
UNUSED_Inst_CommonB3_CallExternalFunctionInY_WithA_B380CE:
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
Instruction_CommonB3_GotoY:
    LDA.W $0000,Y : TAY
    RTL


;;; $80F2: Instruction - go to [[Y]] + ±[[Y]] ;;;
Instruction_CommonB3_GotoY_PlusY:
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
Instruction_CommonB3_DecrementTimer_GotoYIfNonZero:
    DEC.W Enemy.loopCounter,X : BNE Instruction_CommonB3_GotoY
    INY #2
    RTL


;;; $8110: Instruction - decrement timer and go to [[Y]] if non-zero ;;;
Instruction_CommonB3_DecrementTimer_GotoYIfNonZero_duplicate:
    DEC.W Enemy.loopCounter,X : BNE Instruction_CommonB3_GotoY
    INY #2
    RTL


;;; $8118: Instruction - decrement timer and go to [Y] + ±[[Y]] if non-zero ;;;
Instruction_CommonB3_DecrementTimer_GotoY_PlusY_IfNonZero:
    SEP #$20
    DEC.W Enemy.loopCounter,X
    REP #$20
    BNE Instruction_CommonB3_GotoY_PlusY
    INY
    RTL


;;; $8123: Instruction - timer = [[Y]] ;;;
Instruction_CommonB3_TimerInY:
    LDA.W $0000,Y : STA.W Enemy.loopCounter,X
    INY #2
    RTL


;;; $812C: Instruction - skip next instruction ;;;
Instruction_CommonB3_SkipNextInstruction:
    INY #2
    RTL


;;; $812F: Instruction - sleep ;;;
Instruction_CommonB3_Sleep:
    DEY #2
    TYA : STA.W Enemy.instList,X
    PLA
    PEA.W ProcessEnemyInstructions_return-1
    RTL


;;; $813A: Instruction - wait [[Y]] frames ;;;
Instruction_CommonB3_WaitYFrames:
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
Instruction_CommonB3_TransferYBytesInYToVRAM:
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
Instruction_CommonB3_EnableOffScreenProcessing:
    LDA.W Enemy.properties,X : ORA.W #$0800 : STA.W Enemy.properties,X
    RTL


;;; $817D: Instruction - disable off-screen processing ;;;
Instruction_CommonB3_DisableOffScreenProcessing:
    LDA.W Enemy.properties,X : AND.W #$F7FF : STA.W Enemy.properties,X
    RTL


;;; $8187: Common enemy speeds - linearly increasing ;;;
CommonB3EnemySpeeds_LinearlyIncreasing:
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
CommonB3EnemySpeeds_QuadraticallyIncreasing:
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


;;; $8687: Palette - enemy $F153 (unused spinning turtle eye) ;;;
UNUSED_Palette_SpinningTurtleEye_B38687:
    dw $3800,$4FE9,$4266,$3D85,$20A3,$52FC,$41F7,$30D2
    dw $240E,$325F,$31DB,$3156,$30D2,$302C,$7FBD,$0C05


;;; $86A7: Instruction list - initial ;;;
UNUSED_InstList_SpinningTurtleEye_Initial_B386A7:
    dw $000A,UNUSED_Spritemaps_SpinningTurtleEye_0_B38714
    dw $000A,UNUSED_Spritemaps_SpinningTurtleEye_1_B3871B
    dw $000A,UNUSED_Spritemaps_SpinningTurtleEye_2_B38722
    dw $000A,UNUSED_Spritemaps_SpinningTurtleEye_3_B38729
    dw $000A,UNUSED_Spritemaps_SpinningTurtleEye_4_B38730
    dw $000A,UNUSED_Spritemaps_SpinningTurtleEye_5_B38737
    dw $000A,UNUSED_Spritemaps_SpinningTurtleEye_6_B3873E
    dw $000A,UNUSED_Spritemaps_SpinningTurtleEye_7_B38745
    dw Instruction_Common_GotoY
    dw UNUSED_InstList_SpinningTurtleEye_Initial_B386A7


if !FEATURE_KEEP_UNREFERENCED
;;; $86CB: Unused. Instruction list ;;;
UNUSED_InstList_SpinningTurtleEye_B386CB:
    dw $0008,UNUSED_Spritemaps_SpinningTurtleEye_8_B3874C
    dw $0008,UNUSED_Spritemaps_SpinningTurtleEye_9_B38753
    dw $0008,UNUSED_Spritemaps_SpinningTurtleEye_A_B3875A
    dw Instruction_Common_GotoY
    dw UNUSED_InstList_SpinningTurtleEye_B386CB


;;; $86DB: Unused. Instruction list ;;;
UNUSED_InstList_SpinningTurtleEye_B386DB:
    dw $0008,UNUSED_Spritemaps_SpinningTurtleEye_B_B38761
    dw $0008,UNUSED_Spritemaps_SpinningTurtleEye_C_B38768
    dw $0008,UNUSED_Spritemaps_SpinningTurtleEye_D_B3876F
    dw Instruction_Common_GotoY
    dw UNUSED_InstList_SpinningTurtleEye_B386DB


;;; $86EB: Unused. Instruction list ;;;
UNUSED_InstList_SpinningTurtleEye_B386EB:
    dw $0008,UNUSED_Spritemaps_SpinningTurtleEye_E_B38776
    dw $0008,UNUSED_Spritemaps_SpinningTurtleEye_F_B3877D
    dw $0008,UNUSED_Spritemaps_SpinningTurtleEye_10_B38784
    dw Instruction_Common_GotoY
    dw UNUSED_InstList_SpinningTurtleEye_B386EB
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $86FB: Initialisation AI - enemy $F153 (unused spinning turtle eye) ;;;
UNUSED_InitAI_SpinningTurtleEye_B386FB:
    LDX.W EnemyIndex
    LDA.W Enemy.properties,X : ORA.W #$2000 : STA.W Enemy.properties,X
    LDA.W #UNUSED_InstList_SpinningTurtleEye_Initial_B386A7 : STA.W Enemy.instList,X
    RTL


;;; $870E: Main AI - enemy $F153 (unused spinning turtle eye) ;;;
UNUSED_MainAI_SpinningTurtleEye_B3870E:
    LDX.W EnemyIndex
    RTL


;;; $8712: RTL ;;;
RTL_B38712:
    RTL


;;; $8713: RTL ;;;
RTL_B38713:
    RTL


;;; $8714: Unused spinning turtle eye spritemaps ;;;
UNUSED_Spritemaps_SpinningTurtleEye_0_B38714:
    dw $0001
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 1, $100)

UNUSED_Spritemaps_SpinningTurtleEye_1_B3871B:
    dw $0001
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 1, $101)

UNUSED_Spritemaps_SpinningTurtleEye_2_B38722:
    dw $0001
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 1, $102)

UNUSED_Spritemaps_SpinningTurtleEye_3_B38729:
    dw $0001
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 1, $103)

UNUSED_Spritemaps_SpinningTurtleEye_4_B38730:
    dw $0001
    %spritemapEntry(0, $1F8, $F8, 1, 1, 3, 1, $100)

UNUSED_Spritemaps_SpinningTurtleEye_5_B38737:
    dw $0001
    %spritemapEntry(0, $1F8, $F8, 1, 1, 3, 1, $101)

UNUSED_Spritemaps_SpinningTurtleEye_6_B3873E:
    dw $0001
    %spritemapEntry(0, $1F8, $F8, 1, 1, 3, 1, $102)

UNUSED_Spritemaps_SpinningTurtleEye_7_B38745:
    dw $0001
    %spritemapEntry(0, $1F8, $F8, 1, 1, 3, 1, $103)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemaps_SpinningTurtleEye_8_B3874C:
    dw $0001
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 1, $104)

UNUSED_Spritemaps_SpinningTurtleEye_9_B38753:
    dw $0001
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 1, $105)

UNUSED_Spritemaps_SpinningTurtleEye_A_B3875A:
    dw $0001
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 1, $106)

UNUSED_Spritemaps_SpinningTurtleEye_B_B38761:
    dw $0001
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 1, $107)

UNUSED_Spritemaps_SpinningTurtleEye_C_B38768:
    dw $0001
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 1, $108)

UNUSED_Spritemaps_SpinningTurtleEye_D_B3876F:
    dw $0001
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 1, $109)

UNUSED_Spritemaps_SpinningTurtleEye_E_B38776:
    dw $0001
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 1, $10A)

UNUSED_Spritemaps_SpinningTurtleEye_F_B3877D:
    dw $0001
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 1, $10B)

UNUSED_Spritemaps_SpinningTurtleEye_10_B38784:
    dw $0001
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 1, $10C)
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $878B: Palette - enemy $F193 (zeb) ;;;
Palette_Zeb:
    dw $3800,$021D,$0015,$0008,$0003,$00BD,$0013,$000E
    dw $000B,$7F5A,$7EC0,$6DE0,$54E0,$03E0,$02A0,$0140


;;; $87AB: Instruction list - facing left - rising ;;;
InstList_Zeb_FacingLeft_Rising:
    dw $0002,Spritemaps_Zeb_0
    dw $0002,Spritemaps_Zeb_1
    dw $0002,Spritemaps_Zeb_2
    dw $0002,Spritemaps_Zeb_3
    dw $0002,Spritemaps_Zeb_4
    dw $0002,Spritemaps_Zeb_3
    dw $0002,Spritemaps_Zeb_2
    dw $0002,Spritemaps_Zeb_1
    dw Instruction_Common_GotoY
    dw InstList_Zeb_FacingLeft_Rising


;;; $87CF: Instruction list - facing left - shooting ;;;
InstList_Zeb_FacingLeft_Shooting:
    dw $0001,Spritemaps_Zeb_0
    dw $0001,Spritemaps_Zeb_1
    dw $0001,Spritemaps_Zeb_3
    dw $0001,Spritemaps_Zeb_4
    dw $0001,Spritemaps_Zeb_3
    dw $0001,Spritemaps_Zeb_1
    dw Instruction_Common_GotoY
    dw InstList_Zeb_FacingLeft_Shooting


;;; $87EB: Instruction list - facing right - rising ;;;
InstList_Zeb_FacingRight_Rising:
    dw $0002,Spritemaps_Zeb_5
    dw $0002,Spritemaps_Zeb_6
    dw $0002,Spritemaps_Zeb_7
    dw $0002,Spritemaps_Zeb_8
    dw $0002,Spritemaps_Zeb_9
    dw $0002,Spritemaps_Zeb_8
    dw $0002,Spritemaps_Zeb_7
    dw $0002,Spritemaps_Zeb_6
    dw Instruction_Common_GotoY
    dw InstList_Zeb_FacingRight_Rising


;;; $880F: Instruction list - facing right - shooting ;;;
InstList_Zeb_FacingRight_Shooting:
    dw $0001,Spritemaps_Zeb_5
    dw $0001,Spritemaps_Zeb_6
    dw $0001,Spritemaps_Zeb_8
    dw $0001,Spritemaps_Zeb_9
    dw $0001,Spritemaps_Zeb_8
    dw $0001,Spritemaps_Zeb_6
    dw Instruction_Common_GotoY
    dw InstList_Zeb_FacingRight_Shooting


;;; $882B: Instruction list pointers - zeb ;;;
InstListPointers_Zeb:
    dw InstList_Zeb_FacingLeft_Rising
    dw InstList_Zeb_FacingLeft_Shooting
    dw InstList_Zeb_FacingRight_Rising
    dw InstList_Zeb_FacingRight_Shooting


;;; $8833: Instruction list pointers - zebbo ;;;
InstListPointers_Zebbo:
    dw InstList_Zebbo_FacingLeft_Rising
    dw InstList_Zebbo_FacingLeft_Shooting
    dw InstList_Zebbo_FacingRight_Rising
    dw InstList_Zebbo_FacingRight_Shooting


;;; $883B: Initialisation AI - enemy $F193/$F1D3 (zeb / zebbo) ;;;
InitAI_Zeb_Zebbo:
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : STA.W Zeb.spawnXPosition,X
    LDA.W Enemy.YPosition,X : STA.W Zeb.spawnYPosition,X
    SEC : SBC.W #$0010 : STA.L Zeb.targetYPosition,X
    LDA.W #Function_Zeb_Zebbo_WaitUntilOnScreen : STA.W Zeb.function,X
    LDA.W #$0030 : STA.W Zeb.spawnDelayTimer,X
    LDA.W #$0000 : STA.W Zeb.instListTableIndex,X : STA.L Zeb.previousInstListTableIndex,X
    LDA.W #InstList_Zeb_FacingLeft_Rising : STA.W Enemy.instList,X
    LDA.W Enemy.init0,X : BEQ .return
    LDA.W #InstList_Zebbo_FacingLeft_Rising : STA.W Enemy.instList,X

  .return:
    RTL


;;; $887A: Main AI - enemy $F193/$F1D3 (zeb / zebbo) ;;;
MainAI_Zeb_Zebbo:
    LDX.W EnemyIndex
    JMP.W (Zeb.function,X)


;;; $8880: Zeb/zebbo function - wait until on screen ;;;
Function_Zeb_Zebbo_WaitUntilOnScreen:
    LDX.W EnemyIndex ; >.<
    JSL CheckIfEnemyCenterIsOnScreen
    BNE .return
    LDA.W #Function_Zeb_Zebbo_WaitForSamusToGetNear : STA.W Zeb.function,X

  .return:
    RTL


;;; $8890: Zeb/zebbo function - wait for Samus to get near ;;;
Function_Zeb_Zebbo_WaitForSamusToGetNear:
    JSL Get_SamusY_minus_EnemyY
    BPL .return
    CMP.W #$FFA0 : BMI .return
    JSL Get_SamusX_minus_EnemyX
    TAY
    ROL.W Zeb.direction,X : ROL : ROR.W Zeb.direction,X
    LDA.W Enemy.XPosition,X : SEC : SBC.W SamusXPosition : BPL +
    EOR.W #$FFFF : INC

+   CMP.W #$0040 : BCC .close

  .return:
    RTL

  .close:
    LDA.W #Function_Zeb_Zebbo_Rising : STA.W Zeb.function,X
    LDA.W Enemy.properties,X : AND.W #$FEFF : STA.W Enemy.properties,X
    LDA.W #$0000 : STA.W Enemy.loopCounter,X
    BIT.W Zeb.direction,X : BMI .left
    LDA.W #$0002
    BRA +

  .left:
    LDA.W #$0000

+   STA.W Zeb.instListTableIndex,X
    JSR Set_Zeb_Zebbo_InstList
    RTL


;;; $88E3: Zeb/zebbo function - rising ;;;
Function_Zeb_Zebbo_Rising:
    LDA.W #$FFFF : CLC : ADC.W Enemy.YSubPosition,X : STA.W Enemy.YSubPosition,X
    LDA.W #$FFFE : ADC.W Enemy.YPosition,X : STA.W Enemy.YPosition,X
    LDA.L Zeb.targetYPosition,X : CMP.W Enemy.YPosition,X : BMI .return
    LDA.W Enemy.YPosition,X : CMP.W SamusYPosition : BCC .targetHeight
    BRA .return

  .targetHeight:
    LDA.W Zeb.instListTableIndex,X : ORA.W #$0001 : STA.W Zeb.instListTableIndex,X
    JSR Set_Zeb_Zebbo_InstList
    LDA.W #Function_Zeb_Zebbo_Shooting : STA.W Zeb.function,X

  .return:
    RTL


;;; $891C: Zeb/zebbo function - shooting ;;;
Function_Zeb_Zebbo_Shooting:
    BIT.W Zeb.direction,X : BPL .right
    LDA.W Enemy.XSubPosition,X : SEC : SBC.W #$0000 : STA.W Enemy.XSubPosition,X ; >.<
    LDA.W Enemy.XPosition,X : SBC.W #$0002 : STA.W Enemy.XPosition,X
    BRA .checkOnScreen

  .right:
    LDA.W #$0000 : CLC : ADC.W Enemy.XSubPosition,X : STA.W Enemy.XSubPosition,X
    LDA.W #$0002 : ADC.W Enemy.XPosition,X : STA.W Enemy.XPosition,X

  .checkOnScreen:
    JSL CheckIfEnemyIsHorizontallyOffScreen
    BCS .respawn
    RTL

  .respawn:
    LDA.W Zeb.spawnXPosition,X : STA.W Enemy.XPosition,X
    STZ.W Enemy.XSubPosition,X
    LDA.W Zeb.spawnYPosition,X : STA.W Enemy.YPosition,X : STA.W Enemy.YSubPosition,X
    STZ.W Zeb.instListTableIndex,X
    JSR Set_Zeb_Zebbo_InstList
    LDA.W Enemy.properties,X : ORA.W #$0100 : STA.W Enemy.properties,X
    LDA.W #$0030 : STA.W Zeb.spawnDelayTimer,X
    LDA.W #Function_Zeb_Zebbo_SpawnDelay : STA.W Zeb.function,X
    RTL


;;; $897E: Zeb/zebbo function - spawn delay ;;;
Function_Zeb_Zebbo_SpawnDelay:
    DEC.W Zeb.spawnDelayTimer,X : BEQ .doneWaiting
    RTL

  .doneWaiting:
    LDA.W #Function_Zeb_Zebbo_WaitForSamusToGetNear : STA.W Zeb.function,X
    RTL


;;; $898B: Set zeb/zebbo instruction list ;;;
Set_Zeb_Zebbo_InstList:
    LDX.W EnemyIndex
    LDA.W Zeb.instListTableIndex,X : CMP.L Zeb.previousInstListTableIndex,X : BEQ .return
    STA.L Zeb.previousInstListTableIndex,X
    ASL : TAY
    LDA.W Enemy.init0,X : BNE .zebbo
    LDA.W InstListPointers_Zeb,Y
    BRA +

  .zebbo:
    LDA.W InstListPointers_Zebbo,Y

+   STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X

  .return:
    RTS


;;; $89B7: Spritemaps ;;;
Spritemaps_Zeb_0:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $100)

Spritemaps_Zeb_1:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $102)

Spritemaps_Zeb_2:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $104)

Spritemaps_Zeb_3:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $106)

Spritemaps_Zeb_4:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $108)

Spritemaps_Zeb_5:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $100)

Spritemaps_Zeb_6:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $102)

Spritemaps_Zeb_7:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $104)

Spritemaps_Zeb_8:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $106)

Spritemaps_Zeb_9:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $108)


;;; $89FD: Palette - enemy $F1D3 (zebbo) ;;;
Palette_Zebbo:
    dw $3800,$3F95,$2E8B,$0120,$0060,$3AEE,$2249,$11A4
    dw $0962,$39BB,$30F5,$2C6E,$2827,$7F93,$6ECE,$6229


;;; $8A1D: Instruction list - facing left - rising ;;;
InstList_Zebbo_FacingLeft_Rising:
    dw $0002,Spritemaps_Zebbo_3
    dw $0001,Spritemaps_Zebbo_4
    dw $0002,Spritemaps_Zebbo_5
    dw $0001,Spritemaps_Zebbo_4
    dw Instruction_Common_GotoY
    dw InstList_Zebbo_FacingLeft_Rising


;;; $8A31: Instruction list - facing left - shooting ;;;
InstList_Zebbo_FacingLeft_Shooting:
    dw $0003,Spritemaps_Zebbo_0
    dw $0003,Spritemaps_Zebbo_1
    dw $0003,Spritemaps_Zebbo_2
    dw $0003,Spritemaps_Zebbo_1
    dw Instruction_Common_GotoY
    dw InstList_Zebbo_FacingLeft_Shooting


;;; $8A45: Instruction list - facing right - rising ;;;
InstList_Zebbo_FacingRight_Rising:
    dw $0002,Spritemaps_Zebbo_9
    dw $0001,Spritemaps_Zebbo_A
    dw $0002,Spritemaps_Zebbo_B
    dw $0001,Spritemaps_Zebbo_A
    dw Instruction_Common_GotoY
    dw InstList_Zebbo_FacingRight_Rising


;;; $8A59: Instruction list - facing right - shooting ;;;
InstList_Zebbo_FacingRight_Shooting:
    dw $0003,Spritemaps_Zebbo_6
    dw $0003,Spritemaps_Zebbo_7
    dw $0003,Spritemaps_Zebbo_8
    dw $0003,Spritemaps_Zebbo_7
    dw Instruction_Common_GotoY
    dw InstList_Zebbo_FacingRight_Shooting


;;; $8A6D: Spritemaps ;;;
Spritemaps_Zebbo_0:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $100)

Spritemaps_Zebbo_1:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $102)

Spritemaps_Zebbo_2:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $104)

Spritemaps_Zebbo_3:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $106)

Spritemaps_Zebbo_4:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $108)

Spritemaps_Zebbo_5:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10A)

Spritemaps_Zebbo_6:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $100)

Spritemaps_Zebbo_7:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $102)

Spritemaps_Zebbo_8:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $104)

Spritemaps_Zebbo_9:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $106)

Spritemaps_Zebbo_A:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $108)

Spritemaps_Zebbo_B:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $10A)


;;; $8AC1: Palette - enemy $F213 (gamet) ;;;
Palette_Gamet:
    dw $3800,$021D,$0015,$0008,$0003,$015F,$0076,$0050
    dw $000B,$7FFF,$56E0,$3180,$18C0,$43FF,$42DC,$4176


;;; $8AE1: Instruction list - facing left - rising ;;;
InstList_Gamet_FacingLeft_Rising:
    dw $0002,Spritemaps_Gamet_0
    dw $0002,Spritemaps_Gamet_1
    dw $0002,Spritemaps_Gamet_2
    dw $0002,Spritemaps_Gamet_3
    dw $0002,Spritemaps_Gamet_4
    dw $0002,Spritemaps_Gamet_3
    dw $0002,Spritemaps_Gamet_2
    dw $0002,Spritemaps_Gamet_1
    dw Instruction_Common_GotoY
    dw InstList_Gamet_FacingLeft_Rising


;;; $8B05: Instruction list - facing left - shooting ;;;
InstList_Gamet_FacingLeft_Shooting:
    dw $0001,Spritemaps_Gamet_0
    dw $0001,Spritemaps_Gamet_1
    dw $0001,Spritemaps_Gamet_3
    dw $0001,Spritemaps_Gamet_4
    dw $0001,Spritemaps_Gamet_3
    dw $0001,Spritemaps_Gamet_1
    dw Instruction_Common_GotoY
    dw InstList_Gamet_FacingLeft_Shooting


;;; $8B21: Instruction list - facing right - rising ;;;
InstList_Gamet_FacingRight_Rising:
    dw $0002,Spritemaps_Gamet_5
    dw $0002,Spritemaps_Gamet_6
    dw $0002,Spritemaps_Gamet_7
    dw $0002,Spritemaps_Gamet_8
    dw $0002,Spritemaps_Gamet_9
    dw $0002,Spritemaps_Gamet_8
    dw $0002,Spritemaps_Gamet_7
    dw $0002,Spritemaps_Gamet_6
    dw Instruction_Common_GotoY
    dw InstList_Gamet_FacingRight_Rising


;;; $8B45: Instruction list - facing right - shooting ;;;
InstList_Gamet_FacingRight_Shooting:
    dw $0001,Spritemaps_Gamet_5
    dw $0001,Spritemaps_Gamet_6
    dw $0001,Spritemaps_Gamet_8
    dw $0001,Spritemaps_Gamet_9
    dw $0001,Spritemaps_Gamet_8
    dw $0001,Spritemaps_Gamet_6
    dw Instruction_Common_GotoY
    dw InstList_Gamet_FacingRight_Shooting


;;; $8B61: Initialisation AI - enemy $F213 (gamet) ;;;
InitAI_Gamet:
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : STA.W Gamet.spawnXPosition,X
    LDA.W Enemy.YPosition,X : STA.W Gamet.spawnYPosition,X
    LDA.W Enemy.properties,X : ORA.W #$0100 : STA.W Enemy.properties,X
    LDA.W Enemy.init1+1,X : AND.W #$00FF : ASL #3 : STA.W Gamet.XSpeedTableIndex,X
    STZ.W Gamet.shootDelayTimer,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.W #InstList_Gamet_FacingLeft_Rising : STA.W Enemy.instList,X
    LDA.W #Function_Gamet_WaitUntilAllReady : STA.W Gamet.function,X
    RTL


;;; $8B9E: Main AI - enemy $F213 (gamet) ;;;
MainAI_Gamet:
    LDX.W EnemyIndex
    JSR.W (Gamet.function,X)
    JSR ResetEnemyIfOffScreen
    RTL


;;; $8BA8: Reset enemy if off-screen ;;;
ResetEnemyIfOffScreen:
    LDX.W EnemyIndex
    JSL CheckIfEnemyCenterIsOnScreen
    BEQ .return
    LDA.W Enemy.properties,X : ORA.W #$0100 : STA.W Enemy.properties,X
    LDA.W #Function_Gamet_WaitUntilAllReady : STA.W Gamet.function,X
    LDA.W Gamet.spawnXPosition,X : STA.W Enemy.XPosition,X
    LDA.W Gamet.spawnYPosition,X : STA.W Enemy.YPosition,X

  .return:
    RTS


;;; $8BCD: Gamet function - wait until everyone's ready ;;;
Function_Gamet_WaitUntilAllReady:
    LDX.W EnemyIndex ; >.<
    LDA.W Enemy.init1,X : AND.W #$00FF : BEQ .return
    LDA.W Enemy[1].var0,X : CMP.W #Function_Gamet_WaitUntilAllReady : BNE .return
    LDA.W Enemy[2].var0,X : CMP.W #Function_Gamet_WaitUntilAllReady : BNE .return
    LDA.W Enemy[3].var0,X : CMP.W #Function_Gamet_WaitUntilAllReady : BNE .return
    LDA.W Enemy[4].var0,X : CMP.W #Function_Gamet_WaitUntilAllReady : BNE .return
    LDA.W #Function_Gamet_WaitForSamusToGetNear : STA.W Gamet.function,X

  .return:
    RTS


;;; $8BFF: Gamet function - wait for Samus to get near ;;;
Function_Gamet_WaitForSamusToGetNear:
    LDX.W EnemyIndex ; >.<
    LDA.W Enemy.init1,X : AND.W #$00FF
    JSL IsSamusWithinAPixelColumnsOfEnemy
    BEQ .return
    LDA.W Enemy.YPosition,X : CMP.W SamusYPosition : BMI .return
    INC.W Gamet.shootDelayTimer,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    JSL Get_SamusX_minus_EnemyX
    BPL .facingRight
    LDA.W #InstList_Gamet_FacingLeft_Rising : STA.W Enemy.instList,X : STA.W Enemy[1].instList,X
    STA.W Enemy[2].instList,X : STA.W Enemy[3].instList,X : STA.W Enemy[4].instList,X
    BRA .setupFormation

  .facingRight:
    LDA.W #InstList_Gamet_FacingRight_Rising : STA.W Enemy.instList,X : STA.W Enemy[1].instList,X
    STA.W Enemy[2].instList,X : STA.W Enemy[3].instList,X : STA.W Enemy[4].instList,X

  .setupFormation:
    JSR SetupGametFormation

  .return:
    RTS


;;; $8C52: Set up Gamet formation ;;;
SetupGametFormation:
    LDA.W #Function_Gamet_Rising : STA.W Gamet.function,X : STA.W Enemy[1].var0,X
    STA.W Enemy[2].var0,X : STA.W Enemy[3].var0,X : STA.W Enemy[4].var0,X
    LDA.W #$0068 : STA.L Gamet.shootDelay,X
    LDA.W #$0060 : STA.L Gamet.shootDelay+$40,X
    LDA.W #$0058 : STA.L Gamet.shootDelay+$80,X
    LDA.W #$0070 : STA.L Gamet.shootDelay+$C0,X
    LDA.W #$0078 : STA.L Gamet.shootDelay+$100,X
    LDA.W #Function_Gamet_MoveToFormation_Center : STA.W Gamet.formationFunction,X
    LDA.W #Function_Gamet_MoveToFormation_UpperMiddle : STA.W Enemy[1].var5,X
    LDA.W #Function_Gamet_MoveToFormation_Top : STA.W Enemy[2].var5,X
    LDA.W #Function_Gamet_MoveToFormation_LowerMiddle : STA.W Enemy[3].var5,X
    LDA.W #Function_Gamet_MoveToFormation_Bottom : STA.W Enemy[4].var5,X
    RTS


;;; $8CA6: Gamet function - rising ;;;
Function_Gamet_Rising:
    LDX.W EnemyIndex ; >.<
    LDA.W Enemy.properties,X : AND.W #$FEFF : STA.W Enemy.properties,X
    LDA.W #$0080 : TAY
    LDA.W Enemy.YSubPosition,X : CLC : ADC.W CommonEnemySpeeds_LinearlyIncreasing+6,Y : BCC +
    INC.W Enemy.YPosition,X

+   STA.W Enemy.YSubPosition,X
    LDA.W Enemy.YPosition,X : CLC : ADC.W CommonEnemySpeeds_LinearlyIncreasing+4,Y : STA.W Enemy.YPosition,X
    CMP.W SamusYPosition : BPL .return
    LDA.W Gamet.formationFunction,X : STA.W Gamet.function,X
    LDA.W Enemy.YPosition,X : STA.L Gamet.formationCenterYPosition,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    JSL Get_SamusX_minus_EnemyX
    BPL .facingRight
    LDA.W #InstList_Gamet_FacingLeft_Rising : STA.W Enemy.instList,X
    BRA .return

  .facingRight:
    LDA.W #InstList_Gamet_FacingRight_Rising : STA.W Enemy.instList,X

  .return:
    RTS


;;; $8CFF: Gamet function - move to formation - center ;;;
Function_Gamet_MoveToFormation_Center:
    LDX.W EnemyIndex ; >.<
    INC.W Gamet.shootDelayTimer,X
    LDA.W #Function_Gamet_ShootDelay : STA.W Gamet.function,X
    RTS


;;; $8D0C: Gamet function - move to formation - upper middle ;;;
Function_Gamet_MoveToFormation_UpperMiddle:
    LDX.W EnemyIndex ; >.<
    INC.W Gamet.shootDelayTimer,X
    LDA.W #$0080 : TAY ; >.<
    LDA.W Enemy.YSubPosition,X : CLC : ADC.W CommonEnemySpeeds_LinearlyIncreasing+6,Y : BCC +
    INC.W Enemy.YPosition,X

+   STA.W Enemy.YSubPosition,X
    LDA.W Enemy.YPosition,X : CLC : ADC.W CommonEnemySpeeds_LinearlyIncreasing+4,Y : STA.W Enemy.YPosition,X
    CLC : ADC.W #$0010 : CMP.L Gamet.formationCenterYPosition,X : BPL .return
    LDA.L Gamet.formationCenterYPosition,X : SEC : SBC.W #$0010 : STA.W Enemy.YPosition,X
    STZ.W Enemy.YSubPosition,X
    LDA.W #Function_Gamet_ShootDelay : STA.W Gamet.function,X

  .return:
    RTS


;;; $8D4E: Gamet function - move to formation - top ;;;
Function_Gamet_MoveToFormation_Top:
    LDX.W EnemyIndex ; >.<
    INC.W Gamet.shootDelayTimer,X
    LDA.W #$0080 : TAY ; >.<
    LDA.W Enemy.YSubPosition,X : CLC : ADC.W CommonEnemySpeeds_LinearlyIncreasing+6,Y : BCC +
    INC.W Enemy.YPosition,X

+   STA.W Enemy.YSubPosition,X
    LDA.W Enemy.YPosition,X : CLC : ADC.W CommonEnemySpeeds_LinearlyIncreasing+4,Y : STA.W Enemy.YPosition,X
    CLC : ADC.W #$0020 : CMP.L Gamet.formationCenterYPosition,X : BPL .return
    LDA.L Gamet.formationCenterYPosition,X : SEC : SBC.W #$0020 : STA.W Enemy.YPosition,X
    STZ.W Enemy.YSubPosition,X
    LDA.W #Function_Gamet_ShootDelay : STA.W Gamet.function,X

  .return:
    RTS


;;; $8D90: Gamet function - move to formation - lower middle ;;;
Function_Gamet_MoveToFormation_LowerMiddle:
    LDX.W EnemyIndex ; >.<
    INC.W Gamet.shootDelayTimer,X
    LDA.W #$0080 : TAY ; >.<
    LDA.W Enemy.YSubPosition,X : CLC : ADC.W CommonEnemySpeeds_LinearlyIncreasing+2,Y : BCC +
    INC.W Enemy.YPosition,X

+   STA.W Enemy.YSubPosition,X
    LDA.W Enemy.YPosition,X : CLC : ADC.W CommonEnemySpeeds_LinearlyIncreasing,Y : STA.W Enemy.YPosition,X
    SEC : SBC.W #$0010 : CMP.L Gamet.formationCenterYPosition,X : BMI .return
    LDA.L Gamet.formationCenterYPosition,X : CLC : ADC.W #$0010 : STA.W Enemy.YPosition,X
    STZ.W Enemy.YSubPosition,X
    LDA.W #Function_Gamet_ShootDelay : STA.W Gamet.function,X

  .return:
    RTS


;;; $8DD2: Gamet function - move to formation - bottom ;;;
Function_Gamet_MoveToFormation_Bottom:
    LDX.W EnemyIndex ; >.<
    INC.W Gamet.shootDelayTimer,X
    LDA.W #$0080 : TAY ; >.<
    LDA.W Enemy.YSubPosition,X : CLC : ADC.W CommonEnemySpeeds_LinearlyIncreasing+2,Y : BCC +
    INC.W Enemy.YPosition,X

+   STA.W Enemy.YSubPosition,X
    LDA.W Enemy.YPosition,X : CLC : ADC.W CommonEnemySpeeds_LinearlyIncreasing,Y : STA.W Enemy.YPosition,X
    SEC : SBC.W #$0020 : CMP.L Gamet.formationCenterYPosition,X : BMI .return
    LDA.L Gamet.formationCenterYPosition,X : CLC : ADC.W #$0020 : STA.W Enemy.YPosition,X
    STZ.W Enemy.YSubPosition,X
    LDA.W #Function_Gamet_ShootDelay : STA.W Gamet.function,X

  .return:
    RTS


;;; $8E14: Gamet function - shooting left ;;;
Function_Gamet_ShootingLeft:
    LDX.W EnemyIndex ; >.<
    LDA.W Gamet.XSpeedTableIndex,X : TAY
    LDA.W Enemy.XSubPosition,X : CLC : ADC.W CommonEnemySpeeds_LinearlyIncreasing+6,Y : BCC +
    INC.W Enemy.XPosition,X

+   STA.W Enemy.XSubPosition,X
    LDA.W Enemy.XPosition,X : CLC : ADC.W CommonEnemySpeeds_LinearlyIncreasing+4,Y : STA.W Enemy.XPosition,X
    RTS


;;; $8E35: Gamet function - shooting right ;;;
Function_Gamet_ShootingRight:
    LDX.W EnemyIndex ; >.<
    LDA.W Gamet.XSpeedTableIndex,X : TAY
    LDA.W Enemy.XSubPosition,X : CLC : ADC.W CommonEnemySpeeds_LinearlyIncreasing+2,Y : BCC +
    INC.W Enemy.XPosition,X

+   STA.W Enemy.XSubPosition,X
    LDA.W Enemy.XPosition,X : CLC : ADC.W CommonEnemySpeeds_LinearlyIncreasing,Y : STA.W Enemy.XPosition,X
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $8E56: Unused. RTS ;;;
UNUSED_LoadEnemyIndex_B38E56:
    LDX.W EnemyIndex
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8E5A: Gamet function - shoot delay ;;;
Function_Gamet_ShootDelay:
    LDX.W EnemyIndex ; >.<
    INC.W Gamet.shootDelayTimer,X
    LDA.W Gamet.shootDelayTimer,X : CMP.L Gamet.shootDelay,X : BMI .return
    STZ.W Gamet.shootDelayTimer,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.W #Function_Gamet_ShootingLeft : STA.W Gamet.function,X
    LDA.W #InstList_Gamet_FacingLeft_Shooting : STA.W Enemy.instList,X
    JSL Get_SamusX_minus_EnemyX
    BMI .return
    LDA.W #Function_Gamet_ShootingRight : STA.W Gamet.function,X
    LDA.W #InstList_Gamet_FacingRight_Shooting : STA.W Enemy.instList,X

  .return:
    RTS


;;; $8E94: RTL ;;;
RTL_B38E94:
    RTL


;;; $8E95: RTL ;;;
RTL_B38E95:
    RTL


;;; $8E96: Spritemaps ;;;
Spritemaps_Gamet_0:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $100)

Spritemaps_Gamet_1:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $102)

Spritemaps_Gamet_2:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $104)

Spritemaps_Gamet_3:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $106)

Spritemaps_Gamet_4:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $108)

Spritemaps_Gamet_5:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $100)

Spritemaps_Gamet_6:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $102)

Spritemaps_Gamet_7:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $104)

Spritemaps_Gamet_8:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $106)

Spritemaps_Gamet_9:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $108)


;;; $8EDC: Palette - enemy $F253 (geega) ;;;
Palette_Geega:
    dw $3800,$57FF,$42F7,$158C,$00A5,$4F5A,$36B5,$2610
    dw $1DCE,$3FE0,$2EE0,$2200,$1100,$7E5B,$552F,$2887


;;; $8EFC: Instruction list - facing left - rising ;;;
InstList_Geega_FacingLeft_Rising:
    dw $0004,Spritemaps_Geega_0
    dw $0004,Spritemaps_Geega_1
    dw $0004,Spritemaps_Geega_2
    dw $0004,Spritemaps_Geega_1
    dw Instruction_Common_GotoY
    dw InstList_Geega_FacingLeft_Rising


;;; $8F10: Instruction list - facing left - shooting ;;;
InstList_Geega_FacingLeft_Shooting:
    dw $0001,Spritemaps_Geega_3
    dw $0001,Spritemaps_Geega_4
    dw $0001,Spritemaps_Geega_5
    dw $0001,Spritemaps_Geega_4
    dw Instruction_Common_GotoY
    dw InstList_Geega_FacingLeft_Shooting


;;; $8F24: Instruction list - facing right - rising ;;;
InstList_Geega_FacingRight_Rising:
    dw $0004,Spritemaps_Geega_6
    dw $0004,Spritemaps_Geega_7
    dw $0004,Spritemaps_Geega_8
    dw $0004,Spritemaps_Geega_7
    dw Instruction_Common_GotoY
    dw InstList_Geega_FacingRight_Rising


;;; $8F38: Instruction list - facing right - shooting ;;;
InstList_Geega_FacingRight_Shooting:
    dw $0001,Spritemaps_Geega_9
    dw $0001,Spritemaps_Geega_A
    dw $0001,Spritemaps_Geega_B
    dw $0001,Spritemaps_Geega_A
    dw Instruction_Common_GotoY
    dw InstList_Geega_FacingRight_Shooting


;;; $8F4C: Initialisation AI - enemy $F253 (geega) ;;;
InitAI_Geega:
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : STA.L Geega.spawnXPosition,X
    LDA.W Enemy.YPosition,X : STA.L Geega.spawnYPosition,X
    STZ.W Enemy.XSubPosition,X : STZ.W Enemy.YSubPosition,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.W #InstList_Geega_FacingLeft_Rising : STA.W Enemy.instList,X
    LDA.W Enemy.init0,X : BNE +
    LDA.W #InstList_Geega_FacingRight_Rising : STA.W Enemy.instList,X

+   LDA.W Enemy.init1,X : ASL #3 : TAY
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,Y : STA.L Geega.rightVelocity,X
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,Y : STA.L Geega.rightSubVelocity,X
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+4,Y : STA.L Geega.leftVelocity,X
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+6,Y : STA.L Geega.leftSubVelocity,X
    LDA.W #Function_Geega_WaitForSamusToGetNear : STA.W Geega.function,X
    LDA.W #$0000 : STA.L Geega.dipDisableFlag,X
    RTL


;;; $8FAE: Main AI - enemy $F253 (geega) ;;;
MainAI_Geega:
    LDX.W EnemyIndex
    JSR.W (Geega.function,X)
    RTL


;;; $8FB5: Geega function - wait for Samus to get near ;;;
Function_Geega_WaitForSamusToGetNear:
    LDX.W EnemyIndex ; >.<
    LDA.W Enemy.init0,X : BNE .leftwards
    JSL Get_SamusX_minus_EnemyX
    BMI .return
    CMP.W #$00C0 : BPL .return
    BRA +

  .leftwards:
    JSL Get_SamusX_minus_EnemyX
    BPL .return
    CMP.W #$FF40 : BMI .return

+   LDA.W #$0030
    JSL IsSamusWithingAPixelRowsOfEnemy
    BEQ .return
    LDA.W Enemy.properties,X : AND.W #$FEFF : STA.W Enemy.properties,X
    LDA.W #$0018 : STA.L Geega.shootDelayTimer,X
    LDA.W #Function_Geega_ShootDelay : STA.W Geega.function,X

  .return:
    RTS


;;; $8FF5: Geega function - shoot delay ;;;
Function_Geega_ShootDelay:
    LDA.L Geega.shootDelayTimer,X : DEC : STA.L Geega.shootDelayTimer,X : BEQ .timerExpired
    RTS

  .timerExpired:
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.W #InstList_Geega_FacingLeft_Rising : STA.W Enemy.instList,X
    LDA.W #Function_Geega_ShootingLeft : STA.W Geega.function,X
    LDA.W Enemy.init0,X : BNE .return
    LDA.W #InstList_Geega_FacingRight_Rising : STA.W Enemy.instList,X
    LDA.W #Function_Geega_ShootingRight : STA.W Geega.function,X

  .return:
    RTS


;;; $9028: Geega function - shooting left ;;;
Function_Geega_ShootingLeft:
    LDX.W EnemyIndex ; >.<
    JSR MoveGeegaLeft
    JSL CheckIfEnemyCenterIsOnScreen
    BEQ .onScreen
    LDA.L Geega.spawnXPosition,X : STA.W Enemy.XPosition,X
    LDA.L Geega.spawnYPosition,X : STA.W Enemy.YPosition,X
    STZ.W Enemy.XSubPosition,X : STZ.W Enemy.YSubPosition,X
    LDA.W #Function_Geega_WaitForSamusToGetNear : STA.W Geega.function,X
    LDA.W #$0000 : STA.L Geega.dipDisableFlag,X
    LDA.W Enemy.properties,X : ORA.W #$0100 : STA.W Enemy.properties,X
    BRA .return

  .onScreen:
    LDA.L Geega.dipDisableFlag,X : BNE .return
    LDA.W Enemy.XPosition,X : SEC : SBC.W SamusXPosition : CMP.W #$0030 : BPL .return
    LDA.W #Function_Geega_DippingLeft : STA.W Geega.function,X
    STZ.W Geega.XSubPosition,X : STZ.W Geega.YSubPosition,X
    LDA.W #$0028 : STA.W Geega.YSpeedTableIndex,X
    LDA.W #$0001 : STA.W Geega.dipDirection,X
    LDA.W Enemy.XPosition,X : STA.L ExtraEnemy7800+8,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.W #InstList_Geega_FacingLeft_Shooting : STA.W Enemy.instList,X

  .return:
    RTS


;;; $90A1: Move geega left ;;;
MoveGeegaLeft:
    LDA.W Enemy.XSubPosition,X : CLC : ADC.L Geega.leftSubVelocity,X : BCC +
    INC.W Enemy.XPosition,X

+   STA.W Enemy.XSubPosition,X
    LDA.W Enemy.XPosition,X : CLC : ADC.L Geega.leftVelocity,X : STA.W Enemy.XPosition,X
    RTS


;;; $90BD: Geega function - shooting right ;;;
Function_Geega_ShootingRight:
    LDX.W EnemyIndex ; >.<
    JSR MoveGeegaRight
    JSL CheckIfEnemyCenterIsOnScreen
    BEQ .onScreen
    LDA.L Geega.spawnXPosition,X : STA.W Enemy.XPosition,X
    LDA.L Geega.spawnYPosition,X : STA.W Enemy.YPosition,X
    STZ.W Enemy.XSubPosition,X : STZ.W Enemy.YSubPosition,X
    LDA.W #Function_Geega_WaitForSamusToGetNear : STA.W Geega.function,X
    LDA.W #$0000 : STA.L Geega.dipDisableFlag,X
    LDA.W Enemy.properties,X : ORA.W #$0100 : STA.W Enemy.properties,X
    BRA .return

  .onScreen:
    LDA.L Geega.dipDisableFlag,X : BNE .return
    LDA.W Enemy.XPosition,X : SEC : SBC.W SamusXPosition
    EOR.W #$FFFF : INC : CMP.W #$0030 : BPL .return
    LDA.W #Function_Geega_DippingRight : STA.W Geega.function,X
    STZ.W Geega.XSubPosition,X : STZ.W Geega.YSubPosition,X
    LDA.W #$0028 : STA.W Geega.YSpeedTableIndex,X
    LDA.W #$0001 : STA.W Geega.dipDirection,X
    LDA.W Enemy.XPosition,X : STA.L ExtraEnemy7800+8,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.W #InstList_Geega_FacingRight_Shooting : STA.W Enemy.instList,X

  .return:
    RTS


;;; $913A: Move geega right ;;;
MoveGeegaRight:
    LDA.W Enemy.var1,X : TAY
    LDA.W Enemy.XSubPosition,X : CLC : ADC.L Geega.rightSubVelocity,X : BCC +
    INC.W Enemy.XPosition,X

+   STA.W Enemy.XSubPosition,X
    LDA.W Enemy.XPosition,X : CLC : ADC.L Geega.rightVelocity,X : STA.W Enemy.XPosition,X
    RTS


;;; $915A: Geega function - dipping left ;;;
Function_Geega_DippingLeft:
    LDX.W EnemyIndex ; >.<
    JSL CheckIfEnemyCenterIsOnScreen
    BEQ .onScreen
    LDA.L Geega.spawnXPosition,X : STA.W Enemy.XPosition,X
    LDA.L Geega.spawnYPosition,X : STA.W Enemy.YPosition,X
    STZ.W Enemy.XSubPosition,X : STZ.W Enemy.YSubPosition,X
    LDA.W #Function_Geega_WaitForSamusToGetNear : STA.W Geega.function,X
    LDA.W #$0000 : STA.L Geega.dipDisableFlag,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.W #InstList_Geega_FacingLeft_Rising : STA.W Enemy.instList,X
    LDA.W Enemy.properties,X : ORA.W #$0100 : STA.W Enemy.properties,X
    JMP .return

  .onScreen:
    JSR MoveGeegaLeft
    LDA.W Geega.dipDirection,X : BNE .moveDown
    JSR MoveGeegaUp
    LDA.W Enemy.YPosition,X : CMP.L Geega.spawnYPosition,X : BPL .return
    LDA.W #$0001 : STA.L Geega.dipDisableFlag,X : STA.W Geega.dipDirection,X
    LDA.W #Function_Geega_ShootingLeft : STA.W Geega.function,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.W #InstList_Geega_FacingLeft_Rising : STA.W Enemy.instList,X
    BRA .return

  .moveDown:
    JSR MoveGeegaDown

  .return:
    RTS


;;; $91D8: Geega function - dipping right ;;;
Function_Geega_DippingRight:
    LDX.W EnemyIndex ; >.<
    JSL CheckIfEnemyCenterIsOnScreen
    BEQ .onScreen
    LDA.L Geega.spawnXPosition,X : STA.W Enemy.XPosition,X
    LDA.L Geega.spawnYPosition,X : STA.W Enemy.YPosition,X
    STZ.W Enemy.XSubPosition,X : STZ.W Enemy.YSubPosition,X
    LDA.W #Function_Geega_WaitForSamusToGetNear : STA.W Geega.function,X
    LDA.W #$0000 : STA.L Geega.dipDisableFlag,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.W #InstList_Geega_FacingRight_Rising : STA.W Enemy.instList,X
    LDA.W Enemy.properties,X : ORA.W #$0100 : STA.W Enemy.properties,X
    JMP .return

  .onScreen:
    JSR MoveGeegaRight
    LDA.W Geega.dipDirection,X : BNE .moveDown
    JSR MoveGeegaUp
    LDA.L Geega.spawnYPosition,X : CMP.W Enemy.YPosition,X : BMI .return
    LDA.W #$0001 : STA.L Geega.dipDisableFlag,X : STA.W Geega.dipDirection,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.W #InstList_Geega_FacingRight_Rising : STA.W Enemy.instList,X
    LDA.W #Function_Geega_ShootingRight : STA.W Geega.function,X
    BRA .return

  .moveDown:
    JSR MoveGeegaDown

  .return:
    RTS


;;; $9256: Move geega up ;;;
MoveGeegaUp:
    INC.W Geega.YSpeedTableIndex,X
    LDA.W Geega.YSpeedTableIndex,X : ASL #3 : TAY
    LDA.W Enemy.YSubPosition,X : CLC : ADC.W CommonEnemySpeeds_QuadraticallyIncreasing+4,Y : BCC +
    INC.W Enemy.YPosition,X

+   STA.W Enemy.YSubPosition,X
    LDA.W Enemy.YPosition,X : CLC : ADC.W CommonEnemySpeeds_QuadraticallyIncreasing+6,Y : STA.W Enemy.YPosition,X
    RTS


;;; $927A: Move geega down ;;;
MoveGeegaDown:
    DEC.W Geega.YSpeedTableIndex,X : BPL +
    LDA.W #$0000 : STA.W Geega.YSpeedTableIndex,X : STA.W Geega.dipDirection,X
    BRA .return

+   LDA.W Geega.YSpeedTableIndex,X : ASL #3 : TAY
    LDA.W Enemy.YSubPosition,X : CLC : ADC.W CommonEnemySpeeds_QuadraticallyIncreasing,Y : BCC +
    INC.W Enemy.YPosition,X

+   STA.W Enemy.YSubPosition,X
    LDA.W Enemy.YPosition,X : CLC : ADC.W CommonEnemySpeeds_QuadraticallyIncreasing+2,Y : STA.W Enemy.YPosition,X

  .return:
    RTS


;;; $92AB: RTL ;;;
RTL_B392AB:
    RTL


;;; $92AC: RTL ;;;
RTL_B392AC:
    RTL


;;; $92AD: Spritemaps ;;;
Spritemaps_Geega_0:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $100)

Spritemaps_Geega_1:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $102)

Spritemaps_Geega_2:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $104)

Spritemaps_Geega_3:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $106)

Spritemaps_Geega_4:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $108)

Spritemaps_Geega_5:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $10A)

Spritemaps_Geega_6:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 1, 2, 0, $100)

Spritemaps_Geega_7:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 1, 2, 0, $102)

Spritemaps_Geega_8:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 1, 2, 0, $104)

Spritemaps_Geega_9:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 1, 2, 0, $106)

Spritemaps_Geega_A:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 1, 2, 0, $108)

Spritemaps_Geega_B:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 1, 2, 0, $10A)


if !FEATURE_KEEP_UNREFERENCED
;;; $9301: Unused. Spritemap pointers ;;;
UNUSED_SpritemapPointers_Geega_B39301:
    dw Spritemaps_Geega_0
    dw Spritemaps_Geega_1
    dw Spritemaps_Geega_2
    dw Spritemaps_Geega_3
    dw Spritemaps_Geega_4
    dw Spritemaps_Geega_5
    dw Spritemaps_Geega_6
    dw Spritemaps_Geega_7
    dw Spritemaps_Geega_8
    dw Spritemaps_Geega_9
    dw Spritemaps_Geega_A
    dw Spritemaps_Geega_B
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $9319: Palette - enemy $F293 (Botwoon) ;;;
Palette_Botwoon:
    dw $0000,$27E9,$1A66,$1585,$0CA3,$3F9C,$2E97,$1D72
    dw $108E,$0A5F,$09DB,$0956,$08D2,$082C,$7FBD,$0C05


;;; $9339: Unused. Instruction list - mouth closed - aiming up (facing left) ;;;
InstList_Botwoon_MouthClosed_AimingUp_FacingLeft:
    dw Instruction_Botwoon_EnemyRadius_8x10
    dw $0001,Spritemaps_Botwoon_MouthClosed_Priority2_AimingUp_FacingLeft
    dw Instruction_Common_Sleep


;;; $9341: Instruction list - mouth closed - aiming up-left ;;;
InstList_Botwoon_MouthClosed_AimingUpLeft:
    dw Instruction_Botwoon_EnemyRadius_CxC
    dw $0001,Spritemaps_Botwoon_MouthClosed_Priority2_AimingUpLeft
    dw Instruction_Common_Sleep


;;; $9349: Instruction list - mouth closed - aiming left ;;;
InstList_Botwoon_MouthClosed_AimingLeft:
    dw Instruction_Botwoon_EnemyRadius_10x8
    dw $0001,Spritemaps_Botwoon_MouthClosed_Priority2_AimingLeft
    dw Instruction_Common_Sleep


;;; $9351: Instruction list - mouth closed - aiming down-left ;;;
InstList_Botwoon_MouthClosed_AimingDownLeft:
    dw Instruction_Botwoon_EnemyRadius_CxC_duplicate
    dw $0001,Spritemaps_Botwoon_MouthClosed_Priority2_AimingDownLeft
    dw Instruction_Common_Sleep


;;; $9359: Unused. Instruction list - mouth closed - aiming down (facing left) ;;;
UNSUED_InstList_Botwoon_MouthClosed_AimDown_FaceLeft_B39359:
    dw Instruction_Botwoon_EnemyRadius_8x10_duplicate
    dw $0001,Spritemaps_Botwoon_MouthClosed_Priority2_AimDown_FacingLeft
    dw Instruction_Common_Sleep


;;; $9361: Instruction list - mouth closed - aiming down (facing right) ;;;
InstList_Botwoon_MouthClosed_AimingDown_FacingRight:
    dw Instruction_Botwoon_EnemyRadius_8x10_duplicate_again
    dw $0001,Spritemaps_Botwoon_MouthClosed_Priority2_AimDown_FacingRight
    dw Instruction_Common_Sleep


;;; $9369: Instruction list - mouth closed - aiming down-right ;;;
InstList_Botwoon_MouthClosed_AimingDownRight:
    dw Instruction_Botwoon_EnemyRadius_CxC_duplicate_again
    dw $0001,Spritemaps_Botwoon_MouthClosed_Priority2_AimingDownRight
    dw Instruction_Common_Sleep


;;; $9371: Instruction list - mouth closed - aiming right ;;;
InstList_Botwoon_MouthClosed_AimingRight:
    dw Instruction_Botwoon_EnemyRadius_10x8_duplicate
    dw $0001,Spritemaps_Botwoon_MouthClosed_Priority2_AimingRight
    dw Instruction_Common_Sleep


;;; $9379: Instruction list - mouth closed - aiming up-right ;;;
InstList_Botwoon_MouthClosed_AimingUpRight:
    dw Instruction_Botwoon_EnemyRadius_CxC_duplicate_again2
    dw $0001,Spritemaps_Botwoon_MouthClosed_Priority2_AimingUpRight
    dw Instruction_Common_Sleep


;;; $9381: Instruction list - mouth closed - aiming up (facing right) ;;;
InstList_Botwoon_MouthClosed_AimingUp_FacingRight:
    dw Instruction_Botwoon_EnemyRadius_8x10_duplicate_again2
    dw $0001,Spritemaps_Botwoon_MouthClosed_Priority2_AimUp_FacingRight
    dw Instruction_Common_Sleep


;;; $9389: Instruction list - hide ;;;
InstList_Botwoon_Hide:
    dw $0001,Spritemap_Common_Nothing
    dw Instruction_Common_Sleep


;;; $938F: Unused. Instruction list - spit - aiming up (facing left) ;;;
UNSUED_InstList_Botwoon_Spit_AimingUp_FacingLeft:
    dw $0020,Spritemaps_Botwoon_MouthClosed_Priority2_AimingUp_FacingLeft
    dw Instruction_Botwoon_EnemyRadius_8x10
    dw Instruction_Botwoon_QueueSpitSFX
    dw Instruction_Botwoon_SetSpittingFlag
    dw $0010,Spritemaps_Botwoon_MouthOpen_Priority2_AimingUp_FacingLeft
    dw Instruction_Common_Sleep


;;; $939F: Instruction list - spit - aiming up-left ;;;
InstList_Botwoon_Spit_AimingUpLeft:
    dw $0020,Spritemaps_Botwoon_MouthClosed_Priority2_AimingUpLeft
    dw Instruction_Botwoon_EnemyRadius_CxC
    dw Instruction_Botwoon_QueueSpitSFX
    dw Instruction_Botwoon_SetSpittingFlag
    dw $0010,Spritemaps_Botwoon_MouthOpen_Priority2_AimingUpLeft
    dw Instruction_Common_Sleep


;;; $93AF: Instruction list - spit - aiming left ;;;
InstList_Botwoon_Spit_AimingLeft:
    dw $0020,Spritemaps_Botwoon_MouthClosed_Priority2_AimingLeft
    dw Instruction_Botwoon_EnemyRadius_10x8
    dw Instruction_Botwoon_QueueSpitSFX
    dw Instruction_Botwoon_SetSpittingFlag
    dw $0019,Spritemaps_Botwoon_MouthOpen_Priority2_AimingLeft
    dw Instruction_Common_Sleep


;;; $93BF: Instruction list - spit - aiming down-left ;;;
InstList_Botwoon_Spit_AimingDownLeft:
    dw $0020,Spritemaps_Botwoon_MouthClosed_Priority2_AimingDownLeft
    dw Instruction_Botwoon_EnemyRadius_CxC_duplicate
    dw Instruction_Botwoon_QueueSpitSFX
    dw Instruction_Botwoon_SetSpittingFlag
    dw $0010,Spritemaps_Botwoon_MouthOpen_Priority2_AimingDownLeft
    dw Instruction_Common_Sleep


if !FEATURE_KEEP_UNREFERENCED
;;; $93CF: Unused. Instruction list - spit - aiming down (facing left) ;;;
UNUSED_InstList_Botwoon_Spit_AimingDown_FacingLeft_B393CF:
    dw $0020,Spritemaps_Botwoon_MouthClosed_Priority2_AimDown_FacingLeft
    dw Instruction_Botwoon_EnemyRadius_8x10_duplicate
    dw Instruction_Botwoon_QueueSpitSFX
    dw Instruction_Botwoon_SetSpittingFlag
    dw $0010,Spritemaps_Botwoon_MouthOpen_Priority2_AimingDown_FacingLeft
    dw Instruction_Common_Sleep
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $93DF: Instruction list - spit - aiming down (facing right) ;;;
InstList_Botwoon_Spit_AimingDown_FacingRight:
    dw $0020,Spritemaps_Botwoon_MouthClosed_Priority2_AimDown_FacingRight
    dw Instruction_Botwoon_EnemyRadius_8x10_duplicate_again
    dw Instruction_Botwoon_QueueSpitSFX
    dw Instruction_Botwoon_SetSpittingFlag
    dw $0010,Spritemaps_Botwoon_MouthOpen_Priority2_AimDown_FacingRight
    dw Instruction_Common_Sleep


;;; $93EF: Instruction list - spit - aiming down-right ;;;
InstList_Botwoon_Spit_AimingDownRight:
    dw $0020,Spritemaps_Botwoon_MouthClosed_Priority2_AimingDownRight
    dw Instruction_Botwoon_EnemyRadius_CxC_duplicate_again
    dw Instruction_Botwoon_QueueSpitSFX
    dw Instruction_Botwoon_SetSpittingFlag
    dw $0010,Spritemaps_Botwoon_MouthOpen_Priority2_AimingDownRight
    dw Instruction_Common_Sleep


;;; $93FF: Instruction list - spit - aiming right ;;;
InstList_Botwoon_Spit_AimingRight:
    dw $0020,Spritemaps_Botwoon_MouthClosed_Priority2_AimingRight
    dw Instruction_Botwoon_EnemyRadius_10x8_duplicate
    dw Instruction_Botwoon_QueueSpitSFX
    dw Instruction_Botwoon_SetSpittingFlag
    dw $0010,Spritemaps_Botwoon_MouthOpen_Priority2_AimingRight
    dw Instruction_Common_Sleep


;;; $940F: Instruction list - spit - aiming up-right ;;;
InstList_Botwoon_Spit_AimingUpRight:
    dw $0020,Spritemaps_Botwoon_MouthClosed_Priority2_AimingUpRight
    dw Instruction_Botwoon_EnemyRadius_CxC_duplicate_again2
    dw Instruction_Botwoon_QueueSpitSFX
    dw Instruction_Botwoon_SetSpittingFlag
    dw $0010,Spritemaps_Botwoon_MouthOpen_Priority2_AimingUpRight
    dw Instruction_Common_Sleep


;;; $941F: Instruction list - spit - aiming up (facing right) ;;;
InstList_Botwoon_Spit_AimingUp_FacingRight:
    dw $0020,Spritemaps_Botwoon_MouthClosed_Priority2_AimUp_FacingRight
    dw Instruction_Botwoon_EnemyRadius_8x10_duplicate_again2
    dw Instruction_Botwoon_QueueSpitSFX
    dw Instruction_Botwoon_SetSpittingFlag
    dw $0010,Spritemaps_Botwoon_MouthOpen_Priority2_AimingUp_FacingRight
    dw Instruction_Common_Sleep


if !FEATURE_KEEP_UNREFERENCED
;;; $942F: Unused. Instruction list - hidden - aiming up (facing left) ;;;
UNUSED_InstList_Botwoon_Hidden_AimingUp_FacingLeft_B3942F:
    dw $0001,Spritemaps_Botwoon_MouthClosed_Priority0_AimingUp_FacingLeft
    dw Instruction_Common_Sleep
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $9435: Instruction list - hidden - aiming up-left ;;;
InstList_Botwoon_Hidden_AimingUpLeft:
    dw $0001,Spritemaps_Botwoon_MouthClosed_Priority0_AimingUpLeft
    dw Instruction_Common_Sleep


;;; $943B: Instruction list - hidden - aiming left ;;;
InstList_Botwoon_Hidden_AimingLeft:
    dw $0001,Spritemaps_Botwoon_MouthClosed_Priority0_AimingLeft
    dw Instruction_Common_Sleep


;;; $9441: Instruction list - hidden - aiming down-left ;;;
InstList_Botwoon_Hidden_AimingDownLeft:
    dw $0001,Spritemaps_Botwoon_MouthClosed_Priority0_AimingDownLeft
    dw Instruction_Common_Sleep


if !FEATURE_KEEP_UNREFERENCED
;;; $9447: Unused. Instruction list - hidden - aiming down (facing left) ;;;
UNUSED_InstList_Botwoon_Hidden_AimingDown_FacingLeft_B39447:
    dw $0001,Spritemaps_Botwoon_MouthClosed_Priority0_AimDown_FacingLeft
    dw Instruction_Common_Sleep
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $944D: Instruction list - hidden - aiming down (facing right) ;;;
InstList_Botwoon_Hidden_AimingDown_FacingRight:
    dw $0001,Spritemaps_Botwoon_MouthClosed_Priority0_AimDown_FacingRight
    dw Instruction_Common_Sleep


;;; $9453: Instruction list - hidden - aiming down-right ;;;
InstList_Botwoon_Hidden_AimingDownRight:
    dw $0001,Spritemaps_Botwoon_MouthClosed_Priority0_AimingDownRight
    dw Instruction_Common_Sleep


;;; $9459: Instruction list - hidden - aiming right ;;;
InstList_Botwoon_Hidden_AimingRight:
    dw $0001,Spritemaps_Botwoon_MouthClosed_Priority0_AimingRight
    dw Instruction_Common_Sleep


;;; $945F: Instruction list - hidden - aiming up-right ;;;
InstList_Botwoon_Hidden_AimingUpRight:
    dw $0001,Spritemaps_Botwoon_MouthClosed_Priority0_AimingUpRight
    dw Instruction_Common_Sleep


;;; $9465: Instruction list - hidden - aiming up (facing right) ;;;
InstList_Botwoon_Hidden_AimingUp_FacingRight:
    dw $0001,Spritemaps_Botwoon_MouthClosed_Priority0_AimUp_FacingRight
    dw Instruction_Common_Sleep


;;; $946B: Botwoon instruction list pointers ;;;
InstListPointers_Botwoon:
    dw InstList_Botwoon_MouthClosed_AimingUp_FacingRight
    dw InstList_Botwoon_MouthClosed_AimingUpRight
    dw InstList_Botwoon_MouthClosed_AimingRight
    dw InstList_Botwoon_MouthClosed_AimingDownRight
    dw InstList_Botwoon_MouthClosed_AimingDown_FacingRight
    dw InstList_Botwoon_MouthClosed_AimingDownLeft
    dw InstList_Botwoon_MouthClosed_AimingLeft
    dw InstList_Botwoon_MouthClosed_AimingUpLeft
    dw InstList_Botwoon_Hide
    dw InstList_Botwoon_Hide
    dw InstList_Botwoon_Hide
    dw InstList_Botwoon_Hide
    dw InstList_Botwoon_Hide
    dw InstList_Botwoon_Hide
    dw InstList_Botwoon_Hide
    dw InstList_Botwoon_Hide

InstListPointers_Botwoon_spit:
    dw InstList_Botwoon_Spit_AimingUp_FacingRight
    dw InstList_Botwoon_Spit_AimingUpRight
    dw InstList_Botwoon_Spit_AimingRight
    dw InstList_Botwoon_Spit_AimingDownRight
    dw InstList_Botwoon_Spit_AimingDown_FacingRight
    dw InstList_Botwoon_Spit_AimingDownLeft
    dw InstList_Botwoon_Spit_AimingLeft
    dw InstList_Botwoon_Spit_AimingUpLeft


;;; $949B: Botwoon hole hitboxes ;;;
BotwoonHoleHitboxes:
;        _____________________ Left boundary
;       |      _______________ Right boundary
;       |     |      _________ Top boundary
;       |     |     |      ___ Bottom boundary
;       |     |     |     |
  .leftBoundary:
    dw $003C
  .rightBoundary:
    dw       $0044
  .topBoundary:
    dw             $006C
  .bottomBoundary:
    dw                   $0074 ; Left
    dw $007C,$0084,$00AC,$00B4 ; Bottom
    dw $009C,$00A4,$005C,$0064 ; Top
    dw $00DC,$00E4,$008C,$0094 ; Right


;;; $94BB: Botwoon speed table ;;;
BotwoonSpeedTable:
; Indexed by $7E:803E. Used for both Botwoon movement and spit projectile movement

;        _________ Speed
;       |      ___ Body travel time. Number of frames required to reach the current position of the next body part. 30h / speed
;       |     |
  .speed:
    dw $0002
  .bodyTravelTime:
    dw       $0018 ; Health >= 50%
    dw $0003,$0010 ; 25% <= health < 50%
    dw $0004,$000C ; Health < 25%


;;; $94C7: Instruction - enemy radius = 8 x 10h ;;;
Instruction_Botwoon_EnemyRadius_8x10:
    LDX.W EnemyIndex
    LDA.W #$0008 : STA.W Enemy.XHitboxRadius,X
    LDA.W #$0010 : STA.W Enemy.YHitboxRadius,X
    RTL


;;; $94D7: Instruction - enemy radius = Ch x Ch ;;;
Instruction_Botwoon_EnemyRadius_CxC:
    LDX.W EnemyIndex
    LDA.W #$000C : STA.W Enemy.XHitboxRadius,X
    LDA.W #$000C : STA.W Enemy.YHitboxRadius,X
    RTL


;;; $94E7: Instruction - enemy radius = 10h x 8 ;;;
Instruction_Botwoon_EnemyRadius_10x8:
    LDX.W EnemyIndex
    LDA.W #$0010 : STA.W Enemy.XHitboxRadius,X
    LDA.W #$0008 : STA.W Enemy.YHitboxRadius,X
    RTL


;;; $94F7: Instruction - enemy radius = Ch x Ch ;;;
Instruction_Botwoon_EnemyRadius_CxC_duplicate:
    LDX.W EnemyIndex
    LDA.W #$000C : STA.W Enemy.XHitboxRadius,X
    LDA.W #$000C : STA.W Enemy.YHitboxRadius,X
    RTL


;;; $9507: Instruction - enemy radius = 8 x 10h ;;;
Instruction_Botwoon_EnemyRadius_8x10_duplicate:
    LDX.W EnemyIndex
    LDA.W #$0008 : STA.W Enemy.XHitboxRadius,X
    LDA.W #$0010 : STA.W Enemy.YHitboxRadius,X
    RTL


;;; $9517: Instruction - enemy radius = 8 x 10h ;;;
Instruction_Botwoon_EnemyRadius_8x10_duplicate_again:
    LDX.W EnemyIndex
    LDA.W #$0008 : STA.W Enemy.XHitboxRadius,X
    LDA.W #$0010 : STA.W Enemy.YHitboxRadius,X
    RTL


;;; $9527: Instruction - enemy radius = Ch x Ch ;;;
Instruction_Botwoon_EnemyRadius_CxC_duplicate_again:
    LDX.W EnemyIndex
    LDA.W #$000C : STA.W Enemy.XHitboxRadius,X
    LDA.W #$000C : STA.W Enemy.YHitboxRadius,X
    RTL


;;; $9537: Instruction - enemy radius = 10h x 8 ;;;
Instruction_Botwoon_EnemyRadius_10x8_duplicate:
    LDX.W EnemyIndex
    LDA.W #$0010 : STA.W Enemy.XHitboxRadius,X
    LDA.W #$0008 : STA.W Enemy.YHitboxRadius,X
    RTL


;;; $9547: Instruction - enemy radius = Ch x Ch ;;;
Instruction_Botwoon_EnemyRadius_CxC_duplicate_again2:
    LDX.W EnemyIndex
    LDA.W #$000C : STA.W Enemy.XHitboxRadius,X
    LDA.W #$000C : STA.W Enemy.YHitboxRadius,X
    RTL


;;; $9557: Instruction - enemy radius = 8 x 10h ;;;
Instruction_Botwoon_EnemyRadius_8x10_duplicate_again2:
    LDX.W EnemyIndex
    LDA.W #$0008 : STA.W Enemy.XHitboxRadius,X
    LDA.W #$0010 : STA.W Enemy.YHitboxRadius,X
    RTL


;;; $9567: Instruction - set Botwoon spitting flag ;;;
Instruction_Botwoon_SetSpittingFlag:
    LDX.W EnemyIndex
    LDA.W #$0001 : STA.L Botwoon.spittingFlag,X
    RTL


;;; $9572: Instruction - queue Botwoon spit sound effect ;;;
Instruction_Botwoon_QueueSpitSFX:
    LDA.W #$007C
    JSL QueueSound_Lib2_Max6
    RTL


;;; $957A: RTL ;;;
RTL_B3957A:
    RTL


;;; $957B: Queue small explosion sound effect ;;;
QueueSmallExplosionSFX:
    LDA.W #$0024
    JSL QueueSound_Lib2_Max6
    RTL


;;; $9583: Initialisation AI - enemy $F293 (Botwoon) ;;;
InitAI_Botwoon:
    LDA.L SRAMMirror_BossMaridia : AND.W #$0002 : BEQ .notDead
    LDX.W EnemyIndex
    JSL Spawn_Hardcoded_PLM
    db $0F,$04
    dw PLMEntries_clearBotwoonWall
    LDA.W #$0101 : STA.L Scrolls
    LDA.W #InstList_Botwoon_Hide : STA.W Enemy.instList,X
    LDA.W Enemy.properties,X : ORA.W #$0200 : STA.W Enemy.properties,X
    JMP .return

  .notDead:
    LDX.W EnemyIndex
    LDA.W #$0018 : STA.W Botwoon.bodyProjectileIndex,X

  .loop:
    LDY.W #EnemyProjectile_BotwoonsBody
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    LDX.W EnemyIndex
    DEC.W Botwoon.bodyProjectileIndex,X : DEC.W Botwoon.bodyProjectileIndex,X : BPL .loop
    LDA.W #InstList_Botwoon_Hide : STA.W Enemy.instList,X : STA.L Botwoon.instList,X
    LDA.W #Function_Botwoon_Initial : STA.W Botwoon.function,X
    LDA.W #Function_Botwoon_Movement_DirectlyTowardTargetHole : STA.W Botwoon.movementFunction,X
    LDA.W #Function_Botwoon_Head_MovingAround : STA.W Botwoon.headFunction,X
    LDA.W #$0100 : STA.L Botwoon.initTimer,X
    LDA.W BotwoonSpeedTable_speed : STA.L Botwoon.speed,X
    LDA.W BotwoonSpeedTable_bodyTravelTime : STA.W Botwoon.bodyTravelTime,X
    LDA.W #$0001 : STA.L Botwoon.headHiddenFlag,X
    STA.L Botwoon.previousHeadHiddenFlag,X : STA.L Botwoon.initialLeaveHoleActionFlag,X
    LDA.W #$FFFF : STA.L Botwoon.targetPositionHistoryIndex,X
    LDA.W #$0000 : STA.L Botwoon.targetHoleIndex,X
    LDA.W Enemy.properties,X : ORA.W #$0400 : STA.W Enemy.properties,X
    LDA.W Enemy.health,X : STA.L Botwoon.maxHealth,X
    LSR : STA.L Botwoon.maxHealth_1_2,X
    LSR : STA.L Botwoon.maxHealth_1_4,X
    LDA.W Enemy.XPosition,X : STA.L Botwoon.XPosition1FrameAgo,X
    STA.L Botwoon.XPosition2FramesAgo,X : STA.L Botwoon.XPosition3FramesAgo,X : STA.L Botwoon.XPosition4FramesAgo,X
    LDA.W Enemy.YPosition,X : STA.L Botwoon.YPosition1FrameAgo,X
    STA.L Botwoon.YPosition2FramesAgo,X : STA.L Botwoon.YPosition3FramesAgo,X : STA.L Botwoon.YPosition4FramesAgo,X
    LDA.W Enemy.palette,X : LSR #4 : CLC : ADC.W #$0100 : STA.L Botwoon.paletteDataOffset,X

  .return:
    RTL


;;; $9668: Main AI - enemy $F293 (Botwoon) ;;;
MainAI_Botwoon:
    LDX.W EnemyIndex
    JSR BotwoonDeathCheck
    JSR.W (Botwoon.function,X)
    JSR BotwoonHealthBasedPaletteHandling
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $9675:  ;;;
UNUSED_Data_B39675:
    dw $FFFF,$00FF,$01FF


;;; $967B: Unused ;;;
UNUSED_SpeedTable_Random_B3967B:
    LDA.L Botwoon.speedTableIndex,X : ASL : TAY
    LDA.W UNUSED_Data_B39675,Y : STA.B DP_Temp12
    JSL GenerateRandomNumber
    AND.B DP_Temp12 : BNE .return
    LDA.W #$0001 : STA.L ExtraEnemy8000+$1C,X

  .return:
    RTS


;;; $9696: Unused ;;;
UNUSED_Botwoon_MaybeSpitting_B39396:
    LDX.W EnemyIndex
    LDA.L Botwoon.deathFlag,X : BNE +
    LDA.L ExtraEnemy8000+$1C,X : BEQ +
    LDA.L Botwoon.headHiddenFlag,X : BNE +
    LDA.L Botwoon.spitTimer,X : BNE +
    LDA.W #Function_Botwoon_Head_Spitting_SetAngleAndShow : STA.W Botwoon.headFunction,X
    LDA.W #$0018 : STA.L Botwoon.spitTimer,X

+   LDA.W #$0000 : STA.L ExtraEnemy8000+$1C,X
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $96C6: Botwoon death check ;;;
BotwoonDeathCheck:
    LDX.W EnemyIndex ; >.<
    LDA.L Botwoon.deathFlag,X : BEQ .return
    LDA.L Botwoon.tailShowingFlag,X : BEQ .return
    LDA.W #$0001 : STA.L Botwoon.bodyDeathFlag,X
    LDA.W #Function_Botwoon_DeathSequence_PreDeathDelay : STA.W Botwoon.function,X
    LDA.W #$00F0 : STA.L Botwoon.preDeathCounter,X
    LDA.W #$0000 : STA.L Botwoon.deathFlag,X : STA.L Botwoon.tailShowingFlag,X

  .return:
    RTS


;;; $96F5: Set Botwoon as intangible ;;;
SetBotwoonAsIntangible:
    LDA.W Enemy.properties : ORA.W #$0400 : STA.W Enemy.properties
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $96FF: Unused. Set Botwoon body enemy projectiles as intangible ;;;
UNUSED_SetBotwoonBodyProjectilesAsIntangible_B396FF:
    LDY.W #$0022

  .loop:
    TYX
    LDA.W EnemyProjectile_Properties,Y : ORA.W #$2000 : STA.W EnemyProjectile_Properties,Y
    LDA.W #$0002 : STA.L EnemyProjectileData_CollisionOptions,X
    DEY #2 : CPY.W #$000A : BPL .loop
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $971B: Botwoon health-based palettes ;;;
BotwoonHealthBasedPalettes:
    dw $0000,$27E9,$1A66,$1585,$0CA3,$3F9C,$2E97,$1D72
    dw $108E,$0A5F,$09DB,$0956,$08D2,$082C,$7FBD,$0C05
    dw $2003,$27EB,$1A88,$15A7,$0CC4,$3B5C,$2E58,$1D53
    dw $106F,$0E3F,$0DBB,$0D36,$0CD2,$0C2C,$77BD,$0C06
    dw $2003,$23ED,$168A,$11C8,$08E5,$3AFD,$2A38,$1D34
    dw $1071,$0DFF,$0D9B,$0D36,$0CB3,$0C2D,$6FDE,$0807
    dw $0000,$23EF,$16AC,$11EA,$0906,$36BD,$29F9,$1D15
    dw $1052,$11DF,$117B,$1116,$10B3,$102D,$67DE,$0808
    dw $0000,$23F2,$12CF,$11EC,$0908,$327D,$25B9,$18D6
    dw $1453,$11BF,$115C,$10F7,$1093,$102E,$5FDE,$0408
    dw $0000,$23F4,$12F1,$120E,$0929,$2E3D,$257A,$18B7
    dw $1434,$159F,$153C,$14D7,$1493,$142E,$57DE,$0409
    dw $0000,$1FF6,$0EF3,$0E2F,$054A,$2DDE,$215A,$1898
    dw $1436,$155F,$151C,$14D7,$1474,$142F,$4FFF,$000A
    dw $0000,$1FF8,$0F15,$0E51,$056B,$299E,$211B,$1879
    dw $1417,$193F,$18FC,$18B7,$1874,$182F,$47FF,$000B


;;; $981B: Botwoon health thresholds for palette change ;;;
BotwoonHealthThresholdsForPaletteChange:
;       3000, 2625, 2250, 1875, 1500, 1125,  750,  375
    dw $0BB8,$0A41,$08CA,$0753,$05DC,$0465,$02EE,$0177


;;; $982B: Botwoon health-based palette handling ;;;
BotwoonHealthBasedPaletteHandling:
    LDX.W EnemyIndex
    LDA.L Botwoon.healthBasedPaletteIndex,X : CMP.W #$0010 : BEQ .return
    TAY
    LDA.W Enemy.health,X : CMP.W BotwoonHealthThresholdsForPaletteChange,Y : BPL .return
    LDA.L Botwoon.healthBasedPaletteIndex,X : ASL #4 : STA.B DP_Temp12
    LDA.L Botwoon.paletteDataOffset,X : STA.B DP_Temp14

  .loop:
    LDY.B DP_Temp12
    LDX.B DP_Temp14
    LDA.W BotwoonHealthBasedPalettes,Y : STA.L Palettes,X
    INC.B DP_Temp12 : INC.B DP_Temp12
    INC.B DP_Temp14 : INC.B DP_Temp14
    LDA.B DP_Temp14 : CMP.W #$0200 : BNE .loop
    LDX.W EnemyIndex
    LDA.L Botwoon.healthBasedPaletteIndex,X : INC #2 : STA.L Botwoon.healthBasedPaletteIndex,X

  .return:
    RTS


;;; $9878: Botwoon function - initial ;;;
Function_Botwoon_Initial:
    LDX.W EnemyIndex ; >.<
    LDA.L Botwoon.initTimer,X : DEC : STA.L Botwoon.initTimer,X : BNE .return
    LDA.W #Function_Botwoon_GoThroughHole : STA.W Botwoon.function,X

  .return:
    RTS


;;; $988D: Botwoon leave hole action jump table ;;;
BotwoonLeaveHoleAction_JumpTable:
    dw SetupBotwoonMovingAround
    dw SetupBotwoonMovingAround
    dw SetupBotwoonMovingAround
    dw SetupBotwoonSpitting
    dw SetupBotwoonSpitting
    dw SetupBotwoonSpitting
    dw SetupBotwoonSpitting
    dw SetupBotwoonSpitting


;;; $989D: Botwoon function - go through hole ;;;
Function_Botwoon_GoThroughHole:
    LDX.W EnemyIndex ; >.<
    LDA.L Botwoon.goingThroughHoleFlag,X : BEQ .moveAround
    LDA.W #$0000 : STA.L Botwoon.goingThroughHoleFlag,X
    STZ.B DP_Temp12
    LDA.L Botwoon.headHiddenFlag,X : BNE .gotoAction
    LDA.L Botwoon.initialLeaveHoleActionFlag,X : BNE .gotoAction
    LDA.L Botwoon.speedTableIndex,X : BNE .gotoAction
    JSL GenerateRandomNumber
    AND.W #$000E : STA.B DP_Temp12

  .gotoAction:
    LDA.W #$0000 : STA.L Botwoon.initialLeaveHoleActionFlag,X
    LDX.B DP_Temp12
    JMP.W (BotwoonLeaveHoleAction_JumpTable,X)

  .moveAround:
    JSR.W (Botwoon.movementFunction,X)
    JSR UpdateBotwoonPositionHistory
    JSR UpdateBotwonBodyProjectilePositions
    JSR.W (Botwoon.headFunction,X)
    JSR SetBotwoonInstListTableIndices
    JSR UpdateBotwoonPositionHistoryIndex
    JSR Botwoon_vs_Hole_CollisionDetection
    RTS


;;; $98EC: Set up Botwoon moving around ;;;
SetupBotwoonMovingAround:
    LDX.W EnemyIndex
    LDA.W #Function_Botwoon_MovingAround : STA.W Botwoon.function,X
    LDA.W #Function_Botwoon_Movement_StartMovingAccordingToMovementData : STA.W Botwoon.movementFunction,X
    LDA.W #$0000 : STA.L Botwoon.spitTimer,X
    LDA.W #Function_Botwoon_Head_MovingAround : STA.W Botwoon.headFunction,X
    LDA.W #$0000 : STA.L ExtraEnemy8800+$16,X
    JSR ChooseBotwoonMovementPath
    RTS


;;; $9913: Set up Botwoon spitting ;;;
SetupBotwoonSpitting:
    LDX.W EnemyIndex
    LDA.W #Function_Botwoon_Spitting : STA.W Botwoon.function,X
    LDA.W #Function_Botwoon_Head_Spitting_SetAngleAndShow : STA.W Botwoon.headFunction,X
    LDA.W #$0030 : STA.L Botwoon.spitTimer,X
    LDA.W Enemy.properties,X : AND.W #$FBFF : STA.W Enemy.properties,X
    RTS


;;; $9933: Choose Botwoon movement path ;;;
ChooseBotwoonMovementPath:
    JSR SetBotwoonSpeed
    STZ.B DP_Temp12
    LDA.L Botwoon.headHiddenFlag,X : BEQ .notHidden
    LDA.W #$0080 : STA.B DP_Temp12

  .notHidden:
    JSL GenerateRandomNumber
    AND.W #$0018 : STA.B DP_Temp14
    LDA.L Botwoon.targetHoleIndex,X : ASL #2 : CLC : ADC.B DP_Temp12
    CLC : ADC.B DP_Temp14 : STA.L Botwoon.movementTableIndex,X
    RTS


;;; $995D: Set Botwoon speed ;;;
SetBotwoonSpeed:
    LDA.L Botwoon.headHiddenFlag,X : BNE .return
    LDA.W #$0000 : STA.L Botwoon.speedTableIndex,X
    LDA.W Enemy.health,X : BEQ .return
    BMI .return
    CMP.L Botwoon.maxHealth_1_2,X : BPL .return
    CMP.L Botwoon.maxHealth_1_4,X : BPL .halfHealth
    BRA .quarterHealth

  .halfHealth:
    LDA.W #$0001 : STA.L Botwoon.speedTableIndex,X
    BRA .merge

  .quarterHealth:
    LDA.W #$0002 : STA.L Botwoon.speedTableIndex,X

  .merge:
    LDA.L Botwoon.speedTableIndex,X : ASL #2 : TAY
    LDA.W BotwoonSpeedTable_speed,Y : STA.L Botwoon.speed,X
    LDA.W BotwoonSpeedTable_bodyTravelTime,Y : STA.W Botwoon.bodyTravelTime,X

  .return:
    RTS


;;; $99A4: Botwoon function - moving around ;;;
Function_Botwoon_MovingAround:
    LDX.W EnemyIndex ; >.<
    LDA.L Botwoon.goingThroughHoleFlag,X : BEQ .notGoingThroughHole
    LDA.W #$0000 : STA.L Botwoon.goingThroughHoleFlag,X
    JMP + ; >.<

  .notGoingThroughHole:
    JSR.W (Botwoon.movementFunction,X)
    JSR UpdateBotwoonPositionHistory
    JSR UpdateBotwonBodyProjectilePositions
    JSR.W (Botwoon.headFunction,X)
    JSR SetBotwoonInstListTableIndices
    JSR UpdateBotwoonPositionHistoryIndex
    RTS

+   LDA.W #Function_Botwoon_GoThroughHole : STA.W Botwoon.function,X
    LDA.W #Function_Botwoon_Movement_DirectlyTowardTargetHole : STA.W Botwoon.movementFunction,X
    LDA.L Botwoon.headHiddenFlag,X : BEQ .return
    LDA.W #$0000 : STA.L Botwoon.holeCollisionDisabledFlag,X

  .return:
    RTS


;;; $99E4: Botwoon function - spitting ;;;
Function_Botwoon_Spitting:
    LDX.W EnemyIndex ; >.<
    LDA.L Botwoon.spitTimer,X : BNE .timerNotExpired
    LDA.W #$0000 : STA.L Botwoon.goingThroughHoleFlag,X
    JMP + ; >.<

  .timerNotExpired:
    LDA.W #$0000 : STA.L ExtraEnemy8000+$1C,X
    JSR.W (Botwoon.headFunction,X)
    RTS

+   LDA.W #Function_Botwoon_MovingAround : STA.W Botwoon.function,X
    LDA.W #Function_Botwoon_Movement_StartMovingAccordingToMovementData : STA.W Botwoon.movementFunction,X
    LDA.W #Function_Botwoon_Head_MovingAround : STA.W Botwoon.headFunction,X
    LDA.L Botwoon.deathFlag,X : BNE .deathFlagSet
    JSL GenerateRandomNumber
    AND.W #$0001 : STA.L Botwoon.headHiddenFlag,X : STA.L Botwoon.previousHeadHiddenFlag,X : BEQ .deathFlagSet
    LDA.W #$0000 : STA.L Botwoon.holeCollisionDisabledFlag,X
    LDA.W #$FFFF : STA.L Botwoon.targetPositionHistoryIndex,X
    BRA .merge

  .deathFlagSet:
    LDA.W #$0000 : STA.L ExtraEnemy8800+$16,X

  .merge:
    JSR ChooseBotwoonMovementPath
    RTS


;;; $9A46: Botwoon function - death sequence - pre-death delay ;;;
Function_Botwoon_DeathSequence_PreDeathDelay:
    LDX.W EnemyIndex ; >.<
    LDA.L Botwoon.preDeathCounter,X : INC : STA.L Botwoon.preDeathCounter,X
    CMP.W #$0100 : BMI .return
    LDA.W #Function_Botwoon_DeathSequence_FallingToGround : STA.W Botwoon.function,X

  .return:
    RTS


;;; $9A5E: Botwoon function - death sequence - falling to ground ;;;
Function_Botwoon_DeathSequence_FallingToGround:
    LDX.W EnemyIndex ; >.<
    LDA.L Botwoon.fallingYSpeedTableIndex,X : AND.W #$FF00 : XBA : ASL #3 : TAY
    LDA.W Enemy.YSubPosition,X : CLC : ADC.W CommonEnemySpeeds_QuadraticallyIncreasing,Y : BCC +
    INC.W Enemy.YPosition,X

+   STA.W Enemy.YSubPosition,X
    LDA.W Enemy.YPosition,X : CLC : ADC.W CommonEnemySpeeds_QuadraticallyIncreasing+2,Y : STA.W Enemy.YPosition,X
    CMP.W #$00C8 : BMI .lessThanC8
    LDA.W #$00C8 : STA.W Enemy.YPosition,X
    LDA.W #Function_Botwoon_DeathSequence_WaitForBodyToFallToGround : STA.W Botwoon.function,X
    LDA.W Enemy.XPosition,X : STA.B DP_Temp12
    LDA.W Enemy.YPosition,X : STA.B DP_Temp14
    LDA.W #$001D
    LDY.W #EnemyProjectile_MiscDust
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    JSL QueueSmallExplosionSFX
    LDA.W Enemy.properties,X : ORA.W #$0400 : ORA.W #$0100 : STA.W Enemy.properties,X ; >.< #$0500
    BRA .return

  .lessThanC8:
    LDA.L Botwoon.fallingYSpeedTableIndex,X : CLC : ADC.W #$00C0 : STA.L Botwoon.fallingYSpeedTableIndex,X

  .return:
    RTS


;;; $9ACA: Botwoon function - death sequence - wait for body to fall to ground ;;;
Function_Botwoon_DeathSequence_WaitForBodyToFallToGround:
    LDX.W EnemyIndex
    LDA.L Botwoon.bodyDeathFlag2,X : BEQ .return
    LDA.W #Function_Botwoon_DeathSequence_CrumblingWall : STA.W Botwoon.function,X
    JSR SpawnBotwoonItemDrops_StartCrumblingWall

  .return:
    RTS


;;; $9ADD: Spawn Botwoon item drops and start crumbling wall ;;;
SpawnBotwoonItemDrops_StartCrumblingWall:
    JSL Spawn_Hardcoded_PLM
    db $0F,$04
    dw PLMEntries_crumbleBotwoonWall
    JSL BotwoonDeathItemDropRoutine
    LDA.W #$0000 : STA.L Botwoon.deathCounter,X
    STA.L Botwoon.largeWallExplosionTimer,X : STA.L Botwoon.wallSmokeTimer,X
    RTS


;;; $9AF9: Botwoon function - death sequence - crumbling wall ;;;
Function_Botwoon_DeathSequence_CrumblingWall:
    LDA.L Botwoon.deathCounter,X : CMP.W #$00C0 : BPL .end
    CMP.W #$0040 : BPL .wall
    JMP .return

  .end:
    LDA.W Enemy.properties,X : ORA.W #$0200 : STA.W Enemy.properties,X
    LDA.W #$0002
    JSL SetBossBitsInAForCurrentArea
    LDA.W #$0003
    JSL QueueMusicDataOrTrack_8FrameDelay
    RTS

  .wall:
    LDA.L Botwoon.largeWallExplosionTimer,X : DEC : STA.L Botwoon.largeWallExplosionTimer,X : BPL .timerNotExpired
    LDA.W #$000C : STA.L Botwoon.largeWallExplosionTimer,X
    JSL GenerateRandomNumber
    AND.W #$001F : CLC : ADC.W #$00E8 : STA.B DP_Temp12
    JSL GenerateRandomNumber
    AND.W #$001F : SEC : SBC.W #$0008
    CLC : ADC.L Botwoon.deathCounter,X : STA.B DP_Temp14
    LDA.W #$001D : STA.B DP_Temp16
    LDA.W #$0A00 : STA.B DP_Temp18
    JSL Create_Sprite_Object
    JSL QueueSmallExplosionSFX

  .timerNotExpired:
    LDA.L Botwoon.wallSmokeTimer,X : DEC : STA.L Botwoon.wallSmokeTimer,X : BPL .return
    LDA.W #$0004 : STA.L Botwoon.wallSmokeTimer,X
    LDA.W #$0002 : STA.B DP_Temp24

  .loop:
    JSL GenerateRandomNumber
    AND.W #$003F : CLC : ADC.W #$00E0 : STA.B DP_Temp12
    JSL GenerateRandomNumber
    AND.W #$001F : SEC : SBC.W #$0008
    CLC : ADC.L Botwoon.deathCounter,X : STA.B DP_Temp14
    LDA.W #$0009 : STA.B DP_Temp16
    LDA.W #$0A00 : STA.B DP_Temp18
    JSL Create_Sprite_Object
    DEC.B DP_Temp24 : BNE .loop

  .return:
    LDA.L Botwoon.deathCounter,X : INC : STA.L Botwoon.deathCounter,X
    RTS


;;; $9BB7: Botwoon movement function - move directly toward target hole ;;;
Function_Botwoon_Movement_DirectlyTowardTargetHole:
    LDX.W EnemyIndex ; >.<
    JSR CalculateXYOffsetsToTargetHole
    JSL CalculateAngleOf_12_14_Offset
    STA.L ExtraEnemy8000+$32,X
    SEC : SBC.W #$0040 : EOR.W #$FFFF : INC
    CLC : ADC.W #$0100 : AND.W #$00FF : STA.L Botwoon.targetHoleAngle,X
    LDA.L Botwoon.headHiddenFlag,X : CMP.L Botwoon.previousHeadHiddenFlag,X : BEQ .move
    LDA.L Botwoon.headHiddenFlag,X : STA.L Botwoon.previousHeadHiddenFlag,X
    LDA.W #$0001 : STA.L Botwoon.goingThroughHoleFlag,X
    JMP .return

  .move:
    JSR MoveBotwoonAccordingToSpeedAndAngleToTargetHole

  .return:
    RTS


;;; $9BF8: Calculate X/Y offsets to target hole ;;;
CalculateXYOffsetsToTargetHole:
;; Returns:
;;     $12: X offset
;;     $14: Y offset
    LDA.L Botwoon.targetHoleIndex,X : TAY
    LDA.W BotwoonHoleHitboxes_leftBoundary,Y : CLC : ADC.W #$0004
    SEC : SBC.W Enemy.XPosition,X : STA.B DP_Temp12
    CMP.W #$0100 : BPL .XClampHigh
    CMP.W #$FF00 : BMI .XClampLow
    BRA .merge

  .XClampHigh:
    LDA.W #$00FF : STA.B DP_Temp12
    BRA .merge

  .XClampLow:
    LDA.W #$FF01 : STA.B DP_Temp12

  .merge:
    LDA.W BotwoonHoleHitboxes_topBoundary,Y : CLC : ADC.W #$0004
    SEC : SBC.W Enemy.YPosition,X : STA.B DP_Temp14
    CMP.W #$0100 : BPL .YClampHigh
    CMP.W #$FF00 : BMI .YClampLow
    BRA .return

  .YClampHigh:
    LDA.W #$00FF : STA.B DP_Temp14
    BRA .return

  .YClampLow:
    LDA.W #$FF01 : STA.B DP_Temp14

  .return:
    RTS


;;; $9C48: Move Botwoon according to speed and angle to target hole ;;;
MoveBotwoonAccordingToSpeedAndAngleToTargetHole:
    LDX.W EnemyIndex
    LDA.L Botwoon.targetHoleAngle,X : STA.B DP_Temp12
    LDA.L Botwoon.speed,X : STA.B DP_Temp14
    JSL Do_Some_Math_With_Sine_Cosine_Terrible_Label_Name ; ($16.$18, $1A.$1C) = ([$14] * |cos([$12] * pi / 80h)|, [$14] * |sin([$12] * pi / 80h)|)
    LDA.L Botwoon.targetHoleAngle,X : STA.W Temp_TargetHoleAngle
    LDA.B DP_Temp16 : STA.W Temp_XSpeed
    LDA.B DP_Temp18 : STA.W Temp_XSubSpeed
    LDA.B DP_Temp1A : STA.W Temp_YSpeed
    LDA.B DP_Temp1C : STA.W Temp_YSubSpeed
    JSL MoveEnemyAccordingToAngleAndXYSpeeds
    RTS


;;; $9C7B: Update Botwoon position history ;;;
UpdateBotwoonPositionHistory:
    LDY.W EnemyIndex
    LDX.W Botwoon.positionHistoryIndex,Y
    LDA.W Enemy.XPosition,Y : STA.L BotwoonPositionHistory,X
    LDA.W Enemy.YPosition,Y : STA.L BotwoonPositionHistory+2,X
    RTS


;;; $9C90: Update Botwoon body projectile positions ;;;
UpdateBotwonBodyProjectilePositions:
    LDX.W EnemyIndex
    LDA.W Botwoon.positionHistoryIndex,X : SEC : SBC.W Botwoon.bodyTravelTime,X : AND.W #$03FF : STA.B DP_Temp12
    LDA.W #$0018 : STA.B DP_Temp14

  .loop:
    LDX.B DP_Temp14
    LDA.L Botwoon.projectileIndices,X : TAY
    LDX.W EnemyIndex
    LDA.L Botwoon.targetPositionHistoryIndex,X : CMP.B DP_Temp12 : BNE .toggleVisibilityEnd
    LDX.B DP_Temp14
    LDA.L Botwoon.bodyHiddenFlag,X : EOR.W #$0001 : STA.L Botwoon.bodyHiddenFlag,X : BEQ .notHidden
    LDA.W EnemyProjectile_Properties,Y : ORA.W #$2000 : STA.W EnemyProjectile_Properties,Y
    PHX
    TYX
    LDA.W #$0002 : STA.L EnemyProjectileData_CollisionOptions,X
    PLX
    BRA +

  .notHidden:
    LDA.W EnemyProjectile_Properties,Y : AND.W #$DFFF : STA.W EnemyProjectile_Properties,Y
    PHX
    TYX
    LDA.W #$0001 : STA.L EnemyProjectileData_CollisionOptions,X
    PLX

+   CPX.W #$0000 : BNE .toggleVisibilityEnd
    LDX.W EnemyIndex
    LDA.W #$0000 : STA.L Botwoon.holeCollisionDisabledFlag,X : STA.L Botwoon.tailShowingFlag,X
    LDA.W #$FFFF : STA.L Botwoon.targetPositionHistoryIndex,X
    LDA.L Botwoon.headHiddenFlag,X : BNE .toggleVisibilityEnd
    LDA.W #$0001 : STA.L Botwoon.tailShowingFlag,X

  .toggleVisibilityEnd:
    LDX.B DP_Temp12
    LDA.L BotwoonPositionHistory,X : STA.W EnemyProjectile_XPositions,Y
    LDA.L BotwoonPositionHistory+2,X : STA.W EnemyProjectile_YPositions,Y
    LDX.W EnemyIndex
    LDA.B DP_Temp12 : SEC : SBC.W Botwoon.bodyTravelTime,X : AND.W #$03FF : STA.B DP_Temp12
    DEC.B DP_Temp14 : DEC.B DP_Temp14 : BMI .return
    JMP .loop

  .return:
    RTS


;;; $9D3C: Update Botwoon position history index ;;;
UpdateBotwoonPositionHistoryIndex:
    LDX.W EnemyIndex
    LDA.W Botwoon.positionHistoryIndex,X : CLC : ADC.W #$0004 : AND.W #$03FF : STA.W Botwoon.positionHistoryIndex,X
    RTS


;;; $9D4D: Set Botwoon body instruction list table indices ;;;
SetBotwoonInstListTableIndices:
    LDX.W EnemyIndex
    LDA.W #$0018 : STA.B DP_Temp16

  .loop:
    STZ.B DP_Temp18
    LDX.B DP_Temp16
    LDA.L Botwoon.projectileIndices,X : TAY
    LDA.L Botwoon.bodyHiddenFlag,X : BEQ .nothidden
    LDA.W #$0100 : STA.B DP_Temp18

  .nothidden:
    LDA.B DP_Temp16 : CMP.W #$0018 : BEQ .first
    CMP.W #$0000 : BNE .notZero
    LDA.B DP_Temp18 : CLC : ADC.W #$0200 : STA.B DP_Temp18

  .notZero:
    LDA.W unknown1A4D,Y : SEC : SBC.W EnemyProjectile_XPositions,Y : STA.B DP_Temp12 ; ?
    LDA.W CinematicSpriteObject_XPositions+$18,Y : SEC : SBC.W EnemyProjectile_YPositions,Y : STA.B DP_Temp14
    BRA .merge

  .first:
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : SEC : SBC.W EnemyProjectile_XPositions,Y : STA.B DP_Temp12
    LDA.W Enemy.YPosition,X : SEC : SBC.W EnemyProjectile_YPositions,Y : STA.B DP_Temp14

  .merge:
    JSL CalculateAngleOf_12_14_Offset
    CLC : ADC.B DP_Temp18 : LSR #5 : ASL : STA.W CinematicSpriteObject_YSubPosition+2,Y ; >.<
    DEC.B DP_Temp16 : DEC.B DP_Temp16 : BMI .return
    JMP .loop

  .return:
    RTS


;;; $9DC0: Botwoon head function - moving around ;;;
Function_Botwoon_Head_MovingAround:
    LDX.W EnemyIndex ; >.<
    LDA.W Enemy.XPosition,X : SEC : SBC.L Botwoon.XPosition4FramesAgo,X : STA.B DP_Temp12
    LDA.W Enemy.YPosition,X : SEC : SBC.L Botwoon.YPosition4FramesAgo,X : STA.B DP_Temp14
    JSL CalculateAngleOf_12_14_Offset
    STA.B DP_Temp16
    LDA.B DP_Temp12 : BNE .nonZero
    LDA.B DP_Temp14 : BNE .nonZero
    JMP .noHeadUpdate

  .nonZero:
    LDA.L Botwoon.headHiddenFlag,X : BEQ .notHidden
    LDA.W #$0007 : STA.W Enemy.layer,X
    LDA.W Enemy.properties,X : ORA.W #$0400 : STA.W Enemy.properties,X
    LDA.B DP_Temp16 : CLC : ADC.W #$0100 : STA.B DP_Temp16
    BRA +

  .notHidden:
    LDA.W #$0002 : STA.W Enemy.layer,X
    LDA.W Enemy.properties,X : AND.W #$FBFF : STA.W Enemy.properties,X

+   LDA.B DP_Temp16 : LSR #5 : ASL : TAY
    LDA.W InstListPointers_Botwoon,Y : CMP.L Botwoon.instList,X : BEQ .noHeadUpdate
    STA.W Enemy.instList,X : STA.L Botwoon.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X

  .noHeadUpdate:
    LDA.L Botwoon.XPosition3FramesAgo,X : STA.L Botwoon.XPosition4FramesAgo,X
    LDA.L Botwoon.YPosition3FramesAgo,X : STA.L Botwoon.YPosition4FramesAgo,X
    LDA.L Botwoon.XPosition2FramesAgo,X : STA.L Botwoon.XPosition3FramesAgo,X
    LDA.L Botwoon.YPosition2FramesAgo,X : STA.L Botwoon.YPosition3FramesAgo,X
    LDA.L Botwoon.XPosition1FrameAgo,X : STA.L Botwoon.XPosition2FramesAgo,X
    LDA.L Botwoon.YPosition1FrameAgo,X : STA.L Botwoon.YPosition2FramesAgo,X
    LDA.W Enemy.XPosition,X : STA.L Botwoon.XPosition1FrameAgo,X
    LDA.W Enemy.YPosition,X : STA.L Botwoon.YPosition1FrameAgo,X
    RTS


;;; $9E77: Botwoon spit speeds ;;;
BotwoonSpitSpeeds:
    dw $0002,$0003,$0004


;;; $9E7D: Botwoon head function - spitting - set angle and show ;;;
Function_Botwoon_Head_Spitting_SetAngleAndShow:
    LDX.W EnemyIndex ; >.<
    LDA.W #$0002 : STA.W Enemy.layer,X
    JSL CalculateAngleOfSamusFromEnemy
    STA.L Botwoon.spitAngle,X
    CLC : ADC.W #$0010 : AND.W #$00FF
    LSR #5 : ASL : TAY ; >.<
    LDA.W InstListPointers_Botwoon_spit,Y : STA.W Enemy.instList,X : STA.L Botwoon.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.L Botwoon.spitAngle,X : SEC : SBC.W #$0040 : AND.W #$00FF
    EOR.W #$FFFF : INC
    CLC : ADC.W #$0100 : AND.W #$00FF : STA.L Botwoon.spitAngle,X
    LDA.W #Function_Botwoon_Head_Spitting_Spawn5SpitProjectiles : STA.W Botwoon.headFunction,X
    LDA.W Botwoon.function,X : CMP.W #Function_Botwoon_Spitting : BEQ .gotoHeadFunction
    LDA.W #Function_Botwoon_Head_Spitting_Spawn3SpitProjectiles : STA.W Botwoon.headFunction,X

  .gotoHeadFunction:
    JMP.W (Botwoon.headFunction,X)


;;; $9EE0: Botwoon head function - spitting - spawn 5 spit projectiles ;;;
Function_Botwoon_Head_Spitting_Spawn5SpitProjectiles:
    LDX.W EnemyIndex ; >.<
    LDA.L Botwoon.spittingFlag,X : BNE .spitting
    RTS

  .spitting:
    LDA.L Botwoon.spitAngle,X : SEC : SBC.W #$0020 : AND.W #$00FF : STA.W BotwoonSpitAngleParam
    LDA.W #$0005 : STA.W BotwoonSpitLoopCounter
    LDA.L Botwoon.speedTableIndex,X : ASL : TAY
    LDA.W BotwoonSpitSpeeds,Y : STA.W Temp_SpitProjectileSpeed

  .loop:
    LDY.W #EnemyProjectile_BotwoonsSpit
    LDA.W Temp_SpitProjectileSpeed
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    LDA.W BotwoonSpitAngleParam : CLC : ADC.W #$0010 : AND.W #$00FF : STA.W BotwoonSpitAngleParam
    DEC.W BotwoonSpitLoopCounter : BNE .loop
    LDA.W #$0000 : STA.L Botwoon.spittingFlag,X
    LDA.W #Function_Botwoon_Head_Spitting_Cooldown : STA.W Botwoon.headFunction,X
    RTS


;;; $9F34: Botwoon head function - spitting - spawn 3 spit projectiles ;;;
Function_Botwoon_Head_Spitting_Spawn3SpitProjectiles:
    LDX.W EnemyIndex ; >.<
    LDA.L Botwoon.spitAngle,X : SEC : SBC.W #$0010 : AND.W #$00FF : STA.W BotwoonSpitAngleParam
    LDA.W #$0003 : STA.W BotwoonSpitLoopCounter
    LDA.L Botwoon.speedTableIndex,X : ASL : TAY
    LDA.W BotwoonSpitSpeeds,Y : STA.W Temp_SpitProjectileSpeed

  .loop:
    LDY.W #EnemyProjectile_BotwoonsSpit
    LDA.W Temp_SpitProjectileSpeed
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    LDA.W BotwoonSpitAngleParam : CLC : ADC.W #$0010 : AND.W #$00FF : STA.W BotwoonSpitAngleParam
    DEC.W BotwoonSpitLoopCounter : BNE .loop
    LDA.W #Function_Botwoon_Head_Spitting_Cooldown : STA.W Botwoon.headFunction,X
    RTS


;;; $9F7A: Botwoon head function - spitting - cooldown ;;;
Function_Botwoon_Head_Spitting_Cooldown:
    LDA.L Botwoon.spitTimer,X : DEC : STA.L Botwoon.spitTimer,X : BPL .return
    LDA.W #$0000 : STA.L Botwoon.spitTimer,X
    LDA.W #Function_Botwoon_Head_MovingAround : STA.W Botwoon.headFunction,X

  .return:
    RTS


;;; $9F93: Botwoon / hole collision detection ;;;
Botwoon_vs_Hole_CollisionDetection:
    LDA.L Botwoon.holeCollisionDisabledFlag,X : BEQ .collisionNotDisabled
    JMP .return

  .collisionNotDisabled:
    LDA.W #$0018 : STA.B DP_Temp12

  .loop:
    LDY.B DP_Temp12
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : CMP.W BotwoonHoleHitboxes_leftBoundary,Y : BMI .notInHole
    LDA.W Enemy.XPosition,X : CMP.W BotwoonHoleHitboxes_rightBoundary,Y : BPL .notInHole
    LDA.W Enemy.YPosition,X : CMP.W BotwoonHoleHitboxes_topBoundary,Y : BMI .notInHole
    LDA.W Enemy.YPosition,X : CMP.W BotwoonHoleHitboxes_bottomBoundary,Y : BPL .notInHole
    LDA.W #$0001 : STA.L Botwoon.holeCollisionDisabledFlag,X
    LDA.L Botwoon.headHiddenFlag,X : EOR.W #$0001 : STA.L Botwoon.headHiddenFlag,X
    LDA.W Botwoon.positionHistoryIndex,X : STA.L Botwoon.targetPositionHistoryIndex,X
    LDA.L ExtraEnemy8000+$C,X : DEC : STA.L ExtraEnemy8000+$C,X
    BRA .return

  .notInHole:
    LDA.W #$0000 : STA.L Botwoon.holeCollisionDisabledFlag,X
    LDA.B DP_Temp12 : SEC : SBC.W #$0008 : STA.B DP_Temp12 : BMI .return
    JMP .loop

  .return:
    RTS


;;; $9FFF: Enemy touch - enemy $F293 (Botwoon) ;;;
EnemyTouch_Botwoon:
    JSL CommonB3_NormalTouchAI_NoDeathCheck
    LDX.W EnemyIndex
    LDA.W Enemy.health,X : BNE .return
    LDA.W #$0001 : STA.L Botwoon.deathFlag,X
    JSR SetBotwoonAsIntangible

  .return:
    RTL


;;; $A016: Enemy shot - enemy $F293 (Botwoon) ;;;
EnemyShot_Botwoon:
    LDX.W EnemyIndex
    LDA.W Enemy.health,X : STA.L Botwoon.previousHealth,X
    JSL CommonB3_NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic
    LDA.L Botwoon.previousHealth,X : CMP.W Enemy.health,X : BEQ .healthUnchanged
    JSL RTL_B3957A ; >.<

  .healthUnchanged:
    LDA.W Enemy.health,X : BNE .return
    LDA.W #$0001 : STA.L Botwoon.deathFlag,X
    JSR SetBotwoonAsIntangible

  .return:
    RTL


;;; $A041: Power bomb reaction - enemy $F293 (Botwoon) ;;;
PowerBombReaction_Botwoon:
    JSL CommonB3_NormalEnemyPowerBombAI_NoDeathCheck
    LDX.W EnemyIndex
    LDA.W Enemy.health,X : BNE .return
    LDA.W #$0001 : STA.L Botwoon.deathFlag,X
    JSR SetBotwoonAsIntangible

  .return:
    RTL


;;; $A058: Botwoon movement data ;;;
BotwoonMovementData_Terminator:
; This would be used as a terminator if the Visible_LeftToBottom path was traversed backwards
    db $80,$00

BotwoonMovementData_Visible_LeftToBottom:
    db $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $00,$FF, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $00,$FF, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$FF, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $00,$FF
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $01,$00, $00,$01
    db $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00
    db $00,$01, $01,$00, $01,$01, $01,$00, $00,$01, $01,$00, $01,$01, $01,$00
    db $00,$01, $01,$00, $00,$01, $01,$00, $01,$00, $00,$01, $01,$00, $00,$01
    db $01,$00, $00,$01, $01,$00, $01,$00, $00,$01, $01,$00, $00,$01, $01,$00
    db $01,$00, $00,$01, $01,$00, $00,$01, $01,$00, $01,$00, $00,$01, $01,$00
    db $00,$01, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $00,$01, $01,$00
    db $01,$00, $00,$01, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $01,$00
    db $00,$01, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $01,$00, $00,$01
    db $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00
    db $01,$00, $00,$01, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $00,$01
    db $01,$00, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $01,$00, $00,$01
    db $01,$00, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $00,$FF, $01,$00, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00
    db $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$FF, $01,$00, $00,$FF
    db $01,$00, $00,$FF, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $00,$FF
    db $01,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $01,$00, $00,$FF, $00,$FF
    db $00,$FF, $00,$FF, $00,$FF, $FF,$00, $00,$FF, $00,$FF, $00,$FF, $00,$FF
    db $00,$FF, $FF,$00, $00,$FF, $00,$FF, $FF,$00, $00,$FF, $00,$FF, $FF,$00
    db $00,$FF, $FF,$FF, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00
    db $00,$FF, $FF,$00, $FF,$FF, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $00,$FF
    db $FF,$00, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $00,$01, $FF,$00
    db $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$00, $00,$01, $FF,$00, $00,$01
    db $FF,$00, $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$01
    db $00,$01, $FF,$00, $00,$01, $FF,$00, $00,$01, $00,$01, $FF,$00, $00,$01
    db $00,$01, $FF,$00, $00,$01, $00,$01, $FF,$00, $00,$01, $00,$01, $00,$01
    db $FF,$00, $00,$01, $00,$01, $FF,$00, $00,$01, $00,$01, $00,$01, $FF,$00
    db $00,$01, $00,$01, $FF,$00, $00,$01, $00,$01, $00,$01, $FF,$00, $00,$01
    db $00,$01, $FF,$00, $00,$01, $00,$01, $00,$01, $FF,$00, $00,$01, $00,$01
    db $FF,$00, $00,$01, $00,$01, $FF,$00, $00,$01, $00,$01, $FF,$00, $00,$01
    db $FF,$00, $00,$01, $00,$01, $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00
    db $00,$01, $00,$01, $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00, $00,$01
    db $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00, $00,$01
    db $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00, $00,$01
    db $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00, $00,$01, $00,$01, $FF,$00
    db $00,$01, $FF,$00, $00,$01, $00,$01, $FF,$01, $00,$01, $00,$01, $00,$01
    db $FF,$00, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $80,$00

BotwoonMovementData_Visible_LeftToTop:
    db $01,$00, $00,$01, $01,$00, $01,$00, $00,$01, $01,$00, $00,$01, $01,$00
    db $01,$00, $00,$01, $01,$00, $00,$01, $01,$00, $01,$01, $01,$00, $00,$01
    db $01,$00, $00,$01, $01,$00, $00,$01, $00,$01, $01,$00, $00,$01, $01,$00
    db $00,$01, $00,$01, $01,$00, $00,$01, $00,$01, $00,$01, $01,$00, $00,$01
    db $00,$01, $00,$01, $00,$01, $01,$00, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $FF,$00, $00,$01, $00,$01, $00,$01, $00,$01, $FF,$00, $00,$01
    db $00,$01, $00,$01, $FF,$00, $00,$01, $00,$01, $FF,$00, $00,$01, $00,$01
    db $FF,$00, $00,$01, $00,$01, $FF,$00, $00,$01, $FF,$00, $00,$01, $00,$01
    db $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00, $00,$01
    db $00,$01, $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$01, $00,$01, $FF,$00
    db $00,$01, $00,$01, $FF,$00, $00,$01, $00,$01, $FF,$00, $00,$01, $00,$01
    db $00,$01, $00,$01, $FF,$00, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $01,$00
    db $00,$01, $00,$01, $01,$00, $00,$01, $00,$01, $01,$00, $00,$01, $01,$00
    db $00,$01, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $00,$01, $01,$00
    db $01,$00, $00,$01, $01,$00, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00
    db $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $00,$01, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $00,$01, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $00,$FF, $01,$00, $01,$00, $01,$00, $01,$00, $01,$FF, $01,$00
    db $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $01,$00, $00,$FF, $01,$00
    db $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $01,$FF
    db $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00
    db $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF
    db $01,$00, $00,$FF, $01,$00, $01,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF
    db $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $01,$00
    db $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF
    db $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF
    db $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00
    db $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF
    db $01,$00, $00,$FF, $00,$FF, $01,$00, $00,$FF, $00,$FF, $01,$00, $00,$FF
    db $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF
    db $00,$FF, $00,$FF, $FF,$00, $00,$FF, $00,$FF, $FF,$00, $00,$FF, $00,$FF
    db $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $FF,$00
    db $00,$FF, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $00,$FF, $FF,$00
    db $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00
    db $00,$FF, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $FF,$00, $FF,$00
    db $FF,$00, $00,$FF, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $00,$FF
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $FF,$00
    db $FF,$00, $00,$FF, $FF,$00, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00
    db $FF,$00, $00,$FF, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00
    db $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF
    db $FF,$00, $00,$FF, $00,$FF, $FF,$00, $00,$FF, $00,$FF, $FF,$00, $00,$FF
    db $00,$FF, $00,$FF, $00,$FF, $FF,$00, $00,$FF, $00,$FF, $00,$FF, $00,$FF
    db $00,$FF, $01,$00, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $01,$00, $00,$FF
    db $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00
    db $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00
    db $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $01,$00, $01,$00, $00,$FF
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $00,$FF, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $00,$FF, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $80,$F0, $00,$00, $00,$00
    db $80,$00

BotwoonMovementData_Visible_LeftToRight:
    db $00,$01, $01,$00, $00,$01, $00,$01, $01,$00, $00,$01, $00,$01, $01,$00
    db $00,$01, $00,$01, $01,$00, $00,$01, $00,$01, $01,$00, $00,$01, $00,$01
    db $01,$01, $00,$01, $00,$01, $01,$01, $00,$01, $00,$01, $00,$01, $01,$00
    db $00,$01, $00,$01, $00,$01, $00,$01, $01,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $01,$00, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $FF,$00, $00,$01, $00,$01, $00,$01, $FF,$00
    db $00,$01, $00,$01, $FF,$00, $00,$01, $00,$01, $FF,$00, $00,$01, $FF,$00
    db $00,$01, $FF,$00, $00,$01, $00,$01, $FF,$00, $00,$01, $FF,$00, $00,$01
    db $00,$01, $FF,$00, $00,$01, $00,$01, $FF,$00, $00,$01, $00,$01, $FF,$01
    db $00,$01, $00,$01, $00,$01, $FF,$00, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $01,$00, $00,$01, $00,$01, $00,$01, $01,$01, $00,$01, $00,$01, $01,$00
    db $00,$01, $00,$01, $01,$00, $00,$01, $00,$01, $01,$00, $00,$01, $01,$01
    db $01,$01, $00,$01, $01,$00, $00,$01, $01,$00, $00,$01, $01,$00, $00,$01
    db $01,$00, $01,$01, $01,$00, $00,$01, $01,$00, $01,$00, $01,$01, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$FF, $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00, $00,$FF
    db $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF
    db $01,$00, $00,$FF, $01,$FF, $01,$FF, $01,$FF, $01,$FF, $00,$FF, $01,$00
    db $01,$FF, $01,$FF, $01,$FF, $01,$FF, $01,$FF, $00,$FF, $01,$00, $00,$FF
    db $01,$00, $00,$FF, $01,$FF, $00,$FF, $01,$FF, $00,$FF, $00,$FF, $00,$FF
    db $00,$FF, $01,$00, $00,$FF, $00,$FF, $00,$FF, $FF,$FF, $00,$FF, $00,$FF
    db $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF
    db $00,$FF, $00,$FF, $00,$FF, $01,$00, $00,$FF, $00,$FF, $00,$FF, $00,$FF
    db $01,$00, $00,$FF, $00,$FF, $01,$FF, $00,$FF, $00,$FF, $01,$00, $00,$FF
    db $00,$FF, $01,$00, $00,$FF, $00,$FF, $01,$00, $00,$FF, $01,$FF, $00,$FF
    db $01,$00, $00,$FF, $01,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00
    db $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $01,$00, $01,$00
    db $00,$FF, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $00,$01, $01,$00, $01,$00, $00,$01, $01,$00, $00,$01, $01,$00
    db $00,$01, $01,$00, $00,$01, $01,$00, $00,$01, $01,$01, $00,$01, $01,$00
    db $00,$01, $00,$01, $01,$00, $00,$01, $00,$01, $01,$01, $00,$01, $00,$01
    db $01,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $FF,$00, $00,$01, $00,$01, $FF,$01, $00,$01, $FF,$00
    db $00,$01, $FF,$01, $FF,$01, $FF,$00, $00,$01, $FF,$00, $FF,$00, $00,$01
    db $FF,$00, $FF,$00, $FF,$01, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $00,$FF
    db $FF,$00, $FF,$FF, $00,$FF, $FF,$00, $00,$FF, $FF,$FF, $00,$FF, $FF,$FF
    db $00,$FF, $00,$FF, $FF,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF
    db $00,$FF, $00,$FF, $00,$FF, $00,$FF, $01,$00, $00,$FF, $00,$FF, $01,$00
    db $00,$FF, $00,$FF, $01,$00, $01,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF
    db $01,$00, $01,$00, $01,$FF, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00
    db $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $00,$FF, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$FF
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $00,$01, $01,$00, $01,$00, $01,$01, $01,$00, $01,$00, $00,$01, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$FF, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $00,$01
    db $01,$00, $01,$00, $01,$00, $01,$01, $01,$00, $01,$00, $00,$01, $01,$00
    db $01,$00, $00,$01, $01,$00, $01,$01, $01,$00, $00,$01, $01,$00, $00,$01
    db $01,$00, $00,$01, $01,$00, $80,$00

BotwoonMovementData_Visible_LeftToLeft:
    db $01,$00, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $00,$01, $01,$00, $01,$00, $01,$00, $01,$01, $01,$00, $01,$00
    db $00,$01, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $00,$01, $01,$00
    db $00,$01, $01,$00, $01,$01, $01,$01, $01,$01, $00,$01, $01,$00, $00,$01
    db $01,$00, $00,$01, $01,$01, $00,$01, $01,$00, $00,$01, $00,$01, $01,$00
    db $00,$01, $00,$01, $01,$00, $00,$01, $00,$01, $00,$01, $01,$00, $00,$01
    db $00,$01, $00,$01, $01,$00, $00,$01, $00,$01, $00,$01, $00,$01, $01,$00
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $01,$00, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $01,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $01,$00, $00,$01, $00,$01, $00,$01, $00,$01, $01,$00, $00,$01, $00,$01
    db $00,$01, $01,$00, $00,$01, $00,$01, $00,$01, $01,$00, $00,$01, $00,$01
    db $01,$00, $00,$01, $00,$01, $01,$00, $00,$01, $00,$01, $01,$00, $00,$01
    db $01,$00, $00,$01, $00,$01, $01,$00, $00,$01, $01,$00, $00,$01, $01,$01
    db $00,$01, $01,$00, $00,$01, $01,$01, $01,$01, $00,$01, $01,$00, $00,$01
    db $01,$01, $00,$01, $01,$00, $00,$01, $01,$00, $00,$01, $01,$01, $01,$01
    db $01,$01, $01,$01, $01,$01, $01,$00, $00,$01, $01,$00, $01,$00, $00,$01
    db $01,$00, $01,$00, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $00,$FF
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$FF, $01,$00, $01,$00, $00,$FF
    db $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00, $00,$FF
    db $01,$00, $01,$FF, $01,$FF, $01,$FF, $00,$FF, $01,$00, $00,$FF, $01,$00
    db $00,$FF, $00,$FF, $01,$00, $00,$FF, $00,$FF, $01,$00, $00,$FF, $00,$FF
    db $01,$FF, $00,$FF, $00,$FF, $00,$FF, $01,$00, $00,$FF, $00,$FF, $00,$FF
    db $01,$00, $00,$FF, $00,$FF, $00,$FF, $01,$FF, $00,$FF, $00,$FF, $01,$00
    db $00,$FF, $00,$FF, $01,$00, $00,$FF, $01,$FF, $00,$FF, $01,$00, $00,$FF
    db $01,$FF, $01,$FF, $01,$FF, $01,$FF, $01,$00, $00,$FF, $01,$00, $01,$00
    db $00,$FF, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $00,$01, $01,$00, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $00,$01
    db $01,$00, $01,$01, $01,$00, $00,$01, $01,$00, $01,$00, $00,$01, $01,$00
    db $00,$01, $01,$00, $01,$00, $00,$01, $01,$00, $00,$01, $01,$00, $00,$01
    db $01,$00, $00,$01, $01,$00, $00,$01, $01,$01, $00,$01, $01,$00, $00,$01
    db $00,$01, $01,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $FF,$01, $00,$01, $00,$01, $FF,$00, $00,$01, $00,$01
    db $FF,$00, $00,$01, $FF,$01, $FF,$01, $00,$01, $FF,$00, $FF,$01, $FF,$00
    db $00,$01, $FF,$00, $FF,$01, $FF,$00, $FF,$01, $FF,$00, $FF,$00, $FF,$00
    db $00,$01, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00
    db $FF,$00, $00,$FF, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$FF, $FF,$00
    db $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00
    db $00,$FF, $FF,$00, $00,$FF, $FF,$00, $FF,$FF, $FF,$FF, $FF,$00, $00,$FF
    db $FF,$00, $FF,$FF, $FF,$00, $00,$FF, $FF,$00, $FF,$FF, $FF,$00, $FF,$FF
    db $FF,$00, $FF,$FF, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $00,$FF, $FF,$00
    db $FF,$00, $00,$FF, $FF,$00, $FF,$FF, $FF,$00, $00,$FF, $FF,$00, $FF,$00
    db $00,$FF, $FF,$00, $FF,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00
    db $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $00,$FF, $FF,$00
    db $FF,$FF, $FF,$00, $00,$FF, $FF,$00, $FF,$FF, $FF,$00, $00,$FF, $FF,$00
    db $FF,$00, $00,$FF, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $FF,$FF
    db $FF,$00, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $FF,$FF, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $FF,$FF, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00
    db $00,$FF, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00
    db $FF,$00, $00,$FF, $FF,$00, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00
    db $00,$FF, $FF,$00, $00,$FF, $FF,$00, $FF,$FF, $FF,$00, $00,$FF, $FF,$00
    db $00,$FF, $FF,$FF, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $00,$FF
    db $FF,$00, $00,$FF, $00,$FF, $FF,$00, $00,$FF, $00,$FF, $FF,$00, $00,$FF
    db $00,$FF, $FF,$FF, $00,$FF, $00,$FF, $00,$FF, $FF,$00, $00,$FF, $00,$FF
    db $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $01,$00
    db $00,$FF, $00,$FF, $00,$FF, $01,$00, $00,$FF, $00,$FF, $00,$FF, $01,$00
    db $00,$FF, $00,$FF, $01,$00, $00,$FF, $80,$00

BotwoonMovementData_Visible_BottomToLeft:
    db $01,$00, $01,$00, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $01,$00, $01,$00, $00,$FF
    db $01,$00, $01,$00, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $01,$00
    db $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $01,$00
    db $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00
    db $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00
    db $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00
    db $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00
    db $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00
    db $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$FF
    db $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $00,$FF, $01,$00, $00,$FF
    db $01,$00, $00,$FF, $00,$FF, $01,$00, $00,$FF, $01,$FF, $00,$FF, $01,$00
    db $00,$FF, $00,$FF, $01,$00, $00,$FF, $00,$FF, $01,$00, $00,$FF, $00,$FF
    db $01,$00, $00,$FF, $00,$FF, $00,$FF, $01,$00, $00,$FF, $00,$FF, $01,$00
    db $00,$FF, $00,$FF, $00,$FF, $01,$00, $00,$FF, $00,$FF, $01,$00, $00,$FF
    db $00,$FF, $00,$FF, $00,$FF, $01,$00, $00,$FF, $00,$FF, $00,$FF, $01,$00
    db $00,$FF, $00,$FF, $00,$FF, $00,$FF, $01,$00, $00,$FF, $00,$FF, $00,$FF
    db $00,$FF, $00,$FF, $00,$FF, $01,$00, $00,$FF, $00,$FF, $00,$FF, $00,$FF
    db $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF
    db $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $FF,$00, $00,$FF
    db $00,$FF, $00,$FF, $00,$FF, $00,$FF, $FF,$00, $00,$FF, $00,$FF, $00,$FF
    db $FF,$00, $00,$FF, $00,$FF, $00,$FF, $FF,$00, $00,$FF, $00,$FF, $FF,$00
    db $00,$FF, $00,$FF, $FF,$00, $00,$FF, $00,$FF, $FF,$00, $00,$FF, $FF,$00
    db $00,$FF, $FF,$00, $00,$FF, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF
    db $FF,$00, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $00,$FF
    db $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00
    db $FF,$00, $00,$FF, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $00,$FF
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $00,$01, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$00, $FF,$00
    db $FF,$00, $00,$01, $FF,$00, $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$00
    db $00,$01, $FF,$00, $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$00, $00,$01
    db $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$00
    db $00,$01, $FF,$00, $00,$01, $FF,$00, $FF,$00, $00,$01, $FF,$00, $00,$01
    db $FF,$00, $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00
    db $00,$01, $FF,$00, $00,$01, $FF,$00, $FF,$01, $FF,$01, $00,$01, $FF,$00
    db $00,$01, $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00
    db $00,$01, $FF,$00, $00,$01, $00,$01, $FF,$00, $00,$01, $FF,$00, $00,$01
    db $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00, $00,$01, $00,$01, $FF,$00
    db $00,$01, $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00
    db $00,$01, $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00, $FF,$00, $00,$01
    db $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00, $FF,$00
    db $00,$01, $FF,$00, $00,$01, $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$00
    db $00,$01, $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$00, $FF,$01, $FF,$00
    db $FF,$00, $00,$01, $FF,$00, $FF,$00, $FF,$00, $FF,$01, $FF,$00, $FF,$00
    db $FF,$00, $00,$01, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $00,$01
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $00,$01, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $00,$01, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$01, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $00,$01
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $80,$00

BotwoonMovementData_Visible_BottomToTop:
    db $01,$FF, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF
    db $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF
    db $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $00,$FF
    db $01,$00, $00,$FF, $00,$FF, $01,$00, $00,$FF, $00,$FF, $01,$00, $00,$FF
    db $00,$FF, $00,$FF, $01,$00, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF
    db $01,$00, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF
    db $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $FF,$00, $00,$FF
    db $00,$FF, $00,$FF, $00,$FF, $FF,$00, $00,$FF, $00,$FF, $00,$FF, $FF,$00
    db $00,$FF, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$FF, $00,$FF
    db $FF,$00, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $00,$FF
    db $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $00,$01
    db $FF,$00, $FF,$00, $FF,$01, $FF,$00, $00,$01, $FF,$00, $FF,$00, $00,$01
    db $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00, $00,$01
    db $FF,$00, $00,$01, $FF,$00, $00,$01, $00,$01, $FF,$00, $00,$01, $00,$01
    db $00,$01, $FF,$00, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $01,$00, $00,$01, $00,$01, $01,$01
    db $00,$01, $01,$01, $00,$01, $01,$00, $00,$01, $01,$00, $00,$01, $00,$01
    db $01,$00, $00,$01, $01,$00, $01,$00, $00,$01, $01,$00, $00,$01, $01,$00
    db $01,$00, $00,$01, $01,$00, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $00,$FF, $01,$00, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF
    db $01,$00, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00
    db $00,$FF, $01,$00, $00,$FF, $01,$FF, $00,$FF, $01,$00, $00,$FF, $00,$FF
    db $01,$00, $00,$FF, $00,$FF, $01,$00, $00,$FF, $00,$FF, $00,$FF, $01,$00
    db $00,$FF, $00,$FF, $00,$FF, $01,$00, $00,$FF, $00,$FF, $00,$FF, $00,$FF
    db $01,$00, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $01,$00, $00,$FF, $00,$FF
    db $00,$FF, $00,$FF, $00,$FF, $01,$00, $00,$FF, $00,$FF, $00,$FF, $00,$FF
    db $00,$FF, $00,$FF, $00,$FF, $01,$00, $00,$FF, $00,$FF, $00,$FF, $00,$FF
    db $00,$FF, $00,$FF, $00,$FF, $00,$FF, $FF,$00, $00,$FF, $00,$FF, $00,$FF
    db $00,$FF, $00,$FF, $FF,$00, $00,$FF, $00,$FF, $00,$FF, $FF,$00, $00,$FF
    db $00,$FF, $FF,$FF, $00,$FF, $FF,$00, $00,$FF, $00,$FF, $FF,$00, $00,$FF
    db $FF,$00, $00,$FF, $FF,$FF, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $FF,$00
    db $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $00,$FF
    db $FF,$00, $FF,$00, $FF,$FF, $FF,$00, $FF,$00, $FF,$FF, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00
    db $00,$01, $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$00, $00,$01, $FF,$00
    db $00,$01, $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00
    db $00,$01, $00,$01, $FF,$00, $00,$01, $FF,$00, $00,$01, $00,$01, $FF,$00
    db $00,$01, $00,$01, $00,$01, $00,$01, $FF,$00, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $01,$00, $00,$01, $00,$01
    db $00,$01, $01,$00, $00,$01, $00,$01, $01,$00, $00,$01, $00,$01, $01,$00
    db $00,$01, $01,$01, $00,$01, $01,$00, $00,$01, $01,$00, $00,$01, $01,$00
    db $00,$01, $01,$00, $01,$01, $01,$00, $00,$01, $01,$00, $00,$01, $01,$00
    db $01,$00, $00,$01, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $01,$01
    db $01,$00, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00
    db $01,$00, $01,$FF, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $01,$00
    db $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00
    db $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00
    db $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF
    db $01,$00, $00,$FF, $01,$00, $01,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF
    db $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF
    db $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$FF
    db $00,$FF, $01,$00, $00,$FF, $00,$FF, $01,$FF, $00,$FF, $00,$FF, $00,$FF
    db $01,$00, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF
    db $00,$FF, $FF,$00, $00,$FF, $00,$FF, $00,$FF, $FF,$00, $00,$FF, $00,$FF
    db $FF,$00, $00,$FF, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$00, $FF,$00, $00,$01
    db $FF,$00, $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00, $FF,$00, $00,$01
    db $FF,$01, $00,$01, $FF,$00, $00,$01, $00,$01, $FF,$00, $00,$01, $00,$01
    db $FF,$00, $00,$01, $00,$01, $FF,$01, $00,$01, $80,$00

BotwoonMovementData_Visible_BottomToRight:
    db $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$FF, $01,$FF, $01,$FF, $01,$FF
    db $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00
    db $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $00,$FF, $01,$00, $00,$FF
    db $01,$00, $00,$FF, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $00,$FF
    db $01,$00, $00,$FF, $00,$FF, $01,$00, $00,$FF, $00,$FF, $01,$00, $00,$FF
    db $00,$FF, $01,$00, $00,$FF, $00,$FF, $01,$00, $00,$FF, $00,$FF, $00,$FF
    db $01,$00, $00,$FF, $00,$FF, $00,$FF, $01,$00, $00,$FF, $00,$FF, $00,$FF
    db $00,$FF, $01,$00, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF
    db $01,$00, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF
    db $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF
    db $FF,$00, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF
    db $FF,$00, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $FF,$00, $00,$FF, $00,$FF
    db $00,$FF, $FF,$00, $00,$FF, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF
    db $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $FF,$00, $00,$FF
    db $FF,$00, $FF,$00, $FF,$00, $FF,$01, $FF,$00, $FF,$00, $FF,$00, $00,$01
    db $FF,$00, $FF,$00, $FF,$01, $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00
    db $FF,$01, $00,$01, $FF,$00, $00,$01, $FF,$00, $00,$01, $00,$01, $FF,$00
    db $00,$01, $00,$01, $00,$01, $FF,$00, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $FF,$00, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $FF,$00, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $01,$00, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $01,$00
    db $00,$01, $00,$01, $00,$01, $01,$00, $00,$01, $00,$01, $01,$00, $00,$01
    db $00,$01, $01,$00, $00,$01, $01,$01, $00,$01, $01,$00, $00,$01, $01,$00
    db $00,$01, $01,$00, $00,$01, $00,$01, $01,$00, $01,$01, $01,$00, $00,$01
    db $01,$00, $00,$01, $01,$00, $00,$01, $01,$00, $00,$01, $01,$00, $01,$00
    db $00,$01, $01,$00, $00,$01, $01,$00, $00,$01, $01,$00, $00,$01, $01,$00
    db $01,$01, $01,$01, $01,$01, $00,$01, $01,$00, $00,$01, $01,$00, $00,$01
    db $01,$00, $00,$01, $01,$00, $00,$01, $01,$00, $00,$01, $01,$00, $00,$01
    db $01,$00, $01,$00, $00,$01, $01,$00, $00,$01, $01,$00, $01,$00, $00,$01
    db $01,$00, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $01,$00, $00,$01
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $00,$FF
    db $01,$00, $01,$00, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $01,$00
    db $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00
    db $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00
    db $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF
    db $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF
    db $01,$FF, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $00,$FF, $01,$00
    db $00,$FF, $00,$FF, $01,$00, $00,$FF, $00,$FF, $01,$00, $00,$FF, $00,$FF
    db $00,$FF, $01,$00, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $01,$00, $00,$FF
    db $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $FF,$00
    db $00,$FF, $00,$FF, $00,$FF, $FF,$00, $00,$FF, $00,$FF, $00,$FF, $FF,$00
    db $00,$FF, $FF,$FF, $00,$FF, $FF,$00, $00,$FF, $00,$FF, $FF,$00, $00,$FF
    db $FF,$00, $00,$FF, $00,$FF, $FF,$00, $00,$FF, $00,$FF, $FF,$00, $00,$FF
    db $00,$FF, $FF,$00, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $FF,$00
    db $00,$FF, $00,$FF, $00,$FF, $01,$00, $00,$FF, $00,$FF, $00,$FF, $00,$FF
    db $00,$FF, $01,$00, $00,$FF, $00,$FF, $00,$FF, $01,$00, $00,$FF, $00,$FF
    db $01,$00, $00,$FF, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00
    db $00,$FF, $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00
    db $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00
    db $01,$00, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $00,$01
    db $01,$00, $01,$00, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $00,$01
    db $01,$00, $01,$00, $00,$01, $01,$00, $00,$01, $01,$00, $01,$01, $00,$01
    db $01,$00, $00,$01, $01,$00, $00,$01, $00,$01, $01,$00, $00,$01, $00,$01
    db $00,$01, $01,$00, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $FF,$00, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $FF,$00, $00,$01, $00,$01, $00,$01, $FF,$00, $00,$01, $00,$01
    db $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $80,$00

BotwoonMovementData_Visible_BottomToBottom:
    db $FF,$00, $00,$FF, $FF,$00, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00
    db $00,$FF, $FF,$00, $FF,$00, $FF,$FF, $FF,$00, $FF,$FF, $FF,$00, $FF,$FF
    db $FF,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $FF,$FF, $FF,$FF
    db $FF,$FF, $00,$FF, $FF,$00, $00,$FF, $FF,$FF, $00,$FF, $00,$FF, $FF,$FF
    db $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF
    db $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF
    db $00,$FF, $FF,$00, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $FF,$00
    db $00,$FF, $00,$FF, $FF,$00, $00,$FF, $00,$FF, $FF,$00, $00,$FF, $00,$FF
    db $FF,$00, $00,$FF, $FF,$FF, $FF,$FF, $FF,$FF, $FF,$00, $00,$FF, $FF,$00
    db $FF,$00, $00,$FF, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00
    db $FF,$00, $00,$FF, $FF,$00, $FF,$00, $FF,$FF, $FF,$00, $FF,$00, $00,$FF
    db $FF,$00, $00,$FF, $FF,$00, $FF,$FF, $FF,$FF, $FF,$FF, $00,$FF, $FF,$00
    db $00,$FF, $00,$FF, $FF,$00, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF
    db $00,$FF, $00,$FF, $00,$FF, $00,$FF, $01,$00, $00,$FF, $00,$FF, $00,$FF
    db $01,$FF, $00,$FF, $01,$FF, $00,$FF, $01,$00, $00,$FF, $00,$FF, $01,$00
    db $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00
    db $00,$FF, $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00
    db $01,$FF, $01,$00, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $00,$01, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$FF, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$FF, $01,$00, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00
    db $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $01,$00, $00,$FF, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $01,$00, $01,$00, $00,$01
    db $01,$00, $01,$00, $01,$00, $00,$01, $01,$00, $00,$01, $01,$00, $01,$01
    db $01,$01, $00,$01, $01,$00, $00,$01, $00,$01, $01,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $FF,$01, $00,$01, $00,$01, $FF,$01, $00,$01, $FF,$01
    db $00,$01, $FF,$00, $00,$01, $FF,$01, $FF,$01, $FF,$00, $00,$01, $FF,$00
    db $00,$01, $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$00, $FF,$00, $00,$01
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $00,$01, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00
    db $FF,$01, $FF,$00, $FF,$00, $FF,$01, $FF,$00, $00,$01, $FF,$00, $00,$01
    db $FF,$00, $00,$01, $00,$01, $FF,$00, $00,$01, $00,$01, $00,$01, $FF,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $01,$00, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $FF,$01, $00,$01, $00,$01, $FF,$01, $00,$01, $00,$01
    db $FF,$00, $00,$01, $00,$01, $FF,$01, $00,$01, $FF,$00, $00,$01, $00,$01
    db $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00, $FF,$01
    db $FF,$00, $00,$01, $FF,$00, $FF,$01, $FF,$00, $00,$01, $FF,$00, $80,$00

BotwoonMovementData_Visible_TopToLeft:
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $FF,$00, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $FF,$00
    db $00,$01, $00,$01, $00,$01, $00,$01, $FF,$00, $00,$01, $00,$01, $00,$01
    db $FF,$00, $00,$01, $00,$01, $00,$01, $FF,$00, $00,$01, $00,$01, $00,$01
    db $FF,$00, $00,$01, $00,$01, $FF,$01, $00,$01, $00,$01, $FF,$01, $00,$01
    db $00,$01, $FF,$01, $00,$01, $00,$01, $00,$01, $FF,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $01,$00
    db $00,$01, $00,$01, $00,$01, $01,$00, $00,$01, $00,$01, $01,$00, $00,$01
    db $00,$01, $01,$00, $00,$01, $00,$01, $01,$00, $00,$01, $01,$00, $00,$01
    db $01,$00, $00,$01, $01,$01, $01,$01, $01,$00, $00,$01, $01,$00, $00,$01
    db $01,$00, $01,$01, $01,$00, $00,$01, $01,$00, $01,$00, $00,$01, $01,$00
    db $01,$00, $00,$01, $01,$00, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00
    db $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $01,$00, $01,$00, $01,$01
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$01, $01,$00, $01,$00, $01,$00, $01,$01, $01,$00
    db $01,$00, $00,$01, $01,$00, $01,$00, $01,$01, $01,$00, $00,$01, $01,$00
    db $01,$00, $00,$01, $01,$00, $00,$01, $01,$00, $00,$01, $01,$01, $01,$01
    db $00,$01, $01,$01, $00,$01, $01,$01, $00,$01, $01,$01, $00,$01, $00,$01
    db $01,$01, $00,$01, $00,$01, $00,$01, $01,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $FF,$00, $00,$01, $00,$01, $FF,$00
    db $00,$01, $FF,$01, $FF,$01, $FF,$00, $00,$01, $FF,$00, $FF,$00, $FF,$01
    db $FF,$00, $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$00, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $FF,$FF, $FF,$00
    db $FF,$00, $00,$FF, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$FF, $FF,$00
    db $00,$FF, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $00,$FF
    db $FF,$00, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $00,$FF
    db $FF,$00, $FF,$FF, $FF,$00, $00,$FF, $FF,$00, $FF,$FF, $FF,$00, $00,$FF
    db $FF,$00, $FF,$FF, $FF,$00, $00,$FF, $FF,$00, $FF,$FF, $FF,$FF, $FF,$00
    db $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00
    db $00,$FF, $FF,$00, $00,$FF, $FF,$FF, $FF,$FF, $FF,$FF, $00,$FF, $FF,$00
    db $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00
    db $00,$FF, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF
    db $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $FF,$FF, $FF,$FF, $FF,$00
    db $00,$FF, $FF,$00, $FF,$FF, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $00,$FF
    db $FF,$00, $FF,$00, $FF,$FF, $FF,$00, $FF,$00, $FF,$00, $00,$FF, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$01, $FF,$00, $FF,$00
    db $00,$01, $FF,$00, $FF,$01, $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00
    db $00,$01, $FF,$01, $00,$01, $FF,$00, $00,$01, $00,$01, $FF,$01, $00,$01
    db $00,$01, $00,$01, $FF,$01, $00,$01, $00,$01, $00,$01, $01,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $01,$00, $00,$01, $00,$01, $01,$00, $00,$01
    db $01,$01, $01,$01, $01,$01, $01,$00, $00,$01, $01,$00, $01,$01, $01,$00
    db $01,$00, $00,$01, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00
    db $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF
    db $01,$00, $00,$FF, $00,$FF, $01,$00, $00,$FF, $00,$FF, $01,$00, $00,$FF
    db $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF
    db $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $FF,$00
    db $00,$FF, $00,$FF, $00,$FF, $00,$FF, $FF,$00, $00,$FF, $00,$FF, $00,$FF
    db $FF,$00, $00,$FF, $00,$FF, $FF,$00, $00,$FF, $00,$FF, $FF,$00, $00,$FF
    db $FF,$FF, $FF,$FF, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $FF,$FF, $FF,$FF
    db $FF,$FF, $FF,$00, $00,$FF, $FF,$00, $FF,$FF, $FF,$00, $00,$FF, $FF,$00
    db $FF,$00, $00,$FF, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $00,$FF
    db $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $FF,$00, $00,$FF, $FF,$00
    db $FF,$00, $00,$FF, $FF,$00, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00
    db $00,$FF, $FF,$00, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $00,$FF
    db $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00
    db $00,$FF, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $00,$FF
    db $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF
    db $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$FF, $FF,$FF, $00,$FF, $FF,$00
    db $00,$FF, $00,$FF, $FF,$00, $00,$FF, $FF,$FF, $00,$FF, $FF,$00, $80,$00

BotwoonMovementData_Visible_TopToBottom:
    db $00,$01, $00,$01, $00,$01, $FF,$00, $00,$01, $00,$01, $00,$01, $00,$01
    db $FF,$00, $00,$01, $00,$01, $00,$01, $FF,$00, $00,$01, $00,$01, $FF,$00
    db $00,$01, $00,$01, $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00, $00,$01
    db $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00, $FF,$00, $00,$01, $FF,$00
    db $00,$01, $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$00, $00,$01, $FF,$00
    db $FF,$00, $00,$01, $FF,$00, $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$00
    db $FF,$00, $00,$01, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$01, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$01, $FF,$00, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00
    db $00,$01, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $00,$FF
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00
    db $00,$01, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $00,$01, $FF,$00
    db $FF,$00, $00,$01, $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$00, $00,$01
    db $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00, $00,$01, $00,$01, $FF,$00
    db $00,$01, $00,$01, $FF,$00, $00,$01, $00,$01, $00,$01, $00,$01, $FF,$00
    db $00,$01, $00,$01, $00,$01, $00,$01, $FF,$00, $00,$01, $00,$01, $00,$01
    db $00,$01, $FF,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $01,$00, $00,$01, $00,$01, $00,$01
    db $01,$00, $00,$01, $00,$01, $01,$00, $00,$01, $01,$00, $00,$01, $00,$01
    db $01,$00, $00,$01, $01,$00, $00,$01, $01,$00, $00,$01, $01,$00, $01,$00
    db $00,$01, $01,$00, $00,$01, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00
    db $01,$00, $00,$01, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $00,$01
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $00,$FF, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $00,$FF, $01,$00, $01,$00, $01,$00, $01,$00, $00,$FF, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$01, $01,$00
    db $01,$00, $00,$01, $01,$00, $01,$00, $00,$01, $01,$00, $00,$01, $01,$00
    db $00,$01, $01,$00, $00,$01, $01,$00, $80,$00

BotwoonMovementData_Visible_TopToRight:
    db $01,$00, $00,$01, $01,$00, $00,$01, $01,$00, $01,$00, $00,$01, $01,$00
    db $00,$01, $01,$00, $01,$00, $00,$01, $01,$00, $00,$01, $01,$00, $00,$01
    db $01,$00, $01,$00, $00,$01, $01,$00, $00,$01, $01,$00, $00,$01, $01,$00
    db $00,$01, $01,$00, $00,$01, $01,$00, $01,$01, $01,$00, $00,$01, $00,$01
    db $01,$00, $00,$01, $01,$00, $00,$01, $01,$00, $00,$01, $01,$00, $00,$01
    db $01,$00, $00,$01, $00,$01, $01,$00, $00,$01, $01,$00, $00,$01, $00,$01
    db $01,$00, $00,$01, $01,$00, $00,$01, $00,$01, $01,$00, $00,$01, $00,$01
    db $01,$00, $00,$01, $00,$01, $00,$01, $01,$00, $00,$01, $00,$01, $01,$00
    db $00,$01, $00,$01, $00,$01, $00,$01, $01,$00, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $01,$00, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $FF,$00, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $FF,$01, $00,$01, $00,$01, $00,$01, $FF,$00, $00,$01, $00,$01, $00,$01
    db $FF,$00, $00,$01, $00,$01, $00,$01, $FF,$00, $00,$01, $00,$01, $FF,$00
    db $00,$01, $00,$01, $FF,$00, $00,$01, $00,$01, $FF,$00, $00,$01, $FF,$00
    db $00,$01, $00,$01, $FF,$00, $00,$01, $FF,$00, $00,$01, $00,$01, $FF,$00
    db $00,$01, $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00
    db $00,$01, $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00
    db $00,$01, $FF,$00, $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00, $FF,$00
    db $00,$01, $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$00, $00,$01, $FF,$00
    db $FF,$00, $00,$01, $FF,$00, $FF,$00, $FF,$00, $FF,$01, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$01
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $00,$FF, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00
    db $FF,$00, $00,$FF, $FF,$00, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00
    db $00,$FF, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $00,$FF, $FF,$00
    db $00,$FF, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF
    db $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF
    db $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $00,$FF, $FF,$00, $00,$FF
    db $00,$FF, $FF,$00, $00,$FF, $00,$FF, $00,$FF, $FF,$00, $00,$FF, $00,$FF
    db $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $01,$00
    db $00,$FF, $00,$FF, $00,$FF, $01,$00, $00,$FF, $00,$FF, $01,$00, $00,$FF
    db $00,$FF, $01,$00, $00,$FF, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF
    db $01,$FF, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF
    db $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00
    db $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00
    db $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $01,$00
    db $00,$FF, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $00,$FF, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00
    db $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $01,$00, $01,$00, $00,$01
    db $01,$00, $01,$00, $01,$01, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00
    db $00,$01, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $00,$01, $01,$00
    db $00,$01, $01,$00, $01,$00, $00,$01, $01,$00, $00,$01, $01,$00, $01,$00
    db $00,$01, $01,$00, $00,$01, $01,$00, $00,$01, $01,$00, $01,$00, $00,$01
    db $01,$00, $00,$01, $01,$00, $00,$01, $01,$00, $00,$01, $01,$00, $00,$01
    db $01,$00, $00,$01, $01,$00, $01,$00, $00,$01, $01,$00, $00,$01, $01,$00
    db $00,$01, $01,$00, $00,$01, $01,$00, $00,$01, $01,$00, $00,$01, $01,$00
    db $00,$01, $01,$00, $00,$01, $01,$00, $00,$01, $01,$00, $00,$01, $00,$01
    db $01,$00, $00,$01, $01,$00, $00,$01, $01,$00, $00,$01, $00,$01, $01,$00
    db $00,$01, $01,$00, $00,$01, $00,$01, $01,$00, $00,$01, $00,$01, $01,$00
    db $00,$01, $00,$01, $01,$01, $00,$01, $00,$01, $01,$00, $00,$01, $00,$01
    db $00,$01, $01,$00, $00,$01, $00,$01, $01,$01, $00,$01, $00,$01, $01,$00
    db $00,$01, $00,$01, $01,$00, $00,$01, $00,$01, $01,$00, $00,$01, $01,$00
    db $00,$01, $01,$00, $00,$01, $01,$01, $01,$00, $00,$01, $01,$00, $00,$01
    db $01,$00, $01,$01, $01,$00, $01,$01, $01,$00, $01,$00, $01,$00, $00,$01
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $00,$FF, $01,$00, $01,$00, $01,$FF, $01,$00, $00,$FF, $01,$00, $01,$00
    db $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00
    db $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $80,$00

BotwoonMovementData_Visible_TopToTop:
    db $01,$00, $01,$00, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $01,$00, $01,$00, $00,$01
    db $01,$00, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $01,$00, $00,$01
    db $01,$00, $01,$00, $00,$01, $01,$00, $01,$01, $01,$00, $00,$01, $01,$00
    db $00,$01, $01,$00, $01,$01, $01,$01, $00,$01, $01,$00, $00,$01, $01,$00
    db $00,$01, $00,$01, $01,$00, $00,$01, $00,$01, $01,$00, $00,$01, $00,$01
    db $00,$01, $01,$00, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $01,$00, $00,$01, $00,$01, $01,$00, $00,$01, $01,$00, $00,$01
    db $01,$00, $00,$01, $01,$01, $01,$01, $00,$01, $01,$00, $00,$01, $01,$00
    db $00,$01, $01,$00, $00,$01, $01,$00, $00,$01, $00,$01, $01,$00, $00,$01
    db $00,$01, $00,$01, $01,$01, $00,$01, $00,$01, $FF,$00, $00,$01, $00,$01
    db $00,$01, $00,$01, $FF,$00, $00,$01, $00,$01, $FF,$00, $00,$01, $FF,$00
    db $00,$01, $FF,$01, $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00, $FF,$00
    db $00,$01, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $FF,$00, $00,$FF, $FF,$00
    db $FF,$00, $00,$FF, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00
    db $00,$FF, $00,$FF, $FF,$00, $00,$FF, $FF,$FF, $00,$FF, $00,$FF, $FF,$00
    db $00,$FF, $00,$FF, $00,$FF, $FF,$00, $00,$FF, $00,$FF, $00,$FF, $FF,$FF
    db $00,$FF, $00,$FF, $00,$FF, $00,$FF, $FF,$00, $00,$FF, $00,$FF, $00,$FF
    db $00,$FF, $FF,$00, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $FF,$00, $00,$FF
    db $00,$FF, $00,$FF, $FF,$00, $00,$FF, $00,$FF, $FF,$00, $00,$FF, $00,$FF
    db $FF,$00, $00,$FF, $00,$FF, $FF,$00, $00,$FF, $00,$FF, $FF,$00, $00,$FF
    db $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF
    db $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00
    db $FF,$00, $00,$FF, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $00,$01, $FF,$00
    db $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$00
    db $00,$01, $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00
    db $00,$01, $00,$01, $FF,$00, $00,$01, $00,$01, $FF,$00, $00,$01, $00,$01
    db $00,$01, $FF,$00, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $FF,$00
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $FF,$00
    db $00,$01, $00,$01, $FF,$00, $00,$01, $00,$01, $FF,$00, $00,$01, $FF,$00
    db $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$FF, $FF,$00, $FF,$00, $FF,$00
    db $FF,$00, $00,$FF, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $00,$FF
    db $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF
    db $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $00,$FF, $00,$FF, $FF,$00
    db $00,$FF, $00,$FF, $00,$FF, $00,$FF, $FF,$00, $00,$FF, $00,$FF, $00,$FF
    db $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF
    db $00,$FF, $00,$FF, $00,$FF, $00,$FF, $01,$00, $00,$FF, $00,$FF, $00,$FF
    db $00,$FF, $00,$FF, $00,$FF, $01,$00, $00,$FF, $00,$FF, $00,$FF, $01,$00
    db $00,$FF, $00,$FF, $00,$FF, $01,$00, $00,$FF, $00,$FF, $01,$00, $00,$FF
    db $00,$FF, $01,$00, $00,$FF, $01,$FF, $00,$FF, $01,$00, $00,$FF, $01,$00
    db $00,$FF, $01,$00, $00,$FF, $01,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF
    db $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00
    db $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $01,$00
    db $00,$FF, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $00,$01, $01,$00, $01,$00, $01,$00, $80,$00

BotwoonMovementData_Visible_RightToLeft:
    db $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $FF,$FF, $FF,$00, $00,$FF
    db $FF,$00, $00,$FF, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00
    db $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $00,$FF, $FF,$00
    db $00,$FF, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$FF, $FF,$00, $00,$FF
    db $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $00,$FF
    db $FF,$00, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00
    db $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF
    db $FF,$00, $00,$FF, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00
    db $FF,$00, $00,$FF, $FF,$00, $FF,$00, $FF,$00, $FF,$FF, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$00
    db $00,$01, $FF,$00, $00,$01, $FF,$00, $FF,$01, $00,$01, $FF,$00, $00,$01
    db $FF,$00, $00,$01, $00,$01, $FF,$00, $00,$01, $00,$01, $00,$01, $FF,$00
    db $00,$01, $00,$01, $00,$01, $FF,$00, $00,$01, $00,$01, $FF,$00, $00,$01
    db $00,$01, $00,$01, $FF,$00, $00,$01, $00,$01, $00,$01, $FF,$00, $00,$01
    db $00,$01, $00,$01, $FF,$00, $00,$01, $00,$01, $00,$01, $FF,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $FF,$00, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $01,$00, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $01,$00, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $01,$00, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $01,$00
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $01,$00, $00,$01, $00,$01
    db $00,$01, $00,$01, $01,$00, $00,$01, $00,$01, $00,$01, $01,$00, $00,$01
    db $00,$01, $01,$00, $00,$01, $01,$00, $00,$01, $00,$01, $01,$00, $00,$01
    db $01,$00, $00,$01, $01,$00, $01,$00, $00,$01, $01,$00, $01,$01, $01,$00
    db $01,$00, $00,$01, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $01,$00
    db $00,$FF, $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00, $00,$FF
    db $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF
    db $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $00,$FF, $01,$00, $00,$FF
    db $00,$FF, $01,$00, $00,$FF, $00,$FF, $01,$00, $00,$FF, $00,$FF, $00,$FF
    db $00,$FF, $01,$00, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF
    db $01,$FF, $00,$FF, $FF,$00, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF
    db $00,$FF, $FF,$FF, $00,$FF, $00,$FF, $FF,$00, $00,$FF, $00,$FF, $FF,$00
    db $00,$FF, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $00,$FF, $FF,$00
    db $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $FF,$FF, $FF,$00
    db $00,$FF, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00
    db $00,$FF, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $FF,$00, $00,$FF
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$00, $FF,$00
    db $FF,$00, $00,$01, $FF,$00, $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$00
    db $00,$01, $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$00, $00,$01, $FF,$00
    db $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00, $FF,$00, $00,$01, $FF,$00
    db $FF,$00, $00,$01, $FF,$00, $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00
    db $FF,$00, $00,$01, $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$00, $00,$01
    db $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$00
    db $FF,$00, $00,$01, $FF,$00, $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00
    db $00,$FF, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$FF, $FF,$00, $00,$FF
    db $FF,$00, $00,$FF, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $00,$FF
    db $FF,$00, $00,$FF, $00,$FF, $FF,$00, $00,$FF, $00,$FF, $00,$FF, $FF,$FF
    db $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF
    db $01,$FF, $00,$FF, $00,$FF, $00,$FF, $01,$00, $00,$FF, $00,$FF, $01,$00
    db $00,$FF, $00,$FF, $00,$FF, $01,$00, $00,$FF, $00,$FF, $01,$00, $00,$FF
    db $00,$FF, $00,$FF, $00,$FF, $01,$00, $00,$FF, $00,$FF, $00,$FF, $00,$FF
    db $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF
    db $FF,$00, $00,$FF, $00,$FF, $00,$FF, $FF,$00, $00,$FF, $00,$FF, $FF,$00
    db $00,$FF, $FF,$00, $00,$FF, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $FF,$00
    db $00,$FF, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $FF,$00, $00,$FF
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $80,$00

BotwoonMovementData_Visible_RightToBottom:
    db $FF,$00, $00,$FF, $FF,$00, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00
    db $FF,$00, $00,$FF, $FF,$00, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00
    db $FF,$00, $00,$FF, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $00,$FF, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $FF,$00, $FF,$00
    db $00,$FF, $FF,$00, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $00,$FF
    db $FF,$00, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $FF,$FF, $FF,$FF
    db $FF,$FF, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$FF, $00,$FF
    db $FF,$00, $00,$FF, $00,$FF, $FF,$00, $00,$FF, $00,$FF, $FF,$00, $00,$FF
    db $00,$FF, $FF,$00, $00,$FF, $00,$FF, $00,$FF, $FF,$00, $00,$FF, $00,$FF
    db $00,$FF, $FF,$00, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $FF,$00
    db $00,$FF, $00,$FF, $00,$FF, $00,$FF, $01,$FF, $00,$FF, $00,$FF, $00,$FF
    db $01,$00, $00,$FF, $00,$FF, $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF
    db $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $00,$01
    db $01,$00, $01,$00, $00,$01, $01,$00, $00,$01, $00,$01, $01,$00, $00,$01
    db $00,$01, $01,$00, $00,$01, $00,$01, $00,$01, $00,$01, $01,$00, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $FF,$00, $00,$01, $00,$01, $00,$01, $FF,$00
    db $00,$01, $00,$01, $FF,$00, $00,$01, $00,$01, $FF,$00, $00,$01, $FF,$00
    db $00,$01, $FF,$00, $00,$01, $FF,$00, $FF,$00, $00,$01, $FF,$00, $00,$01
    db $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$00
    db $00,$01, $FF,$00, $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$00, $FF,$00
    db $FF,$01, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $FF,$01, $FF,$00, $FF,$00, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $00,$FF, $FF,$00
    db $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$FF
    db $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF
    db $FF,$FF, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $00,$FF, $FF,$00
    db $00,$FF, $FF,$00, $00,$FF, $00,$FF, $FF,$00, $00,$FF, $FF,$FF, $00,$FF
    db $FF,$00, $00,$FF, $00,$FF, $FF,$00, $00,$FF, $00,$FF, $00,$FF, $FF,$00
    db $00,$FF, $00,$FF, $00,$FF, $FF,$00, $00,$FF, $00,$FF, $00,$FF, $00,$FF
    db $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $01,$00, $00,$FF
    db $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $00,$FF, $01,$00, $00,$FF
    db $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00
    db $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $00,$01, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $00,$01
    db $01,$00, $00,$01, $01,$00, $00,$01, $01,$00, $00,$01, $01,$01, $00,$01
    db $01,$00, $00,$01, $00,$01, $01,$00, $00,$01, $01,$01, $00,$01, $00,$01
    db $01,$00, $00,$01, $00,$01, $01,$01, $00,$01, $00,$01, $00,$01, $01,$00
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $01,$00, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $01,$00
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $01,$00, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $01,$00, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $01,$00, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $FF,$00
    db $00,$01, $00,$01, $00,$01, $FF,$00, $00,$01, $00,$01, $FF,$00, $FF,$00
    db $00,$01, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $00,$FF, $FF,$00
    db $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $FF,$FF, $FF,$00, $FF,$FF
    db $FF,$00, $00,$FF, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $00,$FF
    db $FF,$00, $80,$00

BotwoonMovementData_Visible_RightToTop:
    db $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00, $FF,$00, $00,$01, $FF,$00
    db $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00, $FF,$00, $00,$01, $FF,$00
    db $00,$01, $FF,$00, $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00, $FF,$00
    db $00,$01, $FF,$00, $00,$01, $FF,$00, $FF,$00, $00,$01, $FF,$00, $00,$01
    db $FF,$00, $FF,$01, $FF,$00, $00,$01, $FF,$00, $FF,$00, $00,$01, $FF,$00
    db $00,$01, $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$00, $FF,$00, $00,$01
    db $FF,$00, $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$00, $FF,$00, $FF,$00
    db $00,$01, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $FF,$00, $00,$FF, $FF,$00
    db $FF,$00, $00,$FF, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00
    db $00,$FF, $FF,$00, $FF,$FF, $FF,$00, $00,$FF, $00,$FF, $FF,$00, $00,$FF
    db $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$FF, $00,$FF, $FF,$00, $00,$FF
    db $00,$FF, $FF,$00, $00,$FF, $00,$FF, $FF,$00, $00,$FF, $00,$FF, $00,$FF
    db $FF,$00, $00,$FF, $00,$FF, $00,$FF, $FF,$00, $00,$FF, $00,$FF, $00,$FF
    db $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF
    db $00,$FF, $00,$FF, $00,$FF, $00,$FF, $01,$00, $00,$FF, $00,$FF, $00,$FF
    db $01,$00, $00,$FF, $00,$FF, $01,$00, $00,$FF, $00,$FF, $01,$00, $00,$FF
    db $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00
    db $00,$FF, $01,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF
    db $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00
    db $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $01,$FF
    db $01,$00, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $00,$01
    db $01,$00, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $00,$01, $01,$00
    db $01,$00, $00,$01, $01,$00, $01,$00, $00,$01, $01,$00, $00,$01, $01,$00
    db $00,$01, $01,$00, $00,$01, $01,$00, $00,$01, $01,$00, $00,$01, $00,$01
    db $01,$00, $00,$01, $01,$01, $00,$01, $00,$01, $01,$00, $00,$01, $00,$01
    db $00,$01, $01,$00, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $FF,$00, $00,$01, $00,$01, $00,$01, $00,$01, $FF,$00, $00,$01, $00,$01
    db $FF,$00, $00,$01, $00,$01, $FF,$00, $00,$01, $00,$01, $FF,$00, $00,$01
    db $FF,$00, $00,$01, $00,$01, $FF,$00, $00,$01, $FF,$00, $FF,$00, $00,$01
    db $FF,$00, $00,$01, $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$00, $FF,$00, $00,$FF, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $00,$FF
    db $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$FF, $FF,$FF, $00,$FF, $FF,$00
    db $00,$FF, $FF,$00, $00,$FF, $00,$FF, $00,$FF, $FF,$00, $00,$FF, $00,$FF
    db $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF
    db $00,$FF, $01,$00, $00,$FF, $00,$FF, $00,$FF, $01,$00, $00,$FF, $00,$FF
    db $00,$FF, $01,$00, $00,$FF, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF
    db $01,$FF, $01,$FF, $01,$00, $00,$FF, $01,$00, $01,$FF, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $00,$01, $01,$00
    db $01,$01, $01,$00, $00,$01, $01,$00, $00,$01, $00,$01, $01,$00, $00,$01
    db $01,$00, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $FF,$00
    db $00,$01, $00,$01, $FF,$00, $FF,$01, $FF,$00, $00,$01, $FF,$00, $FF,$00
    db $00,$01, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $00,$FF, $FF,$00
    db $FF,$00, $00,$FF, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $00,$FF
    db $00,$FF, $FF,$00, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $FF,$00
    db $00,$FF, $00,$FF, $00,$FF, $00,$FF, $FF,$00, $00,$FF, $00,$FF, $00,$FF
    db $00,$FF, $FF,$00, $00,$FF, $00,$FF, $00,$FF, $FF,$00, $00,$FF, $00,$FF
    db $00,$FF, $FF,$00, $00,$FF, $00,$FF, $00,$FF, $FF,$00, $00,$FF, $00,$FF
    db $FF,$00, $00,$FF, $00,$FF, $FF,$FF, $00,$FF, $00,$FF, $FF,$00, $00,$FF
    db $80,$00

BotwoonMovementData_Visible_RightToRight:
    db $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $FF,$FF, $FF,$00, $00,$FF
    db $FF,$00, $FF,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $FF,$00
    db $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $00,$FF
    db $FF,$00, $00,$FF, $FF,$00, $FF,$FF, $FF,$00, $00,$FF, $FF,$00, $FF,$FF
    db $FF,$00, $00,$FF, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $00,$FF
    db $FF,$00, $FF,$00, $FF,$FF, $FF,$00, $FF,$00, $FF,$00, $00,$FF, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$FF, $FF,$00, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00
    db $FF,$00, $00,$01, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$01
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$00, $FF,$00
    db $FF,$01, $FF,$00, $FF,$00, $FF,$01, $FF,$00, $FF,$01, $FF,$00, $00,$01
    db $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$00, $FF,$01, $FF,$00, $FF,$00
    db $FF,$00, $00,$01, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $FF,$01, $FF,$00, $FF,$00, $FF,$00, $FF,$00
    db $00,$01, $FF,$00, $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$00, $00,$01
    db $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$00, $00,$01, $FF,$00, $00,$01
    db $FF,$00, $FF,$01, $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$01, $FF,$01
    db $00,$01, $FF,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $01,$01, $00,$01, $00,$01, $01,$00, $00,$01
    db $01,$01, $01,$01, $00,$01, $01,$00, $01,$01, $01,$00, $00,$01, $01,$00
    db $01,$00, $00,$01, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $01,$00
    db $01,$00, $00,$01, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $00,$01, $01,$00, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00
    db $00,$01, $01,$00, $01,$01, $01,$00, $00,$01, $01,$00, $01,$01, $01,$00
    db $00,$01, $01,$00, $00,$01, $01,$00, $00,$01, $01,$00, $00,$01, $00,$01
    db $01,$00, $00,$01, $01,$00, $00,$01, $00,$01, $01,$00, $00,$01, $00,$01
    db $01,$00, $00,$01, $00,$01, $00,$01, $00,$01, $01,$00, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $FF,$00, $00,$01, $00,$01, $00,$01, $FF,$01, $00,$01, $00,$01, $FF,$00
    db $00,$01, $00,$01, $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$01, $FF,$01
    db $FF,$01, $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00, $FF,$00, $00,$01
    db $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$00, $FF,$00, $FF,$01, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00
    db $FF,$FF, $FF,$00, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $FF,$FF
    db $FF,$00, $00,$FF, $FF,$00, $FF,$FF, $FF,$FF, $FF,$FF, $00,$FF, $FF,$00
    db $00,$FF, $FF,$FF, $00,$FF, $FF,$FF, $00,$FF, $00,$FF, $FF,$00, $00,$FF
    db $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF
    db $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $01,$00, $00,$FF, $00,$FF
    db $00,$FF, $01,$00, $00,$FF, $00,$FF, $01,$00, $00,$FF, $01,$FF, $00,$FF
    db $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$FF, $00,$FF, $01,$00, $00,$FF
    db $01,$00, $01,$FF, $01,$FF, $01,$00, $00,$FF, $01,$00, $01,$FF, $01,$00
    db $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00
    db $01,$00, $00,$FF, $01,$00, $01,$00, $01,$FF, $01,$00, $01,$00, $01,$FF
    db $01,$00, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$FF, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$FF, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $00,$FF
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$01, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$FF, $01,$00, $01,$00
    db $01,$00, $01,$FF, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $01,$FF
    db $01,$00, $00,$FF, $01,$00, $01,$FF, $01,$FF, $01,$00, $00,$FF, $01,$FF
    db $00,$FF, $01,$00, $00,$FF, $00,$FF, $01,$00, $00,$FF, $00,$FF, $00,$FF
    db $00,$FF, $01,$00, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $80,$00

BotwoonMovementData_Hidden_LeftToFromBottom:
    db $01,$00, $00,$01, $01,$00, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00
    db $00,$01, $01,$00, $01,$00, $00,$01, $01,$00, $00,$01, $01,$00, $01,$00
    db $00,$01, $01,$00, $00,$01, $01,$00, $00,$01, $00,$01, $01,$00, $00,$01
    db $01,$01, $00,$01, $00,$01, $01,$00, $00,$01, $00,$01, $01,$00, $00,$01
    db $00,$01, $01,$00, $00,$01, $00,$01, $01,$00, $00,$01, $01,$00, $00,$01
    db $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $01,$00, $01,$00, $00,$01
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00
    db $00,$01, $01,$00, $01,$01, $00,$01, $01,$00, $00,$01, $00,$01, $00,$01
    db $01,$00, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $FF,$00
    db $00,$01, $00,$01, $FF,$00, $00,$01, $00,$01, $FF,$00, $FF,$00, $00,$01
    db $FF,$00, $00,$01, $FF,$00, $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$00
    db $FF,$00, $00,$01, $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$00, $00,$01
    db $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00, $00,$01, $00,$01, $FF,$00
    db $00,$01, $00,$01, $FF,$00, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $01,$00, $00,$01, $00,$01, $01,$00
    db $00,$01, $01,$00, $00,$01, $01,$00, $00,$01, $01,$00, $00,$01, $01,$00
    db $00,$01, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $00,$01, $01,$00
    db $01,$00, $00,$01, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $00,$01
    db $01,$00, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF
    db $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00
    db $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00
    db $00,$FF, $01,$00, $00,$FF, $01,$00, $01,$00, $01,$00, $01,$00, $00,$01
    db $01,$00, $00,$01, $01,$00, $00,$01, $01,$00, $00,$01, $01,$00, $00,$01

BotwoonMovementData_Hidden_LeftToFromBottom_End:
    db $80,$00

BotwoonMovementData_Hidden_LeftToFromTop:
    db $01,$00, $00,$FF, $01,$00, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00
    db $01,$00, $00,$FF, $01,$00, $01,$00, $01,$FF, $01,$00, $01,$00, $01,$00
    db $00,$FF, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $00,$FF, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00
    db $01,$00, $00,$01, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $00,$01
    db $01,$00, $00,$01, $01,$00, $00,$01, $01,$00, $00,$01, $00,$01, $01,$00
    db $00,$01, $00,$01, $01,$00, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $FF,$00, $00,$01, $00,$01, $00,$01, $00,$01, $FF,$00
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $01,$00
    db $00,$01, $00,$01, $01,$00, $00,$01, $00,$01, $01,$00, $00,$01, $00,$01
    db $01,$00, $00,$01, $01,$00, $00,$01, $01,$00, $01,$00, $00,$01, $01,$00
    db $00,$01, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $01,$00, $01,$00
    db $00,$01, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $00,$FF
    db $01,$00, $01,$00, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $01,$00
    db $00,$FF, $01,$00, $01,$FF, $01,$00, $00,$FF, $01,$00, $01,$FF, $01,$00
    db $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $00,$FF, $01,$00, $00,$FF
    db $01,$00, $00,$FF, $00,$FF, $01,$00, $00,$FF, $00,$FF, $00,$FF, $01,$00
    db $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF
    db $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $FF,$00
    db $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $FF,$00, $00,$FF
    db $00,$FF, $00,$FF, $00,$FF, $00,$FF, $01,$00, $00,$FF, $00,$FF, $00,$FF
    db $01,$00, $00,$FF, $00,$FF, $01,$00, $00,$FF, $00,$FF, $01,$00, $00,$FF
    db $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00
    db $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $01,$00, $01,$00, $00,$01
    db $01,$00, $01,$00, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $01,$01
    db $01,$00, $01,$00, $00,$01, $01,$00

BotwoonMovementData_Hidden_LeftToFromTop_End:
    db $80,$00

BotwoonMovementData_Hidden_LeftToFromRight:
    db $00,$01, $01,$00, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $01,$00
    db $00,$01, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $00,$01, $01,$00
    db $01,$00, $00,$01, $01,$00, $01,$00, $00,$01, $01,$00, $01,$01, $01,$00
    db $00,$01, $01,$00, $00,$01, $01,$00, $01,$00, $00,$01, $01,$00, $00,$01
    db $01,$00, $01,$00, $00,$01, $01,$00, $00,$01, $01,$00, $01,$00, $00,$01
    db $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00
    db $00,$01, $01,$00, $01,$00, $01,$00, $00,$01, $01,$00, $01,$01, $01,$00
    db $00,$01, $01,$00, $01,$00, $00,$01, $01,$00, $00,$01, $01,$00, $00,$01
    db $01,$00, $00,$01, $01,$00, $00,$01, $01,$00, $00,$01, $01,$00, $00,$01
    db $01,$00, $00,$01, $01,$00, $00,$01, $01,$00, $01,$00, $00,$01, $01,$00
    db $00,$01, $01,$00, $00,$01, $01,$00, $01,$00, $00,$01, $01,$00, $00,$01
    db $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00
    db $00,$01, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $00,$01, $01,$00
    db $01,$00, $00,$01, $01,$00, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00
    db $00,$01, $01,$00, $01,$00, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $00,$01, $01,$00, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $01,$00
    db $01,$00, $00,$01, $01,$00, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$01, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $00,$FF, $01,$00
    db $01,$00, $01,$00

BotwoonMovementData_Hidden_LeftToFromRight_End:
    db $80,$00

BotwoonMovementData_Hidden_BottomToFromTop:
    db $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00
    db $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF
    db $01,$00, $00,$FF, $01,$00, $01,$FF, $01,$FF, $01,$FF, $01,$FF, $00,$FF
    db $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $00,$FF, $01,$00
    db $00,$FF, $01,$FF, $00,$FF, $01,$FF, $00,$FF, $00,$FF, $01,$00, $00,$FF
    db $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF
    db $00,$FF, $FF,$00, $00,$FF, $00,$FF, $FF,$00, $00,$FF, $00,$FF, $FF,$00
    db $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00
    db $00,$FF, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $FF,$00, $00,$FF
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00
    db $FF,$00, $00,$FF, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$FF, $00,$FF
    db $FF,$00, $00,$FF, $FF,$FF, $00,$FF, $00,$FF, $00,$FF, $FF,$00, $00,$FF
    db $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $01,$00, $00,$FF, $00,$FF
    db $00,$FF, $01,$00, $00,$FF, $01,$FF, $01,$00, $00,$FF, $01,$00, $01,$00
    db $00,$FF, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$01, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $01,$00, $00,$FF, $01,$00
    db $00,$FF, $01,$00, $01,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00
    db $00,$FF, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF
    db $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF

BotwoonMovementData_Hidden_BottomToFromTop_End:
    db $80,$00

BotwoonMovementData_Hidden_BottomToFromRight:
    db $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF
    db $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF
    db $01,$00, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF
    db $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00
    db $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00
    db $00,$FF, $00,$FF, $01,$00, $00,$FF, $00,$FF, $00,$FF, $01,$00, $00,$FF
    db $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF
    db $FF,$00, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $01,$00, $00,$FF, $00,$FF
    db $00,$FF, $00,$FF, $01,$00, $00,$FF, $00,$FF, $01,$00, $00,$FF, $01,$00
    db $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $01,$00
    db $01,$00, $00,$FF, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $00,$01, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $00,$01, $01,$00
    db $01,$01, $00,$01, $01,$00, $00,$01, $01,$00, $00,$01, $00,$01, $01,$00
    db $00,$01, $00,$01, $01,$00, $00,$01, $00,$01, $01,$00, $00,$01, $00,$01
    db $01,$00, $00,$01, $00,$01, $01,$00, $00,$01, $01,$00, $00,$01, $01,$01
    db $01,$00, $00,$01, $01,$00, $00,$01, $01,$00, $01,$00, $00,$01, $01,$00
    db $01,$00, $00,$01, $01,$00, $01,$00, $01,$00, $01,$00, $00,$01, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00
    db $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF
    db $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF
    db $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF

BotwoonMovementData_Hidden_BottomToFromRight_End:
    db $80,$00

BotwoonMovementData_Hidden_TopToFromRight:
    db $00,$01, $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00, $00,$01, $00,$01
    db $FF,$00, $00,$01, $FF,$00, $00,$01, $00,$01, $FF,$00, $00,$01, $00,$01
    db $FF,$00, $00,$01, $00,$01, $FF,$00, $00,$01, $00,$01, $00,$01, $FF,$00
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $01,$00, $00,$01, $00,$01, $00,$01
    db $01,$00, $00,$01, $01,$00, $00,$01, $00,$01, $01,$00, $00,$01, $01,$00
    db $00,$01, $01,$00, $00,$01, $01,$00, $00,$01, $01,$00, $01,$00, $00,$01
    db $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $01,$00, $00,$01, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $00,$FF, $01,$00, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF
    db $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF
    db $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF
    db $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00
    db $01,$00, $00,$FF, $01,$00, $01,$00, $01,$00, $01,$00, $00,$FF, $01,$00
    db $01,$00, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $FF,$00
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $01,$01, $00,$01, $00,$01
    db $01,$00, $00,$01, $01,$00, $00,$01, $01,$01, $00,$01, $01,$00, $00,$01
    db $01,$00, $01,$00, $00,$01, $01,$00, $00,$01, $01,$00, $01,$00, $00,$01
    db $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $00,$FF, $01,$00, $01,$00, $00,$FF, $00,$FF, $01,$00, $00,$FF, $00,$FF
    db $01,$00, $00,$FF, $00,$FF, $00,$FF, $01,$FF, $00,$FF, $00,$FF

BotwoonMovementData_Hidden_TopToFromRight_End:
    db $80,$00


;;; $E150: Botwoon movement table ;;;
BotwoonMovementTable:
;      ________________ Movement data pointer
;        ______________ Direction. 0 = forwards, FFFFh = backwards
;       |      ________ Destination hole. 0 = left, 8 = bottom, 10h = top, 18h = right
;       |     |
    dw BotwoonMovementData_Visible_LeftToBottom
    dw $0000,$0008,$0000
    dw BotwoonMovementData_Visible_LeftToTop
    dw $0000,$0010,$0000
    dw BotwoonMovementData_Visible_LeftToRight
    dw $0000,$0018,$0000
    dw BotwoonMovementData_Visible_LeftToLeft
    dw $0000,$0000,$0000
    dw BotwoonMovementData_Visible_BottomToLeft
    dw $0000,$0000,$0000
    dw BotwoonMovementData_Visible_BottomToTop
    dw $0000,$0010,$0000
    dw BotwoonMovementData_Visible_BottomToRight
    dw $0000,$0018,$0000
    dw BotwoonMovementData_Visible_BottomToBottom
    dw $0000,$0008,$0000
    dw BotwoonMovementData_Visible_TopToLeft
    dw $0000,$0000,$0000
    dw BotwoonMovementData_Visible_TopToBottom
    dw $0000,$0008,$0000
    dw BotwoonMovementData_Visible_TopToRight
    dw $0000,$0018,$0000
    dw BotwoonMovementData_Visible_TopToTop
    dw $0000,$0010,$0000
    dw BotwoonMovementData_Visible_RightToLeft
    dw $0000,$0000,$0000
    dw BotwoonMovementData_Visible_RightToBottom
    dw $0000,$0008,$0000
    dw BotwoonMovementData_Visible_RightToTop
    dw $0000,$0010,$0000
    dw BotwoonMovementData_Visible_RightToRight
    dw $0000,$0018,$0000
    dw BotwoonMovementData_Hidden_LeftToFromBottom
    dw $0000,$0008,$0000
    dw BotwoonMovementData_Hidden_LeftToFromTop
    dw $0000,$0010,$0000
    dw BotwoonMovementData_Hidden_LeftToFromRight
    dw $0000,$0018,$0000
    dw BotwoonMovementData_Hidden_LeftToFromRight
    dw $0000,$0018,$0000
    dw BotwoonMovementData_Hidden_LeftToFromBottom_End
    dw $FFFF,$0000,$0000
    dw BotwoonMovementData_Hidden_BottomToFromTop
    dw $0000,$0010,$0000
    dw BotwoonMovementData_Hidden_BottomToFromRight
    dw $0000,$0018,$0000
    dw BotwoonMovementData_Hidden_BottomToFromRight
    dw $0000,$0018,$0000
    dw BotwoonMovementData_Hidden_LeftToFromTop_End
    dw $FFFF,$0000,$0000
    dw BotwoonMovementData_Hidden_BottomToFromTop_End
    dw $FFFF,$0008,$0000
    dw BotwoonMovementData_Hidden_TopToFromRight
    dw $0000,$0018,$0000
    dw BotwoonMovementData_Hidden_TopToFromRight
    dw $0000,$0018,$0000
    dw BotwoonMovementData_Hidden_LeftToFromRight_End
    dw $FFFF,$0000,$0000
    dw BotwoonMovementData_Hidden_BottomToFromRight_End
    dw $FFFF,$0008,$0000
    dw BotwoonMovementData_Hidden_TopToFromRight_End
    dw $FFFF,$0010,$0000
    dw BotwoonMovementData_Hidden_TopToFromRight_End
    dw $FFFF,$0010,$0000


;;; $E250: Botwoon movement function - start moving Botwoon according to movement data ;;;
Function_Botwoon_Movement_StartMovingAccordingToMovementData:
; Note the fixed point negation operation at $E2EB is off by 1.0 when the low word is zero
    LDX.W EnemyIndex ; >.<
    LDA.W #Function_Botwoon_Movement_MoveAccordingToMovementData : STA.W Botwoon.movementFunction,X
    LDA.W #$0000 : STA.L Botwoon.goingThroughHoleFlag,X
    LDA.L Botwoon.movementTableIndex,X : CLC : ADC.W #BotwoonMovementTable : TAY
    LDA.W $0000,Y : STA.L Botwoon.movementDataPointer,X
    LDA.W $0004,Y : STA.L Botwoon.targetHoleIndex,X
    LDA.W $0002,Y : STA.L Botwoon.movementDirection,X : BPL Function_Botwoon_Movement_MoveAccordingToMovementData
    LDA.L Botwoon.movementDataPointer,X : SEC
    SBC.W #$0004 : STA.L Botwoon.movementDataPointer,X
; fallthrough to Function_Botwoon_Movement_MoveAccordingToMovementData


;;; $E28C: Botwoon movement function - move Botwoon according to movement data ;;;
Function_Botwoon_Movement_MoveAccordingToMovementData:
    LDX.W EnemyIndex ; >.<
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.L Botwoon.speed,X : STA.B DP_Temp18
    LDA.W #$0002 : STA.B DP_Temp16
    LDA.L Botwoon.movementDirection,X : BPL .loop
    LDA.W #$FFFE : STA.B DP_Temp16

  .loop:
    LDA.L Botwoon.movementDataPointer,X : TAY
    LDA.W $0000,Y : AND.W #$00FF
    JSL Sign_Extend_A
    CMP.W #$FF80 : BEQ .end
    CLC : ADC.B DP_Temp12 : STA.B DP_Temp12
    LDA.W $0001,Y : AND.W #$00FF
    JSL Sign_Extend_A
    CMP.W #$FF80 : BEQ .end
    CLC : ADC.B DP_Temp14 : STA.B DP_Temp14
    LDA.L Botwoon.movementDataPointer,X : CLC : ADC.B DP_Temp16 : STA.L Botwoon.movementDataPointer,X
    DEC.B DP_Temp18 : BNE .loop
    LDA.L Botwoon.movementDirection,X : BPL .positive
    LDA.B DP_Temp12 : EOR.W #$FFFF : INC : STA.B DP_Temp12
    LDA.B DP_Temp14 : EOR.W #$FFFF : INC : STA.B DP_Temp14

  .positive:
    LDA.W Enemy.XPosition,X : CLC : ADC.B DP_Temp12 : STA.W Enemy.XPosition,X
    LDA.W Enemy.YPosition,X : CLC : ADC.B DP_Temp14 : STA.W Enemy.YPosition,X
    RTS

  .end:
    LDA.W #$0000 : STA.L ExtraEnemy8800+2,X
    LDA.W #$0001 : STA.L Botwoon.goingThroughHoleFlag,X
    RTS


;;; $E31D: Spritemaps - Botwoon ;;;
Spritemaps_Botwoon_MouthClosed_Priority2_AimingUp_FacingLeft:
    dw $0002
    %spritemapEntry(1, $1F8, $F7, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1F8, $E7, 0, 0, 2, 0, $120)

Spritemaps_Botwoon_MouthClosed_Priority2_AimingUpLeft:
    dw $0002
    %spritemapEntry(1, $1F8, $F6, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1F0, $EE, 0, 0, 2, 0, $104)

Spritemaps_Botwoon_MouthClosed_Priority2_AimingLeft:
    dw $0002
    %spritemapEntry(1, $1FC, $F8, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1EC, $F8, 0, 0, 2, 0, $100)

Spritemaps_Botwoon_MouthClosed_Priority2_AimingDownLeft:
    dw $0002
    %spritemapEntry(1, $1F8, $F9, 0, 0, 2, 0, $10A)
    %spritemapEntry(1, $1F0, $01, 0, 0, 2, 0, $108)

Spritemaps_Botwoon_MouthClosed_Priority2_AimDown_FacingLeft:
    dw $0002
    %spritemapEntry(1, $1F8, $09, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1F8, $F9, 0, 0, 2, 0, $10C)

Spritemaps_Botwoon_MouthClosed_Priority2_AimDown_FacingRight:
    dw $0002
    %spritemapEntry(1, $1F8, $09, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $1F8, $F9, 0, 1, 2, 0, $10C)

Spritemaps_Botwoon_MouthClosed_Priority2_AimingDownRight:
    dw $0002
    %spritemapEntry(1, $00, $01, 0, 1, 2, 0, $108)
    %spritemapEntry(1, $1F8, $F9, 0, 1, 2, 0, $10A)

Spritemaps_Botwoon_MouthClosed_Priority2_AimingRight:
    dw $0002
    %spritemapEntry(1, $1F4, $F8, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $04, $F8, 0, 1, 2, 0, $100)

Spritemaps_Botwoon_MouthClosed_Priority2_AimingUpRight:
    dw $0002
    %spritemapEntry(1, $00, $EE, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $1F8, $F6, 0, 1, 2, 0, $106)

Spritemaps_Botwoon_MouthClosed_Priority2_AimUp_FacingRight:
    dw $0002
    %spritemapEntry(1, $1F8, $F7, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $1F8, $E7, 0, 1, 2, 0, $120)

Spritemaps_Botwoon_MouthOpen_Priority2_AimingUp_FacingLeft:
    dw $0002
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1F8, $E8, 0, 0, 2, 0, $124)

Spritemaps_Botwoon_MouthOpen_Priority2_AimingUpLeft:
    dw $0003
    %spritemapEntry(0, $1F0, $00, 0, 0, 2, 0, $1A6)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $186)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $184)

Spritemaps_Botwoon_MouthOpen_Priority2_AimingLeft:
    dw $0002
    %spritemapEntry(1, $1FC, $F8, 0, 0, 2, 0, $182)
    %spritemapEntry(1, $1EC, $F8, 0, 0, 2, 0, $180)

Spritemaps_Botwoon_MouthOpen_Priority2_AimingDownLeft:
    dw $0003
    %spritemapEntry(0, $00, $09, 0, 0, 2, 0, $1A7)
    %spritemapEntry(1, $1F8, $F9, 0, 0, 2, 0, $18A)
    %spritemapEntry(1, $1F0, $01, 0, 0, 2, 0, $188)

Spritemaps_Botwoon_MouthOpen_Priority2_AimingDown_FacingLeft:
    dw $0002
    %spritemapEntry(1, $1F8, $09, 0, 0, 2, 0, $18E)
    %spritemapEntry(1, $1F8, $F9, 0, 0, 2, 0, $18C)

Spritemaps_Botwoon_MouthOpen_Priority2_AimDown_FacingRight:
    dw $0002
    %spritemapEntry(1, $1F8, $09, 0, 1, 2, 0, $18E)
    %spritemapEntry(1, $1F8, $F9, 0, 1, 2, 0, $18C)

Spritemaps_Botwoon_MouthOpen_Priority2_AimingDownRight:
    dw $0003
    %spritemapEntry(0, $1F8, $09, 0, 1, 2, 0, $1A7)
    %spritemapEntry(1, $1F8, $F9, 0, 1, 2, 0, $18A)
    %spritemapEntry(1, $00, $01, 0, 1, 2, 0, $188)

Spritemaps_Botwoon_MouthOpen_Priority2_AimingRight:
    dw $0002
    %spritemapEntry(1, $1F4, $F8, 0, 1, 2, 0, $182)
    %spritemapEntry(1, $04, $F8, 0, 1, 2, 0, $180)

Spritemaps_Botwoon_MouthOpen_Priority2_AimingUpRight:
    dw $0003
    %spritemapEntry(0, $08, $00, 0, 1, 2, 0, $1A6)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $186)
    %spritemapEntry(1, $00, $F0, 0, 1, 2, 0, $184)

Spritemaps_Botwoon_MouthOpen_Priority2_AimingUp_FacingRight:
    dw $0002
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $1F8, $E8, 0, 1, 2, 0, $124)

Spritemaps_Botwoon_MouthClosed_Priority0_AimingUp_FacingLeft:
    dw $0002
    %spritemapEntry(1, $1F8, $F7, 0, 0, 0, 0, $122)
    %spritemapEntry(1, $1F8, $E7, 0, 0, 0, 0, $120)

Spritemaps_Botwoon_MouthClosed_Priority0_AimingUpLeft:
    dw $0002
    %spritemapEntry(1, $1F8, $F6, 0, 0, 0, 0, $106)
    %spritemapEntry(1, $1F0, $EE, 0, 0, 0, 0, $104)

Spritemaps_Botwoon_MouthClosed_Priority0_AimingLeft:
    dw $0002
    %spritemapEntry(1, $1FC, $F8, 0, 0, 0, 0, $102)
    %spritemapEntry(1, $1EC, $F8, 0, 0, 0, 0, $100)

Spritemaps_Botwoon_MouthClosed_Priority0_AimingDownLeft:
    dw $0002
    %spritemapEntry(1, $1F8, $F9, 0, 0, 0, 0, $10A)
    %spritemapEntry(1, $1F0, $01, 0, 0, 0, 0, $108)

Spritemaps_Botwoon_MouthClosed_Priority0_AimDown_FacingLeft:
    dw $0002
    %spritemapEntry(1, $1F8, $09, 0, 0, 0, 0, $10E)
    %spritemapEntry(1, $1F8, $F9, 0, 0, 0, 0, $10C)

Spritemaps_Botwoon_MouthClosed_Priority0_AimDown_FacingRight:
    dw $0002
    %spritemapEntry(1, $1F8, $09, 0, 1, 0, 0, $10E)
    %spritemapEntry(1, $1F8, $F9, 0, 1, 0, 0, $10C)

Spritemaps_Botwoon_MouthClosed_Priority0_AimingDownRight:
    dw $0002
    %spritemapEntry(1, $00, $01, 0, 1, 0, 0, $108)
    %spritemapEntry(1, $1F8, $F9, 0, 1, 0, 0, $10A)

Spritemaps_Botwoon_MouthClosed_Priority0_AimingRight:
    dw $0002
    %spritemapEntry(1, $1F4, $F8, 0, 1, 0, 0, $102)
    %spritemapEntry(1, $04, $F8, 0, 1, 0, 0, $100)

Spritemaps_Botwoon_MouthClosed_Priority0_AimingUpRight:
    dw $0002
    %spritemapEntry(1, $00, $EE, 0, 1, 0, 0, $104)
    %spritemapEntry(1, $1F8, $F6, 0, 1, 0, 0, $106)

Spritemaps_Botwoon_MouthClosed_Priority0_AimUp_FacingRight:
    dw $0002
    %spritemapEntry(1, $1F8, $F7, 0, 1, 0, 0, $122)
    %spritemapEntry(1, $1F8, $E7, 0, 1, 0, 0, $120)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemaps_Botwoon_MouthOpen_Prio0_UpFaceLeft_B3E499:
    dw $0002
    %spritemapEntry(1, $1F8, $F8, 0, 0, 0, 0, $126)
    %spritemapEntry(1, $1F8, $E8, 0, 0, 0, 0, $124)

UNUSED_Spritemaps_Botwoon_MouthOpen_Prio0_UpLeft_B3E4A5:
    dw $0003
    %spritemapEntry(0, $1F0, $00, 0, 0, 0, 0, $1A6)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 0, 0, $186)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 0, 0, $184)

UNUSED_Spritemaps_Botwoon_MouthOpen_Prio0_Left_B3E4B6:
    dw $0002
    %spritemapEntry(1, $1FC, $F8, 0, 0, 0, 0, $182)
    %spritemapEntry(1, $1EC, $F8, 0, 0, 0, 0, $180)

UNUSED_Spritemaps_Botwoon_MouthOpen_Prio0_DownLeft_B3E4C2:
    dw $0003
    %spritemapEntry(0, $00, $09, 0, 0, 0, 0, $1A7)
    %spritemapEntry(1, $1F8, $F9, 0, 0, 0, 0, $18A)
    %spritemapEntry(1, $1F0, $01, 0, 0, 0, 0, $188)

UNUSED_Spritemap_Botwoon_MouthOpen_Prio0_DownFaceLeft_B3E4D3:
    dw $0002
    %spritemapEntry(1, $1F8, $09, 0, 0, 0, 0, $18E)
    %spritemapEntry(1, $1F8, $F9, 0, 0, 0, 0, $18C)

UNUSED_Spritemap_Botwoon_MouthOpen_Pri0_DownFaceRight_B3E4DF:
    dw $0002
    %spritemapEntry(1, $1F8, $09, 0, 1, 0, 0, $18E)
    %spritemapEntry(1, $1F8, $F9, 0, 1, 0, 0, $18C)

UNUSED_Spritemaps_Botwoon_MouthOpen_Prio0_DownRight_B3E4EB:
    dw $0003
    %spritemapEntry(0, $1F8, $09, 0, 1, 0, 0, $1A7)
    %spritemapEntry(1, $1F8, $F9, 0, 1, 0, 0, $18A)
    %spritemapEntry(1, $00, $01, 0, 1, 0, 0, $188)

UNUSED_Spritemaps_Botwoon_MouthOpen_Prio0_Right_B3E4FC:
    dw $0002
    %spritemapEntry(1, $1F4, $F8, 0, 1, 0, 0, $182)
    %spritemapEntry(1, $04, $F8, 0, 1, 0, 0, $180)

UNUSED_Spritemaps_Botwoon_MouthOpen_Prio0_UpRight_B3E508:
    dw $0003
    %spritemapEntry(0, $08, $00, 0, 1, 0, 0, $1A6)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 0, 0, $186)
    %spritemapEntry(1, $00, $F0, 0, 1, 0, 0, $184)

UNUSED_Spritemaps_Botwoon_MouthOpen_Prio0_UpFaceRight_B3E519:
    dw $0002
    %spritemapEntry(1, $1F8, $F8, 0, 1, 0, 0, $126)
    %spritemapEntry(1, $1F8, $E8, 0, 1, 0, 0, $124)
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $E525: Palette - enemy $F2D3 (escape etecoon) ;;;
Palette_EtecoonEscape:
    dw $3800,$5F97,$56F2,$2987,$00A0,$6355,$4AB0,$3A0B
    dw $31C9,$57FF,$42F7,$2610,$158C,$03FF,$0279,$0029


;;; $E545: Instruction - go to [[Y]] if [acid Y position] < CEh ;;;
Instruction_EtecoonEscape_GotoY_IfAcidPositionLessThanCE:
    LDA.W FX_LavaAcidYPosition : CMP.W #$00CE : BCS .greaterThanCE
    LDA.W $0000,Y : TAY
    RTL

  .greaterThanCE:
    INY #2
    RTL


;;; $E555: RTS ;;;
RTS_B3E555:
    RTS


;;; $E556: Instruction list - running left - low tide ;;;
InstList_EtecoonEscape_RunningLeft_LowTide_0:
    dw Instruction_EtecoonEscape_GotoY_IfAcidPositionLessThanCE
    dw InstList_EtecoonEscape_RunningLeft_HighTide

InstList_EtecoonEscape_RunningLeft_LowTide_1:
    dw $0005,Spritemaps_EtecoonEscape_0
    dw $0005,Spritemaps_EtecoonEscape_1
    dw $0005,Spritemaps_EtecoonEscape_2
    dw $0005,Spritemaps_EtecoonEscape_1
    dw Instruction_Common_GotoY
    dw InstList_EtecoonEscape_RunningLeft_LowTide_1


;;; $E56E: Instruction list - running left - high tide ;;;
InstList_EtecoonEscape_RunningLeft_HighTide:
    dw $0003,Spritemaps_EtecoonEscape_0
    dw $0003,Spritemaps_EtecoonEscape_1
    dw $0003,Spritemaps_EtecoonEscape_2
    dw $0003,Spritemaps_EtecoonEscape_1
    dw Instruction_Common_GotoY
    dw InstList_EtecoonEscape_RunningLeft_HighTide


;;; $E582: Instruction list - running right - low tide ;;;
InstList_EtecoonEscape_RunningRight_LowTide_0:
    dw Instruction_EtecoonEscape_GotoY_IfAcidPositionLessThanCE
    dw InstList_EtecoonEscape_RunningRight_HighTide

InstList_EtecoonEscape_RunningRight_LowTide_1:
    dw $0006,Spritemaps_EtecoonEscape_3
    dw $0006,Spritemaps_EtecoonEscape_4
    dw $0006,Spritemaps_EtecoonEscape_5
    dw $0006,Spritemaps_EtecoonEscape_4
    dw Instruction_Common_GotoY
    dw InstList_EtecoonEscape_RunningRight_LowTide_1


;;; $E59A: Instruction list - running right - high tide ;;;
InstList_EtecoonEscape_RunningRight_HighTide:
    dw $0003,Spritemaps_EtecoonEscape_3
    dw $0003,Spritemaps_EtecoonEscape_4
    dw $0003,Spritemaps_EtecoonEscape_5
    dw $0003,Spritemaps_EtecoonEscape_4
    dw Instruction_Common_GotoY
    dw InstList_EtecoonEscape_RunningRight_HighTide


;;; $E5AE: Instruction list - running for escape ;;;
InstList_EtecoonEscape_RunningForEscape_0:
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_EtecoonEscape_RunningForEscape

InstList_EtecoonEscape_RunningForEscape_1:
    dw $0003,Spritemaps_EtecoonEscape_3
    dw $0003,Spritemaps_EtecoonEscape_4
    dw $0003,Spritemaps_EtecoonEscape_5
    dw $0003,Spritemaps_EtecoonEscape_4
    dw Instruction_Common_GotoY
    dw InstList_EtecoonEscape_RunningForEscape_1


;;; $E5C6: Instruction list - stationary ;;;
InstList_EtecoonEscape_Stationary:
    dw $0040,Spritemaps_EtecoonEscape_E
    dw $0008,Spritemaps_EtecoonEscape_F
    dw $0040,Spritemaps_EtecoonEscape_11
    dw $0008,Spritemaps_EtecoonEscape_10
    dw Instruction_Common_GotoY
    dw InstList_EtecoonEscape_Stationary


;;; $E5DA: Instruction list - express gratitude then escape ;;;
InstList_EtecoonEscape_ExpressGratitudeThenEscape_0:
    dw Instruction_Common_SetEnemy0FB2ToRTS
    dw Instruction_Common_TimerInY,$0008

InstList_EtecoonEscape_ExpressGratitudeThenEscape_1:
    dw $0008,Spritemaps_EtecoonEscape_0
    dw Instruction_EtecoonEscape_XPositionPlusY,$FFFD
    dw $0008,Spritemaps_EtecoonEscape_1
    dw Instruction_EtecoonEscape_XPositionPlusY,$FFFD
    dw $0008,Spritemaps_EtecoonEscape_2
    dw Instruction_EtecoonEscape_XPositionPlusY,$FFFD
    dw $0008,Spritemaps_EtecoonEscape_1
    dw Instruction_EtecoonEscape_XPositionPlusY,$FFFD
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate
    dw InstList_EtecoonEscape_ExpressGratitudeThenEscape_1
    dw $0040,Spritemaps_EtecoonEscape_E
    dw $0008,Spritemaps_EtecoonEscape_F
    dw Instruction_Common_GotoY
    dw InstList_EtecoonEscape_RunningForEscape_0


;;; $E610: Instruction - enemy X position += [[Y]] ;;;
Instruction_EtecoonEscape_XPositionPlusY:
    LDA.W Enemy.XPosition,X : CLC : ADC.W $0000,Y : STA.W Enemy.XPosition,X
    INY #2
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $E61D: Unused. Instruction list ;;;
UNUSED_InstList_EtecoonEscape_B3E61D:
    dw $0001,Spritemaps_EtecoonEscape_6
    dw Instruction_Common_Sleep


;;; $E623: Unused. Instruction list ;;;
UNUSED_InstList_EtecoonEscape_B3E623:
    dw $000C,Spritemaps_EtecoonEscape_7
    dw $000C,Spritemaps_EtecoonEscape_8
    dw $0006,Spritemaps_EtecoonEscape_9
    dw $000C,Spritemaps_EtecoonEscape_8
    dw $000C,Spritemaps_EtecoonEscape_7
    dw Instruction_Common_Sleep


;;; $E639: Unused. Instruction list ;;;
UNUSED_InstList_EtecoonEscape_B3E639:
    dw $0001,Spritemaps_EtecoonEscape_A
    dw Instruction_Common_Sleep


;;; $E63F: Unused. Instruction list ;;;
UNUSED_InstList_EtecoonEscape_B3E63F:
    dw $000C,Spritemaps_EtecoonEscape_B
    dw $000C,Spritemaps_EtecoonEscape_C
    dw $0006,Spritemaps_EtecoonEscape_D
    dw $000C,Spritemaps_EtecoonEscape_C
    dw $000C,Spritemaps_EtecoonEscape_B
    dw Instruction_Common_Sleep
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $E655: Main AI - enemy $F2D3 (escape etecoon) ;;;
MainAI_EtecoonEscape:
    LDX.W EnemyIndex
    JSR.W (EtecoonEscape.function,X)
    RTL


;;; $E65C: Escape etecoon function - running for escape ;;;
Function_EtecoonEscape_RunningForEscape:
    LDA.W Enemy.XSubPosition,X : CLC : ADC.W #$8000 : STA.W Enemy.XSubPosition,X
    LDA.W Enemy.XPosition,X : ADC.W #$0003 : STA.W Enemy.XPosition,X
    RTS


;;; $E670: Escape etecoon function - stationary (waiting to express gratitude) ;;;
Function_EtecoonEscape_StationaryWaitingToExpressGratitude:
    LDA.W #$000F
    JSL CheckIfEvent_inA_HasHappened
    BCC .return
    LDA.W #InstList_EtecoonEscape_ExpressGratitudeThenEscape_0 : STA.W Enemy.instList,X

  .return:
    RTS


;;; $E680: Escape etecoon function - running around aimlessly ;;;
Function_EtecoonEscape_RunningAroundAimlessly:
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W EtecoonEscape.XVelocity,X : BPL +
    DEC.B DP_Temp14

+   STA.B DP_Temp13
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCC .noCollision
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W EtecoonEscape.XVelocity,X : EOR.W #$FFFF : INC : STA.W EtecoonEscape.XVelocity,X : BPL .greaterThan0
    LDA.W #InstList_EtecoonEscape_RunningLeft_LowTide_0
    BRA +

  .greaterThan0:
    LDA.W #InstList_EtecoonEscape_RunningRight_LowTide_0

+   STA.W Enemy.instList,X
    LDA.W #$000F
    JSL CheckIfEvent_inA_HasHappened
    BCC .noCollision
    LDA.W #InstList_EtecoonEscape_RunningForEscape_0 : STA.W Enemy.instList,X

  .noCollision:
    STZ.B DP_Temp12
    LDA.W #$0001 : STA.B DP_Temp14
    JSL MoveEnemyDownBy_14_12
    RTS


;;; $E6CB: Initialisation AI - enemy $F2D3 (escape etecoon) ;;;
InitAI_EtecoonEscape:
    LDX.W EnemyIndex ; >.<
    LDA.W #$000F
    JSL CheckIfEvent_inA_HasHappened
    BCC .notEscaped
    LDA.W Enemy.properties,X : ORA.W #$0200 : STA.W Enemy.properties,X
    RTL

  .notEscaped:
    LDA.W Enemy.properties,X : ORA.W #$A400 : STA.W Enemy.properties,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X : STZ.W Enemy.palette,X
    LDY.W Enemy.init0,X
    LDA.W .XPosition,Y : STA.W Enemy.XPosition,X
    LDA.W .YPosition,Y : STA.W Enemy.YPosition,X
    LDA.W .functionPointer,Y : STA.W EtecoonEscape.function,X
    LDA.W .instListPointer,Y : STA.W Enemy.instList,X
    LDA.W .XVelocity,Y : STA.W EtecoonEscape.XVelocity,X
    RTL

; Indexed by [enemy parameter 1]
  .XPosition:
    dw $0080,$00A0,$00E8

  .YPosition:
    dw $00C8,$00C8,$00C8

  .functionPointer:
    dw Function_EtecoonEscape_RunningAroundAimlessly
    dw Function_EtecoonEscape_RunningAroundAimlessly
    dw Function_EtecoonEscape_StationaryWaitingToExpressGratitude

  .instListPointer:
    dw InstList_EtecoonEscape_RunningLeft_LowTide_0
    dw InstList_EtecoonEscape_RunningRight_LowTide_0
    dw InstList_EtecoonEscape_Stationary

  .XVelocity:
    dw $FE00,$0280,$0000


;;; $E736: Escape etecoon spritemaps ;;;
Spritemaps_EtecoonEscape_0:
    dw $0003
    %spritemapEntry(0, $1F2, $FF, 0, 0, 3, 1, $129)
    %spritemapEntry(1, $43F5, $EF, 0, 0, 3, 1, $100)
    %spritemapEntry(1, $43FA, $F7, 0, 0, 3, 1, $102)

Spritemaps_EtecoonEscape_1:
    dw $0002
    %spritemapEntry(1, $43F5, $F0, 0, 0, 3, 1, $100)
    %spritemapEntry(1, $43FA, $F8, 0, 0, 3, 1, $104)

Spritemaps_EtecoonEscape_2:
    dw $0002
    %spritemapEntry(1, $43F5, $F1, 0, 0, 3, 1, $100)
    %spritemapEntry(1, $43FA, $F9, 0, 0, 3, 1, $106)

Spritemaps_EtecoonEscape_3:
    dw $0003
    %spritemapEntry(0, $06, $FF, 0, 1, 3, 1, $129)
    %spritemapEntry(1, $43FB, $EF, 0, 1, 3, 1, $100)
    %spritemapEntry(1, $43F6, $F7, 0, 1, 3, 1, $102)

Spritemaps_EtecoonEscape_4:
    dw $0002
    %spritemapEntry(1, $43FB, $F0, 0, 1, 3, 1, $100)
    %spritemapEntry(1, $43F6, $F8, 0, 1, 3, 1, $104)

Spritemaps_EtecoonEscape_5:
    dw $0002
    %spritemapEntry(1, $43FB, $F1, 0, 1, 3, 1, $100)
    %spritemapEntry(1, $43F6, $F9, 0, 1, 3, 1, $106)

Spritemaps_EtecoonEscape_6:
    dw $0007
    %spritemapEntry(0, $01, $FE, 0, 1, 3, 1, $122)
    %spritemapEntry(0, $1F8, $FE, 0, 0, 3, 1, $122)
    %spritemapEntry(1, $43F8, $F2, 0, 1, 3, 1, $10C)
    %spritemapEntry(0, $1F9, $01, 0, 0, 3, 1, $124)
    %spritemapEntry(0, $00, $01, 0, 1, 3, 1, $124)
    %spritemapEntry(0, $1F9, $FA, 0, 0, 3, 1, $120)
    %spritemapEntry(0, $00, $FA, 0, 1, 3, 1, $120)

Spritemaps_EtecoonEscape_7:
    dw $0007
    %spritemapEntry(0, $1F7, $FC, 0, 0, 3, 1, $122)
    %spritemapEntry(0, $02, $FC, 0, 1, 3, 1, $122)
    %spritemapEntry(1, $43F8, $F1, 0, 1, 3, 1, $10C)
    %spritemapEntry(0, $1F9, $01, 0, 0, 3, 1, $123)
    %spritemapEntry(0, $00, $01, 0, 1, 3, 1, $123)
    %spritemapEntry(0, $1F9, $FA, 0, 0, 3, 1, $120)
    %spritemapEntry(0, $00, $FA, 0, 1, 3, 1, $120)

Spritemaps_EtecoonEscape_8:
    dw $0007
    %spritemapEntry(0, $1F9, $01, 0, 0, 3, 1, $123)
    %spritemapEntry(0, $00, $01, 0, 1, 3, 1, $123)
    %spritemapEntry(1, $43F8, $EF, 0, 1, 3, 1, $10C)
    %spritemapEntry(0, $1F9, $F9, 0, 0, 3, 1, $120)
    %spritemapEntry(0, $00, $F9, 0, 1, 3, 1, $120)
    %spritemapEntry(0, $1F5, $F9, 0, 0, 3, 1, $121)
    %spritemapEntry(0, $04, $F9, 0, 1, 3, 1, $121)

Spritemaps_EtecoonEscape_9:
    dw $0007
    %spritemapEntry(0, $1F9, $01, 0, 0, 3, 1, $123)
    %spritemapEntry(0, $00, $01, 0, 1, 3, 1, $123)
    %spritemapEntry(1, $43F8, $EF, 0, 1, 3, 1, $10C)
    %spritemapEntry(0, $1F9, $F9, 0, 0, 3, 1, $120)
    %spritemapEntry(0, $00, $F9, 0, 1, 3, 1, $120)
    %spritemapEntry(0, $1F5, $F7, 0, 0, 3, 1, $121)
    %spritemapEntry(0, $04, $F7, 0, 1, 3, 1, $121)

Spritemaps_EtecoonEscape_A:
    dw $0007
    %spritemapEntry(0, $1F7, $FE, 0, 0, 3, 1, $122)
    %spritemapEntry(0, $00, $FE, 0, 1, 3, 1, $122)
    %spritemapEntry(1, $43F8, $F2, 0, 0, 3, 1, $10C)
    %spritemapEntry(0, $1FF, $01, 0, 1, 3, 1, $124)
    %spritemapEntry(0, $1F8, $01, 0, 0, 3, 1, $124)
    %spritemapEntry(0, $1FF, $FA, 0, 1, 3, 1, $120)
    %spritemapEntry(0, $1F8, $FA, 0, 0, 3, 1, $120)

Spritemaps_EtecoonEscape_B:
    dw $0007
    %spritemapEntry(0, $01, $FC, 0, 1, 3, 1, $122)
    %spritemapEntry(0, $1F6, $FC, 0, 0, 3, 1, $122)
    %spritemapEntry(1, $43F8, $F1, 0, 0, 3, 1, $10C)
    %spritemapEntry(0, $1FF, $01, 0, 1, 3, 1, $123)
    %spritemapEntry(0, $1F8, $01, 0, 0, 3, 1, $123)
    %spritemapEntry(0, $1FF, $FA, 0, 1, 3, 1, $120)
    %spritemapEntry(0, $1F8, $FA, 0, 0, 3, 1, $120)

Spritemaps_EtecoonEscape_C:
    dw $0007
    %spritemapEntry(0, $1FF, $01, 0, 1, 3, 1, $123)
    %spritemapEntry(0, $1F8, $01, 0, 0, 3, 1, $123)
    %spritemapEntry(1, $43F8, $EF, 0, 0, 3, 1, $10C)
    %spritemapEntry(0, $1FF, $F9, 0, 1, 3, 1, $120)
    %spritemapEntry(0, $1F8, $F9, 0, 0, 3, 1, $120)
    %spritemapEntry(0, $03, $F9, 0, 1, 3, 1, $121)
    %spritemapEntry(0, $1F4, $F9, 0, 0, 3, 1, $121)

Spritemaps_EtecoonEscape_D:
    dw $0007
    %spritemapEntry(0, $1FF, $01, 0, 1, 3, 1, $123)
    %spritemapEntry(0, $1F8, $01, 0, 0, 3, 1, $123)
    %spritemapEntry(1, $43F8, $EF, 0, 0, 3, 1, $10C)
    %spritemapEntry(0, $1FF, $F9, 0, 1, 3, 1, $120)
    %spritemapEntry(0, $1F8, $F9, 0, 0, 3, 1, $120)
    %spritemapEntry(0, $03, $F7, 0, 1, 3, 1, $121)
    %spritemapEntry(0, $1F4, $F7, 0, 0, 3, 1, $121)

Spritemaps_EtecoonEscape_E:
    dw $0007
    %spritemapEntry(1, $43F8, $ED, 0, 0, 3, 1, $100)
    %spritemapEntry(0, $02, $F9, 0, 1, 3, 1, $122)
    %spritemapEntry(0, $1F7, $F9, 0, 0, 3, 1, $122)
    %spritemapEntry(0, $1F9, $FF, 0, 0, 3, 1, $124)
    %spritemapEntry(0, $00, $FF, 0, 1, 3, 1, $124)
    %spritemapEntry(0, $1F9, $F7, 0, 0, 3, 1, $120)
    %spritemapEntry(0, $00, $F7, 0, 1, 3, 1, $120)

Spritemaps_EtecoonEscape_F:
    dw $0007
    %spritemapEntry(0, $02, $F9, 0, 1, 3, 1, $122)
    %spritemapEntry(0, $1F7, $F9, 0, 0, 3, 1, $122)
    %spritemapEntry(1, $43F8, $ED, 0, 1, 3, 1, $10C)
    %spritemapEntry(0, $1F9, $FF, 0, 0, 3, 1, $124)
    %spritemapEntry(0, $00, $FF, 0, 1, 3, 1, $124)
    %spritemapEntry(0, $1F9, $F7, 0, 0, 3, 1, $120)
    %spritemapEntry(0, $00, $F7, 0, 1, 3, 1, $120)

Spritemaps_EtecoonEscape_10:
    dw $0007
    %spritemapEntry(0, $1F6, $F9, 0, 0, 3, 1, $122)
    %spritemapEntry(0, $01, $F9, 0, 1, 3, 1, $122)
    %spritemapEntry(1, $43F8, $ED, 0, 0, 3, 1, $10C)
    %spritemapEntry(0, $1FF, $FF, 0, 1, 3, 1, $124)
    %spritemapEntry(0, $1F8, $FF, 0, 0, 3, 1, $124)
    %spritemapEntry(0, $1FF, $F7, 0, 1, 3, 1, $120)
    %spritemapEntry(0, $1F8, $F7, 0, 0, 3, 1, $120)

Spritemaps_EtecoonEscape_11:
    dw $0007
    %spritemapEntry(1, $43F8, $ED, 0, 0, 3, 1, $100)
    %spritemapEntry(0, $1F6, $F9, 0, 0, 3, 1, $122)
    %spritemapEntry(0, $01, $F9, 0, 1, 3, 1, $122)
    %spritemapEntry(0, $1FF, $FF, 0, 1, 3, 1, $124)
    %spritemapEntry(0, $1F8, $FF, 0, 0, 3, 1, $124)
    %spritemapEntry(0, $1FF, $F7, 0, 1, 3, 1, $120)
    %spritemapEntry(0, $1F8, $F7, 0, 0, 3, 1, $120)


;;; $E944: Palette - enemy $F313 (escape dachora) ;;;
Palette_DachoraEscape:
    dw $3800,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166
    dw $0924,$57FF,$42F7,$2610,$158C,$7C1F,$6018,$300A


;;; $E964: Instruction list - running around aimlessly - low tide ;;;
InstList_DachoraEscape_RunningAroundAimlessly_LowTide_0:
    dw Instruction_Common_TimerInY,$0005

InstList_DachoraEscape_RunningAroundAimlessly_LowTide_1:
    dw $0003,Spritemaps_DachoraEscape_0
    dw Instruction_DachoraEscape_XPositionMinus6
    dw $0003,Spritemaps_DachoraEscape_1
    dw Instruction_DachoraEscape_XPositionMinus6
    dw $0003,Spritemaps_DachoraEscape_2
    dw Instruction_DachoraEscape_XPositionMinus6
    dw $0003,Spritemaps_DachoraEscape_3
    dw Instruction_DachoraEscape_XPositionMinus6
    dw $0003,Spritemaps_DachoraEscape_4
    dw Instruction_DachoraEscape_XPositionMinus6
    dw $0003,Spritemaps_DachoraEscape_5
    dw Instruction_DachoraEscape_XPositionMinus6
    dw InstList_DachoraEscape_GotoY_IfAcidLessThanCE
    dw InstList_DachoraEscape_RunningAroundAimlessly_HighTide_2
    dw InstList_DachoraEscape_GotoY_IfCrittersEscaped
    dw InstList_DachoraEscape_RunningForEscape_0
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate
    dw InstList_DachoraEscape_RunningAroundAimlessly_LowTide_1
    dw Instruction_Common_TimerInY,$0005

InstList_DachoraEscape_RunningAroundAimlessly_LowTide_2:
    dw $0003,Spritemaps_DachoraEscape_6
    dw Instruction_DachoraEscape_XPositionPlus6
    dw $0003,Spritemaps_DachoraEscape_7
    dw Instruction_DachoraEscape_XPositionPlus6
    dw $0003,Spritemaps_DachoraEscape_8
    dw Instruction_DachoraEscape_XPositionPlus6
    dw $0003,Spritemaps_DachoraEscape_9
    dw Instruction_DachoraEscape_XPositionPlus6
    dw $0003,Spritemaps_DachoraEscape_A
    dw Instruction_DachoraEscape_XPositionPlus6
    dw $0003,Spritemaps_DachoraEscape_B
    dw Instruction_DachoraEscape_XPositionPlus6
    dw InstList_DachoraEscape_GotoY_IfAcidLessThanCE
    dw InstList_DachoraEscape_RunningAroundAimlessly_HighTide_4
    dw InstList_DachoraEscape_GotoY_IfCrittersEscaped
    dw InstList_DachoraEscape_RunningForEscape_1
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate
    dw InstList_DachoraEscape_RunningAroundAimlessly_LowTide_2
    dw Instruction_Common_GotoY
    dw InstList_DachoraEscape_RunningAroundAimlessly_LowTide_0


;;; $E9D0: Instruction list - running around aimlessly - high tide ;;;
; Parts of this instruction list are jumped to from the low tide instruction list
InstList_DachoraEscape_RunningAroundAimlessly_HighTide_0:
    dw Instruction_Common_TimerInY,$0005

InstList_DachoraEscape_RunningAroundAimlessly_HighTide_1:
    dw $0002,Spritemaps_DachoraEscape_0
    dw Instruction_DachoraEscape_XPositionMinus6
    dw $0002,Spritemaps_DachoraEscape_1
    dw Instruction_DachoraEscape_XPositionMinus6
    dw $0002,Spritemaps_DachoraEscape_2
    dw Instruction_DachoraEscape_XPositionMinus6
    dw $0002,Spritemaps_DachoraEscape_3
    dw Instruction_DachoraEscape_XPositionMinus6
    dw $0002,Spritemaps_DachoraEscape_4
    dw Instruction_DachoraEscape_XPositionMinus6
    dw $0002,Spritemaps_DachoraEscape_5
    dw Instruction_DachoraEscape_XPositionMinus6
    dw InstList_DachoraEscape_GotoY_IfCrittersEscaped
    dw InstList_DachoraEscape_RunningForEscape_0

InstList_DachoraEscape_RunningAroundAimlessly_HighTide_2:
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate
    dw InstList_DachoraEscape_RunningAroundAimlessly_HighTide_1
    dw Instruction_Common_TimerInY,$0005

InstList_DachoraEscape_RunningAroundAimlessly_HighTide_3:
    dw $0002,Spritemaps_DachoraEscape_6
    dw Instruction_DachoraEscape_XPositionPlus6
    dw $0002,Spritemaps_DachoraEscape_7
    dw Instruction_DachoraEscape_XPositionPlus6
    dw $0002,Spritemaps_DachoraEscape_8
    dw Instruction_DachoraEscape_XPositionPlus6
    dw $0002,Spritemaps_DachoraEscape_9
    dw Instruction_DachoraEscape_XPositionPlus6
    dw $0002,Spritemaps_DachoraEscape_A
    dw Instruction_DachoraEscape_XPositionPlus6
    dw $0002,Spritemaps_DachoraEscape_B
    dw Instruction_DachoraEscape_XPositionPlus6
    dw InstList_DachoraEscape_GotoY_IfCrittersEscaped
    dw InstList_DachoraEscape_RunningForEscape_1

InstList_DachoraEscape_RunningAroundAimlessly_HighTide_4:
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate
    dw InstList_DachoraEscape_RunningAroundAimlessly_HighTide_3
    dw Instruction_Common_GotoY
    dw InstList_DachoraEscape_RunningAroundAimlessly_HighTide_0


;;; $EA34: Instruction list - running for escape ;;;
; TODO: separate out this first instruction
InstList_DachoraEscape_RunningForEscape_0:
    dw $001E,Spritemaps_DachoraEscape_0

InstList_DachoraEscape_RunningForEscape_1:
    dw $005A,Spritemaps_DachoraEscape_6
    dw Instruction_DachoraEscape_XPositionPlus6
    dw $0005,Spritemaps_DachoraEscape_7
    dw Instruction_DachoraEscape_XPositionPlus6
    dw $0005,Spritemaps_DachoraEscape_8
    dw Instruction_DachoraEscape_XPositionPlus6
    dw $0004,Spritemaps_DachoraEscape_9
    dw Instruction_DachoraEscape_XPositionPlus6
    dw $0004,Spritemaps_DachoraEscape_A
    dw Instruction_DachoraEscape_XPositionPlus6
    dw $0004,Spritemaps_DachoraEscape_B
    dw Instruction_DachoraEscape_XPositionPlus6
    dw $0003,Spritemaps_DachoraEscape_6
    dw Instruction_DachoraEscape_XPositionPlus6
    dw $0003,Spritemaps_DachoraEscape_7
    dw Instruction_DachoraEscape_XPositionPlus6
    dw $0003,Spritemaps_DachoraEscape_8
    dw Instruction_DachoraEscape_XPositionPlus6
    dw $0002,Spritemaps_DachoraEscape_9
    dw Instruction_DachoraEscape_XPositionPlus6
    dw $0002,Spritemaps_DachoraEscape_A
    dw Instruction_DachoraEscape_XPositionPlus6
    dw $0002,Spritemaps_DachoraEscape_B
    dw Instruction_DachoraEscape_XPositionPlus6

InstList_DachoraEscape_RunningForEscape_2:
    dw $0001,Spritemaps_DachoraEscape_6
    dw Instruction_DachoraEscape_XPositionPlus6
    dw $0001,Spritemaps_DachoraEscape_7
    dw Instruction_DachoraEscape_XPositionPlus6
    dw $0001,Spritemaps_DachoraEscape_8
    dw Instruction_DachoraEscape_XPositionPlus6
    dw $0001,Spritemaps_DachoraEscape_9
    dw Instruction_DachoraEscape_XPositionPlus6
    dw $0001,Spritemaps_DachoraEscape_A
    dw Instruction_DachoraEscape_XPositionPlus6
    dw $0001,Spritemaps_DachoraEscape_B
    dw Instruction_DachoraEscape_XPositionPlus6
    dw Instruction_Common_GotoY
    dw InstList_DachoraEscape_RunningForEscape_2


;;; $EAA8: Instruction - go to [[Y]] if [acid Y position] < CEh ;;;
InstList_DachoraEscape_GotoY_IfAcidLessThanCE:
    LDA.W FX_LavaAcidYPosition : CMP.W #$00CE : BCS .greaterThanCE
    LDA.W $0000,Y : TAY
    RTL

  .greaterThanCE:
    INY #2
    RTL


;;; $EAB8: Instruction - go to [[Y]] if critters escaped ;;;
InstList_DachoraEscape_GotoY_IfCrittersEscaped:
    LDA.W #$000F
    JSL CheckIfEvent_inA_HasHappened
    BCC .notEscaped
    LDA.W $0000,Y : TAY
    RTL

  .notEscaped:
    INY #2
    RTL


;;; $EAC9: Instruction - enemy X position -= 6 ;;;
Instruction_DachoraEscape_XPositionMinus6:
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : SEC : SBC.W #$0006 : STA.W Enemy.XPosition,X
    RTL


;;; $EAD7: Instruction - enemy X position += 6 ;;;
Instruction_DachoraEscape_XPositionPlus6:
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : CLC : ADC.W #$0006 : STA.W Enemy.XPosition,X
    RTL


;;; $EAE5: Initialisation AI - enemy $F313 (escape dachora) ;;;
InitAI_DachoraEscape:
    LDX.W EnemyIndex
    LDA.W #$000F
    JSL CheckIfEvent_inA_HasHappened
    BCC .notEscaped
    LDA.W Enemy.properties,X : ORA.W #$0200 : STA.W Enemy.properties,X
    RTL

  .notEscaped:
    LDA.W Enemy.properties,X : ORA.W #$2000 : STA.W Enemy.properties,X
    LDA.W #Spritemap_Common_Nothing : STA.W Enemy.spritemap,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.W #InstList_DachoraEscape_RunningAroundAimlessly_LowTide_0 : STA.W Enemy.instList,X
    RTL


;;; $EB1A: RTL. Main AI - enemy $F313 (escape dachora) ;;;
RTL_B3EB1A:
    RTL


;;; $EB1B: Escape dachora spritemaps ;;;
Spritemaps_DachoraEscape_0:
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

Spritemaps_DachoraEscape_1:
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

Spritemaps_DachoraEscape_2:
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

Spritemaps_DachoraEscape_3:
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

Spritemaps_DachoraEscape_4:
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

Spritemaps_DachoraEscape_5:
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

Spritemaps_DachoraEscape_6:
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

Spritemaps_DachoraEscape_7:
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

Spritemaps_DachoraEscape_8:
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

Spritemaps_DachoraEscape_9:
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

Spritemaps_DachoraEscape_A:
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

Spritemaps_DachoraEscape_B:
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


Freespace_BankB3_ED77:
; $1289 bytes
