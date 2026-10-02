
; Enemy AI: Space pirates

org $B28000


; Common to all enemy code banks

;;; $8000: Grapple AI - no interaction. Also unfreezes enemies(!) ;;;
CommonB2_GrappleAI_NoInteraction:
; Used by skultera, Draygon body, fire arc, Phantoon, etecoon, dachora and WS ghost
    JML GrappleAI_SwitchEnemyAIToMainAI                                  ;B28000;


;;; $8005: Grapple AI - Samus latches on ;;;
CommonB2_GrappleAI_SamusLatchesOn:
; Used by gripper and Crocomire
    JML GrappleAI_SamusLatchesOnWithGrapple                              ;B28005;


;;; $800A: Grapple AI - kill enemy ;;;
CommonB2_GrappleAI_KillEnemy:
; Common
    JML GrappleAI_EnemyGrappleDeath                                      ;B2800A;


;;; $800F: Grapple AI - cancel grapple beam ;;;
CommonB2_GrappleAI_CancelGrappleBeam:
; Common
    JML GrappleAI_SwitchToFrozenAI                                       ;B2800F;


;;; $8014: Grapple AI - Samus latches on - no invincibility ;;;
CommonB2_GrappleAI_SamusLatchesOn_NoInvincibility:
; Used by powamp
    JML GrappleAI_SamusLatchesOnWithGrapple_NoInvincibility              ;B28014;


;;; $8019: Unused. Grapple AI - Samus latches on - paralyse enemy ;;;
UNUSED_CommonB2_GrappleAI_SamusLatchesOn_ParalyzeEnemy_B28019:
    JML GrappleAI_SamusLatchesOnWithGrapple_ParalyzeEnemy                ;B28019;


;;; $801E: Grapple AI - hurt Samus ;;;
CommonB2_GrappleAI_HurtSamus:
; Used by WS spark
; Hurt reaction happens in ProcessEnemyGrappleBeamCollisionResult_HurtSamus
    JML GrappleAI_SwitchToFrozenAI                                       ;B2801E;


;;; $8023: Normal enemy touch AI ;;;
CommonB2_NormalEnemyTouchAI:
    JML NormalEnemyTouchAI                                               ;B28023;


;;; $8028: Normal touch AI - no death check ;;;
CommonB2_NormalTouchAI_NoDeathCheck:
    JML NormalEnemyTouchAI_NoDeathCheck_External                         ;B28028;


;;; $802D: Normal enemy shot AI ;;;
CommonB2_NormalEnemyShotAI:
    JML NormalEnemyShotAI                                                ;B2802D;


;;; $8032: Normal enemy shot AI - no death check, no enemy shot graphic ;;;
CommonB2_NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic:
    JML NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External       ;B28032;


;;; $8037: Normal enemy power bomb AI ;;;
CommonB2_NormalEnemyPowerBombAI:
    JML NormalEnemyPowerBombAI                                           ;B28037;


;;; $803C: Normal enemy power bomb AI - no death check ;;;
CommonB2_NormalEnemyPowerBombAI_NoDeathCheck:
; Kraid's power bomb AI
    JML NormalEnemyPowerBombAI_NoDeathCheck_External                     ;B2803C;


;;; $8041: Normal enemy frozen AI ;;;
CommonB2_NormalEnemyFrozenAI:
    JML NormalEnemyFrozenAI                                              ;B28041;


;;; $8046: Creates a dud shot ;;;
CommonB2_CreateADudShot:
    JML CreateADudShot                                                   ;B28046;


;;; $804B: RTS ;;;
RTS_B2804B:
    RTS                                                                  ;B2804B;


;;; $804C: RTL ;;;
RTL_B2804C:
    RTL                                                                  ;B2804C;


;;; $804D: Spritemap - nothing ;;;
Spritemap_CommonB2_Nothing:
    dw $0000                                                             ;B2804D;


;;; $804F: Extended spritemap - nothing ;;;
ExtendedSpritemap_CommonB2_Nothing:
    dw $0001                                                             ;B2804F;
    dw $0000,$0000
    dw Spritemap_CommonB2_Nothing                                        ;B28055;
    dw Hitbox_CommonB2_Nothing                                           ;B28057;


;;; $8059: Hitbox - nothing ;;;
Hitbox_CommonB2_Nothing:
; [n entries] [[left offset] [top offset] [right offset] [bottom offset] [p touch] [p shot]]...
    dw $0001                                                             ;B28059;
    dw $0000,$0000,$0000,$0000
    dw CommonB2_NormalEnemyTouchAI                                       ;B28063;
    dw CommonB2_NormalEnemyShotAI                                        ;B28065;


;;; $8067: Instruction list - delete enemy ;;;
InstList_CommonB2_DeleteEnemy:
    dw Instruction_CommonB2_DeleteEnemy                                  ;B28067;


;;; $8069: Two NOPs ;;;
NOPNOP_B28069:
; Used as palette by respawning enemy placeholder and Draygon's eye o_O
    NOP                                                                  ;B28069;
    NOP                                                                  ;B2806A;


;;; $806B: Instruction - Enemy.var5 = [[Y]] ;;;
Instruction_CommonB2_Enemy0FB2_InY:
; Used only by torizos (for enemy movement function) and escape etecoon (for enemy function)
    LDA.W $0000,Y                                                        ;B2806B;
    STA.W Enemy.var5,X                                                   ;B2806E;
    INY                                                                  ;B28071;
    INY                                                                  ;B28072;
    RTL                                                                  ;B28073;


;;; $8074: Instruction - Enemy.var5 = RTS ;;;
Instruction_CommonB2_SetEnemy0FB2ToRTS:
    LDA.W #RTS_B2807B                                                    ;B28074;
    STA.W Enemy.var5,X                                                   ;B28077;
    RTL                                                                  ;B2807A;


RTS_B2807B:
    RTS                                                                  ;B2807B;


;;; $807C: Instruction - delete enemy ;;;
Instruction_CommonB2_DeleteEnemy:
    LDA.W Enemy.properties,X                                             ;B2807C;
    ORA.W #$0200                                                         ;B2807F;
    STA.W Enemy.properties,X                                             ;B28082;
    PLA                                                                  ;B28085;
    PEA.W ProcessEnemyInstructions_return-1                              ;B28086;
    RTL                                                                  ;B28089;


;;; $808A: Instruction - call function [[Y]] ;;;
Instruction_CommonB2_CallFunctionInY:
    LDA.W $0000,Y                                                        ;B2808A;
    STA.B DP_Temp12                                                      ;B2808D;
    PHY                                                                  ;B2808F;
    PHX                                                                  ;B28090;
    PEA.W .manualReturn-1                                                ;B28091;
    JMP.W (DP_Temp12)                                                    ;B28094;

  .manualReturn:
    PLX                                                                  ;B28097;
    PLY                                                                  ;B28098;
    INY                                                                  ;B28099;
    INY                                                                  ;B2809A;
    RTL                                                                  ;B2809B;


;;; $809C: Instruction - call function [[Y]] with A = [[Y] + 2] ;;;
Instruction_CommonB2_CallFunctionInY_WithA:
    LDA.W $0000,Y                                                        ;B2809C;
    STA.B DP_Temp12                                                      ;B2809F;
    LDA.W $0002,Y                                                        ;B280A1;
    PHY                                                                  ;B280A4;
    PHX                                                                  ;B280A5;
    PEA.W .manualReturn-1                                                ;B280A6;
    JMP.W (DP_Temp12)                                                    ;B280A9;

  .manualReturn:
    PLX                                                                  ;B280AC;
    PLY                                                                  ;B280AD;
    TYA                                                                  ;B280AE;
    CLC                                                                  ;B280AF;
    ADC.W #$0004                                                         ;B280B0;
    TAY                                                                  ;B280B3;
    RTL                                                                  ;B280B4;


;;; $80ED: Instruction - go to [[Y]] ;;;
Instruction_CommonB2_GotoY:
    LDA.W $0000,Y                                                        ;B280ED;
    TAY                                                                  ;B280F0;
    RTL                                                                  ;B280F1;


;;; $80F2: Instruction - go to [[Y]] + ±[[Y]] ;;;
Instruction_CommonB2_GotoY_PlusY:
    STY.B DP_Temp12                                                      ;B280F2;
    DEY                                                                  ;B280F4;
    LDA.W $0000,Y                                                        ;B280F5;
    XBA                                                                  ;B280F8;
    BMI .highByte                                                        ;B280F9;
    AND.W #$00FF                                                         ;B280FB;
    BRA +                                                                ;B280FE;

  .highByte:
    ORA.W #$FF00                                                         ;B28100;

+   CLC                                                                  ;B28103;
    ADC.B DP_Temp12                                                      ;B28104;
    TAY                                                                  ;B28106;
    RTL                                                                  ;B28107;


;;; $8108: Instruction - decrement timer and go to [[Y]] if non-zero ;;;
Instruction_CommonB2_DecrementTimer_GotoYIfNonZero:
    DEC.W Enemy.loopCounter,X                                            ;B28108;
    BNE Instruction_CommonB2_GotoY                                       ;B2810B;
    INY                                                                  ;B2810D;
    INY                                                                  ;B2810E;
    RTL                                                                  ;B2810F;


;;; $8110: Instruction - decrement timer and go to [[Y]] if non-zero ;;;
Instruction_CommonB2_DecrementTimer_GotoYIfNonZero_duplicate:
    DEC.W Enemy.loopCounter,X                                            ;B28110;
    BNE Instruction_CommonB2_GotoY                                       ;B28113;
    INY                                                                  ;B28115;
    INY                                                                  ;B28116;
    RTL                                                                  ;B28117;


;;; $8118: Instruction - decrement timer and go to [Y] + ±[[Y]] if non-zero ;;;
Instruction_CommonB2_DecrementTimer_GotoY_PlusY_IfNonZero:
    SEP #$20                                                             ;B28118;
    DEC.W Enemy.loopCounter,X                                            ;B2811A;
    REP #$20                                                             ;B2811D;
    BNE Instruction_CommonB2_GotoY_PlusY                                 ;B2811F;
    INY                                                                  ;B28121;
    RTL                                                                  ;B28122;


;;; $8123: Instruction - timer = [[Y]] ;;;
Instruction_CommonB2_TimerInY:
    LDA.W $0000,Y                                                        ;B28123;
    STA.W Enemy.loopCounter,X                                            ;B28126;
    INY                                                                  ;B28129;
    INY                                                                  ;B2812A;
    RTL                                                                  ;B2812B;


;;; $812C: Instruction - skip next instruction ;;;
Instruction_CommonB2_SkipNextInstruction:
    INY                                                                  ;B2812C;
    INY                                                                  ;B2812D;
    RTL                                                                  ;B2812E;


;;; $812F: Instruction - sleep ;;;
Instruction_CommonB2_Sleep:
    DEY                                                                  ;B2812F;
    DEY                                                                  ;B28130;
    TYA                                                                  ;B28131;
    STA.W Enemy.instList,X                                               ;B28132;
    PLA                                                                  ;B28135;
    PEA.W ProcessEnemyInstructions_return-1                              ;B28136;
    RTL                                                                  ;B28139;


;;; $813A: Instruction - wait [[Y]] frames ;;;
Instruction_CommonB2_WaitYFrames:
; Set instruction timer and terminate processing enemy instructions
; Used for running a delay that doesn't update graphics,
; useful for e.g. GT eye beam attack ($AA:D10D), implemented by an instruction list that has no graphical instructions,
; which allows it to be called from multiple different poses
    LDA.W $0000,Y                                                        ;B2813A;
    STA.W Enemy.instTimer,X                                              ;B2813D;
    INY                                                                  ;B28140;
    INY                                                                  ;B28141;
    TYA                                                                  ;B28142;
    STA.W Enemy.instList,X                                               ;B28143;
    PLA                                                                  ;B28146;
    PEA.W ProcessEnemyInstructions_return-1                              ;B28147;
    RTL                                                                  ;B2814A;


;;; $814B: Instruction - transfer [[Y]] bytes from [[Y] + 2] to VRAM [[Y] + 5] ;;;
Instruction_CommonB2_TransferYBytesInYToVRAM:
    PHX                                                                  ;B2814B;
    LDX.B VRAMWriteStack                                                 ;B2814C;
    LDA.W $0000,Y                                                        ;B2814F;
    STA.B VRAMWrite.size,X                                               ;B28152;
    LDA.W $0002,Y                                                        ;B28154;
    STA.B VRAMWrite.src,X                                                ;B28157;
    LDA.W $0003,Y                                                        ;B28159;
    STA.B VRAMWrite.src+1,X                                              ;B2815C;
    LDA.W $0005,Y                                                        ;B2815E;
    STA.B VRAMWrite.dest,X                                               ;B28161;
    TXA                                                                  ;B28163;
    CLC                                                                  ;B28164;
    ADC.W #$0007                                                         ;B28165;
    STA.B VRAMWriteStack                                                 ;B28168;
    TYA                                                                  ;B2816B;
    CLC                                                                  ;B2816C;
    ADC.W #$0007                                                         ;B2816D;
    TAY                                                                  ;B28170;
    PLX                                                                  ;B28171;
    RTL                                                                  ;B28172;


;;; $8173: Instruction - enable off-screen processing ;;;
Instruction_CommonB2_EnableOffScreenProcessing:
    LDA.W Enemy.properties,X                                             ;B28173;
    ORA.W #$0800                                                         ;B28176;
    STA.W Enemy.properties,X                                             ;B28179;
    RTL                                                                  ;B2817C;


;;; $817D: Instruction - disable off-screen processing ;;;
Instruction_CommonB2_DisableOffScreenProcessing:
    LDA.W Enemy.properties,X                                             ;B2817D;
    AND.W #$F7FF                                                         ;B28180;
    STA.W Enemy.properties,X                                             ;B28183;
    RTL                                                                  ;B28186;


;;; $8187: Common enemy speeds - linearly increasing ;;;
CommonB2EnemySpeeds_LinearlyIncreasing:
  .speed                                                                 ;A08187;
skip 2
  .subspeed                                                              ;A08189;
skip 2
  .negatedSpeed                                                          ;A0818B;
skip 2
  .negatedSubspeed                                                       ;A0818D;
skip -6

!i = 0
if !PAL == 0
    !n = $41
else
    !n = $43
endif
while !i < !n
    !v #= $1000*!SPF*!i ; !i must be last in product to reproduce PAL rounding errors
    dw !v>>$10, !v, -!v>>$10, -!v
    !i #= !i+1
endif


;;; $838F: Common enemy speeds - quadratically increasing ;;;
CommonB2EnemySpeeds_QuadraticallyIncreasing:
; I.e. gravity
; Used by e.g. Botwoon when dying and falling to the floor
;        _____________________ Subspeed
;       |      _______________ Speed
;       |     |      _________ Negated subspeed
;       |     |     |      ___ Negated speed
;       |     |     |     |
  .subspeed:
    dw $0000                                                             ;B2838F;
  .speed:
    dw       $0000                                                       ;B28391;
  .negatedSubspeed:
    dw             $0000                                                 ;B28393;
  .negatedSpeed:
    dw                   $0000                                           ;B28395;
    dw $0109,$0000,$FEF7,$FFFF
    dw $031B,$0000,$FCE5,$FFFF
if !PAL == 0
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
else
    dw $073F,$0000,$F8C1,$FFFF
    dw $0B63,$0000,$F49D,$FFFF
    dw $1199,$0000,$EE67,$FFFF
    dw $19E1,$0000,$E61F,$FFFF
    dw $2229,$0000,$DDD7,$FFFF
    dw $2C83,$0000,$D37D,$FFFF
    dw $36DD,$0000,$C923,$FFFF
    dw $4349,$0000,$BCB7,$FFFF
    dw $51C7,$0000,$AE39,$FFFF
    dw $6045,$0000,$9FBB,$FFFF
    dw $70D5,$0000,$8F2B,$FFFF
    dw $8165,$0000,$7E9B,$FFFF
    dw $9407,$0000,$6BF9,$FFFF
    dw $A8BB,$0000,$5745,$FFFF
    dw $BD6F,$0000,$4291,$FFFF
    dw $D435,$0000,$2BCB,$FFFF
    dw $EAFB,$0000,$1505,$FFFF
    dw $03D3,$0001,$FC2D,$FFFE
    dw $15BD,$0001,$EA43,$FFFE
    dw $30A7,$0001,$CF59,$FFFE
    dw $4DA3,$0001,$B25D,$FFFE
    dw $6A9F,$0001,$9561,$FFFE
    dw $89AD,$0001,$7653,$FFFE
    dw $AACD,$0001,$5533,$FFFE
    dw $CBED,$0001,$3413,$FFFE
    dw $EF1F,$0001,$10E1,$FFFE
    dw $0951,$0002,$F6AF,$FFFD
    dw $2E95,$0002,$D16B,$FFFD
    dw $55EB,$0002,$AA15,$FFFD
    dw $7D41,$0002,$82BF,$FFFD
    dw $A6A9,$0002,$5957,$FFFD
    dw $D011,$0002,$2FEF,$FFFD
    dw $FB8B,$0002,$0475,$FFFD
    dw $2017,$0003,$DFE9,$FFFC
    dw $4DA3,$0003,$B25D,$FFFC
    dw $7D41,$0003,$82BF,$FFFC
    dw $ACDF,$0003,$5321,$FFFC
    dw $DE8F,$0003,$2171,$FFFC
    dw $0951,$0004,$F6AF,$FFFB
    dw $3D13,$0004,$C2ED,$FFFB
    dw $72E7,$0004,$8D19,$FFFB
    dw $A8BB,$0004,$5745,$FFFB
    dw $E0A1,$0004,$1F5F,$FFFB
    dw $1199,$0005,$EE67,$FFFA
    dw $4B91,$0005,$B46F,$FFFA
    dw $879B,$0005,$7865,$FFFA
    dw $C3A5,$0005,$3C5B,$FFFA
    dw $01C1,$0005,$FE3F,$FFFA
    dw $38EF,$0006,$C711,$FFF9
    dw $791D,$0006,$86E3,$FFF9
    dw $BB5D,$0006,$44A3,$FFF9
    dw $FD9D,$0006,$0263,$FFF9
    dw $38EF,$0007,$C711,$FFF8
    dw $7F53,$0007,$80AD,$FFF8
    dw $C5B7,$0007,$3A49,$FFF8
    dw $052D,$0008,$FAD3,$FFF7
    dw $4DA3,$0008,$B25D,$FFF7
    dw $982B,$0008,$67D5,$FFF7
    dw $E4C5,$0008,$1B3B,$FFF7
    dw $285F,$0009,$D7A1,$FFF6
    dw $770B,$0009,$88F5,$FFF6
    dw $C5B7,$0009,$3A49,$FFF6
    dw $0D75,$000A,$F28B,$FFF5
    dw $6045,$000A,$9FBB,$FFF5
    dw $B315,$000A,$4CEB,$FFF5
    dw $07F7,$000B,$F809,$FFF5
    dw $53D9,$000B,$AC27,$FFF4
    dw $AACD,$000B,$5533,$FFF4
    dw $03D3,$000C,$FC2D,$FFF3
    dw $53D9,$000C,$AC27,$FFF3
    dw $AEF1,$000C,$510F,$FFF3
    dw $0109,$000D,$FEF7,$FFF2
    dw $5E33,$000D,$A1CD,$FFF2
    dw $BD6F,$000D,$4291,$FFF2
    dw $13AB,$000E,$EC55,$FFF1
    dw $74F9,$000E,$8B07,$FFF1
    dw $D647,$000E,$29B9,$FFF1
    dw $30A7,$000F,$CF59,$FFF0
    dw $9619,$000F,$69E7,$FFF0
    dw $FB8B,$000F,$0475,$FFF0
    dw $5A0F,$0010,$A5F1,$FFEF
    dw $C193,$0010,$3E6D,$FFEF
    dw $2229,$0011,$DDD7,$FFEE
    dw $8DD1,$0011,$722F,$FFEE
    dw $F979,$0011,$0687,$FFEE
    dw $5E33,$0012,$A1CD,$FFED
    dw $CBED,$0012,$3413,$FFED
    dw $32B9,$0013,$CD47,$FFEC
    dw $A497,$0013,$5B69,$FFEC
    dw $0D75,$0014,$F28B,$FFEB
    dw $8165,$0014,$7E9B,$FFEB
    dw $F555,$0014,$0AAB,$FFEB
endif


;;; $8687: Palette - enemy $F353/$F4D3/$F653 (grey space pirate) ;;;
Palette_Pirate_Grey:
    dw $3800,$5755,$4A4F,$1CE4,$0C60,$56B2,$3E0D,$2D68                   ;B28687;
    dw $2526,$5EBB,$3DB3,$292E,$1486,$033B,$0216,$0113                   ;B28697;


;;; $86A7: Palette - enemy $F393/$F513/$F693 (green space pirate) ;;;
Palette_Pirate_Green:
    dw $3800,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166                   ;B286A7;
    dw $0924,$5EBB,$3DB3,$292E,$1486,$033B,$0216,$0113                   ;B286B7;


;;; $86C7: Palette - enemy $F453/$F5D3/$F753 (magenta space pirate) ;;;
Palette_Pirate_Magenta:
    dw $3800,$4EBF,$4D9E,$1009,$0C04,$49DE,$555D,$30B0                   ;B286C7;
    dw $1C4D,$5EBB,$3DB3,$292E,$1486,$033B,$0216,$0113                   ;B286D7;


;;; $86E7: Palette - enemy $F3D3/$F553/$F6D3 (red space pirate) ;;;
Palette_Pirate_Red:
    dw $3800,$02FD,$013E,$006C,$0066,$021E,$005F,$0059                   ;B286E7;
    dw $0073,$5EBB,$3DB3,$292E,$1486,$033B,$0216,$0113                   ;B286F7;


;;; $8707: Palette - enemy $F493/$F593/$F613/$F793 (silver space pirate / gold ninja space pirate) ;;;
Palette_Pirate_Silver_GoldNinja:
    dw $3800,$6BFF,$4ED6,$14A4,$0420,$5B7B,$3E52,$31CD                   ;B28707;
    dw $2149,$5EBB,$3DB3,$292E,$1486,$033B,$0216,$0113                   ;B28717;


;;; $8727: Palette - enemy $F413/$F713 (gold non-ninja space pirate) ;;;
Palette_Pirate_Gold_NonNinja:
    dw $3800,$4BBE,$06B9,$00EA,$0065,$173A,$0276,$01F2                   ;B28727;
    dw $014D,$5EBB,$3DB3,$292E,$1486,$033B,$0216,$0113                   ;B28737;


;;; $8767: Power bomb reaction - enemy $F353/$F4D3/$F513/$F553/$F593/$F5D3/$F613/$F653/$F693/$F6D3/$F713/$F753/$F793 (grey wall space pirate / ninja space pirates / walking space pirates) ;;;
PowerBombReaction_Ninja_Walking_GreyWall:
    JSL.L NormalEnemyPowerBombAI                                         ;B28767;
    RTL                                                                  ;B2876B;


;;; $876C: Enemy touch - enemy $F353/$F393/$F3D3/$F413/$F453/$F493/$F4D3/$F513/$F553/$F593/$F5D3/$F613/$F653/$F693/$F6D3/$F713/$F753/$F793 (space pirates) ;;;
EnemyTouch_SpacePirate:
    LDX.B EnemyIndex                                                     ;B2876C;
    LDA.W Enemy.freezeTimer,X                                            ;B2876F;
    BNE .return                                                          ;B28772;
    JSL.L NormalEnemyTouchAI                                             ;B28774;

  .return:
    RTL                                                                  ;B28778;


;;; $8779: Enemy shot - space pirate - normal ;;;
EnemyShot_SpacePirate_Normal:
    LDX.B EnemyIndex                                                     ;B28779;
    LDA.W Enemy.ID,X                                                     ;B2877C;
    CMP.W #EnemyHeaders_PirateGoldNinja                                  ;B2877F;
    BEQ NormalPirateShot                                                 ;B28782;
    JSL.L NormalEnemyShotAI                                              ;B28784;
    RTL                                                                  ;B28788;


;;; $8789: Normal pirate shot ;;;
NormalPirateShot:
    LDX.B EnemyIndex                                                     ;B28789;
    LDA.W Enemy.XPosition,X                                              ;B2878C;
    STA.L EnemyProjectileData_SpecialDeathItemDropXOriginPosition        ;B2878F;
    LDA.W Enemy.YPosition,X                                              ;B28793;
    STA.L EnemyProjectileData_SpecialDeathItemDropYOriginPosition        ;B28796;
    JSL.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External     ;B2879A;
    LDA.W Enemy.health,X                                                 ;B2879E;
    BNE .return                                                          ;B287A1;
    LDX.B EnemyIndex                                                     ;B287A3;
    LDA.W Enemy.ID,X                                                     ;B287A6;
    CMP.W #EnemyHeaders_PirateGoldNinja                                  ;B287A9;
    BNE .notGold                                                         ;B287AC;
    STZ.W Enemy.var1,X                                                   ;B287AE;
    LDA.W #$0004                                                         ;B287B1;
    JSL.L EnemyDeath                                                     ;B287B4;
    JML MetalNinjaPirateDeathItemDropRoutine

  .return:
    RTL                                                                  ;B287BC;

  .notGold:
    STZ.W Enemy.var1,X                                                   ;B287BD;
    LDA.W #$0004                                                         ;B287C0;
    JML EnemyDeath


;;; $87C8: Enemy shot - space pirate - gold ninja space pirate is vulnerable ;;;
EnemyShot_SpacePirate_GoldNinjaIsVulnerable:
; Note how the vulnerability check here doesn't take beam charge into account
    LDX.B EnemyIndex                                                     ;B287C8;
    LDA.W Enemy.ID,X                                                     ;B287CB;
    CMP.W #EnemyHeaders_PirateGoldNinja                                  ;B287CE;
    BEQ .goldNinja                                                       ;B287D1;
    JMP.W NormalPirateShot                                               ;B287D3;

  .goldNinja:
    LDA.B CollisionIndex                                                 ;B287D6;
    ASL                                                                  ;B287D9;
    TAY                                                                  ;B287DA;
    LDA.W SamusProjectile_Types,Y                                        ;B287DB;
    STA.B DP_Temp12                                                      ;B287DE;
    AND.W #$0F00                                                         ;B287E0;
    CMP.W #$0300                                                         ;B287E3;
    BMI .beamMissileSuper                                                ;B287E6;
    RTL                                                                  ;B287E8;

  .beamMissileSuper:
    LDX.B EnemyIndex                                                     ;B287E9;
    LDA.W Enemy.ID,X                                                     ;B287EC;
    TAX                                                                  ;B287EF;
    LDA.L EnemyHeaders_vulnerabilities,X                                 ;B287F0;
    BNE .zeroVuln                                                        ;B287F4;
    LDA.W #EnemyVulnerabilities_Default                                  ;B287F6;

  .zeroVuln:
    STA.B DP_Temp14                                                      ;B287F9;
    LDA.B DP_Temp12                                                      ;B287FB;
    BIT.W #$0F00                                                         ;B287FD;
    BNE .notBeam                                                         ;B28800;
    LDA.B DP_Temp12                                                      ;B28802;
    AND.W #$000F                                                         ;B28804;
    CLC                                                                  ;B28807;
    ADC.B DP_Temp14                                                      ;B28808;
    TAX                                                                  ;B2880A;
    LDA.L EnemyVulnerabilities_power,X                                   ;B2880B;
    AND.W #$000F                                                         ;B2880F;
    BEQ EnemyShot_SpacePirate_GoldNinjaIsInvincible                      ;B28812;
    CMP.W #$000F                                                         ;B28814;
    BEQ EnemyShot_SpacePirate_GoldNinjaIsInvincible                      ;B28817;

  .gotoNormal:
    JMP.W NormalPirateShot                                               ;B28819;

  .notBeam:
    AND.W #$0F00                                                         ;B2881C;
    CMP.W #$0100                                                         ;B2881F;
    BEQ .missile                                                         ;B28822;
    CMP.W #$0200                                                         ;B28824;
    BNE .gotoNormal                                                      ;B28827;

  .missile:
    XBA                                                                  ;B28829;
    CLC                                                                  ;B2882A;
    ADC.B DP_Temp14                                                      ;B2882B;
    TAX                                                                  ;B2882D;
    LDA.L EnemyVulnerabilities_plasmaIceWave,X                           ;B2882E;
    AND.W #$000F                                                         ;B28832;
    BEQ EnemyShot_SpacePirate_GoldNinjaIsInvincible                      ;B28835;
    CMP.W #$000F                                                         ;B28837;
    BEQ EnemyShot_SpacePirate_GoldNinjaIsInvincible                      ;B2883A;
    BRA .gotoNormal                                                      ;B2883C;


;;; $883E: Enemy shot - space pirate - gold ninja space pirate is invincible ;;;
EnemyShot_SpacePirate_GoldNinjaIsInvincible:
    LDX.B EnemyIndex                                                     ;B2883E;
    LDA.W Enemy.ID,X                                                     ;B28841;
    CMP.W #EnemyHeaders_PirateGoldNinja                                  ;B28844;
    BEQ .gold                                                            ;B28847;
    JMP.W NormalPirateShot                                               ;B28849;

  .gold:
    LDX.B EnemyIndex                                                     ;B2884C;
    LDA.B CollisionIndex                                                 ;B2884F;
    ASL                                                                  ;B28852;
    TAY                                                                  ;B28853;
    LDA.W SamusProjectile_Types,Y                                        ;B28854;
    STA.B DP_Temp12                                                      ;B28857;
    AND.W #$0F00                                                         ;B28859;
    CMP.W #$0200                                                         ;B2885C;
    BEQ .super                                                           ;B2885F;
    CMP.W #$0300                                                         ;B28861;
    BMI .reflect                                                         ;B28864;
    RTL                                                                  ;B28866;

  .super:
    LDA.W SamusProjectile_Variables,Y                                    ;B28867;
    BEQ .return                                                          ;B2886A;

  .reflect:
    LDA.W #$000A                                                         ;B2886C;
    STA.W Enemy.invincibilityTimer,X                                     ;B2886F;
    LDA.W SamusProjectile_Directions,Y                                   ;B28872;
    AND.W #$000F                                                         ;B28875;
    CMP.W #$0007                                                         ;B28878;
    BNE .notLeft                                                         ;B2887B;
    LDA.W #$0001                                                         ;B2887D;
    BRA .merge                                                           ;B28880;

  .notLeft:
    CMP.W #$0002                                                         ;B28882;
    BNE .downFacingLeft                                                  ;B28885;
    LDA.W #$0008                                                         ;B28887;
    BRA .merge                                                           ;B2888A;

  .downFacingLeft:
    LDA.W #$0005                                                         ;B2888C;

  .merge:
    STA.W SamusProjectile_Directions,Y                                   ;B2888F;
    STY.B DP_Temp14                                                      ;B28892;
    JSL.L ProjectileReflection                                           ;B28894;
    LDA.W #$0066                                                         ;B28898;
    JSL.L QueueSound_Lib2_Max6                                           ;B2889B;

  .return:
    RTL                                                                  ;B2889F;


;;; $88A0: Extended spritemaps ;;;
; [n entries] [[X offset] [Y offset] [p spritemap] [p hitbox]]...
ExtendedSpritemaps_PirateWall_0:
    dw $0002                                                             ;B288A0;
    dw $0000,$0000
    dw Spitemaps_PirateWall_9                                            ;B288A6;
    dw Hitboxes_PirateWall_9                                             ;B288A8;
    dw $0000,$0000                                                       ;B288AA;
    dw Spitemaps_PirateWall_0                                            ;B288AE;
    dw Hitboxes_PirateWall_0                                             ;B288B0;

ExtendedSpritemaps_PirateWall_1:
    dw $0002                                                             ;B288B2;
    dw $0000,$0000
    dw Spitemaps_PirateWall_8                                            ;B288B8;
    dw Hitboxes_PirateWall_8                                             ;B288BA;
    dw $0000,$0000                                                       ;B288BC;
    dw Spitemaps_PirateWall_1                                            ;B288C0;
    dw Hitboxes_PirateWall_1                                             ;B288C2;

ExtendedSpritemaps_PirateWall_2:
    dw $0002                                                             ;B288C4;
    dw $0000,$0000
    dw Spitemaps_PirateWall_7                                            ;B288CA;
    dw Hitboxes_PirateWall_7                                             ;B288CC;
    dw $0000,$0000                                                       ;B288CE;
    dw Spitemaps_PirateWall_2                                            ;B288D2;
    dw Hitboxes_PirateWall_2                                             ;B288D4;

ExtendedSpritemaps_PirateWall_3:
    dw $0002                                                             ;B288D6;
    dw $0000,$0000
    dw Spitemaps_PirateWall_3                                            ;B288DC;
    dw Hitboxes_PirateWall_3                                             ;B288DE;
    dw $0000,$0000                                                       ;B288E0;
    dw Spitemaps_PirateWall_6                                            ;B288E4;
    dw Hitboxes_PirateWall_6                                             ;B288E6;

ExtendedSpritemaps_PirateWall_4:
    dw $0002                                                             ;B288E8;
    dw $0000,$0000
    dw Spitemaps_PirateWall_4                                            ;B288EE;
    dw Hitboxes_PirateWall_4                                             ;B288F0;
    dw $0000,$0000                                                       ;B288F2;
    dw Spitemaps_PirateWall_5                                            ;B288F6;
    dw Hitboxes_PirateWall_5                                             ;B288F8;

ExtendedSpritemaps_PirateWall_5:
    dw $0002                                                             ;B288FA;
    dw $0000,$FFFE
    dw Spitemaps_PirateWall_A                                            ;B28900;
    dw Hitboxes_PirateWall_A                                             ;B28902;
    dw $0000,$0000                                                       ;B28904;
    dw Spitemaps_PirateWall_9                                            ;B28908;
    dw Hitboxes_PirateWall_9                                             ;B2890A;

ExtendedSpritemaps_PirateWall_6:
    dw $0002                                                             ;B2890C;
    dw $0001,$FFFE
    dw Spitemaps_PirateWall_B                                            ;B28912;
    dw Hitboxes_PirateWall_B                                             ;B28914;
    dw $0000,$0000                                                       ;B28916;
    dw Spitemaps_PirateWall_5                                            ;B2891A;
    dw Hitboxes_PirateWall_5                                             ;B2891C;

ExtendedSpritemaps_PirateWall_7:
    dw $0001                                                             ;B2891E;
    dw $0000,$0000
    dw Spitemaps_PirateWall_C                                            ;B28924;
    dw Hitboxes_PirateWall_C                                             ;B28926;

ExtendedSpritemaps_PirateWall_8:
    dw $0001                                                             ;B28928;
    dw $0000,$0000
    dw Spitemaps_PirateWall_D                                            ;B2892E;
    dw Hitboxes_PirateWall_D                                             ;B28930;

ExtendedSpritemaps_PirateWall_9:
    dw $0002                                                             ;B28932;
    dw $0000,$0000
    dw Spitemaps_PirateWall_17                                           ;B28938;
    dw Hitboxes_PirateWall_17                                            ;B2893A;
    dw $0000,$0000                                                       ;B2893C;
    dw Spitemaps_PirateWall_E                                            ;B28940;
    dw Hitboxes_PirateWall_E                                             ;B28942;

ExtendedSpritemaps_PirateWall_A:
    dw $0002                                                             ;B28944;
    dw $0000,$0000
    dw Spitemaps_PirateWall_16                                           ;B2894A;
    dw Hitboxes_PirateWall_16                                            ;B2894C;
    dw $0000,$0000                                                       ;B2894E;
    dw Spitemaps_PirateWall_F                                            ;B28952;
    dw Hitboxes_PirateWall_F                                             ;B28954;

ExtendedSpritemaps_PirateWall_B:
    dw $0002                                                             ;B28956;
    dw $0000,$0000
    dw Spitemaps_PirateWall_15                                           ;B2895C;
    dw Hitboxes_PirateWall_15                                            ;B2895E;
    dw $0000,$0000                                                       ;B28960;
    dw Spitemaps_PirateWall_10                                           ;B28964;
    dw Hitboxes_PirateWall_10                                            ;B28966;

ExtendedSpritemaps_PirateWall_C:
    dw $0002                                                             ;B28968;
    dw $0000,$0000
    dw Spitemaps_PirateWall_11                                           ;B2896E;
    dw Hitboxes_PirateWall_11                                            ;B28970;
    dw $0000,$0000                                                       ;B28972;
    dw Spitemaps_PirateWall_14                                           ;B28976;
    dw Hitboxes_PirateWall_14                                            ;B28978;

ExtendedSpritemaps_PirateWall_D:
    dw $0002                                                             ;B2897A;
    dw $0000,$0000
    dw Spitemaps_PirateWall_12                                           ;B28980;
    dw Hitboxes_PirateWall_12                                            ;B28982;
    dw $0000,$0000                                                       ;B28984;
    dw Spitemaps_PirateWall_13                                           ;B28988;
    dw Hitboxes_PirateWall_13                                            ;B2898A;

ExtendedSpritemaps_PirateWall_E:
    dw $0002                                                             ;B2898C;
    dw $0000,$0000
    dw Spitemaps_PirateWall_18                                           ;B28992;
    dw Hitboxes_PirateWall_18                                            ;B28994;
    dw $0000,$0002                                                       ;B28996;
    dw Spitemaps_PirateWall_13                                           ;B2899A;
    dw Hitboxes_PirateWall_13                                            ;B2899C;

ExtendedSpritemaps_PirateWall_F:
    dw $0002                                                             ;B2899E;
    dw $0000,$0000
    dw Spitemaps_PirateWall_19                                           ;B289A4;
    dw Hitboxes_PirateWall_19                                            ;B289A6;
    dw $0000,$0002                                                       ;B289A8;
    dw Spitemaps_PirateWall_13                                           ;B289AC;
    dw Hitboxes_PirateWall_13                                            ;B289AE;

ExtendedSpritemaps_PirateWall_10:
    dw $0001                                                             ;B289B0;
    dw $0000,$0000
    dw Spitemaps_PirateWall_1A                                           ;B289B6;
    dw Hitboxes_PirateWall_1A                                            ;B289B8;

ExtendedSpritemaps_PirateWall_11:
    dw $0001                                                             ;B289BA;
    dw $0000,$0000
    dw Spitemaps_PirateWall_1B                                           ;B289C0;
    dw Hitboxes_PirateWall_1B                                            ;B289C2;

ExtendedSpritemaps_PirateWalking_0:
    dw $0002                                                             ;B289C4;
    dw $FFFB,$0003
    dw Spitemaps_PirateWalking_26_Ninja_D                                ;B289CA;
    dw Hitboxes_PirateWalking_33_Ninja_1C                                ;B289CC;
    dw $0000,$0000                                                       ;B289CE;
    dw Spritemaps_PirateWalking_1                                        ;B289D2;
    dw Hitboxes_PirateWalking_1                                          ;B289D4;

ExtendedSpritemaps_PirateWalking_1:
    dw $0002                                                             ;B289D6;
    dw $FFFB,$0003
    dw Spitemaps_PirateWalking_27_Ninja_E                                ;B289DC;
    dw Hitboxes_PirateWalking_35_Ninja_1E                                ;B289DE;
    dw $0000,$0000                                                       ;B289E0;
    dw Spritemaps_PirateWalking_2                                        ;B289E4;
    dw Hitboxes_PirateWalking_2                                          ;B289E6;

ExtendedSpritemaps_PirateWalking_2:
    dw $0002                                                             ;B289E8;
    dw $FFFB,$0003
    dw Spitemaps_PirateWalking_28_Ninja_F                                ;B289EE;
    dw Hitboxes_PirateWalking_36_Ninja_1F                                ;B289F0;
    dw $0000,$0000                                                       ;B289F2;
    dw Spritemaps_PirateWalking_3                                        ;B289F6;
    dw Hitboxes_PirateWalking_3                                          ;B289F8;

ExtendedSpritemaps_PirateWalking_3:
    dw $0002                                                             ;B289FA;
    dw $FFFB,$0003
    dw Spitemaps_PirateWalking_29_Ninja_10                               ;B28A00;
    dw Hitboxes_PirateWalking_37_Ninja_20                                ;B28A02;
    dw $0002,$0000                                                       ;B28A04;
    dw Spritemaps_PirateWalking_4                                        ;B28A08;
    dw Hitboxes_PirateWalking_4                                          ;B28A0A;

ExtendedSpritemaps_PirateWalking_4:
    dw $0002                                                             ;B28A0C;
    dw $FFFB,$0003
    dw Spitemaps_PirateWalking_29_Ninja_10                               ;B28A12;
    dw Hitboxes_PirateWalking_37_Ninja_20                                ;B28A14;
    dw $0002,$0000                                                       ;B28A16;
    dw Spritemaps_PirateWalking_5                                        ;B28A1A;
    dw Hitboxes_PirateWalking_5                                          ;B28A1C;

ExtendedSpritemaps_PirateWalking_5:
    dw $0002                                                             ;B28A1E;
    dw $FFFB,$0003
    dw Spitemaps_PirateWalking_28_Ninja_F                                ;B28A24;
    dw Hitboxes_PirateWalking_36_Ninja_1F                                ;B28A26;
    dw $0002,$0000                                                       ;B28A28;
    dw Spritemaps_PirateWalking_6                                        ;B28A2C;
    dw Hitboxes_PirateWalking_6                                          ;B28A2E;

ExtendedSpritemaps_PirateWalking_6:
    dw $0002                                                             ;B28A30;
    dw $FFFB,$0003
    dw Spitemaps_PirateWalking_27_Ninja_E                                ;B28A36;
    dw Hitboxes_PirateWalking_35_Ninja_1E                                ;B28A38;
    dw $0000,$0000                                                       ;B28A3A;
    dw Spritemaps_PirateWalking_7                                        ;B28A3E;
    dw Hitboxes_PirateWalking_7                                          ;B28A40;

ExtendedSpritemaps_PirateWalking_7:
    dw $0002                                                             ;B28A42;
    dw $FFFB,$0003
    dw Spitemaps_PirateWalking_26_Ninja_D                                ;B28A48;
    dw Hitboxes_PirateWalking_33_Ninja_1C                                ;B28A4A;
    dw $0000,$0000                                                       ;B28A4C;
    dw Spritemaps_PirateWalking_8                                        ;B28A50;
    dw Hitboxes_PirateWalking_8                                          ;B28A52;

ExtendedSpritemaps_PirateNinja_0:
    dw $0002                                                             ;B28A54;
    dw $0000,$0005
    dw Spitemaps_PirateWalking_26_Ninja_D                                ;B28A5A;
    dw Hitboxes_PirateWalking_34_Ninja_1D                                ;B28A5C;
    dw $0000,$0003                                                       ;B28A5E;
    dw Spitemaps_PirateWalking_B_Ninja_2                                 ;B28A62;
    dw Hitboxes_PirateWalking_12_Ninja_A                                 ;B28A64;

ExtendedSpritemaps_PirateNinja_1:
    dw $0002                                                             ;B28A66;
    dw $0000,$0005
    dw Spitemaps_PirateNinja_11                                          ;B28A6C;
    dw Hitboxes_PirateNinja_21                                           ;B28A6E;
    dw $0000,$0003                                                       ;B28A70;
    dw Spitemaps_PirateWalking_9_Ninja_0                                 ;B28A74;
    dw Hitboxes_PirateWalking_9_Ninja_0                                  ;B28A76;

ExtendedSpritemaps_PirateNinja_2:
    dw $0002                                                             ;B28A78;
    dw $0000,$0005
    dw Spitemaps_PirateNinja_12                                          ;B28A7E;
    dw Hitboxes_PirateNinja_22                                           ;B28A80;
    dw $0000,$0003                                                       ;B28A82;
    dw Spitemaps_PirateWalking_9_Ninja_0                                 ;B28A86;
    dw Hitboxes_PirateWalking_9_Ninja_0                                  ;B28A88;

ExtendedSpritemaps_PirateNinja_3:
    dw $0002                                                             ;B28A8A;
    dw $0000,$0004
    dw Spitemaps_PirateNinja_13                                          ;B28A90;
    dw Hitboxes_PirateNinja_23                                           ;B28A92;
    dw $0000,$0003                                                       ;B28A94;
    dw Spitemaps_PirateWalking_9_Ninja_0                                 ;B28A98;
    dw Hitboxes_PirateWalking_9_Ninja_0                                  ;B28A9A;

ExtendedSpritemaps_PirateNinja_4:
    dw $0002                                                             ;B28A9C;
    dw $0000,$0003
    dw Spitemaps_PirateNinja_14                                          ;B28AA2;
    dw Hitboxes_PirateNinja_24                                           ;B28AA4;
    dw $0000,$0003                                                       ;B28AA6;
    dw Spitemaps_PirateWalking_9_Ninja_0                                 ;B28AAA;
    dw Hitboxes_PirateWalking_9_Ninja_0                                  ;B28AAC;

ExtendedSpritemaps_PirateNinja_5:
    dw $0002                                                             ;B28AAE;
    dw $0000,$0005
    dw Spitemaps_PirateNinja_13                                          ;B28AB4;
    dw Hitboxes_PirateNinja_23                                           ;B28AB6;
    dw $0000,$0003                                                       ;B28AB8;
    dw Spitemaps_PirateWalking_9_Ninja_0                                 ;B28ABC;
    dw Hitboxes_PirateWalking_9_Ninja_0                                  ;B28ABE;

ExtendedSpritemaps_PirateNinja_6:
    dw $0002                                                             ;B28AC0;
    dw $0000,$0005
    dw Spitemaps_PirateNinja_11                                          ;B28AC6;
    dw Hitboxes_PirateNinja_21                                           ;B28AC8;
    dw $0000,$0003                                                       ;B28ACA;
    dw Spitemaps_PirateWalking_9_Ninja_0                                 ;B28ACE;
    dw Hitboxes_PirateWalking_9_Ninja_0                                  ;B28AD0;

ExtendedSpritemaps_PirateNinja_7:
    dw $0002                                                             ;B28AD2;
    dw $0000,$0006
    dw Spitemaps_PirateWalking_29_Ninja_10                               ;B28AD8;
    dw Hitboxes_PirateWalking_37_Ninja_20                                ;B28ADA;
    dw $0000,$0003                                                       ;B28ADC;
    dw Spitemaps_PirateWalking_9_Ninja_0                                 ;B28AE0;
    dw Hitboxes_PirateWalking_9_Ninja_0                                  ;B28AE2;

ExtendedSpritemaps_PirateNinja_8:
    dw $0002                                                             ;B28AE4;
    dw $0000,$0007
    dw Spitemaps_PirateNinja_18                                          ;B28AEA;
    dw Hitboxes_PirateNinja_28                                           ;B28AEC;
    dw $0000,$0003                                                       ;B28AEE;
    dw Spitemaps_PirateWalking_B_Ninja_2                                 ;B28AF2;
    dw Hitboxes_PirateWalking_12_Ninja_A                                 ;B28AF4;

ExtendedSpritemaps_PirateWalking_8:
    dw $0002                                                             ;B28AF6;
    dw $0005,$0003
    dw Spitemaps_PirateWalking_2B_Ninja_21                               ;B28AFC;
    dw Hitboxes_PirateWalking_39_Ninja_32                                ;B28AFE;
    dw $0000,$0000                                                       ;B28B00;
    dw Spitemaps_PirateWalking_E                                         ;B28B04;
    dw Hitboxes_PirateWalking_15                                         ;B28B06;

ExtendedSpritemaps_PirateWalking_9:
    dw $0002                                                             ;B28B08;
    dw $0005,$0003
    dw Spitemaps_PirateWalking_2C_Ninja_22                               ;B28B0E;
    dw Hitboxes_PirateWalking_3A_Ninja_34                                ;B28B10;
    dw $0000,$0000                                                       ;B28B12;
    dw Spitemaps_PirateWalking_F                                         ;B28B16;
    dw Hitboxes_PirateWalking_16                                         ;B28B18;

ExtendedSpritemaps_PirateWalking_A:
    dw $0002                                                             ;B28B1A;
    dw $0005,$0003
    dw Spitemaps_PirateWalking_2D_Ninja_23                               ;B28B20;
    dw Hitboxes_PirateWalking_3B_Ninja_35                                ;B28B22;
    dw $0000,$0000                                                       ;B28B24;
    dw Spitemaps_PirateWalking_10                                        ;B28B28;
    dw Hitboxes_PirateWalking_17                                         ;B28B2A;

ExtendedSpritemaps_PirateWalking_B:
    dw $0002                                                             ;B28B2C;
    dw $0005,$0003
    dw Spitemaps_PirateWalking_2E_Ninja_24                               ;B28B32;
    dw Hitboxes_PirateWalking_3C_Ninja_36                                ;B28B34;
    dw $0000,$0000                                                       ;B28B36;
    dw Spitemaps_PirateWalking_11                                        ;B28B3A;
    dw Hitboxes_PirateWalking_18                                         ;B28B3C;

ExtendedSpritemaps_PirateWalking_C:
    dw $0002                                                             ;B28B3E;
    dw $0005,$0003
    dw Spitemaps_PirateWalking_2E_Ninja_24                               ;B28B44;
    dw Hitboxes_PirateWalking_3C_Ninja_36                                ;B28B46;
    dw $FFFF,$0000                                                       ;B28B48;
    dw Spitemaps_PirateWalking_12                                        ;B28B4C;
    dw Hitboxes_PirateWalking_19                                         ;B28B4E;

ExtendedSpritemaps_PirateWalking_D:
    dw $0002                                                             ;B28B50;
    dw $0005,$0003
    dw Spitemaps_PirateWalking_2D_Ninja_23                               ;B28B56;
    dw Hitboxes_PirateWalking_3B_Ninja_35                                ;B28B58;
    dw $0000,$0000                                                       ;B28B5A;
    dw Spitemaps_PirateWalking_13                                        ;B28B5E;
    dw Hitboxes_PirateWalking_1A                                         ;B28B60;

ExtendedSpritemaps_PirateWalking_E:
    dw $0002                                                             ;B28B62;
    dw $0005,$0003
    dw Spitemaps_PirateWalking_2C_Ninja_22                               ;B28B68;
    dw Hitboxes_PirateWalking_3A_Ninja_34                                ;B28B6A;
    dw $0001,$0000                                                       ;B28B6C;
    dw Spitemaps_PirateWalking_14                                        ;B28B70;
    dw Hitboxes_PirateWalking_1B                                         ;B28B72;

ExtendedSpritemaps_PirateWalking_F:
    dw $0002                                                             ;B28B74;
    dw $0005,$0003
    dw Spitemaps_PirateWalking_2B_Ninja_21                               ;B28B7A;
    dw Hitboxes_PirateWalking_39_Ninja_32                                ;B28B7C;
    dw $0001,$0000                                                       ;B28B7E;
    dw Spitemaps_PirateWalking_15                                        ;B28B82;
    dw Hitboxes_PirateWalking_1C                                         ;B28B84;

ExtendedSpritemaps_PirateNinja_9:
    dw $0002                                                             ;B28B86;
    dw $0000,$0005
    dw Spitemaps_PirateWalking_2B_Ninja_21                               ;B28B8C;
    dw Hitboxes_PirateNinja_33                                           ;B28B8E;
    dw $0000,$0003                                                       ;B28B90;
    dw Spitemaps_PirateWalking_17_Ninja_4                                ;B28B94;
    dw Hitboxes_PirateWalking_26_Ninja_13                                ;B28B96;

ExtendedSpritemaps_PirateNinja_A:
    dw $0002                                                             ;B28B98;
    dw $0000,$0005
    dw Spitemaps_PirateNinja_25                                          ;B28B9E;
    dw Hitboxes_PirateNinja_37                                           ;B28BA0;
    dw $0000,$0003                                                       ;B28BA2;
    dw Spitemaps_PirateWalking_16_Ninja_3                                ;B28BA6;
    dw Hitboxes_PirateWalking_1D_Ninja_A                                 ;B28BA8;

ExtendedSpritemaps_PirateNinja_B:
    dw $0002                                                             ;B28BAA;
    dw $0000,$0005
    dw Spitemaps_PirateNinja_26                                          ;B28BB0;
    dw Hitboxes_PirateNinja_38                                           ;B28BB2;
    dw $0000,$0003                                                       ;B28BB4;
    dw Spitemaps_PirateWalking_16_Ninja_3                                ;B28BB8;
    dw Hitboxes_PirateWalking_1D_Ninja_A                                 ;B28BBA;

ExtendedSpritemaps_PirateNinja_C:
    dw $0002                                                             ;B28BBC;
    dw $0000,$0004
    dw Spitemaps_PirateNinja_27                                          ;B28BC2;
    dw Hitboxes_PirateNinja_39                                           ;B28BC4;
    dw $0000,$0003                                                       ;B28BC6;
    dw Spitemaps_PirateWalking_16_Ninja_3                                ;B28BCA;
    dw Hitboxes_PirateWalking_1D_Ninja_A                                 ;B28BCC;

ExtendedSpritemaps_PirateNinja_D:
    dw $0002                                                             ;B28BCE;
    dw $0000,$0003
    dw Spitemaps_PirateNinja_28                                          ;B28BD4;
    dw Hitboxes_PirateNinja_3A                                           ;B28BD6;
    dw $0000,$0003                                                       ;B28BD8;
    dw Spitemaps_PirateWalking_16_Ninja_3                                ;B28BDC;
    dw Hitboxes_PirateWalking_1D_Ninja_A                                 ;B28BDE;

ExtendedSpritemaps_PirateNinja_E:
    dw $0002                                                             ;B28BE0;
    dw $0000,$0005
    dw Spitemaps_PirateNinja_27                                          ;B28BE6;
    dw Hitboxes_PirateNinja_39                                           ;B28BE8;
    dw $0000,$0003                                                       ;B28BEA;
    dw Spitemaps_PirateWalking_16_Ninja_3                                ;B28BEE;
    dw Hitboxes_PirateWalking_1D_Ninja_A                                 ;B28BF0;

ExtendedSpritemaps_PirateNinja_F:
    dw $0002                                                             ;B28BF2;
    dw $0000,$0005
    dw Spitemaps_PirateWalking_2E_Ninja_24                               ;B28BF8;
    dw Hitboxes_PirateWalking_3C_Ninja_36                                ;B28BFA;
    dw $0000,$0003                                                       ;B28BFC;
    dw Spitemaps_PirateWalking_16_Ninja_3                                ;B28C00;
    dw Hitboxes_PirateWalking_1D_Ninja_A                                 ;B28C02;

ExtendedSpritemaps_PirateNinja_10:
    dw $0002                                                             ;B28C04;
    dw $0000,$0006
    dw Spitemaps_PirateNinja_2C                                          ;B28C0A;
    dw Hitboxes_PirateNinja_3E                                           ;B28C0C;
    dw $0000,$0003                                                       ;B28C0E;
    dw Spitemaps_PirateWalking_16_Ninja_3                                ;B28C12;
    dw Hitboxes_PirateWalking_1D_Ninja_A                                 ;B28C14;

ExtendedSpritemaps_PirateNinja_11:
    dw $0002                                                             ;B28C16;
    dw $0000,$0007
    dw Spitemaps_PirateNinja_2C                                          ;B28C1C;
    dw Hitboxes_PirateNinja_3E                                           ;B28C1E;
    dw $0000,$0003                                                       ;B28C20;
    dw Spitemaps_PirateWalking_17_Ninja_4                                ;B28C24;
    dw Hitboxes_PirateWalking_26_Ninja_13                                ;B28C26;

ExtendedSpritemaps_PirateWalking_10:
    dw $0002                                                             ;B28C28;
    dw $0000,$0003
    dw Spitemaps_PirateWalking_1A                                        ;B28C2E;
    dw Hitboxes_PirateWalking_27                                         ;B28C30;
    dw $0000,$0003                                                       ;B28C32;
    dw Spitemaps_PirateWalking_9_Ninja_0                                 ;B28C36;
    dw Hitboxes_PirateWalking_9_Ninja_0                                  ;B28C38;

ExtendedSpritemaps_PirateWalking_11:
    dw $0002                                                             ;B28C3A;
    dw $0000,$0003
    dw Spitemaps_PirateWalking_1B                                        ;B28C40;
    dw Hitboxes_PirateWalking_28                                         ;B28C42;
    dw $0000,$0003                                                       ;B28C44;
    dw Spitemaps_PirateWalking_9_Ninja_0                                 ;B28C48;
    dw Hitboxes_PirateWalking_9_Ninja_0                                  ;B28C4A;

ExtendedSpritemaps_PirateWalking_12:
    dw $0002                                                             ;B28C4C;
    dw $0000,$0003
    dw Spitemaps_PirateWalking_1C                                        ;B28C52;
    dw Hitboxes_PirateWalking_29                                         ;B28C54;
    dw $0000,$0003                                                       ;B28C56;
    dw Spitemaps_PirateWalking_9_Ninja_0                                 ;B28C5A;
    dw Hitboxes_PirateWalking_9_Ninja_0                                  ;B28C5C;

ExtendedSpritemaps_PirateWalking_13:
    dw $0002                                                             ;B28C5E;
    dw $0000,$0003
    dw Spitemaps_PirateWalking_1D                                        ;B28C64;
    dw Hitboxes_PirateWalking_2A                                         ;B28C66;
    dw $0000,$0003                                                       ;B28C68;
    dw Spitemaps_PirateWalking_9_Ninja_0                                 ;B28C6C;
    dw Hitboxes_PirateWalking_9_Ninja_0                                  ;B28C6E;

ExtendedSpritemaps_PirateWalking_14:
    dw $0002                                                             ;B28C70;
    dw $FFFF,$0004
    dw Spitemaps_PirateWalking_1E                                        ;B28C76;
    dw Hitboxes_PirateWalking_2B                                         ;B28C78;
    dw $0000,$0003                                                       ;B28C7A;
    dw Spitemaps_PirateWalking_9_Ninja_0                                 ;B28C7E;
    dw Hitboxes_PirateWalking_9_Ninja_0                                  ;B28C80;

ExtendedSpritemaps_PirateWalking_15:
    dw $0002                                                             ;B28C82;
    dw $FFFE,$0006
    dw Spitemaps_PirateWalking_1F                                        ;B28C88;
    dw Hitboxes_PirateWalking_2C                                         ;B28C8A;
    dw $0000,$0003                                                       ;B28C8C;
    dw Spitemaps_PirateWalking_B_Ninja_2                                 ;B28C90;
    dw Hitboxes_PirateWalking_12_Ninja_A                                 ;B28C92;

ExtendedSpritemaps_PirateWalking_16:
    dw $0002                                                             ;B28C94;
    dw $0000,$0003
    dw Spitemaps_PirateWalking_20                                        ;B28C9A;
    dw Hitboxes_PirateWalking_2D                                         ;B28C9C;
    dw $0000,$0003                                                       ;B28C9E;
    dw Spitemaps_PirateWalking_16_Ninja_3                                ;B28CA2;
    dw Hitboxes_PirateWalking_1D_Ninja_A                                 ;B28CA4;

ExtendedSpritemaps_PirateWalking_17:
    dw $0002                                                             ;B28CA6;
    dw $0000,$0003
    dw Spitemaps_PirateWalking_21                                        ;B28CAC;
    dw Hitboxes_PirateWalking_2E                                         ;B28CAE;
    dw $0000,$0003                                                       ;B28CB0;
    dw Spitemaps_PirateWalking_16_Ninja_3                                ;B28CB4;
    dw Hitboxes_PirateWalking_1D_Ninja_A                                 ;B28CB6;

ExtendedSpritemaps_PirateWalking_18:
    dw $0002                                                             ;B28CB8;
    dw $0000,$0003
    dw Spitemaps_PirateWalking_22                                        ;B28CBE;
    dw Hitboxes_PirateWalking_2F                                         ;B28CC0;
    dw $0000,$0003                                                       ;B28CC2;
    dw Spitemaps_PirateWalking_16_Ninja_3                                ;B28CC6;
    dw Hitboxes_PirateWalking_1D_Ninja_A                                 ;B28CC8;

ExtendedSpritemaps_PirateWalking_19:
    dw $0002                                                             ;B28CCA;
    dw $0000,$0003
    dw Spitemaps_PirateWalking_23                                        ;B28CD0;
    dw Hitboxes_PirateWalking_30                                         ;B28CD2;
    dw $0000,$0003                                                       ;B28CD4;
    dw Spitemaps_PirateWalking_16_Ninja_3                                ;B28CD8;
    dw Hitboxes_PirateWalking_1D_Ninja_A                                 ;B28CDA;

ExtendedSpritemaps_PirateWalking_1A:
    dw $0002                                                             ;B28CDC;
    dw $0001,$0004
    dw Spitemaps_PirateWalking_24                                        ;B28CE2;
    dw Hitboxes_PirateWalking_31                                         ;B28CE4;
    dw $0000,$0003                                                       ;B28CE6;
    dw Spitemaps_PirateWalking_16_Ninja_3                                ;B28CEA;
    dw Hitboxes_PirateWalking_1D_Ninja_A                                 ;B28CEC;

ExtendedSpritemaps_PirateWalking_1B:
    dw $0002                                                             ;B28CEE;
    dw $0002,$0006
    dw Spitemaps_PirateWalking_25                                        ;B28CF4;
    dw Hitboxes_PirateWalking_32                                         ;B28CF6;
    dw $0000,$0003                                                       ;B28CF8;
    dw Spitemaps_PirateWalking_17_Ninja_4                                ;B28CFC;
    dw Hitboxes_PirateWalking_26_Ninja_13                                ;B28CFE;

ExtendedSpritemaps_PirateWalking_1C:
    dw $0003                                                             ;B28D00;
    dw $FFFB,$FFF4
    dw Spitemaps_PirateWalking_18                                        ;B28D06;
    dw Hitboxes_PirateWalking_27                                         ;B28D08;
    dw $0000,$0003                                                       ;B28D0A;
    dw Spitemaps_PirateWalking_C                                         ;B28D0E;
    dw Hitboxes_PirateWalking_13                                         ;B28D10;
    dw $0000,$0003                                                       ;B28D12;
    dw Spitemaps_PirateWalking_9_Ninja_0                                 ;B28D16;
    dw Hitboxes_PirateWalking_9_Ninja_0                                  ;B28D18;

ExtendedSpritemaps_PirateWalking_1D:
    dw $0002                                                             ;B28D1A;
    dw $0000,$0003
    dw Spitemaps_PirateWalking_1A                                        ;B28D20;
    dw Hitboxes_PirateWalking_27                                         ;B28D22;
    dw $0000,$0003                                                       ;B28D24;
    dw Spitemaps_PirateWalking_9_Ninja_0                                 ;B28D28;
    dw Hitboxes_PirateWalking_9_Ninja_0                                  ;B28D2A;

ExtendedSpritemaps_PirateWalking_1E:
    dw $0003                                                             ;B28D2C;
    dw $FFFB,$FFF5
    dw Spitemaps_PirateWalking_19                                        ;B28D32;
    dw Hitboxes_PirateWalking_27                                         ;B28D34;
    dw $0000,$0003                                                       ;B28D36;
    dw Spitemaps_PirateWalking_C                                         ;B28D3A;
    dw Hitboxes_PirateWalking_13                                         ;B28D3C;
    dw $0000,$0003                                                       ;B28D3E;
    dw Spitemaps_PirateWalking_9_Ninja_0                                 ;B28D42;
    dw Hitboxes_PirateWalking_9_Ninja_0                                  ;B28D44;

ExtendedSpritemaps_PirateWalking_1F:
    dw $0003                                                             ;B28D46;
    dw $0005,$FFF4
    dw Spitemaps_PirateWalking_18                                        ;B28D4C;
    dw Hitboxes_PirateWalking_27                                         ;B28D4E;
    dw $0000,$0003                                                       ;B28D50;
    dw Spitemaps_PirateWalking_D                                         ;B28D54;
    dw Hitboxes_PirateWalking_14                                         ;B28D56;
    dw $0000,$0003                                                       ;B28D58;
    dw Spitemaps_PirateWalking_16_Ninja_3                                ;B28D5C;
    dw Hitboxes_PirateWalking_1D_Ninja_A                                 ;B28D5E;

ExtendedSpritemaps_PirateWalking_20:
    dw $0002                                                             ;B28D60;
    dw $0000,$0003
    dw Spitemaps_PirateWalking_20                                        ;B28D66;
    dw Hitboxes_PirateWalking_2D                                         ;B28D68;
    dw $0000,$0003                                                       ;B28D6A;
    dw Spitemaps_PirateWalking_16_Ninja_3                                ;B28D6E;
    dw Hitboxes_PirateWalking_1D_Ninja_A                                 ;B28D70;

ExtendedSpritemaps_PirateWalking_21:
    dw $0003                                                             ;B28D72;
    dw $0005,$FFF5
    dw Spitemaps_PirateWalking_19                                        ;B28D78;
    dw Hitboxes_PirateWalking_27                                         ;B28D7A;
    dw $0000,$0003                                                       ;B28D7C;
    dw Spitemaps_PirateWalking_D                                         ;B28D80;
    dw Hitboxes_PirateWalking_14                                         ;B28D82;
    dw $0000,$0003                                                       ;B28D84;
    dw Spitemaps_PirateWalking_16_Ninja_3                                ;B28D88;
    dw Hitboxes_PirateWalking_1D_Ninja_A                                 ;B28D8A;

ExtendedSpritemaps_PirateWalking_22:
    dw $0001                                                             ;B28D8C;
    dw $0000,$0001
    dw Spritemaps_PirateWalking_0                                        ;B28D92;
    dw Hitboxes_PirateWalking_0                                          ;B28D94;

ExtendedSpritemaps_PirateNinja_12:
    dw $0001                                                             ;B28D96;
    dw $0000,$0000
    dw Spitemaps_PirateNinja_2D                                          ;B28D9C;
    dw Hitboxes_PirateNinja_40                                           ;B28D9E;

ExtendedSpritemaps_PirateNinja_13:
    dw $0001                                                             ;B28DA0;
    dw $0000,$0000
    dw Spitemaps_PirateNinja_2E                                          ;B28DA6;
    dw Hitboxes_PirateNinja_41                                           ;B28DA8;

ExtendedSpritemaps_PirateNinja_14:
    dw $0001                                                             ;B28DAA;
    dw $0000,$0000
    dw Spitemaps_PirateNinja_2E_miscount                                 ;B28DB0;
    dw Hitboxes_PirateNinja_42                                           ;B28DB2;

ExtendedSpritemaps_PirateNinja_15:
    dw $0001                                                             ;B28DB4;
    dw $0000,$0000
    dw Spitemaps_PirateNinja_2F                                          ;B28DBA;
    dw Hitboxes_PirateNinja_43                                           ;B28DBC;

ExtendedSpritemaps_PirateNinja_16:
    dw $0001                                                             ;B28DBE;
    dw $0000,$0000
    dw Spitemaps_PirateNinja_30                                          ;B28DC4;
    dw Hitboxes_PirateNinja_44                                           ;B28DC6;

ExtendedSpritemaps_PirateNinja_17:
    dw $0001                                                             ;B28DC8;
    dw $0000,$0000
    dw Spitemaps_PirateNinja_31                                          ;B28DCE;
    dw Hitboxes_PirateNinja_45                                           ;B28DD0;

ExtendedSpritemaps_PirateNinja_18:
    dw $0001                                                             ;B28DD2;
    dw $0000,$0000
    dw Spitemaps_PirateNinja_32                                          ;B28DD8;
    dw Hitboxes_PirateNinja_46                                           ;B28DDA;

ExtendedSpritemaps_PirateNinja_19:
    dw $0001                                                             ;B28DDC;
    dw $0000,$0000
    dw Spitemaps_PirateNinja_33                                          ;B28DE2;
    dw Hitboxes_PirateNinja_47                                           ;B28DE4;

ExtendedSpritemaps_PirateNinja_1A:
    dw $0001                                                             ;B28DE6;
    dw $0000,$0000
    dw Spitemaps_PirateNinja_34                                          ;B28DEC;
    dw Hitboxes_PirateNinja_48                                           ;B28DEE;

ExtendedSpritemaps_PirateNinja_1B:
    dw $0001                                                             ;B28DF0;
    dw $0000,$0000
    dw Spitemaps_PirateNinja_35                                          ;B28DF6;
    dw Hitboxes_PirateNinja_49                                           ;B28DF8;

ExtendedSpritemaps_PirateNinja_1C:
    dw $0001                                                             ;B28DFA;
    dw $0000,$0000
    dw Spitemaps_PirateNinja_36                                          ;B28E00;
    dw Hitboxes_PirateNinja_4A                                           ;B28E02;

ExtendedSpritemaps_PirateNinja_1D:
    dw $0001                                                             ;B28E04;
    dw $0000,$0000
    dw Spitemaps_PirateNinja_37                                          ;B28E0A;
    dw Hitboxes_PirateNinja_4B                                           ;B28E0C;

ExtendedSpritemaps_PirateNinja_1E:
    dw $0001                                                             ;B28E0E;
    dw $0000,$0000
    dw Spitemaps_PirateNinja_38                                          ;B28E14;
    dw Hitboxes_PirateNinja_4C                                           ;B28E16;

ExtendedSpritemaps_PirateNinja_1F:
    dw $0001                                                             ;B28E18;
    dw $0000,$0000
    dw Spitemaps_PirateNinja_39                                          ;B28E1E;
    dw Hitboxes_PirateNinja_4D                                           ;B28E20;

ExtendedSpritemaps_PirateNinja_20:
    dw $0001                                                             ;B28E22;
    dw $0000,$0000
    dw Spitemaps_PirateNinja_3A                                          ;B28E28;
    dw Hitboxes_PirateNinja_4E                                           ;B28E2A;

ExtendedSpritemaps_PirateNinja_21:
    dw $0001                                                             ;B28E2C;
    dw $0000,$0000
    dw Spitemaps_PirateNinja_3B                                          ;B28E32;
    dw Hitboxes_PirateNinja_4F                                           ;B28E34;

ExtendedSpritemaps_PirateNinja_22:
    dw $0002                                                             ;B28E36;
    dw $FFFB,$0001
    dw Spitemaps_PirateWalking_26_Ninja_D                                ;B28E3C;
    dw Hitboxes_PirateWalking_33_Ninja_1C                                ;B28E3E;
    dw $0000,$FFFE                                                       ;B28E40;
    dw Spitemaps_PirateNinja_5                                           ;B28E44;
    dw Hitboxes_PirateNinja_14                                           ;B28E46;

ExtendedSpritemaps_PirateNinja_23:
    dw $0002                                                             ;B28E48;
    dw $FFFB,$0003
    dw Spitemaps_PirateWalking_27_Ninja_E                                ;B28E4E;
    dw Hitboxes_PirateWalking_35_Ninja_1E                                ;B28E50;
    dw $FFFF,$0000                                                       ;B28E52;
    dw Spitemaps_PirateNinja_6                                           ;B28E56;
    dw Hitboxes_PirateNinja_15                                           ;B28E58;

ExtendedSpritemaps_PirateNinja_24:
    dw $0002                                                             ;B28E5A;
    dw $FFFB,$0004
    dw Spitemaps_PirateWalking_28_Ninja_F                                ;B28E60;
    dw Hitboxes_PirateWalking_36_Ninja_1F                                ;B28E62;
    dw $0000,$0000                                                       ;B28E64;
    dw Spitemaps_PirateNinja_7                                           ;B28E68;
    dw Hitboxes_PirateNinja_16                                           ;B28E6A;

ExtendedSpritemaps_PirateNinja_25:
    dw $0002                                                             ;B28E6C;
    dw $FFFB,$0002
    dw Spitemaps_PirateWalking_29_Ninja_10                               ;B28E72;
    dw Hitboxes_PirateWalking_37_Ninja_20                                ;B28E74;
    dw $FFFF,$0000                                                       ;B28E76;
    dw Spitemaps_PirateNinja_8                                           ;B28E7A;
    dw Hitboxes_PirateNinja_17                                           ;B28E7C;

ExtendedSpritemaps_PirateNinja_26:
    dw $0002                                                             ;B28E7E;
    dw $FFFB,$0001
    dw Spitemaps_PirateWalking_29_Ninja_10                               ;B28E84;
    dw Hitboxes_PirateWalking_37_Ninja_20                                ;B28E86;
    dw $0002,$FFFE                                                       ;B28E88;
    dw Spitemaps_PirateNinja_9                                           ;B28E8C;
    dw Hitboxes_PirateNinja_18                                           ;B28E8E;

ExtendedSpritemaps_PirateNinja_27:
    dw $0002                                                             ;B28E90;
    dw $FFFB,$0003
    dw Spitemaps_PirateWalking_28_Ninja_F                                ;B28E96;
    dw Hitboxes_PirateWalking_36_Ninja_1F                                ;B28E98;
    dw $0002,$0000                                                       ;B28E9A;
    dw Spitemaps_PirateNinja_A                                           ;B28E9E;
    dw Hitboxes_PirateNinja_19                                           ;B28EA0;

ExtendedSpritemaps_PirateNinja_28:
    dw $0002                                                             ;B28EA2;
    dw $FFFB,$0003
    dw Spitemaps_PirateWalking_27_Ninja_E                                ;B28EA8;
    dw Hitboxes_PirateWalking_35_Ninja_1E                                ;B28EAA;
    dw $0000,$0000                                                       ;B28EAC;
    dw Spitemaps_PirateNinja_B                                           ;B28EB0;
    dw Hitboxes_PirateNinja_1A                                           ;B28EB2;

ExtendedSpritemaps_PirateNinja_29:
    dw $0002                                                             ;B28EB4;
    dw $FFFB,$0001
    dw Spitemaps_PirateWalking_26_Ninja_D                                ;B28EBA;
    dw Hitboxes_PirateWalking_33_Ninja_1C                                ;B28EBC;
    dw $0000,$0000                                                       ;B28EBE;
    dw Spitemaps_PirateNinja_C                                           ;B28EC2;
    dw Hitboxes_PirateNinja_1B                                           ;B28EC4;

ExtendedSpritemaps_PirateNinja_2A:
    dw $0002                                                             ;B28EC6;
    dw $0005,$0001
    dw Spitemaps_PirateWalking_2B_Ninja_21                               ;B28ECC;
    dw Hitboxes_PirateWalking_39_Ninja_32                                ;B28ECE;
    dw $0000,$FFFE                                                       ;B28ED0;
    dw Spitemaps_PirateNinja_19                                          ;B28ED4;
    dw Hitboxes_PirateNinja_2A                                           ;B28ED6;

ExtendedSpritemaps_PirateNinja_2B:
    dw $0002                                                             ;B28ED8;
    dw $0005,$0003
    dw Spitemaps_PirateWalking_2C_Ninja_22                               ;B28EDE;
    dw Hitboxes_PirateWalking_3A_Ninja_34                                ;B28EE0;
    dw $0000,$0000                                                       ;B28EE2;
    dw Spitemaps_PirateNinja_1A                                          ;B28EE6;
    dw Hitboxes_PirateNinja_2B                                           ;B28EE8;

ExtendedSpritemaps_PirateNinja_2C:
    dw $0002                                                             ;B28EEA;
    dw $0005,$0004
    dw Spitemaps_PirateWalking_2D_Ninja_23                               ;B28EF0;
    dw Hitboxes_PirateWalking_3B_Ninja_35                                ;B28EF2;
    dw $0000,$0000                                                       ;B28EF4;
    dw Spitemaps_PirateNinja_1B                                          ;B28EF8;
    dw Hitboxes_PirateNinja_2C                                           ;B28EFA;

ExtendedSpritemaps_PirateNinja_2D:
    dw $0002                                                             ;B28EFC;
    dw $0005,$0002
    dw Spitemaps_PirateWalking_2E_Ninja_24                               ;B28F02;
    dw Hitboxes_PirateWalking_3C_Ninja_36                                ;B28F04;
    dw $0000,$0000                                                       ;B28F06;
    dw Spitemaps_PirateNinja_1C                                          ;B28F0A;
    dw Hitboxes_PirateNinja_2D                                           ;B28F0C;

ExtendedSpritemaps_PirateNinja_2E:
    dw $0002                                                             ;B28F0E;
    dw $0005,$0001
    dw Spitemaps_PirateWalking_2E_Ninja_24                               ;B28F14;
    dw Hitboxes_PirateWalking_3C_Ninja_36                                ;B28F16;
    dw $FFFF,$FFFF                                                       ;B28F18;
    dw Spitemaps_PirateNinja_1D                                          ;B28F1C;
    dw Hitboxes_PirateNinja_2E                                           ;B28F1E;

ExtendedSpritemaps_PirateNinja_2F:
    dw $0002                                                             ;B28F20;
    dw $0005,$0003
    dw Spitemaps_PirateWalking_2D_Ninja_23                               ;B28F26;
    dw Hitboxes_PirateWalking_3B_Ninja_35                                ;B28F28;
    dw $0000,$0000                                                       ;B28F2A;
    dw Spitemaps_PirateNinja_1E                                          ;B28F2E;
    dw Hitboxes_PirateNinja_2F                                           ;B28F30;

ExtendedSpritemaps_PirateNinja_30:
    dw $0002                                                             ;B28F32;
    dw $0005,$0003
    dw Spitemaps_PirateWalking_2C_Ninja_22                               ;B28F38;
    dw Hitboxes_PirateWalking_3A_Ninja_34                                ;B28F3A;
    dw $0001,$0000                                                       ;B28F3C;
    dw Spitemaps_PirateNinja_1F                                          ;B28F40;
    dw Hitboxes_PirateNinja_30                                           ;B28F42;

ExtendedSpritemaps_PirateNinja_31:
    dw $0002                                                             ;B28F44;
    dw $0005,$0001
    dw Spitemaps_PirateWalking_2B_Ninja_21                               ;B28F4A;
    dw Hitboxes_PirateWalking_39_Ninja_32                                ;B28F4C;
    dw $0001,$0000                                                       ;B28F4E;
    dw Spitemaps_PirateNinja_20                                          ;B28F52;
    dw Hitboxes_PirateNinja_31                                           ;B28F54;

ExtendedSpritemaps_PirateNinja_32:
    dw $0001                                                             ;B28F56;
    dw $0000,$0003
    dw Spitemaps_PirateNinja_15                                          ;B28F5C;
    dw Hitboxes_PirateNinja_25                                           ;B28F5E;

ExtendedSpritemaps_PirateNinja_33:
    dw $0001                                                             ;B28F60;
    dw $0000,$0003
    dw Spitemaps_PirateNinja_16                                          ;B28F66;
    dw Hitboxes_PirateNinja_26                                           ;B28F68;

ExtendedSpritemaps_PirateNinja_34:
    dw $0001                                                             ;B28F6A;
    dw $0000,$0003
    dw Spitemaps_PirateNinja_17                                          ;B28F70;
    dw Hitboxes_PirateNinja_27                                           ;B28F72;

ExtendedSpritemaps_PirateNinja_35:
    dw $0001                                                             ;B28F74;
    dw $0000,$0003
    dw Spitemaps_PirateNinja_29                                          ;B28F7A;
    dw Hitboxes_PirateNinja_3B                                           ;B28F7C;

ExtendedSpritemaps_PirateNinja_36:
    dw $0001                                                             ;B28F7E;
    dw $0000,$0003
    dw Spitemaps_PirateNinja_2A                                          ;B28F84;
    dw Hitboxes_PirateNinja_3C                                           ;B28F86;

ExtendedSpritemaps_PirateNinja_37:
    dw $0001                                                             ;B28F88;
    dw $0000,$0003
    dw Spitemaps_PirateNinja_2B                                          ;B28F8E;
    dw Hitboxes_PirateNinja_3D                                           ;B28F90;

ExtendedSpritemaps_PirateWalking_23:
    dw $0001                                                             ;B28F92;
    dw $0000,$0008
    dw Spitemaps_PirateWalking_2A_Ninja_18                               ;B28F98;
    dw Hitboxes_PirateWalking_38                                         ;B28F9A;

ExtendedSpritemaps_PirateNinja_38:
    dw $0001                                                             ;B28F9C;
    dw $0000,$0008
    dw Spitemaps_PirateWalking_2A_Ninja_18                               ;B28FA2;
    dw Hitboxes_PirateNinja_29                                           ;B28FA4;

ExtendedSpritemaps_PirateWalking_24:
    dw $0001                                                             ;B28FA6;
    dw $0000,$0008
    dw Spitemaps_PirateWalking_2F                                        ;B28FAC;
    dw Hitboxes_PirateWalking_3D                                         ;B28FAE;

ExtendedSpritemaps_PirateNinja_39:
    dw $0001                                                             ;B28FB0;
    dw $0000,$0008
    dw Spitemaps_PirateWalking_2F                                        ;B28FB6;
    dw Hitboxes_PirateNinja_3F                                           ;B28FB8;

ExtendedSpritemaps_PirateNinja_3A:
    dw $0001                                                             ;B2900A;
    dw $0000,$0000
    dw Spitemaps_PirateNinja_48                                          ;B29010;
    dw Hitboxes_PirateNinja_5A                                           ;B29012;

ExtendedSpritemaps_PirateNinja_3B:
    dw $0001                                                             ;B29014;
    dw $0000,$0000
    dw Spitemaps_PirateNinja_4C                                          ;B2901A;
    dw Hitboxes_PirateNinja_5E                                           ;B2901C;

ExtendedSpritemaps_PirateNinja_3C:
    dw $0001                                                             ;B2901E;
    dw $0000,$0000
    dw Spitemaps_PirateNinja_4E                                          ;B29024;
    dw Hitboxes_PirateNinja_60                                           ;B29026;

ExtendedSpritemaps_PirateNinja_3D:
    dw $0001                                                             ;B29028;
    dw $0000,$0000
    dw Spitemaps_PirateNinja_52                                          ;B2902E;
    dw Hitboxes_PirateNinja_64                                           ;B29030;

ExtendedSpritemaps_PirateNinja_3E:
    dw $0001                                                             ;B29032;
    dw $0005,$0000
    dw Spitemaps_PirateNinja_4A                                          ;B29038;
    dw Hitboxes_PirateNinja_5C                                           ;B2903A;

ExtendedSpritemaps_PirateNinja_3F:
    dw $0001                                                             ;B2903C;
    dw $FFFB,$0001
    dw Spitemaps_PirateNinja_4B                                          ;B29042;
    dw Hitboxes_PirateNinja_5D                                           ;B29044;

ExtendedSpritemaps_PirateNinja_40:
    dw $0001                                                             ;B29046;
    dw $FFFB,$0000
    dw Spitemaps_PirateNinja_50                                          ;B2904C;
    dw Hitboxes_PirateNinja_62                                           ;B2904E;

ExtendedSpritemaps_PirateNinja_41:
    dw $0001                                                             ;B29050;
    dw $0005,$0001
    dw Spitemaps_PirateNinja_51                                          ;B29056;
    dw Hitboxes_PirateNinja_63                                           ;B29058;

ExtendedSpritemaps_PirateNinja_42:
    dw $0002                                                             ;B290FE;
    dw $0000,$0005
    dw Spitemaps_PirateNinja_47                                          ;B29104;
    dw Hitboxes_PirateNinja_59                                           ;B29106;
    dw $0000,$0003                                                       ;B29108;
    dw Spitemaps_PirateNinja_3E                                          ;B2910C;
    dw Hitboxes_PirateNinja_52                                           ;B2910E;

ExtendedSpritemaps_PirateNinja_43:
    dw $0002                                                             ;B29280;
    dw $0000,$0005
    dw Spitemaps_PirateNinja_4D                                          ;B29286;
    dw Hitboxes_PirateNinja_5F                                           ;B29288;
    dw $0000,$0003                                                       ;B2928A;
    dw Spitemaps_PirateNinja_42                                          ;B2928E;
    dw Hitboxes_PirateNinja_56                                           ;B29290;

ExtendedSpritemaps_PirateNinja_44:
    dw $0001                                                             ;B29372;
    dw $0002,$0000
    dw Spitemaps_PirateNinja_49                                          ;B29378;
    dw Hitboxes_PirateNinja_5B                                           ;B2937A;

ExtendedSpritemaps_PirateNinja_45:
    dw $0001                                                             ;B2937C;
    dw $FFFE,$0000
    dw Spitemaps_PirateNinja_4F                                          ;B29382;
    dw Hitboxes_PirateNinja_61                                           ;B29384;

ExtendedSpritemaps_PirateNinja_46:
    dw $0003                                                             ;B293EA;
    dw $FFFB,$FFF4
    dw Spitemaps_PirateNinja_43                                          ;B293F0;
    dw Hitboxes_PirateNinja_57                                           ;B293F2;
    dw $0000,$0003                                                       ;B293F4;
    dw Spitemaps_PirateNinja_3F                                          ;B293F8;
    dw Hitboxes_PirateNinja_53                                           ;B293FA;
    dw $0000,$0003                                                       ;B293FC;
    dw Spitemaps_PirateNinja_3D                                          ;B29400;
    dw Hitboxes_PirateNinja_51                                           ;B29402;

ExtendedSpritemaps_PirateNinja_47:
    dw $0002                                                             ;B29404;
    dw $0000,$0003
    dw Spitemaps_PirateNinja_45                                          ;B2940A;
    dw Hitboxes_PirateNinja_57                                           ;B2940C;
    dw $0000,$0003                                                       ;B2940E;
    dw Spitemaps_PirateNinja_3D                                          ;B29412;
    dw Hitboxes_PirateNinja_51                                           ;B29414;

ExtendedSpritemaps_PirateNinja_48:
    dw $0003                                                             ;B29416;
    dw $FFFB,$FFF5
    dw Spitemaps_PirateNinja_44                                          ;B2941C;
    dw Hitboxes_PirateNinja_57                                           ;B2941E;
    dw $0000,$0003                                                       ;B29420;
    dw Spitemaps_PirateNinja_3F                                          ;B29424;
    dw Hitboxes_PirateNinja_53                                           ;B29426;
    dw $0000,$0003                                                       ;B29428;
    dw Spitemaps_PirateNinja_3D                                          ;B2942C;
    dw Hitboxes_PirateNinja_51                                           ;B2942E;

ExtendedSpritemaps_PirateNinja_49:
    dw $0003                                                             ;B29430;
    dw $0005,$FFF4
    dw Spitemaps_PirateNinja_43                                          ;B29436;
    dw Hitboxes_PirateNinja_57                                           ;B29438;
    dw $0000,$0003                                                       ;B2943A;
    dw Spitemaps_PirateNinja_40                                          ;B2943E;
    dw Hitboxes_PirateNinja_54                                           ;B29440;
    dw $0000,$0003                                                       ;B29442;
    dw Spitemaps_PirateNinja_41                                          ;B29446;
    dw Hitboxes_PirateNinja_55                                           ;B29448;

ExtendedSpritemaps_PirateNinja_4A:
    dw $0002                                                             ;B2944A;
    dw $0000,$0003
    dw Spitemaps_PirateNinja_46                                          ;B29450;
    dw Hitboxes_PirateNinja_58                                           ;B29452;
    dw $0000,$0003                                                       ;B29454;
    dw Spitemaps_PirateNinja_41                                          ;B29458;
    dw Hitboxes_PirateNinja_55                                           ;B2945A;

ExtendedSpritemaps_PirateNinja_4B:
    dw $0003                                                             ;B2945C;
    dw $0005,$FFF5
    dw Spitemaps_PirateNinja_44                                          ;B29462;
    dw Hitboxes_PirateNinja_57                                           ;B29464;
    dw $0000,$0003                                                       ;B29466;
    dw Spitemaps_PirateNinja_40                                          ;B2946A;
    dw Hitboxes_PirateNinja_54                                           ;B2946C;
    dw $0000,$0003                                                       ;B2946E;
    dw Spitemaps_PirateNinja_41                                          ;B29472;
    dw Hitboxes_PirateNinja_55                                           ;B29474;

ExtendedSpritemaps_PirateNinja_4C:
    dw $0001                                                             ;B29476;
    dw $0000,$0001
    dw Spitemaps_PirateNinja_3C                                          ;B2947C;
    dw Hitboxes_PirateNinja_50                                           ;B2947E;


;;; $9690: Hitboxes ;;;
; [n entries] [[left offset] [top offset] [right offset] [bottom offset] [p touch] [p shot]]...
Hitboxes_PirateWall_0:
    dw $0001                                                             ;B29690;
    dw $FFEE,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate                                            ;B2969A;
    dw EnemyShot_SpacePirate_Normal                                      ;B2969C;

Hitboxes_PirateWall_1:
    dw $0001                                                             ;B2969E;
    dw $FFEE,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate                                            ;B296A8;
    dw EnemyShot_SpacePirate_Normal                                      ;B296AA;

Hitboxes_PirateWall_2:
    dw $0001                                                             ;B296AC;
    dw $FFEE,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate                                            ;B296B6;
    dw EnemyShot_SpacePirate_Normal                                      ;B296B8;

Hitboxes_PirateWall_3:
    dw $0001                                                             ;B296BA;
    dw $FFEE,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate                                            ;B296C4;
    dw EnemyShot_SpacePirate_Normal                                      ;B296C6;

Hitboxes_PirateWall_4:
    dw $0001                                                             ;B296C8;
    dw $FFEE,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate                                            ;B296D2;
    dw EnemyShot_SpacePirate_Normal                                      ;B296D4;

Hitboxes_PirateWall_5:
    dw $0001                                                             ;B296D6;
    dw $FFF2,$0000,$0004,$001E
    dw EnemyTouch_SpacePirate                                            ;B296E0;
    dw EnemyShot_SpacePirate_Normal                                      ;B296E2;

Hitboxes_PirateWall_6:
    dw $0001                                                             ;B296E4;
    dw $FFF1,$0000,$FFFF,$001E
    dw EnemyTouch_SpacePirate                                            ;B296EE;
    dw EnemyShot_SpacePirate_Normal                                      ;B296F0;

Hitboxes_PirateWall_7:
    dw $0001                                                             ;B296F2;
    dw $FFF1,$FFFA,$0000,$0017
    dw EnemyTouch_SpacePirate                                            ;B296FC;
    dw EnemyShot_SpacePirate_Normal                                      ;B296FE;

Hitboxes_PirateWall_8:
    dw $0001                                                             ;B29700;
    dw $FFF0,$FFFB,$FFFF,$0019
    dw EnemyTouch_SpacePirate                                            ;B2970A;
    dw EnemyShot_SpacePirate_Normal                                      ;B2970C;

Hitboxes_PirateWall_9:
    dw $0001                                                             ;B2970E;
    dw $FFEF,$FFF8,$0000,$001E
    dw EnemyTouch_SpacePirate                                            ;B29718;
    dw EnemyShot_SpacePirate_Normal                                      ;B2971A;

Hitboxes_PirateWalking_0:
    dw $0001                                                             ;B2971C;
    dw $FFF3,$FFED,$000A,$001E
    dw EnemyTouch_SpacePirate                                            ;B29726;
    dw EnemyShot_SpacePirate_Normal                                      ;B29728;

Hitboxes_PirateWall_A:
    dw $0001                                                             ;B2972A;
    dw $FFF1,$FFED,$000E,$0006
    dw EnemyTouch_SpacePirate                                            ;B29734;
    dw EnemyShot_SpacePirate_Normal                                      ;B29736;

Hitboxes_PirateWall_B:
    dw $0001                                                             ;B29738;
    dw $FFF0,$FFED,$000E,$0003
    dw EnemyTouch_SpacePirate                                            ;B29742;
    dw EnemyShot_SpacePirate_Normal                                      ;B29744;

Hitboxes_PirateWall_C:
    dw $0001                                                             ;B29746;
    dw $FFF6,$FFEB,$0013,$0016
    dw EnemyTouch_SpacePirate                                            ;B29750;
    dw EnemyShot_SpacePirate_Normal                                      ;B29752;

Hitboxes_PirateWall_D:
    dw $0001                                                             ;B29754;
    dw $FFF8,$FFED,$0012,$0010
    dw EnemyTouch_SpacePirate                                            ;B2975E;
    dw EnemyShot_SpacePirate_Normal                                      ;B29760;

Hitboxes_PirateWall_E:
    dw $0001                                                             ;B29762;
    dw $FFF7,$FFE9,$0011,$0000
    dw EnemyTouch_SpacePirate                                            ;B2976C;
    dw EnemyShot_SpacePirate_Normal                                      ;B2976E;

Hitboxes_PirateWall_F:
    dw $0001                                                             ;B29770;
    dw $FFF7,$FFED,$0010,$0000
    dw EnemyTouch_SpacePirate                                            ;B2977A;
    dw EnemyShot_SpacePirate_Normal                                      ;B2977C;

Hitboxes_PirateWall_10:
    dw $0001                                                             ;B2977E;
    dw $FFF7,$FFED,$0011,$0000
    dw EnemyTouch_SpacePirate                                            ;B29788;
    dw EnemyShot_SpacePirate_Normal                                      ;B2978A;

Hitboxes_PirateWall_11:
    dw $0001                                                             ;B2978C;
    dw $FFF7,$FFED,$0010,$0000
    dw EnemyTouch_SpacePirate                                            ;B29796;
    dw EnemyShot_SpacePirate_Normal                                      ;B29798;

Hitboxes_PirateWall_12:
    dw $0001                                                             ;B2979A;
    dw $FFF7,$FFED,$0011,$0000
    dw EnemyTouch_SpacePirate                                            ;B297A4;
    dw EnemyShot_SpacePirate_Normal                                      ;B297A6;

Hitboxes_PirateWall_13:
    dw $0001                                                             ;B297A8;
    dw $FFF9,$0000,$000F,$001E
    dw EnemyTouch_SpacePirate                                            ;B297B2;
    dw EnemyShot_SpacePirate_Normal                                      ;B297B4;

Hitboxes_PirateWall_14:
    dw $0001                                                             ;B297B6;
    dw $FFFE,$0000,$000F,$001E
    dw EnemyTouch_SpacePirate                                            ;B297C0;
    dw EnemyShot_SpacePirate_Normal                                      ;B297C2;

Hitboxes_PirateWall_15:
    dw $0001                                                             ;B297C4;
    dw $FFFE,$0000,$000F,$0017
    dw EnemyTouch_SpacePirate                                            ;B297CE;
    dw EnemyShot_SpacePirate_Normal                                      ;B297D0;

Hitboxes_PirateWall_16:
    dw $0001                                                             ;B297D2;
    dw $0000,$0000,$000F,$0019
    dw EnemyTouch_SpacePirate                                            ;B297DC;
    dw EnemyShot_SpacePirate_Normal                                      ;B297DE;

Hitboxes_PirateWall_17:
    dw $0001                                                             ;B297E0;
    dw $FFFF,$0000,$000F,$001E
    dw EnemyTouch_SpacePirate                                            ;B297EA;
    dw EnemyShot_SpacePirate_Normal                                      ;B297EC;

Hitboxes_PirateWall_18:
    dw $0001                                                             ;B297EE;
    dw $FFF1,$FFED,$000F,$0000
    dw EnemyTouch_SpacePirate                                            ;B297F8;
    dw EnemyShot_SpacePirate_Normal                                      ;B297FA;

Hitboxes_PirateWall_19:
    dw $0001                                                             ;B297FC;
    dw $FFF1,$FFED,$000E,$0003
    dw EnemyTouch_SpacePirate                                            ;B29806;
    dw EnemyShot_SpacePirate_Normal                                      ;B29808;

Hitboxes_PirateWall_1A:
    dw $0001                                                             ;B2980A;
    dw $FFEC,$FFED,$000A,$0019
    dw EnemyTouch_SpacePirate                                            ;B29814;
    dw EnemyShot_SpacePirate_Normal                                      ;B29816;

Hitboxes_PirateWall_1B:
    dw $0001                                                             ;B29818;
    dw $FFEC,$FFED,$0006,$0010
    dw EnemyTouch_SpacePirate                                            ;B29822;
    dw EnemyShot_SpacePirate_Normal                                      ;B29824;

Hitboxes_PirateWalking_1:
    dw $0001                                                             ;B29826;
    dw $FFF5,$0000,$0008,$001E
    dw EnemyTouch_SpacePirate                                            ;B29830;
    dw EnemyShot_SpacePirate_Normal                                      ;B29832;

Hitboxes_PirateWalking_2:
    dw $0001                                                             ;B29834;
    dw $FFF5,$0000,$0008,$001E
    dw EnemyTouch_SpacePirate                                            ;B2983E;
    dw EnemyShot_SpacePirate_Normal                                      ;B29840;

Hitboxes_PirateWalking_3:
    dw $0001                                                             ;B29842;
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate                                            ;B2984C;
    dw EnemyShot_SpacePirate_Normal                                      ;B2984E;

Hitboxes_PirateWalking_4:
    dw $0001                                                             ;B29850;
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate                                            ;B2985A;
    dw EnemyShot_SpacePirate_Normal                                      ;B2985C;

Hitboxes_PirateWalking_5:
    dw $0001                                                             ;B2985E;
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate                                            ;B29868;
    dw EnemyShot_SpacePirate_Normal                                      ;B2986A;

Hitboxes_PirateWalking_6:
    dw $0001                                                             ;B2986C;
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate                                            ;B29876;
    dw EnemyShot_SpacePirate_Normal                                      ;B29878;

Hitboxes_PirateWalking_7:
    dw $0001                                                             ;B2987A;
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate                                            ;B29884;
    dw EnemyShot_SpacePirate_Normal                                      ;B29886;

Hitboxes_PirateWalking_8:
    dw $0001                                                             ;B29888;
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate                                            ;B29892;
    dw EnemyShot_SpacePirate_Normal                                      ;B29894;

Hitboxes_PirateWalking_9_Ninja_0:
    dw $0001                                                             ;B29896;
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate                                            ;B298A0;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B298A2;

Hitboxes_PirateWalking_A_Ninja_1:
    dw $0001                                                             ;B298A4;
    dw $FFF9,$0000,$0006,$0010
    dw EnemyTouch_SpacePirate                                            ;B298AE;
    dw EnemyShot_SpacePirate_Normal                                      ;B298B0;

Hitboxes_PirateWalking_A_Ninja_2:
    dw $0001                                                             ;B298B2;
    dw $FFF9,$FFF7,$0006,$0006
    dw EnemyTouch_SpacePirate                                            ;B298BC;
    dw EnemyShot_SpacePirate_Normal                                      ;B298BE;

Hitboxes_PirateWalking_B_Ninja_3:
    dw $0001                                                             ;B298C0;
    dw $FFF9,$FFF7,$0006,$0006
    dw EnemyTouch_SpacePirate                                            ;B298CA;
    dw EnemyShot_SpacePirate_Normal                                      ;B298CC;

Hitboxes_PirateWalking_C_Ninja_4:
    dw $0001                                                             ;B298CE;
    dw $FFF9,$FFF7,$0006,$0006
    dw EnemyTouch_SpacePirate                                            ;B298D8;
    dw EnemyShot_SpacePirate_Normal                                      ;B298DA;

Hitboxes_PirateWalking_D_Ninja_5:
    dw $0001                                                             ;B298DC;
    dw $FFF9,$FFF7,$0006,$0006
    dw EnemyTouch_SpacePirate                                            ;B298E6;
    dw EnemyShot_SpacePirate_Normal                                      ;B298E8;

Hitboxes_PirateWalking_E_Ninja_6:
    dw $0001                                                             ;B298EA;
    dw $FFF9,$FFF7,$0006,$0006
    dw EnemyTouch_SpacePirate                                            ;B298F4;
    dw EnemyShot_SpacePirate_Normal                                      ;B298F6;

Hitboxes_PirateWalking_F_Ninja_7:
    dw $0001                                                             ;B298F8;
    dw $FFF9,$FFF7,$0006,$0006
    dw EnemyTouch_SpacePirate                                            ;B29902;
    dw EnemyShot_SpacePirate_Normal                                      ;B29904;

Hitboxes_PirateWalking_10_Ninja_8:
    dw $0001                                                             ;B29906;
    dw $FFF9,$FFF7,$0006,$0006
    dw EnemyTouch_SpacePirate                                            ;B29910;
    dw EnemyShot_SpacePirate_Normal                                      ;B29912;

Hitboxes_PirateWalking_11_Ninja_9:
    dw $0001                                                             ;B29914;
    dw $FFF9,$FFF7,$0006,$0006
    dw EnemyTouch_SpacePirate                                            ;B2991E;
    dw EnemyShot_SpacePirate_Normal                                      ;B29920;

Hitboxes_PirateWalking_12_Ninja_A:
    dw $0001                                                             ;B29922;
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate                                            ;B2992C;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B2992E;

Hitboxes_PirateWalking_13:
    dw $0001                                                             ;B29930;
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate                                            ;B2993A;
    dw EnemyShot_SpacePirate_Normal                                      ;B2993C;

Hitboxes_PirateWalking_14:
    dw $0001                                                             ;B2993E;
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate                                            ;B29948;
    dw EnemyShot_SpacePirate_Normal                                      ;B2994A;

Hitboxes_PirateWalking_15:
    dw $0001                                                             ;B2994C;
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate                                            ;B29956;
    dw EnemyShot_SpacePirate_Normal                                      ;B29958;

Hitboxes_PirateWalking_16:
    dw $0001                                                             ;B2995A;
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate                                            ;B29964;
    dw EnemyShot_SpacePirate_Normal                                      ;B29966;

Hitboxes_PirateWalking_17:
    dw $0001                                                             ;B29968;
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate                                            ;B29972;
    dw EnemyShot_SpacePirate_Normal                                      ;B29974;

Hitboxes_PirateWalking_18:
    dw $0001                                                             ;B29976;
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate                                            ;B29980;
    dw EnemyShot_SpacePirate_Normal                                      ;B29982;

Hitboxes_PirateWalking_19:
    dw $0001                                                             ;B29984;
    dw $FFF9,$FFFF,$0006,$001E
    dw EnemyTouch_SpacePirate                                            ;B2998E;
    dw EnemyShot_SpacePirate_Normal                                      ;B29990;

Hitboxes_PirateWalking_1A:
    dw $0001                                                             ;B29992;
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate                                            ;B2999C;
    dw EnemyShot_SpacePirate_Normal                                      ;B2999E;

Hitboxes_PirateWalking_1B:
    dw $0001                                                             ;B299A0;
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate                                            ;B299AA;
    dw EnemyShot_SpacePirate_Normal                                      ;B299AC;

Hitboxes_PirateWalking_1C:
    dw $0001                                                             ;B299AE;
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate                                            ;B299B8;
    dw EnemyShot_SpacePirate_Normal                                      ;B299BA;

Hitboxes_PirateWalking_1D_Ninja_A:
    dw $0001                                                             ;B299BC;
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate                                            ;B299C6;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B299C8;

Hitboxes_PirateWalking_1E_Ninja_B:
    dw $0001                                                             ;B299CA;
    dw $FFF9,$FFF7,$0006,$0006
    dw EnemyTouch_SpacePirate                                            ;B299D4;
    dw EnemyShot_SpacePirate_Normal                                      ;B299D6;

Hitboxes_PirateWalking_1F_Ninja_C:
    dw $0001                                                             ;B299D8;
    dw $FFF9,$FFF7,$0006,$0006
    dw EnemyTouch_SpacePirate                                            ;B299E2;
    dw EnemyShot_SpacePirate_Normal                                      ;B299E4;

Hitboxes_PirateWalking_20_Ninja_D:
    dw $0001                                                             ;B299E6;
    dw $FFF9,$FFF7,$0006,$0006
    dw EnemyTouch_SpacePirate                                            ;B299F0;
    dw EnemyShot_SpacePirate_Normal                                      ;B299F2;

Hitboxes_PirateWalking_21_Ninja_E:
    dw $0001                                                             ;B299F4;
    dw $FFF9,$FFF7,$0006,$0006
    dw EnemyTouch_SpacePirate                                            ;B299FE;
    dw EnemyShot_SpacePirate_Normal                                      ;B29A00;

Hitboxes_PirateWalking_22_Ninja_F:
    dw $0001                                                             ;B29A02;
    dw $FFF9,$FFF7,$0006,$0006
    dw EnemyTouch_SpacePirate                                            ;B29A0C;
    dw EnemyShot_SpacePirate_Normal                                      ;B29A0E;

Hitboxes_PirateWalking_23_Ninja_10:
    dw $0001                                                             ;B29A10;
    dw $FFF9,$FFF7,$0006,$0006
    dw EnemyTouch_SpacePirate                                            ;B29A1A;
    dw EnemyShot_SpacePirate_Normal                                      ;B29A1C;

Hitboxes_PirateWalking_24_Ninja_11:
    dw $0001                                                             ;B29A1E;
    dw $FFF9,$FFF7,$0006,$0006
    dw EnemyTouch_SpacePirate                                            ;B29A28;
    dw EnemyShot_SpacePirate_Normal                                      ;B29A2A;

Hitboxes_PirateWalking_25_Ninja_12:
    dw $0001                                                             ;B29A2C;
    dw $FFF9,$FFF7,$0006,$0006
    dw EnemyTouch_SpacePirate                                            ;B29A36;
    dw EnemyShot_SpacePirate_Normal                                      ;B29A38;

Hitboxes_PirateWalking_26_Ninja_13:
    dw $0001                                                             ;B29A3A;
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate                                            ;B29A44;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29A46;

Hitboxes_PirateWalking_27:
    dw $0001                                                             ;B29A48;
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate                                            ;B29A52;
    dw EnemyShot_SpacePirate_Normal                                      ;B29A54;

Hitboxes_PirateWalking_28:
    dw $0001                                                             ;B29A56;
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate                                            ;B29A60;
    dw EnemyShot_SpacePirate_Normal                                      ;B29A62;

Hitboxes_PirateWalking_29:
    dw $0001                                                             ;B29A64;
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate                                            ;B29A6E;
    dw EnemyShot_SpacePirate_Normal                                      ;B29A70;

Hitboxes_PirateWalking_2A:
    dw $0001                                                             ;B29A72;
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate                                            ;B29A7C;
    dw EnemyShot_SpacePirate_Normal                                      ;B29A7E;

Hitboxes_PirateWalking_2B:
    dw $0001                                                             ;B29A80;
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate                                            ;B29A8A;
    dw EnemyShot_SpacePirate_Normal                                      ;B29A8C;

Hitboxes_PirateWalking_2C:
    dw $0001                                                             ;B29A8E;
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate                                            ;B29A98;
    dw EnemyShot_SpacePirate_Normal                                      ;B29A9A;

Hitboxes_PirateWalking_2D:
    dw $0001                                                             ;B29A9C;
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate                                            ;B29AA6;
    dw EnemyShot_SpacePirate_Normal                                      ;B29AA8;

Hitboxes_PirateWalking_2E:
    dw $0001                                                             ;B29AAA;
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate                                            ;B29AB4;
    dw EnemyShot_SpacePirate_Normal                                      ;B29AB6;

Hitboxes_PirateWalking_2F:
    dw $0001                                                             ;B29AB8;
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate                                            ;B29AC2;
    dw EnemyShot_SpacePirate_Normal                                      ;B29AC4;

Hitboxes_PirateWalking_30:
    dw $0001                                                             ;B29AC6;
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate                                            ;B29AD0;
    dw EnemyShot_SpacePirate_Normal                                      ;B29AD2;

Hitboxes_PirateWalking_31:
    dw $0001                                                             ;B29AD4;
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate                                            ;B29ADE;
    dw EnemyShot_SpacePirate_Normal                                      ;B29AE0;

Hitboxes_PirateWalking_32:
    dw $0001                                                             ;B29AE2;
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate                                            ;B29AEC;
    dw EnemyShot_SpacePirate_Normal                                      ;B29AEE;

Hitboxes_PirateNinja_14:
    dw $0001                                                             ;B29AF0;
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate                                            ;B29AFA;
    dw EnemyShot_SpacePirate_Normal                                      ;B29AFC;

Hitboxes_PirateNinja_15:
    dw $0001                                                             ;B29AFE;
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate                                            ;B29B08;
    dw EnemyShot_SpacePirate_Normal                                      ;B29B0A;

Hitboxes_PirateNinja_16:
    dw $0001                                                             ;B29B0C;
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate                                            ;B29B16;
    dw EnemyShot_SpacePirate_Normal                                      ;B29B18;

Hitboxes_PirateNinja_17:
    dw $0001                                                             ;B29B1A;
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate                                            ;B29B24;
    dw EnemyShot_SpacePirate_Normal                                      ;B29B26;

Hitboxes_PirateNinja_18:
    dw $0001                                                             ;B29B28;
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate                                            ;B29B32;
    dw EnemyShot_SpacePirate_Normal                                      ;B29B34;

Hitboxes_PirateNinja_19:
    dw $0001                                                             ;B29B36;
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate                                            ;B29B40;
    dw EnemyShot_SpacePirate_Normal                                      ;B29B42;

Hitboxes_PirateNinja_1A:
    dw $0001                                                             ;B29B44;
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate                                            ;B29B4E;
    dw EnemyShot_SpacePirate_Normal                                      ;B29B50;

Hitboxes_PirateNinja_1B:
    dw $0001                                                             ;B29B52;
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate                                            ;B29B5C;
    dw EnemyShot_SpacePirate_Normal                                      ;B29B5E;

Hitboxes_PirateWalking_33_Ninja_1C:
    dw $0001                                                             ;B29B60;
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate                                            ;B29B6A;
    dw EnemyShot_SpacePirate_GoldNinjaIsVulnerable                       ;B29B6C;

Hitboxes_PirateWalking_34_Ninja_1D:
    dw $0001                                                             ;B29B6E;
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate                                            ;B29B78;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29B7A;

Hitboxes_PirateWalking_35_Ninja_1E:
    dw $0001                                                             ;B29B7C;
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate                                            ;B29B86;
    dw EnemyShot_SpacePirate_Normal                                      ;B29B88;

Hitboxes_PirateWalking_36_Ninja_1F:
    dw $0001                                                             ;B29B8A;
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate                                            ;B29B94;
    dw EnemyShot_SpacePirate_Normal                                      ;B29B96;

Hitboxes_PirateWalking_37_Ninja_20:
    dw $0001                                                             ;B29B98;
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate                                            ;B29BA2;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29BA4;

Hitboxes_PirateNinja_21:
    dw $0001                                                             ;B29BA6;
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate                                            ;B29BB0;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29BB2;

Hitboxes_PirateNinja_22:
    dw $0001                                                             ;B29BB4;
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate                                            ;B29BBE;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29BC0;

Hitboxes_PirateNinja_23:
    dw $0001                                                             ;B29BC2;
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate                                            ;B29BCC;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29BCE;

Hitboxes_PirateNinja_24:
    dw $0001                                                             ;B29BD0;
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate                                            ;B29BDA;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29BDC;

Hitboxes_PirateNinja_25:
    dw $0001                                                             ;B29BDE;
    dw $FFF9,$FFED,$0006,$001E
    dw EnemyTouch_SpacePirate                                            ;B29BE8;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29BEA;

Hitboxes_PirateNinja_26:
    dw $0001                                                             ;B29BEC;
    dw $FFF9,$FFED,$0006,$001E
    dw EnemyTouch_SpacePirate                                            ;B29BF6;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29BF8;

Hitboxes_PirateNinja_27:
    dw $0001                                                             ;B29BFA;
    dw $FFF9,$FFED,$0006,$001E
    dw EnemyTouch_SpacePirate                                            ;B29C04;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29C06;

Hitboxes_PirateNinja_28:
    dw $0001                                                             ;B29C5C;
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate                                            ;B29C66;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29C68;

Hitboxes_PirateWalking_38:
    dw $0002                                                             ;B29C78;
    dw $FFF9,$FFED,$0006,$0017
    dw EnemyTouch_SpacePirate                                            ;B29C82;
    dw EnemyShot_SpacePirate_Normal                                      ;B29C84;
    dw $FFEE,$FFEE,$FFF9,$0002                                           ;B29C86;
    dw EnemyTouch_SpacePirate                                            ;B29C8E;
    dw EnemyShot_SpacePirate_GoldNinjaIsVulnerable                       ;B29C90;

Hitboxes_PirateNinja_29:
    dw $0002                                                             ;B29C92;
    dw $FFF9,$FFED,$0006,$0017
    dw EnemyTouch_SpacePirate                                            ;B29C9C;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29C9E;
    dw $FFEE,$FFEE,$FFF9,$0002                                           ;B29CA0;
    dw EnemyTouch_SpacePirate                                            ;B29CA8;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29CAA;

Hitboxes_PirateNinja_2A:
    dw $0001                                                             ;B29CEE;
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate                                            ;B29CF8;
    dw EnemyShot_SpacePirate_Normal                                      ;B29CFA;

Hitboxes_PirateNinja_2B:
    dw $0001                                                             ;B29CFC;
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate                                            ;B29D06;
    dw EnemyShot_SpacePirate_Normal                                      ;B29D08;

Hitboxes_PirateNinja_2C:
    dw $0001                                                             ;B29D0A;
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate                                            ;B29D14;
    dw EnemyShot_SpacePirate_Normal                                      ;B29D16;

Hitboxes_PirateNinja_2D:
    dw $0001                                                             ;B29D18;
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate                                            ;B29D22;
    dw EnemyShot_SpacePirate_Normal                                      ;B29D24;

Hitboxes_PirateNinja_2E:
    dw $0001                                                             ;B29D26;
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate                                            ;B29D30;
    dw EnemyShot_SpacePirate_Normal                                      ;B29D32;

Hitboxes_PirateNinja_2F:
    dw $0001                                                             ;B29D34;
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate                                            ;B29D3E;
    dw EnemyShot_SpacePirate_Normal                                      ;B29D40;

Hitboxes_PirateNinja_30:
    dw $0001                                                             ;B29D42;
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate                                            ;B29D4C;
    dw EnemyShot_SpacePirate_Normal                                      ;B29D4E;

Hitboxes_PirateNinja_31:
    dw $0001                                                             ;B29D50;
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate                                            ;B29D5A;
    dw EnemyShot_SpacePirate_Normal                                      ;B29D5C;

Hitboxes_PirateWalking_39_Ninja_32:
    dw $0001                                                             ;B29D5E;
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate                                            ;B29D68;
    dw EnemyShot_SpacePirate_GoldNinjaIsVulnerable                       ;B29D6A;

Hitboxes_PirateNinja_33:
    dw $0001                                                             ;B29D6C;
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate                                            ;B29D76;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29D78;

Hitboxes_PirateWalking_3A_Ninja_34:
    dw $0001                                                             ;B29D7A;
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate                                            ;B29D84;
    dw EnemyShot_SpacePirate_GoldNinjaIsVulnerable                       ;B29D86;

Hitboxes_PirateWalking_3B_Ninja_35:
    dw $0001                                                             ;B29D88;
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate                                            ;B29D92;
    dw EnemyShot_SpacePirate_GoldNinjaIsVulnerable                       ;B29D94;

Hitboxes_PirateWalking_3C_Ninja_36:
    dw $0001                                                             ;B29D96;
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate                                            ;B29DA0;
    dw EnemyShot_SpacePirate_GoldNinjaIsVulnerable                       ;B29DA2;

Hitboxes_PirateNinja_37:
    dw $0001                                                             ;B29DA4;
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate                                            ;B29DAE;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29DB0;

Hitboxes_PirateNinja_38:
    dw $0001                                                             ;B29DB2;
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate                                            ;B29DBC;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29DBE;

Hitboxes_PirateNinja_39:
    dw $0001                                                             ;B29DC0;
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate                                            ;B29DCA;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29DCC;

Hitboxes_PirateNinja_3A:
    dw $0001                                                             ;B29DCE;
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate                                            ;B29DD8;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29DDA;

Hitboxes_PirateNinja_3B:
    dw $0001                                                             ;B29DDC;
    dw $FFF9,$FFED,$0006,$001E
    dw EnemyTouch_SpacePirate                                            ;B29DE6;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29DE8;

Hitboxes_PirateNinja_3C:
    dw $0001                                                             ;B29DEA;
    dw $FFF9,$FFED,$0006,$001E
    dw EnemyTouch_SpacePirate                                            ;B29DF4;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29DF6;

Hitboxes_PirateNinja_3D:
    dw $0001                                                             ;B29DF8;
    dw $FFF9,$FFED,$0006,$001E
    dw EnemyTouch_SpacePirate                                            ;B29E02;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29E04;

Hitboxes_PirateNinja_3E:
    dw $0001                                                             ;B29E5A;
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate                                            ;B29E64;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29E66;

Hitboxes_PirateWalking_3D:
    dw $0002                                                             ;B29E68;
    dw $FFF9,$FFED,$0006,$0017
    dw EnemyTouch_SpacePirate                                            ;B29E72;
    dw EnemyShot_SpacePirate_Normal                                      ;B29E74;
    dw $0006,$FFED,$0011,$0001                                           ;B29E76;
    dw EnemyTouch_SpacePirate                                            ;B29E7E;
    dw EnemyShot_SpacePirate_GoldNinjaIsVulnerable                       ;B29E80;

Hitboxes_PirateNinja_3F:
    dw $0002                                                             ;B29E82;
    dw $FFF9,$FFED,$0006,$0017
    dw EnemyTouch_SpacePirate                                            ;B29E8C;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29E8E;
    dw $0006,$FFED,$0011,$0001                                           ;B29E90;
    dw EnemyTouch_SpacePirate                                            ;B29E98;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29E9A;

Hitboxes_PirateNinja_40:
    dw $0001                                                             ;B29EDE;
    dw $FFF5,$FFF3,$000A,$000A
    dw EnemyTouch_SpacePirate                                            ;B29EE8;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29EEA;

Hitboxes_PirateNinja_41:
    dw $0001                                                             ;B29EEC;
    dw $FFF5,$FFF3,$000A,$000A
    dw EnemyTouch_SpacePirate                                            ;B29EF6;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29EF8;

Hitboxes_PirateNinja_42:
    dw $0001                                                             ;B29EFA;
    dw $FFF5,$FFF3,$000A,$000A
    dw EnemyTouch_SpacePirate                                            ;B29F04;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29F06;

Hitboxes_PirateNinja_43:
    dw $0001                                                             ;B29F08;
    dw $FFF5,$FFF3,$000A,$000A
    dw EnemyTouch_SpacePirate                                            ;B29F12;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29F14;

Hitboxes_PirateNinja_44:
    dw $0001                                                             ;B29F16;
    dw $FFF5,$FFF3,$000A,$000A
    dw EnemyTouch_SpacePirate                                            ;B29F20;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29F22;

Hitboxes_PirateNinja_45:
    dw $0001                                                             ;B29F24;
    dw $FFF5,$FFF3,$000A,$000A
    dw EnemyTouch_SpacePirate                                            ;B29F2E;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29F30;

Hitboxes_PirateNinja_46:
    dw $0001                                                             ;B29F32;
    dw $FFF5,$FFF3,$000A,$000A
    dw EnemyTouch_SpacePirate                                            ;B29F3C;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29F3E;

Hitboxes_PirateNinja_47:
    dw $0001                                                             ;B29F40;
    dw $FFF5,$FFF3,$000A,$000A
    dw EnemyTouch_SpacePirate                                            ;B29F4A;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29F4C;

Hitboxes_PirateNinja_48:
    dw $0001                                                             ;B29F78;
    dw $FFF5,$FFF3,$000A,$000A
    dw EnemyTouch_SpacePirate                                            ;B29F82;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29F84;

Hitboxes_PirateNinja_49:
    dw $0001                                                             ;B29F86;
    dw $FFF5,$FFF3,$000A,$000A
    dw EnemyTouch_SpacePirate                                            ;B29F90;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29F92;

Hitboxes_PirateNinja_4A:
    dw $0001                                                             ;B29F94;
    dw $FFF5,$FFF3,$000A,$000A
    dw EnemyTouch_SpacePirate                                            ;B29F9E;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29FA0;

Hitboxes_PirateNinja_4B:
    dw $0001                                                             ;B29FA2;
    dw $FFF5,$FFF3,$000A,$000A
    dw EnemyTouch_SpacePirate                                            ;B29FAC;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29FAE;

Hitboxes_PirateNinja_4C:
    dw $0001                                                             ;B29FB0;
    dw $FFF5,$FFF3,$000A,$000A
    dw EnemyTouch_SpacePirate                                            ;B29FBA;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29FBC;

Hitboxes_PirateNinja_4D:
    dw $0001                                                             ;B29FBE;
    dw $FFF5,$FFF3,$000A,$000A
    dw EnemyTouch_SpacePirate                                            ;B29FC8;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29FCA;

Hitboxes_PirateNinja_4E:
    dw $0001                                                             ;B29FCC;
    dw $FFF5,$FFF3,$000A,$000A
    dw EnemyTouch_SpacePirate                                            ;B29FD6;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29FD8;

Hitboxes_PirateNinja_4F:
    dw $0001                                                             ;B29FDA;
    dw $FFF5,$FFF3,$000A,$000A
    dw EnemyTouch_SpacePirate                                            ;B29FE4;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29FE6;

Hitboxes_PirateNinja_50:
    dw $0001                                                             ;B2A074;
    dw $FFF9,$FFED,$0006,$001E
    dw EnemyTouch_SpacePirate                                            ;B2A07E;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B2A080;

Hitboxes_PirateNinja_51:
    dw $0001                                                             ;B2A1EE;
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate                                            ;B2A1F8;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B2A1FA;

Hitboxes_PirateNinja_52:
    dw $0001                                                             ;B2A27A;
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate                                            ;B2A284;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A286;

Hitboxes_PirateNinja_53:
    dw $0001                                                             ;B2A288;
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate                                            ;B2A292;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B2A294;

Hitboxes_PirateNinja_54:
    dw $0001                                                             ;B2A296;
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate                                            ;B2A2A0;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B2A2A2;

Hitboxes_PirateNinja_55:
    dw $0001                                                             ;B2A314;
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate                                            ;B2A31E;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B2A320;

Hitboxes_PirateNinja_56:
    dw $0001                                                             ;B2A392;
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate                                            ;B2A39C;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A39E;

Hitboxes_PirateNinja_57:
    dw $0001                                                             ;B2A3A0;
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate                                            ;B2A3AA;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B2A3AC;

Hitboxes_PirateNinja_58:
    dw $0001                                                             ;B2A3F4;
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate                                            ;B2A3FE;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B2A400;

Hitboxes_PirateNinja_59:
    dw $0001                                                             ;B2A4B8;
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate                                            ;B2A4C2;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A4C4;

Hitboxes_PirateNinja_5A:
    dw $0001                                                             ;B2A560;
    dw $FFF9,$FFED,$0006,$0010
    dw EnemyTouch_SpacePirate                                            ;B2A56A;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A56C;

Hitboxes_PirateNinja_5B:
    dw $0001                                                             ;B2A56E;
    dw $FFF9,$FFED,$0006,$001E
    dw EnemyTouch_SpacePirate                                            ;B2A578;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B2A57A;

Hitboxes_PirateNinja_5C:
    dw $0001                                                             ;B2A5EA;
    dw $FFF9,$FFED,$0006,$001E
    dw EnemyTouch_SpacePirate                                            ;B2A5F4;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B2A5F6;

Hitboxes_PirateNinja_5D:
    dw $0002                                                             ;B2A5F8;
    dw $FFF9,$FFED,$0006,$001E
    dw EnemyTouch_SpacePirate                                            ;B2A602;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B2A604;
    dw $FFDE,$FFFB,$0003,$001E                                           ;B2A606;
    dw EnemyTouch_SpacePirate                                            ;B2A60E;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B2A610;

Hitboxes_PirateNinja_5E:
    dw $0002                                                             ;B2A612;
    dw $FFF9,$FFED,$0006,$0010
    dw EnemyTouch_SpacePirate                                            ;B2A61C;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A61E;
    dw $FFDF,$0003,$FFF9,$0010                                           ;B2A620;
    dw EnemyTouch_SpacePirate                                            ;B2A628;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A62A;

Hitboxes_PirateNinja_5F:
    dw $0001                                                             ;B2A69C;
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate                                            ;B2A6A6;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A6A8;

Hitboxes_PirateNinja_60:
    dw $0001                                                             ;B2A744;
    dw $FFF9,$FFED,$0006,$0010
    dw EnemyTouch_SpacePirate                                            ;B2A74E;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A750;

Hitboxes_PirateNinja_61:
    dw $0001                                                             ;B2A752;
    dw $FFF9,$FFED,$0006,$001E
    dw EnemyTouch_SpacePirate                                            ;B2A75C;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B2A75E;

Hitboxes_PirateNinja_62:
    dw $0001                                                             ;B2A7C0;
    dw $FFF9,$FFED,$0006,$001E
    dw EnemyTouch_SpacePirate                                            ;B2A7CA;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B2A7CC;

Hitboxes_PirateNinja_63:
    dw $0002                                                             ;B2A7CE;
    dw $FFF9,$FFED,$0006,$001E
    dw EnemyTouch_SpacePirate                                            ;B2A7D8;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B2A7DA;
    dw $0006,$FFFA,$0020,$001E                                           ;B2A7DC;
    dw EnemyTouch_SpacePirate                                            ;B2A7E4;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B2A7E6;

Hitboxes_PirateNinja_64:
    dw $0002                                                             ;B2A7E8;
    dw $FFF9,$FFED,$0006,$0010
    dw EnemyTouch_SpacePirate                                            ;B2A7F2;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A7F4;
    dw $0006,$0003,$001F,$0010                                           ;B2A7F6;
    dw EnemyTouch_SpacePirate                                            ;B2A7FE;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A800;


;;; $A8E2: Spritemaps ;;;
Spitemaps_PirateWall_0:
    dw $0008                                                             ;B2A8E2;
    %spritemapEntry(0, $1EF, $FD, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1EF, $F5, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EF, $ED, 0, 0, 2, 0, $12D)
    %spritemapEntry(1, $1F4, $F3, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F1, $EA, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1EF, $E6, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EF, $DE, 0, 0, 2, 0, $12D)

Spitemaps_PirateWall_1:
    dw $0009                                                             ;B2A90C;
    %spritemapEntry(0, $1FC, $F3, 0, 0, 2, 0, $14F)
    %spritemapEntry(0, $1F4, $F4, 0, 0, 2, 0, $14E)
    %spritemapEntry(0, $1EF, $F9, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1EF, $F1, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EF, $E9, 0, 0, 2, 0, $12D)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F1, $EA, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1EF, $EA, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EF, $E2, 0, 0, 2, 0, $12D)

Spitemaps_PirateWall_2:
    dw $0008                                                             ;B2A93B;
    %spritemapEntry(0, $1EF, $F3, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1EF, $EB, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EF, $E3, 0, 0, 2, 0, $12D)
    %spritemapEntry(0, $1FB, $F3, 0, 0, 2, 0, $14F)
    %spritemapEntry(0, $1F3, $F3, 0, 0, 2, 0, $14E)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F1, $EA, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1EF, $E1, 0, 0, 2, 0, $12D)

Spitemaps_PirateWall_3:
    dw $000A                                                             ;B2A965;
    %spritemapEntry(0, $1FB, $F1, 0, 0, 2, 0, $14F)
    %spritemapEntry(0, $1F3, $F0, 0, 0, 2, 0, $14E)
    %spritemapEntry(0, $1EF, $ED, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1EF, $E5, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EF, $DD, 0, 0, 2, 0, $12D)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F1, $EA, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1EF, $EF, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EF, $F7, 0, 0, 2, 0, $14D)
    %spritemapEntry(1, $1F1, $F0, 0, 0, 2, 0, $100)

Spitemaps_PirateWall_4:
    dw $0009                                                             ;B2A999;
    %spritemapEntry(1, $1F4, $EB, 1, 1, 2, 0, $105)
    %spritemapEntry(0, $1EF, $EB, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1EF, $E3, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EF, $DB, 0, 0, 2, 0, $12D)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F1, $EA, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1EF, $F1, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EF, $F9, 0, 0, 2, 0, $14D)
    %spritemapEntry(1, $1F1, $F2, 0, 0, 2, 0, $100)

Spitemaps_PirateWall_5:
    dw $000A                                                             ;B2A9C8;
    %spritemapEntry(0, $1F4, $19, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1F7, $13, 0, 0, 2, 0, $119)
    %spritemapEntry(0, $1F7, $0B, 0, 0, 2, 0, $109)
    %spritemapEntry(1, $1F9, $FE, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $1EC, $19, 0, 0, 2, 0, $145)
    %spritemapEntry(0, $1F5, $FE, 0, 0, 2, 0, $131)
    %spritemapEntry(0, $1F5, $F6, 0, 0, 2, 0, $121)
    %spritemapEntry(1, $1F6, $F5, 1, 1, 2, 0, $10C)
    %spritemapEntry(0, $1F4, $05, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1EC, $05, 0, 0, 2, 0, $145)

Spitemaps_PirateWall_6:
    dw $000C                                                             ;B2A9FC;
    %spritemapEntry(0, $00, $FD, 0, 0, 2, 0, $149)
    %spritemapEntry(0, $1F8, $FF, 0, 0, 2, 0, $148)
    %spritemapEntry(0, $1F4, $14, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1EC, $14, 0, 0, 2, 0, $145)
    %spritemapEntry(0, $00, $FB, 0, 0, 2, 0, $149)
    %spritemapEntry(0, $1F8, $F9, 0, 0, 2, 0, $148)
    %spritemapEntry(0, $1F5, $0D, 0, 0, 2, 0, $11A)
    %spritemapEntry(0, $1F5, $05, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $1F5, $02, 0, 0, 2, 0, $131)
    %spritemapEntry(0, $1F5, $FA, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $1F4, $09, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1EC, $09, 0, 0, 2, 0, $145)

Spitemaps_PirateWall_7:
    dw $000C                                                             ;B2AA3A;
    %spritemapEntry(0, $00, $F9, 0, 0, 2, 0, $149)
    %spritemapEntry(0, $1F8, $FB, 0, 0, 2, 0, $148)
    %spritemapEntry(0, $1F4, $10, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1EC, $10, 0, 0, 2, 0, $145)
    %spritemapEntry(0, $00, $FB, 0, 0, 2, 0, $149)
    %spritemapEntry(0, $1F8, $F9, 0, 0, 2, 0, $148)
    %spritemapEntry(0, $1F5, $09, 0, 0, 2, 0, $11A)
    %spritemapEntry(0, $1F5, $01, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $1F5, $06, 0, 0, 2, 0, $131)
    %spritemapEntry(0, $1F5, $FE, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $1F4, $0D, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1EC, $0D, 0, 0, 2, 0, $145)

Spitemaps_PirateWall_8:
    dw $000C                                                             ;B2AA78;
    %spritemapEntry(0, $1F3, $03, 0, 0, 2, 0, $131)
    %spritemapEntry(0, $1F3, $FB, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $1F4, $0A, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1EC, $0A, 0, 0, 2, 0, $145)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 0, $149)
    %spritemapEntry(0, $1F8, $FA, 0, 0, 2, 0, $148)
    %spritemapEntry(0, $00, $FE, 0, 0, 2, 0, $149)
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 0, $148)
    %spritemapEntry(0, $1F4, $12, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1EC, $12, 0, 0, 2, 0, $145)
    %spritemapEntry(0, $1F5, $0C, 0, 0, 2, 0, $11A)
    %spritemapEntry(0, $1F5, $04, 0, 0, 2, 0, $10A)

Spitemaps_PirateWall_9:
    dw $000A                                                             ;B2AAB6;
    %spritemapEntry(0, $1F5, $00, 0, 0, 2, 0, $131)
    %spritemapEntry(0, $1F5, $F8, 0, 0, 2, 0, $121)
    %spritemapEntry(1, $1F7, $F6, 1, 1, 2, 0, $10C)
    %spritemapEntry(0, $1F4, $07, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1EC, $07, 0, 0, 2, 0, $145)
    %spritemapEntry(0, $1F4, $16, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1F6, $10, 0, 0, 2, 0, $119)
    %spritemapEntry(0, $1F6, $08, 0, 0, 2, 0, $109)
    %spritemapEntry(1, $1F8, $FD, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $1EC, $16, 0, 0, 2, 0, $145)

Spritemaps_PirateWalking_0:
    dw $0014                                                             ;B2AAEA;
    %spritemapEntry(0, $07, $FE, 0, 1, 2, 0, $15D)
    %spritemapEntry(0, $07, $F6, 0, 1, 2, 0, $15C)
    %spritemapEntry(0, $07, $EE, 0, 1, 2, 0, $15B)
    %spritemapEntry(0, $1FF, $14, 0, 1, 2, 0, $15A)
    %spritemapEntry(0, $1FF, $FE, 0, 1, 2, 0, $157)
    %spritemapEntry(0, $1FF, $0C, 0, 1, 2, 0, $159)
    %spritemapEntry(0, $1FF, $06, 0, 1, 2, 0, $158)
    %spritemapEntry(0, $1FF, $F8, 0, 1, 2, 0, $156)
    %spritemapEntry(0, $1FF, $F0, 0, 1, 2, 0, $155)
    %spritemapEntry(0, $1FF, $E8, 0, 1, 2, 0, $154)
    %spritemapEntry(0, $1F0, $00, 0, 0, 2, 0, $15D)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 2, 0, $15C)
    %spritemapEntry(0, $1F0, $F0, 0, 0, 2, 0, $15B)
    %spritemapEntry(0, $1F8, $18, 0, 0, 2, 0, $15A)
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 0, $157)
    %spritemapEntry(0, $1F8, $10, 0, 0, 2, 0, $159)
    %spritemapEntry(0, $1F8, $08, 0, 0, 2, 0, $158)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $156)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 2, 0, $155)
    %spritemapEntry(0, $1F8, $E8, 0, 0, 2, 0, $154)

Spitemaps_PirateWall_A:
    dw $000D                                                             ;B2AB50;
    %spritemapEntry(1, $1F9, $FC, 0, 0, 2, 0, $127)
    %spritemapEntry(1, $01, $FC, 0, 0, 2, 0, $128)
    %spritemapEntry(0, $1F1, $F7, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1F1, $EF, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1F1, $E7, 0, 0, 2, 0, $12D)
    %spritemapEntry(0, $06, $FB, 0, 1, 2, 0, $112)
    %spritemapEntry(0, $06, $F3, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $1FA, $EB, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $03, $F9, 0, 1, 2, 0, $142)
    %spritemapEntry(0, $1FB, $F1, 0, 1, 2, 0, $141)
    %spritemapEntry(0, $03, $F1, 0, 1, 2, 0, $140)
    %spritemapEntry(0, $1FB, $F9, 0, 1, 2, 0, $147)
    %spritemapEntry(1, $1F1, $F0, 0, 0, 2, 0, $100)

Spitemaps_PirateWall_B:
    dw $000E                                                             ;B2AB93;
    %spritemapEntry(0, $1F0, $F7, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1F0, $EF, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1F0, $E7, 0, 0, 2, 0, $12D)
    %spritemapEntry(1, $1FE, $EB, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $1F1, $F0, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $03, $F9, 0, 1, 2, 0, $142)
    %spritemapEntry(0, $1FB, $F1, 0, 1, 2, 0, $141)
    %spritemapEntry(0, $03, $F1, 0, 1, 2, 0, $140)
    %spritemapEntry(0, $1FB, $F9, 0, 1, 2, 0, $147)
    %spritemapEntry(0, $08, $FD, 1, 0, 2, 0, $14D)
    %spritemapEntry(0, $08, $05, 1, 0, 2, 0, $13D)
    %spritemapEntry(0, $08, $0D, 1, 0, 2, 0, $12D)
    %spritemapEntry(0, $06, $FB, 0, 1, 2, 0, $112)
    %spritemapEntry(0, $06, $F3, 0, 1, 2, 0, $102)

Spitemaps_PirateWall_C:
    dw $0014                                                             ;B2ABDB;
    %spritemapEntry(0, $00, $F2, 0, 1, 2, 0, $14F)
    %spritemapEntry(0, $08, $F1, 0, 1, 2, 0, $14E)
    %spritemapEntry(0, $0C, $EE, 0, 1, 2, 0, $14D)
    %spritemapEntry(0, $0C, $E6, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $0C, $DE, 0, 1, 2, 0, $12D)
    %spritemapEntry(1, $1FB, $F1, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $02, $EB, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $0C, $F0, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $0C, $F8, 0, 1, 2, 0, $14D)
    %spritemapEntry(1, $02, $F1, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1F9, $FF, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $1F4, $11, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1F4, $09, 0, 1, 2, 0, $143)
    %spritemapEntry(0, $01, $09, 1, 0, 2, 0, $149)
    %spritemapEntry(0, $1F9, $09, 1, 0, 2, 0, $148)
    %spritemapEntry(1, $1FC, $FF, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $03, $0B, 1, 0, 2, 0, $149)
    %spritemapEntry(0, $1FB, $0B, 1, 0, 2, 0, $148)
    %spritemapEntry(0, $1FA, $13, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1FA, $0B, 0, 1, 2, 0, $143)

Spitemaps_PirateWall_D:
    dw $0010                                                             ;B2AC41;
    %spritemapEntry(0, $08, $FC, 0, 1, 2, 0, $14D)
    %spritemapEntry(0, $09, $F4, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $0A, $EC, 0, 1, 2, 0, $12D)
    %spritemapEntry(0, $0B, $FD, 0, 1, 2, 0, $14D)
    %spritemapEntry(0, $0C, $F5, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $0D, $ED, 0, 1, 2, 0, $12D)
    %spritemapEntry(1, $1FD, $F3, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1F9, $F0, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $00, $EA, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $1FA, $0B, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1FA, $03, 0, 1, 2, 0, $143)
    %spritemapEntry(0, $1FE, $09, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $06, $09, 0, 1, 2, 0, $145)
    %spritemapEntry(0, $1FB, $FE, 0, 1, 2, 0, $149)
    %spritemapEntry(0, $03, $FD, 0, 1, 2, 0, $148)
    %spritemapEntry(1, $1FD, $FF, 0, 1, 2, 0, $122)

Spitemaps_PirateWall_E:
    dw $0008                                                             ;B2AC93;
    %spritemapEntry(0, $09, $FD, 0, 1, 2, 0, $14D)
    %spritemapEntry(0, $09, $F5, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $09, $ED, 0, 1, 2, 0, $12D)
    %spritemapEntry(1, $1FC, $F3, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1F8, $F0, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $1FF, $EA, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $09, $E6, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $09, $DE, 0, 1, 2, 0, $12D)

Spitemaps_PirateWall_F:
    dw $0009                                                             ;B2ACBD;
    %spritemapEntry(0, $1FC, $F3, 0, 1, 2, 0, $14F)
    %spritemapEntry(0, $04, $F4, 0, 1, 2, 0, $14E)
    %spritemapEntry(0, $09, $F9, 0, 1, 2, 0, $14D)
    %spritemapEntry(0, $09, $F1, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $09, $E9, 0, 1, 2, 0, $12D)
    %spritemapEntry(1, $1F8, $F0, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $1FF, $EA, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $09, $EA, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $09, $E2, 0, 1, 2, 0, $12D)

Spitemaps_PirateWall_10:
    dw $0008                                                             ;B2ACEC;
    %spritemapEntry(0, $09, $F3, 0, 1, 2, 0, $14D)
    %spritemapEntry(0, $09, $EB, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $09, $E3, 0, 1, 2, 0, $12D)
    %spritemapEntry(0, $1FD, $F3, 0, 1, 2, 0, $14F)
    %spritemapEntry(0, $05, $F3, 0, 1, 2, 0, $14E)
    %spritemapEntry(1, $1F8, $F0, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $1FF, $EA, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $09, $E1, 0, 1, 2, 0, $12D)

Spitemaps_PirateWall_11:
    dw $000A                                                             ;B2AD16;
    %spritemapEntry(0, $1FD, $F1, 0, 1, 2, 0, $14F)
    %spritemapEntry(0, $05, $F0, 0, 1, 2, 0, $14E)
    %spritemapEntry(0, $09, $ED, 0, 1, 2, 0, $14D)
    %spritemapEntry(0, $09, $E5, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $09, $DD, 0, 1, 2, 0, $12D)
    %spritemapEntry(1, $1F8, $F0, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $1FF, $EA, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $09, $EF, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $09, $F7, 0, 1, 2, 0, $14D)
    %spritemapEntry(1, $1FF, $F0, 0, 1, 2, 0, $100)

Spitemaps_PirateWall_12:
    dw $0009                                                             ;B2AD4A;
    %spritemapEntry(1, $1FC, $EB, 1, 0, 2, 0, $105)
    %spritemapEntry(0, $09, $EB, 0, 1, 2, 0, $14D)
    %spritemapEntry(0, $09, $E3, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $09, $DB, 0, 1, 2, 0, $12D)
    %spritemapEntry(1, $1F8, $F0, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $1FF, $EA, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $09, $F1, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $09, $F9, 0, 1, 2, 0, $14D)
    %spritemapEntry(1, $1FF, $F2, 0, 1, 2, 0, $100)

Spitemaps_PirateWall_13:
    dw $000A                                                             ;B2AD79;
    %spritemapEntry(0, $04, $19, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $01, $13, 0, 1, 2, 0, $119)
    %spritemapEntry(0, $01, $0B, 0, 1, 2, 0, $109)
    %spritemapEntry(1, $1F7, $FE, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $0C, $19, 0, 1, 2, 0, $145)
    %spritemapEntry(0, $03, $FE, 0, 1, 2, 0, $131)
    %spritemapEntry(0, $03, $F6, 0, 1, 2, 0, $121)
    %spritemapEntry(1, $1FA, $F5, 1, 0, 2, 0, $10C)
    %spritemapEntry(0, $04, $05, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $0C, $05, 0, 1, 2, 0, $145)

Spitemaps_PirateWall_14:
    dw $000C                                                             ;B2ADAD;
    %spritemapEntry(0, $1F8, $FD, 0, 1, 2, 0, $149)
    %spritemapEntry(0, $00, $FF, 0, 1, 2, 0, $148)
    %spritemapEntry(0, $04, $14, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $0C, $14, 0, 1, 2, 0, $145)
    %spritemapEntry(0, $1F8, $FB, 0, 1, 2, 0, $149)
    %spritemapEntry(0, $00, $F9, 0, 1, 2, 0, $148)
    %spritemapEntry(0, $03, $0D, 0, 1, 2, 0, $11A)
    %spritemapEntry(0, $03, $05, 0, 1, 2, 0, $10A)
    %spritemapEntry(0, $03, $02, 0, 1, 2, 0, $131)
    %spritemapEntry(0, $03, $FA, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $04, $09, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $0C, $09, 0, 1, 2, 0, $145)

Spitemaps_PirateWall_15:
    dw $000C                                                             ;B2ADEB;
    %spritemapEntry(0, $1F8, $F9, 0, 1, 2, 0, $149)
    %spritemapEntry(0, $00, $FB, 0, 1, 2, 0, $148)
    %spritemapEntry(0, $04, $10, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $0C, $10, 0, 1, 2, 0, $145)
    %spritemapEntry(0, $1F8, $FB, 0, 1, 2, 0, $149)
    %spritemapEntry(0, $00, $F9, 0, 1, 2, 0, $148)
    %spritemapEntry(0, $03, $09, 0, 1, 2, 0, $11A)
    %spritemapEntry(0, $03, $01, 0, 1, 2, 0, $10A)
    %spritemapEntry(0, $03, $06, 0, 1, 2, 0, $131)
    %spritemapEntry(0, $03, $FE, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $04, $0D, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $0C, $0D, 0, 1, 2, 0, $145)

Spitemaps_PirateWall_16:
    dw $000C                                                             ;B2AE29;
    %spritemapEntry(0, $05, $03, 0, 1, 2, 0, $131)
    %spritemapEntry(0, $05, $FB, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $04, $0A, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $0C, $0A, 0, 1, 2, 0, $145)
    %spritemapEntry(0, $1F8, $FC, 0, 1, 2, 0, $149)
    %spritemapEntry(0, $00, $FA, 0, 1, 2, 0, $148)
    %spritemapEntry(0, $1F8, $FE, 0, 1, 2, 0, $149)
    %spritemapEntry(0, $00, $00, 0, 1, 2, 0, $148)
    %spritemapEntry(0, $04, $12, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $0C, $12, 0, 1, 2, 0, $145)
    %spritemapEntry(0, $03, $0C, 0, 1, 2, 0, $11A)
    %spritemapEntry(0, $03, $04, 0, 1, 2, 0, $10A)

Spitemaps_PirateWall_17:
    dw $000A                                                             ;B2AE67;
    %spritemapEntry(0, $03, $00, 0, 1, 2, 0, $131)
    %spritemapEntry(0, $03, $F8, 0, 1, 2, 0, $121)
    %spritemapEntry(1, $1F9, $F6, 1, 0, 2, 0, $10C)
    %spritemapEntry(0, $04, $07, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $0C, $07, 0, 1, 2, 0, $145)
    %spritemapEntry(0, $04, $16, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $02, $10, 0, 1, 2, 0, $119)
    %spritemapEntry(0, $02, $08, 0, 1, 2, 0, $109)
    %spritemapEntry(1, $1F8, $FD, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $0C, $16, 0, 1, 2, 0, $145)

Spitemaps_PirateWall_18:
    dw $000D                                                             ;B2AE9B;
    %spritemapEntry(1, $1F7, $FC, 0, 1, 2, 0, $127)
    %spritemapEntry(1, $1EF, $FC, 0, 1, 2, 0, $128)
    %spritemapEntry(0, $07, $F7, 0, 1, 2, 0, $14D)
    %spritemapEntry(0, $07, $EF, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $07, $E7, 0, 1, 2, 0, $12D)
    %spritemapEntry(0, $1F2, $FB, 0, 0, 2, 0, $112)
    %spritemapEntry(0, $1F2, $F3, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F6, $EB, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $1F5, $F9, 0, 0, 2, 0, $142)
    %spritemapEntry(0, $1FD, $F1, 0, 0, 2, 0, $141)
    %spritemapEntry(0, $1F5, $F1, 0, 0, 2, 0, $140)
    %spritemapEntry(0, $1FD, $F9, 0, 0, 2, 0, $147)
    %spritemapEntry(1, $1FF, $F0, 0, 1, 2, 0, $100)

Spitemaps_PirateWall_19:
    dw $000E                                                             ;B2AEDE;
    %spritemapEntry(0, $08, $F7, 0, 1, 2, 0, $14D)
    %spritemapEntry(0, $08, $EF, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $08, $E7, 0, 1, 2, 0, $12D)
    %spritemapEntry(1, $1F2, $EB, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1FF, $F0, 0, 1, 2, 0, $100)
    %spritemapEntry(0, $1F5, $F9, 0, 0, 2, 0, $142)
    %spritemapEntry(0, $1FD, $F1, 0, 0, 2, 0, $141)
    %spritemapEntry(0, $1F5, $F1, 0, 0, 2, 0, $140)
    %spritemapEntry(0, $1FD, $F9, 0, 0, 2, 0, $147)
    %spritemapEntry(0, $1F0, $FD, 1, 1, 2, 0, $14D)
    %spritemapEntry(0, $1F0, $05, 1, 1, 2, 0, $13D)
    %spritemapEntry(0, $1F0, $0D, 1, 1, 2, 0, $12D)
    %spritemapEntry(0, $1F2, $FB, 0, 0, 2, 0, $112)
    %spritemapEntry(0, $1F2, $F3, 0, 0, 2, 0, $102)

Spitemaps_PirateWall_1A:
    dw $0014                                                             ;B2AF26;
    %spritemapEntry(0, $1F8, $F2, 0, 0, 2, 0, $14F)
    %spritemapEntry(0, $1F0, $F1, 0, 0, 2, 0, $14E)
    %spritemapEntry(0, $1EC, $EE, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1EC, $E6, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EC, $DE, 0, 0, 2, 0, $12D)
    %spritemapEntry(1, $1F5, $F1, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1EE, $EB, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1EC, $F0, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EC, $F8, 0, 0, 2, 0, $14D)
    %spritemapEntry(1, $1EE, $F1, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $1F7, $FF, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $04, $11, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $04, $09, 0, 0, 2, 0, $143)
    %spritemapEntry(0, $1F7, $09, 1, 1, 2, 0, $149)
    %spritemapEntry(0, $1FF, $09, 1, 1, 2, 0, $148)
    %spritemapEntry(1, $1F4, $FF, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $1F5, $0B, 1, 1, 2, 0, $149)
    %spritemapEntry(0, $1FD, $0B, 1, 1, 2, 0, $148)
    %spritemapEntry(0, $1FE, $13, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $1FE, $0B, 0, 0, 2, 0, $143)

Spitemaps_PirateWall_1B:
    dw $0010                                                             ;B2AF8C;
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1EF, $F4, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EE, $EC, 0, 0, 2, 0, $12D)
    %spritemapEntry(0, $1ED, $FD, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1EC, $F5, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EB, $ED, 0, 0, 2, 0, $12D)
    %spritemapEntry(1, $1F3, $F3, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $1F7, $F0, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F0, $EA, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1FE, $0B, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $1FE, $03, 0, 0, 2, 0, $143)
    %spritemapEntry(0, $1FA, $09, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1F2, $09, 0, 0, 2, 0, $145)
    %spritemapEntry(0, $1FD, $FE, 0, 0, 2, 0, $149)
    %spritemapEntry(0, $1F5, $FD, 0, 0, 2, 0, $148)
    %spritemapEntry(1, $1F3, $FF, 0, 0, 2, 0, $122)

Spritemaps_PirateWalking_1:
    dw $000A                                                             ;B2AFDE;
    %spritemapEntry(0, $1F5, $13, 0, 0, 2, 0, $130)
    %spritemapEntry(0, $1F4, $0B, 0, 0, 2, 0, $120)
    %spritemapEntry(0, $1F2, $18, 0, 0, 2, 0, $136)
    %spritemapEntry(0, $1EB, $18, 0, 0, 2, 0, $135)
    %spritemapEntry(1, $1F5, $00, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $06, $18, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $06, $10, 0, 0, 2, 0, $143)
    %spritemapEntry(1, $1FE, $0B, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $1FD, $08, 0, 0, 2, 0, $11B)
    %spritemapEntry(0, $1FD, $00, 0, 0, 2, 0, $10B)

Spritemaps_PirateWalking_2:
    dw $000B                                                             ;B2B012;
    %spritemapEntry(0, $1F9, $12, 0, 0, 2, 0, $131)
    %spritemapEntry(0, $1F9, $0A, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $1F7, $18, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1EF, $18, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $1FA, $06, 0, 0, 2, 0, $119)
    %spritemapEntry(0, $1FA, $FE, 0, 0, 2, 0, $109)
    %spritemapEntry(0, $05, $17, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $05, $0F, 0, 0, 2, 0, $143)
    %spritemapEntry(1, $1FA, $08, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $1FB, $06, 0, 0, 2, 0, $11A)
    %spritemapEntry(0, $1FB, $FE, 0, 0, 2, 0, $10A)

Spritemaps_PirateWalking_3:
    dw $000C                                                             ;B2B04B;
    %spritemapEntry(0, $1FD, $18, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1F5, $18, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $1FE, $14, 0, 0, 2, 0, $131)
    %spritemapEntry(0, $1FE, $0C, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $1FC, $06, 0, 0, 2, 0, $11A)
    %spritemapEntry(0, $1FC, $FE, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $04, $18, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $04, $10, 0, 0, 2, 0, $143)
    %spritemapEntry(0, $1FD, $10, 0, 0, 2, 0, $11B)
    %spritemapEntry(0, $1FD, $08, 0, 0, 2, 0, $10B)
    %spritemapEntry(0, $1FB, $04, 0, 0, 2, 0, $119)
    %spritemapEntry(0, $1FB, $FC, 0, 0, 2, 0, $109)

Spritemaps_PirateWalking_4:
    dw $000B                                                             ;B2B089;
    %spritemapEntry(0, $1FA, $16, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1F2, $16, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $04, $18, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1FC, $18, 0, 0, 2, 0, $145)
    %spritemapEntry(0, $01, $13, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $01, $0B, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $1FC, $07, 0, 0, 2, 0, $11B)
    %spritemapEntry(0, $1FD, $FF, 0, 0, 2, 0, $10B)
    %spritemapEntry(1, $1F4, $00, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $1F8, $12, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $1F8, $0A, 0, 0, 2, 0, $124)

Spritemaps_PirateWalking_5:
    dw $000A                                                             ;B2B0C2;
    %spritemapEntry(0, $1FA, $00, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $1F2, $18, 0, 0, 2, 0, $136)
    %spritemapEntry(0, $1EB, $18, 0, 0, 2, 0, $135)
    %spritemapEntry(0, $06, $18, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $06, $10, 0, 0, 2, 0, $143)
    %spritemapEntry(1, $1FB, $0A, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $1F9, $08, 0, 0, 2, 0, $11B)
    %spritemapEntry(0, $1F4, $13, 0, 0, 2, 0, $130)
    %spritemapEntry(0, $1F3, $0B, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1F4, $00, 0, 0, 2, 0, $107)

Spritemaps_PirateWalking_6:
    dw $000B                                                             ;B2B0F6;
    %spritemapEntry(0, $1F7, $13, 0, 0, 2, 0, $131)
    %spritemapEntry(0, $1F7, $0B, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $05, $17, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $05, $0F, 0, 0, 2, 0, $143)
    %spritemapEntry(1, $1FA, $08, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $1FB, $06, 0, 0, 2, 0, $11A)
    %spritemapEntry(0, $1FB, $FE, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $1F6, $18, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1EE, $18, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $1F8, $07, 0, 0, 2, 0, $119)
    %spritemapEntry(0, $1F8, $FF, 0, 0, 2, 0, $109)

Spritemaps_PirateWalking_7:
    dw $000C                                                             ;B2B12F;
    %spritemapEntry(0, $1FB, $06, 0, 0, 2, 0, $119)
    %spritemapEntry(0, $1FB, $FE, 0, 0, 2, 0, $109)
    %spritemapEntry(0, $02, $19, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $02, $11, 0, 0, 2, 0, $143)
    %spritemapEntry(0, $1FC, $11, 0, 0, 2, 0, $11B)
    %spritemapEntry(0, $1FC, $09, 0, 0, 2, 0, $10B)
    %spritemapEntry(0, $1FD, $18, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1F5, $18, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $1FE, $15, 0, 0, 2, 0, $131)
    %spritemapEntry(0, $1FE, $0D, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $1FC, $08, 0, 0, 2, 0, $11A)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 0, $10A)

Spritemaps_PirateWalking_8:
    dw $000B                                                             ;B2B16D;
    %spritemapEntry(0, $1FA, $16, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1F2, $16, 0, 0, 2, 0, $125)
    %spritemapEntry(1, $1F6, $00, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $1F8, $12, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $1F8, $0A, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $04, $18, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1FC, $18, 0, 0, 2, 0, $145)
    %spritemapEntry(0, $01, $13, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $01, $0B, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $1FC, $07, 0, 0, 2, 0, $11B)
    %spritemapEntry(0, $1FD, $FF, 0, 0, 2, 0, $10B)

Spitemaps_PirateWalking_9_Ninja_0:
    dw $000A                                                             ;B2B1A6;
    %spritemapEntry(0, $1F8, $11, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $1FC, $FE, 0, 0, 2, 0, $109)
    %spritemapEntry(0, $1FC, $06, 0, 0, 2, 0, $119)
    %spritemapEntry(0, $03, $15, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1FC, $15, 0, 0, 2, 0, $125)
    %spritemapEntry(1, $1F5, $FF, 0, 0, 2, 0, $107)
    %spritemapEntry(1, $1FB, $0A, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $1FA, $15, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1F2, $15, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $1F8, $09, 0, 0, 2, 0, $124)

Spitemaps_PirateWalking_A_Ninja_1:
    dw $000A                                                             ;B2B1DA;
    %spritemapEntry(1, $1F7, $FF, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $04, $11, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $04, $09, 0, 0, 2, 0, $143)
    %spritemapEntry(0, $1F7, $09, 1, 1, 2, 0, $149)
    %spritemapEntry(0, $1FF, $09, 1, 1, 2, 0, $148)
    %spritemapEntry(1, $1F4, $FF, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $1F5, $0B, 1, 1, 2, 0, $149)
    %spritemapEntry(0, $1FD, $0B, 1, 1, 2, 0, $148)
    %spritemapEntry(0, $1FE, $13, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $1FE, $0B, 0, 0, 2, 0, $143)

Spitemaps_PirateWalking_B_Ninja_2:
    dw $000A                                                             ;B2B20E;
    %spritemapEntry(0, $1FC, $08, 0, 0, 2, 0, $119)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 0, $109)
    %spritemapEntry(1, $1F4, $01, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $1F6, $09, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $1F7, $11, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $02, $15, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1FC, $15, 0, 0, 2, 0, $125)
    %spritemapEntry(1, $1FA, $0B, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $1F9, $15, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1F2, $15, 0, 0, 2, 0, $125)

Spitemaps_PirateWalking_C:
    dw $0005                                                             ;B2B242;
    %spritemapEntry(1, $1EA, $00, 0, 0, 2, 0, $127)
    %spritemapEntry(1, $1F2, $00, 0, 0, 2, 0, $128)
    %spritemapEntry(0, $1FB, $FB, 0, 0, 2, 0, $113)
    %spritemapEntry(0, $1FB, $F3, 0, 0, 2, 0, $103)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $12E)

Spitemaps_PirateWalking_D:
    dw $0005                                                             ;B2B25D;
    %spritemapEntry(1, $06, $00, 0, 1, 2, 0, $127)
    %spritemapEntry(1, $1FE, $00, 0, 1, 2, 0, $128)
    %spritemapEntry(0, $1FD, $FB, 0, 1, 2, 0, $113)
    %spritemapEntry(0, $1FD, $F3, 0, 1, 2, 0, $103)
    %spritemapEntry(1, $1F8, $F0, 0, 1, 2, 0, $12E)

Spitemaps_PirateWalking_E:
    dw $000A                                                             ;B2B278;
    %spritemapEntry(0, $03, $13, 0, 1, 2, 0, $130)
    %spritemapEntry(0, $04, $0B, 0, 1, 2, 0, $120)
    %spritemapEntry(0, $06, $18, 0, 1, 2, 0, $136)
    %spritemapEntry(0, $0D, $18, 0, 1, 2, 0, $135)
    %spritemapEntry(1, $1FB, $00, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $1F2, $18, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1F2, $10, 0, 1, 2, 0, $143)
    %spritemapEntry(1, $1F2, $0B, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $1FB, $08, 0, 1, 2, 0, $11B)
    %spritemapEntry(0, $1FB, $00, 0, 1, 2, 0, $10B)

Spitemaps_PirateWalking_F:
    dw $000B                                                             ;B2B2AC;
    %spritemapEntry(0, $1FF, $12, 0, 1, 2, 0, $131)
    %spritemapEntry(0, $1FF, $0A, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $01, $18, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $09, $18, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $1FE, $06, 0, 1, 2, 0, $119)
    %spritemapEntry(0, $1FE, $FE, 0, 1, 2, 0, $109)
    %spritemapEntry(0, $1F3, $17, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1F3, $0F, 0, 1, 2, 0, $143)
    %spritemapEntry(1, $1F6, $08, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $1FD, $06, 0, 1, 2, 0, $11A)
    %spritemapEntry(0, $1FD, $FE, 0, 1, 2, 0, $10A)

Spitemaps_PirateWalking_10:
    dw $000C                                                             ;B2B2E5;
    %spritemapEntry(0, $1FB, $18, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $03, $18, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $1FA, $14, 0, 1, 2, 0, $131)
    %spritemapEntry(0, $1FA, $0C, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $1FC, $06, 0, 1, 2, 0, $11A)
    %spritemapEntry(0, $1FC, $FE, 0, 1, 2, 0, $10A)
    %spritemapEntry(0, $1F4, $18, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1F4, $10, 0, 1, 2, 0, $143)
    %spritemapEntry(0, $1FB, $10, 0, 1, 2, 0, $11B)
    %spritemapEntry(0, $1FB, $08, 0, 1, 2, 0, $10B)
    %spritemapEntry(0, $1FD, $04, 0, 1, 2, 0, $119)
    %spritemapEntry(0, $1FD, $FC, 0, 1, 2, 0, $109)

Spitemaps_PirateWalking_11:
    dw $000B                                                             ;B2B323;
    %spritemapEntry(0, $1FE, $16, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $06, $16, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $1F4, $18, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $1FC, $18, 0, 1, 2, 0, $145)
    %spritemapEntry(0, $1F7, $13, 0, 1, 2, 0, $134)
    %spritemapEntry(0, $1F7, $0B, 0, 1, 2, 0, $124)
    %spritemapEntry(0, $1FC, $07, 0, 1, 2, 0, $11B)
    %spritemapEntry(0, $1FB, $FF, 0, 1, 2, 0, $10B)
    %spritemapEntry(1, $1FC, $00, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $00, $12, 0, 1, 2, 0, $134)
    %spritemapEntry(0, $00, $0A, 0, 1, 2, 0, $124)

Spitemaps_PirateWalking_12:
    dw $000A                                                             ;B2B35C;
    %spritemapEntry(0, $1FE, $00, 0, 1, 2, 0, $10A)
    %spritemapEntry(0, $06, $18, 0, 1, 2, 0, $136)
    %spritemapEntry(0, $0D, $18, 0, 1, 2, 0, $135)
    %spritemapEntry(0, $1F2, $18, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1F2, $10, 0, 1, 2, 0, $143)
    %spritemapEntry(1, $1F5, $0A, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $1FF, $08, 0, 1, 2, 0, $11B)
    %spritemapEntry(0, $04, $13, 0, 1, 2, 0, $130)
    %spritemapEntry(0, $05, $0B, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $1FC, $00, 0, 1, 2, 0, $107)

Spitemaps_PirateWalking_13:
    dw $000B                                                             ;B2B390;
    %spritemapEntry(0, $01, $13, 0, 1, 2, 0, $131)
    %spritemapEntry(0, $01, $0B, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $1F3, $17, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1F3, $0F, 0, 1, 2, 0, $143)
    %spritemapEntry(1, $1F6, $08, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $1FD, $06, 0, 1, 2, 0, $11A)
    %spritemapEntry(0, $1FD, $FE, 0, 1, 2, 0, $10A)
    %spritemapEntry(0, $02, $18, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $0A, $18, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $00, $07, 0, 1, 2, 0, $119)
    %spritemapEntry(0, $00, $FF, 0, 1, 2, 0, $109)

Spitemaps_PirateWalking_14:
    dw $000C                                                             ;B2B3C9;
    %spritemapEntry(0, $1FD, $06, 0, 1, 2, 0, $119)
    %spritemapEntry(0, $1FD, $FE, 0, 1, 2, 0, $109)
    %spritemapEntry(0, $1F6, $19, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1F6, $11, 0, 1, 2, 0, $143)
    %spritemapEntry(0, $1FC, $11, 0, 1, 2, 0, $11B)
    %spritemapEntry(0, $1FC, $09, 0, 1, 2, 0, $10B)
    %spritemapEntry(0, $1FB, $18, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $03, $18, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $1FA, $15, 0, 1, 2, 0, $131)
    %spritemapEntry(0, $1FA, $0D, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $1FC, $08, 0, 1, 2, 0, $11A)
    %spritemapEntry(0, $1FC, $00, 0, 1, 2, 0, $10A)

Spitemaps_PirateWalking_15:
    dw $000B                                                             ;B2B407;
    %spritemapEntry(0, $1FE, $16, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $06, $16, 0, 1, 2, 0, $125)
    %spritemapEntry(1, $1FA, $00, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $00, $12, 0, 1, 2, 0, $134)
    %spritemapEntry(0, $00, $0A, 0, 1, 2, 0, $124)
    %spritemapEntry(0, $1F4, $18, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $1FC, $18, 0, 1, 2, 0, $145)
    %spritemapEntry(0, $1F7, $13, 0, 1, 2, 0, $134)
    %spritemapEntry(0, $1F7, $0B, 0, 1, 2, 0, $124)
    %spritemapEntry(0, $1FC, $07, 0, 1, 2, 0, $11B)
    %spritemapEntry(0, $1FB, $FF, 0, 1, 2, 0, $10B)

Spitemaps_PirateWalking_16_Ninja_3:
    dw $000A                                                             ;B2B440;
    %spritemapEntry(0, $00, $11, 0, 1, 2, 0, $134)
    %spritemapEntry(0, $1FC, $FE, 0, 1, 2, 0, $109)
    %spritemapEntry(0, $1FC, $06, 0, 1, 2, 0, $119)
    %spritemapEntry(0, $1F5, $15, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $1FC, $15, 0, 1, 2, 0, $125)
    %spritemapEntry(1, $1FB, $FF, 0, 1, 2, 0, $107)
    %spritemapEntry(1, $1F5, $0A, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $1FE, $15, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $06, $15, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $00, $09, 0, 1, 2, 0, $124)

Spitemaps_PirateWalking_17_Ninja_4:
    dw $000A                                                             ;B2B4A8;
    %spritemapEntry(0, $1FC, $08, 0, 1, 2, 0, $119)
    %spritemapEntry(0, $1FC, $00, 0, 1, 2, 0, $109)
    %spritemapEntry(1, $1FC, $01, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $02, $09, 0, 1, 2, 0, $124)
    %spritemapEntry(0, $01, $11, 0, 1, 2, 0, $134)
    %spritemapEntry(0, $1F6, $15, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $1FC, $15, 0, 1, 2, 0, $125)
    %spritemapEntry(1, $1F6, $0B, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $1FF, $15, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $06, $15, 0, 1, 2, 0, $125)

Spitemaps_PirateWalking_18:
    dw $0004                                                             ;B2B4DC;
    %spritemapEntry(0, $00, $00, 0, 1, 2, 0, $151)
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 0, $151)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $150)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $150)

Spitemaps_PirateWalking_19:
    dw $0004                                                             ;B2B4F2;
    %spritemapEntry(0, $00, $00, 0, 1, 2, 0, $153)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $152)
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 0, $153)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $152)

Spitemaps_PirateWalking_1A:
    dw $0009                                                             ;B2B508;
    %spritemapEntry(0, $1FB, $FB, 0, 0, 2, 0, $113)
    %spritemapEntry(0, $1FB, $F3, 0, 0, 2, 0, $103)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $13F)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $13E)
    %spritemapEntry(0, $1FF, $F0, 0, 0, 2, 0, $12F)
    %spritemapEntry(0, $1F7, $F0, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1EA, $00, 0, 0, 2, 0, $127)
    %spritemapEntry(1, $1F2, $00, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $1F0, $EB, 0, 0, 2, 0, $10E)

Spitemaps_PirateWalking_1B:
    dw $0009                                                             ;B2B537;
    %spritemapEntry(0, $1FA, $FB, 0, 0, 2, 0, $113)
    %spritemapEntry(0, $1FA, $F3, 0, 0, 2, 0, $103)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $13F)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $13E)
    %spritemapEntry(0, $1FE, $F0, 0, 0, 2, 0, $12F)
    %spritemapEntry(0, $1F6, $F0, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1E9, $00, 0, 0, 2, 0, $127)
    %spritemapEntry(1, $1F1, $00, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $1EE, $EC, 0, 0, 2, 0, $10E)

Spitemaps_PirateWalking_1C:
    dw $000A                                                             ;B2B566;
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 0, $14C)
    %spritemapEntry(0, $1F0, $00, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1E8, $00, 0, 0, 2, 0, $14A)
    %spritemapEntry(0, $1F9, $FB, 0, 0, 2, 0, $113)
    %spritemapEntry(0, $1F9, $F3, 0, 0, 2, 0, $103)
    %spritemapEntry(0, $1FF, $F8, 0, 0, 2, 0, $13F)
    %spritemapEntry(0, $1F7, $F8, 0, 0, 2, 0, $13E)
    %spritemapEntry(0, $1FD, $F0, 0, 0, 2, 0, $12F)
    %spritemapEntry(0, $1F5, $F0, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1EC, $ED, 0, 0, 2, 0, $10E)

Spitemaps_PirateWalking_1D:
    dw $0009                                                             ;B2B59A;
    %spritemapEntry(1, $1EE, $F8, 0, 0, 2, 0, $12B)
    %spritemapEntry(1, $1E6, $F8, 0, 0, 2, 0, $12A)
    %spritemapEntry(0, $1F8, $FB, 0, 0, 2, 0, $113)
    %spritemapEntry(0, $1F8, $F3, 0, 0, 2, 0, $103)
    %spritemapEntry(0, $1FF, $F8, 0, 0, 2, 0, $13F)
    %spritemapEntry(0, $1F7, $F8, 0, 0, 2, 0, $13E)
    %spritemapEntry(0, $1FD, $F0, 0, 0, 2, 0, $12F)
    %spritemapEntry(0, $1F5, $F0, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1EB, $EE, 0, 0, 2, 0, $10E)

Spitemaps_PirateWalking_1E:
    dw $0009                                                             ;B2B5C9;
    %spritemapEntry(1, $1EE, $FA, 0, 0, 2, 0, $12B)
    %spritemapEntry(1, $1E6, $FA, 0, 0, 2, 0, $12A)
    %spritemapEntry(0, $1F7, $FA, 0, 0, 2, 0, $113)
    %spritemapEntry(0, $1F7, $F3, 0, 0, 2, 0, $103)
    %spritemapEntry(0, $1FE, $F8, 0, 0, 2, 0, $13F)
    %spritemapEntry(0, $1F6, $F8, 0, 0, 2, 0, $13E)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 2, 0, $12F)
    %spritemapEntry(0, $1F4, $F0, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1EA, $EF, 0, 0, 2, 0, $10E)

Spitemaps_PirateWalking_1F:
    dw $0009                                                             ;B2B5F8;
    %spritemapEntry(1, $1EE, $FB, 0, 0, 2, 0, $12B)
    %spritemapEntry(1, $1E6, $FB, 0, 0, 2, 0, $12A)
    %spritemapEntry(0, $1F7, $FB, 0, 0, 2, 0, $113)
    %spritemapEntry(0, $1F6, $F4, 0, 0, 2, 0, $103)
    %spritemapEntry(0, $1FE, $F8, 0, 0, 2, 0, $13F)
    %spritemapEntry(0, $1F5, $F9, 0, 0, 2, 0, $13E)
    %spritemapEntry(0, $1FB, $F1, 0, 0, 2, 0, $12F)
    %spritemapEntry(0, $1F3, $F1, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1EA, $F0, 0, 0, 2, 0, $10E)

Spitemaps_PirateWalking_20:
    dw $0009                                                             ;B2B627;
    %spritemapEntry(0, $1FD, $FB, 0, 1, 2, 0, $113)
    %spritemapEntry(0, $1FD, $F3, 0, 1, 2, 0, $103)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 0, $13F)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $13E)
    %spritemapEntry(0, $1F9, $F0, 0, 1, 2, 0, $12F)
    %spritemapEntry(0, $01, $F0, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $06, $00, 0, 1, 2, 0, $127)
    %spritemapEntry(1, $1FE, $00, 0, 1, 2, 0, $128)
    %spritemapEntry(1, $00, $EB, 0, 1, 2, 0, $10E)

Spitemaps_PirateWalking_21:
    dw $0009                                                             ;B2B656;
    %spritemapEntry(0, $1FE, $FB, 0, 1, 2, 0, $113)
    %spritemapEntry(0, $1FE, $F3, 0, 1, 2, 0, $103)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 0, $13F)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $13E)
    %spritemapEntry(0, $1FA, $F0, 0, 1, 2, 0, $12F)
    %spritemapEntry(0, $02, $F0, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $07, $00, 0, 1, 2, 0, $127)
    %spritemapEntry(1, $1FF, $00, 0, 1, 2, 0, $128)
    %spritemapEntry(1, $02, $EC, 0, 1, 2, 0, $10E)

Spitemaps_PirateWalking_22:
    dw $000A                                                             ;B2B685;
    %spritemapEntry(0, $00, $00, 0, 1, 2, 0, $14C)
    %spritemapEntry(0, $08, $00, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $10, $00, 0, 1, 2, 0, $14A)
    %spritemapEntry(0, $1FF, $FB, 0, 1, 2, 0, $113)
    %spritemapEntry(0, $1FF, $F3, 0, 1, 2, 0, $103)
    %spritemapEntry(0, $1F9, $F8, 0, 1, 2, 0, $13F)
    %spritemapEntry(0, $01, $F8, 0, 1, 2, 0, $13E)
    %spritemapEntry(0, $1FB, $F0, 0, 1, 2, 0, $12F)
    %spritemapEntry(0, $03, $F0, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $04, $ED, 0, 1, 2, 0, $10E)

Spitemaps_PirateWalking_23:
    dw $0009                                                             ;B2B6B9;
    %spritemapEntry(1, $02, $F8, 0, 1, 2, 0, $12B)
    %spritemapEntry(1, $0A, $F8, 0, 1, 2, 0, $12A)
    %spritemapEntry(0, $00, $FB, 0, 1, 2, 0, $113)
    %spritemapEntry(0, $00, $F3, 0, 1, 2, 0, $103)
    %spritemapEntry(0, $1F9, $F8, 0, 1, 2, 0, $13F)
    %spritemapEntry(0, $01, $F8, 0, 1, 2, 0, $13E)
    %spritemapEntry(0, $1FB, $F0, 0, 1, 2, 0, $12F)
    %spritemapEntry(0, $03, $F0, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $05, $EE, 0, 1, 2, 0, $10E)

Spitemaps_PirateWalking_24:
    dw $0009                                                             ;B2B6E8;
    %spritemapEntry(1, $02, $FA, 0, 1, 2, 0, $12B)
    %spritemapEntry(1, $0A, $FA, 0, 1, 2, 0, $12A)
    %spritemapEntry(0, $01, $FA, 0, 1, 2, 0, $113)
    %spritemapEntry(0, $01, $F3, 0, 1, 2, 0, $103)
    %spritemapEntry(0, $1FA, $F8, 0, 1, 2, 0, $13F)
    %spritemapEntry(0, $02, $F8, 0, 1, 2, 0, $13E)
    %spritemapEntry(0, $1FC, $F0, 0, 1, 2, 0, $12F)
    %spritemapEntry(0, $04, $F0, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $06, $EF, 0, 1, 2, 0, $10E)

Spitemaps_PirateWalking_25:
    dw $0009                                                             ;B2B717;
    %spritemapEntry(1, $02, $FB, 0, 1, 2, 0, $12B)
    %spritemapEntry(1, $0A, $FB, 0, 1, 2, 0, $12A)
    %spritemapEntry(0, $01, $FB, 0, 1, 2, 0, $113)
    %spritemapEntry(0, $02, $F4, 0, 1, 2, 0, $103)
    %spritemapEntry(0, $1FA, $F8, 0, 1, 2, 0, $13F)
    %spritemapEntry(0, $03, $F9, 0, 1, 2, 0, $13E)
    %spritemapEntry(0, $1FD, $F1, 0, 1, 2, 0, $12F)
    %spritemapEntry(0, $05, $F1, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $06, $F0, 0, 1, 2, 0, $10E)

Spitemaps_PirateNinja_5:
    dw $000A                                                             ;B2B746;
    %spritemapEntry(1, $1F4, $00, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $1FD, $08, 0, 0, 2, 0, $11B)
    %spritemapEntry(0, $1FD, $00, 0, 0, 2, 0, $10B)
    %spritemapEntry(0, $1ED, $16, 0, 0, 2, 0, $136)
    %spritemapEntry(1, $00, $08, 0, 0, 2, 0, $17E)
    %spritemapEntry(0, $1F1, $13, 0, 0, 2, 0, $130)
    %spritemapEntry(0, $1F1, $0B, 0, 0, 2, 0, $120)
    %spritemapEntry(0, $1E6, $16, 0, 0, 2, 0, $135)
    %spritemapEntry(0, $0D, $16, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $0C, $0E, 0, 0, 2, 0, $143)

Spitemaps_PirateNinja_6:
    dw $000C                                                             ;B2B77A;
    %spritemapEntry(0, $0B, $10, 0, 0, 2, 0, $18D)
    %spritemapEntry(0, $0B, $08, 0, 0, 2, 0, $17D)
    %spritemapEntry(0, $08, $09, 0, 0, 2, 0, $16D)
    %spritemapEntry(0, $00, $09, 0, 0, 2, 0, $16C)
    %spritemapEntry(0, $1F9, $12, 0, 0, 2, 0, $131)
    %spritemapEntry(0, $1F9, $0A, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $1F7, $18, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1EF, $18, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $1FA, $06, 0, 0, 2, 0, $119)
    %spritemapEntry(0, $1FA, $FE, 0, 0, 2, 0, $109)
    %spritemapEntry(0, $1FC, $06, 0, 0, 2, 0, $11A)
    %spritemapEntry(0, $1FC, $FE, 0, 0, 2, 0, $10A)

Spitemaps_PirateNinja_7:
    dw $000C                                                             ;B2B7B8;
    %spritemapEntry(0, $1FC, $06, 0, 0, 2, 0, $11A)
    %spritemapEntry(0, $1FC, $FE, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $1F9, $05, 0, 0, 2, 0, $119)
    %spritemapEntry(0, $1FD, $18, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1FE, $14, 0, 0, 2, 0, $131)
    %spritemapEntry(0, $1FE, $0C, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $1F9, $FD, 0, 0, 2, 0, $109)
    %spritemapEntry(0, $1F5, $18, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $01, $09, 0, 0, 2, 0, $16F)
    %spritemapEntry(0, $1F9, $09, 0, 0, 2, 0, $16E)
    %spritemapEntry(0, $05, $11, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $05, $09, 0, 0, 2, 0, $143)

Spitemaps_PirateNinja_8:
    dw $000B                                                             ;B2B7F6;
    %spritemapEntry(0, $1FA, $14, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1F2, $14, 0, 0, 2, 0, $145)
    %spritemapEntry(0, $06, $18, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1FE, $18, 0, 0, 2, 0, $145)
    %spritemapEntry(0, $03, $13, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $03, $0B, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $1FE, $07, 0, 0, 2, 0, $11B)
    %spritemapEntry(0, $1FF, $FF, 0, 0, 2, 0, $10B)
    %spritemapEntry(1, $1F5, $FD, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $1F9, $0F, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $1F9, $07, 0, 0, 2, 0, $124)

Spitemaps_PirateNinja_9:
    dw $000A                                                             ;B2B82F;
    %spritemapEntry(0, $1FC, $08, 0, 0, 2, 0, $11B)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $1F0, $12, 0, 0, 2, 0, $130)
    %spritemapEntry(1, $1FF, $08, 0, 0, 2, 0, $17E)
    %spritemapEntry(0, $1EB, $16, 0, 0, 2, 0, $136)
    %spritemapEntry(0, $1E4, $16, 0, 0, 2, 0, $135)
    %spritemapEntry(0, $0D, $16, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $0C, $0E, 0, 0, 2, 0, $143)
    %spritemapEntry(0, $1F0, $0A, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1F3, $FF, 0, 0, 2, 0, $107)

Spitemaps_PirateNinja_A:
    dw $000C                                                             ;B2B863;
    %spritemapEntry(0, $0A, $0F, 0, 0, 2, 0, $18D)
    %spritemapEntry(0, $0A, $07, 0, 0, 2, 0, $17D)
    %spritemapEntry(0, $1F5, $18, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1ED, $18, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $06, $09, 0, 0, 2, 0, $16D)
    %spritemapEntry(0, $1FE, $09, 0, 0, 2, 0, $16C)
    %spritemapEntry(0, $1F6, $13, 0, 0, 2, 0, $131)
    %spritemapEntry(0, $1F7, $0B, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $1FB, $06, 0, 0, 2, 0, $11A)
    %spritemapEntry(0, $1FB, $FE, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $1F8, $07, 0, 0, 2, 0, $119)
    %spritemapEntry(0, $1F8, $FF, 0, 0, 2, 0, $109)

Spitemaps_PirateNinja_B:
    dw $000C                                                             ;B2B8A1;
    %spritemapEntry(0, $07, $12, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $07, $0A, 0, 0, 2, 0, $143)
    %spritemapEntry(0, $02, $0A, 0, 0, 2, 0, $16F)
    %spritemapEntry(0, $1FA, $0A, 0, 0, 2, 0, $16E)
    %spritemapEntry(0, $1FA, $06, 0, 0, 2, 0, $119)
    %spritemapEntry(0, $1FB, $FE, 0, 0, 2, 0, $109)
    %spritemapEntry(0, $1FD, $18, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1F5, $18, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $1FE, $15, 0, 0, 2, 0, $131)
    %spritemapEntry(0, $1FE, $0D, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $1FC, $08, 0, 0, 2, 0, $11A)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 0, $10A)

Spitemaps_PirateNinja_C:
    dw $000B                                                             ;B2B8DF;
    %spritemapEntry(0, $1FA, $14, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1F2, $14, 0, 0, 2, 0, $145)
    %spritemapEntry(1, $1F6, $FC, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $1F8, $0E, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $1F8, $06, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $04, $18, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1FC, $18, 0, 0, 2, 0, $145)
    %spritemapEntry(0, $01, $13, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $01, $0B, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $1FC, $07, 0, 0, 2, 0, $11B)
    %spritemapEntry(0, $1FD, $FF, 0, 0, 2, 0, $10B)

Spitemaps_PirateWalking_26_Ninja_D:
    dw $0009                                                             ;B2B918;
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 0, $112)
    %spritemapEntry(0, $1FC, $F4, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $1EC, $01, 0, 0, 2, 0, $127)
    %spritemapEntry(1, $1F4, $01, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F1, $EA, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1F6, $FE, 0, 0, 2, 0, $14C)
    %spritemapEntry(0, $1EE, $FE, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1E6, $FE, 0, 0, 2, 0, $14A)

Spitemaps_PirateWalking_27_Ninja_E:
    dw $0009                                                             ;B2B947;
    %spritemapEntry(1, $1EB, $00, 0, 0, 2, 0, $127)
    %spritemapEntry(1, $1F3, $00, 0, 0, 2, 0, $128)
    %spritemapEntry(0, $1FB, $FB, 0, 0, 2, 0, $113)
    %spritemapEntry(0, $1FA, $F3, 0, 0, 2, 0, $103)
    %spritemapEntry(1, $1F8, $EF, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F1, $EA, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1F8, $FD, 0, 0, 2, 0, $14C)
    %spritemapEntry(0, $1F0, $FD, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1E8, $FD, 0, 0, 2, 0, $14A)

Spitemaps_PirateWalking_28_Ninja_F:
    dw $0008                                                             ;B2B976;
    %spritemapEntry(1, $1E9, $FE, 0, 0, 2, 0, $127)
    %spritemapEntry(1, $1F1, $FE, 0, 0, 2, 0, $128)
    %spritemapEntry(0, $1FA, $F8, 0, 0, 2, 0, $113)
    %spritemapEntry(0, $1FA, $F0, 0, 0, 2, 0, $103)
    %spritemapEntry(1, $1F8, $EE, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F1, $E8, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1F3, $FC, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1EB, $FD, 0, 0, 2, 0, $14A)

Spitemaps_PirateWalking_29_Ninja_10:
    dw $0008                                                             ;B2B9A0;
    %spritemapEntry(1, $1E8, $00, 0, 0, 2, 0, $127)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $128)
    %spritemapEntry(0, $1FA, $FA, 0, 0, 2, 0, $113)
    %spritemapEntry(0, $1FA, $F2, 0, 0, 2, 0, $103)
    %spritemapEntry(1, $1F8, $EF, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F1, $E9, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1F5, $FE, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1ED, $FF, 0, 0, 2, 0, $14A)

Spitemaps_PirateNinja_11:
    dw $0007                                                             ;B2B9CA;
    %spritemapEntry(0, $1F6, $FC, 0, 0, 2, 0, $14C)
    %spritemapEntry(0, $1EE, $FC, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1E6, $FC, 0, 0, 2, 0, $14A)
    %spritemapEntry(0, $1FB, $FA, 0, 0, 2, 0, $112)
    %spritemapEntry(0, $1FB, $F2, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F8, $EF, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F1, $E9, 0, 0, 2, 0, $10E)

Spitemaps_PirateNinja_12:
    dw $0007                                                             ;B2B9EF;
    %spritemapEntry(1, $1F4, $F2, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $1E2, $F3, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $1EA, $F3, 0, 0, 2, 0, $12B)
    %spritemapEntry(1, $1F8, $EF, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F1, $E9, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1F2, $FD, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1EA, $FD, 0, 0, 2, 0, $14A)

Spitemaps_PirateNinja_13:
    dw $0009                                                             ;B2BA14;
    %spritemapEntry(0, $1F1, $FD, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1E9, $FD, 0, 0, 2, 0, $14A)
    %spritemapEntry(0, $1E0, $E9, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $1E8, $E9, 0, 0, 2, 0, $12B)
    %spritemapEntry(0, $1FB, $F1, 0, 0, 2, 0, $14F)
    %spritemapEntry(0, $1F3, $F1, 0, 0, 2, 0, $14E)
    %spritemapEntry(1, $1F8, $EF, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F1, $E9, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1F6, $FD, 0, 0, 2, 0, $14C)

Spitemaps_PirateNinja_14:
    dw $000A                                                             ;B2BA43;
    %spritemapEntry(0, $1F0, $FD, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1E8, $FD, 0, 0, 2, 0, $14A)
    %spritemapEntry(0, $1FA, $E4, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1FA, $DC, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1FA, $D4, 0, 0, 2, 0, $12D)
    %spritemapEntry(0, $1FB, $E8, 1, 1, 2, 0, $113)
    %spritemapEntry(0, $1FB, $F0, 1, 1, 2, 0, $103)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F1, $EA, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1F6, $FD, 0, 0, 2, 0, $14C)

Spitemaps_PirateNinja_15:
    dw $0014                                                             ;B2BA77;
    %spritemapEntry(0, $1F6, $12, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $1F6, $0A, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $1F7, $15, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1E2, $F4, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $1EA, $F4, 0, 0, 2, 0, $12B)
    %spritemapEntry(0, $1F7, $FA, 0, 0, 2, 0, $112)
    %spritemapEntry(0, $1F8, $F2, 0, 0, 2, 0, $102)
    %spritemapEntry(0, $02, $12, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $1FD, $16, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $1FD, $07, 0, 0, 2, 0, $11A)
    %spritemapEntry(0, $1FE, $FF, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $01, $0A, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $1F6, $F0, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F0, $EA, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1EF, $16, 0, 0, 2, 0, $145)
    %spritemapEntry(1, $1F3, $FF, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $1F6, $FE, 0, 0, 2, 0, $14C)
    %spritemapEntry(0, $1EE, $FE, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1E6, $FE, 0, 0, 2, 0, $14A)
    %spritemapEntry(0, $05, $15, 0, 0, 2, 0, $126)

Spitemaps_PirateNinja_16:
    dw $0013                                                             ;B2BADD;
    %spritemapEntry(0, $1F7, $08, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $07, $16, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1FF, $05, 0, 0, 2, 0, $11A)
    %spritemapEntry(0, $1FF, $FD, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $1E2, $F3, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $1EA, $F3, 0, 0, 2, 0, $12B)
    %spritemapEntry(1, $1F2, $F1, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $1F6, $EF, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1EF, $EA, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1F8, $16, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1F0, $15, 0, 0, 2, 0, $145)
    %spritemapEntry(0, $1FF, $15, 0, 0, 2, 0, $145)
    %spritemapEntry(0, $03, $10, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $02, $08, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $1F4, $FE, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $1F7, $10, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $1F5, $FD, 0, 0, 2, 0, $14C)
    %spritemapEntry(0, $1ED, $FD, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1E5, $FD, 0, 0, 2, 0, $14A)

Spitemaps_PirateNinja_17:
    dw $0014                                                             ;B2BB3E;
    %spritemapEntry(0, $1F7, $09, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $1F7, $06, 0, 0, 2, 0, $119)
    %spritemapEntry(0, $1F7, $FF, 0, 0, 2, 0, $109)
    %spritemapEntry(0, $1E0, $F5, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $1E8, $F5, 0, 0, 2, 0, $12B)
    %spritemapEntry(1, $1F1, $F3, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $1F5, $F0, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1EE, $EB, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1F8, $16, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1F0, $16, 0, 0, 2, 0, $145)
    %spritemapEntry(0, $06, $16, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1FE, $16, 0, 0, 2, 0, $145)
    %spritemapEntry(0, $03, $11, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $03, $09, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $1FF, $07, 0, 0, 2, 0, $11B)
    %spritemapEntry(0, $1FF, $FF, 0, 0, 2, 0, $10B)
    %spritemapEntry(0, $1F8, $11, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $1F4, $FE, 0, 0, 2, 0, $14C)
    %spritemapEntry(0, $1EC, $FE, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1E4, $FE, 0, 0, 2, 0, $14A)

Spitemaps_PirateNinja_18:
    dw $0009                                                             ;B2BD8B;
    %spritemapEntry(0, $1F9, $00, 1, 1, 2, 0, $14D)
    %spritemapEntry(0, $1F9, $08, 1, 1, 2, 0, $13D)
    %spritemapEntry(0, $1F9, $10, 1, 1, 2, 0, $12D)
    %spritemapEntry(0, $1FA, $FA, 0, 0, 2, 0, $113)
    %spritemapEntry(0, $1FA, $F2, 0, 0, 2, 0, $103)
    %spritemapEntry(1, $1F8, $EF, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F1, $E9, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1F5, $FD, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1ED, $FE, 0, 0, 2, 0, $14A)

Spitemaps_PirateWalking_2A_Ninja_18:
    dw $0010                                                             ;B2BDCB;
    %spritemapEntry(1, $1F9, $FE, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $1E4, $F3, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $1EC, $F3, 0, 0, 2, 0, $12B)
    %spritemapEntry(1, $1F6, $F1, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $1F2, $EB, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1F9, $F1, 0, 0, 2, 0, $12E)
    %spritemapEntry(0, $1ED, $F9, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1EC, $F1, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EB, $E9, 0, 0, 2, 0, $12D)
    %spritemapEntry(1, $1F4, $FE, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $1FC, $10, 0, 0, 2, 0, $125)
    %spritemapEntry(1, $1F3, $05, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $04, $10, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1FB, $07, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $1FA, $10, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1F2, $10, 0, 0, 2, 0, $125)

Spitemaps_PirateNinja_19:
    dw $000A                                                             ;B2BF45;
    %spritemapEntry(1, $1FC, $00, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $1FB, $08, 0, 1, 2, 0, $11B)
    %spritemapEntry(0, $1FB, $00, 0, 1, 2, 0, $10B)
    %spritemapEntry(0, $0B, $16, 0, 1, 2, 0, $136)
    %spritemapEntry(1, $1F0, $08, 0, 1, 2, 0, $17E)
    %spritemapEntry(0, $07, $13, 0, 1, 2, 0, $130)
    %spritemapEntry(0, $07, $0B, 0, 1, 2, 0, $120)
    %spritemapEntry(0, $12, $16, 0, 1, 2, 0, $135)
    %spritemapEntry(0, $1EB, $16, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1EC, $0E, 0, 1, 2, 0, $143)

Spitemaps_PirateNinja_1A:
    dw $000C                                                             ;B2BF79;
    %spritemapEntry(0, $1ED, $10, 0, 1, 2, 0, $18D)
    %spritemapEntry(0, $1ED, $08, 0, 1, 2, 0, $17D)
    %spritemapEntry(0, $1F0, $09, 0, 1, 2, 0, $16D)
    %spritemapEntry(0, $1F8, $09, 0, 1, 2, 0, $16C)
    %spritemapEntry(0, $1FF, $12, 0, 1, 2, 0, $131)
    %spritemapEntry(0, $1FF, $0A, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $01, $18, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $09, $18, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $1FE, $06, 0, 1, 2, 0, $119)
    %spritemapEntry(0, $1FE, $FE, 0, 1, 2, 0, $109)
    %spritemapEntry(0, $1FC, $06, 0, 1, 2, 0, $11A)
    %spritemapEntry(0, $1FC, $FE, 0, 1, 2, 0, $10A)

Spitemaps_PirateNinja_1B:
    dw $000C                                                             ;B2BFB7;
    %spritemapEntry(0, $1FC, $06, 0, 1, 2, 0, $11A)
    %spritemapEntry(0, $1FC, $FE, 0, 1, 2, 0, $10A)
    %spritemapEntry(0, $1FF, $05, 0, 1, 2, 0, $119)
    %spritemapEntry(0, $1FB, $18, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $1FA, $14, 0, 1, 2, 0, $131)
    %spritemapEntry(0, $1FA, $0C, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $1FF, $FD, 0, 1, 2, 0, $109)
    %spritemapEntry(0, $03, $18, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $1F7, $09, 0, 1, 2, 0, $16F)
    %spritemapEntry(0, $1FF, $09, 0, 1, 2, 0, $16E)
    %spritemapEntry(0, $1F3, $11, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1F3, $09, 0, 1, 2, 0, $143)

Spitemaps_PirateNinja_1C:
    dw $000B                                                             ;B2BFF5;
    %spritemapEntry(0, $1FE, $14, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $06, $14, 0, 1, 2, 0, $145)
    %spritemapEntry(0, $1F2, $18, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $1FA, $18, 0, 1, 2, 0, $145)
    %spritemapEntry(0, $1F5, $13, 0, 1, 2, 0, $134)
    %spritemapEntry(0, $1F5, $0B, 0, 1, 2, 0, $124)
    %spritemapEntry(0, $1FA, $07, 0, 1, 2, 0, $11B)
    %spritemapEntry(0, $1F9, $FF, 0, 1, 2, 0, $10B)
    %spritemapEntry(1, $1FB, $FD, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $1FF, $0F, 0, 1, 2, 0, $134)
    %spritemapEntry(0, $1FF, $07, 0, 1, 2, 0, $124)

Spitemaps_PirateNinja_1D:
    dw $000A                                                             ;B2C02E;
    %spritemapEntry(0, $1FC, $08, 0, 1, 2, 0, $11B)
    %spritemapEntry(0, $1FC, $00, 0, 1, 2, 0, $10A)
    %spritemapEntry(0, $08, $12, 0, 1, 2, 0, $130)
    %spritemapEntry(1, $1F1, $08, 0, 1, 2, 0, $17E)
    %spritemapEntry(0, $0D, $16, 0, 1, 2, 0, $136)
    %spritemapEntry(0, $14, $16, 0, 1, 2, 0, $135)
    %spritemapEntry(0, $1EB, $16, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1EC, $0E, 0, 1, 2, 0, $143)
    %spritemapEntry(0, $08, $0A, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $1FD, $FF, 0, 1, 2, 0, $107)

Spitemaps_PirateNinja_1E:
    dw $000C                                                             ;B2C062;
    %spritemapEntry(0, $1EE, $0F, 0, 1, 2, 0, $18D)
    %spritemapEntry(0, $1EE, $07, 0, 1, 2, 0, $17D)
    %spritemapEntry(0, $03, $18, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $0B, $18, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $1F2, $09, 0, 1, 2, 0, $16D)
    %spritemapEntry(0, $1FA, $09, 0, 1, 2, 0, $16C)
    %spritemapEntry(0, $02, $13, 0, 1, 2, 0, $131)
    %spritemapEntry(0, $01, $0B, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $1FD, $06, 0, 1, 2, 0, $11A)
    %spritemapEntry(0, $1FD, $FE, 0, 1, 2, 0, $10A)
    %spritemapEntry(0, $00, $07, 0, 1, 2, 0, $119)
    %spritemapEntry(0, $00, $FF, 0, 1, 2, 0, $109)

Spitemaps_PirateNinja_1F:
    dw $000C                                                             ;B2C0A0;
    %spritemapEntry(0, $1F1, $12, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1F1, $0A, 0, 1, 2, 0, $143)
    %spritemapEntry(0, $1F6, $0A, 0, 1, 2, 0, $16F)
    %spritemapEntry(0, $1FE, $0A, 0, 1, 2, 0, $16E)
    %spritemapEntry(0, $1FE, $06, 0, 1, 2, 0, $119)
    %spritemapEntry(0, $1FD, $FE, 0, 1, 2, 0, $109)
    %spritemapEntry(0, $1FB, $18, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $03, $18, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $1FA, $15, 0, 1, 2, 0, $131)
    %spritemapEntry(0, $1FA, $0D, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $1FC, $08, 0, 1, 2, 0, $11A)
    %spritemapEntry(0, $1FC, $00, 0, 1, 2, 0, $10A)

Spitemaps_PirateNinja_20:
    dw $000B                                                             ;B2C0DE;
    %spritemapEntry(0, $1FE, $14, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $06, $14, 0, 1, 2, 0, $145)
    %spritemapEntry(1, $1FA, $FC, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $00, $0E, 0, 1, 2, 0, $134)
    %spritemapEntry(0, $00, $06, 0, 1, 2, 0, $124)
    %spritemapEntry(0, $1F4, $18, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $1FC, $18, 0, 1, 2, 0, $145)
    %spritemapEntry(0, $1F7, $13, 0, 1, 2, 0, $134)
    %spritemapEntry(0, $1F7, $0B, 0, 1, 2, 0, $124)
    %spritemapEntry(0, $1FC, $07, 0, 1, 2, 0, $11B)
    %spritemapEntry(0, $1FB, $FF, 0, 1, 2, 0, $10B)

Spitemaps_PirateWalking_2B_Ninja_21:
    dw $0009                                                             ;B2C117;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $112)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $04, $01, 0, 1, 2, 0, $127)
    %spritemapEntry(1, $1FC, $01, 0, 1, 2, 0, $128)
    %spritemapEntry(1, $1F8, $F0, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $1FF, $EA, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $02, $FE, 0, 1, 2, 0, $14C)
    %spritemapEntry(0, $0A, $FE, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $12, $FE, 0, 1, 2, 0, $14A)

Spitemaps_PirateWalking_2C_Ninja_22:
    dw $0009                                                             ;B2C146;
    %spritemapEntry(1, $05, $00, 0, 1, 2, 0, $127)
    %spritemapEntry(1, $1FD, $00, 0, 1, 2, 0, $128)
    %spritemapEntry(0, $1FD, $FB, 0, 1, 2, 0, $113)
    %spritemapEntry(0, $1FE, $F3, 0, 1, 2, 0, $103)
    %spritemapEntry(1, $1F8, $EF, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $1FF, $EA, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $00, $FD, 0, 1, 2, 0, $14C)
    %spritemapEntry(0, $08, $FD, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $10, $FD, 0, 1, 2, 0, $14A)

Spitemaps_PirateWalking_2D_Ninja_23:
    dw $0008                                                             ;B2C175;
    %spritemapEntry(1, $07, $FE, 0, 1, 2, 0, $127)
    %spritemapEntry(1, $1FF, $FE, 0, 1, 2, 0, $128)
    %spritemapEntry(0, $1FE, $F8, 0, 1, 2, 0, $113)
    %spritemapEntry(0, $1FE, $F0, 0, 1, 2, 0, $103)
    %spritemapEntry(1, $1F8, $EE, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $1FF, $E8, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $05, $FC, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $0D, $FD, 0, 1, 2, 0, $14A)

Spitemaps_PirateWalking_2E_Ninja_24:
    dw $0008                                                             ;B2C19F;
    %spritemapEntry(1, $08, $00, 0, 1, 2, 0, $127)
    %spritemapEntry(1, $00, $00, 0, 1, 2, 0, $128)
    %spritemapEntry(0, $1FE, $FA, 0, 1, 2, 0, $113)
    %spritemapEntry(0, $1FE, $F2, 0, 1, 2, 0, $103)
    %spritemapEntry(1, $1F8, $EF, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $1FF, $E9, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $03, $FE, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $0B, $FF, 0, 1, 2, 0, $14A)

Spitemaps_PirateNinja_25:
    dw $0007                                                             ;B2C1C9;
    %spritemapEntry(0, $02, $FC, 0, 1, 2, 0, $14C)
    %spritemapEntry(0, $0A, $FC, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $12, $FC, 0, 1, 2, 0, $14A)
    %spritemapEntry(0, $1FD, $FA, 0, 1, 2, 0, $112)
    %spritemapEntry(0, $1FD, $F2, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $1F8, $EF, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $1FF, $E9, 0, 1, 2, 0, $10E)

Spitemaps_PirateNinja_26:
    dw $0007                                                             ;B2C1EE;
    %spritemapEntry(1, $1FC, $F2, 0, 1, 2, 0, $100)
    %spritemapEntry(0, $16, $F3, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $06, $F3, 0, 1, 2, 0, $12B)
    %spritemapEntry(1, $1F8, $EF, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $1FF, $E9, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $06, $FD, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $0E, $FD, 0, 1, 2, 0, $14A)

Spitemaps_PirateNinja_27:
    dw $0009                                                             ;B2C213;
    %spritemapEntry(0, $07, $FD, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $0F, $FD, 0, 1, 2, 0, $14A)
    %spritemapEntry(0, $18, $E9, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $08, $E9, 0, 1, 2, 0, $12B)
    %spritemapEntry(0, $1FD, $F1, 0, 1, 2, 0, $14F)
    %spritemapEntry(0, $05, $F1, 0, 1, 2, 0, $14E)
    %spritemapEntry(1, $1F8, $EF, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $1FF, $E9, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $02, $FD, 0, 1, 2, 0, $14C)

Spitemaps_PirateNinja_28:
    dw $000A                                                             ;B2C242;
    %spritemapEntry(0, $08, $FD, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $10, $FD, 0, 1, 2, 0, $14A)
    %spritemapEntry(0, $1FE, $E4, 0, 1, 2, 0, $14D)
    %spritemapEntry(0, $1FE, $DC, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $1FE, $D4, 0, 1, 2, 0, $12D)
    %spritemapEntry(0, $1FD, $E8, 1, 0, 2, 0, $113)
    %spritemapEntry(0, $1FD, $F0, 1, 0, 2, 0, $103)
    %spritemapEntry(1, $1F8, $F0, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $1FF, $EA, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $02, $FD, 0, 1, 2, 0, $14C)

Spitemaps_PirateNinja_29:
    dw $0014                                                             ;B2C276;
    %spritemapEntry(0, $02, $12, 0, 1, 2, 0, $134)
    %spritemapEntry(0, $02, $0A, 0, 1, 2, 0, $124)
    %spritemapEntry(0, $01, $15, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $16, $F4, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $06, $F4, 0, 1, 2, 0, $12B)
    %spritemapEntry(0, $01, $FA, 0, 1, 2, 0, $112)
    %spritemapEntry(0, $00, $F2, 0, 1, 2, 0, $102)
    %spritemapEntry(0, $1F6, $12, 0, 1, 2, 0, $134)
    %spritemapEntry(0, $1FB, $16, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $1FB, $07, 0, 1, 2, 0, $11A)
    %spritemapEntry(0, $1FA, $FF, 0, 1, 2, 0, $10A)
    %spritemapEntry(0, $1F7, $0A, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $1FA, $F0, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $00, $EA, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $09, $16, 0, 1, 2, 0, $145)
    %spritemapEntry(1, $1FD, $FF, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $02, $FE, 0, 1, 2, 0, $14C)
    %spritemapEntry(0, $0A, $FE, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $12, $FE, 0, 1, 2, 0, $14A)
    %spritemapEntry(0, $1F3, $15, 0, 1, 2, 0, $126)

Spitemaps_PirateNinja_2A:
    dw $0013                                                             ;B2C2DC;
    %spritemapEntry(0, $01, $08, 0, 1, 2, 0, $124)
    %spritemapEntry(0, $1F1, $16, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $1F9, $05, 0, 1, 2, 0, $11A)
    %spritemapEntry(0, $1F9, $FD, 0, 1, 2, 0, $10A)
    %spritemapEntry(0, $16, $F3, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $06, $F3, 0, 1, 2, 0, $12B)
    %spritemapEntry(1, $1FE, $F1, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1FA, $EF, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $01, $EA, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $00, $16, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $08, $15, 0, 1, 2, 0, $145)
    %spritemapEntry(0, $1F9, $15, 0, 1, 2, 0, $145)
    %spritemapEntry(0, $1F5, $10, 0, 1, 2, 0, $134)
    %spritemapEntry(0, $1F6, $08, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $1FC, $FE, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $01, $10, 0, 1, 2, 0, $134)
    %spritemapEntry(0, $03, $FD, 0, 1, 2, 0, $14C)
    %spritemapEntry(0, $0B, $FD, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $13, $FD, 0, 1, 2, 0, $14A)

Spitemaps_PirateNinja_2B:
    dw $0014                                                             ;B2C33D;
    %spritemapEntry(0, $01, $09, 0, 1, 2, 0, $124)
    %spritemapEntry(0, $01, $06, 0, 1, 2, 0, $119)
    %spritemapEntry(0, $01, $FF, 0, 1, 2, 0, $109)
    %spritemapEntry(0, $18, $F5, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $08, $F5, 0, 1, 2, 0, $12B)
    %spritemapEntry(1, $1FF, $F3, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1FB, $F0, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $02, $EB, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $00, $16, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $08, $16, 0, 1, 2, 0, $145)
    %spritemapEntry(0, $1F2, $16, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $1FA, $16, 0, 1, 2, 0, $145)
    %spritemapEntry(0, $1F5, $11, 0, 1, 2, 0, $134)
    %spritemapEntry(0, $1F5, $09, 0, 1, 2, 0, $124)
    %spritemapEntry(0, $1F9, $07, 0, 1, 2, 0, $11B)
    %spritemapEntry(0, $1F9, $FF, 0, 1, 2, 0, $10B)
    %spritemapEntry(0, $00, $11, 0, 1, 2, 0, $134)
    %spritemapEntry(0, $04, $FE, 0, 1, 2, 0, $14C)
    %spritemapEntry(0, $0C, $FE, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $14, $FE, 0, 1, 2, 0, $14A)

Spitemaps_PirateNinja_2C:
    dw $0009                                                             ;B2C58A;
    %spritemapEntry(0, $1FF, $00, 1, 0, 2, 0, $14D)
    %spritemapEntry(0, $1FF, $08, 1, 0, 2, 0, $13D)
    %spritemapEntry(0, $1FF, $10, 1, 0, 2, 0, $12D)
    %spritemapEntry(0, $1FE, $FA, 0, 1, 2, 0, $113)
    %spritemapEntry(0, $1FE, $F2, 0, 1, 2, 0, $103)
    %spritemapEntry(1, $1F8, $EF, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $1FF, $E9, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $03, $FD, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $0B, $FE, 0, 1, 2, 0, $14A)

Spitemaps_PirateWalking_2F:
    dw $0010                                                             ;B2C5B9;
    %spritemapEntry(1, $1F7, $FE, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $14, $F3, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $04, $F3, 0, 1, 2, 0, $12B)
    %spritemapEntry(1, $1FA, $F1, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1FE, $EB, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $1F7, $F1, 0, 1, 2, 0, $12E)
    %spritemapEntry(0, $0B, $F9, 0, 1, 2, 0, $14D)
    %spritemapEntry(0, $0C, $F1, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $0D, $E9, 0, 1, 2, 0, $12D)
    %spritemapEntry(1, $1FC, $FE, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $1FC, $10, 0, 1, 2, 0, $125)
    %spritemapEntry(1, $1FD, $05, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $1F4, $10, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $1F5, $07, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $1FE, $10, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $06, $10, 0, 1, 2, 0, $125)

Spitemaps_PirateNinja_2D:
    dw $0004                                                             ;B2C733;
    %spritemapEntry(1, $1FA, $00, 0, 0, 2, 0, $182)
    %spritemapEntry(1, $1EA, $00, 0, 0, 2, 0, $180)
    %spritemapEntry(1, $1FA, $F0, 0, 0, 2, 0, $162)
    %spritemapEntry(1, $1EA, $F0, 0, 0, 2, 0, $160)

Spitemaps_PirateNinja_2E:
    dw $0006                                                             ;B2C749;
    %spritemapEntry(0, $1F5, $10, 0, 0, 2, 0, $1A5)
    %spritemapEntry(0, $1FD, $10, 0, 0, 2, 0, $1A6)
    %spritemapEntry(1, $1FD, $00, 0, 0, 2, 0, $186)
    %spritemapEntry(1, $1ED, $00, 0, 0, 2, 0, $184)
    %spritemapEntry(1, $1FD, $F0, 0, 0, 2, 0, $166)
    %spritemapEntry(1, $1ED, $F0, 0, 0, 2, 0, $164)

Spitemaps_PirateNinja_2E_miscount:
    dw $0005                                                             ;B2C769;
    %spritemapEntry(0, $0C, $FE, 0, 0, 2, 0, $17C)
    %spritemapEntry(1, $1FC, $06, 0, 0, 2, 0, $18A)
    %spritemapEntry(1, $1EC, $06, 0, 0, 2, 0, $188)
    %spritemapEntry(1, $1FC, $F6, 0, 0, 2, 0, $16A)
    %spritemapEntry(1, $1EC, $F6, 0, 0, 2, 0, $168)

Spitemaps_PirateNinja_2F:
    dw $0007                                                             ;B2C784;
    %spritemapEntry(0, $10, $FA, 1, 1, 2, 0, $1A7)
    %spritemapEntry(1, $1F0, $F2, 1, 1, 2, 0, $1AA)
    %spritemapEntry(1, $00, $F2, 1, 1, 2, 0, $1A8)
    %spritemapEntry(0, $1F0, $02, 1, 1, 2, 0, $1B4)
    %spritemapEntry(0, $08, $02, 1, 1, 2, 0, $1B1)
    %spritemapEntry(0, $10, $02, 1, 1, 2, 0, $1B0)
    %spritemapEntry(1, $1F8, $02, 1, 1, 2, 0, $1A2)

Spitemaps_PirateNinja_30:
    dw $0004                                                             ;B2C7A9;
    %spritemapEntry(1, $1F6, $F0, 1, 1, 2, 0, $182)
    %spritemapEntry(1, $06, $F0, 1, 1, 2, 0, $180)
    %spritemapEntry(1, $1F6, $00, 1, 1, 2, 0, $162)
    %spritemapEntry(1, $06, $00, 1, 1, 2, 0, $160)

Spitemaps_PirateNinja_31:
    dw $0006                                                             ;B2C7BF;
    %spritemapEntry(0, $04, $E8, 1, 1, 2, 0, $1A5)
    %spritemapEntry(0, $1FC, $E8, 1, 1, 2, 0, $1A6)
    %spritemapEntry(1, $1F4, $F0, 1, 1, 2, 0, $186)
    %spritemapEntry(1, $04, $F0, 1, 1, 2, 0, $184)
    %spritemapEntry(1, $1F4, $00, 1, 1, 2, 0, $166)
    %spritemapEntry(1, $04, $00, 1, 1, 2, 0, $164)

Spitemaps_PirateNinja_32:
    dw $0005                                                             ;B2C7DF;
    %spritemapEntry(0, $1EC, $FA, 1, 1, 2, 0, $17C)
    %spritemapEntry(1, $1F4, $EA, 1, 1, 2, 0, $18A)
    %spritemapEntry(1, $04, $EA, 1, 1, 2, 0, $188)
    %spritemapEntry(1, $1F4, $FA, 1, 1, 2, 0, $16A)
    %spritemapEntry(1, $04, $FA, 1, 1, 2, 0, $168)

Spitemaps_PirateNinja_33:
    dw $0007                                                             ;B2C7FA;
    %spritemapEntry(0, $1E9, $FE, 0, 0, 2, 0, $1A7)
    %spritemapEntry(1, $01, $FE, 0, 0, 2, 0, $1AA)
    %spritemapEntry(1, $1F1, $FE, 0, 0, 2, 0, $1A8)
    %spritemapEntry(0, $09, $F6, 0, 0, 2, 0, $1B4)
    %spritemapEntry(0, $1F1, $F6, 0, 0, 2, 0, $1B1)
    %spritemapEntry(0, $1E9, $F6, 0, 0, 2, 0, $1B0)
    %spritemapEntry(1, $1F9, $EE, 0, 0, 2, 0, $1A2)

Spitemaps_PirateNinja_34:
    dw $0004                                                             ;B2C910;
    %spritemapEntry(1, $1F6, $00, 0, 1, 2, 0, $182)
    %spritemapEntry(1, $06, $00, 0, 1, 2, 0, $180)
    %spritemapEntry(1, $1F6, $F0, 0, 1, 2, 0, $162)
    %spritemapEntry(1, $06, $F0, 0, 1, 2, 0, $160)

Spitemaps_PirateNinja_35:
    dw $0006                                                             ;B2C926;
    %spritemapEntry(0, $03, $10, 0, 1, 2, 0, $1A5)
    %spritemapEntry(0, $1FB, $10, 0, 1, 2, 0, $1A6)
    %spritemapEntry(1, $1F3, $00, 0, 1, 2, 0, $186)
    %spritemapEntry(1, $03, $00, 0, 1, 2, 0, $184)
    %spritemapEntry(1, $1F3, $F0, 0, 1, 2, 0, $166)
    %spritemapEntry(1, $03, $F0, 0, 1, 2, 0, $164)

Spitemaps_PirateNinja_36:
    dw $0005                                                             ;B2C946;
    %spritemapEntry(0, $1EC, $FE, 0, 1, 2, 0, $17C)
    %spritemapEntry(1, $1F4, $06, 0, 1, 2, 0, $18A)
    %spritemapEntry(1, $04, $06, 0, 1, 2, 0, $188)
    %spritemapEntry(1, $1F4, $F6, 0, 1, 2, 0, $16A)
    %spritemapEntry(1, $04, $F6, 0, 1, 2, 0, $168)

Spitemaps_PirateNinja_37:
    dw $0007                                                             ;B2C961;
    %spritemapEntry(0, $1E8, $FA, 1, 0, 2, 0, $1A7)
    %spritemapEntry(1, $00, $F2, 1, 0, 2, 0, $1AA)
    %spritemapEntry(1, $1F0, $F2, 1, 0, 2, 0, $1A8)
    %spritemapEntry(0, $08, $02, 1, 0, 2, 0, $1B4)
    %spritemapEntry(0, $1F0, $02, 1, 0, 2, 0, $1B1)
    %spritemapEntry(0, $1E8, $02, 1, 0, 2, 0, $1B0)
    %spritemapEntry(1, $1F8, $02, 1, 0, 2, 0, $1A2)

Spitemaps_PirateNinja_38:
    dw $0004                                                             ;B2C986;
    %spritemapEntry(1, $1FA, $F0, 1, 0, 2, 0, $182)
    %spritemapEntry(1, $1EA, $F0, 1, 0, 2, 0, $180)
    %spritemapEntry(1, $1FA, $00, 1, 0, 2, 0, $162)
    %spritemapEntry(1, $1EA, $00, 1, 0, 2, 0, $160)

Spitemaps_PirateNinja_39:
    dw $0006                                                             ;B2C99C;
    %spritemapEntry(0, $1F4, $E8, 1, 0, 2, 0, $1A5)
    %spritemapEntry(0, $1FC, $E8, 1, 0, 2, 0, $1A6)
    %spritemapEntry(1, $1FC, $F0, 1, 0, 2, 0, $186)
    %spritemapEntry(1, $1EC, $F0, 1, 0, 2, 0, $184)
    %spritemapEntry(1, $1FC, $00, 1, 0, 2, 0, $166)
    %spritemapEntry(1, $1EC, $00, 1, 0, 2, 0, $164)

Spitemaps_PirateNinja_3A:
    dw $0005                                                             ;B2C9BC;
    %spritemapEntry(0, $0C, $FA, 1, 0, 2, 0, $17C)
    %spritemapEntry(1, $1FC, $EA, 1, 0, 2, 0, $18A)
    %spritemapEntry(1, $1EC, $EA, 1, 0, 2, 0, $188)
    %spritemapEntry(1, $1FC, $FA, 1, 0, 2, 0, $16A)
    %spritemapEntry(1, $1EC, $FA, 1, 0, 2, 0, $168)

Spitemaps_PirateNinja_3B:
    dw $0007                                                             ;B2C9D7;
    %spritemapEntry(0, $0F, $FE, 0, 1, 2, 0, $1A7)
    %spritemapEntry(1, $1EF, $FE, 0, 1, 2, 0, $1AA)
    %spritemapEntry(1, $1FF, $FE, 0, 1, 2, 0, $1A8)
    %spritemapEntry(0, $1EF, $F6, 0, 1, 2, 0, $1B4)
    %spritemapEntry(0, $07, $F6, 0, 1, 2, 0, $1B1)
    %spritemapEntry(0, $0F, $F6, 0, 1, 2, 0, $1B0)
    %spritemapEntry(1, $1F7, $EE, 0, 1, 2, 0, $1A2)

Spitemaps_PirateNinja_3C:
    dw $0014                                                             ;B2CC04;
    %spritemapEntry(0, $07, $FE, 0, 1, 2, 0, $15D)
    %spritemapEntry(0, $07, $F6, 0, 1, 2, 0, $15C)
    %spritemapEntry(0, $07, $EE, 0, 1, 2, 0, $15B)
    %spritemapEntry(0, $1FF, $14, 0, 1, 2, 0, $15A)
    %spritemapEntry(0, $1FF, $FE, 0, 1, 2, 0, $157)
    %spritemapEntry(0, $1FF, $0C, 0, 1, 2, 0, $159)
    %spritemapEntry(0, $1FF, $06, 0, 1, 2, 0, $158)
    %spritemapEntry(0, $1FF, $F8, 0, 1, 2, 0, $156)
    %spritemapEntry(0, $1FF, $F0, 0, 1, 2, 0, $155)
    %spritemapEntry(0, $1FF, $E8, 0, 1, 2, 0, $154)
    %spritemapEntry(0, $1F0, $00, 0, 0, 2, 0, $15D)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 2, 0, $15C)
    %spritemapEntry(0, $1F0, $F0, 0, 0, 2, 0, $15B)
    %spritemapEntry(0, $1F8, $18, 0, 0, 2, 0, $15A)
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 0, $157)
    %spritemapEntry(0, $1F8, $10, 0, 0, 2, 0, $159)
    %spritemapEntry(0, $1F8, $08, 0, 0, 2, 0, $158)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $156)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 2, 0, $155)
    %spritemapEntry(0, $1F8, $E8, 0, 0, 2, 0, $154)

Spitemaps_PirateNinja_3D:
    dw $000A                                                             ;B2D2C0;
    %spritemapEntry(0, $1F8, $11, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $1FC, $FE, 0, 0, 2, 0, $109)
    %spritemapEntry(0, $1FC, $06, 0, 0, 2, 0, $119)
    %spritemapEntry(0, $03, $15, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1FC, $15, 0, 0, 2, 0, $125)
    %spritemapEntry(1, $1F5, $FF, 0, 0, 2, 0, $107)
    %spritemapEntry(1, $1FB, $0A, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $1FA, $15, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1F2, $15, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $1F8, $09, 0, 0, 2, 0, $124)

Spitemaps_PirateNinja_3E:
    dw $000A                                                             ;B2D39C;
    %spritemapEntry(0, $1FC, $08, 0, 0, 2, 0, $119)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 0, $109)
    %spritemapEntry(1, $1F4, $01, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $1F6, $09, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $1F7, $11, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $02, $15, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1FC, $15, 0, 0, 2, 0, $125)
    %spritemapEntry(1, $1FA, $0B, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $1F9, $15, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1F2, $15, 0, 0, 2, 0, $125)

Spitemaps_PirateNinja_3F:
    dw $0005                                                             ;B2D3D0;
    %spritemapEntry(1, $1EA, $00, 0, 0, 2, 0, $127)
    %spritemapEntry(1, $1F2, $00, 0, 0, 2, 0, $128)
    %spritemapEntry(0, $1FB, $FB, 0, 0, 2, 0, $113)
    %spritemapEntry(0, $1FB, $F3, 0, 0, 2, 0, $103)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $12E)

Spitemaps_PirateNinja_40:
    dw $0005                                                             ;B2D3EB;
    %spritemapEntry(1, $06, $00, 0, 1, 2, 0, $127)
    %spritemapEntry(1, $1FE, $00, 0, 1, 2, 0, $128)
    %spritemapEntry(0, $1FD, $FB, 0, 1, 2, 0, $113)
    %spritemapEntry(0, $1FD, $F3, 0, 1, 2, 0, $103)
    %spritemapEntry(1, $1F8, $F0, 0, 1, 2, 0, $12E)

Spitemaps_PirateNinja_41:
    dw $000A                                                             ;B2D5CE;
    %spritemapEntry(0, $00, $11, 0, 1, 2, 0, $134)
    %spritemapEntry(0, $1FC, $FE, 0, 1, 2, 0, $109)
    %spritemapEntry(0, $1FC, $06, 0, 1, 2, 0, $119)
    %spritemapEntry(0, $1F5, $15, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $1FC, $15, 0, 1, 2, 0, $125)
    %spritemapEntry(1, $1FB, $FF, 0, 1, 2, 0, $107)
    %spritemapEntry(1, $1F5, $0A, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $1FE, $15, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $06, $15, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $00, $09, 0, 1, 2, 0, $124)

Spitemaps_PirateNinja_42:
    dw $000A                                                             ;B2D6AA;
    %spritemapEntry(0, $1FC, $08, 0, 1, 2, 0, $119)
    %spritemapEntry(0, $1FC, $00, 0, 1, 2, 0, $109)
    %spritemapEntry(1, $1FC, $01, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $02, $09, 0, 1, 2, 0, $124)
    %spritemapEntry(0, $01, $11, 0, 1, 2, 0, $134)
    %spritemapEntry(0, $1F6, $15, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $1FC, $15, 0, 1, 2, 0, $125)
    %spritemapEntry(1, $1F6, $0B, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $1FF, $15, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $06, $15, 0, 1, 2, 0, $125)

Spitemaps_PirateNinja_43:
    dw $0004                                                             ;B2D6DE;
    %spritemapEntry(0, $00, $00, 0, 1, 2, 0, $151)
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 0, $151)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $150)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $150)

Spitemaps_PirateNinja_44:
    dw $0004                                                             ;B2D6F4;
    %spritemapEntry(0, $00, $00, 0, 1, 2, 0, $153)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $152)
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 0, $153)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $152)

Spitemaps_PirateNinja_45:
    dw $0009                                                             ;B2D70A;
    %spritemapEntry(0, $1FB, $FB, 0, 0, 2, 0, $113)
    %spritemapEntry(0, $1FB, $F3, 0, 0, 2, 0, $103)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $13F)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $13E)
    %spritemapEntry(0, $1FF, $F0, 0, 0, 2, 0, $12F)
    %spritemapEntry(0, $1F7, $F0, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1EA, $00, 0, 0, 2, 0, $127)
    %spritemapEntry(1, $1F2, $00, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $1F0, $EB, 0, 0, 2, 0, $10E)

Spitemaps_PirateNinja_46:
    dw $0009                                                             ;B2D829;
    %spritemapEntry(0, $1FD, $FB, 0, 1, 2, 0, $113)
    %spritemapEntry(0, $1FD, $F3, 0, 1, 2, 0, $103)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 0, $13F)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $13E)
    %spritemapEntry(0, $1F9, $F0, 0, 1, 2, 0, $12F)
    %spritemapEntry(0, $01, $F0, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $06, $00, 0, 1, 2, 0, $127)
    %spritemapEntry(1, $1FE, $00, 0, 1, 2, 0, $128)
    %spritemapEntry(1, $00, $EB, 0, 1, 2, 0, $10E)

Spitemaps_PirateNinja_47:
    dw $0009                                                             ;B2DB1A;
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 0, $112)
    %spritemapEntry(0, $1FC, $F4, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $1EC, $01, 0, 0, 2, 0, $127)
    %spritemapEntry(1, $1F4, $01, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F1, $EA, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1F6, $FE, 0, 0, 2, 0, $14C)
    %spritemapEntry(0, $1EE, $FE, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1E6, $FE, 0, 0, 2, 0, $14A)

Spitemaps_PirateNinja_48:
    dw $0012                                                             ;B2DDEE;
    %spritemapEntry(1, $1F3, $EC, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $08, $FC, 1, 1, 2, 0, $14D)
    %spritemapEntry(0, $09, $04, 1, 1, 2, 0, $13D)
    %spritemapEntry(0, $09, $0C, 1, 1, 2, 0, $12D)
    %spritemapEntry(1, $1FE, $F2, 0, 0, 2, 0, $105)
    %spritemapEntry(1, $1F9, $F1, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1EE, $F3, 0, 0, 2, 0, $12B)
    %spritemapEntry(1, $1E6, $F3, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $1F7, $FF, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $02, $11, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $02, $09, 0, 0, 2, 0, $143)
    %spritemapEntry(0, $1F7, $09, 1, 1, 2, 0, $149)
    %spritemapEntry(0, $1FF, $09, 1, 1, 2, 0, $148)
    %spritemapEntry(1, $1F4, $FF, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $1F5, $0B, 1, 1, 2, 0, $149)
    %spritemapEntry(0, $1FD, $0B, 1, 1, 2, 0, $148)
    %spritemapEntry(0, $1FE, $13, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $1FE, $0B, 0, 0, 2, 0, $143)

Spitemaps_PirateNinja_49:
    dw $0016                                                             ;B2DE4A;
    %spritemapEntry(0, $1FE, $15, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $1FD, $0D, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $1FA, $FB, 0, 0, 2, 0, $14C)
    %spritemapEntry(0, $1F2, $FB, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1EA, $FB, 0, 0, 2, 0, $14A)
    %spritemapEntry(0, $1FC, $F9, 0, 0, 2, 0, $113)
    %spritemapEntry(0, $1FC, $F1, 0, 0, 2, 0, $103)
    %spritemapEntry(0, $00, $18, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1F8, $18, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $1FB, $08, 0, 0, 2, 0, $11A)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 0, $10A)
    %spritemapEntry(1, $1F3, $E6, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1F9, $EF, 0, 0, 2, 0, $12E)
    %spritemapEntry(0, $1FA, $FD, 0, 0, 2, 0, $149)
    %spritemapEntry(0, $1F2, $FD, 0, 0, 2, 0, $148)
    %spritemapEntry(0, $1F4, $0D, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1EC, $0D, 0, 0, 2, 0, $145)
    %spritemapEntry(0, $1F3, $09, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $1F3, $01, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $04, $F9, 1, 1, 2, 0, $14D)
    %spritemapEntry(0, $05, $01, 1, 1, 2, 0, $13D)
    %spritemapEntry(0, $06, $09, 1, 1, 2, 0, $12D)

Spitemaps_PirateNinja_4A:
    dw $0011                                                             ;B2E08F;
    %spritemapEntry(1, $1F3, $FB, 0, 0, 2, 0, $127)
    %spritemapEntry(1, $1FB, $FB, 0, 0, 2, 0, $128)
    %spritemapEntry(0, $1FE, $0D, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $1FE, $15, 0, 0, 2, 0, $131)
    %spritemapEntry(0, $1FD, $18, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1F5, $18, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $1FC, $08, 0, 0, 2, 0, $11A)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $07, $12, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $07, $0A, 0, 0, 2, 0, $143)
    %spritemapEntry(0, $1FA, $06, 0, 0, 2, 0, $119)
    %spritemapEntry(0, $1FB, $FE, 0, 0, 2, 0, $109)
    %spritemapEntry(0, $1FA, $0A, 0, 0, 2, 0, $16E)
    %spritemapEntry(1, $1FA, $F0, 0, 0, 2, 0, $105)
    %spritemapEntry(1, $1F1, $E6, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1F7, $EF, 0, 0, 2, 0, $12E)
    %spritemapEntry(0, $02, $0A, 0, 0, 2, 0, $16F)

Spitemaps_PirateNinja_4B:
    dw $0013                                                             ;B2E0E6;
    %spritemapEntry(0, $1FE, $FF, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $1E8, $EE, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $1EE, $ED, 0, 0, 2, 0, $12B)
    %spritemapEntry(1, $1F6, $EF, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $0A, $F5, 1, 1, 2, 0, $14D)
    %spritemapEntry(0, $0B, $FD, 1, 1, 2, 0, $13D)
    %spritemapEntry(0, $0C, $05, 1, 1, 2, 0, $12D)
    %spritemapEntry(1, $1F7, $E9, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1FB, $F1, 0, 0, 2, 0, $12E)
    %spritemapEntry(0, $1FD, $07, 0, 0, 2, 0, $11A)
    %spritemapEntry(0, $1E3, $FD, 1, 1, 2, 0, $16F)
    %spritemapEntry(0, $1EB, $FE, 1, 1, 2, 0, $16E)
    %spritemapEntry(0, $1FB, $FE, 0, 0, 2, 0, $19F)
    %spritemapEntry(0, $1F3, $FD, 0, 0, 2, 0, $19E)
    %spritemapEntry(0, $08, $16, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $00, $17, 0, 0, 2, 0, $125)
    %spritemapEntry(1, $1FE, $0A, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $1DE, $F4, 1, 1, 2, 0, $18D)
    %spritemapEntry(0, $1DD, $FC, 1, 1, 2, 0, $17D)

Spitemaps_PirateNinja_4C:
    dw $0013                                                             ;B2E147;
    %spritemapEntry(0, $1DE, $0A, 0, 0, 2, 0, $19D)
    %spritemapEntry(1, $1E2, $01, 0, 0, 2, 0, $1AC)
    %spritemapEntry(1, $1EF, $FB, 0, 0, 2, 0, $1AE)
    %spritemapEntry(0, $09, $F4, 1, 1, 2, 0, $14D)
    %spritemapEntry(0, $0A, $FC, 1, 1, 2, 0, $13D)
    %spritemapEntry(0, $0A, $04, 1, 1, 2, 0, $12D)
    %spritemapEntry(0, $06, $F3, 0, 0, 2, 0, $15F)
    %spritemapEntry(0, $1FE, $F4, 0, 0, 2, 0, $15E)
    %spritemapEntry(0, $1FF, $00, 0, 1, 2, 0, $10A)
    %spritemapEntry(1, $1F3, $EC, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1F9, $F2, 0, 0, 2, 0, $12E)
    %spritemapEntry(0, $1EF, $10, 0, 1, 2, 0, $18D)
    %spritemapEntry(0, $1EF, $08, 0, 1, 2, 0, $17D)
    %spritemapEntry(0, $1F4, $08, 0, 1, 2, 0, $16F)
    %spritemapEntry(0, $1FC, $09, 0, 1, 2, 0, $16E)
    %spritemapEntry(0, $00, $08, 0, 1, 2, 0, $11A)
    %spritemapEntry(0, $1F5, $EA, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1F4, $E2, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1F4, $DA, 0, 0, 2, 0, $12D)

Spitemaps_PirateNinja_4D:
    dw $0009                                                             ;B2E37A;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $112)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $04, $01, 0, 1, 2, 0, $127)
    %spritemapEntry(1, $1FC, $01, 0, 1, 2, 0, $128)
    %spritemapEntry(1, $1F8, $F0, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $1FF, $EA, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $02, $FE, 0, 1, 2, 0, $14C)
    %spritemapEntry(0, $0A, $FE, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $12, $FE, 0, 1, 2, 0, $14A)

Spitemaps_PirateNinja_4E:
    dw $0012                                                             ;B2E64E;
    %spritemapEntry(1, $1FD, $EC, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $1F0, $FC, 1, 0, 2, 0, $14D)
    %spritemapEntry(0, $1EF, $04, 1, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EF, $0C, 1, 0, 2, 0, $12D)
    %spritemapEntry(1, $1F2, $F2, 0, 1, 2, 0, $105)
    %spritemapEntry(1, $1F7, $F1, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $02, $F3, 0, 1, 2, 0, $12B)
    %spritemapEntry(1, $0A, $F3, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $1F9, $FF, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $1F6, $11, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1F6, $09, 0, 1, 2, 0, $143)
    %spritemapEntry(0, $01, $09, 1, 0, 2, 0, $149)
    %spritemapEntry(0, $1F9, $09, 1, 0, 2, 0, $148)
    %spritemapEntry(1, $1FC, $FF, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $03, $0B, 1, 0, 2, 0, $149)
    %spritemapEntry(0, $1FB, $0B, 1, 0, 2, 0, $148)
    %spritemapEntry(0, $1FA, $13, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1FA, $0B, 0, 1, 2, 0, $143)

Spitemaps_PirateNinja_4F:
    dw $0016                                                             ;B2E6AA;
    %spritemapEntry(0, $1FA, $15, 0, 1, 2, 0, $134)
    %spritemapEntry(0, $1FB, $0D, 0, 1, 2, 0, $124)
    %spritemapEntry(0, $1FE, $FB, 0, 1, 2, 0, $14C)
    %spritemapEntry(0, $06, $FB, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $0E, $FB, 0, 1, 2, 0, $14A)
    %spritemapEntry(0, $1FC, $F9, 0, 1, 2, 0, $113)
    %spritemapEntry(0, $1FC, $F1, 0, 1, 2, 0, $103)
    %spritemapEntry(0, $1F8, $18, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $00, $18, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $1FD, $08, 0, 1, 2, 0, $11A)
    %spritemapEntry(0, $1FC, $00, 0, 1, 2, 0, $10A)
    %spritemapEntry(1, $1FD, $E6, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $1F7, $EF, 0, 1, 2, 0, $12E)
    %spritemapEntry(0, $1FE, $FD, 0, 1, 2, 0, $149)
    %spritemapEntry(0, $06, $FD, 0, 1, 2, 0, $148)
    %spritemapEntry(0, $04, $0D, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $0C, $0D, 0, 1, 2, 0, $145)
    %spritemapEntry(0, $05, $09, 0, 1, 2, 0, $134)
    %spritemapEntry(0, $05, $01, 0, 1, 2, 0, $124)
    %spritemapEntry(0, $1F4, $F9, 1, 0, 2, 0, $14D)
    %spritemapEntry(0, $1F3, $01, 1, 0, 2, 0, $13D)
    %spritemapEntry(0, $1F2, $09, 1, 0, 2, 0, $12D)

Spitemaps_PirateNinja_50:
    dw $0011                                                             ;B2E8DE;
    %spritemapEntry(1, $1FD, $FB, 0, 1, 2, 0, $127)
    %spritemapEntry(1, $1F5, $FB, 0, 1, 2, 0, $128)
    %spritemapEntry(0, $1FA, $0D, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $1FA, $15, 0, 1, 2, 0, $131)
    %spritemapEntry(0, $1FB, $18, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $03, $18, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $1FC, $08, 0, 1, 2, 0, $11A)
    %spritemapEntry(0, $1FC, $00, 0, 1, 2, 0, $10A)
    %spritemapEntry(0, $1F1, $12, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1F1, $0A, 0, 1, 2, 0, $143)
    %spritemapEntry(0, $1FE, $06, 0, 1, 2, 0, $119)
    %spritemapEntry(0, $1FD, $FE, 0, 1, 2, 0, $109)
    %spritemapEntry(0, $1FE, $0A, 0, 1, 2, 0, $16E)
    %spritemapEntry(1, $1F6, $F0, 0, 1, 2, 0, $105)
    %spritemapEntry(1, $1FF, $E6, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $1F9, $EF, 0, 1, 2, 0, $12E)
    %spritemapEntry(0, $1F6, $0A, 0, 1, 2, 0, $16F)

Spitemaps_PirateNinja_51:
    dw $0013                                                             ;B2E935;
    %spritemapEntry(0, $1FA, $FF, 0, 1, 2, 0, $10A)
    %spritemapEntry(0, $10, $EE, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $02, $ED, 0, 1, 2, 0, $12B)
    %spritemapEntry(1, $1FA, $EF, 0, 1, 2, 0, $100)
    %spritemapEntry(0, $1EE, $F5, 1, 0, 2, 0, $14D)
    %spritemapEntry(0, $1ED, $FD, 1, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EC, $05, 1, 0, 2, 0, $12D)
    %spritemapEntry(1, $1F9, $E9, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $1F5, $F1, 0, 1, 2, 0, $12E)
    %spritemapEntry(0, $1FB, $07, 0, 1, 2, 0, $11A)
    %spritemapEntry(0, $15, $FD, 1, 0, 2, 0, $16F)
    %spritemapEntry(0, $0D, $FE, 1, 0, 2, 0, $16E)
    %spritemapEntry(0, $1FD, $FE, 0, 1, 2, 0, $19F)
    %spritemapEntry(0, $05, $FD, 0, 1, 2, 0, $19E)
    %spritemapEntry(0, $1F0, $16, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $1F8, $17, 0, 1, 2, 0, $125)
    %spritemapEntry(1, $1F2, $0A, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $1A, $F4, 1, 0, 2, 0, $18D)
    %spritemapEntry(0, $1B, $FC, 1, 0, 2, 0, $17D)

Spitemaps_PirateNinja_52:
    dw $0013                                                             ;B2E996;
    %spritemapEntry(0, $1A, $0A, 0, 1, 2, 0, $19D)
    %spritemapEntry(1, $0E, $01, 0, 1, 2, 0, $1AC)
    %spritemapEntry(1, $01, $FB, 0, 1, 2, 0, $1AE)
    %spritemapEntry(0, $1EF, $F4, 1, 0, 2, 0, $14D)
    %spritemapEntry(0, $1EE, $FC, 1, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EE, $04, 1, 0, 2, 0, $12D)
    %spritemapEntry(0, $1F2, $F3, 0, 1, 2, 0, $15F)
    %spritemapEntry(0, $1FA, $F4, 0, 1, 2, 0, $15E)
    %spritemapEntry(0, $1F9, $00, 0, 0, 2, 0, $10A)
    %spritemapEntry(1, $1FD, $EC, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $1F7, $F2, 0, 1, 2, 0, $12E)
    %spritemapEntry(0, $09, $10, 0, 0, 2, 0, $18D)
    %spritemapEntry(0, $09, $08, 0, 0, 2, 0, $17D)
    %spritemapEntry(0, $04, $08, 0, 0, 2, 0, $16F)
    %spritemapEntry(0, $1FC, $09, 0, 0, 2, 0, $16E)
    %spritemapEntry(0, $1F8, $08, 0, 0, 2, 0, $11A)
    %spritemapEntry(0, $03, $EA, 0, 1, 2, 0, $14D)
    %spritemapEntry(0, $04, $E2, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $04, $DA, 0, 1, 2, 0, $12D)


;;; $ECC0: Instruction list - fire laser and wall-jump left ;;;
InstList_PirateWall_FireLaser_WallJumpLeft:
    dw Instruction_PirateWall_FunctionInY                                ;B2ECC0;
    dw RTS_B2F0E3                                                        ;B2ECC2;
    dw $0009*!FPS,ExtendedSpritemaps_PirateWall_E                        ;B2ECC4;
    dw $000F*!FPS,ExtendedSpritemaps_PirateWall_F                        ;B2ECC8;
    dw Instruction_PirateWall_FireLaserLeft                              ;B2ECCC;
    dw Instruction_Common_WaitYFrames,$0020*!FPS                         ;B2ECCE;
    dw Instruction_PirateWall_PrepareWallJumpToLeft                      ;B2ECD2;
    dw Instruction_PirateWall_FunctionInY                                ;B2ECD4;
    dw Function_PirateWall_WallJumpingLeft                               ;B2ECD6;
    dw Instruction_PirateWall_QueueSpacePirateAttackSFX                  ;B2ECD8;
    dw $000A*!FPS,ExtendedSpritemaps_PirateWall_10                       ;B2ECDA;
    dw $0001,ExtendedSpritemaps_PirateWall_11                            ;B2ECDE;
    dw Instruction_Common_Sleep                                          ;B2ECE2;


;;; $ECE4: Instruction list - landed on left wall ;;;
InstList_PirateWall_LandedOnLeftWall:
    dw Instruction_PirateWall_FunctionInY                                ;B2ECE4;
    dw Function_PirateWall_ClimbingLeftWall                              ;B2ECE6;
    dw $000A*!FPS,ExtendedSpritemaps_PirateWall_10                       ;B2ECE8;


;;; $ECEC: Instruction list - moving up left wall ;;;
InstList_PirateWall_MovingUpLeftWall_0:
    dw Instruction_PirateWall_FunctionInY                                ;B2ECEC;
    dw Function_PirateWall_ClimbingLeftWall                              ;B2ECEE;
    dw Instruction_Common_TimerInY,$0004                                 ;B2ECF0;

InstList_PirateWall_MovingUpLeftWall_1:
    dw $000A*!FPS,ExtendedSpritemaps_PirateWall_0                        ;B2ECF4;
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left,$FFFD   ;B2ECF8;
    dw $0008*!FPS,ExtendedSpritemaps_PirateWall_1                        ;B2ECFA;
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left,$FFFD   ;B2ED00;
    dw $0005*!FPS,ExtendedSpritemaps_PirateWall_2                        ;B2ED02;
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left,$FFFD   ;B2ED08;
    dw $0008*!FPS,ExtendedSpritemaps_PirateWall_3                        ;B2ED0A;
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left,$FFFD   ;B2ED10;
    dw $000A*!FPS,ExtendedSpritemaps_PirateWall_4                        ;B2ED12;
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left,$FFFD   ;B2ED18;
    dw $0008*!FPS,ExtendedSpritemaps_PirateWall_3                        ;B2ED1A;
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left,$FFFD   ;B2ED20;
    dw $0005*!FPS,ExtendedSpritemaps_PirateWall_2                        ;B2ED22;
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left,$FFFD   ;B2ED28;
    dw $0008*!FPS,ExtendedSpritemaps_PirateWall_1                        ;B2ED2A;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;B2ED30;
    dw InstList_PirateWall_MovingUpLeftWall_1                            ;B2ED32;
    dw Instruction_PirateWall_RandomlyChooseADirection_LeftWall          ;B2ED34;


;;; $ED36: Instruction list - moving down left wall ;;;
InstList_PirateWall_MovingDownLeftWall_0:
    dw Instruction_PirateWall_FunctionInY                                ;B2ED36;
    dw Function_PirateWall_ClimbingLeftWall                              ;B2ED38;
    dw Instruction_Common_TimerInY,$0004                                 ;B2ED3A;

InstList_PirateWall_MovingDownLeftWall_1:
    dw $000A*!FPS,ExtendedSpritemaps_PirateWall_0                        ;B2ED3E;
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left,$0003   ;B2ED42;
    dw $0008*!FPS,ExtendedSpritemaps_PirateWall_1                        ;B2ED44;
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left,$0003   ;B2ED4A;
    dw $0005*!FPS,ExtendedSpritemaps_PirateWall_2                        ;B2ED4C;
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left,$0003   ;B2ED52;
    dw $0008*!FPS,ExtendedSpritemaps_PirateWall_3                        ;B2ED54;
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left,$0003   ;B2ED5A;
    dw $000A*!FPS,ExtendedSpritemaps_PirateWall_4                        ;B2ED5E;
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left,$0003   ;B2ED62;
    dw $0008*!FPS,ExtendedSpritemaps_PirateWall_3                        ;B2ED64;
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left,$0003   ;B2ED6A;
    dw $0005*!FPS,ExtendedSpritemaps_PirateWall_2                        ;B2ED6E;
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left,$0003   ;B2ED72;
    dw $0008*!FPS,ExtendedSpritemaps_PirateWall_1                        ;B2ED74;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;B2ED7A;
    dw InstList_PirateWall_MovingDownLeftWall_1                          ;B2ED7C;
    dw Instruction_PirateWall_RandomlyChooseADirection_LeftWall          ;B2ED7E;


;;; $ED80: Instruction list - fire laser and wall-jump right ;;;
InstList_PirateWall_FireLaser_WallJumpRight:
    dw Instruction_PirateWall_FunctionInY                                ;B2ED80;
    dw RTS_B2F04F                                                        ;B2ED82;
    dw $0009*!FPS,ExtendedSpritemaps_PirateWall_5                        ;B2ED84;
    dw $0001,ExtendedSpritemaps_PirateWall_6                             ;B2ED88;
    dw Instruction_PirateWall_FireLaserRight                             ;B2ED8C;
    dw Instruction_Common_WaitYFrames,$0020*!FPS                         ;B2ED8E;
    dw Instruction_PirateWall_PrepareWallJumpToRight                     ;B2ED92;
    dw Instruction_PirateWall_FunctionInY                                ;B2ED94;
    dw Function_PirateWall_WallJumpingRight                              ;B2ED96;
    dw Instruction_PirateWall_QueueSpacePirateAttackSFX                  ;B2ED98;
    dw $000A*!FPS,ExtendedSpritemaps_PirateWall_7                        ;B2ED9A;
    dw $0001,ExtendedSpritemaps_PirateWall_8                             ;B2ED9E;
    dw Instruction_Common_Sleep                                          ;B2EDA2;


;;; $EDA4: Instruction list - landed on right wall ;;;
InstList_PirateWall_LandingOnRightWall:
    dw Instruction_PirateWall_FunctionInY                                ;B2EDA4;
    dw Function_PirateWall_ClimbingRightWall                             ;B2EDA6;
    dw $000A*!FPS,ExtendedSpritemaps_PirateWall_7                        ;B2EDA8;


;;; $EDAC: Instruction list - moving down right wall ;;;
InstList_PirateWall_MovingDownRightWall_0:
    dw Instruction_PirateWall_FunctionInY                                ;B2EDAC;
    dw Function_PirateWall_ClimbingRightWall                             ;B2EDAE;
    dw Instruction_Common_TimerInY,$0004                                 ;B2EDB0;

InstList_PirateWall_MovingDownRightWall_1:
    dw $000A*!FPS,ExtendedSpritemaps_PirateWall_9                        ;B2EDB4;
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right,$0003  ;B2EDB8;
    dw $0008*!FPS,ExtendedSpritemaps_PirateWall_A                        ;B2EDBA;
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right,$0003  ;B2EDC0;
    dw $0005*!FPS,ExtendedSpritemaps_PirateWall_B                        ;B2EDC4;
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right,$0003  ;B2EDC8;
    dw $0008*!FPS,ExtendedSpritemaps_PirateWall_C                        ;B2EDCA;
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right,$0003  ;B2EDD0;
    dw $000A*!FPS,ExtendedSpritemaps_PirateWall_D                        ;B2EDD2;
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right,$0003  ;B2EDD8;
    dw $0008*!FPS,ExtendedSpritemaps_PirateWall_C                        ;B2EDDA;
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right,$0003  ;B2EDE0;
    dw $0005*!FPS,ExtendedSpritemaps_PirateWall_B                        ;B2EDE2;
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right,$0003  ;B2EDE8;
    dw $0008*!FPS,ExtendedSpritemaps_PirateWall_A                        ;B2EDEA;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;B2EDF0;
    dw InstList_PirateWall_MovingDownRightWall_1                         ;B2EDF2;
    dw Instruction_PirateWall_RandomlyChooseADirection_RightWall         ;B2EDF4;


;;; $EDF6: Instruction list - moving up right wall ;;;
InstList_PirateWall_MovingUpRightWall_0:
    dw Instruction_PirateWall_FunctionInY                                ;B2EDF6;
    dw Function_PirateWall_ClimbingRightWall                             ;B2EDF8;
    dw Instruction_Common_TimerInY,$0004                                 ;B2EDFA;

InstList_PirateWall_MovingUpRightWall_1:
    dw $000A*!FPS,ExtendedSpritemaps_PirateWall_9                        ;B2EDFE;
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right,$FFFD  ;B2EE02;
    dw $0008*!FPS,ExtendedSpritemaps_PirateWall_A                        ;B2EE04;
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right,$FFFD  ;B2EE0A;
    dw $0005*!FPS,ExtendedSpritemaps_PirateWall_B                        ;B2EE0C;
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right,$FFFD  ;B2EE12;
    dw $0008*!FPS,ExtendedSpritemaps_PirateWall_C                        ;B2EE14;
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right,$FFFD  ;B2EE1A;
    dw $000A*!FPS,ExtendedSpritemaps_PirateWall_D                        ;B2EE1C;
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right,$FFFD  ;B2EE22;
    dw $0008*!FPS,ExtendedSpritemaps_PirateWall_C                        ;B2EE24;
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right,$FFFD  ;B2EE2A;
    dw $0005*!FPS,ExtendedSpritemaps_PirateWall_B                        ;B2EE2C;
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right,$FFFD  ;B2EE32;
    dw $0008*!FPS,ExtendedSpritemaps_PirateWall_A                        ;B2EE34;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;B2EE3A;
    dw InstList_PirateWall_MovingUpRightWall_1                           ;B2EE3C;
    dw Instruction_PirateWall_RandomlyChooseADirection_RightWall         ;B2EE3E;


;;; $EE40: Instruction - move [[Y]] pixels down and change direction on collision - left wall ;;;
Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left:
    PHX                                                                  ;B2EE40;
    LDX.B EnemyIndex                                                     ;B2EE41;
    LDA.W #$0000                                                         ;B2EE44;
    STA.B DP_Temp12                                                      ;B2EE47;
    LDA.W $0000,Y                                                        ;B2EE49;
    STA.B DP_Temp14                                                      ;B2EE4C;
    PHY                                                                  ;B2EE4E;
    PHX                                                                  ;B2EE4F;
    JSL.L MoveEnemyDownBy_14_12                                          ;B2EE50;
    PLX                                                                  ;B2EE54;
    PLY                                                                  ;B2EE55;
    BCC .noCOllision                                                     ;B2EE56;
    LDA.W PirateWall.direction,X                                         ;B2EE58;
    EOR.W #$0001                                                         ;B2EE5B;
    STA.W PirateWall.direction,X                                         ;B2EE5E;
    LDY.W #InstList_PirateWall_MovingDownLeftWall_0                      ;B2EE61;
    LDA.W PirateWall.direction,X                                         ;B2EE64;
    BEQ .return                                                          ;B2EE67;
    LDY.W #InstList_PirateWall_MovingUpLeftWall_0                        ;B2EE69;

  .return:
    PLX                                                                  ;B2EE6C;
    RTL                                                                  ;B2EE6D;

  .noCOllision:
    PLX                                                                  ;B2EE6E;
    INY                                                                  ;B2EE6F;
    INY                                                                  ;B2EE70;
    RTL                                                                  ;B2EE71;


;;; $EE72: Instruction - move enemy [[Y]] pixels down and change direction on collision - right wall ;;;
Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right:
    PHX                                                                  ;B2EE72;
    LDX.B EnemyIndex                                                     ;B2EE73;
    LDA.W #$0000                                                         ;B2EE76;
    STA.B DP_Temp12                                                      ;B2EE79;
    LDA.W $0000,Y                                                        ;B2EE7B;
    STA.B DP_Temp14                                                      ;B2EE7E;
    PHY                                                                  ;B2EE80;
    PHX                                                                  ;B2EE81;
    JSL.L MoveEnemyDownBy_14_12                                          ;B2EE82;
    PLX                                                                  ;B2EE86;
    PLY                                                                  ;B2EE87;
    BCC .noCollision                                                     ;B2EE88;
    LDA.W PirateWall.direction,X                                         ;B2EE8A;
    EOR.W #$0001                                                         ;B2EE8D;
    STA.W PirateWall.direction,X                                         ;B2EE90;
    LDY.W #InstList_PirateWall_MovingDownRightWall_0                     ;B2EE93;
    LDA.W PirateWall.direction,X                                         ;B2EE96;
    BEQ .return                                                          ;B2EE99;
    LDY.W #InstList_PirateWall_MovingUpRightWall_0                       ;B2EE9B;

  .return:
    PLX                                                                  ;B2EE9E;
    RTL                                                                  ;B2EE9F;

  .noCollision:
    PLX                                                                  ;B2EEA0;
    INY                                                                  ;B2EEA1;
    INY                                                                  ;B2EEA2;
    RTL                                                                  ;B2EEA3;


;;; $EEA4: Instruction - randomly choose a direction - left wall ;;;
Instruction_PirateWall_RandomlyChooseADirection_LeftWall:
    PHX                                                                  ;B2EEA4;
    LDY.W #InstList_PirateWall_MovingDownLeftWall_0                      ;B2EEA5;
    LDX.B EnemyIndex                                                     ;B2EEA8;
    JSL.L GenerateRandomNumber                                           ;B2EEAB;
    AND.W #$0001                                                         ;B2EEAF;
    STA.W PirateWall.direction,X                                         ;B2EEB2;
    BEQ .return                                                          ;B2EEB5;
    LDY.W #InstList_PirateWall_MovingUpLeftWall_0                        ;B2EEB7;

  .return:
    PLX                                                                  ;B2EEBA;
    RTL                                                                  ;B2EEBB;


;;; $EEBC: Instruction - randomly choose a direction - right wall ;;;
Instruction_PirateWall_RandomlyChooseADirection_RightWall:
    PHX                                                                  ;B2EEBC;
    LDY.W #InstList_PirateWall_MovingDownRightWall_0                     ;B2EEBD;
    LDX.B EnemyIndex                                                     ;B2EEC0;
    JSL.L GenerateRandomNumber                                           ;B2EEC3;
    AND.W #$0001                                                         ;B2EEC7;
    STA.W PirateWall.direction,X                                         ;B2EECA;
    BEQ .return                                                          ;B2EECD;
    LDY.W #InstList_PirateWall_MovingUpRightWall_0                       ;B2EECF;

  .return:
    PLX                                                                  ;B2EED2;
    RTL                                                                  ;B2EED3;


;;; $EED4: Instruction - prepare wall-jump to right ;;;
Instruction_PirateWall_PrepareWallJumpToRight:
    PHX                                                                  ;B2EED4;
    PHY                                                                  ;B2EED5;
    LDX.B EnemyIndex                                                     ;B2EED6;
    LDA.W Enemy.init1,X                                                  ;B2EED9;
    CLC                                                                  ;B2EEDC;
    ADC.W Enemy.XPosition,X                                              ;B2EEDD;
    STA.W Enemy.var1,X                                                   ;B2EEE0;
    LDA.W Enemy.init1,X                                                  ;B2EEE3;
    LSR                                                                  ;B2EEE6;
    CLC                                                                  ;B2EEE7;
    ADC.W Enemy.XPosition,X                                              ;B2EEE8;
    STA.W PirateWall.wallJumpArcCenterXPosition,X                        ;B2EEEB;
    LDA.W Enemy.YPosition,X                                              ;B2EEEE;
    STA.W PirateWall.wallJumpArcCenterYPosition,X                        ;B2EEF1;
    LDA.W #$0040                                                         ;B2EEF4;
    STA.W PirateWall.wallJumpArcAngle,X                                  ;B2EEF7;
    PLY                                                                  ;B2EEFA;
    PLX                                                                  ;B2EEFB;
    RTL                                                                  ;B2EEFC;


;;; $EEFD: Instruction - prepare wall-jump to left ;;;
Instruction_PirateWall_PrepareWallJumpToLeft:
    PHX                                                                  ;B2EEFD;
    PHY                                                                  ;B2EEFE;
    LDX.B EnemyIndex                                                     ;B2EEFF;
    LDA.W Enemy.XPosition,X                                              ;B2EF02;
    SEC                                                                  ;B2EF05;
    SBC.W Enemy.init1,X                                                  ;B2EF06;
    STA.W Enemy.var1,X                                                   ;B2EF09;
    LDA.W Enemy.init1,X                                                  ;B2EF0C;
    LSR                                                                  ;B2EF0F;
    STA.B DP_Temp12                                                      ;B2EF10;
    LDA.W Enemy.XPosition,X                                              ;B2EF12;
    SEC                                                                  ;B2EF15;
    SBC.B DP_Temp12                                                      ;B2EF16;
    STA.W PirateWall.wallJumpArcCenterXPosition,X                        ;B2EF18;
    LDA.W Enemy.YPosition,X                                              ;B2EF1B;
    STA.W PirateWall.wallJumpArcCenterYPosition,X                        ;B2EF1E;
    LDA.W #$00C0                                                         ;B2EF21;
    STA.W PirateWall.wallJumpArcAngle,X                                  ;B2EF24;
    PLY                                                                  ;B2EF27;
    PLX                                                                  ;B2EF28;
    RTL                                                                  ;B2EF29;


;;; $EF2A: Instruction - fire laser left ;;;
Instruction_PirateWall_FireLaserLeft:
    PHX                                                                  ;B2EF2A;
    PHY                                                                  ;B2EF2B;
    LDY.B EnemyIndex                                                     ;B2EF2C;
    LDX.W Enemy.ID,Y                                                     ;B2EF2F;
    LDA.L EnemyHeaders_damage,X                                          ;B2EF32;
    STA.W EnemyProjectile_InitParam0                                     ;B2EF36;
    LDX.B EnemyIndex                                                     ;B2EF39;
    LDA.W Enemy.XPosition,X                                              ;B2EF3C;
    SEC                                                                  ;B2EF3F;
    SBC.W #$0018                                                         ;B2EF40;
    STA.B DP_Temp12                                                      ;B2EF43;
    LDA.W Enemy.YPosition,X                                              ;B2EF45;
    SEC                                                                  ;B2EF48;
    SBC.W #$0010                                                         ;B2EF49;
    STA.B DP_Temp14                                                      ;B2EF4C;
    LDA.W #$0000                                                         ;B2EF4E;
    STA.B DP_Temp16                                                      ;B2EF51;
    LDY.W #EnemyProjectile_PirateMotherBrainLaser                        ;B2EF53;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;B2EF56;
    PLY                                                                  ;B2EF5A;
    PLX                                                                  ;B2EF5B;
    RTL                                                                  ;B2EF5C;


;;; $EF5D: Instruction - fire laser right ;;;
Instruction_PirateWall_FireLaserRight:
    PHX                                                                  ;B2EF5D;
    PHY                                                                  ;B2EF5E;
    LDX.B EnemyIndex                                                     ;B2EF5F;
    LDA.W Enemy.XPosition,X                                              ;B2EF62;
    CLC                                                                  ;B2EF65;
    ADC.W #$0018                                                         ;B2EF66;
    STA.B DP_Temp12                                                      ;B2EF69;
    LDA.W Enemy.YPosition,X                                              ;B2EF6B;
    SEC                                                                  ;B2EF6E;
    SBC.W #$0010                                                         ;B2EF6F;
    STA.B DP_Temp14                                                      ;B2EF72;
    LDA.W #$0001                                                         ;B2EF74;
    STA.B DP_Temp16                                                      ;B2EF77;
    LDY.W #EnemyProjectile_PirateMotherBrainLaser                        ;B2EF79;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;B2EF7C;
    PLY                                                                  ;B2EF80;
    PLX                                                                  ;B2EF81;
    RTL                                                                  ;B2EF82;


;;; $EF83: Instruction - enemy function = [[Y]] ;;;
Instruction_PirateWall_FunctionInY:
    PHY                                                                  ;B2EF83;
    PHX                                                                  ;B2EF84;
    LDX.B EnemyIndex                                                     ;B2EF85;
    LDA.W $0000,Y                                                        ;B2EF88;
    STA.W PirateWall.function,X                                          ;B2EF8B;
    PLX                                                                  ;B2EF8E;
    PLY                                                                  ;B2EF8F;
    INY                                                                  ;B2EF90;
    INY                                                                  ;B2EF91;
    RTL                                                                  ;B2EF92;


;;; $EF93: Instruction - queue space pirate attack sound effect ;;;
Instruction_PirateWall_QueueSpacePirateAttackSFX:
    PHX                                                                  ;B2EF93;
    PHY                                                                  ;B2EF94;
    LDA.W #$0066                                                         ;B2EF95;
    JSL.L QueueSound_Lib2_Max6                                           ;B2EF98;
    PLY                                                                  ;B2EF9C;
    PLX                                                                  ;B2EF9D;
    RTL                                                                  ;B2EF9E;


;;; $EF9F: Initialisation AI - enemy $F353/$F393/$F3D3/$F413/$F453/$F493 (wall space pirates) ;;;
InitAI_PirateWall:
    LDX.B EnemyIndex                                                     ;B2EF9F;
    LDY.W #InstList_PirateWall_MovingDownLeftWall_0                      ;B2EFA2;
    LDA.W Enemy.init0,X                                                  ;B2EFA5;
    BIT.W #$0001                                                         ;B2EFA8;
    BEQ .zeroParam                                                       ;B2EFAB;
    LDY.W #InstList_PirateWall_MovingDownRightWall_0                     ;B2EFAD;

  .zeroParam:
    TYA                                                                  ;B2EFB0;
    STA.W Enemy.instList,X                                               ;B2EFB1;
    LDA.W #$00BE                                                         ;B2EFB4;
    STA.L PirateWall.wallJumpArcRightTargetAngle,X                       ;B2EFB7;
    LDA.W #$0042                                                         ;B2EFBB;
    STA.L PirateWall.wallJumpArcLeftTargetAngle,X                        ;B2EFBE;
if !PAL == 0
    LDA.W #$0002                                                         ;B2EFC2;
    STA.L PirateWall.wallJumpArcAngleDelta,X                             ;B2EFC5;
else
    LDA.W #$0233
    STA.L PirateWall.wallJumpArcAngleDeltaHighRes,X
endif
    LDA.W Enemy.init0,X                                                  ;B2EFC9;
    BIT.W #$8000                                                         ;B2EFCC;
    BNE .notFastJump                                                     ;B2EFCF;
    LDA.L PirateWall.wallJumpArcRightTargetAngle,X                       ;B2EFD1;
    CLC                                                                  ;B2EFD5;
    ADC.W #$0002                                                         ;B2EFD6;
    STA.L PirateWall.wallJumpArcRightTargetAngle,X                       ;B2EFD9;
    LDA.L PirateWall.wallJumpArcLeftTargetAngle,X                        ;B2EFDD;
    SEC                                                                  ;B2EFE1;
    SBC.W #$0002                                                         ;B2EFE2;
    STA.L PirateWall.wallJumpArcLeftTargetAngle,X                        ;B2EFE5;
if !PAL == 0
    LDA.L PirateWall.wallJumpArcAngleDelta,X                             ;B2EFE9;
    CLC                                                                  ;B2EFED;
    ADC.W #$0002                                                         ;B2EFEE;
    STA.L PirateWall.wallJumpArcAngleDelta,X                             ;B2EFF1;
else
    LDA.W #$0466
    STA.L PirateWall.wallJumpArcAngleDeltaHighRes,X
endif

  .notFastJump:
    LDY.W #Function_PirateWall_ClimbingLeftWall                          ;B2EFF5;
    LDA.W Enemy.init0,X                                                  ;B2EFF8;
    BIT.W #$0001                                                         ;B2EFFB;
    BEQ +                                                                ;B2EFFE;
    LDY.W #Function_PirateWall_ClimbingRightWall                         ;B2F000;

+   TYA                                                                  ;B2F003;
    STA.W PirateWall.function,X                                          ;B2F004;
    LDA.W Enemy.XPosition,X                                              ;B2F007;
    AND.W #$000F                                                         ;B2F00A;
    CMP.W #$000B                                                         ;B2F00D;
    BMI .lessThanB                                                       ;B2F010;
    LDA.W Enemy.XPosition,X                                              ;B2F012;
    AND.W #$FFF0                                                         ;B2F015;
    CLC                                                                  ;B2F018;
    ADC.W #$0010                                                         ;B2F019;
    STA.W Enemy.XPosition,X                                              ;B2F01C;
    RTL

  .lessThanB:
    LDA.W Enemy.XPosition,X                                              ;B2F021;
    AND.W #$FFF8                                                         ;B2F024;
    STA.W Enemy.XPosition,X                                              ;B2F027;
    RTL                                                                  ;B2F02C;


;;; $F02D: Main AI - enemy $F353/$F393/$F3D3/$F413/$F453/$F493 (wall space pirates) ;;;
MainAI_PirateWall:
    LDX.B EnemyIndex                                                     ;B2F02D;
    JSR.W (PirateWall.function,X)                                        ;B2F030;
    RTL                                                                  ;B2F033;


;;; $F034: Wall space pirate function - climbing left wall ;;;
Function_PirateWall_ClimbingLeftWall:
    LDX.B EnemyIndex                                                     ;B2F034;
    LDA.W #$0020                                                         ;B2F037;
    JSL.L IsSamusWithingAPixelRowsOfEnemy                                ;B2F03A;
    BEQ RTS_B2F04F                                                       ;B2F03E;
    LDA.W #InstList_PirateWall_FireLaser_WallJumpRight                   ;B2F040;
    STA.W Enemy.instList,X                                               ;B2F043;
    LDA.W #$0001                                                         ;B2F046;
    STA.W Enemy.instTimer,X                                              ;B2F049;

RTS_B2F04F:
    RTS                                                                  ;B2F04F;


;;; $F050: Wall space pirate function - wall-jumping right ;;;
Function_PirateWall_WallJumpingRight:
    LDX.B EnemyIndex                                                     ;B2F050;
    LDA.W Enemy.init1,X                                                  ;B2F053;
    LSR                                                                  ;B2F056;
    STA.W Temp_Radius                                                    ;B2F057;
    LDA.W PirateWall.wallJumpArcAngle,X                                  ;B2F05A;
    JSL.L EightBitNegativeSineMultiplication_A0B0C6                      ;B2F05D;
    CLC                                                                  ;B2F061;
    ADC.W PirateWall.wallJumpArcCenterXPosition,X                        ;B2F062;
    STA.W Enemy.XPosition,X                                              ;B2F065;
    LDA.W Enemy.init1,X                                                  ;B2F068;
    LSR                                                                  ;B2F06B;
    LSR                                                                  ;B2F06C;
    STA.W Temp_Radius                                                    ;B2F06D;
    LDA.W PirateWall.wallJumpArcAngle,X                                  ;B2F070;
    JSL.L EightBitCosineMultiplication_A0B0B2                            ;B2F073;
    EOR.W #$FFFF                                                         ;B2F077;
    INC                                                                  ;B2F07A;
    CLC                                                                  ;B2F07B;
    ADC.W PirateWall.wallJumpArcCenterYPosition,X                        ;B2F07C;
    STA.W Enemy.YPosition,X                                              ;B2F07F;
if !PAL != 0
    LDA.L PirateWall.wallJumpArcAngleDeltaHighRes,X
    AND.W #$00FF
    XBA
    CLC
    ADC.L PirateWall.wallJumpArcSubAngle,X
    STA.L PirateWall.wallJumpArcSubAngle,X
    BCC +
    LDA.L PirateWall.wallJumpArcAngleDeltaHighRes,X
    AND.W #$FF00
    XBA
    STA.L PirateWall.wallJumpArcAngleDelta,X
    LDA.W PirateWall.wallJumpArcAngle,X
    SEC
    SBC.L PirateWall.wallJumpArcAngleDelta,X
    AND.W #$00FF
    STA.W PirateWall.wallJumpArcAngle,X
    CMP.L PirateWall.wallJumpArcRightTargetAngle,X
    BEQ .reachedTarget

+   LDA.L PirateWall.wallJumpArcAngleDeltaHighRes,X
    AND.W #$FF00
    XBA
    STA.L PirateWall.wallJumpArcAngleDelta,X
endif
    LDA.W PirateWall.wallJumpArcAngle,X                                  ;B2F082;
    SEC                                                                  ;B2F085;
    SBC.L PirateWall.wallJumpArcAngleDelta,X                             ;B2F086;
    AND.W #$00FF                                                         ;B2F08A;
    STA.W PirateWall.wallJumpArcAngle,X                                  ;B2F08D;
    CMP.L PirateWall.wallJumpArcRightTargetAngle,X                       ;B2F090;
    BNE .return                                                          ;B2F094;

  .reachedTarget
    LDA.W #InstList_PirateWall_LandingOnRightWall                        ;B2F096;
    STA.W Enemy.instList,X                                               ;B2F099;
    LDA.W #$0001                                                         ;B2F09C;
    STA.W Enemy.instTimer,X                                              ;B2F09F;
    LDA.W Enemy.XPosition,X                                              ;B2F0A2;
    AND.W #$000F                                                         ;B2F0A5;
    CMP.W #$000B                                                         ;B2F0A8;
    BMI .lessThanB                                                       ;B2F0AB;
    LDA.W Enemy.XPosition,X                                              ;B2F0AD;
    AND.W #$FFF0                                                         ;B2F0B0;
    CLC                                                                  ;B2F0B3;
    ADC.W #$0010                                                         ;B2F0B4;
    STA.W Enemy.XPosition,X                                              ;B2F0B7;
    RTS

  .lessThanB:
    LDA.W Enemy.XPosition,X                                              ;B2F0BC;
    AND.W #$FFF8                                                         ;B2F0BF;
    STA.W Enemy.XPosition,X                                              ;B2F0C2;

  .return:
    RTS                                                                  ;B2F0C7;


;;; $F0C8: Wall space pirate function - climbing right wall ;;;
Function_PirateWall_ClimbingRightWall:
    LDX.B EnemyIndex                                                     ;B2F0C8;
    LDA.W #$0020                                                         ;B2F0CB;
    JSL.L IsSamusWithingAPixelRowsOfEnemy                                ;B2F0CE;
    BEQ .return                                                          ;B2F0D2;
    LDA.W #InstList_PirateWall_FireLaser_WallJumpLeft                    ;B2F0D4;
    STA.W Enemy.instList,X                                               ;B2F0D7;
    LDA.W #$0001                                                         ;B2F0DA;
    STA.W Enemy.instTimer,X                                              ;B2F0DD;
    RTS                                                                  ;B2F0E0;

  .return:
    RTS                                                                  ;B2F0E1;


;;; $F0E2: Unused. RTS ;;;
RTS_B2F0E2:
    RTS                                                                  ;B2F0E2;


;;; $F0E3: RTS ;;;
RTS_B2F0E3:
    RTS                                                                  ;B2F0E3;


;;; $F0E4: Wall space pirate function - wall-jumping left ;;;
Function_PirateWall_WallJumpingLeft:
    LDX.B EnemyIndex                                                     ;B2F0E4;
    LDA.W Enemy.init1,X                                                  ;B2F0E7;
    LSR                                                                  ;B2F0EA;
    STA.W Temp_Radius                                                    ;B2F0EB;
    LDA.W PirateWall.wallJumpArcAngle,X                                  ;B2F0EE;
    JSL.L EightBitNegativeSineMultiplication_A0B0C6                      ;B2F0F1;
    CLC                                                                  ;B2F0F5;
    ADC.W PirateWall.wallJumpArcCenterXPosition,X                        ;B2F0F6;
    STA.W Enemy.XPosition,X                                              ;B2F0F9;
    LDA.W Enemy.init1,X                                                  ;B2F0FC;
    LSR                                                                  ;B2F0FF;
    LSR                                                                  ;B2F100;
    STA.W Temp_Radius                                                    ;B2F101;
    LDA.W PirateWall.wallJumpArcAngle,X                                  ;B2F104;
    JSL.L EightBitCosineMultiplication_A0B0B2                            ;B2F107;
    EOR.W #$FFFF                                                         ;B2F10B;
    INC                                                                  ;B2F10E;
    CLC                                                                  ;B2F10F;
    ADC.W PirateWall.wallJumpArcCenterYPosition,X                        ;B2F110;
    STA.W Enemy.YPosition,X                                              ;B2F113;
if !PAL == 0
    LDA.W PirateWall.wallJumpArcAngle,X                                  ;B2F116;
    CLC                                                                  ;B2F119;
    ADC.L PirateWall.wallJumpArcAngleDelta,X                             ;B2F11A;
else
    LDA.L PirateWall.wallJumpArcAngleDeltaHighRes,X
    AND.W #$00FF
    XBA
    CLC
    ADC.L PirateWall.wallJumpArcSubAngle,X
    STA.L PirateWall.wallJumpArcSubAngle,X
    BCC +
    LDA.L PirateWall.wallJumpArcAngleDeltaHighRes,X
    AND.W #$FF00
    XBA
    CLC
    ADC.W PirateWall.wallJumpArcAngle,X
    AND.W #$00FF
    STA.W PirateWall.wallJumpArcAngle,X
    CMP.L PirateWall.wallJumpArcLeftTargetAngle,X
    BEQ .reachedTarget

+   LDA.L PirateWall.wallJumpArcAngleDeltaHighRes,X
    AND.W #$FF00
    XBA
    CLC
    ADC.W PirateWall.wallJumpArcAngle,X
endif
    AND.W #$00FF                                                         ;B2F11E;
    STA.W PirateWall.wallJumpArcAngle,X                                  ;B2F121;
    CMP.L PirateWall.wallJumpArcLeftTargetAngle,X                        ;B2F124;
    BNE .return                                                          ;B2F128;

  .reachedTarget
    LDA.W #InstList_PirateWall_LandedOnLeftWall                          ;B2F12A;
    STA.W Enemy.instList,X                                               ;B2F12D;
    LDA.W #$0001                                                         ;B2F130;
    STA.W Enemy.instTimer,X                                              ;B2F133;
    LDA.W Enemy.XPosition,X                                              ;B2F136;
    AND.W #$000F                                                         ;B2F139;
    CMP.W #$000B                                                         ;B2F13C;
    BMI .lessThanB                                                       ;B2F13F;
    LDA.W Enemy.XPosition,X                                              ;B2F141;
    AND.W #$FFF0                                                         ;B2F144;
    CLC                                                                  ;B2F147;
    ADC.W #$0010                                                         ;B2F148;
    STA.W Enemy.XPosition,X                                              ;B2F14B;
    RTS

  .lessThanB:
    LDA.W Enemy.XPosition,X                                              ;B2F150;
    AND.W #$FFF8                                                         ;B2F153;
    STA.W Enemy.XPosition,X                                              ;B2F156;

  .return:
    RTS                                                                  ;B2F15B;


;;; $F15C: Instruction list - projectile claw attack left ;;;
InstList_PirateNinja_ProjectileClawAttack_Left:
    dw Instruction_PirateWall_FunctionInY                                ;B2F15C;
    dw RTS_A0804B                                                        ;B2F15E;
    dw $0005*!FPS,ExtendedSpritemaps_PirateNinja_0                       ;B2F160;
    dw $0005*!FPS,ExtendedSpritemaps_PirateNinja_1                       ;B2F164;
    dw $0005*!FPS,ExtendedSpritemaps_PirateNinja_2                       ;B2F168;
    dw $0005*!FPS,ExtendedSpritemaps_PirateNinja_3                       ;B2F16C;
    dw $0005*!FPS,ExtendedSpritemaps_PirateNinja_4                       ;B2F170;
    dw $0002,ExtendedSpritemaps_PirateNinja_5                            ;B2F174;
    dw Instruction_PirateNinja_SpawnClawProjWithThrowDirSpawnOffset      ;B2F178;
    dw $0000,$FFE0,$FFF8                                                 ;B2F17A;
    dw Instruction_PirateNinja_QueueSoundInY_Lib2_Max6,$0066             ;B2F180;
    dw $0002,ExtendedSpritemaps_PirateNinja_6                            ;B2F182;
    dw $0002,ExtendedSpritemaps_PirateNinja_7                            ;B2F188;
    dw $0002,ExtendedSpritemaps_PirateNinja_8                            ;B2F18C;
    dw $0005*!FPS,ExtendedSpritemaps_PirateNinja_0                       ;B2F190;
    dw $0005*!FPS,ExtendedSpritemaps_PirateNinja_1                       ;B2F194;
    dw $0005*!FPS,ExtendedSpritemaps_PirateNinja_2                       ;B2F198;
    dw $0005*!FPS,ExtendedSpritemaps_PirateNinja_3                       ;B2F19C;
    dw $0005*!FPS,ExtendedSpritemaps_PirateNinja_4                       ;B2F1A0;
    dw $0002,ExtendedSpritemaps_PirateNinja_5                            ;B2F1A4;
    dw Instruction_PirateNinja_SpawnClawProjWithThrowDirSpawnOffset      ;B2F1A8;
    dw $0000,$FFF0,$0008                                                 ;B2F1AA;
    dw Instruction_PirateNinja_QueueSoundInY_Lib2_Max6,$0066             ;B2F1B0;
    dw $0002,ExtendedSpritemaps_PirateNinja_6                            ;B2F1B2;
    dw $0002,ExtendedSpritemaps_PirateNinja_7                            ;B2F1B8;
    dw $0002,ExtendedSpritemaps_PirateNinja_8                            ;B2F1BC;
    dw Instruction_Common_GotoY                                          ;B2F1C0;
    dw InstList_PirateNinja_Active_FacingLeft_0                          ;B2F1C2;


;;; $F1C4: Instruction list - spin jump left ;;;
InstList_PirateNinja_SpinJumpLeft_0:
    dw Instruction_PirateWall_FunctionInY                                ;B2F1C4;
    dw RTS_A0804B                                                        ;B2F1C6;
    dw $0005*!FPS,ExtendedSpritemaps_PirateNinja_0                       ;B2F1C8;
    dw $0005*!FPS,ExtendedSpritemaps_PirateNinja_1                       ;B2F1CC;
    dw $0005*!FPS,ExtendedSpritemaps_PirateNinja_2                       ;B2F1D0;
    dw $0005*!FPS,ExtendedSpritemaps_PirateNinja_3                       ;B2F1D4;
    dw $0005*!FPS,ExtendedSpritemaps_PirateNinja_4                       ;B2F1D8;
    dw $0002,ExtendedSpritemaps_PirateNinja_5                            ;B2F1DC;
    dw Instruction_PirateNinja_SpawnClawProjWithThrowDirSpawnOffset      ;B2F1E0;
    dw $0000,$FFE0,$FFF8                                                 ;B2F1E2;
    dw Instruction_PirateNinja_QueueSoundInY_Lib2_Max6,$0066             ;B2F1E8;
    dw $0002,ExtendedSpritemaps_PirateNinja_6                            ;B2F1EA;
    dw $0002,ExtendedSpritemaps_PirateNinja_7                            ;B2F1F0;
    dw $0002,ExtendedSpritemaps_PirateNinja_8                            ;B2F1F4;
    dw Instruction_PirateNinja_ResetSpeed                                ;B2F1F8;
    dw Instruction_PirateWall_FunctionInY                                ;B2F1FA;
    dw RTS_A0804B                                                        ;B2F1FC;
    dw $0008*!FPS,ExtendedSpritemaps_PirateNinja_0                       ;B2F1FE;
    dw Instruction_PirateWall_FunctionInY                                ;B2F202;
    dw Function_PirateNinja_SpinJumpleft_Rising                          ;B2F204;

InstList_PirateNinja_SpinJumpLeft_1:
    dw Instruction_PirateNinja_QueueSoundInY_Lib2_Max6,$003F             ;B2F206;
    dw $0001,ExtendedSpritemaps_PirateNinja_12                           ;B2F208;
    dw $0001,ExtendedSpritemaps_PirateNinja_13                           ;B2F20E;
    dw $0001,ExtendedSpritemaps_PirateNinja_14                           ;B2F212;
    dw $0001,ExtendedSpritemaps_PirateNinja_15                           ;B2F216;
    dw $0001,ExtendedSpritemaps_PirateNinja_16                           ;B2F21A;
    dw $0001,ExtendedSpritemaps_PirateNinja_17                           ;B2F21E;
    dw $0001,ExtendedSpritemaps_PirateNinja_18                           ;B2F222;
    dw $0001,ExtendedSpritemaps_PirateNinja_19                           ;B2F226;
    dw Instruction_Common_GotoY                                          ;B2F22A;
    dw InstList_PirateNinja_SpinJumpLeft_1                               ;B2F22C;


;;; $F22E: Instruction list - active - facing left ;;;
InstList_PirateNinja_Active_FacingLeft_0:
    dw Instruction_PirateWall_FunctionInY                                ;B2F22E;
    dw Function_PirateNinja_Active                                       ;B2F230;

InstList_PirateNinja_Active_FacingLeft_1:
    dw $000A*!FPS,ExtendedSpritemaps_PirateNinja_32                      ;B2F232;
    dw $000A*!FPS,ExtendedSpritemaps_PirateNinja_33                      ;B2F236;
    dw $000A*!FPS,ExtendedSpritemaps_PirateNinja_34                      ;B2F23A;
    dw $000A*!FPS,ExtendedSpritemaps_PirateNinja_33                      ;B2F23E;
    dw Instruction_PirateWall_FunctionInY                                ;B2F242;
    dw RTS_A0804B                                                        ;B2F244;
    dw Instruction_PirateNinja_SetFunction0FAC_Active                    ;B2F246;
    dw Instruction_Common_GotoY                                          ;B2F248;
    dw InstList_PirateNinja_Active_FacingLeft_1                          ;B2F24A;


;;; $F270: Instruction list - flinch - facing left ;;;
InstList_PirateNinja_Flinch_FacingLeft:
    dw Instruction_PirateWall_FunctionInY                                ;B2F270;
    dw RTS_A0804B                                                        ;B2F272;
    dw $0010*!FPS,ExtendedSpritemaps_PirateNinja_38                      ;B2F274;
    dw Instruction_Common_GotoY                                          ;B2F278;
    dw InstList_PirateNinja_Active_FacingLeft_0                          ;B2F27A;


;;; $F27C: Instruction list - divekick left - jump ;;;
InstList_PirateNinja_DivekickLeft_Jump_0:
    dw Instruction_PirateWall_FunctionInY                                ;B2F27C;
    dw RTS_B2804B                                                        ;B2F27E;
    dw $0008*!FPS,ExtendedSpritemaps_PirateNinja_42                      ;B2F280;
    dw Instruction_PirateNinja_SetLeftDivekickJumpInitialYSpeed          ;B2F284;
    dw Instruction_PirateWall_FunctionInY                                ;B2F286;
    dw Instruction_PirateNinja_DivekickLeft_Jump                         ;B2F288;

InstList_PirateNinja_DivekickLeft_Jump_1:
    dw Instruction_PirateNinja_PaletteIndexInY,$0200                     ;B2F28A;
    dw $0004,ExtendedSpritemaps_PirateNinja_3A                           ;B2F28C;
    dw Instruction_PirateNinja_PaletteIndexInY,$0E00                     ;B2F292;
    dw $0004,ExtendedSpritemaps_PirateNinja_3A                           ;B2F294;
    dw Instruction_Common_GotoY                                          ;B2F29A;
    dw InstList_PirateNinja_DivekickLeft_Jump_1                          ;B2F29C;
    dw Instruction_Common_Sleep                                          ;B2F29E;


;;; $F2A0: Instruction list - divekick left - divekick ;;;
InstList_PirateNinja_DivekickLeft_Divekick:
    dw Instruction_PirateNinja_PaletteIndexInY,$0E00                     ;B2F2A0;
    dw Instruction_PirateWall_FunctionInY                                ;B2F2A4;
    dw Instruction_PirateNinja_DivekickLeft_Divekick                     ;B2F2A6;
    dw Instruction_PirateNinja_QueueSoundInY_Lib2_Max6,$0066             ;B2F2A8;
    dw $0001,ExtendedSpritemaps_PirateNinja_3B                           ;B2F2AA;
    dw Instruction_Common_Sleep                                          ;B2F2B0;


;;; $F2B2: Instruction list - divekick left - walk to left post ;;;
InstList_PirateNinja_DivekickLeft_WalkToLeftPost_0:
    dw Instruction_PirateWall_FunctionInY                                ;B2F2B2;
    dw Instruction_PirateNinja_DivekickLeft_WalkToLeftPost               ;B2F2B4;

InstList_PirateNinja_DivekickLeft_WalkToLeftPost_1:
    dw $0005*!FPS,ExtendedSpritemaps_PirateNinja_22                      ;B2F2B6;
    dw $0005*!FPS,ExtendedSpritemaps_PirateNinja_23                      ;B2F2BA;
    dw $0005*!FPS,ExtendedSpritemaps_PirateNinja_24                      ;B2F2BE;
    dw $0005*!FPS,ExtendedSpritemaps_PirateNinja_25                      ;B2F2C2;
    dw $0005*!FPS,ExtendedSpritemaps_PirateNinja_26                      ;B2F2C6;
    dw $0005*!FPS,ExtendedSpritemaps_PirateNinja_27                      ;B2F2CA;
    dw $0005*!FPS,ExtendedSpritemaps_PirateNinja_28                      ;B2F2CE;
    dw $0005*!FPS,ExtendedSpritemaps_PirateNinja_29                      ;B2F2D2;
    dw Instruction_Common_GotoY                                          ;B2F2D6;
    dw InstList_PirateNinja_DivekickLeft_WalkToLeftPost_1                ;B2F2D8;


;;; $F2DA: Instruction list - initial - facing left ;;;
InstList_PirateNinja_Initial_FacingLeft_0:
    dw Instruction_PirateWall_FunctionInY                                ;B2F2DA;
    dw Function_PirateNinja_Initial                                      ;B2F2DC;

InstList_PirateNinja_Initial_FacingLeft_1:
    dw $0020*!FPS,ExtendedSpritemaps_PirateNinja_46                      ;B2F2DE;
    dw $000A*!FPS,ExtendedSpritemaps_PirateNinja_47                      ;B2F2E2;
    dw $0020*!FPS,ExtendedSpritemaps_PirateNinja_48                      ;B2F2E6;
    dw $000A*!FPS,ExtendedSpritemaps_PirateNinja_47                      ;B2F2EA;
    dw $0020*!FPS,ExtendedSpritemaps_PirateNinja_46                      ;B2F2EE;
    dw Instruction_Common_GotoY                                          ;B2F2F2;
    dw InstList_PirateNinja_Initial_FacingLeft_1                         ;B2F2F4;
    dw Instruction_Common_Sleep                                          ;B2F2F6;


;;; $F2F8: Instruction list - land - facing left ;;;
InstList_PirateNinja_Land_FacingLeft_0:
    dw Instruction_PirateNinja_PaletteIndexInY,$0200                     ;B2F2F8;
    dw Instruction_PirateWall_FunctionInY                                ;B2F2FC;
    dw RTS_A0804B                                                        ;B2F2FE;
    dw $0004*!FPS,ExtendedSpritemaps_PirateNinja_47                      ;B2F300;
    dw $0008*!FPS,ExtendedSpritemaps_PirateNinja_46                      ;B2F304;
    dw $0004*!FPS,ExtendedSpritemaps_PirateNinja_4C                      ;B2F308;
    dw $0004*!FPS,ExtendedSpritemaps_PirateNinja_4A                      ;B2F30C;
    dw Instruction_PirateWall_FunctionInY                                ;B2F310;
    dw Function_PirateNinja_ReadingToDivekick                            ;B2F312;

InstList_PirateNinja_Land_FacingLeft_1:
    dw $000A*!FPS,ExtendedSpritemaps_PirateNinja_35                      ;B2F314;
    dw $000A*!FPS,ExtendedSpritemaps_PirateNinja_36                      ;B2F318;
    dw $000A*!FPS,ExtendedSpritemaps_PirateNinja_37                      ;B2F31C;
    dw $000A*!FPS,ExtendedSpritemaps_PirateNinja_36                      ;B2F320;
    dw Instruction_Common_GotoY                                          ;B2F324;
    dw InstList_PirateNinja_Land_FacingLeft_1                            ;B2F326;


;;; $F32E: Instruction list - standing kick - facing left ;;;
InstList_PirateNinja_StandingKick_FacingLeft:
    dw Instruction_PirateWall_FunctionInY                                ;B2F32E;
    dw RTS_A0804B                                                        ;B2F330;
    dw $0004,ExtendedSpritemaps_PirateNinja_3E                           ;B2F332;
    dw Instruction_PirateNinja_QueueSoundInY_Lib2_Max6,$0066             ;B2F336;
    dw $0004,ExtendedSpritemaps_PirateNinja_44                           ;B2F338;
    dw $0020*!FPS,ExtendedSpritemaps_PirateNinja_3F                      ;B2F33E;
    dw $0004,ExtendedSpritemaps_PirateNinja_44                           ;B2F342;
    dw Instruction_Common_GotoY                                          ;B2F346;
    dw InstList_PirateNinja_Active_FacingLeft_0                          ;B2F348;


;;; $F34A: Instruction list - projectile claw attack right ;;;
InstList_PirateNinja_ProjectileClawAttack_Right:
    dw Instruction_PirateWall_FunctionInY                                ;B2F34A;
    dw RTS_B2804B                                                        ;B2F34C;
    dw $0005*!FPS,ExtendedSpritemaps_PirateNinja_9                       ;B2F34E;
    dw $0005*!FPS,ExtendedSpritemaps_PirateNinja_A                       ;B2F352;
    dw $0005*!FPS,ExtendedSpritemaps_PirateNinja_B                       ;B2F356;
    dw $0005*!FPS,ExtendedSpritemaps_PirateNinja_C                       ;B2F35A;
    dw $0005*!FPS,ExtendedSpritemaps_PirateNinja_D                       ;B2F35E;
    dw $0002,ExtendedSpritemaps_PirateNinja_E                            ;B2F362;
    dw Instruction_PirateNinja_SpawnClawProjWithThrowDirSpawnOffset      ;B2F366;
    dw $0001,$0020,$FFF8                                                 ;B2F368;
    dw Instruction_PirateNinja_QueueSoundInY_Lib2_Max6,$0066             ;B2F36E;
    dw $0002,ExtendedSpritemaps_PirateNinja_A                            ;B2F370;
    dw $0002,ExtendedSpritemaps_PirateNinja_F                            ;B2F376;
    dw $0002,ExtendedSpritemaps_PirateNinja_11                           ;B2F37A;
    dw $0005*!FPS,ExtendedSpritemaps_PirateNinja_9                       ;B2F37E;
    dw $0005*!FPS,ExtendedSpritemaps_PirateNinja_A                       ;B2F382;
    dw $0005*!FPS,ExtendedSpritemaps_PirateNinja_B                       ;B2F386;
    dw $0005*!FPS,ExtendedSpritemaps_PirateNinja_C                       ;B2F38A;
    dw $0005*!FPS,ExtendedSpritemaps_PirateNinja_D                       ;B2F38E;
    dw $0002,ExtendedSpritemaps_PirateNinja_E                            ;B2F392;
    dw Instruction_PirateNinja_SpawnClawProjWithThrowDirSpawnOffset      ;B2F396;
    dw $0001,$0010,$0008                                                 ;B2F398;
    dw $0002,ExtendedSpritemaps_PirateNinja_A                            ;B2F39E;
    dw Instruction_PirateNinja_QueueSoundInY_Lib2_Max6,$0066             ;B2F3A2;
    dw $0002,ExtendedSpritemaps_PirateNinja_F                            ;B2F3A4;
    dw $0002,ExtendedSpritemaps_PirateNinja_11                           ;B2F3AA;
    dw Instruction_Common_GotoY                                          ;B2F3AE;
    dw InstList_PirateNinja_Active_FacingRight_0                         ;B2F3B0;


;;; $F3B2: Instruction list - spin jump right ;;;
InstList_PirateNinja_SpinJumpRight_0:
    dw Instruction_PirateWall_FunctionInY                                ;B2F3B2;
    dw RTS_B2804B                                                        ;B2F3B4;
    dw $0005*!FPS,ExtendedSpritemaps_PirateNinja_9                       ;B2F3B6;
    dw $0005*!FPS,ExtendedSpritemaps_PirateNinja_A                       ;B2F3BA;
    dw $0005*!FPS,ExtendedSpritemaps_PirateNinja_B                       ;B2F3BE;
    dw $0005*!FPS,ExtendedSpritemaps_PirateNinja_C                       ;B2F3C2;
    dw $0005*!FPS,ExtendedSpritemaps_PirateNinja_D                       ;B2F3C6;
    dw $0002,ExtendedSpritemaps_PirateNinja_E                            ;B2F3CA;
    dw Instruction_PirateNinja_SpawnClawProjWithThrowDirSpawnOffset      ;B2F3CE;
    dw $0001,$0020,$FFF8                                                 ;B2F3D0;
    dw Instruction_PirateNinja_QueueSoundInY_Lib2_Max6,$0066             ;B2F3D6;
    dw $0002,ExtendedSpritemaps_PirateNinja_A                            ;B2F3D8;
    dw $0002,ExtendedSpritemaps_PirateNinja_F                            ;B2F3DE;
    dw $0002,ExtendedSpritemaps_PirateNinja_11                           ;B2F3E2;
    dw Instruction_PirateNinja_ResetSpeed                                ;B2F3E6;
    dw Instruction_PirateWall_FunctionInY                                ;B2F3E8;
    dw RTS_A0804B                                                        ;B2F3EA;
    dw $0008*!FPS,ExtendedSpritemaps_PirateNinja_9                       ;B2F3EC;
    dw Instruction_PirateWall_FunctionInY                                ;B2F3F0;
    dw Function_PirateNinja_SpinJumpRight_Rising                         ;B2F3F2;

InstList_PirateNinja_SpinJumpRight_1:
    dw Instruction_PirateNinja_QueueSoundInY_Lib2_Max6,$003F             ;B2F3F4;
    dw $0001,ExtendedSpritemaps_PirateNinja_1A                           ;B2F3F6;
    dw $0001,ExtendedSpritemaps_PirateNinja_1B                           ;B2F3FC;
    dw $0001,ExtendedSpritemaps_PirateNinja_1C                           ;B2F400;
    dw $0001,ExtendedSpritemaps_PirateNinja_1D                           ;B2F404;
    dw $0001,ExtendedSpritemaps_PirateNinja_1E                           ;B2F408;
    dw $0001,ExtendedSpritemaps_PirateNinja_1F                           ;B2F40C;
    dw $0001,ExtendedSpritemaps_PirateNinja_20                           ;B2F410;
    dw $0001,ExtendedSpritemaps_PirateNinja_21                           ;B2F414;
    dw Instruction_Common_GotoY                                          ;B2F418;
    dw InstList_PirateNinja_SpinJumpRight_1                              ;B2F41A;


;;; $F420: Instruction list - active - facing right ;;;
InstList_PirateNinja_Active_FacingRight_0:
    dw Instruction_PirateWall_FunctionInY                                ;B2F420;
    dw Function_PirateNinja_Active                                       ;B2F422;

InstList_PirateNinja_Active_FacingRight_1:
    dw $000A*!FPS,ExtendedSpritemaps_PirateNinja_35                      ;B2F424;
    dw $000A*!FPS,ExtendedSpritemaps_PirateNinja_36                      ;B2F428;
    dw $000A*!FPS,ExtendedSpritemaps_PirateNinja_37                      ;B2F42C;
    dw $000A*!FPS,ExtendedSpritemaps_PirateNinja_36                      ;B2F430;
    dw Instruction_PirateWall_FunctionInY                                ;B2F434;
    dw RTS_B2804B                                                        ;B2F436;
    dw Instruction_PirateNinja_SetFunction0FAC_Active                    ;B2F438;
    dw Instruction_Common_GotoY                                          ;B2F43A;
    dw InstList_PirateNinja_Active_FacingRight_1                         ;B2F43C;


;;; $F462: Instruction list - flinch - facing right ;;;
InstList_PirateNinja_Flinch_FacingRight:
    dw Instruction_PirateWall_FunctionInY                                ;B2F462;
    dw RTS_B2804B                                                        ;B2F464;
    dw $0010*!FPS,ExtendedSpritemaps_PirateNinja_39                      ;B2F466;
    dw Instruction_Common_GotoY                                          ;B2F46A;
    dw InstList_PirateNinja_Active_FacingRight_0                         ;B2F46C;


;;; $F46E: Instruction list - divekick right - jump ;;;
InstList_PirateNinja_DivekickRight_Jump_0:
    dw Instruction_PirateWall_FunctionInY                                ;B2F46E;
    dw RTS_B2804B                                                        ;B2F470;
    dw $0008*!FPS,ExtendedSpritemaps_PirateNinja_43                      ;B2F472;
    dw Instruction_PirateNinja_SetRightDivekickJumpInitialYSpeed         ;B2F476;
    dw Instruction_PirateWall_FunctionInY                                ;B2F478;
    dw Instruction_PirateNinja_DivekickRight_Jump                        ;B2F47A;

InstList_PirateNinja_DivekickRight_Jump_1:
    dw Instruction_PirateNinja_PaletteIndexInY,$0200                     ;B2F47C;
    dw $0004,ExtendedSpritemaps_PirateNinja_3C                           ;B2F47E;
    dw Instruction_PirateNinja_PaletteIndexInY,$0E00                     ;B2F484;
    dw $0004,ExtendedSpritemaps_PirateNinja_3C                           ;B2F486;
    dw Instruction_Common_GotoY                                          ;B2F48C;
    dw InstList_PirateNinja_DivekickRight_Jump_1                         ;B2F48E;
    dw Instruction_Common_Sleep                                          ;B2F490;


;;; $F492: Instruction list - divekick right - divekick ;;;
InstList_PirateNinja_DivekickRight_Divekick:
    dw Instruction_PirateNinja_PaletteIndexInY,$0E00                     ;B2F492;
    dw Instruction_PirateWall_FunctionInY                                ;B2F496;
    dw Instruction_PirateNinja_DivekickRight_Divekick                    ;B2F498;
    dw Instruction_PirateNinja_QueueSoundInY_Lib2_Max6,$0066             ;B2F49A;
    dw $0001,ExtendedSpritemaps_PirateNinja_3D                           ;B2F49C;
    dw Instruction_Common_Sleep                                          ;B2F4A2;


;;; $F4A4: Instruction list - divekick right - walk to right post ;;;
InstList_PirateNinja_DivekickRight_WalkToRightPost_0:
    dw Instruction_PirateWall_FunctionInY                                ;B2F4A4;
    dw Instruction_PirateNinja_DivekickRight_WalkToRightPost             ;B2F4A6;

InstList_PirateNinja_DivekickRight_WalkToRightPost_1:
    dw $0005*!FPS,ExtendedSpritemaps_PirateNinja_2A                      ;B2F4A8;
    dw $0005*!FPS,ExtendedSpritemaps_PirateNinja_2B                      ;B2F4AC;
    dw $0005*!FPS,ExtendedSpritemaps_PirateNinja_2C                      ;B2F4B0;
    dw $0005*!FPS,ExtendedSpritemaps_PirateNinja_2D                      ;B2F4B4;
    dw $0005*!FPS,ExtendedSpritemaps_PirateNinja_2E                      ;B2F4B8;
    dw $0005*!FPS,ExtendedSpritemaps_PirateNinja_2F                      ;B2F4BC;
    dw $0005*!FPS,ExtendedSpritemaps_PirateNinja_30                      ;B2F4C0;
    dw $0005*!FPS,ExtendedSpritemaps_PirateNinja_31                      ;B2F4C4;
    dw Instruction_Common_GotoY                                          ;B2F4C8;
    dw InstList_PirateNinja_DivekickRight_WalkToRightPost_1              ;B2F4CA;


;;; $F4CC: Instruction list - initial - facing right ;;;
InstList_PirateNinja_Initial_FacingRight_0:
    dw Instruction_PirateWall_FunctionInY                                ;B2F4CC;
    dw Function_PirateNinja_Initial                                      ;B2F4CE;

InstList_PirateNinja_Initial_FacingRight_1:
    dw $0020*!FPS,ExtendedSpritemaps_PirateNinja_49                      ;B2F4D0;
    dw $000A*!FPS,ExtendedSpritemaps_PirateNinja_4A                      ;B2F4D4;
    dw $0020*!FPS,ExtendedSpritemaps_PirateNinja_4B                      ;B2F4D8;
    dw $000A*!FPS,ExtendedSpritemaps_PirateNinja_4A                      ;B2F4DC;
    dw $0020*!FPS,ExtendedSpritemaps_PirateNinja_49                      ;B2F4E0;
    dw Instruction_Common_GotoY                                          ;B2F4E4;
    dw InstList_PirateNinja_Initial_FacingRight_1                        ;B2F4E6;
    dw Instruction_Common_Sleep                                          ;B2F4E8;


;;; $F4EA: Instruction list - land - facing right ;;;
InstList_PirateNinja_Land_FacingRight_0:
    dw Instruction_PirateNinja_PaletteIndexInY,$0200                     ;B2F4EA;
    dw Instruction_PirateWall_FunctionInY                                ;B2F4EE;
    dw RTS_A0804B                                                        ;B2F4F0;
    dw $0004,ExtendedSpritemaps_PirateNinja_4A                           ;B2F4F2;
    dw $0008*!FPS,ExtendedSpritemaps_PirateNinja_49                      ;B2F4F6;
    dw $0004,ExtendedSpritemaps_PirateNinja_4C                           ;B2F4FA;
    dw $0004,ExtendedSpritemaps_PirateNinja_47                           ;B2F4FE;
    dw Instruction_PirateWall_FunctionInY                                ;B2F502;
    dw Function_PirateNinja_ReadingToDivekick                            ;B2F504;

InstList_PirateNinja_Land_FacingRight_1:
    dw $000A*!FPS,ExtendedSpritemaps_PirateNinja_32                      ;B2F506;
    dw $000A*!FPS,ExtendedSpritemaps_PirateNinja_33                      ;B2F50A;
    dw $000A*!FPS,ExtendedSpritemaps_PirateNinja_34                      ;B2F50E;
    dw $000A*!FPS,ExtendedSpritemaps_PirateNinja_33                      ;B2F512;
    dw Instruction_Common_GotoY                                          ;B2F516;
    dw InstList_PirateNinja_Land_FacingRight_1                           ;B2F518;


;;; $F51A: Instruction list - standing kick - facing right ;;;
InstList_PirateNinja_StandingKick_FacingRight:
    dw Instruction_PirateWall_FunctionInY                                ;B2F51A;
    dw RTS_A0804B                                                        ;B2F51C;
    dw $0004,ExtendedSpritemaps_PirateNinja_40                           ;B2F51E;
    dw Instruction_PirateNinja_QueueSoundInY_Lib2_Max6,$0066             ;B2F522;
    dw $0004,ExtendedSpritemaps_PirateNinja_45                           ;B2F524;
    dw $0020*!FPS,ExtendedSpritemaps_PirateNinja_41                      ;B2F52A;
    dw $0004,ExtendedSpritemaps_PirateNinja_45                           ;B2F52E;
    dw Instruction_Common_GotoY                                          ;B2F532;
    dw InstList_PirateNinja_Active_FacingRight_0                         ;B2F534;


;;; $F536: Instruction - enemy palette index = [[Y]] ;;;
Instruction_PirateNinja_PaletteIndexInY:
    PHX                                                                  ;B2F536;
    PHY                                                                  ;B2F537;
    LDX.B EnemyIndex                                                     ;B2F538;
    LDA.W $0000,Y                                                        ;B2F53B;
    STA.W Enemy.palette,X                                                ;B2F53E;
    PLY                                                                  ;B2F541;
    PLX                                                                  ;B2F542;
    INY                                                                  ;B2F543;
    INY                                                                  ;B2F544;
    RTL                                                                  ;B2F545;


;;; $F546: Instruction - queue sound [[Y]], sound library 2, max queued sounds allowed = 6 ;;;
Instruction_PirateNinja_QueueSoundInY_Lib2_Max6:
    PHX                                                                  ;B2F546;
    PHY                                                                  ;B2F547;
    LDA.W $0000,Y                                                        ;B2F548;
    JSL.L QueueSound_Lib2_Max6                                           ;B2F54B;
    PLY                                                                  ;B2F54F;
    PLX                                                                  ;B2F550;
    INY                                                                  ;B2F551;
    INY                                                                  ;B2F552;
    RTL                                                                  ;B2F553;


;;; $F564: Instruction - spawn space pirate claw enemy projectile with throw direction [[Y]] and spawn offset ([[Y] + 2], [[Y] + 4]) ;;;
Instruction_PirateNinja_SpawnClawProjWithThrowDirSpawnOffset:
    PHY                                                                  ;B2F565;
    LDX.B EnemyIndex                                                     ;B2F566;
    LDA.W $0002,Y                                                        ;B2F569;
    STA.B DP_Temp16                                                      ;B2F56C;
    LDA.W $0004,Y                                                        ;B2F56E;
    STA.B DP_Temp18                                                      ;B2F571;
    LDA.W Enemy.XPosition,X                                              ;B2F573;
    STA.B DP_Temp12                                                      ;B2F576;
    LDA.W Enemy.YPosition,X                                              ;B2F578;
    STA.B DP_Temp14                                                      ;B2F57B;
    LDA.W $0000,Y                                                        ;B2F57D;
    LDY.W #EnemyProjectile_PirateClaw                                    ;B2F580;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;B2F583;
    LDX.B EnemyIndex
    PLA
    CLC
    ADC.W #$0006
    TAY
    RTL                                                                  ;B2F58F;


;;; $F590: Instruction - set Enemy.var2 - active ;;;
Instruction_PirateNinja_SetFunction0FAC_Active:
    PHX                                                                  ;B2F590;
    LDX.B EnemyIndex                                                     ;B2F591;
    LDA.W Enemy.XPosition,X                                              ;B2F594;
    SEC                                                                  ;B2F597;
    SBC.B SamusXPosition                                                 ;B2F598;
    STA.B DP_Temp12                                                      ;B2F59B;
    LDA.W #$0001                                                         ;B2F59D;
    STA.W Enemy.instTimer,X                                              ;B2F5A0;
    LDY.W #InstList_PirateNinja_Active_FacingLeft_0                      ;B2F5A3;
    LDA.B DP_Temp12                                                      ;B2F5A6;
    BPL .keepLeft                                                        ;B2F5A8;
    LDY.W #InstList_PirateNinja_Active_FacingRight_0                     ;B2F5AA;

  .keepLeft:
    TYA                                                                  ;B2F5AD;
    STA.W Enemy.var2,X                                                   ;B2F5AE;
    PLX                                                                  ;B2F5B1;
    RTL                                                                  ;B2F5B2;


;;; $F5D6: Instruction - enemy speed = 0 ;;;
Instruction_PirateNinja_ResetSpeed:
    LDA.W #$0000                                                         ;B2F5D6;
    STA.L PirateNinja.speed,X                                            ;B2F5D9;
    RTL                                                                  ;B2F5DD;


;;; $F5DE: Initialisation AI - enemy $F4D3/$F513/$F553/$F593/$F5D3/$F613 (ninja space pirates) ;;;
InitAI_PirateNinja:
    LDX.B EnemyIndex                                                     ;B2F5DE;
    LDY.W #InstList_PirateNinja_Initial_FacingLeft_0                     ;B2F5E1;
    LDA.W Enemy.init0,X                                                  ;B2F5E4;
    BIT.W #$0001                                                         ;B2F5E7;
    BEQ .zeroParam1                                                      ;B2F5EA;
    LDY.W #InstList_PirateNinja_Initial_FacingRight_0                    ;B2F5EC;

  .zeroParam1:
    TYA                                                                  ;B2F5EF;
    STA.W Enemy.instList,X                                               ;B2F5F0;
    STA.W Enemy.var2,X                                                   ;B2F5F3;
    LDA.W Enemy.init0,X                                                  ;B2F5F6;
    BIT.W #$0001                                                         ;B2F5F9;
    BEQ .zeroParam1again                                                 ;B2F5FC;
    LDA.W Enemy.XPosition,X                                              ;B2F5FE;
    STA.W PirateNinja.leftPostXPosition,X                                ;B2F601;
    CLC                                                                  ;B2F604;
    ADC.W Enemy.init1,X                                                  ;B2F605;
    STA.W PirateNinja.rightPostXPosition,X                               ;B2F608;
    BRA +                                                                ;B2F60B;

  .zeroParam1again:
    LDA.W Enemy.XPosition,X                                              ;B2F60D;
    STA.W PirateNinja.rightPostXPosition,X                               ;B2F610;
    SEC                                                                  ;B2F613;
    SBC.W Enemy.init1,X                                                  ;B2F614;
    STA.W PirateNinja.leftPostXPosition,X                                ;B2F617;

+   LDA.W PirateNinja.rightPostXPosition,X                               ;B2F61A;
    SEC                                                                  ;B2F61D;
    SBC.W PirateNinja.leftPostXPosition,X                                ;B2F61E;
    LSR                                                                  ;B2F621;
    STA.B DP_Temp14                                                      ;B2F622;
    CLC                                                                  ;B2F624;
    ADC.W PirateNinja.leftPostXPosition,X                                ;B2F625;
    STA.W PirateNinja.postsMidpointXPosition,X                           ;B2F628;
    STZ.B DP_Temp12                                                      ;B2F62E;
    STZ.B DP_Temp16                                                      ;B2F630;
    LDA.B DP_Temp14                                                      ;B2F632;
    AND.W #$00FF                                                         ;B2F634;
    XBA                                                                  ;B2F637;
    STA.B DP_Temp14                                                      ;B2F638;

  .loop:
    LDA.W #$0020*!SPF                                                    ;B2F63A;
    CLC                                                                  ;B2F63D;
    ADC.B DP_Temp12                                                      ;B2F63E;
    STA.B DP_Temp12                                                      ;B2F640;
    CLC                                                                  ;B2F642;
    ADC.B DP_Temp16                                                      ;B2F643;
    STA.B DP_Temp16                                                      ;B2F645;
    CMP.B DP_Temp14                                                      ;B2F647;
    BMI .loop                                                            ;B2F649;
    LDA.B DP_Temp12                                                      ;B2F64B;
    STA.W Enemy.var1,X                                                   ;B2F64D;
    LDA.B DP_Temp16                                                      ;B2F650;
    AND.W #$FF00                                                         ;B2F652;
    XBA                                                                  ;B2F655;
    STA.B DP_Temp18                                                      ;B2F656;
    CLC                                                                  ;B2F658;
    ADC.W PirateNinja.postsMidpointXPosition,X                           ;B2F659;
    STA.W PirateNinja.rightPostXPosition,X                               ;B2F65C;
    LDA.W PirateNinja.postsMidpointXPosition,X                           ;B2F65F;
    SEC                                                                  ;B2F662;
    SBC.B DP_Temp18                                                      ;B2F663;
    STA.W PirateNinja.leftPostXPosition,X                                ;B2F665;
    LDY.W PirateNinja.leftPostXPosition,X                                ;B2F668;
    LDA.W Enemy.init0,X                                                  ;B2F66B;
    BIT.W #$0001                                                         ;B2F66E;
    BNE .zeroParam1again2                                                ;B2F671;
    LDY.W PirateNinja.rightPostXPosition,X                               ;B2F673;

  .zeroParam1again2:
    TYA                                                                  ;B2F676;
    STA.W Enemy.XPosition,X                                              ;B2F677;
    LDA.W #RTS_B2804B                                                    ;B2F67A;
    STA.W PirateNinja.function,X                                         ;B2F67D;
    LDA.W Enemy.YPosition,X                                              ;B2F680;
    STA.L PirateNinja.spawnYPosition,X                                   ;B2F683;
    LDY.W #$0000                                                         ;B2F687;
    LDX.W #$0000                                                         ;B2F68A;
    LDA.W #$000F                                                         ;B2F68D;
    STA.B DP_Temp12                                                      ;B2F690;

  .loopPalette:
    LDA.W Palette_Pirate_Gold_NonNinja,Y                                 ;B2F692;
    STA.L TargetPalettes_SpriteP7,X                                      ;B2F695;
    INY                                                                  ;B2F699;
    INY                                                                  ;B2F69A;
    INX                                                                  ;B2F69B;
    INX                                                                  ;B2F69C;
    DEC.B DP_Temp12                                                      ;B2F69D;
    BPL .loopPalette                                                     ;B2F69F;
    RTL                                                                  ;B2F6A1;


;;; $F6A2: Main AI - enemy $F4D3/$F513/$F553/$F593/$F5D3/$F613 (ninja space pirates) ;;;
MainAI_PirateNinja:
    LDX.B EnemyIndex                                                     ;B2F6A2;
    JSR.W (PirateNinja.function,X)                                       ;B2F6A5;
    RTL                                                                  ;B2F6A8;


;;; $F6A9: Ninja space pirate function - initial ;;;
Function_PirateNinja_Initial:
    LDX.B EnemyIndex                                                     ;B2F6A9;
    LDA.W Enemy.XPosition,X                                              ;B2F6AC;
    SEC                                                                  ;B2F6AF;
    SBC.B SamusXPosition                                                 ;B2F6B0;
    BPL +                                                                ;B2F6B3;
    EOR.W #$FFFF                                                         ;B2F6B5;
    INC                                                                  ;B2F6B8;

+   SEC                                                                  ;B2F6B9;
    SBC.W #$0080                                                         ;B2F6BA;
    BPL .tooFar                                                          ;B2F6BD;
    LDA.W Enemy.XPosition,X                                              ;B2F6BF;
    SEC                                                                  ;B2F6C2;
    SBC.B SamusXPosition                                                 ;B2F6C3;
    STA.B DP_Temp12                                                      ;B2F6C6;
    LDY.W #InstList_PirateNinja_Active_FacingLeft_0                      ;B2F6C8;
    LDA.B DP_Temp12                                                      ;B2F6CB;
    BPL .keepLeft                                                        ;B2F6CD;
    LDY.W #InstList_PirateNinja_Active_FacingRight_0                     ;B2F6CF;

  .keepLeft:
    TYA                                                                  ;B2F6D2;
    STA.W Enemy.instList,X                                               ;B2F6D3;
    STA.W Enemy.var2,X                                                   ;B2F6D6;
    LDA.W #$0001                                                         ;B2F6D9;
    STA.W Enemy.instTimer,X                                              ;B2F6DC;
    RTS                                                                  ;B2F6DF;

  .tooFar:
    JSR.W PirateNinja_FlinchTrigger                                      ;B2F6E0;
    RTS                                                                  ;B2F6E3;


;;; $F6E4: Ninja space pirate function - active ;;;
Function_PirateNinja_Active:
    JSR.W PirateNinja_FlinchTrigger                                      ;B2F6E4;
    BNE .return                                                          ;B2F6E7;
    JSR.W PirateNinja_StandingKickTrigger                                ;B2F6E9;
    BNE .return                                                          ;B2F6EC;
    JSR.W PirateNinja_SpinJumpTrigger                                    ;B2F6EE;
    BNE .return                                                          ;B2F6F1;
    JSR.W PirateNinja_ProjectileClawAttackTrigger                        ;B2F6F3;

  .return:
    RTS                                                                  ;B2F6F6;


;;; $F6F7: Ninja space pirate projectile claw attack trigger ;;;
PirateNinja_ProjectileClawAttackTrigger:
    LDA.W Enemy.frameCounter,X                                           ;B2F6F7;
    AND.W #$003F                                                         ;B2F6FA;
    BNE .return                                                          ;B2F6FD;
    LDA.W Enemy.XPosition,X                                              ;B2F6FF;
    CMP.W PirateNinja.leftPostXPosition,X                                ;B2F702;
    BEQ .reachedLeftPost                                                 ;B2F705;
    LDA.W Enemy.XPosition,X                                              ;B2F707;
    SEC                                                                  ;B2F70A;
    SBC.B SamusXPosition                                                 ;B2F70B;
    BPL .return                                                          ;B2F70E;
    LDA.W #InstList_PirateNinja_ProjectileClawAttack_Right               ;B2F710;
    STA.W Enemy.instList,X                                               ;B2F713;
    BRA .set1Timer                                                       ;B2F716;

  .reachedLeftPost:
    LDA.W Enemy.XPosition,X                                              ;B2F718;
    SEC                                                                  ;B2F71B;
    SBC.B SamusXPosition                                                 ;B2F71C;
    BMI .return                                                          ;B2F71F;
    LDA.W #InstList_PirateNinja_ProjectileClawAttack_Left                ;B2F721;
    STA.W Enemy.instList,X                                               ;B2F724;

  .set1Timer:
    LDA.W #$0001                                                         ;B2F727;
    STA.W Enemy.instTimer,X                                              ;B2F72A;

  .return:
    RTS                                                                  ;B2F72D;


;;; $F72E: Ninja space pirate flinch trigger ;;;
PirateNinja_FlinchTrigger:
;; Returns:
;;     A: 1 if flinch triggered, 0 otherwise
    PHX                                                                  ;B2F72E;
    LDX.B EnemyIndex                                                     ;B2F72F;
    LDY.W #$0008                                                         ;B2F732;

  .loop:
    LDA.W SamusProjectile_Types,Y                                        ;B2F735;
    BNE .checkProjectile                                                 ;B2F738;
    DEY                                                                  ;B2F73A;
    DEY                                                                  ;B2F73B;
    BPL .loop                                                            ;B2F73C;
    BRA .returnNoFlinch                                                  ;B2F73E;

  .checkProjectile:
    LDA.W SamusProjectile_XPositions,Y                                   ;B2F740;
    SEC                                                                  ;B2F743;
    SBC.W Enemy.XPosition,X                                              ;B2F744;
    BPL +                                                                ;B2F747;
    EOR.W #$FFFF                                                         ;B2F749;
    INC                                                                  ;B2F74C;

+   SEC                                                                  ;B2F74D;
    SBC.W #$0020                                                         ;B2F74E;
    BPL .returnNoFlinch                                                  ;B2F751;
    LDA.W SamusProjectile_YPositions,Y                                   ;B2F753;
    SEC                                                                  ;B2F756;
    SBC.W Enemy.YPosition,X                                              ;B2F757;
    BPL +                                                                ;B2F75A;
    EOR.W #$FFFF                                                         ;B2F75C;
    INC                                                                  ;B2F75F;

+   SEC                                                                  ;B2F760;
    SBC.W #$0020                                                         ;B2F761;
    BPL .returnNoFlinch                                                  ;B2F764;
    LDA.W Enemy.XPosition,X                                              ;B2F766;
    SEC                                                                  ;B2F769;
    SBC.B SamusXPosition                                                 ;B2F76A;
    STA.B DP_Temp12                                                      ;B2F76D;
    LDY.W #InstList_PirateNinja_Flinch_FacingLeft                        ;B2F76F;
    LDA.B DP_Temp12                                                      ;B2F772;
    BPL .keepLeft                                                        ;B2F774;
    LDY.W #InstList_PirateNinja_Flinch_FacingRight                       ;B2F776;

  .keepLeft:
    TYA                                                                  ;B2F779;
    STA.W Enemy.instList,X                                               ;B2F77A;
    LDA.W #$0001                                                         ;B2F77D;
    STA.W Enemy.instTimer,X                                              ;B2F780;
    PLX                                                                  ;B2F783;
    LDA.W #$0001                                                         ;B2F784;
    RTS                                                                  ;B2F787;

  .returnNoFlinch:
    PLX                                                                  ;B2F788;
    LDA.W #$0000                                                         ;B2F789;
    RTS                                                                  ;B2F78C;


;;; $F78D: Ninja space pirate spin jump trigger ;;;
PirateNinja_SpinJumpTrigger:
;; Returns:
;;     A: 1 if spin jump triggered, 0 otherwise
    PHX                                                                  ;B2F78D;
    LDX.B EnemyIndex                                                     ;B2F78E;
    LDA.W PirateNinja.postsMidpointXPosition,X                           ;B2F791;
    SEC                                                                  ;B2F794;
    SBC.B SamusXPosition                                                 ;B2F795;
    BPL +                                                                ;B2F798;
    EOR.W #$FFFF                                                         ;B2F79A;
    INC                                                                  ;B2F79D;

+   SEC                                                                  ;B2F79E;
    SBC.W #$0020                                                         ;B2F79F;
    BPL .returnNoSpinJump                                                ;B2F7A2;
    LDY.W #InstList_PirateNinja_SpinJumpLeft_0                           ;B2F7A4;
    LDA.W Enemy.XPosition,X                                              ;B2F7A7;
    CMP.W PirateNinja.leftPostXPosition,X                                ;B2F7AA;
    BNE .keepLeft                                                        ;B2F7AD;
    LDY.W #InstList_PirateNinja_SpinJumpRight_0                          ;B2F7AF;

  .keepLeft:
    TYA                                                                  ;B2F7B2;
    STA.W Enemy.instList,X                                               ;B2F7B3;
    LDA.W #$0001                                                         ;B2F7B6;
    STA.W Enemy.instTimer,X                                              ;B2F7B9;
    PLX                                                                  ;B2F7BC;
    LDA.W #$0001                                                         ;B2F7BD;
    RTS                                                                  ;B2F7C0;

  .returnNoSpinJump:
    PLX                                                                  ;B2F7C1;
    LDA.W #$0000                                                         ;B2F7C2;
    RTS                                                                  ;B2F7C5;


;;; $F7C6: Ninja space pirate standing kick trigger ;;;
PirateNinja_StandingKickTrigger:
;; Returns:
;;     A: 1 if kick triggered, 0 otherwise
    PHX                                                                  ;B2F7C6;
    LDX.B EnemyIndex                                                     ;B2F7C7;
    LDA.B SamusXPosition                                                 ;B2F7CA;
    SEC                                                                  ;B2F7CD;
    SBC.W Enemy.XPosition,X                                              ;B2F7CE;
    BPL +                                                                ;B2F7D1;
    EOR.W #$FFFF                                                         ;B2F7D3;
    INC                                                                  ;B2F7D6;

+   SEC                                                                  ;B2F7D7;
    SBC.W #$0028                                                         ;B2F7D8;
    BPL .returnNoStandingKick                                            ;B2F7DB;
    LDA.B SamusYPosition                                                 ;B2F7DD;
    SEC                                                                  ;B2F7E0;
    SBC.W Enemy.YPosition,X                                              ;B2F7E1;
    BPL +                                                                ;B2F7E4;
    EOR.W #$FFFF                                                         ;B2F7E6;
    INC                                                                  ;B2F7E9;

+   SEC                                                                  ;B2F7EA;
    SBC.W #$0028                                                         ;B2F7EB;
    BPL .returnNoStandingKick                                            ;B2F7EE;
    LDA.W Enemy.XPosition,X                                              ;B2F7F0;
    SEC                                                                  ;B2F7F3;
    SBC.B SamusXPosition                                                 ;B2F7F4;
    STA.B DP_Temp12                                                      ;B2F7F7;
    LDY.W #InstList_PirateNinja_StandingKick_FacingLeft                  ;B2F7F9;
    LDA.B DP_Temp12                                                      ;B2F7FC;
    BPL .kepLeft                                                         ;B2F7FE;
    LDY.W #InstList_PirateNinja_StandingKick_FacingRight                 ;B2F800;

  .kepLeft:
    TYA                                                                  ;B2F803;
    STA.W Enemy.instList,X                                               ;B2F804;
    LDA.W #$0001                                                         ;B2F807;
    STA.W Enemy.instTimer,X                                              ;B2F80A;
    PLX                                                                  ;B2F80D;
    LDA.W #$0001                                                         ;B2F80E;
    RTS                                                                  ;B2F811;

  .returnNoStandingKick:
    PLX                                                                  ;B2F812;
    LDA.W #$0000                                                         ;B2F813;
    RTS                                                                  ;B2F816;


;;; $F817: Ninja space pirate function - spin jump left - rising ;;;
Function_PirateNinja_SpinJumpleft_Rising:
    LDA.L PirateNinja.speed,X                                            ;B2F817;
    AND.W #$FF00                                                         ;B2F81B;
    XBA                                                                  ;B2F81E;
    STA.B DP_Temp12                                                      ;B2F81F;
    LDA.W Enemy.XPosition,X                                              ;B2F821;
    SEC                                                                  ;B2F824;
    SBC.B DP_Temp12                                                      ;B2F825;
    STA.W Enemy.XPosition,X                                              ;B2F827;
    DEC.W Enemy.YPosition,X                                              ;B2F82A;
    DEC.W Enemy.YPosition,X                                              ;B2F82D;
    LDA.L PirateNinja.speed,X                                            ;B2F830;
    CLC                                                                  ;B2F834;
    ADC.W #$0020*!SPF                                                    ;B2F835;
    STA.L PirateNinja.speed,X                                            ;B2F838;
    LDA.W Enemy.XPosition,X                                              ;B2F83C;
    CMP.W PirateNinja.postsMidpointXPosition,X                           ;B2F83F;
    BMI .falling                                                         ;B2F842;
    RTS                                                                  ;B2F844;

  .falling:
    LDA.W #Function_PirateNinja_SpinJumpLeft_Falling                     ;B2F845;
    STA.W PirateNinja.function,X                                         ;B2F848;
    RTS                                                                  ;B2F84B;


;;; $F84C: Ninja space pirate function - spin jump left - falling ;;;
Function_PirateNinja_SpinJumpLeft_Falling:
    LDA.L PirateNinja.speed,X                                            ;B2F84C;
    AND.W #$FF00                                                         ;B2F850;
    XBA                                                                  ;B2F853;
    STA.B DP_Temp12                                                      ;B2F854;
    LDA.W Enemy.XPosition,X                                              ;B2F856;
    SEC                                                                  ;B2F859;
    SBC.B DP_Temp12                                                      ;B2F85A;
    STA.W Enemy.XPosition,X                                              ;B2F85C;
    INC.W Enemy.YPosition,X                                              ;B2F85F;
    INC.W Enemy.YPosition,X                                              ;B2F862;
    LDA.L PirateNinja.speed,X                                            ;B2F865;
    SEC                                                                  ;B2F869;
    SBC.W #$0020*!SPF                                                    ;B2F86A;
    STA.L PirateNinja.speed,X                                            ;B2F86D;
    BEQ .landing                                                         ;B2F871;
    RTS                                                                  ;B2F873;

  .landing:
    LDA.W #RTS_B2804B                                                    ;B2F874;
    STA.W PirateNinja.function,X                                         ;B2F877;
    LDA.W #InstList_PirateNinja_Land_FacingLeft_0                        ;B2F87A;
    STA.W Enemy.instList,X                                               ;B2F87D;
    LDA.W #$0001                                                         ;B2F880;
    STA.W Enemy.instTimer,X                                              ;B2F883;
    LDA.W PirateNinja.leftPostXPosition,X                                ;B2F886;
    STA.W Enemy.XPosition,X                                              ;B2F889;
    JSR.W PirateNinja_SpawnLandingDustCloud                              ;B2F88C;
    RTS                                                                  ;B2F88F;


;;; $F890: Ninja space pirate function - spin jump right - rising ;;;
Function_PirateNinja_SpinJumpRight_Rising:
    LDA.L PirateNinja.speed,X                                            ;B2F890;
    AND.W #$FF00                                                         ;B2F894;
    XBA                                                                  ;B2F897;
    STA.B DP_Temp12                                                      ;B2F898;
    LDA.W Enemy.XPosition,X                                              ;B2F89A;
    CLC                                                                  ;B2F89D;
    ADC.B DP_Temp12                                                      ;B2F89E;
    STA.W Enemy.XPosition,X                                              ;B2F8A0;
    DEC.W Enemy.YPosition,X                                              ;B2F8A3;
    DEC.W Enemy.YPosition,X                                              ;B2F8A6;
    LDA.L PirateNinja.speed,X                                            ;B2F8A9;
    CLC                                                                  ;B2F8AD;
    ADC.W #$0020*!SPF                                                    ;B2F8AE;
    STA.L PirateNinja.speed,X                                            ;B2F8B1;
    LDA.W Enemy.XPosition,X                                              ;B2F8B5;
    CMP.W PirateNinja.postsMidpointXPosition,X                           ;B2F8B8;
    BPL .falling                                                         ;B2F8BB;
    RTS                                                                  ;B2F8BD;

  .falling:
    LDA.W #Function_PirateNinja_SpinJumpRight_Falling                    ;B2F8BE;
    STA.W PirateNinja.function,X                                         ;B2F8C1;
    RTS                                                                  ;B2F8C4;


;;; $F8C5: Ninja space pirate function - spin jump right - falling ;;;
Function_PirateNinja_SpinJumpRight_Falling:
    LDA.L PirateNinja.speed,X                                            ;B2F8C5;
    AND.W #$FF00                                                         ;B2F8C9;
    XBA                                                                  ;B2F8CC;
    STA.B DP_Temp12                                                      ;B2F8CD;
    LDA.W Enemy.XPosition,X                                              ;B2F8CF;
    CLC                                                                  ;B2F8D2;
    ADC.B DP_Temp12                                                      ;B2F8D3;
    STA.W Enemy.XPosition,X                                              ;B2F8D5;
    INC.W Enemy.YPosition,X                                              ;B2F8D8;
    INC.W Enemy.YPosition,X                                              ;B2F8DB;
    LDA.L PirateNinja.speed,X                                            ;B2F8DE;
    SEC                                                                  ;B2F8E2;
    SBC.W #$0020*!SPF                                                    ;B2F8E3;
    STA.L PirateNinja.speed,X                                            ;B2F8E6;
    BEQ .landing                                                         ;B2F8EA;
    RTS                                                                  ;B2F8EC;

  .landing:
    LDA.W #RTS_B2804B                                                    ;B2F8ED;
    STA.W PirateNinja.function,X                                         ;B2F8F0;
    LDA.W #InstList_PirateNinja_Land_FacingRight_0                       ;B2F8F3;
    STA.W Enemy.instList,X                                               ;B2F8F6;
    LDA.W #$0001                                                         ;B2F8F9;
    STA.W Enemy.instTimer,X                                              ;B2F8FC;
    LDA.W PirateNinja.rightPostXPosition,X                               ;B2F8FF;
    STA.W Enemy.XPosition,X                                              ;B2F902;
    JSR.W PirateNinja_SpawnLandingDustCloud                              ;B2F905;
    RTS                                                                  ;B2F908;


;;; $F909: Ninja space pirate function - ready to divekick ;;;
Function_PirateNinja_ReadingToDivekick:
    JSR.W PirateNinja_FlinchTrigger                                      ;B2F909;
    BNE .return                                                          ;B2F90C;
    JSR.W PirateNinja_StandingKickTrigger                                ;B2F90E;
    BNE .return                                                          ;B2F911;
    JSR.W PirateNinja_DivekickTrigger                                    ;B2F913;

  .return:
    RTS                                                                  ;B2F916;


;;; $F917: Ninja space pirate divekick trigger ;;;
PirateNinja_DivekickTrigger:
    LDX.B EnemyIndex                                                     ;B2F917;
    LDA.W PirateNinja.postsMidpointXPosition,X                           ;B2F91A;
    SEC                                                                  ;B2F91D;
    SBC.B SamusXPosition                                                 ;B2F91E;
    BPL +                                                                ;B2F921;
    EOR.W #$FFFF                                                         ;B2F923;
    INC                                                                  ;B2F926;

+   SEC                                                                  ;B2F927;
    SBC.W #$0020                                                         ;B2F928;
    BPL .return                                                          ;B2F92B;

  .loopRNG:
    JSL.L GenerateRandomNumber                                           ;B2F92D;
    AND.W #$0003                                                         ;B2F931;
    BEQ .loopRNG                                                         ;B2F934;
    STA.B DP_Temp12                                                      ;B2F936;
    LDY.W #$0000                                                         ;B2F938;
    LDA.W Enemy.XPosition,X                                              ;B2F93B;
    CMP.W PirateNinja.leftPostXPosition,X                                ;B2F93E;
    BNE .keepLeft                                                        ;B2F941;
    LDY.W #$0004                                                         ;B2F943;

  .keepLeft:
    TYA                                                                  ;B2F946;
    CLC                                                                  ;B2F947;
    ADC.B DP_Temp12                                                      ;B2F948;
    ASL                                                                  ;B2F94A;
    TAY                                                                  ;B2F94B;
    LDA.W .leftPointers,Y                                                ;B2F94C;
    STA.W Enemy.instList,X                                               ;B2F94F;
    LDA.W #$0001                                                         ;B2F952;
    STA.W Enemy.instTimer,X                                              ;B2F955;

  .return:
    RTS                                                                  ;B2F958;

  .leftPointers:
    dw $0000                                                             ;B2F959;
    dw InstList_PirateNinja_DivekickLeft_Jump_0                          ;B2F95B;
    dw InstList_PirateNinja_DivekickLeft_Jump_0                          ;B2F95D;
    dw InstList_PirateNinja_DivekickLeft_Jump_0                          ;B2F95F;

  .rightPointers:
    dw $0000                                                             ;B2F961;
    dw InstList_PirateNinja_DivekickRight_Jump_0                         ;B2F963;
    dw InstList_PirateNinja_DivekickRight_Jump_0                         ;B2F965;
    dw InstList_PirateNinja_DivekickRight_Jump_0                         ;B2F967;


;;; $F969: Instruction - set left divekick jump initial Y speed ;;;
Instruction_PirateNinja_SetLeftDivekickJumpInitialYSpeed:
    PHX                                                                  ;B2F969;
    PHY                                                                  ;B2F96A;
    LDA.W #$0600                                                         ;B2F96B;
    STA.L PirateNinja.speed,X                                            ;B2F96E;
    LDA.W PirateNinja.rightPostXPosition,X                               ;B2F972;
    SEC                                                                  ;B2F975;
    SBC.W PirateNinja.postsMidpointXPosition,X                           ;B2F976;
    LSR                                                                  ;B2F979;
    CLC                                                                  ;B2F97A;
    ADC.W PirateNinja.postsMidpointXPosition,X                           ;B2F97B;
    STA.L PirateNinja.neverRead7806,X                                    ;B2F97E;
    PLY                                                                  ;B2F982;
    PLX                                                                  ;B2F983;
    RTL                                                                  ;B2F984;


;;; $F985: Ninja space pirate function - divekick left - jump ;;;
Instruction_PirateNinja_DivekickLeft_Jump:
    LDA.L PirateNinja.speed,X                                            ;B2F985;
    AND.W #$FF00                                                         ;B2F989;
    XBA                                                                  ;B2F98C;
    STA.B DP_Temp12                                                      ;B2F98D;
    LDA.W Enemy.YPosition,X                                              ;B2F98F;
    SEC                                                                  ;B2F992;
    SBC.B DP_Temp12                                                      ;B2F993;
    STA.W Enemy.YPosition,X                                              ;B2F995;
    LDA.L PirateNinja.speed,X                                            ;B2F998;
    SEC                                                                  ;B2F99C;
    SBC.W #$0040*!SPF                                                    ;B2F99D;
    STA.L PirateNinja.speed,X                                            ;B2F9A0;
    BMI .negativeSpeed                                                   ;B2F9A4;
    RTS                                                                  ;B2F9A6;

  .negativeSpeed:
    LDA.W #Instruction_PirateNinja_DivekickLeft_Divekick                 ;B2F9A7;
    STA.W PirateNinja.function,X                                         ;B2F9AA;
    LDA.W #InstList_PirateNinja_DivekickLeft_Divekick                    ;B2F9AD;
    STA.W Enemy.instList,X                                               ;B2F9B0;
    LDA.W #$0001                                                         ;B2F9B3;
    STA.W Enemy.instTimer,X                                              ;B2F9B6;
    LDA.W #$0600                                                         ;B2F9B9;
    STA.L PirateNinja.speed,X                                            ;B2F9BC;
    RTS                                                                  ;B2F9C0;


;;; $F9C1: Ninja space pirate function - divekick left - divekick ;;;
Instruction_PirateNinja_DivekickLeft_Divekick:
    LDA.W Enemy.XPosition,X                                              ;B2F9C1;
    SEC                                                                  ;B2F9C4;
    SBC.W #$0005                                                         ;B2F9C5;
    STA.W Enemy.XPosition,X                                              ;B2F9C8;
    LDA.L PirateNinja.speed,X                                            ;B2F9CB;
    AND.W #$FF00                                                         ;B2F9CF;
    XBA                                                                  ;B2F9D2;
    STA.B DP_Temp14                                                      ;B2F9D3;
    LDA.L PirateNinja.speed,X                                            ;B2F9D5;
    AND.W #$00FF                                                         ;B2F9D9;
    STA.B DP_Temp12                                                      ;B2F9DC;
    JSL.L MoveEnemyDownBy_14_12                                          ;B2F9DE;
    BCS .collision                                                       ;B2F9E2;
    LDA.L PirateNinja.speed,X                                            ;B2F9E4;
    SEC                                                                  ;B2F9E8;
    SBC.W #$0040*!SPF                                                    ;B2F9E9;
    STA.L PirateNinja.speed,X                                            ;B2F9EC;
    BMI .collision                                                       ;B2F9F0;
    BIT.W #$FF00                                                         ;B2F9F2;
    BEQ .collision                                                       ;B2F9F5;
    RTS                                                                  ;B2F9F7;

  .collision:
    LDA.W #Instruction_PirateNinja_DivekickLeft_WalkToLeftPost           ;B2F9F8;
    STA.W PirateNinja.function,X                                         ;B2F9FB;
    LDA.W #InstList_PirateNinja_DivekickLeft_WalkToLeftPost_0            ;B2F9FE;
    STA.W Enemy.instList,X                                               ;B2FA01;
    LDA.W #$0001                                                         ;B2FA04;
    STA.W Enemy.instTimer,X                                              ;B2FA07;
    LDA.L PirateNinja.spawnYPosition,X                                   ;B2FA0A;
    STA.W Enemy.YPosition,X                                              ;B2FA0E;
    JSR.W PirateNinja_SpawnLandingDustCloud                              ;B2FA11;
    RTS                                                                  ;B2FA14;


;;; $FA15: Ninja space pirate function - divekick left - walk to left post ;;;
Instruction_PirateNinja_DivekickLeft_WalkToLeftPost:
    LDA.W Enemy.XPosition,X                                              ;B2FA15;
    CLC                                                                  ;B2FA18;
    ADC.W #regional($FFFE, $FFFD)                                        ;B2FA19;
    STA.W Enemy.XPosition,X                                              ;B2FA1C;
    CMP.W PirateNinja.leftPostXPosition,X                                ;B2FA1F;
    BPL .return                                                          ;B2FA22;
    LDA.W PirateNinja.leftPostXPosition,X                                ;B2FA24;
    STA.W Enemy.XPosition,X                                              ;B2FA27;
    LDA.W #InstList_PirateNinja_Land_FacingLeft_0                        ;B2FA2A;
    STA.W Enemy.instList,X                                               ;B2FA2D;
    LDA.W #$0001                                                         ;B2FA30;
    STA.W Enemy.instTimer,X                                              ;B2FA33;
    LDA.W #RTS_B2804B                                                    ;B2FA36;
    STA.W PirateNinja.function,X                                         ;B2FA39;

  .return:
    RTS                                                                  ;B2FA3C;


;;; $FA3D: Instruction - set right divekick jump initial Y speed ;;;
Instruction_PirateNinja_SetRightDivekickJumpInitialYSpeed:
    PHX                                                                  ;B2FA3D;
    PHY                                                                  ;B2FA3E;
    LDA.W #$0600                                                         ;B2FA3F;
    STA.L PirateNinja.speed,X                                            ;B2FA42;
    LDA.W PirateNinja.postsMidpointXPosition,X                           ;B2FA46;
    SEC                                                                  ;B2FA49;
    SBC.W PirateNinja.leftPostXPosition,X                                ;B2FA4A;
    LSR                                                                  ;B2FA4D;
    CLC                                                                  ;B2FA4E;
    ADC.W PirateNinja.leftPostXPosition,X                                ;B2FA4F;
    STA.L PirateNinja.neverRead7806,X                                    ;B2FA52;
    PLY                                                                  ;B2FA56;
    PLX                                                                  ;B2FA57;
    RTL                                                                  ;B2FA58;


;;; $FA59: Ninja space pirate function - divekick right - jump ;;;
Instruction_PirateNinja_DivekickRight_Jump:
    LDA.L PirateNinja.speed,X                                            ;B2FA59;
    AND.W #$FF00                                                         ;B2FA5D;
    XBA                                                                  ;B2FA60;
    STA.B DP_Temp12                                                      ;B2FA61;
    LDA.W Enemy.YPosition,X                                              ;B2FA63;
    SEC                                                                  ;B2FA66;
    SBC.B DP_Temp12                                                      ;B2FA67;
    STA.W Enemy.YPosition,X                                              ;B2FA69;
    LDA.L PirateNinja.speed,X                                            ;B2FA6C;
    SEC                                                                  ;B2FA70;
    SBC.W #$0040*!SPF                                                    ;B2FA71;
    STA.L PirateNinja.speed,X                                            ;B2FA74;
    BMI .negativeSpeed                                                   ;B2FA78;
    RTS                                                                  ;B2FA7A;

  .negativeSpeed:
    LDA.W #Instruction_PirateNinja_DivekickRight_Divekick                ;B2FA7B;
    STA.W PirateNinja.function,X                                         ;B2FA7E;
    LDA.W #InstList_PirateNinja_DivekickRight_Divekick                   ;B2FA81;
    STA.W Enemy.instList,X                                               ;B2FA84;
    LDA.W #$0001                                                         ;B2FA87;
    STA.W Enemy.instTimer,X                                              ;B2FA8A;
    LDA.W #$0600                                                         ;B2FA8D;
    STA.L PirateNinja.speed,X                                            ;B2FA90;
    RTS                                                                  ;B2FA94;


;;; $FA95: Ninja space pirate function - divekick right - divekick ;;;
Instruction_PirateNinja_DivekickRight_Divekick:
    LDA.W Enemy.XPosition,X                                              ;B2FA95;
    CLC                                                                  ;B2FA98;
    ADC.W #$0005                                                         ;B2FA99;
    STA.W Enemy.XPosition,X                                              ;B2FA9C;
    LDA.L PirateNinja.speed,X                                            ;B2FA9F;
    AND.W #$FF00                                                         ;B2FAA3;
    XBA                                                                  ;B2FAA6;
    STA.B DP_Temp14                                                      ;B2FAA7;
    LDA.L PirateNinja.speed,X                                            ;B2FAA9;
    AND.W #$00FF                                                         ;B2FAAD;
    STA.B DP_Temp12                                                      ;B2FAB0;
    JSL.L MoveEnemyDownBy_14_12                                          ;B2FAB2;
    BCS .landing                                                         ;B2FAB6;
    LDA.L PirateNinja.speed,X                                            ;B2FAB8;
    SEC                                                                  ;B2FABC;
    SBC.W #$0040*!SPF                                                    ;B2FABD;
    STA.L PirateNinja.speed,X                                            ;B2FAC0;
    BMI .landing                                                         ;B2FAC4;
    BIT.W #$FF00                                                         ;B2FAC6;
    BEQ .landing                                                         ;B2FAC9;
    RTS                                                                  ;B2FACB;

  .landing:
    LDA.W #Instruction_PirateNinja_DivekickRight_WalkToRightPost         ;B2FACC;
    STA.W PirateNinja.function,X                                         ;B2FACF;
    LDA.W #InstList_PirateNinja_DivekickRight_WalkToRightPost_0          ;B2FAD2;
    STA.W Enemy.instList,X                                               ;B2FAD5;
    LDA.W #$0001                                                         ;B2FAD8;
    STA.W Enemy.instTimer,X                                              ;B2FADB;
    LDA.L PirateNinja.spawnYPosition,X                                   ;B2FADE;
    STA.W Enemy.YPosition,X                                              ;B2FAE2;
    JSR.W PirateNinja_SpawnLandingDustCloud                              ;B2FAE5;
    RTS                                                                  ;B2FAE8;


;;; $FAE9: Ninja space pirate function - divekick right - walk to right post ;;;
Instruction_PirateNinja_DivekickRight_WalkToRightPost:
    LDA.W Enemy.XPosition,X                                              ;B2FAE9;
    CLC                                                                  ;B2FAEC;
    ADC.W #regional($0002, $0003)                                        ;B2FAED;
    STA.W Enemy.XPosition,X                                              ;B2FAF0;
    CMP.W PirateNinja.rightPostXPosition,X                               ;B2FAF3;
    BMI .return                                                          ;B2FAF6;
    LDA.W PirateNinja.rightPostXPosition,X                               ;B2FAF8;
    STA.W Enemy.XPosition,X                                              ;B2FAFB;
    LDA.W #InstList_PirateNinja_Land_FacingRight_0                       ;B2FAFE;
    STA.W Enemy.instList,X                                               ;B2FB01;
    LDA.W #$0001                                                         ;B2FB04;
    STA.W Enemy.instTimer,X                                              ;B2FB07;
    LDA.W #RTS_B2804B                                                    ;B2FB0A;
    STA.W PirateNinja.function,X                                         ;B2FB0D;

  .return:
    RTS                                                                  ;B2FB10;


;;; $FB11: Spawn ninja space pirate landing dust cloud ;;;
PirateNinja_SpawnLandingDustCloud:
    LDA.W Enemy.XPosition,X                                              ;B2FB11;
    SEC                                                                  ;B2FB14;
    SBC.W #$0008                                                         ;B2FB15;
    STA.B DP_Temp12                                                      ;B2FB18;
    LDA.W Enemy.YPosition,X                                              ;B2FB1A;
    CLC                                                                  ;B2FB1D;
    ADC.W #$001C                                                         ;B2FB1E;
    STA.B DP_Temp14                                                      ;B2FB21;
    LDA.W #$000A                                                         ;B2FB23;
    STA.B DP_Temp16                                                      ;B2FB26;
    STZ.B DP_Temp18                                                      ;B2FB28;
    JSL.L Create_Sprite_Object                                           ;B2FB2A;
    LDA.W Enemy.XPosition,X                                              ;B2FB2E;
    CLC                                                                  ;B2FB31;
    ADC.W #$0008                                                         ;B2FB32;
    STA.B DP_Temp12                                                      ;B2FB35;
    LDA.W Enemy.YPosition,X                                              ;B2FB37;
    CLC                                                                  ;B2FB3A;
    ADC.W #$001C                                                         ;B2FB3B;
    STA.B DP_Temp14                                                      ;B2FB3E;
    LDA.W #$000A                                                         ;B2FB40;
    STA.B DP_Temp16                                                      ;B2FB43;
    STZ.B DP_Temp18                                                      ;B2FB45;
    JSL.L Create_Sprite_Object                                           ;B2FB47;
    RTS                                                                  ;B2FB4B;


;;; $FB4C: Instruction list - flinch - facing left ;;;
InstList_PirateWalking_Flinch_FacingLeft:
    dw Instruction_PirateWalking_FunctionInY                             ;B2FB4C;
    dw RTS_A0804B                                                        ;B2FB4E;
    dw $0010*!FPS,ExtendedSpritemaps_PirateWalking_23                    ;B2FB50;
    dw Instruction_Common_GotoY                                          ;B2FB54;
    dw InstList_PirateWalking_WalkingLeft_0                              ;B2FB56;


;;; $FB58: Instruction list - flinch - facing right ;;;
InstList_PirateWalking_Flinch_FacingRight:
    dw Instruction_PirateWalking_FunctionInY                             ;B2FB58;
    dw RTS_A0804B                                                        ;B2FB5A;
    dw $0010*!FPS,ExtendedSpritemaps_PirateWalking_24                    ;B2FB5C;
    dw Instruction_Common_GotoY                                          ;B2FB60;
    dw InstList_PirateWalking_WalkingRight_0                             ;B2FB62;


;;; $FB64: Instruction list - walking left ;;;
InstList_PirateWalking_WalkingLeft_0:
    dw Instruction_PirateWalking_FunctionInY                             ;B2FB64;
    dw Function_PirateWalking_WalkingLeft                                ;B2FB66;

InstList_PirateWalking_WalkingLeft_1:
    dw $000A*!FPS,ExtendedSpritemaps_PirateWalking_0                     ;B2FB68;
    dw $000A*!FPS,ExtendedSpritemaps_PirateWalking_1                     ;B2FB6C;
    dw $000A*!FPS,ExtendedSpritemaps_PirateWalking_2                     ;B2FB70;
    dw $000A*!FPS,ExtendedSpritemaps_PirateWalking_3                     ;B2FB74;
    dw $000A*!FPS,ExtendedSpritemaps_PirateWalking_4                     ;B2FB78;
    dw $000A*!FPS,ExtendedSpritemaps_PirateWalking_5                     ;B2FB7C;
    dw $000A*!FPS,ExtendedSpritemaps_PirateWalking_6                     ;B2FB80;
    dw $000A*!FPS,ExtendedSpritemaps_PirateWalking_7                     ;B2FB84;
    dw Instruction_Common_GotoY                                          ;B2FB88;
    dw InstList_PirateWalking_WalkingLeft_1                              ;B2FB8A;


;;; $FB8C: Instruction list - fire lasers left ;;;
InstList_PirateWalking_FireLasersLeft:
    dw Instruction_PirateWalking_FunctionInY                             ;B2FB8C;
    dw RTS_B2FE4A                                                        ;B2FB8E;
    dw regional($0018, $0013),ExtendedSpritemaps_PirateWalking_10        ;B2FB90;
    dw $0008*!FPS,ExtendedSpritemaps_PirateWalking_11                    ;B2FB94;
    dw $0008*!FPS,ExtendedSpritemaps_PirateWalking_12                    ;B2FB98;
    dw $0008*!FPS,ExtendedSpritemaps_PirateWalking_13                    ;B2FB9C;
    dw Instruction_PirateWalking_FireLaserLeftWithYOffsetInY,$0008       ;B2FBA0;
    dw $0008*!FPS,ExtendedSpritemaps_PirateWalking_14                    ;B2FBA2;
    dw Instruction_PirateWalking_FireLaserLeftWithYOffsetInY,$0002       ;B2FBA8;
    dw regional($0018, $0013),ExtendedSpritemaps_PirateWalking_15        ;B2FBAA;
    dw Instruction_PirateWalking_FireLaserLeftWithYOffsetInY,$FFF8       ;B2FBB0;
    dw $0008*!FPS,ExtendedSpritemaps_PirateWalking_14                    ;B2FBB2;
    dw $0008*!FPS,ExtendedSpritemaps_PirateWalking_13                    ;B2FBB8;
    dw $0008*!FPS,ExtendedSpritemaps_PirateWalking_12                    ;B2FBBC;
    dw $0008*!FPS,ExtendedSpritemaps_PirateWalking_11                    ;B2FBC0;
    dw Instruction_PirateWalking_ChooseAMovement                         ;B2FBC4;


;;; $FBC6: Instruction list - look around - facing left ;;;
InstList_PirateWalking_LookingAround_FacingLeft:
    dw Instruction_PirateWalking_FunctionInY                             ;B2FBC6;
    dw RTS_B2FE4A                                                        ;B2FBC8;
    dw regional($0020, $0019),ExtendedSpritemaps_PirateWalking_1C        ;B2FBCA;
    dw $000A*!FPS,ExtendedSpritemaps_PirateWalking_1D                    ;B2FBCE;
    dw regional($0020, $0019),ExtendedSpritemaps_PirateWalking_1E        ;B2FBD2;
    dw $000A*!FPS,ExtendedSpritemaps_PirateWalking_1D                    ;B2FBD6;
    dw regional($0020, $0019),ExtendedSpritemaps_PirateWalking_1C        ;B2FBDA;
    dw $0008*!FPS,ExtendedSpritemaps_PirateWalking_22                    ;B2FBDE;
    dw Instruction_Common_GotoY                                          ;B2FBE2;
    dw InstList_PirateWalking_WalkingRight_0                             ;B2FBE4;


;;; $FBE6: Instruction list - walking right ;;;
InstList_PirateWalking_WalkingRight_0:
    dw Instruction_PirateWalking_FunctionInY                             ;B2FBE6;
    dw Function_PirateWalking_WalkingRight                               ;B2FBE8;

InstList_PirateWalking_WalkingRight_1:
    dw $000A*!FPS,ExtendedSpritemaps_PirateWalking_8                     ;B2FBEA;
    dw $000A*!FPS,ExtendedSpritemaps_PirateWalking_9                     ;B2FBEE;
    dw $000A*!FPS,ExtendedSpritemaps_PirateWalking_A                     ;B2FBF2;
    dw $000A*!FPS,ExtendedSpritemaps_PirateWalking_B                     ;B2FBF6;
    dw $000A*!FPS,ExtendedSpritemaps_PirateWalking_C                     ;B2FBFA;
    dw $000A*!FPS,ExtendedSpritemaps_PirateWalking_D                     ;B2FBFE;
    dw $000A*!FPS,ExtendedSpritemaps_PirateWalking_E                     ;B2FC02;
    dw $000A*!FPS,ExtendedSpritemaps_PirateWalking_F                     ;B2FC06;
    dw Instruction_Common_GotoY                                          ;B2FC0A;
    dw InstList_PirateWalking_WalkingRight_1                             ;B2FC0C;


;;; $FC0E: Instruction list - fire lasers right ;;;
InstList_PirateWalking_FireLasersRight:
    dw Instruction_PirateWalking_FunctionInY                             ;B2FC0E;
    dw RTS_B2FE4A                                                        ;B2FC10;
    dw regional($0018, $0013),ExtendedSpritemaps_PirateWalking_16        ;B2FC12;
    dw $0008*!FPS,ExtendedSpritemaps_PirateWalking_17                    ;B2FC16;
    dw $0008*!FPS,ExtendedSpritemaps_PirateWalking_18                    ;B2FC1A;
    dw $0008*!FPS,ExtendedSpritemaps_PirateWalking_19                    ;B2FC1E;
    dw Instruction_PirateWalking_FireLaserRightWithYOffsetInY,$0008      ;B2FC22;
    dw $0008*!FPS,ExtendedSpritemaps_PirateWalking_1A                    ;B2FC24;
    dw Instruction_PirateWalking_FireLaserRightWithYOffsetInY,$0002      ;B2FC2A;
    dw regional($0018, $0013),ExtendedSpritemaps_PirateWalking_1B        ;B2FC2C;
    dw Instruction_PirateWalking_FireLaserRightWithYOffsetInY,$FFF8      ;B2FC32;
    dw $0008*!FPS,ExtendedSpritemaps_PirateWalking_1A                    ;B2FC34;
    dw $0008*!FPS,ExtendedSpritemaps_PirateWalking_19                    ;B2FC3A;
    dw $0008*!FPS,ExtendedSpritemaps_PirateWalking_18                    ;B2FC3E;
    dw $0008*!FPS,ExtendedSpritemaps_PirateWalking_17                    ;B2FC42;
    dw Instruction_PirateWalking_ChooseAMovement                         ;B2FC46;


;;; $FC48: Instruction list - look around - facing right ;;;
InstList_PirateWalking_LookingAround_FacingRight:
    dw Instruction_PirateWalking_FunctionInY                             ;B2FC48;
    dw RTS_B2FE4A                                                        ;B2FC4A;
    dw regional($0020, $0016),ExtendedSpritemaps_PirateWalking_1F        ;B2FC4C;
    dw $000A*!FPS,ExtendedSpritemaps_PirateWalking_20                    ;B2FC50;
    dw regional($0020, $0016),ExtendedSpritemaps_PirateWalking_21        ;B2FC54;
    dw $000A*!FPS,ExtendedSpritemaps_PirateWalking_20                    ;B2FC58;
    dw regional($0020, $0016),ExtendedSpritemaps_PirateWalking_1F        ;B2FC5C;
    dw $0008*!FPS,ExtendedSpritemaps_PirateWalking_22                    ;B2FC60;
    dw Instruction_Common_GotoY                                          ;B2FC64;
    dw InstList_PirateWalking_WalkingLeft_0                              ;B2FC66;


;;; $FC68: Instruction - fire laser left with Y offset [[Y]] ;;;
Instruction_PirateWalking_FireLaserLeftWithYOffsetInY:
    PHX                                                                  ;B2FC68;
    PHY                                                                  ;B2FC69;
    LDX.B EnemyIndex                                                     ;B2FC6A;
    LDA.W Enemy.XPosition,X                                              ;B2FC6D;
    SEC                                                                  ;B2FC70;
    SBC.W #$0018                                                         ;B2FC71;
    STA.B DP_Temp12                                                      ;B2FC74;
    LDA.W Enemy.YPosition,X                                              ;B2FC76;
    SEC                                                                  ;B2FC79;
    SBC.W $0000,Y                                                        ;B2FC7A;
    STA.B DP_Temp14                                                      ;B2FC7D;
    LDA.W #$0000                                                         ;B2FC7F;
    STA.B DP_Temp16                                                      ;B2FC82;
    LDY.W #EnemyProjectile_PirateMotherBrainLaser                        ;B2FC84;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;B2FC87;
    PLY                                                                  ;B2FC8B;
    PLX                                                                  ;B2FC8C;
    INY                                                                  ;B2FC8D;
    INY                                                                  ;B2FC8E;
    RTL                                                                  ;B2FC8F;


;;; $FC90: Instruction - fire laser right with Y offset [[Y]] ;;;
Instruction_PirateWalking_FireLaserRightWithYOffsetInY:
    PHX                                                                  ;B2FC90;
    PHY                                                                  ;B2FC91;
    LDX.B EnemyIndex                                                     ;B2FC92;
    LDA.W Enemy.XPosition,X                                              ;B2FC95;
    CLC                                                                  ;B2FC98;
    ADC.W #$0018                                                         ;B2FC99;
    STA.B DP_Temp12                                                      ;B2FC9C;
    LDA.W Enemy.YPosition,X                                              ;B2FC9E;
    SEC                                                                  ;B2FCA1;
    SBC.W $0000,Y                                                        ;B2FCA2;
    STA.B DP_Temp14                                                      ;B2FCA5;
    LDA.W #$0001                                                         ;B2FCA7;
    STA.B DP_Temp16                                                      ;B2FCAA;
    LDY.W #EnemyProjectile_PirateMotherBrainLaser                        ;B2FCAC;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;B2FCAF;
    PLY                                                                  ;B2FCB3;
    PLX                                                                  ;B2FCB4;
    INY                                                                  ;B2FCB5;
    INY                                                                  ;B2FCB6;
    RTL                                                                  ;B2FCB7;


;;; $FCB8: Instruction - enemy function = [[Y]] ;;;
Instruction_PirateWalking_FunctionInY:
    PHY                                                                  ;B2FCB8;
    PHX                                                                  ;B2FCB9;
    LDX.B EnemyIndex                                                     ;B2FCBA;
    LDA.W $0000,Y                                                        ;B2FCBD;
    STA.W PirateWalking.function,X                                       ;B2FCC0;
    PLX                                                                  ;B2FCC3;
    PLY                                                                  ;B2FCC4;
    INY                                                                  ;B2FCC5;
    INY                                                                  ;B2FCC6;
    RTL                                                                  ;B2FCC7;


;;; $FCC8: Instruction - choose a movement ;;;
Instruction_PirateWalking_ChooseAMovement:
    PHX                                                                  ;B2FCC8;
    LDX.B EnemyIndex                                                     ;B2FCC9;
    LDA.W #$0010                                                         ;B2FCCC;
    PHY                                                                  ;B2FCCF;
    JSL.L IsSamusWithingAPixelRowsOfEnemy                                ;B2FCD0;
    PLY                                                                  ;B2FCD4;
    AND.W #$FFFF                                                         ;B2FCD5;
    BNE .verticalClose                                                   ;B2FCD8;
    LDX.B EnemyIndex                                                     ;B2FCDA;
    LDY.W #InstList_PirateWalking_WalkingRight_0                         ;B2FCDD;
    LDA.B SamusXPosition                                                 ;B2FCE0;
    SEC                                                                  ;B2FCE3;
    SBC.W Enemy.XPosition,X                                              ;B2FCE4;
    BMI .returnWalking                                                   ;B2FCE7;
    LDY.W #InstList_PirateWalking_WalkingLeft_0                          ;B2FCE9;

  .returnWalking:
    PLX                                                                  ;B2FCEC;
    RTL                                                                  ;B2FCED;

  .verticalClose:
    LDX.B EnemyIndex                                                     ;B2FCEE;
    LDY.W #InstList_PirateWalking_FireLasersLeft                         ;B2FCF1;
    LDA.B SamusXPosition                                                 ;B2FCF4;
    SEC                                                                  ;B2FCF7;
    SBC.W Enemy.XPosition,X                                              ;B2FCF8;
    BMI .returnLasers                                                    ;B2FCFB;
    LDY.W #InstList_PirateWalking_FireLasersRight                        ;B2FCFD;

  .returnLasers:
    PLX                                                                  ;B2FD00;
    RTL                                                                  ;B2FD01;


;;; $FD02: Initialisation AI - enemy $F653/$F693/$F6D3/$F713/$F753/$F793 (walking space pirates) ;;;
InitAI_PirateWalking:
    LDX.B EnemyIndex                                                     ;B2FD02;
    LDY.W #InstList_PirateWalking_WalkingLeft_0                          ;B2FD05;
    LDA.W Enemy.init0,X                                                  ;B2FD08;
    BIT.W #$0001                                                         ;B2FD0B;
    BEQ .keepLeft                                                        ;B2FD0E;
    LDY.W #InstList_PirateWalking_WalkingRight_0                         ;B2FD10;

  .keepLeft:
    TYA                                                                  ;B2FD13;
    STA.W Enemy.instList,X                                               ;B2FD14;
    LDA.W #RTS_B2804B                                                    ;B2FD17;
    STA.W PirateWalking.function,X                                       ;B2FD1A;
    LDA.W Enemy.XPosition,X                                              ;B2FD1D;
    CLC                                                                  ;B2FD20;
    ADC.W Enemy.init1,X                                                  ;B2FD21;
    STA.W PirateWalking.rightPostXPosition,X                             ;B2FD24;
    LDA.W Enemy.XPosition,X                                              ;B2FD27;
    SEC                                                                  ;B2FD2A;
    SBC.W Enemy.init1,X                                                  ;B2FD2B;
    STA.W PirateWalking.leftPostXPosition,X                              ;B2FD2E;
    RTL                                                                  ;B2FD31;


;;; $FD32: Main AI - enemy $F653/$F693/$F6D3/$F713/$F753/$F793 (walking space pirates) ;;;
MainAI_PirateWalking:
    LDX.B EnemyIndex                                                     ;B2FD32;
    JSR.W (PirateWalking.function,X)                                     ;B2FD35;
    LDA.W Enemy.init0,X                                                  ;B2FD38;
    BIT.W #$8000                                                         ;B2FD3B;
    BEQ .return                                                          ;B2FD3E;
    JSR.W PirateWalking_FlinchTrigger                                    ;B2FD40;

  .return:
    RTL                                                                  ;B2FD43;


;;; $FD44: Walking space pirate function - walking left ;;;
Function_PirateWalking_WalkingLeft:
    LDX.B EnemyIndex                                                     ;B2FD44;
    LDA.W #$0010                                                         ;B2FD47;
    JSL.L IsSamusWithingAPixelRowsOfEnemy                                ;B2FD4A;
    BEQ .walk                                                            ;B2FD4E;
    LDY.W #InstList_PirateWalking_FireLasersLeft                         ;B2FD50;
    LDA.B SamusXPosition                                                 ;B2FD53;
    SEC                                                                  ;B2FD56;
    SBC.W Enemy.XPosition,X                                              ;B2FD57;
    BMI .keepLeft                                                        ;B2FD5A;
    LDY.W #InstList_PirateWalking_FireLasersRight                        ;B2FD5C;

  .keepLeft:
    TYA                                                                  ;B2FD5F;
    STA.W Enemy.instList,X                                               ;B2FD60;
    LDA.W #$0001                                                         ;B2FD63;
    STA.W Enemy.instTimer,X                                              ;B2FD66;
    RTS                                                                  ;B2FD69;

  .walk:
    LDA.W #$0001                                                         ;B2FD6A;
    STA.B DP_Temp14                                                      ;B2FD6D;
    STZ.B DP_Temp12                                                      ;B2FD6F;
    JSL.L MoveEnemyDownBy_14_12                                          ;B2FD71;
    BCC .return                                                          ;B2FD75;
    LDA.W Enemy.XPosition,X                                              ;B2FD77;
    STA.L PirateWalking.backupXPosition,X                                ;B2FD7A;
    CLC                                                                  ;B2FD7E;
    ADC.W #$FFEF                                                         ;B2FD7F;
    STA.W Enemy.XPosition,X                                              ;B2FD82;
    LDA.W #$0001                                                         ;B2FD85;
    STA.B DP_Temp14                                                      ;B2FD88;
    STZ.B DP_Temp12                                                      ;B2FD8A;
    JSL.L MoveEnemyDownBy_14_12                                          ;B2FD8C;
    PHP                                                                  ;B2FD90;
    LDA.L PirateWalking.backupXPosition,X                                ;B2FD91;
    STA.W Enemy.XPosition,X                                              ;B2FD95;
    PLP                                                                  ;B2FD98;
    BCC .collision                                                       ;B2FD99;
    LDA.W #$0000                                                         ;B2FD9B;
    STA.B DP_Temp12                                                      ;B2FD9E;
    LDA.W #$FFF7                                                         ;B2FDA0;
    STA.B DP_Temp14                                                      ;B2FDA3;
    JSL.L CheckForHorizontalSolidBlockCollision                          ;B2FDA5;
    LDA.W #-$3801*!SPF                                                   ;B2FDA9;
    STA.B DP_Temp12                                                      ;B2FDAC;
    LDA.W #$FFFF                                                         ;B2FDAE;
    STA.B DP_Temp14                                                      ;B2FDB1;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;B2FDB3;
    BCS .collision                                                       ;B2FDB7;
    LDA.W Enemy.XPosition,X                                              ;B2FDB9;
    CMP.W PirateWalking.leftPostXPosition,X                              ;B2FDBC;
    BPL .return                                                          ;B2FDBF;

  .collision:
    LDA.W #InstList_PirateWalking_LookingAround_FacingLeft               ;B2FDC1;
    STA.W Enemy.instList,X                                               ;B2FDC4;
    LDA.W #$0001                                                         ;B2FDC7;
    STA.W Enemy.instTimer,X                                              ;B2FDCA;

  .return:
    RTS                                                                  ;B2FDCD;


;;; $FDCE: Walking space pirate function - walking right ;;;
Function_PirateWalking_WalkingRight:
    LDX.B EnemyIndex                                                     ;B2FDCE;
    LDA.W #$0010                                                         ;B2FDD1;
    JSL.L IsSamusWithingAPixelRowsOfEnemy                                ;B2FDD4;
    BEQ .walk                                                            ;B2FDD8;
    LDY.W #InstList_PirateWalking_FireLasersLeft                         ;B2FDDA;
    LDA.B SamusXPosition                                                 ;B2FDDD;
    SEC                                                                  ;B2FDE0;
    SBC.W Enemy.XPosition,X                                              ;B2FDE1;
    BMI .keepLeft                                                        ;B2FDE4;
    LDY.W #InstList_PirateWalking_FireLasersRight                        ;B2FDE6;

  .keepLeft:
    TYA                                                                  ;B2FDE9;
    STA.W Enemy.instList,X                                               ;B2FDEA;
    LDA.W #$0001                                                         ;B2FDED;
    STA.W Enemy.instTimer,X                                              ;B2FDF0;
    RTS                                                                  ;B2FDF3;

  .walk:
    LDA.W #$0001                                                         ;B2FDF4;
    STA.B DP_Temp14                                                      ;B2FDF7;
    STZ.B DP_Temp12                                                      ;B2FDF9;
    JSL.L MoveEnemyDownBy_14_12                                          ;B2FDFB;
    BCC .return                                                          ;B2FDFF;
    LDA.W Enemy.XPosition,X                                              ;B2FE01;
    STA.L PirateWalking.backupXPosition,X                                ;B2FE04;
    CLC                                                                  ;B2FE08;
    ADC.W #$0010                                                         ;B2FE09;
    STA.W Enemy.XPosition,X                                              ;B2FE0C;
    LDA.W #$0001                                                         ;B2FE0F;
    STA.B DP_Temp14                                                      ;B2FE12;
    STZ.B DP_Temp12                                                      ;B2FE14;
    JSL.L MoveEnemyDownBy_14_12                                          ;B2FE16;
    PHP                                                                  ;B2FE1A;
    LDA.L PirateWalking.backupXPosition,X                                ;B2FE1B;
    STA.W Enemy.XPosition,X                                              ;B2FE1F;
    PLP                                                                  ;B2FE22;
    BCC .collision                                                       ;B2FE23;
    LDA.W #$3800*!SPF                                                    ;B2FE25;
    STA.B DP_Temp12                                                      ;B2FE28;
    LDA.W #$0000                                                         ;B2FE2A;
    STA.B DP_Temp14                                                      ;B2FE2D;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;B2FE2F;
    BCS .collision                                                       ;B2FE33;
    LDA.W Enemy.XPosition,X                                              ;B2FE35;
    CMP.W PirateWalking.rightPostXPosition,X                             ;B2FE38;
    BMI .return                                                          ;B2FE3B;

  .collision:
    LDA.W #InstList_PirateWalking_LookingAround_FacingRight              ;B2FE3D;
    STA.W Enemy.instList,X                                               ;B2FE40;
    LDA.W #$0001                                                         ;B2FE43;
    STA.W Enemy.instTimer,X                                              ;B2FE46;

  .return:
    RTS                                                                  ;B2FE49;


;;; $FE4A: RTS ;;;
RTS_B2FE4A:
    RTS                                                                  ;B2FE4A;


;;; $FE4B: Walking space pirate flinch trigger ;;;
PirateWalking_FlinchTrigger:
; Return value is ignored by caller. Probably left over from PirateNinja_FlinchTrigger copy+paste
    PHX                                                                  ;B2FE4B;
    LDX.B EnemyIndex                                                     ;B2FE4C;
    LDY.W #$0008                                                         ;B2FE4F;

  .loopProjectiles:
    LDA.W SamusProjectile_Types,Y                                        ;B2FE52;
    BNE .checkProjectile                                                 ;B2FE55;
    DEY                                                                  ;B2FE57;
    DEY                                                                  ;B2FE58;
    BPL .loopProjectiles                                                 ;B2FE59;
    BRA .returnNoFlinch                                                  ;B2FE5B;

  .checkProjectile:
    LDA.W SamusProjectile_XPositions,Y                                   ;B2FE5D;
    SEC                                                                  ;B2FE60;
    SBC.W Enemy.XPosition,X                                              ;B2FE61;
    BPL +                                                                ;B2FE64;
    EOR.W #$FFFF                                                         ;B2FE66;
    INC                                                                  ;B2FE69;

+   SEC                                                                  ;B2FE6A;
    SBC.W #$0020                                                         ;B2FE6B;
    BPL .returnNoFlinch                                                  ;B2FE6E;
    LDA.W SamusProjectile_YPositions,Y                                   ;B2FE70;
    SEC                                                                  ;B2FE73;
    SBC.W Enemy.YPosition,X                                              ;B2FE74;
    BPL +                                                                ;B2FE77;
    EOR.W #$FFFF                                                         ;B2FE79;
    INC                                                                  ;B2FE7C;

+   SEC                                                                  ;B2FE7D;
    SBC.W #$0020                                                         ;B2FE7E;
    BPL .returnNoFlinch                                                  ;B2FE81;
    LDA.W Enemy.XPosition,X                                              ;B2FE83;
    SEC                                                                  ;B2FE86;
    SBC.B SamusXPosition                                                 ;B2FE87;
    STA.B DP_Temp12                                                      ;B2FE8A;
    LDY.W #InstList_PirateWalking_Flinch_FacingLeft                      ;B2FE8C;
    LDA.B DP_Temp12                                                      ;B2FE8F;
    BPL .keepLeft                                                        ;B2FE91;
    LDY.W #InstList_PirateWalking_Flinch_FacingRight                     ;B2FE93;

  .keepLeft:
    TYA                                                                  ;B2FE96;
    STA.W Enemy.instList,X                                               ;B2FE97;
    LDA.W #$0001                                                         ;B2FE9A;
    STA.W Enemy.instTimer,X                                              ;B2FE9D;
    PLX                                                                  ;B2FEA0;
    LDA.W #$0001                                                         ;B2FEA1;
    RTS                                                                  ;B2FEA4;

  .returnNoFlinch:
    PLX                                                                  ;B2FEA5;
    LDA.W #$0000                                                         ;B2FEA6;
    RTS                                                                  ;B2FEA9;


Freespace_BankB2_FEAA:                                                   ;B2FEAA;
; $156 bytes
