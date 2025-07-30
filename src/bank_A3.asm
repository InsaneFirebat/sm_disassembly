
; Enemy AI: Waver, Metaree, Fireflea, Skultera, Elevator, Sciser, Zero, Tripper, Sbug, Mochtroid, Sidehoppers, Zoa, Viola, Bang, Skree, Yard, Reflec, HZoomer, MZoomer, Zoomer, Zeela, Sova, Metroid

org $A38000


; Common to all enemy code banks

;;; $8000: Grapple AI - no interaction. Also unfreezes enemies(!) ;;;
CommonA3_GrappleAI_NoInteraction:
; Used by skultera, Draygon body, fire arc, Phantoon, etecoon, dachora and WS ghost
    JSL.L GrappleAI_SwitchEnemyAIToMainAI                                ;A38000;
    RTL                                                                  ;A38004;


;;; $8005: Grapple AI - Samus latches on ;;;
CommonA3_GrappleAI_SamusLatchesOn:
; Used by gripper and Crocomire
    JSL.L GrappleAI_SamusLatchesOnWithGrapple                            ;A38005;
    RTL                                                                  ;A38009;


;;; $800A: Grapple AI - kill enemy ;;;
CommonA3_GrappleAI_KillEnemy:
; Common
    JSL.L GrappleAI_EnemyGrappleDeath                                    ;A3800A;
    RTL                                                                  ;A3800E;


;;; $800F: Grapple AI - cancel grapple beam ;;;
CommonA3_GrappleAI_CancelGrappleBeam:
; Common
    JSL.L GrappleAI_SwitchToFrozenAI                                     ;A3800F;
    RTL                                                                  ;A38013;


;;; $8014: Grapple AI - Samus latches on - no invincibility ;;;
CommonA3_GrappleAI_SamusLatchesOn_NoInvincibility:
; Used by powamp
    JSL.L GrappleAI_SamusLatchesOnWithGrapple_NoInvincibility            ;A38014;
    RTL                                                                  ;A38018;


;;; $8019: Unused. Grapple AI - Samus latches on - paralyse enemy ;;;
UNUSED_CommonA3_GrappleAI_SamusLatchesOn_ParalyzeEnemy_A38019:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple_ParalyzeEnemy              ;A38019;
    RTL                                                                  ;A3801D;


;;; $801E: Grapple AI - hurt Samus ;;;
CommonA3_GrappleAI_HurtSamus:
; Used by WS spark
; Hurt reaction happens in $9B:B932
    JSL.L GrappleAI_SwitchToFrozenAI_duplicate                           ;A3801E;
    RTL                                                                  ;A38022;


;;; $8023: Normal enemy touch AI ;;;
CommonA3_NormalEnemyTouchAI:
    JSL.L NormalEnemyTouchAI                                             ;A38023;
    RTL                                                                  ;A38027;


;;; $8028: Normal touch AI - no death check ;;;
CommonA3_NormalTouchAI_NoDeathCheck:
    JSL.L NormalEnemyTouchAI_NoDeathCheck_External                       ;A38028;
    RTL                                                                  ;A3802C;


;;; $802D: Normal enemy shot AI ;;;
CommonA3_NormalEnemyShotAI:
    JSL.L NormalEnemyShotAI                                              ;A3802D;
    RTL                                                                  ;A38031;


;;; $8032: Normal enemy shot AI - no death check, no enemy shot graphic ;;;
CommonA3_NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic:
    JSL.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External     ;A38032;
    RTL                                                                  ;A38036;


;;; $8037: Normal enemy power bomb AI ;;;
CommonA3_NormalEnemyPowerBombAI:
    JSL.L NormalEnemyPowerBombAI                                         ;A38037;
    RTL                                                                  ;A3803B;


;;; $803C: Normal enemy power bomb AI - no death check ;;;
CommonA3_NormalEnemyPowerBombAI_NoDeathCheck:
; Kraid's power bomb AI
    JSL.L NormalEnemyPowerBombAI_NoDeathCheck_External                   ;A3803C;
    RTL                                                                  ;A38040;


;;; $8041: Normal enemy frozen AI ;;;
CommonA3_NormalEnemyFrozenAI:
    JSL.L NormalEnemyFrozenAI                                            ;A38041;
    RTL                                                                  ;A38045;


;;; $8046: Creates a dud shot ;;;
CommonA3_CreateADudShot:
    JSL.L CreateADudShot                                                 ;A38046;
    RTL                                                                  ;A3804A;


;;; $804B: RTS ;;;
RTS_A3804B:
    RTS                                                                  ;A3804B;


;;; $804C: RTL ;;;
RTL_A3804C:
    RTL                                                                  ;A3804C;


;;; $804D: Spritemap - nothing ;;;
Spritemap_CommonA3_Nothing:
    dw $0000                                                             ;A3804D;


;;; $804F: Extended spritemap - nothing ;;;
ExtendedSpritemap_CommonA3_Nothing:
    dw $0001                                                             ;A3804F;
    dw $0000,$0000
    dw Spritemap_CommonA3_Nothing                                        ;A38055;
    dw Hitbox_CommonA3_Nothing                                           ;A38057;


;;; $8059: Hitbox - nothing ;;;
Hitbox_CommonA3_Nothing:
; [n entries] [[left offset] [top offset] [right offset] [bottom offset] [p touch] [p shot]]...
    dw $0001                                                             ;A38059;
    dw $0000,$0000,$0000,$0000
    dw CommonA3_NormalEnemyTouchAI                                       ;A38063;
    dw CommonA3_NormalEnemyShotAI                                        ;A38065;


;;; $8067: Instruction list - delete enemy ;;;
InstList_CommonA3_DeleteEnemy:
    dw Instruction_CommonA3_DeleteEnemy                                  ;A38067;


;;; $8069: Two NOPs ;;;
NOPNOP_A38069:
; Used as palette by respawning enemy placeholder and Draygon's eye o_O
    NOP                                                                  ;A38069;
    NOP                                                                  ;A3806A;


;;; $806B: Instruction - Enemy.var5 = [[Y]] ;;;
Instruction_CommonA3_Enemy0FB2_InY:
; Used only by torizos (for enemy movement function) and escape etecoon (for enemy function)
    LDA.W $0000,Y                                                        ;A3806B;
    STA.W Enemy.var5,X                                                   ;A3806E;
    INY                                                                  ;A38071;
    INY                                                                  ;A38072;
    RTL                                                                  ;A38073;


;;; $8074: Instruction - Enemy.var5 = RTS ;;;
Instruction_CommonA3_SetEnemy0FB2ToRTS:
    LDA.W #RTS_A3807B                                                    ;A38074;
    STA.W Enemy.var5,X                                                   ;A38077;
    RTL                                                                  ;A3807A;


RTS_A3807B:
    RTS                                                                  ;A3807B;


;;; $807C: Instruction - delete enemy ;;;
Instruction_CommonA3_DeleteEnemy:
    LDA.W Enemy.properties,X                                             ;A3807C;
    ORA.W #$0200                                                         ;A3807F;
    STA.W Enemy.properties,X                                             ;A38082;
    PLA                                                                  ;A38085;
    PEA.W ProcessEnemyInstructions_return-1                              ;A38086;
    RTL                                                                  ;A38089;


;;; $808A: Instruction - call function [[Y]] ;;;
Instruction_CommonA3_CallFunctionInY:
    LDA.W $0000,Y                                                        ;A3808A;
    STA.B DP_Temp12                                                      ;A3808D;
    PHY                                                                  ;A3808F;
    PHX                                                                  ;A38090;
    PEA.W .manualReturn-1                                                ;A38091;
    JMP.W (DP_Temp12)                                                    ;A38094;

  .manualReturn:
    PLX                                                                  ;A38097;
    PLY                                                                  ;A38098;
    INY                                                                  ;A38099;
    INY                                                                  ;A3809A;
    RTL                                                                  ;A3809B;


;;; $809C: Instruction - call function [[Y]] with A = [[Y] + 2] ;;;
Instruction_CommonA3_CallFunctionInY_WithA:
    LDA.W $0000,Y                                                        ;A3809C;
    STA.B DP_Temp12                                                      ;A3809F;
    LDA.W $0002,Y                                                        ;A380A1;
    PHY                                                                  ;A380A4;
    PHX                                                                  ;A380A5;
    PEA.W .manualReturn-1                                                ;A380A6;
    JMP.W (DP_Temp12)                                                    ;A380A9;

  .manualReturn:
    PLX                                                                  ;A380AC;
    PLY                                                                  ;A380AD;
    TYA                                                                  ;A380AE;
    CLC                                                                  ;A380AF;
    ADC.W #$0004                                                         ;A380B0;
    TAY                                                                  ;A380B3;
    RTL                                                                  ;A380B4;


if !FEATURE_KEEP_UNREFERENCED
;;; $80B5: Unused. Instruction - call external function [[Y]] ;;;
UNUSED_Instruction_CommonA3_CallExternalFunctionInY_A380B5:
    LDA.W $0000,Y                                                        ;A380B5;
    STA.B DP_Temp12                                                      ;A380B8;
    LDA.W $0001,Y                                                        ;A380BA;
    STA.B DP_Temp13                                                      ;A380BD;
    PHX                                                                  ;A380BF;
    PHY                                                                  ;A380C0;
    JSL.L .externalFunction                                              ;A380C1;
    PLY                                                                  ;A380C5;
    PLX                                                                  ;A380C6;
    INY                                                                  ;A380C7;
    INY                                                                  ;A380C8;
    INY                                                                  ;A380C9;
    RTL                                                                  ;A380CA;

  .externalFunction:
    JML.W [DP_Temp12]                                                    ;A380CB;


;;; $80CE: Unused. Instruction - call external function [[Y]] with A = [[Y] + 3] ;;;
UNUSED_Inst_CommonA3_CallExternalFunctionInY_WithA_A380CE:
    LDA.W $0000,Y                                                        ;A380CE;
    STA.B DP_Temp12                                                      ;A380D1;
    LDA.W $0001,Y                                                        ;A380D3;
    STA.B DP_Temp13                                                      ;A380D6;
    LDA.W $0003,Y                                                        ;A380D8;
    PHX                                                                  ;A380DB;
    PHY                                                                  ;A380DC;
    JSL.L .externalFunction                                              ;A380DD;
    PLY                                                                  ;A380E1;
    PLX                                                                  ;A380E2;
    TYA                                                                  ;A380E3;
    CLC                                                                  ;A380E4;
    ADC.W #$0005                                                         ;A380E5;
    TAY                                                                  ;A380E8;
    RTL                                                                  ;A380E9;

  .externalFunction:
    JML.W [DP_Temp12]                                                    ;A380EA;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $80ED: Instruction - go to [[Y]] ;;;
Instruction_CommonA3_GotoY:
    LDA.W $0000,Y                                                        ;A380ED;
    TAY                                                                  ;A380F0;
    RTL                                                                  ;A380F1;


;;; $80F2: Instruction - go to [[Y]] + ±[[Y]] ;;;
Instruction_CommonA3_GotoY_PlusY:
    STY.B DP_Temp12                                                      ;A380F2;
    DEY                                                                  ;A380F4;
    LDA.W $0000,Y                                                        ;A380F5;
    XBA                                                                  ;A380F8;
    BMI .highByte                                                        ;A380F9;
    AND.W #$00FF                                                         ;A380FB;
    BRA +                                                                ;A380FE;

  .highByte:
    ORA.W #$FF00                                                         ;A38100;

+   CLC                                                                  ;A38103;
    ADC.B DP_Temp12                                                      ;A38104;
    TAY                                                                  ;A38106;
    RTL                                                                  ;A38107;


;;; $8108: Instruction - decrement timer and go to [[Y]] if non-zero ;;;
Instruction_CommonA3_DecrementTimer_GotoYIfNonZero:
    DEC.W Enemy.loopCounter,X                                            ;A38108;
    BNE Instruction_CommonA3_GotoY                                       ;A3810B;
    INY                                                                  ;A3810D;
    INY                                                                  ;A3810E;
    RTL                                                                  ;A3810F;


;;; $8110: Instruction - decrement timer and go to [[Y]] if non-zero ;;;
Instruction_CommonA3_DecrementTimer_GotoYIfNonZero_duplicate:
    DEC.W Enemy.loopCounter,X                                            ;A38110;
    BNE Instruction_CommonA3_GotoY                                       ;A38113;
    INY                                                                  ;A38115;
    INY                                                                  ;A38116;
    RTL                                                                  ;A38117;


;;; $8118: Instruction - decrement timer and go to [Y] + ±[[Y]] if non-zero ;;;
Instruction_CommonA3_DecrementTimer_GotoY_PlusY_IfNonZero:
    SEP #$20                                                             ;A38118;
    DEC.W Enemy.loopCounter,X                                            ;A3811A;
    REP #$20                                                             ;A3811D;
    BNE Instruction_CommonA3_GotoY_PlusY                                 ;A3811F;
    INY                                                                  ;A38121;
    RTL                                                                  ;A38122;


;;; $8123: Instruction - timer = [[Y]] ;;;
Instruction_CommonA3_TimerInY:
    LDA.W $0000,Y                                                        ;A38123;
    STA.W Enemy.loopCounter,X                                            ;A38126;
    INY                                                                  ;A38129;
    INY                                                                  ;A3812A;
    RTL                                                                  ;A3812B;


;;; $812C: Instruction - skip next instruction ;;;
Instruction_CommonA3_SkipNextInstruction:
    INY                                                                  ;A3812C;
    INY                                                                  ;A3812D;
    RTL                                                                  ;A3812E;


;;; $812F: Instruction - sleep ;;;
Instruction_CommonA3_Sleep:
    DEY                                                                  ;A3812F;
    DEY                                                                  ;A38130;
    TYA                                                                  ;A38131;
    STA.W Enemy.instList,X                                               ;A38132;
    PLA                                                                  ;A38135;
    PEA.W ProcessEnemyInstructions_return-1                              ;A38136;
    RTL                                                                  ;A38139;


;;; $813A: Instruction - wait [[Y]] frames ;;;
Instruction_CommonA3_WaitYFrames:
; Set instruction timer and terminate processing enemy instructions
; Used for running a delay that doesn't update graphics,
; useful for e.g. GT eye beam attack ($AA:D10D), implemented by an instruction list that has no graphical instructions,
; which allows it to be called from multiple different poses
    LDA.W $0000,Y                                                        ;A3813A;
    STA.W Enemy.instTimer,X                                              ;A3813D;
    INY                                                                  ;A38140;
    INY                                                                  ;A38141;
    TYA                                                                  ;A38142;
    STA.W Enemy.instList,X                                               ;A38143;
    PLA                                                                  ;A38146;
    PEA.W ProcessEnemyInstructions_return-1                              ;A38147;
    RTL                                                                  ;A3814A;


;;; $814B: Instruction - transfer [[Y]] bytes from [[Y] + 2] to VRAM [[Y] + 5] ;;;
Instruction_CommonA3_TransferYBytesInYToVRAM:
    PHX                                                                  ;A3814B;
    LDX.W VRAMWriteStack                                                 ;A3814C;
    LDA.W $0000,Y                                                        ;A3814F;
    STA.B VRAMWrite.size,X                                               ;A38152;
    LDA.W $0002,Y                                                        ;A38154;
    STA.B VRAMWrite.src,X                                                ;A38157;
    LDA.W $0003,Y                                                        ;A38159;
    STA.B VRAMWrite.src+1,X                                              ;A3815C;
    LDA.W $0005,Y                                                        ;A3815E;
    STA.B VRAMWrite.dest,X                                               ;A38161;
    TXA                                                                  ;A38163;
    CLC                                                                  ;A38164;
    ADC.W #$0007                                                         ;A38165;
    STA.W VRAMWriteStack                                                 ;A38168;
    TYA                                                                  ;A3816B;
    CLC                                                                  ;A3816C;
    ADC.W #$0007                                                         ;A3816D;
    TAY                                                                  ;A38170;
    PLX                                                                  ;A38171;
    RTL                                                                  ;A38172;


;;; $8173: Instruction - enable off-screen processing ;;;
Instruction_CommonA3_EnableOffScreenProcessing:
    LDA.W Enemy.properties,X                                             ;A38173;
    ORA.W #$0800                                                         ;A38176;
    STA.W Enemy.properties,X                                             ;A38179;
    RTL                                                                  ;A3817C;


;;; $817D: Instruction - disable off-screen processing ;;;
Instruction_CommonA3_DisableOffScreenProcessing:
    LDA.W Enemy.properties,X                                             ;A3817D;
    AND.W #$F7FF                                                         ;A38180;
    STA.W Enemy.properties,X                                             ;A38183;
    RTL                                                                  ;A38186;


;;; $8187: Common enemy speeds - linearly increasing ;;;
CommonA3EnemySpeeds_LinearlyIncreasing:
;        _____________________ Speed
;       |      _______________ Subspeed
;       |     |      _________ Negated speed
;       |     |     |      ___ Negated subspeed
;       |     |     |     |
  .speed:
    dw $0000                                                             ;A38187;
  .subspeed:
    dw       $0000                                                       ;A38189;
  .negatedSpeed:
    dw             $0000                                                 ;A3818B;
  .negatedSubspeed:
    dw                   $0000                                           ;A3818D;
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
CommonA3EnemySpeeds_QuadraticallyIncreasing:
; I.e. gravity
; Used by e.g. Botwoon when dying and falling to the floor
;        _____________________ Subspeed
;       |      _______________ Speed
;       |     |      _________ Negated subspeed
;       |     |     |      ___ Negated speed
;       |     |     |     |
  .subspeed:
    dw $0000                                                             ;A3838F;
  .speed:
    dw       $0000                                                       ;A38391;
  .negatedSubspeed:
    dw             $0000                                                 ;A38393;
  .negatedSpeed:
    dw                   $0000                                           ;A38395;
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


;;; $8687: Palette - enemy $D63F (waver) ;;;
Palette_Waver:
    dw $3800,$72FA,$55B0,$2845,$1801,$6210,$496B,$38C6                   ;A38687;
    dw $2C63,$241F,$1C17,$142F,$0C47,$3BE0,$2680,$1580                   ;A38697;


;;; $86A7: Instruction list - steady - facing left ;;;
InstList_Waver_Steady_FacingLeft:
    dw $0001,Spritemap_Waver_2                                           ;A386A7;
    dw Instruction_Common_Sleep                                          ;A386AB;


;;; $86AD: Instruction list - steady - facing right ;;;
InstList_Waver_Steady_FacingRight:
    dw $0001,Spritemap_Waver_7                                           ;A386AD;
    dw Instruction_Common_Sleep                                          ;A386B1;


;;; $86B3: Instruction list - spinning - facing left ;;;
InstList_Waver_Spinning_FacingLeft:
    dw $0008,Spritemap_Waver_3                                           ;A386B3;
    dw $0008,Spritemap_Waver_4                                           ;A386B7;
    dw $0008,Spritemap_Waver_0                                           ;A386BB;
    dw $0008,Spritemap_Waver_1                                           ;A386BF;
    dw Instruction_Waver_SetSpinFinishedFlag                             ;A386C3;
    dw Instruction_Common_Sleep                                          ;A386C5;


;;; $86C7: Instruction list - spinning - facing right ;;;
InstList_Waver_Spinning_FacingRight:
    dw $0008,Spritemap_Waver_8                                           ;A386C7;
    dw $0008,Spritemap_Waver_9                                           ;A386CB;
    dw $0008,Spritemap_Waver_5                                           ;A386CF;
    dw $0008,Spritemap_Waver_6                                           ;A386D3;
    dw Instruction_Waver_SetSpinFinishedFlag                             ;A386D7;
    dw Instruction_Common_Sleep                                          ;A386D9;


;;; $86DB: Instruction list pointers ;;;
InstListPointers_Waver:
; Indexed by Waver.instListIndex
    dw InstList_Waver_Steady_FacingLeft                                  ;A386DB;
    dw InstList_Waver_Steady_FacingRight                                 ;A386DD;
    dw InstList_Waver_Spinning_FacingLeft                                ;A386DF;
    dw InstList_Waver_Spinning_FacingRight                               ;A386E1;


;;; $86E3: Instruction - set spin finished flag ;;;
Instruction_Waver_SetSpinFinishedFlag:
    LDX.W EnemyIndex                                                     ;A386E3;
    LDA.W #$0001                                                         ;A386E6;
    STA.W Waver.spinFinishedFlag,X                                       ;A386E9;
    RTL                                                                  ;A386EC;


;;; $86ED: Initialisation AI - enemy $D63F (waver) ;;;
InitAI_Waver:
    LDX.W EnemyIndex                                                     ;A386ED;
    LDA.W #$0180                                                         ;A386F0;
    AND.W #$FF00                                                         ;A386F3;
    XBA                                                                  ;A386F6;
    STA.W Waver.XVelocity,X                                              ;A386F7;
    LDA.W #$0180                                                         ;A386FA;
    AND.W #$00FF                                                         ;A386FD;
    XBA                                                                  ;A38700;
    STA.W Waver.XSubVelocity,X                                           ;A38701;
    LDA.W Enemy.init0,X                                                  ;A38704;
    AND.W #$0001                                                         ;A38707;
    BNE .facingLeft                                                      ;A3870A;
    LDA.W #$0180                                                         ;A3870C;
    EOR.W #$FFFF                                                         ;A3870F;
    INC                                                                  ;A38712;
    AND.W #$FF00                                                         ;A38713;
    XBA                                                                  ;A38716;
    JSL.L Sign_Extend_A                                                  ;A38717;
    STA.W Waver.XVelocity,X                                              ;A3871B;
    LDA.W #$0180                                                         ;A3871E;
    EOR.W #$FFFF                                                         ;A38721;
    INC                                                                  ;A38724;
    AND.W #$00FF                                                         ;A38725;
    XBA                                                                  ;A38728;
    JSL.L Sign_Extend_A                                                  ;A38729;
    STA.W Waver.XSubVelocity,X                                           ;A3872D;

  .facingLeft:
    STZ.W Waver.newInstListIndex,X                                       ;A38730;
    STZ.W Waver.instListIndex,X                                          ;A38733;
    STZ.W Waver.spinFinishedFlag,X                                       ;A38736;
    LDA.W #InstList_Waver_Steady_FacingLeft                              ;A38739;
    STA.W Enemy.instList,X                                               ;A3873C;
    LDA.W Enemy.init0,X                                                  ;A3873F;
    AND.W #$0001                                                         ;A38742;
    STA.W Waver.newInstListIndex,X                                       ;A38745;
    JSR.W SetWaverInstList                                               ;A38748;
    RTL                                                                  ;A3874B;


;;; $874C: Main AI - enemy $D63F (waver) ;;;
MainAI_Waver:
    LDX.W EnemyIndex                                                     ;A3874C;
    LDA.W Waver.XSubVelocity,X                                           ;A3874F;
    STA.B DP_Temp12                                                      ;A38752;
    LDA.W Waver.XVelocity,X                                              ;A38754;
    STA.B DP_Temp14                                                      ;A38757;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A38759;
    BCC .noWallCollision                                                 ;A3875D;
    LDA.W Enemy.var0+1,X                                                 ;A3875F;
    STA.B DP_Temp12                                                      ;A38762;
    EOR.W #$FFFF                                                         ;A38764;
    INC                                                                  ;A38767;
    AND.W #$FF00                                                         ;A38768;
    XBA                                                                  ;A3876B;
    JSL.L Sign_Extend_A                                                  ;A3876C;
    STA.W Waver.XVelocity,X                                              ;A38770;
    LDA.B DP_Temp12                                                      ;A38773;
    EOR.W #$FFFF                                                         ;A38775;
    INC                                                                  ;A38778;
    AND.W #$00FF                                                         ;A38779;
    XBA                                                                  ;A3877C;
    JSL.L Sign_Extend_A                                                  ;A3877D;
    STA.W Waver.XSubVelocity,X                                           ;A38781;
    LDA.W Waver.newInstListIndex,X                                       ;A38784;
    EOR.W #$0001                                                         ;A38787;
    AND.W #$0001                                                         ;A3878A;
    STA.W Waver.newInstListIndex,X                                       ;A3878D;
    JSR.W SetWaverInstList                                               ;A38790;
    JMP.W .merge                                                         ;A38793;

  .noWallCollision:
    LDA.W #$0004                                                         ;A38796;
    STA.W Temp_Unknown0E32                                               ;A38799;
    LDA.W Waver.angle,X                                                  ;A3879C;
    AND.W #$00FF                                                         ;A3879F;
    JSL.L EightBitNegativeSineMultiplication_A0B0C6                      ;A387A2;
    STA.B DP_Temp14                                                      ;A387A6;
    STZ.B DP_Temp12                                                      ;A387A8;
    JSL.L MoveEnemyDownBy_14_12                                          ;A387AA;
    BCC .noBlockCollision                                                ;A387AE;
    LDX.W EnemyIndex                                                     ;A387B0;
    LDA.W Waver.angle,X                                                  ;A387B3;
    CLC                                                                  ;A387B6;
    ADC.W #$0080                                                         ;A387B7;
    AND.W #$00FF                                                         ;A387BA;
    STA.W Waver.angle,X                                                  ;A387BD;
    BRA .merge                                                           ;A387C0;

  .noBlockCollision:
    LDX.W EnemyIndex                                                     ;A387C2;
    LDA.W Waver.angle,X                                                  ;A387C5;
    CLC                                                                  ;A387C8;
    ADC.W #$0002                                                         ;A387C9;
    STA.W Waver.angle,X                                                  ;A387CC;

  .merge:
    LDX.W EnemyIndex                                                     ;A387CF;
    LDA.W Waver.angle,X                                                  ;A387D2;
    AND.W #$007F                                                         ;A387D5;
    CMP.W #$0038                                                         ;A387D8;
    BNE .notSpinning                                                     ;A387DB;
    LDA.W Waver.newInstListIndex,X                                       ;A387DD;
    ORA.W #$0002                                                         ;A387E0;
    STA.W Waver.newInstListIndex,X                                       ;A387E3;
    JSR.W SetWaverInstList                                               ;A387E6;

  .notSpinning:
    LDA.W Waver.spinFinishedFlag,X                                       ;A387E9;
    BEQ .return                                                          ;A387EC;
    STZ.W Waver.spinFinishedFlag,X                                       ;A387EE;
    LDA.W Waver.newInstListIndex,X                                       ;A387F1;
    AND.W #$0001                                                         ;A387F4;
    STA.W Waver.newInstListIndex,X                                       ;A387F7;
    JSR.W SetWaverInstList                                               ;A387FA;

  .return:
    RTL                                                                  ;A387FD;


;;; $87FE: Set waver instruction list ;;;
SetWaverInstList:
    LDX.W EnemyIndex                                                     ;A387FE;
    LDA.W Waver.newInstListIndex,X                                       ;A38801;
    CMP.W Waver.instListIndex,X                                          ;A38804;
    BEQ .return                                                          ;A38807;
    STA.W Waver.instListIndex,X                                          ;A38809;
    ASL                                                                  ;A3880C;
    TAY                                                                  ;A3880D;
    LDA.W InstListPointers_Waver,Y                                       ;A3880E;
    STA.W Enemy.instList,X                                               ;A38811;
    LDA.W #$0001                                                         ;A38814;
    STA.W Enemy.instTimer,X                                              ;A38817;
    STZ.W Enemy.loopCounter,X                                            ;A3881A;

  .return:
    RTS                                                                  ;A3881D;


;;; $881E: Spritemaps - waver ;;;
Spritemap_Waver_0:
    dw $0004                                                             ;A3881E;
    %spritemapEntry(0, $00, $08, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $1F8, $08, 0, 0, 2, 0, $121)
    %spritemapEntry(1, $00, $F8, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 2, 0, $100)

Spritemap_Waver_1:
    dw $0004                                                             ;A38834;
    %spritemapEntry(0, $1ED, $FC, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $05, $00, 0, 0, 2, 0, $116)
    %spritemapEntry(0, $05, $F8, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1F5, $F8, 0, 0, 2, 0, $104)

Spritemap_Waver_2:
    dw $0003                                                             ;A3884A;
    %spritemapEntry(0, $1ED, $FD, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1F5, $FD, 0, 0, 2, 0, $127)
    %spritemapEntry(1, $1FD, $F8, 0, 0, 2, 0, $107)

Spritemap_Waver_3:
    dw $0004                                                             ;A3885B;
    %spritemapEntry(0, $1EC, $FC, 0, 0, 2, 0, $129)
    %spritemapEntry(0, $04, $00, 0, 0, 2, 0, $11B)
    %spritemapEntry(0, $04, $F8, 0, 0, 2, 0, $10B)
    %spritemapEntry(1, $1F4, $F8, 0, 0, 2, 0, $109)

Spritemap_Waver_4:
    dw $0004                                                             ;A38871;
    %spritemapEntry(0, $00, $08, 0, 0, 2, 0, $12E)
    %spritemapEntry(0, $1F8, $08, 0, 0, 2, 0, $12D)
    %spritemapEntry(1, $00, $F8, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 2, 0, $10C)

Spritemap_Waver_5:
    dw $0004                                                             ;A38887;
    %spritemapEntry(0, $1F8, $08, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $00, $08, 0, 1, 2, 0, $121)
    %spritemapEntry(1, $1F0, $F8, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $00, $F8, 0, 1, 2, 0, $100)

Spritemap_Waver_6:
    dw $0004                                                             ;A3889D;
    %spritemapEntry(0, $0B, $FC, 0, 1, 2, 0, $124)
    %spritemapEntry(0, $1F3, $00, 0, 1, 2, 0, $116)
    %spritemapEntry(0, $1F3, $F8, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $1FB, $F8, 0, 1, 2, 0, $104)

Spritemap_Waver_7:
    dw $0003                                                             ;A388B3;
    %spritemapEntry(0, $0B, $FD, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $03, $FD, 0, 1, 2, 0, $127)
    %spritemapEntry(1, $1F3, $F8, 0, 1, 2, 0, $107)

Spritemap_Waver_8:
    dw $0004                                                             ;A388C4;
    %spritemapEntry(0, $0C, $FC, 0, 1, 2, 0, $129)
    %spritemapEntry(0, $1F4, $00, 0, 1, 2, 0, $11B)
    %spritemapEntry(0, $1F4, $F8, 0, 1, 2, 0, $10B)
    %spritemapEntry(1, $1FC, $F8, 0, 1, 2, 0, $109)

Spritemap_Waver_9:
    dw $0004                                                             ;A388DA;
    %spritemapEntry(0, $1F8, $08, 0, 1, 2, 0, $12E)
    %spritemapEntry(0, $00, $08, 0, 1, 2, 0, $12D)
    %spritemapEntry(1, $1F0, $F8, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $00, $F8, 0, 1, 2, 0, $10C)


;;; $88F0: Palette - enemy $D67F (metaree) ;;;
Palette_Metaree:
    dw $3800,$4D1F,$38B6,$246E,$1448,$47FF,$2EFA,$1616                   ;A388F0;
    dw $0132,$6F39,$5A73,$41AD,$2D08,$1863,$7FFF,$0041                   ;A38900;


;;; $8910: Instruction list - idling ;;;
InstList_Metaree_Idling:
    dw $000A,Spritemap_Metaree_0                                         ;A38910;
    dw $000A,Spritemap_Metaree_2                                         ;A38914;
    dw $000A,Spritemap_Metaree_3                                         ;A38918;
    dw $000A,Spritemap_Metaree_4                                         ;A3891C;
    dw Instruction_Common_GotoY                                          ;A38920;
    dw InstList_Metaree_Idling                                           ;A38922;


;;; $8924: Instruction list - prepare to launch attack ;;;
InstList_Metaree_PrepareToLaunchAttack:
    dw $0010,Spritemap_Metaree_0                                         ;A38924;
    dw $0008,Spritemap_Metaree_1                                         ;A38928;
    dw Instruction_Metaree_SetAttackReadyFlag                            ;A3892C;
    dw Instruction_Common_Sleep                                          ;A3892E;


;;; $8930: Instruction list - launched attack ;;;
InstList_Metaree_LaunchedAttack_0:
    dw Instruction_Common_EnableOffScreenProcessing                      ;A38930;

InstList_Metaree_LaunchedAttack_1:
    dw $0002,Spritemap_Metaree_2                                         ;A38932;
    dw $0002,Spritemap_Metaree_3                                         ;A38936;
    dw $0002,Spritemap_Metaree_4                                         ;A3893A;
    dw $0002,Spritemap_Metaree_0                                         ;A3893E;
    dw Instruction_Common_GotoY                                          ;A38942;
    dw InstList_Metaree_LaunchedAttack_1                                 ;A38944;


;;; $8946: Unused. Instruction list - stop animating ;;;
UNUSED_InstList_Metaree_StopAnimating_A38946:
    dw Instruction_Common_DisableOffScreenProcessing                     ;A38946;
    dw $0001,Spritemap_Metaree_0                                         ;A38948;
    dw Instruction_Common_Sleep                                          ;A3894C;


;;; $894E: Metaree instruction list pointers ;;;
InstListPointers_Metaree:
; Indexed by Metaree.instListIndex
    dw InstList_Metaree_Idling                                           ;A3894E;
    dw InstList_Metaree_PrepareToLaunchAttack                            ;A38950;
    dw InstList_Metaree_LaunchedAttack_0                                 ;A38952;
    dw UNUSED_InstList_Metaree_StopAnimating_A38946                      ;A38954;


;;; $8956: Instruction - set attack ready flag ;;;
Instruction_Metaree_SetAttackReadyFlag:
    LDX.W EnemyIndex                                                     ;A38956;
    LDA.W #$0001                                                         ;A38959;
    STA.W Enemy.var4,X                                                   ;A3895C;
    RTL                                                                  ;A3895F;


;;; $8960: Initialisation AI - enemy $D67F (metaree) ;;;
InitAI_Metaree:
    LDX.W EnemyIndex                                                     ;A38960;
    STZ.W Metaree.newInstListIndex,X                                     ;A38963;
    STZ.W Metaree.instListIndex,X                                        ;A38966;
    STZ.W Enemy.var4,X                                                   ;A38969;
    LDA.W #InstList_Metaree_Idling                                       ;A3896C;
    STA.W Enemy.instList,X                                               ;A3896F;
    LDA.W #Function_Metaree_Idling                                       ;A38972;
    STA.W Metaree.function,X                                             ;A38975;
    RTL                                                                  ;A38978;


;;; $8979: Main AI - enemy $D67F (metaree) ;;;
MainAI_Metaree:
    LDX.W EnemyIndex                                                     ;A38979;
    JMP.W (Metaree.function,X)                                           ;A3897C;


if !FEATURE_KEEP_UNREFERENCED
;;; $897F: Unused. Metaree function pointers ;;;
UNUSED_FunctionPointers_Metaree_A3897F:
    dw Function_Metaree_Idling                                           ;A3897F;
    dw Function_Metaree_PrepareToLaunchAttack                            ;A38981;
    dw Function_Metaree_LaunchedAttack                                   ;A38983;
    dw Function_Metaree_Burrowing                                        ;A38985;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8987: Metaree function - idling ;;;
Function_Metaree_Idling:
; BUG: This routine fails to check if the metaree is above Samus before activating it
;      Aside from launching the metaree when it arguably shouldn't, this causes the metaree to shoot off-screen / burrow in mid-air (see DetermineMetareeYVelocity)
    LDX.W EnemyIndex                                                     ;A38987;
    LDA.W Enemy.XPosition,X                                              ;A3898A;
    SEC                                                                  ;A3898D;
    SBC.W SamusXPosition                                                 ;A3898E;
    BPL +                                                                ;A38991;
    EOR.W #$FFFF                                                         ;A38993;
    INC                                                                  ;A38996;

+   CMP.W #$0048                                                         ;A38997;
    BCS .return                                                          ;A3899A;
    JSR.W DetermineMetareeYVelocity                                      ;A3899C;
    INC.W Metaree.newInstListIndex,X                                     ;A3899F;
    JSR.W SetMetareeInstListPointer                                      ;A389A2;
    LDA.W #Function_Metaree_PrepareToLaunchAttack                        ;A389A5;
    STA.W Metaree.function,X                                             ;A389A8;

  .return:
    RTL                                                                  ;A389AB;


;;; $89AC: Determine metaree Y velocity ;;;
DetermineMetareeYVelocity:
; This subroutine assumes SamusYPosition >= Enemy.YPosition
; If this is not the case, then due to the unsigned nature of division,
; the resulting enemy velocity will be some large value (~AAh) that makes the metaree shoot off-screen in an instant and/or hit the ground from many tiles away
    LDA.W SamusYPosition                                                 ;A389AC;
    SEC                                                                  ;A389AF;
    SBC.W Enemy.YPosition,X                                              ;A389B0;
    STA.W $4204                                                          ;A389B3;
    SEP #$20                                                             ;A389B6;
    LDA.B #$18                                                           ;A389B8;
    STA.W $4206                                                          ;A389BA;
    REP #$20                                                             ;A389BD;
    NOP                                                                  ;A389BF;
    NOP                                                                  ;A389C0;
    NOP                                                                  ;A389C1;
    NOP                                                                  ;A389C2;
    NOP                                                                  ;A389C3;
    NOP                                                                  ;A389C4;
    NOP                                                                  ;A389C5;
    LDA.W $4214                                                          ;A389C6;
    AND.W #$00FF                                                         ;A389C9;
    CLC                                                                  ;A389CC;
    ADC.W #$0004                                                         ;A389CD;
    STA.W Metaree.YVelocity,X                                            ;A389D0;
    RTS                                                                  ;A389D3;


;;; $89D4: Metaree function - prepare to launch attack ;;;
Function_Metaree_PrepareToLaunchAttack:
    LDA.W Metaree.attackReadyFlag,X                                      ;A389D4;
    BEQ .return                                                          ;A389D7;
    STZ.W Metaree.attackReadyFlag,X                                      ;A389D9;
    LDX.W EnemyIndex                                                     ;A389DC;
    INC.W Metaree.newInstListIndex,X                                     ;A389DF;
    JSR.W SetMetareeInstListPointer                                      ;A389E2;
    LDA.W #Function_Metaree_LaunchedAttack                               ;A389E5;
    STA.W Metaree.function,X                                             ;A389E8;
    LDA.W #$005B                                                         ;A389EB;
    JSL.L QueueSound_Lib2_Max6                                           ;A389EE;

  .return:
    RTL                                                                  ;A389F2;


;;; $89F3: Metaree function - launched attack ;;;
Function_Metaree_LaunchedAttack:
    LDX.W EnemyIndex                                                     ;A389F3;
    LDA.W #$0015                                                         ;A389F6;
    STA.W Metaree.burrowTimer,X                                          ;A389F9;
    LDA.W Metaree.YVelocity,X                                            ;A389FC;
    STA.B DP_Temp14                                                      ;A389FF;
    STZ.B DP_Temp12                                                      ;A38A01;
    LDA.W Enemy.properties,X                                             ;A38A03;
    ORA.W #$0003                                                         ;A38A06;
    STA.W Enemy.properties,X                                             ;A38A09;
    LDX.W EnemyIndex                                                     ;A38A0C;
    JSL.L CheckForVerticalSolidBlockCollision_SkreeMetaree               ;A38A0F;
    BCS .collision                                                       ;A38A13;
    LDX.W EnemyIndex                                                     ;A38A15;
    LDA.W Enemy.YPosition,X                                              ;A38A18;
    CLC                                                                  ;A38A1B;
    ADC.W Metaree.YVelocity,X                                            ;A38A1C;
    STA.W Enemy.YPosition,X                                              ;A38A1F;
    LDA.W #$0002                                                         ;A38A22;
    STA.W Temp_XVelocity                                                 ;A38A25;
    LDA.W Enemy.XPosition,X                                              ;A38A28;
    CMP.W SamusXPosition                                                 ;A38A2B;
    BMI .steerLeft                                                       ;A38A2E;
    LDA.W #$FFFE                                                         ;A38A30;
    STA.W Temp_XVelocity                                                 ;A38A33;

  .steerLeft:
    LDA.W Enemy.XPosition,X                                              ;A38A36;
    CLC                                                                  ;A38A39;
    ADC.W Temp_XVelocity                                                 ;A38A3A;
    STA.W Enemy.XPosition,X                                              ;A38A3D;
    BRA .return                                                          ;A38A40;

  .collision:
    LDX.W EnemyIndex                                                     ;A38A42;
    LDA.W #$0001                                                         ;A38A45;
    STA.W Enemy.instTimer,X                                              ;A38A48;
    STZ.W Enemy.loopCounter,X                                            ;A38A4B;
    LDA.W #Function_Metaree_Burrowing                                    ;A38A4E;
    STA.W Metaree.function,X                                             ;A38A51;
    LDA.W #$005C                                                         ;A38A54;
    JSL.L QueueSound_Lib2_Max6                                           ;A38A57;

  .return:
    RTL                                                                  ;A38A5B;


;;; $8A5C: Metaree function - burrowing ;;;
Function_Metaree_Burrowing:
; I have no idea why .delete does any of those three assignments
    LDX.W EnemyIndex                                                     ;A38A5C;
    DEC.W Metaree.burrowTimer,X                                          ;A38A5F;
    BEQ .delete                                                          ;A38A62;
    LDA.W Metaree.burrowTimer,X                                          ;A38A64;
    CMP.W #$0008                                                         ;A38A67;
    BNE .timerNot8                                                       ;A38A6A;
    LDX.W EnemyIndex                                                     ;A38A6C;
    LDY.W #EnemyProjectile_MetalSkreeParticles_DownRight                 ;A38A6F;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A38A72;
    LDY.W #EnemyProjectile_MetalSkreeParticles_UpRight                   ;A38A76;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A38A79;
    LDY.W #EnemyProjectile_MetalSkreeParticles_DownLeft                  ;A38A7D;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A38A80;
    LDY.W #EnemyProjectile_MetalSkreeParticles_UpLeft                    ;A38A84;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A38A87;

  .timerNot8:
    LDX.W EnemyIndex                                                     ;A38A8B;
    INC.W Enemy.YPosition,X                                              ;A38A8E;
    RTL                                                                  ;A38A91;

  .delete:
    LDX.W EnemyIndex                                                     ;A38A92;
    LDA.W Enemy.palette,X                                                ;A38A95;
    ORA.W Enemy.GFXOffset,X                                              ;A38A98;
    STA.L EnemySpawnData.VRAMTilesIndex,X                                ;A38A9B;
    LDA.W #$0A00                                                         ;A38A9F;
    STA.W Enemy.palette,X                                                ;A38AA2;
    STZ.W Enemy.GFXOffset,X                                              ;A38AA5;
    LDA.W Enemy.properties,X                                             ;A38AA8;
    ORA.W #$0200                                                         ;A38AAB;
    STA.W Enemy.properties,X                                             ;A38AAE;
    RTL                                                                  ;A38AB1;


;;; $8AB2: Set metaree instruction list pointer ;;;
SetMetareeInstListPointer:
    LDX.W EnemyIndex                                                     ;A38AB2;
    LDA.W Metaree.newInstListIndex,X                                     ;A38AB5;
    CMP.W Metaree.instListIndex,X                                        ;A38AB8;
    BEQ .return                                                          ;A38ABB;
    STA.W Metaree.instListIndex,X                                        ;A38ABD;
    ASL                                                                  ;A38AC0;
    TAY                                                                  ;A38AC1;
    LDA.W InstListPointers_Metaree,Y                                     ;A38AC2;
    STA.W Enemy.instList,X                                               ;A38AC5;
    LDA.W #$0001                                                         ;A38AC8;
    STA.W Enemy.instTimer,X                                              ;A38ACB;
    STZ.W Enemy.loopCounter,X                                            ;A38ACE;

  .return:
    RTS                                                                  ;A38AD1;


;;; $8AD2: Unused ;;;
if !FEATURE_KEEP_UNREFERENCED
UNUSED_Metaree_DataPointers_A38AD2:
    dw UNUSED_Metaree_Data_A38ADC                                        ;A38AD2;
    dw UNUSED_Metaree_Data_A38AE6                                        ;A38AD4;
    dw UNUSED_Metaree_Data_A38AF0                                        ;A38AD6;
    dw UNUSED_Metaree_Data_A38AFA                                        ;A38AD8;
    dw UNUSED_Metaree_Data_A38B04                                        ;A38ADA;

UNUSED_Metaree_Data_A38ADC:
    dw $0001,$0000,$FFFE,$0008,$000C                                     ;A38ADC;

UNUSED_Metaree_Data_A38AE6:
    dw $0001,$0000,$FFFC,$0008,$0008                                     ;A38AE6;

UNUSED_Metaree_Data_A38AF0:
    dw $0001,$0004,$0000,$0002,$000C                                     ;A38AF0;

UNUSED_Metaree_Data_A38AFA:
    dw $0001,$0000,$0000,$0008,$0008                                     ;A38AFA;

UNUSED_Metaree_Data_A38B04:
    dw $0001,$FFFC,$0000,$0002,$000C                                     ;A38B04;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8B0E: RTL ;;;
RTL_A38B0E:
    RTL                                                                  ;A38B0E;


;;; $8B0F: Enemy shot - enemy $D67F (metaree) ;;;
EnemyShot_Metaree:
    LDX.W EnemyIndex                                                     ;A38B0F;
    LDA.W Enemy.GFXOffset,X                                              ;A38B12;
    STA.W Temp_MetareeParticleVRAMTilesIndex                             ;A38B15;
    LDA.W Enemy.palette,X                                                ;A38B18;
    STA.W Temp_MetareeParticlePaletteIndex                               ;A38B1B;
    JSL.L CommonA3_NormalEnemyShotAI                                     ;A38B1E;
    LDX.W EnemyIndex                                                     ;A38B22;
    LDA.W Enemy.health,X                                                 ;A38B25;
    BNE .return                                                          ;A38B28;
    LDX.W EnemyIndex                                                     ;A38B2A;
    LDA.W Temp_MetareeParticleVRAMTilesIndex                             ;A38B2D;
    STA.W Enemy.GFXOffset,X                                              ;A38B30;
    LDA.W Temp_MetareeParticlePaletteIndex                               ;A38B33;
    STA.W Enemy.palette,X                                                ;A38B36;
    LDA.W Metaree.burrowTimer,X                                          ;A38B39;
    LDX.W EnemyIndex                                                     ;A38B3C;
    LDY.W #EnemyProjectile_MetalSkreeParticles_DownRight                 ;A38B3F;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A38B42;
    LDY.W #EnemyProjectile_MetalSkreeParticles_UpRight                   ;A38B46;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A38B49;
    LDY.W #EnemyProjectile_MetalSkreeParticles_DownLeft                  ;A38B4D;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A38B50;
    LDY.W #EnemyProjectile_MetalSkreeParticles_UpLeft                    ;A38B54;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A38B57;
    LDX.W EnemyIndex                                                     ;A38B5B;
    STZ.W Enemy.GFXOffset,X                                              ;A38B5E;
    STZ.W Enemy.palette,X                                                ;A38B61;

  .return:
    RTL                                                                  ;A38B64;


;;; $8B65: Metaree spritemaps ;;;
Spritemap_Metaree_0:
    dw $0009                                                             ;A38B65;
    %spritemapEntry(0, $04, $F5, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $04, $FD, 0, 1, 2, 0, $123)
    %spritemapEntry(0, $04, $05, 0, 1, 2, 0, $124)
    %spritemapEntry(0, $1F4, $05, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $1F4, $FD, 0, 0, 2, 0, $123)
    %spritemapEntry(0, $1F4, $F5, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $00, $03, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $1F8, $03, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1F8, $F3, 0, 0, 2, 0, $100)

Spritemap_Metaree_1:
    dw $0007                                                             ;A38B94;
    %spritemapEntry(0, $05, $03, 0, 1, 2, 0, $127)
    %spritemapEntry(0, $1F3, $03, 0, 0, 2, 0, $127)
    %spritemapEntry(0, $05, $FB, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $1F3, $FB, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $05, $F3, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $1F3, $F3, 0, 0, 2, 0, $125)
    %spritemapEntry(1, $1F8, $F3, 0, 0, 2, 0, $102)

Spritemap_Metaree_2:
    dw $0007                                                             ;A38BB9;
    %spritemapEntry(1, $1F5, $03, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1F5, $F3, 0, 0, 2, 0, $104)
    %spritemapEntry(0, $00, $03, 0, 0, 2, 0, $121)
    %spritemapEntry(1, $1F8, $F3, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $00, $03, 0, 0, 2, 0, $12A)
    %spritemapEntry(0, $00, $FB, 0, 0, 2, 0, $129)
    %spritemapEntry(0, $00, $F3, 0, 0, 2, 0, $128)

Spritemap_Metaree_3:
    dw $0002                                                             ;A38BDE;
    %spritemapEntry(1, $1F8, $03, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1F8, $F3, 0, 0, 2, 0, $10C)

Spritemap_Metaree_4:
    dw $0007                                                             ;A38BEA;
    %spritemapEntry(1, $1FB, $03, 0, 0, 2, 0, $10A)
    %spritemapEntry(1, $1FB, $F3, 0, 0, 2, 0, $108)
    %spritemapEntry(0, $1F8, $03, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1F8, $F3, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $1F8, $03, 0, 1, 2, 0, $12A)
    %spritemapEntry(0, $1F8, $FB, 0, 1, 2, 0, $129)
    %spritemapEntry(0, $1F8, $F3, 0, 1, 2, 0, $128)


;;; $8C0F: Palette - enemy $D6BF (fireflea) ;;;
Palette_Fireflea:
    dw $3800,$02FF,$01BF,$000F,$0008,$01BF,$011B,$00BA                   ;A38C0F;
    dw $0011,$7F5A,$5D45,$40C3,$2462,$53E9,$3AC6,$1961                   ;A38C1F;


;;; $8C2F: Instruction list - fireflea ;;;
InstList_Fireflea:
    dw $0002,Spritemap_Fireflea_0                                        ;A38C2F;
    dw $0001,Spritemap_Fireflea_1                                        ;A38C33;
    dw $0002,Spritemap_Fireflea_2                                        ;A38C37;
    dw $0001,Spritemap_Fireflea_1                                        ;A38C3B;
    dw $0002,Spritemap_Fireflea_0                                        ;A38C3F;
    dw $0001,Spritemap_Fireflea_1                                        ;A38C43;
    dw $0002,Spritemap_Fireflea_2                                        ;A38C47;
    dw $0001,Spritemap_Fireflea_1                                        ;A38C4B;
    dw $0002,Spritemap_Fireflea_3                                        ;A38C4F;
    dw $0001,Spritemap_Fireflea_4                                        ;A38C53;
    dw $0002,Spritemap_Fireflea_5                                        ;A38C57;
    dw $0001,Spritemap_Fireflea_4                                        ;A38C5B;
    dw $0002,Spritemap_Fireflea_6                                        ;A38C5F;
    dw $0001,Spritemap_Fireflea_7                                        ;A38C63;
    dw $0002,Spritemap_Fireflea_8                                        ;A38C67;
    dw $0001,Spritemap_Fireflea_7                                        ;A38C6B;
    dw $0002,Spritemap_Fireflea_9                                        ;A38C6F;
    dw $0001,Spritemap_Fireflea_A                                        ;A38C73;
    dw $0002,Spritemap_Fireflea_B                                        ;A38C77;
    dw $0001,Spritemap_Fireflea_A                                        ;A38C7B;
    dw $0002,Spritemap_Fireflea_C                                        ;A38C7F;
    dw $0001,Spritemap_Fireflea_D                                        ;A38C83;
    dw $0002,Spritemap_Fireflea_E                                        ;A38C87;
    dw $0001,Spritemap_Fireflea_D                                        ;A38C8B;
    dw $0002,Spritemap_Fireflea_F                                        ;A38C8F;
    dw $0001,Spritemap_Fireflea_10                                       ;A38C93;
    dw $0002,Spritemap_Fireflea_11                                       ;A38C97;
    dw $0001,Spritemap_Fireflea_10                                       ;A38C9B;
    dw $0002,Spritemap_Fireflea_12                                       ;A38C9F;
    dw $0001,Spritemap_Fireflea_13                                       ;A38CA3;
    dw $0002,Spritemap_Fireflea_14                                       ;A38CA7;
    dw $0001,Spritemap_Fireflea_13                                       ;A38CAB;
    dw $0002,Spritemap_Fireflea_F                                        ;A38CAF;
    dw $0001,Spritemap_Fireflea_10                                       ;A38CB3;
    dw $0002,Spritemap_Fireflea_11                                       ;A38CB7;
    dw $0001,Spritemap_Fireflea_10                                       ;A38CBB;
    dw $0002,Spritemap_Fireflea_C                                        ;A38CBF;
    dw $0001,Spritemap_Fireflea_D                                        ;A38CC3;
    dw $0002,Spritemap_Fireflea_E                                        ;A38CC7;
    dw $0001,Spritemap_Fireflea_D                                        ;A38CCB;
    dw $0002,Spritemap_Fireflea_9                                        ;A38CCF;
    dw $0001,Spritemap_Fireflea_A                                        ;A38CD3;
    dw $0002,Spritemap_Fireflea_B                                        ;A38CD7;
    dw $0001,Spritemap_Fireflea_A                                        ;A38CDB;
    dw $0002,Spritemap_Fireflea_6                                        ;A38CDF;
    dw $0001,Spritemap_Fireflea_7                                        ;A38CE3;
    dw $0002,Spritemap_Fireflea_8                                        ;A38CE7;
    dw $0001,Spritemap_Fireflea_7                                        ;A38CEB;
    dw $0002,Spritemap_Fireflea_3                                        ;A38CEF;
    dw $0001,Spritemap_Fireflea_4                                        ;A38CF3;
    dw $0002,Spritemap_Fireflea_5                                        ;A38CF7;
    dw $0001,Spritemap_Fireflea_4                                        ;A38CFB;
    dw Instruction_Common_GotoY                                          ;A38CFF;
    dw InstList_Fireflea                                                 ;A38D01;


;;; $8D03: Fireflea data ;;;
if !FEATURE_KEEP_UNREFERENCED
UNUSED_Fireflea_Data_A38D03:
    dw $1000,$2000,$4000,$6000,$8000,$A000,$C000,$E000                   ;A38D03;

UNUSED_Fireflea_Data_A38D13:
    dw $0001,$2001,$4001,$6001,$8001                                     ;A38D13;
endif ; !FEATURE_KEEP_UNREFERENCED

FirefleaMovementRadii:
; Movement radii. Indexed by [enemy parameter 2 high] * 2
    dw $0008,$0010,$0018,$0020,$0028,$0030,$0038,$0040                   ;A38D1D;


;;; $8D2D: Initialisation AI - enemy $D6BF (fireflea) ;;;
InitAI_Fireflea:
    LDX.W EnemyIndex                                                     ;A38D2D;
    LDA.W #InstList_Fireflea                                             ;A38D30;
    STA.W Enemy.instList,X                                               ;A38D33;
    LDA.W Enemy.init0,X                                                  ;A38D36;
    AND.W #$00FF                                                         ;A38D39;
    STA.B DP_Temp12                                                      ;A38D3C;
    AND.W #$0002                                                         ;A38D3E;
    BNE .circleMovement                                                  ;A38D41;
    JSR.W SetFirefleaSpeed                                               ;A38D43;
    JSR.W SetFirefleaRadius                                              ;A38D46;
    JSR.W SetFirefleaMinMaxYPositions                                    ;A38D49;
    RTL                                                                  ;A38D4C;

  .circleMovement:
    JSR.W SetFirefleaCenter                                              ;A38D4D;
    JSR.W SetInitialFirefleaAngle                                        ;A38D50;
    JSR.W SetFirefleaSpeed                                               ;A38D53;
    JSR.W SetFirefleaRadius                                              ;A38D56;
    JSR.W SetInitialCirclingFirefleaPosition                             ;A38D59;
    RTL                                                                  ;A38D5C;


;;; $8D5D: Set fireflea center ;;;
SetFirefleaCenter:
    LDA.W Enemy.XPosition,X                                              ;A38D5D;
    STA.W Fireflea.XCenter,X                                             ;A38D60;
    LDA.W Enemy.YPosition,X                                              ;A38D63;
    STA.W Fireflea.YCenter,X                                             ;A38D66;
    RTS                                                                  ;A38D69;


;;; $8D6A: Set initial fireflea angle ;;;
SetInitialFirefleaAngle:
    LDA.W Enemy.init0+1,X                                                ;A38D6A;
    AND.W #$00FF                                                         ;A38D6D;
    XBA                                                                  ;A38D70;
    STA.W Fireflea.angle,X                                               ;A38D71;
    RTS                                                                  ;A38D74;


;;; $8D75: Set fireflea speed ;;;
SetFirefleaSpeed:
    LDA.W Enemy.init1,X                                                  ;A38D75;
    AND.W #$00FF                                                         ;A38D78;
    ASL                                                                  ;A38D7B;
    ASL                                                                  ;A38D7C;
    ASL                                                                  ;A38D7D;
    TAY                                                                  ;A38D7E;
    LDA.B DP_Temp12                                                      ;A38D7F;
    AND.W #$0001                                                         ;A38D81;
    BNE +                                                                ;A38D84;
    INY                                                                  ;A38D86;
    INY                                                                  ;A38D87;
    INY                                                                  ;A38D88;
    INY                                                                  ;A38D89;

+   TYA                                                                  ;A38D8A;
    STA.L Fireflea.speedTableIndex,X                                     ;A38D8B;
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,Y                         ;A38D8F;
    STA.W Fireflea.angleDelta,X                                          ;A38D92;
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,Y                       ;A38D95;
    STA.W Fireflea.subAngleDelta,X                                       ;A38D98;
    RTS                                                                  ;A38D9B;


;;; $8D9C: Set fireflea radius ;;;
SetFirefleaRadius:
    LDA.W Enemy.init1+1,X                                                ;A38D9C;
    AND.W #$00FF                                                         ;A38D9F;
    ASL                                                                  ;A38DA2;
    TAY                                                                  ;A38DA3;
    LDA.W FirefleaMovementRadii,Y                                        ;A38DA4;
    AND.W #$00FF                                                         ;A38DA7;
    STA.W Fireflea.radius,X                                              ;A38DAA;
    RTS                                                                  ;A38DAD;


;;; $8DAE: Set initial circling fireflea position ;;;
SetInitialCirclingFirefleaPosition:
; This seems to be missing a division by 100h of the enemy angle,
; which is of little consequence as the main AI sets the position every frame anyway
    LDA.W Fireflea.radius,X                                              ;A38DAE;
    STA.W Temp_Unknown0E32                                               ;A38DB1;
    LDA.W Enemy.var3,X                                                   ;A38DB4;
    JSL.L EightBitCosineMultiplication_A0B0B2                            ;A38DB7;
    CLC                                                                  ;A38DBB;
    ADC.W Fireflea.XCenter,X                                             ;A38DBC;
    STA.W Enemy.XPosition,X                                              ;A38DBF;
    LDA.W Fireflea.radius,X                                              ;A38DC2;
    STA.W Temp_Unknown0E32                                               ;A38DC5;
    LDA.W Enemy.var3,X                                                   ;A38DC8;
    JSL.L EightBitNegativeSineMultiplication_A0B0C6                      ;A38DCB;
    CLC                                                                  ;A38DCF;
    ADC.W Fireflea.YCenter,X                                             ;A38DD0;
    STA.W Enemy.YPosition,X                                              ;A38DD3;
    RTS                                                                  ;A38DD6;


;;; $8DD7: Set Y fireflea extrema ;;;
SetFirefleaMinMaxYPositions:
    LDA.W Enemy.YPosition,X                                              ;A38DD7;
    SEC                                                                  ;A38DDA;
    SBC.W Fireflea.radius,X                                              ;A38DDB;
    STA.L Fireflea.minimumYPosition,X                                    ;A38DDE;
    LDA.W Enemy.YPosition,X                                              ;A38DE2;
    CLC                                                                  ;A38DE5;
    ADC.W Fireflea.radius,X                                              ;A38DE6;
    STA.L Fireflea.maximumYPosition,X                                    ;A38DE9;
    RTS                                                                  ;A38DED;


;;; $8DEE: Main AI - enemy $D6BF (fireflea) ;;;
MainAI_Fireflea:
    LDX.W EnemyIndex                                                     ;A38DEE;
    LDA.W Enemy.init0,X                                                  ;A38DF1;
    AND.W #$0002                                                         ;A38DF4;
    BEQ .verticalMovement                                                ;A38DF7;
    LDA.W Fireflea.radius,X                                              ;A38DF9;
    STA.W Temp_Unknown0E32                                               ;A38DFC;
    LDA.W Enemy.var3,X                                                   ;A38DFF;
    AND.W #$FF00                                                         ;A38E02;
    XBA                                                                  ;A38E05;
    JSL.L EightBitCosineMultiplication_A0B0B2                            ;A38E06;
    CLC                                                                  ;A38E0A;
    ADC.W Fireflea.XCenter,X                                             ;A38E0B;
    STA.W Enemy.XPosition,X                                              ;A38E0E;
    LDA.W Fireflea.radius,X                                              ;A38E11;
    STA.W Temp_Unknown0E32                                               ;A38E14;
    LDA.W Enemy.var3,X                                                   ;A38E17;
    AND.W #$FF00                                                         ;A38E1A;
    XBA                                                                  ;A38E1D;
    JSL.L EightBitNegativeSineMultiplication_A0B0C6                      ;A38E1E;
    CLC                                                                  ;A38E22;
    ADC.W Fireflea.YCenter,X                                             ;A38E23;
    STA.W Enemy.YPosition,X                                              ;A38E26;
    LDA.W Enemy.var3,X                                                   ;A38E29;
    CLC                                                                  ;A38E2C;
    ADC.W Enemy.var0+1,X                                                 ;A38E2D;
    STA.W Enemy.var3,X                                                   ;A38E30;
    RTL                                                                  ;A38E33;

  .verticalMovement:
    LDA.L Fireflea.speedTableIndex,X                                     ;A38E34;
    TAY                                                                  ;A38E38;
    CLC                                                                  ;A38E39;
    LDA.W Enemy.YSubPosition,X                                           ;A38E3A;
    ADC.W CommonEnemySpeeds_LinearlyIncreasing+2,Y                       ;A38E3D;
    STA.W Enemy.YSubPosition,X                                           ;A38E40;
    LDA.W Enemy.YPosition,X                                              ;A38E43;
    ADC.W CommonEnemySpeeds_LinearlyIncreasing,Y                         ;A38E46;
    STA.W Enemy.YPosition,X                                              ;A38E49;
    LDA.W Enemy.YPosition,X                                              ;A38E4C;
    CMP.L Fireflea.minimumYPosition,X                                    ;A38E4F;
    BMI +                                                                ;A38E53;
    LDA.W Enemy.YPosition,X                                              ;A38E55;
    CMP.L Fireflea.maximumYPosition,X                                    ;A38E58;
    BPL +                                                                ;A38E5C;
    RTL                                                                  ;A38E5E;

+   LDA.L Fireflea.speedTableIndex,X                                     ;A38E5F;
    EOR.W #$0004                                                         ;A38E63;
    STA.L Fireflea.speedTableIndex,X                                     ;A38E66;
    RTL                                                                  ;A38E6A;


;;; $8E6B: Enemy touch - enemy $D6BF (fireflea) ;;;
EnemyTouch_Fireflea:
; This code is pretty buggy

; If the enemy is killed by CommonA3_NormalEnemyTouchAI, then it will run the enemy death routine, which clears enemy RAM
; The call to EnemyDeath then runs the enemy death routine *again*,
; where the enemy death explosion enemy projectile will be referencing this cleared enemy RAM,
; which will cause the explosion to spawn to position (0, 0) with garbage drop chances
; The number of enemies killed will also be incremented one extra time

; If the enemy is not killed by CommonA3_NormalEnemyTouchAI, then the enemy death routine will be run with A = [enemy health] (from $A0:A480),
; in death animation > 4, which gets corrected to 0 (small explosion), so that works out fine by chance

; FirefleaFlashing_DarknessLevel is used to index $88:B070 by FX code, the table is 6 entries long, so the max index should be Ah
; If you do place 6 fireflea in a room (which vanilla does not do) and kill them all,
; the screen will get bright again because it reads beyond the table,
; which happens to result in a large value that results in the backdrop colour not being solid white
    JSL.L CommonA3_NormalEnemyTouchAI                                    ;A38E6B;
    JSL.L EnemyDeath                                                     ;A38E6F;
    LDA.W FirefleaFlashing_DarknessLevel                                 ;A38E73;
    CLC                                                                  ;A38E76;
    ADC.W #$0002                                                         ;A38E77;
    CMP.W #$000E                                                         ;A38E7A;
    BPL .return                                                          ;A38E7D;
    STA.W FirefleaFlashing_DarknessLevel                                 ;A38E7F;

  .return:
    RTL                                                                  ;A38E82;


;;; $8E83: Power bomb reaction - enemy $D6BF (fireflea) ;;;
PowerBombReaction_Fireflea:
    JSL.L CommonA3_NormalEnemyPowerBombAI                                ;A38E83;
    BRA ShotReaction_Fireflea_Common                                     ;A38E87;


;;; $8E89: Enemy shot - enemy $D6BF (fireflea) ;;;
EnemyShot_Fireflea:
    JSL.L CommonA3_NormalEnemyShotAI                                     ;A38E89; fallthrough to ShotReaction_Fireflea_Common


;;; $8E8D: Fireflea shared shot reaction ;;;
ShotReaction_Fireflea_Common:
; See EnemyTouch_Fireflea for note about fireflea darkness level
    LDX.W EnemyIndex                                                     ;A38E8D;
    LDA.W Enemy.health,X                                                 ;A38E90;
    BNE .return                                                          ;A38E93;
    LDA.W FirefleaFlashing_DarknessLevel                                 ;A38E95;
    CLC                                                                  ;A38E98;
    ADC.W #$0002                                                         ;A38E99;
    CMP.W #$000E                                                         ;A38E9C;
    BPL .return                                                          ;A38E9F;
    STA.W FirefleaFlashing_DarknessLevel                                 ;A38EA1;

  .return:
    RTL                                                                  ;A38EA4;


;;; $8EA5: Fireflea spritemaps ;;;
Spritemap_Fireflea_0:
    dw $0003                                                             ;A38EA5;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 0, $100)
    %spritemapEntry(0, $01, $F6, 0, 0, 3, 0, $121)
    %spritemapEntry(0, $1F7, $F6, 0, 0, 3, 0, $120)

Spritemap_Fireflea_1:
    dw $0003                                                             ;A38EB6;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 0, $100)
    %spritemapEntry(0, $01, $F6, 0, 0, 3, 0, $123)
    %spritemapEntry(0, $1F7, $F6, 0, 0, 3, 0, $122)

Spritemap_Fireflea_2:
    dw $0003                                                             ;A38EC7;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 0, $100)
    %spritemapEntry(0, $01, $F6, 0, 0, 3, 0, $125)
    %spritemapEntry(0, $1F7, $F6, 0, 0, 3, 0, $124)

Spritemap_Fireflea_3:
    dw $0003                                                             ;A38ED8;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 0, $102)
    %spritemapEntry(0, $01, $F6, 0, 0, 3, 0, $121)
    %spritemapEntry(0, $1F7, $F6, 0, 0, 3, 0, $120)

Spritemap_Fireflea_4:
    dw $0003                                                             ;A38EE9;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 0, $102)
    %spritemapEntry(0, $01, $F6, 0, 0, 3, 0, $123)
    %spritemapEntry(0, $1F7, $F6, 0, 0, 3, 0, $122)

Spritemap_Fireflea_5:
    dw $0003                                                             ;A38EFA;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 0, $102)
    %spritemapEntry(0, $01, $F6, 0, 0, 3, 0, $125)
    %spritemapEntry(0, $1F7, $F6, 0, 0, 3, 0, $124)

Spritemap_Fireflea_6:
    dw $0003                                                             ;A38F0B;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 0, $104)
    %spritemapEntry(0, $01, $F6, 0, 0, 3, 0, $127)
    %spritemapEntry(0, $1F7, $F6, 0, 0, 3, 0, $126)

Spritemap_Fireflea_7:
    dw $0003                                                             ;A38F1C;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 0, $104)
    %spritemapEntry(0, $01, $F6, 0, 0, 3, 0, $129)
    %spritemapEntry(0, $1F7, $F6, 0, 0, 3, 0, $128)

Spritemap_Fireflea_8:
    dw $0003                                                             ;A38F2D;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 0, $104)
    %spritemapEntry(0, $01, $F6, 0, 0, 3, 0, $12B)
    %spritemapEntry(0, $1F7, $F6, 0, 0, 3, 0, $12A)

Spritemap_Fireflea_9:
    dw $0003                                                             ;A38F3E;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 0, $106)
    %spritemapEntry(0, $01, $F6, 0, 0, 3, 0, $127)
    %spritemapEntry(0, $1F7, $F6, 0, 0, 3, 0, $126)

Spritemap_Fireflea_A:
    dw $0003                                                             ;A38F4F;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 0, $106)
    %spritemapEntry(0, $01, $F6, 0, 0, 3, 0, $129)
    %spritemapEntry(0, $1F7, $F6, 0, 0, 3, 0, $128)

Spritemap_Fireflea_B:
    dw $0003                                                             ;A38F60;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 0, $106)
    %spritemapEntry(0, $01, $F6, 0, 0, 3, 0, $12B)
    %spritemapEntry(0, $1F7, $F6, 0, 0, 3, 0, $12A)

Spritemap_Fireflea_C:
    dw $0003                                                             ;A38F71;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 0, $108)
    %spritemapEntry(0, $01, $F6, 0, 0, 3, 0, $127)
    %spritemapEntry(0, $1F7, $F6, 0, 0, 3, 0, $126)

Spritemap_Fireflea_D:
    dw $0003                                                             ;A38F82;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 0, $108)
    %spritemapEntry(0, $01, $F6, 0, 0, 3, 0, $129)
    %spritemapEntry(0, $1F7, $F6, 0, 0, 3, 0, $128)

Spritemap_Fireflea_E:
    dw $0003                                                             ;A38F93;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 0, $108)
    %spritemapEntry(0, $01, $F6, 0, 0, 3, 0, $12B)
    %spritemapEntry(0, $1F7, $F6, 0, 0, 3, 0, $12A)

Spritemap_Fireflea_F:
    dw $0003                                                             ;A38FA4;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 0, $10A)
    %spritemapEntry(0, $01, $F6, 0, 0, 3, 0, $12D)
    %spritemapEntry(0, $1F7, $F6, 0, 0, 3, 0, $12C)

Spritemap_Fireflea_10:
    dw $0003                                                             ;A38FB5;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 0, $10A)
    %spritemapEntry(0, $01, $F6, 0, 0, 3, 0, $12F)
    %spritemapEntry(0, $1F7, $F6, 0, 0, 3, 0, $12E)

Spritemap_Fireflea_11:
    dw $0003                                                             ;A38FC6;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 0, $10A)
    %spritemapEntry(0, $01, $F6, 0, 0, 3, 0, $11F)
    %spritemapEntry(0, $1F7, $F6, 0, 0, 3, 0, $11E)

Spritemap_Fireflea_12:
    dw $0003                                                             ;A38FD7;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 0, $10C)
    %spritemapEntry(0, $01, $F6, 0, 0, 3, 0, $12D)
    %spritemapEntry(0, $1F7, $F6, 0, 0, 3, 0, $12C)

Spritemap_Fireflea_13:
    dw $0003                                                             ;A38FE8;
    %spritemapEntry(0, $01, $F6, 0, 0, 3, 0, $12F)
    %spritemapEntry(0, $1F7, $F6, 0, 0, 3, 0, $12E)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 0, $10C)

Spritemap_Fireflea_14:
    dw $0003                                                             ;A38FF9;
    %spritemapEntry(0, $01, $F6, 0, 0, 3, 0, $11F)
    %spritemapEntry(0, $1F7, $F6, 0, 0, 3, 0, $11E)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 0, $10C)


;;; $900A: Palette - enemy $D6FF (skultera) ;;;
Palette_Skultera:
    dw $3800,$72FA,$55B0,$2845,$1801,$6210,$496B,$38C6                   ;A3900A;
    dw $2C63,$241F,$1C17,$142F,$0C47,$03FF,$0237,$00D1                   ;A3901A;


;;; $902A: Instruction list - swimming left ;;;
InstList_Skultera_SwimmingLeft_0:
    dw Instruction_Skultera_SetLayerTo2                                  ;A3902A;

InstList_Skultera_SwimmingLeft_1:
    dw $000E,Spritemap_Skultera_0                                        ;A3902C;
    dw $000E,Spritemap_Skultera_1                                        ;A39030;
    dw $000E,Spritemap_Skultera_2                                        ;A39034;
    dw Instruction_Common_GotoY                                          ;A39038;
    dw InstList_Skultera_SwimmingLeft_1                                  ;A3903A;


;;; $903C: Instruction list - turning right ;;;
InstList_Skultera_TurningRight:
    dw $000D,Spritemap_Skultera_3                                        ;A3903C;
    dw $000A,Spritemap_Skultera_4                                        ;A39040;
    dw $0008,Spritemap_Skultera_5                                        ;A39044;
    dw $0006,Spritemap_Skultera_6                                        ;A39048;
    dw $0006,Spritemap_Skultera_7                                        ;A3904C;
    dw $0008,Spritemap_Skultera_8                                        ;A39050;
    dw $000A,Spritemap_Skultera_9                                        ;A39054;
    dw $000D,Spritemap_Skultera_A                                        ;A39058;
    dw Instruction_Skultera_SetTurnFinishedFlag                          ;A3905C;
    dw Instruction_Common_Sleep                                          ;A3905E;


;;; $9060: Instruction list - swimming right ;;;
InstList_Skultera_SwimmingRight_0:
    dw Instruction_Skultera_SetLayerTo6                                  ;A39060;

InstList_Skultera_SwimmingRight_1:
    dw $000E,Spritemap_Skultera_B                                        ;A39062;
    dw $000E,Spritemap_Skultera_C                                        ;A39066;
    dw $000E,Spritemap_Skultera_D                                        ;A3906A;
    dw Instruction_Common_GotoY                                          ;A3906E;
    dw InstList_Skultera_SwimmingRight_1                                 ;A39070;


;;; $9072: Instruction list - turning left ;;;
InstList_Skultera_TurningLeft:
    dw $000D,Spritemap_Skultera_E                                        ;A39072;
    dw $000A,Spritemap_Skultera_F                                        ;A39076;
    dw $0008,Spritemap_Skultera_10                                       ;A3907A;
    dw $0006,Spritemap_Skultera_11                                       ;A3907E;
    dw $0006,Spritemap_Skultera_12                                       ;A39082;
    dw $0008,Spritemap_Skultera_13                                       ;A39086;
    dw $000A,Spritemap_Skultera_14                                       ;A3908A;
    dw $000D,Spritemap_Skultera_15                                       ;A3908E;
    dw Instruction_Skultera_SetTurnFinishedFlag                          ;A39092;
    dw Instruction_Common_Sleep                                          ;A39094;


;;; $9096: Instruction - enemy layer = 6 ;;;
Instruction_Skultera_SetLayerTo6:
    LDX.W EnemyIndex                                                     ;A39096;
    LDA.W #$0006                                                         ;A39099;
    STA.W Enemy.layer,X                                                  ;A3909C;
    RTL                                                                  ;A3909F;


;;; $90A0: Instruction - enemy layer = 2 ;;;
Instruction_Skultera_SetLayerTo2:
    LDX.W EnemyIndex                                                     ;A390A0;
    LDA.W #$0002                                                         ;A390A3;
    STA.W Enemy.layer,X                                                  ;A390A6;
    RTL                                                                  ;A390A9;


;;; $90AA: Instruction - set turn finished flag ;;;
Instruction_Skultera_SetTurnFinishedFlag:
    LDX.W EnemyIndex                                                     ;A390AA;
    LDA.W #$0001                                                         ;A390AD;
    STA.L Skulltera.turnFinishedFlag,X                                   ;A390B0;
    RTL                                                                  ;A390B4;


;;; $90B5: Initialisation AI - enemy $D6FF (skultera) ;;;
InitAI_Skultera:
    LDX.W EnemyIndex                                                     ;A390B5;
    LDA.W #InstList_Skultera_SwimmingLeft_0                              ;A390B8;
    STA.W Enemy.instList,X                                               ;A390BB;
    LDA.W #Function_Skultera_SwimmingLeft                                ;A390BE;
    STA.W Skulltera.function,X                                           ;A390C1;
    LDA.W Enemy.init0+1,X                                                ;A390C4;
    AND.W #$00FF                                                         ;A390C7;
    BNE .keepLeft                                                        ;A390CA;
    LDA.W #InstList_Skultera_SwimmingRight_0                             ;A390CC;
    STA.W Enemy.instList,X                                               ;A390CF;
    LDA.W #Function_Skultera_SwimmingRight                               ;A390D2;
    STA.W Skulltera.function,X                                           ;A390D5;

  .keepLeft:
    LDA.W Enemy.init0,X                                                  ;A390D8;
    AND.W #$00FF                                                         ;A390DB;
    ASL                                                                  ;A390DE;
    ASL                                                                  ;A390DF;
    ASL                                                                  ;A390E0;
    TAY                                                                  ;A390E1;
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,Y                         ;A390E2;
    STA.W Skulltera.rightVelocity,X                                      ;A390E5;
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,Y                       ;A390E8;
    STA.W Skulltera.rightSubVelocity,X                                   ;A390EB;
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+4,Y                       ;A390EE;
    STA.W Skulltera.leftVelocity,X                                       ;A390F1;
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+6,Y                       ;A390F4;
    STA.W Skulltera.leftSubVelocity,X                                    ;A390F7;
    LDA.W Enemy.init1,X                                                  ;A390FA;
    AND.W #$00FF                                                         ;A390FD;
    STA.L Skulltera.radius,X                                             ;A39100;
    LDA.W Enemy.init1+1,X                                                ;A39104;
    AND.W #$00FF                                                         ;A39107;
    STA.L Skulltera.angleDelta,X                                         ;A3910A;
    LDA.W #$0000                                                         ;A3910E;
    STA.W Skulltera.angle,X                                              ;A39111;
    STA.L Skulltera.turnFinishedFlag,X                                   ;A39114;
    LDA.L Skulltera.radius,X                                             ;A39118;
    STA.W Temp_Unknown0E32                                               ;A3911C;
    LDA.W Skulltera.angle,X                                              ;A3911F;
    JSL.L EightBitNegativeSineMultiplication_A0B0C6                      ;A39122;
    STA.L Skulltera.previousYOffset,X                                    ;A39126;
    RTL                                                                  ;A3912A;


;;; $912B: Main AI - enemy $D6FF (skultera) ;;;
MainAI_Skultera:
    LDX.W EnemyIndex                                                     ;A3912B;
    JSR.W (Skulltera.function,X)                                         ;A3912E;
    RTL                                                                  ;A39131;


;;; $9132: Skultera function - swimming left ;;;
Function_Skultera_SwimmingLeft:
    LDX.W EnemyIndex                                                     ;A39132;
    LDA.W Skulltera.leftSubVelocity,X                                    ;A39135;
    STA.B DP_Temp12                                                      ;A39138;
    LDA.W Skulltera.leftVelocity,X                                       ;A3913A;
    STA.B DP_Temp14                                                      ;A3913D;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A3913F;
    BCC .noWallCollision                                                 ;A39143;
    LDA.W #Function_Skultera_TurningRight                                ;A39145;
    STA.W Skulltera.function,X                                           ;A39148;
    LDA.W #$0001                                                         ;A3914B;
    STA.W Enemy.instTimer,X                                              ;A3914E;
    STZ.W Enemy.loopCounter,X                                            ;A39151;
    LDA.W #InstList_Skultera_TurningRight                                ;A39154;
    STA.W Enemy.instList,X                                               ;A39157;
    BRA .merge                                                           ;A3915A;

  .noWallCollision:
    LDA.L Skulltera.radius,X                                             ;A3915C;
    STA.W Temp_Unknown0E32                                               ;A39160;
    LDA.W Skulltera.angle,X                                              ;A39163;
    JSL.L EightBitNegativeSineMultiplication_A0B0C6                      ;A39166;
    STA.L Skulltera.YOffset,X                                            ;A3916A;
    SEC                                                                  ;A3916E;
    SBC.L Skulltera.previousYOffset,X                                    ;A3916F;
    STA.B DP_Temp14                                                      ;A39173;
    STZ.B DP_Temp12                                                      ;A39175;
    JSL.L MoveEnemyDownBy_14_12                                          ;A39177;
    BCC .noBlockCollision                                                ;A3917B;
    LDA.W #Function_Skultera_TurningRight                                ;A3917D;
    STA.W Skulltera.function,X                                           ;A39180;
    LDA.W #$0001                                                         ;A39183;
    STA.W Enemy.instTimer,X                                              ;A39186;
    STZ.W Enemy.loopCounter,X                                            ;A39189;
    LDA.W #InstList_Skultera_TurningRight                                ;A3918C;
    STA.W Enemy.instList,X                                               ;A3918F;
    BRA .merge                                                           ;A39192;

  .noBlockCollision:
    LDA.W Skulltera.angle,X                                              ;A39194;
    CLC                                                                  ;A39197;
    ADC.L Skulltera.angleDelta,X                                         ;A39198;
    AND.W #$00FF                                                         ;A3919C;
    STA.W Skulltera.angle,X                                              ;A3919F;

  .merge:
    LDA.L Skulltera.YOffset,X                                            ;A391A2;
    STA.L Skulltera.previousYOffset,X                                    ;A391A6;
    RTS                                                                  ;A391AA;


;;; $91AB: Skultera function - swimming right ;;;
Function_Skultera_SwimmingRight:
    LDX.W EnemyIndex                                                     ;A391AB;
    LDA.W Skulltera.rightSubVelocity,X                                   ;A391AE;
    STA.B DP_Temp12                                                      ;A391B1;
    LDA.W Skulltera.rightVelocity,X                                      ;A391B3;
    STA.B DP_Temp14                                                      ;A391B6;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A391B8;
    BCC .noWallCollision                                                 ;A391BC;
    LDA.W #Function_Skultera_TurningLeft                                 ;A391BE;
    STA.W Skulltera.function,X                                           ;A391C1;
    LDA.W #$0001                                                         ;A391C4;
    STA.W Enemy.instTimer,X                                              ;A391C7;
    STZ.W Enemy.loopCounter,X                                            ;A391CA;
    LDA.W #InstList_Skultera_TurningLeft                                 ;A391CD;
    STA.W Enemy.instList,X                                               ;A391D0;
    BRA .merge                                                           ;A391D3;

  .noWallCollision:
    LDA.L Skulltera.radius,X                                             ;A391D5;
    STA.W Temp_Unknown0E32                                               ;A391D9;
    LDA.W Skulltera.angle,X                                              ;A391DC;
    JSL.L EightBitNegativeSineMultiplication_A0B0C6                      ;A391DF;
    STA.L Skulltera.YOffset,X                                            ;A391E3;
    SEC                                                                  ;A391E7;
    SBC.L Skulltera.previousYOffset,X                                    ;A391E8;
    STA.B DP_Temp14                                                      ;A391EC;
    STZ.B DP_Temp12                                                      ;A391EE;
    JSL.L MoveEnemyDownBy_14_12                                          ;A391F0;
    BCC .noBlockCollision                                                ;A391F4;
    LDA.W #Function_Skultera_TurningLeft                                 ;A391F6;
    STA.W Skulltera.function,X                                           ;A391F9;
    LDA.W #$0001                                                         ;A391FC;
    STA.W Enemy.instTimer,X                                              ;A391FF;
    STZ.W Enemy.loopCounter,X                                            ;A39202;
    LDA.W #InstList_Skultera_TurningLeft                                 ;A39205;
    STA.W Enemy.instList,X                                               ;A39208;
    BRA .merge                                                           ;A3920B;

  .noBlockCollision:
    LDA.W Skulltera.angle,X                                              ;A3920D;
    CLC                                                                  ;A39210;
    ADC.L Skulltera.angleDelta,X                                         ;A39211;
    AND.W #$00FF                                                         ;A39215;
    STA.W Skulltera.angle,X                                              ;A39218;

  .merge:
    LDA.L Skulltera.YOffset,X                                            ;A3921B;
    STA.L Skulltera.previousYOffset,X                                    ;A3921F;
    RTS                                                                  ;A39223;


;;; $9224: Skultera function - turning right ;;;
Function_Skultera_TurningRight:
    LDX.W EnemyIndex                                                     ;A39224;
    LDA.L Skulltera.turnFinishedFlag,X                                   ;A39227;
    BEQ .return                                                          ;A3922B;
    LDA.W #$0000                                                         ;A3922D;
    STA.L Skulltera.turnFinishedFlag,X                                   ;A39230;
    LDA.W #Function_Skultera_SwimmingRight                               ;A39234;
    STA.W Skulltera.function,X                                           ;A39237;
    LDA.L Skulltera.angleDelta,X                                         ;A3923A;
    EOR.W #$FFFF                                                         ;A3923E;
    INC                                                                  ;A39241;
    STA.L Skulltera.angleDelta,X                                         ;A39242;
    LDA.W #$0001                                                         ;A39246;
    STA.W Enemy.instTimer,X                                              ;A39249;
    STZ.W Enemy.loopCounter,X                                            ;A3924C;
    LDA.W #InstList_Skultera_SwimmingRight_0                             ;A3924F;
    STA.W Enemy.instList,X                                               ;A39252;

  .return:
    RTS                                                                  ;A39255;


;;; $9256: Skultera function - turning left ;;;
Function_Skultera_TurningLeft:
    LDX.W EnemyIndex                                                     ;A39256;
    LDA.L Skulltera.turnFinishedFlag,X                                   ;A39259;
    BEQ .return                                                          ;A3925D;
    LDA.W #$0000                                                         ;A3925F;
    STA.L Skulltera.turnFinishedFlag,X                                   ;A39262;
    LDA.W #Function_Skultera_SwimmingLeft                                ;A39266;
    STA.W Skulltera.function,X                                           ;A39269;
    LDA.L Skulltera.angleDelta,X                                         ;A3926C;
    EOR.W #$FFFF                                                         ;A39270;
    INC                                                                  ;A39273;
    STA.L Skulltera.angleDelta,X                                         ;A39274;
    LDA.W #$0001                                                         ;A39278;
    STA.W Enemy.instTimer,X                                              ;A3927B;
    STZ.W Enemy.loopCounter,X                                            ;A3927E;
    LDA.W #InstList_Skultera_SwimmingLeft_0                              ;A39281;
    STA.W Enemy.instList,X                                               ;A39284;

  .return:
    RTS                                                                  ;A39287;


;;; $9288: RTL ;;;
RTL_A39288:
    RTL                                                                  ;A39288;


;;; $9289: RTL ;;;
RTL_A39289:
    RTL                                                                  ;A39289;


;;; $928A: Skultera spritemaps ;;;
Spritemap_Skultera_0:
    dw $0005                                                             ;A3928A;
    %spritemapEntry(1, $43F2, $00, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $43F2, $F0, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $1FE, $FD, 0, 0, 2, 0, $120)
    %spritemapEntry(0, $03, $FE, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $08, $FE, 0, 0, 2, 0, $123)

Spritemap_Skultera_1:
    dw $0005                                                             ;A392A5;
    %spritemapEntry(1, $43F2, $00, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $43F2, $F0, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $1FE, $FE, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $03, $00, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $08, $FE, 0, 0, 2, 0, $124)

Spritemap_Skultera_2:
    dw $0005                                                             ;A392C0;
    %spritemapEntry(1, $43F2, $00, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $43F2, $F0, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $1FE, $00, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $03, $FD, 0, 0, 2, 0, $120)
    %spritemapEntry(0, $08, $FE, 0, 0, 2, 0, $125)

Spritemap_Skultera_3:
    dw $0005                                                             ;A392DB;
    %spritemapEntry(0, $08, $FE, 0, 0, 2, 0, $123)
    %spritemapEntry(0, $03, $FE, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $1FE, $FD, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $43F2, $00, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $43F2, $F0, 0, 0, 2, 0, $100)

Spritemap_Skultera_4:
    dw $0005                                                             ;A392F6;
    %spritemapEntry(1, $43F2, $00, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $43F2, $F0, 0, 0, 2, 0, $106)
    %spritemapEntry(0, $1FC, $FE, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $01, $00, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $06, $FE, 0, 0, 2, 0, $124)

Spritemap_Skultera_5:
    dw $0004                                                             ;A39311;
    %spritemapEntry(1, $43F2, $00, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $43F2, $F0, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $1FE, $FD, 0, 0, 2, 0, $120)
    %spritemapEntry(0, $03, $FE, 0, 0, 2, 0, $125)

Spritemap_Skultera_6:
    dw $0004                                                             ;A39327;
    %spritemapEntry(1, $43F0, $00, 0, 1, 2, 0, $108)
    %spritemapEntry(1, $43F0, $F0, 0, 1, 2, 0, $106)
    %spritemapEntry(0, $1EE, $FD, 0, 1, 2, 0, $120)
    %spritemapEntry(0, $1FD, $FE, 0, 0, 2, 0, $123)

Spritemap_Skultera_7:
    dw $0003                                                             ;A3933D;
    %spritemapEntry(1, $43F2, $F0, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $43F2, $00, 0, 1, 2, 0, $102)
    %spritemapEntry(0, $1EF, $FD, 0, 1, 2, 0, $121)

Spritemap_Skultera_8:
    dw $0004                                                             ;A3934E;
    %spritemapEntry(1, $43F5, $00, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $43F5, $F0, 0, 1, 2, 0, $100)
    %spritemapEntry(0, $1F1, $00, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $1EF, $FD, 0, 1, 2, 0, $120)

Spritemap_Skultera_9:
    dw $0005                                                             ;A39364;
    %spritemapEntry(1, $43FB, $00, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $43FB, $F0, 0, 1, 2, 0, $100)
    %spritemapEntry(0, $1F7, $FD, 0, 1, 2, 0, $120)
    %spritemapEntry(0, $1F2, $00, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $1F0, $FE, 0, 1, 2, 0, $124)

Spritemap_Skultera_A:
    dw $0005                                                             ;A3937F;
    %spritemapEntry(1, $43FF, $00, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $43FF, $F0, 0, 1, 2, 0, $100)
    %spritemapEntry(0, $1FB, $00, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $1F6, $FD, 0, 1, 2, 0, $120)
    %spritemapEntry(0, $1F1, $FE, 0, 1, 2, 0, $125)

Spritemap_Skultera_B:
    dw $0005                                                             ;A3939A;
    %spritemapEntry(1, $43FE, $F0, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $43FE, $00, 0, 1, 2, 0, $104)
    %spritemapEntry(0, $1FA, $FD, 0, 1, 2, 0, $120)
    %spritemapEntry(0, $1F5, $FE, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $1F0, $FE, 0, 1, 2, 0, $123)

Spritemap_Skultera_C:
    dw $0005                                                             ;A393B5;
    %spritemapEntry(1, $43FE, $00, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $43FE, $F0, 0, 1, 2, 0, $100)
    %spritemapEntry(0, $1FA, $FE, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $1F5, $00, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $1F0, $FE, 0, 1, 2, 0, $124)

Spritemap_Skultera_D:
    dw $0005                                                             ;A393D0;
    %spritemapEntry(1, $43FE, $00, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $43FE, $F0, 0, 1, 2, 0, $100)
    %spritemapEntry(0, $1FA, $00, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $1F5, $FD, 0, 1, 2, 0, $120)
    %spritemapEntry(0, $1F0, $FE, 0, 1, 2, 0, $125)

Spritemap_Skultera_E:
    dw $0005                                                             ;A393EB;
    %spritemapEntry(0, $1F0, $FE, 0, 1, 2, 0, $123)
    %spritemapEntry(0, $1F5, $FE, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $1FA, $FD, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $43FE, $00, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $43FE, $F0, 0, 1, 2, 0, $100)

Spritemap_Skultera_F:
    dw $0005                                                             ;A39406;
    %spritemapEntry(1, $43FE, $00, 0, 1, 2, 0, $108)
    %spritemapEntry(1, $43FE, $F0, 0, 1, 2, 0, $106)
    %spritemapEntry(0, $1FC, $FE, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $1F7, $00, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $1F2, $FE, 0, 1, 2, 0, $124)

Spritemap_Skultera_10:
    dw $0004                                                             ;A39421;
    %spritemapEntry(1, $43FE, $00, 0, 1, 2, 0, $10C)
    %spritemapEntry(1, $43FE, $F0, 0, 1, 2, 0, $10A)
    %spritemapEntry(0, $1FA, $FD, 0, 1, 2, 0, $120)
    %spritemapEntry(0, $1F5, $FE, 0, 1, 2, 0, $125)

Spritemap_Skultera_11:
    dw $0004                                                             ;A39437;
    %spritemapEntry(1, $4200, $00, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $4200, $F0, 0, 0, 2, 0, $106)
    %spritemapEntry(0, $0A, $FD, 0, 0, 2, 0, $120)
    %spritemapEntry(0, $1FB, $FE, 0, 1, 2, 0, $123)

Spritemap_Skultera_12:
    dw $0003                                                             ;A3944D;
    %spritemapEntry(1, $43FE, $F0, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $43FE, $00, 0, 0, 2, 0, $102)
    %spritemapEntry(0, $09, $FD, 0, 0, 2, 0, $121)

Spritemap_Skultera_13:
    dw $0004                                                             ;A3945E;
    %spritemapEntry(1, $43FB, $00, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $43FB, $F0, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $07, $00, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $09, $FD, 0, 0, 2, 0, $120)

Spritemap_Skultera_14:
    dw $0005                                                             ;A39474;
    %spritemapEntry(1, $43F5, $00, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $43F5, $F0, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $01, $FD, 0, 0, 2, 0, $120)
    %spritemapEntry(0, $06, $00, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $08, $FE, 0, 0, 2, 0, $124)

Spritemap_Skultera_15:
    dw $0005                                                             ;A3948F;
    %spritemapEntry(1, $43F1, $00, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $43F1, $F0, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $1FD, $00, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $02, $FD, 0, 0, 2, 0, $120)
    %spritemapEntry(0, $07, $FE, 0, 0, 2, 0, $125)


;;; $94AA: Unused. Skultera spritemap pointers ;;;
UNUSED_SpritemapPointers_Skultera:
    dw Spritemap_Skultera_0                                              ;A394AA;
    dw Spritemap_Skultera_1                                              ;A394AC;
    dw Spritemap_Skultera_2                                              ;A394AE;
    dw Spritemap_Skultera_3                                              ;A394B0;
    dw Spritemap_Skultera_4                                              ;A394B2;
    dw Spritemap_Skultera_5                                              ;A394B4;
    dw Spritemap_Skultera_6                                              ;A394B6;
    dw Spritemap_Skultera_7                                              ;A394B8;
    dw Spritemap_Skultera_8                                              ;A394BA;
    dw Spritemap_Skultera_9                                              ;A394BC;
    dw Spritemap_Skultera_A                                              ;A394BE;
    dw Spritemap_Skultera_B                                              ;A394C0;
    dw Spritemap_Skultera_C                                              ;A394C2;
    dw Spritemap_Skultera_D                                              ;A394C4;
    dw Spritemap_Skultera_E                                              ;A394C6;
    dw Spritemap_Skultera_F                                              ;A394C8;
    dw Spritemap_Skultera_10                                             ;A394CA;
    dw Spritemap_Skultera_11                                             ;A394CC;
    dw Spritemap_Skultera_12                                             ;A394CE;
    dw Spritemap_Skultera_13                                             ;A394D0;
    dw Spritemap_Skultera_14                                             ;A394D2;
    dw Spritemap_Skultera_15                                             ;A394D4;


;;; $94D6: Instruction list - elevator ;;;
InstList_Elevator:
    dw $0002,Spritemap_Elevator_0                                        ;A394D6;
    dw $0002,Spritemap_Elevator_1                                        ;A394DA;
    dw Instruction_Common_GotoY                                          ;A394DE;
    dw InstList_Elevator                                                 ;A394E0;


;;; $94E2: Elevator controller inputs ;;;
ElevatorControllerInputs:
; Indexed by parameter 1 (Speed in SMILE), which is multiplied by 2 in the init AI
; Down, Up
    dw $0400,$0800                                                       ;A394E2;


;;; $94E6: Initialisation AI - enemy $D73F (elevator) ;;;
InitAI_Elevator:
    LDX.W EnemyIndex                                                     ;A394E6;
    LDA.W #Spritemap_Common_Nothing                                      ;A394E9;
    STA.W Enemy.spritemap,X                                              ;A394EC;
    LDA.W #$0001                                                         ;A394EF;
    STA.W Enemy.instTimer,X                                              ;A394F2;
    STZ.W Enemy.loopCounter,X                                            ;A394F5;
    LDA.W #InstList_Elevator                                             ;A394F8;
    STA.W Enemy.instList,X                                               ;A394FB;
    ASL.W Enemy.init0,X                                                  ;A394FE;
    LDA.W Enemy.YPosition,X                                              ;A39501;
    STA.W Elevator.targetYPosition,X                                     ;A39504;
    LDA.W ElevatorStatus                                                 ;A39507;
    CMP.W #$0002                                                         ;A3950A;
    BEQ .doorTransition                                                  ;A3950D;
    STZ.W ElevatorProperties                                             ;A3950F;
    STZ.W ElevatorStatus                                                 ;A39512;

  .doorTransition:
    LDA.W ElevatorProperties                                             ;A39515;
    ORA.W ElevatorStatus                                                 ;A39518;
    BEQ .return                                                          ;A3951B;
    LDX.W EnemyIndex                                                     ;A3951D;
    LDA.W Enemy.init1,X                                                  ;A39520;
    STA.W Enemy.YPosition,X                                              ;A39523;
    JSR.W PlaceSamusOnElevator                                           ;A39526;

  .return:
    RTL                                                                  ;A39529;


;;; $952A: Main AI / grapple AI / frozen AI - enemy $D73F (elevator) ;;;
MainAI_GrappleAI_FrozenAI_Elevator:
; conditional %rumble
    ; rumble if Samus facing forward
    LDA.w Pose : BEQ .rumble
    CMP #$009B : BEQ .rumble

  .resume
    LDA.W DoorTransitionFlagElevatorsZebetites                           ;A3952A;
    BNE .return                                                          ;A3952D;
    LDA.W ElevatorProperties                                             ;A3952F;
    ORA.W ElevatorStatus                                                 ;A39532;
    BEQ .return                                                          ;A39535;
    %rumble16($11, 1)
    LDA.W ElevatorStatus                                                 ;A39537;
    ASL                                                                  ;A3953A;
    TAX                                                                  ;A3953B;
    JSR.W (.pointers,X)                                                  ;A3953C;

  .return:
    RTL                                                                  ;A3953F;

  .rumble
    %rumble16($11, 1)
    BRA .resume

  .pointers:
    dw ElevatorAI_0_LeavingRoom                                          ;A39540;
    dw ElevatorAI_1_LeavingRoom                                          ;A39542;
    dw ElevatorAI_2_DoorTransition                                       ;A39544;
    dw ElevatorAI_3_EnteringRoom                                         ;A39546;


;;; $9548: Elevator AI - elevator status = 0: inactive ;;;
ElevatorAI_0_LeavingRoom:
    LDX.W EnemyIndex                                                     ;A39548;
    LDY.W Enemy.init0,X                                                  ;A3954B;
    LDA.B DP_Controller1New                                              ;A3954E;
    AND.W ElevatorControllerInputs,Y                                     ;A39550;
    BEQ .notRiding                                                       ;A39553;
    LDA.W #$000B                                                         ;A39555;
    JSL.L QueueSound_Lib3_Max6                                           ;A39558;
    LDA.W #$0032                                                         ;A3955C;
    JSL.L QueueSound_Lib1_Max6                                           ;A3955F;
    LDA.W #$0007                                                         ;A39563;
    JSL.L Run_Samus_Command                                              ;A39566;
    JSL.L Reset_Projectile_Data                                          ;A3956A;
    JSR.W PlaceSamusOnElevator                                           ;A3956E;
    INC.W ElevatorStatus                                                 ;A39571;
    RTS                                                                  ;A39574;

  .notRiding:
    STZ.W ElevatorProperties                                             ;A39575;
    RTS                                                                  ;A39578;


;;; $9579: Elevator AI - elevator status = 1: leaving room ;;;
ElevatorAI_1_LeavingRoom:
    LDX.W EnemyIndex                                                     ;A39579;
    LDA.W Enemy.init0,X                                                  ;A3957C;
    BNE .up                                                              ;A3957F;
    LDA.W #$0000                                                         ;A39581;
    STA.W ElevatorDirection                                              ;A39584;
    LDA.W Enemy.YSubPosition,X                                           ;A39587;
    CLC                                                                  ;A3958A;
    ADC.W #$8000                                                         ;A3958B;
    STA.W Enemy.YSubPosition,X                                           ;A3958E;
    LDA.W Enemy.YPosition,X                                              ;A39591;
    ADC.W #$0001                                                         ;A39594;
    STA.W Enemy.YPosition,X                                              ;A39597;
    BRA +                                                                ;A3959A;

  .up:
    LDA.W #$8000                                                         ;A3959C;
    STA.W ElevatorDirection                                              ;A3959F;
    LDA.W Enemy.YSubPosition,X                                           ;A395A2;
    SEC                                                                  ;A395A5;
    SBC.W #$8000                                                         ;A395A6;
    STA.W Enemy.YSubPosition,X                                           ;A395A9;
    LDA.W Enemy.YPosition,X                                              ;A395AC;
    SBC.W #$0001                                                         ;A395AF;
    STA.W Enemy.YPosition,X                                              ;A395B2;

+   JSR.W PlaceSamusOnElevator                                           ;A395B5;
    RTS                                                                  ;A395B8;


;;; $95B9: Elevator AI - elevator status = 2: door transition ;;;
ElevatorAI_2_DoorTransition:
    INC.W ElevatorStatus                                                 ;A395B9; fallthrough to ElevatorAI_3_EnteringRoom


;;; $95BC: Elevator AI - elevator status = 3: entering room ;;;
ElevatorAI_3_EnteringRoom:
    LDX.W EnemyIndex                                                     ;A395BC;
    LDA.W Enemy.init0,X                                                  ;A395BF;
    BEQ .down                                                            ;A395C2;
    LDA.W Enemy.YSubPosition,X                                           ;A395C4;
    CLC                                                                  ;A395C7;
    ADC.W #$8000                                                         ;A395C8;
    STA.W Enemy.YSubPosition,X                                           ;A395CB;
    LDA.W Enemy.YPosition,X                                              ;A395CE;
    ADC.W #$0001                                                         ;A395D1;
    STA.W Enemy.YPosition,X                                              ;A395D4;
    CMP.W Elevator.targetYPosition,X                                     ;A395D7;
    BCS .reachedTarget                                                   ;A395DA;
    BRA PlaceSamusOnElevator                                             ;A395DC;

  .down:
    LDA.W Enemy.YSubPosition,X                                           ;A395DE;
    SEC                                                                  ;A395E1;
    SBC.W #$8000                                                         ;A395E2;
    STA.W Enemy.YSubPosition,X                                           ;A395E5;
    LDA.W Enemy.YPosition,X                                              ;A395E8;
    SBC.W #$0001                                                         ;A395EB;
    STA.W Enemy.YPosition,X                                              ;A395EE;
    CMP.W Elevator.targetYPosition,X                                     ;A395F1;
    BCC .reachedTarget                                                   ;A395F4;
    BRA PlaceSamusOnElevator                                             ;A395F6;

  .reachedTarget:
    STZ.W ElevatorStatus                                                 ;A395F8;
    STZ.W ElevatorProperties                                             ;A395FB;
    LDA.W #$0025                                                         ;A395FE;
    JSL.L QueueSound_Lib3_Max6                                           ;A39601;
    LDA.W Elevator.targetYPosition,X                                     ;A39605;
    STA.W Enemy.YPosition,X                                              ;A39608;
    LDA.W #$000B                                                         ;A3960B;
    JSL.L Run_Samus_Command                                              ;A3960E; fallthrough to PlaceSamusOnElevator


;;; $9612: Place Samus on top of elevator ;;;
PlaceSamusOnElevator:
    LDX.W EnemyIndex                                                     ;A39612;
    LDA.W Enemy.YPosition,X                                              ;A39615;
    SEC                                                                  ;A39618;
    SBC.W #$001A                                                         ;A39619;
    STA.W SamusYPosition                                                 ;A3961C;
    STZ.W SamusYSubPosition                                              ;A3961F;
    LDA.W Enemy.XPosition,X                                              ;A39622;
    STA.W SamusXPosition                                                 ;A39625;
    STZ.W SamusYSpeed                                                    ;A39628;
    STZ.W SamusYSubSpeed                                                 ;A3962B;
    RTS                                                                  ;A3962E;


;;; $962F: Spritemaps - elevator ;;;
Spritemap_Elevator_0:
    dw $0004                                                             ;A3962F;
    %spritemapEntry(0, $1F2, $FC, 0, 1, 2, 5, $6C)
    %spritemapEntry(0, $06, $FC, 0, 1, 2, 5, $6C)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 5, $6C)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 5, $6C)

Spritemap_Elevator_1:
    dw $0004                                                             ;A39645;
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 5, $6E)
    %spritemapEntry(0, $08, $FC, 0, 1, 2, 5, $6D)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 5, $6E)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 5, $6D)


;;; $965B: Palette - enemy $D77F (sciser) ;;;
Palette_Sciser:
    dw $3800,$3EDF,$0018,$000F,$0005,$01DD,$0118,$0093                   ;A3965B;
    dw $002F,$7FE0,$7DA0,$48E0,$30A0,$3BE0,$2680,$1580                   ;A3966B;


;;; $967B: Instruction list - sciser - upside right ;;;
InstList_Sciser_UpsideRight_0:
    dw Instruction_Crawlers_FunctionInY                                  ;A3967B;
    dw Function_Crawlers_CrawlingVertically                              ;A3967D;

InstList_Sciser_UpsideRight_1:
    dw $0008,Spritemap_Sciser_UpsideRight_0                              ;A3967F;
    dw $0008,Spritemap_Sciser_UpsideRight_1                              ;A39683;
    dw $0008,Spritemap_Sciser_UpsideRight_2                              ;A39687;
    dw $0008,Spritemap_Sciser_UpsideRight_1                              ;A3968B;
    dw Instruction_Common_GotoY                                          ;A3968F;
    dw InstList_Sciser_UpsideRight_1                                     ;A39691;


;;; $9693: Instruction list - sciser - upside left ;;;
InstList_Sciser_UpsideLeft_0:
    dw Instruction_Crawlers_FunctionInY                                  ;A39693;
    dw Function_Crawlers_CrawlingVertically                              ;A39695;

InstList_Sciser_UpsideLeft_1:
    dw $0008,Spritemap_Sciser_UpsideLeft_0                               ;A39697;
    dw $0008,Spritemap_Sciser_UpsideLeft_1                               ;A3969B;
    dw $0008,Spritemap_Sciser_UpsideLeft_2                               ;A3969F;
    dw $0008,Spritemap_Sciser_UpsideLeft_1                               ;A396A3;
    dw Instruction_Common_GotoY                                          ;A396A7;
    dw InstList_Sciser_UpsideLeft_1                                      ;A396A9;


;;; $96AB: Instruction list - sciser - upside down ;;;
InstList_Sciser_UpsideDown_0:
    dw Instruction_Crawlers_FunctionInY                                  ;A396AB;
    dw Function_Crawlers_CrawlingHorizontally                            ;A396AD;

InstList_Sciser_UpsideDown_1:
    dw $0008,Spritemap_Sciser_UpsideDown_0                               ;A396AF;
    dw $0008,Spritemap_Sciser_UpsideDown_1                               ;A396B3;
    dw $0008,Spritemap_Sciser_UpsideDown_2                               ;A396B7;
    dw $0008,Spritemap_Sciser_UpsideDown_1                               ;A396BB;
    dw Instruction_Common_GotoY                                          ;A396BF;
    dw InstList_Sciser_UpsideDown_1                                      ;A396C1;


;;; $96C3: Instruction list - sciser - upside up ;;;
InstList_Sciser_UpsideUp_0:
    dw Instruction_Crawlers_FunctionInY                                  ;A396C3;
    dw Function_Crawlers_CrawlingHorizontally                            ;A396C5;

InstList_Sciser_UpsideUp_1:
    dw $0008,Spritemap_Sciser_UpsideUp_0                                 ;A396C7;
    dw $0008,Spritemap_Sciser_UpsideUp_1                                 ;A396CB;
    dw $0008,Spritemap_Sciser_UpsideUp_2                                 ;A396CF;
    dw $0008,Spritemap_Sciser_UpsideUp_1                                 ;A396D3;
    dw Instruction_Common_GotoY                                          ;A396D7;
    dw InstList_Sciser_UpsideUp_1                                        ;A396D9;


;;; $96DB: Sciser initial instruction list pointers ;;;
InstListPointers_Sciser:
; Indexed by [enemy initialisation parameter] * 2
    dw InstList_Sciser_UpsideRight_0                                     ;A396DB;
    dw InstList_Sciser_UpsideLeft_0                                      ;A396DD;
    dw InstList_Sciser_UpsideDown_0                                      ;A396DF;
    dw InstList_Sciser_UpsideUp_0                                        ;A396E1;


;;; $96E3: Initialisation AI - enemy $D77F (sciser) ;;;
InitAI_Sciser:
    LDX.W EnemyIndex                                                     ;A396E3;
    LDA.W #$0008                                                         ;A396E6;
    STA.W Enemy.init1,X                                                  ;A396E9;
    LDA.W Enemy.instList,X                                               ;A396EC;
    AND.W #$0003                                                         ;A396EF;
    ASL                                                                  ;A396F2;
    TAY                                                                  ;A396F3;
    LDA.W InstListPointers_Sciser,Y                                      ;A396F4;
    STA.W Enemy.instList,X                                               ;A396F7;
    JMP.W InitAI_Crawlers_Common                                         ;A396FA;


if !FEATURE_KEEP_UNREFERENCED
;;; $96FD: Unused. RTL ;;;
UNUSED_GetEnemyIndex_A396FD:
    LDX.W EnemyIndex                                                     ;A396FD;
    RTL                                                                  ;A39700;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $9701: Unused. RTL ;;;
RTL_A39701:
    RTL                                                                  ;A39701;


;;; $9702: Unused. RTL ;;;
RTL_A39702:
    RTL                                                                  ;A39702;


;;; $9703: Sciser spritemaps ;;;
Spritemap_Sciser_UpsideUp_0:
    dw $0004                                                             ;A39703;
    %spritemapEntry(1, $1FF, $F3, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $1F3, $F4, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $00, $FC, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $1F0, $FC, 0, 0, 2, 0, $100)

Spritemap_Sciser_UpsideUp_1:
    dw $0004                                                             ;A39719;
    %spritemapEntry(1, $1FE, $F3, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $1F2, $F3, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $00, $FB, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $1F0, $FB, 0, 0, 2, 0, $102)

Spritemap_Sciser_UpsideUp_2:
    dw $0004                                                             ;A3972F;
    %spritemapEntry(1, $1FD, $F4, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $1F1, $F3, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $00, $FC, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1F0, $FC, 0, 0, 2, 0, $104)

Spritemap_Sciser_UpsideRight_0:
    dw $0004                                                             ;A39745;
    %spritemapEntry(1, $1FD, $FF, 1, 0, 2, 0, $10E)
    %spritemapEntry(1, $1FC, $F3, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1F4, $00, 1, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F4, $F0, 0, 0, 2, 0, $108)

Spritemap_Sciser_UpsideRight_1:
    dw $0004                                                             ;A3975B;
    %spritemapEntry(1, $1FD, $FE, 1, 0, 2, 0, $10E)
    %spritemapEntry(1, $1FD, $F2, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1F5, $00, 1, 0, 2, 0, $10A)
    %spritemapEntry(1, $1F5, $F0, 0, 0, 2, 0, $10A)

Spritemap_Sciser_UpsideRight_2:
    dw $0004                                                             ;A39771;
    %spritemapEntry(1, $1FC, $FD, 1, 0, 2, 0, $10E)
    %spritemapEntry(1, $1FD, $F1, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1F4, $00, 1, 0, 2, 0, $108)
    %spritemapEntry(1, $1F4, $F0, 0, 0, 2, 0, $10C)

Spritemap_Sciser_UpsideDown_0:
    dw $0004                                                             ;A39787;
    %spritemapEntry(1, $1FF, $FD, 1, 1, 2, 0, $106)
    %spritemapEntry(1, $1F3, $FC, 1, 0, 2, 0, $106)
    %spritemapEntry(1, $00, $F4, 1, 1, 2, 0, $104)
    %spritemapEntry(1, $1F0, $F4, 1, 0, 2, 0, $100)

Spritemap_Sciser_UpsideDown_1:
    dw $0004                                                             ;A3979D;
    %spritemapEntry(1, $1FE, $FD, 1, 1, 2, 0, $106)
    %spritemapEntry(1, $1F2, $FD, 1, 0, 2, 0, $106)
    %spritemapEntry(1, $00, $F5, 1, 1, 2, 0, $102)
    %spritemapEntry(1, $1F0, $F5, 1, 0, 2, 0, $102)

Spritemap_Sciser_UpsideDown_2:
    dw $0004                                                             ;A397B3;
    %spritemapEntry(1, $1FD, $FC, 1, 1, 2, 0, $106)
    %spritemapEntry(1, $1F1, $FD, 1, 0, 2, 0, $106)
    %spritemapEntry(1, $00, $F4, 1, 1, 2, 0, $100)
    %spritemapEntry(1, $1F0, $F4, 1, 0, 2, 0, $104)

Spritemap_Sciser_UpsideLeft_0:
    dw $0004                                                             ;A397C9;
    %spritemapEntry(1, $1F3, $FF, 1, 1, 2, 0, $10E)
    %spritemapEntry(1, $1F4, $F3, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $1FC, $00, 1, 1, 2, 0, $10C)
    %spritemapEntry(1, $1FC, $F0, 0, 1, 2, 0, $108)

Spritemap_Sciser_UpsideLeft_1:
    dw $0004                                                             ;A397DF;
    %spritemapEntry(1, $1F3, $FE, 1, 1, 2, 0, $10E)
    %spritemapEntry(1, $1F3, $F2, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $1FB, $00, 1, 1, 2, 0, $10A)
    %spritemapEntry(1, $1FB, $F0, 0, 1, 2, 0, $10A)

Spritemap_Sciser_UpsideLeft_2:
    dw $0004                                                             ;A397F5;
    %spritemapEntry(1, $1F4, $FD, 1, 1, 2, 0, $10E)
    %spritemapEntry(1, $1F3, $F1, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $1FC, $00, 1, 1, 2, 0, $108)
    %spritemapEntry(1, $1FC, $F0, 0, 1, 2, 0, $10C)


;;; $980B: Palette - enemy $D7BF (zero) ;;;
Palette_Zero:
    dw $3800,$57F5,$4AEF,$1182,$00C0,$5752,$3EAD,$2E08                   ;A3980B;
    dw $25C6,$03FD,$02D5,$020F,$0149,$3EDF,$0018,$000F                   ;A3981B;


;;; $982B: Unused. Instruction list - zero - upside right - facing up ;;;
UNUSED_InstList_Zero_UpsideRight_FacingUp_A3982B:
    dw Instruction_Crawlers_FunctionInY                                  ;A3982B;
    dw Function_Crawlers_CrawlingVertically                              ;A3982D;

UNUSED_InstList_Zero_UpsideRight_FacingUp_A3982F:
    dw $0004,Spritemap_Zero_UpsideRight_FacingUp_0                       ;A3982F;
    dw $0004,Spritemap_Zero_UpsideRight_FacingUp_1                       ;A39833;
    dw $0004,Spritemap_Zero_UpsideRight_FacingUp_2                       ;A39837;
    dw $0004,Spritemap_Zero_UpsideRight_FacingUp_3                       ;A3983B;
    dw $0004,Spritemap_Zero_UpsideRight_FacingUp_2                       ;A3983F;
    dw $0004,Spritemap_Zero_UpsideRight_FacingUp_1                       ;A39843;
    dw Instruction_Common_GotoY                                          ;A39847;
    dw UNUSED_InstList_Zero_UpsideRight_FacingUp_A3982F                  ;A39849;


;;; $984B: Instruction list - zero - upside right - facing down ;;;
InstList_Zero_UpsideRight_FacingDown_0:
    dw Instruction_Crawlers_FunctionInY                                  ;A3984B;
    dw Function_Crawlers_CrawlingVertically                              ;A3984D;

InstList_Zero_UpsideRight_FacingDown_1:
    dw $0004,Spritemap_Zero_UpsideRight_FacingDown_0                     ;A3984F;
    dw $0004,Spritemap_Zero_UpsideRight_FacingDown_1                     ;A39853;
    dw $0004,Spritemap_Zero_UpsideRight_FacingDown_2                     ;A39857;
    dw $0004,Spritemap_Zero_UpsideRight_FacingDown_3                     ;A3985B;
    dw $0004,Spritemap_Zero_UpsideRight_FacingDown_2                     ;A3985F;
    dw $0004,Spritemap_Zero_UpsideRight_FacingDown_1                     ;A39863;
    dw Instruction_Common_GotoY                                          ;A39867;
    dw InstList_Zero_UpsideRight_FacingDown_1                            ;A39869;


;;; $986B: Unused. Instruction list - zero - upside left - facing down ;;;
UNUSED_InstList_Zero_UpsideLeft_FacingDown_A3986B:
    dw Instruction_Crawlers_FunctionInY                                  ;A3986B;
    dw Function_Crawlers_CrawlingVertically                              ;A3986D;

UNUSED_InstList_Zero_UpsideLeft_FacingDown_A3986F:
    dw $0004,Spritemap_Zero_UpsideLeft_FacingDown_0                      ;A3986F;
    dw $0004,Spritemap_Zero_UpsideLeft_FacingDown_1                      ;A39873;
    dw $0004,Spritemap_Zero_UpsideLeft_FacingDown_2                      ;A39877;
    dw $0004,Spritemap_Zero_UpsideLeft_FacingDown_3                      ;A3987B;
    dw $0004,Spritemap_Zero_UpsideLeft_FacingDown_2                      ;A3987F;
    dw $0004,Spritemap_Zero_UpsideLeft_FacingDown_1                      ;A39883;
    dw Instruction_Common_GotoY                                          ;A39887;
    dw UNUSED_InstList_Zero_UpsideLeft_FacingDown_A3986F                 ;A39889;


;;; $988B: Instruction list - zero - upside left - facing up ;;;
InstList_Zero_UpsideLeft_FacingUp_0:
    dw Instruction_Crawlers_FunctionInY                                  ;A3988B;
    dw Function_Crawlers_CrawlingVertically                              ;A3988D;

InstList_Zero_UpsideLeft_FacingUp_1:
    dw $0004,Spritemap_Zero_UpsideLeft_FacingUp_0                        ;A3988F;
    dw $0004,Spritemap_Zero_UpsideLeft_FacingUp_1                        ;A39893;
    dw $0004,Spritemap_Zero_UpsideLeft_FacingUp_2                        ;A39897;
    dw $0004,Spritemap_Zero_UpsideLeft_FacingUp_3                        ;A3989B;
    dw $0004,Spritemap_Zero_UpsideLeft_FacingUp_2                        ;A3989F;
    dw $0004,Spritemap_Zero_UpsideLeft_FacingUp_1                        ;A398A3;
    dw Instruction_Common_GotoY                                          ;A398A7;
    dw InstList_Zero_UpsideLeft_FacingUp_1                               ;A398A9;


;;; $98AB: Instruction list - zero - upside down - facing left ;;;
InstList_Zero_UpsideDown_FacingLeft_0:
    dw Instruction_Crawlers_FunctionInY                                  ;A398AB;
    dw Function_Crawlers_CrawlingHorizontally                            ;A398AD;

InstList_Zero_UpsideDown_FacingLeft_1:
    dw $0004,Spritemap_Zero_UpsideDown_FacingLeft_0                      ;A398AF;
    dw $0004,Spritemap_Zero_UpsideDown_FacingLeft_1                      ;A398B3;
    dw $0004,Spritemap_Zero_UpsideDown_FacingLeft_2                      ;A398B7;
    dw $0004,Spritemap_Zero_UpsideDown_FacingLeft_3                      ;A398BB;
    dw $0004,Spritemap_Zero_UpsideDown_FacingLeft_2                      ;A398BF;
    dw $0004,Spritemap_Zero_UpsideDown_FacingLeft_1                      ;A398C3;
    dw Instruction_Common_GotoY                                          ;A398C7;
    dw InstList_Zero_UpsideDown_FacingLeft_1                             ;A398C9;


;;; $98CB: Unused. Instruction list - zero - upside up - facing left ;;;
UNUSED_InstList_Zero_UpsideUp_FacingLeft_A398CB:
    dw Instruction_Crawlers_FunctionInY                                  ;A398CB;
    dw Function_Crawlers_CrawlingHorizontally                            ;A398CD;

UNUSED_InstList_Zero_UpsideUp_FacingLeft_A398CF:
    dw $0004,Spritemap_Zero_UpsideUp_FacingLeft_0                        ;A398CF;
    dw $0004,Spritemap_Zero_UpsideUp_FacingLeft_1                        ;A398D3;
    dw $0004,Spritemap_Zero_UpsideUp_FacingLeft_2                        ;A398D7;
    dw $0004,Spritemap_Zero_UpsideUp_FacingLeft_3                        ;A398DB;
    dw $0004,Spritemap_Zero_UpsideUp_FacingLeft_2                        ;A398DF;
    dw $0004,Spritemap_Zero_UpsideUp_FacingLeft_1                        ;A398E3;
    dw Instruction_Common_GotoY                                          ;A398E7;
    dw UNUSED_InstList_Zero_UpsideUp_FacingLeft_A398CF                   ;A398E9;


;;; $98EB: Unused. Instruction list - zero - upside down - facing right ;;;
UNUSED_InstList_Zero_UpsideDown_FacingRight_A398EB:
    dw Instruction_Crawlers_FunctionInY                                  ;A398EB;
    dw Function_Crawlers_CrawlingHorizontally                            ;A398ED;

UNUSED_InstList_Zero_UpsideDown_FacingRight_A398EF:
    dw $0004,Spritemap_Zero_UpsideDown_FacingRight_0                     ;A398EF;
    dw $0004,Spritemap_Zero_UpsideDown_FacingRight_1                     ;A398F3;
    dw $0004,Spritemap_Zero_UpsideDown_FacingRight_2                     ;A398F7;
    dw $0004,Spritemap_Zero_UpsideDown_FacingRight_3                     ;A398FB;
    dw $0004,Spritemap_Zero_UpsideDown_FacingRight_2                     ;A398FF;
    dw $0004,Spritemap_Zero_UpsideDown_FacingRight_1                     ;A39903;
    dw Instruction_Common_GotoY                                          ;A39907;
    dw UNUSED_InstList_Zero_UpsideDown_FacingRight_A398EF                ;A39909;


;;; $990B: Instruction list - zero - upside up - facing right ;;;
UNUSED_InstList_Zero_UpsideUp_FacingRight_A3990B:
    dw Instruction_Crawlers_FunctionInY                                  ;A3990B;
    dw Function_Crawlers_CrawlingHorizontally                            ;A3990D;

UNUSED_InstList_Zero_UpsideUp_FacingRight_A3990F:
    dw $0004,Spritemap_Zero_UpsideUp_FacingRight_0                       ;A3990F;
    dw $0004,Spritemap_Zero_UpsideUp_FacingRight_1                       ;A39913;
    dw $0004,Spritemap_Zero_UpsideUp_FacingRight_2                       ;A39917;
    dw $0004,Spritemap_Zero_UpsideUp_FacingRight_3                       ;A3991B;
    dw $0004,Spritemap_Zero_UpsideUp_FacingRight_2                       ;A3991F;
    dw $0004,Spritemap_Zero_UpsideUp_FacingRight_1                       ;A39923;
    dw Instruction_Common_GotoY                                          ;A39927;
    dw UNUSED_InstList_Zero_UpsideUp_FacingRight_A3990F                  ;A39929;


;;; $992B: Zero initial instruction list pointers ;;;
InitialInstListPointers_Zero:
    dw InstList_Zero_UpsideRight_FacingDown_0                            ;A3992B;
    dw InstList_Zero_UpsideLeft_FacingUp_0                               ;A3992D;
    dw InstList_Zero_UpsideDown_FacingLeft_0                             ;A3992F;
    dw UNUSED_InstList_Zero_UpsideUp_FacingRight_A3990B                  ;A39931;
    dw UNUSED_InstList_Zero_UpsideRight_FacingUp_A3982B                  ;A39933;
    dw UNUSED_InstList_Zero_UpsideLeft_FacingDown_A3986B                 ;A39935;
    dw UNUSED_InstList_Zero_UpsideUp_FacingLeft_A398CB                   ;A39937;
    dw UNUSED_InstList_Zero_UpsideDown_FacingRight_A398EB                ;A39939;


;;; $993B: Initialisation AI - enemy $D7BF (zero) ;;;
InitAI_Zero:
    LDX.W EnemyIndex                                                     ;A3993B;
    LDA.W #$000A                                                         ;A3993E;
    STA.W Enemy.init1,X                                                  ;A39941;
    LDA.W Enemy.instList,X                                               ;A39944;
    AND.W #$0003                                                         ;A39947;
    ASL                                                                  ;A3994A;
    TAY                                                                  ;A3994B;
    LDA.W InitialInstListPointers_Zero,Y                                 ;A3994C;
    STA.W Enemy.instList,X                                               ;A3994F;
    JMP.W InitAI_Crawlers_Common                                         ;A39952;


if !FEATURE_KEEP_UNREFERENCED
;;; $9955: Unused. RTL ;;;
UNUSED_GetEnemyIndex_A39955:
    LDX.W EnemyIndex                                                     ;A39955;
    RTL                                                                  ;A39958;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $9959: Unused. RTL ;;;
RTL_A39959:
    RTL                                                                  ;A39959;


;;; $995A: Unused. RTL ;;;
RTL_A3995A:
    RTL                                                                  ;A3995A;


;;; $995B: Zero spritemaps ;;;
Spritemap_Zero_UpsideUp_FacingRight_0:
    dw $0003                                                             ;A3995B;
    %spritemapEntry(1, $00, $F8, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1FA, $F8, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F1, $F8, 0, 0, 2, 0, $100)

Spritemap_Zero_UpsideUp_FacingRight_1:
    dw $0003                                                             ;A3996C;
    %spritemapEntry(1, $00, $F8, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1FA, $F8, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 2, 0, $100)

Spritemap_Zero_UpsideUp_FacingRight_2:
    dw $0003                                                             ;A3997D;
    %spritemapEntry(1, $01, $F8, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1FA, $F8, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1EF, $F8, 0, 0, 2, 0, $100)

Spritemap_Zero_UpsideUp_FacingRight_3:
    dw $0003                                                             ;A3998E;
    %spritemapEntry(1, $02, $F8, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1FA, $F8, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1EE, $F8, 0, 0, 2, 0, $100)

Spritemap_Zero_UpsideLeft_FacingUp_0:
    dw $0003                                                             ;A3999F;
    %spritemapEntry(1, $1F8, $00, 0, 1, 2, 0, $10A)
    %spritemapEntry(1, $1F8, $FA, 0, 1, 2, 0, $108)
    %spritemapEntry(1, $1F8, $F1, 0, 1, 2, 0, $106)

Spritemap_Zero_UpsideLeft_FacingUp_1:
    dw $0003                                                             ;A399B0;
    %spritemapEntry(1, $1F8, $00, 0, 1, 2, 0, $10A)
    %spritemapEntry(1, $1F8, $FA, 0, 1, 2, 0, $108)
    %spritemapEntry(1, $1F8, $F0, 0, 1, 2, 0, $106)

Spritemap_Zero_UpsideLeft_FacingUp_2:
    dw $0003                                                             ;A399C1;
    %spritemapEntry(1, $1F8, $01, 0, 1, 2, 0, $10A)
    %spritemapEntry(1, $1F8, $FA, 0, 1, 2, 0, $108)
    %spritemapEntry(1, $1F8, $EF, 0, 1, 2, 0, $106)

Spritemap_Zero_UpsideLeft_FacingUp_3:
    dw $0003                                                             ;A399D2;
    %spritemapEntry(1, $1F8, $02, 0, 1, 2, 0, $10A)
    %spritemapEntry(1, $1F8, $FA, 0, 1, 2, 0, $108)
    %spritemapEntry(1, $1F8, $EE, 0, 1, 2, 0, $106)

Spritemap_Zero_UpsideDown_FacingLeft_0:
    dw $0003                                                             ;A399E3;
    %spritemapEntry(1, $1F0, $F8, 1, 1, 2, 0, $104)
    %spritemapEntry(1, $1F6, $F8, 1, 1, 2, 0, $102)
    %spritemapEntry(1, $1FF, $F8, 1, 1, 2, 0, $100)

Spritemap_Zero_UpsideDown_FacingLeft_1:
    dw $0003                                                             ;A399F4;
    %spritemapEntry(1, $1F0, $F8, 1, 1, 2, 0, $104)
    %spritemapEntry(1, $1F6, $F8, 1, 1, 2, 0, $102)
    %spritemapEntry(1, $00, $F8, 1, 1, 2, 0, $100)

Spritemap_Zero_UpsideDown_FacingLeft_2:
    dw $0003                                                             ;A39A05;
    %spritemapEntry(1, $1EF, $F8, 1, 1, 2, 0, $104)
    %spritemapEntry(1, $1F6, $F8, 1, 1, 2, 0, $102)
    %spritemapEntry(1, $01, $F8, 1, 1, 2, 0, $100)

Spritemap_Zero_UpsideDown_FacingLeft_3:
    dw $0003                                                             ;A39A16;
    %spritemapEntry(1, $1EE, $F8, 1, 1, 2, 0, $104)
    %spritemapEntry(1, $1F6, $F8, 1, 1, 2, 0, $102)
    %spritemapEntry(1, $02, $F8, 1, 1, 2, 0, $100)

Spritemap_Zero_UpsideLeft_FacingDown_0:
    dw $0003                                                             ;A39A27;
    %spritemapEntry(1, $1F8, $F0, 1, 1, 2, 0, $10A)
    %spritemapEntry(1, $1F8, $F6, 1, 1, 2, 0, $108)
    %spritemapEntry(1, $1F8, $FF, 1, 1, 2, 0, $106)

Spritemap_Zero_UpsideLeft_FacingDown_1:
    dw $0003                                                             ;A39A38;
    %spritemapEntry(1, $1F8, $F0, 1, 1, 2, 0, $10A)
    %spritemapEntry(1, $1F8, $F6, 1, 1, 2, 0, $108)
    %spritemapEntry(1, $1F8, $00, 1, 1, 2, 0, $106)

Spritemap_Zero_UpsideLeft_FacingDown_2:
    dw $0003                                                             ;A39A49;
    %spritemapEntry(1, $1F8, $EF, 1, 1, 2, 0, $10A)
    %spritemapEntry(1, $1F8, $F6, 1, 1, 2, 0, $108)
    %spritemapEntry(1, $1F8, $01, 1, 1, 2, 0, $106)

Spritemap_Zero_UpsideLeft_FacingDown_3:
    dw $0003                                                             ;A39A5A;
    %spritemapEntry(1, $1F8, $EE, 1, 1, 2, 0, $10A)
    %spritemapEntry(1, $1F8, $F6, 1, 1, 2, 0, $108)
    %spritemapEntry(1, $1F8, $02, 1, 1, 2, 0, $106)

Spritemap_Zero_UpsideUp_FacingLeft_0:
    dw $0003                                                             ;A39A6B;
    %spritemapEntry(1, $00, $F8, 1, 0, 2, 0, $104)
    %spritemapEntry(1, $1FA, $F8, 1, 0, 2, 0, $102)
    %spritemapEntry(1, $1F1, $F8, 1, 0, 2, 0, $100)

Spritemap_Zero_UpsideUp_FacingLeft_1:
    dw $0003                                                             ;A39A7C;
    %spritemapEntry(1, $00, $F8, 1, 0, 2, 0, $104)
    %spritemapEntry(1, $1FA, $F8, 1, 0, 2, 0, $102)
    %spritemapEntry(1, $1F0, $F8, 1, 0, 2, 0, $100)

Spritemap_Zero_UpsideUp_FacingLeft_2:
    dw $0003                                                             ;A39A8D;
    %spritemapEntry(1, $01, $F8, 1, 0, 2, 0, $104)
    %spritemapEntry(1, $1FA, $F8, 1, 0, 2, 0, $102)
    %spritemapEntry(1, $1EF, $F8, 1, 0, 2, 0, $100)

Spritemap_Zero_UpsideUp_FacingLeft_3:
    dw $0003                                                             ;A39A9E;
    %spritemapEntry(1, $02, $F8, 1, 0, 2, 0, $104)
    %spritemapEntry(1, $1FA, $F8, 1, 0, 2, 0, $102)
    %spritemapEntry(1, $1EE, $F8, 1, 0, 2, 0, $100)

Spritemap_Zero_UpsideRight_FacingUp_0:
    dw $0003                                                             ;A39AAF;
    %spritemapEntry(1, $1F8, $00, 0, 0, 2, 0, $10A)
    %spritemapEntry(1, $1F8, $FA, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $1F8, $F1, 0, 0, 2, 0, $106)

Spritemap_Zero_UpsideRight_FacingUp_1:
    dw $0003                                                             ;A39AC0;
    %spritemapEntry(1, $1F8, $00, 0, 0, 2, 0, $10A)
    %spritemapEntry(1, $1F8, $FA, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $106)

Spritemap_Zero_UpsideRight_FacingUp_2:
    dw $0003                                                             ;A39AD1;
    %spritemapEntry(1, $1F8, $01, 0, 0, 2, 0, $10A)
    %spritemapEntry(1, $1F8, $FA, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $1F8, $EF, 0, 0, 2, 0, $106)

Spritemap_Zero_UpsideRight_FacingUp_3:
    dw $0003                                                             ;A39AE2;
    %spritemapEntry(1, $1F8, $02, 0, 0, 2, 0, $10A)
    %spritemapEntry(1, $1F8, $FA, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $1F8, $EE, 0, 0, 2, 0, $106)

Spritemap_Zero_UpsideDown_FacingRight_0:
    dw $0003                                                             ;A39AF3;
    %spritemapEntry(1, $1F0, $F8, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $1F6, $F8, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $1FF, $F8, 0, 1, 2, 0, $100)

Spritemap_Zero_UpsideDown_FacingRight_1:
    dw $0003                                                             ;A39B04;
    %spritemapEntry(1, $1F0, $F8, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $1F6, $F8, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $00, $F8, 0, 1, 2, 0, $100)

Spritemap_Zero_UpsideDown_FacingRight_2:
    dw $0003                                                             ;A39B15;
    %spritemapEntry(1, $1EF, $F8, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $1F6, $F8, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $01, $F8, 0, 1, 2, 0, $100)

Spritemap_Zero_UpsideDown_FacingRight_3:
    dw $0003                                                             ;A39B26;
    %spritemapEntry(1, $1EE, $F8, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $1F6, $F8, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $02, $F8, 0, 1, 2, 0, $100)

Spritemap_Zero_UpsideRight_FacingDown_0:
    dw $0003                                                             ;A39B37;
    %spritemapEntry(1, $1F8, $F0, 1, 0, 2, 0, $10A)
    %spritemapEntry(1, $1F8, $F6, 1, 0, 2, 0, $108)
    %spritemapEntry(1, $1F8, $FF, 1, 0, 2, 0, $106)

Spritemap_Zero_UpsideRight_FacingDown_1:
    dw $0003                                                             ;A39B48;
    %spritemapEntry(1, $1F8, $F0, 1, 0, 2, 0, $10A)
    %spritemapEntry(1, $1F8, $F6, 1, 0, 2, 0, $108)
    %spritemapEntry(1, $1F8, $00, 1, 0, 2, 0, $106)

Spritemap_Zero_UpsideRight_FacingDown_2:
    dw $0003                                                             ;A39B59;
    %spritemapEntry(1, $1F8, $EF, 1, 0, 2, 0, $10A)
    %spritemapEntry(1, $1F8, $F6, 1, 0, 2, 0, $108)
    %spritemapEntry(1, $1F8, $01, 1, 0, 2, 0, $106)

Spritemap_Zero_UpsideRight_FacingDown_3:
    dw $0003                                                             ;A39B6A;
    %spritemapEntry(1, $1F8, $EE, 1, 0, 2, 0, $10A)
    %spritemapEntry(1, $1F8, $F6, 1, 0, 2, 0, $108)
    %spritemapEntry(1, $1F8, $02, 1, 0, 2, 0, $106)


;;; $9B7B: Palette - enemy $D7FF (tripper) ;;;
Palette_Tripper:
    dw $3800,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166                   ;A39B7B;
    dw $0924,$7F5A,$7EC0,$6DE0,$54E0,$03FF,$0237,$00D1                   ;A39B8B;


;;; $9B9B: Palette - enemy $D83F (suspensor platform) ;;;
Palette_Kamer2:
    dw $3800,$7F5A,$3BE0,$2680,$0920,$4F5A,$36B5,$2610                   ;A39B9B;
    dw $1DCE,$5294,$39CE,$2108,$1084,$033B,$0216,$0113                   ;A39BAB;


;;; $9BBB: Instruction list - suspensor platform - vertically moving - moving left ;;;
InstList_Kamer2_VerticallyMoving_Left_0:
    dw Instruction_Tripper_Kamer2_SetMovingLeftXMovement_duplicate       ;A39BBB;

InstList_Kamer2_VerticallyMoving_Left_1:
    dw $000A,Spritemap_Kamer2_0                                          ;A39BBD;
    dw $000A,Spritemap_Kamer2_1                                          ;A39BC1;
    dw $000A,Spritemap_Kamer2_2                                          ;A39BC5;
    dw $000A,Spritemap_Kamer2_3                                          ;A39BC9;
    dw Instruction_Common_GotoY                                          ;A39BCD;
    dw InstList_Kamer2_VerticallyMoving_Left_1                           ;A39BCF;


;;; $9BD1: Instruction list - suspensor platform - vertically moving - moving right ;;;
InstList_Kamer2_VerticallyMoving_Right_0:
    dw Instruction_Tripper_Kamer2_SetMovingRightXMovement_duplicate      ;A39BD1;

InstList_Kamer2_VerticallyMoving_Right_1:
    dw $000A,Spritemap_Kamer2_0                                          ;A39BD3;
    dw $000A,Spritemap_Kamer2_1                                          ;A39BD7;
    dw $000A,Spritemap_Kamer2_2                                          ;A39BDB;
    dw $000A,Spritemap_Kamer2_3                                          ;A39BDF;
    dw Instruction_Common_GotoY                                          ;A39BE3;
    dw InstList_Kamer2_VerticallyMoving_Right_1                          ;A39BE5;


;;; $9BE7: Instruction list - suspensor platform - vertically still - moving left ;;;
InstList_Kamer2_VerticallyStill_Left_0:
    dw Instruction_Tripper_Kamer2_SetMovingLeftXMovement                 ;A39BE7;

InstList_Kamer2_VerticallyStill_Left_1:
    dw $000A,Spritemap_Kamer2_0                                          ;A39BE9;
    dw $000A,Spritemap_Kamer2_1                                          ;A39BED;
    dw $000A,Spritemap_Kamer2_2                                          ;A39BF1;
    dw $000A,Spritemap_Kamer2_3                                          ;A39BF5;
    dw Instruction_Common_GotoY                                          ;A39BF9;
    dw InstList_Kamer2_VerticallyStill_Left_1                            ;A39BFB;


;;; $9BFD: Instruction list - suspensor platform - vertically still - moving right ;;;
InstList_Kamer2_VerticallyStill_Right_0:
    dw Instruction_Tripper_Kamer2_SetMovingRightXMovement                ;A39BFD;

InstList_Kamer2_VerticallyStill_Right_1:
    dw $000A,Spritemap_Kamer2_0                                          ;A39BFF;
    dw $000A,Spritemap_Kamer2_1                                          ;A39C03;
    dw $000A,Spritemap_Kamer2_2                                          ;A39C07;
    dw $000A,Spritemap_Kamer2_3                                          ;A39C0B;
    dw Instruction_Common_GotoY                                          ;A39C0F;
    dw InstList_Kamer2_VerticallyStill_Right_1                           ;A39C11;


;;; $9C13: Instruction list - tripper - vertically moving - moving left ;;;
InstList_Tripper_VerticallyMoving_Left_0:
    dw Instruction_Tripper_Kamer2_SetMovingLeftXMovement_duplicate       ;A39C13;

InstList_Tripper_VerticallyMoving_Left_1:
    dw $0007,Spritemap_Tripper_VerticallyMoving_Left_0                   ;A39C15;
    dw $0008,Spritemap_Tripper_VerticallyMoving_Left_1                   ;A39C19;
    dw $0007,Spritemap_Tripper_VerticallyMoving_Left_0                   ;A39C1D;
    dw $0008,Spritemap_Tripper_VerticallyMoving_Left_2                   ;A39C21;
    dw Instruction_Common_GotoY                                          ;A39C25;
    dw InstList_Tripper_VerticallyMoving_Left_1                          ;A39C27;


;;; $9C29: Instruction list - tripper - vertically moving - moving right ;;;
InstList_Tripper_VerticallyMoving_Right_0:
    dw Instruction_Tripper_Kamer2_SetMovingRightXMovement_duplicate      ;A39C29;

InstList_Tripper_VerticallyMoving_Right_1:
    dw $0007,Spritemap_Tripper_VerticallyMoving_Right_0                  ;A39C2B;
    dw $0008,Spritemap_Tripper_VerticallyMoving_Right_1                  ;A39C2F;
    dw $0007,Spritemap_Tripper_VerticallyMoving_Right_0                  ;A39C33;
    dw $0008,Spritemap_Tripper_VerticallyMoving_Right_2                  ;A39C37;
    dw Instruction_Common_GotoY                                          ;A39C3B;
    dw InstList_Tripper_VerticallyMoving_Right_1                         ;A39C3D;


;;; $9C3F: Instruction list - tripper - vertically still - moving right ;;;
InstList_Tripper_VerticallyStill_Right_0:
    dw Instruction_Tripper_Kamer2_SetMovingLeftXMovement                 ;A39C3F;

InstList_Tripper_VerticallyStill_Right_1:
    dw $0007,Spritemap_Tripper_VerticallyStill_Right_0                   ;A39C41;
    dw $0008,Spritemap_Tripper_VerticallyStill_Right_1                   ;A39C45;
    dw $0007,Spritemap_Tripper_VerticallyStill_Right_0                   ;A39C49;
    dw $0008,Spritemap_Tripper_VerticallyStill_Right_2                   ;A39C4D;
    dw Instruction_Common_GotoY                                          ;A39C51;
    dw InstList_Tripper_VerticallyStill_Right_1                          ;A39C53;


;;; $9C55: Instruction list - tripper - vertically still - moving left ;;;
InstList_Tripper_VerticallyStill_Left_0:
    dw Instruction_Tripper_Kamer2_SetMovingRightXMovement                ;A39C55;

InstList_Tripper_VerticallyStill_Left_1:
    dw $0007,Spritemap_Tripper_VerticallyStill_Left_0                    ;A39C57;
    dw $0008,Spritemap_Tripper_VerticallyStill_Left_1                    ;A39C5B;
    dw $0007,Spritemap_Tripper_VerticallyStill_Left_0                    ;A39C5F;
    dw $0008,Spritemap_Tripper_VerticallyStill_Left_2                    ;A39C63;
    dw Instruction_Common_GotoY                                          ;A39C67;
    dw InstList_Tripper_VerticallyStill_Left_1                           ;A39C69;


;;; $9C6B: Instruction - set moving left X movement ;;;
Instruction_Tripper_Kamer2_SetMovingLeftXMovement:
    LDX.W EnemyIndex                                                     ;A39C6B;
    LDA.W #$0000                                                         ;A39C6E;
    STA.L Platform.XMovementFunctionIndex,X                              ;A39C71;
    RTL                                                                  ;A39C75;


;;; $9C76: Instruction - set moving right X movement ;;;
Instruction_Tripper_Kamer2_SetMovingRightXMovement:
    LDX.W EnemyIndex                                                     ;A39C76;
    LDA.W #$0001                                                         ;A39C79;
    STA.L Platform.XMovementFunctionIndex,X                              ;A39C7C;
    RTL                                                                  ;A39C80;


;;; $9C81: Instruction - set moving left X movement ;;;
Instruction_Tripper_Kamer2_SetMovingLeftXMovement_duplicate:
; Clone of Instruction_Tripper_Kamer2_SetMovingLeftXMovement
    LDX.W EnemyIndex                                                     ;A39C81;
    LDA.W #$0000                                                         ;A39C84;
    STA.L Platform.XMovementFunctionIndex,X                              ;A39C87;
    RTL                                                                  ;A39C8B;


;;; $9C8C: Instruction - set moving right X movement ;;;
Instruction_Tripper_Kamer2_SetMovingRightXMovement_duplicate:
; Clone of Instruction_Tripper_Kamer2_SetMovingRightXMovement
    LDX.W EnemyIndex                                                     ;A39C8C;
    LDA.W #$0001                                                         ;A39C8F;
    STA.L Platform.XMovementFunctionIndex,X                              ;A39C92;
    RTL                                                                  ;A39C96;


;;; $9C97: Tripper / suspensor platform movement function pointers ;;;
FunctionPointers_Tripper_Kamer2:
  .XMovement:
; X movement function pointers
    dw Function_Tripper_Kamer2_XMovement_0_MovingLeft                    ;A39C97;
    dw Function_Tripper_Kamer2_XMovement_1_MovingRight                   ;A39C99;

  .YMovement:
; Y movement function pointers
    dw Function_Tripper_Kamer2_YMovement_Rising                          ;A39C9B;
    dw Function_Tripper_Kamer2_YMovement_1_Sinking                       ;A39C9D;


;;; $9C9F: Initialisation AI - enemy $D83F (suspensor platform) ;;;
InitAI_Kamer2:
    LDX.W EnemyIndex                                                     ;A39C9F;
    LDA.W #$FFFF                                                         ;A39CA2;
    STA.L Platform.suspensorPlatformFlag,X                               ;A39CA5;
    LDY.W #InstList_Kamer2_VerticallyStill_Left_0                        ;A39CA9;
    LDA.W Enemy.init0,X                                                  ;A39CAC;
    STA.L Platform.XMovementFunctionIndex,X                              ;A39CAF;
    BEQ InitAI_Tripper_Kamer2_Common                                     ;A39CB3;
    LDY.W #InstList_Kamer2_VerticallyStill_Right_0                       ;A39CB5;
    BRA InitAI_Tripper_Kamer2_Common                                     ;A39CB8;


;;; $9CBA: Initialisation AI - enemy $D7FF (tripper) ;;;
InitAI_Tripper:
    LDX.W EnemyIndex                                                     ;A39CBA;
    LDY.W #InstList_Tripper_VerticallyStill_Right_0                      ;A39CBD;
    LDA.W Enemy.init0,X                                                  ;A39CC0;
    STA.L Platform.XMovementFunctionIndex,X                              ;A39CC3;
    BEQ InitAI_Tripper_Kamer2_Common                                     ;A39CC7;
    LDY.W #InstList_Tripper_VerticallyStill_Left_0                       ;A39CC9; fallthrough to InitAI_Tripper_Kamer2_Common


;;; $9CCC: Tripper / suspensor platform common initialisation AI ;;;
InitAI_Tripper_Kamer2_Common:
    TYA                                                                  ;A39CCC;
    STA.W Enemy.instList,X                                               ;A39CCD;
    LDA.W Enemy.init1,X                                                  ;A39CD0;
    AND.W #$00FF                                                         ;A39CD3;
    ASL                                                                  ;A39CD6;
    ASL                                                                  ;A39CD7;
    ASL                                                                  ;A39CD8;
    TAY                                                                  ;A39CD9;
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,Y                         ;A39CDA;
    STA.W Platform.rightVelocity,X                                       ;A39CDD;
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,Y                       ;A39CE0;
    STA.W Platform.rightSubVelocity,X                                    ;A39CE3;
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+4,Y                       ;A39CE6;
    STA.W Platform.leftVelocity,X                                        ;A39CE9;
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+6,Y                       ;A39CEC;
    STA.W Platform.leftSubVelocity,X                                     ;A39CEF;
    LDA.W #$0000                                                         ;A39CF2;
    STA.L Platform.YMovementFunctionIndex,X                              ;A39CF5;
    STA.L Platform.verticallyMovingFlag,X                                ;A39CF9;
    STA.L Platform.verticallyStillFlag,X                                 ;A39CFD;
    LDA.W Enemy.YPosition,X                                              ;A39D01;
    INC                                                                  ;A39D04;
    STA.W Platform.targetYPosition,X                                     ;A39D05;
    STZ.W Platform.YSpeedTableIndex,X                                    ;A39D08;
    LDA.W Enemy.init1+1,X                                                ;A39D0B;
    AND.W #$00FF                                                         ;A39D0E;
    STA.L Platform.maximumYSpeedTableIndex,X                             ;A39D11;
    RTL                                                                  ;A39D15;


;;; $9D16: Main AI - enemy $D7FF/$D83F (tripper / suspensor platform) ;;;
MainAI_Tripper_Kamer2:
    LDX.W EnemyIndex                                                     ;A39D16;
    LDA.W #$0000                                                         ;A39D19;
    STA.L Platform.YMovementFunctionIndex,X                              ;A39D1C;
    JSL.L CheckIfEnemyIsTouchingSamusFromBelow                           ;A39D20;
    BEQ .SamusNotRiding                                                  ;A39D24;
    LDA.W #$0001                                                         ;A39D26;
    STA.L Platform.YMovementFunctionIndex,X                              ;A39D29;

  .SamusNotRiding:
    LDX.W EnemyIndex                                                     ;A39D2D;
    LDA.L Platform.XMovementFunctionIndex,X                              ;A39D30;
    ASL                                                                  ;A39D34;
    TAX                                                                  ;A39D35;
    JSR.W (FunctionPointers_Tripper_Kamer2_XMovement,X)                  ;A39D36;
    LDX.W EnemyIndex                                                     ;A39D39;
    LDA.L Platform.YMovementFunctionIndex,X                              ;A39D3C;
    ASL                                                                  ;A39D40;
    TAX                                                                  ;A39D41;
    JSR.W (FunctionPointers_Tripper_Kamer2_YMovement,X)                  ;A39D42;
    LDX.W EnemyIndex                                                     ;A39D45;
    LDA.L Platform.YMovementFunctionIndex,X                              ;A39D48;
    CMP.L Platform.previousYMovementFunctionIndex,X                      ;A39D4C;
    BEQ .noChange                                                        ;A39D50;
    STZ.W Platform.YSpeedTableIndex,X                                    ;A39D52;

  .noChange:
    LDA.L Platform.YMovementFunctionIndex,X                              ;A39D55;
    STA.L Platform.previousYMovementFunctionIndex,X                      ;A39D59;
    RTL                                                                  ;A39D5D;


;;; $9D5E: Tripper / suspensor platform X movement function - index 0: moving left ;;;
Function_Tripper_Kamer2_XMovement_0_MovingLeft:
    LDX.W EnemyIndex                                                     ;A39D5E;
    LDA.W Enemy.XPosition,X                                              ;A39D61;
    STA.L Platform.previousPosition,X                                    ;A39D64;
    LDA.W Platform.leftSubVelocity,X                                     ;A39D68;
    STA.B DP_Temp12                                                      ;A39D6B;
    LDA.W Platform.leftVelocity,X                                        ;A39D6D;
    STA.B DP_Temp14                                                      ;A39D70;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A39D72;
    BCC .return                                                          ;A39D76;
    LDA.W #$0001                                                         ;A39D78;
    STA.L Platform.XMovementFunctionIndex,X                              ;A39D7B;
    JSR.W SetPlatformInstList_VerticallyStill_MovingRight                ;A39D7F;

  .return:
    RTS                                                                  ;A39D82;


;;; $9D83: Tripper / suspensor platform X movement function - index 1: moving right ;;;
Function_Tripper_Kamer2_XMovement_1_MovingRight:
    LDX.W EnemyIndex                                                     ;A39D83;
    LDA.W Enemy.XPosition,X                                              ;A39D86;
    STA.L Platform.previousPosition,X                                    ;A39D89;
    LDA.W Platform.rightSubVelocity,X                                    ;A39D8D;
    STA.B DP_Temp12                                                      ;A39D90;
    LDA.W Platform.rightVelocity,X                                       ;A39D92;
    STA.B DP_Temp14                                                      ;A39D95;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A39D97;
    BCC .return                                                          ;A39D9B;
    LDA.W #$0000                                                         ;A39D9D;
    STA.L Platform.XMovementFunctionIndex,X                              ;A39DA0;
    JSR.W SetPlatformInstList_VerticallyStill_MovingLeft                 ;A39DA4;

  .return:
    RTS                                                                  ;A39DA7;


;;; $9DA8: Tripper / suspensor platform Y movement function - index 0: rising ;;;
Function_Tripper_Kamer2_YMovement_Rising:
    LDX.W EnemyIndex                                                     ;A39DA8;
    LDA.W Enemy.YPosition,X                                              ;A39DAB;
    CMP.W Platform.targetYPosition,X                                     ;A39DAE;
    BMI .notMoving                                                       ;A39DB1;
    JSR.W SetPlatformInstList_VerticallyMoving                           ;A39DB3;
    INC.W Platform.YSpeedTableIndex,X                                    ;A39DB6;
    LDA.W Platform.YSpeedTableIndex,X                                    ;A39DB9;
    CMP.L Platform.maximumYSpeedTableIndex,X                             ;A39DBC;
    BMI +                                                                ;A39DC0;
    LDA.L Platform.maximumYSpeedTableIndex,X                             ;A39DC2;
    STA.W Platform.YSpeedTableIndex,X                                    ;A39DC6;

+   ASL                                                                  ;A39DC9;
    ASL                                                                  ;A39DCA;
    ASL                                                                  ;A39DCB;
    TAY                                                                  ;A39DCC;
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+4,Y                  ;A39DCD;
    STA.B DP_Temp12                                                      ;A39DD0;
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+6,Y                  ;A39DD2;
    STA.B DP_Temp14                                                      ;A39DD5;
    JSL.L MoveEnemyDownBy_14_12                                          ;A39DD7;
    BCC .return                                                          ;A39DDB;

  .notMoving:
    STZ.W Platform.YSpeedTableIndex,X                                    ;A39DDD;
    JSR.W SetPlatformInstList_VerticallyStill                            ;A39DE0;

  .return:
    RTS                                                                  ;A39DE3;


;;; $9DE4: Tripper / suspensor platform Y movement function - index 1: sinking ;;;
Function_Tripper_Kamer2_YMovement_1_Sinking:
    LDX.W EnemyIndex                                                     ;A39DE4;
    LDA.W Enemy.YPosition,X                                              ;A39DE7;
    CMP.W Platform.targetYPosition,X                                     ;A39DEA; >_<
    JSR.W RTS_A39E46                                                     ;A39DED; >_<
    INC.W Platform.YSpeedTableIndex,X                                    ;A39DF0;
    LDA.W Platform.YSpeedTableIndex,X                                    ;A39DF3;
    CMP.L Platform.maximumYSpeedTableIndex,X                             ;A39DF6;
    BMI +                                                                ;A39DFA;
    LDA.L Platform.maximumYSpeedTableIndex,X                             ;A39DFC;
    STA.W Platform.YSpeedTableIndex,X                                    ;A39E00;

+   LDA.W Enemy.XPosition,X                                              ;A39E03;
    SEC                                                                  ;A39E06;
    SBC.L Platform.previousPosition,X                                    ;A39E07;
    CLC                                                                  ;A39E0B;
    ADC.W ExtraSamusXDisplacement                                        ;A39E0C;
    STA.W ExtraSamusXDisplacement                                        ;A39E0F;
    LDA.W Enemy.YPosition,X                                              ;A39E12;
    STA.L Platform.previousPosition,X                                    ;A39E15;
    LDA.W Platform.YSpeedTableIndex,X                                    ;A39E19;
    ASL                                                                  ;A39E1C;
    ASL                                                                  ;A39E1D;
    ASL                                                                  ;A39E1E;
    TAY                                                                  ;A39E1F;
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing,Y                    ;A39E20;
    STA.B DP_Temp12                                                      ;A39E23;
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+2,Y                  ;A39E25;
    STA.B DP_Temp14                                                      ;A39E28;
    JSL.L MoveEnemyDownBy_14_12                                          ;A39E2A;
    BCC .notCollidedWithBlock                                            ;A39E2E;
    STZ.W Platform.YSpeedTableIndex,X                                    ;A39E30;
    JSR.W SetPlatformInstList_VerticallyStill                            ;A39E33;

  .notCollidedWithBlock:
    LDA.W Enemy.YPosition,X                                              ;A39E36;
    SEC                                                                  ;A39E39;
    SBC.L Platform.previousPosition,X                                    ;A39E3A;
    CLC                                                                  ;A39E3E;
    ADC.W ExtraSamusYDisplacement                                        ;A39E3F;
    STA.W ExtraSamusYDisplacement                                        ;A39E42;
    RTS                                                                  ;A39E45;


;;; $9E46: RTS ;;;
RTS_A39E46:
    RTS                                                                  ;A39E46;


;;; $9E47: Set tripper / suspensor platform instruction list - vertically moving - moving left ;;;
SetPlatformInstList_VerticallyMoving_MovingLeft:
    LDX.W EnemyIndex                                                     ;A39E47;
    LDY.W #InstList_Tripper_VerticallyMoving_Left_0                      ;A39E4A;
    LDA.L Platform.suspensorPlatformFlag,X                               ;A39E4D;
    BPL .Tripper                                                         ;A39E51;
    LDY.W #InstList_Kamer2_VerticallyMoving_Left_0                       ;A39E53;

  .Tripper:
    TYA                                                                  ;A39E56;
    STA.W Enemy.instList,X                                               ;A39E57;
    LDA.W #$0001                                                         ;A39E5A;
    STA.W Enemy.instTimer,X                                              ;A39E5D;
    STZ.W Enemy.loopCounter,X                                            ;A39E60;
    RTS                                                                  ;A39E63;


;;; $9E64: Set tripper / suspensor platform instruction list - vertically moving - moving right ;;;
SetPlatformInstList_VerticallyMoving_MovingRight:
    LDX.W EnemyIndex                                                     ;A39E64;
    LDY.W #InstList_Tripper_VerticallyMoving_Right_0                     ;A39E67;
    LDA.L Platform.suspensorPlatformFlag,X                               ;A39E6A;
    BPL .Tripper                                                         ;A39E6E;
    LDY.W #InstList_Kamer2_VerticallyMoving_Right_0                      ;A39E70;

  .Tripper:
    TYA                                                                  ;A39E73;
    STA.W Enemy.instList,X                                               ;A39E74;
    LDA.W #$0001                                                         ;A39E77;
    STA.W Enemy.instTimer,X                                              ;A39E7A;
    STZ.W Enemy.loopCounter,X                                            ;A39E7D;
    RTS                                                                  ;A39E80;


;;; $9E81: Set vertically moving instruction list - vertically still - moving left ;;;
SetPlatformInstList_VerticallyStill_MovingLeft:
    LDX.W EnemyIndex                                                     ;A39E81;
    LDY.W #InstList_Tripper_VerticallyStill_Right_0                      ;A39E84;
    LDA.L Platform.suspensorPlatformFlag,X                               ;A39E87;
    BPL .Tripper                                                         ;A39E8B;
    LDY.W #InstList_Kamer2_VerticallyStill_Left_0                        ;A39E8D;

  .Tripper:
    TYA                                                                  ;A39E90;
    STA.W Enemy.instList,X                                               ;A39E91;
    LDA.W #$0001                                                         ;A39E94;
    STA.W Enemy.instTimer,X                                              ;A39E97;
    STZ.W Enemy.loopCounter,X                                            ;A39E9A;
    RTS                                                                  ;A39E9D;


;;; $9E9E: Set vertically moving instruction list - vertically still - moving right ;;;
SetPlatformInstList_VerticallyStill_MovingRight:
    LDX.W EnemyIndex                                                     ;A39E9E;
    LDY.W #InstList_Tripper_VerticallyStill_Left_0                       ;A39EA1;
    LDA.L Platform.suspensorPlatformFlag,X                               ;A39EA4;
    BPL .Tripper                                                         ;A39EA8;
    LDY.W #InstList_Kamer2_VerticallyStill_Right_0                       ;A39EAA;

  .Tripper:
    TYA                                                                  ;A39EAD;
    STA.W Enemy.instList,X                                               ;A39EAE;
    LDA.W #$0001                                                         ;A39EB1;
    STA.W Enemy.instTimer,X                                              ;A39EB4;
    STZ.W Enemy.loopCounter,X                                            ;A39EB7;
    RTS                                                                  ;A39EBA;


;;; $9EBB: Set tripper / suspensor platform instruction list - vertically moving ;;;
SetPlatformInstList_VerticallyMoving:
    LDX.W EnemyIndex                                                     ;A39EBB;
    LDA.L Platform.verticallyMovingFlag,X                                ;A39EBE;
    BNE .merge                                                           ;A39EC2;
    LDA.W #$0001                                                         ;A39EC4;
    STA.L Platform.verticallyMovingFlag,X                                ;A39EC7;
    LDA.L Platform.XMovementFunctionIndex,X                              ;A39ECB;
    BEQ .movingLeft                                                      ;A39ECF;
    JSR.W SetPlatformInstList_VerticallyMoving_MovingRight               ;A39ED1;
    BRA .merge                                                           ;A39ED4;

  .movingLeft:
    JSR.W SetPlatformInstList_VerticallyMoving_MovingLeft                ;A39ED6;

  .merge:
    LDA.W #$0000                                                         ;A39ED9;
    STA.L Platform.verticallyStillFlag,X                                 ;A39EDC;
    RTS                                                                  ;A39EE0;


;;; $9EE1: Set tripper / suspensor platform instruction list - vertically still ;;;
SetPlatformInstList_VerticallyStill:
    LDX.W EnemyIndex                                                     ;A39EE1;
    LDA.L Platform.verticallyStillFlag,X                                 ;A39EE4;
    BNE .merge                                                           ;A39EE8;
    LDA.W #$0001                                                         ;A39EEA;
    STA.L Platform.verticallyStillFlag,X                                 ;A39EED;
    LDA.L Platform.XMovementFunctionIndex,X                              ;A39EF1;
    BEQ .movingLeft                                                      ;A39EF5;
    JSR.W SetPlatformInstList_VerticallyStill_MovingRight                ;A39EF7;
    BRA .merge                                                           ;A39EFA;

  .movingLeft:
    JSR.W SetPlatformInstList_VerticallyStill_MovingLeft                 ;A39EFC;

  .merge:
    LDA.W #$0000                                                         ;A39EFF;
    STA.L Platform.verticallyMovingFlag,X                                ;A39F02;
    RTS                                                                  ;A39F06;


;;; $9F07: RTL. Enemy touch - enemy $D7FF/$D83F (tripper / suspensor platform) ;;;
RTL_A39F07:
    RTL                                                                  ;A39F07;


;;; $9F08: Enemy shot - enemy $D7FF (tripper) ;;;
EnemyShot_Tripper:
    JSL.L CommonA3_NormalEnemyShotAI                                     ;A39F08;
    LDX.W EnemyIndex                                                     ;A39F0C;
    LDA.W Enemy.freezeTimer,X                                            ;A39F0F;
    BEQ .return                                                          ;A39F12;
    LDA.L Platform.XMovementFunctionIndex,X                              ;A39F14;
    BEQ .movingLeft                                                      ;A39F18;
    LDA.W #Spritemap_Tripper_Frozen_MovingRight                          ;A39F1A;
    STA.W Enemy.spritemap,X                                              ;A39F1D;
    BRA .return                                                          ;A39F20;


  .movingLeft:
    LDA.W #Spritemap_Tripper_Frozen_MovingLeft                           ;A39F22;
    STA.W Enemy.spritemap,X                                              ;A39F25;

  .return:
    RTL                                                                  ;A39F28;


;;; $9F29: Tripper / suspensor platform spritemaps ;;;
Spritemap_Tripper_VerticallyMoving_Left_0:
    dw $0003                                                             ;A39F29;
    %spritemapEntry(0, $1F9, $08, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $4200, $F8, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $43F0, $F8, 0, 0, 2, 0, $100)

Spritemap_Tripper_VerticallyMoving_Left_1:
    dw $0003                                                             ;A39F3A;
    %spritemapEntry(1, $4200, $F8, 0, 0, 2, 0, $102)
    %spritemapEntry(0, $1F9, $08, 0, 0, 2, 0, $10F)
    %spritemapEntry(1, $43F0, $F8, 0, 0, 2, 0, $108)

Spritemap_Tripper_VerticallyMoving_Left_2:
    dw $0003                                                             ;A39F4B;
    %spritemapEntry(1, $4200, $F8, 0, 0, 2, 0, $102)
    %spritemapEntry(0, $1F9, $08, 0, 0, 2, 0, $10F)
    %spritemapEntry(1, $43F0, $F8, 0, 0, 2, 0, $104)

Spritemap_Tripper_VerticallyMoving_Right_0:
    dw $0003                                                             ;A39F5C;
    %spritemapEntry(0, $1FF, $08, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $43F0, $F8, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $4200, $F8, 0, 1, 2, 0, $100)

Spritemap_Tripper_VerticallyMoving_Right_1:
    dw $0003                                                             ;A39F6D;
    %spritemapEntry(1, $43F0, $F8, 0, 1, 2, 0, $102)
    %spritemapEntry(0, $1FF, $08, 0, 1, 2, 0, $10F)
    %spritemapEntry(1, $4200, $F8, 0, 1, 2, 0, $108)

Spritemap_Tripper_VerticallyMoving_Right_2:
    dw $0003                                                             ;A39F7E;
    %spritemapEntry(1, $43F0, $F8, 0, 1, 2, 0, $102)
    %spritemapEntry(0, $1FF, $08, 0, 1, 2, 0, $10F)
    %spritemapEntry(1, $4200, $F8, 0, 1, 2, 0, $104)

Spritemap_Tripper_VerticallyStill_Right_0:
    dw $0004                                                             ;A39F8F;
    %spritemapEntry(1, $4200, $F8, 0, 0, 2, 0, $102)
    %spritemapEntry(0, $0B, $02, 0, 0, 2, 0, $11D)
    %spritemapEntry(0, $03, $02, 0, 0, 2, 0, $11C)
    %spritemapEntry(1, $43F0, $F8, 0, 0, 2, 0, $100)

Spritemap_Tripper_VerticallyStill_Right_1:
    dw $0003                                                             ;A39FA5;
    %spritemapEntry(1, $4200, $F8, 0, 0, 2, 0, $102)
    %spritemapEntry(0, $02, $02, 0, 0, 2, 0, $11E)
    %spritemapEntry(1, $43F0, $F8, 0, 0, 2, 0, $104)

Spritemap_Tripper_VerticallyStill_Right_2:
    dw $0004                                                             ;A39FB6;
    %spritemapEntry(1, $4200, $F8, 0, 0, 2, 0, $102)
    %spritemapEntry(0, $0B, $02, 0, 0, 2, 0, $10D)
    %spritemapEntry(0, $03, $02, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $43F0, $F8, 0, 0, 2, 0, $108)

Spritemap_Tripper_VerticallyStill_Left_0:
    dw $0004                                                             ;A39FCC;
    %spritemapEntry(1, $43F0, $F8, 0, 1, 2, 0, $102)
    %spritemapEntry(0, $1ED, $02, 0, 1, 2, 0, $11D)
    %spritemapEntry(0, $1F5, $02, 0, 1, 2, 0, $11C)
    %spritemapEntry(1, $4200, $F8, 0, 1, 2, 0, $100)

Spritemap_Tripper_VerticallyStill_Left_1:
    dw $0003                                                             ;A39FE2;
    %spritemapEntry(1, $43F0, $F8, 0, 1, 2, 0, $102)
    %spritemapEntry(0, $1F6, $02, 0, 1, 2, 0, $11E)
    %spritemapEntry(1, $4200, $F8, 0, 1, 2, 0, $104)

Spritemap_Tripper_VerticallyStill_Left_2:
    dw $0004                                                             ;A39FF3;
    %spritemapEntry(1, $43F0, $F8, 0, 1, 2, 0, $102)
    %spritemapEntry(0, $1ED, $02, 0, 1, 2, 0, $10D)
    %spritemapEntry(0, $1F5, $02, 0, 1, 2, 0, $10C)
    %spritemapEntry(1, $4200, $F8, 0, 1, 2, 0, $108)

Spritemap_Tripper_Frozen_MovingLeft:
    dw $0002                                                             ;A3A009;
    %spritemapEntry(1, $00, $F8, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 2, 0, $108)

Spritemap_Tripper_Frozen_MovingRight:
    dw $0002                                                             ;A3A015;
    %spritemapEntry(1, $1F0, $F8, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $00, $F8, 0, 1, 2, 0, $108)

Spritemap_Kamer2_0:
    dw $0002                                                             ;A3A021;
    %spritemapEntry(1, $00, $F8, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 2, 0, $100)

Spritemap_Kamer2_1:
    dw $0002                                                             ;A3A02D;
    %spritemapEntry(1, $00, $F8, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 2, 0, $102)

Spritemap_Kamer2_2:
    dw $0002                                                             ;A3A039;
    %spritemapEntry(1, $00, $F8, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 2, 0, $104)

Spritemap_Kamer2_3:
    dw $0002                                                             ;A3A045;
    %spritemapEntry(1, $00, $F8, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 2, 0, $106)


;;; $A051: Palette - enemy $D87F/$D8BF (roach) ;;;
Palette_Sbug:
    dw $3800,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166                   ;A3A051;
    dw $0924,$435A,$3694,$15AD,$0508,$03FF,$0237,$00D1                   ;A3A061;


;;; $A071: Instruction list - facing up ;;;
InstList_Sbug_FacingUp:
    dw $0005,Spritemap_Sbug_FacingUp_0                                   ;A3A071;
    dw $0005,Spritemap_Sbug_FacingUp_1                                   ;A3A075;
    dw $0005,Spritemap_Sbug_FacingUp_0                                   ;A3A079;
    dw $0005,Spritemap_Sbug_FacingUp_2                                   ;A3A07D;
    dw Instruction_Common_GotoY                                          ;A3A081;
    dw InstList_Sbug_FacingUp                                            ;A3A083;


;;; $A085: Instruction list - facing up-left ;;;
InstList_Sbug_FacingUpLeft:
    dw $0005,Spritemap_Sbug_FacingUpLeft_0                               ;A3A085;
    dw $0005,Spritemap_Sbug_FacingUpLeft_1                               ;A3A089;
    dw $0005,Spritemap_Sbug_FacingUpLeft_0                               ;A3A08D;
    dw $0005,Spritemap_Sbug_FacingUpLeft_2                               ;A3A091;
    dw Instruction_Common_GotoY                                          ;A3A095;
    dw InstList_Sbug_FacingUpLeft                                        ;A3A097;


;;; $A099: Instruction list - facing left ;;;
InstList_Sbug_FacingLeft:
    dw $0005,Spritemap_Sbug_FacingLeft_0                                 ;A3A099;
    dw $0005,Spritemap_Sbug_FacingLeft_1                                 ;A3A09D;
    dw $0005,Spritemap_Sbug_FacingLeft_0                                 ;A3A0A1;
    dw $0005,Spritemap_Sbug_FacingLeft_2                                 ;A3A0A5;
    dw Instruction_Common_GotoY                                          ;A3A0A9;
    dw InstList_Sbug_FacingLeft                                          ;A3A0AB;


;;; $A0AD: Instruction list - facing down-left ;;;
InstList_Sbug_FacingDownLeft:
    dw $0005,Spritemap_Sbug_FacingDownLeft_0                             ;A3A0AD;
    dw $0005,Spritemap_Sbug_FacingDownLeft_1                             ;A3A0B1;
    dw $0005,Spritemap_Sbug_FacingDownLeft_0                             ;A3A0B5;
    dw $0005,Spritemap_Sbug_FacingDownLeft_2                             ;A3A0B9;
    dw Instruction_Common_GotoY                                          ;A3A0BD;
    dw InstList_Sbug_FacingDownLeft                                      ;A3A0BF;


;;; $A0C1: Instruction list - facing down ;;;
InstList_Sbug_FacingDown:
    dw $0005,Spritemap_Sbug_FacingDown_0                                 ;A3A0C1;
    dw $0005,Spritemap_Sbug_FacingDown_1                                 ;A3A0C5;
    dw $0005,Spritemap_Sbug_FacingDown_0                                 ;A3A0C9;
    dw $0005,Spritemap_Sbug_FacingDown_2                                 ;A3A0CD;
    dw Instruction_Common_GotoY                                          ;A3A0D1;
    dw InstList_Sbug_FacingDown                                          ;A3A0D3;


;;; $A0D5: Instruction list - facing down-right ;;;
InstList_Sbug_FacingDownRight:
    dw $0005,Spritemap_Sbug_FacingDownRight_0                            ;A3A0D5;
    dw $0005,Spritemap_Sbug_FacingDownRight_1                            ;A3A0D9;
    dw $0005,Spritemap_Sbug_FacingDownRight_0                            ;A3A0DD;
    dw $0005,Spritemap_Sbug_FacingDownRight_2                            ;A3A0E1;
    dw Instruction_Common_GotoY                                          ;A3A0E5;
    dw InstList_Sbug_FacingDownRight                                     ;A3A0E7;


;;; $A0E9: Instruction list - facing right ;;;
InstList_Sbug_FacingRight:
    dw $0005,Spritemap_Sbug_FacingRight_0                                ;A3A0E9;
    dw $0005,Spritemap_Sbug_FacingRight_1                                ;A3A0ED;
    dw $0005,Spritemap_Sbug_FacingRight_0                                ;A3A0F1;
    dw $0005,Spritemap_Sbug_FacingRight_2                                ;A3A0F5;
    dw Instruction_Common_GotoY                                          ;A3A0F9;
    dw InstList_Sbug_FacingRight                                         ;A3A0FB;


;;; $A0FD: Instruction list - facing up-right ;;;
InstList_Sbug_FacingUpRight:
    dw $0005,Spritemap_Sbug_FacingUpRight_0                              ;A3A0FD;
    dw $0005,Spritemap_Sbug_FacingUpRight_1                              ;A3A101;
    dw $0005,Spritemap_Sbug_FacingUpRight_0                              ;A3A105;
    dw $0005,Spritemap_Sbug_FacingUpRight_2                              ;A3A109;
    dw Instruction_Common_GotoY                                          ;A3A10D;
    dw InstList_Sbug_FacingUpRight                                       ;A3A10F;


;;; $A111: Roach instruction list pointers ;;;
InstListPointers_Sbug:
    dw InstList_Sbug_FacingUp                                            ;A3A111;
    dw InstList_Sbug_FacingUpLeft                                        ;A3A113;
    dw InstList_Sbug_FacingLeft                                          ;A3A115;
    dw InstList_Sbug_FacingDownLeft                                      ;A3A117;
    dw InstList_Sbug_FacingDown                                          ;A3A119;
    dw InstList_Sbug_FacingDownRight                                     ;A3A11B;
    dw InstList_Sbug_FacingRight                                         ;A3A11D;
    dw InstList_Sbug_FacingUpRight                                       ;A3A11F;


;;; $A121: Roach activate function pointers ;;;
ActivateFunctionPointers_Sbug:
; Indexed by [enemy parameter 2 high]
    dw Function_Sbug_Activate_0_MoveForwards                             ;A3A121;
    dw Function_Sbug_Activate_1_MoveForwardsInAZigZag                    ;A3A123;
    dw Function_Sbug_Activate_2_MoveAlong45DegreeAngleTowardsSamus       ;A3A125;
    dw Function_Sbug_Activate_3_MoveRandomly_WaitForSamusIfHitBlock      ;A3A127;
    dw Function_Sbug_Activate_4_MoveRandomly_ReverseUntil6BlockAway      ;A3A129;
    dw Function_Sbug_Activate_5_MoveForwards_WaitForSamus                ;A3A12B;
    dw Function_Sbug_Activate_6_MoveAlong45DegreeAngleAwayFromSamus      ;A3A12D;


;;; $A12F: Set roach instruction list ;;;
SetSbugInstList:
    LDX.W EnemyIndex                                                     ;A3A12F;
    LDA.L Sbug.newInstList,X                                             ;A3A132;
    CMP.L Sbug.instList,X                                                ;A3A136;
    BEQ .return                                                          ;A3A13A;
    STA.L Sbug.instList,X                                                ;A3A13C;
    STA.W Enemy.instList,X                                               ;A3A140;
    LDA.W #$0001                                                         ;A3A143;
    STA.W Enemy.instTimer,X                                              ;A3A146;
    STZ.W Enemy.loopCounter,X                                            ;A3A149;

  .return:
    RTS                                                                  ;A3A14C;


;;; $A14D: Initialisation AI - enemy $D87F/$D8BF (roach) ;;;
InitAI_Sbug:
    LDX.W EnemyIndex                                                     ;A3A14D;
    LDA.W #$0000                                                         ;A3A150;
    STA.L Sbug.instList,X                                                ;A3A153;
    STA.L Sbug.newInstList,X                                             ;A3A157;
    JSR.W CalculateMovingForwardSpeeds                                   ;A3A15B;
    JSR.W CalculateMovingLeftVelocities                                  ;A3A15E;
    JSR.W CalculateMovingRightVelocities                                 ;A3A161;
    JSR.W DetermineFacingForwardInstListIndex                            ;A3A164;
    JSR.W DetermineFacingLeftInstListIndex                               ;A3A167;
    JSR.W DetermineFacingRightInstListIndex                              ;A3A16A;
    LDA.L Sbug.movingForwardInstListIndex,X                              ;A3A16D;
    TAY                                                                  ;A3A171;
    LDA.W InstListPointers_Sbug,Y                                        ;A3A172;
    STA.L Sbug.newInstList,X                                             ;A3A175;
    JSR.W SetSbugInstList                                                ;A3A179;
    LDA.W #Function_Sbug_WaitForSamusToGetNear                           ;A3A17C;
    STA.W Sbug.function,X                                                ;A3A17F;
    RTL                                                                  ;A3A182;


;;; $A183: Calculate moving forward speeds ;;;
CalculateMovingForwardSpeeds:
    LDA.W Enemy.init0,X                                                  ;A3A183;
    AND.W #$00FF                                                         ;A3A186;
    STA.B DP_Temp14                                                      ;A3A189;
    LDA.W Enemy.init0+1,X                                                ;A3A18B;
    AND.W #$00FF                                                         ;A3A18E;
    STA.B DP_Temp12                                                      ;A3A191;
    JSL.L Do_Some_Math_With_Sine_Cosine_Terrible_Label_Name              ;A3A193; ($16.$18, $1A.$1C) = ([$14] * |cos([$12] * pi / 80h)|, [$14] * |sin([$12] * pi / 80h)|)
    LDA.B DP_Temp16                                                      ;A3A197;
    STA.L Sbug.movingForwardXSpeed,X                                     ;A3A199;
    LDA.B DP_Temp18                                                      ;A3A19D;
    STA.L Sbug.movingForwardXSubSpeed,X                                  ;A3A19F;
    LDA.B DP_Temp1A                                                      ;A3A1A3;
    STA.L Sbug.movingForwardYSpeed,X                                     ;A3A1A5;
    LDA.B DP_Temp1C                                                      ;A3A1A9;
    STA.L Sbug.movingForwardYSubSpeed,X                                  ;A3A1AB;
    RTS                                                                  ;A3A1AF;


if !FEATURE_KEEP_UNREFERENCED
;;; $A1B0: Unused. Calculate moving forward velocities ;;;
UNUSED_CalculateMovingForwardVelocities_A3A1B0:
; Not sure why, but moving forward calculations are done with CalculateMovingForwardSpeeds instead
    LDA.W Enemy.init0,X                                                  ;A3A1B0;
    AND.W #$00FF                                                         ;A3A1B3;
    STA.W Temp_Unknown0E32                                               ;A3A1B6;
    LDA.W Enemy.init0+1,X                                                ;A3A1B9;
    AND.W #$00FF                                                         ;A3A1BC;
    JSL.L EightBitCosineMultiplication_A0B0B2                            ;A3A1BF;
    LDA.W Temp_Unknown0E36                                               ;A3A1C3;
    STA.L Sbug.movingForwardXSpeed,X                                     ;A3A1C6;
    LDA.W Temp_Unknown0E38                                               ;A3A1CA;
    STA.L Sbug.movingForwardXSubSpeed,X                                  ;A3A1CD;
    LDA.W Enemy.init0,X                                                  ;A3A1D1;
    AND.W #$00FF                                                         ;A3A1D4;
    STA.W Temp_Unknown0E32                                               ;A3A1D7;
    LDA.W Enemy.init0+1,X                                                ;A3A1DA;
    AND.W #$00FF                                                         ;A3A1DD;
    JSL.L EightBitNegativeSineMultiplication_A0B0C6                      ;A3A1E0;
    LDA.W Temp_Unknown0E36                                               ;A3A1E4;
    STA.L Sbug.movingForwardYSpeed,X                                     ;A3A1E7;
    LDA.W Temp_Unknown0E38                                               ;A3A1EB;
    STA.L Sbug.movingForwardYSubSpeed,X                                  ;A3A1EE;
    RTS                                                                  ;A3A1F2;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $A1F3: Calculate moving left velocities ;;;
CalculateMovingLeftVelocities:
    LDA.W Enemy.init0,X                                                  ;A3A1F3;
    AND.W #$00FF                                                         ;A3A1F6;
    STA.W Temp_Unknown0E32                                               ;A3A1F9;
    LDA.W Enemy.init0+1,X                                                ;A3A1FC;
    SEC                                                                  ;A3A1FF;
    SBC.W #$0020                                                         ;A3A200;
    AND.W #$00FF                                                         ;A3A203;
    JSL.L EightBitCosineMultiplication_A0B0B2                            ;A3A206;
    LDA.W Temp_Unknown0E36                                               ;A3A20A;
    STA.L Sbug.movingLeftXVelocity,X                                     ;A3A20D;
    LDA.W Temp_Unknown0E38                                               ;A3A211;
    STA.L Sbug.movingLeftXSubVelocity,X                                  ;A3A214;
    LDA.W Enemy.init0,X                                                  ;A3A218;
    AND.W #$00FF                                                         ;A3A21B;
    STA.W Temp_Unknown0E32                                               ;A3A21E;
    LDA.W Enemy.init0+1,X                                                ;A3A221;
    SEC                                                                  ;A3A224;
    SBC.W #$0020                                                         ;A3A225;
    AND.W #$00FF                                                         ;A3A228;
    JSL.L EightBitNegativeSineMultiplication_A0B0C6                      ;A3A22B;
    LDA.W Temp_Unknown0E36                                               ;A3A22F;
    STA.L Sbug.movingLeftYVelocity,X                                     ;A3A232;
    LDA.W Temp_Unknown0E38                                               ;A3A236;
    STA.L Sbug.movingLeftYSubVelocity,X                                  ;A3A239;
    RTS                                                                  ;A3A23D;


;;; $A23E: Calculate moving right velocities ;;;
CalculateMovingRightVelocities:
    LDA.W Enemy.init0,X                                                  ;A3A23E;
    AND.W #$00FF                                                         ;A3A241;
    STA.W Temp_Unknown0E32                                               ;A3A244;
    LDA.W Enemy.init0+1,X                                                ;A3A247;
    CLC                                                                  ;A3A24A;
    ADC.W #$0020                                                         ;A3A24B;
    AND.W #$00FF                                                         ;A3A24E;
    JSL.L EightBitCosineMultiplication_A0B0B2                            ;A3A251;
    LDA.W Temp_Unknown0E36                                               ;A3A255;
    STA.L Sbug.movingRightXVelocity,X                                    ;A3A258;
    LDA.W Temp_Unknown0E38                                               ;A3A25C;
    STA.L Sbug.movingRightXSubVelocity,X                                 ;A3A25F;
    LDA.W Enemy.init0,X                                                  ;A3A263;
    AND.W #$00FF                                                         ;A3A266;
    STA.W Temp_Unknown0E32                                               ;A3A269;
    LDA.W Enemy.init0+1,X                                                ;A3A26C;
    CLC                                                                  ;A3A26F;
    ADC.W #$0020                                                         ;A3A270;
    AND.W #$00FF                                                         ;A3A273;
    JSL.L EightBitNegativeSineMultiplication_A0B0C6                      ;A3A276;
    LDA.W Temp_Unknown0E36                                               ;A3A27A;
    STA.L Sbug.movingRightYVelocity,X                                    ;A3A27D;
    LDA.W Temp_Unknown0E38                                               ;A3A281;
    STA.L Sbug.movingRightYSubVelocity,X                                 ;A3A284;
    RTS                                                                  ;A3A288;


;;; $A289: Determine facing forward instruction list index ;;;
DetermineFacingForwardInstListIndex:
    LDA.W Enemy.init0+1,X                                                ;A3A289;
    SEC                                                                  ;A3A28C;
    SBC.W #$0030                                                         ;A3A28D;
    AND.W #$00FF                                                         ;A3A290;
    LSR                                                                  ;A3A293;
    LSR                                                                  ;A3A294;
    LSR                                                                  ;A3A295;
    LSR                                                                  ;A3A296;
    LSR                                                                  ;A3A297;
    ASL                                                                  ;A3A298;
    STA.L Sbug.movingForwardInstListIndex,X                              ;A3A299;
    RTS                                                                  ;A3A29D;


;;; $A29E: Determine facing left instruction list index ;;;
DetermineFacingLeftInstListIndex:
    LDA.W Enemy.init0+1,X                                                ;A3A29E;
    SEC                                                                  ;A3A2A1;
    SBC.W #$0030                                                         ;A3A2A2;
    SEC                                                                  ;A3A2A5;
    SBC.W #$0020                                                         ;A3A2A6;
    AND.W #$00FF                                                         ;A3A2A9;
    LSR                                                                  ;A3A2AC;
    LSR                                                                  ;A3A2AD;
    LSR                                                                  ;A3A2AE;
    LSR                                                                  ;A3A2AF;
    LSR                                                                  ;A3A2B0;
    ASL                                                                  ;A3A2B1;
    STA.L Sbug.movingLeftInstListIndex,X                                 ;A3A2B2;
    RTS                                                                  ;A3A2B6;


;;; $A2B7: Determine facing right instruction list index ;;;
DetermineFacingRightInstListIndex:
    LDA.W Enemy.init0+1,X                                                ;A3A2B7;
    SEC                                                                  ;A3A2BA;
    SBC.W #$0030                                                         ;A3A2BB;
    CLC                                                                  ;A3A2BE;
    ADC.W #$0020                                                         ;A3A2BF;
    AND.W #$00FF                                                         ;A3A2C2;
    LSR                                                                  ;A3A2C5;
    LSR                                                                  ;A3A2C6;
    LSR                                                                  ;A3A2C7;
    LSR                                                                  ;A3A2C8;
    LSR                                                                  ;A3A2C9;
    ASL                                                                  ;A3A2CA;
    STA.L Sbug.movingRightInstListIndex,X                                ;A3A2CB;
    RTS                                                                  ;A3A2CF;


;;; $A2D0: Main AI - enemy $D87F/$D8BF (roach) ;;;
MainAI_Sbug:
    LDX.W EnemyIndex                                                     ;A3A2D0;
    JSR.W (Sbug.function,X)                                              ;A3A2D3;
    RTL                                                                  ;A3A2D6;


;;; $A2D7: Roach function - wait for Samus to get near ;;;
Function_Sbug_WaitForSamusToGetNear:
    LDX.W EnemyIndex                                                     ;A3A2D7;
    LDA.W Enemy.init1,X                                                  ;A3A2DA;
    AND.W #$00FF                                                         ;A3A2DD;
    JSL.L IsSamusWithinAPixelColumnsOfEnemy                              ;A3A2E0;
    BEQ .return                                                          ;A3A2E4;
    LDA.W Enemy.init1,X                                                  ;A3A2E6;
    AND.W #$00FF                                                         ;A3A2E9;
    JSL.L IsSamusWithingAPixelRowsOfEnemy                                ;A3A2EC;
    BEQ .return                                                          ;A3A2F0;
    LDA.W Enemy.init1+1,X                                                ;A3A2F2;
    AND.W #$00FF                                                         ;A3A2F5;
    ASL                                                                  ;A3A2F8;
    TAY                                                                  ;A3A2F9;
    LDA.W ActivateFunctionPointers_Sbug,Y                                ;A3A2FA;
    STA.W Sbug.function,X                                                ;A3A2FD;

  .return:
    RTS                                                                  ;A3A300;


;;; $A301: Roach function - activate - index 0 (move forwards) ;;;
Function_Sbug_Activate_0_MoveForwards:
    LDX.W EnemyIndex                                                     ;A3A301;
    LDA.W #Function_Sbug_Activated_0_MoveForwards                        ;A3A304;
    STA.W Sbug.function,X                                                ;A3A307;
    RTS                                                                  ;A3A30A;


;;; $A30B: Roach function - activate - index 1 (move forwards in a zigzag) ;;;
Function_Sbug_Activate_1_MoveForwardsInAZigZag:
    LDX.W EnemyIndex                                                     ;A3A30B;
    LDA.W #Function_Sbug_Activated_1_MoveForwardsInAZigZag               ;A3A30E;
    STA.W Sbug.function,X                                                ;A3A311;
    RTS                                                                  ;A3A314;


;;; $A315: Roach function - activate - index 3 (move randomly and wait for Samus if hit block) ;;;
Function_Sbug_Activate_3_MoveRandomly_WaitForSamusIfHitBlock:
    LDX.W EnemyIndex                                                     ;A3A315;
    LDA.W #$000B                                                         ;A3A318;
    STA.W RandomNumberSeed                                               ;A3A31B;
    LDA.W #Function_Sbug_Activated_3_MoveRandomly_WaitForSamusIfHitBlock ;A3A31E;
    STA.W Sbug.function,X                                                ;A3A321;
    RTS                                                                  ;A3A324;


;;; $A325: Roach function - activate - index 4 (move in a random direction then reverse until 6 blocks away from Samus) ;;;
Function_Sbug_Activate_4_MoveRandomly_ReverseUntil6BlockAway:
    LDX.W EnemyIndex                                                     ;A3A325;
    LDA.W #$0200                                                         ;A3A328;
    STA.W Sbug.straightMovementTimer,X                                   ;A3A32B;
    LDA.W #$000B                                                         ;A3A32E;
    STA.W RandomNumberSeed                                               ;A3A331;
    LDA.W #Function_Sbug_Activated_4_MoveRandomly_ReverseUntil6BlocksAway ;A3A334;
    STA.W Sbug.function,X                                                ;A3A337;
    RTS                                                                  ;A3A33A;


;;; $A33B: Roach function - activate - index 5 (move forwards then wait for Samus) ;;;
Function_Sbug_Activate_5_MoveForwards_WaitForSamus:
    LDX.W EnemyIndex                                                     ;A3A33B;
    LDA.W #$0020                                                         ;A3A33E;
    STA.W Sbug.movementTimer,X                                           ;A3A341;
    LDA.W #Function_Sbug_Activated_5_MoveForwards_WaitForSamus           ;A3A344;
    STA.W Sbug.function,X                                                ;A3A347;
    RTS                                                                  ;A3A34A;


;;; $A34B: Roach function - activate - index 2 (move towards Samus) ;;;
Function_Sbug_Activate_2_MoveAlong45DegreeAngleTowardsSamus:
    LDX.W EnemyIndex                                                     ;A3A34B;
    JSL.L CalculateAngleOfSamusFromEnemy                                 ;A3A34E;
    SEC                                                                  ;A3A352;
    SBC.W #$0040                                                         ;A3A353;
    EOR.W #$FFFF                                                         ;A3A356;
    INC                                                                  ;A3A359;
    CLC                                                                  ;A3A35A;
    ADC.W #$0100                                                         ;A3A35B;
    AND.W #$00FF                                                         ;A3A35E;
    STA.W Sbug.customAngle,X                                             ;A3A361;
    JSR.W CalculateCustomVelocities                                      ;A3A364;
    JSR.W DetermineCustomInstListIndex                                   ;A3A367;
    LDA.L Sbug.customInstListIndex,X                                     ;A3A36A;
    TAY                                                                  ;A3A36E;
    LDA.W InstListPointers_Sbug,Y                                        ;A3A36F;
    STA.L Sbug.newInstList,X                                             ;A3A372;
    JSR.W SetSbugInstList                                                ;A3A376;
    LDA.W #Function_Sbug_Activated_2_MoveAlong45DegreeAngleTowardsSamus  ;A3A379;
    STA.W Sbug.function,X                                                ;A3A37C;
    RTS                                                                  ;A3A37F;


;;; $A380: Roach function - activate - index 6 (away from Samus) ;;;
Function_Sbug_Activate_6_MoveAlong45DegreeAngleAwayFromSamus:
    LDX.W EnemyIndex                                                     ;A3A380;
    JSL.L CalculateAngleOfSamusFromEnemy                                 ;A3A383;
    SEC                                                                  ;A3A387;
    SBC.W #$0040                                                         ;A3A388;
    EOR.W #$FFFF                                                         ;A3A38B;
    INC                                                                  ;A3A38E;
    CLC                                                                  ;A3A38F;
    ADC.W #$0080                                                         ;A3A390;
    AND.W #$00FF                                                         ;A3A393;
    STA.W Sbug.customAngle,X                                             ;A3A396;
    JSR.W CalculateCustomVelocities                                      ;A3A399;
    JSR.W DetermineCustomInstListIndex                                   ;A3A39C;
    LDA.L Sbug.customInstListIndex,X                                     ;A3A39F;
    TAY                                                                  ;A3A3A3;
    LDA.W InstListPointers_Sbug,Y                                        ;A3A3A4;
    STA.L Sbug.newInstList,X                                             ;A3A3A7;
    JSR.W SetSbugInstList                                                ;A3A3AB;
    LDA.W #Function_Sbug_Activated_6_MoveAlong45DegAngleAwayFromSamus    ;A3A3AE;
    STA.W Sbug.function,X                                                ;A3A3B1;
    RTS                                                                  ;A3A3B4;


;;; $A3B5: Determine custom instruction list index ;;;
DetermineCustomInstListIndex:
    LDA.W Sbug.customAngle,X                                             ;A3A3B5;
    SEC                                                                  ;A3A3B8;
    SBC.W #$0030                                                         ;A3A3B9;
    AND.W #$00FF                                                         ;A3A3BC;
    LSR                                                                  ;A3A3BF;
    LSR                                                                  ;A3A3C0;
    LSR                                                                  ;A3A3C1;
    LSR                                                                  ;A3A3C2;
    LSR                                                                  ;A3A3C3;
    ASL                                                                  ;A3A3C4;
    STA.L Sbug.customInstListIndex,X                                     ;A3A3C5;
    RTS                                                                  ;A3A3C9;


;;; $A3CA: Calculate custom velocities ;;;
CalculateCustomVelocities:
    LDA.W Enemy.init0,X                                                  ;A3A3CA;
    AND.W #$00FF                                                         ;A3A3CD;
    STA.W Temp_Unknown0E32                                               ;A3A3D0;
    LDA.W Sbug.customAngle,X                                             ;A3A3D3;
    JSL.L EightBitCosineMultiplication_A0B0B2                            ;A3A3D6;
    LDA.W Temp_Unknown0E36                                               ;A3A3DA;
    STA.L Sbug.customXVelocity,X                                         ;A3A3DD;
    LDA.W Temp_Unknown0E38                                               ;A3A3E1;
    STA.L Sbug.customXSubVelocity,X                                      ;A3A3E4;
    LDA.W Enemy.init0,X                                                  ;A3A3E8;
    AND.W #$00FF                                                         ;A3A3EB;
    STA.W Temp_Unknown0E32                                               ;A3A3EE;
    LDA.W Sbug.customAngle,X                                             ;A3A3F1;
    JSL.L EightBitNegativeSineMultiplication_A0B0C6                      ;A3A3F4;
    LDA.W Temp_Unknown0E36                                               ;A3A3F8;
    STA.L Sbug.customYVelocity,X                                         ;A3A3FB;
    LDA.W Temp_Unknown0E38                                               ;A3A3FF;
    STA.L Sbug.customYSubVelocity,X                                      ;A3A402;
    RTS                                                                  ;A3A406;


;;; $A407: Roach function - activated - index 0 (move forwards) ;;;
Function_Sbug_Activated_0_MoveForwards:
    LDX.W EnemyIndex                                                     ;A3A407;
    JSR.W MoveSbugForward                                                ;A3A40A;
    RTS                                                                  ;A3A40D;


;;; $A40E: Roach function - activated - index 1 (move forwards in a zigzag) ;;;
Function_Sbug_Activated_1_MoveForwardsInAZigZag:
    LDX.W EnemyIndex                                                     ;A3A40E;
    LDA.W Enemy.frameCounter,X                                           ;A3A411;
    AND.W #$0010                                                         ;A3A414;
    BNE .right                                                           ;A3A417;
    LDA.L Sbug.movingLeftInstListIndex,X                                 ;A3A419;
    TAY                                                                  ;A3A41D;
    LDA.W InstListPointers_Sbug,Y                                        ;A3A41E;
    STA.L Sbug.newInstList,X                                             ;A3A421;
    JSR.W SetSbugInstList                                                ;A3A425;
    JSR.W MoveSbugLeft                                                   ;A3A428;
    BRA .return                                                          ;A3A42B;

  .right:
    LDA.L Sbug.movingRightInstListIndex,X                                ;A3A42D;
    TAY                                                                  ;A3A431;
    LDA.W InstListPointers_Sbug,Y                                        ;A3A432;
    STA.L Sbug.newInstList,X                                             ;A3A435;
    JSR.W SetSbugInstList                                                ;A3A439;
    JSR.W MoveSbugRight                                                  ;A3A43C;

  .return:
    RTS                                                                  ;A3A43F;


;;; $A440: Roach function - activated - index 2 (move towards Samus) ;;;
Function_Sbug_Activated_2_MoveAlong45DegreeAngleTowardsSamus:
    LDX.W EnemyIndex                                                     ;A3A440;
    JSR.W MoveSbugAlongCustomAngle                                       ;A3A443;
    RTS                                                                  ;A3A446;


;;; $A447: Roach function - activated - index 6 (move away from Samus) ;;;
Function_Sbug_Activated_6_MoveAlong45DegAngleAwayFromSamus:
    LDX.W EnemyIndex                                                     ;A3A447;
    JSR.W MoveSbugAlongCustomAngle                                       ;A3A44A;
    RTS                                                                  ;A3A44D;


;;; $A44E: Roach function - activated - index 5 (move forwards then wait for Samus) ;;;
Function_Sbug_Activated_5_MoveForwards_WaitForSamus:
    LDX.W EnemyIndex                                                     ;A3A44E;
    DEC.W Sbug.movementTimer,X                                           ;A3A451;
    BMI .wait                                                            ;A3A454;
    JSR.W MoveSbugForward                                                ;A3A456;
    BRA .return                                                          ;A3A459;

  .wait:
    LDA.W #Function_Sbug_WaitForSamusToGetNear                           ;A3A45B;
    STA.W Sbug.function,X                                                ;A3A45E;

  .return:
    RTS                                                                  ;A3A461;


;;; $A462: Roach function - move along custom angle and wait for Samus if hit block ;;;
Function_Sbug_MoveAlongCustomAngle_WaitForSamusIfHitBlock:
    LDX.W EnemyIndex                                                     ;A3A462;
    DEC.W Sbug.movementTimer,X                                           ;A3A465;
    BMI .timerExpired                                                    ;A3A468;
    JSR.W MoveSbugAlongCustomAngle_WaitForSamusIfHitBlock                ;A3A46A;
    BRA .return                                                          ;A3A46D;

  .timerExpired:
    LDA.W #Function_Sbug_Activated_3_MoveRandomly_WaitForSamusIfHitBlock ;A3A46F;
    STA.W Sbug.function,X                                                ;A3A472;

  .return:
    RTS                                                                  ;A3A475;


;;; $A476: Roach function - move straight along custom angle then reverse until 6 blocks away from Samus ;;;
Function_Sbug_MoveStraightAlongAngle_ReverseUntil6BlocksAway:
    LDX.W EnemyIndex                                                     ;A3A476;
    DEC.W Sbug.straightMovementTimer,X                                   ;A3A479;
    BMI .move                                                            ;A3A47C;
    DEC.W Sbug.movementTimer,X                                           ;A3A47E;
    BMI .done                                                            ;A3A481;
    LDA.W Enemy.XPosition,X                                              ;A3A483;
    SEC                                                                  ;A3A486;
    SBC.W SamusXPosition                                                 ;A3A487;
    JSL.L NegateA_A0B067                                                 ;A3A48A;
    CMP.W #$0060                                                         ;A3A48E;
    BPL +                                                                ;A3A491;
    BRA .move                                                            ;A3A493;

+   LDA.W Enemy.YPosition,X                                              ;A3A495;
    SEC                                                                  ;A3A498;
    SBC.W SamusYPosition                                                 ;A3A499;
    JSL.L NegateA_A0B067                                                 ;A3A49C;
    CMP.W #$0060                                                         ;A3A4A0;
    BPL .reverse                                                         ;A3A4A3;
    BRA .move                                                            ;A3A4A5;

  .reverse:
    JSR.W ReverseSbugCustomAngle                                         ;A3A4A7;

  .move:
    JSR.W MoveSbugAlongCustomAngle                                       ;A3A4AA;
    BRA .return                                                          ;A3A4AD;

  .done:
    LDA.W #Function_Sbug_Activated_4_MoveRandomly_ReverseUntil6BlocksAway ;A3A4AF;
    STA.W Sbug.function,X                                                ;A3A4B2;

  .return:
    RTS                                                                  ;A3A4B5;


;;; $A4B6: Roach function - activated - index 4 (move in a random direction then reverse until 6 blocks away from Samus) ;;;
Function_Sbug_Activated_4_MoveRandomly_ReverseUntil6BlocksAway:
    LDX.W EnemyIndex                                                     ;A3A4B6;
    JSL.L GenerateRandomNumber                                           ;A3A4B9;
    AND.W #$00FF                                                         ;A3A4BD;
    SEC                                                                  ;A3A4C0;
    SBC.W #$0040                                                         ;A3A4C1;
    AND.W #$00FF                                                         ;A3A4C4;
    CLC                                                                  ;A3A4C7;
    ADC.W Sbug.customAngle,X                                             ;A3A4C8;
    STA.W Sbug.customAngle,X                                             ;A3A4CB;
    JSR.W CalculateCustomVelocities                                      ;A3A4CE;
    JSR.W DetermineCustomInstListIndex                                   ;A3A4D1;
    LDA.L Sbug.customInstListIndex,X                                     ;A3A4D4;
    TAY                                                                  ;A3A4D8;
    LDA.W InstListPointers_Sbug,Y                                        ;A3A4D9;
    STA.L Sbug.newInstList,X                                             ;A3A4DC;
    JSR.W SetSbugInstList                                                ;A3A4E0;
    LDA.W #$0020                                                         ;A3A4E3;
    STA.W Sbug.movementTimer,X                                           ;A3A4E6;
    LDA.W #Function_Sbug_MoveStraightAlongAngle_ReverseUntil6BlocksAway  ;A3A4E9;
    STA.W Sbug.function,X                                                ;A3A4EC;
    RTS                                                                  ;A3A4EF;


;;; $A4F0: Roach function - activated - index 3 (move randomly and wait for Samus if hit block) ;;;
Function_Sbug_Activated_3_MoveRandomly_WaitForSamusIfHitBlock:
    LDX.W EnemyIndex                                                     ;A3A4F0;
    JSL.L GenerateRandomNumber                                           ;A3A4F3;
    AND.W #$00FF                                                         ;A3A4F7;
    SEC                                                                  ;A3A4FA;
    SBC.W #$0040                                                         ;A3A4FB;
    AND.W #$00FF                                                         ;A3A4FE;
    CLC                                                                  ;A3A501;
    ADC.W Sbug.customAngle,X                                             ;A3A502;
    STA.W Sbug.customAngle,X                                             ;A3A505;
    JSR.W CalculateCustomVelocities                                      ;A3A508;
    JSR.W DetermineCustomInstListIndex                                   ;A3A50B;
    LDA.L Sbug.customInstListIndex,X                                     ;A3A50E;
    TAY                                                                  ;A3A512;
    LDA.W InstListPointers_Sbug,Y                                        ;A3A513;
    STA.L Sbug.newInstList,X                                             ;A3A516;
    JSR.W SetSbugInstList                                                ;A3A51A;
    LDA.W #$0020                                                         ;A3A51D;
    STA.W Sbug.movementTimer,X                                           ;A3A520;
    LDA.W #Function_Sbug_MoveAlongCustomAngle_WaitForSamusIfHitBlock     ;A3A523;
    STA.W Sbug.function,X                                                ;A3A526;
    RTS                                                                  ;A3A529;


;;; $A52A: Reverse roach custom angle ;;;
ReverseSbugCustomAngle:
; Note these fixed point negations are all off by 1.0 if the low word is non-zero
    LDX.W EnemyIndex                                                     ;A3A52A;
    LDA.L Sbug.customXVelocity,X                                         ;A3A52D;
    EOR.W #$FFFF                                                         ;A3A531;
    INC                                                                  ;A3A534;
    STA.L Sbug.customXVelocity,X                                         ;A3A535;
    LDA.L Sbug.customXSubVelocity,X                                      ;A3A539;
    EOR.W #$FFFF                                                         ;A3A53D;
    INC                                                                  ;A3A540;
    STA.L Sbug.customXSubVelocity,X                                      ;A3A541;
    LDA.L Sbug.customYVelocity,X                                         ;A3A545;
    EOR.W #$FFFF                                                         ;A3A549;
    INC                                                                  ;A3A54C;
    STA.L Sbug.customYVelocity,X                                         ;A3A54D;
    LDA.L Sbug.customYSubVelocity,X                                      ;A3A551;
    EOR.W #$FFFF                                                         ;A3A555;
    INC                                                                  ;A3A558;
    STA.L Sbug.customYSubVelocity,X                                      ;A3A559;
    LDA.L Sbug.customInstListIndex,X                                     ;A3A55D;
    CLC                                                                  ;A3A561;
    ADC.W #$0004                                                         ;A3A562;
    AND.W #$0007                                                         ;A3A565;
    STA.L Sbug.customInstListIndex,X                                     ;A3A568;
    TAY                                                                  ;A3A56C;
    LDA.W InstListPointers_Sbug,Y                                        ;A3A56D;
    STA.L Sbug.newInstList,X                                             ;A3A570;
    JSR.W SetSbugInstList                                                ;A3A574;
    RTS                                                                  ;A3A577;


;;; $A578: Move roach forward ;;;
MoveSbugForward:
    LDA.L Sbug.movingForwardXSpeed,X                                     ;A3A578;
    STA.W Temp_XSpeed                                                    ;A3A57C;
    LDA.L Sbug.movingForwardXSubSpeed,X                                  ;A3A57F;
    STA.W Temp_XSubSpeed                                                 ;A3A583;
    LDA.L Sbug.movingForwardYSpeed,X                                     ;A3A586;
    STA.W Temp_YSpeed                                                    ;A3A58A;
    LDA.L Sbug.movingForwardYSubSpeed,X                                  ;A3A58D;
    STA.W Temp_YSubSpeed                                                 ;A3A591;
    LDA.W Enemy.init0+1,X                                                ;A3A594;
    AND.W #$00FF                                                         ;A3A597;
    STA.W Temp_EnemyProjectileInitParam                                  ;A3A59A;
    JSL.L MoveEnemyAccordingToAngleAndXYSpeeds                           ;A3A59D;
    RTS                                                                  ;A3A5A1;


;;; $A5A2: Unused. RTS ;;;
RTS_A3A5A2:
    RTS                                                                  ;A3A5A2;


;;; $A5A3: Move roach left ;;;
MoveSbugLeft:
    LDA.W Enemy.XPosition,X                                              ;A3A5A3;
    CLC                                                                  ;A3A5A6;
    ADC.L Sbug.movingLeftXVelocity,X                                     ;A3A5A7;
    STA.W Enemy.XPosition,X                                              ;A3A5AB;
    LDA.W Enemy.XSubPosition,X                                           ;A3A5AE;
    CLC                                                                  ;A3A5B1;
    ADC.L Sbug.movingLeftXSubVelocity,X                                  ;A3A5B2;
    BCC +                                                                ;A3A5B6;
    INC.W Enemy.XPosition,X                                              ;A3A5B8;

+   STA.W Enemy.XSubPosition,X                                           ;A3A5BB;
    LDA.W Enemy.YPosition,X                                              ;A3A5BE;
    CLC                                                                  ;A3A5C1;
    ADC.L Sbug.movingLeftYVelocity,X                                     ;A3A5C2;
    STA.W Enemy.YPosition,X                                              ;A3A5C6;
    LDA.W Enemy.YSubPosition,X                                           ;A3A5C9;
    CLC                                                                  ;A3A5CC;
    ADC.L Sbug.movingLeftYSubVelocity,X                                  ;A3A5CD;
    BCC +                                                                ;A3A5D1;
    INC.W Enemy.YPosition,X                                              ;A3A5D3;

+   STA.W Enemy.YSubPosition,X                                           ;A3A5D6;
    RTS                                                                  ;A3A5D9;


;;; $A5DA: Move roach right ;;;
MoveSbugRight:
    LDA.W Enemy.XPosition,X                                              ;A3A5DA;
    CLC                                                                  ;A3A5DD;
    ADC.L Sbug.movingRightXVelocity,X                                    ;A3A5DE;
    STA.W Enemy.XPosition,X                                              ;A3A5E2;
    LDA.W Enemy.XSubPosition,X                                           ;A3A5E5;
    CLC                                                                  ;A3A5E8;
    ADC.L Sbug.movingRightXSubVelocity,X                                 ;A3A5E9;
    BCC +                                                                ;A3A5ED;
    INC.W Enemy.XPosition,X                                              ;A3A5EF;

+   STA.W Enemy.XSubPosition,X                                           ;A3A5F2;
    LDA.W Enemy.YPosition,X                                              ;A3A5F5;
    CLC                                                                  ;A3A5F8;
    ADC.L Sbug.movingRightYVelocity,X                                    ;A3A5F9;
    STA.W Enemy.YPosition,X                                              ;A3A5FD;
    LDA.W Enemy.YSubPosition,X                                           ;A3A600;
    CLC                                                                  ;A3A603;
    ADC.L Sbug.movingRightYSubVelocity,X                                 ;A3A604;
    BCC +                                                                ;A3A608;
    INC.W Enemy.YPosition,X                                              ;A3A60A;

+   STA.W Enemy.YSubPosition,X                                           ;A3A60D;
    RTS                                                                  ;A3A610;


;;; $A611: Move enemy along custom angle ;;;
MoveSbugAlongCustomAngle:
    LDA.W Enemy.XPosition,X                                              ;A3A611;
    CLC                                                                  ;A3A614;
    ADC.L Sbug.customXVelocity,X                                         ;A3A615;
    STA.W Enemy.XPosition,X                                              ;A3A619;
    LDA.W Enemy.XSubPosition,X                                           ;A3A61C;
    CLC                                                                  ;A3A61F;
    ADC.L Sbug.customXSubVelocity,X                                      ;A3A620;
    BCC +                                                                ;A3A624;
    INC.W Enemy.XPosition,X                                              ;A3A626;

+   STA.W Enemy.XSubPosition,X                                           ;A3A629;
    LDA.W Enemy.YPosition,X                                              ;A3A62C;
    CLC                                                                  ;A3A62F;
    ADC.L Sbug.customYVelocity,X                                         ;A3A630;
    STA.W Enemy.YPosition,X                                              ;A3A634;
    LDA.W Enemy.YSubPosition,X                                           ;A3A637;
    CLC                                                                  ;A3A63A;
    ADC.L Sbug.customYSubVelocity,X                                      ;A3A63B;
    BCC +                                                                ;A3A63F;
    INC.W Enemy.YPosition,X                                              ;A3A641;

+   STA.W Enemy.YSubPosition,X                                           ;A3A644;
    RTS                                                                  ;A3A647;


;;; $A648: Move enemy along custom angle and wait for Samus if hit block ;;;
MoveSbugAlongCustomAngle_WaitForSamusIfHitBlock:
    LDA.L Sbug.customXSubVelocity,X                                      ;A3A648;
    STA.B DP_Temp12                                                      ;A3A64C;
    LDA.L Sbug.customXVelocity,X                                         ;A3A64E;
    STA.B DP_Temp14                                                      ;A3A652;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A3A654;
    BCC .notCollidedWithWall                                             ;A3A658;
    LDA.W #Function_Sbug_WaitForSamusToGetNear                           ;A3A65A;
    STA.W Sbug.function,X                                                ;A3A65D;
    BRA .return                                                          ;A3A660;

  .notCollidedWithWall:
    LDA.L Sbug.customYSubVelocity,X                                      ;A3A662;
    STA.B DP_Temp12                                                      ;A3A666;
    LDA.L Sbug.customYVelocity,X                                         ;A3A668;
    STA.B DP_Temp14                                                      ;A3A66C;
    JSL.L MoveEnemyDownBy_14_12                                          ;A3A66E;
    BCC .return                                                          ;A3A672;
    LDA.W #Function_Sbug_WaitForSamusToGetNear                           ;A3A674;
    STA.W Sbug.function,X                                                ;A3A677;

  .return:
    RTS                                                                  ;A3A67A;


;;; $A67B: RTL ;;;
RTL_A3A67B:
    RTL                                                                  ;A3A67B;


;;; $A67C: RTL ;;;
RTL_A3A67C:
    RTL                                                                  ;A3A67C;


;;; $A67D: Roach spritemaps ;;;
Spritemap_Sbug_FacingUp_0:
    dw $0001                                                             ;A3A67D;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $100)

Spritemap_Sbug_FacingUp_1:
    dw $0001                                                             ;A3A684;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $101)

Spritemap_Sbug_FacingUp_2:
    dw $0001                                                             ;A3A68B;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $102)

Spritemap_Sbug_FacingUpLeft_0:
    dw $0001                                                             ;A3A692;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $103)

Spritemap_Sbug_FacingUpLeft_1:
    dw $0001                                                             ;A3A699;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $104)

Spritemap_Sbug_FacingUpLeft_2:
    dw $0001                                                             ;A3A6A0;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $105)

Spritemap_Sbug_FacingLeft_0:
    dw $0001                                                             ;A3A6A7;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $106)

Spritemap_Sbug_FacingLeft_1:
    dw $0001                                                             ;A3A6AE;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $107)

Spritemap_Sbug_FacingLeft_2:
    dw $0001                                                             ;A3A6B5;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $108)

Spritemap_Sbug_FacingDownLeft_0:
    dw $0001                                                             ;A3A6BC;
    %spritemapEntry(0, $1FC, $FC, 1, 0, 3, 0, $103)

Spritemap_Sbug_FacingDownLeft_1:
    dw $0001                                                             ;A3A6C3;
    %spritemapEntry(0, $1FC, $FC, 1, 0, 3, 0, $104)

Spritemap_Sbug_FacingDownLeft_2:
    dw $0001                                                             ;A3A6CA;
    %spritemapEntry(0, $1FC, $FC, 1, 0, 3, 0, $105)

Spritemap_Sbug_FacingDown_0:
    dw $0001                                                             ;A3A6D1;
    %spritemapEntry(0, $1FC, $FC, 1, 0, 3, 0, $100)

Spritemap_Sbug_FacingDown_1:
    dw $0001                                                             ;A3A6D8;
    %spritemapEntry(0, $1FC, $FC, 1, 0, 3, 0, $101)

Spritemap_Sbug_FacingDown_2:
    dw $0001                                                             ;A3A6DF;
    %spritemapEntry(0, $1FC, $FC, 1, 0, 3, 0, $102)

Spritemap_Sbug_FacingDownRight_0:
    dw $0001                                                             ;A3A6E6;
    %spritemapEntry(0, $1FC, $FC, 1, 1, 3, 0, $103)

Spritemap_Sbug_FacingDownRight_1:
    dw $0001                                                             ;A3A6ED;
    %spritemapEntry(0, $1FC, $FC, 1, 1, 3, 0, $104)

Spritemap_Sbug_FacingDownRight_2:
    dw $0001                                                             ;A3A6F4;
    %spritemapEntry(0, $1FC, $FC, 1, 1, 3, 0, $105)

Spritemap_Sbug_FacingRight_0:
    dw $0001                                                             ;A3A6FB;
    %spritemapEntry(0, $1FC, $FC, 0, 1, 3, 0, $106)

Spritemap_Sbug_FacingRight_1:
    dw $0001                                                             ;A3A702;
    %spritemapEntry(0, $1FC, $FC, 0, 1, 3, 0, $107)

Spritemap_Sbug_FacingRight_2:
    dw $0001                                                             ;A3A709;
    %spritemapEntry(0, $1FC, $FC, 0, 1, 3, 0, $108)

Spritemap_Sbug_FacingUpRight_0:
    dw $0001                                                             ;A3A710;
    %spritemapEntry(0, $1FC, $FC, 0, 1, 3, 0, $103)

Spritemap_Sbug_FacingUpRight_1:
    dw $0001                                                             ;A3A717;
    %spritemapEntry(0, $1FC, $FC, 0, 1, 3, 0, $104)

Spritemap_Sbug_FacingUpRight_2:
    dw $0001                                                             ;A3A71E;
    %spritemapEntry(0, $1FC, $FC, 0, 1, 3, 0, $105)


;;; $A725: Palette - enemy $D8FF (mochtroid) ;;;
Palette_Mochtroid:
    dw $3800,$3FB7,$2EAD,$0142,$0060,$3B10,$226B,$11C6                   ;A3A725;
    dw $0984,$72FF,$2CDF,$24B9,$1CAF,$2A9D,$19D6,$0D10                   ;A3A735;


;;; $A745: Instruction list - not touching Samus ;;;
InstList_Mochtroid_NotTouchingSamus:
    dw $000E,Spritemap_Mochtroid_NotTouchingSamus_0                      ;A3A745;
    dw $000E,Spritemap_Mochtroid_NotTouchingSamus_1                      ;A3A749;
    dw $000E,Spritemap_Mochtroid_NotTouchingSamus_2                      ;A3A74D;
    dw $000E,Spritemap_Mochtroid_NotTouchingSamus_1                      ;A3A751;
    dw Instruction_Common_GotoY                                          ;A3A755;
    dw InstList_Mochtroid_NotTouchingSamus                               ;A3A757;


;;; $A759: Instruction list - touching Samus ;;;
InstList_Mochtroid_TouchingSamus:
    dw $0005,Spritemap_Mochtroid_TouchingSamus_0                         ;A3A759;
    dw $0005,Spritemap_Mochtroid_TouchingSamus_1                         ;A3A75D;
    dw $0005,Spritemap_Mochtroid_TouchingSamus_2                         ;A3A761;
    dw $0005,Spritemap_Mochtroid_TouchingSamus_1                         ;A3A765;
    dw Instruction_Common_GotoY                                          ;A3A769;
    dw InstList_Mochtroid_TouchingSamus                                  ;A3A76B;


;;; $A76D: Mochtroid shake velocity table ;;;
MocktroidShakeVelocityTable:
; Velocities for UNUSED_Function_Mochtroid_2_Shaking_A3A88F
; Indexed by Mochtroid.shakeTimer
  .X:
    dw $0002,$0000,$FFFE,$0000                                           ;A3A76D;
  .Y:
    dw $0000,$FFFE,$0000,$0002                                           ;A3A775;


;;; $A77D: Initialisation AI - enemy $D8FF (mochtroid) ;;;
InitAI_Mochtroid:
; Note respawn crash bug in SetMochtroidInstList, can fix by replacing `JSR SetMochtroidInstList` with `JSR $A942`
    LDX.W EnemyIndex                                                     ;A3A77D;
    LDA.W #$0002                                                         ;A3A780;
    STA.W Enemy.layer,X                                                  ;A3A783;
    LDA.W #InstList_Mochtroid_NotTouchingSamus                           ;A3A786;
    JSR.W SetMochtroidInstList                                           ;A3A789;
    STZ.W Mochtroid.functionIndex,X                                      ;A3A78C;
    RTL                                                                  ;A3A78F;


;;; $A790: Main AI - enemy $D8FF (mochtroid) ;;;
MainAI_Mochtroid:
    LDX.W EnemyIndex                                                     ;A3A790;
    LDA.W Mochtroid.functionIndex,X                                      ;A3A793;
    ASL                                                                  ;A3A796;
    TAX                                                                  ;A3A797;
    PHX                                                                  ;A3A798;
    LDX.W EnemyIndex                                                     ;A3A799;
    STZ.W Mochtroid.functionIndex,X                                      ;A3A79C;
    PLX                                                                  ;A3A79F;
    JSR.W (.pointers,X)                                                  ;A3A7A0;
    RTL                                                                  ;A3A7A3;

  .pointers:
    dw Function_Mochtroid_0_NotTouchingSamus                             ;A3A7A4;
    dw Function_Mochtroid_1_TouchingSamus                                ;A3A7A6;
    dw UNUSED_Function_Mochtroid_2_Shaking_A3A88F                        ;A3A7A8;


;;; $A7AA: Mochtroid function index 0 - not touching Samus ;;;
Function_Mochtroid_0_NotTouchingSamus:
    LDX.W EnemyIndex                                                     ;A3A7AA;
    STZ.B DP_Temp12                                                      ;A3A7AD;
    STZ.B DP_Temp14                                                      ;A3A7AF;
    LDA.W Enemy.YPosition,X                                              ;A3A7B1;
    SEC                                                                  ;A3A7B4;
    SBC.W SamusYPosition                                                 ;A3A7B5;
    LSR                                                                  ;A3A7B8;
    LSR                                                                  ;A3A7B9;
    STA.B DP_Temp13                                                      ;A3A7BA;
    AND.W #$2000                                                         ;A3A7BC;
    BEQ +                                                                ;A3A7BF;
    LDA.B DP_Temp14                                                      ;A3A7C1;
    ORA.W #$FFC0                                                         ;A3A7C3;
    STA.B DP_Temp14                                                      ;A3A7C6;

+   LDA.W Mochtroid.YSubVelocity,X                                       ;A3A7C8;
    SEC                                                                  ;A3A7CB;
    SBC.B DP_Temp12                                                      ;A3A7CC;
    STA.W Mochtroid.YSubVelocity,X                                       ;A3A7CE;
    LDA.W Mochtroid.YVelocity,X                                          ;A3A7D1;
    SBC.B DP_Temp14                                                      ;A3A7D4;
    STA.W Mochtroid.YVelocity,X                                          ;A3A7D6;
    BMI .negativeY                                                       ;A3A7D9;
    CMP.W #$0003                                                         ;A3A7DB;
    BCC +                                                                ;A3A7DE;
    LDA.W #$0003                                                         ;A3A7E0;
    BRA .storeYVelocity                                                  ;A3A7E3;

  .negativeY:
    CMP.W #$FFFD                                                         ;A3A7E5;
    BCS +                                                                ;A3A7E8;
    LDA.W #$FFFD                                                         ;A3A7EA;

  .storeYVelocity:
    STA.W Mochtroid.YVelocity,X                                          ;A3A7ED;
    STZ.W Mochtroid.YSubVelocity,X                                       ;A3A7F0;

+   LDA.W Mochtroid.YSubVelocity,X                                       ;A3A7F3;
    BNE +                                                                ;A3A7F6;
    LDA.W Mochtroid.YVelocity,X                                          ;A3A7F8;
    BNE +                                                                ;A3A7FB;
    STZ.W Mochtroid.YSubVelocity,X                                       ;A3A7FD;
    STZ.W Mochtroid.YVelocity,X                                          ;A3A800;

+   LDA.W Mochtroid.YSubVelocity,X                                       ;A3A803;
    STA.B DP_Temp12                                                      ;A3A806;
    LDA.W Mochtroid.YVelocity,X                                          ;A3A808;
    STA.B DP_Temp14                                                      ;A3A80B;
    JSL.L MoveEnemyDownBy_14_12                                          ;A3A80D;
    BCC .notCollidedWithBlock                                            ;A3A811;
    STZ.W Mochtroid.YSubVelocity,X                                       ;A3A813;
    STZ.W Mochtroid.YVelocity,X                                          ;A3A816;

  .notCollidedWithBlock:
    LDX.W EnemyIndex                                                     ;A3A819;
    STZ.B DP_Temp12                                                      ;A3A81C;
    STZ.B DP_Temp14                                                      ;A3A81E;
    LDA.W Enemy.XPosition,X                                              ;A3A820;
    SEC                                                                  ;A3A823;
    SBC.W SamusXPosition                                                 ;A3A824;
    LSR                                                                  ;A3A827;
    LSR                                                                  ;A3A828;
    STA.B DP_Temp13                                                      ;A3A829;
    AND.W #$2000                                                         ;A3A82B;
    BEQ +                                                                ;A3A82E;
    LDA.B DP_Temp14                                                      ;A3A830;
    ORA.W #$FFC0                                                         ;A3A832;
    STA.B DP_Temp14                                                      ;A3A835;

+   LDA.W Mochtroid.XSubVelocity,X                                       ;A3A837;
    SEC                                                                  ;A3A83A;
    SBC.B DP_Temp12                                                      ;A3A83B;
    STA.W Mochtroid.XSubVelocity,X                                       ;A3A83D;
    LDA.W Mochtroid.XVelocity,X                                          ;A3A840;
    SBC.B DP_Temp14                                                      ;A3A843;
    STA.W Mochtroid.XVelocity,X                                          ;A3A845;
    BMI .negativeX                                                       ;A3A848;
    CMP.W #$0003                                                         ;A3A84A;
    BCC +                                                                ;A3A84D;
    LDA.W #$0003                                                         ;A3A84F;
    BRA .storeXVelocity                                                  ;A3A852;

  .negativeX:
    CMP.W #$FFFD                                                         ;A3A854;
    BCS +                                                                ;A3A857;
    LDA.W #$FFFD                                                         ;A3A859;

  .storeXVelocity:
    STA.W Mochtroid.XVelocity,X                                          ;A3A85C;
    STZ.W Mochtroid.XSubVelocity,X                                       ;A3A85F;

+   LDA.W Mochtroid.XSubVelocity,X                                       ;A3A862;
    BNE +                                                                ;A3A865;
    LDA.W Mochtroid.XVelocity,X                                          ;A3A867;
    BNE +                                                                ;A3A86A;
    STZ.W Mochtroid.XSubVelocity,X                                       ;A3A86C;
    STZ.W Mochtroid.XVelocity,X                                          ;A3A86F;

+   LDA.W Mochtroid.XSubVelocity,X                                       ;A3A872;
    STA.B DP_Temp12                                                      ;A3A875;
    LDA.W Mochtroid.XVelocity,X                                          ;A3A877;
    STA.B DP_Temp14                                                      ;A3A87A;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A3A87C;
    BCC .noBlockCollision                                                ;A3A880;
    STZ.W Mochtroid.XSubVelocity,X                                       ;A3A882;
    STZ.W Mochtroid.XVelocity,X                                          ;A3A885;

  .noBlockCollision:
    LDA.W #InstList_Mochtroid_NotTouchingSamus                           ;A3A888;
    JSR.W SetMochtroidInstList                                           ;A3A88B;
    RTS                                                                  ;A3A88E;


;;; $A88F: Unused. Mochtroid function index 2 - shaking ;;;
UNUSED_Function_Mochtroid_2_Shaking_A3A88F:
    LDX.W EnemyIndex                                                     ;A3A88F;
    LDA.W Mochtroid.shakeTimer,X                                         ;A3A892;
    AND.W #$0006                                                         ;A3A895;
    TAY                                                                  ;A3A898;
    LDA.W Enemy.XPosition,X                                              ;A3A899;
    CLC                                                                  ;A3A89C;
    ADC.W MocktroidShakeVelocityTable_X,Y                                ;A3A89D;
    STA.W Enemy.XPosition,X                                              ;A3A8A0;
    LDA.W Enemy.YPosition,X                                              ;A3A8A3;
    CLC                                                                  ;A3A8A6;
    ADC.W MocktroidShakeVelocityTable_Y,Y                                ;A3A8A7;
    STA.W Enemy.YPosition,X                                              ;A3A8AA;
    STZ.W Mochtroid.XSubVelocity,X                                       ;A3A8AD;
    STZ.W Mochtroid.XVelocity,X                                          ;A3A8B0;
    STZ.W Mochtroid.YSubVelocity,X                                       ;A3A8B3;
    STZ.W Mochtroid.YVelocity,X                                          ;A3A8B6;
    DEC.W Mochtroid.shakeTimer,X                                         ;A3A8B9;
    BNE .shaking                                                         ;A3A8BC;
    STZ.W Mochtroid.functionIndex,X                                      ;A3A8BE;

  .shaking:
    LDA.W #InstList_Mochtroid_NotTouchingSamus                           ;A3A8C1;
    JSR.W SetMochtroidInstList                                           ;A3A8C4;
    RTS                                                                  ;A3A8C7;


;;; $A8C8: Mochtroid function index 1 - touching Samus ;;;
Function_Mochtroid_1_TouchingSamus:
    LDX.W EnemyIndex                                                     ;A3A8C8;
    LDA.W Enemy.XPosition,X                                              ;A3A8CB;
    CMP.W SamusXPosition                                                 ;A3A8CE;
    BEQ .centeredX                                                       ;A3A8D1;
    BPL .moveLeft                                                        ;A3A8D3;
    BMI .moveRight                                                       ;A3A8D5;

  .centeredX:
    STZ.W Mochtroid.XSubVelocity,X                                       ;A3A8D7;
    STZ.W Mochtroid.XVelocity,X                                          ;A3A8DA;
    BRA .moveX                                                           ;A3A8DD;

  .moveLeft:
    STZ.W Mochtroid.XSubVelocity,X                                       ;A3A8DF;
    LDA.W #$FFFF                                                         ;A3A8E2;
    STA.W Mochtroid.XVelocity,X                                          ;A3A8E5;
    BRA .moveX                                                           ;A3A8E8;

  .moveRight:
    STZ.W Mochtroid.XSubVelocity,X                                       ;A3A8EA;
    LDA.W #$0001                                                         ;A3A8ED;
    STA.W Mochtroid.XVelocity,X                                          ;A3A8F0;
    BRA .moveX                                                           ;A3A8F3;

  .moveX:
    LDA.W Mochtroid.XSubVelocity,X                                       ;A3A8F5;
    STA.B DP_Temp12                                                      ;A3A8F8;
    LDA.W Mochtroid.XVelocity,X                                          ;A3A8FA;
    STA.B DP_Temp14                                                      ;A3A8FD;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A3A8FF;
    LDA.W Enemy.YPosition,X                                              ;A3A903;
    CMP.W SamusYPosition                                                 ;A3A906;
    BEQ .centeredY                                                       ;A3A909;
    BPL .moveUp                                                          ;A3A90B;
    BMI .moveDown                                                        ;A3A90D;

  .centeredY:
    STZ.W Mochtroid.YSubVelocity,X                                       ;A3A90F;
    STZ.W Mochtroid.YVelocity,X                                          ;A3A912;
    BRA .moveY                                                           ;A3A915;

  .moveUp:
    STZ.W Mochtroid.YSubVelocity,X                                       ;A3A917;
    LDA.W #$FFFF                                                         ;A3A91A;
    STA.W Mochtroid.YVelocity,X                                          ;A3A91D;
    BRA .moveY                                                           ;A3A920;

  .moveDown:
    STZ.W Mochtroid.YSubVelocity,X                                       ;A3A922;
    LDA.W #$0001                                                         ;A3A925;
    STA.W Mochtroid.YVelocity,X                                          ;A3A928;
    BRA .moveY                                                           ;A3A92B;

  .moveY:
    LDA.W Mochtroid.YSubVelocity,X                                       ;A3A92D;
    STA.B DP_Temp12                                                      ;A3A930;
    LDA.W Mochtroid.YVelocity,X                                          ;A3A932;
    STA.B DP_Temp14                                                      ;A3A935;
    JSL.L MoveEnemyDownBy_14_12                                          ;A3A937;
    RTS                                                                  ;A3A93B;


;;; $A93C: Set mochtroid instruction list ;;;
SetMochtroidInstList:
; Mochtroid respawn crash: if mochtroid is set to respawn,
; then [enemy $7E:7802] is likely already set to [A],
; so the enemy instruction list pointer never gets set,
; meaning it will be 0 when enemy instruction processing takes place,
; causing garbage instructions to be processed.
    CMP.L Mochtroid.movingForwardXSpeed,X                                ;A3A93C;
    BEQ .return                                                          ;A3A940;
    STA.L Mochtroid.movingForwardXSpeed,X                                ;A3A942;
    STA.W Enemy.instList,X                                               ;A3A946;
    LDA.W #$0001                                                         ;A3A949;
    STA.W Enemy.instTimer,X                                              ;A3A94C;
    STZ.W Enemy.loopCounter,X                                            ;A3A94F;

  .return:
    RTS                                                                  ;A3A952;


;;; $A953: Enemy touch - enemy $D8FF (mochtroid) ;;;
EnemyTouch_Mochtroid:
    LDX.W EnemyIndex                                                     ;A3A953;
    LDA.W #$0001                                                         ;A3A956;
    STA.W Mochtroid.functionIndex,X                                      ;A3A959;
    LDA.W #InstList_Mochtroid_TouchingSamus                              ;A3A95C;
    JSR.W SetMochtroidInstList                                           ;A3A95F;
    LDA.L Mochtroid.damageTimer,X                                        ;A3A962;
    INC                                                                  ;A3A966;
    STA.L Mochtroid.damageTimer,X                                        ;A3A967;
    LDA.W ContactDamageIndex                                             ;A3A96B;
    BNE .damage                                                          ;A3A96E;
    LDA.W NumberOfTimesMainEnemyRoutineExecuted                          ;A3A970;
    AND.W #$0007                                                         ;A3A973;
    CMP.W #$0007                                                         ;A3A976;
    BNE .skipSFX                                                         ;A3A979;
    LDA.W Energy                                                         ;A3A97B;
    CMP.W #$001E                                                         ;A3A97E;
    BMI .skipSFX                                                         ;A3A981;
    LDA.W #$002D                                                         ;A3A983;
    JSL.L QueueSound_Lib3_Max6                                           ;A3A986;

  .skipSFX:
    LDA.L Mochtroid.damageTimer,X                                        ;A3A98A;
    CMP.W #$0050                                                         ;A3A98E;
    BMI .return                                                          ;A3A991;
    LDA.W #$0000                                                         ;A3A993;
    STA.L Mochtroid.damageTimer,X                                        ;A3A996;

  .damage:
    JSL.L CommonA3_NormalEnemyTouchAI                                    ;A3A99A;
    LDA.W #$0000                                                         ;A3A99E;
    STA.W SamusInvincibilityTimer                                        ;A3A9A1;
    STA.W SamusKnockbackTimer                                            ;A3A9A4;

  .return:
    RTL                                                                  ;A3A9A7;


;;; $A9A8: Enemy shot - enemy $D8FF (mochtroid) ;;;
EnemyShot_Mochtroid:
    LDX.W EnemyIndex                                                     ;A3A9A8;
    JSL.L CommonA3_NormalEnemyShotAI                                     ;A3A9AB;
    RTL                                                                  ;A3A9AF;


;;; $A9B0: Mochtroid spritemaps ;;;
Spritemap_Mochtroid_NotTouchingSamus_0:
    dw $0006                                                             ;A3A9B0;
    %spritemapEntry(1, $00, $F4, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1F0, $F4, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $06, $04, 0, 1, 2, 0, $11C)
    %spritemapEntry(0, $1FE, $04, 0, 1, 2, 0, $11D)
    %spritemapEntry(0, $1FA, $04, 0, 0, 2, 0, $11D)
    %spritemapEntry(0, $1F2, $04, 0, 0, 2, 0, $11C)

Spritemap_Mochtroid_NotTouchingSamus_1:
    dw $0006                                                             ;A3A9D0;
    %spritemapEntry(1, $00, $F4, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $1F0, $F4, 0, 0, 2, 0, $102)
    %spritemapEntry(0, $07, $04, 0, 1, 2, 0, $10C)
    %spritemapEntry(0, $1FF, $04, 0, 1, 2, 0, $10D)
    %spritemapEntry(0, $1F9, $04, 0, 0, 2, 0, $10D)
    %spritemapEntry(0, $1F1, $04, 0, 0, 2, 0, $10C)

Spritemap_Mochtroid_NotTouchingSamus_2:
    dw $0004                                                             ;A3A9F0;
    %spritemapEntry(1, $00, $F2, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $1F0, $F2, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1F8, $02, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $1F8, $02, 0, 0, 2, 0, $10E)

Spritemap_Mochtroid_TouchingSamus_0:
    dw $0004                                                             ;A3AA06;
    %spritemapEntry(1, $1F9, $02, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $00, $F2, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $1F0, $F2, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1F7, $02, 0, 0, 2, 0, $10E)

Spritemap_Mochtroid_TouchingSamus_1:
    dw $0004                                                             ;A3AA1C;
    %spritemapEntry(1, $1F0, $F1, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $1FA, $01, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $1F6, $01, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $00, $F1, 0, 1, 2, 0, $108)

Spritemap_Mochtroid_TouchingSamus_2:
    dw $0004                                                             ;A3AA32;
    %spritemapEntry(1, $1F9, $02, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $1F7, $02, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $00, $F2, 0, 1, 2, 0, $10A)
    %spritemapEntry(1, $1F0, $F2, 0, 0, 2, 0, $10A)


;;; $AA48: Palette - enemy $D93F (sidehopper) ;;;
Palette_Sidehopper:
    dw $3800,$57FF,$42F7,$0D4A,$0063,$4F5A,$36B5,$2610                   ;A3AA48;
    dw $1DCE,$4EDA,$3A35,$2990,$14EB,$5FE0,$32A0,$1940                   ;A3AA58;


;;; $AA68: Instruction - queue sound [[Y]], sound library 2, max queued sounds allowed = 3 ;;;
Instruction_Sidehopper_QueueSoundInY_Lib2_Max3:
    PHY                                                                  ;A3AA68;
    PHX                                                                  ;A3AA69;
    LDA.W $0000,Y                                                        ;A3AA6A;
    JSL.L QueueSound_Lib2_Max3                                           ;A3AA6D;
    PLX                                                                  ;A3AA71;
    PLY                                                                  ;A3AA72;
    INY                                                                  ;A3AA73;
    INY                                                                  ;A3AA74;
    RTL                                                                  ;A3AA75;


;;; $AA76: Instruction list - sidehopper - hopping - upside up ;;;
InstList_Sidehopper_Hopping_UpsideUp:
    dw Instruction_Common_EnableOffScreenProcessing                      ;A3AA76;
    dw Instruction_Sidehopper_QueueSoundInY_Lib2_Max3,$005D              ;A3AA78;
    dw $0001,Spritemap_Sidehopper_2                                      ;A3AA7A;
    dw Instruction_Common_Sleep                                          ;A3AA80;


;;; $AA82: Instruction list - sidehopper - landed - upside up ;;;
InstList_Sidehopper_Landed_UpsideUp:
    dw Instruction_Common_DisableOffScreenProcessing                     ;A3AA82;
    dw Instruction_Sidehopper_QueueSoundInY_Lib2_Max3,$005E              ;A3AA84;
    dw $0002,Spritemap_Sidehopper_0                                      ;A3AA86;
    dw $0005,Spritemap_Sidehopper_1                                      ;A3AA8C;
    dw $0002,Spritemap_Sidehopper_0                                      ;A3AA90;
    dw $0003,Spritemap_Sidehopper_1                                      ;A3AA94;
    dw Instruction_Hopper_ReadyToHop                                     ;A3AA98;
    dw Instruction_Common_Sleep                                          ;A3AA9A;


;;; $AA9C: Instruction list - sidehopper - hopping - upside down ;;;
InstList_Sidehopper_Hopping_UpsideDown:
    dw Instruction_Common_EnableOffScreenProcessing                      ;A3AA9C;
    dw Instruction_Sidehopper_QueueSoundInY_Lib2_Max3,$005D              ;A3AA9E;
    dw $0001,Spritemap_Sidehopper_5                                      ;A3AAA0;
    dw Instruction_Common_Sleep                                          ;A3AAA6;


;;; $AAA8: Instruction list - sidehopper - landed - upside down ;;;
InstList_Sidehopper_Landed_UpsideDown:
    dw Instruction_Common_DisableOffScreenProcessing                     ;A3AAA8;
    dw Instruction_Sidehopper_QueueSoundInY_Lib2_Max3,$005E              ;A3AAAA;
    dw $0002,Spritemap_Sidehopper_3                                      ;A3AAAC;
    dw $0005,Spritemap_Sidehopper_4                                      ;A3AAB2;
    dw $0002,Spritemap_Sidehopper_3                                      ;A3AAB6;
    dw $0003,Spritemap_Sidehopper_4                                      ;A3AABA;
    dw Instruction_Hopper_ReadyToHop                                     ;A3AABE;
    dw Instruction_Common_Sleep                                          ;A3AAC0;


;;; $AAC2: Sidehopper data ;;;
; Instruction list pointers. Indexed by [$A0:002A + [enemy ID]] * 2
InstListPointers_Sidehopper_Landed_UpsideUp:
    dw InstList_Sidehopper_Landed_UpsideUp                               ;A3AAC2;
    dw InstList_SidehopperLarge_Landed_UpsideUp                          ;A3AAC4;
    dw InstList_DessgeegaLarge_Landed_UpsideUp                           ;A3AAC6;
    dw InstList_Dessgeega_Landed_UpsideUp                                ;A3AAC8;

InstListPointers_Sidehopper_Landed_UpsideDown:
    dw InstList_Sidehopper_Landed_UpsideDown                             ;A3AACA;
    dw InstList_SidehopperLarge_Landed_UpsideDown                        ;A3AACC;
    dw InstList_DessgeegaLarge_Landed_UpsideDown                         ;A3AACE;
    dw InstList_Dessgeega_Landed_UpsideDown                              ;A3AAD0;

InstListPointers_Sidehopper_Hopping_UpsideUp:
    dw InstList_Sidehopper_Hopping_UpsideUp                              ;A3AAD2;
    dw InstList_SidehopperLarge_Hopping_UpsideUp                         ;A3AAD4;
    dw InstList_DessgeegaLarge_Hopping_UpsideUp                          ;A3AAD6;
    dw InstList_Dessgeega_Hopping_UpsideUp                               ;A3AAD8;

InstListPointers_Sidehopper_Hopping_UpsideDown:
    dw InstList_Sidehopper_Hopping_UpsideDown                            ;A3AADA;
    dw InstList_SidehopperLarge_Hopping_UpsideDown                       ;A3AADC;
    dw InstList_DessgeegaLarge_Hopping_UpsideDown                        ;A3AADE;
    dw InstList_Dessgeega_Hopping_UpsideDown                             ;A3AAE0;

HopFunctionPointers_Sidehopper:
    dw Function_Hopper_SmallHop                                          ;A3AAE2;
    dw Function_Hopper_BigHop                                            ;A3AAE4;


HopTable_Small:
; Hop table. Indexed by [enemy $7E:800A]
;       __________ Sidehopper
;      |       ___ Desgeega / super-sidehopper / super-desgeega
;      |      |
  .YSpeedTableIndexDelta:                                                ;A3AAE6;
    dw $0003,$0003 ; Small hop - Y speed table index delta
  .XSpeed:                                                               ;A3AAEA;
    dw $0003,$0003 ; Small hop - X speed
  .JumpHeight:                                                           ;A3AAEE;
    dw $1000,$1000 ; Small hop - jump height

HopTable_Big:
  .YSpeedTableIndexDelta:                                                ;A3AAF2;
    dw $0004,$0004 ; Big hop - Y speed table index delta
  .XSpeed:                                                               ;A3AAF6;
    dw $0003,$0003 ; Big hop - X speed
  .JumpHeight:                                                           ;A3AAFA;
    dw $3000,$3000 ; Big hop - jump height


;;; $AAFE: Instruction - ready to hop ;;;
Instruction_Hopper_ReadyToHop:
    LDX.W EnemyIndex                                                     ;A3AAFE;
    LDA.W #$0001                                                         ;A3AB01;
    STA.L Hopper.readyToHopFlag,X                                        ;A3AB04;
    RTL                                                                  ;A3AB08;


;;; $AB09: Initialisation AI - enemy $D93F/$D97F/$D9BF/$D9FF/$DA3F (sidehopper / desgeega / super-sidehopper / super-desgeega) ;;;
InitAI_Hopper:
    LDX.W EnemyIndex                                                     ;A3AB09;
    LDA.W #$0025                                                         ;A3AB0C;
    STA.W RandomNumberSeed                                               ;A3AB0F;
    JSL.L GenerateRandomNumber                                           ;A3AB12;
    LDA.W #$0000                                                         ;A3AB16;
    STA.L Hopper.fallingFlag,X                                           ;A3AB19;
    STA.L Hopper.readyToHopFlag,X                                        ;A3AB1D;
    STA.L Hopper.hopTableIndex,X                                         ;A3AB21;
    LDA.W Enemy.ID,X                                                     ;A3AB25;
    TAX                                                                  ;A3AB28;
    LDA.L EnemyHeaders_sidehopperVariantIndex,X                          ;A3AB29;
    ASL                                                                  ;A3AB2D;
    LDX.W EnemyIndex                                                     ;A3AB2E;
    STA.L Hopper.variantIndex,X                                          ;A3AB31;
    LDA.W Enemy.init0,X                                                  ;A3AB35;
    BNE .upsideDown                                                      ;A3AB38;
    LDA.L Hopper.variantIndex,X                                          ;A3AB3A;
    TAY                                                                  ;A3AB3E;
    LDA.W InstListPointers_Sidehopper_Landed_UpsideUp,Y                  ;A3AB3F;
    BRA +                                                                ;A3AB42;

  .upsideDown:
    LDA.L Hopper.variantIndex,X                                          ;A3AB44;
    TAY                                                                  ;A3AB48;
    LDA.W InstListPointers_Sidehopper_Landed_UpsideDown,Y                ;A3AB49;

+   STA.L Hopper.instList,X                                              ;A3AB4C;
    JSR.W SetSidehopperInstList                                          ;A3AB50;
    LDA.W Enemy.ID,X                                                     ;A3AB53;
    TAX                                                                  ;A3AB56;
    LDA.L EnemyHeaders_sidehopperVariantIndex,X                          ;A3AB57;
    BEQ .sidehopper                                                      ;A3AB5B;
    LDA.W #$0002                                                         ;A3AB5D;
    LDX.W EnemyIndex                                                     ;A3AB60;
    STA.L Hopper.hopTableIndex,X                                         ;A3AB63;

  .sidehopper:
    LDX.W EnemyIndex                                                     ;A3AB67;
    LDA.L Hopper.hopTableIndex,X                                         ;A3AB6A;
    TAY                                                                  ;A3AB6E;
    LDA.W HopTable_Small_JumpHeight,Y                                    ;A3AB6F;
    STA.B DP_Temp16                                                      ;A3AB72;
    LDA.W HopTable_Small_YSpeedTableIndexDelta,Y                         ;A3AB74;
    STA.B DP_Temp18                                                      ;A3AB77;
    JSR.W Hoppers_CalculateInitialHopSpeed                               ;A3AB79;
    STA.L Hopper.smallHopInitialYSpeedTableIndex,X                       ;A3AB7C;
    LDA.L Hopper.hopTableIndex,X                                         ;A3AB80;
    TAY                                                                  ;A3AB84;
    LDA.W HopTable_Big_JumpHeight,Y                                      ;A3AB85;
    STA.B DP_Temp16                                                      ;A3AB88;
    LDA.W HopTable_Big_YSpeedTableIndexDelta,Y                           ;A3AB8A;
    STA.B DP_Temp18                                                      ;A3AB8D;
    JSR.W Hoppers_CalculateInitialHopSpeed                               ;A3AB8F;
    STA.L Hopper.bigHopInitialYSpeedTableIndex,X                         ;A3AB92;
    LDA.W #Function_Hopper_Hop                                           ;A3AB96;
    STA.W Hopper.function,X                                              ;A3AB99;
    RTL                                                                  ;A3AB9C;


;;; $AB9D: Calculate initial hop speed ;;;
Hoppers_CalculateInitialHopSpeed:
;; Parameters:
;;     $16: Jump height. Unit 1/100h px
;;     $18: Y speed table index delta
;; Returns:
;;     A: Initial Y speed table index

; Calculates the initial quadratic speed table index required to make a jump
    STZ.B DP_Temp12                                                      ;A3AB9D;
    STZ.B DP_Temp14                                                      ;A3AB9F;

  .loop:
    LDA.B DP_Temp12                                                      ;A3ABA1;
    CLC                                                                  ;A3ABA3;
    ADC.B DP_Temp18                                                      ;A3ABA4;
    STA.B DP_Temp12                                                      ;A3ABA6;
    ASL                                                                  ;A3ABA8;
    ASL                                                                  ;A3ABA9;
    ASL                                                                  ;A3ABAA;
    TAY                                                                  ;A3ABAB;
    LDA.B DP_Temp14                                                      ;A3ABAC;
    CLC                                                                  ;A3ABAE;
    ADC.W CommonEnemySpeeds_QuadraticallyIncreasing+1,Y                  ;A3ABAF;
    STA.B DP_Temp14                                                      ;A3ABB2;
    CMP.B DP_Temp16                                                      ;A3ABB4;
    BMI .loop                                                            ;A3ABB6;
    LDA.B DP_Temp12                                                      ;A3ABB8;
    RTS                                                                  ;A3ABBA;


;;; $ABBB: Set sidehopper enemy instruction list ;;;
SetSidehopperInstList:
    LDX.W EnemyIndex                                                     ;A3ABBB;
    LDA.L Hopper.instList,X                                              ;A3ABBE;
    STA.W Enemy.instList,X                                               ;A3ABC2;
    LDA.W #$0001                                                         ;A3ABC5;
    STA.W Enemy.instTimer,X                                              ;A3ABC8;
    STZ.W Enemy.loopCounter,X                                            ;A3ABCB;
    RTS                                                                  ;A3ABCE;


;;; $ABCF: Main AI - enemy $D93F/$D97F/$D9BF/$D9FF/$DA3F (sidehopper / desgeega / super-sidehopper / super-desgeega) ;;;
MainAI_Hopper:
    LDX.W EnemyIndex                                                     ;A3ABCF;
    JSR.W (Hopper.function,X)                                            ;A3ABD2;
    RTL                                                                  ;A3ABD5;


;;; $ABD6: Sidehopper function - hop ;;;
Function_Hopper_Hop:
    JSL.L GenerateRandomNumber                                           ;A3ABD6;
    AND.W #$0001                                                         ;A3ABDA;
    ASL                                                                  ;A3ABDD;
    TAY                                                                  ;A3ABDE;
    LDA.W HopFunctionPointers_Sidehopper,Y                               ;A3ABDF;
    STA.W Hopper.function,X                                              ;A3ABE2;
    RTS                                                                  ;A3ABE5;


;;; $ABE6: Sidehopper function - small hop ;;;
Function_Hopper_SmallHop:
    LDX.W EnemyIndex                                                     ;A3ABE6;
    LDA.L Hopper.hopTableIndex,X                                         ;A3ABE9;
    TAY                                                                  ;A3ABED;
    LDA.W HopTable_Small_YSpeedTableIndexDelta,Y                         ;A3ABEE;
    STA.W Hopper.XSpeedTableIndexDelta,X                                 ;A3ABF1;
    LDA.W HopTable_Small_XSpeed,Y                                        ;A3ABF4;
    STA.W Hopper.XVelocity,X                                             ;A3ABF7;
    LDA.L Hopper.smallHopInitialYSpeedTableIndex,X                       ;A3ABFA;
    STA.W Hopper.YSpeedTableIndex,X                                      ;A3ABFE;
    LDA.W #Function_Hopper_Hop_UpsideUp                                  ;A3AC01;
    STA.W Hopper.function,X                                              ;A3AC04;
    LDA.W Enemy.init0,X                                                  ;A3AC07;
    BEQ .return                                                          ;A3AC0A;
    LDA.W #Function_Hopper_Hop_UpsideDown                                ;A3AC0C;
    STA.W Hopper.function,X                                              ;A3AC0F;

  .return:
    RTS                                                                  ;A3AC12;


;;; $AC13: Sidehopper function - big hop ;;;
Function_Hopper_BigHop:
    LDX.W EnemyIndex                                                     ;A3AC13;
    LDA.L Hopper.hopTableIndex,X                                         ;A3AC16;
    TAY                                                                  ;A3AC1A;
    LDA.W HopTable_Big_YSpeedTableIndexDelta,Y                           ;A3AC1B;
    STA.W Hopper.XSpeedTableIndexDelta,X                                 ;A3AC1E;
    LDA.W HopTable_Big_XSpeed,Y                                          ;A3AC21;
    STA.W Hopper.XVelocity,X                                             ;A3AC24;
    LDA.L Hopper.bigHopInitialYSpeedTableIndex,X                         ;A3AC27;
    STA.W Hopper.YSpeedTableIndex,X                                      ;A3AC2B;
    LDA.W #Function_Hopper_Hop_UpsideUp                                  ;A3AC2E;
    STA.W Hopper.function,X                                              ;A3AC31;
    LDA.W Enemy.init0,X                                                  ;A3AC34;
    BEQ .return                                                          ;A3AC37;
    LDA.W #Function_Hopper_Hop_UpsideDown                                ;A3AC39;
    STA.W Hopper.function,X                                              ;A3AC3C;

  .return:
    RTS                                                                  ;A3AC3F;


;;; $AC40: Sidehopper function - hop - upside up ;;;
Function_Hopper_Hop_UpsideUp:
    LDX.W EnemyIndex                                                     ;A3AC40;
    LDA.W #Function_Hopper_HopBackwards_UpsideUp                         ;A3AC43;
    STA.W Hopper.function,X                                              ;A3AC46;
    JSL.L Get_SamusX_minus_EnemyX                                        ;A3AC49;
    BMI .return                                                          ;A3AC4D;
    LDA.W #Function_Hopper_HopForwards_UpsideUp                          ;A3AC4F;
    STA.W Hopper.function,X                                              ;A3AC52;

  .return:
    RTS                                                                  ;A3AC55;


;;; $AC56: Sidehopper function - hop - upside down ;;;
Function_Hopper_Hop_UpsideDown:
    LDX.W EnemyIndex                                                     ;A3AC56;
    LDA.W #Function_Hopper_HopBackwards_UpsideDown                       ;A3AC59;
    STA.W Hopper.function,X                                              ;A3AC5C;
    JSL.L Get_SamusX_minus_EnemyX                                        ;A3AC5F;
    BMI .return                                                          ;A3AC63;
    LDA.W #Function_Hopper_HopForwards_UpsideDown                        ;A3AC65;
    STA.W Hopper.function,X                                              ;A3AC68;

  .return:
    RTS                                                                  ;A3AC6B;


;;; $AC6C: Sidehopper function - hop backwards - upside up ;;;
Function_Hopper_HopBackwards_UpsideUp:
    LDX.W EnemyIndex                                                     ;A3AC6C;
    LDA.W Hopper.XVelocity,X                                             ;A3AC6F;
    EOR.W #$FFFF                                                         ;A3AC72;
    INC                                                                  ;A3AC75;
    STA.W Hopper.XVelocity,X                                             ;A3AC76;
    LDA.L Hopper.variantIndex,X                                          ;A3AC79;
    TAY                                                                  ;A3AC7D;
    LDA.W InstListPointers_Sidehopper_Hopping_UpsideUp,Y                 ;A3AC7E;
    STA.L Hopper.instList,X                                              ;A3AC81;
    JSR.W SetSidehopperInstList                                          ;A3AC85;
    LDA.W #Function_Hopper_Jumping_UpsideUp                              ;A3AC88;
    STA.W Hopper.function,X                                              ;A3AC8B;
    RTS                                                                  ;A3AC8E;


;;; $AC8F: Sidehopper function - hop forwards - upside up ;;;
Function_Hopper_HopForwards_UpsideUp:
    LDX.W EnemyIndex                                                     ;A3AC8F;
    LDA.L Hopper.variantIndex,X                                          ;A3AC92;
    TAY                                                                  ;A3AC96;
    LDA.W InstListPointers_Sidehopper_Hopping_UpsideUp,Y                 ;A3AC97;
    STA.L Hopper.instList,X                                              ;A3AC9A;
    JSR.W SetSidehopperInstList                                          ;A3AC9E;
    LDA.W #Function_Hopper_Jumping_UpsideUp_duplicate                    ;A3ACA1;
    STA.W Hopper.function,X                                              ;A3ACA4;
    RTS                                                                  ;A3ACA7;


;;; $ACA8: Sidehopper function - hop backwards - upside down ;;;
Function_Hopper_HopBackwards_UpsideDown:
    LDX.W EnemyIndex                                                     ;A3ACA8;
    LDA.W Hopper.XVelocity,X                                             ;A3ACAB;
    EOR.W #$FFFF                                                         ;A3ACAE;
    INC                                                                  ;A3ACB1;
    STA.W Hopper.XVelocity,X                                             ;A3ACB2;
    LDA.L Hopper.variantIndex,X                                          ;A3ACB5;
    TAY                                                                  ;A3ACB9;
    LDA.W InstListPointers_Sidehopper_Hopping_UpsideDown,Y               ;A3ACBA;
    STA.L Hopper.instList,X                                              ;A3ACBD;
    JSR.W SetSidehopperInstList                                          ;A3ACC1;
    LDA.W #Function_Hopper_Jumping_UpsideDown                            ;A3ACC4;
    STA.W Hopper.function,X                                              ;A3ACC7;
    RTS                                                                  ;A3ACCA;


;;; $ACCB: Sidehopper function - hop forwards - upside down ;;;
Function_Hopper_HopForwards_UpsideDown:
    LDX.W EnemyIndex                                                     ;A3ACCB;
    LDA.L Hopper.variantIndex,X                                          ;A3ACCE;
    TAY                                                                  ;A3ACD2;
    LDA.W InstListPointers_Sidehopper_Hopping_UpsideDown,Y               ;A3ACD3;
    STA.L Hopper.instList,X                                              ;A3ACD6;
    JSR.W SetSidehopperInstList                                          ;A3ACDA;
    LDA.W #Function_Hopper_Jumping_UpsideDown_duplicate                  ;A3ACDD;
    STA.W Hopper.function,X                                              ;A3ACE0;
    RTS                                                                  ;A3ACE3;


;;; $ACE4: Sidehopper function - landed ;;;
Function_Hopper_Landed:
    LDX.W EnemyIndex                                                     ;A3ACE4;
    LDA.L Hopper.variantIndex,X                                          ;A3ACE7;
    TAY                                                                  ;A3ACEB;
    LDA.W InstListPointers_Sidehopper_Landed_UpsideUp,Y                  ;A3ACEC;
    STA.L Hopper.instList,X                                              ;A3ACEF;
    LDA.W Enemy.init0,X                                                  ;A3ACF3;
    BEQ .upsideDown                                                      ;A3ACF6;
    LDA.L Hopper.variantIndex,X                                          ;A3ACF8;
    TAY                                                                  ;A3ACFC;
    LDA.W InstListPointers_Sidehopper_Landed_UpsideDown,Y                ;A3ACFD;
    STA.L Hopper.instList,X                                              ;A3AD00;

  .upsideDown:
    JSR.W SetSidehopperInstList                                          ;A3AD04;
    LDA.W #Function_Hopper_WaitToHop                                     ;A3AD07;
    STA.W Hopper.function,X                                              ;A3AD0A;
    RTS                                                                  ;A3AD0D;


;;; $AD0E: Sidehopper function - jumping - upside up ;;;
Function_Hopper_Jumping_UpsideUp:
    LDX.W EnemyIndex                                                     ;A3AD0E;
    LDA.L Hopper.fallingFlag,X                                           ;A3AD11;
    BNE .falling                                                         ;A3AD15;
    JSR.W HopperMovement_Jumping_UpsideUp                                ;A3AD17;
    BRA .return                                                          ;A3AD1A;

  .falling:
    JSR.W HopperMovement_Falling_UpsideUp                                ;A3AD1C;

  .return:
    RTS                                                                  ;A3AD1F;


;;; $AD20: Sidehopper function - jumping - upside up ;;;
Function_Hopper_Jumping_UpsideUp_duplicate:
; Clone of Function_Hopper_Jumping_UpsideUp
    LDX.W EnemyIndex                                                     ;A3AD20;
    LDA.L Hopper.fallingFlag,X                                           ;A3AD23;
    BNE .falling                                                         ;A3AD27;
    JSR.W HopperMovement_Jumping_UpsideUp                                ;A3AD29;
    BRA .return                                                          ;A3AD2C;

  .falling:
    JSR.W HopperMovement_Falling_UpsideUp                                ;A3AD2E;

  .return:
    RTS                                                                  ;A3AD31;


;;; $AD32: Sidehopper function - jumping - upside down ;;;
Function_Hopper_Jumping_UpsideDown:
    LDX.W EnemyIndex                                                     ;A3AD32;
    LDA.L Hopper.fallingFlag,X                                           ;A3AD35;
    BNE .falling                                                         ;A3AD39;
    JSR.W HopperMovement_Jumping_UpsideDown                              ;A3AD3B;
    BRA .return                                                          ;A3AD3E;

  .falling:
    JSR.W HopperMovement_Falling_UpsideDown                              ;A3AD40;

  .return:
    RTS                                                                  ;A3AD43;


;;; $AD44: Sidehopper function - jumping - upside down ;;;
Function_Hopper_Jumping_UpsideDown_duplicate:
; Clone of Function_Hopper_Jumping_UpsideDown
    LDX.W EnemyIndex                                                     ;A3AD44;
    LDA.L Hopper.fallingFlag,X                                           ;A3AD47;
    BNE .falling                                                         ;A3AD4B;
    JSR.W HopperMovement_Jumping_UpsideDown                              ;A3AD4D;
    BRA .return                                                          ;A3AD50;

  .falling:
    JSR.W HopperMovement_Falling_UpsideDown                              ;A3AD52;

  .return:
    RTS                                                                  ;A3AD55;


;;; $AD56: Sidehopper function - wait to hop ;;;
Function_Hopper_WaitToHop:
    LDX.W EnemyIndex                                                     ;A3AD56;
    LDA.L Hopper.readyToHopFlag,X                                        ;A3AD59;
    BEQ .return                                                          ;A3AD5D;
    LDA.W #$0000                                                         ;A3AD5F;
    STA.L Hopper.readyToHopFlag,X                                        ;A3AD62;
    LDA.W #Function_Hopper_Hop                                           ;A3AD66;
    STA.W Hopper.function,X                                              ;A3AD69;

  .return:
    RTS                                                                  ;A3AD6C;


;;; $AD6D: Sidehopper movement - jumping - upside up ;;;
HopperMovement_Jumping_UpsideUp:
    LDX.W EnemyIndex                                                     ;A3AD6D;
    LDA.W Hopper.YSpeedTableIndex,X                                      ;A3AD70;
    ASL                                                                  ;A3AD73;
    ASL                                                                  ;A3AD74;
    ASL                                                                  ;A3AD75;
    TAY                                                                  ;A3AD76;
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+6,Y                  ;A3AD77;
    STA.B DP_Temp14                                                      ;A3AD7A;
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+4,Y                  ;A3AD7C;
    STA.B DP_Temp12                                                      ;A3AD7F;
    JSL.L MoveEnemyDownBy_14_12                                          ;A3AD81;
    BCC .notCollidedWithBlock                                            ;A3AD85;
    LDA.W Hopper.XVelocity,X                                             ;A3AD87;
    EOR.W #$FFFF                                                         ;A3AD8A;
    INC                                                                  ;A3AD8D;
    STA.W Hopper.XVelocity,X                                             ;A3AD8E;
    LDA.W #$0001                                                         ;A3AD91;
    STA.L Hopper.fallingFlag,X                                           ;A3AD94;
    BRA .return                                                          ;A3AD98;

  .notCollidedWithBlock:
    LDA.W Hopper.XVelocity,X                                             ;A3AD9A;
    STA.B DP_Temp14                                                      ;A3AD9D;
    STZ.B DP_Temp12                                                      ;A3AD9F;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A3ADA1;
    BCC .notCollidedWithWall                                             ;A3ADA5;
    LDA.W Hopper.XVelocity,X                                             ;A3ADA7;
    EOR.W #$FFFF                                                         ;A3ADAA;
    INC                                                                  ;A3ADAD;
    STA.W Hopper.XVelocity,X                                             ;A3ADAE;
    LDA.W #$0001                                                         ;A3ADB1;
    STA.L Hopper.fallingFlag,X                                           ;A3ADB4;
    BRA .return                                                          ;A3ADB8;

  .notCollidedWithWall:
    LDA.W Hopper.YSpeedTableIndex,X                                      ;A3ADBA;
    SEC                                                                  ;A3ADBD;
    SBC.W Hopper.XSpeedTableIndexDelta,X                                 ;A3ADBE;
    STA.W Hopper.YSpeedTableIndex,X                                      ;A3ADC1;
    BPL .return                                                          ;A3ADC4;
    LDA.W #$0001                                                         ;A3ADC6;
    STA.L Hopper.fallingFlag,X                                           ;A3ADC9;
    LDA.W #$0000                                                         ;A3ADCD;
    STA.W Hopper.YSpeedTableIndex,X                                      ;A3ADD0;

  .return:
    RTS                                                                  ;A3ADD3;


;;; $ADD4: Sidehopper movement - falling - upside up ;;;
HopperMovement_Falling_UpsideUp:
    LDX.W EnemyIndex                                                     ;A3ADD4;
    LDA.W Hopper.YSpeedTableIndex,X                                      ;A3ADD7;
    ASL                                                                  ;A3ADDA;
    ASL                                                                  ;A3ADDB;
    ASL                                                                  ;A3ADDC;
    TAY                                                                  ;A3ADDD;
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+2,Y                  ;A3ADDE;
    STA.B DP_Temp14                                                      ;A3ADE1;
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing,Y                    ;A3ADE3;
    STA.B DP_Temp12                                                      ;A3ADE6;
    JSL.L MoveEnemyDownBy_14_12                                          ;A3ADE8;
    BCC .notCollidedWithBlock                                            ;A3ADEC;
    LDA.W #$0000                                                         ;A3ADEE;
    STA.L Hopper.fallingFlag,X                                           ;A3ADF1;
    LDA.W #Function_Hopper_Landed                                        ;A3ADF5;
    STA.W Hopper.function,X                                              ;A3ADF8;
    BRA .return                                                          ;A3ADFB;

  .notCollidedWithBlock:
    LDA.W Hopper.XVelocity,X                                             ;A3ADFD;
    STA.B DP_Temp14                                                      ;A3AE00;
    STZ.B DP_Temp12                                                      ;A3AE02;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A3AE04;
    BCC .notCollidedWithWall                                             ;A3AE08;
    LDA.W Hopper.XVelocity,X                                             ;A3AE0A;
    EOR.W #$FFFF                                                         ;A3AE0D;
    INC                                                                  ;A3AE10;
    STA.W Hopper.XVelocity,X                                             ;A3AE11;

  .notCollidedWithWall:
    LDA.W Hopper.YSpeedTableIndex,X                                      ;A3AE14;
    CLC                                                                  ;A3AE17;
    ADC.W Hopper.XSpeedTableIndexDelta,X                                 ;A3AE18;
    CMP.W #$0040                                                         ;A3AE1B;
    BMI +                                                                ;A3AE1E;
    LDA.W #$0040                                                         ;A3AE20;

+   STA.W Hopper.YSpeedTableIndex,X                                      ;A3AE23;

  .return:
    RTS                                                                  ;A3AE26;


;;; $AE27: Sidehopper movement - jumping - upside down ;;;
HopperMovement_Jumping_UpsideDown:
    LDX.W EnemyIndex                                                     ;A3AE27;
    LDA.W Hopper.YSpeedTableIndex,X                                      ;A3AE2A;
    ASL                                                                  ;A3AE2D;
    ASL                                                                  ;A3AE2E;
    ASL                                                                  ;A3AE2F;
    TAY                                                                  ;A3AE30;
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+2,Y                  ;A3AE31;
    STA.B DP_Temp14                                                      ;A3AE34;
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing,Y                    ;A3AE36;
    STA.B DP_Temp12                                                      ;A3AE39;
    JSL.L MoveEnemyDownBy_14_12                                          ;A3AE3B;
    BCC .notCollidedWithBlock                                            ;A3AE3F;
    LDA.W Hopper.XVelocity,X                                             ;A3AE41;
    EOR.W #$FFFF                                                         ;A3AE44;
    INC                                                                  ;A3AE47;
    STA.W Hopper.XVelocity,X                                             ;A3AE48;
    LDA.W #$0001                                                         ;A3AE4B;
    STA.L Hopper.fallingFlag,X                                           ;A3AE4E;
    BRA .return                                                          ;A3AE52;

  .notCollidedWithBlock:
    LDA.W Hopper.XVelocity,X                                             ;A3AE54;
    STA.B DP_Temp14                                                      ;A3AE57;
    STZ.B DP_Temp12                                                      ;A3AE59;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A3AE5B;
    BCC .notCollidedWithWall                                             ;A3AE5F;
    LDA.W Hopper.XVelocity,X                                             ;A3AE61;
    EOR.W #$FFFF                                                         ;A3AE64;
    INC                                                                  ;A3AE67;
    STA.W Hopper.XVelocity,X                                             ;A3AE68;
    LDA.W #$0001                                                         ;A3AE6B;
    STA.L Hopper.fallingFlag,X                                           ;A3AE6E;
    BRA .return                                                          ;A3AE72;

  .notCollidedWithWall:
    LDA.W Hopper.YSpeedTableIndex,X                                      ;A3AE74;
    SEC                                                                  ;A3AE77;
    SBC.W Hopper.XSpeedTableIndexDelta,X                                 ;A3AE78;
    STA.W Hopper.YSpeedTableIndex,X                                      ;A3AE7B;
    BPL .return                                                          ;A3AE7E;
    LDA.W #$0001                                                         ;A3AE80;
    STA.L Hopper.fallingFlag,X                                           ;A3AE83;
    LDA.W #$0000                                                         ;A3AE87;
    STA.W Hopper.YSpeedTableIndex,X                                      ;A3AE8A;

  .return:
    RTS                                                                  ;A3AE8D;


;;; $AE8E: Sidehopper movement - falling - upside down ;;;
HopperMovement_Falling_UpsideDown:
    LDX.W EnemyIndex                                                     ;A3AE8E;
    LDA.W Hopper.YSpeedTableIndex,X                                      ;A3AE91;
    ASL                                                                  ;A3AE94;
    ASL                                                                  ;A3AE95;
    ASL                                                                  ;A3AE96;
    TAY                                                                  ;A3AE97;
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+6,Y                  ;A3AE98;
    STA.B DP_Temp14                                                      ;A3AE9B;
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+4,Y                  ;A3AE9D;
    STA.B DP_Temp12                                                      ;A3AEA0;
    JSL.L MoveEnemyDownBy_14_12                                          ;A3AEA2;
    BCC .notCollidedWithBlock                                            ;A3AEA6;
    LDA.W #$0000                                                         ;A3AEA8;
    STA.L Hopper.fallingFlag,X                                           ;A3AEAB;
    LDA.W #Function_Hopper_Landed                                        ;A3AEAF;
    STA.W Hopper.function,X                                              ;A3AEB2;
    BRA .return                                                          ;A3AEB5;

  .notCollidedWithBlock:
    LDA.W Hopper.XVelocity,X                                             ;A3AEB7;
    STA.B DP_Temp14                                                      ;A3AEBA;
    STZ.B DP_Temp12                                                      ;A3AEBC;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A3AEBE;
    BCC .notCollidedWithWall                                             ;A3AEC2;
    LDA.W Hopper.XVelocity,X                                             ;A3AEC4;
    EOR.W #$FFFF                                                         ;A3AEC7;
    INC                                                                  ;A3AECA;
    STA.W Hopper.XVelocity,X                                             ;A3AECB;

  .notCollidedWithWall:
    LDA.W Hopper.YSpeedTableIndex,X                                      ;A3AECE;
    CLC                                                                  ;A3AED1;
    ADC.W Hopper.XSpeedTableIndexDelta,X                                 ;A3AED2;
    CMP.W #$0040                                                         ;A3AED5;
    BMI +                                                                ;A3AED8;
    LDA.W #$0040                                                         ;A3AEDA;

+   STA.W Hopper.YSpeedTableIndex,X                                      ;A3AEDD;

  .return:
    RTS                                                                  ;A3AEE0;


;;; $AEE1: RTL ;;;
RTL_A3AEE1:
    RTL                                                                  ;A3AEE1;


;;; $AEE2: RTL ;;;
RTL_A3AEE2:
    RTL                                                                  ;A3AEE2;


;;; $AEE3: Sidehopper spritemaps ;;;
Spritemap_Sidehopper_0:
    dw $0005                                                             ;A3AEE3;
    %spritemapEntry(1, $1F8, $F3, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $04, $EC, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $04, $FC, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $1EC, $EC, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1EC, $FC, 0, 0, 2, 0, $104)

Spritemap_Sidehopper_1:
    dw $0005                                                             ;A3AEFE;
    %spritemapEntry(1, $1F8, $F5, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $04, $EC, 0, 1, 2, 0, $10A)
    %spritemapEntry(1, $1EC, $EC, 0, 0, 2, 0, $10A)
    %spritemapEntry(1, $04, $FC, 0, 1, 2, 0, $108)
    %spritemapEntry(1, $1EC, $FC, 0, 0, 2, 0, $108)

Spritemap_Sidehopper_2:
    dw $0005                                                             ;A3AF19;
    %spritemapEntry(1, $1F8, $EF, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $04, $04, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $04, $F4, 0, 1, 2, 0, $10C)
    %spritemapEntry(1, $1EC, $04, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1EC, $F4, 0, 0, 2, 0, $10C)

Spritemap_Sidehopper_3:
    dw $0005                                                             ;A3AF34;
    %spritemapEntry(1, $1F8, $FD, 1, 0, 2, 0, $100)
    %spritemapEntry(1, $04, $04, 1, 1, 2, 0, $106)
    %spritemapEntry(1, $04, $F4, 1, 1, 2, 0, $104)
    %spritemapEntry(1, $1EC, $04, 1, 0, 2, 0, $106)
    %spritemapEntry(1, $1EC, $F4, 1, 0, 2, 0, $104)

Spritemap_Sidehopper_4:
    dw $0005                                                             ;A3AF4F;
    %spritemapEntry(1, $1F8, $FB, 1, 0, 2, 0, $102)
    %spritemapEntry(1, $04, $04, 1, 1, 2, 0, $10A)
    %spritemapEntry(1, $1EC, $04, 1, 0, 2, 0, $10A)
    %spritemapEntry(1, $04, $F4, 1, 1, 2, 0, $108)
    %spritemapEntry(1, $1EC, $F4, 1, 0, 2, 0, $108)

Spritemap_Sidehopper_5:
    dw $0005                                                             ;A3AF6A;
    %spritemapEntry(1, $1F8, $01, 1, 0, 2, 0, $100)
    %spritemapEntry(1, $04, $EC, 1, 1, 2, 0, $10E)
    %spritemapEntry(1, $04, $FC, 1, 1, 2, 0, $10C)
    %spritemapEntry(1, $1EC, $EC, 1, 0, 2, 0, $10E)
    %spritemapEntry(1, $1EC, $FC, 1, 0, 2, 0, $10C)


;;; $AF85: Palette - enemy $D97F (desgeega) ;;;
Palette_Dessgeega:
    dw $3800,$72FA,$55B0,$2845,$1801,$6210,$496B,$38C6                   ;A3AF85;
    dw $2C63,$241F,$1C17,$142F,$0C47,$03E0,$02A0,$0140                   ;A3AF95;


;;; $AFA5: Instruction list - desgeega - hopping - upside up ;;;
InstList_Dessgeega_Hopping_UpsideUp:
    dw Instruction_Common_EnableOffScreenProcessing                      ;A3AFA5;
    dw $0001,Spritemap_Dessgeega_2                                       ;A3AFA7;
    dw Instruction_Common_Sleep                                          ;A3AFAB;


;;; $AFAD: Instruction list - desgeega - landed - upside up ;;;
InstList_Dessgeega_Landed_UpsideUp:
    dw Instruction_Common_DisableOffScreenProcessing                     ;A3AFAD;
    dw $0002,Spritemap_Dessgeega_0                                       ;A3AFAF;
    dw $0005,Spritemap_Dessgeega_1                                       ;A3AFB3;
    dw $0002,Spritemap_Dessgeega_0                                       ;A3AFB7;
    dw $0003,Spritemap_Dessgeega_1                                       ;A3AFBB;
    dw Instruction_Hopper_ReadyToHop                                     ;A3AFBF;
    dw Instruction_Common_Sleep                                          ;A3AFC1;


;;; $AFC3: Instruction list - desgeega - hopping - upside down ;;;
InstList_Dessgeega_Hopping_UpsideDown:
    dw Instruction_Common_EnableOffScreenProcessing                      ;A3AFC3;
    dw $0001,Spritemap_Dessgeega_5                                       ;A3AFC5;
    dw Instruction_Common_Sleep                                          ;A3AFC9;


;;; $AFCB: Instruction list - desgeega - landed - upside down ;;;
InstList_Dessgeega_Landed_UpsideDown:
    dw Instruction_Common_DisableOffScreenProcessing                     ;A3AFCB;
    dw $0002,Spritemap_Dessgeega_3                                       ;A3AFCD;
    dw $0005,Spritemap_Dessgeega_4                                       ;A3AFD1;
    dw $0002,Spritemap_Dessgeega_3                                       ;A3AFD5;
    dw $0003,Spritemap_Dessgeega_4                                       ;A3AFD9;
    dw Instruction_Hopper_ReadyToHop                                     ;A3AFDD;
    dw Instruction_Common_Sleep                                          ;A3AFDF;


;;; $AFE1: RTL ;;;
RTL_A3AFE1:
    RTL                                                                  ;A3AFE1;


;;; $AFE2: RTL ;;;
RTL_A3AFE2:
    RTL                                                                  ;A3AFE2;


;;; $AFE3: Desgeega spritemaps ;;;
Spritemap_Dessgeega_0:
    dw $0005                                                             ;A3AFE3;
    %spritemapEntry(1, $1F8, $F3, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $04, $EC, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $04, $FC, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $1EC, $EC, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1EC, $FC, 0, 0, 2, 0, $104)

Spritemap_Dessgeega_1:
    dw $0005                                                             ;A3AFFE;
    %spritemapEntry(1, $1F8, $F5, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $04, $EC, 0, 1, 2, 0, $10A)
    %spritemapEntry(1, $1EC, $EC, 0, 0, 2, 0, $10A)
    %spritemapEntry(1, $04, $FC, 0, 1, 2, 0, $108)
    %spritemapEntry(1, $1EC, $FC, 0, 0, 2, 0, $108)

Spritemap_Dessgeega_2:
    dw $0005                                                             ;A3B019;
    %spritemapEntry(1, $1F8, $EF, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $04, $04, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $04, $F4, 0, 1, 2, 0, $10C)
    %spritemapEntry(1, $1EC, $04, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1EC, $F4, 0, 0, 2, 0, $10C)

Spritemap_Dessgeega_3:
    dw $0005                                                             ;A3B034;
    %spritemapEntry(1, $1F8, $FD, 1, 0, 2, 0, $100)
    %spritemapEntry(1, $04, $04, 1, 1, 2, 0, $106)
    %spritemapEntry(1, $04, $F4, 1, 1, 2, 0, $104)
    %spritemapEntry(1, $1EC, $04, 1, 0, 2, 0, $106)
    %spritemapEntry(1, $1EC, $F4, 1, 0, 2, 0, $104)

Spritemap_Dessgeega_4:
    dw $0005                                                             ;A3B04F;
    %spritemapEntry(1, $1F8, $FB, 1, 0, 2, 0, $102)
    %spritemapEntry(1, $04, $04, 1, 1, 2, 0, $10A)
    %spritemapEntry(1, $1EC, $04, 1, 0, 2, 0, $10A)
    %spritemapEntry(1, $04, $F4, 1, 1, 2, 0, $108)
    %spritemapEntry(1, $1EC, $F4, 1, 0, 2, 0, $108)

Spritemap_Dessgeega_5:
    dw $0005                                                             ;A3B06A;
    %spritemapEntry(1, $1F8, $01, 1, 0, 2, 0, $100)
    %spritemapEntry(1, $04, $EC, 1, 1, 2, 0, $10E)
    %spritemapEntry(1, $04, $FC, 1, 1, 2, 0, $10C)
    %spritemapEntry(1, $1EC, $EC, 1, 0, 2, 0, $10E)
    %spritemapEntry(1, $1EC, $FC, 1, 0, 2, 0, $10C)


;;; $B085: Palette - enemy $D9BF (super-sidehopper) ;;;
Palette_SidehopperLarge:
    dw $3800,$57FF,$42F7,$0D4A,$0063,$4F5A,$36B5,$2610                   ;A3B085;
    dw $1DCE,$4EDA,$3A35,$2990,$14EB,$5FE0,$32A0,$1940                   ;A3B095;


;;; $B0A5: Palette - enemy $D9FF (Tourian super-sidehopper) ;;;
Palette_SidehopperTourian:
    dw $3800,$7FFF,$56E0,$3180,$18C0,$6BC0,$5EC0,$4A20                   ;A3B0A5;
    dw $35A0,$7FFF,$039C,$0237,$00D1,$03FF,$0237,$00D1                   ;A3B0B5;


;;; $B0C5: Instruction list - super-sidehopper - hopping - upside up ;;;
InstList_SidehopperLarge_Hopping_UpsideUp:
    dw Instruction_Common_EnableOffScreenProcessing                      ;A3B0C5;
    dw Instruction_Sidehopper_QueueSoundInY_Lib2_Max3,$005D              ;A3B0C7;
    dw $0001,Spritemap_SidehopperTourian_2                               ;A3B0C9;
    dw Instruction_Common_Sleep                                          ;A3B0CF;


;;; $B0D1: Instruction list - super-sidehopper - landed - upside up ;;;
InstList_SidehopperLarge_Landed_UpsideUp:
    dw Instruction_Common_DisableOffScreenProcessing                     ;A3B0D1;
    dw Instruction_Sidehopper_QueueSoundInY_Lib2_Max3,$005E              ;A3B0D3;
    dw $0002,Spritemap_SidehopperTourian_0                               ;A3B0D5;
    dw $0005,Spritemap_SidehopperTourian_1                               ;A3B0DB;
    dw $0002,Spritemap_SidehopperTourian_0                               ;A3B0DF;
    dw $0003,Spritemap_SidehopperTourian_1                               ;A3B0E3;
    dw Instruction_Hopper_ReadyToHop                                     ;A3B0E7;
    dw Instruction_Common_Sleep                                          ;A3B0E9;


;;; $B0EB: Instruction list - super-sidehopper - hopping - upside down ;;;
InstList_SidehopperLarge_Hopping_UpsideDown:
    dw Instruction_Common_EnableOffScreenProcessing                      ;A3B0EB;
    dw Instruction_Sidehopper_QueueSoundInY_Lib2_Max3,$005D              ;A3B0ED;
    dw $0001,Spritemap_SidehopperTourian_5                               ;A3B0EF;
    dw Instruction_Common_Sleep                                          ;A3B0F5;


;;; $B0F7: Instruction list - super-sidehopper - landed - upside down ;;;
InstList_SidehopperLarge_Landed_UpsideDown:
    dw Instruction_Common_DisableOffScreenProcessing                     ;A3B0F7;
    dw Instruction_Sidehopper_QueueSoundInY_Lib2_Max3,$005E              ;A3B0F9;
    dw $0002,Spritemap_SidehopperTourian_3                               ;A3B0FB;
    dw $0005,Spritemap_SidehopperTourian_4                               ;A3B101;
    dw $0002,Spritemap_SidehopperTourian_3                               ;A3B105;
    dw $0003,Spritemap_SidehopperTourian_4                               ;A3B109;
    dw Instruction_Hopper_ReadyToHop                                     ;A3B10D;
    dw Instruction_Common_Sleep                                          ;A3B10F;


;;; $B111: Tourian super-sidehopper spritemaps ;;;
Spritemap_SidehopperTourian_0:
    dw $0007                                                             ;A3B111;
    %spritemapEntry(0, $00, $EC, 0, 0, 2, 0, $101)
    %spritemapEntry(0, $1F8, $EC, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $420C, $04, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $43E4, $04, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $4208, $F4, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $43E8, $F4, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $43F8, $F4, 0, 0, 2, 0, $110)

Spritemap_SidehopperTourian_1:
    dw $0007                                                             ;A3B136;
    %spritemapEntry(1, $43F8, $F6, 0, 0, 2, 0, $112)
    %spritemapEntry(1, $420D, $04, 0, 1, 2, 0, $10A)
    %spritemapEntry(1, $43E3, $04, 0, 0, 2, 0, $10A)
    %spritemapEntry(1, $4208, $F4, 0, 1, 2, 0, $108)
    %spritemapEntry(1, $43E8, $F4, 0, 0, 2, 0, $108)
    %spritemapEntry(0, $00, $EE, 0, 0, 2, 0, $101)
    %spritemapEntry(0, $1F8, $EE, 0, 0, 2, 0, $100)

Spritemap_SidehopperTourian_2:
    dw $000B                                                             ;A3B15B;
    %spritemapEntry(0, $10, $0C, 0, 1, 2, 0, $102)
    %spritemapEntry(0, $08, $0C, 0, 1, 2, 0, $103)
    %spritemapEntry(0, $1F0, $0C, 0, 0, 2, 0, $103)
    %spritemapEntry(0, $1E8, $0C, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $4208, $FC, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $43E8, $FC, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $4208, $EC, 0, 1, 2, 0, $10C)
    %spritemapEntry(1, $43E8, $EC, 0, 0, 2, 0, $10C)
    %spritemapEntry(0, $00, $E3, 0, 0, 2, 0, $101)
    %spritemapEntry(0, $1F8, $E3, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $43F8, $EB, 0, 0, 2, 0, $110)

Spritemap_SidehopperTourian_3:
    dw $0007                                                             ;A3B194;
    %spritemapEntry(0, $00, $0C, 1, 0, 2, 0, $101)
    %spritemapEntry(0, $1F8, $0C, 1, 0, 2, 0, $100)
    %spritemapEntry(1, $420C, $EC, 1, 1, 2, 0, $106)
    %spritemapEntry(1, $43E4, $EC, 1, 0, 2, 0, $106)
    %spritemapEntry(1, $4208, $FC, 1, 1, 2, 0, $104)
    %spritemapEntry(1, $43E8, $FC, 1, 0, 2, 0, $104)
    %spritemapEntry(1, $43F8, $FC, 1, 0, 2, 0, $110)

Spritemap_SidehopperTourian_4:
    dw $0007                                                             ;A3B1B9;
    %spritemapEntry(1, $43F8, $FA, 1, 0, 2, 0, $112)
    %spritemapEntry(1, $420D, $EC, 1, 1, 2, 0, $10A)
    %spritemapEntry(1, $43E3, $EC, 1, 0, 2, 0, $10A)
    %spritemapEntry(1, $4208, $FC, 1, 1, 2, 0, $108)
    %spritemapEntry(1, $43E8, $FC, 1, 0, 2, 0, $108)
    %spritemapEntry(0, $00, $0A, 1, 0, 2, 0, $101)
    %spritemapEntry(0, $1F8, $0A, 1, 0, 2, 0, $100)

Spritemap_SidehopperTourian_5:
    dw $000B                                                             ;A3B1DE;
    %spritemapEntry(0, $10, $EC, 1, 1, 2, 0, $102)
    %spritemapEntry(0, $08, $EC, 1, 1, 2, 0, $103)
    %spritemapEntry(0, $1F0, $EC, 1, 0, 2, 0, $103)
    %spritemapEntry(0, $1E8, $EC, 1, 0, 2, 0, $102)
    %spritemapEntry(1, $4208, $F4, 1, 1, 2, 0, $10E)
    %spritemapEntry(1, $43E8, $F4, 1, 0, 2, 0, $10E)
    %spritemapEntry(1, $4208, $04, 1, 1, 2, 0, $10C)
    %spritemapEntry(1, $43E8, $04, 1, 0, 2, 0, $10C)
    %spritemapEntry(0, $00, $15, 1, 0, 2, 0, $101)
    %spritemapEntry(0, $1F8, $15, 1, 0, 2, 0, $100)
    %spritemapEntry(1, $43F8, $05, 1, 0, 2, 0, $110)


;;; $B217: Palette - enemy $DA3F (super-desgeega) ;;;
Palette_DessgeegaLarge:
    dw $3800,$72FA,$55B0,$2845,$1801,$6210,$496B,$38C6                   ;A3B217;
    dw $2C63,$241F,$1C17,$142F,$0C47,$03E0,$02A0,$0140                   ;A3B227;


;;; $B237: Instruction list - super-desgeega - hopping - upside up ;;;
InstList_DessgeegaLarge_Hopping_UpsideUp:
    dw Instruction_Common_EnableOffScreenProcessing                      ;A3B237;
    dw $0001,Spritemap_DessgeegaLarge_2                                  ;A3B239;
    dw Instruction_Common_Sleep                                          ;A3B23D;


;;; $B23F: Instruction list - super-desgeega - landed - upside up ;;;
InstList_DessgeegaLarge_Landed_UpsideUp:
    dw Instruction_Common_DisableOffScreenProcessing                     ;A3B23F;
    dw $0002,Spritemap_DessgeegaLarge_0                                  ;A3B241;
    dw $0005,Spritemap_DessgeegaLarge_1                                  ;A3B245;
    dw $0002,Spritemap_DessgeegaLarge_0                                  ;A3B249;
    dw $0003,Spritemap_DessgeegaLarge_1                                  ;A3B24D;
    dw Instruction_Hopper_ReadyToHop                                     ;A3B251;
    dw Instruction_Common_Sleep                                          ;A3B253;


;;; $B255: Instruction list - super-desgeega - hopping - upside down ;;;
InstList_DessgeegaLarge_Hopping_UpsideDown:
    dw Instruction_Common_EnableOffScreenProcessing                      ;A3B255;
    dw $0001,Spritemap_DessgeegaLarge_5                                  ;A3B257;
    dw Instruction_Common_Sleep                                          ;A3B25B;


;;; $B25D: Instruction list - super-desgeega - landed - upside down ;;;
InstList_DessgeegaLarge_Landed_UpsideDown:
    dw Instruction_Common_DisableOffScreenProcessing                     ;A3B25D;
    dw $0002,Spritemap_DessgeegaLarge_3                                  ;A3B25F;
    dw $0005,Spritemap_DessgeegaLarge_4                                  ;A3B263;
    dw $0002,Spritemap_DessgeegaLarge_3                                  ;A3B267;
    dw $0003,Spritemap_DessgeegaLarge_4                                  ;A3B26B;
    dw Instruction_Hopper_ReadyToHop                                     ;A3B26F;
    dw Instruction_Common_Sleep                                          ;A3B271;


;;; $B273: Super-desgeega spritemaps ;;;
Spritemap_DessgeegaLarge_0:
    dw $0009                                                             ;A3B273;
    %spritemapEntry(1, $43F8, $F5, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $43E5, $F4, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $420B, $F4, 0, 1, 2, 0, $104)
    %spritemapEntry(0, $06, $F5, 0, 1, 2, 0, $11A)
    %spritemapEntry(0, $1F2, $F5, 0, 0, 2, 0, $11A)
    %spritemapEntry(1, $420B, $04, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $43E5, $04, 0, 0, 2, 0, $106)
    %spritemapEntry(0, $00, $ED, 0, 0, 2, 0, $10D)
    %spritemapEntry(0, $1F8, $ED, 0, 0, 2, 0, $10C)

Spritemap_DessgeegaLarge_1:
    dw $0009                                                             ;A3B2A2;
    %spritemapEntry(1, $43F8, $F6, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $420A, $F4, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $43E6, $F4, 0, 0, 2, 0, $104)
    %spritemapEntry(0, $06, $F6, 0, 1, 2, 0, $11C)
    %spritemapEntry(0, $1F2, $F6, 0, 0, 2, 0, $11C)
    %spritemapEntry(1, $420B, $04, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $43E5, $04, 0, 0, 2, 0, $106)
    %spritemapEntry(0, $00, $EE, 0, 0, 2, 0, $10B)
    %spritemapEntry(0, $1F8, $EE, 0, 0, 2, 0, $10A)

Spritemap_DessgeegaLarge_2:
    dw $000B                                                             ;A3B2D1;
    %spritemapEntry(1, $43F8, $F0, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $420B, $F4, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $43E5, $F4, 0, 0, 2, 0, $104)
    %spritemapEntry(0, $07, $F4, 0, 1, 2, 0, $11B)
    %spritemapEntry(0, $1F1, $F4, 0, 0, 2, 0, $11B)
    %spritemapEntry(0, $00, $E8, 0, 0, 2, 0, $10D)
    %spritemapEntry(0, $1F8, $E8, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $420A, $14, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $43E6, $14, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $420A, $04, 0, 1, 2, 0, $108)
    %spritemapEntry(1, $43E6, $04, 0, 0, 2, 0, $108)

Spritemap_DessgeegaLarge_3:
    dw $0009                                                             ;A3B30A;
    %spritemapEntry(1, $43F8, $FB, 1, 0, 2, 0, $100)
    %spritemapEntry(1, $43E5, $FC, 1, 0, 2, 0, $104)
    %spritemapEntry(1, $420B, $FC, 1, 1, 2, 0, $104)
    %spritemapEntry(0, $06, $03, 1, 1, 2, 0, $11A)
    %spritemapEntry(0, $1F2, $03, 1, 0, 2, 0, $11A)
    %spritemapEntry(1, $420B, $EC, 1, 1, 2, 0, $106)
    %spritemapEntry(1, $43E5, $EC, 1, 0, 2, 0, $106)
    %spritemapEntry(0, $00, $0B, 1, 0, 2, 0, $10D)
    %spritemapEntry(0, $1F8, $0B, 1, 0, 2, 0, $10C)

Spritemap_DessgeegaLarge_4:
    dw $0009                                                             ;A3B339;
    %spritemapEntry(1, $43F8, $FA, 1, 0, 2, 0, $102)
    %spritemapEntry(1, $420A, $FC, 1, 1, 2, 0, $104)
    %spritemapEntry(1, $43E6, $FC, 1, 0, 2, 0, $104)
    %spritemapEntry(0, $06, $02, 1, 1, 2, 0, $11C)
    %spritemapEntry(0, $1F2, $02, 1, 0, 2, 0, $11C)
    %spritemapEntry(1, $420B, $EC, 1, 1, 2, 0, $106)
    %spritemapEntry(1, $43E5, $EC, 1, 0, 2, 0, $106)
    %spritemapEntry(0, $00, $0A, 1, 0, 2, 0, $10B)
    %spritemapEntry(0, $1F8, $0A, 1, 0, 2, 0, $10A)

Spritemap_DessgeegaLarge_5:
    dw $000B                                                             ;A3B368;
    %spritemapEntry(1, $43F8, $04, 1, 0, 2, 0, $100)
    %spritemapEntry(1, $420B, $00, 1, 1, 2, 0, $104)
    %spritemapEntry(1, $43E5, $00, 1, 0, 2, 0, $104)
    %spritemapEntry(0, $07, $08, 1, 1, 2, 0, $11B)
    %spritemapEntry(0, $1F1, $08, 1, 0, 2, 0, $11B)
    %spritemapEntry(0, $00, $14, 1, 0, 2, 0, $10D)
    %spritemapEntry(0, $1F8, $14, 1, 0, 2, 0, $10C)
    %spritemapEntry(1, $420A, $E0, 1, 1, 2, 0, $10E)
    %spritemapEntry(1, $43E6, $E0, 1, 0, 2, 0, $10E)
    %spritemapEntry(1, $420A, $F0, 1, 1, 2, 0, $108)
    %spritemapEntry(1, $43E6, $F0, 1, 0, 2, 0, $108)


;;; $B3A1: Palette - enemy $DA7F (zoa) ;;;
Palette_Zoa:
    dw $3800,$72FA,$55B0,$2845,$1801,$6210,$496B,$38C6                   ;A3B3A1;
    dw $2C63,$1D79,$1933,$150E,$10C8,$3BE0,$2680,$1580                   ;A3B3B1;


;;; $B3C1: Instruction list - facing left - shooting ;;;
InstList_Zoa_FacingLeft_Shooting:
    dw Instruction_Zoa_SetXSpeedTableIndexTo4                            ;A3B3C1;
    dw $0040,Spritemap_Zoa_0                                             ;A3B3C3;
    dw Instruction_Zoa_SetXSpeedTableIndexTo8                            ;A3B3C7;
    dw $0008,Spritemap_Zoa_1                                             ;A3B3C9;
    dw Instruction_Zoa_SetXSpeedTableIndexToC                            ;A3B3CD;
    dw $0030,Spritemap_Zoa_2                                             ;A3B3CF;
    dw Instruction_Common_GotoY                                          ;A3B3D3;
    dw InstList_Zoa_FacingLeft_Shooting                                  ;A3B3D5;


;;; $B3D7: Instruction list - facing left - rising ;;;
InstList_Zoa_FacingLeft_Rising:
    dw $0004,Spritemap_Zoa_4                                             ;A3B3D7;
    dw $0004,Spritemap_Zoa_3                                             ;A3B3DB;
    dw $0004,Spritemap_Zoa_5                                             ;A3B3DF;
    dw Instruction_Common_GotoY                                          ;A3B3E3;
    dw InstList_Zoa_FacingLeft_Rising                                    ;A3B3E5;


;;; $B3E7: Instruction list - facing right - shooting ;;;
InstList_Zoa_FacingRight_Shooting:
    dw Instruction_Zoa_SetXSpeedTableIndexTo4                            ;A3B3E7;
    dw $0040,Spritemap_Zoa_6                                             ;A3B3E9;
    dw Instruction_Zoa_SetXSpeedTableIndexTo8                            ;A3B3ED;
    dw $0008,Spritemap_Zoa_7                                             ;A3B3EF;
    dw Instruction_Zoa_SetXSpeedTableIndexToC                            ;A3B3F3;
    dw $0030,Spritemap_Zoa_8                                             ;A3B3F5;
    dw Instruction_Common_GotoY                                          ;A3B3F9;
    dw InstList_Zoa_FacingRight_Shooting                                 ;A3B3FB;


;;; $B3FD: Instruction list - facing right - rising ;;;
InstList_Zoa_FacingRight_Rising:
    dw $0004,Spritemap_Zoa_A                                             ;A3B3FD;
    dw $0004,Spritemap_Zoa_9                                             ;A3B401;
    dw $0004,Spritemap_Zoa_B                                             ;A3B405;
    dw Instruction_Common_GotoY                                          ;A3B409;
    dw InstList_Zoa_FacingRight_Rising                                   ;A3B40B;


;;; $B40D: Zoa instruction list pointers ;;;
InstListPointers_Zoa:
    dw InstList_Zoa_FacingLeft_Shooting                                  ;A3B40D;
    dw InstList_Zoa_FacingLeft_Rising                                    ;A3B40F;
    dw InstList_Zoa_FacingRight_Shooting                                 ;A3B411;
    dw InstList_Zoa_FacingRight_Rising                                   ;A3B413;


;;; $B415: Zoa X speed table ;;;
ZoaXSpeedTable:
; Indexed by enemy $7E:7800
;        _________ X speed
;       |      ___ X subspeed
;       |     |
  .speed:
    dw $0000                                                             ;A3B415;
  .subSpeed:
    dw       $0000                                                       ;A3B417;
    dw $0000,$8000
    dw $0000,$A000
    dw $0002,$0000
    dw $0000,$0000


;;; $B429: Instruction - enemy X speed table index = 4 ;;;
Instruction_Zoa_SetXSpeedTableIndexTo4:
    LDX.W EnemyIndex                                                     ;A3B429;
    LDA.W #$0004                                                         ;A3B42C;
    STA.L Zoa.XSpeedTableIndex,X                                         ;A3B42F;
    RTL                                                                  ;A3B433;


;;; $B434: Instruction - enemy X speed table index = 8 ;;;
Instruction_Zoa_SetXSpeedTableIndexTo8:
    LDX.W EnemyIndex                                                     ;A3B434;
    LDA.W #$0008                                                         ;A3B437;
    STA.L Zoa.XSpeedTableIndex,X                                         ;A3B43A;
    RTL                                                                  ;A3B43E;


;;; $B43F: Instruction - enemy X speed table index = Ch ;;;
Instruction_Zoa_SetXSpeedTableIndexToC:
    LDX.W EnemyIndex                                                     ;A3B43F;
    LDA.W #$000C                                                         ;A3B442;
    STA.L Zoa.XSpeedTableIndex,X                                         ;A3B445;
    RTL                                                                  ;A3B449;


;;; $B44A: Initialisation AI - enemy $DA7F (zoa) ;;;
InitAI_Zoa:
    LDX.W EnemyIndex                                                     ;A3B44A;
    LDA.W #Function_Zoa_WaitForSamusToGetNear                            ;A3B44D;
    STA.W Zoa.function,X                                                 ;A3B450;
    LDA.W #$0000                                                         ;A3B453;
    STA.W Zoa.instListTableIndex,X                                       ;A3B456;
    STA.W Zoa.previousInstListTableIndex,X                               ;A3B459;
    STA.L Zoa.XSpeedTableIndex,X                                         ;A3B45C;
    LDA.W #InstList_Zoa_FacingLeft_Shooting                              ;A3B460;
    STA.W Enemy.instList,X                                               ;A3B463;
    LDA.W Enemy.properties,X                                             ;A3B466;
    ORA.W #$0100                                                         ;A3B469;
    STA.W Enemy.properties,X                                             ;A3B46C;
    LDA.W Enemy.XPosition,X                                              ;A3B46F;
    STA.W Zoa.spawnXPosition,X                                           ;A3B472;
    LDA.W Enemy.YPosition,X                                              ;A3B475;
    STA.W Zoa.spawnYPosition,X                                           ;A3B478;
    RTL                                                                  ;A3B47B;


;;; $B47C: Main AI - enemy $DA7F (zoa) ;;;
MainAI_Zoa:
    LDX.W EnemyIndex                                                     ;A3B47C;
    JMP.W (Zoa.function,X)                                               ;A3B47F;


;;; $B482: Zoa function - wait for Samus to get near ;;;
Function_Zoa_WaitForSamusToGetNear:
    LDX.W EnemyIndex                                                     ;A3B482;
    LDA.W #$0080                                                         ;A3B485;
    JSL.L IsSamusWithinAPixelColumnsOfEnemy                              ;A3B488;
    BEQ .return                                                          ;A3B48C;
    LDY.W #$0001                                                         ;A3B48E;
    JSL.L Get_SamusX_minus_EnemyX                                        ;A3B491;
    BMI .keepLeft                                                        ;A3B495;
    LDY.W #$0003                                                         ;A3B497;

  .keepLeft:
    TYA                                                                  ;A3B49A;
    STA.W Zoa.instListTableIndex,X                                       ;A3B49B;
    JSR.W SetZoaInstList                                                 ;A3B49E;
    LDA.W #Function_Zoa_Rising                                           ;A3B4A1;
    STA.W Zoa.function,X                                                 ;A3B4A4;

  .return:
    RTL                                                                  ;A3B4A7;


;;; $B4A8: Zoa function - rising ;;;
Function_Zoa_Rising:
    LDA.W Enemy.properties,X                                             ;A3B4A8;
    AND.W #$FEFF                                                         ;A3B4AB;
    STA.W Enemy.properties,X                                             ;A3B4AE;
    JSL.L Get_SamusY_minus_EnemyY                                        ;A3B4B1;
    BMI .rising                                                          ;A3B4B5;
    DEC.W Zoa.instListTableIndex,X                                       ;A3B4B7;
    JSR.W SetZoaInstList                                                 ;A3B4BA;
    STZ.W Enemy.var5,X                                                   ;A3B4BD;
    LDA.W #Function_Zoa_Shooting                                         ;A3B4C0;
    STA.W Zoa.function,X                                                 ;A3B4C3;
    RTL                                                                  ;A3B4C6;

  .rising:
    LDA.W #$0000                                                         ;A3B4C7;
    STA.B DP_Temp14                                                      ;A3B4CA;
    LDA.W #$8000                                                         ;A3B4CC;
    STA.B DP_Temp12                                                      ;A3B4CF;
    JSL.L MoveEnemyY_minus_12_14                                         ;A3B4D1;
    RTL                                                                  ;A3B4D5;


;;; $B4D6: Zoa function - shooting ;;;
Function_Zoa_Shooting:
    LDA.W Zoa.instListTableIndex,X                                       ;A3B4D6;
    BEQ .right                                                           ;A3B4D9;
    LDA.L Zoa.XSpeedTableIndex,X                                         ;A3B4DB;
    TAY                                                                  ;A3B4DF;
    LDA.W ZoaXSpeedTable_speed,Y                                         ;A3B4E0;
    STA.B DP_Temp14                                                      ;A3B4E3;
    LDA.W ZoaXSpeedTable_subSpeed,Y                                      ;A3B4E5;
    STA.B DP_Temp12                                                      ;A3B4E8;
    JSL.L MoveEnemyX_plus_12_14                                          ;A3B4EA;
    JSL.L CheckIfEnemyCenterIsOnScreen                                   ;A3B4EE;
    BNE .offScreen                                                       ;A3B4F2;
    JSR.W SetZoaInstList                                                 ;A3B4F4;
    RTL                                                                  ;A3B4F7;

  .right:
    LDA.L Zoa.XSpeedTableIndex,X                                         ;A3B4F8;
    TAY                                                                  ;A3B4FC;
    LDA.W ZoaXSpeedTable_speed,Y                                         ;A3B4FD;
    STA.B DP_Temp14                                                      ;A3B500;
    LDA.W ZoaXSpeedTable_subSpeed,Y                                      ;A3B502;
    STA.B DP_Temp12                                                      ;A3B505;
    JSL.L MoveEnemyX_minus_12_14                                         ;A3B507;
    JSL.L CheckIfEnemyCenterIsOnScreen                                   ;A3B50B;
    BNE .offScreen                                                       ;A3B50F;
    JSR.W SetZoaInstList                                                 ;A3B511;
    RTL                                                                  ;A3B514;

  .offScreen:
    LDA.W Enemy.properties,X                                             ;A3B515;
    ORA.W #$0100                                                         ;A3B518;
    STA.W Enemy.properties,X                                             ;A3B51B;
    LDA.W Zoa.spawnXPosition,X                                           ;A3B51E;
    STA.W Enemy.XPosition,X                                              ;A3B521;
    LDA.W Zoa.spawnYPosition,X                                           ;A3B524;
    STA.W Enemy.YPosition,X                                              ;A3B527;
    STZ.W Zoa.instListTableIndex,X                                       ;A3B52A;
    JSR.W SetZoaInstList                                                 ;A3B52D;
    LDA.W #Function_Zoa_WaitForSamusToGetNear                            ;A3B530;
    STA.W Zoa.function,X                                                 ;A3B533;
    RTL                                                                  ;A3B536;


;;; $B537: Set zoa instruction list ;;;
SetZoaInstList:
    LDX.W EnemyIndex                                                     ;A3B537;
    LDA.W Zoa.instListTableIndex,X                                       ;A3B53A;
    CMP.W Zoa.previousInstListTableIndex,X                               ;A3B53D;
    BEQ .return                                                          ;A3B540;
    STA.W Zoa.previousInstListTableIndex,X                               ;A3B542;
    ASL                                                                  ;A3B545;
    TAY                                                                  ;A3B546;
    LDA.W InstListPointers_Zoa,Y                                         ;A3B547;
    STA.W Enemy.instList,X                                               ;A3B54A;
    LDA.W #$0001                                                         ;A3B54D;
    STA.W Enemy.instTimer,X                                              ;A3B550;
    STZ.W Enemy.loopCounter,X                                            ;A3B553;

  .return:
    RTS                                                                  ;A3B556;


if !FEATURE_KEEP_UNREFERENCED
;;; $B557: RTL ;;;
UNUSED_GetEnemyIndex_A3B557:
    LDX.W EnemyIndex                                                     ;A3B557;
    RTL                                                                  ;A3B55A;


;;; $B55B: RTL ;;;
UNUSED_GetEnemyIndex_A3B55B:
    LDX.W EnemyIndex                                                     ;A3B55B;
    RTL                                                                  ;A3B55E;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $B55F: Zoa spritemaps ;;;
Spritemap_Zoa_0:
    dw $0001                                                             ;A3B55F;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $100)

Spritemap_Zoa_1:
    dw $0001                                                             ;A3B566;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $102)

Spritemap_Zoa_2:
    dw $0001                                                             ;A3B56D;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $104)

Spritemap_Zoa_3:
    dw $0001                                                             ;A3B574;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $106)

Spritemap_Zoa_4:
    dw $0001                                                             ;A3B57B;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $108)

Spritemap_Zoa_5:
    dw $0001                                                             ;A3B582;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10A)

Spritemap_Zoa_6:
    dw $0001                                                             ;A3B589;
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $100)

Spritemap_Zoa_7:
    dw $0001                                                             ;A3B590;
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $102)

Spritemap_Zoa_8:
    dw $0001                                                             ;A3B597;
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $104)

Spritemap_Zoa_9:
    dw $0001                                                             ;A3B59E;
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $106)

Spritemap_Zoa_A:
    dw $0001                                                             ;A3B5A5;
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $108)

Spritemap_Zoa_B:
    dw $0001                                                             ;A3B5AC;
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $10A)


;;; $B5B3: Palette - enemy $DABF (viola) ;;;
Palette_Viola:
    dw $3800,$7FFF,$56E0,$3180,$18C0,$6BC0,$5EC0,$4A20                   ;A3B5B3;
    dw $35A0,$241F,$1C17,$142F,$0C47,$03E0,$02A0,$0140                   ;A3B5C3;


;;; $B5D3: Instruction list - viola - upside down ;;;
InstList_Viola_UpsideDown:
    dw Instruction_Crawlers_FunctionInY                                  ;A3B5D3;
    dw Function_Crawlers_CrawlingHorizontally                            ;A3B5D5;
    dw Instruction_Common_GotoY                                          ;A3B5D7;
    dw InstList_Viola_Normal                                             ;A3B5D9;


;;; $B5DB: Instruction list - viola - upside up ;;;
InstList_Viola_UpsideUp:
    dw Instruction_Crawlers_FunctionInY                                  ;A3B5DB;
    dw Function_Crawlers_CrawlingHorizontally                            ;A3B5DD;
    dw Instruction_Common_GotoY                                          ;A3B5DF;
    dw InstList_Viola_Normal                                             ;A3B5E1;


;;; $B5E3: Instruction list - viola - upside right ;;;
InstList_Viola_UpsideRight:
    dw Instruction_Crawlers_FunctionInY                                  ;A3B5E3;
    dw Function_Crawlers_CrawlingVertically                              ;A3B5E5;
    dw Instruction_Common_GotoY                                          ;A3B5E7;
    dw InstList_Viola_Normal                                             ;A3B5E9;


;;; $B5EB: Instruction list - viola - upside left ;;;
InstList_Viola_UpsideLeft:
    dw Instruction_Crawlers_FunctionInY                                  ;A3B5EB;
    dw Function_Crawlers_CrawlingVertically                              ;A3B5ED;


;;; $B5EF: Instruction list - viola - normal ;;;
InstList_Viola_Normal:
    dw $000A,Spritemap_Viola_Normal_0                                    ;A3B5EF;
    dw $000A,Spritemap_Viola_Normal_1                                    ;A3B5F3;
    dw $000A,Spritemap_Viola_Normal_2                                    ;A3B5F7;
    dw $000A,Spritemap_Viola_Normal_3                                    ;A3B5FB;
    dw $000A,Spritemap_Viola_Normal_4                                    ;A3B5FF;
    dw $000A,Spritemap_Viola_Normal_5                                    ;A3B603;
    dw $000A,Spritemap_Viola_Normal_6                                    ;A3B607;
    dw $000A,Spritemap_Viola_Normal_7                                    ;A3B60B;
    dw $000A,Spritemap_Viola_Normal_6                                    ;A3B60F;
    dw $000A,Spritemap_Viola_Normal_5                                    ;A3B613;
    dw $000A,Spritemap_Viola_Normal_4                                    ;A3B617;
    dw $000A,Spritemap_Viola_Normal_3                                    ;A3B61B;
    dw $000A,Spritemap_Viola_Normal_2                                    ;A3B61F;
    dw $000A,Spritemap_Viola_Normal_1                                    ;A3B623;
    dw Instruction_Common_GotoY                                          ;A3B627;
    dw InstList_Viola_Normal                                             ;A3B629;


if !FEATURE_KEEP_UNREFERENCED
;;; $B62B: Unused. Instruction list - viola - X flipped ;;;
UNUSED_InstList_Viola_XFlipped_A3B62B:
    dw $0006,UNUSED_Spritemap_Viola_XFlipped_A3B6C1                      ;A3B62B;
    dw $0006,UNUSED_Spritemap_Viola_XFlipped_A3B6C8                      ;A3B62F;
    dw $0006,UNUSED_Spritemap_Viola_XFlipped_A3B6CF                      ;A3B633;
    dw $0006,UNUSED_Spritemap_Viola_XFlipped_A3B6D6                      ;A3B637;
    dw $0006,UNUSED_Spritemap_Viola_XFlipped_A3B6DD                      ;A3B63B;
    dw $0006,UNUSED_Spritemap_Viola_XFlipped_A3B6E4                      ;A3B63F;
    dw $0006,UNUSED_Spritemap_Viola_XFlipped_A3B6EB                      ;A3B643;
    dw $0006,UNUSED_Spritemap_Viola_XFlipped_A3B6F2                      ;A3B647;
    dw $0006,UNUSED_Spritemap_Viola_XFlipped_A3B6EB                      ;A3B64B;
    dw $0006,UNUSED_Spritemap_Viola_XFlipped_A3B6E4                      ;A3B64F;
    dw $0006,UNUSED_Spritemap_Viola_XFlipped_A3B6DD                      ;A3B653;
    dw $0006,UNUSED_Spritemap_Viola_XFlipped_A3B6D6                      ;A3B657;
    dw $0006,UNUSED_Spritemap_Viola_XFlipped_A3B6CF                      ;A3B65B;
    dw $0006,UNUSED_Spritemap_Viola_XFlipped_A3B6C8                      ;A3B65F;
    dw Instruction_Common_GotoY                                          ;A3B663;
    dw UNUSED_InstList_Viola_XFlipped_A3B62B                             ;A3B665;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $B667: Viola initial instruction list pointers ;;;
InitialInstListPointers_Viola:
; Indexed by [enemy initialisation parameter] * 2
    dw InstList_Viola_UpsideRight                                        ;A3B667;
    dw InstList_Viola_UpsideLeft                                         ;A3B669;
    dw InstList_Viola_UpsideDown                                         ;A3B66B;
    dw InstList_Viola_UpsideUp                                           ;A3B66D;


;;; $B66F: Initialisation AI - enemy $DABF (viola) ;;;
InitAI_Viola:
    LDX.W EnemyIndex                                                     ;A3B66F;
    LDA.W #$0006                                                         ;A3B672;
    STA.W Enemy.init1,X                                                  ;A3B675;
    LDA.W Enemy.properties,X                                             ;A3B678;
    AND.W #$0003                                                         ;A3B67B;
    ASL                                                                  ;A3B67E;
    TAY                                                                  ;A3B67F;
    LDA.W InitialInstListPointers_Viola,Y                                ;A3B680;
    STA.W Enemy.instList,X                                               ;A3B683;
    JMP.W InitAI_Crawlers_Common                                         ;A3B686;


;;; $B689: Viola spritemaps ;;;
Spritemap_Viola_Normal_0:
    dw $0001                                                             ;A3B689;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $100)

Spritemap_Viola_Normal_1:
    dw $0001                                                             ;A3B690;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $102)

Spritemap_Viola_Normal_2:
    dw $0001                                                             ;A3B697;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $104)

Spritemap_Viola_Normal_3:
    dw $0001                                                             ;A3B69E;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $106)

Spritemap_Viola_Normal_4:
    dw $0001                                                             ;A3B6A5;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $108)

Spritemap_Viola_Normal_5:
    dw $0001                                                             ;A3B6AC;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10A)

Spritemap_Viola_Normal_6:
    dw $0001                                                             ;A3B6B3;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10C)

Spritemap_Viola_Normal_7:
    dw $0001                                                             ;A3B6BA;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10E)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Viola_XFlipped_A3B6C1:
    dw $0001                                                             ;A3B6C1;
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $100)

UNUSED_Spritemap_Viola_XFlipped_A3B6C8:
    dw $0001                                                             ;A3B6C8;
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $102)

UNUSED_Spritemap_Viola_XFlipped_A3B6CF:
    dw $0001                                                             ;A3B6CF;
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $104)

UNUSED_Spritemap_Viola_XFlipped_A3B6D6:
    dw $0001                                                             ;A3B6D6;
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $106)

UNUSED_Spritemap_Viola_XFlipped_A3B6DD:
    dw $0001                                                             ;A3B6DD;
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $108)

UNUSED_Spritemap_Viola_XFlipped_A3B6E4:
    dw $0001                                                             ;A3B6E4;
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $10A)

UNUSED_Spritemap_Viola_XFlipped_A3B6EB:
    dw $0001                                                             ;A3B6EB;
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $10C)

UNUSED_Spritemap_Viola_XFlipped_A3B6F2:
    dw $0001                                                             ;A3B6F2;
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $10E)


;;; $B6F9: Unused. Crash if enemy initialisation parameter is non-zero ;;;
UNUSED_CrashIfEnemyInitParamIsNonZero_A3B6F9:
    LDX.W EnemyIndex                                                     ;A3B6F9;
    LDA.W Enemy.instList,X                                               ;A3B6FC;

  .crash:
    BNE .crash                                                           ;A3B6FF;
    RTL                                                                  ;A3B701;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $B702: Palette - enemy $DB3F (bang) ;;;
Palette_Bang:
    dw $3800,$013F,$00D8,$0091,$002B,$7F12,$5B13,$2B15                   ;A3B702;
    dw $0318,$6A03,$5DA2,$40E1,$2C60,$2020,$7FFF,$0842                   ;A3B712;


;;; $B722: Instruction list pointers ;;;
InstListPointers_Bang:
; Core
    dw InstList_Bang_Core_Growth0_Idling                                 ;A3B722;
    dw InstList_Bang_Core_Growth0_Growing                                ;A3B724;
    dw InstList_Bang_Core_Growth1_Idling                                 ;A3B726;
    dw InstList_Bang_Core_Growth1_Growing                                ;A3B728;
    dw InstList_Bang_Core_Growth2_Idling                                 ;A3B72A;
    dw InstList_Bang_Core_Growth2_Growing                                ;A3B72C;
    dw InstList_Bang_Core_Growth3_Idling                                 ;A3B72E;
    dw InstList_Bang_Core_Growth3_Growing                                ;A3B730;
    dw InstList_Bang_Core_Growth4_Idling                                 ;A3B732;
    dw InstList_Bang_Core_Growth4_Growing                                ;A3B734;
; Electricity
    dw InstList_Bang_Electricity_None                                    ;A3B736;
    dw InstList_Bang_Electricity_None                                    ;A3B738;
    dw InstList_Bang_Electricity_None                                    ;A3B73A;
    dw InstList_Bang_Electricity_None                                    ;A3B73C;
    dw InstList_Bang_Electricity_None                                    ;A3B73E;
    dw InstList_Bang_Electricity_None                                    ;A3B740;
    dw InstList_Bang_Electricity_None                                    ;A3B742;
    dw InstList_Bang_Electricity_Growth3_4_Growing                       ;A3B744;
    dw InstList_Bang_Electricity_None                                    ;A3B746;
    dw InstList_Bang_Electricity_Growth3_4_Growing                       ;A3B748;
; Shell
    dw InstList_Bang_Shell_Growth0_Idling                                ;A3B74A;
    dw InstList_Bang_Shell_Growth0_Growing                               ;A3B74C;
    dw InstList_Bang_Shell_Growth1_Idling                                ;A3B74E;
    dw InstList_Bang_Shell_Growth1_Growing                               ;A3B750;
    dw InstList_Bang_Shell_Growth2_Idling                                ;A3B752;
    dw InstList_Bang_Shell_Growth2_Growing                               ;A3B754;
    dw InstList_Bang_Shell_Growth3_Idling                                ;A3B756;
    dw InstList_Bang_Shell_Growth3_Growing                               ;A3B758;
    dw InstList_Bang_Shell_Growth4_Idling                                ;A3B75A;
    dw InstList_Bang_Shell_Growth4_Growing                               ;A3B75C;


;;; $B75E: Instruction list - core - growth level 0 - idling ;;;
InstList_Bang_Core_Growth0_Idling:
    dw $0020,Spritemap_Bang_Growth0_Idling_0                             ;A3B75E;
    dw $000D,Spritemap_Bang_Growth0_Idling_2                             ;A3B762;
    dw $0010,Spritemap_Bang_Growth0_Idling_4                             ;A3B766;
    dw $000D,Spritemap_Bang_Growth0_Idling_2                             ;A3B76A;
    dw Instruction_Common_GotoY                                          ;A3B76E;
    dw InstList_Bang_Core_Growth0_Idling                                 ;A3B770;


;;; $B772: Instruction list - core - growth level 0 - growing ;;;
InstList_Bang_Core_Growth0_Growing:
    dw Instruction_Bang_PlayAcquiredSuitSFX                              ;A3B772;
    dw $0004,Spritemap_Bang_Growth0_Growing_0                            ;A3B774;
    dw $0008,Spritemap_Bang_Growth0_Growing_1                            ;A3B778;
    dw $0004,Spritemap_Bang_Growth0_Growing_0                            ;A3B77C;
    dw $0002,Spritemap_Bang_Growth0_Growing_2                            ;A3B780;
    dw $0004,Spritemap_Bang_Growth0_Growing_4                            ;A3B784;
    dw $0010,Spritemap_Bang_Growth0_Growing_6                            ;A3B788;
    dw Instruction_Bang_SetFinishedGrowingFlagTo1                        ;A3B78C;
    dw Instruction_Common_Sleep                                          ;A3B78E;


;;; $B790: Instruction list - core - growth level 1 - idling ;;;
InstList_Bang_Core_Growth1_Idling:
    dw $0010,Spritemap_Bang_Growth1_Idling_0                             ;A3B790;
    dw $0008,Spritemap_Bang_Growth1_Idling_2                             ;A3B794;
    dw $000D,Spritemap_Bang_Growth1_Idling_4                             ;A3B798;
    dw $0008,Spritemap_Bang_Growth1_Idling_2                             ;A3B79C;
    dw Instruction_Common_GotoY                                          ;A3B7A0;
    dw InstList_Bang_Core_Growth1_Idling                                 ;A3B7A2;


;;; $B7A4: Instruction list - core - growth level 1 - growing ;;;
InstList_Bang_Core_Growth1_Growing:
    dw Instruction_Bang_PlayAcquiredSuitSFX                              ;A3B7A4;
    dw $0004,Spritemap_Bang_Growth1_Growing_0                            ;A3B7A6;
    dw $0008,Spritemap_Bang_Growth1_Growing_1                            ;A3B7AA;
    dw $0004,Spritemap_Bang_Growth1_Growing_0                            ;A3B7AE;
    dw $0002,Spritemap_Bang_Growth1_Growing_2                            ;A3B7B2;
    dw $0004,Spritemap_Bang_Growth1_Growing_4                            ;A3B7B6;
    dw $0010,Spritemap_Bang_Growth1_Growing_6                            ;A3B7BA;
    dw Instruction_Bang_SetFinishedGrowingFlagTo1                        ;A3B7BE;
    dw Instruction_Common_Sleep                                          ;A3B7C0;


;;; $B7C2: Instruction list - core - growth level 2 - idling ;;;
InstList_Bang_Core_Growth2_Idling:
    dw $000C,Spritemap_Bang_Growth2_Idling_0                             ;A3B7C2;
    dw $0006,Spritemap_Bang_Growth2_Idling_2                             ;A3B7C6;
    dw $0004,Spritemap_Bang_Growth2_Idling_4                             ;A3B7CA;
    dw $0006,Spritemap_Bang_Growth2_Idling_2                             ;A3B7CE;
    dw Instruction_Common_GotoY                                          ;A3B7D2;
    dw InstList_Bang_Core_Growth2_Idling                                 ;A3B7D4;


;;; $B7D6: Instruction list - core - growth level 2 - growing ;;;
InstList_Bang_Core_Growth2_Growing:
    dw Instruction_Bang_PlayAcquiredSuitSFX                              ;A3B7D6;
    dw $0004,Spritemap_Bang_Growth2_Growing_0                            ;A3B7D8;
    dw $0008,Spritemap_Bang_Growth2_Growing_2                            ;A3B7DC;
    dw $0004,Spritemap_Bang_Growth2_Growing_0                            ;A3B7E0;
    dw $0002,Spritemap_Bang_Growth2_Growing_4                            ;A3B7E4;
    dw $0004,Spritemap_Bang_Growth2_Growing_6                            ;A3B7E8;
    dw $0010,Spritemap_Bang_Growth2_Growing_8                            ;A3B7EC;
    dw Instruction_Bang_SetFinishedGrowingFlagTo1                        ;A3B7F0;
    dw Instruction_Common_Sleep                                          ;A3B7F2;


;;; $B7F4: Instruction list - core - growth level 3 - idling ;;;
InstList_Bang_Core_Growth3_Idling:
    dw $0008,Spritemap_Bang_Growth3_Idling_0                             ;A3B7F4;
    dw $0003,Spritemap_Bang_Growth3_Idling_2                             ;A3B7F8;
    dw $0002,Spritemap_Bang_Growth3_Idling_4                             ;A3B7FC;
    dw $0003,Spritemap_Bang_Growth3_Idling_2                             ;A3B800;
    dw $0008,Spritemap_Bang_Growth3_Idling_6                             ;A3B804;
    dw $0003,Spritemap_Bang_Growth3_Idling_8                             ;A3B808;
    dw $0002,Spritemap_Bang_Growth3_Idling_A                             ;A3B80C;
    dw $0003,Spritemap_Bang_Growth3_Idling_8                             ;A3B810;
    dw $0008,Spritemap_Bang_Growth3_Idling_0                             ;A3B814;
    dw $0003,Spritemap_Bang_Growth3_Idling_2                             ;A3B818;
    dw $0002,Spritemap_Bang_Growth3_Idling_4                             ;A3B81C;
    dw $0003,Spritemap_Bang_Growth3_Idling_2                             ;A3B820;
    dw $0008,Spritemap_Bang_Growth3_Idling_C                             ;A3B824;
    dw $0003,Spritemap_Bang_Growth3_Idling_E                             ;A3B828;
    dw $0002,Spritemap_Bang_Growth3_Idling_10                            ;A3B82C;
    dw $0003,Spritemap_Bang_Growth3_Idling_E                             ;A3B830;
    dw Instruction_Common_GotoY                                          ;A3B834;
    dw InstList_Bang_Core_Growth3_Idling                                 ;A3B836;


;;; $B838: Instruction list - core - growth level 3 - growing ;;;
InstList_Bang_Core_Growth3_Growing:
    dw Instruction_Bang_PlayAcquiredSuitSFX                              ;A3B838;
    dw $0004,Spritemap_Bang_Growth3_Growing_0                            ;A3B83A;
    dw $0008,Spritemap_Bang_Growth3_Growing_2                            ;A3B83E;
    dw $0004,Spritemap_Bang_Growth3_Growing_0                            ;A3B842;
    dw $0002,Spritemap_Bang_Growth3_Growing_4                            ;A3B846;
    dw $0004,Spritemap_Bang_Growth3_Growing_6                            ;A3B84A;
    dw $0004,Spritemap_Bang_Growth3_Growing_8                            ;A3B84E;
    dw $0010,Spritemap_Bang_Growth3_Growing_A                            ;A3B852;
    dw Instruction_Bang_SetFinishedGrowingFlagTo1                        ;A3B856;
    dw Instruction_Common_Sleep                                          ;A3B858;


;;; $B85A: Instruction list - core - growth level 4 - idling ;;;
InstList_Bang_Core_Growth4_Idling:
    dw $0006,Spritemap_Bang_Growth4_Idling_0                             ;A3B85A;
    dw $0002,Spritemap_Bang_Growth4_Idling_2                             ;A3B85E;
    dw $0001,Spritemap_Bang_Growth4_Idling_4                             ;A3B862;
    dw $0002,Spritemap_Bang_Growth4_Idling_2                             ;A3B866;
    dw $0006,Spritemap_Bang_Growth4_Idling_6                             ;A3B86A;
    dw $0001,Spritemap_Bang_Growth4_Idling_4                             ;A3B86E;
    dw $0002,Spritemap_Bang_Growth4_Idling_2                             ;A3B872;
    dw $0006,Spritemap_Bang_Growth4_Idling_8                             ;A3B876;
    dw $0002,Spritemap_Bang_Growth4_Idling_A                             ;A3B87A;
    dw $0001,Spritemap_Bang_Growth4_Idling_C                             ;A3B87E;
    dw $0002,Spritemap_Bang_Growth4_Idling_A                             ;A3B882;
    dw Instruction_Common_GotoY                                          ;A3B886;
    dw InstList_Bang_Core_Growth4_Idling                                 ;A3B888;


;;; $B88A: Instruction list - core - growth level 4 - growing ;;;
InstList_Bang_Core_Growth4_Growing:
    dw Instruction_Bang_PlayAcquiredSuitSFX                              ;A3B88A;
    dw $0004,Spritemap_Bang_Growth4_Growing_0                            ;A3B88C;
    dw $0008,Spritemap_Bang_Growth4_Growing_2                            ;A3B890;
    dw $0004,Spritemap_Bang_Growth4_Growing_0                            ;A3B894;
    dw $0002,Spritemap_Bang_Growth4_Growing_4                            ;A3B898;
    dw $0004,Spritemap_Bang_Growth4_Growing_6                            ;A3B89C;
    dw $0004,Spritemap_Bang_Growth4_Growing_8                            ;A3B8A0;
    dw $0010,Spritemap_Bang_Growth4_Growing_A                            ;A3B8A4;
    dw Instruction_Bang_SetFinishedGrowingFlagTo1                        ;A3B8A8;
    dw Instruction_Common_Sleep                                          ;A3B8AA;


;;; $B8AC: Instruction list - shell - growth level 0 - idling ;;;
InstList_Bang_Shell_Growth0_Idling:
    dw $0020,Spritemap_Bang_Growth0_Idling_1                             ;A3B8AC;
    dw $000D,Spritemap_Bang_Growth0_Idling_3                             ;A3B8B0;
    dw $0010,Spritemap_Bang_Growth0_Idling_5                             ;A3B8B4;
    dw $000D,Spritemap_Bang_Growth0_Idling_3                             ;A3B8B8;
    dw Instruction_Common_GotoY                                          ;A3B8BC;
    dw InstList_Bang_Shell_Growth0_Idling                                ;A3B8BE;


;;; $B8C0: Instruction list - shell - growth level 0 - growing ;;;
InstList_Bang_Shell_Growth0_Growing:
    dw Instruction_Bang_PlayAcquiredSuitSFX                              ;A3B8C0;
    dw $0004,Spritemap_Common_Nothing                                    ;A3B8C2;
    dw $0008,Spritemap_Common_Nothing                                    ;A3B8C6;
    dw $0004,Spritemap_Common_Nothing                                    ;A3B8CA;
    dw $0002,Spritemap_Bang_Growth0_Growing_3                            ;A3B8CE;
    dw $0004,Spritemap_Bang_Growth0_Growing_5                            ;A3B8D2;
    dw $0010,Spritemap_Bang_Growth0_Growing_7                            ;A3B8D6;
    dw Instruction_Bang_SetFinishedGrowingFlagTo1                        ;A3B8DA;
    dw Instruction_Common_Sleep                                          ;A3B8DC;


;;; $B8DE: Instruction list - shell - growth level 1 - idling ;;;
InstList_Bang_Shell_Growth1_Idling:
    dw $0010,Spritemap_Bang_Growth1_Idling_1                             ;A3B8DE;
    dw $0008,Spritemap_Bang_Growth1_Idling_3                             ;A3B8E2;
    dw $000D,Spritemap_Bang_Growth1_Idling_5                             ;A3B8E6;
    dw $0008,Spritemap_Bang_Growth1_Idling_3                             ;A3B8EA;
    dw Instruction_Common_GotoY                                          ;A3B8EE;
    dw InstList_Bang_Shell_Growth1_Idling                                ;A3B8F0;


;;; $B8F2: Instruction list - shell - growth level 1 - growing ;;;
InstList_Bang_Shell_Growth1_Growing:
    dw Instruction_Bang_PlayAcquiredSuitSFX                              ;A3B8F2;
    dw $0004,Spritemap_Common_Nothing                                    ;A3B8F4;
    dw $0008,Spritemap_Common_Nothing                                    ;A3B8F8;
    dw $0004,Spritemap_Common_Nothing                                    ;A3B8FC;
    dw $0002,Spritemap_Bang_Growth1_Growing_3                            ;A3B900;
    dw $0004,Spritemap_Bang_Growth1_Growing_5                            ;A3B904;
    dw $0010,Spritemap_Bang_Growth1_Growing_7                            ;A3B908;
    dw Instruction_Bang_SetFinishedGrowingFlagTo1                        ;A3B90C;
    dw Instruction_Common_Sleep                                          ;A3B90E;


;;; $B910: Instruction list - shell - growth level 2 - idling ;;;
InstList_Bang_Shell_Growth2_Idling:
    dw $000C,Spritemap_Bang_Growth2_Idling_1                             ;A3B910;
    dw $0006,Spritemap_Bang_Growth2_Idling_3                             ;A3B914;
    dw $0004,Spritemap_Bang_Growth2_Idling_5                             ;A3B918;
    dw $0006,Spritemap_Bang_Growth2_Idling_3                             ;A3B91C;
    dw Instruction_Common_GotoY                                          ;A3B920;
    dw InstList_Bang_Shell_Growth2_Idling                                ;A3B922;


;;; $B924: Instruction list - shell - growth level 2 - growing ;;;
InstList_Bang_Shell_Growth2_Growing:
    dw Instruction_Bang_PlayAcquiredSuitSFX                              ;A3B924;
    dw $0004,Spritemap_Bang_Growth2_Growing_1                            ;A3B926;
    dw $0008,Spritemap_Bang_Growth2_Growing_3                            ;A3B92A;
    dw $0004,Spritemap_Bang_Growth2_Growing_1                            ;A3B92E;
    dw $0002,Spritemap_Bang_Growth2_Growing_5                            ;A3B932;
    dw $0004,Spritemap_Bang_Growth2_Growing_7                            ;A3B936;
    dw $0010,Spritemap_Bang_Growth2_Growing_9                            ;A3B93A;
    dw Instruction_Bang_SetFinishedGrowingFlagTo1                        ;A3B93E;
    dw Instruction_Common_Sleep                                          ;A3B940;


;;; $B942: Instruction list - shell - growth level 3 - idling ;;;
InstList_Bang_Shell_Growth3_Idling:
    dw $0008,Spritemap_Bang_Growth3_Idling_1                             ;A3B942;
    dw $0003,Spritemap_Bang_Growth3_Idling_3                             ;A3B946;
    dw $0002,Spritemap_Bang_Growth3_Idling_5                             ;A3B94A;
    dw $0003,Spritemap_Bang_Growth3_Idling_3                             ;A3B94E;
    dw $0008,Spritemap_Bang_Growth3_Idling_7                             ;A3B952;
    dw $0003,Spritemap_Bang_Growth3_Idling_9                             ;A3B956;
    dw $0002,Spritemap_Bang_Growth3_Idling_B                             ;A3B95A;
    dw $0003,Spritemap_Bang_Growth3_Idling_9                             ;A3B95E;
    dw $0008,Spritemap_Bang_Growth3_Idling_1                             ;A3B962;
    dw $0003,Spritemap_Bang_Growth3_Idling_3                             ;A3B966;
    dw $0002,Spritemap_Bang_Growth3_Idling_5                             ;A3B96A;
    dw $0003,Spritemap_Bang_Growth3_Idling_3                             ;A3B96E;
    dw $0008,Spritemap_Bang_Growth3_Idling_D                             ;A3B972;
    dw $0003,Spritemap_Bang_Growth3_Idling_F                             ;A3B976;
    dw $0002,Spritemap_Bang_Growth3_Idling_11                            ;A3B97A;
    dw $0003,Spritemap_Bang_Growth3_Idling_F                             ;A3B97E;
    dw Instruction_Common_GotoY                                          ;A3B982;
    dw InstList_Bang_Shell_Growth3_Idling                                ;A3B984;


;;; $B986: Instruction list - shell - growth level 3 - growing ;;;
InstList_Bang_Shell_Growth3_Growing:
    dw Instruction_Bang_PlayAcquiredSuitSFX                              ;A3B986;
    dw $0004,Spritemap_Bang_Growth3_Growing_1                            ;A3B988;
    dw $0008,Spritemap_Bang_Growth3_Growing_3                            ;A3B98C;
    dw $0004,Spritemap_Bang_Growth3_Growing_1                            ;A3B990;
    dw $0002,Spritemap_Bang_Growth3_Growing_5                            ;A3B994;
    dw $0004,Spritemap_Bang_Growth3_Growing_7                            ;A3B998;
    dw $0004,Spritemap_Bang_Growth3_Growing_9                            ;A3B99C;
    dw $0010,Spritemap_Bang_Growth3_Growing_B                            ;A3B9A0;
    dw Instruction_Bang_SetFinishedGrowingFlagTo1                        ;A3B9A4;
    dw Instruction_Common_Sleep                                          ;A3B9A6;


;;; $B9A8: Instruction list - shell - growth level 4 - idling ;;;
InstList_Bang_Shell_Growth4_Idling:
    dw $0006,Spritemap_Bang_Growth4_Idling_1                             ;A3B9A8;
    dw $0002,Spritemap_Bang_Growth4_Idling_3                             ;A3B9AC;
    dw $0001,Spritemap_Bang_Growth4_Idling_5                             ;A3B9B0;
    dw $0002,Spritemap_Bang_Growth4_Idling_3                             ;A3B9B4;
    dw $0006,Spritemap_Bang_Growth4_Idling_7                             ;A3B9B8;
    dw $0001,Spritemap_Bang_Growth4_Idling_5                             ;A3B9BC;
    dw $0002,Spritemap_Bang_Growth4_Idling_3                             ;A3B9C0;
    dw $0006,Spritemap_Bang_Growth4_Idling_9                             ;A3B9C4;
    dw $0002,Spritemap_Bang_Growth4_Idling_B                             ;A3B9C8;
    dw $0001,Spritemap_Bang_Growth4_Idling_D                             ;A3B9CC;
    dw $0002,Spritemap_Bang_Growth4_Idling_B                             ;A3B9D0;
    dw Instruction_Common_GotoY                                          ;A3B9D4;
    dw InstList_Bang_Shell_Growth4_Idling                                ;A3B9D6;


;;; $B9D8: Instruction list - shell - growth level 4 - growing ;;;
InstList_Bang_Shell_Growth4_Growing:
    dw Instruction_Bang_PlayAcquiredSuitSFX                              ;A3B9D8;
    dw $0004,Spritemap_Bang_Growth4_Growing_1                            ;A3B9DA;
    dw $0008,Spritemap_Bang_Growth4_Growing_3                            ;A3B9DE;
    dw $0004,Spritemap_Bang_Growth4_Growing_1                            ;A3B9E2;
    dw $0002,Spritemap_Bang_Growth4_Growing_5                            ;A3B9E6;
    dw $0004,Spritemap_Bang_Growth4_Growing_7                            ;A3B9EA;
    dw $0004,Spritemap_Bang_Growth4_Growing_9                            ;A3B9EE;
    dw $0010,Spritemap_Common_Nothing                                    ;A3B9F2;
    dw Instruction_Bang_SetFinishedGrowingFlagTo1                        ;A3B9F6;
    dw Instruction_Common_Sleep                                          ;A3B9F8;


;;; $B9FA: Instruction list - electricity - none ;;;
InstList_Bang_Electricity_None:
    dw $0001,Spritemap_Common_Nothing                                    ;A3B9FA;
    dw Instruction_Common_Sleep                                          ;A3B9FE;


;;; $BA00: Instruction list - electricity - growth level 3/4 - growing ;;;
InstList_Bang_Electricity_Growth3_4_Growing:
    dw $0002,Spritemap_Bang_Electricity_Growth3_4_Growing_0              ;A3BA00;
    dw $0003,Spritemap_Bang_Electricity_Growth3_4_Growing_1              ;A3BA04;
    dw $0004,Spritemap_Bang_Electricity_Growth3_4_Growing_2              ;A3BA08;
    dw $0002,Spritemap_Common_Nothing                                    ;A3BA0C;
    dw $0004,Spritemap_Bang_Electricity_Growth3_4_Growing_3              ;A3BA10;
    dw $0002,Spritemap_Bang_Electricity_Growth3_4_Growing_4              ;A3BA14;
    dw $0003,Spritemap_Bang_Electricity_Growth3_4_Growing_5              ;A3BA18;
    dw $0002,Spritemap_Bang_Electricity_Growth3_4_Growing_6              ;A3BA1C;
    dw $0004,Spritemap_Bang_Electricity_Growth3_4_Growing_7              ;A3BA20;
    dw $0003,Spritemap_Bang_Electricity_Growth3_4_Growing_8              ;A3BA24;
    dw $000A,Spritemap_Common_Nothing                                    ;A3BA28;
    dw $0003,Spritemap_Bang_Electricity_Growth3_4_Growing_9              ;A3BA2C;
    dw $0002,Spritemap_Bang_Electricity_Growth3_4_Growing_A              ;A3BA30;
    dw $0004,Spritemap_Bang_Electricity_Growth3_4_Growing_B              ;A3BA34;
    dw Instruction_Common_GotoY                                          ;A3BA38;
    dw InstList_Bang_Electricity_Growth3_4_Growing                       ;A3BA3A;


if !FEATURE_KEEP_UNREFERENCED
;;; $BA3C: Unused. Instruction list - electricity - growing ;;;
UNSUED_InstList_Bang_Electricity_Growing_A3BA3C:
; Probably intended to be growth level 4 - growing
    dw $0002,UNUSED_Spritemap_Bang_Electricity_A3C5AE                    ;A3BA3C;
    dw $0003,UNUSED_Spritemap_Bang_Electricity_A3C5BA                    ;A3BA40;
    dw $0004,UNUSED_Spritemap_Bang_Electricity_A3C5C6                    ;A3BA44;
    dw $0002,Spritemap_Common_Nothing                                    ;A3BA48;
    dw $0004,UNUSED_Spritemap_Bang_Electricity_A3C5D2                    ;A3BA4C;
    dw $0002,UNUSED_Spritemap_Bang_Electricity_A3C5DE                    ;A3BA50;
    dw $0003,UNUSED_Spritemap_Bang_Electricity_A3C5EA                    ;A3BA54;
    dw $0002,UNUSED_Spritemap_Bang_Electricity_A3C5F6                    ;A3BA58;
    dw $0004,UNUSED_Spritemap_Bang_Electricity_A3C602                    ;A3BA5C;
    dw $0003,UNUSED_Spritemap_Bang_Electricity_A3C60E                    ;A3BA60;
    dw $000A,Spritemap_Common_Nothing                                    ;A3BA64;
    dw $0003,UNUSED_Spritemap_Bang_Electricity_A3C61A                    ;A3BA68;
    dw $0002,UNUSED_Spritemap_Bang_Electricity_A3C626                    ;A3BA6C;
    dw $0004,UNUSED_Spritemap_Bang_Electricity_A3C632                    ;A3BA70;
    dw Instruction_Common_GotoY                                          ;A3BA74;
    dw UNSUED_InstList_Bang_Electricity_Growing_A3BA3C                   ;A3BA76;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $BA78: Instruction - queue acquired suit sound effect ;;;
Instruction_Bang_PlayAcquiredSuitSFX:
    PHY                                                                  ;A3BA78;
    PHX                                                                  ;A3BA79;
    LDA.W #$0056                                                         ;A3BA7A;
    JSL.L QueueSound_Lib2_Max6                                           ;A3BA7D;
    PLX                                                                  ;A3BA81;
    PLY                                                                  ;A3BA82;
    RTL                                                                  ;A3BA83;


;;; $BA84: Bang max speeds ;;;
BangMaxSpeeds:
    dw $02FF,$03FF,$04FF,$05FF,$06FF,$07FF,$08FF,$09FF                   ;A3BA84;


;;; $BA94: Bang angles ;;;
BangAngles:                                                              ;A3BA94;
    dw $00C0 ; 0: Up, facing right
    dw $00E0 ; 1: Up-right
    dw $0000 ; 2: Right
    dw $0020 ; 3: Down-right
    dw $0040 ; 4: Down, facing right
    dw $0040 ; 5: Down, facing left
    dw $0060 ; 6: Down-left
    dw $0080 ; 7: Left
    dw $00A0 ; 8: Up-left
    dw $00C0 ; 9: Up, facing left


;;; $BAA8: Instruction - enemy finished growing flag = 1 ;;;
Instruction_Bang_SetFinishedGrowingFlagTo1:
    LDX.W EnemyIndex                                                     ;A3BAA8;
    LDA.W #$0001                                                         ;A3BAAB;
    STA.L Bang.finishedGrowingFlag,X                                     ;A3BAAE;
    RTL                                                                  ;A3BAB2;


;;; $BAB3: Initialisation AI - enemy $DB3F (bang) ;;;
InitAI_Bang:
    LDX.W EnemyIndex                                                     ;A3BAB3;
    LDA.W Enemy.palette,X                                                ;A3BAB6;
    STA.W Bang.idlePaletteIndex,X                                        ;A3BAB9;
    LDA.W Enemy.properties,X                                             ;A3BABC;
    ORA.W #$1000                                                         ;A3BABF;
    STA.W Enemy.properties,X                                             ;A3BAC2;
    LDA.W #Function_Bang_Movement_MovementDelay                          ;A3BAC5;
    STA.W Bang.movementFunction,X                                        ;A3BAC8;
    LDA.W #$0010                                                         ;A3BACB;
    STA.L Bang.movementDelayTimer,X                                      ;A3BACE;
    LDA.W #$0000                                                         ;A3BAD2;
    STA.L Bang.angle,X                                                   ;A3BAD5;
    STA.L Bang.angleToSamus,X                                            ;A3BAD9;
    STA.L Bang.newInstListIndex,X                                        ;A3BADD;
    STA.L Bang.instListIndex,X                                           ;A3BAE1;
    STA.L Bang.finishedGrowingFlag,X                                     ;A3BAE5;
    LDA.W Enemy.init1,X                                                  ;A3BAE9;
    AND.W #$00FF                                                         ;A3BAEC;
    ASL                                                                  ;A3BAEF;
    TAY                                                                  ;A3BAF0;
    LDA.W BangMaxSpeeds,Y                                                ;A3BAF1;
    STA.L Bang.maxSpeed,X                                                ;A3BAF4;
    LDA.W Enemy.init1+1,X                                                ;A3BAF8;
    AND.W #$00FF                                                         ;A3BAFB;
    ASL                                                                  ;A3BAFE;
    ASL                                                                  ;A3BAFF;
    TAY                                                                  ;A3BB00;
    LDA.W BangAccelerationIntervalTimeResetValues_accel,Y                ;A3BB01;
    STA.L Bang.accelerationIntervalTimer,X                               ;A3BB04;
    STA.L Bang.accelerationIntervalTimerResetValue,X                     ;A3BB08;
    LDA.W BangAccelerationIntervalTimeResetValues_decel,Y                ;A3BB0C;
    STA.L Bang.decelerationIntervalTimerResetValue,X                     ;A3BB0F;
    LDA.W Enemy.instList,X                                               ;A3BB13;
    BNE .idling                                                          ;A3BB16;
    LDA.W #Function_Bang_Movement_GetEnemyIndex                          ;A3BB18;
    STA.W Bang.movementFunction,X                                        ;A3BB1B;

  .idling:
    LDA.W #InstList_Bang_Core_Growth0_Idling                             ;A3BB1E;
    STA.W Enemy.instList,X                                               ;A3BB21;
    RTL                                                                  ;A3BB24;


;;; $BB25: Main AI - enemy $DB3F (bang) ;;;
MainAI_Bang:
    LDX.W EnemyIndex                                                     ;A3BB25;
    JMP.W (Enemy.init0,X)                                                ;A3BB28;


;;; $BB2B: Bang AI - electricity ;;;
BangAI_Electricity:
; Pointed to by parameter 1 of debug enemy population data $B4:E309
    LDX.W EnemyIndex                                                     ;A3BB2B;
    LDA.L ExtraEnemy8000+$40,X                                           ;A3BB2E;
    CLC                                                                  ;A3BB32;
    ADC.W #$000A                                                         ;A3BB33;
    STA.L Bang.newInstListIndex,X                                        ;A3BB36;
    JSR.W SetBangInstList                                                ;A3BB3A;
    LDX.W EnemyIndex                                                     ;A3BB3D;
    LDA.W Enemy.properties,X                                             ;A3BB40;
    ORA.W #$0400                                                         ;A3BB43;
    STA.W Enemy.properties,X                                             ;A3BB46;
    RTL                                                                  ;A3BB49;


;;; $BB4A: Bang AI - shell ;;;
BangAI_Shell:
; Pointed to by parameter 1 of debug enemy population data $B4:E309
    LDX.W EnemyIndex                                                     ;A3BB4A;
    LDA.L ExtraEnemy8000-$40,X                                           ;A3BB4D;
    CLC                                                                  ;A3BB51;
    ADC.W #$0014                                                         ;A3BB52;
    STA.L Bang.newInstListIndex,X                                        ;A3BB55;
    JSR.W SetBangInstList                                                ;A3BB59;
    LDA.W Enemy.properties,X                                             ;A3BB5C;
    ORA.W #$0400                                                         ;A3BB5F;
    STA.W Enemy.properties,X                                             ;A3BB62;
    RTL                                                                  ;A3BB65;


;;; $BB66: Bang AI - core ;;;
BangAI_Core:
; Pointed to by parameter 1 of debug enemy population data $B4:E309
    LDX.W EnemyIndex                                                     ;A3BB66;
    JSR.W ExecuteBangeMovementFunction                                   ;A3BB69;
    LDA.W Enemy.XPosition,X                                              ;A3BB6C;
    STA.W Enemy[-1].XPosition,X                                          ;A3BB6F;
    STA.W Enemy[1].XPosition,X                                           ;A3BB72;
    LDA.W Enemy.YPosition,X                                              ;A3BB75;
    STA.W Enemy[-1].YPosition,X                                          ;A3BB78;
    STA.W Enemy[1].YPosition,X                                           ;A3BB7B;
    LDY.W Bang.idlePaletteIndex,X                                        ;A3BB7E;
    LDA.L Bang.newInstListIndex,X                                        ;A3BB81;
    AND.W #$0001                                                         ;A3BB85;
    BEQ +                                                                ;A3BB88;
    LDY.W #$0C00                                                         ;A3BB8A;

+   TYA                                                                  ;A3BB8D;
    STA.W Enemy.palette,X                                                ;A3BB8E;
    JSR.W SetBangInstList                                                ;A3BB91;
    LDA.L Bang.finishedGrowingFlag,X                                     ;A3BB94;
    BNE +                                                                ;A3BB98;
    RTL                                                                  ;A3BB9A;

+   LDA.W #$0000                                                         ;A3BB9B;
    STA.L Bang.finishedGrowingFlag,X                                     ;A3BB9E;
    LDA.L Bang.newInstListIndex,X                                        ;A3BBA2;
    CMP.W #$0009                                                         ;A3BBA6;
    BNE +                                                                ;A3BBA9;
    LDA.W #$0010                                                         ;A3BBAB;
    STA.W Enemy.invincibilityTimer,X                                     ;A3BBAE;
    LDA.W Enemy.properties,X                                             ;A3BBB1;
    ORA.W #$0400                                                         ;A3BBB4;
    STA.W Enemy.properties,X                                             ;A3BBB7;
    JSL.L DetermineDirectionOfSamusFromEnemy                             ;A3BBBA;
    JSR.W FireChargedBeamAtSamus                                         ;A3BBBE;
    JSL.L EnemyDeath                                                     ;A3BBC1;
    LDX.W EnemyIndex                                                     ;A3BBC5;
    LDA.W Enemy[1].properties,X                                          ;A3BBC8;
    ORA.W #$0200                                                         ;A3BBCB;
    STA.W Enemy[1].properties,X                                          ;A3BBCE;
    LDA.W Enemy[-1].properties,X                                         ;A3BBD1;
    ORA.W #$0200                                                         ;A3BBD4;
    STA.W Enemy[-1].properties,X                                         ;A3BBD7;
    RTL                                                                  ;A3BBDA;

+   LDX.W EnemyIndex                                                     ;A3BBDB;
    LDA.L Bang.newInstListIndex,X                                        ;A3BBDE;
    INC                                                                  ;A3BBE2;
    STA.L Bang.newInstListIndex,X                                        ;A3BBE3;
    JSR.W SetBangInstList                                                ;A3BBE7;
    RTL                                                                  ;A3BBEA;


;;; $BBEB: Fire charged beam at Samus ;;;
FireChargedBeamAtSamus:
;; Parameters:
;;     A: Direction of Samus from enemy
;; Returns:
;;     A: Death animation
    STA.W EnemyBottomBoundaryForEnemyVsProjectileCollisions              ;A3BBEB;
    LDX.W EnemyIndex                                                     ;A3BBEE;
    LDA.W SamusProjectile_ProjectileCounter                              ;A3BBF1;
    CMP.W #$0005                                                         ;A3BBF4;
    BPL .fail                                                            ;A3BBF7;
    LDA.W #$0000                                                         ;A3BBF9;
    TAY                                                                  ;A3BBFC;

  .loop:
    LDA.W SamusProjectile_Damages,Y                                      ;A3BBFD;
    BEQ .zeroDamage                                                      ;A3BC00;
    INY                                                                  ;A3BC02;
    INY                                                                  ;A3BC03;
    BRA .loop                                                            ;A3BC04;

  .zeroDamage:
    LDA.W Enemy.XPosition,X                                              ;A3BC06;
    STA.W SamusProjectile_XPositions,Y                                   ;A3BC09;
    LDA.W Enemy.YPosition,X                                              ;A3BC0C;
    STA.W SamusProjectile_YPositions,Y                                   ;A3BC0F;
    LDA.W EnemyBottomBoundaryForEnemyVsProjectileCollisions              ;A3BC12;
    STA.W SamusProjectile_Directions,Y                                   ;A3BC15;
    LDA.W EquippedBeams                                                  ;A3BC18;
    AND.W #$000F                                                         ;A3BC1B;
    ORA.W #$0010                                                         ;A3BC1E;
    STA.W SamusProjectile_Types,Y                                        ;A3BC21;
    INC.W SamusProjectile_ProjectileCounter                              ;A3BC24;
    STY.B DP_Temp14                                                      ;A3BC27;
    JSL.L ProjectileReflection                                           ;A3BC29;
    LDA.W Bang.damage,X                                                  ;A3BC2D;
    STA.W SamusProjectile_Damages,Y                                      ;A3BC30;
    LDA.W SamusProjectile_Types,Y                                        ;A3BC33;
    AND.W #$000F                                                         ;A3BC36;
    ASL                                                                  ;A3BC39;
    TAX                                                                  ;A3BC3A;
    LDA.W .beamTypes,X                                                   ;A3BC3B;
    JSL.L QueueSound_Lib1_Max6                                           ;A3BC3E;
    LDA.W #$0000                                                         ;A3BC42;
    RTS                                                                  ;A3BC45;

  .fail:
    LDA.W #$0001                                                         ;A3BC46;
    RTS                                                                  ;A3BC49;

  .beamTypes:                                                            ;A3BC4A;
    dw $0017  ; Charged power beam
    dw $0019  ; Charged wave beam
    dw $0018  ; Charged ice beam
    dw $001A  ; Charged ice + wave beam
              ; <-- Missing charged spazer beam
    dw $001E  ; Charged spazer + wave beam
    dw $001C  ; Charged spazer + ice beam
    dw $001D  ; Charged spazer + ice + wave beam
    dw $001F  ; Charged plasma beam
    dw $0022  ; Charged plasma + wave beam
    dw $0020  ; Charged plasma + ice beam
    dw $0021  ; Charged plasma + ice + wave beam
    dw $0000,$0000,$0000,$0000,$0000


;;; $BC6A: Bang acceleration interval time reset values ;;;
BangAccelerationIntervalTimeResetValues:
;        _________ Acceleration interval timer
;       |      ___ Deceleration interval timer
;       |     |
  .accel:
    dw $0003                                                             ;A3BC6A;
  .decel:
    dw       $0001                                                       ;A3BC6C;
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


;;; $BC9E: Execute bang movement function ;;;
ExecuteBangeMovementFunction:
    LDX.W EnemyIndex                                                     ;A3BC9E;
    JSR.W (Bang.movementFunction,X)                                      ;A3BCA1;
    RTS                                                                  ;A3BCA4;


;;; $BCA5: Bang movement function - movement delay ;;;
Function_Bang_Movement_MovementDelay:
    LDX.W EnemyIndex                                                     ;A3BCA5;
    LDA.L Bang.movementDelayTimer,X                                      ;A3BCA8;
    DEC                                                                  ;A3BCAC;
    STA.L Bang.movementDelayTimer,X                                      ;A3BCAD;
    BNE .return                                                          ;A3BCB1;
    LDA.W #$0010                                                         ;A3BCB3;
    STA.L Bang.movementDelayTimer,X                                      ;A3BCB6;
    LDA.W #Function_Bang_Movement_TargetSamus                            ;A3BCBA;
    STA.W Bang.movementFunction,X                                        ;A3BCBD;

  .return:
    RTS                                                                  ;A3BCC0;


;;; $BCC1: RTS. Bang movement function - no movement ;;;
Function_Bang_Movement_GetEnemyIndex:
    LDX.W EnemyIndex                                                     ;A3BCC1;
    RTS                                                                  ;A3BCC4;


;;; $BCC5: Bang movement function - target Samus ;;;
Function_Bang_Movement_TargetSamus:
    LDX.W EnemyIndex                                                     ;A3BCC5;
    JSL.L CalculateAngleOfSamusFromEnemy                                 ;A3BCC8;
    SEC                                                                  ;A3BCCC;
    SBC.W #$0040                                                         ;A3BCCD;
    AND.W #$00FF                                                         ;A3BCD0;
    STA.L Bang.angle,X                                                   ;A3BCD3;
    LDA.W #Function_Bang_Movement_Accelerating                           ;A3BCD7;
    STA.W Bang.movementFunction,X                                        ;A3BCDA;
    LDA.W #$0000                                                         ;A3BCDD;
    STA.L Bang.movingLeftFlag,X                                          ;A3BCE0;
    STA.L Bang.movingUpFlag,X                                            ;A3BCE4;
    STA.L Bang.acceleration,X                                            ;A3BCE8;
    STA.L Bang.speed,X                                                   ;A3BCEC;
    RTS                                                                  ;A3BCF0;


;;; $BCF1: Trigger bang deceleration if too far off target ;;;
TriggerBangDecelerationIfTooFarOffTarget:
    LDX.W EnemyIndex                                                     ;A3BCF1;
    JSL.L CalculateAngleOfSamusFromEnemy                                 ;A3BCF4;
    SEC                                                                  ;A3BCF8;
    SBC.W #$0040                                                         ;A3BCF9;
    AND.W #$00FF                                                         ;A3BCFC;
    STA.L Bang.angleToSamus,X                                            ;A3BCFF;
    SEC                                                                  ;A3BD03;
    SBC.L Bang.angle,X                                                   ;A3BD04;
    JSL.L Sign_Extend_A                                                  ;A3BD08;
    JSL.L NegateA_A0B067                                                 ;A3BD0C;
    CMP.W #$0030                                                         ;A3BD10;
    BMI .return                                                          ;A3BD13;
    LDA.W #Function_Bang_Movement_Decelerating                           ;A3BD15;
    STA.W Bang.movementFunction,X                                        ;A3BD18;

  .return:
    RTS                                                                  ;A3BD1B;


;;; $BD1C: Bang movement function - accelerating ;;;
Function_Bang_Movement_Accelerating:
    LDX.W EnemyIndex                                                     ;A3BD1C;
    JSR.W BangXMovement                                                  ;A3BD1F;
    JSR.W BangYMovement                                                  ;A3BD22;
    JSR.W AccelerateBang                                                 ;A3BD25;
    JSR.W TriggerBangDecelerationIfTooFarOffTarget                       ;A3BD28;
    RTS                                                                  ;A3BD2B;


;;; $BD2C: Bang movement function - decelerating ;;;
Function_Bang_Movement_Decelerating:
    LDX.W EnemyIndex                                                     ;A3BD2C;
    JSR.W BangXMovement                                                  ;A3BD2F;
    JSR.W BangYMovement                                                  ;A3BD32;
    JSR.W DecelerateBang                                                 ;A3BD35;
    LDA.L Bang.speed,X                                                   ;A3BD38;
    BNE .delay                                                           ;A3BD3C;
    BMI .delay                                                           ;A3BD3E;
    LDA.L Bang.acceleration,X                                            ;A3BD40;
    BEQ .delay                                                           ;A3BD44;
    BPL .return                                                          ;A3BD46;

  .delay:
    LDA.W #Function_Bang_Movement_MovementDelay                          ;A3BD48;
    STA.W Bang.movementFunction,X                                        ;A3BD4B;

  .return:
    RTS                                                                  ;A3BD4E;


;;; $BD4F: Accelerate bang ;;;
AccelerateBang:
    LDX.W EnemyIndex                                                     ;A3BD4F;
    LDA.L Bang.accelerationIntervalTimer,X                               ;A3BD52;
    DEC                                                                  ;A3BD56;
    STA.L Bang.accelerationIntervalTimer,X                               ;A3BD57;
    BPL .return                                                          ;A3BD5B;
    LDA.L Bang.accelerationIntervalTimerResetValue,X                     ;A3BD5D;
    STA.L Bang.accelerationIntervalTimer,X                               ;A3BD61;
    LDA.L Bang.speed,X                                                   ;A3BD65;
    CMP.L Bang.maxSpeed,X                                                ;A3BD69;
    BPL .return                                                          ;A3BD6D;
    LDA.L Bang.acceleration,X                                            ;A3BD6F;
    CLC                                                                  ;A3BD73;
    ADC.W #$0016                                                         ;A3BD74;
    STA.L Bang.acceleration,X                                            ;A3BD77;
    LDA.L Bang.speed,X                                                   ;A3BD7B;
    CLC                                                                  ;A3BD7F;
    ADC.L Bang.acceleration,X                                            ;A3BD80;
    STA.L Bang.speed,X                                                   ;A3BD84;

  .return:
    RTS                                                                  ;A3BD88;


;;; $BD89: Decelerate bang ;;;
DecelerateBang:
    LDX.W EnemyIndex                                                     ;A3BD89;
    LDA.L Bang.accelerationIntervalTimer,X                               ;A3BD8C;
    DEC                                                                  ;A3BD90;
    STA.L Bang.accelerationIntervalTimer,X                               ;A3BD91;
    BPL .return                                                          ;A3BD95;
    LDA.L Bang.decelerationIntervalTimerResetValue,X                     ;A3BD97;
    STA.L Bang.accelerationIntervalTimer,X                               ;A3BD9B;
    LDA.L Bang.acceleration,X                                            ;A3BD9F;
    SEC                                                                  ;A3BDA3;
    SBC.W #$0016                                                         ;A3BDA4;
    STA.L Bang.acceleration,X                                            ;A3BDA7;
    LDA.L Bang.speed,X                                                   ;A3BDAB;
    SEC                                                                  ;A3BDAF;
    SBC.L Bang.acceleration,X                                            ;A3BDB0;
    STA.L Bang.speed,X                                                   ;A3BDB4;

  .return:
    RTS                                                                  ;A3BDB8;


;;; $BDB9: Bang X movement ;;;
BangXMovement:
; Looks like enemy moving left flag was supposed to be cleared before the branch at $BDD3 >_<;
    LDX.W EnemyIndex                                                     ;A3BDB9;
    LDA.L Bang.angle,X                                                   ;A3BDBC;
    PHX                                                                  ;A3BDC0;
    CLC                                                                  ;A3BDC1;
    ADC.W #$0040                                                         ;A3BDC2;
    AND.W #$00FF                                                         ;A3BDC5;
    ASL                                                                  ;A3BDC8;
    TAX                                                                  ;A3BDC9;
    LDA.L SineCosineTables_16bitSine,X                                   ;A3BDCA;
    STA.B DP_Temp12                                                      ;A3BDCE;
    PLX                                                                  ;A3BDD0;
    LDA.B DP_Temp12                                                      ;A3BDD1;
    BPL +                                                                ;A3BDD3;
    LDA.W #$0001                                                         ;A3BDD5;
    STA.L Bang.movingLeftFlag,X                                          ;A3BDD8;

+   LDA.B DP_Temp12                                                      ;A3BDDC;
    JSL.L NegateA_A0B067                                                 ;A3BDDE;
    AND.W #$FF00                                                         ;A3BDE2;
    XBA                                                                  ;A3BDE5;
    STA.B DP_Temp16                                                      ;A3BDE6;
    LDA.L Bang.speed,X                                                   ;A3BDE8;
    STA.B DP_Temp18                                                      ;A3BDEC;
    JSR.W UnsignedMultiplication_24bit_A3BE7B                            ;A3BDEE;
    LDA.B DP_Temp1C                                                      ;A3BDF1;
    STA.B DP_Temp16                                                      ;A3BDF3;
    LDA.B DP_Temp1E                                                      ;A3BDF5;
    STA.B DP_Temp18                                                      ;A3BDF7;
    LDA.L Bang.movingLeftFlag,X                                          ;A3BDF9;
    BEQ +                                                                ;A3BDFD;
    JSR.W StrugglingWithMultiWordNegation                                ;A3BDFF;
    LDA.B DP_Temp1C                                                      ;A3BE02;
    STA.B DP_Temp16                                                      ;A3BE04;
    LDA.B DP_Temp1E                                                      ;A3BE06;
    STA.B DP_Temp18                                                      ;A3BE08;

+   CLC                                                                  ;A3BE0A;
    LDA.W Enemy.XSubPosition,X                                           ;A3BE0B;
    ADC.B DP_Temp16                                                      ;A3BE0E;
    STA.W Enemy.XSubPosition,X                                           ;A3BE10;
    LDA.W Enemy.XPosition,X                                              ;A3BE13;
    ADC.B DP_Temp18                                                      ;A3BE16;
    STA.W Enemy.XPosition,X                                              ;A3BE18;
    RTS                                                                  ;A3BE1B;


;;; $BE1C: Bang Y movement ;;;
BangYMovement:
; Looks like enemy moving up flag was supposed to be cleared before the branch at $BE32 >_<;
    LDX.W EnemyIndex                                                     ;A3BE1C;
    LDA.L Bang.angle,X                                                   ;A3BE1F;
    PHX                                                                  ;A3BE23;
    AND.W #$00FF                                                         ;A3BE24;
    ASL                                                                  ;A3BE27;
    TAX                                                                  ;A3BE28;
    LDA.L SineCosineTables_16bitSine,X                                   ;A3BE29;
    STA.B DP_Temp12                                                      ;A3BE2D;
    PLX                                                                  ;A3BE2F;
    LDA.B DP_Temp12                                                      ;A3BE30;
    BPL +                                                                ;A3BE32;
    LDA.W #$0001                                                         ;A3BE34;
    STA.L Bang.movingUpFlag,X                                            ;A3BE37;

+   LDA.B DP_Temp12                                                      ;A3BE3B;
    JSL.L NegateA_A0B067                                                 ;A3BE3D;
    AND.W #$FF00                                                         ;A3BE41;
    XBA                                                                  ;A3BE44;
    STA.B DP_Temp16                                                      ;A3BE45;
    LDA.L Bang.speed,X                                                   ;A3BE47;
    STA.B DP_Temp18                                                      ;A3BE4B;
    JSR.W UnsignedMultiplication_24bit_A3BE7B                            ;A3BE4D;
    LDA.B DP_Temp1C                                                      ;A3BE50;
    STA.B DP_Temp16                                                      ;A3BE52;
    LDA.B DP_Temp1E                                                      ;A3BE54;
    STA.B DP_Temp18                                                      ;A3BE56;
    LDA.L Bang.movingUpFlag,X                                            ;A3BE58;
    BEQ +                                                                ;A3BE5C;
    JSR.W StrugglingWithMultiWordNegation                                ;A3BE5E;
    LDA.B DP_Temp1C                                                      ;A3BE61;
    STA.B DP_Temp16                                                      ;A3BE63;
    LDA.B DP_Temp1E                                                      ;A3BE65;
    STA.B DP_Temp18                                                      ;A3BE67;

+   CLC                                                                  ;A3BE69;
    LDA.W Enemy.YSubPosition,X                                           ;A3BE6A;
    ADC.B DP_Temp16                                                      ;A3BE6D;
    STA.W Enemy.YSubPosition,X                                           ;A3BE6F;
    LDA.W Enemy.YPosition,X                                              ;A3BE72;
    ADC.B DP_Temp18                                                      ;A3BE75;
    STA.W Enemy.YPosition,X                                              ;A3BE77;
    RTS                                                                  ;A3BE7A;


;;; $BE7B: $1E.$1C = [$16] * [$18] / 10000h (24-bit unsigned multiplication) ;;;
UnsignedMultiplication_24bit_A3BE7B:
    PHP                                                                  ;A3BE7B;
    SEP #$20                                                             ;A3BE7C;
    LDA.B DP_Temp16                                                      ;A3BE7E;
    STA.W $4202                                                          ;A3BE80;
    LDA.B DP_Temp18                                                      ;A3BE83;
    STA.W $4203                                                          ;A3BE85;
    NOP                                                                  ;A3BE88;
    NOP                                                                  ;A3BE89;
    NOP                                                                  ;A3BE8A;
    REP #$20                                                             ;A3BE8B;
    LDA.W $4216                                                          ;A3BE8D;
    STA.B DP_Temp1C                                                      ;A3BE90;
    SEP #$20                                                             ;A3BE92;
    LDA.B DP_Temp16                                                      ;A3BE94;
    STA.W $4202                                                          ;A3BE96;
    LDA.B DP_Temp19                                                      ;A3BE99;
    STA.W $4203                                                          ;A3BE9B;
    NOP                                                                  ;A3BE9E;
    NOP                                                                  ;A3BE9F;
    NOP                                                                  ;A3BEA0;
    REP #$20                                                             ;A3BEA1;
    LDA.W $4216                                                          ;A3BEA3;
    AND.W #$FF00                                                         ;A3BEA6;
    XBA                                                                  ;A3BEA9;
    STA.B DP_Temp1E                                                      ;A3BEAA;
    LDA.W $4216                                                          ;A3BEAC;
    AND.W #$00FF                                                         ;A3BEAF;
    XBA                                                                  ;A3BEB2;
    CLC                                                                  ;A3BEB3;
    ADC.B DP_Temp1C                                                      ;A3BEB4;
    STA.B DP_Temp1C                                                      ;A3BEB6;
    BCC .return                                                          ;A3BEB8;
    INC.B DP_Temp1E                                                      ;A3BEBA;

  .return:
    PLP                                                                  ;A3BEBC;
    RTS                                                                  ;A3BEBD;


;;; $BEBE: $1E.$1C = -[$18].[$16] ;;;
StrugglingWithMultiWordNegation:
; The devs *really* struggled with multi-word negation >_<;

; Actual result is as follows:
;     If [$18].[$16] = 0.0:
;        Return
;     
;     If [$16] != 0:
;         $1E.$1C = -[$18].[$16]
;     Else ([$16] = 0):
;         $1E.$1C = -1 - [$18].[$16]
    LDA.B DP_Temp16                                                      ;A3BEBE;
    BNE +                                                                ;A3BEC0;
    LDA.B DP_Temp18                                                      ;A3BEC2;
    BNE +                                                                ;A3BEC4;
    BRA .return                                                          ;A3BEC6;

+   LDA.B DP_Temp16                                                      ;A3BEC8;
    LDA.W #$0000                                                         ;A3BECA;
    SEC                                                                  ;A3BECD;
    SBC.B DP_Temp16                                                      ;A3BECE;
    STA.B DP_Temp1C                                                      ;A3BED0;
    LDA.B DP_Temp18                                                      ;A3BED2;
    EOR.W #$FFFF                                                         ;A3BED4;
    STA.B DP_Temp1E                                                      ;A3BED7;

  .return:
    RTS                                                                  ;A3BED9;


;;; $BEDA: Set bang instruction list ;;;
SetBangInstList:
    LDX.W EnemyIndex                                                     ;A3BEDA;
    LDA.L Bang.newInstListIndex,X                                        ;A3BEDD;
    CMP.L Bang.instListIndex,X                                           ;A3BEE1;
    BEQ .return                                                          ;A3BEE5;
    STA.L Bang.instListIndex,X                                           ;A3BEE7;
    ASL                                                                  ;A3BEEB;
    TAY                                                                  ;A3BEEC;
    LDA.W InstListPointers_Bang,Y                                        ;A3BEED;
    STA.W Enemy.instList,X                                               ;A3BEF0;
    LDA.W #$0001                                                         ;A3BEF3;
    STA.W Enemy.instTimer,X                                              ;A3BEF6;
    STZ.W Enemy.loopCounter,X                                            ;A3BEF9;

  .return:
    RTS                                                                  ;A3BEFC;


;;; $BEFD: Enemy shot - enemy $DB3F (bang) ;;;
EnemyShot_Bang:
    LDX.W EnemyIndex                                                     ;A3BEFD;
    LDA.W Bang.movementFunction,X                                        ;A3BF00;
    CMP.W #Function_Bang_Movement_GetEnemyIndex                          ;A3BF03;
    BEQ .RTSFunction                                                     ;A3BF06;
    LDA.W CollisionIndex                                                 ;A3BF08;
    ASL                                                                  ;A3BF0B;
    TAY                                                                  ;A3BF0C;
    LDA.W SamusProjectile_Directions,Y                                   ;A3BF0D;
    AND.W #$000F                                                         ;A3BF10;
    ASL                                                                  ;A3BF13;
    TAY                                                                  ;A3BF14;
    LDA.W BangAngles,Y                                                   ;A3BF15;
    STA.L Bang.angle,X                                                   ;A3BF18;
    LDA.W #Function_Bang_Movement_Decelerating                           ;A3BF1C;
    STA.W Bang.movementFunction,X                                        ;A3BF1F;
    LDA.W #$0000                                                         ;A3BF22;
    STA.L Bang.movingLeftFlag,X                                          ;A3BF25;
    STA.L Bang.movingUpFlag,X                                            ;A3BF29;
    LDA.W #$0100                                                         ;A3BF2D;
    STA.L Bang.acceleration,X                                            ;A3BF30;
    LDA.W #$0600                                                         ;A3BF34;
    STA.L Bang.speed,X                                                   ;A3BF37;

  .RTSFunction:
    LDA.L Bang.newInstListIndex,X                                        ;A3BF3B;
    CMP.W #$0009                                                         ;A3BF3F;
    BNE .notIndex9                                                       ;A3BF42;
    RTL                                                                  ;A3BF44;

  .notIndex9:
    LDA.L Bang.newInstListIndex,X                                        ;A3BF45;
    INC                                                                  ;A3BF49;
    STA.L Bang.newInstListIndex,X                                        ;A3BF4A;
    JSR.W SetBangInstList                                                ;A3BF4E;
    LDA.W CollisionIndex                                                 ;A3BF51;
    ASL                                                                  ;A3BF54;
    TAY                                                                  ;A3BF55;
    LDA.W SamusProjectile_Damages,Y                                      ;A3BF56;
    CLC                                                                  ;A3BF59;
    ADC.W Bang.damage,X                                                  ;A3BF5A;
    STA.W Bang.damage,X                                                  ;A3BF5D;
    LDA.W SamusProjectile_Directions,Y                                   ;A3BF60;
    ORA.W #$0010                                                         ;A3BF63;
    STA.W SamusProjectile_Directions,Y                                   ;A3BF66;
    LDX.W EnemyIndex                                                     ;A3BF69;
    LDA.L Bang.newInstListIndex,X                                        ;A3BF6C;
    CMP.W #$0009                                                         ;A3BF70;
    BEQ +                                                                ;A3BF73;
    RTL                                                                  ;A3BF75;

+   LDA.W #$0001                                                         ;A3BF76;
    STA.W Enemy.var3,X                                                   ;A3BF79;
    RTL                                                                  ;A3BF7C;


;;; $BF7D: Bang spritemaps ;;;
Spritemap_Bang_Growth0_Idling_0:
    dw $0001                                                             ;A3BF7D;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $113)

Spritemap_Bang_Growth0_Idling_1:
    dw $0001                                                             ;A3BF84;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $110)

Spritemap_Bang_Growth0_Idling_2:
    dw $0001                                                             ;A3BF8B;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $114)

Spritemap_Bang_Growth0_Idling_3:
    dw $0001                                                             ;A3BF92;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $111)

Spritemap_Bang_Growth0_Idling_4:
    dw $0001                                                             ;A3BF99;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $115)

Spritemap_Bang_Growth0_Idling_5:
    dw $0001                                                             ;A3BFA0;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $112)

Spritemap_Bang_Growth0_Growing_0:
    dw $0001                                                             ;A3BFA7;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $170)

Spritemap_Bang_Growth0_Growing_1:
    dw $0001                                                             ;A3BFAE;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $160)

Spritemap_Bang_Growth0_Growing_2:
    dw $0001                                                             ;A3BFB5;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $116)

Spritemap_Bang_Growth0_Growing_3:
    dw $0004                                                             ;A3BFBC;
    %spritemapEntry(0, $1F9, $FF, 1, 1, 3, 0, $101)
    %spritemapEntry(0, $1FF, $FF, 1, 0, 3, 0, $101)
    %spritemapEntry(0, $1FF, $F9, 0, 0, 3, 0, $101)
    %spritemapEntry(0, $1F9, $F9, 0, 0, 3, 0, $100)

Spritemap_Bang_Growth0_Growing_4:
    dw $0001                                                             ;A3BFD2;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $116)

Spritemap_Bang_Growth0_Growing_5:
    dw $0004                                                             ;A3BFD9;
    %spritemapEntry(0, $1F8, $FF, 1, 1, 3, 0, $101)
    %spritemapEntry(0, $00, $FF, 1, 0, 3, 0, $101)
    %spritemapEntry(0, $00, $F9, 0, 0, 3, 0, $101)
    %spritemapEntry(0, $1F8, $F9, 0, 0, 3, 0, $100)

Spritemap_Bang_Growth0_Growing_6:
    dw $0001                                                             ;A3BFEF;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $116)

Spritemap_Bang_Growth0_Growing_7:
    dw $0004                                                             ;A3BFF6;
    %spritemapEntry(0, $1F8, $00, 1, 1, 3, 0, $101)
    %spritemapEntry(0, $00, $00, 1, 0, 3, 0, $101)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 0, $101)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $100)

Spritemap_Bang_Growth1_Idling_0:
    dw $0001                                                             ;A3C00C;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $116)

Spritemap_Bang_Growth1_Idling_1:
    dw $0004                                                             ;A3C013;
    %spritemapEntry(0, $1F8, $00, 1, 1, 3, 0, $101)
    %spritemapEntry(0, $00, $00, 1, 0, 3, 0, $101)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 0, $101)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $100)

Spritemap_Bang_Growth1_Idling_2:
    dw $0001                                                             ;A3C029;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $117)

Spritemap_Bang_Growth1_Idling_3:
    dw $0004                                                             ;A3C030;
    %spritemapEntry(0, $1F8, $00, 1, 1, 3, 0, $103)
    %spritemapEntry(0, $00, $00, 1, 0, 3, 0, $103)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 0, $103)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $102)

Spritemap_Bang_Growth1_Idling_4:
    dw $0001                                                             ;A3C046;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $118)

Spritemap_Bang_Growth1_Idling_5:
    dw $0004                                                             ;A3C04D;
    %spritemapEntry(0, $1F8, $00, 1, 1, 3, 0, $105)
    %spritemapEntry(0, $00, $00, 1, 0, 3, 0, $105)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 0, $105)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $104)

Spritemap_Bang_Growth1_Growing_0:
    dw $0004                                                             ;A3C063;
    %spritemapEntry(0, $00, $00, 1, 1, 3, 0, $172)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 0, $172)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 0, $172)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $172)

Spritemap_Bang_Growth1_Growing_1:
    dw $0004                                                             ;A3C079;
    %spritemapEntry(0, $00, $00, 1, 1, 3, 0, $171)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 0, $171)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 0, $171)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $171)

Spritemap_Bang_Growth1_Growing_2:
    dw $0001                                                             ;A3C08F;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $119)

Spritemap_Bang_Growth1_Growing_3:
    dw $0004                                                             ;A3C096;
    %spritemapEntry(0, $1F9, $FF, 1, 1, 3, 0, $107)
    %spritemapEntry(0, $1FF, $FF, 1, 0, 3, 0, $107)
    %spritemapEntry(0, $1FF, $F9, 0, 0, 3, 0, $107)
    %spritemapEntry(0, $1F9, $F9, 0, 0, 3, 0, $106)

Spritemap_Bang_Growth1_Growing_4:
    dw $0001                                                             ;A3C0AC;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $119)

Spritemap_Bang_Growth1_Growing_5:
    dw $0004                                                             ;A3C0B3;
    %spritemapEntry(0, $1F9, $00, 1, 1, 3, 0, $107)
    %spritemapEntry(0, $1FF, $00, 1, 0, 3, 0, $107)
    %spritemapEntry(0, $1FF, $F8, 0, 0, 3, 0, $107)
    %spritemapEntry(0, $1F9, $F8, 0, 0, 3, 0, $106)

Spritemap_Bang_Growth1_Growing_6:
    dw $0001                                                             ;A3C0C9;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $119)

Spritemap_Bang_Growth1_Growing_7:
    dw $0004                                                             ;A3C0D0;
    %spritemapEntry(0, $1F8, $00, 1, 1, 3, 0, $107)
    %spritemapEntry(0, $00, $00, 1, 0, 3, 0, $107)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 0, $107)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $106)

Spritemap_Bang_Growth2_Idling_0:
    dw $0001                                                             ;A3C0E6;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $119)

Spritemap_Bang_Growth2_Idling_1:
    dw $0004                                                             ;A3C0ED;
    %spritemapEntry(0, $1F8, $00, 1, 1, 3, 0, $107)
    %spritemapEntry(0, $00, $00, 1, 0, 3, 0, $107)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 0, $107)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $106)

Spritemap_Bang_Growth2_Idling_2:
    dw $0001                                                             ;A3C103;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $11A)

Spritemap_Bang_Growth2_Idling_3:
    dw $0004                                                             ;A3C10A;
    %spritemapEntry(0, $1F8, $00, 1, 1, 3, 0, $109)
    %spritemapEntry(0, $00, $00, 1, 0, 3, 0, $109)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 0, $109)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $108)

Spritemap_Bang_Growth2_Idling_4:
    dw $0001                                                             ;A3C120;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $11B)

Spritemap_Bang_Growth2_Idling_5:
    dw $0004                                                             ;A3C127;
    %spritemapEntry(0, $1F8, $00, 1, 1, 3, 0, $10B)
    %spritemapEntry(0, $00, $00, 1, 0, 3, 0, $10B)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 0, $10B)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $10A)

Spritemap_Bang_Growth2_Growing_0:
    dw $0001                                                             ;A3C13D;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $119)

Spritemap_Bang_Growth2_Growing_1:
    dw $0004                                                             ;A3C144;
    %spritemapEntry(0, $00, $00, 1, 1, 3, 0, $177)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 0, $177)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 0, $177)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $177)

Spritemap_Bang_Growth2_Growing_2:
    dw $0001                                                             ;A3C15A;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $119)

Spritemap_Bang_Growth2_Growing_3:
    dw $0004                                                             ;A3C161;
    %spritemapEntry(0, $00, $00, 1, 1, 3, 0, $167)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 0, $167)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 0, $167)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $167)

Spritemap_Bang_Growth2_Growing_4:
    dw $0001                                                             ;A3C177;
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $10C)

Spritemap_Bang_Growth2_Growing_5:
    dw $0004                                                             ;A3C17E;
    %spritemapEntry(1, $43F2, $FE, 1, 1, 3, 0, $122)
    %spritemapEntry(1, $43FE, $FE, 1, 0, 3, 0, $122)
    %spritemapEntry(1, $43FE, $F2, 0, 0, 3, 0, $122)
    %spritemapEntry(1, $43F2, $F2, 0, 0, 3, 0, $120)

Spritemap_Bang_Growth2_Growing_6:
    dw $0001                                                             ;A3C194;
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $10C)

Spritemap_Bang_Growth2_Growing_7:
    dw $0004                                                             ;A3C19B;
    %spritemapEntry(1, $43FF, $F1, 0, 0, 3, 0, $122)
    %spritemapEntry(1, $43F1, $F1, 0, 0, 3, 0, $120)
    %spritemapEntry(1, $43F1, $FF, 1, 1, 3, 0, $122)
    %spritemapEntry(1, $43FF, $FF, 1, 0, 3, 0, $122)

Spritemap_Bang_Growth2_Growing_8:
    dw $0001                                                             ;A3C1B1;
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $10C)

Spritemap_Bang_Growth2_Growing_9:
    dw $0004                                                             ;A3C1B8;
    %spritemapEntry(1, $43F0, $00, 1, 1, 3, 0, $122)
    %spritemapEntry(1, $4200, $00, 1, 0, 3, 0, $122)
    %spritemapEntry(1, $4200, $F0, 0, 0, 3, 0, $122)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 0, $120)

Spritemap_Bang_Growth3_Idling_0:
    dw $0001                                                             ;A3C1CE;
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $10C)

Spritemap_Bang_Growth3_Idling_1:
    dw $0004                                                             ;A3C1D5;
    %spritemapEntry(1, $4200, $F0, 0, 0, 3, 0, $122)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 0, $120)
    %spritemapEntry(1, $43F0, $00, 1, 1, 3, 0, $122)
    %spritemapEntry(1, $4200, $00, 1, 0, 3, 0, $122)

Spritemap_Bang_Growth3_Idling_2:
    dw $0001                                                             ;A3C1EB;
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $12C)

Spritemap_Bang_Growth3_Idling_3:
    dw $0004                                                             ;A3C1F2;
    %spritemapEntry(1, $43F0, $00, 1, 1, 3, 0, $126)
    %spritemapEntry(1, $4200, $00, 1, 0, 3, 0, $126)
    %spritemapEntry(1, $4200, $F0, 0, 0, 3, 0, $126)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 0, $124)

Spritemap_Bang_Growth3_Idling_4:
    dw $0001                                                             ;A3C208;
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $14C)

Spritemap_Bang_Growth3_Idling_5:
    dw $0004                                                             ;A3C20F;
    %spritemapEntry(1, $4200, $F0, 0, 0, 3, 0, $12A)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 0, $128)
    %spritemapEntry(1, $43F0, $00, 1, 1, 3, 0, $12A)
    %spritemapEntry(1, $4200, $00, 1, 0, 3, 0, $12A)

Spritemap_Bang_Growth3_Idling_6:
    dw $0001                                                             ;A3C225;
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $10C)

Spritemap_Bang_Growth3_Idling_7:
    dw $0004                                                             ;A3C22C;
    %spritemapEntry(1, $4200, $FF, 1, 0, 3, 0, $122)
    %spritemapEntry(1, $43F0, $FF, 1, 1, 3, 0, $122)
    %spritemapEntry(1, $4200, $F1, 0, 0, 3, 0, $122)
    %spritemapEntry(1, $43F0, $F1, 0, 0, 3, 0, $120)

Spritemap_Bang_Growth3_Idling_8:
    dw $0001                                                             ;A3C242;
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $12C)

Spritemap_Bang_Growth3_Idling_9:
    dw $0004                                                             ;A3C249;
    %spritemapEntry(1, $4200, $FF, 1, 0, 3, 0, $126)
    %spritemapEntry(1, $43F0, $FF, 1, 1, 3, 0, $126)
    %spritemapEntry(1, $4200, $F1, 0, 0, 3, 0, $126)
    %spritemapEntry(1, $43F0, $F1, 0, 0, 3, 0, $124)

Spritemap_Bang_Growth3_Idling_A:
    dw $0001                                                             ;A3C25F;
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $14C)

Spritemap_Bang_Growth3_Idling_B:
    dw $0004                                                             ;A3C266;
    %spritemapEntry(1, $4200, $FF, 1, 0, 3, 0, $12A)
    %spritemapEntry(1, $43F0, $FF, 1, 1, 3, 0, $12A)
    %spritemapEntry(1, $4200, $F1, 0, 0, 3, 0, $12A)
    %spritemapEntry(1, $43F0, $F1, 0, 0, 3, 0, $128)

Spritemap_Bang_Growth3_Idling_C:
    dw $0001                                                             ;A3C27C;
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $10C)

Spritemap_Bang_Growth3_Idling_D:
    dw $0004                                                             ;A3C283;
    %spritemapEntry(1, $43FF, $00, 1, 0, 3, 0, $122)
    %spritemapEntry(1, $43F1, $00, 1, 1, 3, 0, $122)
    %spritemapEntry(1, $43FF, $F0, 0, 0, 3, 0, $122)
    %spritemapEntry(1, $43F1, $F0, 0, 0, 3, 0, $120)

Spritemap_Bang_Growth3_Idling_E:
    dw $0001                                                             ;A3C299;
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $12C)

Spritemap_Bang_Growth3_Idling_F:
    dw $0004                                                             ;A3C2A0;
    %spritemapEntry(1, $43FF, $00, 1, 0, 3, 0, $126)
    %spritemapEntry(1, $43F1, $00, 1, 1, 3, 0, $126)
    %spritemapEntry(1, $43FF, $F0, 0, 0, 3, 0, $126)
    %spritemapEntry(1, $43F1, $F0, 0, 0, 3, 0, $124)

Spritemap_Bang_Growth3_Idling_10:
    dw $0001                                                             ;A3C2B6;
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $14C)

Spritemap_Bang_Growth3_Idling_11:
    dw $0004                                                             ;A3C2BD;
    %spritemapEntry(1, $43FF, $00, 1, 0, 3, 0, $12A)
    %spritemapEntry(1, $43F1, $00, 1, 1, 3, 0, $12A)
    %spritemapEntry(1, $43FF, $F0, 0, 0, 3, 0, $12A)
    %spritemapEntry(1, $43F1, $F0, 0, 0, 3, 0, $128)

Spritemap_Bang_Growth3_Growing_0:
    dw $0001                                                             ;A3C2D3;
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $16A)

Spritemap_Bang_Growth3_Growing_1:
    dw $0004                                                             ;A3C2DA;
    %spritemapEntry(1, $43F0, $00, 1, 1, 3, 0, $122)
    %spritemapEntry(1, $4200, $00, 1, 0, 3, 0, $122)
    %spritemapEntry(1, $4200, $F0, 0, 0, 3, 0, $122)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 0, $120)

Spritemap_Bang_Growth3_Growing_2:
    dw $0001                                                             ;A3C2F0;
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $168)

Spritemap_Bang_Growth3_Growing_3:
    dw $0004                                                             ;A3C2F7;
    %spritemapEntry(1, $43F0, $00, 1, 1, 3, 0, $122)
    %spritemapEntry(1, $4200, $00, 1, 0, 3, 0, $122)
    %spritemapEntry(1, $4200, $F0, 0, 0, 3, 0, $122)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 0, $120)

Spritemap_Bang_Growth3_Growing_4:
    dw $0001                                                             ;A3C30D;
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $16C)

Spritemap_Bang_Growth3_Growing_5:
    dw $0004                                                             ;A3C314;
    %spritemapEntry(1, $43F2, $FE, 1, 1, 3, 0, $142)
    %spritemapEntry(1, $43FE, $FE, 1, 0, 3, 0, $142)
    %spritemapEntry(1, $43FE, $F2, 0, 0, 3, 0, $142)
    %spritemapEntry(1, $43F2, $F2, 0, 0, 3, 0, $140)

Spritemap_Bang_Growth3_Growing_6:
    dw $0001                                                             ;A3C32A;
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $16E)

Spritemap_Bang_Growth3_Growing_7:
    dw $0004                                                             ;A3C331;
    %spritemapEntry(1, $43F1, $FF, 1, 1, 3, 0, $142)
    %spritemapEntry(1, $43FF, $FF, 1, 0, 3, 0, $142)
    %spritemapEntry(1, $43FF, $F1, 0, 0, 3, 0, $142)
    %spritemapEntry(1, $43F1, $F1, 0, 0, 3, 0, $140)

Spritemap_Bang_Growth3_Growing_8:
    dw $0001                                                             ;A3C347;
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $16C)

Spritemap_Bang_Growth3_Growing_9:
    dw $0004                                                             ;A3C34E;
    %spritemapEntry(1, $4200, $00, 1, 0, 3, 0, $142)
    %spritemapEntry(1, $43F0, $00, 1, 1, 3, 0, $142)
    %spritemapEntry(1, $4200, $F0, 0, 0, 3, 0, $142)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 0, $140)

Spritemap_Bang_Growth3_Growing_A:
    dw $0001                                                             ;A3C364;
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $10E)

Spritemap_Bang_Growth3_Growing_B:
    dw $0004                                                             ;A3C36B;
    %spritemapEntry(1, $4200, $00, 1, 0, 3, 0, $142)
    %spritemapEntry(1, $43F0, $00, 1, 1, 3, 0, $142)
    %spritemapEntry(1, $4200, $F0, 0, 0, 3, 0, $142)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 0, $140)

Spritemap_Bang_Electricity_Growth3_4_Growing_0:
    dw $0002                                                             ;A3C381;
    %spritemapEntry(0, $04, $FC, 0, 0, 3, 0, $164)
    %spritemapEntry(0, $1F6, $F6, 0, 0, 3, 0, $161)

Spritemap_Bang_Electricity_Growth3_4_Growing_1:
    dw $0002                                                             ;A3C38D;
    %spritemapEntry(0, $04, $FC, 0, 0, 3, 0, $165)
    %spritemapEntry(0, $1F6, $F6, 0, 0, 3, 0, $162)

Spritemap_Bang_Electricity_Growth3_4_Growing_2:
    dw $0002                                                             ;A3C399;
    %spritemapEntry(0, $04, $FC, 0, 0, 3, 0, $166)
    %spritemapEntry(0, $1F6, $F6, 0, 0, 3, 0, $163)

Spritemap_Bang_Electricity_Growth3_4_Growing_3:
    dw $0002                                                             ;A3C3A5;
    %spritemapEntry(0, $02, $F6, 0, 1, 3, 0, $161)
    %spritemapEntry(0, $1F4, $FD, 0, 0, 3, 0, $164)

Spritemap_Bang_Electricity_Growth3_4_Growing_4:
    dw $0002                                                             ;A3C3B1;
    %spritemapEntry(0, $02, $F6, 0, 1, 3, 0, $162)
    %spritemapEntry(0, $1F4, $FD, 0, 0, 3, 0, $165)

Spritemap_Bang_Electricity_Growth3_4_Growing_5:
    dw $0002                                                             ;A3C3BD;
    %spritemapEntry(0, $1F4, $FD, 0, 0, 3, 0, $166)
    %spritemapEntry(0, $02, $F6, 0, 1, 3, 0, $163)

Spritemap_Bang_Electricity_Growth3_4_Growing_6:
    dw $0002                                                             ;A3C3C9;
    %spritemapEntry(0, $1FA, $03, 0, 0, 3, 0, $176)
    %spritemapEntry(0, $1FC, $F5, 0, 0, 3, 0, $174)

Spritemap_Bang_Electricity_Growth3_4_Growing_7:
    dw $0002                                                             ;A3C3D5;
    %spritemapEntry(0, $1FA, $03, 0, 0, 3, 0, $175)
    %spritemapEntry(0, $1FC, $F5, 0, 0, 3, 0, $175)

Spritemap_Bang_Electricity_Growth3_4_Growing_8:
    dw $0002                                                             ;A3C3E1;
    %spritemapEntry(0, $1FB, $03, 0, 0, 3, 0, $174)
    %spritemapEntry(0, $1FC, $F5, 0, 0, 3, 0, $176)

Spritemap_Bang_Electricity_Growth3_4_Growing_9:
    dw $0002                                                             ;A3C3ED;
    %spritemapEntry(0, $02, $02, 0, 0, 3, 0, $163)
    %spritemapEntry(0, $1F6, $02, 0, 1, 3, 0, $161)

Spritemap_Bang_Electricity_Growth3_4_Growing_A:
    dw $0002                                                             ;A3C3F9;
    %spritemapEntry(0, $02, $02, 0, 0, 3, 0, $162)
    %spritemapEntry(0, $1F6, $02, 0, 1, 3, 0, $162)

Spritemap_Bang_Electricity_Growth3_4_Growing_B:
    dw $0002                                                             ;A3C405;
    %spritemapEntry(0, $02, $02, 0, 0, 3, 0, $161)
    %spritemapEntry(0, $1F6, $02, 0, 1, 3, 0, $163)

Spritemap_Bang_Growth4_Idling_0:
    dw $0001                                                             ;A3C411;
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $10E)

Spritemap_Bang_Growth4_Idling_1:
    dw $0004                                                             ;A3C418;
    %spritemapEntry(1, $4200, $00, 1, 0, 3, 0, $142)
    %spritemapEntry(1, $43F0, $00, 1, 1, 3, 0, $142)
    %spritemapEntry(1, $4200, $F0, 0, 0, 3, 0, $142)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 0, $140)

Spritemap_Bang_Growth4_Idling_2:
    dw $0001                                                             ;A3C42E;
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $12E)

Spritemap_Bang_Growth4_Idling_3:
    dw $0004                                                             ;A3C435;
    %spritemapEntry(1, $4200, $00, 1, 0, 3, 0, $146)
    %spritemapEntry(1, $43F0, $00, 1, 1, 3, 0, $146)
    %spritemapEntry(1, $4200, $F0, 0, 0, 3, 0, $146)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 0, $144)

Spritemap_Bang_Growth4_Idling_4:
    dw $0001                                                             ;A3C44B;
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $14E)

Spritemap_Bang_Growth4_Idling_5:
    dw $0004                                                             ;A3C452;
    %spritemapEntry(1, $4200, $00, 1, 0, 3, 0, $14A)
    %spritemapEntry(1, $43F0, $00, 1, 1, 3, 0, $14A)
    %spritemapEntry(1, $4200, $F0, 0, 0, 3, 0, $14A)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 0, $148)

Spritemap_Bang_Growth4_Idling_6:
    dw $0001                                                             ;A3C468;
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $10E)

Spritemap_Bang_Growth4_Idling_7:
    dw $0004                                                             ;A3C46F;
    %spritemapEntry(1, $43F0, $FF, 1, 1, 3, 0, $142)
    %spritemapEntry(1, $4200, $FF, 1, 0, 3, 0, $142)
    %spritemapEntry(1, $4200, $F1, 0, 0, 3, 0, $142)
    %spritemapEntry(1, $43F0, $F1, 0, 0, 3, 0, $140)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Bang_Growth4_Idling_A3C485:
    dw $0001                                                             ;A3C485;
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $12E)

UNUSED_Spritemap_Bang_Growth4_Idling_A3C48C:
    dw $0004                                                             ;A3C48C;
    %spritemapEntry(1, $43F0, $FF, 1, 1, 3, 0, $146)
    %spritemapEntry(1, $4200, $FF, 1, 0, 3, 0, $146)
    %spritemapEntry(1, $4200, $F1, 0, 0, 3, 0, $146)
    %spritemapEntry(1, $43F0, $F1, 0, 0, 3, 0, $144)

UNUSED_Spritemap_Bang_Growth4_Idling_A3C4A2:
    dw $0001                                                             ;A3C4A2;
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $14E)

UNUSED_Spritemap_Bang_Growth4_Idling_A3C4A9:
    dw $0004                                                             ;A3C4A9;
    %spritemapEntry(1, $43F0, $FF, 1, 1, 3, 0, $14A)
    %spritemapEntry(1, $4200, $FF, 1, 0, 3, 0, $14A)
    %spritemapEntry(1, $4200, $F1, 0, 0, 3, 0, $14A)
    %spritemapEntry(1, $43F0, $F1, 0, 0, 3, 0, $148)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Bang_Growth4_Idling_8:
    dw $0001                                                             ;A3C4BF;
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $10E)

Spritemap_Bang_Growth4_Idling_9:
    dw $0004                                                             ;A3C4C6;
    %spritemapEntry(1, $43FF, $00, 1, 0, 3, 0, $142)
    %spritemapEntry(1, $43F1, $00, 1, 1, 3, 0, $142)
    %spritemapEntry(1, $43FF, $F0, 0, 0, 3, 0, $142)
    %spritemapEntry(1, $43F1, $F0, 0, 0, 3, 0, $140)

Spritemap_Bang_Growth4_Idling_A:
    dw $0001                                                             ;A3C4DC;
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $12E)

Spritemap_Bang_Growth4_Idling_B:
    dw $0004                                                             ;A3C4E3;
    %spritemapEntry(1, $43FF, $00, 1, 0, 3, 0, $146)
    %spritemapEntry(1, $43F1, $00, 1, 1, 3, 0, $146)
    %spritemapEntry(1, $43FF, $F0, 0, 0, 3, 0, $146)
    %spritemapEntry(1, $43F1, $F0, 0, 0, 3, 0, $144)

Spritemap_Bang_Growth4_Idling_C:
    dw $0001                                                             ;A3C4F9;
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $14E)

Spritemap_Bang_Growth4_Idling_D:
    dw $0004                                                             ;A3C500;
    %spritemapEntry(1, $43FF, $00, 1, 0, 3, 0, $14A)
    %spritemapEntry(1, $43F1, $00, 1, 1, 3, 0, $14A)
    %spritemapEntry(1, $43FF, $F0, 0, 0, 3, 0, $14A)
    %spritemapEntry(1, $43F1, $F0, 0, 0, 3, 0, $148)

Spritemap_Bang_Growth4_Growing_0:
    dw $0001                                                             ;A3C516;
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $16E)

Spritemap_Bang_Growth4_Growing_1:
    dw $0004                                                             ;A3C51D;
    %spritemapEntry(1, $43F0, $00, 1, 1, 3, 0, $142)
    %spritemapEntry(1, $4200, $00, 1, 0, 3, 0, $142)
    %spritemapEntry(1, $4200, $F0, 0, 0, 3, 0, $142)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 0, $140)

Spritemap_Bang_Growth4_Growing_2:
    dw $0001                                                             ;A3C533;
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $16C)

Spritemap_Bang_Growth4_Growing_3:
    dw $0004                                                             ;A3C53A;
    %spritemapEntry(1, $4200, $00, 1, 0, 3, 0, $142)
    %spritemapEntry(1, $43F0, $00, 1, 1, 3, 0, $142)
    %spritemapEntry(1, $4200, $F0, 0, 0, 3, 0, $142)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 0, $140)

Spritemap_Bang_Growth4_Growing_4:
    dw $0001                                                             ;A3C550;
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $16E)

Spritemap_Bang_Growth4_Growing_5:
    dw $0004                                                             ;A3C557;
    %spritemapEntry(1, $43EF, $EF, 0, 1, 3, 0, $142)
    %spritemapEntry(1, $43EF, $01, 1, 1, 3, 0, $142)
    %spritemapEntry(1, $4201, $01, 1, 0, 3, 0, $142)
    %spritemapEntry(1, $4201, $EF, 0, 0, 3, 0, $142)

Spritemap_Bang_Growth4_Growing_6:
    dw $0001                                                             ;A3C56D;
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $16C)

Spritemap_Bang_Growth4_Growing_7:
    dw $0004                                                             ;A3C574;
    %spritemapEntry(1, $43EE, $EE, 0, 1, 3, 0, $146)
    %spritemapEntry(1, $43EE, $02, 1, 1, 3, 0, $146)
    %spritemapEntry(1, $4202, $02, 1, 0, 3, 0, $146)
    %spritemapEntry(1, $4202, $EE, 0, 0, 3, 0, $146)

Spritemap_Bang_Growth4_Growing_8:
    dw $0001                                                             ;A3C58A;
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $16E)

Spritemap_Bang_Growth4_Growing_9:
    dw $0004                                                             ;A3C591;
    %spritemapEntry(1, $43ED, $ED, 0, 1, 3, 0, $14A)
    %spritemapEntry(1, $43ED, $03, 1, 1, 3, 0, $14A)
    %spritemapEntry(1, $4203, $03, 1, 0, 3, 0, $14A)
    %spritemapEntry(1, $4203, $ED, 0, 0, 3, 0, $14A)

Spritemap_Bang_Growth4_Growing_A:
    dw $0001                                                             ;A3C5A7;
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $16C)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Bang_Electricity_A3C5AE:
    dw $0002                                                             ;A3C5AE;
    %spritemapEntry(0, $06, $FC, 0, 0, 3, 0, $164)
    %spritemapEntry(0, $1F5, $F5, 0, 0, 3, 0, $161)

UNUSED_Spritemap_Bang_Electricity_A3C5BA:
    dw $0002                                                             ;A3C5BA;
    %spritemapEntry(0, $06, $FC, 0, 0, 3, 0, $165)
    %spritemapEntry(0, $1F5, $F5, 0, 0, 3, 0, $162)

UNUSED_Spritemap_Bang_Electricity_A3C5C6:
    dw $0002                                                             ;A3C5C6;
    %spritemapEntry(0, $06, $FC, 0, 0, 3, 0, $166)
    %spritemapEntry(0, $1F5, $F5, 0, 0, 3, 0, $163)

UNUSED_Spritemap_Bang_Electricity_A3C5D2:
    dw $0002                                                             ;A3C5D2;
    %spritemapEntry(0, $03, $F5, 0, 1, 3, 0, $161)
    %spritemapEntry(0, $1F2, $FD, 0, 0, 3, 0, $164)

UNUSED_Spritemap_Bang_Electricity_A3C5DE:
    dw $0002                                                             ;A3C5DE;
    %spritemapEntry(0, $03, $F5, 0, 1, 3, 0, $162)
    %spritemapEntry(0, $1F2, $FD, 0, 0, 3, 0, $165)

UNUSED_Spritemap_Bang_Electricity_A3C5EA:
    dw $0002                                                             ;A3C5EA;
    %spritemapEntry(0, $1F2, $FD, 0, 0, 3, 0, $166)
    %spritemapEntry(0, $03, $F5, 0, 1, 3, 0, $163)

UNUSED_Spritemap_Bang_Electricity_A3C5F6:
    dw $0002                                                             ;A3C5F6;
    %spritemapEntry(0, $1FA, $05, 0, 0, 3, 0, $176)
    %spritemapEntry(0, $1FC, $F3, 0, 0, 3, 0, $174)

UNUSED_Spritemap_Bang_Electricity_A3C602:
    dw $0002                                                             ;A3C602;
    %spritemapEntry(0, $1FA, $05, 0, 0, 3, 0, $175)
    %spritemapEntry(0, $1FC, $F3, 0, 0, 3, 0, $175)

UNUSED_Spritemap_Bang_Electricity_A3C60E:
    dw $0002                                                             ;A3C60E;
    %spritemapEntry(0, $1FB, $05, 0, 0, 3, 0, $174)
    %spritemapEntry(0, $1FC, $F3, 0, 0, 3, 0, $176)

UNUSED_Spritemap_Bang_Electricity_A3C61A:
    dw $0002                                                             ;A3C61A;
    %spritemapEntry(0, $03, $03, 0, 0, 3, 0, $163)
    %spritemapEntry(0, $1F5, $03, 0, 1, 3, 0, $161)

UNUSED_Spritemap_Bang_Electricity_A3C626:
    dw $0002                                                             ;A3C626;
    %spritemapEntry(0, $03, $03, 0, 0, 3, 0, $162)
    %spritemapEntry(0, $1F5, $03, 0, 1, 3, 0, $162)

UNUSED_Spritemap_Bang_Electricity_A3C632:
    dw $0002                                                             ;A3C632;
    %spritemapEntry(0, $03, $03, 0, 0, 3, 0, $161)
    %spritemapEntry(0, $1F5, $03, 0, 1, 3, 0, $163)
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $C63E: Palette - enemy $DB7F (skree) ;;;
Palette_Skree:
    dw $3800,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166                   ;A3C63E;
    dw $0924,$7FFF,$039C,$0237,$00D1,$61BF,$38B6,$1448                   ;A3C64E;


;;; $C65E: Instruction list - idling ;;;
InstList_Skree_Idling:
    dw $000A,Spritemap_Skree_0                                           ;A3C65E;
    dw $000A,Spritemap_Skree_2                                           ;A3C662;
    dw $000A,Spritemap_Skree_3                                           ;A3C666;
    dw $000A,Spritemap_Skree_4                                           ;A3C66A;
    dw Instruction_Common_GotoY                                          ;A3C66E;
    dw InstList_Skree_Idling                                             ;A3C670;


;;; $C672: Instruction list - prepare to launch attack ;;;
InstList_Skree_PrepareToLaunchAttack:
    dw $0010,Spritemap_Skree_0                                           ;A3C672;
    dw $0008,Spritemap_Skree_1                                           ;A3C676;
    dw Instruction_Skree_SetAttackReadyFlag                              ;A3C67A;
    dw Instruction_Common_Sleep                                          ;A3C67C;


;;; $C67E: Instruction list - launched attack ;;;
InstList_Skree_LaunchedAttack_0:
    dw Instruction_Common_EnableOffScreenProcessing                      ;A3C67E;

InstList_Skree_LaunchedAttack_1:
    dw $0002,Spritemap_Skree_2                                           ;A3C680;
    dw $0002,Spritemap_Skree_3                                           ;A3C684;
    dw $0002,Spritemap_Skree_4                                           ;A3C688;
    dw $0002,Spritemap_Skree_0                                           ;A3C68C;
    dw Instruction_Common_GotoY                                          ;A3C690;
    dw InstList_Skree_LaunchedAttack_1                                   ;A3C692;


;;; $C694: Unused. Instruction list - stop animating ;;;
UNUSED_InstList_Skree_StopAnimating_A3C694:
    dw Instruction_Common_DisableOffScreenProcessing                     ;A3C694;
    dw $0001,Spritemap_Skree_0                                           ;A3C696;
    dw Instruction_Common_Sleep                                          ;A3C69A;


;;; $C69C: Skree instruction list pointers ;;;
InstListPointers_Skree:
; Indexed by [enemy Enemy.var3]
    dw InstList_Skree_Idling                                             ;A3C69C;
    dw InstList_Skree_PrepareToLaunchAttack                              ;A3C69E;
    dw InstList_Skree_LaunchedAttack_0                                   ;A3C6A0;
    dw UNUSED_InstList_Skree_StopAnimating_A3C694                        ;A3C6A2;


;;; $C6A4: Instruction - set attack ready flag ;;;
Instruction_Skree_SetAttackReadyFlag:
    LDX.W EnemyIndex                                                     ;A3C6A4;
    LDA.W #$0001                                                         ;A3C6A7;
    STA.W Skree.attackReadyFlag,X                                        ;A3C6AA;
    RTL                                                                  ;A3C6AD;


;;; $C6AE: Initialisation AI - enemy $DB7F (skree) ;;;
InitAI_Skree:
    LDX.W EnemyIndex                                                     ;A3C6AE;
    STZ.W Skree.newInstListIndex,X                                       ;A3C6B1;
    STZ.W Skree.instListIndex,X                                          ;A3C6B4;
    STZ.W Skree.attackReadyFlag,X                                        ;A3C6B7;
    LDA.W #InstList_Skree_Idling                                         ;A3C6BA;
    STA.W Enemy.instList,X                                               ;A3C6BD;
    LDA.W #Function_Skree_Idling                                         ;A3C6C0;
    STA.W Skree.function,X                                               ;A3C6C3;
    RTL                                                                  ;A3C6C6;


;;; $C6C7: Main AI - enemy $DB7F (skree) ;;;
MainAI_Skree:
    LDX.W EnemyIndex                                                     ;A3C6C7;
    JMP.W (Skree.function,X)                                             ;A3C6CA;


if !FEATURE_KEEP_UNREFERENCED
;;; $C6CD: Unused. Skree function pointers ;;;
UNUSED_FunctionPointers_Skree_A3C6CD:
    dw Function_Skree_Idling                                             ;A3C6CD;
    dw Function_Skree_PrepareToLaunchAttack                              ;A3C6CF;
    dw Function_Skree_LaunchedAttack                                     ;A3C6D1;
    dw Function_Skree_Burrowing                                          ;A3C6D3;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $C6D5: Skree function - idling ;;;
Function_Skree_Idling:
    LDX.W EnemyIndex                                                     ;A3C6D5;
    LDA.W Enemy.XPosition,X                                              ;A3C6D8;
    SEC                                                                  ;A3C6DB;
    SBC.W SamusXPosition                                                 ;A3C6DC;
    BPL +                                                                ;A3C6DF;
    EOR.W #$FFFF                                                         ;A3C6E1;
    INC                                                                  ;A3C6E4;

+   CMP.W #$0030                                                         ;A3C6E5;
    BCS .return                                                          ;A3C6E8;
    INC.W Skree.newInstListIndex,X                                       ;A3C6EA;
    JSR.W SetSkreeInstListPointer                                        ;A3C6ED;
    LDA.W #Function_Skree_PrepareToLaunchAttack                          ;A3C6F0;
    STA.W Skree.function,X                                               ;A3C6F3;

  .return:
    RTL                                                                  ;A3C6F6;


;;; $C6F7: Skree function - prepare to launch attack ;;;
Function_Skree_PrepareToLaunchAttack:
    LDA.W Skree.attackReadyFlag,X                                        ;A3C6F7;
    BEQ .return                                                          ;A3C6FA;
    STZ.W Skree.attackReadyFlag,X                                        ;A3C6FC;
    LDX.W EnemyIndex                                                     ;A3C6FF;
    INC.W Skree.newInstListIndex,X                                       ;A3C702;
    JSR.W SetSkreeInstListPointer                                        ;A3C705;
    LDA.W #Function_Skree_LaunchedAttack                                 ;A3C708;
    STA.W Skree.function,X                                               ;A3C70B;
    LDA.W #$005B                                                         ;A3C70E;
    JSL.L QueueSound_Lib2_Max6                                           ;A3C711;

  .return:
    RTL                                                                  ;A3C715;


;;; $C716: Skree function - launched attack ;;;
Function_Skree_LaunchedAttack:
    LDX.W EnemyIndex                                                     ;A3C716;
    LDA.W #$0015                                                         ;A3C719;
    STA.W Skree.burrowTimer,X                                            ;A3C71C;
    LDA.W #$0006                                                         ;A3C71F;
    STA.B DP_Temp14                                                      ;A3C722;
    STZ.B DP_Temp12                                                      ;A3C724;
    LDA.W Enemy.properties,X                                             ;A3C726;
    ORA.W #$0003                                                         ;A3C729;
    STA.W Enemy.properties,X                                             ;A3C72C;
    LDX.W EnemyIndex                                                     ;A3C72F;
    JSL.L CheckForVerticalSolidBlockCollision_SkreeMetaree               ;A3C732;
    BCS .collision                                                       ;A3C736;
    LDX.W EnemyIndex                                                     ;A3C738;
    LDA.W Enemy.YPosition,X                                              ;A3C73B;
    CLC                                                                  ;A3C73E;
    ADC.W #$0006                                                         ;A3C73F;
    STA.W Enemy.YPosition,X                                              ;A3C742;
    LDA.W #$0001                                                         ;A3C745;
    STA.W Temp_XVelocity                                                 ;A3C748;
    LDA.W Enemy.XPosition,X                                              ;A3C74B;
    CMP.W SamusXPosition                                                 ;A3C74E;
    BMI .steerRight                                                      ;A3C751;
    LDA.W #$FFFF                                                         ;A3C753;
    STA.W Temp_XVelocity                                                 ;A3C756;

  .steerRight:
    LDA.W Enemy.XPosition,X                                              ;A3C759;
    CLC                                                                  ;A3C75C;
    ADC.W Temp_XVelocity                                                 ;A3C75D;
    STA.W Enemy.XPosition,X                                              ;A3C760;
    BRA .return                                                          ;A3C763;

  .collision:
    LDX.W EnemyIndex                                                     ;A3C765;
    LDA.W #$0001                                                         ;A3C768;
    STA.W Enemy.instTimer,X                                              ;A3C76B;
    STZ.W Enemy.loopCounter,X                                            ;A3C76E;
    LDA.W #Function_Skree_Burrowing                                      ;A3C771;
    STA.W Skree.function,X                                               ;A3C774;
    LDA.W #$005C                                                         ;A3C777;
    JSL.L QueueSound_Lib2_Max6                                           ;A3C77A;

  .return:
    RTL                                                                  ;A3C77E;


;;; $C77F: Skree function - burrowing ;;;
Function_Skree_Burrowing:
; I have no idea why .delete does any of those three assignments
    LDX.W EnemyIndex                                                     ;A3C77F;
    DEC.W Skree.burrowTimer,X                                            ;A3C782;
    BEQ .delete                                                          ;A3C785;
    LDA.W Skree.burrowTimer,X                                            ;A3C787;
    CMP.W #$0008                                                         ;A3C78A;
    BNE .timerNot8                                                       ;A3C78D;
    LDX.W EnemyIndex                                                     ;A3C78F;
    LDY.W #EnemyProjectile_SkreeParticles_DownRight                      ;A3C792;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A3C795;
    LDY.W #EnemyProjectile_SkreeParticles_UpRight                        ;A3C799;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A3C79C;
    LDY.W #EnemyProjectile_SkreeParticles_DownLeft                       ;A3C7A0;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A3C7A3;
    LDY.W #EnemyProjectile_SkreeParticles_UpLeft                         ;A3C7A7;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A3C7AA;

  .timerNot8:
    LDX.W EnemyIndex                                                     ;A3C7AE;
    INC.W Enemy.YPosition,X                                              ;A3C7B1;
    RTL                                                                  ;A3C7B4;

  .delete:
    LDX.W EnemyIndex                                                     ;A3C7B5;
    LDA.W Enemy.palette,X                                                ;A3C7B8;
    ORA.W Enemy.GFXOffset,X                                              ;A3C7BB;
    STA.L EnemySpawnData.VRAMTilesIndex,X                                ;A3C7BE;
    LDA.W #$0A00                                                         ;A3C7C2;
    STA.W Enemy.palette,X                                                ;A3C7C5;
    STZ.W Enemy.GFXOffset,X                                              ;A3C7C8;
    LDA.W Enemy.properties,X                                             ;A3C7CB;
    ORA.W #$0200                                                         ;A3C7CE;
    STA.W Enemy.properties,X                                             ;A3C7D1;
    RTL                                                                  ;A3C7D4;


;;; $C7D5: Set skree instruction list pointer ;;;
SetSkreeInstListPointer:
    LDX.W EnemyIndex                                                     ;A3C7D5;
    LDA.W Skree.newInstListIndex,X                                       ;A3C7D8;
    CMP.W Skree.instListIndex,X                                          ;A3C7DB;
    BEQ .return                                                          ;A3C7DE;
    STA.W Skree.instListIndex,X                                          ;A3C7E0;
    ASL                                                                  ;A3C7E3;
    TAY                                                                  ;A3C7E4;
    LDA.W InstListPointers_Skree,Y                                       ;A3C7E5;
    STA.W Enemy.instList,X                                               ;A3C7E8;
    LDA.W #$0001                                                         ;A3C7EB;
    STA.W Enemy.instTimer,X                                              ;A3C7EE;
    STZ.W Enemy.loopCounter,X                                            ;A3C7F1;

  .return:
    RTS                                                                  ;A3C7F4;


;;; $C7F5: Enemy shot - enemy $DB7F (skree) ;;;
EnemyShot_Skree:
    LDX.W EnemyIndex                                                     ;A3C7F5;
    JSL.L CommonA3_NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic     ;A3C7F8;
    LDX.W EnemyIndex                                                     ;A3C7FC;
    LDA.W Enemy.health,X                                                 ;A3C7FF;
    BNE .return                                                          ;A3C802;
    LDA.W Skree.burrowTimer,X                                            ;A3C804;
    LDX.W EnemyIndex                                                     ;A3C807;
    LDY.W #EnemyProjectile_SkreeParticles_DownRight                      ;A3C80A;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A3C80D;
    LDY.W #EnemyProjectile_SkreeParticles_UpRight                        ;A3C811;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A3C814;
    LDY.W #EnemyProjectile_SkreeParticles_DownLeft                       ;A3C818;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A3C81B;
    LDY.W #EnemyProjectile_SkreeParticles_UpLeft                         ;A3C81F;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A3C822;
    LDY.W #$0002                                                         ;A3C826;
    LDA.W CollisionIndex                                                 ;A3C829;
    ASL                                                                  ;A3C82C;
    TAX                                                                  ;A3C82D;
    LDA.W SamusProjectile_Types,X                                        ;A3C82E;
    AND.W #$0F00                                                         ;A3C831;
    CMP.W #$0200                                                         ;A3C834;
    BEQ .superMissile                                                    ;A3C837;
    LDY.W #$0000                                                         ;A3C839;

  .superMissile:
    TYA                                                                  ;A3C83C;
    JSL.L EnemyDeath                                                     ;A3C83D;

  .return:
    RTL                                                                  ;A3C841;


;;; $C842: Skree spritemaps ;;;
Spritemap_Skree_0:
    dw $0006                                                             ;A3C842;
    %spritemapEntry(0, $00, $0C, 0, 1, 2, 0, $112)
    %spritemapEntry(0, $00, $04, 0, 1, 2, 0, $102)
    %spritemapEntry(0, $1F8, $0C, 0, 0, 2, 0, $112)
    %spritemapEntry(0, $1F8, $04, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $00, $F4, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1F0, $F4, 0, 0, 2, 0, $100)

Spritemap_Skree_1:
    dw $0004                                                             ;A3C862;
    %spritemapEntry(0, $04, $04, 0, 1, 2, 0, $105)
    %spritemapEntry(0, $1F4, $04, 0, 0, 2, 0, $105)
    %spritemapEntry(1, $00, $F4, 0, 1, 2, 0, $103)
    %spritemapEntry(1, $1F0, $F4, 0, 0, 2, 0, $103)

Spritemap_Skree_2:
    dw $0002                                                             ;A3C878;
    %spritemapEntry(1, $1F8, $04, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $1F8, $F4, 0, 0, 2, 0, $106)

Spritemap_Skree_3:
    dw $0004                                                             ;A3C884;
    %spritemapEntry(0, $1FC, $0C, 0, 0, 2, 0, $11B)
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 0, $10B)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $11A)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 0, $10A)

Spritemap_Skree_4:
    dw $0002                                                             ;A3C89A;
    %spritemapEntry(1, $1F8, $04, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1F8, $F4, 0, 0, 2, 0, $10C)


;;; $C8A6: Palette - enemy $DBBF (yard) ;;;
Palette_Yard:
    dw $3800,$57FF,$42F7,$158C,$00A5,$4F5A,$36B5,$2610                   ;A3C8A6;
    dw $1DCE,$77FF,$62B5,$314A,$1063,$4D1F,$38B6,$246E                   ;A3C8B6;


;;; $C8C6: Instruction list - outside turn - upside right - moving up ;;;
InstList_Yard_OutsideTurn_UpsideRight_MovingUp:
    dw Instruction_Yard_MovementFunctionInY                              ;A3C8C6;
    dw RTL_A3CF5F                                                        ;A3C8C8;
    dw Instruction_Yard_HidingInstListInY                                ;A3C8CA;
    dw RTL_A3CF5F                                                        ;A3C8CC;
    dw $0007,Spritemap_Yard_15                                           ;A3C8CE;
    dw $0004,Spritemap_Yard_16                                           ;A3C8D2;
    dw $0007,Spritemap_Yard_17                                           ;A3C8D6;
    dw Instruction_Yard_MoveByPixelsInY,$FFFC,$FFF8                      ;A3C8DA;


;;; $C8E0: Instruction list - crawling - upside up - moving left ;;;
InstList_Yard_Crawling_UpsideUp_MovingLeft:
    dw Instruction_Yard_MovementFunctionInY                              ;A3C8E0;
    dw Function_Yard_Movement_Crawling_UpsideUp_MovingLeft               ;A3C8E2;
    dw Instruction_Yard_HidingInstListInY                                ;A3C8E4;
    dw InstList_Yard_Hiding_UpsideUp_MovingLeft                          ;A3C8E6;
    dw Instruction_Yard_DirectionInY,$0006                               ;A3C8E8;
    dw $0009,Spritemap_Yard_0                                            ;A3C8EA;
    dw $000D,Spritemap_Yard_1                                            ;A3C8F0;
    dw $0009,Spritemap_Yard_2                                            ;A3C8F4;
    dw Instruction_Common_GotoY                                          ;A3C8F8;
    dw InstList_Yard_Crawling_UpsideUp_MovingLeft                        ;A3C8FA;


;;; $C8FC: Instruction list - outside turn - upside up - moving left ;;;
InstList_Yard_OutsideTurn_UpsideUp_MovingLeft:
    dw Instruction_Yard_MovementFunctionInY                              ;A3C8FC;
    dw RTL_A3CF5F                                                        ;A3C8FE;
    dw Instruction_Yard_HidingInstListInY                                ;A3C900;
    dw RTL_A3CF5F                                                        ;A3C902;
    dw $0007,Spritemap_Yard_3                                            ;A3C904;
    dw $0004,Spritemap_Yard_4                                            ;A3C908;
    dw $0007,Spritemap_Yard_5                                            ;A3C90C;
    dw Instruction_Yard_MoveByPixelsInY,$FFF8,$0004                      ;A3C910;


;;; $C916: Instruction list - crawling - upside left - moving down ;;;
InstList_Yard_Crawling_UpsideLeft_MovingDown:
    dw Instruction_Yard_MovementFunctionInY                              ;A3C916;
    dw Function_Yard_Movement_Crawling_UpsideLeft_MovingDown             ;A3C918;
    dw Instruction_Yard_HidingInstListInY                                ;A3C91A;
    dw InstList_Yard_Hiding_UpsideLeft_MovingDown                        ;A3C91C;
    dw Instruction_Yard_DirectionInY,$0003                               ;A3C91E;
    dw $0009,Spritemap_Yard_6                                            ;A3C920;
    dw $000D,Spritemap_Yard_7                                            ;A3C926;
    dw $0009,Spritemap_Yard_8                                            ;A3C92A;
    dw Instruction_Common_GotoY                                          ;A3C92E;
    dw InstList_Yard_Crawling_UpsideLeft_MovingDown                      ;A3C930;


;;; $C932: Instruction list - outside turn - upside left - moving down ;;;
InstList_Yard_OutsideTurn_UpsideLeft_MovingDown:
    dw Instruction_Yard_MovementFunctionInY                              ;A3C932;
    dw RTL_A3CF5F                                                        ;A3C934;
    dw Instruction_Yard_HidingInstListInY                                ;A3C936;
    dw RTL_A3CF5F                                                        ;A3C938;
    dw $0007,Spritemap_Yard_9                                            ;A3C93A;
    dw $0004,Spritemap_Yard_A                                            ;A3C93E;
    dw $0007,Spritemap_Yard_B                                            ;A3C942;
    dw Instruction_Yard_MoveByPixelsInY,$0004,$0008                      ;A3C946;


;;; $C94C: Instruction list - crawling - upside down - moving right ;;;
InstList_Yard_Crawling_UpsideDown_MovingRight:
    dw Instruction_Yard_MovementFunctionInY                              ;A3C94C;
    dw Function_Yard_Movement_Crawling_UpsideDown_MovingRight            ;A3C94E;
    dw Instruction_Yard_HidingInstListInY                                ;A3C950;
    dw InstList_Yard_Hiding_UpsideDown_MovingRight                       ;A3C952;
    dw Instruction_Yard_DirectionInY,$0005                               ;A3C954;
    dw $0009,Spritemap_Yard_C                                            ;A3C956;
    dw $000D,Spritemap_Yard_D                                            ;A3C95C;
    dw $0009,Spritemap_Yard_E                                            ;A3C960;
    dw Instruction_Common_GotoY                                          ;A3C964;
    dw InstList_Yard_Crawling_UpsideDown_MovingRight                     ;A3C966;


;;; $C968: Instruction list - outside turn - upside down - moving right ;;;
InstList_Yard_OutsideTurn_UpsideDown_MovingRight:
    dw Instruction_Yard_MovementFunctionInY                              ;A3C968;
    dw RTL_A3CF5F                                                        ;A3C96A;
    dw Instruction_Yard_HidingInstListInY                                ;A3C96C;
    dw RTL_A3CF5F                                                        ;A3C96E;
    dw $0007,Spritemap_Yard_F                                            ;A3C970;
    dw $0004,Spritemap_Yard_10                                           ;A3C974;
    dw $0007,Spritemap_Yard_11                                           ;A3C978;
    dw Instruction_Yard_MoveByPixelsInY,$0008,$FFFC                      ;A3C97C;


;;; $C982: Instruction list - crawling - upside right - moving up ;;;
InstList_Yard_Crawling_UpsideRight_MovingUp:
    dw Instruction_Yard_MovementFunctionInY                              ;A3C982;
    dw Function_Yard_Movement_Crawling_UpsideRight_MovingUp              ;A3C984;
    dw Instruction_Yard_HidingInstListInY                                ;A3C986;
    dw InstList_Yard_Hiding_UpsideRight_MovingUp                         ;A3C988;
    dw Instruction_Yard_DirectionInY,$0000                               ;A3C98A;
    dw $0009,Spritemap_Yard_12                                           ;A3C98C;
    dw $000D,Spritemap_Yard_13                                           ;A3C992;
    dw $0009,Spritemap_Yard_14                                           ;A3C996;
    dw Instruction_Common_GotoY                                          ;A3C99A;
    dw InstList_Yard_Crawling_UpsideRight_MovingUp                       ;A3C99C;


;;; $C99E: Instruction list - outside turn - upside left - moving up ;;;
InstList_Yard_OutsideTurn_UpsideLeft_MovingUp:
    dw Instruction_Yard_MovementFunctionInY                              ;A3C99E;
    dw RTL_A3CF5F                                                        ;A3C9A0;
    dw Instruction_Yard_HidingInstListInY                                ;A3C9A2;
    dw RTL_A3CF5F                                                        ;A3C9A4;
    dw $0007,Spritemap_Yard_35                                           ;A3C9A6;
    dw $0004,Spritemap_Yard_36                                           ;A3C9AA;
    dw $0007,Spritemap_Yard_37                                           ;A3C9AE;
    dw Instruction_Yard_MoveByPixelsInY,$0004,$FFF8                      ;A3C9B2;


;;; $C9B8: Instruction list - crawling - upside up - moving right ;;;
InstList_Yard_Crawling_UpsideUp_MovingRight:
    dw Instruction_Yard_MovementFunctionInY                              ;A3C9B8;
    dw Function_Yard_Movement_Crawling_UpsideUp_MovingRight              ;A3C9BA;
    dw Instruction_Yard_HidingInstListInY                                ;A3C9BC;
    dw InstList_Yard_Hiding_UpsideUp_MovingRight                         ;A3C9BE;
    dw Instruction_Yard_DirectionInY,$0007                               ;A3C9C0;
    dw $0009,Spritemap_Yard_20                                           ;A3C9C2;
    dw $000D,Spritemap_Yard_21                                           ;A3C9C8;
    dw $0009,Spritemap_Yard_22                                           ;A3C9CC;
    dw Instruction_Common_GotoY                                          ;A3C9D0;
    dw InstList_Yard_Crawling_UpsideUp_MovingRight                       ;A3C9D2;


;;; $C9D4: Instruction list - outside turn - upside up - moving right ;;;
InstList_Yard_OutsideTurn_UpsideUp_MovingRight:
    dw Instruction_Yard_MovementFunctionInY                              ;A3C9D4;
    dw RTL_A3CF5F                                                        ;A3C9D6;
    dw Instruction_Yard_HidingInstListInY                                ;A3C9D8;
    dw RTL_A3CF5F                                                        ;A3C9DA;
    dw $0007,Spritemap_Yard_23                                           ;A3C9DC;
    dw $0004,Spritemap_Yard_24                                           ;A3C9E0;
    dw $0007,Spritemap_Yard_25                                           ;A3C9E4;
    dw Instruction_Yard_MoveByPixelsInY,$0008,$0004                      ;A3C9E8;


;;; $C9EE: Instruction list - crawling - upside right - moving down ;;;
InstList_Yard_Crawling_UpsideRight_MovingDown:
    dw Instruction_Yard_MovementFunctionInY                              ;A3C9EE;
    dw Function_Yard_Movement_Crawling_UpsideRight_MovingDown            ;A3C9F0;
    dw Instruction_Yard_HidingInstListInY                                ;A3C9F2;
    dw InstList_Yard_Hiding_UpsideRight_MovingDown                       ;A3C9F4;
    dw Instruction_Yard_DirectionInY,$0001                               ;A3C9F6;
    dw $0009,Spritemap_Yard_26                                           ;A3C9F8;
    dw $000D,Spritemap_Yard_27                                           ;A3C9FE;
    dw $0009,Spritemap_Yard_28                                           ;A3CA02;
    dw Instruction_Common_GotoY                                          ;A3CA06;
    dw InstList_Yard_Crawling_UpsideRight_MovingDown                     ;A3CA08;


;;; $CA0A: Instruction list - outside turn - upside right - moving down ;;;
InstList_Yard_OutsideTurn_UpsideRight_MovingDown:
    dw Instruction_Yard_MovementFunctionInY                              ;A3CA0A;
    dw RTL_A3CF5F                                                        ;A3CA0C;
    dw Instruction_Yard_HidingInstListInY                                ;A3CA0E;
    dw RTL_A3CF5F                                                        ;A3CA10;
    dw $0007,Spritemap_Yard_29                                           ;A3CA12;
    dw $0004,Spritemap_Yard_2A                                           ;A3CA16;
    dw $0007,Spritemap_Yard_2B                                           ;A3CA1A;
    dw Instruction_Yard_MoveByPixelsInY,$FFFC,$0008                      ;A3CA1E;


;;; $CA24: Instruction list - crawling - upside down - moving left ;;;
InstList_Yard_Crawling_UpsideDown_MovingLeft:
    dw Instruction_Yard_MovementFunctionInY                              ;A3CA24;
    dw Function_Yard_Movement_Crawling_UpsideDown_MovingLeft             ;A3CA26;
    dw Instruction_Yard_HidingInstListInY                                ;A3CA28;
    dw InstList_Yard_Hiding_UpsideDown_MovingLeft                        ;A3CA2A;
    dw Instruction_Yard_DirectionInY,$0004                               ;A3CA2C;
    dw $0009,Spritemap_Yard_2C                                           ;A3CA2E;
    dw $000D,Spritemap_Yard_2D                                           ;A3CA34;
    dw $0009,Spritemap_Yard_2E                                           ;A3CA38;
    dw Instruction_Common_GotoY                                          ;A3CA3C;
    dw InstList_Yard_Crawling_UpsideDown_MovingLeft                      ;A3CA3E;


;;; $CA40: Instruction list - outside turn - upside down - moving left ;;;
InstList_Yard_OutsideTurn_UpsideDown_MovingLeft:
    dw Instruction_Yard_MovementFunctionInY                              ;A3CA40;
    dw RTL_A3CF5F                                                        ;A3CA42;
    dw Instruction_Yard_HidingInstListInY                                ;A3CA44;
    dw RTL_A3CF5F                                                        ;A3CA46;
    dw $0007,Spritemap_Yard_2F                                           ;A3CA48;
    dw $0004,Spritemap_Yard_30                                           ;A3CA4C;
    dw $0007,Spritemap_Yard_31                                           ;A3CA50;
    dw Instruction_Yard_MoveByPixelsInY,$FFF8,$FFFC                      ;A3CA54;


;;; $CA5A: Instruction list - crawling - upside left - moving up ;;;
InstList_Yard_Crawling_UpsideLeft_MovingUp:
    dw Instruction_Yard_MovementFunctionInY                              ;A3CA5A;
    dw Function_Yard_Movement_Crawling_UpsideLeft_MovingUp               ;A3CA5C;
    dw Instruction_Yard_HidingInstListInY                                ;A3CA5E;
    dw InstList_Yard_Hiding_UpsideLeft_MovingUp                          ;A3CA60;
    dw Instruction_Yard_DirectionInY,$0002                               ;A3CA62;
    dw $0009,Spritemap_Yard_32                                           ;A3CA64;
    dw $000D,Spritemap_Yard_33                                           ;A3CA6A;
    dw $0009,Spritemap_Yard_34                                           ;A3CA6E;
    dw Instruction_Common_GotoY                                          ;A3CA72;
    dw InstList_Yard_Crawling_UpsideLeft_MovingUp                        ;A3CA74;


;;; $CA76: Instruction list - inside turn - upside up - moving left ;;;
InstList_Yard_InsideTurn_UpsideUp_MovingLeft:
    dw Instruction_Yard_MovementFunctionInY                              ;A3CA76;
    dw RTL_A3CF5F                                                        ;A3CA78;
    dw Instruction_Yard_HidingInstListInY                                ;A3CA7A;
    dw RTL_A3CF5F                                                        ;A3CA7C;
    dw $0007,Spritemap_Yard_40                                           ;A3CA7E;
    dw $0004,Spritemap_Yard_41                                           ;A3CA82;
    dw $0007,Spritemap_Yard_42                                           ;A3CA86;
    dw Instruction_Common_GotoY                                          ;A3CA8A;
    dw InstList_Yard_Crawling_UpsideRight_MovingUp                       ;A3CA8C;


;;; $CA8E: Instruction list - inside turn - upside right - moving up ;;;
InstList_Yard_InsideTurn_UpsideRight_MovingUp:
    dw Instruction_Yard_MovementFunctionInY                              ;A3CA8E;
    dw RTL_A3CF5F                                                        ;A3CA90;
    dw Instruction_Yard_HidingInstListInY                                ;A3CA92;
    dw RTL_A3CF5F                                                        ;A3CA94;
    dw $0007,Spritemap_Yard_43                                           ;A3CA96;
    dw $0004,Spritemap_Yard_44                                           ;A3CA9A;
    dw $0007,Spritemap_Yard_45                                           ;A3CA9E;
    dw Instruction_Common_GotoY                                          ;A3CAA2;
    dw InstList_Yard_Crawling_UpsideDown_MovingRight                     ;A3CAA4;


;;; $CAA6: Instruction list - inside turn - upside down - moving right ;;;
InstList_Yard_InsideTurn_UpsideDown_MovingRight:
    dw Instruction_Yard_MovementFunctionInY                              ;A3CAA6;
    dw RTL_A3CF5F                                                        ;A3CAA8;
    dw Instruction_Yard_HidingInstListInY                                ;A3CAAA;
    dw RTL_A3CF5F                                                        ;A3CAAC;
    dw $0007,Spritemap_Yard_46                                           ;A3CAAE;
    dw $0004,Spritemap_Yard_47                                           ;A3CAB2;
    dw $0007,Spritemap_Yard_48                                           ;A3CAB6;
    dw Instruction_Common_GotoY                                          ;A3CABA;
    dw InstList_Yard_Crawling_UpsideLeft_MovingDown                      ;A3CABC;


;;; $CABE: Instruction list - inside turn - upside left - moving down ;;;
InstList_Yard_InsideTurn_UpsideLeft_MovingDown:
    dw Instruction_Yard_MovementFunctionInY                              ;A3CABE;
    dw RTL_A3CF5F                                                        ;A3CAC0;
    dw Instruction_Yard_HidingInstListInY                                ;A3CAC2;
    dw RTL_A3CF5F                                                        ;A3CAC4;
    dw $0007,Spritemap_Yard_49                                           ;A3CAC6;
    dw $0004,Spritemap_Yard_4A                                           ;A3CACA;
    dw $0007,Spritemap_Yard_4B                                           ;A3CACE;
    dw Instruction_Common_GotoY                                          ;A3CAD2;
    dw InstList_Yard_Crawling_UpsideUp_MovingLeft                        ;A3CAD4;


;;; $CAD6: Instruction list - inside turn - upside up - moving right ;;;
InstList_Yard_InsideTurn_UpsideUp_MovingRight:
    dw Instruction_Yard_MovementFunctionInY                              ;A3CAD6;
    dw RTL_A3CF5F                                                        ;A3CAD8;
    dw Instruction_Yard_HidingInstListInY                                ;A3CADA;
    dw RTL_A3CF5F                                                        ;A3CADC;
    dw $0007,Spritemap_Yard_54                                           ;A3CADE;
    dw $0004,Spritemap_Yard_55                                           ;A3CAE2;
    dw $0007,Spritemap_Yard_56                                           ;A3CAE6;
    dw Instruction_Common_GotoY                                          ;A3CAEA;
    dw InstList_Yard_Crawling_UpsideLeft_MovingUp                        ;A3CAEC;


;;; $CAEE: Instruction list - inside turn - upside left - moving up ;;;
InstList_Yard_InsideTurn_UpsideLeft_MovingUp:
    dw Instruction_Yard_MovementFunctionInY                              ;A3CAEE;
    dw RTL_A3CF5F                                                        ;A3CAF0;
    dw Instruction_Yard_HidingInstListInY                                ;A3CAF2;
    dw RTL_A3CF5F                                                        ;A3CAF4;
    dw $0007,Spritemap_Yard_57                                           ;A3CAF6;
    dw $0004,Spritemap_Yard_58                                           ;A3CAFA;
    dw $0007,Spritemap_Yard_59                                           ;A3CAFE;
    dw Instruction_Common_GotoY                                          ;A3CB02;
    dw InstList_Yard_Crawling_UpsideDown_MovingLeft                      ;A3CB04;


;;; $CB06: Instruction list - inside turn - upside down - moving left ;;;
InstList_Yard_InsideTurn_UpsideDown_MovingLeft:
    dw Instruction_Yard_MovementFunctionInY                              ;A3CB06;
    dw RTL_A3CF5F                                                        ;A3CB08;
    dw Instruction_Yard_HidingInstListInY                                ;A3CB0A;
    dw RTL_A3CF5F                                                        ;A3CB0C;
    dw $0007,Spritemap_Yard_5A                                           ;A3CB0E;
    dw $0004,Spritemap_Yard_5B                                           ;A3CB12;
    dw $0007,Spritemap_Yard_5C                                           ;A3CB16;
    dw Instruction_Common_GotoY                                          ;A3CB1A;
    dw InstList_Yard_Crawling_UpsideRight_MovingDown                     ;A3CB1C;


;;; $CB1E: Instruction list - inside turn - upside right - moving down ;;;
InstList_Yard_InsideTurn_UpsideRight_MovingDown:
    dw Instruction_Yard_MovementFunctionInY                              ;A3CB1E;
    dw RTL_A3CF5F                                                        ;A3CB20;
    dw Instruction_Yard_HidingInstListInY                                ;A3CB22;
    dw RTL_A3CF5F                                                        ;A3CB24;
    dw $0007,Spritemap_Yard_5D                                           ;A3CB26;
    dw $0004,Spritemap_Yard_5E                                           ;A3CB2A;
    dw $0007,Spritemap_Yard_5F                                           ;A3CB2E;
    dw Instruction_Common_GotoY                                          ;A3CB32;
    dw InstList_Yard_Crawling_UpsideUp_MovingRight                       ;A3CB34;


;;; $CB36: Instruction list - hiding - upside up - moving left ;;;
InstList_Yard_Hiding_UpsideUp_MovingLeft:
    dw Instruction_Yard_MovementFunctionInY                              ;A3CB36;
    dw Function_Yard_Movement_Hiding                                     ;A3CB38;
    dw $0005,Spritemap_Yard_18                                           ;A3CB3A;
    dw $0001,Spritemap_Yard_19                                           ;A3CB3E;
    dw Instruction_Yard_GoBack4BytesIfHidingOr50PercentChance            ;A3CB42;


;;; $CB44: Instruction list - hidden - upside up - moving left ;;;
InstList_Yard_Hidden_UpsideUp_MovingLeft:
    dw $0030,Spritemap_Yard_4C                                           ;A3CB44;
    dw $0010,Spritemap_Yard_4D                                           ;A3CB48;
    dw Instruction_Common_GotoY                                          ;A3CB4C;
    dw InstList_Yard_Crawling_UpsideUp_MovingLeft                        ;A3CB4E;


;;; $CB50: Instruction list - hiding - upside down - moving left ;;;
InstList_Yard_Hiding_UpsideDown_MovingLeft:
    dw Instruction_Yard_MovementFunctionInY                              ;A3CB50;
    dw Function_Yard_Movement_Hiding                                     ;A3CB52;
    dw $0005,Spritemap_Yard_3C                                           ;A3CB54;
    dw $0001,Spritemap_Yard_3D                                           ;A3CB58;
    dw Instruction_Yard_GoBack4BytesIfHidingOr50PercentChance            ;A3CB5C;
    dw $0030,Spritemap_Yard_64                                           ;A3CB5E;
    dw $0010,Spritemap_Yard_65                                           ;A3CB62;
    dw Instruction_Common_GotoY                                          ;A3CB66;
    dw InstList_Yard_Crawling_UpsideDown_MovingLeft                      ;A3CB68;


;;; $CB6A: Instruction list - hiding - upside down - moving right ;;;
InstList_Yard_Hiding_UpsideDown_MovingRight:
    dw Instruction_Yard_MovementFunctionInY                              ;A3CB6A;
    dw Function_Yard_Movement_Hiding                                     ;A3CB6C;
    dw $0005,Spritemap_Yard_1C                                           ;A3CB6E;
    dw $0001,Spritemap_Yard_1D                                           ;A3CB72;
    dw Instruction_Yard_GoBack4BytesIfHidingOr50PercentChance            ;A3CB76;
    dw $0030,Spritemap_Yard_50                                           ;A3CB78;
    dw $0010,Spritemap_Yard_51                                           ;A3CB7C;
    dw Instruction_Common_GotoY                                          ;A3CB80;
    dw InstList_Yard_Crawling_UpsideDown_MovingRight                     ;A3CB82;


;;; $CB84: Instruction list - hiding - upside up - moving right ;;;
InstList_Yard_Hiding_UpsideUp_MovingRight:
    dw Instruction_Yard_MovementFunctionInY                              ;A3CB84;
    dw Function_Yard_Movement_Hiding                                     ;A3CB86;
    dw $0005,Spritemap_Yard_38                                           ;A3CB88;
    dw $0001,Spritemap_Yard_39                                           ;A3CB8C;
    dw Instruction_Yard_GoBack4BytesIfHidingOr50PercentChance            ;A3CB90;


;;; $CB92: Instruction list - hidden - upside up - moving right ;;;
InstList_Yard_Hidden_UpsideUp_MovingRight:
    dw $0030,Spritemap_Yard_60                                           ;A3CB92;
    dw $0010,Spritemap_Yard_61                                           ;A3CB96;
    dw Instruction_Common_GotoY                                          ;A3CB9A;
    dw InstList_Yard_Crawling_UpsideUp_MovingRight                       ;A3CB9C;


;;; $CB9E: Instruction list - hiding - upside right - moving up ;;;
InstList_Yard_Hiding_UpsideRight_MovingUp:
    dw Instruction_Yard_MovementFunctionInY                              ;A3CB9E;
    dw Function_Yard_Movement_Hiding                                     ;A3CBA0;
    dw $0005,Spritemap_Yard_1E                                           ;A3CBA2;
    dw $0001,Spritemap_Yard_1F                                           ;A3CBA6;
    dw Instruction_Yard_GoBack4BytesIfHidingOr50PercentChance            ;A3CBAA;
    dw $0030,Spritemap_Yard_4E                                           ;A3CBAC;
    dw $0010,Spritemap_Yard_4F                                           ;A3CBB0;
    dw Instruction_Common_GotoY                                          ;A3CBB4;
    dw InstList_Yard_Crawling_UpsideRight_MovingUp                       ;A3CBB6;


;;; $CBB8: Instruction list - hiding - upside left - moving up ;;;
InstList_Yard_Hiding_UpsideLeft_MovingUp:
    dw Instruction_Yard_MovementFunctionInY                              ;A3CBB8;
    dw Function_Yard_Movement_Hiding                                     ;A3CBBA;
    dw $0005,Spritemap_Yard_3E                                           ;A3CBBC;
    dw $0001,Spritemap_Yard_3F                                           ;A3CBC0;
    dw Instruction_Yard_GoBack4BytesIfHidingOr50PercentChance            ;A3CBC4;
    dw $0030,Spritemap_Yard_62                                           ;A3CBC6;
    dw $0010,Spritemap_Yard_63                                           ;A3CBCA;
    dw Instruction_Common_GotoY                                          ;A3CBCE;
    dw InstList_Yard_Crawling_UpsideLeft_MovingUp                        ;A3CBD0;


;;; $CBD2: Instruction list - hiding - upside left - moving down ;;;
InstList_Yard_Hiding_UpsideLeft_MovingDown:
    dw Instruction_Yard_MovementFunctionInY                              ;A3CBD2;
    dw Function_Yard_Movement_Hiding                                     ;A3CBD4;
    dw $0005,Spritemap_Yard_1A                                           ;A3CBD6;
    dw $0001,Spritemap_Yard_1B                                           ;A3CBDA;
    dw Instruction_Yard_GoBack4BytesIfHidingOr50PercentChance            ;A3CBDE;
    dw $0030,Spritemap_Yard_52                                           ;A3CBE0;
    dw $0010,Spritemap_Yard_53                                           ;A3CBE4;
    dw Instruction_Common_GotoY                                          ;A3CBE8;
    dw InstList_Yard_Crawling_UpsideLeft_MovingDown                      ;A3CBEA;


;;; $CBEC: Instruction list - hiding - upside right - moving down ;;;
InstList_Yard_Hiding_UpsideRight_MovingDown:
    dw Instruction_Yard_MovementFunctionInY                              ;A3CBEC;
    dw Function_Yard_Movement_Hiding                                     ;A3CBEE;
    dw $0005,Spritemap_Yard_3A                                           ;A3CBF0;
    dw $0001,Spritemap_Yard_3B                                           ;A3CBF4;
    dw Instruction_Yard_GoBack4BytesIfHidingOr50PercentChance            ;A3CBF8;
    dw $0030,Spritemap_Yard_66                                           ;A3CBFA;
    dw $0010,Spritemap_Yard_67                                           ;A3CBFE;
    dw Instruction_Common_GotoY                                          ;A3CC02;
    dw InstList_Yard_Crawling_UpsideRight_MovingDown                     ;A3CC04;


;;; $CC06: Instruction list - airborne - facing left ;;;
InstList_Yard_Airborne_FacingLeft_0:
    dw Instruction_Yard_MovementFunctionInY                              ;A3CC06;
    dw Function_Yard_Movement_Airborne                                   ;A3CC08;
    dw $0003,Spritemap_Yard_1F                                           ;A3CC0A;

InstList_Yard_Airborne_FacingLeft_1:
    dw $0003,Spritemap_Yard_1B                                           ;A3CC0E;
    dw $0003,Spritemap_Yard_1D                                           ;A3CC12;
    dw $0003,Spritemap_Yard_1F                                           ;A3CC16;
    dw Instruction_Common_GotoY                                          ;A3CC1A;
    dw InstList_Yard_Airborne_FacingLeft_1                               ;A3CC1C;


;;; $CC1E: Instruction list - airborne - facing right ;;;
InstList_Yard_Airborne_FacingRight_0:
    dw Instruction_Yard_MovementFunctionInY                              ;A3CC1E;
    dw Function_Yard_Movement_Airborne                                   ;A3CC20;
    dw $0003,Spritemap_Yard_3F                                           ;A3CC22;

InstList_Yard_Airborne_FacingRight_1:
    dw $0003,Spritemap_Yard_3B                                           ;A3CC26;
    dw $0003,Spritemap_Yard_3D                                           ;A3CC2A;
    dw $0003,Spritemap_Yard_3F                                           ;A3CC2E;
    dw Instruction_Common_GotoY                                          ;A3CC32;
    dw InstList_Yard_Airborne_FacingRight_1                              ;A3CC34;


;;; $CC36: Instruction - enemy movement function = [[Y]] ;;;
Instruction_Yard_MovementFunctionInY:
    LDA.W $0000,Y                                                        ;A3CC36;
    STA.W Yard.movementFunction,X                                        ;A3CC39;
    INY                                                                  ;A3CC3C;
    INY                                                                  ;A3CC3D;
    RTL                                                                  ;A3CC3E;


;;; $CC3F: Instruction - enemy hiding instruction list = [[Y]] ;;;
Instruction_Yard_HidingInstListInY:
    LDA.W $0000,Y                                                        ;A3CC3F;
    STA.W Yard.hidingInstList,X                                          ;A3CC42;
    INY                                                                  ;A3CC45;
    INY                                                                  ;A3CC46;
    RTL                                                                  ;A3CC47;


;;; $CC48: Instruction - set enemy direction to [[Y]] ;;;
Instruction_Yard_DirectionInY:
    PHY                                                                  ;A3CC48;
    LDA.W $0000,Y                                                        ;A3CC49;
    STA.L Yard.direction,X                                               ;A3CC4C;
    ASL                                                                  ;A3CC50;
    ASL                                                                  ;A3CC51;
    ASL                                                                  ;A3CC52;
    TAY                                                                  ;A3CC53;
    LDA.W YardDirectionData_airborneFacingDirection,Y                    ;A3CC54;
    STA.L Enemy.var2,X                                                   ;A3CC57;
    PLY                                                                  ;A3CC5B;
    INY                                                                  ;A3CC5C;
    INY                                                                  ;A3CC5D;
    RTL                                                                  ;A3CC5E;


;;; $CC5F: Instruction - move ([[Y]], [[Y] + 2]) pixels ;;;
Instruction_Yard_MoveByPixelsInY:
    LDA.W $0000,Y                                                        ;A3CC5F;
    CLC                                                                  ;A3CC62;
    ADC.W Enemy.XPosition,X                                              ;A3CC63;
    STA.W Enemy.XPosition,X                                              ;A3CC66;
    LDA.W $0002,Y                                                        ;A3CC69;
    CLC                                                                  ;A3CC6C;
    ADC.W Enemy.YPosition,X                                              ;A3CC6D;
    STA.W Enemy.YPosition,X                                              ;A3CC70;
    INY                                                                  ;A3CC73;
    INY                                                                  ;A3CC74;
    INY                                                                  ;A3CC75;
    INY                                                                  ;A3CC76;
    RTL                                                                  ;A3CC77;


;;; $CC78: Instruction - go back 4 bytes if hiding or with 50% chance ;;;
Instruction_Yard_GoBack4BytesIfHidingOr50PercentChance:
    LDA.L Yard.behavior,X                                                ;A3CC78;
    CMP.W #$0002                                                         ;A3CC7C;
    BEQ .goBack                                                          ;A3CC7F;
    JSL.L GenerateRandomNumber                                           ;A3CC81;
    BIT.W #$0001                                                         ;A3CC85;
    BNE .goBack                                                          ;A3CC88;
    RTL                                                                  ;A3CC8A;

  .goBack:
    TYA                                                                  ;A3CC8B;
    SEC                                                                  ;A3CC8C;
    SBC.W #$0006                                                         ;A3CC8D;
    TAY                                                                  ;A3CC90;
    RTL                                                                  ;A3CC91;


if !FEATURE_KEEP_UNREFERENCED
;;; $CC92: Unused. Instruction - make yard face Samus ;;;
UNUSED_Instruction_Yard_A3CC92:
; Wild NOP appears!
    NOP                                                                  ;A3CC92;
    PHY                                                                  ;A3CC93;
    JSL.L UNUSED_MakeYardFaceSamus_A3D315                                ;A3CC94;
    BCC .notTurningAround                                                ;A3CC98;
    PLY                                                                  ;A3CC9A;
    LDA.W Enemy.instList,X                                               ;A3CC9B;
    TAY                                                                  ;A3CC9E;
    RTL                                                                  ;A3CC9F;

  .notTurningAround:
    PLY                                                                  ;A3CCA0;
    RTL                                                                  ;A3CCA1;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $CCA2: Yard crawling speeds ;;;
YardCrawlingSpeeds:
; Unit 1/100h px/frame. Indexed by [enemy parameter 1] * 2
    dw $0040,$0080,$00C0,$0100,$0140,$0180,$01C0,$0200                   ;A3CCA2;
    dw $0240,$0280,$02C0,$0300,$0340,$0380,$0400,$0440                   ;A3CCB2;
    dw $0540,$0580,$05C0,$0600,$0640,$0680,$06C0,$0700                   ;A3CCC2;
    dw $0740,$0780,$07C0,$0800,$0840,$0880,$0800,$0000                   ;A3CCD2;


;;; $CCE2: Yard turn data ;;;
YardTurnData:
;        ___________ Outside turn lookahead X offset
;       |      _____ Outside turn lookahead Y offset
;       |     |
  .upsideUp_movingLeft:
    dw $FFF9,$0000                                                       ;A3CCE2;
    dw InstList_Yard_OutsideTurn_UpsideUp_MovingLeft                     ;A3CCE6;
    dw InstList_Yard_InsideTurn_UpsideUp_MovingLeft                      ;A3CCE8;

  .upsideLeft_movingDown:
    dw $0000,$0007                                                       ;A3CCEA;
    dw InstList_Yard_OutsideTurn_UpsideLeft_MovingDown                   ;A3CCEE;
    dw InstList_Yard_InsideTurn_UpsideLeft_MovingDown                    ;A3CCF0;

  .upsideDown_movingRight:
    dw $0007,$0000                                                       ;A3CCF2;
    dw InstList_Yard_OutsideTurn_UpsideDown_MovingRight                  ;A3CCF6;
    dw InstList_Yard_InsideTurn_UpsideDown_MovingRight                   ;A3CCF8;

  .upsideRight_movingUp:
    dw $0000,$FFF9                                                       ;A3CCFA;
    dw InstList_Yard_OutsideTurn_UpsideRight_MovingUp                    ;A3CCFE;
    dw InstList_Yard_InsideTurn_UpsideRight_MovingUp                     ;A3CD00;

  .upsideUp_movingRight:
    dw $0007,$0000                                                       ;A3CD02;
    dw InstList_Yard_OutsideTurn_UpsideUp_MovingRight                    ;A3CD06;
    dw InstList_Yard_InsideTurn_UpsideUp_MovingRight                     ;A3CD08;

  .upsideRight_movingDown:
    dw $0000,$0007                                                       ;A3CD0A;
    dw InstList_Yard_OutsideTurn_UpsideRight_MovingDown                  ;A3CD0E;
    dw InstList_Yard_InsideTurn_UpsideRight_MovingDown                   ;A3CD10;

  .upsideDown_movingLeft:
    dw $FFF9,$0000                                                       ;A3CD12;
    dw InstList_Yard_OutsideTurn_UpsideDown_MovingLeft                   ;A3CD16;
    dw InstList_Yard_InsideTurn_UpsideDown_MovingLeft                    ;A3CD18;

  .upsideLeft_movingUp:
    dw $0000,$FFF9                                                       ;A3CD1A;
    dw InstList_Yard_OutsideTurn_UpsideLeft_MovingUp                     ;A3CD1E;
    dw InstList_Yard_InsideTurn_UpsideLeft_MovingUp                      ;A3CD20;

  .upsideUp_movingLeft_noTurnTransition:
    dw $0000,$0000                                                       ;A3CD22;
    dw InstList_Yard_Crawling_UpsideLeft_MovingDown                      ;A3CD26;
    dw InstList_Yard_Crawling_UpsideRight_MovingUp                       ;A3CD28;

  .upsideDown_movingRight_noTurnTransition:
    dw $0000,$0000                                                       ;A3CD2A;
    dw InstList_Yard_Crawling_UpsideRight_MovingUp                       ;A3CD2E;
    dw InstList_Yard_Crawling_UpsideLeft_MovingDown                      ;A3CD30;

  .upsideUp_movingRight_noTurnTransition:
    dw $0000,$0000                                                       ;A3CD32;
    dw InstList_Yard_Crawling_UpsideRight_MovingDown                     ;A3CD36;
    dw InstList_Yard_Crawling_UpsideLeft_MovingUp                        ;A3CD38;

  .upsideDown_movingLeft_noTurnTransition:
    dw $0000,$0000                                                       ;A3CD3A;
    dw InstList_Yard_Crawling_UpsideLeft_MovingUp                        ;A3CD3E;
    dw InstList_Yard_Crawling_UpsideRight_MovingDown                     ;A3CD40;


;;; $CD42: Yard direction data ;;;
YardDirectionData:
; Indexed by [enemy direction] * 8

;              _______________ Movement direction. Not meaningfully used
;             |            ___ Airborne facing direction
;             |           |
  .crawlingInstList:
    dw InstList_Yard_Crawling_UpsideRight_MovingUp                       ;A3CD42;
  .movementDirection:
    dw       $0002                                                       ;A3CD44;
  .hidingInstList:
    dw InstList_Yard_Hiding_UpsideRight_MovingUp                         ;A3CD46;
  .airborneFacingDirection:
    dw                    $0000                                          ;A3CD48;

    dw InstList_Yard_Crawling_UpsideRight_MovingDown                     ;A3CD4A;
    dw       $0003                                                       ;A3CD4C;
    dw InstList_Yard_Hiding_UpsideRight_MovingDown                       ;A3CD4E;
    dw                    $0001                                          ;A3CD50;

    dw InstList_Yard_Crawling_UpsideLeft_MovingUp                        ;A3CD52;
    dw       $0002                                                       ;A3CD54;
    dw InstList_Yard_Hiding_UpsideLeft_MovingUp                          ;A3CD56;
    dw                    $0001                                          ;A3CD58;

    dw InstList_Yard_Crawling_UpsideLeft_MovingDown                      ;A3CD5A;
    dw       $0003                                                       ;A3CD5C;
    dw InstList_Yard_Hiding_UpsideLeft_MovingDown                        ;A3CD5E;
    dw                    $0000                                          ;A3CD60;

    dw InstList_Yard_Crawling_UpsideDown_MovingLeft                      ;A3CD62;
    dw       $0000                                                       ;A3CD64;
    dw InstList_Yard_Hiding_UpsideDown_MovingLeft                        ;A3CD66;
    dw                    $0001                                          ;A3CD68;

    dw InstList_Yard_Crawling_UpsideDown_MovingRight                     ;A3CD6A;
    dw       $0001                                                       ;A3CD6C;
    dw InstList_Yard_Hiding_UpsideDown_MovingRight                       ;A3CD6E;
    dw                    $0000                                          ;A3CD70;

    dw InstList_Yard_Crawling_UpsideUp_MovingLeft                        ;A3CD72;
    dw       $0000                                                       ;A3CD74;
    dw InstList_Yard_Hiding_UpsideUp_MovingLeft                          ;A3CD76;
    dw                    $0000                                          ;A3CD78;

    dw InstList_Yard_Crawling_UpsideUp_MovingRight                       ;A3CD7A;
    dw       $0001                                                       ;A3CD7C;
    dw InstList_Yard_Hiding_UpsideUp_MovingRight                         ;A3CD7E;
    dw                    $0001                                          ;A3CD80;


;;; $CD82: Yard crawling velocity signs ;;;
YardCrawlingVelocitySigns:
; 0000,0000 = positive
; FFFF,0001 = negative

;        ____________________ X velocity
;       |            ________ Y velocity
;       |           |
  .X:                                                                    ;A3CD82;
    dw $FFFF,$0001
  .Y:                                                                    ;A3CD86;
    dw             $FFFF,$0001
    dw $FFFF,$0001,$0000,$0000
    dw $0000,$0000,$FFFF,$0001
    dw $0000,$0000,$0000,$0000
    dw $FFFF,$0001,$FFFF,$0001
    dw $0000,$0000,$FFFF,$0001
    dw $FFFF,$0001,$0000,$0000
    dw $0000,$0000,$0000,$0000


;;; $CDC2: Yard opposite directions ;;;
YardOppositeDirection:                                                   ;A3CDC2;
    dw $0001 ; 0: Upside right - moving up
    dw $0000 ; 1: Upside right - moving down
    dw $0003 ; 2: Upside left-   moving up
    dw $0002 ; 3: Upside left-   moving down
    dw $0005 ; 4: Upside down-   moving left
    dw $0004 ; 5: Upside down-   moving right
    dw $0007 ; 6: Upside up  -   moving left
    dw $0006 ; 7: Upside up  -   moving right


;;; $CDD2: Yard crawling movement functions ;;;
YardCrawlingMovementFunctions:
; Indexed by [enemy $7E:780E] * 2
    dw Function_Yard_Movement_Crawling_UpsideDown_MovingLeft             ;A3CDD2;
    dw Function_Yard_Movement_Crawling_UpsideRight_MovingDown            ;A3CDD4;
    dw Function_Yard_Movement_Crawling_UpsideLeft_MovingUp               ;A3CDD6;
    dw Function_Yard_Movement_Crawling_UpsideLeft_MovingDown             ;A3CDD8; <-- points to upside right - moving up
    dw Function_Yard_Movement_Crawling_UpsideRight_MovingUp              ;A3CDDA;
    dw Function_Yard_Movement_Crawling_UpsideDown_MovingRight            ;A3CDDC;
    dw Function_Yard_Movement_Crawling_UpsideUp_MovingLeft               ;A3CDDE; <-- points to upside down - moving left
    dw Function_Yard_Movement_Crawling_UpsideUp_MovingRight              ;A3CDE0;


;;; $CDE2: Initialisation AI - enemy $DBBF (yard) ;;;
InitAI_Yard:
    LDX.W EnemyIndex                                                     ;A3CDE2;
    LDA.W #RTL_A3CF5F                                                    ;A3CDE5;
    STA.W Yard.movementFunction,X                                        ;A3CDE8;
    LDA.W #Spritemap_Common_Nothing                                      ;A3CDEB;
    STA.W Enemy.spritemap,X                                              ;A3CDEE;
    LDA.W #$0001                                                         ;A3CDF1;
    STA.W Enemy.instTimer,X                                              ;A3CDF4;
    LDA.W Enemy.instList,X                                               ;A3CDF7;
    ASL                                                                  ;A3CDFA;
    ASL                                                                  ;A3CDFB;
    ASL                                                                  ;A3CDFC;
    TAY                                                                  ;A3CDFD;
    LDA.W YardDirectionData_crawlingInstList,Y                           ;A3CDFE;
    STA.W Enemy.instList,X                                               ;A3CE01;
    LDA.W YardDirectionData_movementDirection,Y                          ;A3CE04;
    ORA.W Enemy.properties,X                                             ;A3CE07;
    STA.W Enemy.properties,X                                             ;A3CE0A;
    LDA.W YardDirectionData_hidingInstList,Y                             ;A3CE0D;
    STA.W Yard.hidingInstList,X                                          ;A3CE10;
    LDA.W YardDirectionData_airborneFacingDirection,Y                    ;A3CE13;
    STA.W Yard.airborneFacingDirection,X                                 ;A3CE16;
    LDA.W #$0000                                                         ;A3CE19;
    STA.L Yard.behavior,X                                                ;A3CE1C;
    LDA.W Yard.crawlingSpeedTableIndex,X                                 ;A3CE20;
    STA.L Yard.idleCrawlingSpeedTableIndex,X                             ;A3CE23; fallthrough to SetYardCrawlingVelocities


;;; $CE27: Set yard crawling velocities ;;;
SetYardCrawlingVelocities:
;; Parameters:
;;     Y: Direction * 8
    LDA.W YardCrawlingVelocitySigns_X,Y                                  ;A3CE27;
    STA.B DP_Temp12                                                      ;A3CE2A;
    LDA.W YardCrawlingVelocitySigns_X+2,Y                                ;A3CE2C;
    STA.B DP_Temp14                                                      ;A3CE2F;
    LDA.W YardCrawlingVelocitySigns_Y,Y                                  ;A3CE31;
    STA.B DP_Temp16                                                      ;A3CE34;
    LDA.W YardCrawlingVelocitySigns_Y+2,Y                                ;A3CE36;
    STA.B DP_Temp18                                                      ;A3CE39;
    LDA.W Yard.crawlingSpeedTableIndex,X                                 ;A3CE3B;
    ASL                                                                  ;A3CE3E;
    TAY                                                                  ;A3CE3F;
    LDA.W YardCrawlingSpeeds,Y                                           ;A3CE40;
    EOR.B DP_Temp12                                                      ;A3CE43;
    CLC                                                                  ;A3CE45;
    ADC.B DP_Temp14                                                      ;A3CE46;
    STA.W Yard.crawlingXVelocity,X                                       ;A3CE48;
    LDA.W YardCrawlingSpeeds,Y                                           ;A3CE4B;
    EOR.B DP_Temp16                                                      ;A3CE4E;
    CLC                                                                  ;A3CE50;
    ADC.B DP_Temp18                                                      ;A3CE51;
    STA.W Yard.crawlingYVelocity,X                                       ;A3CE53;
    RTL                                                                  ;A3CE56;


;;; $CE57: Set yard crawling movement function ;;;
SetYardCrawlingMovementFunction:
    LDA.L Yard.direction,X                                               ;A3CE57;
    ASL                                                                  ;A3CE5B;
    TAY                                                                  ;A3CE5C;
    LDA.W YardCrawlingMovementFunctions,Y                                ;A3CE5D;
    STA.W Yard.movementFunction,X                                        ;A3CE60;
    RTL                                                                  ;A3CE63;


;;; $CE64: Main AI - enemy $DBBF (yard) ;;;
MainAI_Yard:
    LDX.W EnemyIndex                                                     ;A3CE64;
    JSR.W DropYardIfSuperMissileQuake                                    ;A3CE67;
    JSR.W HandleYardHiding                                               ;A3CE6A;
    JSR.W DetermineIfYardHitboxIsSolidToSamus                            ;A3CE6D;
    JMP.W (Yard.movementFunction,X)                                      ;A3CE70;


;;; $CE73: Drop yard if super missile quake ;;;
DropYardIfSuperMissileQuake:
    LDA.L Yard.behavior,X                                                ;A3CE73;
    CMP.W #$0003                                                         ;A3CE77;
    BEQ .return                                                          ;A3CE7A;
    CMP.W #$0004                                                         ;A3CE7C;
    BEQ .return                                                          ;A3CE7F;
    CMP.W #$0005                                                         ;A3CE81;
    BEQ .return                                                          ;A3CE84;
    LDA.W EarthquakeTimer                                                ;A3CE86;
    CMP.W #$001E                                                         ;A3CE89;
    BNE .return                                                          ;A3CE8C;
    LDA.W EarthquakeType                                                 ;A3CE8E;
    CMP.W #$0014                                                         ;A3CE91;
    BNE .return                                                          ;A3CE94;
    JSR.W DropYard                                                       ;A3CE96;

  .return:
    RTS                                                                  ;A3CE99;


;;; $CE9A: Handle yard hiding ;;;
HandleYardHiding:
    LDA.L Yard.behavior,X                                                ;A3CE9A;
    CMP.W #$0001                                                         ;A3CE9E;
    BEQ .return1                                                         ;A3CEA1;
    CMP.W #$0003                                                         ;A3CEA3;
    BEQ .return1                                                         ;A3CEA6;
    CMP.W #$0004                                                         ;A3CEA8;
    BEQ .return1                                                         ;A3CEAB;
    CMP.W #$0005                                                         ;A3CEAD;
    BEQ .return1                                                         ;A3CEB0;
    LDA.W Enemy.YPosition,X                                              ;A3CEB2;
    SEC                                                                  ;A3CEB5;
    SBC.W SamusYPosition                                                 ;A3CEB6;
    CMP.W #$FFA0                                                         ;A3CEB9;
    BMI .crawl                                                           ;A3CEBC;
    LDA.W Enemy.XPosition,X                                              ;A3CEBE;
    CMP.W SamusXPosition                                                 ;A3CEC1;
    BMI .leftOfSamus                                                     ;A3CEC4;
    LDA.W PoseXDirection                                                 ;A3CEC6;
    AND.W #$00FF                                                         ;A3CEC9;
    CMP.W #$0008                                                         ;A3CECC;
    BNE .crawl                                                           ;A3CECF;
    BRA +                                                                ;A3CED1;

  .leftOfSamus:
    LDA.W PoseXDirection                                                 ;A3CED3;
    AND.W #$00FF                                                         ;A3CED6;
    CMP.W #$0004                                                         ;A3CED9;
    BNE .crawl                                                           ;A3CEDC;

+   LDA.L Yard.behavior,X                                                ;A3CEDE;
    CMP.W #$0002                                                         ;A3CEE2;
    BEQ .return0                                                         ;A3CEE5;
    LDA.W Yard.hidingInstList,X                                          ;A3CEE7;
    CMP.W #RTL_A3CF5F                                                    ;A3CEEA;
    BEQ .crawl                                                           ;A3CEED;
    STA.W Enemy.instList,X                                               ;A3CEEF;
    LDA.W #Spritemap_Common_Nothing                                      ;A3CEF2;
    STA.W Enemy.spritemap,X                                              ;A3CEF5;
    LDA.W #$0001                                                         ;A3CEF8;
    STA.W Enemy.instTimer,X                                              ;A3CEFB;
    STZ.W Enemy.loopCounter,X                                            ;A3CEFE;
    LDA.W #$0002                                                         ;A3CF01;
    STA.L Yard.behavior,X                                                ;A3CF04;

  .return0:
    RTS                                                                  ;A3CF08;

  .crawl:
    LDA.W #$0000                                                         ;A3CF09;
    STA.L Yard.behavior,X                                                ;A3CF0C;

  .return1:
    RTS                                                                  ;A3CF10;


;;; $CF11: Determine if yard hitbox is solid to Samus ;;;
DetermineIfYardHitboxIsSolidToSamus:
    LDA.W Yard.movementFunction,X                                        ;A3CF11;
    CMP.W #Function_Yard_Movement_Airborne                               ;A3CF14;
    BEQ .notSolid                                                        ;A3CF17;
    LDA.L Yard.behavior,X                                                ;A3CF19;
    CMP.W #$0001                                                         ;A3CF1D;
    BEQ .aggressivelyCrawling                                            ;A3CF20;
    LDA.W SamusRunningMomentumFlag                                       ;A3CF22;
    BNE .notSolid                                                        ;A3CF25;
    LDA.L Yard.behavior,X                                                ;A3CF27;
    CMP.W #$0002                                                         ;A3CF2B;
    BEQ .solid                                                           ;A3CF2E;
    CMP.W #$0003                                                         ;A3CF30;
    BEQ .notSolid                                                        ;A3CF33;
    CMP.W #$0005                                                         ;A3CF35;
    BNE .solid                                                           ;A3CF38;
    BRA .notSolid                                                        ;A3CF3A;

  .aggressivelyCrawling:
    LDA.W SamusRunningMomentumFlag                                       ;A3CF3C;
    BNE .notSolid                                                        ;A3CF3F;
    LDA.W Yard.movementFunction,X                                        ;A3CF41;
    CMP.W #RTL_A3CF5F                                                    ;A3CF44;
    BEQ .solid                                                           ;A3CF47;
    BRA .notSolid                                                        ;A3CF49;

  .solid:
    LDA.W Enemy.properties,X                                             ;A3CF4B;
    ORA.W #$8000                                                         ;A3CF4E;
    STA.W Enemy.properties,X                                             ;A3CF51;
    RTS                                                                  ;A3CF54;

  .notSolid:
    LDA.W Enemy.properties,X                                             ;A3CF55;
    AND.W #$7FFF                                                         ;A3CF58;
    STA.W Enemy.properties,X                                             ;A3CF5B;
    RTS                                                                  ;A3CF5E;


;;; $CF5F: RTL ;;;
RTL_A3CF5F:
; Also used as dummy hiding instruction list pointer
    RTL                                                                  ;A3CF5F;


;;; $CF60: Yard movement function - hiding ;;;
Function_Yard_Movement_Hiding:
    LDA.L Yard.direction,X                                               ;A3CF60;
    CMP.W #$0004                                                         ;A3CF64;
    BCS .notMovingVertically                                             ;A3CF67;
    STZ.B DP_Temp12                                                      ;A3CF69;
    STZ.B DP_Temp14                                                      ;A3CF6B;
    LDA.W Yard.crawlingXVelocity,X                                       ;A3CF6D;
    JSR.W SignedMath_A3CF8F                                              ;A3CF70;
    JSL.L CheckForHorizontalSolidBlockCollision                          ;A3CF73;
    BCC .noCollision                                                     ;A3CF77;
    RTL                                                                  ;A3CF79;

  .notMovingVertically:
    STZ.B DP_Temp12                                                      ;A3CF7A;
    STZ.B DP_Temp14                                                      ;A3CF7C;
    LDA.W Yard.crawlingYVelocity,X                                       ;A3CF7E;
    JSR.W SignedMath_A3CF8F                                              ;A3CF81;
    JSL.L CheckForVerticalSolidBlockCollision                            ;A3CF84;
    BCC .noCollision                                                     ;A3CF88;
    RTL                                                                  ;A3CF8A;

  .noCollision:
    JSR.W DropYard                                                       ;A3CF8B;
    RTL                                                                  ;A3CF8E;


;;; $CF8F: $14.$12 = ±[A] / 100h + 7 * sgn([A]) ;;;
SignedMath_A3CF8F:
; Requires $14.$12 to be set to 0.0 first
    BPL +                                                                ;A3CF8F;
    DEC.B DP_Temp14                                                      ;A3CF91;

+   STA.B DP_Temp13                                                      ;A3CF93;
    LDA.B DP_Temp14                                                      ;A3CF95;
    BPL .add7                                                            ;A3CF97;
    SEC                                                                  ;A3CF99;
    SBC.W #$0007                                                         ;A3CF9A;
    BRA +                                                                ;A3CF9D;

  .add7:
    CLC                                                                  ;A3CF9F;
    ADC.W #$0007                                                         ;A3CFA0;

+   STA.B DP_Temp14                                                      ;A3CFA3;
    RTS                                                                  ;A3CFA5;


;;; $CFA6: Yard movement function - crawling - upside up - moving left ;;;
Function_Yard_Movement_Crawling_UpsideUp_MovingLeft:
    LDA.L Yard.turnTransitionDisableFlag,X                               ;A3CFA6;
    BNE .upsideUpMovingLeftNoTurnTransition                              ;A3CFAA;
    LDY.W #YardTurnData_upsideUp_movingLeft                              ;A3CFAC;
    BRA .gotoCrawlingMovementHorizontal                                  ;A3CFAF;

  .upsideUpMovingLeftNoTurnTransition:
    LDY.W #YardTurnData_upsideUp_movingLeft_noTurnTransition             ;A3CFB1;

  .gotoCrawlingMovementHorizontal:
    JMP.W YardCrawlingMovement_Horizontal                                ;A3CFB4;


;;; $CFB7: Yard movement function - crawling - upside left - moving down ;;;
Function_Yard_Movement_Crawling_UpsideLeft_MovingDown:
    LDY.W #YardTurnData_upsideLeft_movingDown                            ;A3CFB7;
    JMP.W YardCrawlingMovement_Vertical                                  ;A3CFBA;


;;; $CFBD: Yard movement function - crawling - upside down - moving right ;;;
Function_Yard_Movement_Crawling_UpsideDown_MovingRight:
    LDA.L Yard.turnTransitionDisableFlag,X                               ;A3CFBD;
    BNE .upsideDownMovingRightNoTurnTransition                           ;A3CFC1;
    LDY.W #YardTurnData_upsideDown_movingRight                           ;A3CFC3;
    BRA .gotoCrawlingMovementHorizontal                                  ;A3CFC6;

  .upsideDownMovingRightNoTurnTransition:
    LDY.W #YardTurnData_upsideDown_movingRight_noTurnTransition          ;A3CFC8;

  .gotoCrawlingMovementHorizontal:
    JMP.W YardCrawlingMovement_Horizontal                                ;A3CFCB;


;;; $CFCE: Yard movement function - crawling - upside right - moving up ;;;
Function_Yard_Movement_Crawling_UpsideRight_MovingUp:
    LDY.W #YardTurnData_upsideRight_movingUp                             ;A3CFCE;
    JMP.W YardCrawlingMovement_Vertical                                  ;A3CFD1;


;;; $CFD4: Yard movement function - crawling - upside up - moving right ;;;
Function_Yard_Movement_Crawling_UpsideUp_MovingRight:
    LDA.L Yard.turnTransitionDisableFlag,X                               ;A3CFD4;
    BNE .upsideUpMovingRightNoTurnTransition                             ;A3CFD8;
    LDY.W #YardTurnData_upsideUp_movingRight                             ;A3CFDA;
    BRA .gotoCrawlingMovementHorizontal                                  ;A3CFDD;

  .upsideUpMovingRightNoTurnTransition:
    LDY.W #YardTurnData_upsideUp_movingRight_noTurnTransition            ;A3CFDF;

  .gotoCrawlingMovementHorizontal:
    JMP.W YardCrawlingMovement_Horizontal                                ;A3CFE2;


;;; $CFE5: Yard movement function - crawling - upside right - moving down ;;;
Function_Yard_Movement_Crawling_UpsideRight_MovingDown:
    LDY.W #YardTurnData_upsideRight_movingDown                           ;A3CFE5;
    JMP.W YardCrawlingMovement_Vertical                                  ;A3CFE8;


;;; $CFEB: Yard movement function - crawling - upside down - moving left ;;;
Function_Yard_Movement_Crawling_UpsideDown_MovingLeft:
    LDA.L Yard.turnTransitionDisableFlag,X                               ;A3CFEB;
    BNE .upsideDownMovingLeftNoTurnTransition                            ;A3CFEF;
    LDY.W #YardTurnData_upsideDown_movingLeft                            ;A3CFF1;
    BRA .gotoCrawlingMovementHorizontal                                  ;A3CFF4;

  .upsideDownMovingLeftNoTurnTransition:
    LDY.W #YardTurnData_upsideDown_movingLeft_noTurnTransition           ;A3CFF6;

  .gotoCrawlingMovementHorizontal:
    JMP.W YardCrawlingMovement_Horizontal                                ;A3CFF9;


;;; $CFFC: Yard movement function - crawling - upside left - moving up ;;;
Function_Yard_Movement_Crawling_UpsideLeft_MovingUp:
    LDY.W #YardTurnData_upsideLeft_movingUp                              ;A3CFFC;
    JMP.W YardCrawlingMovement_Vertical                                  ;A3CFFF;


;;; $D002: Yard crawling movement - vertical ;;;
YardCrawlingMovement_Vertical:
;; Parameters:
;;     Y: Pointer to turn data entry (see YardTurnData)
    JSR.W MoveYardAheadForOutsideTurnCheck                               ;A3D002;
    STZ.B DP_Temp12                                                      ;A3D005;
    STZ.B DP_Temp14                                                      ;A3D007;
    LDA.W Yard.crawlingXVelocity,X                                       ;A3D009;
    BPL +                                                                ;A3D00C;
    DEC.B DP_Temp14                                                      ;A3D00E;

+   STA.B DP_Temp13                                                      ;A3D010;
    LDA.B DP_Temp14                                                      ;A3D012;
    BPL .inc                                                             ;A3D014;
    DEC                                                                  ;A3D016;
    BRA +                                                                ;A3D017;

  .inc:
    INC                                                                  ;A3D019;

+   STA.B DP_Temp14                                                      ;A3D01A;
    PHY                                                                  ;A3D01C;
    JSL.L MoveEnemyRightBy_14_12_ProcessSlopes                           ;A3D01D;
    PLY                                                                  ;A3D021;
    JSR.W MoveYardBackForOutsideTurnCheck                                ;A3D022;
    BCC .outsideTurn                                                     ;A3D025;
    LDA.W #$0000                                                         ;A3D027;
    STA.W Yard.consequtiveTurnCounter,X                                  ;A3D02A;
    PHY                                                                  ;A3D02D;
    JSL.L AlignEnemyYPositionWIthNonSquareSlope                          ;A3D02E;
    PLY                                                                  ;A3D032;
    JSR.W HandleTurnTransitionDisabling                                  ;A3D033;
    STZ.B DP_Temp12                                                      ;A3D036;
    STZ.B DP_Temp14                                                      ;A3D038;
    LDA.W Yard.crawlingYVelocity,X                                       ;A3D03A;
    BPL +                                                                ;A3D03D;
    DEC.B DP_Temp14                                                      ;A3D03F;

+   STA.B DP_Temp13                                                      ;A3D041;
    PHY                                                                  ;A3D043;
    JSL.L MoveEnemyDownBy_14_12                                          ;A3D044;
    PLY                                                                  ;A3D048;
    BCS .insideTurn                                                      ;A3D049;
    RTL                                                                  ;A3D04B;

  .insideTurn:
    LDA.W Yard.crawlingXVelocity,X                                       ;A3D04C;
    EOR.W #$FFFF                                                         ;A3D04F;
    INC                                                                  ;A3D052;
    STA.W Yard.crawlingXVelocity,X                                       ;A3D053;
    LDA.W $0006,Y                                                        ;A3D056;
    JSR.W SetYardInstList_DisableTurnTransition                          ;A3D059;
    RTL                                                                  ;A3D05C;

  .outsideTurn:
    LDA.W Yard.consequtiveTurnCounter,X                                  ;A3D05D;
    INC                                                                  ;A3D060;
    STA.W Yard.consequtiveTurnCounter,X                                  ;A3D061;
    CMP.W #$0004                                                         ;A3D064;
    BMI .lessThan4Turns                                                  ;A3D067;
    JSR.W DropYard                                                       ;A3D069;
    RTL                                                                  ;A3D06C;

  .lessThan4Turns:
    LDA.W Yard.crawlingYVelocity,X                                       ;A3D06D;
    EOR.W #$FFFF                                                         ;A3D070;
    INC                                                                  ;A3D073;
    STA.W Yard.crawlingYVelocity,X                                       ;A3D074;
    LDA.W $0004,Y                                                        ;A3D077;
    JSR.W SetYardInstList_DisableTurnTransition                          ;A3D07A;
    RTL                                                                  ;A3D07D;


;;; $D07E: Yard crawling movement - horizontal ;;;
YardCrawlingMovement_Horizontal:
;; Parameters:
;;     Y: Pointer to turn data entry (see YardTurnData)
    JSR.W MoveYardAheadForOutsideTurnCheck                               ;A3D07E;
    STZ.B DP_Temp12                                                      ;A3D081;
    STZ.B DP_Temp14                                                      ;A3D083;
    LDA.W Yard.crawlingYVelocity,X                                       ;A3D085;
    BPL +                                                                ;A3D088;
    DEC.B DP_Temp14                                                      ;A3D08A;

+   STA.B DP_Temp13                                                      ;A3D08C;
    LDA.B DP_Temp14                                                      ;A3D08E;
    BPL .inc                                                             ;A3D090;
    DEC                                                                  ;A3D092;
    BRA +                                                                ;A3D093;

  .inc:
    INC                                                                  ;A3D095;

+   STA.B DP_Temp14                                                      ;A3D096;
    PHY                                                                  ;A3D098;
    JSL.L MoveEnemyDownBy_14_12                                          ;A3D099;
    PLY                                                                  ;A3D09D;
    JSR.W MoveYardBackForOutsideTurnCheck                                ;A3D09E;
    BCC .outsideTurn                                                     ;A3D0A1;
    LDA.W #$0000                                                         ;A3D0A3;
    STA.W Yard.consequtiveTurnCounter,X                                  ;A3D0A6;
    STZ.B DP_Temp12                                                      ;A3D0A9;
    STZ.B DP_Temp14                                                      ;A3D0AB;
    LDA.W Yard.crawlingXVelocity,X                                       ;A3D0AD;
    BPL +                                                                ;A3D0B0;
    DEC.B DP_Temp14                                                      ;A3D0B2;

+   STA.B DP_Temp13                                                      ;A3D0B4;
    PHY                                                                  ;A3D0B6;
    JSL.L MoveEnemyRightBy_14_12_ProcessSlopes                           ;A3D0B7;
    PLY                                                                  ;A3D0BB;
    BCS .insideTurn                                                      ;A3D0BC;
    JSL.L AlignEnemyYPositionWIthNonSquareSlope                          ;A3D0BE;
    JSR.W HandleTurnTransitionDisabling                                  ;A3D0C2;
    RTL                                                                  ;A3D0C5;

  .insideTurn:
    LDA.W Yard.crawlingYVelocity,X                                       ;A3D0C6;
    EOR.W #$FFFF                                                         ;A3D0C9;
    INC                                                                  ;A3D0CC;
    STA.W Yard.crawlingYVelocity,X                                       ;A3D0CD;
    LDA.W $0006,Y                                                        ;A3D0D0;
    JSR.W SetYardInstList_DisableTurnTransition                          ;A3D0D3;
    RTL                                                                  ;A3D0D6;

  .outsideTurn:
    LDA.W Yard.consequtiveTurnCounter,X                                  ;A3D0D7;
    INC                                                                  ;A3D0DA;
    STA.W Yard.consequtiveTurnCounter,X                                  ;A3D0DB;
    CMP.W #$0004                                                         ;A3D0DE;
    BMI .lessThan4Turns                                                  ;A3D0E1;
    JSR.W DropYard                                                       ;A3D0E3;
    RTL                                                                  ;A3D0E6;

  .lessThan4Turns:
    LDA.W Yard.crawlingXVelocity,X                                       ;A3D0E7;
    EOR.W #$FFFF                                                         ;A3D0EA;
    INC                                                                  ;A3D0ED;
    STA.W Yard.crawlingXVelocity,X                                       ;A3D0EE;
    LDA.W $0004,Y                                                        ;A3D0F1;
    JSR.W SetYardInstList_DisableTurnTransition                          ;A3D0F4;
    RTL                                                                  ;A3D0F7;


;;; $D0F8: Move enemy ahead for outside turn check ;;;
MoveYardAheadForOutsideTurnCheck:
;; Parameters:
;;     Y: Pointer to turn data entry (see YardTurnData)
    LDA.W Enemy.XPosition,X                                              ;A3D0F8;
    CLC                                                                  ;A3D0FB;
    ADC.W $0000,Y                                                        ;A3D0FC;
    STA.W Enemy.XPosition,X                                              ;A3D0FF;
    LDA.W Enemy.YPosition,X                                              ;A3D102;
    CLC                                                                  ;A3D105;
    ADC.W $0002,Y                                                        ;A3D106;
    STA.W Enemy.YPosition,X                                              ;A3D109;
    RTS                                                                  ;A3D10C;


;;; $D10D: Move enemy back from outside turn check ;;;
MoveYardBackForOutsideTurnCheck:
;; Parameters:
;;     Y: Pointer to turn data entry (see YardTurnData)
; Important that the carry flag is preserved here
    PHP                                                                  ;A3D10D;
    LDA.W Enemy.XPosition,X                                              ;A3D10E;
    SEC                                                                  ;A3D111;
    SBC.W $0000,Y                                                        ;A3D112;
    STA.W Enemy.XPosition,X                                              ;A3D115;
    LDA.W Enemy.YPosition,X                                              ;A3D118;
    SEC                                                                  ;A3D11B;
    SBC.W $0002,Y                                                        ;A3D11C;
    STA.W Enemy.YPosition,X                                              ;A3D11F;
    PLP                                                                  ;A3D122;
    RTS                                                                  ;A3D123;


;;; $D124: Handle turn transition disabling ;;;
HandleTurnTransitionDisabling:
;; Parameters:
;;     Carry: Set if position was adjusted by slope, otherwise clear
    BCS .resetTurnTransitionDisableCounter                               ;A3D124;
    LDA.L Yard.turnTransitionDisableCounter,X                            ;A3D126;
    INC                                                                  ;A3D12A;
    CMP.W #$0010                                                         ;A3D12B;
    BCS .enableTurnTransition                                            ;A3D12E;
    STA.L Yard.turnTransitionDisableCounter,X                            ;A3D130;
    RTS                                                                  ;A3D134;

  .resetTurnTransitionDisableCounter:
    LDA.W #$0001                                                         ;A3D135;
    STA.L Yard.turnTransitionDisableFlag,X                               ;A3D138;
    LDA.W #$0000                                                         ;A3D13C;
    STA.L Yard.turnTransitionDisableCounter,X                            ;A3D13F;
    RTS                                                                  ;A3D143;

  .enableTurnTransition:
    LDA.W #$0000                                                         ;A3D144;
    STA.L Yard.turnTransitionDisableFlag,X                               ;A3D147;
    RTS                                                                  ;A3D14B;


;;; $D14C: Set enemy instruction list and disable turn transition ;;;
SetYardInstList_DisableTurnTransition:
    STA.W Enemy.instList,X                                               ;A3D14C;
    LDA.W #$0001                                                         ;A3D14F;
    STA.W Enemy.instTimer,X                                              ;A3D152;
    LDA.W #$0001                                                         ;A3D155;
    STA.L Yard.turnTransitionDisableFlag,X                               ;A3D158;
    LDA.W #$0000                                                         ;A3D15C;
    STA.L Yard.turnTransitionDisableCounter,X                            ;A3D15F;
    RTS                                                                  ;A3D163;


;;; $D164: Drop yard ;;;
DropYard:
    PHY                                                                  ;A3D164;
    LDA.L Yard.behavior,X                                                ;A3D165;
    CMP.W #$0003                                                         ;A3D169;
    BEQ .return                                                          ;A3D16C;
    LDA.W #$0003                                                         ;A3D16E;
    STA.L Yard.behavior,X                                                ;A3D171;
    LDA.W #Function_Yard_Movement_Airborne                               ;A3D175;
    STA.W Yard.movementFunction,X                                        ;A3D178;
    LDA.W Yard.airborneFacingDirection,X                                 ;A3D17B;
    ASL                                                                  ;A3D17E;
    ASL                                                                  ;A3D17F;
    TAY                                                                  ;A3D180;
    LDA.W .airbornePointers,Y                                            ;A3D181;
    STA.W Enemy.instList,X                                               ;A3D184;
    LDA.W .hidingPointers,Y                                              ;A3D187;
    STA.W Yard.hidingInstList,X                                          ;A3D18A;
    LDA.W #$0001                                                         ;A3D18D;
    STA.W Enemy.instTimer,X                                              ;A3D190;
    STZ.W Enemy.loopCounter,X                                            ;A3D193;
    LDA.W #$0000                                                         ;A3D196;
    STA.L Yard.airborneXSubVelocity,X                                    ;A3D199;
    STA.L Yard.airborneXVelocity,X                                       ;A3D19D;
    STA.L Yard.airborneYSubVelocity,X                                    ;A3D1A1;
    STA.L Yard.airborneYVelocity,X                                       ;A3D1A5;

  .return:
    PLY                                                                  ;A3D1A9;
    RTS                                                                  ;A3D1AA;

  .airbornePointers:
    dw InstList_Yard_Airborne_FacingLeft_0                               ;A3D1AB;

  .hidingPointers:
    dw InstList_Yard_Hidden_UpsideUp_MovingLeft                          ;A3D1AD;
    dw InstList_Yard_Airborne_FacingRight_0                              ;A3D1AF;
    dw InstList_Yard_Hidden_UpsideUp_MovingRight                         ;A3D1B1;


;;; $D1B3: Yard movement function - airborne ;;;
Function_Yard_Movement_Airborne:
; Note the two fixed point negation operations at .hitWall and $D26D are off by 1.0 when the low word is zero
    LDA.L Yard.behavior,X                                                ;A3D1B3;
    CMP.W #$0003                                                         ;A3D1B7;
    BEQ .XMovementEnd                                                    ;A3D1BA;
    LDA.L Yard.airborneXSubVelocity,X                                    ;A3D1BC;
    STA.B DP_Temp12                                                      ;A3D1C0;
    LDA.L Yard.airborneXVelocity,X                                       ;A3D1C2;
    STA.B DP_Temp14                                                      ;A3D1C6;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A3D1C8;
    BCS .hitWall                                                         ;A3D1CC;
    LDA.L Yard.airborneXVelocity,X                                       ;A3D1CE;
    BMI .right                                                           ;A3D1D2;
    LDA.W #$1000                                                         ;A3D1D4;
    EOR.W #$FFFF                                                         ;A3D1D7;
    INC                                                                  ;A3D1DA;
    STA.B DP_Temp16                                                      ;A3D1DB;
    LDA.W #$0000                                                         ;A3D1DD;
    EOR.W #$FFFF                                                         ;A3D1E0;
    STA.B DP_Temp18                                                      ;A3D1E3;
    BRA +                                                                ;A3D1E5;

  .right:
    LDA.W #$1000                                                         ;A3D1E7;
    STA.B DP_Temp16                                                      ;A3D1EA;
    LDA.W #$0000                                                         ;A3D1EC;
    STA.B DP_Temp18                                                      ;A3D1EF;

+   CLC                                                                  ;A3D1F1;
    LDA.L Yard.airborneXSubVelocity,X                                    ;A3D1F2;
    ADC.B DP_Temp16                                                      ;A3D1F6;
    STA.L Yard.airborneXSubVelocity,X                                    ;A3D1F8;
    LDA.L Yard.airborneXVelocity,X                                       ;A3D1FC;
    ADC.B DP_Temp18                                                      ;A3D200;
    BEQ .gotoXMovementEnd                                                ;A3D202;
    STA.L Yard.airborneXVelocity,X                                       ;A3D204;

  .gotoXMovementEnd:
    BRA .XMovementEnd                                                    ;A3D208;

  .hitWall:
    LDA.L Yard.airborneXSubVelocity,X                                    ;A3D20A;
    EOR.W #$FFFF                                                         ;A3D20E;
    INC                                                                  ;A3D211;
    STA.L Yard.airborneXSubVelocity,X                                    ;A3D212;
    LDA.L Yard.airborneXVelocity,X                                       ;A3D216;
    EOR.W #$FFFF                                                         ;A3D21A;
    INC                                                                  ;A3D21D;
    STA.L Yard.airborneXVelocity,X                                       ;A3D21E;
    LDA.W #$0001                                                         ;A3D222;
    STA.L ExtraEnemy8000,X                                               ;A3D225;
    LDA.W #$0070                                                         ;A3D229;
    JSL.L QueueSound_Lib2_Max3                                           ;A3D22C;
    JMP.W .XMovementEnd                                                  ;A3D230; >_<

  .XMovementEnd:
    LDA.L Yard.airborneYSubVelocity,X                                    ;A3D233;
    STA.B DP_Temp12                                                      ;A3D237;
    LDA.L Yard.airborneYVelocity,X                                       ;A3D239;
    STA.B DP_Temp14                                                      ;A3D23D;
    JSL.L MoveEnemyDownBy_14_12                                          ;A3D23F;
    BCS .collidedVertically                                              ;A3D243;
    CLC                                                                  ;A3D245;
    LDA.L Yard.airborneYSubVelocity,X                                    ;A3D246;
    ADC.W #$2000                                                         ;A3D24A;
    STA.L Yard.airborneYSubVelocity,X                                    ;A3D24D;
    LDA.L Yard.airborneYVelocity,X                                       ;A3D251;
    ADC.W #$0000                                                         ;A3D255;
    CMP.W #$0004                                                         ;A3D258;
    BPL .return                                                          ;A3D25B;
    STA.L Yard.airborneYVelocity,X                                       ;A3D25D;

  .return:
    RTL                                                                  ;A3D261;

  .collidedVertically:
    LDA.L Yard.airborneYVelocity,X                                       ;A3D262;
    BMI +                                                                ;A3D266;
    CMP.W #$0003                                                         ;A3D268;
    BMI .land                                                            ;A3D26B;

+   LDA.L Yard.airborneYSubVelocity,X                                    ;A3D26D;
    EOR.W #$FFFF                                                         ;A3D271;
    INC                                                                  ;A3D274;
    STA.L Yard.airborneYSubVelocity,X                                    ;A3D275;
    LDA.L Yard.airborneYVelocity,X                                       ;A3D279;
    EOR.W #$FFFF                                                         ;A3D27D;
    INC                                                                  ;A3D280;
    STA.L Yard.airborneYVelocity,X                                       ;A3D281;
    LDA.W #$0000                                                         ;A3D285;
    STA.L ExtraEnemy8000,X                                               ;A3D288;
    RTL                                                                  ;A3D28C;

  .land:
    LDA.W #$0000                                                         ;A3D28D;
    STA.L Yard.airborneXVelocity,X                                       ;A3D290;
    STA.L Yard.airborneXSubVelocity,X                                    ;A3D294;
    STA.L Yard.airborneYVelocity,X                                       ;A3D298;
    STA.L Yard.airborneYSubVelocity,X                                    ;A3D29C;
    STA.W Yard.consequtiveTurnCounter,X                                  ;A3D2A0;
    STA.L Yard.turnTransitionDisableCounter,X                            ;A3D2A3;
    LDA.W #$0001                                                         ;A3D2A7;
    STA.L Yard.turnTransitionDisableFlag,X                               ;A3D2AA;
    LDA.L Yard.behavior,X                                                ;A3D2AE;
    CMP.W #$0003                                                         ;A3D2B2;
    BEQ .dropped                                                         ;A3D2B5;
    LDA.W #$0001                                                         ;A3D2B7;
    STA.L Yard.behavior,X                                                ;A3D2BA;
    LDA.W #$0008                                                         ;A3D2BE;
    STA.W Yard.crawlingSpeedTableIndex,X                                 ;A3D2C1;
    JSL.L MakeYardFaceSamusHorizontally                                  ;A3D2C4;
    JSR.W SetYardAirborneInstList                                        ;A3D2C8;
    BRA +                                                                ;A3D2CB;

  .dropped:
    LDA.W #$0000                                                         ;A3D2CD;
    STA.L Yard.behavior,X                                                ;A3D2D0;

+   LDA.W Enemy.properties,X                                             ;A3D2D4;
    AND.W #$FFFC                                                         ;A3D2D7;
    ORA.W Yard.airborneFacingDirection,X                                 ;A3D2DA;
    STA.W Enemy.properties,X                                             ;A3D2DD;
    JSL.L InitAI_Crawlers_Common                                         ;A3D2E0;
    LDA.W #RTL_A3CF5F                                                    ;A3D2E4;
    STA.W Yard.movementFunction,X                                        ;A3D2E7;
    LDA.W Yard.hidingInstList,X                                          ;A3D2EA;
    STA.W Enemy.instList,X                                               ;A3D2ED;
    LDA.W #$0001                                                         ;A3D2F0;
    STA.W Enemy.instTimer,X                                              ;A3D2F3;
    STZ.W Enemy.loopCounter,X                                            ;A3D2F6;
    RTL                                                                  ;A3D2F9;


;;; $D2FA: Set yard airborne instruction list ;;;
SetYardAirborneInstList:
    LDA.W Yard.airborneFacingDirection,X                                 ;A3D2FA;
    ASL                                                                  ;A3D2FD;
    ASL                                                                  ;A3D2FE;
    TAY                                                                  ;A3D2FF;
    LDA.W .airbornePointers,Y                                            ;A3D300;
    STA.W Enemy.instList,X                                               ;A3D303;
    LDA.W .hidingPointers,Y                                              ;A3D306;
    STA.W Yard.hidingInstList,X                                          ;A3D309;
    RTS                                                                  ;A3D30C;

  .airbornePointers:
    dw InstList_Yard_Airborne_FacingLeft_0                               ;A3D30D;

  .hidingPointers:
    dw InstList_Yard_Hidden_UpsideUp_MovingLeft                          ;A3D30F;
    dw InstList_Yard_Airborne_FacingRight_0                              ;A3D311;
    dw InstList_Yard_Hidden_UpsideUp_MovingRight                         ;A3D313;


if !FEATURE_KEEP_UNREFERENCED
;;; $D315: Unused. Make yard face Samus ;;;
UNUSED_MakeYardFaceSamus_A3D315:
;; Returns:
;;     Carry: Set if yard was turned around
    LDA.L Yard.turnTransitionDisableFlag,X                               ;A3D315;
    BEQ .turningEnabled                                                  ;A3D319;
    CLC                                                                  ;A3D31B;
    RTL                                                                  ;A3D31C;

  .turningEnabled:
    LDA.L Yard.direction,X                                               ;A3D31D;
    CMP.W #$0004                                                         ;A3D321;
    BCS MakeYardFaceSamusHorizontally                                    ;A3D324;
    BIT.W #$0001                                                         ;A3D326;
    BNE .movingDown                                                      ;A3D329;
    LDA.W Enemy.YPosition,X                                              ;A3D32B;
    CMP.W SamusYPosition                                                 ;A3D32E;
    BCC TurnYardAround                                                   ;A3D331;
    CLC                                                                  ;A3D333;
    RTL                                                                  ;A3D334;

  .movingDown:
    LDA.W Enemy.YPosition,X                                              ;A3D335;
    CMP.W SamusYPosition                                                 ;A3D338;
    BCS TurnYardAround                                                   ;A3D33B;
    RTL                                                                  ;A3D33D;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $D33E: Make yard face Samus horizontally ;;;
MakeYardFaceSamusHorizontally:
;; Returns:
;;     Carry: Set if yard was turned around

; Carry is only used by unused caller UNUSED_MakeYardFaceSamus_A3D315 (for UNUSED_Instruction_Yard_A3CC92)
    LDA.W Yard.airborneFacingDirection,X                                 ;A3D33E;
    BNE .facingRight                                                     ;A3D341;
    LDA.W Enemy.XPosition,X                                              ;A3D343;
    CMP.W SamusXPosition                                                 ;A3D346;
    BCC TurnYardAround                                                   ;A3D349;
    CLC                                                                  ;A3D34B;
    RTL                                                                  ;A3D34C;

  .facingRight:
    LDA.W Enemy.XPosition,X                                              ;A3D34D;
    CMP.W SamusXPosition                                                 ;A3D350;
    BCS TurnYardAround                                                   ;A3D353;
    RTL                                                                  ;A3D355;


;;; $D356: Turn yard around ;;;
;; Returns:
;;     Carry: Set if yard was turned around

; Carry is only used by unused caller UNUSED_MakeYardFaceSamus_A3D315 (for UNUSED_Instruction_Yard_A3CC92)
TurnYardAround:
    LDA.L Yard.behavior,X                                                ;A3D356;
    CMP.W #$0002                                                         ;A3D35A;
    BEQ .failed                                                          ;A3D35D;
    LDA.W Yard.movementFunction,X                                        ;A3D35F;
    CMP.W #RTL_A3CF5F                                                    ;A3D362;
    BEQ .failed                                                          ;A3D365;
    LDA.L Yard.direction,X                                               ;A3D367;
    ASL                                                                  ;A3D36B;
    TAY                                                                  ;A3D36C;
    LDA.W YardOppositeDirection,Y                                        ;A3D36D;
    STA.L Yard.direction,X                                               ;A3D370;
    ASL                                                                  ;A3D374;
    ASL                                                                  ;A3D375;
    ASL                                                                  ;A3D376;
    TAY                                                                  ;A3D377;
    LDA.W YardDirectionData_crawlingInstList,Y                           ;A3D378;
    STA.W Enemy.instList,X                                               ;A3D37B;
    LDA.W Enemy.properties,X                                             ;A3D37E;
    AND.W #$FFFC                                                         ;A3D381;
    ORA.W YardDirectionData_movementDirection,Y                          ;A3D384;
    STA.W Enemy.properties,X                                             ;A3D387;
    LDA.W YardDirectionData_hidingInstList,Y                             ;A3D38A;
    STA.W Yard.hidingInstList,X                                          ;A3D38D;
    LDA.W YardDirectionData_airborneFacingDirection,Y                    ;A3D390;
    STA.W Yard.airborneFacingDirection,X                                 ;A3D393;
    JSL.L SetYardCrawlingVelocities                                      ;A3D396;
    JSL.L SetYardCrawlingMovementFunction                                ;A3D39A;
    LDA.W #$0001                                                         ;A3D39E;
    STA.L Yard.turnTransitionDisableFlag,X                               ;A3D3A1;
    LDA.W #$0000                                                         ;A3D3A5;
    STA.L Yard.turnTransitionDisableCounter,X                            ;A3D3A8;
    SEC                                                                  ;A3D3AC;
    RTL                                                                  ;A3D3AD;

  .failed:
    CLC                                                                  ;A3D3AE;
    RTL                                                                  ;A3D3AF;


;;; $D3B0: Enemy touch - enemy $DBBF (yard) ;;;
EnemyTouch_Yard:
    LDX.W EnemyIndex                                                     ;A3D3B0;
    LDA.L Yard.behavior,X                                                ;A3D3B3;
    CMP.W #$0001                                                         ;A3D3B7;
    BNE .notAggressiveCrawling                                           ;A3D3BA;
    LDA.W Yard.movementFunction,X                                        ;A3D3BC;
    CMP.W #RTL_A3CF5F                                                    ;A3D3BF;
    BEQ .notAggressiveCrawling                                           ;A3D3C2;
    JSR.W CheckIfSamusIsDirectingTowardsYard                             ;A3D3C4;
    BCC .notAggressiveCrawling                                           ;A3D3C7;
    BRA .notKicked                                                       ;A3D3C9;

  .notAggressiveCrawling:
    LDA.W Yard.movementFunction,X                                        ;A3D3CB;
    CMP.W #Function_Yard_Movement_Airborne                               ;A3D3CE;
    BEQ .kicked                                                          ;A3D3D1;
    LDA.W SamusRunningMomentumFlag                                       ;A3D3D3;
    BEQ .notKicked                                                       ;A3D3D6;

  .kicked:
    JSR.W KickYardIntoAir                                                ;A3D3D8;
    LDA.W Yard.movementFunction,X                                        ;A3D3DB;
    CMP.W #Function_Yard_Movement_Airborne                               ;A3D3DE;
    BNE .returnUpper                                                     ;A3D3E1;
    LDA.W #$0070                                                         ;A3D3E3;
    JSL.L QueueSound_Lib2_Max3                                           ;A3D3E6;

  .returnUpper:
    RTL                                                                  ;A3D3EA;

  .notKicked:
    LDA.W Yard.movementFunction,X                                        ;A3D3EB;
    CMP.W #RTL_A3CF5F                                                    ;A3D3EE;
    BEQ .returnLower                                                     ;A3D3F1;
    LDA.L Yard.behavior,X                                                ;A3D3F3;
    CMP.W #$0004                                                         ;A3D3F7;
    BEQ .returnLower                                                     ;A3D3FA;
    CMP.W #$0003                                                         ;A3D3FC;
    BEQ .returnLower                                                     ;A3D3FF;
    JSL.L CommonA3_NormalEnemyTouchAI                                    ;A3D401;
    LDA.L Yard.idleCrawlingSpeedTableIndex,X                             ;A3D405;
    STA.W Yard.crawlingSpeedTableIndex,X                                 ;A3D409;
    LDA.L Yard.behavior,X                                                ;A3D40C;
    CMP.W #$0000                                                         ;A3D410;
    BEQ .setIdleCrawling                                                 ;A3D413;
    JSL.L TurnYardAround                                                 ;A3D415;

  .setIdleCrawling:
    LDA.W #$0000                                                         ;A3D419;
    STA.L Yard.behavior,X                                                ;A3D41C;

  .returnLower:
    RTL                                                                  ;A3D420;


;;; $D421: Check if player is directing towards enemy ;;;
CheckIfSamusIsDirectingTowardsYard:
;; Returns:
;;     Carry: Set if player is directing towards enemy, clear otherwise

; Return carry clear if pressing right and enemy is "facing" right, or not pressing right and enemy is "facing" left
    LDA.B DP_Controller1Input                                            ;A3D421;
    AND.W #$0300                                                         ;A3D423;
    XBA                                                                  ;A3D426;
    DEC                                                                  ;A3D427;
    STA.B DP_Temp12                                                      ;A3D428;
    LDA.W Yard.airborneFacingDirection,X                                 ;A3D42A;
    AND.W #$0001                                                         ;A3D42D;
    STA.B DP_Temp14                                                      ;A3D430;
    LDA.B DP_Temp12                                                      ;A3D432;
    BNE .notPressingRight                                                ;A3D434;
    LDA.B DP_Temp14                                                      ;A3D436;
    BEQ .towardsYard                                                     ;A3D438;
    BRA .awayFromYard                                                    ;A3D43A;

  .notPressingRight:
    LDA.B DP_Temp14                                                      ;A3D43C;
    BEQ .awayFromYard                                                    ;A3D43E;
    BRA .towardsYard                                                     ;A3D440;

  .awayFromYard:
    CLC                                                                  ;A3D442;
    RTS                                                                  ;A3D443;

  .towardsYard:
    SEC                                                                  ;A3D444;
    RTS                                                                  ;A3D445;


if !FEATURE_KEEP_UNREFERENCED
;;; $D446: Unused. Check if enemy is moving the direction Samus is facing ;;;
UNUSED_CheckIfYardIsMovingTheDirectionSamusIsFacing_A3D446:
;; Returns:
;;     Carry: Clear if enemy is moving the direction Samus is facing, set otherwise
    LDA.W Yard.crawlingXVelocity,X                                       ;A3D446;
    BPL .positiveXVelocity                                               ;A3D449;
    LDA.W PoseXDirection                                                 ;A3D44B;
    AND.W #$00FF                                                         ;A3D44E;
    CMP.W #$0008                                                         ;A3D451;
    BNE .movingDirectionSamusFacing                                      ;A3D454;
    BRA .movingOppositeDirection                                         ;A3D456;

  .positiveXVelocity:
    LDA.W PoseXDirection                                                 ;A3D458;
    AND.W #$00FF                                                         ;A3D45B;
    CMP.W #$0004                                                         ;A3D45E;
    BNE .movingDirectionSamusFacing                                      ;A3D461;
    BRA .movingOppositeDirection                                         ;A3D463;

  .movingDirectionSamusFacing:
    CLC                                                                  ;A3D465;
    RTS                                                                  ;A3D466;

  .movingOppositeDirection:
    SEC                                                                  ;A3D467;
    RTS                                                                  ;A3D468;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $D469: Enemy shot - enemy $DBBF (yard) ;;;
EnemyShot_Yard:
    LDX.W EnemyIndex                                                     ;A3D469;
    LDA.W CollisionIndex                                                 ;A3D46C;
    ASL                                                                  ;A3D46F;
    TAY                                                                  ;A3D470;
    LDA.W SamusProjectile_Types,Y                                        ;A3D471;
    AND.W #$FF00                                                         ;A3D474;
    CMP.W #$0300                                                         ;A3D477;
    BEQ .normalShotAI                                                    ;A3D47A;
    CMP.W #$0500                                                         ;A3D47C;
    BNE .shot                                                            ;A3D47F;

  .normalShotAI:
    JSL.L CommonA3_NormalEnemyShotAI                                     ;A3D481;
    RTL                                                                  ;A3D485;

  .shot:
    LDA.L Yard.behavior,X                                                ;A3D486;
    CMP.W #$0003                                                         ;A3D48A;
    BEQ .playSFX                                                         ;A3D48D;
    CMP.W #$0004                                                         ;A3D48F;
    BEQ .playSFX                                                         ;A3D492;
    JSR.W ShootYardIntoAir                                               ;A3D494;

  .playSFX:
    LDA.W #$0070                                                         ;A3D497;
    JSL.L QueueSound_Lib2_Max3                                           ;A3D49A;
    RTL                                                                  ;A3D49E;


;;; $D49F: Kick yard into air ;;;
KickYardIntoAir:
; Note the fixed point negation operation at $D4F6 is off by 1.0 when the low word is zero
    LDA.W #$0004                                                         ;A3D49F;
    STA.L Yard.behavior,X                                                ;A3D4A2;
    LDA.W #Function_Yard_Movement_Airborne                               ;A3D4A6;
    STA.W Yard.movementFunction,X                                        ;A3D4A9;
    LDA.W Yard.airborneFacingDirection,X                                 ;A3D4AC;
    ASL                                                                  ;A3D4AF;
    ASL                                                                  ;A3D4B0;
    TAY                                                                  ;A3D4B1;
    LDA.W .airbornePointers,Y                                            ;A3D4B2;
    STA.W Enemy.instList,X                                               ;A3D4B5;
    LDA.W .hidingPointers,Y                                              ;A3D4B8;
    STA.W Yard.hidingInstList,X                                          ;A3D4BB;
    LDA.W #$0001                                                         ;A3D4BE;
    STA.W Enemy.instTimer,X                                              ;A3D4C1;
    STZ.W Enemy.loopCounter,X                                            ;A3D4C4;
    LDA.W CameraXSubSpeed                                                ;A3D4C7;
    STA.L Yard.airborneXSubVelocity,X                                    ;A3D4CA;
    LDA.W CameraXSpeed                                                   ;A3D4CE;
    STA.L Yard.airborneXVelocity,X                                       ;A3D4D1;
    CMP.W #$0010                                                         ;A3D4D5;
    BCC +                                                                ;A3D4D8;
    LDA.W #$000F                                                         ;A3D4DA;

+   ASL                                                                  ;A3D4DD;
    ASL                                                                  ;A3D4DE;
    TAY                                                                  ;A3D4DF;
    LDA.W .YSubVelocity,Y                                                ;A3D4E0;
    STA.L Yard.airborneYSubVelocity,X                                    ;A3D4E3;
    LDA.W .YVelocity,Y                                                   ;A3D4E7;
    STA.L Yard.airborneYVelocity,X                                       ;A3D4EA;
    LDA.W PoseXDirection                                                 ;A3D4EE;
    BIT.W #$0004                                                         ;A3D4F1;
    BEQ .return                                                          ;A3D4F4;
    LDA.L Yard.airborneXSubVelocity,X                                    ;A3D4F6;
    EOR.W #$FFFF                                                         ;A3D4FA;
    INC                                                                  ;A3D4FD;
    STA.L Yard.airborneXSubVelocity,X                                    ;A3D4FE;
    LDA.L Yard.airborneXVelocity,X                                       ;A3D502;
    EOR.W #$FFFF                                                         ;A3D506;
    INC                                                                  ;A3D509;
    STA.L Yard.airborneXVelocity,X                                       ;A3D50A;

  .return:
    RTS                                                                  ;A3D50E;

  .airbornePointers:
    dw InstList_Yard_Airborne_FacingLeft_0                               ;A3D50F;

  .hidingPointers:
    dw InstList_Yard_Hidden_UpsideUp_MovingLeft                          ;A3D511;
    dw InstList_Yard_Airborne_FacingRight_0                              ;A3D513;
    dw InstList_Yard_Hidden_UpsideUp_MovingRight                         ;A3D515;

; Y velocities. Indexed by X velocity
; Y subvelocity, Y velocity
  .YSubVelocity:
    dw $0000                                                             ;A3D517;
  .YVelocity:
    dw       $FFFD, $A000,$FFFD, $4000,$FFFD, $0000,$FFFC
    dw $A000,$FFFC, $4000,$FFFC, $0000,$FFFB, $A000,$FFFB
    dw $4000,$FFFB, $0000,$FFFA, $A000,$FFFA, $4000,$FFFA
    dw $0000,$FFF9, $A000,$FFF9, $4000,$FFF9, $0000,$FFF8


;;; $D557: Shoot yard into air ;;;
ShootYardIntoAir:
    PHY                                                                  ;A3D557;
    LDA.W #$0005                                                         ;A3D558;
    STA.L Yard.behavior,X                                                ;A3D55B;
    LDA.W #Function_Yard_Movement_Airborne                               ;A3D55F;
    STA.W Yard.movementFunction,X                                        ;A3D562;
    LDA.W Yard.airborneFacingDirection,X                                 ;A3D565;
    ASL                                                                  ;A3D568;
    ASL                                                                  ;A3D569;
    TAY                                                                  ;A3D56A;
    LDA.W .airbornePointers,Y                                            ;A3D56B;
    STA.W Enemy.instList,X                                               ;A3D56E;
    LDA.W .hidingPointers,Y                                              ;A3D571;
    STA.W Yard.hidingInstList,X                                          ;A3D574;
    LDA.W #$0001                                                         ;A3D577;
    STA.W Enemy.instTimer,X                                              ;A3D57A;
    STZ.W Enemy.loopCounter,X                                            ;A3D57D;
    LDA.W #$FFFF                                                         ;A3D580;
    STA.L Yard.airborneYVelocity,X                                       ;A3D583;
    LDA.W PoseXDirection                                                 ;A3D587;
    AND.W #$00FF                                                         ;A3D58A;
    CMP.W #$0004                                                         ;A3D58D;
    BNE .SamusFacingRight                                                ;A3D590;
    LDA.W #$FFFF                                                         ;A3D592;
    STA.L Yard.airborneXVelocity,X                                       ;A3D595;
    BRA .return                                                          ;A3D599;

  .SamusFacingRight:
    LDA.W #$0001                                                         ;A3D59B;
    STA.L Yard.airborneXVelocity,X                                       ;A3D59E;

  .return:
    PLY                                                                  ;A3D5A2;
    RTS                                                                  ;A3D5A3;

  .airbornePointers:
    dw InstList_Yard_Airborne_FacingLeft_0                               ;A3D5A4;

  .hidingPointers:
    dw InstList_Yard_Hidden_UpsideUp_MovingLeft                          ;A3D5A6;
    dw InstList_Yard_Airborne_FacingRight_0                              ;A3D5A8;
    dw InstList_Yard_Hidden_UpsideUp_MovingRight                         ;A3D5AA;


;;; $D5AC: Yard spritemaps ;;;
Spritemap_Yard_0:
    dw $0002                                                             ;A3D5AC;
    %spritemapEntry(1, $43FB, $F6, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $43F5, $F8, 0, 0, 2, 0, $100)

Spritemap_Yard_1:
    dw $0002                                                             ;A3D5B8;
    %spritemapEntry(1, $43FC, $F6, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $43F4, $F8, 0, 0, 2, 0, $102)

Spritemap_Yard_2:
    dw $0002                                                             ;A3D5C4;
    %spritemapEntry(1, $43FB, $F5, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $43F5, $F8, 0, 0, 2, 0, $104)

Spritemap_Yard_3:
    dw $0002                                                             ;A3D5D0;
    %spritemapEntry(1, $43F9, $F6, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $43F4, $FE, 0, 0, 2, 0, $106)

Spritemap_Yard_4:
    dw $0002                                                             ;A3D5DC;
    %spritemapEntry(1, $43F2, $F6, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $43F0, $01, 0, 0, 2, 0, $108)

Spritemap_Yard_5:
    dw $0002                                                             ;A3D5E8;
    %spritemapEntry(1, $43EE, $F8, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $43F0, $00, 0, 0, 2, 0, $108)

Spritemap_Yard_6:
    dw $0002                                                             ;A3D5F4;
    %spritemapEntry(1, $43F6, $F5, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $43F8, $FB, 0, 0, 2, 0, $108)

Spritemap_Yard_7:
    dw $0002                                                             ;A3D600;
    %spritemapEntry(1, $43F6, $F4, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $43F8, $FC, 0, 0, 2, 0, $10A)

Spritemap_Yard_8:
    dw $0002                                                             ;A3D60C;
    %spritemapEntry(1, $43F5, $F5, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $43F8, $FB, 0, 0, 2, 0, $10C)

Spritemap_Yard_9:
    dw $0002                                                             ;A3D618;
    %spritemapEntry(1, $43F6, $F7, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $43FE, $FC, 0, 0, 2, 0, $10E)

Spritemap_Yard_A:
    dw $0002                                                             ;A3D624;
    %spritemapEntry(1, $43F6, $FE, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $4201, $00, 1, 1, 2, 0, $100)

Spritemap_Yard_B:
    dw $0002                                                             ;A3D630;
    %spritemapEntry(1, $43F8, $02, 1, 1, 2, 0, $120)
    %spritemapEntry(1, $4200, $00, 1, 1, 2, 0, $100)

Spritemap_Yard_C:
    dw $0002                                                             ;A3D63C;
    %spritemapEntry(1, $43F5, $FA, 1, 1, 2, 0, $120)
    %spritemapEntry(1, $43FB, $F8, 1, 1, 2, 0, $100)

Spritemap_Yard_D:
    dw $0002                                                             ;A3D648;
    %spritemapEntry(1, $43F4, $FA, 1, 1, 2, 0, $120)
    %spritemapEntry(1, $43FC, $F8, 1, 1, 2, 0, $102)

Spritemap_Yard_E:
    dw $0002                                                             ;A3D654;
    %spritemapEntry(1, $43F5, $FB, 1, 1, 2, 0, $120)
    %spritemapEntry(1, $43FB, $F8, 1, 1, 2, 0, $104)

Spritemap_Yard_F:
    dw $0002                                                             ;A3D660;
    %spritemapEntry(1, $43F7, $FA, 1, 1, 2, 0, $120)
    %spritemapEntry(1, $43FC, $F2, 1, 1, 2, 0, $106)

Spritemap_Yard_10:
    dw $0002                                                             ;A3D66C;
    %spritemapEntry(1, $43FE, $FA, 1, 1, 2, 0, $122)
    %spritemapEntry(1, $4200, $EF, 1, 1, 2, 0, $108)

Spritemap_Yard_11:
    dw $0002                                                             ;A3D678;
    %spritemapEntry(1, $4202, $F8, 1, 1, 2, 0, $124)
    %spritemapEntry(1, $4200, $F0, 1, 1, 2, 0, $108)

Spritemap_Yard_12:
    dw $0002                                                             ;A3D684;
    %spritemapEntry(1, $43FA, $FB, 1, 1, 2, 0, $124)
    %spritemapEntry(1, $43F8, $F5, 1, 1, 2, 0, $108)

Spritemap_Yard_13:
    dw $0002                                                             ;A3D690;
    %spritemapEntry(1, $43FA, $FC, 1, 1, 2, 0, $124)
    %spritemapEntry(1, $43F8, $F4, 1, 1, 2, 0, $10A)

Spritemap_Yard_14:
    dw $0002                                                             ;A3D69C;
    %spritemapEntry(1, $43FB, $FB, 1, 1, 2, 0, $124)
    %spritemapEntry(1, $43F8, $F5, 1, 1, 2, 0, $10C)

Spritemap_Yard_15:
    dw $0002                                                             ;A3D6A8;
    %spritemapEntry(1, $43FA, $F9, 1, 1, 2, 0, $124)
    %spritemapEntry(1, $43F2, $F4, 1, 1, 2, 0, $10E)

Spritemap_Yard_16:
    dw $0002                                                             ;A3D6B4;
    %spritemapEntry(1, $43FA, $F2, 1, 1, 2, 0, $126)
    %spritemapEntry(1, $43EF, $F0, 0, 0, 2, 0, $100)

Spritemap_Yard_17:
    dw $0002                                                             ;A3D6C0;
    %spritemapEntry(1, $43F8, $EE, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 2, 0, $100)

Spritemap_Yard_18:
    dw $0002                                                             ;A3D6CC;
    %spritemapEntry(1, $43FB, $F7, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $43F9, $F8, 0, 0, 2, 0, $100)

Spritemap_Yard_19:
    dw $0001                                                             ;A3D6D8;
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $122)

Spritemap_Yard_1A:
    dw $0002                                                             ;A3D6DF;
    %spritemapEntry(1, $43F7, $F6, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $108)

Spritemap_Yard_1B:
    dw $0001                                                             ;A3D6EB;
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $126)

Spritemap_Yard_1C:
    dw $0002                                                             ;A3D6F2;
    %spritemapEntry(1, $43F6, $F9, 1, 1, 2, 0, $120)
    %spritemapEntry(1, $43F8, $F8, 1, 1, 2, 0, $100)

Spritemap_Yard_1D:
    dw $0001                                                             ;A3D6FE;
    %spritemapEntry(1, $43F8, $F8, 1, 1, 2, 0, $122)

Spritemap_Yard_1E:
    dw $0002                                                             ;A3D705;
    %spritemapEntry(1, $43F9, $FA, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $43F8, $F8, 1, 1, 2, 0, $108)

Spritemap_Yard_1F:
    dw $0001                                                             ;A3D711;
    %spritemapEntry(1, $43F8, $F8, 1, 1, 2, 0, $126)

Spritemap_Yard_20:
    dw $0002                                                             ;A3D718;
    %spritemapEntry(1, $43F5, $F6, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $43FB, $F8, 0, 1, 2, 0, $100)

Spritemap_Yard_21:
    dw $0002                                                             ;A3D724;
    %spritemapEntry(1, $43F4, $F6, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $43FC, $F8, 0, 1, 2, 0, $102)

Spritemap_Yard_22:
    dw $0002                                                             ;A3D730;
    %spritemapEntry(1, $43F5, $F5, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $43FB, $F8, 0, 1, 2, 0, $104)

Spritemap_Yard_23:
    dw $0002                                                             ;A3D73C;
    %spritemapEntry(1, $43F7, $F6, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $43FC, $FE, 0, 1, 2, 0, $106)

Spritemap_Yard_24:
    dw $0002                                                             ;A3D748;
    %spritemapEntry(1, $43FE, $F6, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $4200, $01, 0, 1, 2, 0, $108)

Spritemap_Yard_25:
    dw $0002                                                             ;A3D754;
    %spritemapEntry(1, $4202, $F8, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $4200, $00, 0, 1, 2, 0, $108)

Spritemap_Yard_26:
    dw $0002                                                             ;A3D760;
    %spritemapEntry(1, $43FA, $F5, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $43F8, $FB, 0, 1, 2, 0, $108)

Spritemap_Yard_27:
    dw $0002                                                             ;A3D76C;
    %spritemapEntry(1, $43FA, $F4, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $43F8, $FC, 0, 1, 2, 0, $10A)

Spritemap_Yard_28:
    dw $0002                                                             ;A3D778;
    %spritemapEntry(1, $43FB, $F5, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $43F8, $FB, 0, 1, 2, 0, $10C)

Spritemap_Yard_29:
    dw $0002                                                             ;A3D784;
    %spritemapEntry(1, $43FA, $F7, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $43F2, $FC, 0, 1, 2, 0, $10E)

Spritemap_Yard_2A:
    dw $0002                                                             ;A3D790;
    %spritemapEntry(1, $43FA, $FE, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $43EF, $00, 1, 0, 2, 0, $100)

Spritemap_Yard_2B:
    dw $0002                                                             ;A3D79C;
    %spritemapEntry(1, $43F8, $02, 1, 0, 2, 0, $120)
    %spritemapEntry(1, $43F0, $00, 1, 0, 2, 0, $100)

Spritemap_Yard_2C:
    dw $0002                                                             ;A3D7A8;
    %spritemapEntry(1, $43FB, $FA, 1, 0, 2, 0, $120)
    %spritemapEntry(1, $43F5, $F8, 1, 0, 2, 0, $100)

Spritemap_Yard_2D:
    dw $0002                                                             ;A3D7B4;
    %spritemapEntry(1, $43FC, $FA, 1, 0, 2, 0, $120)
    %spritemapEntry(1, $43F4, $F8, 1, 0, 2, 0, $102)

Spritemap_Yard_2E:
    dw $0002                                                             ;A3D7C0;
    %spritemapEntry(1, $43FB, $FB, 1, 0, 2, 0, $120)
    %spritemapEntry(1, $43F5, $F8, 1, 0, 2, 0, $104)

Spritemap_Yard_2F:
    dw $0002                                                             ;A3D7CC;
    %spritemapEntry(1, $43F9, $FA, 1, 0, 2, 0, $120)
    %spritemapEntry(1, $43F4, $F2, 1, 0, 2, 0, $106)

Spritemap_Yard_30:
    dw $0002                                                             ;A3D7D8;
    %spritemapEntry(1, $43F2, $FA, 1, 0, 2, 0, $122)
    %spritemapEntry(1, $43F0, $EF, 1, 0, 2, 0, $108)

Spritemap_Yard_31:
    dw $0002                                                             ;A3D7E4;
    %spritemapEntry(1, $43EE, $F8, 1, 0, 2, 0, $124)
    %spritemapEntry(1, $43F0, $F0, 1, 0, 2, 0, $108)

Spritemap_Yard_32:
    dw $0002                                                             ;A3D7F0;
    %spritemapEntry(1, $43F6, $FB, 1, 0, 2, 0, $124)
    %spritemapEntry(1, $43F8, $F5, 1, 0, 2, 0, $108)

Spritemap_Yard_33:
    dw $0002                                                             ;A3D7FC;
    %spritemapEntry(1, $43F6, $FC, 1, 0, 2, 0, $124)
    %spritemapEntry(1, $43F8, $F4, 1, 0, 2, 0, $10A)

Spritemap_Yard_34:
    dw $0002                                                             ;A3D808;
    %spritemapEntry(1, $43F5, $FB, 1, 0, 2, 0, $124)
    %spritemapEntry(1, $43F8, $F5, 1, 0, 2, 0, $10C)

Spritemap_Yard_35:
    dw $0002                                                             ;A3D814;
    %spritemapEntry(1, $43F7, $F9, 1, 0, 2, 0, $124)
    %spritemapEntry(1, $43FF, $F4, 1, 0, 2, 0, $10E)

Spritemap_Yard_36:
    dw $0002                                                             ;A3D820;
    %spritemapEntry(1, $43F6, $F2, 1, 0, 2, 0, $126)
    %spritemapEntry(1, $4201, $F0, 0, 1, 2, 0, $100)

Spritemap_Yard_37:
    dw $0002                                                             ;A3D82C;
    %spritemapEntry(1, $43F8, $EE, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $4200, $F0, 0, 1, 2, 0, $100)

Spritemap_Yard_38:
    dw $0002                                                             ;A3D838;
    %spritemapEntry(1, $43F5, $F7, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $43F7, $F8, 0, 1, 2, 0, $100)

Spritemap_Yard_39:
    dw $0001                                                             ;A3D844;
    %spritemapEntry(1, $43F8, $F8, 0, 1, 2, 0, $122)

Spritemap_Yard_3A:
    dw $0002                                                             ;A3D84B;
    %spritemapEntry(1, $43F9, $F6, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $43F8, $F8, 0, 1, 2, 0, $108)

Spritemap_Yard_3B:
    dw $0001                                                             ;A3D857;
    %spritemapEntry(1, $43F8, $F8, 0, 1, 2, 0, $126)

Spritemap_Yard_3C:
    dw $0002                                                             ;A3D85E;
    %spritemapEntry(1, $43FA, $F9, 1, 0, 2, 0, $120)
    %spritemapEntry(1, $43F8, $F8, 1, 0, 2, 0, $100)

Spritemap_Yard_3D:
    dw $0001                                                             ;A3D86A;
    %spritemapEntry(1, $43F8, $F8, 1, 0, 2, 0, $122)

Spritemap_Yard_3E:
    dw $0002                                                             ;A3D871;
    %spritemapEntry(1, $43F7, $FA, 1, 0, 2, 0, $124)
    %spritemapEntry(1, $43F8, $F8, 1, 0, 2, 0, $108)

Spritemap_Yard_3F:
    dw $0001                                                             ;A3D87D;
    %spritemapEntry(1, $43F8, $F8, 1, 0, 2, 0, $126)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Yard_A3D884:
    dw $0002                                                             ;A3D884;
    %spritemapEntry(1, $43FB, $F6, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $43F5, $F8, 0, 0, 2, 0, $100)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Yard_40:
    dw $0002                                                             ;A3D890;
    %spritemapEntry(1, $43F5, $F8, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $43FB, $F7, 0, 0, 2, 0, $120)

Spritemap_Yard_41:
    dw $0002                                                             ;A3D89C;
    %spritemapEntry(1, $43FA, $FA, 1, 1, 2, 0, $126)
    %spritemapEntry(1, $43F8, $F7, 1, 1, 2, 0, $108)

Spritemap_Yard_42:
    dw $0002                                                             ;A3D8A8;
    %spritemapEntry(1, $43FA, $FA, 1, 1, 2, 0, $124)
    %spritemapEntry(1, $43F8, $F6, 1, 1, 2, 0, $108)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Yard_A3D8B4:
    dw $0002                                                             ;A3D8B4;
    %spritemapEntry(1, $43FA, $FB, 1, 1, 2, 0, $124)
    %spritemapEntry(1, $43F8, $F5, 1, 1, 2, 0, $108)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Yard_43:
    dw $0002                                                             ;A3D8C0;
    %spritemapEntry(1, $43F8, $F5, 1, 1, 2, 0, $12A)
    %spritemapEntry(1, $43F9, $FB, 1, 1, 2, 0, $124)

Spritemap_Yard_44:
    dw $0002                                                             ;A3D8CC;
    %spritemapEntry(1, $43F6, $FA, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $43F9, $F8, 1, 1, 2, 0, $100)

Spritemap_Yard_45:
    dw $0002                                                             ;A3D8D8;
    %spritemapEntry(1, $43F6, $FA, 1, 1, 2, 0, $120)
    %spritemapEntry(1, $43FA, $F8, 1, 1, 2, 0, $100)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Yard_A3D8E4:
    dw $0002                                                             ;A3D8E4;
    %spritemapEntry(1, $43F5, $FA, 1, 1, 2, 0, $120)
    %spritemapEntry(1, $43FB, $F8, 1, 1, 2, 0, $100)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Yard_46:
    dw $0002                                                             ;A3D8F0;
    %spritemapEntry(1, $43FB, $F8, 1, 1, 2, 0, $128)
    %spritemapEntry(1, $43F5, $F9, 1, 1, 2, 0, $120)

Spritemap_Yard_47:
    dw $0002                                                             ;A3D8FC;
    %spritemapEntry(1, $43F6, $F6, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $43F8, $F9, 0, 0, 2, 0, $108)

Spritemap_Yard_48:
    dw $0002                                                             ;A3D908;
    %spritemapEntry(1, $43F6, $F6, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $43F8, $FA, 0, 0, 2, 0, $108)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Yard_A3D914:
    dw $0002                                                             ;A3D914;
    %spritemapEntry(1, $43F6, $F5, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $43F8, $FB, 0, 0, 2, 0, $108)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Yard_49:
    dw $0002                                                             ;A3D920;
    %spritemapEntry(1, $43F8, $FB, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $43F7, $F5, 0, 0, 2, 0, $124)

Spritemap_Yard_4A:
    dw $0002                                                             ;A3D92C;
    %spritemapEntry(1, $43FA, $F6, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $43F7, $F8, 0, 0, 2, 0, $100)

Spritemap_Yard_4B:
    dw $0002                                                             ;A3D938;
    %spritemapEntry(1, $43FB, $F6, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $43F7, $F8, 0, 0, 2, 0, $100)

Spritemap_Yard_4C:
    dw $0001                                                             ;A3D944;
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $122)

Spritemap_Yard_4D:
    dw $0002                                                             ;A3D94B;
    %spritemapEntry(1, $43F8, $F7, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $43F6, $F8, 0, 0, 2, 0, $100)

Spritemap_Yard_4E:
    dw $0001                                                             ;A3D957;
    %spritemapEntry(1, $43F8, $F8, 1, 1, 2, 0, $126)

Spritemap_Yard_4F:
    dw $0002                                                             ;A3D95E;
    %spritemapEntry(1, $43F9, $F8, 1, 1, 2, 0, $124)
    %spritemapEntry(1, $43F8, $F6, 1, 1, 2, 0, $108)

Spritemap_Yard_50:
    dw $0001                                                             ;A3D96A;
    %spritemapEntry(1, $43F8, $F8, 1, 1, 2, 0, $122)

Spritemap_Yard_51:
    dw $0002                                                             ;A3D971;
    %spritemapEntry(1, $43F8, $F9, 1, 1, 2, 0, $120)
    %spritemapEntry(1, $43FA, $F8, 1, 1, 2, 0, $100)

Spritemap_Yard_52:
    dw $0001                                                             ;A3D97D;
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $126)

Spritemap_Yard_53:
    dw $0002                                                             ;A3D984;
    %spritemapEntry(1, $43F7, $F8, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $43F8, $FA, 0, 0, 2, 0, $108)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Yard_A3D990:
    dw $0002                                                             ;A3D990;
    %spritemapEntry(1, $43F5, $F6, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $43FB, $F8, 0, 1, 2, 0, $100)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Yard_54:
    dw $0002                                                             ;A3D99C;
    %spritemapEntry(1, $43FB, $F8, 0, 1, 2, 0, $128)
    %spritemapEntry(1, $43F5, $F7, 0, 1, 2, 0, $120)

Spritemap_Yard_55:
    dw $0002                                                             ;A3D9A8;
    %spritemapEntry(1, $43F6, $FA, 1, 0, 2, 0, $126)
    %spritemapEntry(1, $43F8, $F7, 1, 0, 2, 0, $108)

Spritemap_Yard_56:
    dw $0002                                                             ;A3D9B4;
    %spritemapEntry(1, $43F6, $FA, 1, 0, 2, 0, $124)
    %spritemapEntry(1, $43F8, $F6, 1, 0, 2, 0, $108)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Yard_A3D9C0:
    dw $0002                                                             ;A3D9C0;
    %spritemapEntry(1, $43F6, $FB, 1, 0, 2, 0, $124)
    %spritemapEntry(1, $43F8, $F5, 1, 0, 2, 0, $108)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Yard_57:
    dw $0002                                                             ;A3D9CC;
    %spritemapEntry(1, $43F8, $F5, 1, 0, 2, 0, $12A)
    %spritemapEntry(1, $43F7, $FB, 1, 0, 2, 0, $124)

Spritemap_Yard_58:
    dw $0002                                                             ;A3D9D8;
    %spritemapEntry(1, $43FA, $FA, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $43F7, $F8, 1, 0, 2, 0, $100)

Spritemap_Yard_59:
    dw $0002                                                             ;A3D9E4;
    %spritemapEntry(1, $43FA, $FA, 1, 0, 2, 0, $120)
    %spritemapEntry(1, $43F6, $F8, 1, 0, 2, 0, $100)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Yard_A3D9F0:
    dw $0002                                                             ;A3D9F0;
    %spritemapEntry(1, $43FB, $FA, 1, 0, 2, 0, $120)
    %spritemapEntry(1, $43F5, $F8, 1, 0, 2, 0, $100)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Yard_5A:
    dw $0002                                                             ;A3D9FC;
    %spritemapEntry(1, $43F5, $F8, 1, 0, 2, 0, $128)
    %spritemapEntry(1, $43FB, $F9, 1, 0, 2, 0, $120)

Spritemap_Yard_5B:
    dw $0002                                                             ;A3DA08;
    %spritemapEntry(1, $43FA, $F6, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $43F8, $F9, 0, 1, 2, 0, $108)

Spritemap_Yard_5C:
    dw $0002                                                             ;A3DA14;
    %spritemapEntry(1, $43FA, $F6, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $43F8, $FA, 0, 1, 2, 0, $108)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Yard_A3DA20:
    dw $0002                                                             ;A3DA20;
    %spritemapEntry(1, $43FA, $F5, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $43F8, $FB, 0, 1, 2, 0, $108)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Yard_5D:
    dw $0002                                                             ;A3DA2C;
    %spritemapEntry(1, $43F8, $FB, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $43F9, $F5, 0, 1, 2, 0, $124)

Spritemap_Yard_5E:
    dw $0002                                                             ;A3DA38;
    %spritemapEntry(1, $43F6, $F6, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $43F9, $F8, 0, 1, 2, 0, $100)

Spritemap_Yard_5F:
    dw $0002                                                             ;A3DA44;
    %spritemapEntry(1, $43F5, $F6, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $43F9, $F8, 0, 1, 2, 0, $100)

Spritemap_Yard_60:
    dw $0001                                                             ;A3DA50;
    %spritemapEntry(1, $43F8, $F8, 0, 1, 2, 0, $122)

Spritemap_Yard_61:
    dw $0002                                                             ;A3DA57;
    %spritemapEntry(1, $43F8, $F7, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $43FA, $F8, 0, 1, 2, 0, $100)

Spritemap_Yard_62:
    dw $0001                                                             ;A3DA63;
    %spritemapEntry(1, $43F8, $F8, 1, 0, 2, 0, $126)

Spritemap_Yard_63:
    dw $0002                                                             ;A3DA6A;
    %spritemapEntry(1, $43F7, $F8, 1, 0, 2, 0, $124)
    %spritemapEntry(1, $43F8, $F6, 1, 0, 2, 0, $108)

Spritemap_Yard_64:
    dw $0001                                                             ;A3DA76;
    %spritemapEntry(1, $43F8, $F8, 1, 0, 2, 0, $122)

Spritemap_Yard_65:
    dw $0002                                                             ;A3DA7D;
    %spritemapEntry(1, $43F8, $F9, 1, 0, 2, 0, $120)
    %spritemapEntry(1, $43F6, $F8, 1, 0, 2, 0, $100)

Spritemap_Yard_66:
    dw $0001                                                             ;A3DA89;
    %spritemapEntry(1, $43F8, $F8, 0, 1, 2, 0, $126)

Spritemap_Yard_67:
    dw $0002                                                             ;A3DA90;
    %spritemapEntry(1, $43F9, $F8, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $43F8, $FA, 0, 1, 2, 0, $108)


;;; $DA9C: Palette - enemy $DBFF (reflec) ;;;
Palette_Reflec:
    dw $3800,$7FBD,$5EB5,$1884,$0800,$777B,$5EB5,$45EF                   ;A3DA9C;
    dw $2D29,$241F,$1C17,$142F,$0C47,$06E1,$6BF5,$05A1                   ;A3DAAC;


;;; $DABC: Reflec palette cycle colours ;;;
ReflecPaletteCycleColors:                                                ;A3DABC;
    dw $241F,$1C17,$142F,$0C47
    dw $211F,$18D8,$10B1,$086A
    dw $221F,$1999,$1113,$08AD
    dw $1EFF,$163A,$0D95,$04D0
    dw $1BFF,$12FB,$09F7,$00F3
    dw $1BFF,$12FB,$09F7,$00F3
    dw $1EFF,$163A,$0D95,$04D0
    dw $221F,$1999,$1113,$08AD
    dw $211F,$18D8,$10B1,$086A
    dw $241F,$1C17,$142F,$0C47


;;; $DB0C: Enemy graphics drawn hook - reflec - periodically cycle between palettes ;;;
EnemyGraphicsDrawnHook_Reflec_PeriodicallyCyclePalettes:
    LDA.W DoorTransitionFlagEnemiesPause                                 ;A3DB0C;
    BNE .return                                                          ;A3DB0F;
    LDA.W EnemyPaletteCycle_Timer                                        ;A3DB11;
    DEC                                                                  ;A3DB14;
    STA.W EnemyPaletteCycle_Timer                                        ;A3DB15;
    BNE .return                                                          ;A3DB18;
    LDA.W #$0010                                                         ;A3DB1A;
    STA.W EnemyPaletteCycle_Timer                                        ;A3DB1D;
    LDA.W EnemyPaletteCycle_PaletteIndex                                 ;A3DB20;
    TAX                                                                  ;A3DB23;
    LDA.W EnemyPaletteCycle_ColorSetIndex                                ;A3DB24;
    ASL                                                                  ;A3DB27;
    ASL                                                                  ;A3DB28;
    ASL                                                                  ;A3DB29;
    TAY                                                                  ;A3DB2A;
    LDA.W #$0004                                                         ;A3DB2B;
    STA.W RemainingEnemySpritemapEntries                                 ;A3DB2E;

  .loop:
    LDA.W ReflecPaletteCycleColors,Y                                     ;A3DB31;
    STA.L Palettes_SpriteP0+$12,X                                        ;A3DB34;
    INY                                                                  ;A3DB38;
    INY                                                                  ;A3DB39;
    INX                                                                  ;A3DB3A;
    INX                                                                  ;A3DB3B;
    DEC.W RemainingEnemySpritemapEntries                                 ;A3DB3C;
    BNE .loop                                                            ;A3DB3F;
    LDA.W EnemyPaletteCycle_ColorSetIndex                                ;A3DB41;
    INC                                                                  ;A3DB44;
    AND.W #$0007                                                         ;A3DB45;
    STA.W EnemyPaletteCycle_ColorSetIndex                                ;A3DB48;

  .return:
    RTL                                                                  ;A3DB4B;


;;; $DB4C: Instruction list - facing left ;;;
InstList_Reflec_FacingLeft:
    dw Instruction_Reflec_Param2InY,$0000                                ;A3DB4C;
    dw $0040,Spritemap_Reflec_FacingLeft                                 ;A3DB4E;
    dw Instruction_Common_GotoY                                          ;A3DB54;
    dw InstList_Reflec_FacingLeft                                        ;A3DB56;


;;; $DB58: Instruction list - facing up-left ;;;
InstList_Reflec_FacingUpLeft:
    dw Instruction_Reflec_Param2InY,$0001                                ;A3DB58;
    dw $0040,Spritemap_Reflec_FacingUpLeft                               ;A3DB5A;
    dw Instruction_Common_GotoY                                          ;A3DB60;
    dw InstList_Reflec_FacingUpLeft                                      ;A3DB62;


;;; $DB64: Instruction list - facing up ;;;
InstList_Reflec_FacingUp:
    dw Instruction_Reflec_Param2InY,$0002                                ;A3DB64;
    dw $0040,Spritemap_Reflec_FacingUp                                   ;A3DB66;
    dw Instruction_Common_Sleep                                          ;A3DB6C;


;;; $DB6E: Instruction list - facing up-right ;;;
InstList_Reflec_FacingUpRight:
    dw Instruction_Reflec_Param2InY,$0003                                ;A3DB6E;
    dw $0040,Spritemap_Reflec_FacingUpRight                              ;A3DB70;
    dw Instruction_Common_Sleep                                          ;A3DB76;


;;; $DB78: Instruction list - facing right ;;;
InstList_Reflec_FacingRight:
    dw Instruction_Reflec_Param2InY,$0000                                ;A3DB78;
    dw $0040,Spritemap_Reflec_FacingRight                                ;A3DB7A;
    dw Instruction_Common_Sleep                                          ;A3DB80;


;;; $DB82: Instruction list - facing down-right ;;;
InstList_Reflec_FacingDownRight:
    dw Instruction_Reflec_Param2InY,$0001                                ;A3DB82;
    dw $0040,Spritemap_Reflec_FacingDownRight                            ;A3DB84;
    dw Instruction_Common_Sleep                                          ;A3DB8A;


;;; $DB8C: Instruction list - facing down ;;;
InstList_Reflec_FacingDown:
    dw Instruction_Reflec_Param2InY,$0002                                ;A3DB8C;
    dw $0040,Spritemap_Reflec_FacingDown                                 ;A3DB8E;
    dw Instruction_Common_Sleep                                          ;A3DB94;


;;; $DB96: Instruction list - facing down-left ;;;
InstList_Reflec_FacingDownLeft:
    dw Instruction_Reflec_Param2InY,$0003                                ;A3DB96;
    dw $0040,Spritemap_Reflec_FacingDownLeft                             ;A3DB98;
    dw Instruction_Common_Sleep                                          ;A3DB9E;


;;; $DBA0: Instruction list - health reached zero - facing left ;;;
InstList_Reflec_ZeroHealth_FacingLeft:
    dw Instruction_Reflec_Param2InY,$0000                                ;A3DBA0;
    dw $0001,Spritemap_Reflec_FacingLeft                                 ;A3DBA2;
    dw Instruction_Common_Sleep                                          ;A3DBA8;


;;; $DBAA: Instruction list - health reached zero - facing up-left ;;;
InstList_Reflec_ZeroHealth_FacingUpLeft:
    dw Instruction_Reflec_Param2InY,$0001                                ;A3DBAA;
    dw $0001,Spritemap_Reflec_FacingUpLeft                               ;A3DBAC;
    dw Instruction_Common_Sleep                                          ;A3DBB2;


;;; $DBB4: Instruction list - health reached zero - facing up ;;;
InstList_Reflec_ZeroHealth_FacingUp:
    dw Instruction_Reflec_Param2InY,$0002                                ;A3DBB4;
    dw $0001,Spritemap_Reflec_FacingUp                                   ;A3DBB6;
    dw Instruction_Common_Sleep                                          ;A3DBBC;


;;; $DBBE: Instruction list - health reached zero - facing up-right ;;;
InstList_Reflec_ZeroHealth_FacingUpRight:
    dw Instruction_Reflec_Param2InY,$0003                                ;A3DBBE;
    dw $0001,Spritemap_Reflec_FacingUpRight                              ;A3DBC0;
    dw Instruction_Common_Sleep                                          ;A3DBC6;


;;; $DBC8: Instruction - enemy reflection axis = [[Y]] ;;;
Instruction_Reflec_Param2InY:
    PHY                                                                  ;A3DBC8;
    LDA.W $0000,Y                                                        ;A3DBC9;
    STA.W Reflect.reflectionAxis,X                                       ;A3DBCC;
    PLY                                                                  ;A3DBCF;
    INY                                                                  ;A3DBD0;
    INY                                                                  ;A3DBD1;
    RTL                                                                  ;A3DBD2;


;;; $DBD3: Initialisation AI - enemy $DBFF (reflec) ;;;
InitAI_Reflec:
    LDX.W EnemyIndex                                                     ;A3DBD3;
    LDA.W Enemy.properties,X                                             ;A3DBD6;
    ORA.W #$1000                                                         ;A3DBD9;
    STA.W Enemy.properties,X                                             ;A3DBDC;
    LDA.W Enemy.init0,X                                                  ;A3DBDF;
    ASL                                                                  ;A3DBE2;
    TAY                                                                  ;A3DBE3;
    LDA.W .pointers,Y                                                    ;A3DBE4;
    STA.W Enemy.instList,X                                               ;A3DBE7;
    LDA.W #EnemyGraphicsDrawnHook_Reflec_PeriodicallyCyclePalettes       ;A3DBEA;
    STA.W EnemyGraphicsDrawnHook                                         ;A3DBED;
    LDA.W #EnemyGraphicsDrawnHook_Reflec_PeriodicallyCyclePalettes>>16   ;A3DBF0;
    STA.W EnemyGraphicsDrawnHook+2                                       ;A3DBF3;
    LDA.W Enemy.palette,X                                                ;A3DBF6;
    ASL                                                                  ;A3DBF9;
    ASL                                                                  ;A3DBFA;
    ASL                                                                  ;A3DBFB;
    ASL                                                                  ;A3DBFC;
    AND.W #$FF00                                                         ;A3DBFD;
    XBA                                                                  ;A3DC00;
    STA.W EnemyPaletteCycle_PaletteIndex                                 ;A3DC01;
    LDA.W #$0010                                                         ;A3DC04;
    STA.W EnemyPaletteCycle_Timer                                        ;A3DC07;
    RTL                                                                  ;A3DC0A;

  .pointers:
    dw InstList_Reflec_FacingLeft                                        ;A3DC0B;
    dw InstList_Reflec_FacingUpLeft                                      ;A3DC0D;
    dw InstList_Reflec_FacingUp                                          ;A3DC0F;
    dw InstList_Reflec_FacingUpRight                                     ;A3DC11;
    dw InstList_Reflec_FacingRight                                       ;A3DC13;
    dw InstList_Reflec_FacingDownRight                                   ;A3DC15;
    dw InstList_Reflec_FacingDown                                        ;A3DC17;
    dw InstList_Reflec_FacingDownLeft                                    ;A3DC19;


;;; $DC1B: RTL. Main AI - enemy $DBFF (reflec) ;;;
RTL_A3DC1B:
    RTL                                                                  ;A3DC1B;


;;; $DC1C: Enemy shot - enemy $DBFF (reflec) ;;;
EnemyShot_Reflec:
    LDX.W EnemyIndex                                                     ;A3DC1C;
    LDA.W CollisionIndex                                                 ;A3DC1F;
    ASL                                                                  ;A3DC22;
    TAY                                                                  ;A3DC23;
    LDA.W #$000A                                                         ;A3DC24;
    STA.W Enemy.invincibilityTimer,X                                     ;A3DC27;
    LDA.W Reflect.reflectionAxis,X                                       ;A3DC2A;
    ASL                                                                  ;A3DC2D;
    ASL                                                                  ;A3DC2E;
    ASL                                                                  ;A3DC2F;
    ASL                                                                  ;A3DC30;
    ASL                                                                  ;A3DC31;
    STA.W Temp_Unknown0E32                                               ;A3DC32;
    LDA.W SamusProjectile_Directions,Y                                   ;A3DC35;
    AND.W #$000F                                                         ;A3DC38;
    ASL                                                                  ;A3DC3B;
    CLC                                                                  ;A3DC3C;
    ADC.W Temp_Unknown0E32                                               ;A3DC3D;
    TAX                                                                  ;A3DC40;
    STA.W Temp_Unknown0E32                                               ;A3DC41;
    LDA.W .reflectedDirectionTable,X                                     ;A3DC44;
    CMP.W #$8000                                                         ;A3DC47;
    BEQ +                                                                ;A3DC4A;
    LDA.W .reflectedDirectionTable,X                                     ;A3DC4C;
    BMI .executeFunction                                                 ;A3DC4F;
    BRA .skipFunction                                                    ;A3DC51;

  .executeFunction:
    JSR.W (.reflectedDirectionTable_offsetNegatives,X)                   ;A3DC53;
    LDX.W Temp_Unknown0E32                                               ;A3DC56;
    LDA.W .reflectedDirectionTable,X                                     ;A3DC59;
    EOR.W #$FFFF                                                         ;A3DC5C;
    INC                                                                  ;A3DC5F;

  .skipFunction:
    STA.W SamusProjectile_Directions,Y                                   ;A3DC60;
    LDA.W SamusProjectile_Types,Y                                        ;A3DC63;
    AND.W #$7FFF                                                         ;A3DC66;
    STA.W SamusProjectile_Types,Y                                        ;A3DC69;
    STY.B DP_Temp14                                                      ;A3DC6C;
    JSL.L ProjectileReflection                                           ;A3DC6E;
    LDA.W #$0057                                                         ;A3DC72;
    JSL.L QueueSound_Lib2_Max6                                           ;A3DC75;
    RTL                                                                  ;A3DC79;

+   LDA.W SamusProjectile_Directions,Y                                   ;A3DC7A;
    ORA.W #$0010                                                         ;A3DC7D;
    STA.W SamusProjectile_Directions,Y                                   ;A3DC80;
    LDA.W Enemy.health,X                                                 ;A3DC83;
    BEQ .return                                                          ;A3DC86;
    JSL.L CommonA3_NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic     ;A3DC88;
    LDA.W Enemy.health,X                                                 ;A3DC8C;
    BNE .return                                                          ;A3DC8F;
    LDA.W Reflect.reflectionAxis,X                                       ;A3DC91;
    ASL                                                                  ;A3DC94;
    TAY                                                                  ;A3DC95;
    LDA.W .pointers,Y                                                    ;A3DC96;
    STA.W Enemy.instList,X                                               ;A3DC99;
    LDA.W #$0001                                                         ;A3DC9C;
    STA.W Enemy.instTimer,X                                              ;A3DC9F;
    STZ.W Enemy.loopCounter,X                                            ;A3DCA2;

  .return:
    RTL                                                                  ;A3DCA5;

  .pointers:
; Instruction lists for when health reaches zero...
    dw InstList_Reflec_ZeroHealth_FacingLeft                             ;A3DCA6;
    dw InstList_Reflec_ZeroHealth_FacingUpLeft                           ;A3DCA8;
    dw InstList_Reflec_ZeroHealth_FacingUp                               ;A3DCAA;
    dw InstList_Reflec_ZeroHealth_FacingUpRight                          ;A3DCAC;

  .reflectedDirectionTable:                                              ;A3DCAE;
; Reflected direction table
; 8000h = no reflected projectile
; Negative = reflection projectile position is offset
;        _______________________________________________________ Up, facing right
;       |      _________________________________________________ Up-right
;       |     |      ___________________________________________ Right
;       |     |     |      _____________________________________ Down-right
;       |     |     |     |      _______________________________ Down, facing right
;       |     |     |     |     |      _________________________ Down, facing left
;       |     |     |     |     |     |      ___________________ Down-left
;       |     |     |     |     |     |     |      _____________ Left
;       |     |     |     |     |     |     |     |      _______ Up-left
;       |     |     |     |     |     |     |     |     |      _ Up, facing left
;       |     |     |     |     |     |     |     |     |     |
    dw $8000,$FFF8,$0007,$FFFA,$8000,$8000,$FFFD,$0002,$FFFF,$8000, $0000,$0000,$0000,$0000,$0000,$0000 ; 0: Vertical
    dw $FFFE,$8000,$FFF7,$0008,$FFF9,$FFF9,$8000,$FFFB,$0003,$FFFE, $0000,$0000,$0000,$0000,$0000,$0000 ; 1: Up-right diagonal
    dw $0004,$FFFD,$8000,$FFFF,$0000,$0009,$FFF8,$8000,$FFFA,$0005, $0000,$0000,$0000,$0000,$0000,$0000 ; 2: Horizontal
    dw $FFF9,$0006,$FFFC,$8000,$FFFE,$FFFE,$0001,$FFF7,$8000,$FFF9, $0000,$0000,$0000,$0000,$0000,$0000 ; 3: Down-right diagonal

  .reflectedDirectionTable_offsetNegatives:                              ;A3DD2E;
; Offset function for negative entries of above table
;        _______________________________________________________ Up, facing right
;       |      _________________________________________________ Up-right
;       |     |      ___________________________________________ Right
;       |     |     |      _____________________________________ Down-right
;       |     |     |     |      _______________________________ Down, facing right
;       |     |     |     |     |      _________________________ Down, facing left
;       |     |     |     |     |     |      ___________________ Down-left
;       |     |     |     |     |     |     |      _____________ Left
;       |     |     |     |     |     |     |     |      _______ Up-left
;       |     |     |     |     |     |     |     |     |      _ Up, facing left
;       |     |     |     |     |     |     |     |     |     |
    dw $0000,$DDAE,$0000,$DDAE,$0000,$0000,$DDCF,$0000,$DDCF,$0000, $0000,$0000,$0000,$0000,$0000,$0000 ; 0: Vertical
    dw $DDF0,$0000,$DE0D,$0000,$DE2A,$DE2A,$0000,$DE47,$0000,$DDF0, $0000,$0000,$0000,$0000,$0000,$0000 ; 1: Up-right diagonal
    dw $0000,$DE64,$0000,$DE85,$0000,$0000,$DE85,$0000,$DE64,$0000, $0000,$0000,$0000,$0000,$0000,$0000 ; 2: Horizontal
    dw $DEA6,$0000,$DEC3,$0000,$DEE0,$DEE0,$0000,$DEFD,$0000,$DEA6, $0000,$0000,$0000,$0000,$0000,$0000 ; 3: Down-right diagonal


;;; $DDAE: Reflection offset function - vertical - up-right / down-right ;;;
Function_Reflec_ReflectionOffset_Vertical_UpRight_DownRight:
    LDX.W EnemyIndex                                                     ;A3DDAE;
    LDA.W Enemy.XPosition,X                                              ;A3DDB1;
    SEC                                                                  ;A3DDB4;
    SBC.W #$0008                                                         ;A3DDB5;
    STA.W Temp_Unknown0E36                                               ;A3DDB8;
    LDA.W SamusProjectile_XPositions,Y                                   ;A3DDBB;
    CLC                                                                  ;A3DDBE;
    ADC.W SamusProjectile_XRadii,Y                                       ;A3DDBF;
    CMP.W Temp_Unknown0E36                                               ;A3DDC2;
    BPL .return1                                                         ;A3DDC5;
    LDA.W #$0000                                                         ;A3DDC7;
    RTS                                                                  ;A3DDCA;

  .return1:
    LDA.W #$0001                                                         ;A3DDCB;
    RTS                                                                  ;A3DDCE;


;;; $DDCF: Reflection offset function - vertical - up-left / down-left ;;;
Function_Reflec_ReflectionOffset_Vertical_UpLeft_DownLeft:
    LDX.W EnemyIndex                                                     ;A3DDCF;
    LDA.W Enemy.XPosition,X                                              ;A3DDD2;
    CLC                                                                  ;A3DDD5;
    ADC.W #$0008                                                         ;A3DDD6;
    STA.W Temp_Unknown0E36                                               ;A3DDD9;
    LDA.W SamusProjectile_XPositions,Y                                   ;A3DDDC;
    SEC                                                                  ;A3DDDF;
    SBC.W SamusProjectile_XRadii,Y                                       ;A3DDE0;
    CMP.W Temp_Unknown0E36                                               ;A3DDE3;
    BMI .return1                                                         ;A3DDE6;
    LDA.W #$0000                                                         ;A3DDE8;
    RTS                                                                  ;A3DDEB;

  .return1:
    LDA.W #$0001                                                         ;A3DDEC;
    RTS                                                                  ;A3DDEF;


;;; $DDF0: Reflection offset function - up-right diagonal - up ;;;
Function_Reflec_ReflectionOffset_UpRightDiagonal_Up:
    LDX.W EnemyIndex                                                     ;A3DDF0;
    LDA.W Enemy.XPosition,X                                              ;A3DDF3;
    STA.W Temp_Unknown0E36                                               ;A3DDF6;
    LDA.W SamusProjectile_XPositions,Y                                   ;A3DDF9;
    CLC                                                                  ;A3DDFC;
    ADC.W SamusProjectile_XRadii,Y                                       ;A3DDFD;
    CMP.W Temp_Unknown0E36                                               ;A3DE00;
    BMI .return1                                                         ;A3DE03;
    LDA.W #$0000                                                         ;A3DE05;
    RTS                                                                  ;A3DE08;

  .return1:
    LDA.W #$0001                                                         ;A3DE09;
    RTS                                                                  ;A3DE0C;


;;; $DE0D: Reflection offset function - up-right diagonal - right ;;;
Function_Reflec_ReflectionOffset_UpRightDiagonal_Right:
    LDX.W EnemyIndex                                                     ;A3DE0D;
    LDA.W Enemy.YPosition,X                                              ;A3DE10;
    STA.W Temp_Unknown0E36                                               ;A3DE13;
    LDA.W SamusProjectile_YPositions,Y                                   ;A3DE16;
    SEC                                                                  ;A3DE19;
    SBC.W SamusProjectile_YRadii,Y                                       ;A3DE1A;
    CMP.W Temp_Unknown0E36                                               ;A3DE1D;
    BPL .return1                                                         ;A3DE20;
    LDA.W #$0000                                                         ;A3DE22;
    RTS                                                                  ;A3DE25;

  .return1:
    LDA.W #$0001                                                         ;A3DE26;
    RTS                                                                  ;A3DE29;


;;; $DE2A: Reflection offset function - up-right diagonal - down ;;;
Function_Reflec_ReflectionOffset_UpRightDiagonal_Down:
    LDX.W EnemyIndex                                                     ;A3DE2A;
    LDA.W Enemy.XPosition,X                                              ;A3DE2D;
    STA.W Temp_Unknown0E36                                               ;A3DE30;
    LDA.W SamusProjectile_XPositions,Y                                   ;A3DE33;
    SEC                                                                  ;A3DE36;
    SBC.W SamusProjectile_XRadii,Y                                       ;A3DE37;
    CMP.W Temp_Unknown0E36                                               ;A3DE3A;
    BPL .return1                                                         ;A3DE3D;
    LDA.W #$0000                                                         ;A3DE3F;
    RTS                                                                  ;A3DE42;

  .return1:
    LDA.W #$0001                                                         ;A3DE43;
    RTS                                                                  ;A3DE46;


;;; $DE47: Reflection offset function - up-right diagonal - left ;;;
Function_Reflec_ReflectionOffset_UpRightDiagonal_Left:
    LDX.W EnemyIndex                                                     ;A3DE47;
    LDA.W Enemy.YPosition,X                                              ;A3DE4A;
    STA.W Temp_Unknown0E36                                               ;A3DE4D;
    LDA.W SamusProjectile_YPositions,Y                                   ;A3DE50;
    CLC                                                                  ;A3DE53;
    ADC.W SamusProjectile_YRadii,Y                                       ;A3DE54;
    CMP.W Temp_Unknown0E36                                               ;A3DE57;
    BMI .return1                                                         ;A3DE5A;
    LDA.W #$0000                                                         ;A3DE5C;
    RTS                                                                  ;A3DE5F;

  .return1:
    LDA.W #$0001                                                         ;A3DE60;
    RTS                                                                  ;A3DE63;


;;; $DE64: Reflection offset function - horizontal - up-right / up-left ;;;
Function_Reflec_ReflectionOffset_Horizontal_UpRight_UpLeft:
    LDX.W EnemyIndex                                                     ;A3DE64;
    LDA.W Enemy.YPosition,X                                              ;A3DE67;
    CLC                                                                  ;A3DE6A;
    ADC.W #$0008                                                         ;A3DE6B;
    STA.W Temp_Unknown0E36                                               ;A3DE6E;
    LDA.W SamusProjectile_YPositions,Y                                   ;A3DE71;
    SEC                                                                  ;A3DE74;
    SBC.W SamusProjectile_YRadii,Y                                       ;A3DE75;
    CMP.W Temp_Unknown0E36                                               ;A3DE78;
    BMI .return1                                                         ;A3DE7B;
    LDA.W #$0000                                                         ;A3DE7D;
    RTS                                                                  ;A3DE80;

  .return1:
    LDA.W #$0001                                                         ;A3DE81;
    RTS                                                                  ;A3DE84;


;;; $DE85: Reflection offset function - horizontal - down-right / down-left ;;;
Func_Reflec_ReflectionOffset_Horizontal_DownRight_DownLeft:
    LDX.W EnemyIndex                                                     ;A3DE85;
    LDA.W Enemy.YPosition,X                                              ;A3DE88;
    SEC                                                                  ;A3DE8B;
    SBC.W #$0008                                                         ;A3DE8C;
    STA.W Temp_Unknown0E36                                               ;A3DE8F;
    LDA.W SamusProjectile_YPositions,Y                                   ;A3DE92;
    CLC                                                                  ;A3DE95;
    ADC.W SamusProjectile_YRadii,Y                                       ;A3DE96;
    CMP.W Temp_Unknown0E36                                               ;A3DE99;
    BPL .return1                                                         ;A3DE9C;
    LDA.W #$0000                                                         ;A3DE9E;
    RTS                                                                  ;A3DEA1;

  .return1:
    LDA.W #$0001                                                         ;A3DEA2;
    RTS                                                                  ;A3DEA5;


;;; $DEA6: Reflection offset function - down-right diagonal - up ;;;
Function_Reflec_ReflectionOffset_DownRightDiagonal_Up:
    LDX.W EnemyIndex                                                     ;A3DEA6;
    LDA.W Enemy.XPosition,X                                              ;A3DEA9;
    STA.W Temp_Unknown0E36                                               ;A3DEAC;
    LDA.W SamusProjectile_XPositions,Y                                   ;A3DEAF;
    SEC                                                                  ;A3DEB2;
    SBC.W SamusProjectile_XRadii,Y                                       ;A3DEB3;
    CMP.W Temp_Unknown0E36                                               ;A3DEB6;
    BMI .return1                                                         ;A3DEB9;
    LDA.W #$0000                                                         ;A3DEBB;
    RTS                                                                  ;A3DEBE;

  .return1:
    LDA.W #$0001                                                         ;A3DEBF;
    RTS                                                                  ;A3DEC2;


;;; $DEC3: Reflection offset function - down-right diagonal - right ;;;
Function_Reflec_ReflectionOffset_DownRightDiagonal_Right:
    LDX.W EnemyIndex                                                     ;A3DEC3;
    LDA.W Enemy.YPosition,X                                              ;A3DEC6;
    STA.W Temp_Unknown0E36                                               ;A3DEC9;
    LDA.W SamusProjectile_YPositions,Y                                   ;A3DECC;
    CLC                                                                  ;A3DECF;
    ADC.W SamusProjectile_YRadii,Y                                       ;A3DED0;
    CMP.W Temp_Unknown0E36                                               ;A3DED3;
    BPL .return0                                                         ;A3DED6;
    LDA.W #$0001                                                         ;A3DED8;
    RTS                                                                  ;A3DEDB;

  .return0:
    LDA.W #$0000                                                         ;A3DEDC;
    RTS                                                                  ;A3DEDF;


;;; $DEE0: Reflection offset function - down-right diagonal - down ;;;
Function_Reflec_ReflectionOffset_DownRightDiagonal_Down:
    LDX.W EnemyIndex                                                     ;A3DEE0;
    LDA.W Enemy.XPosition,X                                              ;A3DEE3;
    STA.W Temp_Unknown0E36                                               ;A3DEE6;
    LDA.W SamusProjectile_XPositions,Y                                   ;A3DEE9;
    SEC                                                                  ;A3DEEC;
    SBC.W SamusProjectile_XRadii,Y                                       ;A3DEED;
    CMP.W Temp_Unknown0E36                                               ;A3DEF0;
    BMI .return1                                                         ;A3DEF3;
    LDA.W #$0000                                                         ;A3DEF5;
    RTS                                                                  ;A3DEF8;

  .return1:
    LDA.W #$0001                                                         ;A3DEF9;
    RTS                                                                  ;A3DEFC;


;;; $DEFD: Reflection offset function - down-right diagonal - left ;;;
Function_Reflec_ReflectionOffset_DownRightDiagonal_Left:
    LDX.W EnemyIndex                                                     ;A3DEFD;
    LDA.W Enemy.YPosition,X                                              ;A3DF00;
    STA.W Temp_Unknown0E36                                               ;A3DF03;
    LDA.W SamusProjectile_YPositions,Y                                   ;A3DF06;
    SEC                                                                  ;A3DF09;
    SBC.W SamusProjectile_YRadii,Y                                       ;A3DF0A;
    CMP.W Temp_Unknown0E36                                               ;A3DF0D;
    BPL .return1                                                         ;A3DF10;
    LDA.W #$0000                                                         ;A3DF12;
    RTS                                                                  ;A3DF15;

  .return1:
    LDA.W #$0001                                                         ;A3DF16;
    RTS                                                                  ;A3DF19;


;;; $DF1A: Reflec spritemaps ;;;
Spritemap_Reflec_FacingLeft:
    dw $0003                                                             ;A3DF1A;
    %spritemapEntry(1, $1F0, $00, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $10D)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $100)

Spritemap_Reflec_FacingUpLeft:
    dw $0003                                                             ;A3DF2B;
    %spritemapEntry(1, $1EA, $F3, 0, 0, 2, 0, $11A)
    %spritemapEntry(1, $1F2, $EB, 0, 0, 2, 0, $10B)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $102)

Spritemap_Reflec_FacingUp:
    dw $0003                                                             ;A3DF3C;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $00, $F1, 1, 0, 2, 0, $118)
    %spritemapEntry(1, $1F0, $F1, 0, 0, 2, 0, $108)

Spritemap_Reflec_FacingUpRight:
    dw $0003                                                             ;A3DF4D;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $06, $F3, 0, 1, 2, 0, $11A)
    %spritemapEntry(1, $1FE, $EB, 0, 1, 2, 0, $10B)

Spritemap_Reflec_FacingRight:
    dw $0003                                                             ;A3DF5E;
    %spritemapEntry(1, $00, $00, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $00, $F0, 0, 1, 2, 0, $10D)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $100)

Spritemap_Reflec_FacingDownRight:
    dw $0003                                                             ;A3DF6F;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $06, $FD, 1, 1, 2, 0, $11A)
    %spritemapEntry(1, $1FE, $05, 1, 1, 2, 0, $10B)

Spritemap_Reflec_FacingDown:
    dw $0003                                                             ;A3DF80;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $00, $FF, 0, 0, 2, 0, $118)
    %spritemapEntry(1, $1F0, $FF, 1, 0, 2, 0, $108)

Spritemap_Reflec_FacingDownLeft:
    dw $0003                                                             ;A3DF91;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1EA, $FD, 1, 0, 2, 0, $11A)
    %spritemapEntry(1, $1F2, $05, 1, 0, 2, 0, $10B)


;;; $DFA2: Palette - enemy $DC3F (Wrecked Ship orange zoomer) ;;;
Palette_HZoomer:
    dw $3800,$7F5A,$3BE0,$2680,$0920,$4F5A,$36B5,$2610                   ;A3DFA2;
    dw $1DCE,$5294,$39CE,$2108,$1084,$033B,$0216,$0113                   ;A3DFB2;


;;; $DFC2: Instruction - enemy function = [[Y]] ;;;
Instruction_HZoomer_FunctionInY:
    LDA.W $0000,Y                                                        ;A3DFC2;
    STA.W Crawler.function,X                                             ;A3DFC5;
    INY                                                                  ;A3DFC8;
    INY                                                                  ;A3DFC9;
    RTL                                                                  ;A3DFCA;


;;; $DFCB: Instruction list - Wrecked Ship orange zoomer - upside right ;;;
InstList_HZoomer_UpsideRight_0:
    dw Instruction_HZoomer_FunctionInY                                   ;A3DFCB;
    dw Function_HZoomer_CrawlingVertically                               ;A3DFCD;

InstList_HZoomer_UpsideRight_1:
    dw $0003,Spritemap_Crawlers_UpsideRight_0                            ;A3DFCF;
    dw $0003,Spritemap_Crawlers_UpsideRight_1                            ;A3DFD3;
    dw $0003,Spritemap_Crawlers_UpsideRight_2                            ;A3DFD7;
    dw $0003,Spritemap_Crawlers_UpsideRight_3                            ;A3DFDB;
    dw $0003,Spritemap_Crawlers_UpsideRight_4                            ;A3DFDF;
    dw Instruction_Common_GotoY                                          ;A3DFE3;
    dw InstList_HZoomer_UpsideRight_1                                    ;A3DFE5;


;;; $DFE7: Instruction list - Wrecked Ship orange zoomer - upside left ;;;
InstList_HZoomer_UpsideLeft_0:
    dw Instruction_HZoomer_FunctionInY                                   ;A3DFE7;
    dw Function_HZoomer_CrawlingVertically                               ;A3DFE9;

InstList_HZoomer_UpsideLeft_1:
    dw $0003,Spritemap_Crawlers_UpsideLeft_0                             ;A3DFEB;
    dw $0003,Spritemap_Crawlers_UpsideLeft_1                             ;A3DFEF;
    dw $0003,Spritemap_Crawlers_UpsideLeft_2                             ;A3DFF3;
    dw $0003,Spritemap_Crawlers_UpsideLeft_3                             ;A3DFF7;
    dw $0003,Spritemap_Crawlers_UpsideLeft_4                             ;A3DFFB;
    dw Instruction_Common_GotoY                                          ;A3DFFF;
    dw InstList_HZoomer_UpsideLeft_1                                     ;A3E001;


;;; $E003: Instruction list - Wrecked Ship orange zoomer - upside down ;;;
InstList_HZoomer_UpsideDown_0:
    dw Instruction_HZoomer_FunctionInY                                   ;A3E003;
    dw Function_HZoomer_CrawlingHorizontally                             ;A3E005;

InstList_HZoomer_UpsideDown_1:
    dw $0003,Spritemap_Crawlers_UpsideDown_FacingLeft_0                  ;A3E007;
    dw $0003,Spritemap_Crawlers_UpsideDown_FacingLeft_1                  ;A3E00B;
    dw $0003,Spritemap_Crawlers_UpsideDown_FacingLeft_2                  ;A3E00F;
    dw $0003,Spritemap_Crawlers_UpsideDown_FacingLeft_3                  ;A3E013;
    dw $0003,Spritemap_Crawlers_UpsideDown_FacingLeft_4                  ;A3E017;
    dw Instruction_Common_GotoY                                          ;A3E01B;
    dw InstList_HZoomer_UpsideDown_1                                     ;A3E01D;


;;; $E01F: Instruction list - Wrecked Ship orange zoomer - upside up ;;;
InstList_HZoomer_UpsideUp_0:
    dw Instruction_HZoomer_FunctionInY                                   ;A3E01F;
    dw Function_HZoomer_CrawlingHorizontally                             ;A3E021;

InstList_HZoomer_UpsideUp_1:
    dw $0003,Spritemap_Crawlers_UpsideUp_FacingRight_0                   ;A3E023;
    dw $0003,Spritemap_Crawlers_UpsideUp_FacingRight_1                   ;A3E027;
    dw $0003,Spritemap_Crawlers_UpsideUp_FacingRight_2                   ;A3E02B;
    dw $0003,Spritemap_Crawlers_UpsideUp_FacingRight_3                   ;A3E02F;
    dw $0003,Spritemap_Crawlers_UpsideUp_FacingRight_4                   ;A3E033;
    dw Instruction_Common_GotoY                                          ;A3E037;
    dw InstList_HZoomer_UpsideUp_1                                       ;A3E039;


;;; $E03B: Wrecked Ship orange zoomer initial instruction list pointers ;;;
HZoomerInitialInstListPointers:
; Indexed by [enemy initialisation parameter] * 2
    dw InstList_HZoomer_UpsideRight_0                                    ;A3E03B; 0: Upside right
    dw InstList_HZoomer_UpsideLeft_0                                     ;A3E03D; 1: Upside left
    dw InstList_HZoomer_UpsideDown_0                                     ;A3E03F; 2: Upside down
    dw InstList_HZoomer_UpsideUp_0                                       ;A3E041; 3: Upside up


;;; $E043: Initialisation AI - enemy $DC3F (Wrecked Ship orange zoomer) ;;;
InitAI_HZoomer:
; Not sure why the devs didn't use the common init AI $E67A like the other creepy crawlies
    LDX.W EnemyIndex                                                     ;A3E043;
    LDA.W Enemy.instList,X                                               ;A3E046;
    AND.W #$0003                                                         ;A3E049;
    ASL                                                                  ;A3E04C;
    TAY                                                                  ;A3E04D;
    LDA.W HZoomerInitialInstListPointers,Y                               ;A3E04E;
    STA.W Enemy.instList,X                                               ;A3E051;
    LDA.W #.return                                                       ;A3E054;
    STA.W Crawler.function,X                                             ;A3E057;
    LDA.W Enemy.init0,X                                                  ;A3E05A;
    ASL                                                                  ;A3E05D;
    TAY                                                                  ;A3E05E;
    LDA.W CrawlersSpeedTable,Y                                           ;A3E05F;
    STA.W Crawler.XVelocity,X                                            ;A3E062;
    STA.W Crawler.YVelocity,X                                            ;A3E065;
    LDA.W Enemy.properties,X                                             ;A3E068;
    AND.W #$0003                                                         ;A3E06B;
    BNE +                                                                ;A3E06E;
    LDA.W Crawler.XVelocity,X                                            ;A3E070;
    EOR.W #$FFFF                                                         ;A3E073;
    INC                                                                  ;A3E076;
    STA.W Crawler.XVelocity,X                                            ;A3E077;
    RTL                                                                  ;A3E07A;

+   CMP.W #$0002                                                         ;A3E07B;
    BNE .return                                                          ;A3E07E;
    LDA.W Crawler.YVelocity,X                                            ;A3E080;
    EOR.W #$FFFF                                                         ;A3E083;
    INC                                                                  ;A3E086;
    STA.W Crawler.YVelocity,X                                            ;A3E087;

  .return:
    RTL                                                                  ;A3E08A;


;;; $E08B: Main AI - enemy $DC3F (Wrecked Ship orange zoomer) ;;;
MainAI_HZoomer:
    LDX.W EnemyIndex                                                     ;A3E08B;
    JMP.W (Crawler.function,X)                                           ;A3E08E;


;;; $E091: Wrecked Ship orange zoomer function - crawling vertically ;;;
Function_HZoomer_CrawlingVertically:
    LDA.W EarthquakeTimer                                                ;A3E091;
    CMP.W #$001E                                                         ;A3E094;
    BNE .noQuake                                                         ;A3E097;
    LDA.W EarthquakeType                                                 ;A3E099;
    CMP.W #$0014                                                         ;A3E09C;
    BNE .noQuake                                                         ;A3E09F;
    LDA.W Crawler.function,X                                             ;A3E0A1;
    STA.L Crawler.nonFallingFunction,X                                   ;A3E0A4;
    LDA.W #Function_Crawlers_Falling                                     ;A3E0A8;
    STA.W Crawler.function,X                                             ;A3E0AB;

  .noQuake:
    STZ.B DP_Temp12                                                      ;A3E0AE;
    STZ.B DP_Temp14                                                      ;A3E0B0;
    LDA.W Crawler.XVelocity,X                                            ;A3E0B2;
    BPL +                                                                ;A3E0B5;
    DEC.B DP_Temp14                                                      ;A3E0B7;

+   STA.B DP_Temp13                                                      ;A3E0B9;
    LDA.B DP_Temp14                                                      ;A3E0BB;
    BPL .inc                                                             ;A3E0BD;
    DEC                                                                  ;A3E0BF;
    BRA .moveRight                                                       ;A3E0C0;

  .inc:
    INC                                                                  ;A3E0C2;

  .moveRight:
    STA.B DP_Temp14                                                      ;A3E0C3;
    JSL.L MoveEnemyRightBy_14_12_ProcessSlopes                           ;A3E0C5;
    BCC .outsideTurn                                                     ;A3E0C9;
    LDA.W #$0000                                                         ;A3E0CB;
    STA.L Crawler.consecutiveTurnCounter,X                               ;A3E0CE;
    JSL.L AlignEnemyYPositionWIthNonSquareSlope                          ;A3E0D2;
    STZ.B DP_Temp12                                                      ;A3E0D6;
    STZ.B DP_Temp14                                                      ;A3E0D8;
    LDA.W Crawler.YVelocity,X                                            ;A3E0DA;
    BPL .moveDown                                                        ;A3E0DD;
    DEC.B DP_Temp14                                                      ;A3E0DF;

  .moveDown:
    STA.B DP_Temp13                                                      ;A3E0E1;
    JSL.L MoveEnemyDownBy_14_12                                          ;A3E0E3;
    BCS .insideTurn                                                      ;A3E0E7;
    LDX.W EnemyIndex                                                     ;A3E0E9;
    LDA.W SamusYPosition                                                 ;A3E0EC;
    SEC                                                                  ;A3E0EF;
    SBC.W Enemy.YPosition,X                                              ;A3E0F0;
    BPL .SamusRightOfZHoomer                                             ;A3E0F3;
    LDA.W Crawler.YVelocity,X                                            ;A3E0F5;
    BMI .return                                                          ;A3E0F8;
    BRA .negateY                                                         ;A3E0FA;

  .SamusRightOfZHoomer:
    LDA.W Crawler.YVelocity,X                                            ;A3E0FC;
    BPL .return                                                          ;A3E0FF;

  .negateY:
    EOR.W #$FFFF                                                         ;A3E101;
    INC                                                                  ;A3E104;

  .return:
    STA.W Crawler.YVelocity,X                                            ;A3E105;
    RTL                                                                  ;A3E108;

  .insideTurn:
    LDA.W Crawler.XVelocity,X                                            ;A3E109;
    EOR.W #$FFFF                                                         ;A3E10C;
    INC                                                                  ;A3E10F;
    STA.W Crawler.XVelocity,X                                            ;A3E110;
    LDY.W #InstList_HZoomer_UpsideUp_0                                   ;A3E113;
    LDY.W #InstList_HZoomer_UpsideUp_0                                   ;A3E116; >.<
    LDA.W Crawler.YVelocity,X                                            ;A3E119;
    BPL ..keepUp                                                         ;A3E11C;
    LDY.W #InstList_HZoomer_UpsideDown_0                                 ;A3E11E;

  ..keepUp:
    TYA                                                                  ;A3E121;
    STA.W Enemy.instList,X                                               ;A3E122;
    LDA.W #$0001                                                         ;A3E125;
    STA.W Enemy.instTimer,X                                              ;A3E128;
    RTL                                                                  ;A3E12B;

  .outsideTurn:
    LDA.L Crawler.consecutiveTurnCounter,X                               ;A3E12C;
    INC                                                                  ;A3E130;
    STA.L Crawler.consecutiveTurnCounter,X                               ;A3E131;
    CMP.W #$0004                                                         ;A3E135;
    BMI .notFalling                                                      ;A3E138;
    LDA.W Crawler.function,X                                             ;A3E13A;
    STA.L Crawler.nonFallingFunction,X                                   ;A3E13D;
    LDA.W #Function_Crawlers_Falling                                     ;A3E141;
    STA.W Crawler.function,X                                             ;A3E144;
    RTL                                                                  ;A3E147;

  .notFalling:
    LDA.W Crawler.YVelocity,X                                            ;A3E148;
    EOR.W #$FFFF                                                         ;A3E14B;
    INC                                                                  ;A3E14E;
    STA.W Crawler.YVelocity,X                                            ;A3E14F;
    LDY.W #InstList_HZoomer_UpsideUp_0                                   ;A3E152;
    LDA.W Crawler.YVelocity,X                                            ;A3E155;
    BPL .keepUp                                                          ;A3E158;
    LDY.W #InstList_HZoomer_UpsideDown_0                                 ;A3E15A;

  .keepUp:
    TYA                                                                  ;A3E15D;
    STA.W Enemy.instList,X                                               ;A3E15E;
    LDA.W #$0001                                                         ;A3E161;
    STA.W Enemy.instTimer,X                                              ;A3E164;
    RTL                                                                  ;A3E167;


;;; $E168: Wrecked Ship orange zoomer function - crawling horizontally ;;;
Function_HZoomer_CrawlingHorizontally:
    LDA.W EarthquakeTimer                                                ;A3E168;
    CMP.W #$001E                                                         ;A3E16B;
    BNE .noQuake                                                         ;A3E16E;
    LDA.W EarthquakeType                                                 ;A3E170;
    CMP.W #$0014                                                         ;A3E173;
    BNE .noQuake                                                         ;A3E176;
    LDA.W Crawler.function,X                                             ;A3E178;
    STA.L Crawler.nonFallingFunction,X                                   ;A3E17B;
    LDA.W #Function_Crawlers_Falling                                     ;A3E17F;
    STA.W Crawler.function,X                                             ;A3E182;

  .noQuake:
    STZ.B DP_Temp12                                                      ;A3E185;
    STZ.B DP_Temp14                                                      ;A3E187;
    LDA.W Crawler.YVelocity,X                                            ;A3E189;
    BPL +                                                                ;A3E18C;
    DEC.B DP_Temp14                                                      ;A3E18E;

+   STA.B DP_Temp13                                                      ;A3E190;
    LDA.B DP_Temp14                                                      ;A3E192;
    BPL .inc                                                             ;A3E194;
    DEC                                                                  ;A3E196;
    BRA .moveDown                                                        ;A3E197;

  .inc:
    INC                                                                  ;A3E199;

  .moveDown:
    STA.B DP_Temp14                                                      ;A3E19A;
    JSL.L MoveEnemyDownBy_14_12                                          ;A3E19C;
    BCC .outsideTurn                                                     ;A3E1A0;
    LDA.W #$0000                                                         ;A3E1A2;
    STA.L Crawler.consecutiveTurnCounter,X                               ;A3E1A5;
    STZ.B DP_Temp12                                                      ;A3E1A9;
    STZ.B DP_Temp14                                                      ;A3E1AB;
    LDA.W Crawler.XVelocity,X                                            ;A3E1AD;
    BPL .moveRight                                                       ;A3E1B0;
    DEC.B DP_Temp14                                                      ;A3E1B2;

  .moveRight:
    STA.B DP_Temp13                                                      ;A3E1B4;
    JSL.L MoveEnemyRightBy_14_12_ProcessSlopes                           ;A3E1B6;
    BCS .insideTurn                                                      ;A3E1BA;
    JSL.L AlignEnemyYPositionWIthNonSquareSlope                          ;A3E1BC;
    LDX.W EnemyIndex                                                     ;A3E1C0;
    LDA.W SamusXPosition                                                 ;A3E1C3;
    SEC                                                                  ;A3E1C6;
    SBC.W Enemy.XPosition,X                                              ;A3E1C7;
    BPL .SamusToTheRight                                                 ;A3E1CA;
    LDA.W Crawler.XVelocity,X                                            ;A3E1CC;
    BMI .return                                                          ;A3E1CF;
    BRA .negate                                                          ;A3E1D1;

  .SamusToTheRight:
    LDA.W Crawler.XVelocity,X                                            ;A3E1D3;
    BPL .return                                                          ;A3E1D6;

  .negate:
    EOR.W #$FFFF                                                         ;A3E1D8;
    INC                                                                  ;A3E1DB;

  .return:
    STA.W Crawler.XVelocity,X                                            ;A3E1DC;
    RTL                                                                  ;A3E1DF;

  .insideTurn:
    LDA.W Crawler.YVelocity,X                                            ;A3E1E0;
    EOR.W #$FFFF                                                         ;A3E1E3;
    INC                                                                  ;A3E1E6;
    STA.W Crawler.YVelocity,X                                            ;A3E1E7;
    LDY.W #InstList_HZoomer_UpsideLeft_0                                 ;A3E1EA;
    LDA.W Crawler.XVelocity,X                                            ;A3E1ED;
    BPL .keepLeft                                                        ;A3E1F0;
    LDY.W #InstList_HZoomer_UpsideRight_0                                ;A3E1F2;

  .keepLeft:
    TYA                                                                  ;A3E1F5;
    STA.W Enemy.instList,X                                               ;A3E1F6;
    LDA.W #$0001                                                         ;A3E1F9;
    STA.W Enemy.instTimer,X                                              ;A3E1FC;
    RTL                                                                  ;A3E1FF;

  .outsideTurn:
    LDA.L Crawler.consecutiveTurnCounter,X                               ;A3E200;
    INC                                                                  ;A3E204;
    STA.L Crawler.consecutiveTurnCounter,X                               ;A3E205;
    CMP.W #$0004                                                         ;A3E209;
    BMI .notFalling                                                      ;A3E20C;
    LDA.W Crawler.function,X                                             ;A3E20E;
    STA.L Crawler.nonFallingFunction,X                                   ;A3E211;
    LDA.W #Function_Crawlers_Falling                                     ;A3E215;
    STA.W Crawler.function,X                                             ;A3E218;
    RTL                                                                  ;A3E21B;

  .notFalling:
    LDA.W Crawler.XVelocity,X                                            ;A3E21C;
    EOR.W #$FFFF                                                         ;A3E21F;
    INC                                                                  ;A3E222;
    STA.W Crawler.XVelocity,X                                            ;A3E223;
    LDY.W #InstList_HZoomer_UpsideLeft_0                                 ;A3E226;
    LDA.W Crawler.XVelocity,X                                            ;A3E229;
    BPL ..keepLeft                                                       ;A3E22C;
    LDY.W #InstList_HZoomer_UpsideRight_0                                ;A3E22E;

  ..keepLeft:
    TYA                                                                  ;A3E231;
    STA.W Enemy.instList,X                                               ;A3E232;
    LDA.W #$0001                                                         ;A3E235;
    STA.W Enemy.instTimer,X                                              ;A3E238;
    RTL                                                                  ;A3E23B;


;;; $E23C: Palette - enemy $DC7F (zeela) ;;;
Palette_Zeela:
    dw $3800,$3F5A,$2E50,$00E5,$0063,$3AB3,$220E,$1169                   ;A3E23C;
    dw $0927,$03FF,$02F7,$0210,$0108,$7FFF,$0299,$0170                   ;A3E24C;


;;; $E25C: Instruction list - zeela / zoomer - upside right ;;;
InstList_Zeela_Zoomer_UpsideRight_0:
    dw Instruction_Crawlers_FunctionInY                                  ;A3E25C;
    dw Function_Crawlers_CrawlingVertically                              ;A3E25E;

InstList_Zeela_Zoomer_UpsideRight_1:
    dw $0003,Spritemap_Crawlers_UpsideRight_0                            ;A3E260;
    dw $0003,Spritemap_Crawlers_UpsideRight_1                            ;A3E264;
    dw $0003,Spritemap_Crawlers_UpsideRight_2                            ;A3E268;
    dw $0003,Spritemap_Crawlers_UpsideRight_3                            ;A3E26C;
    dw $0003,Spritemap_Crawlers_UpsideRight_4                            ;A3E270;
    dw Instruction_Common_GotoY                                          ;A3E274;
    dw InstList_Zeela_Zoomer_UpsideRight_1                               ;A3E276;


;;; $E278: Instruction list - zeela / zoomer - upside left ;;;
InstList_Zeela_Zoomer_UpsideLeft_0:
    dw Instruction_Crawlers_FunctionInY                                  ;A3E278;
    dw Function_Crawlers_CrawlingVertically                              ;A3E27A;

InstList_Zeela_Zoomer_UpsideLeft_1:
    dw $0003,Spritemap_Crawlers_UpsideLeft_0                             ;A3E27C;
    dw $0003,Spritemap_Crawlers_UpsideLeft_1                             ;A3E280;
    dw $0003,Spritemap_Crawlers_UpsideLeft_2                             ;A3E284;
    dw $0003,Spritemap_Crawlers_UpsideLeft_3                             ;A3E288;
    dw $0003,Spritemap_Crawlers_UpsideLeft_4                             ;A3E28C;
    dw Instruction_Common_GotoY                                          ;A3E290;
    dw InstList_Zeela_Zoomer_UpsideLeft_1                                ;A3E292;


;;; $E294: Instruction list - zeela / zoomer - upside down ;;;
InstList_Zeela_Zoomer_UpsideDown_0:
    dw Instruction_Crawlers_FunctionInY                                  ;A3E294;
    dw Function_Crawlers_CrawlingHorizontally                            ;A3E296;

InstList_Zeela_Zoomer_UpsideDown_1:
    dw $0003,Spritemap_Crawlers_UpsideDown_FacingLeft_0                  ;A3E298;
    dw $0003,Spritemap_Crawlers_UpsideDown_FacingLeft_1                  ;A3E29C;
    dw $0003,Spritemap_Crawlers_UpsideDown_FacingLeft_2                  ;A3E2A0;
    dw $0003,Spritemap_Crawlers_UpsideDown_FacingLeft_3                  ;A3E2A4;
    dw $0003,Spritemap_Crawlers_UpsideDown_FacingLeft_4                  ;A3E2A8;
    dw Instruction_Common_GotoY                                          ;A3E2AC;
    dw InstList_Zeela_Zoomer_UpsideDown_1                                ;A3E2AE;


;;; $E2B0: Instruction list - zeela / zoomer - upside up ;;;
InstList_Zeela_Zoomer_UpsideUp_0:
    dw Instruction_Crawlers_FunctionInY                                  ;A3E2B0;
    dw Function_Crawlers_CrawlingHorizontally                            ;A3E2B2;

InstList_Zeela_Zoomer_UpsideUp_1:
    dw $0003,Spritemap_Crawlers_UpsideUp_FacingRight_0                   ;A3E2B4;
    dw $0003,Spritemap_Crawlers_UpsideUp_FacingRight_1                   ;A3E2B8;
    dw $0003,Spritemap_Crawlers_UpsideUp_FacingRight_2                   ;A3E2BC;
    dw $0003,Spritemap_Crawlers_UpsideUp_FacingRight_3                   ;A3E2C0;
    dw $0003,Spritemap_Crawlers_UpsideUp_FacingRight_4                   ;A3E2C4;
    dw Instruction_Common_GotoY                                          ;A3E2C8;
    dw InstList_Zeela_Zoomer_UpsideUp_1                                  ;A3E2CA;


;;; $E2CC: Zeela / zoomer initial instruction list pointers ;;;
InitialInstListPointers_Crawlers:
; Used by: zeela, zoomer, stone zoomer, sova

; Indexed by [enemy initialisation parameter] * 2
    dw InstList_Zeela_Zoomer_UpsideRight_0                               ;A3E2CC;
    dw InstList_Zeela_Zoomer_UpsideLeft_0                                ;A3E2CE;
    dw InstList_Zeela_Zoomer_UpsideDown_0                                ;A3E2D0;
    dw InstList_Zeela_Zoomer_UpsideUp_0                                  ;A3E2D2;


;;; $E2D4: Initialisation AI - enemy $DC7F (zeela) ;;;
InitAI_Zeela:
    LDX.W EnemyIndex                                                     ;A3E2D4;
    LDA.W Enemy.instList,X                                               ;A3E2D7;
    AND.W #$0003                                                         ;A3E2DA;
    ASL                                                                  ;A3E2DD;
    TAY                                                                  ;A3E2DE;
    LDA.W InitialInstListPointers_Crawlers,Y                             ;A3E2DF;
    STA.W Enemy.instList,X                                               ;A3E2E2;
    JMP.W InitAI_Crawlers_Common                                         ;A3E2E5;


;;; $E2E8: Zeela / zoomer spritemaps ;;;
; Used by: zeela, zoomer, stone zoomer, sova, Wrecked Ship orange zoomer
Spritemap_Crawlers_UpsideUp_FacingRight_0:
    dw $0004                                                             ;A3E2E8;
    %spritemapEntry(0, $02, $00, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $1F6, $00, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $00, $F8, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 2, 0, $100)

Spritemap_Crawlers_UpsideUp_FacingRight_1:
    dw $0004                                                             ;A3E2FE;
    %spritemapEntry(0, $02, $00, 0, 0, 2, 0, $123)
    %spritemapEntry(0, $1F6, $00, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $00, $F7, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F0, $F7, 0, 0, 2, 0, $100)

Spritemap_Crawlers_UpsideUp_FacingRight_2:
    dw $0004                                                             ;A3E314;
    %spritemapEntry(0, $02, $00, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $1F6, $00, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $1F0, $F7, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $00, $F7, 0, 1, 2, 0, $100)

Spritemap_Crawlers_UpsideUp_FacingRight_3:
    dw $0004                                                             ;A3E32A;
    %spritemapEntry(0, $02, $00, 0, 0, 2, 0, $127)
    %spritemapEntry(0, $1F6, $00, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1F0, $F7, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $00, $F7, 0, 1, 2, 0, $100)

Spritemap_Crawlers_UpsideUp_FacingRight_4:
    dw $0004                                                             ;A3E340;
    %spritemapEntry(0, $02, $00, 0, 0, 2, 0, $129)
    %spritemapEntry(0, $1F6, $00, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $00, $F8, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 2, 0, $100)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Crawlers_UpsideUp_FacingLeft_A3E356:
    dw $0004                                                             ;A3E356;
    %spritemapEntry(0, $1F5, $00, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $01, $00, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $1EF, $F8, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $1FF, $F8, 0, 1, 2, 0, $100)

UNUSED_Spritemap_Crawlers_UpsideUp_FacingLeft_A3E36C:
    dw $0004                                                             ;A3E36C;
    %spritemapEntry(0, $1F5, $00, 0, 1, 2, 0, $123)
    %spritemapEntry(0, $01, $00, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $1EF, $F7, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $1FF, $F7, 0, 1, 2, 0, $100)

UNUSED_Spritemap_Crawlers_UpsideUp_FacingLeft_A3E382:
    dw $0004                                                             ;A3E382;
    %spritemapEntry(0, $1F5, $00, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $01, $00, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $1FF, $F7, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1EF, $F7, 0, 0, 2, 0, $100)

UNUSED_Spritemap_Crawlers_UpsideUp_FacingLeft_A3E398:
    dw $0004                                                             ;A3E398;
    %spritemapEntry(0, $1F5, $00, 0, 1, 2, 0, $127)
    %spritemapEntry(0, $01, $00, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $1FF, $F7, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1EF, $F7, 0, 0, 2, 0, $100)

UNUSED_Spritemap_Crawlers_UpsideUp_FacingLeft_A3E3AE:
    dw $0004                                                             ;A3E3AE;
    %spritemapEntry(0, $1F5, $00, 0, 1, 2, 0, $129)
    %spritemapEntry(0, $01, $00, 0, 1, 2, 0, $128)
    %spritemapEntry(1, $1EF, $F8, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $1FF, $F8, 0, 1, 2, 0, $100)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Crawlers_UpsideLeft_0:
    dw $0004                                                             ;A3E3C4;
    %spritemapEntry(0, $00, $F6, 0, 0, 2, 0, $108)
    %spritemapEntry(0, $00, $02, 0, 0, 2, 0, $118)
    %spritemapEntry(1, $1F8, $00, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $104)

Spritemap_Crawlers_UpsideLeft_1:
    dw $0004                                                             ;A3E3DA;
    %spritemapEntry(0, $00, $F6, 0, 0, 2, 0, $109)
    %spritemapEntry(0, $00, $02, 0, 0, 2, 0, $119)
    %spritemapEntry(1, $1F7, $00, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1F7, $F0, 0, 0, 2, 0, $104)

Spritemap_Crawlers_UpsideLeft_2:
    dw $0004                                                             ;A3E3F0;
    %spritemapEntry(0, $00, $F6, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $00, $02, 0, 0, 2, 0, $11A)
    %spritemapEntry(1, $1F7, $F0, 1, 0, 2, 0, $106)
    %spritemapEntry(1, $1F7, $00, 1, 0, 2, 0, $104)

Spritemap_Crawlers_UpsideLeft_3:
    dw $0004                                                             ;A3E406;
    %spritemapEntry(0, $00, $F6, 0, 0, 2, 0, $10B)
    %spritemapEntry(0, $00, $02, 0, 0, 2, 0, $11B)
    %spritemapEntry(1, $1F7, $F0, 1, 0, 2, 0, $106)
    %spritemapEntry(1, $1F7, $00, 1, 0, 2, 0, $104)

Spritemap_Crawlers_UpsideLeft_4:
    dw $0004                                                             ;A3E41C;
    %spritemapEntry(0, $00, $F6, 0, 0, 2, 0, $10C)
    %spritemapEntry(0, $00, $02, 0, 0, 2, 0, $11C)
    %spritemapEntry(1, $1F8, $00, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $104)

Spritemap_Crawlers_UpsideDown_FacingLeft_0:
    dw $0004                                                             ;A3E432;
    %spritemapEntry(0, $02, $F8, 1, 0, 2, 0, $121)
    %spritemapEntry(0, $1F6, $F8, 1, 0, 2, 0, $120)
    %spritemapEntry(1, $00, $F8, 1, 0, 2, 0, $102)
    %spritemapEntry(1, $1F0, $F8, 1, 0, 2, 0, $100)

Spritemap_Crawlers_UpsideDown_FacingLeft_1:
    dw $0004                                                             ;A3E448;
    %spritemapEntry(0, $02, $F7, 1, 0, 2, 0, $123)
    %spritemapEntry(0, $1F6, $F7, 1, 0, 2, 0, $122)
    %spritemapEntry(1, $00, $F9, 1, 0, 2, 0, $102)
    %spritemapEntry(1, $1F0, $F9, 1, 0, 2, 0, $100)

Spritemap_Crawlers_UpsideDown_FacingLeft_2:
    dw $0004                                                             ;A3E45E;
    %spritemapEntry(0, $02, $F7, 1, 0, 2, 0, $125)
    %spritemapEntry(0, $1F6, $F7, 1, 0, 2, 0, $124)
    %spritemapEntry(1, $1F0, $F9, 1, 1, 2, 0, $102)
    %spritemapEntry(1, $00, $F9, 1, 1, 2, 0, $100)

Spritemap_Crawlers_UpsideDown_FacingLeft_3:
    dw $0004                                                             ;A3E474;
    %spritemapEntry(0, $02, $F7, 1, 0, 2, 0, $127)
    %spritemapEntry(0, $1F6, $F7, 1, 0, 2, 0, $126)
    %spritemapEntry(1, $1F0, $F9, 1, 1, 2, 0, $102)
    %spritemapEntry(1, $00, $F9, 1, 1, 2, 0, $100)

Spritemap_Crawlers_UpsideDown_FacingLeft_4:
    dw $0004                                                             ;A3E48A;
    %spritemapEntry(0, $02, $F8, 1, 0, 2, 0, $129)
    %spritemapEntry(0, $1F6, $F8, 1, 0, 2, 0, $128)
    %spritemapEntry(1, $00, $F8, 1, 0, 2, 0, $102)
    %spritemapEntry(1, $1F0, $F8, 1, 0, 2, 0, $100)

Spritemap_Crawlers_UpsideDown_FacingRight_0:
    dw $0004                                                             ;A3E4A0;
    %spritemapEntry(0, $1F5, $F8, 1, 1, 2, 0, $121)
    %spritemapEntry(0, $01, $F8, 1, 1, 2, 0, $120)
    %spritemapEntry(1, $1EF, $F8, 1, 1, 2, 0, $102)
    %spritemapEntry(1, $1FF, $F8, 1, 1, 2, 0, $100)

Spritemap_Crawlers_UpsideDown_FacingRight_1:
    dw $0004                                                             ;A3E4B6;
    %spritemapEntry(0, $1F5, $F7, 1, 1, 2, 0, $123)
    %spritemapEntry(0, $01, $F7, 1, 1, 2, 0, $122)
    %spritemapEntry(1, $1EF, $F9, 1, 1, 2, 0, $102)
    %spritemapEntry(1, $1FF, $F9, 1, 1, 2, 0, $100)

Spritemap_Crawlers_UpsideDown_FacingRight_2:
    dw $0004                                                             ;A3E4CC;
    %spritemapEntry(0, $1F5, $F7, 1, 1, 2, 0, $125)
    %spritemapEntry(0, $01, $F7, 1, 1, 2, 0, $124)
    %spritemapEntry(1, $1FF, $F9, 1, 0, 2, 0, $102)
    %spritemapEntry(1, $1EF, $F9, 1, 0, 2, 0, $100)

Spritemap_Crawlers_UpsideDown_FacingRight_3:
    dw $0004                                                             ;A3E4E2;
    %spritemapEntry(0, $1F5, $F7, 1, 1, 2, 0, $127)
    %spritemapEntry(0, $01, $F7, 1, 1, 2, 0, $126)
    %spritemapEntry(1, $1FF, $F9, 1, 0, 2, 0, $102)
    %spritemapEntry(1, $1EF, $F9, 1, 0, 2, 0, $100)

Spritemap_Crawlers_UpsideDown_FacingRight_4:
    dw $0004                                                             ;A3E4F8;
    %spritemapEntry(0, $1F5, $F8, 1, 1, 2, 0, $129)
    %spritemapEntry(0, $01, $F8, 1, 1, 2, 0, $128)
    %spritemapEntry(1, $1EF, $F8, 1, 1, 2, 0, $102)
    %spritemapEntry(1, $1FF, $F8, 1, 1, 2, 0, $100)

Spritemap_Crawlers_UpsideRight_0:
    dw $0004                                                             ;A3E50E;
    %spritemapEntry(0, $1F8, $F6, 0, 1, 2, 0, $108)
    %spritemapEntry(0, $1F8, $02, 0, 1, 2, 0, $118)
    %spritemapEntry(1, $1F8, $00, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $1F8, $F0, 0, 1, 2, 0, $104)

Spritemap_Crawlers_UpsideRight_1:
    dw $0004                                                             ;A3E524;
    %spritemapEntry(0, $1F7, $F6, 0, 1, 2, 0, $109)
    %spritemapEntry(0, $1F7, $02, 0, 1, 2, 0, $119)
    %spritemapEntry(1, $1F9, $00, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $1F9, $F0, 0, 1, 2, 0, $104)

Spritemap_Crawlers_UpsideRight_2:
    dw $0004                                                             ;A3E53A;
    %spritemapEntry(0, $1F7, $F6, 0, 1, 2, 0, $10A)
    %spritemapEntry(0, $1F7, $02, 0, 1, 2, 0, $11A)
    %spritemapEntry(1, $1F9, $F0, 1, 1, 2, 0, $106)
    %spritemapEntry(1, $1F9, $00, 1, 1, 2, 0, $104)

Spritemap_Crawlers_UpsideRight_3:
    dw $0004                                                             ;A3E550;
    %spritemapEntry(0, $1F7, $F6, 0, 1, 2, 0, $10B)
    %spritemapEntry(0, $1F7, $02, 0, 1, 2, 0, $11B)
    %spritemapEntry(1, $1F9, $F0, 1, 1, 2, 0, $106)
    %spritemapEntry(1, $1F9, $00, 1, 1, 2, 0, $104)

Spritemap_Crawlers_UpsideRight_4:
    dw $0004                                                             ;A3E566;
    %spritemapEntry(0, $1F8, $F6, 0, 1, 2, 0, $10C)
    %spritemapEntry(0, $1F8, $02, 0, 1, 2, 0, $11C)
    %spritemapEntry(1, $1F8, $00, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $1F8, $F0, 0, 1, 2, 0, $104)


;;; $E57C: Palette - enemy $DCBF (sova) ;;;
Palette_Sova:
    dw $3800,$02FF,$01BF,$000F,$0008,$01BF,$011B,$00BA                   ;A3E57C;
    dw $0011,$7FFF,$039C,$0237,$00D1,$3BE0,$2680,$1580                   ;A3E58C;


;;; $E59C: Initialisation AI - enemy $DCBF (sova) ;;;
InitAI_Sova:
    LDX.W EnemyIndex                                                     ;A3E59C;
    LDA.W Enemy.instList,X                                               ;A3E59F;
    AND.W #$0003                                                         ;A3E5A2;
    ASL                                                                  ;A3E5A5;
    TAY                                                                  ;A3E5A6;
    LDA.W InitialInstListPointers_Crawlers,Y                             ;A3E5A7;
    STA.W Enemy.instList,X                                               ;A3E5AA;
    JMP.W InitAI_Crawlers_Common                                         ;A3E5AD;


;;; $E5B0: Palette - enemy $DCFF (zoomer) ;;;
Palette_Zoomer:
    dw $3800,$72FA,$55B0,$2845,$1801,$6210,$496B,$38C6                   ;A3E5B0;
    dw $2C63,$7FE0,$7DA0,$48E0,$30A0,$03FF,$0237,$00D1                   ;A3E5C0;


;;; $E5D0: Palette - enemy $DD3F (stone zoomer) ;;;
Palette_MZoomer:
    dw $3800,$7FFF,$4ED3,$1926,$0481,$5F57,$4691,$360D                   ;A3E5D0;
    dw $2DCB,$6BBA,$56B2,$2947,$18C3,$7FFF,$4ED3,$1926                   ;A3E5E0;


;;; $E5F0: Creepy crawly speed table ;;;
CrawlersSpeedTable:
; Speed. Unit is 1/100h px/frame. Indexed by [enemy parameter 1] * 2
    dw $0040,$0080,$00C0,$0100,$0140,$0180,$01C0,$0200                   ;A3E5F0;
    dw $0240,$0280,$02C0,$0300,$0340,$0380,$0400,$0440                   ;A3E600;
    dw $0540,$0580,$05C0,$0600,$0640,$0680,$06C0,$0700                   ;A3E610;
    dw $0740,$0780,$07C0,$0800,$0840,$0880,$0800,$0000                   ;A3E620;


;;; $E630: Creepy crawly instruction list pointer table ;;;
; Instruction list pointers. Indexed by [enemy parameter 2]
CrawlersInstListPointerTable_upsideDown:
    dw InstList_Zeela_Zoomer_UpsideDown_0                                ;A3E630; 0: (Stone) zoomer
    dw InstList_Zeela_Zoomer_UpsideDown_0                                ;A3E632; 2: Zeela
    dw InstList_Zeela_Zoomer_UpsideDown_0                                ;A3E634; 4: Sova
    dw InstList_Viola_UpsideDown                                         ;A3E636; 6: Viola
    dw InstList_Sciser_UpsideDown_0                                      ;A3E638; 8: Sciser
    dw InstList_Zero_UpsideDown_FacingLeft_0                             ;A3E63A; Ah: Zero

CrawlersInstListPointerTable_upsideUp:
    dw InstList_Zeela_Zoomer_UpsideUp_0                                  ;A3E63C; 0: (Stone) zoomer
    dw InstList_Zeela_Zoomer_UpsideUp_0                                  ;A3E63E; 2: Zeela
    dw InstList_Zeela_Zoomer_UpsideUp_0                                  ;A3E640; 4: Sova
    dw InstList_Viola_UpsideUp                                           ;A3E642; 6: Viola
    dw InstList_Sciser_UpsideUp_0                                        ;A3E644; 8: Sciser
    dw UNUSED_InstList_Zero_UpsideUp_FacingRight_A3990B                  ;A3E646; Ah: Zero

CrawlersInstListPointerTable_upsideRight:
    dw InstList_Zeela_Zoomer_UpsideRight_0                               ;A3E648; 0: (Stone) zoomer
    dw InstList_Zeela_Zoomer_UpsideRight_0                               ;A3E64A; 2: Zeela
    dw InstList_Zeela_Zoomer_UpsideRight_0                               ;A3E64C; 4: Sova
    dw InstList_Viola_UpsideRight                                        ;A3E64E; 6: Viola
    dw InstList_Sciser_UpsideRight_0                                     ;A3E650; 8: Sciser
    dw InstList_Zero_UpsideRight_FacingDown_0                            ;A3E652; Ah: Zero

CrawlersInstListPointerTable_upsideLeft:
    dw InstList_Zeela_Zoomer_UpsideLeft_0                                ;A3E654; 0: (Stone) zoomer
    dw InstList_Zeela_Zoomer_UpsideLeft_0                                ;A3E656; 2: Zeela
    dw InstList_Zeela_Zoomer_UpsideLeft_0                                ;A3E658; 4: Sova
    dw InstList_Viola_UpsideLeft                                         ;A3E65A; 6: Viola
    dw InstList_Sciser_UpsideLeft_0                                      ;A3E65C; 8: Sciser
    dw InstList_Zero_UpsideLeft_FacingUp_0                               ;A3E65E; Ah: Zero


;;; $E660: Instruction - enemy function = [[Y]] ;;;
Instruction_Crawlers_FunctionInY:
    LDA.W $0000,Y                                                        ;A3E660;
    STA.W Crawler.function,X                                             ;A3E663;
    INY                                                                  ;A3E666;
    INY                                                                  ;A3E667;
    RTL                                                                  ;A3E668;


;;; $E669: Initialisation AI - enemy $DCFF/$DD3F (zoomer / stone zoomer) ;;;
InitAI_Zoomer_MZoomer:
    LDX.W EnemyIndex                                                     ;A3E669;
    LDA.W Enemy.instList,X                                               ;A3E66C;
    AND.W #$0003                                                         ;A3E66F;
    ASL                                                                  ;A3E672;
    TAY                                                                  ;A3E673;
    LDA.W InitialInstListPointers_Crawlers,Y                             ;A3E674;
    STA.W Enemy.instList,X                                               ;A3E677; fallthrough to InitAI_Crawlers_Common


;;; $E67A: Creepy crawly common initialisation AI ;;;
InitAI_Crawlers_Common:
; Used by: sciser, zero, viola, yard, zeela, zoomer, sova, stone zoomer
    LDA.W #Spritemap_Common_Nothing                                      ;A3E67A;
    STA.W Enemy.spritemap,X                                              ;A3E67D;
    LDA.W #$0001                                                         ;A3E680;
    STA.W Enemy.instTimer,X                                              ;A3E683;
    LDA.W #.return                                                       ;A3E686;
    STA.W Crawler.function,X                                             ;A3E689;
    LDA.W Enemy.init0,X                                                  ;A3E68C;
    CMP.W #$00FF                                                         ;A3E68F;
    BEQ .skipSpeedTable                                                  ;A3E692;
    ASL                                                                  ;A3E694;
    TAY                                                                  ;A3E695;
    LDA.W CrawlersSpeedTable,Y                                           ;A3E696;
    STA.W Crawler.XVelocity,X                                            ;A3E699;
    STA.W Crawler.YVelocity,X                                            ;A3E69C;

  .skipSpeedTable:
    LDA.W Enemy.properties,X                                             ;A3E69F;
    AND.W #$0003                                                         ;A3E6A2;
    BNE .properties                                                      ;A3E6A5;
    LDA.W Crawler.XVelocity,X                                            ;A3E6A7;
    EOR.W #$FFFF                                                         ;A3E6AA;
    INC                                                                  ;A3E6AD;
    STA.W Crawler.XVelocity,X                                            ;A3E6AE;
    RTL                                                                  ;A3E6B1;

  .properties:
    CMP.W #$0002                                                         ;A3E6B2;
    BNE .return                                                          ;A3E6B5;
    LDA.W Crawler.YVelocity,X                                            ;A3E6B7;
    EOR.W #$FFFF                                                         ;A3E6BA;
    INC                                                                  ;A3E6BD;
    STA.W Crawler.YVelocity,X                                            ;A3E6BE;

  .return:
    RTL                                                                  ;A3E6C1;


;;; $E6C2: Main AI - enemy $D77F/$D7BF/$DABF/$DC7F/$DCBF/$DCFF/$DD3F (sciser / zero / viola / zeela / zoomer) ;;;
MainAI_Crawlers:
    LDX.W EnemyIndex                                                     ;A3E6C2;
    JMP.W (Crawler.function,X)                                           ;A3E6C5;


;;; $E6C8: Creepy crawly function - crawling vertically ;;;
Function_Crawlers_CrawlingVertically:
    LDA.W EarthquakeTimer                                                ;A3E6C8;
    CMP.W #$001E                                                         ;A3E6CB;
    BNE .noQuake                                                         ;A3E6CE;
    LDA.W EarthquakeType                                                 ;A3E6D0;
    CMP.W #$0014                                                         ;A3E6D3;
    BNE .noQuake                                                         ;A3E6D6;
    LDA.W Crawler.function,X                                             ;A3E6D8;
    STA.L Crawler.nonFallingFunction,X                                   ;A3E6DB;
    LDA.W #Function_Crawlers_Falling                                     ;A3E6DF;
    STA.W Crawler.function,X                                             ;A3E6E2;

  .noQuake:
    STZ.B DP_Temp12                                                      ;A3E6E5;
    STZ.B DP_Temp14                                                      ;A3E6E7;
    LDA.W Crawler.XVelocity,X                                            ;A3E6E9;
    BPL .positive                                                        ;A3E6EC;
    DEC.B DP_Temp14                                                      ;A3E6EE;

  .positive:
    STA.B DP_Temp13                                                      ;A3E6F0;
    LDA.B DP_Temp14                                                      ;A3E6F2;
    BPL .inc                                                             ;A3E6F4;
    DEC                                                                  ;A3E6F6;
    BRA .moveRight                                                       ;A3E6F7;

  .inc:
    INC                                                                  ;A3E6F9;

  .moveRight:
    STA.B DP_Temp14                                                      ;A3E6FA;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A3E6FC;
    BCC .outsideTurn                                                     ;A3E700;
    LDA.W #$0000                                                         ;A3E702;
    STA.L Crawler.consecutiveTurnCounter,X                               ;A3E705;
    JSL.L AlignEnemyYPositionWIthNonSquareSlope                          ;A3E709;
    STZ.B DP_Temp12                                                      ;A3E70D;
    STZ.B DP_Temp14                                                      ;A3E70F;
    LDA.W Crawler.YVelocity,X                                            ;A3E711;
    BPL .moveDown                                                        ;A3E714;
    DEC.B DP_Temp14                                                      ;A3E716;

  .moveDown:
    STA.B DP_Temp13                                                      ;A3E718;
    JSL.L MoveEnemyDownBy_14_12                                          ;A3E71A;
    BCS .insideTurn                                                      ;A3E71E;
    RTL                                                                  ;A3E720;

  .insideTurn:
    LDA.W Crawler.XVelocity,X                                            ;A3E721;
    EOR.W #$FFFF                                                         ;A3E724;
    INC                                                                  ;A3E727;
    STA.W Crawler.XVelocity,X                                            ;A3E728;
    LDY.W Enemy.init1,X                                                  ;A3E72B;
    LDA.W Crawler.YVelocity,X                                            ;A3E72E;
    BPL .insideTurn_up                                                   ;A3E731;
    LDA.W CrawlersInstListPointerTable_upsideDown,Y                      ;A3E733;
    BRA +                                                                ;A3E736;

  .insideTurn_up:
    LDA.W CrawlersInstListPointerTable_upsideUp,Y                        ;A3E738;

+   STA.W Enemy.instList,X                                               ;A3E73B;
    LDA.W #$0001                                                         ;A3E73E;
    STA.W Enemy.instTimer,X                                              ;A3E741;
    RTL                                                                  ;A3E744;

  .outsideTurn:
    LDA.L Crawler.consecutiveTurnCounter,X                               ;A3E745;
    INC                                                                  ;A3E749;
    STA.L Crawler.consecutiveTurnCounter,X                               ;A3E74A;
    CMP.W #$0004                                                         ;A3E74E;
    BMI .negate                                                          ;A3E751;
    LDA.W Crawler.function,X                                             ;A3E753;
    STA.L Crawler.nonFallingFunction,X                                   ;A3E756;
    LDA.W #Function_Crawlers_Falling                                     ;A3E75A;
    STA.W Crawler.function,X                                             ;A3E75D;
    RTL                                                                  ;A3E760;

  .negate:
    LDA.W Crawler.YVelocity,X                                            ;A3E761;
    EOR.W #$FFFF                                                         ;A3E764;
    INC                                                                  ;A3E767;
    STA.W Crawler.YVelocity,X                                            ;A3E768;
    LDY.W Enemy.init1,X                                                  ;A3E76B;
    LDA.W Crawler.YVelocity,X                                            ;A3E76E;
    BPL .positiveYVelocity                                               ;A3E771;
    LDA.W CrawlersInstListPointerTable_upsideDown,Y                      ;A3E773;
    BRA .outsideTurn_up                                                  ;A3E776;

  .positiveYVelocity:
    LDA.W CrawlersInstListPointerTable_upsideUp,Y                        ;A3E778;

  .outsideTurn_up:
    STA.W Enemy.instList,X                                               ;A3E77B;
    LDA.W #$0001                                                         ;A3E77E;
    STA.W Enemy.instTimer,X                                              ;A3E781;
    RTL                                                                  ;A3E784;


;;; $E785: Creepy crawly function - falling ;;;
Function_Crawlers_Falling:
    LDA.L Crawler.fallingYSubVelocity,X                                  ;A3E785;
    STA.B DP_Temp12                                                      ;A3E789;
    LDA.L Crawler.fallingYVelocity,X                                     ;A3E78B;
    STA.B DP_Temp14                                                      ;A3E78F;
    JSL.L MoveEnemyDownBy_14_12                                          ;A3E791;
    BCC .noCollision                                                     ;A3E795;
    LDA.W Enemy.init0,X                                                  ;A3E797;
    CMP.W #$00FF                                                         ;A3E79A;
    BNE .skipSpeed                                                       ;A3E79D;
    LDA.W #$0080                                                         ;A3E79F;
    STA.W Crawler.XVelocity,X                                            ;A3E7A2;
    STA.W Crawler.YVelocity,X                                            ;A3E7A5;

  .skipSpeed:
    LDA.W #$0000                                                         ;A3E7A8;
    STA.L Crawler.fallingYSubVelocity,X                                  ;A3E7AB;
    STA.L Crawler.fallingYVelocity,X                                     ;A3E7AF;
    STA.L Crawler.consecutiveTurnCounter,X                               ;A3E7B3;
    LDA.L Crawler.nonFallingFunction,X                                   ;A3E7B7;
    STA.W Crawler.function,X                                             ;A3E7BB;
    RTL                                                                  ;A3E7BE;

  .noCollision:
    LDA.L Crawler.fallingYVelocity,X                                     ;A3E7BF;
    CMP.W #$0004                                                         ;A3E7C3;
    BPL .fallSpeedCapped                                                 ;A3E7C6;
    LDA.L Crawler.fallingYSubVelocity,X                                  ;A3E7C8;
    CLC                                                                  ;A3E7CC;
    ADC.W #$8000                                                         ;A3E7CD;
    STA.L Crawler.fallingYSubVelocity,X                                  ;A3E7D0;
    LDA.L Crawler.fallingYVelocity,X                                     ;A3E7D4;
    ADC.W #$0000                                                         ;A3E7D8;
    STA.L Crawler.fallingYVelocity,X                                     ;A3E7DB;

  .fallSpeedCapped:
    LDA.L Crawler.fallingYSubVelocity,X                                  ;A3E7DF;
    BNE .return                                                          ;A3E7E3;
    LDA.L Crawler.fallingYVelocity,X                                     ;A3E7E5;
    BNE .return                                                          ;A3E7E9;
    LDA.W #Function_Crawlers_CrawlingVertically                          ;A3E7EB;
    STA.W Crawler.function,X                                             ;A3E7EE;

  .return:
    RTL                                                                  ;A3E7F1;


;;; $E7F2: Creepy crawly function - crawling horizontally ;;;
Function_Crawlers_CrawlingHorizontally:
    LDA.W EarthquakeTimer                                                ;A3E7F2;
    CMP.W #$001E                                                         ;A3E7F5;
    BNE .noQuake                                                         ;A3E7F8;
    LDA.W EarthquakeType                                                 ;A3E7FA;
    CMP.W #$0014                                                         ;A3E7FD;
    BNE .noQuake                                                         ;A3E800;
    LDA.W Crawler.function,X                                             ;A3E802;
    STA.L Crawler.nonFallingFunction,X                                   ;A3E805;
    LDA.W #Function_Crawlers_Falling                                     ;A3E809;
    STA.W Crawler.function,X                                             ;A3E80C;

  .noQuake:
    STZ.B DP_Temp12                                                      ;A3E80F;
    STZ.B DP_Temp14                                                      ;A3E811;
    LDA.W Crawler.YVelocity,X                                            ;A3E813;
    BPL .positive                                                        ;A3E816;
    DEC.B DP_Temp14                                                      ;A3E818;

  .positive:
    STA.B DP_Temp13                                                      ;A3E81A;
    LDA.B DP_Temp14                                                      ;A3E81C;
    BPL .inc                                                             ;A3E81E;
    DEC                                                                  ;A3E820;
    BRA .moveDown                                                        ;A3E821;

  .inc:
    INC                                                                  ;A3E823;

  .moveDown:
    STA.B DP_Temp14                                                      ;A3E824;
    JSL.L MoveEnemyDownBy_14_12                                          ;A3E826;
    BCC .outsideTurn                                                     ;A3E82A;
    LDA.W #$0000                                                         ;A3E82C;
    STA.L Crawler.consecutiveTurnCounter,X                               ;A3E82F;
    JSR.W AdjustEnemyXVelocityForSlopes                                  ;A3E833;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A3E836;
    BCS .insideTurn                                                      ;A3E83A;
    JSL.L AlignEnemyYPositionWIthNonSquareSlope                          ;A3E83C;
    RTL                                                                  ;A3E840;

  .insideTurn:
    LDA.W Crawler.YVelocity,X                                            ;A3E841;
    EOR.W #$FFFF                                                         ;A3E844;
    INC                                                                  ;A3E847;
    STA.W Crawler.YVelocity,X                                            ;A3E848;
    LDY.W Enemy.init1,X                                                  ;A3E84B;
    LDA.W Crawler.XVelocity,X                                            ;A3E84E;
    BPL ..left                                                           ;A3E851;
    LDA.W CrawlersInstListPointerTable_upsideRight,Y                     ;A3E853;
    BRA +                                                                ;A3E856;

  ..left:
    LDA.W CrawlersInstListPointerTable_upsideLeft,Y                      ;A3E858;

+   STA.W Enemy.instList,X                                               ;A3E85B;
    LDA.W #$0001                                                         ;A3E85E;
    STA.W Enemy.instTimer,X                                              ;A3E861;
    RTL                                                                  ;A3E864;

  .outsideTurn:
    LDA.L Crawler.consecutiveTurnCounter,X                               ;A3E865;
    INC                                                                  ;A3E869;
    STA.L Crawler.consecutiveTurnCounter,X                               ;A3E86A;
    CMP.W #$0004                                                         ;A3E86E;
    BMI .notFalling                                                      ;A3E871;
    LDA.W Crawler.function,X                                             ;A3E873;
    STA.L Crawler.nonFallingFunction,X                                   ;A3E876;
    LDA.W #Function_Crawlers_Falling                                     ;A3E87A;
    STA.W Crawler.function,X                                             ;A3E87D;
    RTL                                                                  ;A3E880;

  .notFalling:
    LDA.W Crawler.XVelocity,X                                            ;A3E881;
    EOR.W #$FFFF                                                         ;A3E884;
    INC                                                                  ;A3E887;
    STA.W Crawler.XVelocity,X                                            ;A3E888;
    LDY.W Enemy.init1,X                                                  ;A3E88B;
    LDA.W Crawler.XVelocity,X                                            ;A3E88E;
    BPL .outsideTurn_left                                                ;A3E891;
    LDA.W CrawlersInstListPointerTable_upsideRight,Y                     ;A3E893;
    BRA +                                                                ;A3E896;

  .outsideTurn_left:
    LDA.W CrawlersInstListPointerTable_upsideLeft,Y                      ;A3E898;

+   STA.W Enemy.instList,X                                               ;A3E89B;
    LDA.W #$0001                                                         ;A3E89E;
    STA.W Enemy.instTimer,X                                              ;A3E8A1;
    RTL                                                                  ;A3E8A4;


;;; $E8A5: Adjust enemy X velocity for slopes ;;;
AdjustEnemyXVelocityForSlopes:
    LDA.W Enemy.XPosition,X                                              ;A3E8A5;
    PHA                                                                  ;A3E8A8;
    LDA.W Enemy.YPosition,X                                              ;A3E8A9;
    BIT.W Crawler.YVelocity,X                                            ;A3E8AC;
    BPL .negativeYVelocity                                               ;A3E8AF;
    SEC                                                                  ;A3E8B1;
    SBC.W Enemy.YHitboxRadius,X                                          ;A3E8B2;
    BRA .positiveYVelocity                                               ;A3E8B5;

  .negativeYVelocity:
    CLC                                                                  ;A3E8B7;
    ADC.W Enemy.YHitboxRadius,X                                          ;A3E8B8;
    DEC                                                                  ;A3E8BB;

  .positiveYVelocity:
    PHA                                                                  ;A3E8BC;
    JSL.L CalculateTheBlockContainingAPixelPosition                      ;A3E8BD;
    LDA.W CurrentBlockIndex                                              ;A3E8C1;
    ASL                                                                  ;A3E8C4;
    TAX                                                                  ;A3E8C5;
    LDA.L LevelData,X                                                    ;A3E8C6;
    AND.W #$F000                                                         ;A3E8CA;
    CMP.W #$1000                                                         ;A3E8CD;
    BNE .normalSpeed                                                     ;A3E8D0;
    LDX.W CurrentBlockIndex                                              ;A3E8D2;
    LDA.L BTS,X                                                          ;A3E8D5;
    AND.W #$001F                                                         ;A3E8D9;
    CMP.W #$0005                                                         ;A3E8DC;
    BCC .normalSpeed                                                     ;A3E8DF;
    ASL                                                                  ;A3E8E1;
    ASL                                                                  ;A3E8E2;
    TAX                                                                  ;A3E8E3;
    LDY.W .adjustedSpeedMultiplier,X                                     ;A3E8E4;
    LDX.W EnemyIndex                                                     ;A3E8E7;
    LDA.W Crawler.XVelocity,X                                            ;A3E8EA;
    BPL .multiply                                                        ;A3E8ED;
    EOR.W #$FFFF                                                         ;A3E8EF;
    INC                                                                  ;A3E8F2;
    JSL.L A_Y_16bit_UnsignedMultiplication                               ;A3E8F3;
    LDA.W MultiplicationResult                                           ;A3E8F7;
    EOR.W #$FFFF                                                         ;A3E8FA;
    CLC                                                                  ;A3E8FD;
    ADC.W #$0001                                                         ;A3E8FE;
    STA.B DP_Temp12                                                      ;A3E901;
    LDA.W MultiplicationResult+2                                         ;A3E903;
    EOR.W #$FFFF                                                         ;A3E906;
    ADC.W #$0000                                                         ;A3E909;
    STA.B DP_Temp14                                                      ;A3E90C;
    RTS                                                                  ;A3E90E;

  .multiply:
    JSL.L A_Y_16bit_UnsignedMultiplication                               ;A3E90F;
    LDA.W MultiplicationResult                                           ;A3E913;
    STA.B DP_Temp12                                                      ;A3E916;
    LDA.W MultiplicationResult+2                                         ;A3E918;
    STA.B DP_Temp14                                                      ;A3E91B;
    RTS                                                                  ;A3E91D;

  .normalSpeed:
    LDX.W EnemyIndex                                                     ;A3E91E;
    STZ.B DP_Temp12                                                      ;A3E921;
    STZ.B DP_Temp14                                                      ;A3E923;
    LDA.W Crawler.XVelocity,X                                            ;A3E925;
    BPL +                                                                ;A3E928;
    DEC.B DP_Temp14                                                      ;A3E92A;

+   STA.B DP_Temp13                                                      ;A3E92C;
    RTS                                                                  ;A3E92E;

;        _________ Unused. Seem to be additive speed modifiers in the SamusBlockCollisionDetection_Horizontal_Slope_NonSquare version of this table
;       |      ___ Adjusted speed multiplier * 100h
;       |     |
  .additiveSpeedMultiplier:
    dw $0000                                                             ;A3E92F;

  .adjustedSpeedMultiplier:                                              ;A3E931;
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


;;; $E9AF: Palette - enemy $DD7F (metroid) ;;;
Palette_Metroid:
    dw $3800,$6BF5,$06E1,$0641,$05A1,$5E5F,$183F,$1014                   ;A3E9AF;
    dw $080A,$0404,$4F9F,$3ED8,$2E12,$6F70,$7FFF,$5EE0                   ;A3E9BF;


;;; $E9CF: Instruction list - metroid - chasing Samus ;;;
InstList_Metroid_ChasingSamus:
    dw $0010,Spritemap_Metroid_Insides_0                                 ;A3E9CF;
    dw $0010,Spritemap_Metroid_Insides_1                                 ;A3E9D3;
    dw $0006,Spritemap_Metroid_Insides_2                                 ;A3E9D7;
    dw $000A,Spritemap_Metroid_Insides_3                                 ;A3E9DB;
    dw $0010,Spritemap_Metroid_Insides_1                                 ;A3E9DF;
    dw $0010,Spritemap_Metroid_Insides_0                                 ;A3E9E3;
    dw $0010,Spritemap_Metroid_Insides_1                                 ;A3E9E7;
    dw $0006,Spritemap_Metroid_Insides_2                                 ;A3E9EB;
    dw $000A,Spritemap_Metroid_Insides_3                                 ;A3E9EF;
    dw $0010,Spritemap_Metroid_Insides_1                                 ;A3E9F3;
    dw $0010,Spritemap_Metroid_Insides_0                                 ;A3E9F7;
    dw $0010,Spritemap_Metroid_Insides_1                                 ;A3E9FB;
    dw $0006,Spritemap_Metroid_Insides_2                                 ;A3E9FF;
    dw $000A,Spritemap_Metroid_Insides_3                                 ;A3EA03;
    dw $0010,Spritemap_Metroid_Insides_1                                 ;A3EA07;
    dw $0010,Spritemap_Metroid_Insides_0                                 ;A3EA0B;
    dw $0010,Spritemap_Metroid_Insides_1                                 ;A3EA0F;
    dw $0006,Spritemap_Metroid_Insides_2                                 ;A3EA13;
    dw $000A,Spritemap_Metroid_Insides_3                                 ;A3EA17;
    dw $0010,Spritemap_Metroid_Insides_1                                 ;A3EA1B;
    dw Instruction_Metroid_PlayRandomMetroidSFX                          ;A3EA1F;
    dw Instruction_Common_GotoY                                          ;A3EA21;
    dw InstList_Metroid_ChasingSamus                                     ;A3EA23;


;;; $EA25: Instruction list - metroid - draining Samus ;;;
InstList_Metroid_DrainingSamus:
    dw $0010,Spritemap_Metroid_Insides_0                                 ;A3EA25;
    dw $0010,Spritemap_Metroid_Insides_1                                 ;A3EA29;
    dw $0006,Spritemap_Metroid_Insides_2                                 ;A3EA2D;
    dw $000A,Spritemap_Metroid_Insides_3                                 ;A3EA31;
    dw $0010,Spritemap_Metroid_Insides_1                                 ;A3EA35;
    dw Instruction_Metroid_PlayDrainingSamusSFX                          ;A3EA39;
    dw Instruction_Common_GotoY                                          ;A3EA3B;
    dw InstList_Metroid_DrainingSamus                                    ;A3EA3D;


;;; $EA3F: Bombed off X velocities ;;;
BombedOffVelocities:
;        _____________________ Frame 0
;       |      _______________ Frame 3
;       |     |      _________ Frame 2
;       |     |     |      ___ Frame 1
;       |     |     |     |
  .X:
    dw $0002,$0000,$FFFE,$0000                                           ;A3EA3F;
  .Y:
    dw $0000,$FFFE,$0000,$0002                                           ;A3EA47;


;;; $EA4F: Initialisation AI - enemy $DD7F (metroid) ;;;
InitAI_Metroid:
    LDX.W EnemyIndex                                                     ;A3EA4F;
    LDA.W #InstList_Metroid_ChasingSamus                                 ;A3EA52;
    STA.W Enemy.instList,X                                               ;A3EA55;
    LDA.W Enemy.palette,X                                                ;A3EA58;
    ORA.W Enemy.GFXOffset,X                                              ;A3EA5B;
    STA.B DP_Temp18                                                      ;A3EA5E;
    LDA.W Enemy.XPosition,X                                              ;A3EA60;
    STA.B DP_Temp12                                                      ;A3EA63;
    LDA.W Enemy.YPosition,X                                              ;A3EA65;
    STA.B DP_Temp14                                                      ;A3EA68;
    LDA.W #$0032                                                         ;A3EA6A;
    STA.B DP_Temp16                                                      ;A3EA6D;
    JSL.L Create_Sprite_Object                                           ;A3EA6F;
    LDA.B DP_Temp12                                                      ;A3EA73;
    STA.L Metroid.electricitySpriteObjectIndex,X                         ;A3EA75;
    LDX.W EnemyIndex                                                     ;A3EA79;
    LDA.W Enemy.palette,X                                                ;A3EA7C;
    ORA.W Enemy.GFXOffset,X                                              ;A3EA7F;
    STA.B DP_Temp18                                                      ;A3EA82;
    LDA.W Enemy.XPosition,X                                              ;A3EA84;
    STA.B DP_Temp12                                                      ;A3EA87;
    LDA.W Enemy.YPosition,X                                              ;A3EA89;
    STA.B DP_Temp14                                                      ;A3EA8C;
    LDA.W #$0034                                                         ;A3EA8E;
    STA.B DP_Temp16                                                      ;A3EA91;
    JSL.L Create_Sprite_Object                                           ;A3EA93;
    LDA.B DP_Temp12                                                      ;A3EA97;
    STA.L Metroid.shellSpriteObjectIndex,X                               ;A3EA99;
    LDA.W #$0000                                                         ;A3EA9D;
    STA.L Metroid.SamusSubEnergy,X                                       ;A3EAA0;
    RTL                                                                  ;A3EAA4;


;;; $EAA5: Instruction - play Metroid draining Samus ;;;
Instruction_Metroid_PlayDrainingSamusSFX:
    PHX                                                                  ;A3EAA5;
    PHY                                                                  ;A3EAA6;
    LDA.W #$0050                                                         ;A3EAA7;
    JSL.L QueueSound_Lib2_Max6                                           ;A3EAAA;
    PLY                                                                  ;A3EAAE;
    PLX                                                                  ;A3EAAF;
    RTL                                                                  ;A3EAB0;


;;; $EAB1: Instruction - play random Metroid cry ;;;
Instruction_Metroid_PlayRandomMetroidSFX:
    PHX                                                                  ;A3EAB1;
    PHY                                                                  ;A3EAB2;
    JSL.L GenerateRandomNumber                                           ;A3EAB3;
    AND.W #$0007                                                         ;A3EAB7;
    ASL                                                                  ;A3EABA;
    TAX                                                                  ;A3EABB;
    LDA.W .SFX,X                                                         ;A3EABC;
    JSL.L QueueSound_Lib2_Max6                                           ;A3EABF;
    PLY                                                                  ;A3EAC3;
    PLX                                                                  ;A3EAC4;
    RTL                                                                  ;A3EAC5;

if !FEATURE_KEEP_UNREFERENCED
  .unused:
; Unused. 180..250 in steps of 10, unsure of significance
    dw $00B4,$00BE,$00C8,$00D2,$00DC,$00E6,$00F0,$00FA                   ;A3EAC6;
endif ; !FEATURE_KEEP_UNREFERENCED

  .SFX:
    dw $0050,$0058,$005A,$0050,$0058,$005A,$0058,$005A                   ;A3EAD6;


;;; $EAE6: Frozen AI - enemy $DD7F (metroid) ;;;
FrozenAI_Metroid:
    JSL.L CommonA3_NormalEnemyFrozenAI                                   ;A3EAE6;
    LDX.W EnemyIndex                                                     ;A3EAEA;
    LDA.W Metroid.bombedOffSamusCooldownTimer,X                          ;A3EAED;
    BEQ .timerExpired                                                    ;A3EAF0;
    DEC.W Metroid.bombedOffSamusCooldownTimer,X                          ;A3EAF2;
    LDA.W #$0002                                                         ;A3EAF5;
    STA.W Enemy.flashTimer,X                                             ;A3EAF8;

  .timerExpired:
    LDA.L Metroid.electricitySpriteObjectIndex,X                         ;A3EAFB;
    TAX                                                                  ;A3EAFF;
    LDA.W #$0C00                                                         ;A3EB00;
    STA.L SpriteObjects_VRAMIndices,X                                    ;A3EB03;
    LDA.W #$0001                                                         ;A3EB07;
    STA.L SpriteObjects_DisableFlags,X                                   ;A3EB0A;
    LDA.W #InstList_SpriteObject_32_MetroidElectricity                   ;A3EB0E;
    STA.L SpriteObjects_InstListPointers,X                               ;A3EB11;
    LDX.W EnemyIndex                                                     ;A3EB15;
    LDA.L Metroid.shellSpriteObjectIndex,X                               ;A3EB18;
    TAX                                                                  ;A3EB1C;
    LDA.W #$0C00                                                         ;A3EB1D;
    STA.L SpriteObjects_VRAMIndices,X                                    ;A3EB20;
    LDA.W #$0001                                                         ;A3EB24;
    STA.L SpriteObjects_DisableFlags,X                                   ;A3EB27;
    LDA.W #InstList_SpriteObject_34_MetroidShell                         ;A3EB2B;
    STA.L SpriteObjects_InstListPointers,X                               ;A3EB2E;
    RTL                                                                  ;A3EB32;


;;; $EB33: Hurt AI - enemy $DD7F (metroid) ;;;
HurtAI_Metroid:
; Synch flashing with sprite objects
    LDX.W EnemyIndex                                                     ;A3EB33;
    LDY.W #$F1FF                                                         ;A3EB36; >.<
    LDA.W Enemy.flashTimer,X                                             ;A3EB39;
    BIT.W #$0002                                                         ;A3EB3C;
    BEQ .flash                                                           ;A3EB3F;
    LDA.W Enemy.palette,X                                                ;A3EB41;
    STA.B DP_Temp12                                                      ;A3EB44;
    LDX.W EnemyIndex                                                     ;A3EB46;
    LDA.L Metroid.electricitySpriteObjectIndex,X                         ;A3EB49;
    TAX                                                                  ;A3EB4D;
    LDA.L SpriteObjects_VRAMIndices,X                                    ;A3EB4E;
    AND.W #$F1FF                                                         ;A3EB52;
    ORA.B DP_Temp12                                                      ;A3EB55;
    STA.L SpriteObjects_VRAMIndices,X                                    ;A3EB57;
    LDX.W EnemyIndex                                                     ;A3EB5B;
    LDA.L Metroid.shellSpriteObjectIndex,X                               ;A3EB5E;
    TAX                                                                  ;A3EB62;
    LDA.L SpriteObjects_VRAMIndices,X                                    ;A3EB63;
    AND.W #$F1FF                                                         ;A3EB67;
    ORA.B DP_Temp12                                                      ;A3EB6A;
    STA.L SpriteObjects_VRAMIndices,X                                    ;A3EB6C;
    RTL                                                                  ;A3EB70;

  .flash:
    LDX.W EnemyIndex                                                     ;A3EB71;
    LDA.L Metroid.electricitySpriteObjectIndex,X                         ;A3EB74;
    TAX                                                                  ;A3EB78;
    LDA.L SpriteObjects_VRAMIndices,X                                    ;A3EB79;
    AND.W #$F1FF                                                         ;A3EB7D;
    STA.L SpriteObjects_VRAMIndices,X                                    ;A3EB80;
    LDX.W EnemyIndex                                                     ;A3EB84;
    LDA.L Metroid.shellSpriteObjectIndex,X                               ;A3EB87;
    TAX                                                                  ;A3EB8B;
    LDA.L SpriteObjects_VRAMIndices,X                                    ;A3EB8C;
    AND.W #$F1FF                                                         ;A3EB90;
    STA.L SpriteObjects_VRAMIndices,X                                    ;A3EB93;
    RTL                                                                  ;A3EB97;


;;; $EB98: Main AI - enemy $DD7F (metroid) ;;;
MainAI_Metroid:
    LDX.W EnemyIndex                                                     ;A3EB98;
    LDA.W SamusYPosition                                                 ;A3EB9B;
    SEC                                                                  ;A3EB9E;
    SBC.W #$0008                                                         ;A3EB9F;
    STA.W Temp_TargetYPosition                                           ;A3EBA2;
    LDA.W Metroid.functionIndex,X                                        ;A3EBA5;
    ASL                                                                  ;A3EBA8;
    TAX                                                                  ;A3EBA9;
    JSR.W (.pointers,X)                                                  ;A3EBAA;
    LDA.W Enemy.palette,X                                                ;A3EBAD;
    ORA.W Enemy.GFXOffset,X                                              ;A3EBB0;
    STA.B DP_Temp18                                                      ;A3EBB3;
    LDA.W Enemy.XPosition,X                                              ;A3EBB5;
    STA.B DP_Temp12                                                      ;A3EBB8;
    LDA.W Enemy.YPosition,X                                              ;A3EBBA;
    STA.B DP_Temp14                                                      ;A3EBBD;
    LDA.L Metroid.electricitySpriteObjectIndex,X                         ;A3EBBF;
    TAX                                                                  ;A3EBC3;
    LDA.B DP_Temp12                                                      ;A3EBC4;
    STA.L SpriteObjects_XPositions,X                                     ;A3EBC6;
    LDA.B DP_Temp14                                                      ;A3EBCA;
    STA.L SpriteObjects_YPositions,X                                     ;A3EBCC;
    LDA.B DP_Temp18                                                      ;A3EBD0;
    STA.L SpriteObjects_VRAMIndices,X                                    ;A3EBD2;
    LDA.W #$0000                                                         ;A3EBD6;
    STA.L SpriteObjects_DisableFlags,X                                   ;A3EBD9;
    LDX.W EnemyIndex                                                     ;A3EBDD;
    LDA.W Enemy.XPosition,X                                              ;A3EBE0;
    STA.B DP_Temp12                                                      ;A3EBE3;
    LDA.W Enemy.YPosition,X                                              ;A3EBE5;
    STA.B DP_Temp14                                                      ;A3EBE8;
    LDA.L Metroid.shellSpriteObjectIndex,X                               ;A3EBEA;
    TAX                                                                  ;A3EBEE;
    LDA.B DP_Temp12                                                      ;A3EBEF;
    STA.L SpriteObjects_XPositions,X                                     ;A3EBF1;
    LDA.B DP_Temp14                                                      ;A3EBF5;
    STA.L SpriteObjects_YPositions,X                                     ;A3EBF7;
    LDA.B DP_Temp18                                                      ;A3EBFB;
    STA.L SpriteObjects_VRAMIndices,X                                    ;A3EBFD;
    LDA.W #$0000                                                         ;A3EC01;
    STA.L SpriteObjects_DisableFlags,X                                   ;A3EC04;
    RTL                                                                  ;A3EC08;

  .pointers:
    dw Function_Metroid_0_ChaseSamus                                     ;A3EC09;
    dw Function_Metroid_1_LatchOntoSamus                                 ;A3EC0B;
    dw Function_Metroid_2_LatchedOntoSamus                               ;A3EC0D;
    dw Function_Metroid_3_BombedOffSamus                                 ;A3EC0F;


;;; $EC11: Metroid function index 0 - chase Samus ;;;
Function_Metroid_0_ChaseSamus:
;; Parameter:
;;     Temp_TargetYPosition: [Samus Y position] - 8
    LDX.W EnemyIndex                                                     ;A3EC11;
    STZ.B DP_Temp12                                                      ;A3EC14;
    STZ.B DP_Temp14                                                      ;A3EC16;
    LDA.W Enemy.YPosition,X                                              ;A3EC18;
    SEC                                                                  ;A3EC1B;
    SBC.W Temp_TargetYPosition                                           ;A3EC1C;
    LSR                                                                  ;A3EC1F;
    LSR                                                                  ;A3EC20;
    STA.B DP_Temp13                                                      ;A3EC21;
    AND.W #$2000                                                         ;A3EC23;
    BEQ +                                                                ;A3EC26;
    LDA.B DP_Temp14                                                      ;A3EC28;
    ORA.W #$FFC0                                                         ;A3EC2A;
    STA.B DP_Temp14                                                      ;A3EC2D;

+   LDA.W Metroid.YSubVelocity,X                                         ;A3EC2F;
    SEC                                                                  ;A3EC32;
    SBC.B DP_Temp12                                                      ;A3EC33;
    STA.W Metroid.YSubVelocity,X                                         ;A3EC35;
    LDA.W Metroid.YVelocity,X                                            ;A3EC38;
    SBC.B DP_Temp14                                                      ;A3EC3B;
    STA.W Metroid.YVelocity,X                                            ;A3EC3D;
    BMI .negativeY                                                       ;A3EC40;
    CMP.W #$0003                                                         ;A3EC42;
    BCC .moveDown                                                        ;A3EC45;
    LDA.W #$0003                                                         ;A3EC47;
    BRA .storeYVelocity                                                  ;A3EC4A;

  .negativeY:
    CMP.W #$FFFD                                                         ;A3EC4C;
    BCS .moveDown                                                        ;A3EC4F;
    LDA.W #$FFFD                                                         ;A3EC51;

  .storeYVelocity:
    STA.W Metroid.YVelocity,X                                            ;A3EC54;
    STZ.W Metroid.YSubVelocity,X                                         ;A3EC57;

  .moveDown:
    LDA.W Metroid.YSubVelocity,X                                         ;A3EC5A;
    STA.B DP_Temp12                                                      ;A3EC5D;
    LDA.W Metroid.YVelocity,X                                            ;A3EC5F;
    STA.B DP_Temp14                                                      ;A3EC62;
    LDX.W EnemyIndex                                                     ;A3EC64;
    JSL.L MoveEnemyDownBy_14_12                                          ;A3EC67;
    BCC .notCollidedWithBlock                                            ;A3EC6B;
    LDX.W EnemyIndex                                                     ;A3EC6D;
    STZ.W Metroid.YSubVelocity,X                                         ;A3EC70;
    STZ.W Metroid.YVelocity,X                                            ;A3EC73;

  .notCollidedWithBlock:
    LDX.W EnemyIndex                                                     ;A3EC76;
    STZ.B DP_Temp12                                                      ;A3EC79;
    STZ.B DP_Temp14                                                      ;A3EC7B;
    LDA.W Enemy.XPosition,X                                              ;A3EC7D;
    SEC                                                                  ;A3EC80;
    SBC.W SamusXPosition                                                 ;A3EC81;
    LSR                                                                  ;A3EC84;
    LSR                                                                  ;A3EC85;
    STA.B DP_Temp13                                                      ;A3EC86;
    AND.W #$2000                                                         ;A3EC88;
    BEQ +                                                                ;A3EC8B;
    LDA.B DP_Temp14                                                      ;A3EC8D;
    ORA.W #$FFC0                                                         ;A3EC8F;
    STA.B DP_Temp14                                                      ;A3EC92;

+   LDA.W Metroid.XSubVelocity,X                                         ;A3EC94;
    SEC                                                                  ;A3EC97;
    SBC.B DP_Temp12                                                      ;A3EC98;
    STA.W Metroid.XSubVelocity,X                                         ;A3EC9A;
    LDA.W Metroid.XVelocity,X                                            ;A3EC9D;
    SBC.B DP_Temp14                                                      ;A3ECA0;
    STA.W Metroid.XVelocity,X                                            ;A3ECA2;
    BMI .negativeX                                                       ;A3ECA5;
    CMP.W #$0003                                                         ;A3ECA7;
    BCC .moveRight                                                       ;A3ECAA;
    LDA.W #$0003                                                         ;A3ECAC;
    BRA .storeXVelocity                                                  ;A3ECAF;

  .negativeX:
    CMP.W #$FFFD                                                         ;A3ECB1;
    BCS .moveRight                                                       ;A3ECB4;
    LDA.W #$FFFD                                                         ;A3ECB6;

  .storeXVelocity:
    STA.W Metroid.XVelocity,X                                            ;A3ECB9;
    STZ.W Metroid.XSubVelocity,X                                         ;A3ECBC;

  .moveRight:
    LDA.W Metroid.XSubVelocity,X                                         ;A3ECBF;
    STA.B DP_Temp12                                                      ;A3ECC2;
    LDA.W Metroid.XVelocity,X                                            ;A3ECC4;
    STA.B DP_Temp14                                                      ;A3ECC7;
    LDX.W EnemyIndex                                                     ;A3ECC9;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A3ECCC;
    BCC .return                                                          ;A3ECD0;
    LDX.W EnemyIndex                                                     ;A3ECD2;
    STZ.W Metroid.XSubVelocity,X                                         ;A3ECD5;
    STZ.W Metroid.XVelocity,X                                            ;A3ECD8;

  .return:
    RTS                                                                  ;A3ECDB;


;;; $ECDC: Metroid function index 1 - latch onto Samus ;;;
Function_Metroid_1_LatchOntoSamus:
;; Parameter:
;;     Temp_TargetYPosition: [Samus Y position] - 8

; This calculation of $14 = ((Samus position) - (metroid position)) * 20h is strange,
; the result if non-zero will always be a huge value that has to be clamped to ±3
; Hard to believe it's the intentional operation, possibly the intended destination of the calculation was $13,
; though the sign extension code would have to be modified in that case too...
    LDX.W EnemyIndex                                                     ;A3ECDC;
    STZ.B DP_Temp12                                                      ;A3ECDF;
    STZ.B DP_Temp14                                                      ;A3ECE1;
    LDA.W Temp_TargetYPosition                                           ;A3ECE3;
    SEC                                                                  ;A3ECE6;
    SBC.W Enemy.YPosition,X                                              ;A3ECE7;
    XBA                                                                  ;A3ECEA;
    AND.W #$FF00                                                         ;A3ECEB;
    LSR                                                                  ;A3ECEE;
    LSR                                                                  ;A3ECEF;
    LSR                                                                  ;A3ECF0;
    STA.B DP_Temp14                                                      ;A3ECF1;
    AND.W #$1000                                                         ;A3ECF3;
    BEQ +                                                                ;A3ECF6;
    LDA.B DP_Temp14                                                      ;A3ECF8;
    ORA.W #$E000                                                         ;A3ECFA;
    STA.B DP_Temp14                                                      ;A3ECFD;

+   LDA.B DP_Temp14                                                      ;A3ECFF;
    BMI .negativeY                                                       ;A3ED01;
    CMP.W #$0003                                                         ;A3ED03;
    BCC .moveDown                                                        ;A3ED06;
    LDA.W #$0003                                                         ;A3ED08;
    BRA .alwaysClamped                                                   ;A3ED0B;

  .negativeY:
    CMP.W #$FFFD                                                         ;A3ED0D;
    BCS .moveDown                                                        ;A3ED10;
    LDA.W #$FFFD                                                         ;A3ED12;

  .alwaysClamped:
    STA.B DP_Temp14                                                      ;A3ED15;
    STZ.B DP_Temp12                                                      ;A3ED17;

  .moveDown:
    LDA.B DP_Temp12                                                      ;A3ED19;
    STA.W Metroid.YSubVelocity,X                                         ;A3ED1B;
    LDA.B DP_Temp14                                                      ;A3ED1E;
    STA.W Metroid.YVelocity,X                                            ;A3ED20;
    LDX.W EnemyIndex                                                     ;A3ED23;
    JSL.L MoveEnemyDownBy_14_12                                          ;A3ED26;
    BCC .notCollidedWithBlock                                            ;A3ED2A;
    LDX.W EnemyIndex                                                     ;A3ED2C;
    STZ.W Metroid.YSubVelocity,X                                         ;A3ED2F;
    STZ.W Metroid.YVelocity,X                                            ;A3ED32;

  .notCollidedWithBlock:
    LDX.W EnemyIndex                                                     ;A3ED35;
    STZ.B DP_Temp12                                                      ;A3ED38;
    STZ.B DP_Temp14                                                      ;A3ED3A;
    LDA.W SamusXPosition                                                 ;A3ED3C;
    SEC                                                                  ;A3ED3F;
    SBC.W Enemy.XPosition,X                                              ;A3ED40;
    XBA                                                                  ;A3ED43;
    AND.W #$FF00                                                         ;A3ED44;
    LSR                                                                  ;A3ED47;
    LSR                                                                  ;A3ED48;
    LSR                                                                  ;A3ED49;
    STA.B DP_Temp14                                                      ;A3ED4A;
    AND.W #$1000                                                         ;A3ED4C;
    BEQ +                                                                ;A3ED4F;
    LDA.B DP_Temp14                                                      ;A3ED51;
    ORA.W #$E000                                                         ;A3ED53;
    STA.B DP_Temp14                                                      ;A3ED56;

+   LDA.B DP_Temp14                                                      ;A3ED58;
    BMI .negativeX                                                       ;A3ED5A;
    CMP.W #$0003                                                         ;A3ED5C;
    BCC .moveRight                                                       ;A3ED5F;
    LDA.W #$0003                                                         ;A3ED61;
    BRA .storeXVelocity                                                  ;A3ED64;

  .negativeX:
    CMP.W #$FFFD                                                         ;A3ED66;
    BCS .moveRight                                                       ;A3ED69;
    LDA.W #$FFFD                                                         ;A3ED6B;

  .storeXVelocity:
    STA.B DP_Temp14                                                      ;A3ED6E;
    STZ.B DP_Temp12                                                      ;A3ED70;

  .moveRight:
    LDA.B DP_Temp12                                                      ;A3ED72;
    STA.W Metroid.XSubVelocity,X                                         ;A3ED74;
    LDA.B DP_Temp14                                                      ;A3ED77;
    STA.W Metroid.XVelocity,X                                            ;A3ED79;
    LDX.W EnemyIndex                                                     ;A3ED7C;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A3ED7F;
    BCC .return                                                          ;A3ED83;
    LDX.W EnemyIndex                                                     ;A3ED85;
    STZ.W Metroid.XSubVelocity,X                                         ;A3ED88;
    STZ.W Metroid.XVelocity,X                                            ;A3ED8B;

  .return:
    RTS                                                                  ;A3ED8E;


;;; $ED8F: Metroid function index 2 - latched onto Samus ;;;
Function_Metroid_2_LatchedOntoSamus:
;; Parameter:
;;     Temp_TargetYPosition: [Samus Y position] - 8
    LDX.W EnemyIndex                                                     ;A3ED8F;
    LDA.W SamusXPosition                                                 ;A3ED92;
    STA.W Enemy.XPosition,X                                              ;A3ED95;
    LDA.W Temp_TargetYPosition                                           ;A3ED98;
    STA.W Enemy.YPosition,X                                              ;A3ED9B;
    STZ.W Metroid.XSubVelocity,X                                         ;A3ED9E;
    STZ.W Metroid.XVelocity,X                                            ;A3EDA1;
    STZ.W Metroid.YSubVelocity,X                                         ;A3EDA4;
    STZ.W Metroid.YVelocity,X                                            ;A3EDA7;
    RTS                                                                  ;A3EDAA;


;;; $EDAB: Metroid function index 3 - bombed off Samus ;;;
Function_Metroid_3_BombedOffSamus:
    LDX.W EnemyIndex                                                     ;A3EDAB;
    LDA.W Metroid.bombedOffSamusCooldownTimer,X                          ;A3EDAE;
    AND.W #$0003                                                         ;A3EDB1;
    ASL                                                                  ;A3EDB4;
    TAY                                                                  ;A3EDB5;
    LDA.W Enemy.XPosition,X                                              ;A3EDB6;
    CLC                                                                  ;A3EDB9;
    ADC.W BombedOffVelocities_X,Y                                        ;A3EDBA;
    STA.W Enemy.XPosition,X                                              ;A3EDBD;
    LDA.W Enemy.YPosition,X                                              ;A3EDC0;
    CLC                                                                  ;A3EDC3;
    ADC.W BombedOffVelocities_Y,Y                                        ;A3EDC4;
    STA.W Enemy.YPosition,X                                              ;A3EDC7;
    STZ.W Metroid.XSubVelocity,X                                         ;A3EDCA;
    STZ.W Metroid.XVelocity,X                                            ;A3EDCD;
    STZ.W Metroid.YSubVelocity,X                                         ;A3EDD0;
    STZ.W Metroid.YVelocity,X                                            ;A3EDD3;
    DEC.W Metroid.bombedOffSamusCooldownTimer,X                          ;A3EDD6;
    BNE .return                                                          ;A3EDD9;
    STZ.W Metroid.functionIndex,X                                        ;A3EDDB;
    LDA.W #InstList_Metroid_ChasingSamus                                 ;A3EDDE;
    STA.W Enemy.instList,X                                               ;A3EDE1;
    LDA.W #$0001                                                         ;A3EDE4;
    STA.W Enemy.instTimer,X                                              ;A3EDE7;

  .return:
    RTS                                                                  ;A3EDEA;


;;; $EDEB: Enemy touch - enemy $DD7F (metroid) ;;;
EnemyTouch_Metroid:
    LDA.W SamusYPosition                                                 ;A3EDEB;
    SEC                                                                  ;A3EDEE;
    SBC.W #$0008                                                         ;A3EDEF;
    STA.W Temp_TargetYPosition                                           ;A3EDF2;
    LDA.W ContactDamageIndex                                             ;A3EDF5;
    BEQ .normal                                                          ;A3EDF8;
    LDX.W EnemyIndex                                                     ;A3EDFA;
    LDA.W Metroid.functionIndex,X                                        ;A3EDFD;
    CMP.W #$0002                                                         ;A3EE00;
    BEQ .return                                                          ;A3EE03;
    STZ.W Metroid.XSubVelocity,X                                         ;A3EE05;
    STZ.W Metroid.YSubVelocity,X                                         ;A3EE08;
    LDY.W #$0000                                                         ;A3EE0B;
    LDA.W Enemy.XPosition,X                                              ;A3EE0E;
    SEC                                                                  ;A3EE11;
    SBC.W SamusXPosition                                                 ;A3EE12;
    BPL +                                                                ;A3EE15;
    LDY.W #$FF00                                                         ;A3EE17;

+   PHA                                                                  ;A3EE1A;
    TYA                                                                  ;A3EE1B;
    STA.W Metroid.XVelocity,X                                            ;A3EE1C;
    PLA                                                                  ;A3EE1F;
    ASL                                                                  ;A3EE20;
    ASL                                                                  ;A3EE21;
    ASL                                                                  ;A3EE22;
    ASL                                                                  ;A3EE23;
    ASL                                                                  ;A3EE24;
    ASL                                                                  ;A3EE25;
    STA.W Enemy.var0+1,X                                                 ;A3EE26;
    LDY.W #$0000                                                         ;A3EE29;
    LDA.W Enemy.YPosition,X                                              ;A3EE2C;
    SEC                                                                  ;A3EE2F;
    SBC.W Temp_TargetYPosition                                           ;A3EE30;
    BPL +                                                                ;A3EE33;
    LDY.W #$FF00                                                         ;A3EE35;

+   PHA                                                                  ;A3EE38;
    TYA                                                                  ;A3EE39;
    STA.W Metroid.YVelocity,X                                            ;A3EE3A;
    PLA                                                                  ;A3EE3D;
    ASL                                                                  ;A3EE3E;
    ASL                                                                  ;A3EE3F;
    ASL                                                                  ;A3EE40;
    ASL                                                                  ;A3EE41;
    ASL                                                                  ;A3EE42;
    ASL                                                                  ;A3EE43;
    STA.W Enemy.var2+1,X                                                 ;A3EE44;
    STZ.W Metroid.functionIndex,X                                        ;A3EE47;
    LDA.W #InstList_Metroid_ChasingSamus                                 ;A3EE4A;
    STA.W Enemy.instList,X                                               ;A3EE4D;
    LDA.W #$0001                                                         ;A3EE50;
    STA.W Enemy.instTimer,X                                              ;A3EE53;

  .return:
    RTL                                                                  ;A3EE56;

  .normal:
    LDX.W EnemyIndex                                                     ;A3EE57;
    LDA.W Metroid.functionIndex,X                                        ;A3EE5A;
    CMP.W #$0003                                                         ;A3EE5D;
    BEQ +                                                                ;A3EE60;
    LDA.W NumberOfTimesMainEnemyRoutineExecuted                          ;A3EE62;
    AND.W #$0007                                                         ;A3EE65;
    CMP.W #$0007                                                         ;A3EE68;
    BNE .skipSFX                                                         ;A3EE6B;
    LDA.W Energy                                                         ;A3EE6D;
    CMP.W #$001E                                                         ;A3EE70;
    BMI .skipSFX                                                         ;A3EE73;
    LDA.W #$002D                                                         ;A3EE75;
    JSL.L QueueSound_Lib3_Max6                                           ;A3EE78;

  .skipSFX:
    JSR.W DealMetroidContactDamageToSamus                                ;A3EE7C;

+   LDA.W Metroid.functionIndex,X                                        ;A3EE7F;
    CMP.W #$0002                                                         ;A3EE82;
    BCS .return                                                          ;A3EE85;
    LDY.W #$0001                                                         ;A3EE87;
    LDA.W Enemy.XPosition,X                                              ;A3EE8A;
    SEC                                                                  ;A3EE8D;
    SBC.W SamusXPosition                                                 ;A3EE8E;
    BPL +                                                                ;A3EE91;
    EOR.W #$FFFF                                                         ;A3EE93;
    INC                                                                  ;A3EE96;

+   CMP.W #$0008                                                         ;A3EE97;
    BCS .setFunction                                                     ;A3EE9A;
    LDA.W Enemy.YPosition,X                                              ;A3EE9C;
    SEC                                                                  ;A3EE9F;
    SBC.W Temp_TargetYPosition                                           ;A3EEA0;
    BPL +                                                                ;A3EEA3;
    EOR.W #$FFFF                                                         ;A3EEA5;
    INC                                                                  ;A3EEA8;

+   CMP.W #$0008                                                         ;A3EEA9;
    BCS .setFunction                                                     ;A3EEAC;
    LDY.W #$0002                                                         ;A3EEAE;
    LDA.W #$0012                                                         ;A3EEB1;
    JSL.L Run_Samus_Command                                              ;A3EEB4;

  .setFunction:
    TYA                                                                  ;A3EEB8;
    STA.W Metroid.functionIndex,X                                        ;A3EEB9;
    CMP.W #$0002                                                         ;A3EEBC;
    BNE .return                                                          ;A3EEBF;
    LDA.W #InstList_Metroid_DrainingSamus                                ;A3EEC1;
    STA.W Enemy.instList,X                                               ;A3EEC4;
    LDA.W #$0001                                                         ;A3EEC7;
    STA.W Enemy.instTimer,X                                              ;A3EECA;
    RTL                                                                  ;A3EECD;


;;; $EECE: Deal metroid contact damage to Samus ;;;
DealMetroidContactDamageToSamus:
    LDA.W SamusYPosition                                                 ;A3EECE;
    SEC                                                                  ;A3EED1;
    SBC.W #$0008                                                         ;A3EED2;
    STA.W Temp_TargetYPosition                                           ;A3EED5;
    LDA.W EquippedItems                                                  ;A3EED8;
    BIT.W #$0020                                                         ;A3EEDB;
    BNE .gravitySuit                                                     ;A3EEDE;
    LSR                                                                  ;A3EEE0;
    BCC .powerSuit                                                       ;A3EEE1;
    LDA.W #$6000                                                         ;A3EEE3;
    BRA .merge                                                           ;A3EEE6;

  .gravitySuit:
    LDA.W #$3000                                                         ;A3EEE8;
    BRA .merge                                                           ;A3EEEB;

  .powerSuit:
    LDA.W #$C000                                                         ;A3EEED;

  .merge:
    STA.B DP_Temp12                                                      ;A3EEF0;
    LDA.L Metroid.SamusSubEnergy,X                                       ;A3EEF2;
    SEC                                                                  ;A3EEF6;
    SBC.B DP_Temp12                                                      ;A3EEF7;
    STA.L Metroid.SamusSubEnergy,X                                       ;A3EEF9;
    BCS .return                                                          ;A3EEFD;
    LDA.W #$0001                                                         ;A3EEFF;
    JSL.L Deal_A_Damage_to_Samus                                         ;A3EF02;

  .return:
    RTS                                                                  ;A3EF06;


;;; $EF07: Enemy shot - enemy $DD7F (metroid) ;;;
EnemyShot_Metroid:
    LDA.W SamusYPosition                                                 ;A3EF07;
    SEC                                                                  ;A3EF0A;
    SBC.W #$0008                                                         ;A3EF0B;
    STA.W Temp_TargetYPosition                                           ;A3EF0E;
    LDA.W CollisionIndex                                                 ;A3EF11;
    ASL                                                                  ;A3EF14;
    TAY                                                                  ;A3EF15;
    LDX.W EnemyIndex                                                     ;A3EF16;
    LDA.W Enemy.freezeTimer,X                                            ;A3EF19;
    BEQ .notFrozen                                                       ;A3EF1C;
    LDA.W SamusProjectile_Types,Y                                        ;A3EF1E;
    AND.W #$0F00                                                         ;A3EF21;
    CMP.W #$0100                                                         ;A3EF24;
    BEQ .missile                                                         ;A3EF27;
    CMP.W #$0200                                                         ;A3EF29;
    BNE .returnUpper                                                     ;A3EF2C;

  .missile:
    LDA.W Enemy.XPosition,X                                              ;A3EF2E;
    STA.L EnemyProjectileData_SpecialDeathItemDropXOriginPosition        ;A3EF31;
    LDA.W Enemy.YPosition,X                                              ;A3EF35;
    STA.L EnemyProjectileData_SpecialDeathItemDropYOriginPosition        ;A3EF38;
    JSL.L CommonA3_NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic     ;A3EF3C;
    LDA.W Enemy.health,X                                                 ;A3EF40;
    BNE .returnUpper                                                     ;A3EF43;
    STZ.W Metroid.XVelocity,X                                            ;A3EF45;
    LDA.W #$0004                                                         ;A3EF48;
    JSL.L EnemyDeath                                                     ;A3EF4B;
    LDA.W #$0013                                                         ;A3EF4F;
    JSL.L Run_Samus_Command                                              ;A3EF52;
    LDX.W EnemyIndex                                                     ;A3EF56;
    LDA.L Metroid.electricitySpriteObjectIndex,X                         ;A3EF59;
    TAX                                                                  ;A3EF5D;
    LDA.W #$0000                                                         ;A3EF5E;
    STA.L SpriteObjects_InstListPointers,X                               ;A3EF61;
    LDX.W EnemyIndex                                                     ;A3EF65;
    LDA.L Metroid.shellSpriteObjectIndex,X                               ;A3EF68;
    TAX                                                                  ;A3EF6C;
    LDA.W #$0000                                                         ;A3EF6D;
    STA.L SpriteObjects_InstListPointers,X                               ;A3EF70;
    JSL.L MetroidDeathItemDropRoutine                                    ;A3EF74;

  .returnUpper:
    RTL                                                                  ;A3EF78;

  .notFrozen:
    LDA.W Metroid.functionIndex,X                                        ;A3EF79;
    CMP.W #$0002                                                         ;A3EF7C;
    BNE .notLatched                                                      ;A3EF7F;
    LDA.W SamusProjectile_Types,Y                                        ;A3EF81;
    AND.W #$0F00                                                         ;A3EF84;
    CMP.W #$0500                                                         ;A3EF87;
    BNE .returnLower                                                     ;A3EF8A;
    LDA.W #$0004                                                         ;A3EF8C;
    STA.W Metroid.bombedOffSamusCooldownTimer,X                          ;A3EF8F;
    LDA.W #$0003                                                         ;A3EF92;
    STA.W Metroid.functionIndex,X                                        ;A3EF95;
    LDA.W #InstList_Metroid_ChasingSamus                                 ;A3EF98;
    STA.W Enemy.instList,X                                               ;A3EF9B;
    LDA.W #$0001                                                         ;A3EF9E;
    STA.W Enemy.instTimer,X                                              ;A3EFA1;
    LDA.W #$0013                                                         ;A3EFA4;
    JSL.L Run_Samus_Command                                              ;A3EFA7;

  .returnLower:
    RTL                                                                  ;A3EFAB;

  .notLatched:
    STZ.W Metroid.XSubVelocity,X                                         ;A3EFAC;
    STZ.W Metroid.YSubVelocity,X                                         ;A3EFAF;
    LDY.W #$0000                                                         ;A3EFB2;
    LDA.W Enemy.XPosition,X                                              ;A3EFB5;
    SEC                                                                  ;A3EFB8;
    SBC.W SamusProjectile_XPositions,Y                                   ;A3EFB9;
    BPL +                                                                ;A3EFBC;
    LDY.W #$FF00                                                         ;A3EFBE;

+   PHA                                                                  ;A3EFC1;
    TYA                                                                  ;A3EFC2;
    STA.W Metroid.XVelocity,X                                            ;A3EFC3;
    PLA                                                                  ;A3EFC6;
    ASL                                                                  ;A3EFC7;
    ASL                                                                  ;A3EFC8;
    ASL                                                                  ;A3EFC9;
    ASL                                                                  ;A3EFCA;
    ASL                                                                  ;A3EFCB;
    STA.W Enemy.var0+1,X                                                 ;A3EFCC;
    LDY.W #$0000                                                         ;A3EFCF;
    LDA.W Enemy.YPosition,X                                              ;A3EFD2;
    SEC                                                                  ;A3EFD5;
    SBC.W SamusProjectile_YPositions,Y                                   ;A3EFD6;
    BPL +                                                                ;A3EFD9;
    LDY.W #$FF00                                                         ;A3EFDB;

+   PHA                                                                  ;A3EFDE;
    TYA                                                                  ;A3EFDF;
    STA.W Metroid.YVelocity,X                                            ;A3EFE0;
    PLA                                                                  ;A3EFE3;
    ASL                                                                  ;A3EFE4;
    ASL                                                                  ;A3EFE5;
    ASL                                                                  ;A3EFE6;
    ASL                                                                  ;A3EFE7;
    ASL                                                                  ;A3EFE8;
    STA.W Enemy.var2+1,X                                                 ;A3EFE9;
    STZ.W Metroid.functionIndex,X                                        ;A3EFEC;
    LDA.W #InstList_Metroid_ChasingSamus                                 ;A3EFEF;
    STA.W Enemy.instList,X                                               ;A3EFF2;
    LDA.W #$0001                                                         ;A3EFF5;
    STA.W Enemy.instTimer,X                                              ;A3EFF8;
    LDA.W CollisionIndex                                                 ;A3EFFB;
    ASL                                                                  ;A3EFFE;
    TAY                                                                  ;A3EFFF;
    LDA.W SamusProjectile_Types,Y                                        ;A3F000;
    AND.W #$0002                                                         ;A3F003;
    BEQ .notIceBeam                                                      ;A3F006;
    LDA.W #$000A                                                         ;A3F008;
    JSL.L QueueSound_Lib3_Max6                                           ;A3F00B;
    LDA.W SamusProjectile_Damages,Y                                      ;A3F00F;
    STA.B DP_Temp12                                                      ;A3F012;
    LDA.W #$0004                                                         ;A3F014;
    STA.W Enemy.flashTimer,X                                             ;A3F017;
    LDA.W Metroid.freezeHealthThreshold,X                                ;A3F01A;
    SEC                                                                  ;A3F01D;
    SBC.B DP_Temp12                                                      ;A3F01E;
    BEQ .freeze                                                          ;A3F020;
    BCS .noFreeze                                                        ;A3F022;

  .freeze:
    STZ.W Metroid.freezeHealthThreshold,X                                ;A3F024;
    LDA.W #$0190                                                         ;A3F027;
    STA.W Enemy.freezeTimer,X                                            ;A3F02A;
    LDA.W Enemy.AI,X                                                     ;A3F02D;
    ORA.W #$0004                                                         ;A3F030;
    STA.W Enemy.AI,X                                                     ;A3F033;
    RTL                                                                  ;A3F036;

  .noFreeze:
    STA.W Metroid.freezeHealthThreshold,X                                ;A3F037;

  .notIceBeam:
    LDA.W #$005A                                                         ;A3F03A;
    JSL.L QueueSound_Lib2_Max6                                           ;A3F03D;
    RTL                                                                  ;A3F041;


;;; $F042: Power bomb reaction - enemy $DD7F (metroid) ;;;
PowerBombReaction_Metroid:
    JSL.L NormalEnemyPowerBombAI                                         ;A3F042;
    LDA.W Enemy.health,X                                                 ;A3F046;
    BNE .return                                                          ;A3F049;
    LDA.W #$0013                                                         ;A3F04B;
    JSL.L Run_Samus_Command                                              ;A3F04E;
    LDX.W EnemyIndex                                                     ;A3F052;
    LDA.L Metroid.electricitySpriteObjectIndex,X                         ;A3F055;
    TAX                                                                  ;A3F059;
    LDA.W #$0000                                                         ;A3F05A;
    STA.L SpriteObjects_InstListPointers,X                               ;A3F05D;
    LDX.W EnemyIndex                                                     ;A3F061;
    LDA.L Metroid.shellSpriteObjectIndex,X                               ;A3F064;
    TAX                                                                  ;A3F068;
    LDA.W #$0000                                                         ;A3F069;
    STA.L SpriteObjects_InstListPointers,X                               ;A3F06C;

  .return:
    RTL                                                                  ;A3F070;


;;; $F071: Metroid spritemaps ;;;
if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Metroid_Shell_A3F071:
    dw $000A                                                             ;A3F071;
    %spritemapEntry(0, $10, $04, 0, 1, 2, 0, $130)
    %spritemapEntry(0, $10, $FC, 0, 1, 2, 0, $120)
    %spritemapEntry(0, $10, $F4, 0, 1, 2, 0, $110)
    %spritemapEntry(0, $1E8, $04, 0, 0, 2, 0, $130)
    %spritemapEntry(0, $1E8, $FC, 0, 0, 2, 0, $120)
    %spritemapEntry(0, $1E8, $F4, 0, 0, 2, 0, $110)
    %spritemapEntry(1, $00, $FC, 0, 1, 2, 0, $121)
    %spritemapEntry(1, $00, $EC, 0, 0, 2, 0, $103)
    %spritemapEntry(1, $1F0, $FC, 0, 0, 2, 0, $121)
    %spritemapEntry(1, $1F0, $EC, 0, 0, 2, 0, $101)

UNUSED_Spritemap_Metroid_Shell_A3F0A5:
    dw $000A                                                             ;A3F0A5;
    %spritemapEntry(0, $10, $FC, 0, 1, 2, 0, $12A)
    %spritemapEntry(0, $10, $04, 0, 1, 2, 0, $13A)
    %spritemapEntry(0, $10, $F4, 0, 0, 2, 0, $11F)
    %spritemapEntry(0, $1E8, $04, 0, 0, 2, 0, $13A)
    %spritemapEntry(0, $1E8, $FC, 0, 0, 2, 0, $12A)
    %spritemapEntry(0, $1E8, $F4, 0, 0, 2, 0, $11A)
    %spritemapEntry(1, $00, $EC, 0, 0, 2, 0, $10D)
    %spritemapEntry(1, $00, $FC, 0, 1, 2, 0, $12B)
    %spritemapEntry(1, $1F0, $FC, 0, 0, 2, 0, $12B)
    %spritemapEntry(1, $1F0, $EC, 0, 0, 2, 0, $10B)

UNUSED_Spritemap_Metroid_Shell_A3F0D9:
    dw $000A                                                             ;A3F0D9;
    %spritemapEntry(0, $1E8, $FC, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $10, $04, 0, 1, 2, 0, $135)
    %spritemapEntry(0, $10, $FC, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $10, $F4, 0, 1, 2, 0, $115)
    %spritemapEntry(0, $1E8, $04, 0, 0, 2, 0, $135)
    %spritemapEntry(0, $1E8, $F4, 0, 0, 2, 0, $115)
    %spritemapEntry(1, $00, $FC, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $00, $EC, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $1F0, $FC, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1F0, $EC, 0, 0, 2, 0, $106)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Metroid_Insides_0:
    dw $0008                                                             ;A3F10D;
    %spritemapEntry(0, $10, $00, 0, 1, 2, 0, $160)
    %spritemapEntry(0, $10, $F8, 0, 1, 2, 0, $150)
    %spritemapEntry(0, $1E8, $00, 0, 0, 2, 0, $160)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 2, 0, $150)
    %spritemapEntry(1, $00, $00, 0, 1, 2, 0, $161)
    %spritemapEntry(1, $00, $F0, 0, 1, 2, 0, $141)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $161)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $141)

Spritemap_Metroid_Insides_1:
    dw $0006                                                             ;A3F137;
    %spritemapEntry(0, $10, $00, 0, 1, 2, 0, $163)
    %spritemapEntry(0, $1E8, $00, 0, 0, 2, 0, $163)
    %spritemapEntry(1, $00, $00, 0, 1, 2, 0, $164)
    %spritemapEntry(1, $00, $F0, 0, 1, 2, 0, $144)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $164)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $144)

Spritemap_Metroid_Insides_2:
    dw $0008                                                             ;A3F157;
    %spritemapEntry(0, $10, $00, 0, 1, 2, 0, $166)
    %spritemapEntry(0, $10, $F8, 0, 1, 2, 0, $156)
    %spritemapEntry(0, $1E8, $00, 0, 0, 2, 0, $166)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 2, 0, $156)
    %spritemapEntry(1, $00, $00, 0, 1, 2, 0, $167)
    %spritemapEntry(1, $00, $F0, 0, 1, 2, 0, $147)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $167)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $147)

Spritemap_Metroid_Insides_3:
    dw $0008                                                             ;A3F181;
    %spritemapEntry(0, $10, $00, 0, 1, 2, 0, $169)
    %spritemapEntry(0, $10, $F8, 0, 1, 2, 0, $159)
    %spritemapEntry(0, $1E8, $00, 0, 0, 2, 0, $169)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 2, 0, $159)
    %spritemapEntry(1, $00, $00, 0, 1, 2, 0, $16A)
    %spritemapEntry(1, $00, $F0, 0, 1, 2, 0, $14A)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $16A)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $14A)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Metroid_Electricity_A3F1AB:
    dw $0003                                                             ;A3F1AB;
    %spritemapEntry(0, $00, $EC, 0, 0, 2, 0, $17C)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $14C)

UNUSED_Spritemap_Metroid_Electricity_A3F1BC:
    dw $0003                                                             ;A3F1BC;
    %spritemapEntry(0, $00, $EC, 0, 0, 2, 0, $17D)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 0, $15D)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $15C)

UNUSED_Spritemap_Metroid_Electricity_A3F1CD:
    dw $0003                                                             ;A3F1CD;
    %spritemapEntry(0, $00, $EC, 0, 0, 2, 0, $17E)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 0, $16D)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $16C)

UNUSED_Spritemap_Metroid_Electricity_A3F1DE:
    dw $0004                                                             ;A3F1DE;
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 0, $14F)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 0, $14E)
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1F8, $EC, 0, 0, 2, 0, $12D)

UNUSED_Spritemap_Metroid_Electricity_A3F1F4:
    dw $0004                                                             ;A3F1F4;
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 0, $15F)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 0, $15E)
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 0, $13E)
    %spritemapEntry(0, $1F8, $EC, 0, 0, 2, 0, $12E)

UNUSED_Spritemap_Metroid_Electricity_A3F20A:
    dw $0004                                                             ;A3F20A;
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 0, $16F)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 0, $16E)
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 0, $13F)
    %spritemapEntry(0, $1F8, $EC, 0, 0, 2, 0, $12F)

UNUSED_Spritemap_Metroid_Electricity_A3F220:
    dw $0003                                                             ;A3F220;
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 0, $14C)
    %spritemapEntry(0, $1F8, $EC, 0, 1, 2, 0, $17C)

UNUSED_Spritemap_Metroid_Electricity_A3F231:
    dw $0003                                                             ;A3F231;
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 0, $15D)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 0, $15C)
    %spritemapEntry(0, $1F8, $EC, 0, 1, 2, 0, $17D)

UNUSED_Spritemap_Metroid_Electricity_A3F242:
    dw $0003                                                             ;A3F242;
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 0, $16D)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 0, $16C)
    %spritemapEntry(0, $1F8, $EC, 0, 1, 2, 0, $17E)

UNUSED_Spritemap_Metroid_Electricity_A3F253:
    dw $0004                                                             ;A3F253;
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 0, $14F)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $14E)
    %spritemapEntry(0, $00, $F4, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $00, $EC, 0, 1, 2, 0, $12D)

UNUSED_Spritemap_Metroid_Electricity_A3F269:
    dw $0004                                                             ;A3F269;
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 0, $16F)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $16E)
    %spritemapEntry(0, $00, $F4, 0, 1, 2, 0, $13E)
    %spritemapEntry(0, $00, $EC, 0, 1, 2, 0, $12E)

UNUSED_Spritemap_Metroid_Electricity_A3F27F:
    dw $0004                                                             ;A3F27F;
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 0, $15F)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $15E)
    %spritemapEntry(0, $00, $F4, 0, 1, 2, 0, $13F)
    %spritemapEntry(0, $00, $EC, 0, 1, 2, 0, $12F)

UNUSED_Spritemap_Metroid_Electricity_A3F295:
    dw $0002                                                             ;A3F295;
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $14C)

UNUSED_Spritemap_Metroid_Electricity_A3F2A1:
    dw $0001                                                             ;A3F2A1;
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $15C)

UNUSED_Spritemap_Metroid_Electricity_A3F2A8:
    dw $0002                                                             ;A3F2A8;
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 0, $16D)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $16C)

UNUSED_Spritemap_Metroid_Electricity_A3F2B4:
    dw $0002                                                             ;A3F2B4;
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1F8, $EC, 0, 0, 2, 0, $12D)

UNUSED_Spritemap_Metroid_Electricity_A3F2C0:
    dw $0002                                                             ;A3F2C0;
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 0, $13E)
    %spritemapEntry(0, $1F8, $EC, 0, 0, 2, 0, $12E)

UNUSED_Spritemap_Metroid_Electricity_A3F2CC:
    dw $0002                                                             ;A3F2CC;
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 0, $13F)
    %spritemapEntry(0, $1F8, $EC, 0, 0, 2, 0, $12F)

UNUSED_Spritemap_Metroid_Electricity_A3F2D8:
    dw $0002                                                             ;A3F2D8;
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 0, $14C)

UNUSED_Spritemap_Metroid_Electricity_A3F2E4:
    dw $0002                                                             ;A3F2E4;
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 0, $15D)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 0, $15C)

UNUSED_Spritemap_Metroid_Electricity_A3F2F0:
    dw $0002                                                             ;A3F2F0;
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 0, $16D)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 0, $16C)

UNUSED_Spritemap_Metroid_Electricity_A3F2FC:
    dw $0001                                                             ;A3F2FC;
    %spritemapEntry(0, $00, $EC, 0, 0, 2, 0, $17C)

UNUSED_Spritemap_Metroid_Electricity_A3F303:
    dw $0001                                                             ;A3F303;
    %spritemapEntry(0, $00, $EC, 0, 0, 2, 0, $17D)

UNUSED_Spritemap_Metroid_Electricity_A3F30A:
    dw $0001                                                             ;A3F30A;
    %spritemapEntry(0, $00, $EC, 0, 0, 2, 0, $17E)
endif ; !FEATURE_KEEP_UNREFERENCED


Freespace_BankA3_F311:                                                   ;A3F311;
; $CEF bytes
