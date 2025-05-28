
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
GrappleAI_NoInteraction:
; Used by skultera, Draygon body, fire arc, Phantoon, etecoon, dachora and WS ghost
    JSL.L GrappleAI_SwitchEnemyAIToMainAI                                ;A08000;
    RTL                                                                  ;A08004;


;;; $8005: Grapple AI - Samus latches on ;;;
GrappleAI_SamusLatchesOn:
; Used by gripper and Crocomire
    JSL.L GrappleAI_SamusLatchesOnWithGrapple                            ;A08005;
    RTL                                                                  ;A08009;


;;; $800A: Grapple AI - kill enemy ;;;
GrappleAI_KillEnemy:
; Common
    JSL.L GrappleAI_EnemyGrappleDeath                                    ;A0800A;
    RTL                                                                  ;A0800E;


;;; $800F: Grapple AI - cancel grapple beam ;;;
GrappleAI_CancelGrappleBeam:
; Common
    JSL.L GrappleAI_SwitchToFrozenAI                                     ;A0800F;
    RTL                                                                  ;A08013;


;;; $8014: Grapple AI - Samus latches on - no invincibility ;;;
GrappleAI_SamusLatchesOn_NoInvincibility:
; Used by powamp
    JSL.L GrappleAI_SamusLatchesOnWithGrapple_NoInvincibility            ;A08014;
    RTL                                                                  ;A08018;


;;; $8019: Unused. Grapple AI - Samus latches on - paralyse enemy ;;;
UNUSED_GrappleAI_SamusLatchesOn_ParalyzeEnemy_A08019:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple_ParalyzeEnemy              ;A08019;
    RTL                                                                  ;A0801D;


;;; $801E: Grapple AI - hurt Samus ;;;
GrappleAI_HurtSamus:
; Used by WS spark
; Hurt reaction happens in $9B:B932
    JSL.L GrappleAI_SwitchToFrozenAI_duplicate                           ;A0801E;
    RTL                                                                  ;A08022;


;;; $8023: Normal enemy touch AI ;;;
NormalEnemyTouchAI:
    JSL.L NormalEnemyTouchAI_External                                    ;A08023;
    RTL                                                                  ;A08027;


;;; $8028: Normal touch AI - no death check ;;;
NormalTouchAI_NoDeathCheck:
    JSL.L NormalEnemyTouchAI_NoDeathCheck_External                       ;A08028;
    RTL                                                                  ;A0802C;


;;; $802D: Normal enemy shot AI ;;;
NormalEnemyShotAI:
    JSL.L NormalEnemyShotAI_External                                     ;A0802D;
    RTL                                                                  ;A08031;


;;; $8032: Normal enemy shot AI - no death check, no enemy shot graphic ;;;
NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic:
    JSL.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External     ;A08032;
    RTL                                                                  ;A08036;


;;; $8037: Normal enemy power bomb AI ;;;
NormalEnemyPowerBombAI:
    JSL.L NormalEnemyPowerBombAI_External                                ;A08037;
    RTL                                                                  ;A0803B;


;;; $803C: Normal enemy power bomb AI - no death check ;;;
NormalEnemyPowerBombAI_NoDeathCheck:
; Kraid's power bomb AI
    JSL.L NormalEnemyPowerBombAI_NoDeathCheck_External                   ;A0803C;
    RTL                                                                  ;A08040;


;;; $8041: Normal enemy frozen AI ;;;
NormalEnemyFrozenAI:
    JSL.L NormalEnemyFrozenAI_External                                   ;A08041;
    RTL                                                                  ;A08045;


;;; $8046: Creates a dud shot ;;;
CreateADudShot:
    JSL.L CreateADudShot_External                                        ;A08046;
    RTL                                                                  ;A0804A;


;;; $804B: RTS ;;;
RTS_A0804B:
    RTS                                                                  ;A0804B;


;;; $804C: RTL ;;;
RTL_A0804C:
    RTL                                                                  ;A0804C;


;;; $804D: Spritemap - nothing ;;;
Spritemap_Nothing:
    dw $0000                                                             ;A0804D;


;;; $804F: Extended spritemap - nothing ;;;
ExtendedSpritemap_Nothing:
    dw $0001,$0000,$0000                                                 ;A0804F;
    dw Spritemap_Nothing                                          ;A08055;
    dw Hitbox_Nothing                                             ;A08057;


;;; $8059: Hitbox - nothing ;;;
Hitbox_Nothing:
; [n entries] [[left offset] [top offset] [right offset] [bottom offset] [p touch] [p shot]]...
    dw $0001,$0000,$0000,$0000,$0000                                     ;A08059;
    dw NormalEnemyTouchAI                                         ;A08063;
    dw NormalEnemyShotAI                                          ;A08065;


;;; $8067: Instruction list - delete enemy ;;;
InstList_DeleteEnemy:
    dw Instruction_DeleteEnemy                                    ;A08067;


;;; $8069: Two NOPs ;;;
NOPNOP_A08069:
; Used as palette by respawning enemy placeholder and Draygon's eye o_O
    NOP                                                                  ;A08069;
    NOP                                                                  ;A0806A;

