
; Enemy AI: Draygon, Spore Spawn

org $A58000


; Common to all enemy code banks

;;; $8000: Grapple AI - no interaction. Also unfreezes enemies(!) ;;;
CommonA5_GrappleAI_NoInteraction:
; Used by skultera, Draygon body, fire arc, Phantoon, etecoon, dachora and WS ghost
    JSL.L GrappleAI_SwitchEnemyAIToMainAI                                ;A58000;
    RTL                                                                  ;A58004;


;;; $8005: Grapple AI - Samus latches on ;;;
CommonA5_GrappleAI_SamusLatchesOn:
; Used by gripper and Crocomire
    JSL.L GrappleAI_SamusLatchesOnWithGrapple                            ;A58005;
    RTL                                                                  ;A58009;


;;; $800A: Grapple AI - kill enemy ;;;
CommonA5_GrappleAI_KillEnemy:
; Common
    JSL.L GrappleAI_EnemyGrappleDeath                                    ;A5800A;
    RTL                                                                  ;A5800E;


;;; $800F: Grapple AI - cancel grapple beam ;;;
CommonA5_GrappleAI_CancelGrappleBeam:
; Common
    JSL.L GrappleAI_SwitchToFrozenAI                                     ;A5800F;
    RTL                                                                  ;A58013;


;;; $8014: Grapple AI - Samus latches on - no invincibility ;;;
CommonA5_GrappleAI_SamusLatchesOn_NoInvincibility:
; Used by powamp
    JSL.L GrappleAI_SamusLatchesOnWithGrapple_NoInvincibility            ;A58014;
    RTL                                                                  ;A58018;


;;; $8019: Unused. Grapple AI - Samus latches on - paralyse enemy ;;;
UNUSED_CommonA5_GrappleAI_SamusLatchesOn_ParalyzeEnemy_A58019:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple_ParalyzeEnemy              ;A58019;
    RTL                                                                  ;A5801D;


;;; $801E: Grapple AI - hurt Samus ;;;
CommonA5_GrappleAI_HurtSamus:
; Used by WS spark
; Hurt reaction happens in $9B:B932
    JSL.L GrappleAI_SwitchToFrozenAI_duplicate                           ;A5801E;
    RTL                                                                  ;A58022;


;;; $8023: Normal enemy touch AI ;;;
CommonA5_NormalEnemyTouchAI:
    JSL.L NormalEnemyTouchAI                                             ;A58023;
    RTL                                                                  ;A58027;


;;; $8028: Normal touch AI - no death check ;;;
CommonA5_NormalTouchAI_NoDeathCheck:
    JSL.L NormalEnemyTouchAI_NoDeathCheck_External                       ;A58028;
    RTL                                                                  ;A5802C;


;;; $802D: Normal enemy shot AI ;;;
CommonA5_NormalEnemyShotAI:
    JSL.L NormalEnemyShotAI                                              ;A5802D;
    RTL                                                                  ;A58031;


;;; $8032: Normal enemy shot AI - no death check, no enemy shot graphic ;;;
CommonA5_NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic:
    JSL.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External     ;A58032;
    RTL                                                                  ;A58036;


;;; $8037: Normal enemy power bomb AI ;;;
CommonA5_NormalEnemyPowerBombAI:
    JSL.L NormalEnemyPowerBombAI                                         ;A58037;
    RTL                                                                  ;A5803B;


;;; $803C: Normal enemy power bomb AI - no death check ;;;
CommonA5_NormalEnemyPowerBombAI_NoDeathCheck:
; Kraid's power bomb AI
    JSL.L NormalEnemyPowerBombAI_NoDeathCheck_External                   ;A5803C;
    RTL                                                                  ;A58040;


;;; $8041: Normal enemy frozen AI ;;;
CommonA5_NormalEnemyFrozenAI:
    JSL.L NormalEnemyFrozenAI                                            ;A58041;
    RTL                                                                  ;A58045;


;;; $8046: Creates a dud shot ;;;
CommonA5_CreateADudShot:
    JSL.L CreateADudShot                                                 ;A58046;
    RTL                                                                  ;A5804A;


;;; $804B: RTS ;;;
RTS_A5804B:
    RTS                                                                  ;A5804B;


;;; $804C: RTL ;;;
RTL_A5804C:
    RTL                                                                  ;A5804C;


;;; $804D: Spritemap - nothing ;;;
Spritemap_CommonA5_Nothing:
    dw $0000                                                             ;A5804D;


;;; $804F: Extended spritemap - nothing ;;;
ExtendedSpritemap_CommonA5_Nothing:
    dw $0001                                                             ;A5804F;
    dw $0000,$0000
    dw Spritemap_CommonA5_Nothing                                        ;A58055;
    dw Hitbox_CommonA5_Nothing                                           ;A58057;


;;; $8059: Hitbox - nothing ;;;
Hitbox_CommonA5_Nothing:
; [n entries] [[left offset] [top offset] [right offset] [bottom offset] [p touch] [p shot]]...
    dw $0001                                                             ;A58059;
    dw $0000,$0000,$0000,$0000
    dw CommonA5_NormalEnemyTouchAI                                       ;A58063;
    dw CommonA5_NormalEnemyShotAI                                        ;A58065;


;;; $8067: Instruction list - delete enemy ;;;
InstList_CommonA5_DeleteEnemy:
    dw Instruction_CommonA5_DeleteEnemy                                  ;A58067;


;;; $8069: Two NOPs ;;;
NOPNOP_A58069:
; Used as palette by respawning enemy placeholder and Draygon's eye o_O
    NOP                                                                  ;A58069;
    NOP                                                                  ;A5806A;


;;; $806B: Instruction - Enemy.var5 = [[Y]] ;;;
Instruction_CommonA5_Enemy0FB2_InY:
; Used only by torizos (for enemy movement function) and escape etecoon (for enemy function)
    LDA.W $0000,Y                                                        ;A5806B;
    STA.W Enemy.var5,X                                                   ;A5806E;
    INY                                                                  ;A58071;
    INY                                                                  ;A58072;
    RTL                                                                  ;A58073;


;;; $8074: Instruction - Enemy.var5 = RTS ;;;
Instruction_CommonA5_SetEnemy0FB2ToRTS:
    LDA.W #RTS_A5807B                                                    ;A58074;
    STA.W Enemy.var5,X                                                   ;A58077;
    RTL                                                                  ;A5807A;


RTS_A5807B:
    RTS                                                                  ;A5807B;


;;; $807C: Instruction - delete enemy ;;;
Instruction_CommonA5_DeleteEnemy:
    LDA.W Enemy.properties,X                                             ;A5807C;
    ORA.W #$0200                                                         ;A5807F;
    STA.W Enemy.properties,X                                             ;A58082;
    PLA                                                                  ;A58085;
    PEA.W ProcessEnemyInstructions_return-1                              ;A58086;
    RTL                                                                  ;A58089;


;;; $808A: Instruction - call function [[Y]] ;;;
Instruction_CommonA5_CallFunctionInY:
    LDA.W $0000,Y                                                        ;A5808A;
    STA.B DP_Temp12                                                      ;A5808D;
    PHY                                                                  ;A5808F;
    PHX                                                                  ;A58090;
    PEA.W .manualReturn-1                                                ;A58091;
    JMP.W (DP_Temp12)                                                    ;A58094;

  .manualReturn:
    PLX                                                                  ;A58097;
    PLY                                                                  ;A58098;
    INY                                                                  ;A58099;
    INY                                                                  ;A5809A;
    RTL                                                                  ;A5809B;


;;; $809C: Instruction - call function [[Y]] with A = [[Y] + 2] ;;;
Instruction_CommonA5_CallFunctionInY_WithA:
    LDA.W $0000,Y                                                        ;A5809C;
    STA.B DP_Temp12                                                      ;A5809F;
    LDA.W $0002,Y                                                        ;A580A1;
    PHY                                                                  ;A580A4;
    PHX                                                                  ;A580A5;
    PEA.W .manualReturn-1                                                ;A580A6;
    JMP.W (DP_Temp12)                                                    ;A580A9;

  .manualReturn:
    PLX                                                                  ;A580AC;
    PLY                                                                  ;A580AD;
    TYA                                                                  ;A580AE;
    CLC                                                                  ;A580AF;
    ADC.W #$0004                                                         ;A580B0;
    TAY                                                                  ;A580B3;
    RTL                                                                  ;A580B4;


if !FEATURE_KEEP_UNREFERENCED
;;; $80B5: Unused. Instruction - call external function [[Y]] ;;;
UNUSED_Instruction_CommonA5_CallExternalFunctionInY_A580B5:
    LDA.W $0000,Y                                                        ;A580B5;
    STA.B DP_Temp12                                                      ;A580B8;
    LDA.W $0001,Y                                                        ;A580BA;
    STA.B DP_Temp13                                                      ;A580BD;
    PHX                                                                  ;A580BF;
    PHY                                                                  ;A580C0;
    JSL.L .externalFunction                                              ;A580C1;
    PLY                                                                  ;A580C5;
    PLX                                                                  ;A580C6;
    INY                                                                  ;A580C7;
    INY                                                                  ;A580C8;
    INY                                                                  ;A580C9;
    RTL                                                                  ;A580CA;

  .externalFunction:
    JML.W [DP_Temp12]                                                    ;A580CB;


;;; $80CE: Unused. Instruction - call external function [[Y]] with A = [[Y] + 3] ;;;
UNUSED_Inst_CommonA5_CallExternalFunctionInY_WithA_A580CE:
    LDA.W $0000,Y                                                        ;A580CE;
    STA.B DP_Temp12                                                      ;A580D1;
    LDA.W $0001,Y                                                        ;A580D3;
    STA.B DP_Temp13                                                      ;A580D6;
    LDA.W $0003,Y                                                        ;A580D8;
    PHX                                                                  ;A580DB;
    PHY                                                                  ;A580DC;
    JSL.L .externalFunction                                              ;A580DD;
    PLY                                                                  ;A580E1;
    PLX                                                                  ;A580E2;
    TYA                                                                  ;A580E3;
    CLC                                                                  ;A580E4;
    ADC.W #$0005                                                         ;A580E5;
    TAY                                                                  ;A580E8;
    RTL                                                                  ;A580E9;

  .externalFunction:
    JML.W [DP_Temp12]                                                    ;A580EA;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $80ED: Instruction - go to [[Y]] ;;;
Instruction_CommonA5_GotoY:
    LDA.W $0000,Y                                                        ;A580ED;
    TAY                                                                  ;A580F0;
    RTL                                                                  ;A580F1;


;;; $80F2: Instruction - go to [[Y]] + ±[[Y]] ;;;
Instruction_CommonA5_GotoY_PlusY:
    STY.B DP_Temp12                                                      ;A580F2;
    DEY                                                                  ;A580F4;
    LDA.W $0000,Y                                                        ;A580F5;
    XBA                                                                  ;A580F8;
    BMI .highByte                                                        ;A580F9;
    AND.W #$00FF                                                         ;A580FB;
    BRA +                                                                ;A580FE;

  .highByte:
    ORA.W #$FF00                                                         ;A58100;

+   CLC                                                                  ;A58103;
    ADC.B DP_Temp12                                                      ;A58104;
    TAY                                                                  ;A58106;
    RTL                                                                  ;A58107;


;;; $8108: Instruction - decrement timer and go to [[Y]] if non-zero ;;;
Instruction_CommonA5_DecrementTimer_GotoYIfNonZero:
    DEC.W Enemy.loopCounter,X                                            ;A58108;
    BNE Instruction_CommonA5_GotoY                                       ;A5810B;
    INY                                                                  ;A5810D;
    INY                                                                  ;A5810E;
    RTL                                                                  ;A5810F;


;;; $8110: Instruction - decrement timer and go to [[Y]] if non-zero ;;;
Instruction_CommonA5_DecrementTimer_GotoYIfNonZero_duplicate:
    DEC.W Enemy.loopCounter,X                                            ;A58110;
    BNE Instruction_CommonA5_GotoY                                       ;A58113;
    INY                                                                  ;A58115;
    INY                                                                  ;A58116;
    RTL                                                                  ;A58117;


;;; $8118: Instruction - decrement timer and go to [Y] + ±[[Y]] if non-zero ;;;
Instruction_CommonA5_DecrementTimer_GotoY_PlusY_IfNonZero:
    SEP #$20                                                             ;A58118;
    DEC.W Enemy.loopCounter,X                                            ;A5811A;
    REP #$20                                                             ;A5811D;
    BNE Instruction_CommonA5_GotoY_PlusY                                 ;A5811F;
    INY                                                                  ;A58121;
    RTL                                                                  ;A58122;


;;; $8123: Instruction - timer = [[Y]] ;;;
Instruction_CommonA5_TimerInY:
    LDA.W $0000,Y                                                        ;A58123;
    STA.W Enemy.loopCounter,X                                            ;A58126;
    INY                                                                  ;A58129;
    INY                                                                  ;A5812A;
    RTL                                                                  ;A5812B;


;;; $812C: Instruction - skip next instruction ;;;
Instruction_CommonA5_SkipNextInstruction:
    INY                                                                  ;A5812C;
    INY                                                                  ;A5812D;
    RTL                                                                  ;A5812E;


;;; $812F: Instruction - sleep ;;;
Instruction_CommonA5_Sleep:
    DEY                                                                  ;A5812F;
    DEY                                                                  ;A58130;
    TYA                                                                  ;A58131;
    STA.W Enemy.instList,X                                               ;A58132;
    PLA                                                                  ;A58135;
    PEA.W ProcessEnemyInstructions_return-1                              ;A58136;
    RTL                                                                  ;A58139;


;;; $813A: Instruction - wait [[Y]] frames ;;;
Instruction_CommonA5_WaitYFrames:
; Set instruction timer and terminate processing enemy instructions
; Used for running a delay that doesn't update graphics,
; useful for e.g. GT eye beam attack ($AA:D10D), implemented by an instruction list that has no graphical instructions,
; which allows it to be called from multiple different poses
    LDA.W $0000,Y                                                        ;A5813A;
    STA.W Enemy.instTimer,X                                              ;A5813D;
    INY                                                                  ;A58140;
    INY                                                                  ;A58141;
    TYA                                                                  ;A58142;
    STA.W Enemy.instList,X                                               ;A58143;
    PLA                                                                  ;A58146;
    PEA.W ProcessEnemyInstructions_return-1                              ;A58147;
    RTL                                                                  ;A5814A;


;;; $814B: Instruction - transfer [[Y]] bytes from [[Y] + 2] to VRAM [[Y] + 5] ;;;
Instruction_CommonA5_TransferYBytesInYToVRAM:
    PHX                                                                  ;A5814B;
    LDX.W VRAMWriteStack                                                 ;A5814C;
    LDA.W $0000,Y                                                        ;A5814F;
    STA.B VRAMWrite.size,X                                               ;A58152;
    LDA.W $0002,Y                                                        ;A58154;
    STA.B VRAMWrite.src,X                                                ;A58157;
    LDA.W $0003,Y                                                        ;A58159;
    STA.B VRAMWrite.src+1,X                                              ;A5815C;
    LDA.W $0005,Y                                                        ;A5815E;
    STA.B VRAMWrite.dest,X                                               ;A58161;
    TXA                                                                  ;A58163;
    CLC                                                                  ;A58164;
    ADC.W #$0007                                                         ;A58165;
    STA.W VRAMWriteStack                                                 ;A58168;
    TYA                                                                  ;A5816B;
    CLC                                                                  ;A5816C;
    ADC.W #$0007                                                         ;A5816D;
    TAY                                                                  ;A58170;
    PLX                                                                  ;A58171;
    RTL                                                                  ;A58172;


;;; $8173: Instruction - enable off-screen processing ;;;
Instruction_CommonA5_EnableOffScreenProcessing:
    LDA.W Enemy.properties,X                                             ;A58173;
    ORA.W #$0800                                                         ;A58176;
    STA.W Enemy.properties,X                                             ;A58179;
    RTL                                                                  ;A5817C;


;;; $817D: Instruction - disable off-screen processing ;;;
Instruction_CommonA5_DisableOffScreenProcessing:
    LDA.W Enemy.properties,X                                             ;A5817D;
    AND.W #$F7FF                                                         ;A58180;
    STA.W Enemy.properties,X                                             ;A58183;
    RTL                                                                  ;A58186;


;;; $8187: Common enemy speeds - linearly increasing ;;;
CommonA5EnemySpeeds_LinearlyIncreasing:
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
CommonA5EnemySpeeds_QuadraticallyIncreasing:
; I.e. gravity
; Used by e.g. Botwoon when dying and falling to the floor
;        _____________________ Subspeed
;       |      _______________ Speed
;       |     |      _________ Negated subspeed
;       |     |     |      ___ Negated speed
;       |     |     |     |
  .subspeed:
    dw $0000                                                             ;A5838F;
  .speed:
    dw       $0000                                                       ;A58391;
  .negatedSubspeed:
    dw             $0000                                                 ;A58393;
  .negatedSpeed:
    dw                   $0000                                           ;A58395;
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


;;; $8687: Initialisation AI - enemy $DE3F (Draygon body) ;;;
InitAI_DraygonBody:
; Draygon's making the error of trying to set the instruction list pointer of enemies that haven't yet spawned
; When an enemy spawns, its RAM gets cleared or initialised from enemy header, so these stores have no effect
; The enemies set their own instruction list pointers in their init AI, which match up except for the arms, which use InstList_DraygonArms_FacingLeft_Idle_0 instead of InstList_DraygonArms_FacingLeft_NearSwoopApex
    LDX.W #$0030                                                         ;A58687;

  .loopTargetPalette:
    LDA.W Palette_Draygon_Sprite1,X                                      ;A5868A;
    STA.L TargetPalettes_SpriteP1,X                                      ;A5868D;
    DEX                                                                  ;A58691;
    DEX                                                                  ;A58692;
    BPL .loopTargetPalette                                               ;A58693;
    LDX.W #Enemy[2].YPosition                                            ;A58695;
    LDA.W #$0338                                                         ;A58698;

  .loopBG2Tilemap:
    STA.L EnemyBG2Tilemap,X                                              ;A5869B;
    DEX                                                                  ;A5869F;
    DEX                                                                  ;A586A0;
    BPL .loopBG2Tilemap                                                  ;A586A1;
    LDX.W EnemyIndex                                                     ;A586A3;
    LDA.W #$0700                                                         ;A586A6;
    ASL                                                                  ;A586A9;
    STA.W Enemy.palette,X                                                ;A586AA;
    LDA.W #EnemyGraphicsDrawnHook_Draygon_SetBG2XYScroll>>16             ;A586AD;
    STA.W EnemyGraphicsDrawnHook+2                                       ;A586B0;
    LDA.W #EnemyGraphicsDrawnHook_Draygon_SetBG2XYScroll                 ;A586B3;
    STA.W EnemyGraphicsDrawnHook                                         ;A586B6;
    LDA.W #$FFFF                                                         ;A586B9;
    STA.W GlobalOffScreenEnemyProcessingFlag                             ;A586BC;
    LDA.W #InstList_DraygonBody_FacingLeft_Idle                          ;A586BF;
    STA.W Enemy.instList                                                 ;A586C2;
    LDA.W #InstList_DraygonEye_FacingLeft_Idle                           ;A586C5;
    STA.W Enemy[1].instList                                              ;A586C8;
    LDA.W #InstList_DraygonTail_FacingLeft_FakeTailWhip                  ;A586CB;
    STA.W Enemy[2].instList                                              ;A586CE;
    LDA.W #InstList_DraygonArms_FacingLeft_NearSwoopApex                 ;A586D1;
    STA.W Enemy[3].instList                                              ;A586D4;
    LDA.W #$0400                                                         ;A586D7;
    STA.W EnemyBG2TilemapSize                                            ;A586DA;
    LDA.W #Function_DraygonBody_FightIntro_InitialDelay                  ;A586DD;
    STA.W DraygonBody.function,X                                         ;A586E0;
    JSL.L Spawn_DraygonMainScreenLayers_HDMAObject                       ;A586E3;
    LDA.W #$000C                                                         ;A586E7;
    STA.B DP_RoomLoadIRQCmd                                              ;A586EA;
    JSL.L Spawn_BG3_Scroll_HDMA_Object                                   ;A586EC;
    LDA.W #$0001                                                         ;A586F0;
    STA.L ExtraEnemy8800+$A                                              ;A586F3;
    JSL.L DisableMinimap_MarkBossRoomTilesExplored                       ;A586F7;
    RTL                                                                  ;A586FB;


;;; $86FC: Main AI - enemy $DE3F (Draygon body) ;;;
MainAI_DraygonBody:
    LDX.W EnemyIndex                                                     ;A586FC;
    JSR.W (DraygonBody.function,X)                                       ;A586FF;
    LDA.W Enemy.XPosition                                                ;A58702;
    STA.W Enemy[1].XPosition                                             ;A58705;
    STA.W Enemy[2].XPosition                                             ;A58708;
    STA.W Enemy[3].XPosition                                             ;A5870B;
    LDA.W Enemy.YPosition                                                ;A5870E;
    STA.W Enemy[1].YPosition                                             ;A58711;
    STA.W Enemy[2].YPosition                                             ;A58714;
    STA.W Enemy[3].YPosition                                             ;A58717;
    RTL                                                                  ;A5871A;


;;; $871B: Draygon body function - fight intro - initial delay ;;;
Function_DraygonBody_FightIntro_InitialDelay:
    JSR.W HandleFiringWallTurret                                         ;A5871B;
    LDX.W EnemyIndex                                                     ;A5871E; >.<
    LDA.W DraygonBody.functionTimer                                      ;A58721;
    CMP.W #$0100*!SPF                                                    ;A58724;
    BPL .done                                                            ;A58727;
    LDA.W DraygonBody.functionTimer                                      ;A58729;
    BNE .incFunctionTimer                                                ;A5872C;
    LDX.W VRAMWriteStack                                                 ;A5872E;
    LDA.W #$0600                                                         ;A58731;
    STA.B VRAMWrite.size,X                                               ;A58734;
    LDA.W #Tiles_Evir                                                    ;A58736;
    STA.B VRAMWrite.src,X                                                ;A58739;
    LDA.W #Tiles_Evir>>16                                                ;A5873B;
    STA.B VRAMWrite.src+2,X                                              ;A5873E;
    LDA.W #$6D00                                                         ;A58740;
    STA.B VRAMWrite.dest,X                                               ;A58743;
    LDA.W VRAMWriteStack                                                 ;A58745;
    CLC                                                                  ;A58748;
    ADC.W #$0007                                                         ;A58749;
    STA.W VRAMWriteStack                                                 ;A5874C;
    JSR.W SpawnFightIntroEvirSpriteObjects                               ;A5874F;

  .incFunctionTimer:
    INC.W DraygonBody.functionTimer                                      ;A58752;
    RTS                                                                  ;A58755;

  .done:
    LDA.W #Function_DraygonBody_FightIntro_Dance                         ;A58756;
    STA.W DraygonBody.function                                           ;A58759;
    STZ.W DraygonBody.functionTimer                                      ;A5875C;
    LDA.W Enemy.XPosition                                                ;A5875F;
    STA.L DraygonBody.leftSideResetXPosition                             ;A58762;
    CLC                                                                  ;A58766;
    ADC.W #$02A0                                                         ;A58767;
    STA.L DraygonBody.rightSideResetXPosition                            ;A5876A;
    LDA.W Enemy.YPosition                                                ;A5876E;
    STA.L DraygonBody.resetYPosition                                     ;A58771;
    LDA.L DraygonBody.leftSideResetXPosition                             ;A58775;
    STA.W Enemy.XPosition                                                ;A58779; >.<
    LDA.L DraygonBody.resetYPosition                                     ;A5877C;
    STA.W Enemy.YPosition                                                ;A58780; >.<
    LDA.W #$0018*!SPF                                                    ;A58783;
    STA.L DraygonBody.swoopYAcceleration                                 ;A58786;
    RTS                                                                  ;A5878A;


;;; $878B: Draygon body function - fight intro - dance ;;;
Function_DraygonBody_FightIntro_Dance:
    JSR.W HandleFiringWallTurret                                         ;A5878B;
    LDX.W EnemyIndex                                                     ;A5878E; >.<
    LDA.W DraygonBody.functionTimer                                      ;A58791;
    CMP.W #$04D0*!SPF                                                    ;A58794;
    BPL .startFight                                                      ;A58797;
    JSR.W HandleDraygonFightIntroDance                                   ;A58799;
    INC.W DraygonBody.functionTimer                                      ;A5879C;
    RTS                                                                  ;A5879F;

  .startFight:
    LDA.W #Function_DraygonBody_SwoopRight_Setup                         ;A587A0;
    STA.W DraygonBody.function                                           ;A587A3;
    STZ.W DraygonBody.functionTimer                                      ;A587A6;
    RTS                                                                  ;A587A9;


;;; $87AA: Handle firing wall turret ;;;
HandleFiringWallTurret:
    LDA.W NMI_FrameCounter                                               ;A587AA;
    AND.W #$003F                                                         ;A587AD;
    BNE .return                                                          ;A587B0;
    JSL.L GenerateRandomNumber                                           ;A587B2;
    AND.W #$0003                                                         ;A587B6;
    CLC                                                                  ;A587B9;
    ADC.W #$0002                                                         ;A587BA;
    ASL                                                                  ;A587BD;
    TAX                                                                  ;A587BE;
    ASL                                                                  ;A587BF;
    TAY                                                                  ;A587C0;
    LDA.L ExtraEnemy8800,X                                               ;A587C1;
    BNE .return                                                          ;A587C5;
    LDA.W .XPosition,Y                                                   ;A587C7;
    STA.B DP_Temp12                                                      ;A587CA;
    LDA.W .YPosition,Y                                                   ;A587CC;
    STA.B DP_Temp14                                                      ;A587CF;
    LDY.W #EnemyProjectile_DraygonWallTurret                             ;A587D1;
    LDA.W #regional($0003, $0004)                                        ;A587D4;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A587D7;

  .return:
    RTS                                                                  ;A587DB;

; X/Y positions to spawn turret projectiles. First two entries are unused... and last entry is made unused by init AI
  .XPosition:
    dw $0040                                                             ;A587DC;
  .YPosition:
    dw       $0060                                                       ;A587DE;
    dw $0038,$00C0
    dw $0034,$012F ; Left turret
    dw $01CC,$0101 ; Top right turret
    dw $01CC,$015E ; Bottom right turret
    dw $01BC,$0188


;;; $87F4: Draygon body function - swoop right - setup ;;;
Function_DraygonBody_SwoopRight_Setup:
    JSR.W HandleFiringWallTurret                                         ;A587F4;
    LDX.W EnemyIndex                                                     ;A587F7; >.<
    JSR.W CalculateDraygonSwoopYPositions                                ;A587FA;
    LDA.W #Function_DraygonBody_SwoopRight_Descending                    ;A587FD;
    STA.W DraygonBody.function                                           ;A58800;
    LDA.W #InstList_DraygonBody_FacingRight_Reset                        ;A58803;
    STA.W Enemy.instList                                                 ;A58806;
    LDA.W #$0001                                                         ;A58809;
    STA.W Enemy.instTimer                                                ;A5880C;
    LDA.W #$0001                                                         ;A5880F;
    STA.L DraygonBody.facingDirection                                    ;A58812;
    RTS                                                                  ;A58816;


;;; $8817: Calculate Draygon swoop Y positions ;;;
CalculateDraygonSwoopYPositions:
    LDA.W #$0180                                                         ;A58817;
    STA.W Temp_NeverRead0E28                                             ;A5881A;
    LDA.W Temp_NeverRead0E28                                             ;A5881D; >.<
    STA.W Temp_SwoopYPosition                                            ;A58820;
    STZ.W Temp_SwoopYSpeed                                               ;A58823;
    STZ.W Temp_SwoopYPositionIndex                                       ;A58826;

  .loop:
    LDX.W EnemyIndex                                                     ;A58829; >.<
    LDA.L DraygonBody.swoopYAcceleration                                 ;A5882C;
    CLC                                                                  ;A58830;
    ADC.W Temp_SwoopYSpeed                                               ;A58831;
    STA.W Temp_SwoopYSpeed                                               ;A58834;
    XBA                                                                  ;A58837;
    AND.W #$00FF                                                         ;A58838;
    EOR.W #$FFFF                                                         ;A5883B;
    INC                                                                  ;A5883E;
    CLC                                                                  ;A5883F;
    ADC.W Temp_SwoopYPosition                                            ;A58840;
    CMP.L DraygonBody.resetYPosition                                     ;A58843;
    BMI +                                                                ;A58847;
    STA.W Temp_SwoopYPosition                                            ;A58849;
    LDX.W Temp_SwoopYPositionIndex                                       ;A5884C;
    STA.L DraygonSwoopYPositions,X                                       ;A5884F;
    INC.W Temp_SwoopYPositionIndex                                       ;A58853;
    INC.W Temp_SwoopYPositionIndex                                       ;A58856;
    INC.W Temp_SwoopYPositionIndex                                       ;A58859;
    INC.W Temp_SwoopYPositionIndex                                       ;A5885C;
    LDA.W Temp_SwoopYPositionIndex                                       ;A5885F;
    CMP.W #$0800                                                         ;A58862;
    BMI .loop                                                            ;A58865;

  .crash:
    BRA .crash                                                           ;A58867;

+   LDA.L DraygonBody.leftSideResetXPosition                             ;A58869;
    BMI .leftSideReset                                                   ;A5886D;
    SEC                                                                  ;A5886F;
    SBC.W SamusXPosition                                                 ;A58870;
    JSL.L NegateA_A0B067                                                 ;A58873;
    BRA +                                                                ;A58877;

  .leftSideReset:
    JSL.L NegateA_A0B067                                                 ;A58879;
    CLC                                                                  ;A5887D;
    ADC.W SamusXPosition                                                 ;A5887E;
    JSL.L NegateA_A0B067                                                 ;A58881;

+   STA.B DP_Temp2C                                                      ;A58885;
    STZ.B DP_Temp2A                                                      ;A58887;
    LDA.W Temp_SwoopYPositionIndex                                       ;A58889;
    LSR                                                                  ;A5888C;
    LSR                                                                  ;A5888D;
    STA.B DP_Temp2E                                                      ;A5888E;
    STZ.B DP_Temp30                                                      ;A58890;
    JSL.L UnsignedDivision_32bit_A0B761                                  ;A58892;
    LDA.B DP_Temp2C                                                      ;A58896;
    STA.W DraygonBody.XSpeed                                             ;A58898;
    LDA.B DP_Temp2A                                                      ;A5889B;
    STA.W DraygonBody.XSubSpeed                                          ;A5889D;
    LDA.W Enemy.YPosition                                                ;A588A0;
    LDX.W Temp_SwoopYPositionIndex                                       ;A588A3;
    STA.L DraygonSwoopYPositions,X                                       ;A588A6;
    STX.W DraygonBody.swoopYPositionIndex                                ;A588AA;
    STX.W DraygonBody.swoopDuration                                      ;A588AD;
    RTS                                                                  ;A588B0;


;;; $88B1: Draygon body function - swoop right - descending ;;;
Function_DraygonBody_SwoopRight_Descending:
    JSR.W HandleFiringWallTurret                                         ;A588B1;
    JSR.W HandleShortDraygonBreathBubbles                                ;A588B4;
    LDY.W EnemyIndex                                                     ;A588B7;
    LDX.W DraygonBody.swoopYPositionIndex                                ;A588BA;
    CPX.W #$0068                                                         ;A588BD;
    BNE .notIndex68                                                      ;A588C0;
    LDA.W #InstList_DraygonArms_FacingRight_NearSwoopApex                ;A588C2;
    STA.W Enemy[3].instList                                              ;A588C5;
    LDA.W #$0001                                                         ;A588C8;
    STA.W Enemy[3].instTimer                                             ;A588CB;

  .notIndex68:
    LDA.L DraygonSwoopYPositions,X                                       ;A588CE;
    STA.W Enemy.YPosition,Y                                              ;A588D2;
    DEC.W DraygonBody.swoopYPositionIndex                                ;A588D5;
    DEC.W DraygonBody.swoopYPositionIndex                                ;A588D8;
    DEC.W DraygonBody.swoopYPositionIndex                                ;A588DB;
    DEC.W DraygonBody.swoopYPositionIndex                                ;A588DE;
    LDA.W DraygonBody.swoopYPositionIndex                                ;A588E1;
    BEQ .apex                                                            ;A588E4;
    LDA.W Enemy.XSubPosition                                             ;A588E6;
    CLC                                                                  ;A588E9;
    ADC.W DraygonBody.XSubSpeed                                          ;A588EA;
    STA.W Enemy.XSubPosition                                             ;A588ED;
    LDA.W Enemy.XPosition                                                ;A588F0;
    ADC.W DraygonBody.XSpeed                                             ;A588F3;
    STA.W Enemy.XPosition                                                ;A588F6;
    RTS                                                                  ;A588F9;

  .apex:
    LDA.W #Function_DraygonBody_SwoopRight_Apex                          ;A588FA;
    STA.W DraygonBody.function                                           ;A588FD;
    RTS                                                                  ;A58900;


if !FEATURE_KEEP_UNREFERENCED
;;; $8901: Unused.  ;;;
UNUSED_Draygon_FireGoop_A58901:
; Fire goop?
    LDA.W NMI_FrameCounter                                               ;A58901;
    AND.W #$000F                                                         ;A58904;
    BNE .return                                                          ;A58907;
    LDA.W #InstList_DraygonBody_FacingLeft_FireGoop                      ;A58909;
    STA.W Enemy.instList                                                 ;A5890C;
    LDA.L DraygonBody.facingDirection                                    ;A5890F;
    BEQ .keepLeft                                                        ;A58913;
    LDA.W #InstList_DraygonBody_FacingRight_FireGoop                     ;A58915;
    STA.W Enemy.instList                                                 ;A58918;

  .keepLeft:
    LDA.W #$0001                                                         ;A5891B;
    STA.W Enemy.instTimer                                                ;A5891E;

  .return:
    RTS                                                                  ;A58921;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8922: Draygon body function - swoop right - apex ;;;
Function_DraygonBody_SwoopRight_Apex:
    JSR.W HandleFiringWallTurret                                         ;A58922;
    LDX.W EnemyIndex                                                     ;A58925; >.<
    LDA.W #$02A0                                                         ;A58928;
    SEC                                                                  ;A5892B;
    SBC.W Enemy.XPosition                                                ;A5892C;
    STA.B DP_Temp2C                                                      ;A5892F;
    STZ.B DP_Temp2A                                                      ;A58931;
    LDA.W DraygonBody.swoopDuration                                      ;A58933;
    LSR                                                                  ;A58936;
    LSR                                                                  ;A58937;
    STA.B DP_Temp2E                                                      ;A58938;
    STZ.B DP_Temp30                                                      ;A5893A;
    JSL.L UnsignedDivision_32bit_A0B761                                  ;A5893C;
    LDA.B DP_Temp2C                                                      ;A58940;
    STA.W DraygonBody.XSpeed                                             ;A58942;
    LDA.B DP_Temp2A                                                      ;A58945;
    STA.W DraygonBody.XSubSpeed                                          ;A58947;
    LDA.W #Function_DraygonBody_SwoopRight_Ascending                     ;A5894A;
    STA.W DraygonBody.function                                           ;A5894D;
    RTS                                                                  ;A58950;


;;; $8951: Draygon body function - swoop right - ascending ;;;
Function_DraygonBody_SwoopRight_Ascending:
; [random number] % 2: 0 = goop, 1 = swoop
    JSR.W HandleFiringWallTurret                                         ;A58951;
    LDY.W EnemyIndex                                                     ;A58954;
    LDX.W DraygonBody.swoopYPositionIndex                                ;A58957;
    CPX.W #$0068                                                         ;A5895A;
    BNE .notIndex68                                                      ;A5895D;
    LDA.W #InstList_DraygonArms_FacingRight_Idle_0                       ;A5895F;
    STA.W Enemy[3].instList                                              ;A58962;
    LDA.W #$0001                                                         ;A58965;
    STA.W Enemy[3].instTimer                                             ;A58968;

  .notIndex68:
    LDA.L DraygonSwoopYPositions,X                                       ;A5896B;
    STA.W Enemy.YPosition,Y                                              ;A5896F;
    INC.W DraygonBody.swoopYPositionIndex                                ;A58972;
    INC.W DraygonBody.swoopYPositionIndex                                ;A58975;
    INC.W DraygonBody.swoopYPositionIndex                                ;A58978;
    INC.W DraygonBody.swoopYPositionIndex                                ;A5897B;
    LDA.W DraygonBody.swoopYPositionIndex                                ;A5897E;
    CMP.W DraygonBody.swoopDuration                                      ;A58981;
    BEQ +                                                                ;A58984;
    LDA.W Enemy.XSubPosition                                             ;A58986;
    CLC                                                                  ;A58989;
    ADC.W DraygonBody.XSubSpeed                                          ;A5898A;
    STA.W Enemy.XSubPosition                                             ;A5898D;
    LDA.W Enemy.XPosition                                                ;A58990;
    ADC.W DraygonBody.XSpeed                                             ;A58993;
    STA.W Enemy.XPosition                                                ;A58996;
    RTS                                                                  ;A58999;

+   STZ.W DraygonBody.swoopYPositionIndex                                ;A5899A;
    LDA.W RandomNumberSeed                                               ;A5899D;
    AND.W #$0001                                                         ;A589A0;
    BEQ .goopLeft                                                        ;A589A3;
    LDA.W #Function_DraygonBody_SwoopLeft_Setup                          ;A589A5;
    STA.W DraygonBody.function                                           ;A589A8;
    RTS                                                                  ;A589AB;

  .goopLeft:
    LDA.W #Function_DraygonBody_GoopLeft_Setup                           ;A589AC;
    STA.W DraygonBody.function                                           ;A589AF;
    RTS                                                                  ;A589B2;


;;; $89B3: Draygon body function - swoop left - setup ;;;
Function_DraygonBody_SwoopLeft_Setup:
; Uses Temp_SwoopYPositionIndex(!) which was calculated as part of CalculateDraygonSwoopYPositions
; DraygonBody.swoopDuration contains the same value and is part of enemy RAM instead of a random temporary >_<;
    JSR.W HandleFiringWallTurret                                         ;A589B3;
    LDX.W EnemyIndex                                                     ;A589B6; >.<
    LDA.L DraygonBody.rightSideResetXPosition                            ;A589B9;
    SEC                                                                  ;A589BD;
    SBC.W SamusXPosition                                                 ;A589BE;
    JSL.L NegateA_A0B067                                                 ;A589C1;
    STA.B DP_Temp2C                                                      ;A589C5;
    STZ.B DP_Temp2A                                                      ;A589C7;
    LDA.W Temp_SwoopYPositionIndex                                       ;A589C9;
    LSR                                                                  ;A589CC;
    LSR                                                                  ;A589CD;
    STA.B DP_Temp2E                                                      ;A589CE;
    STZ.B DP_Temp30                                                      ;A589D0;
    JSL.L UnsignedDivision_32bit_A0B761                                  ;A589D2;
    LDA.B DP_Temp2C                                                      ;A589D6;
    STA.W DraygonBody.XSpeed                                             ;A589D8;
    LDA.B DP_Temp2A                                                      ;A589DB;
    STA.W DraygonBody.XSubSpeed                                          ;A589DD;
    LDA.W #Function_DraygonBody_SwoopLeft_Descending                     ;A589E0;
    STA.W DraygonBody.function                                           ;A589E3;
    LDA.W #InstList_DraygonBody_FacingLeft_Reset                         ;A589E6;
    STA.W Enemy.instList                                                 ;A589E9;
    LDA.W #$0001                                                         ;A589EC;
    STA.W Enemy.instTimer                                                ;A589EF;
    LDA.W #$0000                                                         ;A589F2;
    STA.L DraygonBody.facingDirection                                    ;A589F5;
    LDA.W DraygonBody.swoopDuration                                      ;A589F9;
    STA.W DraygonBody.swoopYPositionIndex                                ;A589FC;
    RTS                                                                  ;A589FF;


;;; $8A00: Draygon body function - swoop left - descending ;;;
Function_DraygonBody_SwoopLeft_Descending:
    JSR.W HandleFiringWallTurret                                         ;A58A00;
    JSR.W HandleShortDraygonBreathBubbles                                ;A58A03;
    LDY.W EnemyIndex                                                     ;A58A06;
    LDX.W DraygonBody.swoopYPositionIndex                                ;A58A09;
    CPX.W #$0068                                                         ;A58A0C;
    BNE .notIndex68                                                      ;A58A0F;
    LDA.W #InstList_DraygonArms_FacingLeft_NearSwoopApex                 ;A58A11;
    STA.W Enemy[3].instList                                              ;A58A14;
    LDA.W #$0001                                                         ;A58A17;
    STA.W Enemy[3].instTimer                                             ;A58A1A;

  .notIndex68:
    LDA.L DraygonSwoopYPositions,X                                       ;A58A1D;
    STA.W Enemy.YPosition,Y                                              ;A58A21;
    DEC.W DraygonBody.swoopYPositionIndex                                ;A58A24;
    DEC.W DraygonBody.swoopYPositionIndex                                ;A58A27;
    DEC.W DraygonBody.swoopYPositionIndex                                ;A58A2A;
    DEC.W DraygonBody.swoopYPositionIndex                                ;A58A2D;
    LDA.W DraygonBody.swoopYPositionIndex                                ;A58A30;
    BEQ .apex                                                            ;A58A33;
    LDA.W Enemy.XSubPosition                                             ;A58A35;
    SEC                                                                  ;A58A38;
    SBC.W DraygonBody.XSubSpeed                                          ;A58A39;
    STA.W Enemy.XSubPosition                                             ;A58A3C;
    LDA.W Enemy.XPosition                                                ;A58A3F;
    SBC.W DraygonBody.XSpeed                                             ;A58A42;
    STA.W Enemy.XPosition                                                ;A58A45;
    RTS                                                                  ;A58A48;

  .apex:
    LDA.W #Function_DraygonBody_SwoopLeft_Apex                           ;A58A49;
    STA.W DraygonBody.function                                           ;A58A4C;
    RTS                                                                  ;A58A4F;


;;; $8A50: Draygon body function - swoop left - apex ;;;
Function_DraygonBody_SwoopLeft_Apex:
    JSR.W HandleFiringWallTurret                                         ;A58A50;
    LDX.W EnemyIndex                                                     ;A58A53; >.<
    LDA.L DraygonBody.leftSideResetXPosition                             ;A58A56;
    BMI .leftSideReset                                                   ;A58A5A;
    LDA.W Enemy.XPosition                                                ;A58A5C;
    SEC                                                                  ;A58A5F;
    SBC.L DraygonBody.leftSideResetXPosition                             ;A58A60;
    BRA +                                                                ;A58A64;

  .leftSideReset:
    EOR.W #$FFFF                                                         ;A58A66;
    INC                                                                  ;A58A69;
    CLC                                                                  ;A58A6A;
    ADC.W Enemy.XPosition                                                ;A58A6B;

+   STA.B DP_Temp2C                                                      ;A58A6E;
    STZ.B DP_Temp2A                                                      ;A58A70;
    LDA.W DraygonBody.swoopDuration                                      ;A58A72;
    LSR                                                                  ;A58A75;
    LSR                                                                  ;A58A76;
    STA.B DP_Temp2E                                                      ;A58A77;
    STZ.B DP_Temp30                                                      ;A58A79;
    JSL.L UnsignedDivision_32bit_A0B761                                  ;A58A7B;
    LDA.B DP_Temp2C                                                      ;A58A7F;
    STA.W DraygonBody.XSpeed                                             ;A58A81;
    LDA.B DP_Temp2A                                                      ;A58A84;
    STA.W DraygonBody.XSubSpeed                                          ;A58A86;
    LDA.W #Function_DraygonBody_SwoopLeft_Ascending                      ;A58A89;
    STA.W DraygonBody.function                                           ;A58A8C;
    RTS                                                                  ;A58A8F;


;;; $8A90: Draygon body function - swoop left - ascending ;;;
Function_DraygonBody_SwoopLeft_Ascending:
; [random number] % 2: 0 = goop, 1 = swoop
    JSR.W HandleFiringWallTurret                                         ;A58A90;
    JSR.W HandleShortDraygonBreathBubbles                                ;A58A93;
    LDY.W EnemyIndex                                                     ;A58A96;
    LDX.W DraygonBody.swoopYPositionIndex                                ;A58A99;
    CPX.W #$0068                                                         ;A58A9C;
    BNE +                                                                ;A58A9F;
    LDA.W #InstList_DraygonArms_FacingLeft_Idle_0                        ;A58AA1;
    STA.W Enemy[3].instList                                              ;A58AA4;
    LDA.W #$0001                                                         ;A58AA7;
    STA.W Enemy[3].instTimer                                             ;A58AAA;

+   LDA.L DraygonSwoopYPositions,X                                       ;A58AAD;
    STA.W Enemy.YPosition,Y                                              ;A58AB1;
    INC.W DraygonBody.swoopYPositionIndex                                ;A58AB4;
    INC.W DraygonBody.swoopYPositionIndex                                ;A58AB7;
    INC.W DraygonBody.swoopYPositionIndex                                ;A58ABA;
    INC.W DraygonBody.swoopYPositionIndex                                ;A58ABD;
    LDA.W DraygonBody.swoopYPositionIndex                                ;A58AC0;
    CMP.W DraygonBody.swoopDuration                                      ;A58AC3;
    BEQ .chooseAttack                                                    ;A58AC6;
    LDA.W Enemy.XSubPosition                                             ;A58AC8;
    SEC                                                                  ;A58ACB;
    SBC.W DraygonBody.XSubSpeed                                          ;A58ACC;
    STA.W Enemy.XSubPosition                                             ;A58ACF;
    LDA.W Enemy.XPosition                                                ;A58AD2;
    SBC.W DraygonBody.XSpeed                                             ;A58AD5;
    STA.W Enemy.XPosition                                                ;A58AD8;
    RTS                                                                  ;A58ADB;

  .chooseAttack:
    LDA.W RandomNumberSeed                                               ;A58ADC;
    AND.W #$0001                                                         ;A58ADF;
    BEQ .goop                                                            ;A58AE2;
    LDA.W #Function_DraygonBody_SwoopRight_Setup                         ;A58AE4;
    STA.W DraygonBody.function                                           ;A58AE7;
    STZ.W DraygonBody.swoopYPositionIndex                                ;A58AEA;
    LDA.L DraygonBody.leftSideResetXPosition                             ;A58AED;
    STA.W Enemy.XPosition                                                ;A58AF1;
    LDA.L DraygonBody.resetYPosition                                     ;A58AF4;
    STA.W Enemy.YPosition                                                ;A58AF8;
    RTS                                                                  ;A58AFB;

  .goop:
    LDA.W #Function_DraygonBody_GoopRight_Setup                          ;A58AFC;
    STA.W DraygonBody.function                                           ;A58AFF;
    LDA.L DraygonBody.leftSideResetXPosition                             ;A58B02;
    STA.W Enemy.XPosition                                                ;A58B06;
    RTS                                                                  ;A58B09;


;;; $8B0A: Draygon body function - goop right - setup ;;;
Function_DraygonBody_GoopRight_Setup:
    JSR.W HandleFiringWallTurret                                         ;A58B0A;
    LDA.W #$FFB0                                                         ;A58B0D;
    STA.W Enemy.XPosition                                                ;A58B10;
    LDA.W #$0180                                                         ;A58B13;
    STA.W Enemy.YPosition                                                ;A58B16;
    LDA.W #$10000*!SPF                                                   ;A58B19;
    STA.W DraygonBody.XSubSpeed                                          ;A58B1C;
    LDA.W #$10000*!SPF>>$10                                              ;A58B1F;
    STA.W DraygonBody.XSpeed                                             ;A58B22;
    LDA.W #$0000                                                         ;A58B25;
    STA.L DraygonBody.goopYOscillationAngle                              ;A58B28;
    LDA.W #InstList_DraygonArms_FacingRight_NearSwoopApex                ;A58B2C;
    STA.W Enemy[3].instList                                              ;A58B2F;
    LDA.W #$0001                                                         ;A58B32;
    STA.W Enemy[3].instTimer                                             ;A58B35;
    LDA.W #Function_DraygonBody_GoopRight_MoveUntilSamusInRange          ;A58B38;
    STA.W DraygonBody.function                                           ;A58B3B;
    LDA.W #InstList_DraygonBody_FacingRight_Reset                        ;A58B3E;
    STA.W Enemy.instList                                                 ;A58B41;
    LDA.W #$0001                                                         ;A58B44;
    STA.W Enemy.instTimer                                                ;A58B47;
    LDA.W #$0001                                                         ;A58B4A;
    STA.L DraygonBody.facingDirection                                    ;A58B4D;
    RTS                                                                  ;A58B51;


;;; $8B52: Draygon body function - goop right - move until Samus in range ;;;
Function_DraygonBody_GoopRight_MoveUntilSamusInRange:
    JSR.W HandleFiringWallTurret                                         ;A58B52;
    JSR.W HandleShortDraygonBreathBubbles                                ;A58B55;
    LDA.W Enemy.XPosition                                                ;A58B58;
    SEC                                                                  ;A58B5B;
    SBC.W SamusXPosition                                                 ;A58B5C;
    JSL.L NegateA_A0B067                                                 ;A58B5F;
    CMP.W #$00D0                                                         ;A58B63;
    BPL .tooFar                                                          ;A58B66;
    LDA.W #Function_DraygonBody_GoopRight_FiringGoops                    ;A58B68;
    STA.W DraygonBody.function                                           ;A58B6B;
    LDA.W #$0010                                                         ;A58B6E;
    STA.L DraygonBody.goopCounter                                        ;A58B71;
    RTS                                                                  ;A58B75;

  .tooFar:
    LDA.W #$0020                                                         ;A58B76;
    STA.W Temp_TargetYPosition                                           ;A58B79;
    LDA.L DraygonBody.goopYOscillationAngle                              ;A58B7C;
    JSL.L EightBitCosineMultiplication_A0B0B2                            ;A58B80;
    CLC                                                                  ;A58B84;
    ADC.W #$0180                                                         ;A58B85;
    STA.W Enemy.YPosition                                                ;A58B88;
    LDA.L DraygonBody.goopYOscillationAngle                              ;A58B8B;
    CLC                                                                  ;A58B8F;
    ADC.W #$0001                                                         ;A58B90;
    AND.W #$00FF                                                         ;A58B93;
    STA.L DraygonBody.goopYOscillationAngle                              ;A58B96;
    LDA.W Enemy.XSubPosition                                             ;A58B9A;
    CLC                                                                  ;A58B9D;
    ADC.W DraygonBody.XSubSpeed                                          ;A58B9E;
    STA.W Enemy.XSubPosition                                             ;A58BA1;
    LDA.W Enemy.XPosition                                                ;A58BA4;
    ADC.W DraygonBody.XSpeed                                             ;A58BA7;
    STA.W Enemy.XPosition                                                ;A58BAA;
    RTS                                                                  ;A58BAD;


;;; $8BAE: Draygon body function - goop right - firing goops ;;;
Function_DraygonBody_GoopRight_FiringGoops:
    JSR.W HandleFiringWallTurret                                         ;A58BAE;
    LDA.W XSpeedDivisor                                                  ;A58BB1;
    BNE .SamusGooped                                                     ;A58BB4;
    LDA.W RandomNumberSeed                                               ;A58BB6;
    AND.W #$000F                                                         ;A58BB9;
    BNE .noGoop                                                          ;A58BBC;
    LDA.L DraygonBody.goopCounter                                        ;A58BBE;
    DEC                                                                  ;A58BC2;
    STA.L DraygonBody.goopCounter                                        ;A58BC3;
    BEQ .reloadSpeedDivisor                                              ;A58BC7;
    LDY.W #InstList_DraygonBody_FacingRight_FireGoop                     ;A58BC9;
    STY.W Enemy.instList                                                 ;A58BCC;
    LDA.W #$0001                                                         ;A58BCF;
    STA.W Enemy.instTimer                                                ;A58BD2;

  .noGoop:
    LDA.W #$0020                                                         ;A58BD5;
    STA.W Temp_TargetYPosition                                           ;A58BD8;
    LDA.L DraygonBody.goopYOscillationAngle                              ;A58BDB;
    JSL.L EightBitCosineMultiplication_A0B0B2                            ;A58BDF;
    CLC                                                                  ;A58BE3;
    ADC.W #$0180                                                         ;A58BE4;
    STA.W Enemy.YPosition                                                ;A58BE7;
    LDA.L DraygonBody.goopYOscillationAngle                              ;A58BEA;
    CLC                                                                  ;A58BEE;
    ADC.W #$0001                                                         ;A58BEF;
    AND.W #$00FF                                                         ;A58BF2;
    STA.L DraygonBody.goopYOscillationAngle                              ;A58BF5;
    LDA.W Enemy.XSubPosition                                             ;A58BF9;
    CLC                                                                  ;A58BFC;
    ADC.W DraygonBody.XSubSpeed                                          ;A58BFD;
    STA.W Enemy.XSubPosition                                             ;A58C00;
    LDA.W Enemy.XPosition                                                ;A58C03;
    ADC.W DraygonBody.XSpeed                                             ;A58C06;
    STA.W Enemy.XPosition                                                ;A58C09;
    BMI .return                                                          ;A58C0C;
    CMP.W #$02A0                                                         ;A58C0E;
    BPL .reloadSpeedDivisor                                              ;A58C11;

  .return:
    RTS                                                                  ;A58C13;

  .reloadSpeedDivisor:
    LDA.W XSpeedDivisor                                                  ;A58C14;
    BEQ .done                                                            ;A58C17;

  .SamusGooped:
    LDA.W #Function_DraygonBody_ChaseSamus                               ;A58C19;
    STA.W DraygonBody.function                                           ;A58C1C;
    RTS                                                                  ;A58C1F;

  .done:
    LDA.W #InstList_DraygonArms_FacingRight_Idle_0                       ;A58C20;
    STA.W Enemy[3].instList                                              ;A58C23;
    LDA.W #$0001                                                         ;A58C26;
    STA.W Enemy[3].instTimer                                             ;A58C29;
    LDA.W #Function_DraygonBody_GoopRight_MoveUntilOffScreen             ;A58C2C;
    STA.W DraygonBody.function                                           ;A58C2F;
    RTS                                                                  ;A58C32;


;;; $8C33: Draygon body function - goop right - move until off-screen ;;;
Function_DraygonBody_GoopRight_MoveUntilOffScreen:
    JSR.W HandleShortDraygonBreathBubbles                                ;A58C33;
    LDA.W #$0020                                                         ;A58C36;
    STA.W Temp_TargetYPosition                                           ;A58C39;
    LDA.L DraygonBody.goopYOscillationAngle                              ;A58C3C;
    JSL.L EightBitCosineMultiplication_A0B0B2                            ;A58C40;
    CLC                                                                  ;A58C44;
    ADC.W #$0180                                                         ;A58C45;
    STA.W Enemy.YPosition                                                ;A58C48;
    LDA.L DraygonBody.goopYOscillationAngle                              ;A58C4B;
    CLC                                                                  ;A58C4F;
    ADC.W #$0001                                                         ;A58C50;
    AND.W #$00FF                                                         ;A58C53;
    STA.L DraygonBody.goopYOscillationAngle                              ;A58C56;
    LDA.W Enemy.XSubPosition                                             ;A58C5A;
    CLC                                                                  ;A58C5D;
    ADC.W DraygonBody.XSubSpeed                                          ;A58C5E;
    STA.W Enemy.XSubPosition                                             ;A58C61;
    LDA.W Enemy.XPosition                                                ;A58C64;
    ADC.W DraygonBody.XSpeed                                             ;A58C67;
    STA.W Enemy.XPosition                                                ;A58C6A;
    BMI .return                                                          ;A58C6D;
    CMP.W #$02A0                                                         ;A58C6F;
    BPL .done                                                            ;A58C72;

  .return:
    RTS                                                                  ;A58C74;

  .done:
    LDA.W #Function_DraygonBody_SwoopLeft_Setup                          ;A58C75;
    STA.W DraygonBody.function                                           ;A58C78;
    LDA.W #$0250                                                         ;A58C7B;
    STA.W Enemy.XPosition                                                ;A58C7E;
    LDA.W #$FFB0                                                         ;A58C81;
    STA.W Enemy.YPosition                                                ;A58C84;
    LDA.W DraygonBody.swoopDuration                                      ;A58C87;
    STA.W DraygonBody.swoopYPositionIndex                                ;A58C8A;
    RTS                                                                  ;A58C8D;


;;; $8C8E: Draygon body function - goop left - setup ;;;
Function_DraygonBody_GoopLeft_Setup:
    LDA.L DraygonBody.rightSideResetXPosition                            ;A58C8E;
    STA.W Enemy.XPosition                                                ;A58C92;
    LDA.W #$0180                                                         ;A58C95;
    STA.W Enemy.YPosition                                                ;A58C98;
    LDA.W #$10000*!SPF                                                   ;A58C9B;
    STA.W DraygonBody.XSubSpeed                                          ;A58C9E;
    LDA.W #$10000*!SPF>>$10                                              ;A58CA1;
    STA.W DraygonBody.XSpeed                                             ;A58CA4;
    LDA.W #$0000                                                         ;A58CA7;
    STA.L DraygonBody.goopYOscillationAngle                              ;A58CAA;
    LDA.W #InstList_DraygonArms_FacingRight_NearSwoopApex                ;A58CAE;
    STA.W Enemy[3].instList                                              ;A58CB1;
    LDA.W #$0001                                                         ;A58CB4;
    STA.W Enemy[3].instTimer                                             ;A58CB7;
    LDA.W #Function_DraygonBody_GoopLeft_MoveUntilSamusInRange           ;A58CBA;
    STA.W DraygonBody.function                                           ;A58CBD;
    LDA.W #InstList_DraygonBody_FacingLeft_Reset                         ;A58CC0;
    STA.W Enemy.instList                                                 ;A58CC3;
    LDA.W #$0001                                                         ;A58CC6;
    STA.W Enemy.instTimer                                                ;A58CC9;
    LDA.W #$0000                                                         ;A58CCC;
    STA.L DraygonBody.facingDirection                                    ;A58CCF;
    RTS                                                                  ;A58CD3;


;;; $8CD4: Draygon body function - goop left - move until Samus in range ;;;
Function_DraygonBody_GoopLeft_MoveUntilSamusInRange:
    JSR.W HandleFiringWallTurret                                         ;A58CD4;
    JSR.W HandleShortDraygonBreathBubbles                                ;A58CD7;
    LDA.W Enemy.XPosition                                                ;A58CDA;
    SEC                                                                  ;A58CDD;
    SBC.W SamusXPosition                                                 ;A58CDE;
    JSL.L NegateA_A0B067                                                 ;A58CE1;
    CMP.W #$00D0                                                         ;A58CE5;
    BPL .tooFar                                                          ;A58CE8;
    LDA.W #Function_DraygonBody_GoopLeft_FiringGoops                     ;A58CEA;
    STA.W DraygonBody.function                                           ;A58CED;
    LDA.W #$0010                                                         ;A58CF0;
    STA.L DraygonBody.goopCounter                                        ;A58CF3;
    RTS                                                                  ;A58CF7;

  .tooFar:
    LDA.W #$0020                                                         ;A58CF8;
    STA.W Temp_TargetYPosition                                           ;A58CFB;
    LDA.L DraygonBody.goopYOscillationAngle                              ;A58CFE;
    JSL.L EightBitCosineMultiplication_A0B0B2                            ;A58D02;
    CLC                                                                  ;A58D06;
    ADC.W #$0180                                                         ;A58D07;
    STA.W Enemy.YPosition                                                ;A58D0A;
    LDA.L DraygonBody.goopYOscillationAngle                              ;A58D0D;
    CLC                                                                  ;A58D11;
    ADC.W #$0001                                                         ;A58D12;
    AND.W #$00FF                                                         ;A58D15;
    STA.L DraygonBody.goopYOscillationAngle                              ;A58D18;
    LDA.W Enemy.XSubPosition                                             ;A58D1C;
    SEC                                                                  ;A58D1F;
    SBC.W DraygonBody.XSubSpeed                                          ;A58D20;
    STA.W Enemy.XSubPosition                                             ;A58D23;
    LDA.W Enemy.XPosition                                                ;A58D26;
    SBC.W DraygonBody.XSpeed                                             ;A58D29;
    STA.W Enemy.XPosition                                                ;A58D2C;
    RTS                                                                  ;A58D2F;


;;; $8D30: Draygon body function - goop left - firing goops ;;;
Function_DraygonBody_GoopLeft_FiringGoops:
    LDA.W XSpeedDivisor                                                  ;A58D30;
    BNE .SamusGooped                                                     ;A58D33;
    LDA.W RandomNumberSeed                                               ;A58D35;
    AND.W #$000F                                                         ;A58D38;
    BNE .noGoop                                                          ;A58D3B;
    LDA.L DraygonBody.goopCounter                                        ;A58D3D;
    DEC                                                                  ;A58D41;
    STA.L DraygonBody.goopCounter                                        ;A58D42;
    BEQ .reloadSpeedDivisor                                              ;A58D46;
    LDY.W #InstList_DraygonBody_FacingLeft_FireGoop                      ;A58D48;
    STY.W Enemy.instList                                                 ;A58D4B;
    LDA.W #$0001                                                         ;A58D4E;
    STA.W Enemy.instTimer                                                ;A58D51;

  .noGoop:
    LDA.W #$0020                                                         ;A58D54;
    STA.W Temp_TargetYPosition                                           ;A58D57;
    LDA.L DraygonBody.goopYOscillationAngle                              ;A58D5A;
    JSL.L EightBitCosineMultiplication_A0B0B2                            ;A58D5E;
    CLC                                                                  ;A58D62;
    ADC.W #$0180                                                         ;A58D63;
    STA.W Enemy.YPosition                                                ;A58D66;
    LDA.L DraygonBody.goopYOscillationAngle                              ;A58D69;
    CLC                                                                  ;A58D6D;
    ADC.W #$0001                                                         ;A58D6E;
    AND.W #$00FF                                                         ;A58D71;
    STA.L DraygonBody.goopYOscillationAngle                              ;A58D74;
    LDA.W Enemy.XSubPosition                                             ;A58D78;
    SEC                                                                  ;A58D7B;
    SBC.W DraygonBody.XSubSpeed                                          ;A58D7C;
    STA.W Enemy.XSubPosition                                             ;A58D7F;
    LDA.W Enemy.XPosition                                                ;A58D82;
    SBC.W DraygonBody.XSpeed                                             ;A58D85;
    STA.W Enemy.XPosition                                                ;A58D88;
    BPL .return                                                          ;A58D8B;
    CMP.W #$FFB0                                                         ;A58D8D;
    BMI .reloadSpeedDivisor                                              ;A58D90;

  .return:
    RTS                                                                  ;A58D92;

  .reloadSpeedDivisor:
    LDA.W XSpeedDivisor                                                  ;A58D93;
    BEQ .done                                                            ;A58D96;

  .SamusGooped:
    LDA.W #Function_DraygonBody_ChaseSamus                               ;A58D98;
    STA.W DraygonBody.function                                           ;A58D9B;
    RTS                                                                  ;A58D9E;

  .done:
    LDA.W #InstList_DraygonArms_FacingLeft_Idle_0                        ;A58D9F;
    STA.W Enemy[3].instList                                              ;A58DA2;
    LDA.W #$0001                                                         ;A58DA5;
    STA.W Enemy[3].instTimer                                             ;A58DA8;
    LDA.W #Function_DraygonBody_GoopLeft_MoveUntilOffScreen              ;A58DAB;
    STA.W DraygonBody.function                                           ;A58DAE;
    RTS                                                                  ;A58DB1;


;;; $8DB2: Draygon body function - goop left - move until off-screen ;;;
Function_DraygonBody_GoopLeft_MoveUntilOffScreen:
    JSR.W HandleShortDraygonBreathBubbles                                ;A58DB2;
    LDA.W XSpeedDivisor                                                  ;A58DB5;
    BNE .SamusGooped                                                     ;A58DB8;
    LDA.W #$0020                                                         ;A58DBA;
    STA.W Temp_TargetYPosition                                           ;A58DBD;
    LDA.L DraygonBody.goopYOscillationAngle                              ;A58DC0;
    JSL.L EightBitCosineMultiplication_A0B0B2                            ;A58DC4;
    CLC                                                                  ;A58DC8;
    ADC.W #$0180                                                         ;A58DC9;
    STA.W Enemy.YPosition                                                ;A58DCC;
    LDA.L DraygonBody.goopYOscillationAngle                              ;A58DCF;
    CLC                                                                  ;A58DD3;
    ADC.W #$0001                                                         ;A58DD4;
    AND.W #$00FF                                                         ;A58DD7;
    STA.L DraygonBody.goopYOscillationAngle                              ;A58DDA;
    LDA.W Enemy.XSubPosition                                             ;A58DDE;
    SEC                                                                  ;A58DE1;
    SBC.W DraygonBody.XSubSpeed                                          ;A58DE2;
    STA.W Enemy.XSubPosition                                             ;A58DE5;
    LDA.W Enemy.XPosition                                                ;A58DE8;
    SBC.W DraygonBody.XSpeed                                             ;A58DEB;
    STA.W Enemy.XPosition                                                ;A58DEE;
    BPL .return                                                          ;A58DF1;
    CMP.W #$FFB0                                                         ;A58DF3;
    BMI .done                                                            ;A58DF6;

  .return:
    RTS                                                                  ;A58DF8;

  .SamusGooped:
    LDA.W #Function_DraygonBody_ChaseSamus                               ;A58DF9;
    STA.W DraygonBody.function                                           ;A58DFC;
    RTS                                                                  ;A58DFF;

  .done:
    LDA.W #Function_DraygonBody_SwoopRight_Setup                         ;A58E00;
    STA.W DraygonBody.function                                           ;A58E03;
    LDA.W #$FFB0                                                         ;A58E06;
    STA.W Enemy.XPosition                                                ;A58E09;
    LDA.W #$FFB0                                                         ;A58E0C;
    STA.W Enemy.YPosition                                                ;A58E0F;
    LDA.W DraygonBody.swoopDuration                                      ;A58E12;
    STA.W DraygonBody.swoopYPositionIndex                                ;A58E15;
    RTS                                                                  ;A58E18;


;;; $8E19: Draygon body function - chase Samus ;;;
Function_DraygonBody_ChaseSamus:
    JSR.W HandleFiringWallTurret                                         ;A58E19;
    LDA.W XSpeedDivisor                                                  ;A58E1C;
    BNE .SamusStillGooped                                                ;A58E1F;
    LDA.W #Function_DraygonBody_GrabbedSamus_FlyStraightUp               ;A58E21;
    STA.W DraygonBody.function                                           ;A58E24;
    RTS                                                                  ;A58E27;

  .SamusStillGooped:
    LDA.W Enemy.properties                                               ;A58E28;
    ORA.W #$0400                                                         ;A58E2B;
    STA.W Enemy.properties                                               ;A58E2E;
    LDY.W #$0008                                                         ;A58E31;
    LDA.L DraygonBody.facingDirection                                    ;A58E34;
    BNE .notLeft                                                         ;A58E38;
    LDY.W #$FFF8                                                         ;A58E3A;

  .notLeft:
    TYA                                                                  ;A58E3D;
    CLC                                                                  ;A58E3E;
    ADC.W Enemy.XPosition                                                ;A58E3F;
    SEC                                                                  ;A58E42;
    SBC.W SamusXPosition                                                 ;A58E43;
    JSL.L NegateA_A0B067                                                 ;A58E46;
    CMP.W #$0008                                                         ;A58E4A;
    BPL .notGrabbed                                                      ;A58E4D;
    LDA.W Enemy.YPosition                                                ;A58E4F;
    SEC                                                                  ;A58E52;
    SBC.W SamusYPosition                                                 ;A58E53;
    JSL.L NegateA_A0B067                                                 ;A58E56;
    CMP.W #$0008                                                         ;A58E5A;
    BPL .notGrabbed                                                      ;A58E5D;
    BRA .grab                                                            ;A58E5F;

  .notGrabbed:
    LDA.W SamusXPosition                                                 ;A58E61;
    SEC                                                                  ;A58E64;
    SBC.W Enemy.XPosition                                                ;A58E65;
    STA.B DP_Temp12                                                      ;A58E68;
    LDA.W SamusYPosition                                                 ;A58E6A;
    SEC                                                                  ;A58E6D;
    SBC.W Enemy.YPosition                                                ;A58E6E;
    STA.B DP_Temp14                                                      ;A58E71;
    JSL.L CalculateAngleOf_12_14_Offset                                  ;A58E73;
    EOR.W #$00FF                                                         ;A58E77;
    INC                                                                  ;A58E7A;
    CLC                                                                  ;A58E7B;
    ADC.W #$0040                                                         ;A58E7C;
    AND.W #$00FF                                                         ;A58E7F;
    STA.W Temp_AngleToMove                                               ;A58E82;
    STA.B DP_Temp12                                                      ;A58E85;
    LDA.W #$0002                                                         ;A58E87;
    STA.B DP_Temp14                                                      ;A58E8A;
    JSL.L Do_Some_Math_With_Sine_Cosine_Terrible_Label_Name              ;A58E8C; ($16.$18, $1A.$1C) = ([$14] * |cos([$12] * pi / 80h)|, [$14] * |sin([$12] * pi / 80h)|)
    LDA.B DP_Temp16                                                      ;A58E90;
    STA.W Temp_XSpeed                                                    ;A58E92;
    LDA.B DP_Temp18                                                      ;A58E95;
    STA.W Temp_XSubSpeed                                                 ;A58E97;
    LDA.B DP_Temp1A                                                      ;A58E9A;
    STA.W Temp_YSpeed                                                    ;A58E9C;
    LDA.B DP_Temp1C                                                      ;A58E9F;
    STA.W Temp_YSubSpeed                                                 ;A58EA1;
    JSL.L MoveEnemyAccordingToAngleAndXYSpeeds                           ;A58EA4;
    RTS                                                                  ;A58EA8;

  .grab:
    LDY.W #InstList_DraygonArms_FacingLeft_Grab                          ;A58EA9;
    LDA.L DraygonBody.facingDirection                                    ;A58EAC;
    BEQ .keepLeft                                                        ;A58EB0;
    LDY.W #InstList_DraygonArms_FacingRight_Grab                         ;A58EB2;

  .keepLeft:
    STY.W Enemy[3].instList                                              ;A58EB5;
    LDA.W #$0001                                                         ;A58EB8;
    STA.W Enemy[3].instTimer                                             ;A58EBB;
    LDA.W #$000D                                                         ;A58EBE;
    JSL.L Run_Samus_Command                                              ;A58EC1;
    AND.W #$FFFF                                                         ;A58EC5;
    BNE .retreat                                                         ;A58EC8;
    LDY.W #$0000                                                         ;A58ECA;
    LDA.L DraygonBody.facingDirection                                    ;A58ECD;
    BEQ .left                                                            ;A58ED1;
    LDY.W #$0001                                                         ;A58ED3;

  .left:
    TYA                                                                  ;A58ED6;
    JSL.L SetSamusIntoTheGrabbedByDraygonPose                            ;A58ED7;
    LDA.W #$0100                                                         ;A58EDB;
    STA.L DraygonBody.spiralXPosition                                    ;A58EDE;
    LDA.W #$0180                                                         ;A58EE2;
    STA.L DraygonBody.spiralYPosition                                    ;A58EE5;
    LDA.W #$0000                                                         ;A58EE9;
    STA.L DraygonBody.spiralXRadius                                      ;A58EEC;
    STA.L DraygonBody.spiralXSubRadius                                   ;A58EF0;
    LDA.W #$00C0                                                         ;A58EF4;
    STA.L DraygonBody.spiralAngle                                        ;A58EF7;
    LDA.W #$0800                                                         ;A58EFB;
    STA.L DraygonBody.spiralAngleDelta                                   ;A58EFE;
    LDA.W #Function_DraygonBody_GrabbedSamus_MovingToTargetPosition      ;A58F02;
    STA.W DraygonBody.function                                           ;A58F05;
    RTS                                                                  ;A58F08;

  .retreat:
    LDA.W #Function_DraygonBody_RepelledByGrapple                        ;A58F09;
    STA.W DraygonBody.function                                           ;A58F0C;
    RTS                                                                  ;A58F0F;


;;; $8F10: Draygon body function - repelled by grapple ;;;
Function_DraygonBody_RepelledByGrapple:
    LDA.W #GrappleBeamFunction_Dropped                                   ;A58F10;
    STA.W GrappleBeam_Function                                           ;A58F13;
    LDA.W #Function_DraygonBody_GrabbedSamus_FlailTail_FlyStraightUp     ;A58F16;
    STA.W DraygonBody.function                                           ;A58F19;
    RTS                                                                  ;A58F1C;


;;; $8F1D: Unused. RTS ;;;
RTS_A58F1D:
    RTS                                                                  ;A58F1D;


;;; $8F1E: Draygon body function - grabbed Samus - moving to target position ;;;
Function_DraygonBody_GrabbedSamus_MovingToTargetPosition:
    LDA.W GrappleConnectedFlags                                          ;A58F1E;
    BIT.W #$0001                                                         ;A58F21;
    BEQ .notGrappled                                                     ;A58F24;
    PHX                                                                  ;A58F26;
    LDX.W Enemy.ID                                                       ;A58F27;
    LDA.L EnemyHeaders_hurtAITime,X                                      ;A58F2A;
    AND.W #$00FF                                                         ;A58F2E;
    CLC                                                                  ;A58F31;
    ADC.W #$0008                                                         ;A58F32;
    STA.W Enemy.flashTimer                                               ;A58F35;
    PLX                                                                  ;A58F38;
    LDA.W Enemy.AI                                                       ;A58F39;
    ORA.W #$0002                                                         ;A58F3C;
    STA.W Enemy.AI                                                       ;A58F3F;
    RTS                                                                  ;A58F42;

  .notGrappled:
    LDA.W Enemy.XPosition                                                ;A58F43;
    SEC                                                                  ;A58F46;
    SBC.W #$0100                                                         ;A58F47;
    JSL.L NegateA_A0B067                                                 ;A58F4A;
    CMP.W #$0002                                                         ;A58F4E;
    BPL .notReachedTarget                                                ;A58F51;
    LDA.W Enemy.YPosition                                                ;A58F53;
    SEC                                                                  ;A58F56;
    SBC.W #$0180                                                         ;A58F57;
    JSL.L NegateA_A0B067                                                 ;A58F5A;
    CMP.W #$0002                                                         ;A58F5E;
    BPL .notReachedTarget                                                ;A58F61;
    BRA .reachedTargetPosition                                           ;A58F63;

  .notReachedTarget:
    LDA.W #$0100                                                         ;A58F65;
    SEC                                                                  ;A58F68;
    SBC.W Enemy.XPosition                                                ;A58F69;
    STA.B DP_Temp12                                                      ;A58F6C;
    LDA.W #$0180                                                         ;A58F6E;
    SEC                                                                  ;A58F71;
    SBC.W Enemy.YPosition                                                ;A58F72;
    STA.B DP_Temp14                                                      ;A58F75;
    JSL.L CalculateAngleOf_12_14_Offset                                  ;A58F77;
    EOR.W #$00FF                                                         ;A58F7B;
    INC                                                                  ;A58F7E;
    CLC                                                                  ;A58F7F;
    ADC.W #$0040                                                         ;A58F80;
    AND.W #$00FF                                                         ;A58F83;
    STA.W Temp_AngleToMove                                               ;A58F86;
    STA.B DP_Temp12                                                      ;A58F89;
    LDA.W #$0002                                                         ;A58F8B;
    STA.B DP_Temp14                                                      ;A58F8E;
    JSL.L Do_Some_Math_With_Sine_Cosine_Terrible_Label_Name              ;A58F90; ($16.$18, $1A.$1C) = ([$14] * |cos([$12] * pi / 80h)|, [$14] * |sin([$12] * pi / 80h)|)
    LDA.B DP_Temp16                                                      ;A58F94;
    STA.W Temp_XSpeed                                                    ;A58F96;
    LDA.B DP_Temp18                                                      ;A58F99;
    STA.W Temp_XSubSpeed                                                 ;A58F9B;
    LDA.B DP_Temp1A                                                      ;A58F9E;
    STA.W Temp_YSpeed                                                    ;A58FA0;
    LDA.B DP_Temp1C                                                      ;A58FA3;
    STA.W Temp_YSubSpeed                                                 ;A58FA5;
    JSL.L MoveEnemyAccordingToAngleAndXYSpeeds                           ;A58FA8;
    JSR.W MoveSamusWithDraygon                                           ;A58FAC;
    RTS                                                                  ;A58FAF;

  .reachedTargetPosition:
    LDA.W #Function_DraygonBody_GrabbedSamus_RisingSpiralMovement        ;A58FB0;
    STA.W DraygonBody.function                                           ;A58FB3;
    LDY.W #InstList_DraygonBody_FacingLeft_Roar                          ;A58FB6;
    LDA.L DraygonBody.facingDirection                                    ;A58FB9;
    BEQ .keepLeft                                                        ;A58FBD;
    LDY.W #InstList_DraygonBody_FacingRight_Roar                         ;A58FBF;

  .keepLeft:
    TYA                                                                  ;A58FC2;
    STA.W Enemy.instList,X                                               ;A58FC3;
    LDA.W #$0001                                                         ;A58FC6;
    STA.W Enemy.instTimer,X                                              ;A58FC9;
    LDA.W Enemy.properties                                               ;A58FCC;
    ORA.W #$0400                                                         ;A58FCF;
    STA.W Enemy.properties                                               ;A58FD2;
    RTS                                                                  ;A58FD5;


;;; $8FD6: Draygon body function - grabbed Samus - rising spiral movement ;;;
Function_DraygonBody_GrabbedSamus_RisingSpiralMovement:
    LDA.W GrappleConnectedFlags                                          ;A58FD6;
    BIT.W #$0001                                                         ;A58FD9;
    BEQ .notGrappled                                                     ;A58FDC;
    PHX                                                                  ;A58FDE;
    LDX.W Enemy.ID                                                       ;A58FDF;
    LDA.L EnemyHeaders_hurtAITime,X                                      ;A58FE2;
    AND.W #$00FF                                                         ;A58FE6;
    CLC                                                                  ;A58FE9;
    ADC.W #$0008                                                         ;A58FEA;
    STA.W Enemy.flashTimer                                               ;A58FED;
    PLX                                                                  ;A58FF0;
    LDA.W Enemy.AI                                                       ;A58FF1;
    ORA.W #$0002                                                         ;A58FF4;
    STA.W Enemy.AI                                                       ;A58FF7;
    RTS                                                                  ;A58FFA;

  .notGrappled:
    LDA.W RandomNumberSeed                                               ;A58FFB;
    AND.W #$00FF                                                         ;A58FFE;
    BNE .noSpank                                                         ;A59001;
    LDA.W #$0040                                                         ;A59003;
    STA.L DraygonBody.tailWhipTimer                                      ;A59006;
    LDA.W #Function_DraygonBody_GrabbedSamus_TailWhip                    ;A5900A;
    STA.W DraygonBody.function                                           ;A5900D;
    RTS                                                                  ;A59010;

  .noSpank:
    LDA.L DraygonBody.spiralXRadius                                      ;A59011;
    STA.W Temp_Unknown0E32                                               ;A59015;
    LDA.L DraygonBody.spiralAngle                                        ;A59018;
    JSL.L EightBitCosineMultiplication_A0B0B2                            ;A5901C;
    CLC                                                                  ;A59020;
    ADC.L DraygonBody.spiralXPosition                                    ;A59021;
    STA.W Enemy.XPosition                                                ;A59025;
    LDA.L DraygonBody.spiralXRadius                                      ;A59028;
    LSR                                                                  ;A5902C;
    LSR                                                                  ;A5902D;
    STA.W Temp_Unknown0E32                                               ;A5902E;
    LDA.L DraygonBody.spiralAngle                                        ;A59031;
    JSL.L EightBitNegativeSineMultiplication_A0B0C6                      ;A59035;
    CLC                                                                  ;A59039;
    ADC.L DraygonBody.spiralYPosition                                    ;A5903A;
    STA.W Enemy.YPosition                                                ;A5903E;
    LDA.W Enemy.frameCounter,X                                           ;A59041;
    AND.W #$0007                                                         ;A59044;
    BNE .noFoam                                                          ;A59047;
    LDA.W Enemy.XPosition                                                ;A59049;
    SEC                                                                  ;A5904C;
    SBC.W #$0020                                                         ;A5904D;
    STA.B DP_Temp12                                                      ;A59050;
    LDA.L DraygonBody.facingDirection                                    ;A59052;
    BEQ .left                                                            ;A59056;
    LDA.W Enemy.XPosition                                                ;A59058;
    CLC                                                                  ;A5905B;
    ADC.W #$0020                                                         ;A5905C;
    STA.B DP_Temp12                                                      ;A5905F;

  .left:
    LDA.W Enemy.YPosition                                                ;A59061;
    SEC                                                                  ;A59064;
    SBC.W #$0010                                                         ;A59065;
    STA.B DP_Temp14                                                      ;A59068;
    LDA.W #$003D                                                         ;A5906A;
    STA.B DP_Temp16                                                      ;A5906D;
    STZ.B DP_Temp18                                                      ;A5906F;
    JSL.L Create_Sprite_Object                                           ;A59071;

  .noFoam:
    LDA.L DraygonBody.spiralXSubRadius                                   ;A59075;
    CLC                                                                  ;A59079;
    ADC.W #$2000                                                         ;A5907A;
    STA.L DraygonBody.spiralXSubRadius                                   ;A5907D;
    LDA.L DraygonBody.spiralXRadius                                      ;A59081;
    ADC.W #$0000                                                         ;A59085;
    STA.L DraygonBody.spiralXRadius                                      ;A59088;
    CMP.W #$00A0                                                         ;A5908C;
    BPL .finalSpanking                                                   ;A5908F;
    LDA.L DraygonBody.spiralAngleDelta                                   ;A59091;
    SEC                                                                  ;A59095;
    SBC.W #$0001                                                         ;A59096;
    STA.L DraygonBody.spiralAngleDelta                                   ;A59099;
    AND.W #$FF00                                                         ;A5909D;
    XBA                                                                  ;A590A0;
    CLC                                                                  ;A590A1;
    ADC.L DraygonBody.spiralAngle                                        ;A590A2;
    AND.W #$00FF                                                         ;A590A6;
    STA.L DraygonBody.spiralAngle                                        ;A590A9;
    LDA.L DraygonBody.spiralYSubPosition                                 ;A590AD;
    SEC                                                                  ;A590B1;
    SBC.W #$4000                                                         ;A590B2;
    STA.L DraygonBody.spiralYSubPosition                                 ;A590B5;
    LDA.L DraygonBody.spiralYPosition                                    ;A590B9;
    SBC.W #$0000                                                         ;A590BD;
    STA.L DraygonBody.spiralYPosition                                    ;A590C0;
    CMP.W #$0040                                                         ;A590C4;
    BMI .finalSpanking                                                   ;A590C7;
    JSR.W MoveSamusWithDraygon                                           ;A590C9;
    RTS                                                                  ;A590CC;

  .finalSpanking:
    LDA.W #Function_DraygonBody_GrabbedSamus_FinalSpanking_Start         ;A590CD;
    STA.W DraygonBody.function                                           ;A590D0;
    RTS                                                                  ;A590D3;


;;; $90D4: Draygon body function - grabbed Samus - tail whip ;;;
Function_DraygonBody_GrabbedSamus_TailWhip:
    JSR.W MoveSamusWithDraygon                                           ;A590D4;
    LDA.L DraygonBody.tailWhipTimer                                      ;A590D7;
    DEC                                                                  ;A590DB;
    STA.L DraygonBody.tailWhipTimer                                      ;A590DC;
    BEQ .done                                                            ;A590E0;
    CMP.W #$003F                                                         ;A590E2;
    BEQ .getDirection                                                    ;A590E5;
    RTS                                                                  ;A590E7;

  .getDirection:
    LDY.W #InstList_DraygonTail_FacingLeft_TailWhip                      ;A590E8;
    LDA.L DraygonBody.facingDirection                                    ;A590EB;
    BEQ .keepLeft                                                        ;A590EF;
    LDY.W #InstList_DraygonTail_FacingRight_TailWhip_0                   ;A590F1;

  .keepLeft:
    STY.W Enemy[2].instList                                              ;A590F4;
    LDA.W #$0001                                                         ;A590F7;
    STA.W Enemy[2].instTimer                                             ;A590FA;
    RTS                                                                  ;A590FD;

  .done:
    LDA.W #Function_DraygonBody_GrabbedSamus_RisingSpiralMovement        ;A590FE;
    STA.W DraygonBody.function                                           ;A59101;
    RTS                                                                  ;A59104;


;;; $9105: Draygon body function - grabbed Samus - final tail whips - start ;;;
Function_DraygonBody_GrabbedSamus_FinalSpanking_Start:
    JSR.W MoveSamusWithDraygon                                           ;A59105;
    LDY.W #InstList_DraygonTail_FacingLeft_FinalTailWhips_0              ;A59108;
    LDA.L DraygonBody.facingDirection,X                                  ;A5910B;
    BEQ .keepLeft                                                        ;A5910F;
    LDY.W #InstList_DraygonTail_FacingRight_FinalTailWhips_0             ;A59111;

  .keepLeft:
    STY.W Enemy[2].instList                                              ;A59114;
    LDA.W #$0001                                                         ;A59117;
    STA.W Enemy[2].instTimer                                             ;A5911A;
    LDA.W #Function_DraygonBody_GrabbedSamus_FinalSpanking_Ongoing       ;A5911D;
    STA.W DraygonBody.function                                           ;A59120;
    RTS                                                                  ;A59123;


;;; $9124: Draygon body function - grabbed Samus - final tail whips - ongoing ;;;
Function_DraygonBody_GrabbedSamus_FinalSpanking_Ongoing:
; Draygon tail instruction list eventually sets Draygon body function = Function_DraygonBody_GrabbedSamus_FlailTail_FlyStraightUp
    JSR.W MoveSamusWithDraygon                                           ;A59124;
    RTS                                                                  ;A59127;


;;; $9128: Draygon body function - flail tail and fly straight up ;;;
Function_DraygonBody_GrabbedSamus_FlailTail_FlyStraightUp:
    JSL.L ReleaseSamusFromDraygon_external                               ;A59128;
    STZ.W GrappleConnectedFlags                                          ;A5912C;
    LDA.W #Function_DraygonBody_GrabbedSamus_FlyStraightUp               ;A5912F;
    STA.W DraygonBody.function                                           ;A59132;
    LDA.W Enemy.properties                                               ;A59135;
    AND.W #$FBFF                                                         ;A59138;
    STA.W Enemy.properties                                               ;A5913B;
    LDY.W #InstList_DraygonTail_FacingLeft_TailFlail                     ;A5913E;
    LDA.L DraygonBody.facingDirection                                    ;A59141;
    BEQ .keepLeft                                                        ;A59145;
    LDY.W #InstList_DraygonTail_FacingRight_TailFlail_0                  ;A59147;

  .keepLeft:
    STY.W Enemy[2].instList                                              ;A5914A;
    LDA.W #$0001                                                         ;A5914D;
    STA.W Enemy[2].instTimer                                             ;A59150;
    RTS                                                                  ;A59153;


;;; $9154: Draygon body function - fly straight up ;;;
Function_DraygonBody_GrabbedSamus_FlyStraightUp:
    JSR.W HandleFiringWallTurret                                         ;A59154;
    LDA.W Enemy.YPosition                                                ;A59157;
    SEC                                                                  ;A5915A;
    SBC.W #regional($0004, $0005)                                        ;A5915B;
    STA.W Enemy.YPosition                                                ;A5915E;
    BMI .offScreenTop                                                    ;A59161;
    RTS                                                                  ;A59163;

  .offScreenTop:
    LDA.W Enemy.properties                                               ;A59164;
    AND.W #$FBFF                                                         ;A59167;
    STA.W Enemy.properties                                               ;A5916A;
    LDA.W #Function_DraygonBody_SwoopRight_Setup                         ;A5916D;
    STA.W DraygonBody.function                                           ;A59170;
    STZ.W DraygonBody.swoopYPositionIndex                                ;A59173;
    LDA.L DraygonBody.leftSideResetXPosition                             ;A59176;
    STA.W Enemy.XPosition                                                ;A5917A;
    LDA.L DraygonBody.resetYPosition                                     ;A5917D;
    STA.W Enemy.YPosition                                                ;A59181;
    RTS                                                                  ;A59184;


;;; $9185: Draygon body function - death sequence - drift to death spot ;;;
Function_DraygonBody_DeathSequence_DriftToDeathSpot:
    LDX.W EnemyIndex                                                     ;A59185; >.<
    LDA.W Enemy.frameCounter,X                                           ;A59188;
    AND.W #$000F                                                         ;A5918B;
    BNE .noFoam                                                          ;A5918E;
    LDA.W Enemy.XPosition                                                ;A59190;
    SEC                                                                  ;A59193;
    SBC.W #$0020                                                         ;A59194;
    STA.B DP_Temp12                                                      ;A59197;
    LDA.L DraygonBody.facingDirection                                    ;A59199;
    BEQ .left                                                            ;A5919D;
    LDA.W Enemy.XPosition                                                ;A5919F;
    CLC                                                                  ;A591A2;
    ADC.W #$0020                                                         ;A591A3;
    STA.B DP_Temp12                                                      ;A591A6;

  .left:
    LDA.W Enemy.YPosition                                                ;A591A8;
    SEC                                                                  ;A591AB;
    SBC.W #$0010                                                         ;A591AC;
    STA.B DP_Temp14                                                      ;A591AF;
    LDA.W #$003D                                                         ;A591B1;
    STA.B DP_Temp16                                                      ;A591B4;
    STZ.B DP_Temp18                                                      ;A591B6;
    JSL.L Create_Sprite_Object                                           ;A591B8;

  .noFoam:
    LDA.W Enemy.XPosition                                                ;A591BC;
    LSR                                                                  ;A591BF;
    LSR                                                                  ;A591C0;
    STA.B DP_Temp12                                                      ;A591C1;
    LDA.W #$0100                                                         ;A591C3;
    LSR                                                                  ;A591C6; >.<
    LSR                                                                  ;A591C7;
    SEC                                                                  ;A591C8;
    SBC.B DP_Temp12                                                      ;A591C9;
    STA.B DP_Temp12                                                      ;A591CB;
    LDA.W Enemy.YPosition                                                ;A591CD;
    LSR                                                                  ;A591D0;
    LSR                                                                  ;A591D1;
    STA.B DP_Temp14                                                      ;A591D2;
    LDA.W #$01E0                                                         ;A591D4;
    LSR                                                                  ;A591D7; >.<
    LSR                                                                  ;A591D8;
    SEC                                                                  ;A591D9;
    SBC.B DP_Temp14                                                      ;A591DA;
    STA.B DP_Temp14                                                      ;A591DC;
    JSL.L CalculateAngleOf_12_14_Offset                                  ;A591DE;
    SEC                                                                  ;A591E2;
    SBC.W #$0040                                                         ;A591E3;
    EOR.W #$FFFF                                                         ;A591E6;
    INC                                                                  ;A591E9;
    AND.W #$00FF                                                         ;A591EA;
    STA.L ExtraEnemy8800+6                                               ;A591ED;
    LDA.W #$0001                                                         ;A591F1;
    STA.B DP_Temp14                                                      ;A591F4;
    LDA.L ExtraEnemy8800+6                                               ;A591F6;
    AND.W #$00FF                                                         ;A591FA;
    STA.B DP_Temp12                                                      ;A591FD;
    JSL.L Do_Some_Math_With_Sine_Cosine_Terrible_Label_Name              ;A591FF; ($16.$18, $1A.$1C) = ([$14] * |cos([$12] * pi / 80h)|, [$14] * |sin([$12] * pi / 80h)|)
    LDA.B DP_Temp16                                                      ;A59203;
    STA.W Temp_XSpeed                                                    ;A59205;
    LDA.B DP_Temp18                                                      ;A59208;
    STA.W Temp_XSubSpeed                                                 ;A5920A;
    LDA.B DP_Temp1A                                                      ;A5920D;
    STA.W Temp_YSpeed                                                    ;A5920F;
    LDA.B DP_Temp1C                                                      ;A59212;
    STA.W Temp_YSubSpeed                                                 ;A59214;
    LDA.L ExtraEnemy8800+6                                               ;A59217;
    AND.W #$00FF                                                         ;A5921B;
    STA.W Temp_Unknown0E20                                               ;A5921E;
    JSL.L MoveEnemyAccordingToAngleAndXYSpeeds                           ;A59221;
    LDA.W Enemy.XPosition                                                ;A59225;
    SEC                                                                  ;A59228;
    SBC.W #$0100                                                         ;A59229;
    JSL.L NegateA_A0B067                                                 ;A5922C;
    CMP.W #$0004                                                         ;A59230;
    BPL .gotoReturn                                                      ;A59233;
    LDA.W Enemy.YPosition                                                ;A59235;
    SEC                                                                  ;A59238;
    SBC.W #$01E0                                                         ;A59239;
    JSL.L NegateA_A0B067                                                 ;A5923C;
    CMP.W #$0004                                                         ;A59240;
    BPL .gotoReturn                                                      ;A59243;
    BRA .done                                                            ;A59245;

  .gotoReturn:
    JMP.W .return                                                        ;A59247; >.<

  .done:
    JSR.W SpawnDeathSequenceEvirSpriteObjects                            ;A5924A;
    LDA.W #Function_DraygonBody_DeathSequence_WaitForEvirs               ;A5924D;
    STA.W DraygonBody.function                                           ;A59250;
    LDA.W #$0003                                                         ;A59253;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;A59256;
    LDA.W #regional($01A0, $01C0)                                        ;A5925A;
    STA.W DraygonBody.functionTimer                                      ;A5925D;
    LDA.W #InstList_Draygon_Sleep                                        ;A59260;
    STA.W Enemy.instList                                                 ;A59263;
    LDA.W #$0001                                                         ;A59266;
    STA.W Enemy.instTimer                                                ;A59269;
    LDA.W Enemy.properties                                               ;A5926C;
    ORA.W #$0200                                                         ;A5926F;
    STA.W Enemy[2].properties                                            ;A59272;
    STA.W Enemy[3].properties                                            ;A59275;
    LDY.W #InstList_DraygonEye_FacingLeft_Dead                           ;A59278;
    LDA.L DraygonBody.facingDirection                                    ;A5927B;
    BEQ .keepLeft                                                        ;A5927F;
    LDY.W #InstList_DraygonEye_FacingRight_Dead                          ;A59281;

  .keepLeft:
    STY.W Enemy[1].instList                                              ;A59284;
    LDA.W #$0001                                                         ;A59287;
    STA.W Enemy[1].instTimer                                             ;A5928A;
    LDA.W #RTS_A5804B                                                    ;A5928D;
    STA.W DraygonEye.function                                            ;A59290;

  .return:
    RTS                                                                  ;A59293;


;;; $9294: Draygon body function - death sequence - wait for evirs ;;;
Function_DraygonBody_DeathSequence_WaitForEvirs:
    JSR.W HandleDyingDraygonSmoke                                        ;A59294;
    DEC.W DraygonBody.functionTimer                                      ;A59297;
    LDA.W DraygonBody.functionTimer                                      ;A5929A;
    BEQ .timerExpired                                                    ;A5929D;
    JSR.W HandleDeathSequenceEvirMovement                                ;A5929F;
    BRA .return                                                          ;A592A2;

  .timerExpired:
    LDA.W #Function_DraygonBody_DeathSequence_BuriedByEvirs              ;A592A4;
    STA.W DraygonBody.function                                           ;A592A7;

  .return:
    RTS                                                                  ;A592AA;


;;; $92AB: Draygon body function - death sequence - buried by evirs ;;;
Function_DraygonBody_DeathSequence_BuriedByEvirs:
    JSR.W HandleDyingDraygonSmoke                                        ;A592AB;
    JSR.W HandleDeathSequenceEvirMovement                                ;A592AE;
    INC.W Enemy.YPosition                                                ;A592B1;
    LDA.W Enemy.YPosition                                                ;A592B4;
    CMP.W #$0240                                                         ;A592B7;
    BMI .return                                                          ;A592BA;
    LDA.W #InstList_Draygon_Delete                                       ;A592BC;
    STA.W Enemy.instList                                                 ;A592BF;
    LDA.W #$0001                                                         ;A592C2;
    STA.W Enemy.instTimer                                                ;A592C5;
    LDA.W Enemy.properties                                               ;A592C8;
    ORA.W #$0200                                                         ;A592CB;
    STA.W Enemy.properties                                               ;A592CE;
    STA.W Enemy[1].properties                                            ;A592D1;
    LDX.W AreaIndex                                                      ;A592D4;
    LDA.L SRAMMirror_Boss,X                                              ;A592D7;
    ORA.W #$0001                                                         ;A592DB;
    STA.L SRAMMirror_Boss,X                                              ;A592DE;
    JSL.L DraygonDeathItemDropRoutine                                    ;A592E2;
    JSR.W Draygon_ClearSpriteObjects                                     ;A592E6;

  .return:
    RTS                                                                  ;A592E9;


;;; $92EA: Handle dying Draygon smoke ;;;
HandleDyingDraygonSmoke:
    PHY                                                                  ;A592EA;
    PHX                                                                  ;A592EB;
    LDA.W NMI_FrameCounter                                               ;A592EC;
    AND.W #$0007                                                         ;A592EF;
    BNE .return                                                          ;A592F2;
    JSL.L GenerateRandomNumber                                           ;A592F4;
    AND.W #$007F                                                         ;A592F8;
    CLC                                                                  ;A592FB;
    ADC.W #$00C0                                                         ;A592FC;
    STA.B DP_Temp12                                                      ;A592FF;
    LDA.W RandomNumberSeed                                               ;A59301;
    AND.W #$3F00                                                         ;A59304;
    XBA                                                                  ;A59307;
    CLC                                                                  ;A59308;
    ADC.W #$0190                                                         ;A59309;
    STA.B DP_Temp14                                                      ;A5930C;
    LDA.W #$0015                                                         ;A5930E;
    STA.B DP_Temp16                                                      ;A59311;
    STZ.B DP_Temp18                                                      ;A59313;
    JSL.L Create_Sprite_Object                                           ;A59315;

  .return:
    PLX                                                                  ;A59319;
    PLY                                                                  ;A5931A;
    RTS                                                                  ;A5931B;


;;; $931C: Handle short Draygon breath bubbles ;;;
HandleShortDraygonBreathBubbles:
    LDA.W Enemy.frameCounter,X                                           ;A5931C;
    AND.W #$007F                                                         ;A5931F;
    BNE .return                                                          ;A59322;
    LDA.W Enemy.XPosition                                                ;A59324;
    CLC                                                                  ;A59327;
    ADC.W #$FFF0                                                         ;A59328;
    STA.B DP_Temp12                                                      ;A5932B;
    LDA.W Enemy.YPosition                                                ;A5932D;
    CLC                                                                  ;A59330;
    ADC.W #$FFF0                                                         ;A59331;
    STA.B DP_Temp14                                                      ;A59334;
    LDA.W #$0018                                                         ;A59336;
    STA.B DP_Temp16                                                      ;A59339;
    STZ.B DP_Temp18                                                      ;A5933B;
    JSL.L Create_Sprite_Object                                           ;A5933D;

  .return:
    RTS                                                                  ;A59341;


;;; $9342: Enemy graphics drawn hook - Draygon - set BG2 X/Y scroll ;;;
EnemyGraphicsDrawnHook_Draygon_SetBG2XYScroll:
    LDA.W Layer1XPosition                                                ;A59342;
    SEC                                                                  ;A59345;
    SBC.W Enemy.XPosition                                                ;A59346;
    SEC                                                                  ;A59349;
    SBC.W #$01C2                                                         ;A5934A;
    CLC                                                                  ;A5934D;
    ADC.L DraygonBody.bodyGraphicsXDisplacement                          ;A5934E;
    STA.B DP_BG2XScroll                                                  ;A59352;
    LDA.W Layer1YPosition                                                ;A59354;
    SEC                                                                  ;A59357;
    SBC.W Enemy.YPosition                                                ;A59358;
    SEC                                                                  ;A5935B;
    SBC.W #$00C0                                                         ;A5935C;
    CLC                                                                  ;A5935F;
    ADC.L DraygonBody.bodyGraphicsYDisplacement                          ;A59360;
    STA.B DP_BG2YScroll                                                  ;A59364;
    RTL                                                                  ;A59366;


if !DEBUG
;;; $9367: Unused. Debug. Draygon controller 2 input handling ;;;
Debug_DraygonController2InputHandling:
    LDX.W #$0000                                                         ;A59367;
    LDA.B DP_Controller2Input                                            ;A5936A;
    BIT.W #$0040                                                         ;A5936C;
    BEQ .notPressingX                                                    ;A5936F;
    JSL.L Debug_MoveDraygonWithDpad_Fast                                 ;A59371;
    BRA +                                                                ;A59375;

  .notPressingX:
    JSL.L Debug_MoveDraygonWithDpad_Slow                                 ;A59377;

+   LDX.W #$0000                                                         ;A5937B;
    LDA.B DP_Controller2New                                              ;A5937E;
    BIT.W #$4000                                                         ;A59380;
    BEQ .fireGoopEnd                                                     ;A59383;
    LDY.W #InstList_DraygonBody_FacingLeft_FireGoop                      ;A59385;
    LDA.L DraygonBody.facingDirection,X                                  ;A59388;
    BEQ .keepLeft                                                        ;A5938C;
    LDY.W #InstList_DraygonBody_FacingRight_FireGoop                     ;A5938E;

  .keepLeft:
    STY.W Enemy.instList                                                 ;A59391;
    LDA.W #$0001                                                         ;A59394;
    STA.W Enemy.instTimer                                                ;A59397;
    BRA .return                                                          ;A5939A;

  .fireGoopEnd:
    BIT.W #$8000                                                         ;A5939C;
    BEQ .tailWhipEnd                                                     ;A5939F;
    LDY.W #InstList_DraygonTail_FacingLeft_FakeTailWhip                  ;A593A1;
    LDA.L DraygonBody.facingDirection,X                                  ;A593A4;
    BEQ ..keepLeft                                                       ;A593A8;
    LDY.W #Debug_InstList_DraygonTail_FacingRight_FakeTailWhip           ;A593AA;

  ..keepLeft:
    STY.W Enemy[2].instList                                              ;A593AD;
    LDA.W #$0001                                                         ;A593B0;
    STA.W Enemy[2].instTimer                                             ;A593B3;
    BRA .return                                                          ;A593B6;

  .tailWhipEnd:
    BIT.W #$0080                                                         ;A593B8;
    BEQ .grabEnd                                                         ;A593BB;
    LDY.W #Debug_InstList_DraygonArms_FacingLeft_FakeGrab                ;A593BD;
    LDA.L DraygonBody.facingDirection,X                                  ;A593C0;
    BEQ ..keepLeft                                                       ;A593C4;
    LDY.W #Debug_InstList_DraygonArms_FacingRight_FakeGrab               ;A593C6;

  ..keepLeft:
    STY.W Enemy[3].instList                                              ;A593C9;
    LDA.W #$0001                                                         ;A593CC;
    STA.W Enemy[3].instTimer                                             ;A593CF;
    BRA .return                                                          ;A593D2;

  .grabEnd:
    BIT.W #$0040                                                         ;A593D4;
    BEQ .return                                                          ;A593D7; >.<

  .return:
    RTL                                                                  ;A593D9;


;;; $93DA: Debug. Move Draygon with d-pad - slow ;;;
Debug_MoveDraygonWithDpad_Slow:
    LDA.B DP_Controller2Input                                            ;A593DA;
    BIT.W #$0200                                                         ;A593DC;
    BEQ .notPressingLeft                                                 ;A593DF;
    DEC.W Enemy.XPosition                                                ;A593E1;
    CMP.W DebugPreviousController2InputCrocomire                         ;A593E4;
    BEQ .notPressingLeft                                                 ;A593E7;
    STA.W DebugPreviousController2InputCrocomire                         ;A593E9;
    LDY.W #InstList_DraygonBody_FacingLeft_Reset                         ;A593EC;
    LDA.W #$0000                                                         ;A593EF;
    STA.L DraygonBody.facingDirection                                    ;A593F2;
    BRA +                                                                ;A593F6;

  .notPressingLeft:
    BIT.W #$0100                                                         ;A593F8;
    BEQ .noHorizontalMovement                                            ;A593FB;
    INC.W Enemy.XPosition                                                ;A593FD;
    CMP.W DebugPreviousController2InputCrocomire                         ;A59400;
    BEQ .noHorizontalMovement                                            ;A59403;
    STA.W DebugPreviousController2InputCrocomire                         ;A59405;
    LDY.W #InstList_DraygonBody_FacingRight_Reset                        ;A59408;
    LDA.W #$0001                                                         ;A5940B;
    STA.L DraygonBody.facingDirection                                    ;A5940E;

+   STY.W Enemy.instList                                                 ;A59412;
    LDA.W #$0001                                                         ;A59415;
    STA.W Enemy.instTimer                                                ;A59418;

  .noHorizontalMovement:
    LDA.B DP_Controller2Input                                            ;A5941B;
    BIT.W #$0800                                                         ;A5941D;
    BEQ .notPressingUp                                                   ;A59420;
    DEC.W Enemy.YPosition                                                ;A59422;
    BRA .return                                                          ;A59425;

  .notPressingUp:
    BIT.W #$0400                                                         ;A59427;
    BEQ .return                                                          ;A5942A;
    INC.W Enemy.YPosition                                                ;A5942C;

  .return:
    RTL                                                                  ;A5942F;


;;; $9430: Debug. Move Draygon with d-pad - fast ;;;
Debug_MoveDraygonWithDpad_Fast:
    LDA.B DP_Controller2Input                                            ;A59430;
    BIT.W #$0200                                                         ;A59432;
    BEQ .noPressingLeft                                                  ;A59435;
    LDA.W Enemy.XPosition                                                ;A59437;
    SEC                                                                  ;A5943A;
    SBC.W #$0004                                                         ;A5943B;
    STA.W Enemy.XPosition                                                ;A5943E;
    LDA.B DP_Controller2Input                                            ;A59441;
    CMP.W DebugPreviousController2InputCrocomire                         ;A59443;
    BEQ .noPressingLeft                                                  ;A59446;
    STA.W DebugPreviousController2InputCrocomire                         ;A59448;
    LDY.W #InstList_DraygonBody_FacingLeft_Reset                         ;A5944B;
    LDA.W #$0000                                                         ;A5944E;
    STA.L DraygonBody.facingDirection                                    ;A59451;
    BRA +                                                                ;A59455;

  .noPressingLeft:
    BIT.W #$0100                                                         ;A59457;
    BEQ .noHorizontalMovement                                            ;A5945A;
    LDA.W Enemy.XPosition                                                ;A5945C;
    CLC                                                                  ;A5945F;
    ADC.W #$0004                                                         ;A59460;
    STA.W Enemy.XPosition                                                ;A59463;
    LDA.B DP_Controller2Input                                            ;A59466;
    CMP.W DebugPreviousController2InputCrocomire                         ;A59468;
    BEQ .noHorizontalMovement                                            ;A5946B;
    STA.W DebugPreviousController2InputCrocomire                         ;A5946D;
    LDY.W #InstList_DraygonBody_FacingRight_Reset                        ;A59470;
    LDA.W #$0001                                                         ;A59473;
    STA.L DraygonBody.facingDirection                                    ;A59476;

+   STY.W Enemy.instList                                                 ;A5947A;
    LDA.W #$0001                                                         ;A5947D;
    STA.W Enemy.instTimer                                                ;A59480;

  .noHorizontalMovement:
    LDA.B DP_Controller2Input                                            ;A59483;
    BIT.W #$0800                                                         ;A59485;
    BEQ .notPressingUp                                                   ;A59488;
    LDA.W Enemy.YPosition                                                ;A5948A;
    SEC                                                                  ;A5948D;
    SBC.W #$0004                                                         ;A5948E;
    STA.W Enemy.YPosition                                                ;A59491;
    BRA .return                                                          ;A59494;

  .notPressingUp:
    BIT.W #$0400                                                         ;A59496;
    BEQ .return                                                          ;A59499;
    INC.W Enemy.YPosition                                                ;A5949B;
    LDA.W Enemy.YPosition                                                ;A5949E;
    CLC                                                                  ;A594A1;
    ADC.W #$0004                                                         ;A594A2;
    STA.W Enemy.YPosition                                                ;A594A5;

  .return:
    RTL                                                                  ;A594A8;
endif


;;; $94A9: Move Samus with Draygon ;;;
MoveSamusWithDraygon:
    LDY.W #$0008                                                         ;A594A9;
    LDA.L DraygonBody.facingDirection,X                                  ;A594AC;
    BNE .keepLeft                                                        ;A594B0;
    LDY.W #$FFF8                                                         ;A594B2;

  .keepLeft:
    TYA                                                                  ;A594B5;
    CLC                                                                  ;A594B6;
    ADC.W Enemy.XPosition                                                ;A594B7;
    STA.W SamusXPosition                                                 ;A594BA;
    LDA.W Enemy.YPosition                                                ;A594BD;
    CLC                                                                  ;A594C0;
    ADC.W #$0028                                                         ;A594C1;
    STA.W SamusYPosition                                                 ;A594C4;
    JSL.L CapScrollingSpeed                                              ;A594C7;
    LDA.W GrappleConnectedFlags                                          ;A594CB;
    BIT.W #$0002                                                         ;A594CE;
    BEQ .return                                                          ;A594D1;
    STZ.W GrappleConnectedFlags                                          ;A594D3;
    LDA.W #Function_DraygonBody_GrabbedSamus_FlyStraightUp               ;A594D6;
    STA.W DraygonBody.function                                           ;A594D9;

  .return:
    RTS                                                                  ;A594DC;


;;; $94DD: Instruction - Draygon instructions lists = [[Y]], [[Y] + 2], [[Y] + 4], [[Y] + 6] ;;;
Instruction_Draygon_SetInstList_Body_Eye_Tail_Arms:
    PHY                                                                  ;A594DD;
    LDA.W $0000,Y                                                        ;A594DE;
    STA.W Enemy.instList                                                 ;A594E1;
    LDA.W $0002,Y                                                        ;A594E4;
    STA.W Enemy[1].instList                                              ;A594E7;
    LDA.W $0004,Y                                                        ;A594EA;
    STA.W Enemy[2].instList                                              ;A594ED;
    LDA.W $0006,Y                                                        ;A594F0;
    STA.W Enemy[3].instList                                              ;A594F3;
    LDA.W #$0001                                                         ;A594F6;
    STA.W Enemy.instTimer                                                ;A594F9;
    STA.W Enemy[1].instTimer                                             ;A594FC;
    STA.W Enemy[2].instTimer                                             ;A594FF;
    STA.W Enemy[3].instTimer                                             ;A59502;
    PLY                                                                  ;A59505;
    TYA                                                                  ;A59506;
    CLC                                                                  ;A59507;
    ADC.W #$0008                                                         ;A59508;
    TAY                                                                  ;A5950B;
    RTL                                                                  ;A5950C;


if !FEATURE_KEEP_UNREFERENCED
;;; $950D: Unused. Draygon instruction list pointers ;;;
Unused_DraygonInstListPointers_A5950D:
; Not an exhaustive list of pointers. Assuming they were used for some unknown debug purpose
    ; Draygon arms
    dw InstList_DraygonArms_FacingLeft_Idle_0                            ;A5950D;
    dw InstList_DraygonArms_FacingLeft_NearSwoopApex                     ;A5950F;
    dw UNUSED_InstList_DraygonArms_A59805                                ;A59511;
    dw InstList_DraygonArms_FacingRight_Idle_0                           ;A59513;
    dw InstList_DraygonArms_FacingRight_NearSwoopApex                    ;A59515;
    dw UNUSED_InstList_DraygonArms_A59BF8                                ;A59517;
    dw $0000                                                             ;A59519;
    ; Draygon body
    dw InstList_DraygonBody_FacingLeft_Idle                              ;A5951B;
    dw InstList_DraygonArms_FacingLeft_Dying                             ;A5951D;
    dw UNUSED_InstList_DraygonBody_A5987B                                ;A5951F;
    dw InstList_DraygonBody_FacingLeft_FireGoop                          ;A59521;
    dw InstList_DraygonBody_FacingRight_Idle                             ;A59523;
    dw InstList_DraygonArms_FacingRight_Dying_0                          ;A59525;
    dw UNUSED_InstList_DraygonBody_A59C70                                ;A59527;
    dw InstList_DraygonBody_FacingRight_FireGoop                         ;A59529;
    dw $0000                                                             ;A5952B;
    ; Draygon eye
    dw InstList_DraygonEye_FacingLeft_Idle                               ;A5952D;
    dw InstList_DraygonEye_FacingLeft_LookingLeft                        ;A5952F;
    dw InstList_DraygonEye_FacingLeft_LookingRight                       ;A59531;
    dw InstList_DraygonEye_FacingLeft_LookingUp                          ;A59533;
    dw InstList_DraygonEye_FacingLeft_LookingDown                        ;A59535;
    dw InstList_DraygonEye_FacingRight_Idle                              ;A59537;
    dw InstList_DraygonEye_FacingRight_LookingRight                      ;A59539;
    dw InstList_DraygonEye_FacingRight_LookingLeft                       ;A5953B;
    dw InstList_DraygonEye_FacingRight_LookingUp                         ;A5953D;
    dw InstList_DraygonEye_FacingRight_LookingDown                       ;A5953F;
    dw $0000                                                             ;A59541;
    ; Draygon tail
    dw InstList_DraygonTail_FacingLeft_Idle_0                            ;A59543;
    dw InstList_DraygonTail_FacingLeft_FakeTailWhip                      ;A59545;
    dw InstList_DraygonTail_FacingRight_Idle_0                           ;A59547;
    dw Debug_InstList_DraygonTail_FacingRight_FakeTailWhip               ;A59549;
    dw $0000                                                             ;A5954B;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $954D: Hurt AI - enemy $DE3F (Draygon) ;;;
HurtAI_Draygon:
    LDY.W #Palette_Draygon_BG12_5                                        ;A5954D;
    LDX.W EnemyIndex                                                     ;A59550;
    LDA.W Enemy.flashTimer,X                                             ;A59553;
    BIT.W #$0002                                                         ;A59556;
    BEQ .noFlash                                                         ;A59559;
    LDY.W #Palette_Draygon_WhiteFlash                                    ;A5955B;

  .noFlash:
    LDX.W #Palettes_BG12P5                                               ;A5955E;
    LDA.W #$0010                                                         ;A59561;
    STA.W LoopCounterEnemyDeath                                          ;A59564;

  .loopBG12Palette5:
    LDA.W $0000,Y                                                        ;A59567;
    STA.L Palettes_BG12P5&$FF0000,X                                      ;A5956A;
    INX                                                                  ;A5956E;
    INX                                                                  ;A5956F;
    INY                                                                  ;A59570;
    INY                                                                  ;A59571;
    DEC.W LoopCounterEnemyDeath                                          ;A59572;
    BNE .loopBG12Palette5                                                ;A59575;
    LDX.W EnemyIndex                                                     ;A59577;
    LDA.W Enemy.flashTimer,X                                             ;A5957A;
    BIT.W #$0002                                                         ;A5957D;
    BNE .flashing                                                        ;A59580;
    LDA.L DraygonBody.healthBasedPaletteTableIndex                       ;A59582;
    ASL                                                                  ;A59586;
    ASL                                                                  ;A59587;
    TAY                                                                  ;A59588;
    LDX.W #$0000                                                         ;A59589;

  .loopHealthBasedPalette:
    LDA.W DraygonHealthBasedPaletteTable,Y                               ;A5958C;
    STA.L Palettes_BG12P5+$12,X                                          ;A5958F;
    INY                                                                  ;A59593;
    INY                                                                  ;A59594;
    INX                                                                  ;A59595;
    INX                                                                  ;A59596;
    CPX.W #$0008                                                         ;A59597;
    BNE .loopHealthBasedPalette                                          ;A5959A;

  .flashing:
    LDY.W #Palette_Draygon_Sprite7                                       ;A5959C;
    LDX.W EnemyIndex                                                     ;A5959F;
    LDA.W Enemy.flashTimer,X                                             ;A595A2;
    BIT.W #$0002                                                         ;A595A5;
    BEQ ..noFlash                                                        ;A595A8;
    LDY.W #Palette_Draygon_WhiteFlash                                    ;A595AA;

  ..noFlash:
    LDX.W #Palettes_SpriteP7                                             ;A595AD;
    LDA.W #$0010                                                         ;A595B0;
    STA.W LoopCounterEnemyDeath                                          ;A595B3;

  .loopSpritePalette7:
    LDA.W $0000,Y                                                        ;A595B6;
    STA.L Palettes_SpriteP7&$FF0000,X                                    ;A595B9;
    INX                                                                  ;A595BD;
    INX                                                                  ;A595BE;
    INY                                                                  ;A595BF;
    INY                                                                  ;A595C0;
    DEC.W LoopCounterEnemyDeath                                          ;A595C1;
    BNE .loopSpritePalette7                                              ;A595C4;
    LDA.W GrappleConnectedFlags                                          ;A595C6;
    BIT.W #$0001                                                         ;A595C9;
    BEQ .return                                                          ;A595CC;
    LDA.W Enemy.frameCounter                                             ;A595CE;
    AND.W #$0007                                                         ;A595D1;
    BNE .return                                                          ;A595D4;
    LDA.W Enemy.health                                                   ;A595D6;
    SEC                                                                  ;A595D9;
    SBC.W #$0100                                                         ;A595DA;
    BPL .grappleDamage                                                   ;A595DD;
    LDA.W #$0000                                                         ;A595DF;

  .grappleDamage:
    STA.W Enemy.health                                                   ;A595E2;
    JSL.L DraygonReaction_Common                                         ;A595E5;

  .return:
    RTL                                                                  ;A595E9;


;;; $95EA: Enemy touch - enemy $DE3F (Draygon) ;;;
EnemyTouch_Draygon:
    JSL.L NormalEnemyTouchAI_NoDeathCheck_External                       ;A595EA;
    BRA DraygonReaction_Common                                           ;A595EE;


;;; $95F0: Enemy shot - enemy $DE7F (Draygon) ;;;
EnemyShot_Draygon:
    LDA.L DraygonBody.swoopYAcceleration                                 ;A595F0;
    CLC                                                                  ;A595F4;
    ADC.W #$0008                                                         ;A595F5;
    CMP.W #$00A0                                                         ;A595F8;
    BPL +                                                                ;A595FB;
    STA.L DraygonBody.swoopYAcceleration                                 ;A595FD;

+   JSL.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External     ;A59601;
    BRA DraygonReaction_Common                                           ;A59605;


;;; $9607: Power bomb reaction - enemy $DE3F (Draygon) ;;;
PowerBombReaction_Draygon:
    JSL.L NormalEnemyPowerBombAI_NoDeathCheck_External                   ;A59607;
    BRA DraygonReaction_Common                                           ;A5960B; >.<


;;; $960D: Draygon reaction ;;;
DraygonReaction_Common:
; The calculations for the X/Y speed for drifting to the death point ($965B) are copy+pasted from Spore Spawn code,
; the results ($7E:8010..17) aren't actually used by Draygon, instead they're recalculated every frame by Function_DraygonBody_DeathSequence_DriftToDeathSpot >_<;
    LDX.W EnemyIndex                                                     ;A5960D;
    LDA.W Enemy.health,X                                                 ;A59610;
    BEQ .dead                                                            ;A59613;
    JMP.W .notDead                                                       ;A59615;

  .dead:
    LDA.W #GrappleBeamFunction_Dropped                                   ;A59618;
    STA.W GrappleBeam_Function                                           ;A5961B;
    LDY.W #InstList_DraygonArms_FacingLeft_Dying                         ;A5961E;
    LDA.L DraygonBody.facingDirection                                    ;A59621;
    BEQ ..keepLeft                                                       ;A59625;
    LDY.W #InstList_DraygonArms_FacingRight_Dying_0                      ;A59627;

  ..keepLeft:
    STY.W Enemy.instList                                                 ;A5962A;
    LDA.W #$0001                                                         ;A5962D;
    STA.W Enemy.instTimer                                                ;A59630;
    LDY.W #InstList_DraygonEye_FacingLeft_Dying_0                        ;A59633;
    LDA.L DraygonBody.facingDirection                                    ;A59636;
    BEQ +                                                                ;A5963A;
    LDY.W #InstList_DraygonEye_FacingRight_Dying_0                       ;A5963C;

+   STY.W Enemy[1].instList                                              ;A5963F;
    LDA.W #$0001                                                         ;A59642;
    STA.W Enemy[1].instTimer                                             ;A59645;
    LDA.W #RTS_A5804B                                                    ;A59648;
    STA.W DraygonEye.function                                            ;A5964B;
    LDA.W #Function_DraygonBody_DeathSequence_DriftToDeathSpot           ;A5964E;
    STA.W DraygonBody.function                                           ;A59651;
    JSL.L ReleaseSamusFromDraygon_external                               ;A59654;
    STZ.W GrappleConnectedFlags                                          ;A59658;
    LDA.W #$0100                                                         ;A5965B;
    SEC                                                                  ;A5965E;
    SBC.W Enemy.XPosition                                                ;A5965F;
    STA.B DP_Temp12                                                      ;A59662;
    LDA.W #$01E0                                                         ;A59664;
    SEC                                                                  ;A59667;
    SBC.W Enemy.YPosition                                                ;A59668;
    STA.B DP_Temp14                                                      ;A5966B;
    JSL.L CalculateAngleOf_12_14_Offset                                  ;A5966D;
    SEC                                                                  ;A59671;
    SBC.W #$0040                                                         ;A59672;
    EOR.W #$FFFF                                                         ;A59675;
    INC                                                                  ;A59678;
    AND.W #$00FF                                                         ;A59679;
    STA.L ExtraEnemy8800+6                                               ;A5967C;
    LDA.W #$0001                                                         ;A59680;
    STA.B DP_Temp14                                                      ;A59683;
    LDA.L ExtraEnemy8800+6                                               ;A59685;
    AND.W #$00FF                                                         ;A59689;
    STA.B DP_Temp12                                                      ;A5968C;
    JSL.L Do_Some_Math_With_Sine_Cosine_Terrible_Label_Name              ;A5968E; ($16.$18, $1A.$1C) = ([$14] * |cos([$12] * pi / 80h)|, [$14] * |sin([$12] * pi / 80h)|)
    LDA.B DP_Temp16                                                      ;A59692;
    STA.L ExtraEnemy8000+$10                                             ;A59694;
    LDA.B DP_Temp18                                                      ;A59698;
    STA.L ExtraEnemy8000+$12                                             ;A5969A;
    LDA.B DP_Temp1A                                                      ;A5969E;
    STA.L ExtraEnemy8000+$14                                             ;A596A0;
    LDA.B DP_Temp1C                                                      ;A596A4;
    STA.L ExtraEnemy8000+$16                                             ;A596A6;
    RTL                                                                  ;A596AA;

  .notDead:
    JSR.W DraygonHealthBasedPaletteHandling                              ;A596AB;
    RTL                                                                  ;A596AE;


;;; $96AF: Draygon health-based palette table ;;;
DraygonHealthBasedPaletteTable:                                          ;A596AF;
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
DraygonHealthBasedPaletteThresholds:                                     ;A596EF;
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
    LDX.W #$0000                                                         ;A59701;

  .loopFindThreshold:
    LDA.W Enemy.health                                                   ;A59704;
    CMP.W DraygonHealthBasedPaletteThresholds,X                          ;A59707;
    BPL .found                                                           ;A5970A;
    INX                                                                  ;A5970C;
    INX                                                                  ;A5970D;
    BRA .loopFindThreshold                                               ;A5970E;

  .found:
    TXA                                                                  ;A59710;
    CMP.L DraygonBody.healthBasedPaletteTableIndex                       ;A59711;
    BEQ .return                                                          ;A59715;
    STA.L DraygonBody.healthBasedPaletteTableIndex                       ;A59717;
    LDA.L DraygonBody.healthBasedPaletteTableIndex                       ;A5971B; >_<
    ASL                                                                  ;A5971F;
    ASL                                                                  ;A59720;
    TAY                                                                  ;A59721;
    LDX.W #$0000                                                         ;A59722;

  .loopPalette:
    LDA.W DraygonHealthBasedPaletteTable,Y                               ;A59725;
    STA.L Palettes_BG12P5+$12,X                                          ;A59728;
    INY                                                                  ;A5972C;
    INY                                                                  ;A5972D;
    INX                                                                  ;A5972E;
    INX                                                                  ;A5972F;
    CPX.W #$0008                                                         ;A59730;
    BNE .loopPalette                                                     ;A59733;

  .return:
    RTS                                                                  ;A59735;


;;; $9736: Instruction - enemy function = [[Y]] ;;;
Instruction_Draygon_FunctionInY:
    LDA.W $0000,Y                                                        ;A59736;
    STA.W DraygonBody.function,X                                         ;A59739;
    INY                                                                  ;A5973C;
    INY                                                                  ;A5973D;
    RTL                                                                  ;A5973E;


;;; $973F: Instruction - spawn dying Draygon sprite object - big dust cloud ;;;
Inst_Draygon_SpawnDyingDraygonSpriteObject_BigDustCloud:
    PHY                                                                  ;A5973F;
    PHX                                                                  ;A59740;
    JSR.W GenerateRandomDyingDraygonSpriteObjectPosition                 ;A59741;
    LDA.W #$0015                                                         ;A59744;
    STA.B DP_Temp16                                                      ;A59747;
    STZ.B DP_Temp18                                                      ;A59749;
    JSL.L Create_Sprite_Object                                           ;A5974B;
    PLX                                                                  ;A5974F;
    PLY                                                                  ;A59750;
    RTL                                                                  ;A59751;


;;; $9752: Instruction - spawn dying Draygon sprite object - small explosion ;;;
Inst_Draygon_SpawnDyingDraygonSpriteObject_SmallExplosion:
    PHY                                                                  ;A59752;
    PHX                                                                  ;A59753;
    JSR.W GenerateRandomDyingDraygonSpriteObjectPosition                 ;A59754;
    LDA.W #$0003                                                         ;A59757;
    STA.B DP_Temp16                                                      ;A5975A;
    STZ.B DP_Temp18                                                      ;A5975C;
    JSL.L Create_Sprite_Object                                           ;A5975E;
    PLX                                                                  ;A59762;
    PLY                                                                  ;A59763;
    RTL                                                                  ;A59764;


;;; $9765: Instruction - spawn dying Draygon sprite object - big explosion ;;;
Inst_Draygon_SpawnDyingDraygonSpriteObject_BigExplosion:
    PHY                                                                  ;A59765;
    PHX                                                                  ;A59766;
    JSR.W GenerateRandomDyingDraygonSpriteObjectPosition                 ;A59767;
    LDA.W #$001D                                                         ;A5976A;
    STA.B DP_Temp16                                                      ;A5976D;
    STZ.B DP_Temp18                                                      ;A5976F;
    JSL.L Create_Sprite_Object                                           ;A59771;
    PLX                                                                  ;A59775;
    PLY                                                                  ;A59776;
    RTL                                                                  ;A59777;


;;; $9778: Instruction - spawn dying Draygon sprite object - breath bubbles ;;;
Inst_Draygon_SpawnDyingDraygonSpriteObject_BreathBubbles:
    PHY                                                                  ;A59778;
    PHX                                                                  ;A59779;
    JSR.W GenerateRandomDyingDraygonSpriteObjectPosition                 ;A5977A;
    LDA.W #$0018                                                         ;A5977D;
    STA.B DP_Temp16                                                      ;A59780;
    STZ.B DP_Temp18                                                      ;A59782;
    JSL.L Create_Sprite_Object                                           ;A59784;
    PLX                                                                  ;A59788;
    PLY                                                                  ;A59789;
    RTL                                                                  ;A5978A;


;;; $978B: Generate random dying Draygon sprite object position ;;;
GenerateRandomDyingDraygonSpriteObjectPosition:
    JSL.L GenerateRandomNumber                                           ;A5978B;
    LDA.W RandomNumberSeed                                               ;A5978F;
    AND.W #$007F                                                         ;A59792;
    SEC                                                                  ;A59795;
    SBC.W #$0040                                                         ;A59796;
    STA.B DP_Temp12                                                      ;A59799;
    LDA.W Enemy.XPosition                                                ;A5979B;
    CLC                                                                  ;A5979E;
    ADC.B DP_Temp12                                                      ;A5979F;
    STA.B DP_Temp12                                                      ;A597A1;
    LDA.W RandomNumberSeed                                               ;A597A3;
    AND.W #$7F00                                                         ;A597A6;
    XBA                                                                  ;A597A9;
    SEC                                                                  ;A597AA;
    SBC.W #$0040                                                         ;A597AB;
    STA.B DP_Temp14                                                      ;A597AE;
    LDA.W Enemy.YPosition                                                ;A597B0;
    CLC                                                                  ;A597B3;
    ADC.B DP_Temp14                                                      ;A597B4;
    STA.B DP_Temp14                                                      ;A597B6;
    RTS                                                                  ;A597B8;


;;; $97B9: Instruction list - sleep ;;;
InstList_Draygon_Sleep:
    dw Instruction_Common_Sleep                                          ;A597B9;


;;; $97BB: Instruction list - Draygon body - facing left - reset ;;;
InstList_DraygonBody_FacingLeft_Reset:
    dw Instruction_Draygon_SetInstList_Body_Eye_Tail_Arms                ;A597BB;
    dw InstList_DraygonBody_FacingLeft_Idle                              ;A597BD;
    dw InstList_DraygonEye_FacingLeft_Idle                               ;A597BF;
    dw InstList_DraygonTail_FacingLeft_Idle_0                            ;A597C1;
    dw InstList_DraygonArms_FacingLeft_Idle_0                            ;A597C3;
    dw Instruction_Draygon_RoomLoadingInterruptCmd_BeginHUDDraw          ;A597C5;
    dw Instruction_Draygon_EyeFunctionInY                                ;A597C7;
    dw Function_DraygonEye_FacingLeft                                    ;A597C9;
    dw $0001,ExtendedSpritemap_Draygon_1A                                ;A597CB;
    dw Instruction_Common_Sleep                                          ;A597CF;


;;; $97D1: Instruction list - Draygon body - facing right - reset ;;;
InstList_DraygonBody_FacingRight_Reset:
    dw Instruction_Draygon_SetInstList_Body_Eye_Tail_Arms                ;A597D1;
    dw InstList_DraygonBody_FacingRight_Idle                             ;A597D3;
    dw InstList_DraygonEye_FacingRight_Idle                              ;A597D5;
    dw InstList_DraygonTail_FacingRight_Idle_0                           ;A597D7;
    dw InstList_DraygonArms_FacingRight_Idle_0                           ;A597D9;
    dw Instruction_Draygon_RoomLoadingInterruptCmd_BeginHUDDraw          ;A597DB;
    dw Instruction_Draygon_EyeFunctionInY                                ;A597DD;
    dw Function_DraygonEye_FacingRight                                   ;A597DF;
    dw $0001,ExtendedSpritemap_Draygon_4A                                ;A597E1;
    dw Instruction_Common_Sleep                                          ;A597E5;


;;; $97E7: Instruction list - Draygon arms - facing left - idle ;;;
InstList_DraygonArms_FacingLeft_Idle_0:
    dw $0005,ExtendedSpritemap_Draygon_4                                 ;A597E7;
    dw $0005,ExtendedSpritemap_Draygon_5                                 ;A597EB;
    dw $0005,ExtendedSpritemap_Draygon_6                                 ;A597EF;
    dw $0005,ExtendedSpritemap_Draygon_7                                 ;A597F3;
    dw $0005,ExtendedSpritemap_Draygon_8                                 ;A597F7;
    dw $0005,ExtendedSpritemap_Draygon_9                                 ;A597FB;
    dw Instruction_Common_GotoY                                          ;A597FF;
    dw InstList_DraygonArms_FacingLeft_Idle_0                            ;A59801;

InstList_DraygonArms_FacingLeft_Idle_1:
    dw Instruction_Common_Sleep                                          ;A59803;


if !FEATURE_KEEP_UNREFERENCED
;;; $9805: Unused. Instruction list - Draygon arms ;;;
UNUSED_InstList_DraygonArms_A59805:
    dw $0001,ExtendedSpritemap_Draygon_1D                                ;A59805;
    dw $0001,ExtendedSpritemap_Draygon_1C                                ;A59809;
    dw $0040,ExtendedSpritemap_Draygon_1B                                ;A5980D;
    dw Instruction_Common_Sleep                                          ;A59811;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $9813: Instruction list - Draygon arms - facing left - near swoop apex ;;;
InstList_DraygonArms_FacingLeft_NearSwoopApex:
    dw $0001,ExtendedSpritemap_Draygon_1B                                ;A59813;
    dw $0001,ExtendedSpritemap_Draygon_1C                                ;A59817;
    dw $0001,ExtendedSpritemap_Draygon_1D                                ;A5981B;
    dw $0040,ExtendedSpritemap_Draygon_1E                                ;A5981F;
    dw Instruction_Common_Sleep                                          ;A59823;


;;; $9825: Instruction list - Draygon arms - facing left - fake grab ;;;
Debug_InstList_DraygonArms_FacingLeft_FakeGrab:
; Only set by debug routine
    dw $0001,ExtendedSpritemap_Draygon_1B                                ;A59825;
    dw $0001,ExtendedSpritemap_Draygon_1C                                ;A59829;
    dw $0001,ExtendedSpritemap_Draygon_1D                                ;A5982D;
    dw $0040,ExtendedSpritemap_Draygon_1E                                ;A59831;
    dw $0001,ExtendedSpritemap_Draygon_1D                                ;A59835;
    dw $0001,ExtendedSpritemap_Draygon_1C                                ;A59839;
    dw $0040,ExtendedSpritemap_Draygon_1B                                ;A5983D;
    dw Instruction_Common_GotoY                                          ;A59841;
    dw InstList_DraygonArms_FacingLeft_Idle_0                            ;A59843;


;;; $9845: Instruction list - Draygon arms - facing left - grab ;;;
InstList_DraygonArms_FacingLeft_Grab:
    dw $0001,ExtendedSpritemap_Draygon_1B                                ;A59845;
    dw $0001,ExtendedSpritemap_Draygon_1C                                ;A59849;
    dw $0001,ExtendedSpritemap_Draygon_1D                                ;A5984D;
    dw $0008,ExtendedSpritemap_Draygon_1E                                ;A59851;
    dw $0001,ExtendedSpritemap_Draygon_1D                                ;A59855;
    dw $0001,ExtendedSpritemap_Draygon_1C                                ;A59859;
    dw $0001,ExtendedSpritemap_Draygon_1B                                ;A5985D;
    dw $0001,ExtendedSpritemap_Draygon_1C                                ;A59861;
    dw Instruction_Common_Sleep                                          ;A59865;


;;; $9867: Instruction list - Draygon body - facing left - dying ;;;
InstList_DraygonArms_FacingLeft_Dying:
    dw $0005,ExtendedSpritemap_Draygon_A                                 ;A59867;
    dw $0005,ExtendedSpritemap_Draygon_B                                 ;A5986B;
    dw $0005,ExtendedSpritemap_Draygon_C                                 ;A5986F;
    dw $0005,ExtendedSpritemap_Draygon_D                                 ;A59873;
    dw Instruction_Common_GotoY                                          ;A59877;
    dw InstList_DraygonBody_Dying_0                                      ;A59879;


if !FEATURE_KEEP_UNREFERENCED
;;; $987B: Unused. Instruction list - Draygon body ;;;
UNUSED_InstList_DraygonBody_A5987B:
    dw $0005,ExtendedSpritemap_Draygon_C                                 ;A5987B;
    dw $0005,ExtendedSpritemap_Draygon_B                                 ;A5987F;
    dw $0005,ExtendedSpritemap_Draygon_A                                 ;A59883;
    dw Instruction_Common_Sleep                                          ;A59887;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $9889: Instruction list - Draygon body - facing left - idle ;;;
InstList_DraygonBody_FacingLeft_Idle:
    dw Instruction_Draygon_RoomLoadingInterruptCmd_BeginHUDDraw          ;A59889;
    dw Instruction_Draygon_EyeFunctionInY                                ;A5988B;
    dw Function_DraygonEye_FacingLeft                                    ;A5988D;
    dw $0001,ExtendedSpritemap_Draygon_1A                                ;A5988F;
    dw Instruction_Common_Sleep                                          ;A59893;


;;; $9895: Instruction - room loading interrupt command = Draygon's room - begin HUD drawing ;;;
Instruction_Draygon_RoomLoadingInterruptCmd_BeginHUDDraw:
    LDA.W #$000C                                                         ;A59895;
    STA.B DP_RoomLoadIRQCmd                                              ;A59898;
    RTL                                                                  ;A5989A;


;;; $989B: Instruction list - Draygon body - dying ;;;
InstList_DraygonBody_Dying_0:
    dw Instruction_Draygon_QueueSFXInY_Lib3_Max6,$001B                   ;A5989B;
    dw Instruction_DraygonBody_SetAsIntangible                           ;A5989F;
    dw Instruction_Common_TimerInY,$0008                                 ;A598A1;

InstList_DraygonBody_Dying_1:
    dw Instruction_Common_WaitYFrames,$000C                              ;A598A5;
    dw Inst_Draygon_SpawnDyingDraygonSpriteObject_BigExplosion           ;A598A9;
    dw Inst_Draygon_SpawnDyingDraygonSpriteObject_SmallExplosion         ;A598AB;
    dw Inst_Draygon_SpawnDyingDraygonSpriteObject_BigDustCloud           ;A598AD;
    dw Inst_Draygon_SpawnDyingDraygonSpriteObject_BreathBubbles          ;A598AF;
    dw Instruction_Draygon_QueueSFXInY_Lib2_Max6,$0025                   ;A598B1;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;A598B5;
    dw InstList_DraygonBody_Dying_1                                      ;A598B7;
    dw Instruction_Common_WaitYFrames,$0001                              ;A598B9;
    dw Instruction_Draygon_ParalyseDraygonTailAndArms                    ;A598BD;

InstList_DraygonBody_Dying_2:
    dw Instruction_Common_WaitYFrames,$0010                              ;A598BF;
    dw Inst_Draygon_SpawnDyingDraygonSpriteObject_BigExplosion           ;A598C3;
    dw Inst_Draygon_SpawnDyingDraygonSpriteObject_SmallExplosion         ;A598C5;
    dw Inst_Draygon_SpawnDyingDraygonSpriteObject_BigDustCloud           ;A598C7;
    dw Inst_Draygon_SpawnDyingDraygonSpriteObject_BreathBubbles          ;A598C9;
    dw Instruction_Draygon_QueueSFXInY_Lib2_Max6,$0025                   ;A598CB;
    dw Instruction_Common_GotoY                                          ;A598CF;
    dw InstList_DraygonBody_Dying_2                                      ;A598D1;


;;; $98D3: Instruction - paralyse Draygon tail and arms ;;;
Instruction_Draygon_ParalyseDraygonTailAndArms:
    PHX                                                                  ;A598D3;
    PHY                                                                  ;A598D4;
    LDA.W #$0001                                                         ;A598D5;
    STA.W Enemy[2].instTimer                                             ;A598D8;
    STA.W Enemy[3].instTimer                                             ;A598DB;
    LDA.W #InstList_Draygon_Sleep                                        ;A598DE;
    STA.W Enemy[2].instList                                              ;A598E1;
    LDA.W #InstList_Draygon_Sleep                                        ;A598E4;
    STA.W Enemy[3].instList                                              ;A598E7;
    PLY                                                                  ;A598EA;
    PLX                                                                  ;A598EB;
    RTL                                                                  ;A598EC;


;;; $98ED: Instruction list - delete ;;;
InstList_Draygon_Delete:
    dw Instruction_Common_DeleteEnemy                                    ;A598ED;


;;; $98EF: Instruction - set Draygon body as intangible ;;;
Instruction_DraygonBody_SetAsIntangible:
    PHX                                                                  ;A598EF;
    LDX.W EnemyIndex                                                     ;A598F0;
    LDA.W Enemy.properties                                               ;A598F3;
    ORA.W #$0400                                                         ;A598F6;
    STA.W Enemy.properties                                               ;A598F9;
    PLX                                                                  ;A598FC;
    RTL                                                                  ;A598FD;


;;; $98FE: Instruction list - Draygon body - facing left - fire goop ;;;
InstList_DraygonBody_FacingLeft_FireGoop:
    dw $0001,ExtendedSpritemap_Draygon_E                                 ;A598FE;
    dw $0002,ExtendedSpritemap_Draygon_F                                 ;A59902;
    dw $0003,ExtendedSpritemap_Draygon_10                                ;A59906;
    dw Instruction_Draygon_SpawnGoop_Leftwards                           ;A5990A;
    dw Instruction_Draygon_QueueSFXInY_Lib2_Max6,$004C                   ;A5990C;
    dw $0003,ExtendedSpritemap_Draygon_11                                ;A5990E;
    dw $0002,ExtendedSpritemap_Draygon_10                                ;A59914;
    dw $0002,ExtendedSpritemap_Draygon_F                                 ;A59918;
    dw $0001,ExtendedSpritemap_Draygon_E                                 ;A5991C;
    dw Instruction_Common_Sleep                                          ;A59920;


;;; $9922: Instruction list - Draygon body - facing left - roar ;;;
InstList_DraygonBody_FacingLeft_Roar:
    dw Instruction_Draygon_QueueSFXInY_Lib2_Max6,$0073                   ;A59922;
    dw $0006,ExtendedSpritemap_Draygon_E                                 ;A59924;
    dw $0006,ExtendedSpritemap_Draygon_F                                 ;A5992A;
    dw $0006,ExtendedSpritemap_Draygon_10                                ;A5992E;
    dw $0006,ExtendedSpritemap_Draygon_11                                ;A59932;
    dw $0006,ExtendedSpritemap_Draygon_10                                ;A59936;
    dw $0006,ExtendedSpritemap_Draygon_F                                 ;A5993A;
    dw $0006,ExtendedSpritemap_Draygon_E                                 ;A5993E;
    dw Instruction_Common_Sleep                                          ;A59942;


;;; $9944: Instruction list - Draygon eye - facing left - idle ;;;
InstList_DraygonEye_FacingLeft_Idle:
    dw $0015,ExtendedSpritemap_Draygon_12                                ;A59944;
    dw $0005,ExtendedSpritemap_Draygon_13                                ;A59948;
    dw $0005,ExtendedSpritemap_Draygon_14                                ;A5994C;
    dw $000A,ExtendedSpritemap_Draygon_13                                ;A59950;
    dw $000A,ExtendedSpritemap_Draygon_16                                ;A59954;
    dw $000A,ExtendedSpritemap_Draygon_16                                ;A59958;
    dw $000A,ExtendedSpritemap_Draygon_18                                ;A5995C;
    dw $000A,ExtendedSpritemap_Draygon_18                                ;A59960;
    dw $000A,ExtendedSpritemap_Draygon_19                                ;A59964;
    dw $0005,ExtendedSpritemap_Draygon_14                                ;A59968;
    dw $0005,ExtendedSpritemap_Draygon_13                                ;A5996C;
    dw $0005,ExtendedSpritemap_Draygon_12                                ;A59970;
    dw Instruction_Draygon_FunctionInY                                   ;A59974;
    dw Function_DraygonEye_FacingLeft                                    ;A59976;
    dw Instruction_Common_Sleep                                          ;A59978;


;;; $997A: Instruction list - Draygon eye - facing left - dying ;;;
InstList_DraygonEye_FacingLeft_Dying_0:
    dw Instruction_Common_TimerInY,$0004                                 ;A5997A;

InstList_DraygonEye_FacingLeft_Dying_1:
    dw $0004,ExtendedSpritemap_Draygon_16                                ;A5997E;
    dw $0004,ExtendedSpritemap_Draygon_18                                ;A59982;
    dw $0004,ExtendedSpritemap_Draygon_17                                ;A59986;
    dw $0004,ExtendedSpritemap_Draygon_19                                ;A5998A;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;A5998E;
    dw InstList_DraygonEye_FacingLeft_Dying_1                            ;A59990;
    dw $0020,ExtendedSpritemap_Draygon_15                                ;A59992;
    dw $0010,ExtendedSpritemap_Draygon_14                                ;A59996;
    dw Instruction_Common_Sleep                                          ;A5999A;


;;; $999C: Instruction list - Draygon eye - facing left - dead ;;;
InstList_DraygonEye_FacingLeft_Dead:
    dw $0020,ExtendedSpritemap_Draygon_15                                ;A5999C;
    dw $0020,ExtendedSpritemap_Draygon_14                                ;A599A0;
    dw $0020,ExtendedSpritemap_Draygon_13                                ;A599A4;
    dw $0001,ExtendedSpritemap_Draygon_12                                ;A599A8;
    dw Instruction_Common_Sleep                                          ;A599AC;


;;; $99AE: Instruction list - Draygon eye - facing left - looking left ;;;
InstList_DraygonEye_FacingLeft_LookingLeft:
    dw $0001,ExtendedSpritemap_Draygon_16                                ;A599AE;
    dw Instruction_Common_Sleep                                          ;A599B2;


;;; $99B4: Instruction list - Draygon eye - facing left - looking right ;;;
InstList_DraygonEye_FacingLeft_LookingRight:
    dw $0001,ExtendedSpritemap_Draygon_17                                ;A599B4;
    dw Instruction_Common_Sleep                                          ;A599B8;


;;; $99BA: Instruction list - Draygon eye - facing left - looking up ;;;
InstList_DraygonEye_FacingLeft_LookingUp:
    dw $0001,ExtendedSpritemap_Draygon_18                                ;A599BA;
    dw Instruction_Common_Sleep                                          ;A599BE;


;;; $99C0: Instruction list - Draygon eye - facing left - looking down ;;;
InstList_DraygonEye_FacingLeft_LookingDown:
    dw $0001,ExtendedSpritemap_Draygon_19                                ;A599C0;
    dw Instruction_Common_Sleep                                          ;A599C4;


;;; $99C6: Instruction list - Draygon tail - facing left - idle ;;;
InstList_DraygonTail_FacingLeft_Idle_0:
    dw $0008,ExtendedSpritemap_Draygon_22                                ;A599C6;
    dw $0007,ExtendedSpritemap_Draygon_23                                ;A599CA;
    dw $0006,ExtendedSpritemap_Draygon_24                                ;A599CE;
    dw $0006,ExtendedSpritemap_Draygon_25                                ;A599D2;
    dw $0006,ExtendedSpritemap_Draygon_26                                ;A599D6;
    dw $0006,ExtendedSpritemap_Draygon_27                                ;A599DA;
    dw $0006,ExtendedSpritemap_Draygon_28                                ;A599DE;
    dw $0006,ExtendedSpritemap_Draygon_27                                ;A599E2;
    dw $0006,ExtendedSpritemap_Draygon_26                                ;A599E6;
    dw $0006,ExtendedSpritemap_Draygon_25                                ;A599EA;
    dw $0006,ExtendedSpritemap_Draygon_24                                ;A599EE;
    dw $0007,ExtendedSpritemap_Draygon_23                                ;A599F2;
    dw Instruction_Common_GotoY                                          ;A599F6;
    dw InstList_DraygonTail_FacingLeft_Idle_0                            ;A599F8;

InstList_DraygonTail_FacingLeft_Idle_1:
    dw Instruction_Common_Sleep                                          ;A599FA;


;;; $99FC: Instruction list - Draygon tail - facing left - fake tail whip ;;;
InstList_DraygonTail_FacingLeft_FakeTailWhip:
; Set as initial instruction list for some reason, otherwise only set by debug routine
    dw Instruction_DraygonBody_DisplaceGraphics,$FFFF,$FFFF              ;A599FC;
    dw $0010,ExtendedSpritemap_Draygon_24                                ;A599FE;
    dw Instruction_DraygonBody_DisplaceGraphics,$FFFE,$FFFE              ;A59A06;
    dw $0006,ExtendedSpritemap_Draygon_29                                ;A59A08;
    dw Instruction_DraygonBody_DisplaceGraphics,$FFFD,$FFFD              ;A59A10;
    dw $0005,ExtendedSpritemap_Draygon_2A                                ;A59A12;
    dw Instruction_DraygonBody_DisplaceGraphics,$FFFC,$FFFC              ;A59A1A;
    dw $0004,ExtendedSpritemap_Draygon_2B                                ;A59A1C;
    dw Instruction_DraygonBody_DisplaceGraphics,$FFFB,$FFFB              ;A59A24;
    dw $0003,ExtendedSpritemap_Draygon_2C                                ;A59A26;
    dw Instruction_DraygonBody_DisplaceGraphics,$FFFA,$FFFA              ;A59A2E;
    dw $0002,ExtendedSpritemap_Draygon_2D                                ;A59A30;
    dw Instruction_DraygonBody_DisplaceGraphics,$FFF8,$FFF8              ;A59A38;
    dw $0001,ExtendedSpritemap_Draygon_2E                                ;A59A3A;
    dw Instruction_DraygonBody_DisplaceGraphics,$0000,$0000              ;A59A42;
    dw $0010,ExtendedSpritemap_Draygon_2F                                ;A59A44;
    dw $0001,ExtendedSpritemap_Draygon_2E                                ;A59A4C;
    dw $0002,ExtendedSpritemap_Draygon_2D                                ;A59A50;
    dw $0003,ExtendedSpritemap_Draygon_2C                                ;A59A54;
    dw $0004,ExtendedSpritemap_Draygon_2B                                ;A59A58;
    dw $0005,ExtendedSpritemap_Draygon_2A                                ;A59A5C;
    dw $0006,ExtendedSpritemap_Draygon_29                                ;A59A60;
    dw Instruction_Common_GotoY                                          ;A59A64;
    dw InstList_DraygonTail_FacingLeft_Idle_0                            ;A59A66;


;;; $9A68: Instruction list - Draygon tail - facing left - final tail whips ;;;
InstList_DraygonTail_FacingLeft_FinalTailWhips_0:
    dw Instruction_Common_TimerInY,$0004                                 ;A59A68;

InstList_DraygonTail_FacingLeft_FinalTailWhips_1:
    dw Instruction_DraygonBody_DisplaceGraphics,$FFFF,$FFFF              ;A59A6C;
    dw $0002,ExtendedSpritemap_Draygon_24                                ;A59A6E;
    dw Instruction_DraygonBody_DisplaceGraphics,$FFFE,$FFFE              ;A59A76;
    dw $0006,ExtendedSpritemap_Draygon_29                                ;A59A78;
    dw Instruction_DraygonBody_DisplaceGraphics,$FFFD,$FFFD              ;A59A80;
    dw $0005,ExtendedSpritemap_Draygon_2A                                ;A59A82;
    dw Instruction_DraygonBody_DisplaceGraphics,$FFFC,$FFFC              ;A59A8A;
    dw $0004,ExtendedSpritemap_Draygon_2B                                ;A59A8C;
    dw Instruction_DraygonBody_DisplaceGraphics,$FFFB,$FFFB              ;A59A94;
    dw $0003,ExtendedSpritemap_Draygon_2C                                ;A59A96;
    dw Instruction_DraygonBody_DisplaceGraphics,$FFFA,$FFFA              ;A59A9E;
    dw $0002,ExtendedSpritemap_Draygon_2D                                ;A59AA0;
    dw Instruction_DraygonBody_DisplaceGraphics,$FFF8,$FFF8              ;A59AA8;
    dw $0001,ExtendedSpritemap_Draygon_2E                                ;A59AAA;
    dw Instruction_DraygonBody_DisplaceGraphics,$0000,$0000              ;A59AB2;
    dw Instruction_DraygonTail_TailWhipHit                               ;A59AB8;
    dw Instruction_Draygon_QueueSFXInY_Lib2_Max6,$0025                   ;A59ABA;
    dw $0003,ExtendedSpritemap_Draygon_2F                                ;A59ABC;
    dw $0001,ExtendedSpritemap_Draygon_2E                                ;A59AC2;
    dw $0002,ExtendedSpritemap_Draygon_2D                                ;A59AC6;
    dw $0003,ExtendedSpritemap_Draygon_2C                                ;A59ACA;
    dw $0004,ExtendedSpritemap_Draygon_2B                                ;A59ACE;
    dw $0005,ExtendedSpritemap_Draygon_2A                                ;A59AD2;
    dw $0006,ExtendedSpritemap_Draygon_29                                ;A59AD6;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;A59ADA;
    dw InstList_DraygonTail_FacingLeft_FinalTailWhips_1                  ;A59ADC;
    dw Instruction_Draygon_BodyFunctionInY                               ;A59ADE;
    dw Function_DraygonBody_GrabbedSamus_FlailTail_FlyStraightUp         ;A59AE0;
    dw Instruction_Common_GotoY                                          ;A59AE2;
    dw InstList_DraygonTail_FacingLeft_Idle_0                            ;A59AE4;

InstList_DraygonTail_FacingLeft_FinalTailWhips_2:
    dw Instruction_Common_Sleep                                          ;A59AE6;


;;; $9AE8: Instruction list - Draygon tail - facing left - tail whip ;;;
InstList_DraygonTail_FacingLeft_TailWhip:
    dw Instruction_DraygonBody_DisplaceGraphics,$FFFF,$FFFF              ;A59AE8;
    dw $0002,ExtendedSpritemap_Draygon_24                                ;A59AEA;
    dw Instruction_DraygonBody_DisplaceGraphics,$FFFE,$FFFE              ;A59AF2;
    dw $0006,ExtendedSpritemap_Draygon_29                                ;A59AF4;
    dw Instruction_DraygonBody_DisplaceGraphics,$FFFD,$FFFD              ;A59AFC;
    dw $0005,ExtendedSpritemap_Draygon_2A                                ;A59AFE;
    dw Instruction_DraygonBody_DisplaceGraphics,$FFFC,$FFFC              ;A59B06;
    dw $0004,ExtendedSpritemap_Draygon_2B                                ;A59B08;
    dw Instruction_DraygonBody_DisplaceGraphics,$FFFB,$FFFB              ;A59B10;
    dw $0003,ExtendedSpritemap_Draygon_2C                                ;A59B12;
    dw Instruction_DraygonBody_DisplaceGraphics,$FFFA,$FFFA              ;A59B1A;
    dw $0002,ExtendedSpritemap_Draygon_2D                                ;A59B1C;
    dw Instruction_DraygonBody_DisplaceGraphics,$FFF8,$FFF8              ;A59B24;
    dw $0001,ExtendedSpritemap_Draygon_2E                                ;A59B26;
    dw Instruction_DraygonBody_DisplaceGraphics,$0000,$0000              ;A59B2E;
    dw Instruction_DraygonTail_TailWhipHit                               ;A59B34;
    dw Instruction_Draygon_QueueSFXInY_Lib2_Max6,$0025                   ;A59B36;
    dw $0003,ExtendedSpritemap_Draygon_2F                                ;A59B38;
    dw $0001,ExtendedSpritemap_Draygon_2E                                ;A59B3E;
    dw $0002,ExtendedSpritemap_Draygon_2D                                ;A59B42;
    dw $0003,ExtendedSpritemap_Draygon_2C                                ;A59B46;
    dw $0004,ExtendedSpritemap_Draygon_2B                                ;A59B4A;
    dw $0005,ExtendedSpritemap_Draygon_2A                                ;A59B4E;
    dw $0006,ExtendedSpritemap_Draygon_29                                ;A59B52;
    dw Instruction_Common_GotoY                                          ;A59B56;
    dw InstList_DraygonTail_FacingLeft_Idle_0                            ;A59B58;


;;; $9B5A: Instruction list - Draygon tail - facing left - tail flail ;;;
InstList_DraygonTail_FacingLeft_TailFlail:
; A tail whip move that Draygon does when Samus isn't grabbed (so it doesn't move Draygon's back or do a Samus hit)
    dw $0002,ExtendedSpritemap_Draygon_24                                ;A59B5A;
    dw $0006,ExtendedSpritemap_Draygon_29                                ;A59B5E;
    dw $0005,ExtendedSpritemap_Draygon_2A                                ;A59B62;
    dw $0004,ExtendedSpritemap_Draygon_2B                                ;A59B66;
    dw $0003,ExtendedSpritemap_Draygon_2C                                ;A59B6A;
    dw $0002,ExtendedSpritemap_Draygon_2D                                ;A59B6E;
    dw $0001,ExtendedSpritemap_Draygon_2E                                ;A59B72;
    dw Instruction_Draygon_QueueSFXInY_Lib2_Max6,$0025                   ;A59B76;
    dw $0003,ExtendedSpritemap_Draygon_2F                                ;A59B78;
    dw $0001,ExtendedSpritemap_Draygon_2E                                ;A59B7E;
    dw $0002,ExtendedSpritemap_Draygon_2D                                ;A59B82;
    dw $0003,ExtendedSpritemap_Draygon_2C                                ;A59B86;
    dw $0004,ExtendedSpritemap_Draygon_2B                                ;A59B8A;
    dw $0005,ExtendedSpritemap_Draygon_2A                                ;A59B8E;
    dw $0006,ExtendedSpritemap_Draygon_29                                ;A59B92;
    dw Instruction_Common_GotoY                                          ;A59B96;
    dw InstList_DraygonTail_FacingLeft_Idle_0                            ;A59B98;


;;; $9B9A: Instruction - Draygon tail whip hit ;;;
Instruction_DraygonTail_TailWhipHit:
; Uses the damage from the Draygon body enemy and not the Draygon tail enemy :(
    PHX                                                                  ;A59B9A;
    PHY                                                                  ;A59B9B;
    LDA.W #$0018*!SPF                                                    ;A59B9C;
    STA.L DraygonBody.swoopYAcceleration                                 ;A59B9F;
    LDX.W Enemy.ID                                                       ;A59BA3;
    LDA.L EnemyHeaders_damage,X                                          ;A59BA6;
    JSL.L Suit_Damage_Division                                           ;A59BAA;
    JSL.L Deal_A_Damage_to_Samus                                         ;A59BAE;
    LDA.W #$0020                                                         ;A59BB2;
    STA.W EarthquakeTimer                                                ;A59BB5;
    LDA.W #$0007                                                         ;A59BB8;
    STA.W EarthquakeType                                                 ;A59BBB;
    LDA.W SamusXPosition                                                 ;A59BBE;
    STA.B DP_Temp12                                                      ;A59BC1;
    LDA.W SamusYPosition                                                 ;A59BC3;
    CLC                                                                  ;A59BC6;
    ADC.W #$0010                                                         ;A59BC7;
    STA.B DP_Temp14                                                      ;A59BCA;
    LDA.W #$0015                                                         ;A59BCC;
    STA.B DP_Temp16                                                      ;A59BCF;
    STZ.B DP_Temp18                                                      ;A59BD1;
    JSL.L Create_Sprite_Object                                           ;A59BD3;
    PLY                                                                  ;A59BD7;
    PLX                                                                  ;A59BD8;
    RTL                                                                  ;A59BD9;


;;; $9BDA: Instruction list - Draygon arms - facing right - idle ;;;
InstList_DraygonArms_FacingRight_Idle_0:
    dw $0005,ExtendedSpritemap_Draygon_34                                ;A59BDA;
    dw $0005,ExtendedSpritemap_Draygon_35                                ;A59BDE;
    dw $0005,ExtendedSpritemap_Draygon_36                                ;A59BE2;
    dw $0005,ExtendedSpritemap_Draygon_37                                ;A59BE6;
    dw $0005,ExtendedSpritemap_Draygon_38                                ;A59BEA;
    dw $0005,ExtendedSpritemap_Draygon_39                                ;A59BEE;
    dw Instruction_Common_GotoY                                          ;A59BF2;
    dw InstList_DraygonArms_FacingRight_Idle_0                           ;A59BF4;

InstList_DraygonArms_FacingRight_Idle_1:
    dw Instruction_Common_Sleep                                          ;A59BF6;


if !FEATURE_KEEP_UNREFERENCED
;;; $9BF8: Unused. Instruction list - Draygon arms ;;;
UNUSED_InstList_DraygonArms_A59BF8:
    dw $0001,ExtendedSpritemap_Draygon_4D                                ;A59BF8;
    dw $0001,ExtendedSpritemap_Draygon_4C                                ;A59BFC;
    dw $0040,ExtendedSpritemap_Draygon_4B                                ;A59C00;
    dw Instruction_Common_Sleep                                          ;A59C04;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $9C06: Instruction list - Draygon arms - facing right - near swoop apex ;;;
InstList_DraygonArms_FacingRight_NearSwoopApex:
    dw $0001,ExtendedSpritemap_Draygon_4B                                ;A59C06;
    dw $0001,ExtendedSpritemap_Draygon_4C                                ;A59C0A;
    dw $0001,ExtendedSpritemap_Draygon_4D                                ;A59C0E;
    dw $0040,ExtendedSpritemap_Draygon_4E                                ;A59C12;
    dw Instruction_Common_Sleep                                          ;A59C16;


;;; $9C18: Instruction list - Draygon arms - facing right - fake grab ;;;
Debug_InstList_DraygonArms_FacingRight_FakeGrab:
; Only set by debug routine
    dw $0001,ExtendedSpritemap_Draygon_4B                                ;A59C18;
    dw $0001,ExtendedSpritemap_Draygon_4C                                ;A59C1C;
    dw $0001,ExtendedSpritemap_Draygon_4D                                ;A59C20;
    dw $0040,ExtendedSpritemap_Draygon_4E                                ;A59C24;
    dw $0001,ExtendedSpritemap_Draygon_4D                                ;A59C28;
    dw $0001,ExtendedSpritemap_Draygon_4C                                ;A59C2C;
    dw $0040,ExtendedSpritemap_Draygon_4B                                ;A59C30;
    dw Instruction_Common_GotoY                                          ;A59C34;
    dw InstList_DraygonArms_FacingRight_Idle_0                           ;A59C36;


;;; $9C38: Instruction list - Draygon arms - facing right - grab ;;;
InstList_DraygonArms_FacingRight_Grab:
    dw $0001,ExtendedSpritemap_Draygon_4B                                ;A59C38;
    dw $0001,ExtendedSpritemap_Draygon_4C                                ;A59C3C;
    dw $0001,ExtendedSpritemap_Draygon_4D                                ;A59C40;
    dw $0008,ExtendedSpritemap_Draygon_4E                                ;A59C44;
    dw $0001,ExtendedSpritemap_Draygon_4D                                ;A59C48;
    dw $0001,ExtendedSpritemap_Draygon_4C                                ;A59C4C;
    dw $0001,ExtendedSpritemap_Draygon_4B                                ;A59C50;
    dw $0001,ExtendedSpritemap_Draygon_4C                                ;A59C54;
    dw Instruction_Common_Sleep                                          ;A59C58;


;;; $9C5A: Instruction list - Draygon body - facing right - dying ;;;
InstList_DraygonArms_FacingRight_Dying_0:
    dw $0005,ExtendedSpritemap_Draygon_3A                                ;A59C5A;
    dw $0005,ExtendedSpritemap_Draygon_3B                                ;A59C5E;
    dw $0005,ExtendedSpritemap_Draygon_3C                                ;A59C62;
    dw $0005,ExtendedSpritemap_Draygon_3D                                ;A59C66;
    dw Instruction_Common_GotoY                                          ;A59C6A;
    dw InstList_DraygonBody_Dying_0                                      ;A59C6C;

InstList_DraygonBody_FacingRight_Dying_1:
    dw Instruction_Common_Sleep                                          ;A59C6E;


if !FEATURE_KEEP_UNREFERENCED
;;; $9C70: Unused. Instruction list - Draygon body ;;;
UNUSED_InstList_DraygonBody_A59C70:
    dw $0005,ExtendedSpritemap_Draygon_3C                                ;A59C70;
    dw $0005,ExtendedSpritemap_Draygon_3B                                ;A59C74;
    dw $0005,ExtendedSpritemap_Draygon_3A                                ;A59C78;
    dw Instruction_Common_Sleep                                          ;A59C7C;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $9C7E: Instruction list - Draygon body - facing right - idle ;;;
InstList_DraygonBody_FacingRight_Idle:
    dw Instruction_Draygon_RoomLoadingInterruptCmd_BeginHUDDraw_dup      ;A59C7E;
    dw Instruction_Draygon_EyeFunctionInY                                ;A59C80;
    dw Function_DraygonEye_FacingRight                                   ;A59C82;
    dw $0001,ExtendedSpritemap_Draygon_4A                                ;A59C84;
    dw Instruction_Common_Sleep                                          ;A59C88;


;;; $9C8A: Instruction - room loading interrupt command = Draygon's room - begin HUD drawing ;;;
Instruction_Draygon_RoomLoadingInterruptCmd_BeginHUDDraw_dup:
    LDA.W #$000C                                                         ;A59C8A;
    STA.B DP_RoomLoadIRQCmd                                              ;A59C8D;
    RTL                                                                  ;A59C8F;


;;; $9C90: Instruction list - Draygon body - facing right - fire goop ;;;
InstList_DraygonBody_FacingRight_FireGoop:
    dw $0001,ExtendedSpritemap_Draygon_3E                                ;A59C90;
    dw $0002,ExtendedSpritemap_Draygon_3F                                ;A59C94;
    dw $0003,ExtendedSpritemap_Draygon_40                                ;A59C98;
    dw Instruction_Draygon_SpawnGoop_Rightwards                          ;A59C9C;
    dw Instruction_Draygon_QueueSFXInY_Lib2_Max6,$004C                   ;A59C9E;
    dw $0003,ExtendedSpritemap_Draygon_41                                ;A59CA0;
    dw $0002,ExtendedSpritemap_Draygon_40                                ;A59CA6;
    dw $0002,ExtendedSpritemap_Draygon_3F                                ;A59CAA;
    dw $0001,ExtendedSpritemap_Draygon_3E                                ;A59CAE;
    dw Instruction_Common_Sleep                                          ;A59CB2;


;;; $9CB4: Instruction list - Draygon body - facing right - roar ;;;
InstList_DraygonBody_FacingRight_Roar:
    dw Instruction_Draygon_QueueSFXInY_Lib2_Max6,$0073                   ;A59CB4;
    dw $0006,ExtendedSpritemap_Draygon_3E                                ;A59CB6;
    dw $0006,ExtendedSpritemap_Draygon_3F                                ;A59CBC;
    dw $0006,ExtendedSpritemap_Draygon_40                                ;A59CC0;
    dw $0006,ExtendedSpritemap_Draygon_41                                ;A59CC4;
    dw $0006,ExtendedSpritemap_Draygon_40                                ;A59CC8;
    dw $0006,ExtendedSpritemap_Draygon_3F                                ;A59CCC;
    dw $0006,ExtendedSpritemap_Draygon_3E                                ;A59CD0;
    dw Instruction_Common_Sleep                                          ;A59CD4;


;;; $9CD6: Instruction list - Draygon eye - facing right - idle ;;;
InstList_DraygonEye_FacingRight_Idle:
    dw $0015,ExtendedSpritemap_Draygon_42                                ;A59CD6;
    dw $0005,ExtendedSpritemap_Draygon_43                                ;A59CDA;
    dw $0005,ExtendedSpritemap_Draygon_44                                ;A59CDE;
    dw $000A,ExtendedSpritemap_Draygon_43                                ;A59CE2;
    dw $000A,ExtendedSpritemap_Draygon_46                                ;A59CE6;
    dw $000A,ExtendedSpritemap_Draygon_46                                ;A59CEA;
    dw $000A,ExtendedSpritemap_Draygon_48                                ;A59CEE;
    dw $000A,ExtendedSpritemap_Draygon_48                                ;A59CF2;
    dw $000A,ExtendedSpritemap_Draygon_49                                ;A59CF6;
    dw $0005,ExtendedSpritemap_Draygon_44                                ;A59CFA;
    dw $0005,ExtendedSpritemap_Draygon_43                                ;A59CFE;
    dw $0005,ExtendedSpritemap_Draygon_42                                ;A59D02;
    dw Instruction_Draygon_FunctionInY                                   ;A59D06;
    dw Function_DraygonEye_FacingLeft                                    ;A59D08;
    dw Instruction_Common_Sleep                                          ;A59D0A;


if !FEATURE_KEEP_UNREFERENCED
;;; $9D0C: Unused. Instruction list - Draygon eye ;;;
UNUSED_InstList_DraygonEye_A59D0C:
    dw $0015,ExtendedSpritemap_Draygon_42                                ;A59D0C;
    dw $0005,ExtendedSpritemap_Draygon_43                                ;A59D10;
    dw $0005,ExtendedSpritemap_Draygon_44                                ;A59D14;
    dw $000A,ExtendedSpritemap_Draygon_45                                ;A59D18;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $9D1C: Instruction list - Draygon eye - facing right - dying ;;;
InstList_DraygonEye_FacingRight_Dying_0:
    dw Instruction_Common_TimerInY,$0004                                 ;A59D1C;

InstList_DraygonEye_FacingRight_Dying_1:
    dw $0004,ExtendedSpritemap_Draygon_46                                ;A59D20;
    dw $0004,ExtendedSpritemap_Draygon_48                                ;A59D24;
    dw $0004,ExtendedSpritemap_Draygon_47                                ;A59D28;
    dw $0004,ExtendedSpritemap_Draygon_49                                ;A59D2C;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;A59D30;
    dw InstList_DraygonEye_FacingRight_Dying_1                           ;A59D32;
    dw $0020,ExtendedSpritemap_Draygon_45                                ;A59D34;
    dw $0010,ExtendedSpritemap_Draygon_44                                ;A59D38;
    dw Instruction_Common_Sleep                                          ;A59D3C;


;;; $9D3E: Instruction list - Draygon eye - facing right - dead ;;;
InstList_DraygonEye_FacingRight_Dead:
    dw $0020,ExtendedSpritemap_Draygon_45                                ;A59D3E;
    dw $0020,ExtendedSpritemap_Draygon_44                                ;A59D42;
    dw $0020,ExtendedSpritemap_Draygon_43                                ;A59D46;
    dw $0001,ExtendedSpritemap_Draygon_42                                ;A59D4A;
    dw Instruction_Common_Sleep                                          ;A59D4E;


;;; $9D50: Instruction list - Draygon eye - facing right - looking right ;;;
InstList_DraygonEye_FacingRight_LookingRight:
    dw $0001,ExtendedSpritemap_Draygon_46                                ;A59D50;
    dw Instruction_Common_Sleep                                          ;A59D54;


;;; $9D56: Instruction list - Draygon eye - facing right - looking left ;;;
InstList_DraygonEye_FacingRight_LookingLeft:
    dw $0001,ExtendedSpritemap_Draygon_47                                ;A59D56;
    dw Instruction_Common_Sleep                                          ;A59D5A;


;;; $9D5C: Instruction list - Draygon eye - facing right - looking up ;;;
InstList_DraygonEye_FacingRight_LookingUp:
    dw $0001,ExtendedSpritemap_Draygon_48                                ;A59D5C;
    dw Instruction_Common_Sleep                                          ;A59D60;


;;; $9D62: Instruction list - Draygon eye - facing right - looking down ;;;
InstList_DraygonEye_FacingRight_LookingDown:
    dw $0001,ExtendedSpritemap_Draygon_49                                ;A59D62;
    dw Instruction_Common_Sleep                                          ;A59D66;


;;; $9D68: Instruction list - Draygon tail - facing right - idle ;;;
InstList_DraygonTail_FacingRight_Idle_0:
if !PAL == 0
    dw $0008,ExtendedSpritemap_Draygon_59                                ;A59D68;
endif
    dw $0007,ExtendedSpritemap_Draygon_5A                                ;A59D6C;
    dw $0006,ExtendedSpritemap_Draygon_5B                                ;A59D70;
    dw $0006,ExtendedSpritemap_Draygon_5C                                ;A59D74;
    dw $0006,ExtendedSpritemap_Draygon_5D                                ;A59D78;
    dw $0006,ExtendedSpritemap_Draygon_5E                                ;A59D7C;
    dw $0006,ExtendedSpritemap_Draygon_5F                                ;A59D80;
    dw $0006,ExtendedSpritemap_Draygon_5E                                ;A59D84;
    dw $0006,ExtendedSpritemap_Draygon_5D                                ;A59D88;
    dw $0006,ExtendedSpritemap_Draygon_5C                                ;A59D8C;
    dw $0006,ExtendedSpritemap_Draygon_5B                                ;A59D90;
    dw $0007,ExtendedSpritemap_Draygon_5A                                ;A59D94;
    dw Instruction_Common_GotoY                                          ;A59D98;
    dw InstList_DraygonTail_FacingRight_Idle_0                           ;A59D9A;

InstList_DraygonTail_FacingRight_Idle_1:
    dw Instruction_Common_Sleep                                          ;A59D9C;


;;; $9D9E: Instruction list - Draygon tail - facing right - fake tail whip ;;;
Debug_InstList_DraygonTail_FacingRight_FakeTailWhip:
; Only set by debug routine
    dw Instruction_DraygonBody_DisplaceGraphics,$0001,$FFFF              ;A59D9E;
    dw $0010,ExtendedSpritemap_Draygon_5B                                ;A59DA0;
    dw Instruction_DraygonBody_DisplaceGraphics,$0002,$FFFE              ;A59DA8;
    dw $0006,ExtendedSpritemap_Draygon_60                                ;A59DAA;
    dw Instruction_DraygonBody_DisplaceGraphics,$0003,$FFFD              ;A59DB2;
    dw $0005,ExtendedSpritemap_Draygon_61                                ;A59DB4;
    dw Instruction_DraygonBody_DisplaceGraphics,$0004,$FFFC              ;A59DBC;
    dw $0004,ExtendedSpritemap_Draygon_62                                ;A59DBE;
    dw Instruction_DraygonBody_DisplaceGraphics,$0005,$FFFB              ;A59DC6;
    dw $0003,ExtendedSpritemap_Draygon_63                                ;A59DC8;
    dw Instruction_DraygonBody_DisplaceGraphics,$0006,$FFFA              ;A59DD0;
    dw $0002,ExtendedSpritemap_Draygon_64                                ;A59DD2;
    dw Instruction_DraygonBody_DisplaceGraphics,$0008,$FFF9              ;A59DDA;
    dw $0001,ExtendedSpritemap_Draygon_65                                ;A59DDC;
    dw Instruction_DraygonBody_DisplaceGraphics,$0000,$0000              ;A59DE4;
    dw $0010,ExtendedSpritemap_Draygon_66                                ;A59DE6;
    dw $0001,ExtendedSpritemap_Draygon_65                                ;A59DEE;
    dw $0002,ExtendedSpritemap_Draygon_64                                ;A59DF2;
    dw $0003,ExtendedSpritemap_Draygon_63                                ;A59DF6;
    dw $0004,ExtendedSpritemap_Draygon_62                                ;A59DFA;
    dw $0005,ExtendedSpritemap_Draygon_61                                ;A59DFE;
    dw $0006,ExtendedSpritemap_Draygon_60                                ;A59E02;
    dw Instruction_Common_GotoY                                          ;A59E06;
    dw InstList_DraygonTail_FacingRight_Idle_0                           ;A59E08;


;;; $9E0A: Instruction - displace Draygon body graphics [[Y]] px left, [[Y] + 2] px down ;;;
Instruction_DraygonBody_DisplaceGraphics:
    PHX                                                                  ;A59E0A;
    PHY                                                                  ;A59E0B;
    LDA.W $0000,Y                                                        ;A59E0C;
    STA.L DraygonBody.bodyGraphicsXDisplacement                          ;A59E0F;
    LDA.W $0002,Y                                                        ;A59E13;
    STA.L DraygonBody.bodyGraphicsYDisplacement                          ;A59E16;
    PLY                                                                  ;A59E1A;
    PLX                                                                  ;A59E1B;
    INY                                                                  ;A59E1C;
    INY                                                                  ;A59E1D;
    INY                                                                  ;A59E1E;
    INY                                                                  ;A59E1F;
    RTL                                                                  ;A59E20;


;;; $9E21: Instruction list - Draygon tail - facing right - final tail whips ;;;
InstList_DraygonTail_FacingRight_FinalTailWhips_0:
    dw Instruction_Common_TimerInY,$0004                                 ;A59E21;

InstList_DraygonTail_FacingRight_FinalTailWhips_1:
    dw Instruction_DraygonBody_DisplaceGraphics,$0001,$FFFF              ;A59E25;
    dw $0002,ExtendedSpritemap_Draygon_5B                                ;A59E27;
    dw Instruction_DraygonBody_DisplaceGraphics,$0002,$FFFE              ;A59E2F;
    dw $0006,ExtendedSpritemap_Draygon_60                                ;A59E31;
    dw Instruction_DraygonBody_DisplaceGraphics,$0003,$FFFD              ;A59E39;
    dw $0005,ExtendedSpritemap_Draygon_61                                ;A59E3B;
    dw Instruction_DraygonBody_DisplaceGraphics,$0004,$FFFC              ;A59E43;
    dw $0004,ExtendedSpritemap_Draygon_62                                ;A59E45;
    dw Instruction_DraygonBody_DisplaceGraphics,$0005,$FFFB              ;A59E4D;
    dw $0003,ExtendedSpritemap_Draygon_63                                ;A59E4F;
    dw Instruction_DraygonBody_DisplaceGraphics,$0006,$FFFA              ;A59E57;
    dw $0002,ExtendedSpritemap_Draygon_64                                ;A59E59;
    dw Instruction_DraygonBody_DisplaceGraphics,$0008,$FFF8              ;A59E61;
    dw $0001,ExtendedSpritemap_Draygon_65                                ;A59E63;
    dw Instruction_DraygonBody_DisplaceGraphics,$0000,$0000              ;A59E6B;
    dw Instruction_DraygonTail_TailWhipHit                               ;A59E71;
    dw Instruction_Draygon_QueueSFXInY_Lib2_Max6,$0025                   ;A59E73;
    dw $0003,ExtendedSpritemap_Draygon_66                                ;A59E79;
    dw $0001,ExtendedSpritemap_Draygon_65                                ;A59E7B;
    dw $0002,ExtendedSpritemap_Draygon_64                                ;A59E7F;
    dw $0003,ExtendedSpritemap_Draygon_63                                ;A59E83;
    dw $0004,ExtendedSpritemap_Draygon_62                                ;A59E87;
    dw $0005,ExtendedSpritemap_Draygon_61                                ;A59E8B;
    dw $0006,ExtendedSpritemap_Draygon_60                                ;A59E8F;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;A59E93;
    dw InstList_DraygonTail_FacingRight_FinalTailWhips_1                 ;A59E95;
    dw Instruction_Draygon_BodyFunctionInY                               ;A59E97;
    dw Function_DraygonBody_GrabbedSamus_FlailTail_FlyStraightUp         ;A59E99;
    dw Instruction_Common_GotoY                                          ;A59E9B;
    dw InstList_DraygonTail_FacingRight_Idle_0                           ;A59E9D;

InstList_DraygonTail_FacingRight_FinalTailWhips_2:
    dw Instruction_Common_Sleep                                          ;A59E9F;


;;; $9EA1: Instruction list - Draygon tail - facing right - tail whip ;;;
InstList_DraygonTail_FacingRight_TailWhip_0:
    dw Instruction_DraygonBody_DisplaceGraphics,$0001,$FFFF              ;A59EA1;
    dw $0002,ExtendedSpritemap_Draygon_5B                                ;A59EA3;
    dw Instruction_DraygonBody_DisplaceGraphics,$0002,$FFFE              ;A59EAB;
    dw $0006,ExtendedSpritemap_Draygon_60                                ;A59EAD;
    dw Instruction_DraygonBody_DisplaceGraphics,$0003,$FFFD              ;A59EB5;
    dw $0005,ExtendedSpritemap_Draygon_61                                ;A59EB7;
    dw Instruction_DraygonBody_DisplaceGraphics,$0004,$FFFC              ;A59EBF;
    dw $0004,ExtendedSpritemap_Draygon_62                                ;A59EC1;
    dw Instruction_DraygonBody_DisplaceGraphics,$0005,$FFFB              ;A59EC9;
    dw $0003,ExtendedSpritemap_Draygon_63                                ;A59ECB;
    dw Instruction_DraygonBody_DisplaceGraphics,$0006,$FFFA              ;A59ED3;
    dw $0002,ExtendedSpritemap_Draygon_64                                ;A59ED5;
    dw Instruction_DraygonBody_DisplaceGraphics,$0008,$FFF8              ;A59EDD;
    dw $0001,ExtendedSpritemap_Draygon_65                                ;A59EDF;
    dw Instruction_DraygonBody_DisplaceGraphics,$0000,$0000              ;A59EE7;
    dw Instruction_DraygonTail_TailWhipHit                               ;A59EED;
    dw Instruction_Draygon_QueueSFXInY_Lib2_Max6,$0025                   ;A59EEF;
    dw $0003,ExtendedSpritemap_Draygon_66                                ;A59EF1;
    dw $0001,ExtendedSpritemap_Draygon_65                                ;A59EF7;
    dw $0002,ExtendedSpritemap_Draygon_64                                ;A59EFB;
    dw $0003,ExtendedSpritemap_Draygon_63                                ;A59EFF;
    dw $0004,ExtendedSpritemap_Draygon_62                                ;A59F03;
    dw $0005,ExtendedSpritemap_Draygon_61                                ;A59F07;
    dw $0006,ExtendedSpritemap_Draygon_60                                ;A59F0B;
    dw Instruction_Common_GotoY                                          ;A59F0F;
    dw InstList_DraygonTail_FacingRight_Idle_0                           ;A59F11;

InstList_DraygonTail_FacingRight_TailWhip_1:
    dw Instruction_Common_Sleep                                          ;A59F13;


;;; $9F15: Instruction list - Draygon tail - facing right - tail flail ;;;
InstList_DraygonTail_FacingRight_TailFlail_0:
; A tail whip move that Draygon does when Samus isn't grabbed (so it doesn't move Draygon's back or do a Samus hit)
    dw $0002,ExtendedSpritemap_Draygon_5B                                ;A59F15;
    dw $0006,ExtendedSpritemap_Draygon_60                                ;A59F19;
    dw $0005,ExtendedSpritemap_Draygon_61                                ;A59F1D;
    dw $0004,ExtendedSpritemap_Draygon_62                                ;A59F21;
    dw $0003,ExtendedSpritemap_Draygon_63                                ;A59F25;
    dw $0002,ExtendedSpritemap_Draygon_64                                ;A59F29;
    dw $0001,ExtendedSpritemap_Draygon_65                                ;A59F2D;
    dw Instruction_Draygon_QueueSFXInY_Lib2_Max6,$0025                   ;A59F31;
    dw $0003,ExtendedSpritemap_Draygon_66                                ;A59F33;
    dw $0001,ExtendedSpritemap_Draygon_65                                ;A59F39;
    dw $0002,ExtendedSpritemap_Draygon_64                                ;A59F3D;
    dw $0003,ExtendedSpritemap_Draygon_63                                ;A59F41;
    dw $0004,ExtendedSpritemap_Draygon_62                                ;A59F45;
    dw $0005,ExtendedSpritemap_Draygon_61                                ;A59F49;
    dw $0006,ExtendedSpritemap_Draygon_60                                ;A59F4D;
    dw Instruction_Common_GotoY                                          ;A59F51;
    dw InstList_DraygonTail_FacingRight_Idle_0                           ;A59F53;

InstList_DraygonTail_FacingRight_TailFlail_1:
    dw Instruction_Common_Sleep                                          ;A59F55;


;;; $9F57: Instruction - Draygon body function = [[Y]] ;;;
Instruction_Draygon_BodyFunctionInY:
    LDA.W $0000,Y                                                        ;A59F57;
    STA.W DraygonBody.function                                           ;A59F5A;
    INY                                                                  ;A59F5D;
    INY                                                                  ;A59F5E;
    RTL                                                                  ;A59F5F;


;;; $9F60: Instruction - queue sound [[Y]], sound library 2, max sounds allowed = 6 ;;;
Instruction_Draygon_QueueSFXInY_Lib2_Max6:
    PHX                                                                  ;A59F60;
    PHY                                                                  ;A59F61;
    LDA.W $0000,Y                                                        ;A59F62;
    JSL.L QueueSound_Lib2_Max6                                           ;A59F65;
    PLY                                                                  ;A59F69;
    PLX                                                                  ;A59F6A;
    INY                                                                  ;A59F6B;
    INY                                                                  ;A59F6C;
    RTL                                                                  ;A59F6D;


;;; $9F6E: Instruction - queue sound [[Y]], sound library 3, max sounds allowed = 6 ;;;
Instruction_Draygon_QueueSFXInY_Lib3_Max6:
    PHX                                                                  ;A59F6E;
    PHY                                                                  ;A59F6F;
    LDA.W $0000,Y                                                        ;A59F70;
    JSL.L QueueSound_Lib3_Max6                                           ;A59F73;
    PLY                                                                  ;A59F77;
    PLX                                                                  ;A59F78;
    INY                                                                  ;A59F79;
    INY                                                                  ;A59F7A;
    RTL                                                                  ;A59F7B;


;;; $9F7C: Instruction - spawn Draygon goop - leftwards ;;;
Instruction_Draygon_SpawnGoop_Leftwards:
; Doesn't set enemy projectile initialisation parameter 0 (speed) :/
    PHX                                                                  ;A59F7C;
    PHY                                                                  ;A59F7D;
    LDX.W EnemyIndex                                                     ;A59F7E;
    LDA.W Enemy.XPosition                                                ;A59F81;
    CLC                                                                  ;A59F84;
    ADC.W #$FFE4                                                         ;A59F85;
    STA.B DP_Temp12                                                      ;A59F88;
    LDA.W Enemy.YPosition                                                ;A59F8A;
    CLC                                                                  ;A59F8D;
    ADC.W #$FFF0                                                         ;A59F8E;
    STA.B DP_Temp14                                                      ;A59F91;
    JSL.L GenerateRandomNumber                                           ;A59F93;
    AND.W #$003F                                                         ;A59F97;
    CLC                                                                  ;A59F9A;
    ADC.W #$0080                                                         ;A59F9B;
    STA.W EnemyProjectile_InitParam1                                     ;A59F9E;
    LDY.W #EnemyProjectile_DraygonGoop                                   ;A59FA1;
    LDA.W #$0002                                                         ;A59FA4;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A59FA7;
    PLY                                                                  ;A59FAB;
    PLX                                                                  ;A59FAC;
    RTL                                                                  ;A59FAD;


;;; $9FAE: Instruction - spawn Draygon goop - rightwards ;;;
Instruction_Draygon_SpawnGoop_Rightwards:
; Doesn't set enemy projectile initialisation parameter 0 (speed) :/
    PHX                                                                  ;A59FAE;
    PHY                                                                  ;A59FAF;
    LDX.W EnemyIndex                                                     ;A59FB0;
    LDA.W Enemy.XPosition                                                ;A59FB3;
    CLC                                                                  ;A59FB6;
    ADC.W #$0018                                                         ;A59FB7;
    STA.B DP_Temp12                                                      ;A59FBA;
    LDA.W Enemy.YPosition                                                ;A59FBC;
    CLC                                                                  ;A59FBF;
    ADC.W #$FFF0                                                         ;A59FC0;
    STA.B DP_Temp14                                                      ;A59FC3;
    JSL.L GenerateRandomNumber                                           ;A59FC5;
    AND.W #$003F                                                         ;A59FC9;
    CLC                                                                  ;A59FCC;
    ADC.W #$00C0                                                         ;A59FCD;
    STA.W EnemyProjectile_InitParam1                                     ;A59FD0;
    LDY.W #EnemyProjectile_DraygonGoop                                   ;A59FD3;
    LDA.W #$0002                                                         ;A59FD6;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A59FD9;
    PLY                                                                  ;A59FDD;
    PLX                                                                  ;A59FDE;
    RTL                                                                  ;A59FDF;


;;; $9FE0: Handle death sequence evir movement ;;;
HandleDeathSequenceEvirMovement:
; Where does $0E24 come from? Maybe CalculateDraygonSwoopYPositions? Only used when moving left. Supposed to be `SBC #$0000`?
    PHY                                                                  ;A59FE0;
    LDX.W #$003E                                                         ;A59FE1;
    LDY.W #$0014                                                         ;A59FE4;

  .loop:
    LDA.W DraygonDeathSequenceEvirAngles,Y                               ;A59FE7;
    CLC                                                                  ;A59FEA;
    ADC.W #$0040                                                         ;A59FEB;
    BIT.W #$0080                                                         ;A59FEE;
    BEQ +                                                                ;A59FF1;
    LDA.L SpriteObjects_XSubPositions,X                                  ;A59FF3;
    CLC                                                                  ;A59FF7;
    ADC.W DraygonDeathSequenceEvirSubSpeeds_X,Y                          ;A59FF8;
    STA.L SpriteObjects_XSubPositions,X                                  ;A59FFB;
    LDA.L SpriteObjects_XPositions,X                                     ;A59FFF;
    ADC.W #$0000                                                         ;A5A003;
    STA.L SpriteObjects_XPositions,X                                     ;A5A006;
    BRA .YPosition                                                       ;A5A00A;

+   LDA.L SpriteObjects_XSubPositions,X                                  ;A5A00C;
    SEC                                                                  ;A5A010;
    SBC.W DraygonDeathSequenceEvirSubSpeeds_X,Y                          ;A5A011;
    STA.L SpriteObjects_XSubPositions,X                                  ;A5A014;
    LDA.L SpriteObjects_XPositions,X                                     ;A5A018;
    SBC.W Temp_XVelocity                                                 ;A5A01C;
    STA.L SpriteObjects_XPositions,X                                     ;A5A01F;

  .YPosition:
    LDA.W DraygonDeathSequenceEvirAngles,Y                               ;A5A023;
    CLC                                                                  ;A5A026;
    ADC.W #$0080                                                         ;A5A027;
    BIT.W #$0080                                                         ;A5A02A;
    BEQ +                                                                ;A5A02D;
    LDA.L SpriteObjects_YSubPositions,X                                  ;A5A02F;
    CLC                                                                  ;A5A033;
    ADC.W DraygonDeathSequenceEvirSubSpeeds_Y,Y                          ;A5A034;
    STA.L SpriteObjects_YSubPositions,X                                  ;A5A037;
    LDA.L SpriteObjects_YPositions,X                                     ;A5A03B;
    ADC.W #$0000                                                         ;A5A03F;
    STA.L SpriteObjects_YPositions,X                                     ;A5A042;
    BRA .nextSpriteObject                                                ;A5A046;

+   LDA.L SpriteObjects_YSubPositions,X                                  ;A5A048;
    SEC                                                                  ;A5A04C;
    SBC.W DraygonDeathSequenceEvirSubSpeeds_Y,Y                          ;A5A04D;
    STA.L SpriteObjects_YSubPositions,X                                  ;A5A050;
    LDA.L SpriteObjects_YPositions,X                                     ;A5A054;
    SBC.W #$0000                                                         ;A5A058;
    STA.L SpriteObjects_YPositions,X                                     ;A5A05B;

  .nextSpriteObject:
    DEX                                                                  ;A5A05F;
    DEX                                                                  ;A5A060;
    DEY                                                                  ;A5A061;
    DEY                                                                  ;A5A062;
    DEY                                                                  ;A5A063;
    DEY                                                                  ;A5A064;
    BPL .gotoLoop                                                        ;A5A065;
    PLY                                                                  ;A5A067;
    RTS                                                                  ;A5A068;

  .gotoLoop:
    JMP.W .loop                                                          ;A5A069;


;;; $A06C: Spawn death sequence evir sprite objects ;;;
SpawnDeathSequenceEvirSpriteObjects:
    PHX                                                                  ;A5A06C;
    PHY                                                                  ;A5A06D;
    LDX.W #$003E                                                         ;A5A06E;
    LDA.W #$0000                                                         ;A5A071;

  .loopClearSpriteObjects:
    STA.L SpriteObjects_InstListPointers,X                               ;A5A074;
    DEX                                                                  ;A5A078;
    DEX                                                                  ;A5A079;
    BPL .loopClearSpriteObjects                                          ;A5A07A;
    LDX.W #$0002                                                         ;A5A07C;
    LDY.W #$0014                                                         ;A5A07F;

  .loopLeft:
    LDA.W DraygonDeathSequenceEvirSpawnPositions_X,Y                     ;A5A082;
    STA.B DP_Temp12                                                      ;A5A085;
    LDA.W DraygonDeathSequenceEvirSpawnPositions_Y,Y                     ;A5A087;
    STA.B DP_Temp14                                                      ;A5A08A;
    LDA.W #$003B                                                         ;A5A08C;
    STA.B DP_Temp16                                                      ;A5A08F;
    LDA.W #$0E00                                                         ;A5A091;
    STA.B DP_Temp18                                                      ;A5A094;
    JSL.L Create_Sprite_Object                                           ;A5A096;
    DEY                                                                  ;A5A09A;
    DEY                                                                  ;A5A09B;
    DEY                                                                  ;A5A09C;
    DEY                                                                  ;A5A09D;
    DEX                                                                  ;A5A09E;
    BPL .loopLeft                                                        ;A5A09F;
    LDX.W #$0002                                                         ;A5A0A1;

  .loopRight:
    LDA.W DraygonDeathSequenceEvirSpawnPositions_X,Y                     ;A5A0A4;
    STA.B DP_Temp12                                                      ;A5A0A7;
    LDA.W DraygonDeathSequenceEvirSpawnPositions_Y,Y                     ;A5A0A9;
    STA.B DP_Temp14                                                      ;A5A0AC;
    LDA.W #$003C                                                         ;A5A0AE;
    STA.B DP_Temp16                                                      ;A5A0B1;
    LDA.W #$0E00                                                         ;A5A0B3;
    STA.B DP_Temp18                                                      ;A5A0B6;
    JSL.L Create_Sprite_Object                                           ;A5A0B8;
    DEY                                                                  ;A5A0BC;
    DEY                                                                  ;A5A0BD;
    DEY                                                                  ;A5A0BE;
    DEY                                                                  ;A5A0BF;
    DEX                                                                  ;A5A0C0;
    BPL .loopRight                                                       ;A5A0C1;
    PLY                                                                  ;A5A0C3;
    PLX                                                                  ;A5A0C4;
    RTS                                                                  ;A5A0C5;


;;; $A0C6: Clear sprite objects ;;;
Draygon_ClearSpriteObjects:
    PHX                                                                  ;A5A0C6;
    PHY                                                                  ;A5A0C7;
    LDX.W #$003E                                                         ;A5A0C8;
    LDA.W #$0000                                                         ;A5A0CB;

  .loop:
    STA.L SpriteObjects_InstListPointers,X                               ;A5A0CE;
    DEX                                                                  ;A5A0D2;
    DEX                                                                  ;A5A0D3;
    BPL .loop                                                            ;A5A0D4;
    PLY                                                                  ;A5A0D6;
    PLX                                                                  ;A5A0D7;
    RTS                                                                  ;A5A0D8;


;;; $A0D9: Spawn fight intro evir sprite objects ;;;
SpawnFightIntroEvirSpriteObjects:
    PHX                                                                  ;A5A0D9;
    PHY                                                                  ;A5A0DA;
    LDA.W #$0010                                                         ;A5A0DB;
    STA.B DP_Temp12                                                      ;A5A0DE;
    LDA.W #$0180                                                         ;A5A0E0;
    STA.B DP_Temp14                                                      ;A5A0E3;
    LDA.W #$003B                                                         ;A5A0E5;
    STA.B DP_Temp16                                                      ;A5A0E8;
    LDA.W #$0E00                                                         ;A5A0EA;
    STA.B DP_Temp18                                                      ;A5A0ED;
    JSL.L Create_Sprite_Object                                           ;A5A0EF;
    LDA.W #$0010                                                         ;A5A0F3;
    STA.B DP_Temp12                                                      ;A5A0F6;
    LDA.W #$0180                                                         ;A5A0F8;
    STA.B DP_Temp14                                                      ;A5A0FB;
    LDA.W #$003B                                                         ;A5A0FD;
    STA.B DP_Temp16                                                      ;A5A100;
    LDA.W #$0E00                                                         ;A5A102;
    STA.B DP_Temp18                                                      ;A5A105;
    JSL.L Create_Sprite_Object                                           ;A5A107;
    LDA.W #$0010                                                         ;A5A10B;
    STA.B DP_Temp12                                                      ;A5A10E;
    LDA.W #$0180                                                         ;A5A110;
    STA.B DP_Temp14                                                      ;A5A113;
    LDA.W #$003B                                                         ;A5A115;
    STA.B DP_Temp16                                                      ;A5A118;
    LDA.W #$0E00                                                         ;A5A11A;
    STA.B DP_Temp18                                                      ;A5A11D;
    JSL.L Create_Sprite_Object                                           ;A5A11F;
    LDA.W #$0010                                                         ;A5A123;
    STA.B DP_Temp12                                                      ;A5A126;
    LDA.W #$0180                                                         ;A5A128;
    STA.B DP_Temp14                                                      ;A5A12B;
    LDA.W #$003B                                                         ;A5A12D;
    STA.B DP_Temp16                                                      ;A5A130;
    LDA.W #$0E00                                                         ;A5A132;
    STA.B DP_Temp18                                                      ;A5A135;
    JSL.L Create_Sprite_Object                                           ;A5A137;
    PLY                                                                  ;A5A13B;
    PLX                                                                  ;A5A13C;
    RTS                                                                  ;A5A13D;


;;; $A13E: Handle Draygon fight intro dance ;;;
HandleDraygonFightIntroDance:
; There's 8 entries in the movement latency table MovementLatencyForEachEvirSpriteObject, but only 4 evir are processed
; I guess there was supposed to be 8 originally and then it was reduced to 4?
; In any case, it's the first four entries of the table that are used, where the last 4 would have made more sense
; The consequence of this is a 128 frames of this routine doing nothing
    PHY                                                                  ;A5A13E;
    LDX.W #$003E                                                         ;A5A13F;

  .loop:
    TXA                                                                  ;A5A142;
    SEC                                                                  ;A5A143;
    SBC.W #$0038                                                         ;A5A144;
    TAY                                                                  ;A5A147;
    LDA.W MovementLatencyForEachEvirSpriteObject,Y                       ;A5A148;
    CLC                                                                  ;A5A14B;
    ADC.L DraygonBody.fightIntroDanceIndex                               ;A5A14C;
    BMI .next                                                            ;A5A150;
    TAY                                                                  ;A5A152;
    LDA.W DraygonFightIntroDanceData_KeikoLove,Y                         ;A5A153;
    CMP.W #$8080                                                         ;A5A156;
    BEQ .deleteSpriteObject                                              ;A5A159;
    LDA.W DraygonFightIntroDanceData_KeikoLove,Y                         ;A5A15B;
    AND.W #$00FF                                                         ;A5A15E;
    JSL.L Sign_Extend_A                                                  ;A5A161;
    CLC                                                                  ;A5A165;
    ADC.L SpriteObjects_XPositions,X                                     ;A5A166;
    STA.L SpriteObjects_XPositions,X                                     ;A5A16A;
    LDA.W DraygonFightIntroDanceData_KeikoLove+1,Y                       ;A5A16E;
    AND.W #$00FF                                                         ;A5A171;
    JSL.L Sign_Extend_A                                                  ;A5A174;
    CLC                                                                  ;A5A178;
    ADC.L SpriteObjects_YPositions,X                                     ;A5A179;
    STA.L SpriteObjects_YPositions,X                                     ;A5A17D;

  .next:
    DEX                                                                  ;A5A181;
    DEX                                                                  ;A5A182;
    CPX.W #$0038                                                         ;A5A183;
    BPL .loop                                                            ;A5A186;
    LDA.L DraygonBody.fightIntroDanceIndex                               ;A5A188;
    INC                                                                  ;A5A18C;
    INC                                                                  ;A5A18D;
    INC                                                                  ;A5A18E;
    INC                                                                  ;A5A18F;
    STA.L DraygonBody.fightIntroDanceIndex                               ;A5A190;
    PLY                                                                  ;A5A194;
    RTS                                                                  ;A5A195;

  .deleteSpriteObject:
    LDA.W #$0000                                                         ;A5A196;
    STA.L SpriteObjects_InstListPointers,X                               ;A5A199;
    BRA .next                                                            ;A5A19D;


; Movement latency for each evir sprite object (each evir moves 80h bytes later in the movement table than the next)
MovementLatencyForEachEvirSpriteObject:
    dw $FC80,$FD00,$FD80,$FE00                                           ;A5A19F;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_MovementLatencyForEachEvirSpriteObject_A5A1A7:
    dw $FE80,$FF00,$FF80,$0000                                           ;A5A1A7;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $A1AF: Death sequence evir subspeeds ;;;
DraygonDeathSequenceEvirSubSpeeds:
;        _________ X subspeed
;       |      ___ Y subspeed
;       |     |
  .X:
    dw $D4DA                                                             ;A5A1AF;
  .Y:                                                                    ;A5A1B1;
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
    dw $FF59                                                             ;A5A1C7;
  .Y:
    dw       $00E5                                                       ;A5A1C9;
    dw $FFE5,$0059
    dw $009C,$000D
    dw $0163,$000D
    dw $021A,$0059
    dw $02A6,$00E5


;;; $A1DF: Death sequence evir angles ;;;
DraygonDeathSequenceEvirAngles:
; Used *only* to decide the sign of the X/Y subspeeds at DraygonDeathSequenceEvirSubSpeeds
; 0 = left(!), positive = clockwise
    dw $0068,$0000                                                       ;A5A1DF;
    dw $0058,$0000
    dw $0048,$0000
    dw $0038,$0000
    dw $0028,$0000
    dw $0018,$0000


;;; $A1F7: Draygon palettes ;;;
Palette_Draygon_Sprite7:
; Sprite palette 7
    dw $3800,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166                   ;A5A1F7;
    dw $0924,$0319,$0254,$018F,$00CA,$581B,$1892,$0145                   ;A5A207;

Palette_Draygon_Sprite1:
; Sprite palette 1
    dw $3800,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166                   ;A5A217;
    dw $0924,$0319,$0254,$018F,$00CA,$581B,$1892,$0145                   ;A5A227;

Palette_Draygon_Sprite2:
; Sprite palette 2
    dw $3800,$6B5A,$5652,$28E7,$1863,$62B5,$4A10,$396B                   ;A5A237;
    dw $3129,$43FF,$0113,$000F,$175C,$0299,$01D6,$03E0                   ;A5A247;

Palette_Draygon_Sprite3:
; Sprite palette 3
    dw $3800,$4B9C,$3694,$0929,$0042,$42F7,$2A52,$19AD                   ;A5A257;
    dw $116B,$1420,$1420,$1420,$1420,$1420,$1420,$1420                   ;A5A267;

Palette_Draygon_BG12_5:
; BG1/2 palette 5
    dw $3800,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166                   ;A5A277;
    dw $0924,$0319,$0254,$018F,$00CA,$581B,$1892,$0145                   ;A5A287;

Palette_Draygon_WhiteFlash:
; Flash
    dw $3800,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF                   ;A5A297;
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF                   ;A5A2A7;


;;; $A2B7: Draygon extended spritemaps ;;;
ExtendedSpritemap_Draygon_0:
    dw $0001                                                             ;A5A2B7;
    dw $0000,$0000
    dw Spritemap_Draygon_0                                               ;A5A2BD;
    dw Hitbox_Draygon_1B                                                 ;A5A2BF;

ExtendedSpritemap_Draygon_1:
    dw $0001                                                             ;A5A2C1;
    dw $0000,$0000
    dw Spritemap_Draygon_0                                               ;A5A2C7;
    dw Hitbox_Draygon_1B                                                 ;A5A2C9;

ExtendedSpritemap_Draygon_2:
    dw $0001                                                             ;A5A2CB;
    dw $0000,$0000
    dw Spritemap_Draygon_0                                               ;A5A2D1;
    dw Hitbox_Draygon_1B                                                 ;A5A2D3;

ExtendedSpritemap_Draygon_3:
    dw $0001                                                             ;A5A2D5;
    dw $0000,$0000
    dw Spritemap_Draygon_0                                               ;A5A2DB;
    dw Hitbox_Draygon_1B                                                 ;A5A2DD;

ExtendedSpritemap_Draygon_4:
    dw $0001                                                             ;A5A2DF;
    dw $0000,$0001
    dw Spritemap_Draygon_B                                               ;A5A2E5;
    dw Hitbox_Draygon_1B                                                 ;A5A2E7;

ExtendedSpritemap_Draygon_5:
    dw $0001                                                             ;A5A2E9;
    dw $0000,$0001
    dw Spritemap_Draygon_C                                               ;A5A2EF;
    dw Hitbox_Draygon_1B                                                 ;A5A2F1;

ExtendedSpritemap_Draygon_6:
    dw $0001                                                             ;A5A2F3;
    dw $0000,$0001
    dw Spritemap_Draygon_D                                               ;A5A2F9;
    dw Hitbox_Draygon_1B                                                 ;A5A2FB;

ExtendedSpritemap_Draygon_7:
    dw $0001                                                             ;A5A2FD;
    dw $0000,$0001
    dw Spritemap_Draygon_E                                               ;A5A303;
    dw Hitbox_Draygon_1B                                                 ;A5A305;

ExtendedSpritemap_Draygon_8:
    dw $0001                                                             ;A5A307;
    dw $0000,$0001
    dw Spritemap_Draygon_F                                               ;A5A30D;
    dw Hitbox_Draygon_1B                                                 ;A5A30F;

ExtendedSpritemap_Draygon_9:
    dw $0001                                                             ;A5A311;
    dw $0000,$0001
    dw Spritemap_Draygon_10                                              ;A5A317;
    dw Hitbox_Draygon_1B                                                 ;A5A319;

ExtendedSpritemap_Draygon_A:
    dw $0001                                                             ;A5A31B;
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_B                                         ;A5A321;
    dw Hitbox_Draygon_1A                                                 ;A5A323;

ExtendedSpritemap_Draygon_B:
    dw $0001                                                             ;A5A325;
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_C                                         ;A5A32B;
    dw Hitbox_Draygon_1A                                                 ;A5A32D;

ExtendedSpritemap_Draygon_C:
    dw $0001                                                             ;A5A32F;
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_D                                         ;A5A335;
    dw Hitbox_Draygon_1A                                                 ;A5A337;

ExtendedSpritemap_Draygon_D:
    dw $0001                                                             ;A5A339;
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_E                                         ;A5A33F;
    dw Hitbox_Draygon_1A                                                 ;A5A341;

ExtendedSpritemap_Draygon_E:
    dw $0001                                                             ;A5A343;
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_7                                         ;A5A349;
    dw Hitbox_Draygon_1A                                                 ;A5A34B;

ExtendedSpritemap_Draygon_F:
    dw $0001                                                             ;A5A34D;
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_8                                         ;A5A353;
    dw Hitbox_Draygon_1A                                                 ;A5A355;

ExtendedSpritemap_Draygon_10:
    dw $0001                                                             ;A5A357;
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_9                                         ;A5A35D;
    dw Hitbox_Draygon_1A                                                 ;A5A35F;

ExtendedSpritemap_Draygon_11:
    dw $0001                                                             ;A5A361;
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_A                                         ;A5A367;
    dw Hitbox_Draygon_1A                                                 ;A5A369;

ExtendedSpritemap_Draygon_12:
    dw $0001                                                             ;A5A36B;
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_F                                         ;A5A371;
    dw Hitbox_Draygon_1B                                                 ;A5A373;

ExtendedSpritemap_Draygon_13:
    dw $0001                                                             ;A5A375;
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_10                                        ;A5A37B;
    dw Hitbox_Draygon_1B                                                 ;A5A37D;

ExtendedSpritemap_Draygon_14:
    dw $0001                                                             ;A5A37F;
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_11                                        ;A5A385;
    dw Hitbox_Draygon_1B                                                 ;A5A387;

ExtendedSpritemap_Draygon_15:
    dw $0001                                                             ;A5A389;
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_12                                        ;A5A38F;
    dw Hitbox_Draygon_1B                                                 ;A5A391;

ExtendedSpritemap_Draygon_16:
    dw $0001                                                             ;A5A393;
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_13                                        ;A5A399;
    dw Hitbox_Draygon_1B                                                 ;A5A39B;

ExtendedSpritemap_Draygon_17:
    dw $0001                                                             ;A5A39D;
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_14                                        ;A5A3A3;
    dw Hitbox_Draygon_1B                                                 ;A5A3A5;

ExtendedSpritemap_Draygon_18:
    dw $0001                                                             ;A5A3A7;
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_15                                        ;A5A3AD;
    dw Hitbox_Draygon_1B                                                 ;A5A3AF;

ExtendedSpritemap_Draygon_19:
    dw $0001                                                             ;A5A3B1;
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_16                                        ;A5A3B7;
    dw Hitbox_Draygon_1B                                                 ;A5A3B9;

ExtendedSpritemap_Draygon_1A:
    dw $0001                                                             ;A5A3BB;
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_17                                        ;A5A3C1;
    dw Hitbox_Draygon_1A                                                 ;A5A3C3;

ExtendedSpritemap_Draygon_1B:
    dw $0001                                                             ;A5A3C5;
    dw $0000,$0001
    dw Spritemap_Draygon_3                                               ;A5A3CB;
    dw Hitbox_Draygon_1B                                                 ;A5A3CD;

ExtendedSpritemap_Draygon_1C:
    dw $0001                                                             ;A5A3CF;
    dw $0000,$0001
    dw Spritemap_Draygon_4                                               ;A5A3D5;
    dw Hitbox_Draygon_1B                                                 ;A5A3D7;

ExtendedSpritemap_Draygon_1D:
    dw $0001                                                             ;A5A3D9;
    dw $0000,$0001
    dw Spritemap_Draygon_5                                               ;A5A3DF;
    dw Hitbox_Draygon_1B                                                 ;A5A3E1;

ExtendedSpritemap_Draygon_1E:
    dw $0001                                                             ;A5A3E3;
    dw $0000,$0001
    dw Spritemap_Draygon_6                                               ;A5A3E9;
    dw Hitbox_Draygon_1B                                                 ;A5A3EB;

ExtendedSpritemap_Draygon_1F:
    dw $0001                                                             ;A5A3ED;
    dw $0029,$0001
    dw Spritemap_Draygon_0                                               ;A5A3F3;
    dw Hitbox_Draygon_1B                                                 ;A5A3F5;

ExtendedSpritemap_Draygon_20:
    dw $0001                                                             ;A5A3F7;
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_5                                         ;A5A3FD;
    dw Hitbox_Draygon_12                                                 ;A5A3FF;

ExtendedSpritemap_Draygon_21:
    dw $0001                                                             ;A5A401;
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_6                                         ;A5A407;
    dw Hitbox_Draygon_12                                                 ;A5A409;

ExtendedSpritemap_Draygon_22:
    dw $0002                                                             ;A5A40B;
    dw $001B,$003F
    dw Spritemap_Draygon_1A                                              ;A5A411;
    dw Hitbox_Draygon_1B                                                 ;A5A413;
    dw $0037,$0021                                                       ;A5A415;
    dw Spritemap_Draygon_7                                               ;A5A419;
    dw Hitbox_Draygon_1B                                                 ;A5A41B;

ExtendedSpritemap_Draygon_23:
    dw $0002                                                             ;A5A41D;
    dw $0017,$003D
    dw Spritemap_Draygon_19                                              ;A5A423;
    dw Hitbox_Draygon_1B                                                 ;A5A425;
    dw $0037,$0021                                                       ;A5A427;
    dw Spritemap_Draygon_7                                               ;A5A42B;
    dw Hitbox_Draygon_1B                                                 ;A5A42D;

ExtendedSpritemap_Draygon_24:
    dw $0002                                                             ;A5A42F;
    dw $0013,$003A
    dw Spritemap_Draygon_18                                              ;A5A435;
    dw Hitbox_Draygon_1B                                                 ;A5A437;
    dw $0037,$0021                                                       ;A5A439;
    dw Spritemap_Draygon_8                                               ;A5A43D;
    dw Hitbox_Draygon_1B                                                 ;A5A43F;

ExtendedSpritemap_Draygon_25:
    dw $0002                                                             ;A5A441;
    dw $000E,$0035
    dw Spritemap_Draygon_17                                              ;A5A447;
    dw Hitbox_Draygon_1B                                                 ;A5A449;
    dw $0037,$0021                                                       ;A5A44B;
    dw Spritemap_Draygon_8                                               ;A5A44F;
    dw Hitbox_Draygon_1B                                                 ;A5A451;

ExtendedSpritemap_Draygon_26:
    dw $0002                                                             ;A5A453;
    dw $000C,$002E
    dw Spritemap_Draygon_16                                              ;A5A459;
    dw Hitbox_Draygon_1B                                                 ;A5A45B;
    dw $0037,$0021                                                       ;A5A45D;
    dw Spritemap_Draygon_9                                               ;A5A461;
    dw Hitbox_Draygon_1B                                                 ;A5A463;

ExtendedSpritemap_Draygon_27:
    dw $0002                                                             ;A5A465;
    dw $000E,$002D
    dw Spritemap_Draygon_15                                              ;A5A46B;
    dw Hitbox_Draygon_1B                                                 ;A5A46D;
    dw $0037,$0021                                                       ;A5A46F;
    dw Spritemap_Draygon_9                                               ;A5A473;
    dw Hitbox_Draygon_1B                                                 ;A5A475;

ExtendedSpritemap_Draygon_28:
    dw $0002                                                             ;A5A477;
    dw $0011,$0028
    dw Spritemap_Draygon_14                                              ;A5A47D;
    dw Hitbox_Draygon_1B                                                 ;A5A47F;
    dw $0037,$0021                                                       ;A5A481;
    dw Spritemap_Draygon_A                                               ;A5A485;
    dw Hitbox_Draygon_1B                                                 ;A5A487;

ExtendedSpritemap_Draygon_29:
    dw $0003                                                             ;A5A489;
    dw $000B,$003C
    dw Spritemap_Draygon_18                                              ;A5A48F;
    dw Hitbox_Draygon_1B                                                 ;A5A491;
    dw $0019,$0032                                                       ;A5A493;
    dw Spritemap_Draygon_24                                              ;A5A497;
    dw Hitbox_Draygon_1B                                                 ;A5A499;
    dw $0037,$0021                                                       ;A5A49B;
    dw Spritemap_Draygon_7                                               ;A5A49F;
    dw Hitbox_Draygon_1B                                                 ;A5A4A1;

ExtendedSpritemap_Draygon_2A:
    dw $0004                                                             ;A5A4A3;
    dw $0008,$0043
    dw Spritemap_Draygon_18                                              ;A5A4A9;
    dw Hitbox_Draygon_1B                                                 ;A5A4AB;
    dw $0014,$0036                                                       ;A5A4AD;
    dw Spritemap_Draygon_24                                              ;A5A4B1;
    dw Hitbox_Draygon_1B                                                 ;A5A4B3;
    dw $0018,$0031                                                       ;A5A4B5;
    dw Spritemap_Draygon_24                                              ;A5A4B9;
    dw Hitbox_Draygon_1B                                                 ;A5A4BB;
    dw $0037,$0021                                                       ;A5A4BD;
    dw Spritemap_Draygon_7                                               ;A5A4C1;
    dw Hitbox_Draygon_1B                                                 ;A5A4C3;

ExtendedSpritemap_Draygon_2B:
    dw $0005                                                             ;A5A4C5;
    dw $0009,$004D
    dw Spritemap_Draygon_19                                              ;A5A4CB;
    dw Hitbox_Draygon_1B                                                 ;A5A4CD;
    dw $000F,$003D                                                       ;A5A4CF;
    dw Spritemap_Draygon_24                                              ;A5A4D3;
    dw Hitbox_Draygon_1B                                                 ;A5A4D5;
    dw $0013,$0036                                                       ;A5A4D7;
    dw Spritemap_Draygon_24                                              ;A5A4DB;
    dw Hitbox_Draygon_1B                                                 ;A5A4DD;
    dw $0019,$0031                                                       ;A5A4DF;
    dw Spritemap_Draygon_23                                              ;A5A4E3;
    dw Hitbox_Draygon_1B                                                 ;A5A4E5;
    dw $0037,$0021                                                       ;A5A4E7;
    dw Spritemap_Draygon_8                                               ;A5A4EB;
    dw Hitbox_Draygon_1B                                                 ;A5A4ED;

ExtendedSpritemap_Draygon_2C:
    dw $0006                                                             ;A5A4EF;
    dw $FFF8,$004D
    dw Spritemap_Draygon_18                                              ;A5A4F5;
    dw Hitbox_Draygon_1B                                                 ;A5A4F7;
    dw $0007,$0042                                                       ;A5A4F9;
    dw Spritemap_Draygon_24                                              ;A5A4FD;
    dw Hitbox_Draygon_1B                                                 ;A5A4FF;
    dw $000C,$003C                                                       ;A5A501;
    dw Spritemap_Draygon_24                                              ;A5A505;
    dw Hitbox_Draygon_1B                                                 ;A5A507;
    dw $0013,$0037                                                       ;A5A509;
    dw Spritemap_Draygon_23                                              ;A5A50D;
    dw Hitbox_Draygon_1B                                                 ;A5A50F;
    dw $001A,$0032                                                       ;A5A511;
    dw Spritemap_Draygon_23                                              ;A5A515;
    dw Hitbox_Draygon_1B                                                 ;A5A517;
    dw $0037,$0021                                                       ;A5A519;
    dw Spritemap_Draygon_9                                               ;A5A51D;
    dw Hitbox_Draygon_1B                                                 ;A5A51F;

ExtendedSpritemap_Draygon_2D:
    dw $0007                                                             ;A5A521;
    dw $FFEC,$0037
    dw Spritemap_Draygon_15                                              ;A5A527;
    dw Hitbox_Draygon_1B                                                 ;A5A529;
    dw $FFFC,$003D                                                       ;A5A52B;
    dw Spritemap_Draygon_24                                              ;A5A52F;
    dw Hitbox_Draygon_1B                                                 ;A5A531;
    dw $0005,$003F                                                       ;A5A533;
    dw Spritemap_Draygon_24                                              ;A5A537;
    dw Hitbox_Draygon_1B                                                 ;A5A539;
    dw $000D,$003E                                                       ;A5A53B;
    dw Spritemap_Draygon_23                                              ;A5A53F;
    dw Hitbox_Draygon_1B                                                 ;A5A541;
    dw $0015,$003A                                                       ;A5A543;
    dw Spritemap_Draygon_23                                              ;A5A547;
    dw Hitbox_Draygon_1B                                                 ;A5A549;
    dw $001B,$0034                                                       ;A5A54B;
    dw Spritemap_Draygon_22                                              ;A5A54F;
    dw Hitbox_Draygon_1B                                                 ;A5A551;
    dw $0037,$0021                                                       ;A5A553;
    dw Spritemap_Draygon_A                                               ;A5A557;
    dw Hitbox_Draygon_1B                                                 ;A5A559;

ExtendedSpritemap_Draygon_2E:
    dw $0008                                                             ;A5A55B;
    dw $FFED,$002E
    dw Spritemap_Draygon_14                                              ;A5A561;
    dw Hitbox_Draygon_1B                                                 ;A5A563;
    dw $FFF9,$003A                                                       ;A5A565;
    dw Spritemap_Draygon_24                                              ;A5A569;
    dw Hitbox_Draygon_1B                                                 ;A5A56B;
    dw $0000,$0040                                                       ;A5A56D;
    dw Spritemap_Draygon_24                                              ;A5A571;
    dw Hitbox_Draygon_1B                                                 ;A5A573;
    dw $0008,$0041                                                       ;A5A575;
    dw Spritemap_Draygon_23                                              ;A5A579;
    dw Hitbox_Draygon_1B                                                 ;A5A57B;
    dw $0011,$0043                                                       ;A5A57D;
    dw Spritemap_Draygon_23                                              ;A5A581;
    dw Hitbox_Draygon_1B                                                 ;A5A583;
    dw $0019,$003F                                                       ;A5A585;
    dw Spritemap_Draygon_22                                              ;A5A589;
    dw Hitbox_Draygon_1B                                                 ;A5A58B;
    dw $001D,$0035                                                       ;A5A58D;
    dw Spritemap_Draygon_22                                              ;A5A591;
    dw Hitbox_Draygon_1B                                                 ;A5A593;
    dw $0037,$0021                                                       ;A5A595;
    dw Spritemap_Draygon_A                                               ;A5A599;
    dw Hitbox_Draygon_1B                                                 ;A5A59B;

ExtendedSpritemap_Draygon_2F:
    dw $0008                                                             ;A5A59D;
    dw $FFF7,$0025
    dw Spritemap_Draygon_12                                              ;A5A5A3;
    dw Hitbox_Draygon_1B                                                 ;A5A5A5;
    dw $FFF8,$0038                                                       ;A5A5A7;
    dw Spritemap_Draygon_24                                              ;A5A5AB;
    dw Hitbox_Draygon_1B                                                 ;A5A5AD;
    dw $FFFD,$0041                                                       ;A5A5AF;
    dw Spritemap_Draygon_24                                              ;A5A5B3;
    dw Hitbox_Draygon_1B                                                 ;A5A5B5;
    dw $0006,$0043                                                       ;A5A5B7;
    dw Spritemap_Draygon_23                                              ;A5A5BB;
    dw Hitbox_Draygon_1B                                                 ;A5A5BD;
    dw $0010,$0044                                                       ;A5A5BF;
    dw Spritemap_Draygon_23                                              ;A5A5C3;
    dw Hitbox_Draygon_1B                                                 ;A5A5C5;
    dw $0018,$0041                                                       ;A5A5C7;
    dw Spritemap_Draygon_22                                              ;A5A5CB;
    dw Hitbox_Draygon_1B                                                 ;A5A5CD;
    dw $001E,$0037                                                       ;A5A5CF;
    dw Spritemap_Draygon_22                                              ;A5A5D3;
    dw Hitbox_Draygon_1B                                                 ;A5A5D5;
    dw $0037,$0021                                                       ;A5A5D7;
    dw Spritemap_Draygon_A                                               ;A5A5DB;
    dw Hitbox_Draygon_1B                                                 ;A5A5DD;

ExtendedSpritemap_Draygon_30:
    dw $0001                                                             ;A5A5DF;
    dw $0000,$0000
    dw Spritemap_Draygon_28                                              ;A5A5E5;
    dw Hitbox_Draygon_1B                                                 ;A5A5E7;

ExtendedSpritemap_Draygon_31:
    dw $0001                                                             ;A5A5E9;
    dw $0000,$0000
    dw Spritemap_Draygon_28                                              ;A5A5EF;
    dw Hitbox_Draygon_1B                                                 ;A5A5F1;

ExtendedSpritemap_Draygon_32:
    dw $0001                                                             ;A5A5F3;
    dw $0000,$0000
    dw Spritemap_Draygon_28                                              ;A5A5F9;
    dw Hitbox_Draygon_1B                                                 ;A5A5FB;

ExtendedSpritemap_Draygon_33:
    dw $0001                                                             ;A5A5FD;
    dw $0000,$0000
    dw Spritemap_Draygon_28                                              ;A5A603;
    dw Hitbox_Draygon_1B                                                 ;A5A605;

ExtendedSpritemap_Draygon_34:
    dw $0001                                                             ;A5A607;
    dw $0000,$0001
    dw Spritemap_Draygon_41                                              ;A5A60D;
    dw Hitbox_Draygon_1B                                                 ;A5A60F;

ExtendedSpritemap_Draygon_35:
    dw $0001                                                             ;A5A611;
    dw $0000,$0001
    dw Spritemap_Draygon_42                                              ;A5A617;
    dw Hitbox_Draygon_1B                                                 ;A5A619;

ExtendedSpritemap_Draygon_36:
    dw $0001                                                             ;A5A61B;
    dw $0000,$0001
    dw Spritemap_Draygon_43                                              ;A5A621;
    dw Hitbox_Draygon_1B                                                 ;A5A623;

ExtendedSpritemap_Draygon_37:
    dw $0001                                                             ;A5A625;
    dw $0000,$0001
    dw Spritemap_Draygon_44                                              ;A5A62B;
    dw Hitbox_Draygon_1B                                                 ;A5A62D;

ExtendedSpritemap_Draygon_38:
    dw $0001                                                             ;A5A62F;
    dw $0000,$0001
    dw Spritemap_Draygon_45                                              ;A5A635;
    dw Hitbox_Draygon_1B                                                 ;A5A637;

ExtendedSpritemap_Draygon_39:
    dw $0001                                                             ;A5A639;
    dw $0000,$0001
    dw Spritemap_Draygon_46                                              ;A5A63F;
    dw Hitbox_Draygon_1B                                                 ;A5A641;

ExtendedSpritemap_Draygon_3A:
    dw $0001                                                             ;A5A643;
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_23                                        ;A5A649;
    dw Hitbox_Draygon_2D                                                 ;A5A64B;

ExtendedSpritemap_Draygon_3B:
    dw $0001                                                             ;A5A64D;
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_24                                        ;A5A653;
    dw Hitbox_Draygon_2D                                                 ;A5A655;

ExtendedSpritemap_Draygon_3C:
    dw $0001                                                             ;A5A657;
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_25                                        ;A5A65D;
    dw Hitbox_Draygon_2D                                                 ;A5A65F;

ExtendedSpritemap_Draygon_3D:
    dw $0001                                                             ;A5A661;
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_26                                        ;A5A667;
    dw Hitbox_Draygon_2D                                                 ;A5A669;

ExtendedSpritemap_Draygon_3E:
    dw $0001                                                             ;A5A66B;
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_1F                                        ;A5A671;
    dw Hitbox_Draygon_2D                                                 ;A5A673;

ExtendedSpritemap_Draygon_3F:
    dw $0001                                                             ;A5A675;
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_20                                        ;A5A67B;
    dw Hitbox_Draygon_2D                                                 ;A5A67D;

ExtendedSpritemap_Draygon_40:
    dw $0001                                                             ;A5A67F;
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_21                                        ;A5A685;
    dw Hitbox_Draygon_2D                                                 ;A5A687;

ExtendedSpritemap_Draygon_41:
    dw $0001                                                             ;A5A689;
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_22                                        ;A5A68F;
    dw Hitbox_Draygon_2D                                                 ;A5A691;

ExtendedSpritemap_Draygon_42:
    dw $0001                                                             ;A5A693;
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_27                                        ;A5A699;
    dw Hitbox_Draygon_1B                                                 ;A5A69B;

ExtendedSpritemap_Draygon_43:
    dw $0001                                                             ;A5A69D;
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_28                                        ;A5A6A3;
    dw Hitbox_Draygon_1B                                                 ;A5A6A5;

ExtendedSpritemap_Draygon_44:
    dw $0001                                                             ;A5A6A7;
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_29                                        ;A5A6AD;
    dw Hitbox_Draygon_1B                                                 ;A5A6AF;

ExtendedSpritemap_Draygon_45:
    dw $0001                                                             ;A5A6B1;
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_2A                                        ;A5A6B7;
    dw Hitbox_Draygon_1B                                                 ;A5A6B9;

ExtendedSpritemap_Draygon_46:
    dw $0001                                                             ;A5A6BB;
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_2B                                        ;A5A6C1;
    dw Hitbox_Draygon_1B                                                 ;A5A6C3;

ExtendedSpritemap_Draygon_47:
    dw $0001                                                             ;A5A6C5;
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_2C                                        ;A5A6CB;
    dw Hitbox_Draygon_1B                                                 ;A5A6CD;

ExtendedSpritemap_Draygon_48:
    dw $0001                                                             ;A5A6CF;
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_2D                                        ;A5A6D5;
    dw Hitbox_Draygon_1B                                                 ;A5A6D7;

ExtendedSpritemap_Draygon_49:
    dw $0001                                                             ;A5A6D9;
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_2E                                        ;A5A6DF;
    dw Hitbox_Draygon_1B                                                 ;A5A6E1;

ExtendedSpritemap_Draygon_4A:
    dw $0001                                                             ;A5A6E3;
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_2F                                        ;A5A6E9;
    dw Hitbox_Draygon_2D                                                 ;A5A6EB;

ExtendedSpritemap_Draygon_4B:
    dw $0001                                                             ;A5A6ED;
    dw $0000,$0001
    dw Spritemap_Draygon_2B                                              ;A5A6F3;
    dw Hitbox_Draygon_1B                                                 ;A5A6F5;

ExtendedSpritemap_Draygon_4C:
    dw $0001                                                             ;A5A6F7;
    dw $0000,$0001
    dw Spritemap_Draygon_2C                                              ;A5A6FD;
    dw Hitbox_Draygon_1B                                                 ;A5A6FF;

ExtendedSpritemap_Draygon_4D:
    dw $0001                                                             ;A5A701;
    dw $0000,$0001
    dw Spritemap_Draygon_2D                                              ;A5A707;
    dw Hitbox_Draygon_1B                                                 ;A5A709;

ExtendedSpritemap_Draygon_4E:
    dw $0001                                                             ;A5A70B;
    dw $0000,$0001
    dw Spritemap_Draygon_2E                                              ;A5A711;
    dw Hitbox_Draygon_1B                                                 ;A5A713;

ExtendedSpritemap_Draygon_4F:
    dw $0001                                                             ;A5A715;
    dw $0000,$0000
    dw Spritemap_Draygon_28                                              ;A5A71B;
    dw Hitbox_Draygon_1B                                                 ;A5A71D;

ExtendedSpritemap_Draygon_50:
    dw $0001                                                             ;A5A71F;
    dw $0000,$0000
    dw Spritemap_Draygon_28                                              ;A5A725;
    dw Hitbox_Draygon_1B                                                 ;A5A727;

ExtendedSpritemap_Draygon_51:
    dw $0001                                                             ;A5A729;
    dw $0000,$0000
    dw Spritemap_Draygon_28                                              ;A5A72F;
    dw Hitbox_Draygon_1B                                                 ;A5A731;

ExtendedSpritemap_Draygon_52:
    dw $0001                                                             ;A5A733;
    dw $0000,$0000
    dw Spritemap_Draygon_28                                              ;A5A739;
    dw Hitbox_Draygon_1B                                                 ;A5A73B;

ExtendedSpritemap_Draygon_53:
    dw $0001                                                             ;A5A73D;
    dw $0000,$0000
    dw Spritemap_Draygon_28                                              ;A5A743;
    dw Hitbox_Draygon_1B                                                 ;A5A745;

ExtendedSpritemap_Draygon_54:
    dw $0001                                                             ;A5A747;
    dw $0000,$0000
    dw Spritemap_Draygon_28                                              ;A5A74D;
    dw Hitbox_Draygon_1B                                                 ;A5A74F;

ExtendedSpritemap_Draygon_55:
    dw $0001                                                             ;A5A751;
    dw $0000,$0000
    dw Spritemap_Draygon_28                                              ;A5A757;
    dw Hitbox_Draygon_1B                                                 ;A5A759;

ExtendedSpritemap_Draygon_56:
    dw $0001                                                             ;A5A75B;
    dw $0000,$0000
    dw Spritemap_Draygon_28                                              ;A5A761;
    dw Hitbox_Draygon_1B                                                 ;A5A763;

ExtendedSpritemap_Draygon_57:
    dw $0001                                                             ;A5A765;
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_1D                                        ;A5A76B;
    dw Hitbox_Draygon_29                                                 ;A5A76D;

ExtendedSpritemap_Draygon_58:
    dw $0001                                                             ;A5A76F;
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_1E                                        ;A5A775;
    dw Hitbox_Draygon_29                                                 ;A5A777;

ExtendedSpritemap_Draygon_59:
    dw $0002                                                             ;A5A779;
    dw $FFE5,$003F
    dw Spritemap_Draygon_50                                              ;A5A77F;
    dw Hitbox_Draygon_1B                                                 ;A5A781;
    dw $FFCE,$0021                                                       ;A5A783;
    dw Spritemap_Draygon_34                                              ;A5A787;
    dw Hitbox_Draygon_1B                                                 ;A5A789;

ExtendedSpritemap_Draygon_5A:
    dw $0002                                                             ;A5A78B;
    dw $FFE9,$003D
    dw Spritemap_Draygon_4F                                              ;A5A791;
    dw Hitbox_Draygon_1B                                                 ;A5A793;
    dw $FFCE,$0021                                                       ;A5A795;
    dw Spritemap_Draygon_34                                              ;A5A799;
    dw Hitbox_Draygon_1B                                                 ;A5A79B;

ExtendedSpritemap_Draygon_5B:
    dw $0002                                                             ;A5A79D;
    dw $FFED,$003A
    dw Spritemap_Draygon_4E                                              ;A5A7A3;
    dw Hitbox_Draygon_1B                                                 ;A5A7A5;
    dw $FFCE,$0021                                                       ;A5A7A7;
    dw Spritemap_Draygon_35                                              ;A5A7AB;
    dw Hitbox_Draygon_1B                                                 ;A5A7AD;

ExtendedSpritemap_Draygon_5C:
    dw $0002                                                             ;A5A7AF;
    dw $FFF2,$0035
    dw Spritemap_Draygon_4D                                              ;A5A7B5;
    dw Hitbox_Draygon_1B                                                 ;A5A7B7;
    dw $FFCE,$0021                                                       ;A5A7B9;
    dw Spritemap_Draygon_35                                              ;A5A7BD;
    dw Hitbox_Draygon_1B                                                 ;A5A7BF;

ExtendedSpritemap_Draygon_5D:
    dw $0002                                                             ;A5A7C1;
    dw $FFF4,$002E
    dw Spritemap_Draygon_4C                                              ;A5A7C7;
    dw Hitbox_Draygon_1B                                                 ;A5A7C9;
    dw $FFCE,$0021                                                       ;A5A7CB;
    dw Spritemap_Draygon_3F                                              ;A5A7CF;
    dw Hitbox_Draygon_1B                                                 ;A5A7D1;

ExtendedSpritemap_Draygon_5E:
    dw $0002                                                             ;A5A7D3;
    dw $FFF2,$002D
    dw Spritemap_Draygon_4B                                              ;A5A7D9;
    dw Hitbox_Draygon_1B                                                 ;A5A7DB;
    dw $FFCE,$0021                                                       ;A5A7DD;
    dw Spritemap_Draygon_3F                                              ;A5A7E1;
    dw Hitbox_Draygon_1B                                                 ;A5A7E3;

ExtendedSpritemap_Draygon_5F:
    dw $0002                                                             ;A5A7E5;
    dw $FFEF,$0028
    dw Spritemap_Draygon_4A                                              ;A5A7EB;
    dw Hitbox_Draygon_1B                                                 ;A5A7ED;
    dw $FFCE,$0021                                                       ;A5A7EF;
    dw Spritemap_Draygon_40                                              ;A5A7F3;
    dw Hitbox_Draygon_1B                                                 ;A5A7F5;

ExtendedSpritemap_Draygon_60:
    dw $0003                                                             ;A5A7F7;
    dw $FFF5,$003C
    dw Spritemap_Draygon_4E                                              ;A5A7FD;
    dw Hitbox_Draygon_2E                                                 ;A5A7FF;
    dw $FFE7,$0032                                                       ;A5A801;
    dw Spritemap_Draygon_5A                                              ;A5A805;
    dw Hitbox_Draygon_1B                                                 ;A5A807;
    dw $FFCE,$0021                                                       ;A5A809;
    dw Spritemap_Draygon_34                                              ;A5A80D;
    dw Hitbox_Draygon_1B                                                 ;A5A80F;

ExtendedSpritemap_Draygon_61:
    dw $0004                                                             ;A5A811;
    dw $FFF8,$0043
    dw Spritemap_Draygon_4E                                              ;A5A817;
    dw Hitbox_Draygon_2E                                                 ;A5A819;
    dw $FFEC,$0036                                                       ;A5A81B;
    dw Spritemap_Draygon_5A                                              ;A5A81F;
    dw Hitbox_Draygon_1B                                                 ;A5A821;
    dw $FFE8,$0031                                                       ;A5A823;
    dw Spritemap_Draygon_5A                                              ;A5A827;
    dw Hitbox_Draygon_1B                                                 ;A5A829;
    dw $FFCE,$0021                                                       ;A5A82B;
    dw Spritemap_Draygon_34                                              ;A5A82F;
    dw Hitbox_Draygon_1B                                                 ;A5A831;

ExtendedSpritemap_Draygon_62:
    dw $0005                                                             ;A5A833;
    dw $FFF7,$004D
    dw Spritemap_Draygon_4F                                              ;A5A839;
    dw Hitbox_Draygon_2E                                                 ;A5A83B;
    dw $FFF1,$003D                                                       ;A5A83D;
    dw Spritemap_Draygon_5A                                              ;A5A841;
    dw Hitbox_Draygon_1B                                                 ;A5A843;
    dw $FFED,$0036                                                       ;A5A845;
    dw Spritemap_Draygon_5A                                              ;A5A849;
    dw Hitbox_Draygon_1B                                                 ;A5A84B;
    dw $FFE7,$0031                                                       ;A5A84D;
    dw Spritemap_Draygon_59                                              ;A5A851;
    dw Hitbox_Draygon_1B                                                 ;A5A853;
    dw $FFCE,$0021                                                       ;A5A855;
    dw Spritemap_Draygon_35                                              ;A5A859;
    dw Hitbox_Draygon_1B                                                 ;A5A85B;

ExtendedSpritemap_Draygon_63:
    dw $0006                                                             ;A5A85D;
    dw $0008,$004D
    dw Spritemap_Draygon_4E                                              ;A5A863;
    dw Hitbox_Draygon_2E                                                 ;A5A865;
    dw $FFF9,$0042                                                       ;A5A867;
    dw Spritemap_Draygon_5A                                              ;A5A86B;
    dw Hitbox_Draygon_1B                                                 ;A5A86D;
    dw $FFF4,$003C                                                       ;A5A86F;
    dw Spritemap_Draygon_5A                                              ;A5A873;
    dw Hitbox_Draygon_1B                                                 ;A5A875;
    dw $FFED,$0037                                                       ;A5A877;
    dw Spritemap_Draygon_59                                              ;A5A87B;
    dw Hitbox_Draygon_1B                                                 ;A5A87D;
    dw $FFE6,$0032                                                       ;A5A87F;
    dw Spritemap_Draygon_59                                              ;A5A883;
    dw Hitbox_Draygon_1B                                                 ;A5A885;
    dw $FFCE,$0021                                                       ;A5A887;
    dw Spritemap_Draygon_35                                              ;A5A88B;
    dw Hitbox_Draygon_1B                                                 ;A5A88D;

ExtendedSpritemap_Draygon_64:
    dw $0007                                                             ;A5A88F;
    dw $0014,$0037
    dw Spritemap_Draygon_4B                                              ;A5A895;
    dw Hitbox_Draygon_2E                                                 ;A5A897;
    dw $0004,$003D                                                       ;A5A899;
    dw Spritemap_Draygon_5A                                              ;A5A89D;
    dw Hitbox_Draygon_1B                                                 ;A5A89F;
    dw $FFFB,$003F                                                       ;A5A8A1;
    dw Spritemap_Draygon_5A                                              ;A5A8A5;
    dw Hitbox_Draygon_1B                                                 ;A5A8A7;
    dw $FFF3,$003E                                                       ;A5A8A9;
    dw Spritemap_Draygon_59                                              ;A5A8AD;
    dw Hitbox_Draygon_1B                                                 ;A5A8AF;
    dw $FFEB,$003A                                                       ;A5A8B1;
    dw Spritemap_Draygon_59                                              ;A5A8B5;
    dw Hitbox_Draygon_1B                                                 ;A5A8B7;
    dw $FFE5,$0034                                                       ;A5A8B9;
    dw Spritemap_Draygon_58                                              ;A5A8BD;
    dw Hitbox_Draygon_1B                                                 ;A5A8BF;
    dw $FFCE,$0021                                                       ;A5A8C1;
    dw Spritemap_Draygon_3F                                              ;A5A8C5;
    dw Hitbox_Draygon_1B                                                 ;A5A8C7;

ExtendedSpritemap_Draygon_65:
    dw $0008                                                             ;A5A8C9;
    dw $0013,$002E
    dw Spritemap_Draygon_4A                                              ;A5A8CF;
    dw Hitbox_Draygon_2E                                                 ;A5A8D1;
    dw $0007,$003A                                                       ;A5A8D3;
    dw Spritemap_Draygon_5A                                              ;A5A8D7;
    dw Hitbox_Draygon_1B                                                 ;A5A8D9;
    dw $0000,$0040                                                       ;A5A8DB;
    dw Spritemap_Draygon_5A                                              ;A5A8DF;
    dw Hitbox_Draygon_1B                                                 ;A5A8E1;
    dw $FFF8,$0041                                                       ;A5A8E3;
    dw Spritemap_Draygon_59                                              ;A5A8E7;
    dw Hitbox_Draygon_1B                                                 ;A5A8E9;
    dw $FFEF,$0043                                                       ;A5A8EB;
    dw Spritemap_Draygon_59                                              ;A5A8EF;
    dw Hitbox_Draygon_1B                                                 ;A5A8F1;
    dw $FFE7,$003F                                                       ;A5A8F3;
    dw Spritemap_Draygon_58                                              ;A5A8F7;
    dw Hitbox_Draygon_1B                                                 ;A5A8F9;
    dw $FFE3,$0035                                                       ;A5A8FB;
    dw Spritemap_Draygon_58                                              ;A5A8FF;
    dw Hitbox_Draygon_1B                                                 ;A5A901;
    dw $FFCE,$0021                                                       ;A5A903;
    dw Spritemap_Draygon_3F                                              ;A5A907;
    dw Hitbox_Draygon_1B                                                 ;A5A909;

ExtendedSpritemap_Draygon_66:
    dw $0008                                                             ;A5A90B;
    dw $0009,$0025
    dw Spritemap_Draygon_48                                              ;A5A911;
    dw Hitbox_Draygon_2E                                                 ;A5A913;
    dw $0008,$0038                                                       ;A5A915;
    dw Spritemap_Draygon_5A                                              ;A5A919;
    dw Hitbox_Draygon_1B                                                 ;A5A91B;
    dw $0003,$0041                                                       ;A5A91D;
    dw Spritemap_Draygon_5A                                              ;A5A921;
    dw Hitbox_Draygon_1B                                                 ;A5A923;
    dw $FFFA,$0043                                                       ;A5A925;
    dw Spritemap_Draygon_59                                              ;A5A929;
    dw Hitbox_Draygon_1B                                                 ;A5A92B;
    dw $FFF0,$0044                                                       ;A5A92D;
    dw Spritemap_Draygon_59                                              ;A5A931;
    dw Hitbox_Draygon_1B                                                 ;A5A933;
    dw $FFE8,$0041                                                       ;A5A935;
    dw Spritemap_Draygon_58                                              ;A5A939;
    dw Hitbox_Draygon_1B                                                 ;A5A93B;
    dw $FFE2,$0037                                                       ;A5A93D;
    dw Spritemap_Draygon_58                                              ;A5A941;
    dw Hitbox_Draygon_1B                                                 ;A5A943;
    dw $FFCE,$0021                                                       ;A5A945;
    dw Spritemap_Draygon_40                                              ;A5A949;
    dw Hitbox_Draygon_1B                                                 ;A5A94B;


;;; $A94D: Draygon hitboxes ;;;
Hitbox_Draygon_0:
    dw $0001                                                             ;A5A94D;
    dw $0000,$0000,$0017,$001F
    dw EnemyTouch_Draygon                                                ;A5A957;
    dw Common_NormalEnemyShotAI                                          ;A5A959;

Hitbox_Draygon_1:
    dw $0001                                                             ;A5A95B;
    dw $0000,$0000,$0015,$001F
    dw EnemyTouch_Draygon                                                ;A5A965;
    dw Common_NormalEnemyShotAI                                          ;A5A967;

Hitbox_Draygon_2:
    dw $0001                                                             ;A5A969;
    dw $0000,$0000,$000C,$0021
    dw EnemyTouch_Draygon                                                ;A5A973;
    dw Common_NormalEnemyShotAI                                          ;A5A975;

Hitbox_Draygon_3:
    dw $0001                                                             ;A5A977;
    dw $FFF9,$FFF8,$0006,$0006
    dw EnemyTouch_Draygon                                                ;A5A981;
    dw Common_NormalEnemyShotAI                                          ;A5A983;

Hitbox_Draygon_4:
    dw $0001                                                             ;A5A985;
    dw $FFF7,$FFF6,$0009,$0008
    dw EnemyTouch_Draygon                                                ;A5A98F;
    dw Common_NormalEnemyShotAI                                          ;A5A991;

Hitbox_Draygon_5:
    dw $0001                                                             ;A5A993;
    dw $FFF9,$FFF8,$0007,$0007
    dw EnemyTouch_Draygon                                                ;A5A99D;
    dw Common_NormalEnemyShotAI                                          ;A5A99F;

Hitbox_Draygon_6:
    dw $0001                                                             ;A5A9A1;
    dw $FFF8,$FFF8,$0006,$0006
    dw EnemyTouch_Draygon                                                ;A5A9AB;
    dw Common_NormalEnemyShotAI                                          ;A5A9AD;

Hitbox_Draygon_7:
    dw $0001                                                             ;A5A9AF;
    dw $FFF7,$FFF7,$0004,$0007
    dw RTL_A5804C                                                        ;A5A9B9;
    dw RTL_A5804C                                                        ;A5A9BB;

Hitbox_Draygon_8:
    dw $0000                                                             ;A5A9BD;

Hitbox_Draygon_9:
    dw $0000                                                             ;A5A9BF;

Hitbox_Draygon_A:
    dw $0001                                                             ;A5A9C1;
    dw $FFFB,$FFFB,$0004,$0004
    dw EnemyTouch_Draygon                                                ;A5A9CB;
    dw Common_NormalEnemyShotAI                                          ;A5A9CD;

Hitbox_Draygon_B:
    dw $0001                                                             ;A5A9CF;
    dw $FFFB,$FFFB,$0003,$0005
    dw EnemyTouch_Draygon                                                ;A5A9D9;
    dw Common_NormalEnemyShotAI                                          ;A5A9DB;

Hitbox_Draygon_C:
    dw $0001                                                             ;A5A9DD;
    dw $FFFB,$FFFB,$0004,$0004
    dw EnemyTouch_Draygon                                                ;A5A9E7;
    dw Common_NormalEnemyShotAI                                          ;A5A9E9;

Hitbox_Draygon_D:
    dw $0001                                                             ;A5A9EB;
    dw $FFF9,$FFF9,$0007,$0006
    dw EnemyTouch_Draygon                                                ;A5A9F5;
    dw Common_NormalEnemyShotAI                                          ;A5A9F7;

Hitbox_Draygon_E:
    dw $0001                                                             ;A5A9F9;
    dw $FFFB,$FFFB,$0004,$0004
    dw EnemyTouch_Draygon                                                ;A5AA03;
    dw Common_NormalEnemyShotAI                                          ;A5AA05;

Hitbox_Draygon_F:
    dw $0001                                                             ;A5AA07;
    dw $FFFB,$FFFC,$0004,$0004
    dw EnemyTouch_Draygon                                                ;A5AA11;
    dw Common_NormalEnemyShotAI                                          ;A5AA13;

Hitbox_Draygon_10:
    dw $0001                                                             ;A5AA15;
    dw $FFFB,$FFFB,$0004,$0004
    dw EnemyTouch_Draygon                                                ;A5AA1F;
    dw Common_NormalEnemyShotAI                                          ;A5AA21;

Hitbox_Draygon_11:
    dw $0000                                                             ;A5AA23;

Hitbox_Draygon_12:
    dw $0001                                                             ;A5AA25;
    dw $FFE2,$FFE6,$FFF2,$FFF5
    dw EnemyTouch_Draygon                                                ;A5AA2F;
    dw Common_NormalEnemyShotAI                                          ;A5AA31;

Hitbox_Draygon_13:
    dw $0001                                                             ;A5AA33;
    dw $FFE1,$FFE6,$FFF2,$FFF6
    dw EnemyTouch_Draygon                                                ;A5AA3D;
    dw Common_NormalEnemyShotAI                                          ;A5AA3F;

Hitbox_Draygon_14:
    dw $0001                                                             ;A5AA41;
    dw $FFE1,$FFE6,$FFF2,$FFF6
    dw EnemyTouch_Draygon                                                ;A5AA4B;
    dw Common_NormalEnemyShotAI                                          ;A5AA4D;

Hitbox_Draygon_15:
    dw $0001                                                             ;A5AA4F;
    dw $FFE1,$FFE6,$FFF2,$FFF7
    dw EnemyTouch_Draygon                                                ;A5AA59;
    dw Common_NormalEnemyShotAI                                          ;A5AA5B;

Hitbox_Draygon_16:
    dw $0001                                                             ;A5AA5D;
    dw $FFF3,$0000,$000A,$0017
    dw EnemyTouch_Draygon                                                ;A5AA67;
    dw Common_NormalEnemyShotAI                                          ;A5AA69;

Hitbox_Draygon_17:
    dw $0001                                                             ;A5AA6B;
    dw $FFF3,$0000,$000A,$0017
    dw EnemyTouch_Draygon                                                ;A5AA75;
    dw Common_NormalEnemyShotAI                                          ;A5AA77;

Hitbox_Draygon_18:
    dw $0001                                                             ;A5AA79;
    dw $FFF3,$0000,$000A,$0017
    dw EnemyTouch_Draygon                                                ;A5AA83;
    dw Common_NormalEnemyShotAI                                          ;A5AA85;

Hitbox_Draygon_19:
    dw $0001                                                             ;A5AA87;
    dw $FFF3,$0000,$000A,$0017
    dw EnemyTouch_Draygon                                                ;A5AA91;
    dw Common_NormalEnemyShotAI                                          ;A5AA93;

Hitbox_Draygon_1A:
    dw $0004                                                             ;A5AA95;
    dw $FFEF,$FFF0,$0012,$001E
    dw RTL_A5804C                                                        ;A5AA9F;
    dw EnemyShot_Draygon                                                 ;A5AAA1;
    dw $FFC5,$FFBE,$0003,$FFE2                                           ;A5AAA3;
    dw EnemyTouch_Draygon                                                ;A5AAAB;
    dw Common_CreateADudShot                                             ;A5AAAD;
    dw $0010,$0001,$003C,$0035                                           ;A5AAAF;
    dw EnemyTouch_Draygon                                                ;A5AAB7;
    dw Common_CreateADudShot                                             ;A5AAB9;
    dw $FFE4,$FFDB,$003D,$FFF6                                           ;A5AABB;
    dw EnemyTouch_Draygon                                                ;A5AAC3;
    dw Common_CreateADudShot                                             ;A5AAC5;

Hitbox_Draygon_1B:
    dw $0000                                                             ;A5AAC7;

Hitbox_Draygon_1C:
    dw $0001                                                             ;A5AAC9;
    dw $FFF9,$FFF8,$0006,$0006
    dw EnemyTouch_Draygon                                                ;A5AAD3;
    dw Common_NormalEnemyShotAI                                          ;A5AAD5;

Hitbox_Draygon_1D:
    dw $0001                                                             ;A5AAD7;
    dw $FFF7,$FFF6,$0009,$0008
    dw EnemyTouch_Draygon                                                ;A5AAE1;
    dw Common_NormalEnemyShotAI                                          ;A5AAE3;

Hitbox_Draygon_1E:
    dw $0001                                                             ;A5AAE5;
    dw $FFF9,$FFF8,$0007,$0007
    dw EnemyTouch_Draygon                                                ;A5AAEF;
    dw Common_NormalEnemyShotAI                                          ;A5AAF1;

Hitbox_Draygon_1F:
    dw $0001                                                             ;A5AAF3;
    dw $FFF8,$FFF8,$0006,$0006
    dw EnemyTouch_Draygon                                                ;A5AAFD;
    dw Common_NormalEnemyShotAI                                          ;A5AAFF;

Hitbox_Draygon_20:
    dw $0001                                                             ;A5AB01;
    dw $FFFB,$FFF7,$0007,$0007
    dw RTL_A5804C                                                        ;A5AB0B;
    dw RTL_A5804C                                                        ;A5AB0D;

Hitbox_Draygon_21:
    dw $0001                                                             ;A5AB0F;
    dw $FFFB,$FFFB,$0004,$0004
    dw EnemyTouch_Draygon                                                ;A5AB19;
    dw Common_NormalEnemyShotAI                                          ;A5AB1B;

Hitbox_Draygon_22:
    dw $0001                                                             ;A5AB1D;
    dw $FFFB,$FFFB,$0003,$0005
    dw EnemyTouch_Draygon                                                ;A5AB27;
    dw Common_NormalEnemyShotAI                                          ;A5AB29;

Hitbox_Draygon_23:
    dw $0001                                                             ;A5AB2B;
    dw $FFFB,$FFFB,$0004,$0004
    dw EnemyTouch_Draygon                                                ;A5AB35;
    dw Common_NormalEnemyShotAI                                          ;A5AB37;

Hitbox_Draygon_24:
    dw $0001                                                             ;A5AB39;
    dw $FFF9,$FFF9,$0007,$0006
    dw EnemyTouch_Draygon                                                ;A5AB43;
    dw Common_NormalEnemyShotAI                                          ;A5AB45;

Hitbox_Draygon_25:
    dw $0001                                                             ;A5AB47;
    dw $FFFB,$FFFB,$0004,$0004
    dw EnemyTouch_Draygon                                                ;A5AB51;
    dw Common_NormalEnemyShotAI                                          ;A5AB53;

Hitbox_Draygon_26:
    dw $0001                                                             ;A5AB55;
    dw $FFFB,$FFFC,$0004,$0004
    dw EnemyTouch_Draygon                                                ;A5AB5F;
    dw Common_NormalEnemyShotAI                                          ;A5AB61;

Hitbox_Draygon_27:
    dw $0001                                                             ;A5AB63;
    dw $FFFB,$FFFB,$0004,$0004
    dw EnemyTouch_Draygon                                                ;A5AB6D;
    dw Common_NormalEnemyShotAI                                          ;A5AB6F;

Hitbox_Draygon_28:
    dw $0000                                                             ;A5AB71;

Hitbox_Draygon_29:
    dw $0001                                                             ;A5AB73;
    dw $FFFA,$0000,$0010,$0017
    dw EnemyTouch_Draygon                                                ;A5AB7D;
    dw Common_NormalEnemyShotAI                                          ;A5AB7F;

Hitbox_Draygon_2A:
    dw $0001                                                             ;A5AB81;
    dw $FFFA,$0000,$0010,$0017
    dw EnemyTouch_Draygon                                                ;A5AB8B;
    dw Common_NormalEnemyShotAI                                          ;A5AB8D;

Hitbox_Draygon_2B:
    dw $0001                                                             ;A5AB8F;
    dw $FFFA,$0000,$0010,$0017
    dw EnemyTouch_Draygon                                                ;A5AB99;
    dw Common_NormalEnemyShotAI                                          ;A5AB9B;

Hitbox_Draygon_2C:
    dw $0001                                                             ;A5AB9D;
    dw $FFFA,$0000,$0010,$0017
    dw EnemyTouch_Draygon                                                ;A5ABA7;
    dw Common_NormalEnemyShotAI                                          ;A5ABA9;

Hitbox_Draygon_2D:
    dw $0004                                                             ;A5ABAB;
    dw $FFEE,$FFF9,$0012,$001E
    dw RTL_A5804C                                                        ;A5ABB5;
    dw EnemyShot_Draygon                                                 ;A5ABB7;
    dw $FFF6,$FFC1,$003E,$FFE6                                           ;A5ABB9;
    dw EnemyTouch_Draygon                                                ;A5ABC1;
    dw Common_CreateADudShot                                             ;A5ABC3;
    dw $FFC9,$0000,$FFEB,$0039                                           ;A5ABC5;
    dw EnemyTouch_Draygon                                                ;A5ABCD;
    dw Common_CreateADudShot                                             ;A5ABCF;
    dw $FFC2,$FFDF,$000F,$FFFB                                           ;A5ABD1;
    dw EnemyTouch_Draygon                                                ;A5ABD9;
    dw Common_CreateADudShot                                             ;A5ABDB;

Hitbox_Draygon_2E:
    dw $0000                                                             ;A5ABDD;


;;; $ABDF: Draygon spritemaps / extended tilemaps ;;;
Spritemap_Draygon_0:
    dw $0004                                                             ;A5ABDF;
    %spritemapEntry(1, $08, $10, 0, 0, 0, 3, $121)
    %spritemapEntry(1, $08, $00, 0, 0, 0, 3, $101)
    %spritemapEntry(1, $00, $10, 0, 0, 0, 3, $120)
    %spritemapEntry(1, $00, $00, 0, 0, 0, 3, $100)

Spritemap_Draygon_1:
    dw $0004                                                             ;A5ABF5;
    %spritemapEntry(0, $00, $10, 0, 0, 2, 3, $123)
    %spritemapEntry(1, $00, $00, 0, 0, 2, 3, $103)
    %spritemapEntry(1, $08, $10, 0, 0, 2, 3, $124)
    %spritemapEntry(1, $08, $00, 0, 0, 2, 3, $104)

Spritemap_Draygon_2:
    dw $0002                                                             ;A5AC0B;
    %spritemapEntry(1, $00, $10, 0, 0, 2, 3, $126)
    %spritemapEntry(1, $00, $00, 0, 0, 2, 3, $106)

Spritemap_Draygon_3:
    dw $0018                                                             ;A5AC17;
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
    dw $0014                                                             ;A5AC91;
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
    dw $0010                                                             ;A5ACF7;
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
    dw $0010                                                             ;A5AD49;
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
    dw $000A                                                             ;A5AD9B;
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
    dw $000A                                                             ;A5ADCF;
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
    dw $000A                                                             ;A5AE03;
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
    dw $000A                                                             ;A5AE37;
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
    dw $0013                                                             ;A5AE6B;
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
    dw $0011                                                             ;A5AECC;
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
    dw $0011                                                             ;A5AF23;
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
    dw $0013                                                             ;A5AF7A;
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
    dw $0014                                                             ;A5AFDB;
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
    dw $0014                                                             ;A5B041;
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
    dw $0013                                                             ;A5B0A7;
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


ExtendedTilemap_Draygon_0:                                               ;A5B108;
    dw $FFFE
    dw $2316,$0002, $159F,$15A0
    dw $2356,$0002, $15AC,$15AD
    dw $2394,$0003, $15B9,$15BA,$15BB
    dw $23D4,$0003, $15C8,$15C9,$15CA
    dw $2414,$0003, $15D7,$15D8,$15D9
    dw $2454,$0003, $15DF,$15E0,$1547
    dw $2496,$0002, $1547,$1547
    dw $FFFF

ExtendedTilemap_Draygon_1:                                               ;A5B14C;
    dw $FFFE
    dw $2316,$0002, $1559,$155A
    dw $2356,$0002, $1569,$156A
    dw $2394,$0003, $1576,$1577,$1578
    dw $23D2,$0004, $1585,$1586,$1587,$1588
    dw $2412,$0004, $1592,$1593,$1594,$1595
    dw $2452,$0004, $15A1,$15A2,$15A3,$0147
    dw $2496,$0002, $0147,$0147
    dw $FFFF

ExtendedTilemap_Draygon_2:                                               ;A5B196;
    dw $FFFE
    dw $2316,$0002, $1596,$1597
    dw $2356,$0002, $15A4,$15A5
    dw $2390,$0005, $15AE,$15AF,$15B0,$15B1,$15B2
    dw $23CE,$0006, $15BC,$15BD,$15BE,$15BF,$15C0,$15C1
    dw $240E,$0006, $15CB,$15CC,$15CD,$15CE,$15CF,$15D0
    dw $2452,$0003, $0147,$0147,$0147
    dw $FFFF

ExtendedTilemap_Draygon_3:                                               ;A5B1E2;
    dw $FFFE
    dw $230A,$0003, $15DA,$15DB,$1547
    dw $2316,$0002, $15DC,$15DD
    dw $234C,$0003, $15E1,$15E2,$15E3
    dw $2354,$0003, $15AE,$15E4,$15E5
    dw $238C,$0007, $15E9,$15EA,$15EB,$15EC,$15ED,$15EE,$15EF
    dw $23CC,$0007, $15F3,$15F4,$15F5,$15F6,$15F7,$15F8,$15F9
    dw $240E,$0005, $1600,$1601,$1602,$1603,$1604
    dw $FFFF

ExtendedTilemap_Draygon_4:                                               ;A5B23E;
    dw $FFFE
    dw $230A,$0003, $0147,$0147,$0147
    dw $2316,$0002, $1596,$1597
    dw $234C,$0003, $0147,$0147,$0147
    dw $2354,$0003, $0147,$15A4,$15A5
    dw $238C,$0007, $0147,$0147,$15AE,$15AF,$15B0,$15B1,$15B2
    dw $23CC,$0007, $0147,$15BC,$15BD,$15BE,$15BF,$15C0,$15C1
    dw $240E,$0005, $15CB,$15CC,$15CD,$15CE,$15CF
    dw $FFFF

ExtendedTilemap_Draygon_5:                                               ;A5B29A;
    dw $FFFE
    dw $2316,$0002, $1559,$155A
    dw $2356,$0002, $1569,$156A
    dw $2390,$0005, $0147,$0147,$1576,$1577,$1578
    dw $23CE,$0006, $0147,$0147,$1585,$1586,$1587,$1588
    dw $240E,$0006, $0147,$0147,$1592,$1593,$1594,$1595
    dw $2452,$0003, $15A1,$15A2,$15A3
    dw $FFFF

ExtendedTilemap_Draygon_6:                                               ;A5B2E6;
    dw $FFFE
    dw $2316,$0002, $159F,$15A0
    dw $2356,$0002, $15AC,$15AD
    dw $2394,$0003, $15B9,$15BA,$15BB
    dw $23D2,$0004, $0147,$15C8,$15C9,$15CA
    dw $2412,$0004, $0147,$15D7,$15D8,$15D9
    dw $2452,$0004, $0147,$15DF,$15E0,$1547
    dw $2496,$0002, $1547,$1547
    dw $FFFF

ExtendedTilemap_Draygon_7:                                               ;A5B330;
    dw $FFFE
    dw $2148,$0002, $1554,$1555
    dw $2188,$0002, $1564,$1565
    dw $FFFF

ExtendedTilemap_Draygon_8:                                               ;A5B344;
    dw $FFFE
    dw $2148,$0002, $1580,$1581
    dw $2188,$0002, $1590,$1591
    dw $FFFF

ExtendedTilemap_Draygon_9:                                               ;A5B358;
    dw $FFFE
    dw $2148,$0002, $1582,$1583
    dw $2188,$0002, $1592,$1593
    dw $FFFF

ExtendedTilemap_Draygon_A:                                               ;A5B36C;
    dw $FFFE
    dw $2148,$0002, $1562,$1563
    dw $2188,$0002, $1572,$1573
    dw $FFFF

ExtendedTilemap_Draygon_B:                                               ;A5B380;
    dw $FFFE
    dw $220C,$0003, $1586,$159E,$159F
    dw $224C,$0003, $1596,$1597,$1598
    dw $228C,$0003, $15A6,$15A7,$15A8
    dw $FFFF

ExtendedTilemap_Draygon_C:                                               ;A5B3A2;
    dw $FFFE
    dw $220C,$0001, $159D
    dw $224C,$0003, $15AD,$15AE,$15AF
    dw $228C,$0003, $15BD,$15BE,$15BF
    dw $FFFF

ExtendedTilemap_Draygon_D:                                               ;A5B3C0;
    dw $FFFE
    dw $220C,$0003, $15A0,$15A1,$15A2
    dw $224C,$0003, $15B0,$15B1,$15B2
    dw $228C,$0003, $15B4,$15B5,$15B6
    dw $FFFF

ExtendedTilemap_Draygon_E:                                               ;A5B3E2;
    dw $FFFE
    dw $220C,$0003, $15A3,$1584,$1585
    dw $224C,$0003, $15B3,$1594,$1595
    dw $228C,$0003, $1574,$15A4,$15A5
    dw $FFFF

ExtendedTilemap_Draygon_F:                                               ;A5B404;
    dw $FFFE
    dw $20C8,$0002, $1540,$1541
    dw $2108,$0002, $1550,$1551
    dw $FFFF

ExtendedTilemap_Draygon_10:                                              ;A5B418;
    dw $FFFE
    dw $20C8,$0002, $1560,$1561
    dw $2108,$0002, $1570,$1571
    dw $FFFF

ExtendedTilemap_Draygon_11:                                              ;A5B42C;
    dw $FFFE
    dw $20C8,$0002, $150A,$150B
    dw $2108,$0002, $151A,$151B
    dw $FFFF

ExtendedTilemap_Draygon_12:                                              ;A5B440;
    dw $FFFE
    dw $20C8,$0002, $150C,$150D
    dw $2108,$0002, $151C,$151D
    dw $FFFF

ExtendedTilemap_Draygon_13:                                              ;A5B454;
    dw $FFFE
    dw $20C8,$0002, $1534,$1535
    dw $2108,$0002, $1544,$1545
    dw $FFFF

ExtendedTilemap_Draygon_14:                                              ;A5B468;
    dw $FFFE
    dw $20C8,$0002, $150E,$150F
    dw $2108,$0002, $151E,$151F
    dw $FFFF

ExtendedTilemap_Draygon_15:                                              ;A5B47C;
    dw $FFFE
    dw $20C8,$0002, $152C,$152D
    dw $2108,$0002, $153C,$153D
    dw $FFFF

ExtendedTilemap_Draygon_16:                                              ;A5B490;
    dw $FFFE
    dw $20C8,$0002, $152E,$152F
    dw $2108,$0002, $153E,$153F
    dw $FFFF

ExtendedTilemap_Draygon_17:                                              ;A5B4A4;
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
    dw $0003                                                             ;A5B6C4;
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 3, $1BD)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 2, 3, $1AD)
    %spritemapEntry(1, $1F8, $00, 0, 0, 2, 3, $1A9)

Spritemap_Draygon_13:
    dw $0003                                                             ;A5B6D5;
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 3, $1BC)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 2, 3, $1AC)
    %spritemapEntry(1, $1F8, $00, 0, 0, 2, 3, $1A7)

Spritemap_Draygon_14:
    dw $0004                                                             ;A5B6E6;
    %spritemapEntry(0, $1F4, $F4, 0, 0, 2, 3, $1BB)
    %spritemapEntry(0, $1F4, $EC, 0, 0, 2, 3, $1AB)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 3, $1A4)
    %spritemapEntry(1, $1FC, $FC, 0, 0, 2, 3, $1A5)

Spritemap_Draygon_15:
    dw $0002                                                             ;A5B6FC;
    %spritemapEntry(1, $1F0, $F8, 0, 0, 2, 3, $1A0)
    %spritemapEntry(1, $00, $F8, 0, 0, 2, 3, $1A2)

Spritemap_Draygon_16:
    dw $0003                                                             ;A5B708;
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 3, $197)
    %spritemapEntry(0, $1F0, $00, 0, 0, 2, 3, $196)
    %spritemapEntry(1, $00, $F8, 0, 0, 2, 3, $1AE)

Spritemap_Draygon_17:
    dw $0003                                                             ;A5B719;
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 3, $1D1)
    %spritemapEntry(0, $1F0, $00, 0, 0, 2, 3, $1D0)
    %spritemapEntry(1, $00, $F8, 0, 0, 2, 3, $1C2)

Spritemap_Draygon_18:
    dw $0003                                                             ;A5B72A;
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 3, $187)
    %spritemapEntry(0, $1F4, $04, 0, 0, 2, 3, $186)
    %spritemapEntry(1, $1FC, $F4, 0, 0, 2, 3, $1C4)

Spritemap_Draygon_19:
    dw $0002                                                             ;A5B73B;
    %spritemapEntry(1, $1F8, $00, 0, 0, 2, 3, $188)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 3, $1C6)

Spritemap_Draygon_1A:
    dw $0003                                                             ;A5B747;
    %spritemapEntry(0, $00, $00, 1, 1, 2, 0, $1BD)
    %spritemapEntry(0, $00, $08, 1, 1, 2, 0, $1AD)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $1C8)

Spritemap_Draygon_1B:
    dw $0003                                                             ;A5B758;
    %spritemapEntry(0, $00, $00, 1, 1, 2, 3, $1BC)
    %spritemapEntry(0, $00, $08, 1, 1, 2, 3, $1AC)
    %spritemapEntry(1, $1F8, $F0, 1, 1, 2, 3, $1A7)

Spritemap_Draygon_1C:
    dw $0004                                                             ;A5B769;
    %spritemapEntry(0, $04, $04, 1, 1, 2, 3, $1BB)
    %spritemapEntry(0, $04, $0C, 1, 1, 2, 3, $1AB)
    %spritemapEntry(0, $04, $FC, 1, 1, 2, 3, $1A4)
    %spritemapEntry(1, $1F4, $F4, 1, 1, 2, 3, $1A5)

Spritemap_Draygon_1D:
    dw $0002                                                             ;A5B77F;
    %spritemapEntry(1, $00, $F8, 1, 1, 2, 3, $1A0)
    %spritemapEntry(1, $1F0, $F8, 1, 1, 2, 3, $1A2)

Spritemap_Draygon_1E:
    dw $0003                                                             ;A5B78B;
    %spritemapEntry(0, $00, $F8, 1, 1, 2, 3, $197)
    %spritemapEntry(0, $08, $F8, 1, 1, 2, 3, $196)
    %spritemapEntry(1, $1F0, $F8, 1, 1, 2, 3, $1AE)

Spritemap_Draygon_1F:
    dw $0003                                                             ;A5B79C;
    %spritemapEntry(0, $00, $F8, 1, 1, 2, 3, $1D1)
    %spritemapEntry(0, $08, $F8, 1, 1, 2, 3, $1D0)
    %spritemapEntry(1, $1F0, $F8, 1, 1, 2, 3, $1C2)

Spritemap_Draygon_20:
    dw $0003                                                             ;A5B7AD;
    %spritemapEntry(0, $1FC, $F4, 1, 1, 2, 3, $187)
    %spritemapEntry(0, $04, $F4, 1, 1, 2, 3, $186)
    %spritemapEntry(1, $1F4, $FC, 1, 1, 2, 3, $1C4)

Spritemap_Draygon_21:
    dw $0002                                                             ;A5B7BE;
    %spritemapEntry(1, $1F8, $F0, 1, 1, 2, 3, $188)
    %spritemapEntry(1, $1F8, $00, 1, 1, 2, 3, $1C6)

Spritemap_Draygon_22:
    dw $0001                                                             ;A5B7CA;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 3, $184)

Spritemap_Draygon_23:
    dw $0001                                                             ;A5B7D1;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 3, $182)

Spritemap_Draygon_24:
    dw $0001                                                             ;A5B7D8;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 3, $180)

Spritemap_Draygon_25:
    dw $0001                                                             ;A5B7DF;
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 3, $184)

Spritemap_Draygon_26:
    dw $0001                                                             ;A5B7E6;
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 3, $182)

Spritemap_Draygon_27:
    dw $0001                                                             ;A5B7ED;
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 3, $180)

Spritemap_Draygon_28:
    dw $0004                                                             ;A5B7F4;
    %spritemapEntry(1, $1E8, $10, 0, 1, 0, 3, $121)
    %spritemapEntry(1, $1E8, $00, 0, 1, 2, 3, $101)
    %spritemapEntry(1, $1F0, $10, 0, 1, 2, 3, $120)
    %spritemapEntry(1, $1F0, $00, 0, 1, 2, 3, $100)

Spritemap_Draygon_29:
    dw $0004                                                             ;A5B80A;
    %spritemapEntry(0, $1F8, $10, 0, 1, 2, 3, $123)
    %spritemapEntry(1, $1F0, $00, 0, 1, 2, 3, $103)
    %spritemapEntry(1, $1E8, $10, 0, 1, 2, 3, $124)
    %spritemapEntry(1, $1E8, $00, 0, 1, 2, 3, $104)

Spritemap_Draygon_2A:
    dw $0002                                                             ;A5B820;
    %spritemapEntry(1, $1F0, $10, 0, 1, 2, 3, $126)
    %spritemapEntry(1, $1F0, $00, 0, 1, 2, 3, $106)

Spritemap_Draygon_2B:
    dw $0018                                                             ;A5B82C;
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
    dw $0014                                                             ;A5B8A6;
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
    dw $0010                                                             ;A5B90C;
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
    dw $0010                                                             ;A5B95E;
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
    dw $0001                                                             ;A5B9B0;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 3, $164)

Spritemap_Draygon_30:
    dw $0001                                                             ;A5B9B7;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 3, $16A)

Spritemap_Draygon_31:
    dw $0001                                                             ;A5B9BE;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 3, $15E)

Spritemap_Draygon_32:
    dw $0001                                                             ;A5B9C5;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 3, $15C)

Spritemap_Draygon_33:
    dw $0001                                                             ;A5B9CC;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 3, $14A)

Spritemap_Draygon_34:
    dw $000A                                                             ;A5B9D3;
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
    dw $000A                                                             ;A5BA07;
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
    dw $0001                                                             ;A5BA3B;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 3, $17E)

Spritemap_Draygon_37:
    dw $0001                                                             ;A5BA42;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 3, $17D)

Spritemap_Draygon_38:
    dw $0001                                                             ;A5BA49;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 3, $17C)

Spritemap_Draygon_39:
    dw $0001                                                             ;A5BA50;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 3, $18A)

Spritemap_Draygon_3A:
    dw $0001                                                             ;A5BA57;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 3, $17F)

Spritemap_Draygon_3B:
    dw $0001                                                             ;A5BA5E;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 3, $177)

Spritemap_Draygon_3C:
    dw $0001                                                             ;A5BA65;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 3, $176)

Spritemap_Draygon_3D:
    dw $0001                                                             ;A5BA6C;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 3, $18C)

Spritemap_Draygon_3E:
    dw $0001                                                             ;A5BA73;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 3, $18E)

Spritemap_Draygon_3F:
    dw $000A                                                             ;A5BA7A;
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
    dw $000A                                                             ;A5BAAE;
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
    dw $0013                                                             ;A5BAE2;
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
    dw $0011                                                             ;A5BB43;
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
    dw $0011                                                             ;A5BB9A;
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
    dw $0013                                                             ;A5BBF1;
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
    dw $0014                                                             ;A5BC52;
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
    dw $0014                                                             ;A5BCB8;
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
    dw $0013                                                             ;A5BD1E;
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


ExtendedTilemap_Draygon_18:                                              ;A5BD7F;
    dw $FFFE
    dw $2316,$0002, $159F,$15A0
    dw $2356,$0002, $15AC,$15AD
    dw $2394,$0003, $15B9,$15BA,$15BB
    dw $23D4,$0003, $15C8,$15C9,$15CA
    dw $2414,$0003, $15D7,$15D8,$15D9
    dw $2454,$0003, $15DF,$15E0,$1547
    dw $2496,$0002, $1547,$1547
    dw $FFFF

ExtendedTilemap_Draygon_19:                                              ;A5BDC3;
    dw $FFFE
    dw $2316,$0002, $1559,$155A
    dw $2356,$0002, $1569,$156A
    dw $2394,$0003, $1576,$1577,$1578
    dw $23D2,$0004, $1585,$1586,$1587,$1588
    dw $2412,$0004, $1592,$1593,$1594,$1595
    dw $2452,$0004, $15A1,$15A2,$15A3,$0147
    dw $2496,$0002, $0147,$0147
    dw $FFFF

ExtendedTilemap_Draygon_1A:                                              ;A5BE0D;
    dw $FFFE
    dw $2316,$0002, $1596,$1597
    dw $2356,$0002, $15A4,$15A5
    dw $2390,$0005, $15AE,$15AF,$15B0,$15B1,$15B2
    dw $23CE,$0006, $15BC,$15BD,$15BE,$15BF,$15C0,$15C1
    dw $240E,$0006, $15CB,$15CC,$15CD,$15CE,$15CF,$15D0
    dw $2452,$0003, $0147,$0147,$0147
    dw $FFFF

ExtendedTilemap_Draygon_1B:                                              ;A5BE59;
    dw $FFFE
    dw $230A,$0003, $15DA,$15DB,$1547
    dw $2316,$0002, $15DC,$15DD
    dw $234C,$0003, $15E1,$15E2,$15E3
    dw $2354,$0003, $15AE,$15E4,$15E5
    dw $238C,$0007, $15E9,$15EA,$15EB,$15EC,$15ED,$15EE,$15EF
    dw $23CC,$0007, $15F3,$15F4,$15F5,$15F6,$15F7,$15F8,$15F9
    dw $240E,$0005, $1600,$1601,$1602,$1603,$1604
    dw $FFFF

ExtendedTilemap_Draygon_1C:                                              ;A5BEB5;
    dw $FFFE
    dw $230A,$0003, $0147,$0147,$0147
    dw $2316,$0002, $1596,$1597
    dw $234C,$0003, $0147,$0147,$0147
    dw $2354,$0003, $0147,$15A4,$15A5
    dw $238C,$0007, $0147,$0147,$15AE,$15AF,$15B0,$15B1,$15B2
    dw $23CC,$0007, $0147,$15BC,$15BD,$15BE,$15BF,$15C0,$15C1
    dw $240E,$0005, $15CB,$15CC,$15CD,$15CE,$15CF
    dw $FFFF

ExtendedTilemap_Draygon_1D:                                              ;A5BF11;
    dw $FFFE
    dw $2316,$0002, $1559,$155A
    dw $2356,$0002, $1569,$156A
    dw $2390,$0005, $0147,$0147,$1576,$1577,$1578
    dw $23CE,$0006, $0147,$0147,$1585,$1586,$1587,$1588
    dw $240E,$0006, $0147,$0147,$1592,$1593,$1594,$1595
    dw $2452,$0003, $15A1,$15A2,$15A3
    dw $FFFF

ExtendedTilemap_Draygon_1E:                                              ;A5BF5D;
    dw $FFFE
    dw $2316,$0002, $159F,$15A0
    dw $2356,$0002, $15AC,$15AD
    dw $2394,$0003, $15B9,$15BA,$15BB
    dw $23D2,$0004, $0147,$15C8,$15C9,$15CA
    dw $2412,$0004, $0147,$15D7,$15D8,$15D9
    dw $2452,$0004, $0147,$15DF,$15E0,$1547
    dw $2496,$0002, $1547,$1547
    dw $FFFF

ExtendedTilemap_Draygon_1F:                                              ;A5BFA7;
    dw $FFFE
    dw $2154,$0002, $5555,$5554
    dw $2194,$0002, $5565,$5564
    dw $FFFF

ExtendedTilemap_Draygon_20:                                              ;A5BFBB;
    dw $FFFE
    dw $2154,$0002, $5581,$5580
    dw $2194,$0002, $5591,$5590
    dw $FFFF

ExtendedTilemap_Draygon_21:                                              ;A5BFCF;
    dw $FFFE
    dw $2154,$0002, $5583,$5582
    dw $2194,$0002, $5593,$5592
    dw $FFFF

ExtendedTilemap_Draygon_22:                                              ;A5BFE3;
    dw $FFFE
    dw $2154,$0002, $5563,$5562
    dw $2194,$0002, $5573,$5572
    dw $FFFF

ExtendedTilemap_Draygon_23:                                              ;A5BFF7;
    dw $FFFE
    dw $220E,$0003, $559F,$559E,$5586
    dw $224E,$0003, $5598,$5597,$5596
    dw $228E,$0003, $55A8,$55A7,$55A6
    dw $FFFF

ExtendedTilemap_Draygon_24:                                              ;A5C019;
    dw $FFFE
    dw $2212,$0001, $559D
    dw $224E,$0003, $55AF,$55AE,$55AD
    dw $228E,$0003, $55BF,$55BE,$55BD
    dw $FFFF

ExtendedTilemap_Draygon_25:                                              ;A5C037;
    dw $FFFE
    dw $220E,$0003, $55A2,$55A1,$55A0
    dw $224E,$0003, $55B2,$55B1,$55B0
    dw $228E,$0003, $55B6,$55B5,$55B4
    dw $FFFF

ExtendedTilemap_Draygon_26:                                              ;A5C059;
    dw $FFFE
    dw $220E,$0003, $5585,$5584,$55A3
    dw $224E,$0003, $5595,$5594,$55B3
    dw $228E,$0003, $55A5,$55A4,$5574
    dw $FFFF

ExtendedTilemap_Draygon_27:                                              ;A5C07B;
    dw $FFFE
    dw $20D4,$0002, $5541,$5540
    dw $2114,$0002, $5551,$5550
    dw $FFFF

ExtendedTilemap_Draygon_28:                                              ;A5C08F;
    dw $FFFE
    dw $20D4,$0002, $5561,$5560
    dw $2114,$0002, $5571,$5570
    dw $FFFF

ExtendedTilemap_Draygon_29:                                              ;A5C0A3;
    dw $FFFE
    dw $20D4,$0002, $550B,$550A
    dw $2114,$0002, $551B,$551A
    dw $FFFF

ExtendedTilemap_Draygon_2A:                                              ;A5C0B7;
    dw $FFFE
    dw $20D4,$0002, $550D,$550C
    dw $2114,$0002, $551D,$551C
    dw $FFFF

ExtendedTilemap_Draygon_2B:                                              ;A5C0CB;
    dw $FFFE
    dw $20D4,$0002, $5535,$5534
    dw $2114,$0002, $5545,$5544
    dw $FFFF

ExtendedTilemap_Draygon_2C:                                              ;A5C0DF;
    dw $FFFE
    dw $20D4,$0002, $550F,$550E
    dw $2114,$0002, $551F,$551E
    dw $FFFF

ExtendedTilemap_Draygon_2D:                                              ;A5C0F3;
    dw $FFFE
    dw $20D4,$0002, $552D,$552C
    dw $2114,$0002, $553D,$553C
    dw $FFFF

ExtendedTilemap_Draygon_2E:                                              ;A5C107;
    dw $FFFE
    dw $20D4,$0002, $552F,$552E
    dw $2114,$0002, $553F,$553E
    dw $FFFF

ExtendedTilemap_Draygon_2F:                                              ;A5C11B;
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
    dw $0003                                                             ;A5C33B;
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 3, $1BD)
    %spritemapEntry(0, $00, $F0, 0, 1, 2, 3, $1AD)
    %spritemapEntry(1, $1F8, $00, 0, 1, 2, 3, $1A9)

Spritemap_Draygon_49:
    dw $0003                                                             ;A5C34C;
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 3, $1BC)
    %spritemapEntry(0, $00, $F0, 0, 1, 2, 3, $1AC)
    %spritemapEntry(1, $1F8, $00, 0, 1, 2, 3, $1A7)

Spritemap_Draygon_4A:
    dw $0004                                                             ;A5C35D;
    %spritemapEntry(0, $04, $F4, 0, 1, 2, 3, $1BB)
    %spritemapEntry(0, $04, $EC, 0, 1, 2, 3, $1AB)
    %spritemapEntry(0, $04, $FC, 0, 1, 2, 3, $1A4)
    %spritemapEntry(1, $1F4, $FC, 0, 1, 2, 3, $1A5)

Spritemap_Draygon_4B:
    dw $0002                                                             ;A5C373;
    %spritemapEntry(1, $00, $F8, 0, 1, 2, 3, $1A0)
    %spritemapEntry(1, $1F0, $F8, 0, 1, 2, 3, $1A2)

Spritemap_Draygon_4C:
    dw $0003                                                             ;A5C37F;
    %spritemapEntry(0, $00, $00, 0, 1, 2, 3, $197)
    %spritemapEntry(0, $08, $00, 0, 1, 2, 3, $196)
    %spritemapEntry(1, $1F0, $F8, 0, 1, 2, 3, $1AE)

Spritemap_Draygon_4D:
    dw $0003                                                             ;A5C390;
    %spritemapEntry(0, $00, $00, 0, 1, 2, 3, $1D1)
    %spritemapEntry(0, $08, $00, 0, 1, 2, 3, $1D0)
    %spritemapEntry(1, $1F0, $F8, 0, 1, 2, 3, $1C2)

Spritemap_Draygon_4E:
    dw $0003                                                             ;A5C3A1;
    %spritemapEntry(0, $1FC, $04, 0, 1, 2, 3, $187)
    %spritemapEntry(0, $04, $04, 0, 1, 2, 3, $186)
    %spritemapEntry(1, $1F4, $F4, 0, 1, 2, 3, $1C4)

Spritemap_Draygon_4F:
    dw $0002                                                             ;A5C3B2;
    %spritemapEntry(1, $1F8, $00, 0, 1, 2, 3, $188)
    %spritemapEntry(1, $1F8, $F0, 0, 1, 2, 3, $1C6)

Spritemap_Draygon_50:
    dw $0003                                                             ;A5C3BE;
    %spritemapEntry(0, $00, $00, 1, 1, 2, 0, $1BD)
    %spritemapEntry(0, $00, $08, 1, 1, 2, 0, $1AD)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $1C8)

Spritemap_Draygon_51:
    dw $0003                                                             ;A5C3CF;
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 3, $1BC)
    %spritemapEntry(0, $1F8, $08, 1, 0, 2, 3, $1AC)
    %spritemapEntry(1, $1F8, $F0, 1, 0, 2, 3, $1A7)

Spritemap_Draygon_52:
    dw $0004                                                             ;A5C3E0;
    %spritemapEntry(0, $1F4, $04, 1, 0, 2, 3, $1BB)
    %spritemapEntry(0, $1F4, $0C, 1, 0, 2, 3, $1AB)
    %spritemapEntry(0, $1F4, $FC, 1, 0, 2, 3, $1A4)
    %spritemapEntry(1, $1FC, $F4, 1, 0, 2, 3, $1A5)

Spritemap_Draygon_53:
    dw $0002                                                             ;A5C3F6;
    %spritemapEntry(1, $1F0, $F8, 1, 0, 2, 3, $1A0)
    %spritemapEntry(1, $00, $F8, 1, 0, 2, 3, $1A2)

Spritemap_Draygon_54:
    dw $0003                                                             ;A5C402;
    %spritemapEntry(0, $1F8, $F8, 1, 0, 2, 3, $197)
    %spritemapEntry(0, $1F0, $F8, 1, 0, 2, 3, $196)
    %spritemapEntry(1, $00, $F8, 1, 0, 2, 3, $1AE)

Spritemap_Draygon_55:
    dw $0003                                                             ;A5C413;
    %spritemapEntry(0, $1F8, $F8, 1, 0, 2, 3, $1D1)
    %spritemapEntry(0, $1F0, $F8, 1, 0, 2, 3, $1D0)
    %spritemapEntry(1, $00, $F8, 1, 0, 2, 3, $1C2)

Spritemap_Draygon_56:
    dw $0003                                                             ;A5C424;
    %spritemapEntry(0, $1FC, $F4, 1, 0, 2, 3, $187)
    %spritemapEntry(0, $1F4, $F4, 1, 0, 2, 3, $186)
    %spritemapEntry(1, $1FC, $FC, 1, 0, 2, 3, $1C4)

Spritemap_Draygon_57:
    dw $0002                                                             ;A5C435;
    %spritemapEntry(1, $1F8, $F0, 1, 0, 2, 3, $188)
    %spritemapEntry(1, $1F8, $00, 1, 0, 2, 3, $1C6)

Spritemap_Draygon_58:
    dw $0001                                                             ;A5C441;
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 3, $184)

Spritemap_Draygon_59:
    dw $0001                                                             ;A5C448;
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 3, $182)

Spritemap_Draygon_5A:
    dw $0001                                                             ;A5C44F;
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 3, $180)

Spritemap_Draygon_5B:
    dw $0001                                                             ;A5C456;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 3, $184)

Spritemap_Draygon_5C:
    dw $0001                                                             ;A5C45D;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 3, $182)

Spritemap_Draygon_5D:
    dw $0001                                                             ;A5C464;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 3, $180)


;;; $C46B: Initialisation AI - enemy $DE7F (Draygon eye) ;;;
InitAI_DraygonEye:
    LDX.W EnemyIndex                                                     ;A5C46B;
    LDA.W #InstList_DraygonEye_FacingLeft_Idle                           ;A5C46E;
    STA.W Enemy.instList,X                                               ;A5C471;
    LDA.W #RTS_A5804B                                                    ;A5C474;
    STA.W DraygonBody.function,X                                         ;A5C477;
    RTL                                                                  ;A5C47A;


;;; $C47B: Instruction - Draygon eye function = [[Y]] ;;;
Instruction_Draygon_EyeFunctionInY:
    PHY                                                                  ;A5C47B;
    LDA.W $0000,Y                                                        ;A5C47C;
    STA.W DraygonEye.function                                            ;A5C47F;
    PLY                                                                  ;A5C482;
    INY                                                                  ;A5C483;
    INY                                                                  ;A5C484;
    RTL                                                                  ;A5C485;


;;; $C486: Main AI - enemy $DE7F (Draygon eye) ;;;
MainAI_DraygonEye:
    LDX.W EnemyIndex                                                     ;A5C486;
    JSR.W (DraygonBody.function,X)                                       ;A5C489;
    RTL                                                                  ;A5C48C;


;;; $C48D: Draygon eye function - facing left ;;;
Function_DraygonEye_FacingLeft:
    LDA.W Enemy.frameCounter,X                                           ;A5C48D;
    AND.W #$007F                                                         ;A5C490;
    BNE .nonZeroCounter                                                  ;A5C493;
    LDA.W Enemy[1].XPosition                                             ;A5C495;
    SEC                                                                  ;A5C498;
    SBC.W #$0018                                                         ;A5C499;
    STA.B DP_Temp12                                                      ;A5C49C;
    LDA.W Enemy[1].YPosition                                             ;A5C49E;
    SEC                                                                  ;A5C4A1;
    SBC.W #$0020                                                         ;A5C4A2;
    STA.B DP_Temp14                                                      ;A5C4A5;
    LDA.W #$0018                                                         ;A5C4A7;
    LDY.W #EnemyProjectile_MiscDust                                      ;A5C4AA;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A5C4AD;

  .nonZeroCounter:
    LDX.W EnemyIndex                                                     ;A5C4B1;
    LDA.W Enemy.XPosition                                                ;A5C4B4;
    SEC                                                                  ;A5C4B7;
    SBC.W #$0018                                                         ;A5C4B8;
    STA.B DP_Temp12                                                      ;A5C4BB;
    LDA.W SamusXPosition                                                 ;A5C4BD;
    SEC                                                                  ;A5C4C0;
    SBC.B DP_Temp12                                                      ;A5C4C1;
    STA.B DP_Temp12                                                      ;A5C4C3;
    LDA.W Enemy.YPosition                                                ;A5C4C5;
    SEC                                                                  ;A5C4C8;
    SBC.W #$0020                                                         ;A5C4C9;
    STA.B DP_Temp14                                                      ;A5C4CC;
    LDA.W SamusYPosition                                                 ;A5C4CE;
    SEC                                                                  ;A5C4D1;
    SBC.B DP_Temp14                                                      ;A5C4D2;
    STA.B DP_Temp14                                                      ;A5C4D4;
    JSL.L CalculateAngleOf_12_14_Offset                                  ;A5C4D6;
    CMP.W Enemy.var5,X                                                   ;A5C4DA;
    BEQ .return                                                          ;A5C4DD;
    LDY.W #InstList_DraygonEye_FacingLeft_LookingUp                      ;A5C4DF;
    CMP.W #$0020                                                         ;A5C4E2;
    BMI .directionChosen                                                 ;A5C4E5;
    LDY.W #InstList_DraygonEye_FacingLeft_LookingRight                   ;A5C4E7;
    CMP.W #$0060                                                         ;A5C4EA;
    BMI .directionChosen                                                 ;A5C4ED;
    LDY.W #InstList_DraygonEye_FacingLeft_LookingDown                    ;A5C4EF;
    CMP.W #$00A0                                                         ;A5C4F2;
    BMI .directionChosen                                                 ;A5C4F5;
    LDY.W #InstList_DraygonEye_FacingLeft_LookingLeft                    ;A5C4F7;
    CMP.W #$00E0                                                         ;A5C4FA;
    BMI .directionChosen                                                 ;A5C4FD;
    LDY.W #InstList_DraygonEye_FacingLeft_LookingUp                      ;A5C4FF;

  .directionChosen:
    STA.W Enemy.var5,X                                                   ;A5C502;
    TYA                                                                  ;A5C505;
    STA.W Enemy.instList,X                                               ;A5C506;
    LDA.W #$0001                                                         ;A5C509;
    STA.W Enemy.instTimer,X                                              ;A5C50C;
    STZ.W Enemy.loopCounter,X                                            ;A5C50F;

  .return:
    RTS                                                                  ;A5C512;


;;; $C513: Draygon eye function - facing right ;;;
Function_DraygonEye_FacingRight:
    LDA.W Enemy.frameCounter,X                                           ;A5C513;
    AND.W #$007F                                                         ;A5C516;
    BNE .nonZeroCounter                                                  ;A5C519;
    LDA.W Enemy.XPosition                                                ;A5C51B;
    CLC                                                                  ;A5C51E;
    ADC.W #$0018                                                         ;A5C51F;
    STA.B DP_Temp12                                                      ;A5C522;
    LDA.W Enemy.YPosition                                                ;A5C524;
    SEC                                                                  ;A5C527;
    SBC.W #$0020                                                         ;A5C528;
    STA.B DP_Temp14                                                      ;A5C52B;
    LDA.W #$0018                                                         ;A5C52D;
    LDY.W #EnemyProjectile_MiscDust                                      ;A5C530;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A5C533;

  .nonZeroCounter:
    LDX.W EnemyIndex                                                     ;A5C537;
    LDA.W Enemy.XPosition                                                ;A5C53A;
    CLC                                                                  ;A5C53D;
    ADC.W #$0018                                                         ;A5C53E;
    STA.B DP_Temp12                                                      ;A5C541;
    LDA.W SamusXPosition                                                 ;A5C543;
    SEC                                                                  ;A5C546;
    SBC.B DP_Temp12                                                      ;A5C547;
    STA.B DP_Temp12                                                      ;A5C549;
    LDA.W Enemy.YPosition                                                ;A5C54B;
    SEC                                                                  ;A5C54E;
    SBC.W #$0020                                                         ;A5C54F;
    STA.B DP_Temp14                                                      ;A5C552;
    LDA.W SamusYPosition                                                 ;A5C554;
    SEC                                                                  ;A5C557;
    SBC.B DP_Temp14                                                      ;A5C558;
    STA.B DP_Temp14                                                      ;A5C55A;
    JSL.L CalculateAngleOf_12_14_Offset                                  ;A5C55C;
    CMP.W Enemy.var5,X                                                   ;A5C560;
    BEQ .return                                                          ;A5C563;
    LDY.W #InstList_DraygonEye_FacingRight_LookingUp                     ;A5C565;
    CMP.W #$0020                                                         ;A5C568;
    BMI .directionChosen                                                 ;A5C56B;
    LDY.W #InstList_DraygonEye_FacingRight_LookingRight                  ;A5C56D;
    CMP.W #$0060                                                         ;A5C570;
    BMI .directionChosen                                                 ;A5C573;
    LDY.W #InstList_DraygonEye_FacingRight_LookingDown                   ;A5C575;
    CMP.W #$00A0                                                         ;A5C578;
    BMI .directionChosen                                                 ;A5C57B;
    LDY.W #InstList_DraygonEye_FacingRight_LookingLeft                   ;A5C57D;
    CMP.W #$00E0                                                         ;A5C580;
    BMI .directionChosen                                                 ;A5C583;
    LDY.W #InstList_DraygonEye_FacingRight_LookingUp                     ;A5C585;

  .directionChosen:
    STA.W Enemy.var5,X                                                   ;A5C588;
    TYA                                                                  ;A5C58B;
    STA.W Enemy.instList,X                                               ;A5C58C;
    LDA.W #$0001                                                         ;A5C58F;
    STA.W Enemy.instTimer,X                                              ;A5C592;
    STZ.W Enemy.loopCounter,X                                            ;A5C595;

  .return:
    RTS                                                                  ;A5C598;


;;; $C599: Initialisation AI - enemy $DEBF (Draygon tail) ;;;
InitAI_DraygonTail:
    LDX.W EnemyIndex                                                     ;A5C599;
    LDA.W #InstList_DraygonTail_FacingLeft_FakeTailWhip                  ;A5C59C;
    STA.W Enemy.instList,X                                               ;A5C59F;
    LDA.W #$0700                                                         ;A5C5A2;
    ASL                                                                  ;A5C5A5;
    STA.W Enemy.palette,X                                                ;A5C5A6;
    RTL                                                                  ;A5C5A9;


;;; $C5AA: RTL. Main AI - enemy $DEBF (Draygon tail) ;;;
RTL_A5C5AA:
    RTL                                                                  ;A5C5AA;


;;; $C5AB: RTL ;;;
RTL_A5C5AB:
    RTL                                                                  ;A5C5AB;


;;; $C5AC: RTL ;;;
RTL_A5C5AC:
    RTL                                                                  ;A5C5AC;


;;; $C5AD: Initialisation AI - enemy $DEFF (Draygon arms) ;;;
InitAI_DraygonArms:
    LDX.W EnemyIndex                                                     ;A5C5AD;
    LDA.W #InstList_DraygonArms_FacingLeft_Idle_0                        ;A5C5B0;
    STA.W Enemy.instList,X                                               ;A5C5B3;
    LDA.W #$0700                                                         ;A5C5B6;
    ASL                                                                  ;A5C5B9;
    STA.W Enemy.palette,X                                                ;A5C5BA;
    LDA.W #$0002                                                         ;A5C5BD;
    STA.W Enemy.layer,X                                                  ;A5C5C0;
    RTL                                                                  ;A5C5C3;


;;; $C5C4: RTL. Main AI - enemy $DEFF (Draygon arms) ;;;
RTL_A5C5C4:
    RTL                                                                  ;A5C5C4;


;;; $C5C5: RTL ;;;
RTL_A5C5C5:
    RTL                                                                  ;A5C5C5;


;;; $C5C6: RTL ;;;
RTL_A5C5C6:
    RTL                                                                  ;A5C5C6;


if !FEATURE_KEEP_UNREFERENCED
;;; $C5C7: Unused Draygon fight intro dance data ;;;
UNUSED_DraygonFightIntroDanceData_KeikoLove_A5C5C7:
    db $01,$FF, $01,$00, $00,$FF, $01,$00, $01,$FF, $01,$00, $00,$FF, $01,$00 ;A5C5C7;
    db $01,$FF, $01,$00, $00,$FF, $01,$00, $01,$FF, $00,$FF, $01,$00, $01,$FF ;A5C5D7;
    db $01,$FF, $01,$FF, $01,$FF, $00,$FF, $01,$00, $00,$FF, $01,$FF, $00,$FF ;A5C5E7;
    db $01,$00, $00,$FF, $01,$FF, $00,$FF, $00,$FF, $01,$00, $00,$FF, $00,$FF ;A5C5F7;
    db $00,$FF, $01,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FE ;A5C607;
    db $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FE, $FF,$FF, $00,$FF, $00,$FF ;A5C617;
    db $00,$FE, $FF,$FF, $00,$FF, $00,$FF, $FF,$FF, $00,$FF, $00,$FF, $FF,$FF ;A5C627;
    db $00,$FF, $FF,$FF, $00,$FF, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF ;A5C637;
    db $FF,$00, $FF,$00, $FF,$01, $00,$01, $FF,$00, $00,$01, $FF,$01, $00,$01 ;A5C647;
    db $00,$01, $00,$01, $FF,$01, $00,$01, $00,$01, $00,$01, $FF,$01, $00,$01 ;A5C657;
    db $00,$01, $00,$02, $00,$01, $00,$01, $FF,$01, $00,$01, $00,$01, $00,$01 ;A5C667;
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $01,$01, $00,$01 ;A5C677;
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01 ;A5C687;
    db $00,$01, $01,$00, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01 ;A5C697;
    db $00,$01, $00,$01, $00,$01, $00,$01, $01,$01, $00,$01, $00,$01, $00,$01 ;A5C6A7;
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$02, $00,$01, $00,$01, $00,$01 ;A5C6B7;
    db $00,$01, $00,$01, $00,$02, $00,$01, $00,$01, $00,$01, $00,$02, $00,$01 ;A5C6C7;
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01 ;A5C6D7;
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$FF, $01,$FF, $00,$FF ;A5C6E7;
    db $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $01,$FF, $00,$FF, $00,$FF ;A5C6F7;
    db $00,$FE, $00,$FF, $00,$FF, $01,$FF, $00,$FE, $00,$FF, $00,$FF, $00,$FF ;A5C707;
    db $00,$FE, $01,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FE, $01,$FF, $00,$FF ;A5C717;
    db $00,$FF, $00,$FF, $01,$FF, $00,$FF, $01,$FF, $00,$FF, $01,$FF, $01,$FF ;A5C727;
    db $01,$00, $00,$FF, $01,$00, $01,$00, $01,$00, $01,$FF, $01,$00, $01,$00 ;A5C737;
    db $01,$01, $01,$00, $01,$01, $01,$00, $01,$01, $01,$01, $00,$01, $01,$01 ;A5C747;
    db $00,$01, $01,$00, $00,$01, $00,$01, $00,$01, $01,$02, $00,$01, $00,$01 ;A5C757;
    db $FF,$01, $00,$01, $00,$01, $00,$01, $FF,$01, $00,$01, $FF,$01, $00,$01 ;A5C767;
    db $FF,$01, $FF,$01, $FF,$01, $FF,$00, $FF,$01, $FF,$00, $FF,$00, $FF,$00 ;A5C777;
    db $FF,$00, $FF,$00, $FF,$FF, $FF,$00, $FF,$FF, $FF,$00, $FF,$FF, $00,$01 ;A5C787;
    db $01,$01, $01,$01, $01,$01, $00,$01, $01,$01, $01,$01, $01,$01, $01,$00 ;A5C797;
    db $01,$01, $01,$01, $01,$01, $02,$01, $01,$00, $00,$01, $01,$00, $01,$01 ;A5C7A7;
    db $01,$00, $01,$00, $01,$01, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00 ;A5C7B7;
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $02,$00 ;A5C7C7;
    db $01,$00, $02,$FF, $01,$00, $02,$00, $01,$00, $02,$FF, $01,$00, $02,$00 ;A5C7D7;
    db $01,$FF, $02,$00, $01,$00, $01,$FF, $02,$00, $01,$FF, $01,$00, $01,$FF ;A5C7E7;
    db $02,$FF, $01,$00, $01,$FF, $01,$FF, $01,$FF, $01,$00, $00,$FF, $01,$FF ;A5C7F7;
    db $01,$FF, $01,$FE, $00,$FF, $01,$FF, $01,$FF, $00,$FF, $00,$FE, $01,$FF ;A5C807;
    db $00,$FE, $00,$FF, $01,$FF, $00,$FE, $00,$FF, $00,$FE, $00,$FE, $00,$FF ;A5C817;
    db $00,$FE, $00,$FF, $00,$FE, $FF,$FE, $00,$FF, $00,$FE, $FF,$FE, $00,$FF ;A5C827;
    db $00,$FE, $FF,$FE, $FF,$FE, $00,$FF, $FF,$FE, $FF,$FE, $00,$FE, $FF,$FF ;A5C837;
    db $FF,$FE, $FF,$FF, $FF,$FE, $FF,$FF, $00,$FF, $FF,$FE, $FF,$FF, $FF,$FF ;A5C847;
    db $FF,$FF, $FF,$00, $FF,$FF, $FF,$00, $FF,$FF, $FF,$00, $FF,$00, $FF,$00 ;A5C857;
    db $FF,$01, $FF,$00, $FF,$01, $FF,$01, $FF,$01, $FF,$02, $FF,$01, $00,$01 ;A5C867;
    db $FF,$02, $FF,$01, $00,$02, $FF,$01, $FF,$02, $00,$02, $FF,$01, $00,$02 ;A5C877;
    db $00,$02, $FF,$02, $00,$01, $00,$02, $FF,$02, $00,$02, $00,$01, $00,$02 ;A5C887;
    db $00,$01, $00,$02, $00,$02, $00,$01, $00,$02, $00,$01, $01,$02, $00,$01 ;A5C897;
    db $00,$01, $01,$02, $00,$01, $01,$02, $00,$01, $01,$01, $00,$01, $01,$02 ;A5C8A7;
    db $01,$01, $00,$01, $01,$01, $01,$01, $01,$01, $01,$01, $01,$01, $01,$01 ;A5C8B7;
    db $01,$01, $01,$01, $02,$00, $01,$01, $01,$01, $01,$01, $02,$00, $01,$01 ;A5C8C7;
    db $01,$00, $02,$01, $01,$00, $01,$01, $02,$00, $01,$00, $02,$01, $01,$00 ;A5C8D7;
    db $02,$00, $01,$00, $01,$00, $02,$00, $01,$00, $02,$00, $01,$00, $02,$00 ;A5C8E7;
    db $01,$00, $01,$00, $02,$00, $01,$FF, $01,$00, $02,$00, $01,$00, $01,$FF ;A5C8F7;
    db $01,$00, $01,$FF, $01,$00, $01,$FF, $01,$00, $01,$FF, $01,$FF, $01,$FF ;A5C907;
    db $00,$FF, $01,$FF, $00,$FF, $00,$FF, $01,$FE, $00,$FF, $00,$FF, $00,$FF ;A5C917;
    db $00,$FE, $00,$FF, $00,$FE, $00,$FF, $00,$FE, $00,$FF, $00,$FE, $00,$FF ;A5C927;
    db $00,$FE, $00,$FE, $00,$FF, $00,$FE, $00,$FE, $00,$FE, $00,$FF, $00,$FE ;A5C937;
    db $00,$FE, $00,$FF, $00,$FE, $00,$FE, $00,$FF, $00,$FE, $00,$FE, $00,$FF ;A5C947;
    db $00,$FE, $00,$FF, $00,$FF, $00,$FE, $00,$FF, $00,$FF, $00,$FF, $01,$FF ;A5C957;
    db $00,$FF, $00,$FF, $00,$FF, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01 ;A5C967;
    db $00,$01, $00,$01, $00,$01, $01,$02, $00,$01, $00,$02, $00,$01, $00,$02 ;A5C977;
    db $00,$01, $00,$02, $FF,$01, $00,$02, $00,$02, $00,$02, $00,$01, $00,$02 ;A5C987;
    db $00,$02, $00,$01, $00,$02, $00,$02, $00,$02, $00,$01, $00,$02, $00,$01 ;A5C997;
    db $00,$02, $FF,$01, $00,$02, $00,$01, $00,$02, $00,$01, $01,$01, $00,$01 ;A5C9A7;
    db $00,$02, $00,$01, $00,$01, $01,$01, $00,$01, $00,$01, $01,$01, $01,$01 ;A5C9B7;
    db $01,$01, $01,$01, $01,$00, $01,$01, $01,$00, $01,$01, $01,$00, $02,$00 ;A5C9C7;
    db $01,$01, $01,$00, $02,$00, $01,$01, $01,$FF, $01,$00, $00,$FF, $01,$00 ;A5C9D7;
    db $01,$FF, $01,$00, $00,$FF, $01,$00, $01,$FF, $01,$00, $00,$FF, $01,$00 ;A5C9E7;
    db $01,$FF, $00,$FF, $01,$00, $01,$FF, $01,$FF, $01,$FF, $01,$FF, $00,$FF ;A5C9F7;
    db $01,$00, $00,$FF, $01,$FF, $00,$FF, $01,$00, $00,$FF, $01,$FF, $00,$FF ;A5CA07;
    db $00,$FF, $01,$00, $00,$FF, $00,$FF, $00,$FF, $01,$FF, $00,$FF, $00,$FF ;A5CA17;
    db $00,$FF, $00,$FF, $00,$FF, $00,$FE, $00,$FF, $00,$FF, $00,$FF, $00,$FF ;A5CA27;
    db $00,$FE, $FF,$FF, $00,$FF, $00,$FF, $00,$FE, $FF,$FF, $00,$FF, $00,$FF ;A5CA37;
    db $FF,$FF, $00,$FF, $00,$FF, $FF,$FF, $00,$FF, $FF,$FF, $00,$FF, $00,$FF ;A5CA47;
    db $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $FF,$01, $00,$01 ;A5CA57;
    db $FF,$00, $00,$01, $FF,$01, $00,$01, $00,$01, $00,$01, $FF,$01, $00,$01 ;A5CA67;
    db $00,$01, $00,$01, $FF,$01, $00,$01, $00,$01, $00,$02, $00,$01, $00,$01 ;A5CA77;
    db $FF,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01 ;A5CA87;
    db $00,$01, $00,$01, $01,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01 ;A5CA97;
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $01,$00, $00,$01, $00,$01 ;A5CAA7;
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01 ;A5CAB7;
    db $01,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01 ;A5CAC7;
    db $00,$02, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$02, $00,$01 ;A5CAD7;
    db $00,$01, $00,$01, $00,$02, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01 ;A5CAE7;
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01 ;A5CAF7;
    db $00,$01, $00,$FF, $01,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF ;A5CB07;
    db $00,$FF, $01,$FF, $00,$FF, $00,$FF, $00,$FE, $00,$FF, $00,$FF, $01,$FF ;A5CB17;
    db $00,$FE, $00,$FF, $00,$FF, $00,$FF, $00,$FE, $01,$FF, $00,$FF, $00,$FF ;A5CB27;
    db $00,$FF, $00,$FE, $01,$FF, $00,$FF, $00,$FF, $00,$FF, $01,$FF, $00,$FF ;A5CB37;
    db $01,$FF, $00,$FF, $01,$FF, $01,$FF, $01,$00, $00,$FF, $01,$00, $01,$00 ;A5CB47;
    db $01,$00, $01,$FF, $01,$00, $01,$00, $01,$01, $01,$00, $01,$01, $01,$00 ;A5CB57;
    db $01,$01, $01,$01, $00,$01, $01,$01, $00,$01, $01,$00, $00,$01, $00,$01 ;A5CB67;
    db $00,$01, $01,$02, $00,$01, $00,$01, $FF,$01, $00,$01, $00,$01, $00,$01 ;A5CB77;
    db $FF,$01, $00,$01, $FF,$01, $00,$01, $FF,$01, $FF,$01, $FF,$01, $FF,$00 ;A5CB87;
    db $FF,$01, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$FF, $FF,$00 ;A5CB97;
    db $FF,$FF, $FF,$00, $FF,$FF, $00,$01, $01,$01, $01,$01, $01,$01, $00,$01 ;A5CBA7;
    db $01,$01, $01,$01, $01,$01, $01,$00, $01,$01, $01,$01, $01,$01, $02,$01 ;A5CBB7;
    db $01,$00, $00,$01, $01,$00, $01,$01, $01,$00, $01,$00, $01,$01, $01,$00 ;A5CBC7;
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00 ;A5CBD7;
    db $01,$00, $01,$00, $01,$00, $01,$FF, $01,$FF, $00,$FF, $01,$00, $01,$FF ;A5CBE7;
    db $00,$FF, $01,$00, $01,$FF, $00,$FF, $01,$00, $00,$FF, $01,$FF, $01,$FF ;A5CBF7;
    db $01,$FF, $01,$FF, $00,$FF, $01,$FF, $00,$FF, $01,$FF, $01,$FF, $00,$FF ;A5CC07;
    db $01,$FF, $01,$FF, $00,$FF, $01,$FF, $00,$FF, $01,$FF, $01,$FF, $00,$FF ;A5CC17;
    db $01,$FE, $01,$FF, $00,$FF, $01,$FE, $00,$FF, $01,$FF, $00,$FF, $01,$FE ;A5CC27;
    db $01,$FF, $00,$FF, $00,$FE, $01,$FF, $00,$FF, $01,$FF, $00,$FF, $00,$FE ;A5CC37;
    db $00,$FF, $01,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF ;A5CC47;
    db $00,$FF, $FF,$00, $00,$FF, $FF,$FF, $FF,$00, $FF,$00, $FF,$00, $FF,$00 ;A5CC57;
    db $FF,$00, $00,$01, $FF,$00, $FF,$01, $FF,$00, $FF,$01, $FF,$00, $FF,$01 ;A5CC67;
    db $FF,$01, $FF,$00, $FF,$01, $FF,$01, $FF,$01, $FF,$01, $FF,$01, $FF,$01 ;A5CC77;
    db $FF,$01, $00,$01, $FF,$01, $00,$01, $FF,$01, $00,$01, $00,$01, $FF,$01 ;A5CC87;
    db $00,$01, $00,$01, $00,$01, $00,$01, $FF,$01, $00,$01, $00,$01, $00,$01 ;A5CC97;
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01 ;A5CCA7;
    db $00,$01, $00,$01, $01,$01, $00,$01, $00,$01, $00,$01, $00,$01, $01,$01 ;A5CCB7;
    db $00,$01, $00,$01, $01,$01, $00,$01, $00,$01, $01,$01, $00,$01, $00,$01 ;A5CCC7;
    db $01,$01, $00,$01, $01,$01, $01,$01, $00,$01, $01,$01, $00,$01, $01,$01 ;A5CCD7;
    db $01,$01, $01,$01, $01,$00, $01,$01, $01,$00, $01,$00, $01,$00, $01,$FF ;A5CCE7;
    db $01,$00, $01,$FF, $01,$00, $01,$FF, $00,$FF, $01,$00, $01,$FF, $01,$FF ;A5CCF7;
    db $01,$FF, $00,$FF, $01,$FF, $01,$FF, $00,$FF, $01,$FF, $01,$FE, $00,$FF ;A5CD07;
    db $01,$FF, $00,$FF, $01,$FF, $00,$FF, $01,$FF, $01,$FF, $00,$FF, $00,$FF ;A5CD17;
    db $01,$FF, $00,$FF, $00,$FF, $00,$FF, $01,$FF, $00,$FF, $00,$FF, $00,$FF ;A5CD27;
    db $01,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $01,$FF, $00,$FF ;A5CD37;
    db $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF ;A5CD47;
    db $00,$FF, $00,$FE, $00,$FF, $00,$FF, $FF,$FF, $00,$FF, $00,$FF, $FF,$FF ;A5CD57;
    db $FF,$FF, $00,$FF, $FF,$FF, $FF,$FF, $FF,$FF, $00,$FF, $FF,$00, $FF,$FF ;A5CD67;
    db $FF,$00, $FF,$FF, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$01 ;A5CD77;
    db $FF,$00, $FF,$01, $FF,$01, $FF,$01, $FF,$00, $FF,$01, $00,$01, $FF,$02 ;A5CD87;
    db $00,$01, $00,$01, $00,$01, $00,$01, $01,$01, $01,$01, $01,$00, $01,$01 ;A5CD97;
    db $01,$00, $01,$00, $02,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00 ;A5CDA7;
    db $01,$FF, $01,$00, $01,$00, $01,$FF, $01,$00, $01,$00, $01,$FF, $01,$00 ;A5CDB7;
    db $01,$FF, $01,$00, $01,$FF, $01,$FF, $01,$FF, $01,$00, $01,$FF, $01,$00 ;A5CDC7;
    db $01,$FF, $01,$FF, $01,$00, $01,$FF, $01,$00, $01,$FF, $01,$00, $01,$FF ;A5CDD7;
    db $01,$00, $00,$FF, $01,$00, $01,$FF, $01,$00, $01,$FF, $01,$00, $01,$FF ;A5CDE7;
    db $01,$00, $01,$FF, $01,$FF, $01,$00, $01,$FF, $01,$00, $01,$FF, $01,$00 ;A5CDF7;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $CE07: Draygon fight intro dance data ;;;
DraygonFightIntroDanceData_KeikoLove:
; The Keiko love dance
; The table index is incremented by 4 per movement instead of 2, so only entries 2k for some k are used
    db $03,$00, $03,$00, $03,$00, $02,$FF, $03,$00, $03,$FF, $03,$00, $02,$FF ;A5CE07;
    db $03,$FF, $02,$FE, $02,$FF, $02,$FE, $02,$FE, $02,$FD, $02,$FE, $01,$FD ;A5CE17;
    db $02,$FD, $01,$FE, $01,$FD, $02,$FE, $01,$FE, $00,$FE, $01,$FE, $01,$FF ;A5CE27;
    db $01,$00, $00,$FF, $01,$00, $01,$01, $00,$01, $00,$01, $00,$02, $00,$02 ;A5CE37;
    db $00,$02, $00,$02, $00,$02, $00,$03, $FF,$03, $00,$03, $00,$03, $FF,$04 ;A5CE47;
    db $00,$03, $FF,$04, $00,$04, $FF,$04, $00,$04, $FF,$04, $FF,$04, $00,$05 ;A5CE57;
    db $FF,$04, $FF,$04, $00,$05, $FF,$04, $FF,$04, $FF,$05, $FF,$04, $00,$04 ;A5CE67;
    db $FF,$05, $FF,$04, $FF,$04, $FF,$04, $FF,$04, $00,$04, $FF,$03, $FF,$04 ;A5CE77;
    db $FF,$03, $00,$03, $FF,$03, $FF,$03, $FF,$03, $00,$02, $FF,$02, $FF,$02 ;A5CE87;
    db $00,$01, $FF,$02, $00,$01, $FF,$01, $FF,$00, $00,$FF, $00,$FF, $00,$FF ;A5CE97;
    db $00,$FF, $00,$FE, $00,$FF, $00,$FD, $00,$FE, $00,$FE, $00,$FD, $00,$FD ;A5CEA7;
    db $01,$FD, $00,$FD, $00,$FD, $01,$FD, $00,$FC, $01,$FD, $01,$FC, $00,$FD ;A5CEB7;
    db $01,$FC, $01,$FD, $00,$FC, $01,$FC, $01,$FD, $01,$FC, $01,$FD, $01,$FC ;A5CEC7;
    db $01,$FD, $01,$FD, $02,$FD, $01,$FD, $01,$FD, $02,$FD, $01,$FD, $01,$FE ;A5CED7;
    db $02,$FE, $02,$FE, $01,$FD, $02,$FF, $02,$FE, $02,$FE, $01,$FE, $02,$FF ;A5CEE7;
    db $02,$FE, $03,$FE, $02,$FF, $02,$FE, $03,$FE, $02,$FF, $03,$FE, $02,$FF ;A5CEF7;
    db $03,$FE, $03,$FE, $03,$FE, $03,$FE, $03,$FE, $02,$FF, $03,$FE, $03,$FE ;A5CF07;
    db $03,$FF, $03,$FE, $02,$FF, $03,$FF, $02,$FF, $03,$FF, $02,$00, $01,$FF ;A5CF17;
    db $02,$00, $01,$01, $02,$00, $00,$01, $01,$01, $00,$02, $00,$02, $00,$02 ;A5CF27;
    db $00,$02, $FF,$02, $00,$03, $FF,$02, $FF,$03, $FE,$03, $FF,$03, $FF,$03 ;A5CF37;
    db $FE,$03, $FE,$03, $FE,$03, $FE,$04, $FE,$03, $FE,$03, $FE,$03, $FE,$02 ;A5CF47;
    db $FE,$03, $FD,$03, $FE,$02, $FE,$03, $FD,$02, $FE,$02, $FE,$01, $FD,$02 ;A5CF57;
    db $FE,$01, $FD,$02, $FE,$01, $FD,$01, $FD,$01, $FE,$00, $FD,$01, $FD,$00 ;A5CF67;
    db $FE,$00, $FD,$00, $FD,$FF, $FD,$00, $FD,$FF, $FD,$FF, $FD,$FF, $FD,$FE ;A5CF77;
    db $FD,$FF, $FD,$FE, $FE,$FE, $FE,$FE, $FF,$FE, $00,$FF, $01,$FE, $01,$FE ;A5CF87;
    db $02,$FE, $02,$FF, $03,$FE, $03,$FF, $04,$FF, $03,$FF, $03,$00, $03,$00 ;A5CF97;
    db $03,$00, $03,$01, $03,$00, $02,$01, $02,$02, $03,$01, $02,$02, $02,$02 ;A5CFA7;
    db $02,$02, $01,$02, $02,$02, $02,$03, $01,$03, $02,$02, $01,$03, $02,$03 ;A5CFB7;
    db $01,$03, $01,$03, $02,$03, $01,$03, $01,$02, $01,$03, $01,$03, $02,$03 ;A5CFC7;
    db $01,$03, $01,$02, $01,$03, $02,$03, $01,$02, $01,$03, $02,$02, $01,$02 ;A5CFD7;
    db $02,$02, $01,$02, $02,$02, $02,$02, $02,$02, $02,$02, $02,$01, $02,$02 ;A5CFE7;
    db $02,$01, $02,$01, $03,$01, $02,$01, $03,$01, $02,$01, $03,$00, $03,$01 ;A5CFF7;
    db $03,$01, $01,$FF, $02,$00, $01,$FF, $02,$00, $01,$FF, $02,$00, $01,$FF ;A5D007;
    db $01,$00, $02,$FF, $01,$FF, $02,$00, $01,$FF, $02,$00, $01,$FF, $01,$FF ;A5D017;
    db $02,$00, $01,$FF, $01,$FF, $02,$FF, $01,$FF, $01,$00, $02,$FF, $01,$FF ;A5D027;
    db $01,$FF, $01,$FF, $02,$FF, $01,$FF, $01,$FF, $01,$FF, $01,$FF, $02,$FF ;A5D037;
    db $01,$FF, $01,$FE, $01,$FF, $01,$FF, $01,$FF, $01,$FE, $01,$FF, $01,$FF ;A5D047;
    db $01,$FE, $00,$FF, $01,$FE, $01,$FF, $01,$FE, $00,$FF, $01,$FE, $01,$FF ;A5D057;
    db $00,$FE, $01,$FF, $00,$FE, $00,$FF, $01,$FE, $00,$FE, $00,$FF, $00,$FE ;A5D067;
    db $00,$FF, $00,$FE, $00,$FE, $00,$FF, $00,$FE, $00,$FF, $FF,$FE, $00,$FE ;A5D077;
    db $00,$FF, $FF,$FE, $FF,$FE, $00,$FF, $FF,$FE, $FF,$FF, $FF,$FE, $FF,$FF ;A5D087;
    db $FF,$FF, $FF,$FF, $FF,$FF, $FF,$FF, $FE,$FF, $FF,$00, $FF,$00, $FE,$00 ;A5D097;
    db $FF,$00, $FF,$00, $FE,$01, $FF,$00, $FE,$01, $FF,$01, $FE,$01, $FF,$01 ;A5D0A7;
    db $FF,$01, $FE,$01, $FF,$01, $FF,$02, $FF,$01, $FF,$01, $FF,$02, $FF,$01 ;A5D0B7;
    db $FF,$01, $00,$02, $FF,$01, $FF,$02, $00,$01, $FF,$01, $00,$02, $00,$01 ;A5D0C7;
    db $FF,$02, $00,$01, $00,$02, $00,$01, $00,$02, $FF,$01, $00,$02, $00,$02 ;A5D0D7;
    db $00,$01, $00,$02, $00,$01, $00,$02, $00,$02, $00,$01, $00,$02, $00,$02 ;A5D0E7;
    db $00,$01, $00,$02, $00,$02, $00,$01, $00,$02, $00,$02, $01,$01, $00,$02 ;A5D0F7;
    db $00,$01, $01,$02, $00,$01, $01,$01, $00,$02, $01,$01, $01,$01, $00,$01 ;A5D107;
    db $01,$01, $01,$02, $02,$00, $01,$01, $01,$01, $01,$01, $02,$01, $01,$00 ;A5D117;
    db $02,$01, $01,$00, $02,$01, $01,$00, $02,$01, $01,$00, $02,$00, $02,$01 ;A5D127;
    db $01,$00, $02,$00, $01,$00, $02,$00, $02,$00, $01,$00, $02,$00, $01,$00 ;A5D137;
    db $02,$00, $01,$00, $02,$00, $01,$00, $02,$00, $01,$00, $01,$00, $02,$FF ;A5D147;
    db $01,$00, $02,$00, $01,$FF, $01,$00, $02,$FF, $01,$00, $01,$00, $02,$FF ;A5D157;
    db $01,$00, $01,$FF, $01,$FF, $01,$00, $02,$FF, $01,$00, $01,$FF, $01,$FF ;A5D167;
    db $01,$FF, $01,$FF, $01,$FF, $01,$FF, $01,$FF, $00,$FF, $01,$FF, $01,$FF ;A5D177;
    db $01,$FE, $00,$FF, $01,$FF, $00,$FF, $01,$FE, $01,$FF, $00,$FE, $01,$FF ;A5D187;
    db $00,$FE, $01,$FF, $00,$FE, $01,$FE, $00,$FF, $01,$FE, $00,$FE, $01,$FE ;A5D197;
    db $01,$FE, $00,$FE, $01,$FE, $00,$FF, $01,$FE, $00,$FE, $01,$FE, $00,$FE ;A5D1A7;
    db $01,$FE, $00,$FE, $01,$FE, $00,$FE, $01,$FE, $00,$FE, $00,$FE, $01,$FF ;A5D1B7;
    db $00,$FE, $01,$FE, $00,$FF, $01,$FE, $00,$FF, $00,$FE, $01,$FF, $00,$FF ;A5D1C7;
    db $00,$FE, $01,$FF, $00,$FF, $00,$FF, $01,$FF, $00,$FF, $00,$FF, $01,$00 ;A5D1D7;
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01 ;A5D1E7;
    db $00,$02, $00,$01, $00,$02, $FF,$01, $00,$02, $00,$02, $00,$01, $00,$02 ;A5D1F7;
    db $00,$02, $FF,$01, $00,$02, $00,$02, $00,$01, $FF,$02, $00,$02, $00,$01 ;A5D207;
    db $00,$02, $FF,$01, $00,$02, $00,$01, $00,$02, $FF,$01, $00,$01, $00,$02 ;A5D217;
    db $00,$01, $00,$01, $00,$02, $FF,$01, $00,$01, $00,$02, $00,$01, $00,$01 ;A5D227;
    db $00,$02, $00,$01, $00,$01, $00,$01, $00,$02, $00,$01, $00,$01, $01,$02 ;A5D237;
    db $00,$01, $00,$01, $01,$01, $00,$02, $00,$01, $01,$01, $00,$02, $01,$01 ;A5D247;
    db $00,$01, $01,$01, $01,$02, $01,$01, $00,$01, $01,$01, $01,$01, $01,$01 ;A5D257;
    db $01,$01, $01,$01, $01,$01, $01,$01, $01,$00, $02,$01, $01,$01, $01,$00 ;A5D267;
    db $01,$01, $02,$00, $01,$00, $01,$01, $02,$00, $01,$00, $02,$00, $01,$01 ;A5D277;
    db $01,$00, $01,$FF, $01,$FF, $01,$FF, $01,$FF, $01,$FF, $01,$FF, $02,$FF ;A5D287;
    db $01,$FF, $01,$FF, $01,$FF, $01,$FF, $01,$FF, $01,$FF, $01,$FF, $01,$FF ;A5D297;
    db $01,$FF, $01,$FF, $01,$FF, $01,$FF, $01,$FF, $01,$FF, $01,$FF, $01,$FF ;A5D2A7;
    db $01,$FF, $01,$FF, $01,$FF, $00,$FF, $01,$FF, $01,$FE, $01,$FF, $01,$FF ;A5D2B7;
    db $01,$FF, $00,$FF, $01,$FF, $01,$FF, $01,$FF, $00,$FF, $01,$FF, $01,$FF ;A5D2C7;
    db $00,$FF, $01,$FF, $01,$FF, $00,$FE, $01,$FF, $01,$FF, $00,$FF, $01,$FF ;A5D2D7;
    db $00,$FF, $01,$FE, $01,$FF, $00,$FF, $01,$FF, $00,$FE, $01,$FF, $00,$FF ;A5D2E7;
    db $01,$FE, $00,$FF, $00,$FE, $01,$FF, $00,$FF, $01,$FE, $00,$FF, $00,$FE ;A5D2F7;
    db $01,$FE, $00,$FF, $01,$FE, $00,$FF, $00,$FE, $00,$FE, $01,$FE, $00,$FF ;A5D307;
    db $00,$FE, $01,$FE, $00,$FE, $00,$FE, $00,$FE, $01,$FE, $00,$FE, $00,$FE ;A5D317;
    db $00,$FE, $00,$FE, $00,$FE, $01,$FE, $00,$FE, $00,$FE, $00,$FE, $00,$FE ;A5D327;
    db $00,$FE, $00,$FE, $00,$FE, $00,$FF, $00,$FE, $00,$FE, $00,$FF, $00,$FE ;A5D337;
    db $00,$FF, $00,$FE, $FF,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $FF,$FF ;A5D347;
    db $00,$FF, $FF,$00, $FF,$00, $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$01 ;A5D357;
    db $FF,$01, $00,$01, $FF,$01, $FF,$01, $00,$02, $FF,$01, $FF,$02, $00,$01 ;A5D367;
    db $FF,$02, $00,$02, $FF,$01, $FF,$02, $00,$02, $FF,$02, $FF,$01, $00,$02 ;A5D377;
    db $FF,$02, $00,$02, $FF,$01, $00,$02, $00,$02, $FF,$01, $00,$02, $FF,$01 ;A5D387;
    db $00,$02, $00,$02, $00,$01, $FF,$02, $00,$01, $00,$02, $00,$01, $00,$02 ;A5D397;
    db $FF,$01, $00,$02, $00,$01, $00,$01, $00,$02, $00,$01, $00,$02, $00,$01 ;A5D3A7;
    db $00,$01, $00,$02, $00,$01, $00,$01, $00,$02, $00,$01, $00,$01, $00,$02 ;A5D3B7;
    db $00,$01, $00,$01, $01,$01, $00,$02, $00,$01, $00,$01, $00,$02, $00,$01 ;A5D3C7;
    db $00,$01, $00,$02, $00,$01, $00,$01, $00,$02, $01,$01, $00,$01, $00,$02 ;A5D3D7;
    db $00,$01, $00,$01, $00,$02, $00,$01, $00,$01, $00,$02, $00,$01, $00,$02 ;A5D3E7;
    db $00,$01, $00,$01, $00,$02, $00,$01, $00,$02, $00,$01, $00,$02, $00,$01 ;A5D3F7;
    db $00,$02, $00,$01, $00,$02, $FF,$02, $00,$01, $00,$02, $00,$02, $00,$01 ;A5D407;
    db $FF,$02, $00,$02, $00,$01, $00,$02, $FF,$01, $00,$01, $00,$01, $00,$01 ;A5D417;
    db $FF,$00, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FE, $00,$FF ;A5D427;
    db $00,$FE, $00,$FF, $00,$FE, $01,$FE, $00,$FE, $00,$FE, $00,$FE, $00,$FE ;A5D437;
    db $01,$FE, $00,$FE, $00,$FD, $01,$FE, $00,$FE, $01,$FE, $00,$FE, $01,$FE ;A5D447;
    db $00,$FD, $01,$FE, $01,$FE, $00,$FE, $01,$FE, $01,$FE, $00,$FF, $01,$FE ;A5D457;
    db $01,$FE, $01,$FF, $01,$FF, $01,$FE, $01,$FF, $01,$FF, $01,$FF, $01,$FF ;A5D467;
    db $01,$FF, $01,$00, $01,$FF, $01,$00, $01,$00, $02,$00, $01,$00, $01,$00 ;A5D477;
    db $02,$01, $01,$00, $01,$01, $02,$01, $01,$01, $01,$01, $01,$01, $01,$01 ;A5D487;
    db $02,$01, $01,$01, $01,$01, $00,$02, $01,$01, $01,$01, $01,$02, $00,$01 ;A5D497;
    db $01,$02, $00,$01, $00,$02, $01,$01, $00,$02, $00,$01, $00,$02, $00,$01 ;A5D4A7;
    db $00,$02, $FF,$01, $00,$02, $00,$01, $FF,$02, $00,$01, $FF,$01, $FF,$02 ;A5D4B7;
    db $FF,$01, $FF,$01, $FF,$02, $FF,$01, $FF,$01, $FF,$01, $FF,$01, $FE,$01 ;A5D4C7;
    db $FF,$00, $FF,$00, $FE,$00, $FF,$00, $FE,$FF, $FF,$FF, $FE,$00, $FF,$FF ;A5D4D7;
    db $FF,$FF, $FF,$FF, $FF,$00, $FF,$00, $00,$01, $00,$02, $01,$01, $00,$01 ;A5D4E7;
    db $01,$02, $01,$02, $01,$02, $01,$01, $01,$02, $02,$02, $01,$01, $01,$01 ;A5D4F7;
    db $02,$01, $01,$01, $01,$01, $02,$01, $01,$00, $02,$00, $01,$00, $01,$01 ;A5D507;
    db $02,$00, $01,$00, $02,$FF, $01,$00, $02,$00, $01,$00, $01,$00, $02,$FF ;A5D517;
    db $01,$00, $02,$00, $01,$FF, $01,$00, $02,$00, $01,$FF, $02,$00, $02,$FF ;A5D527;
    db $01,$FE, $02,$FF, $02,$FF, $02,$FF, $01,$FE, $02,$FF, $02,$FE, $01,$FE ;A5D537;
    db $02,$FF, $02,$FE, $01,$FE, $02,$FE, $02,$FE, $01,$FD, $02,$FE, $01,$FD ;A5D547;
    db $02,$FE, $01,$FD, $02,$FD, $01,$FE, $02,$FD, $01,$FD, $01,$FD, $02,$FD ;A5D557;
    db $01,$FD, $01,$FD, $01,$FD, $01,$FD, $01,$FD, $01,$FD, $01,$FD, $01,$FE ;A5D567;
    db $00,$FD, $01,$FE, $01,$FD, $00,$FE, $01,$FD, $00,$FE, $00,$FE, $01,$FF ;A5D577;
    db $00,$FE, $00,$FF, $00,$FE, $FF,$FF, $00,$FF, $FF,$FF, $FF,$00, $FF,$00 ;A5D587;
    db $00,$01, $FF,$01, $FF,$01, $FE,$01, $FF,$01, $FF,$02, $FF,$02, $FF,$02 ;A5D597;
    db $FE,$02, $FF,$02, $FF,$02, $FF,$03, $FF,$03, $FE,$02, $FF,$03, $FF,$03 ;A5D5A7;
    db $00,$03, $FF,$03, $FF,$03, $00,$03, $FF,$03, $00,$03, $00,$03, $00,$03 ;A5D5B7;
    db $00,$03, $00,$03, $00,$03, $01,$03, $00,$03, $01,$03, $00,$03, $01,$02 ;A5D5C7;
    db $01,$03, $01,$02, $01,$02, $01,$03, $01,$02, $01,$01, $01,$02, $01,$02 ;A5D5D7;
    db $02,$01, $01,$01, $01,$01, $02,$01, $01,$01, $01,$00, $02,$00, $01,$00 ;A5D5E7;
    db $02,$00, $01,$FF, $02,$FF, $02,$FF, $01,$FF, $02,$FF, $01,$FE, $02,$FF ;A5D5F7;
    db $01,$FE, $02,$FE, $01,$FE, $02,$FE, $01,$FD, $01,$FE, $02,$FD, $01,$FE ;A5D607;
    db $01,$FD, $02,$FD, $01,$FD, $01,$FD, $01,$FD, $01,$FD, $01,$FD, $01,$FD ;A5D617;
    db $01,$FD, $00,$FD, $01,$FD, $01,$FC, $00,$FD, $00,$FD, $01,$FE, $00,$FD ;A5D627;
    db $00,$FD, $00,$FD, $FF,$FE, $00,$FD, $FF,$FE, $00,$FE, $FF,$FE, $FF,$FE ;A5D637;
    db $FF,$FE, $FE,$FE, $FF,$FF, $FE,$FF, $FE,$FF, $FE,$00, $FE,$FF, $FD,$00 ;A5D647;
    db $FD,$00, $FE,$00, $FD,$01, $FD,$01, $FE,$01, $FE,$01, $FE,$01, $FF,$01 ;A5D657;
    db $FF,$02, $00,$01, $01,$02, $01,$02, $02,$01, $02,$02, $02,$01, $03,$02 ;A5D667;
    db $02,$01, $03,$01, $03,$00, $02,$01, $03,$00, $02,$00, $02,$00, $03,$00 ;A5D677;
    db $02,$00, $02,$FF, $02,$00, $02,$FF, $02,$00, $03,$FF, $01,$00, $01,$00 ;A5D687;
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $02,$00, $01,$00 ;A5D697;
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00 ;A5D6A7;
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00 ;A5D6B7;
    db $01,$00, $01,$FF, $01,$00, $01,$00, $02,$00, $01,$00, $01,$00, $01,$00 ;A5D6C7;
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$FF, $01,$00, $01,$00, $01,$00 ;A5D6D7;
    db $01,$00, $01,$FF, $01,$00, $01,$00, $01,$00, $01,$00, $01,$FF, $01,$00 ;A5D6E7;
    db $01,$00, $01,$00, $01,$00, $01,$FF, $01,$00, $01,$00, $01,$FF, $01,$00 ;A5D6F7;
    db $01,$00, $01,$FF, $01,$00, $01,$00, $01,$FF, $01,$00, $01,$FF, $01,$00 ;A5D707;
    db $01,$00, $00,$FF, $01,$00, $01,$FF, $01,$00, $01,$FF, $01,$00, $01,$00 ;A5D717;
    db $01,$FF, $01,$FF, $01,$FF, $01,$00, $01,$FF, $01,$00, $01,$FF, $01,$FF ;A5D727;
    db $01,$FF, $01,$00, $01,$FF, $01,$00, $01,$FF, $01,$FF, $01,$00, $01,$FF ;A5D737;
    db $00,$FF, $01,$FF, $01,$00, $01,$FF, $01,$FF, $01,$FF, $01,$00, $01,$FF ;A5D747;
    db $01,$FF, $01,$FF, $01,$FF, $00,$FF, $01,$00, $01,$FF, $01,$FF, $01,$FF ;A5D757;
    db $01,$FF, $00,$FF, $01,$FF, $01,$FF, $00,$FF, $01,$FF, $01,$FF, $00,$FF ;A5D767;
    db $01,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF ;A5D777;
    db $00,$FF, $00,$FF, $00,$FF, $FF,$FF, $00,$FF, $FF,$FF, $FF,$FF, $00,$FF ;A5D787;
    db $FF,$00, $FF,$FF, $FF,$FF, $FF,$00, $FF,$FF, $FF,$00, $FF,$00, $FF,$00 ;A5D797;
    db $FF,$01, $FF,$00, $00,$01, $FF,$00, $FF,$01, $00,$01, $FF,$01, $FF,$01 ;A5D7A7;
    db $00,$01, $FF,$01, $00,$01, $FF,$01, $00,$02, $00,$01, $FF,$01, $00,$01 ;A5D7B7;
    db $00,$01, $00,$01, $FF,$02, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01 ;A5D7C7;
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $01,$01, $00,$01 ;A5D7D7;
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01 ;A5D7E7;
    db $01,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01 ;A5D7F7;
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$02, $00,$01 ;A5D807;
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01 ;A5D817;
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01 ;A5D827;
    db $FF,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01 ;A5D837;
    db $00,$02, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01 ;A5D847;
    db $00,$01, $00,$01, $00,$01, $00,$01, $FF,$01, $00,$01, $00,$01, $00,$01 ;A5D857;
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01 ;A5D867;
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01 ;A5D877;
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01 ;A5D887;
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01 ;A5D897;
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$02, $00,$01 ;A5D8A7;
    db $00,$01, $00,$01, $00,$01, $FF,$01, $00,$02, $00,$01, $00,$01, $FF,$01 ;A5D8B7;
    db $00,$01, $00,$01, $FF,$01, $00,$01, $FF,$00, $00,$01, $FF,$01, $FF,$00 ;A5D8C7;
    db $FF,$01, $FF,$00, $FE,$01, $FF,$00, $FF,$00, $FF,$00, $FF,$FF, $FF,$00 ;A5D8D7;
    db $FF,$00, $FF,$FF, $FE,$00, $FF,$FF, $FF,$00, $FF,$FF, $FF,$FF, $FF,$FF ;A5D8E7;
    db $00,$FF, $FF,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $01,$FF ;A5D8F7;
    db $00,$FF, $01,$FF, $00,$FF, $01,$FF, $01,$FF, $01,$FF, $00,$FF, $01,$00 ;A5D907;
    db $01,$FF, $01,$FF, $01,$00, $01,$FF, $01,$FF, $01,$00, $01,$00, $01,$FF ;A5D917;
    db $01,$00, $01,$00, $01,$00, $01,$FF, $02,$00, $01,$00, $01,$00, $01,$00 ;A5D927;
    db $01,$00, $01,$00, $01,$01, $01,$00, $01,$00, $01,$00, $01,$01, $01,$00 ;A5D937;
    db $01,$00, $01,$01, $01,$00, $01,$01, $01,$01, $01,$00, $01,$01, $01,$01 ;A5D947;
    db $01,$01, $01,$01, $01,$00, $00,$01, $01,$01, $01,$00, $01,$01, $00,$01 ;A5D957;
    db $01,$01, $01,$00, $01,$01, $01,$01, $01,$01, $01,$01, $01,$00, $01,$01 ;A5D967;
    db $00,$01, $01,$00, $01,$01, $01,$00, $01,$01, $01,$00, $01,$01, $01,$00 ;A5D977;
    db $01,$01, $01,$00, $00,$01, $01,$00, $01,$00, $01,$01, $01,$00, $01,$00 ;A5D987;
    db $01,$00, $01,$01, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00 ;A5D997;
    db $01,$01, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$FF, $01,$00 ;A5D9A7;
    db $02,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$FE, $00,$FF, $01,$FE ;A5D9B7;
    db $00,$FF, $01,$FE, $01,$FF, $00,$FE, $01,$FF, $00,$FE, $01,$FF, $00,$FE ;A5D9C7;
    db $01,$FF, $01,$FE, $00,$FF, $01,$FE, $00,$FF, $01,$FF, $00,$FE, $01,$FF ;A5D9D7;
    db $00,$FE, $01,$FF, $00,$FF, $01,$FE, $00,$FF, $01,$FF, $00,$FF, $00,$FF ;A5D9E7;
    db $01,$FE, $00,$FF, $01,$FF, $00,$FF, $00,$FF, $01,$FF, $00,$FF, $00,$FF ;A5D9F7;
    db $01,$FF, $00,$FF, $00,$FF, $00,$FF, $01,$FF, $00,$FF, $00,$FF, $00,$FF ;A5DA07;
    db $00,$FF, $00,$FF, $FF,$00, $FF,$00, $FF,$01, $FF,$00, $00,$01, $FF,$00 ;A5DA17;
    db $00,$01, $FF,$01, $FF,$01, $00,$01, $FF,$01, $00,$01, $FF,$00, $FF,$01 ;A5DA27;
    db $00,$01, $FF,$01, $00,$01, $FF,$01, $00,$01, $FF,$02, $00,$01, $FF,$01 ;A5DA37;
    db $00,$01, $FF,$01, $00,$01, $00,$02, $FF,$01, $00,$01, $00,$01, $00,$02 ;A5DA47;
    db $00,$01, $FF,$01, $00,$02, $00,$01, $00,$01, $00,$01, $00,$02, $00,$01 ;A5DA57;
    db $00,$01, $01,$01, $00,$02, $00,$01, $00,$01, $00,$01, $01,$01, $00,$01 ;A5DA67;
    db $00,$02, $01,$01, $00,$01, $01,$01, $00,$01, $01,$01, $00,$01, $01,$01 ;A5DA77;
    db $01,$01, $01,$01, $01,$01, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00 ;A5DA87;
    db $00,$FF, $01,$00, $01,$FF, $01,$00, $00,$FF, $01,$FF, $01,$00, $00,$FF ;A5DA97;
    db $01,$FF, $00,$FF, $01,$FF, $00,$FF, $01,$FF, $01,$FF, $00,$FF, $01,$FF ;A5DAA7;
    db $00,$FF, $01,$FF, $00,$FF, $01,$FE, $00,$FF, $00,$FF, $01,$FE, $00,$FF ;A5DAB7;
    db $01,$FF, $00,$FE, $00,$FF, $01,$FE, $00,$FF, $00,$FF, $00,$FE, $00,$FF ;A5DAC7;
    db $01,$FE, $00,$FF, $00,$FE, $00,$FF, $00,$FE, $00,$FF, $00,$FF, $00,$FE ;A5DAD7;
    db $00,$FF, $FF,$FF, $00,$FE, $00,$FF, $00,$FF, $FF,$FF, $00,$FF, $00,$FF ;A5DAE7;
    db $FF,$FF, $00,$FF, $FF,$FF, $FF,$FF, $FF,$00, $00,$FF, $FF,$00, $FF,$00 ;A5DAF7;
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$01, $FF,$01, $FF,$00, $FF,$01 ;A5DB07;
    db $FF,$01, $FF,$00, $FF,$01, $00,$01, $FF,$01, $00,$01, $00,$01, $01,$00 ;A5DB17;
    db $00,$01, $01,$00, $01,$01, $01,$00, $01,$00, $01,$01, $01,$00, $01,$00 ;A5DB27;
    db $01,$00, $02,$01, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00 ;A5DB37;
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$FF, $01,$00, $01,$00, $01,$FF ;A5DB47;
    db $01,$FF, $01,$00, $01,$FF, $01,$FF, $01,$FF, $01,$FF, $01,$FF, $01,$FF ;A5DB57;
    db $01,$FF, $01,$FF, $00,$FF, $01,$00, $01,$FF, $01,$00, $01,$00, $01,$01 ;A5DB67;
    db $00,$01, $01,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$02, $00,$01 ;A5DB77;
    db $00,$01, $00,$02, $00,$01, $00,$02, $00,$01, $00,$02, $00,$02, $00,$01 ;A5DB87;
    db $00,$02, $00,$01, $FF,$02, $00,$01, $00,$02, $00,$01, $00,$02, $FF,$01 ;A5DB97;
    db $00,$01, $00,$02, $00,$01, $FF,$01, $00,$01, $00,$02, $00,$01, $00,$01 ;A5DBA7;
    db $FF,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $FF,$01 ;A5DBB7;
    db $00,$01, $00,$01, $01,$01, $00,$01, $00,$01, $01,$00, $01,$00, $01,$00 ;A5DBC7;
    db $01,$00, $01,$FF, $01,$00, $00,$FF, $01,$00, $01,$FF, $01,$00, $00,$FF ;A5DBD7;
    db $01,$00, $01,$FF, $01,$FF, $01,$FF, $01,$FF, $01,$FF, $01,$FF, $01,$FF ;A5DBE7;
    db $00,$FF, $01,$FF, $01,$FF, $01,$FF, $01,$FE, $00,$FF, $01,$FF, $01,$FF ;A5DBF7;
    db $00,$FE, $01,$FF, $01,$FF, $00,$FE, $01,$FF, $00,$FF, $01,$FE, $00,$FF ;A5DC07;
    db $00,$FF, $01,$FE, $00,$FF, $01,$FE, $00,$FF, $00,$FF, $01,$FE, $00,$FF ;A5DC17;
    db $00,$FF, $00,$FF, $00,$FE, $01,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF ;A5DC27;
    db $00,$FF, $00,$FF, $01,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$01, $00,$01 ;A5DC37;
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $01,$01, $00,$01, $00,$01 ;A5DC47;
    db $00,$01, $00,$01, $00,$01, $00,$02, $01,$01, $00,$01, $00,$01, $00,$02 ;A5DC57;
    db $01,$01, $00,$01, $00,$01, $01,$02, $00,$01, $00,$01, $01,$01, $00,$01 ;A5DC67;
    db $01,$01, $01,$01, $00,$01, $01,$01, $01,$01, $01,$01, $00,$01, $01,$00 ;A5DC77;
    db $01,$01, $00,$01, $01,$00, $01,$01, $01,$01, $01,$01, $01,$01, $00,$01 ;A5DC87;
    db $01,$00, $00,$01, $01,$01, $00,$01, $01,$01, $00,$01, $01,$01, $00,$01 ;A5DC97;
    db $01,$01, $00,$01, $01,$01, $00,$01, $01,$00, $00,$01, $01,$01, $00,$01 ;A5DCA7;
    db $01,$00, $01,$01, $01,$01, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00 ;A5DCB7;
    db $01,$00, $01,$FF, $01,$00, $01,$00, $01,$FF, $01,$00, $01,$FF, $01,$00 ;A5DCC7;
    db $01,$FF, $01,$00, $01,$FF, $01,$FF, $01,$FF, $01,$FF, $01,$FF, $01,$FF ;A5DCD7;
    db $00,$FF, $01,$FF, $00,$FF, $01,$FF, $00,$FF, $00,$FF, $01,$FF, $00,$FF ;A5DCE7;
    db $00,$FF, $00,$FE, $01,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FE ;A5DCF7;
    db $00,$FF, $00,$FF, $00,$FF, $00,$FE, $00,$FF, $00,$FF, $00,$FF, $00,$FE ;A5DD07;
    db $FF,$FF, $00,$FF, $00,$FE, $00,$FF, $00,$FF, $FF,$FF, $00,$FE, $00,$FF ;A5DD17;
    db $00,$FF, $FF,$FF, $00,$FF, $00,$FF, $FF,$FF, $00,$FF, $FF,$FF, $00,$FF ;A5DD27;
    db $00,$FF, $FF,$FF, $00,$FF, $FF,$FF, $FF,$FF, $00,$FF, $FF,$00, $00,$FF ;A5DD37;
    db $FF,$00, $00,$FF, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $00,$01, $FF,$00 ;A5DD47;
    db $FF,$01, $FF,$01, $00,$01, $FF,$00, $00,$01, $FF,$01, $00,$01, $00,$01 ;A5DD57;
    db $FF,$01, $00,$01, $FF,$01, $00,$01, $FF,$01, $00,$01, $00,$01, $FF,$01 ;A5DD67;
    db $00,$01, $00,$02, $FF,$01, $00,$01, $00,$01, $00,$02, $00,$01, $FF,$01 ;A5DD77;
    db $00,$02, $00,$01, $00,$01, $00,$01, $00,$02, $00,$01, $00,$01, $00,$02 ;A5DD87;
    db $00,$01, $00,$01, $00,$01, $01,$01, $00,$02, $00,$01, $00,$01, $01,$01 ;A5DD97;
    db $00,$01, $01,$01, $00,$01, $00,$01, $01,$01, $00,$01, $01,$01, $00,$01 ;A5DDA7;
    db $01,$01, $01,$00, $00,$01, $01,$01, $80,$80, $80,$80, $80,$80, $80,$80 ;A5DDB7;


;;; $DDC7: Unused Draygon fight intro dance data ;;;
DraygonFightIntroDanceData_KeikoLove_EvirsAlreadyDeleted:
; This section is read even though the evirs are deleted at this point
; (deleted due to the 80,80 terminator, but the movement routine sets their position anyway)
    db $01,$FF, $02,$FE, $01,$FF, $02,$FE, $01,$FF, $01,$FE, $02,$FF, $01,$FE ;A5DDC7;
    db $02,$FF, $01,$FE, $01,$FF, $02,$FE, $01,$FE, $01,$FF, $02,$FE, $01,$FE ;A5DDD7;
    db $01,$FF, $02,$FE, $01,$FE, $01,$FE, $01,$FE, $02,$FF, $01,$FE, $01,$FE ;A5DDE7;
    db $01,$FD, $02,$FE, $01,$FE, $01,$FE, $01,$FE, $01,$FD, $01,$FE, $01,$FE ;A5DDF7;
    db $01,$FD, $01,$FD, $01,$FE, $01,$FD, $01,$FD, $01,$FE, $01,$FD, $01,$FD ;A5DE07;
    db $01,$FD, $00,$FE, $01,$FD, $01,$FE, $00,$FD, $00,$FE, $01,$FE, $00,$FE ;A5DE17;
    db $00,$FF, $00,$FE, $FF,$FF, $00,$FF, $FF,$FF, $FF,$00, $FF,$00, $FF,$01 ;A5DE27;
    db $FF,$01, $FF,$01, $FF,$01, $FE,$01, $FF,$02, $FF,$01, $FE,$02, $FF,$02 ;A5DE37;
    db $FE,$03, $FF,$02, $FE,$02, $FF,$03, $FE,$03, $FF,$03, $FE,$02, $FF,$03 ;A5DE47;
    db $FF,$03, $FF,$03, $FF,$04, $FF,$03, $FF,$03, $FF,$03, $FF,$03, $00,$03 ;A5DE57;
    db $00,$03, $FF,$03, $00,$03, $00,$03, $00,$03, $01,$03, $00,$03, $00,$02 ;A5DE67;
    db $01,$03, $01,$03, $00,$02, $01,$02, $01,$03, $01,$02, $01,$02, $01,$02 ;A5DE77;
    db $01,$02, $02,$01, $01,$02, $01,$01, $02,$01, $01,$01, $02,$01, $01,$01 ;A5DE87;
    db $02,$01, $01,$00, $02,$00, $02,$00, $01,$00, $02,$00, $02,$FF, $02,$00 ;A5DE97;
    db $01,$FF, $02,$FF, $02,$FF, $02,$FE, $01,$FF, $02,$FE, $02,$FF, $01,$FE ;A5DEA7;
    db $02,$FE, $01,$FE, $02,$FE, $01,$FD, $02,$FE, $01,$FE, $01,$FD, $01,$FD ;A5DEB7;
    db $01,$FE, $01,$FD, $01,$FD, $01,$FD, $01,$FD, $00,$FD, $01,$FD, $00,$FD ;A5DEC7;
    db $00,$FC, $01,$FD, $00,$FD, $FF,$FD, $00,$FD, $00,$FC, $00,$FD, $FF,$FD ;A5DED7;
    db $00,$FD, $FF,$FD, $FF,$FD, $FF,$FD, $00,$FE, $FF,$FD, $FF,$FE, $FF,$FD ;A5DEE7;
    db $FE,$FE, $FF,$FE, $FF,$FE, $FF,$FF, $FE,$FE, $FF,$FF, $FF,$FF, $FE,$00 ;A5DEF7;
    db $FF,$FF, $FE,$00, $FF,$00, $FE,$01, $FF,$01, $FF,$01, $FE,$01, $FF,$01 ;A5DF07;
    db $FE,$02, $FF,$02, $FF,$02, $FE,$02, $FF,$03, $FF,$02, $00,$03, $FF,$02 ;A5DF17;
    db $FF,$02, $00,$03, $00,$02, $00,$02, $00,$03, $00,$02, $01,$02, $01,$02 ;A5DF27;
    db $01,$02, $00,$02, $02,$02, $01,$01, $01,$02, $01,$02, $02,$02, $02,$01 ;A5DF37;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_DraygonFightIntroDanceData_KeikoLove_A5DF47:
    db $01,$02, $02,$02, $02,$01, $01,$02, $02,$02, $02,$01, $02,$02, $02,$01 ;A5DF47;
    db $02,$02, $02,$02, $02,$01, $02,$02, $01,$02, $02,$01, $02,$02, $02,$02 ;A5DF57;
    db $01,$01, $02,$02, $01,$02, $02,$02, $01,$02, $02,$01, $01,$02, $02,$02 ;A5DF67;
    db $01,$02, $02,$01, $01,$02, $02,$02, $01,$01, $02,$01, $02,$02, $02,$01 ;A5DF77;
    db $01,$01, $02,$01, $02,$01, $02,$01, $03,$01, $02,$00, $02,$01, $00,$FF ;A5DF87;
    db $00,$FE, $00,$FF, $01,$FF, $00,$FF, $00,$FE, $00,$FF, $00,$FF, $01,$FE ;A5DF97;
    db $00,$FF, $00,$FF, $00,$FE, $00,$FF, $01,$FF, $00,$FE, $00,$FF, $00,$FF ;A5DFA7;
    db $01,$FE, $00,$FF, $00,$FE, $01,$FF, $00,$FF, $00,$FE, $01,$FF, $00,$FE ;A5DFB7;
    db $00,$FF, $01,$FE, $00,$FF, $01,$FE, $00,$FF, $01,$FE, $00,$FF, $01,$FE ;A5DFC7;
    db $01,$FE, $00,$FF, $01,$FE, $00,$FF, $01,$FE, $01,$FE, $01,$FE, $01,$FF ;A5DFD7;
    db $00,$FE, $01,$FE, $01,$FE, $01,$FF, $01,$FE, $01,$FE, $01,$FE, $01,$FE ;A5DFE7;
    db $01,$FE, $01,$FE, $01,$FF, $02,$FE, $01,$FF, $01,$FF, $01,$FF, $01,$FF ;A5DFF7;
    db $01,$00, $01,$00, $01,$01, $01,$01, $00,$01, $01,$02, $00,$01, $00,$02 ;A5E007;
    db $01,$02, $00,$02, $00,$02, $00,$02, $00,$02, $00,$01, $00,$02, $00,$02 ;A5E017;
    db $00,$01, $00,$02, $FF,$02, $00,$01, $00,$02, $00,$01, $FF,$02, $00,$01 ;A5E027;
    db $00,$02, $00,$01, $FF,$01, $00,$02, $00,$01, $FF,$02, $00,$01, $00,$01 ;A5E037;
    db $FF,$02, $00,$01, $00,$02, $00,$01, $00,$02, $00,$01, $00,$02, $00,$01 ;A5E047;
    db $00,$02, $00,$02, $00,$01, $00,$02, $00,$02, $01,$02, $00,$02, $01,$02 ;A5E057;
    db $00,$01, $01,$02, $00,$02, $01,$02, $01,$01, $00,$02, $01,$01, $01,$02 ;A5E067;
    db $01,$01, $00,$01, $01,$01, $01,$01, $01,$00, $01,$01, $01,$00, $01,$00 ;A5E077;
    db $01,$00, $01,$FF, $01,$FF, $01,$00, $01,$FF, $01,$FE, $00,$FF, $01,$FF ;A5E087;
    db $01,$FE, $01,$FF, $01,$FE, $00,$FE, $01,$FE, $01,$FE, $01,$FE, $00,$FE ;A5E097;
    db $01,$FD, $00,$FE, $01,$FE, $01,$FD, $00,$FE, $01,$FD, $00,$FE, $00,$FE ;A5E0A7;
    db $01,$FD, $00,$FE, $01,$FD, $00,$FE, $00,$FD, $01,$FE, $00,$FE, $00,$FD ;A5E0B7;
    db $00,$FE, $01,$FE, $00,$FE, $00,$FE, $00,$FE, $01,$FE, $00,$FE, $00,$FF ;A5E0C7;
    db $00,$FE, $00,$FF, $01,$FF, $00,$FF, $00,$FF, $00,$FF, $01,$FF, $00,$FF ;A5E0D7;
    db $01,$00, $00,$01, $01,$00, $00,$01, $00,$01, $01,$01, $00,$01, $01,$02 ;A5E0E7;
    db $00,$01, $01,$02, $00,$01, $00,$02, $01,$02, $00,$02, $00,$01, $01,$02 ;A5E0F7;
    db $00,$02, $00,$01, $01,$02, $00,$02, $00,$01, $00,$02, $00,$01, $00,$02 ;A5E107;
    db $01,$01, $00,$02, $00,$01, $00,$02, $00,$01, $00,$02, $00,$01, $01,$02 ;A5E117;
    db $00,$01, $00,$02, $00,$01, $00,$02, $01,$01, $00,$02, $00,$01, $01,$02 ;A5E127;
    db $00,$01, $00,$02, $01,$01, $00,$02, $01,$01, $00,$02, $01,$01, $01,$02 ;A5E137;
    db $00,$01, $01,$01, $01,$02, $01,$01, $01,$01, $01,$01, $01,$01, $01,$01 ;A5E147;
    db $02,$01, $01,$01, $01,$01, $01,$01, $02,$00, $01,$01, $02,$01, $01,$01 ;A5E157;
    db $02,$00, $02,$00, $02,$00, $01,$00, $02,$00, $02,$00, $01,$00, $02,$00 ;A5E167;
    db $02,$00, $02,$00, $01,$00, $02,$00, $01,$00, $02,$00, $02,$00, $01,$FF ;A5E177;
    db $02,$00, $01,$00, $02,$FF, $01,$00, $02,$FF, $01,$00, $01,$FF, $02,$FF ;A5E187;
    db $01,$FF, $01,$FF, $01,$FF, $01,$FF, $01,$FF, $02,$FF, $01,$FF, $01,$FF ;A5E197;
    db $01,$FF, $01,$FE, $01,$FF, $01,$FF, $00,$FE, $01,$FF, $01,$FE, $01,$FF ;A5E1A7;
    db $01,$FE, $01,$FF, $01,$FE, $01,$FF, $01,$FE, $00,$FF, $01,$FE, $01,$FF ;A5E1B7;
    db $01,$FE, $01,$FF, $01,$FE, $01,$FF, $01,$FE, $00,$FF, $01,$FE, $01,$FF ;A5E1C7;
    db $01,$FE, $01,$FF, $00,$FE, $01,$FF, $01,$FE, $00,$FF, $01,$FE, $00,$FF ;A5E1D7;
    db $01,$FE, $00,$FF, $00,$FE, $01,$FF, $00,$FE, $00,$FE, $00,$FF, $00,$FE ;A5E1E7;
    db $00,$FF, $00,$FE, $FF,$FE, $00,$FF, $00,$FE, $FF,$FE, $00,$FE, $FF,$FF ;A5E1F7;
    db $FF,$FE, $FF,$FE, $FF,$FF, $FF,$FE, $FF,$FE, $FF,$FF, $FF,$FE, $FF,$FF ;A5E207;
    db $FF,$FF, $FF,$FE, $FE,$FF, $FF,$FF, $FF,$FF, $FE,$FF, $FF,$00, $FF,$FF ;A5E217;
    db $FE,$FF, $FF,$00, $FF,$00, $FE,$00, $FF,$00, $FF,$01, $FF,$00, $FE,$01 ;A5E227;
    db $FF,$00, $FF,$01, $FF,$01, $FF,$01, $FE,$01, $FF,$02, $FF,$01, $FF,$02 ;A5E237;
    db $FF,$01, $FF,$02, $FF,$01, $FF,$02, $00,$02, $FF,$01, $FF,$02, $FF,$02 ;A5E247;
    db $00,$02, $FF,$02, $FF,$02, $00,$01, $FF,$02, $00,$02, $00,$02, $FF,$01 ;A5E257;
    db $00,$02, $00,$02, $00,$01, $00,$02, $00,$02, $00,$01, $00,$02, $00,$01 ;A5E267;
    db $00,$02, $00,$02, $00,$01, $00,$02, $01,$01, $00,$02, $00,$01, $01,$02 ;A5E277;
    db $00,$02, $01,$01, $00,$02, $01,$01, $00,$02, $01,$01, $00,$02, $01,$01 ;A5E287;
    db $00,$02, $01,$01, $01,$02, $00,$02, $01,$01, $01,$02, $01,$01, $00,$02 ;A5E297;
    db $01,$01, $01,$02, $01,$01, $01,$02, $01,$01, $01,$01, $01,$02, $01,$01 ;A5E2A7;
    db $01,$01, $01,$01, $01,$01, $01,$01, $01,$01, $02,$01, $01,$01, $01,$01 ;A5E2B7;
    db $01,$01, $02,$00, $01,$01, $02,$01, $01,$00, $02,$01, $01,$00, $02,$00 ;A5E2C7;
    db $01,$01, $02,$00, $01,$00, $02,$00, $02,$00, $01,$00, $02,$00, $02,$00 ;A5E2D7;
    db $02,$00, $01,$00, $02,$00, $02,$00, $01,$00, $02,$00, $02,$00, $01,$FF ;A5E2E7;
    db $02,$00, $02,$00, $02,$00, $01,$00, $02,$00, $02,$FF, $01,$00, $02,$00 ;A5E2F7;
    db $01,$00, $02,$00, $02,$FF, $01,$00, $02,$00, $02,$00, $01,$00, $02,$00 ;A5E307;
    db $01,$FF, $02,$00, $01,$00, $02,$00, $02,$00, $01,$00, $02,$00, $01,$FF ;A5E317;
    db $02,$00, $02,$00, $01,$00, $02,$00, $01,$00, $02,$00, $02,$00, $01,$00 ;A5E327;
    db $02,$00, $01,$00, $02,$00, $02,$00, $01,$00, $02,$00, $01,$00, $02,$00 ;A5E337;
    db $02,$00, $01,$00, $02,$00, $02,$00, $01,$00, $02,$00, $01,$00, $02,$00 ;A5E347;
    db $02,$00                                                           ;A5E357;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $E359: Palette - enemy $DF3F/$DF7F (Spore Spawn) ;;;
Palette_SporeSpawn:
; Sprite palette 7. Spores
    dw $0000,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166                   ;A5E359;
    dw $0924,$57FF,$3AB5,$1DCE,$00E7,$03FF,$0216,$00B0                   ;A5E369;


;;; $E379: Spore Spawn health-based palettes ;;;
; Sprite palette 1. Spore Spawn and spore spawner
Palette_SporeSpawn_HealthBased_0:                                        ;A5E379;
    dw $0000,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166,$0924,$57FF,$3AB5,$1DCE,$00E7,$03FF,$0216,$00B0 ; Health >= 770
Palette_SporeSpawn_HealthBased_1:                                        ;A5E399;
    dw $3800,$2A92,$21CC,$00C4,$0062,$260E,$15AA,$0D27,$04E5,$475A,$2E52,$198C,$00C6,$033F,$01B6,$008F ; Health < 770
Palette_SporeSpawn_HealthBased_2:                                        ;A5E3B9;
    dw $3800,$15EF,$156B,$00A5,$0063,$15AC,$0D49,$0907,$04C6,$36D6,$21D0,$114B,$00A6,$025F,$0137,$008D ; Health < 410
Palette_SporeSpawn_HealthBased_3:                                        ;A5E3D9;
    dw $3800,$094A,$0908,$0463,$0000,$0929,$04C6,$04A5,$0484,$2631,$156D,$0D09,$0085,$019F,$00D7,$006C ; Health < 70


;;; $E3F9: Spore Spawn death sequence palettes ;;;
; Sprite palette 1. Spore Spawn and spore spawner
Palette_SporeSpawn_DeathSequence_0:
    dw $3800,$094A,$0908,$0463,$0000,$0929,$04C6,$04A5                   ;A5E3F9;
    dw $0484,$2631,$156D,$0D09,$0085,$019F,$00D7,$006C                   ;A5E409;

Palette_SporeSpawn_DeathSequence_1:
    dw $3800,$118C,$0D2A,$0464,$0000,$0D4B,$08E8,$04A6                   ;A5E419;
    dw $0485,$2A53,$156E,$0D09,$0065,$09DF,$04F6,$006C                   ;A5E429;

Palette_SporeSpawn_DeathSequence_2:
    dw $3800,$15AF,$114B,$0465,$0001,$156D,$0D09,$08C7                   ;A5E439;
    dw $04A6,$2A74,$158E,$08EA,$0065,$11FE,$0916,$008C                   ;A5E449;

Palette_SporeSpawn_DeathSequence_3:
    dw $3800,$1DF1,$156D,$0466,$0001,$198F,$112B,$08C8                   ;A5E459;
    dw $04A7,$2E96,$158F,$08EA,$0045,$1A3E,$0D35,$008C                   ;A5E469;

Palette_SporeSpawn_DeathSequence_4:
    dw $3800,$2213,$1D8F,$0086,$0001,$21D0,$114D,$08EA                   ;A5E479;
    dw $04A8,$2E97,$1990,$04EA,$0044,$1E5D,$0D54,$00AB                   ;A5E489;

Palette_SporeSpawn_DeathSequence_5:
    dw $3800,$2A55,$21B1,$0087,$0001,$25F2,$156F,$08EB                   ;A5E499;
    dw $04A9,$32B9,$1991,$04EA,$0024,$269D,$1173,$00AB                   ;A5E4A9;

Palette_SporeSpawn_DeathSequence_6:
    dw $3800,$2E78,$25D2,$0088,$0002,$2E14,$1990,$0D0C                   ;A5E4B9;
    dw $04CA,$32DA,$19B1,$00CB,$0024,$2EBC,$1593,$00CB                   ;A5E4C9;

Palette_SporeSpawn_DeathSequence_7:
    dw $3800,$36BA,$29F4,$0089,$0002,$3236,$1DB2,$0D0D                   ;A5E4D9;
    dw $04CB,$36FC,$19B2,$00CB,$0004,$36FC,$19B2,$00CB                   ;A5E4E9;

; BG1/2 palette 4. Level graphics (green)
Palette_SporeSpawn_DeathSequence_Level_0:
    dw $2003,$6318,$6318,$1CE1,$1DA9,$2923,$24A1,$1400                   ;A5E4F9;
    dw $2269,$21C9,$1544,$0420,$268B,$04C5,$2731,$0000                   ;A5E509;

Palette_SporeSpawn_DeathSequence_Level_1:
    dw $2003,$6318,$6318,$18C3,$1DAA,$2524,$1CA3,$1000                   ;A5E519;
    dw $1E2A,$1D8A,$1145,$0000,$2A8D,$0CE7,$22F1,$0001                   ;A5E529;

Palette_SporeSpawn_DeathSequence_Level_2:
    dw $0000,$6318,$6318,$14C4,$1DAC,$2126,$18A4,$0C00                   ;A5E539;
    dw $19EA,$196A,$1147,$0001,$2A6F,$112A,$22B1,$0001                   ;A5E549;

Palette_SporeSpawn_DeathSequence_Level_3:
    dw $0000,$6318,$6318,$0CA5,$19AD,$1908,$1085,$0400                   ;A5E559;
    dw $118A,$114A,$0D29,$0001,$2E70,$194C,$1E72,$0002                   ;A5E569;

Palette_SporeSpawn_DeathSequence_Level_4:
    dw $0000,$6318,$6318,$08A6,$19AF,$150A,$0C86,$0000                   ;A5E579;
    dw $0D4A,$0D2A,$0D2B,$0002,$2E52,$1D8F,$1E32,$0002                   ;A5E589;

Palette_SporeSpawn_DeathSequence_Level_5:
    dw $0000,$6318,$6318,$0488,$19B0,$110B,$0488,$0001                   ;A5E599;
    dw $090B,$08EB,$092C,$0003,$3254,$25B1,$19F2,$0002                   ;A5E5A9;

Palette_SporeSpawn_DeathSequence_Level_6:
    dw $0000,$6318,$6318,$0089,$19B2,$0D0D,$0089,$0002                   ;A5E5B9;
    dw $04CB,$04CB,$092E,$0004,$3236,$29F4,$19B2,$0002                   ;A5E5C9;

; BG1/2 palette 7. Background graphics (blue)
Palette_SporeSpawn_DeathSequence_Background_0:
    dw $3800,$5544,$3C84,$1441,$24E3,$18A2,$1081,$0C40                   ;A5E5D9;
    dw $129C,$11B5,$14EE,$1066,$7FFF,$7FFF,$16BD,$0800                   ;A5E5E9;

Palette_SporeSpawn_DeathSequence_Background_1:
    dw $3800,$4947,$3486,$1063,$2105,$18C4,$1083,$0C21                   ;A5E5F9;
    dw $1239,$1194,$110E,$1065,$7FFF,$7FFF,$167B,$0401                   ;A5E609;

Palette_SporeSpawn_DeathSequence_Background_2:
    dw $3800,$4169,$2CA7,$0C64,$2128,$14C6,$0C84,$0821                   ;A5E619;
    dw $0DF6,$0D72,$110E,$0C45,$7FFF,$7FFF,$1659,$0401                   ;A5E629;

Palette_SporeSpawn_DeathSequence_Background_3:
    dw $3800,$356B,$24C9,$0C65,$1D4A,$14E7,$0885,$0821                   ;A5E639;
    dw $0DB4,$0D30,$0D0E,$0845,$7FFF,$7FFF,$1A38,$0401                   ;A5E649;

Palette_SporeSpawn_DeathSequence_Background_4:
    dw $3800,$2D8D,$1CEA,$0866,$1D6D,$10E9,$0486,$0421                   ;A5E659;
    dw $0971,$090E,$0D0E,$0425,$7FFF,$7FFF,$1A16,$0401                   ;A5E669;

Palette_SporeSpawn_DeathSequence_Background_5:
    dw $3800,$2190,$14EC,$0488,$198F,$110B,$0488,$0402                   ;A5E679;
    dw $090E,$08ED,$092E,$0424,$7FFF,$7FFF,$19D4,$0002                   ;A5E689;

Palette_SporeSpawn_DeathSequence_Background_6:
    dw $3800,$19B2,$0D0D,$0089,$19B2,$0D0D,$0089,$0002                   ;A5E699;
    dw $04CB,$04CB,$092E,$0004,$7FFF,$7FFF,$19B2,$0002                   ;A5E6A9;


;;; $E6B9: Instruction list - initial - Spore Spawn is dead ;;;
InstList_SporeSpawn_Initial_Dead:
    dw Instruction_SporeSpawn_LoadDeathSequenceTargetPalette,$00C0       ;A5E6B9;
    dw Instruction_SporeSpawn_FunctionInY                                ;A5E6BD;
    dw RTS_A5EB1A                                                        ;A5E6BF;
    dw $0001,ExtendedSpritemap_SporeSpawn_Dead                           ;A5E6C1;
    dw Instruction_Common_Sleep                                          ;A5E6C5;


;;; $E6C7: Instruction list - initial - Spore Spawn is alive ;;;
InstList_SporeSpawn_Initial_Alive:
    dw $0100,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_0       ;A5E6C7;
    dw Instruction_SporeSpawn_FunctionInY                                ;A5E6CB;
    dw Function_SporeSpawn_Descent                                       ;A5E6CD;
    dw $0001,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_0       ;A5E6CF;
    dw Instruction_Common_Sleep                                          ;A5E6D3;


;;; $E6D5: Instruction list - fight has started ;;;
InstList_SporeSpawn_FightHasStarted:
    dw Instruction_SporeSpawn_SetMaxXRadiusAndAngleDelta,$0040,$0001     ;A5E6D5;
    dw Instruction_SporeSpawn_FunctionInY                                ;A5E6D7;
    dw Function_SporeSpawn_Moving                                        ;A5E6DD;
    dw $0300,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_0       ;A5E6DF;


;;; $E6E3: Instruction list - open and stop ;;;
InstList_SporeSpawn_OpenAndStop_0:
    dw Instruction_SporeSpawn_SporeGenerationFlagInY,$0001               ;A5E6E3;
if !PAL == 0
    dw Instruction_SporeSpawn_QueueSFXInY_Lib2_Max6,$002C                ;A5E6E7;
    dw $0001,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_0       ;A5E6E9;
else
    dw $0001,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_0
    dw Instruction_SporeSpawn_QueueSFXInY_Lib2_Max6,$002C
endif
    dw $0008,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_1       ;A5E6EF;
    dw $0008,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_2       ;A5E6F3;
    dw $0008,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_3       ;A5E6F7;
    dw $0007,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_4       ;A5E6FB;
    dw $0007,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_5       ;A5E6FF;
    dw $0006,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_6       ;A5E703;
    dw $0001,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_7       ;A5E707;
    dw Instruction_SporeSpawn_ClearDamagedFlag                           ;A5E70B;
    dw Instruction_SporeSpawn_FunctionInY                                ;A5E70D;
    dw RTS_A5EB1A                                                        ;A5E70F;
    dw Instruction_Common_TimerInY,$0005                                 ;A5E711;

InstList_SporeSpawn_OpenAndStop_1:
    dw $0008,ExtendedSpritemap_SporeSpawn_FullyOpen_0                    ;A5E715;
    dw $0008,ExtendedSpritemap_SporeSpawn_FullyOpen_1                    ;A5E719;
    dw $0008,ExtendedSpritemap_SporeSpawn_FullyOpen_2                    ;A5E71D;
    dw $0008,ExtendedSpritemap_SporeSpawn_FullyOpen_1                    ;A5E721;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;A5E725;
    dw InstList_SporeSpawn_OpenAndStop_1                                 ;A5E727;


;;; $E729: Instruction list - close and move ;;;
InstList_SporeSpawn_CloseAndMove:
    dw $0008,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_6       ;A5E729;
    dw $0008,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_5       ;A5E72D;
    dw $0008,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_4       ;A5E731;
    dw $0008,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_3       ;A5E735;
    dw $0008,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_2       ;A5E739;
    dw $0008,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_1       ;A5E73D;
    dw $0001,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_0       ;A5E741;
    dw Instruction_SporeSpawn_FunctionInY                                ;A5E745;
    dw Function_SporeSpawn_Moving                                        ;A5E747;
    dw Instruction_SporeSpawn_SporeGenerationFlagInY,$0000               ;A5E749;
    dw Instruction_SporeSpawn_IncreaseMaxXRadius                         ;A5E74D;
    dw $0200,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_0       ;A5E74F;
    dw Instruction_SporeSpawn_SporeGenerationFlagInY,$0001               ;A5E753;
    dw $00D0,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_0       ;A5E755;
    dw Instruction_Common_GotoY                                          ;A5E75B;
    dw InstList_SporeSpawn_OpenAndStop_0                                 ;A5E75D;


;;; $E75F: Instruction - increase Spore Spawn max X radius ;;;
Instruction_SporeSpawn_IncreaseMaxXRadius:
; This function has no effect, Spore Spawn max X radius is always 30h or 40h
    LDA.L SporeSpawn.maxXRadius                                          ;A5E75F;
    CLC                                                                  ;A5E763;
    ADC.W #$0008                                                         ;A5E764;
    CMP.W #$0030                                                         ;A5E767;
    BPL .return                                                          ;A5E76A;
    STA.L SporeSpawn.maxXRadius                                          ;A5E76C;

  .return:
    RTL                                                                  ;A5E770;


;;; $E771: Instruction - clear Spore Spawn damaged flag ;;;
Instruction_SporeSpawn_ClearDamagedFlag:
    PHX                                                                  ;A5E771;
    PHY                                                                  ;A5E772;
    LDA.W #$0000                                                         ;A5E773;
    STA.L SporeSpawn.damagedFlag                                         ;A5E776;
    PLY                                                                  ;A5E77A;
    PLX                                                                  ;A5E77B;
    RTL                                                                  ;A5E77C;


;;; $E77D: Instruction list - death sequence ;;;
InstList_SporeSpawn_DeathSequence_0:
if !PAL == 0
    dw Instruction_SporeSpawn_FunctionInY                                ;A5E77D;
    dw Function_SporeSpawn_SetupDeath                                    ;A5E77F;
    dw $0001,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_6       ;A5E781;
    dw Instruction_SporeSpawn_FunctionInY                                ;A5E785;
    dw Function_SporeSpawn_Dying                                         ;A5E787;
else
    dw $0001,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_6       ;A5E781;
endif
    dw Instruction_Common_TimerInY,$000A                                 ;A5E789;

InstList_SporeSpawn_DeathSequence_1:
if !PAL == 0
    dw $0001,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_6       ;A5E78D;
    dw Instruction_SporeSpawn_SpawnDyingExplosion                        ;A5E791;
    dw Instruction_Common_WaitYFrames,$0008                              ;A5E793;
else
    dw $0008,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_6
    dw Instruction_SporeSpawn_SpawnDyingExplosion
endif
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;A5E797;
    dw InstList_SporeSpawn_DeathSequence_1                               ;A5E799;
    dw $0008,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_6       ;A5E79B;
    dw $0008,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_5       ;A5E79F;
    dw $0008,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_4       ;A5E7A3;
    dw $0008,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_3       ;A5E7A7;
    dw $0008,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_2       ;A5E7AB;
    dw $0008,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_1       ;A5E7AF;
    dw $0001,ExtendedSpritemap_SporeSpawn_Dead                           ;A5E7B3;
    dw Instruction_SporeSpawn_Harden                                     ;A5E7B7;
    dw Instruction_Common_TimerInY,$000A                                 ;A5E7B9;

InstList_SporeSpawn_DeathSequence_2:
    dw Instruction_SporeSpawn_SpawnHardeningDustCloud                    ;A5E7BD;
    dw Instruction_Common_WaitYFrames,$0008                              ;A5E7BF;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;A5E7C3;
    dw InstList_SporeSpawn_DeathSequence_2                               ;A5E7C5;
    dw Instruction_SporeSpawn_LoadDeathSequencePalette,$0000             ;A5E7C7;
    dw Instruction_SporeSpawn_SpawnHardeningDustCloud                    ;A5E7CB;
    dw $0010,ExtendedSpritemap_SporeSpawn_Dead                           ;A5E7CD;
    dw Instruction_SporeSpawn_LoadDeathSequencePalette,$0020             ;A5E7D1;
    dw Instruction_SporeSpawn_SpawnHardeningDustCloud                    ;A5E7D5;
    dw $0010,ExtendedSpritemap_SporeSpawn_Dead                           ;A5E7D7;
    dw Instruction_SporeSpawn_LoadDeathSequencePalette,$0040             ;A5E7DB;
    dw Instruction_SporeSpawn_SpawnHardeningDustCloud                    ;A5E7DF;
    dw $0010,ExtendedSpritemap_SporeSpawn_Dead                           ;A5E7E1;
    dw Instruction_SporeSpawn_LoadDeathSequencePalette,$0060             ;A5E7E5;
    dw Instruction_SporeSpawn_SpawnHardeningDustCloud                    ;A5E7E9;
    dw $0010,ExtendedSpritemap_SporeSpawn_Dead                           ;A5E7EB;
    dw Instruction_SporeSpawn_LoadDeathSequencePalette,$0080             ;A5E7EF;
    dw Instruction_SporeSpawn_SpawnHardeningDustCloud                    ;A5E7F3;
    dw $0010,ExtendedSpritemap_SporeSpawn_Dead                           ;A5E7F5;
    dw Instruction_SporeSpawn_LoadDeathSequencePalette,$00A0             ;A5E7F9;
    dw Instruction_SporeSpawn_SpawnHardeningDustCloud                    ;A5E7FD;
    dw $0010,ExtendedSpritemap_SporeSpawn_Dead                           ;A5E7FF;
    dw Instruction_SporeSpawn_LoadDeathSequencePalette,$00C0             ;A5E803;
    dw Instruction_SporeSpawn_SpawnHardeningDustCloud                    ;A5E807;
    dw $0010,ExtendedSpritemap_SporeSpawn_Dead                           ;A5E809;
    dw Instruction_SporeSpawn_CallSporeSpawnDeathItemDropRoutine         ;A5E80D;
    dw Instruction_Common_Sleep                                          ;A5E80F;


if !FEATURE_KEEP_UNREFERENCED
;;; $E811: Unused. Instruction - Spore Spawn max X radius = [[Y]], angle delta = [[Y] + 2], angle = [[Y] + 4] ;;;
UNUSED_Instruction_SporeSpawn_SetMaxXRadiusAndAngles_A5E811:
    LDA.W $0000,Y                                                        ;A5E811;
    STA.L SporeSpawn.maxXRadius                                          ;A5E814;
    LDA.W $0002,Y                                                        ;A5E818;
    STA.L SporeSpawn.angleDelta                                          ;A5E81B;
    LDA.W $0004,Y                                                        ;A5E81F;
    STA.L SporeSpawn.angle                                               ;A5E822;
    TYA                                                                  ;A5E826;
    CLC                                                                  ;A5E827;
    ADC.W #$0006                                                         ;A5E828;
    TAY                                                                  ;A5E82B;
    RTL                                                                  ;A5E82C;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $E82D: Instruction - Spore Spawn max X radius = [[Y]], angle delta = [[Y] + 2] ;;;
Instruction_SporeSpawn_SetMaxXRadiusAndAngleDelta:
    LDA.W $0000,Y                                                        ;A5E82D;
    STA.L SporeSpawn.maxXRadius                                          ;A5E830;
    LDA.W $0002,Y                                                        ;A5E834;
    STA.L SporeSpawn.angleDelta                                          ;A5E837;
    INY                                                                  ;A5E83B;
    INY                                                                  ;A5E83C;
    INY                                                                  ;A5E83D;
    INY                                                                  ;A5E83E;
    RTL                                                                  ;A5E83F;


if !FEATURE_KEEP_UNREFERENCED
;;; $E840: Unused. Instruction - Spore Spawn max X radius = [[Y]] ;;;
UNUSED_Instruction_SporeSpawn_MaxXRadiusInY_A5E840:
    LDA.W $0000,Y                                                        ;A5E840;
    STA.L SporeSpawn.maxXRadius                                          ;A5E843;
    INY                                                                  ;A5E847;
    INY                                                                  ;A5E848;
    RTL                                                                  ;A5E849;


;;; $E84A: Unused. Instruction - Spore Spawn angle delta = [[Y]] ;;;
UNUSED_Instruction_SporeSpawn_AngleDeltaInY_A5E84A:
    LDA.W $0000,Y                                                        ;A5E84A;
    STA.L SporeSpawn.angleDelta                                          ;A5E84D;
    INY                                                                  ;A5E851;
    INY                                                                  ;A5E852;
    RTL                                                                  ;A5E853;


;;; $E854: Unused. Instruction - Spore Spawn max X radius += [[Y]] ;;;
UNUSED_Instruction_SporeSpawn_MaxXRadiusPlusY_A5E854:
    LDA.L SporeSpawn.maxXRadius                                          ;A5E854;
    CLC                                                                  ;A5E858;
    ADC.W $0000,Y                                                        ;A5E859;
    STA.L SporeSpawn.maxXRadius                                          ;A5E85C;
    INY                                                                  ;A5E860;
    INY                                                                  ;A5E861;
    RTL                                                                  ;A5E862;


;;; $E863: Unused. Instruction - Spore Spawn angle delta += [[Y]] ;;;
UNUSED_Instruction_SporeSpawn_AngleDeltaPlusY_A5E863:
    LDA.L SporeSpawn.angleDelta                                          ;A5E863;
    CLC                                                                  ;A5E867;
    ADC.W $0000,Y                                                        ;A5E868;
    STA.L SporeSpawn.angleDelta                                          ;A5E86B;
    INY                                                                  ;A5E86F;
    INY                                                                  ;A5E870;
    RTL                                                                  ;A5E871;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $E872: Instruction - spore generation flag = [[Y]] ;;;
Instruction_SporeSpawn_SporeGenerationFlagInY:
    LDA.W $0000,Y                                                        ;A5E872;
    STA.L SporeSpawn.sporeGenerationFlag                                 ;A5E875;
    INY                                                                  ;A5E879;
    INY                                                                  ;A5E87A;
    RTL                                                                  ;A5E87B;


;;; $E87C: Instruction - Spore Spawn harden ;;;
Instruction_SporeSpawn_Harden:
    LDA.W #$0080                                                         ;A5E87C;
    STA.W Enemy.XPosition                                                ;A5E87F;
    LDA.W #$0270                                                         ;A5E882;
    STA.W Enemy.YPosition                                                ;A5E885;
    LDA.W Enemy.properties                                               ;A5E888;
    ORA.W #$A000                                                         ;A5E88B;
    AND.W #$FBFF                                                         ;A5E88E;
    STA.W Enemy.properties                                               ;A5E891;
    RTL                                                                  ;A5E894;


;;; $E895: Instruction - queue sound [[Y]], sound library 2, max queued sounds allowed = 6 ;;;
Instruction_SporeSpawn_QueueSFXInY_Lib2_Max6:
    PHX                                                                  ;A5E895;
    PHY                                                                  ;A5E896;
if !PAL != 0
    LDA.W Enemy.health
    BEQ +
endif
    LDA.W $0000,Y                                                        ;A5E897;
    JSL.L regional(QueueSound_Lib2_Max6, QueueSound_Lib2_Max1)           ;A5E89A;
    
+   PLY                                                                  ;A5E89E;
    PLX                                                                  ;A5E89F;
    INY                                                                  ;A5E8A0;
    INY                                                                  ;A5E8A1;
    RTL                                                                  ;A5E8A2;


;;; $E8A3: Unused. Instruction - queue sound [[Y]], sound library 3, max queued sounds allowed = 6 ;;;
Instruction_SporeSpawn_QueueSFXInY_Lib3_Max6:
    PHX                                                                  ;A5E8A3;
    PHY                                                                  ;A5E8A4;
    LDA.W $0000,Y                                                        ;A5E8A5;
    JSL.L regional(QueueSound_Lib3_Max6, QueueSound_Lib3_Max1)           ;A5E8A8;
    PLY                                                                  ;A5E8AC;
    PLX                                                                  ;A5E8AD;
    INY                                                                  ;A5E8AE;
    INY                                                                  ;A5E8AF;
    RTL                                                                  ;A5E8B0;


;;; $E8B1: Instruction - call Spore Spawn death item drop routine ;;;
Instruction_SporeSpawn_CallSporeSpawnDeathItemDropRoutine:
    PHX                                                                  ;A5E8B1;
    PHY                                                                  ;A5E8B2;
    JSL.L SporeSpawnDeathItemDropRoutine                                 ;A5E8B3;
    PLY                                                                  ;A5E8B7;
    PLX                                                                  ;A5E8B8;
    RTL                                                                  ;A5E8B9;


;;; $E8BA: Instruction - enemy function = [[Y]] ;;;
Instruction_SporeSpawn_FunctionInY:
    PHY                                                                  ;A5E8BA;
    PHX                                                                  ;A5E8BB;
    LDX.W EnemyIndex                                                     ;A5E8BC;
    LDA.W $0000,Y                                                        ;A5E8BF;
    STA.W SporeSpawn.function,X                                          ;A5E8C2;
    PLX                                                                  ;A5E8C5;
    PLY                                                                  ;A5E8C6;
    INY                                                                  ;A5E8C7;
    INY                                                                  ;A5E8C8;
    RTL                                                                  ;A5E8C9;


;;; $E8CA: Instruction - load Spore Spawn death sequence palette, palette data offset [[Y]] ;;;
Instruction_SporeSpawn_LoadDeathSequencePalette:
    PHY                                                                  ;A5E8CA;
    PHX                                                                  ;A5E8CB;
    STY.B DP_Temp12                                                      ;A5E8CC;
    LDA.W $0000,Y                                                        ;A5E8CE;
    TAY                                                                  ;A5E8D1;
    LDX.W #$0000                                                         ;A5E8D2;

  .loopSpritePalette1:
    LDA.W Palette_SporeSpawn_DeathSequence_0,Y                           ;A5E8D5;
    STA.L Palettes_SpriteP1,X                                            ;A5E8D8;
    INY                                                                  ;A5E8DC;
    INY                                                                  ;A5E8DD;
    INX                                                                  ;A5E8DE;
    INX                                                                  ;A5E8DF;
    CPX.W #$0020                                                         ;A5E8E0;
    BNE .loopSpritePalette1                                              ;A5E8E3;
    LDY.B DP_Temp12                                                      ;A5E8E5;
    LDA.W $0000,Y                                                        ;A5E8E7;
    TAY                                                                  ;A5E8EA;
    LDX.W #$0000                                                         ;A5E8EB;

  .loopBG12Palette4:
    LDA.W Palette_SporeSpawn_DeathSequence_Level_0,Y                     ;A5E8EE;
    STA.L Palettes_BG12P4,X                                              ;A5E8F1;
    INY                                                                  ;A5E8F5;
    INY                                                                  ;A5E8F6;
    INX                                                                  ;A5E8F7;
    INX                                                                  ;A5E8F8;
    CPX.W #$0020                                                         ;A5E8F9;
    BNE .loopBG12Palette4                                                ;A5E8FC;
    LDY.B DP_Temp12                                                      ;A5E8FE;
    LDA.W $0000,Y                                                        ;A5E900;
    TAY                                                                  ;A5E903;
    LDX.W #$0000                                                         ;A5E904;

  .loopBG12Palette7:
    LDA.W Palette_SporeSpawn_DeathSequence_Background_0,Y                ;A5E907;
    STA.L Palettes_BG12P7,X                                              ;A5E90A;
    INY                                                                  ;A5E90E;
    INY                                                                  ;A5E90F;
    INX                                                                  ;A5E910;
    INX                                                                  ;A5E911;
    CPX.W #$0020                                                         ;A5E912;
    BNE .loopBG12Palette7                                                ;A5E915;
    PLX                                                                  ;A5E917;
    PLY                                                                  ;A5E918;
    INY                                                                  ;A5E919;
    INY                                                                  ;A5E91A;
    RTL                                                                  ;A5E91B;


;;; $E91C: Instruction - load Spore Spawn death sequence target palette, palette data offset [[Y]] ;;;
Instruction_SporeSpawn_LoadDeathSequenceTargetPalette:
; Similar to Instruction_SporeSpawn_LoadDeathSequencePalette, but writing to target palette colours instead (called before fade-in)
    PHY                                                                  ;A5E91C;
    PHX                                                                  ;A5E91D;
    STY.B DP_Temp12                                                      ;A5E91E;
    LDA.W $0000,Y                                                        ;A5E920;
    TAY                                                                  ;A5E923;
    LDX.W #$0000                                                         ;A5E924;

  .loopSpritePalette1:
    LDA.W Palette_SporeSpawn_DeathSequence_0,Y                           ;A5E927;
    STA.L TargetPalettes_SpriteP1,X                                      ;A5E92A;
    INY                                                                  ;A5E92E;
    INY                                                                  ;A5E92F;
    INX                                                                  ;A5E930;
    INX                                                                  ;A5E931;
    CPX.W #$0020                                                         ;A5E932;
    BNE .loopSpritePalette1                                              ;A5E935;
    LDY.B DP_Temp12                                                      ;A5E937;
    LDA.W $0000,Y                                                        ;A5E939;
    TAY                                                                  ;A5E93C;
    LDX.W #$0000                                                         ;A5E93D;

  .loopBG12Palette4:
    LDA.W Palette_SporeSpawn_DeathSequence_Level_0,Y                     ;A5E940;
    STA.L TargetPalettes_BGP4,X                                          ;A5E943;
    INY                                                                  ;A5E947;
    INY                                                                  ;A5E948;
    INX                                                                  ;A5E949;
    INX                                                                  ;A5E94A;
    CPX.W #$0020                                                         ;A5E94B;
    BNE .loopBG12Palette4                                                ;A5E94E;
    LDY.B DP_Temp12                                                      ;A5E950;
    LDA.W $0000,Y                                                        ;A5E952;
    TAY                                                                  ;A5E955;
    LDX.W #$0000                                                         ;A5E956;

  .loopBG12Palette7:
    LDA.W Palette_SporeSpawn_DeathSequence_Background_0,Y                ;A5E959;
    STA.L TargetPalettes_BGP7,X                                          ;A5E95C;
    INY                                                                  ;A5E960;
    INY                                                                  ;A5E961;
    INX                                                                  ;A5E962;
    INX                                                                  ;A5E963;
    CPX.W #$0020                                                         ;A5E964;
    BNE .loopBG12Palette7                                                ;A5E967;
    PLX                                                                  ;A5E969;
    PLY                                                                  ;A5E96A;
    INY                                                                  ;A5E96B;
    INY                                                                  ;A5E96C;
    RTL                                                                  ;A5E96D;


;;; $E96E: Instruction - spawn Spore Spawn hardening dust cloud ;;;
Instruction_SporeSpawn_SpawnHardeningDustCloud:
    PHY                                                                  ;A5E96E;
    PHX                                                                  ;A5E96F;
    JSL.L GenerateRandomNumber                                           ;A5E970;
    LDA.W RandomNumberSeed                                               ;A5E974;
    AND.W #$007F                                                         ;A5E977;
    SEC                                                                  ;A5E97A;
    SBC.W #$0040                                                         ;A5E97B;
    STA.B DP_Temp12                                                      ;A5E97E;
    LDA.W Enemy.XPosition                                                ;A5E980;
    CLC                                                                  ;A5E983;
    ADC.B DP_Temp12                                                      ;A5E984;
    STA.B DP_Temp12                                                      ;A5E986;
    LDA.W RandomNumberSeed                                               ;A5E988;
    AND.W #$7F00                                                         ;A5E98B;
    XBA                                                                  ;A5E98E;
    SEC                                                                  ;A5E98F;
    SBC.W #$0040                                                         ;A5E990;
    STA.B DP_Temp14                                                      ;A5E993;
    LDA.W Enemy.YPosition                                                ;A5E995;
    CLC                                                                  ;A5E998;
    ADC.B DP_Temp14                                                      ;A5E999;
    STA.B DP_Temp14                                                      ;A5E99B;
    LDA.W #$0015                                                         ;A5E99D;
    LDY.W #EnemyProjectile_MiscDust                                      ;A5E9A0;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A5E9A3;
    LDA.W #$0029                                                         ;A5E9A7;
    JSL.L regional(QueueSound_Lib2_Max6, QueueSound_Lib2_Max1)           ;A5E9AA;
    PLX                                                                  ;A5E9AE;
    PLY                                                                  ;A5E9AF;
    RTL                                                                  ;A5E9B0;


;;; $E9B1: Instruction - spawn Spore Spawn dying explosion ;;;
Instruction_SporeSpawn_SpawnDyingExplosion:
    PHY                                                                  ;A5E9B1;
    PHX                                                                  ;A5E9B2;
    JSL.L GenerateRandomNumber                                           ;A5E9B3;
    LDA.W RandomNumberSeed                                               ;A5E9B7; >.<
    AND.W #$007F                                                         ;A5E9BA;
    SEC                                                                  ;A5E9BD;
    SBC.W #$0040                                                         ;A5E9BE;
    STA.B DP_Temp12                                                      ;A5E9C1;
    LDA.W Enemy.XPosition                                                ;A5E9C3;
    CLC                                                                  ;A5E9C6;
    ADC.B DP_Temp12                                                      ;A5E9C7;
    STA.B DP_Temp12                                                      ;A5E9C9;
    LDA.W RandomNumberSeed                                               ;A5E9CB;
    AND.W #$3F00                                                         ;A5E9CE;
    XBA                                                                  ;A5E9D1;
    SEC                                                                  ;A5E9D2;
    SBC.W #$0020                                                         ;A5E9D3;
    STA.B DP_Temp14                                                      ;A5E9D6;
    LDA.W Enemy.YPosition                                                ;A5E9D8;
    CLC                                                                  ;A5E9DB;
    ADC.B DP_Temp14                                                      ;A5E9DC;
    STA.B DP_Temp14                                                      ;A5E9DE;
    LDA.W #$0003                                                         ;A5E9E0;
    STA.B DP_Temp16                                                      ;A5E9E3;
    STZ.B DP_Temp18                                                      ;A5E9E5;
    JSL.L Create_Sprite_Object                                           ;A5E9E7;
    LDA.W #$0025                                                         ;A5E9EB;
    JSL.L regional(QueueSound_Lib2_Max6, QueueSound_Lib2_Max15)          ;A5E9EE;
    PLX                                                                  ;A5E9F2;
    PLY                                                                  ;A5E9F3;
    RTL                                                                  ;A5E9F4;


;;; $E9F5: Spawn Spore Spawn ceiling dust cloud ;;;
SpawnSporeSpawnCeilingDustCloud:
    PHY                                                                  ;A5E9F5;
    PHX                                                                  ;A5E9F6;
    LDA.W NMI_FrameCounter                                               ;A5E9F7;
    AND.W #$000F                                                         ;A5E9FA;
    BNE .return                                                          ;A5E9FD;
    JSL.L GenerateRandomNumber                                           ;A5E9FF;
    LDA.W RandomNumberSeed                                               ;A5EA03;
    AND.W #$003F                                                         ;A5EA06;
    CLC                                                                  ;A5EA09;
    ADC.W #$0060                                                         ;A5EA0A;
    STA.B DP_Temp12                                                      ;A5EA0D;
    LDA.W RandomNumberSeed                                               ;A5EA0F;
    AND.W #$0F00                                                         ;A5EA12;
    XBA                                                                  ;A5EA15;
    CLC                                                                  ;A5EA16;
    ADC.W #$01E0                                                         ;A5EA17;
    STA.B DP_Temp14                                                      ;A5EA1A;
    LDA.W #$0015                                                         ;A5EA1C;
    STA.B DP_Temp16                                                      ;A5EA1F;
    STZ.B DP_Temp18                                                      ;A5EA21;
    JSL.L Create_Sprite_Object                                           ;A5EA23;

  .return:
    PLX                                                                  ;A5EA27;
    PLY                                                                  ;A5EA28;
    RTL                                                                  ;A5EA29;


;;; $EA2A: Initialisation AI - enemy $DF3F/$DF7F (Spore Spawn) ;;;
InitAI_SporeSpawn:
    LDY.W #$0000                                                         ;A5EA2A;
    LDX.W #$0000                                                         ;A5EA2D;

  .loopSpritePalette7:
    LDA.W Palette_SporeSpawn,Y                                           ;A5EA30;
    STA.L TargetPalettes_SpriteP7,X                                      ;A5EA33;
    INY                                                                  ;A5EA37;
    INY                                                                  ;A5EA38;
    INX                                                                  ;A5EA39;
    INX                                                                  ;A5EA3A;
    CPX.W #$0020                                                         ;A5EA3B;
    BNE .loopSpritePalette7                                              ;A5EA3E;
    LDX.W EnemyIndex                                                     ;A5EA40;
    LDA.W #$0000                                                         ;A5EA43;
    LDY.W #EnemyProjectile_SporeSpawnStalk                               ;A5EA46;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A5EA49;
    LDA.W #$0001                                                         ;A5EA4D;
    LDY.W #EnemyProjectile_SporeSpawnStalk                               ;A5EA50;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A5EA53;
    LDA.W #$0002                                                         ;A5EA57;
    LDY.W #EnemyProjectile_SporeSpawnStalk                               ;A5EA5A;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A5EA5D;
    LDA.W #$0003                                                         ;A5EA61;
    LDY.W #EnemyProjectile_SporeSpawnStalk                               ;A5EA64;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A5EA67;
    LDX.W EnemyIndex                                                     ;A5EA6B;
    LDA.W Enemy.XPosition,X                                              ;A5EA6E;
    STA.L SporeSpawn.stalkXOrigin,X                                      ;A5EA71;
    LDA.W Enemy.YPosition,X                                              ;A5EA75;
    SEC                                                                  ;A5EA78;
    SBC.W #$0048                                                         ;A5EA79;
    STA.L SporeSpawn.stalkYOrigin,X                                      ;A5EA7C;
    LDA.W Enemy.XPosition,X                                              ;A5EA80;
    STA.W SporeSpawn.XOrigin,X                                           ;A5EA83;
    LDA.W Enemy.YPosition,X                                              ;A5EA86;
    STA.W SporeSpawn.YOrigin,X                                           ;A5EA89;
    STZ.W Enemy.var5,X                                                   ;A5EA8C;
    LDX.W AreaIndex                                                      ;A5EA8F;
    LDA.L SRAMMirror_Boss,X                                              ;A5EA92;
    AND.W #$0002                                                         ;A5EA96;
    BEQ .alive                                                           ;A5EA99;
    LDA.W #InstList_SporeSpawn_Initial_Dead                              ;A5EA9B;
    STA.W Enemy.instList                                                 ;A5EA9E;
    LDA.W #RTS_A5EB1A                                                    ;A5EAA1;
    STA.W SporeSpawn.function                                            ;A5EAA4;
    LDA.W Enemy.properties                                               ;A5EAA7;
    ORA.W #$8000                                                         ;A5EAAA;
    STA.W Enemy.properties                                               ;A5EAAD;
    JSR.W UpdateSporeSpawnStalkSegmentPositions                          ;A5EAB0;
    JSL.L Spawn_Hardcoded_PLM                                            ;A5EAB3;
    db $07,$1E                                                           ;A5EAB7;
    dw PLMEntries_clearSporeSpawnCeiling                                 ;A5EAB9;
    STZ.W ScrollingSkyFinishedHook                                       ;A5EABB;
    RTL                                                                  ;A5EABE;

  .alive:
    LDX.W EnemyIndex                                                     ;A5EABF;
    LDA.W #InstList_SporeSpawn_Initial_Alive                             ;A5EAC2;
    STA.W Enemy.instList                                                 ;A5EAC5;
    LDA.W #$FFFF                                                         ;A5EAC8;
    STA.W GlobalOffScreenEnemyProcessingFlag                             ;A5EACB;
    LDX.W EnemyIndex                                                     ;A5EACE;
    LDA.W #RTS_A5EB1A                                                    ;A5EAD1;
    STA.W SporeSpawn.function,X                                          ;A5EAD4;
    LDA.W #ScrollingFinishedHook_SporeSpawnFight                         ;A5EAD7;
    STA.W ScrollingSkyFinishedHook                                       ;A5EADA;
    LDA.W Enemy.YPosition,X                                              ;A5EADD;
    SEC                                                                  ;A5EAE0;
    SBC.W #$0080                                                         ;A5EAE1;
    STA.W Enemy.YPosition,X                                              ;A5EAE4;
    LDA.W #$0000                                                         ;A5EAE7;
    LDY.W #EnemyProjectile_SporeSpawnSporeSpawner                        ;A5EAEA;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A5EAED;
    LDA.W #$0001                                                         ;A5EAF1;
    LDY.W #EnemyProjectile_SporeSpawnSporeSpawner                        ;A5EAF4;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A5EAF7;
    LDA.W #$0002                                                         ;A5EAFB;
    LDY.W #EnemyProjectile_SporeSpawnSporeSpawner                        ;A5EAFE;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A5EB01;
    LDA.W #$0003                                                         ;A5EB05;
    LDY.W #EnemyProjectile_SporeSpawnSporeSpawner                        ;A5EB08;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A5EB0B;
    JSR.W UpdateSporeSpawnStalkSegmentPositions                          ;A5EB0F;
    RTL                                                                  ;A5EB12;


;;; $EB13: Main AI - enemy $DF3F/$DF7F (Spore Spawn) ;;;
MainAI_SporeSpawn:
    LDX.W EnemyIndex                                                     ;A5EB13;
    JSR.W (SporeSpawn.function,X)                                        ;A5EB16;
    RTL                                                                  ;A5EB19;


;;; $EB1A: RTS ;;;
RTS_A5EB1A:
    RTS                                                                  ;A5EB1A;


;;; $EB1B: Spore Spawn function - descent ;;;
Function_SporeSpawn_Descent:
    JSR.W UpdateSporeSpawnStalkSegmentPositions                          ;A5EB1B;
    LDX.W EnemyIndex                                                     ;A5EB1E;
    LDA.W Enemy.YPosition,X                                              ;A5EB21;
    CLC                                                                  ;A5EB24;
    ADC.W #$0001                                                         ;A5EB25;
    STA.W Enemy.YPosition,X                                              ;A5EB28;
    CMP.W #$0270                                                         ;A5EB2B;
    BMI .descending                                                      ;A5EB2E;
    LDA.W #InstList_SporeSpawn_FightHasStarted                           ;A5EB30;
    STA.W Enemy.instList,X                                               ;A5EB33;
    LDA.W #$0001                                                         ;A5EB36;
    STA.W Enemy.instTimer,X                                              ;A5EB39;

  .descending:
    LDA.W #$0030                                                         ;A5EB3C;
    STA.L SporeSpawn.maxXRadius                                          ;A5EB3F;
    LDA.W #$0001                                                         ;A5EB43;
    STA.L SporeSpawn.angleDelta                                          ;A5EB46;
if !PAL != 0
    LDA.W #$3333
    STA.L SporeSpawn.subangleDelta
endif
    LDA.W #$00C0                                                         ;A5EB4A;
    STA.L SporeSpawn.angle                                               ;A5EB4D;
    RTS                                                                  ;A5EB51;


;;; $EB52: Spore Spawn function - moving ;;;
Function_SporeSpawn_Moving:
    JSR.W UpdateSporeSpawnStalkSegmentPositions                          ;A5EB52;
    LDA.L SporeSpawn.maxXRadius                                          ;A5EB55;
    STA.W Temp_XPosition                                                 ;A5EB59;
    LDA.L SporeSpawn.angle                                               ;A5EB5C;
    JSL.L EightBitCosineMultiplication_A0B0B2                            ;A5EB60;
    CLC                                                                  ;A5EB64;
    ADC.W SporeSpawn.XOrigin,X                                           ;A5EB65;
    STA.W Enemy.XPosition,X                                              ;A5EB68;
    LDA.L SporeSpawn.maxXRadius                                          ;A5EB6B;
    SEC                                                                  ;A5EB6F;
    SBC.W #$0010                                                         ;A5EB70;
    STA.W Temp_XPosition                                                 ;A5EB73;
    LDA.L SporeSpawn.angle                                               ;A5EB76;
    SEC                                                                  ;A5EB7A;
    SBC.W #$0040                                                         ;A5EB7B;
    ASL                                                                  ;A5EB7E;
    JSL.L EightBitNegativeSineMultiplication_A0B0C6                      ;A5EB7F;
    CLC                                                                  ;A5EB83;
    ADC.W SporeSpawn.YOrigin,X                                           ;A5EB84;
    STA.W Enemy.YPosition,X                                              ;A5EB87;
if !PAL != 0
    LDA.L SporeSpawn.subangleDelta
    CLC
    ADC.L SporeSpawn.subangle
    STA.L SporeSpawn.subangle
    BCC ++
    LDA.L SporeSpawn.angleDelta
    BMI +
    LDA.L SporeSpawn.angle
    INC A
    STA.L SporeSpawn.angle
    BRA ++
    
+   LDA.L SporeSpawn.angle
    DEC A
    STA.L SporeSpawn.angle
    
++
endif
    LDA.L SporeSpawn.angle                                               ;A5EB8A;
    CLC                                                                  ;A5EB8E;
    ADC.L SporeSpawn.angleDelta                                          ;A5EB8F;
    AND.W #$00FF                                                         ;A5EB93;
    STA.L SporeSpawn.angle                                               ;A5EB96;
    RTS                                                                  ;A5EB9A;


;;; $EB9B: Spore Spawn function - set up death ;;;
Function_SporeSpawn_SetupDeath:
    LDX.W EnemyIndex                                                     ;A5EB9B;
    LDA.W #$0080                                                         ;A5EB9E;
    SEC                                                                  ;A5EBA1;
    SBC.W Enemy.XPosition                                                ;A5EBA2;
    STA.B DP_Temp12                                                      ;A5EBA5;
    LDA.W #$0270                                                         ;A5EBA7;
    SEC                                                                  ;A5EBAA;
    SBC.W Enemy.YPosition                                                ;A5EBAB;
    STA.B DP_Temp14                                                      ;A5EBAE;
    JSL.L CalculateAngleOf_12_14_Offset                                  ;A5EBB0;
    SEC                                                                  ;A5EBB4;
    SBC.W #$0040                                                         ;A5EBB5;
    EOR.W #$FFFF                                                         ;A5EBB8;
    INC                                                                  ;A5EBBB;
    AND.W #$00FF                                                         ;A5EBBC;
    STA.L SporeSpawn.deathDriftAngle                                     ;A5EBBF;
    LDA.W #$0001                                                         ;A5EBC3;
    STA.B DP_Temp14                                                      ;A5EBC6;
    LDA.L SporeSpawn.deathDriftAngle                                     ;A5EBC8;
    AND.W #$00FF                                                         ;A5EBCC;
    STA.B DP_Temp12                                                      ;A5EBCF;
    JSL.L Do_Some_Math_With_Sine_Cosine_Terrible_Label_Name              ;A5EBD1; ($16.$18, $1A.$1C) = ([$14] * |cos([$12] * pi / 80h)|, [$14] * |sin([$12] * pi / 80h)|)
    LDA.B DP_Temp16                                                      ;A5EBD5;
    STA.L SporeSpawn.deathDriftXSpeed,X                                  ;A5EBD7;
    LDA.B DP_Temp18                                                      ;A5EBDB;
    STA.L SporeSpawn.deathDriftXSubSpeed,X                               ;A5EBDD;
    LDA.B DP_Temp1A                                                      ;A5EBE1;
    STA.L SporeSpawn.deathDriftYSpeed,X                                  ;A5EBE3;
    LDA.B DP_Temp1C                                                      ;A5EBE7;
    STA.L SporeSpawn.deathDriftYSubSpeed,X                               ;A5EBE9;
    RTS                                                                  ;A5EBED;


;;; $EBEE: Spore Spawn function - dying ;;;
Function_SporeSpawn_Dying:
    LDX.W EnemyIndex                                                     ;A5EBEE;
    LDA.L SporeSpawn.deathDriftXSpeed,X                                  ;A5EBF1;
    STA.W Temp_XSpeed                                                    ;A5EBF5;
    LDA.L SporeSpawn.deathDriftXSubSpeed,X                               ;A5EBF8;
    STA.W Temp_XSubSpeed                                                 ;A5EBFC;
    LDA.L SporeSpawn.deathDriftYSpeed,X                                  ;A5EBFF;
    STA.W Temp_YSpeed                                                    ;A5EC03;
    LDA.L SporeSpawn.deathDriftYSubSpeed,X                               ;A5EC06;
    STA.W Temp_YSubSpeed                                                 ;A5EC0A;
    LDA.L SporeSpawn.deathDriftAngle                                     ;A5EC0D;
    AND.W #$00FF                                                         ;A5EC11;
    STA.W Temp_AngleToMove                                               ;A5EC14;
    JSL.L MoveEnemyAccordingToAngleAndXYSpeeds                           ;A5EC17;
    LDA.W Enemy.XPosition                                                ;A5EC1B;
    SEC                                                                  ;A5EC1E;
    SBC.W #$0080                                                         ;A5EC1F;
    JSL.L NegateA_A0B067                                                 ;A5EC22;
    CMP.W #$0008                                                         ;A5EC26;
    BPL .notDone                                                         ;A5EC29;
    LDA.W Enemy.YPosition                                                ;A5EC2B;
    SEC                                                                  ;A5EC2E;
    SBC.W #$0270                                                         ;A5EC2F;
    JSL.L NegateA_A0B067                                                 ;A5EC32;
    CMP.W #$0008                                                         ;A5EC36;
    BPL .notDone                                                         ;A5EC39;
    LDA.W #RTS_A5EB1A                                                    ;A5EC3B;
    STA.W SporeSpawn.function                                            ;A5EC3E;

  .notDone:
    JSR.W UpdateSporeSpawnStalkSegmentPositions                          ;A5EC41;
    JSL.L SpawnSporeSpawnCeilingDustCloud                                ;A5EC44;
    RTS                                                                  ;A5EC48;


;;; $EC49: Update Spore Spawn stalk segment positions ;;;
UpdateSporeSpawnStalkSegmentPositions:
    LDA.W Enemy.XPosition                                                ;A5EC49;
    SEC                                                                  ;A5EC4C;
    SBC.L SporeSpawn.stalkXOrigin                                        ;A5EC4D;
    BPL .positiveX                                                       ;A5EC51;
    EOR.W #$FFFF                                                         ;A5EC53;
    INC                                                                  ;A5EC56;
    LSR                                                                  ;A5EC57;
    STA.B DP_Temp12                                                      ;A5EC58;
    LSR                                                                  ;A5EC5A;
    STA.B DP_Temp14                                                      ;A5EC5B;
    CLC                                                                  ;A5EC5D;
    ADC.B DP_Temp12                                                      ;A5EC5E;
    STA.B DP_Temp16                                                      ;A5EC60;
    LDA.W #$0080                                                         ;A5EC62;
    STA.W EnemyProjectile_XPositions+$1C                                 ;A5EC65;
    LDA.L SporeSpawn.stalkXOrigin                                        ;A5EC68;
    SEC                                                                  ;A5EC6C;
    SBC.B DP_Temp14                                                      ;A5EC6D;
    STA.W EnemyProjectile_XPositions+$1E                                 ;A5EC6F;
    STA.L SporeSpawn.stalkSegment2XPosition                              ;A5EC72;
    LDA.L SporeSpawn.stalkXOrigin                                        ;A5EC76;
    SEC                                                                  ;A5EC7A;
    SBC.B DP_Temp12                                                      ;A5EC7B;
    STA.W EnemyProjectile_XPositions+$20                                 ;A5EC7D;
    STA.L SporeSpawn.stalkSegment1XPosition                              ;A5EC80;
    LDA.L SporeSpawn.stalkXOrigin                                        ;A5EC84;
    SEC                                                                  ;A5EC88;
    SBC.B DP_Temp16                                                      ;A5EC89;
    STA.W EnemyProjectile_XPositions+$22                                 ;A5EC8B;
    STA.L SporeSpawn.stalkSegment0XPosition                              ;A5EC8E;
    BRA .checkY                                                          ;A5EC92;

  .positiveX:
    LSR                                                                  ;A5EC94;
    STA.B DP_Temp12                                                      ;A5EC95;
    LSR                                                                  ;A5EC97;
    STA.B DP_Temp14                                                      ;A5EC98;
    CLC                                                                  ;A5EC9A;
    ADC.B DP_Temp12                                                      ;A5EC9B;
    STA.B DP_Temp16                                                      ;A5EC9D;
    LDA.W #$0080                                                         ;A5EC9F;
    STA.W EnemyProjectile_XPositions+$1C                                 ;A5ECA2;
    LDA.B DP_Temp14                                                      ;A5ECA5;
    CLC                                                                  ;A5ECA7;
    ADC.L SporeSpawn.stalkXOrigin                                        ;A5ECA8;
    STA.W EnemyProjectile_XPositions+$1E                                 ;A5ECAC;
    STA.L SporeSpawn.stalkSegment2XPosition                              ;A5ECAF;
    LDA.B DP_Temp12                                                      ;A5ECB3;
    CLC                                                                  ;A5ECB5;
    ADC.L SporeSpawn.stalkXOrigin                                        ;A5ECB6;
    STA.W EnemyProjectile_XPositions+$20                                 ;A5ECBA;
    STA.L SporeSpawn.stalkSegment1XPosition                              ;A5ECBD;
    LDA.B DP_Temp16                                                      ;A5ECC1;
    CLC                                                                  ;A5ECC3;
    ADC.L SporeSpawn.stalkXOrigin                                        ;A5ECC4;
    STA.W EnemyProjectile_XPositions+$22                                 ;A5ECC8;
    STA.L SporeSpawn.stalkSegment0XPosition                              ;A5ECCB;

  .checkY:
    LDA.W Enemy.YPosition                                                ;A5ECCF;
    SEC                                                                  ;A5ECD2;
    SBC.W #$0028                                                         ;A5ECD3;
    SEC                                                                  ;A5ECD6;
    SBC.L SporeSpawn.stalkYOrigin                                        ;A5ECD7;
    BPL .positiveY                                                       ;A5ECDB;
    EOR.W #$FFFF                                                         ;A5ECDD;
    INC                                                                  ;A5ECE0;
    LSR                                                                  ;A5ECE1;
    STA.B DP_Temp12                                                      ;A5ECE2;
    LSR                                                                  ;A5ECE4;
    STA.B DP_Temp14                                                      ;A5ECE5;
    CLC                                                                  ;A5ECE7;
    ADC.B DP_Temp12                                                      ;A5ECE8;
    STA.B DP_Temp16                                                      ;A5ECEA;
    LDA.W #$0230                                                         ;A5ECEC;
    STA.W EnemyProjectile_YPositions+$1C                                 ;A5ECEF;
    LDA.L SporeSpawn.stalkYOrigin                                        ;A5ECF2;
    SEC                                                                  ;A5ECF6;
    SBC.B DP_Temp14                                                      ;A5ECF7;
    STA.W EnemyProjectile_YPositions+$1E                                 ;A5ECF9;
    STA.L SporeSpawn.stalkSegment2YPosition                              ;A5ECFC;
    LDA.L SporeSpawn.stalkYOrigin                                        ;A5ED00;
    SEC                                                                  ;A5ED04;
    SBC.B DP_Temp12                                                      ;A5ED05;
    STA.W EnemyProjectile_YPositions+$20                                 ;A5ED07;
    STA.L SporeSpawn.stalkSegment1YPosition                              ;A5ED0A;
    LDA.L SporeSpawn.stalkYOrigin                                        ;A5ED0E;
    SEC                                                                  ;A5ED12;
    SBC.B DP_Temp16                                                      ;A5ED13;
    STA.W EnemyProjectile_YPositions+$22                                 ;A5ED15;
    STA.L SporeSpawn.stalkSegment0YPosition                              ;A5ED18;
    BRA .return                                                          ;A5ED1C;

  .positiveY:
    LSR                                                                  ;A5ED1E;
    STA.B DP_Temp12                                                      ;A5ED1F;
    LSR                                                                  ;A5ED21;
    STA.B DP_Temp14                                                      ;A5ED22;
    CLC                                                                  ;A5ED24;
    ADC.B DP_Temp12                                                      ;A5ED25;
    STA.B DP_Temp16                                                      ;A5ED27;
    LDA.W #$0230                                                         ;A5ED29;
    STA.W EnemyProjectile_YPositions+$1C                                 ;A5ED2C;
    LDA.B DP_Temp14                                                      ;A5ED2F;
    CLC                                                                  ;A5ED31;
    ADC.L SporeSpawn.stalkYOrigin                                        ;A5ED32;
    STA.W EnemyProjectile_YPositions+$1E                                 ;A5ED36;
    STA.L SporeSpawn.stalkSegment2YPosition                              ;A5ED39;
    LDA.B DP_Temp12                                                      ;A5ED3D;
    CLC                                                                  ;A5ED3F;
    ADC.L SporeSpawn.stalkYOrigin                                        ;A5ED40;
    STA.W EnemyProjectile_YPositions+$20                                 ;A5ED44;
    STA.L SporeSpawn.stalkSegment1YPosition                              ;A5ED47;
    LDA.B DP_Temp16                                                      ;A5ED4B;
    CLC                                                                  ;A5ED4D;
    ADC.L SporeSpawn.stalkYOrigin                                        ;A5ED4E;
    STA.W EnemyProjectile_YPositions+$22                                 ;A5ED52;
    STA.L SporeSpawn.stalkSegment0YPosition                              ;A5ED55;

  .return:
    RTS                                                                  ;A5ED59;


;;; $ED5A: Enemy shot - Spore Spawn - vulnerable ;;;
EnemyShot_SporeSpawn_Vulnerable:
    LDA.W CollisionIndex                                                 ;A5ED5A;
    ASL                                                                  ;A5ED5D;
    TAX                                                                  ;A5ED5E;
    LDA.W SamusProjectile_Types,X                                        ;A5ED5F;
    BIT.W #$0700                                                         ;A5ED62;
    BNE .notBeam                                                         ;A5ED65;
    BIT.W #$0010                                                         ;A5ED67;
    BNE .notBeam                                                         ;A5ED6A;
    RTL                                                                  ;A5ED6C;

  .notBeam:
    JSL.L NormalEnemyShotAI_NoDeathCheck                                 ;A5ED6D;
    LDA.W Enemy.flashTimer,X                                             ;A5ED71;
    BEQ EnemyShot_SporeSpawn                                             ;A5ED74;
    LDA.W #Function_SporeSpawn_Moving                                    ;A5ED76;
    STA.W SporeSpawn.function,X                                          ;A5ED79;
    LDY.W #$0002                                                         ;A5ED7C;
    LDA.W Enemy.health,X                                                 ;A5ED7F;
    CMP.W #$0190                                                         ;A5ED82;
    BPL .noSpeedUp                                                       ;A5ED85;
    LDA.L SporeSpawn.angleDelta                                          ;A5ED87;
    BPL .negativeAngleDelta                                              ;A5ED8B;
    TYA                                                                  ;A5ED8D;
    EOR.W #$FFFF                                                         ;A5ED8E;
    INC                                                                  ;A5ED91;
    TAY                                                                  ;A5ED92;

  .negativeAngleDelta:
    TYA                                                                  ;A5ED93;
    STA.L SporeSpawn.angleDelta                                          ;A5ED94;
if !PAL != 0
    LDA.W #$6666
    STA.L SporeSpawn.subangleDelta
endif

  .noSpeedUp:
    LDA.L SporeSpawn.damagedFlag                                         ;A5ED98;
    BNE EnemyShot_SporeSpawn                                             ;A5ED9C;
    LDA.L SporeSpawn.angleDelta                                          ;A5ED9E;
    EOR.W #$FFFF                                                         ;A5EDA2;
    INC                                                                  ;A5EDA5;
    STA.L SporeSpawn.angleDelta                                          ;A5EDA6;
    LDA.W #$0001                                                         ;A5EDAA;
    STA.L SporeSpawn.damagedFlag                                         ;A5EDAD;
    LDA.W #InstList_SporeSpawn_CloseAndMove                              ;A5EDB1;
    STA.W Enemy.instList,X                                               ;A5EDB4;
    LDA.W #$0001                                                         ;A5EDB7;
    STA.W Enemy.instTimer,X                                              ;A5EDBA;
    LDY.W #$0060                                                         ;A5EDBD;
    LDA.W Enemy.health,X                                                 ;A5EDC0;
    CMP.W #$0046                                                         ;A5EDC3;
    BMI .paletteChosen                                                   ;A5EDC6;
    LDY.W #$0040                                                         ;A5EDC8;
    CMP.W #$019A                                                         ;A5EDCB;
    BMI .paletteChosen                                                   ;A5EDCE;
    LDY.W #$0020                                                         ;A5EDD0;
    CMP.W #$0302                                                         ;A5EDD3;
    BMI .paletteChosen                                                   ;A5EDD6;
    LDY.W #$0000                                                         ;A5EDD8;

  .paletteChosen:
    CMP.L SporeSpawn.previousHealth                                      ;A5EDDB;
    BEQ EnemyShot_SporeSpawn                                             ;A5EDDF;
    STA.L SporeSpawn.previousHealth                                      ;A5EDE1;
    TYA                                                                  ;A5EDE5;
    JSL.L LoadSporeSpawnHealthBasedPalette                               ;A5EDE6; fallthrough to EnemyShot_SporeSpawn


;;; $EDEA: Enemy shot - enemy $DF3F/$DF7F (Spore Spawn) ;;;
EnemyShot_SporeSpawn:
    BRA SporeSpawnReaction_Common                                        ;A5EDEA;


;;; $EDEC: Enemy touch - enemy $DF3F/$DF7F (Spore Spawn) ;;;
EnemyTouch_SporeSpawn:
    JSL.L NormalEnemyTouchAI_NoDeathCheck_External                       ;A5EDEC;
    BRA SporeSpawnReaction_Common                                        ;A5EDF0;


;;; $EDF2: RTL. Power bomb reaction - enemy $DF3F (Spore Spawn) ;;;
PowerBombReaction_SporeSpawn:
    RTL                                                                  ;A5EDF2; >.<


;;; $EDF3: Spore Spawn reaction ;;;
SporeSpawnReaction_Common:
    LDX.W EnemyIndex                                                     ;A5EDF3;
    LDA.W Enemy.health,X                                                 ;A5EDF6;
    BNE .return                                                          ;A5EDF9;
    LDX.W EnemyIndex                                                     ;A5EDFB;
    LDA.W #$0000                                                         ;A5EDFE;
    STA.L ExtraEnemy7800+$1C                                             ;A5EE01;
    STZ.W Enemy.invincibilityTimer,X                                     ;A5EE05;
    STZ.W Enemy.flashTimer,X                                             ;A5EE08;
    STZ.W Enemy.AI,X                                                     ;A5EE0B;
    LDA.W Enemy.properties,X                                             ;A5EE0E;
    ORA.W #$0400                                                         ;A5EE11;
    STA.W Enemy.properties,X                                             ;A5EE14;
    LDY.W #$001A                                                         ;A5EE17;
    LDA.W #$0000                                                         ;A5EE1A;

  .loopClearProjectiles:
    STA.W EnemyProjectile_ID,Y                                           ;A5EE1D;
    DEY                                                                  ;A5EE20;
    DEY                                                                  ;A5EE21;
    BPL .loopClearProjectiles                                            ;A5EE22;
    LDA.W #InstList_SporeSpawn_DeathSequence_0                           ;A5EE24;
    STA.W Enemy.instList                                                 ;A5EE27;
    LDA.W #$0001                                                         ;A5EE2A;
    STA.W Enemy.instTimer                                                ;A5EE2D;
    LDX.W AreaIndex                                                      ;A5EE30;
    LDA.L SRAMMirror_Boss,X                                              ;A5EE33;
    ORA.W #$0002                                                         ;A5EE37;
    STA.L SRAMMirror_Boss,X                                              ;A5EE3A;
    STZ.W ScrollingSkyFinishedHook                                       ;A5EE3E;
    JSL.L Spawn_Hardcoded_PLM                                            ;A5EE41;
    db $07,$1E                                                           ;A5EE45;
    dw PLMEntries_crumbleSporeSpawnCeiling                               ;A5EE47;
if !PAL != 0
    JSR.W Function_SporeSpawn_SetupDeath
    LDA.W #Function_SporeSpawn_Dying
    STA.W SporeSpawn.function
endif

  .return:
    RTL                                                                  ;A5EE49;


;;; $EE4A: Load Spore Spawn health-based palette ;;;
LoadSporeSpawnHealthBasedPalette:
;; Parameters:
;;     A: Palette data offset

; Rather unfortunate that this routine is only called from one place, and that place does a TYA to get the argument in A,
; only for this routine to put it *back* into Y anyway and needlessly preserve Y on the stack
    PHY                                                                  ;A5EE4A;
    PHX                                                                  ;A5EE4B;
    STA.B DP_Temp12                                                      ;A5EE4C;
    TAY                                                                  ;A5EE4E;
    LDX.W #$0000                                                         ;A5EE4F;

  .loopSpritePalette1:
    LDA.W Palette_SporeSpawn_HealthBased_0,Y                             ;A5EE52;
    STA.L Palettes_SpriteP1,X                                            ;A5EE55;
    INY                                                                  ;A5EE59;
    INY                                                                  ;A5EE5A;
    INX                                                                  ;A5EE5B;
    INX                                                                  ;A5EE5C;
    CPX.W #$0020                                                         ;A5EE5D;
    BNE .loopSpritePalette1                                              ;A5EE60;
    PLX                                                                  ;A5EE62;
    PLY                                                                  ;A5EE63;
    RTL                                                                  ;A5EE64;


;;; $EE65: Spore Spawn extended spritemaps ;;;
ExtendedSpritemap_SporeSpawn_Dead:
    dw $0001                                                             ;A5EE65;
    dw $0000,$0000                                                       ;A5EE67;
    dw Spritemap_SporeSpawn_0                                            ;A5EE6B;
    dw Hitbox_SporeSpawn_0                                               ;A5EE6D;

ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_0:
    dw $0001                                                             ;A5EE6F;
    dw $0000,$0000
    dw Spritemap_SporeSpawn_0                                            ;A5EE75;
    dw Hitbox_SporeSpawn_1                                               ;A5EE77;

ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_1:
    dw $0002                                                             ;A5EE79;
    dw $0000,$0000
    dw Spritemap_SporeSpawn_1                                            ;A5EE7F;
    dw Hitbox_SporeSpawn_2                                               ;A5EE81;
    dw $0000,$0000                                                       ;A5EE83;
    dw Spritemap_SporeSpawn_B                                            ;A5EE87;
    dw Hitbox_SporeSpawn_B                                               ;A5EE89;

ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_2:
    dw $0002                                                             ;A5EE8B;
    dw $0000,$0000
    dw Spritemap_SporeSpawn_2                                            ;A5EE91;
    dw Hitbox_SporeSpawn_3                                               ;A5EE93;
    dw $0000,$0000                                                       ;A5EE95;
    dw Spritemap_SporeSpawn_C                                            ;A5EE99;
    dw Hitbox_SporeSpawn_C                                               ;A5EE9B;

ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_3:
    dw $0002                                                             ;A5EE9D;
    dw $0000,$0000
    dw Spritemap_SporeSpawn_3                                            ;A5EEA3;
    dw Hitbox_SporeSpawn_4                                               ;A5EEA5;
    dw $0000,$0000                                                       ;A5EEA7;
    dw Spritemap_SporeSpawn_D                                            ;A5EEAB;
    dw Hitbox_SporeSpawn_D                                               ;A5EEAD;

ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_4:
    dw $0002                                                             ;A5EEAF;
    dw $0000,$0000
    dw Spritemap_SporeSpawn_4                                            ;A5EEB5;
    dw Hitbox_SporeSpawn_5                                               ;A5EEB7;
    dw $0000,$0000                                                       ;A5EEB9;
    dw Spritemap_SporeSpawn_C                                            ;A5EEBD;
    dw Hitbox_SporeSpawn_C                                               ;A5EEBF;

ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_5:
    dw $0002                                                             ;A5EEC1;
    dw $0000,$0000
    dw Spritemap_SporeSpawn_5                                            ;A5EEC7;
    dw Hitbox_SporeSpawn_6                                               ;A5EEC9;
    dw $0000,$0000                                                       ;A5EECB;
    dw Spritemap_SporeSpawn_B                                            ;A5EECF;
    dw Hitbox_SporeSpawn_B                                               ;A5EED1;

ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_6:
    dw $0002                                                             ;A5EED3;
    dw $0000,$0000
    dw Spritemap_SporeSpawn_15                                           ;A5EED9;
    dw Hitbox_SporeSpawn_13                                              ;A5EEDB;
    dw $0000,$0000                                                       ;A5EEDD;
    dw Spritemap_SporeSpawn_C                                            ;A5EEE1;
    dw Hitbox_SporeSpawn_C                                               ;A5EEE3;

ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_7:
    dw $0002                                                             ;A5EEE5;
    dw $0000,$0000
    dw Spritemap_SporeSpawn_16                                           ;A5EEEB;
    dw Hitbox_SporeSpawn_14                                              ;A5EEED;
    dw $0000,$0000                                                       ;A5EEEF;
    dw Spritemap_SporeSpawn_D                                            ;A5EEF3;
    dw Hitbox_SporeSpawn_D                                               ;A5EEF5;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ExtendedSpritemap_SporeSpawn_A5EEF7:
    dw $0001                                                             ;A5EEF7;
    dw $0000,$0000
    dw Spritemap_SporeSpawn_F                                            ;A5EEFD;
    dw Hitbox_SporeSpawn_F                                               ;A5EEFF;

UNUSED_ExtendedSpritemap_SporeSpawn_A5EF01:
    dw $0001                                                             ;A5EF01;
    dw $0000,$0000
    dw Spritemap_SporeSpawn_10                                           ;A5EF07;
    dw Hitbox_SporeSpawn_10                                              ;A5EF09;

UNUSED_ExtendedSpritemap_SporeSpawn_A5EF0B:
    dw $0001                                                             ;A5EF0B;
    dw $0000,$0000
    dw Spritemap_SporeSpawn_11                                           ;A5EF11;
    dw Hitbox_SporeSpawn_11                                              ;A5EF13;

UNUSED_ExtendedSpritemap_SporeSpawn_A5EF15:
    dw $0001                                                             ;A5EF15;
    dw $0000,$0000
    dw Spritemap_SporeSpawn_12                                           ;A5EF1B;
    dw Hitbox_SporeSpawn_12                                              ;A5EF1D;

UNUSED_ExtendedSpritemap_SporeSpawn_A5EF1F:
    dw $0001                                                             ;A5EF1F;
    dw $0000,$0000
    dw Spritemap_SporeSpawn_13                                           ;A5EF25;
    dw Hitbox_SporeSpawn_13                                              ;A5EF27;

UNUSED_ExtendedSpritemap_SporeSpawn_A5EF29:
    dw $0001                                                             ;A5EF29;
    dw $0000,$0000
    dw Spritemap_SporeSpawn_14                                           ;A5EF2F;
    dw Hitbox_SporeSpawn_13                                              ;A5EF31;

UNUSED_ExtendedSpritemap_SporeSpawn_A5EF33:
    dw $0001                                                             ;A5EF33;
    dw $0000,$0000
    dw Spritemap_SporeSpawn_E                                            ;A5EF39;
    dw Hitbox_SporeSpawn_E                                               ;A5EF3B;
endif ; !FEATURE_KEEP_UNREFERENCED

ExtendedSpritemap_SporeSpawn_FullyOpen_0:
    dw $0002                                                             ;A5EF3D;
    dw $0000,$0000
    dw Spritemap_SporeSpawn_16                                           ;A5EF43;
    dw Hitbox_SporeSpawn_14                                              ;A5EF45;
    dw $0000,$0000                                                       ;A5EF47;
    dw Spritemap_SporeSpawn_B                                            ;A5EF4B;
    dw Hitbox_SporeSpawn_B                                               ;A5EF4D;

ExtendedSpritemap_SporeSpawn_FullyOpen_1:
    dw $0002                                                             ;A5EF4F;
    dw $0000,$0000
    dw Spritemap_SporeSpawn_16                                           ;A5EF55;
    dw Hitbox_SporeSpawn_14                                              ;A5EF57;
    dw $0000,$0000                                                       ;A5EF59;
    dw Spritemap_SporeSpawn_C                                            ;A5EF5D;
    dw Hitbox_SporeSpawn_C                                               ;A5EF5F;

ExtendedSpritemap_SporeSpawn_FullyOpen_2:
    dw $0002                                                             ;A5EF61;
    dw $0000,$0000
    dw Spritemap_SporeSpawn_16                                           ;A5EF67;
    dw Hitbox_SporeSpawn_14                                              ;A5EF69;
    dw $0000,$0000                                                       ;A5EF6B;
    dw Spritemap_SporeSpawn_D                                            ;A5EF6F;
    dw Hitbox_SporeSpawn_D                                               ;A5EF71;


;;; $EF73: Spore Spawn hitboxes ;;;
Hitbox_SporeSpawn_0:
    dw $0002                                                             ;A5EF73;
    dw $FFD7,$FFE2,$0029,$001E
    dw RTL_A5804C                                                        ;A5EF7D;
    dw Common_CreateADudShot                                             ;A5EF7F;
    dw $FFF0,$FFD3,$000F,$FFE2                                           ;A5EF81;
    dw RTL_A5804C                                                        ;A5EF89;
    dw Common_CreateADudShot                                             ;A5EF8B;

Hitbox_SporeSpawn_1:
    dw $0002                                                             ;A5EF8D;
    dw $FFD7,$FFE2,$0029,$001E
    dw EnemyTouch_SporeSpawn                                             ;A5EF97;
    dw Common_CreateADudShot                                             ;A5EF99;
    dw $FFF0,$FFD3,$000F,$FFE2                                           ;A5EF9B;
    dw EnemyTouch_SporeSpawn                                             ;A5EFA3;
    dw Common_CreateADudShot                                             ;A5EFA5;

Hitbox_SporeSpawn_2:
    dw $0002                                                             ;A5EFA7;
    dw $FFD4,$FFDD,$002B,$0021
    dw EnemyTouch_SporeSpawn                                             ;A5EFB1;
    dw Common_CreateADudShot                                             ;A5EFB3;
    dw $FFF0,$FFCF,$000F,$FFDD                                           ;A5EFB5;
    dw EnemyTouch_SporeSpawn                                             ;A5EFBD;
    dw Common_CreateADudShot                                             ;A5EFBF;

Hitbox_SporeSpawn_3:
    dw $0004                                                             ;A5EFC1;
    dw $FFD3,$FFDA,$002C,$FFF7
    dw EnemyTouch_SporeSpawn                                             ;A5EFCB;
    dw Common_CreateADudShot                                             ;A5EFCD;
    dw $FFD3,$0008,$002C,$0023                                           ;A5EFCF;
    dw EnemyTouch_SporeSpawn                                             ;A5EFD7;
    dw Common_CreateADudShot                                             ;A5EFD9;
    dw $FFF1,$FFE8,$000E,$0017                                           ;A5EFDB;
    dw EnemyTouch_SporeSpawn                                             ;A5EFE3;
    dw EnemyShot_SporeSpawn_Vulnerable                                   ;A5EFE5;
    dw $FFF0,$FFCA,$0010,$FFEA                                           ;A5EFE7;
    dw EnemyTouch_SporeSpawn                                             ;A5EFEF;
    dw Common_CreateADudShot                                             ;A5EFF1;

Hitbox_SporeSpawn_4:
    dw $0004                                                             ;A5EFF3;
    dw $FFD5,$FFD4,$002A,$FFF3
    dw EnemyTouch_SporeSpawn                                             ;A5EFFD;
    dw Common_CreateADudShot                                             ;A5EFFF;
    dw $FFD4,$000C,$002A,$002A                                           ;A5F001;
    dw EnemyTouch_SporeSpawn                                             ;A5F009;
    dw Common_CreateADudShot                                             ;A5F00B;
    dw $FFF1,$FFE8,$000E,$0017                                           ;A5F00D;
    dw EnemyTouch_SporeSpawn                                             ;A5F015;
    dw EnemyShot_SporeSpawn_Vulnerable                                   ;A5F017;
    dw $FFF0,$FFC6,$0010,$FFD6                                           ;A5F019;
    dw EnemyTouch_SporeSpawn                                             ;A5F021;
    dw Common_CreateADudShot                                             ;A5F023;

Hitbox_SporeSpawn_5:
    dw $0004                                                             ;A5F025;
    dw $FFD3,$FFD1,$002C,$FFEF
    dw EnemyTouch_SporeSpawn                                             ;A5F02F;
    dw Common_CreateADudShot                                             ;A5F031;
    dw $FFD4,$0010,$002B,$002E                                           ;A5F033;
    dw EnemyTouch_SporeSpawn                                             ;A5F03B;
    dw Common_CreateADudShot                                             ;A5F03D;
    dw $FFF1,$FFE8,$000E,$0017                                           ;A5F03F;
    dw EnemyTouch_SporeSpawn                                             ;A5F047;
    dw EnemyShot_SporeSpawn_Vulnerable                                   ;A5F049;
    dw $FFF0,$FFC2,$0010,$FFD3                                           ;A5F04B;
    dw EnemyTouch_SporeSpawn                                             ;A5F053;
    dw Common_CreateADudShot                                             ;A5F055;

Hitbox_SporeSpawn_6:
    dw $0004                                                             ;A5F057;
    dw $FFD4,$FFCE,$002D,$FFEB
    dw EnemyTouch_SporeSpawn                                             ;A5F061;
    dw Common_CreateADudShot                                             ;A5F063;
    dw $FFD5,$0014,$002B,$0032                                           ;A5F065;
    dw EnemyTouch_SporeSpawn                                             ;A5F06D;
    dw Common_CreateADudShot                                             ;A5F06F;
    dw $FFF1,$FFE8,$000E,$0017                                           ;A5F071;
    dw EnemyTouch_SporeSpawn                                             ;A5F079;
    dw EnemyShot_SporeSpawn_Vulnerable                                   ;A5F07B;
    dw $FFF0,$FFC0,$0010,$FFD0                                           ;A5F07D;
    dw EnemyTouch_SporeSpawn                                             ;A5F085;
    dw Common_CreateADudShot                                             ;A5F087;

Hitbox_SporeSpawn_7:
    dw $0002                                                             ;A5F089;
    dw $FFD2,$FFDD,$002C,$0023
    dw EnemyTouch_SporeSpawn                                             ;A5F093;
    dw Common_CreateADudShot                                             ;A5F095;
    dw $FFF0,$FFD0,$0010,$FFE0                                           ;A5F097;
    dw EnemyTouch_SporeSpawn                                             ;A5F09F;
    dw Common_CreateADudShot                                             ;A5F0A1;

Hitbox_SporeSpawn_8:
    dw $0004                                                             ;A5F0A3;
    dw $FFD3,$FFD9,$002D,$FFF7
    dw EnemyTouch_SporeSpawn                                             ;A5F0AD;
    dw Common_CreateADudShot                                             ;A5F0AF;
    dw $FFD4,$0008,$002C,$0026                                           ;A5F0B1;
    dw EnemyTouch_SporeSpawn                                             ;A5F0B9;
    dw Common_CreateADudShot                                             ;A5F0BB;
    dw $FFF1,$FFE8,$000E,$0017                                           ;A5F0BD;
    dw EnemyTouch_SporeSpawn                                             ;A5F0C5;
    dw EnemyShot_SporeSpawn_Vulnerable                                   ;A5F0C7;
    dw $FFF0,$FFCA,$0010,$FFE0                                           ;A5F0C9;
    dw EnemyTouch_SporeSpawn                                             ;A5F0D1;
    dw Common_CreateADudShot                                             ;A5F0D3;

Hitbox_SporeSpawn_9:
    dw $0004                                                             ;A5F0D5;
    dw $FFD3,$FFD4,$002D,$FFF3
    dw EnemyTouch_SporeSpawn                                             ;A5F0DF;
    dw Common_CreateADudShot                                             ;A5F0E1;
    dw $FFD6,$000C,$002A,$002B                                           ;A5F0E3;
    dw EnemyTouch_SporeSpawn                                             ;A5F0EB;
    dw Common_CreateADudShot                                             ;A5F0ED;
    dw $FFF1,$FFE8,$000E,$0017                                           ;A5F0EF;
    dw EnemyTouch_SporeSpawn                                             ;A5F0F7;
    dw EnemyShot_SporeSpawn_Vulnerable                                   ;A5F0F9;
    dw $FFF0,$FFC6,$0010,$FFE0                                           ;A5F0FB;
    dw EnemyTouch_SporeSpawn                                             ;A5F103;
    dw Common_CreateADudShot                                             ;A5F105;

Hitbox_SporeSpawn_A:
    dw $0004                                                             ;A5F107;
    dw $FFD4,$FFD1,$0029,$FFEF
    dw EnemyTouch_SporeSpawn                                             ;A5F111;
    dw Common_CreateADudShot                                             ;A5F113;
    dw $FFD4,$0010,$002C,$002D                                           ;A5F115;
    dw EnemyTouch_SporeSpawn                                             ;A5F11D;
    dw Common_CreateADudShot                                             ;A5F11F;
    dw $FFF1,$FFE8,$000E,$0017                                           ;A5F121;
    dw EnemyTouch_SporeSpawn                                             ;A5F129;
    dw EnemyShot_SporeSpawn_Vulnerable                                   ;A5F12B;
    dw $FFF0,$FFC3,$0010,$FFD2                                           ;A5F12D;
    dw EnemyTouch_SporeSpawn                                             ;A5F135;
    dw Common_CreateADudShot                                             ;A5F137;

Hitbox_SporeSpawn_B:
    dw $0001                                                             ;A5F139;
    dw $FFF1,$FFE8,$000E,$0017
    dw EnemyTouch_SporeSpawn                                             ;A5F143;
    dw EnemyShot_SporeSpawn_Vulnerable                                   ;A5F145;

Hitbox_SporeSpawn_C:
    dw $0001                                                             ;A5F147;
    dw $FFF1,$FFE8,$000E,$0017
    dw EnemyTouch_SporeSpawn                                             ;A5F151;
    dw EnemyShot_SporeSpawn_Vulnerable                                   ;A5F153;

Hitbox_SporeSpawn_D:
    dw $0001                                                             ;A5F155;
    dw $FFF1,$FFE8,$000E,$0017
    dw EnemyTouch_SporeSpawn                                             ;A5F15F;
    dw Common_CreateADudShot                                             ;A5F161;

Hitbox_SporeSpawn_E:
    dw $0001                                                             ;A5F163;
    dw $FFF8,$FFF8,$0007,$0007
    dw EnemyTouch_SporeSpawn                                             ;A5F16D;
    dw Common_CreateADudShot                                             ;A5F16F;

Hitbox_SporeSpawn_F:
    dw $0001                                                             ;A5F171;
    dw $FFF8,$FFF8,$0007,$0006
    dw EnemyTouch_SporeSpawn                                             ;A5F17B;
    dw Common_CreateADudShot                                             ;A5F17D;

Hitbox_SporeSpawn_10:
    dw $0001                                                             ;A5F17F;
    dw $FFF8,$FFF8,$0007,$0006
    dw EnemyTouch_SporeSpawn                                             ;A5F189;
    dw Common_CreateADudShot                                             ;A5F18B;

Hitbox_SporeSpawn_11:
    dw $0001                                                             ;A5F18D;
    dw $FFF8,$FFF8,$0007,$0006
    dw EnemyTouch_SporeSpawn                                             ;A5F197;
    dw EnemyShot_SporeSpawn_Vulnerable                                   ;A5F199;

Hitbox_SporeSpawn_12:
    dw $0001                                                             ;A5F19B;
    dw $FFFC,$FFFC,$0003,$0003
    dw EnemyTouch_SporeSpawn                                             ;A5F1A5;
    dw EnemyShot_SporeSpawn_Vulnerable                                   ;A5F1A7;

Hitbox_SporeSpawn_13:
    dw $0004                                                             ;A5F1A9;
    dw $FFD4,$FFCB,$002C,$FFE9
    dw EnemyTouch_SporeSpawn                                             ;A5F1B3;
    dw Common_CreateADudShot                                             ;A5F1B5;
    dw $FFD4,$0016,$002B,$0034                                           ;A5F1B7;
    dw EnemyTouch_SporeSpawn                                             ;A5F1BF;
    dw Common_CreateADudShot                                             ;A5F1C1;
    dw $FFF1,$FFE8,$000E,$0017                                           ;A5F1C3;
    dw EnemyTouch_SporeSpawn                                             ;A5F1CB;
    dw EnemyShot_SporeSpawn_Vulnerable                                   ;A5F1CD;
    dw $FFF0,$FFBC,$0010,$FFD0                                           ;A5F1CF;
    dw EnemyTouch_SporeSpawn                                             ;A5F1D7;
    dw Common_CreateADudShot                                             ;A5F1D9;

Hitbox_SporeSpawn_14:
    dw $0004                                                             ;A5F1DB;
    dw $FFD4,$FFC9,$002B,$FFE7
    dw EnemyTouch_SporeSpawn                                             ;A5F1E5;
    dw Common_CreateADudShot                                             ;A5F1E7;
    dw $FFD3,$0018,$002B,$0037                                           ;A5F1E9;
    dw EnemyTouch_SporeSpawn                                             ;A5F1F1;
    dw Common_CreateADudShot                                             ;A5F1F3;
    dw $FFF1,$FFE7,$000E,$0018                                           ;A5F1F5;
    dw EnemyTouch_SporeSpawn                                             ;A5F1FD;
    dw EnemyShot_SporeSpawn_Vulnerable                                   ;A5F1FF;
    dw $FFF0,$FFBB,$0010,$FFD0                                           ;A5F201;
    dw EnemyTouch_SporeSpawn                                             ;A5F209;
    dw Common_CreateADudShot                                             ;A5F20B;


;;; $F20D: Spore Spawn spritemaps ;;;
Spritemap_SporeSpawn_0:
    dw $001A                                                             ;A5F20D;
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
    dw $001E                                                             ;A5F291;
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
    dw $0022                                                             ;A5F329;
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
    dw $0022                                                             ;A5F3D5;
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
    dw $0022                                                             ;A5F481;
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
    dw $001A                                                             ;A5F52D;
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
    dw $001A                                                             ;A5F5B1;
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
    dw $001A                                                             ;A5F635;
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
    dw $001A                                                             ;A5F6B9;
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
    dw $001A                                                             ;A5F73D;
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
    dw $0006                                                             ;A5F7C1;
    %spritemapEntry(1, $00, $F8, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $00, $E8, 1, 1, 2, 0, $126)
    %spritemapEntry(1, $00, $08, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $1F0, $E8, 1, 0, 2, 0, $126)
    %spritemapEntry(1, $1F0, $08, 0, 0, 2, 0, $126)

Spritemap_SporeSpawn_C:
    dw $0006                                                             ;A5F7E1;
    %spritemapEntry(1, $00, $F8, 0, 1, 2, 0, $108)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $00, $E8, 1, 1, 2, 0, $128)
    %spritemapEntry(1, $1F0, $E8, 1, 0, 2, 0, $128)
    %spritemapEntry(1, $00, $08, 0, 1, 2, 0, $128)
    %spritemapEntry(1, $1F0, $08, 0, 0, 2, 0, $128)

Spritemap_SporeSpawn_D:
    dw $0006                                                             ;A5F801;
    %spritemapEntry(1, $00, $F8, 0, 1, 2, 0, $10A)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 2, 0, $10A)
    %spritemapEntry(1, $00, $E8, 1, 1, 2, 0, $12A)
    %spritemapEntry(1, $1F0, $E8, 1, 0, 2, 0, $12A)
    %spritemapEntry(1, $00, $08, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $1F0, $08, 0, 0, 2, 0, $12A)

Spritemap_SporeSpawn_E:
    dw $0001                                                             ;A5F821;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $140)

Spritemap_SporeSpawn_F:
    dw $0001                                                             ;A5F828;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10C)

Spritemap_SporeSpawn_10:
    dw $0001                                                             ;A5F82F;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10E)

Spritemap_SporeSpawn_11:
    dw $0001                                                             ;A5F836;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $12C)

Spritemap_SporeSpawn_12:
    dw $0001                                                             ;A5F83D;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $13E)

Spritemap_SporeSpawn_13:
    dw $0001                                                             ;A5F844;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $12F)

Spritemap_SporeSpawn_14:
    dw $0001                                                             ;A5F84B;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $12E)

Spritemap_SporeSpawn_15:
    dw $001A                                                             ;A5F852;
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
    dw $001A                                                             ;A5F8D6;
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


Freespace_BankA5_F95A:                                                   ;A5F95A;
; $6A6 bytes
