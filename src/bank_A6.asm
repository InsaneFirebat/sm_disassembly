
; Enemy AI: Ridley, Boulder, Kzan, Hibashi, Puromi, MiniKraid, Steam, Ceres door, Zebetite

org $A68000


; Common to all enemy code banks

;;; $8000: Grapple AI - no interaction. Also unfreezes enemies(!) ;;;
CommonA6_GrappleAI_NoInteraction:
; Used by skultera, Draygon body, fire arc, Phantoon, etecoon, dachora and WS ghost
    JSL.L GrappleAI_SwitchEnemyAIToMainAI                                ;A68000;
    RTL                                                                  ;A68004;


;;; $8005: Grapple AI - Samus latches on ;;;
CommonA6_GrappleAI_SamusLatchesOn:
; Used by gripper and Crocomire
    JSL.L GrappleAI_SamusLatchesOnWithGrapple                            ;A68005;
    RTL                                                                  ;A68009;


;;; $800A: Grapple AI - kill enemy ;;;
CommonA6_GrappleAI_KillEnemy:
; Common
    JSL.L GrappleAI_EnemyGrappleDeath                                    ;A6800A;
    RTL                                                                  ;A6800E;


;;; $800F: Grapple AI - cancel grapple beam ;;;
CommonA6_GrappleAI_CancelGrappleBeam:
; Common
    JSL.L GrappleAI_SwitchToFrozenAI                                     ;A6800F;
    RTL                                                                  ;A68013;


;;; $8014: Grapple AI - Samus latches on - no invincibility ;;;
CommonA6_GrappleAI_SamusLatchesOn_NoInvincibility:
; Used by powamp
    JSL.L GrappleAI_SamusLatchesOnWithGrapple_NoInvincibility            ;A68014;
    RTL                                                                  ;A68018;


;;; $8019: Unused. Grapple AI - Samus latches on - paralyse enemy ;;;
UNUSED_CommonA6_GrappleAI_SamusLatchesOn_ParalyzeEnemy_A68019:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple_ParalyzeEnemy              ;A68019;
    RTL                                                                  ;A6801D;


;;; $801E: Grapple AI - hurt Samus ;;;
CommonA6_GrappleAI_HurtSamus:
; Used by WS spark
; Hurt reaction happens in $9B:B932
    JSL.L GrappleAI_SwitchToFrozenAI_duplicate                           ;A6801E;
    RTL                                                                  ;A68022;


;;; $8023: Normal enemy touch AI ;;;
CommonA6_NormalEnemyTouchAI:
    JSL.L NormalEnemyTouchAI                                             ;A68023;
    RTL                                                                  ;A68027;


;;; $8028: Normal touch AI - no death check ;;;
CommonA6_NormalTouchAI_NoDeathCheck:
    JSL.L NormalEnemyTouchAI_NoDeathCheck_External                       ;A68028;
    RTL                                                                  ;A6802C;


;;; $802D: Normal enemy shot AI ;;;
CommonA6_NormalEnemyShotAI:
    JSL.L NormalEnemyShotAI                                              ;A6802D;
    RTL                                                                  ;A68031;


;;; $8032: Normal enemy shot AI - no death check, no enemy shot graphic ;;;
CommonA6_NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic:
    JSL.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External     ;A68032;
    RTL                                                                  ;A68036;


;;; $8037: Normal enemy power bomb AI ;;;
CommonA6_NormalEnemyPowerBombAI:
    JSL.L NormalEnemyPowerBombAI                                         ;A68037;
    RTL                                                                  ;A6803B;


;;; $803C: Normal enemy power bomb AI - no death check ;;;
CommonA6_NormalEnemyPowerBombAI_NoDeathCheck:
; Kraid's power bomb AI
    JSL.L NormalEnemyPowerBombAI_NoDeathCheck_External                   ;A6803C;
    RTL                                                                  ;A68040;


;;; $8041: Normal enemy frozen AI ;;;
CommonA6_NormalEnemyFrozenAI:
    JSL.L NormalEnemyFrozenAI                                            ;A68041;
    RTL                                                                  ;A68045;


;;; $8046: Creates a dud shot ;;;
CommonA6_CreateADudShot:
    JSL.L CreateADudShot                                                 ;A68046;
    RTL                                                                  ;A6804A;


;;; $804B: RTS ;;;
RTS_A6804B:
    RTS                                                                  ;A6804B;


;;; $804C: RTL ;;;
RTL_A6804C:
    RTL                                                                  ;A6804C;


;;; $804D: Spritemap - nothing ;;;
Spritemap_CommonA6_Nothing:
    dw $0000                                                             ;A6804D;


;;; $804F: Extended spritemap - nothing ;;;
ExtendedSpritemap_CommonA6_Nothing:
    dw $0001                                                             ;A6804F;
    dw $0000,$0000
    dw Spritemap_CommonA6_Nothing                                        ;A68055;
    dw Hitbox_CommonA6_Nothing                                           ;A68057;


;;; $8059: Hitbox - nothing ;;;
Hitbox_CommonA6_Nothing:
; [n entries] [[left offset] [top offset] [right offset] [bottom offset] [p touch] [p shot]]...
    dw $0001                                                             ;A68059;
    dw $0000,$0000,$0000,$0000
    dw CommonA6_NormalEnemyTouchAI                                       ;A68063;
    dw CommonA6_NormalEnemyShotAI                                        ;A68065;


;;; $8067: Instruction list - delete enemy ;;;
InstList_CommonA6_DeleteEnemy:
    dw Instruction_CommonA6_DeleteEnemy                                  ;A68067;


;;; $8069: Two NOPs ;;;
NOPNOP_A68069:
; Used as palette by respawning enemy placeholder and Draygon's eye o_O
    NOP                                                                  ;A68069;
    NOP                                                                  ;A6806A;


;;; $806B: Instruction - Enemy.var5 = [[Y]] ;;;
Instruction_CommonA6_Enemy0FB2_InY:
; Used only by torizos (for enemy movement function) and escape etecoon (for enemy function)
    LDA.W $0000,Y                                                        ;A6806B;
    STA.W Enemy.var5,X                                                   ;A6806E;
    INY                                                                  ;A68071;
    INY                                                                  ;A68072;
    RTL                                                                  ;A68073;


;;; $8074: Instruction - Enemy.var5 = RTS ;;;
Instruction_CommonA6_SetEnemy0FB2ToRTS:
    LDA.W #RTS_A6807B                                                    ;A68074;
    STA.W Enemy.var5,X                                                   ;A68077;
    RTL                                                                  ;A6807A;


RTS_A6807B:
    RTS                                                                  ;A6807B;


;;; $807C: Instruction - delete enemy ;;;
Instruction_CommonA6_DeleteEnemy:
    LDA.W Enemy.properties,X                                             ;A6807C;
    ORA.W #$0200                                                         ;A6807F;
    STA.W Enemy.properties,X                                             ;A68082;
    PLA                                                                  ;A68085;
    PEA.W ProcessEnemyInstructions_return-1                              ;A68086;
    RTL                                                                  ;A68089;


;;; $808A: Instruction - call function [[Y]] ;;;
Instruction_CommonA6_CallFunctionInY:
    LDA.W $0000,Y                                                        ;A6808A;
    STA.B DP_Temp12                                                      ;A6808D;
    PHY                                                                  ;A6808F;
    PHX                                                                  ;A68090;
    PEA.W .manualReturn-1                                                ;A68091;
    JMP.W (DP_Temp12)                                                    ;A68094;

  .manualReturn:
    PLX                                                                  ;A68097;
    PLY                                                                  ;A68098;
    INY                                                                  ;A68099;
    INY                                                                  ;A6809A;
    RTL                                                                  ;A6809B;


;;; $809C: Instruction - call function [[Y]] with A = [[Y] + 2] ;;;
Instruction_CommonA6_CallFunctionInY_WithA:
    LDA.W $0000,Y                                                        ;A6809C;
    STA.B DP_Temp12                                                      ;A6809F;
    LDA.W $0002,Y                                                        ;A680A1;
    PHY                                                                  ;A680A4;
    PHX                                                                  ;A680A5;
    PEA.W .manualReturn-1                                                ;A680A6;
    JMP.W (DP_Temp12)                                                    ;A680A9;

  .manualReturn:
    PLX                                                                  ;A680AC;
    PLY                                                                  ;A680AD;
    TYA                                                                  ;A680AE;
    CLC                                                                  ;A680AF;
    ADC.W #$0004                                                         ;A680B0;
    TAY                                                                  ;A680B3;
    RTL                                                                  ;A680B4;


if !FEATURE_KEEP_UNREFERENCED
;;; $80B5: Unused. Instruction - call external function [[Y]] ;;;
UNUSED_Instruction_CommonA6_CallExternalFunctionInY_A680B5:
    LDA.W $0000,Y                                                        ;A680B5;
    STA.B DP_Temp12                                                      ;A680B8;
    LDA.W $0001,Y                                                        ;A680BA;
    STA.B DP_Temp13                                                      ;A680BD;
    PHX                                                                  ;A680BF;
    PHY                                                                  ;A680C0;
    JSL.L .externalFunction                                              ;A680C1;
    PLY                                                                  ;A680C5;
    PLX                                                                  ;A680C6;
    INY                                                                  ;A680C7;
    INY                                                                  ;A680C8;
    INY                                                                  ;A680C9;
    RTL                                                                  ;A680CA;

  .externalFunction:
    JML.W [DP_Temp12]                                                    ;A680CB;


;;; $80CE: Unused. Instruction - call external function [[Y]] with A = [[Y] + 3] ;;;
UNUSED_Inst_CommonA6_CallExternalFunctionInY_WithA_A680CE:
    LDA.W $0000,Y                                                        ;A680CE;
    STA.B DP_Temp12                                                      ;A680D1;
    LDA.W $0001,Y                                                        ;A680D3;
    STA.B DP_Temp13                                                      ;A680D6;
    LDA.W $0003,Y                                                        ;A680D8;
    PHX                                                                  ;A680DB;
    PHY                                                                  ;A680DC;
    JSL.L .externalFunction                                              ;A680DD;
    PLY                                                                  ;A680E1;
    PLX                                                                  ;A680E2;
    TYA                                                                  ;A680E3;
    CLC                                                                  ;A680E4;
    ADC.W #$0005                                                         ;A680E5;
    TAY                                                                  ;A680E8;
    RTL                                                                  ;A680E9;

  .externalFunction:
    JML.W [DP_Temp12]                                                    ;A680EA;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $80ED: Instruction - go to [[Y]] ;;;
Instruction_CommonA6_GotoY:
    LDA.W $0000,Y                                                        ;A680ED;
    TAY                                                                  ;A680F0;
    RTL                                                                  ;A680F1;


;;; $80F2: Instruction - go to [[Y]] + ±[[Y]] ;;;
Instruction_CommonA6_GotoY_PlusY:
    STY.B DP_Temp12                                                      ;A680F2;
    DEY                                                                  ;A680F4;
    LDA.W $0000,Y                                                        ;A680F5;
    XBA                                                                  ;A680F8;
    BMI .highByte                                                        ;A680F9;
    AND.W #$00FF                                                         ;A680FB;
    BRA +                                                                ;A680FE;

  .highByte:
    ORA.W #$FF00                                                         ;A68100;

+   CLC                                                                  ;A68103;
    ADC.B DP_Temp12                                                      ;A68104;
    TAY                                                                  ;A68106;
    RTL                                                                  ;A68107;


;;; $8108: Instruction - decrement timer and go to [[Y]] if non-zero ;;;
Instruction_CommonA6_DecrementTimer_GotoYIfNonZero:
    DEC.W Enemy.loopCounter,X                                            ;A68108;
    BNE Instruction_CommonA6_GotoY                                       ;A6810B;
    INY                                                                  ;A6810D;
    INY                                                                  ;A6810E;
    RTL                                                                  ;A6810F;


;;; $8110: Instruction - decrement timer and go to [[Y]] if non-zero ;;;
Instruction_CommonA6_DecrementTimer_GotoYIfNonZero_duplicate:
    DEC.W Enemy.loopCounter,X                                            ;A68110;
    BNE Instruction_CommonA6_GotoY                                       ;A68113;
    INY                                                                  ;A68115;
    INY                                                                  ;A68116;
    RTL                                                                  ;A68117;


;;; $8118: Instruction - decrement timer and go to [Y] + ±[[Y]] if non-zero ;;;
Instruction_CommonA6_DecrementTimer_GotoY_PlusY_IfNonZero:
    SEP #$20                                                             ;A68118;
    DEC.W Enemy.loopCounter,X                                            ;A6811A;
    REP #$20                                                             ;A6811D;
    BNE Instruction_CommonA6_GotoY_PlusY                                 ;A6811F;
    INY                                                                  ;A68121;
    RTL                                                                  ;A68122;


;;; $8123: Instruction - timer = [[Y]] ;;;
Instruction_CommonA6_TimerInY:
    LDA.W $0000,Y                                                        ;A68123;
    STA.W Enemy.loopCounter,X                                            ;A68126;
    INY                                                                  ;A68129;
    INY                                                                  ;A6812A;
    RTL                                                                  ;A6812B;


;;; $812C: Instruction - skip next instruction ;;;
Instruction_CommonA6_SkipNextInstruction:
    INY                                                                  ;A6812C;
    INY                                                                  ;A6812D;
    RTL                                                                  ;A6812E;


;;; $812F: Instruction - sleep ;;;
Instruction_CommonA6_Sleep:
    DEY                                                                  ;A6812F;
    DEY                                                                  ;A68130;
    TYA                                                                  ;A68131;
    STA.W Enemy.instList,X                                               ;A68132;
    PLA                                                                  ;A68135;
    PEA.W ProcessEnemyInstructions_return-1                              ;A68136;
    RTL                                                                  ;A68139;


;;; $813A: Instruction - wait [[Y]] frames ;;;
Instruction_CommonA6_WaitYFrames:
; Set instruction timer and terminate processing enemy instructions
; Used for running a delay that doesn't update graphics,
; useful for e.g. GT eye beam attack ($AA:D10D), implemented by an instruction list that has no graphical instructions,
; which allows it to be called from multiple different poses
    LDA.W $0000,Y                                                        ;A6813A;
    STA.W Enemy.instTimer,X                                              ;A6813D;
    INY                                                                  ;A68140;
    INY                                                                  ;A68141;
    TYA                                                                  ;A68142;
    STA.W Enemy.instList,X                                               ;A68143;
    PLA                                                                  ;A68146;
    PEA.W ProcessEnemyInstructions_return-1                              ;A68147;
    RTL                                                                  ;A6814A;


;;; $814B: Instruction - transfer [[Y]] bytes from [[Y] + 2] to VRAM [[Y] + 5] ;;;
Instruction_CommonA6_TransferYBytesInYToVRAM:
    PHX                                                                  ;A6814B;
    LDX.W VRAMWriteStack                                                 ;A6814C;
    LDA.W $0000,Y                                                        ;A6814F;
    STA.B VRAMWrite.size,X                                               ;A68152;
    LDA.W $0002,Y                                                        ;A68154;
    STA.B VRAMWrite.src,X                                                ;A68157;
    LDA.W $0003,Y                                                        ;A68159;
    STA.B VRAMWrite.src+1,X                                              ;A6815C;
    LDA.W $0005,Y                                                        ;A6815E;
    STA.B VRAMWrite.dest,X                                               ;A68161;
    TXA                                                                  ;A68163;
    CLC                                                                  ;A68164;
    ADC.W #$0007                                                         ;A68165;
    STA.W VRAMWriteStack                                                 ;A68168;
    TYA                                                                  ;A6816B;
    CLC                                                                  ;A6816C;
    ADC.W #$0007                                                         ;A6816D;
    TAY                                                                  ;A68170;
    PLX                                                                  ;A68171;
    RTL                                                                  ;A68172;


;;; $8173: Instruction - enable off-screen processing ;;;
Instruction_CommonA6_EnableOffScreenProcessing:
    LDA.W Enemy.properties,X                                             ;A68173;
    ORA.W #$0800                                                         ;A68176;
    STA.W Enemy.properties,X                                             ;A68179;
    RTL                                                                  ;A6817C;


;;; $817D: Instruction - disable off-screen processing ;;;
Instruction_CommonA6_DisableOffScreenProcessing:
    LDA.W Enemy.properties,X                                             ;A6817D;
    AND.W #$F7FF                                                         ;A68180;
    STA.W Enemy.properties,X                                             ;A68183;
    RTL                                                                  ;A68186;


;;; $8187: Common enemy speeds - linearly increasing ;;;
CommonA6EnemySpeeds_LinearlyIncreasing:
;        _____________________ Speed
;       |      _______________ Subspeed
;       |     |      _________ Negated speed
;       |     |     |      ___ Negated subspeed
;       |     |     |     |
  .speed:
    dw $0000                                                             ;A68187;
  .subspeed:
    dw       $0000                                                       ;A68189;
  .negatedSpeed:
    dw             $0000                                                 ;A6818B;
  .negatedSubspeed:
    dw                   $0000                                           ;A6818D;
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
    dw $0000                                                             ;A6838F;
  .speed:
    dw       $0000                                                       ;A68391;
  .negatedSubspeed:
    dw             $0000                                                 ;A68393;
  .negatedSpeed:
    dw                   $0000                                           ;A68395;
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
    dw $3800,$49EF,$45CE,$3D8C,$396B,$3529,$2D08,$28C6                   ;A68687;
    dw $20A5,$1C63,$2506,$1CC4,$1083,$0841,$6EF7,$0000                   ;A68697;


;;; $86A7: Instruction list - facing left ;;;
InstList_Boulder_FacingLeft:
    dw $0008,Spritemap_Boulder_0                                         ;A686A7;
    dw $0008,Spritemap_Boulder_1                                         ;A686AB;
    dw $0008,Spritemap_Boulder_2                                         ;A686AF;
    dw $0008,Spritemap_Boulder_3                                         ;A686B3;
    dw $0008,Spritemap_Boulder_4                                         ;A686B7;
    dw $0008,Spritemap_Boulder_5                                         ;A686BB;
    dw $0008,Spritemap_Boulder_6                                         ;A686BF;
    dw $0008,Spritemap_Boulder_7                                         ;A686C3;
    dw Instruction_Common_GotoY                                          ;A686C7;
    dw InstList_Boulder_FacingLeft                                       ;A686C9;


;;; $86CB: Instruction list - facing right ;;;
InstList_Boulder_FacingRight:
    dw $0008,Spritemap_Boulder_0                                         ;A686CB;
    dw $0008,Spritemap_Boulder_7                                         ;A686CF;
    dw $0008,Spritemap_Boulder_6                                         ;A686D3;
    dw $0008,Spritemap_Boulder_5                                         ;A686D7;
    dw $0008,Spritemap_Boulder_4                                         ;A686DB;
    dw $0008,Spritemap_Boulder_3                                         ;A686DF;
    dw $0008,Spritemap_Boulder_2                                         ;A686E3;
    dw $0008,Spritemap_Boulder_1                                         ;A686E7;
    dw Instruction_Common_GotoY                                          ;A686EB;
    dw InstList_Boulder_FacingRight                                      ;A686ED;


;;; $86EF: Bounce speed table indices ;;;
BounceSpeedTableIndices:
; Y speed table index * 100h. Indexed by [enemy bounce index] * 2
    dw $0000,$1000,$1800                                                 ;A686EF;


;;; $86F5: Initialisation AI - enemy $DFBF (boulder) ;;;
InitAI_Boulder:
    LDX.W EnemyIndex                                                     ;A686F5;
    STZ.W Boulder.YSpeedTableIndex,X                                     ;A686F8;
    LDA.W #$0000                                                         ;A686FB;
    STA.W Boulder.XSpeedTableIndex,X                                     ;A686FE;
    LDA.W #$0002                                                         ;A68701;
    STA.W Boulder.bounceIndex,X                                          ;A68704;
    LDA.W #Function_Boulder_WaitForSamusToGetNear                        ;A68707;
    STA.W Boulder.function,X                                             ;A6870A;
    LDA.W Enemy.XPosition,X                                              ;A6870D;
    STA.L Boulder.spawnXPosition,X                                       ;A68710;
    LDA.W Enemy.YPosition,X                                              ;A68714;
    STA.L Boulder.fallingTargetYPosition,X                               ;A68717;
    STA.L Boulder.previousEnemyYPosition,X                               ;A6871B;
    LDA.W Enemy.YSubPosition,X                                           ;A6871F;
    STA.L Boulder.previousEnemyYSubPosition,X                            ;A68722;
    LDA.W Enemy.init1+1,X                                                ;A68726;
    AND.W #$00FF                                                         ;A68729;
    BNE .notRolling                                                      ;A6872C;
    LDA.W #$0001                                                         ;A6872E;
    STA.L Boulder.type,X                                                 ;A68731;

  .notRolling:
    EOR.W #$FFFF                                                         ;A68735;
    INC                                                                  ;A68738;
    CLC                                                                  ;A68739;
    ADC.L Boulder.fallingTargetYPosition,X                               ;A6873A;
    STA.W Enemy.YPosition,X                                              ;A6873E;
    LDA.W Enemy.init1,X                                                  ;A68741;
    AND.W #$00FF                                                         ;A68744;
    EOR.W #$FFFF                                                         ;A68747;
    INC                                                                  ;A6874A;
    STA.L Boulder.XProximity,X                                           ;A6874B;
    LDA.W Enemy.instList,X                                               ;A6874F;
    AND.W #$00FF                                                         ;A68752;
    STA.L Boulder.YProximity,X                                           ;A68755;
    LDA.W #InstList_Boulder_FacingLeft                                   ;A68759;
    STA.W Enemy.instList,X                                               ;A6875C;
    LDA.W Enemy.init0+1,X                                                ;A6875F;
    AND.W #$00FF                                                         ;A68762;
    STA.W Boulder.direction,X                                            ;A68765;
    BNE .left                                                            ;A68768;
    LDA.L Boulder.XProximity,X                                           ;A6876A;
    EOR.W #$FFFF                                                         ;A6876E;
    INC                                                                  ;A68771;
    STA.L Boulder.XProximity,X                                           ;A68772;
    LDA.W #InstList_Boulder_FacingRight                                  ;A68776;
    STA.W Enemy.instList,X                                               ;A68779;

  .left:
    LDA.W #$0002                                                         ;A6877C;
    STA.L Boulder.minimumDistanceFromGround,X                            ;A6877F;
    LDA.W Enemy.init0,X                                                  ;A68783;
    AND.W #$00FF                                                         ;A68786;
    BEQ .return                                                          ;A68789;
    LDA.W #$0005                                                         ;A6878B;
    STA.L Boulder.minimumDistanceFromGround,X                            ;A6878E;

  .return:
    RTL                                                                  ;A68792;


;;; $8793: Main AI - enemy $DFBF (boulder) ;;;
MainAI_Boulder:
    LDX.W EnemyIndex                                                     ;A68793;
    JSR.W (Boulder.function,X)                                           ;A68796;
    RTL                                                                  ;A68799;


;;; $879A: Boulder function - wait for Samus to get near ;;;
Function_Boulder_WaitForSamusToGetNear:
    LDX.W EnemyIndex                                                     ;A6879A;
    JSL.L Get_SamusY_minus_EnemyY                                        ;A6879D;
    BMI .return                                                          ;A687A1;
    CMP.L Boulder.YProximity,X                                           ;A687A3;
    BPL .return                                                          ;A687A7;
    LDA.W Boulder.direction,X                                            ;A687A9;
    BNE .left                                                            ;A687AC;
    JSL.L Get_SamusX_minus_EnemyX                                        ;A687AE;
    BMI .return                                                          ;A687B2;
    CMP.L Boulder.XProximity,X                                           ;A687B4;
    BPL .return                                                          ;A687B8;
    LDA.W #Function_Boulder_Falling                                      ;A687BA;
    STA.W Boulder.function,X                                             ;A687BD;
    LDA.L Boulder.type,X                                                 ;A687C0;
    BEQ .return                                                          ;A687C4;
    LDA.W #Function_Boulder_Rolling                                      ;A687C6;
    STA.W Boulder.function,X                                             ;A687C9;
    BRA .return                                                          ;A687CC;


  .left:
    JSL.L Get_SamusX_minus_EnemyX                                        ;A687CE;
    BPL .return                                                          ;A687D2;
    CMP.L Boulder.XProximity,X                                           ;A687D4;
    BMI .return                                                          ;A687D8;
    LDA.W #Function_Boulder_Falling                                      ;A687DA;
    STA.W Boulder.function,X                                             ;A687DD;
    LDA.L Boulder.type,X                                                 ;A687E0;
    BEQ .return                                                          ;A687E4;
    LDA.W #Function_Boulder_Rolling                                      ;A687E6;
    STA.W Boulder.function,X                                             ;A687E9;

  .return:
    RTS                                                                  ;A687EC;


;;; $87ED: Boulder function - falling ;;;
Function_Boulder_Falling:
    LDX.W EnemyIndex                                                     ;A687ED;
    LDA.W Boulder.YSpeedTableIndex,X                                     ;A687F0;
    AND.W #$FF00                                                         ;A687F3;
    XBA                                                                  ;A687F6;
    ASL                                                                  ;A687F7;
    ASL                                                                  ;A687F8;
    ASL                                                                  ;A687F9;
    TAY                                                                  ;A687FA;
    JSR.W MoveBoulderVertically                                          ;A687FB;
    LDA.W Enemy.YPosition,X                                              ;A687FE;
    CMP.L Boulder.fallingTargetYPosition,X                               ;A68801;
    BMI .notReachedTarget                                                ;A68805;
    LDA.L Boulder.fallingTargetYPosition,X                               ;A68807;
    STA.W Enemy.YPosition,X                                              ;A6880B;
    LDA.W #Function_Boulder_Bounce_Rising                                ;A6880E;
    STA.W Boulder.function,X                                             ;A68811;
    LDA.W #$2000                                                         ;A68814;
    STA.W Boulder.YSpeedTableIndex,X                                     ;A68817;
    BRA .return                                                          ;A6881A;

  .notReachedTarget:
    LDA.W Boulder.YSpeedTableIndex,X                                     ;A6881C;
    CLC                                                                  ;A6881F;
    ADC.W #$0100                                                         ;A68820;
    STA.W Boulder.YSpeedTableIndex,X                                     ;A68823;
    CMP.W #$5000                                                         ;A68826;
    BMI .return                                                          ;A68829;
    LDA.W #$5000                                                         ;A6882B;
    STA.W Boulder.YSpeedTableIndex,X                                     ;A6882E;

  .return:
    RTS                                                                  ;A68831;


;;; $8832: Boulder function - bounce - rising ;;;
Function_Boulder_Bounce_Rising:
    LDX.W EnemyIndex                                                     ;A68832;
    LDA.W Boulder.YSpeedTableIndex,X                                     ;A68835;
    AND.W #$FF00                                                         ;A68838;
    XBA                                                                  ;A6883B;
    ASL                                                                  ;A6883C;
    ASL                                                                  ;A6883D;
    ASL                                                                  ;A6883E;
    INC                                                                  ;A6883F;
    INC                                                                  ;A68840;
    INC                                                                  ;A68841;
    INC                                                                  ;A68842;
    TAY                                                                  ;A68843;
    JSR.W MoveBoulderVertically                                          ;A68844;
    LDA.W Boulder.YSpeedTableIndex,X                                     ;A68847;
    SEC                                                                  ;A6884A;
    SBC.W #$0100                                                         ;A6884B;
    STA.W Boulder.YSpeedTableIndex,X                                     ;A6884E;
    BPL .negativeSpeedTableIndex                                         ;A68851;
    STZ.W Boulder.YSpeedTableIndex,X                                     ;A68853;
    LDA.W #Function_Boulder_Bounce_Falling                               ;A68856;
    STA.W Boulder.function,X                                             ;A68859;
    BRA .return                                                          ;A6885C;

  .negativeSpeedTableIndex:
    LDA.W Boulder.XSpeedTableIndex,X                                     ;A6885E;
    AND.W #$FF00                                                         ;A68861;
    XBA                                                                  ;A68864;
    ASL                                                                  ;A68865;
    ASL                                                                  ;A68866;
    ASL                                                                  ;A68867;
    TAY                                                                  ;A68868;
    LDA.W Boulder.direction,X                                            ;A68869;
    BEQ .right                                                           ;A6886C;
    INY                                                                  ;A6886E;
    INY                                                                  ;A6886F;
    INY                                                                  ;A68870;
    INY                                                                  ;A68871;

  .right:
    JSR.W MoveBoulderHorizontally                                        ;A68872;
    LDA.W Boulder.XSpeedTableIndex,X                                     ;A68875;
    CLC                                                                  ;A68878;
    ADC.W #$0020                                                         ;A68879;
    STA.W Boulder.XSpeedTableIndex,X                                     ;A6887C;
    CMP.W #$5000                                                         ;A6887F;
    BMI .return                                                          ;A68882;
    LDA.W #$5000                                                         ;A68884;
    STA.W Boulder.XSpeedTableIndex,X                                     ;A68887;

  .return:
    RTS                                                                  ;A6888A;


;;; $888B: Boulder function - bounce - falling ;;;
Function_Boulder_Bounce_Falling:
    LDX.W EnemyIndex                                                     ;A6888B;
    LDA.W Boulder.YSpeedTableIndex,X                                     ;A6888E;
    AND.W #$FF00                                                         ;A68891;
    XBA                                                                  ;A68894;
    ASL                                                                  ;A68895;
    ASL                                                                  ;A68896;
    ASL                                                                  ;A68897;
    TAY                                                                  ;A68898;
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing,Y                    ;A68899;
    STA.B DP_Temp12                                                      ;A6889C;
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+2,Y                  ;A6889E;
    STA.B DP_Temp14                                                      ;A688A1;
    JSL.L MoveEnemyDownBy_14_12                                          ;A688A3;
    BCC .noCollision                                                     ;A688A7;
    LDA.W #$0042                                                         ;A688A9;
    JSL.L QueueSound_Lib2_Max6                                           ;A688AC;
    LDA.W Boulder.direction,X                                            ;A688B0;
    CMP.W #$0002                                                         ;A688B3;
    BNE .right                                                           ;A688B6;
    LDA.W Enemy.properties,X                                             ;A688B8;
    ORA.W #$0200                                                         ;A688BB;
    STA.W Enemy.properties,X                                             ;A688BE;
    LDA.W Enemy.XPosition,X                                              ;A688C1;
    STA.B DP_Temp12                                                      ;A688C4;
    LDA.W Enemy.YPosition,X                                              ;A688C6;
    STA.B DP_Temp14                                                      ;A688C9;
    LDA.W #$0011                                                         ;A688CB;
    LDY.W #EnemyProjectile_MiscDust                                      ;A688CE;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A688D1;
    LDA.W #$0043                                                         ;A688D5;
    JSL.L QueueSound_Lib2_Max6                                           ;A688D8;
    BRA .return                                                          ;A688DC;

  .right:
    LDA.W #Function_Boulder_Bounce_Rising                                ;A688DE;
    STA.W Boulder.function,X                                             ;A688E1;
    LDA.W Boulder.bounceIndex,X                                          ;A688E4;
    DEC                                                                  ;A688E7;
    ASL                                                                  ;A688E8;
    TAY                                                                  ;A688E9;
    LDA.W BounceSpeedTableIndices+2,Y                                    ;A688EA;
    STA.W Boulder.YSpeedTableIndex,X                                     ;A688ED;
    DEC.W Boulder.bounceIndex,X                                          ;A688F0;
    BPL .return                                                          ;A688F3;
    LDA.W Enemy.YPosition,X                                              ;A688F5;
    STA.L Boulder.previousEnemyYPosition,X                               ;A688F8;
    LDA.W Enemy.YSubPosition,X                                           ;A688FC;
    STA.L Boulder.previousEnemyYSubPosition,X                            ;A688FF;
    LDA.W #Function_Boulder_Rolling                                      ;A68903;
    STA.W Boulder.function,X                                             ;A68906;
    BRA .return                                                          ;A68909;

  .noCollision:
    LDA.W Boulder.YSpeedTableIndex,X                                     ;A6890B;
    CLC                                                                  ;A6890E;
    ADC.W #$0100                                                         ;A6890F;
    STA.W Boulder.YSpeedTableIndex,X                                     ;A68912;
    LDA.W Boulder.XSpeedTableIndex,X                                     ;A68915;
    AND.W #$FF00                                                         ;A68918;
    XBA                                                                  ;A6891B;
    ASL                                                                  ;A6891C;
    ASL                                                                  ;A6891D;
    ASL                                                                  ;A6891E;
    TAY                                                                  ;A6891F;
    LDA.W Boulder.direction,X                                            ;A68920;
    BEQ ..right                                                          ;A68923;
    INY                                                                  ;A68925;
    INY                                                                  ;A68926;
    INY                                                                  ;A68927;
    INY                                                                  ;A68928;

  ..right:
    JSR.W MoveBoulderHorizontally                                        ;A68929;
    LDA.W Boulder.XSpeedTableIndex,X                                     ;A6892C;
    CLC                                                                  ;A6892F;
    ADC.W #$0020                                                         ;A68930;
    STA.W Boulder.XSpeedTableIndex,X                                     ;A68933;
    CMP.W #$5000                                                         ;A68936;
    BMI .return                                                          ;A68939;
    LDA.W #$5000                                                         ;A6893B;
    STA.W Boulder.XSpeedTableIndex,X                                     ;A6893E;

  .return:
    RTS                                                                  ;A68941;


;;; $8942: Boulder function - rolling ;;;
Function_Boulder_Rolling:
    LDX.W EnemyIndex                                                     ;A68942;
    LDA.W Boulder.XSpeedTableIndex,X                                     ;A68945;
    AND.W #$FF00                                                         ;A68948;
    XBA                                                                  ;A6894B;
    ASL                                                                  ;A6894C;
    ASL                                                                  ;A6894D;
    ASL                                                                  ;A6894E;
    TAY                                                                  ;A6894F;
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing,Y                    ;A68950;
    STA.B DP_Temp12                                                      ;A68953;
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+2,Y                  ;A68955;
    CLC                                                                  ;A68958;
    ADC.L Boulder.minimumDistanceFromGround,X                            ;A68959;
    STA.B DP_Temp14                                                      ;A6895D;
    PHY                                                                  ;A6895F;
    JSL.L MoveEnemyDownBy_14_12                                          ;A68960;
    PLY                                                                  ;A68964;
    LDA.W Enemy.YPosition,X                                              ;A68965;
    SEC                                                                  ;A68968;
    SBC.L Boulder.minimumDistanceFromGround,X                            ;A68969;
    STA.W Enemy.YPosition,X                                              ;A6896D;
    LDA.W Boulder.direction,X                                            ;A68970;
    BEQ .right                                                           ;A68973;
    INY                                                                  ;A68975;
    INY                                                                  ;A68976;
    INY                                                                  ;A68977;
    INY                                                                  ;A68978;

  .right:
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing,Y                    ;A68979;
    STA.B DP_Temp12                                                      ;A6897C;
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+2,Y                  ;A6897E;
    STA.B DP_Temp14                                                      ;A68981;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A68983;
    BCC .notCollidedWithWall                                             ;A68987;
    LDA.W Enemy.properties,X                                             ;A68989;
    ORA.W #$0100                                                         ;A6898C;
    ORA.W #$0200                                                         ;A6898F;
    STA.W Enemy.properties,X                                             ;A68992;
    LDA.W #Function_Boulder_LoadEnemyIndex                               ;A68995;
    STA.W Boulder.function,X                                             ;A68998;
    LDA.W #$0042                                                         ;A6899B;
    JSL.L QueueSound_Lib2_Max6                                           ;A6899E;
    LDA.W Enemy.XPosition,X                                              ;A689A2;
    STA.B DP_Temp12                                                      ;A689A5;
    LDA.W Enemy.YPosition,X                                              ;A689A7;
    STA.B DP_Temp14                                                      ;A689AA;
    LDA.W #$0011                                                         ;A689AC;
    LDY.W #EnemyProjectile_MiscDust                                      ;A689AF;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A689B2;
    LDA.W #$0043                                                         ;A689B6;
    JSL.L QueueSound_Lib2_Max6                                           ;A689B9;
    BRA .return                                                          ;A689BD;

  .notCollidedWithWall:
    LDA.W Boulder.XSpeedTableIndex,X                                     ;A689BF;
    CLC                                                                  ;A689C2;
    ADC.W #$0040                                                         ;A689C3;
    STA.W Boulder.XSpeedTableIndex,X                                     ;A689C6;
    CMP.W #$4000                                                         ;A689C9;
    BMI +                                                                ;A689CC;
    LDA.W #$4000                                                         ;A689CE;
    STA.W Boulder.XSpeedTableIndex,X                                     ;A689D1;

+   LDA.W Enemy.YPosition,X                                              ;A689D4;
    CMP.L Boulder.previousEnemyYPosition,X                               ;A689D7;
    BNE .return                                                          ;A689DB;
    LDA.W Enemy.YSubPosition,X                                           ;A689DD;
    CMP.L Boulder.previousEnemyYSubPosition,X                            ;A689E0;
    BNE .return                                                          ;A689E4;
    LDA.W #$0000                                                         ;A689E6;
    STA.L Boulder.minimumDistanceFromGround,X                            ;A689E9;

  .return:
    LDA.W Enemy.YPosition,X                                              ;A689ED;
    STA.L Boulder.previousEnemyYPosition,X                               ;A689F0;
    LDA.W Enemy.YSubPosition,X                                           ;A689F4;
    STA.L Boulder.previousEnemyYSubPosition,X                            ;A689F7;
    RTS                                                                  ;A689FB;


;;; $89FC: RTS ;;;
Function_Boulder_LoadEnemyIndex:
    LDX.W EnemyIndex                                                     ;A689FC;
    RTS                                                                  ;A689FF;


;;; $8A00: Move boulder horizontally ;;;
MoveBoulderHorizontally:
;; Parameters:
;;     Y: Quadratic speed table index
    LDX.W EnemyIndex                                                     ;A68A00;
    LDA.W Enemy.XSubPosition,X                                           ;A68A03;
    CLC                                                                  ;A68A06;
    ADC.W CommonEnemySpeeds_QuadraticallyIncreasing,Y                    ;A68A07;
    BCC +                                                                ;A68A0A;
    INC.W Enemy.XPosition,X                                              ;A68A0C;

+   STA.W Enemy.XSubPosition,X                                           ;A68A0F;
    LDA.W Enemy.XPosition,X                                              ;A68A12;
    CLC                                                                  ;A68A15;
    ADC.W CommonEnemySpeeds_QuadraticallyIncreasing+2,Y                  ;A68A16;
    STA.W Enemy.XPosition,X                                              ;A68A19;
    RTS                                                                  ;A68A1C;


if !FEATURE_KEEP_UNREFERENCED
;;; $8A1D: Unused. Move boulder horizontally with linear speed table ;;;
UNUSED_MoveBoulderHorizontallyWithLinearSpeedTable_A68A1D:
;; Parameters:
;;     Y: Linear speed table index
    LDX.W EnemyIndex                                                     ;A68A1D;
    LDA.W Enemy.XSubPosition,X                                           ;A68A20;
    CLC                                                                  ;A68A23;
    ADC.W CommonEnemySpeeds_LinearlyIncreasing+2,Y                       ;A68A24;
    BCC +                                                                ;A68A27;
    INC.W Enemy.XPosition,X                                              ;A68A29;

+   STA.W Enemy.XSubPosition,X                                           ;A68A2C;
    LDA.W Enemy.XPosition,X                                              ;A68A2F;
    CLC                                                                  ;A68A32;
    ADC.W CommonEnemySpeeds_LinearlyIncreasing,Y                         ;A68A33;
    STA.W Enemy.XPosition,X                                              ;A68A36;
    RTS                                                                  ;A68A39;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8A3A: Move boulder vertically ;;;
MoveBoulderVertically:
;; Parameters:
;;     Y: Quadratic speed table index
    LDX.W EnemyIndex                                                     ;A68A3A;
    LDA.W Enemy.YSubPosition,X                                           ;A68A3D;
    CLC                                                                  ;A68A40;
    ADC.W CommonEnemySpeeds_QuadraticallyIncreasing,Y                    ;A68A41;
    BCC +                                                                ;A68A44;
    INC.W Enemy.YPosition,X                                              ;A68A46;

+   STA.W Enemy.YSubPosition,X                                           ;A68A49;
    LDA.W Enemy.YPosition,X                                              ;A68A4C;
    CLC                                                                  ;A68A4F;
    ADC.W CommonEnemySpeeds_QuadraticallyIncreasing+2,Y                  ;A68A50;
    STA.W Enemy.YPosition,X                                              ;A68A53;
    RTS                                                                  ;A68A56;


;;; $8A57: RTL ;;;
RTL_A68A57:
    RTL                                                                  ;A68A57;


;;; $8A58: RTL ;;;
RTL_A68A58:
    RTL                                                                  ;A68A58;


;;; $8A59: Boulder spritemaps ;;;
Spritemap_Boulder_0:
    dw $0004                                                             ;A68A59;
    %spritemapEntry(1, $00, $00, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $00, $F0, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $100)

Spritemap_Boulder_1:
    dw $0004                                                             ;A68A6F;
    %spritemapEntry(1, $00, $00, 0, 0, 2, 0, $162)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $160)
    %spritemapEntry(1, $00, $F0, 0, 0, 2, 0, $142)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $140)

Spritemap_Boulder_2:
    dw $0004                                                             ;A68A85;
    %spritemapEntry(1, $00, $00, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $00, $F0, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $104)

Spritemap_Boulder_3:
    dw $0004                                                             ;A68A9B;
    %spritemapEntry(1, $00, $00, 0, 0, 2, 0, $166)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $164)
    %spritemapEntry(1, $00, $F0, 0, 0, 2, 0, $146)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $144)

Spritemap_Boulder_4:
    dw $0004                                                             ;A68AB1;
    %spritemapEntry(1, $00, $00, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $00, $F0, 0, 0, 2, 0, $10A)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $108)

Spritemap_Boulder_5:
    dw $0004                                                             ;A68AC7;
    %spritemapEntry(1, $00, $00, 0, 0, 2, 0, $16A)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $168)
    %spritemapEntry(1, $00, $F0, 0, 0, 2, 0, $14A)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $148)

Spritemap_Boulder_6:
    dw $0004                                                             ;A68ADD;
    %spritemapEntry(1, $00, $00, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $12C)
    %spritemapEntry(1, $00, $F0, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $10C)

Spritemap_Boulder_7:
    dw $0004                                                             ;A68AF3;
    %spritemapEntry(1, $00, $00, 0, 0, 2, 0, $16E)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $16C)
    %spritemapEntry(1, $00, $F0, 0, 0, 2, 0, $14E)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $14C)


;;; $8B09: Palette - enemy $DFFF/$E03F (spike platform) ;;;
Palette_Kzan:
    dw $3800,$62BA,$49F3,$2D4D,$0C44,$49F3,$356E,$20C9                   ;A68B09;
    dw $1486,$241F,$1C17,$142F,$0C47,$0000,$0000,$0000                   ;A68B19;


;;; $8B29: Instruction list - spike platform ;;;
InstList_Kzan:
    dw $0001,Spritemap_Kzan                                              ;A68B29;
    dw Instruction_Common_Sleep                                          ;A68B2D;


;;; $8B2F: Initialisation AI - enemy $DFFF (spike platform top) ;;;
InitAI_KzanTop:
    LDX.W EnemyIndex                                                     ;A68B2F;
    LDA.W #InstList_Kzan                                                 ;A68B32;
    STA.W Enemy.instList,X                                               ;A68B35;
    LDA.W #Function_Kzan_WaitingToFall                                   ;A68B38;
    STA.W Kzan.function,X                                                ;A68B3B;
    LDA.W Enemy.init0,X                                                  ;A68B3E;
    AND.W #$00FF                                                         ;A68B41;
    ASL                                                                  ;A68B44;
    ASL                                                                  ;A68B45;
    ASL                                                                  ;A68B46;
    STA.L Kzan.fallingYSpeedTableIndex,X                                 ;A68B47;
    TAX                                                                  ;A68B4B;
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,X                         ;A68B4C;
    STA.B DP_Temp12                                                      ;A68B4F;
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,X                       ;A68B51;
    STA.B DP_Temp14                                                      ;A68B54;
    LDX.W EnemyIndex                                                     ;A68B56;
    LDA.B DP_Temp14                                                      ;A68B59;
    STA.W Kzan.initialFallingYSubSpeed,X                                 ;A68B5B;
    LDA.B DP_Temp12                                                      ;A68B5E;
    STA.W Kzan.initialFallingYSpeed,X                                    ;A68B60;
    LDA.W Enemy.init1,X                                                  ;A68B63;
    AND.W #$FF00                                                         ;A68B66;
    XBA                                                                  ;A68B69;
    CLC                                                                  ;A68B6A;
    ADC.W Enemy.YPosition,X                                              ;A68B6B;
    STA.W Kzan.fallingTargetYPosition,X                                  ;A68B6E;
    LDA.W Enemy.YPosition,X                                              ;A68B71;
    STA.W Kzan.risingTargetYPosition,X                                   ;A68B74;
    LDA.W Enemy.init1,X                                                  ;A68B77;
    AND.W #$00FF                                                         ;A68B7A;
    STA.L Kzan.fallWaitTimerResetValue,X                                 ;A68B7D;
    STA.W Kzan.fallWaitTimer,X                                           ;A68B81;
    RTL                                                                  ;A68B84;


;;; $8B85: Initialisation AI - enemy $E03F (spike platform bottom) ;;;
InitAI_KzanBottom:
    LDX.W EnemyIndex                                                     ;A68B85;
    LDA.W Enemy[-1].XPosition,X                                          ;A68B88;
    STA.W Enemy.XPosition,X                                              ;A68B8B;
    LDA.W Enemy[-1].YPosition,X                                          ;A68B8E;
    CLC                                                                  ;A68B91;
    ADC.W #$000C                                                         ;A68B92;
    STA.W Enemy.YPosition,X                                              ;A68B95;
    RTL                                                                  ;A68B98;


;;; $8B99: Main AI - enemy $E03F (spike platform bottom) ;;;
MainAI_KzanBottom:
    LDX.W EnemyIndex                                                     ;A68B99; Same as init AI
    LDA.W Enemy[-1].XPosition,X                                          ;A68B9C;
    STA.W Enemy.XPosition,X                                              ;A68B9F;
    LDA.W Enemy[-1].YPosition,X                                          ;A68BA2;
    CLC                                                                  ;A68BA5;
    ADC.W #$000C                                                         ;A68BA6;
    STA.W Enemy.YPosition,X                                              ;A68BA9;
    RTL                                                                  ;A68BAC;


;;; $8BAD: Main AI - enemy $DFFF (spike platform top) ;;;
MainAI_KzanTop:
    LDX.W EnemyIndex                                                     ;A68BAD;
    JSR.W (Kzan.function,X)                                              ;A68BB0;
    RTL                                                                  ;A68BB3;


;;; $8BB4: Spike platform function - waiting to fall ;;;
Function_Kzan_WaitingToFall:
    PHX                                                                  ;A68BB4;
    LDX.W EnemyIndex                                                     ;A68BB5;
    DEC.W Kzan.fallWaitTimer,X                                           ;A68BB8;
    LDA.W Kzan.fallWaitTimer,X                                           ;A68BBB;
    BNE .return                                                          ;A68BBE;
    LDA.L Kzan.fallWaitTimerResetValue,X                                 ;A68BC0;
    STA.W Kzan.fallWaitTimer,X                                           ;A68BC4;
    LDA.W Enemy.init0,X                                                  ;A68BC7;
    AND.W #$00FF                                                         ;A68BCA;
    ASL                                                                  ;A68BCD;
    ASL                                                                  ;A68BCE;
    ASL                                                                  ;A68BCF;
    STA.L Kzan.fallingYSpeedTableIndex,X                                 ;A68BD0;
    LDA.W #Function_Kzan_Falling                                         ;A68BD4;
    STA.W Kzan.function,X                                                ;A68BD7;

  .return:
    PLX                                                                  ;A68BDA;
    RTS                                                                  ;A68BDB;


;;; $8BDC: Spike platform function - falling ;;;
Function_Kzan_Falling:
    PHX                                                                  ;A68BDC;
    LDX.W EnemyIndex                                                     ;A68BDD;
    LDA.W Enemy.YPosition,X                                              ;A68BE0;
    STA.L Kzan.previousYPosition,X                                       ;A68BE3;
    LDA.L Kzan.fallingYSpeedTableIndex,X                                 ;A68BE7;
    TAX                                                                  ;A68BEB;
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,X                         ;A68BEC;
    STA.B DP_Temp14                                                      ;A68BEF;
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,X                       ;A68BF1;
    STA.B DP_Temp12                                                      ;A68BF4;
    LDX.W EnemyIndex                                                     ;A68BF6;
    JSL.L MoveEnemyY_plus_12_14                                          ;A68BF9;
    LDA.W Enemy.YPosition,X                                              ;A68BFD;
    CMP.W Kzan.fallingTargetYPosition,X                                  ;A68C00;
    BMI .notReachedTarget                                                ;A68C03;
    LDA.W #$0040                                                         ;A68C05;
    STA.L Kzan.riseWaitTimer,X                                           ;A68C08;
    LDA.W #Function_Kzan_WaitingToRise                                   ;A68C0C;
    STA.W Kzan.function,X                                                ;A68C0F;
    LDA.W Kzan.fallingTargetYPosition,X                                  ;A68C12;
    STA.W Enemy.YPosition,X                                              ;A68C15;
    LDA.W #$001B                                                         ;A68C18;
    JSL.L QueueSound_Lib2_Max6                                           ;A68C1B;

  .notReachedTarget:
    JSL.L CheckIfKzanIsTouchingSamusFromBelow                            ;A68C1F;
    BEQ .notTouchingSamusFromBelow                                       ;A68C23;
    LDA.W Enemy.YPosition,X                                              ;A68C25;
    SEC                                                                  ;A68C28;
    SBC.L Kzan.previousYPosition,X                                       ;A68C29;
    CLC                                                                  ;A68C2D;
    ADC.W ExtraSamusYDisplacement                                        ;A68C2E;
    STA.W ExtraSamusYDisplacement                                        ;A68C31;

  .notTouchingSamusFromBelow:
    LDA.L Kzan.fallingYSpeedTableIndex,X                                 ;A68C34;
    CLC                                                                  ;A68C38;
    ADC.W #$0008                                                         ;A68C39;
    CMP.W #$0200                                                         ;A68C3C;
    BMI +                                                                ;A68C3F;
    LDA.W #$0200                                                         ;A68C41;

+   STA.L Kzan.fallingYSpeedTableIndex,X                                 ;A68C44;
    PLX                                                                  ;A68C48;
    RTS                                                                  ;A68C49;


;;; $8C4A: Spike platform function - waiting to rise ;;;
Function_Kzan_WaitingToRise:
    LDA.L Kzan.riseWaitTimer,X                                           ;A68C4A;
    DEC                                                                  ;A68C4E;
    STA.L Kzan.riseWaitTimer,X                                           ;A68C4F;
    BEQ .timerExpired                                                    ;A68C53;
    RTS                                                                  ;A68C55;

  .timerExpired:
    LDA.W #Function_Kzan_Rising                                          ;A68C56;
    STA.W Kzan.function,X                                                ;A68C59;
    RTS                                                                  ;A68C5C;


;;; $8C5D: Spike platform function - rising ;;;
Function_Kzan_Rising:
    PHX                                                                  ;A68C5D;
    LDX.W EnemyIndex                                                     ;A68C5E;
    LDA.W Enemy.YPosition,X                                              ;A68C61;
    STA.L Kzan.previousYPosition,X                                       ;A68C64;
    LDA.W #$8000                                                         ;A68C68;
    STA.B DP_Temp12                                                      ;A68C6B;
    LDA.W #$0000                                                         ;A68C6D;
    STA.B DP_Temp14                                                      ;A68C70;
    JSL.L MoveEnemyY_minus_12_14                                         ;A68C72;
    LDA.W Enemy.YPosition,X                                              ;A68C76;
    CMP.W Kzan.risingTargetYPosition,X                                   ;A68C79;
    BPL .notReachedTarget                                                ;A68C7C;
    LDA.W #Function_Kzan_WaitingToFall                                   ;A68C7E;
    STA.W Kzan.function,X                                                ;A68C81;
    LDA.W Kzan.risingTargetYPosition,X                                   ;A68C84;
    STA.W Enemy.YPosition,X                                              ;A68C87;

  .notReachedTarget:
    JSL.L CheckIfKzanIsTouchingSamusFromBelow                            ;A68C8A;
    BEQ .notTouchingSamusFromBelow                                       ;A68C8E;
    LDA.W Enemy.YPosition,X                                              ;A68C90;
    SEC                                                                  ;A68C93;
    SBC.L Kzan.previousYPosition,X                                       ;A68C94;
    CLC                                                                  ;A68C98;
    ADC.W ExtraSamusYDisplacement                                        ;A68C99;
    STA.W ExtraSamusYDisplacement                                        ;A68C9C;

  .notTouchingSamusFromBelow:
    PLX                                                                  ;A68C9F;
    RTS                                                                  ;A68CA0;


;;; $8CA1: Check if spike platform is touching Samus from below ;;;
CheckIfKzanIsTouchingSamusFromBelow:
;; Returns:
;;     Zero: clear if touching Samus, otherwise set

; This is a copy+paste of $A0:ABE7 with the Y delta threshold changed from 3 to 5
    LDA.W SamusXPosition                                                 ;A68CA1;
    SEC                                                                  ;A68CA4;
    SBC.W Enemy.XPosition,X                                              ;A68CA5;
    BPL +                                                                ;A68CA8;
    EOR.W #$FFFF                                                         ;A68CAA;
    INC                                                                  ;A68CAD;

+   SEC                                                                  ;A68CAE;
    SBC.W SamusXRadius                                                   ;A68CAF;
    BCC .YPosition                                                       ;A68CB2;
    CMP.W Enemy.XHitboxRadius,X                                          ;A68CB4;
    BCC .YPosition                                                       ;A68CB7;
    LDA.W #$0000                                                         ;A68CB9;
    RTL                                                                  ;A68CBC;

  .YPosition:
    LDA.W SamusYPosition                                                 ;A68CBD;
    CLC                                                                  ;A68CC0;
    ADC.W #$0005                                                         ;A68CC1;
    SEC                                                                  ;A68CC4;
    SBC.W Enemy.YPosition,X                                              ;A68CC5;
    BPL .returnNotTouchingSamus                                          ;A68CC8;
    EOR.W #$FFFF                                                         ;A68CCA;
    INC                                                                  ;A68CCD;
    SEC                                                                  ;A68CCE;
    SBC.W SamusYRadius                                                   ;A68CCF;
    BCC .returnTouchingSamus                                             ;A68CD2;
    CMP.W Enemy.YHitboxRadius,X                                          ;A68CD4;
    BEQ .returnTouchingSamus                                             ;A68CD7;
    BCC .returnTouchingSamus                                             ;A68CD9;

  .returnNotTouchingSamus:
    LDA.W #$0000                                                         ;A68CDB;
    RTL                                                                  ;A68CDE;

  .returnTouchingSamus:
    LDA.W #$FFFF                                                         ;A68CDF;
    RTL                                                                  ;A68CE2;


;;; $8CE3: RTL ;;;
RTL_A68CE3:
    RTL                                                                  ;A68CE3;


;;; $8CE4: RTL ;;;
RTL_A68CE4:
    RTL                                                                  ;A68CE4;


;;; $8CE5: Spike platform spritemap ;;;
Spritemap_Kzan:
    dw $0004                                                             ;A68CE5;
    %spritemapEntry(1, $00, $04, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1F0, $04, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $00, $F4, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F0, $F4, 0, 0, 2, 0, $100)


;;; $8CFB: Palette - enemy $E07F (fire pillar) ;;;
Palette_Hibashi:
    dw $3800,$3E7F,$2DFD,$10FB,$0097,$73FF,$53FF,$37FF                   ;A68CFB;
    dw $17FF,$24DF,$189B,$1076,$0C50,$084B,$5EFF,$0880                   ;A68D0B;


;;; $8D1B: Instruction list - graphics part ;;;
InstList_Hibashi_GraphicsPart:
    dw Instruction_Hibashi_PlaySFX                                       ;A68D1B;
    dw $0002,Spritemap_Hibashi_0                                         ;A68D1D;
    dw Instruction_Hibashi_ActivityFrame0                                ;A68D21;
    dw $0002,Spritemap_Hibashi_1                                         ;A68D23;
    dw Instruction_Hibashi_ActivityFrame1                                ;A68D27;
    dw $0002,Spritemap_Hibashi_2                                         ;A68D29;
    dw Instruction_Hibashi_ActivityFrame2                                ;A68D2D;
    dw $0002,Spritemap_Hibashi_3                                         ;A68D2F;
    dw Instruction_Hibashi_ActivityFrame3                                ;A68D33;
    dw $0001,Spritemap_Hibashi_4                                         ;A68D35;
    dw Instruction_Hibashi_ActivityFrame4                                ;A68D39;
    dw $0001,Spritemap_Hibashi_5                                         ;A68D3B;
    dw Instruction_Hibashi_ActivityFrame5                                ;A68D3F;
    dw $0001,Spritemap_Hibashi_6                                         ;A68D41;
    dw Instruction_Hibashi_ActivityFrame6                                ;A68D45;
    dw $0001,Spritemap_Hibashi_7                                         ;A68D47;
    dw Instruction_Hibashi_ActivityFrame7                                ;A68D4B;
    dw $0002,Spritemap_Hibashi_8                                         ;A68D4D;
    dw Instruction_Hibashi_ActivityFrame8                                ;A68D51;
    dw $0002,Spritemap_Hibashi_9                                         ;A68D53;
    dw Instruction_Hibashi_ActivityFrame9                                ;A68D57;
    dw $0002,Spritemap_Hibashi_A                                         ;A68D59;
    dw Instruction_Hibashi_ActivityFrameA                                ;A68D5D;
    dw $0002,Spritemap_Hibashi_B                                         ;A68D5F;
    dw Instruction_Hibashi_ActivityFrameB                                ;A68D63;
    dw $0002,Spritemap_Hibashi_C                                         ;A68D65;
    dw Instruction_Hibashi_ActivityFrameC                                ;A68D69;
    dw $0002,Spritemap_Hibashi_D                                         ;A68D6B;
    dw Instruction_Hibashi_ActivityFrameD                                ;A68D6F;
    dw $0002,Spritemap_Hibashi_E                                         ;A68D71;
    dw Instruction_Hibashi_ActivityFrameE                                ;A68D75;
    dw $0002,Spritemap_Hibashi_F                                         ;A68D77;
    dw Instruction_Hibashi_ActivityFrameF                                ;A68D7B;
    dw $0004,Spritemap_Hibashi_10                                        ;A68D7D;
    dw Instruction_Hibashi_ActivityFrame10                               ;A68D81;
    dw $0004,Spritemap_Hibashi_11                                        ;A68D83;
    dw Instruction_Hibashi_ActivityFrame11                               ;A68D87;
    dw $0004,Spritemap_Hibashi_12                                        ;A68D89;
    dw Instruction_Hibashi_ActivityFrame12                               ;A68D8D;
    dw $0004,Spritemap_Hibashi_13                                        ;A68D8F;
    dw Instruction_Hibashi_ActivityFrame13                               ;A68D93;
    dw $0004,Spritemap_Hibashi_14                                        ;A68D95;
    dw Instruction_Hibashi_ActivityFrame14                               ;A68D99;
    dw $0004,Spritemap_Hibashi_15                                        ;A68D9B;
    dw Instruction_Hibashi_ActivityFrame15                               ;A68D9F;
    dw $0004,Spritemap_Hibashi_16                                        ;A68DA1;
    dw Instruction_Hibashi_FinishActivity                                ;A68DA5;
    dw Instruction_Common_Sleep                                          ;A68DA7;


;;; $8DA9: Instruction list - hitbox part ;;;
InstList_Hibashi_HitboxPart:
    dw $0002,Spritemap_Hibashi_0                                         ;A68DA9;
    dw Instruction_Common_Sleep                                          ;A68DAD;


;;; $8DAF: Instruction - queue fire pillar sound effect ;;;
Instruction_Hibashi_PlaySFX:
    PHX                                                                  ;A68DAF;
    PHY                                                                  ;A68DB0;
    LDA.W #$0061                                                         ;A68DB1;
    JSL.L QueueSound_Lib2_Max6                                           ;A68DB4;
    PLY                                                                  ;A68DB8;
    PLX                                                                  ;A68DB9;
    RTL                                                                  ;A68DBA;


;;; $8DBB: Y offsets ;;;
Hibashi_YOffset_0:
    dw $0005                                                             ;A68DBB;
Hibashi_YOffset_1:
    dw $000A                                                             ;A68DBD;
Hibashi_YOffset_2:
    dw $000F                                                             ;A68DBF;
Hibashi_YOffset_3:
    dw $0014                                                             ;A68DC1;
Hibashi_YOffset_4:
    dw $0019                                                             ;A68DC3;
Hibashi_YOffset_5:
    dw $001E                                                             ;A68DC5;
Hibashi_YOffset_6:
    dw $0023                                                             ;A68DC7;
Hibashi_YOffset_7:
    dw $0028                                                             ;A68DC9;
Hibashi_YOffset_8:
    dw $002D                                                             ;A68DCB;
Hibashi_YOffset_9:
    dw $0032                                                             ;A68DCD;
Hibashi_YOffset_A:
    dw $0037                                                             ;A68DCF;
Hibashi_YOffset_B:
    dw $003C                                                             ;A68DD1;
Hibashi_YOffset_C:
    dw $0041                                                             ;A68DD3;
Hibashi_YOffset_D:
    dw $0046                                                             ;A68DD5;
Hibashi_YOffset_E:
    dw $004B                                                             ;A68DD7;
Hibashi_YOffset_F:
    dw $0050                                                             ;A68DD9;
Hibashi_YOffset_10:
    dw $0055                                                             ;A68DDB;
Hibashi_YOffset_11:
    dw $005A                                                             ;A68DDD;
Hibashi_YOffset_12:
    dw $005F                                                             ;A68DDF;
Hibashi_YOffset_13:
    dw $0064                                                             ;A68DE1;
Hibashi_YOffset_14:
    dw $0069                                                             ;A68DE3;
Hibashi_YOffset_15:
    dw $006E                                                             ;A68DE5;


;;; $8DE7: Y radii ;;;
Hibashi_XOffset_0:
    dw $0018                                                             ;A68DE7;
Hibashi_XOffset_1:
    dw $0018                                                             ;A68DE9;
Hibashi_XOffset_2:
    dw $0018                                                             ;A68DEB;
Hibashi_XOffset_3:
    dw $0018                                                             ;A68DED;
Hibashi_XOffset_4:
    dw $0018                                                             ;A68DEF;
Hibashi_XOffset_5:
    dw $0018                                                             ;A68DF1;
Hibashi_XOffset_6:
    dw $0018                                                             ;A68DF3;
Hibashi_XOffset_7:
    dw $0018                                                             ;A68DF5;
Hibashi_XOffset_8:
    dw $0018                                                             ;A68DF7;
Hibashi_XOffset_9:
    dw $0018                                                             ;A68DF9;
Hibashi_XOffset_A:
    dw $0018                                                             ;A68DFB;
Hibashi_XOffset_B:
    dw $0018                                                             ;A68DFD;
Hibashi_XOffset_C:
    dw $0018                                                             ;A68DFF;
Hibashi_XOffset_D:
    dw $0018                                                             ;A68E01;
Hibashi_XOffset_E:
    dw $0018                                                             ;A68E03;
Hibashi_XOffset_F:
    dw $0018                                                             ;A68E05;
Hibashi_XOffset_10:
    dw $0018                                                             ;A68E07;
Hibashi_XOffset_11:
    dw $0018                                                             ;A68E09;
Hibashi_XOffset_12:
    dw $0014                                                             ;A68E0B;
Hibashi_XOffset_13:
    dw $0010                                                             ;A68E0D;
Hibashi_XOffset_14:
    dw $000C                                                             ;A68E0F;
Hibashi_XOffset_15:
    dw $0008                                                             ;A68E11;


;;; $8E13: Instruction - activity frame 0 ;;;
Instruction_Hibashi_ActivityFrame0:
    LDX.W EnemyIndex                                                     ;A68E13;
    LDA.W Hibashi.spawnYPosition,X                                       ;A68E16;
    SEC                                                                  ;A68E19;
    SBC.W Hibashi_YOffset_0                                              ;A68E1A;
    STA.W Enemy[1].YPosition,X                                           ;A68E1D;
    LDA.W Hibashi_XOffset_0                                              ;A68E20;
    STA.W Enemy[1].YHitboxRadius,X                                       ;A68E23;
    LDA.W #$0008                                                         ;A68E26;
    STA.W Enemy[1].XHitboxRadius,X                                       ;A68E29;
    RTL                                                                  ;A68E2C;


;;; $8E2D: Instruction - activity frame 1 ;;;
Instruction_Hibashi_ActivityFrame1:
    LDX.W EnemyIndex                                                     ;A68E2D;
    LDA.W Hibashi.spawnYPosition,X                                       ;A68E30;
    SEC                                                                  ;A68E33;
    SBC.W Hibashi_YOffset_1                                              ;A68E34;
    STA.W Enemy[1].YPosition,X                                           ;A68E37;
    LDA.W Hibashi_XOffset_1                                              ;A68E3A;
    STA.W Enemy[1].YHitboxRadius,X                                       ;A68E3D;
    RTL                                                                  ;A68E40;


;;; $8E41: Instruction - activity frame 2 ;;;
Instruction_Hibashi_ActivityFrame2:
    LDX.W EnemyIndex                                                     ;A68E41;
    LDA.W Hibashi.spawnYPosition,X                                       ;A68E44;
    SEC                                                                  ;A68E47;
    SBC.W Hibashi_YOffset_2                                              ;A68E48;
    STA.W Enemy[1].YPosition,X                                           ;A68E4B;
    LDA.W Hibashi_XOffset_2                                              ;A68E4E;
    STA.W Enemy[1].YHitboxRadius,X                                       ;A68E51;
    RTL                                                                  ;A68E54;


;;; $8E55: Instruction - activity frame 3 ;;;
Instruction_Hibashi_ActivityFrame3:
    LDX.W EnemyIndex                                                     ;A68E55;
    LDA.W Hibashi.spawnYPosition,X                                       ;A68E58;
    SEC                                                                  ;A68E5B;
    SBC.W Hibashi_YOffset_3                                              ;A68E5C;
    STA.W Enemy[1].YPosition,X                                           ;A68E5F;
    LDA.W Hibashi_XOffset_3                                              ;A68E62;
    STA.W Enemy[1].YHitboxRadius,X                                       ;A68E65;
    RTL                                                                  ;A68E68;


;;; $8E69: Instruction - activity frame 4 ;;;
Instruction_Hibashi_ActivityFrame4:
    LDX.W EnemyIndex                                                     ;A68E69;
    LDA.W Hibashi.spawnYPosition,X                                       ;A68E6C;
    SEC                                                                  ;A68E6F;
    SBC.W Hibashi_YOffset_4                                              ;A68E70;
    STA.W Enemy[1].YPosition,X                                           ;A68E73;
    LDA.W Hibashi_XOffset_4                                              ;A68E76;
    STA.W Enemy[1].YHitboxRadius,X                                       ;A68E79;
    RTL                                                                  ;A68E7C;


;;; $8E7D: Instruction - activity frame 5 ;;;
Instruction_Hibashi_ActivityFrame5:
    LDX.W EnemyIndex                                                     ;A68E7D;
    LDA.W Hibashi.spawnYPosition,X                                       ;A68E80;
    SEC                                                                  ;A68E83;
    SBC.W Hibashi_YOffset_5                                              ;A68E84;
    STA.W Enemy[1].YPosition,X                                           ;A68E87;
    LDA.W Hibashi_XOffset_5                                              ;A68E8A;
    STA.W Enemy[1].YHitboxRadius,X                                       ;A68E8D;
    RTL                                                                  ;A68E90;


;;; $8E91: Instruction - activity frame 6 ;;;
Instruction_Hibashi_ActivityFrame6:
    LDX.W EnemyIndex                                                     ;A68E91;
    LDA.W Hibashi.spawnYPosition,X                                       ;A68E94;
    SEC                                                                  ;A68E97;
    SBC.W Hibashi_YOffset_6                                              ;A68E98;
    STA.W Enemy[1].YPosition,X                                           ;A68E9B;
    LDA.W Hibashi_XOffset_6                                              ;A68E9E;
    STA.W Enemy[1].YHitboxRadius,X                                       ;A68EA1;
    RTL                                                                  ;A68EA4;


;;; $8EA5: Instruction - activity frame 7 ;;;
Instruction_Hibashi_ActivityFrame7:
    LDX.W EnemyIndex                                                     ;A68EA5;
    LDA.W Hibashi.spawnYPosition,X                                       ;A68EA8;
    SEC                                                                  ;A68EAB;
    SBC.W Hibashi_YOffset_7                                              ;A68EAC;
    STA.W Enemy[1].YPosition,X                                           ;A68EAF;
    LDA.W Hibashi_XOffset_7                                              ;A68EB2;
    STA.W Enemy[1].YHitboxRadius,X                                       ;A68EB5;
    RTL                                                                  ;A68EB8;


;;; $8EB9: Instruction - activity frame 8 ;;;
Instruction_Hibashi_ActivityFrame8:
    LDX.W EnemyIndex                                                     ;A68EB9;
    LDA.W Hibashi.spawnYPosition,X                                       ;A68EBC;
    SEC                                                                  ;A68EBF;
    SBC.W Hibashi_YOffset_8                                              ;A68EC0;
    STA.W Enemy[1].YPosition,X                                           ;A68EC3;
    LDA.W Hibashi_XOffset_8                                              ;A68EC6;
    STA.W Enemy[1].YHitboxRadius,X                                       ;A68EC9;
    RTL                                                                  ;A68ECC;


;;; $8ECD: Instruction - activity frame 9 ;;;
Instruction_Hibashi_ActivityFrame9:
    LDX.W EnemyIndex                                                     ;A68ECD;
    LDA.W Hibashi.spawnYPosition,X                                       ;A68ED0;
    SEC                                                                  ;A68ED3;
    SBC.W Hibashi_YOffset_9                                              ;A68ED4;
    STA.W Enemy[1].YPosition,X                                           ;A68ED7;
    LDA.W Hibashi_XOffset_9                                              ;A68EDA;
    STA.W Enemy[1].YHitboxRadius,X                                       ;A68EDD;
    RTL                                                                  ;A68EE0;


;;; $8EE1: Instruction - activity frame Ah ;;;
Instruction_Hibashi_ActivityFrameA:
    LDX.W EnemyIndex                                                     ;A68EE1;
    LDA.W Hibashi.spawnYPosition,X                                       ;A68EE4;
    SEC                                                                  ;A68EE7;
    SBC.W Hibashi_YOffset_A                                              ;A68EE8;
    STA.W Enemy[1].YPosition,X                                           ;A68EEB;
    LDA.W Hibashi_XOffset_A                                              ;A68EEE;
    STA.W Enemy[1].YHitboxRadius,X                                       ;A68EF1;
    RTL                                                                  ;A68EF4;


;;; $8EF5: Instruction - activity frame Bh ;;;
Instruction_Hibashi_ActivityFrameB:
    LDX.W EnemyIndex                                                     ;A68EF5;
    LDA.W Hibashi.spawnYPosition,X                                       ;A68EF8;
    SEC                                                                  ;A68EFB;
    SBC.W Hibashi_YOffset_B                                              ;A68EFC;
    STA.W Enemy[1].YPosition,X                                           ;A68EFF;
    LDA.W Hibashi_XOffset_B                                              ;A68F02;
    STA.W Enemy[1].YHitboxRadius,X                                       ;A68F05;
    RTL                                                                  ;A68F08;


;;; $8F09: Instruction - activity frame Ch ;;;
Instruction_Hibashi_ActivityFrameC:
    LDX.W EnemyIndex                                                     ;A68F09;
    LDA.W Hibashi.spawnYPosition,X                                       ;A68F0C;
    SEC                                                                  ;A68F0F;
    SBC.W Hibashi_YOffset_C                                              ;A68F10;
    STA.W Enemy[1].YPosition,X                                           ;A68F13;
    LDA.W Hibashi_XOffset_C                                              ;A68F16;
    STA.W Enemy[1].YHitboxRadius,X                                       ;A68F19;
    RTL                                                                  ;A68F1C;


;;; $8F1D: Instruction - activity frame Dh ;;;
Instruction_Hibashi_ActivityFrameD:
    LDX.W EnemyIndex                                                     ;A68F1D;
    LDA.W Hibashi.spawnYPosition,X                                       ;A68F20;
    SEC                                                                  ;A68F23;
    SBC.W Hibashi_YOffset_D                                              ;A68F24;
    STA.W Enemy[1].YPosition,X                                           ;A68F27;
    LDA.W Hibashi_XOffset_D                                              ;A68F2A;
    STA.W Enemy[1].YHitboxRadius,X                                       ;A68F2D;
    RTL                                                                  ;A68F30;


;;; $8F31: Instruction - activity frame Eh ;;;
Instruction_Hibashi_ActivityFrameE:
    LDX.W EnemyIndex                                                     ;A68F31;
    LDA.W Hibashi.spawnYPosition,X                                       ;A68F34;
    SEC                                                                  ;A68F37;
    SBC.W Hibashi_YOffset_E                                              ;A68F38;
    STA.W Enemy[1].YPosition,X                                           ;A68F3B;
    LDA.W Hibashi_XOffset_E                                              ;A68F3E;
    STA.W Enemy[1].YHitboxRadius,X                                       ;A68F41;
    RTL                                                                  ;A68F44;


;;; $8F45: Instruction - activity frame Fh ;;;
Instruction_Hibashi_ActivityFrameF:
    LDX.W EnemyIndex                                                     ;A68F45;
    LDA.W Hibashi.spawnYPosition,X                                       ;A68F48;
    SEC                                                                  ;A68F4B;
    SBC.W Hibashi_YOffset_F                                              ;A68F4C;
    STA.W Enemy[1].YPosition,X                                           ;A68F4F;
    LDA.W Hibashi_XOffset_F                                              ;A68F52;
    STA.W Enemy[1].YHitboxRadius,X                                       ;A68F55;
    RTL                                                                  ;A68F58;


;;; $8F59: Instruction - activity frame 10h ;;;
Instruction_Hibashi_ActivityFrame10:
    LDX.W EnemyIndex                                                     ;A68F59;
    LDA.W Hibashi.spawnYPosition,X                                       ;A68F5C;
    SEC                                                                  ;A68F5F;
    SBC.W Hibashi_YOffset_10                                             ;A68F60;
    STA.W Enemy[1].YPosition,X                                           ;A68F63;
    LDA.W Hibashi_XOffset_10                                             ;A68F66;
    STA.W Enemy[1].YHitboxRadius,X                                       ;A68F69;
    RTL                                                                  ;A68F6C;


;;; $8F6D: Instruction - activity frame 11h ;;;
Instruction_Hibashi_ActivityFrame11:
    LDX.W EnemyIndex                                                     ;A68F6D;
    LDA.W Hibashi.spawnYPosition,X                                       ;A68F70;
    SEC                                                                  ;A68F73;
    SBC.W Hibashi_YOffset_11                                             ;A68F74;
    STA.W Enemy[1].YPosition,X                                           ;A68F77;
    LDA.W Hibashi_XOffset_11                                             ;A68F7A;
    STA.W Enemy[1].YHitboxRadius,X                                       ;A68F7D;
    RTL                                                                  ;A68F80;


;;; $8F81: Instruction - activity frame 12h ;;;
Instruction_Hibashi_ActivityFrame12:
    LDX.W EnemyIndex                                                     ;A68F81;
    LDA.W Hibashi.spawnYPosition,X                                       ;A68F84;
    SEC                                                                  ;A68F87;
    SBC.W Hibashi_YOffset_12                                             ;A68F88;
    STA.W Enemy[1].YPosition,X                                           ;A68F8B;
    LDA.W Hibashi_XOffset_12                                             ;A68F8E;
    STA.W Enemy[1].YHitboxRadius,X                                       ;A68F91;
    RTL                                                                  ;A68F94;


;;; $8F95: Instruction - activity frame 13h ;;;
Instruction_Hibashi_ActivityFrame13:
    LDX.W EnemyIndex                                                     ;A68F95;
    LDA.W Hibashi.spawnYPosition,X                                       ;A68F98;
    SEC                                                                  ;A68F9B;
    SBC.W Hibashi_YOffset_13                                             ;A68F9C;
    STA.W Enemy[1].YPosition,X                                           ;A68F9F;
    LDA.W Hibashi_XOffset_13                                             ;A68FA2;
    STA.W Enemy[1].YHitboxRadius,X                                       ;A68FA5;
    RTL                                                                  ;A68FA8;


;;; $8FA9: Instruction - activity frame 14h ;;;
Instruction_Hibashi_ActivityFrame14:
    LDX.W EnemyIndex                                                     ;A68FA9;
    LDA.W Hibashi.spawnYPosition,X                                       ;A68FAC;
    SEC                                                                  ;A68FAF;
    SBC.W Hibashi_YOffset_14                                             ;A68FB0;
    STA.W Enemy[1].YPosition,X                                           ;A68FB3;
    LDA.W Hibashi_XOffset_14                                             ;A68FB6;
    STA.W Enemy[1].YHitboxRadius,X                                       ;A68FB9;
    RTL                                                                  ;A68FBC;


;;; $8FBD: Instruction - activity frame 15h ;;;
Instruction_Hibashi_ActivityFrame15:
    LDX.W EnemyIndex                                                     ;A68FBD;
    LDA.W Hibashi.spawnYPosition,X                                       ;A68FC0;
    SEC                                                                  ;A68FC3;
    SBC.W Hibashi_YOffset_15                                             ;A68FC4;
    STA.W Enemy[1].YPosition,X                                           ;A68FC7;
    LDA.W Hibashi_XOffset_15                                             ;A68FCA;
    STA.W Enemy[1].YHitboxRadius,X                                       ;A68FCD;
    RTL                                                                  ;A68FD0;


;;; $8FD1: Instruction - finish activity ;;;
Instruction_Hibashi_FinishActivity:
    LDX.W EnemyIndex                                                     ;A68FD1;
    LDA.W #$0001                                                         ;A68FD4;
    STA.W Hibashi.finishedActivityFlag,X                                 ;A68FD7;
    LDA.W #$0000                                                         ;A68FDA;
    STA.W Enemy[1].XHitboxRadius,X                                       ;A68FDD;
    STA.W Enemy[1].YHitboxRadius,X                                       ;A68FE0;
    LDA.W Hibashi.spawnYPosition,X                                       ;A68FE3;
    STA.W Enemy.YPosition,X                                              ;A68FE6;
    LDA.W Enemy.properties,X                                             ;A68FE9;
    ORA.W #$0100                                                         ;A68FEC;
    STA.W Enemy.properties,X                                             ;A68FEF;
    LDA.W Enemy[1].properties,X                                          ;A68FF2;
    ORA.W #$0400                                                         ;A68FF5;
    STA.W Enemy[1].properties,X                                          ;A68FF8;
    RTL                                                                  ;A68FFB;


;;; $8FFC: Initialisation AI - enemy $E07F (fire pillar) ;;;
InitAI_Hibashi:
    LDX.W EnemyIndex                                                     ;A68FFC;
    LDA.W #InstList_Hibashi_HitboxPart                                   ;A68FFF;
    STA.W Enemy.instList,X                                               ;A69002;
    LDA.W Hibashi.part,X                                                 ;A69005;
    BNE .return                                                          ;A69008;
    LDA.W #InstList_Hibashi_GraphicsPart                                 ;A6900A;
    STA.W Enemy.instList,X                                               ;A6900D;
    LDA.W #Function_Hibashi_Inactive                                     ;A69010;
    STA.W Hibashi.function,X                                             ;A69013;
    LDA.W Enemy.YPosition,X                                              ;A69016;
    STA.W Hibashi.spawnYPosition,X                                       ;A69019;
    LDA.W #$0000                                                         ;A6901C;
    STA.W Enemy.XHitboxRadius,X                                          ;A6901F;

  .return:
    RTL                                                                  ;A69022;


;;; $9023: Main AI - enemy $E07F (fire pillar) ;;;
MainAI_Hibashi:
    LDX.W EnemyIndex                                                     ;A69023;
    LDA.W Hibashi.part,X                                                 ;A69026;
    BNE .return                                                          ;A69029;
    JSR.W (Hibashi.function,X)                                           ;A6902B;

  .return:
    RTL                                                                  ;A6902E;


;;; $902F: Fire pillar function - inactive ;;;
Function_Hibashi_Inactive:
    LDX.W EnemyIndex                                                     ;A6902F;
    DEC.W Hibashi.inactiveTimer,X                                        ;A69032;
    BPL .return                                                          ;A69035;
    LDA.W #Function_Hibashi_Active                                       ;A69037;
    STA.W Hibashi.function,X                                             ;A6903A;
    STZ.W Hibashi.finishedActivityFlag,X                                 ;A6903D;
    LDA.W #$0001                                                         ;A69040;
    STA.W Enemy.instTimer,X                                              ;A69043;
    STZ.W Enemy.loopCounter,X                                            ;A69046;
    LDA.W #InstList_Hibashi_GraphicsPart                                 ;A69049;
    STA.W Enemy.instList,X                                               ;A6904C;
    LDA.W Enemy.properties,X                                             ;A6904F;
    AND.W #$FEFF                                                         ;A69052;
    STA.W Enemy.properties,X                                             ;A69055;
    LDA.W Enemy[1].properties,X                                          ;A69058;
    AND.W #$FBFF                                                         ;A6905B;
    STA.W Enemy[1].properties,X                                          ;A6905E;

  .return:
    RTS                                                                  ;A69061;


;;; $9062: Fire pillar function - active ;;;
Function_Hibashi_Active:
    LDX.W EnemyIndex                                                     ;A69062;
    LDA.W Hibashi.finishedActivityFlag,X                                 ;A69065;
    BEQ .return                                                          ;A69068;
    LDA.W Hibashi.inactiveTimerResetValue,X                              ;A6906A;
    STA.W Hibashi.inactiveTimer,X                                        ;A6906D;
    LDA.W Enemy.properties,X                                             ;A69070;
    ORA.W #$0100                                                         ;A69073;
    STA.W Enemy.properties,X                                             ;A69076;
    LDA.W #Function_Hibashi_Inactive                                     ;A69079;
    STA.W Hibashi.function,X                                             ;A6907C;

  .return:
    RTS                                                                  ;A6907F;


;;; $9080: RTL ;;;
RTL_A69080:
    RTL                                                                  ;A69080;


;;; $9081: RTL ;;;
RTL_A69081:
    RTL                                                                  ;A69081;


;;; $9082: Fire pillar spritemaps ;;;
Spritemap_Hibashi_0:
    dw $0001                                                             ;A69082;
    %spritemapEntry(1, $1F9, $F9, 0, 0, 2, 0, $10E)

Spritemap_Hibashi_1:
    dw $0004                                                             ;A69089;
    %spritemapEntry(0, $05, $FF, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $1F4, $FF, 0, 1, 2, 0, $134)
    %spritemapEntry(1, $1F9, $F8, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F9, $F2, 0, 0, 2, 0, $100)

Spritemap_Hibashi_2:
    dw $0005                                                             ;A6909F;
    %spritemapEntry(0, $05, $FF, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $1F4, $FF, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $1F9, $F8, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1F9, $F2, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F9, $EC, 0, 0, 2, 0, $100)

Spritemap_Hibashi_3:
    dw $0006                                                             ;A690BA;
    %spritemapEntry(1, $1EC, $F7, 0, 1, 2, 0, $128)
    %spritemapEntry(1, $05, $F7, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $1F9, $F8, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1F9, $F0, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1F9, $EA, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F9, $E4, 0, 0, 2, 0, $100)

Spritemap_Hibashi_4:
    dw $0007                                                             ;A690DA;
    %spritemapEntry(1, $1EC, $F7, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $05, $F7, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $1F9, $F8, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1F9, $F2, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1F9, $EA, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1F9, $E4, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F9, $DE, 0, 0, 2, 0, $100)

Spritemap_Hibashi_5:
    dw $0007                                                             ;A690FF;
    %spritemapEntry(0, $05, $FF, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $1F4, $FF, 0, 1, 2, 0, $134)
    %spritemapEntry(1, $1F9, $F8, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1F9, $F0, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1F9, $E8, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1F9, $E2, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F9, $DC, 0, 0, 2, 0, $100)

Spritemap_Hibashi_6:
    dw $0007                                                             ;A69124;
    %spritemapEntry(0, $05, $FF, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $1F4, $FF, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $1F8, $F8, 1, 1, 2, 0, $106)
    %spritemapEntry(1, $1F9, $EE, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1F9, $E4, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1F9, $DE, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F9, $DA, 0, 0, 2, 0, $100)

Spritemap_Hibashi_7:
    dw $0007                                                             ;A69149;
    %spritemapEntry(1, $1EC, $F7, 0, 1, 2, 0, $128)
    %spritemapEntry(1, $05, $F7, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $1F8, $F8, 1, 1, 2, 0, $122)
    %spritemapEntry(1, $1F9, $EC, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1F9, $E2, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1F9, $DC, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F9, $D8, 0, 0, 2, 0, $100)

Spritemap_Hibashi_8:
    dw $0008                                                             ;A6916E;
    %spritemapEntry(1, $1EC, $F7, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $05, $F7, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $1F9, $F8, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F9, $F0, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1F9, $E4, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1F9, $DA, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1F9, $D4, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F9, $D0, 0, 0, 2, 0, $100)

Spritemap_Hibashi_9:
    dw $0008                                                             ;A69198;
    %spritemapEntry(0, $05, $FF, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $1F4, $FF, 0, 1, 2, 0, $134)
    %spritemapEntry(1, $1F9, $F4, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F9, $E6, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1F9, $DA, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1F9, $D0, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1F9, $CA, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F9, $C6, 0, 0, 2, 0, $100)

Spritemap_Hibashi_A:
    dw $0009                                                             ;A691C2;
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
    dw $000D                                                             ;A691F1;
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
    dw $000E                                                             ;A69234;
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
    dw $000E                                                             ;A6927C;
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
    dw $000C                                                             ;A692C4;
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
    dw $000E                                                             ;A69302;
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
    dw $000D                                                             ;A6934A;
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
    dw $000C                                                             ;A6938D;
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
    dw $000B                                                             ;A693CB;
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
    dw $0008                                                             ;A69404;
    %spritemapEntry(1, $1F9, $B6, 0, 0, 2, 0, $12E)
    %spritemapEntry(0, $02, $B5, 0, 0, 2, 0, $137)
    %spritemapEntry(0, $1F8, $B5, 0, 0, 2, 0, $136)
    %spritemapEntry(0, $02, $AB, 0, 0, 2, 0, $127)
    %spritemapEntry(0, $1F8, $AB, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1F9, $A2, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1F9, $9A, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F9, $9C, 0, 0, 2, 0, $10E)

Spritemap_Hibashi_14:
    dw $0006                                                             ;A6942E;
    %spritemapEntry(1, $1F9, $AA, 0, 0, 2, 0, $12E)
    %spritemapEntry(0, $02, $AD, 0, 0, 2, 0, $137)
    %spritemapEntry(0, $1F8, $AD, 0, 0, 2, 0, $136)
    %spritemapEntry(0, $02, $A3, 0, 0, 2, 0, $127)
    %spritemapEntry(0, $1F8, $A3, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1F9, $9A, 0, 0, 2, 0, $126)

Spritemap_Hibashi_15:
    dw $0005                                                             ;A6944E;
    %spritemapEntry(1, $1F9, $A4, 0, 0, 2, 0, $12E)
    %spritemapEntry(0, $02, $A5, 0, 0, 2, 0, $137)
    %spritemapEntry(0, $1F8, $A5, 0, 0, 2, 0, $136)
    %spritemapEntry(0, $02, $9B, 0, 0, 2, 0, $127)
    %spritemapEntry(0, $1F8, $9B, 0, 0, 2, 0, $126)

Spritemap_Hibashi_16:
    dw $0001                                                             ;A69469;
    %spritemapEntry(1, $1F9, $9C, 0, 0, 2, 0, $12E)


;;; $9470: Palette - enemy $E0BF (fire arc) ;;;
Palette_Puromi:
    dw $3800,$3E7F,$2DFD,$10FB,$0097,$73FF,$53FF,$37FF                   ;A69470;
    dw $17FF,$24DF,$189B,$1076,$0C50,$084B,$5EFF,$0880                   ;A69480;


;;; $9490: Instruction list ;;;
InstList_Puromi:
    dw $0003,Spritemap_Puromi_0                                          ;A69490;
    dw $0003,Spritemap_Puromi_1                                          ;A69494;
    dw $0003,Spritemap_Puromi_4                                          ;A69498;
    dw $0003,Spritemap_Puromi_2                                          ;A6949C;
    dw $0003,Spritemap_Puromi_3                                          ;A694A0;
    dw $0003,Spritemap_Puromi_5                                          ;A694A4;
    dw $0003,Spritemap_Puromi_0                                          ;A694A8;
    dw $0003,Spritemap_Puromi_1                                          ;A694AC;
    dw $0003,Spritemap_Puromi_6                                          ;A694B0;
    dw $0003,Spritemap_Puromi_2                                          ;A694B4;
    dw $0003,Spritemap_Puromi_3                                          ;A694B8;
    dw $0003,Spritemap_Puromi_7                                          ;A694BC;
    dw Instruction_Common_GotoY                                          ;A694C0;
    dw InstList_Puromi                                                   ;A694C2;


;;; $94C4: Initialisation AI - enemy $E0BF (fire arc) ;;;
InitAI_Puromi:
    LDX.W EnemyIndex                                                     ;A694C4;
    LDA.W #InstList_Puromi                                               ;A694C7;
    STA.W Enemy.instList,X                                               ;A694CA;
    LDA.W Enemy.init0,X                                                  ;A694CD;
    AND.W #$00FF                                                         ;A694D0;
    STA.W Puromi.speedTableIndex,X                                       ;A694D3;
    LDA.W Enemy.init0+1,X                                                ;A694D6;
    AND.W #$00FF                                                         ;A694D9;
    STA.W Puromi.arcRadius,X                                             ;A694DC;
    LDA.W Enemy.init1,X                                                  ;A694DF;
    AND.W #$00FF                                                         ;A694E2;
    STA.W Puromi.direction,X                                             ;A694E5;
    LDA.W Enemy.init1+1,X                                                ;A694E8;
    AND.W #$00FF                                                         ;A694EB;
    STA.W Puromi.inactiveTimerResetValue,X                               ;A694EE;
    STA.W Puromi.inactiveTimer,X                                         ;A694F1;
    LDA.W #Function_Puromi_Inactive                                      ;A694F4;
    STA.W Puromi.function,X                                              ;A694F7;
    LDA.W Puromi.direction,X                                             ;A694FA;
    ASL                                                                  ;A694FD;
    ASL                                                                  ;A694FE;
    TAY                                                                  ;A694FF;
    LDA.W .startAngle_clockwise,Y                                        ;A69500;
    STA.L Puromi.startAngle,X                                            ;A69503;
    STA.L Puromi.angle,X                                                 ;A69507;
    LDA.W .finishAngle_clockwise,Y                                       ;A6950B;
    STA.L Puromi.finishAngle,X                                           ;A6950E;
    LDA.W .angleBetweenBodyPartsDoubled_clockwise,Y                      ;A69512;
    STA.L Puromi.angleBetweenBodyPartsTimes2,X                           ;A69515;
    LDA.W .angleBetweenBodyParts_clockwise,Y                             ;A69519;
    STA.L Puromi.angleBetweenBodyParts,X                                 ;A6951C;
    LDA.W .risingExplosionAngle_clockwise,Y                              ;A69520;
    STA.L Puromi.risingExplosionAngle,X                                  ;A69523;
    LDA.W .fallingExplosionAngle_clockwise,Y                             ;A69527;
    STA.L Puromi.fallingExplosionAngle,X                                 ;A6952A;
    LDA.W Puromi.speedTableIndex,X                                       ;A6952E;
    ASL                                                                  ;A69531;
    ASL                                                                  ;A69532;
    ASL                                                                  ;A69533;
    TAY                                                                  ;A69534;
    LDA.W Puromi.direction,X                                             ;A69535;
    BNE .firingUp                                                        ;A69538;
    INY                                                                  ;A6953A;
    INY                                                                  ;A6953B;
    INY                                                                  ;A6953C;
    INY                                                                  ;A6953D;

  .firingUp:
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,Y                         ;A6953E;
    STA.L Puromi.angleDelta,X                                            ;A69541;
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,Y                       ;A69545;
    STA.L Puromi.subAngleDelta,X                                         ;A69548;
    LDA.W Enemy.XPosition,X                                              ;A6954C;
    STA.L Puromi.arcOriginXPosition,X                                    ;A6954F;
    LDA.W Enemy.YPosition,X                                              ;A69553;
    STA.L Puromi.arcOriginYPosition,X                                    ;A69556;
    LDA.W Puromi.arcRadius,X                                             ;A6955A;
    STA.W Temp_Unknown0E32                                               ;A6955D;
    LDA.L Puromi.startAngle,X                                            ;A69560;
    JSL.L EightBitCosineMultiplication_A0B0B2                            ;A69564;
    CLC                                                                  ;A69568;
    ADC.L Puromi.arcOriginXPosition,X                                    ;A69569;
    STA.L Puromi.bodyPartSpawnXPosition,X                                ;A6956D;
    STA.W Enemy.XPosition,X                                              ;A69571;
    LDA.W Puromi.arcRadius,X                                             ;A69574;
    STA.W Temp_Unknown0E32                                               ;A69577;
    LDA.L Puromi.startAngle,X                                            ;A6957A;
    JSL.L EightBitNegativeSineMultiplication_A0B0C6                      ;A6957E;
    CLC                                                                  ;A69582;
    ADC.L Puromi.arcOriginYPosition,X                                    ;A69583;
    STA.L Puromi.bodyPartSpawnYPosition,X                                ;A69587;
    STA.W Enemy.YPosition,X                                              ;A6958B;
    LDA.W #$0008                                                         ;A6958E;
    STA.L Puromi.bodyIndex,X                                             ;A69591;

  .loopEnemyProjectiles:
    LDX.W EnemyIndex                                                     ;A69595;
    LDY.W #EnemyProjectile_Puromi                                        ;A69598;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A6959B;
    LDA.L Puromi.bodyIndex,X                                             ;A6959F;
    SEC                                                                  ;A695A3;
    SBC.W #$0002                                                         ;A695A4;
    STA.L Puromi.bodyIndex,X                                             ;A695A7;
    BNE .loopEnemyProjectiles                                            ;A695AB;
    LDA.W #$0006                                                         ;A695AD;
    STA.L Puromi.bodyIndex,X                                             ;A695B0;

  .loopSpirteObjects:
    LDX.W EnemyIndex                                                     ;A695B4;
    LDA.W Enemy.XPosition,X                                              ;A695B7;
    STA.B DP_Temp12                                                      ;A695BA;
    LDA.W Enemy.YPosition,X                                              ;A695BC;
    STA.B DP_Temp14                                                      ;A695BF;
    LDA.W #$002B                                                         ;A695C1;
    STA.B DP_Temp16                                                      ;A695C4;
    LDA.W Enemy.palette,X                                                ;A695C6;
    ORA.W Enemy.GFXOffset,X                                              ;A695C9;
    STA.L Puromi.graphicsIndices,X                                       ;A695CC;
    STA.B DP_Temp18                                                      ;A695D0;
    JSL.L Create_Sprite_Object                                           ;A695D2;
    PHX                                                                  ;A695D6;
    LDA.L Puromi.bodyIndex,X                                             ;A695D7;
    CLC                                                                  ;A695DB;
    ADC.W EnemyIndex                                                     ;A695DC;
    TAX                                                                  ;A695DF;
    LDA.B DP_Temp12                                                      ;A695E0;
    STA.L Puromi.spriteObjectIndex0,X                                    ;A695E2;
    PLX                                                                  ;A695E6;
    LDA.L Puromi.bodyIndex,X                                             ;A695E7;
    SEC                                                                  ;A695EB;
    SBC.W #$0002                                                         ;A695EC;
    STA.L Puromi.bodyIndex,X                                             ;A695EF;
    BNE .loopSpirteObjects                                               ;A695F3;
    RTL                                                                  ;A695F5;

;        _____________________ Clockwise
;       |             ________ Anticlockwise
;       |            |
  .startAngle_clockwise:
    dw $0190                                                             ;A695F6;
  .finishAngle_clockwise:
    dw       $00F0                                                       ;A695F8;
  .startAngle_antiClockwise:
    dw              $00F0                                                ;A695FA;
  .finishAngle_antiClockwise:
    dw                    $0190                                          ;A695FC;

  .angleBetweenBodyPartsDoubled_clockwise:
    dw $FFE8                                                             ;A695FE;
  .angleBetweenBodyParts_clockwise:
    dw       $FFF4                                                       ;A69600;
  .angleBetweenBodyPartsDoubled_antiClockwise:
    dw              $0018                                                ;A69602;
  .angleBetweenBodyParts_antiClockwise:
    dw                    $000C                                          ;A69604;

  .risingExplosionAngle_clockwise:
    dw $0180                                                             ;A69606;
  .fallingExplosionAngle_clockwise:
    dw       $0100                                                       ;A69608;
  .risingExplosionAngle_antiClockwise:
    dw              $0100                                                ;A6960A;
  .fallingExplosionAngle_antiClockwise:
    dw                    $0180                                          ;A6960C;


;;; $960E: Main AI - enemy $E0BF (fire arc) ;;;
MainAI_Puromi:
    LDX.W EnemyIndex                                                     ;A6960E;
    JSR.W (Puromi.function,X)                                            ;A69611;
    RTL                                                                  ;A69614;


;;; $9615: Fire arc function - inactive ;;;
Function_Puromi_Inactive:
    LDX.W EnemyIndex                                                     ;A69615;
    DEC.W Puromi.inactiveTimer,X                                         ;A69618;
    BPL .return                                                          ;A6961B;
    LDA.W Puromi.inactiveTimerResetValue,X                               ;A6961D;
    STA.W Puromi.inactiveTimer,X                                         ;A69620;
    LDA.L Puromi.startAngle,X                                            ;A69623;
    STA.L Puromi.angle,X                                                 ;A69627;
    LDA.W #Function_Puromi_Active                                        ;A6962B;
    STA.W Puromi.function,X                                              ;A6962E;
    LDA.W #$0000                                                         ;A69631;
    STA.L Puromi.headExplosionReason,X                                   ;A69634;
    STA.L Puromi.projectile0ExplosionReason,X                            ;A69638;
    STA.L Puromi.projectile1ExplosionReason,X                            ;A6963C;
    STA.L Puromi.projectile2ExplosionReason,X                            ;A69640;
    STA.L Puromi.projectile3ExplosionReason,X                            ;A69644;
    STA.L Puromi.projectile4ExplosionReason,X                            ;A69648;
    STA.L ExtraEnemy7800+$1A,X                                           ;A6964C;
    STA.L ExtraEnemy7800+$1C,X                                           ;A69650;
    STA.L ExtraEnemy7800+$1E,X                                           ;A69654;
    STA.L Puromi.spriteObject0ExplosionReason,X                          ;A69658;
    STA.L Puromi.spriteObject1ExplosionReason,X                          ;A6965C;
    STA.L Puromi.spriteObject2ExplosionReason,X                          ;A69660;
    STA.L Puromi.spriteObject3ExplosionReason,X                          ;A69664;
    STA.L ExtraEnemy7800+$38,X                                           ;A69668;
    STA.L ExtraEnemy7800+$3A,X                                           ;A6966C;
    STA.L ExtraEnemy7800+$3C,X                                           ;A69670;
    STA.L ExtraEnemy7800+$3E,X                                           ;A69674;
    LDA.W Enemy.properties,X                                             ;A69678;
    ORA.W #$0800                                                         ;A6967B;
    STA.W Enemy.properties,X                                             ;A6967E;

  .return:
    RTS                                                                  ;A69681;


;;; $9682: Fire arc function - active ;;;
Function_Puromi_Active:
    LDX.W EnemyIndex                                                     ;A69682;
    LDA.W Puromi.arcRadius,X                                             ;A69685;
    STA.W Temp_Unknown0E32                                               ;A69688;
    LDA.L Puromi.angle,X                                                 ;A6968B;
    JSR.W CheckExplosionCondition                                        ;A6968F;
    STA.B DP_Temp1E                                                      ;A69692;
    PHA                                                                  ;A69694;
    CMP.L Puromi.headExplosionReason,X                                   ;A69695;
    BEQ .matchingExplosionReason                                         ;A69699;
    LDX.W EnemyIndex                                                     ;A6969B;
    LDA.W Enemy.XPosition,X                                              ;A6969E;
    STA.B DP_Temp12                                                      ;A696A1;
    LDA.W Enemy.YPosition,X                                              ;A696A3;
    STA.B DP_Temp14                                                      ;A696A6;
    LDA.W #$002E                                                         ;A696A8;
    STA.B DP_Temp16                                                      ;A696AB;
    LDA.L Puromi.graphicsIndices,X                                       ;A696AD;
    STA.B DP_Temp18                                                      ;A696B1;
    JSL.L Create_Sprite_Object                                           ;A696B3;
    LDA.W Enemy.XPosition,X                                              ;A696B7;
    STA.B DP_Temp12                                                      ;A696BA;
    LDA.W Enemy.YPosition,X                                              ;A696BC;
    STA.B DP_Temp14                                                      ;A696BF;
    LDA.B DP_Temp1A                                                      ;A696C1;
    CLC                                                                  ;A696C3;
    ADC.W #$002C                                                         ;A696C4;
    STA.B DP_Temp16                                                      ;A696C7;
    LDA.L Puromi.graphicsIndices,X                                       ;A696C9;
    STA.B DP_Temp18                                                      ;A696CD;
    JSL.L Create_Sprite_Object                                           ;A696CF;
    JSR.W PlayPuromiExplosionSFX                                         ;A696D3;

  .matchingExplosionReason:
    PLA                                                                  ;A696D6;
    STA.L Puromi.headExplosionReason,X                                   ;A696D7;
    LDA.L Puromi.angle,X                                                 ;A696DB;
    JSR.W ClampAngle_CheckInactivityCondition                            ;A696DF;
    JSL.L EightBitCosineMultiplication_A0B0B2                            ;A696E2;
    CLC                                                                  ;A696E6;
    ADC.L Puromi.arcOriginXPosition,X                                    ;A696E7;
    STA.W Enemy.XPosition,X                                              ;A696EB;
    LDA.L Puromi.angle,X                                                 ;A696EE;
    JSR.W ClampAngle_CheckInactivityCondition                            ;A696F2;
    JSL.L EightBitNegativeSineMultiplication_A0B0C6                      ;A696F5;
    CLC                                                                  ;A696F9;
    ADC.L Puromi.arcOriginYPosition,X                                    ;A696FA;
    STA.W Enemy.YPosition,X                                              ;A696FE;
    JSR.W HandlePuromiProjectiles                                        ;A69701;
    JSR.W HandlePuromiSpriteObjects                                      ;A69704;
    CLC                                                                  ;A69707;
    LDA.L Puromi.subAngle,X                                              ;A69708;
    ADC.L Puromi.subAngleDelta,X                                         ;A6970C;
    STA.L Puromi.subAngle,X                                              ;A69710;
    LDA.L Puromi.angle,X                                                 ;A69714;
    ADC.L Puromi.angleDelta,X                                            ;A69718;
    STA.L Puromi.angle,X                                                 ;A6971C;
    RTS                                                                  ;A69720;


;;; $9721: Handle fire arc enemy projectiles ;;;
HandlePuromiProjectiles:
    LDX.W EnemyIndex                                                     ;A69721;
    LDA.W #$0008                                                         ;A69724;
    STA.L Puromi.bodyIndex,X                                             ;A69727;
    LDA.L Puromi.angle,X                                                 ;A6972B;
    CLC                                                                  ;A6972F;
    ADC.L Puromi.angleBetweenBodyParts,X                                 ;A69730;
    STA.B DP_Temp24                                                      ;A69734;

  .loop:
    LDX.W EnemyIndex                                                     ;A69736;
    LDA.B DP_Temp24                                                      ;A69739;
    SEC                                                                  ;A6973B;
    SBC.L Puromi.angleBetweenBodyPartsTimes2,X                           ;A6973C;
    STA.B DP_Temp24                                                      ;A69740;
    PHX                                                                  ;A69742;
    LDA.L Puromi.bodyIndex,X                                             ;A69743;
    CLC                                                                  ;A69747;
    ADC.W EnemyIndex                                                     ;A69748;
    TAX                                                                  ;A6974B;
    LDA.L Puromi.projectileIndex0,X                                      ;A6974C;
    TAY                                                                  ;A69750;
    LDA.B DP_Temp24                                                      ;A69751;
    JSR.W CheckExplosionCondition                                        ;A69753;
    STA.B DP_Temp1E                                                      ;A69756;
    PHA                                                                  ;A69758;
    CMP.L Puromi.projectile0ExplosionReason,X                            ;A69759;
    BEQ .matchingExplosionReason                                         ;A6975D;
    PHX                                                                  ;A6975F;
    LDX.W EnemyIndex                                                     ;A69760;
    LDA.W EnemyProjectile_XPositions,Y                                   ;A69763;
    STA.B DP_Temp12                                                      ;A69766;
    LDA.W EnemyProjectile_YPositions,Y                                   ;A69768;
    STA.B DP_Temp14                                                      ;A6976B;
    LDA.W #$002E                                                         ;A6976D;
    STA.B DP_Temp16                                                      ;A69770;
    LDA.L Puromi.graphicsIndices,X                                       ;A69772;
    STA.B DP_Temp18                                                      ;A69776;
    JSL.L Create_Sprite_Object                                           ;A69778;
    LDA.W EnemyProjectile_XPositions,Y                                   ;A6977C;
    STA.B DP_Temp12                                                      ;A6977F;
    LDA.W EnemyProjectile_YPositions,Y                                   ;A69781;
    STA.B DP_Temp14                                                      ;A69784;
    LDA.B DP_Temp1A                                                      ;A69786;
    CLC                                                                  ;A69788;
    ADC.W #$002C                                                         ;A69789;
    STA.B DP_Temp16                                                      ;A6978C;
    LDA.L Puromi.graphicsIndices,X                                       ;A6978E;
    STA.B DP_Temp18                                                      ;A69792;
    JSL.L Create_Sprite_Object                                           ;A69794;
    JSR.W PlayPuromiExplosionSFX                                         ;A69798;
    PLX                                                                  ;A6979B;

  .matchingExplosionReason:
    PLA                                                                  ;A6979C;
    STA.L Puromi.projectile0ExplosionReason,X                            ;A6979D;
    PLX                                                                  ;A697A1;
    LDA.B DP_Temp24                                                      ;A697A2;
    JSR.W ClampAngle_CheckInactivityCondition                            ;A697A4;
    JSL.L EightBitCosineMultiplication_A0B0B2                            ;A697A7;
    CLC                                                                  ;A697AB;
    ADC.L Puromi.arcOriginXPosition,X                                    ;A697AC;
    STA.W EnemyProjectile_XPositions,Y                                   ;A697B0;
    LDA.B DP_Temp24                                                      ;A697B3;
    JSR.W ClampAngle_CheckInactivityCondition                            ;A697B5;
    JSL.L EightBitNegativeSineMultiplication_A0B0C6                      ;A697B8;
    CLC                                                                  ;A697BC;
    ADC.L Puromi.arcOriginYPosition,X                                    ;A697BD;
    STA.W EnemyProjectile_YPositions,Y                                   ;A697C1;
    LDA.L Puromi.bodyIndex,X                                             ;A697C4;
    SEC                                                                  ;A697C8;
    SBC.W #$0002                                                         ;A697C9;
    STA.L Puromi.bodyIndex,X                                             ;A697CC;
    BEQ +                                                                ;A697D0;
    JMP.W .loop                                                          ;A697D2;

+   LDA.B DP_Temp1C                                                      ;A697D5;
    BEQ .return                                                          ;A697D7;
    LDA.W #Function_Puromi_Inactive                                      ;A697D9;
    STA.W Puromi.function,X                                              ;A697DC;
    LDA.W Enemy.properties,X                                             ;A697DF;
    AND.W #$F7FF                                                         ;A697E2;
    STA.W Enemy.properties,X                                             ;A697E5;

  .return:
    RTS                                                                  ;A697E8;


;;; $97E9: Handle fire arc sprite objects ;;;
HandlePuromiSpriteObjects:
    LDX.W EnemyIndex                                                     ;A697E9;
    LDA.W #$0006                                                         ;A697EC;
    STA.L Puromi.bodyIndex,X                                             ;A697EF;
    LDA.L Puromi.angle,X                                                 ;A697F3;
    STA.B DP_Temp24                                                      ;A697F7;

  .loop:
    LDX.W EnemyIndex                                                     ;A697F9;
    LDA.B DP_Temp24                                                      ;A697FC;
    SEC                                                                  ;A697FE;
    SBC.L Puromi.angleBetweenBodyPartsTimes2,X                           ;A697FF;
    STA.B DP_Temp24                                                      ;A69803;
    PHX                                                                  ;A69805;
    LDA.L Puromi.bodyIndex,X                                             ;A69806;
    CLC                                                                  ;A6980A;
    ADC.W EnemyIndex                                                     ;A6980B;
    TAX                                                                  ;A6980E;
    LDA.L Puromi.spriteObjectIndex0,X                                    ;A6980F;
    TAY                                                                  ;A69813;
    LDA.B DP_Temp24                                                      ;A69814;
    JSR.W CheckExplosionCondition                                        ;A69816;
    STA.B DP_Temp1E                                                      ;A69819;
    PHA                                                                  ;A6981B;
    CMP.L Puromi.spriteObject0ExplosionReason,X                          ;A6981C;
    BEQ .matchingExplosionReason                                         ;A69820;
    PHX                                                                  ;A69822;
    LDX.W EnemyIndex                                                     ;A69823;
    LDA.L Puromi.graphicsIndices,X                                       ;A69826;
    STA.B DP_Temp26                                                      ;A6982A;
    TYX                                                                  ;A6982C;
    LDA.L SpriteObjects_XPositions,X                                     ;A6982D;
    STA.B DP_Temp12                                                      ;A69831;
    LDA.L SpriteObjects_YPositions,X                                     ;A69833;
    STA.B DP_Temp14                                                      ;A69837;
    LDA.W #$002E                                                         ;A69839;
    STA.B DP_Temp16                                                      ;A6983C;
    LDA.B DP_Temp26                                                      ;A6983E;
    STA.B DP_Temp18                                                      ;A69840;
    JSL.L Create_Sprite_Object                                           ;A69842;
    LDA.L SpriteObjects_XPositions,X                                     ;A69846;
    STA.B DP_Temp12                                                      ;A6984A;
    LDA.L SpriteObjects_YPositions,X                                     ;A6984C;
    STA.B DP_Temp14                                                      ;A69850;
    LDA.W #$002C                                                         ;A69852;
    CLC                                                                  ;A69855;
    ADC.B DP_Temp1A                                                      ;A69856;
    STA.B DP_Temp16                                                      ;A69858;
    LDA.B DP_Temp26                                                      ;A6985A;
    STA.B DP_Temp18                                                      ;A6985C;
    JSL.L Create_Sprite_Object                                           ;A6985E;
    JSR.W PlayPuromiExplosionSFX                                         ;A69862;
    PLX                                                                  ;A69865;

  .matchingExplosionReason:
    PLA                                                                  ;A69866;
    STA.L Puromi.spriteObject0ExplosionReason,X                          ;A69867;
    PLX                                                                  ;A6986B;
    LDA.B DP_Temp24                                                      ;A6986C;
    JSR.W ClampAngle_CheckInactivityCondition                            ;A6986E;
    JSL.L EightBitCosineMultiplication_A0B0B2                            ;A69871;
    CLC                                                                  ;A69875;
    ADC.L Puromi.arcOriginXPosition,X                                    ;A69876;
    STA.B DP_Temp20                                                      ;A6987A;
    LDA.B DP_Temp24                                                      ;A6987C;
    JSR.W ClampAngle_CheckInactivityCondition                            ;A6987E;
    JSL.L EightBitNegativeSineMultiplication_A0B0C6                      ;A69881;
    CLC                                                                  ;A69885;
    ADC.L Puromi.arcOriginYPosition,X                                    ;A69886;
    STA.B DP_Temp22                                                      ;A6988A;
    PHX                                                                  ;A6988C;
    TYX                                                                  ;A6988D;
    LDA.B DP_Temp20                                                      ;A6988E;
    STA.L SpriteObjects_XPositions,X                                     ;A69890;
    LDA.B DP_Temp22                                                      ;A69894;
    STA.L SpriteObjects_YPositions,X                                     ;A69896;
    PLX                                                                  ;A6989A;
    LDA.L Puromi.bodyIndex,X                                             ;A6989B;
    SEC                                                                  ;A6989F;
    SBC.W #$0002                                                         ;A698A0;
    STA.L Puromi.bodyIndex,X                                             ;A698A3;
    BEQ .return                                                          ;A698A7;
    JMP.W .loop                                                          ;A698A9;

  .return:
    RTS                                                                  ;A698AC;


;;; $98AD: Clamp angle and check inactivity condition ;;;
ClampAngle_CheckInactivityCondition:
;; Parameters:
;;     A: Angle
;; Returns:
;;     A: Clamped angle
;;     $1C: Inactivity flag. Matters only for the last body enemy projectile. 0 = activity, 1 = inactivity
    PHX                                                                  ;A698AD;
    PHA                                                                  ;A698AE;
    LDX.W EnemyIndex                                                     ;A698AF;
    STZ.B DP_Temp1C                                                      ;A698B2;
    LDA.W Puromi.direction,X                                             ;A698B4;
    BNE .notClockwise                                                    ;A698B7;
    PLA                                                                  ;A698B9;
    CMP.L Puromi.finishAngle,X                                           ;A698BA;
    BMI .afterFinish                                                     ;A698BE;
    CMP.L Puromi.startAngle,X                                            ;A698C0;
    BPL .beforeStart                                                     ;A698C4;
    BRA .return                                                          ;A698C6;

  .notClockwise:
    PLA                                                                  ;A698C8;
    CMP.L Puromi.finishAngle,X                                           ;A698C9;
    BPL .afterFinish                                                     ;A698CD;
    CMP.L Puromi.startAngle,X                                            ;A698CF;
    BMI .beforeStart                                                     ;A698D3;
    BRA .return                                                          ;A698D5;

  .afterFinish:
    INC.B DP_Temp1C                                                      ;A698D7;
    LDA.L Puromi.finishAngle,X                                           ;A698D9;
    BRA .return                                                          ;A698DD;

  .beforeStart:
    LDA.L Puromi.startAngle,X                                            ;A698DF;
    BRA .return                                                          ;A698E3;

  .return:
    PLX                                                                  ;A698E5;
    RTS                                                                  ;A698E6;


;;; $98E7: Check explosion condition ;;;
CheckExplosionCondition:
;; Parameters:
;;     A: Angle
;; Returns:
;;     A: Explosion reason. 0 = no explosion, 1 = rising, 2 = falling
;;     $1A: If returning [A] != 0, explosion side. 0 = right, 1 = left
    PHX                                                                  ;A698E7;
    PHA                                                                  ;A698E8;
    LDX.W EnemyIndex                                                     ;A698E9;
    LDA.W Puromi.direction,X                                             ;A698EC;
    BNE .notClockwise                                                    ;A698EF;
    PLA                                                                  ;A698F1;
    CMP.L Puromi.fallingExplosionAngle,X                                 ;A698F2;
    BMI .clockwiseFalling                                                ;A698F6;
    CMP.L Puromi.risingExplosionAngle,X                                  ;A698F8;
    BMI .clockwiseRising                                                 ;A698FC;
    LDA.W #$0000                                                         ;A698FE;
    BRA .return                                                          ;A69901;

  .notClockwise:
    PLA                                                                  ;A69903;
    CMP.L Puromi.fallingExplosionAngle,X                                 ;A69904;
    BPL .antiClockwiseFalling                                            ;A69908;
    CMP.L Puromi.risingExplosionAngle,X                                  ;A6990A;
    BPL .antiClockwiseRising                                             ;A6990E;
    LDA.W #$0000                                                         ;A69910;
    BRA .return                                                          ;A69913;

  .clockwiseRising:
    LDA.W #$0001                                                         ;A69915;
    STA.B DP_Temp1A                                                      ;A69918;
    LDA.W #$0001                                                         ;A6991A;
    BRA .return                                                          ;A6991D;

  .clockwiseFalling:
    LDA.W #$0000                                                         ;A6991F;
    STA.B DP_Temp1A                                                      ;A69922;
    LDA.W #$0002                                                         ;A69924;
    BRA .return                                                          ;A69927;

  .antiClockwiseRising:
    LDA.W #$0000                                                         ;A69929;
    STA.B DP_Temp1A                                                      ;A6992C;
    LDA.W #$0001                                                         ;A6992E;
    BRA .return                                                          ;A69931;

  .antiClockwiseFalling:
    LDA.W #$0001                                                         ;A69933;
    STA.B DP_Temp1A                                                      ;A69936;
    LDA.W #$0002                                                         ;A69938;
    BRA .return                                                          ;A6993B;

  .return:
    PLX                                                                  ;A6993D;
    RTS                                                                  ;A6993E;


;;; $993F: Play fire arc explosion sound effect ;;;
PlayPuromiExplosionSFX:
;; Parameters:
;;     $1E: Explosion reason. 0 = no explosion, 1 = rising, 2 = falling
    PHY                                                                  ;A6993F;
    PHX                                                                  ;A69940;
    LDA.B DP_Temp1E                                                      ;A69941;
    CMP.W #$0002                                                         ;A69943;
    BEQ .return                                                          ;A69946;
    LDA.W #$005E                                                         ;A69948;
    JSL.L QueueSound_Lib2_Max6                                           ;A6994B;

  .return:
    PLX                                                                  ;A6994F;
    PLY                                                                  ;A69950;
    RTS                                                                  ;A69951;


;;; $9952: RTL ;;;
RTL_A69952:
    RTL                                                                  ;A69952;


;;; $9953: RTL ;;;
RTL_A69953:
    RTL                                                                  ;A69953;


;;; $9954: Fire arc spritemaps ;;;
Spritemap_Puromi_0:
    dw $0001                                                             ;A69954;
    %spritemapEntry(1, $1F9, $F8, 0, 0, 2, 1, $10A)

Spritemap_Puromi_1:
    dw $0001                                                             ;A6995B;
    %spritemapEntry(1, $1F9, $F8, 0, 0, 2, 1, $108)

Spritemap_Puromi_2:
    dw $0001                                                             ;A69962;
    %spritemapEntry(1, $1F8, $F8, 1, 1, 2, 1, $10A)

Spritemap_Puromi_3:
    dw $0001                                                             ;A69969;
    %spritemapEntry(1, $1F8, $F8, 1, 1, 2, 1, $108)

Spritemap_Puromi_4:
    dw $0001                                                             ;A69970;
    %spritemapEntry(1, $1F9, $F8, 0, 0, 2, 1, $106)

Spritemap_Puromi_5:
    dw $0001                                                             ;A69977;
    %spritemapEntry(1, $1F9, $F8, 0, 0, 2, 1, $122)

Spritemap_Puromi_6:
    dw $0001                                                             ;A6997E;
    %spritemapEntry(1, $1F8, $F8, 1, 1, 2, 1, $106)

Spritemap_Puromi_7:
    dw $0001                                                             ;A69985;
    %spritemapEntry(1, $1F8, $F8, 1, 1, 2, 1, $122)


;;; $998C: Palette - enemy $E0FF (fake Kraid) ;;;
Palette_MiniKraid:
    dw $3800,$559D,$1816,$100D,$4B9F,$3F37,$36D0,$2E69                   ;A6998C;
    dw $2608,$1DA6,$1125,$08C5,$0003,$094E,$1656,$0000                   ;A6999C;


;;; $99AC: Instruction list - choose action ;;;
InstList_MiniKraid_ChooseAction:
    dw Instruction_MiniKraid_ChooseAction                                ;A699AC;


;;; $99AE: Instruction list - step forwards - facing left ;;;
InstList_MiniKraid_StepForwards_FacingLeft:
    dw $0010,Spritemap_MiniKraid_Stepping_FacingLeft_0                   ;A699AE;
    dw $000C,Spritemap_MiniKraid_Stepping_FacingLeft_1                   ;A699B2;
    dw $0008,Spritemap_MiniKraid_Stepping_FacingLeft_2                   ;A699B6;
    dw $000C,Spritemap_MiniKraid_Stepping_FacingLeft_3                   ;A699BA;
    dw Instruction_MiniKraid_Move                                        ;A699BE;
    dw Instruction_Common_GotoY                                          ;A699C0;
    dw InstList_MiniKraid_ChooseAction                                   ;A699C2;


;;; $99C4: Instruction list - choose action ;;;
InstList_MiniKraid_ChooseAction_duplicate:
    dw Instruction_MiniKraid_ChooseAction                                ;A699C4;


;;; $99C6: Instruction list - step backwards - facing left ;;;
InstList_MiniKraid_StepBackwards_FacingLeft:
    dw $0010,Spritemap_MiniKraid_Stepping_FacingLeft_0                   ;A699C6;
    dw Instruction_MiniKraid_Move                                        ;A699CA;
    dw $000C,Spritemap_MiniKraid_Stepping_FacingLeft_3                   ;A699CC;
    dw $0008,Spritemap_MiniKraid_Stepping_FacingLeft_2                   ;A699D0;
    dw $000C,Spritemap_MiniKraid_Stepping_FacingLeft_1                   ;A699D4;
    dw Instruction_Common_GotoY                                          ;A699D8;
    dw InstList_MiniKraid_ChooseAction_duplicate                         ;A699DA;


;;; $99DC: Instruction list - fire spit - facing left ;;;
InstList_MiniKraid_FireSpit_FacingLeft:
    dw $0010,Spritemap_MiniKraid_FiringSpit_FacingLeft_0                 ;A699DC;
    dw Instruction_MiniKraid_PlayCrySFX                                  ;A699E0;
    dw $0008,Spritemap_MiniKraid_FiringSpit_FacingLeft_1                 ;A699E2;
    dw Instruction_MiniKraid_FireSpitLeft                                ;A699E6;
    dw $0010,Spritemap_MiniKraid_FiringSpit_FacingLeft_2                 ;A699E8;
    dw $0008,Spritemap_MiniKraid_FiringSpit_FacingLeft_1                 ;A699EC;
    dw Instruction_Common_GotoY                                          ;A699F0;
    dw InstList_MiniKraid_ChooseAction                                   ;A699F2;


if !FEATURE_KEEP_UNREFERENCED
;;; $99F4: Unused. Instruction list - standing - facing left ;;;
UNUSED_InstList_MiniKraid_Standing_FacingLeft_A699F4:
    dw $7FFF,Spritemap_MiniKraid_FiringSpit_FacingLeft_0                 ;A699F4;
    dw Instruction_Common_Sleep                                          ;A699F8;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $99FA: Instruction list - choose action ;;;
InstList_MiniKraid_ChooseAction_duplicate_again2:
    dw Instruction_MiniKraid_ChooseAction                                ;A699FA;


;;; $99FC: Instruction list - step forwards - facing right ;;;
InstList_MiniKraid_StepForwards_FacingRight:
    dw $0010,Spritemap_MiniKraid_Stepping_FacingRight_0                  ;A699FC;
    dw $000C,Spritemap_MiniKraid_Stepping_FacingRight_1                  ;A69A00;
    dw $0008,Spritemap_MiniKraid_Stepping_FacingRight_2                  ;A69A04;
    dw $000C,Spritemap_MiniKraid_Stepping_FacingRight_3                  ;A69A08;
    dw Instruction_MiniKraid_Move                                        ;A69A0C;
    dw Instruction_Common_GotoY                                          ;A69A0E;
    dw InstList_MiniKraid_ChooseAction_duplicate_again2                  ;A69A10;


;;; $9A12: Instruction list - choose action ;;;
InstList_MiniKraid_ChooseAction_duplicate_again3:
    dw Instruction_MiniKraid_ChooseAction                                ;A69A12;


;;; $9A14: Instruction list - step backwards - facing right ;;;
InstList_MiniKraid_StepBackwards_FacingRight:
    dw $0010,Spritemap_MiniKraid_Stepping_FacingRight_0                  ;A69A14;
    dw Instruction_MiniKraid_Move                                        ;A69A18;
    dw $000C,Spritemap_MiniKraid_Stepping_FacingRight_3                  ;A69A1A;
    dw $0008,Spritemap_MiniKraid_Stepping_FacingRight_2                  ;A69A1E;
    dw $000C,Spritemap_MiniKraid_Stepping_FacingRight_1                  ;A69A22;
    dw Instruction_Common_GotoY                                          ;A69A26;
    dw InstList_MiniKraid_ChooseAction_duplicate_again3                  ;A69A28;


;;; $9A2A: Instruction list - fire spit - facing right ;;;
InstList_MiniKraid_FireSpit_FacingRight:
    dw $0010,Spritemap_MiniKraid_FiringSpit_FacingRight_0                ;A69A2A;
    dw Instruction_MiniKraid_PlayCrySFX                                  ;A69A2E;
    dw $0008,Spritemap_MiniKraid_FiringSpit_FacingRight_1                ;A69A30;
    dw Instruction_MiniKraid_FireSpitRight                               ;A69A34;
    dw $0010,Spritemap_MiniKraid_FiringSpit_FacingRight_2                ;A69A36;
    dw $0008,Spritemap_MiniKraid_FiringSpit_FacingRight_1                ;A69A3A;
    dw Instruction_Common_GotoY                                          ;A69A3E;
    dw InstList_MiniKraid_ChooseAction_duplicate_again2                  ;A69A40;


if !FEATURE_KEEP_UNREFERENCED
;;; $9A42: Unused. Instruction list - standing - facing right ;;;
UNUSED_InstList_MiniKraid_Standing_FacingRight_A69A42:
    dw $7FFF,Spritemap_MiniKraid_FiringSpit_FacingRight_0                ;A69A42;
    dw Instruction_Common_Sleep                                          ;A69A46;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $9A48: Fake Kraid spit velocity table ;;;
MiniKraidSpitVelocityTable_leftward_X1:
    dw $FE00                                                             ;A69A48;
MiniKraidSpitVelocityTable_leftward_Y1:
    dw       $FB00                                                       ;A69A4A;
MiniKraidSpitVelocityTable_leftward_X2:
    dw              $FC00                                                ;A69A4C;
MiniKraidSpitVelocityTable_leftward_Y2:
    dw                    $FB00                                          ;A69A4E;

MiniKraidSpitVelocityTable_rightward_X1:
    dw $0200                                                             ;A69A50;
MiniKraidSpitVelocityTable_rightward_Y1:
    dw       $FB00                                                       ;A69A52;
MiniKraidSpitVelocityTable_rightward_X2:
    dw              $0400                                                ;A69A54;
MiniKraidSpitVelocityTable_rightward_Y2:
    dw                    $FB00                                          ;A69A56;


;;; $9A58: Initialisation AI - enemy $E0FF (fake Kraid) ;;;
InitAI_MiniKraid:
    LDX.W EnemyIndex                                                     ;A69A58;
    LDA.W RandomNumberSeed                                               ;A69A5B;
    AND.W #$0003                                                         ;A69A5E;
    CLC                                                                  ;A69A61;
    ADC.W #$0002                                                         ;A69A62;
    STA.W MiniKraid.stepCounter,X                                        ;A69A65;
    STA.W MiniKraid.spitTimer,X                                          ;A69A68;
    CLC                                                                  ;A69A6B;
    ADC.W #$0040                                                         ;A69A6C;
    STA.L MiniKraid.topSpikeTimer,X                                      ;A69A6F;
    CLC                                                                  ;A69A73;
    ADC.W #$0020                                                         ;A69A74;
    STA.L MiniKraid.middleSpikeTimer,X                                   ;A69A77;
    CLC                                                                  ;A69A7B;
    ADC.W #$FFD0                                                         ;A69A7C;
    STA.L MiniKraid.bottomSpikeTimer,X                                   ;A69A7F;
    LDA.W #$0000                                                         ;A69A83;
    STA.L MiniKraid.spikeTimerIndex,X                                    ;A69A86;
    LDA.W Enemy.properties,X                                             ;A69A8A;
    ORA.W #$2000                                                         ;A69A8D;
    STA.W Enemy.properties,X                                             ;A69A90;
    LDA.W #$0001                                                         ;A69A93;
    STA.W Enemy.instTimer,X                                              ;A69A96;
    STZ.W Enemy.loopCounter,X                                            ;A69A99;
    LDA.W #$FFFC                                                         ;A69A9C;
    STA.W MiniKraid.XVelocity,X                                          ;A69A9F;
    STA.W MiniKraid.direction,X                                          ;A69AA2;
    LDY.W #InstList_MiniKraid_StepForwards_FacingLeft                    ;A69AA5;
    LDA.W Enemy.XPosition,X                                              ;A69AA8;
    SEC                                                                  ;A69AAB;
    SBC.W SamusXPosition                                                 ;A69AAC;
    BPL .keepLeft                                                        ;A69AAF;
    LDA.W #$0004                                                         ;A69AB1;
    STA.W MiniKraid.XVelocity,X                                          ;A69AB4;
    STA.W MiniKraid.direction,X                                          ;A69AB7;
    LDY.W #InstList_MiniKraid_StepForwards_FacingRight                   ;A69ABA;

  .keepLeft:
    TYA                                                                  ;A69ABD;
    STA.W Enemy.instList,X                                               ;A69ABE;
    RTL                                                                  ;A69AC1;


;;; $9AC2: Main AI - enemy $E0FF (fake Kraid) ;;;
MainAI_MiniKraid:
    LDX.W EnemyIndex                                                     ;A69AC2;
    LDA.L MiniKraid.spikeTimerIndex,X                                    ;A69AC5;
    TAY                                                                  ;A69AC9;
    INC                                                                  ;A69ACA;
    INC                                                                  ;A69ACB;
    CMP.W #$0006                                                         ;A69ACC;
    BMI +                                                                ;A69ACF;
    LDA.W #$0000                                                         ;A69AD1;

+   STA.L MiniKraid.spikeTimerIndex,X                                    ;A69AD4;
    JSR.W HandleMiniKraidSpike                                           ;A69AD8;
    RTL                                                                  ;A69ADB;


;;; $9ADC: Handle fake Kraid spike ;;;
HandleMiniKraidSpike:
;; Parameters:
;;     Y: Spike timer index

; Typo at $9B18 >_<;
; LDA $00FFFF will load the low byte from $80:FFFF (85h) and the high byte from $7E:0000 (garbage)
; There's no reason to do this `AND` at all, the zero flag is set appropriately by the call to $A0:AD70
; But because the return value in A is 0 or 1, and because bit 0 of [$80:FFFF] is set, this code happens to work out fine
    PHX                                                                  ;A69ADC;
    TYA                                                                  ;A69ADD;
    STX.B DP_Temp12                                                      ;A69ADE;
    CLC                                                                  ;A69AE0;
    ADC.B DP_Temp12                                                      ;A69AE1;
    TAX                                                                  ;A69AE3;
    LDA.L MiniKraid.topSpikeTimer,X                                      ;A69AE4;
    BEQ .timerExpired                                                    ;A69AE8;
    DEC                                                                  ;A69AEA;
    STA.L MiniKraid.topSpikeTimer,X                                      ;A69AEB;
    PLX                                                                  ;A69AEF;
    RTS                                                                  ;A69AF0;

  .timerExpired:
    LDA.W RandomNumberSeed                                               ;A69AF1;
    AND.W #$003F                                                         ;A69AF4;
    CLC                                                                  ;A69AF7;
    ADC.W #$0010                                                         ;A69AF8;
    STA.L MiniKraid.topSpikeTimer,X                                      ;A69AFB;
    TYA                                                                  ;A69AFF;
    PLX                                                                  ;A69B00;
    STA.L MiniKraid.spikeIndex,X                                         ;A69B01;
    LDY.W #EnemyProjectile_MiniKraidSpikes_Left                          ;A69B05;
    LDA.W MiniKraid.direction,X                                          ;A69B08;
    BMI .keepLeft                                                        ;A69B0B;
    LDY.W #EnemyProjectile_MiniKraidSpikes_Right                         ;A69B0D;

  .keepLeft:
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A69B10;
    JSL.L CheckIfEnemyCenterIsOnScreen                                   ;A69B14;
    AND.L $00FFFF                                                        ;A69B18; >.<
    BNE .return                                                          ;A69B1C;
    LDA.W #$003F                                                         ;A69B1E;
    JSL.L QueueSound_Lib2_Max6                                           ;A69B21;

  .return:
    RTS                                                                  ;A69B25;


;;; $9B26: Instruction - move ;;;
Instruction_MiniKraid_Move:
    PHY                                                                  ;A69B26;
    LDX.W EnemyIndex                                                     ;A69B27;
    LDA.W MiniKraid.spitTimer,X                                          ;A69B2A;
    BEQ +                                                                ;A69B2D;
    DEC.W MiniKraid.spitTimer,X                                          ;A69B2F;

+   DEC.W MiniKraid.stepCounter,X                                        ;A69B32;
    BNE .nonZeroCounter                                                  ;A69B35;
    LDA.W RandomNumberSeed                                               ;A69B37;
    AND.W #$0003                                                         ;A69B3A;
    CLC                                                                  ;A69B3D;
    ADC.W #$0007                                                         ;A69B3E;
    STA.W MiniKraid.stepCounter,X                                        ;A69B41;
    BRA .negateEnemyXVelocity                                            ;A69B44;

  .nonZeroCounter:
    LDA.W MiniKraid.XVelocity,X                                          ;A69B46;
    STA.B DP_Temp14                                                      ;A69B49;
    STZ.B DP_Temp12                                                      ;A69B4B;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A69B4D;
    BCC .noCollision                                                     ;A69B51;

  .negateEnemyXVelocity:
    LDA.W MiniKraid.XVelocity,X                                          ;A69B53;
    EOR.W #$FFFF                                                         ;A69B56;
    INC                                                                  ;A69B59;
    STA.W MiniKraid.XVelocity,X                                          ;A69B5A;

  .noCollision:
    LDA.W #$FFFC                                                         ;A69B5D;
    STA.W MiniKraid.direction,X                                          ;A69B60;
    LDA.W Enemy.XPosition,X                                              ;A69B63;
    SEC                                                                  ;A69B66;
    SBC.W SamusXPosition                                                 ;A69B67;
    BPL .return                                                          ;A69B6A;
    LDA.W #$0004                                                         ;A69B6C;
    STA.W MiniKraid.direction,X                                          ;A69B6F;

  .return:
    PLY                                                                  ;A69B72;
    RTL                                                                  ;A69B73;


;;; $9B74: Instruction - choose action ;;;
Instruction_MiniKraid_ChooseAction:
    LDX.W EnemyIndex                                                     ;A69B74;
    LDA.W MiniKraid.spitTimer,X                                          ;A69B77;
    BNE .step                                                            ;A69B7A;
    LDA.W RandomNumberSeed                                               ;A69B7C;
    AND.W #$0003                                                         ;A69B7F;
    CLC                                                                  ;A69B82;
    ADC.W #$0003                                                         ;A69B83;
    STA.W MiniKraid.spitTimer,X                                          ;A69B86;
    LDY.W #InstList_MiniKraid_FireSpit_FacingRight                       ;A69B89;
    LDA.W MiniKraid.direction,X                                          ;A69B8C;
    BPL .return                                                          ;A69B8F;
    LDY.W #InstList_MiniKraid_FireSpit_FacingLeft                        ;A69B91;
    RTL                                                                  ;A69B94;

  .step:
    LDA.W MiniKraid.direction,X                                          ;A69B95;
    BMI .left                                                            ;A69B98;
    LDY.W #InstList_MiniKraid_StepForwards_FacingRight                   ;A69B9A;
    LDA.W MiniKraid.XVelocity,X                                          ;A69B9D;
    BPL .return                                                          ;A69BA0;
    LDY.W #InstList_MiniKraid_StepBackwards_FacingRight                  ;A69BA2;

  .return:
    RTL                                                                  ;A69BA5;

  .left:
    LDY.W #InstList_MiniKraid_StepForwards_FacingLeft                    ;A69BA6;
    LDA.W MiniKraid.XVelocity,X                                          ;A69BA9;
    BMI .return                                                          ;A69BAC;
    LDY.W #InstList_MiniKraid_StepBackwards_FacingLeft                   ;A69BAE;
    RTL                                                                  ;A69BB1;


;;; $9BB2: Instruction - play fake Kraid cry ;;;
Instruction_MiniKraid_PlayCrySFX:
; Another AND instruction typo (see HandleMiniKraidSpike)
    JSL.L CheckIfEnemyCenterIsOnScreen                                   ;A69BB2;
    AND.L $00FFFF                                                        ;A69BB6; >.<
    BNE .return                                                          ;A69BBA;
    LDA.W #$0016                                                         ;A69BBC;
    JSL.L QueueSound_Lib2_Max6                                           ;A69BBF;

  .return:
    RTL                                                                  ;A69BC3;


;;; $9BC4: Instruction - fire spit left ;;;
Instruction_MiniKraid_FireSpitLeft:
    PHY                                                                  ;A69BC4;
    LDY.W #$0000                                                         ;A69BC5;
    LDA.W #$FFFC                                                         ;A69BC8; fallthrough to FireMiniKraidSpit_Common


;;; $9BCB: Fire fake Kraid spit ;;;
FireMiniKraidSpit_Common:
;; Parameters:
;;     A: Spit X offset
;;     Y: Spit velocity table index
    LDX.W EnemyIndex                                                     ;A69BCB;
    PHY                                                                  ;A69BCE;
    PHX                                                                  ;A69BCF;
    STA.L MiniKraid.spitXOffset,X                                        ;A69BD0;
    LDA.W MiniKraidSpitVelocityTable_leftward_X1,Y                       ;A69BD4;
    STA.L MiniKraid.spitXVelocity,X                                      ;A69BD7;
    LDA.W MiniKraidSpitVelocityTable_leftward_Y1,Y                       ;A69BDB;
    STA.L MiniKraid.spitYVelocity,X                                      ;A69BDE;
    LDY.W #EnemyProjectile_MiniKraidSpit                                 ;A69BE2;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A69BE5;
    PLX                                                                  ;A69BE9;
    PLY                                                                  ;A69BEA;
    LDA.W MiniKraidSpitVelocityTable_leftward_X2,Y                       ;A69BEB;
    STA.L MiniKraid.spitXVelocity,X                                      ;A69BEE;
    LDA.W MiniKraidSpitVelocityTable_leftward_Y2,Y                       ;A69BF2;
    STA.L MiniKraid.spitYVelocity,X                                      ;A69BF5;
    LDY.W #EnemyProjectile_MiniKraidSpit                                 ;A69BF9;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A69BFC;
    PLY                                                                  ;A69C00;
    RTL                                                                  ;A69C01;


;;; $9C02: Instruction - fire spit right ;;;
Instruction_MiniKraid_FireSpitRight:
    PHY                                                                  ;A69C02;
    LDY.W #$0008                                                         ;A69C03;
    LDA.W #$0004                                                         ;A69C06;
    BRA FireMiniKraidSpit_Common                                         ;A69C09;


if !FEATURE_KEEP_UNREFERENCED
;;; $9C0B: Unused. Fake Kraid power bomb reaction ;;;
UNUSED_PowerBombReaction_MiniKraid_A69C0B:
    LDX.W EnemyIndex                                                     ;A69C0B;
    LDA.W Enemy.XPosition,X                                              ;A69C0E;
    STA.L EnemyProjectileData_SpecialDeathItemDropXOriginPosition        ;A69C11;
    LDA.W Enemy.YPosition,X                                              ;A69C15;
    STA.L EnemyProjectileData_SpecialDeathItemDropYOriginPosition        ;A69C18;
    JSL.L NormalEnemyPowerBombAI_NoDeathCheck_External                   ;A69C1C;
    BRA Reaction_MiniKraid_Common                                        ;A69C20;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $9C22: Enemy touch - enemy $E0FF (fake Kraid) ;;;
EnemyTouch_MiniKraid:
    LDX.W EnemyIndex                                                     ;A69C22;
    LDA.W Enemy.XPosition,X                                              ;A69C25;
    STA.L EnemyProjectileData_SpecialDeathItemDropXOriginPosition        ;A69C28;
    LDA.W Enemy.YPosition,X                                              ;A69C2C;
    STA.L EnemyProjectileData_SpecialDeathItemDropYOriginPosition        ;A69C2F;
    JSL.L NormalEnemyTouchAI_NoDeathCheck_External                       ;A69C33;
    BRA Reaction_MiniKraid_Common                                        ;A69C37;


;;; $9C39: Power bomb reaction / enemy shot - enemy $E0FF (fake Kraid) ;;;
EnemyShot_PowerBombReaction_MiniKraid:
; Bug: the power bomb reaction should be pointing to UNUSED_PowerBombReaction_MiniKraid_A69C0B
; When this routine is called for power bomb reaction, $A0:A6A7 is called with garbage for the projectile index ($18A6)
    LDX.W EnemyIndex                                                     ;A69C39;
    LDA.W Enemy.XPosition,X                                              ;A69C3C;
    STA.L EnemyProjectileData_SpecialDeathItemDropXOriginPosition        ;A69C3F;
    LDA.W Enemy.YPosition,X                                              ;A69C43;
    STA.L EnemyProjectileData_SpecialDeathItemDropYOriginPosition        ;A69C46;
    JSL.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External     ;A69C4A;
    BRA Reaction_MiniKraid_Common                                        ;A69C4E; >.<


;;; $9C50: Fake Kraid reaction ;;;
Reaction_MiniKraid_Common:
    LDX.W EnemyIndex                                                     ;A69C50;
    LDA.W Enemy.health,X                                                 ;A69C53;
    BNE .return                                                          ;A69C56;
    LDA.W #$0003                                                         ;A69C58;
    JSL.L EnemyDeath                                                     ;A69C5B;
    JSL.L MiniKraidDeathItemDropRoutine                                  ;A69C5F;

  .return:
    RTL                                                                  ;A69C63;


;;; $9C64: Fake Kraid spritemaps ;;;
Spritemap_MiniKraid_Stepping_FacingLeft_0:
    dw $0010                                                             ;A69C64;
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
    dw $0010                                                             ;A69CB6;
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
    dw $0010                                                             ;A69D08;
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
    dw $0010                                                             ;A69D5A;
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
    dw $0010                                                             ;A69DAC;
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
    dw $0010                                                             ;A69DFE;
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
    dw $0010                                                             ;A69E50;
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
    dw $0010                                                             ;A69EA2;
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
    dw $0010                                                             ;A69EF4;
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
    dw $0010                                                             ;A69F46;
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
    dw $0010                                                             ;A69F98;
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
    dw $0010                                                             ;A69FEA;
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
    dw $0010                                                             ;A6A03C;
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
    dw $0010                                                             ;A6A08E;
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
    dw $0001                                                             ;A6A0E0;
    %spritemapEntry(0, $1FD, $FD, 0, 0, 2, 0, $11F)

UNUSED_Spritemap_MiniKraid_A6A0E7:
    dw $0001                                                             ;A6A0E7;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $10F)

UNUSED_Spritemap_MiniKraid_A6A0EE:
    dw $0001                                                             ;A6A0EE;
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 0, $10F)
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $A0F5: Initialisation AI - enemy $E13F/$E17F (Ridley) ;;;
InitAI_Ridley:
    LDX.W AreaIndex                                                      ;A6A0F5;
    LDA.L SRAMMirror_Boss,X                                              ;A6A0F8;
    AND.W #$0001                                                         ;A6A0FC;
    BEQ .notDead                                                         ;A6A0FF;
    LDA.W Enemy.properties                                               ;A6A101;
    AND.W #$FFFF                                                         ;A6A104; >_<
    ORA.W #$0700                                                         ;A6A107;
    STA.W Enemy.properties                                               ;A6A10A;
    RTL                                                                  ;A6A10D;

  .notDead:
    PHB                                                                  ;A6A10E;
    PEA.W $7E7E                                                          ;A6A10F;
    PLB                                                                  ;A6A112;
    PLB                                                                  ;A6A113;
    LDA.W #$0000                                                         ;A6A114;
    LDX.W #$0FFE                                                         ;A6A117;

  .loopClearExtraRAM:
    STA.W $2000,X                                                        ;A6A11A;
    DEX                                                                  ;A6A11D;
    DEX                                                                  ;A6A11E;
    BPL .loopClearExtraRAM                                               ;A6A11F;
    PLB                                                                  ;A6A121;
    JSL.L DisableMinimap_MarkBossRoomTilesExplored                       ;A6A122;
    STZ.W Enemy.init0                                                    ;A6A126;
    STZ.W Enemy.init1                                                    ;A6A129;
    LDA.W #InstList_Ridley_FacingLeft_Initial                            ;A6A12C;
    JSR.W SetRidleyInstList                                              ;A6A12F;
    LDA.W #$0E00                                                         ;A6A132;
    STA.W Enemy.palette                                                  ;A6A135;
    STA.L Ridley.wingTailPalette                                         ;A6A138;
    LDA.W Enemy.properties2                                              ;A6A13C;
    ORA.W #$0004                                                         ;A6A13F;
    STA.W Enemy.properties2                                              ;A6A142;
    LDA.W #$0000                                                         ;A6A145;
    STA.L Ridley.status                                                  ;A6A148;
    STA.L Ridley.hitCounterCeres                                         ;A6A14C;
    STZ.W EarthquakeType                                                 ;A6A150;
    STZ.W EarthquakeTimer                                                ;A6A153;
    JSR.W InitializeTailParts                                            ;A6A156;
    JSR.W InitializeRibAnimation                                         ;A6A159;
    LDA.W AreaIndex                                                      ;A6A15C;
    CMP.W #$0002                                                         ;A6A15F;
    BEQ .norfair                                                         ;A6A162;
    JMP.W .ceres                                                         ;A6A164;

  .norfair:
    LDA.W Enemy.properties                                               ;A6A167;
    ORA.W #$1400                                                         ;A6A16A;
    STA.W Enemy.properties                                               ;A6A16D;
    LDA.W #$0060                                                         ;A6A170;
    STA.W Enemy.XPosition                                                ;A6A173;
    LDA.W #$018A                                                         ;A6A176;
    STA.W Enemy.YPosition                                                ;A6A179;
    LDA.W #Function_Ridley_Startup_Liftoff_FacingRight                   ;A6A17C; >_<
    LDA.W #Function_Ridley_Startup_FirstRun                              ;A6A17F;
    STA.W Ridley.function                                                ;A6A182;
    STZ.W Ridley.XSpeed                                                  ;A6A185;
    STZ.W Ridley.YSpeed                                                  ;A6A188;
    LDA.W #$0005                                                         ;A6A18B;
    STA.W Enemy.layer                                                    ;A6A18E;
    LDA.W #$0000                                                         ;A6A191;
    STA.L Ridley.status                                                  ;A6A194; >.<
    INC                                                                  ;A6A198;
    STA.L Ridley.activeFlag                                              ;A6A199;
    LDA.W #$0040                                                         ;A6A19D;
    STA.L Ridley.topBoundary                                             ;A6A1A0;
    LDA.W #$01A0                                                         ;A6A1A4;
    STA.L Ridley.bottomBoundary                                          ;A6A1A7;
    LDA.W #$0040                                                         ;A6A1AB;
    STA.L Ridley.leftBoundary                                            ;A6A1AE;
    LDA.W #$00E0                                                         ;A6A1B2;
    STA.L Ridley.rightBoundary                                           ;A6A1B5;
    LDA.W #$0002                                                         ;A6A1B9;
    STA.L Ridley.facingDirection                                         ;A6A1BC;
    LDA.W #$0078                                                         ;A6A1C0;
    STA.L Ridley.tailTipDamage                                           ;A6A1C3;
    LDY.W #Palette_NorfairRidleyInit                                     ;A6A1C7;
    LDX.W #$0140                                                         ;A6A1CA;
    LDA.W #$0020                                                         ;A6A1CD;
    JSL.L WriteAColorsFromYToTargetColorIndexX                           ;A6A1D0;
    LDX.W #$00E2                                                         ;A6A1D4;
    LDX.W #$0000                                                         ;A6A1D7;
    LDY.W #$000F                                                         ;A6A1DA;
    LDA.W #$0000                                                         ;A6A1DD;

  .loopClearPalettes:
    STA.L TargetPalettes_BGP7+2,X                                        ;A6A1E0;
    STA.L TargetPalettes_SpriteP7+2,X                                    ;A6A1E4;
    INX                                                                  ;A6A1E8;
    INX                                                                  ;A6A1E9;
    DEY                                                                  ;A6A1EA;
    BNE .loopClearPalettes                                               ;A6A1EB;
    RTL                                                                  ;A6A1ED;

  .ceres:
    LDA.W Enemy.properties                                               ;A6A1EE;
    ORA.W #$1400                                                         ;A6A1F1;
    STA.W Enemy.properties                                               ;A6A1F4;
    LDA.W #$00BA                                                         ;A6A1F7;
    STA.W Enemy.XPosition                                                ;A6A1FA;
    LDA.W #$00A9                                                         ;A6A1FD;
    STA.W Enemy.YPosition                                                ;A6A200;
    LDA.W #$0000                                                         ;A6A203;
    STA.W CeresStatus                                                    ;A6A206;
    STA.L Ridley.facingDirection                                         ;A6A209;
    STA.L Ridley.activeFlag                                              ;A6A20D;
    INC                                                                  ;A6A211;
    STA.L Ridley.tailRotationSpeed                                       ;A6A212;
    LDA.W #$000F                                                         ;A6A216;
    STA.L Ridley.tailTipDamage                                           ;A6A219;
    LDA.W #Function_Ridley_Startup_FirstRun                              ;A6A21D;
    STA.W Ridley.function                                                ;A6A220;
    STZ.W Ridley.XSpeed                                                  ;A6A223;
    STZ.W Ridley.YSpeed                                                  ;A6A226;
    LDA.W #$FFE0                                                         ;A6A229;
    STA.L Ridley.topBoundary                                             ;A6A22C;
    LDA.W #$00B0                                                         ;A6A230;
    STA.L Ridley.bottomBoundary                                          ;A6A233;
    LDA.W #$0028                                                         ;A6A237;
    STA.L Ridley.leftBoundary                                            ;A6A23A;
    LDA.W #$00E0                                                         ;A6A23E;
    STA.L Ridley.rightBoundary                                           ;A6A241;
    LDY.W #Palette_CeresRidleyInit                                       ;A6A245;
    LDX.W #$0140                                                         ;A6A248;
    LDA.W #$0020                                                         ;A6A24B;
    JSL.L WriteAColorsFromYToTargetColorIndexX                           ;A6A24E;
    LDX.W #$01E2                                                         ;A6A252;
    LDY.W #$000F                                                         ;A6A255;
    LDA.W #$0000                                                         ;A6A258;

  .loopClearSpritePalette7:
    STA.L TargetPalettes_BGP0,X                                          ;A6A25B;
    INX                                                                  ;A6A25F;
    INX                                                                  ;A6A260;
    DEY                                                                  ;A6A261;
    BNE .loopClearSpritePalette7                                         ;A6A262;
    LDA.W #InstList_BabyMetroidCutscene_0                                ;A6A264;
    STA.L Ridley.BabyMetroidInstList                                     ;A6A267;
    LDA.W #$0001                                                         ;A6A26B;
    STA.L Ridley.BabyMetroidInstTimer                                    ;A6A26E;
    LDA.W #UpdateBabyMetroidPosition_CarriedInArms                       ;A6A272;
    STA.L Ridley.BabyMetroidFunction                                     ;A6A275;
    LDA.W #$0005                                                         ;A6A279;
    STA.L Ridley.wingFlapFrame                                           ;A6A27C;
    LDA.W #$0000                                                         ;A6A280;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;A6A283;
    RTL                                                                  ;A6A287;


;;; $A288: Main AI - enemy $E13F (Ceres Ridley) ;;;
MainAI_RidleyCeres:
    LDA.W #$7FFF                                                         ;A6A288;
    STA.W Enemy.health                                                   ;A6A28B;
    PEA.W .manualReturn-1                                                ;A6A28E;
    JMP.W (Ridley.function)                                              ;A6A291;

  .manualReturn:
    LDA.W CeresStatus                                                    ;A6A294;
    BNE .return                                                          ;A6A297;
    LDA.L Ridley.activeFlag                                              ;A6A299;
    BEQ HandleBabyMetroidCapsuleInteractions                             ;A6A29D;
    JSR.W MakeRidleysWingsAndTailFlashWhenHit                            ;A6A29F;
    JSR.W HandleMovementAndMainBodyWallCollisions                        ;A6A2A2;
    JSR.W HandleWingFlapping                                             ;A6A2A5;
    JSR.W RNGChanceToChooseNewTailSwingDelay                             ;A6A2A8;
    JSR.W HandleRidleyTailAI                                             ;A6A2AB;
    JSR.W DetermineAndSetCeresRidleysColorPalette                        ;A6A2AE;
    JSR.W AnimateRidleysRibs                                             ;A6A2B1;
    JSR.W DrawRidleyTail                                                 ;A6A2B4;
    JSR.W DrawRidleysWings                                               ;A6A2B7;
    BRA HandleBabyMetroidCapsuleInteractions                             ;A6A2BA;


  .return:
    RTL                                                                  ;A6A2BC;


;;; $A2BD:  ;;;
RNGChanceToChooseNewTailSwingDelay:
; 1/100 chance of setting 7E:201E to 8-17 (all hex numbers)
    LDA.W RandomNumberSeed                                               ;A6A2BD;
    CMP.W #$FF00                                                         ;A6A2C0;
    BCC .return                                                          ;A6A2C3;
    LDA.W RandomNumberSeed                                               ;A6A2C5; >.<
    AND.W #$000F                                                         ;A6A2C8;
    ADC.W #$0007                                                         ;A6A2CB;
    STA.L Ridley.movementThreshold                                       ;A6A2CE;

  .return:
    RTS                                                                  ;A6A2D2;


;;; $A2D3: Hurt AI - enemy $E13F (Ceres Ridley) ;;;
HurtAI_RidleyCeres:
    JSR.W MakeRidleysWingsAndTailFlashWhenHit                            ;A6A2D3;
    JSR.W DrawRidleyTail                                                 ;A6A2D6;
    JSR.W DrawRidleysWings                                               ;A6A2D9; fallthrough to HandleBabyMetroidCapsuleInteractions


;;; $A2DC:  ;;;
HandleBabyMetroidCapsuleInteractions:
    JSR.W HandleCarryingBabyMetroid                                      ;A6A2DC;
    LDA.L Ridley.activeFlag                                              ;A6A2DF;
    BEQ EnemyGraphicsDrawnHook_RidleyCeres_DrawBabyMetroidAndDoor        ;A6A2E3;
    LDA.W #EnemyGraphicsDrawnHook_RidleyCeres_DrawBabyMetroidAndDoor>>8&$FF00 ;A6A2E5;
    STA.W EnemyGraphicsDrawnHook+1                                       ;A6A2E8;
    LDA.W #EnemyGraphicsDrawnHook_RidleyCeres_DrawBabyMetroidAndDoor     ;A6A2EB;
    STA.W EnemyGraphicsDrawnHook                                         ;A6A2EE;
    RTL                                                                  ;A6A2F1;


;;; $A2F2: Enemy graphics drawn hook - Ceres Ridley - draw Baby Metroid and door ;;;
EnemyGraphicsDrawnHook_RidleyCeres_DrawBabyMetroidAndDoor:
; Enemy 1 is the Ceres door
    LDA.W CeresStatus                                                    ;A6A2F2;
    BNE .skipBaby                                                        ;A6A2F5;
    JSR.W DrawBabyMetroid                                                ;A6A2F7;

  .skipBaby:
    LDA.W CeresDoor[1].drawnByRidleyFlag                                 ;A6A2FA;
    BEQ .return                                                          ;A6A2FD;
    LDA.W EarthquakeTimer                                                ;A6A2FF;
    AND.W #$0003                                                         ;A6A302;
    TAX                                                                  ;A6A305;
    LDA.W CeresDoorOffsetsDuringEarthquake,X                             ;A6A306;
    CLC                                                                  ;A6A309;
    ADC.W Enemy[1].XPosition                                             ;A6A30A;
    STA.B $14                                                            ;A6A30D;
    LDA.W Enemy[1].YPosition                                             ;A6A30F;
    STA.B $12                                                            ;A6A312;
    LDA.W #$0400                                                         ;A6A314;
    STA.B $16                                                            ;A6A317;
    LDY.W #Spritemap_CeresDoor                                           ;A6A319;
    JSL.L AddSpritemapToOAM                                              ;A6A31C;

  .return:
    RTL                                                                  ;A6A320;


;;; $A321: Ceres Ridley door X offsets during earthquake ;;;
CeresDoorOffsetsDuringEarthquake:
; Actually, this table is being indexed in one byte increments, meaning these values should have been 8-bit.
; Only the lower 8 bits are used in practice, so the resulting actual read values are as if:
;    db 00, 00, FC, FF
    dw $0000,$FFFC,$FFFF,$0003                                           ;A6A321;


;;; $A329: Spritemap - Ceres Ridley door ;;;
Spritemap_CeresDoor:
    dw $0008                                                             ;A6A329;
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
    RTL                                                                  ;A6A353;


;;; $A354: Ridley function ;;;
Function_Ridley_ResetSpeeds:
; Clear speeds, that's it
    STZ.W Ridley.XSpeed                                                  ;A6A354;
    STZ.W Ridley.YSpeed                                                  ;A6A357;
    RTS                                                                  ;A6A35A;


;;; $A35B: Ridley function ;;;
Function_Ridley_Startup_FirstRun:
; Startup, 1st run
    LDA.W DoorTransitionFlagEnemiesPause                                 ;A6A35B;
    BNE Function_Ridley_Startup_InitalWait_return                        ;A6A35E;
    LDA.W #Function_Ridley_Startup_InitalWait                            ;A6A360;
    STA.W Ridley.function                                                ;A6A363;
    LDA.W #$0200                                                         ;A6A366;
    LDY.W AreaIndex                                                      ;A6A369;
    CPY.W #$0002                                                         ;A6A36C;
    BNE .notNorfar                                                       ;A6A36F;
    LDA.W #$00AA                                                         ;A6A371;

  .notNorfar:
    STA.W Ridley.functionTimer                                           ;A6A374; fallthrough to Function_Ridley_Startup_InitalWait


;;; $A377: Ridley function ;;;
Function_Ridley_Startup_InitalWait:
; Startup, initial wait
    DEC.W Ridley.functionTimer                                           ;A6A377;
    BPL .return                                                          ;A6A37A;
    LDA.W #Function_Ridley_Startup_EyesAppear_Wait                       ;A6A37C;
    STA.W Ridley.function                                                ;A6A37F;
    STZ.W Enemy.var4                                                     ;A6A382;
    STZ.W Ridley.functionTimer                                           ;A6A385;

  .return:
    RTS                                                                  ;A6A388;


;;; $A389: Ridley function ;;;
Function_Ridley_Startup_EyesAppear_Wait:
; Startup, eyes appear + wait
    LDA.W Enemy.var4                                                     ;A6A389;
    BMI .return                                                          ;A6A38C;
    TAY                                                                  ;A6A38E;
    INC.W Ridley.functionTimer                                           ;A6A38F;
    LDA.W Ridley.functionTimer                                           ;A6A392;
    CMP.W #$0001                                                         ;A6A395;
    BCC .return                                                          ;A6A398;
    STZ.W Ridley.functionTimer                                           ;A6A39A;
    TYX                                                                  ;A6A39D;
    LDA.W CeresRidleyEyeFadeInIndices,X                                  ;A6A39E;
    AND.W #$00FF                                                         ;A6A3A1;
    CMP.W #$00FF                                                         ;A6A3A4;
    BEQ .done                                                            ;A6A3A7;
    STA.B $12                                                            ;A6A3A9;
    ASL                                                                  ;A6A3AB;
    CLC                                                                  ;A6A3AC;
    ADC.B $12                                                            ;A6A3AD;
    ASL                                                                  ;A6A3AF;
    TAY                                                                  ;A6A3B0;
    INX                                                                  ;A6A3B1;
    STX.W Enemy.var4                                                     ;A6A3B2;
    LDX.W #$01F8                                                         ;A6A3B5;
    LDA.W CeresRidleyEyeFadeInColors_0,Y                                 ;A6A3B8;
    STA.L Palettes,X                                                     ;A6A3BB;
    LDA.W CeresRidleyEyeFadeInColors_1,Y                                 ;A6A3BF;
    STA.L Palettes+2,X                                                   ;A6A3C2;
    LDA.W CeresRidleyEyeFadeInColors_2,Y                                 ;A6A3C6;
    STA.L Palettes+4,X                                                   ;A6A3C9;

  .return:
    RTS                                                                  ;A6A3CD;

  .done:
    STZ.W Enemy.var4                                                     ;A6A3CE;
    LDA.W #Function_Ridley_Startup_MainBodyAppears                       ;A6A3D1;
    STA.W Ridley.function                                                ;A6A3D4;
    LDA.W #$0001                                                         ;A6A3D7;
    STA.L Ridley.activeFlag                                              ;A6A3DA;
    RTS                                                                  ;A6A3DE;


;;; $A3DF: Ridley function ;;;
Function_Ridley_Startup_MainBodyAppears:
; Startup, main body appears
    INC.W Ridley.functionTimer                                           ;A6A3DF;
    LDA.W Ridley.functionTimer                                           ;A6A3E2;
    CMP.W #$0002                                                         ;A6A3E5;
    BCC .return                                                          ;A6A3E8;
    STZ.W Ridley.functionTimer                                           ;A6A3EA;
    LDY.W Enemy.var4                                                     ;A6A3ED;
    LDA.W #$0122                                                         ;A6A3F0;
    STA.B $12                                                            ;A6A3F3;
    LDA.W #$01E2                                                         ;A6A3F5;
    STA.B $14                                                            ;A6A3F8;
    LDA.W #$000B                                                         ;A6A3FA;

  .loop:
    PHA                                                                  ;A6A3FD;
    LDA.W Palette_Ridley_FadeIn,Y                                        ;A6A3FE;
    LDX.B $12                                                            ;A6A401;
    STA.L Palettes,X                                                     ;A6A403;
    LDX.B $14                                                            ;A6A407;
    STA.L Palettes,X                                                     ;A6A409;
    INY                                                                  ;A6A40D;
    INY                                                                  ;A6A40E;
    INC.B $12                                                            ;A6A40F;
    INC.B $12                                                            ;A6A411;
    INC.B $14                                                            ;A6A413;
    INC.B $14                                                            ;A6A415;
    PLA                                                                  ;A6A417;
    DEC                                                                  ;A6A418;
    BNE .loop                                                            ;A6A419;
    CPY.W #$0160                                                         ;A6A41B;
    BCS .done                                                            ;A6A41E;
    STY.W Enemy.var4                                                     ;A6A420;

  .return:
    RTS                                                                  ;A6A423;

  .done:
    LDA.W AreaIndex                                                      ;A6A424;
    CMP.W #$0002                                                         ;A6A427;
    BNE .notCeres                                                        ;A6A42A;
    LDA.W #$0002                                                         ;A6A42C;
    STA.W Enemy.layer                                                    ;A6A42F;

  .notCeres:
    LDA.W Enemy.properties                                               ;A6A432;
    AND.W #$FBFF                                                         ;A6A435;
    STA.W Enemy.properties                                               ;A6A438;
    LDY.W #$0000                                                         ;A6A43B;
    STY.W Enemy.var4                                                     ;A6A43E;
    LDA.W #Function_Ridley_Startup_RidleyRoars                           ;A6A441;
    STA.W Ridley.function                                                ;A6A444;
    LDA.W #$0004                                                         ;A6A447;
    STA.W Ridley.functionTimer                                           ;A6A44A;
    LDA.W #$0005                                                         ;A6A44D;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;A6A450;
    RTS                                                                  ;A6A454;


;;; $A455: Ridley function ;;;
Function_Ridley_Startup_RidleyRoars:
; Startup, Ridley roars
    DEC.W Ridley.functionTimer                                           ;A6A455;
    BPL .return                                                          ;A6A458;
    LDA.W #InstList_Ridley_FacingLeft_OpeningRoar                        ;A6A45A;
    JSR.W SetRidleyInstList                                              ;A6A45D;
    STZ.W Ridley.functionTimer                                           ;A6A460;
    LDA.W #Function_Ridley_Startup_ColorBGInNorfair_RaiseAcid_MainAI     ;A6A463;
    STA.W Ridley.function                                                ;A6A466;
    LDA.W AreaIndex                                                      ;A6A469;
    CMP.W #$0002                                                         ;A6A46C;
    BEQ .return                                                          ;A6A46F;
    LDA.W #$00FC                                                         ;A6A471;
    STA.W Ridley.functionTimer                                           ;A6A474;

  .return:
    RTS                                                                  ;A6A477;


;;; $A478: Ridley function ;;;
Function_Ridley_Startup_ColorBGInNorfair_RaiseAcid_MainAI:
; Startup, color background in Norfair, raise acid, start main AI
    LDA.W AreaIndex                                                      ;A6A478;
    CMP.W #$0002                                                         ;A6A47B;
    BNE .ceres                                                           ;A6A47E;
    DEC.W Ridley.functionTimer                                           ;A6A480;
    BPL Function_Ridley_Startup_RidleyRoars_return                       ;A6A483;
    LDA.W #$0002                                                         ;A6A485;
    STA.W Ridley.functionTimer                                           ;A6A488;
    LDA.W Enemy.var4                                                     ;A6A48B;
    INC                                                                  ;A6A48E;
    STA.W Enemy.var4                                                     ;A6A48F;
    DEC                                                                  ;A6A492;
    JSR.W AdjustRidleyBackgroundColorsIfNecessary                        ;A6A493;
    BCC Function_Ridley_Startup_RidleyRoars_return                       ;A6A496;
    LDA.W #$01B8                                                         ;A6A498;
    STA.W FX_TargetYPosition                                             ;A6A49B;
    LDA.W #$FFA0                                                         ;A6A49E;
    STA.W FX_YSubVelocity                                                ;A6A4A1;
    LDA.W #$0020                                                         ;A6A4A4;
    STA.W FX_Timer                                                       ;A6A4A7;
    BRA .merge                                                           ;A6A4AA;

  .ceres:
    DEC.W Ridley.functionTimer                                           ;A6A4AC;
    BPL Function_Ridley_Startup_RidleyRoars_return                       ;A6A4AF;

  .merge:
    STZ.W Enemy.var4                                                     ;A6A4B1;
    LDA.W #InstList_RidleyCeres_FacingLeft_FlyUp_StartMainAI             ;A6A4B4;
    JSR.W SetRidleyInstList                                              ;A6A4B7;
    LDA.W #$0008                                                         ;A6A4BA;
    STA.L Ridley.wingFlapSpeed                                           ;A6A4BD;
    STA.L Ridley.wingFlapCounter                                         ;A6A4C1;
    JSR.W SetAllTailPartsToMoving                                        ;A6A4C5;
    LDA.W #$0001                                                         ;A6A4C8;
    STA.L Ridley.tailAIIndex                                             ;A6A4CB;
    LDA.W #Function_Ridley_ResetSpeeds                                   ;A6A4CF;
    STA.W Ridley.function                                                ;A6A4D2;
    RTS                                                                  ;A6A4D5;


;;; $A4D6:  ;;;
AdjustRidleyBackgroundColorsIfNecessary:
; Adjust background colors if necessary
    ASL                                                                  ;A6A4D6;
    TAX                                                                  ;A6A4D7;
    LDY.W .pointers,X                                                    ;A6A4D8;
    BNE .adjust                                                          ;A6A4DB;
    SEC                                                                  ;A6A4DD;
    RTS                                                                  ;A6A4DE;

  .adjust:
    LDX.W #$00E2                                                         ;A6A4DF;
    LDA.W #$000E                                                         ;A6A4E2;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;A6A4E5;
    CLC                                                                  ;A6A4E9;
    RTS                                                                  ;A6A4EA;

  .pointers:
    dw .palette0                                                         ;A6A4EB;
    dw .palette1                                                         ;A6A4ED;
    dw .palette2                                                         ;A6A4EF;
    dw .palette3                                                         ;A6A4F1;
    dw .palette4                                                         ;A6A4F3;
    dw .palette5                                                         ;A6A4F5;
    dw .palette6                                                         ;A6A4F7;
    dw .palette7                                                         ;A6A4F9;
    dw .palette8                                                         ;A6A4FB;
    dw .palette9                                                         ;A6A4FD;
    dw .paletteA                                                         ;A6A4FF;
    dw .paletteB                                                         ;A6A501;
    dw .paletteC                                                         ;A6A503;
    dw .paletteD                                                         ;A6A505;
    dw .paletteE                                                         ;A6A507;
    dw $0000                                                             ;A6A509;

  .palette0:
    dw $0001,$0001,$0001,$0000,$0000,$0000,$0000,$0001                   ;A6A50B;
    dw $0000,$0000,$0000,$0000,$0000,$0842                               ;A6A51B;

  .palette1:
    dw $0023,$0003,$0003,$0001,$0001,$0000,$0000,$0001                   ;A6A527;
    dw $0001,$0000,$0000,$0001,$0001,$1084                               ;A6A537;

  .palette2:
    dw $0044,$0024,$0004,$0402,$0001,$0000,$0000,$0002                   ;A6A543;
    dw $0001,$0000,$0000,$0001,$0001,$18C6                               ;A6A553;

  .palette3:
    dw $0065,$0025,$0005,$0403,$0002,$0001,$0000,$0003                   ;A6A55F;
    dw $0002,$0001,$0000,$0002,$0002,$2108                               ;A6A56F;

  .palette4:
    dw $0087,$0047,$0007,$0404,$0402,$0001,$0000,$0004                   ;A6A57B;
    dw $0003,$0001,$0000,$0402,$0003,$294A                               ;A6A58B;

  .palette5:
    dw $0088,$0048,$0008,$0804,$0403,$0001,$0000,$0005                   ;A6A597;
    dw $0003,$0001,$0000,$0403,$0003,$318C                               ;A6A5A7;

  .palette6:
    dw $00AA,$004A,$002A,$0805,$0403,$0001,$0000,$0406                   ;A6A5B3;
    dw $0004,$0001,$0000,$0403,$0004,$39CE                               ;A6A5C3;

  .palette7:
    dw $00CB,$006B,$002B,$0806,$0404,$0002,$0000,$0407                   ;A6A5CF;
    dw $0004,$0002,$0000,$0404,$0004,$4210                               ;A6A5DF;

  .palette8:
    dw $00ED,$006D,$002D,$0C07,$0404,$0002,$0000,$0408                   ;A6A5EB;
    dw $0005,$0002,$0000,$0404,$0005,$4A52                               ;A6A5FB;

  .palette9:
    dw $010E,$008E,$002E,$0C08,$0805,$0002,$0000,$0409                   ;A6A607;
    dw $0006,$0002,$0000,$0805,$0006,$5294                               ;A6A617;

  .paletteA:
    dw $0110,$0090,$0030,$0C08,$0805,$0003,$0000,$040A                   ;A6A623;
    dw $0006,$0003,$0000,$0805,$0006,$5AD6                               ;A6A633;

  .paletteB:
    dw $0131,$0091,$0031,$1009,$0806,$0003,$0000,$040B                   ;A6A63F;
    dw $0007,$0003,$0000,$0806,$0007,$6318                               ;A6A64F;

  .paletteC:
    dw $0153,$00B3,$0033,$100A,$0807,$0003,$0000,$040C                   ;A6A65B;
    dw $0007,$0003,$0000,$0807,$0007,$6B5A                               ;A6A66B;

  .paletteD:
    dw $0574,$04B4,$0434,$100B,$0807,$0403,$0000,$040D                   ;A6A677;
    dw $0408,$0003,$0000,$0807,$0408,$77BD                               ;A6A687;

  .paletteE:
    dw $0596,$04D6,$0456,$140C,$0C08,$0404,$0000,$080E                   ;A6A693;
    dw $0409,$0004,$0000,$0C08,$0409,$7FFF                               ;A6A6A3;


;;; $A6AF: Ridley function ;;;
Function_RidleyCeres_StartupLiftoff_FacingLeft:
; Startup liftoff, facing left (Ceres)
    LDA.W Ridley.YSpeed                                                  ;A6A6AF;
    CLC                                                                  ;A6A6B2;
    ADC.W #$FFF0                                                         ;A6A6B3;
    STA.W Ridley.YSpeed                                                  ;A6A6B6;
    LDA.W Enemy.YPosition                                                ;A6A6B9;
    CMP.W #$0070                                                         ;A6A6BC;
    BMI .reachedTarget                                                   ;A6A6BF;
    RTS                                                                  ;A6A6C1;

  .reachedTarget:
    LDA.W #Function_RidleyCeres_StartupLiftoff_FacingLeft_SlowingDown    ;A6A6C2;
    STA.W Ridley.function                                                ;A6A6C5; fallthrough to Function_RidleyCeres_StartupLiftoff_FacingLeft_SlowingDown


;;; $A6C8: Ridley function ;;;
Function_RidleyCeres_StartupLiftoff_FacingLeft_SlowingDown:
; Startup liftoff, facing left and slowing down (Ceres)
    LDA.W Ridley.YSpeed                                                  ;A6A6C8;
    CLC                                                                  ;A6A6CB;
    ADC.W #$0014                                                         ;A6A6CC;
    STA.W Ridley.YSpeed                                                  ;A6A6CF;
    LDA.W Enemy.YPosition                                                ;A6A6D2;
    CMP.W #$0050                                                         ;A6A6D5;
    BPL .return                                                          ;A6A6D8;
    LDA.W #Function_RidleyCeres_MainAI                                   ;A6A6DA;
    STA.W Ridley.function                                                ;A6A6DD;
    LDA.W #$0001                                                         ;A6A6E0;
    STA.L Ridley.status                                                  ;A6A6E3;

  .return:
    RTS                                                                  ;A6A6E7;


;;; $A6E8: Ridley function ;;;
Function_RidleyCeres_MainAI:
; Ceres main AI?
    LDA.L Ridley.hitCounterCeres                                         ;A6A6E8;
    CMP.W #$0064                                                         ;A6A6EC;
    BCS .shot100Times                                                    ;A6A6EF;
    LDA.W Energy                                                         ;A6A6F1;
    CMP.W #$001E                                                         ;A6A6F4;
    BPL .SamusNotLowEnergy                                               ;A6A6F7;
    LDA.W #$0000                                                         ;A6A6F9;
    STA.L Ridley.status                                                  ;A6A6FC;
    LDA.W #Function_RidleyCeres_FlyAwayToEndFight                        ;A6A700;
    STA.W Ridley.function                                                ;A6A703;
    JMP.W Function_RidleyCeres_FlyAwayToEndFight                         ;A6A706;

  .shot100Times:
    LDA.W #$0000                                                         ;A6A709;
    STA.L Ridley.status                                                  ;A6A70C;
    LDA.W #Function_RidleyCeres_InitializeBabyMetroidDrop                ;A6A710;
    STA.W Ridley.function                                                ;A6A713;
    JMP.W Function_RidleyCeres_InitializeBabyMetroidDrop                 ;A6A716;

  .SamusNotLowEnergy:
    JSR.W CeresRidleyAttackCooldown_FlyToPosition                        ;A6A719;
    BCC .notReachedTarget                                                ;A6A71C;
    LDA.L Ridley.timer                                                   ;A6A71E;
    INC                                                                  ;A6A722;
    STA.L Ridley.timer                                                   ;A6A723;
    CMP.W #$007C                                                         ;A6A727;
    BCC .return                                                          ;A6A72A;
    NOP                                                                  ;A6A72C;

  .notReachedTarget:
    LDA.W RandomNumberSeed                                               ;A6A72D;
    AND.W #$000F                                                         ;A6A730;
    ASL                                                                  ;A6A733;
    TAX                                                                  ;A6A734;
    LDA.W .pointers,X                                                    ;A6A735;
    STA.W Ridley.function                                                ;A6A738;
    LDA.W #$0000                                                         ;A6A73B;
    STA.L Ridley.timer                                                   ;A6A73E;

  .return:
    RTS                                                                  ;A6A742;

  .pointers:
    dw Function_RidleyCeres_StartFireballing                             ;A6A743;
    dw Function_RidleyCeres_StartFireballing                             ;A6A745;
    dw Function_RidleyCeres_StartFireballing                             ;A6A747;
    dw Function_RidleyCeres_StartFireballing                             ;A6A749;
    dw Function_RidleyCeres_StartLunging                                 ;A6A74B;
    dw Function_RidleyCeres_StartLunging                                 ;A6A74D;
    dw Function_RidleyCeres_StartLunging                                 ;A6A74F;
    dw Function_RidleyCeres_StartLunging                                 ;A6A751;
    dw Function_RidleyCeres_StartLunging                                 ;A6A753;
    dw Function_RidleyCeres_StartFireballing                             ;A6A755;
    dw Function_RidleyCeres_StartSwoop                                   ;A6A757;
    dw Function_RidleyCeres_StartSwoop                                   ;A6A759;
    dw Function_RidleyCeres_StartSwoop                                   ;A6A75B;
    dw Function_RidleyCeres_StartSwoop                                   ;A6A75D;
    dw Function_RidleyCeres_StartSwoop                                   ;A6A75F;
    dw Function_RidleyCeres_StartFireballing                             ;A6A761;


;;; $A763:  ;;;
CeresRidleyAttackCooldown_FlyToPosition:
; Ceres Ridley attack cooldown; fly towards (C0h, 64h) (return carry set if reached, carry clear otherwise)
    LDX.W #$00C0                                                         ;A6A763;
    LDY.W #$0064                                                         ;A6A766;
    STX.B $12                                                            ;A6A769;
    STY.B $14                                                            ;A6A76B;
    LDX.W #$0000                                                         ;A6A76D;
    LDY.W #$0000                                                         ;A6A770;
    JSR.W AccelerateCeresRidleyTowardDesiredXY                           ;A6A773;
    LDA.W #$0008                                                         ;A6A776;
    STA.B $16                                                            ;A6A779;
    STA.B $18                                                            ;A6A77B;
    JSL.L CheckForEnemyCollisionWithRectangle                            ;A6A77D;
    RTS                                                                  ;A6A781;


;;; $A782: Ridley function ;;;
Function_RidleyCeres_StartFireballing:
; Ceres Ridley fireballing
    LDA.W Ridley.YSpeed                                                  ;A6A782;
    BPL +                                                                ;A6A785;
    EOR.W #$FFFF                                                         ;A6A787;
    INC                                                                  ;A6A78A;

+   CMP.W #$0080                                                         ;A6A78B;
    BCS +                                                                ;A6A78E;
    LDA.W #$0080                                                         ;A6A790;

+   BIT.W Ridley.YSpeed                                                  ;A6A793;
    BPL +                                                                ;A6A796;
    EOR.W #$FFFF                                                         ;A6A798;
    INC                                                                  ;A6A79B;

+   STA.W Ridley.YSpeed                                                  ;A6A79C;
    LDA.W Enemy.XPosition                                                ;A6A79F;
    STA.B $12                                                            ;A6A7A2;
    LDA.W #$0058                                                         ;A6A7A4;
    STA.B $14                                                            ;A6A7A7;
    LDX.W #$0000                                                         ;A6A7A9;
    LDY.W #$0000                                                         ;A6A7AC;
    JSR.W AccelerateCeresRidleyTowardDesiredXY                           ;A6A7AF;
    LDA.W Enemy.YPosition                                                ;A6A7B2;
    CMP.W #$0050                                                         ;A6A7B5;
    BMI .reachedTarget                                                   ;A6A7B8;
    CMP.W #$0080                                                         ;A6A7BA;
    BPL .return                                                          ;A6A7BD;
    LDA.W Enemy.XPosition                                                ;A6A7BF;
    STA.L Ridley.targetXLocationWhenHoldingSamus                         ;A6A7C2;
    LDA.W Enemy.YPosition                                                ;A6A7C6;
    STA.L Ridley.targetYLocationWhenHoldingSamus                         ;A6A7C9;
    LDA.W #InstList_Ridley_FacingLeft_Fireballing_0                      ;A6A7CD;
    JSR.W SetRidleyInstList                                              ;A6A7D0;
    LDA.W #Function_RidleyCeres_Fireballing                              ;A6A7D3;
    STA.W Ridley.function                                                ;A6A7D6;
    LDA.W #$00E0                                                         ;A6A7D9;
    STA.L Ridley.timer                                                   ;A6A7DC;
    JMP.W Function_RidleyCeres_Fireballing                               ;A6A7E0;

  .return:
    RTS                                                                  ;A6A7E3;

  .reachedTarget:
    LDA.L Ridley.timer                                                   ;A6A7E4;
    INC                                                                  ;A6A7E8;
    STA.L Ridley.timer                                                   ;A6A7E9;
    CMP.W #$0030                                                         ;A6A7ED;
    BCC .return                                                          ;A6A7F0;
    LDA.W #Function_RidleyCeres_StartSwoop                               ;A6A7F2;
    STA.W Ridley.function                                                ;A6A7F5;
    RTS                                                                  ;A6A7F8;


;;; $A7F9: Ridley function ;;;
Function_RidleyCeres_Fireballing:
    LDA.W RandomNumberSeed                                               ;A6A7F9;
    AND.W #$0007                                                         ;A6A7FC;
    BIT.W RandomNumberSeed                                               ;A6A7FF;
    BPL +                                                                ;A6A802;
    EOR.W #$FFFF                                                         ;A6A804;
    INC                                                                  ;A6A807;

+   STA.B $16                                                            ;A6A808;
    LDA.L Ridley.targetXLocationWhenHoldingSamus                         ;A6A80A;
    ADC.B $16                                                            ;A6A80E;
    STA.B $12                                                            ;A6A810;
    LDA.L Ridley.targetYLocationWhenHoldingSamus                         ;A6A812;
    ADC.B $16                                                            ;A6A816;
    STA.B $14                                                            ;A6A818;
    LDX.W #$0000                                                         ;A6A81A;
    LDY.W #$0000                                                         ;A6A81D;
    JSR.W AccelerateCeresRidleyTowardDesiredXY                           ;A6A820;
    LDA.L Ridley.timer                                                   ;A6A823;
    DEC                                                                  ;A6A827;
    STA.L Ridley.timer                                                   ;A6A828;
    BPL .return                                                          ;A6A82C;
    LDA.W #$0000                                                         ;A6A82E;
    STA.L Ridley.timer                                                   ;A6A831;
    LDA.W #Function_RidleyCeres_MainAI                                   ;A6A835;
    STA.W Ridley.function                                                ;A6A838;

  .return:
    RTS                                                                  ;A6A83B;


;;; $A83C: Ridley function ;;;
Function_RidleyCeres_StartLunging:
; Ceres Ridley start lunging
    LDA.W #InstList_RidleyCeres_FacingLeft_Lunging                       ;A6A83C;
    JSR.W SetRidleyInstList                                              ;A6A83F;
    LDA.W #Function_RidleyCeres_Lunging                                  ;A6A842;
    STA.W Ridley.function                                                ;A6A845;
    LDA.W #$0040                                                         ;A6A848;
    STA.W Ridley.functionTimer                                           ;A6A84B; fallthrough to Function_RidleyCeres_Lunging


;;; $A84E: Ridley function ;;;
Function_RidleyCeres_Lunging:
    LDA.W SamusXPosition                                                 ;A6A84E;
    STA.B $12                                                            ;A6A851;
    LDA.W SamusYPosition                                                 ;A6A853;
    SEC                                                                  ;A6A856;
    SBC.W #$0044                                                         ;A6A857;
    CMP.W #$0040                                                         ;A6A85A;
    BPL +                                                                ;A6A85D;
    LDA.W #$0040                                                         ;A6A85F;

+   STA.B $14                                                            ;A6A862;
    LDX.W #$0000                                                         ;A6A864;
    LDY.W #$000D                                                         ;A6A867;
    JSR.W AccelerateCeresRidleyTowardDesiredXY                           ;A6A86A;
    LDA.W #$0002                                                         ;A6A86D;
    STA.B $16                                                            ;A6A870;
    STA.B $18                                                            ;A6A872;
    JSL.L CheckForEnemyCollisionWithRectangle                            ;A6A874;
    BCC .collision                                                       ;A6A878;
    DEC.W Ridley.functionTimer                                           ;A6A87A;
    BPL .return                                                          ;A6A87D;

  .collision:
    LDA.W #$0000                                                         ;A6A87F;
    STA.L Ridley.timer                                                   ;A6A882;
    LDA.W #Function_RidleyCeres_MainAI                                   ;A6A886;
    STA.W Ridley.function                                                ;A6A889;

  .return:
    RTS                                                                  ;A6A88C;


;;; $A88D: Ridley function ;;;
Function_RidleyCeres_StartSwoop:
; Ceres Ridley start swoop
    LDA.W #Function_RidleyCeres_FlyToSwoopSetupPosition                  ;A6A88D;
    STA.W Ridley.function                                                ;A6A890;
    LDA.W #$000A                                                         ;A6A893;
    STA.W Ridley.functionTimer                                           ;A6A896;
    LDA.W #$0000                                                         ;A6A899;
    STA.L Ridley.currentAngleOfMotion                                    ;A6A89C;
    STA.L Ridley.tailRotationSpeed                                       ;A6A8A0; fallthrough to Function_Ridley_Ceres_FlyToSwoopSetupPosition


;;; $A8A4: Ridley function ;;;
Function_RidleyCeres_FlyToSwoopSetupPosition:
; Ceres Ridley fly towards (C0h, 50h) to swoop
    LDX.W #$00C0                                                         ;A6A8A4;
    LDY.W #$0050                                                         ;A6A8A7;
    STX.B $12                                                            ;A6A8AA;
    STY.B $14                                                            ;A6A8AC;
    LDX.W #$0000                                                         ;A6A8AE;
    LDY.W #$0001                                                         ;A6A8B1;
    JSR.W AccelerateCeresRidleyTowardDesiredXY                           ;A6A8B4;
    LDA.W Enemy.YPosition                                                ;A6A8B7;
    CMP.W #$0060                                                         ;A6A8BA;
    BMI .reachedTarget                                                   ;A6A8BD;
    RTS                                                                  ;A6A8BF;

  .reachedTarget:
    LDA.W #Function_RidleyCeres_Swoop                                    ;A6A8C0;
    STA.W Ridley.function                                                ;A6A8C3;
    LDA.W #$000A                                                         ;A6A8C6;
    STA.W Ridley.functionTimer                                           ;A6A8C9;
    LDA.W #$0000                                                         ;A6A8CC;
    STA.L Ridley.currentAngleOfMotion                                    ;A6A8CF;
    RTS                                                                  ;A6A8D3;


;;; $A8D4: Ridley function ;;;
Function_RidleyCeres_Swoop:
; Ceres Ridley swoop
    LDA.W #$FFE0                                                         ;A6A8D4;
    STA.B $12                                                            ;A6A8D7;
    LDA.W #$FC00                                                         ;A6A8D9;
    STA.B $14                                                            ;A6A8DC;
    LDA.W #$0300                                                         ;A6A8DE;
    STA.B $16                                                            ;A6A8E1;
    JSR.W UpdateRidleysUSwoopSpeedAndAngle                               ;A6A8E3;
    DEC.W Ridley.functionTimer                                           ;A6A8E6;
    BPL .return                                                          ;A6A8E9;
    LDA.W #Function_RidleyCeres_SwoopingDownLeft                         ;A6A8EB;
    STA.W Ridley.function                                                ;A6A8EE;
    LDA.W #$0024                                                         ;A6A8F1;
    STA.W Ridley.functionTimer                                           ;A6A8F4;

  .return:
    RTS                                                                  ;A6A8F7;


;;; $A8F8: Ridley function ;;;
Function_RidleyCeres_SwoopingDownLeft:
    LDA.W #$FE00                                                         ;A6A8F8;
    STA.B $12                                                            ;A6A8FB;
    LDA.W #$C000                                                         ;A6A8FD;
    STA.B $14                                                            ;A6A900;
    LDA.W #$0300                                                         ;A6A902;
    STA.B $16                                                            ;A6A905;
    JSR.W UpdateRidleysUSwoopSpeedAndAngle                               ;A6A907;
    DEC.W Ridley.functionTimer                                           ;A6A90A;
    BPL .return                                                          ;A6A90D;
    LDA.W #Function_RidleyCeres_SwoopingUpRight                          ;A6A90F;
    STA.W Ridley.function                                                ;A6A912;
    LDA.W #$001C                                                         ;A6A915;
    STA.W Ridley.functionTimer                                           ;A6A918;
    LDA.W #$0001                                                         ;A6A91B;
    STA.L Ridley.tailFlingTrigger                                        ;A6A91E;

  .return:
    RTS                                                                  ;A6A922;


;;; $A923: Ridley function ;;;
Function_RidleyCeres_SwoopingUpRight:
    LDA.W #$FE00                                                         ;A6A923;
    STA.B $12                                                            ;A6A926;
    LDA.W #$8800                                                         ;A6A928;
    STA.B $14                                                            ;A6A92B;
    LDA.W #$0300                                                         ;A6A92D;
    STA.B $16                                                            ;A6A930;
    JSR.W UpdateRidleysUSwoopSpeedAndAngle                               ;A6A932;
    DEC.W Ridley.functionTimer                                           ;A6A935;
    BPL .return                                                          ;A6A938;
    LDA.W #Function_RidleyCeres_EndOfSwoop                               ;A6A93A;
    STA.W Ridley.function                                                ;A6A93D;
    LDA.W #$0001                                                         ;A6A940;
    STA.W Ridley.functionTimer                                           ;A6A943;

  .return:
    RTS                                                                  ;A6A946;


;;; $A947: Ridley function ;;;
Function_RidleyCeres_EndOfSwoop:
    LDA.W #$FD00                                                         ;A6A947;
    STA.B $12                                                            ;A6A94A;
    LDA.W #$8800                                                         ;A6A94C;
    STA.B $14                                                            ;A6A94F;
    LDA.W #$0300                                                         ;A6A951;
    STA.B $16                                                            ;A6A954;
    JSR.W UpdateRidleysUSwoopSpeedAndAngle                               ;A6A956;
    DEC.W Ridley.functionTimer                                           ;A6A959;
    BPL .return                                                          ;A6A95C;
    LDA.W #Function_RidleyCeres_MainAI                                   ;A6A95E;
    STA.W Ridley.function                                                ;A6A961;
    LDA.W #$0000                                                         ;A6A964;
    STA.L Ridley.timer                                                   ;A6A967;
    INC                                                                  ;A6A96B;
    STA.L Ridley.tailRotationSpeed                                       ;A6A96C;

  .return:
    RTS                                                                  ;A6A970;


;;; $A971: Ridley function ;;;
Function_RidleyCeres_FlyAwayToEndFight:
; Ceres Ridley flying away after Samus has low health or after he picks up baby metroid
    LDA.W #$FF40                                                         ;A6A971;
    STA.L Ridley.topBoundary                                             ;A6A974;
    LDA.W #$00C0                                                         ;A6A978;
    STA.B $12                                                            ;A6A97B;
    LDA.W #$FF80                                                         ;A6A97D;
    STA.B $14                                                            ;A6A980;
    LDX.W #$0000                                                         ;A6A982;
    LDY.W #$0001                                                         ;A6A985;
    JSR.W AccelerateCeresRidleyTowardDesiredXY                           ;A6A988;
    LDA.W Enemy.YPosition                                                ;A6A98B;
    CMP.W #$FF80                                                         ;A6A98E;
    BMI .reachedTarget                                                   ;A6A991;

  .return:
    RTS                                                                  ;A6A993;

  .reachedTarget:
    LDA.W #Function_RidleyCeres_SpawnWallsAndUpdatePalettesForGetaway    ;A6A994;
    STA.W Ridley.function                                                ;A6A997;
    LDA.W #$0040                                                         ;A6A99A;
    STA.W Ridley.functionTimer                                           ;A6A99D; fallthrough to Function_RidleyCeres_SpawnWallsAndUpdatePalettesForGetaway


;;; $A9A0: Ridley function ;;;
Function_RidleyCeres_SpawnWallsAndUpdatePalettesForGetaway:
    DEC.W Ridley.functionTimer                                           ;A6A9A0;
    BPL Function_RidleyCeres_FlyAwayToEndFight_return                    ;A6A9A3;
    JSR.W SpawnWallsDuringCeresRidleyGetawayCutscene                     ;A6A9A5;
    STZ.W Ridley.XSpeed                                                  ;A6A9A8;
    STZ.W Ridley.YSpeed                                                  ;A6A9AB;
    LDA.W #$0000                                                         ;A6A9AE;
    STA.L Ridley.tailAIIndex                                             ;A6A9B1;
    LDA.W #Function_RidleyCeres_DisableAI_SetupMode7Ridley               ;A6A9B5;
    STA.W Ridley.function                                                ;A6A9B8;
    LDY.W #.BG2Palette5                                                  ;A6A9BB;
    LDX.W #$00A2                                                         ;A6A9BE;
    LDA.W #$000F                                                         ;A6A9C1;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;A6A9C4;
    LDY.W #.spritePalette7                                               ;A6A9C8;
    LDX.W #$0042                                                         ;A6A9CB;
    LDA.W #$0008                                                         ;A6A9CE;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;A6A9D1;
    LDY.W #.spritePalette7                                               ;A6A9D5;
    LDX.W #$01E2                                                         ;A6A9D8;
    LDA.W #$0008                                                         ;A6A9DB;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;A6A9DE;
    RTS                                                                  ;A6A9E2;

  .BG2Palette5:
; BG1/2 palette 5 colours 1..Fh
    dw $0421,$0401,$0000,$0000,$0421,$0001,$0000,$0000                   ;A6A9E3;
    dw $0422,$0002,$0001,$0022,$0021,$0001,$0000                         ;A6A9F3;

  .spritePalette7:
; Sprite palette 7 colours 1..8
    dw $7E20,$6560,$2060,$1000,$7940,$5D00,$4CA0,$3CA0                   ;A6AA01;


;;; $AA11: Ridley function ;;;
Function_RidleyCeres_DisableAI_SetupMode7Ridley:
    LDA.W #RTS_A6AA4F                                                    ;A6AA11;
    STA.W Ridley.function                                                ;A6AA14;
    LDA.W #$0001                                                         ;A6AA17;
    STA.W CeresStatus                                                    ;A6AA1A;
    JMP.W SetupMode7ForCeresRidleyEscape                                 ;A6AA1D;


;;; $AA20: Spawn walls during Ceres Ridley getaway cutscene ;;;
SpawnWallsDuringCeresRidleyGetawayCutscene:
    LDX.W #.leftWall                                                     ;A6AA20;
    JSL.L SpawnEnemy                                                     ;A6AA23;
    LDX.W #.rightWall                                                    ;A6AA27;
    JSL.L SpawnEnemy                                                     ;A6AA2A;
    RTS                                                                  ;A6AA2E;

;        _______________________________________ X position
;       |      _________________________________ Y position
;       |     |      ___________________________ Initialisation parameter
;       |     |     |      _____________________ Properties
;       |     |     |     |      _______________ Extra properties
;       |     |     |     |     |      _________ Parameter 1
;       |     |     |     |     |     |      ___ Parameter 2
;       |     |     |     |     |     |     |
  .leftWall:
    dw EnemyHeaders_CeresDoor                                            ;A6AA2F;
    dw $0008,$007F,$0000,$2800,$0000,$0005,$0000                         ;A6AA31;
  .rightWall:
    dw EnemyHeaders_CeresDoor                                            ;A6AA3F;
    dw $00F8,$007F,$0000,$2800,$0000,$0006,$0000                         ;A6AA41;


;;; $AA4F: RTS. Ridley function ;;;
RTS_A6AA4F:
    RTS                                                                  ;A6AA4F;


;;; $AA50: Ridley function ;;;
Function_RidleyCeres_CycleEmergencyTextColors:
    JSR.W CycleEmergencyTextColors                                       ;A6AA50;
    RTS                                                                  ;A6AA53;


;;; $AA54:  ;;;
SetupMode7ForCeresRidleyEscape:
    SEP #$20                                                             ;A6AA54;
    LDA.B #$07                                                           ;A6AA56;
    STA.B DP_FakeBGModeSize                                              ;A6AA58;
    REP #$20                                                             ;A6AA5A;
    LDA.W #$0001                                                         ;A6AA5C;
    STA.W Mode7Flag                                                      ;A6AA5F;
    SEP #$20                                                             ;A6AA62;
    LDA.B #$80                                                           ;A6AA64;
    STA.B DP_Mode7Settings                                               ;A6AA66;
    REP #$20                                                             ;A6AA68;
    LDA.W #$0100                                                         ;A6AA6A;
    STA.B DP_Mode7TransMatrixA                                           ;A6AA6D;
    STA.B DP_Mode7TransMatrixB                                           ;A6AA6F;
    STA.B DP_Mode7TransMatrixC                                           ;A6AA71;
    STA.B DP_Mode7TransMatrixD                                           ;A6AA73;
    LDA.W #$0040                                                         ;A6AA75;
    STA.B DP_Mode7TransOriginX                                           ;A6AA78;
    STA.B DP_Mode7TransOriginY                                           ;A6AA7A;
    LDA.W #$0000                                                         ;A6AA7C;
    STA.L Ridley.getawayCompletedFlag                                    ;A6AA7F;
    STA.L Ridley.getawayFlightDataIndex                                  ;A6AA83;
    LDA.W #$0001                                                         ;A6AA87;
    STA.L Ridley.currentAngleOfMotion                                    ;A6AA8A;
    LDA.W #$FF80                                                         ;A6AA8E;
    STA.L Ridley.getawayXScroll                                          ;A6AA91;
    STA.B DP_BG1XScroll                                                  ;A6AA95;
    LDA.W #$0020                                                         ;A6AA97;
    STA.L Ridley.getawayYScroll                                          ;A6AA9A;
    STA.B DP_BG1YScroll                                                  ;A6AA9E;
    LDA.W #$0800                                                         ;A6AAA0;
    STA.L Ridley.getawayZoomLevel                                        ;A6AAA3;
    LDA.W #$0400                                                         ;A6AAA7;
    STA.L Ridley.unused8022                                              ;A6AAAA;
    RTS                                                                  ;A6AAAE;


;;; $AAAF: Handle Ceres Ridley getaway cutscene ;;;
HandleCeresRidleyGetawayCutscene:
    PHB                                                                  ;A6AAAF;
    PHK                                                                  ;A6AAB0;
    PLB                                                                  ;A6AAB1;
    LDA.L Ridley.getawayCompletedFlag                                    ;A6AAB2;
    BNE .return                                                          ;A6AAB6;
    JSR.W ExecuteCeresRidleyGetawayCutscene                              ;A6AAB8;

  .return:
    PLB                                                                  ;A6AABB;
    RTL                                                                  ;A6AABC;


;;; $AABD:  ;;;
ExecuteCeresRidleyGetawayCutscene:
    LDA.L Ridley.getawayFlightDataIndex                                  ;A6AABD;
    TAX                                                                  ;A6AAC1;
    INC                                                                  ;A6AAC2;
    INC                                                                  ;A6AAC3;
    STA.L Ridley.getawayFlightDataIndex                                  ;A6AAC4;
    CPX.W #$0000                                                         ;A6AAC8;
    BNE .notFirstExecution                                               ;A6AACB;
    LDA.W #$004E                                                         ;A6AACD;
    JSL.L QueueSound_Lib2_Max6                                           ;A6AAD0;

  .notFirstExecution:
    CPX.W #$00D0                                                         ;A6AAD4;
    BNE .dontPushSamus                                                   ;A6AAD7;
    JSL.L SetSamusToBePushedOutOfCeresRidleysWay                         ;A6AAD9;
    LDA.W #$0023                                                         ;A6AADD;
    STA.W EarthquakeType                                                 ;A6AAE0;
    LDA.W #$0040                                                         ;A6AAE3;
    STA.W EarthquakeTimer                                                ;A6AAE6;

  .dontPushSamus:
    LDA.W CeresRidleyMode7GetawayZoomLevelTable,X                        ;A6AAE9;
    CMP.W #$FFFF                                                         ;A6AAEC;
    BEQ .done                                                            ;A6AAEF;
    STA.L Ridley.getawayZoomLevel                                        ;A6AAF1;
    LDA.L Ridley.getawayYScroll                                          ;A6AAF5;
    CLC                                                                  ;A6AAF9;
    ADC.W CeresRidleyGetawayYVelocityTable,X                             ;A6AAFA;
    STA.L Ridley.getawayYScroll                                          ;A6AAFD;
    STA.B DP_BG1YScroll                                                  ;A6AB01;
    LDA.L Ridley.getawayXScroll                                          ;A6AB03;
    SEC                                                                  ;A6AB07;
    SBC.W CeresRidleyGetawayXVelocityTable,X                             ;A6AB08;
    STA.L Ridley.getawayXScroll                                          ;A6AB0B;
    STA.B DP_BG1XScroll                                                  ;A6AB0F;
    LDA.L Ridley.getawayZoomLevel                                        ;A6AB11;
    JSR.W RidleyCeres_UpdateBG12Palette5                                 ;A6AB15;
    LDA.L Ridley.currentAngleOfMotion                                    ;A6AB18;
    CLC                                                                  ;A6AB1C;
    ADC.W #$0030                                                         ;A6AB1D;
    STA.L Ridley.currentAngleOfMotion                                    ;A6AB20;
    JSR.W HandleCeresRidleyMode7TransformationMatrix                     ;A6AB24;
    JSR.W AnimateMode7BabyMetroidCapsuleDuringGetaway                    ;A6AB27;
    JSR.W AnimateMode7RidleyWings                                        ;A6AB2A;
    RTS                                                                  ;A6AB2D;

  .done:
    LDA.L Ridley.getawayCompletedFlag                                    ;A6AB2E;
    INC                                                                  ;A6AB32;
    STA.L Ridley.getawayCompletedFlag                                    ;A6AB33;
    SEP #$20                                                             ;A6AB37;
    LDA.B #$09                                                           ;A6AB39;
    STA.B DP_FakeBGModeSize                                              ;A6AB3B;
    REP #$20                                                             ;A6AB3D; >.<
    SEP #$20                                                             ;A6AB3F; >.<
    STZ.B DP_Mode7Settings                                               ;A6AB41;
    REP #$20                                                             ;A6AB43;
    STZ.B DP_Mode7TransMatrixA                                           ;A6AB45;
    STZ.B DP_Mode7TransMatrixB                                           ;A6AB47;
    STZ.B DP_Mode7TransMatrixC                                           ;A6AB49;
    STZ.B DP_Mode7TransMatrixD                                           ;A6AB4B;
    STZ.B DP_Mode7TransOriginX                                           ;A6AB4D;
    STZ.B DP_Mode7TransOriginY                                           ;A6AB4F;
    STZ.B DP_BG1XScroll                                                  ;A6AB51;
    STZ.B DP_BG1YScroll                                                  ;A6AB53;
    LDA.W #CeresRidleyPostGetawayFunctionHandler                         ;A6AB55;
    STA.W Ridley.function                                                ;A6AB58;
    STZ.W Ridley.functionTimer                                           ;A6AB5B;
    RTS                                                                  ;A6AB5E;


;;; $AB5F:  ;;;
HandleCeresRidleyMode7TransformationMatrix:
; >_<;
    LDA.L Ridley.currentAngleOfMotion                                    ;A6AB5F;
    XBA                                                                  ;A6AB63;
    AND.W #$00FF                                                         ;A6AB64;
    STA.B $12                                                            ;A6AB67;
    LDA.W #$0100                                                         ;A6AB69;
    JSL.L Mode7Math_A6AC1E                                               ;A6AB6C;
    STA.B $18                                                            ;A6AB70;
    BIT.B $18                                                            ;A6AB72;
    BPL +                                                                ;A6AB74;
    EOR.W #$FFFF                                                         ;A6AB76;
    INC                                                                  ;A6AB79;

+   STA.B $26                                                            ;A6AB7A;
    LDA.L Ridley.getawayZoomLevel                                        ;A6AB7C;
    STA.B $28                                                            ;A6AB80;
    JSR.W Mode7Math_A6AC58                                               ;A6AB82;
    LDA.B $2B                                                            ;A6AB85;
    BIT.B $18                                                            ;A6AB87;
    BPL +                                                                ;A6AB89;
    EOR.W #$FFFF                                                         ;A6AB8B;
    INC                                                                  ;A6AB8E;

+   STA.B DP_Mode7TransMatrixA                                           ;A6AB8F;
    LDA.W #$0100                                                         ;A6AB91;
    JSL.L Mode7Math_A6AC0E                                               ;A6AB94;
    STA.B $18                                                            ;A6AB98;
    BIT.B $18                                                            ;A6AB9A;
    BPL +                                                                ;A6AB9C;
    EOR.W #$FFFF                                                         ;A6AB9E;
    INC                                                                  ;A6ABA1;

+   STA.B $26                                                            ;A6ABA2;
    LDA.L Ridley.getawayZoomLevel                                        ;A6ABA4;
    STA.B $28                                                            ;A6ABA8;
    JSR.W Mode7Math_A6AC58                                               ;A6ABAA;
    LDA.B $2B                                                            ;A6ABAD;
    BIT.B $18                                                            ;A6ABAF;
    BPL +                                                                ;A6ABB1;
    EOR.W #$FFFF                                                         ;A6ABB3;
    INC                                                                  ;A6ABB6;

+   STA.B DP_Mode7TransMatrixB                                           ;A6ABB7;
    LDA.W #$0100                                                         ;A6ABB9;
    JSL.L Mode7Math_A6AC0E                                               ;A6ABBC;
    EOR.W #$FFFF                                                         ;A6ABC0;
    INC                                                                  ;A6ABC3;
    STA.B $18                                                            ;A6ABC4;
    BIT.B $18                                                            ;A6ABC6;
    BPL +                                                                ;A6ABC8;
    EOR.W #$FFFF                                                         ;A6ABCA;
    INC                                                                  ;A6ABCD;

+   STA.B $26                                                            ;A6ABCE;
    LDA.L Ridley.getawayZoomLevel                                        ;A6ABD0;
    STA.B $28                                                            ;A6ABD4;
    JSR.W Mode7Math_A6AC58                                               ;A6ABD6;
    LDA.B $2B                                                            ;A6ABD9;
    BIT.B $18                                                            ;A6ABDB;
    BPL +                                                                ;A6ABDD;
    EOR.W #$FFFF                                                         ;A6ABDF;
    INC                                                                  ;A6ABE2;

+   STA.B DP_Mode7TransMatrixC                                           ;A6ABE3;
    LDA.W #$0100                                                         ;A6ABE5;
    JSL.L Mode7Math_A6AC1E                                               ;A6ABE8;
    STA.B $18                                                            ;A6ABEC;
    BIT.B $18                                                            ;A6ABEE;
    BPL +                                                                ;A6ABF0;
    EOR.W #$FFFF                                                         ;A6ABF2;
    INC                                                                  ;A6ABF5;

+   STA.B $26                                                            ;A6ABF6;
    LDA.L Ridley.getawayZoomLevel                                        ;A6ABF8;
    STA.B $28                                                            ;A6ABFC;
    JSR.W Mode7Math_A6AC58                                               ;A6ABFE;
    LDA.B $2B                                                            ;A6AC01;
    BIT.B $18                                                            ;A6AC03;
    BPL +                                                                ;A6AC05;
    EOR.W #$FFFF                                                         ;A6AC07;
    INC                                                                  ;A6AC0A;

+   STA.B DP_Mode7TransMatrixD                                           ;A6AC0B;
    RTS                                                                  ;A6AC0D;


;;; $AC0E:  ;;;
Mode7Math_A6AC0E:
    STA.B $14                                                            ;A6AC0E;
    BIT.B $14                                                            ;A6AC10;
    BPL +                                                                ;A6AC12;
    EOR.W #$FFFF                                                         ;A6AC14;
    INC                                                                  ;A6AC17;

+   STA.B $26                                                            ;A6AC18;
    LDA.B $12                                                            ;A6AC1A;
    BRA Mode7Math_Common_A6AC30                                          ;A6AC1C;


;;; $AC1E:  ;;;
Mode7Math_A6AC1E:
    STA.B $14                                                            ;A6AC1E;
    BIT.B $14                                                            ;A6AC20;
    BPL +                                                                ;A6AC22;
    EOR.W #$FFFF                                                         ;A6AC24;
    INC                                                                  ;A6AC27;

+   STA.B $26                                                            ;A6AC28;
    LDA.B $12                                                            ;A6AC2A;
    CLC                                                                  ;A6AC2C;
    ADC.W #$0040                                                         ;A6AC2D; fallthrough to Mode7Math_Common_A6AC30


;;; $AC30:  ;;;
Mode7Math_Common_A6AC30:
    ASL                                                                  ;A6AC30;
    AND.W #$01FE                                                         ;A6AC31;
    TAX                                                                  ;A6AC34;
    LDA.L SineCosineTables_8bitSine_SignExtended,X                       ;A6AC35;
    BEQ .return                                                          ;A6AC39;
    STA.B $16                                                            ;A6AC3B;
    BPL +                                                                ;A6AC3D;
    EOR.W #$FFFF                                                         ;A6AC3F;
    INC                                                                  ;A6AC42;

+   STA.B $28                                                            ;A6AC43;
    JSR.W Mode7Math_A6AC58                                               ;A6AC45;
    LDA.B $14                                                            ;A6AC48;
    EOR.B $16                                                            ;A6AC4A;
    BMI +                                                                ;A6AC4C;
    LDA.B $2B                                                            ;A6AC4E;
    RTL                                                                  ;A6AC50;

+   LDA.B $2B                                                            ;A6AC51;
    EOR.W #$FFFF                                                         ;A6AC53;
    INC                                                                  ;A6AC56;

  .return:
    RTL                                                                  ;A6AC57;


;;; $AC58:  ;;;
Mode7Math_A6AC58:
    PHX                                                                  ;A6AC58;
    PHY                                                                  ;A6AC59;
    PHA                                                                  ;A6AC5A;
    PHP                                                                  ;A6AC5B;
    REP #$20                                                             ;A6AC5C;
    SEP #$10                                                             ;A6AC5E;
    LDX.B $26                                                            ;A6AC60;
    STX.W $4202                                                          ;A6AC62;
    LDX.B $28                                                            ;A6AC65;
    STX.W $4203                                                          ;A6AC67;
    NOP                                                                  ;A6AC6A;
    NOP                                                                  ;A6AC6B;
    NOP                                                                  ;A6AC6C;
    LDA.W $4216                                                          ;A6AC6D;
    STA.B $2A                                                            ;A6AC70;
    LDX.B $27                                                            ;A6AC72;
    STX.W $4202                                                          ;A6AC74;
    LDX.B $29                                                            ;A6AC77;
    STX.W $4203                                                          ;A6AC79;
    NOP                                                                  ;A6AC7C;
    NOP                                                                  ;A6AC7D;
    NOP                                                                  ;A6AC7E;
    LDX.W $4216                                                          ;A6AC7F;
    STX.B $2C                                                            ;A6AC82;
    LDY.W $4217                                                          ;A6AC84;
    LDX.B $27                                                            ;A6AC87;
    STX.W $4202                                                          ;A6AC89;
    LDX.B $28                                                            ;A6AC8C;
    STX.W $4203                                                          ;A6AC8E;
    NOP                                                                  ;A6AC91;
    NOP                                                                  ;A6AC92;
    LDA.B $2B                                                            ;A6AC93;
    CLC                                                                  ;A6AC95;
    ADC.W $4216                                                          ;A6AC96;
    STA.B $2B                                                            ;A6AC99;
    BCC +                                                                ;A6AC9B;
    INY                                                                  ;A6AC9D;

+   LDX.B $26                                                            ;A6AC9E;
    STX.W $4202                                                          ;A6ACA0;
    LDX.B $29                                                            ;A6ACA3;
    STX.W $4203                                                          ;A6ACA5;
    NOP                                                                  ;A6ACA8;
    NOP                                                                  ;A6ACA9;
    LDA.B $2B                                                            ;A6ACAA;
    CLC                                                                  ;A6ACAC;
    ADC.W $4216                                                          ;A6ACAD;
    STA.B $2B                                                            ;A6ACB0;
    BCC +                                                                ;A6ACB2;
    INY                                                                  ;A6ACB4;

+   STY.B $2D                                                            ;A6ACB5;
    PLP                                                                  ;A6ACB7;
    PLA                                                                  ;A6ACB8;
    PLY                                                                  ;A6ACB9;
    PLX                                                                  ;A6ACBA;
    RTS                                                                  ;A6ACBB;


;;; $ACBC:  ;;;
AnimateMode7BabyMetroidCapsuleDuringGetaway:
    LDA.W NMI_FrameCounter                                               ;A6ACBC;
    AND.W #$0003                                                         ;A6ACBF;
    BNE .return                                                          ;A6ACC2;
    LDA.L Ridley.getawayBabyMetroidAnimationIndex                        ;A6ACC4;
    INC                                                                  ;A6ACC8;
    AND.W #$0003                                                         ;A6ACC9;
    STA.L Ridley.getawayBabyMetroidAnimationIndex                        ;A6ACCC;
    ASL                                                                  ;A6ACD0;
    TAY                                                                  ;A6ACD1;
    LDX.W .pointers,Y                                                    ;A6ACD2;
    JSL.L QueueMode7Transfers                                            ;A6ACD5;

  .return:
    RTS                                                                  ;A6ACD9;

  .pointers:
    dw .tilemapEntry0                                                    ;A6ACDA;
    dw .tilemapEntry1                                                    ;A6ACDC;
    dw .tilemapEntry2                                                    ;A6ACDE;
    dw .tilemapEntry1                                                    ;A6ACE0;

;                        ______________________ Control. 80h = write to VRAM tilemap
;                       |   ___________________ Source address
;                       |  |       ____________ Size, Destination address (VRAM)
;                       |  |      |          __ VRAM address increment mode
;                       |  |      |         |
  .tilemapEntry0:
    db $80                                                               ;A6ACE2; Control. 80h = write to VRAM tilemap
    dl .tilemap0                                                         ;A6ACE3; Source address
    dw $0002,$0504                                                       ;A6ACE6; Size, Destination address (VRAM)
    db $00                                                               ;A6ACEA; VRAM address increment mode
    db $80                                                               ;A6ACEB; Control. 80h = write to VRAM tilemap
    dl .tilemap1                                                         ;A6ACEC; Source address
    dw $0002,$0584                                                       ;A6ACEF; Size, Destination address (VRAM)
    db $00                                                               ;A6ACF3; VRAM address increment mode
    db $00                                                               ;A6ACF4;

  .tilemapEntry1:
    db $80                                                               ;A6ACF5; Control. 80h = write to VRAM tilemap
    dl .tilemap2                                                         ;A6ACF6; Source address
    dw $0002,$0504                                                       ;A6ACF9; Size, Destination address (VRAM)
    db $00                                                               ;A6ACFD; VRAM address increment mode
    db $80                                                               ;A6ACFE; Control. 80h = write to VRAM tilemap
    dl .tilemap3                                                         ;A6ACFF; Source address
    dw $0002,$0584                                                       ;A6AD02; Size, Destination address (VRAM)
    db $00                                                               ;A6AD06; VRAM address increment mode
    db $00                                                               ;A6AD07;

  .tilemapEntry2:
    db $80                                                               ;A6AD08; Control. 80h = write to VRAM tilemap
    dl .tilemap4                                                         ;A6AD09; Source address
    dw $0002,$0504                                                       ;A6AD0C; Size, Destination address (VRAM)
    db $00                                                               ;A6AD10; VRAM address increment mode
    db $80                                                               ;A6AD11; Control. 80h = write to VRAM tilemap
    dl .tilemap5                                                         ;A6AD12; Source address
    dw $0002,$0584                                                       ;A6AD15; Size, Destination address (VRAM)
    db $00                                                               ;A6AD19; VRAM address increment mode
    db $00                                                               ;A6AD1A;

  .tilemap0:
    db $59,$5A                                                           ;A6AD1B;

  .tilemap1:
    db $69,$6A                                                           ;A6AD1D;

  .tilemap2:
    db $8A,$8B                                                           ;A6AD1F;

  .tilemap3:
    db $8C,$8D                                                           ;A6AD21;

  .tilemap4:
    db $8E,$8F                                                           ;A6AD23;

  .tilemap5:
    db $9D,$9E                                                           ;A6AD25;


;;; $AD27:  ;;;
AnimateMode7RidleyWings:
    LDA.W NMI_FrameCounter                                               ;A6AD27;
    AND.W #$0007                                                         ;A6AD2A;
    BNE .return                                                          ;A6AD2D;
    LDA.L Ridley.getawayWingAnimationIndex                               ;A6AD2F;
    INC                                                                  ;A6AD33;
    AND.W #$0001                                                         ;A6AD34;
    STA.L Ridley.getawayWingAnimationIndex                               ;A6AD37;
    ASL                                                                  ;A6AD3B;
    TAY                                                                  ;A6AD3C;
    LDX.W .pointers,Y                                                    ;A6AD3D;
    JSL.L QueueMode7Transfers                                            ;A6AD40;

  .return:
    RTS                                                                  ;A6AD44;

  .pointers:
    dw .tilemapEntry0                                                    ;A6AD45;
    dw .tilemapEntry1                                                    ;A6AD47;

  .tilemapEntry0:
    db $80                                                               ;A6AD49; Control. 80h = write to VRAM tilemap
    dl .tilemap0                                                         ;A6AD4A; Source address
    dw $0004,$000B                                                       ;A6AD4D; Size, Destination address (VRAM)
    db $00                                                               ;A6AD51; VRAM address increment mode
    db $80                                                               ;A6AD52; Control. 80h = write to VRAM tilemap
    dl .tilemap2                                                         ;A6AD53; Source address
    dw $000E,$0080                                                       ;A6AD56; Size, Destination address (VRAM)
    db $00                                                               ;A6AD5A; VRAM address increment mode
    db $80                                                               ;A6AD5B; Control. 80h = write to VRAM tilemap
    dl .tilemap4                                                         ;A6AD5C; Source address
    dw $000E,$0100                                                       ;A6AD5F; Size, Destination address (VRAM)
    db $00                                                               ;A6AD63; VRAM address increment mode
    db $80                                                               ;A6AD64; Control. 80h = write to VRAM tilemap
    dl .tilemap6                                                         ;A6AD65; Source address
    dw $000C,$0181                                                       ;A6AD68; Size, Destination address (VRAM)
    db $00                                                               ;A6AD6C; VRAM address increment mode
    db $80                                                               ;A6AD6D; Control. 80h = write to VRAM tilemap
    dl .tilemap8                                                         ;A6AD6E; Source address
    dw $000F,$0201                                                       ;A6AD71; Size, Destination address (VRAM)
    db $00                                                               ;A6AD76; VRAM address increment mode
    db $80                                                               ;A6AD75; Control. 80h = write to VRAM tilemap
    dl .tilemapA                                                         ;A6AD77; Source address
    dw $0010,$0280                                                       ;A6AD7A; Size, Destination address (VRAM)
    db $00                                                               ;A6AD7E; VRAM address increment mode
    db $00                                                               ;A6AD7F;

  .tilemapEntry1:
    db $80                                                               ;A6AD80; Control. 80h = write to VRAM tilemap
    dl .tilemap1                                                         ;A6AD81; Source address
    dw $0004,$000B                                                       ;A6AD84; Size, Destination address (VRAM)
    db $00                                                               ;A6AD88; VRAM address increment mode
    db $80                                                               ;A6AD89; Control. 80h = write to VRAM tilemap
    dl .tilemap3                                                         ;A6AD8A; Source address
    dw $000E,$0080                                                       ;A6AD8D; Size, Destination address (VRAM)
    db $00                                                               ;A6AD90; VRAM address increment mode
    db $80                                                               ;A6AD91; Control. 80h = write to VRAM tilemap
    dl .tilemap5                                                         ;A6AD93; Source address
    dw $000E,$0100                                                       ;A6AD96; Size, Destination address (VRAM)
    db $00                                                               ;A6AD9A; VRAM address increment mode
    db $80                                                               ;A6AD9B; Control. 80h = write to VRAM tilemap
    dl .tilemap7                                                         ;A6AD9C; Source address
    dw $000C,$0181                                                       ;A6AD9F; Size, Destination address (VRAM)
    db $00                                                               ;A6ADA3; VRAM address increment mode
    db $80                                                               ;A6ADA4; Control. 80h = write to VRAM tilemap
    dl .tilemap9                                                         ;A6ADA5; Source address
    dw $000F,$0201                                                       ;A6ADA8; Size, Destination address (VRAM)
    db $00                                                               ;A6ADAC; VRAM address increment mode
    db $80                                                               ;A6ADAD; Control. 80h = write to VRAM tilemap
    dl .tilemapB                                                         ;A6ADAE; Source address
    dw $0010,$0280                                                       ;A6ADB1; Size, Destination address (VRAM)
    db $00                                                               ;A6ADB5; VRAM address increment mode
    db $00                                                               ;A6ADB6;

  .tilemap0:
    db $00,$01,$02,$03                                                   ;A6ADB7;

  .tilemap1:
    db $FF,$FF,$FF,$FF                                                   ;A6ADBB;

  .tilemap2:
    db $04,$05,$06,$07,$08,$09,$FF,$FF,$0A,$0B,$0C,$0D,$0E,$0F           ;A6ADBF;

  .tilemap3:
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF           ;A6ADCD;

  .tilemap4:
    db $10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$1A,$1B,$1C,$A8           ;A6ADDB;

  .tilemap5:
    db $FF,$FF,$FF,$FF,$FF,$FF,$20,$17,$AA,$FF,$FF,$FF,$FF,$FF           ;A6ADE9;

  .tilemap6:
    db $21,$22,$23,$24,$25,$26,$27,$28,$29,$2A,$2B,$2C                   ;A6ADF7;

  .tilemap7:
    db $FF,$FF,$FF,$FF,$FF,$26,$27,$28,$FF,$FF,$FF,$FF                   ;A6AE03;

  .tilemap8:
    db $FF,$FF,$1D,$1E,$1F,$30,$31,$32,$33,$34,$FF,$FF,$FF,$FF,$FF       ;A6AE0F;

  .tilemap9:
    db $91,$92,$93,$94,$95,$30,$31,$32,$96,$97,$98,$99,$9A,$98,$9C       ;A6AE1E;

  .tilemapA:
    db $FF,$FF,$FF,$FF,$2E,$2F,$40,$41,$42,$43,$44,$FF,$FF,$FF,$FF,$FF   ;A6AE2D;

  .tilemapB:
    db $90,$9F,$A0,$A1,$A2,$A3,$40,$41,$42,$A4,$A5,$A6,$A7,$7D,$83,$2D   ;A6AE3D;


;;; $AE4D:  ;;;
CeresRidleyMode7GetawayZoomLevelTable:
    dw $0800,$0800,$0800,$0800,$0800,$0800,$0800,$0800                   ;A6AE4D;
    dw $0800,$0800,$0800,$0800,$0800,$0800,$0800,$0800                   ;A6AE5D;
    dw $0800,$0800,$0800,$0800,$0800,$0800,$0800,$0800                   ;A6AE6D;
    dw $0800,$0800,$0800,$0800,$0800,$0800,$0800,$0800                   ;A6AE7D;
    dw $07F0,$07E0,$07D0,$07C0,$07B0,$07A0,$0790,$0780                   ;A6AE8D;
    dw $0770,$0760,$0750,$0740,$0730,$0720,$0710,$0700                   ;A6AE9D;
    dw $06E0,$06C0,$06A0,$0680,$0660,$0640,$0620,$0600                   ;A6AEAD;
    dw $05E0,$05C0,$05A0,$0580,$0560,$0540,$0520,$0500                   ;A6AEBD;
    dw $04E0,$04C0,$04A0,$0480,$0460,$0440,$0430,$0400                   ;A6AECD;
    dw $03E0,$03C0,$03A0,$0380,$0360,$0340,$0320,$0300                   ;A6AEDD;
    dw $02E0,$02C0,$02A0,$0280,$0260,$0240,$0230,$0200                   ;A6AEED;
    dw $01E0,$01C0,$01A0,$0180,$0160,$0140,$0120,$0100                   ;A6AEFD;
    dw $00F0,$00E0,$00D0,$00C0,$00B0,$00A0,$0090,$0080                   ;A6AF0D;
    dw $0070,$0060,$0050,$0040,$0030,$0020,$0020,$0020                   ;A6AF1D;
    dw $FFFF                                                             ;A6AF2D;


;;; $AF2F: Ceres Ridley getaway Y velocity table ;;;
CeresRidleyGetawayYVelocityTable:
    dw $FFFA,$FFFA,$FFFA,$FFFA,$FFFA,$FFFA,$FFFA,$FFFA                   ;A6AF2F;
    dw $FFFA,$FFFA,$FFFA,$FFFA,$FFFC,$FFFC,$FFFC,$FFFC                   ;A6AF3F;
    dw $FFFC,$FFFC,$FFFC,$FFFC,$FFFC,$FFFC,$FFFE,$FFFE                   ;A6AF4F;
    dw $FFFE,$FFFE,$FFFE,$FFFE,$FFFE,$FFFF,$FFFF,$FFFF                   ;A6AF5F;
    dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF                   ;A6AF6F;
    dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$0000,$0000,$0000                   ;A6AF7F;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;A6AF8F;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;A6AF9F;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;A6AFAF;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;A6AFBF;
    dw $0001,$0001,$0001,$0001,$0001,$0001,$0001,$0001                   ;A6AFCF;
    dw $0002,$0002,$0002,$0002,$0002,$0002,$0002,$0002                   ;A6AFDF;
    dw $0003,$0004,$0006,$0008,$000A,$000C,$000E,$0010                   ;A6AFEF;
    dw $0014,$0018,$002C,$0030,$0080,$0100,$0100,$0100                   ;A6AFFF;


;;; $B00F: Ceres Ridley getaway X velocity table ;;;
CeresRidleyGetawayXVelocityTable:
    dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF                   ;A6B00F;
    dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF                   ;A6B01F;
    dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF                   ;A6B02F;
    dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF                   ;A6B03F;
    dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF                   ;A6B04F;
    dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF                   ;A6B05F;
    dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF                   ;A6B06F;
    dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF                   ;A6B07F;
    dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF                   ;A6B08F;
    dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF                   ;A6B09F;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;A6B0AF;
    dw $0001,$0001,$0001,$0001,$0001,$0001,$0001,$0001                   ;A6B0BF;
    dw $0002,$0002,$0003,$0003,$0004,$0004,$0005,$0005                   ;A6B0CF;
    dw $0008,$000C,$0010,$0014,$0020,$0020,$0020,$0020                   ;A6B0DF;


;;; $B0EF:  ;;;
RidleyCeres_UpdateBG12Palette5:
    XBA                                                                  ;A6B0EF;
    AND.W #$00FF                                                         ;A6B0F0;
    ASL                                                                  ;A6B0F3;
    ASL                                                                  ;A6B0F4;
    ASL                                                                  ;A6B0F5;
    ASL                                                                  ;A6B0F6;
    ASL                                                                  ;A6B0F7;
    ADC.W #.palette0                                                     ;A6B0F8;
    TAY                                                                  ;A6B0FB;
    LDX.W #$00A2                                                         ;A6B0FC;
    LDA.W #$000F                                                         ;A6B0FF;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;A6B102;
    RTS                                                                  ;A6B106;

; BG1/2 palette 5 colours 1..Fh
  .palette0:
    dw $56BA,$41B2,$1447,$0403,$4E15,$3570,$24CB,$1868                   ;A6B107;
    dw $5E5F,$183F,$1014,$031F,$01DA,$00F5,$0C63,$0000                   ;A6B117;

  .palette1:
    dw $4E78,$3D90,$1026,$0402,$45F3,$314F,$20AA,$1447                   ;A6B127;
    dw $561D,$143D,$0C12,$02DD,$01B8,$00D3,$0842,$0000                   ;A6B137;

  .palette2:
    dw $4A56,$356F,$1026,$0002,$41B2,$2D2D,$1CA9,$1447                   ;A6B147;
    dw $51FA,$141A,$0C11,$029A,$0196,$00D2,$0842,$0000                   ;A6B157;

  .palette3:
    dw $4214,$314E,$1025,$0002,$3D90,$290C,$1C88,$1046                   ;A6B167;
    dw $49D8,$1018,$0C10,$0278,$0174,$00B0,$0842,$0000                   ;A6B177;

  .palette4:
    dw $3DF3,$2D2D,$0C25,$0002,$396F,$250B,$1888,$1045                   ;A6B187;
    dw $41B6,$1016,$0C0E,$0236,$0153,$00AF,$0842,$0000                   ;A6B197;

  .palette5:
    dw $39D1,$290C,$0C24,$0002,$314E,$20EA,$1887,$1045                   ;A6B1A7;
    dw $3D94,$1014,$080D,$0214,$0131,$008E,$0842,$0000                   ;A6B1B7;

  .palette6:
    dw $318F,$24EA,$0C24,$0001,$2D2C,$1CC9,$1466,$0C24                   ;A6B1C7;
    dw $3552,$0C12,$080C,$01D2,$010F,$008C,$0421,$0000                   ;A6B1D7;

  .palette7:
    dw $252C,$1CC8,$0823,$0001,$20E9,$18A7,$1045,$0823                   ;A6B1E7;
    dw $290E,$080E,$0409,$016E,$00CC,$0069,$0421,$0000                   ;A6B1F7;

  .palette8:
    dw $1CE8,$1486,$0402,$0001,$18A7,$1065,$0C43,$0822                   ;A6B207;
    dw $1CCA,$080A,$0406,$010A,$0088,$0047,$0421,$0000                   ;A6B217;


;;; $B227: Main AI - enemy $E17F (Ridley) ;;;
MainAI_Ridley:
    LDA.L Ridley.unknown8008                                             ;A6B227;
    SEC                                                                  ;A6B22B;
    SBC.W #$0004                                                         ;A6B22C;
    BPL .greaterThan4                                                    ;A6B22F;
    LDA.W #$0000                                                         ;A6B231;

  .greaterThan4:
    STA.L Ridley.unknown8008                                             ;A6B234;
    JSR.W HandleRidleySamusInteractionBit                                ;A6B238;
    JSR.W PowerBombCheck                                                 ;A6B23B;
    PEA.W .manualReturn-1                                                ;A6B23E;
    JMP.W (Ridley.function)                                              ;A6B241;

  .manualReturn:
    LDA.L Ridley.activeFlag                                              ;A6B244;
    BEQ .notActiveNotHoldingSamus                                        ;A6B248;
    JSR.W MakeRidleysWingsAndTailFlashWhenHit                            ;A6B24A;
    JSR.W HandleMovementAndMainBodyWallCollisions                        ;A6B24D;
    JSR.W HandleWingFlapping                                             ;A6B250;
    JSR.W HandleRidleyTailAI                                             ;A6B253;
    JSR.W KillProjectilesWithRidleyTailTip                               ;A6B256;
    JSR.W DrawRidleyTail                                                 ;A6B259;
    JSR.W DrawRidleysWings                                               ;A6B25C;
    JSR.W AnimateRidleysRibs                                             ;A6B25F;
    LDA.L Ridley.holdingSamusFlag                                        ;A6B262;
    BEQ .notActiveNotHoldingSamus                                        ;A6B266;
    JSR.W MoveSamusToWithinRidleysClawsIfHolding                         ;A6B268;

  .notActiveNotHoldingSamus:
    JSR.W DetermineAndSetRidleySpeedAndColorPalette                      ;A6B26B;
    RTL                                                                  ;A6B26E;


if !FEATURE_KEEP_UNREFERENCED
;;; $B26F:  ;;;
UNUSED_Ridley_TrySamusGrab_A6B26F:
    LDA.L Ridley.grabCooldownTimer                                       ;A6B26F;
    ORA.L Ridley.holdingSamusFlag                                        ;A6B273;
    BNE .return                                                          ;A6B277;
    LDX.W #$0004                                                         ;A6B279;
    LDY.W #$0004                                                         ;A6B27C;
    JSR.W AttemptToGrabSamus_SkipSpinCheck                               ;A6B27F;
    BCS .gotoGrabSamus                                                   ;A6B282;

  .return:
    RTS                                                                  ;A6B284;

  .gotoGrabSamus:
    JMP.W GrabSamus                                                      ;A6B285;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $B288:  ;;;
RidleyHurtAIMaxTimer:
    dw $0008                                                             ;A6B288;


;;; $B28A: Time is frozen AI - enemy $E17F (Ridley) ;;;
TimeIsFrozenAI_Ridley:
; The only time is frozen AI in the game!
    LDA.W #$0000                                                         ;A6B28A;
    STA.L Ridley.unknown8008                                             ;A6B28D;
    LDA.W #$0001                                                         ;A6B291;
    STA.W Enemy.frameCounter                                             ;A6B294; fallthrough to HurtAI_Ridley


;;; $B297: Hurt AI - enemy $E17F (Ridley) ;;;
HurtAI_Ridley:
    LDA.W Enemy.frameCounter                                             ;A6B297;
    AND.W #$0001                                                         ;A6B29A;
    BNE .timeIsFrozen                                                    ;A6B29D;
    JSR.W HandleRidleySamusInteractionBit                                ;A6B29F;
    JSR.W PowerBombCheck                                                 ;A6B2A2;
    PEA.W .manualReturn-1                                                ;A6B2A5;
    JMP.W (Ridley.function)                                              ;A6B2A8;

  .manualReturn:
    LDA.L Ridley.activeFlag                                              ;A6B2AB;
    BEQ .checkHoldingSamus                                               ;A6B2AF;
    JSR.W HandleMovementAndMainBodyWallCollisions                        ;A6B2B1;
    JSR.W HandleWingFlapping                                             ;A6B2B4;
    JSR.W HandleRidleyTailAI                                             ;A6B2B7;

  .timeIsFrozen:
    JSR.W KillProjectilesWithRidleyTailTip                               ;A6B2BA;
    JSR.W MakeRidleysWingsAndTailFlashWhenHit                            ;A6B2BD;
    JSR.W DrawRidleyTail                                                 ;A6B2C0;
    JSR.W DrawRidleysWings                                               ;A6B2C3;
    JSR.W DetermineAndSetRidleySpeedAndColorPalette                      ;A6B2C6;
    JSR.W AnimateRidleysRibs                                             ;A6B2C9;
    LDA.L Ridley.unknown8008                                             ;A6B2CC;
    CLC                                                                  ;A6B2D0;
    ADC.W #$0001                                                         ;A6B2D1;
    CMP.W RidleyHurtAIMaxTimer                                           ;A6B2D4;
    BMI +                                                                ;A6B2D7;
    LDA.W RidleyHurtAIMaxTimer                                           ;A6B2D9;

+   STA.L Ridley.unknown8008                                             ;A6B2DC;
    LDA.L Ridley.unknown8008                                             ;A6B2E0; >.<
    CMP.W RidleyHurtAIMaxTimer                                           ;A6B2E4;
    BMI .return                                                          ;A6B2E7;

  .checkHoldingSamus:
    LDA.L Ridley.holdingSamusFlag                                        ;A6B2E9;
    BEQ .return                                                          ;A6B2ED;
    JSR.W MoveSamusToWithinRidleysClawsIfHolding                         ;A6B2EF;

  .return:
    RTL                                                                  ;A6B2F2;


;;; $B2F3: Ridley function ;;;
Function_Ridley_Startup_Liftoff_FacingRight:
; Startup liftoff, facing right
    LDX.W #$0040                                                         ;A6B2F3;
    LDY.W #$0100                                                         ;A6B2F6;
    STX.B $12                                                            ;A6B2F9;
    STY.B $14                                                            ;A6B2FB;
    LDX.W #$0000                                                         ;A6B2FD;
    LDY.W #$000E                                                         ;A6B300;
    JSR.W AccelerateRidleyTowardDesiredXYPosition_NoDecelerationBoost    ;A6B303;
    LDA.W #$0008                                                         ;A6B306;
    STA.B $16                                                            ;A6B309;
    STA.B $18                                                            ;A6B30B;
    JSL.L CheckForEnemyCollisionWithRectangle                            ;A6B30D;
    BCC .collision                                                       ;A6B311;
    RTS                                                                  ;A6B313;

  .collision:
    LDA.W #$0001                                                         ;A6B314;
    STA.L Ridley.status                                                  ;A6B317;
    LDA.W #DetermineAndExecuteNewRidleyAIScript                          ;A6B31B;
    STA.W Ridley.function                                                ;A6B31E; fallthrough to DetermineAndExecuteNewRidleyAIScript


;;; $B321: Ridley function ;;;
DetermineAndExecuteNewRidleyAIScript:
; Get new AI script (main battle engine)
    JSR.W GetNewRidleyAIScript                                           ;A6B321;
    JSL.L GenerateRandomNumber                                           ;A6B324;
    AND.W #$0007                                                         ;A6B328;
    ASL                                                                  ;A6B32B;
    TAY                                                                  ;A6B32C;
    LDA.B ($12),Y                                                        ;A6B32D;
    STA.W Ridley.function                                                ;A6B32F;
    JMP.W (Ridley.function)                                              ;A6B332;


;;; $B335:  ;;;
GetNewRidleyAIScript:
; Get new AI script
    LDA.W MovementType                                                   ;A6B335;
    AND.W #$00FF                                                         ;A6B338;
    CMP.W #$0003                                                         ;A6B33B;
    BNE .SamusNotSpinJumping                                             ;A6B33E;
    LDA.W #CheckIfRidleyBelowHalfHealth_spinJumping                      ;A6B340;
    STA.B $12                                                            ;A6B343;
    RTS                                                                  ;A6B345;

  .SamusNotSpinJumping:
    LDA.W Enemy.health                                                   ;A6B346;
    BNE .RidleyNotDead                                                   ;A6B349;
    LDA.W #CheckIfRidleyBelowHalfHealth_zeroHealth                       ;A6B34B;
    STA.B $12                                                            ;A6B34E;
    LDA.L Ridley.finalGrabAttemptCounter                                 ;A6B350;
    INC                                                                  ;A6B354;
    STA.L Ridley.finalGrabAttemptCounter                                 ;A6B355;
    RTS                                                                  ;A6B359;

  .RidleyNotDead:
    CMP.W #$3840                                                         ;A6B35A;
    BPL .notBelowHalfHealth                                              ;A6B35D;
    LDY.W #CheckIfRidleyBelowHalfHealth_belowHalfHealth                  ;A6B35F;
    STY.B $12                                                            ;A6B362;
    RTS                                                                  ;A6B364;

  .notBelowHalfHealth:
    JSR.W CheckIfSamusIsBelowTailbounceThreshold                         ;A6B365;
    BCC .SamusYBelow160                                                  ;A6B368;
    LDY.W #CheckIfRidleyBelowHalfHealth_SamusYAbove160                   ;A6B36A;
    STY.B $12                                                            ;A6B36D;
    RTS                                                                  ;A6B36F;

  .SamusYBelow160:
    JSR.W CheckIfSpinJumpGrapplingDamageBoosting                         ;A6B370;
    BCC CheckIfRidleyBelowHalfHealth                                     ;A6B373;
    LDY.W #CheckIfRidleyBelowHalfHealth_notSpinJumpGrappleDamageBoost    ;A6B375;
    STY.B $12                                                            ;A6B378;
    RTS                                                                  ;A6B37A;


;;; $B37B:  ;;;
CheckIfRidleyBelowHalfHealth:
    LDY.W #.belowHalfHealth                                              ;A6B37B;
    LDA.W Enemy.health                                                   ;A6B37E;
    CMP.W #$2328                                                         ;A6B381;
    BPL .notBelowHalf                                                    ;A6B384;
    LDY.W #.aboveHalfHealth                                              ;A6B386;

  .notBelowHalf:
    STY.B $12                                                            ;A6B389;
    RTS                                                                  ;A6B38B;

  .belowHalfHealth:
    dw Function_Ridley_FlyToTailbouncingStartPosition                    ;A6B38C;
    dw Function_Ridley_FlyToTailbouncingStartPosition                    ;A6B38E;
    dw Function_Ridley_FlyToTailbouncingStartPosition                    ;A6B390;
    dw Function_Ridley_FlyToTailbouncingStartPosition                    ;A6B392;
    dw Function_Ridley_StartUSwoop                                       ;A6B394;
    dw Function_Ridley_StartUSwoop                                       ;A6B396;
    dw Function_Ridley_StartUSwoop                                       ;A6B398;
    dw Function_Ridley_StartUSwoop                                       ;A6B39A;

  .aboveHalfHealth:
    dw Function_Ridley_StartUSwoop                                       ;A6B39C;
    dw Function_Ridley_StartUSwoop                                       ;A6B39E;
    dw Function_Ridley_StartUSwoop                                       ;A6B3A0;
    dw Function_Ridley_StartUSwoop                                       ;A6B3A2;
    dw Function_Ridley_FlyToTailbouncingStartPosition                    ;A6B3A4;
    dw Function_Ridley_FlyToTailbouncingStartPosition                    ;A6B3A6;
    dw Function_Ridley_FlyToTailbouncingStartPosition                    ;A6B3A8;
    dw Function_Ridley_FlyToTailbouncingStartPosition                    ;A6B3AA;

  .notSpinJumpGrappleDamageBoost:
    dw CheckFor_Deathswoop_PowerBombDodge_MoveToCenter_RamGrabSamus      ;A6B3AC;
    dw CheckFor_Deathswoop_PowerBombDodge_MoveToCenter_RamGrabSamus      ;A6B3AE;
    dw CheckFor_Deathswoop_PowerBombDodge_MoveToCenter_RamGrabSamus      ;A6B3B0;
    dw CheckFor_Deathswoop_PowerBombDodge_MoveToCenter_RamGrabSamus      ;A6B3B2;
    dw CheckFor_Deathswoop_PowerBombDodge_MoveToCenter_RamGrabSamus      ;A6B3B4;
    dw CheckFor_Deathswoop_PowerBombDodge_MoveToCenter_RamGrabSamus      ;A6B3B6;
    dw Function_Ridley_FlyToTailbouncingStartPosition                    ;A6B3B8;
    dw Function_Ridley_FlyToTailbouncingStartPosition                    ;A6B3BA;

  .SamusYAbove160:
    dw Function_Ridley_FlyToTailbouncingStartPosition                    ;A6B3BC;
    dw Function_Ridley_FlyToTailbouncingStartPosition                    ;A6B3BE;
    dw Function_Ridley_FlyToTailbouncingStartPosition                    ;A6B3C0;
    dw Function_Ridley_FlyToTailbouncingStartPosition                    ;A6B3C2;
    dw Function_Ridley_FlyToTailbouncingStartPosition                    ;A6B3C4;
    dw Function_Ridley_FlyToTailbouncingStartPosition                    ;A6B3C6;
    dw Function_Ridley_FlyToTailbouncingStartPosition                    ;A6B3C8;
    dw Function_Ridley_FlyToTailbouncingStartPosition                    ;A6B3CA;

  .spinJumping:
    dw Function_Ridley_ConsiderTailbouncing                              ;A6B3CC;
    dw Function_Ridley_ConsiderTailbouncing                              ;A6B3CE;
    dw Function_Ridley_ConsiderTailbouncing                              ;A6B3D0;
    dw Function_Ridley_ConsiderTailbouncing                              ;A6B3D2;
    dw Function_Ridley_ConsiderTailbouncing                              ;A6B3D4;
    dw Function_Ridley_ConsiderTailbouncing                              ;A6B3D6;
    dw Function_Ridley_ConsiderTailbouncing                              ;A6B3D8;
    dw Function_Ridley_ConsiderTailbouncing                              ;A6B3DA;

  .zeroHealth:
    dw CheckFor_Deathswoop_PowerBombDodge_MoveToCenter_RamGrabSamus      ;A6B3DC;
    dw CheckFor_Deathswoop_PowerBombDodge_MoveToCenter_RamGrabSamus      ;A6B3DE;
    dw CheckFor_Deathswoop_PowerBombDodge_MoveToCenter_RamGrabSamus      ;A6B3E0;
    dw CheckFor_Deathswoop_PowerBombDodge_MoveToCenter_RamGrabSamus      ;A6B3E2;
    dw CheckFor_Deathswoop_PowerBombDodge_MoveToCenter_RamGrabSamus      ;A6B3E4;
    dw CheckFor_Deathswoop_PowerBombDodge_MoveToCenter_RamGrabSamus      ;A6B3E6;
    dw CheckFor_Deathswoop_PowerBombDodge_MoveToCenter_RamGrabSamus      ;A6B3E8;
    dw CheckFor_Deathswoop_PowerBombDodge_MoveToCenter_RamGrabSamus      ;A6B3EA;


;;; $B3EC: Ridley function ;;;
Function_Ridley_InitializeMovementToCenter:
; Initailize movement to center
    LDA.W #Function_Ridley_MoveToCenterSide                              ;A6B3EC;
    STA.W Ridley.function                                                ;A6B3EF;
    LDA.W #$0080                                                         ;A6B3F2;
    STA.W Ridley.functionTimer                                           ;A6B3F5; fallthrough to Function_Ridley_MoveToCenterSide


;;; $B3F8: Ridley function ;;;
Function_Ridley_MoveToCenterSide:
; Move to center side
    DEC.W Ridley.functionTimer                                           ;A6B3F8;
    BMI .collision                                                       ;A6B3FB;
    LDX.W #$00C0                                                         ;A6B3FD;
    LDA.L Ridley.facingDirection                                         ;A6B400;
    BEQ .facingLeft                                                      ;A6B404;
    LDX.W #$0060                                                         ;A6B406;

  .facingLeft:
    STX.B $12                                                            ;A6B409;
    LDY.W #$0100                                                         ;A6B40B;
    STY.B $14                                                            ;A6B40E;
    JSR.W GetRidleyAccelerationDivisorIndex                              ;A6B410;
    LDX.W #$0000                                                         ;A6B413;
    JSR.W AccelerateRidleyTowardDesiredXYPosition_NoDecelerationBoost    ;A6B416;
    LDA.W #$0008                                                         ;A6B419;
    STA.B $16                                                            ;A6B41C;
    STA.B $18                                                            ;A6B41E;
    JSL.L CheckForEnemyCollisionWithRectangle                            ;A6B420;
    BCC .collision                                                       ;A6B424;
    RTS                                                                  ;A6B426;

  .collision:
    LDA.W #DetermineAndExecuteNewRidleyAIScript                          ;A6B427;
    STA.W Ridley.function                                                ;A6B42A;
    RTS                                                                  ;A6B42D;


;;; $B42E:  ;;;
GetRidleyAccelerationDivisorIndex:
; Y = 4, 8, A, or C, depending on general speed byte
    LDA.L Ridley.speed                                                   ;A6B42E;
    ASL                                                                  ;A6B432;
    TAY                                                                  ;A6B433;
    LDA.W .accelerationDivisorIndex,Y                                    ;A6B434;
    TAY                                                                  ;A6B437;
    RTS                                                                  ;A6B438;

  .accelerationDivisorIndex:
    dw $0004,$0008,$000A,$000C                                           ;A6B439;


;;; $B441: Ridley function ;;;
Function_Ridley_StartUSwoop:
; Chose to do a U swoop
    LDA.W #Function_Ridley_FlyToUSwoopStartingPosition                   ;A6B441;
    STA.W Ridley.function                                                ;A6B444;
    LDA.W #$000A                                                         ;A6B447;
    STA.L Ridley.timer                                                   ;A6B44A;
    LDA.W #$0000                                                         ;A6B44E;
    STA.L Ridley.currentAngleOfMotion                                    ;A6B451; fallthrough to Function_Ridley_FlyToUSwoopStartingPosition


;;; $B455: Ridley function ;;;
Function_Ridley_FlyToUSwoopStartingPosition:
; Fly to U swoop start
    LDX.W #$00C0                                                         ;A6B455;
    LDA.L Ridley.facingDirection                                         ;A6B458;
    BEQ .facingLeft                                                      ;A6B45C;
    LDX.W #$0040                                                         ;A6B45E;

  .facingLeft:
    STX.B $12                                                            ;A6B461;
    LDY.W #$0080                                                         ;A6B463;
    STY.B $14                                                            ;A6B466;
    LDX.W #$0000                                                         ;A6B468;
    LDY.W #$0001                                                         ;A6B46B;
    JSR.W AccelerateRidleyTowardDesiredXYPosition_NoDecelerationBoost    ;A6B46E;
    LDA.W #$0008                                                         ;A6B471;
    STA.B $16                                                            ;A6B474;
    STA.B $18                                                            ;A6B476;
    JSL.L CheckForEnemyCollisionWithRectangle                            ;A6B478;
    BCS .return                                                          ;A6B47C;
    LDA.W #Function_Ridley_USwoop_FirstDive                              ;A6B47E;
    STA.W Ridley.function                                                ;A6B481;
    LDA.W #$0020                                                         ;A6B484;
    STA.L Ridley.timer                                                   ;A6B487;
    LDA.W #$0000                                                         ;A6B48B;
    STA.L Ridley.currentAngleOfMotion                                    ;A6B48E;

  .return:
    RTS                                                                  ;A6B492;


;;; $B493: Ridley function ;;;
Function_Ridley_USwoop_FirstDive:
; U swoop, first dive
    LDA.L Ridley.facingDirection                                         ;A6B493;
    BNE .notFacingLeft                                                   ;A6B497;
    LDA.W #$FFE0                                                         ;A6B499;
    STA.B $12                                                            ;A6B49C;
    LDA.W #$FE00                                                         ;A6B49E;
    STA.B $14                                                            ;A6B4A1;
    BRA +                                                                ;A6B4A3;

  .notFacingLeft:
    LDA.W #$0020                                                         ;A6B4A5;
    STA.B $12                                                            ;A6B4A8;
    LDA.W #$0200                                                         ;A6B4AA;
    STA.B $14                                                            ;A6B4AD;

+   LDA.W #$0480                                                         ;A6B4AF;
    STA.B $16                                                            ;A6B4B2;
    JSR.W UpdateRidleysUSwoopSpeedAndAngle                               ;A6B4B4;
    LDA.L Ridley.timer                                                   ;A6B4B7;
    BEQ .timerExpired                                                    ;A6B4BB;
    DEC                                                                  ;A6B4BD;
    STA.L Ridley.timer                                                   ;A6B4BE;
    RTS                                                                  ;A6B4C2;

  .timerExpired:
    LDA.W #Function_Ridley_USwoop_DiveToHalfwayPoint                     ;A6B4C3;
    STA.W Ridley.function                                                ;A6B4C6;
    LDA.W #$0014                                                         ;A6B4C9;
    STA.L Ridley.timer                                                   ;A6B4CC;
    RTS                                                                  ;A6B4D0;


;;; $B4D1: Ridley function ;;;
Function_Ridley_USwoop_DiveToHalfwayPoint:
; U swoop, dive to half point
    LDA.L Ridley.facingDirection                                         ;A6B4D1;
    BNE .facingRight                                                     ;A6B4D5;
    LDA.W #$FEC0                                                         ;A6B4D7;
    STA.B $12                                                            ;A6B4DA;
    LDA.W #$C000                                                         ;A6B4DC;
    STA.B $14                                                            ;A6B4DF;
    BRA +                                                                ;A6B4E1;

  .facingRight:
    LDA.W #$0140                                                         ;A6B4E3;
    STA.B $12                                                            ;A6B4E6;
    LDA.W #$4000                                                         ;A6B4E8;
    STA.B $14                                                            ;A6B4EB;

+   LDA.W #$0500                                                         ;A6B4ED;
    STA.B $16                                                            ;A6B4F0;
    JSR.W UpdateRidleysUSwoopSpeedAndAngle                               ;A6B4F2;
    LDA.L Ridley.timer                                                   ;A6B4F5;
    BEQ .timerExpired                                                    ;A6B4F9;
    DEC                                                                  ;A6B4FB;
    STA.L Ridley.timer                                                   ;A6B4FC;
    RTS                                                                  ;A6B500;

  .timerExpired:
    LDA.W #Function_Ridley_USwoop_ClimbAfterHalfwayPoint                 ;A6B501;
    STA.W Ridley.function                                                ;A6B504;
    LDA.W #$0010                                                         ;A6B507;
    STA.L Ridley.timer                                                   ;A6B50A;
    LDA.W #$0001                                                         ;A6B50E;
    STA.L Ridley.tailFlingTrigger                                        ;A6B511;
    RTS                                                                  ;A6B515;


;;; $B516: Ridley function ;;;
Function_Ridley_USwoop_ClimbAfterHalfwayPoint:
; U swoop, climb after half point
    LDA.L Ridley.facingDirection                                         ;A6B516;
    BNE .facingRight                                                     ;A6B51A;
    LDA.W #$FE00                                                         ;A6B51C;
    STA.B $12                                                            ;A6B51F;
    LDA.W #$8800                                                         ;A6B521;
    STA.B $14                                                            ;A6B524;
    BRA +                                                                ;A6B526;

  .facingRight:
    LDA.W #$0200                                                         ;A6B528;
    STA.B $12                                                            ;A6B52B;
    LDA.W #$7800                                                         ;A6B52D;
    STA.B $14                                                            ;A6B530;

+   LDA.W #$0300                                                         ;A6B532;
    STA.B $16                                                            ;A6B535;
    JSR.W UpdateRidleysUSwoopSpeedAndAngle                               ;A6B537;
    LDA.L Ridley.timer                                                   ;A6B53A;
    BEQ .timerExpired                                                    ;A6B53E;
    DEC                                                                  ;A6B540;
    STA.L Ridley.timer                                                   ;A6B541;
    RTS                                                                  ;A6B545;

  .timerExpired:
    LDA.W #Function_Ridley_USwoop_FinalClimb                             ;A6B546;
    STA.W Ridley.function                                                ;A6B549;
    LDA.W #$0020                                                         ;A6B54C;
    STA.L Ridley.timer                                                   ;A6B54F;
    RTS                                                                  ;A6B553;


;;; $B554: Ridley function ;;;
Function_Ridley_USwoop_FinalClimb:
; U Swoop, still climbing
    LDA.L Ridley.facingDirection                                         ;A6B554;
    BNE .facingRight                                                     ;A6B558;
    LDA.W #$FC00                                                         ;A6B55A;
    STA.B $12                                                            ;A6B55D;
    LDA.W #$8800                                                         ;A6B55F;
    STA.B $14                                                            ;A6B562;
    BRA +                                                                ;A6B564;

  .facingRight:
    LDA.W #$0400                                                         ;A6B566;
    STA.B $12                                                            ;A6B569;
    LDA.W #$7800                                                         ;A6B56B;
    STA.B $14                                                            ;A6B56E;

+   LDA.W #$0300                                                         ;A6B570;
    STA.B $16                                                            ;A6B573;
    JSR.W UpdateRidleysUSwoopSpeedAndAngle                               ;A6B575;
    LDA.L Ridley.timer                                                   ;A6B578;
    BEQ .timerExpired                                                    ;A6B57C;
    DEC                                                                  ;A6B57E;
    STA.L Ridley.timer                                                   ;A6B57F;
    RTS                                                                  ;A6B583;

  .timerExpired:
    LDA.W #Function_Ridley_USwoop_End                                    ;A6B584;
    STA.W Ridley.function                                                ;A6B587;
    LDA.W #$0020                                                         ;A6B58A;
    STA.L Ridley.timer                                                   ;A6B58D;
    JMP.W TurnAroundIfFacingAwayFromRoomCenter                           ;A6B591;


;;; $B594: Ridley function ;;;
Function_Ridley_USwoop_End:
; U Swoop End (Chooses CheckFor_Deathswoop_PowerBombDodge_MoveToCenter_RamGrabSamus for next script if Samus is not spinjumping, else DetermineAndExecuteNewRidleyAIScript)
    STZ.B $12                                                            ;A6B594;
    LDA.W #$8000                                                         ;A6B596;
    STA.B $14                                                            ;A6B599;
    LDA.W #$01C0                                                         ;A6B59B;
    STA.B $16                                                            ;A6B59E;
    JSR.W UpdateRidleysUSwoopSpeedAndAngle                               ;A6B5A0;
    LDA.L Ridley.timer                                                   ;A6B5A3;
    BEQ .timerExpired                                                    ;A6B5A7;
    DEC                                                                  ;A6B5A9;
    STA.L Ridley.timer                                                   ;A6B5AA;
    RTS                                                                  ;A6B5AE;

  .timerExpired:
    JSR.W CheckIfSpinJumpGrapplingDamageBoosting                         ;A6B5AF;
    LDY.W #DetermineAndExecuteNewRidleyAIScript                          ;A6B5B2;
    BCC +                                                                ;A6B5B5;
    LDY.W #CheckFor_Deathswoop_PowerBombDodge_MoveToCenter_RamGrabSamus  ;A6B5B7;

+   STY.W Ridley.function                                                ;A6B5BA;
    RTS                                                                  ;A6B5BD;


if !FEATURE_KEEP_UNREFERENCED
;;; $B5BE:  ;;;
UNUSED_A6B5BE:
    dw $FFE0,$0000,$0020                                                 ;A6B5BE;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $B5C4: Ridley function ;;;
Function_Ridley_ConsiderTailbouncing:
; Consider tailbouncing
    LDA.W #$000B                                                         ;A6B5C4;
    STA.L Ridley.movementThreshold                                       ;A6B5C7;
    LDA.W #$0180                                                         ;A6B5CB;
    STA.L Ridley.tailExtensionSpeed                                      ;A6B5CE;
    LDA.W #Function_Ridley_ConsideringTailbouncing                       ;A6B5D2;
    STA.W Ridley.function                                                ;A6B5D5;
    LDA.W RandomNumberSeed                                               ;A6B5D8;
    AND.W #$001F                                                         ;A6B5DB;
    CLC                                                                  ;A6B5DE;
    ADC.W #$0020                                                         ;A6B5DF;
    STA.W Ridley.functionTimer                                           ;A6B5E2; fallthrough to Function_Ridley_ConsideringTailbouncing


;;; $B5E5: Ridley function ;;;
Function_Ridley_ConsideringTailbouncing:
    LDA.L Ridley.facingDirection                                         ;A6B5E5;
    ASL                                                                  ;A6B5E9;
    TAY                                                                  ;A6B5EA;
    LDA.W .targetXPosition,Y                                             ;A6B5EB;
    STA.B $12                                                            ;A6B5EE;
    JSR.W FlyTowardTargetXPositionAndSamusYPosition                      ;A6B5F0;
    BCC .spinJumping                                                     ;A6B5F3;
    JMP.W SetupRidleyTailForTailbouncing                                 ;A6B5F5;

  .spinJumping:
    DEC.W Ridley.functionTimer                                           ;A6B5F8;
    BPL .return                                                          ;A6B5FB;
    LDA.W #Function_Ridley_HoverWhileSamusIsSpinJumping                  ;A6B5FD;
    STA.W Ridley.function                                                ;A6B600;
    LDA.W #$0080                                                         ;A6B603;
    STA.W Ridley.functionTimer                                           ;A6B606;
    JMP.W TurnAroundIfFacingAwayFromRoomCenter                           ;A6B609;

  .return:
    RTS                                                                  ;A6B60C;

  .targetXPosition:
; target X positions, indexed by facing direction: left, turning, right
    dw $00C0,$0080,$0040                                                 ;A6B60D;


;;; $B613: Ridley function ;;;
Function_Ridley_HoverWhileSamusIsSpinJumping:
; Hover since Samus is spinjumping
    LDA.L Ridley.facingDirection                                         ;A6B613;
    ASL                                                                  ;A6B617;
    TAY                                                                  ;A6B618;
    LDA.W .targetXPosition,Y                                             ;A6B619;
    STA.B $12                                                            ;A6B61C;
    JSR.W FlyTowardTargetXPositionAndSamusYPosition                      ;A6B61E;
    BCC .spinJumping                                                     ;A6B621;
    JMP.W SetupRidleyTailForTailbouncing                                 ;A6B623;

  .spinJumping:
    DEC.W Ridley.functionTimer                                           ;A6B626;
    BPL .return                                                          ;A6B629;
    LDA.W #Function_Ridley_ConsideringTailbouncing                       ;A6B62B;
    STA.W Ridley.function                                                ;A6B62E;
    LDA.W #$0080                                                         ;A6B631;
    STA.W Ridley.functionTimer                                           ;A6B634;
    JMP.W TurnAroundIfFacingAwayFromRoomCenter                           ;A6B637;

  .return:
    RTS                                                                  ;A6B63A;

  .targetXPosition:
; target X positions, indexed by facing direction: left, turning, right
    dw $0040,$0080,$00C0                                                 ;A6B63B;


;;; $B641:  ;;;
FlyTowardTargetXPositionAndSamusYPosition:
; Fly towards $12 (X position) / Samus's Y position
; If Samus is not spin jumping, SEC before RTS. Else CLC and randomly fireball if allowed.
    LDA.W SamusYPosition                                                 ;A6B641;
    CMP.W #$0160                                                         ;A6B644;
    BMI .minY160                                                         ;A6B647;
    LDA.W #$0160                                                         ;A6B649;

  .minY160:
    STA.B $14                                                            ;A6B64C;
    LDX.W #$0000                                                         ;A6B64E;
    JSR.W GetRidleyAccelerationDivisorIndex                              ;A6B651;
    JSR.W AccelerateRidleyTowardDesiredXYPosition_NoDecelerationBoost    ;A6B654;
    LDA.W #$0001                                                         ;A6B657;
    STA.L Ridley.tailFlingTrigger                                        ;A6B65A;
    LDA.W MovementType                                                   ;A6B65E;
    AND.W #$00FF                                                         ;A6B661;
    CMP.W #$0003                                                         ;A6B664;
    BNE .returnSamusSpinJumping                                          ;A6B667;
    LDA.W RandomNumberSeed                                               ;A6B669;
    AND.W #$00FF                                                         ;A6B66C;
    CMP.W #$0080                                                         ;A6B66F;
    BCC .returnSamusNotSpinJumping                                       ;A6B672;
    LDA.L Ridley.roarSFXFlag                                             ;A6B674;
    BNE .returnSamusNotSpinJumping                                       ;A6B678;
    LDA.L Ridley.facingDirection                                         ;A6B67A;
    DEC                                                                  ;A6B67E;
    BEQ .returnSamusNotSpinJumping                                       ;A6B67F;
    LDA.W #InstList_Ridley_FacingLeft_Fireballing_0                      ;A6B681;
    JSR.W SetRidleyInstList                                              ;A6B684;

  .returnSamusNotSpinJumping:
    CLC                                                                  ;A6B687;
    RTS                                                                  ;A6B688;

  .returnSamusSpinJumping:
    SEC                                                                  ;A6B689;
    RTS                                                                  ;A6B68A;


;;; $B68B:  ;;;
SetupRidleyTailForTailbouncing:
    LDA.W #$00F0                                                         ;A6B68B;
    STA.L Ridley.tailExtensionSpeed                                      ;A6B68E;
    LDA.W #$0010                                                         ;A6B692;
    STA.L Ridley.movementThreshold                                       ;A6B695;
    LDA.W #$0001                                                         ;A6B699;
    STA.L Ridley.tailAIIndex                                             ;A6B69C;
    LDA.W #Function_Ridley_FlyToTailbouncingStartPosition                ;A6B6A0;
    STA.W Ridley.function                                                ;A6B6A3;
    RTS                                                                  ;A6B6A6;


;;; $B6A7: Ridley function ;;;
Function_Ridley_FlyToTailbouncingStartPosition:
; Fly to start Tailbouncing
    LDA.W Enemy.YPosition                                                ;A6B6A7;
    CMP.W #$0120                                                         ;A6B6AA;
    BMI .startTailbouncing                                               ;A6B6AD;
    LDA.L Ridley.facingDirection                                         ;A6B6AF;
    ASL                                                                  ;A6B6B3;
    TAY                                                                  ;A6B6B4;
    LDA.W .targetXPositions,Y                                            ;A6B6B5;
    STA.B $12                                                            ;A6B6B8;
    LDA.W #$0120                                                         ;A6B6BA;
    STA.B $14                                                            ;A6B6BD;
    LDX.W #$0000                                                         ;A6B6BF;
    LDY.W #$0000                                                         ;A6B6C2;
    JMP.W AccelerateRidleyTowardDesiredXYPosition_NoDecelerationBoost    ;A6B6C5;

  .targetXPositions:
    dw $00B0,$0080,$0060                                                 ;A6B6C8;

  .startTailbouncing:
    JSR.W TurnAroundIfFacingAwayFromRoomCenter                           ;A6B6CE;
    LDA.W #Function_Ridley_StartTailbouncing                             ;A6B6D1;
    STA.W Ridley.function                                                ;A6B6D4;
    LDA.W #$0020                                                         ;A6B6D7;
    STA.W Ridley.functionTimer                                           ;A6B6DA; fallthrough to Function_Ridley_StartTailbouncing


;;; $B6DD: Ridley function ;;;
Function_Ridley_StartTailbouncing:
; Start tailbouncing
    LDA.W Enemy.XPosition                                                ;A6B6DD;
    STA.B $12                                                            ;A6B6E0;
    LDA.W #$0120                                                         ;A6B6E2;
    STA.B $14                                                            ;A6B6E5;
    LDX.W #$0000                                                         ;A6B6E7;
    LDY.W #$0000                                                         ;A6B6EA;
    JSR.W AccelerateRidleyTowardDesiredXYPosition_NoDecelerationBoost    ;A6B6ED;
    DEC.W Ridley.functionTimer                                           ;A6B6F0;
    BPL .return                                                          ;A6B6F3;
    JSR.W Function_RidleyTail_StartTailbouncing                          ;A6B6F5;
    JSR.W SetSpeedsForTailbouncing                                       ;A6B6F8;
    LDA.W #Function_Ridley_Tailbouncing_AttemptToGrabSamus               ;A6B6FB;
    STA.W Ridley.function                                                ;A6B6FE;
    LDA.W RandomNumberSeed                                               ;A6B701;
    AND.W #$003F                                                         ;A6B704;
    ADC.W #$0080                                                         ;A6B707;
    STA.W Ridley.functionTimer                                           ;A6B70A;

  .return:
    RTS                                                                  ;A6B70D;


;;; $B70E: Ridley function ;;;
Function_Ridley_Tailbouncing_AttemptToGrabSamus:
; Main tailbouncing
    JSR.W AttemptToGrabSamus                                             ;A6B70E;
    BCC .grabFailed                                                      ;A6B711;
    JSR.W RidleyGrabbedSamus_ResetTailAI                                 ;A6B713;
    JMP.W GrabbingSamus_SetMinimumYSpeed_ResetTailAI                     ;A6B716;

  .return:
    RTS                                                                  ;A6B719;

  .grabFailed:
    LDA.W Ridley.YSpeed                                                  ;A6B71A;
    CLC                                                                  ;A6B71D;
    ADC.L Ridley.unknown200C                                             ;A6B71E;
    CMP.W #$0600                                                         ;A6B722;
    BMI .minimum600                                                      ;A6B725;
    LDA.W #$0600                                                         ;A6B727;

  .minimum600:
    STA.W Ridley.YSpeed                                                  ;A6B72A;
    JSR.W CheckForTailbounceCollisionWithSolidBlock                      ;A6B72D;
    BCC .return                                                          ;A6B730;
    LDA.L Ridley.tailTipXPosition                                        ;A6B732;
    STA.B $12                                                            ;A6B736;
    LDA.L Ridley.tailTipYPosition                                        ;A6B738;
    CLC                                                                  ;A6B73C;
    ADC.W #$000C                                                         ;A6B73D;
    STA.B $14                                                            ;A6B740;
    LDA.W #$0009                                                         ;A6B742;
    LDY.W #EnemyProjectile_MiscDust                                      ;A6B745;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A6B748;
    LDA.W #$0076                                                         ;A6B74C;
    JSL.L QueueSound_Lib2_Max6                                           ;A6B74F;
    LDA.W #$000D                                                         ;A6B753;
    STA.W EarthquakeType                                                 ;A6B756;
    LDA.W #$0004                                                         ;A6B759;
    STA.W EarthquakeTimer                                                ;A6B75C;
    JSR.W CheckForTurnaroundDuringTailbounce_RandomlyChangeDirection     ;A6B75F;
    JSR.W SetSpeedsForTailbouncing                                       ;A6B762;
    LDX.W #InitializeTailParts_distanceFromRidleyToTailParts             ;A6B765;
    LDY.W #Ridley.tail1DistanceToRidley                                  ;A6B768;
    JSR.W UpdateTailPartRAMFromXToY                                      ;A6B76B;
    LDA.W #$0C00                                                         ;A6B76E;
    STA.L Ridley.tail1TargetDistanceToRidley                             ;A6B771;
    STA.L Ridley.tail2TargetDistanceToRidley                             ;A6B775;
    STA.L Ridley.tail3TargetDistanceToRidley                             ;A6B779;
    STA.L Ridley.tail4TargetDistanceToRidley                             ;A6B77D;
    STA.L Ridley.tail5TargetDistanceToRidley                             ;A6B781;
    STA.L Ridley.tail6TargetDistanceToRidley                             ;A6B785;
    STA.L Ridley.tailTipTargetDistanceToRidley                           ;A6B789;
    LDA.W #$0004                                                         ;A6B78D;
    STA.L Ridley.tailAIIndex                                             ;A6B790;
    LDA.L Ridley.tailBounceCounter                                       ;A6B794;
    INC                                                                  ;A6B798;
    CMP.W #$0002                                                         ;A6B799;
    BMI .everyOtherBounce                                                ;A6B79C;
    LDA.L Ridley.facingDirection                                         ;A6B79E;
    DEC                                                                  ;A6B7A2;
    BEQ .RidleyTurning                                                   ;A6B7A3;
    LDA.W #InstList_Ridley_FacingLeft_Fireballing_0                      ;A6B7A5;
    JSR.W SetRidleyInstList                                              ;A6B7A8;

  .RidleyTurning:
    LDA.W #$0000                                                         ;A6B7AB;

  .everyOtherBounce:
    STA.L Ridley.tailBounceCounter                                       ;A6B7AE;
    LDA.W #Function_Ridley_Tailbouncing_HitGround                        ;A6B7B2;
    STA.W Ridley.function                                                ;A6B7B5;
    RTS                                                                  ;A6B7B8;


;;; $B7B9: Ridley function ;;;
Function_Ridley_Tailbouncing_HitGround:
; Tailbouncing, hit ground
    JSR.W CheckIfSamusIsBelowTailbounceThreshold                         ;A6B7B9;
    BCC .nextFunction                                                    ;A6B7BC;
    DEC.W Ridley.functionTimer                                           ;A6B7BE;
    BMI .nextFunction                                                    ;A6B7C1;
    LDA.W Ridley.YSpeed                                                  ;A6B7C3;
    CLC                                                                  ;A6B7C6;
    ADC.L Ridley.unknown200E                                             ;A6B7C7;
    STA.W Ridley.YSpeed                                                  ;A6B7CB;
    BMI .return                                                          ;A6B7CE;
    LDA.W #$0000                                                         ;A6B7D0;
    STA.W Ridley.YSpeed                                                  ;A6B7D3;
    LDA.W #Function_Ridley_Tailbouncing_AttemptToGrabSamus               ;A6B7D6;
    STA.W Ridley.function                                                ;A6B7D9;

  .return:
    RTS                                                                  ;A6B7DC;

  .nextFunction:
    JSR.W RidleyGrabbedSamus_ResetTailAI                                 ;A6B7DD;
    LDA.W #DetermineAndExecuteNewRidleyAIScript                          ;A6B7E0;
    STA.W Ridley.function                                                ;A6B7E3;
    RTS                                                                  ;A6B7E6;


;;; $B7E7:  ;;;
CheckForTailbounceCollisionWithSolidBlock:
    LDA.L Ridley.tailTipXPosition                                        ;A6B7E7;
    TAX                                                                  ;A6B7EB;
    LDA.L Ridley.tailTipYPosition                                        ;A6B7EC;
    CLC                                                                  ;A6B7F0;
    ADC.W #$0010                                                         ;A6B7F1;
    TAY                                                                  ;A6B7F4;
    JSL.L CheckForCollisionWithNonAirBlock                               ;A6B7F5;
    BCS .return                                                          ;A6B7F9;
    LDA.L Ridley.tail6XPosition                                          ;A6B7FB;
    TAX                                                                  ;A6B7FF;
    LDA.L Ridley.tail6YPosition                                          ;A6B800;
    CLC                                                                  ;A6B804;
    ADC.W #$0012                                                         ;A6B805;
    TAY                                                                  ;A6B808;
    JSL.L CheckForCollisionWithNonAirBlock                               ;A6B809;
    BCS .return                                                          ;A6B80D;
    LDA.L Ridley.tail5XPosition                                          ;A6B80F;
    TAX                                                                  ;A6B813;
    LDA.L Ridley.tail5YPosition                                          ;A6B814;
    CLC                                                                  ;A6B818;
    ADC.W #$0012                                                         ;A6B819;
    TAY                                                                  ;A6B81C;
    JSL.L CheckForCollisionWithNonAirBlock                               ;A6B81D;
    BCS .return                                                          ;A6B821;
    LDA.L Ridley.tail4XPosition                                          ;A6B823;
    TAX                                                                  ;A6B827;
    LDA.L Ridley.tail4YPosition                                          ;A6B828;
    CLC                                                                  ;A6B82C;
    ADC.W #$0012                                                         ;A6B82D;
    TAY                                                                  ;A6B830;
    JSL.L CheckForCollisionWithNonAirBlock                               ;A6B831;
    BCS .return                                                          ;A6B835;
    LDA.L Ridley.tail3XPosition                                          ;A6B837;
    TAX                                                                  ;A6B83B;
    LDA.L Ridley.tail3YPosition                                          ;A6B83C;
    CLC                                                                  ;A6B840;
    ADC.W #$0012                                                         ;A6B841;
    TAY                                                                  ;A6B844;
    JSL.L CheckForCollisionWithNonAirBlock                               ;A6B845;
    BCS .return                                                          ;A6B849;
    NOP                                                                  ;A6B84B; >.<

  .return:
    RTS                                                                  ;A6B84C;


;;; $B84D:  ;;;
RidleyGrabbedSamus_ResetTailAI:
    LDA.W #$0001                                                         ;A6B84D;
    STA.L Ridley.tailAIIndex                                             ;A6B850;
    STA.L Ridley.tailAngularSpeed                                        ;A6B854;
    RTS                                                                  ;A6B858;


;;; $B859:  ;;;
AttemptToGrabSamus:
; Attempt to grab Samus
    JSR.W CheckIfSpinJumpGrapplingDamageBoosting                         ;A6B859;
    BCS .grab                                                            ;A6B85C;
    RTS                                                                  ;A6B85E;

  .grab:
    LDX.W #$0004                                                         ;A6B85F;
    LDY.W #$0004                                                         ;A6B862; fallthrough to AttemptToGrabSamus_SkipSpinCheck


AttemptToGrabSamus_SkipSpinCheck:
    STX.B $16                                                            ;A6B865;
    STY.B $18                                                            ;A6B867;
    LDA.L Ridley.facingDirection                                         ;A6B869;
    ASL                                                                  ;A6B86D;
    TAY                                                                  ;A6B86E;
    LDA.W HoldingSamusXDispacement,Y                                     ;A6B86F;
    CLC                                                                  ;A6B872;
    ADC.W Enemy.XPosition                                                ;A6B873;
    STA.B $12                                                            ;A6B876;
    LDA.L Ridley.YDisplacementTableIndex                                 ;A6B878;
    TAY                                                                  ;A6B87C;
    LDA.W HoldingSamusYDispacement,Y                                     ;A6B87D;
    CLC                                                                  ;A6B880;
    ADC.W Enemy.YPosition                                                ;A6B881;
    STA.B $14                                                            ;A6B884;
    JMP.W EfficientCollisionDetectionForSamusAt_12_14                    ;A6B886;


;;; $B889:  ;;;
GrabbingSamus_SetMinimumYSpeed_ResetTailAI:
    LDA.W Ridley.YSpeed                                                  ;A6B889;
    BMI +                                                                ;A6B88C;
    EOR.W #$FFFF                                                         ;A6B88E;
    INC                                                                  ;A6B891;

+   CMP.W #$FE00                                                         ;A6B892;
    BMI +                                                                ;A6B895;
    LDA.W #$FE00                                                         ;A6B897;

+   STA.W Ridley.YSpeed                                                  ;A6B89A;
    JSR.W RidleyGrabbedSamus_ResetTailAI                                 ;A6B89D;
    LDA.W #Function_Ridley_InPositionToGrabSamus_NoPowerBomb             ;A6B8A0;
    STA.W Ridley.function                                                ;A6B8A3;
    JMP.W Function_Ridley_InPositionToGrabSamus_NoPowerBomb              ;A6B8A6;


;;; $B8A9:  ;;;
CheckForTurnaroundDuringTailbounce_RandomlyChangeDirection:
    LDA.W Ridley.XSpeed                                                  ;A6B8A9;
    BNE .storeXSpeed                                                     ;A6B8AC;
    LDA.W #$00C0                                                         ;A6B8AE;
    BIT.W Enemy.XPosition-1                                              ;A6B8B1;
    BPL +                                                                ;A6B8B4;
    EOR.W #$FFFF                                                         ;A6B8B6;
    INC                                                                  ;A6B8B9;

+   STA.W Ridley.XSpeed                                                  ;A6B8BA;

  .storeXSpeed:
    LDA.W Enemy.XPosition                                                ;A6B8BD;
    SEC                                                                  ;A6B8C0;
    SBC.W SamusXPosition                                                 ;A6B8C1;
    EOR.W Ridley.XSpeed                                                  ;A6B8C4;
    BMI +                                                                ;A6B8C7;
    LDA.W Enemy.XPosition                                                ;A6B8C9;
    CMP.L Ridley.leftBoundary                                            ;A6B8CC;
    BMI .crossedLeftBoundary                                             ;A6B8D0;
    CMP.L Ridley.rightBoundary                                           ;A6B8D2;
    BPL .crossedRightBoundary                                            ;A6B8D6;
    LDA.W RandomNumberSeed                                               ;A6B8D8;
    CMP.W #$0555                                                         ;A6B8DB;
    BCC .return                                                          ;A6B8DE;

  .changeDirection:
    LDA.W Ridley.XSpeed                                                  ;A6B8E0;
    EOR.W #$FFFF                                                         ;A6B8E3;
    INC                                                                  ;A6B8E6;
    STA.W Ridley.XSpeed                                                  ;A6B8E7;

  .return:
    RTS                                                                  ;A6B8EA;

+   LDA.W Enemy.XPosition                                                ;A6B8EB;
    CMP.L Ridley.leftBoundary                                            ;A6B8EE;
    BMI .crossedLeftBoundary                                             ;A6B8F2;
    CMP.L Ridley.rightBoundary                                           ;A6B8F4;
    BPL .crossedRightBoundary                                            ;A6B8F8;
    LDA.W RandomNumberSeed                                               ;A6B8FA;
    CMP.W #$0555                                                         ;A6B8FD;
    BCC .changeDirection                                                 ;A6B900;
    RTS                                                                  ;A6B902;

  .crossedLeftBoundary:
    LDA.W Ridley.XSpeed                                                  ;A6B903;
    BMI .changeDirection                                                 ;A6B906;
    RTS                                                                  ;A6B908;

  .crossedRightBoundary:
    LDA.W Ridley.XSpeed                                                  ;A6B909;
    BPL .changeDirection                                                 ;A6B90C;
    RTS                                                                  ;A6B90E;


;;; $B90F:  ;;;
SetSpeedsForTailbouncing:
; Set speeds for tailbouncing (depends on random and speed
    LDA.W RandomNumberSeed                                               ;A6B90F;
    AND.W #$0003                                                         ;A6B912;
    ASL                                                                  ;A6B915;
    TAY                                                                  ;A6B916;
    LDA.W .XSpeedPointers,Y                                              ;A6B917;
    STA.B $12                                                            ;A6B91A;
    LDA.W .YSpeedPointers,Y                                              ;A6B91C;
    STA.B $14                                                            ;A6B91F;
    LDA.L Ridley.speed                                                   ;A6B921;
    CLC                                                                  ;A6B925;
    ADC.W #$0002                                                         ;A6B926;
    ASL                                                                  ;A6B929;
    TAY                                                                  ;A6B92A;
    LDA.W .acceleration,Y                                                ;A6B92B;
    STA.L Ridley.unknown200E                                             ;A6B92E;
    LDA.W .store7E200C,Y                                                 ;A6B932;
    STA.L Ridley.unknown200C                                             ;A6B935;
    LDA.B ($14),Y                                                        ;A6B939;
    STA.W Ridley.YSpeed                                                  ;A6B93B;
    LDA.B ($12),Y                                                        ;A6B93E;
    LDX.W Ridley.XSpeed                                                  ;A6B940;
    BPL +                                                                ;A6B943;
    EOR.W #$FFFF                                                         ;A6B945;
    INC                                                                  ;A6B948;

+   STA.W Ridley.XSpeed                                                  ;A6B949;
    RTS                                                                  ;A6B94C;

  .acceleration:
; tailbouncing accel/delays?/thresholds?, indexed by Ridley speedup (Ridley.speed)
    dw $000A,$0010,$0020,$0030,$0040,$0050                               ;A6B94D;
  .store7E200C:
    dw $0010,$0020,$0040,$0080,$0400,$0500                               ;A6B959;

; speed table pointers, indexed randomly
  .XSpeedPointers:
    dw .randomXSpeed0                                                    ;A6B965;
    dw .randomXSpeed1                                                    ;A6B967;
    dw .randomXSpeed2                                                    ;A6B969;
    dw .randomXSpeed3                                                    ;A6B96B;
  .YSpeedPointers:
    dw .randomYSpeed0                                                    ;A6B96D;
    dw .randomYSpeed1                                                    ;A6B96F;
    dw .randomYSpeed2                                                    ;A6B971;
    dw .randomYSpeed3                                                    ;A6B973;

  .randomXSpeed0:
    dw $0058,$0070,$00A0,$00A8,$00B0,$00B8                               ;A6B975; slow

  .randomXSpeed1:
    dw $0078,$0090,$00C0,$00C8,$00D0,$00D8                               ;A6B981;

  .randomXSpeed2:
    dw $0098,$00B0,$00E0,$00E8,$00F0,$00F8                               ;A6B98D;

  .randomXSpeed3:
    dw $00B8,$00D0,$0100,$0108,$0110,$0118                               ;A6B999; fast

  .randomYSpeed0:
    dw $FE60,$FDE0,$FCE0,$FC20,$FA80,$F980                               ;A6B9A5; slow

  .randomYSpeed1:
    dw $FE00,$FD80,$FC80,$FBC0,$FA60,$F960                               ;A6B9B1;

  .randomYSpeed2:
    dw $FDE0,$FD60,$FC60,$FB80,$FA40,$F940                               ;A6B9BD;

  .randomYSpeed3:
    dw $FDC0,$FD40,$FC40,$FB60,$FA20,$F920                               ;A6B9C9; fast


;;; $B9D5:  ;;;
HoldingSamusXDispacement:
; indexed by Ridley facing direction: left, turning, right
    dw $000C,$0000,$FFF4                                                 ;A6B9D5;

HoldingSamusYDispacement:
; indexed by Ridley.YDisplacementTableIndex, which is always 0 in Norfair and never read in Ceres
    dw $0023,$002E,$0038                                                 ;A6B9DB;


;;; $B9E1:  ;;;
MoveSamusToWithinRidleysClawsIfHolding:
; If holding Samus, move Samus to within Ridley's claws
    LDA.L Ridley.XDisplacementWhileHoldingSamus                          ;A6B9E1;
    BEQ .noSamusXDisplacement                                            ;A6B9E5;
    STA.B $12                                                            ;A6B9E7;
    BPL +                                                                ;A6B9E9;
    EOR.W #$FFFF                                                         ;A6B9EB;
    INC                                                                  ;A6B9EE;

+   SEC                                                                  ;A6B9EF;
    SBC.W #$0004                                                         ;A6B9F0;
    BPL .positive                                                        ;A6B9F3;
    LDA.W #$0000                                                         ;A6B9F5;
    BRA +                                                                ;A6B9F8;

  .positive:
    BIT.B $12                                                            ;A6B9FA;
    BPL +                                                                ;A6B9FC;
    EOR.W #$FFFF                                                         ;A6B9FE;
    INC                                                                  ;A6BA01;

+   STA.L Ridley.XDisplacementWhileHoldingSamus                          ;A6BA02;

  .noSamusXDisplacement:
    LDA.L Ridley.YDisplacementWhileHoldingSamus                          ;A6BA06;
    BEQ .noSamusYDisplacement                                            ;A6BA0A;
    STA.B $12                                                            ;A6BA0C;
    BPL +                                                                ;A6BA0E;
    EOR.W #$FFFF                                                         ;A6BA10;
    INC                                                                  ;A6BA13;

+   SEC                                                                  ;A6BA14;
    SBC.W #$0004                                                         ;A6BA15;
    BPL .positive2                                                       ;A6BA18;
    LDA.W #$0000                                                         ;A6BA1A;
    BRA +                                                                ;A6BA1D;

  .positive2:
    BIT.B $12                                                            ;A6BA1F;
    BPL +                                                                ;A6BA21;
    EOR.W #$FFFF                                                         ;A6BA23;
    INC                                                                  ;A6BA26;

+   STA.L Ridley.YDisplacementWhileHoldingSamus                          ;A6BA27;

  .noSamusYDisplacement:
    LDA.L Ridley.facingDirection                                         ;A6BA2B;
    ASL                                                                  ;A6BA2F;
    TAY                                                                  ;A6BA30;
    LDA.W HoldingSamusXDispacement,Y                                     ;A6BA31;
    ADC.W Enemy.XPosition                                                ;A6BA34;
    CLC                                                                  ;A6BA37;
    ADC.L Ridley.XDisplacementWhileHoldingSamus                          ;A6BA38;
    STA.W SamusXPosition                                                 ;A6BA3C;
    LDA.L Ridley.YDisplacementTableIndex                                 ;A6BA3F;
    TAY                                                                  ;A6BA43;
    LDA.W HoldingSamusYDispacement,Y                                     ;A6BA44;
    CLC                                                                  ;A6BA47;
    ADC.W Enemy.YPosition                                                ;A6BA48;
    CLC                                                                  ;A6BA4B;
    ADC.L Ridley.YDisplacementWhileHoldingSamus                          ;A6BA4C;
    STA.W SamusYPosition                                                 ;A6BA50;
    RTS                                                                  ;A6BA53;


;;; $BA54:  ;;;
SetDisplacementForRidleyGrabbingSamus:
; Set displacement for Ridley grabbing Samus
    LDA.L Ridley.facingDirection                                         ;A6BA54;
    ASL                                                                  ;A6BA58;
    TAY                                                                  ;A6BA59;
    LDA.W HoldingSamusXDispacement,Y                                     ;A6BA5A;
    ADC.W Enemy.XPosition                                                ;A6BA5D;
    SEC                                                                  ;A6BA60;
    SBC.W SamusXPosition                                                 ;A6BA61;
    EOR.W #$FFFF                                                         ;A6BA64;
    INC                                                                  ;A6BA67;
    STA.L Ridley.XDisplacementWhileHoldingSamus                          ;A6BA68;
    LDA.L Ridley.YDisplacementTableIndex                                 ;A6BA6C;
    TAY                                                                  ;A6BA70;
    LDA.W HoldingSamusYDispacement,Y                                     ;A6BA71;
    CLC                                                                  ;A6BA74;
    ADC.W Enemy.YPosition                                                ;A6BA75;
    SEC                                                                  ;A6BA78;
    SBC.W SamusYPosition                                                 ;A6BA79;
    EOR.W #$FFFF                                                         ;A6BA7C;
    INC                                                                  ;A6BA7F;
    STA.L Ridley.YDisplacementWhileHoldingSamus                          ;A6BA80;
    RTS                                                                  ;A6BA84;


;;; $BA85:  ;;;
CheckIfRidleyIsReadyToExplode:
    LDA.L Ridley.finalGrabAttemptCounter                                 ;A6BA85;
    CMP.W #$000A                                                         ;A6BA89;
    BMI .notDead                                                         ;A6BA8C;
    JSL.L SetRidleyAsDead                                                ;A6BA8E;
    LDA.W #Function_Ridley_FinalRoar                                     ;A6BA92;
    STA.W Ridley.function                                                ;A6BA95;
    JMP.W Function_Ridley_FinalRoar                                      ;A6BA98;

  .notDead:
    LDA.W SamusProjectile_PowerBombFlag                                  ;A6BA9B;
    BEQ .noPowerBomb                                                     ;A6BA9E;
    LDA.W #Function_Ridley_DodgingPowerbomb_MaybeHoldingSamus            ;A6BAA0;
    STA.W Ridley.function                                                ;A6BAA3;
    JMP.W Function_Ridley_DodgingPowerbomb_MaybeHoldingSamus             ;A6BAA6;

  .noPowerBomb:
    LDA.W #Function_Ridley_InitializeMovementToCenter                    ;A6BAA9;
    STA.W Ridley.function                                                ;A6BAAC;
    LDA.W #$0001                                                         ;A6BAAF;
    STA.L Ridley.tailFlingTrigger                                        ;A6BAB2;
    RTS                                                                  ;A6BAB6;


;;; $BAB7: Ridley function ;;;
CheckFor_Deathswoop_PowerBombDodge_MoveToCenter_RamGrabSamus:
; Check to do Deathswoop/Powerbomb dodge/Move-to-Center, or attempt to ram/grab Samus
; Deathswoop/Powerbomb dodge/Move if:
;     Samus is spinjumping, Ridley has collided with a wall, Samus is behind or above Ridley
    JSR.W CheckIfSpinJumpGrapplingDamageBoosting                         ;A6BAB7;
    BCC CheckIfRidleyIsReadyToExplode                                    ;A6BABA;
    LDA.L Ridley.collisionDirection                                      ;A6BABC;
    BNE CheckIfRidleyIsReadyToExplode                                    ;A6BAC0;
    LDA.L Ridley.facingDirection                                         ;A6BAC2;
    ASL                                                                  ;A6BAC6;
    TAY                                                                  ;A6BAC7;
    LDA.W .signedBitmask,Y                                               ;A6BAC8;
    STA.B $12                                                            ;A6BACB;
    LDA.W Enemy.XPosition                                                ;A6BACD;
    SEC                                                                  ;A6BAD0;
    SBC.W SamusXPosition                                                 ;A6BAD1;
    STA.B $14                                                            ;A6BAD4;
    EOR.B $12                                                            ;A6BAD6;
    BPL +                                                                ;A6BAD8;
    LDA.B $14                                                            ;A6BADA;
    BPL .positive                                                        ;A6BADC;
    EOR.W #$FFFF                                                         ;A6BADE;
    INC                                                                  ;A6BAE1;

  .positive:
    CMP.W #$0020                                                         ;A6BAE2;
    BPL CheckIfRidleyIsReadyToExplode                                    ;A6BAE5;

+   LDA.W Enemy.YPosition                                                ;A6BAE7;
    CLC                                                                  ;A6BAEA;
    ADC.W #$0023                                                         ;A6BAEB;
    SEC                                                                  ;A6BAEE;
    SBC.W SamusYPosition                                                 ;A6BAEF;
    BPL CheckIfRidleyIsReadyToExplode                                    ;A6BAF2;
    LDX.W #$FFF0                                                         ;A6BAF4;
    LDA.L Ridley.facingDirection                                         ;A6BAF7;
    BEQ .facingLeft                                                      ;A6BAFB;
    LDX.W #$0010                                                         ;A6BAFD;

  .facingLeft:
    TXA                                                                  ;A6BB00;
    CLC                                                                  ;A6BB01;
    ADC.W SamusXPosition                                                 ;A6BB02;
    STA.B $12                                                            ;A6BB05;
    LDA.W SamusYPosition                                                 ;A6BB07;
    CLC                                                                  ;A6BB0A;
    ADC.W #$FFFC                                                         ;A6BB0B;
    STA.B $14                                                            ;A6BB0E;
    LDX.W #$0000                                                         ;A6BB10;
    LDA.L Ridley.speed                                                   ;A6BB13;
    ASL                                                                  ;A6BB17;
    TAY                                                                  ;A6BB18;
    LDA.W .accelerationDivisorIndex,Y                                    ;A6BB19;
    TAY                                                                  ;A6BB1C;
    JSR.W AccelerateRidleyTowardDesiredXYPosition_NoDecelerationBoost    ;A6BB1D;
    LDA.L Ridley.facingDirection                                         ;A6BB20;
    ASL                                                                  ;A6BB24;
    TAY                                                                  ;A6BB25;
    LDA.W HoldingSamusXDispacement,Y                                     ;A6BB26;
    CLC                                                                  ;A6BB29;
    ADC.W Enemy.XPosition                                                ;A6BB2A;
    STA.B $12                                                            ;A6BB2D;
    LDA.W #$0023                                                         ;A6BB2F;
    CLC                                                                  ;A6BB32;
    ADC.W Enemy.YPosition                                                ;A6BB33;
    STA.B $14                                                            ;A6BB36;
    LDA.W #$0008                                                         ;A6BB38;
    STA.B $16                                                            ;A6BB3B;
    LDA.W #$000C                                                         ;A6BB3D;
    STA.B $18                                                            ;A6BB40;
    JSR.W EfficientCollisionDetectionForSamusAt_12_14                    ;A6BB42;
    BCS .collision                                                       ;A6BB45;
    RTS                                                                  ;A6BB47;

  .signedBitmask:
; indexed by Ridley facing direction
; left, turning, right
    dw $0000,$0000,$8000                                                 ;A6BB48;

  .accelerationDivisorIndex:
; acceleration divisor index
    dw $0001,$0003,$0007,$000A                                           ;A6BB4E;

  .collision:
    LDA.W Ridley.YSpeed                                                  ;A6BB56;
    EOR.W #$FFFF                                                         ;A6BB59;
    INC                                                                  ;A6BB5C;
    STA.W Ridley.YSpeed                                                  ;A6BB5D;
    LDA.W Enemy.health                                                   ;A6BB60;
    BEQ .dead                                                            ;A6BB63;
    LDA.W SamusProjectile_PowerBombFlag                                  ;A6BB65; >_<
    LDA.W SamusProjectile_PowerBombFlag                                  ;A6BB68;
    BEQ Function_Ridley_InPositionToGrabSamus_NoPowerBomb                ;A6BB6B;
    JSR.W GrabSamus                                                      ;A6BB6D;
    LDA.W #Function_Ridley_DodgingPowerbomb_MaybeHoldingSamus            ;A6BB70;
    STA.W Ridley.function                                                ;A6BB73;
    JMP.W Function_Ridley_DodgingPowerbomb_MaybeHoldingSamus             ;A6BB76;

  .dead:
    LDA.L Ridley.holdingSamusFlag                                        ;A6BB79;
    BNE .holdingSamus                                                    ;A6BB7D;
    JSR.W GrabSamus                                                      ;A6BB7F;

  .holdingSamus:
    JSL.L SetRidleyAsDead                                                ;A6BB82;
    LDA.W #Function_Ridley_MoveToDeathSpot                               ;A6BB86;
    STA.W Ridley.function                                                ;A6BB89;
    JMP.W Function_Ridley_MoveToDeathSpot                                ;A6BB8C;


;;; $BB8F: Ridley function ;;;
Function_Ridley_InPositionToGrabSamus_NoPowerBomb:
; Ridley in position to grab Samus, no powerbombs
    LDA.L Ridley.facingDirection                                         ;A6BB8F;
    ASL                                                                  ;A6BB93;
    TAY                                                                  ;A6BB94;
    LDA.W TargetXPositionHoldingSamus,Y                                  ;A6BB95;
    STA.L Ridley.targetXLocationWhenHoldingSamus                         ;A6BB98;
    LDA.W Enemy.YPosition                                                ;A6BB9C;
    CLC                                                                  ;A6BB9F;
    ADC.W #$FFC0                                                         ;A6BBA0;
    CMP.W #$0100                                                         ;A6BBA3;
    BPL .minimum100                                                      ;A6BBA6;
    LDA.W #$0100                                                         ;A6BBA8;

  .minimum100:
    STA.L Ridley.targetYLocationWhenHoldingSamus                         ;A6BBAB;
    LDA.L Ridley.holdingSamusFlag                                        ;A6BBAF;
    BNE .holdingSamus                                                    ;A6BBB3;
    JSR.W GrabSamus                                                      ;A6BBB5;

  .holdingSamus:
    LDA.W #Function_Ridley_HoldingSamus_MoveTowardTargetPosition         ;A6BBB8;
    STA.W Ridley.function                                                ;A6BBBB;
    LDA.W #$0020                                                         ;A6BBBE;
    STA.W Ridley.functionTimer                                           ;A6BBC1; fallthrough to Function_Ridley_HoldingSamus_MoveTowardTargetPosition


;;; $BBC4: Ridley function ;;;
Function_Ridley_HoldingSamus_MoveTowardTargetPosition:
; Ridley is holding Samus, move towards target position then go to next script
    LDA.L Ridley.targetXLocationWhenHoldingSamus                         ;A6BBC4;
    STA.B $12                                                            ;A6BBC8;
    LDA.L Ridley.targetYLocationWhenHoldingSamus                         ;A6BBCA;
    STA.B $14                                                            ;A6BBCE;
    LDX.W #$0000                                                         ;A6BBD0;
    LDY.W #$0000                                                         ;A6BBD3;
    JSR.W AccelerateRidleyTowardDesiredXYPosition_NoDecelerationBoost    ;A6BBD6;
    DEC.W Ridley.functionTimer                                           ;A6BBD9;
    BPL .return                                                          ;A6BBDC;
    LDA.W #Function_Ridley_DropSamus                                     ;A6BBDE;
    STA.W Ridley.function                                                ;A6BBE1;
    LDA.W #$0020                                                         ;A6BBE4;
    STA.W Ridley.functionTimer                                           ;A6BBE7;

  .return:
    RTS                                                                  ;A6BBEA;


TargetXPositionHoldingSamus:
; target X when holding Samus
    dw $0040,$0000,$00D0                                                 ;A6BBEB;


;;; $BBF1: Ridley function ;;;
Function_Ridley_DropSamus:
; Drop Samus
    DEC.W Ridley.functionTimer                                           ;A6BBF1;
    BMI .release                                                         ;A6BBF4;
    LDA.L Ridley.targetXLocationWhenHoldingSamus                         ;A6BBF6;
    STA.B $12                                                            ;A6BBFA;
    LDA.W #$0100                                                         ;A6BBFC;
    STA.B $14                                                            ;A6BBFF;
    LDX.W #$0000                                                         ;A6BC01;
    LDY.W #$0000                                                         ;A6BC04;
    JMP.W AccelerateRidleyTowardDesiredXYPosition_NoDecelerationBoost    ;A6BC07;

  .release:
    LDA.W #$0008                                                         ;A6BC0A;
    STA.L Ridley.movementThreshold                                       ;A6BC0D;
    LDA.W #$00F0                                                         ;A6BC11;
    STA.L Ridley.tailExtensionSpeed                                      ;A6BC14;
    JSR.W ReleaseSamus                                                   ;A6BC18;
    LDA.W #Function_Ridley_FallBackIntoPositionAfterDroppingSamus        ;A6BC1B;
    STA.W Ridley.function                                                ;A6BC1E;
    LDA.W #$0040                                                         ;A6BC21;
    STA.W Ridley.functionTimer                                           ;A6BC24;
    RTS                                                                  ;A6BC27;


if !FEATURE_KEEP_UNREFERENCED
UNUSED_A6BC28:
    dw $00B0,$0000,$0050                                                 ;A6BC28;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $BC2E: Ridley function ;;;
Function_Ridley_FallBackIntoPositionAfterDroppingSamus:
; Short time after dropping Samus, before returning to DetermineAndExecuteNewRidleyAIScript
    DEC.W Ridley.functionTimer                                           ;A6BC2E;
    BMI .timerExpired                                                    ;A6BC31;
    LDA.L Ridley.facingDirection                                         ;A6BC33;
    ASL                                                                  ;A6BC37;
    TAY                                                                  ;A6BC38;
    LDA.W .targetXPositions,Y                                            ;A6BC39;
    STA.B $12                                                            ;A6BC3C;
    LDA.W #$00E0                                                         ;A6BC3E;
    STA.B $14                                                            ;A6BC41;
    LDX.W #$0000                                                         ;A6BC43;
    LDY.W #$0000                                                         ;A6BC46;
    JSR.W AccelerateRidleyTowardDesiredXYPosition_NoDecelerationBoost    ;A6BC49;
    RTS                                                                  ;A6BC4C;

  .timerExpired:
    LDA.W #$0010                                                         ;A6BC4D;
    STA.L Ridley.movementThreshold                                       ;A6BC50;
    LDA.W #$00F0                                                         ;A6BC54;
    STA.L Ridley.tailExtensionSpeed                                      ;A6BC57;
    LDA.W #DetermineAndExecuteNewRidleyAIScript                          ;A6BC5B;
    STA.W Ridley.function                                                ;A6BC5E;
    RTS                                                                  ;A6BC61;

  .targetXPositions:
; indexed by facing direction: left, turning, right
    dw $00B0,$0000,$0050                                                 ;A6BC62;


;;; $BC68:  ;;;
GrabSamus:
; Grab Samus
    JSR.W SetDisplacementForRidleyGrabbingSamus                          ;A6BC68;
    LDA.W Enemy.properties                                               ;A6BC6B;
    ORA.W #$0400                                                         ;A6BC6E;
    STA.W Enemy.properties                                               ;A6BC71;
    LDA.W #$0001                                                         ;A6BC74;
    STA.L Ridley.holdingSamusFlag                                        ;A6BC77;
    DEC                                                                  ;A6BC7B;
    JSL.L Run_Samus_Command                                              ;A6BC7C;
    SEC                                                                  ;A6BC80;
    JMP.W TransferGraphicsForRidleysClawsHoldingSamusOrBabyMetroid       ;A6BC81;


;;; $BC84:  ;;;
ReleaseSamus:
; Release Samus
    LDA.W #$0001                                                         ;A6BC84;
    STA.L Ridley.tailFlingTrigger                                        ;A6BC87;
    STA.L Ridley.tailAIIndex                                             ;A6BC8B;
    LDA.L Ridley.status                                                  ;A6BC8F;
    BMI .dead                                                            ;A6BC93;
    JSR.W CheckIfSpinJumpGrapplingDamageBoosting                         ;A6BC95;
    LDA.W #$0006                                                         ;A6BC98;
    BVS +                                                                ;A6BC9B;
    LDA.W #$000A                                                         ;A6BC9D;

+   STA.L Ridley.grabCooldownTimer                                       ;A6BCA0;

  .dead:
    LDA.W #$0000                                                         ;A6BCA4;
    STA.L Ridley.holdingSamusFlag                                        ;A6BCA7;
    INC                                                                  ;A6BCAB;
    JSL.L Run_Samus_Command                                              ;A6BCAC;
    CLC                                                                  ;A6BCB0;
    JMP.W TransferGraphicsForRidleysClawsHoldingSamusOrBabyMetroid       ;A6BCB1;


;;; $BCB4:  ;;;
HandleRidleySamusInteractionBit:
; Handles Enemy/Samus interaction bit
    LDA.L Ridley.status                                                  ;A6BCB4;
    BMI .return                                                          ;A6BCB8;
    BEQ .ridleyInactive                                                  ;A6BCBA;
    JSR.W CheckIfRidleyIsOnScreen                                        ;A6BCBC;
    BCC .onScreen                                                        ;A6BCBF;
    LDA.W Enemy.properties                                               ;A6BCC1;
    ORA.W #$0400                                                         ;A6BCC4;
    STA.W Enemy.properties                                               ;A6BCC7;
    RTS                                                                  ;A6BCCA;

  .onScreen:
    LDA.W Enemy.properties                                               ;A6BCCB;
    AND.W #$FBFF                                                         ;A6BCCE;
    STA.W Enemy.properties                                               ;A6BCD1;

  .ridleyInactive:
    LDA.L Ridley.grabCooldownTimer                                       ;A6BCD4;
    BEQ .return                                                          ;A6BCD8;
    DEC                                                                  ;A6BCDA;
    STA.L Ridley.grabCooldownTimer                                       ;A6BCDB;
    BNE .return                                                          ;A6BCDF;
    LDA.L Ridley.status                                                  ;A6BCE1;
    BMI .return                                                          ;A6BCE5;
    LDA.W Enemy.properties                                               ;A6BCE7;
    AND.W #$FBFF                                                         ;A6BCEA;
    STA.W Enemy.properties                                               ;A6BCED;

  .return:
    RTS                                                                  ;A6BCF0;


;;; $BCF1:  ;;;
CheckIfSpinJumpGrapplingDamageBoosting:
; CLC if spin jump, grappling, or spin back from hurt
    LDA.W MovementType                                                   ;A6BCF1;
    AND.W #$00FF                                                         ;A6BCF4;
    PHX                                                                  ;A6BCF7;
    TAX                                                                  ;A6BCF8;
    BIT.W .movementTypes_minus1,X                                        ;A6BCF9;
    BMI .notSpinGrappleDamage                                            ;A6BCFC;
    PLX                                                                  ;A6BCFE;
    CLC                                                                  ;A6BCFF;
    RTS                                                                  ;A6BD00;

  .notSpinGrappleDamage:
    PLX                                                                  ;A6BD01;
    SEC                                                                  ;A6BD02;

  .movementTypes_minus1:
    RTS                                                                  ;A6BD03;

  .movementTypes:                                                        ;A6BD04;
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
    LDA.W SamusYPosition                                                 ;A6BD20;
    CMP.W #$0160                                                         ;A6BD23;
    BPL .aboveThreshold                                                  ;A6BD26;
    CLC                                                                  ;A6BD28;
    RTS                                                                  ;A6BD29;

  .aboveThreshold:
    SEC                                                                  ;A6BD2A;
    RTS                                                                  ;A6BD2B;


;;; $BD2C:  ;;;
PowerBombCheck:
; Power Bomb Check/Reaction
    LDA.L Ridley.status                                                  ;A6BD2C;
    BMI .return                                                          ;A6BD30;
    BEQ .return                                                          ;A6BD32;
    CMP.W #$0002                                                         ;A6BD34;
    BEQ .return                                                          ;A6BD37;
    LDA.W SamusProjectile_PowerBombFlag                                  ;A6BD39;
    BEQ .return                                                          ;A6BD3C;
    LDA.L Ridley.holdingSamusFlag                                        ;A6BD3E;
    BNE .return                                                          ;A6BD42;
    JSR.W RidleyGrabbedSamus_ResetTailAI                                 ;A6BD44;
    LDY.W #CheckFor_Deathswoop_PowerBombDodge_MoveToCenter_RamGrabSamus  ;A6BD47;
    STY.W Ridley.function                                                ;A6BD4A;

  .return:
    RTS                                                                  ;A6BD4D;


;;; $BD4E: Ridley function ;;;
Function_Ridley_DodgingPowerbomb_MaybeHoldingSamus:
; Ridley is dodging a power bomb (may be holding Samus)
    LDA.W SamusProjectile_PowerBombFlag                                  ;A6BD4E;
    BEQ .powerBombActive                                                 ;A6BD51;
    LDA.W #$0002                                                         ;A6BD53;
    STA.L Ridley.status                                                  ;A6BD56;
    LDY.W #$0050                                                         ;A6BD5A;
    LDA.W SamusProjectile_PowerBombExplosionXPosition                    ;A6BD5D;
    CMP.W #$0080                                                         ;A6BD60;
    BPL +                                                                ;A6BD63;
    LDY.W #$00C0                                                         ;A6BD65;

+   STY.B $12                                                            ;A6BD68;
    LDY.W #$00C0                                                         ;A6BD6A;
    LDA.W SamusProjectile_PowerBombExplosionYPosition                    ;A6BD6D;
    CMP.W #$0100                                                         ;A6BD70;
    BPL +                                                                ;A6BD73;
    LDY.W #$0180                                                         ;A6BD75;

+   STY.B $14                                                            ;A6BD78;
    LDX.W #$0000                                                         ;A6BD7A;
    JSR.W GetRidleyAccelerationDivisorIndex                              ;A6BD7D;
    JMP.W AccelerateRidleyTowardDesiredXYPosition_NoDecelerationBoost    ;A6BD80;

  .powerBombActive:
    LDA.W #$0001                                                         ;A6BD83;
    STA.L Ridley.status                                                  ;A6BD86;
    LDY.W #DetermineAndExecuteNewRidleyAIScript                          ;A6BD8A;
    LDA.L Ridley.holdingSamusFlag                                        ;A6BD8D;
    BEQ .notHoldingSamus                                                 ;A6BD91;
    LDY.W #Function_Ridley_InPositionToGrabSamus_NoPowerBomb             ;A6BD93;

  .notHoldingSamus:
    STY.W Ridley.function                                                ;A6BD96;
    RTS                                                                  ;A6BD99;


;;; $BD9A: Ridley function ;;;
Function_RidleyCeres_InitializeBabyMetroidDrop:
; Ceres Ridley initialise baby metroid drop
    LDA.W #$00C0                                                         ;A6BD9A;
    STA.B $12                                                            ;A6BD9D;
    LDA.W #$0080                                                         ;A6BD9F;
    STA.B $14                                                            ;A6BDA2;
    LDX.W #$0000                                                         ;A6BDA4;
    LDY.W #$0001                                                         ;A6BDA7;
    JSR.W AccelerateCeresRidleyTowardDesiredXY                           ;A6BDAA;
    LDA.W Enemy.XPosition                                                ;A6BDAD;
    CMP.W #$00C0                                                         ;A6BDB0;
    BMI .return                                                          ;A6BDB3;
    LDA.W #Function_RidleyCeres_DropBabyMetroid                          ;A6BDB5;
    STA.W Ridley.function                                                ;A6BDB8;

  .return:
    RTS                                                                  ;A6BDBB;


;;; $BDBC: Ridley function ;;;
Function_RidleyCeres_DropBabyMetroid:
; Ceres Ridley baby metroid drop
    LDA.W #$FF40                                                         ;A6BDBC;
    STA.L Ridley.topBoundary                                             ;A6BDBF;
    LDA.W #$00C0                                                         ;A6BDC3;
    STA.B $12                                                            ;A6BDC6;
    LDA.W #$FF80                                                         ;A6BDC8;
    STA.B $14                                                            ;A6BDCB;
    LDX.W #$0000                                                         ;A6BDCD;
    LDY.W #$0001                                                         ;A6BDD0;
    JSR.W AccelerateCeresRidleyTowardDesiredXY                           ;A6BDD3;
    LDA.W Enemy.YPosition                                                ;A6BDD6;
    CMP.W #$0020                                                         ;A6BDD9;
    BPL Function_RidleyCeres_PickupBabyMetroid_return                    ;A6BDDC;
    LDA.W #DropBabyMetroid                                               ;A6BDDE;
    STA.L Ridley.BabyMetroidFunction                                     ;A6BDE1;
    LDA.W #Function_RidleyCeres_PickupBabyMetroidDelay                   ;A6BDE5;
    STA.W Ridley.function                                                ;A6BDE8;
    LDA.W #$0015                                                         ;A6BDEB;
    STA.W Ridley.functionTimer                                           ;A6BDEE;
    RTS                                                                  ;A6BDF1;


;;; $BDF2: Ridley function ;;;
Function_RidleyCeres_PickupBabyMetroidDelay:
; Ceres Ridley pickup baby metroid delay
    DEC.W Ridley.functionTimer                                           ;A6BDF2;
    BPL Function_RidleyCeres_PickupBabyMetroid_return                    ;A6BDF5;
    LDA.W #InstList_RidleyCeres_FacingLeft_ExtendLegs                    ;A6BDF7;
    JSR.W SetRidleyInstList                                              ;A6BDFA;
    LDA.W #Function_RidleyCeres_PickupBabyMetroid                        ;A6BDFD;
    STA.W Ridley.function                                                ;A6BE00; fallthrough to Function_RidleyCeres_PickupBabyMetroid


;;; $BE03: Ridley function ;;;
Function_RidleyCeres_PickupBabyMetroid:
; Ceres Ridley baby metroid pickup
    LDA.L Ridley.BabyMetroidXPosition                                    ;A6BE03;
    CLC                                                                  ;A6BE07;
    ADC.W #$FFF6                                                         ;A6BE08;
    STA.B $12                                                            ;A6BE0B;
    LDA.L Ridley.BabyMetroidYPosition                                    ;A6BE0D;
    CLC                                                                  ;A6BE11;
    ADC.W #$FFC8                                                         ;A6BE12;
    STA.B $14                                                            ;A6BE15;
    LDX.W #$0000                                                         ;A6BE17;
    LDY.W #$000C                                                         ;A6BE1A;
    JSR.W AccelerateRidleyTowardDesiredXYPosition_NoDecelerationBoost    ;A6BE1D;
    LDA.W #$000E                                                         ;A6BE20;
    CLC                                                                  ;A6BE23;
    ADC.W Enemy.XPosition                                                ;A6BE24;
    STA.B $12                                                            ;A6BE27;
    LDA.W #$0042                                                         ;A6BE29;
    CLC                                                                  ;A6BE2C;
    ADC.W Enemy.YPosition                                                ;A6BE2D;
    STA.B $14                                                            ;A6BE30;
    LDA.W #$0004                                                         ;A6BE32;
    STA.B $16                                                            ;A6BE35;
    LDA.W #$0004                                                         ;A6BE37;
    STA.B $18                                                            ;A6BE3A;
    JSR.W CheckIfRidleyIsWithinRangeToPickupBabyMetroid                  ;A6BE3C;
    BCS Function_RidleyCeres_PickupBabyMetroid_holding                   ;A6BE3F;

  .return:
    RTS                                                                  ;A6BE41;


Function_RidleyCeres_PickupBabyMetroid_holding:
    LDA.W #$0001                                                         ;A6BE42;
    STA.L Ridley.holdingSamusFlag                                        ;A6BE45;
    SEC                                                                  ;A6BE49;
    JSR.W TransferGraphicsForRidleysClawsHoldingSamusOrBabyMetroid       ;A6BE4A;
    LDA.W #$FE00                                                         ;A6BE4D;
    STA.W Ridley.YSpeed                                                  ;A6BE50;
    LDA.W #UpdateBabyMetroidPosition_CarriedInFeet                       ;A6BE53;
    STA.L Ridley.BabyMetroidFunction                                     ;A6BE56;
    LDA.W #Function_RidleyCeres_FlyAwayToEndFight                        ;A6BE5A;
    STA.W Ridley.function                                                ;A6BE5D;
    RTS                                                                  ;A6BE60;


;;; $BE61:  ;;;
CheckIfRidleyIsWithinRangeToPickupBabyMetroid:
    LDA.L Ridley.BabyMetroidXPosition                                    ;A6BE61;
    SEC                                                                  ;A6BE65;
    SBC.B $12                                                            ;A6BE66;
    BPL +                                                                ;A6BE68;
    EOR.W #$FFFF                                                         ;A6BE6A;
    INC                                                                  ;A6BE6D;

+   SEC                                                                  ;A6BE6E;
    SBC.W #$0004                                                         ;A6BE6F;
    BCC +                                                                ;A6BE72;
    CMP.B $16                                                            ;A6BE74;
    BCS .returnNotGrabbed                                                ;A6BE76;

+   LDA.L Ridley.BabyMetroidYPosition                                    ;A6BE78;
    SEC                                                                  ;A6BE7C;
    SBC.B $14                                                            ;A6BE7D;
    BPL +                                                                ;A6BE7F;
    EOR.W #$FFFF                                                         ;A6BE81;
    INC                                                                  ;A6BE84;

+   SEC                                                                  ;A6BE85;
    SBC.W #$0004                                                         ;A6BE86;
    BCC .returnGrabbed                                                   ;A6BE89;
    CMP.B $18                                                            ;A6BE8B;
    BCC .returnGrabbed                                                   ;A6BE8D;

  .returnNotGrabbed:
    CLC                                                                  ;A6BE8F;
    RTS                                                                  ;A6BE90;

  .returnGrabbed:
    SEC                                                                  ;A6BE91;
    RTS                                                                  ;A6BE92;


;;; $BE93:  ;;;
HandleCarryingBabyMetroid:
    LDA.L Ridley.BabyMetroidFunction                                     ;A6BE93;
    STA.B $12                                                            ;A6BE97;
    JMP.W ($0012)                                                        ;A6BE99;


;;; $BE9C:  ;;;
UpdateBabyMetroidPosition_CarriedInArms:
    LDA.W #$FFF0                                                         ;A6BE9C;
    CLC                                                                  ;A6BE9F;
    ADC.W Enemy.XPosition                                                ;A6BEA0;
    STA.L Ridley.BabyMetroidXPosition                                    ;A6BEA3;
    LDA.W #$0016                                                         ;A6BEA7;
    CLC                                                                  ;A6BEAA;
    ADC.W Enemy.YPosition                                                ;A6BEAB;
    STA.L Ridley.BabyMetroidYPosition                                    ;A6BEAE;
    RTS                                                                  ;A6BEB2;


;;; $BEB3:  ;;;
UpdateBabyMetroidPosition_CarriedInFeet:
    LDA.W #$000E                                                         ;A6BEB3;
    CLC                                                                  ;A6BEB6;
    ADC.W Enemy.XPosition                                                ;A6BEB7;
    STA.L Ridley.BabyMetroidXPosition                                    ;A6BEBA;
    LDA.W #$0042                                                         ;A6BEBE;
    CLC                                                                  ;A6BEC1;
    ADC.W Enemy.YPosition                                                ;A6BEC2;
    STA.L Ridley.BabyMetroidYPosition                                    ;A6BEC5;
    RTS                                                                  ;A6BEC9;


;;; $BECA:  ;;;
DropBabyMetroid:
; Initialise baby metroid falling to ground
    LDA.W #$0000                                                         ;A6BECA;
    STA.L Ridley.neverRead880A                                           ;A6BECD;
    STA.L Ridley.BabyMetroidCrySFXFlag                                   ;A6BED1;
    LDA.W #BabyMetroidDropped                                            ;A6BED5;
    STA.L Ridley.BabyMetroidFunction                                     ;A6BED8; fallthrough to BabyMetroidDropped


;;; $BEDC:  ;;;
BabyMetroidDropped:
; Baby metroid falls to ground
    LDA.L Ridley.BabyMetroidCrySFXFlag                                   ;A6BEDC;
    CLC                                                                  ;A6BEE0;
    ADC.W #$0008                                                         ;A6BEE1;
    STA.L Ridley.BabyMetroidCrySFXFlag                                   ;A6BEE4;
    SEP #$20                                                             ;A6BEE8;
    CLC                                                                  ;A6BEEA;
    ADC.L Ridley.BabyMetroidYSubPosition+1                               ;A6BEEB;
    STA.L Ridley.BabyMetroidYSubPosition+1                               ;A6BEEF;
    REP #$20                                                             ;A6BEF3;
    AND.W #$FF00                                                         ;A6BEF5;
    XBA                                                                  ;A6BEF8;
    BPL +                                                                ;A6BEF9;
    ORA.W #$FF00                                                         ;A6BEFB;

+   ADC.L Ridley.BabyMetroidYPosition                                    ;A6BEFE;
    STA.L Ridley.BabyMetroidYPosition                                    ;A6BF02;
    CMP.W #$00C0                                                         ;A6BF06;
    BMI .return                                                          ;A6BF09;
    LDA.W #$00C0                                                         ;A6BF0B;
    STA.L Ridley.BabyMetroidYPosition                                    ;A6BF0E;
    LDA.W #.return                                                       ;A6BF12;
    STA.L Ridley.BabyMetroidFunction                                     ;A6BF15;

  .return:
    RTS                                                                  ;A6BF19;


;;; $BF1A: Draw baby metroid ;;;
DrawBabyMetroid:
    LDA.W #Ridley.BabyMetroidInstList                                    ;A6BF1A;
    JSR.W GetBabyMetroidSpritemapPointerFromInstList                     ;A6BF1D;
    LDA.L Ridley.BabyMetroidXPosition                                    ;A6BF20;
    STA.B $12                                                            ;A6BF24;
    LDA.L Ridley.BabyMetroidYPosition                                    ;A6BF26;
    STA.B $14                                                            ;A6BF2A;
    STZ.B $16                                                            ;A6BF2C;
    JMP.W RidleyGeneralUseDrawing                                        ;A6BF2E;


;;; $BF31: Baby metroid instruction list ;;;
InstList_BabyMetroidCutscene_0:
    dw Instruction_BabyMetroidCutscene_GotoXIfNotFalling                 ;A6BF31;
    dw InstList_BabyMetroidCutscene_1                                    ;A6BF33;
    dw $000A,Spritemap_BabyMetroidCutscene_HorizontalSquish              ;A6BF35;
    dw $000A,Spritemap_BabyMetroidCutscene_Round                         ;A6BF39;
    dw $000A,Spritemap_BabyMetroidCutscene_VerticalSquish                ;A6BF3D;
    dw $000A,Spritemap_BabyMetroidCutscene_Round                         ;A6BF41;
    dw Instruction_BabyMetroidCutscene_GotoXIfNotFalling                 ;A6BF45;
    dw InstList_BabyMetroidCutscene_1                                    ;A6BF47;
    dw $000A,Spritemap_BabyMetroidCutscene_HorizontalSquish              ;A6BF49;
    dw $000A,Spritemap_BabyMetroidCutscene_Round                         ;A6BF4D;
    dw $000A,Spritemap_BabyMetroidCutscene_VerticalSquish                ;A6BF51;
    dw $000A,Spritemap_BabyMetroidCutscene_Round                         ;A6BF55;

InstList_BabyMetroidCutscene_1:
    dw Instruction_BabyMetroidCutscene_PlayCrySFXOrGotoX                 ;A6BF59;
    dw InstList_BabyMetroidCutscene_0                                    ;A6BF5B;
    dw Instruction_BabyMetroidCutscene_UpdateColors                      ;A6BF5D;
    dw Palette_BabyMetroidCutscene_HorizontalSquish                      ;A6BF5F;
    dw $0006,Spritemap_BabyMetroidCutscene_HorizontalSquish              ;A6BF61;
    dw Instruction_BabyMetroidCutscene_UpdateColors                      ;A6BF65;
    dw Palette_BabyMetroidCutscene_Round                                 ;A6BF67;
    dw $0005,Spritemap_BabyMetroidCutscene_Round                         ;A6BF69;
    dw Instruction_BabyMetroidCutscene_UpdateColors                      ;A6BF6D;
    dw Palette_BabyMetroidCutscene_VerticalSquish                        ;A6BF6F;
    dw $0004,Spritemap_BabyMetroidCutscene_VerticalSquish                ;A6BF71;
    dw Instruction_BabyMetroidCutscene_UpdateColors                      ;A6BF75;
    dw Palette_BabyMetroidCutscene_Round                                 ;A6BF77;
    dw $0003,Spritemap_BabyMetroidCutscene_Round                         ;A6BF79;
    dw Instruction_BabyMetroidCutscene_UpdateColors                      ;A6BF7D;
    dw Palette_BabyMetroidCutscene_HorizontalSquish                      ;A6BF7F;
    dw $0002,Spritemap_BabyMetroidCutscene_HorizontalSquish              ;A6BF81;
    dw Instruction_BabyMetroidCutscene_UpdateColors                      ;A6BF85;
    dw Palette_BabyMetroidCutscene_Round                                 ;A6BF87;
    dw $0003,Spritemap_BabyMetroidCutscene_Round                         ;A6BF89;
    dw Instruction_BabyMetroidCutscene_UpdateColors                      ;A6BF8D;
    dw Palette_BabyMetroidCutscene_VerticalSquish                        ;A6BF8F;
    dw $0004,Spritemap_BabyMetroidCutscene_VerticalSquish                ;A6BF91;
    dw Instruction_BabyMetroidCutscene_UpdateColors                      ;A6BF95;
    dw Palette_BabyMetroidCutscene_Round                                 ;A6BF97;
    dw $0005,Spritemap_BabyMetroidCutscene_Round                         ;A6BF99;
    dw Instruction_BabyMetroidCutscene_UpdateColors                      ;A6BF9D;
    dw Palette_BabyMetroidCutscene_HorizontalSquish                      ;A6BF9F;
    dw $0006,Spritemap_BabyMetroidCutscene_HorizontalSquish              ;A6BFA1;
    dw Instruction_BabyMetroidCutscene_UpdateColors                      ;A6BFA5;
    dw Palette_BabyMetroidCutscene_Round                                 ;A6BFA7;
    dw $0007,Spritemap_BabyMetroidCutscene_Round                         ;A6BFA9;
    dw Instruction_BabyMetroidCutscene_UpdateColors                      ;A6BFAD;
    dw Palette_BabyMetroidCutscene_VerticalSquish                        ;A6BFAF;
    dw $0008,Spritemap_BabyMetroidCutscene_VerticalSquish                ;A6BFB1;
    dw Instruction_BabyMetroidCutscene_UpdateColors                      ;A6BFB5;
    dw Palette_BabyMetroidCutscene_Round                                 ;A6BFB7;
    dw $0009,Spritemap_BabyMetroidCutscene_Round                         ;A6BFB9;
    dw Instruction_BabyMetroidCutscene_UpdateColors                      ;A6BFBD;
    dw Palette_BabyMetroidCutscene_EndOfInstList                         ;A6BFBF;
    dw Instruction_BabyMetroidCutscene_GotoXIfNotFalling                 ;A6BFC1;
    dw InstList_BabyMetroidCutscene_1                                    ;A6BFC3;
    dw Instruction_BabyMetroidCutscene_GotoX                             ;A6BFC5;
    dw InstList_BabyMetroidCutscene_0                                    ;A6BFC7;


;;; $BFC9: Baby metroid instruction ;;;
Instruction_BabyMetroidCutscene_PlayCrySFXOrGotoX:
    LDA.L Ridley.BabyMetroidCrySFXFlag                                   ;A6BFC9;
    BNE .playSFX                                                         ;A6BFCD;
    LDA.W RandomNumberSeed                                               ;A6BFCF;
    AND.W #$0001                                                         ;A6BFD2;
    BNE Instruction_BabyMetroidCutscene_GotoX                            ;A6BFD5;

  .playSFX:
    LDA.W #$0024                                                         ;A6BFD7;
    JSL.L QueueSound_Lib3_Max6                                           ;A6BFDA; fallthrough to Instruction_BabyMetroidCutscene_NextInstruction


;;; $BFDE: X += 2 ;;;
Instruction_BabyMetroidCutscene_NextInstruction:
    INX                                                                  ;A6BFDE;
    INX                                                                  ;A6BFDF;
    RTS                                                                  ;A6BFE0;


;;; $BFE1: Baby metroid instruction ;;;
Instruction_BabyMetroidCutscene_UpdateColors:
    LDY.W $0000,X                                                        ;A6BFE1;
    PHX                                                                  ;A6BFE4;
    LDX.W #$0162                                                         ;A6BFE5;
    LDA.W #$000F                                                         ;A6BFE8;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;A6BFEB;
    PLX                                                                  ;A6BFEF;
    BRA Instruction_BabyMetroidCutscene_NextInstruction                  ;A6BFF0;


;;; $BFF2: Baby metroid instruction ;;;
Instruction_BabyMetroidCutscene_GotoXIfNotFalling:
    LDA.L Ridley.BabyMetroidCrySFXFlag                                   ;A6BFF2;
    BEQ Instruction_BabyMetroidCutscene_NextInstruction                  ;A6BFF6; fallthrough to Instruction_BabyMetroidCutscene_GotoX


;;; $BFF8: Baby metroid instruction - go to [[X]] ;;;
Instruction_BabyMetroidCutscene_GotoX:
    LDA.W $0000,X                                                        ;A6BFF8;
    TAX                                                                  ;A6BFFB;
    RTS                                                                  ;A6BFFC;


;;; $BFFD: Baby metroid spritemaps ;;;
Spritemap_BabyMetroidCutscene_HorizontalSquish:
    dw $0005                                                             ;A6BFFD;
    %spritemapEntry(0, $00, $08, 1, 1, 3, 2, $10D)
    %spritemapEntry(0, $1F8, $08, 1, 0, 3, 2, $10D)
    %spritemapEntry(0, $00, $F0, 0, 1, 3, 2, $10D)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 3, 2, $10D)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 3, $142)

Spritemap_BabyMetroidCutscene_Round:
    dw $0005                                                             ;A6C018;
    %spritemapEntry(0, $00, $08, 1, 1, 3, 2, $10D)
    %spritemapEntry(0, $1F8, $08, 1, 0, 3, 2, $10D)
    %spritemapEntry(0, $00, $F0, 0, 1, 3, 2, $10D)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 3, 2, $10D)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 3, $14C)

Spritemap_BabyMetroidCutscene_VerticalSquish:
    dw $0005                                                             ;A6C033;
    %spritemapEntry(0, $00, $08, 1, 1, 3, 2, $10D)
    %spritemapEntry(0, $1F8, $08, 1, 0, 3, 2, $10D)
    %spritemapEntry(0, $00, $F0, 0, 1, 3, 2, $10D)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 3, 2, $10D)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 3, $14E)


;;; $C04E: Ridley function ;;;
CeresRidleyPostGetawayFunctionHandler:
    LDX.W Ridley.functionTimer                                           ;A6C04E;
    JMP.W (.pointers,X)                                                  ;A6C051;

  .pointers:
    dw PostGetawayFunction_UpdateColors_TransferTimerSpriteTiles         ;A6C054;
    dw PostGetawayFunction_TransferTimerBackgroundTiles                  ;A6C056;
    dw PostGetawayFunction_TransferEscapeTiles_ProcessEmergencyText      ;A6C058;
    dw PostGetawayFunction_SetupCeresEscapeTimer                         ;A6C05A;
    dw PostGetawayFunction_Wait20f_QueueTilemapTransfers                 ;A6C05C;
    dw PostGetawayFunction_CycleEmergencyTextColors_HandleTyping         ;A6C05E;
    dw PostGetawayFunction_CycleEmergencyTextColors_StartEscape          ;A6C060;


;;; $C062:  ;;;
PostGetawayFunction_UpdateColors_TransferTimerSpriteTiles:
    LDA.L Palettes_BG3P0AcidHighlight                                    ;A6C062;
    STA.L Palettes_BG12P6+2                                              ;A6C066;
    LDA.L Palettes_BG3P0AcidBackground                                   ;A6C06A;
    STA.L Palettes_BG12P6+6                                              ;A6C06E;
    LDA.L Palettes_BG3P4HighlightedHUDItemBackgroundOutline              ;A6C072;
    STA.L Palettes_BG12P5+2                                              ;A6C076;
    LDA.L Palettes_BG3P4HighlightedHUDItemOutline                        ;A6C07A;
    STA.L Palettes_BG12P5+6                                              ;A6C07E;
    LDX.W #ZebesEscapeTimerSpriteTileTransferEntries_size                ;A6C082;
    STX.W Enemy.var4                                                     ;A6C085;
    INC.W Ridley.functionTimer                                           ;A6C088;
    INC.W Ridley.functionTimer                                           ;A6C08B; fallthrough to PostGetawayFunction_TransferTimerBackgroundTiles


PostGetawayFunction_TransferTimerBackgroundTiles:
    JSR.W ProcessEscapeTimerTileTransfers                                ;A6C08E;
    BCC PostGetawayFunction_TransferEscapeTiles_ProcessEmergencyText_return ;A6C091;
    LDX.W #CeresEscapeTimerBG12TransferEntries_size                      ;A6C093;
    STX.W Enemy.var4                                                     ;A6C096;
    INC.W Ridley.functionTimer                                           ;A6C099;
    INC.W Ridley.functionTimer                                           ;A6C09C; fallthrough to PostGetawayFunction_TransferEscapeTiles_ProcessEmergencyText


PostGetawayFunction_TransferEscapeTiles_ProcessEmergencyText:
    JSR.W ProcessEscapeTimerTileTransfers                                ;A6C09F;
    BCC .return                                                          ;A6C0A2;
    INC.W Ridley.functionTimer                                           ;A6C0A4;
    INC.W Ridley.functionTimer                                           ;A6C0A7;
    JSR.W DrawEmergencyText                                              ;A6C0AA;
    LDA.W #$0080                                                         ;A6C0AD;
    STA.W Enemy.var4                                                     ;A6C0B0;
    LDA.W #$0007                                                         ;A6C0B3;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;A6C0B6;

  .return:
    RTS                                                                  ;A6C0BA;


;;; $C0BB: Set up Ceres escape timer ;;;
PostGetawayFunction_SetupCeresEscapeTimer:
    JSR.W CycleEmergencyTextColors                                       ;A6C0BB;
    DEC.W Enemy.var4                                                     ;A6C0BE;
    BNE .return                                                          ;A6C0C1;
    LDA.W #TypewriterText_CeresEscapeTimer                               ;A6C0C3;
    STA.L Ridley.typewriterInstructionList                               ;A6C0C6;
    LDA.W #$0000                                                         ;A6C0CA;
    STA.L Ridley.typewriterVRAMTilemapAddr                               ;A6C0CD;
    STA.L Ridley.typewriterInstructionTimer                              ;A6C0D1;
    STA.L Ridley.typewriterInstructionTimerResetValue                    ;A6C0D5;
    STA.L Ridley.typewriterStrokeTimer                                   ;A6C0D9;
    LDA.W #$0020                                                         ;A6C0DD;
    STA.W Enemy.var4                                                     ;A6C0E0;
    LDA.W JapanText                                                      ;A6C0E3;
    BNE .japanText                                                       ;A6C0E6;
    INC.W Ridley.functionTimer                                           ;A6C0E8;
    INC.W Ridley.functionTimer                                           ;A6C0EB;

  .japanText:
    INC.W Ridley.functionTimer                                           ;A6C0EE;
    INC.W Ridley.functionTimer                                           ;A6C0F1;

  .return:
    RTS                                                                  ;A6C0F4;


;;; $C0F5:  ;;;
PostGetawayFunction_Wait20f_QueueTilemapTransfers:
    DEC.W Enemy.var4                                                     ;A6C0F5;
    BNE PostGetawayFunction_CycleEmergencyTextColors_HandleTyping        ;A6C0F8;
    INC.W Ridley.functionTimer                                           ;A6C0FA;
    INC.W Ridley.functionTimer                                           ;A6C0FD;
    JSL.L QueueCeresEscapeJapaneseTextTilemapTransfers                   ;A6C100; fallthrough to PostGetawayFunction_CycleEmergencyTextColors_HandleTyping


;;; $C104:  ;;;
PostGetawayFunction_CycleEmergencyTextColors_HandleTyping:
    JSR.W CycleEmergencyTextColors                                       ;A6C104;
    LDA.W #$3582                                                         ;A6C107;
    JSL.L HandleTypewriterText_External                                  ;A6C10A;
    BCC .return                                                          ;A6C10E;
    INC.W Ridley.functionTimer                                           ;A6C110;
    INC.W Ridley.functionTimer                                           ;A6C113;

  .return:
    RTS                                                                  ;A6C116;


;;; $C117:  ;;;
PostGetawayFunction_CycleEmergencyTextColors_StartEscape:
    JSR.W CycleEmergencyTextColors                                       ;A6C117;
    JSR.W Function_Ridley_ResetSpeeds                                    ;A6C11A;
    STZ.W Ridley.functionTimer                                           ;A6C11D;
    LDA.W #Function_RidleyCeres_CycleEmergencyTextColors                 ;A6C120;
    STA.W Ridley.function                                                ;A6C123;
    LDA.W #$0001                                                         ;A6C126;
    STA.W TimerStatus                                                    ;A6C129;
    INC                                                                  ;A6C12C;
    STA.W CeresStatus                                                    ;A6C12D;
    DEC                                                                  ;A6C130;
    JSL.L SetBossBitsInAForCurrentArea                                   ;A6C131;
    RTS                                                                  ;A6C135;


;;; $C136:  ;;;
DrawEmergencyText:
; Display 'EMERGENCY' text
    LDX.W #.tilemapEntry                                                 ;A6C136;
    LDY.W VRAMWriteStack                                                 ;A6C139;
    LDA.W $0000,X                                                        ;A6C13C;
    STA.W VRAMWrite.size,Y                                               ;A6C13F; >.<
    LDA.W $0003,X                                                        ;A6C142;
    STA.W VRAMWrite.src+1,Y                                              ;A6C145; >.<
    LDA.W $0002,X                                                        ;A6C148;
    STA.W VRAMWrite.src,Y                                                ;A6C14B; >.<
    LDA.W $0005,X                                                        ;A6C14E;
    STA.W VRAMWrite.dest,Y                                               ;A6C151; >.<
    TYA                                                                  ;A6C154;
    CLC                                                                  ;A6C155;
    ADC.W #$0007                                                         ;A6C156;
    STA.W VRAMWriteStack                                                 ;A6C159;
    RTS                                                                  ;A6C15C;

  .tilemapEntry:
    dw $0012                                                             ;A6C15D;
    dl .emergencyTilemap                                                 ;A6C15F;
    dw $50CB                                                             ;A6C162;

  .emergencyTilemap:
;       E     M     E     R     G     E     N     C     Y
    dw $3986,$398E,$3986,$3993,$3988,$3986,$398F,$3984,$399A             ;A6C164;


if !FEATURE_KEEP_UNREFERENCED
;;; $C176:  ;;;
UNUSED_CycleColor_A6C176:
    LDX.W #$0016                                                         ;A6C176;
    LDA.L Ridley.unused7E8032                                            ;A6C179;
    INC                                                                  ;A6C17D;
    CMP.W #$0020                                                         ;A6C17E;
    BMI +                                                                ;A6C181;
    LDA.W #$FFE1                                                         ;A6C183;

+   STA.L Ridley.unused7E8032                                            ;A6C186;
    LDA.L Ridley.unused7E8032                                            ;A6C18A;
    BPL +                                                                ;A6C18E;
    EOR.W #$FFFF                                                         ;A6C190;
    INC                                                                  ;A6C193;

+   AND.W #$001F                                                         ;A6C194;
    STA.L Palettes,X                                                     ;A6C197;
    RTS                                                                  ;A6C19B;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $C19C:  ;;;
CycleEmergencyTextColors:
    LDA.L PaletteChangeNumerator                                         ;A6C19C;
    ORA.W DoorTransitionFlagEnemiesPause                                 ;A6C1A0;
    BEQ +                                                                ;A6C1A3;

  .return:
    RTS                                                                  ;A6C1A5;

+   LDA.W NMI_FrameCounter                                               ;A6C1A6;
    AND.W #$0003                                                         ;A6C1A9;
    BNE .return                                                          ;A6C1AC;
    LDA.L Ridley.paletteTableIndex                                       ;A6C1AE;
    INC                                                                  ;A6C1B2;
    CMP.W #$0010                                                         ;A6C1B3;
    BCC .cycle                                                           ;A6C1B6;
    LDA.W #$0000                                                         ;A6C1B8;

  .cycle:
    STA.L Ridley.paletteTableIndex                                       ;A6C1BB;
    ASL                                                                  ;A6C1BF;
    ADC.L Ridley.paletteTableIndex                                       ;A6C1C0;
    ASL                                                                  ;A6C1C4;
    TAY                                                                  ;A6C1C5;
    LDX.W #$00C2                                                         ;A6C1C6;
    LDA.W .emergencyColor0,Y                                             ;A6C1C9;
    STA.L Palettes,X                                                     ;A6C1CC;
    LDA.W .emergencyColor1,Y                                             ;A6C1D0;
    STA.L Palettes+2,X                                                   ;A6C1D3;
    LDA.W .emergencyColor2,Y                                             ;A6C1D7;
    STA.L Palettes+4,X                                                   ;A6C1DA;
    RTS                                                                  ;A6C1DE;

; BG1/2 palette 6 colors 1..3
; EMERGENCY text palettes
  .emergencyColor0:
    dw $02DF                                                             ;A6C1DF;

  .emergencyColor1:
    dw       $01D7                                                       ;A6C1E1;

  .emergencyColor2:
    dw             $00AC                                                 ;A6C1E3;
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
    LDA.L Palettes_BG12P7+$1A                                            ;A6C23F;
    STA.L Palettes_SpriteP1+$1A                                          ;A6C243;
    LDA.L Palettes_BG12P7+$1C                                            ;A6C247;
    STA.L Palettes_SpriteP1+$1C                                          ;A6C24B;
    LDA.W #TypewriterText_ZebesEscapeTimer                               ;A6C24F;
    STA.L Ridley.typewriterInstructionList                               ;A6C252;
    LDA.W #$0000                                                         ;A6C256;
    STA.L Ridley.typewriterVRAMTilemapAddr                               ;A6C259;
    STA.L Ridley.typewriterInstructionTimer                              ;A6C25D;
    STA.L Ridley.typewriterInstructionTimerResetValue                    ;A6C261;
    STA.L Ridley.typewriterStrokeTimer                                   ;A6C265;
    STZ.B $B5                                                            ;A6C269;
    STZ.B $B7                                                            ;A6C26B;
    RTL                                                                  ;A6C26D;


;;; $C26E: Process escape timer tile transfers ;;;
ProcessEscapeTimerTileTransfers:
    LDX.W Enemy.var4                                                     ;A6C26E;
    LDY.W VRAMWriteStack                                                 ;A6C271;
    LDA.W $0000,X                                                        ;A6C274;
    BEQ .returnCarrySet                                                  ;A6C277;
    STA.W VRAMWrite.size,Y                                               ;A6C279; >.<
    LDA.W $0003,X                                                        ;A6C27C;
    STA.W VRAMWrite.src+1,Y                                              ;A6C27F; >.<
    LDA.W $0002,X                                                        ;A6C282;
    STA.W VRAMWrite.src,Y                                                ;A6C285; >.<
    LDA.W $0005,X                                                        ;A6C288;
    STA.W VRAMWrite.dest,Y                                               ;A6C28B; >.<
    TYA                                                                  ;A6C28E;
    CLC                                                                  ;A6C28F;
    ADC.W #$0007                                                         ;A6C290;
    STA.W VRAMWriteStack                                                 ;A6C293;
    TXA                                                                  ;A6C296;
    ADC.W #$0007                                                         ;A6C297;
    STA.W Enemy.var4                                                     ;A6C29A;
    TAX                                                                  ;A6C29D;
    LDA.W $0000,X                                                        ;A6C29E;
    BEQ .returnCarrySet                                                  ;A6C2A1;
    CLC                                                                  ;A6C2A3;
    RTS                                                                  ;A6C2A4;

  .returnCarrySet:
    SEC                                                                  ;A6C2A5;
    RTS                                                                  ;A6C2A6;


;;; $C2A7: Handle typewriter text (external) ;;;
HandleTypewriterText_External:
    STA.B DP_Temp12                                                      ;A6C2A7;
    PHB                                                                  ;A6C2A9;
    PHK                                                                  ;A6C2AA;
    PLB                                                                  ;A6C2AB;
    JSR.W HandleTypewriterText                                           ;A6C2AC;
    PLB                                                                  ;A6C2AF;
    RTL                                                                  ;A6C2B0;


;;; $C2B1: Handle typewriter text ;;;
HandleTypewriterText:
;; Returns:
;;     Carry: Set if finished, clear otherwise

; Incrementally writes text like "TIME BOMB SET EVACUATE IMMEDIATELY",
    LDA.L Ridley.typewriterInstructionTimer                              ;A6C2B1;
    BEQ .timerExpired                                                    ;A6C2B5;
    DEC                                                                  ;A6C2B7;
    STA.L Ridley.typewriterInstructionTimer                              ;A6C2B8;
    RTS                                                                  ;A6C2BC;

  .timerExpired:
    LDA.L Ridley.typewriterInstructionTimerResetValue                    ;A6C2BD;
    STA.L Ridley.typewriterInstructionTimer                              ;A6C2C1;
    LDA.L Ridley.typewriterInstructionList                               ;A6C2C5;
    TAX                                                                  ;A6C2C9;

  .loop:
    LDA.W $0000,X                                                        ;A6C2CA;
    BNE +                                                                ;A6C2CD;
    SEC                                                                  ;A6C2CF;
    RTS                                                                  ;A6C2D0;

+   CMP.W #$0001                                                         ;A6C2D1;
    BNE +                                                                ;A6C2D4;
    INX                                                                  ;A6C2D6;
    INX                                                                  ;A6C2D7;
    LDA.W $0000,X                                                        ;A6C2D8;
    STA.L Ridley.typewriterInstructionTimerResetValue                    ;A6C2DB;
    INX                                                                  ;A6C2DF;
    INX                                                                  ;A6C2E0;
    JMP.W .loop                                                          ;A6C2E1;

+   CMP.W #$000D                                                         ;A6C2E4;
    BNE +                                                                ;A6C2E7;
    INX                                                                  ;A6C2E9;
    INX                                                                  ;A6C2EA;
    LDA.W $0000,X                                                        ;A6C2EB;
    STA.L Ridley.typewriterVRAMTilemapAddr                               ;A6C2EE;
    INX                                                                  ;A6C2F2;
    INX                                                                  ;A6C2F3;
    JMP.W .loop                                                          ;A6C2F4;

+   AND.W #$00FF                                                         ;A6C2F7;
    CMP.W #$0020                                                         ;A6C2FA;
    BNE +                                                                ;A6C2FD;
    LDA.L Ridley.typewriterVRAMTilemapAddr                               ;A6C2FF;
    INC                                                                  ;A6C303;
    STA.L Ridley.typewriterVRAMTilemapAddr                               ;A6C304;
    INX                                                                  ;A6C308;
    TXA                                                                  ;A6C309;
    STA.L Ridley.typewriterInstructionList                               ;A6C30A;
    CLC                                                                  ;A6C30E;
    RTS                                                                  ;A6C30F;

+   CMP.W #$0021                                                         ;A6C310;
    BNE +                                                                ;A6C313;
    LDA.W #$005B                                                         ;A6C315;

+   PHA                                                                  ;A6C318;
    TXA                                                                  ;A6C319;
    INC                                                                  ;A6C31A;
    STA.L Ridley.typewriterInstructionList                               ;A6C31B;
    LDY.W VRAMWriteStack                                                 ;A6C31F;
    LDA.W #$0002                                                         ;A6C322;
    STA.W VRAMWrite.size,Y                                               ;A6C325; >.<
    LDA.W #$7E00                                                         ;A6C328;
    STA.W VRAMWrite.src+1,Y                                              ;A6C32B; >.<
    PLA                                                                  ;A6C32E;
    SEC                                                                  ;A6C32F;
    SBC.W #$0041                                                         ;A6C330;
    CLC                                                                  ;A6C333;
    ADC.B $12                                                            ;A6C334;
    STA.L Ridley.typewriterTileToBeWrittenToTilemap                      ;A6C336;
    LDA.W #Ridley.typewriterTileToBeWrittenToTilemap                     ;A6C33A; $7E
    STA.W VRAMWrite.src,Y                                                ;A6C33D; >.<
    LDA.L Ridley.typewriterVRAMTilemapAddr                               ;A6C340;
    STA.W VRAMWrite.dest,Y                                               ;A6C344; >.<
    INC                                                                  ;A6C347;
    STA.L Ridley.typewriterVRAMTilemapAddr                               ;A6C348;
    TYA                                                                  ;A6C34C;
    CLC                                                                  ;A6C34D;
    ADC.W #$0007                                                         ;A6C34E;
    STA.W VRAMWriteStack                                                 ;A6C351;
    LDA.L Ridley.typewriterStrokeTimer                                   ;A6C354;
    INC                                                                  ;A6C358;
    STA.L Ridley.typewriterStrokeTimer                                   ;A6C359;
    CMP.W #$0002                                                         ;A6C35D;
    BMI .returnStillTyping                                               ;A6C360;
    LDA.W #$0000                                                         ;A6C362;
    STA.L Ridley.typewriterStrokeTimer                                   ;A6C365;
    LDA.W AreaIndex                                                      ;A6C369;
    CMP.W #$0006                                                         ;A6C36C;
    BNE .introTypewriterSFX                                              ;A6C36F;
    LDA.W #$0045                                                         ;A6C371;
    JSL.L QueueSound_Lib2_Max3                                           ;A6C374;
    BRA .returnStillTyping                                               ;A6C378;

  .introTypewriterSFX:
    LDA.W #$000D                                                         ;A6C37A;
    JSL.L QueueSound_Lib3_Max3                                           ;A6C37D;

  .returnStillTyping:
    CLC                                                                  ;A6C381;
    RTS                                                                  ;A6C382;


;;; $C383:  ;;;
QueueCeresEscapeJapaneseTextTilemapTransfers:
    LDX.W #TypewriterCeresEscapeJapaneseTextTilemapTransfer_size         ;A6C383;
    PHB                                                                  ;A6C386;
    PHK                                                                  ;A6C387;
    PLB                                                                  ;A6C388;
    LDY.W VRAMWriteStack                                                 ;A6C389;

  .loop:
    LDA.W $0000,X                                                        ;A6C38C;
    BEQ .done                                                            ;A6C38F;
    STA.W VRAMWrite.size,Y                                               ;A6C391; >.<
    LDA.W $0003,X                                                        ;A6C394;
    STA.W VRAMWrite.src+1,Y                                              ;A6C397; >.<
    LDA.W $0002,X                                                        ;A6C39A;
    STA.W VRAMWrite.src,Y                                                ;A6C39D; >.<
    LDA.W $0005,X                                                        ;A6C3A0;
    STA.W VRAMWrite.dest,Y                                               ;A6C3A3; >.<
    TYA                                                                  ;A6C3A6;
    CLC                                                                  ;A6C3A7;
    ADC.W #$0007                                                         ;A6C3A8;
    TAY                                                                  ;A6C3AB;
    TXA                                                                  ;A6C3AC;
    ADC.W #$0007                                                         ;A6C3AD;
    TAX                                                                  ;A6C3B0;
    BRA .loop                                                            ;A6C3B1;

  .done:
    STY.W VRAMWriteStack                                                 ;A6C3B3;
    PLB                                                                  ;A6C3B6;
    RTL                                                                  ;A6C3B7;


;;; $C3B8: Tilemap transfer entries ;;;
TypewriterCeresEscapeJapaneseTextTilemapTransfer:
  .size:
    dw $0018                                                             ;A6C3B8;
  .src:
    dl TypewriterCeresEscapeJapanTextTilemap_Line0_Row0                  ;A6C3BA;
  .VRAM:
    dw $528A                                                             ;A6C3BD;

    dw $0018                                                             ;A6C3BF; Size
    dl TypewriterCeresEscapeJapanTextTilemap_Line0_Row1                  ;A6C3C1; Source address
    dw $52AA                                                             ;A6C3C4; VRAM address

    dw $0016                                                             ;A6C3C6; Size
    dl TypewriterCeresEscapeJapanTextTilemap_Line1_Row0                  ;A6C3C8; Source address
    dw $52CA                                                             ;A6C3CB; VRAM address

    dw $0016                                                             ;A6C3CD; Size
    dl TypewriterCeresEscapeJapanTextTilemap_Line1_Row1                  ;A6C3CF; Source address
    dw $52EA                                                             ;A6C3D2; VRAM address

    dw $0000                                                             ;A6C3D4; Zero terminator

if !FEATURE_KEEP_UNREFERENCED
UNUSED_TypewriterCeresEscapeJapanTextTilemapTransfer_A6C3D6:
    dw $0018                                                             ;A6C3D6; Size
    dl TypewriterCeresEscapeJapanTextTilemap_Line0_Row0                  ;A6C3D8; Source address
    dw $4A8A                                                             ;A6C3DB; VRAM address

    dw $0018                                                             ;A6C3DD; Size
    dl TypewriterCeresEscapeJapanTextTilemap_Line0_Row1                  ;A6C3DF; Source address
    dw $4AAA                                                             ;A6C3E2; VRAM address

    dw $0016                                                             ;A6C3E4; Size
    dl TypewriterCeresEscapeJapanTextTilemap_Line1_Row0                  ;A6C3E6; Source address
    dw $4ACA                                                             ;A6C3E9; VRAM address

    dw $0016                                                             ;A6C3EB; Size
    dl TypewriterCeresEscapeJapanTextTilemap_Line1_Row1                  ;A6C3ED; Source address
    dw $4AEA                                                             ;A6C3F0; VRAM address

    dw $0000                                                             ;A6C3F2; Zero terminator
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $C3F4: Tilemaps ;;;
; Ceres Escape Japanese text
; uses two tile high text
; first line
TypewriterCeresEscapeJapanTextTilemap_Line0_Row0:
    dw $3DA0,$3DA1,$3DA2,$3DA3,$3DA4,$3DA5,$3DA6,$3DA7                   ;A6C3F4;
    dw $3DAF,$3DA8,$3DAF,$3DA9                                           ;A6C404;

TypewriterCeresEscapeJapanTextTilemap_Line0_Row1:
    dw $3DB0,$3DB1,$3DB2,$3DB3,$3DB4,$3DB5,$3DB6,$3DB7                   ;A6C40C;
    dw $3DBF,$3DB8,$3DBF,$3DB9                                           ;A6C41C;

; second line
TypewriterCeresEscapeJapanTextTilemap_Line1_Row0:
    dw $3DA9,$3DAA,$3DAB,$3DAC,$3DAD,$3DAE,$3DAF,$3D9C                   ;A6C424;
    dw $3D9D,$3D9E,$3D9F                                                 ;A6C434;

TypewriterCeresEscapeJapanTextTilemap_Line1_Row1:
    dw $3DB9,$3DBA,$3DBB,$3DBC,$3DBD,$3DBE,$3DBF,$3DC0                   ;A6C43A;
    dw $3DC1,$3DC2,$3DC3                                                 ;A6C44A;


;;; $C450: Typewriter text - Ceres escape timer ;;;
TypewriterText_CeresEscapeTimer:
    dw $0001,$0002                                                       ;A6C450; Timer reset value = 2
    dw $000D,$5105                                                       ;A6C454; VRAM tilemap address = $5105 (BG1 tile (5, 8))
    db "SELF DESTRUCT SEQUENCE"                                          ;A6C458;
    dw $000D,$5145                                                       ;A6C46E; VRAM tilemap address = $5145 (BG1 tile (5, Ah))
    db "ACTIVATED EVACUATE"                                              ;A6C472;
    dw $000D,$5185                                                       ;A6C484; VRAM tilemap address = $5185 (BG1 tile (5, Ch))
    db "COLONY IMMEDIATELY"                                              ;A6C488;
    dw $0000                                                             ;A6C49A;


;;; $C49C: Typewriter text - Zebes escape timer ;;;
TypewriterText_ZebesEscapeTimer:
    dw $0001,$0002                                                       ;A6C49C; Timer reset value = 2
    dw $000D,$4905                                                       ;A6C4A0; VRAM tilemap address = $4905 (BG2 tile (5, 8))
    db "TIME BOMB SET!"                                                  ;A6C4A4;
    dw $000D,$4945                                                       ;A6C4B2; VRAM tilemap address = $4945 (BG2 tile (5, Ah))
    db "ESCAPE IMMEDIATELY!"                                             ;A6C4B6;
    dw $0000                                                             ;A6C4C9;


;;; $C4CB: Zebes escape timer sprite tile transfer entries ;;;
ZebesEscapeTimerSpriteTileTransferEntries:
; Escape timer numbers
  .size:
    dw $0200                                                             ;A6C4CB;
  .src:
    dl Tiles_EscapeTimer_0                                               ;A6C4CD;
  .VRAM:
    dw $7E00                                                             ;A6C4D0;

    dw $0120                                                             ;A6C4D2; Size
    dl Tiles_EscapeTimer_1                                               ;A6C4D4; Source address
    dw $7F00                                                             ;A6C4D7; VRAM address

; Escape timer text
    dw $0200                                                             ;A6C4D9; Size
    dl Tiles_EscapeTimerText_0                                           ;A6C4DB; Source address
    dw $7820                                                             ;A6C4DE; VRAM address

    dw $0200                                                             ;A6C4E0; Size
    dl Tiles_EscapeTimerText_1                                           ;A6C4E2; Source address
    dw $7920                                                             ;A6C4E5; VRAM address

    dw $0200                                                             ;A6C4E7; Size
    dl Tiles_EscapeTimerText_2                                           ;A6C4E9; Source address
    dw $7A20                                                             ;A6C4EC; VRAM address

    dw $0200                                                             ;A6C4EE; Size
    dl Tiles_EscapeTimerText_3                                           ;A6C4F0; Source address
    dw $7B20                                                             ;A6C4F3; VRAM address

    dw $0100                                                             ;A6C4F5; Size
    dl Tiles_EscapeTimerText_4                                           ;A6C4F7; Source address
    dw $7C20                                                             ;A6C4FA; VRAM address

    dw $0000                                                             ;A6C4FC; Zero terminator


;;; $C4FE: Ceres escape timer BG1/2 tile transfer entries ;;;
CeresEscapeTimerBG12TransferEntries:
; Escape timer text
  .size:
    dw $0200                                                             ;A6C4FE;
  .src:
    dl Tiles_EscapeTimerText_0                                           ;A6C500;
  .VRAM:
    dw $1820                                                             ;A6C503;

    dw $0200                                                             ;A6C505; Size
    dl Tiles_EscapeTimerText_1                                           ;A6C507; Source address
    dw $1920                                                             ;A6C50A; VRAM address

    dw $0200                                                             ;A6C50C; Size
    dl Tiles_EscapeTimerText_2                                           ;A6C50E; Source address
    dw $1A20                                                             ;A6C511; VRAM address

    dw $0200                                                             ;A6C513; Size
    dl Tiles_EscapeTimerText_3                                           ;A6C515; Source address
    dw $1B20                                                             ;A6C518; VRAM address

    dw $0100                                                             ;A6C51A; Size
    dl Tiles_EscapeTimerText_4                                           ;A6C51C; Source address
    dw $1C20                                                             ;A6C51F; VRAM address

; Ceres door tiles
    dw $0200                                                             ;A6C521; Size
    dl Tiles_CeresDoor_0                                                 ;A6C523; Source address
    dw $0D00                                                             ;A6C526; VRAM address

    dw $0200                                                             ;A6C528; Size
    dl Tiles_CeresDoor_1                                                 ;A6C52A; Source address
    dw $0E00                                                             ;A6C52D; VRAM address

    dw $0200                                                             ;A6C52F; Size
    dl Tiles_CeresDoor_2                                                 ;A6C531; Source address
    dw $0F00                                                             ;A6C534; VRAM address

    dw $0000                                                             ;A6C536; Zero terminator


;;; $C538: Ridley function ;;;
Function_Ridley_MoveToDeathSpot:
; Move Ridley towards 80,148
    JSR.W MoveRidleyToDeathSpot                                          ;A6C538;
    BCC Function_Ridley_FinalRoar                                        ;A6C53B;
    RTS                                                                  ;A6C53D;


;;; $C53E: Ridley function ;;;
Function_Ridley_FinalRoar:
; Final roar
    LDA.W #InstList_Ridley_FacingLeft_DeathRoar                          ;A6C53E;
    JSR.W SetRidleyInstList                                              ;A6C541;
    LDA.W #Function_Ridley_MoveToDeathSpot_Wait_LowerAcid                ;A6C544;
    STA.W Ridley.function                                                ;A6C547;
    LDA.W #$0020                                                         ;A6C54A;
    STA.W Ridley.functionTimer                                           ;A6C54D;

  .return:
    RTS                                                                  ;A6C550;


;;; $C551: Ridley function ;;;
Function_Ridley_MoveToDeathSpot_Wait_LowerAcid:
; Move to death spot, wait, then lower acid
    JSR.W MoveRidleyToDeathSpot                                          ;A6C551;
    DEC.W Ridley.functionTimer                                           ;A6C554;
    BPL Function_Ridley_FinalRoar_return                                 ;A6C557;
    STZ.W Ridley.XSpeed                                                  ;A6C559;
    STZ.W Ridley.YSpeed                                                  ;A6C55C;
    LDA.W #$0210                                                         ;A6C55F;
    STA.W FX_TargetYPosition                                             ;A6C562;
    LDA.W #$0040                                                         ;A6C565;
    STA.W FX_YSubVelocity                                                ;A6C568;
    LDA.W #$0001                                                         ;A6C56B;
    STA.W FX_Timer                                                       ;A6C56E;
    LDA.W #$0000                                                         ;A6C571;
    STA.L Ridley.deathExplosionTimer                                     ;A6C574;
    STA.L Ridley.deathExplosionIndex                                     ;A6C578;
    LDA.W #Function_Ridley_DeathExplosions_DropSamusIfNeeded             ;A6C57C;
    STA.W Ridley.function                                                ;A6C57F;
    LDA.W #$00A0                                                         ;A6C582;
    STA.W Ridley.functionTimer                                           ;A6C585; fallthrough to Function_Ridley_DeathExplosions_DropSamusIfNeeded


;;; $C588: Ridley function ;;;
Function_Ridley_DeathExplosions_DropSamusIfNeeded:
; Explosions for death. After a while, drop Samus if needed
    JSR.W SpawnRidleyExplosions                                          ;A6C588;
    DEC.W Ridley.functionTimer                                           ;A6C58B;
    BPL Function_Ridley_FinalRoar_return                                 ;A6C58E;
    LDA.L Ridley.holdingSamusFlag                                        ;A6C590;
    BEQ .notHoldingSamus                                                 ;A6C594;
    JSR.W ReleaseSamus                                                   ;A6C596;

  .notHoldingSamus:
    LDA.W #Function_Ridley_DisableRidley                                 ;A6C599;
    STA.W Ridley.function                                                ;A6C59C;
    STZ.W Ridley.XSpeed                                                  ;A6C59F;
    STZ.W Ridley.YSpeed                                                  ;A6C5A2;
    JMP.W SpawnRidleyExplosionEnemies                                    ;A6C5A5;


;;; $C5A8: Ridley function ;;;
Function_Ridley_DisableRidley:
; Disable Ridley
    JSR.W SpawnRidleyExplosions                                          ;A6C5A8;
    LDA.W #$0000                                                         ;A6C5AB;
    STA.L Ridley.activeFlag                                              ;A6C5AE;
    LDA.W Enemy.properties                                               ;A6C5B2;
    ORA.W #$0100                                                         ;A6C5B5;
    STA.W Enemy.properties                                               ;A6C5B8;
    LDA.W #Function_Ridley_Wait20Frames                                  ;A6C5BB;
    STA.W Ridley.function                                                ;A6C5BE;
    LDA.W #$0020                                                         ;A6C5C1;
    STA.W Ridley.functionTimer                                           ;A6C5C4;
    RTS                                                                  ;A6C5C7;


;;; $C5C8: Ridley function ;;;
Function_Ridley_Wait20Frames:
; Wait 20 frames
    DEC.W Ridley.functionTimer                                           ;A6C5C8;
    BPL Function_Ridley_FinalRoar_return                                 ;A6C5CB;
    LDA.W #Function_Ridley_Wait100f_SpawnDrops_ChangeMusic_MarkBossDead  ;A6C5CD;
    STA.W Ridley.function                                                ;A6C5D0;
    LDA.W #$0100                                                         ;A6C5D3;
    STA.W Ridley.functionTimer                                           ;A6C5D6;
    RTS                                                                  ;A6C5D9;


;;; $C5DA: Ridley function ;;;
Function_Ridley_Wait100f_SpawnDrops_ChangeMusic_MarkBossDead:
; Wait 100 frames, then drop items, change music, and set boss bit
    DEC.W Ridley.functionTimer                                           ;A6C5DA;
    BPL .return                                                          ;A6C5DD;
    LDA.W #$0001                                                         ;A6C5DF;
    JSL.L SetBossBitsInAForCurrentArea                                   ;A6C5E2;
    JSL.L RidleyDeathItemDropRoutine                                     ;A6C5E6;
    LDA.W #$0003                                                         ;A6C5EA;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;A6C5ED;
    LDA.W Enemy.properties                                               ;A6C5F1;
    ORA.W #$0200                                                         ;A6C5F4;
    STA.W Enemy.properties                                               ;A6C5F7;
    LDA.W #.return                                                       ;A6C5FA;
    STA.W Ridley.function                                                ;A6C5FD;

  .return:
    RTS                                                                  ;A6C600;


;;; $C601:  ;;;
MoveRidleyToDeathSpot:
; Move to death spot, CLC when near it
    LDX.W #$0080                                                         ;A6C601;
    STX.B $12                                                            ;A6C604;
    LDY.W #$0148                                                         ;A6C606;
    STY.B $14                                                            ;A6C609;
    LDX.W #$0000                                                         ;A6C60B;
    LDY.W #$0000                                                         ;A6C60E;
    LDA.W #$0010                                                         ;A6C611;
    JSR.W AccelerateRidleyTowardDesiredXYPosition                        ;A6C614;
    LDA.W #$0004                                                         ;A6C617;
    STA.B $16                                                            ;A6C61A;
    STA.B $18                                                            ;A6C61C;
    JSL.L CheckForEnemyCollisionWithRectangle                            ;A6C61E;
    RTS                                                                  ;A6C622;


;;; $C623:  ;;;
SpawnRidleyExplosions:
; Keep playing explosions
    LDA.L Ridley.deathExplosionTimer                                     ;A6C623;
    DEC                                                                  ;A6C627;
    BMI .timerExpired                                                    ;A6C628;
    STA.L Ridley.deathExplosionTimer                                     ;A6C62A;
    RTS                                                                  ;A6C62E;

  .timerExpired:
    LDA.W #$0004                                                         ;A6C62F;
    STA.L Ridley.deathExplosionTimer                                     ;A6C632;
    LDA.L Ridley.deathExplosionIndex                                     ;A6C636;
    INC                                                                  ;A6C63A;
    CMP.W #$000A                                                         ;A6C63B;
    BMI .notA                                                            ;A6C63E;
    LDA.W #$0000                                                         ;A6C640;

  .notA:
    STA.L Ridley.deathExplosionIndex                                     ;A6C643;
    ASL                                                                  ;A6C647;
    ASL                                                                  ;A6C648;
    TAY                                                                  ;A6C649;
    LDA.W .XPosition,Y                                                   ;A6C64A;
    CLC                                                                  ;A6C64D;
    ADC.W Enemy.XPosition                                                ;A6C64E;
    STA.B $12                                                            ;A6C651;
    LDA.W .YPosition,Y                                                   ;A6C653;
    CLC                                                                  ;A6C656;
    ADC.W Enemy.YPosition                                                ;A6C657;
    STA.B $14                                                            ;A6C65A;
    LDA.W #$0003                                                         ;A6C65C;
    LDY.W #EnemyProjectile_MiscDust                                      ;A6C65F;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A6C662;
    LDA.W #$0024                                                         ;A6C666;
    JSL.L QueueSound_Lib2_Max3                                           ;A6C669;
    RTS                                                                  ;A6C66D;

; explosion X,Y offsets
  .XPosition:
    dw $FFE8                                                             ;A6C66E;
  .YPosition:
    dw       $FFE8, $FFEC,$0014, $0010,$FFE2, $001E,$FFFD, $000E,$FFF3   ;A6C670;
    dw $FFFE,$0012, $FFFE,$FFE0, $FFE1,$0008, $FFFC,$FFF6, $0013,$0013   ;A6C682;


;;; $C696: Initialisation AI - enemy $E1BF (Ridley explosion) ;;;
InitAI_RidleyExplosion:
    LDX.W EnemyIndex                                                     ;A6C696;
    LDA.W #$0001                                                         ;A6C699;
    STA.W Enemy.instTimer,X                                              ;A6C69C;
    STZ.W Enemy.loopCounter,X                                            ;A6C69F;
    STZ.W Enemy.GFXOffset,X                                              ;A6C6A2;
    LDA.W #$0E00                                                         ;A6C6A5;
    STA.W Enemy.palette,X                                                ;A6C6A8;
    LDY.W Enemy.init0,X                                                  ;A6C6AB;
    LDA.W .lifetimes,Y                                                   ;A6C6AE;
    STA.W RidleyExplosion.lifeTimer,X                                    ;A6C6B1;
    JSL.L GenerateRandomNumber                                           ;A6C6B4;
    AND.W #$0130                                                         ;A6C6B8;
    BIT.W RandomNumberSeed                                               ;A6C6BB;
    BPL +                                                                ;A6C6BE;
    EOR.W #$FFFF                                                         ;A6C6C0;
    INC                                                                  ;A6C6C3;

+   STA.W RidleyExplosion.XVelocity,X                                    ;A6C6C4;
    STZ.W RidleyExplosion.YVelocity,X                                    ;A6C6C7;
    TYX                                                                  ;A6C6CA;
    JMP.W (.initPointers,X)                                              ;A6C6CB;

  .lifetimes:
; Life times. Indexed by enemy parameter 1
    dw $0048,$0050,$0058,$0060,$0068,$0070,$0078,$0028                   ;A6C6CE;
    dw $0030,$0038,$0080,$0040                                           ;A6C6DE;

  .initPointers:
; Initialisation pointers. Indexed by enemy parameter 1
    dw RidleyExplosionInitialization_0                                   ;A6C6E6;
    dw RidleyExplosionInitialization_2                                   ;A6C6E8;
    dw RidleyExplosionInitialization_4                                   ;A6C6EA;
    dw RidleyExplosionInitialization_6                                   ;A6C6EC;
    dw RidleyExplosionInitialization_8                                   ;A6C6EE;
    dw RidleyExplosionInitialization_A                                   ;A6C6F0;
    dw RidleyExplosionInitialization_C                                   ;A6C6F2;
    dw RidleyExplosionInitialization_E                                   ;A6C6F4;
    dw RidleyExplosionInitialization_10                                  ;A6C6F6;
    dw RidleyExplosionInitialization_12                                  ;A6C6F8;
    dw RidleyExplosionInitialization_14                                  ;A6C6FA;
    dw RidleyExplosionInitialization_16                                  ;A6C6FC;


;;; $C6FE: Ridley explosion initialisation - index = 0 ;;;
RidleyExplosionInitialization_0:
    LDX.W EnemyIndex                                                     ;A6C6FE;
    LDA.L Ridley.tail1XPosition                                          ;A6C701;
    STA.W Enemy.XPosition,X                                              ;A6C705;
    LDA.L Ridley.tail1YPosition                                          ;A6C708;
    STA.W Enemy.YPosition,X                                              ;A6C70C;
    LDA.W #InstList_RidleyTail_Large                                     ;A6C70F;
    STA.W Enemy.instList,X                                               ;A6C712;
    RTL                                                                  ;A6C715;


;;; $C716: Ridley explosion initialisation - index = 2 ;;;
RidleyExplosionInitialization_2:
    LDX.W EnemyIndex                                                     ;A6C716;
    LDA.L Ridley.tail2XPosition                                          ;A6C719;
    STA.W Enemy.XPosition,X                                              ;A6C71D;
    LDA.L Ridley.tail2YPosition                                          ;A6C720;
    STA.W Enemy.YPosition,X                                              ;A6C724;
    LDA.W #InstList_RidleyTail_Large                                     ;A6C727;
    STA.W Enemy.instList,X                                               ;A6C72A;
    RTL                                                                  ;A6C72D;


;;; $C72E: Ridley explosion initialisation - index = 4 ;;;
RidleyExplosionInitialization_4:
    LDX.W EnemyIndex                                                     ;A6C72E;
    LDA.L Ridley.tail3XPosition                                          ;A6C731;
    STA.W Enemy.XPosition,X                                              ;A6C735;
    LDA.L Ridley.tail3YPosition                                          ;A6C738;
    STA.W Enemy.YPosition,X                                              ;A6C73C;
    LDA.W #InstList_RidleyTail_Medium                                    ;A6C73F;
    STA.W Enemy.instList,X                                               ;A6C742;
    RTL                                                                  ;A6C745;


;;; $C746: Ridley explosion initialisation - index = 6 ;;;
RidleyExplosionInitialization_6:
    LDX.W EnemyIndex                                                     ;A6C746;
    LDA.L Ridley.tail4XPosition                                          ;A6C749;
    STA.W Enemy.XPosition,X                                              ;A6C74D;
    LDA.L Ridley.tail4YPosition                                          ;A6C750;
    STA.W Enemy.YPosition,X                                              ;A6C754;
    LDA.W #InstList_RidleyTail_Medium                                    ;A6C757;
    STA.W Enemy.instList,X                                               ;A6C75A;
    RTL                                                                  ;A6C75D;


;;; $C75E: Ridley explosion initialisation - index = 8 ;;;
RidleyExplosionInitialization_8:
    LDX.W EnemyIndex                                                     ;A6C75E;
    LDA.L Ridley.tail5XPosition                                          ;A6C761;
    STA.W Enemy.XPosition,X                                              ;A6C765;
    LDA.L Ridley.tail5YPosition                                          ;A6C768;
    STA.W Enemy.YPosition,X                                              ;A6C76C;
    LDA.W #InstList_RidleyTail_Small                                     ;A6C76F;
    STA.W Enemy.instList,X                                               ;A6C772;
    RTL                                                                  ;A6C775;


;;; $C776: Ridley explosion initialisation - index = Ah ;;;
RidleyExplosionInitialization_A:
    LDX.W EnemyIndex                                                     ;A6C776;
    LDA.L Ridley.tail6XPosition                                          ;A6C779;
    STA.W Enemy.XPosition,X                                              ;A6C77D;
    LDA.L Ridley.tail6YPosition                                          ;A6C780;
    STA.W Enemy.YPosition,X                                              ;A6C784;
    LDA.W #InstList_RidleyTail_Small                                     ;A6C787;
    STA.W Enemy.instList,X                                               ;A6C78A;
    RTL                                                                  ;A6C78D;


;;; $C78E: Ridley explosion initialisation - index = Ch ;;;
RidleyExplosionInitialization_C:
    LDX.W EnemyIndex                                                     ;A6C78E;
    LDA.L Ridley.tailTipXPosition                                        ;A6C791;
    STA.W Enemy.XPosition,X                                              ;A6C795;
    LDA.L Ridley.tailTipYPosition                                        ;A6C798;
    STA.W Enemy.YPosition,X                                              ;A6C79C;
    LDA.L Ridley.tailTipAngle                                            ;A6C79F;
    CLC                                                                  ;A6C7A3;
    ADC.L Ridley.tail6Angle                                              ;A6C7A4;
    CLC                                                                  ;A6C7A8;
    ADC.W #$0008                                                         ;A6C7A9;
    AND.W #$00F0                                                         ;A6C7AC;
    LSR                                                                  ;A6C7AF;
    LSR                                                                  ;A6C7B0;
    LSR                                                                  ;A6C7B1;
    TAY                                                                  ;A6C7B2;
    LDA.W .instListPointers,Y                                            ;A6C7B3;
    STA.W Enemy.instList,X                                               ;A6C7B6;
    RTL                                                                  ;A6C7B9;

  .instListPointers:
    dw InstList_RidleyTailTip_PointingDown                               ;A6C7BA;
    dw InstList_RidleyTailTip_PointingDownDownRight                      ;A6C7BC;
    dw InstList_RidleyTailTip_PointingDownRight                          ;A6C7BE;
    dw InstList_RidleyTailTip_PointingRightDownRight                     ;A6C7C0;
    dw InstList_RidleyTailTip_PointingRight                              ;A6C7C2;
    dw InstList_RidleyTailTip_PointingRightUpRight                       ;A6C7C4;
    dw InstList_RidleyTailTip_PointingUpRight                            ;A6C7C6;
    dw InstList_RidleyTailTip_PointingUpUpRight                          ;A6C7C8;
    dw InstList_RidleyTailTip_PointingUp                                 ;A6C7CA;
    dw InstList_RidleyTailTip_PointingUpUpLeft                           ;A6C7CC;
    dw InstList_RidleyTailTip_PointingUpLeft                             ;A6C7CE;
    dw InstList_RidleyTailTip_PointingLeftUpLeft                         ;A6C7D0;
    dw InstList_RidleyTailTip_PointingLeft                               ;A6C7D2;
    dw InstList_RidleyTailTip_PointingLeftDownLeft                       ;A6C7D4;
    dw InstList_RidleyTailTip_PointingDownLeft                           ;A6C7D6;
    dw InstList_RidleyTailTip_PointingDownDownLeft                       ;A6C7D8;


;;; $C7DA: Ridley explosion initialisation - index = Eh ;;;
RidleyExplosionInitialization_E:
    LDY.W #$0000                                                         ;A6C7DA;
    LDA.L Ridley.facingDirection                                         ;A6C7DD;
    BEQ .right                                                           ;A6C7E1;
    LDY.W #$0002                                                         ;A6C7E3;

  .right:
    LDX.W EnemyIndex                                                     ;A6C7E6;
    LDA.W .XOffsetFromRidleyXPosition,Y                                  ;A6C7E9;
    CLC                                                                  ;A6C7EC;
    ADC.W Enemy.XPosition                                                ;A6C7ED;
    STA.W Enemy.XPosition,X                                              ;A6C7F0;
    LDA.W #$0000                                                         ;A6C7F3;
    CLC                                                                  ;A6C7F6;
    ADC.W Enemy.YPosition                                                ;A6C7F7;
    STA.W Enemy.YPosition,X                                              ;A6C7FA;
    LDA.W .instListPointer,Y                                             ;A6C7FD;
    STA.W Enemy.instList,X                                               ;A6C800;
    RTL                                                                  ;A6C803;

  .XOffsetFromRidleyXPosition:
    dw $0000,$0000                                                       ;A6C804;

  .instListPointer:
    dw InstList_RidleyWings_FullyRaised_FacingLeft                       ;A6C808;
    dw InstList_RidleyWings_FullyRaised_FacingRight                      ;A6C80A;


;;; $C80C: Ridley explosion initialisation - index = 10h ;;;
RidleyExplosionInitialization_10:
    LDY.W #$0000                                                         ;A6C80C;
    LDA.L Ridley.facingDirection                                         ;A6C80F;
    BEQ .right                                                           ;A6C813;
    LDY.W #$0002                                                         ;A6C815;

  .right:
    LDX.W EnemyIndex                                                     ;A6C818;
    LDA.W .XOffsetFromRidleyXPosition,Y                                  ;A6C81B;
    CLC                                                                  ;A6C81E;
    ADC.W Enemy.XPosition                                                ;A6C81F;
    STA.W Enemy.XPosition,X                                              ;A6C822;
    LDA.W #$0016                                                         ;A6C825;
    CLC                                                                  ;A6C828;
    ADC.W Enemy.YPosition                                                ;A6C829;
    STA.W Enemy.YPosition,X                                              ;A6C82C;
    LDA.W .instListPointer,Y                                             ;A6C82F;
    STA.W Enemy.instList,X                                               ;A6C832;
    RTL                                                                  ;A6C835;

  .XOffsetFromRidleyXPosition:
    dw $000F,$FFF1                                                       ;A6C836;

  .instListPointer:
    dw InstList_RidleyLegs_PulledUp_FacingLeft                           ;A6C83A;
    dw InstList_RidleyLegs_PulledUp_FacingRight                          ;A6C83C;


;;; $C83E: Ridley explosion initialisation - index = 12h ;;;
RidleyExplosionInitialization_12:
    LDY.W #$0000                                                         ;A6C83E;
    LDA.L Ridley.facingDirection                                         ;A6C841;
    BEQ .right                                                           ;A6C845;
    LDY.W #$0002                                                         ;A6C847;

  .right:
    LDX.W EnemyIndex                                                     ;A6C84A;
    LDA.W .XOffsetFromRidleyXPosition,Y                                  ;A6C84D;
    CLC                                                                  ;A6C850;
    ADC.W Enemy.XPosition                                                ;A6C851;
    STA.W Enemy.XPosition,X                                              ;A6C854;
    LDA.W #$FFE8                                                         ;A6C857;
    CLC                                                                  ;A6C85A;
    ADC.W Enemy.YPosition                                                ;A6C85B;
    STA.W Enemy.YPosition,X                                              ;A6C85E;
    LDA.W .instListPointer,Y                                             ;A6C861;
    STA.W Enemy.instList,X                                               ;A6C864;
    RTL                                                                  ;A6C867;

  .XOffsetFromRidleyXPosition:
    dw $FFFD,$0003                                                       ;A6C868;

  .instListPointer:
    dw InstList_RidleyHead_MouthOpen_FacingLeft                          ;A6C86C;
    dw InstList_RidleyHead_MouthOpen_FacingRight                         ;A6C86E;


;;; $C870: Ridley explosion initialisation - index = 14h ;;;
RidleyExplosionInitialization_14:
    LDY.W #$0000                                                         ;A6C870;
    LDA.L Ridley.facingDirection                                         ;A6C873;
    BEQ .right                                                           ;A6C877;
    LDY.W #$0002                                                         ;A6C879;

  .right:
    LDX.W EnemyIndex                                                     ;A6C87C;
    LDA.W .XOffsetFromRidleyXPosition,Y                                  ;A6C87F;
    CLC                                                                  ;A6C882;
    ADC.W Enemy.XPosition                                                ;A6C883;
    STA.W Enemy.XPosition,X                                              ;A6C886;
    LDA.W #$0000                                                         ;A6C889;
    CLC                                                                  ;A6C88C;
    ADC.W Enemy.YPosition                                                ;A6C88D;
    STA.W Enemy.YPosition,X                                              ;A6C890;
    LDA.W .instListPointer,Y                                             ;A6C893;
    STA.W Enemy.instList,X                                               ;A6C896;
    RTL                                                                  ;A6C899;

  .XOffsetFromRidleyXPosition:
    dw $0010,$FFF0                                                       ;A6C89A;

  .instListPointer:
    dw InstList_RidleyTorso_FacingLeft                                   ;A6C89E;
    dw InstList_RidleyTorso_FacingRight                                  ;A6C8A0;


;;; $C8A2: Ridley explosion initialisation - index = 16h ;;;
RidleyExplosionInitialization_16:
    LDY.W #$0000                                                         ;A6C8A2;
    LDA.L Ridley.facingDirection                                         ;A6C8A5;
    BEQ .right                                                           ;A6C8A9;
    LDY.W #$0002                                                         ;A6C8AB;

  .right:
    LDX.W EnemyIndex                                                     ;A6C8AE;
    LDA.W .XOffsetFromRidleyXPosition,Y                                  ;A6C8B1;
    CLC                                                                  ;A6C8B4;
    ADC.W Enemy.XPosition                                                ;A6C8B5;
    STA.W Enemy.XPosition,X                                              ;A6C8B8;
    LDA.W #$0007                                                         ;A6C8BB;
    CLC                                                                  ;A6C8BE;
    ADC.W Enemy.YPosition                                                ;A6C8BF;
    STA.W Enemy.YPosition,X                                              ;A6C8C2;
    LDA.W .instListPointer,Y                                             ;A6C8C5;
    STA.W Enemy.instList,X                                               ;A6C8C8;
    RTL                                                                  ;A6C8CB;

  .XOffsetFromRidleyXPosition:
    dw $0008,$FFF8                                                       ;A6C8CC;

  .instListPointer:
    dw InstList_RidleyClaw_FacingLeft                                    ;A6C8D0;
    dw InstList_RidleyClaw_FacingRight                                   ;A6C8D2;


;;; $C8D4: Main AI - enemy $E1BF (Ridley explosion) ;;;
MainAI_RidleyExplosion:
    LDX.W EnemyIndex                                                     ;A6C8D4;
    JSR.W HandleFlickering                                               ;A6C8D7;
    LDA.W RidleyExplosion.XVelocity,X                                    ;A6C8DA;
    BPL +                                                                ;A6C8DD;
    EOR.W #$FFFF                                                         ;A6C8DF;
    INC                                                                  ;A6C8E2;

+   CLC                                                                  ;A6C8E3;
    ADC.W #$FFFC                                                         ;A6C8E4;
    BPL +                                                                ;A6C8E7;
    LDA.W #$0000                                                         ;A6C8E9;

+   BIT.W RidleyExplosion.XVelocity,X                                    ;A6C8EC;
    BPL +                                                                ;A6C8EF;
    EOR.W #$FFFF                                                         ;A6C8F1;
    INC                                                                  ;A6C8F4;

+   STA.W RidleyExplosion.XVelocity,X                                    ;A6C8F5;
    LDA.W RidleyExplosion.YVelocity,X                                    ;A6C8F8;
    CLC                                                                  ;A6C8FB;
    ADC.W #$0004                                                         ;A6C8FC;
    STA.W RidleyExplosion.YVelocity,X                                    ;A6C8FF;
    JSL.L MoveEnemyAccordingToVelocity                                   ;A6C902;
    DEC.W RidleyExplosion.lifeTimer,X                                    ;A6C906;
    BPL .return                                                          ;A6C909;
    LDA.W #$0000                                                         ;A6C90B;
    JML.L EnemyDeath                                                     ;A6C90E;

  .return:
    RTL                                                                  ;A6C912;


;;; $C913: Handle flickering ;;;
HandleFlickering:
    LDA.W Enemy.frameCounter,X                                           ;A6C913;
    AND.W #$0001                                                         ;A6C916;
    STA.W Enemy.frameCounter,X                                           ;A6C919;
    BEQ .visible                                                         ;A6C91C;
    LDA.W Enemy.properties,X                                             ;A6C91E;
    ORA.W #$0100                                                         ;A6C921;
    STA.W Enemy.properties,X                                             ;A6C924;
    RTS                                                                  ;A6C927;

  .visible:
    LDA.W Enemy.properties,X                                             ;A6C928;
    AND.W #$FEFF                                                         ;A6C92B;
    STA.W Enemy.properties,X                                             ;A6C92E;
    RTS                                                                  ;A6C931;


;;; $C932: Spawn Ridley explosion enemies ;;;
SpawnRidleyExplosionEnemies:
    LDX.W #RidleyExplosionEntry_6                                        ;A6C932;
    JSL.L SpawnEnemy                                                     ;A6C935;
    LDX.W #RidleyExplosionEntry_5                                        ;A6C939;
    JSL.L SpawnEnemy                                                     ;A6C93C;
    LDX.W #RidleyExplosionEntry_4                                        ;A6C940;
    JSL.L SpawnEnemy                                                     ;A6C943;
    LDX.W #RidleyExplosionEntry_3                                        ;A6C947;
    JSL.L SpawnEnemy                                                     ;A6C94A;
    LDX.W #RidleyExplosionEntry_2                                        ;A6C94E;
    JSL.L SpawnEnemy                                                     ;A6C951;
    LDX.W #RidleyExplosionEntry_1                                        ;A6C955;
    JSL.L SpawnEnemy                                                     ;A6C958;
    LDX.W #RidleyExplosionEntry_0                                        ;A6C95C;
    JSL.L SpawnEnemy                                                     ;A6C95F;
    LDX.W #RidleyExplosionEntry_7                                        ;A6C963;
    JSL.L SpawnEnemy                                                     ;A6C966;
    LDX.W #RidleyExplosionEntry_8                                        ;A6C96A;
    JSL.L SpawnEnemy                                                     ;A6C96D;
    LDX.W #RidleyExplosionEntry_A                                        ;A6C971;
    JSL.L SpawnEnemy                                                     ;A6C974;
    LDX.W #RidleyExplosionEntry_9                                        ;A6C978;
    JSL.L SpawnEnemy                                                     ;A6C97B;
    LDX.W #RidleyExplosionEntry_B                                        ;A6C97F;
    JSL.L SpawnEnemy                                                     ;A6C982;
    RTS                                                                  ;A6C986;

;        ______________________________________ X position
;       |      ________________________________ Y position
;       |     |      __________________________ Initialisation parameter
;       |     |     |      ____________________ Properties
;       |     |     |     |      ______________ Extra properties
;       |     |     |     |     |      ________ Parameter 1
;       |     |     |     |     |     |     ___ Parameter 2
;       |     |     |     |     |     |    |
RidleyExplosionEntry_0:
    dw EnemyHeaders_RidleyExplosion                                      ;A6C987; Ridley explosion 6
    dw $0000,$0000,$0000,$2C00,$0000,$0000,$0000                         ;A6C989;

RidleyExplosionEntry_1:
    dw EnemyHeaders_RidleyExplosion                                      ;A6C997; Ridley explosion 5
    dw $0000,$0000,$0000,$2C00,$0000,$0002,$0000                         ;A6C999;

RidleyExplosionEntry_2:
    dw EnemyHeaders_RidleyExplosion                                      ;A6C9A7; Ridley explosion 4
    dw $0000,$0000,$0000,$2C00,$0000,$0004,$0000                         ;A6C9A9;

RidleyExplosionEntry_3:
    dw EnemyHeaders_RidleyExplosion                                      ;A6C9B7; Ridley explosion 3
    dw $0000,$0000,$0000,$2C00,$0000,$0006,$0000                         ;A6C9B9;

RidleyExplosionEntry_4:
    dw EnemyHeaders_RidleyExplosion                                      ;A6C9C7; Ridley explosion 2
    dw $0000,$0000,$0000,$2C00,$0000,$0008,$0000                         ;A6C9C9;

RidleyExplosionEntry_5:
    dw EnemyHeaders_RidleyExplosion                                      ;A6C9D7; Ridley explosion 1
    dw $0000,$0000,$0000,$2C00,$0000,$000A,$0000                         ;A6C9D9;

RidleyExplosionEntry_6:
    dw EnemyHeaders_RidleyExplosion                                      ;A6C9E7; Ridley explosion 0
    dw $0000,$0000,$0000,$2C00,$0000,$000C,$0000                         ;A6C9E9;

RidleyExplosionEntry_7:
    dw EnemyHeaders_RidleyExplosion                                      ;A6C9F7; Ridley explosion 7
    dw $0000,$0000,$0000,$2C00,$0000,$000E,$0000                         ;A6C9F9;

RidleyExplosionEntry_8:
    dw EnemyHeaders_RidleyExplosion                                      ;A6CA07; Ridley explosion 8
    dw $0000,$0000,$0000,$2C00,$0000,$0010,$0000                         ;A6CA09;

RidleyExplosionEntry_9:
    dw EnemyHeaders_RidleyExplosion                                      ;A6CA17; Ridley explosion A
    dw $0000,$0000,$0000,$2C00,$0000,$0012,$0000                         ;A6CA19;

RidleyExplosionEntry_A:
    dw EnemyHeaders_RidleyExplosion                                      ;A6CA27; Ridley explosion 9
    dw $0000,$0000,$0000,$2C00,$0000,$0014,$0000                         ;A6CA29;

RidleyExplosionEntry_B:
    dw EnemyHeaders_RidleyExplosion                                      ;A6CA37; Ridley explosion B
    dw $0000,$0000,$0000,$2C00,$0000,$0016,$0000                         ;A6CA39;


;;; $CA47: Instruction list -  ;;;
InstList_RidleyTail_Large:
    dw $0001,Spritemap_RidleyTail_Large                                  ;A6CA47;
    dw Instruction_Common_Sleep                                          ;A6CA4B;


;;; $CA4D: Instruction list -  ;;;
InstList_RidleyTail_Medium:
    dw $0001,Spritemap_RidleyTail_Medium                                 ;A6CA4D;
    dw Instruction_Common_Sleep                                          ;A6CA51;


;;; $CA53: Instruction list -  ;;;
InstList_RidleyTail_Small:
    dw $0001,Spritemap_RidleyTail_Small                                  ;A6CA53;
    dw Instruction_Common_Sleep                                          ;A6CA57;


;;; $CA59: Instruction list -  ;;;
InstList_RidleyWings_FullyRaised_FacingLeft:
    dw $0001,Spritemap_RidleyWings_FacingLeft_FullyRaised                ;A6CA59;
    dw Instruction_Common_Sleep                                          ;A6CA5D;


;;; $CA5F: Instruction list -  ;;;
InstList_RidleyWings_FullyRaised_FacingRight:
    dw $0001,Spritemap_RidleyWings_FacingRight_FullyRaised               ;A6CA5F;
    dw Instruction_Common_Sleep                                          ;A6CA63;


;;; $CA65: Instruction list -  ;;;
InstList_RidleyLegs_PulledUp_FacingLeft:
    dw $0001,Spritemap_Ridley_FacingLeft_Legs_PulledUp                   ;A6CA65;
    dw Instruction_Common_Sleep                                          ;A6CA69;


;;; $CA6B: Instruction list -  ;;;
InstList_RidleyLegs_PulledUp_FacingRight:
    dw $0001,Spritemap_Ridley_FacingRight_Legs_PulledUp                  ;A6CA6B;
    dw Instruction_Common_Sleep                                          ;A6CA6F;


;;; $CA71: Instruction list -  ;;;
InstList_RidleyHead_MouthOpen_FacingLeft:
    dw $0001,Spritemap_Ridley_FacingLeft_HeadNeck_MouthOpen              ;A6CA71;
    dw Instruction_Common_Sleep                                          ;A6CA75;


;;; $CA77: Instruction list -  ;;;
InstList_RidleyHead_MouthOpen_FacingRight:
    dw $0001,Spritemap_Ridley_FacingRight_HeadNeck_MouthOpen             ;A6CA77;
    dw Instruction_Common_Sleep                                          ;A6CA7B;


;;; $CA7D: Instruction list -  ;;;
InstList_RidleyTorso_FacingLeft:
    dw $0001,Spritemap_Ridley_FacingLeft_Torso                           ;A6CA7D;
    dw Instruction_Common_Sleep                                          ;A6CA81;


;;; $CA83: Instruction list -  ;;;
InstList_RidleyTorso_FacingRight:
    dw $0001,Spritemap_Ridley_FacingRight_Torso                          ;A6CA83;
    dw Instruction_Common_Sleep                                          ;A6CA87;


;;; $CA89: Instruction list -  ;;;
InstList_RidleyClaw_FacingLeft:
    dw $0001,Spritemap_Ridley_FacingLeft_Claws                           ;A6CA89;
    dw Instruction_Common_Sleep                                          ;A6CA8D;


;;; $CA8F: Instruction list -  ;;;
InstList_RidleyClaw_FacingRight:
    dw $0001,Spritemap_Ridley_FacingRight_Claws                          ;A6CA8F;
    dw Instruction_Common_Sleep                                          ;A6CA93;


;;; $CA95: Instruction list -  ;;;
InstList_RidleyTailTip_PointingDown:
    dw $0001,Spritemap_RidleyTailTip_PointingDown                        ;A6CA95;
    dw Instruction_Common_Sleep                                          ;A6CA99;


;;; $CA9B: Instruction list -  ;;;
InstList_RidleyTailTip_PointingDownDownRight:
    dw $0001,Spritemap_RidleyTailTip_PointingDownDownRight               ;A6CA9B;
    dw Instruction_Common_Sleep                                          ;A6CA9F;


;;; $CAA1: Instruction list -  ;;;
InstList_RidleyTailTip_PointingDownRight:
    dw $0001,Spritemap_RidleyTailTip_PointingDownRight                   ;A6CAA1;
    dw Instruction_Common_Sleep                                          ;A6CAA5;


;;; $CAA7: Instruction list -  ;;;
InstList_RidleyTailTip_PointingRightDownRight:
    dw $0001,Spritemap_RidleyTailTip_PointingRightDownRight              ;A6CAA7;
    dw Instruction_Common_Sleep                                          ;A6CAAB;


;;; $CAAD: Instruction list -  ;;;
InstList_RidleyTailTip_PointingRight:
    dw $0001,Spritemap_RidleyTailTip_PointingRight                       ;A6CAAD;
    dw Instruction_Common_Sleep                                          ;A6CAB1;


;;; $CAB3: Instruction list -  ;;;
InstList_RidleyTailTip_PointingRightUpRight:
    dw $0001,Spritemap_RidleyTailTip_PointingRightUpRight                ;A6CAB3;
    dw Instruction_Common_Sleep                                          ;A6CAB7;


;;; $CAB9: Instruction list -  ;;;
InstList_RidleyTailTip_PointingUpRight:
    dw $0001,Spritemap_RidleyTailTip_PointingUpRight                     ;A6CAB9;
    dw Instruction_Common_Sleep                                          ;A6CABD;


;;; $CABF: Instruction list -  ;;;
InstList_RidleyTailTip_PointingUpUpRight:
    dw $0001,Spritemap_RidleyTailTip_PointingUpUpRight                   ;A6CABF;
    dw Instruction_Common_Sleep                                          ;A6CAC3;


;;; $CAC5: Instruction list -  ;;;
InstList_RidleyTailTip_PointingUp:
    dw $0001,Spritemap_RidleyTailTip_PointingUp                          ;A6CAC5;
    dw Instruction_Common_Sleep                                          ;A6CAC9;


;;; $CACB: Instruction list -  ;;;
InstList_RidleyTailTip_PointingUpUpLeft:
    dw $0001,Spritemap_RidleyTailTip_PointingUpUpLeft                    ;A6CACB;
    dw Instruction_Common_Sleep                                          ;A6CACF;


;;; $CAD1: Instruction list -  ;;;
InstList_RidleyTailTip_PointingUpLeft:
    dw $0001,Spritemap_RidleyTailTip_PointingUpLeft                      ;A6CAD1;
    dw Instruction_Common_Sleep                                          ;A6CAD5;


;;; $CAD7: Instruction list -  ;;;
InstList_RidleyTailTip_PointingLeftUpLeft:
    dw $0001,Spritemap_RidleyTailTip_PointingLeftUpLeft                  ;A6CAD7;
    dw Instruction_Common_Sleep                                          ;A6CADB;


;;; $CADD: Instruction list -  ;;;
InstList_RidleyTailTip_PointingLeft:
    dw $0001,Spritemap_RidleyTailTip_PointingLeft                        ;A6CADD;
    dw Instruction_Common_Sleep                                          ;A6CAE1;


;;; $CAE3: Instruction list -  ;;;
InstList_RidleyTailTip_PointingLeftDownLeft:
    dw $0001,Spritemap_RidleyTailTip_PointingLeftDownLeft                ;A6CAE3;
    dw Instruction_Common_Sleep                                          ;A6CAE7;


;;; $CAE9: Instruction list -  ;;;
InstList_RidleyTailTip_PointingDownLeft:
    dw $0001,Spritemap_RidleyTailTip_PointingDownLeft                    ;A6CAE9;
    dw Instruction_Common_Sleep                                          ;A6CAED;


;;; $CAEF: Instruction list -  ;;;
InstList_RidleyTailTip_PointingDownDownLeft:
    dw $0001,Spritemap_RidleyTailTip_PointingDownDownLeft                ;A6CAEF;
    dw Instruction_Common_Sleep                                          ;A6CAF3;


;;; $CAF5:  ;;;
HandleRidleyTailAI:
; Run Tail AI: Sound, control AI, X/Y positions, tail extension, hurt Samus
    JSR.W PlaySwishingSFXIfTailIsMovingFast                              ;A6CAF5;
    LDA.L Ridley.tailAIIndex                                             ;A6CAF8;
    ASL                                                                  ;A6CAFC;
    TAX                                                                  ;A6CAFD;
    JSR.W (.pointers,X)                                                  ;A6CAFE;
    PHB                                                                  ;A6CB01;
    PEA.W $7E7E                                                          ;A6CB02;
    PLB                                                                  ;A6CB05;
    PLB                                                                  ;A6CB06;
    JSR.W UpdateRidleyTailPositions                                      ;A6CB07;
    JSR.W RidleyTailExtending                                            ;A6CB0A;
    PLB                                                                  ;A6CB0D;
    LDA.W Enemy.properties                                               ;A6CB0E;
    AND.W #$0400                                                         ;A6CB11;
    ORA.W SamusInvincibilityTimer                                        ;A6CB14;
    ORA.L Ridley.holdingSamusFlag                                        ;A6CB17;
    BNE .return                                                          ;A6CB1B;
    JMP.W RidleyTail_vs_Samus_Interaction                                ;A6CB1D;

  .return:
    RTS                                                                  ;A6CB20;

  .pointers:
; indexed by Ridley.tailAIIndex, tail AI index
    dw .return                                                           ;A6CB21;
    dw Function_RidleyTail_FlingingAtSamus                               ;A6CB23;
    dw Function_RidleyTail_StartTailbouncing                             ;A6CB25;
    dw Function_RidleyTail_StillStartingTailbouncing                     ;A6CB27;
    dw Function_RidleyTail_DuringTailbouncing                            ;A6CB29;
    dw Function_RidleyTail_StartExtendingDuringTailbouncing              ;A6CB2B;
    dw Function_RidleyTail_ContinueExtendingDuringTailbouncing           ;A6CB2D;
    dw Function_RidleyTail_StrictTailbouncingExtending                   ;A6CB2F;
    dw Function_RidleyTail_TailSpin                                      ;A6CB31;


;;; $CB33:  ;;;
Function_RidleyTail_StartTailbouncing:
    LDA.W #$0008                                                         ;A6CB33;
    STA.L Ridley.tailAngularSpeed                                        ;A6CB36;
    JSR.W Function_RidleyTail_2_3_6_7_Common                             ;A6CB3A;
    LDA.W #$0003                                                         ;A6CB3D;
    STA.L Ridley.tailAIIndex                                             ;A6CB40;
    RTS                                                                  ;A6CB44;


;;; $CB45:  ;;;
Function_RidleyTail_StillStartingTailbouncing:
    LDA.W #$0008                                                         ;A6CB45;
    STA.L Ridley.tailAngularSpeed                                        ;A6CB48;
    BRA Function_RidleyTail_2_3_6_7_Common                               ;A6CB4C;


;;; $CB4E:  ;;;
Function_RidleyTail_ContinueExtendingDuringTailbouncing:
    LDA.W #$0003                                                         ;A6CB4E;
    STA.L Ridley.tailAngularSpeed                                        ;A6CB51;
    JSR.W Function_RidleyTail_2_3_6_7_Common                             ;A6CB55;
    LDA.W #$0006                                                         ;A6CB58;
    STA.L Ridley.tailAIIndex                                             ;A6CB5B;
    RTS                                                                  ;A6CB5F;


;;; $CB60:  ;;;
Function_RidleyTail_StrictTailbouncingExtending:
    LDA.W #$0002                                                         ;A6CB60;
    STA.L Ridley.tailAngularSpeed                                        ;A6CB63;
    JSR.W Function_RidleyTail_2_3_6_7_Common                             ;A6CB67;
    LDA.W #$0007                                                         ;A6CB6A;
    STA.L Ridley.tailAIIndex                                             ;A6CB6D;
    RTS                                                                  ;A6CB71;


;;; $CB72:  ;;;
Function_RidleyTail_2_3_6_7_Common:
    LDA.L Ridley.facingDirection                                         ;A6CB72;
    BNE .notFacingLeft                                                   ;A6CB76;
    LDA.W #$4000                                                         ;A6CB78;
    STA.L Ridley.optionalCounterClockwiseTarget                          ;A6CB7B;
    LDA.W #$FFFF                                                         ;A6CB7F;
    STA.L Ridley.optionalClockwiseTarget                                 ;A6CB82;
    BRA +                                                                ;A6CB86;

  .notFacingLeft:
    LDA.W #$4000                                                         ;A6CB88;
    STA.L Ridley.optionalClockwiseTarget                                 ;A6CB8B;
    LDA.W #$FFFF                                                         ;A6CB8F;
    STA.L Ridley.optionalCounterClockwiseTarget                          ;A6CB92;

+   JSR.W Function_RidleyTail_DuringTailbouncing                         ;A6CB96;
    LDA.L Ridley.tail1MovingRotatingFlag                                 ;A6CB99;
    ORA.L Ridley.tail2MovingRotatingFlag                                 ;A6CB9D;
    ORA.L Ridley.tail3MovingRotatingFlag                                 ;A6CBA1;
    ORA.L Ridley.tail4MovingRotatingFlag                                 ;A6CBA5;
    ORA.L Ridley.tail5MovingRotatingFlag                                 ;A6CBA9;
    ORA.L Ridley.tail6MovingRotatingFlag                                 ;A6CBAD;
    ORA.L Ridley.tailTipMovingRotatingFlag                               ;A6CBB1;
    BEQ .duringTailbouncing                                              ;A6CBB5;
    RTS                                                                  ;A6CBB7;

  .duringTailbouncing:
    LDA.W #$0004                                                         ;A6CBB8;
    STA.L Ridley.tailAIIndex                                             ;A6CBBB;
    RTS                                                                  ;A6CBBF;


;;; $CBC0:  ;;;
Function_RidleyTail_FlingingAtSamus:
    LDA.W #RidleyTailAI_FlingTailAtSamus                                 ;A6CBC0;
    STA.B $12                                                            ;A6CBC3;
    BRA ExecuteRidleyTailAI                                              ;A6CBC5;


;;; $CBC7:  ;;;
Function_RidleyTail_DuringTailbouncing:
    LDA.W #Function_Ridley_Tailbouncing                                  ;A6CBC7;
    STA.B $12                                                            ;A6CBCA;
    BRA ExecuteRidleyTailAI                                              ;A6CBCC;


;;; $CBCE:  ;;;
Function_RidleyTail_StartExtendingDuringTailbouncing:
    LDA.W #ExtendTailForTailbouncing                                     ;A6CBCE;
    STA.B $12                                                            ;A6CBD1;
    BRA ExecuteRidleyTailAI                                              ;A6CBD3;


;;; $CBD5:  ;;;
Function_RidleyTail_TailSpin:
    LDA.W #SwingRidleyTailInCircles                                      ;A6CBD5;
    STA.B $12                                                            ;A6CBD8;
    BRA ExecuteRidleyTailAI                                              ;A6CBDA; >.<


;;; $CBDC:  ;;;
ExecuteRidleyTailAI:
    PHB                                                                  ;A6CBDC;
    PEA.W $7E7E                                                          ;A6CBDD;
    PLB                                                                  ;A6CBE0;
    PLB                                                                  ;A6CBE1;
    PEA.W .manualReturn-1                                                ;A6CBE2;
    JMP.W ($0012)                                                        ;A6CBE5;

  .manualReturn:
    LDA.W #$0007                                                         ;A6CBE8;
    LDX.W #$0000                                                         ;A6CBEB;

  .loop:
    PHA                                                                  ;A6CBEE;
    JSR.W SetRidleyTailAngles                                            ;A6CBEF;
    TXA                                                                  ;A6CBF2;
    CLC                                                                  ;A6CBF3;
    ADC.W #$0014                                                         ;A6CBF4;
    TAX                                                                  ;A6CBF7;
    PLA                                                                  ;A6CBF8;
    DEC                                                                  ;A6CBF9;
    BNE .loop                                                            ;A6CBFA;
    PLB                                                                  ;A6CBFC;
    RTS                                                                  ;A6CBFD;


;;; $CBFE:  ;;;
SetMinMaxTailAnglesBasedOnDirection:
; Set min and max tail angles based on direction
    LDA.W Ridley.facingDirection                                         ;A6CBFE;
    ASL                                                                  ;A6CC01;
    TAX                                                                  ;A6CC02;
    LDA.L .minAngle,X                                                    ;A6CC03;
    STA.W Ridley.tailMinimumAngle                                        ;A6CC07;
    LDA.L .maxAngle,X                                                    ;A6CC0A;
    STA.W Ridley.tailMaximumAngle                                        ;A6CC0E;
    RTS                                                                  ;A6CC11;

; indexed by facing direction
  .minAngle:
    dw $3FF0,$3FF0,$3FC0                                                 ;A6CC12;
  .maxAngle:
    dw $4040,$4040,$4010                                                 ;A6CC18;


;;; $CC1E:  ;;;
CheckIfAllTailPartsAreRotating:
; SEC if all tail parts are rotating, else CLC
    LDA.W Ridley.tail1MovingRotatingFlag                                 ;A6CC1E;
    AND.W Ridley.tail2MovingRotatingFlag                                 ;A6CC21;
    AND.W Ridley.tail3MovingRotatingFlag                                 ;A6CC24;
    AND.W Ridley.tail4MovingRotatingFlag                                 ;A6CC27;
    AND.W Ridley.tail5MovingRotatingFlag                                 ;A6CC2A;
    AND.W Ridley.tail6MovingRotatingFlag                                 ;A6CC2D;
    AND.W Ridley.tailTipMovingRotatingFlag                               ;A6CC30;
    BEQ .returnNotAllRotating                                            ;A6CC33;
    SEC                                                                  ;A6CC35;
    RTS                                                                  ;A6CC36;

  .returnNotAllRotating:
    CLC                                                                  ;A6CC37;
    RTS                                                                  ;A6CC38;


;;; $CC39:  ;;;
RidleyTailAI_FlingTailAtSamus:
; Fling tail at Samus
; Setup max angles (CBFE), then if tail is 'prepped' (all tail parts rotating, target angle not set yet, Ridley.tailFlingTrigger (trigger?) is set), target an angle
; Target angle is first projectile near tail tip, in a 8x8 tile square centered on tail tip, or Samus. Max rotational speed, 8
; If no tail parts are currently moving, start the first one moving
    JSR.W SetMinMaxTailAnglesBasedOnDirection                            ;A6CC39;
    JSR.W CheckIfAllTailPartsAreRotating                                 ;A6CC3C;
    BCC .notAllPartsRotating                                             ;A6CC3F;
    JSR.W HandleRidleyTailFlingTrigger                                   ;A6CC41;

  .notAllPartsRotating:
    LDA.W Ridley.tail1MovingRotatingFlag                                 ;A6CC44;
    ORA.W Ridley.tail2MovingRotatingFlag                                 ;A6CC47;
    ORA.W Ridley.tail3MovingRotatingFlag                                 ;A6CC4A;
    ORA.W Ridley.tail4MovingRotatingFlag                                 ;A6CC4D;
    ORA.W Ridley.tail5MovingRotatingFlag                                 ;A6CC50;
    ORA.W Ridley.tail6MovingRotatingFlag                                 ;A6CC53;
    ORA.W Ridley.tailTipMovingRotatingFlag                               ;A6CC56;
    BEQ .noPartsMoving                                                   ;A6CC59;
    RTS                                                                  ;A6CC5B;

  .noPartsMoving:
    LDA.W #$8000                                                         ;A6CC5C;
    STA.W Ridley.tail1MovingRotatingFlag                                 ;A6CC5F;
    LDA.W #$FFFF                                                         ;A6CC62;
    STA.W Ridley.optionalClockwiseTarget                                 ;A6CC65;
    STA.W Ridley.optionalCounterClockwiseTarget                          ;A6CC68;
    LDA.W #$0002                                                         ;A6CC6B;
    LDY.W SamusXPosition                                                 ;A6CC6E;
    CPY.W #$0070                                                         ;A6CC71;
    BCS .SamusNotLeftSide                                                ;A6CC74;
    LDA.W #$0001                                                         ;A6CC76;

  .SamusNotLeftSide:
    STA.W Ridley.tailAngularSpeed                                        ;A6CC79;
    RTS                                                                  ;A6CC7C;


;;; $CC7D:  ;;;
HandleRidleyTailFlingTrigger:
    LDA.W Ridley.tailFlingTrigger                                        ;A6CC7D;
    BEQ .notFlingingTail                                                 ;A6CC80;
    LDA.W Ridley.optionalCounterClockwiseTarget                          ;A6CC82;
    AND.W Ridley.optionalClockwiseTarget                                 ;A6CC85;
    BMI .notRotating                                                     ;A6CC88;

  .notFlingingTail:
    LDA.W Ridley.tailRotationSpeed                                       ;A6CC8A;
    BEQ .done                                                            ;A6CC8D;
    LDA.W RandomNumberSeed                                               ;A6CC8F;
    AND.W #$00FF                                                         ;A6CC92;
    CMP.W #$00F0                                                         ;A6CC95;
    BCS .notRotating                                                     ;A6CC98;
    LDA.W SamusXPosition                                                 ;A6CC9A;
    SEC                                                                  ;A6CC9D;
    SBC.W Enemy.XPosition                                                ;A6CC9E;
    BPL .rightOfRidley                                                   ;A6CCA1;
    EOR.W #$FFFF                                                         ;A6CCA3;
    INC                                                                  ;A6CCA6;

  .rightOfRidley:
    CMP.W #$0080                                                         ;A6CCA7;
    BCS .done                                                            ;A6CCAA;
    LDA.W #$0000                                                         ;A6CCAC;
    BRA +                                                                ;A6CCAF;

  .notRotating:
    LDA.W Ridley.tailFlingTrigger                                        ;A6CCB1;
    DEC                                                                  ;A6CCB4;

+   JSR.W TargetAnAngleTowardMissileOrSamus                              ;A6CCB5;
    PLA                                                                  ;A6CCB8;

  .done:
    STZ.W Ridley.tailFlingTrigger                                        ;A6CCB9;
    RTS                                                                  ;A6CCBC;


;;; $CCBD:  ;;;
SwingRidleyTailInCircles:
; Swing tail in circles
    JSR.W SetMinMaxTailAnglesBasedOnDirection                            ;A6CCBD;
    JSR.W CheckIfAllTailPartsAreRotating                                 ;A6CCC0;
    BCC .notAllPartsRotating                                             ;A6CCC3;
    JSR.W HandleTailFlingWhileSwingingInCircles                          ;A6CCC5;

  .notAllPartsRotating:
    LDA.L Ridley.tail1MovingRotatingFlag                                 ;A6CCC8;
    ORA.L Ridley.tail2MovingRotatingFlag                                 ;A6CCCC;
    ORA.L Ridley.tail3MovingRotatingFlag                                 ;A6CCD0;
    ORA.L Ridley.tail4MovingRotatingFlag                                 ;A6CCD4;
    ORA.L Ridley.tail5MovingRotatingFlag                                 ;A6CCD8;
    ORA.L Ridley.tail6MovingRotatingFlag                                 ;A6CCDC;
    ORA.L Ridley.tailTipMovingRotatingFlag                               ;A6CCE0;
    BEQ .noTailPartsMoving                                               ;A6CCE4;
    RTS                                                                  ;A6CCE6;

  .noTailPartsMoving:
    LDA.W #$8000                                                         ;A6CCE7;
    STA.L Ridley.tail1MovingRotatingFlag                                 ;A6CCEA;
    LDA.W #$FFFF                                                         ;A6CCEE;
    STA.L Ridley.optionalClockwiseTarget                                 ;A6CCF1;
    STA.L Ridley.optionalCounterClockwiseTarget                          ;A6CCF5;
    LDA.W #$0002                                                         ;A6CCF9;
    LDY.W SamusXPosition                                                 ;A6CCFC;
    CPY.W #$0070                                                         ;A6CCFF;
    BCS +                                                                ;A6CD02;
    LDA.W #$0001                                                         ;A6CD04;

+   STA.L Ridley.tailAngularSpeed                                        ;A6CD07;
    RTS                                                                  ;A6CD0B;


;;; $CD0C:  ;;;
HandleTailFlingWhileSwingingInCircles:
    LDA.W Ridley.tailFlingTrigger                                        ;A6CD0C;
    BEQ .return                                                          ;A6CD0F;
    LDA.W Ridley.optionalCounterClockwiseTarget                          ;A6CD11;
    AND.W Ridley.optionalClockwiseTarget                                 ;A6CD14;
    BPL .return                                                          ;A6CD17;
    LDA.W #$0001                                                         ;A6CD19;
    JSR.W TargetAnAngleTowardMissileOrSamus                              ;A6CD1C;
    PLA                                                                  ;A6CD1F;
    STZ.W Ridley.tailFlingTrigger                                        ;A6CD20;

  .return:
    RTS                                                                  ;A6CD23;


;;; $CD24:  ;;;
Function_Ridley_Tailbouncing:
; Tail bouncing
    JSR.W SetMinMaxTailAnglesBasedOnDirection                            ;A6CD24;
    JSR.W CheckIfAllTailPartsAreRotating                                 ;A6CD27;
    BCC .checkMoving                                                     ;A6CD2A;
    LDA.W RandomNumberSeed                                               ;A6CD2C;
    AND.W #$00FF                                                         ;A6CD2F;
    CMP.W #$00F0                                                         ;A6CD32;
    BCS .randomlySkipDistanceCheck                                       ;A6CD35;
    LDA.W SamusXPosition                                                 ;A6CD37;
    SEC                                                                  ;A6CD3A;
    SBC.L Enemy.XPosition                                                ;A6CD3B; >.< should be W
    BPL .SamusOnRight                                                    ;A6CD3F;
    EOR.W #$FFFF                                                         ;A6CD41;
    INC                                                                  ;A6CD44;

  .SamusOnRight:
    CMP.W #$0080                                                         ;A6CD45;
    BCS .checkMoving                                                     ;A6CD48;

  .randomlySkipDistanceCheck:
    LDA.W Ridley.optionalCounterClockwiseTarget                          ;A6CD4A;
    AND.W Ridley.optionalClockwiseTarget                                 ;A6CD4D;
    BPL .checkMoving                                                     ;A6CD50;
    LDA.W #$3F00                                                         ;A6CD52;
    STA.W Ridley.optionalClockwiseTarget                                 ;A6CD55;
    LDA.W #$0008                                                         ;A6CD58;
    STA.W Ridley.tailAngularSpeed                                        ;A6CD5B;
    RTS                                                                  ;A6CD5E;

  .checkMoving:
    LDA.W Ridley.tail1MovingRotatingFlag                                 ;A6CD5F;
    ORA.W Ridley.tail2MovingRotatingFlag                                 ;A6CD62;
    ORA.W Ridley.tail3MovingRotatingFlag                                 ;A6CD65;
    ORA.W Ridley.tail4MovingRotatingFlag                                 ;A6CD68;
    ORA.W Ridley.tail5MovingRotatingFlag                                 ;A6CD6B;
    ORA.W Ridley.tail6MovingRotatingFlag                                 ;A6CD6E;
    ORA.W Ridley.tailTipMovingRotatingFlag                               ;A6CD71;
    BEQ .tailPartsMoving                                                 ;A6CD74;
    RTS                                                                  ;A6CD76;

  .tailPartsMoving:
    BIT.W Ridley.YSpeed                                                  ;A6CD77;
    BMI .movingUp                                                        ;A6CD7A;
    LDA.W #$0005                                                         ;A6CD7C;
    STA.W Ridley.tailAIIndex                                             ;A6CD7F;

  .movingUp:
    LDA.W #$FFFF                                                         ;A6CD82;
    STA.W Ridley.optionalClockwiseTarget                                 ;A6CD85;
    STA.W Ridley.optionalCounterClockwiseTarget                          ;A6CD88;
    LDA.W Ridley.tailMovementTimer                                       ;A6CD8B;
    BNE .decrementTimer                                                  ;A6CD8E;

  .done:
    STA.W Ridley.tailAngularSpeed                                        ;A6CD90;
    RTS                                                                  ;A6CD93;

  .decrementTimer:
    DEC                                                                  ;A6CD94;
    STA.W Ridley.tailMovementTimer                                       ;A6CD95;
    BNE .done                                                            ;A6CD98;
    LDA.W #$8000                                                         ;A6CD9A;
    STA.W Ridley.tail1MovingRotatingFlag                                 ;A6CD9D;
    JSR.W SetRidleyTailAnglesTo40XX                                      ;A6CDA0;
    LDA.W #$0008                                                         ;A6CDA3;
    STA.W Ridley.tailAngularSpeed                                        ;A6CDA6;
    RTS                                                                  ;A6CDA9;


;;; $CDAA:  ;;;
ExtendTailForTailbouncing:
; Extend tail. Happens only while tail bouncing, moving downwards, and no tail parts currently rotating
    JSR.W SetMinMaxTailAnglesBasedOnDirection                            ;A6CDAA;
    JSR.W CheckIfAllTailPartsAreRotating                                 ;A6CDAD;
    BCC .checkTailPartsMoving                                            ;A6CDB0;
    LDA.W RandomNumberSeed                                               ;A6CDB2;
    AND.W #$00FF                                                         ;A6CDB5;
    CMP.W #$00F0                                                         ;A6CDB8;
    BCS .randomlySkipDistanceCheck                                       ;A6CDBB;
    LDA.W SamusXPosition                                                 ;A6CDBD;
    SEC                                                                  ;A6CDC0;
    SBC.L Enemy.XPosition                                                ;A6CDC1; >.< should be W
    BPL .SamusOnRight                                                    ;A6CDC5;
    EOR.W #$FFFF                                                         ;A6CDC7;
    INC                                                                  ;A6CDCA;

  .SamusOnRight:
    CMP.W #$0080                                                         ;A6CDCB;
    BCS .checkTailPartsMoving                                            ;A6CDCE;

  .randomlySkipDistanceCheck:
    LDA.W Ridley.optionalCounterClockwiseTarget                          ;A6CDD0;
    AND.W Ridley.optionalClockwiseTarget                                 ;A6CDD3;
    BPL .checkTailPartsMoving                                            ;A6CDD6;
    LDA.W #$3F00                                                         ;A6CDD8;
    STA.W Ridley.optionalClockwiseTarget                                 ;A6CDDB;
    LDA.W #$0008                                                         ;A6CDDE;
    STA.W Ridley.tailAngularSpeed                                        ;A6CDE1;
    RTS                                                                  ;A6CDE4;

  .checkTailPartsMoving:
    LDA.W Ridley.tail1MovingRotatingFlag                                 ;A6CDE5;
    ORA.W Ridley.tail2MovingRotatingFlag                                 ;A6CDE8;
    ORA.W Ridley.tail3MovingRotatingFlag                                 ;A6CDEB;
    ORA.W Ridley.tail4MovingRotatingFlag                                 ;A6CDEE;
    ORA.W Ridley.tail5MovingRotatingFlag                                 ;A6CDF1;
    ORA.W Ridley.tail6MovingRotatingFlag                                 ;A6CDF4;
    ORA.W Ridley.tailTipMovingRotatingFlag                               ;A6CDF7;
    BEQ .tailPartMoving                                                  ;A6CDFA;
    RTS                                                                  ;A6CDFC;

  .tailPartMoving:
    BIT.W Ridley.YSpeed                                                  ;A6CDFD;
    BMI .RidleyMovingUp                                                  ;A6CE00;
    LDA.W #$0006                                                         ;A6CE02;
    STA.W Ridley.tailAIIndex                                             ;A6CE05;
    LDA.W #$0A00                                                         ;A6CE08;
    STA.W Ridley.tail1TargetDistanceToRidley                             ;A6CE0B;
    STA.W Ridley.tail2TargetDistanceToRidley                             ;A6CE0E;
    STA.W Ridley.tail3TargetDistanceToRidley                             ;A6CE11;
    STA.W Ridley.tail4TargetDistanceToRidley                             ;A6CE14;
    STA.W Ridley.tail5TargetDistanceToRidley                             ;A6CE17;
    STA.W Ridley.tail6TargetDistanceToRidley                             ;A6CE1A;
    STA.W Ridley.tailTipTargetDistanceToRidley                           ;A6CE1D;
    LDA.W #$4000                                                         ;A6CE20;
    STA.W Ridley.tail1Angle                                              ;A6CE23;
    STA.W Ridley.tail2Angle                                              ;A6CE26;
    STA.W Ridley.tail3Angle                                              ;A6CE29;
    STA.W Ridley.tail4Angle                                              ;A6CE2C;
    STA.W Ridley.tail5Angle                                              ;A6CE2F;
    STA.W Ridley.tail6Angle                                              ;A6CE32;
    STA.W Ridley.tailTipAngle                                            ;A6CE35;
    LDA.W #$8000                                                         ;A6CE38;
    STA.W Ridley.tail1MovingRotatingFlag                                 ;A6CE3B;

  .RidleyMovingUp:
    LDA.W #$FFFF                                                         ;A6CE3E;
    STA.W Ridley.optionalClockwiseTarget                                 ;A6CE41;
    STA.W Ridley.optionalCounterClockwiseTarget                          ;A6CE44;
    LDA.W Ridley.tailMovementTimer                                       ;A6CE47;
    BNE .decrementTimer                                                  ;A6CE4A;
    JMP.W .done                                                          ;A6CE4C;

  .decrementTimer:
    DEC                                                                  ;A6CE4F;
    STA.W Ridley.tailMovementTimer                                       ;A6CE50;
    BNE .done                                                            ;A6CE53;
    LDA.W #$8000                                                         ;A6CE55;
    STA.W Ridley.tail1MovingRotatingFlag                                 ;A6CE58;
    JSR.W SetRidleyTailAnglesTo40XX                                      ;A6CE5B;
    LDA.W #$0008                                                         ;A6CE5E;

  .done:
    STA.W Ridley.tailAngularSpeed                                        ;A6CE61;
    RTS                                                                  ;A6CE64;


;;; $CE65:  ;;;
SetRidleyTailAnglesTo40XX:
; Set angles to 40XX, XX is previous angle (fifth part is actually first part's 40XX)
    LDA.W Ridley.tail1Angle                                              ;A6CE65;
    AND.W #$00FF                                                         ;A6CE68;
    ORA.W #$4000                                                         ;A6CE6B;
    STA.W Ridley.tail1Angle                                              ;A6CE6E;
    LDA.W Ridley.tail2Angle                                              ;A6CE71;
    AND.W #$00FF                                                         ;A6CE74;
    ORA.W #$4000                                                         ;A6CE77;
    STA.W Ridley.tail2Angle                                              ;A6CE7A;
    LDA.W Ridley.tail3Angle                                              ;A6CE7D;
    AND.W #$00FF                                                         ;A6CE80;
    ORA.W #$4000                                                         ;A6CE83;
    STA.W Ridley.tail3Angle                                              ;A6CE86;
    LDA.W Ridley.tail4Angle                                              ;A6CE89;
    AND.W #$00FF                                                         ;A6CE8C;
    ORA.W #$4000                                                         ;A6CE8F;
    STA.W Ridley.tail4Angle                                              ;A6CE92;
    LDA.W Ridley.tail1Angle                                              ;A6CE95;
    AND.W #$04FF                                                         ;A6CE98;
    ORA.W #$4000                                                         ;A6CE9B;
    STA.W Ridley.tail5Angle                                              ;A6CE9E;
    LDA.W Ridley.tail6Angle                                              ;A6CEA1;
    AND.W #$00FF                                                         ;A6CEA4;
    ORA.W #$4000                                                         ;A6CEA7;
    STA.W Ridley.tail6Angle                                              ;A6CEAA;
    LDA.W Ridley.tailTipAngle                                            ;A6CEAD;
    AND.W #$00FF                                                         ;A6CEB0;
    ORA.W #$4000                                                         ;A6CEB3;
    STA.W Ridley.tailTipAngle                                            ;A6CEB6;
    RTS                                                                  ;A6CEB9;


;;; $CEBA:  ;;;
UpdateRidleyTailPositions:
; Update tail positions
    LDA.W Enemy.YPosition                                                ;A6CEBA;
    CLC                                                                  ;A6CEBD;
    ADC.W Ridley.tail1YDistanceFromRidley                                ;A6CEBE;
    CLC                                                                  ;A6CEC1;
    ADC.W #$0010                                                         ;A6CEC2;
    STA.W Ridley.tail1YPosition                                          ;A6CEC5;
    CLC                                                                  ;A6CEC8;
    ADC.W Ridley.tail2YDistanceFromTail1                                 ;A6CEC9;
    STA.W Ridley.tail2YPosition                                          ;A6CECC;
    CLC                                                                  ;A6CECF;
    ADC.W Ridley.tail3YDistanceFromTail2                                 ;A6CED0;
    STA.W Ridley.tail3YPosition                                          ;A6CED3;
    CLC                                                                  ;A6CED6;
    ADC.W Ridley.tail4YDistanceFromTail3                                 ;A6CED7;
    STA.W Ridley.tail4YPosition                                          ;A6CEDA;
    CLC                                                                  ;A6CEDD;
    ADC.W Ridley.tail5YDistanceFromTail4                                 ;A6CEDE;
    STA.W Ridley.tail5YPosition                                          ;A6CEE1;
    CLC                                                                  ;A6CEE4;
    ADC.W Ridley.tail6YDistanceFromTail5                                 ;A6CEE5;
    STA.W Ridley.tail6YPosition                                          ;A6CEE8;
    CLC                                                                  ;A6CEEB;
    ADC.W Ridley.tailTipYDistanceFromTail6                               ;A6CEEC;
    STA.W Ridley.tailTipYPosition                                        ;A6CEEF;
    LDA.W Ridley.facingDirection                                         ;A6CEF2;
    DEC                                                                  ;A6CEF5;
    BEQ .facingForward                                                   ;A6CEF6;
    INC                                                                  ;A6CEF8;
    ASL                                                                  ;A6CEF9;
    TAX                                                                  ;A6CEFA;
    LDA.L .XPositionOffsets,X                                            ;A6CEFB;
    ADC.W Ridley.tail1XDistanceFromRidley                                ;A6CEFF;

  .facingForward:
    CLC                                                                  ;A6CF02;
    ADC.W Enemy.XPosition                                                ;A6CF03;
    STA.W Ridley.tail1XPosition                                          ;A6CF06;
    LDA.W Ridley.facingDirection                                         ;A6CF09;
    DEC                                                                  ;A6CF0C;
    BNE .notFacingForward                                                ;A6CF0D;
    LDA.W Enemy.XPosition                                                ;A6CF0F;
    STA.W Ridley.tail2XPosition                                          ;A6CF12;
    STA.W Ridley.tail3XPosition                                          ;A6CF15;
    STA.W Ridley.tail4XPosition                                          ;A6CF18;
    STA.W Ridley.tail5XPosition                                          ;A6CF1B;
    STA.W Ridley.tail6XPosition                                          ;A6CF1E;
    STA.W Ridley.tailTipXPosition                                        ;A6CF21;
    BRA .return                                                          ;A6CF24;

  .notFacingForward:
    LDA.W Ridley.tail1XPosition                                          ;A6CF26;
    CLC                                                                  ;A6CF29;
    ADC.W Ridley.tail2XDistanceFromTail1                                 ;A6CF2A;
    STA.W Ridley.tail2XPosition                                          ;A6CF2D;
    CLC                                                                  ;A6CF30;
    ADC.W Ridley.tail3XDistanceFromTail2                                 ;A6CF31;
    STA.W Ridley.tail3XPosition                                          ;A6CF34;
    CLC                                                                  ;A6CF37;
    ADC.W Ridley.tail4XDistanceFromTail3                                 ;A6CF38;
    STA.W Ridley.tail4XPosition                                          ;A6CF3B;
    CLC                                                                  ;A6CF3E;
    ADC.W Ridley.tail5XDistanceFromTail4                                 ;A6CF3F;
    STA.W Ridley.tail5XPosition                                          ;A6CF42;
    CLC                                                                  ;A6CF45;
    ADC.W Ridley.tail6XDistanceFromTail5                                 ;A6CF46;
    STA.W Ridley.tail6XPosition                                          ;A6CF49;
    CLC                                                                  ;A6CF4C;
    ADC.W Ridley.tailTipXDistanceFromTail6                               ;A6CF4D;
    STA.W Ridley.tailTipXPosition                                        ;A6CF50;

  .return:
    RTS                                                                  ;A6CF53;

  .XPositionOffsets:
    dw $0020,$0000,$FFE0                                                 ;A6CF54;


;;; $CF5A:  ;;;
RidleyTailExtending:
; Tail extending
    LDA.W Ridley.tail2TargetDistanceToRidley                             ;A6CF5A;
    BEQ .reachedTargetDistanceFromPreviousTailPart                       ;A6CF5D;
    CMP.W Ridley.tail2DistanceToRidley                                   ;A6CF5F;
    BPL +                                                                ;A6CF62;
    LDA.W #$0000                                                         ;A6CF64;
    STA.W Ridley.tail2TargetDistanceToRidley                             ;A6CF67;

+   LDA.W Ridley.tail2DistanceToRidley                                   ;A6CF6A;
    CLC                                                                  ;A6CF6D;
    ADC.W Ridley.tailExtensionSpeed                                      ;A6CF6E;
    CMP.W #$1800                                                         ;A6CF71;
    BMI +                                                                ;A6CF74;
    LDA.W #$1800                                                         ;A6CF76;

+   STA.W Ridley.tail2DistanceToRidley                                   ;A6CF79;
    BRA +                                                                ;A6CF7C;

  .reachedTargetDistanceFromPreviousTailPart:
    LDA.W #$0800                                                         ;A6CF7E;
    CMP.W Ridley.tail2DistanceToRidley                                   ;A6CF81;
    BPL +                                                                ;A6CF84;
    LDA.W Ridley.tail2DistanceToRidley                                   ;A6CF86;
    SEC                                                                  ;A6CF89;
    SBC.W #$0080                                                         ;A6CF8A;
    STA.W Ridley.tail2DistanceToRidley                                   ;A6CF8D;

+   LDA.W Ridley.tail3TargetDistanceToRidley                             ;A6CF90;
    BEQ .reachedTargetDistanceFromPreviousTailPart2                      ;A6CF93;
    CMP.W Ridley.tail3DistanceToRidley                                   ;A6CF95;
    BPL +                                                                ;A6CF98;
    LDA.W #$0000                                                         ;A6CF9A;
    STA.W Ridley.tail3TargetDistanceToRidley                             ;A6CF9D;

+   LDA.W Ridley.tail3DistanceToRidley                                   ;A6CFA0;
    CLC                                                                  ;A6CFA3;
    ADC.W Ridley.tailExtensionSpeed                                      ;A6CFA4;
    CMP.W #$1800                                                         ;A6CFA7;
    BMI +                                                                ;A6CFAA;
    LDA.W #$1800                                                         ;A6CFAC;

+   STA.W Ridley.tail3DistanceToRidley                                   ;A6CFAF;
    BRA +                                                                ;A6CFB2;

  .reachedTargetDistanceFromPreviousTailPart2:
    LDA.W #$0800                                                         ;A6CFB4;
    CMP.W Ridley.tail3DistanceToRidley                                   ;A6CFB7;
    BPL +                                                                ;A6CFBA;
    LDA.W Ridley.tail3DistanceToRidley                                   ;A6CFBC;
    SEC                                                                  ;A6CFBF;
    SBC.W #$0080                                                         ;A6CFC0;
    STA.W Ridley.tail3DistanceToRidley                                   ;A6CFC3;

+   LDA.W Ridley.tail4TargetDistanceToRidley                             ;A6CFC6;
    BEQ .reachedTargetDistanceFromPreviousTailPart3                      ;A6CFC9;
    CMP.W Ridley.tail4DistanceToRidley                                   ;A6CFCB;
    BPL +                                                                ;A6CFCE;
    LDA.W #$0000                                                         ;A6CFD0;
    STA.W Ridley.tail4TargetDistanceToRidley                             ;A6CFD3;

+   LDA.W Ridley.tail4DistanceToRidley                                   ;A6CFD6;
    CLC                                                                  ;A6CFD9;
    ADC.W Ridley.tailExtensionSpeed                                      ;A6CFDA;
    CMP.W #$1600                                                         ;A6CFDD;
    BMI +                                                                ;A6CFE0;
    LDA.W #$1600                                                         ;A6CFE2;

+   STA.W Ridley.tail4DistanceToRidley                                   ;A6CFE5;
    BRA +                                                                ;A6CFE8;

  .reachedTargetDistanceFromPreviousTailPart3:
    LDA.W #$0800                                                         ;A6CFEA;
    CMP.W Ridley.tail4DistanceToRidley                                   ;A6CFED;
    BPL +                                                                ;A6CFF0;
    LDA.W Ridley.tail4DistanceToRidley                                   ;A6CFF2;
    SEC                                                                  ;A6CFF5;
    SBC.W #$0080                                                         ;A6CFF6;
    STA.W Ridley.tail4DistanceToRidley                                   ;A6CFF9;

+   LDA.W Ridley.tail5TargetDistanceToRidley                             ;A6CFFC;
    BEQ .reachedTargetDistanceFromPreviousTailPart4                      ;A6CFFF;
    CMP.W Ridley.tail5DistanceToRidley                                   ;A6D001;
    BPL +                                                                ;A6D004;
    LDA.W #$0000                                                         ;A6D006;
    STA.W Ridley.tail5TargetDistanceToRidley                             ;A6D009;

+   LDA.W Ridley.tail5DistanceToRidley                                   ;A6D00C;
    CLC                                                                  ;A6D00F;
    ADC.W Ridley.tailExtensionSpeed                                      ;A6D010;
    CMP.W #$1600                                                         ;A6D013;
    BMI +                                                                ;A6D016;
    LDA.W #$1600                                                         ;A6D018;

+   STA.W Ridley.tail5DistanceToRidley                                   ;A6D01B;
    BRA +                                                                ;A6D01E;

  .reachedTargetDistanceFromPreviousTailPart4:
    LDA.W #$0800                                                         ;A6D020;
    CMP.W Ridley.tail5DistanceToRidley                                   ;A6D023;
    BPL +                                                                ;A6D026;
    LDA.W Ridley.tail5DistanceToRidley                                   ;A6D028;
    SEC                                                                  ;A6D02B;
    SBC.W #$0080                                                         ;A6D02C;
    STA.W Ridley.tail5DistanceToRidley                                   ;A6D02F;

+   LDA.W Ridley.tail6TargetDistanceToRidley                             ;A6D032;
    BEQ .reachedTargetDistanceFromPreviousTailPart5                      ;A6D035;
    CMP.W Ridley.tail6DistanceToRidley                                   ;A6D037;
    BPL +                                                                ;A6D03A;
    LDA.W #$0000                                                         ;A6D03C;
    STA.W Ridley.tail6TargetDistanceToRidley                             ;A6D03F;

+   LDA.W Ridley.tail6DistanceToRidley                                   ;A6D042;
    CLC                                                                  ;A6D045;
    ADC.W Ridley.tailExtensionSpeed                                      ;A6D046;
    CMP.W #$1200                                                         ;A6D049;
    BMI +                                                                ;A6D04C;
    LDA.W #$1200                                                         ;A6D04E;

+   STA.W Ridley.tail6DistanceToRidley                                   ;A6D051;
    BRA +                                                                ;A6D054;

  .reachedTargetDistanceFromPreviousTailPart5:
    LDA.W #$0800                                                         ;A6D056;
    CMP.W Ridley.tail6DistanceToRidley                                   ;A6D059;
    BPL +                                                                ;A6D05C;
    LDA.W Ridley.tail6DistanceToRidley                                   ;A6D05E;
    SEC                                                                  ;A6D061;
    SBC.W #$0080                                                         ;A6D062;
    STA.W Ridley.tail6DistanceToRidley                                   ;A6D065;

+   LDA.W Ridley.tailTipTargetDistanceToRidley                           ;A6D068;
    BEQ .reachedTargetDistanceFromPreviousTailPart6                      ;A6D06B;
    CMP.W Ridley.tailTipDistanceToRidley                                 ;A6D06D;
    BPL +                                                                ;A6D070;
    LDA.W #$0000                                                         ;A6D072;
    STA.W Ridley.tailTipTargetDistanceToRidley                           ;A6D075;

+   LDA.W Ridley.tailTipDistanceToRidley                                 ;A6D078;
    CLC                                                                  ;A6D07B;
    ADC.W Ridley.tailExtensionSpeed                                      ;A6D07C;
    CMP.W #$0500                                                         ;A6D07F;
    BMI +                                                                ;A6D082;
    LDA.W #$0500                                                         ;A6D084;

+   STA.W Ridley.tailTipDistanceToRidley                                 ;A6D087;
    BRA .return                                                          ;A6D08A;

  .reachedTargetDistanceFromPreviousTailPart6:
    LDA.W #$0500                                                         ;A6D08C;
    CMP.W Ridley.tailTipDistanceToRidley                                 ;A6D08F;
    BPL .return                                                          ;A6D092;
    LDA.W Ridley.tailTipDistanceToRidley                                 ;A6D094;
    SEC                                                                  ;A6D097;
    SBC.W #$0080                                                         ;A6D098;
    STA.W Ridley.tailTipDistanceToRidley                                 ;A6D09B;

  .return:
    RTS                                                                  ;A6D09E;


;;; $D09F:  ;;;
SetRidleyTailAngles:
    LDA.W Ridley.tail1MovingRotatingFlag,X                               ;A6D09F;
    BMI .tailPartMoving                                                  ;A6D0A2;
    LDA.W Ridley.tail1Angle,X                                            ;A6D0A4;
    JMP.W .notMoving                                                     ;A6D0A7;

  .stopTailPartMovement:
    STZ.W Ridley.tail1MovingRotatingFlag,X                               ;A6D0AA;
    STZ.W Ridley.tail1RotationDelayTimer,X                               ;A6D0AD;
    LDA.W Ridley.tail1RotationDirection,X                                ;A6D0B0;
    EOR.W #$8000                                                         ;A6D0B3;
    STA.W Ridley.tail1RotationDirection,X                                ;A6D0B6;
    RTS                                                                  ;A6D0B9;

-   LDA.W Ridley.tail1RotationDelayTimer,X                               ;A6D0BA;
    CLC                                                                  ;A6D0BD;
    ADC.W Ridley.tailAngularSpeed                                        ;A6D0BE;
    STA.W Ridley.tail1RotationDelayTimer,X                               ;A6D0C1;
    RTS                                                                  ;A6D0C4;

  .tailPartMoving:
    LDA.W Ridley.tail1RotationDelayTimer,X                               ;A6D0C5;
    CMP.W Ridley.movementThreshold                                       ;A6D0C8;
    BCC -                                                                ;A6D0CB;
    CMP.W #$FFFF                                                         ;A6D0CD;
    BEQ +                                                                ;A6D0D0;
    LDA.W #$FFFF                                                         ;A6D0D2;
    STA.W Ridley.tail1RotationDelayTimer,X                               ;A6D0D5;
    LDA.W #$8000                                                         ;A6D0D8;
    STA.W Ridley.tail2MovingRotatingFlag,X                               ;A6D0DB;
    LDA.W Ridley.tail1RotationDirection,X                                ;A6D0DE;
    STA.W Ridley.tail2RotationDirection,X                                ;A6D0E1;

+   LDA.W Ridley.tail1RotationDirection,X                                ;A6D0E4;
    BMI .clockwiseRotation                                               ;A6D0E7;
    LDA.W Ridley.optionalCounterClockwiseTarget                          ;A6D0E9;
    BMI .noCounterClockwiseTarget                                        ;A6D0EC;
    LDA.W #$0C00                                                         ;A6D0EE;
    STA.W Ridley.tail1TargetDistanceToRidley,X                           ;A6D0F1;
    LDA.W Ridley.tail1Angle,X                                            ;A6D0F4;
    CLC                                                                  ;A6D0F7;
    ADC.W Ridley.tailAngularSpeed                                        ;A6D0F8;
    CMP.W Ridley.optionalCounterClockwiseTarget                          ;A6D0FB;
    BMI .storeAngle                                                      ;A6D0FE;
    TXA                                                                  ;A6D100;
    BEQ +                                                                ;A6D101;
    LDA.W Ridley.unknown200C,X                                           ;A6D103;
    BNE .tailPartMoving2                                                 ;A6D106;

+   LDA.W Ridley.optionalCounterClockwiseTarget                          ;A6D108;
    STA.W Ridley.tail1Angle,X                                            ;A6D10B;
    JMP.W .stopTailPartMovement                                          ;A6D10E;

  .noCounterClockwiseTarget:
    LDA.W Ridley.tail1Angle,X                                            ;A6D111;
    CLC                                                                  ;A6D114;
    ADC.W Ridley.tailAngularSpeed                                        ;A6D115;
    CMP.W Ridley.tailMaximumAngle                                        ;A6D118;
    BMI .storeAngle                                                      ;A6D11B;

  .tailPartMoving2:
    LDA.W #$8000                                                         ;A6D11D;
    STA.W Ridley.tail1RotationDirection,X                                ;A6D120;
    LDA.W Ridley.tailMaximumAngle                                        ;A6D123;
    BRA .storeAngle                                                      ;A6D126;

  .clockwiseRotation:
    LDA.W Ridley.optionalClockwiseTarget                                 ;A6D128;
    BMI .noClockwiseTarget                                               ;A6D12B;
    LDA.W #$0C00                                                         ;A6D12D;
    STA.W Ridley.tail1TargetDistanceToRidley,X                           ;A6D130;
    LDA.W Ridley.tail1Angle,X                                            ;A6D133;
    SEC                                                                  ;A6D136;
    SBC.W Ridley.tailAngularSpeed                                        ;A6D137;
    DEC                                                                  ;A6D13A;
    CMP.W Ridley.optionalClockwiseTarget                                 ;A6D13B;
    BPL .incrementAngle                                                  ;A6D13E;
    TXA                                                                  ;A6D140;
    BEQ +                                                                ;A6D141;
    LDA.W Ridley.unknown200C,X                                           ;A6D143;
    BNE .tailPartMoving3                                                 ;A6D146;

+   LDA.W Ridley.optionalClockwiseTarget                                 ;A6D148;
    STA.W Ridley.tail1Angle,X                                            ;A6D14B;
    JMP.W .stopTailPartMovement                                          ;A6D14E;

  .noClockwiseTarget:
    LDA.W Ridley.tail1Angle,X                                            ;A6D151;
    SEC                                                                  ;A6D154;
    SBC.W Ridley.tailAngularSpeed                                        ;A6D155;
    DEC                                                                  ;A6D158;
    CMP.W Ridley.tailMinimumAngle                                        ;A6D159;
    BPL .incrementAngle                                                  ;A6D15C;

  .tailPartMoving3:
    LDA.W #$0000                                                         ;A6D15E;
    STA.W Ridley.tail1RotationDirection,X                                ;A6D161;
    LDA.W Ridley.tailMinimumAngle                                        ;A6D164;
    BRA .storeAngle                                                      ;A6D167;

  .incrementAngle:
    INC                                                                  ;A6D169;

  .storeAngle:
    STA.W Ridley.tail1Angle,X                                            ;A6D16A;

  .notMoving:
    AND.W #$00FF                                                         ;A6D16D;
    STA.B $12                                                            ;A6D170;
    TXA                                                                  ;A6D172;
    BEQ .firstTailPart                                                   ;A6D173;
    LDA.B $12                                                            ;A6D175;
    CLC                                                                  ;A6D177;
    ADC.W Ridley.tailMinimumAngle,X                                      ;A6D178;
    AND.W #$00FF                                                         ;A6D17B;
    STA.B $12                                                            ;A6D17E;

  .firstTailPart:
    LDA.W Ridley.tail1DistanceToRidley,X                                 ;A6D180;
    XBA                                                                  ;A6D183;
    AND.W #$00FF                                                         ;A6D184;
    JSL.L GetSineMathInA_A9C460                                          ;A6D187;
    STA.W Ridley.tail1XDistanceFromRidley,X                              ;A6D18B;
    LDA.W Ridley.tail1DistanceToRidley,X                                 ;A6D18E;
    XBA                                                                  ;A6D191;
    AND.W #$00FF                                                         ;A6D192;
    JSL.L GetCosineMathInA_A9C465                                        ;A6D195;
    STA.W Ridley.tail1YDistanceFromRidley,X                              ;A6D199;
    RTS                                                                  ;A6D19C;


;;; $D19D:  ;;;
TargetAnAngleTowardMissileOrSamus:
; Target an angle (towards a missile or Samus) for tail.
; Note: Actual angle is actually twice the angle chosen, since each tail segment doubles it
; Also, tail circles 2*A amount of times first
    AND.W #$00FF                                                         ;A6D19D;
    XBA                                                                  ;A6D1A0;
    STA.W Ridley.tailHalfRevolutions                                     ;A6D1A1;
    LDA.W Ridley.facingDirection                                         ;A6D1A4;
    DEC                                                                  ;A6D1A7;
    BEQ .returnUpper                                                     ;A6D1A8;
    LDA.W Ridley.status                                                  ;A6D1AA;
    BEQ .returnUpper                                                     ;A6D1AD;
    JSR.W TargetAMissileOrSuperMissileIfAvailable                        ;A6D1AF;
    BCC .noProjectiles                                                   ;A6D1B2;
    LDA.B $12                                                            ;A6D1B4;
    SBC.W Ridley.tail1XPosition                                          ;A6D1B6;
    STA.B $12                                                            ;A6D1B9;
    LDA.B $14                                                            ;A6D1BB;
    SEC                                                                  ;A6D1BD;
    SBC.W Ridley.tail1YPosition                                          ;A6D1BE;
    STA.B $14                                                            ;A6D1C1;
    BRA +                                                                ;A6D1C3;

  .returnUpper:
    RTS                                                                  ;A6D1C5;

  .noProjectiles:
    LDA.W SamusXPosition                                                 ;A6D1C6;
    SEC                                                                  ;A6D1C9;
    SBC.W Ridley.tail1XPosition                                          ;A6D1CA;
    STA.B $12                                                            ;A6D1CD;
    LDA.W SamusYPosition                                                 ;A6D1CF;
    CLC                                                                  ;A6D1D2;
    ADC.W #$0018                                                         ;A6D1D3;
    SEC                                                                  ;A6D1D6;
    SBC.W Ridley.tail1YPosition                                          ;A6D1D7;
    STA.B $14                                                            ;A6D1DA;

+   PHB                                                                  ;A6D1DC;
    PHK                                                                  ;A6D1DD;
    PLB                                                                  ;A6D1DE;
    JSL.L CalculateAngleOf_12_14_Offset                                  ;A6D1DF;
    PLB                                                                  ;A6D1E3;
    SEC                                                                  ;A6D1E4;
    SBC.W #$0080                                                         ;A6D1E5;
    EOR.W #$FFFF                                                         ;A6D1E8;
    INC                                                                  ;A6D1EB;
    AND.W #$00FF                                                         ;A6D1EC;
    STA.B $12                                                            ;A6D1EF;
    LDA.W Ridley.facingDirection                                         ;A6D1F1;
    BNE .facingRight                                                     ;A6D1F4;
    LDA.B $12                                                            ;A6D1F6;
    CMP.W #$0018                                                         ;A6D1F8;
    BCC +                                                                ;A6D1FB;
    CMP.W #$00E8                                                         ;A6D1FD;
    BCS +                                                                ;A6D200;
    LDA.W #$00E8                                                         ;A6D202;

+   CLC                                                                  ;A6D205;
    ADC.W #$3F00                                                         ;A6D206;
    SEC                                                                  ;A6D209;
    SBC.W Ridley.tailHalfRevolutions                                     ;A6D20A;
    CMP.W Ridley.tail1Angle                                              ;A6D20D;
    BCS .returnMiddle                                                    ;A6D210;
    STA.W Ridley.optionalClockwiseTarget                                 ;A6D212;
    LDA.W #$0008                                                         ;A6D215;
    STA.W Ridley.tailAngularSpeed                                        ;A6D218;

  .returnMiddle:
    RTS                                                                  ;A6D21B;

  .facingRight:
    LDA.B $12                                                            ;A6D21C;
    CMP.W #$0018                                                         ;A6D21E;
    BCC +                                                                ;A6D221;
    CMP.W #$00E8                                                         ;A6D223;
    BCS +                                                                ;A6D226;
    LDA.W #$0018                                                         ;A6D228;

+   CLC                                                                  ;A6D22B;
    ADC.W #$4000                                                         ;A6D22C;
    CLC                                                                  ;A6D22F;
    ADC.W Ridley.tailHalfRevolutions                                     ;A6D230;
    CMP.W Ridley.tail1Angle                                              ;A6D233;
    BCC .returnLower                                                     ;A6D236;
    STA.W Ridley.optionalCounterClockwiseTarget                          ;A6D238;
    LDA.W #$0008                                                         ;A6D23B;
    STA.W Ridley.tailAngularSpeed                                        ;A6D23E;

  .returnLower:
    RTS                                                                  ;A6D241;


;;; $D242:  ;;;
TargetAMissileOrSuperMissileIfAvailable:
; Target a missile/super missile if available
    LDA.W Ridley.tailTipXPosition                                        ;A6D242;
    STA.B $12                                                            ;A6D245;
    LDA.W Ridley.tailTipYPosition                                        ;A6D247;
    STA.B $14                                                            ;A6D24A;
    LDA.W #$0040                                                         ;A6D24C;
    STA.B $16                                                            ;A6D24F;
    STA.B $18                                                            ;A6D251;
    LDA.W SamusProjectile_ProjectileCounter                              ;A6D253;
    BNE .checkProjectiles                                                ;A6D256;
    CLC                                                                  ;A6D258;
    RTS                                                                  ;A6D259;

  .checkProjectiles:
    LDY.W #$0000                                                         ;A6D25A;

  .loop:
    LDA.W SamusProjectile_Types+1,Y                                      ;A6D25D;
    AND.W #$000F                                                         ;A6D260;
    DEC                                                                  ;A6D263;
    BEQ .missileOrSuperMissile                                           ;A6D264;
    DEC                                                                  ;A6D266;
    BNE .nextProjectile                                                  ;A6D267;

  .missileOrSuperMissile:
    LDA.W SamusProjectile_XPositions,Y                                   ;A6D269;
    SEC                                                                  ;A6D26C;
    SBC.B $12                                                            ;A6D26D;
    BPL +                                                                ;A6D26F;
    EOR.W #$FFFF                                                         ;A6D271;
    INC                                                                  ;A6D274;

+   SEC                                                                  ;A6D275;
    SBC.W SamusProjectile_XRadii,Y                                       ;A6D276;
    BCC +                                                                ;A6D279;
    CMP.B $16                                                            ;A6D27B;
    BCS .nextProjectile                                                  ;A6D27D;

+   LDA.W SamusProjectile_YPositions,Y                                   ;A6D27F;
    SEC                                                                  ;A6D282;
    SBC.B $14                                                            ;A6D283;
    BPL +                                                                ;A6D285;
    EOR.W #$FFFF                                                         ;A6D287;
    INC                                                                  ;A6D28A;

+   SEC                                                                  ;A6D28B;
    SBC.W SamusProjectile_YRadii,Y                                       ;A6D28C;
    BCC .targetProjectile                                                ;A6D28F;
    CMP.B $18                                                            ;A6D291;
    BCC .targetProjectile                                                ;A6D293;

  .nextProjectile:
    INY                                                                  ;A6D295;
    INY                                                                  ;A6D296;
    CPY.W #$000A                                                         ;A6D297;
    BMI .loop                                                            ;A6D29A;
    CLC                                                                  ;A6D29C;
    RTS                                                                  ;A6D29D;

  .targetProjectile:
    LDA.W SamusProjectile_XPositions,Y                                   ;A6D29E;
    STA.B $12                                                            ;A6D2A1;
    LDA.W SamusProjectile_YPositions,Y                                   ;A6D2A3;
    STA.B $14                                                            ;A6D2A6;
    SEC                                                                  ;A6D2A8;
    RTS                                                                  ;A6D2A9;


;;; $D2AA:  ;;;
PlaySwishingSFXIfTailIsMovingFast:
; Play swishing sound if tail is moving quickly
    LDA.L Ridley.tailAngularSpeed                                        ;A6D2AA;
    CMP.W #$0008                                                         ;A6D2AE;
    BMI .noSFX                                                           ;A6D2B1;
    LDA.L Ridley.maxTailSpeedCounter                                     ;A6D2B3;
    INC                                                                  ;A6D2B7;
    STA.L Ridley.maxTailSpeedCounter                                     ;A6D2B8;
    CMP.W #$0010                                                         ;A6D2BC;
    BMI .return                                                          ;A6D2BF;
    LDA.L Ridley.roarSFXFlag                                             ;A6D2C1;
    BNE .noSFX                                                           ;A6D2C5;
    LDA.W #$0021                                                         ;A6D2C7;
    JSL.L QueueSound_Lib3_Max6                                           ;A6D2CA;

  .noSFX:
    LDA.W #$0000                                                         ;A6D2CE;
    STA.L Ridley.maxTailSpeedCounter                                     ;A6D2D1;

  .return:
    RTS                                                                  ;A6D2D5;


;;; $D2D6:  ;;;
InitializeTailParts:
; Initializes a ton of variables from 7E:2012 to 7E:20A7. I'm *guessing* they're for his tail
    LDA.W #$0001                                                         ;A6D2D6;
    STA.L Ridley.tailAngularSpeed                                        ;A6D2D9;
    LDA.W #$3FF0                                                         ;A6D2DD;
    STA.L Ridley.tailMinimumAngle                                        ;A6D2E0;
    LDA.W #$4040                                                         ;A6D2E4;
    STA.L Ridley.tailMaximumAngle                                        ;A6D2E7;
    LDA.W #$FFFF                                                         ;A6D2EB;
    STA.L Ridley.optionalClockwiseTarget                                 ;A6D2EE;
    STA.L Ridley.optionalCounterClockwiseTarget                          ;A6D2F2;
    LDA.W #$00F0                                                         ;A6D2F6;
    STA.L Ridley.tailExtensionSpeed                                      ;A6D2F9;
    LDA.W #$0010                                                         ;A6D2FD;
    STA.L Ridley.movementThreshold                                       ;A6D300;
    INC                                                                  ;A6D304;
    STA.L Ridley.tail1RotationDelayTimer                                 ;A6D305;
    STA.L Ridley.tail2RotationDelayTimer                                 ;A6D309;
    STA.L Ridley.tail3RotationDelayTimer                                 ;A6D30D;
    STA.L Ridley.tail4RotationDelayTimer                                 ;A6D311;
    STA.L Ridley.tail5RotationDelayTimer                                 ;A6D315;
    STA.L Ridley.tail6RotationDelayTimer                                 ;A6D319;
    STA.L Ridley.tailTipRotationDelayTimer                               ;A6D31D;
    LDX.W #.rotationDirection                                            ;A6D321;
    LDY.W #Ridley.tail1RotationDirection                                 ;A6D324;
    JSR.W UpdateTailPartRAMFromXToY                                      ;A6D327;
    LDX.W #.distanceFromRidleyToTailParts                                ;A6D32A;
    LDY.W #Ridley.tail1DistanceToRidley                                  ;A6D32D;
    JSR.W UpdateTailPartRAMFromXToY                                      ;A6D330;
    LDX.W #.angleOfTailPart                                              ;A6D333;
    LDY.W #Ridley.tail1Angle                                             ;A6D336;
    JSR.W UpdateTailPartRAMFromXToY                                      ;A6D339;
    LDX.W #.XPositionOfTailPart                                          ;A6D33C;
    LDY.W #Ridley.tail1XPosition                                         ;A6D33F;
    JSR.W UpdateTailPartRAMFromXToY                                      ;A6D342;
    LDX.W #.YPositionOfTailPart                                          ;A6D345;
    LDY.W #Ridley.tail1YPosition                                         ;A6D348;
    JSR.W UpdateTailPartRAMFromXToY                                      ;A6D34B;
    LDA.W #$0000                                                         ;A6D34E;
    STA.L Ridley.tail1MovingRotatingFlag                                 ;A6D351;
    STA.L Ridley.tail2MovingRotatingFlag                                 ;A6D355;
    STA.L Ridley.tail3MovingRotatingFlag                                 ;A6D359;
    STA.L Ridley.tail4MovingRotatingFlag                                 ;A6D35D;
    STA.L Ridley.tail5MovingRotatingFlag                                 ;A6D361;
    STA.L Ridley.tail6MovingRotatingFlag                                 ;A6D365;
    STA.L Ridley.tailTipMovingRotatingFlag                               ;A6D369;
    RTS                                                                  ;A6D36D;

  .rotationDirection:
; $7E2024: Rotation direction = clockwise
    dw $8000,$8000,$8000,$8000,$8000,$8000,$8000                         ;A6D36E;

  .distanceFromRidleyToTailParts:
; $7E2026: Distance from Ridley to tail parts
    dw $0200,$0800,$0800,$0800,$0800,$0800,$0500                         ;A6D37C;

  .angleOfTailPart:
; $7E202A: Angle of this tail part
    dw $4000,$4010,$4020,$4030,$4040,$4050,$4060                         ;A6D38A;

  .XPositionOfTailPart:
; $7E202C: X position of this tail part
    dw $0000,$0003,$0007,$0007,$0003,$FFFD,$FFFC                         ;A6D398;

  .YPositionOfTailPart:
; $7E202E: Y position of this tail part
    dw $0002,$0007,$0003,$FFFD,$FFF9,$FFF9,$FFFF                         ;A6D3A6;


;;; $D3B4:  ;;;
UpdateTailPartRAMFromXToY:
; Copy 7 entries from (X) to 7E:(Y), 7E:(Y+14), 7E:(Y+28), 7E:(Y+3C), etc.
    LDA.W #$007E                                                         ;A6D3B4;
    STA.B $14                                                            ;A6D3B7;
    STY.B $12                                                            ;A6D3B9;
    LDY.W #$0000                                                         ;A6D3BB;
    LDA.W #$0007                                                         ;A6D3BE;

  .loop:
    PHA                                                                  ;A6D3C1;
    LDA.W $0000,X                                                        ;A6D3C2;
    STA.B [$12],Y                                                        ;A6D3C5;
    INX                                                                  ;A6D3C7;
    INX                                                                  ;A6D3C8;
    TYA                                                                  ;A6D3C9;
    CLC                                                                  ;A6D3CA;
    ADC.W #$0014                                                         ;A6D3CB;
    TAY                                                                  ;A6D3CE;
    PLA                                                                  ;A6D3CF;
    DEC                                                                  ;A6D3D0;
    BNE .loop                                                            ;A6D3D1;
    RTS                                                                  ;A6D3D3;


if !FEATURE_KEEP_UNREFERENCED
;;; $D3D4:  ;;;
UNUSED_SetAllTailPartsToNotMoving_A6D3D4:
    LDA.W #$0000                                                         ;A6D3D4;
    BRA SetAllTailPartsToMovingOrNotMoving                               ;A6D3D7;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $D3D9:  ;;;
SetAllTailPartsToMoving:
; Set all tail parts to moving
    LDA.W #$8000                                                         ;A6D3D9; fallthrough to SetAllTailPartsToMovingOrNotMoving


;;; $D3DC:  ;;;
SetAllTailPartsToMovingOrNotMoving:
    STA.L Ridley.tail1MovingRotatingFlag                                 ;A6D3DC;
    STA.L Ridley.tail2MovingRotatingFlag                                 ;A6D3E0;
    STA.L Ridley.tail3MovingRotatingFlag                                 ;A6D3E4;
    STA.L Ridley.tail4MovingRotatingFlag                                 ;A6D3E8;
    STA.L Ridley.tail5MovingRotatingFlag                                 ;A6D3EC;
    STA.L Ridley.tail6MovingRotatingFlag                                 ;A6D3F0;
    STA.L Ridley.tailTipMovingRotatingFlag                               ;A6D3F4;
    RTS                                                                  ;A6D3F8;


;;; $D3F9:  ;;;
Update_TailRotationDirection_Angle_DistanceFromRidley:
    PHX                                                                  ;A6D3F9;
    PHY                                                                  ;A6D3FA;
    LDX.W #InitializeTailParts_distanceFromRidleyToTailParts             ;A6D3FB;
    LDY.W #Ridley.tail1DistanceToRidley                                  ;A6D3FE;
    JSR.W UpdateTailPartRAMFromXToY                                      ;A6D401;
    LDY.W #$0007                                                         ;A6D404;
    LDX.W #$0000                                                         ;A6D407;

  .loop:
    LDA.L Ridley.tail1Angle,X                                            ;A6D40A;
    EOR.W #$FFFF                                                         ;A6D40E;
    INC                                                                  ;A6D411;
    CLC                                                                  ;A6D412;
    ADC.W #$8000                                                         ;A6D413;
    STA.L Ridley.tail1Angle,X                                            ;A6D416;
    LDA.L Ridley.tail1RotationDirection,X                                ;A6D41A;
    ORA.W #$8000                                                         ;A6D41E;
    STA.L Ridley.tail1RotationDirection,X                                ;A6D421;
    TXA                                                                  ;A6D425;
    CLC                                                                  ;A6D426;
    ADC.W #$0014                                                         ;A6D427;
    TAX                                                                  ;A6D42A;
    DEY                                                                  ;A6D42B;
    BNE .loop                                                            ;A6D42C;
    PLY                                                                  ;A6D42E;
    PLX                                                                  ;A6D42F;
    RTS                                                                  ;A6D430;


if !FEATURE_KEEP_UNREFERENCED
;;; $D431:  ;;;
UNUSED_CheckIfAllTailPartsAreMoving_A6D431:
    LDA.L Ridley.tail1MovingRotatingFlag                                 ;A6D431;
    AND.L Ridley.tail2MovingRotatingFlag                                 ;A6D435;
    AND.L Ridley.tail3MovingRotatingFlag                                 ;A6D439;
    AND.L Ridley.tail4MovingRotatingFlag                                 ;A6D43D;
    AND.L Ridley.tail5MovingRotatingFlag                                 ;A6D441;
    AND.L Ridley.tail6MovingRotatingFlag                                 ;A6D445;
    AND.L Ridley.tailTipMovingRotatingFlag                               ;A6D449;
    BNE .allPartsMoving                                                  ;A6D44D;
    CLC                                                                  ;A6D44F;
    RTS                                                                  ;A6D450;

  .allPartsMoving:
    SEC                                                                  ;A6D451;
    RTS                                                                  ;A6D452;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $D453: Deal suit-adjusted enemy damage to Samus ;;;
DealSuitAdjustedEnemyDamageToSamus:
    LDX.W EnemyIndex                                                     ;A6D453;
    LDA.W Enemy.ID,X                                                     ;A6D456;
    TAX                                                                  ;A6D459;
    LDA.L EnemyHeaders_damage,X                                          ;A6D45A;
    JSL.L Suit_Damage_Division                                           ;A6D45E;
    JSL.L Deal_A_Damage_to_Samus                                         ;A6D462;
    RTL                                                                  ;A6D466;


;;; $D467: Set Ridley instruction list ;;;
SetRidleyInstList:
    STA.W Enemy.instList                                                 ;A6D467;
    LDA.W #$0001                                                         ;A6D46A;
    STA.W Enemy.instTimer                                                ;A6D46D;
    STZ.W Enemy.loopCounter                                              ;A6D470;
    RTS                                                                  ;A6D473;


;;; $D474:  ;;;
DetermineAndSetRidleySpeedAndColorPalette:
; Determine and set Ridley's speed and color pallete
    LDA.W #$0000                                                         ;A6D474;
    LDY.W Enemy.health                                                   ;A6D477;
    CPY.W #$2328                                                         ;A6D47A;
    BCS +                                                                ;A6D47D;
    INC                                                                  ;A6D47F;
    CPY.W #$1518                                                         ;A6D480;
    BCS +                                                                ;A6D483;
    INC                                                                  ;A6D485;
    CPY.W #$0708                                                         ;A6D486;
    BCS +                                                                ;A6D489;
    INC                                                                  ;A6D48B;

+   STA.L Ridley.speed                                                   ;A6D48C;
    DEC                                                                  ;A6D490;
    STA.B $12                                                            ;A6D491;
    BMI HandleRidleyHealthBasedPalette_return                            ;A6D493; fallthrough to HandleRidleyHealthBasedPalette


;;; $D495:  ;;;
HandleRidleyHealthBasedPalette:
    LDA.L PaletteChangeNumerator                                         ;A6D495;
    BNE .return                                                          ;A6D499;
    LDA.B $12                                                            ;A6D49B;
    ASL                                                                  ;A6D49D;
    ASL                                                                  ;A6D49E;
    ASL                                                                  ;A6D49F;
    SEC                                                                  ;A6D4A0;
    SBC.B $12                                                            ;A6D4A1;
    ASL                                                                  ;A6D4A3;
    ASL                                                                  ;A6D4A4;
    CLC                                                                  ;A6D4A5;
    ADC.W #Palette_Ridley_HealthBased_Below9000                          ;A6D4A6;
    TAY                                                                  ;A6D4A9;
    LDX.W #$01E2                                                         ;A6D4AA;
    LDA.W #$000E                                                         ;A6D4AD;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;A6D4B0;

  .return:
    RTS                                                                  ;A6D4B4;


;;; $D4B5:  ;;;
DetermineAndSetCeresRidleysColorPalette:
; Determine and set Ridley's color pallete
    LDA.L Ridley.status                                                  ;A6D4B5;
    BEQ HandleRidleyHealthBasedPalette_return                            ;A6D4B9;
    LDA.L Ridley.hitCounterCeres                                         ;A6D4BB;
    CMP.W #$0032                                                         ;A6D4BF;
    BCC HandleRidleyHealthBasedPalette_return                            ;A6D4C2;
    LDY.W #$0000                                                         ;A6D4C4;
    CMP.W #$0046                                                         ;A6D4C7;
    BCC .paletteChosen                                                   ;A6D4CA;
    LDY.W #$0001                                                         ;A6D4CC;
    CMP.W #$005A                                                         ;A6D4CF; >.< where's the BCC?
    LDY.W #$0002                                                         ;A6D4D2;

  .paletteChosen:
    STY.B $12                                                            ;A6D4D5;
    JMP.W HandleRidleyHealthBasedPalette                                 ;A6D4D7;


;;; $D4DA:  ;;;
MakeRidleysWingsAndTailFlashWhenHit:
; Make wings/tail flash when hit
    PHX                                                                  ;A6D4DA;
    LDX.W #$0E00                                                         ;A6D4DB;
    LDA.W Enemy.flashTimer                                               ;A6D4DE;
    BEQ .noFlash                                                         ;A6D4E1;
    DEC                                                                  ;A6D4E3;
    BEQ .noFlash                                                         ;A6D4E4;
    LDA.W NumberOfTimesMainEnemyRoutineExecuted                          ;A6D4E6;
    INC                                                                  ;A6D4E9;
    AND.W #$0002                                                         ;A6D4EA;
    BEQ .noFlash                                                         ;A6D4ED;
    LDX.W #$0000                                                         ;A6D4EF;

  .noFlash:
    TXA                                                                  ;A6D4F2;
    STA.L Ridley.wingTailPalette                                         ;A6D4F3;
    PLX                                                                  ;A6D4F7;
    RTS                                                                  ;A6D4F8;


;;; $D4F9: Check for collision with non-air block ;;;
CheckForCollisionWithNonAirBlock:
;; Parameters:
;;     X: X position
;;     Y: Y position
;; Returns:
;;     Carry: Set if collision, clear otherwise
    TYA                                                                  ;A6D4F9;
    LSR                                                                  ;A6D4FA;
    LSR                                                                  ;A6D4FB;
    LSR                                                                  ;A6D4FC;
    LSR                                                                  ;A6D4FD;
    SEP #$20                                                             ;A6D4FE;
    STA.W $4202                                                          ;A6D500;
    LDA.W RoomWidthBlocks                                                ;A6D503;
    STA.W $4203                                                          ;A6D506;
    REP #$20                                                             ;A6D509;
    TXA                                                                  ;A6D50B;
    LSR                                                                  ;A6D50C;
    LSR                                                                  ;A6D50D;
    LSR                                                                  ;A6D50E;
    LSR                                                                  ;A6D50F;
    CLC                                                                  ;A6D510;
    ADC.W $4216                                                          ;A6D511;
    ASL                                                                  ;A6D514;
    TAX                                                                  ;A6D515;
    LDA.L $7F0002,X                                                      ;A6D516;
    AND.W #$F000                                                         ;A6D51A;
    BNE .collision                                                       ;A6D51D;
    CLC                                                                  ;A6D51F;
    RTL                                                                  ;A6D520;

  .collision:
    SEC                                                                  ;A6D521;
    RTL                                                                  ;A6D522;


;;; $D523:  ;;;
AccelerateRidleyTowardDesiredXYPosition_NoDecelerationBoost:
; Accelerates Ridley towards the desired X/Y ($12/$14).
; No deceleration boost ($1A), Y is index value to find acceleration divisor ($18), X is enemy's index
    LDA.W #$0000                                                         ;A6D523; fallthrough to AccelerateRidleyTowardDesiredXYPosition


;;; $D526:  ;;;
AccelerateRidleyTowardDesiredXYPosition:
; Accelerates Ridley towards the desired X/Y ($12/$14).
; A is deceleration boost, Y is index value to find acceleration divisor ($18), X is enemy's index
    STA.B $1A                                                            ;A6D526;
    LDA.W RidleyAccelerationDivisorIndex,Y                               ;A6D528;
    AND.W #$00FF                                                         ;A6D52B;
    STA.B $18                                                            ;A6D52E;
    JSR.W AccelerateRidleyTowardDesiredXPosition                         ;A6D530;
    LDA.W Enemy.YPosition,X                                              ;A6D533;
    SEC                                                                  ;A6D536;
    SBC.B $14                                                            ;A6D537;
    BEQ .return                                                          ;A6D539;
    BPL .belowTarget                                                     ;A6D53B;
    EOR.W #$FFFF                                                         ;A6D53D;
    INC                                                                  ;A6D540;
    STA.W $4204                                                          ;A6D541;
    SEP #$20                                                             ;A6D544;
    LDA.B $18                                                            ;A6D546;
    STA.W $4206                                                          ;A6D548;
    REP #$20                                                             ;A6D54B;
    XBA                                                                  ;A6D54D;
    XBA                                                                  ;A6D54E;
    NOP                                                                  ;A6D54F;
    NOP                                                                  ;A6D550;
    LDA.W $4214                                                          ;A6D551;
    BNE +                                                                ;A6D554;
    INC                                                                  ;A6D556;

+   STA.B $16                                                            ;A6D557;
    LDA.W Ridley.YSpeed,X                                                ;A6D559;
    BPL +                                                                ;A6D55C;
    CLC                                                                  ;A6D55E;
    ADC.B $1A                                                            ;A6D55F;
    CLC                                                                  ;A6D561;
    ADC.W #$0008                                                         ;A6D562;
    ADC.B $16                                                            ;A6D565;

+   ADC.B $16                                                            ;A6D567;
    CMP.W #$0500                                                         ;A6D569;
    BMI +                                                                ;A6D56C;
    LDA.W #$0500                                                         ;A6D56E;

+   STA.W Ridley.YSpeed,X                                                ;A6D571;

  .return:
    RTS                                                                  ;A6D574;

  .belowTarget:
    STA.W $4204                                                          ;A6D575;
    SEP #$20                                                             ;A6D578;
    LDA.B $18                                                            ;A6D57A;
    STA.W $4206                                                          ;A6D57C;
    REP #$20                                                             ;A6D57F;
    XBA                                                                  ;A6D581;
    XBA                                                                  ;A6D582;
    NOP                                                                  ;A6D583;
    NOP                                                                  ;A6D584;
    LDA.W $4214                                                          ;A6D585;
    BNE +                                                                ;A6D588;
    INC                                                                  ;A6D58A;

+   STA.B $16                                                            ;A6D58B;
    LDA.W Ridley.YSpeed,X                                                ;A6D58D;
    BMI +                                                                ;A6D590;
    SEC                                                                  ;A6D592;
    SBC.B $1A                                                            ;A6D593;
    SEC                                                                  ;A6D595;
    SBC.W #$0008                                                         ;A6D596;
    SBC.B $16                                                            ;A6D599;

+   SBC.B $16                                                            ;A6D59B;
    CMP.W #$FB00                                                         ;A6D59D;
    BPL +                                                                ;A6D5A0;
    LDA.W #$FB00                                                         ;A6D5A2;

+   STA.W Ridley.YSpeed,X                                                ;A6D5A5;
    RTS                                                                  ;A6D5A8;


;;; $D5A9:  ;;;
AccelerateRidleyTowardDesiredXPosition:
; Accelerates Ridley towards the desired X position ($12).
; Deceleration boost in $1A, acceleration divisor in $18, X is enemy's index
    LDA.W Enemy.XPosition,X                                              ;A6D5A9;
    SEC                                                                  ;A6D5AC;
    SBC.B $12                                                            ;A6D5AD;
    BEQ .return                                                          ;A6D5AF;
    BPL .rightOfTarget                                                   ;A6D5B1;
    EOR.W #$FFFF                                                         ;A6D5B3;
    INC                                                                  ;A6D5B6;
    STA.W $4204                                                          ;A6D5B7;
    SEP #$20                                                             ;A6D5BA;
    LDA.B $18                                                            ;A6D5BC;
    STA.W $4206                                                          ;A6D5BE;
    REP #$20                                                             ;A6D5C1;
    XBA                                                                  ;A6D5C3;
    XBA                                                                  ;A6D5C4;
    NOP                                                                  ;A6D5C5;
    NOP                                                                  ;A6D5C6;
    LDA.W $4214                                                          ;A6D5C7;
    BNE +                                                                ;A6D5CA;
    INC                                                                  ;A6D5CC;

+   STA.B $16                                                            ;A6D5CD;
    LDA.W Ridley.XSpeed,X                                                ;A6D5CF;
    BPL +                                                                ;A6D5D2;
    CLC                                                                  ;A6D5D4;
    ADC.B $1A                                                            ;A6D5D5;
    CLC                                                                  ;A6D5D7;
    ADC.W #$0008                                                         ;A6D5D8;
    ADC.B $16                                                            ;A6D5DB;

+   ADC.B $16                                                            ;A6D5DD;
    CMP.W #$0500                                                         ;A6D5DF;
    BMI +                                                                ;A6D5E2;
    LDA.W #$0500                                                         ;A6D5E4;

+   STA.W Ridley.XSpeed,X                                                ;A6D5E7;

  .return:
    RTS                                                                  ;A6D5EA;

  .rightOfTarget:
    STA.W $4204                                                          ;A6D5EB;
    SEP #$20                                                             ;A6D5EE;
    LDA.B $18                                                            ;A6D5F0;
    STA.W $4206                                                          ;A6D5F2;
    REP #$20                                                             ;A6D5F5;
    XBA                                                                  ;A6D5F7;
    XBA                                                                  ;A6D5F8;
    NOP                                                                  ;A6D5F9;
    NOP                                                                  ;A6D5FA;
    LDA.W $4214                                                          ;A6D5FB;
    BNE +                                                                ;A6D5FE;
    INC                                                                  ;A6D600;

+   STA.B $16                                                            ;A6D601;
    LDA.W Ridley.XSpeed,X                                                ;A6D603;
    BMI +                                                                ;A6D606;
    SEC                                                                  ;A6D608;
    SBC.B $1A                                                            ;A6D609;
    SEC                                                                  ;A6D60B;
    SBC.W #$0008                                                         ;A6D60C;
    SBC.B $16                                                            ;A6D60F;

+   SBC.B $16                                                            ;A6D611;
    CMP.W #$FB00                                                         ;A6D613;
    BPL +                                                                ;A6D616;
    LDA.W #$FB00                                                         ;A6D618;

+   STA.W Ridley.XSpeed,X                                                ;A6D61B;
    RTS                                                                  ;A6D61E;


;;; $D61F:  ;;;
RidleyAccelerationDivisorIndex:
    db $10,$0F,$0E,$0D,$0C,$0B,$0A,$09,$08,$07,$06,$05,$04,$03,$02,$01   ;A6D61F;


;;; $D62F:  ;;;
AccelerateCeresRidleyTowardDesiredXY:
    LDA.W CeresRidleyAccelerationDivisorIndex,Y                          ;A6D62F;
    AND.W #$00FF                                                         ;A6D632;
    STA.B $18                                                            ;A6D635;
    JSR.W CalculateRidleyXSpeed                                          ;A6D637;
    LDA.W Enemy.YPosition,X                                              ;A6D63A;
    SEC                                                                  ;A6D63D;
    SBC.B $14                                                            ;A6D63E;
    BEQ .return                                                          ;A6D640;
    BPL .positive                                                        ;A6D642;
    EOR.W #$FFFF                                                         ;A6D644;
    INC                                                                  ;A6D647;
    STA.W $4204                                                          ;A6D648;
    SEP #$20                                                             ;A6D64B;
    LDA.B $18                                                            ;A6D64D;
    STA.W $4206                                                          ;A6D64F;
    REP #$20                                                             ;A6D652;
    XBA                                                                  ;A6D654;
    XBA                                                                  ;A6D655;
    NOP                                                                  ;A6D656;
    NOP                                                                  ;A6D657;
    LDA.W $4214                                                          ;A6D658;
    BNE +                                                                ;A6D65B;
    INC                                                                  ;A6D65D;

+   STA.B $16                                                            ;A6D65E;
    LDA.W Ridley.YSpeed,X                                                ;A6D660;
    BPL .moveDown                                                        ;A6D663;
    ADC.B $16                                                            ;A6D665;
    ADC.B $16                                                            ;A6D667;

  .moveDown:
    ADC.B $16                                                            ;A6D669;
    CMP.W #$0500                                                         ;A6D66B;
    BMI .storeYSpeed                                                     ;A6D66E;
    LDA.W #$0500                                                         ;A6D670;

  .storeYSpeed:
    STA.W Ridley.YSpeed,X                                                ;A6D673;

  .return:
    RTS                                                                  ;A6D676;

  .positive:
    STA.W $4204                                                          ;A6D677;
    SEP #$20                                                             ;A6D67A;
    LDA.B $18                                                            ;A6D67C;
    STA.W $4206                                                          ;A6D67E;
    REP #$20                                                             ;A6D681;
    XBA                                                                  ;A6D683;
    XBA                                                                  ;A6D684;
    NOP                                                                  ;A6D685;
    NOP                                                                  ;A6D686;
    LDA.W $4214                                                          ;A6D687;
    BNE +                                                                ;A6D68A;
    INC                                                                  ;A6D68C;

+   STA.B $16                                                            ;A6D68D;
    LDA.W Ridley.YSpeed,X                                                ;A6D68F;
    BMI .movingUp                                                        ;A6D692;
    SBC.B $16                                                            ;A6D694;
    SBC.B $16                                                            ;A6D696;

  .movingUp:
    SBC.B $16                                                            ;A6D698;
    CMP.W #$FB00                                                         ;A6D69A;
    BPL +                                                                ;A6D69D;
    LDA.W #$FB00                                                         ;A6D69F;

+   STA.W Ridley.YSpeed,X                                                ;A6D6A2;
    RTS                                                                  ;A6D6A5;


;;; $D6A6:  ;;;
CalculateRidleyXSpeed:
    LDA.W Enemy.XPosition,X                                              ;A6D6A6;
    SEC                                                                  ;A6D6A9;
    SBC.B $12                                                            ;A6D6AA;
    BEQ .return                                                          ;A6D6AC;
    BPL .moveLeft                                                        ;A6D6AE;
    EOR.W #$FFFF                                                         ;A6D6B0;
    INC                                                                  ;A6D6B3;
    STA.W $4204                                                          ;A6D6B4;
    SEP #$20                                                             ;A6D6B7;
    LDA.B $18                                                            ;A6D6B9;
    STA.W $4206                                                          ;A6D6BB;
    REP #$20                                                             ;A6D6BE;
    XBA                                                                  ;A6D6C0;
    XBA                                                                  ;A6D6C1;
    NOP                                                                  ;A6D6C2;
    NOP                                                                  ;A6D6C3;
    LDA.W $4214                                                          ;A6D6C4;
    BNE +                                                                ;A6D6C7;
    INC                                                                  ;A6D6C9;

+   STA.B $16                                                            ;A6D6CA;
    LDA.W Ridley.XSpeed,X                                                ;A6D6CC;
    BPL .movingRight                                                     ;A6D6CF;
    ADC.B $16                                                            ;A6D6D1;
    ADC.B $16                                                            ;A6D6D3;

  .movingRight:
    ADC.B $16                                                            ;A6D6D5;
    CMP.W #$0500                                                         ;A6D6D7;
    BMI +                                                                ;A6D6DA;
    LDA.W #$0500                                                         ;A6D6DC;

+   STA.W Ridley.XSpeed,X                                                ;A6D6DF;

  .return:
    RTS                                                                  ;A6D6E2;

  .moveLeft:
    STA.W $4204                                                          ;A6D6E3;
    SEP #$20                                                             ;A6D6E6;
    LDA.B $18                                                            ;A6D6E8;
    STA.W $4206                                                          ;A6D6EA;
    REP #$20                                                             ;A6D6ED;
    XBA                                                                  ;A6D6EF;
    XBA                                                                  ;A6D6F0;
    NOP                                                                  ;A6D6F1;
    NOP                                                                  ;A6D6F2;
    LDA.W $4214                                                          ;A6D6F3;
    BNE +                                                                ;A6D6F6;
    INC                                                                  ;A6D6F8;

+   STA.B $16                                                            ;A6D6F9;
    LDA.W Ridley.XSpeed,X                                                ;A6D6FB;
    BMI .movingLeft                                                      ;A6D6FE;
    SBC.B $16                                                            ;A6D700;
    SBC.B $16                                                            ;A6D702;

  .movingLeft:
    SBC.B $16                                                            ;A6D704;
    CMP.W #$FB00                                                         ;A6D706;
    BPL +                                                                ;A6D709;
    LDA.W #$FB00                                                         ;A6D70B;

+   STA.W Ridley.XSpeed,X                                                ;A6D70E;
    RTS                                                                  ;A6D711;


;;; $D712:  ;;;
CeresRidleyAccelerationDivisorIndex:
    db $10,$0F,$0E,$0D,$0C,$0B,$0A,$09,$08,$07,$06,$05,$04,$03,$02,$01   ;A6D712;


if !FEATURE_KEEP_UNREFERENCED
UNUSED_A6D722:
;;; $D722:  ;;;
    LDA.W #$0200                                                         ;A6D722;
    STA.B $16                                                            ;A6D725;
    STZ.B $1C                                                            ;A6D727;
    JSR.W UNUSED_A6D798                                                  ;A6D729;
    JSR.W UNUSED_A6D734                                                  ;A6D72C;
    LSR.B $1C                                                            ;A6D72F;
    LSR.B $1C                                                            ;A6D731;
    RTS                                                                  ;A6D733;


;;; $D734:  ;;;
UNUSED_A6D734:
    LDA.W Enemy.YPosition,X                                              ;A6D734;
    SEC                                                                  ;A6D737;
    SBC.B $14                                                            ;A6D738;
    BPL .unknown                                                         ;A6D73A;
    LDA.W Ridley.YSpeed,X                                                ;A6D73C;
    CLC                                                                  ;A6D73F;
    ADC.B $16                                                            ;A6D740;
    CMP.W #$0500                                                         ;A6D742;
    BMI +                                                                ;A6D745;
    LDA.W #$0500                                                         ;A6D747;

+   STA.W Ridley.YSpeed,X                                                ;A6D74A;
    AND.W #$FF00                                                         ;A6D74D;
    XBA                                                                  ;A6D750;
    BPL +                                                                ;A6D751;
    ORA.W #$FF00                                                         ;A6D753;

+   CLC                                                                  ;A6D756;
    ADC.W Enemy.YPosition,X                                              ;A6D757;
    CMP.B $14                                                            ;A6D75A;
    BMI .returnUpper                                                     ;A6D75C;
    STZ.W Ridley.YSpeed,X                                                ;A6D75E;
    LDA.B $14                                                            ;A6D761;
    STA.W Enemy.YPosition,X                                              ;A6D763;
    INC.B $1C                                                            ;A6D766;

  .returnUpper:
    RTS                                                                  ;A6D768;

  .unknown:
    LDA.W Ridley.YSpeed,X                                                ;A6D769;
    SEC                                                                  ;A6D76C;
    SBC.B $16                                                            ;A6D76D;
    CMP.W #$FB00                                                         ;A6D76F;
    BPL +                                                                ;A6D772;
    LDA.W #$FB00                                                         ;A6D774;

+   STA.W Ridley.YSpeed,X                                                ;A6D777;
    AND.W #$FF00                                                         ;A6D77A;
    XBA                                                                  ;A6D77D;
    BPL +                                                                ;A6D77E;
    ORA.W #$FF00                                                         ;A6D780;

+   CLC                                                                  ;A6D783;
    ADC.W Enemy.YPosition,X                                              ;A6D784;
    CMP.B $14                                                            ;A6D787;
    BEQ +                                                                ;A6D789;
    BPL .returnLower                                                     ;A6D78B;

+   STZ.W Ridley.YSpeed,X                                                ;A6D78D;
    LDA.B $14                                                            ;A6D790;
    STA.W Enemy.YPosition,X                                              ;A6D792;
    INC.B $1C                                                            ;A6D795;

  .returnLower:
    RTS                                                                  ;A6D797;


;;; $D798:  ;;;
UNUSED_A6D798:
    LDA.W Enemy.XPosition,X                                              ;A6D798;
    SEC                                                                  ;A6D79B;
    SBC.B $12                                                            ;A6D79C;
    BPL .unknown                                                         ;A6D79E;
    EOR.W #$FFFF                                                         ;A6D7A0;
    INC                                                                  ;A6D7A3;
    LDA.W Ridley.XSpeed,X                                                ;A6D7A4;
    CLC                                                                  ;A6D7A7;
    ADC.B $16                                                            ;A6D7A8;
    CMP.W #$0500                                                         ;A6D7AA;
    BMI +                                                                ;A6D7AD;
    LDA.W #$0500                                                         ;A6D7AF;

+   STA.W Ridley.XSpeed,X                                                ;A6D7B2;
    AND.W #$FF00                                                         ;A6D7B5;
    XBA                                                                  ;A6D7B8;
    BPL +                                                                ;A6D7B9;
    ORA.W #$FF00                                                         ;A6D7BB;

+   CLC                                                                  ;A6D7BE;
    ADC.W Enemy.XPosition,X                                              ;A6D7BF;
    CMP.B $12                                                            ;A6D7C2;
    BMI .returnUpper                                                     ;A6D7C4;
    STZ.W Ridley.XSpeed,X                                                ;A6D7C6;
    LDA.B $12                                                            ;A6D7C9;
    STA.W Enemy.XPosition,X                                              ;A6D7CB;
    INC.B $1C                                                            ;A6D7CE;

  .returnUpper:
    RTS                                                                  ;A6D7D0;

  .unknown:
    LDA.W Ridley.XSpeed,X                                                ;A6D7D1;
    SEC                                                                  ;A6D7D4;
    SBC.B $16                                                            ;A6D7D5;
    CMP.W #$FB00                                                         ;A6D7D7;
    BPL +                                                                ;A6D7DA;
    LDA.W #$FB00                                                         ;A6D7DC;

+   STA.W Ridley.XSpeed,X                                                ;A6D7DF;
    AND.W #$FF00                                                         ;A6D7E2;
    XBA                                                                  ;A6D7E5;
    BPL +                                                                ;A6D7E6;
    ORA.W #$FF00                                                         ;A6D7E8;

+   CLC                                                                  ;A6D7EB;
    ADC.W Enemy.XPosition,X                                              ;A6D7EC;
    CMP.B $12                                                            ;A6D7EF;
    BEQ +                                                                ;A6D7F1;
    BPL .returnLower                                                     ;A6D7F3;

+   STZ.W Ridley.XSpeed,X                                                ;A6D7F5;
    LDA.B $12                                                            ;A6D7F8;
    STA.W Enemy.XPosition,X                                              ;A6D7FA;
    INC.B $1C                                                            ;A6D7FD;

  .returnLower:
    RTS                                                                  ;A6D7FF;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $D800:  ;;;
UpdateRidleysUSwoopSpeedAndAngle:
; Update Ridley's U Swoop speed and U Swoop angle, and calculate current X and Y speed
    LDA.B $16                                                            ;A6D800;
    CMP.L Ridley.USwoopSpeed                                             ;A6D802;
    BEQ .checkAngle                                                      ;A6D806;
    BPL +                                                                ;A6D808;
    LDA.L Ridley.USwoopSpeed                                             ;A6D80A;
    SEC                                                                  ;A6D80E;
    SBC.W #$0020                                                         ;A6D80F;
    CMP.B $16                                                            ;A6D812;
    BPL .storeSwoopSpeed                                                 ;A6D814;
    LDA.B $16                                                            ;A6D816;

  .storeSwoopSpeed:
    STA.L Ridley.USwoopSpeed                                             ;A6D818;
    BRA .checkAngle                                                      ;A6D81C;

+   LDA.L Ridley.USwoopSpeed                                             ;A6D81E;
    CLC                                                                  ;A6D822;
    ADC.W #$0020                                                         ;A6D823;
    CMP.B $16                                                            ;A6D826;
    BMI +                                                                ;A6D828;
    LDA.B $16                                                            ;A6D82A;

+   STA.L Ridley.USwoopSpeed                                             ;A6D82C;

  .checkAngle:
    LDA.B $12                                                            ;A6D830;
    BMI .negativeTargetAngle                                             ;A6D832;
    CLC                                                                  ;A6D834;
    ADC.L Ridley.currentAngleOfMotion                                    ;A6D835;
    CMP.B $14                                                            ;A6D839;
    BMI .calculateAngle                                                  ;A6D83B;
    BRA +                                                                ;A6D83D;

  .negativeTargetAngle:
    CLC                                                                  ;A6D83F;
    ADC.L Ridley.currentAngleOfMotion                                    ;A6D840;
    CMP.B $14                                                            ;A6D844;
    BPL .calculateAngle                                                  ;A6D846;

+   LDA.B $14                                                            ;A6D848;

  .calculateAngle:
    STA.L Ridley.currentAngleOfMotion                                    ;A6D84A;
    XBA                                                                  ;A6D84E;
    AND.W #$00FF                                                         ;A6D84F;
    STA.B $12                                                            ;A6D852;
    LDA.L Ridley.USwoopSpeed                                             ;A6D854;
    JSL.L CalculateXVelocityFromSpeedAndAngle                            ;A6D858;
    STA.W Ridley.XSpeed                                                  ;A6D85C;
    LDA.L Ridley.USwoopSpeed                                             ;A6D85F;
    JSL.L CalculateYVelocityFromSpeedAndAngle                            ;A6D863;
    STA.W Ridley.YSpeed                                                  ;A6D867;
    RTS                                                                  ;A6D86A;


;;; $D86B:  ;;;
HandleMovementAndMainBodyWallCollisions:
; Handles movement and main body wall collisions
    LDA.W #$0000                                                         ;A6D86B;
    STA.L Ridley.collisionDirection                                      ;A6D86E;
    LDX.W EnemyIndex                                                     ;A6D872;
    LDA.W Ridley.XSpeed,X                                                ;A6D875;
    SEP #$20                                                             ;A6D878;
    CLC                                                                  ;A6D87A;
    ADC.W Enemy.XSubPosition+1,X                                         ;A6D87B;
    STA.W Enemy.XSubPosition+1,X                                         ;A6D87E;
    REP #$20                                                             ;A6D881;
    AND.W #$FF00                                                         ;A6D883;
    XBA                                                                  ;A6D886;
    BPL .checkLeftWall                                                   ;A6D887;
    ORA.W #$FF00                                                         ;A6D889;

  .checkLeftWall:
    ADC.W Enemy.XPosition,X                                              ;A6D88C;
    CMP.L Ridley.leftBoundary                                            ;A6D88F;
    BPL .checkRightWall                                                  ;A6D893;
    JSR.W CeresRidleyRoomShaking                                         ;A6D895;
    LDA.L Ridley.leftBoundary                                            ;A6D898;
    STA.W Enemy.XPosition,X                                              ;A6D89C;
    STZ.W Ridley.XSpeed,X                                                ;A6D89F;
    LDA.W #$0001                                                         ;A6D8A2;
    STA.L Ridley.collisionDirection                                      ;A6D8A5;
    BRA .getYSpeed                                                       ;A6D8A9;


  .checkRightWall:
    CMP.L Ridley.rightBoundary                                           ;A6D8AB;
    BMI +                                                                ;A6D8AF;
    STZ.W Ridley.XSpeed,X                                                ;A6D8B1;
    LDA.W #$0002                                                         ;A6D8B4;
    STA.L Ridley.collisionDirection                                      ;A6D8B7;
    LDA.L Ridley.rightBoundary                                           ;A6D8BB;

+   STA.W Enemy.XPosition,X                                              ;A6D8BF;

  .getYSpeed:
    LDA.W Ridley.YSpeed,X                                                ;A6D8C2;
    SEP #$20                                                             ;A6D8C5;
    CLC                                                                  ;A6D8C7;
    ADC.W Enemy.YSubPosition+1,X                                         ;A6D8C8;
    STA.W Enemy.YSubPosition+1,X                                         ;A6D8CB;
    REP #$20                                                             ;A6D8CE;
    AND.W #$FF00                                                         ;A6D8D0;
    XBA                                                                  ;A6D8D3;
    BPL .checkTopWall                                                    ;A6D8D4;
    ORA.W #$FF00                                                         ;A6D8D6;

  .checkTopWall:
    ADC.W Enemy.YPosition,X                                              ;A6D8D9;
    CMP.L Ridley.topBoundary                                             ;A6D8DC;
    BPL .checkBottomWall                                                 ;A6D8E0;
    LDA.L Ridley.topBoundary                                             ;A6D8E2;
    STA.W Enemy.YPosition,X                                              ;A6D8E6;
    STZ.W Ridley.YSpeed,X                                                ;A6D8E9;
    LDA.L Ridley.collisionDirection                                      ;A6D8EC; >_<
    LDA.W #$0004                                                         ;A6D8F0;
    STA.L Ridley.collisionDirection                                      ;A6D8F3;
    RTS                                                                  ;A6D8F7;

  .checkBottomWall:
    CMP.L Ridley.bottomBoundary                                          ;A6D8F8;
    BMI .done                                                            ;A6D8FC;
    STZ.W Ridley.YSpeed,X                                                ;A6D8FE;
    LDA.L Ridley.collisionDirection                                      ;A6D901;
    LDA.W #$0008                                                         ;A6D905;
    STA.L Ridley.collisionDirection                                      ;A6D908;
    LDA.L Ridley.bottomBoundary                                          ;A6D90C;

  .done:
    STA.W Enemy.YPosition,X                                              ;A6D910;
    RTS                                                                  ;A6D913;


;;; $D914:  ;;;
CeresRidleyRoomShaking:
; Cause room shaking, only happens in Ceres. Has unreachable code for Norfair room shaking
    LDA.W AreaIndex                                                      ;A6D914;
    CMP.W #$0002                                                         ;A6D917;
    BEQ .return                                                          ;A6D91A;
    LDA.W Ridley.XSpeed,X                                                ;A6D91C;
    BPL .movingRight                                                     ;A6D91F;
    EOR.W #$FFFF                                                         ;A6D921;
    INC                                                                  ;A6D924;

  .movingRight:
    STA.B $12                                                            ;A6D925;
    LDA.W Ridley.YSpeed,X                                                ;A6D927;
    BPL .movingDown                                                      ;A6D92A;
    EOR.W #$FFFF                                                         ;A6D92C;
    INC                                                                  ;A6D92F;

  .movingDown:
    CMP.B $12                                                            ;A6D930;
    BCS .XSpeedGreater                                                   ;A6D932;
    LDA.B $12                                                            ;A6D934;

  .XSpeedGreater:
    CMP.W #$0280                                                         ;A6D936;
    BCC .return                                                          ;A6D939;
    LDA.W AreaIndex                                                      ;A6D93B;
    CMP.W #$0002                                                         ;A6D93E;
    BEQ .norfair                                                         ;A6D941;
    LDA.W #$0021                                                         ;A6D943;
    BRA +                                                                ;A6D946;

  .norfair:
    LDA.W #$0018                                                         ;A6D948; dead code

+   STA.W EarthquakeType                                                 ;A6D94B;
    LDA.W #$000C                                                         ;A6D94E;
    STA.W EarthquakeTimer                                                ;A6D951;

  .return:
    RTS                                                                  ;A6D954;


;;; $D955:  ;;;
TurnAroundIfFacingAwayFromRoomCenter:
; Turn around if facing away from the center of the room (facing a wall)
    LDA.L Ridley.facingDirection                                         ;A6D955;
    BEQ .facingLeft                                                      ;A6D959;
    DEC                                                                  ;A6D95B;
    BEQ .return                                                          ;A6D95C;
    LDA.W Enemy.XPosition-1                                              ;A6D95E;
    BPL .return                                                          ;A6D961;
    LDA.W #InstList_Ridley_TurnFromRightToLeft                           ;A6D963;
    BRA +                                                                ;A6D966;

  .facingLeft:
    LDA.W Enemy.XPosition-1                                              ;A6D968;
    BMI .return                                                          ;A6D96B;
    LDA.W #InstList_Ridley_TurnFromLeftToRight                           ;A6D96D;

+   STA.W Enemy.instList                                                 ;A6D970;
    LDA.W #$0002                                                         ;A6D973;
    STA.W Enemy.instTimer                                                ;A6D976;
    STZ.W Enemy.loopCounter                                              ;A6D979;

  .return:
    RTS                                                                  ;A6D97C;


;;; $D97D:  ;;;
HandleWingFlapping:
; Handle wing flapping
    JSR.W CalculateWingFlapSpeed                                         ;A6D97D;
    LDA.L Ridley.wingFlapCounter                                         ;A6D980;
    SEC                                                                  ;A6D984;
    SBC.L Ridley.wingFlapSpeed                                           ;A6D985;
    STA.L Ridley.wingFlapCounter                                         ;A6D989;
    BPL .return                                                          ;A6D98D;
    LDA.W #$0020                                                         ;A6D98F;
    STA.L Ridley.wingFlapCounter                                         ;A6D992;
    LDA.L Ridley.wingFlapFrame                                           ;A6D996;
    INC                                                                  ;A6D99A;
    CMP.W #$000A                                                         ;A6D99B;
    BCC .lessThanA                                                       ;A6D99E;
    LDA.W #$0000                                                         ;A6D9A0;

  .lessThanA:
    STA.L Ridley.wingFlapFrame                                           ;A6D9A3;

  .return:
    RTS                                                                  ;A6D9A7;


;;; $D9A8:  ;;;
CalculateWingFlapSpeed:
; Calculate wing flap speed
    LDA.W Ridley.XSpeed                                                  ;A6D9A8;
    BPL +                                                                ;A6D9AB;
    EOR.W #$FFFF                                                         ;A6D9AD;
    INC                                                                  ;A6D9B0;

+   STA.B $12                                                            ;A6D9B1;
    LDA.W Ridley.YSpeed                                                  ;A6D9B3;
    BPL +                                                                ;A6D9B6;
    EOR.W #$FFFF                                                         ;A6D9B8;
    INC                                                                  ;A6D9BB;

+   CLC                                                                  ;A6D9BC;
    ADC.B $12                                                            ;A6D9BD;
    BNE .RidleyMoving                                                    ;A6D9BF;
    STA.L Ridley.wingFlapSpeed                                           ;A6D9C1;
    RTS                                                                  ;A6D9C5;

  .RidleyMoving:
    SEC                                                                  ;A6D9C6;
    SBC.B $12                                                            ;A6D9C7;
    CMP.B $12                                                            ;A6D9C9;
    BPL .YSpeedGreater                                                   ;A6D9CB;
    LDA.B $12                                                            ;A6D9CD;

  .YSpeedGreater:
    ASL                                                                  ;A6D9CF;
    ASL                                                                  ;A6D9D0;
    AND.W #$0F00                                                         ;A6D9D1;
    XBA                                                                  ;A6D9D4;
    ASL                                                                  ;A6D9D5;
    CMP.W #$000E                                                         ;A6D9D6;
    BCC .maxE                                                            ;A6D9D9;
    LDA.W #$000E                                                         ;A6D9DB;

  .maxE:
    TAX                                                                  ;A6D9DE;
    LDA.W .wingFlapSpeeds,X                                              ;A6D9DF;
    BIT.W Ridley.YSpeed                                                  ;A6D9E2;
    BMI .movingUp                                                        ;A6D9E5;
    LSR                                                                  ;A6D9E7;

  .movingUp:
    STA.L Ridley.wingFlapSpeed                                           ;A6D9E8;
    RTS                                                                  ;A6D9EC;

  .wingFlapSpeeds:
    dw $000C,$000E,$0010,$0012,$001C,$0020,$0028,$0030                   ;A6D9ED;


;;; $D9FD:  ;;;
InitializeRibAnimation:
    LDA.W #RidleyRib_AnimationData                                       ;A6D9FD;
    STA.L Ridley.ribsAnimationIndex                                      ;A6DA00;
    LDA.W #$0001                                                         ;A6DA04;
    STA.L Ridley.ribsAnimationTimer                                      ;A6DA07;

  .return:
    RTS                                                                  ;A6DA0B;


;;; $DA0C:  ;;;
AnimateRidleysRibs:
; Animate Ridley's ribs
    LDA.L Ridley.ribsAnimationTimer                                      ;A6DA0C;
    DEC                                                                  ;A6DA10;
    STA.L Ridley.ribsAnimationTimer                                      ;A6DA11;
    BNE InitializeRibAnimation_return                                    ;A6DA15;
    LDA.L Ridley.ribsAnimationIndex                                      ;A6DA17;

  .loop:
    TAX                                                                  ;A6DA1B;
    LDA.W $0000,X                                                        ;A6DA1C;
    BPL .timer                                                           ;A6DA1F;
    STA.L Ridley.ribsAnimationIndex                                      ;A6DA21;
    BRA .loop                                                            ;A6DA25;

  .timer:
    STA.L Ridley.ribsAnimationTimer                                      ;A6DA27;
    LDY.W VRAMWriteStack                                                 ;A6DA2B;
    LDA.W #Tiles_RidleysRibsAndClaws_0>>8&$FF00                          ;A6DA2E;
    STA.W VRAMWrite.src+1,Y                                              ;A6DA31; >.<
    STA.W VRAMWrite[1].src+1,Y                                           ;A6DA34; >.<
    LDA.W $0002,X                                                        ;A6DA37;
    STA.W VRAMWrite.src,Y                                                ;A6DA3A; >.<
    LDA.W $0004,X                                                        ;A6DA3D;
    STA.W VRAMWrite[1].src,Y                                             ;A6DA40; >.<
    LDA.W #$7220                                                         ;A6DA43;
    STA.W VRAMWrite.dest,Y                                               ;A6DA46; >.<
    LDA.W #$7320                                                         ;A6DA49;
    STA.W VRAMWrite[1].dest,Y                                            ;A6DA4C; >.<
    LDA.W #$0040                                                         ;A6DA4F;
    STA.W VRAMWrite.size,Y                                               ;A6DA52; >.<
    STA.W VRAMWrite[1].size,Y                                            ;A6DA55; >.<
    TYA                                                                  ;A6DA58;
    CLC                                                                  ;A6DA59;
    ADC.W #$000E                                                         ;A6DA5A;
    TAY                                                                  ;A6DA5D;
    STY.W VRAMWriteStack                                                 ;A6DA5E;
    LDA.W #$0000                                                         ;A6DA61;
    STA.W VRAMWrite.size,Y                                               ;A6DA64;
    TXA                                                                  ;A6DA67;
    CLC                                                                  ;A6DA68;
    ADC.W #$0006                                                         ;A6DA69;
    STA.L Ridley.ribsAnimationIndex                                      ;A6DA6C;
    RTS                                                                  ;A6DA70;


RidleyRib_AnimationData:
; timer, src0, src1 (bank $B0)
    dw $0014                                                             ;A6DA71;
    dw Tiles_Ridley_1                                                    ;A6DA73;
    dw Tiles_Ridley_2                                                    ;A6DA75;

    dw $0014                                                             ;A6DA77;
    dw Tiles_RidleysRibsAndClaws_0                                       ;A6DA79;
    dw Tiles_RidleysRibsAndClaws_3                                       ;A6DA7B;

    dw $0014                                                             ;A6DA7D;
    dw Tiles_RidleysRibsAndClaws_1                                       ;A6DA7F;
    dw Tiles_RidleysRibsAndClaws_4                                       ;A6DA81;

    dw $0014                                                             ;A6DA83;
    dw Tiles_RidleysRibsAndClaws_0                                       ;A6DA85;
    dw Tiles_RidleysRibsAndClaws_3                                       ;A6DA87;


if !FEATURE_KEEP_UNREFERENCED
UNUSED_RidleyRibAnimationDataPointer_A6DA89:
; indexed by Ridley.ribsAnimationIndex
    dw RidleyRib_AnimationData                                           ;A6DA89; Unused?
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $DA8B:  ;;;
TransferGraphicsForRidleysClawsHoldingSamusOrBabyMetroid:
    LDX.W #RidleyClawGraphicsPointers_released                           ;A6DA8B;
    BCC .notHolding                                                      ;A6DA8E;
    LDX.W #RidleyClawGraphicsPointers_holding                            ;A6DA90;

  .notHolding:
    LDY.W VRAMWriteStack                                                 ;A6DA93;
    LDA.W #Tiles_RidleysRibsAndClaws_0>>8&$FF00                          ;A6DA96;
    STA.W VRAMWrite.src+1,Y                                              ;A6DA99; >.<
    STA.W VRAMWrite[1].src+1,Y                                           ;A6DA9C; >.<
    LDA.W $0000,X                                                        ;A6DA9F;
    STA.W VRAMWrite.src,Y                                                ;A6DAA2; >.<
    LDA.W $0002,X                                                        ;A6DAA5;
    STA.W VRAMWrite[1].src,Y                                             ;A6DAA8; >.<
    LDA.W #$7AC0                                                         ;A6DAAB;
    STA.W VRAMWrite.dest,Y                                               ;A6DAAE; >.<
    LDA.W #$7BC0                                                         ;A6DAB1;
    STA.W VRAMWrite[1].dest,Y                                            ;A6DAB4; >.<
    LDA.W #$0080                                                         ;A6DAB7;
    STA.W VRAMWrite.size,Y                                               ;A6DABA; >.<
    STA.W VRAMWrite[1].size,Y                                            ;A6DABD; >.<
    TYA                                                                  ;A6DAC0;
    CLC                                                                  ;A6DAC1;
    ADC.W #$000E                                                         ;A6DAC2;
    TAY                                                                  ;A6DAC5;
    STY.W VRAMWriteStack                                                 ;A6DAC6;
    LDA.W #$0000                                                         ;A6DAC9;
    STA.W VRAMWrite.size,Y                                               ;A6DACC;
    RTS                                                                  ;A6DACF;

; src0, src1 (bank $B0)
RidleyClawGraphicsPointers_released:
    dw Tiles_Ridley_3                                                    ;A6DAD0;
    dw Tiles_Ridley_4                                                    ;A6DAD2;

RidleyClawGraphicsPointers_holding:
    dw Tiles_RidleysRibsAndClaws_2                                       ;A6DAD4;
    dw Tiles_RidleysRibsAndClaws_5                                       ;A6DAD6;


;;; $DAD8:  ;;;
DrawRidleysWings:
; Drawing routine for Ridley's wings
    LDA.L Ridley.facingDirection                                         ;A6DAD8;
    BEQ .facingLeft                                                      ;A6DADC;
    DEC                                                                  ;A6DADE;
    BEQ .return                                                          ;A6DADF;
    LDA.W #$000A                                                         ;A6DAE1;

  .facingLeft:
    CLC                                                                  ;A6DAE4;
    ADC.L Ridley.wingFlapFrame                                           ;A6DAE5;
    ASL                                                                  ;A6DAE9;
    TAX                                                                  ;A6DAEA;
    LDY.W .spritemapPointersLeft,X                                       ;A6DAEB;
    LDA.L Ridley.wingTailPalette                                         ;A6DAEE;
    STA.B $16                                                            ;A6DAF2;
    LDA.W Enemy.XPosition                                                ;A6DAF4;
    STA.B $12                                                            ;A6DAF7;
    LDA.W Enemy.YPosition                                                ;A6DAF9;
    STA.B $14                                                            ;A6DAFC;
    JMP.W RidleyGeneralUseDrawing                                        ;A6DAFE;

  .return:
    RTS                                                                  ;A6DB01;

  .spritemapPointersLeft:
    dw Spritemap_RidleyWings_FacingLeft_FullyRaised                      ;A6DB02;
    dw Spritemap_RidleyWings_FacingLeft_MostlyRaised                     ;A6DB04;
    dw Spritemap_RidleyWings_FacingLeft_SlightlyRaised                   ;A6DB06;
    dw Spritemap_RidleyWings_FacingLeft_SlightlyLowered                  ;A6DB08;
    dw Spritemap_RidleyWings_FacingLeft_MostlyLowered                    ;A6DB0A;
    dw Spritemap_RidleyWings_FacingLeft_FullyLowered                     ;A6DB0C;
    dw Spritemap_RidleyWings_FacingLeft_MostlyLowered                    ;A6DB0E;
    dw Spritemap_RidleyWings_FacingLeft_SlightlyLowered                  ;A6DB10;
    dw Spritemap_RidleyWings_FacingLeft_SlightlyRaised                   ;A6DB12;
    dw Spritemap_RidleyWings_FacingLeft_MostlyRaised                     ;A6DB14;

  .spritemapPointersRight:
    dw Spritemap_RidleyWings_FacingRight_FullyRaised                     ;A6DB16;
    dw Spritemap_RidleyWings_FacingRight_MostlyRaised                    ;A6DB18;
    dw Spritemap_RidleyWings_FacingRight_SlightlyRaised                  ;A6DB1A;
    dw Spritemap_RidleyWings_FacingRight_SlightlyLowered                 ;A6DB1C;
    dw Spritemap_RidleyWings_FacingRight_MostlyLowered                   ;A6DB1E;
    dw Spritemap_RidleyWings_FacingRight_FullyLowered                    ;A6DB20;
    dw Spritemap_RidleyWings_FacingRight_MostlyLowered                   ;A6DB22;
    dw Spritemap_RidleyWings_FacingRight_SlightlyLowered                 ;A6DB24;
    dw Spritemap_RidleyWings_FacingRight_SlightlyRaised                  ;A6DB26;
    dw Spritemap_RidleyWings_FacingRight_MostlyRaised                    ;A6DB28;


;;; $DB2A:  ;;;
DrawRidleyTail:
; Draw tail
    LDA.W Enemy.properties                                               ;A6DB2A;
    AND.W #$0100                                                         ;A6DB2D;
    BEQ .notInvisible                                                    ;A6DB30;
    RTS                                                                  ;A6DB32;

  .notInvisible:
    LDA.L Ridley.tailTipXPosition                                        ;A6DB33;
    STA.B $12                                                            ;A6DB37;
    LDA.L Ridley.tailTipYPosition                                        ;A6DB39;
    STA.B $14                                                            ;A6DB3D;
    LDA.L Ridley.tailTipAngle                                            ;A6DB3F;
    CLC                                                                  ;A6DB43;
    ADC.L Ridley.tail6Angle                                              ;A6DB44;
    CLC                                                                  ;A6DB48;
    ADC.W #$0008                                                         ;A6DB49;
    AND.W #$00F0                                                         ;A6DB4C;
    LSR                                                                  ;A6DB4F;
    LSR                                                                  ;A6DB50;
    LSR                                                                  ;A6DB51;
    TAX                                                                  ;A6DB52;
    LDY.W RidleyTailTipSpritemapPointers,X                               ;A6DB53;
    JSR.W GeneralPurposeRidleyDrawing_SetPalette                         ;A6DB56;
    LDA.L Ridley.tail6YPosition                                          ;A6DB59;
    STA.B $14                                                            ;A6DB5D;
    LDA.L Ridley.tail6XPosition                                          ;A6DB5F;
    STA.B $12                                                            ;A6DB63;
    LDY.W #Spritemap_RidleyTail_Small                                    ;A6DB65;
    JSR.W GeneralPurposeRidleyDrawing_SetPalette                         ;A6DB68;
    LDA.L Ridley.tail5XPosition                                          ;A6DB6B;
    STA.B $12                                                            ;A6DB6F;
    LDA.L Ridley.tail5YPosition                                          ;A6DB71;
    STA.B $14                                                            ;A6DB75;
    LDY.W #Spritemap_RidleyTail_Small                                    ;A6DB77;
    JSR.W GeneralPurposeRidleyDrawing_SetPalette                         ;A6DB7A;
    LDA.L Ridley.tail4XPosition                                          ;A6DB7D;
    STA.B $12                                                            ;A6DB81;
    LDA.L Ridley.tail4YPosition                                          ;A6DB83;
    STA.B $14                                                            ;A6DB87;
    LDY.W #Spritemap_RidleyTail_Medium                                   ;A6DB89;
    JSR.W GeneralPurposeRidleyDrawing_SetPalette                         ;A6DB8C;
    LDA.L Ridley.tail3XPosition                                          ;A6DB8F;
    STA.B $12                                                            ;A6DB93;
    LDA.L Ridley.tail3YPosition                                          ;A6DB95;
    STA.B $14                                                            ;A6DB99;
    LDY.W #Spritemap_RidleyTail_Medium                                   ;A6DB9B;
    JSR.W GeneralPurposeRidleyDrawing_SetPalette                         ;A6DB9E;
    LDA.L Ridley.tail2XPosition                                          ;A6DBA1;
    STA.B $12                                                            ;A6DBA5;
    LDA.L Ridley.tail2YPosition                                          ;A6DBA7;
    STA.B $14                                                            ;A6DBAB;
    LDY.W #Spritemap_RidleyTail_Large                                    ;A6DBAD;
    JSR.W GeneralPurposeRidleyDrawing_SetPalette                         ;A6DBB0;
    LDA.L Ridley.tail1XPosition                                          ;A6DBB3;
    STA.B $12                                                            ;A6DBB7;
    LDA.L Ridley.tail1YPosition                                          ;A6DBB9;
    STA.B $14                                                            ;A6DBBD;
    LDY.W #Spritemap_RidleyTail_Large                                    ;A6DBBF; fallthrough to GeneralPurposeRidleyDrawing


;;; $DBC2:  ;;;
GeneralPurposeRidleyDrawing_SetPalette:
; General use draw, 7E7818 has pallete (wing/tail), Y is pointer to sprite data
    LDA.L Ridley.wingTailPalette                                         ;A6DBC2;
    STA.B $16                                                            ;A6DBC6;
    JMP.W RidleyGeneralUseDrawing                                        ;A6DBC8;


;;; $DBCB:  ;;;
GetBabyMetroidSpritemapPointerFromInstList:
; Calculate graphic to use.
; JSR to with an address (in ram) of a pointer followed by a counter,
; data at pointer (to rom) should be a counter (frame duration) followed by a graphic pointer,
; OR a pointer to code.
    STA.B $00                                                            ;A6DBCB;
    INC                                                                  ;A6DBCD;
    INC                                                                  ;A6DBCE;
    STA.B $03                                                            ;A6DBCF;
    SEP #$20                                                             ;A6DBD1;
    LDA.B #$7E                                                           ;A6DBD3;
    STA.B $02                                                            ;A6DBD5;
    STA.B $05                                                            ;A6DBD7;
    REP #$20                                                             ;A6DBD9;
    LDA.B [$00]                                                          ;A6DBDB;
    BMI .pointer                                                         ;A6DBDD;
    PLA                                                                  ;A6DBDF;
    RTS                                                                  ;A6DBE0;

  .pointer:
    TAX                                                                  ;A6DBE1;
    LDA.W $0000,X                                                        ;A6DBE2;
    BMI .instruction                                                     ;A6DBE5;
    CMP.B [$03]                                                          ;A6DBE7;
    BNE .timerDoesNotMatchCounter                                        ;A6DBE9;
    INX                                                                  ;A6DBEB;
    INX                                                                  ;A6DBEC;
    INX                                                                  ;A6DBED;
    INX                                                                  ;A6DBEE;

  .manualReturn:
    LDA.W $0000,X                                                        ;A6DBEF;
    BPL .notInstruction                                                  ;A6DBF2;

  .instruction:
    STA.B $06                                                            ;A6DBF4;
    INX                                                                  ;A6DBF6;
    INX                                                                  ;A6DBF7;
    PEA.W .manualReturn-1                                                ;A6DBF8;
    JMP.W ($0006)                                                        ;A6DBFB;

  .notInstruction:
    LDA.W #$0001                                                         ;A6DBFE;
    STA.B [$03]                                                          ;A6DC01;
    TXA                                                                  ;A6DC03;
    STA.B [$00]                                                          ;A6DC04;
    LDY.W $0002,X                                                        ;A6DC06;
    RTS                                                                  ;A6DC09;

  .timerDoesNotMatchCounter:
    LDA.B [$03]                                                          ;A6DC0A;
    INC                                                                  ;A6DC0C;
    STA.B [$03]                                                          ;A6DC0D;
    LDY.W $0002,X                                                        ;A6DC0F;
    RTS                                                                  ;A6DC12;


;;; $DC13:  ;;;
RidleyGeneralUseDrawing:
; General use draw, $16 has pallete, Y is pointer to sprite data.
    LDA.W $0000,Y                                                        ;A6DC13;
    INY                                                                  ;A6DC16;
    INY                                                                  ;A6DC17;
    STA.B $18                                                            ;A6DC18;
    LDX.W OAMStack                                                       ;A6DC1A;
    CLC                                                                  ;A6DC1D;

  .loop:
    LDA.W $0001,Y                                                        ;A6DC1E;
    AND.W #$FF00                                                         ;A6DC21;
    BPL +                                                                ;A6DC24;
    ORA.W #$00FF                                                         ;A6DC26;

+   XBA                                                                  ;A6DC29;
    CLC                                                                  ;A6DC2A;
    ADC.B $14                                                            ;A6DC2B;
    SEC                                                                  ;A6DC2D;
    SBC.W Layer1YPosition                                                ;A6DC2E;
    BMI .next                                                            ;A6DC31;
    CMP.W #$00E0                                                         ;A6DC33;
    BPL .next                                                            ;A6DC36;
    STA.B $1A                                                            ;A6DC38;
    LDA.W $0000,Y                                                        ;A6DC3A;
    ADC.B $12                                                            ;A6DC3D;
    SEC                                                                  ;A6DC3F;
    SBC.W Layer1XPosition                                                ;A6DC40;
    STA.W OAMLow,X                                                       ;A6DC43;
    AND.W #$0100                                                         ;A6DC46;
    BEQ +                                                                ;A6DC49;
    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;A6DC4B;
    STA.B $1C                                                            ;A6DC4F;
    LDA.B ($1C)                                                          ;A6DC51;
    ORA.L MapOfOAMIndex_highXPosBit,X                                    ;A6DC53;
    STA.B ($1C)                                                          ;A6DC57;

+   LDA.W $0000,Y                                                        ;A6DC59;
    BPL +                                                                ;A6DC5C;
    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;A6DC5E;
    STA.B $1C                                                            ;A6DC62;
    LDA.B ($1C)                                                          ;A6DC64;
    ORA.L MapOfOAMIndex_sizeBit,X                                        ;A6DC66;
    STA.B ($1C)                                                          ;A6DC6A;

+   LDA.B $1A                                                            ;A6DC6C;
    STA.W OAMLow+1,X                                                     ;A6DC6E;
    LDA.W $0003,Y                                                        ;A6DC71;
    ORA.B $16                                                            ;A6DC74;
    STA.W OAMLow+2,X                                                     ;A6DC76;
    TXA                                                                  ;A6DC79;
    CLC                                                                  ;A6DC7A;
    ADC.W #$0004                                                         ;A6DC7B;
    AND.W #$01FF                                                         ;A6DC7E;
    TAX                                                                  ;A6DC81;

  .next:
    TYA                                                                  ;A6DC82;
    CLC                                                                  ;A6DC83;
    ADC.W #$0005                                                         ;A6DC84;
    TAY                                                                  ;A6DC87;
    DEC.B $18                                                            ;A6DC88;
    BNE .loop                                                            ;A6DC8A;
    STX.W OAMStack                                                       ;A6DC8C;
    RTS                                                                  ;A6DC8F;


;;; $DC90: Spritemaps ;;;
Spritemap_RidleyTail_Large:
    dw $0001                                                             ;A6DC90;
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $1E0)

Spritemap_RidleyTail_Medium:
    dw $0001                                                             ;A6DC97;
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $1E2)

Spritemap_RidleyTail_Small:
    dw $0001                                                             ;A6DC9E;
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $1E4)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_RidleyTail_Large_A6DCA5:
    dw $0001                                                             ;A6DCA5;
    %spritemapEntry(1, $43F8, $F8, 0, 1, 3, 0, $1E0)

UNUSED_Spritemap_RidleyTail_Medium_A6DCAC:
    dw $0001                                                             ;A6DCAC;
    %spritemapEntry(1, $43F8, $F8, 0, 1, 3, 0, $1E2)

UNUSED_Spritemap_RidleyTail_Small_A6DCB3:
    dw $0001                                                             ;A6DCB3;
    %spritemapEntry(1, $43F8, $F8, 0, 1, 3, 0, $1E4)
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $DCBA: Spritemap pointers ;;;
RidleyTailTipSpritemapPointers:
    dw Spritemap_RidleyTailTip_PointingDown                              ;A6DCBA;
    dw Spritemap_RidleyTailTip_PointingDownDownRight                     ;A6DCBC;
    dw Spritemap_RidleyTailTip_PointingDownRight                         ;A6DCBE;
    dw Spritemap_RidleyTailTip_PointingRightDownRight                    ;A6DCC0;
    dw Spritemap_RidleyTailTip_PointingRight                             ;A6DCC2;
    dw Spritemap_RidleyTailTip_PointingRightUpRight                      ;A6DCC4;
    dw Spritemap_RidleyTailTip_PointingUpRight                           ;A6DCC6;
    dw Spritemap_RidleyTailTip_PointingUpUpRight                         ;A6DCC8;
    dw Spritemap_RidleyTailTip_PointingUp                                ;A6DCCA;
    dw Spritemap_RidleyTailTip_PointingUpUpLeft                          ;A6DCCC;
    dw Spritemap_RidleyTailTip_PointingUpLeft                            ;A6DCCE;
    dw Spritemap_RidleyTailTip_PointingLeftUpLeft                        ;A6DCD0;
    dw Spritemap_RidleyTailTip_PointingLeft                              ;A6DCD2;
    dw Spritemap_RidleyTailTip_PointingLeftDownLeft                      ;A6DCD4;
    dw Spritemap_RidleyTailTip_PointingDownLeft                          ;A6DCD6;
    dw Spritemap_RidleyTailTip_PointingDownDownLeft                      ;A6DCD8;


;;; $DCDA: Spritemaps ;;;
Spritemap_RidleyTailTip_PointingLeft:
    dw $0001                                                             ;A6DCDA;
    %spritemapEntry(1, $43F0, $F8, 0, 0, 3, 0, $1E6)

Spritemap_RidleyTailTip_PointingLeftUpLeft:
    dw $0001                                                             ;A6DCE1;
    %spritemapEntry(1, $43F0, $F4, 0, 0, 3, 0, $1E8)

Spritemap_RidleyTailTip_PointingUpLeft:
    dw $0001                                                             ;A6DCE8;
    %spritemapEntry(1, $43F2, $F3, 0, 0, 3, 0, $1EA)

Spritemap_RidleyTailTip_PointingUpUpLeft:
    dw $0001                                                             ;A6DCEF;
    %spritemapEntry(1, $43F4, $F0, 0, 0, 3, 0, $1EC)

Spritemap_RidleyTailTip_PointingUp:
    dw $0001                                                             ;A6DCF6;
    %spritemapEntry(1, $43F8, $F0, 0, 0, 3, 0, $1EE)

Spritemap_RidleyTailTip_PointingUpUpRight:
    dw $0001                                                             ;A6DCFD;
    %spritemapEntry(1, $43FC, $F0, 0, 1, 3, 0, $1EC)

Spritemap_RidleyTailTip_PointingUpRight:
    dw $0001                                                             ;A6DD04;
    %spritemapEntry(1, $43FE, $F3, 0, 1, 3, 0, $1EA)

Spritemap_RidleyTailTip_PointingRightUpRight:
    dw $0001                                                             ;A6DD0B;
    %spritemapEntry(1, $4200, $F4, 0, 1, 3, 0, $1E8)

Spritemap_RidleyTailTip_PointingRight:
    dw $0001                                                             ;A6DD12;
    %spritemapEntry(1, $4200, $F8, 0, 1, 3, 0, $1E6)

Spritemap_RidleyTailTip_PointingRightDownRight:
    dw $0001                                                             ;A6DD19;
    %spritemapEntry(1, $4200, $FC, 1, 1, 3, 0, $1E8)

Spritemap_RidleyTailTip_PointingDownRight:
    dw $0001                                                             ;A6DD20;
    %spritemapEntry(1, $43FE, $FE, 1, 1, 3, 0, $1EA)

Spritemap_RidleyTailTip_PointingDownDownRight:
    dw $0001                                                             ;A6DD27;
    %spritemapEntry(1, $43FC, $00, 1, 1, 3, 0, $1EC)

Spritemap_RidleyTailTip_PointingDown:
    dw $0001                                                             ;A6DD2E;
    %spritemapEntry(1, $43F9, $00, 1, 1, 3, 0, $1EE)

Spritemap_RidleyTailTip_PointingDownDownLeft:
    dw $0001                                                             ;A6DD35;
    %spritemapEntry(1, $43F4, $FF, 1, 0, 3, 0, $1EC)

Spritemap_RidleyTailTip_PointingDownLeft:
    dw $0001                                                             ;A6DD3C;
    %spritemapEntry(1, $43F2, $FE, 1, 0, 3, 0, $1EA)

Spritemap_RidleyTailTip_PointingLeftDownLeft:
    dw $0001                                                             ;A6DD43;
    %spritemapEntry(1, $43F0, $FC, 1, 0, 3, 0, $1E8)

Spritemap_RidleyWings_FacingLeft_FullyRaised:
    dw $0006                                                             ;A6DD4A;
    %spritemapEntry(0, $2C, $D7, 0, 0, 3, 0, $108)
    %spritemapEntry(0, $0C, $EF, 0, 0, 3, 0, $128)
    %spritemapEntry(1, $421C, $DF, 0, 0, 3, 0, $116)
    %spritemapEntry(1, $420C, $DF, 0, 0, 3, 0, $114)
    %spritemapEntry(1, $421C, $D7, 0, 0, 3, 0, $106)
    %spritemapEntry(1, $420C, $D7, 0, 0, 3, 0, $104)

Spritemap_RidleyWings_FacingLeft_MostlyRaised:
    dw $0005                                                             ;A6DD6A;
    %spritemapEntry(0, $2C, $E4, 0, 0, 3, 0, $11D)
    %spritemapEntry(1, $421C, $E4, 0, 0, 3, 0, $11B)
    %spritemapEntry(1, $420C, $E4, 0, 0, 3, 0, $119)
    %spritemapEntry(1, $421C, $DC, 0, 0, 3, 0, $10B)
    %spritemapEntry(1, $420C, $DC, 0, 0, 3, 0, $109)

Spritemap_RidleyWings_FacingLeft_SlightlyRaised:
    dw $0003                                                             ;A6DD85;
    %spritemapEntry(0, $2C, $F0, 0, 0, 3, 0, $148)
    %spritemapEntry(1, $421C, $E8, 0, 0, 3, 0, $136)
    %spritemapEntry(1, $420C, $E8, 0, 0, 3, 0, $134)

Spritemap_RidleyWings_FacingLeft_SlightlyLowered:
    dw $0003                                                             ;A6DD96;
    %spritemapEntry(0, $2C, $E8, 1, 0, 3, 0, $148)
    %spritemapEntry(1, $421C, $E8, 1, 0, 3, 0, $136)
    %spritemapEntry(1, $420C, $E8, 1, 0, 3, 0, $134)

Spritemap_RidleyWings_FacingLeft_MostlyLowered:
    dw $0005                                                             ;A6DDA7;
    %spritemapEntry(0, $2C, $F2, 1, 0, 3, 0, $11D)
    %spritemapEntry(1, $421C, $EA, 1, 0, 3, 0, $11B)
    %spritemapEntry(1, $420C, $EA, 1, 0, 3, 0, $119)
    %spritemapEntry(1, $421C, $F2, 1, 0, 3, 0, $10B)
    %spritemapEntry(1, $420C, $F2, 1, 0, 3, 0, $109)

Spritemap_RidleyWings_FacingLeft_FullyLowered:
    dw $0006                                                             ;A6DDC2;
    %spritemapEntry(0, $2C, $FF, 1, 0, 3, 0, $108)
    %spritemapEntry(0, $0C, $E7, 1, 0, 3, 0, $128)
    %spritemapEntry(1, $421C, $EF, 1, 0, 3, 0, $116)
    %spritemapEntry(1, $420C, $EF, 1, 0, 3, 0, $114)
    %spritemapEntry(1, $421C, $F7, 1, 0, 3, 0, $106)
    %spritemapEntry(1, $420C, $F7, 1, 0, 3, 0, $104)

Spritemap_RidleyWings_FacingRight_FullyRaised:
    dw $0006                                                             ;A6DDE2;
    %spritemapEntry(0, $1CC, $D7, 0, 1, 3, 0, $108)
    %spritemapEntry(0, $1EC, $EF, 0, 1, 3, 0, $128)
    %spritemapEntry(1, $43D4, $DF, 0, 1, 3, 0, $116)
    %spritemapEntry(1, $43E4, $DF, 0, 1, 3, 0, $114)
    %spritemapEntry(1, $43D4, $D7, 0, 1, 3, 0, $106)
    %spritemapEntry(1, $43E4, $D7, 0, 1, 3, 0, $104)

Spritemap_RidleyWings_FacingRight_MostlyRaised:
    dw $0005                                                             ;A6DE02;
    %spritemapEntry(0, $1CC, $E4, 0, 1, 3, 0, $11D)
    %spritemapEntry(1, $43D4, $E4, 0, 1, 3, 0, $11B)
    %spritemapEntry(1, $43E4, $E4, 0, 1, 3, 0, $119)
    %spritemapEntry(1, $43D4, $DC, 0, 1, 3, 0, $10B)
    %spritemapEntry(1, $43E4, $DC, 0, 1, 3, 0, $109)

Spritemap_RidleyWings_FacingRight_SlightlyRaised:
    dw $0003                                                             ;A6DE1D;
    %spritemapEntry(0, $1CC, $F0, 0, 1, 3, 0, $148)
    %spritemapEntry(1, $43D4, $E8, 0, 1, 3, 0, $136)
    %spritemapEntry(1, $43E4, $E8, 0, 1, 3, 0, $134)

Spritemap_RidleyWings_FacingRight_SlightlyLowered:
    dw $0003                                                             ;A6DE2E;
    %spritemapEntry(0, $1CC, $E8, 1, 1, 3, 0, $148)
    %spritemapEntry(1, $43D4, $E8, 1, 1, 3, 0, $136)
    %spritemapEntry(1, $43E4, $E8, 1, 1, 3, 0, $134)

Spritemap_RidleyWings_FacingRight_MostlyLowered:
    dw $0005                                                             ;A6DE3F;
    %spritemapEntry(0, $1CC, $F2, 1, 1, 3, 0, $11D)
    %spritemapEntry(1, $43D4, $EA, 1, 1, 3, 0, $11B)
    %spritemapEntry(1, $43E4, $EA, 1, 1, 3, 0, $119)
    %spritemapEntry(1, $43D4, $F2, 1, 1, 3, 0, $10B)
    %spritemapEntry(1, $43E4, $F2, 1, 1, 3, 0, $109)

Spritemap_RidleyWings_FacingRight_FullyLowered:
    dw $0006                                                             ;A6DE5A;
    %spritemapEntry(0, $1CC, $FF, 1, 1, 3, 0, $108)
    %spritemapEntry(0, $1EC, $E7, 1, 1, 3, 0, $128)
    %spritemapEntry(1, $43D4, $EF, 1, 1, 3, 0, $116)
    %spritemapEntry(1, $43E4, $EF, 1, 1, 3, 0, $114)
    %spritemapEntry(1, $43D4, $F7, 1, 1, 3, 0, $106)
    %spritemapEntry(1, $43E4, $F7, 1, 1, 3, 0, $104)


;;; $DE7A:  ;;;
CheckIfRidleyIsOnScreen:
; Checks if Ridley is on screen
    LDA.W Enemy.YPosition                                                ;A6DE7A;
    BMI .offScreen                                                       ;A6DE7D;
    CLC                                                                  ;A6DE7F;
    ADC.W #$0020                                                         ;A6DE80;
    SEC                                                                  ;A6DE83;
    SBC.W Layer1YPosition                                                ;A6DE84;
    BMI .offScreen                                                       ;A6DE87;
    CMP.W #$0120                                                         ;A6DE89;
    BPL .offScreen                                                       ;A6DE8C;
    LDA.W Enemy.XPosition                                                ;A6DE8E;
    BMI .offScreen                                                       ;A6DE91;
    CLC                                                                  ;A6DE93;
    ADC.W #$0020                                                         ;A6DE94;
    SEC                                                                  ;A6DE97;
    SBC.W Layer1XPosition                                                ;A6DE98;
    BMI .offScreen                                                       ;A6DE9B;
    CMP.W #$0140                                                         ;A6DE9D;
    BPL .offScreen                                                       ;A6DEA0;
    CLC                                                                  ;A6DEA2;
    RTS                                                                  ;A6DEA3;

  .offScreen:
    SEC                                                                  ;A6DEA4;
    RTS                                                                  ;A6DEA5;


;;; $DEA6:  ;;;
RidleyTail_vs_SamusProjectile_CollisionDetection:
; Check Tail/Projectile collisions
    LDA.W SamusProjectile_ProjectileCounter                              ;A6DEA6;
    BNE .projectilesToCheck                                              ;A6DEA9;
    CLC                                                                  ;A6DEAB;
    RTS                                                                  ;A6DEAC;

  .projectilesToCheck:
    LDY.W #$0000                                                         ;A6DEAD;

  .loop:
    LDA.W SamusProjectile_Types,Y                                        ;A6DEB0;
    BPL .nextProjectile                                                  ;A6DEB3;
    XBA                                                                  ;A6DEB5;
    AND.W #$000F                                                         ;A6DEB6;
    CMP.W #$0003                                                         ;A6DEB9;
    BPL .nextProjectile                                                  ;A6DEBC;
    LDA.W SamusProjectile_XPositions,Y                                   ;A6DEBE;
    SEC                                                                  ;A6DEC1;
    SBC.B $12                                                            ;A6DEC2;
    BPL +                                                                ;A6DEC4;
    EOR.W #$FFFF                                                         ;A6DEC6;
    INC                                                                  ;A6DEC9;

+   SEC                                                                  ;A6DECA;
    SBC.W SamusProjectile_XRadii,Y                                       ;A6DECB;
    BCC .checkYPosition                                                  ;A6DECE;
    CMP.B $16                                                            ;A6DED0;
    BCS .nextProjectile                                                  ;A6DED2;

  .checkYPosition:
    LDA.W SamusProjectile_YPositions,Y                                   ;A6DED4;
    SEC                                                                  ;A6DED7;
    SBC.B $14                                                            ;A6DED8;
    BPL +                                                                ;A6DEDA;
    EOR.W #$FFFF                                                         ;A6DEDC;
    INC                                                                  ;A6DEDF;

+   SEC                                                                  ;A6DEE0;
    SBC.W SamusProjectile_YRadii,Y                                       ;A6DEE1;
    BCC .collision                                                       ;A6DEE4;
    CMP.B $18                                                            ;A6DEE6;
    BCC .collision                                                       ;A6DEE8;

  .nextProjectile:
    INY                                                                  ;A6DEEA;
    INY                                                                  ;A6DEEB;
    CPY.W #$000A                                                         ;A6DEEC;
    BMI .loop                                                            ;A6DEEF;
    CLC                                                                  ;A6DEF1;
    RTS                                                                  ;A6DEF2;

  .collision:
    LDA.B $12                                                            ;A6DEF3;
    STA.W SamusProjectile_XPositions,Y                                   ;A6DEF5;
    LDA.B $14                                                            ;A6DEF8;
    STA.W SamusProjectile_YPositions,Y                                   ;A6DEFA;
    LDA.W SamusProjectile_Directions,Y                                   ;A6DEFD;
    ORA.W #$0010                                                         ;A6DF00;
    STA.W SamusProjectile_Directions,Y                                   ;A6DF03;
    SEC                                                                  ;A6DF06;
    RTS                                                                  ;A6DF07;


if !FEATURE_KEEP_UNREFERENCED
;;; $DF08:  ;;;
UNUSED_ChangeRidleyProjectileDirection_A6DF08:
    LDA.W SamusProjectile_Directions,Y                                   ;A6DF08;
    AND.W #$000F                                                         ;A6DF0B;
    CMP.W #$0007                                                         ;A6DF0E;
    BNE .notFacingLeft                                                   ;A6DF11;
    LDA.W #$0001                                                         ;A6DF13;
    BRA .done                                                            ;A6DF16;

  .notFacingLeft:
    CMP.W #$0002                                                         ;A6DF18;
    BNE .notLeftOrRight                                                  ;A6DF1B;
    LDA.W #$0008                                                         ;A6DF1D;
    BRA .done                                                            ;A6DF20;

  .notLeftOrRight:
    LDA.W #$0005                                                         ;A6DF22;

  .done:
    STA.W SamusProjectile_Directions,Y                                   ;A6DF25;
    RTS                                                                  ;A6DF28;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $DF29:  ;;;
EfficientCollisionDetectionForSamusAt_12_14:
; Efficient collision detection for Samus and $12/$14 (size of $12/$14 is $16/$18). SEC if collision
    LDA.W SamusXPosition                                                 ;A6DF29;
    SEC                                                                  ;A6DF2C;
    SBC.B $12                                                            ;A6DF2D;
    BPL +                                                                ;A6DF2F;
    EOR.W #$FFFF                                                         ;A6DF31;
    INC                                                                  ;A6DF34;

+   SEC                                                                  ;A6DF35;
    SBC.W SamusXRadius                                                   ;A6DF36;
    BCC +                                                                ;A6DF39;
    CMP.B $16                                                            ;A6DF3B;
    BCS .returnNoCollision                                               ;A6DF3D;

+   LDA.W SamusYPosition                                                 ;A6DF3F;
    SEC                                                                  ;A6DF42;
    SBC.B $14                                                            ;A6DF43;
    BPL +                                                                ;A6DF45;
    EOR.W #$FFFF                                                         ;A6DF47;
    INC                                                                  ;A6DF4A;

+   SEC                                                                  ;A6DF4B;
    SBC.W SamusYRadius                                                   ;A6DF4C;
    BCC .returnCollision                                                 ;A6DF4F;
    CMP.B $18                                                            ;A6DF51;
    BCC .returnCollision                                                 ;A6DF53;

  .returnNoCollision:
    CLC                                                                  ;A6DF55;
    RTS                                                                  ;A6DF56;

  .returnCollision:
    SEC                                                                  ;A6DF57;
    RTS                                                                  ;A6DF58;


RidleyHitbox_vs_Samus_Collision:
    JSL.L NormalEnemyTouchAI_NoDeathCheck_External                       ;A6DF59;
    JMP.W RTL_A6DFB6                                                     ;A6DF5D; >.<


if !FEATURE_KEEP_UNREFERENCED
;;; $DF60:  ;;;
UNUSED_RidleyDamagesSamus_A6DF60:
    JSR.W UNUSED_RidleyDamagesSamus_A6DF66                               ;A6DF60;
    JMP.W RTL_A6DFB6                                                     ;A6DF63;


UNUSED_RidleyDamagesSamus_A6DF66:
    JSL.L DealSuitAdjustedEnemyDamageToSamus                             ;A6DF66;
    LDA.W #$0060                                                         ;A6DF6A;
    STA.W SamusInvincibilityTimer                                        ;A6DF6D;
    LDA.W #$0005                                                         ;A6DF70;
    STA.W SamusKnockbackTimer                                            ;A6DF73;
    LDY.W #$0000                                                         ;A6DF76;
    LDX.W EnemyIndex                                                     ;A6DF79;
    LDA.W SamusXPosition                                                 ;A6DF7C;
    SEC                                                                  ;A6DF7F;
    SBC.W Enemy.XPosition,X                                              ;A6DF80;
    BMI .left                                                            ;A6DF83;
    INY                                                                  ;A6DF85;

  .left:
    STY.W KnockbackXDirection                                            ;A6DF86;
    RTS                                                                  ;A6DF89;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $DF8A: Enemy shot - enemy $E13F/$E17F (Ridley) ;;;
EnemyShot_Ridley:
    LDA.W AreaIndex                                                      ;A6DF8A;
    CMP.W #$0002                                                         ;A6DF8D;
    BEQ .NorfairRidley                                                   ;A6DF90;
    LDY.W #$000D                                                         ;A6DF92;
    LDA.W Enemy.flashTimer                                               ;A6DF95;
    BEQ .oddFlashTimer                                                   ;A6DF98;
    LSR                                                                  ;A6DF9A;
    BCC .oddFlashTimer                                                   ;A6DF9B;
    INY                                                                  ;A6DF9D;

  .oddFlashTimer:
    STY.W Enemy.flashTimer                                               ;A6DF9E;
    LDA.L Ridley.hitCounterCeres                                         ;A6DFA1;
    INC                                                                  ;A6DFA5;
    STA.L Ridley.hitCounterCeres                                         ;A6DFA6;
    BRA RTL_A6DFB6                                                       ;A6DFAA;

  .NorfairRidley:
    JSL.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External     ;A6DFAC;
    BRA RTL_A6DFB6                                                       ;A6DFB0;


;;; $DFB2: Power bomb reaction - enemy $E13F/$E17F (Ridley) ;;;
PowerBombReaction_Ridley:
    JSL.L NormalEnemyPowerBombAI_NoDeathCheck_External                   ;A6DFB2; fallthrough to RTL_A6DFB6


;;; $DFB6: RTL. Ridley reaction ;;;
RTL_A6DFB6:
    RTL                                                                  ;A6DFB6;


;;; $DFB7:  ;;;
SetRidleyAsDead:
; Set 7802 to dead, disable Samus/Ridley interaction, next AI script is Function_Ridley_MoveToDeathSpot
    LDA.W Enemy.health                                                   ;A6DFB7;
    BNE .return                                                          ;A6DFBA;
    LDA.L Ridley.status                                                  ;A6DFBC;
    BMI .return                                                          ;A6DFC0;
    LDA.W #$FFFF                                                         ;A6DFC2;
    STA.L Ridley.status                                                  ;A6DFC5;
    LDA.W Enemy.properties                                               ;A6DFC9;
    ORA.W #$0400                                                         ;A6DFCC;
    STA.W Enemy.properties                                               ;A6DFCF;
    LDA.W #Function_Ridley_MoveToDeathSpot                               ;A6DFD2;
    STA.W Ridley.function                                                ;A6DFD5;

  .return:
    RTL                                                                  ;A6DFD8;


;;; $DFD9:  ;;;
RidleyTail_vs_Samus_Interaction:
; Tail/Samus interaction
    LDA.W #$000E                                                         ;A6DFD9;
    STA.B $16                                                            ;A6DFDC;
    STA.B $18                                                            ;A6DFDE;
    LDA.L Ridley.tailTipXPosition                                        ;A6DFE0;
    STA.B $12                                                            ;A6DFE4;
    LDA.L Ridley.tailTipYPosition                                        ;A6DFE6;
    STA.B $14                                                            ;A6DFEA;
    JSR.W EfficientCollisionDetectionForSamusAt_12_14                    ;A6DFEC;
    BCC .return                                                          ;A6DFEF;
    LDA.L Ridley.tailTipDamage                                           ;A6DFF1;
    JSL.L Suit_Damage_Division                                           ;A6DFF5;
    JSL.L Deal_A_Damage_to_Samus                                         ;A6DFF9;
    LDA.W #$0060                                                         ;A6DFFD;
    STA.W SamusInvincibilityTimer                                        ;A6E000;
    LDA.W #$0005                                                         ;A6E003;
    STA.W SamusKnockbackTimer                                            ;A6E006;
    LDY.W #$0000                                                         ;A6E009;
    LDA.W SamusXPosition                                                 ;A6E00C;
    SEC                                                                  ;A6E00F;
    SBC.L Ridley.tailTipXPosition                                        ;A6E010;
    BMI .knockbackDirection                                              ;A6E014;
    INY                                                                  ;A6E016;

  .knockbackDirection:
    STY.W KnockbackXDirection                                            ;A6E017;

  .return:
    RTS                                                                  ;A6E01A;


if !FEATURE_KEEP_UNREFERENCED
;;; $E01B:  ;;;
UNUSED_ProjectileCollision_A6E01B:
    LDX.W EnemyIndex                                                     ;A6E01B;
    LDA.W SamusProjectile_XPositions                                     ;A6E01E;
    SEC                                                                  ;A6E021;
    SBC.W Enemy.XPosition,X                                              ;A6E022;
    STA.B $12                                                            ;A6E025;
    LDA.W SamusProjectile_YPositions                                     ;A6E027;
    SEC                                                                  ;A6E02A;
    SBC.W Enemy.YPosition,X                                              ;A6E02B;
    STA.B $14                                                            ;A6E02E;
    JSL.L CalculateAngleOf_12_14_Offset                                  ;A6E030;
    SEC                                                                  ;A6E034;
    SBC.W #$0080                                                         ;A6E035;
    EOR.W #$FFFF                                                         ;A6E038;
    INC                                                                  ;A6E03B;
    CLC                                                                  ;A6E03C;
    ADC.W #$0080                                                         ;A6E03D;
    AND.W #$00FF                                                         ;A6E040;
    STA.B $12                                                            ;A6E043;
    LDA.W CollisionIndex                                                 ;A6E045;
    ASL                                                                  ;A6E048;
    TAX                                                                  ;A6E049;
    LDA.W SamusProjectile_Damages,X                                      ;A6E04A;
    ASL                                                                  ;A6E04D;
    ASL                                                                  ;A6E04E;
    CMP.W #$0300                                                         ;A6E04F;
    BCC +                                                                ;A6E052;
    LDA.W #$0300                                                         ;A6E054;

+   PHA                                                                  ;A6E057;
    JSL.L CalculateXVelocityFromSpeedAndAngle                            ;A6E058;
    STA.B $12                                                            ;A6E05C;
    LDX.W EnemyIndex                                                     ;A6E05E;
    EOR.W Ridley.XSpeed,X                                                ;A6E061;
    BPL +                                                                ;A6E064;
    LDA.B $12                                                            ;A6E066;
    CLC                                                                  ;A6E068;
    ADC.W Ridley.XSpeed,X                                                ;A6E069;
    STA.W Ridley.XSpeed,X                                                ;A6E06C;

+   PLA                                                                  ;A6E06F;
    JSL.L CalculateYVelocityFromSpeedAndAngle                            ;A6E070;
    STA.B $12                                                            ;A6E074;
    LDX.W EnemyIndex                                                     ;A6E076;
    EOR.W Ridley.YSpeed,X                                                ;A6E079;
    BPL .return                                                          ;A6E07C;
    LDA.B $12                                                            ;A6E07E;
    CLC                                                                  ;A6E080;
    ADC.W Ridley.YSpeed,X                                                ;A6E081;
    STA.W Ridley.YSpeed,X                                                ;A6E084;

  .return:
    RTS                                                                  ;A6E087;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $E088:  ;;;
KillProjectilesWithRidleyTailTip:
; Tail tip kills projectiles
    LDA.W Enemy.properties                                               ;A6E088;
    AND.W #$0400                                                         ;A6E08B;
    BEQ .notIntangible                                                   ;A6E08E;
    RTS                                                                  ;A6E090;

  .notIntangible:
    LDA.W #$000E                                                         ;A6E091;
    STA.B $16                                                            ;A6E094;
    STA.B $18                                                            ;A6E096;
    LDA.L Ridley.tailTipXPosition                                        ;A6E098;
    STA.B $12                                                            ;A6E09C;
    LDA.L Ridley.tailTipYPosition                                        ;A6E09E;
    STA.B $14                                                            ;A6E0A2;
    JSR.W RidleyTail_vs_SamusProjectile_CollisionDetection               ;A6E0A4;
    BCS TailProjectileCollision                                          ;A6E0A7;
    LDA.W #$000A                                                         ;A6E0A9;
    STA.B $16                                                            ;A6E0AC;
    STA.B $18                                                            ;A6E0AE;
    LDA.L Ridley.tail6XPosition                                          ;A6E0B0;
    STA.B $12                                                            ;A6E0B4;
    LDA.L Ridley.tail6YPosition                                          ;A6E0B6;
    STA.B $14                                                            ;A6E0BA;
    JSR.W RidleyTail_vs_SamusProjectile_CollisionDetection               ;A6E0BC;
    BCS TailProjectileCollision                                          ;A6E0BF;
    RTS                                                                  ;A6E0C1;


if !FEATURE_KEEP_UNREFERENCED
;;; $E0C2:  ;;;
UNUSED_TailProjectileCollision_A6E0C2:
    LDA.L Ridley.tail5XPosition                                          ;A6E0C2;
    STA.B $12                                                            ;A6E0C6;
    LDA.L Ridley.tail5YPosition                                          ;A6E0C8;
    STA.B $14                                                            ;A6E0CC;
    JSR.W RidleyTail_vs_SamusProjectile_CollisionDetection               ;A6E0CE;
    BCS TailProjectileCollision                                          ;A6E0D1;
    LDA.W #$000B                                                         ;A6E0D3;
    STA.B $16                                                            ;A6E0D6;
    STA.B $18                                                            ;A6E0D8;
    LDA.L Ridley.tail4XPosition                                          ;A6E0DA;
    STA.B $12                                                            ;A6E0DE;
    LDA.L Ridley.tail4YPosition                                          ;A6E0E0;
    STA.B $14                                                            ;A6E0E4;
    JSR.W RidleyTail_vs_SamusProjectile_CollisionDetection               ;A6E0E6;
    BCS TailProjectileCollision                                          ;A6E0E9;
    LDA.L Ridley.tail3XPosition                                          ;A6E0EB;
    STA.B $12                                                            ;A6E0EF;
    LDA.L Ridley.tail3YPosition                                          ;A6E0F1;
    STA.B $14                                                            ;A6E0F5;
    JSR.W RidleyTail_vs_SamusProjectile_CollisionDetection               ;A6E0F7;
    BCS TailProjectileCollision                                          ;A6E0FA;
    LDA.W #$000D                                                         ;A6E0FC;
    STA.B $16                                                            ;A6E0FF;
    STA.B $18                                                            ;A6E101;
    LDA.L Ridley.tail2XPosition                                          ;A6E103;
    STA.B $12                                                            ;A6E107;
    LDA.L Ridley.tail2YPosition                                          ;A6E109;
    STA.B $14                                                            ;A6E10D;
    JSR.W RidleyTail_vs_SamusProjectile_CollisionDetection               ;A6E10F;
    BCS TailProjectileCollision                                          ;A6E112;
    LDA.L Ridley.tail1XPosition                                          ;A6E114;
    STA.B $12                                                            ;A6E118;
    LDA.L Ridley.tail1YPosition                                          ;A6E11A;
    STA.B $14                                                            ;A6E11E;
    JSR.W RidleyTail_vs_SamusProjectile_CollisionDetection               ;A6E120;
    BCS TailProjectileCollision                                          ;A6E123;
    RTS                                                                  ;A6E125;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $E126:  ;;;
TailProjectileCollision:
    LDA.W SamusProjectile_XPositions,Y                                   ;A6E126;
    STA.B $12                                                            ;A6E129;
    LDA.W SamusProjectile_YPositions,Y                                   ;A6E12B;
    STA.B $14                                                            ;A6E12E;
    LDA.W SamusProjectile_Types+1,Y                                      ;A6E130;
    AND.W #$000F                                                         ;A6E133;
    LDY.W #$000C                                                         ;A6E136;
    DEC                                                                  ;A6E139;
    BNE .notAMissile                                                     ;A6E13A;
    LDA.W #$003D                                                         ;A6E13C;
    JSL.L QueueSound_Lib1_Max6                                           ;A6E13F;
    LDY.W #$0006                                                         ;A6E143;

  .notAMissile:
    TYA                                                                  ;A6E146;
    LDY.W #EnemyProjectile_MiscDust                                      ;A6E147;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A6E14A;
    RTS                                                                  ;A6E14E;


;;; $E14F: Palette - enemy $E13F/$E17F (Ridley) ;;;
Palette_Ridley:
    dw $0000,$56BA,$41B2,$1447,$0403,$4E15,$3570,$24CB                   ;A6E14F;
    dw $1868,$5E5F,$183F,$1014,$031F,$01DA,$00F5,$0C63                   ;A6E15F;


;;; $E16F: Palettes ;;;
Palette_CeresRidleyInit:
; Ceres Ridley init, sprite palette 2
    dw $0000,$7E20,$6560,$2060,$1000,$7940,$5D00,$4CA0                   ;A6E16F;
    dw $3CA0,$43FF,$0113,$000F,$175C,$0299,$01D6,$57E0                   ;A6E17F;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Palette_Ridley_A6E18F:
    dw $0000,$6BF5,$06E1,$0641,$05A1,$5E5F,$183F,$1014                   ;A6E18F;
    dw $080A,$0404,$4F9F,$3ED8,$2E12,$6F70,$7FFF,$5EE0                   ;A6E19F;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $E1AF: Palette - enemy $E1BF (Ridley explosion) ;;;
Palette_RidleyExplosion_0:
    dw $3800,$56BA,$41B2,$1447,$0403,$4E15,$3570,$24CB                   ;A6E1AF;

Palette_RidleyExplosion_1:
    dw $1868,$5E5F,$183F,$1014,$031F,$01DA,$00F5,$0C63                   ;A6E1BF;


;;; $E1CF: Palettes ;;;
; Enemy $E1FF (Ceres steam) palette points to Palette_CeresSteam, right in the middle of this section...
Palette_NorfairRidleyInit:
; Norfair Ridley init, sprite palette 2
    dw $3800,$6B5A,$5652,$28E7,$1863,$62B5,$4A10,$396B                   ;A6E1CF;
    dw $3129,$43FF,$0113,$000F,$175C,$0299,$01D6,$3BE0                   ;A6E1DF;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Palette_Ridley_A6E1EF:
    dw $3800                                                             ;A6E1EF;
endif ; !FEATURE_KEEP_UNREFERENCED

Palette_BabyMetroidCutscene_EndOfInstList:
    dw $6BF5,$06E1,$0641,$05A1,$5E5F,$183F,$1014,$080A                   ;A6E1F1;
    dw $0404,$4F9F,$3ED8,$2E12,$6F70,$7FFF,$5EE0                         ;A6E201;

Palette_BabyMetroidCutscene_HorizontalSquish:
    dw $6BF5,$06E1,$0641,$05A1,$5E5F,$183F,$1014,$080A                   ;A6E20F;
    dw $0404,$4F9F,$3ED8,$2E12,$6F70,$7FFF,$5EE0                         ;A6E21F;

Palette_BabyMetroidCutscene_Round:
    dw $77F8,$1344,$12A4,$1204,$6ABF,$249F,$1C77,$146D                   ;A6E22D;
    dw $1067                                                             ;A6E23D;

Palette_CeresSteam:
    dw $5BFF,$4B38,$3A72,$7BD3,$7FFF,$6B43                               ;A6E23F;

Palette_BabyMetroidCutscene_VerticalSquish:
    dw $7FFB,$1FA7,$1F07,$1E67,$771F,$30FF,$28DA,$20D0                   ;A6E24B;
    dw $1CCA,$67FF,$579B,$46D5,$7BD6,$7FFF,$77A6                         ;A6E25B;


;;; $E269:  ;;;
CeresRidleyEyeFadeInIndices:
; Ceres Ridley: indices into color data below ($E2AA)
;   indexed by $0FB0
;   reads F first and increments $0FB0 every frame
    db $0F,$0E,$0D,$0C,$0B,$0A,$09,$08,$07,$06,$05,$04,$03,$02,$01,$00   ;A6E269;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;A6E279;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;A6E289;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;A6E299;
    db $FF                                                               ;A6E2A9;


;;; $E2AA:  ;;;
CeresRidleyEyeFadeInColors:
; Ceres Ridley: eye glow fade in? colors
; indexed by $0FB0 * 6 + CeresRidleyEyeFadeInIndices
  .0:
    dw $031F                                                             ;A6E2AA;
  .1:
    dw       $01DA                                                       ;A6E2AC;
  .2:
    dw             $00F5                                                 ;A6E2AE;
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
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;A6E30A;
    dw $0000,$0000,$0000,$0421,$0401,$0000,$0000,$0421                   ;A6E31A;
    dw $0001,$0000,$0000,$0422,$0002,$0001,$0843,$0822                   ;A6E32A;
    dw $0001,$0000,$0842,$0422,$0401,$0001,$0C44,$0004                   ;A6E33A;
    dw $0002,$1085,$0C43,$0401,$0000,$0C64,$0843,$0422                   ;A6E34A;
    dw $0401,$1066,$0406,$0004,$14A7,$1064,$0401,$0000                   ;A6E35A;
    dw $1485,$0C64,$0823,$0402,$1888,$0408,$0405,$1CE8                   ;A6E36A;
    dw $1486,$0402,$0001,$18A7,$1065,$0C43,$0822,$1CCA                   ;A6E37A;
    dw $080A,$0406,$210A,$18A7,$0802,$0001,$1CC8,$1486                   ;A6E38A;
    dw $0C44,$0823,$24EC,$080C,$0408,$252C,$1CC8,$0823                   ;A6E39A;
    dw $0001,$20E9,$18A7,$1045,$0823,$290E,$080E,$0409                   ;A6E3AA;
    dw $2D6D,$20E9,$0823,$0001,$290B,$1CA8,$1065,$0C24                   ;A6E3BA;
    dw $3130,$0C10,$080A,$318F,$24EA,$0C24,$0001,$2D2C                   ;A6E3CA;
    dw $1CC9,$1466,$0C24,$3552,$0C12,$080C,$39D1,$290C                   ;A6E3DA;
    dw $0C24,$0002,$314E,$20EA,$1887,$1045,$3D94,$1014                   ;A6E3EA;
    dw $080D,$3DF3,$2D2D,$0C25,$0002,$396F,$250B,$1888                   ;A6E3FA;
    dw $1045,$41B6,$1016,$0C0E,$4214,$314E,$1025,$0002                   ;A6E40A;
    dw $3D90,$290C,$1C88,$1046,$49D8,$1018,$0C10,$4A56                   ;A6E41A;
    dw $356F,$1026,$0002,$41B2,$2D2D,$1CA9,$1447,$51FA                   ;A6E42A;
    dw $141A,$0C11,$4E78,$3D90,$1026,$0402,$45F3,$314F                   ;A6E43A;
    dw $20AA,$1447,$561D,$143D,$0C12,$56BA,$41B2,$1447                   ;A6E44A;
    dw $0403,$4E15,$3570,$24CB,$1868,$5E5F,$183F,$1014                   ;A6E45A;


;;; $E46A:  ;;;
Palette_Ridley_HealthBased_Below9000:                                    ;A6E46A;
    dw $4E7A,$3D73,$1449,$0405,$45D6,$3151,$20AD,$184A,$561F,$183F,$1015,$02BF,$019A,$00D6 ; < 9000

Palette_Ridley_HealthBased_Below5400:                                    ;A6E484;
    dw $4A5A,$3973,$142A,$0407,$45B6,$3132,$20AE,$184B,$51FF,$183F,$1015,$029F,$019A,$00D6 ; < 5400

Palette_Ridley_HealthBased_Below1800:                                    ;A6E49E;
    dw $4A3B,$3954,$142B,$0808,$41B7,$2D33,$20AF,$184C,$4DDF,$183F,$1016,$067F,$057B,$04B7 ; < 1800


;;; $E4BE: Instruction ;;;
Instruction_Ridley_QueueRoarSFX:
    LDA.W #$0059                                                         ;A6E4BE;
    STA.L Ridley.roarSFXFlag                                             ;A6E4C1;
    JSL.L QueueSound_Lib2_Max6                                           ;A6E4C5;
    RTL                                                                  ;A6E4C9;


;;; $E4CA: Instruction ;;;
Instruction_Ridley_ResetRoarFlag:
    LDA.W #$0000                                                         ;A6E4CA;
    STA.L Ridley.roarSFXFlag                                             ;A6E4CD;
    RTL                                                                  ;A6E4D1;


;;; $E4D2: Instruction ;;;
Inst_Ridley_GotoYAndSetTimerTo8IfNotNorfairOrSamusLowEnergy:
; If in Norfair or Samus is below 30 health, go to next instruction. Else go to argument, and set main AI script timer to 8
    LDA.W AreaIndex                                                      ;A6E4D2;
    CMP.W #$0002                                                         ;A6E4D5;
    BEQ Instruction_Ridley_SkipToNextInstruction                         ;A6E4D8;
    LDA.W Energy                                                         ;A6E4DA;
    CMP.W #$001E                                                         ;A6E4DD;
    BPL Instruction_Ridley_SkipToNextInstruction                         ;A6E4E0;
    LDA.W #$0008                                                         ;A6E4E2;
    STA.L Ridley.timer                                                   ;A6E4E5; fallthrough to Instruction_Ridley_GotoY


;;; $E4E9: Instruction - go to [[Y]] ;;;
Instruction_Ridley_GotoY:
    LDA.W $0000,Y                                                        ;A6E4E9;
    TAY                                                                  ;A6E4EC;
    RTL                                                                  ;A6E4ED;


if !FEATURE_KEEP_UNREFERENCED
;;; $E4EE: Instruction ;;;
UNUSED_Instruction_RidleyCeres_GotoYIfNotHoldingBaby_A6E4EE:
    LDA.L Ridley.holdingSamusFlag                                        ;A6E4EE;
    BNE Instruction_Ridley_GotoY                                         ;A6E4F2;
    INY                                                                  ;A6E4F4;
    INY                                                                  ;A6E4F5;
    BRA Instruction_Ridley_GotoY                                         ;A6E4F6;


;;; $E4F8: Instruction ;;;
UNUSED_Instruction_RidleyCeres_GotoYIfHoldingBaby_A6E4F8:
    LDA.L Ridley.holdingSamusFlag                                        ;A6E4F8;
    BEQ Instruction_Ridley_GotoY                                         ;A6E4FC;
    INY                                                                  ;A6E4FE;
    INY                                                                  ;A6E4FF;
    RTL                                                                  ;A6E500;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $E501: Instruction ;;;
Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement:
    LDA.W SamusXPosition                                                 ;A6E501;
    STA.W SamusPreviousXPosition                                         ;A6E504;
    LDA.W SamusYPosition                                                 ;A6E507;
    STA.W SamusPreviousYPosition                                         ;A6E50A;
    LDA.W $0000,Y                                                        ;A6E50D;
    STA.L Ridley.YDisplacementTableIndex                                 ;A6E510; fallthrough to Instruction_Ridley_SkipToNextInstruction


;;; $E514: Y += 2 ;;;
Instruction_Ridley_SkipToNextInstruction:
    INY                                                                  ;A6E514;
    INY                                                                  ;A6E515;
    RTL                                                                  ;A6E516;


;;; $E517: Instruction ;;;
Instruction_Ridley_GotoYIfNotFacingLeft:
; Move on to next command if Ridley is facing left, else go to argument.
    LDA.L Ridley.facingDirection                                         ;A6E517;
    BEQ Instruction_Ridley_SkipToNextInstruction                         ;A6E51B;
    BRA Instruction_Ridley_GotoY                                         ;A6E51D;


;;; $E51F: Instruction ;;;
Instruction_Ridley_MoveRidleyWithArgsInY:
; Add the following bytes to Ridley's X / Y position
    LDA.W $0000,Y                                                        ;A6E51F;
    CLC                                                                  ;A6E522;
    ADC.W Enemy.XPosition                                                ;A6E523;
    STA.W Enemy.XPosition                                                ;A6E526;
    LDA.W $0002,Y                                                        ;A6E529;
    CLC                                                                  ;A6E52C;
    ADC.W Enemy.YPosition                                                ;A6E52D;
    STA.W Enemy.YPosition                                                ;A6E530;
    INY                                                                  ;A6E533;
    INY                                                                  ;A6E534;
    INY                                                                  ;A6E535;
    INY                                                                  ;A6E536;
    RTL                                                                  ;A6E537;


;;; $E538: Instruction list -  ;;;
InstList_Ridley_FacingLeft_Initial:
; Initialization (draws and avoids crashing)
    dw Instruction_Ridley_GotoYIfNotFacingLeft                           ;A6E538;
    dw InstList_Ridley_FacingRight_Initial                               ;A6E53A;
    dw $000C,ExtendedSpritemap_Ridley_FacingLeft                         ;A6E53C;
    dw Instruction_Common_Sleep                                          ;A6E540;


;;; $E542: Instruction list -  ;;;
InstList_Ridley_FacingRight_Initial:
    dw $000C,ExtendedSpritemap_Ridley_FacingRight                        ;A6E542;
    dw Instruction_Common_Sleep                                          ;A6E546;


;;; $E548: Instruction list -  ;;;
InstList_RidleyCeres_FacingLeft_Lunging:
    dw Instruction_Ridley_GotoYIfNotFacingLeft                           ;A6E548;
    dw UNUSED_InstList_RidleyCeres_FacingRight_Lunging_A6E576            ;A6E54A;
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement,$0000  ;A6E54C;
    dw $0004,ExtendedSpritemap_Ridley_FacingLeft                         ;A6E54E;
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement,$0002  ;A6E554;
    dw $0006,ExtendedSpritemap_Ridley_FacingLeft_LegsHalfExtended        ;A6E556;
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement,$0004  ;A6E55C;
    dw $0050,ExtendedSpritemap_Ridley_FacingLeft_LegsExtended            ;A6E55E;
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement,$0002  ;A6E564;
    dw $0006,ExtendedSpritemap_Ridley_FacingLeft_LegsHalfExtended        ;A6E566;
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement,$0000  ;A6E56C;
    dw $0004,ExtendedSpritemap_Ridley_FacingLeft                         ;A6E56E;
    dw Instruction_Common_Sleep                                          ;A6E574;


;;; $E576: Instruction list -  ;;;
UNUSED_InstList_RidleyCeres_FacingRight_Lunging_A6E576:
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement,$0000  ;A6E576;
    dw $0004,ExtendedSpritemap_Ridley_FacingRight                        ;A6E578;
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement,$0002  ;A6E57E;
    dw $0006,ExtendedSpritemap_Ridley_FacingRight_LegsHalfExtended       ;A6E580;
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement,$0004  ;A6E586;
    dw $0050,ExtendedSpritemap_Ridley_FacingRight_LegsExtended           ;A6E588;
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement,$0002  ;A6E58E;
    dw $0006,ExtendedSpritemap_Ridley_FacingRight_LegsHalfExtended       ;A6E590;
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement,$0000  ;A6E596;
    dw $0004,ExtendedSpritemap_Ridley_FacingRight                        ;A6E598;
    dw Instruction_Common_Sleep                                          ;A6E59E;


if !FEATURE_KEEP_UNREFERENCED
;;; $E5A0: Instruction list -  ;;;
UNUSED_InstList_RidleyCeres_FacingLeft_A6E5A0:
    dw Instruction_Ridley_GotoYIfNotFacingLeft                           ;A6E5A0;
    dw UNUSED_InstList_RidleyCeres_FacingRight_A6E5FE                    ;A6E5A2;
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement,$0000  ;A6E5A4;
    dw $0002,ExtendedSpritemap_Ridley_FacingLeft                         ;A6E5A6;
    dw UNUSED_Instruction_RidleyCeres_GotoYIfHoldingBaby_A6E4F8          ;A6E5AC;
    dw UNUSED_InstList_RidleyCeres_FacingLeft_HoldingBaby_A6E5B2         ;A6E5AE;
    dw Instruction_Common_Sleep                                          ;A6E5B0;


;;; $E5B2: Instruction list -  ;;;
UNUSED_InstList_RidleyCeres_FacingLeft_HoldingBaby_A6E5B2:
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement,$0002  ;A6E5B2;
    dw $0003,ExtendedSpritemap_Ridley_FacingLeft_LegsHalfExtended        ;A6E5B4;
    dw UNUSED_Instruction_RidleyCeres_GotoYIfHoldingBaby_A6E4F8          ;A6E5BA;
    dw UNUSED_InstList_RidleyCeres_FacingLeft_HoldingBaby_A6E5C8         ;A6E5BC;

UNUSED_InstList_RidleyCeres_FacingLeft_HoldingBaby_A6E5BE:
    dw $0001,ExtendedSpritemap_Ridley_FacingLeft_LegsHalfExtended        ;A6E5BE;
    dw UNUSED_Instruction_RidleyCeres_GotoYIfNotHoldingBaby_A6E4EE       ;A6E5C2;
    dw UNUSED_InstList_RidleyCeres_FacingLeft_HoldingBaby_A6E5BE         ;A6E5C4;
    dw UNUSED_InstList_RidleyCeres_FacingLeft_HoldingBaby_A6E5F4         ;A6E5C6;

UNUSED_InstList_RidleyCeres_FacingLeft_HoldingBaby_A6E5C8:
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement,$0004  ;A6E5C8;
    dw $0004,ExtendedSpritemap_Ridley_FacingLeft_LegsExtended            ;A6E5CA;
    dw UNUSED_Instruction_RidleyCeres_GotoYIfHoldingBaby_A6E4F8          ;A6E5D0;
    dw UNUSED_InstList_RidleyCeres_FacingLeft_HoldingBaby_A6E5DE         ;A6E5D2;

UNUSED_InstList_RidleyCeres_FacingLeft_HoldingBaby_A6E5D4:
    dw $0001,ExtendedSpritemap_Ridley_FacingLeft_LegsExtended            ;A6E5D4;
    dw UNUSED_Instruction_RidleyCeres_GotoYIfNotHoldingBaby_A6E4EE       ;A6E5D8;
    dw UNUSED_InstList_RidleyCeres_FacingLeft_HoldingBaby_A6E5D4         ;A6E5DA;
    dw UNUSED_InstList_RidleyCeres_FacingLeft_HoldingBaby_A6E5DE         ;A6E5DC;

UNUSED_InstList_RidleyCeres_FacingLeft_HoldingBaby_A6E5DE:
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement,$0002  ;A6E5DE;
    dw $0003,ExtendedSpritemap_Ridley_FacingLeft_LegsHalfExtended        ;A6E5E0;
    dw UNUSED_Instruction_RidleyCeres_GotoYIfHoldingBaby_A6E4F8          ;A6E5E6;
    dw UNUSED_InstList_RidleyCeres_FacingLeft_HoldingBaby_A6E5F4         ;A6E5E8;

UNUSED_InstList_RidleyCeres_FacingLeft_HoldingBaby_A6E5EA:
    dw $0001,ExtendedSpritemap_Ridley_FacingLeft_LegsHalfExtended        ;A6E5EA;
    dw UNUSED_Instruction_RidleyCeres_GotoYIfNotHoldingBaby_A6E4EE       ;A6E5EE;
    dw UNUSED_InstList_RidleyCeres_FacingLeft_HoldingBaby_A6E5EA         ;A6E5F0;
    dw UNUSED_InstList_RidleyCeres_FacingLeft_HoldingBaby_A6E5F4         ;A6E5F2;

UNUSED_InstList_RidleyCeres_FacingLeft_HoldingBaby_A6E5F4:
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement,$0000  ;A6E5F4;
    dw $0002,ExtendedSpritemap_Ridley_FacingLeft                         ;A6E5F6;
    dw Instruction_Common_Sleep                                          ;A6E5FC;


;;; $E5FE: Instruction list -  ;;;
UNUSED_InstList_RidleyCeres_FacingRight_A6E5FE:
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement,$0000  ;A6E5FE;
    dw $0002,ExtendedSpritemap_Ridley_FacingRight                        ;A6E600;
    dw UNUSED_Instruction_RidleyCeres_GotoYIfHoldingBaby_A6E4F8          ;A6E606;
    dw UNUSED_InstList_RidleyCeres_FacingRight_HoldingBaby_A6E60C        ;A6E608;
    dw Instruction_Common_Sleep                                          ;A6E60A;


;;; $E60C: Instruction list -  ;;;
UNUSED_InstList_RidleyCeres_FacingRight_HoldingBaby_A6E60C:
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement,$0002  ;A6E60C;
    dw $0003,ExtendedSpritemap_Ridley_FacingRight_LegsHalfExtended       ;A6E60E;
    dw UNUSED_Instruction_RidleyCeres_GotoYIfHoldingBaby_A6E4F8          ;A6E614;
    dw UNUSED_InstList_RidleyCeres_FacingRight_HoldingBaby_A6E622        ;A6E616;

UNUSED_InstList_RidleyCeres_FacingRight_HoldingBaby_A6E618:
    dw $0001,ExtendedSpritemap_Ridley_FacingRight_LegsHalfExtended       ;A6E618;
    dw UNUSED_Instruction_RidleyCeres_GotoYIfNotHoldingBaby_A6E4EE       ;A6E61C;
    dw UNUSED_InstList_RidleyCeres_FacingRight_HoldingBaby_A6E618        ;A6E61E;
    dw UNUSED_InstList_RidleyCeres_FacingRight_HoldingBaby_A6E64E        ;A6E620;

UNUSED_InstList_RidleyCeres_FacingRight_HoldingBaby_A6E622:
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement,$0004  ;A6E622;
    dw $0004,ExtendedSpritemap_Ridley_FacingRight_LegsExtended           ;A6E624;
    dw UNUSED_Instruction_RidleyCeres_GotoYIfHoldingBaby_A6E4F8          ;A6E62A;
    dw UNUSED_InstList_RidleyCeres_FacingRight_HoldingBaby_A6E638        ;A6E62C;

UNUSED_InstList_RidleyCeres_FacingRight_HoldingBaby_A6E62E:
    dw $0001,ExtendedSpritemap_Ridley_FacingLeft_LegsExtended            ;A6E62E;
    dw UNUSED_Instruction_RidleyCeres_GotoYIfNotHoldingBaby_A6E4EE       ;A6E632;
    dw UNUSED_InstList_RidleyCeres_FacingRight_HoldingBaby_A6E62E        ;A6E634;
    dw UNUSED_InstList_RidleyCeres_FacingRight_HoldingBaby_A6E638        ;A6E636;

UNUSED_InstList_RidleyCeres_FacingRight_HoldingBaby_A6E638:
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement,$0002  ;A6E638;
    dw $0003,ExtendedSpritemap_Ridley_FacingRight_LegsHalfExtended       ;A6E63A;
    dw UNUSED_Instruction_RidleyCeres_GotoYIfHoldingBaby_A6E4F8          ;A6E640;
    dw UNUSED_InstList_RidleyCeres_FacingRight_HoldingBaby_A6E64E        ;A6E642;

UNUSED_InstList_RidleyCeres_FacingRight_HoldingBaby_A6E644:
    dw $0001,ExtendedSpritemap_Ridley_FacingLeft_LegsHalfExtended        ;A6E644;
    dw UNUSED_Instruction_RidleyCeres_GotoYIfNotHoldingBaby_A6E4EE       ;A6E648;
    dw UNUSED_InstList_RidleyCeres_FacingRight_HoldingBaby_A6E644        ;A6E64A;
    dw UNUSED_InstList_RidleyCeres_FacingRight_HoldingBaby_A6E64E        ;A6E64C;

UNUSED_InstList_RidleyCeres_FacingRight_HoldingBaby_A6E64E:
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement,$0000  ;A6E64E;
    dw $0002,ExtendedSpritemap_Ridley_FacingRight                        ;A6E650;
    dw Instruction_Common_Sleep                                          ;A6E656;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $E658: Instruction list -  ;;;
InstList_RidleyCeres_FacingLeft_ExtendLegs:
    dw Instruction_Ridley_GotoYIfNotFacingLeft                           ;A6E658;
    dw InstList_RidleyCeres_FacingRight_ExtendLegs                       ;A6E65A;
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement,$0000  ;A6E65C;
    dw $0004,ExtendedSpritemap_Ridley_FacingLeft                         ;A6E65E;
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement,$0002  ;A6E664;
    dw $0006,ExtendedSpritemap_Ridley_FacingLeft_LegsHalfExtended        ;A6E666;
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement,$0004  ;A6E66C;
    dw $0001,ExtendedSpritemap_Ridley_FacingLeft_LegsExtended            ;A6E66E;
    dw Instruction_Common_Sleep                                          ;A6E674;


;;; $E676: Instruction list -  ;;;
InstList_RidleyCeres_FacingRight_ExtendLegs:
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement,$0000  ;A6E676;
    dw $0004,ExtendedSpritemap_Ridley_FacingRight                        ;A6E678;
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement,$0002  ;A6E67E;
    dw $0006,ExtendedSpritemap_Ridley_FacingRight_LegsHalfExtended       ;A6E680;
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement,$0004  ;A6E686;
    dw $0001,ExtendedSpritemap_Ridley_FacingRight_LegsExtended           ;A6E688;
    dw Instruction_Common_Sleep                                          ;A6E68E;


;;; $E690: Instruction list -  ;;;
InstList_Ridley_FacingLeft_OpeningRoar:
; Opening roar and close mouth
    dw Instruction_Ridley_GotoYIfNotFacingLeft                           ;A6E690;
    dw InstList_Ridley_FacingRight_OpeningRoar                           ;A6E692;
    dw $0006,ExtendedSpritemap_Ridley_FacingLeft                         ;A6E694;
    dw Instruction_Ridley_QueueRoarSFX                                   ;A6E698;
    dw $0008,ExtendedSpritemap_Ridley_FacingLeft_MouthHalfOpen           ;A6E69A;
    dw $0060,ExtendedSpritemap_Ridley_FacingLeft_MouthOpen               ;A6E69E;
    dw $0008,ExtendedSpritemap_Ridley_FacingLeft_MouthHalfOpen           ;A6E6A2;
    dw Instruction_Ridley_ResetRoarFlag                                  ;A6E6A6;
    dw $0001,ExtendedSpritemap_Ridley_FacingLeft                         ;A6E6A8;
    dw Instruction_Common_Sleep                                          ;A6E6AC;


;;; $E6AE: Instruction list -  ;;;
InstList_Ridley_FacingRight_OpeningRoar:
    dw $0006,ExtendedSpritemap_Ridley_FacingRight                        ;A6E6AE;
    dw Instruction_Ridley_QueueRoarSFX                                   ;A6E6B2;
    dw $0008,ExtendedSpritemap_Ridley_FacingRight_MouthHalfOpen          ;A6E6B4;
    dw $0060,ExtendedSpritemap_Ridley_FacingRight_MouthOpen              ;A6E6B8;
    dw $0008,ExtendedSpritemap_Ridley_FacingRight_MouthHalfOpen          ;A6E6BC;
    dw Instruction_Ridley_ResetRoarFlag                                  ;A6E6C0;
    dw $0001,ExtendedSpritemap_Ridley_FacingRight                        ;A6E6C2;
    dw Instruction_Common_Sleep                                          ;A6E6C6;


;;; $E6C8: Instruction list -  ;;;
InstList_Ridley_FacingLeft_DeathRoar:
    dw Instruction_Ridley_GotoYIfNotFacingLeft                           ;A6E6C8;
    dw InstList_Ridley_FacingRight_DeathRoar                             ;A6E6CA;
    dw $0006,ExtendedSpritemap_Ridley_FacingLeft                         ;A6E6CC;
    dw Instruction_Ridley_QueueRoarSFX                                   ;A6E6D0;
    dw $0008,ExtendedSpritemap_Ridley_FacingLeft_MouthHalfOpen           ;A6E6D2;
    dw $0010,ExtendedSpritemap_Ridley_FacingLeft_MouthOpen               ;A6E6D6;
    dw Instruction_Ridley_ResetRoarFlag                                  ;A6E6DA;
    dw Instruction_Common_Sleep                                          ;A6E6DC;


;;; $E6DE: Instruction list -  ;;;
InstList_Ridley_FacingRight_DeathRoar:
    dw $0006,ExtendedSpritemap_Ridley_FacingRight                        ;A6E6DE;
    dw Instruction_Ridley_QueueRoarSFX                                   ;A6E6E2;
    dw $0008,ExtendedSpritemap_Ridley_FacingRight_MouthHalfOpen          ;A6E6E4;
    dw $0010,ExtendedSpritemap_Ridley_FacingRight_MouthOpen              ;A6E6E8;
    dw Instruction_Ridley_ResetRoarFlag                                  ;A6E6EC;
    dw Instruction_Common_Sleep                                          ;A6E6EE;


;;; $E6F0: Instruction list -  ;;;
InstList_Ridley_TurnFromLeftToRight:
; Turn from left to right
    dw Instruction_Ridley_SetDirectionToForwardTurning                   ;A6E6F0;
    dw $0001,ExtendedSpritemap_Ridley_FacingLeft                         ;A6E6F2;
    dw $0008,ExtendedSpritemap_Ridley_FacingForward                      ;A6E6F6;
    dw Instruction_Ridley_SetDirectionToRight_UpdateTailParts            ;A6E6FA;
    dw $0001,ExtendedSpritemap_Ridley_FacingForward                      ;A6E6FC;
    dw $0001,ExtendedSpritemap_Ridley_FacingRight                        ;A6E700;
    dw Instruction_Common_Sleep                                          ;A6E704;


;;; $E706: Instruction list -  ;;;
InstList_Ridley_TurnFromRightToLeft:
; Turn from right to left
    dw Instruction_Ridley_SetDirectionToForwardTurning                   ;A6E706;
    dw $0001,ExtendedSpritemap_Ridley_FacingRight                        ;A6E708;
    dw $0008,ExtendedSpritemap_Ridley_FacingForward                      ;A6E70C;
    dw Instruction_Ridley_SetDirectionToLeft_UpdateTailParts             ;A6E710;
    dw $0001,ExtendedSpritemap_Ridley_FacingForward                      ;A6E712;
    dw $0001,ExtendedSpritemap_Ridley_FacingLeft                         ;A6E716;
    dw Instruction_Common_Sleep                                          ;A6E71A;


;;; $E71C: Instruction ;;;
Instruction_Ridley_SetDirectionToLeft_UpdateTailParts:
; Set 7E:7820 to 0 (Ridley is facing left) and JSR to D3F9 (Updates a bunch of tail values.
; Includes JSR UpdateTailPartRAMFromXToY
    LDA.W #$0000                                                         ;A6E71C;
    STA.L Ridley.facingDirection                                         ;A6E71F;
    JSR.W Update_TailRotationDirection_Angle_DistanceFromRidley          ;A6E723;
    RTL                                                                  ;A6E726;


;;; $E727: Instruction ;;;
Instruction_Ridley_SetDirectionToForwardTurning:
; Set 7E:7820 to 1 (Ridley is facing forward / turning)
    LDA.W #$0001                                                         ;A6E727;
    STA.L Ridley.facingDirection                                         ;A6E72A;
    RTL                                                                  ;A6E72E;


;;; $E72F: Instruction ;;;
Instruction_Ridley_SetDirectionToRight_UpdateTailParts:
; Set 7E:7820 to 2 (Ridley is facing right) and JSR to D3F9 (Updates a bunch of tail values.
; Includes UpdateTailPartRAMFromXToY
    LDA.W #$0002                                                         ;A6E72F;
    STA.L Ridley.facingDirection                                         ;A6E732;
    JSR.W Update_TailRotationDirection_Angle_DistanceFromRidley          ;A6E736;
    RTL                                                                  ;A6E739;


;;; $E73A: Instruction list -  ;;;
InstList_Ridley_FacingLeft_Fireballing_0:
; Fireballing
    dw Instruction_Ridley_GotoYIfNotFacingLeft                           ;A6E73A;
    dw InstList_Ridley_FacingRight_Fireballing_0                         ;A6E73C;
    dw Inst_Ridley_GotoYAndSetTimerTo8IfNotNorfairOrSamusLowEnergy       ;A6E73E;
    dw InstList_Ridley_FacingLeft_Fireballing_1                          ;A6E740;
    dw $0008,ExtendedSpritemap_Ridley_FacingLeft                         ;A6E742;
    dw Instruction_Ridley_QueueRoarSFX                                   ;A6E746;
    dw $0008,ExtendedSpritemap_Ridley_FacingLeft_MouthHalfOpen           ;A6E748;
    dw $0002,ExtendedSpritemap_Ridley_FacingLeft_MouthOpen               ;A6E74C;
    dw Instruction_Ridley_CalculateFireballAngleAndXYSpeeds              ;A6E750;
    dw FireLeadsFireball                                                 ;A6E752;
    dw $0005,ExtendedSpritemap_Ridley_FacingLeft_MouthOpen               ;A6E754;
    dw Instruction_Ridley_CalculateFireballAngleAndXYSpeeds              ;A6E758;
    dw FireTrailsFireball                                                ;A6E75A;
    dw $0005,ExtendedSpritemap_Ridley_FacingLeft_MouthOpen               ;A6E75C;
    dw Instruction_Ridley_CalculateFireballAngleAndXYSpeeds              ;A6E760;
    dw FireTrailsFireball                                                ;A6E762;
    dw $0005,ExtendedSpritemap_Ridley_FacingLeft_MouthOpen               ;A6E764;
    dw Instruction_Ridley_CalculateFireballAngleAndXYSpeeds              ;A6E768;
    dw FireTrailsFireball                                                ;A6E76A;
    dw $0030,ExtendedSpritemap_Ridley_FacingLeft_MouthOpen               ;A6E76C;
    dw $0008,ExtendedSpritemap_Ridley_FacingLeft_MouthHalfOpen           ;A6E770;
    dw Inst_Ridley_GotoYAndSetTimerTo8IfNotNorfairOrSamusLowEnergy       ;A6E774;
    dw InstList_Ridley_FacingLeft_Fireballing_1                          ;A6E776;
    dw $0020,ExtendedSpritemap_Ridley_FacingLeft                         ;A6E778;
    dw Instruction_Ridley_CalculateFireballAngleAndXYSpeeds              ;A6E77C;
    dw Instruction_Ridley_QueueRoarSFX                                   ;A6E77E;
    dw $0008,ExtendedSpritemap_Ridley_FacingLeft_MouthHalfOpen           ;A6E780;
    dw $0002,ExtendedSpritemap_Ridley_FacingLeft_MouthOpen               ;A6E784;
    dw Instruction_Ridley_CalculateFireballAngleAndXYSpeeds              ;A6E788;
    dw FireLeadsFireball                                                 ;A6E78A;
    dw $0005,ExtendedSpritemap_Ridley_FacingLeft_MouthOpen               ;A6E78C;
    dw Instruction_Ridley_CalculateFireballAngleAndXYSpeeds              ;A6E790;
    dw FireTrailsFireball                                                ;A6E792;
    dw $0005,ExtendedSpritemap_Ridley_FacingLeft_MouthOpen               ;A6E794;
    dw Instruction_Ridley_CalculateFireballAngleAndXYSpeeds              ;A6E798;
    dw FireTrailsFireball                                                ;A6E79A;
    dw $0005,ExtendedSpritemap_Ridley_FacingLeft_MouthOpen               ;A6E79C;
    dw Instruction_Ridley_CalculateFireballAngleAndXYSpeeds              ;A6E7A0;
    dw FireTrailsFireball                                                ;A6E7A2;
    dw $0030,ExtendedSpritemap_Ridley_FacingLeft_MouthOpen               ;A6E7A4;
    dw $0008,ExtendedSpritemap_Ridley_FacingLeft_MouthHalfOpen           ;A6E7A8;

InstList_Ridley_FacingLeft_Fireballing_1:
    dw Instruction_Ridley_ResetRoarFlag                                  ;A6E7AC;
    dw $0001,ExtendedSpritemap_Ridley_FacingLeft                         ;A6E7AE;
    dw Instruction_Common_Sleep                                          ;A6E7B2;


;;; $E7B4: Instruction list -  ;;;
InstList_Ridley_FacingRight_Fireballing_0:
    dw Inst_Ridley_GotoYAndSetTimerTo8IfNotNorfairOrSamusLowEnergy       ;A6E7B4;
    dw InstList_Ridley_FacingRight_Fireballing_1                         ;A6E7B6;
    dw $0008,ExtendedSpritemap_Ridley_FacingRight                        ;A6E7B8;
    dw Instruction_Ridley_QueueRoarSFX                                   ;A6E7BC;
    dw $0008,ExtendedSpritemap_Ridley_FacingRight_MouthHalfOpen          ;A6E7BE;
    dw $0002,ExtendedSpritemap_Ridley_FacingRight_MouthOpen              ;A6E7C2;
    dw Instruction_Ridley_CalculateFireballAngleAndXYSpeeds              ;A6E7C6;
    dw FireLeadsFireball                                                 ;A6E7C8;
    dw $0005,ExtendedSpritemap_Ridley_FacingRight_MouthOpen              ;A6E7CA;
    dw Instruction_Ridley_CalculateFireballAngleAndXYSpeeds              ;A6E7CE;
    dw FireTrailsFireball                                                ;A6E7D0;
    dw $0005,ExtendedSpritemap_Ridley_FacingRight_MouthOpen              ;A6E7D2;
    dw Instruction_Ridley_CalculateFireballAngleAndXYSpeeds              ;A6E7D6;
    dw FireTrailsFireball                                                ;A6E7D8;
    dw $0005,ExtendedSpritemap_Ridley_FacingRight_MouthOpen              ;A6E7DA;
    dw Instruction_Ridley_CalculateFireballAngleAndXYSpeeds              ;A6E7DE;
    dw FireTrailsFireball                                                ;A6E7E0;
    dw $0030,ExtendedSpritemap_Ridley_FacingRight_MouthOpen              ;A6E7E2;
    dw $0008,ExtendedSpritemap_Ridley_FacingRight_MouthHalfOpen          ;A6E7E6;
    dw Inst_Ridley_GotoYAndSetTimerTo8IfNotNorfairOrSamusLowEnergy       ;A6E7EA;
    dw InstList_Ridley_FacingRight_Fireballing_1                         ;A6E7EC;
    dw $0020,ExtendedSpritemap_Ridley_FacingRight                        ;A6E7EE;
    dw Instruction_Ridley_QueueRoarSFX                                   ;A6E7F2;
    dw $0008,ExtendedSpritemap_Ridley_FacingRight_MouthHalfOpen          ;A6E7F4;
    dw $0002,ExtendedSpritemap_Ridley_FacingRight_MouthOpen              ;A6E7F8;
    dw Instruction_Ridley_CalculateFireballAngleAndXYSpeeds              ;A6E7FC;
    dw FireLeadsFireball                                                 ;A6E7FE;
    dw $0005,ExtendedSpritemap_Ridley_FacingRight_MouthOpen              ;A6E800;
    dw Instruction_Ridley_CalculateFireballAngleAndXYSpeeds              ;A6E804;
    dw FireTrailsFireball                                                ;A6E806;
    dw $0005,ExtendedSpritemap_Ridley_FacingRight_MouthOpen              ;A6E808;
    dw Instruction_Ridley_CalculateFireballAngleAndXYSpeeds              ;A6E80C;
    dw FireTrailsFireball                                                ;A6E80E;
    dw $0005,ExtendedSpritemap_Ridley_FacingRight_MouthOpen              ;A6E810;
    dw Instruction_Ridley_CalculateFireballAngleAndXYSpeeds              ;A6E814;
    dw FireTrailsFireball                                                ;A6E816;
    dw $0030,ExtendedSpritemap_Ridley_FacingRight_MouthOpen              ;A6E818;
    dw $0008,ExtendedSpritemap_Ridley_FacingRight_MouthHalfOpen          ;A6E81C;

InstList_Ridley_FacingRight_Fireballing_1:
    dw Instruction_Ridley_ResetRoarFlag                                  ;A6E820;
    dw $0001,ExtendedSpritemap_Ridley_FacingRight                        ;A6E822;
    dw Instruction_Common_Sleep                                          ;A6E826;


if !FEATURE_KEEP_UNREFERENCED
;;; $E828: Unused ;;;
UNUSED_SpawnUnusedEnemyProjectiles_A6E828:
    LDA.W #$0000                                                         ;A6E828;
    JSL.L UNUSED_SpawnUnusedEnemyProjectile_A6E840                       ;A6E82B;
    LDA.W #$0001                                                         ;A6E82F;
    JSL.L UNUSED_SpawnUnusedEnemyProjectile_A6E840                       ;A6E832;
    LDA.W #$0002                                                         ;A6E836;
    JSL.L UNUSED_SpawnUnusedEnemyProjectile_A6E840                       ;A6E839;
    LDA.W #$0003                                                         ;A6E83D; fallthrough to UNUSED_SpawnUnusedEnemyProjectile_A6E840


;;; $E840:  ;;;
UNUSED_SpawnUnusedEnemyProjectile_A6E840:
    STA.W Enemy.init0                                                    ;A6E840;
    PHY                                                                  ;A6E843;
    LDY.W #UNUSED_EnemyProjectile_Ridley_869634                          ;A6E844;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A6E847;
    PLY                                                                  ;A6E84B;
    RTL                                                                  ;A6E84C;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $E84D: Instruction ;;;
Instruction_Ridley_CalculateFireballAngleAndXYSpeeds:
; Calculate fireball angle and X/Y speeds
    PHX                                                                  ;A6E84D;
    PHY                                                                  ;A6E84E;
    LDA.L Ridley.facingDirection                                         ;A6E84F;
    BNE .facingRight                                                     ;A6E853;
    LDA.W #$FFE7                                                         ;A6E855;
    CLC                                                                  ;A6E858;
    ADC.W Enemy.XPosition                                                ;A6E859;
    STA.B $12                                                            ;A6E85C;
    LDA.W SamusXPosition                                                 ;A6E85E;
    SEC                                                                  ;A6E861;
    SBC.B $12                                                            ;A6E862;
    STA.B $12                                                            ;A6E864;
    LDA.W #$FFD5                                                         ;A6E866;
    CLC                                                                  ;A6E869;
    ADC.W Enemy.YPosition                                                ;A6E86A;
    STA.B $14                                                            ;A6E86D;
    LDA.W SamusYPosition                                                 ;A6E86F;
    SEC                                                                  ;A6E872;
    SBC.B $14                                                            ;A6E873;
    STA.B $14                                                            ;A6E875;
    JSL.L CalculateAngleOf_12_14_Offset                                  ;A6E877;
    SEC                                                                  ;A6E87B;
    SBC.W #$0080                                                         ;A6E87C;
    EOR.W #$FFFF                                                         ;A6E87F;
    INC                                                                  ;A6E882;
    AND.W #$00FF                                                         ;A6E883;
    CMP.W #$00B0                                                         ;A6E886;
    BCS .checkEB                                                         ;A6E889;
    CMP.W #$0040                                                         ;A6E88B;
    BCC .loadEB                                                          ;A6E88E;
    LDA.W #$00B0                                                         ;A6E890;
    BRA +                                                                ;A6E893;

  .checkEB:
    CMP.W #$00EB                                                         ;A6E895;
    BCC +                                                                ;A6E898;

  .loadEB:
    LDA.W #$00EB                                                         ;A6E89A;

+   STA.B $12                                                            ;A6E89D;
    BRA .merge                                                           ;A6E89F;

  .facingRight:
    LDA.W #$0019                                                         ;A6E8A1;
    CLC                                                                  ;A6E8A4;
    ADC.W Enemy.XPosition                                                ;A6E8A5;
    STA.B $12                                                            ;A6E8A8;
    LDA.W SamusXPosition                                                 ;A6E8AA;
    SEC                                                                  ;A6E8AD;
    SBC.B $12                                                            ;A6E8AE;
    STA.B $12                                                            ;A6E8B0;
    LDA.W #$FFD5                                                         ;A6E8B2;
    CLC                                                                  ;A6E8B5;
    ADC.W Enemy.YPosition                                                ;A6E8B6;
    STA.B $14                                                            ;A6E8B9;
    LDA.W SamusYPosition                                                 ;A6E8BB;
    SEC                                                                  ;A6E8BE;
    SBC.B $14                                                            ;A6E8BF;
    STA.B $14                                                            ;A6E8C1;
    JSL.L CalculateAngleOf_12_14_Offset                                  ;A6E8C3;
    SEC                                                                  ;A6E8C7;
    SBC.W #$0080                                                         ;A6E8C8;
    EOR.W #$FFFF                                                         ;A6E8CB;
    INC                                                                  ;A6E8CE;
    AND.W #$00FF                                                         ;A6E8CF;
    CMP.W #$0050                                                         ;A6E8D2;
    BCC .check15                                                         ;A6E8D5;
    CMP.W #$00C0                                                         ;A6E8D7;
    BCS .load15                                                          ;A6E8DA;
    LDA.W #$0050                                                         ;A6E8DC;
    BRA +                                                                ;A6E8DF;

  .check15:
    CMP.W #$0015                                                         ;A6E8E1;
    BCS +                                                                ;A6E8E4;

  .load15:
    LDA.W #$0015                                                         ;A6E8E6;

+   STA.B $12                                                            ;A6E8E9;

  .merge:
    LDA.W #$0500                                                         ;A6E8EB;
    JSL.L CalculateXVelocityFromSpeedAndAngle                            ;A6E8EE;
    STA.L Ridley.fireballXComponentOfSpeed                               ;A6E8F2;
    LDA.W #$0500                                                         ;A6E8F6;
    JSL.L CalculateYVelocityFromSpeedAndAngle                            ;A6E8F9;
    STA.L Ridley.fireballYComponentOfSpeed                               ;A6E8FD;
    PLY                                                                  ;A6E901;
    PLX                                                                  ;A6E902;
    RTL                                                                  ;A6E903;


;;; $E904: Instruction ;;;
FireLeadsFireball:
; Fires lead fireball
    LDA.W #$0000                                                         ;A6E904;
    BRA SpawnRidleyFireball                                              ;A6E907;


;;; $E909: Instruction ;;;
FireTrailsFireball:
; Fires following fireball
    LDA.W #$000E                                                         ;A6E909; fallthrough to SpawnRidleyFireball


;;; $E90C:  ;;;
SpawnRidleyFireball:
    STA.W EnemyProjectile_InitParam1                                     ;A6E90C;
    LDA.L Ridley.facingDirection                                         ;A6E90F;
    PHY                                                                  ;A6E913;
    LDY.W #EnemyProjectile_RidleysFireball                               ;A6E914;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A6E917;
    PLY                                                                  ;A6E91B;
    RTL                                                                  ;A6E91C;


;;; $E91D: Instruction list -  ;;;
InstList_RidleyCeres_FacingLeft_FlyUp_StartMainAI:
; Fly up and start main AI, I guess
    dw Instruction_Ridley_GotoYIfNotFacingLeft                           ;A6E91D;
    dw InstList_RidleyCeres_FacingRight_FlyUp_StartMainAI                ;A6E91F;
    dw $0003,ExtendedSpritemap_Ridley_FacingLeft                         ;A6E921;
    dw Instruction_Ridley_MoveRidleyWithArgsInY,$0001,$FFF4              ;A6E925;
    dw $0004,ExtendedSpritemap_Ridley_FacingLeft_LegsHalfExtended        ;A6E927;
    dw Instruction_Ridley_MoveRidleyWithArgsInY,$FFFC,$FFF8              ;A6E92F;
    dw $0005,ExtendedSpritemap_Ridley_FacingLeft_LegsExtended            ;A6E931;
    dw Instruction_RidleyCeres_SetRidleyMainAI_SetVerticalSpeed          ;A6E939;
    dw $0011,ExtendedSpritemap_Ridley_FacingLeft_LegsHalfExtended        ;A6E93B;
    dw $0011,ExtendedSpritemap_Ridley_FacingLeft                         ;A6E93F;
    dw Instruction_Common_Sleep                                          ;A6E943;


;;; $E945: Instruction list -  ;;;
InstList_RidleyCeres_FacingRight_FlyUp_StartMainAI:
    dw $0003,ExtendedSpritemap_Ridley_FacingRight                        ;A6E945;
    dw Instruction_Ridley_MoveRidleyWithArgsInY,$FFFF,$FFF4              ;A6E949;
    dw $0004,ExtendedSpritemap_Ridley_FacingRight_LegsHalfExtended       ;A6E94B;
    dw Instruction_Ridley_MoveRidleyWithArgsInY,$0004,$FFF8              ;A6E953;
    dw $0005,ExtendedSpritemap_Ridley_FacingRight_LegsExtended           ;A6E955;
    dw Instruction_Ridley_SetRidleyMainAI_SetVerticalSpeed               ;A6E95D;
    dw $0011,ExtendedSpritemap_Ridley_FacingRight_LegsHalfExtended       ;A6E95F;
    dw $0011,ExtendedSpritemap_Ridley_FacingRight                        ;A6E963;
    dw Instruction_Common_Sleep                                          ;A6E967;


;;; $E969: Instruction ;;;
Instruction_RidleyCeres_SetRidleyMainAI_SetVerticalSpeed:
; Set Ridley's main AI to Function_RidleyCeres_StartupLiftoff_FacingLeft, and vertical speed to FEA0. (Ceres)
    LDA.W #Function_RidleyCeres_StartupLiftoff_FacingLeft                ;A6E969;
    STA.W Ridley.function                                                ;A6E96C;
    LDA.W #$FEA0                                                         ;A6E96F;
    STA.W Ridley.YSpeed                                                  ;A6E972;
    RTL                                                                  ;A6E975;


;;; $E976: Instruction ;;;
Instruction_Ridley_SetRidleyMainAI_SetVerticalSpeed:
; Set Ridley's main AI to Function_Ridley_Startup_Liftoff_FacingRight, and vertical speed to FEA0. (Norfair)
    LDA.W #Function_Ridley_Startup_Liftoff_FacingRight                   ;A6E976;
    STA.W Ridley.function                                                ;A6E979;
    LDA.W #$FEA0                                                         ;A6E97C;
    STA.W Ridley.YSpeed                                                  ;A6E97F;
    RTL                                                                  ;A6E982;


;;; $E983: Ridley extended spritemaps ;;;
ExtendedSpritemap_Ridley_FacingLeft:
    dw $0004                                                             ;A6E983;
    dw $000F,$0016
    dw Spritemap_Ridley_FacingLeft_Legs_PulledUp                         ;A6E989;
    dw Hitbox_Ridley_FacingLeft_LegsPulledUp                             ;A6E98B;
    dw $FFF8,$0007                                                       ;A6E98D;
    dw Spritemap_Ridley_FacingLeft_Claws                                 ;A6E991;
    dw Hitbox_Ridley_FacingLeft_Claws                                    ;A6E993;
    dw $0010,$0000                                                       ;A6E995;
    dw Spritemap_Ridley_FacingLeft_Torso                                 ;A6E999;
    dw Hitbox_Ridley_FacingLeft_Torso                                    ;A6E99B;
    dw $FFFD,$FFE8                                                       ;A6E99D;
    dw Spritemap_Ridley_FacingLeft_HeadNeck_MouthClosed                  ;A6E9A1;
    dw Hitbox_Ridley_FacingLeft_MouthClosed                              ;A6E9A3;

ExtendedSpritemap_Ridley_FacingRight:
    dw $0004                                                             ;A6E9A5;
    dw $FFF1,$0016
    dw Spritemap_Ridley_FacingRight_Legs_PulledUp                        ;A6E9AB;
    dw Hitbox_Ridley_FacingRight_LegsPulledUp                            ;A6E9AD;
    dw $0008,$0007                                                       ;A6E9AF;
    dw Spritemap_Ridley_FacingRight_Claws                                ;A6E9B3;
    dw Hitbox_Ridley_FacingRight_Claws                                   ;A6E9B5;
    dw $FFF0,$0000                                                       ;A6E9B7;
    dw Spritemap_Ridley_FacingRight_Torso                                ;A6E9BB;
    dw Hitbox_Ridley_FacingRight_Torso                                   ;A6E9BD;
    dw $0003,$FFE8                                                       ;A6E9BF;
    dw Spritemap_Ridley_FacingRight_HeadNeck_MouthClosed                 ;A6E9C3;
    dw Hitbox_Ridley_FacingRight_MouthClosed                             ;A6E9C5;

ExtendedSpritemap_Ridley_FacingLeft_MouthHalfOpen:
    dw $0004                                                             ;A6E9C7;
    dw $000F,$0016
    dw Spritemap_Ridley_FacingLeft_Legs_PulledUp                         ;A6E9CD;
    dw Hitbox_Ridley_FacingLeft_LegsPulledUp                             ;A6E9CF;
    dw $FFF8,$0007                                                       ;A6E9D1;
    dw Spritemap_Ridley_FacingLeft_Claws                                 ;A6E9D5;
    dw Hitbox_Ridley_FacingLeft_Claws                                    ;A6E9D7;
    dw $0010,$0000                                                       ;A6E9D9;
    dw Spritemap_Ridley_FacingLeft_Torso                                 ;A6E9DD;
    dw Hitbox_Ridley_FacingLeft_Torso                                    ;A6E9DF;
    dw $FFFD,$FFE8                                                       ;A6E9E1;
    dw Spritemap_Ridley_FacingLeft_HeadNeck_MouthHalfOpened              ;A6E9E5;
    dw Hitbox_Ridley_FacingLeft_MouthHalfOpen                            ;A6E9E7;

ExtendedSpritemap_Ridley_FacingLeft_MouthOpen:
    dw $0004                                                             ;A6E9E9;
    dw $000F,$0016
    dw Spritemap_Ridley_FacingLeft_Legs_PulledUp                         ;A6E9EF;
    dw Hitbox_Ridley_FacingLeft_LegsPulledUp                             ;A6E9F1;
    dw $FFF8,$0007                                                       ;A6E9F3;
    dw Spritemap_Ridley_FacingLeft_Claws                                 ;A6E9F7;
    dw Hitbox_Ridley_FacingLeft_Claws                                    ;A6E9F9;
    dw $0010,$0000                                                       ;A6E9FB;
    dw Spritemap_Ridley_FacingLeft_Torso                                 ;A6E9FF;
    dw Hitbox_Ridley_FacingLeft_Torso                                    ;A6EA01;
    dw $FFFD,$FFE8                                                       ;A6EA03;
    dw Spritemap_Ridley_FacingLeft_HeadNeck_MouthOpen                    ;A6EA07;
    dw Hitbox_Ridley_FacingLeft_MouthOpen                                ;A6EA09;

ExtendedSpritemap_Ridley_FacingRight_MouthHalfOpen:
    dw $0004                                                             ;A6EA0B;
    dw $FFF1,$0016
    dw Spritemap_Ridley_FacingRight_Legs_PulledUp                        ;A6EA11;
    dw Hitbox_Ridley_FacingRight_LegsPulledUp                            ;A6EA13;
    dw $0008,$0007                                                       ;A6EA15;
    dw Spritemap_Ridley_FacingRight_Claws                                ;A6EA19;
    dw Hitbox_Ridley_FacingRight_Claws                                   ;A6EA1B;
    dw $FFF0,$0000                                                       ;A6EA1D;
    dw Spritemap_Ridley_FacingRight_Torso                                ;A6EA21;
    dw Hitbox_Ridley_FacingRight_Torso                                   ;A6EA23;
    dw $0003,$FFE8                                                       ;A6EA25;
    dw Spritemap_Ridley_FacingRight_HeadNeck_MouthHalfOpened             ;A6EA29;
    dw Hitbox_Ridley_FacingRight_MouthHalfOpened                         ;A6EA2B;

ExtendedSpritemap_Ridley_FacingRight_MouthOpen:
    dw $0004                                                             ;A6EA2D;
    dw $FFF1,$0016
    dw Spritemap_Ridley_FacingRight_Legs_PulledUp                        ;A6EA33;
    dw Hitbox_Ridley_FacingRight_LegsPulledUp                            ;A6EA35;
    dw $0008,$0007                                                       ;A6EA37;
    dw Spritemap_Ridley_FacingRight_Claws                                ;A6EA3B;
    dw Hitbox_Ridley_FacingRight_Claws                                   ;A6EA3D;
    dw $FFF0,$0000                                                       ;A6EA3F;
    dw Spritemap_Ridley_FacingRight_Torso                                ;A6EA43;
    dw Hitbox_Ridley_FacingRight_Torso                                   ;A6EA45;
    dw $0003,$FFE8                                                       ;A6EA47;
    dw Spritemap_Ridley_FacingRight_HeadNeck_MouthOpen                   ;A6EA4B;
    dw Hitbox_Ridley_FacingRight_MouthOpen                               ;A6EA4D;

ExtendedSpritemap_Ridley_FacingLeft_LegsHalfExtended:
    dw $0004                                                             ;A6EA4F;
    dw $000F,$0016
    dw Spritemap_Ridley_FacingLeft_Legs_HalfExtended                     ;A6EA55;
    dw Hitbox_Ridley_FacingLeft_LegsHalfExtended                         ;A6EA57;
    dw $FFF8,$0007                                                       ;A6EA59;
    dw Spritemap_Ridley_FacingLeft_Claws                                 ;A6EA5D;
    dw Hitbox_Ridley_FacingLeft_Claws                                    ;A6EA5F;
    dw $0010,$0000                                                       ;A6EA61;
    dw Spritemap_Ridley_FacingLeft_Torso                                 ;A6EA65;
    dw Hitbox_Ridley_FacingLeft_Torso                                    ;A6EA67;
    dw $FFFD,$FFE8                                                       ;A6EA69;
    dw Spritemap_Ridley_FacingLeft_HeadNeck_MouthClosed                  ;A6EA6D;
    dw Hitbox_Ridley_FacingLeft_MouthClosed                              ;A6EA6F;

ExtendedSpritemap_Ridley_FacingLeft_LegsExtended:
    dw $0004                                                             ;A6EA71;
    dw $000F,$0016
    dw Spritemap_Ridley_FacingLeft_Legs_Extended                         ;A6EA77;
    dw Hitbox_Ridley_FacingLeft_LegsExtended                             ;A6EA79;
    dw $FFF8,$0007                                                       ;A6EA7B;
    dw Spritemap_Ridley_FacingLeft_Claws                                 ;A6EA7F;
    dw Hitbox_Ridley_FacingLeft_Claws                                    ;A6EA81;
    dw $0010,$0000                                                       ;A6EA83;
    dw Spritemap_Ridley_FacingLeft_Torso                                 ;A6EA87;
    dw Hitbox_Ridley_FacingLeft_Torso                                    ;A6EA89;
    dw $FFFD,$FFE8                                                       ;A6EA8B;
    dw Spritemap_Ridley_FacingLeft_HeadNeck_MouthClosed                  ;A6EA8F;
    dw Hitbox_Ridley_FacingLeft_MouthClosed                              ;A6EA91;

ExtendedSpritemap_Ridley_FacingRight_LegsHalfExtended:
    dw $0004                                                             ;A6EA93;
    dw $FFF1,$0016
    dw Spritemap_Ridley_FacingRight_Legs_HalfExtended                    ;A6EA99;
    dw Hitbox_Ridley_FacingRight_LegsHalfExtended                        ;A6EA9B;
    dw $0008,$0007                                                       ;A6EA9D;
    dw Spritemap_Ridley_FacingRight_Claws                                ;A6EAA1;
    dw Hitbox_Ridley_FacingRight_Claws                                   ;A6EAA3;
    dw $FFF0,$0000                                                       ;A6EAA5;
    dw Spritemap_Ridley_FacingRight_Torso                                ;A6EAA9;
    dw Hitbox_Ridley_FacingRight_Torso                                   ;A6EAAB;
    dw $0003,$FFE8                                                       ;A6EAAD;
    dw Spritemap_Ridley_FacingRight_HeadNeck_MouthClosed                 ;A6EAB1;
    dw Hitbox_Ridley_FacingRight_MouthClosed                             ;A6EAB3;

ExtendedSpritemap_Ridley_FacingRight_LegsExtended:
    dw $0004                                                             ;A6EAB5;
    dw $FFF1,$0016
    dw Spritemap_Ridley_FacingRight_Legs_Extended                        ;A6EABB;
    dw Hitbox_Ridley_FacingRight_LegsExtended                            ;A6EABD;
    dw $0008,$0007                                                       ;A6EABF;
    dw Spritemap_Ridley_FacingRight_Claws                                ;A6EAC3;
    dw Hitbox_Ridley_FacingRight_Claws                                   ;A6EAC5;
    dw $FFF0,$0000                                                       ;A6EAC7;
    dw Spritemap_Ridley_FacingRight_Torso                                ;A6EACB;
    dw Hitbox_Ridley_FacingRight_Torso                                   ;A6EACD;
    dw $0003,$FFE8                                                       ;A6EACF;
    dw Spritemap_Ridley_FacingRight_HeadNeck_MouthClosed                 ;A6EAD3;
    dw Hitbox_Ridley_FacingRight_MouthClosed                             ;A6EAD5;

ExtendedSpritemap_Ridley_FacingForward:
    dw $0001                                                             ;A6EAD7;
    dw $0000,$FFFA
    dw Spritemap_Ridley_FacingForward                                    ;A6EADD;
    dw Hitbox_Ridley_FacingForward                                       ;A6EADF;


;;; $EAE1: Ridley hitboxes ;;;
Hitbox_Ridley_FacingLeft_MouthClosed:
    dw $0002                                                             ;A6EAE1;
    dw $FFF4,$FFE6,$000B,$000D
    dw RidleyHitbox_vs_Samus_Collision                                   ;A6EAEB;
    dw EnemyShot_Ridley                                                  ;A6EAED;
    dw $FFE8,$0003,$FFF3,$0015                                           ;A6EAEF;
    dw RidleyHitbox_vs_Samus_Collision                                   ;A6EAF7;
    dw EnemyShot_Ridley                                                  ;A6EAF9;

Hitbox_Ridley_FacingLeft_MouthHalfOpen:
    dw $0002                                                             ;A6EAFB;
    dw $FFD7,$FFED,$FFEB,$FFF7
    dw RidleyHitbox_vs_Samus_Collision                                   ;A6EB05;
    dw EnemyShot_Ridley                                                  ;A6EB07;
    dw $FFEC,$FFE3,$000B,$0005                                           ;A6EB09;
    dw RidleyHitbox_vs_Samus_Collision                                   ;A6EB11;
    dw EnemyShot_Ridley                                                  ;A6EB13;

Hitbox_Ridley_FacingLeft_MouthOpen:
    dw $0002                                                             ;A6EB15;
    dw $FFDB,$FFD8,$FFF2,$FFE1
    dw RidleyHitbox_vs_Samus_Collision                                   ;A6EB1F;
    dw EnemyShot_Ridley                                                  ;A6EB21;
    dw $FFE7,$FFE1,$0009,$0006                                           ;A6EB23;
    dw RidleyHitbox_vs_Samus_Collision                                   ;A6EB2B;
    dw EnemyShot_Ridley                                                  ;A6EB2D;

Hitbox_Ridley_FacingLeft_LegsPulledUp:
    dw $0001                                                             ;A6EB2F;
    dw $FFF1,$FFF6,$0007,$0002
    dw RidleyHitbox_vs_Samus_Collision                                   ;A6EB39;
    dw EnemyShot_Ridley                                                  ;A6EB3B;

Hitbox_Ridley_FacingLeft_LegsHalfExtended:
    dw $0001                                                             ;A6EB3D;
    dw $FFEF,$FFF7,$0006,$000F
    dw RidleyHitbox_vs_Samus_Collision                                   ;A6EB47;
    dw EnemyShot_Ridley                                                  ;A6EB49;

Hitbox_Ridley_FacingLeft_LegsExtended:
    dw $0001                                                             ;A6EB4B;
    dw $FFF2,$FFFF,$000A,$0017
    dw RidleyHitbox_vs_Samus_Collision                                   ;A6EB55;
    dw EnemyShot_Ridley                                                  ;A6EB57;

Hitbox_Ridley_FacingLeft_Claws:
    dw $0001                                                             ;A6EB59;
    dw $FFF1,$FFFE,$FFFF,$0008
    dw RidleyHitbox_vs_Samus_Collision                                   ;A6EB63;
    dw EnemyShot_Ridley                                                  ;A6EB65;

Hitbox_Ridley_FacingLeft_Torso:
    dw $0001                                                             ;A6EB67;
    dw $FFF0,$FFEC,$000C,$0015
    dw RidleyHitbox_vs_Samus_Collision                                   ;A6EB71;
    dw EnemyShot_Ridley                                                  ;A6EB73;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitbox_Ridley_FacingLeft_A6EB75:
    dw $0001                                                             ;A6EB75;
    dw $FFF0,$FFEC,$000C,$0015
    dw RidleyHitbox_vs_Samus_Collision                                   ;A6EB7F;
    dw EnemyShot_Ridley                                                  ;A6EB81;

UNUSED_Hitbox_Ridley_FacingLeft_A6EB83:
    dw $0001                                                             ;A6EB83;
    dw $FFF0,$FFEC,$000C,$0015
    dw RidleyHitbox_vs_Samus_Collision                                   ;A6EB8D;
    dw EnemyShot_Ridley                                                  ;A6EB8F;
endif ; !FEATURE_KEEP_UNREFERENCED

Hitbox_Ridley_FacingForward:
    dw $0002                                                             ;A6EB91;
    dw $FFF0,$FFE0,$0010,$0022
    dw RidleyHitbox_vs_Samus_Collision                                   ;A6EB9B;
    dw EnemyShot_Ridley                                                  ;A6EB9D;
    dw $FFF8,$FFD3,$0008,$FFDF                                           ;A6EB9F;
    dw RidleyHitbox_vs_Samus_Collision                                   ;A6EBA7;
    dw EnemyShot_Ridley                                                  ;A6EBA9;

Hitbox_Ridley_FacingRight_MouthClosed:
    dw $0002                                                             ;A6EBAB;
    dw $FFF4,$FFE7,$000B,$000D
    dw RidleyHitbox_vs_Samus_Collision                                   ;A6EBB5;
    dw EnemyShot_Ridley                                                  ;A6EBB7;
    dw $000C,$0005,$0018,$0014                                           ;A6EBB9;
    dw RidleyHitbox_vs_Samus_Collision                                   ;A6EBC1;
    dw EnemyShot_Ridley                                                  ;A6EBC3;

Hitbox_Ridley_FacingRight_MouthHalfOpened:
    dw $0002                                                             ;A6EBC5;
    dw $FFF3,$FFE3,$0014,$0005
    dw RidleyHitbox_vs_Samus_Collision                                   ;A6EBCF;
    dw EnemyShot_Ridley                                                  ;A6EBD1;
    dw $0015,$FFEE,$0027,$FFF8                                           ;A6EBD3;
    dw RidleyHitbox_vs_Samus_Collision                                   ;A6EBDB;
    dw EnemyShot_Ridley                                                  ;A6EBDD;

Hitbox_Ridley_FacingRight_MouthOpen:
    dw $0002                                                             ;A6EBDF;
    dw $FFF6,$FFE1,$0019,$0008
    dw RidleyHitbox_vs_Samus_Collision                                   ;A6EBE9;
    dw EnemyShot_Ridley                                                  ;A6EBEB;
    dw $000D,$FFD6,$0023,$FFE0                                           ;A6EBED;
    dw RidleyHitbox_vs_Samus_Collision                                   ;A6EBF5;
    dw EnemyShot_Ridley                                                  ;A6EBF7;

Hitbox_Ridley_FacingRight_LegsPulledUp:
    dw $0001                                                             ;A6EBF9;
    dw $FFF6,$FFF6,$0011,$0002
    dw RidleyHitbox_vs_Samus_Collision                                   ;A6EC03;
    dw EnemyShot_Ridley                                                  ;A6EC05;

Hitbox_Ridley_FacingRight_LegsHalfExtended:
    dw $0001                                                             ;A6EC07;
    dw $FFF7,$FFF8,$0011,$000F
    dw RidleyHitbox_vs_Samus_Collision                                   ;A6EC11;
    dw EnemyShot_Ridley                                                  ;A6EC13;

Hitbox_Ridley_FacingRight_LegsExtended:
    dw $0001                                                             ;A6EC15;
    dw $FFF5,$FFF8,$000E,$0017
    dw RidleyHitbox_vs_Samus_Collision                                   ;A6EC1F;
    dw EnemyShot_Ridley                                                  ;A6EC21;

Hitbox_Ridley_FacingRight_Claws:
    dw $0001                                                             ;A6EC23;
    dw $0001,$FFFE,$000E,$0009
    dw RidleyHitbox_vs_Samus_Collision                                   ;A6EC2D;
    dw EnemyShot_Ridley                                                  ;A6EC2F;

Hitbox_Ridley_FacingRight_Torso:
    dw $0001                                                             ;A6EC31;
    dw $FFF3,$FFEA,$000E,$0015
    dw RidleyHitbox_vs_Samus_Collision                                   ;A6EC3B;
    dw EnemyShot_Ridley                                                  ;A6EC3D;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitbox_Ridley_FacingRight_A6EC3F:
    dw $0001                                                             ;A6EC3F;
    dw $FFF3,$FFEA,$000E,$0015
    dw RidleyHitbox_vs_Samus_Collision                                   ;A6EC49;
    dw EnemyShot_Ridley                                                  ;A6EC4B;

UNUSED_Hitbox_Ridley_FacingRight_A6EC4D:
    dw $0001                                                             ;A6EC4D;
    dw $FFF3,$FFEA,$000E,$0015
    dw RidleyHitbox_vs_Samus_Collision                                   ;A6EC57;
    dw EnemyShot_Ridley                                                  ;A6EC59;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $EC5B: Ridley spritemaps ;;;
Spritemap_Ridley_FacingLeft_HeadNeck_MouthClosed:
    dw $000C                                                             ;A6EC5B;
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
    dw $000D                                                             ;A6EC99;
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
    dw $000F                                                             ;A6ECDC;
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
    dw $0007                                                             ;A6ED29;
    %spritemapEntry(1, $1FA, $FF, 0, 0, 3, 0, $1AE)
    %spritemapEntry(1, $1EA, $FF, 0, 0, 3, 0, $1AC)
    %spritemapEntry(0, $08, $F8, 0, 0, 3, 0, $1BA)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 0, $1B9)
    %spritemapEntry(0, $08, $F0, 0, 0, 3, 0, $1AA)
    %spritemapEntry(0, $00, $F0, 0, 0, 3, 0, $1A9)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 3, 0, $1A7)

Spritemap_Ridley_FacingLeft_Legs_HalfExtended:
    dw $0006                                                             ;A6ED4E;
    %spritemapEntry(0, $1F9, $04, 0, 0, 3, 0, $1AB)
    %spritemapEntry(0, $1F1, $04, 0, 0, 3, 0, $15B)
    %spritemapEntry(1, $1F9, $0B, 0, 0, 3, 0, $1AE)
    %spritemapEntry(1, $1E9, $0B, 0, 0, 3, 0, $1AC)
    %spritemapEntry(1, $1FE, $F4, 0, 0, 3, 0, $1C2)
    %spritemapEntry(1, $1EE, $F4, 0, 0, 3, 0, $1C0)

Spritemap_Ridley_FacingLeft_Legs_Extended:
    dw $0006                                                             ;A6ED6E;
    %spritemapEntry(0, $1EF, $08, 0, 0, 3, 0, $1BB)
    %spritemapEntry(1, $1F7, $08, 0, 0, 3, 0, $1CE)
    %spritemapEntry(1, $1FD, $13, 0, 0, 3, 0, $1AE)
    %spritemapEntry(1, $1ED, $13, 0, 0, 3, 0, $1AC)
    %spritemapEntry(1, $1FE, $F8, 0, 0, 3, 0, $1C6)
    %spritemapEntry(1, $1EE, $F8, 0, 0, 3, 0, $1C4)

Spritemap_Ridley_FacingLeft_Claws:
    dw $0001                                                             ;A6ED8E;
    %spritemapEntry(1, $1F0, $FC, 0, 0, 3, 0, $140)

Spritemap_Ridley_FacingLeft_Torso:
    dw $0006                                                             ;A6ED95;
    %spritemapEntry(1, $1E8, $03, 0, 0, 3, 0, $1CC)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 3, 0, $120)
    %spritemapEntry(1, $00, $F8, 0, 0, 3, 0, $122)
    %spritemapEntry(1, $1FE, $06, 0, 0, 3, 0, $122)
    %spritemapEntry(1, $00, $E8, 0, 0, 3, 0, $102)
    %spritemapEntry(1, $1F0, $E8, 0, 0, 3, 0, $100)

Spritemap_Ridley_FacingForward:
    dw $0020                                                             ;A6EDB5;
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
    dw $000C                                                             ;A6EE57;
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
    dw $000D                                                             ;A6EE95;
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
    dw $000F                                                             ;A6EED8;
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
    dw $0007                                                             ;A6EF25;
    %spritemapEntry(1, $1F6, $FF, 0, 1, 3, 0, $1AE)
    %spritemapEntry(1, $06, $FF, 0, 1, 3, 0, $1AC)
    %spritemapEntry(0, $1F0, $F8, 0, 1, 3, 0, $1BA)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 3, 0, $1B9)
    %spritemapEntry(0, $1F0, $F0, 0, 1, 3, 0, $1AA)
    %spritemapEntry(0, $1F8, $F0, 0, 1, 3, 0, $1A9)
    %spritemapEntry(1, $00, $F0, 0, 1, 3, 0, $1A7)

Spritemap_Ridley_FacingRight_Legs_HalfExtended:
    dw $0006                                                             ;A6EF4A;
    %spritemapEntry(0, $1FF, $04, 0, 1, 3, 0, $1AB)
    %spritemapEntry(0, $07, $04, 0, 1, 3, 0, $15B)
    %spritemapEntry(1, $1F7, $0B, 0, 1, 3, 0, $1AE)
    %spritemapEntry(1, $07, $0B, 0, 1, 3, 0, $1AC)
    %spritemapEntry(1, $1F2, $F4, 0, 1, 3, 0, $1C2)
    %spritemapEntry(1, $02, $F4, 0, 1, 3, 0, $1C0)

Spritemap_Ridley_FacingRight_Legs_Extended:
    dw $0006                                                             ;A6EF6A;
    %spritemapEntry(0, $09, $08, 0, 1, 3, 0, $1BB)
    %spritemapEntry(1, $1F9, $08, 0, 1, 3, 0, $1CE)
    %spritemapEntry(1, $1F3, $13, 0, 1, 3, 0, $1AE)
    %spritemapEntry(1, $03, $13, 0, 1, 3, 0, $1AC)
    %spritemapEntry(1, $1F2, $F8, 0, 1, 3, 0, $1C6)
    %spritemapEntry(1, $02, $F8, 0, 1, 3, 0, $1C4)

Spritemap_Ridley_FacingRight_Claws:
    dw $0001                                                             ;A6EF8A;
    %spritemapEntry(1, $00, $FC, 0, 1, 3, 0, $140)

Spritemap_Ridley_FacingRight_Torso:
    dw $0006                                                             ;A6EF91;
    %spritemapEntry(1, $08, $03, 0, 1, 3, 0, $1CC)
    %spritemapEntry(1, $00, $F8, 0, 1, 3, 0, $120)
    %spritemapEntry(1, $1F0, $F8, 0, 1, 3, 0, $122)
    %spritemapEntry(1, $1F2, $06, 0, 1, 3, 0, $122)
    %spritemapEntry(1, $1F0, $E8, 0, 1, 3, 0, $102)
    %spritemapEntry(1, $00, $E8, 0, 1, 3, 0, $100)


;;; $EFB1: Initialisation AI - enemy $E1FF (Ceres steam) ;;;
InitAI_CeresSteam:
    LDX.W EnemyIndex                                                     ;A6EFB1;
    STZ.W Enemy.GFXOffset,X                                              ;A6EFB4;
    LDA.W Enemy.properties,X                                             ;A6EFB7;
    ORA.W #$2000                                                         ;A6EFBA;
    STA.W Enemy.properties,X                                             ;A6EFBD;
    LDA.W Enemy.properties2,X                                            ;A6EFC0;
    ORA.W #$0004                                                         ;A6EFC3;
    STA.W Enemy.properties2,X                                            ;A6EFC6;
    LDA.W #$0001                                                         ;A6EFC9;
    STA.W Enemy.instTimer,X                                              ;A6EFCC;
    STZ.W Enemy.loopCounter,X                                            ;A6EFCF;
    LDA.W #$0A00                                                         ;A6EFD2;
    STA.W Enemy.palette,X                                                ;A6EFD5;
    JSL.L GenerateRandomNumber                                           ;A6EFD8;
    AND.W #$001F                                                         ;A6EFDC;
    INC                                                                  ;A6EFDF;
    STA.W Steam.activationTimer,X                                        ;A6EFE0;
    LDA.W Enemy.init0,X                                                  ;A6EFE3;
    ASL                                                                  ;A6EFE6;
    TAY                                                                  ;A6EFE7;
    LDA.W InitAI_CeresSteam_instListPointers,Y                           ;A6EFE8;
    STA.W Enemy.instList,X                                               ;A6EFEB;
    LDA.W InitAI_CeresSteam_initialFunctionPointers,Y                    ;A6EFEE;
    STA.W Steam.function,X                                               ;A6EFF1;

  .return:
    RTL                                                                  ;A6EFF4;


; Indexed by [enemy parameter 1] * 2
InitAI_CeresSteam_instListPointers:
    dw InstList_CeresSteam_Up_0                                          ;A6EFF5;
    dw InstList_CeresSteam_Left_0                                        ;A6EFF7;
    dw InstList_CeresSteam_Down_0                                        ;A6EFF9;
    dw InstList_CeresSteam_Right_0                                       ;A6EFFB;
    dw InstList_CeresSteam_Left_0                                        ;A6EFFD;
    dw InstList_CeresSteam_Right_0                                       ;A6EFFF;

InitAI_CeresSteam_initialFunctionPointers:
    dw InitAI_CeresSteam_return                                          ;A6F001;
    dw InitAI_CeresSteam_return                                          ;A6F003;
    dw InitAI_CeresSteam_return                                          ;A6F005;
    dw InitAI_CeresSteam_return                                          ;A6F007;
    dw Func_CeresSteam_CalculateGraphicalOffsetInRotatingElevRoom        ;A6F009;
    dw Func_CeresSteam_CalculateGraphicalOffsetInRotatingElevRoom        ;A6F00B;


;;; $F00D: Main AI - enemy $E1FF (Ceres steam) ;;;
MainAI_CeresSteam:
    LDX.W EnemyIndex                                                     ;A6F00D;
    LDA.W #$7FFF                                                         ;A6F010;
    STA.W Enemy.health,X                                                 ;A6F013;
    JMP.W (Steam.function,X)                                             ;A6F016;


;;; $F019: Ceres steam function - calculate graphical offset in rotating elevator room ;;;
Func_CeresSteam_CalculateGraphicalOffsetInRotatingElevRoom:
    LDA.W Enemy.XPosition,X                                              ;A6F019;
    STA.B DP_Temp12                                                      ;A6F01C;
    LDA.W Enemy.YPosition,X                                              ;A6F01E;
    STA.B DP_Temp14                                                      ;A6F021;
    JSL.L Calculate_CeresSteamPosition_InRotatingElevatorRoom            ;A6F023;
    LDX.W EnemyIndex                                                     ;A6F027;
    LDA.B DP_Temp12                                                      ;A6F02A;
    SEC                                                                  ;A6F02C;
    SBC.W Enemy.XPosition,X                                              ;A6F02D;
    STA.L EnemySpawnData.graphicalXOffset,X                              ;A6F030;
    LDA.B DP_Temp14                                                      ;A6F034;
    SEC                                                                  ;A6F036;
    SBC.W Enemy.YPosition,X                                              ;A6F037;
    STA.L EnemySpawnData.graphicalYOffset,X                              ;A6F03A;
    RTL                                                                  ;A6F03E;


;;; $F03F: Enemy touch - enemy $E1FF (Ceres steam) ;;;
EnemyTouch_CeresSteam:
    LDX.W EnemyIndex                                                     ;A6F03F;
    LDA.W #$7FFF                                                         ;A6F042;
    STA.W Enemy.health,X                                                 ;A6F045;
    JSL.L NormalEnemyTouchAI                                             ;A6F048;
    RTL                                                                  ;A6F04C;


;;; $F04D: Instruction list - Ceres steam - up ;;;
InstList_CeresSteam_Up_0:
    dw Instruction_CeresSteam_SetToIntangibleAndInvisible                ;A6F04D;
    dw $0001,ExtendedSpritemap_CeresSteam_Up_0                           ;A6F04F;
    dw Instruction_CeresSteam_DecActivationTimer_Decide_GotoYOrY2        ;A6F053;
    dw InstList_CeresSteam_Up_0                                          ;A6F055;
    dw InstList_CeresSteam_Up_2                                          ;A6F057;

InstList_CeresSteam_Up_1:
    dw Instruction_CeresSteam_SetToIntangibleAndInvisible                ;A6F059;
    dw $0040,ExtendedSpritemap_CeresSteam_Up_0                           ;A6F05B;
    dw Instruction_CeresSteam_SetToTangibleAndVisible                    ;A6F05F;

InstList_CeresSteam_Up_2:
    dw $0003,ExtendedSpritemap_CeresSteam_Up_0                           ;A6F061;
    dw $0003,ExtendedSpritemap_CeresSteam_Up_1                           ;A6F065;
    dw $0003,ExtendedSpritemap_CeresSteam_Up_2                           ;A6F069;
    dw $0003,ExtendedSpritemap_CeresSteam_Up_3                           ;A6F06D;
    dw $0003,ExtendedSpritemap_CeresSteam_Up_4                           ;A6F071;
    dw $0003,ExtendedSpritemap_CeresSteam_Up_5                           ;A6F075;
    dw $0003,ExtendedSpritemap_CeresSteam_Up_6                           ;A6F079;
    dw Instruction_Common_GotoY                                          ;A6F07D;
    dw InstList_CeresSteam_Up_1                                          ;A6F07F;


;;; $F081: Instruction list - Ceres steam - left ;;;
InstList_CeresSteam_Left_0:
    dw Instruction_CeresSteam_SetToIntangibleAndInvisible                ;A6F081;
    dw $0001,ExtendedSpritemap_CeresSteam_Left_0                         ;A6F083;
    dw Instruction_CeresSteam_DecActivationTimer_Decide_GotoYOrY2        ;A6F087;
    dw InstList_CeresSteam_Left_0                                        ;A6F089;
    dw InstList_CeresSteam_Left_2                                        ;A6F08B;

InstList_CeresSteam_Left_1:
    dw Instruction_CeresSteam_SetToIntangibleAndInvisible                ;A6F08D;
    dw $0040,ExtendedSpritemap_CeresSteam_Left_0                         ;A6F08F;
    dw Instruction_CeresSteam_SetToTangibleAndVisible                    ;A6F093;

InstList_CeresSteam_Left_2:
    dw $0003,ExtendedSpritemap_CeresSteam_Left_0                         ;A6F095;
    dw $0003,ExtendedSpritemap_CeresSteam_Left_1                         ;A6F099;
    dw $0003,ExtendedSpritemap_CeresSteam_Left_2                         ;A6F09D;
    dw $0003,ExtendedSpritemap_CeresSteam_Left_3                         ;A6F0A1;
    dw $0003,ExtendedSpritemap_CeresSteam_Left_4                         ;A6F0A5;
    dw $0003,ExtendedSpritemap_CeresSteam_Left_5                         ;A6F0A9;
    dw $0003,ExtendedSpritemap_CeresSteam_Left_6                         ;A6F0AD;
    dw Instruction_Common_GotoY                                          ;A6F0B1;
    dw InstList_CeresSteam_Left_1                                        ;A6F0B3;


;;; $F0B5: Instruction list - Ceres steam - down ;;;
InstList_CeresSteam_Down_0:
    dw Instruction_CeresSteam_SetToIntangibleAndInvisible                ;A6F0B5;
    dw $0001,ExtendedSpritemap_CeresSteam_Down_0                         ;A6F0B7;
    dw Instruction_CeresSteam_DecActivationTimer_Decide_GotoYOrY2        ;A6F0BB;
    dw InstList_CeresSteam_Down_0                                        ;A6F0BD;
    dw InstList_CeresSteam_Down_2                                        ;A6F0BF;

InstList_CeresSteam_Down_1:
    dw Instruction_CeresSteam_SetToIntangibleAndInvisible                ;A6F0C1;
    dw $0040,ExtendedSpritemap_CeresSteam_Down_0                         ;A6F0C3;
    dw Instruction_CeresSteam_SetToTangibleAndVisible                    ;A6F0C7;

InstList_CeresSteam_Down_2:
    dw $0003,ExtendedSpritemap_CeresSteam_Down_0                         ;A6F0C9;
    dw $0003,ExtendedSpritemap_CeresSteam_Down_1                         ;A6F0CD;
    dw $0003,ExtendedSpritemap_CeresSteam_Down_2                         ;A6F0D1;
    dw $0003,ExtendedSpritemap_CeresSteam_Down_3                         ;A6F0D5;
    dw $0003,ExtendedSpritemap_CeresSteam_Down_4                         ;A6F0D9;
    dw $0003,ExtendedSpritemap_CeresSteam_Down_5                         ;A6F0DD;
    dw $0003,ExtendedSpritemap_CeresSteam_Down_6                         ;A6F0E1;
    dw Instruction_Common_GotoY                                          ;A6F0E5;
    dw InstList_CeresSteam_Down_1                                        ;A6F0E7;


;;; $F0E9: Instruction list - Ceres steam - right ;;;
InstList_CeresSteam_Right_0:
    dw Instruction_CeresSteam_SetToIntangibleAndInvisible                ;A6F0E9;
    dw $0001,ExtendedSpritemap_CeresSteam_Right_0                        ;A6F0EB;
    dw Instruction_CeresSteam_DecActivationTimer_Decide_GotoYOrY2        ;A6F0EF;
    dw InstList_CeresSteam_Right_0                                       ;A6F0F1;
    dw InstList_CeresSteam_Right_2                                       ;A6F0F3;

InstList_CeresSteam_Right_1:
    dw Instruction_CeresSteam_SetToIntangibleAndInvisible                ;A6F0F5;
    dw $0040,ExtendedSpritemap_CeresSteam_Right_0                        ;A6F0F7;
    dw Instruction_CeresSteam_SetToTangibleAndVisible                    ;A6F0FB;

InstList_CeresSteam_Right_2:
    dw $0003,ExtendedSpritemap_CeresSteam_Right_0                        ;A6F0FD;
    dw $0003,ExtendedSpritemap_CeresSteam_Right_1                        ;A6F101;
    dw $0003,ExtendedSpritemap_CeresSteam_Right_2                        ;A6F105;
    dw $0003,ExtendedSpritemap_CeresSteam_Right_3                        ;A6F109;
    dw $0003,ExtendedSpritemap_CeresSteam_Right_4                        ;A6F10D;
    dw $0003,ExtendedSpritemap_CeresSteam_Right_5                        ;A6F111;
    dw $0003,ExtendedSpritemap_CeresSteam_Right_6                        ;A6F115;
    dw Instruction_Common_GotoY                                          ;A6F119;
    dw InstList_CeresSteam_Right_1                                       ;A6F11B;


;;; $F11D: Instruction - hide enemy ;;;
Instruction_CeresSteam_SetToIntangibleAndInvisible:
    LDA.W Enemy.properties,X                                             ;A6F11D;
    ORA.W #$0500                                                         ;A6F120;
    STA.W Enemy.properties,X                                             ;A6F123;
    RTL                                                                  ;A6F126;


;;; $F127: Instruction - decrement activation timer and go to [[Y]] if non-zero, otherwise show enemy and go to [[Y] + 2] ;;;
Instruction_CeresSteam_DecActivationTimer_Decide_GotoYOrY2:
    DEC.W Steam.activationTimer,X                                        ;A6F127;
    BEQ .gotoY2                                                          ;A6F12A;
    LDA.W $0000,Y                                                        ;A6F12C;
    TAY                                                                  ;A6F12F;
    RTL                                                                  ;A6F130;

  .gotoY2:
    LDA.W $0002,Y                                                        ;A6F131;
    TAY                                                                  ;A6F134; fallthrough to Instruction_CeresSteam_SetToTangibleAndVisible


;;; $F135: Instruction - show enemy ;;;
Instruction_CeresSteam_SetToTangibleAndVisible:
    LDA.W Enemy.properties,X                                             ;A6F135;
    AND.W #$FBFF                                                         ;A6F138; >.< #$FAFF
    AND.W #$FEFF                                                         ;A6F13B;
    STA.W Enemy.properties,X                                             ;A6F13E;
    RTL                                                                  ;A6F141;


;;; $F142: Ceres steam extended spritemaps ;;;
; Top byte of extended spritemap size is ignored...
ExtendedSpritemap_CeresSteam_Up_0:
    dw $1001                                                             ;A6F142;
    dw $0000,$0000
    dw Spritemap_CeresSteam_Up_0                                         ;A6F148;
    dw Hitbox_CeresSteam_Up_0                                            ;A6F14A;

ExtendedSpritemap_CeresSteam_Up_1:
    dw $1001                                                             ;A6F14C;
    dw $0000,$0000
    dw Spritemap_CeresSteam_Up_1                                         ;A6F152;
    dw Hitbox_CeresSteam_Up_1                                            ;A6F154;

ExtendedSpritemap_CeresSteam_Up_2:
    dw $1001                                                             ;A6F156;
    dw $0000,$0000
    dw Spritemap_CeresSteam_Up_2                                         ;A6F15C;
    dw Hitbox_CeresSteam_Up_2                                            ;A6F15E;

ExtendedSpritemap_CeresSteam_Up_3:
    dw $1001                                                             ;A6F160;
    dw $0000,$0000
    dw Spritemap_CeresSteam_Up_3                                         ;A6F166;
    dw Hitbox_CeresSteam_Up_3                                            ;A6F168;

ExtendedSpritemap_CeresSteam_Up_4:
    dw $1001                                                             ;A6F16A;
    dw $0000,$0000
    dw Spritemap_CeresSteam_Up_4                                         ;A6F170;
    dw Hitbox_CeresSteam_Up_4                                            ;A6F172;

ExtendedSpritemap_CeresSteam_Up_5:
    dw $1001                                                             ;A6F174;
    dw $0000,$0000
    dw Spritemap_CeresSteam_Up_5                                         ;A6F17A;
    dw Hitbox_CeresSteam_Nothing                                         ;A6F17C;

ExtendedSpritemap_CeresSteam_Up_6:
    dw $1001                                                             ;A6F17E;
    dw $0000,$0000
    dw Spritemap_CeresSteam_Up_6                                         ;A6F184;
    dw Hitbox_CeresSteam_Nothing                                         ;A6F186;

ExtendedSpritemap_CeresSteam_Left_0:
    dw $1001                                                             ;A6F188;
    dw $0000,$0000
    dw Spritemap_CeresSteam_Left_0                                       ;A6F18E;
    dw Hitbox_CeresSteam_Left_0                                          ;A6F190;

ExtendedSpritemap_CeresSteam_Left_1:
    dw $1001                                                             ;A6F192;
    dw $0000,$0000
    dw Spritemap_CeresSteam_Left_1                                       ;A6F198;
    dw Hitbox_CeresSteam_Left_1                                          ;A6F19A;

ExtendedSpritemap_CeresSteam_Left_2:
    dw $1001                                                             ;A6F19C;
    dw $0000,$0000
    dw Spritemap_CeresSteam_Left_2                                       ;A6F1A2;
    dw Hitbox_CeresSteam_Left_2                                          ;A6F1A4;

ExtendedSpritemap_CeresSteam_Left_3:
    dw $1001                                                             ;A6F1A6;
    dw $0000,$0000
    dw Spritemap_CeresSteam_Left_3                                       ;A6F1AC;
    dw Hitbox_CeresSteam_Left_3                                          ;A6F1AE;

ExtendedSpritemap_CeresSteam_Left_4:
    dw $1001                                                             ;A6F1B0;
    dw $0000,$0000
    dw Spritemap_CeresSteam_Left_4                                       ;A6F1B6;
    dw Hitbox_CeresSteam_Left_4                                          ;A6F1B8;

ExtendedSpritemap_CeresSteam_Left_5:
    dw $1001                                                             ;A6F1BA;
    dw $0000,$0000
    dw Spritemap_CeresSteam_Left_5                                       ;A6F1C0;
    dw Hitbox_CeresSteam_Nothing                                         ;A6F1C2;

ExtendedSpritemap_CeresSteam_Left_6:
    dw $1001                                                             ;A6F1C4;
    dw $0000,$0000
    dw Spritemap_CeresSteam_Left_6                                       ;A6F1CA;
    dw Hitbox_CeresSteam_Nothing                                         ;A6F1CC;

ExtendedSpritemap_CeresSteam_Down_0:
    dw $1001                                                             ;A6F1CE;
    dw $0000,$0000
    dw Spritemap_CeresSteam_Down_0                                       ;A6F1D4;
    dw Hitbox_CeresSteam_Down_0                                          ;A6F1D6;

ExtendedSpritemap_CeresSteam_Down_1:
    dw $1001                                                             ;A6F1D8;
    dw $0000,$0000
    dw Spritemap_CeresSteam_Down_1                                       ;A6F1DE;
    dw Hitbox_CeresSteam_Down_1                                          ;A6F1E0;

ExtendedSpritemap_CeresSteam_Down_2:
    dw $1001                                                             ;A6F1E2;
    dw $0000,$0000
    dw Spritemap_CeresSteam_Down_2                                       ;A6F1E8;
    dw Hitbox_CeresSteam_Down_2                                          ;A6F1EA;

ExtendedSpritemap_CeresSteam_Down_3:
    dw $1001                                                             ;A6F1EC;
    dw $0000,$0000
    dw Spritemap_CeresSteam_Down_3                                       ;A6F1F2;
    dw Hitbox_CeresSteam_Down_3                                          ;A6F1F4;

ExtendedSpritemap_CeresSteam_Down_4:
    dw $1001                                                             ;A6F1F6;
    dw $0000,$0000
    dw Spritemap_CeresSteam_Down_4                                       ;A6F1FC;
    dw Hitbox_CeresSteam_Down_4                                          ;A6F1FE;

ExtendedSpritemap_CeresSteam_Down_5:
    dw $1001                                                             ;A6F200;
    dw $0000,$0000
    dw Spritemap_CeresSteam_Down_5                                       ;A6F206;
    dw Hitbox_CeresSteam_Nothing                                         ;A6F208;

ExtendedSpritemap_CeresSteam_Down_6:
    dw $1001                                                             ;A6F20A;
    dw $0000,$0000
    dw Spritemap_CeresSteam_Down_6                                       ;A6F210;
    dw Hitbox_CeresSteam_Nothing                                         ;A6F212;

ExtendedSpritemap_CeresSteam_Right_0:
    dw $1001                                                             ;A6F214;
    dw $0000,$0000
    dw Spritemap_CeresSteam_Right_0                                      ;A6F21A;
    dw Hitbox_CeresSteam_Right_0                                         ;A6F21C;

ExtendedSpritemap_CeresSteam_Right_1:
    dw $1001                                                             ;A6F21E;
    dw $0000,$0000
    dw Spritemap_CeresSteam_Right_1                                      ;A6F224;
    dw Hitbox_CeresSteam_Right_1                                         ;A6F226;

ExtendedSpritemap_CeresSteam_Right_2:
    dw $1001                                                             ;A6F228;
    dw $0000,$0000
    dw Spritemap_CeresSteam_Right_2                                      ;A6F22E;
    dw Hitbox_CeresSteam_Right_2                                         ;A6F230;

ExtendedSpritemap_CeresSteam_Right_3:
    dw $1001                                                             ;A6F232;
    dw $0000,$0000
    dw Spritemap_CeresSteam_Right_3                                      ;A6F238;
    dw Hitbox_CeresSteam_Right_3                                         ;A6F23A;

ExtendedSpritemap_CeresSteam_Right_4:
    dw $1001                                                             ;A6F23C;
    dw $0000,$0000
    dw Spritemap_CeresSteam_Right_4                                      ;A6F242;
    dw Hitbox_CeresSteam_Right_4                                         ;A6F244;

ExtendedSpritemap_CeresSteam_Right_5:
    dw $1001                                                             ;A6F246;
    dw $0000,$0000
    dw Spritemap_CeresSteam_Right_5                                      ;A6F24C;
    dw Hitbox_CeresSteam_Nothing                                         ;A6F24E;

ExtendedSpritemap_CeresSteam_Right_6:
    dw $1001                                                             ;A6F250;
    dw $0000,$0000
    dw Spritemap_CeresSteam_Right_6                                      ;A6F256;
    dw Hitbox_CeresSteam_Nothing                                         ;A6F258;


;;; $F25A: Ceres steam hitboxes ;;;
Hitbox_CeresSteam_Nothing:
    dw $0000                                                             ;A6F25A;

Hitbox_CeresSteam_Up_0:
    dw $0001                                                             ;A6F25C;
    dw $FFF8,$FFF0,$0007,$FFFF
    dw EnemyTouch_CeresSteam                                             ;A6F266;
    dw RTL_A6804C                                                        ;A6F268;

Hitbox_CeresSteam_Up_1:
    dw $0001                                                             ;A6F26A;
    dw $FFF8,$FFE9,$0007,$FFFE
    dw EnemyTouch_CeresSteam                                             ;A6F274;
    dw RTL_A6804C                                                        ;A6F276;

Hitbox_CeresSteam_Up_2:
    dw $0001                                                             ;A6F278;
    dw $FFF8,$FFE0,$0007,$FFF8
    dw EnemyTouch_CeresSteam                                             ;A6F282;
    dw RTL_A6804C                                                        ;A6F284;

Hitbox_CeresSteam_Up_3:
    dw $0001                                                             ;A6F286;
    dw $FFF8,$FFD8,$0007,$FFF0
    dw EnemyTouch_CeresSteam                                             ;A6F290;
    dw RTL_A6804C                                                        ;A6F292;

Hitbox_CeresSteam_Up_4:
    dw $0001                                                             ;A6F294;
    dw $FFF8,$FFD8,$0006,$FFE8
    dw EnemyTouch_CeresSteam                                             ;A6F29E;
    dw RTL_A6804C                                                        ;A6F2A0;

Hitbox_CeresSteam_Left_0:
    dw $0001                                                             ;A6F2A2;
    dw $FFF0,$FFF8,$FFFF,$0007
    dw EnemyTouch_CeresSteam                                             ;A6F2AC;
    dw RTL_A6804C                                                        ;A6F2AE;

Hitbox_CeresSteam_Left_1:
    dw $0001                                                             ;A6F2B0;
    dw $FFE8,$FFF8,$FFFE,$0007
    dw EnemyTouch_CeresSteam                                             ;A6F2BA;
    dw RTL_A6804C                                                        ;A6F2BC;

Hitbox_CeresSteam_Left_2:
    dw $0001                                                             ;A6F2BE;
    dw $FFE0,$FFF9,$FFF7,$0007
    dw EnemyTouch_CeresSteam                                             ;A6F2C8;
    dw RTL_A6804C                                                        ;A6F2CA;

Hitbox_CeresSteam_Left_3:
    dw $0001                                                             ;A6F2CC;
    dw $FFD8,$FFF7,$FFEF,$0005
    dw EnemyTouch_CeresSteam                                             ;A6F2D6;
    dw RTL_A6804C                                                        ;A6F2D8;

Hitbox_CeresSteam_Left_4:
    dw $0001                                                             ;A6F2DA;
    dw $FFD8,$FFF5,$FFE6,$0002
    dw EnemyTouch_CeresSteam                                             ;A6F2E4;
    dw RTL_A6804C                                                        ;A6F2E6;

Hitbox_CeresSteam_Down_0:
    dw $0001                                                             ;A6F2E8;
    dw $FFF8,$0000,$0007,$000E
    dw EnemyTouch_CeresSteam                                             ;A6F2F2;
    dw RTL_A6804C                                                        ;A6F2F4;

Hitbox_CeresSteam_Down_1:
    dw $0001                                                             ;A6F2F6;
    dw $FFF8,$0000,$0007,$0017
    dw EnemyTouch_CeresSteam                                             ;A6F300;
    dw RTL_A6804C                                                        ;A6F302;

Hitbox_CeresSteam_Down_2:
    dw $0001                                                             ;A6F304;
    dw $FFF8,$0008,$0007,$001F
    dw EnemyTouch_CeresSteam                                             ;A6F30E;
    dw RTL_A6804C                                                        ;A6F310;

Hitbox_CeresSteam_Down_3:
    dw $0001                                                             ;A6F312;
    dw $FFF8,$000F,$0007,$0027
    dw EnemyTouch_CeresSteam                                             ;A6F31C;
    dw RTL_A6804C                                                        ;A6F31E;

Hitbox_CeresSteam_Down_4:
    dw $0001                                                             ;A6F320;
    dw $FFF8,$0017,$0006,$0026
    dw EnemyTouch_CeresSteam                                             ;A6F32A;
    dw RTL_A6804C                                                        ;A6F32C;

Hitbox_CeresSteam_Right_0:
    dw $0001                                                             ;A6F32E;
    dw $0000,$FFF8,$000F,$0007
    dw EnemyTouch_CeresSteam                                             ;A6F338;
    dw RTL_A6804C                                                        ;A6F33A;

Hitbox_CeresSteam_Right_1:
    dw $0001                                                             ;A6F33C;
    dw $0001,$FFF8,$0017,$0007
    dw EnemyTouch_CeresSteam                                             ;A6F346;
    dw RTL_A6804C                                                        ;A6F348;

Hitbox_CeresSteam_Right_2:
    dw $0001                                                             ;A6F34A;
    dw $0009,$FFF8,$001F,$0007
    dw EnemyTouch_CeresSteam                                             ;A6F354;
    dw RTL_A6804C                                                        ;A6F356;

Hitbox_CeresSteam_Right_3:
    dw $0001                                                             ;A6F358;
    dw $0012,$FFF7,$0026,$0005
    dw EnemyTouch_CeresSteam                                             ;A6F362;
    dw RTL_A6804C                                                        ;A6F364;

Hitbox_CeresSteam_Right_4:
    dw $0001                                                             ;A6F366;
    dw $0019,$FFF5,$0028,$0003
    dw EnemyTouch_CeresSteam                                             ;A6F370;
    dw RTL_A6804C                                                        ;A6F372;


;;; $F374: Ceres steam spritemaps ;;;
Spritemap_CeresSteam_Up_0:
    dw $0001                                                             ;A6F374;
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $7C)

Spritemap_CeresSteam_Up_1:
    dw $0002                                                             ;A6F37B;
    %spritemapEntry(1, $1F8, $E8, 0, 0, 2, 0, $7C)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $7E)

Spritemap_CeresSteam_Up_2:
    dw $0003                                                             ;A6F387;
    %spritemapEntry(1, $1F8, $E0, 0, 0, 2, 0, $7C)
    %spritemapEntry(1, $1F8, $E8, 0, 0, 2, 0, $7E)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $9A)

Spritemap_CeresSteam_Up_3:
    dw $0004                                                             ;A6F398;
    %spritemapEntry(1, $1F8, $D7, 0, 0, 2, 0, $7C)
    %spritemapEntry(1, $1F8, $E0, 0, 0, 2, 0, $7E)
    %spritemapEntry(1, $1F8, $E8, 0, 0, 2, 0, $9A)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $9C)

Spritemap_CeresSteam_Up_4:
    dw $0003                                                             ;A6F3AE;
    %spritemapEntry(1, $1F8, $D6, 0, 0, 2, 0, $7E)
    %spritemapEntry(1, $1F8, $E0, 0, 0, 2, 0, $9A)
    %spritemapEntry(1, $1F8, $E8, 0, 0, 2, 0, $9C)

Spritemap_CeresSteam_Up_5:
    dw $0002                                                             ;A6F3BF;
    %spritemapEntry(1, $1F8, $D5, 0, 0, 2, 0, $9A)
    %spritemapEntry(1, $1F8, $E0, 0, 0, 2, 0, $9C)

Spritemap_CeresSteam_Up_6:
    dw $0001                                                             ;A6F3CB;
    %spritemapEntry(1, $1F8, $D3, 0, 0, 2, 0, $9C)

Spritemap_CeresSteam_Left_0:
    dw $0001                                                             ;A6F3D2;
    %spritemapEntry(1, $1F0, $F8, 0, 0, 2, 0, $7C)

Spritemap_CeresSteam_Left_1:
    dw $0002                                                             ;A6F3D9;
    %spritemapEntry(1, $1E8, $F8, 0, 0, 2, 0, $7C)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 2, 0, $7E)

Spritemap_CeresSteam_Left_2:
    dw $0003                                                             ;A6F3E5;
    %spritemapEntry(1, $1E0, $F8, 0, 0, 2, 0, $7C)
    %spritemapEntry(1, $1E8, $F8, 0, 0, 2, 0, $7E)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 2, 0, $9A)

Spritemap_CeresSteam_Left_3:
    dw $0004                                                             ;A6F3F6;
    %spritemapEntry(1, $1D8, $F6, 0, 0, 2, 0, $7C)
    %spritemapEntry(1, $1E0, $F8, 0, 0, 2, 0, $7E)
    %spritemapEntry(1, $1E8, $F8, 0, 0, 2, 0, $9A)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 2, 0, $9C)

Spritemap_CeresSteam_Left_4:
    dw $0003                                                             ;A6F40C;
    %spritemapEntry(1, $1D7, $F4, 0, 0, 2, 0, $7E)
    %spritemapEntry(1, $1E0, $F6, 0, 0, 2, 0, $9A)
    %spritemapEntry(1, $1E8, $F8, 0, 0, 2, 0, $9C)

Spritemap_CeresSteam_Left_5:
    dw $0002                                                             ;A6F41D;
    %spritemapEntry(1, $1D6, $F2, 0, 0, 2, 0, $9A)
    %spritemapEntry(1, $1E0, $F4, 0, 0, 2, 0, $9C)

Spritemap_CeresSteam_Left_6:
    dw $0001                                                             ;A6F429;
    %spritemapEntry(1, $1D5, $F0, 0, 0, 2, 0, $9C)

Spritemap_CeresSteam_Down_0:
    dw $0001                                                             ;A6F430;
    %spritemapEntry(1, $1F8, $00, 1, 0, 2, 0, $7C)

Spritemap_CeresSteam_Down_1:
    dw $0002                                                             ;A6F437;
    %spritemapEntry(1, $1F8, $08, 1, 0, 2, 0, $7C)
    %spritemapEntry(1, $1F8, $00, 1, 0, 2, 0, $7E)

Spritemap_CeresSteam_Down_2:
    dw $0003                                                             ;A6F443;
    %spritemapEntry(1, $1F8, $10, 1, 0, 2, 0, $7C)
    %spritemapEntry(1, $1F8, $08, 1, 0, 2, 0, $7E)
    %spritemapEntry(1, $1F8, $00, 1, 0, 2, 0, $9A)

Spritemap_CeresSteam_Down_3:
    dw $0004                                                             ;A6F454;
    %spritemapEntry(1, $1F8, $18, 1, 0, 2, 0, $7C)
    %spritemapEntry(1, $1F8, $10, 1, 0, 2, 0, $7E)
    %spritemapEntry(1, $1F8, $08, 1, 0, 2, 0, $9A)
    %spritemapEntry(1, $1F8, $00, 1, 0, 2, 0, $9C)

Spritemap_CeresSteam_Down_4:
    dw $0003                                                             ;A6F46A;
    %spritemapEntry(1, $1F8, $18, 1, 0, 2, 0, $7E)
    %spritemapEntry(1, $1F8, $10, 1, 0, 2, 0, $9A)
    %spritemapEntry(1, $1F8, $08, 1, 0, 2, 0, $9C)

Spritemap_CeresSteam_Down_5:
    dw $0002                                                             ;A6F47B;
    %spritemapEntry(1, $1F8, $18, 1, 0, 2, 0, $9A)
    %spritemapEntry(1, $1F8, $10, 1, 0, 2, 0, $9C)

Spritemap_CeresSteam_Down_6:
    dw $0001                                                             ;A6F487;
    %spritemapEntry(1, $1F8, $18, 1, 0, 2, 0, $9C)

Spritemap_CeresSteam_Right_0:
    dw $0001                                                             ;A6F48E;
    %spritemapEntry(1, $00, $F8, 0, 1, 2, 0, $7C)

Spritemap_CeresSteam_Right_1:
    dw $0002                                                             ;A6F495;
    %spritemapEntry(1, $08, $F8, 0, 1, 2, 0, $7C)
    %spritemapEntry(1, $00, $F8, 0, 1, 2, 0, $7E)

Spritemap_CeresSteam_Right_2:
    dw $0003                                                             ;A6F4A1;
    %spritemapEntry(1, $10, $F8, 0, 1, 2, 0, $7C)
    %spritemapEntry(1, $08, $F8, 0, 1, 2, 0, $7E)
    %spritemapEntry(1, $00, $F8, 0, 1, 2, 0, $9A)

Spritemap_CeresSteam_Right_3:
    dw $0004                                                             ;A6F4B2;
    %spritemapEntry(1, $18, $F6, 0, 1, 2, 0, $7C)
    %spritemapEntry(1, $10, $F8, 0, 1, 2, 0, $7E)
    %spritemapEntry(1, $08, $F8, 0, 1, 2, 0, $9A)
    %spritemapEntry(1, $00, $F8, 0, 1, 2, 0, $9C)

Spritemap_CeresSteam_Right_4:
    dw $0003                                                             ;A6F4C8;
    %spritemapEntry(1, $19, $F4, 0, 1, 2, 0, $7E)
    %spritemapEntry(1, $10, $F6, 0, 1, 2, 0, $9A)
    %spritemapEntry(1, $08, $F8, 0, 1, 2, 0, $9C)

Spritemap_CeresSteam_Right_5:
    dw $0002                                                             ;A6F4D9;
    %spritemapEntry(1, $1A, $F2, 0, 1, 2, 0, $9A)
    %spritemapEntry(1, $10, $F4, 0, 1, 2, 0, $9C)

Spritemap_CeresSteam_Right_6:
    dw $0001                                                             ;A6F4E5;
    %spritemapEntry(1, $1B, $F0, 0, 1, 2, 0, $9C)


;;; $F4EC: Ceres door palettes ;;;
Palette_CeresDoor_BeforeEscape:
; Before escape sequence
    dw $0000,$7E20,$6560,$2060,$1000,$7940,$5D00,$4CA0                   ;A6F4EC;
    dw $3CA0,$43FF,$0113,$000F,$175C,$0299,$01D6,$57E0                   ;A6F4FC;

Palette_CeresDoor_DuringEscape:
; During escape sequence
    dw $3800,$6B5A,$5652,$28E7,$1863,$62B5,$4A10,$396B                   ;A6F50C;
    dw $3129,$43FF,$0113,$000F,$175C,$0299,$01D6,$3BE0                   ;A6F51C;


;;; $F52C: Ceres door instruction list pointers ;;;
InstListPointers_CeresDoor:
; Indexed by [enemy parameter 1]
    dw InstList_CeresDoor_Normal_FacingRight                             ;A6F52C;
    dw InstList_CeresDoor_Normal_FacingLeft_0                            ;A6F52E;
    dw InstList_CeresDoor_RotatingElevRoom_PreExploDoorOverlay_0         ;A6F530;
    dw InstList_CeresDoor_RidleysRoom_FacingRight_0                      ;A6F532;
    dw InstList_CeresDoor_RotatingElevatorRoom_InvisibleWall_0           ;A6F534;
    dw InstList_CeresDoor_RidleyEscapeMode7LeftWall_0                    ;A6F536;
    dw InstList_CeresDoor_RidleyEscapeMode7RightWall_0                   ;A6F538;


;;; $F53A: Instruction list - parameter 1 = 3 (Ridley's room facing right) ;;;
InstList_CeresDoor_RidleysRoom_FacingRight_0:
    dw Instruction_CeresDoor_SetAsIntangible                             ;A6F53A;
    dw Instruction_CeresDoor_SetAsInvisible                              ;A6F53C;
    dw $0002,Spritemap_CeresDoor_FacingRight_Open                        ;A6F53E;
    dw Instruction_CeresDoor_SetAsTangible                               ;A6F542;
    dw Instruction_CeresDoor_SetAsVisible                                ;A6F544;
    dw $0002,Spritemap_CeresDoor_FacingRight_Open                        ;A6F546;
    dw $0002,Spritemap_CeresDoor_FacingRight_OpeningFrame3               ;A6F54A;
    dw $0002,Spritemap_CeresDoor_FacingRight_OpeningFrame2               ;A6F54E;
    dw $0002,Spritemap_CeresDoor_FacingRight_OpeningFrame1               ;A6F552;
    dw Instruction_CeresDoor_SetDrawnByRidleyFlag                        ;A6F556;
    dw $0001,Spritemap_CeresDoor_FacingRight_Closed                      ;A6F558;
    dw Instruction_CeresDoor_SetAsInvisible                              ;A6F55C;

InstList_CeresDoor_RidleysRoom_FacingRight_1:
    dw $0002,Spritemap_CeresDoor_FacingRight_Closed                      ;A6F55E;
    dw Instruction_CeresDoor_GotoYIfAreaBossIsAlive                      ;A6F562;
    dw InstList_CeresDoor_RidleysRoom_FacingRight_1                      ;A6F564;
    dw Instruction_CeresDoor_SetAsVisible_ClearDrawnByRidleyFlag         ;A6F566;
    dw Instruction_Common_GotoY                                          ;A6F568;
    dw InstList_CeresDoor_Closed_FacingRight_0                           ;A6F56A;


;;; $F56C: Instruction list - parameter 1 = 0 (normal facing right) ;;;
InstList_CeresDoor_Normal_FacingRight:
    dw Instruction_CeresDoor_SetAsIntangible                             ;A6F56C;
    dw Instruction_CeresDoor_SetAsInvisible                              ;A6F56E;
    dw $0002,Spritemap_CeresDoor_FacingRight_Closed                      ;A6F570;
    dw Inst_CeresDoor_GotoYIfSamusIsNotWithing30Pixels                   ;A6F574;
    dw InstList_CeresDoor_Closed_FacingRight_0                           ;A6F576;


;;; $F578: Instruction list - Ceres door facing right - open ;;;
InstList_CeresDoor_Open_FacingRight_0:
    dw $0002,Spritemap_CeresDoor_FacingRight_Open                        ;A6F578;
    dw Inst_CeresDoor_GotoYIfSamusIsNotWithing30Pixels                   ;A6F57C;
    dw InstList_CeresDoor_Open_FacingRight_1                             ;A6F57E;
    dw Instruction_Common_GotoY                                          ;A6F580;
    dw InstList_CeresDoor_Open_FacingRight_0                             ;A6F582;

InstList_CeresDoor_Open_FacingRight_1:
    dw Instruction_CeresDoor_SetAsTangible                               ;A6F584;
    dw Instruction_CeresDoor_SetAsVisible                                ;A6F586;
    dw $0005,Spritemap_CeresDoor_FacingRight_Open                        ;A6F588;
    dw $0005,Spritemap_CeresDoor_FacingRight_OpeningFrame3               ;A6F58C;
    dw $0005,Spritemap_CeresDoor_FacingRight_OpeningFrame2               ;A6F590;
    dw $0005,Spritemap_CeresDoor_FacingRight_OpeningFrame1               ;A6F594;


;;; $F598: Instruction list - Ceres door facing right - closed ;;;
InstList_CeresDoor_Closed_FacingRight_0:
    dw Instruction_CeresDoor_SetAsTangible                               ;A6F598;
    dw Instruction_CeresDoor_SetAsVisible                                ;A6F59A;

InstList_CeresDoor_Closed_FacingRight_1:
    dw $0002,Spritemap_CeresDoor_FacingRight_Closed                      ;A6F59C;
    dw Inst_CeresDoor_GotoYIfSamusIsNotWithing30Pixels                   ;A6F5A0;
    dw InstList_CeresDoor_Closed_FacingRight_1                           ;A6F5A2;
    dw Instruction_CeresDoor_QueueOpeningSFX                             ;A6F5A4;
    dw $0005,Spritemap_CeresDoor_FacingRight_OpeningFrame1               ;A6F5A6;
    dw $0005,Spritemap_CeresDoor_FacingRight_OpeningFrame2               ;A6F5AA;
    dw $0005,Spritemap_CeresDoor_FacingRight_OpeningFrame3               ;A6F5AE;
    dw $0005,Spritemap_CeresDoor_FacingRight_Open                        ;A6F5B2;
    dw Instruction_CeresDoor_SetAsIntangible                             ;A6F5B6;
    dw Instruction_CeresDoor_SetAsInvisible                              ;A6F5B8;
    dw Instruction_Common_GotoY                                          ;A6F5BA;
    dw InstList_CeresDoor_Open_FacingRight_0                             ;A6F5BC;


;;; $F5BE: Instruction list - parameter 1 = 1 (normal facing left) ;;;
InstList_CeresDoor_Normal_FacingLeft_0:
    dw Instruction_CeresDoor_SetAsIntangible                             ;A6F5BE;
    dw Instruction_CeresDoor_SetAsInvisible                              ;A6F5C0;
    dw $0002,Spritemap_CeresDoor_FacingRight_Closed                      ;A6F5C2;
    dw Inst_CeresDoor_GotoYIfSamusIsNotWithing30Pixels                   ;A6F5C6;
    dw InstList_CeresDoor_Normal_FacingLeft_3                            ;A6F5C8;

InstList_CeresDoor_Normal_FacingLeft_1:
    dw $0002,Spritemap_CeresDoor_FacingLeft_Closed                       ;A6F5CA;
    dw Inst_CeresDoor_GotoYIfSamusIsNotWithing30Pixels                   ;A6F5CE;
    dw InstList_CeresDoor_Normal_FacingLeft_2                            ;A6F5D0;
    dw Instruction_Common_GotoY                                          ;A6F5D2;
    dw InstList_CeresDoor_Normal_FacingLeft_1                            ;A6F5D4;

InstList_CeresDoor_Normal_FacingLeft_2:
    dw Instruction_CeresDoor_SetAsTangible                               ;A6F5D6;
    dw Instruction_CeresDoor_SetAsVisible                                ;A6F5D8;
    dw $0005,Spritemap_CeresDoor_FacingLeft_Open                         ;A6F5DA;
    dw $0005,Spritemap_CeresDoor_FacingLeft_OpeningFrame3                ;A6F5DE;
    dw $0005,Spritemap_CeresDoor_FacingLeft_OpeningFrame2                ;A6F5E2;
    dw $0005,Spritemap_CeresDoor_FacingLeft_OpeningFrame1                ;A6F5E6;

InstList_CeresDoor_Normal_FacingLeft_3:
    dw Instruction_CeresDoor_SetAsTangible                               ;A6F5EA;
    dw Instruction_CeresDoor_SetAsVisible                                ;A6F5EC;

InstList_CeresDoor_Normal_FacingLeft_4:
    dw $0002,Spritemap_CeresDoor_FacingLeft_Closed                       ;A6F5EE;
    dw Inst_CeresDoor_GotoYIfSamusIsNotWithing30Pixels                   ;A6F5F2;
    dw InstList_CeresDoor_Normal_FacingLeft_4                            ;A6F5F4;
    dw Instruction_CeresDoor_QueueOpeningSFX                             ;A6F5F6;
    dw $0005,Spritemap_CeresDoor_FacingLeft_OpeningFrame1                ;A6F5F8;
    dw $0005,Spritemap_CeresDoor_FacingLeft_OpeningFrame2                ;A6F5FC;
    dw $0005,Spritemap_CeresDoor_FacingLeft_OpeningFrame3                ;A6F600;
    dw $0005,Spritemap_CeresDoor_FacingLeft_Open                         ;A6F604;
    dw Instruction_CeresDoor_SetAsIntangible                             ;A6F608;
    dw Instruction_CeresDoor_SetAsInvisible                              ;A6F60A;
    dw Instruction_Common_GotoY                                          ;A6F60C;
    dw InstList_CeresDoor_Normal_FacingLeft_1                            ;A6F60E;


;;; $F610: Instruction list - parameter 1 = 2 (rotating elevator room pre-explosion door overlay) ;;;
InstList_CeresDoor_RotatingElevRoom_PreExploDoorOverlay_0:
    dw Instruction_CeresDoor_SetAsIntangible                             ;A6F610;

InstList_CeresDoor_RotatingElevRoom_PreExploDoorOverlay_1:
    dw $0001,Spritemap_CeresDoor_RotatingElevRoomPreExplosionDoorOverlay ;A6F612;
    dw Instruction_Common_GotoY                                          ;A6F616;
    dw InstList_CeresDoor_RotatingElevRoom_PreExploDoorOverlay_1         ;A6F618;


;;; $F61A: Instruction list - parameter 1 = 4 (rotating elevator room invisible wall) ;;;
InstList_CeresDoor_RotatingElevatorRoom_InvisibleWall_0:
    dw Instruction_CeresDoor_GotoYIfCeresRidleyHasNotEscaped             ;A6F61A;
    dw InstList_CeresDoor_Normal_FacingLeft_0                            ;A6F61C;
    dw Instruction_CeresDoor_SetAsTangible                               ;A6F61E;
    dw Instruction_CeresDoor_SetAsInvisible                              ;A6F620;

InstList_CeresDoor_RotatingElevatorRoom_InvisibleWall_1:
    dw $0001,Spritemap_CeresDoor_FacingLeft_Closed                       ;A6F622;
    dw Instruction_Common_GotoY                                          ;A6F626;
    dw InstList_CeresDoor_RotatingElevatorRoom_InvisibleWall_1           ;A6F628;


;;; $F62A: Instruction list - parameter 1 = 5 (Ridley escape mode 7 left wall) ;;;
InstList_CeresDoor_RidleyEscapeMode7LeftWall_0:
    dw Instruction_CeresDoor_SetAsIntangible                             ;A6F62A;

InstList_CeresDoor_RidleyEscapeMode7LeftWall_1:
    dw $0001,Spritemap_CeresDoor_RidleyEscapeMode7LeftWall               ;A6F62C;
    dw Instruction_Common_GotoY                                          ;A6F630;
    dw InstList_CeresDoor_RidleyEscapeMode7LeftWall_1                    ;A6F632;


;;; $F634: Instruction list - parameter 1 = 6 (Ridley escape mode 7 right wall) ;;;
InstList_CeresDoor_RidleyEscapeMode7RightWall_0:
    dw Instruction_CeresDoor_SetAsIntangible                             ;A6F634;

InstList_CeresDoor_RidleyEscapeMode7RightWall_1:
    dw $0001,Spritemap_CeresDoor_RidleyEscapeMode7RightWall              ;A6F636;
    dw Instruction_Common_GotoY                                          ;A6F63A;
    dw InstList_CeresDoor_RidleyEscapeMode7RightWall_1                   ;A6F63C;


;;; $F63E: Instruction - go to [[Y]] if Samus is not within 30h pixels ;;;
Inst_CeresDoor_GotoYIfSamusIsNotWithing30Pixels:
; Measure with taxicab distance
    LDA.W Enemy.XPosition,X                                              ;A6F63E;
    SEC                                                                  ;A6F641;
    SBC.W SamusXPosition                                                 ;A6F642;
    BPL +                                                                ;A6F645;
    EOR.W #$FFFF                                                         ;A6F647;
    INC                                                                  ;A6F64A;

+   CMP.W #$0030                                                         ;A6F64B;
    BCS Inst_CeresDoor_GotoYIfSamusIsNotWithin30Pixels_gotoY             ;A6F64E;
    LDA.W Enemy.YPosition,X                                              ;A6F650;
    SEC                                                                  ;A6F653;
    SBC.W SamusYPosition                                                 ;A6F654;
    BPL +                                                                ;A6F657;
    EOR.W #$FFFF                                                         ;A6F659;
    INC                                                                  ;A6F65C;

+   CMP.W #$0030                                                         ;A6F65D;
    BCS Inst_CeresDoor_GotoYIfSamusIsNotWithin30Pixels_gotoY             ;A6F660; fallthrough to Inst_CeresDoor_GotoYIfSamusIsNotWithin30Pixels_outOfRange


Inst_CeresDoor_GotoYIfSamusIsNotWithin30Pixels_outOfRange:
    INY                                                                  ;A6F662;
    INY                                                                  ;A6F663;
    RTL                                                                  ;A6F664;


Inst_CeresDoor_GotoYIfSamusIsNotWithin30Pixels_gotoY:
    LDA.W $0000,Y                                                        ;A6F665;
    TAY                                                                  ;A6F668;
    RTL                                                                  ;A6F669;


;;; $F66A: Instruction - go to [[Y]] if area boss is alive ;;;
Instruction_CeresDoor_GotoYIfAreaBossIsAlive:
    PHX                                                                  ;A6F66A;
    LDX.W AreaIndex                                                      ;A6F66B;
    LDA.L SRAMMirror_Boss,X                                              ;A6F66E;
    PLX                                                                  ;A6F672;
    LSR                                                                  ;A6F673;
    BCC Inst_CeresDoor_GotoYIfSamusIsNotWithin30Pixels_gotoY             ;A6F674;
    BRA Inst_CeresDoor_GotoYIfSamusIsNotWithin30Pixels_outOfRange        ;A6F676;


;;; $F678: Instruction - go to [[Y]] if Ceres Ridley has not escaped ;;;
Instruction_CeresDoor_GotoYIfCeresRidleyHasNotEscaped:
    LDA.W CeresStatus                                                    ;A6F678;
    BEQ Inst_CeresDoor_GotoYIfSamusIsNotWithin30Pixels_gotoY             ;A6F67B;
    BRA Inst_CeresDoor_GotoYIfSamusIsNotWithin30Pixels_outOfRange        ;A6F67D;


;;; $F67F: Set Ceres elevator room to rotate if Ridley has escaped ;;;
SetElevatorRoomToRotateIfRidleyHasEscaped:
    LDA.W CeresStatus                                                    ;A6F67F;
    BEQ .return                                                          ;A6F682;
    LDA.W #$8000                                                         ;A6F684;
    STA.W CeresStatus                                                    ;A6F687;

  .return:
    RTL                                                                  ;A6F68A;


;;; $F68B: Instruction - set enemy as intangible ;;;
Instruction_CeresDoor_SetAsIntangible:
    LDA.W Enemy.properties,X                                             ;A6F68B;
    ORA.W #$0400                                                         ;A6F68E;
    STA.W Enemy.properties,X                                             ;A6F691;
    RTL                                                                  ;A6F694;


;;; $F695: Instruction - set enemy as tangible ;;;
Instruction_CeresDoor_SetAsTangible:
    LDA.W Enemy.properties,X                                             ;A6F695;
    AND.W #$FBFF                                                         ;A6F698;
    STA.W Enemy.properties,X                                             ;A6F69B;
    RTL                                                                  ;A6F69E;


;;; $F69F: Instruction - set drawn by Ridley flag ;;;
Instruction_CeresDoor_SetDrawnByRidleyFlag:
    LDA.W #$0001                                                         ;A6F69F;
    STA.W CeresDoor.drawnByRidleyFlag,X                                  ;A6F6A2;
    RTL                                                                  ;A6F6A5;


;;; $F6A6: Instruction - set enemy as invisible ;;;
Instruction_CeresDoor_SetAsInvisible:
    LDA.W Enemy.properties,X                                             ;A6F6A6;
    ORA.W #$0100                                                         ;A6F6A9;
    STA.W Enemy.properties,X                                             ;A6F6AC;
    RTL                                                                  ;A6F6AF;


;;; $F6B0: Instruction - set enemy as visible, clear drawn by Ridley flag ;;;
Instruction_CeresDoor_SetAsVisible_ClearDrawnByRidleyFlag:
    STZ.W CeresDoor.drawnByRidleyFlag,X                                  ;A6F6B0; fallthrough to Instruction_CeresDoor_SetAsVisible


;;; $F6B3: Instruction - set enemy as visible ;;;
Instruction_CeresDoor_SetAsVisible:
    LDA.W Enemy.properties,X                                             ;A6F6B3;
    AND.W #$FEFF                                                         ;A6F6B6;
    STA.W Enemy.properties,X                                             ;A6F6B9;
    RTL                                                                  ;A6F6BC;


;;; $F6BD: Instruction - queue Ceres door opening sound effect ;;;
Instruction_CeresDoor_QueueOpeningSFX:
    LDA.W #$002C                                                         ;A6F6BD;
    JSL.L QueueSound_Lib3_Max6                                           ;A6F6C0;
    RTL                                                                  ;A6F6C4;


;;; $F6C5: Initialisation AI - enemy $E23F (Ceres door) ;;;
InitAI_CeresDoor:
    LDX.W EnemyIndex                                                     ;A6F6C5;
    LDA.W #Spritemap_CeresDoor_Placeholder                               ;A6F6C8;
    STA.W Enemy.spritemap,X                                              ;A6F6CB;
    LDA.W #$0001                                                         ;A6F6CE;
    STA.W Enemy.instTimer,X                                              ;A6F6D1;
    STZ.W Enemy.loopCounter,X                                            ;A6F6D4;
    STZ.W Enemy.GFXOffset,X                                              ;A6F6D7;
    LDA.W #$0400                                                         ;A6F6DA;
    STA.W Enemy.palette,X                                                ;A6F6DD;
    LDA.W Enemy.init0,X                                                  ;A6F6E0;
    ASL                                                                  ;A6F6E3;
    TAY                                                                  ;A6F6E4;
    LDA.W .functionPointers,Y                                            ;A6F6E5;
    STA.W CeresDoor.function,X                                           ;A6F6E8;
    LDA.W InstListPointers_CeresDoor,Y                                   ;A6F6EB;
    STA.W Enemy.instList,X                                               ;A6F6EE;
    STZ.W CeresDoor.drawnByRidleyFlag,X                                  ;A6F6F1;
    JSR.W LoadRotatingElevatorRoomPreExplosioNDoorOverlayTilesIfNeeded   ;A6F6F4;
    LDA.W CeresStatus                                                    ;A6F6F7;
    BNE .escapeSequence                                                  ;A6F6FA;
    LDA.W Enemy.init0,X                                                  ;A6F6FC;
    CMP.W #$0003                                                         ;A6F6FF;
    BNE .notRidleysRoom                                                  ;A6F702;
    LDY.W #Palette_CeresDoor_BeforeEscape+2                              ;A6F704;
    LDX.W #$0142                                                         ;A6F707;
    LDA.W #$000F                                                         ;A6F70A;
    JSL.L WriteAColorsFromYToTargetColorIndexX                           ;A6F70D;
    RTL                                                                  ;A6F711;

  .notRidleysRoom:
    LDY.W #Palette_CeresDoor_BeforeEscape+2                              ;A6F712;
    BRA .merge                                                           ;A6F715;

  .escapeSequence:
    LDY.W #Palette_CeresDoor_DuringEscape+2                              ;A6F717;

  .merge:
    LDA.W #$0E00                                                         ;A6F71A;
    STA.W Enemy.palette,X                                                ;A6F71D;
    LDX.W #$01E2                                                         ;A6F720;
    LDA.W #$000F                                                         ;A6F723;
    JSL.L WriteAColorsFromYToTargetColorIndexX                           ;A6F726;
    RTL                                                                  ;A6F72A;

  .functionPointers:
; Function pointers, indexed by [enemy parameter 1]
    dw Function_CeresDoor_HandleEarthquakeDuringEscape                   ;A6F72B; 0: Normal facing right
    dw Function_CeresDoor_HandleEarthquakeDuringEscape                   ;A6F72D; 1: Normal facing left
    dw Function_CeresDoor_RotatingElevatorRoom_Default                   ;A6F72F; 2: Rotating elevator room pre-explosion door overlay
    dw Function_CeresDoor_HandleEarthquakeDuringEscapeInRidleysRoom      ;A6F731; 3: Ridley's room (facing right)
    dw Function_CeresDoor_HandleEarthquakeDuringEscape                   ;A6F733; 4: Rotating elevator room invisible wall
    dw Function_CeresDoor_RidleyEscapeMode7Wall                          ;A6F735; 5: Ridley escape mode 7 left wall
    dw Function_CeresDoor_RidleyEscapeMode7Wall                          ;A6F737; 6: Ridley escape mode 7 right wall


;;; $F739: Load rotating elevator room pre-explosion door overlay tiles if needed ;;;
LoadRotatingElevatorRoomPreExplosioNDoorOverlayTilesIfNeeded:
    LDA.W Enemy.init0,X                                                  ;A6F739;
    CMP.W #$0002                                                         ;A6F73C;
    BNE .return                                                          ;A6F73F;
    LDY.W VRAMWriteStack                                                 ;A6F741;
    LDA.W #$0400                                                         ;A6F744;
    STA.W VRAMWrite.size,Y                                               ;A6F747; >.<
    LDA.W #Tiles_CeresElevatorRoomDoor>>8&$FF00                          ;A6F74A;
    STA.W VRAMWrite.src+1,Y                                              ;A6F74D; >.<
    LDA.W #Tiles_CeresElevatorRoomDoor                                   ;A6F750;
    STA.W VRAMWrite.src,Y                                                ;A6F753; >.<
    LDA.W #$7000                                                         ;A6F756;
    STA.W VRAMWrite.dest,Y                                               ;A6F759; >.<
    TYA                                                                  ;A6F75C;
    CLC                                                                  ;A6F75D;
    ADC.W #$0007                                                         ;A6F75E;
    STA.W VRAMWriteStack                                                 ;A6F761;

  .return:
    RTS                                                                  ;A6F764;


;;; $F765: Main AI - enemy $E23F (Ceres door) ;;;
MainAI_CeresDoor:
    LDX.W EnemyIndex                                                     ;A6F765;
    JMP.W (CeresDoor.function,X)                                         ;A6F768;


;;; $F76B: Ceres door function - handle earthquake during escape ;;;
Function_CeresDoor_HandleEarthquakeDuringEscape:
    LDY.W #$0014                                                         ;A6F76B;
    BRA HandleEarthquakeDuringEscape                                     ;A6F76E;


;;; $F770: Ceres door function - handle earthquake during escape in Ridley's room ;;;
Function_CeresDoor_HandleEarthquakeDuringEscapeInRidleysRoom:
    LDY.W #$001D                                                         ;A6F770; fallthrough to HandleEarthquakeDuringEscape


;;; $F773: Handle Ceres door earthquake during escape ;;;
HandleEarthquakeDuringEscape:
;; Parameters:
;;     Y: Earthquake type. Must have 1 pixel displacement
    LDA.W CeresStatus                                                    ;A6F773;
    CMP.W #$0002                                                         ;A6F776;
    BCC .return                                                          ;A6F779;
    LDA.W EarthquakeTimer                                                ;A6F77B;
    BNE .return                                                          ;A6F77E;
    LDA.W RandomNumberSeed                                               ;A6F780;
    AND.W #$0FFF                                                         ;A6F783;
    CMP.W #$0080                                                         ;A6F786;
    BCC .random                                                          ;A6F789;
    LDA.W #$0002                                                         ;A6F78B;
    STA.W EarthquakeTimer                                                ;A6F78E;
    TYA                                                                  ;A6F791;
    STA.W EarthquakeType                                                 ;A6F792;
    RTL                                                                  ;A6F795;

  .random:
    LDA.W #$0004                                                         ;A6F796;
    STA.W EarthquakeTimer                                                ;A6F799;
    TYA                                                                  ;A6F79C;
    CLC                                                                  ;A6F79D;
    ADC.W #$0006                                                         ;A6F79E;
    STA.W EarthquakeType                                                 ;A6F7A1;

  .return:
    RTL                                                                  ;A6F7A4;


;;; $F7A5: Ceres door function - Ridley escape mode 7 wall ;;;
Function_CeresDoor_RidleyEscapeMode7Wall:
    LDX.W EnemyIndex                                                     ;A6F7A5;
    JSL.L Instruction_CeresDoor_SetAsInvisible                           ;A6F7A8;
    LDA.W CeresStatus                                                    ;A6F7AC;
    LSR                                                                  ;A6F7AF;
    BCC .return                                                          ;A6F7B0;
    LDA.W #$0E00                                                         ;A6F7B2;
    STA.W Enemy.palette,X                                                ;A6F7B5;
    JSL.L Instruction_CeresDoor_SetAsVisible                             ;A6F7B8;

  .return:
    RTL                                                                  ;A6F7BC;


;;; $F7BD: Ceres door function - rotating elevator room - default ;;;
Function_CeresDoor_RotatingElevatorRoom_Default:
    JSL.L Function_CeresDoor_RotatingElevatorRoom_ElevatorAnimations     ;A6F7BD;
    LDA.W CeresStatus                                                    ;A6F7C1;
    CMP.W #$0002                                                         ;A6F7C4;
    BCC .return                                                          ;A6F7C7;
    LDA.W #Function_CeresDoor_RotatingElevatorRoom_Rumbling_Explosions   ;A6F7C9;
    STA.W CeresDoor.function,X                                           ;A6F7CC;
    LDA.W #$0030                                                         ;A6F7CF;
    STA.W CeresDoor.rumblingTimer,X                                      ;A6F7D2;
    STZ.W CeresDoor.CeresDoorRumbleTimer                                 ;A6F7D5;
    STZ.W CeresDoor.CeresDoorRumbleIndex                                 ;A6F7D8;

  .return:
    RTL                                                                  ;A6F7DB;


;;; $F7DC: Ceres door function - rotating elevator room - rumbling and explosions ;;;
Function_CeresDoor_RotatingElevatorRoom_Rumbling_Explosions:
    DEC.W CeresDoor.rumblingTimer,X                                      ;A6F7DC;
    BPL .enemyRumbleTimerNotExpired                                      ;A6F7DF;
    LDA.W Enemy.properties,X                                             ;A6F7E1;
    ORA.W #$0100                                                         ;A6F7E4;
    STA.W Enemy.properties,X                                             ;A6F7E7;
    LDA.W #Function_CeresDoor_RotatingElevatorRoom_ElevatorAnimations    ;A6F7EA;
    STA.W CeresDoor.function,X                                           ;A6F7ED;
    JMP.W SetElevatorRoomToRotateIfRidleyHasEscaped                      ;A6F7F0;

  .enemyRumbleTimerNotExpired:
    DEC.W CeresDoor.CeresDoorRumbleTimer                                 ;A6F7F3;
    BPL .return                                                          ;A6F7F6;
    LDA.W #$0004                                                         ;A6F7F8;
    STA.W CeresDoor.CeresDoorRumbleTimer                                 ;A6F7FB;
    DEC.W CeresDoor.CeresDoorRumbleIndex                                 ;A6F7FE;
    BPL .ceresDoorTimerNotExpired                                        ;A6F801;
    LDA.W #$0003                                                         ;A6F803;
    STA.W CeresDoor.CeresDoorRumbleIndex                                 ;A6F806;

  .ceresDoorTimerNotExpired:
    LDA.W CeresDoor.CeresDoorRumbleIndex                                 ;A6F809;
    ASL                                                                  ;A6F80C;
    ASL                                                                  ;A6F80D;
    TAY                                                                  ;A6F80E;
    LDA.W .XOffset,Y                                                     ;A6F80F;
    CLC                                                                  ;A6F812;
    ADC.W Enemy.XPosition,X                                              ;A6F813;
    STA.B DP_Temp12                                                      ;A6F816;
    LDA.W .YOffset,Y                                                     ;A6F818;
    CLC                                                                  ;A6F81B;
    ADC.W Enemy.YPosition,X                                              ;A6F81C;
    STA.B DP_Temp14                                                      ;A6F81F;
    LDY.W #$0003                                                         ;A6F821;
    JSL.L GenerateRandomNumber                                           ;A6F824;
    CMP.W #$4000                                                         ;A6F828;
    BCS .noSmoke                                                         ;A6F82B;
    LDY.W #$000C                                                         ;A6F82D;

  .noSmoke:
    TYA                                                                  ;A6F830;
    LDY.W #EnemyProjectile_MiscDust                                      ;A6F831;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A6F834;
    LDA.W #$0025                                                         ;A6F838;
    JSL.L QueueSound_Lib2_Max6                                           ;A6F83B;

  .return:
    RTL                                                                  ;A6F83F;

; Rumble offsets
  .XOffset:
    dw $FFFC                                                             ;A6F840;
  .YOffset:
    dw       $FFF8                                                       ;A6F842;
    dw $0000,$0004
    dw $FFFE,$0016
    dw $0002,$000C


;;; $F850: Ceres door function - rotating elevator room - handle Ceres elevator animations ;;;
Function_CeresDoor_RotatingElevatorRoom_ElevatorAnimations:
    PHX                                                                  ;A6F850;
    JSR.W AnimateCeresElevatorPlatform                                   ;A6F851;
    LDA.L PaletteChangeNumerator                                         ;A6F854;
    BNE .return                                                          ;A6F858;
    LDA.W NMI_FrameCounter                                               ;A6F85A;
    AND.W #$0038                                                         ;A6F85D;
    ASL                                                                  ;A6F860;
    ADC.W #.paletteAnimation                                             ;A6F861;
    TAY                                                                  ;A6F864;
    LDX.W #$0052                                                         ;A6F865;
    LDA.W #$0006                                                         ;A6F868;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;A6F86B;

  .return:
    PLX                                                                  ;A6F86F;
    RTL                                                                  ;A6F870;

  .paletteAnimation:
; Elevator beacon palette animation
    dw $5BFF,$15B8,$14B4,$17DF,$02FC,$0239,$0000,$0000                   ;A6F871;
    dw $47FF,$0113,$000F,$175C,$0299,$01D6,$0000,$0000                   ;A6F881;
    dw $335A,$006E,$000A,$02B7,$01F4,$0131,$0000,$0000                   ;A6F891;
    dw $1EB5,$0009,$0005,$0212,$014E,$008C,$0000,$0000                   ;A6F8A1;
    dw $1EB5,$0009,$0005,$0212,$014E,$008C,$0000,$0000                   ;A6F8B1;
    dw $335A,$006E,$000A,$02B7,$01F4,$0131,$0000,$0000                   ;A6F8C1;
    dw $47FF,$0113,$000F,$175C,$0299,$01D6,$0000,$0000                   ;A6F8D1;
    dw $5BFF,$15B8,$14B4,$17DF,$02FC,$0239,$0000,$0000                   ;A6F8E1;


;;; $F8F1: Animate Ceres elevator platform ;;;
AnimateCeresElevatorPlatform:
    LDA.W NMI_FrameCounter                                               ;A6F8F1;
    AND.W #$0002                                                         ;A6F8F4;
    TAY                                                                  ;A6F8F7;
    LDX.W .mode7TransferPointers,Y                                       ;A6F8F8;
    JSL.L QueueMode7Transfers                                            ;A6F8FB;
    RTS                                                                  ;A6F8FF;

  .mode7TransferPointers:
    dw Mode7Transfer_CeresElevatorPlatform_light                         ;A6F900;
    dw Mode7Transfer_CeresElevatorPlatform_dark                          ;A6F902;


Mode7Transfer_CeresElevatorPlatform_light:
    db $80                                                               ;A6F904; Control. 80h = write to VRAM tilemap. 0 = terminator
    dl CeresElevatorPlatform_light                                       ;A6F905; Source address
    dw $0004,$060E                                                       ;A6F908; Size.Destination address (VRAM)
    db $00                                                               ;A6F90C; VRAM address increment mode
    db $00

Mode7Transfer_CeresElevatorPlatform_dark:
    db $80                                                               ;A6F90E; Control. 80h = write to VRAM tilemap. 0 = terminator
    dl CeresElevatorPlatform_dark                                        ;A6F90F; Source address
    dw $0004,$060E                                                       ;A6F912; Size.Destination address (VRAM)
    db $00                                                               ;A6F916; VRAM address increment mode
    db $00

CeresElevatorPlatform:
  .light:
    db $68,$69,$69,$78                                                   ;A6F918;

  .dark:
    db $8D,$8E,$8E,$79                                                   ;A6F91C;


;;; $F920: RTL. Enemy touch / enemy shot - enemy $E23F (Ceres door) ;;;
RTL_A6F920:
    RTL                                                                  ;A6F920;


;;; $F921: Ceres door spritemaps ;;;
Spritemap_CeresDoor_RotatingElevRoomPreExplosionDoorOverlay:
    dw $000C                                                             ;A6F921;
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
    dw $0008                                                             ;A6F95F;
    %spritemapEntry(0, $1F8, $18, 1, 1, 2, 0, $D1)
    %spritemapEntry(0, $1F8, $10, 1, 1, 2, 0, $D3)
    %spritemapEntry(0, $1F8, $E0, 0, 1, 2, 0, $D1)
    %spritemapEntry(0, $1F8, $E8, 0, 1, 2, 0, $D3)
    %spritemapEntry(0, $1F8, $00, 1, 1, 2, 0, $F2)
    %spritemapEntry(0, $1F8, $08, 1, 1, 2, 0, $E2)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 0, $F2)
    %spritemapEntry(0, $1F8, $F0, 0, 1, 2, 0, $E2)

Spritemap_CeresDoor_FacingLeft_OpeningFrame1:
    dw $0008                                                             ;A6F989;
    %spritemapEntry(0, $1F8, $10, 1, 1, 2, 0, $F3)
    %spritemapEntry(0, $1F8, $18, 1, 1, 2, 0, $E3)
    %spritemapEntry(0, $1F8, $E8, 0, 1, 2, 0, $F3)
    %spritemapEntry(0, $1F8, $E0, 0, 1, 2, 0, $E3)
    %spritemapEntry(0, $1FA, $00, 1, 1, 2, 0, $F2)
    %spritemapEntry(0, $1FA, $08, 1, 1, 2, 0, $E2)
    %spritemapEntry(0, $1FA, $F8, 0, 1, 2, 0, $F2)
    %spritemapEntry(0, $1FA, $F0, 0, 1, 2, 0, $E2)

Spritemap_CeresDoor_FacingLeft_OpeningFrame2:
    dw $0006                                                             ;A6F9B3;
    %spritemapEntry(0, $1F8, $18, 1, 1, 2, 0, $D0)
    %spritemapEntry(0, $1F8, $E0, 0, 1, 2, 0, $D0)
    %spritemapEntry(0, $1FC, $00, 1, 1, 2, 0, $F2)
    %spritemapEntry(0, $1FC, $08, 1, 1, 2, 0, $E2)
    %spritemapEntry(0, $1FC, $F8, 0, 1, 2, 0, $F2)
    %spritemapEntry(0, $1FC, $F0, 0, 1, 2, 0, $E2)

Spritemap_CeresDoor_FacingLeft_OpeningFrame3:
    dw $0006                                                             ;A6F9D3;
    %spritemapEntry(0, $1F8, $E0, 0, 1, 2, 0, $D2)
    %spritemapEntry(0, $1F8, $18, 1, 1, 2, 0, $D2)
    %spritemapEntry(0, $1FE, $00, 1, 1, 2, 0, $F2)
    %spritemapEntry(0, $1FE, $08, 1, 1, 2, 0, $E2)
    %spritemapEntry(0, $1FE, $F8, 0, 1, 2, 0, $F2)
    %spritemapEntry(0, $1FE, $F0, 0, 1, 2, 0, $E2)

Spritemap_CeresDoor_FacingLeft_Open:
    dw $0006                                                             ;A6F9F3;
    %spritemapEntry(0, $1FA, $18, 1, 1, 2, 0, $D2)
    %spritemapEntry(0, $1FA, $E0, 0, 1, 2, 0, $D2)
    %spritemapEntry(0, $1FF, $00, 1, 1, 2, 0, $F2)
    %spritemapEntry(0, $1FF, $08, 1, 1, 2, 0, $E2)
    %spritemapEntry(0, $1FF, $F8, 0, 1, 2, 0, $F2)
    %spritemapEntry(0, $1FF, $F0, 0, 1, 2, 0, $E2)

Spritemap_CeresDoor_FacingRight_Closed:
    dw $0008                                                             ;A6FA13;
    %spritemapEntry(0, $00, $18, 1, 0, 2, 0, $D1)
    %spritemapEntry(0, $00, $E0, 0, 0, 2, 0, $D1)
    %spritemapEntry(0, $00, $10, 1, 0, 2, 0, $D3)
    %spritemapEntry(0, $00, $E8, 0, 0, 2, 0, $D3)
    %spritemapEntry(0, $00, $00, 1, 0, 2, 0, $F2)
    %spritemapEntry(0, $00, $08, 1, 0, 2, 0, $E2)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $F2)
    %spritemapEntry(0, $00, $F0, 0, 0, 2, 0, $E2)

Spritemap_CeresDoor_FacingRight_OpeningFrame1:
    dw $0008                                                             ;A6FA3D;
    %spritemapEntry(0, $00, $10, 1, 0, 2, 0, $F3)
    %spritemapEntry(0, $00, $18, 1, 0, 2, 0, $E3)
    %spritemapEntry(0, $00, $E8, 0, 0, 2, 0, $F3)
    %spritemapEntry(0, $00, $E0, 0, 0, 2, 0, $E3)
    %spritemapEntry(0, $1FE, $00, 1, 0, 2, 0, $F2)
    %spritemapEntry(0, $1FE, $08, 1, 0, 2, 0, $E2)
    %spritemapEntry(0, $1FE, $F8, 0, 0, 2, 0, $F2)
    %spritemapEntry(0, $1FE, $F0, 0, 0, 2, 0, $E2)

Spritemap_CeresDoor_FacingRight_OpeningFrame2:
    dw $0006                                                             ;A6FA67;
    %spritemapEntry(0, $00, $18, 1, 0, 2, 0, $D0)
    %spritemapEntry(0, $00, $E0, 0, 0, 2, 0, $D0)
    %spritemapEntry(0, $1FC, $00, 1, 0, 2, 0, $F2)
    %spritemapEntry(0, $1FC, $08, 1, 0, 2, 0, $E2)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 0, $F2)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 2, 0, $E2)

Spritemap_CeresDoor_FacingRight_OpeningFrame3:
    dw $0006                                                             ;A6FA87;
    %spritemapEntry(0, $00, $18, 1, 0, 2, 0, $D2)
    %spritemapEntry(0, $00, $E0, 0, 0, 2, 0, $D2)
    %spritemapEntry(0, $1FA, $00, 1, 0, 2, 0, $F2)
    %spritemapEntry(0, $1FA, $08, 1, 0, 2, 0, $E2)
    %spritemapEntry(0, $1FA, $F8, 0, 0, 2, 0, $F2)
    %spritemapEntry(0, $1FA, $F0, 0, 0, 2, 0, $E2)

Spritemap_CeresDoor_FacingRight_Open:
    dw $0006                                                             ;A6FAA7;
    %spritemapEntry(0, $1FE, $18, 1, 0, 2, 0, $D2)
    %spritemapEntry(0, $1FE, $E0, 0, 0, 2, 0, $D2)
    %spritemapEntry(0, $1F9, $00, 1, 0, 2, 0, $F2)
    %spritemapEntry(0, $1F9, $08, 1, 0, 2, 0, $E2)
    %spritemapEntry(0, $1F9, $F8, 0, 0, 2, 0, $F2)
    %spritemapEntry(0, $1F9, $F0, 0, 0, 2, 0, $E2)

Spritemap_CeresDoor_Placeholder:
    dw $0001                                                             ;A6FAC7;
    %spritemapEntry(0, $08, $08, 0, 0, 2, 0, $20)

Spritemap_CeresDoor_RidleyEscapeMode7LeftWall:
    dw $0013                                                             ;A6FACE;
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
    dw $000D                                                             ;A6FB2F;
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
    LDX.W EnemyIndex                                                     ;A6FB72;
    LDA.W Enemy.properties,X                                             ;A6FB75;
    ORA.W #$A000                                                         ;A6FB78;
    STA.W Enemy.properties,X                                             ;A6FB7B;
    LDA.W #$0001                                                         ;A6FB7E;
    STA.W Enemy.instTimer,X                                              ;A6FB81;
    STZ.W Enemy.loopCounter,X                                            ;A6FB84;
    LDA.W #$0400                                                         ;A6FB87;
    STA.W Enemy.palette,X                                                ;A6FB8A;
    LDA.W #$0080                                                         ;A6FB8D;
    STA.W Enemy.GFXOffset,X                                              ;A6FB90;
    STZ.W Enemy.var2,X                                                   ;A6FB93;
    LDY.W #Function_Zebetite_SpawnBottomZebetiteIfNeeded                 ;A6FB96;
    LDA.W Enemy.init0,X                                                  ;A6FB99;
    BEQ .setFunctionPointer                                              ;A6FB9C;
    LDY.W #Function_Zebetite_WaitForDoorTransitionToFinish               ;A6FB9E;

  .setFunctionPointer:
    TYA                                                                  ;A6FBA1;
    STA.W Zebetite.function,X                                            ;A6FBA2;
    STZ.B DP_Temp12                                                      ;A6FBA5;
    LDA.W #$0005                                                         ;A6FBA7;
    JSL.L CheckIfEvent_inA_HasHappened                                   ;A6FBAA;
    ROL.B DP_Temp12                                                      ;A6FBAE;
    LDA.W #$0004                                                         ;A6FBB0;
    JSL.L CheckIfEvent_inA_HasHappened                                   ;A6FBB3;
    ROL.B DP_Temp12                                                      ;A6FBB7;
    LDA.W #$0003                                                         ;A6FBB9;
    JSL.L CheckIfEvent_inA_HasHappened                                   ;A6FBBC;
    ROL.B DP_Temp12                                                      ;A6FBC0;
    LDA.B DP_Temp12                                                      ;A6FBC2;
    STA.W Zebetite.destroyedCounter,X                                    ;A6FBC4;
    CMP.W #$0004                                                         ;A6FBC7;
    BMI .notAllDestroyed                                                 ;A6FBCA;
    LDA.W Enemy.properties,X                                             ;A6FBCC;
    ORA.W #$0200                                                         ;A6FBCF;
    STA.W Enemy.properties,X                                             ;A6FBD2;
    RTL                                                                  ;A6FBD5;

  .notAllDestroyed:
    ASL                                                                  ;A6FBD6;
    TAY                                                                  ;A6FBD7;
    LDA.W .multipartFlag,Y                                               ;A6FBD8;
    STA.W Zebetite.multiPartFlag,X                                       ;A6FBDB;
    LDA.W .height,Y                                                      ;A6FBDE;
    STA.W Enemy.YHitboxRadius,X                                          ;A6FBE1;
    LDA.W .instListPointer,Y                                             ;A6FBE4;
    STA.W Enemy.instList,X                                               ;A6FBE7;
    LDA.W .XPosition,Y                                                   ;A6FBEA;
    STA.W Enemy.XPosition,X                                              ;A6FBED;
    LDA.W Enemy.init0,X                                                  ;A6FBF0;
    BEQ .zeroParam1                                                      ;A6FBF3;
    LDA.W .YPosition_nonZero,Y                                           ;A6FBF5;
    STA.W Enemy.YPosition,X                                              ;A6FBF8;
    RTL                                                                  ;A6FBFB;

  .zeroParam1:
    LDA.W .YPosition_zero,Y                                              ;A6FBFC;
    STA.W Enemy.YPosition,X                                              ;A6FBFF;
    RTL                                                                  ;A6FC02;

; Indexed by zebetites destroyed counter
;       0     1     2     3
  .multipartFlag:
    dw $0000,$8000,$0000,$8000                                           ;A6FC03;

  .height:
    dw $0018,$0008,$0018,$0008                                           ;A6FC0B;

  .instListPointer:
    dw InstList_Big_HealthGreaterThanEqualTo800                          ;A6FC13;
    dw InstList_Small_HealthGreaterThanEqualTo800                        ;A6FC15;
    dw InstList_Big_HealthGreaterThanEqualTo800                          ;A6FC17;
    dw InstList_Small_HealthGreaterThanEqualTo800                        ;A6FC19;

  .XPosition:
    dw $0338,$0278,$01B8,$00F8                                           ;A6FC1B;

  .YPosition_zero:
; Y position - [enemy parameter 1] = 0
    dw $006F,$0047,$006F,$0047                                           ;A6FC23;

  .YPosition_nonZero:
; Y position - [enemy parameter 1] != 0
    dw $006F,$0097,$006F,$0097                                           ;A6FC2B;


;;; $FC33: Main AI - enemy $E27F (zebetites) ;;;
MainAI_Zebetite:
    LDX.W EnemyIndex                                                     ;A6FC33;
    LDA.W EarthquakeTimer                                                ;A6FC36;
    BNE .function                                                        ;A6FC39;
    STZ.W Enemy.shakeTimer,X                                             ;A6FC3B;

  .function:
    JMP.W (Zebetite.function,X)                                          ;A6FC3E;


;;; $FC41: Zebetites function - spawn bottom zebetite if needed ;;;
Function_Zebetite_SpawnBottomZebetiteIfNeeded:
    LDA.W Zebetite.multiPartFlag,X                                       ;A6FC41;
    BPL .notNeeded                                                       ;A6FC44;
    JSR.W SpawnBottomZebetite                                            ;A6FC46;
    LDA.W EnemyIndex                                                     ;A6FC49;
    STA.W Zebetite.otherPartEnemyIndex,X                                 ;A6FC4C;
    TAY                                                                  ;A6FC4F;
    TXA                                                                  ;A6FC50;
    TYX                                                                  ;A6FC51;
    STA.W Zebetite.otherPartEnemyIndex,X                                 ;A6FC52;

  .notNeeded:
    LDA.W #Function_Zebetite_WaitForDoorTransitionToFinish               ;A6FC55;
    STA.W Zebetite.function,X                                            ;A6FC58; fallthrough to Function_Zebetite_WaitForDoorTransitionToFinish


;;; $FC5B: Zebetites function - wait for door transition to finish ;;;
Function_Zebetite_WaitForDoorTransitionToFinish:
    LDA.W DoorTransitionFlagElevatorsZebetites                           ;A6FC5B;
    BEQ .finished                                                        ;A6FC5E;
    RTL                                                                  ;A6FC60;

  .finished:
    LDA.W #Function_Zebetite_Active                                      ;A6FC61;
    STA.W Zebetite.function,X                                            ;A6FC64; fallthrough to Function_Zebetite_Active


;;; $FC67: Zebetites function - active ;;;
Function_Zebetite_Active:
    JSR.W HandleZebetitePaletteAnimation                                 ;A6FC67;
    JSR.W SetZebetiteInstList                                            ;A6FC6A;
    LDX.W EnemyIndex                                                     ;A6FC6D;
    LDA.W Enemy.health,X                                                 ;A6FC70;
    BEQ .destroyed                                                       ;A6FC73;
    CLC                                                                  ;A6FC75;
    ADC.W #$0001                                                         ;A6FC76;
    CMP.W #$03E8                                                         ;A6FC79;
    BMI +                                                                ;A6FC7C;
    LDA.W #$03E8                                                         ;A6FC7E;

+   STA.W Enemy.health,X                                                 ;A6FC81;
    RTL                                                                  ;A6FC84;

  .destroyed:
    LDA.W Enemy.init0,X                                                  ;A6FC85;
    BEQ .singlePart                                                      ;A6FC88;

  .noMore:
    LDA.W #$0000                                                         ;A6FC8A;
    JML.L EnemyDeath                                                     ;A6FC8D;

  .singlePart:
    JSR.W MarkZebetiteDestroyedEvent                                     ;A6FC91;
    LDX.W EnemyIndex                                                     ;A6FC94;
    LDA.W Zebetite.destroyedCounter,X                                    ;A6FC97;
    CMP.W #$0004                                                         ;A6FC9A;
    BPL .noMore                                                          ;A6FC9D;
    LDA.W #$0000                                                         ;A6FC9F;
    JSL.L EnemyDeath                                                     ;A6FCA2;
    JSR.W SpawnTopZebetite                                               ;A6FCA6;
    RTL                                                                  ;A6FCA9;


;;; $FCAA: Mark zebetite destroyed event ;;;
MarkZebetiteDestroyedEvent:
; Increment destroyed counter and painstakingly convert this to mark/unmark event routine calls,
; which are a long-winded way of writing `$7E:D820 = [$7E:D820] & ~(7 << 3) | Zebetite.destroyedCounter << 3`
    LDX.W EnemyIndex                                                     ;A6FCAA;
    LDA.W Zebetite.destroyedCounter,X                                    ;A6FCAD;
    INC                                                                  ;A6FCB0;
    STA.W Zebetite.destroyedCounter,X                                    ;A6FCB1;
    STA.B DP_Temp12                                                      ;A6FCB4;
    LDY.W #$0003                                                         ;A6FCB6;
    ROR.B DP_Temp12                                                      ;A6FCB9;
    JSR.W MarkUnmarkZebetiteDestroyedCounterEvent                        ;A6FCBB;
    LDY.W #$0004                                                         ;A6FCBE;
    ROR.B DP_Temp12                                                      ;A6FCC1;
    JSR.W MarkUnmarkZebetiteDestroyedCounterEvent                        ;A6FCC3;
    LDY.W #$0005                                                         ;A6FCC6;
    ROR.B DP_Temp12                                                      ;A6FCC9; fallthrough to MarkUnmarkZebetiteDestroyedCounterEvent


;;; $FCCB: Mark/unmark zebetite destroyed counter event ;;;
MarkUnmarkZebetiteDestroyedCounterEvent:
;; Parameters:
;;     Y: Event number. 3 + (destroyed counter bit index)
;;     Carry: Zebetite bit
    BCC .unmark                                                          ;A6FCCB;
    TYA                                                                  ;A6FCCD;
    JSL.L MarkEvent_inA                                                  ;A6FCCE;
    RTS                                                                  ;A6FCD2;

  .unmark:
    TYA                                                                  ;A6FCD3;
    JSL.L UnmarkEvent_inA                                                ;A6FCD4;
    RTS                                                                  ;A6FCD8;


;;; $FCD9: Spawn top zebetite ;;;
SpawnTopZebetite:
;; Returns:
;;     X: New enemy index
    LDX.W #.enemy                                                        ;A6FCD9;
    JSL.L SpawnEnemy                                                     ;A6FCDC;
    RTS                                                                  ;A6FCE0;

  .enemy:
;        _______________________________________ X position
;       |      _________________________________ Y position
;       |     |      ___________________________ Initialisation parameter
;       |     |     |      _____________________ Properties
;       |     |     |     |      _______________ Extra properties
;       |     |     |     |     |      _________ Parameter 1
;       |     |     |     |     |     |      ___ Parameter 2
;       |     |     |     |     |     |     |
    dw EnemyHeaders_Zebetite                                             ;A6FCE1;
    dw $0000,$0000,$0000,$2000,$0000,$0000,$0000                         ;A6FCE3;


;;; $FCF1: Spawn bottom zebetite ;;;
SpawnBottomZebetite:
;; Returns:
;;     X: New enemy index
    LDX.W #.enemy                                                        ;A6FCF1;
    JSL.L SpawnEnemy                                                     ;A6FCF4;
    RTS                                                                  ;A6FCF8;

  .enemy:
;        _______________________________________ X position
;       |      _________________________________ Y position
;       |     |      ___________________________ Initialisation parameter
;       |     |     |      _____________________ Properties
;       |     |     |     |      _______________ Extra properties
;       |     |     |     |     |      _________ Parameter 1
;       |     |     |     |     |     |      ___ Parameter 2
;       |     |     |     |     |     |     |
    dw EnemyHeaders_Zebetite                                             ;A6FCF9;
    dw $0000,$0000,$0000,$2000,$0000,$0002,$0000                         ;A6FCFB;


;;; $FD09: Set zebetite instruction list ;;;
SetZebetiteInstList:
    LDX.W EnemyIndex                                                     ;A6FD09;
    LDY.W #$0000                                                         ;A6FD0C;
    LDA.W Enemy.health,X                                                 ;A6FD0F;
    CMP.W #$0320                                                         ;A6FD12;
    BPL .indexInY                                                        ;A6FD15;
    LDY.W #$0002                                                         ;A6FD17;
    CMP.W #$0258                                                         ;A6FD1A;
    BPL .indexInY                                                        ;A6FD1D;
    LDY.W #$0004                                                         ;A6FD1F;
    CMP.W #$0190                                                         ;A6FD22;
    BPL .indexInY                                                        ;A6FD25;
    LDY.W #$0006                                                         ;A6FD27;
    CMP.W #$00C8                                                         ;A6FD2A;
    BPL .indexInY                                                        ;A6FD2D;
    LDY.W #$0008                                                         ;A6FD2F;

  .indexInY:
    LDA.W .bigZebetite,Y                                                 ;A6FD32;
    BIT.W Zebetite.multiPartFlag,X                                       ;A6FD35;
    BPL .keepBig                                                         ;A6FD38;
    LDA.W .smallZebetite,Y                                               ;A6FD3A;

  .keepBig:
    STA.W Enemy.instList,X                                               ;A6FD3D;
    LDA.W #$0001                                                         ;A6FD40;
    STA.W Enemy.instTimer,X                                              ;A6FD43;
    STZ.W Enemy.loopCounter,X                                            ;A6FD46;
    RTS                                                                  ;A6FD49;

  .bigZebetite:
    dw InstList_Big_HealthGreaterThanEqualTo800                          ;A6FD4A; HP >= 800
    dw InstList_Big_HealthLessThan800                                    ;A6FD4C; HP < 800
    dw InstList_Big_HealthLessThan600                                    ;A6FD4E; HP < 600
    dw InstList_Big_HealthLessThan400                                    ;A6FD50; HP < 400
    dw InstList_Big_HealthLessThan200                                    ;A6FD52; HP < 200

  .smallZebetite:
    dw InstList_Small_HealthGreaterThanEqualTo800                        ;A6FD54; HP >= 800
    dw InstList_Small_HealthLessThan800                                  ;A6FD56; HP < 800
    dw InstList_Small_HealthLessThan600                                  ;A6FD58; HP < 600
    dw InstList_Small_HealthLessThan400                                  ;A6FD5A; HP < 400
    dw InstList_Small_HealthLessThan200                                  ;A6FD5C; HP < 200


;;; $FD5E: Handle zebetites palette animation ;;;
HandleZebetitePaletteAnimation:
; Enemy.var2 is Mother Brain's RAM >_<;
; Presumably this was supposed to be `Enemy.var2,X`, MB doesn't use that RAM address (possibly because this routine was causing an inexplicable bug),
; so it's fine, but zebetites initialisation does use `Enemy.var2,X`, so one of two routines has to be wrong
    LDA.L PaletteChangeNumerator                                         ;A6FD5E;
    BNE .return                                                          ;A6FD62;
    LDX.W EnemyIndex                                                     ;A6FD64;
    LDA.W Enemy.init0,X                                                  ;A6FD67;
    BNE .return                                                          ;A6FD6A;
    LDA.W Enemy.var2                                                     ;A6FD6C;
    INC                                                                  ;A6FD6F;
    AND.W #$0007                                                         ;A6FD70;
    STA.W Enemy.var2                                                     ;A6FD73;
    ASL                                                                  ;A6FD76;
    ASL                                                                  ;A6FD77;
    ADC.W #.colors                                                       ;A6FD78;
    TAY                                                                  ;A6FD7B;
    LDX.W #$0158                                                         ;A6FD7C;
    LDA.W #$0002                                                         ;A6FD7F;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;A6FD82;

  .return:
    RTS                                                                  ;A6FD86;

  .colors:
    dw $005F,$0037                                                       ;A6FD87;
    dw $003F,$0019
    dw $003F,$001B
    dw $001F,$001D
    dw $001F,$001F
    dw $001F,$001D
    dw $003F,$001B
    dw $003F,$0019


;;; $FDA7: Enemy touch - enemy $E27F (zebetites) ;;;
EnemyTouch_Zebetite:
    JSL.L NormalEnemyTouchAI_NoDeathCheck_External                       ;A6FDA7;
    RTL                                                                  ;A6FDAB;


;;; $FDAC: Enemy shot - enemy $E27F (zebetites) ;;;
EnemyShot_Zebetite:
; This code should probably check that the zebetite is a multipart one before doing this code with the other part
    PHA                                                                  ;A6FDAC;
    LDA.W #$0009                                                         ;A6FDAD;
    JSL.L QueueSound_Lib3_Max6                                           ;A6FDB0;
    PLA                                                                  ;A6FDB4;
    JSL.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External     ;A6FDB5;
    LDX.W EnemyIndex                                                     ;A6FDB9;
    LDY.W Zebetite.otherPartEnemyIndex,X                                 ;A6FDBC;
    LDA.W Enemy.health,X                                                 ;A6FDBF;
    STA.W Enemy.health,Y                                                 ;A6FDC2;
    LDA.W Enemy.flashTimer,X                                             ;A6FDC5;
    STA.W Enemy.flashTimer,Y                                             ;A6FDC8;
    RTL                                                                  ;A6FDCB;


;;; $FDCC: Instruction list - big zebetite - HP >= 800 ;;;
InstList_Big_HealthGreaterThanEqualTo800:
    dw $0001                                                             ;A6FDCC;
    dw Spritemap_Zebetite_Big_HealthGreaterThanEqualTo800                ;A6FDCE;
    dw Instruction_Common_Sleep                                          ;A6FDD0;


;;; $FDD2: Instruction list - big zebetite - HP < 800 ;;;
InstList_Big_HealthLessThan800:
    dw $0001                                                             ;A6FDD2;
    dw SpritemapZebetite_Big_HealthLessThan800                           ;A6FDD4;
    dw Instruction_Common_Sleep                                          ;A6FDD6;


;;; $FDD8: Instruction list - big zebetite - HP < 600 ;;;
InstList_Big_HealthLessThan600:
    dw $0001                                                             ;A6FDD8;
    dw SpritemapZebetite_Big_HealthLessThan600                           ;A6FDDA;
    dw Instruction_Common_Sleep                                          ;A6FDDC;


;;; $FDDE: Instruction list - big zebetite - HP < 400 ;;;
InstList_Big_HealthLessThan400:
    dw $0001                                                             ;A6FDDE;
    dw SpritemapZebetite_Big_HealthLessThan400                           ;A6FDE0;
    dw Instruction_Common_Sleep                                          ;A6FDE2;


;;; $FDE4: Instruction list - big zebetite - HP < 200 ;;;
InstList_Big_HealthLessThan200:
    dw $0001                                                             ;A6FDE4;
    dw SpritemapZebetite_Big_HealthLessThan200                           ;A6FDE6;
    dw Instruction_Common_Sleep                                          ;A6FDE8;


;;; $FDEA: Instruction list - small zebetite pair - HP >= 800 ;;;
InstList_Small_HealthGreaterThanEqualTo800:
    dw $0001                                                             ;A6FDEA;
    dw Spritemap_Zebetite_Small_HealthGreaterThanEqualTo800              ;A6FDEC;
    dw Instruction_Common_Sleep                                          ;A6FDEE;


;;; $FDF0: Instruction list - small zebetite pair - HP < 800 ;;;
InstList_Small_HealthLessThan800:
    dw $0001                                                             ;A6FDF0;
    dw SpritemapZebetite_Small_HealthLessThan800                         ;A6FDF2;
    dw Instruction_Common_Sleep                                          ;A6FDF4;


;;; $FDF6: Instruction list - small zebetite pair - HP < 600 ;;;
InstList_Small_HealthLessThan600:
    dw $0001                                                             ;A6FDF6;
    dw SpritemapZebetite_Small_HealthLessThan600                         ;A6FDF8;
    dw Instruction_Common_Sleep                                          ;A6FDFA;


;;; $FDFC: Instruction list - small zebetite pair - HP < 400 ;;;
InstList_Small_HealthLessThan400:
    dw $0001                                                             ;A6FDFC;
    dw SpritemapZebetite_Small_HealthLessThan400                         ;A6FDFE;
    dw Instruction_Common_Sleep                                          ;A6FE00;


;;; $FE02: Instruction list - small zebetite pair - HP < 200 ;;;
InstList_Small_HealthLessThan200:
    dw $0001                                                             ;A6FE02;
    dw SpritemapZebetite_Small_HealthLessThan200                         ;A6FE04;
    dw Instruction_Common_Sleep                                          ;A6FE06;


;;; $FE08: Spritemaps - zebetites ;;;
Spritemap_Zebetite_Big_HealthGreaterThanEqualTo800:
    dw $0003                                                             ;A6FE08;
    %spritemapEntry(1, $43F8, $08, 0, 0, 3, 0, $10C)
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $10C)
    %spritemapEntry(1, $43F8, $E8, 0, 0, 3, 0, $10C)

SpritemapZebetite_Big_HealthLessThan800:
    dw $0003                                                             ;A6FE19;
    %spritemapEntry(1, $43F8, $08, 0, 0, 3, 0, $10E)
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $10E)
    %spritemapEntry(1, $43F8, $E8, 0, 0, 3, 0, $10E)

SpritemapZebetite_Big_HealthLessThan600:
    dw $0006                                                             ;A6FE2A;
    %spritemapEntry(0, $1FC, $10, 0, 0, 3, 0, $121)
    %spritemapEntry(0, $1FC, $08, 0, 0, 3, 0, $120)
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 0, $121)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 0, $120)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 3, 0, $121)
    %spritemapEntry(0, $1FC, $E8, 0, 0, 3, 0, $120)

SpritemapZebetite_Big_HealthLessThan400:
    dw $0006                                                             ;A6FE4A;
    %spritemapEntry(0, $1FC, $10, 0, 0, 3, 0, $123)
    %spritemapEntry(0, $1FC, $08, 0, 0, 3, 0, $122)
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 0, $123)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 0, $122)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 3, 0, $123)
    %spritemapEntry(0, $1FC, $E8, 0, 0, 3, 0, $122)

SpritemapZebetite_Big_HealthLessThan200:
    dw $0006                                                             ;A6FE6A;
    %spritemapEntry(0, $1FC, $10, 0, 0, 3, 0, $125)
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 0, $125)
    %spritemapEntry(0, $1FC, $08, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 3, 0, $125)
    %spritemapEntry(0, $1FC, $E8, 0, 0, 3, 0, $124)

Spritemap_Zebetite_Small_HealthGreaterThanEqualTo800:
    dw $0001                                                             ;A6FE8A;
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $10C)

SpritemapZebetite_Small_HealthLessThan800:
    dw $0001                                                             ;A6FE91;
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $10E)

SpritemapZebetite_Small_HealthLessThan600:
    dw $0002                                                             ;A6FE98;
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 0, $121)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 0, $120)

SpritemapZebetite_Small_HealthLessThan400:
    dw $0002                                                             ;A6FEA4;
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 0, $123)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 0, $122)

SpritemapZebetite_Small_HealthLessThan200:
    dw $0002                                                             ;A6FEB0;
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 0, $125)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 0, $124)


Freespace_BankA6_FEBC:                                                   ;A6FEBC;
; $144 bytes