Instruction_Enemy0FB2_InY:
; Used only by torizos (for enemy movement function) and escape etecoon (for enemy function)
    LDA.W $0000,Y                                                        ;A0806B;
    STA.W Enemy.var5,X                                                   ;A0806E;
    INY                                                                  ;A08071;
    INY                                                                  ;A08072;
    RTL                                                                  ;A08073;


;;; $806B: Instruction - Enemy.var5 = [[Y]] ;;;
Instruction_SetEnemy0FB2ToRTS:
; Used only by torizos (for enemy movement function) and escape etecoon (for enemy function)
    LDA.W #RTS_A0807B                                                    ;A08074;
    STA.W Enemy.var5,X                                                   ;A08077;
    RTL                                                                  ;A0807A;


RTS_A0807B:
    RTS                                                                  ;A0807B;


;;; $807C: Instruction - delete enemy ;;;
Instruction_DeleteEnemy:
    LDA.W Enemy.properties,X                                             ;A0807C;
    ORA.W #$0200                                                         ;A0807F;
    STA.W Enemy.properties,X                                             ;A08082;
    PLA                                                                  ;A08085;
    PEA.W ProcessEnemyInstructions_return-1                              ;A08086;
    RTL                                                                  ;A08089;


;;; $808A: Instruction - call function [[Y]] ;;;
Instruction_CallFunctionInY:
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
Instruction_CallFunctionInY_WithA:
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
UNUSED_Instruction_CallExternalFunctionInY_A080B5:
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
UNUSED_Inst_CallExternalFunctionInY_WithA_A080CE:
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
Instruction_GotoY:
    LDA.W $0000,Y                                                        ;A080ED;
    TAY                                                                  ;A080F0;
    RTL                                                                  ;A080F1;


;;; $80F2: Instruction - go to [[Y]] + ±[[Y]] ;;;
Instruction_GotoY_PlusY:
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
Instruction_DecrementTimer_GotoYIfNonZero:
    DEC.W Enemy.loopCounter,X                                            ;A08108;
    BNE Instruction_GotoY                                         ;A0810B;
    INY                                                                  ;A0810D;
    INY                                                                  ;A0810E;
    RTL                                                                  ;A0810F;


;;; $8110: Instruction - decrement timer and go to [[Y]] if non-zero ;;;
Instruction_DecrementTimer_GotoYIfNonZero_duplicate:
    DEC.W Enemy.loopCounter,X                                            ;A08110;
    BNE Instruction_GotoY                                         ;A08113;
    INY                                                                  ;A08115;
    INY                                                                  ;A08116;
    RTL                                                                  ;A08117;


;;; $8118: Instruction - decrement timer and go to [Y] + ±[[Y]] if non-zero ;;;
Instruction_DecrementTimer_GotoY_PlusY_IfNonZero:
    SEP #$20                                                             ;A08118;
    DEC.W Enemy.loopCounter,X                                            ;A0811A;
    REP #$20                                                             ;A0811D;
    BNE Instruction_GotoY_PlusY                                   ;A0811F;
    INY                                                                  ;A08121;
    RTL                                                                  ;A08122;


;;; $8123: Instruction - timer = [[Y]] ;;;
Instruction_TimerInY:
    LDA.W $0000,Y                                                        ;A08123;
    STA.W Enemy.loopCounter,X                                            ;A08126;
    INY                                                                  ;A08129;
    INY                                                                  ;A0812A;
    RTL                                                                  ;A0812B;


;;; $812C: Instruction - skip next instruction ;;;
Instruction_SkipNextInstruction:
    INY                                                                  ;A0812C;
    INY                                                                  ;A0812D;
    RTL                                                                  ;A0812E;


;;; $812F: Instruction - sleep ;;;
Instruction_Sleep:
    DEY                                                                  ;A0812F;
    DEY                                                                  ;A08130;
    TYA                                                                  ;A08131;
    STA.W Enemy.instList,X                                               ;A08132;
    PLA                                                                  ;A08135;
    PEA.W ProcessEnemyInstructions_return-1                              ;A08136;
    RTL                                                                  ;A08139;


;;; $813A: Instruction - wait [[Y]] frames ;;;
Instruction_WaitYFrames:
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
Instruction_TransferYBytesInYToVRAM:
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
Instruction_EnableOffScreenProcessing:
    LDA.W Enemy.properties,X                                             ;A08173;
    ORA.W #$0800                                                         ;A08176;
    STA.W Enemy.properties,X                                             ;A08179;
    RTL                                                                  ;A0817C;


;;; $817D: Instruction - disable off-screen processing ;;;
Instruction_DisableOffScreenProcessing:
    LDA.W Enemy.properties,X                                             ;A0817D;
    AND.W #$F7FF                                                         ;A08180;
    STA.W Enemy.properties,X                                             ;A08183;
    RTL                                                                  ;A08186;


;;; $8187: Common enemy speeds - linearly increasing ;;;
EnemySpeeds_LinearlyIncreasing:
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
EnemySpeeds_QuadraticallyIncreasing:
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
