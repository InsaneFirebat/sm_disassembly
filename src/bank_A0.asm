
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
    JSL.L GrappleAI_SwitchEnemyAIToMainAI                                ;A08000;
    RTL                                                                  ;A08004;


;;; $8005: Grapple AI - Samus latches on ;;;
Common_GrappleAI_SamusLatchesOn:
; Used by gripper and Crocomire
    JSL.L GrappleAI_SamusLatchesOnWithGrapple                            ;A08005;
    RTL                                                                  ;A08009;


;;; $800A: Grapple AI - kill enemy ;;;
Common_GrappleAI_KillEnemy:
; Common
    JSL.L GrappleAI_EnemyGrappleDeath                                    ;A0800A;
    RTL                                                                  ;A0800E;


;;; $800F: Grapple AI - cancel grapple beam ;;;
Common_GrappleAI_CancelGrappleBeam:
; Common
    JSL.L GrappleAI_SwitchToFrozenAI                                     ;A0800F;
    RTL                                                                  ;A08013;


;;; $8014: Grapple AI - Samus latches on - no invincibility ;;;
Common_GrappleAI_SamusLatchesOn_NoInvincibility:
; Used by powamp
    JSL.L GrappleAI_SamusLatchesOnWithGrapple_NoInvincibility            ;A08014;
    RTL                                                                  ;A08018;


;;; $8019: Unused. Grapple AI - Samus latches on - paralyse enemy ;;;
UNUSED_Common_GrappleAI_SamusLatchesOn_ParalyzeEnemy_A08019:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple_ParalyzeEnemy              ;A08019;
    RTL                                                                  ;A0801D;


;;; $801E: Grapple AI - hurt Samus ;;;
Common_GrappleAI_HurtSamus:
; Used by WS spark
; Hurt reaction happens in $9B:B932
    JSL.L GrappleAI_SwitchToFrozenAI_duplicate                           ;A0801E;
    RTL                                                                  ;A08022;


;;; $8023: Normal enemy touch AI ;;;
Common_NormalEnemyTouchAI:
    JSL.L NormalEnemyTouchAI                                             ;A08023;
    RTL                                                                  ;A08027;


;;; $8028: Normal touch AI - no death check ;;;
Common_NormalTouchAI_NoDeathCheck:
    JSL.L NormalEnemyTouchAI_NoDeathCheck_External                       ;A08028;
    RTL                                                                  ;A0802C;


;;; $802D: Normal enemy shot AI ;;;
Common_NormalEnemyShotAI:
    JSL.L NormalEnemyShotAI                                              ;A0802D;
    RTL                                                                  ;A08031;


;;; $8032: Normal enemy shot AI - no death check, no enemy shot graphic ;;;
Common_NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic:
    JSL.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External     ;A08032;
    RTL                                                                  ;A08036;


;;; $8037: Normal enemy power bomb AI ;;;
Common_NormalEnemyPowerBombAI:
    JSL.L NormalEnemyPowerBombAI                                         ;A08037;
    RTL                                                                  ;A0803B;


;;; $803C: Normal enemy power bomb AI - no death check ;;;
Common_NormalEnemyPowerBombAI_NoDeathCheck:
; Kraid's power bomb AI
    JSL.L NormalEnemyPowerBombAI_NoDeathCheck_External                   ;A0803C;
    RTL                                                                  ;A08040;


;;; $8041: Normal enemy frozen AI ;;;
Common_NormalEnemyFrozenAI:
    JSL.L NormalEnemyFrozenAI                                            ;A08041;
    RTL                                                                  ;A08045;


;;; $8046: Creates a dud shot ;;;
Common_CreateADudShot:
    JSL.L CreateADudShot                                                 ;A08046;
    RTL                                                                  ;A0804A;


;;; $804B: RTS ;;;
RTS_A0804B:
    RTS                                                                  ;A0804B;


;;; $804C: RTL ;;;
RTL_A0804C:
    RTL                                                                  ;A0804C;


;;; $804D: Spritemap - nothing ;;;
Spritemap_Common_Nothing:
    dw $0000                                                             ;A0804D;


;;; $804F: Extended spritemap - nothing ;;;
ExtendedSpritemap_Common_Nothing:
    dw $0001,$0000,$0000                                                 ;A0804F;
    dw Spritemap_Common_Nothing                                          ;A08055;
    dw Hitbox_Common_Nothing                                             ;A08057;


;;; $8059: Hitbox - nothing ;;;
Hitbox_Common_Nothing:
; [n entries] [[left offset] [top offset] [right offset] [bottom offset] [p touch] [p shot]]...
    dw $0001,$0000,$0000,$0000,$0000                                     ;A08059;
    dw Common_NormalEnemyTouchAI                                         ;A08063;
    dw Common_NormalEnemyShotAI                                          ;A08065;


;;; $8067: Instruction list - delete enemy ;;;
InstList_Common_DeleteEnemy:
    dw Instruction_Common_DeleteEnemy                                    ;A08067;


;;; $8069: Two NOPs ;;;
NOPNOP_A08069:
; Used as palette by respawning enemy placeholder and Draygon's eye o_O
    NOP                                                                  ;A08069;
    NOP                                                                  ;A0806A;

Instruction_Common_Enemy0FB2_InY:
; Used only by torizos (for enemy movement function) and escape etecoon (for enemy function)
    LDA.W $0000,Y                                                        ;A0806B;
    STA.W Enemy.var5,X                                                   ;A0806E;
    INY                                                                  ;A08071;
    INY                                                                  ;A08072;
    RTL                                                                  ;A08073;


;;; $806B: Instruction - Enemy.var5 = [[Y]] ;;;
Instruction_Common_SetEnemy0FB2ToRTS:
; Used only by torizos (for enemy movement function) and escape etecoon (for enemy function)
    LDA.W #RTS_A0807B                                                    ;A08074;
    STA.W Enemy.var5,X                                                   ;A08077;
    RTL                                                                  ;A0807A;


RTS_A0807B:
    RTS                                                                  ;A0807B;


;;; $807C: Instruction - delete enemy ;;;
Instruction_Common_DeleteEnemy:
    LDA.W Enemy.properties,X                                             ;A0807C;
    ORA.W #$0200                                                         ;A0807F;
    STA.W Enemy.properties,X                                             ;A08082;
    PLA                                                                  ;A08085;
    PEA.W ProcessEnemyInstructions_return-1                              ;A08086;
    RTL                                                                  ;A08089;


;;; $808A: Instruction - call function [[Y]] ;;;
Instruction_Common_CallFunctionInY:
    LDA.W $0000,Y                                                        ;A0808A;
    STA.B DP_Temp12                                                      ;A0808D;
    PHY                                                                  ;A0808F;
    PHX                                                                  ;A08090;
    PEA.W .manualReturn-1                                                ;A08091;
    JMP.W (DP_Temp12)                                                    ;A08094;

  .manualReturn:
    PLX                                                                  ;A08097;
    PLY                                                                  ;A08098;
    INY                                                                  ;A08099;
    INY                                                                  ;A0809A;
    RTL                                                                  ;A0809B;


;;; $809C: Instruction - call function [[Y]] with A = [[Y] + 2] ;;;
Instruction_Common_CallFunctionInY_WithA:
    LDA.W $0000,Y                                                        ;A0809C;
    STA.B DP_Temp12                                                      ;A0809F;
    LDA.W $0002,Y                                                        ;A080A1;
    PHY                                                                  ;A080A4;
    PHX                                                                  ;A080A5;
    PEA.W .manualReturn-1                                                ;A080A6;
    JMP.W (DP_Temp12)                                                    ;A080A9;

  .manualReturn:
    PLX                                                                  ;A080AC;
    PLY                                                                  ;A080AD;
    TYA                                                                  ;A080AE;
    CLC                                                                  ;A080AF;
    ADC.W #$0004                                                         ;A080B0;
    TAY                                                                  ;A080B3;
    RTL                                                                  ;A080B4;


if !FEATURE_KEEP_UNREFERENCED
;;; $80B5: Unused. Instruction - call external function [[Y]] ;;;
UNUSED_Instruction_Common_CallExternalFunctionInY_A080B5:
    LDA.W $0000,Y                                                        ;A080B5;
    STA.B DP_Temp12                                                      ;A080B8;
    LDA.W $0001,Y                                                        ;A080BA;
    STA.B DP_Temp13                                                      ;A080BD;
    PHX                                                                  ;A080BF;
    PHY                                                                  ;A080C0;
    JSL.L .externalFunction                                              ;A080C1;
    PLY                                                                  ;A080C5;
    PLX                                                                  ;A080C6;
    INY                                                                  ;A080C7;
    INY                                                                  ;A080C8;
    INY                                                                  ;A080C9;
    RTL                                                                  ;A080CA;

  .externalFunction:
    JML.W [DP_Temp12]                                                        ;A080CB;


;;; $80CE: Unused. Instruction - call external function [[Y]] with A = [[Y] + 3] ;;;
UNUSED_Inst_Common_CallExternalFunctionInY_WithA_A080CE:
    LDA.W $0000,Y                                                        ;A080CE;
    STA.B DP_Temp12                                                      ;A080D1;
    LDA.W $0001,Y                                                        ;A080D3;
    STA.B DP_Temp13                                                      ;A080D6;
    LDA.W $0003,Y                                                        ;A080D8;
    PHX                                                                  ;A080DB;
    PHY                                                                  ;A080DC;
    JSL.L .externalFunction                                              ;A080DD;
    PLY                                                                  ;A080E1;
    PLX                                                                  ;A080E2;
    TYA                                                                  ;A080E3;
    CLC                                                                  ;A080E4;
    ADC.W #$0005                                                         ;A080E5;
    TAY                                                                  ;A080E8;
    RTL                                                                  ;A080E9;

  .externalFunction:
    JML.W [DP_Temp12]                                                    ;A080EA;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $80ED: Instruction - go to [[Y]] ;;;
Instruction_Common_GotoY:
    LDA.W $0000,Y                                                        ;A080ED;
    TAY                                                                  ;A080F0;
    RTL                                                                  ;A080F1;


;;; $80F2: Instruction - go to [[Y]] + ±[[Y]] ;;;
Instruction_Common_GotoY_PlusY:
    STY.B DP_Temp12                                                      ;A080F2;
    DEY                                                                  ;A080F4;
    LDA.W $0000,Y                                                        ;A080F5;
    XBA                                                                  ;A080F8;
    BMI .highByte                                                        ;A080F9;
    AND.W #$00FF                                                         ;A080FB;
    BRA +                                                                ;A080FE;

  .highByte:
    ORA.W #$FF00                                                         ;A08100;

+   CLC                                                                  ;A08103;
    ADC.B DP_Temp12                                                      ;A08104;
    TAY                                                                  ;A08106;
    RTL                                                                  ;A08107;


;;; $8108: Instruction - decrement timer and go to [[Y]] if non-zero ;;;
Instruction_Common_DecrementTimer_GotoYIfNonZero:
    DEC.W Enemy.loopCounter,X                                            ;A08108;
    BNE Instruction_Common_GotoY                                         ;A0810B;
    INY                                                                  ;A0810D;
    INY                                                                  ;A0810E;
    RTL                                                                  ;A0810F;


;;; $8110: Instruction - decrement timer and go to [[Y]] if non-zero ;;;
Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate:
    DEC.W Enemy.loopCounter,X                                            ;A08110;
    BNE Instruction_Common_GotoY                                         ;A08113;
    INY                                                                  ;A08115;
    INY                                                                  ;A08116;
    RTL                                                                  ;A08117;


;;; $8118: Instruction - decrement timer and go to [Y] + ±[[Y]] if non-zero ;;;
Instruction_Common_DecrementTimer_GotoY_PlusY_IfNonZero:
    SEP #$20                                                             ;A08118;
    DEC.W Enemy.loopCounter,X                                            ;A0811A;
    REP #$20                                                             ;A0811D;
    BNE Instruction_Common_GotoY_PlusY                                   ;A0811F;
    INY                                                                  ;A08121;
    RTL                                                                  ;A08122;


;;; $8123: Instruction - timer = [[Y]] ;;;
Instruction_Common_TimerInY:
    LDA.W $0000,Y                                                        ;A08123;
    STA.W Enemy.loopCounter,X                                            ;A08126;
    INY                                                                  ;A08129;
    INY                                                                  ;A0812A;
    RTL                                                                  ;A0812B;


;;; $812C: Instruction - skip next instruction ;;;
Instruction_Common_SkipNextInstruction:
    INY                                                                  ;A0812C;
    INY                                                                  ;A0812D;
    RTL                                                                  ;A0812E;


;;; $812F: Instruction - sleep ;;;
Instruction_Common_Sleep:
    DEY                                                                  ;A0812F;
    DEY                                                                  ;A08130;
    TYA                                                                  ;A08131;
    STA.W Enemy.instList,X                                               ;A08132;
    PLA                                                                  ;A08135;
    PEA.W ProcessEnemyInstructions_return-1                              ;A08136;
    RTL                                                                  ;A08139;


;;; $813A: Instruction - wait [[Y]] frames ;;;
Instruction_Common_WaitYFrames:
; Set instruction timer and terminate processing enemy instructions
; Used for running a delay that doesn't update graphics,
; useful for e.g. GT eye beam attack ($AA:D10D), implemented by an instruction list that has no graphical instructions,
; which allows it to be called from multiple different poses
    LDA.W $0000,Y                                                        ;A0813A;
    STA.W Enemy.instTimer,X                                              ;A0813D;
    INY                                                                  ;A08140;
    INY                                                                  ;A08141;
    TYA                                                                  ;A08142;
    STA.W Enemy.instList,X                                               ;A08143;
    PLA                                                                  ;A08146;
    PEA.W ProcessEnemyInstructions_return-1                              ;A08147;
    RTL                                                                  ;A0814A;


;;; $814B: Instruction - transfer [[Y]] bytes from [[Y] + 2] to VRAM [[Y] + 5] ;;;
Instruction_Common_TransferYBytesInYToVRAM:
    PHX                                                                  ;A0814B;
    LDX.W VRAMWriteStack                                                 ;A0814C;
    LDA.W $0000,Y                                                        ;A0814F;
    STA.B VRAMWrite.size,X                                               ;A08152;
    LDA.W $0002,Y                                                        ;A08154;
    STA.B VRAMWrite.src,X                                                ;A08157;
    LDA.W $0003,Y                                                        ;A08159;
    STA.B VRAMWrite.src+1,X                                              ;A0815C;
    LDA.W $0005,Y                                                        ;A0815E;
    STA.B VRAMWrite.dest,X                                               ;A08161;
    TXA                                                                  ;A08163;
    CLC                                                                  ;A08164;
    ADC.W #$0007                                                         ;A08165;
    STA.W VRAMWriteStack                                                 ;A08168;
    TYA                                                                  ;A0816B;
    CLC                                                                  ;A0816C;
    ADC.W #$0007                                                         ;A0816D;
    TAY                                                                  ;A08170;
    PLX                                                                  ;A08171;
    RTL                                                                  ;A08172;


;;; $8173: Instruction - enable off-screen processing ;;;
Instruction_Common_EnableOffScreenProcessing:
    LDA.W Enemy.properties,X                                             ;A08173;
    ORA.W #$0800                                                         ;A08176;
    STA.W Enemy.properties,X                                             ;A08179;
    RTL                                                                  ;A0817C;


;;; $817D: Instruction - disable off-screen processing ;;;
Instruction_Common_DisableOffScreenProcessing:
    LDA.W Enemy.properties,X                                             ;A0817D;
    AND.W #$F7FF                                                         ;A08180;
    STA.W Enemy.properties,X                                             ;A08183;
    RTL                                                                  ;A08186;


;;; $8187: Common enemy speeds - linearly increasing ;;;
CommonEnemySpeeds_LinearlyIncreasing:
;        _____________________ Speed
;       |      _______________ Subspeed
;       |     |      _________ Negated speed
;       |     |     |      ___ Negated subspeed
;       |     |     |     |
  .speed:
    dw $0000                                                             ;A08187;
  .subspeed:
    dw       $0000                                                       ;A08189;
  .negatedSpeed:
    dw             $0000                                                 ;A0818B;
  .negatedSubspeed:
    dw                   $0000                                           ;A0818D;
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
    dw $0000                                                             ;A0838F;
  .speed:
    dw       $0000                                                       ;A08391;
  .negatedSubspeed:
    dw             $0000                                                 ;A08393;
  .negatedSpeed:
    dw                   $0000                                           ;A08395;
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
    PHB                                                                  ;A08687;
    PEA.W BGShakeDisplacements>>8&$FF00                                  ;A08688;
    PLB                                                                  ;A0868B;
    PLB                                                                  ;A0868C;
    REP #$30                                                             ;A0868D;
    LDA.W EarthquakeTimer                                                ;A0868F;
    BEQ .return                                                          ;A08692;
    LDA.W TimeIsFrozenFlag                                               ;A08694;
    BNE .return                                                          ;A08697;
    LDA.W EarthquakeType                                                 ;A08699;
    CMP.W #$0024                                                         ;A0869C;
    BPL .return                                                          ;A0869F;
    ASL                                                                  ;A086A1;
    ASL                                                                  ;A086A2;
    ASL                                                                  ;A086A3;
    TAX                                                                  ;A086A4;
    LDA.W EarthquakeTimer                                                ;A086A5;
    BIT.W #$0002                                                         ;A086A8;
    BEQ .timerExpired                                                    ;A086AB;
    LDA.W BGShakeDisplacements_BG1X,X                                    ;A086AD;
    EOR.W #$FFFF                                                         ;A086B0;
    INC                                                                  ;A086B3;
    CLC                                                                  ;A086B4;
    ADC.B DP_BG1XScroll                                                  ;A086B5;
    STA.B DP_BG1XScroll                                                  ;A086B7;
    LDA.W BGShakeDisplacements_BG1Y,X                                    ;A086B9;
    EOR.W #$FFFF                                                         ;A086BC;
    INC                                                                  ;A086BF;
    CLC                                                                  ;A086C0;
    ADC.B DP_BG1YScroll                                                  ;A086C1;
    STA.B DP_BG1YScroll                                                  ;A086C3;
    LDA.W BGShakeDisplacements_BG2X,X                                    ;A086C5;
    EOR.W #$FFFF                                                         ;A086C8;
    INC                                                                  ;A086CB;
    CLC                                                                  ;A086CC;
    ADC.B DP_BG2XScroll                                                  ;A086CD;
    STA.B DP_BG2XScroll                                                  ;A086CF;
    LDA.W BGShakeDisplacements_BG2Y,X                                    ;A086D1;
    EOR.W #$FFFF                                                         ;A086D4;
    INC                                                                  ;A086D7;
    CLC                                                                  ;A086D8;
    ADC.B DP_BG2YScroll                                                  ;A086D9;
    STA.B DP_BG2YScroll                                                  ;A086DB;
    BRA .decrementEarthquakeTimer                                        ;A086DD;

  .timerExpired:
    LDA.B DP_BG1XScroll                                                  ;A086DF;
    CLC                                                                  ;A086E1;
    ADC.W BGShakeDisplacements_BG1X,X                                    ;A086E2;
    STA.B DP_BG1XScroll                                                  ;A086E5;
    LDA.B DP_BG1YScroll                                                  ;A086E7;
    CLC                                                                  ;A086E9;
    ADC.W BGShakeDisplacements_BG1Y,X                                    ;A086EA;
    STA.B DP_BG1YScroll                                                  ;A086ED;
    LDA.B DP_BG2XScroll                                                  ;A086EF;
    CLC                                                                  ;A086F1;
    ADC.W BGShakeDisplacements_BG2X,X                                    ;A086F2;
    STA.B DP_BG2XScroll                                                  ;A086F5;
    LDA.B DP_BG2YScroll                                                  ;A086F7;
    CLC                                                                  ;A086F9;
    ADC.W BGShakeDisplacements_BG2Y,X                                    ;A086FA;
    STA.B DP_BG2YScroll                                                  ;A086FD;

  .decrementEarthquakeTimer:
    DEC.W EarthquakeTimer                                                ;A086FF;
    LDA.W EarthquakeType                                                 ;A08702;
    CMP.W #$0012                                                         ;A08705;
    BMI .return                                                          ;A08708;
    JSR.W SetAllActiveEnemiesToShakeHorizontallyFor2Frames               ;A0870A;

  .return:
    INC.W NumberOfTimesRoomShakingExecuted                               ;A0870D;
    PLB                                                                  ;A08710;
    RTL                                                                  ;A08711;


;;; $8712: Set all active enemies to shake horizontally for two frames ;;;
SetAllActiveEnemiesToShakeHorizontallyFor2Frames:
    PHY                                                                  ;A08712;
    PHX                                                                  ;A08713;
    LDY.W #$0000                                                         ;A08714;

  .loop:
    LDA.W ActiveEnemyIndices,Y                                           ;A08717;
    CMP.W #$FFFF                                                         ;A0871A;
    BEQ .return                                                          ;A0871D;
    TAX                                                                  ;A0871F;
    LDA.W #$0002                                                         ;A08720;
    STA.W Enemy.shakeTimer,X                                             ;A08723;
    INY                                                                  ;A08726;
    INY                                                                  ;A08727;
    BRA .loop                                                            ;A08728;

  .return:
    PLX                                                                  ;A0872A;
    PLY                                                                  ;A0872B;
    RTS                                                                  ;A0872C;


;;; $872D: BG shake displacements ;;;
BGShakeDisplacements:
; Enemy projectile shaking displacements are at $86:846B
;      /------horizontal------\ /------vertical------\   /------diagonal------\
;       BG1X  BG1Y  BG2X  BG2Y
  .BG1X:
    dw $0001                                                             ;A0872D;
  .BG1Y:
    dw       $0000                                                       ;A0872F;
  .BG2X:
    dw             $0000                                                 ;A08731;
  .BG2Y:                                                                 ;A08733;
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
    PHB                                                                  ;A0884D;
    PEA.W AddressesForEnemyDrawingQueues>>8&$FF00                        ;A0884E;
    PLB                                                                  ;A08851;
    PLB                                                                  ;A08852;
    REP #$30                                                             ;A08853;
    JSL.L DrawSpriteObjects                                              ;A08855;
    JSL.L DrawBombsAndProjectileExplosions                               ;A08859;
    JSL.L Draw_HighPriority_EnemyProjectile                              ;A0885D;
    STZ.W Temp_Layer                                                     ;A08861;

  .loopMain:
    LDA.W Temp_Layer                                                     ;A08864;
    CMP.W #$0008                                                         ;A08867;
    BEQ .finish                                                          ;A0886A;
    CMP.W #$0003                                                         ;A0886C;
    BNE .layerNot3                                                       ;A0886F;
    JSL.L DrawSamusAndProjectiles                                        ;A08871;
    BRA .layerNot6                                                       ;A08875;

  .layerNot3:
    CMP.W #$0006                                                         ;A08877;
    BNE .layerNot6                                                       ;A0887A;
    JSL.L Draw_LowPriority_EnemyProjectile                               ;A0887C;

  .layerNot6:
    LDA.W Temp_Layer                                                     ;A08880;
    ASL                                                                  ;A08883;
    TAY                                                                  ;A08884;
    LDA.W EnemyDrawingQueues_Sizes,Y                                     ;A08885;
    BEQ .next                                                            ;A08888;
    STA.W Temp_DrawingQueueSizeBackup                                    ;A0888A;
    LDA.W AddressesForEnemyDrawingQueues,Y                               ;A0888D;
    STA.W Temp_DrawingQueueAddr                                          ;A08890;
    LDA.W #$0000                                                         ;A08893;
    STA.W EnemyDrawingQueues_Sizes,Y                                     ;A08896;

  .loopOAM:
    STA.W Temp_DrawingQueueIndex0E38                                     ;A08899;
    CLC                                                                  ;A0889C;
    ADC.W Temp_DrawingQueueAddr                                          ;A0889D;
    TAX                                                                  ;A088A0;
    LDA.W $0000,X                                                        ;A088A1;
    STZ.W $0000,X                                                        ;A088A4;
    STA.W EnemyIndex                                                     ;A088A7;
    JSR.W WriteEnemyOAM_IfNotFrozenOrInvincibleFrame                     ;A088AA;
    LDA.W Temp_DrawingQueueIndex0E38                                     ;A088AD;
    INC                                                                  ;A088B0;
    INC                                                                  ;A088B1;
    CMP.W Temp_DrawingQueueSizeBackup                                    ;A088B2;
    BNE .loopOAM                                                         ;A088B5;

  .next:
    INC.W Temp_Layer                                                     ;A088B7;
    BRA .loopMain                                                        ;A088BA;

  .finish:
    PHB                                                                  ;A088BC;
    JSL.L .executeHook                                                   ;A088BD;
    PLB                                                                  ;A088C1;
    BRA .return                                                          ;A088C2;

  .executeHook:
    LDA.W EnemyGraphicsDrawnHook+2                                       ;A088C4;
    XBA                                                                  ;A088C7;
    PHA                                                                  ;A088C8;
    PLB                                                                  ;A088C9;
    PLB                                                                  ;A088CA;
    JML.W [EnemyGraphicsDrawnHook]                                       ;A088CB;

  .return:
    PLB                                                                  ;A088CE;
    RTL                                                                  ;A088CF;


;;; $88D0: Record enemy spawn data ;;;
Record_EnemySpawnData:
;; Parameters:
;;     Y: Enemy index

; Used almost exclusively by debug enemy spawner. Rinka uses X/Y position
    PHX                                                                  ;A088D0;
    PHY                                                                  ;A088D1;
    TYX                                                                  ;A088D2;
    LDA.W Enemy.ID,X                                                     ;A088D3;
    STA.L EnemyTileData+$1E,X                                            ;A088D6;
    LDA.W Enemy.XPosition,X                                              ;A088DA;
    STA.L EnemyTileData+$20,X                                            ;A088DD;
    LDA.W Enemy.YPosition,X                                              ;A088E1;
    STA.L EnemyTileData+$22,X                                            ;A088E4;
    LDA.W Enemy.instList,X                                               ;A088E8;
    STA.L EnemyTileData+$24,X                                            ;A088EB;
    LDA.W Enemy.properties,X                                             ;A088EF;
    STA.L EnemyTileData+$26,X                                            ;A088F2;
    LDA.W Enemy.properties2,X                                            ;A088F6;
    STA.L EnemyTileData+$28,X                                            ;A088F9;
    LDA.W Enemy.init0,X                                                  ;A088FD;
    STA.L EnemyTileData+$2A,X                                            ;A08900;
    LDA.W Enemy.init1,X                                                  ;A08904;
    STA.L EnemyTileData+$2C,X                                            ;A08907;
    STZ.B DP_Temp12                                                      ;A0890B;
    STZ.B DP_Temp14                                                      ;A0890D;
    STZ.B DP_Temp16                                                      ;A0890F;
    STZ.B DP_Temp18                                                      ;A08911;
    STZ.B DP_Temp1A                                                      ;A08913;
    STZ.B DP_Temp1C                                                      ;A08915;
    PHX                                                                  ;A08917;
    LDA.W Enemy.ID,X                                                     ;A08918;
    TAX                                                                  ;A0891B;
    LDA.L EnemyHeaders_name,X                                            ;A0891C;
    BEQ .doneName                                                        ;A08920;
    TAX                                                                  ;A08922;
    LDA.L EnemyNames_name,X                                              ;A08923;
    STA.B DP_Temp12                                                      ;A08927;
    LDA.L EnemyNames_name+2,X                                            ;A08929;
    STA.B DP_Temp14                                                      ;A0892D;
    LDA.L EnemyNames_name+4,X                                            ;A0892F;
    STA.B DP_Temp16                                                      ;A08933;
    LDA.L EnemyNames_name+6,X                                            ;A08935;
    STA.B DP_Temp18                                                      ;A08939;
    LDA.L EnemyNames_name+8,X                                            ;A0893B;
    STA.B DP_Temp1A                                                      ;A0893F;
    LDA.L EnemyNames_spritemap,X                                         ;A08941;
    STA.B DP_Temp1C                                                      ;A08945;

  .doneName:
    PLX                                                                  ;A08947;
    LDA.B DP_Temp12                                                      ;A08948;
    STA.L EnemyTileData+$2E,X                                            ;A0894A;
    LDA.B DP_Temp14                                                      ;A0894E;
    STA.L EnemyTileData+$30,X                                            ;A08950;
    LDA.B DP_Temp16                                                      ;A08954;
    STA.L EnemyTileData+$32,X                                            ;A08956;
    LDA.B DP_Temp18                                                      ;A0895A;
    STA.L EnemyTileData+$34,X                                            ;A0895C;
    LDA.B DP_Temp1A                                                      ;A08960;
    STA.L EnemyTileData+$36,X                                            ;A08962;
    LDA.B DP_Temp1C                                                      ;A08966;
    STA.L EnemyTileData+$38,X                                            ;A08968;
    PLY                                                                  ;A0896C;
    PLX                                                                  ;A0896D;
    RTL                                                                  ;A0896E;


;;; $896F: Debug. Load enemy set data ;;;
Debug_LoadEnemySetData:
; This enemy set data is never used, not even by the enemy debugger. This routine serves no purpose
    LDA.W #$0000                                                         ;A0896F;
    LDX.W #$0000                                                         ;A08972;
    LDY.W #$00A0                                                         ;A08975;

  .loopUpper:
    STA.L EnemySetName,X                                                 ;A08978;
    INX                                                                  ;A0897C;
    INX                                                                  ;A0897D;
    DEY                                                                  ;A0897E;
    DEY                                                                  ;A0897F;
    BNE .loopUpper                                                       ;A08980;
    LDA.W EnemySetPointer                                                ;A08982;
    SEC                                                                  ;A08985;
    SBC.W #$0007                                                         ;A08986;
    TAX                                                                  ;A08989;
    LDA.L EnemySetNames,X                                                ;A0898A;
    STA.L EnemySetName                                                   ;A0898E;
    LDA.L EnemySetNames+2,X                                              ;A08992;
    STA.L EnemySetName+2                                                 ;A08996;
    LDA.L EnemySetNames+4,X                                              ;A0899A;
    STA.L EnemySetName+4                                                 ;A0899E;
    LDA.L EnemySetNames+6,X                                              ;A089A2;
    STA.L EnemySetName+6                                                 ;A089A6;
    LDY.W #$0007                                                         ;A089AA;
    LDA.W EnemySetPointer                                                ;A089AD;
    TAX                                                                  ;A089B0;

  .loop:
    LDA.L EnemySets_ID,X                                                 ;A089B1;
    CMP.W #$FFFF                                                         ;A089B5;
    BEQ .return                                                          ;A089B8;
    PHX                                                                  ;A089BA;
    TAX                                                                  ;A089BB;
    LDA.L EnemyHeaders_name,X                                            ;A089BC;
    BNE .hasName                                                         ;A089C0;
    LDA.W #EnemyName_NoData                                              ;A089C2;

  .hasName:
    TAX                                                                  ;A089C5;
    LDA.L EnemyNames_name,X                                              ;A089C6;
    STA.B DP_Temp12                                                      ;A089CA;
    LDA.L EnemyNames_name+2,X                                            ;A089CC;
    STA.B DP_Temp14                                                      ;A089D0;
    LDA.L EnemyNames_name+4,X                                            ;A089D2;
    STA.B DP_Temp16                                                      ;A089D6;
    LDA.L EnemyNames_name+6,X                                            ;A089D8;
    STA.B DP_Temp18                                                      ;A089DC;
    LDA.L EnemyNames_name+8,X                                            ;A089DE;
    STA.B DP_Temp1A                                                      ;A089E2;
    TYX                                                                  ;A089E4;
    LDA.B DP_Temp12                                                      ;A089E5;
    STA.L EnemySetName,X                                                 ;A089E7;
    LDA.B DP_Temp14                                                      ;A089EB;
    STA.L EnemySetName+2,X                                               ;A089ED;
    LDA.B DP_Temp16                                                      ;A089F1;
    STA.L EnemySetName+4,X                                               ;A089F3;
    LDA.B DP_Temp18                                                      ;A089F7;
    STA.L EnemySetName+6,X                                               ;A089F9;
    LDA.B DP_Temp1A                                                      ;A089FD;
    STA.L EnemySetName+8,X                                               ;A089FF;
    PLX                                                                  ;A08A03;
    PHX                                                                  ;A08A04;
    LDA.L EnemySets_palette,X                                            ;A08A05;
    TYX                                                                  ;A08A09;
    STA.L EnemySetName+$A,X                                              ;A08A0A;
    PLX                                                                  ;A08A0E;
    TYA                                                                  ;A08A0F;
    CLC                                                                  ;A08A10;
    ADC.W #$000C                                                         ;A08A11;
    TAY                                                                  ;A08A14;
    TXA                                                                  ;A08A15;
    CLC                                                                  ;A08A16;
    ADC.W #$0004                                                         ;A08A17;
    TAX                                                                  ;A08A1A;
    BRA .loop                                                            ;A08A1B;

  .return:
    RTL                                                                  ;A08A1D;


;;; $8A1E: Load enemies (load and process enemy set, clear enemy data, load enemy tile data) ;;;
Load_Enemies:
; Called when loading the game, and during door transition
; This routine loads enemy tile data, which during door transition has already loaded by $82:DFD1, making the call to $8C6C a fairly hefty waste of time
; Aside from loading tile data, this routine also loads palette data, and the enemy GFX data needed for respawn
    PHP                                                                  ;A08A1E;
    PHB                                                                  ;A08A1F;
    PEA.W Load_Enemies>>8&$FF00                                          ;A08A20;
    PLB                                                                  ;A08A23;
    PLB                                                                  ;A08A24;
    REP #$30                                                             ;A08A25;
    JSL.L Debug_LoadEnemySetData                                         ;A08A27;
    STZ.W DebugTimeIsFrozenForEnemies                                    ;A08A2B;
    STZ.W BossID                                                         ;A08A2E;
    LDA.W #RTL_A0804C>>16                                                ;A08A31;
    STA.W EnemyGraphicsDrawnHook+2                                       ;A08A34;
    LDA.W #RTL_A0804C                                                    ;A08A37;
    STA.W EnemyGraphicsDrawnHook                                         ;A08A3A;
    LDA.W #RTL_A0804C>>16                                                ;A08A3D;
    STA.W unused1790+2                                                   ;A08A40;
    LDA.W #RTL_A0804C                                                    ;A08A43;
    STA.W unused1790                                                     ;A08A46;
    LDA.W #$0800                                                         ;A08A49;
    STA.W EnemyBG2TilemapSize                                            ;A08A4C;
    STZ.W unused179E                                                     ;A08A4F;
    STZ.W unused17A0                                                     ;A08A52;
    STZ.W BossID                                                         ;A08A55;
    JSL.L ClearEnemyData_ProcessEnemySet                                 ;A08A58;
    JSL.L LoadEnemyTileData                                              ;A08A5C;
    STZ.W EnemyTileData_SrcAddr                                          ;A08A60;
    STZ.W DisableSamusVsProjectileInteraction                            ;A08A63;
    JSL.L ClearSpriteObjects                                             ;A08A66;
    PLB                                                                  ;A08A6A;
    PLP                                                                  ;A08A6B;
    RTL                                                                  ;A08A6C;


;;; $8A6D: Clear enemy data and process enemy set ;;;
ClearEnemyData_ProcessEnemySet:
    PHP                                                                  ;A08A6D;
    PHB                                                                  ;A08A6E;
    PEA.W ClearEnemyData_ProcessEnemySet>>8&$FF00                        ;A08A6F;
    PLB                                                                  ;A08A72;
    PLB                                                                  ;A08A73;
    REP #$30                                                             ;A08A74;
    LDA.W #$0000                                                         ;A08A76;
    LDY.W #$0800                                                         ;A08A79;
    LDX.W #$0000                                                         ;A08A7C;

  .loop:
    STA.L Enemy.ID,X                                                     ;A08A7F;
    INX                                                                  ;A08A83;
    DEY                                                                  ;A08A84;
    INX                                                                  ;A08A85;
    DEY                                                                  ;A08A86;
    BNE .loop                                                            ;A08A87;
    LDX.W EnemyPopulationPointer                                         ;A08A89;
    LDA.L EnemyPopulations_ID,X                                          ;A08A8C;
    CMP.W #$FFFF                                                         ;A08A90;
    BNE .processEnemySet                                                 ;A08A93;
    JMP.W .return                                                        ;A08A95;

  .processEnemySet:
    JSR.W ProcessEnemySet_LoadPalettesAndEnemyLoadingData                ;A08A98;

  .return:
    PLB                                                                  ;A08A9B;
    PLP                                                                  ;A08A9C;
    RTL                                                                  ;A08A9D;


;;; $8A9E: Initialise enemies ;;;
Initialise_Enemies:
    PHP                                                                  ;A08A9E;
    PHB                                                                  ;A08A9F;
    LDY.W #$1400                                                         ;A08AA0;
    LDX.W #$0000                                                         ;A08AA3;
    LDA.W #$0000                                                         ;A08AA6;

  .loopExtraEnemyRAM:
    STA.L EnemyTileData,X                                                ;A08AA9;
    INX                                                                  ;A08AAD;
    INX                                                                  ;A08AAE;
    DEY                                                                  ;A08AAF;
    BNE .loopExtraEnemyRAM                                               ;A08AB0;
    PEA.W EnemyHeaders>>8&$FF00                                          ;A08AB2;
    PLB                                                                  ;A08AB5;
    PLB                                                                  ;A08AB6;
    REP #$30                                                             ;A08AB7;
    STZ.W neverRead0E4E                                                  ;A08AB9;
    STZ.W NumberOfEnemiesKilled                                          ;A08ABC;
    STZ.W GlobalOffScreenEnemyProcessingFlag                             ;A08ABF;
    LDX.W #$011E                                                         ;A08AC2;
    LDA.W #$0000                                                         ;A08AC5;

  .loopExtraEnemyProjectileRAM:
    STA.L EnemyProjectileData_CollisionOptions,X                         ;A08AC8;
    DEX                                                                  ;A08ACC;
    DEX                                                                  ;A08ACD;
    BPL .loopExtraEnemyProjectileRAM                                     ;A08ACE;
    LDX.W #$0022                                                         ;A08AD0;
    LDA.W #$FFFF                                                         ;A08AD3;

  .loopEnemyProjectileKilledEnemyIndices:
    STA.L EnemyProjectileData_KilledEnemyIndex,X                         ;A08AD6;
    DEX                                                                  ;A08ADA;
    DEX                                                                  ;A08ADB;
    BPL .loopEnemyProjectileKilledEnemyIndices                           ;A08ADC;
    LDX.W EnemyPopulationPointer                                         ;A08ADE;
    LDA.L EnemyPopulations_ID,X                                          ;A08AE1;
    CMP.W #$FFFF                                                         ;A08AE5;
    BNE +                                                                ;A08AE8;
    JMP.W .return                                                        ;A08AEA;

+   STZ.W neverRead0E48                                                  ;A08AED;
    LDY.W #$0000                                                         ;A08AF0;

  .loop:
    JSR.W LoadEnemyGFXIndices                                            ;A08AF3;
    PHX                                                                  ;A08AF6;
    LDA.L EnemyPopulations_ID,X                                          ;A08AF7;
    TAX                                                                  ;A08AFB;
    LDA.W $0008,X                                                        ;A08AFC;
    STA.W Enemy.XHitboxRadius,Y                                          ;A08AFF;
    LDA.W $000A,X                                                        ;A08B02;
    STA.W Enemy.YHitboxRadius,Y                                          ;A08B05;
    LDA.W $0004,X                                                        ;A08B08;
    STA.W Enemy.health,Y                                                 ;A08B0B;
    LDA.W $0039,X                                                        ;A08B0E;
    AND.W #$00FF                                                         ;A08B11;
    STA.W Enemy.layer,Y                                                  ;A08B14;
    LDA.W $000C,X                                                        ;A08B17;
    STA.W Enemy.bank,Y                                                   ;A08B1A;
    LDA.W $0010,X                                                        ;A08B1D;
    BEQ +                                                                ;A08B20;
    STA.W BossID                                                         ;A08B22;

+   PLX                                                                  ;A08B25;
    LDA.L EnemyPopulations_ID,X                                          ;A08B26;
    STA.W Enemy.ID,Y                                                     ;A08B2A;
    LDA.L EnemyPopulations_XPosition,X                                   ;A08B2D;
    STA.W Enemy.XPosition,Y                                              ;A08B31;
    LDA.L EnemyPopulations_YPosition,X                                   ;A08B34;
    STA.W Enemy.YPosition,Y                                              ;A08B38;
    LDA.L EnemyPopulations_init,X                                        ;A08B3B;
    STA.W Enemy.instList,Y                                               ;A08B3F;
    LDA.L EnemyPopulations_properties,X                                  ;A08B42;
    STA.W Enemy.properties,Y                                             ;A08B46;
    LDA.L EnemyPopulations_extraProperties,X                             ;A08B49;
    STA.W Enemy.properties2,Y                                            ;A08B4D;
    LDA.L EnemyPopulations_param1,X                                      ;A08B50;
    STA.W Enemy.init0,Y                                                  ;A08B54;
    LDA.L EnemyPopulations_param2,X                                      ;A08B57;
    STA.W Enemy.init1,Y                                                  ;A08B5B;
    LDA.W #$0000                                                         ;A08B5E;
    STA.W Enemy.frameCounter,Y                                           ;A08B61;
    STA.W Enemy.loopCounter,Y                                            ;A08B64;
    LDA.W #$0001                                                         ;A08B67;
    STA.W Enemy.instTimer,Y                                              ;A08B6A;
    LDA.W #$0000                                                         ;A08B6D;
    STA.W Enemy.frameCounter,Y                                           ;A08B70;
    JSL.L Record_EnemySpawnData                                          ;A08B73;
    PHX                                                                  ;A08B77;
    PHY                                                                  ;A08B78;
    STY.W EnemyIndex                                                     ;A08B79;
    LDX.W Enemy.ID,Y                                                     ;A08B7C;
    LDA.W $0012,X                                                        ;A08B7F;
    STA.W EnemyAIPointer                                                 ;A08B82;
    LDA.W $000C,X                                                        ;A08B85;
    STA.W EnemyAIPointer+2                                               ;A08B88;
    PHB                                                                  ;A08B8B;
    JSL.L .executeInitAI                                                 ;A08B8C;
    PLB                                                                  ;A08B90;
    PLY                                                                  ;A08B91;
    PLX                                                                  ;A08B92;
    LDA.W #$0000                                                         ;A08B93;
    STA.W Enemy.spritemap,Y                                              ;A08B96;
    LDA.W Enemy.properties,Y                                             ;A08B99;
    BIT.W #$2000                                                         ;A08B9C;
    BEQ .noInstructions                                                  ;A08B9F;
    PHX                                                                  ;A08BA1;
    PHY                                                                  ;A08BA2;
    LDX.W #Spritemap_Common_Nothing                                      ;A08BA3;
    LDA.W Enemy.properties2,Y                                            ;A08BA6;
    BIT.W #$0004                                                         ;A08BA9;
    BEQ +                                                                ;A08BAC;
    LDX.W #ExtendedSpritemap_Common_Nothing                              ;A08BAE;

+   TXA                                                                  ;A08BB1;
    STA.W Enemy.spritemap,Y                                              ;A08BB2;
    PLY                                                                  ;A08BB5;
    PLX                                                                  ;A08BB6;

  .noInstructions:
    TYA                                                                  ;A08BB7;
    CLC                                                                  ;A08BB8;
    ADC.W #$0040                                                         ;A08BB9;
    TAY                                                                  ;A08BBC;
    TXA                                                                  ;A08BBD;
    CLC                                                                  ;A08BBE;
    ADC.W #$0010                                                         ;A08BBF;
    TAX                                                                  ;A08BC2;
    LDA.L EnemyPopulations_ID,X                                          ;A08BC3;
    CMP.W #$FFFF                                                         ;A08BC7;
    BEQ +                                                                ;A08BCA;
    JMP.W .loop                                                          ;A08BCC;

+   STY.W FirstFreeEnemyIndex                                            ;A08BCF;
    TYA                                                                  ;A08BD2;
    LSR                                                                  ;A08BD3;
    LSR                                                                  ;A08BD4;
    LSR                                                                  ;A08BD5;
    LSR                                                                  ;A08BD6;
    LSR                                                                  ;A08BD7;
    LSR                                                                  ;A08BD8;
    STA.W neverRead0E4E                                                  ;A08BD9;
    LDA.L EnemyPopulations_XPosition,X                                   ;A08BDC;
    AND.W #$00FF                                                         ;A08BE0;
    STA.W NumberOfEnemiesRequiredToKill                                  ;A08BE3;

  .return:
    PLB                                                                  ;A08BE6;
    PLP                                                                  ;A08BE7;
    RTL                                                                  ;A08BE8;

  .executeInitAI:
; Execute enemy initialisation AI
    LDA.W Enemy.bank,Y                                                   ;A08BE9;
    XBA                                                                  ;A08BEC;
    PHA                                                                  ;A08BED;
    PLB                                                                  ;A08BEE;
    PLB                                                                  ;A08BEF;
    JML.W [EnemyAIPointer]                                               ;A08BF0;


;;; $8BF3: Load enemy GFX indices ;;;
LoadEnemyGFXIndices:
;; Parameters:
;;     X: Enemy population index
;;     Y: Enemy data index
    PHX                                                                  ;A08BF3;
    PHY                                                                  ;A08BF4;
    STX.B DP_Temp12                                                      ;A08BF5;
    STY.B DP_Temp14                                                      ;A08BF7;
    LDA.W EnemySetPointer                                                ;A08BF9;
    STA.B DP_Temp1C                                                      ;A08BFC;
    STZ.B DP_Temp1E                                                      ;A08BFE;

  .loop:
    LDX.B DP_Temp12                                                      ;A08C00;
    LDA.L EnemyPopulations_ID,X                                          ;A08C02;
    LDX.B DP_Temp1C                                                      ;A08C06;
    CMP.L EnemySets_ID,X                                                 ;A08C08;
    BEQ .found                                                           ;A08C0C;
    LDA.L EnemySets_ID,X                                                 ;A08C0E;
    CMP.W #$FFFF                                                         ;A08C12;
    BEQ .notFound                                                        ;A08C15;
    LDA.L EnemySets_ID,X                                                 ;A08C17; >.<
    TAX                                                                  ;A08C1B;
    LDA.W $0000,X                                                        ;A08C1C;
    LSR                                                                  ;A08C1F;
    LSR                                                                  ;A08C20;
    LSR                                                                  ;A08C21;
    LSR                                                                  ;A08C22;
    LSR                                                                  ;A08C23;
    CLC                                                                  ;A08C24;
    ADC.B DP_Temp1E                                                      ;A08C25;
    STA.B DP_Temp1E                                                      ;A08C27;
    LDA.B DP_Temp1C                                                      ;A08C29;
    CLC                                                                  ;A08C2B;
    ADC.W #$0004                                                         ;A08C2C;
    STA.B DP_Temp1C                                                      ;A08C2F;
    BRA .loop                                                            ;A08C31;

  .notFound:
    LDX.B DP_Temp14                                                      ;A08C33;
    STZ.W Enemy.GFXOffset,X                                              ;A08C35;
    LDA.W #$0000                                                         ;A08C38;
    STA.L EnemySpawnData.VRAMTilesIndex,X                                ;A08C3B;
    LDA.W #$0A00                                                         ;A08C3F;
    STA.W Enemy.palette,X                                                ;A08C42;
    STA.L EnemySpawnData.paletteIndex,X                                  ;A08C45;
    PLY                                                                  ;A08C49;
    PLX                                                                  ;A08C4A;
    RTS                                                                  ;A08C4B;

  .found:
    LDX.B DP_Temp1C                                                      ;A08C4C;
    LDA.L EnemySets_palette,X                                            ;A08C4E;
    AND.W #$000F                                                         ;A08C52;
    XBA                                                                  ;A08C55;
    ASL                                                                  ;A08C56;
    LDX.B DP_Temp14                                                      ;A08C57;
    STA.W Enemy.palette,X                                                ;A08C59;
    STA.L EnemySpawnData.paletteIndex,X                                  ;A08C5C;
    LDA.B DP_Temp1E                                                      ;A08C60;
    STA.W Enemy.GFXOffset,X                                              ;A08C62;
    STA.L EnemySpawnData.VRAMTilesIndex,X                                ;A08C65;
    PLY                                                                  ;A08C69;
    PLX                                                                  ;A08C6A;
    RTS                                                                  ;A08C6B;


;;; $8C6C: Load enemy tile data ;;;
LoadEnemyTileData:
; Loads enemy tile data to $7E:7000+, this is then transferred to VRAM when loading the game, but ignored and cleared during door transition >_>
; Note how this routine can't load enemy graphics from hirom banks due to setting the DB to the tile data bank (which kills short address accesses to WRAM)
    REP #$30                                                             ;A08C6C;
    LDX.W #$01FE                                                         ;A08C6E;

  .loopSprites:
    LDA.L Tiles_Standard_Sprite_1,X                                      ;A08C71;
    STA.L EnemyTileData,X                                                ;A08C75;
    DEX                                                                  ;A08C79;
    DEX                                                                  ;A08C7A;
    BPL .loopSprites                                                     ;A08C7B;
    LDA.W EnemyTileData_StackPointer                                     ;A08C7D;
    BEQ .return                                                          ;A08C80;
    LDX.W #$0000                                                         ;A08C82;
    PHB                                                                  ;A08C85;

  .loopEnemies:
    LDA.W EnemyTileData_Pointer,X                                        ;A08C86;
    TAY                                                                  ;A08C89;
    CLC                                                                  ;A08C8A;
    ADC.W EnemyTileData_Size,X                                           ;A08C8B;
    STA.B DP_Temp12                                                      ;A08C8E;
    LDA.W EnemyTileData_Pointer+1,X                                      ;A08C90;
    PHA                                                                  ;A08C93;
    PLB                                                                  ;A08C94;
    PLB                                                                  ;A08C95;
    TXA                                                                  ;A08C96;
    CLC                                                                  ;A08C97;
    ADC.W #$0007                                                         ;A08C98;
    PHA                                                                  ;A08C9B;
    LDA.W EnemyTileData_Offset,X                                         ;A08C9C;
    TAX                                                                  ;A08C9F;

  .loopTiles:
    LDA.W $0000,Y                                                        ;A08CA0;
    STA.L EnemyTileData,X                                                ;A08CA3;
    LDA.W $0002,Y                                                        ;A08CA7;
    STA.L EnemyTileData+2,X                                              ;A08CAA;
    LDA.W $0004,Y                                                        ;A08CAE;
    STA.L EnemyTileData+4,X                                              ;A08CB1;
    LDA.W $0006,Y                                                        ;A08CB5;
    STA.L EnemyTileData+6,X                                              ;A08CB8;
    TXA                                                                  ;A08CBC;
    CLC                                                                  ;A08CBD;
    ADC.W #$0008                                                         ;A08CBE;
    TAX                                                                  ;A08CC1;
    TYA                                                                  ;A08CC2;
    CLC                                                                  ;A08CC3;
    ADC.W #$0008                                                         ;A08CC4;
    TAY                                                                  ;A08CC7;
    CPY.B DP_Temp12                                                      ;A08CC8;
    BNE .loopTiles                                                       ;A08CCA;
    PLX                                                                  ;A08CCC;
    CPX.W EnemyTileData_StackPointer                                     ;A08CCD;
    BNE .loopEnemies                                                     ;A08CD0;
    STZ.W EnemyTileData_StackPointer                                     ;A08CD2;
    PLB                                                                  ;A08CD5;

  .return:
    RTL                                                                  ;A08CD6;


;;; $8CD7: Transfer enemy tiles to VRAM and initialise enemies ;;;
TransferEnemyTilesToVRAM_InitialiseEnemies:
; To be executed 6 times
    REP #$30                                                             ;A08CD7;
    LDA.W EnemyTileData_SrcAddr                                          ;A08CD9;
    BNE .nonZeroSrcAddr                                                  ;A08CDC;
    LDA.W #EnemyTileData                                                 ;A08CDE;
    STA.W EnemyTileData_SrcAddr                                          ;A08CE1;
    LDX.W #$6C00                                                         ;A08CE4;
    STX.W EnemyTileData_DestAddr                                         ;A08CE7;

  .nonZeroSrcAddr:
    CMP.W #$FFFF                                                         ;A08CEA;
    BNE .notFFFF                                                         ;A08CED;
    RTL                                                                  ;A08CEF;

  .notFFFF:
    CMP.W #$FFFE                                                         ;A08CF0;
    BNE .notFFFE                                                         ;A08CF3;
    JSL.L Initialise_Enemies                                             ;A08CF5;
    LDA.W #$FFFF                                                         ;A08CF9;
    STA.W EnemyTileData_SrcAddr                                          ;A08CFC;
    RTL                                                                  ;A08CFF;

  .notFFFE:
    CMP.W #$9800                                                         ;A08D00;
    BEQ .finish                                                          ;A08D03;
    LDX.W VRAMWriteStack                                                 ;A08D05;
    LDA.W #$0800                                                         ;A08D08;
    STA.B VRAMWrite.size,X                                               ;A08D0B;
    LDA.W EnemyTileData_SrcAddr                                          ;A08D0D;
    STA.B VRAMWrite.src,X                                                ;A08D10;
    CLC                                                                  ;A08D12;
    ADC.W #$0800                                                         ;A08D13;
    STA.W EnemyTileData_SrcAddr                                          ;A08D16;
    LDA.W #EnemyTileData>>16                                             ;A08D19;
    STA.B VRAMWrite.src+2,X                                              ;A08D1C;
    LDA.W EnemyTileData_DestAddr                                         ;A08D1E;
    STA.B VRAMWrite.dest,X                                               ;A08D21;
    CLC                                                                  ;A08D23;
    ADC.W #$0400                                                         ;A08D24;
    STA.W EnemyTileData_DestAddr                                         ;A08D27;
    TXA                                                                  ;A08D2A;
    CLC                                                                  ;A08D2B;
    ADC.W #$0007                                                         ;A08D2C;
    STA.W VRAMWriteStack                                                 ;A08D2F;
    RTL                                                                  ;A08D32;

  .finish:
    LDA.W #$FFFE                                                         ;A08D33;
    STA.W EnemyTileData_SrcAddr                                          ;A08D36;
    RTL                                                                  ;A08D39;


if !FEATURE_KEEP_UNREFERENCED
;;; $8D3A: Unused. Load enemy width, height, health, layer and bank ;;;
UNUSED_LoadEnemyWidthHeightHealthLayerBank_A08D3A:
    PHX                                                                  ;A08D3A;
    PHY                                                                  ;A08D3B;
    LDA.W $0000,X                                                        ;A08D3C;
    TAX                                                                  ;A08D3F;
    LDA.W $0008,X                                                        ;A08D40;
    STA.W Enemy.XHitboxRadius,Y                                          ;A08D43;
    LDA.W $000A,X                                                        ;A08D46;
    STA.W Enemy.YHitboxRadius,Y                                          ;A08D49;
    LDA.W $0004,X                                                        ;A08D4C;
    STA.W Enemy.health,Y                                                 ;A08D4F;
    LDA.W $0039,X                                                        ;A08D52;
    AND.W #$00FF                                                         ;A08D55;
    STA.W Enemy.layer,Y                                                  ;A08D58;
    LDA.W $000C,X                                                        ;A08D5B;
    STA.W Enemy.bank,Y                                                   ;A08D5E;
    PLY                                                                  ;A08D61;
    PLX                                                                  ;A08D62;
    RTL                                                                  ;A08D63;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8D64: Process enemy set (load palettes and enemy loading data) ;;;
ProcessEnemySet_LoadPalettesAndEnemyLoadingData:
    PHX                                                                  ;A08D64;
    PHY                                                                  ;A08D65;
    STZ.W EnemyTileData_StackPointer                                     ;A08D66;
    LDA.W #$0800                                                         ;A08D69;
    STA.B DP_Temp1E                                                      ;A08D6C;
    LDA.W #$0000                                                         ;A08D6E;
    STA.L EnemyGFXData_IDs                                               ;A08D71;
    STA.L EnemyGFXData_IDs+2                                             ;A08D75;
    STA.L EnemyGFXData_IDs+4                                             ;A08D79;
    STA.L EnemyGFXData_IDs+6                                             ;A08D7D;
    STA.L EnemyGFXData_TilesIndex                                        ;A08D81;
    STA.L EnemyGFXData_TilesIndex+2                                      ;A08D85;
    STA.L EnemyGFXData_TilesIndex+4                                      ;A08D89;
    STA.L EnemyGFXData_TilesIndex+6                                      ;A08D8D;
    STA.L EnemyGFXData_PaletteIndices                                    ;A08D91;
    STA.L EnemyGFXData_PaletteIndices+2                                  ;A08D95;
    STA.L EnemyGFXData_PaletteIndices+4                                  ;A08D99;
    STA.L EnemyGFXData_PaletteIndices+6                                  ;A08D9D;
    STA.L EnemyGFXData_StackPointer                                      ;A08DA1;
    STA.L EnemyGFXData_NextTilesIndex                                    ;A08DA5;
    LDA.W EnemySetPointer                                                ;A08DA9;
    STA.B DP_Temp1C                                                      ;A08DAC;

  .loop:
    TAX                                                                  ;A08DAE;
    LDA.L EnemySets_ID,X                                                 ;A08DAF;
    CMP.W #$FFFF                                                         ;A08DB3;
    BNE .notFFFF                                                         ;A08DB6;
    JMP.W .return                                                        ;A08DB8;

  .notFFFF:
    TAX                                                                  ;A08DBB;
    LDA.W $0000,X                                                        ;A08DBC;
    STA.B DP_Temp12                                                      ;A08DBF;
    LDA.W $0002,X                                                        ;A08DC1;
    STA.B DP_Temp14                                                      ;A08DC4;
    LDA.W $000C,X                                                        ;A08DC6;
    STA.W Temp_Bank                                                      ;A08DC9;
    LDX.B DP_Temp1C                                                      ;A08DCC;
    LDA.L EnemySets_palette,X                                            ;A08DCE;
    AND.W #$00FF                                                         ;A08DD2;
    CLC                                                                  ;A08DD5;
    ADC.W #$0008                                                         ;A08DD6;
    JSL.L MultiplyBy20_A0B002                                            ;A08DD9;
    CLC                                                                  ;A08DDD;
    ADC.W #TargetPalettes_BGP0                                           ;A08DDE;
    STA.B DP_Temp16                                                      ;A08DE1;
    PHB                                                                  ;A08DE3;
    LDA.W Temp_Bank                                                      ;A08DE4;
    XBA                                                                  ;A08DE7;
    PHA                                                                  ;A08DE8;
    PLB                                                                  ;A08DE9;
    PLB                                                                  ;A08DEA;
    LDA.W #$0010                                                         ;A08DEB;
    STA.W Temp_EnemySetLoopCounter                                       ;A08DEE;
    LDX.B DP_Temp16                                                      ;A08DF1;
    LDY.B DP_Temp14                                                      ;A08DF3;

  .loopTargetEnemyPalette:
    LDA.W $0000,Y                                                        ;A08DF5;
    STA.L Palettes&$FF0000,X                                             ;A08DF8;
    INX                                                                  ;A08DFC;
    INX                                                                  ;A08DFD;
    INY                                                                  ;A08DFE;
    INY                                                                  ;A08DFF;
    DEC.W Temp_EnemySetLoopCounter                                       ;A08E00;
    BNE .loopTargetEnemyPalette                                          ;A08E03;
    PLB                                                                  ;A08E05;
    LDX.B DP_Temp1C                                                      ;A08E06;
    LDA.L EnemySets_ID,X                                                 ;A08E08;
    TAX                                                                  ;A08E0C;
    LDA.W $0036,X                                                        ;A08E0D;
    STA.B DP_Temp16                                                      ;A08E10;
    LDA.W $0038,X                                                        ;A08E12;
    AND.W #$00FF                                                         ;A08E15;
    STA.B DP_Temp1A                                                      ;A08E18;
    LDX.W EnemyTileData_StackPointer                                     ;A08E1A;
    LDA.B DP_Temp12                                                      ;A08E1D;
    AND.W #$7FFF                                                         ;A08E1F;
    STA.W EnemyTileData_Size,X                                           ;A08E22;
    LDA.B DP_Temp16                                                      ;A08E25;
    STA.W EnemyTileData_Pointer,X                                        ;A08E27;
    LDA.B DP_Temp1E                                                      ;A08E2A;
    BIT.B DP_Temp12                                                      ;A08E2C;
    BPL .noMSB                                                           ;A08E2E;
    PHX                                                                  ;A08E30;
    LDX.B DP_Temp1C                                                      ;A08E31;
    LDA.L EnemySets_palette,X                                            ;A08E33;
    AND.W #$3000                                                         ;A08E37;
    LSR                                                                  ;A08E3A;
    LSR                                                                  ;A08E3B;
    LSR                                                                  ;A08E3C;
    PLX                                                                  ;A08E3D;

  .noMSB:
    STA.W EnemyTileData_Offset,X                                         ;A08E3E;
    SEP #$20                                                             ;A08E41;
    LDA.B DP_Temp1A                                                      ;A08E43;
    STA.W EnemyTileData_Pointer+2,X                                      ;A08E45;
    REP #$20                                                             ;A08E48;
    LDA.W EnemyTileData_StackPointer                                     ;A08E4A;
    CLC                                                                  ;A08E4D;
    ADC.W #$0007                                                         ;A08E4E;
    STA.W EnemyTileData_StackPointer                                     ;A08E51;
    PHX                                                                  ;A08E54;
    PHY                                                                  ;A08E55;
    LDA.L EnemyGFXData_StackPointer                                      ;A08E56;
    TAX                                                                  ;A08E5A;
    LDA.L EnemyGFXData_NextTilesIndex                                    ;A08E5B;
    STA.L EnemyGFXData_TilesIndex,X                                      ;A08E5F;
    PHX                                                                  ;A08E63;
    LDX.B DP_Temp1C                                                      ;A08E64;
    LDA.L EnemySets_ID,X                                                 ;A08E66;
    PLX                                                                  ;A08E6A;
    STA.L EnemyGFXData_IDs,X                                             ;A08E6B;
    PHX                                                                  ;A08E6F;
    LDX.B DP_Temp1C                                                      ;A08E70;
    LDA.L EnemySets_palette,X                                            ;A08E72;
    PLX                                                                  ;A08E76;
    STA.L EnemyGFXData_PaletteIndices,X                                  ;A08E77;
    LDA.L EnemyGFXData_StackPointer                                      ;A08E7B;
    CLC                                                                  ;A08E7F;
    ADC.W #$0002                                                         ;A08E80;
    STA.L EnemyGFXData_StackPointer                                      ;A08E83;
    PLY                                                                  ;A08E87;
    PLX                                                                  ;A08E88;
    LDA.B DP_Temp12                                                      ;A08E89;
    LSR                                                                  ;A08E8B;
    LSR                                                                  ;A08E8C;
    LSR                                                                  ;A08E8D;
    LSR                                                                  ;A08E8E;
    LSR                                                                  ;A08E8F;
    CLC                                                                  ;A08E90;
    ADC.L EnemyGFXData_NextTilesIndex                                    ;A08E91;
    STA.L EnemyGFXData_NextTilesIndex                                    ;A08E95;
    LDX.B DP_Temp1C                                                      ;A08E99;
    LDA.L EnemySets_ID,X                                                 ;A08E9B;
    TAX                                                                  ;A08E9F;
    LDA.W $0000,X                                                        ;A08EA0;
    CLC                                                                  ;A08EA3;
    ADC.B DP_Temp1E                                                      ;A08EA4;
    STA.B DP_Temp1E                                                      ;A08EA6;
    LDA.B DP_Temp1C                                                      ;A08EA8;
    CLC                                                                  ;A08EAA;
    ADC.W #$0004                                                         ;A08EAB;
    STA.B DP_Temp1C                                                      ;A08EAE;
    JMP.W .loop                                                          ;A08EB0;

  .return:
    PLY                                                                  ;A08EB3;
    PLX                                                                  ;A08EB4;
    RTS                                                                  ;A08EB5;


;;; $8EB6: Determine which enemies to process ;;;
Determine_Which_Enemies_to_Process:
    PHB                                                                  ;A08EB6;
    PEA.W Determine_Which_Enemies_to_Process>>8&$FF00                    ;A08EB7;
    PLB                                                                  ;A08EBA;
    PLB                                                                  ;A08EBB;
    REP #$30                                                             ;A08EBC;
    INC.W neverRead0E46                                                  ;A08EBE;
    STZ.W EnemyIndex                                                     ;A08EC1;
    STZ.W ActiveEnemyIndicesStackPointer                                 ;A08EC4;
    STZ.W InteractiveEnemyIndicesStackPointer                            ;A08EC7;
    LDA.W GlobalOffScreenEnemyProcessingFlag                             ;A08ECA;
    BEQ .resetIndex                                                      ;A08ECD;
    JMP.W .loopProcessOffscreen                                          ;A08ECF;

  .resetIndex:
    LDX.W #$0000                                                         ;A08ED2; >_<
    LDY.W #$0000                                                         ;A08ED5;

  .loop:
    LDX.W EnemyIndex                                                     ;A08ED8;
    LDA.W Enemy.ID,X                                                     ;A08EDB;
    BEQ .next                                                            ;A08EDE;
    CMP.W #EnemyHeaders_Respawn                                          ;A08EE0;
    BEQ .next                                                            ;A08EE3;
    LDA.W Enemy.properties,X                                             ;A08EE5;
    BIT.W #$0200                                                         ;A08EE8;
    BEQ ..notDeleted                                                     ;A08EEB;
    STZ.W Enemy.ID,X                                                     ;A08EED;
    JMP.W .next                                                          ;A08EF0;

  ..notDeleted:
    BIT.W #$0800                                                         ;A08EF3;
    BNE .activeEnemies                                                   ;A08EF6;
    LDA.W Enemy.AI,X                                                     ;A08EF8;
    BIT.W #$0004                                                         ;A08EFB;
    BNE .activeEnemies                                                   ;A08EFE;
    LDA.W Enemy.XPosition,X                                              ;A08F00;
    CLC                                                                  ;A08F03;
    ADC.W Enemy.XHitboxRadius,X                                          ;A08F04;
    CMP.W Layer1XPosition                                                ;A08F07;
    BMI .next                                                            ;A08F0A;
    LDA.W Layer1XPosition                                                ;A08F0C;
    CLC                                                                  ;A08F0F;
    ADC.W #$0100                                                         ;A08F10;
    CLC                                                                  ;A08F13;
    ADC.W Enemy.XHitboxRadius,X                                          ;A08F14;
    CMP.W Enemy.XPosition,X                                              ;A08F17;
    BMI .next                                                            ;A08F1A;
    LDA.W Enemy.YPosition,X                                              ;A08F1C;
    CLC                                                                  ;A08F1F;
    ADC.W #$0008                                                         ;A08F20;
    CMP.W Layer1YPosition                                                ;A08F23;
    BMI .next                                                            ;A08F26;
    LDA.W Layer1YPosition                                                ;A08F28;
    CLC                                                                  ;A08F2B;
    ADC.W #$00F8                                                         ;A08F2C;
    CMP.W Enemy.YPosition,X                                              ;A08F2F;
    BMI .next                                                            ;A08F32;

  .activeEnemies:
    TXA                                                                  ;A08F34;
    LDY.W ActiveEnemyIndicesStackPointer                                 ;A08F35;
    STA.W ActiveEnemyIndices,Y                                           ;A08F38;
    INY                                                                  ;A08F3B;
    INY                                                                  ;A08F3C;
    STY.W ActiveEnemyIndicesStackPointer                                 ;A08F3D;
    LDA.W Enemy.properties,X                                             ;A08F40;
    BIT.W #$0400                                                         ;A08F43;
    BNE .next                                                            ;A08F46;
    TXA                                                                  ;A08F48;
    LDY.W InteractiveEnemyIndicesStackPointer                            ;A08F49;
    STA.W InteractiveEnemyIndices,Y                                      ;A08F4C;
    INY                                                                  ;A08F4F;
    INY                                                                  ;A08F50;
    STY.W InteractiveEnemyIndicesStackPointer                            ;A08F51;

  .next:
    LDA.W EnemyIndex                                                     ;A08F54;
    CLC                                                                  ;A08F57;
    ADC.W #$0040                                                         ;A08F58;
    STA.W EnemyIndex                                                     ;A08F5B;
    CMP.W #$0800                                                         ;A08F5E;
    BPL .done                                                            ;A08F61;
    JMP.W .loop                                                          ;A08F63;

  .done:
    LDA.W #$FFFF                                                         ;A08F66;
    LDY.W ActiveEnemyIndicesStackPointer                                 ;A08F69;
    STA.W ActiveEnemyIndices,Y                                           ;A08F6C;
    LDY.W InteractiveEnemyIndicesStackPointer                            ;A08F6F;
    STA.W InteractiveEnemyIndices,Y                                      ;A08F72;
    PLB                                                                  ;A08F75;
    RTL                                                                  ;A08F76;

  .loopProcessOffscreen:
    LDX.W EnemyIndex                                                     ;A08F77;
    LDA.W Enemy.ID,X                                                     ;A08F7A;
    BEQ .nextProcessOffscreen                                            ;A08F7D;
    CMP.W #EnemyHeaders_Respawn                                          ;A08F7F;
    BEQ .nextProcessOffscreen                                            ;A08F82;
    LDA.W Enemy.properties,X                                             ;A08F84;
    BIT.W #$0200                                                         ;A08F87;
    BEQ ..notDeleted                                                     ;A08F8A;
    STZ.W Enemy.ID,X                                                     ;A08F8C;
    BRA .nextProcessOffscreen                                            ;A08F8F;

  ..notDeleted:
    TXA                                                                  ;A08F91;
    LDY.W ActiveEnemyIndicesStackPointer                                 ;A08F92;
    STA.W ActiveEnemyIndices,Y                                           ;A08F95;
    STA.W InteractiveEnemyIndices,Y                                      ;A08F98;
    INY                                                                  ;A08F9B;
    INY                                                                  ;A08F9C;
    STY.W ActiveEnemyIndicesStackPointer                                 ;A08F9D;
    LDA.W Enemy.properties,X                                             ;A08FA0;
    BIT.W #$0400                                                         ;A08FA3;
    BNE .nextProcessOffscreen                                            ;A08FA6;
    TXA                                                                  ;A08FA8;
    LDY.W InteractiveEnemyIndicesStackPointer                            ;A08FA9;
    STA.W InteractiveEnemyIndices,Y                                      ;A08FAC;
    INY                                                                  ;A08FAF;
    INY                                                                  ;A08FB0;
    STY.W InteractiveEnemyIndicesStackPointer                            ;A08FB1;

  .nextProcessOffscreen:
    LDA.W EnemyIndex                                                     ;A08FB4;
    CLC                                                                  ;A08FB7;
    ADC.W #$0040                                                         ;A08FB8;
    STA.W EnemyIndex                                                     ;A08FBB;
    CMP.W #$0800                                                         ;A08FBE;
    BMI .loopProcessOffscreen                                            ;A08FC1;
    LDA.W #$FFFF                                                         ;A08FC3;
    LDY.W ActiveEnemyIndicesStackPointer                                 ;A08FC6;
    STA.W ActiveEnemyIndices,Y                                           ;A08FC9;
    LDY.W InteractiveEnemyIndicesStackPointer                            ;A08FCC;
    STA.W InteractiveEnemyIndices,Y                                      ;A08FCF;
    PLB                                                                  ;A08FD2;
    RTL                                                                  ;A08FD3;


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
    PHB                                                                  ;A08FD4;
    PEA.W EnemyHeaders>>8&$FF00                                          ;A08FD5;
    PLB                                                                  ;A08FD8;
    PLB                                                                  ;A08FD9;
    REP #$30                                                             ;A08FDA;
    LDA.W FirstFreeEnemyIndex                                            ;A08FDC;
    BNE .processEnemies                                                  ;A08FDF;
    JMP.W .return                                                        ;A08FE1;

  .processEnemies:
    LDA.W EnemyIndexToShake                                              ;A08FE4;
    CMP.W #$FFFF                                                         ;A08FE7;
    BEQ .resetEnemyIndices                                               ;A08FEA;
    TAX                                                                  ;A08FEC;
    LDA.W #$0040                                                         ;A08FED;
    STA.W Enemy.shakeTimer,X                                             ;A08FF0;
    LDA.W #$FFFF                                                         ;A08FF3;
    STA.W EnemyIndexToShake                                              ;A08FF6;

  .resetEnemyIndices:
    STZ.W InteractiveEnemyIndicesIndex                                   ;A08FF9;
    STZ.W ActiveEnemyIndicesIndex                                        ;A08FFC;

  .loop:
    LDY.W ActiveEnemyIndicesIndex                                        ;A08FFF;
    LDA.W ActiveEnemyIndices,Y                                           ;A09002;
    CMP.W #$FFFF                                                         ;A09005;
    BNE ..notFFFF                                                        ;A09008;
    JMP.W .return                                                        ;A0900A;

  ..notFFFF:
    STA.W EnemyIndex                                                     ;A0900D;
    TAX                                                                  ;A09010;
    CLC                                                                  ;A09011;
    ADC.W #Enemy.ID                                                      ;A09012;
    STA.W EnemyDataPointer                                               ;A09015;
    LDA.W Enemy.bank,X                                                   ;A09018;
    STA.W EnemyAIPointer+2                                               ;A0901B;
    LDA.W Enemy.properties,X                                             ;A0901E;
    BIT.W #$0400                                                         ;A09021;
    BNE .interactEnd                                                     ;A09024;
    LDA.W Enemy.invincibilityTimer,X                                     ;A09026;
    BEQ .notInvincible                                                   ;A09029;
    DEC.W Enemy.invincibilityTimer,X                                     ;A0902B;
    JMP.W .interactEnd                                                   ;A0902E;

  .notInvincible:
    LDA.W DebugDisableSpriteInteractions                                 ;A09031;
    BNE .interactEnd                                                     ;A09034;
    LDA.W TimeIsFrozenFlag                                               ;A09036;
    ORA.W DebugTimeIsFrozenForEnemies                                    ;A09039;
    BNE .checkParalyzed                                                  ;A0903C;
    JSR.W EnemyCollisionHandling                                         ;A0903E;
    LDX.W EnemyIndex                                                     ;A09041;
    LDA.W Enemy.ID,X                                                     ;A09044;
    BNE .checkParalyzed                                                  ;A09047;
    JMP.W .drawEnemyEnd                                                  ;A09049;

  .checkParalyzed:
    LDX.W EnemyIndex                                                     ;A0904C;
    LDA.W Enemy.properties2,X                                            ;A0904F;
    BIT.W #$0001                                                         ;A09052;
    BNE .processAIEnd                                                    ;A09055;

  .interactEnd:
    STZ.W DisableDrawingOfEnemies                                        ;A09057;
    LDA.W TimeIsFrozenFlag                                               ;A0905A;
    ORA.W DebugTimeIsFrozenForEnemies                                    ;A0905D;
    BEQ .timeNotFrozen                                                   ;A09060;
    LDA.W Enemy.ID,X                                                     ;A09062;
    TAY                                                                  ;A09065;
    LDA.W $0020,Y                                                        ;A09066;
    BEQ .processAIEnd                                                    ;A09069;
    STA.W EnemyAIPointer                                                 ;A0906B;
    BRA .determineAIEnd                                                  ;A0906E;

  .timeNotFrozen:
    LDX.W #$0000                                                         ;A09070;
    LDY.W EnemyIndex                                                     ;A09073;
    LDA.W Enemy.AI,Y                                                     ;A09076;
    BEQ +                                                                ;A09079;

  .loopBitIndex:
    INX                                                                  ;A0907B;
    LSR                                                                  ;A0907C;
    BCS +                                                                ;A0907D;
    BRA .loopBitIndex                                                    ;A0907F;

+   TXA                                                                  ;A09081;
    ASL                                                                  ;A09082;
    CLC                                                                  ;A09083;
    ADC.W Enemy.ID,Y                                                     ;A09084;
    TAX                                                                  ;A09087;
    LDA.W $0018,X                                                        ;A09088;
    STA.W EnemyAIPointer                                                 ;A0908B;

  .determineAIEnd:
    PHB                                                                  ;A0908E;
    JSL.L .executeAI                                                     ;A0908F;
    PLB                                                                  ;A09093;
    BRA +                                                                ;A09094;

  .executeAI:
    LDX.W EnemyIndex                                                     ;A09096;
    LDA.W Enemy.bank,X                                                   ;A09099;
    STA.W EnemyAIPointer+2                                               ;A0909C;
    XBA                                                                  ;A0909F;
    PHA                                                                  ;A090A0;
    PLB                                                                  ;A090A1;
    PLB                                                                  ;A090A2;
    JML.W [EnemyAIPointer]                                               ;A090A3;

+   LDA.W TimeIsFrozenFlag                                               ;A090A6;
    ORA.W DebugTimeIsFrozenForEnemies                                    ;A090A9;
    BNE .processAIEnd                                                    ;A090AC;
    LDX.W EnemyIndex                                                     ;A090AE;
    INC.W Enemy.frameCounter,X                                           ;A090B1;
    LDA.W Enemy.properties,X                                             ;A090B4;
    BIT.W #$2000                                                         ;A090B7;
    BEQ .processAIEnd                                                    ;A090BA;
    LDA.W #$0002                                                         ;A090BC;
    STA.L EnemyProcessingStage                                           ;A090BF;
    JSR.W ProcessEnemyInstructions                                       ;A090C3;

  .processAIEnd:
    LDX.W EnemyIndex                                                     ;A090C6;
    LDA.W Enemy.properties2,X                                            ;A090C9;
    BIT.W #$0001                                                         ;A090CC;
    BEQ .paralysedEnd                                                    ;A090CF;
    LDA.W Enemy.flashTimer,X                                             ;A090D1;
    CMP.W #$0001                                                         ;A090D4;
    BEQ +                                                                ;A090D7;
    LDA.W Enemy.freezeTimer,X                                            ;A090D9;
    CMP.W #$0001                                                         ;A090DC;
    BNE .paralysedEnd                                                    ;A090DF;

+   LDA.W #$0000                                                         ;A090E1;
    STA.L EnemyTileData+2,X                                              ;A090E4;
    LDA.W #$0000                                                         ;A090E8;
    JSL.L EnemyDeath                                                     ;A090EB;

  .paralysedEnd:
    LDX.W EnemyIndex                                                     ;A090EF;
    LDA.W Enemy.properties2,X                                            ;A090F2;
    BIT.W #$0004                                                         ;A090F5;
    BNE +                                                                ;A090F8;
    JSL.L CheckIfEnemyIsOnScreen                                         ;A090FA;
    BEQ +                                                                ;A090FE;
    BRA .drawEnemyEnd                                                    ;A09100;

+   LDX.W EnemyIndex                                                     ;A09102;
    LDA.W Enemy.properties,X                                             ;A09105;
    BIT.W #$0300                                                         ;A09108;
    BNE .drawEnemyEnd                                                    ;A0910B;
    LDA.W DisableDrawingOfEnemies                                        ;A0910D;
    BIT.W #$0001                                                         ;A09110;
    BNE .drawEnemyEnd                                                    ;A09113;
    JSR.W AddEnemyToDrawingQueue                                         ;A09115;

  .drawEnemyEnd:
    LDX.W EnemyIndex                                                     ;A09118;
    LDA.W Enemy.flashTimer,X                                             ;A0911B;
    BEQ +                                                                ;A0911E;
    LDA.W TimeIsFrozenFlag                                               ;A09120;
    ORA.W DebugTimeIsFrozenForEnemies                                    ;A09123;
    BNE +                                                                ;A09126;
    DEC.W Enemy.flashTimer,X                                             ;A09128;
    LDA.W Enemy.flashTimer,X                                             ;A0912B;
    CMP.W #$0008                                                         ;A0912E;
    BPL +                                                                ;A09131;
    LDA.W Enemy.AI,X                                                     ;A09133;
    AND.W #$FFFD                                                         ;A09136;
    STA.W Enemy.AI,X                                                     ;A09139;

+   INC.W ActiveEnemyIndicesIndex                                        ;A0913C;
    INC.W ActiveEnemyIndicesIndex                                        ;A0913F;
    JMP.W .loop                                                          ;A09142;

  .return:
    JSL.L HandleSpriteObjects                                            ;A09145;
    INC.W NumberOfTimesMainEnemyRoutineExecuted                          ;A09149;
    LDA.W #$FFFF                                                         ;A0914C;
    STA.W EnemyIndexSamusCollidesLeft                                    ;A0914F;
    STA.W EnemyIndexSamusCollidesRight                                   ;A09152;
    STA.W EnemyIndexSamusCollidesUp                                      ;A09155;
    STA.W EnemyIndexSamusCollidesDown                                    ;A09158;
    STZ.W neverRead1834                                                  ;A0915B;
    STZ.W neverRead1836                                                  ;A0915E;
    STZ.W neverRead1838                                                  ;A09161;
    STZ.W neverRead183A                                                  ;A09164;
    PLB                                                                  ;A09167;
    RTL                                                                  ;A09168;


;;; $9169: Decrement Samus hurt timers and clear active enemy indices lists ;;;
DecrementSamusHurtTimers_ClearActiveEnemyIndicesLists:
    LDA.W SamusInvincibilityTimer                                        ;A09169;
    BEQ +                                                                ;A0916C;
    DEC.W SamusInvincibilityTimer                                        ;A0916E;

+   LDA.W SamusKnockbackTimer                                            ;A09171;
    BEQ +                                                                ;A09174;
    DEC.W SamusKnockbackTimer                                            ;A09176;

+   LDA.W ProjectileInvincibilityTImer                                   ;A09179;
    BEQ +                                                                ;A0917C;
    DEC.W ProjectileInvincibilityTImer                                   ;A0917E;

+   LDA.W #$FFFF                                                         ;A09181;
    STA.W InteractiveEnemyIndices                                        ;A09184;
    STA.W ActiveEnemyIndices                                             ;A09187;
    RTL                                                                  ;A0918A;


if !FEATURE_KEEP_UNREFERENCED
;;; $918B: Unused. Logging routine for a specific vertical enemy reaction ;;;
UNUSED_LoggingRoutineForASpecificVertcalEnemyReaction_A0918B:
    PHB                                                                  ;A0918B;
    LDA.W LogIndex                                                       ;A0918C;
    BNE .nonZeroIndex                                                    ;A0918F;
    LDA.W #EnemyLogging.executionCount                                   ;A09191;

  .nonZeroIndex:
    TAX                                                                  ;A09194;
    LDA.W NumberOfTimesMainEnemyRoutineExecuted                          ;A09195;
    STA.L EnemyLogging.executionCount&$FF00FF,X                          ;A09198;
    LDA.W Enemy[2].YPosition                                             ;A0919C;
    STA.L EnemyLogging.enemy2YPosition&$FF00FF,X                         ;A0919F;
    LDA.W Enemy[2].YSubPosition                                          ;A091A3;
    STA.L EnemyLogging.enemy2YSubPosition&$FF00FF,X                      ;A091A6;
    LDA.W ExtraSamusYDisplacement                                        ;A091AA;
    STA.L EnemyLogging.extraSamusYDisplacement&$FF00FF,X                 ;A091AD;
    LDA.W ExtraSamusYSubDisplacement                                     ;A091B1;
    STA.L EnemyLogging.decreasingMomentumFlag&$FF00FF,X                  ;A091B4;
    LDA.W SamusYPosition                                                 ;A091B8;
    STA.L EnemyLogging.SamusYPosition&$FF00FF,X                          ;A091BB;
    LDA.W SamusYSubPosition                                              ;A091BF;
    STA.L EnemyLogging.SamusYSubPosition&$FF00FF,X                       ;A091C2;
    LDA.W SamusYSpeed                                                    ;A091C6;
    STA.L EnemyLogging.SamusYSpeed&$FF00FF,X                             ;A091C9;
    LDA.W SamusYSubSpeed                                                 ;A091CD;
    STA.L EnemyLogging.SamusYSubSpeed&$FF00FF,X                          ;A091D0;
    LDA.W SamusYRadius                                                   ;A091D4;
    STA.L EnemyLogging.SamusYRadius&$FF00FF,X                            ;A091D7;
    LDA.W Pose                                                           ;A091DB;
    STA.L EnemyLogging.SamusPose&$FF00FF,X                               ;A091DE;
    LDA.W PoseXDirection                                                 ;A091E2;
    STA.L EnemyLogging.SamusMovementTypeXDirection&$FF00FF,X             ;A091E5;
    LDA.W #$0000                                                         ;A091E9;
    STA.L EnemyLogging.unknown18&$FF00FF,X                               ;A091EC;
    STA.L EnemyLogging.unknown1A&$FF00FF,X                               ;A091F0;
    STA.L EnemyLogging.unknown1C&$FF00FF,X                               ;A091F4;
    STA.L EnemyLogging.unknown1E&$FF00FF,X                               ;A091F8;
    TXA                                                                  ;A091FC;
    CLC                                                                  ;A091FD;
    ADC.W #$0020                                                         ;A091FE;
    CMP.W #$9800                                                         ;A09201;
    BMI .return                                                          ;A09204;
    LDA.W #$0000                                                         ;A09206;

  .return:
    STA.W LogIndex                                                       ;A09209;
    PLB                                                                  ;A0920C;
    RTS                                                                  ;A0920D;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $920E: Spawn enemy drops ;;;
Spawn_Enemy_Drops:
;; Parameters:
;;     A: Enemy header pointer (to check drop rates)
;;     $12: X position
;;     $14: Y position

; Used for boss deaths and enemy projectiles, but not normal enemy death
    PHP                                                                  ;A0920E;
    PHB                                                                  ;A0920F;
    PHX                                                                  ;A09210;
    PHY                                                                  ;A09211;
    STA.W Temp_EnemyHeaderPointer                                        ;A09212;
    PEA.W Spawn_Enemy_Drops>>8&$FF00                                     ;A09215;
    PLB                                                                  ;A09218;
    PLB                                                                  ;A09219;
    REP #$30                                                             ;A0921A;
    LDY.W #EnemyProjectile_EnemyDeathPickup                              ;A0921C;
    LDA.W Temp_EnemyProjectileInitParam                                  ;A0921F;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A09222;
    PLX                                                                  ;A09226;
    PLY                                                                  ;A09227;
    PLB                                                                  ;A09228;
    PLP                                                                  ;A09229;
    RTL                                                                  ;A0922A;


;;; $922B: Delete enemy and any connected enemies ;;;
DeleteEnemyAndAnyConnectedEnemies:
; This is called only by rinkas in Mother Brain's room when deleted due to Mother Brain first form defeat
; Rinka has 1 part >_>;
    PHB                                                                  ;A0922B;
    LDX.W EnemyIndex                                                     ;A0922C;
    PHX                                                                  ;A0922F;
    LDA.W Enemy.ID,X                                                     ;A09230;
    TAX                                                                  ;A09233;
    LDA.L EnemyHeaders_numberOfParts,X                                   ;A09234;
    BNE +                                                                ;A09238;
    INC                                                                  ;A0923A;

+   TAY                                                                  ;A0923B;
    PLX                                                                  ;A0923C;

  .loop:
    STZ.W Enemy.ID,X                                                     ;A0923D;
    TXA                                                                  ;A09240;
    CLC                                                                  ;A09241;
    ADC.W #$0040                                                         ;A09242;
    TAX                                                                  ;A09245;
    DEY                                                                  ;A09246;
    BNE .loop                                                            ;A09247;
    PLB                                                                  ;A09249;
    RTL                                                                  ;A0924A;


;;; $924B: Debug. Spawn enemy to enemy index [Y] ;;;
Debug_SpawnEnemy_ToEnemyIndex_inY:
;; Parameters:
;;     X: New enemy population data
;;     Y: New enemy index
    PHB                                                                  ;A0924B;
    STX.W Temp_PopulationDataPointer                                     ;A0924C;
    STY.W NewEnemyIndex                                                  ;A0924F;
    LDA.W EnemyIndex                                                     ;A09252;
    STA.W BackupEnemyIndex                                               ;A09255;
    LDA.W EnemyAIPointer                                                 ;A09258;
    STA.W BackupEnemyAIPointer                                           ;A0925B;
    LDA.W EnemyAIPointer+2                                               ;A0925E;
    STA.W BackupEnemyAIPointer+2                                         ;A09261;
    LDA.W $0000,X                                                        ;A09264;
    TAX                                                                  ;A09267;
    LDA.L EnemyHeaders_numberOfParts,X                                   ;A09268;
    AND.W #$00FF                                                         ;A0926C;
    STA.W Temp_NumberOfEnemyPartsToSpawn                                 ;A0926F;
    JMP.W SpawnEnemy_AlwaysSucceed                                       ;A09272;


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
    PHB                                                                  ;A09275;
    STX.W Temp_PopulationDataPointer                                     ;A09276;
    LDA.W EnemyIndex                                                     ;A09279;
    STA.W BackupEnemyIndex                                               ;A0927C;
    LDA.W EnemyAIPointer                                                 ;A0927F;
    STA.W BackupEnemyAIPointer                                           ;A09282;
    LDA.W EnemyAIPointer+2                                               ;A09285;
    STA.W BackupEnemyAIPointer+2                                         ;A09288;
    LDA.W $0000,X                                                        ;A0928B;
    TAY                                                                  ;A0928E;
    PHX                                                                  ;A0928F;
    TAX                                                                  ;A09290;
    LDA.L EnemyHeaders_numberOfParts,X                                   ;A09291;
    PLX                                                                  ;A09295;
    DEC                                                                  ;A09296;
    BPL +                                                                ;A09297;
    LDA.W #$0000                                                         ;A09299;

+   STA.W Temp_SpawnEnemyLoopCounter                                     ;A0929C;
    STA.W Temp_NumberOfEnemyPartsToSpawn                                 ;A0929F;
    STZ.W NewEnemyIndex                                                  ;A092A2;

  .loopFirstEnemy:
    LDX.W NewEnemyIndex                                                  ;A092A5;
    LDA.W Enemy.ID,X                                                     ;A092A8;
    BNE .next                                                            ;A092AB;

  .loopOtherEnemies:
    LDA.W Enemy.ID,X                                                     ;A092AD;
    BNE .next                                                            ;A092B0;
    LDA.W Temp_SpawnEnemyLoopCounter                                     ;A092B2;
    BEQ SpawnEnemy_AlwaysSucceed                                         ;A092B5;
    DEC.W Temp_SpawnEnemyLoopCounter                                     ;A092B7;
    TXA                                                                  ;A092BA;
    CLC                                                                  ;A092BB;
    ADC.W #$0040                                                         ;A092BC;
    TAX                                                                  ;A092BF;
    CPX.W #$0800                                                         ;A092C0;
    BMI .loopOtherEnemies                                                ;A092C3;
    BRA .notFound                                                        ;A092C5;

  .next:
    LDA.W NewEnemyIndex                                                  ;A092C7;
    CLC                                                                  ;A092CA;
    ADC.W #$0040                                                         ;A092CB;
    STA.W NewEnemyIndex                                                  ;A092CE;
    CMP.W #$0800                                                         ;A092D1;
    BMI .loopFirstEnemy                                                  ;A092D4;

  .notFound:
    LDA.W #$FFFF                                                         ;A092D6;
    PLB                                                                  ;A092D9;
    RTL                                                                  ;A092DA;


;;; $92DB: Spawn enemy ;;;
SpawnEnemy_AlwaysSucceed:
;; Parameters:
;;     Temp_PopulationDataPointer: New enemy population data
;;     $0E26: Number of enemy parts to spawn. 0 acts like 1 (thanks to the BEQ at $93E2)
;; Returns:
;;     A: 0. This routine doesn't check if it's overwriting an enemy or not and has no bounds checking, so it always succeeds
;;     X: New enemy index
    LDY.W NewEnemyIndex                                                  ;A092DB;
    LDX.W Temp_PopulationDataPointer                                     ;A092DE;
    LDA.W $0000,X                                                        ;A092E1;
    LDX.W #$0000                                                         ;A092E4;
    CMP.L EnemyGFXData_IDs                                               ;A092E7;
    BEQ .graphics                                                        ;A092EB;
    LDX.W #$0002                                                         ;A092ED;
    CMP.L EnemyGFXData_IDs+2                                             ;A092F0;
    BEQ .graphics                                                        ;A092F4;
    LDX.W #$0004                                                         ;A092F6;
    CMP.L EnemyGFXData_IDs+4                                             ;A092F9;
    BEQ .graphics                                                        ;A092FD;
    LDX.W #$0006                                                         ;A092FF;
    CMP.L EnemyGFXData_IDs+6                                             ;A09302;
    BEQ .graphics                                                        ;A09306;
    LDA.W #$0000                                                         ;A09308;
    STA.W Enemy.GFXOffset,Y                                              ;A0930B;
    STA.W Enemy.palette,Y                                                ;A0930E;
    BRA +                                                                ;A09311;

  .graphics:
    LDA.L EnemyGFXData_TilesIndex,X                                      ;A09313;
    STA.W Enemy.GFXOffset,Y                                              ;A09317;
    LDA.L EnemyGFXData_PaletteIndices,X                                  ;A0931A;
    XBA                                                                  ;A0931E;
    ASL                                                                  ;A0931F;
    STA.W Enemy.palette,Y                                                ;A09320;

+   LDX.W Temp_PopulationDataPointer                                     ;A09323;
    LDA.W $0000,X                                                        ;A09326;
    TAX                                                                  ;A09329;
    LDA.L EnemyHeaders_width,X                                           ;A0932A;
    STA.W Enemy.XHitboxRadius,Y                                          ;A0932E;
    LDA.L EnemyHeaders_height,X                                          ;A09331;
    STA.W Enemy.YHitboxRadius,Y                                          ;A09335;
    LDA.L EnemyHeaders_health,X                                          ;A09338;
    STA.W Enemy.health,Y                                                 ;A0933C;
    LDA.L EnemyHeaders_layer,X                                           ;A0933F;
    AND.W #$00FF                                                         ;A09343;
    STA.W Enemy.layer,Y                                                  ;A09346;
    LDA.L EnemyHeaders_bank,X                                            ;A09349;
    STA.W Enemy.bank,Y                                                   ;A0934D;
    LDX.W Temp_PopulationDataPointer                                     ;A09350;
    LDA.W $0000,X                                                        ;A09353;
    STA.W Enemy.ID,Y                                                     ;A09356;
    LDA.W $0002,X                                                        ;A09359;
    STA.W Enemy.XPosition,Y                                              ;A0935C;
    LDA.W $0004,X                                                        ;A0935F;
    STA.W Enemy.YPosition,Y                                              ;A09362;
    LDA.W $0006,X                                                        ;A09365;
    STA.W Enemy.instList,Y                                               ;A09368;
    LDA.W $0008,X                                                        ;A0936B;
    STA.W Enemy.properties,Y                                             ;A0936E;
    LDA.W $000A,X                                                        ;A09371;
    STA.W Enemy.properties2,Y                                            ;A09374;
    LDA.W $000C,X                                                        ;A09377;
    STA.W Enemy.init0,Y                                                  ;A0937A;
    LDA.W $000E,X                                                        ;A0937D;
    STA.W Enemy.init1,Y                                                  ;A09380;
    LDA.W #$0000                                                         ;A09383;
    STA.W Enemy.frameCounter,Y                                           ;A09386;
    STA.W Enemy.loopCounter,Y                                            ;A09389;
    STA.W Enemy.var0,Y                                                   ;A0938C;
    STA.W Enemy.var1,Y                                                   ;A0938F;
    STA.W Enemy.var2,Y                                                   ;A09392;
    STA.W Enemy.var3,Y                                                   ;A09395;
    STA.W Enemy.var4,Y                                                   ;A09398;
    STA.W Enemy.var5,Y                                                   ;A0939B;
    LDA.W #$0001                                                         ;A0939E;
    STA.W Enemy.instTimer,Y                                              ;A093A1;
    LDA.W #$0000                                                         ;A093A4;
    STA.W Enemy.frameCounter,Y                                           ;A093A7;
    JSL.L Record_EnemySpawnData                                          ;A093AA;
    PHX                                                                  ;A093AE;
    PHY                                                                  ;A093AF;
    STY.W EnemyIndex                                                     ;A093B0;
    LDX.W Enemy.ID,Y                                                     ;A093B3;
    LDA.L EnemyHeaders_initAI,X                                          ;A093B6;
    CMP.W #$8000                                                         ;A093BA;
    BMI .processInstructions                                             ;A093BD;
    STA.W EnemyAIPointer                                                 ;A093BF;
    LDA.L EnemyHeaders_bank,X                                            ;A093C2;
    STA.W EnemyAIPointer+2                                               ;A093C6;
    PHB                                                                  ;A093C9;
    JSL.L .executeAI                                                     ;A093CA;
    PLB                                                                  ;A093CE;

  .processInstructions:
    PLY                                                                  ;A093CF;
    PLX                                                                  ;A093D0;
    LDA.W Enemy.properties,Y                                             ;A093D1;
    BIT.W #$2000                                                         ;A093D4;
    BEQ .nextEnemy                                                       ;A093D7;
    LDA.W #Spritemap_Common_Nothing                                      ;A093D9;
    STA.W Enemy.spritemap,Y                                              ;A093DC;

  .nextEnemy:
    LDA.W Temp_NumberOfEnemyPartsToSpawn                                 ;A093DF;
    BEQ .setAI                                                           ;A093E2;
    DEC.W Temp_NumberOfEnemyPartsToSpawn                                 ;A093E4;
    BEQ .setAI                                                           ;A093E7;
    LDA.W NewEnemyIndex                                                  ;A093E9;
    CLC                                                                  ;A093EC;
    ADC.W #$0040                                                         ;A093ED;
    STA.W NewEnemyIndex                                                  ;A093F0;
    LDA.W Temp_PopulationDataPointer                                     ;A093F3;
    CLC                                                                  ;A093F6;
    ADC.W #$0010                                                         ;A093F7;
    STA.W Temp_PopulationDataPointer                                     ;A093FA;
    JMP.W SpawnEnemy_AlwaysSucceed                                       ;A093FD;

  .setAI:
    LDA.W BackupEnemyAIPointer                                           ;A09400;
    STA.W EnemyAIPointer                                                 ;A09403;
    LDA.W BackupEnemyAIPointer+2                                         ;A09406;
    STA.W EnemyAIPointer+2                                               ;A09409;
    LDA.W BackupEnemyIndex                                               ;A0940C;
    STA.W EnemyIndex                                                     ;A0940F;
    LDX.W NewEnemyIndex                                                  ;A09412;
    LDA.W #$0000                                                         ;A09415;
    PLB                                                                  ;A09418;
    RTL                                                                  ;A09419;

  .executeAI:
; Execute enemy AI pointer
    LDA.W Enemy.bank-1,Y                                                 ;A0941A;
    PHA                                                                  ;A0941D;
    PLB                                                                  ;A0941E;
    PLB                                                                  ;A0941F;
    JML.W [EnemyAIPointer]                                               ;A09420;


;;; $9423: Add enemy to drawing queue ;;;
AddEnemyToDrawingQueue:
    PHX                                                                  ;A09423;
    PHY                                                                  ;A09424;
    LDX.W EnemyIndex                                                     ;A09425;
    LDA.W Enemy.layer,X                                                  ;A09428;
    ASL                                                                  ;A0942B;
    STA.W Temp_DrawingQueueIndex0E34                                     ;A0942C;
    TAY                                                                  ;A0942F;
    LDA.W AddressesForEnemyDrawingQueues,Y                               ;A09430;
    CLC                                                                  ;A09433;
    ADC.W EnemyDrawingQueues_Sizes,Y                                     ;A09434;
    TAY                                                                  ;A09437;
    LDA.W EnemyIndex                                                     ;A09438;
    STA.W $0000,Y                                                        ;A0943B;
    LDX.W Temp_DrawingQueueIndex0E34                                     ;A0943E;
    INC.W EnemyDrawingQueues_Sizes,X                                     ;A09441;
    INC.W EnemyDrawingQueues_Sizes,X                                     ;A09444;
    PLY                                                                  ;A09447;
    PLX                                                                  ;A09448;
    RTS                                                                  ;A09449;


;;; $944A: Write enemy OAM (if not on frozen or invincible frame) ;;;
WriteEnemyOAM_IfNotFrozenOrInvincibleFrame:
    PHB                                                                  ;A0944A;
    LDX.W EnemyIndex                                                     ;A0944B;
    LDA.W Enemy.bank-1,X                                                 ;A0944E;
    PHA                                                                  ;A09451;
    PLB                                                                  ;A09452;
    PLB                                                                  ;A09453;
    REP #$30                                                             ;A09454;
    LDX.W EnemyIndex                                                     ;A09456;
    LDA.W Enemy.XPosition,X                                              ;A09459;
    SEC                                                                  ;A0945C;
    SBC.W Layer1XPosition                                                ;A0945D;
    CLC                                                                  ;A09460;
    ADC.L EnemySpawnData.graphicalXOffset,X                              ;A09461;
    STA.W Temp_XPositionOnScreen                                         ;A09465;
    STA.B DP_Temp14                                                      ;A09468;
    LDA.W Enemy.YPosition,X                                              ;A0946A;
    SEC                                                                  ;A0946D;
    SBC.W Layer1YPosition                                                ;A0946E;
    CLC                                                                  ;A09471;
    ADC.L EnemySpawnData.graphicalYOffset,X                              ;A09472;
    STA.W Temp_YPositionOnScreen                                         ;A09476;
    STA.B DP_Temp12                                                      ;A09479;
    LDA.W Enemy.shakeTimer,X                                             ;A0947B;
    BEQ .noShake                                                         ;A0947E;
    LDA.W Enemy.frameCounter,X                                           ;A09480;
    AND.W #$0002                                                         ;A09483;
    BEQ .zeroCounter                                                     ;A09486;
    DEC.B DP_Temp14                                                      ;A09488;
    DEC.W Temp_XPositionOnScreen                                         ;A0948A;
    BRA .decrementShakeTimer                                             ;A0948D;

  .zeroCounter:
    INC.B DP_Temp14                                                      ;A0948F;
    INC.W Temp_XPositionOnScreen                                         ;A09491;

  .decrementShakeTimer:
    DEC.W Enemy.shakeTimer,X                                             ;A09494;

  .noShake:
    LDA.W Enemy.flashTimer,X                                             ;A09497;
    BEQ .timerExpired                                                    ;A0949A;
    LDA.W NumberOfTimesMainEnemyRoutineExecuted                          ;A0949C;
    AND.W #$0002                                                         ;A0949F;
    BEQ .timerExpired                                                    ;A094A2;
    LDA.W #$0000                                                         ;A094A4;
    BRA .determinedPalette                                               ;A094A7;

  .timerExpired:
    LDA.W Enemy.freezeTimer,X                                            ;A094A9;
    BEQ .useEnemyPalette                                                 ;A094AC;
    CMP.W #$005A                                                         ;A094AE;
    BCS .palette6                                                        ;A094B1;
    BIT.W #$0002                                                         ;A094B3;
    BEQ .useEnemyPalette                                                 ;A094B6;

  .palette6:
    LDA.W #$0C00                                                         ;A094B8;
    BRA .determinedPalette                                               ;A094BB;

  .useEnemyPalette:
    LDA.W Enemy.palette,X                                                ;A094BD;

  .determinedPalette:
    STA.B DP_Temp03                                                      ;A094C0;
    LDA.W Enemy.GFXOffset,X                                              ;A094C2;
    STA.B DP_Temp00                                                      ;A094C5;
    LDA.W Enemy.properties2,X                                            ;A094C7;
    BIT.W #$0004                                                         ;A094CA;
    BNE .extendedSpritemap                                               ;A094CD;
    LDA.W Enemy.ID,X                                                     ;A094CF;
    STA.L neverReadF37E                                                  ;A094D2;
    LDA.W Enemy.instList,X                                               ;A094D6;
    STA.L neverReadF37A                                                  ;A094D9;
    LDA.W EnemyIndex                                                     ;A094DD;
    STA.L neverReadF37C                                                  ;A094E0;
    LDA.W #$0001                                                         ;A094E4;
    STA.L EnemyProcessingStage                                           ;A094E7;
    LDY.W Enemy.spritemap,X                                              ;A094EB;
    JSL.L AddSpritemapToOAM_WithBaseTileNumber_8AB8                      ;A094EE;
    PLB                                                                  ;A094F2;
    RTS                                                                  ;A094F3;

  .extendedSpritemap:
    LDA.W Enemy.spritemap,X                                              ;A094F4;
    CMP.W #$8000                                                         ;A094F7;

  .crash:
    BMI .crash                                                           ;A094FA;
    TAY                                                                  ;A094FC;
    LDA.W $0000,Y                                                        ;A094FD;
    AND.W #$00FF                                                         ;A09500;
    STA.W RemainingEnemySpritemapEntries                                 ;A09503;
    INY                                                                  ;A09506;
    INY                                                                  ;A09507;

  .loop:
    LDA.W $0004,Y                                                        ;A09508;
    STA.B DP_Temp16                                                      ;A0950B;
    TAX                                                                  ;A0950D;
    LDA.W $0000,X                                                        ;A0950E;
    CMP.W #$FFFE                                                         ;A09511;
    BNE .notExtendedSpritemap                                            ;A09514;
    LDA.W $0000,Y                                                        ;A09516;
    CLC                                                                  ;A09519;
    ADC.W Temp_XPositionOnScreen                                         ;A0951A;
    STA.B DP_Temp14                                                      ;A0951D;
    LDA.W $0002,Y                                                        ;A0951F;
    CLC                                                                  ;A09522;
    ADC.W Temp_YPositionOnScreen                                         ;A09523;
    STA.B DP_Temp12                                                      ;A09526;
    LDX.W EnemyIndex                                                     ;A09528;
    LDA.W Enemy.properties2,X                                            ;A0952B;
    AND.W #$8000                                                         ;A0952E;
    BEQ .next                                                            ;A09531;
    JSR.W ProcessExtendedTilemap                                         ;A09533;
    BRA .next                                                            ;A09536;

  .notExtendedSpritemap:
    LDA.W $0000,Y                                                        ;A09538;
    CLC                                                                  ;A0953B;
    ADC.W Temp_XPositionOnScreen                                         ;A0953C;
    STA.B DP_Temp14                                                      ;A0953F;
    ADC.W #$0080                                                         ;A09541;
    BIT.W #$FE00                                                         ;A09544;
    BNE .next                                                            ;A09547;
    LDA.W $0002,Y                                                        ;A09549;
    CLC                                                                  ;A0954C;
    ADC.W Temp_YPositionOnScreen                                         ;A0954D;
    STA.B DP_Temp12                                                      ;A09550;
    ADC.W #$0080                                                         ;A09552;
    BIT.W #$FE00                                                         ;A09555;
    BNE .next                                                            ;A09558;
    PHY                                                                  ;A0955A;
    LDA.B DP_Temp12                                                      ;A0955B;
    BIT.W #$FF00                                                         ;A0955D;
    BNE .offScreen                                                       ;A09560;
    LDY.B DP_Temp16                                                      ;A09562;
    JSL.L AddSpritemapToOAM_WithBaseTileNumber_8B22                      ;A09564;
    BRA .pullY                                                           ;A09568;

  .offScreen:
    LDY.B DP_Temp16                                                      ;A0956A;
    JSL.L AddSpritemapToOAM_WithBaseTileNumber_Offscreen_8B96            ;A0956C;

  .pullY:
    PLY                                                                  ;A09570;

  .next:
    TYA                                                                  ;A09571;
    CLC                                                                  ;A09572;
    ADC.W #$0008                                                         ;A09573;
    TAY                                                                  ;A09576;
    DEC.W RemainingEnemySpritemapEntries                                 ;A09577;
    BNE .loop                                                            ;A0957A;
    PLB                                                                  ;A0957C;
    RTS                                                                  ;A0957D;


;;; $957E: Normal enemy frozen AI ;;;
NormalEnemyFrozenAI:
    PHX                                                                  ;A0957E;
    PHY                                                                  ;A0957F;
    LDX.W EnemyIndex                                                     ;A09580;
    STZ.W Enemy.flashTimer,X                                             ;A09583;
    LDA.W Enemy.freezeTimer,X                                            ;A09586;
    BEQ .unsetFrozenAI                                                   ;A09589;
    DEC.W Enemy.freezeTimer,X                                            ;A0958B;
    LDA.W EquippedBeams                                                  ;A0958E;
    AND.W #$0002                                                         ;A09591;
    BEQ .unsetFrozenAI                                                   ;A09594;
    LDA.W #$0001                                                         ;A09596;
    BRA .return                                                          ;A09599;

  .unsetFrozenAI:
    LDA.W Enemy.AI,X                                                     ;A0959B;
    AND.W #$FFFB                                                         ;A0959E;
    STA.W Enemy.AI,X                                                     ;A095A1;
    STA.W Enemy.freezeTimer,X                                            ;A095A4;
    LDA.W #$0000                                                         ;A095A7;

  .return:
    PLY                                                                  ;A095AA;
    PLX                                                                  ;A095AB;
    RTL                                                                  ;A095AC;


if !FEATURE_KEEP_UNREFERENCED
;;; $95AD: Unused. Execute enemy AI ;;;
UNUSED_ExecuteEnemyAI_A095AD:
    PHB                                                                  ;A095AD;
    PHP                                                                  ;A095AE;
    PEA.W UNUSED_ExecuteEnemyAI_A095AD>>8&$FF00                          ;A095AF;
    PLB                                                                  ;A095B2;
    PLB                                                                  ;A095B3;
    REP #$30                                                             ;A095B4;
    LDX.W #$0000                                                         ;A095B6;
    LDY.W EnemyIndex                                                     ;A095B9;
    LDA.W Enemy.AI,Y                                                     ;A095BC;
    BEQ +                                                                ;A095BF;

  .loop:
    INX                                                                  ;A095C1;
    LSR                                                                  ;A095C2;
    BCS +                                                                ;A095C3;
    BRA .loop                                                            ;A095C5;

+   TXA                                                                  ;A095C7;
    ASL                                                                  ;A095C8;
    CLC                                                                  ;A095C9;
    ADC.W Enemy.ID,Y                                                     ;A095CA;
    TAX                                                                  ;A095CD;
    LDA.W $0018,X                                                        ;A095CE;
    STA.W EnemyAIPointer                                                 ;A095D1;
    LDA.W Enemy.bank,Y                                                   ;A095D4;
    STA.W EnemyAIPointer+2                                               ;A095D7;
    JSL.L .executeAI                                                     ;A095DA;
    PLP                                                                  ;A095DE;
    PLB                                                                  ;A095DF;
    RTL                                                                  ;A095E0;

  .executeAI:
; Execute enemy AI pointer
    LDX.W EnemyIndex                                                    ;A095E1;
    LDA.W Enemy.bank,X                                                  ;A095E4;
    STA.W EnemyAIPointer+2                                              ;A095E7;
    XBA                                                                 ;A095EA;
    PHA                                                                 ;A095EB;
    PLB                                                                 ;A095EC;
    PLB                                                                 ;A095ED;
    JML.W [EnemyAIPointer]                                              ;A095EE;


;;; $95F1: Unused. Respawn enemy ;;;
UNUSED_RespawnEnemy_A095F1:
; See $86:F264 for the used routine
    PHB                                                                  ;A095F1;
    PEA.W UNUSED_RespawnEnemy_A095F1>>8&$FF00                            ;A095F2;
    PLB                                                                  ;A095F5;
    PLB                                                                  ;A095F6;
    REP #$30                                                             ;A095F7;
    LDA.W EnemyIndex                                                     ;A095F9;
    LSR                                                                  ;A095FC;
    LSR                                                                  ;A095FD;
    STA.B DP_Temp12                                                      ;A095FE;
    LDA.W EnemyPopulationPointer                                         ;A09600;
    CLC                                                                  ;A09603;
    ADC.B DP_Temp12                                                      ;A09604;
    TAX                                                                  ;A09606;
    LDY.W EnemyIndex                                                     ;A09607;
    LDA.L EnemyPopulations_ID,X                                          ;A0960A;
    STA.W Enemy.ID,Y                                                     ;A0960E;
    LDA.L EnemyPopulations_XPosition,X                                   ;A09611;
    STA.W Enemy.XPosition,Y                                              ;A09615;
    LDA.L EnemyPopulations_YPosition,X                                   ;A09618;
    STA.W Enemy.YPosition,Y                                              ;A0961C;
    LDA.L EnemyPopulations_init,X                                        ;A0961F;
    STA.W Enemy.instList,Y                                               ;A09623;
    LDA.L EnemyPopulations_properties,X                                  ;A09626;
    STA.W Enemy.properties,Y                                             ;A0962A;
    LDA.L EnemyPopulations_extraProperties,X                             ;A0962D;
    STA.W Enemy.properties2,Y                                            ;A09631;
    LDA.L EnemyPopulations_param1,X                                      ;A09634;
    STA.W Enemy.init0,Y                                                  ;A09638;
    LDA.L EnemyPopulations_param2,X                                      ;A0963B;
    STA.W Enemy.init1,Y                                                  ;A0963F;
    PHX                                                                  ;A09642;
    TYX                                                                  ;A09643;
    LDA.L EnemySpawnData.VRAMTilesIndex,X                                ;A09644;
    AND.W #$0E00                                                         ;A09648;
    STA.W Enemy.palette,X                                                ;A0964B;
    LDA.L EnemySpawnData.VRAMTilesIndex,X                                ;A0964E;
    AND.W #$01FF                                                         ;A09652;
    STA.W Enemy.GFXOffset,X                                              ;A09655;
    PLX                                                                  ;A09658;
    LDA.W #$0000                                                         ;A09659;
    STA.W Enemy.freezeTimer,Y                                            ;A0965C;
    STA.W Enemy.flashTimer,Y                                             ;A0965F;
    STA.W Enemy.invincibilityTimer,Y                                     ;A09662;
    STA.W Enemy.loopCounter,Y                                            ;A09665;
    STA.W Enemy.frameCounter,Y                                           ;A09668;
    STA.W Enemy.var0,Y                                                   ;A0966B;
    STA.W Enemy.var1,Y                                                   ;A0966E;
    STA.W Enemy.var2,Y                                                   ;A09671;
    STA.W Enemy.var3,Y                                                   ;A09674;
    STA.W Enemy.var4,Y                                                   ;A09677;
    STA.W Enemy.var5,Y                                                   ;A0967A;
    LDA.W #$0001                                                         ;A0967D;
    STA.W Enemy.instTimer,Y                                              ;A09680;
    LDX.W EnemyIndex                                                     ;A09683;
    LDA.W Enemy.ID,X                                                     ;A09686;
    TAX                                                                  ;A09689;
    LDA.W $0012,X                                                        ;A0968A;
    STA.W EnemyAIPointer                                                 ;A0968D;
    LDA.W $0008,X                                                        ;A09690;
    STA.W Enemy.XHitboxRadius,Y                                          ;A09693;
    LDA.W $000A,X                                                        ;A09696;
    STA.W Enemy.YHitboxRadius,Y                                          ;A09699;
    LDA.W $0004,X                                                        ;A0969C;
    STA.W Enemy.health,Y                                                 ;A0969F;
    LDA.W $0039,X                                                        ;A096A2;
    AND.W #$00FF                                                         ;A096A5;
    STA.W Enemy.layer,Y                                                  ;A096A8;
    LDA.W $000C,X                                                        ;A096AB;
    STA.W Enemy.bank,Y                                                   ;A096AE;
    STA.W EnemyAIPointer+2                                               ;A096B1;
    JSL.L .executeAI                                                     ;A096B4;
    PLB                                                                  ;A096B8;
    RTL                                                                  ;A096B9;

  .executeAI:
    LDX.W EnemyIndex                                                     ;A096BA;
    LDA.W Enemy.bank,X                                                   ;A096BD;
    STA.W EnemyAIPointer+2                                               ;A096C0;
    XBA                                                                  ;A096C3;
    PHA                                                                  ;A096C4;
    PLB                                                                  ;A096C5;
    PLB                                                                  ;A096C6;
    JML.W [EnemyAIPointer]                                               ;A096C7;
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
    PHY                                                                  ;A096CA;
    LDY.B DP_Temp16                                                      ;A096CB;
    INY                                                                  ;A096CD;
    INY                                                                  ;A096CE;

  .loop:
    LDA.W $0000,Y                                                        ;A096CF;
    CMP.W #$FFFF                                                         ;A096D2;
    BEQ .return                                                          ;A096D5;
    TAX                                                                  ;A096D7;
    LDA.W $0002,Y                                                        ;A096D8;
    STA.W NumberOfExtendedTilemapTiles                                   ;A096DB;
    INY                                                                  ;A096DE;
    INY                                                                  ;A096DF;
    INY                                                                  ;A096E0;
    INY                                                                  ;A096E1;
    LSR                                                                  ;A096E2;
    BCC .unrolled                                                        ;A096E3;

  .innerLoop:
    LDA.W $0000,Y                                                        ;A096E5;
    STA.L EnemyBG2Tilemap&$FF0000,X                                      ;A096E8;
    INX                                                                  ;A096EC;
    INX                                                                  ;A096ED;
    INY                                                                  ;A096EE;
    INY                                                                  ;A096EF;
    DEC.W NumberOfExtendedTilemapTiles                                   ;A096F0;
    BNE .innerLoop                                                       ;A096F3;
    JMP.W .loop                                                          ;A096F5;

  .unrolled:
    LDA.W $0000,Y                                                        ;A096F8;
    STA.L EnemyBG2Tilemap&$FF0000,X                                      ;A096FB;
    LDA.W $0002,Y                                                        ;A096FF;
    STA.L (EnemyBG2Tilemap&$FF0000)+2,X                                  ;A09702;
    INX                                                                  ;A09706;
    INX                                                                  ;A09707;
    INX                                                                  ;A09708;
    INX                                                                  ;A09709;
    INY                                                                  ;A0970A;
    INY                                                                  ;A0970B;
    INY                                                                  ;A0970C;
    INY                                                                  ;A0970D;
    CPX.W #$2800                                                         ;A0970E;

  .crash:
    BPL .crash                                                           ;A09711;
    DEC.W NumberOfExtendedTilemapTiles                                   ;A09713;
    DEC.W NumberOfExtendedTilemapTiles                                   ;A09716;
    LDA.W NumberOfExtendedTilemapTiles                                   ;A09719;
    BNE .unrolled                                                        ;A0971C;
    JMP.W .loop                                                          ;A0971E;

  .return:
    INC.W RequestEnemyBG2TilemapTransferFlag                             ;A09721;
    PLY                                                                  ;A09724;
    RTS                                                                  ;A09725;


;;; $9726: Handle queuing enemy BG2 tilemap VRAM transfer ;;;
Handle_Queuing_Enemy_BG2_Tilemap_VRAM_Transfer:
; Used by Phantoon, Draygon, Crocomire and Mother Brain
    LDA.W RequestEnemyBG2TilemapTransferFlag                             ;A09726;
    BEQ .clearTransferFlag                                               ;A09729;
    LDA.W TimeIsFrozenFlag                                               ;A0972B;
    ORA.W DebugTimeIsFrozenForEnemies                                    ;A0972E;
    BNE .clearTransferFlag                                               ;A09731;
    LDX.W VRAMWriteStack                                                 ;A09733;
    LDA.W EnemyBG2TilemapSize                                            ;A09736;
    STA.B VRAMWrite.size,X                                               ;A09739;
    LDA.W #EnemyBG2Tilemap                                               ;A0973B;
    STA.B VRAMWrite.src,X                                                ;A0973E;
    LDA.W #EnemyBG2Tilemap>>16                                           ;A09740;
    STA.B VRAMWrite.src+2,X                                              ;A09743;
    LDA.W #$4800                                                         ;A09745;
    STA.B VRAMWrite.dest,X                                               ;A09748;
    LDA.W VRAMWriteStack                                                 ;A0974A;
    CLC                                                                  ;A0974D;
    ADC.W #$0007                                                         ;A0974E;
    STA.W VRAMWriteStack                                                 ;A09751;

  .clearTransferFlag:
    STZ.W RequestEnemyBG2TilemapTransferFlag                             ;A09754;
    RTL                                                                  ;A09757;


;;; $9758: Enemy collision handling ;;;
EnemyCollisionHandling:
    PHP                                                                  ;A09758;
    PHB                                                                  ;A09759;
    PEA.W EnemyCollisionHandling>>8&$FF00                                ;A0975A;
    PLB                                                                  ;A0975D;
    PLB                                                                  ;A0975E;
    REP #$30                                                             ;A0975F;
    LDX.W EnemyIndex                                                     ;A09761;
    LDA.W Enemy.properties2,X                                            ;A09764;
    BIT.W #$0004                                                         ;A09767;
    BEQ .notExtendedSpritemap                                            ;A0976A;
    JSR.W Enemy_vs_Projectile_CollisionHandling_ExtendedSpritemap        ;A0976C;
    JSR.W Enemy_vs_Bomb_CollisionHandling_ExtendedSpritemap              ;A0976F;
    JSR.W EnemySamusCollisionHandling_ExtendedSpritemap                  ;A09772;
    PLB                                                                  ;A09775;
    PLP                                                                  ;A09776;
    RTS                                                                  ;A09777;

  .notExtendedSpritemap:
    JSR.W Enemy_vs_ProjectileCollisionHandling                           ;A09778;
    JSR.W Enemy_vs_Bomb_CollisionHandling                                ;A0977B;
    JSR.W Enemy_vs_Samus_CollisionHandling                               ;A0977E;
    PLB                                                                  ;A09781;
    PLP                                                                  ;A09782;
    RTS                                                                  ;A09783;


;;; $9784: RTL ;;;
RTL_A09784:
    RTL                                                                  ;A09784;


;;; $9785: Samus / projectile interaction handling ;;;
Samus_Projectiles_Interaction_Handling:
; Handles bomb jumps and damage due to reflected projectiles
    PHB                                                                  ;A09785;
    PEA.W Samus_Projectiles_Interaction_Handling>>8&$FF00                ;A09786;
    PLB                                                                  ;A09789;
    PLB                                                                  ;A0978A;
    REP #$30                                                             ;A0978B;
    LDA.W #$000A                                                         ;A0978D;
    STA.L EnemyProcessingStage                                           ;A09790;
    LDA.W DisableSamusVsProjectileInteraction                            ;A09794;
    BNE .returnUpper                                                     ;A09797;
    LDA.W #$0005                                                         ;A09799;
    STA.W EnemySpritemapEntryYPositionDuringCollision                    ;A0979C;
    LDA.W SamusProjectile_BombCounter                                    ;A0979F;
    BNE .bombIsActive                                                    ;A097A2;
    LDA.W SamusProjectile_ProjectileCounter                              ;A097A4;
    BNE .projectileIsActive                                              ;A097A7;

  .returnUpper:
    PLB                                                                  ;A097A9;
    RTL                                                                  ;A097AA;

  .bombIsActive:
    LDA.W #$000A                                                         ;A097AB;
    STA.W EnemySpritemapEntryYPositionDuringCollision                    ;A097AE;

  .projectileIsActive:
    LDA.W ProjectileInvincibilityTImer                                   ;A097B1;
    BEQ .checkContactDamage                                              ;A097B4;
    PLB                                                                  ;A097B6;
    RTL                                                                  ;A097B7;

  .checkContactDamage:
    LDA.W ContactDamageIndex                                             ;A097B8;
    BEQ .resetProjectileIndex                                            ;A097BB;
    PLB                                                                  ;A097BD;
    RTL                                                                  ;A097BE;

  .resetProjectileIndex:
    STZ.W CollisionIndex                                                 ;A097BF;

  .loop:
    LDA.W CollisionIndex                                                 ;A097C2;
    ASL                                                                  ;A097C5;
    TAY                                                                  ;A097C6;
    LDA.W SamusProjectile_Damages,Y                                      ;A097C7;
    BNE .hasDamage                                                       ;A097CA;
    JMP.W .next                                                          ;A097CC;

  .hasDamage:
    LDA.W SamusProjectile_Types,Y                                        ;A097CF;
    BIT.W #$8000                                                         ;A097D2;
    BNE .gotoNext                                                        ;A097D5;
    AND.W #$0F00                                                         ;A097D7;
    CMP.W #$0700                                                         ;A097DA;
    BMI .interactive                                                     ;A097DD;

  .gotoNext:
    JMP.W .next                                                          ;A097DF;

  .interactive:
    LDA.W SamusProjectile_Directions,Y                                   ;A097E2;
    AND.W #$0010                                                         ;A097E5;
    BNE .gotoNext                                                        ;A097E8;
    LDA.W SamusProjectile_XPositions,Y                                   ;A097EA;
    SEC                                                                  ;A097ED;
    SBC.W SamusXPosition                                                 ;A097EE;
    BPL +                                                                ;A097F1;
    EOR.W #$FFFF                                                         ;A097F3;
    INC                                                                  ;A097F6;

+   SEC                                                                  ;A097F7;
    SBC.W SamusProjectile_XRadii,Y                                       ;A097F8;
    BCC +                                                                ;A097FB;
    CMP.W SamusXRadius                                                   ;A097FD;
    BCS .gotoNext                                                        ;A09800;

+   LDA.W SamusProjectile_YPositions,Y                                   ;A09802;
    SEC                                                                  ;A09805;
    SBC.W SamusYPosition                                                 ;A09806;
    BPL +                                                                ;A09809;
    EOR.W #$FFFF                                                         ;A0980B;
    INC                                                                  ;A0980E;

+   SEC                                                                  ;A0980F;
    SBC.W SamusProjectile_YRadii,Y                                       ;A09810;
    BCC .checkBombType                                                   ;A09813;
    CMP.W SamusYRadius                                                   ;A09815;
    BCC .checkBombType                                                   ;A09818;
    BRA .next                                                            ;A0981A;

  .checkBombType:
    LDA.W SamusProjectile_Types,Y                                        ;A0981C;
    AND.W #$FF00                                                         ;A0981F;
    CMP.W #$0300                                                         ;A09822;
    BEQ .checkBombTimer                                                  ;A09825;
    CMP.W #$0500                                                         ;A09827;
    BNE .notABomb                                                        ;A0982A;

  .checkBombTimer:
    LDA.W SamusProjectile_Variables,Y                                    ;A0982C;
    CMP.W #$0008                                                         ;A0982F;
    BNE .next                                                            ;A09832;
    LDA.W SamusXPosition                                                 ;A09834;
    CMP.W SamusProjectile_XPositions,Y                                   ;A09837;
    BEQ .straight                                                        ;A0983A;
    BMI .left                                                            ;A0983C;
    LDA.W #$0003                                                         ;A0983E;
    BRA .storeBombJumpDirection                                          ;A09841;

  .left:
    LDA.W #$0001                                                         ;A09843;
    BRA .storeBombJumpDirection                                          ;A09846;

  .straight:
    LDA.W #$0002                                                         ;A09848;

  .storeBombJumpDirection:
    STA.W BombJumpDirection                                              ;A0984B;
    BRA .next                                                            ;A0984E;

  .notABomb:
    LDA.W SamusProjectile_Directions,Y                                   ;A09850;
    ORA.W #$0010                                                         ;A09853;
    STA.W SamusProjectile_Directions,Y                                   ;A09856;
    LDA.W SamusProjectile_Damages,Y                                      ;A09859;
    JSL.L Suit_Damage_Division                                           ;A0985C;
    JSL.L Deal_A_Damage_to_Samus                                         ;A09860;
    LDA.W #$0060                                                         ;A09864;
    STA.W SamusInvincibilityTimer                                        ;A09867;
    LDA.W #$0005                                                         ;A0986A;
    STA.W SamusKnockbackTimer                                            ;A0986D;
    LDY.W #$0000                                                         ;A09870;
    LDA.W SamusXPosition                                                 ;A09873;
    SEC                                                                  ;A09876;
    SBC.W EnemyProjectile_XPositions,X                                   ;A09877;
    BMI .storeKnockbackDirection                                         ;A0987A;
    LDY.W #$0001                                                         ;A0987C;

  .storeKnockbackDirection:
    STY.W KnockbackXDirection                                            ;A0987F;
    BRA .returnLower                                                     ;A09882;

  .next:
    INC.W CollisionIndex                                                 ;A09884;
    LDA.W CollisionIndex                                                 ;A09887;
    CMP.W EnemySpritemapEntryYPositionDuringCollision                    ;A0988A;
    BEQ .returnLower                                                     ;A0988D;
    JMP.W .loop                                                          ;A0988F;

  .returnLower:
    PLB                                                                  ;A09892;
    RTL                                                                  ;A09893;


;;; $9894: Enemy projectile / Samus collision handling ;;;
EnemyProjectile_Samus_Collision_Handling:
    PHP                                                                  ;A09894;
    PHB                                                                  ;A09895;
    PEA.W EnemyProjectile_Samus_Collision_Handling>>8&$FF00              ;A09896;
    PLB                                                                  ;A09899;
    PLB                                                                  ;A0989A;
    REP #$30                                                             ;A0989B;
    LDA.W #$000B                                                         ;A0989D;
    STA.L EnemyProcessingStage                                           ;A098A0;
    LDA.W SamusInvincibilityTimer                                        ;A098A4;
    BEQ .notInvincible                                                   ;A098A7;
    PLB                                                                  ;A098A9;
    PLP                                                                  ;A098AA;
    RTL                                                                  ;A098AB;

  .notInvincible:
    LDA.W ContactDamageIndex                                             ;A098AC;
    BNE .return                                                          ;A098AF;
    LDA.W #$0022                                                         ;A098B1;
    STA.W CollisionIndex                                                 ;A098B4;

  .loop:
    LDX.W CollisionIndex                                                 ;A098B7;
    LDA.W EnemyProjectile_ID,X                                           ;A098BA;
    BEQ .next                                                            ;A098BD;
    LDA.W EnemyProjectile_Properties,X                                   ;A098BF;
    BIT.W #$2000                                                         ;A098C2;
    BNE .next                                                            ;A098C5;
    LDA.W EnemyProjectile_Radii,X                                        ;A098C7;
    AND.W #$00FF                                                         ;A098CA;
    BNE .hasXHitbox                                                      ;A098CD;
    JMP.W .next                                                          ;A098CF;

  .hasXHitbox:
    STA.W Temp_ProjectileXRadius                                         ;A098D2;
    LDA.W EnemyProjectile_Radii+1,X                                      ;A098D5;
    AND.W #$00FF                                                         ;A098D8;
    BEQ .next                                                            ;A098DB;
    STA.W Temp_ProjectileYRadius                                         ;A098DD;
    LDA.W SamusXPosition                                                 ;A098E0;
    SEC                                                                  ;A098E3;
    SBC.W EnemyProjectile_XPositions,X                                   ;A098E4;
    BPL +                                                                ;A098E7;
    EOR.W #$FFFF                                                         ;A098E9;
    INC                                                                  ;A098EC;

+   SEC                                                                  ;A098ED;
    SBC.W SamusXRadius                                                   ;A098EE;
    BCC .checkY                                                          ;A098F1;
    CMP.W Temp_ProjectileXRadius                                         ;A098F3;
    BCS .next                                                            ;A098F6;

  .checkY:
    LDA.W SamusYPosition                                                 ;A098F8;
    SEC                                                                  ;A098FB;
    SBC.W EnemyProjectile_YPositions,X                                   ;A098FC;
    BPL +                                                                ;A098FF;
    EOR.W #$FFFF                                                         ;A09901;
    INC                                                                  ;A09904;

+   SEC                                                                  ;A09905;
    SBC.W SamusYRadius                                                   ;A09906;
    BCC .handleCollision                                                 ;A09909;
    CMP.W Temp_ProjectileYRadius                                         ;A0990B;
    BCC .handleCollision                                                 ;A0990E;
    BRA .next                                                            ;A09910;

  .handleCollision:
    JSR.W HandleEnemyProjectileCollisionWithSamus                        ;A09912;

  .next:
    DEC.W CollisionIndex                                                 ;A09915;
    DEC.W CollisionIndex                                                 ;A09918;
    LDA.W CollisionIndex                                                 ;A0991B;
    BPL .loop                                                            ;A0991E;

  .return:
    PLB                                                                  ;A09920;
    PLP                                                                  ;A09921;
    RTL                                                                  ;A09922;


;;; $9923: Handle enemy projectile collision with Samus ;;;
HandleEnemyProjectileCollisionWithSamus:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W #$0060                                                         ;A09923;
    STA.W SamusInvincibilityTimer                                        ;A09926;
    LDA.W #$0005                                                         ;A09929;
    STA.W SamusKnockbackTimer                                            ;A0992C;
    TXY                                                                  ;A0992F;
    LDX.W EnemyProjectile_ID,Y                                           ;A09930;
    LDA.L EnemyProjectiles_properties,X                                  ;A09933;
    BEQ .checkContact                                                    ;A09937;
    STA.W EnemyProjectile_InstListPointers,Y                             ;A09939;
    LDA.W #$0001                                                         ;A0993C;
    STA.W EnemyProjectile_InstructionTimers,Y                            ;A0993F;

  .checkContact:
    TYX                                                                  ;A09942;
    BIT.W EnemyProjectile_Properties,X                                   ;A09943;
    BVS .dontDelete                                                      ;A09946;
    STZ.W EnemyProjectile_ID,X                                           ;A09948;

  .dontDelete:
    LDA.W EnemyProjectile_Properties,X                                   ;A0994B;
    AND.W #$0FFF                                                         ;A0994E;
    JSL.L Suit_Damage_Division                                           ;A09951;
    JSL.L Deal_A_Damage_to_Samus                                         ;A09955;
    LDY.W #$0000                                                         ;A09959;
    LDA.W SamusXPosition                                                 ;A0995C;
    SEC                                                                  ;A0995F;
    SBC.W EnemyProjectile_XPositions,X                                   ;A09960;
    BMI .knockbackDirection                                              ;A09963;
    LDY.W #$0001                                                         ;A09965;

  .knockbackDirection:
    STY.W KnockbackXDirection                                            ;A09968;
    RTS                                                                  ;A0996B;


;;; $996C: Enemy projectile / projectile collision handling ;;;
Projectile_vs_Projectile_Collision_Handling:
    PHP                                                                  ;A0996C;
    PHB                                                                  ;A0996D;
    PEA.W Projectile_vs_Projectile_Collision_Handling>>8&$FF00           ;A0996E;
    PLB                                                                  ;A09971;
    PLB                                                                  ;A09972;
    REP #$30                                                             ;A09973;
    LDA.W #$000C                                                         ;A09975;
    STA.L EnemyProcessingStage                                           ;A09978;
    LDA.W SamusProjectile_ProjectileCounter                              ;A0997C;
    BNE .setIndex                                                        ;A0997F;
    PLB                                                                  ;A09981;
    PLP                                                                  ;A09982;
    RTL                                                                  ;A09983;

  .setIndex:
    LDA.W #$0022                                                         ;A09984;
    STA.W CollisionIndex                                                 ;A09987;

  .loopEnemyProjectile:
    LDX.W CollisionIndex                                                 ;A0998A;
    LDA.W EnemyProjectile_ID,X                                           ;A0998D;
    BEQ .nextEnemyProjectile                                             ;A09990;
    LDA.W EnemyProjectile_Properties,X                                   ;A09992;
    BPL .nextEnemyProjectile                                             ;A09995;
    LDY.W #$0000                                                         ;A09997;

  .loopProjectile:
    LDA.L EnemyProjectileData_CollisionOptions,X                         ;A0999A;
    CMP.W #$0002                                                         ;A0999E;
    BEQ .nextEnemyProjectile                                             ;A099A1;
    LDA.W SamusProjectile_Types,Y                                        ;A099A3;
    BEQ .nextProjectile                                                  ;A099A6;
    AND.W #$0F00                                                         ;A099A8;
    CMP.W #$0300                                                         ;A099AB;
    BEQ .nextProjectile                                                  ;A099AE;
    CMP.W #$0500                                                         ;A099B0;
    BEQ .nextProjectile                                                  ;A099B3;
    CMP.W #$0700                                                         ;A099B5;
    BPL .nextProjectile                                                  ;A099B8;
    LDA.W SamusProjectile_XPositions,Y                                   ;A099BA;
    AND.W #$FFE0                                                         ;A099BD;
    STA.B DP_Temp12                                                      ;A099C0;
    LDA.W EnemyProjectile_XPositions,X                                   ;A099C2;
    AND.W #$FFE0                                                         ;A099C5;
    CMP.B DP_Temp12                                                      ;A099C8;
    BNE .nextProjectile                                                  ;A099CA;
    LDA.W SamusProjectile_YPositions,Y                                   ;A099CC;
    AND.W #$FFE0                                                         ;A099CF;
    STA.B DP_Temp12                                                      ;A099D2;
    LDA.W EnemyProjectile_YPositions,X                                   ;A099D4;
    AND.W #$FFE0                                                         ;A099D7;
    CMP.B DP_Temp12                                                      ;A099DA;
    BNE .nextProjectile                                                  ;A099DC;
    JSR.W HandleEnemyProjectileCollisionWithProjectile                   ;A099DE;

  .nextProjectile:
    INY                                                                  ;A099E1;
    INY                                                                  ;A099E2;
    CPY.W #$000A                                                         ;A099E3;
    BMI .loopProjectile                                                  ;A099E6;

  .nextEnemyProjectile:
    DEC.W CollisionIndex                                                 ;A099E8;
    DEC.W CollisionIndex                                                 ;A099EB;
    LDA.W CollisionIndex                                                 ;A099EE;
    BMI .return                                                          ;A099F1;
    JMP.W .loopEnemyProjectile                                           ;A099F3;

  .return:
    PLB                                                                  ;A099F6;
    PLP                                                                  ;A099F7;
    RTL                                                                  ;A099F8;


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
    LDA.W SamusProjectile_Types,Y                                        ;A099F9;
    BIT.W #$0008                                                         ;A099FC;
    BNE .plasmaBeam                                                      ;A099FF;
    LDA.W SamusProjectile_Directions,Y                                   ;A09A01;
    ORA.W #$0010                                                         ;A09A04;
    STA.W SamusProjectile_Directions,Y                                   ;A09A07;

  .plasmaBeam:
    LDA.L EnemyProjectileData_CollisionOptions,X                         ;A09A0A;
    CMP.W #$0001                                                         ;A09A0E;
    BEQ .buggyDudShot                                                    ;A09A11;
    LDA.W SamusProjectile_Types,Y                                        ;A09A13;
    PHY                                                                  ;A09A16;
    TXY                                                                  ;A09A17;
    STA.W EnemyProjectile_CollidedProjectileType,Y                       ;A09A18;
    LDX.W EnemyProjectile_ID,Y                                           ;A09A1B;
    LDA.L EnemyProjectiles_hitInstList,X                                 ;A09A1E;
    STA.W EnemyProjectile_InstListPointers,Y                             ;A09A22;
    LDA.W #$0001                                                         ;A09A25;
    STA.W EnemyProjectile_InstructionTimers,Y                            ;A09A28;
    LDA.W #RTS_8684FB                                                    ;A09A2B;
    STA.W EnemyProjectile_PreInstructions,Y                              ;A09A2E;
    LDA.W EnemyProjectile_Properties,Y                                   ;A09A31;
    AND.W #$0FFF                                                         ;A09A34;
    STA.W EnemyProjectile_Properties,Y                                   ;A09A37;
    TYX                                                                  ;A09A3A;
    PLY                                                                  ;A09A3B;
    RTS                                                                  ;A09A3C;

  .buggyDudShot:
    LDA.W SamusProjectile_XPositions,X                                   ;A09A3D;
    STA.B DP_Temp12                                                      ;A09A40;
    LDA.W SamusProjectile_YPositions,X                                   ;A09A42;
    STA.B DP_Temp14                                                      ;A09A45;
    LDA.W #$0006                                                         ;A09A47;
    STA.B DP_Temp16                                                      ;A09A4A;
    STZ.B DP_Temp18                                                      ;A09A4C;
    JSL.L Create_Sprite_Object                                           ;A09A4E;
    LDA.W #$003D                                                         ;A09A52;
    JSL.L QueueSound_Lib1_Max6                                           ;A09A55;
    RTS                                                                  ;A09A59;


;;; $9A5A: Enemy / Samus collision handling - extended spritemap ;;;
EnemySamusCollisionHandling_ExtendedSpritemap:
; This routine disables Samus' invincibility if she is using blue suit or screw attack (unless there are no tangible enemies)
    PHB                                                                  ;A09A5A;
    LDX.W EnemyIndex                                                     ;A09A5B;
    LDA.W Enemy.bank,X                                                   ;A09A5E;
    STA.W EnemyAIPointer+2                                               ;A09A61;
    XBA                                                                  ;A09A64;
    PHA                                                                  ;A09A65;
    PLB                                                                  ;A09A66;
    PLB                                                                  ;A09A67;
    LDA.W #$0006                                                         ;A09A68;
    STA.L EnemyProcessingStage                                           ;A09A6B;
    LDY.W EnemyIndex                                                     ;A09A6F;
    LDA.W Enemy.spritemap,Y                                              ;A09A72;
    BEQ .returnUpper                                                     ;A09A75;
    LDA.W Enemy.ID,X                                                     ;A09A77;
    TAX                                                                  ;A09A7A;
    LDA.L EnemyHeaders_enemyTouch,X                                      ;A09A7B;
    CMP.W #RTL_A0804C                                                    ;A09A7F;
    BEQ .returnUpper                                                     ;A09A82;
    CMP.W #RTS_A0804B                                                    ;A09A84;
    BNE .touch                                                           ;A09A87;

  .returnUpper:
    PLB                                                                  ;A09A89;
    RTS                                                                  ;A09A8A;

  .touch:
    LDA.W ContactDamageIndex                                             ;A09A8B;
    BEQ .normalContact                                                   ;A09A8E;
    STZ.W SamusInvincibilityTimer                                        ;A09A90;
    BRA .notInvincible                                                   ;A09A93;

  .normalContact:
    LDA.W SamusInvincibilityTimer                                        ;A09A95;
    BNE .returnUpper                                                     ;A09A98;

  .notInvincible:
    LDX.W EnemyIndex                                                     ;A09A9A;
    LDA.W Enemy.spritemap,X                                              ;A09A9D;
    CMP.W #$8000                                                         ;A09AA0;
    BMI .returnUpper                                                     ;A09AA3;
    LDA.W SamusXPosition                                                 ;A09AA5;
    CLC                                                                  ;A09AA8;
    ADC.W SamusXRadius                                                   ;A09AA9;
    STA.W SamusRightBoundaryForEnemyVsSamusCollisions                    ;A09AAC;
    LDA.W SamusXPosition                                                 ;A09AAF;
    SEC                                                                  ;A09AB2;
    SBC.W SamusXRadius                                                   ;A09AB3;
    STA.W SamusLeftBoundaryForEnemyVsSamusCollisions                     ;A09AB6;
    LDA.W SamusYPosition                                                 ;A09AB9;
    CLC                                                                  ;A09ABC;
    ADC.W SamusYRadius                                                   ;A09ABD;
    STA.W SamusBottomBoundaryForEnemyVsSamusCollisions                   ;A09AC0;
    LDA.W SamusYPosition                                                 ;A09AC3;
    SEC                                                                  ;A09AC6;
    SBC.W SamusYRadius                                                   ;A09AC7;
    STA.W SamusTopBoundaryForEnemyVsSamusCollisions                      ;A09ACA;
    LDA.W Enemy.spritemap,X                                              ;A09ACD;
    TAX                                                                  ;A09AD0;
    LDA.W $0000,X                                                        ;A09AD1;
    AND.W #$00FF                                                         ;A09AD4;
    STA.W RemainingEnemySpritemapEntries                                 ;A09AD7;
    INX                                                                  ;A09ADA;
    INX                                                                  ;A09ADB;
    STX.W EnemySpritemapEntryPointerDuringCollision                      ;A09ADC;

  .loopSpritemapEntries:
    LDX.W EnemySpritemapEntryPointerDuringCollision                      ;A09ADF;
    LDY.W EnemyIndex                                                     ;A09AE2;
    LDA.W Enemy.XPosition,Y                                              ;A09AE5;
    CLC                                                                  ;A09AE8;
    ADC.W $0000,X                                                        ;A09AE9;
    STA.W EnemySpritemapEntryXPositionDuringCollision                    ;A09AEC;
    LDA.W Enemy.YPosition,Y                                              ;A09AEF;
    CLC                                                                  ;A09AF2;
    ADC.W $0002,X                                                        ;A09AF3;
    STA.W EnemySpritemapEntryYPositionDuringCollision                    ;A09AF6;
    LDA.W $0006,X                                                        ;A09AF9;
    TAX                                                                  ;A09AFC;
    LDA.W $0000,X                                                        ;A09AFD;
    BEQ .nextSpritemapEntry                                              ;A09B00;
    STA.W RemainingEnemyHitboxEntries                                    ;A09B02;
    INX                                                                  ;A09B05;
    INX                                                                  ;A09B06;
    STX.W EnemyHitboxEntryPointerDuringCollision                         ;A09B07;

  .loopHitboxes:
    LDX.W EnemyHitboxEntryPointerDuringCollision                         ;A09B0A;
    LDA.W EnemySpritemapEntryXPositionDuringCollision                    ;A09B0D;
    CLC                                                                  ;A09B10;
    ADC.W $0000,X                                                        ;A09B11;
    CMP.W SamusRightBoundaryForEnemyVsSamusCollisions                    ;A09B14;
    BPL .nextHitboxEntry                                                 ;A09B17;
    LDA.W EnemySpritemapEntryXPositionDuringCollision                    ;A09B19;
    CLC                                                                  ;A09B1C;
    ADC.W $0004,X                                                        ;A09B1D;
    CMP.W SamusLeftBoundaryForEnemyVsSamusCollisions                     ;A09B20;
    BMI .nextHitboxEntry                                                 ;A09B23;
    LDA.W EnemySpritemapEntryYPositionDuringCollision                    ;A09B25;
    CLC                                                                  ;A09B28;
    ADC.W $0002,X                                                        ;A09B29;
    CMP.W SamusBottomBoundaryForEnemyVsSamusCollisions                   ;A09B2C;
    BPL .nextHitboxEntry                                                 ;A09B2F;
    LDA.W EnemySpritemapEntryYPositionDuringCollision                    ;A09B31;
    CLC                                                                  ;A09B34;
    ADC.W $0006,X                                                        ;A09B35;
    CMP.W SamusTopBoundaryForEnemyVsSamusCollisions                      ;A09B38;
    BMI .nextHitboxEntry                                                 ;A09B3B;
    JSL.L .executeAI                                                     ;A09B3D;
    BRA .returnLower                                                     ;A09B41;

  .executeAI:
    LDX.W EnemyHitboxEntryPointerDuringCollision                         ;A09B43;
    LDA.W $0008,X                                                        ;A09B46;
    STA.W EnemyAIPointer                                                 ;A09B49;
    JML.W [EnemyAIPointer]                                               ;A09B4C;

  .nextHitboxEntry:
    LDA.W EnemyHitboxEntryPointerDuringCollision                         ;A09B4F;
    CLC                                                                  ;A09B52;
    ADC.W #$000C                                                         ;A09B53;
    STA.W EnemyHitboxEntryPointerDuringCollision                         ;A09B56;
    DEC.W RemainingEnemyHitboxEntries                                    ;A09B59;
    LDA.W RemainingEnemyHitboxEntries                                    ;A09B5C;
    BEQ .nextSpritemapEntry                                              ;A09B5F;
    BMI .nextSpritemapEntry                                              ;A09B61;
    JMP.W .loopHitboxes                                                  ;A09B63;

  .nextSpritemapEntry:
    LDA.W EnemySpritemapEntryPointerDuringCollision                      ;A09B66;
    CLC                                                                  ;A09B69;
    ADC.W #$0008                                                         ;A09B6A;
    STA.W EnemySpritemapEntryPointerDuringCollision                      ;A09B6D;
    DEC.W RemainingEnemySpritemapEntries                                 ;A09B70;
    LDA.W RemainingEnemySpritemapEntries                                 ;A09B73;
    BEQ .returnLower                                                     ;A09B76;
    BMI .returnLower                                                     ;A09B78;
    JMP.W .loopSpritemapEntries                                          ;A09B7A;

  .returnLower:
    PLB                                                                  ;A09B7D;
    RTS                                                                  ;A09B7E;


;;; $9B7F: Enemy / projectile collision handling - extended spritemap ;;;
Enemy_vs_Projectile_CollisionHandling_ExtendedSpritemap:
    PHB                                                                  ;A09B7F;
    LDX.W EnemyIndex                                                     ;A09B80;
    LDA.W Enemy.bank,X                                                   ;A09B83;
    STA.W EnemyAIPointer+2                                               ;A09B86;
    XBA                                                                  ;A09B89;
    PHA                                                                  ;A09B8A;
    PLB                                                                  ;A09B8B;
    PLB                                                                  ;A09B8C;
    LDA.W #$0003                                                         ;A09B8D;
    STA.L EnemyProcessingStage                                           ;A09B90;
    LDA.W SamusProjectile_ProjectileCounter                              ;A09B94;
    BNE .nonZeroCounter                                                  ;A09B97;
    PLB                                                                  ;A09B99;
    RTS                                                                  ;A09B9A;

  .nonZeroCounter:
    STA.W ProjectileCounterMirror                                        ;A09B9B;
    LDY.W EnemyIndex                                                     ;A09B9E;
    LDA.W Enemy.spritemap,Y                                              ;A09BA1;
    BEQ .returnUpper                                                     ;A09BA4;
    CMP.W #ExtendedSpritemap_Common_Nothing                              ;A09BA6;
    BEQ .returnUpper                                                     ;A09BA9;
    LDX.W Enemy.ID,Y                                                     ;A09BAB;
    LDA.L EnemyHeaders_enemyShot,X                                       ;A09BAE;
    CMP.W #RTL_A0804C                                                    ;A09BB2;
    BEQ .returnUpper                                                     ;A09BB5;
    CMP.W #RTS_A0804B                                                    ;A09BB7;
    BNE +                                                                ;A09BBA;

  .returnUpper:
    PLB                                                                  ;A09BBC;
    RTS                                                                  ;A09BBD;

+   LDX.W EnemyIndex                                                     ;A09BBE;
    LDA.W Enemy.properties,X                                             ;A09BC1;
    BIT.W #$0400                                                         ;A09BC4;
    BNE .returnUpper                                                     ;A09BC7;
    LDA.W Enemy.invincibilityTimer,X                                     ;A09BC9;
    BNE .returnUpper                                                     ;A09BCC;
    LDA.W Enemy.ID,X                                                     ;A09BCE;
    CMP.W #EnemyHeaders_Respawn                                          ;A09BD1;
    BEQ .returnUpper                                                     ;A09BD4;
    STZ.W CollisionIndex                                                 ;A09BD6;

  .loopProjectiles:
    LDX.W EnemyIndex                                                     ;A09BD9;
    LDA.W CollisionIndex                                                 ;A09BDC;
    ASL                                                                  ;A09BDF;
    TAY                                                                  ;A09BE0;
    LDA.W SamusProjectile_Types,Y                                        ;A09BE1;
    BEQ .gotoNextProjectile                                              ;A09BE4;
    AND.W #$0F00                                                         ;A09BE6;
    CMP.W #$0300                                                         ;A09BE9;
    BEQ .gotoNextProjectile                                              ;A09BEC;
    CMP.W #$0500                                                         ;A09BEE;
    BEQ .gotoNextProjectile                                              ;A09BF1;
    CMP.W #$0700                                                         ;A09BF3;
    BMI .validProjectile                                                 ;A09BF6;

  .gotoNextProjectile:
    JMP.W .nextProjectile                                                ;A09BF8;

  .validProjectile:
    LDX.W EnemyIndex                                                     ;A09BFB;
    LDA.W Enemy.spritemap,X                                              ;A09BFE;
    CMP.W #$8000                                                         ;A09C01;

  .crash:
    BMI .crash                                                           ;A09C04;
    TAX                                                                  ;A09C06;
    LDA.W $0000,X                                                        ;A09C07;
    AND.W #$00FF                                                         ;A09C0A;
    STA.W RemainingEnemySpritemapEntries                                 ;A09C0D;
    INX                                                                  ;A09C10;
    INX                                                                  ;A09C11;
    STX.W EnemySpritemapEntryPointerDuringCollision                      ;A09C12;

  .loopSpritemapEntries:
    LDX.W EnemySpritemapEntryPointerDuringCollision                      ;A09C15;
    LDY.W EnemyIndex                                                     ;A09C18;
    LDA.W Enemy.XPosition,Y                                              ;A09C1B;
    CLC                                                                  ;A09C1E;
    ADC.W $0000,X                                                        ;A09C1F;
    STA.W EnemySpritemapEntryXPositionDuringCollision                    ;A09C22;
    LDA.W Enemy.YPosition,Y                                              ;A09C25;
    CLC                                                                  ;A09C28;
    ADC.W $0002,X                                                        ;A09C29;
    STA.W EnemySpritemapEntryYPositionDuringCollision                    ;A09C2C;
    LDA.W $0006,X                                                        ;A09C2F;
    TAX                                                                  ;A09C32;
    LDA.W $0000,X                                                        ;A09C33;
    BNE .entriesRemaining                                                ;A09C36;
    JMP.W .nextSpritemapEntry                                            ;A09C38;

  .entriesRemaining:
    STA.W RemainingEnemyHitboxEntries                                    ;A09C3B;
    INX                                                                  ;A09C3E;
    INX                                                                  ;A09C3F;
    STX.W EnemyHitboxEntryPointerDuringCollision                         ;A09C40;

  .loopHitboxes:
    LDX.W EnemyHitboxEntryPointerDuringCollision                         ;A09C43;
    LDA.W CollisionIndex                                                 ;A09C46;
    ASL                                                                  ;A09C49;
    TAY                                                                  ;A09C4A;
    LDA.W $0000,X                                                        ;A09C4B;
    CLC                                                                  ;A09C4E;
    ADC.W EnemySpritemapEntryXPositionDuringCollision                    ;A09C4F;
    STA.W EnemyLeftBoundaryForEnemyVsProjectileCollisions                ;A09C52;
    LDA.W SamusProjectile_XPositions,Y                                   ;A09C55;
    CLC                                                                  ;A09C58;
    ADC.W SamusProjectile_XRadii,Y                                       ;A09C59;
    CMP.W EnemyLeftBoundaryForEnemyVsProjectileCollisions                ;A09C5C;
    BPL +                                                                ;A09C5F;
    JMP.W .nextHitbox                                                    ;A09C61;

+   LDA.W $0004,X                                                        ;A09C64;
    CLC                                                                  ;A09C67;
    ADC.W EnemySpritemapEntryXPositionDuringCollision                    ;A09C68;
    STA.W EnemyRightBoundaryForEnemyVsProjectileCollisions               ;A09C6B;
    LDA.W SamusProjectile_XPositions,Y                                   ;A09C6E;
    SEC                                                                  ;A09C71;
    SBC.W SamusProjectile_XRadii,Y                                       ;A09C72;
    CMP.W EnemyRightBoundaryForEnemyVsProjectileCollisions               ;A09C75;
    BPL .nextHitbox                                                      ;A09C78;
    LDA.W $0002,X                                                        ;A09C7A;
    CLC                                                                  ;A09C7D;
    ADC.W EnemySpritemapEntryYPositionDuringCollision                    ;A09C7E;
    STA.W EnemyBottomBoundaryForEnemyVsProjectileCollisions              ;A09C81;
    LDA.W SamusProjectile_YPositions,Y                                   ;A09C84;
    CLC                                                                  ;A09C87;
    ADC.W SamusProjectile_YRadii,Y                                       ;A09C88;
    CMP.W EnemyBottomBoundaryForEnemyVsProjectileCollisions              ;A09C8B;
    BMI .nextHitbox                                                      ;A09C8E;
    LDA.W $0006,X                                                        ;A09C90;
    CLC                                                                  ;A09C93;
    ADC.W EnemySpritemapEntryYPositionDuringCollision                    ;A09C94;
    STA.W EnemyTopBoundaryForEnemyVsProjectileCollisions                 ;A09C97;
    LDA.W SamusProjectile_YPositions,Y                                   ;A09C9A;
    SEC                                                                  ;A09C9D;
    SBC.W SamusProjectile_YRadii,Y                                       ;A09C9E;
    CMP.W EnemyTopBoundaryForEnemyVsProjectileCollisions                 ;A09CA1;
    BPL .nextHitbox                                                      ;A09CA4;
    LDA.W SamusProjectile_Types,Y                                        ;A09CA6;
    AND.W #$0F00                                                         ;A09CA9;
    CMP.W #$0200                                                         ;A09CAC;
    BNE .notSuperMissile                                                 ;A09CAF;
    LDA.W #$001E                                                         ;A09CB1;
    STA.W EarthquakeTimer                                                ;A09CB4;
    LDA.W #$0012                                                         ;A09CB7;
    STA.W EarthquakeType                                                 ;A09CBA;

  .notSuperMissile:
    LDX.W EnemyIndex                                                     ;A09CBD;
    LDA.W Enemy.properties,X                                             ;A09CC0;
    BIT.W #$1000                                                         ;A09CC3;
    BNE .delete                                                          ;A09CC6;
    LDA.W SamusProjectile_Types,Y                                        ;A09CC8;
    AND.W #$0008                                                         ;A09CCB;
    BNE .noDelete                                                        ;A09CCE;

  .delete:
    LDA.W SamusProjectile_Directions,Y                                   ;A09CD0;
    ORA.W #$0010                                                         ;A09CD3;
    STA.W SamusProjectile_Directions,Y                                   ;A09CD6;

  .noDelete:
    JSL.L .executeCollision                                              ;A09CD9;
    BRA .returnLower                                                     ;A09CDD;

  .nextHitbox:
    LDA.W EnemyHitboxEntryPointerDuringCollision                         ;A09CDF;
    CLC                                                                  ;A09CE2;
    ADC.W #$000C                                                         ;A09CE3;
    STA.W EnemyHitboxEntryPointerDuringCollision                         ;A09CE6;
    DEC.W RemainingEnemyHitboxEntries                                    ;A09CE9;
    BEQ .nextSpritemapEntry                                              ;A09CEC;
    BMI .nextSpritemapEntry                                              ;A09CEE;
    JMP.W .loopHitboxes                                                  ;A09CF0;

  .nextSpritemapEntry:
    LDA.W EnemySpritemapEntryPointerDuringCollision                      ;A09CF3;
    CLC                                                                  ;A09CF6;
    ADC.W #$0008                                                         ;A09CF7;
    STA.W EnemySpritemapEntryPointerDuringCollision                      ;A09CFA;
    DEC.W RemainingEnemySpritemapEntries                                 ;A09CFD;
    BEQ .nextProjectile                                                  ;A09D00;
    BMI .nextProjectile                                                  ;A09D02;
    JMP.W .loopSpritemapEntries                                          ;A09D04;

  .nextProjectile:
    INC.W CollisionIndex                                                 ;A09D07;
    LDA.W CollisionIndex                                                 ;A09D0A;
    CMP.W #$0005                                                         ;A09D0D;
    BPL .returnLower                                                     ;A09D10;
    JMP.W .loopProjectiles                                               ;A09D12;

  .returnLower:
    PLB                                                                  ;A09D15;
    RTS                                                                  ;A09D16;

  .executeCollision:
    LDX.W EnemyHitboxEntryPointerDuringCollision                         ;A09D17;
    LDA.W $000A,X                                                        ;A09D1A;
    STA.W EnemyAIPointer                                                 ;A09D1D;
    JML.W [EnemyAIPointer]                                               ;A09D20;


;;; $9D23: Enemy / bomb collision handling - extended spritemap ;;;
Enemy_vs_Bomb_CollisionHandling_ExtendedSpritemap:
; I don't really see any reason why this routine should be separate from $9B7F
    PHB                                                                  ;A09D23;
    LDX.W EnemyIndex                                                     ;A09D24;
    LDA.W Enemy.bank,X                                                   ;A09D27;
    STA.W EnemyAIPointer+2                                               ;A09D2A;
    XBA                                                                  ;A09D2D;
    PHA                                                                  ;A09D2E;
    PLB                                                                  ;A09D2F;
    PLB                                                                  ;A09D30;
    LDA.W #$0004                                                         ;A09D31;
    STA.L EnemyProcessingStage                                           ;A09D34;
    LDY.W EnemyIndex                                                     ;A09D38;
    LDA.W Enemy.spritemap,Y                                              ;A09D3B;
    BEQ .returnUpper                                                     ;A09D3E;
    LDX.W EnemyIndex                                                     ;A09D40;
    LDA.W Enemy.properties,X                                             ;A09D43;
    BIT.W #$0400                                                         ;A09D46;
    BNE .returnUpper                                                     ;A09D49;
    LDA.W Enemy.invincibilityTimer,X                                     ;A09D4B;
    BNE .returnUpper                                                     ;A09D4E;
    LDY.W EnemyIndex                                                     ;A09D50;
    LDX.W Enemy.ID,Y                                                     ;A09D53;
    LDA.L EnemyHeaders_enemyShot,X                                       ;A09D56;
    CMP.W #RTL_A0804C                                                    ;A09D5A;
    BEQ .returnUpper                                                     ;A09D5D;
    CMP.W #RTS_A0804B                                                    ;A09D5F;
    BNE +                                                                ;A09D62;

  .returnUpper:
    PLB                                                                  ;A09D64;
    RTS                                                                  ;A09D65;

+   LDA.W SamusProjectile_BombCounter                                    ;A09D66;
    BEQ .returnUpper                                                     ;A09D69;
    LDA.W #$0005                                                         ;A09D6B;
    STA.W CollisionIndex                                                 ;A09D6E;

  .loopProjectiles:
    LDX.W EnemyIndex                                                     ;A09D71;
    LDA.W CollisionIndex                                                 ;A09D74;
    ASL                                                                  ;A09D77;
    TAY                                                                  ;A09D78;
    LDA.W SamusProjectile_XPositions,Y                                   ;A09D79;
    BNE .notZeroX                                                        ;A09D7C;
    JMP.W .nextProjectile                                                ;A09D7E;

  .notZeroX:
    LDA.W SamusProjectile_Types,Y                                        ;A09D81;
    BEQ .gotoNextProjectile                                              ;A09D84;
    AND.W #$0F00                                                         ;A09D86;
    CMP.W #$0500                                                         ;A09D89;
    BEQ .bomb                                                            ;A09D8C;

  .gotoNextProjectile:
    JMP.W .nextProjectile                                                ;A09D8E;

  .bomb:
    LDA.W SamusProjectile_Variables,Y                                    ;A09D91;
    BEQ .timerExpired                                                    ;A09D94;
    JMP.W .nextProjectile                                                ;A09D96;

  .timerExpired:
    LDA.W Enemy.spritemap,X                                              ;A09D99;
    CMP.W #$8000                                                         ;A09D9C;

  .crash:
    BMI .crash                                                           ;A09D9F;
    TAX                                                                  ;A09DA1;
    LDA.W $0000,X                                                        ;A09DA2;
    AND.W #$00FF                                                         ;A09DA5;
    STA.W RemainingEnemySpritemapEntries                                 ;A09DA8;
    INX                                                                  ;A09DAB;
    INX                                                                  ;A09DAC;
    STX.W EnemySpritemapEntryPointerDuringCollision                      ;A09DAD;

  .loopSpritemapEntries:
    LDX.W EnemySpritemapEntryPointerDuringCollision                      ;A09DB0;
    LDY.W EnemyIndex                                                     ;A09DB3;
    LDA.W Enemy.XPosition,Y                                              ;A09DB6;
    CLC                                                                  ;A09DB9;
    ADC.W $0000,X                                                        ;A09DBA;
    STA.W EnemySpritemapEntryXPositionDuringCollision                    ;A09DBD;
    LDA.W Enemy.YPosition,Y                                              ;A09DC0;
    CLC                                                                  ;A09DC3;
    ADC.W $0002,X                                                        ;A09DC4;
    STA.W EnemySpritemapEntryYPositionDuringCollision                    ;A09DC7;
    LDA.W $0006,X                                                        ;A09DCA;
    TAX                                                                  ;A09DCD;
    LDA.W $0000,X                                                        ;A09DCE;
    BNE +                                                                ;A09DD1;
    JMP.W .nextSpritemapEntry                                            ;A09DD3;

+   STA.W RemainingEnemyHitboxEntries                                    ;A09DD6;
    INX                                                                  ;A09DD9;
    INX                                                                  ;A09DDA;
    STX.W EnemyHitboxEntryPointerDuringCollision                         ;A09DDB;

  .loopHitboxes:
    LDX.W EnemyHitboxEntryPointerDuringCollision                         ;A09DDE;
    LDA.W CollisionIndex                                                 ;A09DE1;
    ASL                                                                  ;A09DE4;
    TAY                                                                  ;A09DE5;
    LDA.W $0000,X                                                        ;A09DE6;
    CLC                                                                  ;A09DE9;
    ADC.W EnemySpritemapEntryXPositionDuringCollision                    ;A09DEA;
    STA.W EnemyLeftBoundaryForEnemyVsProjectileCollisions                ;A09DED;
    LDA.W SamusProjectile_XPositions,Y                                   ;A09DF0;
    CLC                                                                  ;A09DF3;
    ADC.W SamusProjectile_XRadii,Y                                       ;A09DF4;
    CMP.W EnemyLeftBoundaryForEnemyVsProjectileCollisions                ;A09DF7;
    BPL +                                                                ;A09DFA;
    JMP.W .nextHitbox                                                    ;A09DFC;

+   LDA.W $0004,X                                                        ;A09DFF;
    CLC                                                                  ;A09E02;
    ADC.W EnemySpritemapEntryXPositionDuringCollision                    ;A09E03;
    STA.W EnemyRightBoundaryForEnemyVsProjectileCollisions               ;A09E06;
    LDA.W SamusProjectile_XPositions,Y                                   ;A09E09;
    SEC                                                                  ;A09E0C;
    SBC.W SamusProjectile_XRadii,Y                                       ;A09E0D;
    CMP.W EnemyRightBoundaryForEnemyVsProjectileCollisions               ;A09E10;
    BPL .nextHitbox                                                      ;A09E13;
    LDA.W $0002,X                                                        ;A09E15;
    CLC                                                                  ;A09E18;
    ADC.W EnemySpritemapEntryYPositionDuringCollision                    ;A09E19;
    STA.W EnemyBottomBoundaryForEnemyVsProjectileCollisions              ;A09E1C;
    LDA.W SamusProjectile_YPositions,Y                                   ;A09E1F;
    CLC                                                                  ;A09E22;
    ADC.W SamusProjectile_YRadii,Y                                       ;A09E23;
    CMP.W EnemyBottomBoundaryForEnemyVsProjectileCollisions              ;A09E26;
    BMI .nextHitbox                                                      ;A09E29;
    LDA.W $0006,X                                                        ;A09E2B;
    CLC                                                                  ;A09E2E;
    ADC.W EnemySpritemapEntryYPositionDuringCollision                    ;A09E2F;
    STA.W EnemyTopBoundaryForEnemyVsProjectileCollisions                 ;A09E32;
    LDA.W SamusProjectile_YPositions,Y                                   ;A09E35;
    SEC                                                                  ;A09E38;
    SBC.W SamusProjectile_YRadii,Y                                       ;A09E39;
    CMP.W EnemyTopBoundaryForEnemyVsProjectileCollisions                 ;A09E3C;
    BPL .nextHitbox                                                      ;A09E3F;
    LDA.W SamusProjectile_Directions,Y                                   ;A09E41;
    ORA.W #$0010                                                         ;A09E44;
    STA.W SamusProjectile_Directions,Y                                   ;A09E47;
    JSL.L .executeCollision                                              ;A09E4A;
    BRA .returnLower                                                     ;A09E4E;

  .nextHitbox:
    LDA.W EnemyHitboxEntryPointerDuringCollision                         ;A09E50;
    CLC                                                                  ;A09E53;
    ADC.W #$000C                                                         ;A09E54;
    STA.W EnemyHitboxEntryPointerDuringCollision                         ;A09E57;
    DEC.W RemainingEnemyHitboxEntries                                    ;A09E5A;
    LDA.W RemainingEnemyHitboxEntries                                    ;A09E5D;
    BEQ .nextSpritemapEntry                                              ;A09E60;
    BMI .nextSpritemapEntry                                              ;A09E62;
    JMP.W .loopHitboxes                                                  ;A09E64;

  .nextSpritemapEntry:
    LDA.W EnemySpritemapEntryPointerDuringCollision                      ;A09E67;
    CLC                                                                  ;A09E6A;
    ADC.W #$0008                                                         ;A09E6B;
    STA.W EnemySpritemapEntryPointerDuringCollision                      ;A09E6E;
    DEC.W RemainingEnemySpritemapEntries                                 ;A09E71;
    LDA.W RemainingEnemySpritemapEntries                                 ;A09E74;
    BEQ .nextProjectile                                                  ;A09E77;
    BMI .nextProjectile                                                  ;A09E79;
    JMP.W .loopSpritemapEntries                                          ;A09E7B;

  .nextProjectile:
    INC.W CollisionIndex                                                 ;A09E7E;
    LDA.W CollisionIndex                                                 ;A09E81;
    CMP.W #$000A                                                         ;A09E84;
    BEQ .returnLower                                                     ;A09E87;
    JMP.W .loopProjectiles                                               ;A09E89;

  .returnLower:
    PLB                                                                  ;A09E8C;
    RTS                                                                  ;A09E8D;

  .executeCollision:
    LDX.W EnemyHitboxEntryPointerDuringCollision                         ;A09E8E;
    LDA.W $000A,X                                                        ;A09E91;
    STA.W EnemyAIPointer                                                 ;A09E94;
    JML.W [EnemyAIPointer]                                               ;A09E97;


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
    PHB                                                                  ;A09E9A;
    PHX                                                                  ;A09E9B;
    PHY                                                                  ;A09E9C;
    LDA.W #$000D                                                         ;A09E9D;
    JSL.L Run_Samus_Command                                              ;A09EA0;
    BNE +                                                                ;A09EA4;
    JMP.W .grappleIndexDetermined                                        ;A09EA6;

+   STZ.W CollisionIndex                                                 ;A09EA9;
    STZ.W InteractiveEnemyIndicesIndex                                   ;A09EAC;

  .loop:
    LDY.W InteractiveEnemyIndicesIndex                                   ;A09EAF;
    LDA.W InteractiveEnemyIndices,Y                                      ;A09EB2;
    STA.W EnemyIndex                                                     ;A09EB5;
    CMP.W #$FFFF                                                         ;A09EB8;
    BNE .notFFFF                                                         ;A09EBB;
    STZ.B DP_Temp12                                                      ;A09EBD;
    LDA.W #$0000                                                         ;A09EBF;
    PLY                                                                  ;A09EC2;
    PLX                                                                  ;A09EC3;
    PLB                                                                  ;A09EC4;
    RTL                                                                  ;A09EC5;

  .notFFFF:
    TAX                                                                  ;A09EC6;
    LDA.W Enemy.invincibilityTimer,X                                     ;A09EC7;
    BNE .next                                                            ;A09ECA;
    LDA.W Enemy.XPosition,X                                              ;A09ECC;
    SEC                                                                  ;A09ECF;
    SBC.W GrappleBeam_EndXPosition                                       ;A09ED0;
    BPL +                                                                ;A09ED3;
    EOR.W #$FFFF                                                         ;A09ED5;
    INC                                                                  ;A09ED8;

+   SEC                                                                  ;A09ED9;
    SBC.W Enemy.XHitboxRadius,X                                          ;A09EDA;
    BCC .Y                                                               ;A09EDD;
    CMP.W #$0008                                                         ;A09EDF;
    BCS .next                                                            ;A09EE2;

  .Y:
    LDA.W Enemy.YPosition,X                                              ;A09EE4;
    SEC                                                                  ;A09EE7;
    SBC.W GrappleBeam_EndYPosition                                       ;A09EE8;
    BPL +                                                                ;A09EEB;
    EOR.W #$FFFF                                                         ;A09EED;
    INC                                                                  ;A09EF0;

+   SEC                                                                  ;A09EF1;
    SBC.W Enemy.YHitboxRadius,X                                          ;A09EF2;
    BCC .hit                                                             ;A09EF5;
    CMP.W #$0008                                                         ;A09EF7;
    BCC .hit                                                             ;A09EFA;

  .next:
    INC.W InteractiveEnemyIndicesIndex                                   ;A09EFC;
    INC.W InteractiveEnemyIndicesIndex                                   ;A09EFF;
    JMP.W .loop                                                          ;A09F02;

  .hit:
    LDA.W #$0001                                                         ;A09F05;
    STA.W Enemy.AI,X                                                     ;A09F08;
    LDY.W #$0000                                                         ;A09F0B;
    LDA.W Enemy.ID,X                                                     ;A09F0E;
    TAX                                                                  ;A09F11;
    LDA.L EnemyHeaders_grappleAI,X                                       ;A09F12;
    CMP.W #Common_GrappleAI_NoInteraction                                ;A09F16;
    BEQ .grappleIndexDetermined                                          ;A09F19;
    LDY.W #$0001                                                         ;A09F1B;
    CMP.W #Common_GrappleAI_SamusLatchesOn                               ;A09F1E;
    BEQ .grappleIndexDetermined                                          ;A09F21;
    INY                                                                  ;A09F23;
    CMP.W #Common_GrappleAI_KillEnemy                                    ;A09F24;
    BEQ .grappleIndexDetermined                                          ;A09F27;
    INY                                                                  ;A09F29;
    CMP.W #Common_GrappleAI_CancelGrappleBeam                            ;A09F2A;
    BEQ .grappleIndexDetermined                                          ;A09F2D;
    INY                                                                  ;A09F2F;
    CMP.W #Common_GrappleAI_SamusLatchesOn_NoInvincibility               ;A09F30;
    BEQ .grappleIndexDetermined                                          ;A09F33;
    INY                                                                  ;A09F35;
    CMP.W #UNUSED_Common_GrappleAI_SamusLatchesOn_ParalyzeEnemy_A08019   ;A09F36;
    BEQ .grappleIndexDetermined                                          ;A09F39;
    INY                                                                  ;A09F3B;
    CMP.W #Common_GrappleAI_HurtSamus                                    ;A09F3C;
    BEQ .grappleIndexDetermined                                          ;A09F3F;
    LDY.W #$0000                                                         ;A09F41;

  .grappleIndexDetermined:
    STX.B DP_Temp12                                                      ;A09F44;
    TYA                                                                  ;A09F46;
    CMP.W #$0001                                                         ;A09F47;
    BEQ .attachGrapple                                                   ;A09F4A;
    CMP.W #$0004                                                         ;A09F4C;
    BEQ .attachGrapple                                                   ;A09F4F;
    CMP.W #$0005                                                         ;A09F51;
    BEQ .attachGrapple                                                   ;A09F54;

  .return:
    PLY                                                                  ;A09F56;
    PLX                                                                  ;A09F57;
    PLB                                                                  ;A09F58;
    RTL                                                                  ;A09F59;

  .attachGrapple:
    PHA                                                                  ;A09F5A;
    LDX.W EnemyIndex                                                     ;A09F5B;
    LDA.W Enemy.XPosition,X                                              ;A09F5E;
    STA.W GrappleBeam_EndXPosition                                       ;A09F61;
    LDA.W Enemy.YPosition,X                                              ;A09F64;
    STA.W GrappleBeam_EndYPosition                                       ;A09F67;
    PLA                                                                  ;A09F6A;
    BRA .return                                                          ;A09F6B;


;;; $9F6D: Switch enemy AI to main AI ;;;
GrappleAI_SwitchEnemyAIToMainAI:
    LDX.W EnemyIndex                                                     ;A09F6D;
    STZ.W Enemy.AI,X                                                     ;A09F70;
    STZ.W Enemy.invincibilityTimer,X                                     ;A09F73;
    STZ.W Enemy.freezeTimer,X                                            ;A09F76;
    STZ.W Enemy.shakeTimer,X                                             ;A09F79;
    RTL                                                                  ;A09F7C;


;;; $9F7D: Samus latches on with grapple ;;;
GrappleAI_SamusLatchesOnWithGrapple:
    LDX.W EnemyIndex                                                     ;A09F7D;
    LDX.W EnemyIndex                                                     ;A09F80; >_<
    LDA.W Enemy.XPosition,X                                              ;A09F83;
    STA.W GrappleBeam_EndXPosition                                       ;A09F86;
    LDA.W Enemy.YPosition,X                                              ;A09F89;
    STA.W GrappleBeam_EndYPosition                                       ;A09F8C;
    LDX.W EnemyIndex                                                     ;A09F8F;
    LDA.W Enemy.freezeTimer,X                                            ;A09F92;
    BNE .frozen                                                          ;A09F95;
    LDX.W EnemyIndex                                                     ;A09F97;
    LDA.W Enemy.ID,X                                                     ;A09F9A;
    TAX                                                                  ;A09F9D;
    LDA.L EnemyHeaders_hurtAITime,X                                      ;A09F9E;
    AND.W #$00FF                                                         ;A09FA2;
    BNE .main                                                            ;A09FA5;
    LDA.W #$0004                                                         ;A09FA7;

  .main:
    LDX.W EnemyIndex                                                     ;A09FAA;
    STA.W Enemy.flashTimer,X                                             ;A09FAD;
    LDX.W EnemyIndex                                                     ;A09FB0;
    LDX.W EnemyIndex                                                     ;A09FB3;
    STZ.W Enemy.AI,X                                                     ;A09FB6;
    RTL                                                                  ;A09FB9;

  .frozen:
    LDX.W EnemyIndex                                                     ;A09FBA;
    LDA.W #$0004                                                         ;A09FBD;
    STA.W Enemy.AI,X                                                     ;A09FC0;
    RTL                                                                  ;A09FC3;


;;; $9FC4: Enemy grapple death ;;;
GrappleAI_EnemyGrappleDeath:
    LDX.W EnemyIndex                                                     ;A09FC4;
    LDX.W EnemyIndex                                                     ;A09FC7;
    LDA.W #$0004                                                         ;A09FCA;
    STA.L EnemyTileData+2,X                                              ;A09FCD;
    LDA.W #$0000                                                         ;A09FD1;
    JSL.L EnemyDeath                                                     ;A09FD4;
    LDX.W EnemyIndex                                                     ;A09FD8;
    STZ.W Enemy.AI,X                                                     ;A09FDB;
    RTL                                                                  ;A09FDE;


;;; $9FDF: Switch to frozen AI ;;;
GrappleAI_SwitchToFrozenAI:
    LDX.W EnemyIndex                                                     ;A09FDF;
    LDA.W #$0004                                                         ;A09FE2;
    STA.W Enemy.AI,X                                                     ;A09FE5;
    RTL                                                                  ;A09FE8;


;;; $9FE9: Samus latches on with grapple - no invincibility ;;;
GrappleAI_SamusLatchesOnWithGrapple_NoInvincibility:
    LDX.W EnemyIndex                                                     ;A09FE9;
    LDA.W Enemy.freezeTimer,X                                            ;A09FEC;
    BNE .frozen                                                          ;A09FEF;
    LDX.W EnemyIndex                                                     ;A09FF1;
    LDA.W Enemy.ID,X                                                     ;A09FF4;
    TAX                                                                  ;A09FF7;
    LDA.L EnemyHeaders_mainAI,X                                          ;A09FF8;
    STA.W EnemyAIPointer                                                 ;A09FFC;
    PHB                                                                  ;A09FFF;
    JSL.L .executeAI                                                     ;A0A000;
    PLB                                                                  ;A0A004;
    LDX.W EnemyIndex                                                     ;A0A005;
    LDA.W Enemy.XPosition,X                                              ;A0A008;
    STA.W GrappleBeam_EndXPosition                                       ;A0A00B;
    LDA.W Enemy.YPosition,X                                              ;A0A00E;
    STA.W GrappleBeam_EndYPosition                                       ;A0A011;
    STZ.W Enemy.AI,X                                                     ;A0A014;
    RTL                                                                  ;A0A017;

  .executeAI:
    LDX.W EnemyIndex                                                     ;A0A018;
    LDA.W Enemy.bank,X                                                   ;A0A01B;
    STA.W EnemyAIPointer+2                                               ;A0A01E;
    XBA                                                                  ;A0A021;
    PHA                                                                  ;A0A022;
    PLB                                                                  ;A0A023;
    PLB                                                                  ;A0A024;
    JML.W [EnemyAIPointer]                                               ;A0A025;

  .frozen:
    LDX.W EnemyIndex                                                     ;A0A028;
    LDA.W Enemy.XPosition,X                                              ;A0A02B;
    STA.W GrappleBeam_EndXPosition                                       ;A0A02E;
    LDA.W Enemy.YPosition,X                                              ;A0A031;
    STA.W GrappleBeam_EndYPosition                                       ;A0A034;
    LDA.W #$0004                                                         ;A0A037;
    STA.W Enemy.AI,X                                                     ;A0A03A;
    RTL                                                                  ;A0A03D;


;;; $A03E: Samus latches on with grapple - paralyse enemy ;;;
GrappleAI_SamusLatchesOnWithGrapple_ParalyzeEnemy:
    LDX.W EnemyIndex                                                     ;A0A03E;
    LDX.W EnemyIndex                                                     ;A0A041;
    LDA.W Enemy.ID,X                                                     ;A0A044;
    TAX                                                                  ;A0A047;
    LDA.L EnemyHeaders_hurtAITime,X                                      ;A0A048;
    AND.W #$00FF                                                         ;A0A04C;
    BNE +                                                                ;A0A04F;
    LDA.W #$0004                                                         ;A0A051;

+   LDX.W EnemyIndex                                                     ;A0A054;
    STA.W Enemy.flashTimer,X                                             ;A0A057;
    LDX.W EnemyIndex                                                     ;A0A05A;
    LDX.W EnemyIndex                                                     ;A0A05D;
    STZ.W Enemy.AI,X                                                     ;A0A060;
    LDX.W EnemyIndex                                                     ;A0A063;
    LDA.W Enemy.properties2,X                                            ;A0A066;
    ORA.W #$0001                                                         ;A0A069;
    STA.W Enemy.properties2,X                                            ;A0A06C;
    RTL                                                                  ;A0A06F;


;;; $A070: Switch to frozen AI ;;;
GrappleAI_SwitchToFrozenAI_duplicate:
; Clone of GrappleAI_SwitchToFrozenAI
    LDX.W EnemyIndex                                                     ;A0A070;
    LDA.W #$0004                                                         ;A0A073;
    STA.W Enemy.AI,X                                                     ;A0A076;
    RTL                                                                  ;A0A079;


;;; $A07A: Enemy / Samus collision handling ;;;
Enemy_vs_Samus_CollisionHandling:
; $A091 is the cause of screw attack cancelling invincibility (need to check $9A8B too)
; Not the cause of crystal flash insta-death, that would be $90:D6D6
    PHB                                                                  ;A0A07A;
    REP #$30                                                             ;A0A07B;
    PEA.W EnemyHeaders>>8&$FF00                                          ;A0A07D;
    PLB                                                                  ;A0A080;
    PLB                                                                  ;A0A081;
    LDA.W #$0009                                                         ;A0A082;
    STA.L EnemyProcessingStage                                           ;A0A085;
    LDY.W EnemyIndex                                                     ;A0A089;
    LDA.W Enemy.spritemap,Y                                              ;A0A08C;
    BEQ .return                                                          ;A0A08F;
    LDA.W ContactDamageIndex                                             ;A0A091;
    BEQ .normalContactDamage                                             ;A0A094;
    STZ.W SamusInvincibilityTimer                                        ;A0A096;
    BRA .tangible                                                        ;A0A099;

  .normalContactDamage:
    LDA.W SamusInvincibilityTimer                                        ;A0A09B;
    BEQ .tangible                                                        ;A0A09E;
    LDX.W EnemyIndex                                                     ;A0A0A0;
    LDA.W Enemy.ID,X                                                     ;A0A0A3;
    CMP.W #EnemyHeaders_Respawn                                          ;A0A0A6;
    BNE .return                                                          ;A0A0A9;
    LDA.L EnemyTileData,X                                                ;A0A0AB;
    BEQ .return                                                          ;A0A0AF;
    CMP.W #$0008                                                         ;A0A0B1;
    BNE .tangible                                                        ;A0A0B4;

  .return:
    PLB                                                                  ;A0A0B6;
    RTS                                                                  ;A0A0B7;

  .tangible:
    LDX.W EnemyIndex                                                     ;A0A0B8;
    LDY.W Enemy.ID,X                                                     ;A0A0BB;
    LDA.W $0030,Y                                                        ;A0A0BE;
    CMP.W #RTL_A0804C                                                    ;A0A0C1;
    BEQ ..return                                                         ;A0A0C4;
    CMP.W #RTS_A0804B                                                    ;A0A0C6;
    BNE .hasTouchAI                                                      ;A0A0C9;

  ..return:
    PLB                                                                  ;A0A0CB;
    RTS                                                                  ;A0A0CC;

  .hasTouchAI:
    LDX.W EnemyIndex                                                     ;A0A0CD;
    LDA.W SamusXPosition                                                 ;A0A0D0;
    SEC                                                                  ;A0A0D3;
    SBC.W Enemy.XPosition,X                                              ;A0A0D4;
    BPL +                                                                ;A0A0D7;
    EOR.W #$FFFF                                                         ;A0A0D9;
    INC                                                                  ;A0A0DC;

+   SEC                                                                  ;A0A0DD;
    SBC.W SamusXRadius                                                   ;A0A0DE;
    BCC ..Y                                                              ;A0A0E1;
    CMP.W Enemy.XHitboxRadius,X                                          ;A0A0E3;
    BCS ..return                                                         ;A0A0E6;

  ..Y:
    LDA.W SamusYPosition                                                 ;A0A0E8;
    SEC                                                                  ;A0A0EB;
    SBC.W Enemy.YPosition,X                                              ;A0A0EC;
    BPL +                                                                ;A0A0EF;
    EOR.W #$FFFF                                                         ;A0A0F1;
    INC                                                                  ;A0A0F4;

+   SEC                                                                  ;A0A0F5;
    SBC.W SamusYRadius                                                   ;A0A0F6;
    BCC +                                                                ;A0A0F9;
    CMP.W Enemy.YHitboxRadius,X                                          ;A0A0FB;
    BCC +                                                                ;A0A0FE;

  ..return:
    PLB                                                                  ;A0A100;
    RTS                                                                  ;A0A101;

+   LDX.W EnemyIndex                                                     ;A0A102;
    LDA.W Enemy.spritemap,X                                              ;A0A105;
    ASL                                                                  ;A0A108;
    STA.B DP_Temp14                                                      ;A0A109;
    LDX.W EnemyIndex                                                     ;A0A10B;
    LDA.W Enemy.ID,X                                                     ;A0A10E;
    CMP.W #EnemyHeaders_Respawn                                          ;A0A111;
    BEQ .gotoExecuteEnemyTouch                                           ;A0A114;
    LDY.W EnemyIndex                                                     ;A0A116;
    LDA.W Enemy.freezeTimer,Y                                            ;A0A119;
    BEQ .gotoExecuteEnemyTouch                                           ;A0A11C;
    PLB                                                                  ;A0A11E;
    RTS                                                                  ;A0A11F;

  .gotoExecuteEnemyTouch:
    JSL.L .executeEnemyTouch                                             ;A0A120;
    PLB                                                                  ;A0A124;
    RTS                                                                  ;A0A125;

  .executeEnemyTouch:
; Execute enemy touch
    LDY.W EnemyIndex                                                     ;A0A126;
    LDA.W Enemy.bank,Y                                                   ;A0A129;
    XBA                                                                  ;A0A12C;
    PHA                                                                  ;A0A12D;
    PLB                                                                  ;A0A12E;
    PLB                                                                  ;A0A12F;
    LDX.W Enemy.ID,Y                                                     ;A0A130;
    LDA.L EnemyHeaders_enemyTouch,X                                      ;A0A133;
    STA.W EnemyAIPointer                                                 ;A0A137;
    LDA.W Enemy.bank,Y                                                   ;A0A13A;
    STA.W EnemyAIPointer+2                                               ;A0A13D;
    JML.W [EnemyAIPointer]                                               ;A0A140;


;;; $A143: Enemy / projectile collision handling ;;;
Enemy_vs_ProjectileCollisionHandling:
    PHB                                                                  ;A0A143;
    LDX.W EnemyIndex                                                     ;A0A144;
    LDA.W Enemy.bank,X                                                   ;A0A147;
    STA.W EnemyAIPointer+2                                               ;A0A14A;
    XBA                                                                  ;A0A14D;
    PHA                                                                  ;A0A14E;
    PLB                                                                  ;A0A14F;
    PLB                                                                  ;A0A150;
    LDA.W #$0007                                                         ;A0A151;
    STA.L EnemyProcessingStage                                           ;A0A154;
    LDA.W SamusProjectile_ProjectileCounter                              ;A0A158;
    BNE .nonZeroCounter                                                  ;A0A15B;

  .returnUpper:
    PLB                                                                  ;A0A15D;
    RTS                                                                  ;A0A15E;

  .nonZeroCounter:
    LDY.W EnemyIndex                                                     ;A0A15F;
    LDA.W Enemy.spritemap,Y                                              ;A0A162;
    BEQ .returnUpper                                                     ;A0A165;
    CMP.W #Spritemap_Common_Nothing                                      ;A0A167;
    BEQ .returnUpper                                                     ;A0A16A;
    LDA.W Enemy.properties,Y                                             ;A0A16C;
    BIT.W #$0400                                                         ;A0A16F;
    BNE .returnUpper                                                     ;A0A172;
    LDA.W Enemy.ID,Y                                                     ;A0A174;
    CMP.W #EnemyHeaders_Respawn                                          ;A0A177;
    BEQ .returnUpper                                                     ;A0A17A;
    LDA.W Enemy.invincibilityTimer,Y                                     ;A0A17C;
    BNE .returnUpper                                                     ;A0A17F;
    STZ.W CollisionIndex                                                 ;A0A181;

  .loop:
    LDX.W EnemyIndex                                                     ;A0A184;
    LDA.W CollisionIndex                                                 ;A0A187;
    ASL                                                                  ;A0A18A;
    TAY                                                                  ;A0A18B;
    LDA.W SamusProjectile_Types,Y                                        ;A0A18C;
    BEQ .gotoNextProjectile                                              ;A0A18F;
    AND.W #$0F00                                                         ;A0A191;
    CMP.W #$0300                                                         ;A0A194;
    BEQ .gotoNextProjectile                                              ;A0A197;
    CMP.W #$0500                                                         ;A0A199;
    BEQ .gotoNextProjectile                                              ;A0A19C;
    CMP.W #$0700                                                         ;A0A19E;
    BMI .validProjectile                                                 ;A0A1A1;

  .gotoNextProjectile:
    JMP.W .nextProjectile                                                ;A0A1A3;

  .validProjectile:
    LDA.W SamusProjectile_XPositions,Y                                   ;A0A1A6;
    SEC                                                                  ;A0A1A9;
    SBC.W Enemy.XPosition,X                                              ;A0A1AA;
    BPL +                                                                ;A0A1AD;
    EOR.W #$FFFF                                                         ;A0A1AF;
    INC                                                                  ;A0A1B2;

+   SEC                                                                  ;A0A1B3;
    SBC.W SamusProjectile_XRadii,Y                                       ;A0A1B4;
    BCC .Y                                                               ;A0A1B7;
    CMP.W Enemy.XHitboxRadius,X                                          ;A0A1B9;
    BCS .nextProjectile                                                  ;A0A1BC;

  .Y:
    LDA.W SamusProjectile_YPositions,Y                                   ;A0A1BE;
    SEC                                                                  ;A0A1C1;
    SBC.W Enemy.YPosition,X                                              ;A0A1C2;
    BPL +                                                                ;A0A1C5;
    EOR.W #$FFFF                                                         ;A0A1C7;
    INC                                                                  ;A0A1CA;

+   SEC                                                                  ;A0A1CB;
    SBC.W SamusProjectile_YRadii,Y                                       ;A0A1CC;
    BCC .checkSuper                                                      ;A0A1CF;
    CMP.W Enemy.YHitboxRadius,X                                          ;A0A1D1;
    BCC .checkSuper                                                      ;A0A1D4;
    BRA .nextProjectile                                                  ;A0A1D6;

  .checkSuper:
    LDA.W SamusProjectile_Types,Y                                        ;A0A1D8;
    AND.W #$0F00                                                         ;A0A1DB;
    CMP.W #$0200                                                         ;A0A1DE;
    BNE .checkPlasma                                                     ;A0A1E1;
    LDA.W #$001E                                                         ;A0A1E3;
    STA.W EarthquakeTimer                                                ;A0A1E6;
    LDA.W #$0012                                                         ;A0A1E9;
    STA.W EarthquakeType                                                 ;A0A1EC;

  .checkPlasma:
    LDA.W CollisionIndex                                                 ;A0A1EF;
    ASL                                                                  ;A0A1F2;
    TAY                                                                  ;A0A1F3;
    LDX.W EnemyIndex                                                     ;A0A1F4;
    LDA.W Enemy.properties,X                                             ;A0A1F7;
    BIT.W #$1000                                                         ;A0A1FA;
    BNE .delete                                                          ;A0A1FD;
    LDA.W SamusProjectile_Types,Y                                        ;A0A1FF;
    BIT.W #$0008                                                         ;A0A202;
    BNE .noDelete                                                        ;A0A205;

  .delete:
    LDA.W SamusProjectile_Directions,Y                                   ;A0A207;
    ORA.W #$0010                                                         ;A0A20A;
    STA.W SamusProjectile_Directions,Y                                   ;A0A20D;

  .noDelete:
    JSL.L .executeEnemyShot                                              ;A0A210;
    BRA .returnLower                                                     ;A0A214;

  .nextProjectile:
    INC.W CollisionIndex                                                 ;A0A216;
    LDA.W CollisionIndex                                                 ;A0A219;
    CMP.W #$0005                                                         ;A0A21C;
    BEQ .returnLower                                                     ;A0A21F;
    JMP.W .loop                                                          ;A0A221;

  .returnLower:
    PLB                                                                  ;A0A224;
    RTS                                                                  ;A0A225;

  .executeEnemyShot:
; Execute enemy shot
    LDY.W EnemyIndex                                                     ;A0A226;
    LDX.W Enemy.ID,Y                                                     ;A0A229;
    LDA.L EnemyHeaders_enemyShot,X                                       ;A0A22C;
    STA.W EnemyAIPointer                                                 ;A0A230;
    JML.W [EnemyAIPointer]                                               ;A0A233;


;;; $A236: Enemy / bomb collision handling ;;;
Enemy_vs_Bomb_CollisionHandling:
    PHB                                                                  ;A0A236;
    LDX.W EnemyIndex                                                     ;A0A237;
    LDA.W Enemy.bank,X                                                   ;A0A23A;
    STA.W EnemyAIPointer+2                                               ;A0A23D;
    XBA                                                                  ;A0A240;
    PHA                                                                  ;A0A241;
    PLB                                                                  ;A0A242;
    PLB                                                                  ;A0A243;
    LDA.W #$0008                                                         ;A0A244;
    STA.L EnemyProcessingStage                                           ;A0A247;
    LDA.W SamusProjectile_BombCounter                                    ;A0A24B;
    BNE .nonZeroCounter                                                  ;A0A24E;

  .returnUpper:
    PLB                                                                  ;A0A250;
    RTS                                                                  ;A0A251;

  .nonZeroCounter:
    LDY.W EnemyIndex                                                     ;A0A252;
    LDA.W Enemy.spritemap,Y                                              ;A0A255;
    BEQ .returnUpper                                                     ;A0A258;
    LDY.W EnemyIndex                                                     ;A0A25A;
    LDA.W Enemy.invincibilityTimer,Y                                     ;A0A25D;
    BNE .returnUpper                                                     ;A0A260;
    LDA.W Enemy.ID,Y                                                     ;A0A262;
    CMP.W #EnemyHeaders_Respawn                                          ;A0A265;
    BEQ .returnUpper                                                     ;A0A268;
    LDA.W #$0005                                                         ;A0A26A;
    STA.W CollisionIndex                                                 ;A0A26D;

  .loop:
    LDX.W EnemyIndex                                                     ;A0A270;
    LDA.W CollisionIndex                                                 ;A0A273;
    ASL                                                                  ;A0A276;
    TAY                                                                  ;A0A277;
    LDA.W SamusProjectile_Types,Y                                        ;A0A278;
    BNE .projectileType                                                  ;A0A27B;
    JMP.W .next                                                          ;A0A27D;

  .projectileType:
    LDA.W SamusProjectile_Variables,Y                                    ;A0A280;
    BNE .next                                                            ;A0A283;
    LDA.W SamusProjectile_Types,Y                                        ;A0A285;
    AND.W #$0F00                                                         ;A0A288;
    CMP.W #$0500                                                         ;A0A28B;
    BEQ .bomb                                                            ;A0A28E;
    LDA.W SamusProjectile_Types,Y                                        ;A0A290;
    BIT.W #$8000                                                         ;A0A293;
    BNE .bomb                                                            ;A0A296;
    JMP.W .next                                                          ;A0A298;

  .bomb:
    LDA.W SamusProjectile_XPositions,Y                                   ;A0A29B;
    SEC                                                                  ;A0A29E;
    SBC.W Enemy.XPosition,X                                              ;A0A29F;
    BPL +                                                                ;A0A2A2;
    EOR.W #$FFFF                                                         ;A0A2A4;
    INC                                                                  ;A0A2A7;

+   SEC                                                                  ;A0A2A8;
    SBC.W SamusProjectile_XRadii,Y                                       ;A0A2A9;
    BCC .Y                                                               ;A0A2AC;
    CMP.W Enemy.XHitboxRadius,X                                          ;A0A2AE;
    BCS .next                                                            ;A0A2B1;

  .Y:
    LDA.W SamusProjectile_YPositions,Y                                   ;A0A2B3;
    SEC                                                                  ;A0A2B6;
    SBC.W Enemy.YPosition,X                                              ;A0A2B7;
    BPL +                                                                ;A0A2BA;
    EOR.W #$FFFF                                                         ;A0A2BC;
    INC                                                                  ;A0A2BF;

+   SEC                                                                  ;A0A2C0;
    SBC.W SamusProjectile_YRadii,Y                                       ;A0A2C1;
    BCC +                                                                ;A0A2C4;
    CMP.W Enemy.YHitboxRadius,X                                          ;A0A2C6;
    BCC +                                                                ;A0A2C9;
    BRA .next                                                            ;A0A2CB;


+   LDA.W CollisionIndex                                                 ;A0A2CD;
    ASL                                                                  ;A0A2D0;
    TAY                                                                  ;A0A2D1;
    LDA.W SamusProjectile_Variables,Y                                    ;A0A2D2;
    BNE .next                                                            ;A0A2D5;
    LDA.W SamusProjectile_Directions,Y                                   ;A0A2D7;
    ORA.W #$0010                                                         ;A0A2DA;
    STA.W SamusProjectile_Directions,Y                                   ;A0A2DD;
    JSL.L .executeEnemyShot                                              ;A0A2E0;
    BRA .returnLower                                                     ;A0A2E4;

  .next:
    INC.W CollisionIndex                                                 ;A0A2E6;
    LDA.W CollisionIndex                                                 ;A0A2E9;
    CMP.W #$000A                                                         ;A0A2EC;
    BEQ .returnLower                                                     ;A0A2EF;
    JMP.W .loop                                                          ;A0A2F1;

  .returnLower:
    PLB                                                                  ;A0A2F4;
    RTS                                                                  ;A0A2F5;

  .executeEnemyShot:
; Execute enemy shot
    LDY.W EnemyIndex                                                     ;A0A2F6;
    LDX.W Enemy.ID,Y                                                     ;A0A2F9;
    LDA.L EnemyHeaders_enemyShot,X                                       ;A0A2FC;
    STA.W EnemyAIPointer                                                 ;A0A300;
    JML.W [EnemyAIPointer]                                               ;A0A303;


;;; $A306: Process enemy power bomb interaction ;;;
Process_Enemy_PowerBomb_Interaction:
; This routine is relying on $12 and $14 (the calculated power bomb explosion radius) not being modified over the course of the loop(!)
; This doesn't hold true if an enemy is killed by the power bomb (see e.g. $A3E6) >_>;
; For respawning enemies, $12 = 4000h in their enemy death, making power bombs effectively infinite wide for the remaining enemies that frame
; For non-respawning enemies, $12 = 0 in their enemy death, making power bombs effectively zero sized for the remaining enemies that frame
    PHB                                                                  ;A0A306;
    LDA.W #$0005                                                         ;A0A307;
    STA.L EnemyProcessingStage                                           ;A0A30A;
    LDA.W SamusProjectile_PowerBombExplosionRadius+1                     ;A0A30E;
    AND.W #$00FF                                                         ;A0A311;
    STA.B DP_Temp12                                                      ;A0A314;
    BNE .hasRadius                                                       ;A0A316;
    PLB                                                                  ;A0A318;
    RTL                                                                  ;A0A319;

  .hasRadius:
    LSR                                                                  ;A0A31A;
    ADC.B DP_Temp12                                                      ;A0A31B;
    LSR                                                                  ;A0A31D;
    STA.B DP_Temp14                                                      ;A0A31E;
    LDA.W #$07C0                                                         ;A0A320;
    STA.W EnemyIndex                                                     ;A0A323;

  .loop:
    LDX.W EnemyIndex                                                     ;A0A326;
    LDA.W Enemy.invincibilityTimer,X                                     ;A0A329;
    BNE .next                                                            ;A0A32C;
    LDA.W Enemy.ID,X                                                     ;A0A32E;
    BEQ .next                                                            ;A0A331;
    CMP.W #EnemyHeaders_Respawn                                          ;A0A333;
    BEQ .next                                                            ;A0A336;
    TAX                                                                  ;A0A338;
    LDA.L EnemyHeaders_vulnerabilities,X                                 ;A0A339;
    BNE +                                                                ;A0A33D;
    LDA.W #EnemyVulnerabilities_Default                                  ;A0A33F;

+   TAX                                                                  ;A0A342;
    LDA.L EnemyVulnerabilities_powerBomb,X                               ;A0A343;
    AND.W #$007F                                                         ;A0A347;
    BEQ .next                                                            ;A0A34A;
    LDX.W EnemyIndex                                                     ;A0A34C;
    LDA.W SamusProjectile_PowerBombExplosionXPosition                    ;A0A34F;
    SEC                                                                  ;A0A352;
    SBC.W Enemy.XPosition,X                                              ;A0A353;
    BPL +                                                                ;A0A356;
    EOR.W #$FFFF                                                         ;A0A358;
    INC                                                                  ;A0A35B;

+   CMP.B DP_Temp12                                                      ;A0A35C;
    BCS .next                                                            ;A0A35E;
    LDA.W SamusProjectile_PowerBombExplosionYPosition                    ;A0A360;
    SEC                                                                  ;A0A363;
    SBC.W Enemy.YPosition,X                                              ;A0A364;
    BPL +                                                                ;A0A367;
    EOR.W #$FFFF                                                         ;A0A369;
    INC                                                                  ;A0A36C;

+   CMP.B DP_Temp14                                                      ;A0A36D;
    BCS .next                                                            ;A0A36F;
    LDA.W Enemy.ID,X                                                     ;A0A371;
    TAX                                                                  ;A0A374;
    LDA.L EnemyHeaders_powerBombReaction,X                               ;A0A375;
    BNE .enemyAI                                                         ;A0A379;
    LDA.W #Common_NormalEnemyPowerBombAI                                 ;A0A37B;

  .enemyAI:
    STA.W EnemyAIPointer                                                 ;A0A37E;
    JSL.L .executeEnemyAI                                                ;A0A381;
    LDX.W EnemyIndex                                                     ;A0A385;
    LDA.W Enemy.properties,X                                             ;A0A388;
    ORA.W #$0800                                                         ;A0A38B;
    STA.W Enemy.properties,X                                             ;A0A38E;

  .next:
    LDA.W EnemyIndex                                                     ;A0A391;
    SEC                                                                  ;A0A394;
    SBC.W #$0040                                                         ;A0A395;
    STA.W EnemyIndex                                                     ;A0A398;
    BPL .loop                                                            ;A0A39B;
    PLB                                                                  ;A0A39D;
    RTL                                                                  ;A0A39E;

  .executeEnemyAI:
; Execute enemy AI
    LDX.W EnemyIndex                                                     ;A0A39F;
    LDA.W Enemy.bank,X                                                   ;A0A3A2;
    STA.W EnemyAIPointer+2                                               ;A0A3A5;
    XBA                                                                  ;A0A3A8;
    PHA                                                                  ;A0A3A9;
    PLB                                                                  ;A0A3AA;
    PLB                                                                  ;A0A3AB;
    JML.W [EnemyAIPointer]                                               ;A0A3AC;


;;; $A3AF: Enemy death ;;;
EnemyDeath:
;; Parameter:
;;     A: Death animation. Range 0..4
;;         0: Small explosion. Used by grapple killed, power bomb killed, refill candy, fire pillar, boulder, creepy crawlies, skree, Norfair fireball, fireflea, waver, rinka, polyp, fly, owtch, puyo, boyon, zebetite, bang
;;         1: Killed by Samus contact. Also used by bang
;;         2: Normal explosion. Used by super missile killed default, atomic / robot / ghost, bull / floater / oum / yard / fish, fune, sidehopper, desgeega, mochtroid, slug, sciser, metaree, chute, rio, squeept, rio, cacatac
;;         3: Fake Kraid explosion
;;         4: Big explosion. Used by space pirates, Shaktool, ki-hunter, dragon, kago, yapping maw, evir, metroid, super-sidehopper/desgeega, tatori
    PHP                                                                  ;A0A3AF;
    PHB                                                                  ;A0A3B0;
    PEA.W EnemyDeath>>8&$FF00                                            ;A0A3B1;
    PLB                                                                  ;A0A3B4;
    PLB                                                                  ;A0A3B5;
    REP #$30                                                             ;A0A3B6;
    PHA                                                                  ;A0A3B8;
    LDA.W Enemy.AI,X                                                     ;A0A3B9;
    CMP.W #$0001                                                         ;A0A3BC;
    BNE .checkA                                                          ;A0A3BF;
    LDA.W #GrappleBeamFunction_Dropped                                   ;A0A3C1;
    STA.W GrappleBeam_Function                                           ;A0A3C4;

  .checkA:
    PLA                                                                  ;A0A3C7;
    CMP.W #$0005                                                         ;A0A3C8;
    BMI .AIsValid                                                        ;A0A3CB;
    LDA.W #$0000                                                         ;A0A3CD;

  .AIsValid:
    STA.W Temp_DeathExplosionType                                        ;A0A3D0;
    LDX.W EnemyIndex                                                     ;A0A3D3;
    LDY.W #EnemyProjectile_EnemyDeathExplosion                           ;A0A3D6;
    LDA.W Temp_DeathExplosionType                                        ;A0A3D9;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A0A3DC;
    LDA.W Enemy.properties,X                                             ;A0A3E0;
    AND.W #$4000                                                         ;A0A3E3;
    STA.B DP_Temp12                                                      ;A0A3E6;
    LDY.W #$003E                                                         ;A0A3E8;
    LDX.W EnemyIndex                                                     ;A0A3EB;

  .loopClearEnemySlot:
    STZ.W Enemy.ID,X                                                     ;A0A3EE;
    INX                                                                  ;A0A3F1;
    INX                                                                  ;A0A3F2;
    DEY                                                                  ;A0A3F3;
    DEY                                                                  ;A0A3F4;
    BPL .loopClearEnemySlot                                              ;A0A3F5;
    LDA.B DP_Temp12                                                      ;A0A3F7;
    BEQ .incEnemiesKilled                                                ;A0A3F9;
    LDX.W EnemyIndex                                                     ;A0A3FB;
    LDA.W #EnemyHeaders_Respawn                                          ;A0A3FE;
    STA.W Enemy.ID,X                                                     ;A0A401;
    LDA.W #$00A3                                                         ;A0A404;
    STA.W Enemy.bank,X                                                   ;A0A407;

  .incEnemiesKilled:
    INC.W NumberOfEnemiesKilled                                          ;A0A40A;
    PLB                                                                  ;A0A40D;
    PLP                                                                  ;A0A40E;
    RTL                                                                  ;A0A40F;


;;; $A410: Rinka death ;;;
RinkaDeath:
;; Parameter:
;;     A: Death animation. Range 0..4
;;         0/3/4: Small explosion
;;         1: Killed by Samus contact
;;         2: Normal explosion
    PHP                                                                  ;A0A410;
    PHB                                                                  ;A0A411;
    PEA.W RinkaDeath>>8&$FF00                                            ;A0A412;
    PLB                                                                  ;A0A415;
    PLB                                                                  ;A0A416;
    REP #$30                                                             ;A0A417;
    CMP.W #$0003                                                         ;A0A419;
    BMI .AIsValid                                                        ;A0A41C;
    LDA.W #$0000                                                         ;A0A41E;

  .AIsValid:
    STA.W Temp_DeathExplosionType                                        ;A0A421;
    LDX.W EnemyIndex                                                     ;A0A424;
    LDY.W #EnemyProjectile_EnemyDeathExplosion                           ;A0A427;
    LDA.W Temp_DeathExplosionType                                        ;A0A42A;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A0A42D;
    LDA.W Enemy.properties,X                                             ;A0A431;
    AND.W #$4000                                                         ;A0A434;
    STA.B DP_Temp12                                                      ;A0A437;
    LDY.W #$003E                                                         ;A0A439;
    LDX.W EnemyIndex                                                     ;A0A43C;

  .loopClearEnemySlot:
    STZ.W Enemy.ID,X                                                     ;A0A43F;
    INX                                                                  ;A0A442;
    INX                                                                  ;A0A443;
    DEY                                                                  ;A0A444;
    DEY                                                                  ;A0A445;
    BPL .loopClearEnemySlot                                              ;A0A446;
    LDA.B DP_Temp12                                                      ;A0A448;
    BEQ .return                                                          ;A0A44A;
    LDX.W EnemyIndex                                                     ;A0A44C;
    LDA.W #EnemyHeaders_Respawn                                          ;A0A44F;
    STA.W Enemy.ID,X                                                     ;A0A452;
    LDA.W #$00A3                                                         ;A0A455;
    STA.W Enemy.bank,X                                                   ;A0A458;

  .return:
    PLB                                                                  ;A0A45B;
    PLP                                                                  ;A0A45C;
    RTL                                                                  ;A0A45D;


;;; $A45E: Suit damage division ;;;
Suit_Damage_Division:
;; Parameter:
;;     A: Damage
;; Returns:
;;     A/$12: Damage divided by 1/2/4 if power/varia/gravity suit equipped
    STA.B DP_Temp12                                                      ;A0A45E;
    LDA.W $09A2                                                          ;A0A460;
    BIT.W #$0020                                                         ;A0A463;
    BNE .quarterDamage                                                   ;A0A466;
    LSR                                                                  ;A0A468;
    BCC .fullDamage                                                      ;A0A469;
    LSR.B DP_Temp12                                                      ;A0A46B;

  .fullDamage:
    LDA.B DP_Temp12                                                      ;A0A46D;
    RTL                                                                  ;A0A46F;

  .quarterDamage:
    LSR.B DP_Temp12                                                      ;A0A470; >.< LDA $12 : LSR #2 : STA $12
    LSR.B DP_Temp12                                                      ;A0A472;
    LDA.B DP_Temp12                                                      ;A0A474;
    RTL                                                                  ;A0A476;


;;; $A477: Normal enemy touch AI ;;;
NormalEnemyTouchAI:
    LDX.W EnemyIndex                                                     ;A0A477;
    JSR.W NormalEnemyTouchAI_NoDeathCheck                                ;A0A47A;
    LDX.W EnemyIndex                                                     ;A0A47D;
    LDA.W Enemy.health,X                                                 ;A0A480;
    BNE .return                                                          ;A0A483;
    LDA.W #$0006                                                         ;A0A485;
    STA.L EnemyTileData+2,X                                              ;A0A488;
    LDA.W #$0001                                                         ;A0A48C;
    JSL.L EnemyDeath                                                     ;A0A48F;

  .return:
    LDX.W EnemyIndex                                                     ;A0A493;
    RTL                                                                  ;A0A496;


;;; $A497: Normal enemy touch AI - no death check (external) ;;;
NormalEnemyTouchAI_NoDeathCheck_External:
    LDX.W EnemyIndex                                                     ;A0A497;
    JSR.W NormalEnemyTouchAI_NoDeathCheck                                ;A0A49A;
    LDX.W EnemyIndex                                                     ;A0A49D;
    RTL                                                                  ;A0A4A0;


;;; $A4A1: Normal enemy touch AI - no death check ;;;
NormalEnemyTouchAI_NoDeathCheck:
; Damage values:
;     Speed boosting:      $A4AF
;     Shinesparking:       $A4BA
;     Screw attack:        $A4C2
;     Pseudo screw attack: $A4CC
    LDA.W ContactDamageIndex                                             ;A0A4A1;
    BNE .notNormal                                                       ;A0A4A4;
    JMP.W .normalSamus                                                   ;A0A4A6;

  .notNormal:
    CLC                                                                  ;A0A4A9;
    ADC.W #$000F                                                         ;A0A4AA;
    STA.B DP_Temp14                                                      ;A0A4AD;
    LDY.W #$01F4                                                         ;A0A4AF;
    LDA.W ContactDamageIndex                                             ;A0A4B2;
    CMP.W #$0001                                                         ;A0A4B5;
    BEQ .damageCalculated                                                ;A0A4B8;
    LDY.W #$012C                                                         ;A0A4BA;
    CMP.W #$0002                                                         ;A0A4BD;
    BEQ .damageCalculated                                                ;A0A4C0;
    LDY.W #$07D0                                                         ;A0A4C2;
    CMP.W #$0003                                                         ;A0A4C5;
    BEQ .damageCalculated                                                ;A0A4C8;
    INC.B DP_Temp14                                                      ;A0A4CA;
    LDY.W #$00C8                                                         ;A0A4CC;
    CMP.W #$0004                                                         ;A0A4CF;
    BNE .defaultDamage                                                   ;A0A4D2;
    LDA.W #$0004                                                         ;A0A4D4;
    JSL.L Run_Samus_Command                                              ;A0A4D7;
    BRA .damageCalculated                                                ;A0A4DB;

  .defaultDamage:
    LDY.W #$00C8                                                         ;A0A4DD;

  .damageCalculated:
    STY.B DP_Temp16                                                      ;A0A4E0;
    LDX.W EnemyIndex                                                     ;A0A4E2;
    LDA.W Enemy.ID,X                                                     ;A0A4E5;
    TAX                                                                  ;A0A4E8;
    LDA.L EnemyHeaders_vulnerabilities,X                                 ;A0A4E9;
    BNE .nonZero                                                         ;A0A4ED;
    LDA.W #EnemyVulnerabilities_Default                                  ;A0A4EF;

  .nonZero:
    CLC                                                                  ;A0A4F2;
    ADC.B DP_Temp14                                                      ;A0A4F3;
    TAX                                                                  ;A0A4F5;
    LDA.L EnemyVulnerabilities_power,X                                   ;A0A4F6;
    STA.W Temp_BeamVulnerability                                         ;A0A4FA;
    AND.W #$007F                                                         ;A0A4FD;
    STA.W Temp_DamageMultiplier                                          ;A0A500;
    BEQ .return                                                          ;A0A503;
    CMP.W #$00FF                                                         ;A0A505;
    BEQ .return                                                          ;A0A508;
    LDA.W Temp_DamageMultiplier                                          ;A0A50A;
    STA.B DP_Temp28                                                      ;A0A50D;
    LDA.B DP_Temp16                                                      ;A0A50F;
    LSR                                                                  ;A0A511;
    STA.B DP_Temp26                                                      ;A0A512;
    JSL.L Multiplication_32bit_A0B6FF                                    ;A0A514;
    LDA.B DP_Temp2A                                                      ;A0A518;
    BEQ .return                                                          ;A0A51A;
    STA.B DP_Temp12                                                      ;A0A51C;
    BRA .damage                                                          ;A0A51E;

  .return:
    RTS                                                                  ;A0A520;

  .damage:
    LDX.W EnemyIndex                                                     ;A0A521;
    LDX.W EnemyIndex                                                     ;A0A524; >_<
    LDA.W Enemy.ID,X                                                     ;A0A527;
    TAX                                                                  ;A0A52A;
    LDA.L EnemyHeaders_hurtAITime,X                                      ;A0A52B;
    AND.W #$00FF                                                         ;A0A52F;
    BNE .hurtTimerNotExpired                                             ;A0A532;
    LDA.W #$0004                                                         ;A0A534;

  .hurtTimerNotExpired:
    LDX.W EnemyIndex                                                     ;A0A537;
    STA.W Enemy.flashTimer,X                                             ;A0A53A;
    LDA.W Enemy.AI,X                                                     ;A0A53D;
    ORA.W #$0002                                                         ;A0A540;
    STA.W Enemy.AI,X                                                     ;A0A543;
    STZ.W SamusInvincibilityTimer                                        ;A0A546;
    STZ.W SamusKnockbackTimer                                            ;A0A549;
    LDA.W Enemy.health,X                                                 ;A0A54C;
    SEC                                                                  ;A0A54F;
    SBC.B DP_Temp12                                                      ;A0A550;
    BPL .storeHealth                                                     ;A0A552;
    LDA.W #$0000                                                         ;A0A554;

  .storeHealth:
    STA.W Enemy.health,X                                                 ;A0A557;
    LDA.W #$000B                                                         ;A0A55A;
    JSL.L QueueSound_Lib2_Max1                                           ;A0A55D;
    RTS                                                                  ;A0A561;

  .normalSamus:
    LDX.W EnemyIndex                                                     ;A0A562;
    LDA.W Enemy.ID,X                                                     ;A0A565;
    TAX                                                                  ;A0A568;
    LDA.L EnemyHeaders_damage,X                                          ;A0A569;
    JSL.L Suit_Damage_Division                                           ;A0A56D;
    JSL.L Deal_A_Damage_to_Samus                                         ;A0A571;
    LDA.W #$0060                                                         ;A0A575;
    STA.W SamusInvincibilityTimer                                        ;A0A578;
    LDA.W #$0005                                                         ;A0A57B;
    STA.W SamusKnockbackTimer                                            ;A0A57E;
    LDY.W #$0000                                                         ;A0A581;
    LDX.W EnemyIndex                                                     ;A0A584;
    LDA.W SamusXPosition                                                 ;A0A587;
    SEC                                                                  ;A0A58A;
    SBC.W Enemy.XPosition,X                                              ;A0A58B;
    BMI .storeKnockbackDirection                                         ;A0A58E;
    LDY.W #$0001                                                         ;A0A590;

  .storeKnockbackDirection:
    STY.W KnockbackXDirection                                            ;A0A593;
    RTS                                                                  ;A0A596;


;;; $A597: Normal enemy power bomb AI ;;;
NormalEnemyPowerBombAI:
    LDX.W EnemyIndex                                                     ;A0A597;
    JSR.W NormalEnemyPowerBombAI_NoDeathCheck                            ;A0A59A;
    LDX.W EnemyIndex                                                     ;A0A59D;
    LDA.W Enemy.health,X                                                 ;A0A5A0;
    BNE .return                                                          ;A0A5A3;
    LDA.W #$0003                                                         ;A0A5A5;
    STA.L EnemyTileData+2,X                                              ;A0A5A8;
    LDA.W #$0000                                                         ;A0A5AC;
    JSL.L EnemyDeath                                                     ;A0A5AF;

  .return:
    LDX.W EnemyIndex                                                     ;A0A5B3;
    RTL                                                                  ;A0A5B6;


;;; $A5B7: Normal enemy power bomb AI - no death check (external) ;;;
NormalEnemyPowerBombAI_NoDeathCheck_External:
; Called by rinka, fake Kraid, Kraid, Draygon, Ridley, Mother Brain
    LDX.W EnemyIndex                                                     ;A0A5B7;
    JSR.W NormalEnemyPowerBombAI_NoDeathCheck                            ;A0A5BA;
    LDX.W EnemyIndex                                                     ;A0A5BD;
    RTL                                                                  ;A0A5C0;


;;; $A5C1: Normal enemy power bomb AI - no death check ;;;
NormalEnemyPowerBombAI_NoDeathCheck:
    LDX.W EnemyIndex                                                     ;A0A5C1;
    LDA.W Enemy.ID,X                                                     ;A0A5C4;
    TAX                                                                  ;A0A5C7;
    LDA.L EnemyHeaders_vulnerabilities,X                                 ;A0A5C8;
    BNE .XNonZero                                                        ;A0A5CC;
    LDA.W #EnemyVulnerabilities_Default                                  ;A0A5CE;

  .XNonZero:
    TAX                                                                  ;A0A5D1;
    LDA.L EnemyVulnerabilities_powerBomb,X                               ;A0A5D2;
    AND.W #$00FF                                                         ;A0A5D6;
    CMP.W #$00FF                                                         ;A0A5D9;
    BEQ .return                                                          ;A0A5DC;
    AND.W #$007F                                                         ;A0A5DE;
    STA.W Temp_DamageMultiplier                                          ;A0A5E1;
    BEQ .return                                                          ;A0A5E4;
    LDA.W #$00C8                                                         ;A0A5E6;
    LSR                                                                  ;A0A5E9;
    STA.B DP_Temp26                                                      ;A0A5EA;
    LDA.W Temp_DamageMultiplier                                          ;A0A5EC;
    STA.B DP_Temp28                                                      ;A0A5EF;
    JSL.L Multiplication_32bit_A0B6FF                                    ;A0A5F1;
    LDA.B DP_Temp2A                                                      ;A0A5F5;
    STA.W EnemySpritemapEntryXPositionDuringCollision                    ;A0A5F7;
    BEQ .return                                                          ;A0A5FA;
    LDX.W EnemyIndex                                                     ;A0A5FC;
    LDA.W #$0030                                                         ;A0A5FF;
    STA.W Enemy.invincibilityTimer,X                                     ;A0A602;
    LDX.W EnemyIndex                                                     ;A0A605;
    LDA.W Enemy.ID,X                                                     ;A0A608;
    TAX                                                                  ;A0A60B;
    LDA.L EnemyHeaders_hurtAITime,X                                      ;A0A60C;
    AND.W #$00FF                                                         ;A0A610;
    BNE .ANonZero                                                        ;A0A613;
    LDA.W #$0004                                                         ;A0A615;

  .ANonZero:
    CLC                                                                  ;A0A618;
    ADC.W #$0008                                                         ;A0A619;
    LDX.W EnemyIndex                                                     ;A0A61C;
    STA.W Enemy.flashTimer,X                                             ;A0A61F;
    LDA.W Enemy.AI,X                                                     ;A0A622;
    ORA.W #$0002                                                         ;A0A625;
    STA.W Enemy.AI,X                                                     ;A0A628;
    LDA.W Enemy.health,X                                                 ;A0A62B;
    SEC                                                                  ;A0A62E;
    SBC.W EnemySpritemapEntryXPositionDuringCollision                    ;A0A62F;
    BEQ .zeroHealth                                                      ;A0A632;
    BCS .storeHealth                                                     ;A0A634;

  .zeroHealth:
    LDA.W #$0000                                                         ;A0A636;

  .storeHealth:
    STA.W Enemy.health,X                                                 ;A0A639;

  .return:
    RTS                                                                  ;A0A63C;


;;; $A63D: Normal enemy shot AI ;;;
NormalEnemyShotAI:
    STZ.W Temp_ShotAIHitFlag                                             ;A0A63D;
    LDX.W EnemyIndex                                                     ;A0A640;
    JSR.W NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic              ;A0A643;
    LDX.W EnemyIndex                                                     ;A0A646;
    LDA.W Temp_ShotAIHitFlag                                             ;A0A649;
    BEQ .notHit                                                          ;A0A64C;
    LDX.W EnemyIndex                                                     ;A0A64E;
    LDA.W Enemy.XPosition,X                                              ;A0A651;
    STA.B DP_Temp12                                                      ;A0A654;
    LDA.W Enemy.YPosition,X                                              ;A0A656;
    STA.B DP_Temp14                                                      ;A0A659;
    LDA.W #$0037                                                         ;A0A65B;
    STA.B DP_Temp16                                                      ;A0A65E;
    STZ.B DP_Temp18                                                      ;A0A660;
    JSL.L Create_Sprite_Object                                           ;A0A662;

  .notHit:
    LDA.W Enemy.health,X                                                 ;A0A666;
    BNE .return                                                          ;A0A669;
    LDA.W CollisionIndex                                                 ;A0A66B;
    ASL                                                                  ;A0A66E;
    TAY                                                                  ;A0A66F;
    LDA.W SamusProjectile_Types,Y                                        ;A0A670;
    XBA                                                                  ;A0A673;
    AND.W #$000F                                                         ;A0A674;
    STA.L EnemyTileData+2,X                                              ;A0A677;
    LDY.W #$0002                                                         ;A0A67B;
    CMP.W #$0002                                                         ;A0A67E;
    BEQ .superMissile                                                    ;A0A681;
    LDA.W Enemy.ID,X                                                     ;A0A683;
    TAX                                                                  ;A0A686;
    LDA.L EnemyHeaders_deathAnimation,X                                  ;A0A687;
    BEQ .deathAnimationInY                                               ;A0A68B;

  .deathAnimationInY:
    TAY                                                                  ;A0A68D;
    BRA .enemyDeath                                                      ;A0A68E;

  .superMissile:
    LDA.W Enemy.ID,X                                                     ;A0A690;
    TAX                                                                  ;A0A693;
    LDA.L EnemyHeaders_deathAnimation,X                                  ;A0A694;
    CMP.W #$0003                                                         ;A0A698;
    BMI .enemyDeath                                                      ;A0A69B;
    TAY                                                                  ;A0A69D;

  .enemyDeath:
    TYA                                                                  ;A0A69E;
    JSL.L EnemyDeath                                                     ;A0A69F;

  .return:
    LDX.W EnemyIndex                                                     ;A0A6A3;
    RTL                                                                  ;A0A6A6;


;;; $A6A7: Normal enemy shot AI - no death check, no enemy shot graphic (external) ;;;
NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External:
    STZ.W Temp_ShotAIHitFlag                                             ;A0A6A7;
    LDX.W EnemyIndex                                                     ;A0A6AA;
    JSR.W NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic              ;A0A6AD;
    LDX.W EnemyIndex                                                     ;A0A6B0;
    RTL                                                                  ;A0A6B3;


;;; $A6B4: Normal enemy shot AI - no death check ;;;
NormalEnemyShotAI_NoDeathCheck:
; Used by Spore Spawn
; Shame it's not used by NormalEnemyShotAI
    STZ.W Temp_ShotAIHitFlag                                             ;A0A6B4;
    LDX.W EnemyIndex                                                     ;A0A6B7;
    JSR.W NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic              ;A0A6BA;
    LDA.W Temp_ShotAIHitFlag                                             ;A0A6BD;
    BEQ .return                                                          ;A0A6C0;
    LDX.W EnemyIndex                                                     ;A0A6C2;
    LDA.W Enemy.XPosition,X                                              ;A0A6C5;
    STA.B DP_Temp12                                                      ;A0A6C8;
    LDA.W Enemy.YPosition,X                                              ;A0A6CA;
    STA.B DP_Temp14                                                      ;A0A6CD;
    LDA.W #$0037                                                         ;A0A6CF;
    STA.B DP_Temp16                                                      ;A0A6D2;
    STZ.B DP_Temp18                                                      ;A0A6D4;
    JSL.L Create_Sprite_Object                                           ;A0A6D6;

  .return:
    LDX.W EnemyIndex                                                     ;A0A6DA;
    RTL                                                                  ;A0A6DD;


;;; $A6DE: Normal enemy shot AI - no death check, no enemy shot graphic ;;;
NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic:
; Vulnerability format:
;     v = f000dddd
;     If v = FFh:
;         Freeze, no damage
;     Else:
;         d: Damage multiplier * 2
;         f: Does not freeze
    PHB                                                                  ;A0A6DE;
    LDA.W CollisionIndex                                                 ;A0A6DF;
    ASL                                                                  ;A0A6E2;
    TAX                                                                  ;A0A6E3;
    LDA.W SamusProjectile_Damages,X                                      ;A0A6E4;
    STA.W EnemySpritemapEntryXPositionDuringCollision                    ;A0A6E7;
    LDA.W SamusProjectile_Types,X                                        ;A0A6EA;
    STA.B DP_Temp12                                                      ;A0A6ED;
    PHX                                                                  ;A0A6EF;
    LDX.W EnemyIndex                                                     ;A0A6F0;
    LDA.W Enemy.ID,X                                                     ;A0A6F3;
    TAX                                                                  ;A0A6F6;
    LDA.L EnemyHeaders_vulnerabilities,X                                 ;A0A6F7;
    BNE .nonZero                                                         ;A0A6FB;
    LDA.W #EnemyVulnerabilities_Default                                  ;A0A6FD;

  .nonZero:
    STA.B DP_Temp14                                                      ;A0A700;
    LDA.B DP_Temp12                                                      ;A0A702;
    BIT.W #$0F00                                                         ;A0A704;
    BNE .notBeam                                                         ;A0A707;
    LDA.B DP_Temp12                                                      ;A0A709;
    AND.W #$000F                                                         ;A0A70B;
    CLC                                                                  ;A0A70E;
    ADC.B DP_Temp14                                                      ;A0A70F;
    TAX                                                                  ;A0A711;
    LDA.L EnemyVulnerabilities_power,X                                   ;A0A712;
    AND.W #$00FF                                                         ;A0A716;
    STA.W Temp_BeamVulnerability                                         ;A0A719;
    AND.W #$007F                                                         ;A0A71C;
    STA.W Temp_DamageMultiplier                                          ;A0A71F;
    LDA.W Temp_BeamVulnerability                                         ;A0A722;
    CMP.W #$00FF                                                         ;A0A725;
    BNE .checkCharge                                                     ;A0A728;
    JMP.W .freeze                                                        ;A0A72A;

  .checkCharge:
    LDA.B DP_Temp12                                                      ;A0A72D;
    BIT.W #$0010                                                         ;A0A72F;
    BEQ .calculateDamage                                                 ;A0A732;
    LDX.B DP_Temp14                                                      ;A0A734;
    LDA.L EnemyVulnerabilities_chargedBeam,X                             ;A0A736;
    AND.W #$00FF                                                         ;A0A73A;
    CMP.W #$00FF                                                         ;A0A73D;
    BEQ .noDamage                                                        ;A0A740;
    AND.W #$000F                                                         ;A0A742;
    BEQ .noDamage                                                        ;A0A745;
    STA.W Temp_DamageMultiplier                                          ;A0A747;

  .calculateDamage:
    LDA.W EnemySpritemapEntryXPositionDuringCollision                    ;A0A74A;
    LSR                                                                  ;A0A74D;
    STA.B DP_Temp26                                                      ;A0A74E;
    LDA.W Temp_DamageMultiplier                                          ;A0A750;
    STA.B DP_Temp28                                                      ;A0A753;
    JSL.L Multiplication_32bit_A0B6FF                                    ;A0A755;
    LDA.B DP_Temp2A                                                      ;A0A759;
    BEQ .noDamage                                                        ;A0A75B;
    STA.W EnemySpritemapEntryXPositionDuringCollision                    ;A0A75D;
    JMP.W .damage                                                        ;A0A760;

  .notBeam:
    AND.W #$0F00                                                         ;A0A763;
    CMP.W #$0100                                                         ;A0A766;
    BEQ +                                                                ;A0A769;
    CMP.W #$0200                                                         ;A0A76B;
    BNE .notMissile                                                      ;A0A76E;

+   XBA                                                                  ;A0A770;
    CLC                                                                  ;A0A771;
    ADC.B DP_Temp14                                                      ;A0A772;
    TAX                                                                  ;A0A774;
    LDA.L EnemyVulnerabilities_plasmaIceWave,X                           ;A0A775;
    AND.W #$007F                                                         ;A0A779;
    STA.W Temp_DamageMultiplier                                          ;A0A77C;
    BRA .calculateDamage                                                 ;A0A77F;

  .notMissile:
    CMP.W #$0500                                                         ;A0A781;
    BNE .checkPowerBomb                                                  ;A0A784;
    LDX.B DP_Temp14                                                      ;A0A786;
    LDA.L EnemyVulnerabilities_bomb,X                                    ;A0A788;
    AND.W #$007F                                                         ;A0A78C;
    STA.W Temp_DamageMultiplier                                          ;A0A78F;
    BRA .calculateDamage                                                 ;A0A792;

  .checkPowerBomb:
    CMP.W #$0300                                                         ;A0A794;
    BNE .noDamage                                                        ;A0A797;
    LDX.B DP_Temp14                                                      ;A0A799;
    LDA.L EnemyVulnerabilities_powerBomb,X                               ;A0A79B;
    AND.W #$007F                                                         ;A0A79F;
    STA.W Temp_DamageMultiplier                                          ;A0A7A2;
    JMP.W .calculateDamage                                               ;A0A7A5;

  .noDamage:
    LDA.W CollisionIndex                                                 ;A0A7A8;
    ASL                                                                  ;A0A7AB;
    TAX                                                                  ;A0A7AC;
    LDA.W SamusProjectile_Directions,X                                   ;A0A7AD;
    ORA.W #$0010                                                         ;A0A7B0;
    STA.W SamusProjectile_Directions,X                                   ;A0A7B3;
    LDA.W SamusProjectile_XPositions,X                                   ;A0A7B6;
    STA.B DP_Temp12                                                      ;A0A7B9;
    LDA.W SamusProjectile_YPositions,X                                   ;A0A7BB;
    STA.B DP_Temp14                                                      ;A0A7BE;
    LDA.W #$0006                                                         ;A0A7C0;
    STA.B DP_Temp16                                                      ;A0A7C3;
    STZ.B DP_Temp18                                                      ;A0A7C5;
    JSL.L Create_Sprite_Object                                           ;A0A7C7;
    LDA.W #$003D                                                         ;A0A7CB;
    JSL.L QueueSound_Lib1_Max3                                           ;A0A7CE;
    PLX                                                                  ;A0A7D2;
    PLB                                                                  ;A0A7D3;
    RTS                                                                  ;A0A7D4;

  .freeze:
    LDX.W EnemyIndex                                                     ;A0A7D5;
    LDA.W Enemy.freezeTimer,X                                            ;A0A7D8;
    BNE .timerNotExpired                                                 ;A0A7DB;
    LDA.W #$000A                                                         ;A0A7DD;
    JSL.L QueueSound_Lib3_Max3                                           ;A0A7E0;

  .timerNotExpired:
    LDY.W #$0190                                                         ;A0A7E4;
    LDA.W AreaIndex                                                      ;A0A7E7;
    CMP.W #$0002                                                         ;A0A7EA;
    BNE .notNorfair                                                      ;A0A7ED;
    LDY.W #$012C                                                         ;A0A7EF;

  .notNorfair:
    TYA                                                                  ;A0A7F2;
    STA.W Enemy.freezeTimer,X                                            ;A0A7F3;
    LDA.W Enemy.AI,X                                                     ;A0A7F6;
    ORA.W #$0004                                                         ;A0A7F9;
    STA.W Enemy.AI,X                                                     ;A0A7FC;
    LDA.W #$000A                                                         ;A0A7FF;
    STA.W Enemy.invincibilityTimer,X                                     ;A0A802;
    PLX                                                                  ;A0A805;
    PLB                                                                  ;A0A806;
    RTS                                                                  ;A0A807;

  .damage:
    PLX                                                                  ;A0A808;
    LDX.W EnemyIndex                                                     ;A0A809;
    LDX.W EnemyIndex                                                     ;A0A80C;
    LDA.W Enemy.ID,X                                                     ;A0A80F;
    TAX                                                                  ;A0A812;
    LDA.L EnemyHeaders_hurtAITime,X                                      ;A0A813;
    AND.W #$00FF                                                         ;A0A817;
    BNE +                                                                ;A0A81A;
    LDA.W #$0004                                                         ;A0A81C;

+   CLC                                                                  ;A0A81F;
    ADC.W #$0008                                                         ;A0A820;
    LDX.W EnemyIndex                                                     ;A0A823;
    STA.W Enemy.flashTimer,X                                             ;A0A826;
    LDA.W Enemy.AI,X                                                     ;A0A829;
    ORA.W #$0002                                                         ;A0A82C;
    STA.W Enemy.AI,X                                                     ;A0A82F;
    LDA.W Enemy.freezeTimer,X                                            ;A0A832;
    BNE .noFlashNoCry                                                    ;A0A835;
    PHX                                                                  ;A0A837;
    PHY                                                                  ;A0A838;
    LDA.W Enemy.ID,X                                                     ;A0A839;
    TAX                                                                  ;A0A83C;
    LDA.L EnemyHeaders_cry,X                                             ;A0A83D;
    BEQ .setEnemyHit                                                     ;A0A841;
    JSL.L QueueSound_Lib2_Max3                                           ;A0A843;

  .setEnemyHit:
    PLY                                                                  ;A0A847;
    PLX                                                                  ;A0A848;
    INC.W Temp_ShotAIHitFlag                                             ;A0A849;

  .noFlashNoCry:
    LDX.W EnemyIndex                                                     ;A0A84C;
    LDA.W CollisionIndex                                                 ;A0A84F;
    ASL                                                                  ;A0A852;
    TAY                                                                  ;A0A853;
    LDA.W SamusProjectile_Types,Y                                        ;A0A854;
    BIT.W #$0008                                                         ;A0A857;
    BEQ .notPlasma                                                       ;A0A85A;
    LDA.W #$0010                                                         ;A0A85C;
    STA.W Enemy.invincibilityTimer,X                                     ;A0A85F;

  .notPlasma:
    LDA.W Enemy.health,X                                                 ;A0A862;
    SEC                                                                  ;A0A865;
    SBC.W EnemySpritemapEntryXPositionDuringCollision                    ;A0A866;
    BEQ .checkKill                                                       ;A0A869;
    BCS .return                                                          ;A0A86B;

  .checkKill:
    LDA.W CollisionIndex                                                 ;A0A86D;
    ASL                                                                  ;A0A870;
    TAY                                                                  ;A0A871;
    LDA.W SamusProjectile_Types,Y                                        ;A0A872;
    AND.W #$0002                                                         ;A0A875;
    BEQ .enemyHealthZero                                                 ;A0A878;
    LDA.W Temp_BeamVulnerability                                         ;A0A87A;
    AND.W #$00F0                                                         ;A0A87D;
    CMP.W #$0080                                                         ;A0A880;
    BEQ .enemyHealthZero                                                 ;A0A883;
    LDA.W Enemy.freezeTimer,X                                            ;A0A885;
    BNE .enemyHealthZero                                                 ;A0A888;
    LDY.W #$0190                                                         ;A0A88A;
    LDA.W AreaIndex                                                      ;A0A88D;
    CMP.W #$0002                                                         ;A0A890;
    BNE ..notNorfair                                                     ;A0A893;
    LDY.W #$012C                                                         ;A0A895;

  ..notNorfair:
    TYA                                                                  ;A0A898;
    STA.W Enemy.freezeTimer,X                                            ;A0A899;
    LDA.W Enemy.AI,X                                                     ;A0A89C;
    ORA.W #$0004                                                         ;A0A89F;
    STA.W Enemy.AI,X                                                     ;A0A8A2;
    LDA.W #$000A                                                         ;A0A8A5;
    STA.W Enemy.invincibilityTimer,X                                     ;A0A8A8;
    LDA.W #$000A                                                         ;A0A8AB;
    JSL.L QueueSound_Lib3_Max3                                           ;A0A8AE;
    PLB                                                                  ;A0A8B2;
    RTS                                                                  ;A0A8B3;

  .enemyHealthZero:
    LDA.W #$0000                                                         ;A0A8B4;

  .return:
    STA.W Enemy.health,X                                                 ;A0A8B7;
    PLB                                                                  ;A0A8BA;
    RTS                                                                  ;A0A8BB;


;;; $A8BC: Creates a dud shot ;;;
CreateADudShot:
    PHX                                                                  ;A0A8BC;
    PHY                                                                  ;A0A8BD;
    LDA.W CollisionIndex                                                 ;A0A8BE;
    ASL                                                                  ;A0A8C1;
    TAX                                                                  ;A0A8C2;
    LDA.W SamusProjectile_XPositions,X                                   ;A0A8C3;
    STA.B DP_Temp12                                                      ;A0A8C6;
    LDA.W SamusProjectile_YPositions,X                                   ;A0A8C8;
    STA.B DP_Temp14                                                      ;A0A8CB;
    LDA.W #$0006                                                         ;A0A8CD;
    STA.B DP_Temp16                                                      ;A0A8D0;
    STZ.B DP_Temp18                                                      ;A0A8D2;
    JSL.L Create_Sprite_Object                                           ;A0A8D4;
    LDA.W #$003D                                                         ;A0A8D8;
    JSL.L QueueSound_Lib1_Max3                                           ;A0A8DB;
    LDA.W CollisionIndex                                                 ;A0A8DF;
    ASL                                                                  ;A0A8E2;
    TAX                                                                  ;A0A8E3;
    LDA.W SamusProjectile_Directions,X                                   ;A0A8E4;
    ORA.W #$0010                                                         ;A0A8E7;
    STA.W SamusProjectile_Directions,X                                   ;A0A8EA;
    PLY                                                                  ;A0A8ED;
    PLX                                                                  ;A0A8EE;
    RTL                                                                  ;A0A8EF;


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
    PHP                                                                  ;A0A8F0;
    PHB                                                                  ;A0A8F1;
    PEA.W Samus_vs_SolidEnemy_CollisionDetection>>8&$FF00                ;A0A8F2;
    PLB                                                                  ;A0A8F5;
    PLB                                                                  ;A0A8F6;
    REP #$30                                                             ;A0A8F7;
    LDA.W InteractiveEnemyIndicesStackPointer                            ;A0A8F9;
    BEQ .returnZeroUpper                                                 ;A0A8FC;
    BRA .execute                                                         ;A0A8FE;

  .returnZeroUpper:
    LDA.W #$0000                                                         ;A0A900;
    PLB                                                                  ;A0A903;
    PLP                                                                  ;A0A904;
    RTL                                                                  ;A0A905;

  .execute:
    LDA.W CollisionMovementDirection                                     ;A0A906;
    AND.W #$0003                                                         ;A0A909;
    ASL                                                                  ;A0A90C;
    TAX                                                                  ;A0A90D;
    JMP.W (.pointers,X)                                                  ;A0A90E;

  .pointers:
    dw .left                                                             ;A0A911;
    dw .right                                                            ;A0A913;
    dw .up                                                               ;A0A915;
    dw .down                                                             ;A0A917;

  .left:
    LDA.B DP_Temp12                                                      ;A0A919;
    EOR.W #$FFFF                                                         ;A0A91B;
    INC                                                                  ;A0A91E;
    CLC                                                                  ;A0A91F;
    ADC.W SamusXPosition                                                 ;A0A920;
    STA.W SamusTargetXPosition                                           ;A0A923;
    LDA.W SamusXSubPosition                                              ;A0A926;
    SEC                                                                  ;A0A929;
    SBC.B DP_Temp14                                                      ;A0A92A;
    BCS ..checkTargetSubposition                                         ;A0A92C;
    DEC.W SamusTargetXPosition                                           ;A0A92E;

  ..checkTargetSubposition:
    BEQ ..zeroTarget                                                     ;A0A931;
    DEC.W SamusTargetXPosition                                           ;A0A933;

  ..zeroTarget:
    LDA.W SamusYPosition                                                 ;A0A936;
    STA.W SamusTargetYPosition                                           ;A0A939;
    LDA.W SamusYSubPosition                                              ;A0A93C;
    STA.W SamusTargetYSubPosition                                        ;A0A93F;
    JMP.W .targetPositionSet                                             ;A0A942;

  .right:
    LDA.B DP_Temp12                                                      ;A0A945;
    CLC                                                                  ;A0A947;
    ADC.W SamusXPosition                                                 ;A0A948;
    STA.W SamusTargetXPosition                                           ;A0A94B;
    LDA.B DP_Temp14                                                      ;A0A94E;
    CLC                                                                  ;A0A950;
    ADC.W SamusXSubPosition                                              ;A0A951;
    BCC ..checkTargetSubposition                                         ;A0A954;
    INC.W SamusTargetXPosition                                           ;A0A956;

  ..checkTargetSubposition:
    BEQ ..zeroTarget                                                     ;A0A959;
    INC.W SamusTargetXPosition                                           ;A0A95B;

  ..zeroTarget:
    LDA.W SamusYPosition                                                 ;A0A95E;
    STA.W SamusTargetYPosition                                           ;A0A961;
    LDA.W SamusYSubPosition                                              ;A0A964;
    STA.W SamusTargetYSubPosition                                        ;A0A967;
    BRA .targetPositionSet                                               ;A0A96A;

  .up:
    LDA.W SamusYPosition                                                 ;A0A96C;
    SEC                                                                  ;A0A96F;
    SBC.B DP_Temp12                                                      ;A0A970;
    STA.W SamusTargetYPosition                                           ;A0A972;
    LDA.W SamusYSubPosition                                              ;A0A975;
    SEC                                                                  ;A0A978;
    SBC.B DP_Temp14                                                      ;A0A979;
    BCS ..checkTargetSubposition                                         ;A0A97B;
    DEC.W SamusTargetYPosition                                           ;A0A97D;

  ..checkTargetSubposition:
    BEQ ..zeroTarget                                                     ;A0A980;
    DEC.W SamusTargetYPosition                                           ;A0A982;

  ..zeroTarget:
    LDA.W SamusXPosition                                                 ;A0A985;
    STA.W SamusTargetXPosition                                           ;A0A988;
    LDA.W SamusXSubPosition                                              ;A0A98B;
    STA.W SamusTargetXSubPosition                                        ;A0A98E;
    BRA .targetPositionSet                                               ;A0A991;

  .down:
    LDA.B DP_Temp12                                                      ;A0A993;
    CLC                                                                  ;A0A995;
    ADC.W SamusYPosition                                                 ;A0A996;
    STA.W SamusTargetYPosition                                           ;A0A999;
    LDA.B DP_Temp14                                                      ;A0A99C;
    CLC                                                                  ;A0A99E;
    ADC.W SamusYSubPosition                                              ;A0A99F;
    BCC ..checkTargetSubposition                                         ;A0A9A2;
    INC.W SamusTargetYPosition                                           ;A0A9A4;

  ..checkTargetSubposition:
    BEQ ..zeroTarget                                                     ;A0A9A7;
    INC.W SamusTargetYPosition                                           ;A0A9A9;

  ..zeroTarget:
    LDA.W SamusXPosition                                                 ;A0A9AC;
    STA.W SamusTargetXPosition                                           ;A0A9AF;
    LDA.W SamusXSubPosition                                              ;A0A9B2;
    STA.W SamusTargetXSubPosition                                        ;A0A9B5;

  .targetPositionSet:
    LDA.W SamusXRadius                                                   ;A0A9B8;
    STA.W SamusXRadiusMirror                                             ;A0A9BB;
    LDA.W SamusYRadius                                                   ;A0A9BE;
    STA.W SamusYRadiusMirror                                             ;A0A9C1;
    STZ.W CollisionIndex                                                 ;A0A9C4;
    STZ.W InteractiveEnemyIndicesIndex                                   ;A0A9C7;

  .loop:
    LDY.W InteractiveEnemyIndicesIndex                                   ;A0A9CA;
    LDA.W InteractiveEnemyIndices,Y                                      ;A0A9CD;
    CMP.W #$FFFF                                                         ;A0A9D0;
    BNE .valid                                                           ;A0A9D3;
    JMP.W .returnZeroLower                                               ;A0A9D5;

  .valid:
    STA.W CollisionIndex                                                 ;A0A9D8;
    TAX                                                                  ;A0A9DB;
    LDA.W Enemy.freezeTimer,X                                            ;A0A9DC;
    BNE .notFrozenNotSolid                                               ;A0A9DF;
    LDA.W Enemy.properties,X                                             ;A0A9E1;
    BIT.W #$8000                                                         ;A0A9E4;
    BNE .notFrozenNotSolid                                               ;A0A9E7;
    JMP.W .next                                                          ;A0A9E9;

  .notFrozenNotSolid:
    TXA                                                                  ;A0A9EC;
    CLC                                                                  ;A0A9ED;
    ADC.W #Enemy.XPosition                                               ;A0A9EE;
    TAX                                                                  ;A0A9F1;
    LDY.W #SamusTargetXPosition                                          ;A0A9F2;
    LDA.B DP_Temp00,X                                                    ;A0A9F5;
    SEC                                                                  ;A0A9F7;
    SBC.W $0000,Y                                                        ;A0A9F8;
    BPL +                                                                ;A0A9FB;
    EOR.W #$FFFF                                                         ;A0A9FD;
    INC                                                                  ;A0AA00;

+   SEC                                                                  ;A0AA01;
    SBC.B DP_Temp08,X                                                    ;A0AA02;
    BCC .checkY                                                          ;A0AA04;
    CMP.W $0008,Y                                                        ;A0AA06;
    BCS .gotoNext                                                        ;A0AA09;

  .checkY:
    LDA.B DP_Temp04,X                                                    ;A0AA0B;
    SEC                                                                  ;A0AA0D;
    SBC.W $0004,Y                                                        ;A0AA0E;
    BPL +                                                                ;A0AA11;
    EOR.W #$FFFF                                                         ;A0AA13;
    INC                                                                  ;A0AA16;

+   SEC                                                                  ;A0AA17;
    SBC.B DP_Temp0A,X                                                    ;A0AA18;
    BCC .collision                                                       ;A0AA1A;
    CMP.W $000A,Y                                                        ;A0AA1C;
    BCC .collision                                                       ;A0AA1F;

  .gotoNext:
    JMP.W .next                                                          ;A0AA21;

  .collision:
    LDA.W CollisionMovementDirection                                     ;A0AA24;
    AND.W #$0003                                                         ;A0AA27;
    ASL                                                                  ;A0AA2A;
    TAX                                                                  ;A0AA2B;
    JMP.W (.collisionPointers,X)                                         ;A0AA2C;

  .collisionPointers:
    dw .collisionLeft                                                    ;A0AA2F;
    dw .collisionRight                                                   ;A0AA31;
    dw .collisionUp                                                      ;A0AA33;
    dw .collisionDown                                                    ;A0AA35;

  .collisionLeft:
    LDX.W CollisionIndex                                                 ;A0AA37;
    LDA.W Enemy.XPosition,X                                              ;A0AA3A;
    CLC                                                                  ;A0AA3D;
    ADC.W Enemy.XHitboxRadius,X                                          ;A0AA3E;
    STA.W Temp_RightBottomBoundaryPosition                               ;A0AA41;
    LDA.W SamusXPosition                                                 ;A0AA44;
    SEC                                                                  ;A0AA47;
    SBC.W SamusXRadius                                                   ;A0AA48;
    SEC                                                                  ;A0AA4B;
    SBC.W Temp_RightBottomBoundaryPosition                               ;A0AA4C;
    BEQ ..gotoTouching                                                   ;A0AA4F;
    BPL ..gotoNotTouching                                                ;A0AA51;
    JMP.W .gotoNextLower                                                 ;A0AA53;

  ..gotoNotTouching:
    JMP.W .notTouching                                                   ;A0AA56;

  ..gotoTouching:
    JMP.W .touching                                                      ;A0AA59;

  .collisionRight:
    LDX.W CollisionIndex                                                 ;A0AA5C;
    LDA.W SamusXPosition                                                 ;A0AA5F;
    CLC                                                                  ;A0AA62;
    ADC.W SamusXRadius                                                   ;A0AA63;
    STA.W Temp_RightBottomBoundaryPosition                               ;A0AA66;
    LDA.W Enemy.XPosition,X                                              ;A0AA69;
    SEC                                                                  ;A0AA6C;
    SBC.W Enemy.XHitboxRadius,X                                          ;A0AA6D;
    SEC                                                                  ;A0AA70;
    SBC.W Temp_RightBottomBoundaryPosition                               ;A0AA71;
    BEQ .touching                                                        ;A0AA74;
    BPL ..gotoNotTouching                                                ;A0AA76;
    JMP.W .gotoNextLower                                                 ;A0AA78;

  ..gotoNotTouching:
    JMP.W .notTouching                                                   ;A0AA7B;

  .collisionUp:
    LDX.W CollisionIndex                                                 ;A0AA7E;
    LDA.W Enemy.YPosition,X                                              ;A0AA81;
    CLC                                                                  ;A0AA84;
    ADC.W Enemy.YHitboxRadius,X                                          ;A0AA85;
    STA.W Temp_RightBottomBoundaryPosition                               ;A0AA88;
    LDA.W SamusYPosition                                                 ;A0AA8B;
    SEC                                                                  ;A0AA8E;
    SBC.W SamusYRadius                                                   ;A0AA8F;
    SEC                                                                  ;A0AA92;
    SBC.W Temp_RightBottomBoundaryPosition                               ;A0AA93;
    BEQ .touching                                                        ;A0AA96;
    BPL ..gotoNotTouching                                                ;A0AA98;
    JMP.W .gotoNextLower                                                 ;A0AA9A;

  ..gotoNotTouching:
    JMP.W .notTouching                                                   ;A0AA9D;

  .collisionDown:
    LDX.W CollisionIndex                                                 ;A0AAA0;
    LDA.W SamusYPosition                                                 ;A0AAA3;
    CLC                                                                  ;A0AAA6;
    ADC.W SamusYRadius                                                   ;A0AAA7;
    STA.W Temp_RightBottomBoundaryPosition                               ;A0AAAA;
    LDA.W Enemy.YPosition,X                                              ;A0AAAD;
    SEC                                                                  ;A0AAB0;
    SBC.W Enemy.YHitboxRadius,X                                          ;A0AAB1;
    SEC                                                                  ;A0AAB4;
    SBC.W Temp_RightBottomBoundaryPosition                               ;A0AAB5;
    BEQ .touching                                                        ;A0AAB8;
    BPL .notTouching                                                     ;A0AABA;
    JMP.W .gotoNextLower                                                 ;A0AABC;

  .next:
    INC.W InteractiveEnemyIndicesIndex                                   ;A0AABF;
    INC.W InteractiveEnemyIndicesIndex                                   ;A0AAC2;
    JMP.W .loop                                                          ;A0AAC5;

  .touching:
    STZ.W SamusYSubPosition                                              ;A0AAC8;
    LDX.W CollisionIndex                                                 ;A0AACB;
    LDA.W SamusXPosition                                                 ;A0AACE;
    STA.W neverRead184A                                                  ;A0AAD1;
    LDA.W SamusXSubPosition                                              ;A0AAD4;
    STA.W neverRead184C                                                  ;A0AAD7;
    LDA.W Enemy.XPosition,X                                              ;A0AADA;
    STA.W neverRead184E                                                  ;A0AADD;
    LDA.W Enemy.XSubPosition,X                                           ;A0AAE0;
    STA.W neverRead1850                                                  ;A0AAE3;
    LDA.B DP_Temp12                                                      ;A0AAE6;
    STA.W neverRead1852                                                  ;A0AAE8;
    LDA.B DP_Temp14                                                      ;A0AAEB;
    STA.W neverRead1854                                                  ;A0AAED;
    LDA.W SamusYPosition                                                 ;A0AAF0;
    STA.W neverRead1856                                                  ;A0AAF3;
    LDA.W SamusYSubPosition                                              ;A0AAF6;
    STA.W neverRead1858                                                  ;A0AAF9;
    LDA.W #$0001                                                         ;A0AAFC;
    STA.W neverRead185A                                                  ;A0AAFF;
    STZ.B DP_Temp12                                                      ;A0AB02;
    STZ.B DP_Temp14                                                      ;A0AB04;
    LDA.W CollisionIndex                                                 ;A0AB06;
    STA.B DP_Temp16                                                      ;A0AB09;
    LDA.W CollisionMovementDirection                                     ;A0AB0B;
    AND.W #$0003                                                         ;A0AB0E;
    ASL                                                                  ;A0AB11;
    TAX                                                                  ;A0AB12;
    LDA.W CollisionIndex                                                 ;A0AB13;
    STA.W EnemyIndexSamusCollidesLeft,X                                  ;A0AB16;
    STZ.W neverRead1834,X                                                ;A0AB19;
    LDA.W #$FFFF                                                         ;A0AB1C;
    PLB                                                                  ;A0AB1F;
    PLP                                                                  ;A0AB20;
    RTL                                                                  ;A0AB21;

  .notTouching:
    PHA                                                                  ;A0AB22;
    LDX.W CollisionIndex                                                 ;A0AB23;
    LDA.W SamusXPosition                                                 ;A0AB26;
    STA.W neverRead184A                                                  ;A0AB29;
    LDA.W SamusXSubPosition                                              ;A0AB2C;
    STA.W neverRead184C                                                  ;A0AB2F;
    LDA.W Enemy.XPosition,X                                              ;A0AB32;
    STA.W neverRead184E                                                  ;A0AB35;
    LDA.W Enemy.XSubPosition,X                                           ;A0AB38;
    STA.W neverRead1850                                                  ;A0AB3B;
    LDA.B DP_Temp12                                                      ;A0AB3E;
    STA.W neverRead1852                                                  ;A0AB40;
    LDA.B DP_Temp14                                                      ;A0AB43;
    STA.W neverRead1854                                                  ;A0AB45;
    LDA.W SamusYPosition                                                 ;A0AB48;
    STA.W neverRead1856                                                  ;A0AB4B;
    LDA.W SamusYSubPosition                                              ;A0AB4E;
    STA.W neverRead1858                                                  ;A0AB51;
    LDA.W #$0002                                                         ;A0AB54;
    STA.W neverRead185A                                                  ;A0AB57;
    LDA.W CollisionMovementDirection                                     ;A0AB5A;
    AND.W #$0003                                                         ;A0AB5D;
    ASL                                                                  ;A0AB60;
    TAX                                                                  ;A0AB61;
    PLA                                                                  ;A0AB62;
    STA.B DP_Temp12                                                      ;A0AB63;
    STA.W neverRead1834,X                                                ;A0AB65;
    STZ.B DP_Temp14                                                      ;A0AB68;
    LDA.W CollisionIndex                                                 ;A0AB6A;
    STA.B DP_Temp16                                                      ;A0AB6D;
    LDA.W CollisionIndex                                                 ;A0AB6F; >.<
    STA.W EnemyIndexSamusCollidesLeft,X                                  ;A0AB72;
    LDA.W #$FFFF                                                         ;A0AB75;
    PLB                                                                  ;A0AB78;
    PLP                                                                  ;A0AB79;
    RTL                                                                  ;A0AB7A;

  .returnZeroLower:
    LDA.W #$0000                                                         ;A0AB7B;
    PLB                                                                  ;A0AB7E;
    PLP                                                                  ;A0AB7F;
    RTL                                                                  ;A0AB80;

  .gotoNextLower:
    JMP.W .next                                                          ;A0AB81;

if !FEATURE_KEEP_UNREFERENCED
  .unused:
    PHA                                                                  ;A0AB84;
    LDX.W CollisionIndex                                                 ;A0AB85;
    LDA.W SamusXPosition                                                 ;A0AB88;
    STA.W neverRead184A                                                  ;A0AB8B;
    LDA.W SamusXSubPosition                                              ;A0AB8E;
    STA.W neverRead184C                                                  ;A0AB91;
    LDA.W Enemy.XPosition,X                                              ;A0AB94;
    STA.W neverRead184E                                                  ;A0AB97;
    LDA.W Enemy.XSubPosition,X                                           ;A0AB9A;
    STA.W neverRead1850                                                  ;A0AB9D;
    LDA.B DP_Temp12                                                      ;A0ABA0;
    STA.W neverRead1852                                                  ;A0ABA2;
    LDA.B DP_Temp14                                                      ;A0ABA5;
    STA.W neverRead1854                                                  ;A0ABA7;
    LDA.W SamusYPosition                                                 ;A0ABAA;
    STA.W neverRead1856                                                  ;A0ABAD;
    LDA.W SamusYSubPosition                                              ;A0ABB0;
    STA.W neverRead1858                                                  ;A0ABB3;
    LDA.W #$0003                                                         ;A0ABB6;
    STA.W neverRead185A                                                  ;A0ABB9;
    LDA.W CollisionMovementDirection                                     ;A0ABBC;
    AND.W #$0003                                                         ;A0ABBF;
    ASL                                                                  ;A0ABC2;
    TAX                                                                  ;A0ABC3;
    PLA                                                                  ;A0ABC4;
    EOR.W #$FFFF                                                         ;A0ABC5;
    INC                                                                  ;A0ABC8;
    STA.B DP_Temp12                                                      ;A0ABC9;
    STA.W neverRead1834,X                                                ;A0ABCB;
    STZ.B DP_Temp14                                                      ;A0ABCE;
    LDA.W CollisionIndex                                                 ;A0ABD0;
    STA.B DP_Temp16                                                      ;A0ABD3;
    LDA.W CollisionIndex                                                 ;A0ABD5;
    STA.W EnemyIndexSamusCollidesLeft,X                                  ;A0ABD8;
    LDA.W #$FFFF                                                         ;A0ABDB;
    PLB                                                                  ;A0ABDE;
    PLP                                                                  ;A0ABDF;
    RTL                                                                  ;A0ABE0;

  ..return:
    LDA.W #$0000                                                         ;A0ABE1;
    PLB                                                                  ;A0ABE4;
    PLP                                                                  ;A0ABE5;
    RTL                                                                  ;A0ABE6;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $ABE7: Check if enemy is touching Samus from below ;;;
CheckIfEnemyIsTouchingSamusFromBelow:
;; Returns:
;;     A: FFFFh if touching Samus, otherwise 0
    LDA.W SamusXPosition                                                 ;A0ABE7;
    SEC                                                                  ;A0ABEA;
    SBC.W Enemy.XPosition,X                                              ;A0ABEB;
    BPL +                                                                ;A0ABEE;
    EOR.W #$FFFF                                                         ;A0ABF0;
    INC                                                                  ;A0ABF3;

+   SEC                                                                  ;A0ABF4;
    SBC.W SamusXRadius                                                   ;A0ABF5;
    BCC .checkY                                                          ;A0ABF8;
    CMP.W Enemy.XHitboxRadius,X                                          ;A0ABFA;
    BCC .checkY                                                          ;A0ABFD;
    LDA.W #$0000                                                         ;A0ABFF;
    RTL                                                                  ;A0AC02;

  .checkY:
    LDA.W SamusYPosition                                                 ;A0AC03;
    CLC                                                                  ;A0AC06;
    ADC.W #$0003                                                         ;A0AC07;
    SEC                                                                  ;A0AC0A;
    SBC.W Enemy.YPosition,X                                              ;A0AC0B;
    BPL .noTouch                                                         ;A0AC0E;
    EOR.W #$FFFF                                                         ;A0AC10;
    INC                                                                  ;A0AC13;
    SEC                                                                  ;A0AC14;
    SBC.W SamusYRadius                                                   ;A0AC15;
    BCC .touching                                                        ;A0AC18;
    CMP.W Enemy.YHitboxRadius,X                                          ;A0AC1A;
    BEQ .touching                                                        ;A0AC1D;
    BCC .touching                                                        ;A0AC1F;

  .noTouch:
    LDA.W #$0000                                                         ;A0AC21;
    RTL                                                                  ;A0AC24;

  .touching:
    LDA.W #$FFFF                                                         ;A0AC25;
    RTL                                                                  ;A0AC28;


if !FEATURE_KEEP_UNREFERENCED
;;; $AC29: Unused. Check if Samus is touching enemy from above ;;;
UNUSED_CheckIfEnemyIsTouchingSamusFromAbove_A0AC29:
;; Returns:
;;     A: FFFFh if touching Samus, otherwise 0
    LDA.W SamusXPosition                                                 ;A0AC29;
    SEC                                                                  ;A0AC2C;
    SBC.W Enemy.XPosition,X                                              ;A0AC2D;
    BPL +                                                                ;A0AC30;
    EOR.W #$FFFF                                                         ;A0AC32;
    INC                                                                  ;A0AC35;

+   SEC                                                                  ;A0AC36;
    SBC.W SamusXRadius                                                   ;A0AC37;
    BCC .checkY                                                          ;A0AC3A;
    CMP.W Enemy.XHitboxRadius,X                                          ;A0AC3C;
    BCC .checkY                                                          ;A0AC3F;
    LDA.W #$0000                                                         ;A0AC41;
    RTL                                                                  ;A0AC44;

  .checkY:
    LDA.W SamusYPosition                                                 ;A0AC45;
    SEC                                                                  ;A0AC48;
    SBC.W Enemy.YPosition,X                                              ;A0AC49;
    BPL .noTouch                                                         ;A0AC4C;
    EOR.W #$FFFF                                                         ;A0AC4E;
    INC                                                                  ;A0AC51;
    SEC                                                                  ;A0AC52;
    SBC.W SamusYRadius                                                   ;A0AC53;
    BCC .touching                                                        ;A0AC56;
    CMP.W Enemy.YHitboxRadius,X                                          ;A0AC58;
    BEQ .touching                                                        ;A0AC5B;
    BCC .touching                                                        ;A0AC5D;

  .noTouch:
    LDA.W #$0000                                                         ;A0AC5F;
    RTL                                                                  ;A0AC62;

  .touching:
    LDA.W #$FFFF                                                         ;A0AC63;
    RTL                                                                  ;A0AC66;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $AC67: Check if enemy is touching Samus ;;;
CheckIfEnemyIsTouchingSamus:
;; Returns:
;;     A: FFFFh if touching Samus, otherwise 0
    LDA.W SamusXPosition                                                 ;A0AC67;
    SEC                                                                  ;A0AC6A;
    SBC.W Enemy.XPosition,X                                              ;A0AC6B;
    BPL +                                                                ;A0AC6E;
    EOR.W #$FFFF                                                         ;A0AC70;
    INC                                                                  ;A0AC73;

+   SEC                                                                  ;A0AC74;
    SBC.W SamusXRadius                                                   ;A0AC75;
    BCC .checkY                                                          ;A0AC78;
    CMP.W Enemy.XHitboxRadius,X                                          ;A0AC7A;
    BCC .checkY                                                          ;A0AC7D;
    CMP.W #$0008                                                         ;A0AC7F;
    BCC .checkY                                                          ;A0AC82;
    LDA.W #$0000                                                         ;A0AC84;
    RTL                                                                  ;A0AC87;

  .checkY:
    LDA.W SamusYPosition                                                 ;A0AC88;
    SEC                                                                  ;A0AC8B;
    SBC.W Enemy.YPosition,X                                              ;A0AC8C;
    BPL +                                                                ;A0AC8F;
    EOR.W #$FFFF                                                         ;A0AC91;
    INC                                                                  ;A0AC94;

+   SEC                                                                  ;A0AC95;
    SBC.W SamusYRadius                                                   ;A0AC96;
    BCC .touching                                                        ;A0AC99;
    CMP.W Enemy.YHitboxRadius,X                                          ;A0AC9B;
    BCC .touching                                                        ;A0AC9E;
    LDA.W #$0000                                                         ;A0ACA0;
    RTL                                                                  ;A0ACA3;

  .touching:
    LDA.W #$FFFF                                                         ;A0ACA4;
    RTL                                                                  ;A0ACA7;


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
    PHX                                                                  ;A0ACA8;
    PHY                                                                  ;A0ACA9;
    LDA.W Temp_SamusXPosition                                            ;A0ACAA;
    SEC                                                                  ;A0ACAD;
    SBC.W Temp_XPosition                                                 ;A0ACAE;
    STA.W Temp_XDistanceFromEnemyToSamus                                 ;A0ACB1;
    BPL +                                                                ;A0ACB4;
    EOR.W #$FFFF                                                         ;A0ACB6;
    INC                                                                  ;A0ACB9;

+   CMP.W #$00FF                                                         ;A0ACBA;
    BPL .returnError                                                     ;A0ACBD;
    STA.B DP_Temp12                                                      ;A0ACBF;
    STA.W Temp_AbsoluteXDistanceFromEnemyToSamus                         ;A0ACC1;
    LDA.W Temp_SamusYPosition                                            ;A0ACC4;
    SEC                                                                  ;A0ACC7;
    SBC.W Temp_YPosition                                                 ;A0ACC8;
    STA.W Temp_YDistanceFromEnemyToSamus                                 ;A0ACCB;
    BPL +                                                                ;A0ACCE;
    EOR.W #$FFFF                                                         ;A0ACD0;
    INC                                                                  ;A0ACD3;

+   CMP.W #$00FF                                                         ;A0ACD4;
    BPL .returnError                                                     ;A0ACD7;
    STA.B DP_Temp14                                                      ;A0ACD9;
    STA.W Temp_AbsoluteYDistanceFromEnemyToSamus                         ;A0ACDB;
    JSL.L CalculateAngleOf_12_14_Offset                                  ;A0ACDE;
    STA.W Temp_AngleFromEnemyToSamusReflectedDownRight                   ;A0ACE2;
    LDA.W Temp_AbsoluteXDistanceFromEnemyToSamus                         ;A0ACE5;
    STA.W Temp_XPosition                                                 ;A0ACE8;
    LDA.W Temp_AngleFromEnemyToSamusReflectedDownRight                   ;A0ACEB;
    JSL.L EightBitNegativeSineMultiplication_A0B0C6                      ;A0ACEE;
    BIT.W #$8000                                                         ;A0ACF2;
    BEQ +                                                                ;A0ACF5;
    EOR.W #$FFFF                                                         ;A0ACF7;
    INC                                                                  ;A0ACFA;

+   STA.W Temp_XSquaredDividedByRadius                                   ;A0ACFB;
    LDA.W Temp_AbsoluteYDistanceFromEnemyToSamus                         ;A0ACFE;
    STA.W Temp_XPosition                                                 ;A0AD01;
    LDA.W Temp_AngleFromEnemyToSamusReflectedDownRight                   ;A0AD04;
    JSL.L EightBitCosineMultiplication_A0B0B2                            ;A0AD07;
    BIT.W #$8000                                                         ;A0AD0B;
    BEQ +                                                                ;A0AD0E;
    EOR.W #$FFFF                                                         ;A0AD10;
    INC                                                                  ;A0AD13;

+   CLC                                                                  ;A0AD14;
    ADC.W Temp_XSquaredDividedByRadius                                   ;A0AD15;
    PHA                                                                  ;A0AD18;
    LDA.W Temp_XDistanceFromEnemyToSamus                                 ;A0AD19;
    STA.B DP_Temp12                                                      ;A0AD1C;
    LDA.W Temp_YDistanceFromEnemyToSamus                                 ;A0AD1E;
    STA.B DP_Temp14                                                      ;A0AD21;
    JSL.L CalculateAngleOf_12_14_Offset                                  ;A0AD23;
    STA.W Temp_AngleFromEnemyToSamus                                     ;A0AD27;
    PLA                                                                  ;A0AD2A;
    PLY                                                                  ;A0AD2B;
    PLX                                                                  ;A0AD2C;
    CLC                                                                  ;A0AD2D;
    RTL                                                                  ;A0AD2E;

  .returnError:
    PLY                                                                  ;A0AD2F;
    PLX                                                                  ;A0AD30;
    SEC                                                                  ;A0AD31;
    RTL                                                                  ;A0AD32;


if !FEATURE_KEEP_UNREFERENCED
;;; $AD33: Unused. Enemy.var4 = max(0, Enemy.var4 - 1). If Enemy.var4 = 0, A = 1, else A = 0 ;;;
UNUSED_EnemyVariable_ZeroOrMax_A0AD33:
    PHB                                                                  ;A0AD33;
    SEP #$20                                                             ;A0AD34;
    LDA.B #UNUSED_EnemyVariable_ZeroOrMax_A0AD33>>16                     ;A0AD36;
    PHA                                                                  ;A0AD38;
    PLB                                                                  ;A0AD39;
    REP #$30                                                             ;A0AD3A;
    LDA.W Enemy.var4,X                                                   ;A0AD3C;
    BEQ UNUSED_SignedA_ZeroIsSpecialCase_A0AD4A                          ;A0AD3F;
    DEC.W Enemy.var4,X                                                   ;A0AD41;
    BEQ UNUSED_SignedA_ZeroIsSpecialCase_A0AD4A                          ;A0AD44;
    LDA.W #$0000                                                         ;A0AD46;
    RTL                                                                  ;A0AD49;


;;; $AD4F: Unused. A = sgn([A]) (zero is special case) ;;;
UNUSED_SignedA_ZeroIsSpecialCase_A0AD4A:
    LDA.W #$0001                                                         ;A0AD4A;
    PLB                                                                  ;A0AD4D;
    RTL                                                                  ;A0AD4E;

    BNE .notZero                                                         ;A0AD4F;
    LDA.W #$0000                                                         ;A0AD51;
    RTL                                                                  ;A0AD54;

  .notZero:
    CMP.W #$8000                                                         ;A0AD55;
    BMI .return1                                                         ;A0AD58;
    LDA.W #$FFFF                                                         ;A0AD5A;
    RTL                                                                  ;A0AD5D;

  .return1:
    LDA.W #$0001                                                         ;A0AD5E;
    RTL                                                                  ;A0AD61;


;;; $AD62: Unused. A = |[A]| ;;;
UNUSED_NegateA_A0AD62:
    TAY                                                                  ;A0AD62;
    AND.W #$8000                                                         ;A0AD63;
    BNE +                                                                ;A0AD66;
    TYA                                                                  ;A0AD68;
    RTL                                                                  ;A0AD69;

+   TYA                                                                  ;A0AD6A;
    EOR.W #$FFFF                                                         ;A0AD6B;
    INC                                                                  ;A0AD6E;
    RTL                                                                  ;A0AD6F;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $AD70: Check if enemy centre is on screen or not ;;;
CheckIfEnemyCenterIsOnScreen:
;; Returns:
;;     A/zero: 0/set if enemy centre is on screen, 1/clear otherwise
    LDX.W EnemyIndex                                                     ;A0AD70;
    LDA.W Enemy.XPosition,X                                              ;A0AD73;
    CMP.W Layer1XPosition                                                ;A0AD76;
    BMI .offScreen                                                       ;A0AD79;
    LDA.W Layer1XPosition                                                ;A0AD7B;
    CLC                                                                  ;A0AD7E;
    ADC.W #$0100                                                         ;A0AD7F;
    CMP.W Enemy.XPosition,X                                              ;A0AD82;
    BMI .offScreen                                                       ;A0AD85;
    LDA.W Enemy.YPosition,X                                              ;A0AD87;
    CMP.W Layer1YPosition                                                ;A0AD8A;
    BMI .offScreen                                                       ;A0AD8D;
    LDA.W Layer1YPosition                                                ;A0AD8F;
    CLC                                                                  ;A0AD92;
    ADC.W #$0100                                                         ;A0AD93;
    CMP.W Enemy.YPosition,X                                              ;A0AD96;
    BMI .offScreen                                                       ;A0AD99;
    LDA.W #$0000                                                         ;A0AD9B;
    RTL                                                                  ;A0AD9E;

  .offScreen:
    LDA.W #$0001                                                         ;A0AD9F;
    RTL                                                                  ;A0ADA2;


;;; $ADA3: Check if enemy centre is over [A] pixels off-screen ;;;
CheckIfEnemyCenterIsOverAPixelsOffScreen:
;; Parameters:
;;     A: Target off-screen distance
;; Returns:
;;     Zero: Clear if enemy centre is over [A] pixels off-screen, set otherwise

; Called by evir only
    PHX                                                                  ;A0ADA3;
    STA.B DP_Temp12                                                      ;A0ADA4;
    LDX.W EnemyIndex                                                     ;A0ADA6;
    LDA.W Enemy.XPosition,X                                              ;A0ADA9;
    CLC                                                                  ;A0ADAC;
    ADC.B DP_Temp12                                                      ;A0ADAD;
    CMP.W Layer1XPosition                                                ;A0ADAF;
    BMI .offScreen                                                       ;A0ADB2;
    LDA.W Layer1XPosition                                                ;A0ADB4;
    CLC                                                                  ;A0ADB7;
    ADC.W #$0100                                                         ;A0ADB8;
    CLC                                                                  ;A0ADBB;
    ADC.B DP_Temp12                                                      ;A0ADBC;
    CMP.W Enemy.XPosition,X                                              ;A0ADBE;
    BMI .offScreen                                                       ;A0ADC1;
    LDA.W Enemy.YPosition,X                                              ;A0ADC3;
    CLC                                                                  ;A0ADC6;
    ADC.B DP_Temp12                                                      ;A0ADC7;
    CMP.W Layer1YPosition                                                ;A0ADC9;
    BMI .offScreen                                                       ;A0ADCC;
    LDA.W Layer1YPosition                                                ;A0ADCE;
    CLC                                                                  ;A0ADD1;
    ADC.W #$0100                                                         ;A0ADD2;
    CLC                                                                  ;A0ADD5;
    ADC.B DP_Temp12                                                      ;A0ADD6;
    CMP.W Enemy.YPosition,X                                              ;A0ADD8;
    BMI .offScreen                                                       ;A0ADDB;
    PLX                                                                  ;A0ADDD;
    LDA.W #$0000                                                         ;A0ADDE;
    RTL                                                                  ;A0ADE1;

  .offScreen:
    PLX                                                                  ;A0ADE2;
    LDA.W #$0001                                                         ;A0ADE3;
    RTL                                                                  ;A0ADE6;


;;; $ADE7: Check if enemy is on screen or not off screen ;;;
CheckIfEnemyIsOnScreen:
;; Returns:
;;     A/zero: 0/set if enemy centre is on screen, 1/clear otherwise
    PHX                                                                  ;A0ADE7;
    LDX.W EnemyIndex                                                     ;A0ADE8;
    LDA.W Enemy.XPosition,X                                              ;A0ADEB;
    CLC                                                                  ;A0ADEE;
    ADC.W Enemy.XHitboxRadius,X                                          ;A0ADEF;
    CMP.W Layer1XPosition                                                ;A0ADF2;
    BMI .offScreen                                                       ;A0ADF5;
    LDA.W Layer1XPosition                                                ;A0ADF7;
    CLC                                                                  ;A0ADFA;
    ADC.W #$0100                                                         ;A0ADFB;
    CLC                                                                  ;A0ADFE;
    ADC.W Enemy.XHitboxRadius,X                                          ;A0ADFF;
    CMP.W Enemy.XPosition,X                                              ;A0AE02;
    BMI .offScreen                                                       ;A0AE05;
    LDA.W Enemy.YPosition,X                                              ;A0AE07;
    CLC                                                                  ;A0AE0A;
    ADC.W #$0008                                                         ;A0AE0B;
    CMP.W Layer1YPosition                                                ;A0AE0E;
    BMI .offScreen                                                       ;A0AE11;
    LDA.W Layer1YPosition                                                ;A0AE13;
    CLC                                                                  ;A0AE16;
    ADC.W #$00F8                                                         ;A0AE17;
    CMP.W Enemy.YPosition,X                                              ;A0AE1A;
    BMI .offScreen                                                       ;A0AE1D;
    PLX                                                                  ;A0AE1F;
    LDA.W #$0000                                                         ;A0AE20;
    RTL                                                                  ;A0AE23;

  .offScreen:
    PLX                                                                  ;A0AE24;
    LDA.W #$0001                                                         ;A0AE25;
    RTL                                                                  ;A0AE28;


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
    LDX.W EnemyIndex                                                     ;A0AE29;
    LDA.W #$0020                                                         ;A0AE2C;
    JSL.L IsSamusWithingAPixelRowsOfEnemy                                ;A0AE2F;
    BEQ .notLeftNorRight                                                 ;A0AE33;
    LDY.W #$0002                                                         ;A0AE35;
    JSL.L Get_SamusX_minus_EnemyX                                        ;A0AE38;
    BPL +                                                                ;A0AE3C;
    LDY.W #$0007                                                         ;A0AE3E;

+   TYA                                                                  ;A0AE41;
    RTL                                                                  ;A0AE42;

  .notLeftNorRight:
    LDA.W #$0020                                                         ;A0AE43;
    JSL.L IsSamusWithinAPixelColumnsOfEnemy                              ;A0AE46;
    BEQ .notAboveOrBelow                                                 ;A0AE4A;
    LDY.W #$0004                                                         ;A0AE4C;
    JSL.L Get_SamusY_minus_EnemyY                                        ;A0AE4F;
    BPL +                                                                ;A0AE53;
    LDY.W #$0000                                                         ;A0AE55;

+   TYA                                                                  ;A0AE58;
    RTL                                                                  ;A0AE59;

  .notAboveOrBelow:
    JSL.L Get_SamusX_minus_EnemyX                                        ;A0AE5A;
    BMI .notDiagonallyRight                                              ;A0AE5E;
    LDY.W #$0003                                                         ;A0AE60;
    JSL.L Get_SamusY_minus_EnemyY                                        ;A0AE63;
    BPL +                                                                ;A0AE67;
    LDY.W #$0001                                                         ;A0AE69;

+   TYA                                                                  ;A0AE6C;
    RTL                                                                  ;A0AE6D;

  .notDiagonallyRight:
    LDY.W #$0006                                                         ;A0AE6E;
    JSL.L Get_SamusY_minus_EnemyY                                        ;A0AE71;
    BPL +                                                                ;A0AE75;
    LDY.W #$0008                                                         ;A0AE77;

+   TYA                                                                  ;A0AE7A;
    RTL                                                                  ;A0AE7B;


if !FEATURE_KEEP_UNREFERENCED
;;; $AE7C: Unused. Proto instruction list handler ;;;
UNUSED_ProtoInstructionListHandler_A0AE7C:
; Uses $A0:002A(!) as pointer to instruction list pointer table, indexed by Enemy.instList * 2
; Enemy Enemy.loopCounter is the instruction list pointer, and these instruction lists terminate with FFFFh and loop with FFFEh
; No support for ASM commands
    LDX.W EnemyIndex                                                     ;A0AE7C;
    LDA.W Enemy.ID,X                                                     ;A0AE7F;
    TAX                                                                  ;A0AE82;
    LDA.L EnemyHeaders_sidehopperVariantIndex,X                          ;A0AE83;
    STA.W Temp_InstListIndex                                             ;A0AE87;
    LDX.W EnemyIndex                                                     ;A0AE8A;
    LDA.W Enemy.instList,X                                               ;A0AE8D;
    ASL                                                                  ;A0AE90;
    CLC                                                                  ;A0AE91;
    ADC.W Temp_InstListIndex                                             ;A0AE92;
    TAY                                                                  ;A0AE95;
    LDX.W $0000,Y                                                        ;A0AE96;
    TXY                                                                  ;A0AE99;
    LDX.W EnemyIndex                                                     ;A0AE9A;
    LDA.W Enemy.instTimer,X                                              ;A0AE9D;
    BEQ +                                                                ;A0AEA0;
    CMP.W #$0001                                                         ;A0AEA2;
    BEQ +                                                                ;A0AEA5;
    DEC.W Enemy.instTimer,X                                              ;A0AEA7;
    LDA.W #$0000                                                         ;A0AEAA;
    RTL                                                                  ;A0AEAD;

+   STY.B DP_Temp00                                                      ;A0AEAE;
    LDY.W Enemy.loopCounter,X                                            ;A0AEB0;

  .loop:
    LDA.B (DP_Temp00),Y                                                  ;A0AEB3;
    CMP.W #$FFFF                                                         ;A0AEB5;
    BEQ .return1                                                         ;A0AEB8;
    CMP.W #$FFFE                                                         ;A0AEBA;
    BNE .notTerminated                                                   ;A0AEBD;
    LDY.W #$0000                                                         ;A0AEBF;
    JMP.W .loop                                                          ;A0AEC2;

  .notTerminated:
    STA.W Enemy.spritemap,X                                              ;A0AEC5;
    INY                                                                  ;A0AEC8;
    INY                                                                  ;A0AEC9;
    LDA.B (DP_Temp00),Y                                                  ;A0AECA;
    STA.W Enemy.instTimer,X                                              ;A0AECC;
    INY                                                                  ;A0AECF;
    INY                                                                  ;A0AED0;
    TYA                                                                  ;A0AED1;
    STA.W Enemy.loopCounter,X                                            ;A0AED2;
    LDA.W #$0000                                                         ;A0AED5;
    RTL                                                                  ;A0AED8;

  .return1:
    LDA.W #$0001                                                         ;A0AED9;
    RTL                                                                  ;A0AEDC;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $AEDD: A = [Samus Y position] - [enemy Y position] ;;;
Get_SamusY_minus_EnemyY:
    LDA.W SamusYPosition                                                 ;A0AEDD;
    SEC                                                                  ;A0AEE0;
    SBC.W Enemy.YPosition,X                                              ;A0AEE1;
    RTL                                                                  ;A0AEE4;


;;; $AEE5: A = [Samus X position] - [enemy X position] ;;;
Get_SamusX_minus_EnemyX:
    LDA.W SamusXPosition                                                 ;A0AEE5;
    SEC                                                                  ;A0AEE8;
    SBC.W Enemy.XPosition,X                                              ;A0AEE9;
    RTL                                                                  ;A0AEEC;


;;; $AEED: Is Samus within [A] pixel rows of enemy ;;;
IsSamusWithingAPixelRowsOfEnemy:
    STA.W Temp_Threshold                                                 ;A0AEED;
    LDY.W SamusYPosition                                                 ;A0AEF0;
    LDA.W Enemy.YPosition,X                                              ;A0AEF3;
    TAX                                                                  ;A0AEF6;
    JSL.L GetSignedYMinusX_A0B07D                                        ;A0AEF7;
    LDX.W EnemyIndex                                                     ;A0AEFB;
    CMP.W Temp_Threshold                                                 ;A0AEFE;
    BPL .returnZero                                                      ;A0AF01;
    LDA.W #$0001                                                         ;A0AF03;
    RTL                                                                  ;A0AF06;

  .returnZero:
    LDA.W #$0000                                                         ;A0AF07;
    RTL                                                                  ;A0AF0A;


;;; $AF0B: Is Samus within [A] pixel columns of enemy ;;;
IsSamusWithinAPixelColumnsOfEnemy:
    STA.W Temp_Threshold                                                 ;A0AF0B;
    LDY.W SamusXPosition                                                 ;A0AF0E;
    LDA.W Enemy.XPosition,X                                              ;A0AF11;
    TAX                                                                  ;A0AF14;
    JSL.L GetSignedYMinusX_A0B07D                                        ;A0AF15;
    LDX.W EnemyIndex                                                     ;A0AF19;
    CMP.W Temp_Threshold                                                 ;A0AF1C;
    BPL .returnZero                                                      ;A0AF1F;
    LDA.W #$0001                                                         ;A0AF21;
    RTL                                                                  ;A0AF24;

  .returnZero:
    LDA.W #$0000                                                         ;A0AF25;
    RTL                                                                  ;A0AF28;


if !FEATURE_KEEP_UNREFERENCED
;;; $AF29: Unused. Enemy X += [$14].[$12] ;;;
UNUSED_MoveEnemyX_NoCollision_A0AF29:
; Unused. Clone of MoveEnemyX_plus_12_14
    LDA.W Enemy.XSubPosition,X                                           ;A0AF29;
    CLC                                                                  ;A0AF2C;
    ADC.B DP_Temp12                                                      ;A0AF2D;
    STA.W Enemy.XSubPosition,X                                           ;A0AF2F;
    LDA.W Enemy.XPosition,X                                              ;A0AF32;
    ADC.B DP_Temp14                                                      ;A0AF35;
    STA.W Enemy.XPosition,X                                              ;A0AF37;
    RTL                                                                  ;A0AF3A;


;;; $AF3B: Unused. Enemy Y += [$14].[$12] ;;;
UNUSED_MoveEnemyY_NoCollision_A0AF3B:
; Unused. Clone of MoveEnemyY_plus_12_14
    LDA.W Enemy.YSubPosition,X                                           ;A0AF3B;
    CLC                                                                  ;A0AF3E;
    ADC.B DP_Temp12                                                      ;A0AF3F;
    STA.W Enemy.YSubPosition,X                                           ;A0AF41;
    LDA.W Enemy.YPosition,X                                              ;A0AF44;
    ADC.B DP_Temp14                                                      ;A0AF47;
    STA.W Enemy.YPosition,X                                              ;A0AF49;
    RTL                                                                  ;A0AF4C;


;;; $AF4D: Unused. Move enemy left/right/up/down by [$14].[$12] ;;;
UNUSED_MoveEnemy_12_14_A0AF4D:
; Broken. Uses X for jump table index, but is needed for enemy index
    ASL                                                                  ;A0AF4D;
    TAX                                                                  ;A0AF4E;
    JMP.W (.pointers,X)                                                  ;A0AF4F;

  .pointers:
    dw MoveEnemyX_minus_12_14                                            ;A0AF52;
    dw MoveEnemyX_plus_12_14                                             ;A0AF54;
    dw MoveEnemyY_minus_12_14                                            ;A0AF56;
    dw MoveEnemyY_plus_12_14                                             ;A0AF58;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $AF5A: Enemy X -= [$14].[$12] ;;;
MoveEnemyX_minus_12_14:
    LDA.W Enemy.XSubPosition,X                                           ;A0AF5A;
    SEC                                                                  ;A0AF5D;
    SBC.B DP_Temp12                                                      ;A0AF5E;
    STA.W Enemy.XSubPosition,X                                           ;A0AF60;
    LDA.W Enemy.XPosition,X                                              ;A0AF63;
    SBC.B DP_Temp14                                                      ;A0AF66;
    STA.W Enemy.XPosition,X                                              ;A0AF68;
    RTL                                                                  ;A0AF6B;


;;; $AF6C: Enemy X += [$14].[$12] ;;;
MoveEnemyX_plus_12_14:
    LDA.W Enemy.XSubPosition,X                                           ;A0AF6C;
    CLC                                                                  ;A0AF6F;
    ADC.B DP_Temp12                                                      ;A0AF70;
    STA.W Enemy.XSubPosition,X                                           ;A0AF72;
    LDA.W Enemy.XPosition,X                                              ;A0AF75;
    ADC.B DP_Temp14                                                      ;A0AF78;
    STA.W Enemy.XPosition,X                                              ;A0AF7A;
    RTL                                                                  ;A0AF7D;


;;; $AF7E: Enemy Y -= [$14].[$12] ;;;
MoveEnemyY_minus_12_14:
    LDA.W Enemy.YSubPosition,X                                           ;A0AF7E;
    SEC                                                                  ;A0AF81;
    SBC.B DP_Temp12                                                      ;A0AF82;
    STA.W Enemy.YSubPosition,X                                           ;A0AF84;
    LDA.W Enemy.YPosition,X                                              ;A0AF87;
    SBC.B DP_Temp14                                                      ;A0AF8A;
    STA.W Enemy.YPosition,X                                              ;A0AF8C;
    RTL                                                                  ;A0AF8F;


;;; $AF90: Enemy Y += [$14].[$12] ;;;
MoveEnemyY_plus_12_14:
    LDA.W Enemy.YSubPosition,X                                           ;A0AF90;
    CLC                                                                  ;A0AF93;
    ADC.B DP_Temp12                                                      ;A0AF94;
    STA.W Enemy.YSubPosition,X                                           ;A0AF96;
    LDA.W Enemy.YPosition,X                                              ;A0AF99;
    ADC.B DP_Temp14                                                      ;A0AF9C;
    STA.W Enemy.YPosition,X                                              ;A0AF9E;
    RTL                                                                  ;A0AFA1;


if !FEATURE_KEEP_UNREFERENCED
;;; $AFA2: Unused. Extra Samus X displacement = [Samus X position] - [$14].[$12] ;;;
UNUSED_MoveSamus_ExtraXDisplacement_minus_12_14_A0AFA2:
    LDA.W SamusXSubPosition                                              ;A0AFA2;
    SEC                                                                  ;A0AFA5;
    SBC.B DP_Temp12                                                      ;A0AFA6;
    STA.W ExtraSamusXSubDisplacement                                     ;A0AFA8;
    LDA.W SamusXPosition                                                 ;A0AFAB;
    SBC.B DP_Temp14                                                      ;A0AFAE;
    STA.W ExtraSamusXDisplacement                                        ;A0AFB0;
    RTL                                                                  ;A0AFB3;


;;; $AFB4: Unused. Extra Samus X displacement = [Samus X position] + [$14].[$12] ;;;
UNUSED_MoveSamus_ExtraXDisplacement_plus_12_14_A0AFB4:
    LDA.W SamusXSubPosition                                              ;A0AFB4;
    CLC                                                                  ;A0AFB7;
    ADC.B DP_Temp12                                                      ;A0AFB8;
    STA.W ExtraSamusXSubDisplacement                                     ;A0AFBA;
    LDA.W SamusXPosition                                                 ;A0AFBD;
    ADC.B DP_Temp14                                                      ;A0AFC0;
    STA.W ExtraSamusXDisplacement                                        ;A0AFC2;
    RTL                                                                  ;A0AFC5;


;;; $AFC6: Unused. Extra Samus Y displacement = [Samus X position] - [$14].[$12] ;;;
UNUSED_MoveSamus_ExtraYDisplacement_minus_12_14_A0AFC6:
    LDA.W SamusYSubPosition                                              ;A0AFC6;
    SEC                                                                  ;A0AFC9;
    SBC.B DP_Temp12                                                      ;A0AFCA;
    STA.W ExtraSamusYSubDisplacement                                     ;A0AFCC;
    LDA.W SamusYPosition                                                 ;A0AFCF;
    SBC.B DP_Temp14                                                      ;A0AFD2;
    STA.W ExtraSamusYDisplacement                                        ;A0AFD4;
    RTL                                                                  ;A0AFD7;


;;; $AFD8: Unused. Extra Samus Y displacement = [Samus X position] + [$14].[$12] ;;;
UNUSED_MoveSamus_ExtraYDisplacement_plus_12_14_A0AFD8:
    LDA.W SamusYSubPosition                                              ;A0AFD8;
    CLC                                                                  ;A0AFDB;
    ADC.B DP_Temp12                                                      ;A0AFDC;
    STA.W ExtraSamusYSubDisplacement                                     ;A0AFDE;
    LDA.W SamusYPosition                                                 ;A0AFE1;
    ADC.B DP_Temp14                                                      ;A0AFE4;
    STA.W ExtraSamusYDisplacement                                        ;A0AFE6;
    RTL                                                                  ;A0AFE9;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $AFEA: Sign extend A ;;;
Sign_Extend_A:
    STA.W Temp_Operand                                                   ;A0AFEA;
    AND.W #$0080                                                         ;A0AFED;
    BEQ +                                                                ;A0AFF0;
    LDA.W Temp_Operand                                                   ;A0AFF2;
    ORA.W #$FF00                                                         ;A0AFF5;
    RTL                                                                  ;A0AFF8;

+   LDA.W Temp_Operand                                                   ;A0AFF9;
    RTL                                                                  ;A0AFFC;


if !FEATURE_KEEP_UNREFERENCED
;;; $AFFD: Unused. A *= 10h ;;;
UNUSED_MultiplyBy10_A0AFFD:
    ASL                                                                  ;A0AFFD;
    ASL                                                                  ;A0AFFE;
    ASL                                                                  ;A0AFFF;
    ASL                                                                  ;A0B000;
    RTL                                                                  ;A0B001;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $B002: A *= 20h ;;;
MultiplyBy20_A0B002:
; Used by ProcessEnemySet_LoadPalettesAndEnemyLoadingData to convert palette index to palette bits
    ASL                                                                  ;A0B002;
    ASL                                                                  ;A0B003;
    ASL                                                                  ;A0B004;
    ASL                                                                  ;A0B005;
    ASL                                                                  ;A0B006;
    RTL                                                                  ;A0B007;


if !FEATURE_KEEP_UNREFERENCED
;;; $B008: Unused. A *= 30h ;;;
UNUSED_MultiplyBy30_A0B008:
    ASL                                                                  ;A0B008;
    ASL                                                                  ;A0B009;
    ASL                                                                  ;A0B00A;
    ASL                                                                  ;A0B00B;
    STA.W Temp_Operand                                                   ;A0B00C;
    CLC                                                                  ;A0B00F;
    ADC.W Temp_Operand                                                   ;A0B010;
    CLC                                                                  ;A0B013;
    ADC.W Temp_Operand                                                   ;A0B014;
    RTL                                                                  ;A0B017;


;;; $B018: Unused. A *= 40h ;;;
UNUSED_MultiplyBy40_A0B018:
    ASL                                                                  ;A0B018;
    ASL                                                                  ;A0B019;
    ASL                                                                  ;A0B01A;
    ASL                                                                  ;A0B01B;
    ASL                                                                  ;A0B01C;
    ASL                                                                  ;A0B01D;
    RTL                                                                  ;A0B01E;


;;; $B01F: Unused. A = xxyz -> A = xxzy ;;;
UNUSED_SwapLowByteNybbles_A0B01F:
    PHA                                                                  ;A0B01F;
    AND.W #$FF00                                                         ;A0B020;
    STA.W Temp_SwapNybbles                                               ;A0B023;
    PLA                                                                  ;A0B026;
    AND.W #$00FF                                                         ;A0B027;
    STA.W Temp_Unknown0E32                                               ;A0B02A;
    SEP #$20                                                             ;A0B02D; >_<
    XBA                                                                  ;A0B02F;
    REP #$20                                                             ;A0B030;
    ORA.W Temp_Unknown0E32                                               ;A0B032;
    LSR                                                                  ;A0B035;
    LSR                                                                  ;A0B036;
    LSR                                                                  ;A0B037;
    LSR                                                                  ;A0B038;
    AND.W #$00FF                                                         ;A0B039;
    ORA.W Temp_SwapNybbles                                               ;A0B03C;
    RTL                                                                  ;A0B03F;


;;; $B040: Unused. A = xyzz -> A = yxzz ;;;
UNUSED_SwapHighByteNybbles_A0B040:
    PHA                                                                  ;A0B040;
    AND.W #$00FF                                                         ;A0B041;
    STA.W Temp_SwapNybbles                                               ;A0B044;
    PLA                                                                  ;A0B047;
    AND.W #$FF00                                                         ;A0B048;
    STA.W Temp_Unknown0E32                                               ;A0B04B;
    SEP #$20                                                             ;A0B04E; >_<
    XBA                                                                  ;A0B050;
    REP #$20                                                             ;A0B051;
    ORA.W Temp_Unknown0E32                                               ;A0B053;
    ASL                                                                  ;A0B056;
    ASL                                                                  ;A0B057;
    ASL                                                                  ;A0B058;
    ASL                                                                  ;A0B059;
    AND.W #$FF00                                                         ;A0B05A;
    ORA.W Temp_SwapNybbles                                               ;A0B05D;
    RTL                                                                  ;A0B060;


;;; $B061: Unused. A = xxyy -> A = yyxx ;;;
UNUSED_XBA_A0B060:
; Whoever wrote these three nybble swapping routines must've thought XBA had to be done in 8-bit mode
    SEP #$20                                                             ;A0B061; >_<
    XBA                                                                  ;A0B063;
    REP #$20                                                             ;A0B064;
    RTL                                                                  ;A0B066;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $B067: A = |[A]| ;;;
NegateA_A0B067:
    STA.W Temp_Unknown0E32                                               ;A0B067;
    AND.W #$8000                                                         ;A0B06A;
    BEQ +                                                                ;A0B06D;
    LDA.W Temp_Unknown0E32                                               ;A0B06F;
    EOR.W #$FFFF                                                         ;A0B072;
    INC                                                                  ;A0B075;
    STA.W Temp_Unknown0E32                                               ;A0B076;

+   LDA.W Temp_Unknown0E32                                               ;A0B079;
    RTL                                                                  ;A0B07C;


;;; $B07D: A = |[Y] - [X]| ;;;
GetSignedYMinusX_A0B07D:
    PHX                                                                  ;A0B07D;
    PHY                                                                  ;A0B07E;
    TXA                                                                  ;A0B07F; >.<
    STA.W Temp_Unknown0E32                                               ;A0B080;
    TYA                                                                  ;A0B083;
    SEC                                                                  ;A0B084;
    SBC.W Temp_Unknown0E32                                               ;A0B085;
    STA.W Temp_Unknown0E34                                               ;A0B088;
    AND.W #$8000                                                         ;A0B08B;
    BEQ +                                                                ;A0B08E;
    LDA.W Temp_Unknown0E34                                               ;A0B090;
    EOR.W #$FFFF                                                         ;A0B093;
    INC                                                                  ;A0B096;
    STA.W Temp_Unknown0E34                                               ;A0B097;

+   LDA.W Temp_Unknown0E34                                               ;A0B09A;
    PLY                                                                  ;A0B09D;
    PLX                                                                  ;A0B09E;
    RTL                                                                  ;A0B09F;


if !FEATURE_KEEP_UNREFERENCED
;;; $B0A0: Unused. A = -[A] ;;;
UNUSED_GetNegativeA_A0B0A0:
    EOR.W #$FFFF                                                         ;A0B0A0;
    INC                                                                  ;A0B0A3;
    RTL                                                                  ;A0B0A4;


;;; $B0A5: Unused. A = sgn([A]) (zero counts as positive) ;;;
UNUSED_SignedA_ZeroCountsAsPositive_A0B0A5:
    AND.W #$8000                                                         ;A0B0A5;
    BEQ +                                                                ;A0B0A8;
    LDA.W #$FFFF                                                         ;A0B0AA;
    RTL                                                                  ;A0B0AD;

+   LDA.W #$0001                                                         ;A0B0AE;
    RTL                                                                  ;A0B0B1;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $B0B2: 8-bit cosine multiplication ;;;
EightBitCosineMultiplication_A0B0B2:
; $0E36.$0E38 = cos([A] * pi / 80h) * FFh * Temp_Unknown0E32 / 100h

; Bug. Only accurate for angles in the range C0h..3Fh (see EightBitSineMultiplication_A0B0DA)
    CLC                                                                  ;A0B0B2;
    ADC.W #$0040                                                         ;A0B0B3;
    AND.W #$00FF                                                         ;A0B0B6;
    STA.W Temp_Unknown0E34                                               ;A0B0B9;
    PHX                                                                  ;A0B0BC;
    PHY                                                                  ;A0B0BD;
    PHB                                                                  ;A0B0BE;
    JSR.W EightBitSineMultiplication_A0B0DA                              ;A0B0BF;
    PLB                                                                  ;A0B0C2;
    PLY                                                                  ;A0B0C3;
    PLX                                                                  ;A0B0C4;
    RTL                                                                  ;A0B0C5;


;;; $B0C6: 8-bit negative sine multiplication ;;;
EightBitNegativeSineMultiplication_A0B0C6:
; $0E36.$0E38 = -sin([A] * pi / 80h) * FFh * Temp_Unknown0E32 / 100h

; Bug. Only accurate for angles in the range 80h..FFh (see EightBitSineMultiplication_A0B0DA)
    CLC                                                                  ;A0B0C6;
    ADC.W #$0080                                                         ;A0B0C7;
    AND.W #$00FF                                                         ;A0B0CA;
    STA.W Temp_Unknown0E34                                               ;A0B0CD;
    PHX                                                                  ;A0B0D0;
    PHY                                                                  ;A0B0D1;
    PHB                                                                  ;A0B0D2;
    JSR.W EightBitSineMultiplication_A0B0DA                              ;A0B0D3;
    PLB                                                                  ;A0B0D6;
    PLY                                                                  ;A0B0D7;
    PLX                                                                  ;A0B0D8;
    RTL                                                                  ;A0B0D9;


;;; $B0DA: 8-bit sine multiplication ;;;
EightBitSineMultiplication_A0B0DA:
; $0E36.$0E38 = sin(Temp_Unknown0E34 * pi / 80h) * FFh * Temp_Unknown0E32 / 100h

; Bug. Only accurate for angles in the range 0..7Fh because the negation code of $B11B..2E does not do a correct multi-word increment.
; Accurate code would be more like:
;     LDA $0E38 : EOR #$FFFF : CLC : ADC #$0001 : STA $0E38
;     LDA $0E36 : EOR #$FFFF : ADC #$0000 : STA $0E36

; Results for negative angles with this bug are almost always 1.0 greater than they should be
    SEP #$20                                                             ;A0B0DA;
    LDA.B #SineCosineTables_8bitSine>>16                                 ;A0B0DC;
    PHA                                                                  ;A0B0DE;
    PLB                                                                  ;A0B0DF;
    REP #$30                                                             ;A0B0E0;
    LDA.W Temp_Unknown0E34                                               ;A0B0E2;
    AND.W #$007F                                                         ;A0B0E5;
    TAY                                                                  ;A0B0E8;
    LDA.W SineCosineTables_8bitSine,Y                                    ;A0B0E9;
    AND.W #$00FF                                                         ;A0B0EC;
    SEP #$20                                                             ;A0B0EF;
    STA.W $4202                                                          ;A0B0F1;
    LDA.W Temp_Unknown0E32                                               ;A0B0F4;
    STA.W $4203                                                          ;A0B0F7;
    NOP                                                                  ;A0B0FA;
    NOP                                                                  ;A0B0FB;
    NOP                                                                  ;A0B0FC;
    NOP                                                                  ;A0B0FD;
    NOP                                                                  ;A0B0FE;
    REP #$20                                                             ;A0B0FF;
    LDA.W $4216                                                          ;A0B101;
    XBA                                                                  ;A0B104;
    PHA                                                                  ;A0B105;
    AND.W #$00FF                                                         ;A0B106;
    STA.W Temp_SineProduct                                               ;A0B109;
    PLA                                                                  ;A0B10C;
    AND.W #$FF00                                                         ;A0B10D;
    STA.W Temp_SineProductFractionalPart                                 ;A0B110;
    LDA.W Temp_Unknown0E34                                               ;A0B113;
    AND.W #$0080                                                         ;A0B116;
    BEQ .return                                                          ;A0B119;
    LDA.W Temp_SineProduct                                               ;A0B11B;
    EOR.W #$FFFF                                                         ;A0B11E;
    INC                                                                  ;A0B121;
    STA.W Temp_SineProduct                                               ;A0B122;
    LDA.W Temp_SineProductFractionalPart                                 ;A0B125;
    EOR.W #$FFFF                                                         ;A0B128;
    INC                                                                  ;A0B12B;
    STA.W Temp_SineProductFractionalPart                                 ;A0B12C;

  .return:
    LDA.W Temp_SineProduct                                               ;A0B12F;
    RTS                                                                  ;A0B132;


;;; $B133: Addresses for enemy drawing queues ;;;
AddressesForEnemyDrawingQueues:
; Indexed by [enemy layer] * 2
    dw EnemyDrawingQueues_Layer0                                         ;A0B133;
    dw EnemyDrawingQueues_Layer1                                         ;A0B135;
    dw EnemyDrawingQueues_Layer2                                         ;A0B137;
    dw EnemyDrawingQueues_Layer3                                         ;A0B139;
    dw EnemyDrawingQueues_Layer4                                         ;A0B13B;
    dw EnemyDrawingQueues_Layer5                                         ;A0B13D;
    dw EnemyDrawingQueues_Layer6                                         ;A0B13F;
    dw EnemyDrawingQueues_Layer7                                         ;A0B141;


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
    db $00,$06,$0C,$12,$19,$1F,$25,$2B,$31,$38,$3E,$44,$4A,$50,$56,$5C   ;A0B143;
    db $61,$67,$6D,$73,$78,$7E,$83,$88,$8E,$93,$98,$9D,$A2,$A7,$AB,$B0   ;A0B153;
    db $B5,$B9,$BD,$C1,$C5,$C9,$CD,$D1,$D4,$D8,$DB,$DE,$E1,$E4,$E7,$EA   ;A0B163;
    db $EC,$EE,$F1,$F3,$F4,$F6,$F8,$F9,$FB,$FC,$FD,$FE,$FE,$FF,$FF,$FF   ;A0B173;

SineCosineTables_8bitCosine:
; 8-bit cosine
    db $FF,$FF,$FF,$FF,$FE,$FE,$FD,$FC,$FB,$F9,$F8,$F6,$F4,$F3,$F1,$EE   ;A0B183;
    db $EC,$EA,$E7,$E4,$E1,$DE,$DB,$D8,$D4,$D1,$CD,$C9,$C5,$C1,$BD,$B9   ;A0B193;
    db $B5,$B0,$AB,$A7,$A2,$9D,$98,$93,$8E,$88,$83,$7E,$78,$73,$6D,$67   ;A0B1A3;
    db $61,$5C,$56,$50,$4A,$44,$3E,$38,$31,$2B,$25,$1F,$19,$12,$0C,$06   ;A0B1B3;

SineCosineTables_16bitSine:
; 16-bit sine
    dw $0000,$0324,$0647,$096A,$0C8B,$0FAB,$12C7,$15E1                   ;A0B1C3;
    dw $18F8,$1C0B,$1F19,$2223,$2527,$2826,$2B1F,$2E10                   ;A0B1D3;
    dw $30FB,$33DE,$36B9,$398C,$3C56,$3F17,$41CD,$447A                   ;A0B1E3;
    dw $471C,$49B3,$4C3F,$4EBF,$5133,$539A,$55F5,$5842                   ;A0B1F3;
    dw $5A82,$5CB3,$5ED7,$60EB,$62F1,$64E8,$66CF,$68A6                   ;A0B203;
    dw $6A6D,$6C23,$6DC9,$6F5E,$70E2,$7254,$73B5,$7504                   ;A0B213;
    dw $7641,$776B,$7884,$7989,$7A7C,$7B5C,$7C29,$7CE3                   ;A0B223;
    dw $7D89,$7E1D,$7E9C,$7F09,$7F61,$7FA6,$7FD8,$7FF5                   ;A0B233;

SineCosineTables_16bitCosine:
; 16-bit cosine
    dw $7FFF,$7FF5,$7FD8,$7FA6,$7F61,$7F09,$7E9C,$7E1D                   ;A0B243;
    dw $7D89,$7CE3,$7C29,$7B5C,$7A7C,$7989,$7884,$776B                   ;A0B253;
    dw $7641,$7504,$73B5,$7254,$70E2,$6F5E,$6DC9,$6C23                   ;A0B263;
    dw $6A6D,$68A6,$66CF,$64E8,$62F1,$60EB,$5ED7,$5CB3                   ;A0B273;
    dw $5A82,$5842,$55F5,$539A,$5133,$4EBF,$4C3F,$49B3                   ;A0B283;
    dw $471C,$447A,$41CD,$3F17,$3C56,$398C,$36B9,$33DE                   ;A0B293;
    dw $30FB,$2E10,$2B1F,$2826,$2527,$2223,$1F19,$1C0B                   ;A0B2A3;
    dw $18F8,$15E1,$12C7,$0FAB,$0C8B,$096A,$0647,$0324                   ;A0B2B3;

SineCosineTables_16bitNegativeSine:
; 16-bit negative sine
    dw $0000,$FCDC,$F9B9,$F696,$F375,$F055,$ED39,$EA1F                   ;A0B2C3;
    dw $E708,$E3F5,$E0E7,$DDDD,$DAD9,$D7DA,$D4E1,$D1F0                   ;A0B2D3;
    dw $CF05,$CC22,$C947,$C674,$C3AA,$C0E9,$BE33,$BB86                   ;A0B2E3;
    dw $B8E4,$B64D,$B3C1,$B141,$AECD,$AC66,$AA0B,$A7BE                   ;A0B2F3;
    dw $A57E,$A34D,$A129,$9F15,$9D0F,$9B18,$9931,$975A                   ;A0B303;
    dw $9593,$93DD,$9237,$90A2,$8F1E,$8DAC,$8C4B,$8AFC                   ;A0B313;
    dw $89BF,$8895,$877C,$8677,$8584,$84A4,$83D7,$831D                   ;A0B323;
    dw $8277,$81E3,$8164,$80F7,$809F,$805A,$8028,$800B                   ;A0B333;

SineCosineTables_16bitNegativeCosine:
; 16-bit negative cosine
    dw $8001,$800B,$8028,$805A,$809F,$80F7,$8164,$81E3                   ;A0B343;
    dw $8277,$831D,$83D7,$84A4,$8584,$8677,$877C,$8895                   ;A0B353;
    dw $89BF,$8AFC,$8C4B,$8DAC,$8F1E,$90A2,$9237,$93DD                   ;A0B363;
    dw $9593,$975A,$9931,$9B18,$9D0F,$9F15,$A129,$A34D                   ;A0B373;
    dw $A57E,$A7BE,$AA0B,$AC66,$AECD,$B141,$B3C1,$B64D                   ;A0B383;
    dw $B8E4,$BB86,$BE33,$C0E9,$C3AA,$C674,$C947,$CC22                   ;A0B393;
    dw $CF05,$D1F0,$D4E1,$D7DA,$DAD9,$DDDD,$E0E7,$E3F5                   ;A0B3A3;
    dw $E708,$EA1F,$ED39,$F055,$F375,$F696,$F9B9,$FCDC                   ;A0B3B3;

SineCosineTables_NegativeCosine_SignExtended:
; 8-bit negative cosine, sign-extended
    dw $FF00,$FF01,$FF01,$FF01,$FF02,$FF02,$FF03,$FF04                   ;A0B3C3;
    dw $FF05,$FF07,$FF08,$FF0A,$FF0C,$FF0D,$FF0F,$FF12                   ;A0B3D3;
    dw $FF14,$FF16,$FF19,$FF1C,$FF1F,$FF22,$FF25,$FF28                   ;A0B3E3;
    dw $FF2C,$FF2F,$FF33,$FF37,$FF3B,$FF3F,$FF43,$FF47                   ;A0B3F3;
    dw $FF4B,$FF50,$FF55,$FF59,$FF5E,$FF63,$FF68,$FF6D                   ;A0B403;
    dw $FF72,$FF78,$FF7D,$FF82,$FF88,$FF8D,$FF93,$FF99                   ;A0B413;
    dw $FF9F,$FFA4,$FFAA,$FFB0,$FFB6,$FFBC,$FFC2,$FFC8                   ;A0B423;
    dw $FFCF,$FFD5,$FFDB,$FFE1,$FFE7,$FFEE,$FFF4,$FFFA                   ;A0B433;

SineCosineTables_8bitSine_SignExtended:
; 8-bit sine, sign-extended
    dw $0000,$0006,$000C,$0012,$0019,$001F,$0025,$002B                   ;A0B443;
    dw $0031,$0038,$003E,$0044,$004A,$0050,$0056,$005C                   ;A0B453;
    dw $0061,$0067,$006D,$0073,$0078,$007E,$0083,$0088                   ;A0B463;
    dw $008E,$0093,$0098,$009D,$00A2,$00A7,$00AB,$00B0                   ;A0B473;
    dw $00B5,$00B9,$00BD,$00C1,$00C5,$00C9,$00CD,$00D1                   ;A0B483;
    dw $00D4,$00D8,$00DB,$00DE,$00E1,$00E4,$00E7,$00EA                   ;A0B493;
    dw $00EC,$00EE,$00F1,$00F3,$00F4,$00F6,$00F8,$00F9                   ;A0B4A3;
    dw $00FB,$00FC,$00FD,$00FE,$00FE,$00FF,$00FF,$00FF                   ;A0B4B3;

SineCosineTables_8bitCosine_SignExtended:
; 8-bit cosine, sign-extended
    dw $0100,$00FF,$00FF,$00FF,$00FE,$00FE,$00FD,$00FC                   ;A0B4C3;
    dw $00FB,$00F9,$00F8,$00F6,$00F4,$00F3,$00F1,$00EE                   ;A0B4D3;
    dw $00EC,$00EA,$00E7,$00E4,$00E1,$00DE,$00DB,$00D8                   ;A0B4E3;
    dw $00D4,$00D1,$00CD,$00C9,$00C5,$00C1,$00BD,$00B9                   ;A0B4F3;
    dw $00B5,$00B0,$00AB,$00A7,$00A2,$009D,$0098,$0093                   ;A0B503;
    dw $008E,$0088,$0083,$007E,$0078,$0073,$006D,$0067                   ;A0B513;
    dw $0061,$005C,$0056,$0050,$004A,$0044,$003E,$0038                   ;A0B523;
    dw $0031,$002B,$0025,$001F,$0019,$0012,$000C,$0006                   ;A0B533;

SineCosineTables_8bitNegativeSign_SignExtended:
; 8-bit negative sine, sign-extended
    dw $0000,$FFFA,$FFF4,$FFEE,$FFE7,$FFE1,$FFDB,$FFD5                   ;A0B543;
    dw $FFCF,$FFC8,$FFC2,$FFBC,$FFB6,$FFB0,$FFAA,$FFA4                   ;A0B553;
    dw $FF9F,$FF99,$FF93,$FF8D,$FF88,$FF82,$FF7D,$FF78                   ;A0B563;
    dw $FF72,$FF6D,$FF68,$FF63,$FF5E,$FF59,$FF55,$FF50                   ;A0B573;
    dw $FF4B,$FF47,$FF43,$FF3F,$FF3B,$FF37,$FF33,$FF2F                   ;A0B583;
    dw $FF2C,$FF28,$FF25,$FF22,$FF1F,$FF1C,$FF19,$FF16                   ;A0B593;
    dw $FF14,$FF12,$FF0F,$FF0D,$FF0C,$FF0A,$FF08,$FF07                   ;A0B5A3;
    dw $FF05,$FF04,$FF03,$FF02,$FF02,$FF01,$FF01,$FF01                   ;A0B5B3;

SineCosineTables_8bitNegativeCosign_SignExtended:
; 8-bit negative cosine, sign-extended
    dw $FF00,$FF01,$FF01,$FF01,$FF02,$FF02,$FF03,$FF04                   ;A0B5C3;
    dw $FF05,$FF07,$FF08,$FF0A,$FF0C,$FF0D,$FF0F,$FF12                   ;A0B5D3;
    dw $FF14,$FF16,$FF19,$FF1C,$FF1F,$FF22,$FF25,$FF28                   ;A0B5E3;
    dw $FF2C,$FF2F,$FF33,$FF37,$FF3B,$FF3F,$FF43,$FF47                   ;A0B5F3;
    dw $FF4B,$FF50,$FF55,$FF59,$FF5E,$FF63,$FF68,$FF6D                   ;A0B603;
    dw $FF72,$FF78,$FF7D,$FF82,$FF88,$FF8D,$FF93,$FF99                   ;A0B613;
    dw $FF9F,$FFA4,$FFAA,$FFB0,$FFB6,$FFBC,$FFC2,$FFC8                   ;A0B623;
    dw $FFCF,$FFD5,$FFDB,$FFE1,$FFE7,$FFEE,$FFF4,$FFFA                   ;A0B633;


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
    PHB                                                                  ;A0B643;
    PHX                                                                  ;A0B644;
    PEA.W UnsignedSineTable>>8&$FF00                                     ;A0B645; $A000
    PLB                                                                  ;A0B648;
    PLB                                                                  ;A0B649;
    REP #$30                                                             ;A0B64A;
    LDA.B DP_Temp12                                                      ;A0B64C;
    CLC                                                                  ;A0B64E;
    ADC.W #$0080                                                         ;A0B64F;
    AND.W #$007F                                                         ;A0B652;
    ASL                                                                  ;A0B655;
    TAX                                                                  ;A0B656;
    LDA.L UnsignedSineTable,X                                            ;A0B657;
    STA.B DP_Temp26                                                      ;A0B65B;
    LDA.B DP_Temp14                                                      ;A0B65D;
    STA.B DP_Temp28                                                      ;A0B65F;
    JSL.L Multiplication_32bit_A0B6FF                                    ;A0B661;
    LDA.B DP_Temp2C                                                      ;A0B665;
    STA.B DP_Temp1A                                                      ;A0B667;
    LDA.B DP_Temp2A                                                      ;A0B669;
    STA.B DP_Temp1C                                                      ;A0B66B;
    LDA.B DP_Temp12                                                      ;A0B66D;
    CLC                                                                  ;A0B66F;
    ADC.W #$0040                                                         ;A0B670;
    AND.W #$007F                                                         ;A0B673;
    ASL                                                                  ;A0B676;
    TAX                                                                  ;A0B677;
    LDA.L UnsignedSineTable,X                                            ;A0B678;
    STA.B DP_Temp26                                                      ;A0B67C;
    LDA.B DP_Temp14                                                      ;A0B67E;
    STA.B DP_Temp28                                                      ;A0B680;
    JSL.L Multiplication_32bit_A0B6FF                                    ;A0B682;
    LDA.B DP_Temp2C                                                      ;A0B686;
    STA.B DP_Temp16                                                      ;A0B688;
    LDA.B DP_Temp2A                                                      ;A0B68A;
    STA.B DP_Temp18                                                      ;A0B68C;
    PLX                                                                  ;A0B68E;
    PLB                                                                  ;A0B68F;
    RTL                                                                  ;A0B690;


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
    PHX                                                                  ;A0B691;
    LDX.W EnemyIndex                                                     ;A0B692;
    LDA.W Temp_AngleToMove                                               ;A0B695;
    CLC                                                                  ;A0B698;
    ADC.W #$0040                                                         ;A0B699;
    BIT.W #$0080                                                         ;A0B69C;
    BNE .greaterThanEqualTo80                                            ;A0B69F;
    LDA.W Enemy.XSubPosition,X                                           ;A0B6A1;
    CLC                                                                  ;A0B6A4;
    ADC.W Temp_XSubSpeed                                                 ;A0B6A5;
    STA.W Enemy.XSubPosition,X                                           ;A0B6A8;
    LDA.W Enemy.XPosition,X                                              ;A0B6AB;
    ADC.W Temp_XSpeed                                                    ;A0B6AE;
    STA.W Enemy.XPosition,X                                              ;A0B6B1;
    BRA +                                                                ;A0B6B4;

  .greaterThanEqualTo80:
    LDA.W Enemy.XSubPosition,X                                           ;A0B6B6;
    SEC                                                                  ;A0B6B9;
    SBC.W Temp_XSubSpeed                                                 ;A0B6BA;
    STA.W Enemy.XSubPosition,X                                           ;A0B6BD;
    LDA.W Enemy.XPosition,X                                              ;A0B6C0;
    SBC.W Temp_XSpeed                                                    ;A0B6C3;
    STA.W Enemy.XPosition,X                                              ;A0B6C6;

+   LDA.W Temp_AngleToMove                                               ;A0B6C9;
    CLC                                                                  ;A0B6CC;
    ADC.W #$0080                                                         ;A0B6CD;
    BIT.W #$0080                                                         ;A0B6D0;
    BNE .lessThan80                                                      ;A0B6D3;
    LDA.W Enemy.YSubPosition,X                                           ;A0B6D5;
    CLC                                                                  ;A0B6D8;
    ADC.W Temp_YSubSpeed                                                 ;A0B6D9;
    STA.W Enemy.YSubPosition,X                                           ;A0B6DC;
    LDA.W Enemy.YPosition,X                                              ;A0B6DF;
    ADC.W Temp_YSpeed                                                    ;A0B6E2;
    STA.W Enemy.YPosition,X                                              ;A0B6E5;
    BRA .return                                                          ;A0B6E8;

  .lessThan80:
    LDA.W Enemy.YSubPosition,X                                           ;A0B6EA;
    SEC                                                                  ;A0B6ED;
    SBC.W Temp_YSubSpeed                                                 ;A0B6EE;
    STA.W Enemy.YSubPosition,X                                           ;A0B6F1;
    LDA.W Enemy.YPosition,X                                              ;A0B6F4;
    SBC.W Temp_YSpeed                                                    ;A0B6F7;
    STA.W Enemy.YPosition,X                                              ;A0B6FA;

  .return:
    PLX                                                                  ;A0B6FD;
    RTL                                                                  ;A0B6FE;


;;; $B6FF: 16bit ($26) * 16bit ($28) = 32bit ($2A) ;;;
Multiplication_32bit_A0B6FF:
;; Parameters:
;;     $26: Multiplicand. Let $26 = a + b * 100h
;;     $28: Multiplicand. Let $28 = c + d * 100h
;; Returns:
;;     $2A..2D: 32-bit result
    PHX                                                                  ;A0B6FF;
    PHY                                                                  ;A0B700;
    PHP                                                                  ;A0B701;
    REP #$20                                                             ;A0B702;
    SEP #$10                                                             ;A0B704;
    LDX.B DP_Temp26                                                      ;A0B706;
    STX.W $4202                                                          ;A0B708;
    LDX.B DP_Temp28                                                      ;A0B70B;
    STX.W $4203                                                          ;A0B70D;
    NOP                                                                  ;A0B710;
    NOP                                                                  ;A0B711;
    NOP                                                                  ;A0B712;
    LDA.W $4216                                                          ;A0B713;
    STA.B DP_Temp2A                                                      ;A0B716;
    LDX.B DP_Temp27                                                      ;A0B718;
    STX.W $4202                                                          ;A0B71A;
    LDX.B DP_Temp29                                                      ;A0B71D;
    STX.W $4203                                                          ;A0B71F;
    NOP                                                                  ;A0B722;
    NOP                                                                  ;A0B723;
    NOP                                                                  ;A0B724;
    LDX.W $4216                                                          ;A0B725;
    STX.B DP_Temp2C                                                      ;A0B728;
    LDY.W $4217                                                          ;A0B72A;
    LDX.B DP_Temp27                                                      ;A0B72D;
    STX.W $4202                                                          ;A0B72F;
    LDX.B DP_Temp28                                                      ;A0B732;
    STX.W $4203                                                          ;A0B734;
    NOP                                                                  ;A0B737;
    NOP                                                                  ;A0B738;
    LDA.B DP_Temp2B                                                      ;A0B739;
    CLC                                                                  ;A0B73B;
    ADC.W $4216                                                          ;A0B73C;
    STA.B DP_Temp2B                                                      ;A0B73F;
    BCC .carryClear                                                      ;A0B741;
    INY                                                                  ;A0B743;

  .carryClear:
    LDX.B DP_Temp26                                                      ;A0B744;
    STX.W $4202                                                          ;A0B746;
    LDX.B DP_Temp29                                                      ;A0B749;
    STX.W $4203                                                          ;A0B74B;
    NOP                                                                  ;A0B74E;
    NOP                                                                  ;A0B74F;
    LDA.B DP_Temp2B                                                      ;A0B750;
    CLC                                                                  ;A0B752;
    ADC.W $4216                                                          ;A0B753;
    STA.B DP_Temp2B                                                      ;A0B756;
    BCC .carryClearAgain                                                 ;A0B758;
    INY                                                                  ;A0B75A;

  .carryClearAgain:
    STY.B DP_Temp2D                                                      ;A0B75B;
    PLP                                                                  ;A0B75D;
    PLY                                                                  ;A0B75E;
    PLX                                                                  ;A0B75F;
    RTL                                                                  ;A0B760;


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
    PHP                                                                  ;A0B761;
    PHB                                                                  ;A0B762;
    PHK                                                                  ;A0B763;
    PLB                                                                  ;A0B764;
    REP #$30                                                             ;A0B765;
    STZ.B DP_Temp28                                                      ;A0B767;
    STZ.B DP_Temp26                                                      ;A0B769;
    LDA.B DP_Temp30                                                      ;A0B76B;
    ORA.B DP_Temp2E                                                      ;A0B76D;
    BNE .loopCounter                                                     ;A0B76F;
    STZ.B DP_Temp2C                                                      ;A0B771;
    STZ.B DP_Temp2A                                                      ;A0B773;
    BRA .return                                                          ;A0B775;

  .loopCounter:
    LDX.W #$0021                                                         ;A0B777;
    CLC                                                                  ;A0B77A;

  .loop:
    ROL.B DP_Temp2A                                                      ;A0B77B;
    ROL.B DP_Temp2C                                                      ;A0B77D;
    DEX                                                                  ;A0B77F;
    BEQ .return                                                          ;A0B780;
    ROL.B DP_Temp26                                                      ;A0B782;
    ROL.B DP_Temp28                                                      ;A0B784;
    LDA.B DP_Temp28                                                      ;A0B786;
    ORA.B DP_Temp26                                                      ;A0B788;
    BEQ .loop                                                            ;A0B78A;
    LDA.B DP_Temp26                                                      ;A0B78C;
    SEC                                                                  ;A0B78E;
    SBC.B DP_Temp2E                                                      ;A0B78F;
    TAY                                                                  ;A0B791;
    LDA.B DP_Temp28                                                      ;A0B792;
    SBC.B DP_Temp30                                                      ;A0B794;
    BCC .loop                                                            ;A0B796;
    STA.B DP_Temp28                                                      ;A0B798;
    STY.B DP_Temp26                                                      ;A0B79A;
    BRA .loop                                                            ;A0B79C;

  .return:
    PLB                                                                  ;A0B79E;
    PLP                                                                  ;A0B79F;
    RTL                                                                  ;A0B7A0;


;;; $B7A1: Cap scrolling speed ;;;
CapScrollingSpeed:
; Called by Draygon and yapping maw
    PHX                                                                  ;A0B7A1;
    PHY                                                                  ;A0B7A2;
    LDA.W SamusYPosition                                                 ;A0B7A3;
    SEC                                                                  ;A0B7A6;
    SBC.W SamusPreviousYPosition                                         ;A0B7A7;
    STA.B DP_Temp12                                                      ;A0B7AA;
    JSL.L NegateA_A0B067                                                 ;A0B7AC;
    CMP.W #$000C                                                         ;A0B7B0;
    BMI .YPositionEnd                                                    ;A0B7B3;
    LDY.W #$FFF4                                                         ;A0B7B5;
    LDA.B DP_Temp12                                                      ;A0B7B8;
    BMI .negative                                                        ;A0B7BA;
    LDY.W #$000C                                                         ;A0B7BC;

  .negative:
    TYA                                                                  ;A0B7BF;
    CLC                                                                  ;A0B7C0;
    ADC.W SamusYPosition                                                 ;A0B7C1;
    STA.W SamusPreviousYPosition                                         ;A0B7C4;

  .YPositionEnd:
    LDA.W SamusXPosition                                                 ;A0B7C7;
    SEC                                                                  ;A0B7CA;
    SBC.W SamusPreviousXPosition                                         ;A0B7CB;
    STA.B DP_Temp12                                                      ;A0B7CE;
    JSL.L NegateA_A0B067                                                 ;A0B7D0;
    CMP.W #$000C                                                         ;A0B7D4;
    BMI .retrun                                                          ;A0B7D7;
    LDY.W #$FFF4                                                         ;A0B7D9;
    LDA.B DP_Temp12                                                      ;A0B7DC;
    BMI +                                                                ;A0B7DE;
    LDY.W #$000C                                                         ;A0B7E0;

+   TYA                                                                  ;A0B7E3;
    CLC                                                                  ;A0B7E4;
    ADC.W SamusXPosition                                                 ;A0B7E5;
    STA.W SamusPreviousXPosition                                         ;A0B7E8;

  .retrun:
    PLY                                                                  ;A0B7EB;
    PLX                                                                  ;A0B7EC;
    RTL                                                                  ;A0B7ED;


;;; $B7EE: Unsigned sine table ;;;
UnsignedSineTable:
; sin(t * pi / 80h) * FFFFh
    dw $0000,$0648,$0C8F,$12D5,$1917,$1F56,$258F,$2BC3                   ;A0B7EE;
    dw $31F1,$3816,$3E33,$4447,$4A4F,$504D,$563E,$5C21                   ;A0B7FE;
    dw $61F7,$67BD,$6D73,$7319,$78AC,$7E2E,$839B,$88F5                   ;A0B80E;
    dw $8E39,$9367,$987F,$9D7F,$A266,$A735,$ABEA,$B085                   ;A0B81E;
    dw $B504,$B967,$BDAE,$C1D7,$C5E3,$C9D0,$CD9E,$D14C                   ;A0B82E;
    dw $D4DA,$D847,$DB93,$DEBD,$E1C4,$E4A9,$E76A,$EA08                   ;A0B83E;
    dw $EC82,$EED7,$F108,$F313,$F4F9,$F6B9,$F852,$F9C6                   ;A0B84E;
    dw $FB13,$FC3A,$FD39,$FE12,$FEC3,$FF4D,$FFB0,$FFEB                   ;A0B85E;
    dw $FFFF,$FFEB,$FFB0,$FF4D,$FEC3,$FE12,$FD39,$FC3A                   ;A0B86E;
    dw $FB13,$F9C6,$F852,$F6B9,$F4F9,$F313,$F108,$EED7                   ;A0B87E;
    dw $EC82,$EA08,$E76A,$E4A9,$E1C4,$DEBD,$DB93,$D847                   ;A0B88E;
    dw $D4DA,$D14C,$CD9E,$C9D0,$C5E3,$C1D7,$BDAE,$B967                   ;A0B89E;
    dw $B504,$B085,$ABEA,$A735,$A266,$9D7F,$987F,$9367                   ;A0B8AE;
    dw $8E39,$88F5,$839B,$7E2E,$78AC,$7319,$6D73,$67BD                   ;A0B8BE;
    dw $61F7,$5C21,$563E,$504D,$4A4F,$4447,$3E33,$3816                   ;A0B8CE;
    dw $31F1,$2BC3,$258F,$1F56,$1917,$12D5,$0C8F,$0648                   ;A0B8DE;


;;; $B8EE: Fake Kraid death item drop routine ;;;
MiniKraidDeathItemDropRoutine:
    PHX                                                                  ;A0B8EE;
    PHY                                                                  ;A0B8EF;
    PHP                                                                  ;A0B8F0;
    LDA.W #$0004                                                         ;A0B8F1;
    STA.W NumberOfDrops                                                  ;A0B8F4;

  .loop:
    JSL.L GenerateRandomNumber                                           ;A0B8F7;
    AND.W #$001F                                                         ;A0B8FB;
    SEC                                                                  ;A0B8FE;
    SBC.W #$0010                                                         ;A0B8FF;
    CLC                                                                  ;A0B902;
    ADC.L EnemyProjectileData_SpecialDeathItemDropXOriginPosition        ;A0B903;
    STA.B DP_Temp12                                                      ;A0B907;
    LDA.W RandomNumberSeed                                               ;A0B909;
    AND.W #$1F00                                                         ;A0B90C;
    XBA                                                                  ;A0B90F;
    SEC                                                                  ;A0B910;
    SBC.W #$0010                                                         ;A0B911;
    CLC                                                                  ;A0B914;
    ADC.L EnemyProjectileData_SpecialDeathItemDropYOriginPosition        ;A0B915;
    STA.B DP_Temp14                                                      ;A0B919;
    LDA.W #EnemyHeaders_MiniKraid                                        ;A0B91B;
    JSL.L Spawn_Enemy_Drops                                              ;A0B91E;
    DEC.W NumberOfDrops                                                  ;A0B922;
    BNE .loop                                                            ;A0B925;
    PLP                                                                  ;A0B927;
    PLY                                                                  ;A0B928;
    PLX                                                                  ;A0B929;
    RTL                                                                  ;A0B92A;


;;; $B92B: Gold ninja space pirate death item drop routine ;;;
MetalNinjaPirateDeathItemDropRoutine:
    PHX                                                                  ;A0B92B;
    PHY                                                                  ;A0B92C;
    PHP                                                                  ;A0B92D;
    LDA.W #$0005                                                         ;A0B92E;
    STA.W NumberOfDrops                                                  ;A0B931;

  .loop:
    JSL.L GenerateRandomNumber                                           ;A0B934;
    AND.W #$001F                                                         ;A0B938;
    SEC                                                                  ;A0B93B;
    SBC.W #$0010                                                         ;A0B93C;
    CLC                                                                  ;A0B93F;
    ADC.L EnemyProjectileData_SpecialDeathItemDropXOriginPosition        ;A0B940;
    STA.B DP_Temp12                                                      ;A0B944;
    LDA.W RandomNumberSeed                                               ;A0B946;
    AND.W #$1F00                                                         ;A0B949;
    XBA                                                                  ;A0B94C;
    SEC                                                                  ;A0B94D;
    SBC.W #$0010                                                         ;A0B94E;
    CLC                                                                  ;A0B951;
    ADC.L EnemyProjectileData_SpecialDeathItemDropYOriginPosition        ;A0B952;
    STA.B DP_Temp14                                                      ;A0B956;
    LDA.W #EnemyHeaders_PirateGoldNinja                                  ;A0B958;
    JSL.L Spawn_Enemy_Drops                                              ;A0B95B;
    DEC.W NumberOfDrops                                                  ;A0B95F;
    BNE .loop                                                            ;A0B962;
    PLP                                                                  ;A0B964;
    PLY                                                                  ;A0B965;
    PLX                                                                  ;A0B966;
    RTL                                                                  ;A0B967;


;;; $B968: Metroid death item drop routine ;;;
MetroidDeathItemDropRoutine:
    PHX                                                                  ;A0B968;
    PHY                                                                  ;A0B969;
    PHP                                                                  ;A0B96A;
    LDA.W #$0005                                                         ;A0B96B;
    STA.W NumberOfDrops                                                  ;A0B96E;

  .loop:
    JSL.L GenerateRandomNumber                                           ;A0B971;
    AND.W #$001F                                                         ;A0B975;
    SEC                                                                  ;A0B978;
    SBC.W #$0010                                                         ;A0B979;
    CLC                                                                  ;A0B97C;
    ADC.L EnemyProjectileData_SpecialDeathItemDropXOriginPosition                                                        ;A0B97D;
    STA.B DP_Temp12                                                      ;A0B981;
    LDA.W RandomNumberSeed                                               ;A0B983;
    AND.W #$1F00                                                         ;A0B986;
    XBA                                                                  ;A0B989;
    SEC                                                                  ;A0B98A;
    SBC.W #$0010                                                         ;A0B98B;
    CLC                                                                  ;A0B98E;
    ADC.L EnemyProjectileData_SpecialDeathItemDropYOriginPosition                                                        ;A0B98F;
    STA.B DP_Temp14                                                      ;A0B993;
    LDA.W #EnemyHeaders_Metroid                                          ;A0B995;
    JSL.L Spawn_Enemy_Drops                                              ;A0B998;
    DEC.W NumberOfDrops                                                  ;A0B99C;
    BNE .loop                                                            ;A0B99F;
    PLP                                                                  ;A0B9A1;
    PLY                                                                  ;A0B9A2;
    PLX                                                                  ;A0B9A3;
    RTL                                                                  ;A0B9A4;


;;; $B9A5: Ridley death item drop routine ;;;
RidleyDeathItemDropRoutine:
    PHX                                                                  ;A0B9A5;
    PHY                                                                  ;A0B9A6;
    PHP                                                                  ;A0B9A7;
    LDA.W #$0010                                                         ;A0B9A8;
    STA.W NumberOfDrops                                                  ;A0B9AB;

  .loop:
    JSL.L GenerateRandomNumber                                           ;A0B9AE;
    AND.W #$007F                                                         ;A0B9B2;
    CLC                                                                  ;A0B9B5;
    ADC.W #$0040                                                         ;A0B9B6;
    STA.B DP_Temp12                                                      ;A0B9B9;
    LDA.W RandomNumberSeed                                               ;A0B9BB;
    AND.W #$3F00                                                         ;A0B9BE;
    XBA                                                                  ;A0B9C1;
    CLC                                                                  ;A0B9C2;
    ADC.W #$0140                                                         ;A0B9C3;
    STA.B DP_Temp14                                                      ;A0B9C6;
    LDA.W #EnemyHeaders_Ridley                                           ;A0B9C8;
    JSL.L Spawn_Enemy_Drops                                              ;A0B9CB;
    DEC.W NumberOfDrops                                                  ;A0B9CF;
    BNE .loop                                                            ;A0B9D2;
    PLP                                                                  ;A0B9D4;
    PLY                                                                  ;A0B9D5;
    PLX                                                                  ;A0B9D6;
    RTL                                                                  ;A0B9D7;


;;; $B9D8: Crocomire death item drop routine ;;;
CrocomireDeathItemDropRoutine:
    PHX                                                                  ;A0B9D8;
    PHY                                                                  ;A0B9D9;
    PHP                                                                  ;A0B9DA;
    LDA.W #$0010                                                         ;A0B9DB;
    STA.W NumberOfDrops                                                  ;A0B9DE;

  .loop:
    JSL.L GenerateRandomNumber                                           ;A0B9E1;
    AND.W #$007F                                                         ;A0B9E5;
    CLC                                                                  ;A0B9E8;
    ADC.W #$0240                                                         ;A0B9E9;
    STA.B DP_Temp12                                                      ;A0B9EC;
    LDA.W RandomNumberSeed                                               ;A0B9EE;
    AND.W #$3F00                                                         ;A0B9F1;
    XBA                                                                  ;A0B9F4;
    CLC                                                                  ;A0B9F5;
    ADC.W #$0060                                                         ;A0B9F6;
    STA.B DP_Temp14                                                      ;A0B9F9;
    LDA.W #EnemyHeaders_Crocomire                                        ;A0B9FB;
    JSL.L Spawn_Enemy_Drops                                              ;A0B9FE;
    DEC.W NumberOfDrops                                                  ;A0BA02;
    BNE .loop                                                            ;A0BA05;
    PLP                                                                  ;A0BA07;
    PLY                                                                  ;A0BA08;
    PLX                                                                  ;A0BA09;
    RTL                                                                  ;A0BA0A;


;;; $BA0B: Phantoon death item drop routine ;;;
PhantoonDeathItemDropRoutine:
    PHX                                                                  ;A0BA0B;
    PHY                                                                  ;A0BA0C;
    PHP                                                                  ;A0BA0D;
    LDA.W #$0010                                                         ;A0BA0E;
    STA.W NumberOfDrops                                                  ;A0BA11;

  .loop:
    JSL.L GenerateRandomNumber                                           ;A0BA14;
    AND.W #$007F                                                         ;A0BA18;
    CLC                                                                  ;A0BA1B;
    ADC.W #$0040                                                         ;A0BA1C;
    STA.B DP_Temp12                                                      ;A0BA1F;
    LDA.W RandomNumberSeed                                               ;A0BA21;
    AND.W #$3F00                                                         ;A0BA24;
    XBA                                                                  ;A0BA27;
    CLC                                                                  ;A0BA28;
    ADC.W #$0060                                                         ;A0BA29;
    STA.B DP_Temp14                                                      ;A0BA2C;
    LDA.W #EnemyHeaders_PhantoonBody                                     ;A0BA2E;
    JSL.L Spawn_Enemy_Drops                                              ;A0BA31;
    DEC.W NumberOfDrops                                                  ;A0BA35;
    BNE .loop                                                            ;A0BA38;
    PLP                                                                  ;A0BA3A;
    PLY                                                                  ;A0BA3B;
    PLX                                                                  ;A0BA3C;
    RTL                                                                  ;A0BA3D;


;;; $BA3E: Botwoon death item drop routine ;;;
BotwoonDeathItemDropRoutine:
    PHX                                                                  ;A0BA3E;
    PHY                                                                  ;A0BA3F;
    PHP                                                                  ;A0BA40;
    LDA.W #$0010                                                         ;A0BA41;
    STA.W NumberOfDrops                                                  ;A0BA44;

  .loop:
    JSL.L GenerateRandomNumber                                           ;A0BA47;
    AND.W #$007F                                                         ;A0BA4B;
    CLC                                                                  ;A0BA4E;
    ADC.W #$0040                                                         ;A0BA4F;
    STA.B DP_Temp12                                                      ;A0BA52;
    LDA.W RandomNumberSeed                                               ;A0BA54;
    AND.W #$3F00                                                         ;A0BA57;
    XBA                                                                  ;A0BA5A;
    CLC                                                                  ;A0BA5B;
    ADC.W #$0080                                                         ;A0BA5C;
    STA.B DP_Temp14                                                      ;A0BA5F;
    LDA.W #EnemyHeaders_Botwoon                                          ;A0BA61;
    JSL.L Spawn_Enemy_Drops                                              ;A0BA64;
    DEC.W NumberOfDrops                                                  ;A0BA68;
    BNE .loop                                                            ;A0BA6B;
    PLP                                                                  ;A0BA6D;
    PLY                                                                  ;A0BA6E;
    PLX                                                                  ;A0BA6F;
    RTL                                                                  ;A0BA70;


;;; $BA71: Kraid death item drop routine ;;;
KraidDeathItemDropRoutine:
    PHX                                                                  ;A0BA71;
    PHY                                                                  ;A0BA72;
    PHP                                                                  ;A0BA73;
    LDA.W #$0010                                                         ;A0BA74;
    STA.W NumberOfDrops                                                  ;A0BA77;

  .loop:
    JSL.L GenerateRandomNumber                                           ;A0BA7A;
    AND.W #$00FF                                                         ;A0BA7E;
    CLC                                                                  ;A0BA81;
    ADC.W #$0080                                                         ;A0BA82;
    STA.B DP_Temp12                                                      ;A0BA85;
    LDA.W RandomNumberSeed                                               ;A0BA87;
    AND.W #$3F00                                                         ;A0BA8A;
    XBA                                                                  ;A0BA8D;
    CLC                                                                  ;A0BA8E;
    ADC.W #$0160                                                         ;A0BA8F;
    STA.B DP_Temp14                                                      ;A0BA92;
    LDA.W #EnemyHeaders_Kraid                                            ;A0BA94;
    JSL.L Spawn_Enemy_Drops                                              ;A0BA97;
    DEC.W NumberOfDrops                                                  ;A0BA9B;
    BNE .loop                                                            ;A0BA9E;
    PLP                                                                  ;A0BAA0;
    PLY                                                                  ;A0BAA1;
    PLX                                                                  ;A0BAA2;
    RTL                                                                  ;A0BAA3;


;;; $BAA4: Bomb Torizo death item drop routine ;;;
BombTorizoDeathItemDropRoutine:
    PHX                                                                  ;A0BAA4;
    PHY                                                                  ;A0BAA5;
    PHP                                                                  ;A0BAA6;
    LDA.W #$0010                                                         ;A0BAA7;
    STA.W NumberOfDrops                                                  ;A0BAAA;

  .loop:
    JSL.L GenerateRandomNumber                                           ;A0BAAD;
    AND.W #$007F                                                         ;A0BAB1;
    CLC                                                                  ;A0BAB4;
    ADC.W #$0040                                                         ;A0BAB5;
    STA.B DP_Temp12                                                      ;A0BAB8;
    LDA.W RandomNumberSeed                                               ;A0BABA;
    AND.W #$3F00                                                         ;A0BABD;
    XBA                                                                  ;A0BAC0;
    CLC                                                                  ;A0BAC1;
    ADC.W #$0060                                                         ;A0BAC2;
    STA.B DP_Temp14                                                      ;A0BAC5;
    LDA.W #EnemyHeaders_BombTorizo                                       ;A0BAC7;
    JSL.L Spawn_Enemy_Drops                                              ;A0BACA;
    DEC.W NumberOfDrops                                                  ;A0BACE;
    BNE .loop                                                            ;A0BAD1;
    PLP                                                                  ;A0BAD3;
    PLY                                                                  ;A0BAD4;
    PLX                                                                  ;A0BAD5;
    RTL                                                                  ;A0BAD6;


;;; $BAD7: Golden Torizo death item drop routine ;;;
GoldenTorizoDeathItemDropRoutine:
    PHX                                                                  ;A0BAD7;
    PHY                                                                  ;A0BAD8;
    PHP                                                                  ;A0BAD9;
    LDA.W #$0010                                                         ;A0BADA;
    STA.W NumberOfDrops                                                  ;A0BADD;

  .loop:
    JSL.L GenerateRandomNumber                                           ;A0BAE0;
    AND.W #$00FF                                                         ;A0BAE4;
    CLC                                                                  ;A0BAE7;
    ADC.W #$0080                                                         ;A0BAE8;
    STA.B DP_Temp12                                                      ;A0BAEB;
    LDA.W RandomNumberSeed                                               ;A0BAED;
    AND.W #$3F00                                                         ;A0BAF0;
    XBA                                                                  ;A0BAF3;
    CLC                                                                  ;A0BAF4;
    ADC.W #$0120                                                         ;A0BAF5;
    STA.B DP_Temp14                                                      ;A0BAF8;
    LDA.W #EnemyHeaders_BombTorizo                                       ;A0BAFA;
    JSL.L Spawn_Enemy_Drops                                              ;A0BAFD;
    DEC.W NumberOfDrops                                                  ;A0BB01;
    BNE .loop                                                            ;A0BB04;
    PLP                                                                  ;A0BB06;
    PLY                                                                  ;A0BB07;
    PLX                                                                  ;A0BB08;
    RTL                                                                  ;A0BB09;


;;; $BB0A: Spore Spawn death item drop routine ;;;
SporeSpawnDeathItemDropRoutine:
    PHX                                                                  ;A0BB0A;
    PHY                                                                  ;A0BB0B;
    PHP                                                                  ;A0BB0C;
    LDA.W #$0010                                                         ;A0BB0D;
    STA.W NumberOfDrops                                                  ;A0BB10;

  .loop:
    JSL.L GenerateRandomNumber                                           ;A0BB13;
    AND.W #$007F                                                         ;A0BB17;
    CLC                                                                  ;A0BB1A;
    ADC.W #$0040                                                         ;A0BB1B;
    STA.B DP_Temp12                                                      ;A0BB1E;
    LDA.W RandomNumberSeed                                               ;A0BB20;
    AND.W #$3F00                                                         ;A0BB23;
    XBA                                                                  ;A0BB26;
    CLC                                                                  ;A0BB27;
    ADC.W #$0210                                                         ;A0BB28;
    STA.B DP_Temp14                                                      ;A0BB2B;
    LDA.W #EnemyHeaders_SporeSpawn                                       ;A0BB2D;
    JSL.L Spawn_Enemy_Drops                                              ;A0BB30;
    DEC.W NumberOfDrops                                                  ;A0BB34;
    BNE .loop                                                            ;A0BB37;
    PLP                                                                  ;A0BB39;
    PLY                                                                  ;A0BB3A;
    PLX                                                                  ;A0BB3B;
    RTL                                                                  ;A0BB3C;


;;; $BB3D: Draygon death item drop routine ;;;
DraygonDeathItemDropRoutine:
    PHX                                                                  ;A0BB3D;
    PHY                                                                  ;A0BB3E;
    PHP                                                                  ;A0BB3F;
    LDA.W #$0010                                                         ;A0BB40;
    STA.W NumberOfDrops                                                  ;A0BB43;

  .loop:
    JSL.L GenerateRandomNumber                                           ;A0BB46;
    AND.W #$00FF                                                         ;A0BB4A;
    CLC                                                                  ;A0BB4D;
    ADC.W #$0080                                                         ;A0BB4E;
    STA.B DP_Temp12                                                      ;A0BB51;
    LDA.W RandomNumberSeed                                               ;A0BB53;
    AND.W #$3F00                                                         ;A0BB56;
    XBA                                                                  ;A0BB59;
    CLC                                                                  ;A0BB5A;
    ADC.W #$0160                                                         ;A0BB5B;
    STA.B DP_Temp14                                                      ;A0BB5E;
    LDA.W #EnemyHeaders_DraygonBody                                      ;A0BB60;
    JSL.L Spawn_Enemy_Drops                                              ;A0BB63;
    DEC.W NumberOfDrops                                                  ;A0BB67;
    BNE .loop                                                            ;A0BB6A;
    PLP                                                                  ;A0BB6C;
    PLY                                                                  ;A0BB6D;
    PLX                                                                  ;A0BB6E;
    RTL                                                                  ;A0BB6F;


;;; $BB70: Calculate the block containing a pixel position ;;;
CalculateTheBlockContainingAPixelPosition:
;; Parameters:
;;     [S] + 4: Y position
;;     [S] + 6: X position

; Call after pushing a X then Y pixel position onto the stack (2 bytes each)
; CurrentBlockIndex is set to the block index. The stack is cleaned up (do not try to pop Y and X position from stack)
    LDA.B $04,S                                                          ;A0BB70;
    LSR                                                                  ;A0BB72;
    LSR                                                                  ;A0BB73;
    LSR                                                                  ;A0BB74;
    LSR                                                                  ;A0BB75;
    SEP #$20                                                             ;A0BB76;
    STA.W $4202                                                          ;A0BB78;
    LDA.W RoomWidthBlocks                                                ;A0BB7B;
    STA.W $4203                                                          ;A0BB7E;
    REP #$20                                                             ;A0BB81;
    LDA.B $06,S                                                          ;A0BB83;
    LSR                                                                  ;A0BB85;
    LSR                                                                  ;A0BB86;
    LSR                                                                  ;A0BB87;
    LSR                                                                  ;A0BB88;
    CLC                                                                  ;A0BB89;
    ADC.W $4216                                                          ;A0BB8A;
    STA.W CurrentBlockIndex                                              ;A0BB8D;
    LDA.B $02,S                                                          ;A0BB90;
    STA.B $06,S                                                          ;A0BB92;
    LDA.B $01,S                                                          ;A0BB94;
    STA.B $05,S                                                          ;A0BB96;
    PLA                                                                  ;A0BB98;
    PLA                                                                  ;A0BB99;
    RTL                                                                  ;A0BB9A;


;;; $BB9B: Check if X distance between enemy and Samus is at least [A] ;;;
CheckIfXDistanceBetweenEnemyAndSamusIsAtLeastA:
;; Returns:
;;     Carry: Set if X distance between enemy and Samus is at least [A], clear otherwise
    PHA                                                                  ;A0BB9B;
    LDA.W SamusXPosition                                                 ;A0BB9C;
    SEC                                                                  ;A0BB9F;
    SBC.W Enemy.XPosition,X                                              ;A0BBA0;
    BPL +                                                                ;A0BBA3;
    EOR.W #$FFFF                                                         ;A0BBA5;
    INC                                                                  ;A0BBA8;

+   CMP.B $01,S                                                          ;A0BBA9;
    PLA                                                                  ;A0BBAB;
    RTL                                                                  ;A0BBAC;


if !FEATURE_KEEP_UNREFERENCED
;;; $BBAD: Unused. Check if Y distance between enemy and Samus is at least [A] ;;;
UNUSED_CheckIfYDistanceBetweenEnemyAndSamusIsAtLeastA_A0BBAD:
;; Returns:
;;     Carry: Set if Y distance between enemy and Samus is at least [A], clear otherwise
    PHA                                                                  ;A0BBAD;
    LDA.W SamusYPosition                                                 ;A0BBAE;
    SEC                                                                  ;A0BBB1;
    SBC.W Enemy.YPosition,X                                              ;A0BBB2;
    BPL +                                                                ;A0BBB5;
    EOR.W #$FFFF                                                         ;A0BBB7;
    INC                                                                  ;A0BBBA;

+   CMP.B $01,S                                                          ;A0BBBB;
    PLA                                                                  ;A0BBBD;
    RTL                                                                  ;A0BBBE;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $BBBF: Check for horizontal "solid" block collision ;;;
CheckForHorizontalSolidBlockCollision:
;; Parameters:
;;     $14.$12: Distance to check for collision (signed)
;; Returns:
;;     Carry: Set if collision, clear otherwise
    PHB                                                                  ;A0BBBF;
    SEP #$20                                                             ;A0BBC0;
    LDA.B #CheckForHorizontalSolidBlockCollision>>16                     ;A0BBC2;
    PHA                                                                  ;A0BBC4;
    PLB                                                                  ;A0BBC5;
    REP #$30                                                             ;A0BBC6;
    PHX                                                                  ;A0BBC8;
    LDA.W Enemy.YPosition,X                                              ;A0BBC9;
    SEC                                                                  ;A0BBCC;
    SBC.W Enemy.YHitboxRadius,X                                          ;A0BBCD;
    AND.W #$FFF0                                                         ;A0BBD0;
    STA.B DP_Temp1A                                                      ;A0BBD3;
    LDA.W Enemy.YPosition,X                                              ;A0BBD5;
    CLC                                                                  ;A0BBD8;
    ADC.W Enemy.YHitboxRadius,X                                          ;A0BBD9;
    DEC                                                                  ;A0BBDC;
    SEC                                                                  ;A0BBDD;
    SBC.B DP_Temp1A                                                      ;A0BBDE;
    LSR                                                                  ;A0BBE0;
    LSR                                                                  ;A0BBE1;
    LSR                                                                  ;A0BBE2;
    LSR                                                                  ;A0BBE3;
    STA.B DP_Temp1A                                                      ;A0BBE4;
    LDA.W Enemy.YPosition,X                                              ;A0BBE6;
    SEC                                                                  ;A0BBE9;
    SBC.W Enemy.YHitboxRadius,X                                          ;A0BBEA;
    LSR                                                                  ;A0BBED;
    LSR                                                                  ;A0BBEE;
    LSR                                                                  ;A0BBEF;
    LSR                                                                  ;A0BBF0;
    SEP #$20                                                             ;A0BBF1;
    STA.W $4202                                                          ;A0BBF3;
    LDA.W RoomWidthBlocks                                                ;A0BBF6;
    STA.W $4203                                                          ;A0BBF9;
    REP #$20                                                             ;A0BBFC;
    LDA.W Enemy.XSubPosition,X                                           ;A0BBFE;
    CLC                                                                  ;A0BC01;
    ADC.B DP_Temp12                                                      ;A0BC02;
    STA.B DP_Temp16                                                      ;A0BC04;
    LDA.W Enemy.XPosition,X                                              ;A0BC06;
    ADC.B DP_Temp14                                                      ;A0BC09;
    STA.B DP_Temp18                                                      ;A0BC0B;
    BIT.B DP_Temp14                                                      ;A0BC0D;
    BMI .targetLeftBoundary                                              ;A0BC0F;
    CLC                                                                  ;A0BC11;
    ADC.W Enemy.XHitboxRadius,X                                          ;A0BC12;
    DEC                                                                  ;A0BC15;
    BRA +                                                                ;A0BC16;

  .targetLeftBoundary:
    SEC                                                                  ;A0BC18;
    SBC.W Enemy.XHitboxRadius,X                                          ;A0BC19;

+   STA.B DP_Temp22                                                      ;A0BC1C;
    LSR                                                                  ;A0BC1E;
    LSR                                                                  ;A0BC1F;
    LSR                                                                  ;A0BC20;
    LSR                                                                  ;A0BC21;
    CLC                                                                  ;A0BC22;
    ADC.W $4216                                                          ;A0BC23;
    ASL                                                                  ;A0BC26;
    TAX                                                                  ;A0BC27;

  .loop:
    LDA.L LevelData,X                                                    ;A0BC28;
    BMI +                                                                ;A0BC2C;
    TXA                                                                  ;A0BC2E;
    CLC                                                                  ;A0BC2F;
    ADC.W RoomWidthBlocks                                                ;A0BC30;
    ADC.W RoomWidthBlocks                                                ;A0BC33;
    TAX                                                                  ;A0BC36;
    DEC.B DP_Temp1A                                                      ;A0BC37;
    BPL .loop                                                            ;A0BC39;
    PLX                                                                  ;A0BC3B;
    CLC                                                                  ;A0BC3C;
    PLB                                                                  ;A0BC3D;
    RTL                                                                  ;A0BC3E;

+   PLX                                                                  ;A0BC3F;
    STZ.B DP_Temp12                                                      ;A0BC40;
    LDA.B DP_Temp22                                                      ;A0BC42;
    BIT.B DP_Temp14                                                      ;A0BC44;
    BMI .movingLeft                                                      ;A0BC46;
    AND.W #$FFF0                                                         ;A0BC48;
    SEC                                                                  ;A0BC4B;
    SBC.W Enemy.XHitboxRadius,X                                          ;A0BC4C;
    SEC                                                                  ;A0BC4F;
    SBC.W Enemy.XPosition,X                                              ;A0BC50;
    BPL +                                                                ;A0BC53;
    LDA.W #$0000                                                         ;A0BC55;

+   STA.B DP_Temp14                                                      ;A0BC58;
    SEC                                                                  ;A0BC5A;
    PLB                                                                  ;A0BC5B;
    RTL                                                                  ;A0BC5C;

  .movingLeft:
    ORA.W #$000F                                                         ;A0BC5D;
    SEC                                                                  ;A0BC60;
    ADC.W Enemy.XHitboxRadius,X                                          ;A0BC61;
    SEC                                                                  ;A0BC64;
    SBC.W Enemy.XPosition,X                                              ;A0BC65;
    BMI +                                                                ;A0BC68;
    LDA.W #$0000                                                         ;A0BC6A;

+   EOR.W #$FFFF                                                         ;A0BC6D;
    INC                                                                  ;A0BC70;
    STA.B DP_Temp14                                                      ;A0BC71;
    SEC                                                                  ;A0BC73;
    PLB                                                                  ;A0BC74;
    RTL                                                                  ;A0BC75;


;;; $BC76: Check for vertical "solid" block collision ;;;
CheckForVerticalSolidBlockCollision:
;; Parameters:
;;     $14.$12: Distance to check for collision (signed)
;; Returns:
;;     Carry: Set if collision, clear otherwise
    PHB                                                                  ;A0BC76;
    SEP #$20                                                             ;A0BC77;
    LDA.B #CheckForVerticalSolidBlockCollision>>16                       ;A0BC79;
    PHA                                                                  ;A0BC7B;
    PLB                                                                  ;A0BC7C;
    REP #$30                                                             ;A0BC7D;
    PHX                                                                  ;A0BC7F;
    LDA.W Enemy.XPosition,X                                              ;A0BC80;
    SEC                                                                  ;A0BC83;
    SBC.W Enemy.XHitboxRadius,X                                          ;A0BC84;
    AND.W #$FFF0                                                         ;A0BC87;
    STA.B DP_Temp1A                                                      ;A0BC8A;
    LDA.W Enemy.XPosition,X                                              ;A0BC8C;
    CLC                                                                  ;A0BC8F;
    ADC.W Enemy.XHitboxRadius,X                                          ;A0BC90;
    DEC                                                                  ;A0BC93;
    SEC                                                                  ;A0BC94;
    SBC.B DP_Temp1A                                                      ;A0BC95;
    LSR                                                                  ;A0BC97;
    LSR                                                                  ;A0BC98;
    LSR                                                                  ;A0BC99;
    LSR                                                                  ;A0BC9A;
    STA.B DP_Temp1A                                                      ;A0BC9B;
    LDA.W Enemy.YSubPosition,X                                           ;A0BC9D;
    CLC                                                                  ;A0BCA0;
    ADC.B DP_Temp12                                                      ;A0BCA1;
    STA.B DP_Temp16                                                      ;A0BCA3;
    LDA.W Enemy.YPosition,X                                              ;A0BCA5;
    ADC.B DP_Temp14                                                      ;A0BCA8;
    STA.B DP_Temp18                                                      ;A0BCAA;
    BIT.B DP_Temp14                                                      ;A0BCAC;
    BMI .targetFrontBoundary                                             ;A0BCAE;
    CLC                                                                  ;A0BCB0;
    ADC.W Enemy.YHitboxRadius,X                                          ;A0BCB1;
    DEC                                                                  ;A0BCB4;
    BRA +                                                                ;A0BCB5;

  .targetFrontBoundary:
    SEC                                                                  ;A0BCB7;
    SBC.W Enemy.YHitboxRadius,X                                          ;A0BCB8;

+   STA.B DP_Temp22                                                      ;A0BCBB;
    LSR                                                                  ;A0BCBD;
    LSR                                                                  ;A0BCBE;
    LSR                                                                  ;A0BCBF;
    LSR                                                                  ;A0BCC0;
    SEP #$20                                                             ;A0BCC1;
    STA.W $4202                                                          ;A0BCC3;
    LDA.W RoomWidthBlocks                                                ;A0BCC6;
    STA.W $4203                                                          ;A0BCC9;
    REP #$20                                                             ;A0BCCC;
    LDA.W Enemy.XPosition,X                                              ;A0BCCE;
    SEC                                                                  ;A0BCD1;
    SBC.W Enemy.XHitboxRadius,X                                          ;A0BCD2;
    LSR                                                                  ;A0BCD5;
    LSR                                                                  ;A0BCD6;
    LSR                                                                  ;A0BCD7;
    LSR                                                                  ;A0BCD8;
    CLC                                                                  ;A0BCD9;
    ADC.W $4216                                                          ;A0BCDA;
    ASL                                                                  ;A0BCDD;
    TAX                                                                  ;A0BCDE;

  .loop:
    LDA.L LevelData,X                                                    ;A0BCDF;
    BMI +                                                                ;A0BCE3;
    INX                                                                  ;A0BCE5;
    INX                                                                  ;A0BCE6;
    DEC.B DP_Temp1A                                                      ;A0BCE7;
    BPL .loop                                                            ;A0BCE9;
    PLX                                                                  ;A0BCEB;
    CLC                                                                  ;A0BCEC;
    PLB                                                                  ;A0BCED;
    RTL                                                                  ;A0BCEE;

+   PLX                                                                  ;A0BCEF;
    STZ.B DP_Temp12                                                      ;A0BCF0;
    LDA.B DP_Temp22                                                      ;A0BCF2;
    BIT.B DP_Temp14                                                      ;A0BCF4;
    BMI .movingUp                                                        ;A0BCF6;
    AND.W #$FFF0                                                         ;A0BCF8;
    SEC                                                                  ;A0BCFB;
    SBC.W Enemy.YHitboxRadius,X                                          ;A0BCFC;
    SEC                                                                  ;A0BCFF;
    SBC.W Enemy.YPosition,X                                              ;A0BD00;
    BPL .returnCarrySet                                                  ;A0BD03;
    LDA.W #$0000                                                         ;A0BD05;

  .returnCarrySet:
    STA.B DP_Temp14                                                      ;A0BD08;
    SEC                                                                  ;A0BD0A;
    PLB                                                                  ;A0BD0B;
    RTL                                                                  ;A0BD0C;

  .movingUp:
    ORA.W #$000F                                                         ;A0BD0D;
    SEC                                                                  ;A0BD10;
    ADC.W Enemy.YHitboxRadius,X                                          ;A0BD11;
    SEC                                                                  ;A0BD14;
    SBC.W Enemy.YPosition,X                                              ;A0BD15;
    BMI +                                                                ;A0BD18;
    LDA.W #$0000                                                         ;A0BD1A;

+   EOR.W #$FFFF                                                         ;A0BD1D;
    INC                                                                  ;A0BD20;
    STA.B DP_Temp14                                                      ;A0BD21;
    SEC                                                                  ;A0BD23;
    PLB                                                                  ;A0BD24;
    RTL                                                                  ;A0BD25;


if !FEATURE_KEEP_UNREFERENCED
;;; $BD26: Unused. Move enemy right by [$14].[$12], no block collision reactions ;;;
UNUSED_MoveEnemyRight_NoBlockCollisionReactions_A0BD26:
;; Parameters:
;;     A: Direction. 0 = left, 1 = right
;;     $14.$12: Distance to move (signed)
;; Returns:
;;     Carry: Set if collision, clear otherwise
    PHB                                                                  ;A0BD26;
    SEP #$20                                                             ;A0BD27;
    LDA.B #UNUSED_MoveEnemyRight_NoBlockCollisionReactions_A0BD26>>16    ;A0BD29;
    PHA                                                                  ;A0BD2B;
    PLB                                                                  ;A0BD2C;
    REP #$30                                                             ;A0BD2D;
    PHX                                                                  ;A0BD2F;
    STA.B DP_Temp1C                                                      ;A0BD30;
    LDA.W Enemy.YPosition,X                                              ;A0BD32;
    SEC                                                                  ;A0BD35;
    SBC.W Enemy.YHitboxRadius,X                                          ;A0BD36;
    AND.W #$FFF0                                                         ;A0BD39;
    STA.B DP_Temp1A                                                      ;A0BD3C;
    LDA.W Enemy.YPosition,X                                              ;A0BD3E;
    CLC                                                                  ;A0BD41;
    ADC.W Enemy.YHitboxRadius,X                                          ;A0BD42;
    DEC                                                                  ;A0BD45;
    SEC                                                                  ;A0BD46;
    SBC.B DP_Temp1A                                                      ;A0BD47;
    LSR                                                                  ;A0BD49;
    LSR                                                                  ;A0BD4A;
    LSR                                                                  ;A0BD4B;
    LSR                                                                  ;A0BD4C;
    STA.B DP_Temp1A                                                      ;A0BD4D;
    LDA.W Enemy.YPosition,X                                              ;A0BD4F;
    SEC                                                                  ;A0BD52;
    SBC.W Enemy.YHitboxRadius,X                                          ;A0BD53;
    LSR                                                                  ;A0BD56;
    LSR                                                                  ;A0BD57;
    LSR                                                                  ;A0BD58;
    LSR                                                                  ;A0BD59;
    SEP #$20                                                             ;A0BD5A;
    STA.W $4202                                                          ;A0BD5C;
    LDA.W RoomWidthBlocks                                                ;A0BD5F;
    STA.W $4203                                                          ;A0BD62;
    REP #$20                                                             ;A0BD65;
    LDA.B DP_Temp1C                                                      ;A0BD67;
    LSR                                                                  ;A0BD69;
    BCC .zero1C                                                          ;A0BD6A;
    LDA.W Enemy.XSubPosition,X                                           ;A0BD6C;
    CLC                                                                  ;A0BD6F;
    ADC.B DP_Temp12                                                      ;A0BD70;
    STA.B DP_Temp16                                                      ;A0BD72;
    LDA.W Enemy.XPosition,X                                              ;A0BD74;
    ADC.B DP_Temp14                                                      ;A0BD77;
    STA.B DP_Temp18                                                      ;A0BD79;
    CLC                                                                  ;A0BD7B;
    ADC.W Enemy.XHitboxRadius,X                                          ;A0BD7C;
    DEC                                                                  ;A0BD7F;
    BRA +                                                                ;A0BD80;

  .zero1C:
    LDA.W Enemy.XSubPosition,X                                           ;A0BD82;
    SEC                                                                  ;A0BD85;
    SBC.B DP_Temp12                                                      ;A0BD86;
    STA.B DP_Temp16                                                      ;A0BD88;
    LDA.W Enemy.XPosition,X                                              ;A0BD8A;
    SBC.B DP_Temp14                                                      ;A0BD8D;
    STA.B DP_Temp18                                                      ;A0BD8F;
    SEC                                                                  ;A0BD91;
    SBC.W Enemy.XHitboxRadius,X                                          ;A0BD92;

+   STA.B DP_Temp22                                                      ;A0BD95;
    LSR                                                                  ;A0BD97;
    LSR                                                                  ;A0BD98;
    LSR                                                                  ;A0BD99;
    LSR                                                                  ;A0BD9A;
    CLC                                                                  ;A0BD9B;
    ADC.W $4216                                                          ;A0BD9C;
    ASL                                                                  ;A0BD9F;
    TAX                                                                  ;A0BDA0;

  .loop:
    LDA.L LevelData,X                                                    ;A0BDA1;
    BMI +                                                                ;A0BDA5;
    TXA                                                                  ;A0BDA7;
    CLC                                                                  ;A0BDA8;
    ADC.W RoomWidthBlocks                                                ;A0BDA9;
    ADC.W RoomWidthBlocks                                                ;A0BDAC;
    TAX                                                                  ;A0BDAF;
    DEC.B DP_Temp1A                                                      ;A0BDB0;
    BPL .loop                                                            ;A0BDB2;
    PLX                                                                  ;A0BDB4;
    LDA.B DP_Temp16                                                      ;A0BDB5;
    STA.W Enemy.XSubPosition,X                                           ;A0BDB7;
    LDA.B DP_Temp18                                                      ;A0BDBA;
    STA.W Enemy.XPosition,X                                              ;A0BDBC;
    CLC                                                                  ;A0BDBF;
    PLB                                                                  ;A0BDC0;
    RTL                                                                  ;A0BDC1;

+   PLX                                                                  ;A0BDC2;
    STZ.W Enemy.XSubPosition,X                                           ;A0BDC3;
    LDA.B DP_Temp1C                                                      ;A0BDC6;
    LSR                                                                  ;A0BDC8;
    BCC .movingLeft                                                      ;A0BDC9;
    LDA.B DP_Temp22                                                      ;A0BDCB;
    AND.W #$FFF0                                                         ;A0BDCD;
    SEC                                                                  ;A0BDD0;
    SBC.W Enemy.XHitboxRadius,X                                          ;A0BDD1;
    CMP.W Enemy.XPosition,X                                              ;A0BDD4;
    BMI .returnCarrySetUpper                                             ;A0BDD7;
    STA.W Enemy.XPosition,X                                              ;A0BDD9;

  .returnCarrySetUpper:
    SEC                                                                  ;A0BDDC;
    PLB                                                                  ;A0BDDD;
    RTL                                                                  ;A0BDDE;

  .movingLeft:
    LDA.B DP_Temp22                                                      ;A0BDDF;
    ORA.W #$000F                                                         ;A0BDE1;
    SEC                                                                  ;A0BDE4;
    ADC.W Enemy.XHitboxRadius,X                                          ;A0BDE5;
    SEC                                                                  ;A0BDE8;
    CMP.W Enemy.XPosition,X                                              ;A0BDE9;
    BEQ .storeX                                                          ;A0BDEC;
    BPL .returnCarrySetLower                                             ;A0BDEE;

  .storeX:
    STA.W Enemy.XPosition,X                                              ;A0BDF0;

  .returnCarrySetLower:
    SEC                                                                  ;A0BDF3;
    PLB                                                                  ;A0BDF4;
    RTL                                                                  ;A0BDF5;


;;; $BDF6: Unused. Move enemy down by [$14].[$12], no block collision reactions ;;;
UNUSED_MoveEnemyDown_NoBlockCollisionReactions_A0BDF6:
;; Parameters:
;;     A: Direction. 0 = up, 1 = down
;;     $14.$12: Distance to move (unsigned)
;; Returns:
;;     Carry: Set if collision, clear otherwise
    PHB                                                                  ;A0BDF6;
    SEP #$20                                                             ;A0BDF7;
    LDA.B #UNUSED_MoveEnemyDown_NoBlockCollisionReactions_A0BDF6>>16     ;A0BDF9;
    PHA                                                                  ;A0BDFB;
    PLB                                                                  ;A0BDFC;
    REP #$30                                                             ;A0BDFD;
    STA.B DP_Temp1C                                                      ;A0BDFF;
    PHX                                                                  ;A0BE01;
    LDA.W Enemy.XPosition,X                                              ;A0BE02;
    SEC                                                                  ;A0BE05;
    SBC.W Enemy.XHitboxRadius,X                                          ;A0BE06;
    AND.W #$FFF0                                                         ;A0BE09;
    STA.B DP_Temp1A                                                      ;A0BE0C;
    LDA.W Enemy.XPosition,X                                              ;A0BE0E;
    CLC                                                                  ;A0BE11;
    ADC.W Enemy.XHitboxRadius,X                                          ;A0BE12;
    DEC                                                                  ;A0BE15;
    SEC                                                                  ;A0BE16;
    SBC.B DP_Temp1A                                                      ;A0BE17;
    LSR                                                                  ;A0BE19;
    LSR                                                                  ;A0BE1A;
    LSR                                                                  ;A0BE1B;
    LSR                                                                  ;A0BE1C;
    STA.B DP_Temp1A                                                      ;A0BE1D;
    LDA.B DP_Temp1C                                                      ;A0BE1F;
    LSR                                                                  ;A0BE21;
    BCC .zero1C                                                          ;A0BE22;
    LDA.W Enemy.YSubPosition,X                                           ;A0BE24;
    CLC                                                                  ;A0BE27;
    ADC.B DP_Temp12                                                      ;A0BE28;
    STA.B DP_Temp16                                                      ;A0BE2A;
    LDA.W Enemy.YPosition,X                                              ;A0BE2C;
    ADC.B DP_Temp14                                                      ;A0BE2F;
    STA.B DP_Temp18                                                      ;A0BE31;
    CLC                                                                  ;A0BE33;
    ADC.W Enemy.YHitboxRadius,X                                          ;A0BE34;
    DEC                                                                  ;A0BE37;
    BRA +                                                                ;A0BE38;

  .zero1C:
    LDA.W Enemy.YSubPosition,X                                           ;A0BE3A;
    SEC                                                                  ;A0BE3D;
    SBC.B DP_Temp12                                                      ;A0BE3E;
    STA.B DP_Temp16                                                      ;A0BE40;
    LDA.W Enemy.YPosition,X                                              ;A0BE42;
    SBC.B DP_Temp14                                                      ;A0BE45;
    STA.B DP_Temp18                                                      ;A0BE47;
    SEC                                                                  ;A0BE49;
    SBC.W Enemy.YHitboxRadius,X                                          ;A0BE4A;

+   STA.B DP_Temp22                                                      ;A0BE4D;
    LSR                                                                  ;A0BE4F;
    LSR                                                                  ;A0BE50;
    LSR                                                                  ;A0BE51;
    LSR                                                                  ;A0BE52;
    SEP #$20                                                             ;A0BE53;
    STA.W $4202                                                          ;A0BE55;
    LDA.W RoomWidthBlocks                                                ;A0BE58;
    STA.W $4203                                                          ;A0BE5B;
    REP #$20                                                             ;A0BE5E;
    LDA.W Enemy.XPosition,X                                              ;A0BE60;
    SEC                                                                  ;A0BE63;
    SBC.W Enemy.XHitboxRadius,X                                          ;A0BE64;
    LSR                                                                  ;A0BE67;
    LSR                                                                  ;A0BE68;
    LSR                                                                  ;A0BE69;
    LSR                                                                  ;A0BE6A;
    CLC                                                                  ;A0BE6B;
    ADC.W $4216                                                          ;A0BE6C;
    ASL                                                                  ;A0BE6F;
    TAX                                                                  ;A0BE70;

  .loop:
    LDA.L LevelData,X                                                    ;A0BE71;
    BMI +                                                                ;A0BE75;
    INX                                                                  ;A0BE77;
    INX                                                                  ;A0BE78;
    DEC.B DP_Temp1A                                                      ;A0BE79;
    BPL .loop                                                            ;A0BE7B;
    PLX                                                                  ;A0BE7D;
    LDA.B DP_Temp16                                                      ;A0BE7E;
    STA.W Enemy.YSubPosition,X                                           ;A0BE80;
    LDA.B DP_Temp18                                                      ;A0BE83;
    STA.W Enemy.YPosition,X                                              ;A0BE85;
    CLC                                                                  ;A0BE88;
    PLB                                                                  ;A0BE89;
    RTL                                                                  ;A0BE8A;

+   PLX                                                                  ;A0BE8B;
    STZ.W Enemy.YSubPosition,X                                           ;A0BE8C;
    LDA.B DP_Temp1C                                                      ;A0BE8F;
    LSR                                                                  ;A0BE91;
    BCC .movingUp                                                        ;A0BE92;
    LDA.B DP_Temp22                                                      ;A0BE94;
    AND.W #$FFF0                                                         ;A0BE96;
    SEC                                                                  ;A0BE99;
    SBC.W Enemy.YHitboxRadius,X                                          ;A0BE9A;
    CMP.W Enemy.YPosition,X                                              ;A0BE9D;
    BMI .returnCarrySetUpper                                             ;A0BEA0;
    STA.W Enemy.YPosition,X                                              ;A0BEA2;

  .returnCarrySetUpper:
    SEC                                                                  ;A0BEA5;
    PLB                                                                  ;A0BEA6;
    RTL                                                                  ;A0BEA7;

  .movingUp:
    LDA.B DP_Temp22                                                      ;A0BEA8;
    ORA.W #$000F                                                         ;A0BEAA;
    SEC                                                                  ;A0BEAD;
    ADC.W Enemy.YHitboxRadius,X                                          ;A0BEAE;
    SEC                                                                  ;A0BEB1;
    CMP.W Enemy.YPosition,X                                              ;A0BEB2;
    BEQ .storeY                                                          ;A0BEB5;
    BPL .returnCarrySetLower                                             ;A0BEB7;

  .storeY:
    STA.W Enemy.YPosition,X                                              ;A0BEB9;

  .returnCarrySetLower:
    SEC                                                                  ;A0BEBC;
    PLB                                                                  ;A0BEBD;
    RTL                                                                  ;A0BEBE;


;;; $BEBF: Unused. Check for horizontal "solid" block collision ;;;
UNUSED_CheckForHorizontalSolidBlockCollision_A0BEBF:
;; Parameters:
;;     A: Direction. 0 = left, 1 = right
;;     $14.$12: Distance to check for collision (unsigned)
;; Returns:
;;     Carry: Set if collision, clear otherwise
    STA.B DP_Temp1C                                                      ;A0BEBF;
    PHB                                                                  ;A0BEC1;
    SEP #$20                                                             ;A0BEC2;
    LDA.B #UNUSED_CheckForHorizontalSolidBlockCollision_A0BEBF>>16       ;A0BEC4;
    PHA                                                                  ;A0BEC6;
    PLB                                                                  ;A0BEC7;
    REP #$30                                                             ;A0BEC8;
    PHX                                                                  ;A0BECA;
    LDA.W Enemy.YPosition,X                                              ;A0BECB;
    SEC                                                                  ;A0BECE;
    SBC.W Enemy.YHitboxRadius,X                                          ;A0BECF;
    AND.W #$FFF0                                                         ;A0BED2;
    STA.B DP_Temp1A                                                      ;A0BED5;
    LDA.W Enemy.YPosition,X                                              ;A0BED7;
    CLC                                                                  ;A0BEDA;
    ADC.W Enemy.YHitboxRadius,X                                          ;A0BEDB;
    DEC                                                                  ;A0BEDE;
    SEC                                                                  ;A0BEDF;
    SBC.B DP_Temp1A                                                      ;A0BEE0;
    LSR                                                                  ;A0BEE2;
    LSR                                                                  ;A0BEE3;
    LSR                                                                  ;A0BEE4;
    LSR                                                                  ;A0BEE5;
    STA.B DP_Temp1A                                                      ;A0BEE6;
    LDA.W Enemy.YPosition,X                                              ;A0BEE8;
    SEC                                                                  ;A0BEEB;
    SBC.W Enemy.YHitboxRadius,X                                          ;A0BEEC;
    LSR                                                                  ;A0BEEF;
    LSR                                                                  ;A0BEF0;
    LSR                                                                  ;A0BEF1;
    LSR                                                                  ;A0BEF2;
    SEP #$20                                                             ;A0BEF3;
    STA.W $4202                                                          ;A0BEF5;
    LDA.W RoomWidthBlocks                                                ;A0BEF8;
    STA.W $4203                                                          ;A0BEFB;
    REP #$20                                                             ;A0BEFE;
    LDA.B DP_Temp1C                                                      ;A0BF00;
    LSR                                                                  ;A0BF02;
    BCC .zero1C                                                          ;A0BF03;
    LDA.W Enemy.XSubPosition,X                                           ;A0BF05;
    CLC                                                                  ;A0BF08;
    ADC.B DP_Temp12                                                      ;A0BF09;
    STA.B DP_Temp16                                                      ;A0BF0B;
    LDA.W Enemy.XPosition,X                                              ;A0BF0D;
    ADC.B DP_Temp14                                                      ;A0BF10;
    STA.B DP_Temp18                                                      ;A0BF12;
    CLC                                                                  ;A0BF14;
    ADC.W Enemy.XHitboxRadius,X                                          ;A0BF15;
    DEC                                                                  ;A0BF18;
    BRA +                                                                ;A0BF19;

  .zero1C:
    LDA.W Enemy.XSubPosition,X                                           ;A0BF1B;
    SEC                                                                  ;A0BF1E;
    SBC.B DP_Temp12                                                      ;A0BF1F;
    STA.B DP_Temp16                                                      ;A0BF21;
    LDA.W Enemy.XPosition,X                                              ;A0BF23;
    SBC.B DP_Temp14                                                      ;A0BF26;
    STA.B DP_Temp18                                                      ;A0BF28;
    SEC                                                                  ;A0BF2A;
    SBC.W Enemy.XHitboxRadius,X                                          ;A0BF2B;

+   STA.B DP_Temp22                                                      ;A0BF2E;
    LSR                                                                  ;A0BF30;
    LSR                                                                  ;A0BF31;
    LSR                                                                  ;A0BF32;
    LSR                                                                  ;A0BF33;
    CLC                                                                  ;A0BF34;
    ADC.W $4216                                                          ;A0BF35;
    ASL                                                                  ;A0BF38;
    TAX                                                                  ;A0BF39;

  .loop:
    LDA.L LevelData,X                                                    ;A0BF3A;
    BMI +                                                                ;A0BF3E;
    TXA                                                                  ;A0BF40;
    CLC                                                                  ;A0BF41;
    ADC.W RoomWidthBlocks                                                ;A0BF42;
    ADC.W RoomWidthBlocks                                                ;A0BF45;
    TAX                                                                  ;A0BF48;
    DEC.B DP_Temp1A                                                      ;A0BF49;
    BPL .loop                                                            ;A0BF4B;
    PLX                                                                  ;A0BF4D;
    CLC                                                                  ;A0BF4E;
    PLB                                                                  ;A0BF4F;
    RTL                                                                  ;A0BF50;

+   PLX                                                                  ;A0BF51;
    STZ.B DP_Temp12                                                      ;A0BF52;
    LDA.B DP_Temp1C                                                      ;A0BF54;
    LSR                                                                  ;A0BF56;
    BCC .movingLeft                                                      ;A0BF57;
    LDA.B DP_Temp22                                                      ;A0BF59;
    AND.W #$FFF0                                                         ;A0BF5B;
    SEC                                                                  ;A0BF5E;
    SBC.W Enemy.XHitboxRadius,X                                          ;A0BF5F;
    SBC.W Enemy.XPosition,X                                              ;A0BF62;
    BPL +                                                                ;A0BF65;
    LDA.W #$0000                                                         ;A0BF67;

+   STA.B DP_Temp14                                                      ;A0BF6A;
    SEC                                                                  ;A0BF6C;
    PLB                                                                  ;A0BF6D;
    RTL                                                                  ;A0BF6E;

  .movingLeft:
    LDA.B DP_Temp22                                                      ;A0BF6F;
    ORA.W #$000F                                                         ;A0BF71;
    SEC                                                                  ;A0BF74;
    ADC.W Enemy.XHitboxRadius,X                                          ;A0BF75;
    SEC                                                                  ;A0BF78;
    SBC.W Enemy.XPosition,X                                              ;A0BF79;
    BMI +                                                                ;A0BF7C;
    LDA.W #$0000                                                         ;A0BF7E;

+   EOR.W #$FFFF                                                         ;A0BF81;
    INC                                                                  ;A0BF84;
    STA.B DP_Temp14                                                      ;A0BF85;
    SEC                                                                  ;A0BF87;
    PLB                                                                  ;A0BF88;
    RTL                                                                  ;A0BF89;
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
    STA.B DP_Temp1C                                                      ;A0BF8A;
    PHB                                                                  ;A0BF8C;
    SEP #$20                                                             ;A0BF8D;
    LDA.B #CheckForVerticalSolidBlockCollision_SkreeMetaree>>16          ;A0BF8F;
    PHA                                                                  ;A0BF91;
    PLB                                                                  ;A0BF92;
    REP #$30                                                             ;A0BF93;
    PHX                                                                  ;A0BF95;
    LDA.W Enemy.XPosition,X                                              ;A0BF96;
    SEC                                                                  ;A0BF99;
    SBC.W Enemy.XHitboxRadius,X                                          ;A0BF9A;
    AND.W #$FFF0                                                         ;A0BF9D;
    STA.B DP_Temp1A                                                      ;A0BFA0;
    LDA.W Enemy.XPosition,X                                              ;A0BFA2;
    CLC                                                                  ;A0BFA5;
    ADC.W Enemy.XHitboxRadius,X                                          ;A0BFA6;
    DEC                                                                  ;A0BFA9;
    SEC                                                                  ;A0BFAA;
    SBC.B DP_Temp1A                                                      ;A0BFAB;
    LSR                                                                  ;A0BFAD;
    LSR                                                                  ;A0BFAE;
    LSR                                                                  ;A0BFAF;
    LSR                                                                  ;A0BFB0;
    STA.B DP_Temp1A                                                      ;A0BFB1;
    LDA.B DP_Temp1C                                                      ;A0BFB3;
    LSR                                                                  ;A0BFB5;
    BCC .zero1C                                                          ;A0BFB6;
    LDA.W Enemy.YSubPosition,X                                           ;A0BFB8;
    CLC                                                                  ;A0BFBB;
    ADC.B DP_Temp12                                                      ;A0BFBC;
    STA.B DP_Temp16                                                      ;A0BFBE;
    LDA.W Enemy.YPosition,X                                              ;A0BFC0;
    ADC.B DP_Temp14                                                      ;A0BFC3;
    STA.B DP_Temp18                                                      ;A0BFC5;
    CLC                                                                  ;A0BFC7;
    ADC.W Enemy.YHitboxRadius,X                                          ;A0BFC8;
    DEC                                                                  ;A0BFCB;
    BRA +                                                                ;A0BFCC;

  .zero1C:
    LDA.W Enemy.YSubPosition,X                                           ;A0BFCE;
    SEC                                                                  ;A0BFD1;
    SBC.B DP_Temp12                                                      ;A0BFD2;
    STA.B DP_Temp16                                                      ;A0BFD4;
    LDA.W Enemy.YPosition,X                                              ;A0BFD6;
    SBC.B DP_Temp14                                                      ;A0BFD9;
    STA.B DP_Temp18                                                      ;A0BFDB;
    SEC                                                                  ;A0BFDD;
    SBC.W Enemy.YHitboxRadius,X                                          ;A0BFDE;

+   STA.B DP_Temp22                                                      ;A0BFE1;
    LSR                                                                  ;A0BFE3;
    LSR                                                                  ;A0BFE4;
    LSR                                                                  ;A0BFE5;
    LSR                                                                  ;A0BFE6;
    SEP #$20                                                             ;A0BFE7;
    STA.W $4202                                                          ;A0BFE9;
    LDA.W RoomWidthBlocks                                                ;A0BFEC;
    STA.W $4203                                                          ;A0BFEF;
    REP #$20                                                             ;A0BFF2;
    LDA.W Enemy.XPosition,X                                              ;A0BFF4;
    SEC                                                                  ;A0BFF7;
    SBC.W Enemy.XHitboxRadius,X                                          ;A0BFF8;
    LSR                                                                  ;A0BFFB;
    LSR                                                                  ;A0BFFC;
    LSR                                                                  ;A0BFFD;
    LSR                                                                  ;A0BFFE;
    CLC                                                                  ;A0BFFF;
    ADC.W $4216                                                          ;A0C000;
    ASL                                                                  ;A0C003;
    TAX                                                                  ;A0C004;

  .loop:
    LDA.L LevelData,X                                                    ;A0C005;
    BMI +                                                                ;A0C009;
    INX                                                                  ;A0C00B;
    INX                                                                  ;A0C00C;
    DEC.B DP_Temp1A                                                      ;A0C00D;
    BPL .loop                                                            ;A0C00F;
    PLX                                                                  ;A0C011;
    CLC                                                                  ;A0C012;
    PLB                                                                  ;A0C013;
    RTL                                                                  ;A0C014;

+   PLX                                                                  ;A0C015;
    STZ.B DP_Temp12                                                      ;A0C016;
    LDA.B DP_Temp1C                                                      ;A0C018;
    LSR                                                                  ;A0C01A;
    BCC .movingUp                                                        ;A0C01B;
    LDA.B DP_Temp22                                                      ;A0C01D;
    AND.W #$FFF0                                                         ;A0C01F;
    SEC                                                                  ;A0C022;
    SBC.W Enemy.YHitboxRadius,X                                          ;A0C023;
    SBC.W Enemy.YPosition,X                                              ;A0C026;
    BPL +                                                                ;A0C029;
    LDA.W #$0000                                                         ;A0C02B;

+   STA.B DP_Temp14                                                      ;A0C02E;
    SEC                                                                  ;A0C030;
    PLB                                                                  ;A0C031;
    RTL                                                                  ;A0C032;

  .movingUp:
    LDA.B DP_Temp22                                                      ;A0C033;
    ORA.W #$000F                                                         ;A0C035;
    SEC                                                                  ;A0C038;
    ADC.W Enemy.YHitboxRadius,X                                          ;A0C039;
    SEC                                                                  ;A0C03C;
    SBC.W Enemy.YPosition,X                                              ;A0C03D;
    BMI +                                                                ;A0C040;
    LDA.W #$0000                                                         ;A0C042;

+   EOR.W #$FFFF                                                         ;A0C045;
    INC                                                                  ;A0C048;
    STA.B DP_Temp14                                                      ;A0C049;
    SEC                                                                  ;A0C04B;
    PLB                                                                  ;A0C04C;
    RTL                                                                  ;A0C04D;


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
    PHP                                                                  ;A0C04E;
    REP #$30                                                             ;A0C04F;
    LDA.W SamusXPosition                                                 ;A0C051;
    SEC                                                                  ;A0C054;
    SBC.W EnemyProjectile_XPositions,X                                   ;A0C055;
    STA.B DP_Temp12                                                      ;A0C058;
    LDA.W SamusYPosition                                                 ;A0C05A;
    SEC                                                                  ;A0C05D;
    SBC.W EnemyProjectile_YPositions,X                                   ;A0C05E;
    STA.B DP_Temp14                                                      ;A0C061;
    JMP.W CalculateAngleOfXYOffset                                       ;A0C063;


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
    PHP                                                                  ;A0C066;
    REP #$30                                                             ;A0C067;
    LDA.W SamusXPosition                                                 ;A0C069;
    SEC                                                                  ;A0C06C;
    SBC.W Enemy.XPosition,X                                              ;A0C06D;
    STA.B DP_Temp12                                                      ;A0C070;
    LDA.W SamusYPosition                                                 ;A0C072;
    SEC                                                                  ;A0C075;
    SBC.W Enemy.YPosition,X                                              ;A0C076;
    STA.B DP_Temp14                                                      ;A0C079;
    JMP.W CalculateAngleOfXYOffset                                       ;A0C07B;


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
    PHP                                                                  ;A0C07E;
    REP #$30                                                             ;A0C07F;
    LDA.W Enemy.XPosition,Y                                              ;A0C081;
    SEC                                                                  ;A0C084;
    SBC.W Enemy.XPosition,X                                              ;A0C085;
    STA.B DP_Temp12                                                      ;A0C088;
    LDA.W Enemy.YPosition,Y                                              ;A0C08A;
    SEC                                                                  ;A0C08D;
    SBC.W Enemy.YPosition,X                                              ;A0C08E;
    STA.B DP_Temp14                                                      ;A0C091;
    JMP.W CalculateAngleOfXYOffset                                       ;A0C093;
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
    PHP                                                                  ;A0C096;
    REP #$30                                                             ;A0C097;
    LDA.W Enemy.XPosition,X                                              ;A0C099;
    SEC                                                                  ;A0C09C;
    SBC.W Enemy.XPosition,Y                                              ;A0C09D;
    STA.B DP_Temp12                                                      ;A0C0A0;
    LDA.W Enemy.YPosition,X                                              ;A0C0A2;
    SEC                                                                  ;A0C0A5;
    SBC.W Enemy.YPosition,Y                                              ;A0C0A6;
    STA.B DP_Temp14                                                      ;A0C0A9;
    JMP.W CalculateAngleOfXYOffset                                       ;A0C0AB;


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
    PHP                                                                  ;A0C0AE;
    REP #$30                                                             ;A0C0AF; fallthrough to CalculateAngleOfXYOffset


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
    PHX                                                                  ;A0C0B1;
    LDX.W #$0000                                                         ;A0C0B2;
    LDA.B DP_Temp12                                                      ;A0C0B5;
    BPL .positive12                                                      ;A0C0B7;
    LDX.W #$0004                                                         ;A0C0B9;
    EOR.W #$FFFF                                                         ;A0C0BC;
    INC                                                                  ;A0C0BF;

  .positive12:
    STA.B DP_Temp12                                                      ;A0C0C0;
    LDA.B DP_Temp14                                                      ;A0C0C2;
    BPL .positive14                                                      ;A0C0C4;
    INX                                                                  ;A0C0C6;
    INX                                                                  ;A0C0C7;
    EOR.W #$FFFF                                                         ;A0C0C8;
    INC                                                                  ;A0C0CB;

  .positive14:
    STA.B DP_Temp14                                                      ;A0C0CC;
    CMP.B DP_Temp12                                                      ;A0C0CE;
    BCC .lowerOctant                                                     ;A0C0D0;
    SEP #$20                                                             ;A0C0D2;
    STZ.W $4204                                                          ;A0C0D4;
    LDA.B DP_Temp12                                                      ;A0C0D7;
    STA.W $4205                                                          ;A0C0D9;
    LDA.B DP_Temp14                                                      ;A0C0DC;
    STA.W $4206                                                          ;A0C0DE;
    NOP                                                                  ;A0C0E1;
    REP #$20                                                             ;A0C0E2;
    JSR.W (.pointers,X)                                                  ;A0C0E4;
    PLX                                                                  ;A0C0E7;
    PLP                                                                  ;A0C0E8;
    RTL                                                                  ;A0C0E9;

  .pointers:
    dw CalculateAngleOfXYOffset_BottomRightLowerOctant                   ;A0C0EA;
    dw CalculateAngleOfXYOffset_TopRightUpperOctant                      ;A0C0EC;
    dw CalculateAngleOfXYOffset_BottomLeftLowerOctant                    ;A0C0EE;
    dw CalculateAngleOfXYOffset_TopLeftUpperOctant                       ;A0C0F0;

  .lowerOctant:
    SEP #$20                                                             ;A0C0F2;
    STZ.W $4204                                                          ;A0C0F4;
    LDA.B DP_Temp14                                                      ;A0C0F7;
    STA.W $4205                                                          ;A0C0F9;
    LDA.B DP_Temp12                                                      ;A0C0FC;
    STA.W $4206                                                          ;A0C0FE;
    NOP                                                                  ;A0C101;
    REP #$20                                                             ;A0C102;
    JSR.W (..pointers,X)                                                 ;A0C104;
    PLX                                                                  ;A0C107;
    PLP                                                                  ;A0C108;
    RTL                                                                  ;A0C109;

  ..pointers:
    dw CalculateAngleOfXYOffset_BottomRightUpperOctant                   ;A0C10A;
    dw CalculateAngleOfXYOffset_TopRightLowerOctant                      ;A0C10C;
    dw CalculateAngleOfXYOffset_BottomLeftUpperOctant                    ;A0C10E;
    dw CalculateAngleOfXYOffset_TopLeftLowerOctant                       ;A0C110;


;;; $C112: Calculate angle of (x, y) offset - bottom right upper octant ;;;
CalculateAngleOfXYOffset_BottomRightUpperOctant:
; A = 40h + quotient / 8
    LDA.W $4214                                                          ;A0C112;
    LSR                                                                  ;A0C115;
    LSR                                                                  ;A0C116;
    LSR                                                                  ;A0C117;
    CLC                                                                  ;A0C118;
    ADC.W #$0040                                                         ;A0C119;
    AND.W #$00FF                                                         ;A0C11C;
    RTS                                                                  ;A0C11F;


;;; $C120: Calculate angle of (x, y) offset - bottom right lower octant ;;;
CalculateAngleOfXYOffset_BottomRightLowerOctant:
; A = 80h - quotient / 8
    LDA.W $4214                                                          ;A0C120;
    LSR                                                                  ;A0C123;
    LSR                                                                  ;A0C124;
    LSR                                                                  ;A0C125;
    STA.B DP_Temp12                                                      ;A0C126;
    LDA.W #$0080                                                         ;A0C128;
    SEC                                                                  ;A0C12B;
    SBC.B DP_Temp12                                                      ;A0C12C;
    AND.W #$00FF                                                         ;A0C12E;
    RTS                                                                  ;A0C131;


;;; $C132: Calculate angle of (x, y) offset - top right upper octant ;;;
CalculateAngleOfXYOffset_TopRightUpperOctant:
    LDA.W $4214                                                          ;A0C132;
    LSR                                                                  ;A0C135;
    LSR                                                                  ;A0C136;
    LSR                                                                  ;A0C137;
    AND.W #$00FF                                                         ;A0C138;
    RTS                                                                  ;A0C13B;


;;; $C13C: Calculate angle of (x, y) offset - top right lower octant ;;;
CalculateAngleOfXYOffset_TopRightLowerOctant:
; A = 40h - quotient / 8
    LDA.W $4214                                                          ;A0C13C;
    LSR                                                                  ;A0C13F;
    LSR                                                                  ;A0C140;
    LSR                                                                  ;A0C141;
    STA.B DP_Temp12                                                      ;A0C142;
    LDA.W #$0040                                                         ;A0C144;
    SEC                                                                  ;A0C147;
    SBC.B DP_Temp12                                                      ;A0C148;
    AND.W #$00FF                                                         ;A0C14A;
    RTS                                                                  ;A0C14D;


;;; $C14E: Calculate angle of (x, y) offset - bottom left lower octant ;;;
CalculateAngleOfXYOffset_BottomLeftLowerOctant:
; A = 80h + quotient / 8
    LDA.W $4214                                                          ;A0C14E;
    LSR                                                                  ;A0C151;
    LSR                                                                  ;A0C152;
    LSR                                                                  ;A0C153;
    CLC                                                                  ;A0C154;
    ADC.W #$0080                                                         ;A0C155;
    AND.W #$00FF                                                         ;A0C158;
    RTS                                                                  ;A0C15B;


;;; $C15C: Calculate angle of (x, y) offset - bottom left upper octant ;;;
CalculateAngleOfXYOffset_BottomLeftUpperOctant:
; A = C0h - quotient / 8
    LDA.W $4214                                                          ;A0C15C;
    LSR                                                                  ;A0C15F;
    LSR                                                                  ;A0C160;
    LSR                                                                  ;A0C161;
    STA.B DP_Temp12                                                      ;A0C162;
    LDA.W #$00C0                                                         ;A0C164;
    SEC                                                                  ;A0C167;
    SBC.B DP_Temp12                                                      ;A0C168;
    AND.W #$00FF                                                         ;A0C16A;
    RTS                                                                  ;A0C16D;


;;; $C16E: Calculate angle of (x, y) offset - top left lower octant ;;;
CalculateAngleOfXYOffset_TopLeftLowerOctant:
; A = C0h + quotient / 8
    LDA.W $4214                                                          ;A0C16E;
    LSR                                                                  ;A0C171;
    LSR                                                                  ;A0C172;
    LSR                                                                  ;A0C173;
    CLC                                                                  ;A0C174;
    ADC.W #$00C0                                                         ;A0C175;
    AND.W #$00FF                                                         ;A0C178;
    RTS                                                                  ;A0C17B;


;;; $C17C: Calculate angle of (x, y) offset - top left upper octant ;;;
CalculateAngleOfXYOffset_TopLeftUpperOctant:
; A = 100h - quotient / 8
    LDA.W $4214                                                          ;A0C17C;
    LSR                                                                  ;A0C17F;
    LSR                                                                  ;A0C180;
    LSR                                                                  ;A0C181;
    STA.B DP_Temp12                                                      ;A0C182;
    LDA.W #$0100                                                         ;A0C184;
    SEC                                                                  ;A0C187;
    SBC.B DP_Temp12                                                      ;A0C188;
    AND.W #$00FF                                                         ;A0C18A;
    RTS                                                                  ;A0C18D;


;;; $C18E: Check if enemy is horizontally off-screen ;;;
CheckIfEnemyIsHorizontallyOffScreen:
;; Parameters:
;;     X: Enemy index
;; Returns:
;;     A/carry: Set if off-screen, clear otherwise
    LDA.W Enemy.XPosition,X                                              ;A0C18E;
    BMI .offScreen                                                       ;A0C191;
    CLC                                                                  ;A0C193;
    ADC.W Enemy.XHitboxRadius,X                                          ;A0C194;
    SEC                                                                  ;A0C197;
    SBC.W Layer1XPosition                                                ;A0C198;
    BMI .offScreen                                                       ;A0C19B;
    SEC                                                                  ;A0C19D;
    SBC.W #$0100                                                         ;A0C19E;
    SEC                                                                  ;A0C1A1;
    SBC.W Enemy.XHitboxRadius,X                                          ;A0C1A2;
    BPL .offScreen                                                       ;A0C1A5;
    LDA.W #$0000                                                         ;A0C1A7;
    CLC                                                                  ;A0C1AA;
    RTL                                                                  ;A0C1AB;

  .offScreen:
    LDA.W #$0001                                                         ;A0C1AC;
    SEC                                                                  ;A0C1AF;
    RTL                                                                  ;A0C1B0;


if !FEATURE_KEEP_UNREFERENCED
;;; $C1B1: Unused. Check if enemy is vertically off-screen ;;;
UNUSED_CheckIfEnemyIsVerticallyOffScreen_A0C1B1:
;; Parameters:
;;     X: Enemy index
;; Returns:
;;     A/carry: Set if off-screen, clear otherwise
    LDA.W Enemy.YPosition,X                                              ;A0C1B1;
    BMI .offScreen                                                       ;A0C1B4;
    CLC                                                                  ;A0C1B6;
    ADC.W Enemy.YHitboxRadius,X                                          ;A0C1B7;
    SEC                                                                  ;A0C1BA;
    SBC.W Layer1YPosition                                                ;A0C1BB;
    BMI .offScreen                                                       ;A0C1BE;
    SEC                                                                  ;A0C1C0;
    SBC.W #$0100                                                         ;A0C1C1;
    SEC                                                                  ;A0C1C4;
    SBC.W Enemy.YHitboxRadius,X                                          ;A0C1C5;
    BPL .offScreen                                                       ;A0C1C8;
    LDA.W #$0000                                                         ;A0C1CA;
    CLC                                                                  ;A0C1CD;
    RTL                                                                  ;A0C1CE;

  .offScreen:
    LDA.W #$0001                                                         ;A0C1CF;
    SEC                                                                  ;A0C1D2;
    RTL                                                                  ;A0C1D3;


;;; $C1D4: Unused. Assess Samus threat level ;;;
UNUSED_AssessSamusThreatLevel_A0C1D4:
; ?
    LDA.W MaxEnergy                                                      ;A0C1D4;
    STA.W $4204                                                          ;A0C1D7;
    SEP #$20                                                             ;A0C1DA;
    LDA.B #$03                                                           ;A0C1DC;
    STA.W $4206                                                          ;A0C1DE;
    REP #$20                                                             ;A0C1E1;
    NOP                                                                  ;A0C1E3;
    NOP                                                                  ;A0C1E4;
    NOP                                                                  ;A0C1E5;
    LDA.W $4214                                                          ;A0C1E6;
    CMP.W Energy                                                         ;A0C1E9;
    BCC +                                                                ;A0C1EC;
    LDA.W #$0001                                                         ;A0C1EE;
    BRA .store12                                                         ;A0C1F1;

+   ASL                                                                  ;A0C1F3;
    CMP.W Energy                                                         ;A0C1F4;
    BCC .load3                                                           ;A0C1F7;
    LDA.W #$0002                                                         ;A0C1F9;
    BRA .store12                                                         ;A0C1FC;

  .load3:
    LDA.W #$0003                                                         ;A0C1FE;

  .store12:
    STA.B DP_Temp12                                                      ;A0C201;
    LDA.W CollectedBeams                                                 ;A0C203;
    AND.W #$000F                                                         ;A0C206;
    EOR.W #$FFFF                                                         ;A0C209;
    STA.B DP_Temp16                                                      ;A0C20C;
    LDA.W CollectedItems                                                 ;A0C20E;
    EOR.W #$FFFF                                                         ;A0C211;
    STA.B DP_Temp18                                                      ;A0C214;
    LDA.W #$0000                                                         ;A0C216;
    LSR.B DP_Temp16                                                      ;A0C219;
    BCS +                                                                ;A0C21B;
    ADC.W #$0002                                                         ;A0C21D;

+   LSR.B DP_Temp16                                                      ;A0C220;
    BCS +                                                                ;A0C222;
    ADC.W #$0001                                                         ;A0C224;

+   LSR.B DP_Temp16                                                      ;A0C227;
    BCS +                                                                ;A0C229;
    ADC.W #$0003                                                         ;A0C22B;

+   LSR.B DP_Temp16                                                      ;A0C22E;
    BCS +                                                                ;A0C230;
    ADC.W #$0003                                                         ;A0C232;

+   LSR.B DP_Temp18                                                      ;A0C235;
    BCS +                                                                ;A0C237;
    ADC.W #$0000                                                         ;A0C239;

+   LSR.B DP_Temp18                                                      ;A0C23C;
    BCS +                                                                ;A0C23E;
    ADC.W #$0000                                                         ;A0C240;

+   LSR.B DP_Temp18                                                      ;A0C243;
    BCS +                                                                ;A0C245;
    ADC.W #$0000                                                         ;A0C247;

+   LSR.B DP_Temp18                                                      ;A0C24A;
    BCS +                                                                ;A0C24C;
    ADC.W #$0003                                                         ;A0C24E;

+   CLC                                                                  ;A0C251;
    ADC.W SuperMissiles                                                  ;A0C252;
    CLC                                                                  ;A0C255;
    ADC.W PowerBombs                                                     ;A0C256;
    STA.B DP_Temp14                                                      ;A0C259;
    CMP.W #$000B                                                         ;A0C25B;
    BCC .return                                                          ;A0C25E;
    INC.B DP_Temp12                                                      ;A0C260;
    CMP.W #$001E                                                         ;A0C262;
    BCC .return                                                          ;A0C265;
    INC.B DP_Temp12                                                      ;A0C267;

  .return:
    RTL                                                                  ;A0C269;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $C26A: Process enemy instructions ;;;
ProcessEnemyInstructions:
    PHB                                                                  ;A0C26A;
    LDX.W EnemyIndex                                                     ;A0C26B;
    LDA.W Enemy.AI,X                                                     ;A0C26E;
    AND.W #$0004                                                         ;A0C271;
    BNE .return                                                          ;A0C274;
    DEC.W Enemy.instTimer,X                                              ;A0C276;
    BNE .noUpdate                                                        ;A0C279;
    LDA.W Enemy.bank-1,X                                                 ;A0C27B;
    PHA                                                                  ;A0C27E;
    PLB                                                                  ;A0C27F;
    PLB                                                                  ;A0C280;
    LDY.W Enemy.instList,X                                               ;A0C281;

  .loop:
    LDA.W $0000,Y                                                        ;A0C284;
    BPL .timer                                                           ;A0C287;
    STA.W EnemyAIPointer                                                 ;A0C289;
    INY                                                                  ;A0C28C;
    INY                                                                  ;A0C28D;
    PHK                                                                  ;A0C28E;
    PEA.W .loop-1                                                        ;A0C28F;
    JML.W [EnemyAIPointer]                                               ;A0C292;


  .timer:
    STA.W Enemy.instTimer,X                                              ;A0C295;
    LDA.W $0002,Y                                                        ;A0C298;
    STA.W Enemy.spritemap,X                                              ;A0C29B;
    TYA                                                                  ;A0C29E;
    CLC                                                                  ;A0C29F;
    ADC.W #$0004                                                         ;A0C2A0;
    STA.W Enemy.instList,X                                               ;A0C2A3;
    LDA.W Enemy.properties2,X                                            ;A0C2A6;
    ORA.W #$8000                                                         ;A0C2A9;
    STA.W Enemy.properties2,X                                            ;A0C2AC;

  .return:
; Sleep/wait/delete instructions return to here
    PLB                                                                  ;A0C2AF;
    RTS                                                                  ;A0C2B0;

  .noUpdate:
    LDA.W Enemy.properties2,X                                            ;A0C2B1;
    AND.W #$7FFF                                                         ;A0C2B4;
    STA.W Enemy.properties2,X                                            ;A0C2B7;
    PLB                                                                  ;A0C2BA;
    RTS                                                                  ;A0C2BB;


;;; $C2BC: Clear carry ;;;
CLCRTS_A0C2BC:
    CLC                                                                  ;A0C2BC;
    RTS                                                                  ;A0C2BD;


;;; $C2BE: Set carry ;;;
SECRTS_A0C2BE:
    SEC                                                                  ;A0C2BE;
    RTS                                                                  ;A0C2BF;


;;; $C2C0: Enemy block collision reaction - spike ;;;
EnemyBlockCollisionReaction_Spike:
;; Returns:
;;     Carry: Set if collision, clear otherwise
    LDX.W CurrentBlockIndex                                              ;A0C2C0;
    LDA.L BTS,X                                                          ;A0C2C3;
    AND.W #$007F                                                         ;A0C2C7;
    ASL                                                                  ;A0C2CA;
    TAX                                                                  ;A0C2CB;
    LDA.L .PLMs,X                                                        ;A0C2CC;
    BEQ .returnCollision                                                 ;A0C2D0;
    JSL.L Spawn_PLM_to_CurrentBlockIndex                                 ;A0C2D2;
    CLC                                                                  ;A0C2D6;
    RTS                                                                  ;A0C2D7;

  .returnCollision:
    SEC                                                                  ;A0C2D8;
    RTS                                                                  ;A0C2D9;

  .PLMs:
    dw $0000                                                             ;A0C2DA;
    dw $0000                                                             ;A0C2DC;
    dw $0000                                                             ;A0C2DE;
    dw $0000                                                             ;A0C2E0;
    dw $0000                                                             ;A0C2E2;
    dw $0000                                                             ;A0C2E4;
    dw $0000                                                             ;A0C2E6;
    dw $0000                                                             ;A0C2E8;
    dw $0000                                                             ;A0C2EA;
    dw $0000                                                             ;A0C2EC;
    dw $0000                                                             ;A0C2EE;
    dw $0000                                                             ;A0C2F0;
    dw $0000                                                             ;A0C2F2;
    dw $0000                                                             ;A0C2F4;
    dw $0000                                                             ;A0C2F6;
    dw PLMEntries_EnemyBreakableBlock                                    ;A0C2F8;


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
    LDX.W CurrentBlockIndex                                              ;A0C2FA;
    LDA.L BTS,X                                                          ;A0C2FD;
    AND.W #$001F                                                         ;A0C301;
    CMP.W #$0005                                                         ;A0C304;
    BCS .nonSquare                                                       ;A0C307;
    JMP.W EnemyBlockCollisionReaction_Horizontal_Slope_Square            ;A0C309;

  .nonSquare:
    LDA.L BTS,X                                                          ;A0C30C;
    AND.W #$00FF                                                         ;A0C310;
    STA.W CurrentSlopeBTS                                                ;A0C313;
    JMP.W EnemyBlockCollisionReaction_Horizontal_Slope_NonSquare         ;A0C316;


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
    LDX.W CurrentBlockIndex                                              ;A0C319;
    LDA.L BTS,X                                                          ;A0C31C;
    AND.W #$001F                                                         ;A0C320;
    CMP.W #$0005                                                         ;A0C323;
    BCS .nonSquare                                                       ;A0C326;
    JMP.W EnemyBlockCollisionReaction_Vertical_Slope_Square              ;A0C328;

  .nonSquare:
    JMP.W EnemyBlockCollisionReaction_Vertical_Slope_NonSquare           ;A0C32B;


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
    ASL                                                                  ;A0C32E;
    ASL                                                                  ;A0C32F;
    STA.W SolidSlopeDefinitionTableBaseIndex                             ;A0C330;
    LDA.L BTS-1,X                                                        ;A0C333;
    ROL                                                                  ;A0C337;
    ROL                                                                  ;A0C338;
    ROL                                                                  ;A0C339;
    AND.W #$0003                                                         ;A0C33A;
    STA.W SlopeCollisionFlipFlags                                        ;A0C33D;
    LDA.B DP_Temp1A                                                      ;A0C340;
    AND.W #$0008                                                         ;A0C342;
    LSR                                                                  ;A0C345;
    LSR                                                                  ;A0C346;
    LSR                                                                  ;A0C347;
    EOR.W SlopeCollisionFlipFlags                                        ;A0C348;
    ADC.W SolidSlopeDefinitionTableBaseIndex                             ;A0C34B;
    TAX                                                                  ;A0C34E;
    LDY.W EnemyIndex                                                     ;A0C34F;
    LDA.B DP_Temp1C                                                      ;A0C352;
    BNE .topBlockCheck                                                   ;A0C354;
    LDA.W Enemy.YPosition,Y                                              ;A0C356;
    CLC                                                                  ;A0C359;
    ADC.W Enemy.YHitboxRadius,Y                                          ;A0C35A;
    DEC                                                                  ;A0C35D;
    AND.W #$0008                                                         ;A0C35E;
    BNE .checkBothHalves                                                 ;A0C361;
    LDA.L SquareSlopeDefinitions_BankA0-1,X                              ;A0C363;
    BMI .solid                                                           ;A0C367;
    BRA .returnNoCollision                                               ;A0C369;

  .topBlockCheck:
    CMP.B DP_Temp1E                                                      ;A0C36B;
    BNE .checkBothHalves                                                 ;A0C36D;
    LDA.W Enemy.YPosition,Y                                              ;A0C36F;
    SEC                                                                  ;A0C372;
    SBC.W Enemy.YHitboxRadius,Y                                          ;A0C373;
    AND.W #$0008                                                         ;A0C376;
    BNE .checkBottomHalf                                                 ;A0C379;

  .checkBothHalves:
    LDA.L SquareSlopeDefinitions_BankA0-1,X                              ;A0C37B;
    BMI .solid                                                           ;A0C37F;

  .checkBottomHalf:
    TXA                                                                  ;A0C381;
    EOR.W #$0002                                                         ;A0C382;
    TAX                                                                  ;A0C385;
    LDA.L SquareSlopeDefinitions_BankA0-1,X                              ;A0C386;
    BMI .solid                                                           ;A0C38A;

  .returnNoCollision:
    CLC                                                                  ;A0C38C;
    RTS                                                                  ;A0C38D;

  .solid:
    SEC                                                                  ;A0C38E;
    RTS                                                                  ;A0C38F;

  .deadCode:
; Looks like code that was RTS'd out from a time where these collision reaction set the enemy position directly (now moved to MoveEnemyRightBy_14_12_Common_solid)
    TYX                                                                  ;A0C390;
    STZ.W Enemy.XSubPosition,X                                           ;A0C391;
    LDA.B DP_Temp1A                                                      ;A0C394;
    BIT.B DP_Temp14                                                      ;A0C396;
    BMI ..right                                                          ;A0C398;
    AND.W #$FFF8                                                         ;A0C39A;
    SEC                                                                  ;A0C39D;
    SBC.W Enemy.XHitboxRadius,X                                          ;A0C39E;
    STA.W Enemy.XPosition,X                                              ;A0C3A1;
    SEC                                                                  ;A0C3A4;
    RTS                                                                  ;A0C3A5;

  ..right:
    ORA.W #$0007                                                         ;A0C3A6;
    SEC                                                                  ;A0C3A9;
    ADC.W Enemy.XHitboxRadius,X                                          ;A0C3AA;
    STA.W Enemy.XPosition,X                                              ;A0C3AD;
    SEC                                                                  ;A0C3B0;
    RTS                                                                  ;A0C3B1;


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
    ASL                                                                  ;A0C3B2;
    ASL                                                                  ;A0C3B3;
    STA.W SolidSlopeDefinitionTableBaseIndex                             ;A0C3B4;
    LDA.L BTS-1,X                                                        ;A0C3B7;
    ROL                                                                  ;A0C3BB;
    ROL                                                                  ;A0C3BC;
    ROL                                                                  ;A0C3BD;
    AND.W #$0003                                                         ;A0C3BE;
    STA.W SlopeCollisionFlipFlags                                        ;A0C3C1;
    LDA.B DP_Temp1A                                                      ;A0C3C4;
    AND.W #$0008                                                         ;A0C3C6;
    LSR                                                                  ;A0C3C9;
    LSR                                                                  ;A0C3CA;
    EOR.W SlopeCollisionFlipFlags                                        ;A0C3CB;
    ADC.W SolidSlopeDefinitionTableBaseIndex                             ;A0C3CE;
    TAX                                                                  ;A0C3D1;
    LDY.W EnemyIndex                                                     ;A0C3D2;
    LDA.B DP_Temp1C                                                      ;A0C3D5;
    BNE .leftmostBlockCheck                                              ;A0C3D7;
    LDA.W Enemy.XPosition,Y                                              ;A0C3D9;
    CLC                                                                  ;A0C3DC;
    ADC.W Enemy.XHitboxRadius,Y                                          ;A0C3DD;
    DEC                                                                  ;A0C3E0;
    AND.W #$0008                                                         ;A0C3E1;
    BNE .checkBothHalves                                                 ;A0C3E4;
    LDA.L SquareSlopeDefinitions_BankA0-1,X                              ;A0C3E6;
    BMI .solid                                                           ;A0C3EA;
    BRA .returnNoCollision                                               ;A0C3EC;

  .leftmostBlockCheck:
    CMP.B DP_Temp1E                                                      ;A0C3EE;
    BNE .checkBothHalves                                                 ;A0C3F0;
    LDA.W Enemy.XPosition,Y                                              ;A0C3F2;
    SEC                                                                  ;A0C3F5;
    SBC.W Enemy.XHitboxRadius,Y                                          ;A0C3F6;
    AND.W #$0008                                                         ;A0C3F9;
    BNE .checkRightHalf                                                  ;A0C3FC;

  .checkBothHalves:
    LDA.L SquareSlopeDefinitions_BankA0-1,X                              ;A0C3FE;
    BMI .solid                                                           ;A0C402;

  .checkRightHalf:
    TXA                                                                  ;A0C404;
    EOR.W #$0001                                                         ;A0C405;
    TAX                                                                  ;A0C408;
    LDA.L SquareSlopeDefinitions_BankA0-1,X                              ;A0C409;
    BMI .solid                                                           ;A0C40D;

  .returnNoCollision:
    CLC                                                                  ;A0C40F;
    RTS                                                                  ;A0C410;

  .solid:
    SEC                                                                  ;A0C411;
    RTS                                                                  ;A0C412;

  .deadCode:
; Looks like code that was RTS'd out. Without this code, enemies don't align with slopes when the collide with them,
; e.g. an enemy falling at 5px/frame can "land" 4px above a half-height slope
    TYX                                                                  ;A0C413;
    STZ.W Enemy.YSubPosition,X                                           ;A0C414;
    LDA.B DP_Temp1A                                                      ;A0C417;
    BIT.B DP_Temp14                                                      ;A0C419;
    BMI ..bottom                                                         ;A0C41B;
    AND.W #$FFF8                                                         ;A0C41D;
    SEC                                                                  ;A0C420;
    SBC.W Enemy.YHitboxRadius,X                                          ;A0C421;
    STA.W Enemy.YPosition,X                                              ;A0C424;
    SEC                                                                  ;A0C427;
    RTS                                                                  ;A0C428;

  ..bottom:
    ORA.W #$0007                                                         ;A0C429;
    SEC                                                                  ;A0C42C;
    ADC.W Enemy.YHitboxRadius,X                                          ;A0C42D;
    STA.W Enemy.YPosition,X                                              ;A0C430;
    SEC                                                                  ;A0C433;
    RTS                                                                  ;A0C434;


;;; $C435: Square slope definitions ;;;
SquareSlopeDefinitions_BankA0:                                           ;A0C435;
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
    BIT.B DP_Temp20                                                      ;A0C449;
    BMI .processSlopes                                                   ;A0C44B;
    BVS .returnCollision                                                 ;A0C44D;
    CLC                                                                  ;A0C44F;
    RTS                                                                  ;A0C450;

  .returnCollision:
    SEC                                                                  ;A0C451;
    RTS                                                                  ;A0C452;

  .processSlopes:
    LDA.W CurrentSlopeBTS                                                ;A0C453;
    AND.W #$001F                                                         ;A0C456;
    ASL                                                                  ;A0C459;
    ASL                                                                  ;A0C45A;
    TAX                                                                  ;A0C45B;
    LDA.B DP_Temp14                                                      ;A0C45C;
    BPL +                                                                ;A0C45E;
    LDA.L .adjustedDistanceMult,X                                        ;A0C460;
    TAY                                                                  ;A0C464;
    LDA.B DP_Temp13                                                      ;A0C465;
    EOR.W #$FFFF                                                         ;A0C467;
    INC                                                                  ;A0C46A;
    JSL.L A_Y_16bit_UnsignedMultiplication                               ;A0C46B;
    LDA.W MultiplicationResult                                           ;A0C46F;
    EOR.W #$FFFF                                                         ;A0C472;
    CLC                                                                  ;A0C475;
    ADC.W #$0001                                                         ;A0C476;
    STA.B DP_Temp12                                                      ;A0C479;
    LDA.W MultiplicationResult+2                                         ;A0C47B;
    EOR.W #$FFFF                                                         ;A0C47E;
    ADC.W #$0000                                                         ;A0C481;
    STA.B DP_Temp14                                                      ;A0C484;
    CLC                                                                  ;A0C486;
    RTS                                                                  ;A0C487;

+   LDA.L .adjustedDistanceMult,X                                        ;A0C488;
    TAY                                                                  ;A0C48C;
    LDA.B DP_Temp13                                                      ;A0C48D;
    JSL.L A_Y_16bit_UnsignedMultiplication                               ;A0C48F;
    LDA.W MultiplicationResult                                           ;A0C493;
    STA.B DP_Temp12                                                      ;A0C496;
    LDA.W MultiplicationResult+2                                         ;A0C498;
    STA.B DP_Temp14                                                      ;A0C49B;
    CLC                                                                  ;A0C49D;
    RTS                                                                  ;A0C49E;

;        _________ Unused. Seem to be additive speed modifiers in the $94:8586 version of this table
;       |      ___ Adjusted distance multiplier * 100h
;       |     |
  .unused:
    dw $0000                                                             ;A0C49F;
  .adjustedDistanceMult:
    dw       $0100                                                       ;A0C4A1;
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
    LDY.W EnemyIndex                                                     ;A0C51F;
    LDA.B DP_Temp14                                                      ;A0C522;
    BPL +                                                                ;A0C524;
    JMP.W .up                                                            ;A0C526;

+   LDX.W CurrentBlockIndex                                              ;A0C529;
    STX.W $4204                                                          ;A0C52C;
    SEP #$20                                                             ;A0C52F;
    LDA.W RoomWidthBlocks                                                ;A0C531;
    STA.W $4206                                                          ;A0C534;
    REP #$20                                                             ;A0C537;
    LDA.W Enemy.XPosition,Y                                              ;A0C539;
    LSR                                                                  ;A0C53C;
    LSR                                                                  ;A0C53D;
    LSR                                                                  ;A0C53E;
    LSR                                                                  ;A0C53F;
    CMP.W $4216                                                          ;A0C540;
    BEQ +                                                                ;A0C543;
    CLC                                                                  ;A0C545;
    RTS                                                                  ;A0C546;

+   LDA.B DP_Temp18                                                      ;A0C547;
    CLC                                                                  ;A0C549;
    ADC.W Enemy.YHitboxRadius,Y                                          ;A0C54A;
    DEC                                                                  ;A0C54D;
    AND.W #$000F                                                         ;A0C54E;
    STA.W TargetBottomTopYOffset                                         ;A0C551;
    LDA.L BTS,X                                                          ;A0C554;
    AND.W #$001F                                                         ;A0C558;
    ASL                                                                  ;A0C55B;
    ASL                                                                  ;A0C55C;
    ASL                                                                  ;A0C55D;
    ASL                                                                  ;A0C55E;
    STA.W SlopeCollisionDefinitionTableBaseIndex                         ;A0C55F;
    LDA.L BTS-1,X                                                        ;A0C562;
    BMI .returnUpper                                                     ;A0C566;
    ASL                                                                  ;A0C568;
    BMI .blockBTS40                                                      ;A0C569;
    LDA.W Enemy.XPosition,Y                                              ;A0C56B;
    BRA +                                                                ;A0C56E;

  .blockBTS40:
    LDA.W Enemy.XPosition,Y                                              ;A0C570;
    EOR.W #$000F                                                         ;A0C573;

+   AND.W #$000F                                                         ;A0C576;
    CLC                                                                  ;A0C579;
    ADC.W SlopeCollisionDefinitionTableBaseIndex                         ;A0C57A;
    TAX                                                                  ;A0C57D;
    LDA.L SlopeDefinitions_SlopeTopXOffsetByYPixel,X                     ;A0C57E;
    AND.W #$001F                                                         ;A0C582;
    SEC                                                                  ;A0C585;
    SBC.W TargetBottomTopYOffset                                         ;A0C586;
    DEC                                                                  ;A0C589;
    BEQ +                                                                ;A0C58A;
    BPL .returnUpper                                                     ;A0C58C;

+   CLC                                                                  ;A0C58E;
    ADC.B DP_Temp18                                                      ;A0C58F;
    STA.W Enemy.YPosition,Y                                              ;A0C591;
    LDA.W #$FFFF                                                         ;A0C594;
    STA.W Enemy.YSubPosition,Y                                           ;A0C597;
    SEC                                                                  ;A0C59A;
    RTS                                                                  ;A0C59B;

  .returnUpper:
    CLC                                                                  ;A0C59C;
    RTS                                                                  ;A0C59D;

  .up:
    LDX.W CurrentBlockIndex                                              ;A0C59E;
    STX.W $4204                                                          ;A0C5A1;
    SEP #$20                                                             ;A0C5A4;
    LDA.W RoomWidthBlocks                                                ;A0C5A6;
    STA.W $4206                                                          ;A0C5A9;
    REP #$20                                                             ;A0C5AC;
    LDA.W Enemy.XPosition,Y                                              ;A0C5AE;
    LSR                                                                  ;A0C5B1;
    LSR                                                                  ;A0C5B2;
    LSR                                                                  ;A0C5B3;
    LSR                                                                  ;A0C5B4;
    CMP.W $4216                                                          ;A0C5B5;
    BEQ +                                                                ;A0C5B8;
    CLC                                                                  ;A0C5BA;
    RTS                                                                  ;A0C5BB;

+   LDA.B DP_Temp18                                                      ;A0C5BC;
    SEC                                                                  ;A0C5BE;
    SBC.W Enemy.YHitboxRadius,Y                                          ;A0C5BF;
    AND.W #$000F                                                         ;A0C5C2;
    EOR.W #$000F                                                         ;A0C5C5;
    STA.W TargetBottomTopYOffset                                         ;A0C5C8;
    LDA.L BTS,X                                                          ;A0C5CB;
    AND.W #$001F                                                         ;A0C5CF;
    ASL                                                                  ;A0C5D2;
    ASL                                                                  ;A0C5D3;
    ASL                                                                  ;A0C5D4;
    ASL                                                                  ;A0C5D5;
    STA.W SlopeCollisionDefinitionTableBaseIndex                         ;A0C5D6;
    LDA.L BTS-1,X                                                        ;A0C5D9;
    BPL .returnLower                                                     ;A0C5DD;
    ASL                                                                  ;A0C5DF;
    BMI ..blockBTS40                                                     ;A0C5E0;
    LDA.W Enemy.XPosition,Y                                              ;A0C5E2;
    BRA +                                                                ;A0C5E5;

  ..blockBTS40:
    LDA.W Enemy.XPosition,Y                                              ;A0C5E7;
    EOR.W #$000F                                                         ;A0C5EA;

+   AND.W #$000F                                                         ;A0C5ED;
    CLC                                                                  ;A0C5F0;
    ADC.W SlopeCollisionDefinitionTableBaseIndex                         ;A0C5F1;
    TAX                                                                  ;A0C5F4;
    LDA.L SlopeDefinitions_SlopeTopXOffsetByYPixel,X                     ;A0C5F5;
    AND.W #$001F                                                         ;A0C5F9;
    SEC                                                                  ;A0C5FC;
    SBC.W TargetBottomTopYOffset                                         ;A0C5FD;
    DEC                                                                  ;A0C600;
    BEQ +                                                                ;A0C601;
    BPL .returnLower                                                     ;A0C603;

+   EOR.W #$FFFF                                                         ;A0C605;
    INC                                                                  ;A0C608;
    CLC                                                                  ;A0C609;
    ADC.B DP_Temp18                                                      ;A0C60A;
    STA.W Enemy.YPosition,Y                                              ;A0C60C;
    LDA.W #$0000                                                         ;A0C60F;
    STA.W Enemy.YSubPosition,Y                                           ;A0C612;
    SEC                                                                  ;A0C615;
    RTS                                                                  ;A0C616;

  .returnLower:
    CLC                                                                  ;A0C617;
    RTS                                                                  ;A0C618;


;;; $C619: Enemy block collision reaction - horizontal extension ;;;
EnemyBlockCollisionReaction_HorizontalExtension:
;; Returns:
;;     Carry: Clear. No collision

; Clone of $94:9411
; If BTS is 0, acts like air
; Otherwise, offsets block index by block BTS, updates X, and loops back to the `JSR (xxxx, X)` instruction that jumped to here
    LDX.W CurrentBlockIndex                                              ;A0C619;
    LDA.L BTS,X                                                          ;A0C61C;
    AND.W #$00FF                                                         ;A0C620;
    BEQ .return                                                          ;A0C623;
    BIT.W #$0080                                                         ;A0C625;
    BNE .highByte                                                        ;A0C628;
    AND.W #$00FF                                                         ;A0C62A;
    BRA +                                                                ;A0C62D;

  .highByte:
    ORA.W #$FF00                                                         ;A0C62F;

+   CLC                                                                  ;A0C632;
    ADC.W CurrentBlockIndex                                              ;A0C633;
    STA.W CurrentBlockIndex                                              ;A0C636;
    ASL                                                                  ;A0C639;
    TAX                                                                  ;A0C63A;
    LDA.L LevelData,X                                                    ;A0C63B;
    AND.W #$F000                                                         ;A0C63F;
    XBA                                                                  ;A0C642;
    LSR                                                                  ;A0C643;
    LSR                                                                  ;A0C644;
    LSR                                                                  ;A0C645;
    TAX                                                                  ;A0C646;
    PLA                                                                  ;A0C647;
    SEC                                                                  ;A0C648;
    SBC.W #$0003                                                         ;A0C649;
    PHA                                                                  ;A0C64C;

  .return:
    CLC                                                                  ;A0C64D;
    RTS                                                                  ;A0C64E;


;;; $C64F: Enemy block collision reaction - vertical extension ;;;
EnemyBlockCollisionReaction_VerticalExtension:
;; Returns:
;;     Carry: Clear. No collision

; Clone of $94:9447
; If BTS is 0, acts like air
; Otherwise, offsets block index by block BTS, updates X, and loops back to the `JSR (xxxx, X)` instruction that jumped to here
    LDX.W CurrentBlockIndex                                              ;A0C64F;
    LDA.L BTS,X                                                          ;A0C652;
    AND.W #$00FF                                                         ;A0C656;
    BEQ .return                                                          ;A0C659;
    BIT.W #$0080                                                         ;A0C65B;
    BNE .highByte                                                        ;A0C65E;
    STA.W CollisionVariable                                              ;A0C660;
    LDA.W CurrentBlockIndex                                              ;A0C663;

-   CLC                                                                  ;A0C666;
    ADC.W RoomWidthBlocks                                                ;A0C667;
    DEC.W CollisionVariable                                              ;A0C66A;
    BNE -                                                                ;A0C66D;
    JMP.W +                                                              ;A0C66F;

  .highByte:
    ORA.W #$FF00                                                         ;A0C672;
    STA.W CollisionVariable                                              ;A0C675;
    LDA.W CurrentBlockIndex                                              ;A0C678;

  .loop:
    SEC                                                                  ;A0C67B;
    SBC.W RoomWidthBlocks                                                ;A0C67C;
    INC.W CollisionVariable                                              ;A0C67F;
    BNE .loop                                                            ;A0C682;

+   STA.W CurrentBlockIndex                                              ;A0C684;
    ASL                                                                  ;A0C687;
    TAX                                                                  ;A0C688;
    LDA.L LevelData,X                                                    ;A0C689;
    AND.W #$F000                                                         ;A0C68D;
    XBA                                                                  ;A0C690;
    LSR                                                                  ;A0C691;
    LSR                                                                  ;A0C692;
    LSR                                                                  ;A0C693;
    TAX                                                                  ;A0C694;
    PLA                                                                  ;A0C695;
    SEC                                                                  ;A0C696;
    SBC.W #$0003                                                         ;A0C697;
    PHA                                                                  ;A0C69A;

  .return:
    CLC                                                                  ;A0C69B;
    RTS                                                                  ;A0C69C;


;;; $C69D: Move enemy right by [$14].[$12], treat slopes as walls ;;;
MoveEnemyRightBy_14_12_TreatSlopesAsWalls:
;; Parameters:
;;     X: Enemy index
;;     $14.$12: Distance to move (signed)
;; Returns:
;;     Carry: Set if collision, clear otherwise

; Used by oum
    LDA.W #$4000                                                         ;A0C69D;
    STA.B DP_Temp20                                                      ;A0C6A0;
    BRA MoveEnemyRightBy_14_12_Common                                    ;A0C6A2;


;;; $C6A4: Move enemy right by [$14].[$12], process slopes ;;;
MoveEnemyRightBy_14_12_ProcessSlopes:
;; Parameters:
;;     X: Enemy index
;;     $14.$12: Distance to move (signed)
;; Returns:
;;     Carry: Set if collision, clear otherwise

; Call $A0:C8AD if this routine returns carry clear to adjust the enemy's position for any slopes
; Used by yard and Wrecked Ship orange zoomer
    LDA.W #$8000                                                         ;A0C6A4;
    STA.B DP_Temp20                                                      ;A0C6A7;
    BRA MoveEnemyRightBy_14_12_Common                                    ;A0C6A9;


;;; $C6AB: Move enemy right by [$14].[$12], ignore slopes ;;;
MoveEnemyRightBy_14_12_IgnoreSlopes:
;; Parameters:
;;     X: Enemy index
;;     $14.$12: Distance to move (signed)
;; Returns:
;;     Carry: Set if collision, clear otherwise

; This is the commonly used one
    STZ.B DP_Temp20                                                      ;A0C6AB; fallthrough to MoveEnemyRightBy_14_12_Common


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
    LDA.B DP_Temp12                                                      ;A0C6AD;
    ORA.B DP_Temp14                                                      ;A0C6AF;
    BNE .notZero                                                         ;A0C6B1;
    CLC                                                                  ;A0C6B3;
    RTL                                                                  ;A0C6B4;

  .notZero:
    PHX                                                                  ;A0C6B5;
    LDA.W Enemy.YPosition,X                                              ;A0C6B6;
    SEC                                                                  ;A0C6B9;
    SBC.W Enemy.YHitboxRadius,X                                          ;A0C6BA;
    AND.W #$FFF0                                                         ;A0C6BD;
    STA.B DP_Temp1C                                                      ;A0C6C0;
    LDA.W Enemy.YPosition,X                                              ;A0C6C2;
    CLC                                                                  ;A0C6C5;
    ADC.W Enemy.YHitboxRadius,X                                          ;A0C6C6;
    DEC                                                                  ;A0C6C9;
    SEC                                                                  ;A0C6CA;
    SBC.B DP_Temp1C                                                      ;A0C6CB;
    LSR                                                                  ;A0C6CD;
    LSR                                                                  ;A0C6CE;
    LSR                                                                  ;A0C6CF;
    LSR                                                                  ;A0C6D0;
    STA.B DP_Temp1C                                                      ;A0C6D1;
    STA.B DP_Temp1E                                                      ;A0C6D3;
    LDA.W Enemy.YPosition,X                                              ;A0C6D5;
    SEC                                                                  ;A0C6D8;
    SBC.W Enemy.YHitboxRadius,X                                          ;A0C6D9;
    LSR                                                                  ;A0C6DC;
    LSR                                                                  ;A0C6DD;
    LSR                                                                  ;A0C6DE;
    LSR                                                                  ;A0C6DF;
    SEP #$20                                                             ;A0C6E0;
    STA.W $4202                                                          ;A0C6E2;
    LDA.W RoomWidthBlocks                                                ;A0C6E5;
    STA.W $4203                                                          ;A0C6E8;
    REP #$20                                                             ;A0C6EB;
    LDA.W Enemy.XSubPosition,X                                           ;A0C6ED;
    CLC                                                                  ;A0C6F0;
    ADC.B DP_Temp12                                                      ;A0C6F1;
    STA.B DP_Temp16                                                      ;A0C6F3;
    LDA.W Enemy.XPosition,X                                              ;A0C6F5;
    ADC.B DP_Temp14                                                      ;A0C6F8;
    STA.B DP_Temp18                                                      ;A0C6FA;
    BIT.B DP_Temp14                                                      ;A0C6FC;
    BMI .targetLeftBoundary                                              ;A0C6FE;
    CLC                                                                  ;A0C700;
    ADC.W Enemy.XHitboxRadius,X                                          ;A0C701;
    DEC                                                                  ;A0C704;
    BRA +                                                                ;A0C705;

  .targetLeftBoundary:
    SEC                                                                  ;A0C707;
    SBC.W Enemy.XHitboxRadius,X                                          ;A0C708;

+   STA.B DP_Temp1A                                                      ;A0C70B;
    LSR                                                                  ;A0C70D;
    LSR                                                                  ;A0C70E;
    LSR                                                                  ;A0C70F;
    LSR                                                                  ;A0C710;
    CLC                                                                  ;A0C711;
    ADC.W $4216                                                          ;A0C712;
    ASL                                                                  ;A0C715;
    TAX                                                                  ;A0C716;

  .loop:
    LDA.L LevelData,X                                                    ;A0C717;
    JSR.W EnemyHorizontalBlockReaction                                   ;A0C71B;
    BCS .solid                                                           ;A0C71E;
    TXA                                                                  ;A0C720;
    CLC                                                                  ;A0C721;
    ADC.W RoomWidthBlocks                                                ;A0C722;
    ADC.W RoomWidthBlocks                                                ;A0C725;
    TAX                                                                  ;A0C728;
    DEC.B DP_Temp1C                                                      ;A0C729;
    BPL .loop                                                            ;A0C72B;
    PLX                                                                  ;A0C72D;
    LDA.B DP_Temp12                                                      ;A0C72E;
    CLC                                                                  ;A0C730;
    ADC.W Enemy.XSubPosition,X                                           ;A0C731;
    STA.W Enemy.XSubPosition,X                                           ;A0C734;
    LDA.B DP_Temp14                                                      ;A0C737;
    ADC.W Enemy.XPosition,X                                              ;A0C739;
    STA.W Enemy.XPosition,X                                              ;A0C73C;
    CLC                                                                  ;A0C73F;
    RTL                                                                  ;A0C740;

; Nothing points here
    PLX                                                                  ;A0C741; dead code
    SEC                                                                  ;A0C742;
    RTL                                                                  ;A0C743;

  .solid:
    PLX                                                                  ;A0C744;
    LDA.B DP_Temp1A                                                      ;A0C745;
    BIT.B DP_Temp14                                                      ;A0C747;
    BMI .movingLeft                                                      ;A0C749;
    AND.W #$FFF0                                                         ;A0C74B;
    SEC                                                                  ;A0C74E;
    SBC.W Enemy.XHitboxRadius,X                                          ;A0C74F;
    CMP.W Enemy.XPosition,X                                              ;A0C752;
    BCC +                                                                ;A0C755;
    STA.W Enemy.XPosition,X                                              ;A0C757;

+   LDA.W #$FFFF                                                         ;A0C75A;
    STA.W Enemy.XSubPosition,X                                           ;A0C75D;
    SEC                                                                  ;A0C760;
    RTL                                                                  ;A0C761;

  .movingLeft:
    ORA.W #$000F                                                         ;A0C762;
    SEC                                                                  ;A0C765;
    ADC.W Enemy.XHitboxRadius,X                                          ;A0C766;
    CMP.W Enemy.XPosition,X                                              ;A0C769;
    BEQ .storeX                                                          ;A0C76C;
    BCS .storeSubX                                                       ;A0C76E;

  .storeX:
    STA.W Enemy.XPosition,X                                              ;A0C770;

  .storeSubX:
    STZ.W Enemy.XSubPosition,X                                           ;A0C773;
    SEC                                                                  ;A0C776;
    RTL                                                                  ;A0C777;


if !FEATURE_KEEP_UNREFERENCED
;;; $C778: Unused. Move enemy down by [$14].[$12] ;;;
UNUSED_MoveEnemyDownBy_14_12_A0C778:
;; Parameters:
;;     X: Enemy index
;;     $12: Y suboffset to move by
;;     $14: Y offset to move by
;; Returns:
;;     Carry: Set if collided with wall
    LDA.W #$4000                                                         ;A0C778;
    STA.B DP_Temp20                                                      ;A0C77B;
    BRA MoveEnemyDownBy_14_12_BranchEntry                                ;A0C77D;


;;; $C77F: Unused. Move enemy down by [$14].[$12] ;;;
UNUSED_MoveEnemyDownBy_14_12_A0C77F:
;; Parameters:
;;     X: Enemy index
;;     $12: Y suboffset to move by
;;     $14: Y offset to move by
;; Returns:
;;     Carry: Set if collided with wall
    LDA.W #$8000                                                         ;A0C77F;
    STA.B DP_Temp20                                                      ;A0C782;
    BRA MoveEnemyDownBy_14_12_BranchEntry                                ;A0C784;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $C786: Move enemy down by [$14].[$12] ;;;
MoveEnemyDownBy_14_12:
;; Parameters:
;;     X: Enemy index
;;     $14.$12: Distance to move (signed)
;; Returns:
;;     Carry: Set if collision, clear otherwise

; This is the commonly (and only) used one
    STZ.B DP_Temp20                                                      ;A0C786; fallthrough to MoveEnemyDownBy_14_12_BranchEntry


;;; $C788: Move enemy down by [$14].[$12] ;;;
MoveEnemyDownBy_14_12_BranchEntry:
;; Parameters:
;;     X: Enemy index
;;     $14.$12: Distance to move (signed)
;; Returns:
;;     Carry: Set if collision, clear otherwise

; The value of $20 actually has no effect for vertical movement
    LDA.B DP_Temp12                                                      ;A0C788;
    ORA.B DP_Temp14                                                      ;A0C78A;
    BNE .notZero                                                         ;A0C78C;
    CLC                                                                  ;A0C78E;
    RTL                                                                  ;A0C78F;

  .notZero:
    PHX                                                                  ;A0C790;
    LDA.W Enemy.XPosition,X                                              ;A0C791;
    SEC                                                                  ;A0C794;
    SBC.W Enemy.XHitboxRadius,X                                          ;A0C795;
    AND.W #$FFF0                                                         ;A0C798;
    STA.B DP_Temp1C                                                      ;A0C79B;
    LDA.W Enemy.XPosition,X                                              ;A0C79D;
    CLC                                                                  ;A0C7A0;
    ADC.W Enemy.XHitboxRadius,X                                          ;A0C7A1;
    DEC                                                                  ;A0C7A4;
    SEC                                                                  ;A0C7A5;
    SBC.B DP_Temp1C                                                      ;A0C7A6;
    LSR                                                                  ;A0C7A8;
    LSR                                                                  ;A0C7A9;
    LSR                                                                  ;A0C7AA;
    LSR                                                                  ;A0C7AB;
    STA.B DP_Temp1C                                                      ;A0C7AC;
    STA.B DP_Temp1E                                                      ;A0C7AE;
    LDA.W Enemy.YSubPosition,X                                           ;A0C7B0;
    CLC                                                                  ;A0C7B3;
    ADC.B DP_Temp12                                                      ;A0C7B4;
    STA.B DP_Temp16                                                      ;A0C7B6;
    LDA.W Enemy.YPosition,X                                              ;A0C7B8;
    ADC.B DP_Temp14                                                      ;A0C7BB;
    STA.B DP_Temp18                                                      ;A0C7BD;
    BIT.B DP_Temp14                                                      ;A0C7BF;
    BMI .targetFrontBoundary                                             ;A0C7C1;
    CLC                                                                  ;A0C7C3;
    ADC.W Enemy.YHitboxRadius,X                                          ;A0C7C4;
    DEC                                                                  ;A0C7C7;
    BRA +                                                                ;A0C7C8;

  .targetFrontBoundary:
    SEC                                                                  ;A0C7CA;
    SBC.W Enemy.YHitboxRadius,X                                          ;A0C7CB;

+   STA.B DP_Temp1A                                                      ;A0C7CE;
    LSR                                                                  ;A0C7D0;
    LSR                                                                  ;A0C7D1;
    LSR                                                                  ;A0C7D2;
    LSR                                                                  ;A0C7D3;
    SEP #$20                                                             ;A0C7D4;
    STA.W $4202                                                          ;A0C7D6;
    LDA.W RoomWidthBlocks                                                ;A0C7D9;
    STA.W $4203                                                          ;A0C7DC;
    REP #$20                                                             ;A0C7DF;
    LDA.W Enemy.XPosition,X                                              ;A0C7E1;
    SEC                                                                  ;A0C7E4;
    SBC.W Enemy.XHitboxRadius,X                                          ;A0C7E5;
    LSR                                                                  ;A0C7E8;
    LSR                                                                  ;A0C7E9;
    LSR                                                                  ;A0C7EA;
    LSR                                                                  ;A0C7EB;
    CLC                                                                  ;A0C7EC;
    ADC.W $4216                                                          ;A0C7ED;
    ASL                                                                  ;A0C7F0;
    TAX                                                                  ;A0C7F1;

  .loop:
    LDA.L LevelData,X                                                    ;A0C7F2;
    JSR.W EnemyVerticalBlockReaction                                     ;A0C7F6;
    BCS .solid                                                           ;A0C7F9;
    INX                                                                  ;A0C7FB;
    INX                                                                  ;A0C7FC;
    DEC.B DP_Temp1C                                                      ;A0C7FD;
    BPL .loop                                                            ;A0C7FF;
    PLX                                                                  ;A0C801;
    LDA.B DP_Temp16                                                      ;A0C802;
    STA.W Enemy.YSubPosition,X                                           ;A0C804;
    LDA.B DP_Temp18                                                      ;A0C807;
    STA.W Enemy.YPosition,X                                              ;A0C809;
    CLC                                                                  ;A0C80C;
    RTL                                                                  ;A0C80D;

; Nothing points here
    PLX                                                                  ;A0C80E; dead code
    SEC                                                                  ;A0C80F;
    RTL                                                                  ;A0C810;

  .solid:
    PLX                                                                  ;A0C811;
    LDA.B DP_Temp1A                                                      ;A0C812;
    BIT.B DP_Temp14                                                      ;A0C814;
    BMI .movingUp                                                        ;A0C816;
    AND.W #$FFF0                                                         ;A0C818;
    SEC                                                                  ;A0C81B;
    SBC.W Enemy.YHitboxRadius,X                                          ;A0C81C;
    CMP.W Enemy.YPosition,X                                              ;A0C81F;
    BCC +                                                                ;A0C822;
    STA.W Enemy.YPosition,X                                              ;A0C824;

+   LDA.W #$FFFF                                                         ;A0C827;
    STA.W Enemy.YSubPosition,X                                           ;A0C82A;
    SEC                                                                  ;A0C82D;
    RTL                                                                  ;A0C82E;

  .movingUp:
    ORA.W #$000F                                                         ;A0C82F;
    SEC                                                                  ;A0C832;
    ADC.W Enemy.YHitboxRadius,X                                          ;A0C833;
    CMP.W Enemy.YPosition,X                                              ;A0C836;
    BEQ .storeX                                                          ;A0C839;
    BCS .storeSubX                                                       ;A0C83B;

  .storeX:
    STA.W Enemy.YPosition,X                                              ;A0C83D;

  .storeSubX:
    STZ.W Enemy.YSubPosition,X                                           ;A0C840;
    SEC                                                                  ;A0C843;
    RTL                                                                  ;A0C844;


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
    PHX                                                                  ;A0C845;
    TXY                                                                  ;A0C846;
    AND.W #$F000                                                         ;A0C847;
    XBA                                                                  ;A0C84A;
    LSR                                                                  ;A0C84B;
    LSR                                                                  ;A0C84C;
    LSR                                                                  ;A0C84D;
    TAX                                                                  ;A0C84E;
    TYA                                                                  ;A0C84F;
    LSR                                                                  ;A0C850;
    STA.W CurrentBlockIndex                                              ;A0C851;
    JSR.W (.pointers,X)                                                  ;A0C854;
    PLX                                                                  ;A0C857;
    RTS                                                                  ;A0C858;

  .pointers:
    dw CLCRTS_A0C2BC                                                     ;A0C859;  0: Air
    dw EnemyBlockCollisionReaction_Horizontal_Slope                      ;A0C85B; *1: Slope
    dw CLCRTS_A0C2BC                                                     ;A0C85D;  2: Spike air
    dw CLCRTS_A0C2BC                                                     ;A0C85F;  3: Special air
    dw CLCRTS_A0C2BC                                                     ;A0C861;  4: Shootable air
    dw EnemyBlockCollisionReaction_HorizontalExtension                   ;A0C863; *5: Horizontal extension
    dw CLCRTS_A0C2BC                                                     ;A0C865;  6: Unused air
    dw CLCRTS_A0C2BC                                                     ;A0C867;  7: Bombable air
    dw SECRTS_A0C2BE                                                     ;A0C869;  8: Solid block
    dw SECRTS_A0C2BE                                                     ;A0C86B;  9: Door block
    dw EnemyBlockCollisionReaction_Spike                                 ;A0C86D; *Ah: Spike block
    dw SECRTS_A0C2BE                                                     ;A0C86F;  Bh: Special block
    dw SECRTS_A0C2BE                                                     ;A0C871;  Ch: Shootable block
    dw EnemyBlockCollisionReaction_VerticalExtension                     ;A0C873; *Dh: Vertical extension
    dw SECRTS_A0C2BE                                                     ;A0C875;  Eh: Grapple block
    dw SECRTS_A0C2BE                                                     ;A0C877;  Fh: Bombable block


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
    PHX                                                                  ;A0C879;
    TXY                                                                  ;A0C87A;
    AND.W #$F000                                                         ;A0C87B;
    XBA                                                                  ;A0C87E;
    LSR                                                                  ;A0C87F;
    LSR                                                                  ;A0C880;
    LSR                                                                  ;A0C881;
    TAX                                                                  ;A0C882;
    TYA                                                                  ;A0C883;
    LSR                                                                  ;A0C884;
    STA.W CurrentBlockIndex                                              ;A0C885;
    JSR.W (.pointers,X)                                                  ;A0C888;
    PLX                                                                  ;A0C88B;
    RTS                                                                  ;A0C88C;

  .pointers:
    dw CLCRTS_A0C2BC                                                     ;A0C88D;  0: Air
    dw EnemyBlockCollisionReaction_Vertical_Slope                        ;A0C88F; *1: Slope
    dw CLCRTS_A0C2BC                                                     ;A0C891;  2: Spike air
    dw CLCRTS_A0C2BC                                                     ;A0C893;  3: Special air
    dw CLCRTS_A0C2BC                                                     ;A0C895;  4: Shootable air
    dw EnemyBlockCollisionReaction_HorizontalExtension                   ;A0C897; *5: Horizontal extension
    dw CLCRTS_A0C2BC                                                     ;A0C899;  6: Unused air
    dw CLCRTS_A0C2BC                                                     ;A0C89B;  7: Bombable air
    dw SECRTS_A0C2BE                                                     ;A0C89D;  8: Solid block
    dw SECRTS_A0C2BE                                                     ;A0C89F;  9: Door block
    dw EnemyBlockCollisionReaction_Spike                                 ;A0C8A1; *Ah: Spike block
    dw SECRTS_A0C2BE                                                     ;A0C8A3;  Bh: Special block
    dw SECRTS_A0C2BE                                                     ;A0C8A5;  Ch: Shootable block
    dw EnemyBlockCollisionReaction_VerticalExtension                     ;A0C8A7; *Dh: Vertical extension
    dw SECRTS_A0C2BE                                                     ;A0C8A9;  Eh: Grapple block
    dw SECRTS_A0C2BE                                                     ;A0C8AB;  Fh: Bombable block


;;; $C8AD: Align enemy Y position with non-square slope ;;;
AlignEnemyYPositionWIthNonSquareSlope:
;; Parameters:
;;     X: Enemy index
;; Returns:
;;     Carry: Set if position was adjusted by slope, otherwise clear

; Align enemy vertically to slopes if currently in contact with slopes
; Call this after MoveEnemyRightBy_14_12_ProcessSlopes if it returns carry clear
    PHY                                                                  ;A0C8AD;
    PHX                                                                  ;A0C8AE;
    CLC                                                                  ;A0C8AF;
    PHP                                                                  ;A0C8B0;
    TXY                                                                  ;A0C8B1;
    LDA.W Enemy.XPosition,Y                                              ;A0C8B2;
    PHA                                                                  ;A0C8B5;
    LDA.W Enemy.YPosition,Y                                              ;A0C8B6;
    CLC                                                                  ;A0C8B9;
    ADC.W Enemy.YHitboxRadius,Y                                          ;A0C8BA;
    DEC                                                                  ;A0C8BD;
    PHA                                                                  ;A0C8BE;
    JSL.L CalculateTheBlockContainingAPixelPosition                      ;A0C8BF;
    LDA.W CurrentBlockIndex                                              ;A0C8C3;
    ASL                                                                  ;A0C8C6;
    TAX                                                                  ;A0C8C7;
    LDA.L LevelData,X                                                    ;A0C8C8;
    AND.W #$F000                                                         ;A0C8CC;
    CMP.W #$1000                                                         ;A0C8CF;
    BNE .enemyTopCheck                                                   ;A0C8D2;
    LDX.W CurrentBlockIndex                                              ;A0C8D4;
    LDA.L BTS,X                                                          ;A0C8D7;
    AND.W #$001F                                                         ;A0C8DB;
    CMP.W #$0005                                                         ;A0C8DE;
    BCC .enemyTopCheck                                                   ;A0C8E1;
    PLP                                                                  ;A0C8E3;
    SEC                                                                  ;A0C8E4;
    PHP                                                                  ;A0C8E5;
    LDA.W Enemy.YPosition,Y                                              ;A0C8E6;
    CLC                                                                  ;A0C8E9;
    ADC.W Enemy.YHitboxRadius,Y                                          ;A0C8EA;
    DEC                                                                  ;A0C8ED;
    AND.W #$000F                                                         ;A0C8EE;
    STA.W TargetBottomTopYOffset                                         ;A0C8F1;
    LDA.L BTS,X                                                          ;A0C8F4;
    AND.W #$001F                                                         ;A0C8F8;
    ASL                                                                  ;A0C8FB;
    ASL                                                                  ;A0C8FC;
    ASL                                                                  ;A0C8FD;
    ASL                                                                  ;A0C8FE;
    STA.W SlopeCollisionDefinitionTableBaseIndex                         ;A0C8FF;
    LDA.L BTS-1,X                                                        ;A0C902;
    BMI .enemyTopCheck                                                   ;A0C906;
    ASL                                                                  ;A0C908;
    BMI .blockBTS40                                                      ;A0C909;
    LDA.W Enemy.XPosition,Y                                              ;A0C90B;
    BRA +                                                                ;A0C90E;

  .blockBTS40:
    LDA.W Enemy.XPosition,Y                                              ;A0C910;
    EOR.W #$000F                                                         ;A0C913;

+   AND.W #$000F                                                         ;A0C916;
    CLC                                                                  ;A0C919;
    ADC.W SlopeCollisionDefinitionTableBaseIndex                         ;A0C91A;
    TAX                                                                  ;A0C91D;
    LDA.L SlopeDefinitions_SlopeTopXOffsetByYPixel,X                     ;A0C91E;
    AND.W #$001F                                                         ;A0C922;
    SEC                                                                  ;A0C925;
    SBC.W TargetBottomTopYOffset                                         ;A0C926;
    DEC                                                                  ;A0C929;
    BPL .enemyTopCheck                                                   ;A0C92A;
    CLC                                                                  ;A0C92C;
    ADC.W Enemy.YPosition,Y                                              ;A0C92D;
    STA.W Enemy.YPosition,Y                                              ;A0C930;

  .enemyTopCheck:
    LDA.W Enemy.XPosition,Y                                              ;A0C933;
    PHA                                                                  ;A0C936;
    LDA.W Enemy.YPosition,Y                                              ;A0C937;
    SEC                                                                  ;A0C93A;
    SBC.W Enemy.YHitboxRadius,Y                                          ;A0C93B;
    PHA                                                                  ;A0C93E;
    JSL.L CalculateTheBlockContainingAPixelPosition                      ;A0C93F;
    LDA.W CurrentBlockIndex                                              ;A0C943;
    ASL                                                                  ;A0C946;
    TAX                                                                  ;A0C947;
    LDA.L LevelData,X                                                    ;A0C948;
    AND.W #$F000                                                         ;A0C94C;
    CMP.W #$1000                                                         ;A0C94F;
    BNE .return                                                          ;A0C952;
    LDX.W CurrentBlockIndex                                              ;A0C954;
    LDA.L BTS,X                                                          ;A0C957;
    AND.W #$001F                                                         ;A0C95B;
    CMP.W #$0005                                                         ;A0C95E;
    BCC .return                                                          ;A0C961;
    PLP                                                                  ;A0C963;
    SEC                                                                  ;A0C964;
    PHP                                                                  ;A0C965;
    LDA.W Enemy.YPosition,Y                                              ;A0C966;
    SEC                                                                  ;A0C969;
    SBC.W Enemy.YHitboxRadius,Y                                          ;A0C96A;
    AND.W #$000F                                                         ;A0C96D;
    EOR.W #$000F                                                         ;A0C970;
    STA.W TargetBottomTopYOffset                                         ;A0C973;
    LDA.L BTS,X                                                          ;A0C976;
    AND.W #$001F                                                         ;A0C97A;
    ASL                                                                  ;A0C97D;
    ASL                                                                  ;A0C97E;
    ASL                                                                  ;A0C97F;
    ASL                                                                  ;A0C980;
    STA.W SlopeCollisionDefinitionTableBaseIndex                         ;A0C981;
    LDA.L BTS-1,X                                                        ;A0C984;
    BPL .return                                                          ;A0C988;
    ASL                                                                  ;A0C98A;
    BMI ..blockBTS40                                                     ;A0C98B;
    LDA.W Enemy.XPosition,Y                                              ;A0C98D;
    BRA +                                                                ;A0C990;

  ..blockBTS40:
    LDA.W Enemy.XPosition,Y                                              ;A0C992;
    EOR.W #$000F                                                         ;A0C995;

+   AND.W #$000F                                                         ;A0C998;
    CLC                                                                  ;A0C99B;
    ADC.W SlopeCollisionDefinitionTableBaseIndex                         ;A0C99C;
    TAX                                                                  ;A0C99F;
    LDA.L SlopeDefinitions_SlopeTopXOffsetByYPixel,X                     ;A0C9A0;
    AND.W #$001F                                                         ;A0C9A4;
    SEC                                                                  ;A0C9A7;
    SBC.W TargetBottomTopYOffset                                         ;A0C9A8;
    DEC                                                                  ;A0C9AB;
    BEQ +                                                                ;A0C9AC;
    BPL .return                                                          ;A0C9AE;

+   EOR.W #$FFFF                                                         ;A0C9B0;
    INC                                                                  ;A0C9B3;
    CLC                                                                  ;A0C9B4;
    ADC.W Enemy.YPosition,Y                                              ;A0C9B5;
    STA.W Enemy.YPosition,Y                                              ;A0C9B8;

  .return:
    PLP                                                                  ;A0C9BB;
    PLX                                                                  ;A0C9BC;
    PLY                                                                  ;A0C9BD;
    RTL                                                                  ;A0C9BE;


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
    dw $0000                                                             ;A0C9BF;
  .subspeed:
    dw       $0000                                                       ;A0C9C1;
  .negatedSpeed:
    dw             $0000                                                 ;A0C9C3;
  .negatedSubspeed:
    dw                   $0000                                           ;A0C9C5;
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
    dw $0000                                                             ;A0CBC7;
  .speed:
    dw       $0000                                                       ;A0CBC9;
  .negatedSubspeed:
    dw             $0000                                                 ;A0CBCB;
  .negatedSpeed:
    dw                   $0000                                           ;A0CBCD;
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
    dw $0400                                                             ;A0CEBF;
    dw Palette_Boyon                                                     ;A0CEC1;
    dw $03E8                                                             ;A0CEC3;
    dw $000A                                                             ;A0CEC5;
    dw $0008                                                             ;A0CEC7;
    dw $0008                                                             ;A0CEC9;
    db $A2                                                               ;A0CECB;
    db $00                                                               ;A0CECC;
    dw $0000                                                             ;A0CECD;
    dw $0000                                                             ;A0CECF;
    dw InitAI_Boyon                                                      ;A0CED1;
    dw $0001                                                             ;A0CED3;
    dw $0000                                                             ;A0CED5;
    dw MainAI_Boyon                                                      ;A0CED7;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0CED9;
    dw RTL_A2804C                                                        ;A0CEDB;
    dw Common_NormalEnemyFrozenAI                                        ;A0CEDD;
    dw $0000                                                             ;A0CEDF;
    dw $0000                                                             ;A0CEE1;
    dd $00000000                                                         ;A0CEE3;
    dw $0000                                                             ;A0CEE7;
    dw $0000                                                             ;A0CEE9;
    dd $00000000                                                         ;A0CEEB;
    dw Common_NormalEnemyTouchAI                                         ;A0CEEF;
    dw Common_NormalEnemyShotAI                                          ;A0CEF1;
    dw $0000                                                             ;A0CEF3;
    dl Tiles_Boyon                                                       ;A0CEF5;
    db $05                                                               ;A0CEF8;
    dw EnemyDropChances_Boyon                                            ;A0CEF9;
    dw EnemyVulnerabilities_Boyon                                        ;A0CEFB;
    dw EnemyName_Boyon                                                   ;A0CEFD;

EnemyHeaders_Stoke:
    dw $0400                                                             ;A0CEFF;
    dw Palette_Stoke                                                     ;A0CF01;
    dw $0014,$0028,$0008,$0008                                           ;A0CF03;
    db $A2,$00                                                           ;A0CF0B;
    dw $0053,$0000                                                       ;A0CF0D;
    dw InitAI_Stoke                                                      ;A0CF11;
    dw $0001,$0000                                                       ;A0CF13;
    dw MainAI_Stoke                                                      ;A0CF17;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0CF19;
    dw RTL_A2804C                                                        ;A0CF1B;
    dw Common_NormalEnemyFrozenAI                                        ;A0CF1D;
    dw $0000                                                             ;A0CF1F;
    dw $0000                                                             ;A0CF21;
    dd $00000000                                                         ;A0CF23;
    dw $0000,$0000                                                       ;A0CF27;
    dd $00000000                                                         ;A0CF2B;
    dw Common_NormalEnemyTouchAI                                         ;A0CF2F;
    dw Common_NormalEnemyShotAI                                          ;A0CF31;
    dw $0000                                                             ;A0CF33;
    dl Tiles_Stoke                                                       ;A0CF35;
    db $05                                                               ;A0CF38;
    dw EnemyDropChances_Stoke                                            ;A0CF39;
    dw EnemyVulnerabilities_Default                                      ;A0CF3B;
    dw EnemyName_Stoke                                                   ;A0CF3D;

EnemyHeaders_MamaTurtle:
    dw $0C00                                                             ;A0CF3F;
    dw Palette_MamaTurtle_BabyTurtle                                     ;A0CF41;
    dw $4E20,$00C8,$0014,$0010                                           ;A0CF43;
    db $A2,$00                                                           ;A0CF4B;
    dw $0000,$0000                                                       ;A0CF4D;
    dw InitAI_MamaTurtle                                                 ;A0CF51;
    dw $0005,$0000                                                       ;A0CF53;
    dw MainAI_MamaTurtle                                                 ;A0CF57;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0CF59;
    dw RTL_A2804C                                                        ;A0CF5B;
    dw Common_NormalEnemyFrozenAI                                        ;A0CF5D;
    dw $0000                                                             ;A0CF5F;
    dw $0004                                                             ;A0CF61;
    dd $00000000                                                         ;A0CF63;
    dw $0000,$0000                                                       ;A0CF67;
    dd $00000000                                                         ;A0CF6B;
    dw EnemyTouch_MamaTurtle                                             ;A0CF6F;
    dw Common_NormalEnemyShotAI                                          ;A0CF71;
    dw $0000                                                             ;A0CF73;
    dl Tiles_MamaTurtle_BabyTurtle                                       ;A0CF75;
    db $05                                                               ;A0CF78;
    dw EnemyDropChances_MamaTurtle_BabyTurtle                            ;A0CF79;
    dw EnemyVulnerabilities_Indestructible                               ;A0CF7B;
    dw EnemyName_MamaTurtle                                              ;A0CF7D;

EnemyHeaders_BabyTurtle:
    dw $0C00                                                             ;A0CF7F;
    dw Palette_MamaTurtle_BabyTurtle                                     ;A0CF81;
    dw $4E20,$0000,$0008,$0005                                           ;A0CF83;
    db $A2,$00                                                           ;A0CF8B;
    dw $0000,$0000                                                       ;A0CF8D;
    dw InitAI_BabyTurtle                                                 ;A0CF91;
    dw $0001,$0000                                                       ;A0CF93;
    dw MainAI_BabyTurtle                                                 ;A0CF97;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0CF99;
    dw RTL_A2804C                                                        ;A0CF9B;
    dw Common_NormalEnemyFrozenAI                                        ;A0CF9D;
    dw $0000                                                             ;A0CF9F;
    dw $0000                                                             ;A0CFA1;
    dd $00000000                                                         ;A0CFA3;
    dw $0000,$0000                                                       ;A0CFA7;
    dd $00000000                                                         ;A0CFAB;
    dw EnemyTouch_BabyTurtle                                             ;A0CFAF;
    dw EnemyShot_BabyTurtle                                              ;A0CFB1;
    dw $0000                                                             ;A0CFB3;
    dl Tiles_MamaTurtle_BabyTurtle                                       ;A0CFB5;
    db $05                                                               ;A0CFB8;
    dw EnemyDropChances_MamaTurtle_BabyTurtle                            ;A0CFB9;
    dw EnemyVulnerabilities_Indestructible                               ;A0CFBB;
    dw $0000                                                             ;A0CFBD;

EnemyHeaders_Puyo:
    dw $0200                                                             ;A0CFBF;
    dw Palette_Puyo                                                      ;A0CFC1;
    dw $0064,$003C,$0008,$0004                                           ;A0CFC3;
    db $A2,$00                                                           ;A0CFCB;
    dw $0000,$0000                                                       ;A0CFCD;
    dw InitAI_Puyo                                                       ;A0CFD1;
    dw $0001,$0000                                                       ;A0CFD3;
    dw MainAI_Puyo                                                       ;A0CFD7;
    dw Common_GrappleAI_KillEnemy                                        ;A0CFD9;
    dw RTL_A2804C                                                        ;A0CFDB;
    dw Common_NormalEnemyFrozenAI                                        ;A0CFDD;
    dw $0000                                                             ;A0CFDF;
    dw $0000                                                             ;A0CFE1;
    dd $00000000                                                         ;A0CFE3;
    dw $0000,$0000                                                       ;A0CFE7;
    dd $00000000                                                         ;A0CFEB;
    dw Common_NormalEnemyTouchAI                                         ;A0CFEF;
    dw Common_NormalEnemyShotAI                                          ;A0CFF1;
    dw $0000                                                             ;A0CFF3;
    dl Tiles_Puyo                                                        ;A0CFF5;
    db $05                                                               ;A0CFF8;
    dw EnemyDropChances_Puyo                                             ;A0CFF9;
    dw EnemyVulnerabilities_Default                                      ;A0CFFB;
    dw EnemyName_Puyo                                                    ;A0CFFD;

EnemyHeaders_Cacatac:
    dw $0400                                                             ;A0CFFF;
    dw Palette_Cacatac                                                   ;A0D001;
    dw $003C,$0014,$0008,$0008                                           ;A0D003;
    db $A2,$00                                                           ;A0D00B;
    dw $0000,$0000                                                       ;A0D00D;
    dw InitAI_Cacatac                                                    ;A0D011;
    dw $0001,$0000                                                       ;A0D013;
    dw MainAI_Cacatac                                                    ;A0D017;
    dw Common_GrappleAI_KillEnemy                                        ;A0D019;
    dw RTL_A2804C                                                        ;A0D01B;
    dw Common_NormalEnemyFrozenAI                                        ;A0D01D;
    dw $0000                                                             ;A0D01F;
    dw $0002                                                             ;A0D021;
    dd $00000000                                                         ;A0D023;
    dw $0000,$0000                                                       ;A0D027;
    dd $00000000                                                         ;A0D02B;
    dw Common_NormalEnemyTouchAI                                         ;A0D02F;
    dw Common_NormalEnemyShotAI                                          ;A0D031;
    dw $0000                                                             ;A0D033;
    dl Tiles_Cacatac                                                     ;A0D035;
    db $05                                                               ;A0D038;
    dw EnemyDropChances_Cacatac                                          ;A0D039;
    dw EnemyVulnerabilities_Default                                      ;A0D03B;
    dw EnemyName_Cacatac                                                 ;A0D03D;

EnemyHeaders_Owtch:
    dw $0400                                                             ;A0D03F;
    dw Palette_Owtch                                                     ;A0D041;
    dw $0014,$0064,$0008,$0008                                           ;A0D043;
    db $A2,$00                                                           ;A0D04B;
    dw $003E,$0000                                                       ;A0D04D;
    dw InitAI_Owtch                                                      ;A0D051;
    dw $0001,$0000                                                       ;A0D053;
    dw MainAI_Owtch                                                      ;A0D057;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0D059;
    dw RTL_A2804C                                                        ;A0D05B;
    dw Common_NormalEnemyFrozenAI                                        ;A0D05D;
    dw $0000                                                             ;A0D05F;
    dw $0000                                                             ;A0D061;
    dd $00000000                                                         ;A0D063;
    dw $0000,$0000                                                       ;A0D067;
    dd $00000000                                                         ;A0D06B;
    dw Common_NormalEnemyTouchAI                                         ;A0D06F;
    dw EnemyShot_Owtch                                                   ;A0D071;
    dw $0000                                                             ;A0D073;
    dl Tiles_Owtch                                                       ;A0D075;
    db $05                                                               ;A0D078;
    dw EnemyDropChances_Owtch                                            ;A0D079;
    dw EnemyVulnerabilities_Owtch                                        ;A0D07B;
    dw EnemyName_Owtch                                                   ;A0D07D;

EnemyHeaders_ShipTop:
    dw $1000                                                             ;A0D07F;
    dw Palette_Ship                                                      ;A0D081;
    dw $0014,$0028,$005C,$0028                                           ;A0D083;
    db $A2,$00                                                           ;A0D08B;
    dw $0000,$0000                                                       ;A0D08D;
    dw InitAI_ShipTop                                                    ;A0D091;
    dw $0001,$0000                                                       ;A0D093;
    dw MainAI_ShipTop                                                    ;A0D097;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0D099;
    dw RTL_A2804C                                                        ;A0D09B;
    dw Common_NormalEnemyFrozenAI                                        ;A0D09D;
    dw $0000                                                             ;A0D09F;
    dw $0000                                                             ;A0D0A1;
    dd $00000000                                                         ;A0D0A3;
    dw RTL_A0804C                                                        ;A0D0A7;
    dw $0000                                                             ;A0D0A9;
    dd $00000000                                                         ;A0D0AB;
    dw RTL_A2804C                                                        ;A0D0AF;
    dw RTL_A2804C                                                        ;A0D0B1;
    dw $0000                                                             ;A0D0B3;
    dl Tiles_Ship                                                        ;A0D0B5;
    db $02                                                               ;A0D0B8;
    dw EnemyDropChances_ShipTop_ShipBottomEntrance                       ;A0D0B9;
    dw EnemyVulnerabilities_Default                                      ;A0D0BB;
    dw $0000                                                             ;A0D0BD;

EnemyHeaders_ShipBottomEntrance:
    dw $0200                                                             ;A0D0BF;
    dw Palette_Ship                                                      ;A0D0C1;
    dw $0014,$0028,$0060,$0028                                           ;A0D0C3;
    db $A2,$00                                                           ;A0D0CB;
    dw $0000,$0000                                                       ;A0D0CD;
    dw InitAI_ShipBottomEntrance                                         ;A0D0D1;
    dw $0001,$0000                                                       ;A0D0D3;
    dw RTL_A2804C                                                        ;A0D0D7;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0D0D9;
    dw RTL_A2804C                                                        ;A0D0DB;
    dw RTL_A2804C                                                        ;A0D0DD;
    dw $0000                                                             ;A0D0DF;
    dw $0000                                                             ;A0D0E1;
    dd $00000000                                                         ;A0D0E3;
    dw RTL_A0804C                                                        ;A0D0E9;
    dw $0000                                                             ;A0D0E7;
    dd $00000000                                                         ;A0D0EB;
    dw RTL_A2804C                                                        ;A0D0EF;
    dw RTL_A2804C                                                        ;A0D0F1;
    dw $0000                                                             ;A0D0F3;
    dl Tiles_Ship                                                        ;A0D0F5;
    db $02                                                               ;A0D0F8;
    dw EnemyDropChances_ShipTop_ShipBottomEntrance                       ;A0D0F9;
    dw EnemyVulnerabilities_Default                                      ;A0D0FB;
    dw $0000                                                             ;A0D0FD;

EnemyHeaders_Mellow:
    dw $0400                                                             ;A0D0FF;
    dw Palette_Mellow                                                    ;A0D101;
    dw $0009,$0008,$0008,$0004                                           ;A0D103;
    db $A2,$00                                                           ;A0D10B;
    dw $0020,$0000                                                       ;A0D10D;
    dw InitAI_Mellow_Mella_Menu                                          ;A0D111;
    dw $0001,$0000                                                       ;A0D113;
    dw MainAI_Mellow_Mella_Menu                                          ;A0D117;
    dw Common_GrappleAI_KillEnemy                                        ;A0D119;
    dw RTL_A2804C                                                        ;A0D11B;
    dw Common_NormalEnemyFrozenAI                                        ;A0D11D;
    dw $0000                                                             ;A0D11F;
    dw $0000                                                             ;A0D121;
    dd $00000000                                                         ;A0D123;
    dw $0000                                                             ;A0D127;
    dw InstList_Mellow_Mella_Menu                                        ;A0D129;
    dd $00000000                                                         ;A0D12B;
    dw Common_NormalEnemyTouchAI                                         ;A0D12F;
    dw Common_NormalEnemyShotAI                                          ;A0D131;
    dw UNUSED_FlySpritemapPointers_A2B204                                ;A0D133;
    dl Tiles_Mellow                                                      ;A0D135;
    db $05                                                               ;A0D138;
    dw EnemyDropChances_Mellow                                           ;A0D139;
    dw EnemyVulnerabilities_Default                                      ;A0D13B;
    dw EnemyName_Mellow                                                  ;A0D13D;

EnemyHeaders_Mella:
    dw $0400                                                             ;A0D13F;
    dw Palette_Mella                                                     ;A0D141;
    dw $001E,$0010,$0008,$0004                                           ;A0D143;
    db $A2,$00                                                           ;A0D14B;
    dw $0020,$0000                                                       ;A0D14D;
    dw InitAI_Mellow_Mella_Menu                                          ;A0D151;
    dw $0001,$0000                                                       ;A0D153;
    dw MainAI_Mellow_Mella_Menu                                          ;A0D157;
    dw Common_GrappleAI_KillEnemy                                        ;A0D159;
    dw RTL_A2804C                                                        ;A0D15B;
    dw Common_NormalEnemyFrozenAI                                        ;A0D15D;
    dw $0000                                                             ;A0D15F;
    dw $0000                                                             ;A0D161;
    dd $00000000                                                         ;A0D163;
    dw $0000                                                             ;A0D167;
    dw UNUSED_PointerToUnusedData_A2B22C                                 ;A0D169;
    dd $00000000                                                         ;A0D16B;
    dw Common_NormalEnemyTouchAI                                         ;A0D16F;
    dw Common_NormalEnemyShotAI                                          ;A0D171;
    dw UNUSED_SpritemapPointers_Mella_A2B25C                             ;A0D173;
    dl Tiles_Mella                                                       ;A0D175;
    db $05                                                               ;A0D178;
    dw EnemyDropChances_Mella                                            ;A0D179;
    dw EnemyVulnerabilities_Mella                                        ;A0D17B;
    dw EnemyName_Mella                                                   ;A0D17D;

EnemyHeaders_Menu:
    dw $0400                                                             ;A0D17F;
    dw Palette_Menu                                                      ;A0D181;
    dw $0064,$003C,$0008,$0008                                           ;A0D183;
    db $A2,$00                                                           ;A0D18B;
    dw $0020,$0000                                                       ;A0D18D;
    dw InitAI_Mellow_Mella_Menu                                          ;A0D191;
    dw $0001,$0000                                                       ;A0D193;
    dw MainAI_Mellow_Mella_Menu                                          ;A0D197;
    dw Common_GrappleAI_KillEnemy                                        ;A0D199;
    dw RTL_A2804C                                                        ;A0D19B;
    dw Common_NormalEnemyFrozenAI                                        ;A0D19D;
    dw $0000                                                             ;A0D19F;
    dw $0000                                                             ;A0D1A1;
    dd $00000000                                                         ;A0D1A3;
    dw $0000                                                             ;A0D1A7;
    dw UNUSED_DataPointer_A2B284                                         ;A0D1A9;
    dd $00000000                                                         ;A0D1AB;
    dw Common_NormalEnemyTouchAI                                         ;A0D1AF;
    dw Common_NormalEnemyShotAI                                          ;A0D1B1;
    dw UNUSED_SpritemapPointers_Menu_A2B2B4                              ;A0D1B3;
    dl Tiles_Menu                                                        ;A0D1B5;
    db $05                                                               ;A0D1B8;
    dw EnemyDropChances_Menu                                             ;A0D1B9;
    dw EnemyVulnerabilities_Default                                      ;A0D1BB;
    dw EnemyName_Menu                                                    ;A0D1BD;

EnemyHeaders_Multiviola:
    dw $0400                                                             ;A0D1BF;
    dw Palette_Multiviola                                                ;A0D1C1;
    dw $005A,$0032,$0008,$0008                                           ;A0D1C3;
    db $A2,$00                                                           ;A0D1CB;
    dw $003E,$0000                                                       ;A0D1CD;
    dw InitAI_Multiviola                                                 ;A0D1D1;
    dw $0001,$0000                                                       ;A0D1D3;
    dw MainAI_Multiviola                                                 ;A0D1D7;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0D1D9;
    dw RTL_A2804C                                                        ;A0D1DB;
    dw Common_NormalEnemyFrozenAI                                        ;A0D1DD;
    dw $0000                                                             ;A0D1DF;
    dw $0000                                                             ;A0D1E1;
    dd $00000000                                                         ;A0D1E3;
    dw $0000                                                             ;A0D1E7;
    dw InstList_Multiviola                                               ;A0D1E9;
    dd $00000000                                                         ;A0D1EB;
    dw Common_NormalEnemyTouchAI                                         ;A0D1EF;
    dw Common_NormalEnemyShotAI                                          ;A0D1F1;
    dw $0000                                                             ;A0D1F3;
    dl Tiles_Multiviola                                                  ;A0D1F5;
    db $05                                                               ;A0D1F8;
    dw EnemyDropChances_Multiviola                                       ;A0D1F9;
    dw EnemyVulnerabilities_Multiviola                                   ;A0D1FB;
    dw EnemyName_Multiviola                                              ;A0D1FD;

EnemyHeaders_LavaRocks:
    dw $0600                                                             ;A0D1FF;
    dw Palette_Polyp_Rinka                                               ;A0D201;
    dw $0001,$0004,$0004,$0004                                           ;A0D203;
    db $A2,$00                                                           ;A0D20B;
    dw $0000,$0000                                                       ;A0D20D;
    dw InitAI_Polyp                                                      ;A0D211;
    dw $0001,$0000                                                       ;A0D213;
    dw MainAI_Polyp                                                      ;A0D217;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0D219;
    dw RTL_A2804C                                                        ;A0D21B;
    dw Common_NormalEnemyFrozenAI                                        ;A0D21D;
    dw $0000                                                             ;A0D21F;
    dw $0000                                                             ;A0D221;
    dd $00000000                                                         ;A0D223;
    dw $0000,$0000                                                       ;A0D227;
    dd $00000000                                                         ;A0D22B;
    dw Common_NormalEnemyTouchAI                                         ;A0D22F;
    dw Common_NormalEnemyShotAI                                          ;A0D231;
    dw $0000                                                             ;A0D233;
    dl Tiles_Polyp_Rinka                                                 ;A0D235;
    db $05                                                               ;A0D238;
    dw EnemyDropChances_Polyp                                            ;A0D239;
    dw EnemyVulnerabilities_Indestructible                               ;A0D23B;
    dw EnemyName_Polyp                                                   ;A0D23D;

EnemyHeaders_Rinka:
    dw $0600                                                             ;A0D23F;
    dw Palette_Polyp_Rinka                                               ;A0D241;
    dw $000A,$0028,$0008,$0008                                           ;A0D243;
    db $A2,$00                                                           ;A0D24B;
    dw $0000,$0000                                                       ;A0D24D;
    dw InitAI_Rinka                                                      ;A0D251;
    dw $0001,$0000                                                       ;A0D253;
    dw MainAI_Rinka                                                      ;A0D257;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0D259;
    dw RTL_A2804C                                                        ;A0D25B;
    dw FrozenAI_Rinka                                                    ;A0D25D;
    dw $0000                                                             ;A0D25F;
    dw $0000                                                             ;A0D261;
    dd $00000000                                                         ;A0D263;
    dw PowerBombReaction_Rinka                                           ;A0D267;
    dw $0000                                                             ;A0D269;
    dd $00000000                                                         ;A0D26B;
    dw EnemyTouch_Rinka                                                  ;A0D26F;
    dw EnemyShot_Rinka                                                   ;A0D271;
    dw $0000                                                             ;A0D273;
    dl Tiles_Polyp_Rinka                                                 ;A0D275;
    db $02                                                               ;A0D278;
    dw EnemyDropChances_Rinka                                            ;A0D279;
    dw EnemyVulnerabilities_Default                                      ;A0D27B;
    dw EnemyName_Rinka                                                   ;A0D27D;

EnemyHeaders_Rio:
    dw $0400                                                             ;A0D27F;
    dw Palette_Rio                                                       ;A0D281;
    dw $002D,$000F,$0010,$0007                                           ;A0D283;
    db $A2,$00                                                           ;A0D28B;
    dw $0036,$0000                                                       ;A0D28D;
    dw InitAI_Rio                                                        ;A0D291;
    dw $0001,$0000                                                       ;A0D293;
    dw MainAI_Rio                                                        ;A0D297;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0D299;
    dw RTL_A2804C                                                        ;A0D29B;
    dw Common_NormalEnemyFrozenAI                                        ;A0D29D;
    dw $0000                                                             ;A0D29F;
    dw $0002                                                             ;A0D2A1;
    dd $00000000                                                         ;A0D2A3;
    dw $0000,$0000                                                       ;A0D2A7;
    dd $00000000                                                         ;A0D2AB;
    dw Common_NormalEnemyTouchAI                                         ;A0D2AF;
    dw Common_NormalEnemyShotAI                                          ;A0D2B1;
    dw $0000                                                             ;A0D2B3;
    dl Tiles_Rio                                                         ;A0D2B5;
    db $05                                                               ;A0D2B8;
    dw EnemyDropChances_Rio                                              ;A0D2B9;
    dw EnemyVulnerabilities_Default                                      ;A0D2BB;
    dw EnemyName_Rio                                                     ;A0D2BD;

EnemyHeaders_Squeept:
    dw $0400                                                             ;A0D2BF;
    dw Palette_Squeept                                                   ;A0D2C1;
    dw $012C,$0032,$0008,$000C                                           ;A0D2C3;
    db $A2,$00                                                           ;A0D2CB;
    dw $0036,$0000                                                       ;A0D2CD;
    dw InitAI_Squeept                                                    ;A0D2D1;
    dw $0002,$0000                                                       ;A0D2D3;
    dw MainAI_Squeept                                                    ;A0D2D7;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0D2D9;
    dw RTL_A2804C                                                        ;A0D2DB;
    dw Common_NormalEnemyFrozenAI                                        ;A0D2DD;
    dw $0000                                                             ;A0D2DF;
    dw $0002                                                             ;A0D2E1;
    dd $00000000                                                         ;A0D2E3;
    dw $0000,$0000                                                       ;A0D2E7;
    dd $00000000                                                         ;A0D2EB;
    dw Common_NormalEnemyTouchAI                                         ;A0D2EF;
    dw Common_NormalEnemyShotAI                                          ;A0D2F1;
    dw $0000                                                             ;A0D2F3;
    dl Tiles_Squeept                                                     ;A0D2F5;
    db $05                                                               ;A0D2F8;
    dw EnemyDropChances_Squeept                                          ;A0D2F9;
    dw EnemyVulnerabilities_Squeept_Ripper2_Ripper_Tripper               ;A0D2FB;
    dw EnemyName_Squeept                                                 ;A0D2FD;

EnemyHeaders_Geruta:
    dw $0600                                                             ;A0D2FF;
    dw Palette_Geruta                                                    ;A0D301;
    dw $0078,$003C,$0010,$0009                                           ;A0D303;
    db $A2,$00                                                           ;A0D30B;
    dw $0036,$0000                                                       ;A0D30D;
    dw InitAI_Geruta                                                     ;A0D311;
    dw $0002,$0000                                                       ;A0D313;
    dw MainAI_Geruta                                                     ;A0D317;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0D319;
    dw RTL_A2804C                                                        ;A0D31B;
    dw Common_NormalEnemyFrozenAI                                        ;A0D31D;
    dw $0000                                                             ;A0D31F;
    dw $0002                                                             ;A0D321;
    dd $00000000                                                         ;A0D323;
    dw $0000,$0000                                                       ;A0D327;
    dd $00000000                                                         ;A0D32B;
    dw Common_NormalEnemyTouchAI                                         ;A0D32F;
    dw Common_NormalEnemyShotAI                                          ;A0D331;
    dw $0000                                                             ;A0D333;
    dl Tiles_Geruta                                                      ;A0D335;
    db $05                                                               ;A0D338;
    dw EnemyDropChances_Geruta                                           ;A0D339;
    dw EnemyVulnerabilities_Geruta                                       ;A0D33B;
    dw EnemyName_Geruta                                                  ;A0D33D;

EnemyHeaders_Holtz:
    dw $0800                                                             ;A0D33F;
    dw Palette_Holtz                                                     ;A0D341;
    dw $0384,$0078,$0010,$000A                                           ;A0D343;
    db $A2,$00                                                           ;A0D34B;
    dw $005F,$0000                                                       ;A0D34D;
    dw InitAI_Holtz                                                      ;A0D351;
    dw $0002,$0000                                                       ;A0D353;
    dw MainAI_Holtz                                                      ;A0D357;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0D359;
    dw RTL_A2804C                                                        ;A0D35B;
    dw Common_NormalEnemyFrozenAI                                        ;A0D35D;
    dw $0000                                                             ;A0D35F;
    dw $0002                                                             ;A0D361;
    dd $00000000                                                         ;A0D363;
    dw $0000,$0000                                                       ;A0D367;
    dd $00000000                                                         ;A0D36B;
    dw Common_NormalEnemyTouchAI                                         ;A0D36F;
    dw Common_NormalEnemyShotAI                                          ;A0D371;
    dw $0000                                                             ;A0D373;
    dl Tiles_Holtz                                                       ;A0D375;
    db $05                                                               ;A0D378;
    dw EnemyDropChances_Holtz                                            ;A0D379;
    dw EnemyVulnerabilities_Holtz                                        ;A0D37B;
    dw EnemyName_Holtz                                                   ;A0D37D;

EnemyHeaders_Oum:
    dw $0800                                                             ;A0D37F;
    dw Palette_Oum                                                       ;A0D381;
    dw $012C,$0064,$0010,$0010                                           ;A0D383;
    db $A2,$00                                                           ;A0D38B;
    dw $0000,$0000                                                       ;A0D38D;
    dw InitAI_Oum                                                        ;A0D391;
    dw $0001,$0000                                                       ;A0D393;
    dw MainAI_Oum                                                        ;A0D397;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0D399;
    dw RTL_A2804C                                                        ;A0D39B;
    dw Common_NormalEnemyFrozenAI                                        ;A0D39D;
    dw $0000                                                             ;A0D39F;
    dw $0002                                                             ;A0D3A1;
    dd $00000000                                                         ;A0D3A3;
    dw $0000,$0000                                                       ;A0D3A7;
    dd $00000000                                                         ;A0D3AB;
    dw EnemyTouch_Oum_DoesNotHurtSamus                                   ;A0D3AF;
    dw EnemyShot_Oum                                                     ;A0D3B1;
    dw $0000                                                             ;A0D3B3;
    dl Tiles_Oum                                                         ;A0D3B5;
    db $05                                                               ;A0D3B8;
    dw EnemyDropChances_Oum                                              ;A0D3B9;
    dw EnemyVulnerabilities_Indestructible                               ;A0D3BB;
    dw EnemyName_Oum                                                     ;A0D3BD;

EnemyHeaders_Choot:
    dw $0400                                                             ;A0D3BF;
    dw Palette_Choot                                                     ;A0D3C1;
    dw $0064,$0050,$0010,$0005                                           ;A0D3C3;
    db $A2,$00                                                           ;A0D3CB;
    dw $0022,$0000                                                       ;A0D3CD;
    dw InitAI_Choot                                                      ;A0D3D1;
    dw $0001,$0000                                                       ;A0D3D3;
    dw MainAI_Choot                                                      ;A0D3D7;
    dw Common_GrappleAI_KillEnemy                                        ;A0D3D9;
    dw RTL_A2804C                                                        ;A0D3DB;
    dw Common_NormalEnemyFrozenAI                                        ;A0D3DD;
    dw $0000                                                             ;A0D3DF;
    dw $0002                                                             ;A0D3E1;
    dd $00000000                                                         ;A0D3E3;
    dw $0000,$0000                                                       ;A0D3E7;
    dd $00000000                                                         ;A0D3EB;
    dw Common_NormalEnemyTouchAI                                         ;A0D3EF;
    dw Common_NormalEnemyShotAI                                          ;A0D3F1;
    dw $0000                                                             ;A0D3F3;
    dl Tiles_Choot                                                       ;A0D3F5;
    db $05                                                               ;A0D3F8;
    dw EnemyDropChances_Choot                                            ;A0D3F9;
    dw EnemyVulnerabilities_Default                                      ;A0D3FB;
    dw EnemyName_Choot                                                   ;A0D3FD;

EnemyHeaders_GRipper:
    dw $0400                                                             ;A0D3FF;
    dw Palette_GRipper                                                   ;A0D401;
    dw $00C8,$000A,$0008,$0008                                           ;A0D403;
    db $A2,$00                                                           ;A0D40B;
    dw $003E,$0000                                                       ;A0D40D;
    dw InitAI_GRipper                                                    ;A0D411;
    dw $0001,$0000                                                       ;A0D413;
    dw MainAI_GRipper                                                    ;A0D417;
    dw Common_GrappleAI_SamusLatchesOn                                   ;A0D419;
    dw RTL_A2804C                                                        ;A0D41B;
    dw Common_NormalEnemyFrozenAI                                        ;A0D41D;
    dw $0000                                                             ;A0D41F;
    dw $0000                                                             ;A0D421;
    dd $00000000                                                         ;A0D423;
    dw $0000,$0000                                                       ;A0D427;
    dd $00000000                                                         ;A0D42B;
    dw Common_NormalEnemyTouchAI                                         ;A0D42F;
    dw EnemyShot_GRipper_Ripper2                                         ;A0D431;
    dw $0000                                                             ;A0D433;
    dl Tiles_Ripper                                                      ;A0D435;
    db $05                                                               ;A0D438;
    dw EnemyDropChances_GRipper_Ripper2                                  ;A0D439;
    dw EnemyVulnerabilities_GRipper                                      ;A0D43B;
    dw EnemyName_GRipper_Ripper2                                         ;A0D43D;

EnemyHeaders_Ripper2:
    dw $0400                                                             ;A0D43F;
    dw Palette_Ripper2                                                   ;A0D441;
    dw $00C8,$000A,$0008,$0004                                           ;A0D443;
    db $A2,$00                                                           ;A0D44B;
    dw $003E,$0000                                                       ;A0D44D;
    dw InitAI_Ripper2                                                    ;A0D451;
    dw $0001,$0000                                                       ;A0D453;
    dw MainAI_Ripper2                                                    ;A0D457;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0D459;
    dw RTL_A2804C                                                        ;A0D45B;
    dw Common_NormalEnemyFrozenAI                                        ;A0D45D;
    dw $0000                                                             ;A0D45F;
    dw $0000                                                             ;A0D461;
    dd $00000000                                                         ;A0D463;
    dw $0000                                                             ;A0D467;
    dw InstList_Ripper_MovingRight                                       ;A0D469;
    dd $00000000                                                         ;A0D46B;
    dw Common_NormalEnemyTouchAI                                         ;A0D46F;
    dw EnemyShot_GRipper_Ripper2                                         ;A0D471;
    dw $0000                                                             ;A0D473;
    dl Tiles_Ripper                                                      ;A0D475;
    db $05                                                               ;A0D478;
    dw EnemyDropChances_GRipper_Ripper2                                  ;A0D479;
    dw EnemyVulnerabilities_Squeept_Ripper2_Ripper_Tripper               ;A0D47B;
    dw EnemyName_GRipper_Ripper2                                         ;A0D47D;

EnemyHeaders_Ripper:
    dw $0400                                                             ;A0D47F;
    dw Palette_Ripper                                                    ;A0D481;
    dw $00C8,$0005,$0008,$0004                                           ;A0D483;
    db $A2,$00                                                           ;A0D48B;
    dw $003E,$0000                                                       ;A0D48D;
    dw InitAI_Ripper                                                     ;A0D491;
    dw $0001,$0000                                                       ;A0D493;
    dw MainAI_Ripper                                                     ;A0D497;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0D499;
    dw RTL_A2804C                                                        ;A0D49B;
    dw Common_NormalEnemyFrozenAI                                        ;A0D49D;
    dw $0000                                                             ;A0D49F;
    dw $0000                                                             ;A0D4A1;
    dd $00000000                                                         ;A0D4A3;
    dw $0000                                                             ;A0D4A7;
    dw InstList_Ripper_MovingRight                                       ;A0D4A9;
    dd $00000000                                                         ;A0D4AB;
    dw Common_NormalEnemyTouchAI                                         ;A0D4AF;
    dw Common_NormalEnemyShotAI                                          ;A0D4B1;
    dw SpritemapPointers_Ripper                                          ;A0D4B3;
    dl Tiles_Ripper                                                      ;A0D4B5;
    db $05                                                               ;A0D4B8;
    dw EnemyDropChances_Ripper                                           ;A0D4B9;
    dw EnemyVulnerabilities_Squeept_Ripper2_Ripper_Tripper               ;A0D4BB;
    dw EnemyName_Ripper                                                  ;A0D4BD;

EnemyHeaders_Dragon:
    dw $0600                                                             ;A0D4BF;
    dw Palette_Dragon                                                    ;A0D4C1;
    dw $012C,$0018,$0008,$001C                                           ;A0D4C3;
    db $A2,$00                                                           ;A0D4CB;
    dw $0036,$0000                                                       ;A0D4CD;
    dw InitAI_Dragon                                                     ;A0D4D1;
    dw $0002,$0000                                                       ;A0D4D3;
    dw MainAI_Dragon                                                     ;A0D4D7;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0D4D9;
    dw RTL_A2804C                                                        ;A0D4DB;
    dw Common_NormalEnemyFrozenAI                                        ;A0D4DD;
    dw $0000                                                             ;A0D4DF;
    dw $0004                                                             ;A0D4E1;
    dd $00000000                                                         ;A0D4E3;
    dw PowerBombReaction_Dragon                                          ;A0D4E7;
    dw $0000                                                             ;A0D4E9;
    dd $00000000                                                         ;A0D4EB;
    dw EnemyTouch_Dragon                                                 ;A0D4EF;
    dw EnemyShot_Dragon                                                  ;A0D4F1;
    dw $0000                                                             ;A0D4F3;
    dl Tiles_Dragon                                                      ;A0D4F5;
    db $05                                                               ;A0D4F8;
    dw EnemyDropChances_Dragon                                           ;A0D4F9;
    dw EnemyVulnerabilities_Dragon                                       ;A0D4FB;
    dw EnemyName_Dragon                                                  ;A0D4FD;

EnemyHeaders_ShutterGrowing:
    dw $0400                                                             ;A0D4FF;
    dw Palette_Shutters                                                  ;A0D501;
    dw $0014,$0028,$0008,$0008                                           ;A0D503;
    db $A2,$00                                                           ;A0D50B;
    dw $0000,$0000                                                       ;A0D50D;
    dw InitAI_ShutterGrowing                                             ;A0D511;
    dw $0001,$0000                                                       ;A0D513;
    dw MainAI_ShutterGrowing                                             ;A0D517;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0D519;
    dw RTL_A2804C                                                        ;A0D51B;
    dw Common_NormalEnemyFrozenAI                                        ;A0D51D;
    dw $0000                                                             ;A0D51F;
    dw $0000                                                             ;A0D521;
    dd $00000000                                                         ;A0D523;
    dw RTL_A0804C                                                        ;A0D527;
    dw $0000                                                             ;A0D529;
    dd $00000000                                                         ;A0D52B;
    dw RTL_A2804C                                                        ;A0D52F;
    dw Common_NormalEnemyShotAI                                          ;A0D531;
    dw $0000                                                             ;A0D533;
    dl Tiles_Shutter                                                     ;A0D535;
    db $05                                                               ;A0D538;
    dw EnemyDropChances_Shutter_Kamer_BabyMetroidCutscene                ;A0D539;
    dw EnemyVulnerabilities_NonDestructibleShutter                       ;A0D53B;
    dw EnemyName_ShutterGrowing                                          ;A0D53D;

EnemyHeaders_ShutterShootable:
    dw $0400                                                             ;A0D53F;
    dw Palette_Shutters                                                  ;A0D541;
    dw $0014,$0028,$0008,$0020                                           ;A0D543;
    db $A2,$00                                                           ;A0D54B;
    dw $0000,$0000                                                       ;A0D54D;
    dw InitAI_ShutterShootable_ShutterDestroyable                        ;A0D551;
    dw $0001,$0000                                                       ;A0D553;
    dw MainAI_ShutterShootable_ShutterDestroyable_Kamer                  ;A0D557;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0D559;
    dw RTL_A2804C                                                        ;A0D55B;
    dw Common_NormalEnemyFrozenAI                                        ;A0D55D;
    dw $0000                                                             ;A0D55F;
    dw $0000                                                             ;A0D561;
    dd $00000000                                                         ;A0D563;
    dw PowerBombReaction_ShutterShootable_ShutterDestroyable_Kamer       ;A0D567;
    dw $0000                                                             ;A0D569;
    dd $00000000                                                         ;A0D56B;
    dw EnemyTouch_ShutterShootable_ShutterDestroyable_Kamer              ;A0D56F;
    dw EnemyShot_ShutterShootable_Kamer                                  ;A0D571;
    dw $0000                                                             ;A0D573;
    dl Tiles_Shutter                                                     ;A0D575;
    db $05                                                               ;A0D578;
    dw EnemyDropChances_Shutter_Kamer_BabyMetroidCutscene                ;A0D579;
    dw EnemyVulnerabilities_NonDestructibleShutter                       ;A0D57B;
    dw EnemyName_Shutter2_Kamer                                          ;A0D57D;

EnemyHeaders_ShutterHorizShootable:
    dw $0400                                                             ;A0D57F;
    dw Palette_Shutters                                                  ;A0D581;
    dw $0014,$0028,$0020,$0008                                           ;A0D583;
    db $A2,$00                                                           ;A0D58B;
    dw $0000,$0000                                                       ;A0D58D;
    dw InitAI_ShutterHorizShootable                                      ;A0D591;
    dw $0001,$0000                                                       ;A0D593;
    dw MainAI_ShutterHorizShootable                                      ;A0D597;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0D599;
    dw RTL_A2804C                                                        ;A0D59B;
    dw Common_NormalEnemyFrozenAI                                        ;A0D59D;
    dw $0000                                                             ;A0D59F;
    dw $0000                                                             ;A0D5A1;
    dd $00000000                                                         ;A0D5A3;
    dw PowerBombReaction_CommonReaction_HorizontalShutter                ;A0D5A7;
    dw $0000                                                             ;A0D5A9;
    dd $00000000                                                         ;A0D5AB;
    dw EnemyTouch_HorizShootableShutter                                  ;A0D5AF;
    dw EnemyShot_ShutterHorizShootable                                   ;A0D5B1;
    dw $0000                                                             ;A0D5B3;
    dl Tiles_Shutter                                                     ;A0D5B5;
    db $05                                                               ;A0D5B8;
    dw EnemyDropChances_Shutter_Kamer_BabyMetroidCutscene                ;A0D5B9;
    dw EnemyVulnerabilities_NonDestructibleShutter                       ;A0D5BB;
    dw EnemyName_Shutter2_Kamer                                          ;A0D5BD;

EnemyHeaders_ShutterDestroyable:
    dw $0400                                                             ;A0D5BF;
    dw Palette_Shutters                                                  ;A0D5C1;
    dw $0014,$0028,$0008,$0020                                           ;A0D5C3;
    db $A2,$00                                                           ;A0D5CB;
    dw $0000,$0000                                                       ;A0D5CD;
    dw InitAI_ShutterShootable_ShutterDestroyable                        ;A0D5D1;
    dw $0001,$0000                                                       ;A0D5D3;
    dw MainAI_ShutterShootable_ShutterDestroyable_Kamer                  ;A0D5D7;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0D5D9;
    dw RTL_A2804C                                                        ;A0D5DB;
    dw Common_NormalEnemyFrozenAI                                        ;A0D5DD;
    dw $0000                                                             ;A0D5DF;
    dw $0000                                                             ;A0D5E1;
    dd $00000000                                                         ;A0D5E3;
    dw PowerBombReaction_ShutterShootable_ShutterDestroyable_Kamer       ;A0D5E7;
    dw $0000                                                             ;A0D569;
    dd $00000000                                                         ;A0D5EB;
    dw EnemyTouch_ShutterShootable_ShutterDestroyable_Kamer              ;A0D5EF;
    dw EnemyTouch_ShutterDestroyable                                     ;A0D5F1;
    dw $0000                                                             ;A0D5F3;
    dl Tiles_Shutter                                                     ;A0D5F5;
    db $05                                                               ;A0D5F8;
    dw EnemyDropChances_Shutter_Kamer_BabyMetroidCutscene                ;A0D5F9;
    dw EnemyVulnerabilities_ShutterDestroyable                           ;A0D5FB;
    dw EnemyName_Shutter2_Kamer                                          ;A0D5FD;

EnemyHeaders_Kamer:
    dw $0400                                                             ;A0D5FF;
    dw Palette_Kamer                                                     ;A0D601;
    dw $0014,$0028,$0010,$0008                                           ;A0D603;
    db $A2,$00                                                           ;A0D60B;
    dw $0000,$0000                                                       ;A0D60D;
    dw InitAI_Kamer                                                      ;A0D611;
    dw $0001,$0000                                                       ;A0D613;
    dw MainAI_ShutterShootable_ShutterDestroyable_Kamer                  ;A0D617;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0D619;
    dw RTL_A2804C                                                        ;A0D61B;
    dw Common_NormalEnemyFrozenAI                                        ;A0D61D;
    dw $0000                                                             ;A0D61F;
    dw $0000                                                             ;A0D621;
    dd $00000000                                                         ;A0D623;
    dw PowerBombReaction_ShutterShootable_ShutterDestroyable_Kamer       ;A0D627;
    dw $0000                                                             ;A0D569;
    dd $00000000                                                         ;A0D62B;
    dw EnemyTouch_ShutterShootable_ShutterDestroyable_Kamer              ;A0D62F;
    dw EnemyShot_ShutterShootable_Kamer                                  ;A0D631;
    dw $0000                                                             ;A0D633;
    dl Tiles_Kamer                                                       ;A0D635;
    db $05                                                               ;A0D638;
    dw EnemyDropChances_Shutter_Kamer_BabyMetroidCutscene                ;A0D639;
    dw EnemyVulnerabilities_NonDestructibleShutter                       ;A0D63B;
    dw EnemyName_Shutter2_Kamer                                          ;A0D63D;

EnemyHeaders_Waver:
    dw $0600                                                             ;A0D63F;
    dw Palette_Waver                                                     ;A0D641;
    dw $001E,$000A,$0008,$0008                                           ;A0D643;
    db $A3,$00                                                           ;A0D64B;
    dw $0047,$0000                                                       ;A0D64D;
    dw InitAI_Waver                                                      ;A0D651;
    dw $0001,$0000                                                       ;A0D653;
    dw MainAI_Waver                                                      ;A0D657;
    dw Common_GrappleAI_KillEnemy                                        ;A0D659;
    dw RTL_A3804C                                                        ;A0D65B;
    dw Common_NormalEnemyFrozenAI                                        ;A0D65D;
    dw $0000                                                             ;A0D65F;
    dw $0000                                                             ;A0D661;
    dd $00000000                                                         ;A0D663;
    dw $0000,$0000                                                       ;A0D667;
    dd $00000000                                                         ;A0D66B;
    dw Common_NormalEnemyTouchAI                                         ;A0D66F;
    dw Common_NormalEnemyShotAI                                          ;A0D671;
    dw $0000                                                             ;A0D673;
    dl Tiles_Waver                                                       ;A0D675;
    db $05                                                               ;A0D678;
    dw EnemyDropChances_Waver                                            ;A0D679;
    dw EnemyVulnerabilities_Default                                      ;A0D67B;
    dw EnemyName_Waver                                                   ;A0D67D;

EnemyHeaders_Metaree:
    dw $0600                                                             ;A0D67F;
    dw Palette_Metaree                                                   ;A0D681;
    dw $0032,$0032,$0008,$000C                                           ;A0D683;
    db $A3,$00                                                           ;A0D68B;
    dw $0021,$0000                                                       ;A0D68D;
    dw InitAI_Metaree                                                    ;A0D691;
    dw $0001,$0000                                                       ;A0D693;
    dw MainAI_Metaree                                                    ;A0D697;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0D699;
    dw RTL_A3804C                                                        ;A0D69B;
    dw Common_NormalEnemyFrozenAI                                        ;A0D69D;
    dw $0000                                                             ;A0D69F;
    dw $0002                                                             ;A0D6A1;
    dd $00000000                                                         ;A0D6A3;
    dw $0000,$0000                                                       ;A0D6A7;
    dd $00000000                                                         ;A0D6AB;
    dw Common_NormalEnemyTouchAI                                         ;A0D6AF;
    dw EnemyShot_Metaree                                                 ;A0D6B1;
    dw $0000                                                             ;A0D6B3;
    dl Tiles_Metaree                                                     ;A0D6B5;
    db $05                                                               ;A0D6B8;
    dw EnemyDropChances_Metaree                                          ;A0D6B9;
    dw EnemyVulnerabilities_Metaree                                      ;A0D6BB;
    dw EnemyName_Metaree                                                 ;A0D6BD;

EnemyHeaders_Fireflea:
    dw $0600                                                             ;A0D6BF;
    dw Palette_Fireflea                                                  ;A0D6C1;
    dw $0014,$0004,$0008,$0008                                           ;A0D6C3;
    db $A3,$00                                                           ;A0D6CB;
    dw $0020,$0000                                                       ;A0D6CD;
    dw InitAI_Fireflea                                                   ;A0D6D1;
    dw $0001,$0000                                                       ;A0D6D3;
    dw MainAI_Fireflea                                                   ;A0D6D7;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0D6D9;
    dw RTL_A3804C                                                        ;A0D6DB;
    dw Common_NormalEnemyFrozenAI                                        ;A0D6DD;
    dw $0000                                                             ;A0D6DF;
    dw $0000                                                             ;A0D6E1;
    dd $00000000                                                         ;A0D6E3;
    dw PowerBombReaction_Fireflea                                        ;A0D6E7;
    dw $0000                                                             ;A0D6E9;
    dd $00000000                                                         ;A0D6EB;
    dw EnemyTouch_Fireflea                                               ;A0D6EF;
    dw EnemyShot_Fireflea                                                ;A0D6F1;
    dw $0000                                                             ;A0D6F3;
    dl Tiles_Fireflea                                                    ;A0D6F5;
    db $05                                                               ;A0D6F8;
    dw EnemyDropChances_Fireflea                                         ;A0D6F9;
    dw EnemyVulnerabilities_Default                                      ;A0D6FB;
    dw EnemyName_Fireflea                                                ;A0D6FD;

EnemyHeaders_Skultera:
    dw $0600                                                             ;A0D6FF;
    dw Palette_Skultera                                                  ;A0D701;
    dw $012C,$0050,$000D,$000B                                           ;A0D703;
    db $A3,$00                                                           ;A0D70B;
    dw $0049,$0000                                                       ;A0D70D;
    dw InitAI_Skultera                                                   ;A0D711;
    dw $0001,$0000                                                       ;A0D713;
    dw MainAI_Skultera                                                   ;A0D717;
    dw Common_GrappleAI_NoInteraction                                    ;A0D719;
    dw RTL_A3804C                                                        ;A0D71B;
    dw Common_NormalEnemyFrozenAI                                        ;A0D71D;
    dw $0000                                                             ;A0D71F;
    dw $0002                                                             ;A0D721;
    dd $00000000                                                         ;A0D723;
    dw $0000,$0000                                                       ;A0D727;
    dd $00000000                                                         ;A0D72B;
    dw Common_NormalEnemyTouchAI                                         ;A0D72F;
    dw Common_NormalEnemyShotAI                                          ;A0D731;
    dw UNUSED_SpritemapPointers_Skultera                                 ;A0D733;
    dl Tiles_Skultera                                                    ;A0D735;
    db $05                                                               ;A0D738;
    dw EnemyDropChances_Skultera                                         ;A0D739;
    dw EnemyVulnerabilities_Default                                      ;A0D73B;
    dw EnemyName_Skultera                                                ;A0D73D;

EnemyHeaders_Elevator:
    dw $0000                                                             ;A0D73F;
    dw $0000                                                             ;A0D741;
    dw $0028,$000F,$0010,$0008                                           ;A0D743;
    db $A3,$00                                                           ;A0D74B;
    dw $0059,$0000                                                       ;A0D74D;
    dw InitAI_Elevator                                                   ;A0D751;
    dw $0001,$0000                                                       ;A0D753;
    dw MainAI_GrappleAI_FrozenAI_Elevator                                ;A0D757;
    dw MainAI_GrappleAI_FrozenAI_Elevator                                ;A0D759;
    dw RTL_A3804C                                                        ;A0D75B;
    dw MainAI_GrappleAI_FrozenAI_Elevator                                ;A0D75D;
    dw $0000                                                             ;A0D75F;
    dw $0000                                                             ;A0D761;
    dd $00000000                                                         ;A0D763;
    dw RTL_A0804C                                                        ;A0D767;
    dw $0000                                                             ;A0D769;
    dd $00000000                                                         ;A0D76B;
    dw RTL_A3804C                                                        ;A0D76F;
    dw RTL_A3804C                                                        ;A0D771;
    dw $0000                                                             ;A0D773;
    dl $000000                                                           ;A0D775;
    db $05                                                               ;A0D778;
    dw $0000                                                             ;A0D779;
    dw $0000                                                             ;A0D77B;
    dw $0000                                                             ;A0D77D;

EnemyHeaders_Sciser:
    dw $0400                                                             ;A0D77F;
    dw Palette_Sciser                                                    ;A0D781;
    dw $00C8,$0078,$0008,$0008                                           ;A0D783;
    db $A3,$00                                                           ;A0D78B;
    dw $0049,$0000                                                       ;A0D78D;
    dw InitAI_Sciser                                                     ;A0D791;
    dw $0001,$0000                                                       ;A0D793;
    dw MainAI_Crawlers                                                   ;A0D797;
    dw Common_GrappleAI_KillEnemy                                        ;A0D799;
    dw RTL_A3804C                                                        ;A0D79B;
    dw Common_NormalEnemyFrozenAI                                        ;A0D79D;
    dw $0000                                                             ;A0D79F;
    dw $0002                                                             ;A0D7A1;
    dd $00000000                                                         ;A0D7A3;
    dw $0000,$0000                                                       ;A0D7A7;
    dd $00000000                                                         ;A0D7AB;
    dw Common_NormalEnemyTouchAI                                         ;A0D7AF;
    dw Common_NormalEnemyShotAI                                          ;A0D7B1;
    dw $0000                                                             ;A0D7B3;
    dl Tiles_Sciser                                                      ;A0D7B5;
    db $05                                                               ;A0D7B8;
    dw EnemyDropChances_Sciser                                           ;A0D7B9;
    dw EnemyVulnerabilities_Sciser_Zero                                  ;A0D7BB;
    dw EnemyName_Sciser                                                  ;A0D7BD;

EnemyHeaders_Zero:
    dw $0400                                                             ;A0D7BF;
    dw Palette_Zero                                                      ;A0D7C1;
    dw $0032,$0028,$0008,$0008                                           ;A0D7C3;
    db $A3,$00                                                           ;A0D7CB;
    dw $0023,$0000                                                       ;A0D7CD;
    dw InitAI_Zero                                                       ;A0D7D1;
    dw $0001,$0000                                                       ;A0D7D3;
    dw MainAI_Crawlers                                                   ;A0D7D7;
    dw Common_GrappleAI_KillEnemy                                        ;A0D7D9;
    dw RTL_A3804C                                                        ;A0D7DB;
    dw Common_NormalEnemyFrozenAI                                        ;A0D7DD;
    dw $0000                                                             ;A0D7DF;
    dw $0002                                                             ;A0D7E1;
    dd $00000000                                                         ;A0D7E3;
    dw $0000,$0000                                                       ;A0D7E7;
    dd $00000000                                                         ;A0D7EB;
    dw Common_NormalEnemyTouchAI                                         ;A0D7EF;
    dw Common_NormalEnemyShotAI                                          ;A0D7F1;
    dw $0000                                                             ;A0D7F3;
    dl Tiles_Zero                                                        ;A0D7F5;
    db $05                                                               ;A0D7F8;
    dw EnemyDropChances_Zero                                             ;A0D7F9;
    dw EnemyVulnerabilities_Sciser_Zero                                  ;A0D7FB;
    dw EnemyName_Zero                                                    ;A0D7FD;

EnemyHeaders_Tripper:
    dw $0400                                                             ;A0D7FF;
    dw Palette_Tripper                                                   ;A0D801;
    dw $0014,$0028,$0010,$0008                                           ;A0D803;
    db $A3,$00                                                           ;A0D80B;
    dw $003E,$0000                                                       ;A0D80D;
    dw InitAI_Tripper                                                    ;A0D811;
    dw $0001,$0000                                                       ;A0D813;
    dw MainAI_Tripper_Kamer2                                             ;A0D817;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0D819;
    dw RTL_A3804C                                                        ;A0D81B;
    dw Common_NormalEnemyFrozenAI                                        ;A0D81D;
    dw $0000                                                             ;A0D81F;
    dw $0000                                                             ;A0D821;
    dd $00000000                                                         ;A0D823;
    dw $0000,$0000                                                       ;A0D827;
    dd $00000000                                                         ;A0D82B;
    dw RTL_A39F07                                                        ;A0D82F;
    dw EnemyShot_Tripper                                                 ;A0D831;
    dw $0000                                                             ;A0D833;
    dl Tiles_Tripper                                                     ;A0D835;
    db $05                                                               ;A0D838;
    dw EnemyDropChances_Tripper_Kamer2                                   ;A0D839;
    dw EnemyVulnerabilities_Squeept_Ripper2_Ripper_Tripper               ;A0D83B;
    dw EnemyName_Tripper                                                 ;A0D83D;

EnemyHeaders_Kamer2:
    dw $0400                                                             ;A0D83F;
    dw Palette_Kamer2                                                    ;A0D841;
    dw $0014,$0028,$0010,$0008                                           ;A0D843;
    db $A3,$00                                                           ;A0D84B;
    dw $003E,$0000                                                       ;A0D84D;
    dw InitAI_Kamer2                                                     ;A0D851;
    dw $0001,$0000                                                       ;A0D853;
    dw MainAI_Tripper_Kamer2                                             ;A0D857;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0D859;
    dw RTL_A3804C                                                        ;A0D85B;
    dw Common_NormalEnemyFrozenAI                                        ;A0D85D;
    dw $0000                                                             ;A0D85F;
    dw $0000                                                             ;A0D861;
    dd $00000000                                                         ;A0D863;
    dw $0000,$0000                                                       ;A0D867;
    dd $00000000                                                         ;A0D86B;
    dw RTL_A39F07                                                        ;A0D86F;
    dw Common_NormalEnemyShotAI                                          ;A0D871;
    dw $0000                                                             ;A0D873;
    dl Tiles_Kamer                                                       ;A0D875;
    db $05                                                               ;A0D878;
    dw EnemyDropChances_Tripper_Kamer2                                   ;A0D879;
    dw EnemyVulnerabilities_Indestructible                               ;A0D87B;
    dw EnemyName_Tripper                                                 ;A0D87D;

EnemyHeaders_Sbug:
    dw $0200                                                             ;A0D87F;
    dw Palette_Sbug                                                      ;A0D881;
    dw $0014,$0028,$0004,$0004                                           ;A0D883;
    db $A3,$00                                                           ;A0D88B;
    dw $0000,$0000                                                       ;A0D88D;
    dw InitAI_Sbug                                                       ;A0D891;
    dw $0001,$0000                                                       ;A0D893;
    dw MainAI_Sbug                                                       ;A0D897;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0D899;
    dw RTL_A3804C                                                        ;A0D89B;
    dw Common_NormalEnemyFrozenAI                                        ;A0D89D;
    dw $0000                                                             ;A0D89F;
    dw $0000                                                             ;A0D8A1;
    dd $00000000                                                         ;A0D8A3;
    dw $0000,$0000                                                       ;A0D8A7;
    dd $00000000                                                         ;A0D8AB;
    dw Common_NormalEnemyTouchAI                                         ;A0D8AF;
    dw Common_NormalEnemyShotAI                                          ;A0D8B1;
    dw $0000                                                             ;A0D8B3;
    dl Tiles_Sbug                                                        ;A0D8B5;
    db $05                                                               ;A0D8B8;
    dw EnemyDropChances_Sbug_Sbug2                                       ;A0D8B9;
    dw EnemyVulnerabilities_Indestructible                               ;A0D8BB;
    dw EnemyName_Sbug                                                    ;A0D8BD;

EnemyHeaders_Sbug2:
    dw $8200                                                             ;A0D8BF;
    dw Palette_Sbug                                                      ;A0D8C1;
    dw $0014,$0028,$0004,$0004                                           ;A0D8C3;
    db $A3,$00                                                           ;A0D8CB;
    dw $0000,$0000                                                       ;A0D8CD;
    dw InitAI_Sbug                                                       ;A0D8D1;
    dw $0001,$0000                                                       ;A0D8D3;
    dw MainAI_Sbug                                                       ;A0D8D7;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0D8D9;
    dw RTL_A3804C                                                        ;A0D8DB;
    dw Common_NormalEnemyFrozenAI                                        ;A0D8DD;
    dw $0000                                                             ;A0D8DF;
    dw $0000                                                             ;A0D8E1;
    dd $00000000                                                         ;A0D8E3;
    dw $0000,$0000                                                       ;A0D8E7;
    dd $00000000                                                         ;A0D8EB;
    dw Common_NormalEnemyTouchAI                                         ;A0D8EF;
    dw Common_NormalEnemyShotAI                                          ;A0D8F1;
    dw $0000                                                             ;A0D8F3;
    dl Tiles_Sbug                                                        ;A0D8F5;
    db $05                                                               ;A0D8F8;
    dw EnemyDropChances_Sbug_Sbug2                                       ;A0D8F9;
    dw EnemyVulnerabilities_Indestructible                               ;A0D8FB;
    dw EnemyName_Sbug                                                    ;A0D8FD;

EnemyHeaders_Mochtroid:
    dw $0400                                                             ;A0D8FF;
    dw Palette_Mochtroid                                                 ;A0D901;
    dw $0064,$005A,$000A,$000C                                           ;A0D903;
    db $A3,$00                                                           ;A0D90B;
    dw $0058,$0000                                                       ;A0D90D;
    dw InitAI_Mochtroid                                                  ;A0D911;
    dw $0001,$0000                                                       ;A0D913;
    dw MainAI_Mochtroid                                                  ;A0D917;
    dw Common_GrappleAI_KillEnemy                                        ;A0D919;
    dw RTL_A3804C                                                        ;A0D91B;
    dw Common_NormalEnemyFrozenAI                                        ;A0D91D;
    dw $0000                                                             ;A0D91F;
    dw $0002                                                             ;A0D921;
    dd $00000000                                                         ;A0D923;
    dw $0000,$0000                                                       ;A0D927;
    dd $00000000                                                         ;A0D92B;
    dw EnemyTouch_Mochtroid                                              ;A0D92F;
    dw EnemyShot_Mochtroid                                               ;A0D931;
    dw $0000                                                             ;A0D933;
    dl Tiles_Mochtroid                                                   ;A0D935;
    db $05                                                               ;A0D938;
    dw EnemyDropChances_Mochtroid                                        ;A0D939;
    dw EnemyVulnerabilities_Default                                      ;A0D93B;
    dw EnemyName_Mochtroid                                               ;A0D93D;

EnemyHeaders_Sidehopper:
    dw $0400                                                             ;A0D93F;
    dw Palette_Sidehopper                                                ;A0D941;
    dw $003C,$0014,$0010,$000D                                           ;A0D943;
    db $A3,$00                                                           ;A0D94B;
    dw $0023,$0000                                                       ;A0D94D;
    dw InitAI_Hopper                                                     ;A0D951;
    dw $0001,$0000                                                       ;A0D953;
    dw MainAI_Hopper                                                     ;A0D957;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0D959;
    dw RTL_A3804C                                                        ;A0D95B;
    dw Common_NormalEnemyFrozenAI                                        ;A0D95D;
    dw $0000                                                             ;A0D95F;
    dw $0002                                                             ;A0D961;
    dd $00000000                                                         ;A0D963;
    dw $0000,$0000                                                       ;A0D967;
    dd $00000000                                                         ;A0D96B;
    dw Common_NormalEnemyTouchAI                                         ;A0D96F;
    dw Common_NormalEnemyShotAI                                          ;A0D971;
    dw $0000                                                             ;A0D973;
    dl Tiles_Sidehopper                                                  ;A0D975;
    db $05                                                               ;A0D978;
    dw EnemyDropChances_Sidehopper                                       ;A0D979;
    dw EnemyVulnerabilities_Default                                      ;A0D97B;
    dw EnemyName_Sidehopper                                              ;A0D97D;

EnemyHeaders_Dessgeega:
    dw $0400                                                             ;A0D97F;
    dw Palette_Dessgeega                                                 ;A0D981;
    dw $0078,$0050,$0010,$000D                                           ;A0D983;
    db $A3,$00                                                           ;A0D98B;
    dw $005F,$0000                                                       ;A0D98D;
    dw InitAI_Hopper                                                     ;A0D991;
    dw $0001,$0000                                                       ;A0D993;
    dw MainAI_Hopper                                                     ;A0D997;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0D999;
    dw RTL_A3804C                                                        ;A0D99B;
    dw Common_NormalEnemyFrozenAI                                        ;A0D99D;
    dw $0000                                                             ;A0D99F;
    dw $0002                                                             ;A0D9A1;
    dd $00000000                                                         ;A0D9A3;
    dw $0000,$0003                                                       ;A0D9A7;
    dd $00000000                                                         ;A0D9AB;
    dw Common_NormalEnemyTouchAI                                         ;A0D9AF;
    dw Common_NormalEnemyShotAI                                          ;A0D9B1;
    dw $0000                                                             ;A0D9B3;
    dl Tiles_Dessgeega                                                   ;A0D9B5;
    db $05                                                               ;A0D9B8;
    dw EnemyDropChances_Dessgeega                                        ;A0D9B9;
    dw EnemyVulnerabilities_Default                                      ;A0D9BB;
    dw EnemyName_Dessgeega                                               ;A0D9BD;

EnemyHeaders_SidehopperLarge:
    dw $0600                                                             ;A0D9BF;
    dw Palette_SidehopperLarge                                           ;A0D9C1;
    dw $0140,$0050,$0018,$0014                                           ;A0D9C3;
    db $A3,$00                                                           ;A0D9CB;
    dw $0023,$0000                                                       ;A0D9CD;
    dw InitAI_Hopper                                                     ;A0D9D1;
    dw $0001,$0000                                                       ;A0D9D3;
    dw MainAI_Hopper                                                     ;A0D9D7;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0D9D9;
    dw RTL_A3804C                                                        ;A0D9DB;
    dw Common_NormalEnemyFrozenAI                                        ;A0D9DD;
    dw $0000                                                             ;A0D9DF;
    dw $0004                                                             ;A0D9E1;
    dd $00000000                                                         ;A0D9E3;
    dw $0000,$0001                                                       ;A0D9E7;
    dd $00000000                                                         ;A0D9EB;
    dw Common_NormalEnemyTouchAI                                         ;A0D9EF;
    dw Common_NormalEnemyShotAI                                          ;A0D9F1;
    dw $0000                                                             ;A0D9F3;
    dl Tiles_SidehopperLarge                                             ;A0D9F5;
    db $05                                                               ;A0D9F8;
    dw EnemyDropChances_SidehopperLarge_SidehopperTourian                ;A0D9F9;
    dw EnemyVulnerabilities_Default                                      ;A0D9FB;
    dw EnemyName_SidehopperLarge_SidehopperTourian                       ;A0D9FD;

EnemyHeaders_SidehopperTourian:
    dw $0600                                                             ;A0D9FF;
    dw Palette_SidehopperTourian                                         ;A0DA01;
    dw $05DC,$0078,$0018,$0014                                           ;A0DA03;
    db $A3,$00                                                           ;A0DA0B;
    dw $0023,$0000                                                       ;A0DA0D;
    dw InitAI_Hopper                                                     ;A0DA11;
    dw $0001,$0000                                                       ;A0DA13;
    dw MainAI_Hopper                                                     ;A0DA17;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0DA19;
    dw RTL_A3804C                                                        ;A0DA1B;
    dw Common_NormalEnemyFrozenAI                                        ;A0DA1D;
    dw $0000                                                             ;A0DA1F;
    dw $0004                                                             ;A0DA21;
    dd $00000000                                                         ;A0DA23;
    dw $0000,$0001                                                       ;A0DA27;
    dd $00000000                                                         ;A0DA2B;
    dw Common_NormalEnemyTouchAI                                         ;A0DA2F;
    dw Common_NormalEnemyShotAI                                          ;A0DA31;
    dw $0000                                                             ;A0DA33;
    dl Tiles_SidehopperLarge                                             ;A0DA35;
    db $05                                                               ;A0DA38;
    dw EnemyDropChances_SidehopperLarge_SidehopperTourian                ;A0DA39;
    dw EnemyVulnerabilities_SidehopperTourian                            ;A0DA3B;
    dw EnemyName_SidehopperLarge_SidehopperTourian                       ;A0DA3D;

EnemyHeaders_DessgeegaLarge:
    dw $0400                                                             ;A0DA3F;
    dw Palette_DessgeegaLarge                                            ;A0DA41;
    dw $0320,$00A0,$0018,$0014                                           ;A0DA43;
    db $A3,$00                                                           ;A0DA4B;
    dw $0030,$0000                                                       ;A0DA4D;
    dw InitAI_Hopper                                                     ;A0DA51;
    dw $0001,$0000                                                       ;A0DA53;
    dw MainAI_Hopper                                                     ;A0DA57;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0DA59;
    dw RTL_A3804C                                                        ;A0DA5B;
    dw Common_NormalEnemyFrozenAI                                        ;A0DA5D;
    dw $0000                                                             ;A0DA5F;
    dw $0004                                                             ;A0DA61;
    dd $00000000                                                         ;A0DA63;
    dw $0000,$0002                                                       ;A0DA67;
    dd $00000000                                                         ;A0DA6B;
    dw Common_NormalEnemyTouchAI                                         ;A0DA6F;
    dw Common_NormalEnemyShotAI                                          ;A0DA71;
    dw $0000                                                             ;A0DA73;
    dl Tiles_DessgeegaLarge                                              ;A0DA75;
    db $05                                                               ;A0DA78;
    dw EnemyDropChances_DessgeegaLarge                                   ;A0DA79;
    dw EnemyVulnerabilities_DessgeegaLarge                               ;A0DA7B;
    dw EnemyName_DessgeegaLarge                                          ;A0DA7D;

EnemyHeaders_Zoa:
    dw $0400                                                             ;A0DA7F;
    dw Palette_Zoa                                                       ;A0DA81;
    dw $0028,$000F,$0008,$0008                                           ;A0DA83;
    db $A3,$00                                                           ;A0DA8B;
    dw $0049,$0000                                                       ;A0DA8D;
    dw InitAI_Zoa                                                        ;A0DA91;
    dw $0001,$0000                                                       ;A0DA93;
    dw MainAI_Zoa                                                        ;A0DA97;
    dw Common_GrappleAI_KillEnemy                                        ;A0DA99;
    dw RTL_A3804C                                                        ;A0DA9B;
    dw Common_NormalEnemyFrozenAI                                        ;A0DA9D;
    dw $0000                                                             ;A0DA9F;
    dw $0000                                                             ;A0DAA1;
    dd $00000000                                                         ;A0DAA3;
    dw $0000,$0000                                                       ;A0DAA7;
    dd $00000000                                                         ;A0DAAB;
    dw Common_NormalEnemyTouchAI                                         ;A0DAAF;
    dw Common_NormalEnemyShotAI                                          ;A0DAB1;
    dw $0000                                                             ;A0DAB3;
    dl Tiles_Zoa                                                         ;A0DAB5;
    db $05                                                               ;A0DAB8;
    dw EnemyDropChances_Zoa                                              ;A0DAB9;
    dw EnemyVulnerabilities_Default                                      ;A0DABB;
    dw EnemyName_Zoa                                                     ;A0DABD;

EnemyHeaders_Viola:
    dw $0400                                                             ;A0DABF;
    dw Palette_Viola                                                     ;A0DAC1;
    dw $001E,$000F,$0008,$0008                                           ;A0DAC3;
    db $A3,$00                                                           ;A0DACB;
    dw $005F,$0000                                                       ;A0DACD;
    dw InitAI_Viola                                                      ;A0DAD1;
    dw $0001,$0000                                                       ;A0DAD3;
    dw MainAI_Crawlers                                                   ;A0DAD7;
    dw Common_GrappleAI_KillEnemy                                        ;A0DAD9;
    dw RTL_A3804C                                                        ;A0DADB;
    dw Common_NormalEnemyFrozenAI                                        ;A0DADD;
    dw $0000                                                             ;A0DADF;
    dw $0000                                                             ;A0DAE1;
    dd $00000000                                                         ;A0DAE3;
    dw $0000                                                             ;A0DAE7;
    dw InstList_Viola_UpsideDown                                         ;A0DAE9;
    dd $00000000                                                         ;A0DAEB;
    dw Common_NormalEnemyTouchAI                                         ;A0DAEF;
    dw Common_NormalEnemyShotAI                                          ;A0DAF1;
    dw $0000                                                             ;A0DAF3;
    dl Tiles_Viola                                                       ;A0DAF5;
    db $05                                                               ;A0DAF8;
    dw EnemyDropChances_Viola                                            ;A0DAF9;
    dw EnemyVulnerabilities_Viola_Yard_HZoomer_Zeela_Sova_Zoomer         ;A0DAFB;
    dw EnemyName_Viola                                                   ;A0DAFD;

EnemyHeaders_Respawn:
    dw $0000                                                             ;A0DAFF;
    dw NOPNOP_A38069                                                     ;A0DB01;
    dw $0000,$0000,$0008,$0008                                           ;A0DB03;
    db $A3,$00                                                           ;A0DB0B;
    dw $0059,$0000                                                       ;A0DB0D;
    dw RTL_A3804C                                                        ;A0DB11;
    dw $0001,$0000                                                       ;A0DB13;
    dw RTL_A3804C                                                        ;A0DB17;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0DB19;
    dw RTL_A3804C                                                        ;A0DB1B;
    dw RTL_A3804C                                                        ;A0DB1D;
    dw $0000                                                             ;A0DB1F;
    dw $0000                                                             ;A0DB21;
    dd $00000000                                                         ;A0DB23;
    dw $0000,$0000                                                       ;A0DB27;
    dd $00000000                                                         ;A0DB2B;
    dw RTL_A3804C                                                        ;A0DB2F;
    dw RTL_A3804C                                                        ;A0DB31;
    dw $0000                                                             ;A0DB33;
    dl Tiles_Metroid                                                     ;A0DB35;
    db $00                                                               ;A0DB38;
    dw $0000                                                             ;A0DB39;
    dw $0000                                                             ;A0DB3B;
    dw $0000                                                             ;A0DB3D;

EnemyHeaders_Bang:
    dw $1000                                                             ;A0DB3F;
    dw Palette_Bang                                                      ;A0DB41;
    dw $000A,$0004,$0010,$0010                                           ;A0DB43;
    db $A3,$00                                                           ;A0DB4B;
    dw $0056,$0000                                                       ;A0DB4D;
    dw InitAI_Bang                                                       ;A0DB51;
    dw $0003,$0000                                                       ;A0DB53;
    dw MainAI_Bang                                                       ;A0DB57;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0DB59;
    dw RTL_A3804C                                                        ;A0DB5B;
    dw Common_NormalEnemyFrozenAI                                        ;A0DB5D;
    dw $0000                                                             ;A0DB5F;
    dw $0004                                                             ;A0DB61;
    dd $00000000                                                         ;A0DB63;
    dw $0000,$0000                                                       ;A0DB67;
    dd $00000000                                                         ;A0DB6B;
    dw Common_NormalEnemyTouchAI                                         ;A0DB6F;
    dw EnemyShot_Bang                                                    ;A0DB71;
    dw $0000                                                             ;A0DB73;
    dl Tiles_Bang                                                        ;A0DB75;
    db $05                                                               ;A0DB78;
    dw EnemyDropChances_Bang                                             ;A0DB79;
    dw EnemyVulnerabilities_Bang                                         ;A0DB7B;
    dw EnemyName_Bang                                                    ;A0DB7D;

EnemyHeaders_Skree:
    dw $0400                                                             ;A0DB7F;
    dw Palette_Skree                                                     ;A0DB81;
    dw $000F,$000A,$0008,$000C                                           ;A0DB83;
    db $A3,$00                                                           ;A0DB8B;
    dw $0021,$0000                                                       ;A0DB8D;
    dw InitAI_Skree                                                      ;A0DB91;
    dw $0001,$0000                                                       ;A0DB93;
    dw MainAI_Skree                                                      ;A0DB97;
    dw Common_GrappleAI_KillEnemy                                        ;A0DB99;
    dw RTL_A3804C                                                        ;A0DB9B;
    dw Common_NormalEnemyFrozenAI                                        ;A0DB9D;
    dw $0000                                                             ;A0DB9F;
    dw $0000                                                             ;A0DBA1;
    dd $00000000                                                         ;A0DBA3;
    dw $0000,$0000                                                       ;A0DBA7;
    dd $00000000                                                         ;A0DBAB;
    dw Common_NormalEnemyTouchAI                                         ;A0DBAF;
    dw EnemyShot_Skree                                                   ;A0DBB1;
    dw $0000                                                             ;A0DBB3;
    dl Tiles_Skree                                                       ;A0DBB5;
    db $05                                                               ;A0DBB8;
    dw EnemyDropChances_Skree                                            ;A0DBB9;
    dw EnemyVulnerabilities_Default                                      ;A0DBBB;
    dw EnemyName_Skree                                                   ;A0DBBD;

EnemyHeaders_Yard:
    dw $0800                                                             ;A0DBBF;
    dw Palette_Yard                                                      ;A0DBC1;
    dw $000A,$0064,$0008,$0008                                           ;A0DBC3;
    db $A3,$00                                                           ;A0DBCB;
    dw $003E,$0000                                                       ;A0DBCD;
    dw InitAI_Yard                                                       ;A0DBD1;
    dw $0001,$0000                                                       ;A0DBD3;
    dw MainAI_Yard                                                       ;A0DBD7;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0DBD9;
    dw RTL_A3804C                                                        ;A0DBDB;
    dw Common_NormalEnemyFrozenAI                                        ;A0DBDD;
    dw $0000                                                             ;A0DBDF;
    dw $0002                                                             ;A0DBE1;
    dd $00000000                                                         ;A0DBE3;
    dw $0000,$0000                                                       ;A0DBE7;
    dd $00000000                                                         ;A0DBEB;
    dw EnemyTouch_Yard                                                   ;A0DBEF;
    dw EnemyShot_Yard                                                    ;A0DBF1;
    dw $0000                                                             ;A0DBF3;
    dl Tiles_Yard                                                        ;A0DBF5;
    db $05                                                               ;A0DBF8;
    dw EnemyDropChances_Yard                                             ;A0DBF9;
    dw EnemyVulnerabilities_Viola_Yard_HZoomer_Zeela_Sova_Zoomer         ;A0DBFB;
    dw EnemyName_Yard                                                    ;A0DBFD;

EnemyHeaders_Reflec:
    dw $0600                                                             ;A0DBFF;
    dw Palette_Reflec                                                    ;A0DC01;
    dw $00C8,$001E,$0010,$0010                                           ;A0DC03;
    db $A3,$00                                                           ;A0DC0B;
    dw $0057,$0000                                                       ;A0DC0D;
    dw InitAI_Reflec                                                     ;A0DC11;
    dw $0001,$0000                                                       ;A0DC13;
    dw RTL_A3DC1B                                                        ;A0DC17;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0DC19;
    dw RTL_A3804C                                                        ;A0DC1B;
    dw Common_NormalEnemyFrozenAI                                        ;A0DC1D;
    dw $0000                                                             ;A0DC1F;
    dw $0002                                                             ;A0DC21;
    dd $00000000                                                         ;A0DC23;
    dw $0000,$0000                                                       ;A0DC27;
    dd $00000000                                                         ;A0DC2B;
    dw RTL_A3804C                                                        ;A0DC2F;
    dw EnemyShot_Reflec                                                  ;A0DC31;
    dw $0000                                                             ;A0DC33;
    dl Tiles_Reflec                                                      ;A0DC35;
    db $05                                                               ;A0DC38;
    dw EnemyDropChances_Reflec                                           ;A0DC39;
    dw EnemyVulnerabilities_Indestructible                               ;A0DC3B;
    dw EnemyName_Reflec                                                  ;A0DC3D;

EnemyHeaders_HZoomer:
    dw $0600                                                             ;A0DC3F;
    dw Palette_HZoomer                                                   ;A0DC41;
    dw $000F,$0005,$0008,$0008                                           ;A0DC43;
    db $A3,$00                                                           ;A0DC4B;
    dw $0023,$0000                                                       ;A0DC4D;
    dw InitAI_HZoomer                                                    ;A0DC51;
    dw $0001,$0000                                                       ;A0DC53;
    dw MainAI_HZoomer                                                    ;A0DC57;
    dw Common_GrappleAI_KillEnemy                                        ;A0DC59;
    dw RTL_A3804C                                                        ;A0DC5B;
    dw Common_NormalEnemyFrozenAI                                        ;A0DC5D;
    dw $0000                                                             ;A0DC5F;
    dw $0000                                                             ;A0DC61;
    dd $00000000                                                         ;A0DC63;
    dw $0000,$0000                                                       ;A0DC67;
    dd $00000000                                                         ;A0DC6B;
    dw Common_NormalEnemyTouchAI                                         ;A0DC6F;
    dw Common_NormalEnemyShotAI                                          ;A0DC71;
    dw $0000                                                             ;A0DC73;
    dl Tiles_Zoomer                                                      ;A0DC75;
    db $05                                                               ;A0DC78;
    dw EnemyDropChances_HZoomer                                          ;A0DC79;
    dw EnemyVulnerabilities_Viola_Yard_HZoomer_Zeela_Sova_Zoomer         ;A0DC7B;
    dw EnemyName_HZoomer                                                 ;A0DC7D;

EnemyHeaders_Zeela:
    dw $0600                                                             ;A0DC7F;
    dw Palette_Zeela                                                     ;A0DC81;
    dw $001E,$000A,$0008,$0008                                           ;A0DC83;
    db $A3,$00                                                           ;A0DC8B;
    dw $0023,$0000                                                       ;A0DC8D;
    dw InitAI_Zeela                                                      ;A0DC91;
    dw $0001,$0000                                                       ;A0DC93;
    dw MainAI_Crawlers                                                   ;A0DC97;
    dw Common_GrappleAI_KillEnemy                                        ;A0DC99;
    dw RTL_A3804C                                                        ;A0DC9B;
    dw Common_NormalEnemyFrozenAI                                        ;A0DC9D;
    dw $0000                                                             ;A0DC9F;
    dw $0000                                                             ;A0DCA1;
    dd $00000000                                                         ;A0DCA3;
    dw $0000,$0000                                                       ;A0DCA7;
    dd $00000000                                                         ;A0DCAB;
    dw Common_NormalEnemyTouchAI                                         ;A0DCAF;
    dw Common_NormalEnemyShotAI                                          ;A0DCB1;
    dw $0000                                                             ;A0DCB3;
    dl Tiles_Zeela                                                       ;A0DCB5;
    db $05                                                               ;A0DCB8;
    dw EnemyDropChances_Zeela                                            ;A0DCB9;
    dw EnemyVulnerabilities_Viola_Yard_HZoomer_Zeela_Sova_Zoomer         ;A0DCBB;
    dw EnemyName_Zeela                                                   ;A0DCBD;

EnemyHeaders_Sova:
    dw $0600                                                             ;A0DCBF;
    dw Palette_Sova                                                      ;A0DCC1;
    dw $0028,$0014,$0008,$0008                                           ;A0DCC3;
    db $A3,$00                                                           ;A0DCCB;
    dw $0023,$0000                                                       ;A0DCCD;
    dw InitAI_Sova                                                       ;A0DCD1;
    dw $0001,$0000                                                       ;A0DCD3;
    dw MainAI_Crawlers                                                   ;A0DCD7;
    dw Common_GrappleAI_KillEnemy                                        ;A0DCD9;
    dw RTL_A3804C                                                        ;A0DCDB;
    dw Common_NormalEnemyFrozenAI                                        ;A0DCDD;
    dw $0000                                                             ;A0DCDF;
    dw $0000                                                             ;A0DCE1;
    dd $00000000                                                         ;A0DCE3;
    dw $0000,$0000                                                       ;A0DCE7;
    dd $00000000                                                         ;A0DCEB;
    dw Common_NormalEnemyTouchAI                                         ;A0DCEF;
    dw Common_NormalEnemyShotAI                                          ;A0DCF1;
    dw $0000                                                             ;A0DCF3;
    dl Tiles_Sova                                                        ;A0DCF5;
    db $05                                                               ;A0DCF8;
    dw EnemyDropChances_Sova                                             ;A0DCF9;
    dw EnemyVulnerabilities_Viola_Yard_HZoomer_Zeela_Sova_Zoomer         ;A0DCFB;
    dw EnemyName_Sova                                                    ;A0DCFD;

EnemyHeaders_Zoomer:
    dw $0600                                                             ;A0DCFF;
    dw Palette_Zoomer                                                    ;A0DD01;
    dw $000F,$0005,$0008,$0008                                           ;A0DD03;
    db $A3,$00                                                           ;A0DD0B;
    dw $0023,$0000                                                       ;A0DD0D;
    dw InitAI_Zoomer_MZoomer                                             ;A0DD11;
    dw $0001,$0001                                                       ;A0DD13;
    dw MainAI_Crawlers                                                   ;A0DD17;
    dw Common_GrappleAI_KillEnemy                                        ;A0DD19;
    dw RTL_A3804C                                                        ;A0DD1B;
    dw Common_NormalEnemyFrozenAI                                        ;A0DD1D;
    dw $0000                                                             ;A0DD1F;
    dw $0000                                                             ;A0DD21;
    dd $00000000                                                         ;A0DD23;
    dw $0000,$0000                                                       ;A0DD27;
    dd $00000000                                                         ;A0DD2B;
    dw Common_NormalEnemyTouchAI                                         ;A0DD2F;
    dw Common_NormalEnemyShotAI                                          ;A0DD31;
    dw $0000                                                             ;A0DD33;
    dl Tiles_Zoomer                                                      ;A0DD35;
    db $05                                                               ;A0DD38;
    dw EnemyDropChances_Zoomer                                           ;A0DD39;
    dw EnemyVulnerabilities_Viola_Yard_HZoomer_Zeela_Sova_Zoomer         ;A0DD3B;
    dw EnemyName_Zoomer                                                  ;A0DD3D;

EnemyHeaders_MZoomer:
    dw $0600                                                             ;A0DD3F;
    dw Palette_MZoomer                                                   ;A0DD41;
    dw $000F,$0005,$0008,$0008                                           ;A0DD43;
    db $A3,$00                                                           ;A0DD4B;
    dw $0023,$0000                                                       ;A0DD4D;
    dw InitAI_Zoomer_MZoomer                                             ;A0DD51;
    dw $0001,$0001                                                       ;A0DD53;
    dw MainAI_Crawlers                                                   ;A0DD57;
    dw Common_GrappleAI_KillEnemy                                        ;A0DD59;
    dw RTL_A3804C                                                        ;A0DD5B;
    dw Common_NormalEnemyFrozenAI                                        ;A0DD5D;
    dw $0000                                                             ;A0DD5F;
    dw $0000                                                             ;A0DD61;
    dd $00000000                                                         ;A0DD63;
    dw $0000,$0000                                                       ;A0DD67;
    dd $00000000                                                         ;A0DD6B;
    dw Common_NormalEnemyTouchAI                                         ;A0DD6F;
    dw Common_NormalEnemyShotAI                                          ;A0DD71;
    dw $0000                                                             ;A0DD73;
    dl Tiles_Zoomer                                                      ;A0DD75;
    db $05                                                               ;A0DD78;
    dw EnemyDropChances_MZoomer                                          ;A0DD79;
    dw EnemyVulnerabilities_MZoomer                                      ;A0DD7B;
    dw EnemyName_MZoomer                                                 ;A0DD7D;

EnemyHeaders_Metroid:
    dw $1000                                                             ;A0DD7F;
    dw Palette_Metroid                                                   ;A0DD81;
    dw $01F4,$0078,$000A,$000A                                           ;A0DD83;
    db $A3,$00                                                           ;A0DD8B;
    dw $005A,$0000                                                       ;A0DD8D;
    dw InitAI_Metroid                                                    ;A0DD91;
    dw $0001,$0000                                                       ;A0DD93;
    dw MainAI_Metroid                                                    ;A0DD97;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0DD99;
    dw HurtAI_Metroid                                                    ;A0DD9B;
    dw FrozenAI_Metroid                                                  ;A0DD9D;
    dw $0000                                                             ;A0DD9F;
    dw $0004                                                             ;A0DDA1;
    dd $00000000                                                         ;A0DDA3;
    dw PowerBombReaction_Metroid                                         ;A0DDA7;
    dw $0000                                                             ;A0DDA9;
    dd $00000000                                                         ;A0DDAB;
    dw EnemyTouch_Metroid                                                ;A0DDAF;
    dw EnemyShot_Metroid                                                 ;A0DDB1;
    dw $0000                                                             ;A0DDB3;
    dl Tiles_Metroid                                                     ;A0DDB5;
    db $05                                                               ;A0DDB8;
    dw EnemyDropChances_Metroid                                          ;A0DDB9;
    dw EnemyVulnerabilities_Metroid                                      ;A0DDBB;
    dw EnemyName_Metroid                                                 ;A0DDBD;

EnemyHeaders_Crocomire:
    dw $A600                                                             ;A0DDBF;
    dw Palette_Crocomire                                                 ;A0DDC1;
    dw $7FFF,$0028,$0030,$0038                                           ;A0DDC3;
    db $A4,$00                                                           ;A0DDCB;
    dw $0005,$0006                                                       ;A0DDCD;
    dw InitAI_Crocomire                                                  ;A0DDD1;
    dw $0001,$0000                                                       ;A0DDD3;
    dw MainAI_Crocomire                                                  ;A0DDD7;
    dw Common_GrappleAI_SamusLatchesOn                                   ;A0DDD9;
    dw HurtAI_Crocomire                                                  ;A0DDDB;
    dw Common_NormalEnemyFrozenAI                                        ;A0DDDD;
    dw $0000                                                             ;A0DDDF;
    dw $0000                                                             ;A0DDE1;
    dd $00000000                                                         ;A0DDE3;
    dw PowerBombReaction_Crocomire                                       ;A0DDE7;
    dw $0000                                                             ;A0DDE9;
    dd $00000000                                                         ;A0DDEB;
    dw RTL_A4B950                                                        ;A0DDEF;
    dw $0000                                                             ;A0DDF1;
    dw $0000                                                             ;A0DDF3;
    dl Tiles_Crocomire                                                   ;A0DDF5;
    db $05                                                               ;A0DDF8;
    dw EnemyDropChances_Crocomire                                        ;A0DDF9;
    dw EnemyVulnerabilities_Crocomire_CrocomireTongue                    ;A0DDFB;
    dw $0000                                                             ;A0DDFD;

EnemyHeaders_CrocomireTongue:
    dw $2000                                                             ;A0DDFF;
    dw Palette_Crocomire                                                 ;A0DE01;
    dw $7FFF,$0028,$0008,$0008                                           ;A0DE03;
    db $A4,$00                                                           ;A0DE0B;
    dw $0000,$0006                                                       ;A0DE0D;
    dw InitAI_CrocomireTongue                                            ;A0DE11;
    dw $0001,$0000                                                       ;A0DE13;
    dw MainAI_CrocomireTongue                                            ;A0DE17;
    dw Common_GrappleAI_SamusLatchesOn                                   ;A0DE19;
    dw RTL_A4804C                                                        ;A0DE1B;
    dw Common_NormalEnemyFrozenAI                                        ;A0DE1D;
    dw $0000                                                             ;A0DE1F;
    dw $0000                                                             ;A0DE21;
    dd $00000000                                                         ;A0DE23;
    dw $0000,$0000                                                       ;A0DE27;
    dd $00000000                                                         ;A0DE2B;
    dw Common_NormalEnemyTouchAI                                         ;A0DE2F;
    dw Common_NormalEnemyShotAI                                          ;A0DE31;
    dw $0000                                                             ;A0DE33;
    dl Tiles_Crocomire                                                   ;A0DE35;
    db $05                                                               ;A0DE38;
    dw EnemyDropChances_CrocomireTongue                                  ;A0DE39;
    dw EnemyVulnerabilities_Crocomire_CrocomireTongue                    ;A0DE3B;
    dw $0000                                                             ;A0DE3D;

EnemyHeaders_DraygonBody:
    dw $2000                                                             ;A0DE3F;
    dw Palette_Draygon_Sprite7                                           ;A0DE41;
    dw $1770,$00A0,$0040,$0040                                           ;A0DE43;
    db $A5,$04                                                           ;A0DE4B;
    dw $0000,$0008                                                       ;A0DE4D;
    dw InitAI_DraygonBody                                                ;A0DE51;
    dw $0001,$0000                                                       ;A0DE53;
    dw MainAI_DraygonBody                                                ;A0DE57;
    dw Common_GrappleAI_NoInteraction                                    ;A0DE59;
    dw HurtAI_Draygon                                                    ;A0DE5B;
    dw Common_NormalEnemyFrozenAI                                        ;A0DE5D;
    dw $0000                                                             ;A0DE5F;
    dw $0000                                                             ;A0DE61;
    dd $00000000                                                         ;A0DE63;
    dw PowerBombReaction_Draygon                                         ;A0DE67;
    dw $0000                                                             ;A0DE69;
    dd $00000000                                                         ;A0DE6B;
    dw EnemyTouch_Draygon                                                ;A0DE6F;
    dw EnemyShot_Draygon                                                 ;A0DE71;
    dw $0000                                                             ;A0DE73;
    dl Tiles_Draygon                                                     ;A0DE75;
    db $05                                                               ;A0DE78;
    dw EnemyDropChances_DraygonBody_DraygonTail_DraygonArms              ;A0DE79;
    dw EnemyVulnerabilities_Draygon_Body_Eye_Tail_Arms                   ;A0DE7B;
    dw $0000                                                             ;A0DE7D;

EnemyHeaders_DraygonEye:
    dw $1800                                                             ;A0DE7F;
    dw NOPNOP_A58069                                                     ;A0DE81;
    dw $1770,$00A0,$0002,$0002                                           ;A0DE83;
    db $A5,$00                                                           ;A0DE8B;
    dw $0000,$0000                                                       ;A0DE8D;
    dw InitAI_DraygonEye                                                 ;A0DE91;
    dw $0001,$0000                                                       ;A0DE93;
    dw MainAI_DraygonEye                                                 ;A0DE97;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0DE99;
    dw RTL_A5804C                                                        ;A0DE9B;
    dw Common_NormalEnemyFrozenAI                                        ;A0DE9D;
    dw $0000                                                             ;A0DE9F;
    dw $0000                                                             ;A0DEA1;
    dd $00000000                                                         ;A0DEA3;
    dw RTL_A0804C                                                        ;A0DEA7;
    dw $0000                                                             ;A0DEA9;
    dd $00000000                                                         ;A0DEAB;
    dw RTL_A5804C                                                        ;A0DEAF;
    dw RTL_A5804C                                                        ;A0DEB1;
    dw $0000                                                             ;A0DEB3;
    dl Tiles_Draygon                                                     ;A0DEB5;
    db $05                                                               ;A0DEB8;
    dw EnemyDropChances_DraygonEye                                       ;A0DEB9;
    dw EnemyVulnerabilities_Draygon_Body_Eye_Tail_Arms                   ;A0DEBB;
    dw $0000                                                             ;A0DEBD;

EnemyHeaders_DraygonTail:
    dw $1800                                                             ;A0DEBF;
    dw Palette_Draygon_Sprite7                                           ;A0DEC1;
    dw $1770,$00A0,$0010,$0020                                           ;A0DEC3;
    db $A5,$00                                                           ;A0DECB;
    dw $0000,$0000                                                       ;A0DECD;
    dw InitAI_DraygonTail                                                ;A0DED1;
    dw $0001,$0000                                                       ;A0DED3;
    dw RTL_A5C5AA                                                        ;A0DED7;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0DED9;
    dw RTL_A5804C                                                        ;A0DEDB;
    dw Common_NormalEnemyFrozenAI                                        ;A0DEDD;
    dw $0000                                                             ;A0DEDF;
    dw $0000                                                             ;A0DEE1;
    dd $00000000                                                         ;A0DEE3;
    dw RTL_A0804C                                                        ;A0DEE7;
    dw $0000                                                             ;A0DEE7;
    dd $00000000                                                         ;A0DEEB;
    dw Common_NormalEnemyTouchAI                                         ;A0DEEF;
    dw Common_NormalEnemyShotAI                                          ;A0DEF1;
    dw $0000                                                             ;A0DEF3;
    dl Tiles_Draygon                                                     ;A0DEF5;
    db $05                                                               ;A0DEF8;
    dw EnemyDropChances_DraygonBody_DraygonTail_DraygonArms              ;A0DEF9;
    dw EnemyVulnerabilities_Draygon_Body_Eye_Tail_Arms                   ;A0DEFB;
    dw $0000                                                             ;A0DEFD;

EnemyHeaders_DraygonArms:
    dw $1800                                                             ;A0DEFF;
    dw Palette_Draygon_Sprite7                                           ;A0DF01;
    dw $1770,$00A0,$0018,$0018                                           ;A0DF03;
    db $A5,$00                                                           ;A0DF0B;
    dw $0000,$0000                                                       ;A0DF0D;
    dw InitAI_DraygonArms                                                ;A0DF11;
    dw $0001,$0000                                                       ;A0DF13;
    dw RTL_A5C5C4                                                        ;A0DF17;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0DF19;
    dw RTL_A5804C                                                        ;A0DF1B;
    dw Common_NormalEnemyFrozenAI                                        ;A0DF1D;
    dw $0000                                                             ;A0DF1F;
    dw $0000                                                             ;A0DF21;
    dd $00000000                                                         ;A0DF23;
    dw RTL_A0804C                                                        ;A0DF27;
    dw $0000                                                             ;A0DF29;
    dd $00000000                                                         ;A0DF2B;
    dw RTL_A5804C                                                        ;A0DF2F;
    dw RTL_A5804C                                                        ;A0DF31;
    dw $0000                                                             ;A0DF33;
    dl Tiles_Draygon                                                     ;A0DF35;
    db $05                                                               ;A0DF38;
    dw EnemyDropChances_DraygonBody_DraygonTail_DraygonArms              ;A0DF39;
    dw EnemyVulnerabilities_Draygon_Body_Eye_Tail_Arms                   ;A0DF3B;
    dw $0000                                                             ;A0DF3D;

EnemyHeaders_SporeSpawn:
    dw $0E00                                                             ;A0DF3F;
    dw Palette_SporeSpawn                                                ;A0DF41;
    dw $03C0,$000C,$0030,$0020                                           ;A0DF43;
    db $A5,$04                                                           ;A0DF4B;
    dw $002C,$0004                                                       ;A0DF4D;
    dw InitAI_SporeSpawn                                                 ;A0DF51;
    dw $0001,$0000                                                       ;A0DF53;
    dw MainAI_SporeSpawn                                                 ;A0DF57;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0DF59;
    dw RTL_A5804C                                                        ;A0DF5B;
    dw Common_NormalEnemyFrozenAI                                        ;A0DF5D;
    dw $0000                                                             ;A0DF5F;
    dw $0000                                                             ;A0DF61;
    dd $00000000                                                         ;A0DF63;
    dw PowerBombReaction_SporeSpawn                                      ;A0DF67;
    dw $0000                                                             ;A0DF69;
    dd $00000000                                                         ;A0DF6B;
    dw EnemyTouch_SporeSpawn                                             ;A0DF6F;
    dw EnemyShot_SporeSpawn_Vulnerable                                   ;A0DF71;
    dw $0000                                                             ;A0DF73;
    dl Tiles_SporeSpawn                                                  ;A0DF75;
    db $02                                                               ;A0DF78;
    dw EnemyDropChances_SporeSpawn                                       ;A0DF79;
    dw EnemyVulnerabilities_SporeSpawn                                   ;A0DF7B;
    dw $0000                                                             ;A0DF7D;

EnemyHeaders_SporeSpawnStalk:
    dw $0E00                                                             ;A0DF7F;
    dw Palette_SporeSpawn                                                ;A0DF81;
    dw $03C0,$000C,$0013,$0013                                           ;A0DF83;
    db $A5,$08                                                           ;A0DF8B;
    dw $0000,$0004                                                       ;A0DF8D;
    dw InitAI_SporeSpawn                                                 ;A0DF91;
    dw $0001,$0000                                                       ;A0DF93;
    dw MainAI_SporeSpawn                                                 ;A0DF97;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0DF99;
    dw RTL_A5804C                                                        ;A0DF9B;
    dw Common_NormalEnemyFrozenAI                                        ;A0DF9D;
    dw $0000                                                             ;A0DF9F;
    dw $0000                                                             ;A0DFA1;
    dd $00000000                                                         ;A0DFA3;
    dw $0000,$0000                                                       ;A0DFA7;
    dd $00000000                                                         ;A0DFAB;
    dw EnemyTouch_SporeSpawn                                             ;A0DFAF;
    dw EnemyShot_SporeSpawn_Vulnerable                                   ;A0DFB1;
    dw $0000                                                             ;A0DFB3;
    dl Tiles_SporeSpawn                                                  ;A0DFB5;
    db $05                                                               ;A0DFB8;
    dw EnemyDropChances_SporeSpawnStalk                                  ;A0DFB9;
    dw EnemyVulnerabilities_SporeSpawn                                   ;A0DFBB;
    dw $0000                                                             ;A0DFBD;

EnemyHeaders_Boulder:
    dw $1000                                                             ;A0DFBF;
    dw Palette_Boulder                                                   ;A0DFC1;
    dw $0014,$0028,$0010,$0010                                           ;A0DFC3;
    db $A6,$00                                                           ;A0DFCB;
    dw $0000,$0000                                                       ;A0DFCD;
    dw InitAI_Boulder                                                    ;A0DFD1;
    dw $0001,$0000                                                       ;A0DFD3;
    dw MainAI_Boulder                                                    ;A0DFD7;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0DFD9;
    dw RTL_A6804C                                                        ;A0DFDB;
    dw Common_NormalEnemyFrozenAI                                        ;A0DFDD;
    dw $0000                                                             ;A0DFDF;
    dw $0000                                                             ;A0DFE1;
    dd $00000000                                                         ;A0DFE3;
    dw $0000,$0000                                                       ;A0DFE7;
    dd $00000000                                                         ;A0DFEB;
    dw Common_NormalEnemyTouchAI                                         ;A0DFEF;
    dw Common_NormalEnemyShotAI                                          ;A0DFF1;
    dw $0000                                                             ;A0DFF3;
    dl Tiles_Boulder                                                     ;A0DFF5;
    db $05                                                               ;A0DFF8;
    dw EnemyDropChances_Boulder                                          ;A0DFF9;
    dw EnemyVulnerabilities_Boulder                                      ;A0DFFB;
    dw EnemyName_Boulder                                                 ;A0DFFD;

EnemyHeaders_KzanTop:
    dw $0400                                                             ;A0DFFF;
    dw Palette_Kzan                                                      ;A0E001;
    dw $01F4,$00C8,$0010,$000C                                           ;A0E003;
    db $A6,$00                                                           ;A0E00B;
    dw $0000,$0000                                                       ;A0E00D;
    dw InitAI_KzanTop                                                    ;A0E011;
    dw $0002,$0000                                                       ;A0E013;
    dw MainAI_KzanTop                                                    ;A0E017;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0E019;
    dw RTL_A6804C                                                        ;A0E01B;
    dw Common_NormalEnemyFrozenAI                                        ;A0E01D;
    dw $0000                                                             ;A0E01F;
    dw $0000                                                             ;A0E021;
    dd $00000000                                                         ;A0E023;
    dw $0000,$0000                                                       ;A0E027;
    dd $00000000                                                         ;A0E02B;
    dw Common_NormalEnemyTouchAI                                         ;A0E02F;
    dw RTL_A6804C                                                        ;A0E031;
    dw $0000                                                             ;A0E033;
    dl Tiles_Kzan                                                        ;A0E035;
    db $05                                                               ;A0E038;
    dw EnemyDropChances_KzanTop_KzanBottom                               ;A0E039;
    dw EnemyVulnerabilities_Indestructible                               ;A0E03B;
    dw EnemyName_KzanTop                                                 ;A0E03D;

EnemyHeaders_KzanBottom:
    dw $0200                                                             ;A0E03F;
    dw Palette_Kzan                                                      ;A0E041;
    dw $01F4,$00C8,$0010,$0002                                           ;A0E043;
    db $A6,$00                                                           ;A0E04B;
    dw $0000,$0000                                                       ;A0E04D;
    dw InitAI_KzanBottom                                                 ;A0E051;
    dw $0001,$0000                                                       ;A0E053;
    dw MainAI_KzanBottom                                                 ;A0E057;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0E059;
    dw RTL_A6804C                                                        ;A0E05B;
    dw Common_NormalEnemyFrozenAI                                        ;A0E05D;
    dw $0000                                                             ;A0E05F;
    dw $0000                                                             ;A0E061;
    dd $00000000                                                         ;A0E063;
    dw $0000,$0000                                                       ;A0E067;
    dd $00000000                                                         ;A0E06B;
    dw Common_NormalEnemyTouchAI                                         ;A0E06F;
    dw RTL_A6804C                                                        ;A0E071;
    dw $0000                                                             ;A0E073;
    dl Tiles_Kzan                                                        ;A0E075;
    db $05                                                               ;A0E078;
    dw EnemyDropChances_KzanTop_KzanBottom                               ;A0E079;
    dw EnemyVulnerabilities_Indestructible                               ;A0E07B;
    dw $0000                                                             ;A0E07D;

EnemyHeaders_Hibashi:
    dw $0800                                                             ;A0E07F;
    dw Palette_Hibashi                                                   ;A0E081;
    dw $0014,$001E,$0008,$0008                                           ;A0E083;
    db $A6,$00                                                           ;A0E08B;
    dw $0000,$0000                                                       ;A0E08D;
    dw InitAI_Hibashi                                                    ;A0E091;
    dw $0002,$0000                                                       ;A0E093;
    dw MainAI_Hibashi                                                    ;A0E097;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0E099;
    dw RTL_A6804C                                                        ;A0E09B;
    dw Common_NormalEnemyFrozenAI                                        ;A0E09D;
    dw $0000                                                             ;A0E09F;
    dw $0000                                                             ;A0E0A1;
    dd $00000000                                                         ;A0E0A3;
    dw $0000,$0000                                                       ;A0E0A7;
    dd $00000000                                                         ;A0E0AB;
    dw Common_NormalEnemyTouchAI                                         ;A0E0AF;
    dw RTL_A6804C                                                        ;A0E0B1;
    dw $0000                                                             ;A0E0B3;
    dl Tiles_Hibashi_Puromi                                              ;A0E0B5;
    db $05                                                               ;A0E0B8;
    dw EnemyDropChances_Hibashi                                          ;A0E0B9;
    dw EnemyVulnerabilities_Indestructible                               ;A0E0BB;
    dw EnemyName_Hibashi                                                 ;A0E0BD;

EnemyHeaders_Puromi:
    dw $0800                                                             ;A0E0BF;
    dw Palette_Puromi                                                    ;A0E0C1;
    dw $0028,$0032,$0008,$0008                                           ;A0E0C3;
    db $A6,$00                                                           ;A0E0CB;
    dw $0000,$0000                                                       ;A0E0CD;
    dw InitAI_Puromi                                                     ;A0E0D1;
    dw $0001,$0000                                                       ;A0E0D3;
    dw MainAI_Puromi                                                     ;A0E0D7;
    dw Common_GrappleAI_NoInteraction                                    ;A0E0D9;
    dw RTL_A6804C                                                        ;A0E0DB;
    dw Common_NormalEnemyFrozenAI                                        ;A0E0DD;
    dw $0000                                                             ;A0E0DF;
    dw $0000                                                             ;A0E0E1;
    dd $00000000                                                         ;A0E0E3;
    dw $0000,$0000                                                       ;A0E0E7;
    dd $00000000                                                         ;A0E0EB;
    dw Common_NormalEnemyTouchAI                                         ;A0E0EF;
    dw RTL_A6804C                                                        ;A0E0F1;
    dw $0000                                                             ;A0E0F3;
    dl Tiles_Hibashi_Puromi                                              ;A0E0F5;
    db $05                                                               ;A0E0F8;
    dw EnemyDropChances_Puromi                                           ;A0E0F9;
    dw EnemyVulnerabilities_Indestructible                               ;A0E0FB;
    dw EnemyName_Puromi                                                  ;A0E0FD;

EnemyHeaders_MiniKraid:
    dw $1000                                                             ;A0E0FF;
    dw Palette_MiniKraid                                                 ;A0E101;
    dw $0190,$0064,$0020,$0018                                           ;A0E103;
    db $A6,$00                                                           ;A0E10B;
    dw $0000,$0000                                                       ;A0E10D;
    dw InitAI_MiniKraid                                                  ;A0E111;
    dw $0001,$0000                                                       ;A0E113;
    dw MainAI_MiniKraid                                                  ;A0E117;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0E119;
    dw RTL_A6804C                                                        ;A0E11B;
    dw Common_NormalEnemyFrozenAI                                        ;A0E11D;
    dw $0000                                                             ;A0E11F;
    dw $0003                                                             ;A0E121;
    dd $00000000                                                         ;A0E123;
    dw EnemyShot_PowerBombReaction_MiniKraid                             ;A0E127;
    dw $0000                                                             ;A0E129;
    dd $00000000                                                         ;A0E12B;
    dw EnemyTouch_MiniKraid                                              ;A0E12F;
    dw EnemyShot_PowerBombReaction_MiniKraid                             ;A0E131;
    dw $0000                                                             ;A0E133;
    dl Tiles_MiniKraid                                                   ;A0E135;
    db $05                                                               ;A0E138;
    dw EnemyDropChances_MiniKraid                                        ;A0E139;
    dw EnemyVulnerabilities_MiniKraid                                    ;A0E13B;
    dw EnemyName_MiniKraid                                               ;A0E13D;

EnemyHeaders_RidleyCeres:
    dw $2000                                                             ;A0E13F;
    dw Palette_Ridley                                                    ;A0E141;
    dw $7FFF,$0005,$0008,$0008                                           ;A0E143;
    db $A6,$08                                                           ;A0E14B;
    dw $0000,$0001                                                       ;A0E14D;
    dw InitAI_Ridley                                                     ;A0E151;
    dw $0001,$0000                                                       ;A0E153;
    dw MainAI_RidleyCeres                                                ;A0E157;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0E159;
    dw HurtAI_RidleyCeres                                                ;A0E15B;
    dw Common_NormalEnemyFrozenAI                                        ;A0E15D;
    dw $0000                                                             ;A0E15F;
    dw $0000                                                             ;A0E161;
    dd $00000000                                                         ;A0E163;
    dw PowerBombReaction_Ridley                                          ;A0E167;
    dw $0000                                                             ;A0E169;
    dd $00000000                                                         ;A0E16B;
    dw Common_NormalEnemyTouchAI                                         ;A0E16F;
    dw EnemyShot_Ridley                                                  ;A0E171;
    dw $0000                                                             ;A0E173;
    dl Tiles_Ridley_0                                                    ;A0E175;
    db $05                                                               ;A0E178;
    dw EnemyDropChances_Ridley_RidleyCeres                               ;A0E179;
    dw EnemyVulnerabilities_Ridley_RidleyCeres                           ;A0E17B;
    dw $0000                                                             ;A0E17D;

EnemyHeaders_Ridley:
    dw $2000                                                             ;A0E17F;
    dw Palette_Ridley                                                    ;A0E181;
    dw $4650,$00A0,$0008,$0008                                           ;A0E183;
    db $A6,$08                                                           ;A0E18B;
    dw $0000,$0005                                                       ;A0E18D;
    dw InitAI_Ridley                                                     ;A0E191;
    dw $0001,$0000                                                       ;A0E193;
    dw MainAI_Ridley                                                     ;A0E197;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0E199;
    dw HurtAI_Ridley                                                     ;A0E19B;
    dw Common_NormalEnemyFrozenAI                                        ;A0E19D;
    dw TimeIsFrozenAI_Ridley                                             ;A0E19F;
    dw $0000                                                             ;A0E1A1;
    dd $00000000                                                         ;A0E1A3;
    dw PowerBombReaction_Ridley                                          ;A0E1A7;
    dw $0000                                                             ;A0E1A9;
    dd $00000000                                                         ;A0E1AB;
    dw Common_NormalEnemyTouchAI                                         ;A0E1AF;
    dw EnemyShot_Ridley                                                  ;A0E1B1;
    dw $0000                                                             ;A0E1B3;
    dl Tiles_Ridley_0                                                    ;A0E1B5;
    db $02                                                               ;A0E1B8;
    dw EnemyDropChances_Ridley_RidleyCeres                               ;A0E1B9;
    dw EnemyVulnerabilities_Ridley_RidleyCeres                           ;A0E1BB;
    dw $0000                                                             ;A0E1BD;

EnemyHeaders_RidleyExplosion:
    dw $8400                                                             ;A0E1BF;
    dw Palette_RidleyExplosion_0                                         ;A0E1C1;
    dw $4650,$00A0,$0008,$0008                                           ;A0E1C3;
    db $A6,$00                                                           ;A0E1CB;
    dw $0000,$0000                                                       ;A0E1CD;
    dw InitAI_RidleyExplosion                                            ;A0E1D1;
    dw $0001,$0000                                                       ;A0E1D3;
    dw MainAI_RidleyExplosion                                            ;A0E1D7;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0E1D9;
    dw RTL_A6804C                                                        ;A0E1DB;
    dw RTL_A6804C                                                        ;A0E1DD;
    dw $0000                                                             ;A0E1DF;
    dw $0000                                                             ;A0E1E1;
    dd $00000000                                                         ;A0E1E3;
    dw RTL_A0804C                                                        ;A0E1E7;
    dw $0000                                                             ;A0E1E9;
    dd $00000000                                                         ;A0E1EB;
    dw RTL_A6804C                                                        ;A0E1EF;
    dw RTL_A6804C                                                        ;A0E1F1;
    dw $0000                                                             ;A0E1F3;
    dl Tiles_RidleyExplosion                                             ;A0E1F5;
    db $05                                                               ;A0E1F8;
    dw $0000                                                             ;A0E1F9;
    dw EnemyVulnerabilities_Indestructible                               ;A0E1FB;
    dw $0000                                                             ;A0E1FD;

EnemyHeaders_Steam:
    dw $0000                                                             ;A0E1FF;
    dw Palette_CeresSteam                                                ;A0E201;
    dw $7FFF,$0000,$0008,$0008                                           ;A0E203;
    db $A6,$00                                                           ;A0E20B;
    dw $0000,$0000                                                       ;A0E20D;
    dw InitAI_CeresSteam                                                 ;A0E211;
    dw $0001,$0000                                                       ;A0E213;
    dw MainAI_CeresSteam                                                 ;A0E217;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0E219;
    dw RTL_A6804C                                                        ;A0E21B;
    dw Common_NormalEnemyFrozenAI                                        ;A0E21D;
    dw $0000                                                             ;A0E21F;
    dw $0000                                                             ;A0E221;
    dd $00000000                                                         ;A0E223;
    dw $0000,$0000                                                       ;A0E227;
    dd $00000000                                                         ;A0E22B;
    dw EnemyTouch_CeresSteam                                             ;A0E22F;
    dw RTL_A6804C                                                        ;A0E231;
    dw $0000                                                             ;A0E233;
    dl EnemyHeaders_CeresDoor                                            ;A0E235;
    db $05                                                               ;A0E238;
    dw EnemyDropChances_Steam_Dachora_DachoraEscape                      ;A0E239;
    dw EnemyVulnerabilities_Indestructible                               ;A0E23B;
    dw $0000                                                             ;A0E23D;

EnemyHeaders_CeresDoor:
    dw $8600                                                             ;A0E23F;
    dw Palette_CeresDoor_BeforeEscape                                    ;A0E241;
    dw $0028,$000F,$0008,$0020                                           ;A0E243;
    db $A6,$00                                                           ;A0E24B;
    dw $0059,$0000                                                       ;A0E24D;
    dw InitAI_CeresDoor                                                  ;A0E251;
    dw $0001,$0000                                                       ;A0E253;
    dw MainAI_CeresDoor                                                  ;A0E257;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0E259;
    dw RTL_A6804C                                                        ;A0E25B;
    dw Common_NormalEnemyFrozenAI                                        ;A0E25D;
    dw $0000                                                             ;A0E25F;
    dw $0000                                                             ;A0E261;
    dd $00000000                                                         ;A0E263;
    dw $0000                                                             ;A0E267;
    dw InstListPointers_CeresDoor                                        ;A0E269;
    dd $00000000                                                         ;A0E26B;
    dw RTL_A6F920                                                        ;A0E26F;
    dw RTL_A6F920                                                        ;A0E271;
    dw InitAI_Zebetite                                                   ;A0E273;
    dl Tiles_CeresDoor_0                                                 ;A0E275;
    db $02                                                               ;A0E278;
    dw $0000                                                             ;A0E279;
    dw $0000                                                             ;A0E27B;
    dw $0000                                                             ;A0E27D;

EnemyHeaders_Zebetite:
    dw $0000                                                             ;A0E27F;
    dw $0000                                                             ;A0E281;
    dw $03E8,$0000,$0008,$0018                                           ;A0E283;
    db $A6,$00                                                           ;A0E28B;
    dw $0000,$0000                                                       ;A0E28D;
    dw InitAI_Zebetite                                                   ;A0E291;
    dw $0001,$0000                                                       ;A0E293;
    dw MainAI_Zebetite                                                   ;A0E297;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0E299;
    dw RTL_A6804C                                                        ;A0E29B;
    dw Common_NormalEnemyFrozenAI                                        ;A0E29D;
    dw $0000                                                             ;A0E29F;
    dw $0000                                                             ;A0E2A1;
    dd $00000000                                                         ;A0E2A3;
    dw $0000,$0000                                                       ;A0E2A7;
    dd $00000000                                                         ;A0E2AB;
    dw EnemyTouch_Zebetite                                               ;A0E2AF;
    dw EnemyShot_Zebetite                                                ;A0E2B1;
    dw $0000                                                             ;A0E2B3;
    dl Tiles_MotherBrainHead                                             ;A0E2B5;
    db $05                                                               ;A0E2B8;
    dw $0000                                                             ;A0E2B9;
    dw EnemyVulnerabilities_Zebetite                                     ;A0E2BB;
    dw $0000                                                             ;A0E2BD;

EnemyHeaders_Kraid:
    dw $1E00                                                             ;A0E2BF;
    dw Palette_Kraid                                                     ;A0E2C1;
    dw $03E8,$0014,$0038,$0090                                           ;A0E2C3;
    db $A7,$00                                                           ;A0E2CB;
    dw $0000,$0003                                                       ;A0E2CD;
    dw InitAI_Kraid                                                      ;A0E2D1;
    dw $0001,$0000                                                       ;A0E2D3;
    dw MainAI_Kraid                                                      ;A0E2D7;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0E2D9;
    dw RTL_A7804C                                                        ;A0E2DB;
    dw Common_NormalEnemyFrozenAI                                        ;A0E2DD;
    dw $0000                                                             ;A0E2DF;
    dw $0000                                                             ;A0E2E1;
    dd $00000000                                                         ;A0E2E3;
    dw Common_NormalEnemyPowerBombAI_NoDeathCheck                        ;A0E2E7;
    dw $0000                                                             ;A0E2E9;
    dd $00000000                                                         ;A0E2EB;
    dw EnemyTouch_Kraid                                                  ;A0E2EF;
    dw RTL_A7804C                                                        ;A0E2F1;
    dw $0000                                                             ;A0E2F3;
    dl Tiles_Kraid                                                       ;A0E2F5;
    db $05                                                               ;A0E2F8;
    dw EnemyDropChances_Kraid                                            ;A0E2F9;
    dw EnemyVulnerabilities_Kraid                                        ;A0E2FB;
    dw $0000                                                             ;A0E2FD;

EnemyHeaders_KraidArm:
    dw $1E00                                                             ;A0E2FF;
    dw Palette_Kraid                                                     ;A0E301;
    dw $03E8,$0014,$0030,$0030                                           ;A0E303;
    db $A7,$00                                                           ;A0E30B;
    dw $0000,$0000                                                       ;A0E30D;
    dw InitAI_KraidArm                                                   ;A0E311;
    dw $0001,$0000                                                       ;A0E313;
    dw MainAI_KraidArm                                                   ;A0E317;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0E319;
    dw RTL_A7804C                                                        ;A0E31B;
    dw Common_NormalEnemyFrozenAI                                        ;A0E31D;
    dw $0000                                                             ;A0E31F;
    dw $0000                                                             ;A0E321;
    dd $00000000                                                         ;A0E323;
    dw $0000,$0000                                                       ;A0E327;
    dd $00000000                                                         ;A0E32B;
    dw EnemyTouch_KraidArm                                               ;A0E32F;
    dw RTL_A794B5                                                        ;A0E331;
    dw $0000                                                             ;A0E333;
    dl Tiles_Kraid                                                       ;A0E335;
    db $05                                                               ;A0E338;
    dw $0000                                                             ;A0E339;
    dw EnemyVulnerabilities_KraidArm_KraidFoot                           ;A0E33B;
    dw $0000                                                             ;A0E33D;

EnemyHeaders_KraidLintTop:
    dw $1E00                                                             ;A0E33F;
    dw Palette_Kraid                                                     ;A0E341;
    dw $03E8,$000A,$0018,$0008                                           ;A0E343;
    db $A7,$00                                                           ;A0E34B;
    dw $0000,$0000                                                       ;A0E34D;
    dw InitAI_KraidLintTop                                               ;A0E351;
    dw $0001,$0000                                                       ;A0E353;
    dw MainAI_KraidLintTop                                               ;A0E357;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0E359;
    dw RTL_A7804C                                                        ;A0E35B;
    dw Common_NormalEnemyFrozenAI                                        ;A0E35D;
    dw $0000                                                             ;A0E35F;
    dw $0000                                                             ;A0E361;
    dd $00000000                                                         ;A0E363;
    dw $0000,$0000                                                       ;A0E367;
    dd $00000000                                                         ;A0E36B;
    dw RTL_A7948F                                                        ;A0E36F;
    dw Common_NormalEnemyShotAI                                          ;A0E371;
    dw $0000                                                             ;A0E373;
    dl Tiles_Kraid                                                       ;A0E375;
    db $05                                                               ;A0E378;
    dw $0000                                                             ;A0E379;
    dw EnemyVulnerabilities_Kraid_LintTop_LintMiddle_LintBottom          ;A0E37B;
    dw $0000                                                             ;A0E37D;

EnemyHeaders_KraidLintMiddle:
    dw $1E00                                                             ;A0E37F;
    dw Palette_Kraid                                                     ;A0E381;
    dw $03E8,$000A,$0018,$0008                                           ;A0E383;
    db $A7,$00                                                           ;A0E38B;
    dw $0000,$0000                                                       ;A0E38D;
    dw InitAI_KraidLintMiddle                                            ;A0E391;
    dw $0001,$0000                                                       ;A0E393;
    dw MainAI_KraidLintMiddle                                            ;A0E397;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0E399;
    dw RTL_A7804C                                                        ;A0E39B;
    dw Common_NormalEnemyFrozenAI                                        ;A0E39D;
    dw $0000                                                             ;A0E39F;
    dw $0000                                                             ;A0E3A1;
    dd $00000000                                                         ;A0E3A3;
    dw $0000,$0000                                                       ;A0E3A7;
    dd $00000000                                                         ;A0E3AB;
    dw RTL_A7948F                                                        ;A0E3AF;
    dw Common_NormalEnemyShotAI                                          ;A0E3B1;
    dw $0000                                                             ;A0E3B3;
    dl Tiles_Kraid                                                       ;A0E3B5;
    db $05                                                               ;A0E3B8;
    dw $0000                                                             ;A0E3B9;
    dw EnemyVulnerabilities_Kraid_LintTop_LintMiddle_LintBottom          ;A0E3BB;
    dw $0000                                                             ;A0E3BD;

EnemyHeaders_KraidLintBottom:
    dw $1E00                                                             ;A0E3BF;
    dw Palette_Kraid                                                     ;A0E3C1;
    dw $03E8,$000A,$0018,$0008                                           ;A0E3C3;
    db $A7,$00                                                           ;A0E3CB;
    dw $0000,$0000                                                       ;A0E3CD;
    dw InitAI_KraidLintBottom                                            ;A0E3D1;
    dw $0001,$0000                                                       ;A0E3D3;
    dw MainAI_KraidLintBottom                                            ;A0E3D7;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0E3D9;
    dw RTL_A7804C                                                        ;A0E3DB;
    dw Common_NormalEnemyFrozenAI                                        ;A0E3DD;
    dw $0000                                                             ;A0E3DF;
    dw $0000                                                             ;A0E3E1;
    dd $00000000                                                         ;A0E3E3;
    dw $0000,$0000                                                       ;A0E3E7;
    dd $00000000                                                         ;A0E3EB;
    dw RTL_A7948F                                                        ;A0E3EF;
    dw Common_NormalEnemyShotAI                                          ;A0E3F1;
    dw $0000                                                             ;A0E3F3;
    dl Tiles_Kraid                                                       ;A0E3F5;
    db $05                                                               ;A0E3F8;
    dw $0000                                                             ;A0E3F9;
    dw EnemyVulnerabilities_Kraid_LintTop_LintMiddle_LintBottom          ;A0E3FB;
    dw $0000                                                             ;A0E3FD;

EnemyHeaders_KraidFoot:
    dw $1E00                                                             ;A0E3FF;
    dw Palette_Kraid                                                     ;A0E401;
    dw $03E8,$0014,$0008,$0008                                           ;A0E403;
    db $A7,$00                                                           ;A0E40B;
    dw $0000,$0000                                                       ;A0E40D;
    dw InitAI_KraidFoot                                                  ;A0E411;
    dw $0001,$0000                                                       ;A0E413;
    dw MainAI_KraidFoot                                                  ;A0E417;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0E419;
    dw RTL_A7804C                                                        ;A0E41B;
    dw Common_NormalEnemyFrozenAI                                        ;A0E41D;
    dw $0000                                                             ;A0E41F;
    dw $0000                                                             ;A0E421;
    dd $00000000                                                         ;A0E423;
    dw $0000,$0000                                                       ;A0E427;
    dd $00000000                                                         ;A0E42B;
    dw RTL_A7948F                                                        ;A0E42F;
    dw RTL_A794B5                                                        ;A0E431;
    dw $0000                                                             ;A0E433;
    dl Tiles_Kraid                                                       ;A0E435;
    db $05                                                               ;A0E438;
    dw EnemyDropChances_KraidNail_KraidFoot                              ;A0E439;
    dw EnemyVulnerabilities_KraidArm_KraidFoot                           ;A0E43B;
    dw $0000                                                             ;A0E43D;

EnemyHeaders_KraidNail:
    dw $1E00                                                             ;A0E43F;
    dw Palette_Kraid                                                     ;A0E441;
    dw $000A,$000A,$0008,$0008                                           ;A0E443;
    db $A7,$00                                                           ;A0E44B;
    dw $0000,$0000                                                       ;A0E44D;
    dw InitAI_KraidNail                                                  ;A0E451;
    dw $0001,$0000                                                       ;A0E453;
    dw MainAI_KraidNail                                                  ;A0E457;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0E459;
    dw RTL_A7804C                                                        ;A0E45B;
    dw Common_NormalEnemyFrozenAI                                        ;A0E45D;
    dw $0000                                                             ;A0E45F;
    dw $0000                                                             ;A0E461;
    dd $00000000                                                         ;A0E463;
    dw $0000,$0000                                                       ;A0E467;
    dd $00000000                                                         ;A0E46B;
    dw EnemyTouch_KraidNail                                              ;A0E46F;
    dw Common_NormalEnemyShotAI                                          ;A0E471;
    dw $0000                                                             ;A0E473;
    dl Tiles_Kraid                                                       ;A0E475;
    db $05                                                               ;A0E478;
    dw EnemyDropChances_KraidNail_KraidFoot                              ;A0E479;
    dw EnemyVulnerabilities_KraidNail_KraidNailBad                       ;A0E47B;
    dw $0000                                                             ;A0E47D;

EnemyHeaders_KraidNailBad:
    dw $1E00                                                             ;A0E47F;
    dw Palette_Kraid                                                     ;A0E481;
    dw $000A,$000A,$0008,$0008                                           ;A0E483;
    db $A7,$00                                                           ;A0E48B;
    dw $0000,$0000                                                       ;A0E48D;
    dw InitAI_KraidNailBad                                               ;A0E491;
    dw $0001,$0000                                                       ;A0E493;
    dw MainAI_KraidNailBad                                               ;A0E497;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0E499;
    dw RTL_A7804C                                                        ;A0E49B;
    dw Common_NormalEnemyFrozenAI                                        ;A0E49D;
    dw $0000                                                             ;A0E49F;
    dw $0000                                                             ;A0E4A1;
    dd $00000000                                                         ;A0E4A3;
    dw $0000,$0000                                                       ;A0E4A7;
    dd $00000000                                                         ;A0E4AB;
    dw EnemyTouch_KraidNailBad                                           ;A0E4AF;
    dw Common_NormalEnemyShotAI                                          ;A0E4B1;
    dw $0000                                                             ;A0E4B3;
    dl Tiles_Kraid                                                       ;A0E4B5;
    db $05                                                               ;A0E4B8;
    dw $0000                                                             ;A0E4B9;
    dw EnemyVulnerabilities_KraidNail_KraidNailBad                       ;A0E4BB;
    dw $0000                                                             ;A0E4BD;

EnemyHeaders_PhantoonBody:
    dw $0C00                                                             ;A0E4BF;
    dw Palette_Phantoon                                                  ;A0E4C1;
    dw $09C4,$0028,$0008,$0008                                           ;A0E4C3;
    db $A7,$08                                                           ;A0E4CB;
    dw $0000,$0007                                                       ;A0E4CD;
    dw InitAI_PhantoonBody                                               ;A0E4D1;
    dw $0001,$0000                                                       ;A0E4D3;
    dw MainAI_Phantoon                                                   ;A0E4D7;
    dw Common_GrappleAI_NoInteraction                                    ;A0E4D9;
    dw HurtAI_Phantoon                                                   ;A0E4DB;
    dw RTL_A7804C                                                        ;A0E4DD;
    dw $0000                                                             ;A0E4DF;
    dw $0000                                                             ;A0E4E1;
    dd $00000000                                                         ;A0E4E3;
    dw RTL_A7DD9A                                                        ;A0E4E7;
    dw $0000                                                             ;A0E4E9;
    dd $00000000                                                         ;A0E4EB;
    dw EnemyTouch_Phantoon                                               ;A0E4EF;
    dw EnemyShot_Phantoon                                                ;A0E4F1;
    dw $0000                                                             ;A0E4F3;
    dl Tiles_Phantoon                                                    ;A0E4F5;
    db $05                                                               ;A0E4F8;
    dw EnemyDropChances_Phantoon_Body_Tentacles_Mouth                    ;A0E4F9;
    dw EnemyVulnerabilities_Phantoon_Body_Eye_Tentacles_Mouth            ;A0E4FB;
    dw $0000                                                             ;A0E4FD;

EnemyHeaders_PhantoonEye:
    dw $0400                                                             ;A0E4FF;
    dw Palette_Phantoon                                                  ;A0E501;
    dw $09C4,$0028,$0008,$0008                                           ;A0E503;
    db $A7,$00                                                           ;A0E50B;
    dw $0000,$0000                                                       ;A0E50D;
    dw InitAI_Phantoon_Eye_Tentacles_Mouth                               ;A0E511;
    dw $0001,$0000                                                       ;A0E513;
    dw RTL_A7804C                                                        ;A0E517;
    dw Common_GrappleAI_NoInteraction                                    ;A0E519;
    dw RTL_A7804C                                                        ;A0E51B;
    dw RTL_A7804C                                                        ;A0E51D;
    dw $0000                                                             ;A0E51F;
    dw $0000                                                             ;A0E521;
    dd $00000000                                                         ;A0E523;
    dw RTL_A0804C                                                        ;A0E527;
    dw $0000                                                             ;A0E529;
    dd $00000000                                                         ;A0E52B;
    dw RTL_A7804C                                                        ;A0E52F;
    dw RTL_A7804C                                                        ;A0E531;
    dw $0000                                                             ;A0E533;
    dl Tiles_Phantoon                                                    ;A0E535;
    db $05                                                               ;A0E538;
    dw EnemyDropChances_PhantoonEye                                      ;A0E539;
    dw EnemyVulnerabilities_Phantoon_Body_Eye_Tentacles_Mouth            ;A0E53B;
    dw $0000                                                             ;A0E53D;

EnemyHeaders_PhantoonTentacles:
    dw $0400                                                             ;A0E53F;
    dw Palette_Phantoon                                                  ;A0E541;
    dw $09C4,$0028,$0008,$0008                                           ;A0E543;
    db $A7,$00                                                           ;A0E54B;
    dw $0000,$0000                                                       ;A0E54D;
    dw InitAI_Phantoon_Eye_Tentacles_Mouth                               ;A0E551;
    dw $0001,$0000                                                       ;A0E553;
    dw RTL_A7E011                                                        ;A0E557;
    dw Common_GrappleAI_NoInteraction                                    ;A0E559;
    dw RTL_A7804C                                                        ;A0E55B;
    dw RTL_A7804C                                                        ;A0E55D;
    dw $0000                                                             ;A0E55F;
    dw $0000                                                             ;A0E561;
    dd $00000000                                                         ;A0E563;
    dw RTL_A0804C                                                        ;A0E567;
    dw $0000                                                             ;A0E569;
    dd $00000000                                                         ;A0E56B;
    dw RTL_A7804C                                                        ;A0E56F;
    dw RTL_A7804C                                                        ;A0E571;
    dw $0000                                                             ;A0E573;
    dl Tiles_Phantoon                                                    ;A0E575;
    db $05                                                               ;A0E578;
    dw EnemyDropChances_Phantoon_Body_Tentacles_Mouth                    ;A0E579;
    dw EnemyVulnerabilities_Phantoon_Body_Eye_Tentacles_Mouth            ;A0E57B;
    dw $0000                                                             ;A0E57D;

EnemyHeaders_PhantoonMouth:
    dw $0400                                                             ;A0E57F;
    dw Palette_Phantoon                                                  ;A0E581;
    dw $09C4,$0028,$0008,$0008                                           ;A0E583;
    db $A7,$00                                                           ;A0E58B;
    dw $0000,$0000                                                       ;A0E58D;
    dw InitAI_Phantoon_Eye_Tentacles_Mouth                               ;A0E591;
    dw $0001,$0000                                                       ;A0E593;
    dw RTL_A7E011                                                        ;A0E597;
    dw Common_GrappleAI_NoInteraction                                    ;A0E599;
    dw RTL_A7804C                                                        ;A0E59B;
    dw RTL_A7804C                                                        ;A0E59D;
    dw $0000                                                             ;A0E59F;
    dw $0000                                                             ;A0E5A1;
    dd $00000000                                                         ;A0E5A3;
    dw RTL_A0804C                                                        ;A0E5A7;
    dw $0000                                                             ;A0E5A9;
    dd $00000000                                                         ;A0E5AB;
    dw RTL_A7804C                                                        ;A0E5AF;
    dw RTL_A7804C                                                        ;A0E5B1;
    dw $0000                                                             ;A0E5B3;
    dl Tiles_Phantoon                                                    ;A0E5B5;
    db $05                                                               ;A0E5B8;
    dw EnemyDropChances_Phantoon_Body_Tentacles_Mouth                    ;A0E5B9;
    dw EnemyVulnerabilities_Phantoon_Body_Eye_Tentacles_Mouth            ;A0E5BB;
    dw $0000                                                             ;A0E5BD;

EnemyHeaders_Etecoon:
    dw $0600                                                             ;A0E5BF;
    dw Palette_Etecoon                                                   ;A0E5C1;
    dw $7FFF,$0000,$0006,$0007                                           ;A0E5C3;
    db $A7,$00                                                           ;A0E5CB;
    dw $0000,$0000                                                       ;A0E5CD;
    dw InitAI_Etecoon                                                    ;A0E5D1;
    dw $0001,$0000                                                       ;A0E5D3;
    dw MainAI_Etecoon                                                    ;A0E5D7;
    dw Common_GrappleAI_NoInteraction                                    ;A0E5D9;
    dw RTL_A7804C                                                        ;A0E5DB;
    dw Common_NormalEnemyFrozenAI                                        ;A0E5DD;
    dw $0000                                                             ;A0E5DF;
    dw $0000                                                             ;A0E5E1;
    dd $00000000                                                         ;A0E5E3;
    dw RTL_A0804C                                                        ;A0E5E7;
    dw $0000                                                             ;A0E5E9;
    dd $00000000                                                         ;A0E5EB;
    dw RTL_A7804C                                                        ;A0E5EF;
    dw RTL_A7804C                                                        ;A0E5F1;
    dw $0000                                                             ;A0E5F3;
    dl Tiles_Etecoon                                                     ;A0E5F5;
    db $05                                                               ;A0E5F8;
    dw EnemyDropChances_Etecoon_EtecoonEscape                            ;A0E5F9;
    dw $0000                                                             ;A0E5FB;
    dw $0000                                                             ;A0E5FD;

EnemyHeaders_Dachora:
    dw $0C00                                                             ;A0E5FF;
    dw Palette_Dachora                                                   ;A0E601;
    dw $7FFF,$0000,$0008,$0018                                           ;A0E603;
    db $A7,$00                                                           ;A0E60B;
    dw $0000,$0000                                                       ;A0E60D;
    dw InitAI_Dachora                                                    ;A0E611;
    dw $0001,$0000                                                       ;A0E613;
    dw MainAI_Dachora                                                    ;A0E617;
    dw Common_GrappleAI_NoInteraction                                    ;A0E619;
    dw RTL_A7804C                                                        ;A0E61B;
    dw Common_NormalEnemyFrozenAI                                        ;A0E61D;
    dw $0000                                                             ;A0E61F;
    dw $0000                                                             ;A0E621;
    dd $00000000                                                         ;A0E623;
    dw RTL_A0804C                                                        ;A0E627;
    dw $0000                                                             ;A0E629;
    dd $00000000                                                         ;A0E62B;
    dw RTL_A7804C                                                        ;A0E62F;
    dw RTL_A7804C                                                        ;A0E631;
    dw $0000                                                             ;A0E633;
    dl Tiles_Dachora                                                     ;A0E635;
    db $05                                                               ;A0E638;
    dw EnemyDropChances_Steam_Dachora_DachoraEscape                      ;A0E639;
    dw $0000                                                             ;A0E63B;
    dw $0000                                                             ;A0E63D;

EnemyHeaders_Evir:
    dw $0600                                                             ;A0E63F;
    dw Palette_Evir                                                      ;A0E641;
    dw $012C,$0064,$0010,$0014                                           ;A0E643;
    db $A8,$00                                                           ;A0E64B;
    dw $004A,$0000                                                       ;A0E64D;
    dw InitAI_Evir                                                       ;A0E651;
    dw $0003,$0000                                                       ;A0E653;
    dw MainAI_Evir                                                       ;A0E657;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0E659;
    dw RTL_A8804C                                                        ;A0E65B;
    dw Common_NormalEnemyFrozenAI                                        ;A0E65D;
    dw $0000                                                             ;A0E65F;
    dw $0004                                                             ;A0E661;
    dd $00000000                                                         ;A0E663;
    dw PowerBombReaction_Evir                                            ;A0E667;
    dw $0000                                                             ;A0E669;
    dd $00000000                                                         ;A0E66B;
    dw EnemyShot_Evir                                                    ;A0E66F;
    dw EnemyTouch_Evir                                                   ;A0E671;
    dw $0000                                                             ;A0E673;
    dl Tiles_Evir                                                        ;A0E675;
    db $05                                                               ;A0E678;
    dw EnemyDropChances_Evir_EvirProjectile                              ;A0E679;
    dw EnemyVulnerabilities_Evir                                         ;A0E67B;
    dw EnemyName_Evir                                                    ;A0E67D;

EnemyHeaders_EvirProjectile:
    dw $0600                                                             ;A0E67F;
    dw Palette_Evir                                                      ;A0E681;
    dw $012C,$0064,$0008,$0008                                           ;A0E683;
    db $A8,$00                                                           ;A0E68B;
    dw $0000,$0000                                                       ;A0E68D;
    dw InitAI_EvirProjectile                                             ;A0E691;
    dw $0001,$0000                                                       ;A0E693;
    dw MainAI_EvirProjectile                                             ;A0E697;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0E699;
    dw RTL_A8804C                                                        ;A0E69B;
    dw Common_NormalEnemyFrozenAI                                        ;A0E69D;
    dw $0000                                                             ;A0E69F;
    dw $0000                                                             ;A0E6A1;
    dd $00000000                                                         ;A0E6A3;
    dw RTL_A0804C                                                        ;A0E6A7;
    dw $0000                                                             ;A0E6A9;
    dd $00000000                                                         ;A0E6AB;
    dw Common_NormalEnemyTouchAI                                         ;A0E6AF;
    dw RTL_A8804C                                                        ;A0E6B1;
    dw $0000                                                             ;A0E6B3;
    dl Tiles_Evir                                                        ;A0E6B5;
    db $05                                                               ;A0E6B8;
    dw EnemyDropChances_Evir_EvirProjectile                              ;A0E6B9;
    dw EnemyVulnerabilities_EvirProjectile                               ;A0E6BB;
    dw $0000                                                             ;A0E6BD;

EnemyHeaders_Eye:
    dw $0400                                                             ;A0E6BF;
    dw Palette_Eye                                                       ;A0E6C1;
    dw $0014,$0000,$0008,$0008                                           ;A0E6C3;
    db $A8,$00                                                           ;A0E6CB;
    dw $0000,$0000                                                       ;A0E6CD;
    dw InitAI_Eye                                                        ;A0E6D1;
    dw $0002,$0000                                                       ;A0E6D3;
    dw MainAI_Eye                                                        ;A0E6D7;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0E6D9;
    dw RTL_A8804C                                                        ;A0E6DB;
    dw Common_NormalEnemyFrozenAI                                        ;A0E6DD;
    dw $0000                                                             ;A0E6DF;
    dw $0000                                                             ;A0E6E1;
    dd $00000000                                                         ;A0E6E3;
    dw $0000,$0000                                                       ;A0E6E7;
    dd $00000000                                                         ;A0E6EB;
    dw Common_NormalEnemyTouchAI                                         ;A0E6EF;
    dw RTL_A8804C                                                        ;A0E6F1;
    dw $0000                                                             ;A0E6F3;
    dl Tiles_Eye                                                         ;A0E6F5;
    db $05                                                               ;A0E6F8;
    dw EnemyDropChances_Eye                                              ;A0E6F9;
    dw EnemyVulnerabilities_Indestructible                               ;A0E6FB;
    dw EnemyName_Eye                                                     ;A0E6FD;

EnemyHeaders_Fune:
    dw $0800                                                             ;A0E6FF;
    dw Palette_Fune                                                      ;A0E701;
    dw $0014,$000A,$0010,$0010                                           ;A0E703;
    db $A8,$00                                                           ;A0E70B;
    dw $0000,$0000                                                       ;A0E70D;
    dw InitAI_Fune_Namihe                                                ;A0E711;
    dw $0001,$0000                                                       ;A0E713;
    dw MainAI_Fune_Namihe                                                ;A0E717;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0E719;
    dw RTL_A8804C                                                        ;A0E71B;
    dw Common_NormalEnemyFrozenAI                                        ;A0E71D;
    dw $0000                                                             ;A0E71F;
    dw $0002                                                             ;A0E721;
    dd $00000000                                                         ;A0E723;
    dw $0000,$0000                                                       ;A0E727;
    dd $00000000                                                         ;A0E72B;
    dw Common_NormalEnemyTouchAI                                         ;A0E72F;
    dw Common_NormalEnemyShotAI                                          ;A0E731;
    dw $0000                                                             ;A0E733;
    dl Tiles_Fune_Namihe                                                 ;A0E735;
    db $05                                                               ;A0E738;
    dw EnemyDropChances_Fune                                             ;A0E739;
    dw EnemyVulnerabilities_Fune_Magdollite                              ;A0E73B;
    dw EnemyName_Fune                                                    ;A0E73D;

EnemyHeaders_Namihe:
    dw $0800                                                             ;A0E73F;
    dw Palette_Namihe                                                    ;A0E741;
    dw $0014,$000A,$0010,$0010                                           ;A0E743;
    db $A8,$00                                                           ;A0E74B;
    dw $0000,$0000                                                       ;A0E74D;
    dw InitAI_Fune_Namihe                                                ;A0E751;
    dw $0003,$0000                                                       ;A0E753;
    dw MainAI_Fune_Namihe                                                ;A0E757;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0E759;
    dw RTL_A8804C                                                        ;A0E75B;
    dw Common_NormalEnemyFrozenAI                                        ;A0E75D;
    dw $0000                                                             ;A0E75F;
    dw $0002                                                             ;A0E761;
    dd $00000000                                                         ;A0E763;
    dw $0000,$0000                                                       ;A0E767;
    dd $00000000                                                         ;A0E76B;
    dw Common_NormalEnemyTouchAI                                         ;A0E76F;
    dw Common_NormalEnemyShotAI                                          ;A0E771;
    dw $0000                                                             ;A0E773;
    dl Tiles_Fune_Namihe                                                 ;A0E775;
    db $05                                                               ;A0E778;
    dw EnemyDropChances_Namihe                                           ;A0E779;
    dw EnemyVulnerabilities_Namihe                                       ;A0E77B;
    dw EnemyName_Namihe                                                  ;A0E77D;

EnemyHeaders_Coven:
    dw $0400                                                             ;A0E77F;
    dw Palette_Coven                                                     ;A0E781;
    dw $012C,$003C,$0010,$0010                                           ;A0E783;
    db $A8,$00                                                           ;A0E78B;
    dw $0051,$0000                                                       ;A0E78D;
    dw InitAI_Coven                                                      ;A0E791;
    dw $0001,$0000                                                       ;A0E793;
    dw MainAI_Coven                                                      ;A0E797;
    dw Common_GrappleAI_NoInteraction                                    ;A0E799;
    dw RTL_A8804C                                                        ;A0E79B;
    dw Common_NormalEnemyFrozenAI                                        ;A0E79D;
    dw $0000                                                             ;A0E79F;
    dw $0002                                                             ;A0E7A1;
    dd $00000000                                                         ;A0E7A3;
    dw $0000,$0000                                                       ;A0E7A7;
    dd $00000000                                                         ;A0E7AB;
    dw Common_NormalEnemyTouchAI                                         ;A0E7AF;
    dw Common_NormalEnemyShotAI                                          ;A0E7B1;
    dw $0000                                                             ;A0E7B3;
    dl Tiles_Coven                                                       ;A0E7B5;
    db $05                                                               ;A0E7B8;
    dw EnemyDropChances_Coven                                            ;A0E7B9;
    dw EnemyVulnerabilities_Default                                      ;A0E7BB;
    dw EnemyName_Coven                                                   ;A0E7BD;

EnemyHeaders_YappingMaw:
    dw $0400                                                             ;A0E7BF;
    dw Palette_YappingMaw                                                ;A0E7C1;
    dw $0014,$001E,$0008,$0008                                           ;A0E7C3;
    db $A8,$00                                                           ;A0E7CB;
    dw $003E,$0000                                                       ;A0E7CD;
    dw InitAI_YappingMaw                                                 ;A0E7D1;
    dw $0001,$0000                                                       ;A0E7D3;
    dw MainAI_YappingMaw                                                 ;A0E7D7;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0E7D9;
    dw RTL_A8804C                                                        ;A0E7DB;
    dw FrozenAI_YappingMaw                                               ;A0E7DD;
    dw $0000                                                             ;A0E7DF;
    dw $0004                                                             ;A0E7E1;
    dd $00000000                                                         ;A0E7E3;
    dw $0000,$0000                                                       ;A0E7E7;
    dd $00000000                                                         ;A0E7EB;
    dw EnemyTouch_YappingMaw                                             ;A0E7EF;
    dw EnemyShot_YappingMaw                                              ;A0E7F1;
    dw $0000                                                             ;A0E7F3;
    dl Tiles_YappingMaw                                                  ;A0E7F5;
    db $05                                                               ;A0E7F8;
    dw EnemyDropChances_YappingMaw                                       ;A0E7F9;
    dw EnemyVulnerabilities_YappingMaw                                   ;A0E7FB;
    dw EnemyName_YappingMaw                                              ;A0E7FD;

EnemyHeaders_Kago:
    dw $0800                                                             ;A0E7FF;
    dw Palette_Kago                                                      ;A0E801;
    dw $0640,$0000,$0010,$0010                                           ;A0E803;
    db $A8,$00                                                           ;A0E80B;
    dw $0000,$0000                                                       ;A0E80D;
    dw InitAI_Kago                                                       ;A0E811;
    dw $0009,$0000                                                       ;A0E813;
    dw MainAI_Kago                                                       ;A0E817;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0E819;
    dw RTL_A8804C                                                        ;A0E81B;
    dw Common_NormalEnemyFrozenAI                                        ;A0E81D;
    dw $0000                                                             ;A0E81F;
    dw $0004                                                             ;A0E821;
    dd $00000000                                                         ;A0E823;
    dw $0000,$0000                                                       ;A0E827;
    dd $00000000                                                         ;A0E82B;
    dw Common_NormalEnemyTouchAI                                         ;A0E82F;
    dw EnemyShot_Kago                                                    ;A0E831;
    dw $0000                                                             ;A0E833;
    dl Tiles_Kago                                                        ;A0E835;
    db $05                                                               ;A0E838;
    dw EnemyDropChances_Kago                                             ;A0E839;
    dw EnemyVulnerabilities_Kago                                         ;A0E83B;
    dw EnemyName_Kago                                                    ;A0E83D;

EnemyHeaders_Magdollite:
    dw $0600                                                             ;A0E83F;
    dw Palette_Magdollite                                                ;A0E841;
    dw $0014,$0028,$0008,$0008                                           ;A0E843;
    db $A8,$00                                                           ;A0E84B;
    dw $0000,$0000                                                       ;A0E84D;
    dw InitAI_Magdollite                                                 ;A0E851;
    dw $0003,$0000                                                       ;A0E853;
    dw MainAI_Magdollite                                                 ;A0E857;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0E859;
    dw RTL_A8804C                                                        ;A0E85B;
    dw Common_NormalEnemyFrozenAI                                        ;A0E85D;
    dw $0000                                                             ;A0E85F;
    dw $0004                                                             ;A0E861;
    dd $00000000                                                         ;A0E863;
    dw PowerBombReaction_Magdollite                                      ;A0E867;
    dw $0000                                                             ;A0E869;
    dd $00000000                                                         ;A0E86B;
    dw EnemyTouch_Magdollite                                             ;A0E86F;
    dw EnemyShot_Magdollite                                              ;A0E871;
    dw $0000                                                             ;A0E873;
    dl Tiles_Magdollite                                                  ;A0E875;
    db $05                                                               ;A0E878;
    dw EnemyDropChances_Magdollite                                       ;A0E879;
    dw EnemyVulnerabilities_Fune_Magdollite                              ;A0E87B;
    dw EnemyName_Magdollite                                              ;A0E87D;

EnemyHeaders_Beetom:
    dw $0600                                                             ;A0E87F;
    dw Palette_Beetom                                                    ;A0E881;
    dw $003C,$000A,$0008,$0008                                           ;A0E883;
    db $A8,$00                                                           ;A0E88B;
    dw $0055,$0000                                                       ;A0E88D;
    dw InitAI_Beetom                                                     ;A0E891;
    dw $0001,$0000                                                       ;A0E893;
    dw MainAI_Beetom                                                     ;A0E897;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0E899;
    dw RTL_A8804C                                                        ;A0E89B;
    dw Common_NormalEnemyFrozenAI                                        ;A0E89D;
    dw $0000                                                             ;A0E89F;
    dw $0000                                                             ;A0E8A1;
    dd $00000000                                                         ;A0E8A3;
    dw $0000,$0000                                                       ;A0E8A7;
    dd $00000000                                                         ;A0E8AB;
    dw EnemyTouch_Beetom                                                 ;A0E8AF;
    dw EnemyShot_Beetom                                                  ;A0E8B1;
    dw $0000                                                             ;A0E8B3;
    dl Tiles_Beetom                                                      ;A0E8B5;
    db $05                                                               ;A0E8B8;
    dw EnemyDropChances_Beetom                                           ;A0E8B9;
    dw EnemyVulnerabilities_Beetom                                       ;A0E8BB;
    dw EnemyName_Beetom                                                  ;A0E8BD;

EnemyHeaders_Powamp:
    dw $0400                                                             ;A0E8BF;
    dw Palette_Powamp                                                    ;A0E8C1;
    dw $000A,$0064,$0008,$0010                                           ;A0E8C3;
    db $A8,$00                                                           ;A0E8CB;
    dw $006A,$0000                                                       ;A0E8CD;
    dw InitAI_Powamp                                                     ;A0E8D1;
    dw $0002,$0000                                                       ;A0E8D3;
    dw MainAI_Powamp                                                     ;A0E8D7;
    dw Common_GrappleAI_SamusLatchesOn_NoInvincibility                   ;A0E8D9;
    dw RTL_A8804C                                                        ;A0E8DB;
    dw Common_NormalEnemyFrozenAI                                        ;A0E8DD;
    dw $0000                                                             ;A0E8DF;
    dw $0002                                                             ;A0E8E1;
    dd $00000000                                                         ;A0E8E3;
    dw PowerBombReaction_Powamp                                          ;A0E8E7;
    dw $0000                                                             ;A0E8E9;
    dd $00000000                                                         ;A0E8EB;
    dw EnemyTouch_Powamp                                                 ;A0E8EF;
    dw EnemyShot_Powamp                                                  ;A0E8F1;
    dw $0000                                                             ;A0E8F3;
    dl Tiles_Powamp                                                      ;A0E8F5;
    db $05                                                               ;A0E8F8;
    dw EnemyDropChances_Powamp                                           ;A0E8F9;
    dw EnemyVulnerabilities_Powamp                                       ;A0E8FB;
    dw EnemyName_Powamp                                                  ;A0E8FD;

EnemyHeaders_Robot:
    dw $0C00                                                             ;A0E8FF;
    dw Palette_Robot                                                     ;A0E901;
    dw $0320,$0050,$000C,$0020                                           ;A0E903;
    db $A8,$00                                                           ;A0E90B;
    dw $0068,$0000                                                       ;A0E90D;
    dw InitAI_Robot                                                      ;A0E911;
    dw $0001,$0000                                                       ;A0E913;
    dw MainAI_Robot                                                      ;A0E917;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0E919;
    dw RTL_A8804C                                                        ;A0E91B;
    dw Common_NormalEnemyFrozenAI                                        ;A0E91D;
    dw $0000                                                             ;A0E91F;
    dw $0002                                                             ;A0E921;
    dd $00000000                                                         ;A0E923;
    dw $0000,$0000                                                       ;A0E927;
    dd $00000000                                                         ;A0E92B;
    dw EnemyTouch_Robot                                                  ;A0E92F;
    dw EnemyShot_Robot                                                   ;A0E931;
    dw $0000                                                             ;A0E933;
    dl Tiles_Robot                                                       ;A0E935;
    db $05                                                               ;A0E938;
    dw EnemyDropChances_Robot                                            ;A0E939;
    dw EnemyVulnerabilities_Indestructible                               ;A0E93B;
    dw EnemyName_Robot                                                   ;A0E93D;

EnemyHeaders_RobotNoPower:
    dw $0C00                                                             ;A0E93F;
    dw Palette_Robot                                                     ;A0E941;
    dw $01C2,$0050,$000C,$0020                                           ;A0E943;
    db $A8,$00                                                           ;A0E94B;
    dw $0068,$0000                                                       ;A0E94D;
    dw InitAI_RobotNoPower                                               ;A0E951;
    dw $0001,$0000                                                       ;A0E953;
    dw RTL_A8CC66                                                        ;A0E957;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0E959;
    dw RTL_A8804C                                                        ;A0E95B;
    dw Common_NormalEnemyFrozenAI                                        ;A0E95D;
    dw $0000                                                             ;A0E95F;
    dw $0000                                                             ;A0E961;
    dd $00000000                                                         ;A0E963;
    dw $0000,$0000                                                       ;A0E967;
    dd $00000000                                                         ;A0E96B;
    dw EnemyTouch_Robot                                                  ;A0E96F;
    dw EnemyShot_RobotNoPower                                            ;A0E971;
    dw $0000                                                             ;A0E973;
    dl Tiles_Robot                                                       ;A0E975;
    db $05                                                               ;A0E978;
    dw EnemyDropChances_RobotNoPower                                     ;A0E979;
    dw EnemyVulnerabilities_Indestructible                               ;A0E97B;
    dw EnemyName_RobotNoPower                                            ;A0E97D;

EnemyHeaders_Bull:
    dw $0600                                                             ;A0E97F;
    dw Palette_Bull                                                      ;A0E981;
    dw $0064,$000A,$0008,$0008                                           ;A0E983;
    db $A8,$00                                                           ;A0E98B;
    dw $0000,$0000                                                       ;A0E98D;
    dw InitAI_Bull                                                       ;A0E991;
    dw $0001,$0000                                                       ;A0E993;
    dw MainAI_Bull                                                       ;A0E997;
    dw Common_GrappleAI_KillEnemy                                        ;A0E999;
    dw RTL_A8804C                                                        ;A0E99B;
    dw Common_NormalEnemyFrozenAI                                        ;A0E99D;
    dw $0000                                                             ;A0E99F;
    dw $0002                                                             ;A0E9A1;
    dd $00000000                                                         ;A0E9A3;
    dw $0000,$0000                                                       ;A0E9A7;
    dd $00000000                                                         ;A0E9AB;
    dw Common_NormalEnemyTouchAI                                         ;A0E9AF;
    dw EnemyShot_Bull                                                    ;A0E9B1;
    dw $0000                                                             ;A0E9B3;
    dl Tiles_Bull                                                        ;A0E9B5;
    db $05                                                               ;A0E9B8;
    dw EnemyDropChances_Bull                                             ;A0E9B9;
    dw EnemyVulnerabilities_Bull                                         ;A0E9BB;
    dw EnemyName_Bull                                                    ;A0E9BD;

EnemyHeaders_Alcoon:
    dw $0800                                                             ;A0E9BF;
    dw Palette_Alcoon                                                    ;A0E9C1;
    dw $00C8,$0032,$0008,$0018                                           ;A0E9C3;
    db $A8,$00                                                           ;A0E9CB;
    dw $005F,$0000                                                       ;A0E9CD;
    dw InitAI_Alcoon                                                     ;A0E9D1;
    dw $0001,$0000                                                       ;A0E9D3;
    dw MainAI_Alcoon                                                     ;A0E9D7;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0E9D9;
    dw RTL_A8804C                                                        ;A0E9DB;
    dw Common_NormalEnemyFrozenAI                                        ;A0E9DD;
    dw $0000                                                             ;A0E9DF;
    dw $0004                                                             ;A0E9E1;
    dd $00000000                                                         ;A0E9E3;
    dw $0000,$0000                                                       ;A0E9E7;
    dd $00000000                                                         ;A0E9EB;
    dw Common_NormalEnemyTouchAI                                         ;A0E9EF;
    dw Common_NormalEnemyShotAI                                          ;A0E9F1;
    dw $0000                                                             ;A0E9F3;
    dl Tiles_Alcoon                                                      ;A0E9F5;
    db $05                                                               ;A0E9F8;
    dw EnemyDropChances_Alcoon                                           ;A0E9F9;
    dw EnemyVulnerabilities_Alcoon                                       ;A0E9FB;
    dw EnemyName_Alcoon                                                  ;A0E9FD;

EnemyHeaders_Atomic:
    dw $0400                                                             ;A0E9FF;
    dw Palette_Atomic                                                    ;A0EA01;
    dw $00FA,$0028,$0008,$0008                                           ;A0EA03;
    db $A8,$00                                                           ;A0EA0B;
    dw $003E,$0000                                                       ;A0EA0D;
    dw InitAI_Atomic                                                     ;A0EA11;
    dw $0001,$0000                                                       ;A0EA13;
    dw MainAI_Atomic                                                     ;A0EA17;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0EA19;
    dw RTL_A8804C                                                        ;A0EA1B;
    dw Common_NormalEnemyFrozenAI                                        ;A0EA1D;
    dw $0000                                                             ;A0EA1F;
    dw $0002                                                             ;A0EA21;
    dd $00000000                                                         ;A0EA23;
    dw $0000,$0000                                                       ;A0EA27;
    dd $00000000                                                         ;A0EA2B;
    dw Common_NormalEnemyTouchAI                                         ;A0EA2F;
    dw Common_NormalEnemyShotAI                                          ;A0EA31;
    dw $0000                                                             ;A0EA33;
    dl Tiles_Atomic                                                      ;A0EA35;
    db $05                                                               ;A0EA38;
    dw EnemyDropChances_Atomic                                           ;A0EA39;
    dw EnemyVulnerabilities_Default                                      ;A0EA3B;
    dw EnemyName_Atomic                                                  ;A0EA3D;

EnemyHeaders_Spark:
    dw $0200                                                             ;A0EA3F;
    dw Palette_Spark                                                     ;A0EA41;
    dw $0050,$001E,$0008,$0008                                           ;A0EA43;
    db $A8,$00                                                           ;A0EA4B;
    dw $0000,$0000                                                       ;A0EA4D;
    dw InitAI_Spark                                                      ;A0EA51;
    dw $0001,$0000                                                       ;A0EA53;
    dw MainAI_Spark                                                      ;A0EA57;
    dw Common_GrappleAI_HurtSamus                                        ;A0EA59;
    dw RTL_A8804C                                                        ;A0EA5B;
    dw Common_NormalEnemyFrozenAI                                        ;A0EA5D;
    dw $0000                                                             ;A0EA5F;
    dw $0000                                                             ;A0EA61;
    dd $00000000                                                         ;A0EA63;
    dw $0000,$0000                                                       ;A0EA67;
    dd $00000000                                                         ;A0EA6B;
    dw Common_NormalEnemyTouchAI                                         ;A0EA6F;
    dw EnemyShot_Spark                                                   ;A0EA71;
    dw $0000                                                             ;A0EA73;
    dl Tiles_Spark                                                       ;A0EA75;
    db $05                                                               ;A0EA78;
    dw EnemyDropChances_Spark                                            ;A0EA79;
    dw EnemyVulnerabilities_Indestructible                               ;A0EA7B;
    dw EnemyName_Spark                                                   ;A0EA7D;

EnemyHeaders_FaceBlock:
    dw $0200                                                             ;A0EA7F;
    dw Palette_FaceBlock                                                 ;A0EA81;
    dw $0014,$0000,$0008,$0008                                           ;A0EA83;
    db $A8,$00                                                           ;A0EA8B;
    dw $0000,$0000                                                       ;A0EA8D;
    dw InitAI_FaceBlock                                                  ;A0EA91;
    dw $0001,$0000                                                       ;A0EA93;
    dw MainAI_FaceBlock                                                  ;A0EA97;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0EA99;
    dw RTL_A8804C                                                        ;A0EA9B;
    dw Common_NormalEnemyFrozenAI                                        ;A0EA9D;
    dw $0000                                                             ;A0EA9F;
    dw $0000                                                             ;A0EAA1;
    dd $00000000                                                         ;A0EAA3;
    dw $0000,$0000                                                       ;A0EAA7;
    dd $00000000                                                         ;A0EAAB;
    dw RTL_A8804C                                                        ;A0EAAF;
    dw EnemyShot_FaceBlock                                               ;A0EAB1;
    dw $0000                                                             ;A0EAB3;
    dl Tiles_FaceBlock                                                   ;A0EAB5;
    db $02                                                               ;A0EAB8;
    dw EnemyDropChances_FaceBlock                                        ;A0EAB9;
    dw EnemyVulnerabilities_Indestructible                               ;A0EABB;
    dw EnemyName_FaceBlock                                               ;A0EABD;

EnemyHeaders_KihunterGreen:
    dw $1000                                                             ;A0EABF;
    dw Palette_KihunterGreen                                             ;A0EAC1;
    dw $003C,$0014,$0008,$0012                                           ;A0EAC3;
    db $A8,$00                                                           ;A0EACB;
    dw $0066,$0000                                                       ;A0EACD;
    dw InitAI_Kihunter                                                   ;A0EAD1;
    dw $0002,$0000                                                       ;A0EAD3;
    dw MainAI_Kihunter                                                   ;A0EAD7;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0EAD9;
    dw RTL_A8804C                                                        ;A0EADB;
    dw Common_NormalEnemyFrozenAI                                        ;A0EADD;
    dw $0000                                                             ;A0EADF;
    dw $0004                                                             ;A0EAE1;
    dd $00000000                                                         ;A0EAE3;
    dw $0000,$0000                                                       ;A0EAE7;
    dd $00000000                                                         ;A0EAEB;
    dw Common_NormalEnemyTouchAI                                         ;A0EAEF;
    dw EnemyShot_Kihunter                                                ;A0EAF1;
    dw $0000                                                             ;A0EAF3;
    dl Tiles_Kihunter                                                    ;A0EAF5;
    db $05                                                               ;A0EAF8;
    dw EnemyDropChances_KihunterGreen_KihunterGreenWings                 ;A0EAF9;
    dw EnemyVulnerabilities_KihunterGreen_KihunterGreenWings             ;A0EAFB;
    dw EnemyName_KihunterGreen                                           ;A0EAFD;

EnemyHeaders_KihunterGreenWings:
    dw $0200                                                             ;A0EAFF;
    dw Palette_KihunterGreen                                             ;A0EB01;
    dw $003C,$0014,$000A,$000A                                           ;A0EB03;
    db $A8,$00                                                           ;A0EB0B;
    dw $0066,$0000                                                       ;A0EB0D;
    dw InitAI_KihunterWings                                              ;A0EB11;
    dw $0001,$0000                                                       ;A0EB13;
    dw MainAI_KihunterWings                                              ;A0EB17;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0EB19;
    dw RTL_A8804C                                                        ;A0EB1B;
    dw Common_NormalEnemyFrozenAI                                        ;A0EB1D;
    dw $0000                                                             ;A0EB1F;
    dw $0004                                                             ;A0EB21;
    dd $00000000                                                         ;A0EB23;
    dw RTL_A0804C                                                        ;A0EB27;
    dw $0000                                                             ;A0EB29;
    dd $00000000                                                         ;A0EB2B;
    dw RTL_A8804C                                                        ;A0EB2F;
    dw RTL_A8804C                                                        ;A0EB31;
    dw $0000                                                             ;A0EB33;
    dl Tiles_Kihunter                                                    ;A0EB35;
    db $05                                                               ;A0EB38;
    dw EnemyDropChances_KihunterGreen_KihunterGreenWings                 ;A0EB39;
    dw EnemyVulnerabilities_KihunterGreen_KihunterGreenWings             ;A0EB3B;
    dw $0000                                                             ;A0EB3D;

EnemyHeaders_KihunterYellow:
    dw $1000                                                             ;A0EB3F;
    dw Palette_KihunterYellow                                            ;A0EB41;
    dw $0168,$003C,$0008,$0012                                           ;A0EB43;
    db $A8,$00                                                           ;A0EB4B;
    dw $0066,$0000                                                       ;A0EB4D;
    dw InitAI_Kihunter                                                   ;A0EB51;
    dw $0002,$0000                                                       ;A0EB53;
    dw MainAI_Kihunter                                                   ;A0EB57;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0EB59;
    dw RTL_A8804C                                                        ;A0EB5B;
    dw Common_NormalEnemyFrozenAI                                        ;A0EB5D;
    dw $0000                                                             ;A0EB5F;
    dw $0004                                                             ;A0EB61;
    dd $00000000                                                         ;A0EB63;
    dw $0000,$0000                                                       ;A0EB67;
    dd $00000000                                                         ;A0EB6B;
    dw Common_NormalEnemyTouchAI                                         ;A0EB6F;
    dw EnemyShot_Kihunter                                                ;A0EB71;
    dw $0000                                                             ;A0EB73;
    dl Tiles_Kihunter                                                    ;A0EB75;
    db $05                                                               ;A0EB78;
    dw EnemyDropChances_KihunterYellow_KihunterYellowWings               ;A0EB79;
    dw EnemyVulnerabilities_KihunterYellow_KihunterYellowWings           ;A0EB7B;
    dw EnemyName_KihunterYellow                                          ;A0EB7D;

EnemyHeaders_KihunterYellowWings:
    dw $0200                                                             ;A0EB7F;
    dw Palette_KihunterYellow                                            ;A0EB81;
    dw $0168,$003C,$000A,$000A                                           ;A0EB83;
    db $A8,$00                                                           ;A0EB8B;
    dw $0066,$0000                                                       ;A0EB8D;
    dw InitAI_KihunterWings                                              ;A0EB91;
    dw $0001,$0000                                                       ;A0EB93;
    dw MainAI_KihunterWings                                              ;A0EB97;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0EB99;
    dw RTL_A8804C                                                        ;A0EB9B;
    dw Common_NormalEnemyFrozenAI                                        ;A0EB9D;
    dw $0000                                                             ;A0EB9F;
    dw $0004                                                             ;A0EBA1;
    dd $00000000                                                         ;A0EBA3;
    dw RTL_A0804C                                                        ;A0EBA7;
    dw $0000                                                             ;A0EBA9;
    dd $00000000                                                         ;A0EBAB;
    dw RTL_A8804C                                                        ;A0EBAF;
    dw RTL_A8804C                                                        ;A0EBB1;
    dw $0000                                                             ;A0EBB3;
    dl Tiles_Kihunter                                                    ;A0EBB5;
    db $05                                                               ;A0EBB8;
    dw EnemyDropChances_KihunterYellow_KihunterYellowWings               ;A0EBB9;
    dw EnemyVulnerabilities_KihunterYellow_KihunterYellowWings           ;A0EBBB;
    dw $0000                                                             ;A0EBBD;

EnemyHeaders_KihunterRed:
    dw $1000                                                             ;A0EBBF;
    dw Palette_KihunterRed                                               ;A0EBC1;
    dw $0708,$00C8,$0008,$0012                                           ;A0EBC3;
    db $A8,$00                                                           ;A0EBCB;
    dw $0066,$0000                                                       ;A0EBCD;
    dw InitAI_Kihunter                                                   ;A0EBD1;
    dw $0002,$0000                                                       ;A0EBD3;
    dw MainAI_Kihunter                                                   ;A0EBD7;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0EBD9;
    dw RTL_A8804C                                                        ;A0EBDB;
    dw Common_NormalEnemyFrozenAI                                        ;A0EBDD;
    dw $0000                                                             ;A0EBDF;
    dw $0004                                                             ;A0EBE1;
    dd $00000000                                                         ;A0EBE3;
    dw $0000,$0000                                                       ;A0EBE7;
    dd $00000000                                                         ;A0EBEB;
    dw Common_NormalEnemyTouchAI                                         ;A0EBEF;
    dw EnemyShot_Kihunter                                                ;A0EBF1;
    dw $0000                                                             ;A0EBF3;
    dl Tiles_Kihunter                                                    ;A0EBF5;
    db $05                                                               ;A0EBF8;
    dw EnemyDropChances_KihunterRed_KihunterRedWings                     ;A0EBF9;
    dw EnemyVulnerabilities_KihunterRed_KihunterRedWings                 ;A0EBFB;
    dw EnemyName_KihunterRed                                             ;A0EBFD;

EnemyHeaders_KihunterRedWings:
    dw $0200                                                             ;A0EBFF;
    dw Palette_KihunterRed                                               ;A0EC01;
    dw $0708,$00C8,$000A,$000A                                           ;A0EC03;
    db $A8,$00                                                           ;A0EC0B;
    dw $0066,$0000                                                       ;A0EC0D;
    dw InitAI_KihunterWings                                              ;A0EC11;
    dw $0001,$0000                                                       ;A0EC13;
    dw MainAI_KihunterWings                                              ;A0EC17;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0EC19;
    dw RTL_A8804C                                                        ;A0EC1B;
    dw Common_NormalEnemyFrozenAI                                        ;A0EC1D;
    dw $0000                                                             ;A0EC1F;
    dw $0004                                                             ;A0EC21;
    dd $00000000                                                         ;A0EC23;
    dw RTL_A0804C                                                        ;A0EC27;
    dw $0000                                                             ;A0EC29;
    dd $00000000                                                         ;A0EC2B;
    dw RTL_A8804C                                                        ;A0EC2F;
    dw RTL_A8804C                                                        ;A0EC31;
    dw $0000                                                             ;A0EC33;
    dl Tiles_Kihunter                                                    ;A0EC35;
    db $05                                                               ;A0EC38;
    dw EnemyDropChances_KihunterRed_KihunterRedWings                     ;A0EC39;
    dw EnemyVulnerabilities_KihunterRed_KihunterRedWings                 ;A0EC3B;
    dw $0000                                                             ;A0EC3D;

EnemyHeaders_MotherBrainHead:
    dw $1000                                                             ;A0EC3F;
    dw Palette_MotherBrain                                               ;A0EC41;
    dw $4650,$0078,$0010,$0010                                           ;A0EC43;
    db $A9,$00                                                           ;A0EC4B;
    dw $0000,$000A                                                       ;A0EC4D;
    dw InitAI_MotherBrainHead                                            ;A0EC51;
    dw $0001,$0000                                                       ;A0EC53;
    dw MainAI_HurtAI_MotherBrainHead                                     ;A0EC57;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0EC59;
    dw MainAI_HurtAI_MotherBrainHead                                     ;A0EC5B;
    dw Common_NormalEnemyFrozenAI                                        ;A0EC5D;
    dw $0000                                                             ;A0EC5F;
    dw $0000                                                             ;A0EC61;
    dd $00000000                                                         ;A0EC63;
    dw PowerBombReaction_MotherBrain                                     ;A0EC67;
    dw $0000                                                             ;A0EC69;
    dd $00000000                                                         ;A0EC6B;
    dw EnemyTouch_MotherBrainHead                                        ;A0EC6F;
    dw EnemyShot_MotherBrainHead                                         ;A0EC71;
    dw $0000                                                             ;A0EC73;
    dl Tiles_MotherBrainHead                                             ;A0EC75;
    db $05                                                               ;A0EC78;
    dw EnemyDropChances_MotherBrainHead                                  ;A0EC79;
    dw EnemyVulnerabilities_MotherBrainHead                              ;A0EC7B;
    dw $0000                                                             ;A0EC7D;

EnemyHeaders_MotherBrainBody:
    dw $8600                                                             ;A0EC7F;
    dw Palette_MotherBrain                                               ;A0EC81;
    dw $4650,$0078,$0008,$0008                                           ;A0EC83;
    db $A9,$00                                                           ;A0EC8B;
    dw $0000,$0000                                                       ;A0EC8D;
    dw InitAI_MotherBrainBody                                            ;A0EC91;
    dw $0001,$0000                                                       ;A0EC93;
    dw MainAI_HurtAI_MotherBrainBody                                     ;A0EC97;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0EC99;
    dw MainAI_HurtAI_MotherBrainBody                                     ;A0EC9B;
    dw Common_NormalEnemyFrozenAI                                        ;A0EC9D;
    dw $0000                                                             ;A0EC9F;
    dw $0000                                                             ;A0ECA1;
    dd $00000000                                                         ;A0ECA3;
    dw PowerBombReaction_MotherBrain                                     ;A0ECA7;
    dw $0000                                                             ;A0ECA9;
    dd $00000000                                                         ;A0ECAB;
    dw RTL_A9B5C5                                                        ;A0ECAF;
    dw EnemyShot_MotherBrainBody                                         ;A0ECB1;
    dw $0000                                                             ;A0ECB3;
    dl Tiles_MotherBrainBody                                             ;A0ECB5;
    db $05                                                               ;A0ECB8;
    dw EnemyDropChances_MotherBrainBody_BombTorizo                       ;A0ECB9;
    dw EnemyVulnerabilities_MotherBrainBody                              ;A0ECBB;
    dw $0000                                                             ;A0ECBD;

EnemyHeaders_BabyMetroidCutscene:
    dw $0000                                                             ;A0ECBF;
    dw Palette_BabyMetroid                                               ;A0ECC1;
    dw $0C80,$0028,$0024,$0024                                           ;A0ECC3;
    db $A9,$00                                                           ;A0ECCB;
    dw $0000,$0000                                                       ;A0ECCD;
    dw InitAI_BabyMetroidCutscene                                        ;A0ECD1;
    dw $0001,$0000                                                       ;A0ECD3;
    dw MainAI_BabyMetroidCutscene                                        ;A0ECD7;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0ECD9;
    dw RTL_A9804C                                                        ;A0ECDB;
    dw Common_NormalEnemyFrozenAI                                        ;A0ECDD;
    dw $0000                                                             ;A0ECDF;
    dw $0000                                                             ;A0ECE1;
    dd $00000000                                                         ;A0ECE3;
    dw $0000,$0000                                                       ;A0ECE7;
    dd $00000000                                                         ;A0ECEB;
    dw EnemyTouch_BabyMetroidCutscene                                    ;A0ECEF;
    dw RTL_A9804C                                                        ;A0ECF1;
    dw $0000                                                             ;A0ECF3;
    dl Tiles_BabyMetroid                                                 ;A0ECF5;
    db $02                                                               ;A0ECF8;
    dw EnemyDropChances_Shutter_Kamer_BabyMetroidCutscene                ;A0ECF9;
    dw EnemyVulnerabilities_Default                                      ;A0ECFB;
    dw $0000                                                             ;A0ECFD;

EnemyHeaders_MotherBrainTubes:
    dw $0000                                                             ;A0ECFF;
    dw Palette_MotherBrain                                               ;A0ED01;
    dw $03E8,$0000,$0000,$0000                                           ;A0ED03;
    db $A9,$00                                                           ;A0ED0B;
    dw $0000,$0000                                                       ;A0ED0D;
    dw InitAI_MotherBrainTubes                                           ;A0ED11;
    dw $0001,$0000                                                       ;A0ED13;
    dw MainAI_MotherBrainTubes                                           ;A0ED17;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0ED19;
    dw RTL_A9804C                                                        ;A0ED1B;
    dw Common_NormalEnemyFrozenAI                                        ;A0ED1D;
    dw $0000                                                             ;A0ED1F;
    dw $0000                                                             ;A0ED21;
    dd $00000000                                                         ;A0ED23;
    dw $0000,$0000                                                       ;A0ED27;
    dd $00000000                                                         ;A0ED2B;
    dw RTL_A9804C                                                        ;A0ED2F;
    dw RTL_A9804C                                                        ;A0ED31;
    dw $0000                                                             ;A0ED33;
    dl Tiles_MotherBrainHead                                             ;A0ED35;
    db $05                                                               ;A0ED38;
    dw $0000                                                             ;A0ED39;
    dw EnemyVulnerabilities_Default                                      ;A0ED3B;
    dw $0000                                                             ;A0ED3D;

EnemyHeaders_CorpseTorizo:
    dw $1800                                                             ;A0ED3F;
    dw Palette_CorpseTorizo                                              ;A0ED41;
    dw $03E8,$0000,$0010,$0028                                           ;A0ED43;
    db $A9,$00                                                           ;A0ED4B;
    dw $0000,$0000                                                       ;A0ED4D;
    dw InitAI_CorpseTorizo                                               ;A0ED51;
    dw $0001,$0000                                                       ;A0ED53;
    dw MainAI_CorpseTorizo                                               ;A0ED57;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0ED59;
    dw RTL_A9804C                                                        ;A0ED5B;
    dw Common_NormalEnemyFrozenAI                                        ;A0ED5D;
    dw $0000                                                             ;A0ED5F;
    dw $0000                                                             ;A0ED61;
    dd $00000000                                                         ;A0ED63;
    dw PowerBombReaction_CorpseTorizo                                    ;A0ED67;
    dw $0000                                                             ;A0ED69;
    dd $00000000                                                         ;A0ED6B;
    dw EnemyTouch_EnemyShot_CorpseTorizo                                 ;A0ED6F;
    dw EnemyTouch_EnemyShot_CorpseTorizo                                 ;A0ED71;
    dw $0000                                                             ;A0ED73;
    dl Tiles_CorpseTorizo                                                ;A0ED75;
    db $05                                                               ;A0ED78;
    dw EnemyDropChances_Shutter_Kamer_BabyMetroidCutscene                ;A0ED79;
    dw EnemyVulnerabilities_Corpse_BabyMetroid                           ;A0ED7B;
    dw $0000                                                             ;A0ED7D;

EnemyHeaders_CorpseSidehopper:
    dw $0E00                                                             ;A0ED7F;
    dw Palette_CorpseCommon                                              ;A0ED81;
    dw $0140,$0050,$0016,$000C                                           ;A0ED83;
    db $A9,$00                                                           ;A0ED8B;
    dw $0000,$0000                                                       ;A0ED8D;
    dw InitAI_CorpseSidehopper                                           ;A0ED91;
    dw $0001,$0000                                                       ;A0ED93;
    dw MainAI_HurtAI_CorpseEnemies                                       ;A0ED97;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0ED99;
    dw MainAI_HurtAI_CorpseEnemies                                       ;A0ED9B;
    dw Common_NormalEnemyFrozenAI                                        ;A0ED9D;
    dw $0000                                                             ;A0ED9F;
    dw $0000                                                             ;A0EDA1;
    dd $00000000                                                         ;A0EDA3;
    dw PowerBombReaction_CorpseSidehopper                                ;A0EDA7;
    dw $0000                                                             ;A0EDA9;
    dd $00000000                                                         ;A0EDAB;
    dw EnemyTouch_CorpseSidehopper                                       ;A0EDAF;
    dw EnemyShot_CorpseSidehopper                                        ;A0EDB1;
    dw $0000                                                             ;A0EDB3;
    dl Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree                       ;A0EDB5;
    db $05                                                               ;A0EDB8;
    dw $0000                                                             ;A0EDB9;
    dw EnemyVulnerabilities_Corpse_BabyMetroid                           ;A0EDBB;
    dw $0000                                                             ;A0EDBD;

EnemyHeaders_CorpseSidehopper2:
    dw $0600                                                             ;A0EDBF;
    dw Palette_CorpseSidehopper2                                         ;A0EDC1;
    dw $0140,$0050,$0016,$000C                                           ;A0EDC3;
    db $A9,$00                                                           ;A0EDCB;
    dw $0000,$0000                                                       ;A0EDCD;
    dw InitAI_CorpseSidehopper                                           ;A0EDD1;
    dw $0001,$0000                                                       ;A0EDD3;
    dw MainAI_HurtAI_CorpseEnemies                                       ;A0EDD7;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0EDD9;
    dw RTL_A9804C                                                        ;A0EDDB;
    dw Common_NormalEnemyFrozenAI                                        ;A0EDDD;
    dw $0000                                                             ;A0EDDF;
    dw $0000                                                             ;A0EDE1;
    dd $00000000                                                         ;A0EDE3;
    dw EnemyShot_CorpseSidehopper                                        ;A0EDE7;
    dw $0000                                                             ;A0EDE9;
    dd $00000000                                                         ;A0EDEB;
    dw EnemyShot_CorpseSidehopper                                        ;A0EDEF;
    dw EnemyShot_CorpseSidehopper                                        ;A0EDF1;
    dw $0000                                                             ;A0EDF3;
    dl Tiles_SidehopperLarge                                             ;A0EDF5;
    db $05                                                               ;A0EDF8;
    dw $0000                                                             ;A0EDF9;
    dw EnemyVulnerabilities_Corpse_BabyMetroid                           ;A0EDFB;
    dw $0000                                                             ;A0EDFD;

EnemyHeaders_CorpseZoomer:
    dw $0000                                                             ;A0EDFF;
    dw Palette_CorpseCommon                                              ;A0EE01;
    dw $03E8,$0000,$000A,$0008                                           ;A0EE03;
    db $A9,$00                                                           ;A0EE0B;
    dw $0000,$0000                                                       ;A0EE0D;
    dw InitAI_CorpseZoomer                                               ;A0EE11;
    dw $0001,$0000                                                       ;A0EE13;
    dw MainAI_HurtAI_CorpseEnemies                                       ;A0EE17;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0EE19;
    dw RTL_A9804C                                                        ;A0EE1B;
    dw Common_NormalEnemyFrozenAI                                        ;A0EE1D;
    dw $0000                                                             ;A0EE1F;
    dw $0000                                                             ;A0EE21;
    dd $00000000                                                         ;A0EE23;
    dw PowerBombReaction_CorpseZoomer                                    ;A0EE27;
    dw $0000                                                             ;A0EE29;
    dd $00000000                                                         ;A0EE2B;
    dw EnemyTouch_EnemyShot_CorpseZoomer                                 ;A0EE2F;
    dw EnemyTouch_EnemyShot_CorpseZoomer                                 ;A0EE31;
    dw $0000                                                             ;A0EE33;
    dl Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree                       ;A0EE35;
    db $05                                                               ;A0EE38;
    dw $0000                                                             ;A0EE39;
    dw EnemyVulnerabilities_Corpse_BabyMetroid                           ;A0EE3B;
    dw $0000                                                             ;A0EE3D;

EnemyHeaders_CorpseRipper:
    dw $0000                                                             ;A0EE3F;
    dw Palette_CorpseCommon                                              ;A0EE41;
    dw $03E8,$0000,$000B,$0006                                           ;A0EE43;
    db $A9,$00                                                           ;A0EE4B;
    dw $0000,$0000                                                       ;A0EE4D;
    dw InitAI_CorpseRipper                                               ;A0EE51;
    dw $0001,$0000                                                       ;A0EE53;
    dw MainAI_HurtAI_CorpseEnemies                                       ;A0EE57;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0EE59;
    dw RTL_A9804C                                                        ;A0EE5B;
    dw Common_NormalEnemyFrozenAI                                        ;A0EE5D;
    dw $0000                                                             ;A0EE5F;
    dw $0000                                                             ;A0EE61;
    dd $00000000                                                         ;A0EE63;
    dw PowerBombReaction_CorpseRipper                                    ;A0EE67;
    dw $0000                                                             ;A0EE69;
    dd $00000000                                                         ;A0EE6B;
    dw EnemyTouch_EnemyShot_CorpseRipper                                 ;A0EE6F;
    dw EnemyTouch_EnemyShot_CorpseRipper                                 ;A0EE71;
    dw $0000                                                             ;A0EE73;
    dl Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree                       ;A0EE75;
    db $05                                                               ;A0EE78;
    dw $0000                                                             ;A0EE79;
    dw EnemyVulnerabilities_Corpse_BabyMetroid                           ;A0EE7B;
    dw $0000                                                             ;A0EE7D;

EnemyHeaders_CorpseSkree:
    dw $0000                                                             ;A0EE7F;
    dw Palette_CorpseCommon                                              ;A0EE81;
    dw $03E8,$0000,$000C,$0010                                           ;A0EE83;
    db $A9,$00                                                           ;A0EE8B;
    dw $0000,$0000                                                       ;A0EE8D;
    dw InitAI_CorpseSkree                                                ;A0EE91;
    dw $0001,$0000                                                       ;A0EE93;
    dw MainAI_HurtAI_CorpseEnemies                                       ;A0EE97;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0EE99;
    dw RTL_A9804C                                                        ;A0EE9B;
    dw Common_NormalEnemyFrozenAI                                        ;A0EE9D;
    dw $0000                                                             ;A0EE9F;
    dw $0000                                                             ;A0EEA1;
    dd $00000000                                                         ;A0EEA3;
    dw PowerBombReaction_CorpseSkree                                     ;A0EEA7;
    dw $0000                                                             ;A0EEA9;
    dd $00000000                                                         ;A0EEAB;
    dw EnemyTouch_EnemyShot_CorpseSkree                                  ;A0EEAF;
    dw EnemyTouch_EnemyShot_CorpseSkree                                  ;A0EEB1;
    dw $0000                                                             ;A0EEB3;
    dl Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree                       ;A0EEB5;
    db $05                                                               ;A0EEB8;
    dw $0000                                                             ;A0EEB9;
    dw EnemyVulnerabilities_Corpse_BabyMetroid                           ;A0EEBB;
    dw $0000                                                             ;A0EEBD;

EnemyHeaders_BabyMetroid:
    dw $0C00                                                             ;A0EEBF;
    dw Palette_BabyMetroid                                               ;A0EEC1;
    dw $0C80,$0028,$0028,$0028                                           ;A0EEC3;
    db $A9,$00                                                           ;A0EECB;
    dw $0000,$0000                                                       ;A0EECD;
    dw InitAI_BabyMetroid                                                ;A0EED1;
    dw $0001,$0000                                                       ;A0EED3;
    dw MainAI_BabyMetroid                                                ;A0EED7;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0EED9;
    dw RTL_A9804C                                                        ;A0EEDB;
    dw Common_NormalEnemyFrozenAI                                        ;A0EEDD;
    dw $0000                                                             ;A0EEDF;
    dw $0000                                                             ;A0EEE1;
    dd $00000000                                                         ;A0EEE3;
    dw PowerBombReaction_BabyMetroid                                     ;A0EEE7;
    dw $0000                                                             ;A0EEE9;
    dd $00000000                                                         ;A0EEEB;
    dw EnemyTouch_BabyMetroid                                            ;A0EEEF;
    dw EnemyShot_BabyMetroid                                             ;A0EEF1;
    dw $0000                                                             ;A0EEF3;
    dl Tiles_BabyMetroid                                                 ;A0EEF5;
    db $02                                                               ;A0EEF8;
    dw $0000                                                             ;A0EEF9;
    dw EnemyVulnerabilities_Corpse_BabyMetroid                           ;A0EEFB;
    dw $0000                                                             ;A0EEFD;

EnemyHeaders_BombTorizo:
    dw $2000                                                             ;A0EEFF;
    dw Palette_Torizo_OrbProjectile                                      ;A0EF01;
    dw $0320,$0008,$0012,$0030                                           ;A0EF03;
    db $AA,$08                                                           ;A0EF0B;
    dw $0027,$0002                                                       ;A0EF0D;
    dw InitAI_Torizo                                                     ;A0EF11;
    dw $0001,$0000                                                       ;A0EF13;
    dw MainAI_BombTorizo                                                 ;A0EF17;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0EF19;
    dw HurtAI_BombTorizo                                                 ;A0EF1B;
    dw Common_NormalEnemyFrozenAI                                        ;A0EF1D;
    dw $0000                                                             ;A0EF1F;
    dw $0000                                                             ;A0EF21;
    dd $00000000                                                         ;A0EF23;
    dw $0000,$0000                                                       ;A0EF27;
    dd $00000000                                                         ;A0EF2B;
    dw EnemyTouch_Torizo                                                 ;A0EF2F;
    dw EnemyShot_Torizo_Normal                                           ;A0EF31;
    dw $0000                                                             ;A0EF33;
    dl Tiles_BombTorizo_GoldenTorizo                                     ;A0EF35;
    db $05                                                               ;A0EF38;
    dw EnemyDropChances_MotherBrainBody_BombTorizo                       ;A0EF39;
    dw EnemyVulnerabilities_BombTorizo_BombTorizoOrb                     ;A0EF3B;
    dw $0000                                                             ;A0EF3D;

EnemyHeaders_BombTorizoOrb:
    dw $2000                                                             ;A0EF3F;
    dw Palette_Torizo_OrbProjectile                                      ;A0EF41;
    dw $0320,$0008,$0012,$0030                                           ;A0EF43;
    db $AA,$08                                                           ;A0EF4B;
    dw $0027,$0002                                                       ;A0EF4D;
    dw InitAI_Torizo                                                     ;A0EF51;
    dw $0001,$0000                                                       ;A0EF53;
    dw MainAI_BombTorizo                                                 ;A0EF57;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0EF59;
    dw HurtAI_BombTorizo                                                 ;A0EF5B;
    dw Common_NormalEnemyFrozenAI                                        ;A0EF5D;
    dw $0000                                                             ;A0EF5F;
    dw $0000                                                             ;A0EF61;
    dd $00000000                                                         ;A0EF63;
    dw $0000,$0000                                                       ;A0EF67;
    dd $00000000                                                         ;A0EF6B;
    dw EnemyTouch_Torizo                                                 ;A0EF6F;
    dw EnemyShot_Torizo_Normal                                           ;A0EF71;
    dw $0000                                                             ;A0EF73;
    dl Tiles_BombTorizo_GoldenTorizo                                     ;A0EF75;
    db $05                                                               ;A0EF78;
    dw EnemyDropChances_BombTorizoOrb                                    ;A0EF79;
    dw EnemyVulnerabilities_BombTorizo_BombTorizoOrb                     ;A0EF7B;
    dw $0000                                                             ;A0EF7D;

EnemyHeaders_GoldenTorizo:
    dw $2000                                                             ;A0EF7F;
    dw Palette_Torizo_OrbProjectile                                      ;A0EF81;
    dw $34BC,$00A0,$0012,$0030                                           ;A0EF83;
    db $AA,$08                                                           ;A0EF8B;
    dw $0027,$0002                                                       ;A0EF8D;
    dw InitAI_Torizo                                                     ;A0EF91;
    dw $0001,$0000                                                       ;A0EF93;
    dw MainAI_GoldenTorizo                                               ;A0EF97;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0EF99;
    dw HurtAI_GoldenTorizo                                               ;A0EF9B;
    dw Common_NormalEnemyFrozenAI                                        ;A0EF9D;
    dw $0000                                                             ;A0EF9F;
    dw $0000                                                             ;A0EFA1;
    dd $00000000                                                         ;A0EFA3;
    dw $0000,$0000                                                       ;A0EFA7;
    dd $00000000                                                         ;A0EFAB;
    dw EnemyTouch_Torizo                                                 ;A0EFAF;
    dw ShotReaction_GoldenTorizo_Normal                                  ;A0EFB1;
    dw $0000                                                             ;A0EFB3;
    dl Tiles_BombTorizo_GoldenTorizo                                     ;A0EFB5;
    db $05                                                               ;A0EFB8;
    dw EnemyDropChances_GoldenTorizo                                     ;A0EFB9;
    dw EnemyVulnerabilities_GoldenTorizo_GoldenTorizoOrb                 ;A0EFBB;
    dw $0000                                                             ;A0EFBD;

EnemyHeaders_GoldenTorizoOrb:
    dw $2000                                                             ;A0EFBF;
    dw Palette_Torizo_OrbProjectile                                      ;A0EFC1;
    dw $34BC,$00A0,$0012,$0030                                           ;A0EFC3;
    db $AA,$08                                                           ;A0EFCB;
    dw $0027,$0002                                                       ;A0EFCD;
    dw InitAI_Torizo                                                     ;A0EFD1;
    dw $0001,$0000                                                       ;A0EFD3;
    dw MainAI_GoldenTorizo                                               ;A0EFD7;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0EFD9;
    dw HurtAI_GoldenTorizo                                               ;A0EFDB;
    dw Common_NormalEnemyFrozenAI                                        ;A0EFDD;
    dw $0000                                                             ;A0EFDF;
    dw $0000                                                             ;A0EFE1;
    dd $00000000                                                         ;A0EFE3;
    dw $0000,$0000                                                       ;A0EFE7;
    dd $00000000                                                         ;A0EFEB;
    dw EnemyTouch_Torizo                                                 ;A0EFEF;
    dw ShotReaction_GoldenTorizo_Normal                                  ;A0EFF1;
    dw $0000                                                             ;A0EFF3;
    dl Tiles_BombTorizo_GoldenTorizo                                     ;A0EFF5;
    db $05                                                               ;A0EFF8;
    dw EnemyDropChances_GoldenTorizoOrb                                  ;A0EFF9;
    dw EnemyVulnerabilities_GoldenTorizo_GoldenTorizoOrb                 ;A0EFFB;
    dw $0000                                                             ;A0EFFD;

EnemyHeaders_TourianStatue:
    dw $1600                                                             ;A0EFFF;
    dw Palettes_TourianStatue_Ridley                                     ;A0F001;
    dw $0BB8,$0BB8,$0000,$0000                                           ;A0F003;
    db $AA,$00                                                           ;A0F00B;
    dw $0000,$0000                                                       ;A0F00D;
    dw InitAI_TourianStatue                                              ;A0F011;
    dw $0001,$0000                                                       ;A0F013;
    dw MainAI_TourianStatue                                              ;A0F017;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0F019;
    dw RTL_AA804C                                                        ;A0F01B;
    dw Common_NormalEnemyFrozenAI                                        ;A0F01D;
    dw $0000                                                             ;A0F01F;
    dw $0000                                                             ;A0F021;
    dd $00000000                                                         ;A0F023;
    dw RTL_A0804C                                                        ;A0F027;
    dw $0000                                                             ;A0F029;
    dd $00000000                                                         ;A0F02B;
    dw RTL_AA804C                                                        ;A0F02F;
    dw RTL_AA804C                                                        ;A0F031;
    dw $0000                                                             ;A0F033;
    dl Tiles_TourianStatue                                               ;A0F035;
    db $06                                                               ;A0F038;
    dw $0000                                                             ;A0F039;
    dw EnemyVulnerabilities_Default                                      ;A0F03B;
    dw $0000                                                             ;A0F03D;

EnemyHeaders_TourianStatueGhost:
    dw $8600                                                             ;A0F03F;
    dw Palettes_TourianStatue_Ridley                                     ;A0F041;
    dw $0BB8,$0BB8,$0000,$0000                                           ;A0F043;
    db $AA,$00                                                           ;A0F04B;
    dw $0000,$0000                                                       ;A0F04D;
    dw RTL_AA804C                                                        ;A0F051;
    dw $0001,$0000                                                       ;A0F053;
    dw RTL_AA804C                                                        ;A0F057;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0F059;
    dw RTL_AA804C                                                        ;A0F05B;
    dw Common_NormalEnemyFrozenAI                                        ;A0F05D;
    dw $0000                                                             ;A0F05F;
    dw $0000                                                             ;A0F061;
    dd $00000000                                                         ;A0F063;
    dw RTL_A0804C                                                        ;A0F067;
    dw $0000                                                             ;A0F069;
    dd $00000000                                                         ;A0F06B;
    dw RTL_AA804C                                                        ;A0F06F;
    dw RTL_AA804C                                                        ;A0F071;
    dw $0000                                                             ;A0F073;
    dl Tiles_TourianStatuesSoul                                          ;A0F075;
    db $06                                                               ;A0F078;
    dw $0000                                                             ;A0F079;
    dw EnemyVulnerabilities_Default                                      ;A0F07B;
    dw $0000                                                             ;A0F07D;

EnemyHeaders_Shaktool:
    dw $0400                                                             ;A0F07F;
    dw Palette_Shaktool                                                  ;A0F081;
    dw $012C,$0078,$0006,$0006                                           ;A0F083;
    db $AA,$08                                                           ;A0F08B;
    dw $0069,$0000                                                       ;A0F08D;
    dw InitAI_Shaktool                                                   ;A0F091;
    dw $0007,$0000                                                       ;A0F093;
    dw MainAI_HurtAI_Shaktool                                            ;A0F097;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0F099;
    dw MainAI_HurtAI_Shaktool                                            ;A0F09B;
    dw Common_NormalEnemyFrozenAI                                        ;A0F09D;
    dw $0000                                                             ;A0F09F;
    dw $0004                                                             ;A0F0A1;
    dd $00000000                                                         ;A0F0A3;
    dw $0000,$0000                                                       ;A0F0A7;
    dd $00000000                                                         ;A0F0AB;
    dw EnemyTouch_Shaktool                                               ;A0F0AF;
    dw EnemyShot_Shaktool                                                ;A0F0B1;
    dw $0000                                                             ;A0F0B3;
    dl Tiles_Shaktool                                                    ;A0F0B5;
    db $05                                                               ;A0F0B8;
    dw EnemyDropChances_Shaktool                                         ;A0F0B9;
    dw EnemyVulnerabilities_Shaktool                                     ;A0F0BB;
    dw EnemyName_GoldenTorizo                                            ;A0F0BD;

EnemyHeaders_NoobTubeCrack:
    dw $1800                                                             ;A0F0BF;
    dw Palette_NoobTubeCrack_Initial                                     ;A0F0C1;
    dw $0014,$0028,$0000,$0000                                           ;A0F0C3;
    db $AA,$00                                                           ;A0F0CB;
    dw $0000,$0000                                                       ;A0F0CD;
    dw InitAI_NoobTubeCrack                                              ;A0F0D1;
    dw $0001,$0000                                                       ;A0F0D3;
    dw RTL_AA804C                                                        ;A0F0D7;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0F0D9;
    dw RTL_AA804C                                                        ;A0F0DB;
    dw Common_NormalEnemyFrozenAI                                        ;A0F0DD;
    dw $0000                                                             ;A0F0DF;
    dw $0000                                                             ;A0F0E1;
    dd $00000000                                                         ;A0F0E3;
    dw $0000,$0000                                                       ;A0F0E7;
    dd $00000000                                                         ;A0F0EB;
    dw RTL_AA804C                                                        ;A0F0EF;
    dw RTL_AA804C                                                        ;A0F0F1;
    dw $0000                                                             ;A0F0F3;
    dl Tiles_NoobTubeCrack                                               ;A0F0F5;
    db $05                                                               ;A0F0F8;
    dw EnemyDropChances_NoobTubeCrack_Chozo                              ;A0F0F9;
    dw EnemyVulnerabilities_Default                                      ;A0F0FB;
    dw $0000                                                             ;A0F0FD;

EnemyHeaders_Chozo:
    dw $1200                                                             ;A0F0FF;
    dw Palette_Chozo_WreckedShip_SpritePalette1                          ;A0F101;
    dw $0014,$0028,$0010,$0024                                           ;A0F103;
    db $AA,$00                                                           ;A0F10B;
    dw $0000,$0000                                                       ;A0F10D;
    dw InitAI_Chozo                                                      ;A0F111;
    dw $0001,$0000                                                       ;A0F113;
    dw MainAI_Chozo                                                      ;A0F117;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0F119;
    dw RTL_AA804C                                                        ;A0F11B;
    dw Common_NormalEnemyFrozenAI                                        ;A0F11D;
    dw $0000                                                             ;A0F11F;
    dw $0000                                                             ;A0F121;
    dd $00000000                                                         ;A0F123;
    dw $0000,$0000                                                       ;A0F127;
    dd $00000000                                                         ;A0F12B;
    dw RTL_AAE7DB                                                        ;A0F12F;
    dw RTL_AAE7DC                                                        ;A0F131;
    dw $0000                                                             ;A0F133;
    dl Tiles_Chozo                                                       ;A0F135;
    db $05                                                               ;A0F138;
    dw EnemyDropChances_NoobTubeCrack_Chozo                              ;A0F139;
    dw EnemyVulnerabilities_Indestructible                               ;A0F13B;
    dw $0000                                                             ;A0F13D;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_BunchOf2s_A0F13F:
; Unused. Random bunch of 2s
; Impossible to speculate on; the only other long list of 2s in the game is scroll data
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02   ;A0F13F;
    db $02,$02,$02,$02                                                   ;A0F14F;
endif ; !FEATURE_KEEP_UNREFERENCED

; Weirdo discontinuity, enemy banks jump from $A2..AA to $B2..B3
UNUSED_EnemyHeaders_SpinningTurtleEye_A0F153:
    dw $0200                                                             ;A0F153;
    dw UNUSED_Palette_SpinningTurtleEye_B38687                           ;A0F155;
    dw $0014,$0028,$0008,$0008                                           ;A0F157;
    db $B3,$00                                                           ;A0F15F;
    dw $0000,$0000                                                       ;A0F161;
    dw UNUSED_InitAI_SpinningTurtleEye_B386FB                            ;A0F165;
    dw $0001,$0000                                                       ;A0F167;
    dw UNUSED_MainAI_SpinningTurtleEye_B3870E                            ;A0F16B;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0F16D;
    dw RTL_B3804C                                                        ;A0F16F;
    dw Common_NormalEnemyFrozenAI                                        ;A0F171;
    dw $0000                                                             ;A0F173;
    dw $0000                                                             ;A0F175;
    dd $00000000                                                         ;A0F177;
    dw $0000,$0000                                                       ;A0F17B;
    dd $00000000                                                         ;A0F17F;
    dw Common_NormalEnemyTouchAI                                         ;A0F183;
    dw Common_NormalEnemyShotAI                                          ;A0F185;
    dw $0000                                                             ;A0F187;
    dl UNUSED_Tiles_SpinningTurtleEye_B7FB00                             ;A0F189;
    db $05                                                               ;A0F18C;
    dw $0000                                                             ;A0F18D;
    dw $0000                                                             ;A0F18F;
    dw $0000                                                             ;A0F191;

EnemyHeaders_Zeb:
    dw $0400                                                             ;A0F193;
    dw Palette_Zeb                                                       ;A0F195;
    dw $0009,$0006,$0008,$0008                                           ;A0F197;
    db $B3,$00                                                           ;A0F19F;
    dw $0022,$0000                                                       ;A0F1A1;
    dw InitAI_Zeb_Zebbo                                                  ;A0F1A5;
    dw $0001,$0000                                                       ;A0F1A7;
    dw MainAI_Zeb_Zebbo                                                  ;A0F1AB;
    dw Common_GrappleAI_KillEnemy                                        ;A0F1AD;
    dw RTL_B3804C                                                        ;A0F1AF;
    dw Common_NormalEnemyFrozenAI                                        ;A0F1B1;
    dw $0000                                                             ;A0F1B3;
    dw $0000                                                             ;A0F1B5;
    dd $00000000                                                         ;A0F1B7;
    dw $0000,$0000                                                       ;A0F1BB;
    dd $00000000                                                         ;A0F1BF;
    dw Common_NormalEnemyTouchAI                                         ;A0F1C3;
    dw Common_NormalEnemyShotAI                                          ;A0F1C5;
    dw $0000                                                             ;A0F1C7;
    dl Tiles_Zeb                                                         ;A0F1C9;
    db $05                                                               ;A0F1CC;
    dw EnemyDropChances_Zeb                                              ;A0F1CD;
    dw EnemyVulnerabilities_Default                                      ;A0F1CF;
    dw EnemyName_Zeb                                                     ;A0F1D1;

EnemyHeaders_Zebbo:
    dw $0400                                                             ;A0F1D3;
    dw Palette_Zebbo                                                     ;A0F1D5;
    dw $001E,$0014,$0008,$0008                                           ;A0F1D7;
    db $B3,$00                                                           ;A0F1DF;
    dw $0022,$0000                                                       ;A0F1E1;
    dw InitAI_Zeb_Zebbo                                                  ;A0F1E5;
    dw $0001,$0000                                                       ;A0F1E7;
    dw MainAI_Zeb_Zebbo                                                  ;A0F1EB;
    dw Common_GrappleAI_KillEnemy                                        ;A0F1ED;
    dw RTL_B3804C                                                        ;A0F1EF;
    dw Common_NormalEnemyFrozenAI                                        ;A0F1F1;
    dw $0000                                                             ;A0F1F3;
    dw $0000                                                             ;A0F1F5;
    dd $00000000                                                         ;A0F1F7;
    dw $0000,$0000                                                       ;A0F1FB;
    dd $00000000                                                         ;A0F1FF;
    dw Common_NormalEnemyTouchAI                                         ;A0F203;
    dw Common_NormalEnemyShotAI                                          ;A0F205;
    dw $0000                                                             ;A0F207;
    dl Tiles_Zebbo                                                       ;A0F209;
    db $05                                                               ;A0F20C;
    dw EnemyDropChances_Zebbo                                            ;A0F20D;
    dw EnemyVulnerabilities_Default                                      ;A0F20F;
    dw EnemyName_Zebbo                                                   ;A0F211;

EnemyHeaders_Gamet:
    dw $0400                                                             ;A0F213;
    dw Palette_Gamet                                                     ;A0F215;
    dw $0014,$0010,$0008,$0008                                           ;A0F217;
    db $B3,$00                                                           ;A0F21F;
    dw $0022,$0000                                                       ;A0F221;
    dw InitAI_Gamet                                                      ;A0F225;
    dw $0005,$0000                                                       ;A0F227;
    dw MainAI_Gamet                                                      ;A0F22B;
    dw Common_GrappleAI_KillEnemy                                        ;A0F22D;
    dw RTL_B3804C                                                        ;A0F22F;
    dw Common_NormalEnemyFrozenAI                                        ;A0F231;
    dw $0000                                                             ;A0F233;
    dw $0000                                                             ;A0F235;
    dd $00000000                                                         ;A0F237;
    dw $0000,$0000                                                       ;A0F23B;
    dd $00000000                                                         ;A0F23F;
    dw Common_NormalEnemyTouchAI                                         ;A0F243;
    dw Common_NormalEnemyShotAI                                          ;A0F245;
    dw $0000                                                             ;A0F247;
    dl Tiles_Gamet                                                       ;A0F249;
    db $05                                                               ;A0F24C;
    dw EnemyDropChances_Gamet                                            ;A0F24D;
    dw EnemyVulnerabilities_Default                                      ;A0F24F;
    dw EnemyName_Gamet                                                   ;A0F251;

EnemyHeaders_Geega:
    dw $0400                                                             ;A0F253;
    dw Palette_Geega                                                     ;A0F255;
    dw $000A,$000A,$0008,$0008                                           ;A0F257;
    db $B3,$00                                                           ;A0F25F;
    dw $0022,$0000                                                       ;A0F261;
    dw InitAI_Geega                                                      ;A0F265;
    dw $0001,$0000                                                       ;A0F267;
    dw MainAI_Geega                                                      ;A0F26B;
    dw Common_GrappleAI_KillEnemy                                        ;A0F26D;
    dw RTL_B3804C                                                        ;A0F26F;
    dw Common_NormalEnemyFrozenAI                                        ;A0F271;
    dw $0000                                                             ;A0F273;
    dw $0000                                                             ;A0F275;
    dd $00000000                                                         ;A0F277;
    dw $0000,$0000                                                       ;A0F27B;
    dd $00000000                                                         ;A0F27F;
    dw Common_NormalEnemyTouchAI                                         ;A0F283;
    dw Common_NormalEnemyShotAI                                          ;A0F285;
    dw $0000                                                             ;A0F287;
    dl Tiles_Geega                                                       ;A0F289;
    db $05                                                               ;A0F28C;
    dw EnemyDropChances_Geega                                            ;A0F28D;
    dw EnemyVulnerabilities_Default                                      ;A0F28F;
    dw EnemyName_Geega                                                   ;A0F291;

EnemyHeaders_Botwoon:
    dw $1800                                                             ;A0F293;
    dw Palette_Botwoon                                                   ;A0F295;
    dw $0BB8,$0078,$0008,$0008                                           ;A0F297;
    db $B3,$00                                                           ;A0F29F;
    dw $005F,$0009                                                       ;A0F2A1;
    dw InitAI_Botwoon                                                    ;A0F2A5;
    dw $0001,$0000                                                       ;A0F2A7;
    dw MainAI_Botwoon                                                    ;A0F2AB;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0F2AD;
    dw RTL_B3804C                                                        ;A0F2AF;
    dw Common_NormalEnemyFrozenAI                                        ;A0F2B1;
    dw $0000                                                             ;A0F2B3;
    dw $0000                                                             ;A0F2B5;
    dd $00000000                                                         ;A0F2B7;
    dw PowerBombReaction_Botwoon                                         ;A0F2BB;
    dw $0000                                                             ;A0F2BD;
    dd $00000000                                                         ;A0F2BF;
    dw EnemyTouch_Botwoon                                                ;A0F2C3;
    dw EnemyShot_Botwoon                                                 ;A0F2C5;
    dw $0000                                                             ;A0F2C7;
    dl Tiles_Botwoon                                                     ;A0F2C9;
    db $05                                                               ;A0F2CC;
    dw EnemyDropChances_Botwoon                                          ;A0F2CD;
    dw EnemyVulnerabilities_Botwoon                                      ;A0F2CF;
    dw EnemyName_Botwoon                                                 ;A0F2D1;

EnemyHeaders_EtecoonEscape:
    dw $0600                                                             ;A0F2D3;
    dw Palette_EtecoonEscape                                             ;A0F2D5;
    dw $0BB8,$0BB8,$0006,$0008                                           ;A0F2D7;
    db $B3,$00                                                           ;A0F2DF;
    dw $0000,$0000                                                       ;A0F2E1;
    dw InitAI_EtecoonEscape                                              ;A0F2E5;
    dw $0001,$0000                                                       ;A0F2E7;
    dw MainAI_EtecoonEscape                                              ;A0F2EB;
    dw Common_GrappleAI_NoInteraction                                    ;A0F2ED;
    dw RTL_B3804C                                                        ;A0F2EF;
    dw Common_NormalEnemyFrozenAI                                        ;A0F2F1;
    dw $0000                                                             ;A0F2F3;
    dw $0000                                                             ;A0F2F5;
    dd $00000000                                                         ;A0F2F7;
    dw RTL_A0804C                                                        ;A0F2FB;
    dw $0000                                                             ;A0F2F9;
    dd $00000000                                                         ;A0F2FF;
    dw RTL_B3804C                                                        ;A0F303;
    dw RTL_B3804C                                                        ;A0F305;
    dw $0000                                                             ;A0F307;
    dl Tiles_Etecoon                                                     ;A0F309;
    db $05                                                               ;A0F30C;
    dw EnemyDropChances_Etecoon_EtecoonEscape                            ;A0F30D;
    dw $0000                                                             ;A0F30F;
    dw $0000                                                             ;A0F311;

EnemyHeaders_DachoraEscape:
    dw $0C00                                                             ;A0F313;
    dw Palette_DachoraEscape                                             ;A0F315;
    dw $0BB8,$0BB8,$0008,$0018                                           ;A0F317;
    db $B3,$00                                                           ;A0F31F;
    dw $0000,$0000                                                       ;A0F321;
    dw InitAI_DachoraEscape                                              ;A0F325;
    dw $0001,$0000                                                       ;A0F327;
    dw RTL_B3EB1A                                                        ;A0F32B;
    dw Common_GrappleAI_NoInteraction                                    ;A0F32D;
    dw RTL_B3804C                                                        ;A0F32F;
    dw Common_NormalEnemyFrozenAI                                        ;A0F331;
    dw $0000                                                             ;A0F333;
    dw $0000                                                             ;A0F335;
    dd $00000000                                                         ;A0F337;
    dw RTL_A0804C                                                        ;A0F33B;
    dw $0000                                                             ;A0F339;
    dd $00000000                                                         ;A0F33F;
    dw RTL_B3804C                                                        ;A0F343;
    dw RTL_B3804C                                                        ;A0F345;
    dw $0000                                                             ;A0F347;
    dl Tiles_Dachora                                                     ;A0F349;
    db $05                                                               ;A0F34C;
    dw EnemyDropChances_Steam_Dachora_DachoraEscape                      ;A0F34D;
    dw $0000                                                             ;A0F34F;
    dw $0000                                                             ;A0F351;

EnemyHeaders_PirateGreyWall:
    dw $0C00                                                             ;A0F353;
    dw Palette_Pirate_Grey                                               ;A0F355;
    dw $0014,$000F,$0010,$0018                                           ;A0F357;
    db $B2,$00                                                           ;A0F35F;
    dw $0021,$0000                                                       ;A0F361;
    dw InitAI_PirateWall                                                 ;A0F365;
    dw $0001,$0000                                                       ;A0F367;
    dw MainAI_PirateWall                                                 ;A0F36B;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0F36D;
    dw RTL_B2804C                                                        ;A0F36F;
    dw Common_NormalEnemyFrozenAI                                        ;A0F371;
    dw $0000                                                             ;A0F373;
    dw $0004                                                             ;A0F375;
    dd $00000000                                                         ;A0F377;
    dw PowerBombReaction_Ninja_Walking_GreyWall                          ;A0F37B;
    dw $0000                                                             ;A0F37D;
    dd $00000000                                                         ;A0F37F;
    dw EnemyTouch_SpacePirate                                            ;A0F383;
    dw EnemyShot_SpacePirate_Normal                                      ;A0F385;
    dw $0000                                                             ;A0F387;
    dl Tiles_SpacePirate                                                 ;A0F389;
    db $05                                                               ;A0F38C;
    dw EnemyDropChances_PirateGreyWall                                   ;A0F38D;
    dw EnemyVulnerabilities_PirateGreyWall                               ;A0F38F;
    dw EnemyName_PirateGreyWall                                          ;A0F391;

EnemyHeaders_PirateGreenWall:
    dw $0C00                                                             ;A0F393;
    dw Palette_Pirate_Green                                              ;A0F395;
    dw $005A,$0014,$0010,$0018                                           ;A0F397;
    db $B2,$00                                                           ;A0F39F;
    dw $0021,$0000                                                       ;A0F3A1;
    dw InitAI_PirateWall                                                 ;A0F3A5;
    dw $0001,$0000                                                       ;A0F3A7;
    dw MainAI_PirateWall                                                 ;A0F3AB;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0F3AD;
    dw RTL_B2804C                                                        ;A0F3AF;
    dw Common_NormalEnemyFrozenAI                                        ;A0F3B1;
    dw $0000                                                             ;A0F3B3;
    dw $0004                                                             ;A0F3B5;
    dd $00000000                                                         ;A0F3B7;
    dw $0000,$0000                                                       ;A0F3BB;
    dd $00000000                                                         ;A0F3BF;
    dw EnemyTouch_SpacePirate                                            ;A0F3C3;
    dw EnemyShot_SpacePirate_Normal                                      ;A0F3C5;
    dw $0000                                                             ;A0F3C7;
    dl Tiles_SpacePirate                                                 ;A0F3C9;
    db $05                                                               ;A0F3CC;
    dw EnemyDropChances_PirateGreenWall                                  ;A0F3CD;
    dw EnemyVulnerabilities_PirateGreyWall                               ;A0F3CF;
    dw EnemyName_PirateGreenWall                                         ;A0F3D1;

EnemyHeaders_PirateRedWall:
    dw $0C00                                                             ;A0F3D3;
    dw Palette_Pirate_Red                                                ;A0F3D5;
    dw $00C8,$0050,$0010,$0018                                           ;A0F3D7;
    db $B2,$00                                                           ;A0F3DF;
    dw $0021,$0000                                                       ;A0F3E1;
    dw InitAI_PirateWall                                                 ;A0F3E5;
    dw $0001,$0000                                                       ;A0F3E7;
    dw MainAI_PirateWall                                                 ;A0F3EB;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0F3ED;
    dw RTL_B2804C                                                        ;A0F3EF;
    dw Common_NormalEnemyFrozenAI                                        ;A0F3F1;
    dw $0000                                                             ;A0F3F3;
    dw $0004                                                             ;A0F3F5;
    dd $00000000                                                         ;A0F3F7;
    dw $0000,$0000                                                       ;A0F3FB;
    dd $00000000                                                         ;A0F3FF;
    dw EnemyTouch_SpacePirate                                            ;A0F403;
    dw EnemyShot_SpacePirate_Normal                                      ;A0F405;
    dw $0000                                                             ;A0F407;
    dl Tiles_SpacePirate                                                 ;A0F409;
    db $05                                                               ;A0F40C;
    dw EnemyDropChances_PirateRedWall                                    ;A0F40D;
    dw EnemyVulnerabilities_PirateRedWall                                ;A0F40F;
    dw EnemyName_PirateRedWall                                           ;A0F411;

EnemyHeaders_PirateGoldWall:
    dw $0C00                                                             ;A0F413;
    dw Palette_Pirate_Gold_NonNinja                                      ;A0F415;
    dw $0384,$00C8,$0010,$0018                                           ;A0F417;
    db $B2,$00                                                           ;A0F41F;
    dw $0021,$0000                                                       ;A0F421;
    dw InitAI_PirateWall                                                 ;A0F425;
    dw $0001,$0000                                                       ;A0F427;
    dw MainAI_PirateWall                                                 ;A0F42B;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0F42D;
    dw RTL_B2804C                                                        ;A0F42F;
    dw Common_NormalEnemyFrozenAI                                        ;A0F431;
    dw $0000                                                             ;A0F433;
    dw $0004                                                             ;A0F435;
    dd $00000000                                                         ;A0F437;
    dw $0000,$0000                                                       ;A0F43B;
    dd $00000000                                                         ;A0F43F;
    dw EnemyTouch_SpacePirate                                            ;A0F443;
    dw EnemyShot_SpacePirate_Normal                                      ;A0F445;
    dw $0000                                                             ;A0F447;
    dl Tiles_SpacePirate                                                 ;A0F449;
    db $05                                                               ;A0F44C;
    dw EnemyDropChances_PirateGoldWall                                   ;A0F44D;
    dw EnemyVulnerabilities_PirateGoldWall_PirateGoldWalking             ;A0F44F;
    dw EnemyName_PirateGoldWall                                          ;A0F451;

EnemyHeaders_PirateMagentaWall:
    dw $0C00                                                             ;A0F453;
    dw Palette_Pirate_Magenta                                            ;A0F455;
    dw $012C,$00A0,$0010,$0018                                           ;A0F457;
    db $B2,$00                                                           ;A0F45F;
    dw $0021,$0000                                                       ;A0F461;
    dw InitAI_PirateWall                                                 ;A0F465;
    dw $0001,$0000                                                       ;A0F467;
    dw MainAI_PirateWall                                                 ;A0F46B;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0F46D;
    dw RTL_B2804C                                                        ;A0F46F;
    dw Common_NormalEnemyFrozenAI                                        ;A0F471;
    dw $0000                                                             ;A0F473;
    dw $0004                                                             ;A0F475;
    dd $00000000                                                         ;A0F477;
    dw $0000,$0000                                                       ;A0F47B;
    dd $00000000                                                         ;A0F47F;
    dw EnemyTouch_SpacePirate                                            ;A0F483;
    dw EnemyShot_SpacePirate_Normal                                      ;A0F485;
    dw $0000                                                             ;A0F487;
    dl Tiles_SpacePirate                                                 ;A0F489;
    db $05                                                               ;A0F48C;
    dw EnemyDropChances_PirateMagentaWall                                ;A0F48D;
    dw EnemyVulnerabilities_PirateMagentaWall                            ;A0F48F;
    dw EnemyName_PirateMagentaWall                                       ;A0F491;

EnemyHeaders_PirateSilverWall:
    dw $0C00                                                             ;A0F493;
    dw Palette_Pirate_Silver_GoldNinja                                   ;A0F495;
    dw $01F4,$000F,$0010,$0018                                           ;A0F497;
    db $B2,$00                                                           ;A0F49F;
    dw $0021,$0000                                                       ;A0F4A1;
    dw InitAI_PirateWall                                                 ;A0F4A5;
    dw $0001,$0000                                                       ;A0F4A7;
    dw MainAI_PirateWall                                                 ;A0F4AB;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0F4AD;
    dw RTL_B2804C                                                        ;A0F4AF;
    dw Common_NormalEnemyFrozenAI                                        ;A0F4B1;
    dw $0000                                                             ;A0F4B3;
    dw $0004                                                             ;A0F4B5;
    dd $00000000                                                         ;A0F4B7;
    dw $0000,$0000                                                       ;A0F4BB;
    dd $00000000                                                         ;A0F4BF;
    dw EnemyTouch_SpacePirate                                            ;A0F4C3;
    dw EnemyShot_SpacePirate_Normal                                      ;A0F4C5;
    dw $0000                                                             ;A0F4C7;
    dl Tiles_SpacePirate                                                 ;A0F4C9;
    db $05                                                               ;A0F4CC;
    dw EnemyDropChances_PirateSilverWall                                 ;A0F4CD;
    dw EnemyVulnerabilities_PirateSilverWall_PirateSilverWalking         ;A0F4CF;
    dw EnemyName_PirateSilverWall                                        ;A0F4D1;

EnemyHeaders_PirateGreyNinja:
    dw $1800                                                             ;A0F4D3;
    dw Palette_Pirate_Grey                                               ;A0F4D5;
    dw $0014,$000F,$0010,$0020                                           ;A0F4D7;
    db $B2,$00                                                           ;A0F4DF;
    dw $0021,$0000                                                       ;A0F4E1;
    dw InitAI_PirateNinja                                                ;A0F4E5;
    dw $0001,$0000                                                       ;A0F4E7;
    dw MainAI_PirateNinja                                                ;A0F4EB;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0F4ED;
    dw RTL_B2804C                                                        ;A0F4EF;
    dw Common_NormalEnemyFrozenAI                                        ;A0F4F1;
    dw $0000                                                             ;A0F4F3;
    dw $0004                                                             ;A0F4F5;
    dd $00000000                                                         ;A0F4F7;
    dw PowerBombReaction_Ninja_Walking_GreyWall                          ;A0F4FB;
    dw $0000                                                             ;A0F4FD;
    dd $00000000                                                         ;A0F4FF;
    dw EnemyTouch_SpacePirate                                            ;A0F503;
    dw EnemyShot_SpacePirate_Normal                                      ;A0F505;
    dw $0000                                                             ;A0F507;
    dl Tiles_SpacePirate                                                 ;A0F509;
    db $05                                                               ;A0F50C;
    dw EnemyDropChances_PirateGreyNinja                                  ;A0F50D;
    dw EnemyVulnerabilities_PirateNinja_Grey_Green_Red_Magenta           ;A0F50F;
    dw EnemyName_PirateGreyNinja                                         ;A0F511;

EnemyHeaders_PirateGreenNinja:
    dw $1800                                                             ;A0F513;
    dw Palette_Pirate_Green                                              ;A0F515;
    dw $005A,$0014,$0010,$0020                                           ;A0F517;
    db $B2,$00                                                           ;A0F51F;
    dw $0021,$0000                                                       ;A0F521;
    dw InitAI_PirateNinja                                                ;A0F525;
    dw $0001,$0000                                                       ;A0F527;
    dw MainAI_PirateNinja                                                ;A0F52B;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0F52D;
    dw RTL_B2804C                                                        ;A0F52F;
    dw Common_NormalEnemyFrozenAI                                        ;A0F531;
    dw $0000                                                             ;A0F533;
    dw $0004                                                             ;A0F535;
    dd $00000000                                                         ;A0F537;
    dw PowerBombReaction_Ninja_Walking_GreyWall                          ;A0F53B;
    dw $0000                                                             ;A0F53D;
    dd $00000000                                                         ;A0F53F;
    dw EnemyTouch_SpacePirate                                            ;A0F543;
    dw EnemyShot_SpacePirate_Normal                                      ;A0F545;
    dw $0000                                                             ;A0F547;
    dl Tiles_SpacePirate                                                 ;A0F549;
    db $05                                                               ;A0F54C;
    dw EnemyDropChances_PirateGreenNinja                                 ;A0F54D;
    dw EnemyVulnerabilities_PirateNinja_Grey_Green_Red_Magenta           ;A0F54F;
    dw EnemyName_PirateGreenNinja                                        ;A0F551;

EnemyHeaders_PirateRedNinja:
    dw $1800                                                             ;A0F553;
    dw Palette_Pirate_Red                                                ;A0F555;
    dw $00C8,$0050,$0010,$0020                                           ;A0F557;
    db $B2,$00                                                           ;A0F55F;
    dw $0021,$0000                                                       ;A0F561;
    dw InitAI_PirateNinja                                                ;A0F565;
    dw $0001,$0001                                                       ;A0F567;
    dw MainAI_PirateNinja                                                ;A0F56B;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0F56D;
    dw RTL_B2804C                                                        ;A0F56F;
    dw Common_NormalEnemyFrozenAI                                        ;A0F571;
    dw $0000                                                             ;A0F573;
    dw $0004                                                             ;A0F575;
    dd $00000000                                                         ;A0F577;
    dw PowerBombReaction_Ninja_Walking_GreyWall                          ;A0F57B;
    dw $0000                                                             ;A0F57D;
    dd $00000000                                                         ;A0F57F;
    dw EnemyTouch_SpacePirate                                            ;A0F583;
    dw EnemyShot_SpacePirate_Normal                                      ;A0F585;
    dw $0000                                                             ;A0F587;
    dl Tiles_SpacePirate                                                 ;A0F589;
    db $05                                                               ;A0F58C;
    dw EnemyDropChances_PirateRedNinja                                   ;A0F58D;
    dw EnemyVulnerabilities_PirateNinja_Grey_Green_Red_Magenta           ;A0F58F;
    dw EnemyName_PirateRedNinja                                          ;A0F591;

EnemyHeaders_PirateGoldNinja:
    dw $1800                                                             ;A0F593;
    dw Palette_Pirate_Silver_GoldNinja                                   ;A0F595;
    dw $0708,$0064,$0010,$0020                                           ;A0F597;
    db $B2,$00                                                           ;A0F59F;
    dw $0021,$0000                                                       ;A0F5A1;
    dw InitAI_PirateNinja                                                ;A0F5A5;
    dw $0001,$0000                                                       ;A0F5A7;
    dw MainAI_PirateNinja                                                ;A0F5AB;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0F5AD;
    dw RTL_B2804C                                                        ;A0F5AF;
    dw Common_NormalEnemyFrozenAI                                        ;A0F5B1;
    dw $0000                                                             ;A0F5B3;
    dw $0004                                                             ;A0F5B5;
    dd $00000000                                                         ;A0F5B7;
    dw PowerBombReaction_Ninja_Walking_GreyWall                          ;A0F5BB;
    dw $0000                                                             ;A0F5BD;
    dd $00000000                                                         ;A0F5BF;
    dw EnemyTouch_SpacePirate                                            ;A0F5C3;
    dw EnemyShot_SpacePirate_Normal                                      ;A0F5C5;
    dw $0000                                                             ;A0F5C7;
    dl Tiles_SpacePirate                                                 ;A0F5C9;
    db $05                                                               ;A0F5CC;
    dw EnemyDropChances_PirateGoldNinja                                  ;A0F5CD;
    dw EnemyVulnerabilities_PirateGoldNinja                              ;A0F5CF;
    dw EnemyName_PirateGoldNinja                                         ;A0F5D1;

EnemyHeaders_PirateMagentaNinja:
    dw $1800                                                             ;A0F5D3;
    dw Palette_Pirate_Magenta                                            ;A0F5D5;
    dw $012C,$00A0,$0010,$0020                                           ;A0F5D7;
    db $B2,$00                                                           ;A0F5DF;
    dw $0021,$0000                                                       ;A0F5E1;
    dw InitAI_PirateNinja                                                ;A0F5E5;
    dw $0001,$0000                                                       ;A0F5E7;
    dw MainAI_PirateNinja                                                ;A0F5EB;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0F5ED;
    dw RTL_B2804C                                                        ;A0F5EF;
    dw Common_NormalEnemyFrozenAI                                        ;A0F5F1;
    dw $0000                                                             ;A0F5F3;
    dw $0004                                                             ;A0F5F5;
    dd $00000000                                                         ;A0F5F7;
    dw PowerBombReaction_Ninja_Walking_GreyWall                          ;A0F5FB;
    dw $0000                                                             ;A0F5FD;
    dd $00000000                                                         ;A0F5FF;
    dw EnemyTouch_SpacePirate                                            ;A0F603;
    dw EnemyShot_SpacePirate_Normal                                      ;A0F605;
    dw $0000                                                             ;A0F607;
    dl Tiles_SpacePirate                                                 ;A0F609;
    db $05                                                               ;A0F60C;
    dw EnemyDropChances_PirateMagentaNinja                               ;A0F60D;
    dw EnemyVulnerabilities_PirateNinja_Grey_Green_Red_Magenta           ;A0F60F;
    dw EnemyName_PirateMagentaNinja                                      ;A0F611;

EnemyHeaders_PirateSilverNinja:
    dw $1800                                                             ;A0F613;
    dw Palette_Pirate_Silver_GoldNinja                                   ;A0F615;
    dw $01F4,$000F,$0010,$0020                                           ;A0F617;
    db $B2,$00                                                           ;A0F61F;
    dw $0021,$0000                                                       ;A0F621;
    dw InitAI_PirateNinja                                                ;A0F625;
    dw $0001,$0000                                                       ;A0F627;
    dw MainAI_PirateNinja                                                ;A0F62B;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0F62D;
    dw RTL_B2804C                                                        ;A0F62F;
    dw Common_NormalEnemyFrozenAI                                        ;A0F631;
    dw $0000                                                             ;A0F633;
    dw $0004                                                             ;A0F635;
    dd $00000000                                                         ;A0F637;
    dw PowerBombReaction_Ninja_Walking_GreyWall                          ;A0F63B;
    dw $0000                                                             ;A0F63D;
    dd $00000000                                                         ;A0F63F;
    dw EnemyTouch_SpacePirate                                            ;A0F643;
    dw EnemyShot_SpacePirate_Normal                                      ;A0F645;
    dw $0000                                                             ;A0F647;
    dl Tiles_SpacePirate                                                 ;A0F649;
    db $05                                                               ;A0F64C;
    dw EnemyDropChances_PirateSilverNinja                                ;A0F64D;
    dw EnemyVulnerabilities_PirateSilverNinja                            ;A0F64F;
    dw EnemyName_PirateSilverNinja                                       ;A0F651;

EnemyHeaders_PirateGreyWalking:
    dw $0C00                                                             ;A0F653;
    dw Palette_Pirate_Grey                                               ;A0F655;
    dw $0014,$000F,$0010,$0020                                           ;A0F657;
    db $B2,$00                                                           ;A0F65F;
    dw $0066,$0000                                                       ;A0F661;
    dw InitAI_PirateWalking                                              ;A0F665;
    dw $0001,$0000                                                       ;A0F667;
    dw MainAI_PirateWalking                                              ;A0F66B;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0F66D;
    dw RTL_B2804C                                                        ;A0F66F;
    dw Common_NormalEnemyFrozenAI                                        ;A0F671;
    dw $0000                                                             ;A0F673;
    dw $0004                                                             ;A0F675;
    dd $00000000                                                         ;A0F677;
    dw PowerBombReaction_Ninja_Walking_GreyWall                          ;A0F67B;
    dw $0000                                                             ;A0F67D;
    dd $00000000                                                         ;A0F67F;
    dw EnemyTouch_SpacePirate                                            ;A0F683;
    dw EnemyShot_SpacePirate_Normal                                      ;A0F685;
    dw $0000                                                             ;A0F687;
    dl Tiles_SpacePirate                                                 ;A0F689;
    db $05                                                               ;A0F68C;
    dw EnemyDropChances_PirateGreyWalking                                ;A0F68D;
    dw EnemyVulnerabilities_PirateGreyWalking                            ;A0F68F;
    dw EnemyName_PirateGreyWalking                                       ;A0F691;

EnemyHeaders_PirateGreenWalking:
    dw $0C00                                                             ;A0F693;
    dw Palette_Pirate_Green                                              ;A0F695;
    dw $005A,$0014,$0010,$0020                                           ;A0F697;
    db $B2,$00                                                           ;A0F69F;
    dw $0066,$0000                                                       ;A0F6A1;
    dw InitAI_PirateWalking                                              ;A0F6A5;
    dw $0001,$0000                                                       ;A0F6A7;
    dw MainAI_PirateWalking                                              ;A0F6AB;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0F6AD;
    dw RTL_B2804C                                                        ;A0F6AF;
    dw Common_NormalEnemyFrozenAI                                        ;A0F6B1;
    dw $0000                                                             ;A0F6B3;
    dw $0004                                                             ;A0F6B5;
    dd $00000000                                                         ;A0F6B7;
    dw PowerBombReaction_Ninja_Walking_GreyWall                          ;A0F6BB;
    dw $0000                                                             ;A0F6BD;
    dd $00000000                                                         ;A0F6BF;
    dw EnemyTouch_SpacePirate                                            ;A0F6C3;
    dw EnemyShot_SpacePirate_Normal                                      ;A0F6C5;
    dw $0000                                                             ;A0F6C7;
    dl Tiles_SpacePirate                                                 ;A0F6C9;
    db $05                                                               ;A0F6CC;
    dw EnemyDropChances_PirateGreenWalking                               ;A0F6CD;
    dw EnemyVulnerabilities_PirateGreenWalking                           ;A0F6CF;
    dw EnemyName_PirateGreenWalking                                      ;A0F6D1;

EnemyHeaders_PirateRedWalking:
    dw $0C00                                                             ;A0F6D3;
    dw Palette_Pirate_Red                                                ;A0F6D5;
    dw $00C8,$0050,$0010,$0020                                           ;A0F6D7;
    db $B2,$00                                                           ;A0F6DF;
    dw $0066,$0000                                                       ;A0F6E1;
    dw InitAI_PirateWalking                                              ;A0F6E5;
    dw $0001,$0000                                                       ;A0F6E7;
    dw MainAI_PirateWalking                                              ;A0F6EB;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0F6ED;
    dw RTL_B2804C                                                        ;A0F6EF;
    dw Common_NormalEnemyFrozenAI                                        ;A0F6F1;
    dw $0000                                                             ;A0F6F3;
    dw $0004                                                             ;A0F6F5;
    dd $00000000                                                         ;A0F6F7;
    dw PowerBombReaction_Ninja_Walking_GreyWall                          ;A0F6FB;
    dw $0000                                                             ;A0F6FD;
    dd $00000000                                                         ;A0F6FF;
    dw EnemyTouch_SpacePirate                                            ;A0F703;
    dw EnemyShot_SpacePirate_Normal                                      ;A0F705;
    dw $0000                                                             ;A0F707;
    dl Tiles_SpacePirate                                                 ;A0F709;
    db $05                                                               ;A0F70C;
    dw EnemyDropChances_PirateRedWalking                                 ;A0F70D;
    dw EnemyVulnerabilities_PirateRedWalking                             ;A0F70F;
    dw EnemyName_PirateRedWalking                                        ;A0F711;

EnemyHeaders_PirateGoldWalking:
    dw $0C00                                                             ;A0F713;
    dw Palette_Pirate_Gold_NonNinja                                      ;A0F715;
    dw $0384,$00C8,$0010,$0020                                           ;A0F717;
    db $B2,$00                                                           ;A0F71F;
    dw $0066,$0000                                                       ;A0F721;
    dw InitAI_PirateWalking                                              ;A0F725;
    dw $0001,$0000                                                       ;A0F727;
    dw MainAI_PirateWalking                                              ;A0F72B;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0F72D;
    dw RTL_B2804C                                                        ;A0F72F;
    dw Common_NormalEnemyFrozenAI                                        ;A0F731;
    dw $0000                                                             ;A0F733;
    dw $0004                                                             ;A0F735;
    dd $00000000                                                         ;A0F737;
    dw PowerBombReaction_Ninja_Walking_GreyWall                          ;A0F73B;
    dw $0000                                                             ;A0F73D;
    dd $00000000                                                         ;A0F73F;
    dw EnemyTouch_SpacePirate                                            ;A0F743;
    dw EnemyShot_SpacePirate_Normal                                      ;A0F745;
    dw $0000                                                             ;A0F747;
    dl Tiles_SpacePirate                                                 ;A0F749;
    db $05                                                               ;A0F74C;
    dw EnemyDropChances_PirateGoldWalking                                ;A0F74D;
    dw EnemyVulnerabilities_PirateGoldWall_PirateGoldWalking             ;A0F74F;
    dw EnemyName_PirateGoldWalking                                       ;A0F751;

EnemyHeaders_PirateMagentaWalking:
    dw $0C00                                                             ;A0F753;
    dw Palette_Pirate_Magenta                                            ;A0F755;
    dw $012C,$00A0,$0010,$0020                                           ;A0F757;
    db $B2,$00                                                           ;A0F75F;
    dw $0066,$0000                                                       ;A0F761;
    dw InitAI_PirateWalking                                              ;A0F765;
    dw $0001,$0000                                                       ;A0F767;
    dw MainAI_PirateWalking                                              ;A0F76B;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0F76D;
    dw RTL_B2804C                                                        ;A0F76F;
    dw Common_NormalEnemyFrozenAI                                        ;A0F771;
    dw $0000                                                             ;A0F773;
    dw $0004                                                             ;A0F775;
    dd $00000000                                                         ;A0F777;
    dw PowerBombReaction_Ninja_Walking_GreyWall                          ;A0F77B;
    dw $0000                                                             ;A0F77D;
    dd $00000000                                                         ;A0F77F;
    dw EnemyTouch_SpacePirate                                            ;A0F783;
    dw EnemyShot_SpacePirate_Normal                                      ;A0F785;
    dw $0000                                                             ;A0F787;
    dl Tiles_SpacePirate                                                 ;A0F789;
    db $05                                                               ;A0F78C;
    dw EnemyDropChances_PirateMagentaWalking                             ;A0F78D;
    dw EnemyVulnerabilities_PirateMagentaWalking                         ;A0F78F;
    dw EnemyName_PirateMagentaWalking                                    ;A0F791;

EnemyHeaders_PirateSilverWalking:
    dw $0C00                                                             ;A0F793;
    dw Palette_Pirate_Silver_GoldNinja                                   ;A0F795;
    dw $01F4,$000F,$0010,$0020                                           ;A0F797;
    db $B2,$00                                                           ;A0F79F;
    dw $0066,$0000                                                       ;A0F7A1;
    dw InitAI_PirateWalking                                              ;A0F7A5;
    dw $0001,$0000                                                       ;A0F7A7;
    dw MainAI_PirateWalking                                              ;A0F7AB;
    dw Common_GrappleAI_CancelGrappleBeam                                ;A0F7AD;
    dw RTL_B2804C                                                        ;A0F7AF;
    dw Common_NormalEnemyFrozenAI                                        ;A0F7B1;
    dw $0000                                                             ;A0F7B3;
    dw $0004                                                             ;A0F7B5;
    dd $00000000                                                         ;A0F7B7;
    dw PowerBombReaction_Ninja_Walking_GreyWall                          ;A0F7BB;
    dw $0000                                                             ;A0F7BD;
    dd $00000000                                                         ;A0F7BF;
    dw EnemyTouch_SpacePirate                                            ;A0F7C3;
    dw EnemyShot_SpacePirate_Normal                                      ;A0F7C5;
    dw $0000                                                             ;A0F7C7;
    dl Tiles_SpacePirate                                                 ;A0F7C9;
    db $05                                                               ;A0F7CC;
    dw EnemyDropChances_PirateSilverWalking                              ;A0F7CD;
    dw EnemyVulnerabilities_PirateSilverWall_PirateSilverWalking         ;A0F7CF;
    dw EnemyName_PirateSilverWalking                                     ;A0F7D1;


Freespace_BankA0_F7D3:                                                   ;A0F7D3;
; $82D bytes
