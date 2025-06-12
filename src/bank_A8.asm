
org $A88000


; Common to all enemy code banks
namespace CommonA8
incsrc "common_enemy_functions.asm"
namespace off


;;; $8687: Palette - enemy $E63F/$E67F (evir) ;;;
Palette_Evir:
    dw $3800,$57FF,$42F7,$0929,$00A5,$4F5A,$36B5,$2610                   ;A88687;
    dw $158C,$03FF,$02B9,$0170,$0069,$0BB1,$1EA9,$0145                   ;A88697;


;;; $86A7: Instruction list - evir body - facing left ;;;
InstList_Evir_Body_FacingLeft:
    dw $000A,Spritemap_Evir_0                                            ;A886A7;
    dw $000A,Spritemap_Evir_1                                            ;A886AB;
    dw $000A,Spritemap_Evir_2                                            ;A886AF;
    dw $000A,Spritemap_Evir_3                                            ;A886B3;
    dw $000A,Spritemap_Evir_4                                            ;A886B7;
    dw $000A,Spritemap_Evir_5                                            ;A886BB;
    dw Common_Instruction_GotoY                                          ;A886BF;
    dw InstList_Evir_Body_FacingLeft                                     ;A886C1;


;;; $86C3: Instruction list - evir arms - facing left ;;;
InstList_Evir_Arms_FacingLeft:
    dw $000A,Spritemap_Evir_6                                            ;A886C3;
    dw $000A,Spritemap_Evir_7                                            ;A886C7;
    dw $000A,Spritemap_Evir_8                                            ;A886CB;
    dw $000A,Spritemap_Evir_9                                            ;A886CF;
    dw $000A,Spritemap_Evir_6                                            ;A886D3;
    dw $000A,Spritemap_Evir_7                                            ;A886D7;
    dw $000A,Spritemap_Evir_8                                            ;A886DB;
    dw $000A,Spritemap_Evir_9                                            ;A886DF;
    dw $000A,Spritemap_Evir_6                                            ;A886E3;
    dw $000A,Spritemap_Evir_7                                            ;A886E7;
    dw $000A,Spritemap_Evir_8                                            ;A886EB;
    dw $000A,Spritemap_Evir_9                                            ;A886EF;
    dw $000A,Spritemap_Evir_6                                            ;A886F3;
    dw $000A,Spritemap_Evir_7                                            ;A886F7;
    dw $000A,Spritemap_Evir_8                                            ;A886FB;
    dw $000A,Spritemap_Evir_9                                            ;A886FF;
    dw $0030,Spritemap_Evir_A                                            ;A88703;
    dw Common_Instruction_GotoY                                          ;A88707;
    dw InstList_Evir_Arms_FacingLeft                                     ;A88709;


;;; $870B: Instruction list - evir body - facing right ;;;
InstList_Evir_Body_FacingRight:
    dw $000A,Spritemap_Evir_D                                            ;A8870B;
    dw $000A,Spritemap_Evir_E                                            ;A8870F;
    dw $000A,Spritemap_Evir_F                                            ;A88713;
    dw $000A,Spritemap_Evir_10                                           ;A88717;
    dw $000A,Spritemap_Evir_11                                           ;A8871B;
    dw $000A,Spritemap_Evir_12                                           ;A8871F;
    dw Common_Instruction_GotoY                                          ;A88723;
    dw InstList_Evir_Body_FacingRight                                    ;A88725;


;;; $8727: Instruction list - evir arms - facing right ;;;
InstList_Evir_Arms_FacingRight:
    dw $000A,Spritemap_Evir_13                                           ;A88727;
    dw $000A,Spritemap_Evir_14                                           ;A8872B;
    dw $000A,Spritemap_Evir_15                                           ;A8872F;
    dw $000A,Spritemap_Evir_16                                           ;A88733;
    dw $000A,Spritemap_Evir_13                                           ;A88737;
    dw $000A,Spritemap_Evir_14                                           ;A8873B;
    dw $000A,Spritemap_Evir_15                                           ;A8873F;
    dw $000A,Spritemap_Evir_16                                           ;A88743;
    dw $000A,Spritemap_Evir_13                                           ;A88747;
    dw $000A,Spritemap_Evir_14                                           ;A8874B;
    dw $000A,Spritemap_Evir_15                                           ;A8874F;
    dw $000A,Spritemap_Evir_16                                           ;A88753;
    dw $000A,Spritemap_Evir_13                                           ;A88757;
    dw $000A,Spritemap_Evir_14                                           ;A8875B;
    dw $000A,Spritemap_Evir_15                                           ;A8875F;
    dw $000A,Spritemap_Evir_16                                           ;A88763;
    dw $0030,Spritemap_Evir_17                                           ;A88767;
    dw Common_Instruction_GotoY                                          ;A8876B;
    dw InstList_Evir_Arms_FacingRight                                    ;A8876D;


;;; $876F: Instruction list - evir projectile - normal ;;;
InstList_Evir_Projectile_Normal:
    dw $0001,Spritemap_Evir_C                                            ;A8876F;
    dw Common_Instruction_Sleep                                          ;A88773;


;;; $8775: Instruction list - evir projectile - regenerating ;;;
InstList_Evir_Projectile_Regenerating_0:
    dw Instruction_Evir_SetInitialRegenerationXOffset                    ;A88775;
    dw Common_Instruction_TimerInY,$0008                                 ;A88777;
    dw Instruction_Evir_PlaySpitSFX                                      ;A8877B;

InstList_Evir_Projectile_Regenerating_1:
    dw $0008,Spritemap_Evir_B                                            ;A8877D;
    dw Instruction_Evir_AdvanceRegenerationXOffset                       ;A88781;
    dw Common_Instruction_DecrementTimer_GotoYIfNonZero_duplicate        ;A88783;
    dw InstList_Evir_Projectile_Regenerating_1                           ;A88785;
    dw $0010,Spritemap_Evir_C                                            ;A88787;
    dw Instruction_Evir_FinishRegeneration                               ;A8878B;
    dw Common_Instruction_Sleep                                          ;A8878D;


;;; $878F: Instruction - queue evir spit sound effect ;;;
Instruction_Evir_PlaySpitSFX:
    PHX                                                                  ;A8878F;
    PHY                                                                  ;A88790;
    LDA.W #$005E                                                         ;A88791;
    JSL.L QueueSound_Lib2_Max6                                           ;A88794;
    PLY                                                                  ;A88798;
    PLX                                                                  ;A88799;
    RTL                                                                  ;A8879A;


;;; $879B: Instruction - set initial regeneration X offset ;;;
Instruction_Evir_SetInitialRegenerationXOffset:
    LDX.W EnemyIndex                                                     ;A8879B;
    LDA.L Evir.instList-$80,X                                            ;A8879E;
    CMP.W #InstList_Evir_Body_FacingRight                                ;A887A2;
    BEQ .facingRight                                                     ;A887A5;
    LDA.W #$0008                                                         ;A887A7;
    STA.W Enemy.var5,X                                                   ;A887AA;
    BRA .return                                                          ;A887AD;

  .facingRight:
    LDA.W #$FFF8                                                         ;A887AF;
    STA.W Enemy.var5,X                                                   ;A887B2;

  .return:
    RTL                                                                  ;A887B5;


;;; $87B6: Instruction - advance regeneration X offset ;;;
Instruction_Evir_AdvanceRegenerationXOffset:
    LDX.W EnemyIndex                                                     ;A887B6;
    LDA.L Evir.instList-$80,X                                            ;A887B9;
    CMP.W #InstList_Evir_Body_FacingRight                                ;A887BD;
    BEQ .facingRight                                                     ;A887C0;
    DEC.W Enemy.var5,X                                                   ;A887C2;
    BRA .return                                                          ;A887C5;

  .facingRight:
    INC.W Enemy.var5,X                                                   ;A887C7;

  .return:
    RTL                                                                  ;A887CA;


;;; $87CB: Instruction - finish regeneration ;;;
Instruction_Evir_FinishRegeneration:
    LDX.W EnemyIndex                                                     ;A887CB;
    LDA.W #$0000                                                         ;A887CE;
    STA.L Evir.regenerationFlag,X                                        ;A887D1;
    STA.L Evir.movingFlag,X                                              ;A887D5;
    LDA.W #Function_EvirProjectile_Idle                                  ;A887D9;
    STA.W Evir.function,X                                                ;A887DC;
    RTL                                                                  ;A887DF;


;;; $87E0: Initialisation AI - enemy $E63F (evir) ;;;
InitAI_Evir:
    LDX.W EnemyIndex                                                     ;A887E0;
    LDA.W Enemy.init0,X                                                  ;A887E3;
    BNE .nonZeroParam1                                                   ;A887E6;
    JSR.W SetEvirFacingDirection                                         ;A887E8;
    LDA.W Enemy.init1,X                                                  ;A887EB;
    AND.W #$00FF                                                         ;A887EE;
    ASL                                                                  ;A887F1;
    ASL                                                                  ;A887F2;
    ASL                                                                  ;A887F3;
    TAY                                                                  ;A887F4;
    LDA.W Common_EnemySpeeds_LinearlyIncreasing,Y                         ;A887F5;
    STA.L Evir.downVelocity,X                                            ;A887F8;
    LDA.W Common_EnemySpeeds_LinearlyIncreasing+2,Y                       ;A887FC;
    STA.L Evir.downSubVelocity,X                                         ;A887FF;
    LDA.W Common_EnemySpeeds_LinearlyIncreasing+4,Y                       ;A88803;
    STA.L Evir.upVelocity,X                                              ;A88806;
    LDA.W Common_EnemySpeeds_LinearlyIncreasing+6,Y                       ;A8880A;
    STA.L Evir.upSubVelocity,X                                           ;A8880D;
    LDA.W Enemy.init1+1,Y                                                ;A88811;
    AND.W #$00FF                                                         ;A88814;
    LSR                                                                  ;A88817;
    STA.W Evir.movementTimer,X                                           ;A88818;
    BRA +                                                                ;A8881B;

  .nonZeroParam1:
    JSR.W HandleEvirArms                                                 ;A8881D;
    LDA.W #$0004                                                         ;A88820;
    STA.W Enemy.layer,X                                                  ;A88823;

+   LDA.W #$0000                                                         ;A88826;
    STA.L Evir.movementDirection,X                                       ;A88829;
    STA.L Evir.instList,X                                                ;A8882D;
    LDA.W #Function_Evir_HandleBodyArms                                  ;A88831;
    STA.W Evir.function,X                                                ;A88834;
    RTL                                                                  ;A88837;


;;; $8838: Set evir facing direction ;;;
SetEvirFacingDirection:
    LDX.W EnemyIndex                                                     ;A88838;
    JSL.L Get_SamusX_minus_EnemyX                                        ;A8883B;
    BPL .SamusToTheRight                                                 ;A8883F;
    LDA.W #$0000                                                         ;A88841;
    STA.W Evir.facingDirection,X                                         ;A88844;
    BRA +                                                                ;A88847;

  .SamusToTheRight:
    LDA.W #$0001                                                         ;A88849;
    STA.W Evir.facingDirection,X                                         ;A8884C;

+   LDA.W #InstList_Evir_Body_FacingLeft                                 ;A8884F;
    STA.L Evir.newInstList,X                                             ;A88852;
    LDA.W Evir.facingDirection,X                                         ;A88856;
    BEQ .keepLeft                                                        ;A88859;
    LDA.W #InstList_Evir_Body_FacingRight                                ;A8885B;
    STA.L Evir.newInstList,X                                             ;A8885E;

  .keepLeft:
    JSR.W SetEvirInstList                                                ;A88862;
    RTS                                                                  ;A88865;


;;; $8866: Handle evir arms ;;;
HandleEvirArms:
    LDX.W EnemyIndex                                                     ;A88866;
    LDA.W Enemy[-1].var1,X                                               ;A88869;
    STA.W Evir.facingDirection,X                                         ;A8886C;
    BNE .facingRight                                                     ;A8886F;
    LDA.W Enemy[-1].XPosition,X                                          ;A88871;
    SEC                                                                  ;A88874;
    SBC.W #$0004                                                         ;A88875;
    STA.W Enemy.XPosition,X                                              ;A88878;
    LDA.W Enemy[-1].YPosition,X                                          ;A8887B;
    CLC                                                                  ;A8887E;
    ADC.W #$000A                                                         ;A8887F;
    STA.W Enemy.YPosition,X                                              ;A88882;
    LDA.W #InstList_Evir_Arms_FacingLeft                                 ;A88885;
    STA.L Evir.newInstList,X                                             ;A88888;
    JSR.W SetEvirInstList                                                ;A8888C;
    BRA .return                                                          ;A8888F;

  .facingRight:
    LDA.W Enemy[-1].XPosition,X                                          ;A88891;
    CLC                                                                  ;A88894;
    ADC.W #$0004                                                         ;A88895;
    STA.W Enemy.XPosition,X                                              ;A88898;
    LDA.W Enemy[-1].YPosition,X                                          ;A8889B;
    CLC                                                                  ;A8889E;
    ADC.W #$000A                                                         ;A8889F;
    STA.W Enemy.YPosition,X                                              ;A888A2;
    LDA.W #InstList_Evir_Arms_FacingRight                                ;A888A5;
    STA.L Evir.newInstList,X                                             ;A888A8;
    JSR.W SetEvirInstList                                                ;A888AC;

  .return:
    RTS                                                                  ;A888AF;


;;; $88B0: Initialisation AI - enemy $E67F (evir projectile) ;;;
InitAI_EvirProjectile:
    LDX.W EnemyIndex                                                     ;A888B0;
    LDA.W #InstList_Evir_Projectile_Normal                               ;A888B3;
    STA.L Evir.newInstList,X                                             ;A888B6;
    JSR.W SetEvirInstList                                                ;A888BA;
    LDA.W Enemy[-2].palette,X                                            ;A888BD;
    STA.W Enemy.palette,X                                                ;A888C0;
    LDA.W Enemy[-2].GFXOffset,X                                          ;A888C3;
    STA.W Enemy.GFXOffset,X                                              ;A888C6;
    JSR.W ResetEvirProjectilePosition                                    ;A888C9;
    LDA.W #$0000                                                         ;A888CC;
    STA.L Evir.instList,X                                                ;A888CF;
    STA.L Evir.regenerationFlag,X                                        ;A888D3;
    STA.L Evir.movingFlag,X                                              ;A888D7;
    STA.W Enemy.var5,X                                                   ;A888DB;
    LDA.W #Function_EvirProjectile_Idle                                  ;A888DE;
    STA.W Evir.function,X                                                ;A888E1;
    RTL                                                                  ;A888E4;


;;; $88E5: Reset evir projectile position ;;;
ResetEvirProjectilePosition:
    LDX.W EnemyIndex                                                     ;A888E5;
    LDA.W Enemy[-2].var1,X                                               ;A888E8;
    STA.W Evir.facingDirection,X                                         ;A888EB;
    BNE .notUp                                                           ;A888EE;
    LDA.W Enemy[-2].XPosition,X                                          ;A888F0;
    SEC                                                                  ;A888F3;
    SBC.W #$0004                                                         ;A888F4;
    STA.W Enemy.XPosition,X                                              ;A888F7;
    LDA.W Enemy[-2].YPosition,X                                          ;A888FA;
    CLC                                                                  ;A888FD;
    ADC.W #$0012                                                         ;A888FE;
    STA.W Enemy.YPosition,X                                              ;A88901;
    BRA .return                                                          ;A88904;

  .notUp:
    LDA.W Enemy[-2].XPosition,X                                          ;A88906;
    CLC                                                                  ;A88909;
    ADC.W #$0004                                                         ;A8890A;
    STA.W Enemy.XPosition,X                                              ;A8890D;
    LDA.W Enemy[-2].YPosition,X                                          ;A88910;
    CLC                                                                  ;A88913;
    ADC.W #$0012                                                         ;A88914;
    STA.W Enemy.YPosition,X                                              ;A88917;

  .return:
    RTS                                                                  ;A8891A;


;;; $891B: Main AI - enemy $E63F (evir) ;;;
MainAI_Evir:
    LDX.W EnemyIndex                                                     ;A8891B;
    JSR.W (Evir.function,X)                                              ;A8891E;
    RTL                                                                  ;A88921;


;;; $8922: Evir function - handle body/arms ;;;
Function_Evir_HandleBodyArms:
    LDX.W EnemyIndex                                                     ;A88922;
    LDA.W Enemy.init0,X                                                  ;A88925;
    BNE .notMaster                                                       ;A88928;
    JSR.W HandleEvirBody                                                 ;A8892A;
    BRA .return                                                          ;A8892D;

  .notMaster:
    JSR.W Call_HandleEvirArms                                            ;A8892F;

  .return:
    RTS                                                                  ;A88932;


;;; $8933: Handle evir body ;;;
HandleEvirBody:
    LDX.W EnemyIndex                                                     ;A88933;
    LDA.L Evir.regenerationFlag+$80,X                                    ;A88936;
    BNE .directionChosen                                                 ;A8893A;
    JSR.W SetEvirFacingDirection                                         ;A8893C;

  .directionChosen:
    LDA.L Evir.movementDirection,X                                       ;A8893F;
    BNE .sinking                                                         ;A88943;
    LDA.W Enemy.YPosition,X                                              ;A88945;
    CLC                                                                  ;A88948;
    ADC.L Evir.upVelocity,X                                              ;A88949;
    STA.W Enemy.YPosition,X                                              ;A8894D;
    LDA.W Enemy.YSubPosition,X                                           ;A88950;
    CLC                                                                  ;A88953;
    ADC.L Evir.upSubVelocity,X                                           ;A88954;
    BCC .storeYSubPosition                                               ;A88958;
    INC.W Enemy.YPosition,X                                              ;A8895A;

  .storeYSubPosition:
    STA.W Enemy.YSubPosition,X                                           ;A8895D;
    BRA +                                                                ;A88960;

  .sinking:
    LDA.W Enemy.YPosition,X                                              ;A88962;
    CLC                                                                  ;A88965;
    ADC.L Evir.downVelocity,X                                            ;A88966;
    STA.W Enemy.YPosition,X                                              ;A8896A;
    LDA.W Enemy.YSubPosition,X                                           ;A8896D;
    CLC                                                                  ;A88970;
    ADC.L Evir.downSubVelocity,X                                         ;A88971;
    BCC ..storeYSubPosition                                              ;A88975;
    INC.W Enemy.YPosition,X                                              ;A88977;

  ..storeYSubPosition:
    STA.W Enemy.YSubPosition,X                                           ;A8897A;

+   DEC.W Evir.movementTimer,X                                           ;A8897D;
    BPL .return                                                          ;A88980;
    LDA.W Enemy.init1+1,X                                                ;A88982;
    AND.W #$00FF                                                         ;A88985;
    STA.W Evir.movementTimer,X                                           ;A88988;
    LDA.L Evir.movementDirection,X                                       ;A8898B;
    EOR.W #$0001                                                         ;A8898F;
    STA.L Evir.movementDirection,X                                       ;A88992;

  .return:
    RTS                                                                  ;A88996;


;;; $8997: Handle evir arms ;;;
Call_HandleEvirArms:
    LDX.W EnemyIndex                                                     ;A88997; >.<
    JSR.W HandleEvirArms                                                 ;A8899A;
    RTS                                                                  ;A8899D;


;;; $899E: Main AI - enemy $E67F (evir projectile) ;;;
MainAI_EvirProjectile:
    LDX.W EnemyIndex                                                     ;A8899E;
    LDA.W Enemy.freezeTimer,X                                            ;A889A1;
    BNE .merge                                                           ;A889A4;
    LDA.L Evir.movingFlag,X                                              ;A889A6;
    BEQ .angleInitialized                                                ;A889AA;
    LDA.W Evir.facingDirection,X                                         ;A889AC; >_<
    LDA.W #InstList_Evir_Projectile_Normal                               ;A889AF;
    STA.L Evir.newInstList,X                                             ;A889B2;
    JSR.W SetEvirInstList                                                ;A889B6;
    BRA .merge                                                           ;A889B9;

  .angleInitialized:
    LDA.L Evir.regenerationFlag,X                                        ;A889BB;
    BEQ .doneSpawning                                                    ;A889BF;
    LDA.W #InstList_Evir_Projectile_Regenerating_0                       ;A889C1;
    STA.L Evir.newInstList,X                                             ;A889C4;
    JSR.W SetEvirInstList                                                ;A889C8;
    BRA .merge                                                           ;A889CB;

  .doneSpawning:
    JSR.W ShootEvirProjectileAtSamus                                     ;A889CD;

  .merge:
    JSR.W (Evir.function,X)                                              ;A889D0;
    RTL                                                                  ;A889D3;


;;; $89D4: Shoot evir projectile at Samus ;;;
ShootEvirProjectileAtSamus:
    LDA.W EnemyIndex                                                     ;A889D4;
    SEC                                                                  ;A889D7;
    SBC.W #$0080                                                         ;A889D8;
    TAX                                                                  ;A889DB;
    LDA.W #$0080                                                         ;A889DC;
    JSL.L IsSamusWithinAPixelColumnsOfEnemy                              ;A889DF;
    BEQ .return                                                          ;A889E3;
    LDA.W #$0004                                                         ;A889E5;
    STA.W Temp_Unknown0E32                                               ;A889E8;
    JSL.L CalculateAngleOfSamusFromEnemy                                 ;A889EB;
    SEC                                                                  ;A889EF;
    SBC.W #$0040                                                         ;A889F0;
    AND.W #$00FF                                                         ;A889F3;
    EOR.W #$FFFF                                                         ;A889F6;
    INC                                                                  ;A889F9;
    STA.B DP_Temp16                                                      ;A889FA;
    JSL.L EightBitCosineMultiplication_A0B0B2                            ;A889FC;
    STA.L Evir.XVelocity,X                                               ;A88A00;
    LDA.W Temp_Unknown0E38                                               ;A88A04;
    STA.L Evir.XSubVelocity,X                                            ;A88A07;
    LDA.B DP_Temp16                                                      ;A88A0B;
    JSL.L EightBitNegativeSineMultiplication_A0B0C6                      ;A88A0D;
    STA.L Evir.YVelocity,X                                               ;A88A11;
    LDA.W Temp_Unknown0E38                                               ;A88A15;
    STA.L Evir.YSubVelocity,X                                            ;A88A18;
    LDA.W #InstList_Evir_Projectile_Normal                               ;A88A1C;
    STA.L Evir.newInstList,X                                             ;A88A1F;
    JSR.W SetEvirInstList                                                ;A88A23;
    LDA.W #$0001                                                         ;A88A26;
    STA.L Evir.movingFlag,X                                              ;A88A29;
    LDA.W #Function_EvirProjectile_Moving                                ;A88A2D;
    STA.W Evir.function,X                                                ;A88A30;

  .return:
    RTS                                                                  ;A88A33;


;;; $8A34: Evir projectile function - idle ;;;
Function_EvirProjectile_Idle:
    LDX.W EnemyIndex                                                     ;A88A34;
    JSR.W ResetEvirProjectilePosition                                    ;A88A37;
    RTS                                                                  ;A88A3A;


;;; $8A3B: Evir projectile function - moving ;;;
Function_EvirProjectile_Moving:
    LDX.W EnemyIndex                                                     ;A88A3B;
    JSR.W StartEvirProjectileRegeneratingIfFarOffScreen                  ;A88A3E;
    LDA.W Enemy.XPosition,X                                              ;A88A41;
    CLC                                                                  ;A88A44;
    ADC.L Evir.XVelocity,X                                               ;A88A45;
    STA.W Enemy.XPosition,X                                              ;A88A49;
    LDA.W Enemy.XSubPosition,X                                           ;A88A4C;
    CLC                                                                  ;A88A4F;
    ADC.L Evir.XSubVelocity,X                                            ;A88A50;
    BCC +                                                                ;A88A54;
    INC.W Enemy.XPosition,X                                              ;A88A56;

+   STA.W Enemy.XSubPosition,X                                           ;A88A59;
    LDA.W Enemy.YPosition,X                                              ;A88A5C;
    CLC                                                                  ;A88A5F;
    ADC.L Evir.YVelocity,X                                               ;A88A60;
    STA.W Enemy.YPosition,X                                              ;A88A64;
    LDA.W Enemy.YSubPosition,X                                           ;A88A67;
    CLC                                                                  ;A88A6A;
    ADC.L Evir.YSubVelocity,X                                            ;A88A6B;
    BCC +                                                                ;A88A6F;
    INC.W Enemy.YPosition,X                                              ;A88A71;

+   STA.W Enemy.YSubPosition,X                                           ;A88A74;
    RTS                                                                  ;A88A77;


;;; $8A78: Evir projectile function - regenerating ;;;
Function_EvirProjectile_Regenerating:
    LDX.W EnemyIndex                                                     ;A88A78;
    LDA.W Enemy[-2].freezeTimer,X                                        ;A88A7B;
    BNE .return                                                          ;A88A7E;
    LDA.L Evir.regenerationFlag,X                                        ;A88A80;
    BNE .notRegenerating                                                 ;A88A84;
    LDA.W #InstList_Evir_Projectile_Normal                               ;A88A86;
    STA.L Evir.newInstList,X                                             ;A88A89;
    JSR.W SetEvirInstList                                                ;A88A8D;
    LDA.W #$0000                                                         ;A88A90;
    STA.L Evir.regenerationFlag,X                                        ;A88A93;
    STA.L Evir.movingFlag,X                                              ;A88A97;
    LDA.W #Function_EvirProjectile_Idle                                  ;A88A9B;
    STA.W Evir.function,X                                                ;A88A9E;
    BRA .return                                                          ;A88AA1;

  .notRegenerating:
    JSR.W ResetEvirProjectilePosition                                    ;A88AA3;
    LDA.W Enemy.XPosition,X                                              ;A88AA6;
    CLC                                                                  ;A88AA9;
    ADC.W Enemy.var5,X                                                   ;A88AAA;
    STA.W Enemy.XPosition,X                                              ;A88AAD;

  .return:
    RTS                                                                  ;A88AB0;


;;; $8AB1: Start evir projectile regenerating if far off-screen ;;;
StartEvirProjectileRegeneratingIfFarOffScreen:
    LDX.W EnemyIndex                                                     ;A88AB1;
    LDA.W #$0100                                                         ;A88AB4;
    JSL.L CheckIfEnemyCenterIsOverAPixelsOffScreen                       ;A88AB7;
    BEQ .return                                                          ;A88ABB;
    LDA.W Enemy[-2].freezeTimer,X                                        ;A88ABD;
    BNE .return                                                          ;A88AC0;
    LDA.W #$0000                                                         ;A88AC2;
    STA.L Evir.movingFlag,X                                              ;A88AC5;
    LDA.W #$0001                                                         ;A88AC9;
    STA.L Evir.regenerationFlag,X                                        ;A88ACC;
    LDA.W #Function_EvirProjectile_Regenerating                          ;A88AD0;
    STA.W Evir.function,X                                                ;A88AD3;
    LDA.W #$0001                                                         ;A88AD6;
    STA.L Evir.regenerationFlag,X                                        ;A88AD9;
    LDA.W #InstList_Evir_Projectile_Regenerating_0                       ;A88ADD;
    STA.L Evir.newInstList,X                                             ;A88AE0;
    JSR.W SetEvirInstList                                                ;A88AE4;

  .return:
    RTS                                                                  ;A88AE7;


;;; $8AE8: Set evir instruction list ;;;
SetEvirInstList:
    LDX.W EnemyIndex                                                     ;A88AE8;
    LDA.L Evir.newInstList,X                                             ;A88AEB;
    CMP.L Evir.instList,X                                                ;A88AEF;
    BEQ .return                                                          ;A88AF3;
    STA.W Enemy.instList,X                                               ;A88AF5;
    STA.L Evir.instList,X                                                ;A88AF8;
    LDA.W #$0001                                                         ;A88AFC;
    STA.W Enemy.instTimer,X                                              ;A88AFF;
    STZ.W Enemy.loopCounter,X                                            ;A88B02;

  .return:
    RTS                                                                  ;A88B05;


;;; $8B06: Enemy shot - enemy $E63F (evir) ;;;
EnemyShot_Evir:
    JSL.L CommonA8_NormalEnemyTouchAI                                    ;A88B06;
    BRA ContactReaction_Evir_Common                                      ;A88B0A;


;;; $8B0C: Power bomb reaction - enemy $E63F (evir) ;;;
PowerBombReaction_Evir:
    JSL.L CommonA8_NormalEnemyPowerBombAI                                ;A88B0C;
    BRA ContactReaction_Evir_Common                                      ;A88B10;


;;; $8B12: Enemy touch - enemy $E63F (evir) ;;;
EnemyTouch_Evir:
    JSL.L NormalEnemyShotAI_Internal                                     ;A88B12; fallthrough to ContactReaction_Evir_Common


;;; $8B16: Evir shared contact reaction ;;;
ContactReaction_Evir_Common:
    LDX.W EnemyIndex                                                     ;A88B16;
    LDA.W Enemy.health,X                                                 ;A88B19;
    BNE .notDead                                                         ;A88B1C;
    LDA.W Enemy[1].properties,X                                          ;A88B1E;
    ORA.W #$0200                                                         ;A88B21;
    STA.W Enemy[1].properties,X                                          ;A88B24;
    LDA.W Enemy[2].properties,X                                          ;A88B27;
    ORA.W #$0200                                                         ;A88B2A;
    STA.W Enemy[2].properties,X                                          ;A88B2D;

  .notDead:
    LDA.W Enemy.freezeTimer,X                                            ;A88B30;
    BEQ .return                                                          ;A88B33;
    STA.W Enemy[1].freezeTimer,X                                         ;A88B35;
    LDA.W Enemy[1].AI,X                                                  ;A88B38;
    ORA.W #$0004                                                         ;A88B3B;
    STA.W Enemy[1].AI,X                                                  ;A88B3E;
    LDA.W Enemy[2].var2,X                                                ;A88B41;
    CMP.W #Function_EvirProjectile_Moving                                ;A88B44;
    BEQ .return                                                          ;A88B47;
    LDA.W Enemy[2].AI,X                                                  ;A88B49;
    ORA.W #$0004                                                         ;A88B4C;
    STA.W Enemy[2].AI,X                                                  ;A88B4F;
    LDA.W Enemy.freezeTimer,X                                            ;A88B52;
    STA.W Enemy[2].freezeTimer,X                                         ;A88B55;

  .return:
    RTL                                                                  ;A88B58;


;;; $8B59: Evir spritemaps ;;;
Spritemap_Evir_0:
    dw $0009                                                             ;A88B59;
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
    dw $0009                                                             ;A88B88;
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
    dw $0009                                                             ;A88BB7;
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
    dw $0009                                                             ;A88BE6;
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
    dw $0009                                                             ;A88C15;
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
    dw $0009                                                             ;A88C44;
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
    dw $0009                                                             ;A88C73;
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
    dw $0005                                                             ;A88CA2;
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $123)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $02, $FC, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $1FE, $F4, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $1F6, $F4, 0, 0, 2, 0, $120)

Spritemap_Evir_7:
    dw $0005                                                             ;A88CBD;
    %spritemapEntry(0, $1FE, $F4, 0, 0, 2, 0, $123)
    %spritemapEntry(0, $1F6, $F4, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $02, $FC, 0, 0, 2, 0, $123)
    %spritemapEntry(0, $1FA, $FC, 0, 0, 2, 0, $122)

Spritemap_Evir_8:
    dw $0005                                                             ;A88CD8;
    %spritemapEntry(0, $1FE, $F4, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $123)
    %spritemapEntry(0, $02, $FC, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $1FA, $FC, 0, 0, 2, 0, $120)

Spritemap_Evir_9:
    dw $0006                                                             ;A88CF3;
    %spritemapEntry(0, $1FE, $F4, 0, 0, 2, 0, $123)
    %spritemapEntry(0, $1F6, $F4, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $120)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $02, $FC, 0, 0, 2, 0, $123)
    %spritemapEntry(0, $1FA, $FC, 0, 0, 2, 0, $122)

Spritemap_Evir_A:
    dw $0003                                                             ;A88D13;
    %spritemapEntry(0, $1FE, $F4, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $02, $FC, 0, 0, 2, 0, $124)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Evir_A88D24:
    dw $0006                                                             ;A88D24;
    %spritemapEntry(0, $1FE, $F4, 0, 0, 2, 0, $123)
    %spritemapEntry(0, $1F6, $F4, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $123)
    %spritemapEntry(0, $02, $FC, 0, 0, 2, 0, $123)
    %spritemapEntry(0, $1FA, $FC, 0, 0, 2, 0, $122)

UNUSED_Spritemap_Evir_A88D44:
    dw $0006                                                             ;A88D44;
    %spritemapEntry(0, $1FE, $F4, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $1F6, $F4, 0, 0, 2, 0, $120)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $120)
    %spritemapEntry(0, $02, $FC, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $1FA, $FC, 0, 0, 2, 0, $120)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Evir_B:
    dw $0004                                                             ;A88D64;
    %spritemapEntry(0, $00, $00, 1, 0, 2, 0, $128)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 0, $127)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $128)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $127)

Spritemap_Evir_C:
    dw $0001                                                             ;A88D7A;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10E)

Spritemap_Evir_D:
    dw $0009                                                             ;A88D81;
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
    dw $0009                                                             ;A88DB0;
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
    dw $0009                                                             ;A88DDF;
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
    dw $0009                                                             ;A88E0E;
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
    dw $0009                                                             ;A88E3D;
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
    dw $0009                                                             ;A88E6C;
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
    dw $0009                                                             ;A88E9B;
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
    dw $0005                                                             ;A88ECA;
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 0, $123)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $1FA, $F4, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $02, $F4, 0, 1, 2, 0, $120)
    %spritemapEntry(0, $1F6, $FC, 0, 1, 2, 0, $124)

Spritemap_Evir_14:
    dw $0005                                                             ;A88EE5;
    %spritemapEntry(0, $1FA, $F4, 0, 1, 2, 0, $123)
    %spritemapEntry(0, $02, $F4, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 0, $124)
    %spritemapEntry(0, $1F6, $FC, 0, 1, 2, 0, $123)
    %spritemapEntry(0, $1FE, $FC, 0, 1, 2, 0, $122)

Spritemap_Evir_15:
    dw $0005                                                             ;A88F00;
    %spritemapEntry(0, $1FA, $F4, 0, 1, 2, 0, $124)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 0, $123)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $1F6, $FC, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $1FE, $FC, 0, 1, 2, 0, $120)

Spritemap_Evir_16:
    dw $0006                                                             ;A88F1B;
    %spritemapEntry(0, $1FA, $F4, 0, 1, 2, 0, $123)
    %spritemapEntry(0, $02, $F4, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $120)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $1F6, $FC, 0, 1, 2, 0, $123)
    %spritemapEntry(0, $1FE, $FC, 0, 1, 2, 0, $122)

Spritemap_Evir_17:
    dw $0003                                                             ;A88F3B;
    %spritemapEntry(0, $1F6, $FC, 0, 1, 2, 0, $124)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 0, $124)
    %spritemapEntry(0, $1FA, $F4, 0, 1, 2, 0, $124)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Evir_A88F4C:
    dw $0006                                                             ;A88F4C;
    %spritemapEntry(0, $1FA, $F4, 0, 1, 2, 0, $123)
    %spritemapEntry(0, $02, $F4, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 0, $123)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $1F6, $FC, 0, 1, 2, 0, $123)
    %spritemapEntry(0, $1FE, $FC, 0, 1, 2, 0, $122)

UNUSED_Spritemap_Evir_A88F6C:
    dw $0006                                                             ;A88F6C;
    %spritemapEntry(0, $1FA, $F4, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $02, $F4, 0, 1, 2, 0, $120)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $120)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $1F6, $FC, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $1FE, $FC, 0, 1, 2, 0, $120)
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8F8C: Palette - enemy $E6BF (morph ball eye) ;;;
Palette_Eye:
    dw $3800,$72B2,$71C7,$2461,$1840,$7A8E,$660B,$4D03                   ;A88F8C;
    dw $4900,$7FE0,$7E80,$44E0,$2C20,$0000,$0000,$0000                   ;A88F9C;


;;; $8FAC: Instruction list - eye - active ;;;
InstList_Eye_Active:
; Indexed by [enemy angle] / 10h * 4, set every frame
    dw $000A,Spritemap_Eye_7                                             ;A88FAC;
    dw $000A,Spritemap_Eye_7                                             ;A88FB0;
    dw $000A,Spritemap_Eye_8                                             ;A88FB4;
    dw $000A,Spritemap_Eye_9                                             ;A88FB8;
    dw $000A,Spritemap_Eye_A                                             ;A88FBC;
    dw $000A,Spritemap_Eye_B                                             ;A88FC0;
    dw $000A,Spritemap_Eye_C                                             ;A88FC4;
    dw $000A,Spritemap_Eye_D                                             ;A88FC8;
    dw $000A,Spritemap_Eye_6                                             ;A88FCC;
    dw $000A,Spritemap_Eye_5                                             ;A88FD0;
    dw $000A,Spritemap_Eye_4                                             ;A88FD4;
    dw $000A,Spritemap_Eye_3                                             ;A88FD8;
    dw $000A,Spritemap_Eye_2                                             ;A88FDC;
    dw $000A,Spritemap_Eye_1                                             ;A88FE0;
    dw $000A,Spritemap_Eye_0                                             ;A88FE4;
    dw $000A,Spritemap_Eye_0                                             ;A88FE8;
    dw Common_Instruction_GotoY                                          ;A88FEC;
    dw InstList_Eye_Active                                               ;A88FEE;


;;; $8FF0: Instruction list - eye - facing right - deactivating ;;;
InstList_Eye_FacingRight_Deactivating:
    dw $0008,Spritemap_Eye_F                                             ;A88FF0;
    dw $0030,Spritemap_Eye_3                                             ;A88FF4;
    dw $0005,Spritemap_Eye_F                                             ;A88FF8;


;;; $8FFC: Instruction list - eye - facing right - closed ;;;
InstList_Eye_FacingRight_Closed:
    dw $0030,Spritemap_Eye_E                                             ;A88FFC;
    dw Common_Instruction_Sleep                                          ;A89000;


;;; $9002: Instruction list - eye - facing left - deactivating ;;;
InstList_Eye_FacingLeft_Deactivating:
    dw $0008,Spritemap_Eye_11                                            ;A89002;
    dw $0030,Spritemap_Eye_A                                             ;A89006;
    dw $0005,Spritemap_Eye_11                                            ;A8900A;


;;; $900E: Instruction list - eye - facing left - closed ;;;
InstList_Eye_FacingLeft_Closed:
    dw $0030,Spritemap_Eye_10                                            ;A8900E;
    dw Common_Instruction_Sleep                                          ;A89012;


;;; $9014: Instruction list - eye - activating - facing right ;;;
InstList_Eye_FacingRight_Activating:
    dw $0020,Spritemap_Eye_E                                             ;A89014;
    dw $0005,Spritemap_Eye_F                                             ;A89018;
    dw $0030,Spritemap_Eye_3                                             ;A8901C;
    dw $0008,Spritemap_Eye_F                                             ;A89020;
    dw Common_Instruction_Sleep                                          ;A89024;


;;; $9026: Instruction list - eye - activating - facing left ;;;
InstList_Eye_FacingLeft_Activating:
    dw $0020,Spritemap_Eye_10                                            ;A89026;
    dw $0005,Spritemap_Eye_11                                            ;A8902A;
    dw $0030,Spritemap_Eye_A                                             ;A8902E;
    dw $0008,Spritemap_Eye_11                                            ;A89032;
    dw Common_Instruction_Sleep                                          ;A89036;


;;; $9038: Instruction list - mount - facing right ;;;
InstList_Eye_Mount_FacingRight:
    dw $0001,Spritemap_Eye_12                                            ;A89038;
    dw Common_Instruction_Sleep                                          ;A8903C;


;;; $903E: Instruction list - mount - facing down ;;;
InstList_Eye_Mount_FacingDown:
    dw $0001,Spritemap_Eye_13                                            ;A8903E;
    dw Common_Instruction_Sleep                                          ;A89042;


;;; $9044: Instruction list - mount - facing left ;;;
InstList_Eye_Mount_FacingLeft:
    dw $0001,Spritemap_Eye_14                                            ;A89044;
    dw Common_Instruction_Sleep                                          ;A89048;


;;; $904A: Instruction list - mount - facing up ;;;
InstList_Eye_Mount_FacingUp:
    dw $0001,Spritemap_Eye_15                                            ;A8904A;
    dw Common_Instruction_Sleep                                          ;A8904E;


;;; $9050: Morph ball eye proximities ;;;
EyeConstants:
  .XProximityToActivate:
    dw $0080                                                             ;A89050;

  .XProximityToDeactivate:
    dw $00B0                                                             ;A89052;

  .YProximityToActivate:
    dw $0080                                                             ;A89054;

  .YProximityToDeactivate:
    dw $0080                                                             ;A89056;


;;; $9058: Initialisation AI - enemy $E6BF (morph ball eye) ;;;
InitAI_Eye:
    LDX.W EnemyIndex                                                     ;A89058;
    LDA.W Enemy.properties,X                                             ;A8905B;
    ORA.W #$2000                                                         ;A8905E;
    STA.W Enemy.properties,X                                             ;A89061;
    LDA.W #Common_Spritemap_Nothing                                      ;A89064;
    STA.W Enemy.spritemap,X                                              ;A89067;
    LDA.W #$0001                                                         ;A8906A;
    STA.W Enemy.instTimer,X                                              ;A8906D;
    STZ.W Enemy.loopCounter,X                                            ;A89070;
    LDA.W Enemy.init1,X                                                  ;A89073;
    BMI .mountPart                                                       ;A89076;
    LDA.W #Function_Eye_WaitForSamusToGetNear                            ;A89078;
    STA.W Eye.function,X                                                 ;A8907B;
    LDA.W Enemy.init0,X                                                  ;A8907E;
    BIT.W #$0001                                                         ;A89081;
    BEQ .facingRight                                                     ;A89084;
    LDA.W #InstList_Eye_FacingLeft_Closed                                ;A89086;
    STA.W Enemy.instList,X                                               ;A89089;
    BRA .return                                                          ;A8908C;

  .facingRight:
    LDA.W #InstList_Eye_FacingRight_Closed                               ;A8908E;
    STA.W Enemy.instList,X                                               ;A89091;
    BRA .return                                                          ;A89094;

  .mountPart:
    AND.W #$000F                                                         ;A89096;
    ASL                                                                  ;A89099;
    TAY                                                                  ;A8909A;
    LDA.W Enemy.XPosition,X                                              ;A8909B;
    CLC                                                                  ;A8909E;
    ADC.W .XOffsets,Y                                                    ;A8909F;
    STA.W Enemy.XPosition,X                                              ;A890A2;
    LDA.W Enemy.YPosition,X                                              ;A890A5;
    CLC                                                                  ;A890A8;
    ADC.W .YOffsets,Y                                                    ;A890A9;
    STA.W Enemy.YPosition,X                                              ;A890AC;
    LDA.W #RTL_A891DC                                                    ;A890AF;
    STA.W Eye.function,X                                                 ;A890B2;
    LDA.W .instListPointers,Y                                            ;A890B5;
    STA.W Enemy.instList,X                                               ;A890B8;
    LDX.W #$01FE                                                         ;A890BB;

  .loop:
    LDA.W #$00FF                                                         ;A890BE;
    STA.L EyeBeamWindow1HDMADataTable,X                                  ;A890C1;
    DEX                                                                  ;A890C5;
    DEX                                                                  ;A890C6;
    BPL .loop                                                            ;A890C7;

  .return:
    RTL                                                                  ;A890C9;

  .XOffsets:
    dw $FFF8,$0008,$0000,$0000                                           ;A890CA;

  .YOffsets:
    dw $0000,$0000,$FFF8,$0008                                           ;A890D2;

  .instListPointers:
    dw InstList_Eye_Mount_FacingLeft                                     ;A890DA;
    dw InstList_Eye_Mount_FacingRight                                    ;A890DC;
    dw InstList_Eye_Mount_FacingUp                                       ;A890DE;
    dw InstList_Eye_Mount_FacingDown                                     ;A890E0;


;;; $90E2: Main AI - enemy $E6BF (morph ball eye) ;;;
MainAI_Eye:
    LDX.W EnemyIndex                                                     ;A890E2;
    LDA.W CollectedItems                                                 ;A890E5;
    BIT.W #$0004                                                         ;A890E8;
    BEQ .return                                                          ;A890EB;
    JMP.W (Eye.function,X)                                               ;A890ED;

  .return:
    RTL                                                                  ;A890F0;


;;; $90F1: Morph ball eye function - wait for Samus to get near ;;;
Function_Eye_WaitForSamusToGetNear:
    LDA.W EyeConstants_YProximityToActivate                              ;A890F1;
    JSL.L IsSamusWithingAPixelRowsOfEnemy                                ;A890F4;
    TAY                                                                  ;A890F8;
    BEQ .return                                                          ;A890F9;
    LDA.W EyeConstants_XProximityToActivate                              ;A890FB;
    JSL.L IsSamusWithinAPixelColumnsOfEnemy                              ;A890FE;
    TAY                                                                  ;A89102;
    BEQ .return                                                          ;A89103;
    LDA.W #$0020                                                         ;A89105;
    STA.W Eye.functionTimer,X                                            ;A89108;
    LDA.W #$0001                                                         ;A8910B;
    STA.W Enemy.instTimer,X                                              ;A8910E;
    LDA.W Enemy.init0,X                                                  ;A89111;
    BIT.W #$0001                                                         ;A89114;
    BEQ .zeroParam                                                       ;A89117;
    LDA.W #InstList_Eye_FacingLeft_Activating                            ;A89119;
    STA.W Enemy.instList,X                                               ;A8911C;
    BRA +                                                                ;A8911F;

  .zeroParam:
    LDA.W #InstList_Eye_FacingRight_Activating                           ;A89121;
    STA.W Enemy.instList,X                                               ;A89124;

+   LDA.W #Function_Eye_Activating                                       ;A89127;
    STA.W Eye.function,X                                                 ;A8912A;

  .return:
    RTL                                                                  ;A8912D;


;;; $912E: Morph ball eye function - activating ;;;
Function_Eye_Activating:
    DEC.W Eye.functionTimer,X                                            ;A8912E;
    BEQ .timerExpired                                                    ;A89131;
    BPL .return                                                          ;A89133;

  .timerExpired:
    LDA.W #$0017                                                         ;A89135;
    JSL.L QueueSound_Lib2_Max6                                           ;A89138;
    JSL.L Spawn_MorphBallEyeBeam_HDMAObject                              ;A8913C;
    LDA.W #Function_Eye_Active                                           ;A89140;
    STA.W Eye.function,X                                                 ;A89143;
    LDA.W SamusXPosition                                                 ;A89146;
    SEC                                                                  ;A89149;
    SBC.W Enemy.XPosition,X                                              ;A8914A;
    STA.B DP_Temp12                                                      ;A8914D;
    LDA.W SamusYPosition                                                 ;A8914F;
    SEC                                                                  ;A89152;
    SBC.W Enemy.YPosition,X                                              ;A89153;
    STA.B DP_Temp14                                                      ;A89156;
    JSL.L CalculateAngleOf_12_14_Offset                                  ;A89158;
    STA.W Eye.angle,X                                                    ;A8915C;

  .return:
    RTL                                                                  ;A8915F;


;;; $9160: Morph ball eye function - active ;;;
Function_Eye_Active:
    LDA.W EyeConstants_YProximityToDeactivate                            ;A89160;
    JSL.L IsSamusWithingAPixelRowsOfEnemy                                ;A89163;
    TAY                                                                  ;A89167;
    BEQ .notInProximity                                                  ;A89168;
    LDA.W EyeConstants_XProximityToDeactivate                            ;A8916A;
    JSL.L IsSamusWithinAPixelColumnsOfEnemy                              ;A8916D;
    TAY                                                                  ;A89171;
    BNE .inProximity                                                     ;A89172;

  .notInProximity:
    LDA.W #$0071                                                         ;A89174;
    JSL.L QueueSound_Lib2_Max6                                           ;A89177;
    STZ.W Eye.activatedFlag,X                                            ;A8917B;
    LDA.W #$0020                                                         ;A8917E;
    STA.W Eye.functionTimer,X                                            ;A89181;
    LDA.W Enemy.init0,X                                                  ;A89184;
    BIT.W #$0001                                                         ;A89187;
    BEQ .zeroParam                                                       ;A8918A;
    LDA.W #InstList_Eye_FacingLeft_Deactivating                          ;A8918C;
    STA.W Enemy.instList,X                                               ;A8918F;
    BRA +                                                                ;A89192;

  .zeroParam:
    LDA.W #InstList_Eye_FacingRight_Deactivating                         ;A89194;
    STA.W Enemy.instList,X                                               ;A89197;

+   LDA.W #Function_Eye_Deactivating                                     ;A8919A;
    STA.W Eye.function,X                                                 ;A8919D;
    BRA .merge                                                           ;A891A0;

  .inProximity:
    LDA.W SamusXPosition                                                 ;A891A2;
    SEC                                                                  ;A891A5;
    SBC.W Enemy.XPosition,X                                              ;A891A6;
    STA.B DP_Temp12                                                      ;A891A9;
    LDA.W SamusYPosition                                                 ;A891AB;
    SEC                                                                  ;A891AE;
    SBC.W Enemy.YPosition,X                                              ;A891AF;
    STA.B DP_Temp14                                                      ;A891B2;
    JSL.L CalculateAngleOf_12_14_Offset                                  ;A891B4;
    STA.W Eye.angle,X                                                    ;A891B8;
    AND.W #$00F0                                                         ;A891BB;
    LSR                                                                  ;A891BE;
    LSR                                                                  ;A891BF;
    CLC                                                                  ;A891C0;
    ADC.W #InstList_Eye_Active                                           ;A891C1;
    STA.W Enemy.instList,X                                               ;A891C4;

  .merge:
    LDA.W #$0001                                                         ;A891C7;
    STA.W Enemy.instTimer,X                                              ;A891CA;
    RTL                                                                  ;A891CD;


;;; $91CE: Morph ball eye function - deactivating ;;;
Function_Eye_Deactivating:
    DEC.W Eye.functionTimer,X                                            ;A891CE;
    BEQ .timerExpired                                                    ;A891D1;
    BPL .return                                                          ;A891D3;

  .timerExpired:
    LDA.W #Function_Eye_WaitForSamusToGetNear                            ;A891D5;
    STA.W Eye.function,X                                                 ;A891D8;

  .return:
    RTL                                                                  ;A891DB;


;;; $91DC: RTL ;;;
RTL_A891DC:
    RTL                                                                  ;A891DC;


;;; $91DD: RTL ;;;
RTL_A891DD:
    RTL                                                                  ;A891DD;


;;; $91DE: RTL ;;;
RTL_A891DE:
    RTL                                                                  ;A891DE;


;;; $91DF: Morph ball eye spritemaps ;;;
Spritemap_Eye_0:
    dw $0001                                                             ;A891DF;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $100)

Spritemap_Eye_1:
    dw $0001                                                             ;A891E6;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $102)

Spritemap_Eye_2:
    dw $0001                                                             ;A891ED;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $104)

Spritemap_Eye_3:
    dw $0001                                                             ;A891F4;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $106)

Spritemap_Eye_4:
    dw $0001                                                             ;A891FB;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $108)

Spritemap_Eye_5:
    dw $0001                                                             ;A89202;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10A)

Spritemap_Eye_6:
    dw $0001                                                             ;A89209;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10C)

Spritemap_Eye_7:
    dw $0001                                                             ;A89210;
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $100)

Spritemap_Eye_8:
    dw $0001                                                             ;A89217;
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $102)

Spritemap_Eye_9:
    dw $0001                                                             ;A8921E;
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $104)

Spritemap_Eye_A:
    dw $0001                                                             ;A89225;
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $106)

Spritemap_Eye_B:
    dw $0001                                                             ;A8922C;
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $108)

Spritemap_Eye_C:
    dw $0001                                                             ;A89233;
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $10A)

Spritemap_Eye_D:
    dw $0001                                                             ;A8923A;
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $10C)

Spritemap_Eye_E:
    dw $0004                                                             ;A89241;
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 0, $11F)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $11F)
    %spritemapEntry(0, $00, $00, 0, 0, 2, 0, $117)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $107)

Spritemap_Eye_F:
    dw $0004                                                             ;A89257;
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 0, $11E)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $11E)
    %spritemapEntry(0, $00, $00, 0, 0, 2, 0, $117)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $107)

Spritemap_Eye_10:
    dw $0004                                                             ;A8926D;
    %spritemapEntry(0, $00, $00, 1, 1, 2, 0, $11F)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $11F)
    %spritemapEntry(0, $1F8, $00, 0, 1, 2, 0, $117)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 0, $107)

Spritemap_Eye_11:
    dw $0004                                                             ;A89283;
    %spritemapEntry(0, $00, $00, 1, 1, 2, 0, $11E)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $11E)
    %spritemapEntry(0, $1F8, $00, 0, 1, 2, 0, $117)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 0, $107)

Spritemap_Eye_12:
    dw $0002                                                             ;A89299;
    %spritemapEntry(0, $1FC, $00, 1, 0, 2, 0, $10E)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 0, $10E)

Spritemap_Eye_13:
    dw $0002                                                             ;A892A5;
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 0, $10F)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 0, $10F)

Spritemap_Eye_14:
    dw $0002                                                             ;A892B1;
    %spritemapEntry(0, $1FC, $00, 1, 1, 2, 0, $10E)
    %spritemapEntry(0, $1FC, $F8, 0, 1, 2, 0, $10E)

Spritemap_Eye_15:
    dw $0002                                                             ;A892BD;
    %spritemapEntry(0, $00, $FC, 1, 1, 2, 0, $10F)
    %spritemapEntry(0, $1F8, $FC, 1, 0, 2, 0, $10F)

Spritemap_Eye_16:
    dw $0004                                                             ;A892C9;
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 0, $11F)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $11F)
    %spritemapEntry(0, $00, $00, 0, 0, 2, 0, $117)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $107)

Spritemap_Eye_17:
    dw $0004                                                             ;A892DF;
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 0, $11E)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $11E)
    %spritemapEntry(0, $00, $00, 0, 0, 2, 0, $117)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $107)

Spritemap_Eye_18:
    dw $0004                                                             ;A892F5;
    %spritemapEntry(0, $00, $00, 1, 1, 2, 0, $11F)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $11F)
    %spritemapEntry(0, $1F8, $00, 0, 1, 2, 0, $117)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 0, $107)

Spritemap_Eye_19:
    dw $0004                                                             ;A8930B;
    %spritemapEntry(0, $00, $00, 1, 1, 2, 0, $11E)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $11E)
    %spritemapEntry(0, $1F8, $00, 0, 1, 2, 0, $117)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 0, $107)

Spritemap_Eye_1A:
    dw $0004                                                             ;A89321;
    %spritemapEntry(0, $00, $00, 1, 1, 2, 0, $11F)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $11F)
    %spritemapEntry(0, $1F8, $00, 0, 1, 2, 0, $117)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 0, $107)

Spritemap_Eye_1B:
    dw $0004                                                             ;A89337;
    %spritemapEntry(0, $00, $00, 1, 1, 2, 0, $11E)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $11E)
    %spritemapEntry(0, $1F8, $00, 0, 1, 2, 0, $117)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 0, $107)

Spritemap_Eye_1C:
    dw $0004                                                             ;A8934D;
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 0, $11F)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $11F)
    %spritemapEntry(0, $00, $00, 0, 0, 2, 0, $117)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $107)

Spritemap_Eye_1D:
    dw $0004                                                             ;A89363;
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 0, $11E)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $11E)
    %spritemapEntry(0, $00, $00, 0, 0, 2, 0, $117)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $107)


;;; $9379: Palette - enemy $E6FF (fune) ;;;
Palette_Fune:
    dw $3800,$4B9C,$3694,$0929,$0042,$3B18,$2A52,$19AD                   ;A89379;
    dw $116B,$7F5A,$7EC0,$6DE0,$54E0,$001D,$0014,$000A                   ;A89389;


;;; $9399: Instruction list - fune - facing left - idle ;;;
InstList_Fune_FacingLeft_Idling:
    dw $0001,Spritemap_Fune_FacingLeft_Idle_MouthClosed                  ;A89399;
    dw Common_Instruction_Sleep                                          ;A8939D;


;;; $939F: Instruction list - fune - facing left - active ;;;
InstList_Fune_FacingLeft_Active:
    dw $0010,Spritemap_Fune_FacingLeft_Idle_MouthClosed                  ;A8939F;
    dw $0008,Spritemap_Fune_FacingLeft_StartOpeningMouth                 ;A893A3;
    dw $0008,Spritemap_Fune_FacingLeft_MouthOpening1                     ;A893A7;
    dw $0008,Spritemap_Fune_FacingLeft_MouthOpening2                     ;A893AB;
    dw Instruction_Fune_SpawnFireball_FacingLeft                         ;A893AF;
    dw Instruction_FuneNamihe_QueueSpitSFX                               ;A893B1;
    dw $0010,Spritemap_Fune_FacingLeft_MouthMostOpen                     ;A893B3;
    dw $0008,Spritemap_Fune_FacingLeft_MouthOpening2                     ;A893B7;
    dw $0008,Spritemap_Fune_FacingLeft_MouthOpening1                     ;A893BB;
    dw $0008,Spritemap_Fune_FacingLeft_StartOpeningMouth                 ;A893BF;
    dw Instruction_FuneNamihe_FinishActivity                             ;A893C3;
    dw Common_Instruction_GotoY                                          ;A893C5;
    dw InstList_Fune_FacingLeft_Idling                                   ;A893C7;


;;; $93C9: Instruction list - fune - facing right - idle ;;;
InstList_Fune_FacingRight_Idling:
    dw $0001,Spritemap_Fune_FacingRight_Idle_MouthClosed                 ;A893C9;
    dw Common_Instruction_Sleep                                          ;A893CD;


;;; $93CF: Instruction list - fune - facing right - active ;;;
InstList_Fune_FacingRight_Active:
    dw $0010,Spritemap_Fune_FacingRight_Idle_MouthClosed                 ;A893CF;
    dw $0008,Spritemap_Fune_FacingRight_StartOpeningMouth                ;A893D3;
    dw $0008,Spritemap_Fune_FacingRight_MouthOpening1                    ;A893D7;
    dw $0008,Spritemap_Fune_FacingRight_MouthOpening2                    ;A893DB;
    dw Instruction_Fune_SpawnFireball_FacingRight                        ;A893DF;
    dw Instruction_FuneNamihe_QueueSpitSFX                               ;A893E1;
    dw $0010,Spritemap_Fune_FacingRight_MouthMostOpen                    ;A893E3;
    dw $0008,Spritemap_Fune_FacingRight_MouthOpening2                    ;A893E7;
    dw $0008,Spritemap_Fune_FacingRight_MouthOpening1                    ;A893EB;
    dw $0008,Spritemap_Fune_FacingRight_StartOpeningMouth                ;A893EF;
    dw Instruction_FuneNamihe_FinishActivity_duplicate                   ;A893F3;
    dw Common_Instruction_GotoY                                          ;A893F5;
    dw InstList_Fune_FacingRight_Idling                                  ;A893F7;


;;; $93F9: Fune spritemaps ;;;
Spritemap_Fune_FacingLeft_Idle_MouthClosed:
    dw $0008                                                             ;A893F9;
    %spritemapEntry(0, $08, $0C, 0, 0, 2, 0, $127)
    %spritemapEntry(0, $00, $0C, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $00, $FC, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $00, $EC, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1F0, $FC, 0, 0, 2, 0, $102)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $1F0, $EC, 0, 0, 2, 0, $100)

Spritemap_Fune_FacingLeft_StartOpeningMouth:
    dw $0008                                                             ;A89423;
    %spritemapEntry(0, $06, $0C, 0, 0, 2, 0, $127)
    %spritemapEntry(0, $1FE, $0C, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1FE, $FC, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1FE, $EC, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1EE, $FE, 0, 0, 2, 0, $102)
    %spritemapEntry(0, $1F6, $FC, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $1EE, $FC, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $1EE, $EC, 0, 0, 2, 0, $100)

Spritemap_Fune_FacingLeft_MouthOpening1:
    dw $0008                                                             ;A8944D;
    %spritemapEntry(0, $04, $0C, 0, 0, 2, 0, $127)
    %spritemapEntry(0, $1FC, $0C, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1FC, $FC, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1FC, $EC, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1EC, $00, 0, 0, 2, 0, $102)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $1EC, $FC, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $1EC, $EC, 0, 0, 2, 0, $100)

Spritemap_Fune_FacingLeft_MouthOpening2:
    dw $0008                                                             ;A89477;
    %spritemapEntry(0, $02, $0C, 0, 0, 2, 0, $127)
    %spritemapEntry(0, $1FA, $0C, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1FA, $FC, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1FA, $EC, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1EA, $01, 0, 0, 2, 0, $102)
    %spritemapEntry(0, $1F2, $FC, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $1EA, $FC, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $1EA, $EC, 0, 0, 2, 0, $100)

Spritemap_Fune_FacingLeft_MouthMostOpen:
    dw $0008                                                             ;A894A1;
    %spritemapEntry(0, $00, $0C, 0, 0, 2, 0, $127)
    %spritemapEntry(0, $1F8, $0C, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1F8, $FC, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1F8, $EC, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1E8, $03, 0, 0, 2, 0, $102)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $1E8, $FC, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $1E8, $EC, 0, 0, 2, 0, $100)

Spritemap_Fune_FacingRight_Idle_MouthClosed:
    dw $0008                                                             ;A894CB;
    %spritemapEntry(0, $1F0, $0C, 0, 1, 2, 0, $127)
    %spritemapEntry(0, $1F8, $0C, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $1F0, $FC, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $1F0, $EC, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $00, $FC, 0, 1, 2, 0, $102)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $08, $FC, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $00, $EC, 0, 1, 2, 0, $100)

Spritemap_Fune_FacingRight_StartOpeningMouth:
    dw $0008                                                             ;A894F5;
    %spritemapEntry(0, $1F2, $0C, 0, 1, 2, 0, $127)
    %spritemapEntry(0, $1FA, $0C, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $1F2, $FC, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $1F2, $EC, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $02, $FE, 0, 1, 2, 0, $102)
    %spritemapEntry(0, $02, $FC, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $0A, $FC, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $02, $EC, 0, 1, 2, 0, $100)

Spritemap_Fune_FacingRight_MouthOpening1:
    dw $0008                                                             ;A8951F;
    %spritemapEntry(0, $1F4, $0C, 0, 1, 2, 0, $127)
    %spritemapEntry(0, $1FC, $0C, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $1F4, $FC, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $1F4, $EC, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $04, $00, 0, 1, 2, 0, $102)
    %spritemapEntry(0, $04, $FC, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $0C, $FC, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $04, $EC, 0, 1, 2, 0, $100)

Spritemap_Fune_FacingRight_MouthOpening2:
    dw $0008                                                             ;A89549;
    %spritemapEntry(0, $1F6, $0C, 0, 1, 2, 0, $127)
    %spritemapEntry(0, $1FE, $0C, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $1F6, $FC, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $1F6, $EC, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $06, $01, 0, 1, 2, 0, $102)
    %spritemapEntry(0, $06, $FC, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $0E, $FC, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $06, $EC, 0, 1, 2, 0, $100)

Spritemap_Fune_FacingRight_MouthMostOpen:
    dw $0008                                                             ;A89573;
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
    dw $3800,$4B9C,$3694,$0929,$0042,$3B18,$2A52,$19AD                   ;A8959D;
    dw $116B,$7F5A,$7EC0,$6DE0,$54E0,$001D,$0014,$000A                   ;A895AD;


;;; $95BD: Instruction list - namihe - facing left - idle ;;;
InstList_Namihe_FacingLeft_Idling:
    dw $0001,Spritemap_Namihe_FacingLeft_Idle_MouthEyeOpened             ;A895BD;
    dw Common_Instruction_Sleep                                          ;A895C1;


;;; $95C3: Instruction list - namihe - facing left - active ;;;
InstList_Namihe_FacingLeft_Active:
    dw $0008,Spritemap_Namihe_FacingLeft_Idle_MouthEyeOpened             ;A895C3;
    dw $0008,Spritemap_Namihe_FacingLeft_EyeOpened                       ;A895C7;
    dw $0008,Spritemap_Namihe_FacingLeft_StartOpeningMouth               ;A895CB;
    dw $0008,Spritemap_Namihe_FacingLeft_MouthOpening1                   ;A895CF;
    dw $0008,Spritemap_Namihe_FacingLeft_MouthOpening2                   ;A895D3;
    dw Instruction_Namihe_SpawnFireball_FacingLeft                       ;A895D7;
    dw Instruction_FuneNamihe_QueueSpitSFX                               ;A895D9;
    dw $0008,Spritemap_Namihe_FacingLeft_MouthMostOpen                   ;A895DB;
    dw $0008,Spritemap_Namihe_FacingLeft_MouthOpening2                   ;A895DF;
    dw $0008,Spritemap_Namihe_FacingLeft_MouthOpening1                   ;A895E3;
    dw $0008,Spritemap_Namihe_FacingLeft_StartOpeningMouth               ;A895E7;
    dw Instruction_FuneNamihe_FinishActivity                             ;A895EB;
    dw Common_Instruction_GotoY                                          ;A895ED;
    dw InstList_Namihe_FacingLeft_Idling                                 ;A895EF;


;;; $95F1: Instruction list - namihe - facing right - idle ;;;
InstList_Namihe_FacingRight_Idling:
    dw $0001,Spritemap_Namihe_FacingRight_Idle_MouthEyeClosed            ;A895F1;
    dw Common_Instruction_Sleep                                          ;A895F5;


;;; $95F7: Instruction list - namihe - facing right - active ;;;
InstList_Namihe_FacingRight_Active:
    dw $0008,Spritemap_Namihe_FacingRight_Idle_MouthEyeClosed            ;A895F7;
    dw $0008,Spritemap_Namihe_FacingRight_EyeOpened                      ;A895FB;
    dw $0008,Spritemap_Namihe_FacingRight_StartOpeningMouth              ;A895FF;
    dw $0008,Spritemap_Namihe_FacingRight_MouthOpening1                  ;A89603;
    dw $0008,Spritemap_Namihe_FacingRight_MouthOpening2                  ;A89607;
    dw Instruction_Namihe_SpawnFireball_FacingRight                      ;A8960B;
    dw Instruction_FuneNamihe_QueueSpitSFX                               ;A8960D;
    dw $0008,Spritemap_Namihe_FacingRight_MouthMostOpen                  ;A8960F;
    dw $0008,Spritemap_Namihe_FacingRight_MouthOpening2                  ;A89613;
    dw $0008,Spritemap_Namihe_FacingRight_MouthOpening1                  ;A89617;
    dw $0008,Spritemap_Namihe_FacingRight_StartOpeningMouth              ;A8961B;
    dw Instruction_FuneNamihe_FinishActivity_duplicate                   ;A8961F;
    dw Common_Instruction_GotoY                                          ;A89621;
    dw InstList_Namihe_FacingRight_Idling                                ;A89623;


;;; $9625: Instruction - queue fune spits sound effect ;;;
Instruction_FuneNamihe_QueueSpitSFX:
    PHY                                                                  ;A89625;
    PHX                                                                  ;A89626;
    LDA.W #$001F                                                         ;A89627;
    JSL.L QueueSound_Lib2_Max9                                           ;A8962A;
    PLX                                                                  ;A8962E;
    PLY                                                                  ;A8962F;
    RTL                                                                  ;A89630;


;;; $9631: Instruction - spawn leftwards namihe fireball ;;;
Instruction_Namihe_SpawnFireball_FacingLeft:
    PHY                                                                  ;A89631;
    LDX.W EnemyIndex                                                     ;A89632;
    LDA.W Enemy.init1,X                                                  ;A89635;
    AND.W #$00FF                                                         ;A89638;
    STA.W EnemyProjectile_InitParam1                                     ;A8963B;
    LDA.W #$0000                                                         ;A8963E;
    LDY.W #EnemyProjectile_NamiheFireball                                ;A89641;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A89644;
    PLY                                                                  ;A89648;
    RTL                                                                  ;A89649;


;;; $964A: Instruction - spawn rightwards namihe fireball ;;;
Instruction_Namihe_SpawnFireball_FacingRight:
    PHY                                                                  ;A8964A;
    LDX.W EnemyIndex                                                     ;A8964B;
    LDA.W Enemy.init1,X                                                  ;A8964E;
    AND.W #$00FF                                                         ;A89651;
    STA.W EnemyProjectile_InitParam1                                     ;A89654;
    LDA.W #$0001                                                         ;A89657;
    LDY.W #EnemyProjectile_NamiheFireball                                ;A8965A;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A8965D;
    PLY                                                                  ;A89661;
    RTL                                                                  ;A89662;


;;; $9663: Instruction - spawn leftwards fune fireball ;;;
Instruction_Fune_SpawnFireball_FacingLeft:
    PHY                                                                  ;A89663;
    LDX.W EnemyIndex                                                     ;A89664;
    LDA.W Enemy.init1,X                                                  ;A89667;
    AND.W #$00FF                                                         ;A8966A;
    STA.W EnemyProjectile_InitParam1                                     ;A8966D;
    LDA.W #$0000                                                         ;A89670;
    LDY.W #EnemyProjectile_FuneFireball                                  ;A89673;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A89676;
    PLY                                                                  ;A8967A;
    RTL                                                                  ;A8967B;


;;; $967C: Instruction - spawn rightwards fune fireball ;;;
Instruction_Fune_SpawnFireball_FacingRight:
    PHY                                                                  ;A8967C;
    LDX.W EnemyIndex                                                     ;A8967D;
    LDA.W Enemy.init1,X                                                  ;A89680;
    AND.W #$00FF                                                         ;A89683;
    STA.W EnemyProjectile_InitParam1                                     ;A89686;
    LDA.W #$0001                                                         ;A89689;
    LDY.W #EnemyProjectile_FuneFireball                                  ;A8968C;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A8968F;
    PLY                                                                  ;A89693;
    RTL                                                                  ;A89694;


;;; $9695: Instruction - finish activity ;;;
Instruction_FuneNamihe_FinishActivity:
    LDX.W EnemyIndex                                                     ;A89695;
    LDA.W FuneNamihe.instListPointersPointer,X                           ;A89698;
    INC                                                                  ;A8969B;
    INC                                                                  ;A8969C;
    INC                                                                  ;A8969D;
    INC                                                                  ;A8969E;
    STA.W FuneNamihe.instListPointersPointer,X                           ;A8969F;
    LDA.W #Function_Fune_WaitForTimer                                    ;A896A2;
    STA.W FuneNamihe.function,X                                          ;A896A5;
    LDA.W FuneNamihe.variantIndex,X                                      ;A896A8;
    BEQ .return                                                          ;A896AB;
    LDA.W #Function_Namihe_WaitForSamusToGetNear                         ;A896AD;
    STA.W FuneNamihe.function,X                                          ;A896B0;

  .return:
    RTL                                                                  ;A896B3;


;;; $96B4: Instruction - finish activity ;;;
Instruction_FuneNamihe_FinishActivity_duplicate:
; Clone of Instruction_FuneNamihe_FinishActivity
    LDX.W EnemyIndex                                                     ;A896B4;
    LDA.W FuneNamihe.instListPointersPointer,X                           ;A896B7;
    INC                                                                  ;A896BA;
    INC                                                                  ;A896BB;
    INC                                                                  ;A896BC;
    INC                                                                  ;A896BD;
    STA.W FuneNamihe.instListPointersPointer,X                           ;A896BE;
    LDA.W #Function_Fune_WaitForTimer                                    ;A896C1;
    STA.W FuneNamihe.function,X                                          ;A896C4;
    LDA.W FuneNamihe.variantIndex,X                                      ;A896C7;
    BEQ .return                                                          ;A896CA;
    LDA.W #Function_Namihe_WaitForSamusToGetNear                         ;A896CC;
    STA.W FuneNamihe.function,X                                          ;A896CF;

  .return:
    RTL                                                                  ;A896D2;


;;; $96D3: Instruction list pointers ;;;
InstListPointers_Fune_Namihe:
    dw InstList_Fune_FacingLeft_Active                                   ;A896D3;
    dw InstList_Fune_FacingRight_Active                                  ;A896D5;
    dw InstList_Fune_FacingLeft_Idling                                   ;A896D7;
    dw InstList_Fune_FacingRight_Idling                                  ;A896D9;
    dw InstList_Namihe_FacingLeft_Active                                 ;A896DB;
    dw InstList_Namihe_FacingRight_Active                                ;A896DD;
    dw InstList_Namihe_FacingLeft_Idling                                 ;A896DF;
    dw InstList_Namihe_FacingRight_Idling                                ;A896E1;


;;; $96E3: Initialisation AI - enemy $E6FF/$E73F (fune / namihe) ;;;
InitAI_Fune_Namihe:
    LDX.W EnemyIndex                                                     ;A896E3;
    LDA.W #InstListPointers_Fune_Namihe+$4                               ;A896E6;
    STA.W FuneNamihe.instListPointersPointer,X                           ;A896E9;
    LDA.W #Function_Fune_WaitForTimer                                    ;A896EC;
    STA.W FuneNamihe.function,X                                          ;A896EF;
    LDA.W Enemy.init0,X                                                  ;A896F2;
    AND.W #$000F                                                         ;A896F5;
    STA.W FuneNamihe.variantIndex,X                                      ;A896F8;
    BEQ .speciesDetermined                                               ;A896FB;
    LDA.W #InstListPointers_Fune_Namihe+$C                               ;A896FD;
    STA.W FuneNamihe.instListPointersPointer,X                           ;A89700;
    LDA.W #Function_Namihe_WaitForSamusToGetNear                         ;A89703;
    STA.W FuneNamihe.function,X                                          ;A89706;

  .speciesDetermined:
    LDA.W Enemy.init0,X                                                  ;A89709;
    AND.W #$00F0                                                         ;A8970C;
    BEQ .directionDetermined                                             ;A8970F;
    INC.W FuneNamihe.instListPointersPointer,X                           ;A89711;
    INC.W FuneNamihe.instListPointersPointer,X                           ;A89714;

  .directionDetermined:
    JSR.W SetFuneNamiheInstList                                          ;A89717;
    LDA.W Enemy.init1+1,X                                                ;A8971A;
    AND.W #$00FF                                                         ;A8971D;
    STA.W FuneNamihe.YProximity,X                                        ;A89720;
    LDA.W Enemy.init0+1,X                                                ;A89723;
    AND.W #$00FF                                                         ;A89726;
    STA.W FuneNamihe.cooldownTime,X                                      ;A89729;
    STZ.W FuneNamihe.cooldownTimer,X                                     ;A8972C;
    RTL                                                                  ;A8972F;


;;; $9730: Main AI - enemy $E6FF/$E73F (fune / namihe) ;;;
MainAI_Fune_Namihe:
    LDX.W EnemyIndex                                                     ;A89730;
    JSR.W (FuneNamihe.function,X)                                        ;A89733;
    RTL                                                                  ;A89736;


;;; $9737: Fune / namihe function - wait for timer (fune) ;;;
Function_Fune_WaitForTimer:
    LDX.W EnemyIndex                                                     ;A89737;
    INC.W FuneNamihe.cooldownTimer,X                                     ;A8973A;
    LDA.W FuneNamihe.cooldownTimer,X                                     ;A8973D;
    CMP.W FuneNamihe.cooldownTime,X                                      ;A89740;
    BMI .return                                                          ;A89743;
    LDA.W FuneNamihe.instListPointersPointer,X                           ;A89745;
    DEC                                                                  ;A89748;
    DEC                                                                  ;A89749;
    DEC                                                                  ;A8974A;
    DEC                                                                  ;A8974B;
    STA.W FuneNamihe.instListPointersPointer,X                           ;A8974C;
    JSR.W SetFuneNamiheInstList                                          ;A8974F;
    LDA.W #RTS_A8978E                                                    ;A89752;
    STA.W FuneNamihe.function,X                                          ;A89755;
    STZ.W FuneNamihe.cooldownTimer,X                                     ;A89758;

  .return:
    RTS                                                                  ;A8975B;


;;; $975C: Fune / namihe function - wait for Samus to get near (namihe) ;;;
Function_Namihe_WaitForSamusToGetNear:
    LDX.W EnemyIndex                                                     ;A8975C;
    LDA.W FuneNamihe.instListPointersPointer,X                           ;A8975F;
    STA.L ExtraEnemy7800,X                                               ;A89762;
    JSR.W Namihe_CheckIfSamusIsInProximity                               ;A89766;
    BEQ .notInProximity                                                  ;A89769;
    LDA.L ExtraEnemy7800,X                                               ;A8976B;
    STA.W FuneNamihe.instListPointersPointer,X                           ;A8976F;
    DEC                                                                  ;A89772;
    DEC                                                                  ;A89773;
    DEC                                                                  ;A89774;
    DEC                                                                  ;A89775;
    STA.L ExtraEnemy7800,X                                               ;A89776;
    STA.W FuneNamihe.instListPointersPointer,X                           ;A8977A;
    JSR.W SetFuneNamiheInstList                                          ;A8977D;
    LDA.W #RTS_A8978F                                                    ;A89780;
    STA.W FuneNamihe.function,X                                          ;A89783;

  .notInProximity:
    LDA.L ExtraEnemy7800,X                                               ;A89786;
    STA.W FuneNamihe.instListPointersPointer,X                           ;A8978A;
    RTS                                                                  ;A8978D;


;;; $978E: RTS ;;;
RTS_A8978E:
    RTS                                                                  ;A8978E;


;;; $978F: RTS ;;;
RTS_A8978F:
    RTS                                                                  ;A8978F;


;;; $9790: Check if Samus is in proximity ;;;
Namihe_CheckIfSamusIsInProximity:
;; Returns:
;;     Zero: Clear if Samus is in proximity, set otherwise
    LDX.W EnemyIndex                                                     ;A89790;
    LDA.W FuneNamihe.YProximity,X                                        ;A89793;
    JSL.L IsSamusWithingAPixelRowsOfEnemy                                ;A89796;
    RTS                                                                  ;A8979A;


;;; $979B: Set fune / namihe instruction list ;;;
SetFuneNamiheInstList:
    LDX.W EnemyIndex                                                     ;A8979B;
    LDA.W #$0001                                                         ;A8979E;
    STA.W Enemy.instTimer,X                                              ;A897A1;
    STZ.W Enemy.loopCounter,X                                            ;A897A4;
    LDA.W FuneNamihe.instListPointersPointer,X                           ;A897A7;
    TAY                                                                  ;A897AA;
    LDA.W $0000,Y                                                        ;A897AB;
    STA.W Enemy.instList,X                                               ;A897AE;
    RTS                                                                  ;A897B1;


;;; $97B2: RTL ;;;
RTL_A897B2:
    RTL                                                                  ;A897B2;


;;; $97B3: RTL ;;;
RTL_A897B3:
    RTL                                                                  ;A897B3;


;;; $97B4: Namihe spritemaps ;;;
Spritemap_Namihe_FacingLeft_Idle_MouthEyeOpened:
    dw $0008                                                             ;A897B4;
    %spritemapEntry(0, $08, $0C, 0, 0, 2, 0, $127)
    %spritemapEntry(0, $00, $0C, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $00, $FC, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $00, $EC, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $106)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 0, $135)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $134)
    %spritemapEntry(1, $1F0, $EC, 0, 0, 2, 0, $104)

Spritemap_Namihe_FacingLeft_EyeOpened:
    dw $0008                                                             ;A897DE;
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $106)
    %spritemapEntry(0, $1F8, $EC, 0, 0, 2, 0, $105)
    %spritemapEntry(0, $1F0, $EC, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1F0, $F4, 0, 0, 2, 0, $108)
    %spritemapEntry(0, $08, $0C, 0, 0, 2, 0, $127)
    %spritemapEntry(0, $00, $0C, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $00, $FC, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $00, $EC, 0, 0, 2, 0, $120)

Spritemap_Namihe_FacingLeft_StartOpeningMouth:
    dw $0008                                                             ;A89808;
    %spritemapEntry(1, $1EE, $02, 0, 0, 2, 0, $106)
    %spritemapEntry(0, $1F6, $EC, 0, 0, 2, 0, $105)
    %spritemapEntry(0, $1EE, $EC, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1EE, $F4, 0, 0, 2, 0, $108)
    %spritemapEntry(0, $06, $0C, 0, 0, 2, 0, $127)
    %spritemapEntry(0, $1FE, $0C, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1FE, $FC, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1FE, $EC, 0, 0, 2, 0, $120)

Spritemap_Namihe_FacingLeft_MouthOpening1:
    dw $0008                                                             ;A89832;
    %spritemapEntry(1, $1EC, $03, 0, 0, 2, 0, $106)
    %spritemapEntry(0, $1F4, $EC, 0, 0, 2, 0, $105)
    %spritemapEntry(0, $1EC, $EC, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1EC, $F4, 0, 0, 2, 0, $108)
    %spritemapEntry(0, $04, $0C, 0, 0, 2, 0, $127)
    %spritemapEntry(0, $1FC, $0C, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1FC, $FC, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1FC, $EC, 0, 0, 2, 0, $120)

Spritemap_Namihe_FacingLeft_MouthOpening2:
    dw $0008                                                             ;A8985C;
    %spritemapEntry(1, $1EA, $04, 0, 0, 2, 0, $106)
    %spritemapEntry(0, $1F2, $EC, 0, 0, 2, 0, $105)
    %spritemapEntry(0, $1EA, $EC, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1EA, $F4, 0, 0, 2, 0, $108)
    %spritemapEntry(0, $02, $0C, 0, 0, 2, 0, $127)
    %spritemapEntry(0, $1FA, $0C, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1FA, $FC, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1FA, $EC, 0, 0, 2, 0, $120)

Spritemap_Namihe_FacingLeft_MouthMostOpen:
    dw $0008                                                             ;A89886;
    %spritemapEntry(1, $1E9, $05, 0, 0, 2, 0, $106)
    %spritemapEntry(0, $1F0, $EC, 0, 0, 2, 0, $105)
    %spritemapEntry(0, $1E8, $EC, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1E8, $F4, 0, 0, 2, 0, $108)
    %spritemapEntry(0, $00, $0C, 0, 0, 2, 0, $127)
    %spritemapEntry(0, $1F8, $0C, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1F8, $FC, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1F8, $EC, 0, 0, 2, 0, $120)

Spritemap_Namihe_FacingRight_Idle_MouthEyeClosed:
    dw $0008                                                             ;A898B0;
    %spritemapEntry(0, $1F0, $0C, 0, 1, 2, 0, $127)
    %spritemapEntry(0, $1F8, $0C, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $1F0, $FC, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $1F0, $EC, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $00, $00, 0, 1, 2, 0, $106)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 0, $135)
    %spritemapEntry(0, $08, $FC, 0, 1, 2, 0, $134)
    %spritemapEntry(1, $00, $EC, 0, 1, 2, 0, $104)

Spritemap_Namihe_FacingRight_EyeOpened:
    dw $0008                                                             ;A898DA;
    %spritemapEntry(1, $00, $00, 0, 1, 2, 0, $106)
    %spritemapEntry(0, $00, $EC, 0, 1, 2, 0, $105)
    %spritemapEntry(0, $08, $EC, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $00, $F4, 0, 1, 2, 0, $108)
    %spritemapEntry(0, $1F0, $0C, 0, 1, 2, 0, $127)
    %spritemapEntry(0, $1F8, $0C, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $1F0, $FC, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $1F0, $EC, 0, 1, 2, 0, $120)

Spritemap_Namihe_FacingRight_StartOpeningMouth:
    dw $0008                                                             ;A89904;
    %spritemapEntry(1, $02, $02, 0, 1, 2, 0, $106)
    %spritemapEntry(0, $02, $EC, 0, 1, 2, 0, $105)
    %spritemapEntry(0, $0A, $EC, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $02, $F4, 0, 1, 2, 0, $108)
    %spritemapEntry(0, $1F2, $0C, 0, 1, 2, 0, $127)
    %spritemapEntry(0, $1FA, $0C, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $1F2, $FC, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $1F2, $EC, 0, 1, 2, 0, $120)

Spritemap_Namihe_FacingRight_MouthOpening1:
    dw $0008                                                             ;A8992E;
    %spritemapEntry(1, $04, $03, 0, 1, 2, 0, $106)
    %spritemapEntry(0, $04, $EC, 0, 1, 2, 0, $105)
    %spritemapEntry(0, $0C, $EC, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $04, $F4, 0, 1, 2, 0, $108)
    %spritemapEntry(0, $1F4, $0C, 0, 1, 2, 0, $127)
    %spritemapEntry(0, $1FC, $0C, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $1F4, $FC, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $1F4, $EC, 0, 1, 2, 0, $120)

Spritemap_Namihe_FacingRight_MouthOpening2:
    dw $0008                                                             ;A89958;
    %spritemapEntry(1, $06, $04, 0, 1, 2, 0, $106)
    %spritemapEntry(0, $06, $EC, 0, 1, 2, 0, $105)
    %spritemapEntry(0, $0E, $EC, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $06, $F4, 0, 1, 2, 0, $108)
    %spritemapEntry(0, $1F6, $0C, 0, 1, 2, 0, $127)
    %spritemapEntry(0, $1FE, $0C, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $1F6, $FC, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $1F6, $EC, 0, 1, 2, 0, $120)

Spritemap_Namihe_FacingRight_MouthMostOpen:
    dw $0008                                                             ;A89982;
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
    dw $3800,$57FF,$42F7,$0929,$00A5,$4F5A,$36B5,$2610                   ;A899AC;
    dw $1DCE,$01DF,$001F,$0018,$000A,$06B9,$00EA,$0045                   ;A899BC;


if !FEATURE_KEEP_UNREFERENCED
;;; $99CC: Unused. Black palettes ;;;
UNUSED_Coven_BlackPalettes_A899CC:
    dw $3800,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;A899CC;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;A899DC;
    dw $3800,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;A899EC;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;A899FC;
    dw $3800,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;A89A0C;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;A89A1C;
    dw $3800,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;A89A2C;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;A89A3C;
    dw $3800,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;A89A4C;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;A89A5C;
    dw $3800,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;A89A6C;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;A89A7C;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $9A8C: Instruction list - coven ;;;
InstList_Coven:
    dw $0010,Spritemap_Coven_0                                           ;A89A8C;
    dw $0010,Spritemap_Coven_1                                           ;A89A90;
    dw $0010,Spritemap_Coven_2                                           ;A89A94;
    dw Common_Instruction_GotoY                                          ;A89A98;
    dw InstList_Coven                                                    ;A89A9A;


CovenConstants:
  .SamusMovementCounterThreshold:
; Number of times Samus has to move in the same direction to materialise
    dw $0010                                                             ;A89A9C;

  .SamusStationaryFramesThreshold:
; Number of frames Samus has to remain stationary to materialise
    dw $0040                                                             ;A89A9E;

  .HoveringYAccelerationDeceleration:
; Hovering Y acceleration/deceleration
    dw $1800                                                             ;A89AA0;

  .InitialHoveringYVelocity:
; Initial hovering Y velocity
    dw $0001                                                             ;A89AA2;

  .SleepTimer:
; Number of frames to sleep after dematerialising
    dw $0078                                                             ;A89AA4;

  .MaterializeTimer:
; Number of frames to be materialised for
    dw $0078                                                             ;A89AA6;

  .OffsetsFromSamusToMaterialize:
; X/Y offsets from Samus position to materialise when Samus has been moving a given direction
  ..X:
    dw $FFC0                                                             ;A89AA8;
  ..Y:                                                                   ;A89AAA;
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
    dw $0001,$0008,$0001,$0008,$0001,$0007,$0001,$0007                   ;A89ACC;
    dw $0002,$0006,$0002,$0006,$0003,$0005,$0003,$0005                   ;A89ADC;
    dw $FFFF                                                             ;A89AEC;


;;; $9AEE: Initialisation AI - enemy $E77F (coven) ;;;
InitAI_Coven:
    LDX.W EnemyIndex                                                     ;A89AEE;
    LDA.W Enemy.properties,X                                             ;A89AF1;
    ORA.W #$2500                                                         ;A89AF4;
    STA.W Enemy.properties,X                                             ;A89AF7;
    LDA.W #$0001                                                         ;A89AFA;
    STA.W Enemy.instTimer,X                                              ;A89AFD;
    STZ.W Enemy.loopCounter,X                                            ;A89B00;
    LDA.W #InstList_Coven                                                ;A89B03;
    STA.W Enemy.instList,X                                               ;A89B06;
    LDA.W #Function_Coven_Dematerialized_Asleep                          ;A89B09;
    STA.W Coven.function,X                                               ;A89B0C;
    LDA.W CovenConstants_SleepTimer                                      ;A89B0F;
    CLC                                                                  ;A89B12;
    ADC.W #$00A0                                                         ;A89B13;
    STA.W Coven.functionTimer,X                                          ;A89B16;
    LDX.W EnemyIndex                                                     ;A89B19;
    LDA.W Enemy.palette,X                                                ;A89B1C;
    XBA                                                                  ;A89B1F;
    ASL                                                                  ;A89B20;
    ASL                                                                  ;A89B21;
    ASL                                                                  ;A89B22;
    ASL                                                                  ;A89B23;
    CLC                                                                  ;A89B24;
    ADC.W #$0100                                                         ;A89B25;
    TAX                                                                  ;A89B28;
    LDA.W #$0010                                                         ;A89B29;
    STA.B DP_Temp12                                                      ;A89B2C;
    LDA.W #$0000                                                         ;A89B2E;

  .loop:
    STA.L TargetPalettes_BGP0,X                                          ;A89B31;
    INX                                                                  ;A89B35;
    INX                                                                  ;A89B36;
    DEC.B DP_Temp12                                                      ;A89B37;
    BPL .loop                                                            ;A89B39;
    RTL                                                                  ;A89B3B;


;;; $9B3C: Main AI - enemy $E77F (coven) ;;;
MainAI_Coven:
    LDX.W EnemyIndex                                                     ;A89B3C;
    JMP.W (Coven.function,X)                                             ;A89B3F;


;;; $9B42: Coven function - materialising - fade to white ;;;
Function_Coven_Materialize_FadeToWhite:
; You only see this fade to white transition once where it transitions from the initial black palette
; On subsequent calls to this function, it will already have a white palette from the dematerialisation fade to white
    PHX                                                                  ;A89B42;
    JSR.W HandleFadeInTimerAndIndex                                      ;A89B43;
    LDY.W #$0010                                                         ;A89B46;
    LDX.W EnemyIndex                                                     ;A89B49;
    LDA.W Enemy.palette,X                                                ;A89B4C;
    XBA                                                                  ;A89B4F;
    ASL                                                                  ;A89B50;
    ASL                                                                  ;A89B51;
    ASL                                                                  ;A89B52;
    ASL                                                                  ;A89B53;
    CLC                                                                  ;A89B54;
    ADC.W #$0100                                                         ;A89B55;
    TAX                                                                  ;A89B58;
    LDA.W #$0010                                                         ;A89B59;
    STA.B DP_Temp12                                                      ;A89B5C;

  .loopUpper:
    LDA.L Palettes,X                                                     ;A89B5E;
    AND.W #$001F                                                         ;A89B62;
    CMP.W #$001F                                                         ;A89B65;
    BPL .next                                                            ;A89B68;
    LDA.L Palettes,X                                                     ;A89B6A;
    CLC                                                                  ;A89B6E;
    ADC.W #$0421                                                         ;A89B6F;
    STA.L Palettes,X                                                     ;A89B72;
    DEY                                                                  ;A89B76;

  .next:
    INX                                                                  ;A89B77;
    INX                                                                  ;A89B78;
    DEC.B DP_Temp12                                                      ;A89B79;
    BNE .loopUpper                                                       ;A89B7B;
    CPY.W #$0010                                                         ;A89B7D;
    BMI .return                                                          ;A89B80;
    LDX.W EnemyIndex                                                     ;A89B82;
    LDA.W #Function_Coven_Materialize_FadeFromWhite                      ;A89B85;
    STA.W Coven.function,X                                               ;A89B88;
    LDA.W Enemy.palette,X                                                ;A89B8B;
    XBA                                                                  ;A89B8E;
    ASL                                                                  ;A89B8F;
    ASL                                                                  ;A89B90;
    ASL                                                                  ;A89B91;
    ASL                                                                  ;A89B92;
    CLC                                                                  ;A89B93;
    ADC.W #$0100                                                         ;A89B94;
    TAX                                                                  ;A89B97;
    LDY.W #$0000                                                         ;A89B98;

  .loopLower:
    LDA.W Palette_Coven,Y                                                ;A89B9B;
    STA.L TargetPalettes_BGP0,X                                          ;A89B9E;
    INX                                                                  ;A89BA2;
    INX                                                                  ;A89BA3;
    INY                                                                  ;A89BA4;
    INY                                                                  ;A89BA5;
    CPY.W #$0020                                                         ;A89BA6;
    BMI .loopLower                                                       ;A89BA9;

  .return:
    PLX                                                                  ;A89BAB;
    RTL                                                                  ;A89BAC;


;;; $9BAD: Coven function - materialising - fade from white ;;;
Function_Coven_Materialize_FadeFromWhite:
    JSR.W AdvanceCovenPaletteTransition                                  ;A89BAD;
    PHA                                                                  ;A89BB0;
    LDX.W EnemyIndex                                                     ;A89BB1;
    JSR.W HandleFadeInTimerAndIndex                                      ;A89BB4;
    PLA                                                                  ;A89BB7;
    ORA.W Coven.functionTimer,X                                          ;A89BB8;
    BNE .return                                                          ;A89BBB;
    LDA.W Enemy.properties,X                                             ;A89BBD;
    AND.W #$FBFF                                                         ;A89BC0; >.< #$FAFF
    AND.W #$FEFF                                                         ;A89BC3;
    STA.W Enemy.properties,X                                             ;A89BC6;
    LDA.W #Function_Coven_Materialized                                   ;A89BC9;
    STA.W Coven.function,X                                               ;A89BCC;
    LDA.W Enemy.YPosition,X                                              ;A89BCF;
    STA.L Coven.hoverCenterYPosition,X                                   ;A89BD2;
    LDA.W #$0001                                                         ;A89BD6;
    STA.W Coven.functionTimer,X                                          ;A89BD9;
    LDA.W #$0002                                                         ;A89BDC;
    STA.W Coven.paletteTransitionDelayIndex,X                            ;A89BDF;
    LDA.W #$0000                                                         ;A89BE2;
    STA.L Coven.YSubVelocity,X                                           ;A89BE5;
    LDA.W CovenConstants_InitialHoveringYVelocity                        ;A89BE9;
    STA.L Coven.YVelocity,X                                              ;A89BEC;
    LDA.W CovenConstants_MaterializeTimer                                ;A89BF0;
    STA.W Coven.functionTimer,X                                          ;A89BF3;
    LDA.W #$0004                                                         ;A89BF6;
    STA.L Coven.previousSamusXMovementDirection,X                        ;A89BF9;
    LDA.W SamusXPosition                                                 ;A89BFD;
    STA.L Coven.previousSamusXPosition,X                                 ;A89C00;
    STA.L Coven.zoneLeftPosition,X                                       ;A89C04;
    STA.L Coven.zoneRightPosition,X                                      ;A89C08;
    LDA.W #$000C                                                         ;A89C0C;
    STA.L Coven.previousSamusYMovementDirection,X                        ;A89C0F;
    LDA.W SamusYPosition,X                                               ;A89C13;
    STA.L Coven.previousSamusYPosition,X                                 ;A89C16;
    STA.L Coven.zoneTopPosition,X                                        ;A89C1A;
    STA.L Coven.zoneBottomPosition,X                                     ;A89C1E;
    LDA.W CovenConstants_SamusStationaryFramesThreshold                  ;A89C22;
    STA.L Coven.lockOnTimer,X                                            ;A89C25;
    LDA.W CovenConstants_SamusMovementCounterThreshold                   ;A89C29;
    STA.L Coven.directedMovementTimer,X                                  ;A89C2C;

  .return:
    RTL                                                                  ;A89C30;


;;; $9C31: Process coven palette transition delay ;;;
HandleFadeInTimerAndIndex:
    LDA.W Coven.functionTimer,X                                          ;A89C31;
    BEQ .timerExpired                                                    ;A89C34;
    DEC                                                                  ;A89C36;
    STA.W Coven.functionTimer,X                                          ;A89C37;
    BNE .return                                                          ;A89C3A;
    LDA.W Coven.paletteTransitionDelayIndex,X                            ;A89C3C;
    TAY                                                                  ;A89C3F;
    LDA.W CovenPaletteTransitionDelayTable,Y                             ;A89C40;
    BMI .terminator                                                      ;A89C43;
    STA.W Coven.functionTimer,X                                          ;A89C45;
    TYA                                                                  ;A89C48;
    INC                                                                  ;A89C49;
    INC                                                                  ;A89C4A;
    STA.W Coven.paletteTransitionDelayIndex,X                            ;A89C4B;
    TYA                                                                  ;A89C4E;
    BIT.W #$0002                                                         ;A89C4F;
    BEQ .timerExpired                                                    ;A89C52;

  .return:
    RTS                                                                  ;A89C54;

  .timerExpired:
    LDA.W Enemy.properties,X                                             ;A89C55;
    AND.W #$FEFF                                                         ;A89C58;
    STA.W Enemy.properties,X                                             ;A89C5B;
    RTS                                                                  ;A89C5E;

  .terminator:
    LDA.W #$0000                                                         ;A89C5F;
    STA.W Coven.functionTimer,X                                          ;A89C62;
    STA.W Coven.paletteTransitionDelayIndex,X                            ;A89C65;
    RTS                                                                  ;A89C68;


;;; $9C69: Coven function - dematerialising ;;;
Function_Coven_Dematerializing:
    JSR.W AdvanceCovenPaletteTransition                                  ;A89C69;
    CMP.W #$0000                                                         ;A89C6C;
    BNE .return                                                          ;A89C6F;
    LDX.W EnemyIndex                                                     ;A89C71;
    LDA.W #Function_Coven_Dematerialized_Asleep                          ;A89C74;
    STA.W Coven.function,X                                               ;A89C77;
    LDA.W Enemy.properties,X                                             ;A89C7A;
    ORA.W #$0100                                                         ;A89C7D;
    STA.W Enemy.properties,X                                             ;A89C80;
    LDA.W CovenConstants_SleepTimer                                      ;A89C83;
    STA.W Coven.functionTimer,X                                          ;A89C86;

  .return:
    RTL                                                                  ;A89C89;


;;; $9C8A: Coven function - materialised ;;;
Function_Coven_Materialized:
    LDA.W Enemy.YSubPosition,X                                           ;A89C8A;
    CLC                                                                  ;A89C8D;
    ADC.L Coven.YSubVelocity,X                                           ;A89C8E;
    STA.W Enemy.YSubPosition,X                                           ;A89C92;
    LDA.W Enemy.YPosition,X                                              ;A89C95;
    ADC.L Coven.YVelocity,X                                              ;A89C98;
    STA.W Enemy.YPosition,X                                              ;A89C9C;
    LDA.W Enemy.YPosition,X                                              ;A89C9F;
    CMP.L Coven.hoverCenterYPosition,X                                   ;A89CA2;
    BMI .subvelocity                                                     ;A89CA6;
    LDA.L Coven.YSubVelocity,X                                           ;A89CA8;
    SEC                                                                  ;A89CAC;
    SBC.W CovenConstants_HoveringYAccelerationDeceleration               ;A89CAD;
    STA.L Coven.YSubVelocity,X                                           ;A89CB0;
    LDA.L Coven.YVelocity,X                                              ;A89CB4;
    SBC.W #$0000                                                         ;A89CB8;
    STA.L Coven.YVelocity,X                                              ;A89CBB;
    BRA +                                                                ;A89CBF;

  .subvelocity:
    LDA.L Coven.YSubVelocity,X                                           ;A89CC1;
    CLC                                                                  ;A89CC5;
    ADC.W CovenConstants_HoveringYAccelerationDeceleration               ;A89CC6;
    STA.L Coven.YSubVelocity,X                                           ;A89CC9;
    LDA.L Coven.YVelocity,X                                              ;A89CCD;
    ADC.W #$0000                                                         ;A89CD1;
    STA.L Coven.YVelocity,X                                              ;A89CD4;

+   LDA.W Coven.functionTimer,X                                          ;A89CD8;
    DEC                                                                  ;A89CDB;
    STA.W Coven.functionTimer,X                                          ;A89CDC;
    BNE .return                                                          ;A89CDF;
    LDA.W #Function_Coven_Dematerializing                                ;A89CE1;
    STA.W Coven.function,X                                               ;A89CE4;
    LDA.W Enemy.properties,X                                             ;A89CE7;
    ORA.W #$0400                                                         ;A89CEA;
    STA.W Enemy.properties,X                                             ;A89CED;
    LDX.W EnemyIndex                                                     ;A89CF0;
    LDA.W Enemy.palette,X                                                ;A89CF3;
    XBA                                                                  ;A89CF6;
    ASL                                                                  ;A89CF7;
    ASL                                                                  ;A89CF8;
    ASL                                                                  ;A89CF9;
    ASL                                                                  ;A89CFA;
    CLC                                                                  ;A89CFB;
    ADC.W #$0100                                                         ;A89CFC;
    TAX                                                                  ;A89CFF;
    LDA.W #$0010                                                         ;A89D00;
    STA.B DP_Temp12                                                      ;A89D03;
    LDA.W #$7FFF                                                         ;A89D05;

  .loop:
    STA.L TargetPalettes_BGP0,X                                          ;A89D08;
    INX                                                                  ;A89D0C;
    INX                                                                  ;A89D0D;
    DEC.B DP_Temp12                                                      ;A89D0E;
    BPL .loop                                                            ;A89D10;

  .return:
    RTL                                                                  ;A89D12;


;;; $9D13: Coven function - dematerialised - asleep ;;;
Function_Coven_Dematerialized_Asleep:
    LDA.W Coven.functionTimer,X                                          ;A89D13;
    BEQ .timerExpired                                                    ;A89D16;
    DEC                                                                  ;A89D18;
    STA.W Coven.functionTimer,X                                          ;A89D19;
    BNE .return                                                          ;A89D1C;

  .timerExpired:
    LDA.W #$0001                                                         ;A89D1E;
    STA.W Coven.functionTimer,X                                          ;A89D21;
    LDA.W #$0002                                                         ;A89D24;
    STA.W Coven.paletteTransitionDelayIndex,X                            ;A89D27;
    LDA.W #Function_Coven_Dematerialized_Awake                           ;A89D2A;
    STA.W Coven.function,X                                               ;A89D2D;

  .return:
    RTL                                                                  ;A89D30;


;;; $9D31: RTL ;;;
RTL_A89D31:
    RTL                                                                  ;A89D31;


;;; $9D32: Coven stationary zone radii ;;;
; Number of pixels of tolerance to consider Samus stationary for the materialisation check
CovenStationaryZoneXRadius:
    dw $0001                                                             ;A89D32;

CovenStationaryZoneYRadius:
    dw $0001                                                             ;A89D34;


;;; $9D36: Coven function - dematerialised - awake ;;;
Function_Coven_Dematerialized_Awake:
; The Samus position loads at $9D45 / $9DC3 / $9DCD are erroneously being indexed by X, which is the enemy index
; Consequently, this code has unexpected results if the enemy is not enemy slot 0

; Materialise if Samus has moved at most 1px/frame for 40h frames (tracked by the "lock-on timer" and "zone" variables)
; or has moved more than 1px/frame in the same direction 10h times (tracked by the "directed movement timer" and "previous Samus" variables)
    LDA.W SamusXPosition                                                 ;A89D36;
    CMP.L Coven.zoneLeftPosition,X                                       ;A89D39;
    BMI .breakLockOn                                                     ;A89D3D;
    CMP.L Coven.zoneRightPosition,X                                      ;A89D3F;
    BPL .breakLockOn                                                     ;A89D43;
    LDA.W SamusYPosition,X                                               ;A89D45;
    CMP.L Coven.zoneTopPosition,X                                        ;A89D48;
    BMI .breakLockOn                                                     ;A89D4C;
    CMP.L Coven.zoneBottomPosition,X                                     ;A89D4E;
    BPL .breakLockOn                                                     ;A89D52;
    LDA.L Coven.lockOnTimer,X                                            ;A89D54;
    DEC                                                                  ;A89D58;
    STA.L Coven.lockOnTimer,X                                            ;A89D59;
    BEQ +                                                                ;A89D5D;
    JMP.W .updateZone                                                    ;A89D5F;

+   LDA.W #$0004                                                         ;A89D62;
    STA.L Coven.previousSamusXMovementDirection,X                        ;A89D65;
    LDA.W #$000C                                                         ;A89D69;
    STA.L Coven.previousSamusYMovementDirection,X                        ;A89D6C;
    BRA .materialize                                                     ;A89D70;

  .breakLockOn:
    LDA.W CovenConstants_SamusStationaryFramesThreshold                  ;A89D72;
    STA.L Coven.lockOnTimer,X                                            ;A89D75;
    LDY.W #$0000                                                         ;A89D79;
    LDA.W SamusXPosition                                                 ;A89D7C;
    SEC                                                                  ;A89D7F;
    SBC.L Coven.previousSamusXPosition,X                                 ;A89D80;
    BMI .checkXMovementDirection                                         ;A89D84;
    BEQ .noXMovement                                                     ;A89D86;
    LDY.W #$0008                                                         ;A89D88;
    BRA .checkXMovementDirection                                         ;A89D8B;

  .noXMovement:
    LDY.W #$0004                                                         ;A89D8D;

  .checkXMovementDirection:
    TYA                                                                  ;A89D90;
    CMP.L Coven.previousSamusXMovementDirection,X                        ;A89D91;
    BEQ .checkYMovement                                                  ;A89D95;
    TYA                                                                  ;A89D97;
    STA.L Coven.previousSamusXMovementDirection,X                        ;A89D98;
    LDA.W CovenConstants_SamusMovementCounterThreshold                   ;A89D9C;
    STA.L Coven.directedMovementTimer,X                                  ;A89D9F;
    BRA .updateZone                                                      ;A89DA3;

  .materialize:
    LDA.W #Function_Coven_Materialize_FadeToWhite                        ;A89DA5;
    STA.W Coven.function,X                                               ;A89DA8;
    LDA.W CovenConstants_SamusStationaryFramesThreshold                  ;A89DAB;
    STA.L Coven.lockOnTimer,X                                            ;A89DAE;
    LDA.W CovenConstants_SamusMovementCounterThreshold                   ;A89DB2;
    STA.L Coven.directedMovementTimer,X                                  ;A89DB5;
    LDA.L Coven.previousSamusXMovementDirection,X                        ;A89DB9;
    CLC                                                                  ;A89DBD;
    ADC.L Coven.previousSamusYMovementDirection,X                        ;A89DBE;
    TAY                                                                  ;A89DC2;
    LDA.W SamusXPosition,X                                               ;A89DC3;
    CLC                                                                  ;A89DC6;
    ADC.W CovenConstants_OffsetsFromSamusToMaterialize_X,Y               ;A89DC7;
    STA.W Enemy.XPosition,X                                              ;A89DCA;
    LDA.W SamusYPosition,X                                               ;A89DCD;
    CLC                                                                  ;A89DD0;
    ADC.W CovenConstants_OffsetsFromSamusToMaterialize_Y,Y               ;A89DD1;
    STA.W Enemy.YPosition,X                                              ;A89DD4;
    RTL                                                                  ;A89DD7;

  .checkYMovement:
    LDY.W #$0000                                                         ;A89DD8;
    LDA.W SamusYPosition                                                 ;A89DDB;
    SEC                                                                  ;A89DDE;
    SBC.L Coven.previousSamusYPosition,X                                 ;A89DDF;
    BMI .checkYMovementDirection                                         ;A89DE3;
    BEQ .noYMovement                                                     ;A89DE5;
    LDY.W #$0018                                                         ;A89DE7;
    BRA .checkYMovementDirection                                         ;A89DEA;

  .noYMovement:
    LDY.W #$000C                                                         ;A89DEC;

  .checkYMovementDirection:
    TYA                                                                  ;A89DEF;
    CMP.L Coven.previousSamusYMovementDirection,X                        ;A89DF0;
    BEQ .matchingYMovementDirection                                      ;A89DF4;
    TYA                                                                  ;A89DF6;
    STA.L Coven.previousSamusYMovementDirection,X                        ;A89DF7;
    LDA.W CovenConstants_SamusMovementCounterThreshold                   ;A89DFB;
    STA.L Coven.directedMovementTimer,X                                  ;A89DFE;
    BRA .updateZone                                                      ;A89E02;

  .matchingYMovementDirection:
    LDA.L Coven.directedMovementTimer,X                                  ;A89E04;
    DEC                                                                  ;A89E08;
    STA.L Coven.directedMovementTimer,X                                  ;A89E09;
    BEQ .materialize                                                     ;A89E0D;

  .updateZone:
    LDA.W SamusXPosition                                                 ;A89E0F;
    STA.L Coven.previousSamusXPosition,X                                 ;A89E12;
    SEC                                                                  ;A89E16;
    SBC.W CovenStationaryZoneXRadius                                     ;A89E17;
    STA.L Coven.zoneLeftPosition,X                                       ;A89E1A;
    LDA.W SamusXPosition                                                 ;A89E1E;
    CLC                                                                  ;A89E21;
    ADC.W CovenStationaryZoneXRadius                                     ;A89E22;
    STA.L Coven.zoneRightPosition,X                                      ;A89E25;
    LDA.W SamusYPosition                                                 ;A89E29;
    STA.L Coven.previousSamusYPosition,X                                 ;A89E2C;
    SEC                                                                  ;A89E30;
    SBC.W CovenStationaryZoneYRadius                                     ;A89E31;
    STA.L Coven.zoneTopPosition,X                                        ;A89E34;
    LDA.W SamusYPosition                                                 ;A89E38;
    CLC                                                                  ;A89E3B;
    ADC.W CovenStationaryZoneYRadius                                     ;A89E3C;
    STA.L Coven.zoneBottomPosition,X                                     ;A89E3F;
    RTL                                                                  ;A89E43;


;;; $9E44: RTL ;;;
RTL_A89E44:
    RTL                                                                  ;A89E44;


;;; $9E45: RTL ;;;
RTL_A89E45:
    RTL                                                                  ;A89E45;


;;; $9E46: Coven spritemaps ;;;
Spritemap_Coven_0:
    dw $0004                                                             ;A89E46;
    %spritemapEntry(1, $00, $00, 0, 0, 3, 0, $106)
    %spritemapEntry(1, $1F0, $00, 0, 0, 3, 0, $104)
    %spritemapEntry(1, $00, $F0, 0, 0, 3, 0, $102)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 3, 0, $100)

Spritemap_Coven_1:
    dw $0004                                                             ;A89E5C;
    %spritemapEntry(1, $00, $00, 0, 0, 3, 0, $10A)
    %spritemapEntry(1, $1F0, $00, 0, 0, 3, 0, $108)
    %spritemapEntry(1, $00, $F0, 0, 0, 3, 0, $102)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 3, 0, $100)

Spritemap_Coven_2:
    dw $0004                                                             ;A89E72;
    %spritemapEntry(1, $00, $00, 0, 0, 3, 0, $10E)
    %spritemapEntry(1, $1F0, $00, 0, 0, 3, 0, $10C)
    %spritemapEntry(1, $00, $F0, 0, 0, 3, 0, $102)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 3, 0, $100)


;;; $9E88: Advance coven palette transition ;;;
AdvanceCovenPaletteTransition:
;; Returns:
;;     A: Zero if completed transition, non-zero otherwise
    PHP                                                                  ;A89E88;
    PHX                                                                  ;A89E89;
    PHY                                                                  ;A89E8A;
    REP #$30                                                             ;A89E8B;
    LDY.W #$0000                                                         ;A89E8D;
    LDA.W DoorTransitionFlagEnemiesPause                                 ;A89E90;
    BEQ .notDoorTransition                                               ;A89E93;
    JMP.W .return                                                        ;A89E95;

  .notDoorTransition:
    LDX.W EnemyIndex                                                     ;A89E98;
    LDA.W Enemy.palette,X                                                ;A89E9B;
    XBA                                                                  ;A89E9E;
    ASL                                                                  ;A89E9F;
    ASL                                                                  ;A89EA0;
    ASL                                                                  ;A89EA1;
    ASL                                                                  ;A89EA2;
    CLC                                                                  ;A89EA3;
    ADC.W #$0100                                                         ;A89EA4;
    TAX                                                                  ;A89EA7;
    CLC                                                                  ;A89EA8;
    ADC.W #$0020                                                         ;A89EA9;
    STA.B DP_Temp14                                                      ;A89EAC;

  .loop:
    LDA.L TargetPalettes_BGP0,X                                          ;A89EAE;
    CMP.L Palettes,X                                                     ;A89EB2;
    BNE .notReachedTarget                                                ;A89EB6;
    JMP.W .next                                                          ;A89EB8;

  .notReachedTarget:
    AND.W #$001F                                                         ;A89EBB;
    STA.B DP_Temp12                                                      ;A89EBE;
    LDA.L Palettes,X                                                     ;A89EC0;
    AND.W #$001F                                                         ;A89EC4;
    CMP.B DP_Temp12                                                      ;A89EC7;
    BEQ .redEnd                                                          ;A89EC9;
    BPL .notReachedRedTarget                                             ;A89ECB;
    INC                                                                  ;A89ECD;
    BRA +                                                                ;A89ECE;

  .notReachedRedTarget:
    DEC                                                                  ;A89ED0;

+   STA.B DP_Temp12                                                      ;A89ED1;
    LDA.L Palettes,X                                                     ;A89ED3;
    AND.W #$FFE0                                                         ;A89ED7;
    ORA.B DP_Temp12                                                      ;A89EDA;
    STA.L Palettes,X                                                     ;A89EDC;
    INY                                                                  ;A89EE0;

  .redEnd:
    LDA.L TargetPalettes_BGP0,X                                          ;A89EE1;
    AND.W #$03E0                                                         ;A89EE5;
    STA.B DP_Temp12                                                      ;A89EE8;
    LDA.L Palettes,X                                                     ;A89EEA;
    AND.W #$03E0                                                         ;A89EEE;
    CMP.B DP_Temp12                                                      ;A89EF1;
    BEQ .greenEnd                                                        ;A89EF3;
    BPL .notReachedGreenTarget                                           ;A89EF5;
    CLC                                                                  ;A89EF7;
    ADC.W #$0020                                                         ;A89EF8;
    BRA +                                                                ;A89EFB;

  .notReachedGreenTarget:
    SEC                                                                  ;A89EFD;
    SBC.W #$0020                                                         ;A89EFE;

+   STA.B DP_Temp12                                                      ;A89F01;
    LDA.L Palettes,X                                                     ;A89F03;
    AND.W #$FC1F                                                         ;A89F07;
    ORA.B DP_Temp12                                                      ;A89F0A;
    STA.L Palettes,X                                                     ;A89F0C;
    INY                                                                  ;A89F10;

  .greenEnd:
    LDA.L TargetPalettes_BGP0,X                                          ;A89F11;
    AND.W #$7C00                                                         ;A89F15;
    STA.B DP_Temp12                                                      ;A89F18;
    LDA.L Palettes,X                                                     ;A89F1A;
    AND.W #$7C00                                                         ;A89F1E;
    CMP.B DP_Temp12                                                      ;A89F21;
    BEQ .next                                                            ;A89F23;
    BPL .notReachedBlueTarget                                            ;A89F25;
    CLC                                                                  ;A89F27;
    ADC.W #$0400                                                         ;A89F28;
    BRA +                                                                ;A89F2B;

  .notReachedBlueTarget:
    SEC                                                                  ;A89F2D;
    SBC.W #$0400                                                         ;A89F2E;

+   STA.B DP_Temp12                                                      ;A89F31;
    LDA.L Palettes,X                                                     ;A89F33;
    AND.W #$83FF                                                         ;A89F37;
    ORA.B DP_Temp12                                                      ;A89F3A;
    STA.L Palettes,X                                                     ;A89F3C;
    INY                                                                  ;A89F40;

  .next:
    INX                                                                  ;A89F41;
    INX                                                                  ;A89F42;
    CPX.B DP_Temp14                                                      ;A89F43;
    BPL .return                                                          ;A89F45;
    JMP.W .loop                                                          ;A89F47;

  .return:
    TYA                                                                  ;A89F4A;
    PLY                                                                  ;A89F4B;
    PLX                                                                  ;A89F4C;
    PLP                                                                  ;A89F4D;
    RTS                                                                  ;A89F4E;


;;; $9F4F: Palette - enemy $E7BF (yapping maw) ;;;
Palette_YappingMaw:
    dw $3800,$57FF,$42F7,$0929,$00A5,$4F5A,$36B5,$2610                   ;A89F4F;
    dw $1DCE,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;A89F5F;


;;; $9F6F: Instruction list - attacking - facing up / initial - facing up ;;;
InstList_YappingMaw_Attacking_FacingUp:
    dw $0005,Spritemap_YappingMaw_0                                      ;A89F6F;
    dw $0003,Spritemap_YappingMaw_1                                      ;A89F73;
    dw Instruction_YappingMaw_QueueSFXIfOnScreen                         ;A89F77;
    dw $0050,Spritemap_YappingMaw_2                                      ;A89F79;
    dw $0003,Spritemap_YappingMaw_1                                      ;A89F7D;
    dw Common_Instruction_GotoY                                          ;A89F81;
    dw InstList_YappingMaw_Attacking_FacingUp                            ;A89F83;


;;; $9F85: Instruction list - attacking - facing up-right ;;;
InstList_YappingMaw_Attacking_FacingUpRight:
    dw $0005,Spritemap_YappingMaw_3                                      ;A89F85;
    dw $0003,Spritemap_YappingMaw_4                                      ;A89F89;
    dw Instruction_YappingMaw_QueueSFXIfOnScreen                         ;A89F8D;
    dw $0050,Spritemap_YappingMaw_5                                      ;A89F8F;
    dw $0003,Spritemap_YappingMaw_4                                      ;A89F93;
    dw Common_Instruction_GotoY                                          ;A89F97;
    dw InstList_YappingMaw_Attacking_FacingUpRight                       ;A89F99;


;;; $9F9B: Instruction list - attacking - facing right ;;;
InstList_YappingMaw_Attacking_FacingRight:
    dw $0005,Spritemap_YappingMaw_6                                      ;A89F9B;
    dw $0003,Spritemap_YappingMaw_7                                      ;A89F9F;
    dw Instruction_YappingMaw_QueueSFXIfOnScreen                         ;A89FA3;
    dw $0050,Spritemap_YappingMaw_8                                      ;A89FA5;
    dw $0003,Spritemap_YappingMaw_7                                      ;A89FA9;
    dw Common_Instruction_GotoY                                          ;A89FAD;
    dw InstList_YappingMaw_Attacking_FacingRight                         ;A89FAF;


;;; $9FB1: Instruction list - attacking - facing down-right ;;;
InstList_YappingMaw_Attacking_FacingDownRight:
    dw $0005,Spritemap_YappingMaw_9                                      ;A89FB1;
    dw $0003,Spritemap_YappingMaw_A                                      ;A89FB5;
    dw Instruction_YappingMaw_QueueSFXIfOnScreen                         ;A89FB9;
    dw $0050,Spritemap_YappingMaw_B                                      ;A89FBB;
    dw $0003,Spritemap_YappingMaw_A                                      ;A89FBF;
    dw Common_Instruction_GotoY                                          ;A89FC3;
    dw InstList_YappingMaw_Attacking_FacingDownRight                     ;A89FC5;


;;; $9FC7: Instruction list - attacking - facing down / initial - facing down ;;;
InstList_YappingMaw_Attacking_FacingDown:
    dw $0005,Spritemap_YappingMaw_C                                      ;A89FC7;
    dw $0003,Spritemap_YappingMaw_D                                      ;A89FCB;
    dw Instruction_YappingMaw_QueueSFXIfOnScreen                         ;A89FCF;
    dw $0050,Spritemap_YappingMaw_E                                      ;A89FD1;
    dw $0003,Spritemap_YappingMaw_D                                      ;A89FD5;
    dw Common_Instruction_GotoY                                          ;A89FD9;
    dw InstList_YappingMaw_Attacking_FacingDown                          ;A89FDB;


;;; $9FDD: Instruction list - attacking - facing down-left ;;;
InstList_YappingMaw_Attacking_FacingDownLeft:
    dw $0005,Spritemap_YappingMaw_F                                      ;A89FDD;
    dw $0003,Spritemap_YappingMaw_10                                     ;A89FE1;
    dw Instruction_YappingMaw_QueueSFXIfOnScreen                         ;A89FE5;
    dw $0050,Spritemap_YappingMaw_11                                     ;A89FE7;
    dw $0003,Spritemap_YappingMaw_10                                     ;A89FEB;
    dw Common_Instruction_GotoY                                          ;A89FEF;
    dw InstList_YappingMaw_Attacking_FacingDownLeft                      ;A89FF1;


;;; $9FF3: Instruction list - attacking - facing left ;;;
InstList_YappingMaw_Attacking_FacingLeft:
    dw $0005,Spritemap_YappingMaw_12                                     ;A89FF3;
    dw $0003,Spritemap_YappingMaw_13                                     ;A89FF7;
    dw Instruction_YappingMaw_QueueSFXIfOnScreen                         ;A89FFB;
    dw $0050,Spritemap_YappingMaw_14                                     ;A89FFD;
    dw $0003,Spritemap_YappingMaw_13                                     ;A8A001;
    dw Common_Instruction_GotoY                                          ;A8A005;
    dw InstList_YappingMaw_Attacking_FacingLeft                          ;A8A007;


;;; $A009: Instruction list - attacking - facing up-left ;;;
InstList_YappingMaw_Attacking_FacingUpLeft:
    dw $0005,Spritemap_YappingMaw_15                                     ;A8A009;
    dw $0003,Spritemap_YappingMaw_16                                     ;A8A00D;
    dw Instruction_YappingMaw_QueueSFXIfOnScreen                         ;A8A011;
    dw $0050,Spritemap_YappingMaw_17                                     ;A8A013;
    dw $0003,Spritemap_YappingMaw_16                                     ;A8A017;
    dw Common_Instruction_GotoY                                          ;A8A01B;
    dw InstList_YappingMaw_Attacking_FacingUpLeft                        ;A8A01D;


;;; $A01F: Instruction list - cooldown - facing up-right ;;;
InstList_YappingMaw_Cooldown_FacingUpRight:
    dw Instruction_YappingMaw_OffsetSamusUpRight                         ;A8A01F;
    dw $0004,Spritemap_YappingMaw_5                                      ;A8A021;


;;; $A025: Instruction list - cooldown - facing up ;;;
InstList_YappingMaw_Cooldown_FacingUp_0:
    dw Instruction_YappingMaw_OffsetSamusUp                              ;A8A025;

InstList_YappingMaw_Cooldown_FacingUp_1:
    dw $0050,Spritemap_YappingMaw_2                                      ;A8A027;
    dw $0003,Spritemap_YappingMaw_1                                      ;A8A02B;
    dw $0005,Spritemap_YappingMaw_0                                      ;A8A02F;
    dw $0003,Spritemap_YappingMaw_1                                      ;A8A033;
    dw Instruction_YappingMaw_QueueSFXIfOnScreen                         ;A8A037;
    dw Common_Instruction_GotoY                                          ;A8A039;
    dw InstList_YappingMaw_Cooldown_FacingUp_1                           ;A8A03B;


;;; $A03D: Instruction list - cooldown - facing up-left ;;;
InstList_YappingMaw_Cooldown_FacingUpLeft_0:
    dw Instruction_YappingMaw_OffsetSamusUpLeft                          ;A8A03D;
    dw $0004,Spritemap_YappingMaw_17                                     ;A8A03F;
    dw Instruction_YappingMaw_OffsetSamusUp                              ;A8A043;

InstList_YappingMaw_Cooldown_FacingUpLeft_1:
    dw $0050,Spritemap_YappingMaw_2                                      ;A8A045;
    dw $0003,Spritemap_YappingMaw_1                                      ;A8A049;
    dw $0005,Spritemap_YappingMaw_0                                      ;A8A04D;
    dw $0003,Spritemap_YappingMaw_1                                      ;A8A051;
    dw Instruction_YappingMaw_QueueSFXIfOnScreen                         ;A8A055;
    dw Common_Instruction_GotoY                                          ;A8A057;
    dw InstList_YappingMaw_Cooldown_FacingUpLeft_1                       ;A8A059;


;;; $A05B: Instruction list - cooldown - facing down-right ;;;
InstList_YappingMaw_Cooldown_FacingDownRight:
    dw Instruction_YappingMaw_OffsetSamusDownRight                       ;A8A05B;
    dw $0004,Spritemap_YappingMaw_B                                      ;A8A05D;


;;; $A061: Instruction list - cooldown - facing down ;;;
InstList_YappingMaw_Cooldown_FacingDown_0:
    dw Instruction_YappingMaw_OffsetSamusDown                            ;A8A061;

InstList_YappingMaw_Cooldown_FacingDown_1:
    dw $0050,Spritemap_YappingMaw_E                                      ;A8A063;
    dw $0003,Spritemap_YappingMaw_D                                      ;A8A067;
    dw $0005,Spritemap_YappingMaw_C                                      ;A8A06B;
    dw $0003,Spritemap_YappingMaw_D                                      ;A8A06F;
    dw Instruction_YappingMaw_QueueSFXIfOnScreen                         ;A8A073;
    dw Common_Instruction_GotoY                                          ;A8A075;
    dw InstList_YappingMaw_Cooldown_FacingDown_1                         ;A8A077;


;;; $A079: Instruction list - cooldown - facing down-left ;;;
InstList_YappingMaw_Cooldown_FacingDownLeft_0:
    dw Instruction_YappingMaw_OffsetSamusDownLeft                        ;A8A079;
    dw $0004,Spritemap_YappingMaw_11                                     ;A8A07B;
    dw Instruction_YappingMaw_OffsetSamusDown                            ;A8A07F;

InstList_YappingMaw_Cooldown_FacingDownLeft_1:
    dw $0050,Spritemap_YappingMaw_E                                      ;A8A081;
    dw $0003,Spritemap_YappingMaw_D                                      ;A8A085;
    dw $0005,Spritemap_YappingMaw_C                                      ;A8A089;
    dw $0003,Spritemap_YappingMaw_D                                      ;A8A08D;
    dw Instruction_YappingMaw_QueueSFXIfOnScreen                         ;A8A091;
    dw Common_Instruction_GotoY                                          ;A8A093;
    dw InstList_YappingMaw_Cooldown_FacingDownLeft_1                     ;A8A095;


;;; $A097: Yapping maw attack instruction list pointers ;;;
InstListPointers_YappingMaw:
; Indexed by [enemy $7E:8028]
    dw InstList_YappingMaw_Attacking_FacingUp                            ;A8A097;
    dw InstList_YappingMaw_Attacking_FacingUpRight                       ;A8A099;
    dw InstList_YappingMaw_Attacking_FacingRight                         ;A8A09B;
    dw InstList_YappingMaw_Attacking_FacingDownRight                     ;A8A09D;
    dw InstList_YappingMaw_Attacking_FacingDown                          ;A8A09F;
    dw InstList_YappingMaw_Attacking_FacingDownLeft                      ;A8A0A1;
    dw InstList_YappingMaw_Attacking_FacingLeft                          ;A8A0A3;
    dw InstList_YappingMaw_Attacking_FacingUpLeft                        ;A8A0A5;


;;; $A0A7: Yapping maw Samus offsets ;;;
; Offset from enemy position to place Samus when grabbed
YappingMawSamusOffsets_X_Up:
    dw $0000                                                             ;A8A0A7;
YappingMawSamusOffsets_Y_Up:
    dw $FFF0                                                             ;A8A0A9;

YappingMawSamusOffsets_X_UpRight:
    dw $0008                                                             ;A8A0AB;
YappingMawSamusOffsets_Y_UpRight:
    dw $FFF8                                                             ;A8A0AD;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_YappingMawSamusOffsets_X_Right_A8A0AF:
    dw $0010                                                             ;A8A0AF;
UNUSED_YappingMawSamusOffsets_Y_Right_A8A0B1:
    dw $0000                                                             ;A8A0B1;
endif ; !FEATURE_KEEP_UNREFERENCED

YappingMawSamusOffsets_X_DownRight:
    dw $0008                                                             ;A8A0B3;
YappingMawSamusOffsets_Y_DownRight:
    dw $0008                                                             ;A8A0B5;

YappingMawSamusOffsets_X_Down:
    dw $0000                                                             ;A8A0B7;
YappingMawSamusOffsets_Y_Down:
    dw $0010                                                             ;A8A0B9;

YappingMawSamusOffsets_X_DownLeft:
    dw $FFF8                                                             ;A8A0BB;
YappingMawSamusOffsets_Y_DownLeft:
    dw $0008                                                             ;A8A0BD;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_YappingMawSamusOffsets_X_Left_A8A0BF:
    dw $FFF0                                                             ;A8A0BF;
UNUSED_YappingMawSamusOffsets_Y_Left_A8A0C1:
    dw $0000                                                             ;A8A0C1;
endif ; !FEATURE_KEEP_UNREFERENCED

YappingMawSamusOffsets_X_UpLeft:
    dw $FFF8                                                             ;A8A0C3;
YappingMawSamusOffsets_Y_UpLeft:
    dw $FFF8                                                             ;A8A0C5;


;;; $A0C7: Instruction - offset Samus up-right ;;;
Instruction_YappingMaw_OffsetSamusUpRight:
    LDX.W EnemyIndex                                                     ;A8A0C7;
    LDA.W YappingMawSamusOffsets_X_UpRight                               ;A8A0CA;
    STA.L YappingMaw.SamusXOffset,X                                      ;A8A0CD;
    LDA.W YappingMawSamusOffsets_Y_UpRight                               ;A8A0D1;
    STA.L YappingMaw.SamusYOffset,X                                      ;A8A0D4;
    RTL                                                                  ;A8A0D8;


;;; $A0D9: Instruction - offset Samus up-left ;;;
Instruction_YappingMaw_OffsetSamusUpLeft:
    LDX.W EnemyIndex                                                     ;A8A0D9;
    LDA.W YappingMawSamusOffsets_X_UpLeft                                ;A8A0DC;
    STA.L YappingMaw.SamusXOffset,X                                      ;A8A0DF;
    LDA.W YappingMawSamusOffsets_Y_UpLeft                                ;A8A0E3;
    STA.L YappingMaw.SamusYOffset,X                                      ;A8A0E6;
    RTL                                                                  ;A8A0EA;


;;; $A0EB: Instruction - offset Samus down-right ;;;
Instruction_YappingMaw_OffsetSamusDownRight:
    LDX.W EnemyIndex                                                     ;A8A0EB;
    LDA.W YappingMawSamusOffsets_X_DownRight                             ;A8A0EE;
    STA.L YappingMaw.SamusXOffset,X                                      ;A8A0F1;
    LDA.W YappingMawSamusOffsets_Y_DownRight                             ;A8A0F5;
    STA.L YappingMaw.SamusYOffset,X                                      ;A8A0F8;
    RTL                                                                  ;A8A0FC;


;;; $A0FD: Instruction - offset Samus down-left ;;;
Instruction_YappingMaw_OffsetSamusDownLeft:
    LDX.W EnemyIndex                                                     ;A8A0FD;
    LDA.W YappingMawSamusOffsets_X_DownLeft                              ;A8A100;
    STA.L YappingMaw.SamusXOffset,X                                      ;A8A103;
    LDA.W YappingMawSamusOffsets_Y_DownLeft                              ;A8A107;
    STA.L YappingMaw.SamusYOffset,X                                      ;A8A10A;
    RTL                                                                  ;A8A10E;


;;; $A10F: Instruction - offset Samus up ;;;
Instruction_YappingMaw_OffsetSamusUp:
    LDX.W EnemyIndex                                                     ;A8A10F;
    LDA.W YappingMawSamusOffsets_X_Up                                    ;A8A112;
    STA.L YappingMaw.SamusXOffset,X                                      ;A8A115;
    LDA.W YappingMawSamusOffsets_Y_Up                                    ;A8A119;
    STA.L YappingMaw.SamusYOffset,X                                      ;A8A11C;
    RTL                                                                  ;A8A120;


;;; $A121: Instruction - offset Samus down ;;;
Instruction_YappingMaw_OffsetSamusDown:
    LDX.W EnemyIndex                                                     ;A8A121;
    LDA.W YappingMawSamusOffsets_X_Down                                  ;A8A124;
    STA.L YappingMaw.SamusXOffset,X                                      ;A8A127;
    LDA.W YappingMawSamusOffsets_Y_Down                                  ;A8A12B;
    STA.L YappingMaw.SamusYOffset,X                                      ;A8A12E;
    RTL                                                                  ;A8A132;


;;; $A133: Instruction - queue yapping maw sound effect if on screen ;;;
Instruction_YappingMaw_QueueSFXIfOnScreen:
    PHY                                                                  ;A8A133;
    PHX                                                                  ;A8A134;
    LDX.W EnemyIndex                                                     ;A8A135;
    LDA.L ExtraEnemy8000+$2C,X                                           ;A8A138;
    BNE .return                                                          ;A8A13C;
    LDA.W #$002F                                                         ;A8A13E;
    JSL.L QueueSound_Lib2_Max6                                           ;A8A141;

  .return:
    PLX                                                                  ;A8A145;
    PLY                                                                  ;A8A146;
    RTL                                                                  ;A8A147;


;;; $A148: Initialisation AI - enemy $E7BF (yapping maw) ;;;
InitAI_YappingMaw:
    LDX.W EnemyIndex                                                     ;A8A148;
    LDA.W Enemy.XPosition,X                                              ;A8A14B;
    STA.L YappingMaw.bodySegmentBaseXPosition,X                          ;A8A14E;
    LDA.W Enemy.YPosition,X                                              ;A8A152;
    STA.L YappingMaw.bodySegmentBaseYPosition,X                          ;A8A155;
    LDA.W #$0000                                                         ;A8A159;
    STA.L YappingMaw.bodySegment1XOffset,X                               ;A8A15C;
    STA.L YappingMaw.bodySegment1YOffset,X                               ;A8A160;
    STA.L YappingMaw.bodySegment2XOffset,X                               ;A8A164;
    STA.L YappingMaw.bodySegment2YOffset,X                               ;A8A168;
    STA.L YappingMaw.bodySegment3XOffset,X                               ;A8A16C;
    STA.L YappingMaw.bodySegment3YOffset,X                               ;A8A170;
    STA.L YappingMaw.headSegmentXOffset,X                                ;A8A174;
    STA.L YappingMaw.headSegmentYOffset,X                                ;A8A178;
    STA.L YappingMaw.grabbingSamusFlag,X                                 ;A8A17C;
    LDA.W Enemy.init0,X                                                  ;A8A180;
    STA.W YappingMaw.proximity,X                                         ;A8A183;
    LDA.W #$0040                                                         ;A8A186;
    STA.W Enemy.var4,X                                                   ;A8A189;
    LDA.W #InstList_YappingMaw_Attacking_FacingUp                        ;A8A18C;
    STA.W Enemy.instList,X                                               ;A8A18F;
    LDA.W #$0039                                                         ;A8A192;
    STA.B DP_Temp24                                                      ;A8A195;
    LDA.W #$0008                                                         ;A8A197;
    STA.B DP_Temp22                                                      ;A8A19A;
    LDA.W Enemy.init1,X                                                  ;A8A19C;
    BNE .keepUp                                                          ;A8A19F;
    LDA.W #InstList_YappingMaw_Attacking_FacingDown                      ;A8A1A1;
    STA.W Enemy.instList,X                                               ;A8A1A4;
    LDA.W #$0038                                                         ;A8A1A7;
    STA.B DP_Temp24                                                      ;A8A1AA;
    LDA.W #$FFF8                                                         ;A8A1AC;
    STA.B DP_Temp22                                                      ;A8A1AF;

  .keepUp:
    LDA.W #$0001                                                         ;A8A1B1;
    STA.W Enemy.instTimer,X                                              ;A8A1B4;
    STZ.W Enemy.loopCounter,X                                            ;A8A1B7;
    LDA.W #Function_YappingMaw_Neutral                                   ;A8A1BA;
    STA.W YappingMaw.function,X                                          ;A8A1BD;
    LDA.W Enemy.palette,X                                                ;A8A1C0;
    AND.W #$0E00                                                         ;A8A1C3;
    STA.L YappingMaw.initialPaletteIndex,X                               ;A8A1C6;
    LDA.W #$0003                                                         ;A8A1CA;
    STA.L YappingMaw.bodySegmentIndex,X                                  ;A8A1CD;

  .loop:
    LDX.W EnemyIndex                                                     ;A8A1D1;
    LDY.W #EnemyProjectile_YappingMawsBody                               ;A8A1D4;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A8A1D7;
    LDX.W EnemyIndex                                                     ;A8A1DB;
    LDA.L YappingMaw.bodySegmentIndex,X                                  ;A8A1DE;
    DEC                                                                  ;A8A1E2;
    STA.L YappingMaw.bodySegmentIndex,X                                  ;A8A1E3;
    BPL .loop                                                            ;A8A1E7;
    LDA.W Enemy.XPosition,X                                              ;A8A1E9;
    STA.B DP_Temp12                                                      ;A8A1EC;
    LDA.W Enemy.YPosition,X                                              ;A8A1EE;
    CLC                                                                  ;A8A1F1;
    ADC.B DP_Temp22                                                      ;A8A1F2;
    STA.B DP_Temp14                                                      ;A8A1F4;
    LDA.B DP_Temp24                                                      ;A8A1F6;
    STA.B DP_Temp16                                                      ;A8A1F8;
    LDA.W Enemy.palette,X                                                ;A8A1FA;
    ORA.W Enemy.GFXOffset,X                                              ;A8A1FD;
    STA.L ExtraEnemy8800+$E,X                                            ;A8A200;
    STA.B DP_Temp18                                                      ;A8A204;
    JSL.L Create_Sprite_Object                                           ;A8A206;
    LDA.B DP_Temp12                                                      ;A8A20A;
    STA.L YappingMaw.baseSpriteObjectIndex,X                             ;A8A20C;
    RTL                                                                  ;A8A210;


;;; $A211: Main AI - enemy $E7BF (yapping maw) ;;;
MainAI_YappingMaw:
    LDX.W EnemyIndex                                                     ;A8A211;
    LDA.L YappingMaw.intangibilityTimer,X                                ;A8A214;
    DEC                                                                  ;A8A218;
    STA.L YappingMaw.intangibilityTimer,X                                ;A8A219;
    JSL.L CheckIfEnemyCenterIsOnScreen                                   ;A8A21D;
    STA.L ExtraEnemy8000+$2C,X                                           ;A8A221;
    JSR.W (YappingMaw.function,X)                                        ;A8A225;
    JSR.W SetBodySegmentPosition_3                                       ;A8A228;
    JSR.W SetBodySegmentPosition_2                                       ;A8A22B;
    JSR.W SetBodySegmentPosition_1                                       ;A8A22E;
    JSR.W SetBodySegmentPosition_0                                       ;A8A231;
    RTL                                                                  ;A8A234;


;;; $A235: Yapping maw function - neutral ;;;
Function_YappingMaw_Neutral:
    LDX.W EnemyIndex                                                     ;A8A235;
    LDA.W Enemy.XPosition,X                                              ;A8A238;
    STA.W Temp_XPosition                                                 ;A8A23B;
    LDA.W Enemy.YPosition,X                                              ;A8A23E;
    STA.W Temp_YPosition                                                 ;A8A241;
    LDA.W SamusXPosition                                                 ;A8A244;
    STA.W Temp_SamusXPosition                                            ;A8A247;
    LDA.W SamusYPosition                                                 ;A8A24A;
    STA.W Temp_SamusYPosition                                            ;A8A24D;
    JSL.L CalculateDistanceAndAngleOfSamusFromEnemy                      ;A8A250;
    JSL.L NegateA_A0B067                                                 ;A8A254;
    STA.L YappingMaw.targetLength,X                                      ;A8A258;
    CMP.W #$0020                                                         ;A8A25C;
    BMI .pointBlank                                                      ;A8A25F;
    CMP.W YappingMaw.proximity,X                                         ;A8A261;
    BPL .return                                                          ;A8A264;
    LDA.L YappingMaw.targetLength,X                                      ;A8A266; >_<
    CMP.W #$0040                                                         ;A8A26A;
    BMI +                                                                ;A8A26D;
    LDA.W #$0040                                                         ;A8A26F;
    STA.L YappingMaw.targetLength,X                                      ;A8A272;

+   LDA.W Temp_AngleFromEnemyToSamus                                     ;A8A276;
    STA.L YappingMaw.targetAngleSMConvention,X                           ;A8A279;
    LDA.W #Function_YappingMaw_Attack                                    ;A8A27D;
    STA.W YappingMaw.function,X                                          ;A8A280;

  .return:
    RTS                                                                  ;A8A283;

  .pointBlank:
    LDA.W #$0030                                                         ;A8A284;
    STA.L YappingMaw.intangibilityTimer,X                                ;A8A287;
    RTS                                                                  ;A8A28B;


;;; $A28C: Yapping maw function - attack ;;;
Function_YappingMaw_Attack:
    LDX.W EnemyIndex                                                     ;A8A28C;
    STZ.W YappingMaw.angle,X                                             ;A8A28F;
    STZ.W YappingMaw.subAngle,X                                          ;A8A292;
    STZ.W YappingMaw.angularSpeedTableIndex,X                            ;A8A295;
    LDA.L YappingMaw.targetLength,X                                      ;A8A298;
    LSR                                                                  ;A8A29C;
    STA.L YappingMaw.length,X                                            ;A8A29D;
    LDA.L YappingMaw.targetAngleSMConvention,X                           ;A8A2A1;
    SEC                                                                  ;A8A2A5;
    SBC.W #$0040                                                         ;A8A2A6;
    AND.W #$00FF                                                         ;A8A2A9;
    EOR.W #$FFFF                                                         ;A8A2AC;
    INC                                                                  ;A8A2AF;
    CLC                                                                  ;A8A2B0;
    ADC.W #$0100                                                         ;A8A2B1;
    AND.W #$00FF                                                         ;A8A2B4;
    STA.L YappingMaw.targetAngleMathsConvention,X                        ;A8A2B7;
    CMP.W #$0080                                                         ;A8A2BB;
    BPL .targetAngleGreaterThanEqualTo80                                 ;A8A2BE;
    LDA.W #$0000                                                         ;A8A2C0;
    STA.L YappingMaw.aimingDownFlag,X                                    ;A8A2C3;
    BRA +                                                                ;A8A2C7;

  .targetAngleGreaterThanEqualTo80:
    LDA.W #$0001                                                         ;A8A2C9;
    STA.L YappingMaw.aimingDownFlag,X                                    ;A8A2CC;

+   JSR.W CalculateYappingMawOriginPosition                              ;A8A2D0;
    LDA.L YappingMaw.targetAngleSMConvention,X                           ;A8A2D3;
    CLC                                                                  ;A8A2D7;
    ADC.W #$0010                                                         ;A8A2D8;
    AND.W #$00FF                                                         ;A8A2DB;
    LSR                                                                  ;A8A2DE;
    LSR                                                                  ;A8A2DF;
    LSR                                                                  ;A8A2E0;
    LSR                                                                  ;A8A2E1;
    LSR                                                                  ;A8A2E2;
    ASL                                                                  ;A8A2E3;
    STA.L YappingMaw.instListTableIndex,X                                ;A8A2E4;
    TAY                                                                  ;A8A2E8;
    LDA.W InstListPointers_YappingMaw,Y                                  ;A8A2E9;
    STA.W Enemy.instList,X                                               ;A8A2EC;
    LDA.W #$0001                                                         ;A8A2EF;
    STA.W Enemy.instTimer,X                                              ;A8A2F2;
    STZ.W Enemy.loopCounter,X                                            ;A8A2F5;
    TYA                                                                  ;A8A2F8;
    ASL                                                                  ;A8A2F9;
    TAY                                                                  ;A8A2FA;
    LDA.W YappingMawSamusOffsets_X_Up,Y                                  ;A8A2FB;
    STA.L YappingMaw.SamusXOffset,X                                      ;A8A2FE;
    LDA.W YappingMawSamusOffsets_Y_Up,Y                                  ;A8A302;
    STA.L YappingMaw.SamusYOffset,X                                      ;A8A305;
    LDA.W #Function_YappingMaw_Attacking                                 ;A8A309;
    STA.W YappingMaw.function,X                                          ;A8A30C;
    RTS                                                                  ;A8A30F;


;;; $A310: Calculate yapping maw origin position ;;;
CalculateYappingMawOriginPosition:
    LDX.W EnemyIndex                                                     ;A8A310;
    LDA.L YappingMaw.length,X                                            ;A8A313;
    STA.W Temp_Unknown0E32                                               ;A8A317;
    LDA.W #$0080                                                         ;A8A31A;
    JSL.L Math_Cosine_A8A73E                                             ;A8A31D;
    STA.L YappingMaw.originXPosition,X                                   ;A8A321;
    LDA.L YappingMaw.length,X                                            ;A8A325;
    LSR                                                                  ;A8A329;
    STA.W Temp_Unknown0E32                                               ;A8A32A;
    LDA.W #$0080                                                         ;A8A32D;
    JSL.L Math_Sine_A8A742                                               ;A8A330;
    STA.L YappingMaw.originYPosition,X                                   ;A8A334;
    RTS                                                                  ;A8A338;


;;; $A339: Calculate body segment 1 velocities ;;;
CalculateBodySegment1Velocities:
    LDX.W EnemyIndex                                                     ;A8A339;
    LDA.L YappingMaw.bodySegment1XOffset,X                               ;A8A33C;
    STA.W Temp_Unknown0E32                                               ;A8A340;
    LDA.W #$0000                                                         ;A8A343;
    JSL.L Math_Cosine_A8A73E                                             ;A8A346;
    STA.L ExtraEnemy7800+$20,X                                           ;A8A34A;
    LDA.W #$0000                                                         ;A8A34E;
    JSL.L Math_Sine_A8A742                                               ;A8A351;
    STA.L ExtraEnemy7800+$22,X                                           ;A8A355;
    LDA.L YappingMaw.targetAngleMathsConvention,X                        ;A8A359;
    JSL.L Math_Cosine_A8A73E                                             ;A8A35D;
    SEC                                                                  ;A8A361;
    SBC.L ExtraEnemy7800+$20,X                                           ;A8A362;
    STA.L YappingMaw.bodySegment1XVelocity,X                             ;A8A366;
    LDA.L YappingMaw.targetAngleMathsConvention,X                        ;A8A36A;
    JSL.L Math_Sine_A8A742                                               ;A8A36E;
    SEC                                                                  ;A8A372;
    SBC.L ExtraEnemy7800+$22,X                                           ;A8A373;
    STA.L YappingMaw.bodySegment1YVelocity,X                             ;A8A377;
    RTS                                                                  ;A8A37B;


;;; $A37C: Calculate body segment 2 velocities ;;;
CalculateBodySegment2Velocities:
    LDX.W EnemyIndex                                                     ;A8A37C;
    LDA.L YappingMaw.bodySegment2XOffset,X                               ;A8A37F;
    STA.W Temp_Unknown0E32                                               ;A8A383;
    LDA.W #$0000                                                         ;A8A386;
    JSL.L Math_Cosine_A8A73E                                             ;A8A389;
    STA.L ExtraEnemy7800+$20,X                                           ;A8A38D;
    LDA.W #$0000                                                         ;A8A391;
    JSL.L Math_Sine_A8A742                                               ;A8A394;
    STA.L ExtraEnemy7800+$22,X                                           ;A8A398;
    LDA.L YappingMaw.targetAngleMathsConvention,X                        ;A8A39C;
    JSL.L Math_Cosine_A8A73E                                             ;A8A3A0;
    SEC                                                                  ;A8A3A4;
    SBC.L ExtraEnemy7800+$20,X                                           ;A8A3A5;
    STA.L YappingMaw.bodySegment2XVelocity,X                             ;A8A3A9;
    LDA.L YappingMaw.targetAngleMathsConvention,X                        ;A8A3AD;
    JSL.L Math_Sine_A8A742                                               ;A8A3B1;
    SEC                                                                  ;A8A3B5;
    SBC.L ExtraEnemy7800+$22,X                                           ;A8A3B6;
    STA.L YappingMaw.bodySegment2YVelocity,X                             ;A8A3BA;
    RTS                                                                  ;A8A3BE;


;;; $A3BF: Calculate body segment 3 velocities ;;;
CalculateBodySegment3Velocities:
    LDX.W EnemyIndex                                                     ;A8A3BF;
    LDA.L YappingMaw.bodySegment3XOffset,X                               ;A8A3C2;
    STA.W Temp_Unknown0E32                                               ;A8A3C6;
    LDA.W #$0000                                                         ;A8A3C9;
    JSL.L Math_Cosine_A8A73E                                             ;A8A3CC;
    STA.L ExtraEnemy7800+$20,X                                           ;A8A3D0;
    LDA.W #$0000                                                         ;A8A3D4;
    JSL.L Math_Sine_A8A742                                               ;A8A3D7;
    STA.L ExtraEnemy7800+$22,X                                           ;A8A3DB;
    LDA.L YappingMaw.targetAngleMathsConvention,X                        ;A8A3DF;
    JSL.L Math_Cosine_A8A73E                                             ;A8A3E3;
    SEC                                                                  ;A8A3E7;
    SBC.L ExtraEnemy7800+$20,X                                           ;A8A3E8;
    STA.L YappingMaw.bodySegment3XVelocity,X                             ;A8A3EC;
    LDA.L YappingMaw.targetAngleMathsConvention,X                        ;A8A3F0;
    JSL.L Math_Sine_A8A742                                               ;A8A3F4;
    SEC                                                                  ;A8A3F8;
    SBC.L ExtraEnemy7800+$22,X                                           ;A8A3F9;
    STA.L YappingMaw.bodySegment3YVelocity,X                             ;A8A3FD;
    RTS                                                                  ;A8A401;


;;; $A402: Calculate head segment velocities ;;;
CalculateHeadSegmentVelocities:
    LDX.W EnemyIndex                                                     ;A8A402;
    LDA.L YappingMaw.headSegmentXOffset,X                                ;A8A405;
    STA.W Temp_Unknown0E32                                               ;A8A409;
    LDA.W #$0000                                                         ;A8A40C;
    JSL.L Math_Cosine_A8A73E                                             ;A8A40F;
    STA.L ExtraEnemy7800+$20,X                                           ;A8A413;
    LDA.W #$0000                                                         ;A8A417;
    JSL.L Math_Sine_A8A742                                               ;A8A41A;
    STA.L ExtraEnemy7800+$22,X                                           ;A8A41E;
    LDA.L YappingMaw.targetAngleMathsConvention,X                        ;A8A422;
    JSL.L Math_Cosine_A8A73E                                             ;A8A426;
    SEC                                                                  ;A8A42A;
    SBC.L ExtraEnemy7800+$20,X                                           ;A8A42B;
    STA.L YappingMaw.headSegmentXVelocity,X                              ;A8A42F;
    LDA.L YappingMaw.targetAngleMathsConvention,X                        ;A8A433;
    JSL.L Math_Sine_A8A742                                               ;A8A437;
    SEC                                                                  ;A8A43B;
    SBC.L ExtraEnemy7800+$22,X                                           ;A8A43C;
    STA.L YappingMaw.headSegmentYVelocity,X                              ;A8A440;
    RTS                                                                  ;A8A444;


;;; $A445: Yapping maw function - attacking ;;;
Function_YappingMaw_Attacking:
; Eventually we end up approximating these rather complicated calculations for each segment:
;     Enemy segment X offset = ([enemy length] * cos([enemy segment angle] * pi / 80h) - [enemy origin X position]) * cos([enemy target angle] * pi / 80h)
;     Enemy segment Y offset = ([enemy length] * cos([enemy segment angle] * pi / 80h) - [enemy origin X position]) * -sin([enemy target angle] * pi / 80h) + [enemy length] / 2 * -sin([enemy segment angle] * pi / 80h) - [enemy origin Y position]

; TODO: deserving of a diagram? need to verify with lua script also
    LDX.W EnemyIndex                                                     ;A8A445;
    LDA.W YappingMaw.angle,X                                             ;A8A448;
    LSR                                                                  ;A8A44B;
    LSR                                                                  ;A8A44C;
    STA.B DP_Temp14                                                      ;A8A44D;
    LDA.L YappingMaw.aimingDownFlag,X                                    ;A8A44F;
    BNE .notAimingDown                                                   ;A8A453;
    SEC                                                                  ;A8A455;
    LDA.W #$0080                                                         ;A8A456;
    SBC.B DP_Temp14                                                      ;A8A459;
    STA.L YappingMaw.bodySegment1Angle,X                                 ;A8A45B;
    SBC.B DP_Temp14                                                      ;A8A45F;
    STA.L YappingMaw.bodySegment2Angle,X                                 ;A8A461;
    SBC.B DP_Temp14                                                      ;A8A465;
    STA.L YappingMaw.bodySegment3Angle,X                                 ;A8A467;
    SBC.B DP_Temp14                                                      ;A8A46B;
    STA.L YappingMaw.bodySegmentAngle,X                                  ;A8A46D;
    BRA +                                                                ;A8A471;

  .notAimingDown:
    CLC                                                                  ;A8A473;
    LDA.W #$0080                                                         ;A8A474;
    ADC.B DP_Temp14                                                      ;A8A477;
    STA.L YappingMaw.bodySegment1Angle,X                                 ;A8A479;
    ADC.B DP_Temp14                                                      ;A8A47D;
    STA.L YappingMaw.bodySegment2Angle,X                                 ;A8A47F;
    ADC.B DP_Temp14                                                      ;A8A483;
    STA.L YappingMaw.bodySegment3Angle,X                                 ;A8A485;
    ADC.B DP_Temp14                                                      ;A8A489;
    STA.L YappingMaw.bodySegmentAngle,X                                  ;A8A48B;

+   LDA.L YappingMaw.length,X                                            ;A8A48F;
    STA.W Temp_Unknown0E32                                               ;A8A493;
    LDA.L YappingMaw.bodySegment1Angle,X                                 ;A8A496;
    JSL.L Math_Cosine_A8A73E                                             ;A8A49A;
    SEC                                                                  ;A8A49E;
    SBC.L YappingMaw.originXPosition,X                                   ;A8A49F;
    STA.L YappingMaw.bodySegment1XOffset,X                               ;A8A4A3;
    LDA.L YappingMaw.bodySegment2Angle,X                                 ;A8A4A7;
    JSL.L Math_Cosine_A8A73E                                             ;A8A4AB;
    SEC                                                                  ;A8A4AF;
    SBC.L YappingMaw.originXPosition,X                                   ;A8A4B0;
    STA.L YappingMaw.bodySegment2XOffset,X                               ;A8A4B4;
    LDA.L YappingMaw.bodySegment3Angle,X                                 ;A8A4B8;
    JSL.L Math_Cosine_A8A73E                                             ;A8A4BC;
    SEC                                                                  ;A8A4C0;
    SBC.L YappingMaw.originXPosition,X                                   ;A8A4C1;
    STA.L YappingMaw.bodySegment3XOffset,X                               ;A8A4C5;
    LDA.L YappingMaw.bodySegmentAngle,X                                  ;A8A4C9;
    JSL.L Math_Cosine_A8A73E                                             ;A8A4CD;
    SEC                                                                  ;A8A4D1;
    SBC.L YappingMaw.originXPosition,X                                   ;A8A4D2;
    STA.L YappingMaw.headSegmentXOffset,X                                ;A8A4D6;
    LDA.L YappingMaw.length,X                                            ;A8A4DA;
    LSR                                                                  ;A8A4DE;
    STA.W Temp_Unknown0E32                                               ;A8A4DF;
    LDA.L YappingMaw.bodySegment1Angle,X                                 ;A8A4E2;
    JSL.L Math_Sine_A8A742                                               ;A8A4E6;
    SEC                                                                  ;A8A4EA;
    SBC.L YappingMaw.originYPosition,X                                   ;A8A4EB;
    STA.L YappingMaw.bodySegment1YOffset,X                               ;A8A4EF;
    LDA.L YappingMaw.bodySegment2Angle,X                                 ;A8A4F3;
    JSL.L Math_Sine_A8A742                                               ;A8A4F7;
    SEC                                                                  ;A8A4FB;
    SBC.L YappingMaw.originYPosition,X                                   ;A8A4FC;
    STA.L YappingMaw.bodySegment2YOffset,X                               ;A8A500;
    LDA.L YappingMaw.bodySegment3Angle,X                                 ;A8A504;
    JSL.L Math_Sine_A8A742                                               ;A8A508;
    SEC                                                                  ;A8A50C;
    SBC.L YappingMaw.originYPosition,X                                   ;A8A50D;
    STA.L YappingMaw.bodySegment3YOffset,X                               ;A8A511;
    LDA.L YappingMaw.bodySegmentAngle,X                                  ;A8A515;
    JSL.L Math_Sine_A8A742                                               ;A8A519;
    SEC                                                                  ;A8A51D;
    SBC.L YappingMaw.originYPosition,X                                   ;A8A51E;
    STA.L YappingMaw.headSegmentYOffset,X                                ;A8A522;
    JSR.W CalculateBodySegment1Velocities                                ;A8A526;
    JSR.W CalculateBodySegment2Velocities                                ;A8A529;
    JSR.W CalculateBodySegment3Velocities                                ;A8A52C;
    JSR.W CalculateHeadSegmentVelocities                                 ;A8A52F;
    CLC                                                                  ;A8A532;
    LDA.L YappingMaw.bodySegment1XOffset,X                               ;A8A533;
    ADC.L YappingMaw.bodySegment1XVelocity,X                             ;A8A537;
    STA.L YappingMaw.bodySegment1XOffset,X                               ;A8A53B;
    LDA.L YappingMaw.bodySegment1YOffset,X                               ;A8A53F;
    ADC.L YappingMaw.bodySegment1YVelocity,X                             ;A8A543;
    STA.L YappingMaw.bodySegment1YOffset,X                               ;A8A547;
    LDA.L YappingMaw.bodySegment2XOffset,X                               ;A8A54B;
    ADC.L YappingMaw.bodySegment2XVelocity,X                             ;A8A54F;
    STA.L YappingMaw.bodySegment2XOffset,X                               ;A8A553;
    LDA.L YappingMaw.bodySegment2YOffset,X                               ;A8A557;
    ADC.L YappingMaw.bodySegment2YVelocity,X                             ;A8A55B;
    STA.L YappingMaw.bodySegment2YOffset,X                               ;A8A55F;
    LDA.L YappingMaw.bodySegment3XOffset,X                               ;A8A563;
    ADC.L YappingMaw.bodySegment3XVelocity,X                             ;A8A567;
    STA.L YappingMaw.bodySegment3XOffset,X                               ;A8A56B;
    LDA.L YappingMaw.bodySegment3YOffset,X                               ;A8A56F;
    ADC.L YappingMaw.bodySegment3YVelocity,X                             ;A8A573;
    STA.L YappingMaw.bodySegment3YOffset,X                               ;A8A577;
    LDA.L YappingMaw.headSegmentXOffset,X                                ;A8A57B;
    ADC.L YappingMaw.headSegmentXVelocity,X                              ;A8A57F;
    STA.L YappingMaw.headSegmentXOffset,X                                ;A8A583;
    LDA.L YappingMaw.headSegmentYOffset,X                                ;A8A587;
    ADC.L YappingMaw.headSegmentYVelocity,X                              ;A8A58B;
    STA.L YappingMaw.headSegmentYOffset,X                                ;A8A58F;
    LDA.L YappingMaw.bodySegmentBaseXPosition,X                          ;A8A593;
    CLC                                                                  ;A8A597;
    ADC.L YappingMaw.headSegmentXOffset,X                                ;A8A598;
    STA.W Enemy.XPosition,X                                              ;A8A59C;
    LDA.L YappingMaw.bodySegmentBaseYPosition,X                          ;A8A59F;
    CLC                                                                  ;A8A5A3;
    ADC.L YappingMaw.headSegmentYOffset,X                                ;A8A5A4;
    STA.W Enemy.YPosition,X                                              ;A8A5A8;
    JSR.W UpdateYappingMawAngularSpeed                                   ;A8A5AB;
    LDA.W YappingMaw.angle,X                                             ;A8A5AE;
    CMP.W #$0000                                                         ;A8A5B1;
    BMI .cooldown                                                        ;A8A5B4;
    CMP.W #$0080                                                         ;A8A5B6;
    BMI .gotoMoveSamus                                                   ;A8A5B9;
    LDA.W #$0080                                                         ;A8A5BB;
    STA.W YappingMaw.angle,X                                             ;A8A5BE;
    STZ.W YappingMaw.subAngle,X                                          ;A8A5C1;
    INC.W YappingMaw.angularSpeedTableIndex,X                            ;A8A5C4;
    INC.W YappingMaw.angularSpeedTableIndex,X                            ;A8A5C7;
    INC.W YappingMaw.angularSpeedTableIndex,X                            ;A8A5CA;
    INC.W YappingMaw.angularSpeedTableIndex,X                            ;A8A5CD;
    BRA .gotoMoveSamus                                                   ;A8A5D0;

  .cooldown:
    LDA.W #Function_YappingMaw_Cooldown                                  ;A8A5D2;
    STA.W YappingMaw.function,X                                          ;A8A5D5;
    LDA.W #$0030                                                         ;A8A5D8;
    STA.L YappingMaw.intangibilityTimer,X                                ;A8A5DB;
    LDA.L YappingMaw.instListTableIndex,X                                ;A8A5DF;
    CMP.W #$0004                                                         ;A8A5E3;
    BEQ .upRight                                                         ;A8A5E6;
    CMP.W #$000C                                                         ;A8A5E8;
    BEQ .upLeft                                                          ;A8A5EB;
    BRA .up                                                              ;A8A5ED;

  .gotoMoveSamus:
    BRA .moveSamus                                                       ;A8A5EF;

  .upRight:
    LDA.W #InstList_YappingMaw_Cooldown_FacingUpRight                    ;A8A5F1;
    STA.W Enemy.instList,X                                               ;A8A5F4;
    BRA .upMerge                                                         ;A8A5F7;

  .upLeft:
    LDA.W #InstList_YappingMaw_Cooldown_FacingUpLeft_0                   ;A8A5F9;
    STA.W Enemy.instList,X                                               ;A8A5FC;
    BRA .upMerge                                                         ;A8A5FF;

  .up:
    LDA.W #InstList_YappingMaw_Cooldown_FacingUp_0                       ;A8A601;
    STA.W Enemy.instList,X                                               ;A8A604;

  .upMerge:
    LDA.W Enemy.init1,X                                                  ;A8A607;
    BNE .return                                                          ;A8A60A;
    LDA.L YappingMaw.instListTableIndex,X                                ;A8A60C;
    CMP.W #$0004                                                         ;A8A610;
    BEQ .downRight                                                       ;A8A613;
    CMP.W #$000C                                                         ;A8A615;
    BEQ .downLeft                                                        ;A8A618;
    BRA .down                                                            ;A8A61A;

  .downRight:
    LDA.W #InstList_YappingMaw_Cooldown_FacingDownRight                  ;A8A61C;
    STA.W Enemy.instList,X                                               ;A8A61F;
    BRA .moveSamus                                                       ;A8A622;

  .downLeft:
    LDA.W #InstList_YappingMaw_Cooldown_FacingDownLeft_0                 ;A8A624;
    STA.W Enemy.instList,X                                               ;A8A627;
    BRA .moveSamus                                                       ;A8A62A;

  .down:
    LDA.W #InstList_YappingMaw_Cooldown_FacingDown_0                     ;A8A62C;
    STA.W Enemy.instList,X                                               ;A8A62F;
    BRA .return                                                          ;A8A632;

  .moveSamus:
    LDA.L YappingMaw.grabbingSamusFlag,X                                 ;A8A634;
    BEQ .return                                                          ;A8A638;
    JSR.W MoveSamusWithYappingMawPincers                                 ;A8A63A;

  .return:
    RTS                                                                  ;A8A63D;


;;; $A63E: Update yapping maw angular speed ;;;
UpdateYappingMawAngularSpeed:
    LDY.W YappingMaw.angularSpeedTableIndex,X                            ;A8A63E;
    LDA.W YappingMaw.angle,X                                             ;A8A641;
    CLC                                                                  ;A8A644;
    ADC.W Common_EnemySpeeds_QuadraticallyIncreasing+2,Y                  ;A8A645;
    STA.W YappingMaw.angle,X                                             ;A8A648;
    LDA.W YappingMaw.subAngle,X                                          ;A8A64B;
    CLC                                                                  ;A8A64E;
    ADC.W Common_EnemySpeeds_QuadraticallyIncreasing,Y                    ;A8A64F;
    BCC +                                                                ;A8A652;
    INC.W YappingMaw.angle,X                                             ;A8A654;

+   STA.W YappingMaw.subAngle,X                                          ;A8A657;
    LDA.W YappingMaw.angularSpeedTableIndex,X                            ;A8A65A;
    CLC                                                                  ;A8A65D;
    ADC.W #$0008                                                         ;A8A65E;
    STA.W YappingMaw.angularSpeedTableIndex,X                            ;A8A661;
    RTS                                                                  ;A8A664;


;;; $A665: Move Samus with yapping maw pincers ;;;
MoveSamusWithYappingMawPincers:
    LDX.W EnemyIndex                                                     ;A8A665;
    LDA.W #$0003                                                         ;A8A668;
    JSL.L Run_Samus_Command                                              ;A8A66B;
    LDA.W Enemy.XPosition,X                                              ;A8A66F;
    CLC                                                                  ;A8A672;
    ADC.L YappingMaw.SamusXOffset,X                                      ;A8A673;
    STA.W SamusXPosition                                                 ;A8A677;
    LDA.W Enemy.YPosition,X                                              ;A8A67A;
    CLC                                                                  ;A8A67D;
    ADC.L YappingMaw.SamusYOffset,X                                      ;A8A67E;
    STA.W SamusYPosition                                                 ;A8A682;
    JSL.L CapScrollingSpeed                                              ;A8A685;
    RTS                                                                  ;A8A689;


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
    LDX.W EnemyIndex                                                     ;A8A68A;
    LDA.L YappingMaw.grabbingSamusFlag,X                                 ;A8A68D;
    BEQ .notGrabbingSamus                                                ;A8A691;
    JSR.W MoveSamusWithYappingMawPincers                                 ;A8A693;

  .notGrabbingSamus:
    DEC.W Enemy.var4,X                                                   ;A8A696;
    BPL .return                                                          ;A8A699;
    LDA.W PoseInputHandler                                               ;A8A69B;
    CMP.W #SamusPoseInputHandler_Demo                                    ;A8A69E;
    BEQ .return                                                          ;A8A6A1;
    LDA.W #SamusPoseInputHandler_Normal                                  ;A8A6A3;
    STA.W PoseInputHandler                                               ;A8A6A6;
    LDA.W #$0000                                                         ;A8A6A9;
    STA.L YappingMaw.grabbingSamusFlag,X                                 ;A8A6AC;
    LDA.W #$0030                                                         ;A8A6B0;
    STA.L YappingMaw.intangibilityTimer,X                                ;A8A6B3;
    LDA.W #$0040                                                         ;A8A6B7;
    STA.W Enemy.var4,X                                                   ;A8A6BA;
    LDA.W #Function_YappingMaw_Neutral                                   ;A8A6BD;
    STA.W YappingMaw.function,X                                          ;A8A6C0;

  .return:
    RTS                                                                  ;A8A6C3;


;;; $A6C4: Set body segment 0 position ;;;
SetBodySegmentPosition_0:
    LDX.W EnemyIndex                                                     ;A8A6C4;
    LDA.L YappingMaw.bodySegment0ProjectileIndex,X                       ;A8A6C7;
    TAY                                                                  ;A8A6CB;
    LDA.L YappingMaw.bodySegmentBaseXPosition,X                          ;A8A6CC;
    STA.W EnemyProjectile_XPositions,Y                                   ;A8A6D0;
    LDA.L YappingMaw.bodySegmentBaseYPosition,X                          ;A8A6D3;
    STA.W EnemyProjectile_YPositions,Y                                   ;A8A6D7;
    RTS                                                                  ;A8A6DA;


;;; $A6DB: Set body segment 1 position ;;;
SetBodySegmentPosition_1:
    LDX.W EnemyIndex                                                     ;A8A6DB;
    LDA.L YappingMaw.bodySegment1ProjectileIndex,X                       ;A8A6DE;
    TAY                                                                  ;A8A6E2;
    LDA.L YappingMaw.bodySegmentBaseXPosition,X                          ;A8A6E3;
    CLC                                                                  ;A8A6E7;
    ADC.L YappingMaw.bodySegment1XOffset,X                               ;A8A6E8;
    STA.W EnemyProjectile_XPositions,Y                                   ;A8A6EC;
    LDA.L YappingMaw.bodySegmentBaseYPosition,X                          ;A8A6EF;
    CLC                                                                  ;A8A6F3;
    ADC.L YappingMaw.bodySegment1YOffset,X                               ;A8A6F4;
    STA.W EnemyProjectile_YPositions,Y                                   ;A8A6F8;
    RTS                                                                  ;A8A6FB;


;;; $A6FC: Set body segment 2 position ;;;
SetBodySegmentPosition_2:
    LDX.W EnemyIndex                                                     ;A8A6FC;
    LDA.L YappingMaw.bodySegment2ProjectileIndex,X                       ;A8A6FF;
    TAY                                                                  ;A8A703;
    LDA.L YappingMaw.bodySegmentBaseXPosition,X                          ;A8A704;
    CLC                                                                  ;A8A708;
    ADC.L YappingMaw.bodySegment2XOffset,X                               ;A8A709;
    STA.W EnemyProjectile_XPositions,Y                                   ;A8A70D;
    LDA.L YappingMaw.bodySegmentBaseYPosition,X                          ;A8A710;
    CLC                                                                  ;A8A714;
    ADC.L YappingMaw.bodySegment2YOffset,X                               ;A8A715;
    STA.W EnemyProjectile_YPositions,Y                                   ;A8A719;
    RTS                                                                  ;A8A71C;


;;; $A71D: Set body segment 3 position ;;;
SetBodySegmentPosition_3:
    LDX.W EnemyIndex                                                     ;A8A71D;
    LDA.L YappingMaw.bodySegment3ProjectileIndex,X                       ;A8A720;
    TAY                                                                  ;A8A724;
    LDA.L YappingMaw.bodySegmentBaseXPosition,X                          ;A8A725;
    CLC                                                                  ;A8A729;
    ADC.L YappingMaw.bodySegment3XOffset,X                               ;A8A72A;
    STA.W EnemyProjectile_XPositions,Y                                   ;A8A72E;
    LDA.L YappingMaw.bodySegmentBaseYPosition,X                          ;A8A731;
    CLC                                                                  ;A8A735;
    ADC.L YappingMaw.bodySegment3YOffset,X                               ;A8A736;
    STA.W EnemyProjectile_YPositions,Y                                   ;A8A73A;
    RTS                                                                  ;A8A73D;


;;; $A73E: A = [$0E32] * cos([A] * pi / 80h) ;;;
Math_Cosine_A8A73E:
;; Parameters:
;;     A: Angle
;;     $0E32: Radius
;; Returns:
;;     A: [$0E32] * cos([A] * pi / 80h)
    SEC                                                                  ;A8A73E;
    SBC.W #$0040                                                         ;A8A73F; fallthrough to Math_Sine_A8A742


;;; $A742: A = [$0E32] * -sin([A] * pi / 80h) ;;;
Math_Sine_A8A742:
;; Parameters:
;;     A: Angle
;;     $0E32: Radius
;; Returns:
;;     A: [$0E32] * -sin([A] * pi / 80h)
    STA.B DP_Temp12                                                      ;A8A742;
    LDA.W #$0100                                                         ;A8A744;
    SEC                                                                  ;A8A747;
    SBC.B DP_Temp12                                                      ;A8A748;
    AND.W #$00FF                                                         ;A8A74A;
    ASL                                                                  ;A8A74D;
    TAX                                                                  ;A8A74E;
    PHP                                                                  ;A8A74F;
    STZ.B DP_Temp14                                                      ;A8A750;
    STZ.B DP_Temp16                                                      ;A8A752;
    LDA.L SineCosineTables_16bitSine,X                                   ;A8A754;
    BPL +                                                                ;A8A758;
    EOR.W #$FFFF                                                         ;A8A75A;
    INC                                                                  ;A8A75D;
    INC.B DP_Temp14                                                      ;A8A75E;

+   AND.W #$FF00                                                         ;A8A760;
    XBA                                                                  ;A8A763;
    SEP #$20                                                             ;A8A764;
    STA.W $4202                                                          ;A8A766;
    LDA.W Temp_Unknown0E32                                               ;A8A769;
    BEQ +                                                                ;A8A76C;
    STA.W $4203                                                          ;A8A76E;
    NOP                                                                  ;A8A771;
    NOP                                                                  ;A8A772;
    NOP                                                                  ;A8A773;
    REP #$20                                                             ;A8A774;
    LDA.W $4216                                                          ;A8A776;
    AND.W #$FF00                                                         ;A8A779;
    XBA                                                                  ;A8A77C;
    ASL                                                                  ;A8A77D;
    STA.B DP_Temp16                                                      ;A8A77E;
    LDA.B DP_Temp14                                                      ;A8A780;
    BEQ +                                                                ;A8A782;
    LDA.W $4216                                                          ;A8A784;
    EOR.W #$FFFF                                                         ;A8A787;
    INC                                                                  ;A8A78A;
    XBA                                                                  ;A8A78B;
    ASL                                                                  ;A8A78C;
    ORA.W #$FF00                                                         ;A8A78D;
    STA.B DP_Temp16                                                      ;A8A790;

+   LDA.B DP_Temp16                                                      ;A8A792;
    LDX.W EnemyIndex                                                     ;A8A794;
    PLP                                                                  ;A8A797;
    RTL                                                                  ;A8A798;


;;; $A799: Enemy touch - enemy $E7BF (yapping maw) ;;;
EnemyTouch_YappingMaw:
    LDX.W EnemyIndex                                                     ;A8A799;
    LDA.L YappingMaw.intangibilityTimer,X                                ;A8A79C;
    BPL .return                                                          ;A8A7A0;
    LDA.L YappingMaw.grabbingSamusFlag,X                                 ;A8A7A2;
    BNE .return                                                          ;A8A7A6;
    LDA.W #$0000                                                         ;A8A7A8;
    STA.L YappingMaw.intangibilityTimer,X                                ;A8A7AB;
    LDA.W #$0001                                                         ;A8A7AF;
    STA.L YappingMaw.grabbingSamusFlag,X                                 ;A8A7B2;
    LDA.W #RTS_90E90E                                                    ;A8A7B6;
    STA.W PoseInputHandler                                               ;A8A7B9;

  .return:
    RTL                                                                  ;A8A7BC;


;;; $A7BD: Enemy shot - enemy $E7BF (yapping maw) ;;;
EnemyShot_YappingMaw:
; BUG: Yapping maw shinespark crash crash applies here too if a yapping maw is frozen or killed, see Function_YappingMaw_Cooldown
    JSL.L NormalEnemyShotAI_Internal                                     ;A8A7BD;
    LDX.W EnemyIndex                                                     ;A8A7C1;
    LDA.W Enemy.health,X                                                 ;A8A7C4;
    BNE .alive                                                           ;A8A7C7;
    LDA.L YappingMaw.bodySegment0ProjectileIndex,X                       ;A8A7C9;
    TAY                                                                  ;A8A7CD;
    LDA.W #$0000                                                         ;A8A7CE;
    STA.W EnemyProjectile_ID,Y                                           ;A8A7D1;
    LDA.L YappingMaw.bodySegment1ProjectileIndex,X                       ;A8A7D4;
    TAY                                                                  ;A8A7D8;
    LDA.W #$0000                                                         ;A8A7D9;
    STA.W EnemyProjectile_ID,Y                                           ;A8A7DC;
    LDA.L YappingMaw.bodySegment2ProjectileIndex,X                       ;A8A7DF;
    TAY                                                                  ;A8A7E3;
    LDA.W #$0000                                                         ;A8A7E4;
    STA.W EnemyProjectile_ID,Y                                           ;A8A7E7;
    LDA.L YappingMaw.bodySegment3ProjectileIndex,X                       ;A8A7EA;
    TAY                                                                  ;A8A7EE;
    LDA.W #$0000                                                         ;A8A7EF;
    STA.W EnemyProjectile_ID,Y                                           ;A8A7F2;
    PHX                                                                  ;A8A7F5;
    LDA.L YappingMaw.baseSpriteObjectIndex,X                             ;A8A7F6;
    TAX                                                                  ;A8A7FA;
    LDA.W #$0000                                                         ;A8A7FB;
    STA.L SpriteObjects_InstListPointers,X                               ;A8A7FE;
    PLX                                                                  ;A8A802;
    LDA.W PoseInputHandler                                               ;A8A803;
    CMP.W #SamusPoseInputHandler_Demo                                    ;A8A806;
    BEQ .notDemo                                                         ;A8A809;
    LDA.W #SamusPoseInputHandler_Normal                                  ;A8A80B;
    STA.W PoseInputHandler                                               ;A8A80E;

  .notDemo:
    LDA.W #$0000                                                         ;A8A811;
    STA.L YappingMaw.grabbingSamusFlag,X                                 ;A8A814;
    BRA .return                                                          ;A8A818;

  .alive:
    LDA.W Enemy.freezeTimer,X                                            ;A8A81A;
    BEQ .return                                                          ;A8A81D;
    LDA.W PoseInputHandler                                               ;A8A81F;
    CMP.W #SamusPoseInputHandler_Demo                                    ;A8A822;
    BEQ .alsoNotDemo                                                     ;A8A825;
    LDA.W #SamusPoseInputHandler_Normal                                  ;A8A827;
    STA.W PoseInputHandler                                               ;A8A82A;

  .alsoNotDemo:
    LDA.W #$0000                                                         ;A8A82D;
    STA.L YappingMaw.grabbingSamusFlag,X                                 ;A8A830;

  .return:
    RTL                                                                  ;A8A834;


;;; $A835: Frozen AI - enemy $E7BF (yapping maw) ;;;
FrozenAI_YappingMaw:
    JSL.L CommonA8_NormalEnemyFrozenAI                                   ;A8A835;
    LDA.L YappingMaw.bodySegment0ProjectileIndex,X                       ;A8A839;
    TAY                                                                  ;A8A83D;
    JSR.W SetYappingMawBodySegmentFrozenPalette                          ;A8A83E;
    LDA.L YappingMaw.bodySegment1ProjectileIndex,X                       ;A8A841;
    TAY                                                                  ;A8A845;
    JSR.W SetYappingMawBodySegmentFrozenPalette                          ;A8A846;
    LDA.L YappingMaw.bodySegment2ProjectileIndex,X                       ;A8A849;
    TAY                                                                  ;A8A84D;
    JSR.W SetYappingMawBodySegmentFrozenPalette                          ;A8A84E;
    LDA.L YappingMaw.bodySegment3ProjectileIndex,X                       ;A8A851;
    TAY                                                                  ;A8A855;
    JSR.W SetYappingMawBodySegmentFrozenPalette                          ;A8A856;
    JSR.W SetYappingMawBaseFrozenPalette                                 ;A8A859;
    RTL                                                                  ;A8A85C;


;;; $A85D: Set yapping maw body segment frozen palette ;;;
SetYappingMawBodySegmentFrozenPalette:
;; Parameters:
;;     Y: Enemy projectile index
    LDX.W EnemyIndex                                                     ;A8A85D;
    LDA.W EnemyProjectile_GraphicsIndices,Y                              ;A8A860;
    AND.W #$F1FF                                                         ;A8A863;
    ORA.L YappingMaw.initialPaletteIndex,X                               ;A8A866;
    STA.W EnemyProjectile_GraphicsIndices,Y                              ;A8A86A;
    LDA.W Enemy.freezeTimer,X                                            ;A8A86D;
    BEQ .return                                                          ;A8A870;
    LDA.W EnemyProjectile_GraphicsIndices,Y                              ;A8A872;
    AND.W #$F1FF                                                         ;A8A875;
    ORA.W #$0C00                                                         ;A8A878;
    STA.W EnemyProjectile_GraphicsIndices,Y                              ;A8A87B;
    LDA.W Enemy.freezeTimer,X                                            ;A8A87E;
    CMP.W #$005A                                                         ;A8A881;
    BPL .return                                                          ;A8A884;
    BIT.W #$0002                                                         ;A8A886;
    BNE .return                                                          ;A8A889;
    LDA.W EnemyProjectile_GraphicsIndices,Y                              ;A8A88B;
    AND.W #$F1FF                                                         ;A8A88E;
    ORA.L YappingMaw.initialPaletteIndex,X                               ;A8A891;
    STA.W EnemyProjectile_GraphicsIndices,Y                              ;A8A895;

  .return:
    RTS                                                                  ;A8A898;


;;; $A899: Set yapping maw base frozen palette ;;;
SetYappingMawBaseFrozenPalette:
    LDX.W EnemyIndex                                                     ;A8A899;
    LDA.L YappingMaw.initialPaletteIndex,X                               ;A8A89C;
    STA.B DP_Temp12                                                      ;A8A8A0;
    LDA.L YappingMaw.baseSpriteObjectIndex,X                             ;A8A8A2;
    STA.B DP_Temp14                                                      ;A8A8A6;
    TAX                                                                  ;A8A8A8;
    LDA.L SpriteObjects_Palettes,X                                       ;A8A8A9;
    AND.W #$F1FF                                                         ;A8A8AD;
    ORA.B DP_Temp12                                                      ;A8A8B0;
    STA.L SpriteObjects_Palettes,X                                       ;A8A8B2;
    LDX.W EnemyIndex                                                     ;A8A8B6;
    LDA.W Enemy.freezeTimer,X                                            ;A8A8B9;
    BEQ .return                                                          ;A8A8BC;
    LDX.B DP_Temp14                                                      ;A8A8BE;
    LDA.L SpriteObjects_Palettes,X                                       ;A8A8C0;
    AND.W #$F1FF                                                         ;A8A8C4;
    ORA.W #$0C00                                                         ;A8A8C7;
    STA.L SpriteObjects_Palettes,X                                       ;A8A8CA;
    LDX.W EnemyIndex                                                     ;A8A8CE;
    LDA.W Enemy.freezeTimer,X                                            ;A8A8D1;
    CMP.W #$005A                                                         ;A8A8D4;
    BPL .return                                                          ;A8A8D7;
    BIT.W #$0002                                                         ;A8A8D9;
    BNE .return                                                          ;A8A8DC;
    LDX.B DP_Temp14                                                      ;A8A8DE;
    LDA.L SpriteObjects_Palettes,X                                       ;A8A8E0;
    AND.W #$F1FF                                                         ;A8A8E4;
    ORA.B DP_Temp12                                                      ;A8A8E7;
    STA.L SpriteObjects_Palettes,X                                       ;A8A8E9;

  .return:
    RTS                                                                  ;A8A8ED;


;;; $A8EE: Yapping maw spritemaps ;;;
Spritemap_YappingMaw_0:
    dw $0005                                                             ;A8A8EE;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $1F4, $FA, 0, 0, 2, 0, $10F)
    %spritemapEntry(0, $1EC, $FA, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $04, $FA, 0, 1, 2, 0, $10F)
    %spritemapEntry(0, $0C, $FA, 0, 1, 2, 0, $10E)

Spritemap_YappingMaw_1:
    dw $0003                                                             ;A8A909;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $04, $F0, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $1EC, $F0, 0, 0, 2, 0, $106)

Spritemap_YappingMaw_2:
    dw $0005                                                             ;A8A91A;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $00, $F6, 0, 1, 2, 0, $10D)
    %spritemapEntry(0, $00, $EE, 0, 1, 2, 0, $10C)
    %spritemapEntry(0, $1F8, $F6, 0, 0, 2, 0, $10D)
    %spritemapEntry(0, $1F8, $EE, 0, 0, 2, 0, $10C)

Spritemap_YappingMaw_3:
    dw $0003                                                             ;A8A935;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F2, $EE, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $02, $FE, 1, 1, 2, 0, $108)

Spritemap_YappingMaw_4:
    dw $0005                                                             ;A8A946;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $102)
    %spritemapEntry(0, $05, $FD, 0, 1, 2, 0, $10F)
    %spritemapEntry(0, $0D, $FD, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $1FB, $F3, 0, 0, 2, 0, $10D)
    %spritemapEntry(0, $1FB, $EB, 0, 0, 2, 0, $10C)

Spritemap_YappingMaw_5:
    dw $0003                                                             ;A8A961;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $01, $F4, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $1FC, $EF, 0, 1, 2, 0, $108)

Spritemap_YappingMaw_6:
    dw $0005                                                             ;A8A972;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $104)
    %spritemapEntry(0, $1FE, $04, 1, 0, 2, 0, $10D)
    %spritemapEntry(0, $1FE, $0C, 1, 0, 2, 0, $10C)
    %spritemapEntry(0, $1FE, $F4, 0, 0, 2, 0, $10D)
    %spritemapEntry(0, $1FE, $EC, 0, 0, 2, 0, $10C)

Spritemap_YappingMaw_7:
    dw $0003                                                             ;A8A98D;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $00, $EC, 0, 1, 2, 0, $108)
    %spritemapEntry(1, $00, $04, 1, 1, 2, 0, $108)

Spritemap_YappingMaw_8:
    dw $0005                                                             ;A8A99E;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $104)
    %spritemapEntry(0, $03, $F8, 1, 1, 2, 0, $10F)
    %spritemapEntry(0, $0B, $F8, 1, 1, 2, 0, $10E)
    %spritemapEntry(0, $03, $00, 0, 1, 2, 0, $10F)
    %spritemapEntry(0, $0B, $00, 0, 1, 2, 0, $10E)

Spritemap_YappingMaw_9:
    dw $0003                                                             ;A8A9B9;
    %spritemapEntry(1, $1F8, $F8, 1, 0, 2, 0, $102)
    %spritemapEntry(1, $1F2, $02, 1, 0, 2, 0, $106)
    %spritemapEntry(1, $02, $F2, 0, 1, 2, 0, $108)

Spritemap_YappingMaw_A:
    dw $0005                                                             ;A8A9CA;
    %spritemapEntry(1, $1F8, $F8, 1, 0, 2, 0, $102)
    %spritemapEntry(0, $05, $FB, 1, 1, 2, 0, $10F)
    %spritemapEntry(0, $0D, $FB, 1, 1, 2, 0, $10E)
    %spritemapEntry(0, $1FB, $05, 1, 0, 2, 0, $10D)
    %spritemapEntry(0, $1FB, $0D, 1, 0, 2, 0, $10C)

Spritemap_YappingMaw_B:
    dw $0003                                                             ;A8A9E5;
    %spritemapEntry(1, $1F8, $F8, 1, 0, 2, 0, $102)
    %spritemapEntry(1, $01, $FC, 1, 1, 2, 0, $106)
    %spritemapEntry(1, $1FC, $01, 1, 1, 2, 0, $108)

Spritemap_YappingMaw_C:
    dw $0005                                                             ;A8A9F6;
    %spritemapEntry(1, $1F8, $F8, 1, 0, 2, 0, $100)
    %spritemapEntry(0, $1F4, $FE, 1, 0, 2, 0, $10F)
    %spritemapEntry(0, $1EC, $FE, 1, 0, 2, 0, $10E)
    %spritemapEntry(0, $04, $FE, 1, 1, 2, 0, $10F)
    %spritemapEntry(0, $0C, $FE, 1, 1, 2, 0, $10E)

Spritemap_YappingMaw_D:
    dw $0003                                                             ;A8AA11;
    %spritemapEntry(1, $1F8, $F8, 1, 0, 2, 0, $100)
    %spritemapEntry(1, $04, $00, 1, 1, 2, 0, $106)
    %spritemapEntry(1, $1EC, $00, 1, 0, 2, 0, $106)

Spritemap_YappingMaw_E:
    dw $0005                                                             ;A8AA22;
    %spritemapEntry(1, $1F8, $F8, 1, 0, 2, 0, $100)
    %spritemapEntry(0, $00, $02, 1, 1, 2, 0, $10D)
    %spritemapEntry(0, $00, $0A, 1, 1, 2, 0, $10C)
    %spritemapEntry(0, $1F8, $02, 1, 0, 2, 0, $10D)
    %spritemapEntry(0, $1F8, $0A, 1, 0, 2, 0, $10C)

Spritemap_YappingMaw_F:
    dw $0003                                                             ;A8AA3D;
    %spritemapEntry(1, $1F8, $F8, 1, 1, 2, 0, $102)
    %spritemapEntry(1, $1FE, $02, 1, 1, 2, 0, $106)
    %spritemapEntry(1, $1EE, $F2, 0, 0, 2, 0, $108)

Spritemap_YappingMaw_10:
    dw $0005                                                             ;A8AA4E;
    %spritemapEntry(1, $1F8, $F8, 1, 1, 2, 0, $102)
    %spritemapEntry(0, $1F3, $FB, 1, 0, 2, 0, $10F)
    %spritemapEntry(0, $1EB, $FB, 1, 0, 2, 0, $10E)
    %spritemapEntry(0, $1FD, $05, 1, 1, 2, 0, $10D)
    %spritemapEntry(0, $1FD, $0D, 1, 1, 2, 0, $10C)

Spritemap_YappingMaw_11:
    dw $0003                                                             ;A8AA69;
    %spritemapEntry(1, $1F8, $F8, 1, 1, 2, 0, $102)
    %spritemapEntry(1, $1EF, $FC, 1, 0, 2, 0, $106)
    %spritemapEntry(1, $1F4, $01, 1, 0, 2, 0, $108)

Spritemap_YappingMaw_12:
    dw $0005                                                             ;A8AA7A;
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $104)
    %spritemapEntry(0, $1FA, $04, 1, 1, 2, 0, $10D)
    %spritemapEntry(0, $1FA, $0C, 1, 1, 2, 0, $10C)
    %spritemapEntry(0, $1FA, $F4, 0, 1, 2, 0, $10D)
    %spritemapEntry(0, $1FA, $EC, 0, 1, 2, 0, $10C)

Spritemap_YappingMaw_13:
    dw $0003                                                             ;A8AA95;
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $1F0, $EC, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $1F0, $04, 1, 0, 2, 0, $108)

Spritemap_YappingMaw_14:
    dw $0005                                                             ;A8AAA6;
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $104)
    %spritemapEntry(0, $1F5, $F8, 1, 0, 2, 0, $10F)
    %spritemapEntry(0, $1ED, $F8, 1, 0, 2, 0, $10E)
    %spritemapEntry(0, $1F5, $00, 0, 0, 2, 0, $10F)
    %spritemapEntry(0, $1ED, $00, 0, 0, 2, 0, $10E)

Spritemap_YappingMaw_15:
    dw $0003                                                             ;A8AAC1;
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $1FE, $EE, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $1EE, $FE, 1, 0, 2, 0, $108)

Spritemap_YappingMaw_16:
    dw $0005                                                             ;A8AAD2;
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $102)
    %spritemapEntry(0, $1F3, $FD, 0, 0, 2, 0, $10F)
    %spritemapEntry(0, $1EB, $FD, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1FD, $F3, 0, 1, 2, 0, $10D)
    %spritemapEntry(0, $1FD, $EB, 0, 1, 2, 0, $10C)

Spritemap_YappingMaw_17:
    dw $0003                                                             ;A8AAED;
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $1EF, $F4, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1F4, $EF, 0, 0, 2, 0, $108)


;;; $AAFE: Palette - enemy $E7FF (kago) ;;;
Palette_Kago:
    dw $3800,$57FF,$42F7,$0929,$00A5,$4F5A,$36B5,$2610                   ;A8AAFE;
    dw $1DCE,$01DF,$001F,$0018,$000A,$06B9,$00EA,$0045                   ;A8AB0E;


;;; $AB1E: Instruction list - slow ;;;
InstList_Kago_Initial_SlowAnimation:
    dw $000A,Spritemap_Kago_0                                            ;A8AB1E;
    dw $000A,Spritemap_Kago_1                                            ;A8AB22;
    dw $000A,Spritemap_Kago_2                                            ;A8AB26;
    dw $000A,Spritemap_Kago_1                                            ;A8AB2A;
    dw Common_Instruction_GotoY                                          ;A8AB2E;
    dw InstList_Kago_Initial_SlowAnimation                               ;A8AB30;


;;; $AB32: Instruction list - fast ;;;
InstList_Kago_TakenHit_FastAnimation:
    dw $0003,Spritemap_Kago_0                                            ;A8AB32;
    dw $0003,Spritemap_Kago_1                                            ;A8AB36;
    dw $0003,Spritemap_Kago_2                                            ;A8AB3A;
    dw $0003,Spritemap_Kago_1                                            ;A8AB3E;
    dw Common_Instruction_GotoY                                          ;A8AB42;
    dw InstList_Kago_TakenHit_FastAnimation                              ;A8AB44;


;;; $AB46: Initialisation AI - enemy $E7FF (kago) ;;;
InitAI_Kago:
; Hit counter is $7E:7808, how obscure
    LDX.W EnemyIndex                                                     ;A8AB46;
    LDA.W Enemy.properties,X                                             ;A8AB49;
    ORA.W #$2000                                                         ;A8AB4C;
    STA.W Enemy.properties,X                                             ;A8AB4F;
    LDA.W #$0001                                                         ;A8AB52;
    STA.W Enemy.instTimer,X                                              ;A8AB55;
    STZ.W Enemy.loopCounter,X                                            ;A8AB58;
    STZ.W Enemy.var4,X                                                   ;A8AB5B;
    LDA.W #InstList_Kago_Initial_SlowAnimation                           ;A8AB5E;
    STA.W Enemy.instList,X                                               ;A8AB61;
    LDA.W #Function_Kago_Nothing                                         ;A8AB64;
    STA.W Kago.function,X                                                ;A8AB67;
    STZ.W Enemy.var5,X                                                   ;A8AB6A;
    LDA.W Enemy.init0,X                                                  ;A8AB6D;
    STA.L Kago.hitCounter,X                                              ;A8AB70;
    RTL                                                                  ;A8AB74;


;;; $AB75: Main AI - enemy $E7FF (kago) ;;;
MainAI_Kago:
    LDX.W EnemyIndex                                                     ;A8AB75;
    JMP.W (Kago.function,X)                                              ;A8AB78;


;;; $AB7B: Kago function - nothing ;;;
Function_Kago_Nothing:
    LDA.W #.return                                                       ;A8AB7B;
    STA.W Kago.function,X                                                ;A8AB7E;

  .return:
    RTL                                                                  ;A8AB81;


;;; $AB82: RTL ;;;
RTL_A8AB82:
    RTL                                                                  ;A8AB82;


;;; $AB83: Enemy shot - enemy $E7FF (kago) ;;;
EnemyShot_Kago:
    PHX                                                                  ;A8AB83;
    PHY                                                                  ;A8AB84;
    JSL.L NormalEnemyShotAI_Internal                                     ;A8AB85;
    LDA.W #$0002                                                         ;A8AB89;
    STA.W EarthquakeType                                                 ;A8AB8C;
    LDA.W #$0010                                                         ;A8AB8F;
    STA.W EarthquakeTimer                                                ;A8AB92;
    LDX.W EnemyIndex                                                     ;A8AB95;
    LDA.W Kago.fastAnimationFlag,X                                       ;A8AB98;
    BNE .takenHit                                                        ;A8AB9B;
    LDA.W #$0001                                                         ;A8AB9D;
    STA.W Kago.fastAnimationFlag,X                                       ;A8ABA0;
    LDA.W #InstList_Kago_TakenHit_FastAnimation                          ;A8ABA3;
    STA.W Enemy.instList,X                                               ;A8ABA6;
    LDA.W #$0001                                                         ;A8ABA9;
    STA.W Enemy.instTimer,X                                              ;A8ABAC;

  .takenHit:
    LDA.L Kago.hitCounter,X                                              ;A8ABAF;
    SEC                                                                  ;A8ABB3;
    SBC.W #$0001                                                         ;A8ABB4;
    STA.L Kago.hitCounter,X                                              ;A8ABB7;
    BPL .notDead                                                         ;A8ABBB;
    LDA.W #$0004                                                         ;A8ABBD;
    JSL.L EnemyDeath                                                     ;A8ABC0;
    LDX.W EnemyIndex                                                     ;A8ABC4;
    LDA.W #$0001                                                         ;A8ABC7;
    STA.W Enemy.var5,X                                                   ;A8ABCA;

  .notDead:
    LDY.W #EnemyProjectile_KagoBug                                       ;A8ABCD;
    LDA.W Enemy.YPosition,X                                              ;A8ABD0;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A8ABD3;
    PLY                                                                  ;A8ABD7;
    PLX                                                                  ;A8ABD8;
    RTL                                                                  ;A8ABD9;


;;; $ABDA: Kago spritemaps ;;;
Spritemap_Kago_0:
    dw $0004                                                             ;A8ABDA;
    %spritemapEntry(1, $00, $00, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $00, $F0, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $100)

Spritemap_Kago_1:
    dw $0004                                                             ;A8ABF0;
    %spritemapEntry(1, $00, $00, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $00, $F0, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $104)

Spritemap_Kago_2:
    dw $0004                                                             ;A8AC06;
    %spritemapEntry(1, $00, $00, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $00, $F0, 0, 0, 2, 0, $10A)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $108)


;;; $AC1C: Palette - enemy $E83F (magdollite) ;;;
Palette_Magdollite:
    dw $3800,$001F,$001C,$0018,$0015,$7FFF,$3BE0,$2680,$1580             ;A8AC1C;


;;; $AC3C: Magdollite glow palettes ;;;
Palette_Magdollite_Glow_0:
    dw $023F                                                             ;A8AC2E;
Palette_Magdollite_Glow_1:
    dw $00BD                                                             ;A8AC30;
Palette_Magdollite_Glow_2:
    dw $0014                                                             ;A8AC32;
Palette_Magdollite_Glow_3:
    dw $0010                                                             ;A8AC34;
    dw $0000,$0000,$0000

;                                                              Only these four colours are actually used
;                                                              |
    dw $3800,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000, $00BD,$0014,$0010,$023F, $0000,$0000,$0000
    dw $3800,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000, $0014,$0010,$023F,$00BD, $0000,$0000,$0000
    dw $3800,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000, $0010,$023F,$00BD,$0014, $0000,$0000,$0000


;;; $AC9C: Instruction list - head - facing left - idle ;;;
InstList_Magdollite_Idling_FacingLeft:
    dw $000D,Spritemap_Magdollite_FacingLeft_Head_0                      ;A8AC9C;
    dw $000D,Spritemap_Magdollite_FacingLeft_Head_1                      ;A8ACA0;
    dw $000D,Spritemap_Magdollite_FacingLeft_Head_2                      ;A8ACA4;
    dw $000D,Spritemap_Magdollite_FacingLeft_Head_1                      ;A8ACA8;
    dw Common_Instruction_GotoY                                          ;A8ACAC;
    dw InstList_Magdollite_Idling_FacingLeft                             ;A8ACAE;


;;; $ACB0: Instruction list - hand - facing left - throwing lava ;;;
InstList_Magdollite_Slave2_ThrowFireballs_FacingLeft:
    dw Instruction_Magdollite_QueueSFXInY_Lib2_Max6_IfOnScreen           ;A8ACB0;
    dw $0061                                                             ;A8ACB2;
    dw Instruction_Magdollite_SetWaitingFlag                             ;A8ACB4;
    dw Instruction_Magdollite_SetCooldownTimerTo100                      ;A8ACB6;
    dw $001A,Spritemap_Magdollite_FacingLeft_Fist_0                      ;A8ACB8;
    dw $0008,Spritemap_Magdollite_FacingLeft_Fist_1                      ;A8ACBC;
    dw Instruction_Magdollite_ShiftLeft8Pixels_Up4Pixels_FacingLeft      ;A8ACC0;
    dw $0005,Spritemap_Magdollite_FacingLeft_Hand_FingersStraight        ;A8ACC2;
    dw Instruction_Magdollite_SpawnLavaProjectile                        ;A8ACC6;
    dw $0005,Spritemap_Magdollite_FacingLeft_Hand_FingersStraight        ;A8ACC8;
    dw Instruction_Magdollite_SpawnLavaProjectile                        ;A8ACCC;
    dw $0005,Spritemap_Magdollite_FacingLeft_Hand_FingersStraight        ;A8ACCE;
    dw Instruction_Magdollite_SpawnLavaProjectile                        ;A8ACD2;
    dw Instruction_Magdollite_ShiftLeft8Pixels_Up4Pixels_Left_dup        ;A8ACD4;
    dw $0005,Spritemap_Magdollite_FacingLeft_Hand_FingersCurled          ;A8ACD6;
    dw Instruction_Magdollite_ResetWaitingFlag                           ;A8ACDA;
    dw Common_Instruction_Sleep                                          ;A8ACDC;


;;; $ACDE: Instruction list - head - facing left - submerge into lava ;;;
InstList_Magdollite_SplashIntoLavaAndFormBasePillar_Left_0:
    dw Instruction_Magdollite_SetWaitingFlag                             ;A8ACDE;
    dw $0005,Spritemap_Magdollite_FacingLeft_Head_1                      ;A8ACE0;
    dw Instruction_Magdollite_MoveDown2Pixels                            ;A8ACE4;
    dw $0005,Spritemap_Magdollite_FacingLeft_Head_1                      ;A8ACE6;
    dw $0005,Spritemap_Magdollite_FacingLeft_Head_PokingOutOfLava        ;A8ACEA;
    dw $0005,Spritemap_Magdollite_FacingLeft_Head_BarelyPokingOutOfLava  ;A8ACEE;
    dw Instruction_Magdollite_MoveDown2Pixels                            ;A8ACF2;
    dw $0005,Spritemap_Magdollite_FacingLeft_Head_BarelyPokingOutOfLava  ;A8ACF4;
    dw Instruction_Magdollite_MoveDownBy18Pixels_SetSlavesAsVisible      ;A8ACF8;
    dw Common_Instruction_TimerInY                                       ;A8ACFA;
    dw $0018                                                             ;A8ACFC;

InstList_Magdollite_SplashIntoLavaAndFormBasePillar_Left_1:
    dw Instruction_Magdollite_MoveBaseAndPillarUp1Pixel                  ;A8ACFE;
    dw $0001,Spritemap_Magdollite_FacingLeft_WidePillarSection           ;A8AD00;
    dw Common_Instruction_DecrementTimer_GotoYIfNonZero_duplicate        ;A8AD04;
    dw InstList_Magdollite_SplashIntoLavaAndFormBasePillar_Left_1        ;A8AD06;
    dw Instruction_Magdollite_ResetWaitingFlag                           ;A8AD08;
    dw Common_Instruction_Sleep                                          ;A8AD0A;


;;; $AD0C: Instruction list - head - facing left - emerge from lava ;;;
InstList_Magdollite_UnformBasePillar_SplashBackToIdle_Left_0:
    dw Instruction_Magdollite_SetWaitingFlag                             ;A8AD0C;
    dw Instruction_Magdollite_RestoreInitialYPositions                   ;A8AD0E;
    dw Common_Instruction_TimerInY                                       ;A8AD10;
    dw $0018                                                             ;A8AD12;

InstList_Magdollite_UnformBasePillar_SplashBackToIdle_Left_1:
    dw Instruction_Magdollite_MoveBaseAndPillarDown1Pixel                ;A8AD14;
    dw $0001,Spritemap_Magdollite_FacingLeft_WidePillarSection           ;A8AD16;
    dw Common_Instruction_DecrementTimer_GotoYIfNonZero_duplicate        ;A8AD1A;
    dw InstList_Magdollite_UnformBasePillar_SplashBackToIdle_Left_1      ;A8AD1C;
    dw Instruction_Magdollite_MoveDown4Pixels_SetSlavesAsInvisible       ;A8AD1E;
    dw $0005,Spritemap_Magdollite_FacingLeft_Head_BarelyPokingOutOfLava  ;A8AD20;
    dw Instruction_Magdollite_MoveUp2Pixels                              ;A8AD24;
    dw $0005,Spritemap_Magdollite_FacingLeft_Head_BarelyPokingOutOfLava  ;A8AD26;
    dw $0005,Spritemap_Magdollite_FacingLeft_Head_PokingOutOfLava        ;A8AD2A;
    dw $0005,Spritemap_Magdollite_FacingLeft_Head_1                      ;A8AD2E;
    dw Instruction_Magdollite_MoveUp2Pixels                              ;A8AD32;
    dw $0005,Spritemap_Magdollite_FacingLeft_Head_1                      ;A8AD34;
    dw Instruction_Magdollite_ResetWaitingFlag                           ;A8AD38;
    dw Common_Instruction_Sleep                                          ;A8AD3A;


;;; $AD3C: Instruction list - head - facing right - idle ;;;
InstList_Magdollite_Idling_FacingRight:
    dw $000D,Spritemap_Magdollite_FacingRight_Head_0                     ;A8AD3C;
    dw $000D,Spritemap_Magdollite_FacingRight_Head_1                     ;A8AD40;
    dw $000D,Spritemap_Magdollite_FacingRight_Head_2                     ;A8AD44;
    dw $000D,Spritemap_Magdollite_FacingRight_Head_1                     ;A8AD48;
    dw Common_Instruction_GotoY                                          ;A8AD4C;
    dw InstList_Magdollite_Idling_FacingRight                            ;A8AD4E;


;;; $AD50: Instruction list - hand - facing right - throwing lava ;;;
InstList_Magdollite_ThrowFireballs_FacingRight:
    dw Instruction_Magdollite_QueueSFXInY_Lib2_Max6_IfOnScreen           ;A8AD50;
    dw $0061                                                             ;A8AD52;
    dw Instruction_Magdollite_SetWaitingFlag                             ;A8AD54;
    dw Instruction_Magdollite_SetCooldownTimerTo100                      ;A8AD56;
    dw $001A,Spritemap_Magdollite_FacingRight_Fist_0                     ;A8AD58;
    dw $0008,Spritemap_Magdollite_FacingRight_Fist_1                     ;A8AD5C;
    dw Instruction_Magdollite_ShiftRight8Pixels_Up4Pixels_FaceRight      ;A8AD60;
    dw $0005,Spritemap_Magdollite_FacingRight_Hand_FingersStraight       ;A8AD62;
    dw Instruction_Magdollite_SpawnLavaProjectile                        ;A8AD66;
    dw $0005,Spritemap_Magdollite_FacingRight_Hand_FingersStraight       ;A8AD68;
    dw Instruction_Magdollite_SpawnLavaProjectile                        ;A8AD6C;
    dw $0005,Spritemap_Magdollite_FacingRight_Hand_FingersStraight       ;A8AD6E;
    dw Instruction_Magdollite_SpawnLavaProjectile                        ;A8AD72;
    dw Instruction_Magdollite_ShiftRight8Pixels_Up4Pixels_Right_dup      ;A8AD74;
    dw $0005,Spritemap_Magdollite_FacingRight_Hand_FingersCurled         ;A8AD76;
    dw Instruction_Magdollite_ResetWaitingFlag                           ;A8AD7A;
    dw Common_Instruction_Sleep                                          ;A8AD7C;


;;; $AD7E: Instruction list - head - facing right - submerge into lava ;;;
InstList_Magdollite_SplashIntoLavaAndFormBasePillar_Right_0:
    dw Instruction_Magdollite_SetWaitingFlag                             ;A8AD7E;
    dw $0005,Spritemap_Magdollite_FacingRight_Head_1                     ;A8AD80;
    dw Instruction_Magdollite_MoveDown2Pixels                            ;A8AD84;
    dw $0005,Spritemap_Magdollite_FacingRight_Head_1                     ;A8AD86;
    dw $0005,Spritemap_Magdollite_FacingRight_Head_PokingOutOfLava       ;A8AD8A;
    dw $0005,Spritemap_Magdollite_FacingRight_Head_BarelyPokingOutOfLava ;A8AD8E;
    dw Instruction_Magdollite_MoveDown2Pixels                            ;A8AD92;
    dw $0005,Spritemap_Magdollite_FacingRight_Head_BarelyPokingOutOfLava ;A8AD94;
    dw Instruction_Magdollite_MoveDownBy18Pixels_SetSlavesAsVisible      ;A8AD98;
    dw Common_Instruction_TimerInY                                       ;A8AD9A;
    dw $0018                                                             ;A8AD9C;

InstList_Magdollite_SplashIntoLavaAndFormBasePillar_Right_1:
    dw Instruction_Magdollite_MoveBaseAndPillarUp1Pixel                  ;A8AD9E;
    dw $0001,Spritemap_Magdollite_FacingRight_WidePillarSection          ;A8ADA0;
    dw Common_Instruction_DecrementTimer_GotoYIfNonZero_duplicate        ;A8ADA4;
    dw InstList_Magdollite_SplashIntoLavaAndFormBasePillar_Right_1       ;A8ADA6;
    dw Instruction_Magdollite_ResetWaitingFlag                           ;A8ADA8;
    dw Common_Instruction_Sleep                                          ;A8ADAA;


;;; $ADAC: Instruction list - head - facing right - emerge from lava ;;;
InstList_Magdollite_UnformBasePillar_SplashBackToIdle_Right_0:
    dw Instruction_Magdollite_SetWaitingFlag                             ;A8ADAC;
    dw Instruction_Magdollite_RestoreInitialYPositions                   ;A8ADAE;
    dw Common_Instruction_TimerInY                                       ;A8ADB0;
    dw $0018                                                             ;A8ADB2;

InstList_Magdollite_UnformBasePillar_SplashBackToIdle_Right_1:
    dw Instruction_Magdollite_MoveBaseAndPillarDown1Pixel                ;A8ADB4;
    dw $0001,Spritemap_Magdollite_FacingRight_WidePillarSection          ;A8ADB6;
    dw Common_Instruction_DecrementTimer_GotoYIfNonZero_duplicate        ;A8ADBA;
    dw InstList_Magdollite_UnformBasePillar_SplashBackToIdle_Right_1     ;A8ADBC;
    dw Instruction_Magdollite_MoveDown4Pixels_SetSlavesAsInvisible       ;A8ADBE;
    dw $0005,Spritemap_Magdollite_FacingRight_Head_BarelyPokingOutOfLava ;A8ADC0;
    dw Instruction_Magdollite_MoveUp2Pixels                              ;A8ADC4;
    dw $0005,Spritemap_Magdollite_FacingRight_Head_BarelyPokingOutOfLava ;A8ADC6;
    dw $0005,Spritemap_Magdollite_FacingRight_Head_PokingOutOfLava       ;A8ADCA;
    dw $0005,Spritemap_Magdollite_FacingRight_Head_1                     ;A8ADCE;
    dw Instruction_Magdollite_MoveUp2Pixels                              ;A8ADD2;
    dw $0005,Spritemap_Magdollite_FacingRight_Head_1                     ;A8ADD4;
    dw Instruction_Magdollite_ResetWaitingFlag                           ;A8ADD8;
    dw Common_Instruction_Sleep                                          ;A8ADDA;


;;; $ADDC: Instruction list - arm - growth level 0 ;;;
InstList_Magdollite_Slave1_NarrowPillar_FacingLeft:
    dw $0001,Spritemap_Magdollite_FacingLeft_NarrowPillarSection         ;A8ADDC;
    dw Common_Instruction_Sleep                                          ;A8ADE0;


;;; $ADE2: Instruction list - arm - growth level 1 ;;;
InstList_Magdollite_Slave1_NarrowPillar_FacingRight:
    dw $0001,Spritemap_Magdollite_FacingRight_NarrowPillarSection        ;A8ADE2;
    dw Common_Instruction_Sleep                                          ;A8ADE6;


;;; $ADE8: Instruction list - arm - growth level 2 ;;;
InstList_Magdollite_Slave1_3xPillarStack:
    dw $0001,Spritemap_Magdollite_NarrowPillarStacks_3x                  ;A8ADE8;
    dw Common_Instruction_Sleep                                          ;A8ADEC;


;;; $ADEE: Instruction list - arm - growth level 3 ;;;
InstList_Magdollite_Slave1_4xPillarStack:
    dw $0001,Spritemap_Magdollite_NarrowPillarStacks_4x                  ;A8ADEE;
    dw Common_Instruction_Sleep                                          ;A8ADF2;


;;; $ADF4: Instruction list - arm - growth level 4 ;;;
InstList_Magdollite_Slave1_5xPillarStack:
    dw $0001,Spritemap_Magdollite_NarrowPillarStacks_5x                  ;A8ADF4;
    dw Common_Instruction_Sleep                                          ;A8ADF8;


;;; $ADFA: Instruction list - arm - growth level 5 ;;;
InstList_Magdollite_Slave1_6xPillarStack:
    dw $0001,Spritemap_Magdollite_NarrowPillarStacks_6x                  ;A8ADFA;
    dw Common_Instruction_Sleep                                          ;A8ADFE;


;;; $AE00: Instruction list - arm - growth level 6 ;;;
InstList_Magdollite_Slave1_7xPillarStack:
    dw $0001,Spritemap_Magdollite_NarrowPillarStacks_7x                  ;A8AE00;
    dw Common_Instruction_Sleep                                          ;A8AE04;


;;; $AE06: Instruction list - arm - growth level 7 ;;;
InstList_Magdollite_Slave1_8xPillarStack:
    dw $0001,Spritemap_Magdollite_NarrowPillarStacks_8x                  ;A8AE06;
    dw Common_Instruction_Sleep                                          ;A8AE0A;


;;; $AE0C: Instruction list - hand - stub ;;;
InstList_Magdollite_Slave2_PillarCap:
    dw $0001,Spritemap_Magdollite_FacingLeft_PillarCap                   ;A8AE0C;
    dw Common_Instruction_Sleep                                          ;A8AE10;


;;; $AE12: Instruction - queue sound [[Y]], sound library 2, max queued sounds allowed = 6, if enemy is on-screen ;;;
Instruction_Magdollite_QueueSFXInY_Lib2_Max6_IfOnScreen:
    PHX                                                                  ;A8AE12;
    PHY                                                                  ;A8AE13;
    JSL.L CheckIfEnemyCenterIsOnScreen                                   ;A8AE14;
    BNE .offScreen                                                       ;A8AE18;
    LDA.W $0000,Y                                                        ;A8AE1A;
    JSL.L QueueSound_Lib2_Max6                                           ;A8AE1D;

  .offScreen:
    PLY                                                                  ;A8AE21;
    PLX                                                                  ;A8AE22;
    INY                                                                  ;A8AE23;
    INY                                                                  ;A8AE24;
    RTL                                                                  ;A8AE25;


;;; $AE26: Instruction - move head down 2px ;;;
Instruction_Magdollite_MoveDown2Pixels:
    LDX.W EnemyIndex                                                     ;A8AE26;
    INC.W Enemy.YPosition,X                                              ;A8AE29;
    INC.W Enemy.YPosition,X                                              ;A8AE2C;
    RTL                                                                  ;A8AE2F;


;;; $AE30: Instruction - move head up 2px ;;;
Instruction_Magdollite_MoveUp2Pixels:
    LDX.W EnemyIndex                                                     ;A8AE30;
    DEC.W Enemy.YPosition,X                                              ;A8AE33;
    DEC.W Enemy.YPosition,X                                              ;A8AE36;
    RTL                                                                  ;A8AE39;


;;; $AE3A: Instruction - set animation active flag ;;;
Instruction_Magdollite_SetWaitingFlag:
    LDX.W EnemyIndex                                                     ;A8AE3A;
    LDA.W #$0001                                                         ;A8AE3D;
    STA.L Magdollite.animationActiveFlag,X                               ;A8AE40;
    RTL                                                                  ;A8AE44;


;;; $AE45: Instruction - clear animation active flag ;;;
Instruction_Magdollite_ResetWaitingFlag:
    LDX.W EnemyIndex                                                     ;A8AE45;
    LDA.W #$0000                                                         ;A8AE48;
    STA.L Magdollite.animationActiveFlag,X                               ;A8AE4B;
    RTL                                                                  ;A8AE4F;


;;; $AE50: Instruction - move head + arm up 1px ;;;
Instruction_Magdollite_MoveBaseAndPillarUp1Pixel:
    LDX.W EnemyIndex                                                     ;A8AE50;
    DEC.W Enemy.YPosition,X                                              ;A8AE53;
    DEC.W Enemy[1].YPosition,X                                           ;A8AE56;
    RTL                                                                  ;A8AE59;


;;; $AE5A: Instruction - move head + arm down 1px ;;;
Instruction_Magdollite_MoveBaseAndPillarDown1Pixel:
    LDX.W EnemyIndex                                                     ;A8AE5A;
    INC.W Enemy.YPosition,X                                              ;A8AE5D;
    INC.W Enemy[1].YPosition,X                                           ;A8AE60;
    RTL                                                                  ;A8AE63;


;;; $AE64: Instruction - set submerged head + arm position, make arm + hand visible ;;;
Instruction_Magdollite_MoveDownBy18Pixels_SetSlavesAsVisible:
    LDX.W EnemyIndex                                                     ;A8AE64;
    LDA.L Magdollite.YSpawnPosition,X                                    ;A8AE67;
    CLC                                                                  ;A8AE6B;
    ADC.W #$0018                                                         ;A8AE6C;
    STA.W Enemy.YPosition,X                                              ;A8AE6F;
    STA.W Enemy[1].YPosition,X                                           ;A8AE72;
    LDA.W Enemy[1].properties,X                                          ;A8AE75;
    AND.W #$FEFF                                                         ;A8AE78;
    STA.W Enemy[1].properties,X                                          ;A8AE7B;
    LDA.W Enemy[2].properties,X                                          ;A8AE7E;
    AND.W #$FEFF                                                         ;A8AE81;
    STA.W Enemy[2].properties,X                                          ;A8AE84;
    RTL                                                                  ;A8AE87;


;;; $AE88: Instruction - reset head + arm position ;;;
Instruction_Magdollite_RestoreInitialYPositions:
    LDX.W EnemyIndex                                                     ;A8AE88;
    LDA.L Magdollite.YSpawnPosition,X                                    ;A8AE8B;
    STA.W Enemy.YPosition,X                                              ;A8AE8F;
    STA.W Enemy[1].YPosition,X                                           ;A8AE92;
    RTL                                                                  ;A8AE95;


;;; $AE96: Instruction - set emerged head + arm position, make arm + hand invisible ;;;
Instruction_Magdollite_MoveDown4Pixels_SetSlavesAsInvisible:
    LDX.W EnemyIndex                                                     ;A8AE96;
    LDA.L Magdollite.YSpawnPosition,X                                    ;A8AE99;
    CLC                                                                  ;A8AE9D;
    ADC.W #$0004                                                         ;A8AE9E;
    STA.W Enemy.YPosition,X                                              ;A8AEA1;
    STA.W Enemy[1].YPosition,X                                           ;A8AEA4;
    LDA.W Enemy[1].properties,X                                          ;A8AEA7;
    ORA.W #$0100                                                         ;A8AEAA;
    STA.W Enemy[1].properties,X                                          ;A8AEAD;
    LDA.W Enemy[2].properties,X                                          ;A8AEB0;
    ORA.W #$0100                                                         ;A8AEB3;
    STA.W Enemy[2].properties,X                                          ;A8AEB6;
    RTL                                                                  ;A8AEB9;


;;; $AEBA: Instruction - spawn magdollite lava enemy projectile ;;;
Instruction_Magdollite_SpawnLavaProjectile:
    PHY                                                                  ;A8AEBA;
    LDX.W EnemyIndex                                                     ;A8AEBB;
    LDY.W #EnemyProjectile_Magdollite                                    ;A8AEBE;
    LDA.W Magdollite.handDirection,X                                     ;A8AEC1;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A8AEC4;
    PLY                                                                  ;A8AEC8;
    RTL                                                                  ;A8AEC9;


;;; $AECA: Instruction - set open hand position - facing right ;;;
Instruction_Magdollite_ShiftRight8Pixels_Up4Pixels_FaceRight:
    LDX.W EnemyIndex                                                     ;A8AECA;
    LDA.L Magdollite.throwXPosition,X                                    ;A8AECD;
    CLC                                                                  ;A8AED1;
    ADC.W #$0008                                                         ;A8AED2;
    STA.W Enemy.XPosition,X                                              ;A8AED5;
    LDA.L Magdollite.throwYPosition,X                                    ;A8AED8;
    CLC                                                                  ;A8AEDC;
    ADC.W #$FFFC                                                         ;A8AEDD;
    STA.W Enemy.YPosition,X                                              ;A8AEE0;
    RTL                                                                  ;A8AEE3;


;;; $AEE4: Instruction - set open hand position - facing left ;;;
Instruction_Magdollite_ShiftLeft8Pixels_Up4Pixels_FacingLeft:
    LDX.W EnemyIndex                                                     ;A8AEE4;
    LDA.L Magdollite.throwXPosition,X                                    ;A8AEE7;
    CLC                                                                  ;A8AEEB;
    ADC.W #$FFF8                                                         ;A8AEEC;
    STA.W Enemy.XPosition,X                                              ;A8AEEF;
    LDA.L Magdollite.throwYPosition,X                                    ;A8AEF2;
    CLC                                                                  ;A8AEF6;
    ADC.W #$FFFC                                                         ;A8AEF7;
    STA.W Enemy.YPosition,X                                              ;A8AEFA;
    RTL                                                                  ;A8AEFD;


;;; $AEFE: Instruction - set closed hand position - facing right ;;;
Instruction_Magdollite_ShiftRight8Pixels_Up4Pixels_Right_dup:
    LDX.W EnemyIndex                                                     ;A8AEFE;
    LDA.L Magdollite.throwXPosition,X                                    ;A8AF01;
    CLC                                                                  ;A8AF05;
    ADC.W #$0008                                                         ;A8AF06;
    STA.W Enemy.XPosition,X                                              ;A8AF09;
    LDA.L Magdollite.throwYPosition,X                                    ;A8AF0C;
    CLC                                                                  ;A8AF10;
    ADC.W #$FFF8                                                         ;A8AF11;
    STA.W Enemy.YPosition,X                                              ;A8AF14;
    RTL                                                                  ;A8AF17;


;;; $AF18: Instruction - set closed hand position - facing left ;;;
Instruction_Magdollite_ShiftLeft8Pixels_Up4Pixels_Left_dup:
    LDX.W EnemyIndex                                                     ;A8AF18;
    LDA.L Magdollite.throwXPosition,X                                    ;A8AF1B;
    CLC                                                                  ;A8AF1F;
    ADC.W #$FFF8                                                         ;A8AF20;
    STA.W Enemy.XPosition,X                                              ;A8AF23;
    LDA.L Magdollite.throwYPosition,X                                    ;A8AF26;
    CLC                                                                  ;A8AF2A;
    ADC.W #$FFFC                                                         ;A8AF2B;
    STA.W Enemy.YPosition,X                                              ;A8AF2E;
    RTL                                                                  ;A8AF31;


if !FEATURE_KEEP_UNREFERENCED
;;; $AF32: Unused. Set hand throw position ;;;
UNUSED_Magdollite_RestoreXYPositions_A8AF32:
    LDX.W EnemyIndex                                                     ;A8AF32;
    LDA.L Magdollite.throwXPosition,X                                    ;A8AF35;
    STA.W Enemy.XPosition,X                                              ;A8AF39;
    LDA.L Magdollite.throwYPosition,X                                    ;A8AF3C;
    STA.W Enemy.YPosition,X                                              ;A8AF40;
    RTL                                                                  ;A8AF43;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $AF44: Instruction - reset cooldown timer ;;;
Instruction_Magdollite_SetCooldownTimerTo100:
    LDX.W EnemyIndex                                                     ;A8AF44;
    LDA.W #$0100                                                         ;A8AF47;
    STA.L Magdollite.cooldownTimer,X                                     ;A8AF4A;
    RTL                                                                  ;A8AF4E;


;;; $AF4F: Initialisation function pointers ;;;
InitAIFunctionPointers:
    dw Function_Magdollite_Init_Master                                   ;A8AF4F;
    dw Function_Magdollite_Init_Slave1                                   ;A8AF51;
    dw Function_Magdollite_Init_Slave2                                   ;A8AF53;


;;; $AF55: Magdollite arm growth table ;;;
MagdolliteArmHeightThreshold:
; Indexed by Magdollite.armGrowthTableIndex. First entry is unused
    dw $0000,$0010,$0020,$0030,$0040,$0050,$0060,$0070,$0080             ;A8AF55;

MagdolliteSlave1InstListPointers:
    dw InstList_Magdollite_Slave1_NarrowPillar_FacingLeft                ;A8AF67;
    dw InstList_Magdollite_Slave1_NarrowPillar_FacingLeft                ;A8AF69;
    dw InstList_Magdollite_Slave1_NarrowPillar_FacingRight               ;A8AF6B;
    dw InstList_Magdollite_Slave1_3xPillarStack                          ;A8AF6D;
    dw InstList_Magdollite_Slave1_4xPillarStack                          ;A8AF6F;
    dw InstList_Magdollite_Slave1_5xPillarStack                          ;A8AF71;
    dw InstList_Magdollite_Slave1_6xPillarStack                          ;A8AF73;
    dw InstList_Magdollite_Slave1_7xPillarStack                          ;A8AF75;
    dw InstList_Magdollite_Slave1_8xPillarStack                          ;A8AF77;

MagdolliteYOffsetAimingAtSamus:
; Hand Y offset
    dw $000C,$000C,$0014,$001C,$0024,$002C,$0034,$003C,$0044             ;A8AF79;


;;; $AF8B: Initialisation AI - enemy $E83F (magdollite) ;;;
InitAI_Magdollite:
    LDX.W EnemyIndex                                                     ;A8AF8B;
    LDA.W Enemy.init0,X                                                  ;A8AF8E;
    ASL                                                                  ;A8AF91;
    TAX                                                                  ;A8AF92;
    JSR.W (InitAIFunctionPointers,X)                                     ;A8AF93;
    JSR.W GetMagdolliteSpeeds                                            ;A8AF96;
    JSR.W SetMagdolliteGraphicsDrawnHook                                 ;A8AF99;
    RTL                                                                  ;A8AF9C;


;;; $AF9D: Magdollite initialisation function - head ;;;
Function_Magdollite_Init_Master:
    LDX.W EnemyIndex                                                     ;A8AF9D;
    LDA.W #$0000                                                         ;A8AFA0;
    STA.W Magdollite.instList,X                                          ;A8AFA3;
    STA.L Magdollite.headDirection,X                                     ;A8AFA6;
    STA.L Magdollite.emergeNotReadyFlag,X                                ;A8AFAA;
    LDA.W Enemy.YPosition,X                                              ;A8AFAE;
    STA.L Magdollite.YSpawnPosition,X                                    ;A8AFB1;
    JSL.L Get_SamusX_minus_EnemyX                                        ;A8AFB5;
    BPL .keepLeft                                                        ;A8AFB9;
    LDA.W #$0001                                                         ;A8AFBB;
    STA.L Magdollite.headDirection,X                                     ;A8AFBE;

  .keepLeft:
    LDA.L Magdollite.headDirection,X                                     ;A8AFC2;
    LDA.W #InstList_Magdollite_Idling_FacingLeft                         ;A8AFC6;
    STA.W Magdollite.newInstList,X                                       ;A8AFC9;
    LDA.L Magdollite.headDirection,X                                     ;A8AFCC;
    BNE .keepLeft2                                                       ;A8AFD0;
    LDA.W #InstList_Magdollite_Idling_FacingRight                        ;A8AFD2;
    STA.W Magdollite.newInstList,X                                       ;A8AFD5;

  .keepLeft2:
    JSR.W SetMagdolliteInstList                                          ;A8AFD8;
    LDA.W #Function_Magdollite_WaitForSamusToGetNear                     ;A8AFDB;
    STA.W Magdollite.function,X                                          ;A8AFDE;
    RTS                                                                  ;A8AFE1;


;;; $AFE2: Magdollite initialisation function - arm ;;;
Function_Magdollite_Init_Slave1:
    LDX.W EnemyIndex                                                     ;A8AFE2;
    LDA.W Enemy.YPosition,X                                              ;A8AFE5;
    STA.L Magdollite.YSpawnPosition,X                                    ;A8AFE8;
    LDA.W #$0000                                                         ;A8AFEC;
    STA.W Magdollite.instList,X                                          ;A8AFEF;
    STA.L Magdollite.finishedGrowingFlag,X                               ;A8AFF2;
    LDA.W #$0001                                                         ;A8AFF6;
    STA.L Magdollite.notEmergedFlag,X                                    ;A8AFF9;
    LDA.W #InstList_Magdollite_Slave1_NarrowPillar_FacingLeft            ;A8AFFD;
    STA.W Magdollite.newInstList,X                                       ;A8B000;
    JSR.W SetMagdolliteInstList                                          ;A8B003;
    LDA.W Enemy.YPosition,X                                              ;A8B006;
    CLC                                                                  ;A8B009;
    ADC.W #$0020                                                         ;A8B00A;
    STA.W Enemy.YPosition,X                                              ;A8B00D;
    LDA.W #Function_Magdollite_Slave1_WaitForAttackToBeTriggered         ;A8B010;
    STA.W Magdollite.function,X                                          ;A8B013;
    LDA.W Enemy.properties,X                                             ;A8B016;
    ORA.W #$0100                                                         ;A8B019;
    STA.W Enemy.properties,X                                             ;A8B01C;
    RTS                                                                  ;A8B01F;


;;; $B020: Magdollite initialisation function - hand ;;;
Function_Magdollite_Init_Slave2:
    LDX.W EnemyIndex                                                     ;A8B020;
    LDA.W Enemy.YPosition,X                                              ;A8B023;
    STA.L Magdollite.YSpawnPosition,X                                    ;A8B026;
    LDA.W Enemy.XPosition,X                                              ;A8B02A;
    STA.L ExtraEnemy7800+$22,X                                           ;A8B02D;
    LDA.W #$0000                                                         ;A8B031;
    STA.W Magdollite.instList,X                                          ;A8B034;
    STA.L Magdollite.cooldownTimer,X                                     ;A8B037;
    LDA.W #InstList_Magdollite_Slave2_PillarCap                          ;A8B03B;
    STA.W Magdollite.newInstList,X                                       ;A8B03E;
    JSR.W SetMagdolliteInstList                                          ;A8B041;
    LDA.W Enemy.YPosition,X                                              ;A8B044;
    CLC                                                                  ;A8B047;
    ADC.W #$0020                                                         ;A8B048;
    STA.W Enemy.YPosition,X                                              ;A8B04B;
    LDA.W #Function_Magdollite_Slave2_Idling_WaitingForTrigger           ;A8B04E;
    STA.W Magdollite.function,X                                          ;A8B051;
    LDA.W Enemy.properties,X                                             ;A8B054;
    ORA.W #$0100                                                         ;A8B057;
    STA.W Enemy.properties,X                                             ;A8B05A;
    RTS                                                                  ;A8B05D;


;;; $B05E: Set magdollite arm Y velocities ;;;
GetMagdolliteSpeeds:
    LDX.W EnemyIndex                                                     ;A8B05E;
    LDA.W Enemy.init1+1,X                                                ;A8B061;
    AND.W #$00FF                                                         ;A8B064;
    ASL                                                                  ;A8B067;
    ASL                                                                  ;A8B068;
    ASL                                                                  ;A8B069;
    TAY                                                                  ;A8B06A;
    LDA.W Common_EnemySpeeds_LinearlyIncreasing,Y                         ;A8B06B;
    STA.L Magdollite.downVelocity,X                                      ;A8B06E;
    LDA.W Common_EnemySpeeds_LinearlyIncreasing+2,Y                       ;A8B072;
    STA.L Magdollite.downSubVelocity,X                                   ;A8B075;
    LDA.W Common_EnemySpeeds_LinearlyIncreasing+4,Y                       ;A8B079;
    STA.L Magdollite.upVelocity,X                                        ;A8B07C;
    LDA.W Common_EnemySpeeds_LinearlyIncreasing+6,Y                       ;A8B080;
    STA.L Magdollite.upSubVelocity,X                                     ;A8B083;
    RTS                                                                  ;A8B087;


;;; $B088: Set up magdollite palette cycling ;;;
SetMagdolliteGraphicsDrawnHook:
    LDA.W #EnemyGraphicsDrawnHook_Magdollite_PeriodicallyCyclePalettes   ;A8B088;
    STA.W EnemyGraphicsDrawnHook                                         ;A8B08B;
    LDA.W #EnemyGraphicsDrawnHook_Magdollite_PeriodicallyCyclePalettes>>16 ;A8B08E;
    STA.W EnemyGraphicsDrawnHook+2                                       ;A8B091;
    LDA.W Enemy.palette,X                                                ;A8B094;
    AND.W #$0E00                                                         ;A8B097;
    LSR                                                                  ;A8B09A;
    LSR                                                                  ;A8B09B;
    LSR                                                                  ;A8B09C;
    LSR                                                                  ;A8B09D;
    CLC                                                                  ;A8B09E;
    ADC.W #$0100                                                         ;A8B09F;
    STA.W EnemyPaletteCycle_PaletteIndex                                 ;A8B0A2;
    LDA.W #$0008                                                         ;A8B0A5;
    STA.W EnemyPaletteCycle_Timer                                        ;A8B0A8;
    LDA.W #$0000                                                         ;A8B0AB;
    STA.W EnemyPaletteCycle_ColorSetIndex                                ;A8B0AE;
    RTS                                                                  ;A8B0B1;


;;; $B0B2: Enemy graphics drawn hook - magdollite - periodically cycle between palettes ;;;
EnemyGraphicsDrawnHook_Magdollite_PeriodicallyCyclePalettes:
; Why is this one implemented differently to the others? >_<;
    LDA.W DoorTransitionFlagEnemiesPause                                 ;A8B0B2;
    BNE .return                                                          ;A8B0B5;
    LDX.W EnemyIndex                                                     ;A8B0B7;
    LDA.W EnemyPaletteCycle_Timer                                        ;A8B0BA;
    DEC                                                                  ;A8B0BD;
    STA.W EnemyPaletteCycle_Timer                                        ;A8B0BE;
    BNE .return                                                          ;A8B0C1;
    LDA.W #$0008                                                         ;A8B0C3;
    STA.W EnemyPaletteCycle_Timer                                        ;A8B0C6;
    LDA.W EnemyPaletteCycle_ColorSetIndex                                ;A8B0C9;
    INC                                                                  ;A8B0CC;
    STA.W EnemyPaletteCycle_ColorSetIndex                                ;A8B0CD;
    AND.W #$0003                                                         ;A8B0D0;
    ASL                                                                  ;A8B0D3;
    ASL                                                                  ;A8B0D4;
    ASL                                                                  ;A8B0D5;
    ASL                                                                  ;A8B0D6;
    ASL                                                                  ;A8B0D7;
    TAY                                                                  ;A8B0D8;
    LDA.W Palette_Magdollite_Glow_0,Y                                    ;A8B0D9;
    STA.B DP_Temp12                                                      ;A8B0DC;
    LDA.W Palette_Magdollite_Glow_1,Y                                    ;A8B0DE;
    STA.B DP_Temp14                                                      ;A8B0E1;
    LDA.W Palette_Magdollite_Glow_2,Y                                    ;A8B0E3;
    STA.B DP_Temp16                                                      ;A8B0E6;
    LDA.W Palette_Magdollite_Glow_3,Y                                    ;A8B0E8;
    STA.B DP_Temp18                                                      ;A8B0EB;
    LDA.W EnemyPaletteCycle_PaletteIndex                                 ;A8B0ED;
    TAX                                                                  ;A8B0F0;
    LDA.B DP_Temp12                                                      ;A8B0F1;
    STA.L Palettes+$12,X                                                 ;A8B0F3;
    LDA.B DP_Temp14                                                      ;A8B0F7;
    STA.L Palettes+$14,X                                                 ;A8B0F9;
    LDA.B DP_Temp16                                                      ;A8B0FD;
    STA.L Palettes+$16,X                                                 ;A8B0FF;
    LDA.B DP_Temp18                                                      ;A8B103;
    STA.L Palettes+$18,X                                                 ;A8B105;

  .return:
    RTL                                                                  ;A8B109;


;;; $B10A: Main AI - enemy $E83F (magdollite) ;;;
MainAI_Magdollite:
    LDX.W EnemyIndex                                                     ;A8B10A;
    LDA.L Magdollite.cooldownTimer,X                                     ;A8B10D;
    DEC                                                                  ;A8B111;
    STA.L Magdollite.cooldownTimer,X                                     ;A8B112;
    JSR.W (Magdollite.function,X)                                        ;A8B116;
    RTL                                                                  ;A8B119;


;;; $B11A: Magdollite function - idle ;;;
Function_Magdollite_WaitForSamusToGetNear:
    LDX.W EnemyIndex                                                     ;A8B11A;
    LDA.W #$0000                                                         ;A8B11D;
    STA.L Magdollite.headDirection,X                                     ;A8B120;
    LDA.W #InstList_Magdollite_Idling_FacingLeft                         ;A8B124;
    STA.W Magdollite.newInstList,X                                       ;A8B127;
    JSL.L Get_SamusX_minus_EnemyX                                        ;A8B12A;
    BMI .facingDirectionChosen                                           ;A8B12E;
    LDA.W #InstList_Magdollite_Idling_FacingRight                        ;A8B130;
    STA.W Magdollite.newInstList,X                                       ;A8B133;
    LDA.W #$0001                                                         ;A8B136;
    STA.L Magdollite.headDirection,X                                     ;A8B139;

  .facingDirectionChosen:
    JSR.W SetMagdolliteInstList                                          ;A8B13D;
    LDA.L ExtraEnemy7800+$88,X                                           ;A8B140;
    BPL .return                                                          ;A8B144;
    LDA.W #$0000                                                         ;A8B146;
    STA.L ExtraEnemy7800+$88,X                                           ;A8B149;
    LDA.W Enemy.init1,X                                                  ;A8B14D;
    AND.W #$00FF                                                         ;A8B150;
    JSL.L IsSamusWithinAPixelColumnsOfEnemy                              ;A8B153;
    BEQ .return                                                          ;A8B157;
    LDA.W #InstList_Magdollite_SplashIntoLavaAndFormBasePillar_Left_0    ;A8B159;
    STA.W Magdollite.newInstList,X                                       ;A8B15C;
    LDA.L Magdollite.headDirection,X                                     ;A8B15F;
    BEQ .keepLeft                                                        ;A8B163;
    LDA.W #InstList_Magdollite_SplashIntoLavaAndFormBasePillar_Right_0   ;A8B165;
    STA.W Magdollite.newInstList,X                                       ;A8B168;

  .keepLeft:
    JSR.W SetMagdolliteInstList                                          ;A8B16B;
    LDA.W #Function_Magdollite_WaitUntilBasePillarFormed                 ;A8B16E;
    STA.W Magdollite.function,X                                          ;A8B171;

  .return:
    RTS                                                                  ;A8B174;


;;; $B175: Magdollite function - wait until submerged ;;;
Function_Magdollite_WaitUntilBasePillarFormed:
    LDX.W EnemyIndex                                                     ;A8B175;
    LDA.L Magdollite.animationActiveFlag,X                               ;A8B178;
    BNE .return                                                          ;A8B17C;
    LDA.W #$0001                                                         ;A8B17E;
    STA.L Magdollite.emergeNotReadyFlag,X                                ;A8B181;
    LDA.W #$0000                                                         ;A8B185;
    STA.L ExtraEnemy7800+$5A,X                                           ;A8B188;
    LDA.W #Function_Magdollite_WaitForOtherPartsToFinish                 ;A8B18C;
    STA.W Magdollite.function,X                                          ;A8B18F;

  .return:
    RTS                                                                  ;A8B192;


;;; $B193: Magdollite function - emerge when ready ;;;
Function_Magdollite_WaitForOtherPartsToFinish:
    LDX.W EnemyIndex                                                     ;A8B193;
    LDA.L Magdollite.emergeNotReadyFlag,X                                ;A8B196;
    BNE .return                                                          ;A8B19A;
    LDA.W #InstList_Magdollite_UnformBasePillar_SplashBackToIdle_Left_0  ;A8B19C;
    STA.W Magdollite.newInstList,X                                       ;A8B19F;
    JSL.L Get_SamusX_minus_EnemyX                                        ;A8B1A2;
    BMI .facingDirectionChosen                                           ;A8B1A6;
    LDA.W #InstList_Magdollite_UnformBasePillar_SplashBackToIdle_Right_0 ;A8B1A8;
    STA.W Magdollite.newInstList,X                                       ;A8B1AB;

  .facingDirectionChosen:
    JSR.W SetMagdolliteInstList                                          ;A8B1AE;
    LDA.W #Function_Magdollite_UnformBasePillarBackToHeadIdling          ;A8B1B1;
    STA.W Magdollite.function,X                                          ;A8B1B4;

  .return:
    RTS                                                                  ;A8B1B7;


;;; $B1B8: Magdollite function - wait until emerged ;;;
Function_Magdollite_UnformBasePillarBackToHeadIdling:
    LDX.W EnemyIndex                                                     ;A8B1B8;
    LDA.L Magdollite.animationActiveFlag,X                               ;A8B1BB;
    BNE .return                                                          ;A8B1BF;
    LDA.W #InstList_Magdollite_Idling_FacingLeft                         ;A8B1C1;
    STA.W Magdollite.newInstList,X                                       ;A8B1C4;
    JSL.L Get_SamusX_minus_EnemyX                                        ;A8B1C7;
    BMI .facingDirectionChosen                                           ;A8B1CB;
    LDA.W #InstList_Magdollite_Idling_FacingRight                        ;A8B1CD;
    STA.W Magdollite.newInstList,X                                       ;A8B1D0;

  .facingDirectionChosen:
    JSR.W SetMagdolliteInstList                                          ;A8B1D3;
    LDA.W #Function_Magdollite_WaitForSamusToGetNear                     ;A8B1D6;
    STA.W Magdollite.function,X                                          ;A8B1D9;

  .return:
    RTS                                                                  ;A8B1DC;


;;; $B1DD: Magdollite function - wait until head submerged ;;;
Function_Magdollite_Slave1_WaitForAttackToBeTriggered:
    LDX.W EnemyIndex                                                     ;A8B1DD;
    LDA.L Magdollite.notEmergedFlag,X                                    ;A8B1E0;
    BNE .return                                                          ;A8B1E4;
    LDA.W #Function_Magdollite_Slave1_HandlePillarGrowth                 ;A8B1E6;
    STA.W Magdollite.function,X                                          ;A8B1E9;
    LDA.W #$0000                                                         ;A8B1EC;
    STA.W Magdollite.negativeArmHeight,X                                 ;A8B1EF;
    STA.L Magdollite.notEmergedFlag,X                                    ;A8B1F2;
    LDA.W #$0002                                                         ;A8B1F6;
    STA.W Magdollite.armGrowthTableIndex,X                               ;A8B1F9;
    LDA.L Magdollite.YSpawnPosition,X                                    ;A8B1FC;
    STA.W Enemy.YPosition,X                                              ;A8B200;

  .return:
    RTS                                                                  ;A8B203;


;;; $B204: Magdollite function - growing arm ;;;
Function_Magdollite_Slave1_HandlePillarGrowth:
    LDX.W EnemyIndex                                                     ;A8B204;
    CLC                                                                  ;A8B207;
    LDA.W Enemy.YSubPosition,X                                           ;A8B208;
    ADC.L Magdollite.upSubVelocity-$40,X                                 ;A8B20B;
    STA.W Enemy.YSubPosition,X                                           ;A8B20F;
    BCC +                                                                ;A8B212;
    INC.W Magdollite.negativeArmHeight,X                                 ;A8B214;

+   LDA.W Enemy.YPosition,X                                              ;A8B217;
    ADC.L Magdollite.upVelocity-$40,X                                    ;A8B21A;
    STA.W Enemy.YPosition,X                                              ;A8B21E;
    CLC                                                                  ;A8B221;
    LDA.W Magdollite.negativeArmHeight,X                                 ;A8B222;
    ADC.L Magdollite.upVelocity-$40,X                                    ;A8B225;
    STA.W Magdollite.negativeArmHeight,X                                 ;A8B229;
    JSR.W Function_Magdollite_Slave1_AddPillarStacksToReachSamusHeight   ;A8B22C;
    RTS                                                                  ;A8B22F;


;;; $B230: Grow arm ;;;
Function_Magdollite_Slave1_AddPillarStacksToReachSamusHeight:
    LDA.W Magdollite.negativeArmHeight,X                                 ;A8B230;
    EOR.W #$FFFF                                                         ;A8B233;
    INC                                                                  ;A8B236;
    CMP.W #$006C                                                         ;A8B237;
    BPL .doneGrowing                                                     ;A8B23A;
    LDY.W Magdollite.armGrowthTableIndex,X                               ;A8B23C;
    LDA.W Enemy.YPosition,X                                              ;A8B23F;
    SEC                                                                  ;A8B242;
    SBC.W MagdolliteYOffsetAimingAtSamus,Y                               ;A8B243;
    CMP.W SamusYPosition                                                 ;A8B246;
    BMI .doneGrowing                                                     ;A8B249;
    LDA.W Magdollite.negativeArmHeight,X                                 ;A8B24B;
    EOR.W #$FFFF                                                         ;A8B24E;
    INC                                                                  ;A8B251;
    CMP.W MagdolliteArmHeightThreshold,Y                                 ;A8B252;
    BPL .increasePillarStack                                             ;A8B255;
    BRA .return                                                          ;A8B257;

  .doneGrowing:
    LDA.W #Function_Magdollite_Slave1_GetEnemyIndex                      ;A8B259;
    STA.W Magdollite.function,X                                          ;A8B25C;
    LDA.W #$0001                                                         ;A8B25F;
    STA.L Magdollite.finishedGrowingFlag,X                               ;A8B262;
    LDA.W Magdollite.negativeArmHeight,X                                 ;A8B266;
    EOR.W #$FFFF                                                         ;A8B269;
    INC                                                                  ;A8B26C;
    CMP.W MagdolliteArmHeightThreshold,Y                                 ;A8B26D;
    BPL .increasePillarStack                                             ;A8B270;
    BRA .return                                                          ;A8B272;

  .increasePillarStack:
    INC.W Magdollite.armGrowthTableIndex,X                               ;A8B274;
    INC.W Magdollite.armGrowthTableIndex,X                               ;A8B277;
    LDA.W Enemy.YPosition,X                                              ;A8B27A;
    CLC                                                                  ;A8B27D;
    ADC.W #$0008                                                         ;A8B27E;
    STA.W Enemy.YPosition,X                                              ;A8B281;
    LDY.W Magdollite.armGrowthTableIndex,X                               ;A8B284;
    LDA.W MagdolliteSlave1InstListPointers,Y                             ;A8B287;
    STA.W Magdollite.newInstList,X                                       ;A8B28A;
    JSR.W SetMagdolliteInstList                                          ;A8B28D;

  .return:
    RTS                                                                  ;A8B290;


;;; $B291: RTS ;;;
Function_Magdollite_Slave1_GetEnemyIndex:
    LDX.W EnemyIndex                                                     ;A8B291;
    RTS                                                                  ;A8B294;


;;; $B295: Magdollite function - shrinking arm ;;;
Function_Magdollite_Slave1_HandlePillarShrinking:
    LDX.W EnemyIndex                                                     ;A8B295;
    LDA.W Enemy.YPosition,X                                              ;A8B298;
    CLC                                                                  ;A8B29B;
    ADC.L Magdollite.downVelocity-$40,X                                  ;A8B29C;
    STA.W Enemy.YPosition,X                                              ;A8B2A0;
    LDA.W Magdollite.negativeArmHeight,X                                 ;A8B2A3;
    CLC                                                                  ;A8B2A6;
    ADC.L Magdollite.downVelocity-$40,X                                  ;A8B2A7;
    STA.W Magdollite.negativeArmHeight,X                                 ;A8B2AB;
    LDA.W Enemy.YSubPosition,X                                           ;A8B2AE;
    CLC                                                                  ;A8B2B1;
    ADC.L Magdollite.downSubVelocity-$40,X                               ;A8B2B2;
    BCC +                                                                ;A8B2B6;
    INC.W Enemy.YPosition,X                                              ;A8B2B8;
    INC.W Magdollite.negativeArmHeight,X                                 ;A8B2BB;

+   STA.W Enemy.YSubPosition,X                                           ;A8B2BE;
    JSR.W ShrinkMagdolliteArm                                            ;A8B2C1;
    RTS                                                                  ;A8B2C4;


;;; $B2C5: Shrink arm ;;;
ShrinkMagdolliteArm:
    LDY.W Magdollite.armGrowthTableIndex,X                               ;A8B2C5;
    DEY                                                                  ;A8B2C8;
    DEY                                                                  ;A8B2C9;
    LDA.W Magdollite.negativeArmHeight,X                                 ;A8B2CA;
    BPL .doneShrinking                                                   ;A8B2CD;
    EOR.W #$FFFF                                                         ;A8B2CF;
    INC                                                                  ;A8B2D2;
    CMP.W MagdolliteArmHeightThreshold,Y                                 ;A8B2D3;
    BMI .removeTileAndRecenter                                           ;A8B2D6;
    BRA .return                                                          ;A8B2D8;

  .removeTileAndRecenter:
    DEC.W Magdollite.armGrowthTableIndex,X                               ;A8B2DA;
    DEC.W Magdollite.armGrowthTableIndex,X                               ;A8B2DD;
    LDA.W Enemy.YPosition,X                                              ;A8B2E0;
    SEC                                                                  ;A8B2E3;
    SBC.W #$0008                                                         ;A8B2E4;
    STA.W Enemy.YPosition,X                                              ;A8B2E7;
    LDY.W Magdollite.armGrowthTableIndex,X                               ;A8B2EA;
    LDA.W MagdolliteSlave1InstListPointers,Y                             ;A8B2ED;
    STA.W Magdollite.newInstList,X                                       ;A8B2F0;
    JSR.W SetMagdolliteInstList                                          ;A8B2F3;
    BRA .return                                                          ;A8B2F6;

  .doneShrinking:
    LDA.W #$0001                                                         ;A8B2F8;
    STA.L Magdollite.notEmergedFlag,X                                    ;A8B2FB;
    LDA.W #$0000                                                         ;A8B2FF;
    STA.L Magdollite.emergeNotReadyFlag-$40,X                            ;A8B302;
    LDA.W #Function_Magdollite_Slave1_WaitForAttackToBeTriggered         ;A8B306;
    STA.W Magdollite.function,X                                          ;A8B309;

  .return:
    RTS                                                                  ;A8B30C;


;;; $B30D: Magdollite function - idle ;;;
Function_Magdollite_Slave2_Idling_WaitingForTrigger:
    LDX.W EnemyIndex                                                     ;A8B30D;
    LDA.W Enemy[-2].var5,X                                               ;A8B310;
    CMP.W #Function_Magdollite_WaitUntilBasePillarFormed                 ;A8B313;
    BNE .return                                                          ;A8B316;
    LDA.W #Function_Magdollite_Slave2_SetToThrowFireballsAfterGrowing    ;A8B318;
    STA.W Magdollite.function,X                                          ;A8B31B;

  .return:
    RTS                                                                  ;A8B31E;


;;; $B31F: Magdollite function - wait until finished throwing lava and shrink arm ;;;
Function_Magdollite_Slave2_SetSlave1ToShrinkAfterFireballs:
    LDX.W EnemyIndex                                                     ;A8B31F;
    LDA.L Magdollite.animationActiveFlag,X                               ;A8B322;
    BNE .done                                                            ;A8B326;
    LDA.W #InstList_Magdollite_Slave2_PillarCap                          ;A8B328;
    STA.W Magdollite.newInstList,X                                       ;A8B32B;
    JSR.W SetMagdolliteInstList                                          ;A8B32E;
    LDA.W #Function_Magdollite_Slave1_HandlePillarShrinking              ;A8B331;
    STA.W Enemy[-1].var5,X                                               ;A8B334;
    LDA.W #Function_Magdollite_Slave2_GoBackToIdlingAfterPillarShrinks   ;A8B337;
    STA.W Magdollite.function,X                                          ;A8B33A;
    LDA.W #$0000                                                         ;A8B33D;
    STA.L Magdollite.finishedGrowingFlag-$40,X                           ;A8B340;
    LDA.L Magdollite.throwXPosition,X                                    ;A8B344;
    STA.W Enemy.XPosition,X                                              ;A8B348;
    LDA.L Magdollite.throwYPosition,X                                    ;A8B34B;
    STA.W Enemy.YPosition,X                                              ;A8B34F;

  .done:
    JSR.W SetMagdolliteYRadius                                           ;A8B352;
    RTS                                                                  ;A8B355;


;;; $B356: Magdollite function - wait until finished growing and throw lava ;;;
Function_Magdollite_Slave2_SetToThrowFireballsAfterGrowing:
    LDX.W EnemyIndex                                                     ;A8B356;
    LDA.L Magdollite.finishedGrowingFlag-$40,X                           ;A8B359;
    BEQ .waiting                                                         ;A8B35D;
    LDA.W #InstList_Magdollite_Slave2_ThrowFireballs_FacingLeft          ;A8B35F;
    STA.W Magdollite.newInstList,X                                       ;A8B362;
    LDA.W #$0000                                                         ;A8B365;
    STA.W Magdollite.handDirection,X                                     ;A8B368;
    JSL.L Get_SamusX_minus_EnemyX                                        ;A8B36B;
    BMI .directionChosen                                                 ;A8B36F;
    LDA.W #InstList_Magdollite_ThrowFireballs_FacingRight                ;A8B371;
    STA.W Magdollite.newInstList,X                                       ;A8B374;
    LDA.W #$0001                                                         ;A8B377;
    STA.W Magdollite.handDirection,X                                     ;A8B37A;

  .directionChosen:
    JSR.W SetMagdolliteInstList                                          ;A8B37D;
    LDA.W #Function_Magdollite_Slave2_SetSlave1ToShrinkAfterFireballs    ;A8B380;
    STA.W Magdollite.function,X                                          ;A8B383;
    LDA.W Enemy.XPosition,X                                              ;A8B386;
    STA.L Magdollite.throwXPosition,X                                    ;A8B389;
    LDA.W Enemy.YPosition,X                                              ;A8B38D;
    STA.L Magdollite.throwYPosition,X                                    ;A8B390;
    BRA .done                                                            ;A8B394;

  .waiting:
    LDY.W Enemy[-1].var1,X                                               ;A8B396;
    LDA.W Enemy[-1].YPosition,X                                          ;A8B399;
    SEC                                                                  ;A8B39C;
    SBC.W MagdolliteYOffsetAimingAtSamus,Y                               ;A8B39D;
    STA.W Enemy.YPosition,X                                              ;A8B3A0;

  .done:
    JSR.W SetMagdolliteYRadius                                           ;A8B3A3;
    RTS                                                                  ;A8B3A6;


;;; $B3A7: Magdollite function - move with shrinking arm ;;;
Function_Magdollite_Slave2_GoBackToIdlingAfterPillarShrinks:
    LDX.W EnemyIndex                                                     ;A8B3A7;
    LDA.W Enemy[-2].var5,X                                               ;A8B3AA;
    CMP.W #Function_Magdollite_WaitForSamusToGetNear                     ;A8B3AD;
    BNE .notWaitingForTrigger                                            ;A8B3B0;
    LDA.W #Function_Magdollite_Slave2_Idling_WaitingForTrigger           ;A8B3B2;
    STA.W Magdollite.function,X                                          ;A8B3B5;
    BRA .done                                                            ;A8B3B8;

  .notWaitingForTrigger:
    LDY.W Enemy[-1].var1,X                                               ;A8B3BA;
    LDA.W Enemy[-1].YPosition,X                                          ;A8B3BD;
    SEC                                                                  ;A8B3C0;
    SBC.W MagdolliteYOffsetAimingAtSamus,Y                               ;A8B3C1;
    STA.W Enemy.YPosition,X                                              ;A8B3C4;

  .done:
    JSR.W SetMagdolliteYRadius                                           ;A8B3C7;
    RTS                                                                  ;A8B3CA;


;;; $B3CB: Update magdollite head Y radius ;;;
SetMagdolliteYRadius:
    LDA.W Enemy[-2].YPosition,X                                          ;A8B3CB;
    SEC                                                                  ;A8B3CE;
    SBC.W Enemy.YPosition,X                                              ;A8B3CF;
    CLC                                                                  ;A8B3D2;
    ADC.W #$0002                                                         ;A8B3D3;
    STA.W Enemy[-2].YHitboxRadius,X                                      ;A8B3D6;
    CMP.W #$0008                                                         ;A8B3D9;
    BPL .return                                                          ;A8B3DC;
    LDA.W #$0008                                                         ;A8B3DE;
    STA.W Enemy[-2].YHitboxRadius,X                                      ;A8B3E1;

  .return:
    RTS                                                                  ;A8B3E4;


;;; $B3E5: Set magdollite instruction list ;;;
SetMagdolliteInstList:
    LDX.W EnemyIndex                                                     ;A8B3E5;
    LDA.W Magdollite.newInstList,X                                       ;A8B3E8;
    CMP.W Magdollite.instList,X                                          ;A8B3EB;
    BEQ .return                                                          ;A8B3EE;
    STA.W Enemy.instList,X                                               ;A8B3F0;
    STA.W Magdollite.instList,X                                          ;A8B3F3;
    LDA.W #$0001                                                         ;A8B3F6;
    STA.W Enemy.instTimer,X                                              ;A8B3F9;
    STZ.W Enemy.loopCounter,X                                            ;A8B3FC;

  .return:
    RTS                                                                  ;A8B3FF;


;;; $B400: Power bomb reaction - enemy $E83F (magdollite) ;;;
PowerBombReaction_Magdollite:
    JSL.L CommonA8_NormalEnemyPowerBombAI                                ;A8B400;
    BRA ContactReaction_Magdollite_Common                                ;A8B404;


;;; $B406: Enemy touch - enemy $E83F (magdollite) ;;;
EnemyTouch_Magdollite:
    JSL.L CommonA8_NormalEnemyTouchAI                                    ;A8B406;
    BRA ContactReaction_Magdollite_Common                                ;A8B40A;


;;; $B40C: Enemy shot - enemy $E83F (magdollite) ;;;
EnemyShot_Magdollite:
    JSL.L NormalEnemyShotAI_Internal                                     ;A8B40C; fallthrough to ContactReaction_Magdollite_Common


;;; $B410: Magdollite shared contact reaction ;;;
ContactReaction_Magdollite_Common:
    LDX.W EnemyIndex                                                     ;A8B410;
    LDA.W Enemy.health,X                                                 ;A8B413;
    BNE .notDead                                                         ;A8B416;
    LDA.W Enemy[1].properties,X                                          ;A8B418;
    ORA.W #$0200                                                         ;A8B41B;
    STA.W Enemy[1].properties,X                                          ;A8B41E;
    LDA.W Enemy[2].properties,X                                          ;A8B421;
    ORA.W #$0200                                                         ;A8B424;
    STA.W Enemy[2].properties,X                                          ;A8B427;

  .notDead:
    LDA.W Enemy.freezeTimer,X                                            ;A8B42A;
    BEQ .return                                                          ;A8B42D;
    STA.W Enemy[1].freezeTimer,X                                         ;A8B42F;
    STA.W Enemy[2].freezeTimer,X                                         ;A8B432;
    LDA.W Enemy[1].AI,X                                                  ;A8B435;
    ORA.W #$0004                                                         ;A8B438;
    STA.W Enemy[1].AI,X                                                  ;A8B43B;
    LDA.W Enemy[2].AI,X                                                  ;A8B43E;
    ORA.W #$0004                                                         ;A8B441;
    STA.W Enemy[2].AI,X                                                  ;A8B444;

  .return:
    RTL                                                                  ;A8B447;


;;; $B448: Magdollite spritemaps ;;;
Spritemap_Magdollite_FacingLeft_Head_0:
    dw $0003                                                             ;A8B448;
    %spritemapEntry(0, $04, $FF, 0, 0, 2, 0, $123)
    %spritemapEntry(0, $04, $F7, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1F4, $F7, 0, 0, 2, 0, $10A)

Spritemap_Magdollite_FacingLeft_Head_1:
    dw $0003                                                             ;A8B459;
    %spritemapEntry(0, $04, $00, 0, 0, 2, 0, $123)
    %spritemapEntry(0, $04, $F8, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1F4, $F8, 0, 0, 2, 0, $10A)

Spritemap_Magdollite_FacingLeft_Head_2:
    dw $0003                                                             ;A8B46A;
    %spritemapEntry(0, $04, $01, 0, 0, 2, 0, $123)
    %spritemapEntry(0, $04, $F9, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1F4, $F9, 0, 0, 2, 0, $10A)

Spritemap_Magdollite_FacingLeft_Fist_0:
    dw $0003                                                             ;A8B47B;
    %spritemapEntry(0, $00, $04, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $1F8, $04, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1F8, $F4, 0, 0, 2, 0, $108)

Spritemap_Magdollite_FacingLeft_Fist_1:
    dw $0003                                                             ;A8B48C;
    %spritemapEntry(0, $1FD, $04, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $1F5, $04, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1F9, $F5, 0, 0, 2, 0, $108)

Spritemap_Magdollite_FacingLeft_Hand_FingersStraight:
    dw $0002                                                             ;A8B49D;
    %spritemapEntry(1, $00, $FC, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1F0, $F9, 0, 0, 2, 0, $104)

Spritemap_Magdollite_FacingLeft_Hand_FingersCurled:
    dw $0002                                                             ;A8B4A9;
    %spritemapEntry(1, $00, $F8, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 2, 0, $100)

Spritemap_Magdollite_FacingLeft_PillarCap:
    dw $0002                                                             ;A8B4B5;
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 0, $124)

Spritemap_Magdollite_FacingLeft_WidePillarSection:
    dw $0001                                                             ;A8B4C1;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10E)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Magdollite_Blank_A8B4C8:
    dw $0001                                                             ;A8B4C8;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10C)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Magdollite_FacingLeft_Head_PokingOutOfLava:
    dw $0003                                                             ;A8B4CF;
    %spritemapEntry(0, $04, $FC, 0, 0, 2, 0, $128)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $127)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 0, $126)

Spritemap_Magdollite_FacingLeft_Head_BarelyPokingOutOfLava:
    dw $0003                                                             ;A8B4E0;
    %spritemapEntry(0, $04, $FC, 0, 0, 2, 0, $12B)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $12A)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 0, $129)

Spritemap_Magdollite_FacingRight_Head_0:
    dw $0003                                                             ;A8B4F1;
    %spritemapEntry(0, $1F4, $FF, 0, 1, 2, 0, $123)
    %spritemapEntry(0, $1F4, $F7, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $1FC, $F7, 0, 1, 2, 0, $10A)

Spritemap_Magdollite_FacingRight_Head_1:
    dw $0003                                                             ;A8B502;
    %spritemapEntry(0, $1F4, $00, 0, 1, 2, 0, $123)
    %spritemapEntry(0, $1F4, $F8, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $1FC, $F8, 0, 1, 2, 0, $10A)

Spritemap_Magdollite_FacingRight_Head_2:
    dw $0003                                                             ;A8B513;
    %spritemapEntry(0, $1F4, $01, 0, 1, 2, 0, $123)
    %spritemapEntry(0, $1F4, $F9, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $1FC, $F9, 0, 1, 2, 0, $10A)

Spritemap_Magdollite_FacingRight_Fist_0:
    dw $0003                                                             ;A8B524;
    %spritemapEntry(0, $1F8, $04, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $00, $04, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $1F8, $F4, 0, 1, 2, 0, $108)

Spritemap_Magdollite_FacingRight_Fist_1:
    dw $0003                                                             ;A8B535;
    %spritemapEntry(0, $1FB, $04, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $03, $04, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $1F7, $F5, 0, 1, 2, 0, $108)

Spritemap_Magdollite_FacingRight_Hand_FingersStraight:
    dw $0002                                                             ;A8B546;
    %spritemapEntry(1, $1F0, $FC, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $00, $F9, 0, 1, 2, 0, $104)

Spritemap_Magdollite_FacingRight_Hand_FingersCurled:
    dw $0002                                                             ;A8B552;
    %spritemapEntry(1, $1F0, $F8, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $00, $F8, 0, 1, 2, 0, $100)

if  !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Magdollite_FacingRight_PillarCap_A8B55E:
    dw $0002                                                             ;A8B55E;
    %spritemapEntry(0, $1F8, $FC, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 0, $124)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Magdollite_FacingRight_WidePillarSection:
    dw $0001                                                             ;A8B56A;
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $10E)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Magdollite_FacingRight_NarrowPillar_A8B571:
    dw $0001                                                             ;A8B571;
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $10C)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Magdollite_FacingRight_Head_PokingOutOfLava:
    dw $0003                                                             ;A8B578;
    %spritemapEntry(0, $1F4, $FC, 0, 1, 2, 0, $128)
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 0, $127)
    %spritemapEntry(0, $04, $FC, 0, 1, 2, 0, $126)

Spritemap_Magdollite_FacingRight_Head_BarelyPokingOutOfLava:
    dw $0003                                                             ;A8B589;
    %spritemapEntry(0, $1F4, $FC, 0, 1, 2, 0, $12B)
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 0, $12A)
    %spritemapEntry(0, $04, $FC, 0, 1, 2, 0, $129)

Spritemap_Magdollite_FacingLeft_NarrowPillarSection:
    dw $0001                                                             ;A8B59A;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10C)

Spritemap_Magdollite_FacingRight_NarrowPillarSection:
    dw $0002                                                             ;A8B5A1;
    %spritemapEntry(1, $1F8, $00, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $10C)

Spritemap_Magdollite_NarrowPillarStacks_3x:
    dw $0003                                                             ;A8B5AD;
    %spritemapEntry(1, $1F8, $08, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $E8, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10C)

Spritemap_Magdollite_NarrowPillarStacks_4x:
    dw $0004                                                             ;A8B5BE;
    %spritemapEntry(1, $1F8, $10, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $00, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $E0, 0, 0, 2, 0, $10C)

Spritemap_Magdollite_NarrowPillarStacks_5x:
    dw $0005                                                             ;A8B5D4;
    %spritemapEntry(1, $1F8, $18, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $08, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $D8, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $E8, 0, 0, 2, 0, $10C)

Spritemap_Magdollite_NarrowPillarStacks_6x:
    dw $0006                                                             ;A8B5EF;
    %spritemapEntry(1, $1F8, $10, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $20, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $00, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $E0, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $D0, 0, 0, 2, 0, $10C)

Spritemap_Magdollite_NarrowPillarStacks_7x:
    dw $0007                                                             ;A8B60F;
    %spritemapEntry(1, $1F8, $28, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $18, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $08, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $E8, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $D8, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $C8, 0, 0, 2, 0, $10C)

Spritemap_Magdollite_NarrowPillarStacks_8x:
    dw $0008                                                             ;A8B634;
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
    dw $3800,$57FF,$42F7,$158C,$00A5,$4F5A,$36B5,$2610                   ;A8B65E;
    dw $1DCE,$1CDF,$4FE0,$3B20,$2A20,$1097,$6BDF,$042E                   ;A8B66E;


if !FEATURE_KEEP_UNREFERENCED
;;; $B67E: Unused. Beetom eye colours ;;;
UNUSED_BeetomEyeColors_A8B67E:
; Colours Ah..Ch
    dw $4FE0,$3B20,$2A20,$3BE0,$2680,$1580,$2740,$11E0                   ;A8B67E;
    dw $00E0,$12A0,$0140,$0040                                           ;A8B68E;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $B696: Instruction list - crawling - facing left ;;;
InstList_Beetom_Crawling_FacingLeft_0:
    dw Common_Instruction_DisableOffScreenProcessing                     ;A8B696;

InstList_Beetom_Crawling_FacingLeft_1:
    dw $000A,Spritemap_Beetom_0                                          ;A8B698;
    dw $000A,Spritemap_Beetom_1                                          ;A8B69C;
    dw $000A,Spritemap_Beetom_2                                          ;A8B6A0;
    dw $000A,Spritemap_Beetom_1                                          ;A8B6A4;
    dw Common_Instruction_GotoY                                          ;A8B6A8;
    dw InstList_Beetom_Crawling_FacingLeft_1                             ;A8B6AA;


;;; $B6AC: Instruction list - hop - facing left ;;;
InstList_Beetom_Hop_FacingLeft:
    dw Common_Instruction_EnableOffScreenProcessing                      ;A8B6AC;
    dw $0004,Spritemap_Beetom_3                                          ;A8B6AE;
    dw $0008,Spritemap_Beetom_4                                          ;A8B6B2;
    dw $0004,Spritemap_Beetom_3                                          ;A8B6B6;
    dw $0001,Spritemap_Beetom_0                                          ;A8B6BA;
    dw Common_Instruction_Sleep                                          ;A8B6BE;


if !FEATURE_KEEP_UNREFERENCED
;;; $B6C0: Unused. Instruction list - small hop - facing left ;;;
UNUSED_InstList_Beetom_SmallHop_FacingLeft_A8B6C0:
    dw Common_Instruction_EnableOffScreenProcessing                      ;A8B6C0;
    dw $0004,Spritemap_Beetom_3                                          ;A8B6C2;
    dw $0001,Spritemap_Beetom_0                                          ;A8B6C6;
    dw Common_Instruction_Sleep                                          ;A8B6CA;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $B6CC: Instruction list - draining Samus - facing left ;;;
InstList_Beetom_DrainingSamus_FacingLeft_0:
    dw $0005,Spritemap_Beetom_5                                          ;A8B6CC;
    dw $0005,Spritemap_Beetom_6                                          ;A8B6D0;
    dw $0005,Spritemap_Beetom_7                                          ;A8B6D4;
    dw $0030,Spritemap_Beetom_6                                          ;A8B6D8;
    dw Instruction_Beetom_Nothing                                        ;A8B6DC;

InstList_Beetom_DrainingSamus_FacingLeft_1:
    dw $0005,Spritemap_Beetom_8                                          ;A8B6DE;
    dw $0005,Spritemap_Beetom_9                                          ;A8B6E2;
    dw $0005,Spritemap_Beetom_A                                          ;A8B6E6;
    dw $0005,Spritemap_Beetom_9                                          ;A8B6EA;
    dw Common_Instruction_GotoY                                          ;A8B6EE;
    dw InstList_Beetom_DrainingSamus_FacingLeft_1                        ;A8B6F0;


;;; $B6F2: Instruction list - crawling - facing right ;;;
InstList_Beetom_Crawling_FacingRight_0:
    dw Common_Instruction_DisableOffScreenProcessing                     ;A8B6F2;

InstList_Beetom_Crawling_FacingRight_1:
    dw $000A,Spritemap_Beetom_B                                          ;A8B6F4;
    dw $000A,Spritemap_Beetom_C                                          ;A8B6F8;
    dw $000A,Spritemap_Beetom_D                                          ;A8B6FC;
    dw $000A,Spritemap_Beetom_C                                          ;A8B700;
    dw Common_Instruction_GotoY                                          ;A8B704;
    dw InstList_Beetom_Crawling_FacingRight_1                            ;A8B706;


;;; $B708: Instruction list - hop - facing right ;;;
InstList_Beetom_Hop_FacingRight:
    dw Common_Instruction_EnableOffScreenProcessing                      ;A8B708;
    dw $0004,Spritemap_Beetom_E                                          ;A8B70A;
    dw $0008,Spritemap_Beetom_F                                          ;A8B70E;
    dw $0004,Spritemap_Beetom_E                                          ;A8B712;
    dw $0001,Spritemap_Beetom_B                                          ;A8B716;
    dw Common_Instruction_Sleep                                          ;A8B71A;


if !FEATURE_KEEP_UNREFERENCED
;;; $B71C: Unused. Instruction list - small hop - facing right ;;;
UNUSED_InstList_Beetom_SmallHop_FacingRight_A8B71C:
    dw Common_Instruction_EnableOffScreenProcessing                      ;A8B71C;
    dw $0004,Spritemap_Beetom_E                                          ;A8B71E;
    dw $0001,Spritemap_Beetom_B                                          ;A8B722;
    dw Common_Instruction_Sleep                                          ;A8B726;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $B728: Instruction list - draining Samus - facing right ;;;
InstList_Beetom_DrainingSamus_FacingRight_0:
    dw $0005,Spritemap_Beetom_10                                         ;A8B728;
    dw $0005,Spritemap_Beetom_11                                         ;A8B72C;
    dw $0005,Spritemap_Beetom_12                                         ;A8B730;
    dw $0030,Spritemap_Beetom_11                                         ;A8B734;
    dw Instruction_Beetom_Nothing                                        ;A8B738;

InstList_Beetom_DrainingSamus_FacingRight_1:
    dw $0005,Spritemap_Beetom_13                                         ;A8B73A;
    dw $0005,Spritemap_Beetom_14                                         ;A8B73E;
    dw $0005,Spritemap_Beetom_15                                         ;A8B742;
    dw $0005,Spritemap_Beetom_14                                         ;A8B746;
    dw Common_Instruction_GotoY                                          ;A8B74A;
    dw InstList_Beetom_DrainingSamus_FacingRight_1                       ;A8B74C;


;;; $B74E: Samus not in proximity beetom function pointers ;;;
SamusNotInProximityBeetomFunctionPointers:
    dw Function_Beetom_StartIdling                                       ;A8B74E; Facing left
    dw Function_Beetom_StartIdling                                       ;A8B750; Facing right
    dw Function_Beetom_StartShortHopRight                                ;A8B752; Facing left
    dw Function_Beetom_StartLongHopRight                                 ;A8B754; Facing right
    dw Function_Beetom_StartShortHopRight                                ;A8B756; Facing left
    dw Function_Beetom_StartShortHopLeft                                 ;A8B758; Facing right
    dw Function_Beetom_StartLongHopLeft                                  ;A8B75A; Facing left
    dw Function_Beetom_StartLongHopRight                                 ;A8B75C; Facing right


;;; $B75E: Instruction - nothing ;;;
Instruction_Beetom_Nothing:
    LDX.W EnemyIndex                                                     ;A8B75E;
    RTL                                                                  ;A8B761;


;;; $B762: Set beetom instruction list ;;;
SetBeetomInstList:
    LDX.W EnemyIndex                                                     ;A8B762;
    LDA.L Beetom.instList,X                                              ;A8B765;
    STA.W Enemy.instList,X                                               ;A8B769;
    LDA.W #$0001                                                         ;A8B76C;
    STA.W Enemy.instTimer,X                                              ;A8B76F;
    STZ.W Enemy.loopCounter,X                                            ;A8B772;
    RTS                                                                  ;A8B775;


;;; $B776: Initialisation AI - enemy $E87F (beetom) ;;;
InitAI_Beetom:
    LDX.W EnemyIndex                                                     ;A8B776;
    LDA.W #$0000                                                         ;A8B779;
    STA.W Beetom.functionTimer,X                                         ;A8B77C;
    STA.W Beetom.function,X                                              ;A8B77F; >.<
    STA.L Beetom.fallingFlag,X                                           ;A8B782;
    STA.L Beetom.attachedToSamusFlag,X                                   ;A8B786;
    STA.W Enemy.var0,X                                                   ;A8B78A;
    LDA.W #$0040                                                         ;A8B78D;
    STA.W Beetom.buttonCounter,X                                         ;A8B790;
    LDA.B DP_Controller1Input                                            ;A8B793;
    STA.W Beetom.previousController1Input,X                              ;A8B795;
    LDA.W #$0017                                                         ;A8B798;
    STA.W RandomNumberSeed                                               ;A8B79B;
    LDA.W #$3000                                                         ;A8B79E;
    STA.B DP_Temp16                                                      ;A8B7A1;
    LDA.W #$0004                                                         ;A8B7A3;
    STA.B DP_Temp18                                                      ;A8B7A6;
    JSR.W Beetom_CalculateInitialHopSpeed                                ;A8B7A8;
    STA.L Beetom.initialShortLeapYSpeedIndex,X                           ;A8B7AB;
    LDA.W #$4000                                                         ;A8B7AF;
    STA.B DP_Temp16                                                      ;A8B7B2;
    LDA.W #$0005                                                         ;A8B7B4;
    STA.B DP_Temp18                                                      ;A8B7B7;
    JSR.W Beetom_CalculateInitialHopSpeed                                ;A8B7B9;
    STA.L Beetom.initialLongLeapYSpeedIndex,X                            ;A8B7BC;
    LDA.W #$3000                                                         ;A8B7C0;
    STA.B DP_Temp16                                                      ;A8B7C3;
    LDA.W #$0003                                                         ;A8B7C5;
    STA.B DP_Temp18                                                      ;A8B7C8;
    JSR.W Beetom_CalculateInitialHopSpeed                                ;A8B7CA;
    STA.L Beetom.initialLungeYSpeedIndex,X                               ;A8B7CD;
    LDA.W #InstList_Beetom_Crawling_FacingRight_0                        ;A8B7D1;
    STA.L Beetom.instList,X                                              ;A8B7D4;
    JSL.L Get_SamusX_minus_EnemyX                                        ;A8B7D8;
    BPL .SamusToTheLeft                                                  ;A8B7DC;
    LDA.W #InstList_Beetom_Crawling_FacingLeft_0                         ;A8B7DE;
    STA.L Beetom.instList,X                                              ;A8B7E1;

  .SamusToTheLeft:
    JSR.W SetBeetomInstList                                              ;A8B7E5;
    LDA.W #Function_Beetom_DecideAction                                  ;A8B7E8;
    STA.W Beetom.function,X                                              ;A8B7EB;
    RTL                                                                  ;A8B7EE;


;;; $B7EF: Calculate initial hop speed ;;;
Beetom_CalculateInitialHopSpeed:
;; Parameters:
;;     $16: Target hop height. Unit 1/100h pixels
;;     $18: Y acceleration scalar
;; Returns:
;;     A: Initial Y speed table index
    STZ.B DP_Temp12                                                      ;A8B7EF;
    STZ.B DP_Temp14                                                      ;A8B7F1;

  .loop:
    LDA.B DP_Temp12                                                      ;A8B7F3;
    CLC                                                                  ;A8B7F5;
    ADC.B DP_Temp18                                                      ;A8B7F6;
    STA.B DP_Temp12                                                      ;A8B7F8;
    ASL                                                                  ;A8B7FA;
    ASL                                                                  ;A8B7FB;
    ASL                                                                  ;A8B7FC;
    TAY                                                                  ;A8B7FD;
    LDA.B DP_Temp14                                                      ;A8B7FE;
    CLC                                                                  ;A8B800;
    ADC.W Common_EnemySpeeds_QuadraticallyIncreasing+1,Y                  ;A8B801;
    STA.B DP_Temp14                                                      ;A8B804;
    CMP.B DP_Temp16                                                      ;A8B806;
    BMI .loop                                                            ;A8B808;
    LDA.B DP_Temp12                                                      ;A8B80A;
    RTS                                                                  ;A8B80C;


;;; $B80D: Main AI - enemy $E87F (beetom) ;;;
MainAI_Beetom:
    LDX.W EnemyIndex                                                     ;A8B80D;
    JSR.W (Beetom.function,X)                                            ;A8B810;
    RTL                                                                  ;A8B813;


;;; $B814: Beetom function - decide action ;;;
Function_Beetom_DecideAction:
    LDX.W EnemyIndex                                                     ;A8B814;
    LDA.W #$0060                                                         ;A8B817;
    JSL.L IsSamusWithinAPixelColumnsOfEnemy                              ;A8B81A;
    BEQ .notInProximity                                                  ;A8B81E;
    LDA.W #Function_Beetom_DecideAction_SamusInProximity                 ;A8B820;
    STA.W Beetom.function,X                                              ;A8B823;
    BRA .return                                                          ;A8B826;

  .notInProximity:
    LDA.W #Function_Beetom_DecideAction_SamusNotInProximity              ;A8B828;
    STA.W Beetom.function,X                                              ;A8B82B;

  .return:
    RTS                                                                  ;A8B82E;


;;; $B82F: Beetom function - decide action - Samus not in proximity ;;;
Function_Beetom_DecideAction_SamusNotInProximity:
    LDX.W EnemyIndex                                                     ;A8B82F;
    JSL.L GenerateRandomNumber                                           ;A8B832;
    LDA.W RandomNumberSeed                                               ;A8B836;
    AND.W #$0007                                                         ;A8B839;
    ASL                                                                  ;A8B83C;
    TAY                                                                  ;A8B83D;
    LDA.W SamusNotInProximityBeetomFunctionPointers,Y                    ;A8B83E;
    STA.W Beetom.function,X                                              ;A8B841;
    LDA.W RandomNumberSeed                                               ;A8B844;
    AND.W #$0001                                                         ;A8B847;
    STA.L Beetom.direction,X                                             ;A8B84A;
    RTS                                                                  ;A8B84E;


;;; $B84F: Beetom function - start idling ;;;
Function_Beetom_StartIdling:
    LDX.W EnemyIndex                                                     ;A8B84F;
    LDA.W #$0020                                                         ;A8B852;
    STA.W Beetom.functionTimer,X                                         ;A8B855;
    LDA.W #Function_Beetom_Idling                                        ;A8B858;
    STA.W Beetom.function,X                                              ;A8B85B;
    RTS                                                                  ;A8B85E;


;;; $B85F: Beetom function - start crawling left ;;;
Function_Beetom_StartCrawlingLeft:
    LDX.W EnemyIndex                                                     ;A8B85F;
    LDA.W #Function_Beetom_CrawlingLeft                                  ;A8B862;
    STA.W Beetom.function,X                                              ;A8B865;
    LDA.W #InstList_Beetom_Crawling_FacingLeft_0                         ;A8B868;
    STA.L Beetom.instList,X                                              ;A8B86B;
    JSR.W SetBeetomInstList                                              ;A8B86F;
    RTS                                                                  ;A8B872;


;;; $B873: Beetom function - start crawling right ;;;
Function_Beetom_StartCrawlingRight:
    LDX.W EnemyIndex                                                     ;A8B873;
    LDA.W #Function_Beetom_CrawlingRight                                 ;A8B876;
    STA.W Beetom.function,X                                              ;A8B879;
    LDA.W #InstList_Beetom_Crawling_FacingRight_0                        ;A8B87C;
    STA.L Beetom.instList,X                                              ;A8B87F;
    JSR.W SetBeetomInstList                                              ;A8B883;
    RTS                                                                  ;A8B886;


;;; $B887: Beetom function - start short hop left ;;;
Function_Beetom_StartShortHopRight:
    LDX.W EnemyIndex                                                     ;A8B887;
    LDA.L Beetom.initialShortLeapYSpeedIndex,X                           ;A8B88A;
    STA.W Beetom.YSpeedTableIndex,X                                      ;A8B88E;
    LDA.W #Function_Beetom_ShortHopLeft                                  ;A8B891;
    STA.W Beetom.function,X                                              ;A8B894;
    LDA.W #$0000                                                         ;A8B897;
    STA.L Beetom.fallingFlag,X                                           ;A8B89A;
    LDA.W #InstList_Beetom_Hop_FacingLeft                                ;A8B89E;
    STA.L Beetom.instList,X                                              ;A8B8A1;
    JSR.W SetBeetomInstList                                              ;A8B8A5;
    RTS                                                                  ;A8B8A8;


;;; $B8A9: Beetom function - start short hop right ;;;
Function_Beetom_StartShortHopLeft:
    LDX.W EnemyIndex                                                     ;A8B8A9;
    LDA.L Beetom.initialShortLeapYSpeedIndex,X                           ;A8B8AC;
    STA.W Beetom.YSpeedTableIndex,X                                      ;A8B8B0;
    LDA.W #Function_Beetom_ShortHopRight                                 ;A8B8B3;
    STA.W Beetom.function,X                                              ;A8B8B6;
    LDA.W #$0000                                                         ;A8B8B9;
    STA.L Beetom.fallingFlag,X                                           ;A8B8BC;
    LDA.W #InstList_Beetom_Hop_FacingRight                               ;A8B8C0;
    STA.L Beetom.instList,X                                              ;A8B8C3;
    JSR.W SetBeetomInstList                                              ;A8B8C7;
    RTS                                                                  ;A8B8CA;


;;; $B8CB: Beetom function - start long hop left ;;;
Function_Beetom_StartLongHopLeft:
    LDX.W EnemyIndex                                                     ;A8B8CB;
    LDA.L Beetom.initialLongLeapYSpeedIndex,X                            ;A8B8CE;
    STA.W Beetom.YSpeedTableIndex,X                                      ;A8B8D2;
    LDA.W #Function_Beetom_LongHopLeft                                   ;A8B8D5;
    STA.W Beetom.function,X                                              ;A8B8D8;
    LDA.W #$0000                                                         ;A8B8DB;
    STA.L Beetom.fallingFlag,X                                           ;A8B8DE;
    LDA.W #InstList_Beetom_Hop_FacingLeft                                ;A8B8E2;
    STA.L Beetom.instList,X                                              ;A8B8E5;
    JSR.W SetBeetomInstList                                              ;A8B8E9;
    RTS                                                                  ;A8B8EC;


;;; $B8ED: Beetom function - start long hop right ;;;
Function_Beetom_StartLongHopRight:
    LDX.W EnemyIndex                                                     ;A8B8ED;
    LDA.L Beetom.initialLongLeapYSpeedIndex,X                            ;A8B8F0;
    STA.W Beetom.YSpeedTableIndex,X                                      ;A8B8F4;
    LDA.W #Function_Beetom_LongHopRight                                  ;A8B8F7;
    STA.W Beetom.function,X                                              ;A8B8FA;
    LDA.W #$0000                                                         ;A8B8FD;
    STA.L Beetom.fallingFlag,X                                           ;A8B900;
    LDA.W #InstList_Beetom_Hop_FacingRight                               ;A8B904;
    STA.L Beetom.instList,X                                              ;A8B907;
    JSR.W SetBeetomInstList                                              ;A8B90B;
    RTS                                                                  ;A8B90E;


;;; $B90F: Beetom function - decide action - Samus in proximity ;;;
Function_Beetom_DecideAction_SamusInProximity:
    LDX.W EnemyIndex                                                     ;A8B90F;
    LDA.L Beetom.initialLungeYSpeedIndex,X                               ;A8B912;
    STA.W Beetom.YSpeedTableIndex,X                                      ;A8B916;
    LDA.W #InstList_Beetom_Hop_FacingRight                               ;A8B919;
    STA.L Beetom.instList,X                                              ;A8B91C;
    LDA.W #Function_Beetom_LungeRight                                    ;A8B920;
    STA.W Beetom.function,X                                              ;A8B923;
    LDA.W #$0001                                                         ;A8B926;
    STA.L Beetom.direction,X                                             ;A8B929;
    JSL.L Get_SamusX_minus_EnemyX                                        ;A8B92D;
    BPL .SamusToTheLeft                                                  ;A8B931;
    LDA.W #InstList_Beetom_Hop_FacingLeft                                ;A8B933;
    STA.L Beetom.instList,X                                              ;A8B936;
    LDA.W #Function_Beetom_LungeLeft                                     ;A8B93A;
    STA.W Beetom.function,X                                              ;A8B93D;
    LDA.W #$0000                                                         ;A8B940;
    STA.L Beetom.direction,X                                             ;A8B943;

  .SamusToTheLeft:
    JSR.W SetBeetomInstList                                              ;A8B947;
    LDA.W #$0000                                                         ;A8B94A;
    STA.L Beetom.fallingFlag,X                                           ;A8B94D;
    RTS                                                                  ;A8B951;


;;; $B952: Beetom function - start draining Samus - facing left ;;;
Function_Beetom_StartDrainingSamus_FacingLeft:
    LDX.W EnemyIndex                                                     ;A8B952;
    LDA.W #InstList_Beetom_DrainingSamus_FacingLeft_0                    ;A8B955;
    STA.L Beetom.instList,X                                              ;A8B958;
    JSR.W SetBeetomInstList                                              ;A8B95C;
    LDA.W #Function_Beetom_DrainingSamus_FacingLeft                      ;A8B95F;
    STA.W Beetom.function,X                                              ;A8B962;
    RTS                                                                  ;A8B965;


;;; $B966: Beetom function - start draining Samus - facing right ;;;
Function_Beetom_StartDrainingSamus_FacingRight:
    LDX.W EnemyIndex                                                     ;A8B966;
    LDA.W #InstList_Beetom_DrainingSamus_FacingRight_0                   ;A8B969;
    STA.L Beetom.instList,X                                              ;A8B96C;
    JSR.W SetBeetomInstList                                              ;A8B970;
    LDA.W #Function_Beetom_DrainingSamus_FacingRight                     ;A8B973;
    STA.W Beetom.function,X                                              ;A8B976;
    RTS                                                                  ;A8B979;


;;; $B97A: Beetom function - start dropping ;;;
Function_Beetom_StartDropping:
    LDX.W EnemyIndex                                                     ;A8B97A;
    LDA.W #InstList_Beetom_Crawling_FacingLeft_0                         ;A8B97D;
    STA.L Beetom.instList,X                                              ;A8B980;
    LDA.L Beetom.direction,X                                             ;A8B984;
    BEQ .keepLeft                                                        ;A8B988;
    LDA.W #InstList_Beetom_Crawling_FacingRight_0                        ;A8B98A;
    STA.L Beetom.instList,X                                              ;A8B98D;

  .keepLeft:
    JSR.W SetBeetomInstList                                              ;A8B991;
    LDA.W #$0000                                                         ;A8B994;
    STA.L Beetom.fallingFlag,X                                           ;A8B997;
    LDA.W #Function_Beetom_Dropping                                      ;A8B99B;
    STA.W Beetom.function,X                                              ;A8B99E;
    RTS                                                                  ;A8B9A1;


;;; $B9A2: Beetom function - start being flung ;;;
Function_Beetom_StartBeingFlung:
    LDX.W EnemyIndex                                                     ;A8B9A2;
    LDA.W #$0000                                                         ;A8B9A5;
    STA.W Beetom.YSpeedTableIndex,X                                      ;A8B9A8;
    LDA.W #Function_Beetom_BeingFlung                                    ;A8B9AB;
    STA.W Beetom.function,X                                              ;A8B9AE;
    RTS                                                                  ;A8B9B1;


;;; $B9B2: Beetom function - idling ;;;
Function_Beetom_Idling:
    LDX.W EnemyIndex                                                     ;A8B9B2;
    DEC.W Beetom.functionTimer,X                                         ;A8B9B5;
    BPL .return                                                          ;A8B9B8;
    LDA.W #Function_Beetom_DecideAction                                  ;A8B9BA;
    STA.W Beetom.function,X                                              ;A8B9BD;

  .return:
    RTS                                                                  ;A8B9C0;


;;; $B9C1: Beetom function - crawling left ;;;
Function_Beetom_CrawlingLeft:
    LDX.W EnemyIndex                                                     ;A8B9C1;
    DEC.W Beetom.functionTimer,X                                         ;A8B9C4;
    BMI .end                                                             ;A8B9C7;
    LDA.W Enemy.XPosition,X                                              ;A8B9C9;
    SEC                                                                  ;A8B9CC;
    SBC.W #$0008                                                         ;A8B9CD;
    STA.W Enemy.XPosition,X                                              ;A8B9D0;
    LDA.W #$0001                                                         ;A8B9D3;
    STA.B DP_Temp14                                                      ;A8B9D6;
    STZ.B DP_Temp12                                                      ;A8B9D8;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8B9DA;
    BCS .collidedWithBlock                                               ;A8B9DE;
    LDA.W #Function_Beetom_StartCrawlingRight                            ;A8B9E0;
    STA.W Beetom.function,X                                              ;A8B9E3;
    DEC.W Enemy.YPosition,X                                              ;A8B9E6;
    LDA.W Enemy.XPosition,X                                              ;A8B9E9;
    CLC                                                                  ;A8B9EC;
    ADC.W #$0008                                                         ;A8B9ED;
    STA.W Enemy.XPosition,X                                              ;A8B9F0;
    BRA .return                                                          ;A8B9F3;

  .collidedWithBlock:
    LDA.W Enemy.XPosition,X                                              ;A8B9F5;
    CLC                                                                  ;A8B9F8;
    ADC.W #$0008                                                         ;A8B9F9;
    STA.W Enemy.XPosition,X                                              ;A8B9FC;
    LDA.W #$C000                                                         ;A8B9FF;
    STA.B DP_Temp12                                                      ;A8BA02;
    LDA.W #$FFFF                                                         ;A8BA04;
    STA.B DP_Temp14                                                      ;A8BA07;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A8BA09;
    BCC .return                                                          ;A8BA0D;
    LDA.W #Function_Beetom_StartCrawlingRight                            ;A8BA0F;
    STA.W Beetom.function,X                                              ;A8BA12;
    BRA .return                                                          ;A8BA15;

  .end:
    LDA.W #$0040                                                         ;A8BA17;
    STA.W Beetom.functionTimer,X                                         ;A8BA1A;
    LDA.W #Function_Beetom_DecideAction                                  ;A8BA1D;
    STA.W Beetom.function,X                                              ;A8BA20;

  .return:
    RTS                                                                  ;A8BA23;


;;; $BA24: Beetom function - crawling right ;;;
Function_Beetom_CrawlingRight:
    LDX.W EnemyIndex                                                     ;A8BA24;
    DEC.W Beetom.functionTimer,X                                         ;A8BA27;
    BMI .end                                                             ;A8BA2A;
    LDA.W Enemy.XPosition,X                                              ;A8BA2C;
    CLC                                                                  ;A8BA2F;
    ADC.W #$0008                                                         ;A8BA30;
    STA.W Enemy.XPosition,X                                              ;A8BA33;
    LDA.W #$0001                                                         ;A8BA36;
    STA.B DP_Temp14                                                      ;A8BA39;
    STZ.B DP_Temp12                                                      ;A8BA3B;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8BA3D;
    BCS .collidedWithBlock                                               ;A8BA41;
    LDA.W #Function_Beetom_StartCrawlingLeft                             ;A8BA43;
    STA.W Beetom.function,X                                              ;A8BA46;
    DEC.W Enemy.YPosition,X                                              ;A8BA49;
    LDA.W Enemy.XPosition,X                                              ;A8BA4C;
    SEC                                                                  ;A8BA4F;
    SBC.W #$0008                                                         ;A8BA50;
    STA.W Enemy.XPosition,X                                              ;A8BA53;
    BRA .return                                                          ;A8BA56;

  .collidedWithBlock:
    LDA.W Enemy.XPosition,X                                              ;A8BA58;
    SEC                                                                  ;A8BA5B;
    SBC.W #$0008                                                         ;A8BA5C;
    STA.W Enemy.XPosition,X                                              ;A8BA5F;
    LDA.W #$4000                                                         ;A8BA62;
    STA.B DP_Temp12                                                      ;A8BA65;
    STZ.B DP_Temp14                                                      ;A8BA67;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A8BA69;
    BCC .return                                                          ;A8BA6D;
    LDA.W #Function_Beetom_StartCrawlingLeft                             ;A8BA6F;
    STA.W Beetom.function,X                                              ;A8BA72;
    BRA .return                                                          ;A8BA75;

  .end:
    LDA.W #$0040                                                         ;A8BA77;
    STA.W Beetom.functionTimer,X                                         ;A8BA7A;
    LDA.W #Function_Beetom_DecideAction                                  ;A8BA7D;
    STA.W Beetom.function,X                                              ;A8BA80;

  .return:
    RTS                                                                  ;A8BA83;


;;; $BA84: Beetom function - short hop left ;;;
Function_Beetom_ShortHopLeft:
    LDX.W EnemyIndex                                                     ;A8BA84;
    LDA.L Beetom.fallingFlag,X                                           ;A8BA87;
    BNE .falling                                                         ;A8BA8B;
    JSR.W Function_Beetom_YMovement_ShortHop_Rising                      ;A8BA8D;
    BRA +                                                                ;A8BA90;

  .falling:
    JSR.W Function_Beetom_YMovement_ShortHop_Falling                     ;A8BA92;

+   LDA.W #$FFFF                                                         ;A8BA95;
    STA.B DP_Temp14                                                      ;A8BA98;
    LDA.W #$C000                                                         ;A8BA9A;
    STA.B DP_Temp12                                                      ;A8BA9D;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A8BA9F;
    BCC .return                                                          ;A8BAA3;
    LDA.L Beetom.direction,X                                             ;A8BAA5;
    EOR.W #$0001                                                         ;A8BAA9;
    STA.L Beetom.direction,X                                             ;A8BAAC;
    LDA.W #Function_Beetom_StartDropping                                 ;A8BAB0;
    STA.W Beetom.function,X                                              ;A8BAB3;

  .return:
    RTS                                                                  ;A8BAB6;


;;; $BAB7: Beetom function - short hop right ;;;
Function_Beetom_ShortHopRight:
    LDX.W EnemyIndex                                                     ;A8BAB7;
    LDA.L Beetom.fallingFlag,X                                           ;A8BABA;
    BNE .falling                                                         ;A8BABE;
    JSR.W Function_Beetom_YMovement_ShortHop_Rising                      ;A8BAC0;
    BRA +                                                                ;A8BAC3;

  .falling:
    JSR.W Function_Beetom_YMovement_ShortHop_Falling                     ;A8BAC5;

+   STZ.B DP_Temp14                                                      ;A8BAC8;
    LDA.W #$4000                                                         ;A8BACA;
    STA.B DP_Temp12                                                      ;A8BACD;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A8BACF;
    BCC .return                                                          ;A8BAD3;
    LDA.L Beetom.direction,X                                             ;A8BAD5;
    EOR.W #$0001                                                         ;A8BAD9;
    STA.L Beetom.direction,X                                             ;A8BADC;
    LDA.W #Function_Beetom_StartDropping                                 ;A8BAE0;
    STA.W Beetom.function,X                                              ;A8BAE3;

  .return:
    RTS                                                                  ;A8BAE6;


;;; $BAE7: Beetom Y movement - short hop - rising ;;;
Function_Beetom_YMovement_ShortHop_Rising:
    LDA.W Beetom.YSpeedTableIndex,X                                      ;A8BAE7;
    ASL                                                                  ;A8BAEA;
    ASL                                                                  ;A8BAEB;
    ASL                                                                  ;A8BAEC;
    TAY                                                                  ;A8BAED;
    LDA.W Common_EnemySpeeds_QuadraticallyIncreasing+6,Y                  ;A8BAEE;
    STA.B DP_Temp14                                                      ;A8BAF1;
    LDA.W Common_EnemySpeeds_QuadraticallyIncreasing+4,Y                  ;A8BAF3;
    STA.B DP_Temp12                                                      ;A8BAF6;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8BAF8;
    BCC .notCollidedWithBlock                                            ;A8BAFC;
    LDA.W #Function_Beetom_StartDropping                                 ;A8BAFE;
    STA.W Beetom.function,X                                              ;A8BB01;
    BRA .return                                                          ;A8BB04;

  .notCollidedWithBlock:
    LDA.W Beetom.YSpeedTableIndex,X                                      ;A8BB06;
    SEC                                                                  ;A8BB09;
    SBC.W #$0004                                                         ;A8BB0A;
    STA.W Beetom.YSpeedTableIndex,X                                      ;A8BB0D;
    BPL .return                                                          ;A8BB10;
    LDA.W #$0000                                                         ;A8BB12;
    STA.W Beetom.YSpeedTableIndex,X                                      ;A8BB15;
    LDA.W #$0001                                                         ;A8BB18;
    STA.L Beetom.fallingFlag,X                                           ;A8BB1B;

  .return:
    RTS                                                                  ;A8BB1F;


;;; $BB20: Beetom Y movement - short hop - falling ;;;
Function_Beetom_YMovement_ShortHop_Falling:
    LDA.W Beetom.YSpeedTableIndex,X                                      ;A8BB20;
    ASL                                                                  ;A8BB23;
    ASL                                                                  ;A8BB24;
    ASL                                                                  ;A8BB25;
    TAY                                                                  ;A8BB26;
    LDA.W Common_EnemySpeeds_QuadraticallyIncreasing+2,Y                  ;A8BB27;
    STA.B DP_Temp14                                                      ;A8BB2A;
    LDA.W Common_EnemySpeeds_QuadraticallyIncreasing,Y                    ;A8BB2C;
    STA.B DP_Temp12                                                      ;A8BB2F;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8BB31;
    BCC .notCollidedWithBlock                                            ;A8BB35;
    LDA.W #Function_Beetom_DecideAction                                  ;A8BB37;
    STA.W Beetom.function,X                                              ;A8BB3A;
    BRA .return                                                          ;A8BB3D;

  .notCollidedWithBlock:
    LDA.W Beetom.YSpeedTableIndex,X                                      ;A8BB3F;
    CLC                                                                  ;A8BB42;
    ADC.W #$0004                                                         ;A8BB43;
    STA.W Beetom.YSpeedTableIndex,X                                      ;A8BB46;
    CMP.W #$0040                                                         ;A8BB49;
    BMI .return                                                          ;A8BB4C;
    LDA.W #$0040                                                         ;A8BB4E;
    STA.W Beetom.YSpeedTableIndex,X                                      ;A8BB51;

  .return:
    RTS                                                                  ;A8BB54;


;;; $BB55: Beetom function - long hop left ;;;
Function_Beetom_LongHopLeft:
    LDX.W EnemyIndex                                                     ;A8BB55;
    LDA.L Beetom.fallingFlag,X                                           ;A8BB58;
    BNE .falling                                                         ;A8BB5C;
    JSR.W Function_Beetom_YMovement_LongHop_Rising                       ;A8BB5E;
    BRA +                                                                ;A8BB61;

  .falling:
    JSR.W Function_Beetom_YMovement_LongHop_Falling                      ;A8BB63;

+   LDA.W #$FFFF                                                         ;A8BB66;
    STA.B DP_Temp14                                                      ;A8BB69;
    LDA.W #$C000                                                         ;A8BB6B;
    STA.B DP_Temp12                                                      ;A8BB6E;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A8BB70;
    BCC .return                                                          ;A8BB74;
    LDA.L Beetom.direction,X                                             ;A8BB76;
    EOR.W #$0001                                                         ;A8BB7A;
    STA.L Beetom.direction,X                                             ;A8BB7D;
    LDA.W #Function_Beetom_StartDropping                                 ;A8BB81;
    STA.W Beetom.function,X                                              ;A8BB84;

  .return:
    RTS                                                                  ;A8BB87;


;;; $BB88: Beetom function - long hop right ;;;
Function_Beetom_LongHopRight:
    LDX.W EnemyIndex                                                     ;A8BB88;
    LDA.L Beetom.fallingFlag,X                                           ;A8BB8B;
    BNE .falling                                                         ;A8BB8F;
    JSR.W Function_Beetom_YMovement_LongHop_Rising                       ;A8BB91;
    BRA +                                                                ;A8BB94;

  .falling:
    JSR.W Function_Beetom_YMovement_LongHop_Falling                      ;A8BB96;

+   STZ.B DP_Temp14                                                      ;A8BB99;
    LDA.W #$4000                                                         ;A8BB9B;
    STA.B DP_Temp12                                                      ;A8BB9E;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A8BBA0;
    BCC .return                                                          ;A8BBA4;
    LDA.L Beetom.direction,X                                             ;A8BBA6;
    EOR.W #$0001                                                         ;A8BBAA;
    STA.L Beetom.direction,X                                             ;A8BBAD;
    LDA.W #Function_Beetom_StartDropping                                 ;A8BBB1;
    STA.W Beetom.function,X                                              ;A8BBB4;

  .return:
    RTS                                                                  ;A8BBB7;


;;; $BBB8: Beetom Y movement - long hop - rising ;;;
Function_Beetom_YMovement_LongHop_Rising:
    LDA.W Beetom.YSpeedTableIndex,X                                      ;A8BBB8;
    ASL                                                                  ;A8BBBB;
    ASL                                                                  ;A8BBBC;
    ASL                                                                  ;A8BBBD;
    TAY                                                                  ;A8BBBE;
    LDA.W Common_EnemySpeeds_QuadraticallyIncreasing+6,Y                  ;A8BBBF;
    STA.B DP_Temp14                                                      ;A8BBC2;
    LDA.W Common_EnemySpeeds_QuadraticallyIncreasing+4,Y                  ;A8BBC4;
    STA.B DP_Temp12                                                      ;A8BBC7;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8BBC9;
    BCC .notCollidedWithBlock                                            ;A8BBCD;
    LDA.W #Function_Beetom_StartDropping                                 ;A8BBCF;
    STA.W Beetom.function,X                                              ;A8BBD2;
    BRA .return                                                          ;A8BBD5;

  .notCollidedWithBlock:
    LDA.W Beetom.YSpeedTableIndex,X                                      ;A8BBD7;
    SEC                                                                  ;A8BBDA;
    SBC.W #$0005                                                         ;A8BBDB;
    STA.W Beetom.YSpeedTableIndex,X                                      ;A8BBDE;
    BPL .return                                                          ;A8BBE1;
    LDA.W #$0000                                                         ;A8BBE3;
    STA.W Beetom.YSpeedTableIndex,X                                      ;A8BBE6;
    LDA.W #$0001                                                         ;A8BBE9;
    STA.L Beetom.fallingFlag,X                                           ;A8BBEC;

  .return:
    RTS                                                                  ;A8BBF0;


;;; $BBF1: Beetom Y movement - long hop - falling ;;;
Function_Beetom_YMovement_LongHop_Falling:
    LDA.W Beetom.YSpeedTableIndex,X                                      ;A8BBF1;
    ASL                                                                  ;A8BBF4;
    ASL                                                                  ;A8BBF5;
    ASL                                                                  ;A8BBF6;
    TAY                                                                  ;A8BBF7;
    LDA.W Common_EnemySpeeds_QuadraticallyIncreasing+2,Y                  ;A8BBF8;
    STA.B DP_Temp14                                                      ;A8BBFB;
    LDA.W Common_EnemySpeeds_QuadraticallyIncreasing,Y                    ;A8BBFD;
    STA.B DP_Temp12                                                      ;A8BC00;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8BC02;
    BCC .notCollidedWithBlock                                            ;A8BC06;
    LDA.W #Function_Beetom_DecideAction                                  ;A8BC08;
    STA.W Beetom.function,X                                              ;A8BC0B;
    BRA .return                                                          ;A8BC0E;

  .notCollidedWithBlock:
    LDA.W Beetom.YSpeedTableIndex,X                                      ;A8BC10;
    CLC                                                                  ;A8BC13;
    ADC.W #$0005                                                         ;A8BC14;
    STA.W Beetom.YSpeedTableIndex,X                                      ;A8BC17;
    CMP.W #$0040                                                         ;A8BC1A;
    BMI .return                                                          ;A8BC1D;
    LDA.W #$0040                                                         ;A8BC1F;
    STA.W Beetom.YSpeedTableIndex,X                                      ;A8BC22;

  .return:
    RTS                                                                  ;A8BC25;


;;; $BC26: Beetom function - lunge left ;;;
Function_Beetom_LungeLeft:
    LDX.W EnemyIndex                                                     ;A8BC26;
    LDA.L Beetom.fallingFlag,X                                           ;A8BC29;
    BNE .falling                                                         ;A8BC2D;
    JSR.W Function_Beetom_YMovement_Lunge_Rising                         ;A8BC2F;
    BRA +                                                                ;A8BC32;

  .falling:
    JSR.W Function_Beetom_YMovement_Lunge_Falling                        ;A8BC34;

+   LDA.W #$0003                                                         ;A8BC37;
    EOR.W #$FFFF                                                         ;A8BC3A;
    INC                                                                  ;A8BC3D;
    STA.B DP_Temp14                                                      ;A8BC3E;
    STZ.B DP_Temp12                                                      ;A8BC40;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A8BC42;
    BCC .return                                                          ;A8BC46;
    LDA.L Beetom.direction,X                                             ;A8BC48;
    EOR.W #$0001                                                         ;A8BC4C;
    STA.L Beetom.direction,X                                             ;A8BC4F;
    LDA.W #Function_Beetom_StartDropping                                 ;A8BC53;
    STA.W Beetom.function,X                                              ;A8BC56;

  .return:
    RTS                                                                  ;A8BC59;


;;; $BC5A: Beetom function - lunge right ;;;
Function_Beetom_LungeRight:
    LDX.W EnemyIndex                                                     ;A8BC5A;
    LDA.L Beetom.fallingFlag,X                                           ;A8BC5D;
    BNE .falling                                                         ;A8BC61;
    JSR.W Function_Beetom_YMovement_Lunge_Rising                         ;A8BC63;
    BRA +                                                                ;A8BC66;

  .falling:
    JSR.W Function_Beetom_YMovement_Lunge_Falling                        ;A8BC68;

+   LDA.W #$0003                                                         ;A8BC6B;
    STA.B DP_Temp14                                                      ;A8BC6E;
    STZ.B DP_Temp12                                                      ;A8BC70;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A8BC72;
    BCC .return                                                          ;A8BC76;
    LDA.L Beetom.direction,X                                             ;A8BC78;
    EOR.W #$0001                                                         ;A8BC7C;
    STA.L Beetom.direction,X                                             ;A8BC7F;
    LDA.W #Function_Beetom_StartDropping                                 ;A8BC83;
    STA.W Beetom.function,X                                              ;A8BC86;

  .return:
    RTS                                                                  ;A8BC89;


;;; $BC8A: Beetom Y movement - lunge - rising ;;;
Function_Beetom_YMovement_Lunge_Rising:
    LDA.W Beetom.YSpeedTableIndex,X                                      ;A8BC8A;
    ASL                                                                  ;A8BC8D;
    ASL                                                                  ;A8BC8E;
    ASL                                                                  ;A8BC8F;
    TAY                                                                  ;A8BC90;
    LDA.W Common_EnemySpeeds_QuadraticallyIncreasing+6,Y                  ;A8BC91;
    STA.B DP_Temp14                                                      ;A8BC94;
    LDA.W Common_EnemySpeeds_QuadraticallyIncreasing+4,Y                  ;A8BC96;
    STA.B DP_Temp12                                                      ;A8BC99;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8BC9B;
    BCC .notCollidedWithBlock                                            ;A8BC9F;
    LDA.W #Function_Beetom_StartDropping                                 ;A8BCA1;
    STA.W Beetom.function,X                                              ;A8BCA4;
    BRA .return                                                          ;A8BCA7;

  .notCollidedWithBlock:
    LDA.W Beetom.YSpeedTableIndex,X                                      ;A8BCA9;
    SEC                                                                  ;A8BCAC;
    SBC.W #$0005                                                         ;A8BCAD;
    STA.W Beetom.YSpeedTableIndex,X                                      ;A8BCB0;
    BPL .return                                                          ;A8BCB3;
    LDA.W #$0000                                                         ;A8BCB5;
    STA.W Beetom.YSpeedTableIndex,X                                      ;A8BCB8;
    LDA.W #$0001                                                         ;A8BCBB;
    STA.L Beetom.fallingFlag,X                                           ;A8BCBE;

  .return:
    RTS                                                                  ;A8BCC2;


Function_Beetom_YMovement_Lunge_Falling:
    LDA.W Beetom.YSpeedTableIndex,X                                      ;A8BCC3;
    ASL                                                                  ;A8BCC6;
    ASL                                                                  ;A8BCC7;
    ASL                                                                  ;A8BCC8;
    TAY                                                                  ;A8BCC9;
    LDA.W Common_EnemySpeeds_QuadraticallyIncreasing+2,Y                  ;A8BCCA;
    STA.B DP_Temp14                                                      ;A8BCCD;
    LDA.W Common_EnemySpeeds_QuadraticallyIncreasing,Y                    ;A8BCCF;
    STA.B DP_Temp12                                                      ;A8BCD2;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8BCD4;
    BCC .notCollidedWithBlock                                            ;A8BCD8;
    LDA.W #Function_Beetom_DecideAction                                  ;A8BCDA;
    STA.W Beetom.function,X                                              ;A8BCDD;
    BRA .return                                                          ;A8BCE0;

  .notCollidedWithBlock:
    LDA.W Beetom.YSpeedTableIndex,X                                      ;A8BCE2;
    CLC                                                                  ;A8BCE5;
    ADC.W #$0003                                                         ;A8BCE6;
    STA.W Beetom.YSpeedTableIndex,X                                      ;A8BCE9;
    CMP.W #$0040                                                         ;A8BCEC;
    BMI .return                                                          ;A8BCEF;
    LDA.W #$0040                                                         ;A8BCF1;
    STA.W Beetom.YSpeedTableIndex,X                                      ;A8BCF4;

  .return:
    RTS                                                                  ;A8BCF7;


;;; $BCF8: Beetom function - draining Samus - facing left ;;;
Function_Beetom_DrainingSamus_FacingLeft:
    LDX.W EnemyIndex                                                     ;A8BCF8;
    LDA.W Beetom.buttonCounter,X                                         ;A8BCFB;
    BNE .attached                                                        ;A8BCFE;
    STZ.B DP_Temp12                                                      ;A8BD00;
    LDA.W #$0010                                                         ;A8BD02;
    STA.B DP_Temp14                                                      ;A8BD05;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A8BD07;
    BCC .notCollidedWithWall                                             ;A8BD0B;
    LDA.W #$0001                                                         ;A8BD0D;
    STA.L Beetom.direction,X                                             ;A8BD10;
    STZ.B DP_Temp12                                                      ;A8BD14;
    LDA.W #$FFE0                                                         ;A8BD16;
    STA.B DP_Temp14                                                      ;A8BD19;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A8BD1B;

  .notCollidedWithWall:
    LDA.W #$0000                                                         ;A8BD1F;
    STA.L Beetom.attachedToSamusFlag,X                                   ;A8BD22;
    LDA.W #Function_Beetom_StartBeingFlung                               ;A8BD26;
    STA.W Beetom.function,X                                              ;A8BD29;
    BRA .return                                                          ;A8BD2C;

  .attached:
    LDA.W SamusXPosition                                                 ;A8BD2E;
    STA.W Enemy.XPosition,X                                              ;A8BD31;
    LDA.W SamusYPosition                                                 ;A8BD34;
    SEC                                                                  ;A8BD37;
    SBC.W #$0004                                                         ;A8BD38;
    STA.W Enemy.YPosition,X                                              ;A8BD3B;
    JSR.W UpdateBeetomButtonCounter                                      ;A8BD3E;

  .return:
    RTS                                                                  ;A8BD41;


;;; $BD42: Beetom function - draining Samus - facing right ;;;
Function_Beetom_DrainingSamus_FacingRight:
    LDX.W EnemyIndex                                                     ;A8BD42;
    LDA.W Beetom.buttonCounter,X                                         ;A8BD45;
    BNE .attached                                                        ;A8BD48;
    STZ.B DP_Temp12                                                      ;A8BD4A;
    LDA.W #$FFF0                                                         ;A8BD4C;
    STA.B DP_Temp14                                                      ;A8BD4F;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A8BD51;
    BCC .notCollidedWithWall                                             ;A8BD55;
    LDA.W #$0000                                                         ;A8BD57;
    STA.L Beetom.direction,X                                             ;A8BD5A;
    STZ.B DP_Temp12                                                      ;A8BD5E;
    LDA.W #$0020                                                         ;A8BD60;
    STA.B DP_Temp14                                                      ;A8BD63;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A8BD65;

  .notCollidedWithWall:
    LDA.W #$0000                                                         ;A8BD69;
    STA.L Beetom.attachedToSamusFlag,X                                   ;A8BD6C;
    LDA.W #Function_Beetom_StartBeingFlung                               ;A8BD70;
    STA.W Beetom.function,X                                              ;A8BD73;
    BRA .return                                                          ;A8BD76;

  .attached:
    LDA.W SamusXPosition                                                 ;A8BD78;
    STA.W Enemy.XPosition,X                                              ;A8BD7B;
    LDA.W SamusYPosition                                                 ;A8BD7E;
    SEC                                                                  ;A8BD81;
    SBC.W #$0004                                                         ;A8BD82;
    STA.W Enemy.YPosition,X                                              ;A8BD85;
    JSR.W UpdateBeetomButtonCounter                                      ;A8BD88;

  .return:
    RTS                                                                  ;A8BD8B;


;;; $BD8C: Update beetom button counter ;;;
UpdateBeetomButtonCounter:
    LDX.W EnemyIndex                                                     ;A8BD8C;
    LDA.B DP_Controller1Input                                            ;A8BD8F;
    CMP.W Beetom.previousController1Input,X                              ;A8BD91;
    BEQ .return                                                          ;A8BD94;
    STA.W Beetom.previousController1Input,X                              ;A8BD96;
    DEC.W Beetom.buttonCounter,X                                         ;A8BD99;

  .return:
    RTS                                                                  ;A8BD9C;


;;; $BD9D: Beetom function - dropping ;;;
Function_Beetom_Dropping:
    LDX.W EnemyIndex                                                     ;A8BD9D;
    LDA.W #$0003                                                         ;A8BDA0;
    STA.B DP_Temp14                                                      ;A8BDA3;
    LDA.W #$0000                                                         ;A8BDA5;
    STA.B DP_Temp12                                                      ;A8BDA8;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8BDAA;
    BCC .return                                                          ;A8BDAE;
    LDA.L Beetom.direction,X                                             ;A8BDB0;
    BNE .keepLeft                                                        ;A8BDB4;
    LDA.W #Function_Beetom_StartCrawlingLeft                             ;A8BDB6;
    STA.W Beetom.function,X                                              ;A8BDB9;
    BRA .return                                                          ;A8BDBC;

  .keepLeft:
    LDA.W #Function_Beetom_StartCrawlingRight                            ;A8BDBE;
    STA.W Beetom.function,X                                              ;A8BDC1;

  .return:
    RTS                                                                  ;A8BDC4;


;;; $BDC5: Beetom function - being flung ;;;
Function_Beetom_BeingFlung:
    LDX.W EnemyIndex                                                     ;A8BDC5;
    JSR.W Function_Beetom_Movement_BeingFlung                            ;A8BDC8;
    RTS                                                                  ;A8BDCB;


;;; $BDCC: Beetom movement - being flung ;;;
Function_Beetom_Movement_BeingFlung:
    LDA.W Beetom.YSpeedTableIndex,X                                      ;A8BDCC;
    ASL                                                                  ;A8BDCF;
    ASL                                                                  ;A8BDD0;
    ASL                                                                  ;A8BDD1;
    TAY                                                                  ;A8BDD2;
    LDA.W Common_EnemySpeeds_QuadraticallyIncreasing+2,Y                  ;A8BDD3;
    STA.B DP_Temp14                                                      ;A8BDD6;
    LDA.W Common_EnemySpeeds_QuadraticallyIncreasing,Y                    ;A8BDD8;
    STA.B DP_Temp12                                                      ;A8BDDB;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8BDDD;
    BCC .notCollidedWithBlock                                            ;A8BDE1;
    LDA.W #Function_Beetom_DecideAction                                  ;A8BDE3;
    STA.W Beetom.function,X                                              ;A8BDE6;
    BRA +                                                                ;A8BDE9;

  .notCollidedWithBlock:
    LDA.W Beetom.YSpeedTableIndex,X                                      ;A8BDEB;
    CLC                                                                  ;A8BDEE;
    ADC.W #$0001                                                         ;A8BDEF;
    STA.W Beetom.YSpeedTableIndex,X                                      ;A8BDF2;
    CMP.W #$0040                                                         ;A8BDF5;
    BMI +                                                                ;A8BDF8;
    LDA.W #$0040                                                         ;A8BDFA;
    STA.W Beetom.YSpeedTableIndex,X                                      ;A8BDFD;

+   LDA.L Beetom.direction,X                                             ;A8BE00;
    BNE .right                                                           ;A8BE04;
    LDA.W #$0002                                                         ;A8BE06;
    BRA +                                                                ;A8BE09;

  .right:
    LDA.W #$0002                                                         ;A8BE0B;
    EOR.W #$FFFF                                                         ;A8BE0E;
    INC                                                                  ;A8BE11;

+   STA.B DP_Temp14                                                      ;A8BE12;
    STZ.B DP_Temp12                                                      ;A8BE14;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A8BE16;
    BCC .return                                                          ;A8BE1A;
    LDA.L Beetom.direction,X                                             ;A8BE1C;
    EOR.W #$0001                                                         ;A8BE20;
    STA.L Beetom.direction,X                                             ;A8BE23;
    LDA.W #Function_Beetom_StartDropping                                 ;A8BE27;
    STA.W Beetom.function,X                                              ;A8BE2A;

  .return:
    RTS                                                                  ;A8BE2D;


;;; $BE2E: Enemy touch - enemy $E87F (beetom) ;;;
EnemyTouch_Beetom:
    LDX.W EnemyIndex                                                     ;A8BE2E;
    LDA.L Beetom.attachedToSamusFlag,X                                   ;A8BE31;
    BNE .attached                                                        ;A8BE35;
    LDA.L Beetom.direction,X                                             ;A8BE37;
    BNE .right                                                           ;A8BE3B;
    LDA.W #Function_Beetom_StartDrainingSamus_FacingLeft                 ;A8BE3D;
    STA.W Beetom.function,X                                              ;A8BE40;
    BRA +                                                                ;A8BE43;

  .right:
    LDA.W #Function_Beetom_StartDrainingSamus_FacingRight                ;A8BE45;
    STA.W Beetom.function,X                                              ;A8BE48;

+   LDA.W #$0001                                                         ;A8BE4B;
    STA.L Beetom.attachedToSamusFlag,X                                   ;A8BE4E;
    LDA.W #$0040                                                         ;A8BE52;
    STA.W Beetom.buttonCounter,X                                         ;A8BE55;
    LDA.W #$0002                                                         ;A8BE58;
    STA.W Enemy.layer,X                                                  ;A8BE5B;
    LDA.W SamusXPosition                                                 ;A8BE5E;
    SEC                                                                  ;A8BE61;
    SBC.W Enemy.XPosition,X                                              ;A8BE62;
    STA.L ExtraEnemy7800+$C,X                                            ;A8BE65;
    LDA.W SamusYPosition                                                 ;A8BE69;
    SEC                                                                  ;A8BE6C;
    SBC.W Enemy.YPosition,X                                              ;A8BE6D;
    STA.L ExtraEnemy7800+$E,X                                            ;A8BE70;

  .attached:
    LDA.W ContactDamageIndex                                             ;A8BE74;
    BNE .damage                                                          ;A8BE77;
    LDA.W NumberOfTimesMainEnemyRoutineExecuted                          ;A8BE79;
    AND.W #$0007                                                         ;A8BE7C;
    CMP.W #$0007                                                         ;A8BE7F;
    BNE +                                                                ;A8BE82;
    LDA.W Energy                                                         ;A8BE84;
    CMP.W #$001E                                                         ;A8BE87;
    BMI +                                                                ;A8BE8A;
    LDA.W #$002D                                                         ;A8BE8C;
    JSL.L QueueSound_Lib3_Max6                                           ;A8BE8F;

+   LDA.W Enemy.frameCounter,X                                           ;A8BE93;
    AND.W #$003F                                                         ;A8BE96;
    CMP.W #$003F                                                         ;A8BE99;
    BNE .return                                                          ;A8BE9C;

  .damage:
    JSL.L CommonA8_NormalEnemyTouchAI                                    ;A8BE9E;
    LDA.W #$0000                                                         ;A8BEA2;
    STA.W SamusInvincibilityTimer                                        ;A8BEA5;
    STA.W SamusKnockbackTimer                                            ;A8BEA8;

  .return:
    RTL                                                                  ;A8BEAB;


;;; $BEAC: Enemy shot - enemy $E87F (beetom) ;;;
EnemyShot_Beetom:
    JSL.L CommonA8_NormalEnemyShotAI                                     ;A8BEAC;
    LDX.W EnemyIndex                                                     ;A8BEB0;
    LDA.W Enemy.freezeTimer,X                                            ;A8BEB3;
    BEQ .return                                                          ;A8BEB6;
    LDA.W Beetom.function,X                                              ;A8BEB8;
    CMP.W #Function_Beetom_DrainingSamus_FacingRight                     ;A8BEBB;
    BEQ .startDropping                                                   ;A8BEBE;
    CMP.W #Function_Beetom_DrainingSamus_FacingLeft                      ;A8BEC0;
    BNE .return                                                          ;A8BEC3;

  .startDropping:
    LDA.W #Function_Beetom_StartDropping                                 ;A8BEC5;
    STA.W Beetom.function,X                                              ;A8BEC8;

  .return:
    LDA.W #$0000                                                         ;A8BECB;
    STA.L Beetom.attachedToSamusFlag,X                                   ;A8BECE;
    RTL                                                                  ;A8BED2;


;;; $BED3: Beetom spritemaps ;;;
Spritemap_Beetom_0:
    dw $0005                                                             ;A8BED3;
    %spritemapEntry(0, $00, $FE, 0, 0, 2, 0, $11E)
    %spritemapEntry(0, $00, $F6, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $05, $00, 0, 0, 2, 0, $11F)
    %spritemapEntry(0, $05, $F8, 0, 0, 2, 0, $10F)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $100)

Spritemap_Beetom_1:
    dw $0005                                                             ;A8BEEE;
    %spritemapEntry(0, $00, $FF, 0, 0, 2, 0, $11E)
    %spritemapEntry(0, $00, $F7, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $06, $00, 0, 0, 2, 0, $11F)
    %spritemapEntry(0, $05, $F9, 0, 0, 2, 0, $10F)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $102)

Spritemap_Beetom_2:
    dw $0005                                                             ;A8BF09;
    %spritemapEntry(0, $00, $00, 0, 0, 2, 0, $11E)
    %spritemapEntry(0, $01, $F8, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $07, $00, 0, 0, 2, 0, $11F)
    %spritemapEntry(0, $06, $FA, 0, 0, 2, 0, $10F)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $104)

Spritemap_Beetom_3:
    dw $0005                                                             ;A8BF24;
    %spritemapEntry(0, $07, $FE, 1, 0, 2, 0, $10D)
    %spritemapEntry(0, $1FF, $FE, 1, 0, 2, 0, $10C)
    %spritemapEntry(0, $0C, $FF, 0, 0, 2, 0, $10F)
    %spritemapEntry(0, $0D, $07, 0, 0, 2, 0, $11F)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $100)

Spritemap_Beetom_4:
    dw $0005                                                             ;A8BF3F;
    %spritemapEntry(0, $0E, $0F, 0, 0, 2, 0, $11F)
    %spritemapEntry(0, $0C, $07, 0, 0, 2, 0, $10F)
    %spritemapEntry(0, $08, $02, 0, 0, 2, 0, $10D)
    %spritemapEntry(0, $00, $02, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $100)

Spritemap_Beetom_5:
    dw $0005                                                             ;A8BF5A;
    %spritemapEntry(0, $02, $00, 0, 0, 2, 0, $10D)
    %spritemapEntry(0, $1FA, $00, 0, 0, 2, 0, $10C)
    %spritemapEntry(0, $00, $05, 0, 0, 2, 0, $11D)
    %spritemapEntry(0, $1F8, $05, 0, 0, 2, 0, $11C)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $106)

Spritemap_Beetom_6:
    dw $0005                                                             ;A8BF75;
    %spritemapEntry(0, $01, $00, 0, 0, 2, 0, $10D)
    %spritemapEntry(0, $1F9, $00, 0, 0, 2, 0, $10C)
    %spritemapEntry(0, $1FF, $05, 0, 0, 2, 0, $11D)
    %spritemapEntry(0, $1F8, $05, 0, 0, 2, 0, $11C)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $108)

Spritemap_Beetom_7:
    dw $0005                                                             ;A8BF90;
    %spritemapEntry(0, $00, $00, 0, 0, 2, 0, $10D)
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 0, $10C)
    %spritemapEntry(0, $1FE, $05, 0, 0, 2, 0, $11D)
    %spritemapEntry(0, $1F8, $05, 0, 0, 2, 0, $11C)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10A)

Spritemap_Beetom_8:
    dw $0006                                                             ;A8BFAB;
    %spritemapEntry(0, $1FA, $F8, 0, 0, 2, 0, $120)
    %spritemapEntry(0, $02, $00, 0, 0, 2, 0, $10D)
    %spritemapEntry(0, $1FA, $00, 0, 0, 2, 0, $10C)
    %spritemapEntry(0, $00, $05, 0, 0, 2, 0, $11D)
    %spritemapEntry(0, $1F8, $05, 0, 0, 2, 0, $11C)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $106)

Spritemap_Beetom_9:
    dw $0006                                                             ;A8BFCB;
    %spritemapEntry(0, $1FA, $F8, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $01, $00, 0, 0, 2, 0, $10D)
    %spritemapEntry(0, $1F9, $00, 0, 0, 2, 0, $10C)
    %spritemapEntry(0, $1FF, $05, 0, 0, 2, 0, $11D)
    %spritemapEntry(0, $1F8, $05, 0, 0, 2, 0, $11C)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $108)

Spritemap_Beetom_A:
    dw $0006                                                             ;A8BFEB;
    %spritemapEntry(0, $1FA, $F8, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $00, $00, 0, 0, 2, 0, $10D)
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 0, $10C)
    %spritemapEntry(0, $1FE, $05, 0, 0, 2, 0, $11D)
    %spritemapEntry(0, $1F8, $05, 0, 0, 2, 0, $11C)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10A)

Spritemap_Beetom_B:
    dw $0005                                                             ;A8C00B;
    %spritemapEntry(0, $1F8, $FE, 0, 1, 2, 0, $11E)
    %spritemapEntry(0, $1F8, $F6, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $1F3, $00, 0, 1, 2, 0, $11F)
    %spritemapEntry(0, $1F3, $F8, 0, 1, 2, 0, $10F)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $100)

Spritemap_Beetom_C:
    dw $0005                                                             ;A8C026;
    %spritemapEntry(0, $1F8, $FF, 0, 1, 2, 0, $11E)
    %spritemapEntry(0, $1F8, $F7, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $1F2, $00, 0, 1, 2, 0, $11F)
    %spritemapEntry(0, $1F3, $F9, 0, 1, 2, 0, $10F)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $102)

Spritemap_Beetom_D:
    dw $0005                                                             ;A8C041;
    %spritemapEntry(0, $1F8, $00, 0, 1, 2, 0, $11E)
    %spritemapEntry(0, $1F7, $F8, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $1F1, $00, 0, 1, 2, 0, $11F)
    %spritemapEntry(0, $1F2, $FA, 0, 1, 2, 0, $10F)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $104)

Spritemap_Beetom_E:
    dw $0005                                                             ;A8C05C;
    %spritemapEntry(0, $1F1, $FE, 1, 1, 2, 0, $10D)
    %spritemapEntry(0, $1F9, $FE, 1, 1, 2, 0, $10C)
    %spritemapEntry(0, $1EC, $FF, 0, 1, 2, 0, $10F)
    %spritemapEntry(0, $1EB, $07, 0, 1, 2, 0, $11F)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $100)

Spritemap_Beetom_F:
    dw $0005                                                             ;A8C077;
    %spritemapEntry(0, $1EA, $0F, 0, 1, 2, 0, $11F)
    %spritemapEntry(0, $1EC, $07, 0, 1, 2, 0, $10F)
    %spritemapEntry(0, $1F0, $02, 0, 1, 2, 0, $10D)
    %spritemapEntry(0, $1F8, $02, 0, 1, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $100)

Spritemap_Beetom_10:
    dw $0005                                                             ;A8C092;
    %spritemapEntry(0, $1F6, $00, 0, 1, 2, 0, $10D)
    %spritemapEntry(0, $1FE, $00, 0, 1, 2, 0, $10C)
    %spritemapEntry(0, $1F8, $05, 0, 1, 2, 0, $11D)
    %spritemapEntry(0, $00, $05, 0, 1, 2, 0, $11C)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $106)

Spritemap_Beetom_11:
    dw $0005                                                             ;A8C0AD;
    %spritemapEntry(0, $1F7, $00, 0, 1, 2, 0, $10D)
    %spritemapEntry(0, $1FF, $00, 0, 1, 2, 0, $10C)
    %spritemapEntry(0, $1F9, $05, 0, 1, 2, 0, $11D)
    %spritemapEntry(0, $00, $05, 0, 1, 2, 0, $11C)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $108)

Spritemap_Beetom_12:
    dw $0005                                                             ;A8C0C8;
    %spritemapEntry(0, $1F8, $00, 0, 1, 2, 0, $10D)
    %spritemapEntry(0, $00, $00, 0, 1, 2, 0, $10C)
    %spritemapEntry(0, $1FA, $05, 0, 1, 2, 0, $11D)
    %spritemapEntry(0, $00, $05, 0, 1, 2, 0, $11C)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $10A)

Spritemap_Beetom_13:
    dw $0006                                                             ;A8C0E3;
    %spritemapEntry(0, $1FE, $F8, 0, 1, 2, 0, $120)
    %spritemapEntry(0, $1F6, $00, 0, 1, 2, 0, $10D)
    %spritemapEntry(0, $1FE, $00, 0, 1, 2, 0, $10C)
    %spritemapEntry(0, $1F8, $05, 0, 1, 2, 0, $11D)
    %spritemapEntry(0, $00, $05, 0, 1, 2, 0, $11C)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $106)

Spritemap_Beetom_14:
    dw $0006                                                             ;A8C103;
    %spritemapEntry(0, $1FE, $F8, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $1F7, $00, 0, 1, 2, 0, $10D)
    %spritemapEntry(0, $1FF, $00, 0, 1, 2, 0, $10C)
    %spritemapEntry(0, $1F9, $05, 0, 1, 2, 0, $11D)
    %spritemapEntry(0, $00, $05, 0, 1, 2, 0, $11C)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $108)

Spritemap_Beetom_15:
    dw $0006                                                             ;A8C123;
    %spritemapEntry(0, $1FE, $F8, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $1F8, $00, 0, 1, 2, 0, $10D)
    %spritemapEntry(0, $00, $00, 0, 1, 2, 0, $10C)
    %spritemapEntry(0, $1FA, $05, 0, 1, 2, 0, $11D)
    %spritemapEntry(0, $00, $05, 0, 1, 2, 0, $11C)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $10A)


;;; $C143: Palette - enemy $E8BF (powamp) ;;;
Palette_Powamp:
    dw $3800,$57FF,$42F7,$0929,$00A5,$4F5A,$36B5,$2610                   ;A8C143;
    dw $1DCE,$02FF,$01BF,$000F,$0008,$03FF,$0237,$00D1                   ;A8C153;


;;; $C163: Instruction list - body - fast ;;;
InstList_Powamp_Body_FastAnimation:
    dw $0005,Spritemap_Powamp_Body_CheeksLowered                         ;A8C163;
    dw $0005,Spritemap_Powamp_Body_CheeksLifting                         ;A8C167;
    dw $0005,Spritemap_Powamp_Body_CheeksRaised                          ;A8C16B;
    dw Common_Instruction_GotoY                                          ;A8C16F;
    dw InstList_Powamp_Body_FastAnimation                                ;A8C171;


InstList_Powamp_Body_SlowAnimation:
    dw $0009,Spritemap_Powamp_Body_CheeksLowered                         ;A8C173;
    dw $0009,Spritemap_Powamp_Body_CheeksLifting                         ;A8C177;
    dw $0009,Spritemap_Powamp_Body_CheeksRaised                          ;A8C17B;
    dw Common_Instruction_GotoY                                          ;A8C17F;
    dw InstList_Powamp_Body_SlowAnimation                                ;A8C181;


;;; $C183: Instruction list - balloon - inflate ;;;
InstList_Powamp_Balloon_Inflate_0:
    dw $0001,Spritemap_Powamp_Balloon_Deflated                           ;A8C183;

InstList_Powamp_Balloon_Inflate_1:
    dw $0006,Spritemap_Powamp_Balloon_Inflating                          ;A8C187;

InstList_Powamp_Balloon_Inflate_2:
    dw $00A0,Spritemap_Powamp_Balloon_FullyInflated                      ;A8C18B;
    dw Common_Instruction_Sleep                                          ;A8C18F;


;;; $C191: Instruction list - balloon - deflate ;;;
InstList_Powamp_Balloon_StartSinking:
    dw $0001,Spritemap_Powamp_Balloon_FullyInflated                      ;A8C191;
    dw $0006,Spritemap_Powamp_Balloon_Inflating                          ;A8C195;


;;; $C199: Instruction list - balloon - initial ;;;
InstList_Powamp_Balloon_Deflated:
    dw $00A0,Spritemap_Powamp_Balloon_Deflated                           ;A8C199;
    dw Common_Instruction_Sleep                                          ;A8C19D;



;;; $C19F: Powamp constants ;;;
PowampTravelDistanceWhenNotGrappled:
    dw $0040                                                             ;A8C19F;

PowampWiggleTable:
; Wiggle table. X offsets applied for 5 frames each in a loop
    dw $0000,$0001,$0002,$0003,$0002,$0001,$0000,$FFFF                   ;A8C1A1;
    dw $FFFE,$FFFD,$FFFE,$FFFF                                           ;A8C1B1;

Powamp_YAccel_Rising:
    dw $0000,$0000                                                       ;A8C1B9;

Powamp_YAccel_Sinking:
    dw $0000,$0000                                                       ;A8C1BD;

Powamp_InitialYVelocity_Sinking:
    dw $0001,$0000                                                       ;A8C1C1;

Powamp_InitialYVelocity_Rising:
    dw $FFFF,$8000                                                       ;A8C1C5;


;;; $C1C9: Initialisation AI - enemy $E8BF (powamp) ;;;
InitAI_Powamp:
    LDX.W EnemyIndex                                                     ;A8C1C9;
    LDA.W Enemy.properties,X                                             ;A8C1CC;
    ORA.W #$2000                                                         ;A8C1CF;
    STA.W Enemy.properties,X                                             ;A8C1D2;
    LDA.W #Common_Spritemap_Nothing                                      ;A8C1D5;
    STA.W Enemy.spritemap,X                                              ;A8C1D8;
    LDA.W #$0001                                                         ;A8C1DB;
    STA.W Enemy.instTimer,X                                              ;A8C1DE;
    STZ.W Enemy.loopCounter,X                                            ;A8C1E1;
    LDA.W Enemy.init0,X                                                  ;A8C1E4;
    BNE .balloon                                                         ;A8C1E7;
    LDA.W #$003C                                                         ;A8C1E9;
    STA.W Powamp.functionTimer,X                                         ;A8C1EC;
    LDA.W #Function_Powamp_Deflated_Resting                              ;A8C1EF;
    STA.W Powamp.function,X                                              ;A8C1F2;
    LDA.W #InstList_Powamp_Body_SlowAnimation                            ;A8C1F5;
    STA.W Enemy.instList,X                                               ;A8C1F8;
    BRA .return                                                          ;A8C1FB;

  .balloon:
    LDA.W Enemy.XPosition,X                                              ;A8C1FD;
    STA.W Powamp.balloonSpawnXPosition,X                                 ;A8C200;
    LDA.W Enemy.YPosition,X                                              ;A8C203;
    STA.W Powamp.balloonSpawnYPosition,X                                 ;A8C206;
    LDA.W #RTL_A8C568                                                    ;A8C209;
    STA.W Powamp.function,X                                              ;A8C20C;
    LDA.W #InstList_Powamp_Balloon_Deflated                              ;A8C20F;
    STA.W Enemy.instList,X                                               ;A8C212;
    LDA.W Enemy.init1,X                                                  ;A8C215;
    STA.W Powamp.balloonGrappleTravelDistance,X                          ;A8C218;

  .return:
    RTL                                                                  ;A8C21B;


;;; $C21C: Main AI - enemy $E8BF (powamp) ;;;
MainAI_Powamp:
    LDX.W EnemyIndex                                                     ;A8C21C;
    JMP.W (Powamp.function,X)                                            ;A8C21F;


;;; $C222: RTL ;;;
RTL_A8C222:
    RTL                                                                  ;A8C222;


;;; $C223: Spawn powamp spike enemy projectiles ;;;
FirePowampSpikesIn8Directions:
    LDY.W #$0007                                                         ;A8C223;

  .loop:
    TYA                                                                  ;A8C226;
    PHY                                                                  ;A8C227;
    LDY.W #EnemyProjectile_Powamp                                        ;A8C228;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A8C22B;
    PLY                                                                  ;A8C22F;
    DEY                                                                  ;A8C230;
    BPL .loop                                                            ;A8C231;
    RTS                                                                  ;A8C233;


;;; $C234: Set powamp balloon Y position ;;;
HandlePowampBalloonYOffset:
    LDA.W Enemy[-1].instList,X                                           ;A8C234;
    CMP.W #InstList_Powamp_Balloon_StartSinking                          ;A8C237;
    BPL .sinking                                                         ;A8C23A;
    SEC                                                                  ;A8C23C;
    SBC.W #$0004                                                         ;A8C23D;
    SEC                                                                  ;A8C240;
    SBC.W #InstList_Powamp_Balloon_Inflate_0                             ;A8C241;
    LSR                                                                  ;A8C244;
    CMP.W #$0006                                                         ;A8C245;
    BMI +                                                                ;A8C248;
    LDA.W #$0000                                                         ;A8C24A;

+   TAY                                                                  ;A8C24D;
    LDA.W Enemy.YPosition,X                                              ;A8C24E;
    CLC                                                                  ;A8C251;
    ADC.W .risingYOffsets,Y                                              ;A8C252;
    STA.W Enemy[-1].YPosition,X                                          ;A8C255;
    BRA .return                                                          ;A8C258;

  .sinking:
    SEC                                                                  ;A8C25A;
    SBC.W #$0004                                                         ;A8C25B;
    SEC                                                                  ;A8C25E;
    SBC.W #InstList_Powamp_Balloon_StartSinking                          ;A8C25F;
    LSR                                                                  ;A8C262;
    CMP.W #$0006                                                         ;A8C263;
    BMI +                                                                ;A8C266;
    LDA.W #$0000                                                         ;A8C268;

+   TAY                                                                  ;A8C26B;
    LDA.W Enemy.YPosition,X                                              ;A8C26C;
    CLC                                                                  ;A8C26F;
    ADC.W .sinkingYOffsets,Y                                             ;A8C270;
    STA.W Enemy[-1].YPosition,X                                          ;A8C273;

  .return:
    RTS                                                                  ;A8C276;

; Balloon Y offsets. Indexed by animation frame into inflate/deflate instruction list
  .risingYOffsets:
    dw $FFF4,$FFF0,$FFEC                                                 ;A8C277;

  .sinkingYOffsets:
    dw $FFEC,$FFF0,$FFF4                                                 ;A8C27D;


;;; $C283: Powamp function - body - deflated - resting ;;;
Function_Powamp_Deflated_Resting:
    DEC.W Powamp.functionTimer,X                                         ;A8C283;
    BEQ .timerExpired                                                    ;A8C286;
    BPL .done                                                            ;A8C288;

  .timerExpired:
    LDA.W #$0001                                                         ;A8C28A;
    STA.W Enemy[-1].instTimer,X                                          ;A8C28D;
    LDA.W #InstList_Powamp_Balloon_Inflate_0                             ;A8C290;
    STA.W Enemy[-1].instList,X                                           ;A8C293;
    LDA.W #Function_Powamp_Inflating                                     ;A8C296;
    STA.W Powamp.function,X                                              ;A8C299;
    LDA.W #$000A                                                         ;A8C29C;
    STA.W Powamp.functionTimer,X                                         ;A8C29F;

  .done:
    JSR.W HandlePowampBalloonYOffset                                     ;A8C2A2;
    RTL                                                                  ;A8C2A5;


;;; $C2A6: Powamp function - body - inflating ;;;
Function_Powamp_Inflating:
    DEC.W Powamp.functionTimer,X                                         ;A8C2A6;
    BEQ .timerExpired                                                    ;A8C2A9;
    BPL .done                                                            ;A8C2AB;

  .timerExpired:
    LDA.W #Function_Powamp_Inflated_RiseToTargetHeight                   ;A8C2AD;
    STA.W Powamp.function,X                                              ;A8C2B0;
    LDA.W Powamp_InitialYVelocity_Rising                                 ;A8C2B3;
    STA.W Powamp.YVelocity,X                                             ;A8C2B6;
    LDA.W Powamp_InitialYVelocity_Rising+2                               ;A8C2B9;
    STA.W Powamp.YSubVelocity,X                                          ;A8C2BC;
    LDA.W #$0001                                                         ;A8C2BF;
    STA.W Enemy.instTimer,X                                              ;A8C2C2;
    LDA.W #InstList_Powamp_Body_FastAnimation                            ;A8C2C5;
    STA.W Enemy.instList,X                                               ;A8C2C8;

  .done:
    JSR.W HandlePowampBalloonYOffset                                     ;A8C2CB;
    RTL                                                                  ;A8C2CE;


;;; $C2CF: Powamp function - body - inflated - rise to target height ;;;
Function_Powamp_Inflated_RiseToTargetHeight:
    LDA.W Enemy.AI,X                                                     ;A8C2CF;
    BIT.W #$0001                                                         ;A8C2D2;
    BEQ .notGrappleAI                                                    ;A8C2D5;
    LDA.W #Function_Powamp_Grappled_RiseToTargetHeight                   ;A8C2D7;
    STA.W Powamp.function,X                                              ;A8C2DA;
    JMP.W Function_Powamp_Grappled_RiseToTargetHeight                    ;A8C2DD;

  .notGrappleAI:
    DEC.W Powamp.wiggleTimer,X                                           ;A8C2E0;
    BEQ .negativeTimer                                                   ;A8C2E3;
    BPL .timerNotExpired                                                 ;A8C2E5;

  .negativeTimer:
    LDA.W #$0005                                                         ;A8C2E7;
    STA.W Powamp.wiggleTimer,X                                           ;A8C2EA;
    LDA.W Powamp.wiggleIndex,X                                           ;A8C2ED;
    ASL                                                                  ;A8C2F0;
    TAY                                                                  ;A8C2F1;
    LDA.W Enemy[-1].var0,X                                               ;A8C2F2;
    CLC                                                                  ;A8C2F5;
    ADC.W PowampWiggleTable,Y                                            ;A8C2F6;
    STA.W Enemy[-1].XPosition,X                                          ;A8C2F9;
    STA.W Enemy.XPosition,X                                              ;A8C2FC;
    LDA.W Powamp.wiggleIndex,X                                           ;A8C2FF;
    INC                                                                  ;A8C302;
    CMP.W #$000C                                                         ;A8C303;
    BMI .storeIndex                                                      ;A8C306;
    LDA.W #$0000                                                         ;A8C308;

  .storeIndex:
    STA.W Powamp.wiggleIndex,X                                           ;A8C30B;

  .timerNotExpired:
    LDA.W Powamp.YSubVelocity,X                                          ;A8C30E;
    CLC                                                                  ;A8C311;
    ADC.W Powamp_YAccel_Rising+2                                         ;A8C312;
    STA.W Powamp.YSubVelocity,X                                          ;A8C315;
    LDA.W Powamp.YVelocity,X                                             ;A8C318;
    ADC.W Powamp_YAccel_Rising                                           ;A8C31B;
    STA.W Powamp.YVelocity,X                                             ;A8C31E;
    LDA.W Powamp.YVelocity,X                                             ;A8C321; >.<
    STA.B DP_Temp14                                                      ;A8C324;
    LDA.W Powamp.YSubVelocity,X                                          ;A8C326;
    STA.B DP_Temp12                                                      ;A8C329;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8C32B;
    BCS .doneRising                                                      ;A8C32F;
    LDA.W Enemy[-1].var1,X                                               ;A8C331;
    SEC                                                                  ;A8C334;
    SBC.W PowampTravelDistanceWhenNotGrappled                            ;A8C335;
    CMP.W Enemy.YPosition,X                                              ;A8C338;
    BMI .done                                                            ;A8C33B;

  .doneRising:
    LDA.W Powamp.wiggleIndex,X                                           ;A8C33D;
    BEQ .centered                                                        ;A8C340;
    CMP.W #$0006                                                         ;A8C342;
    BEQ .centered                                                        ;A8C345;
    LDA.W #Function_Powamp_Inflated_FinishWiggle                         ;A8C347;
    STA.W Powamp.function,X                                              ;A8C34A;
    BRA .done                                                            ;A8C34D;

  .centered:
    LDA.W #Function_Powamp_Deflating                                     ;A8C34F;
    STA.W Powamp.function,X                                              ;A8C352;
    LDA.W #$000A                                                         ;A8C355;
    STA.W Powamp.functionTimer,X                                         ;A8C358;
    LDA.W #$0001                                                         ;A8C35B;
    STA.W Enemy[-1].instTimer,X                                          ;A8C35E;
    LDA.W #InstList_Powamp_Balloon_StartSinking                          ;A8C361;
    STA.W Enemy[-1].instList,X                                           ;A8C364;

  .done:
    JSR.W HandlePowampBalloonYOffset                                     ;A8C367;
    RTL                                                                  ;A8C36A;


;;; $C36B: Powamp function - body - inflated - finish wiggle ;;;
Function_Powamp_Inflated_FinishWiggle:
    DEC.W Powamp.wiggleTimer,X                                           ;A8C36B;
    BEQ .timerExpired                                                    ;A8C36E;
    BPL .continueRising                                                  ;A8C370;

  .timerExpired:
    LDA.W #$0005                                                         ;A8C372;
    STA.W Powamp.wiggleTimer,X                                           ;A8C375;
    LDA.W Powamp.wiggleIndex,X                                           ;A8C378;
    ASL                                                                  ;A8C37B;
    TAY                                                                  ;A8C37C;
    LDA.W Enemy[-1].var0,X                                               ;A8C37D;
    CLC                                                                  ;A8C380;
    ADC.W PowampWiggleTable,Y                                            ;A8C381;
    STA.W Enemy[-1].XPosition,X                                          ;A8C384;
    STA.W Enemy.XPosition,X                                              ;A8C387;
    LDA.W Powamp.wiggleIndex,X                                           ;A8C38A;
    BEQ .centered                                                        ;A8C38D;
    CMP.W #$0006                                                         ;A8C38F;
    BEQ .centered                                                        ;A8C392;
    INC                                                                  ;A8C394;
    CMP.W #$000C                                                         ;A8C395;
    BMI .storeIndex                                                      ;A8C398;
    LDA.W #$0000                                                         ;A8C39A;

  .storeIndex:
    STA.W Powamp.wiggleIndex,X                                           ;A8C39D;
    BRA .continueRising                                                  ;A8C3A0;

  .centered:
    LDA.W #Function_Powamp_Deflating                                     ;A8C3A2;
    STA.W Powamp.function,X                                              ;A8C3A5;
    LDA.W #$000A                                                         ;A8C3A8;
    STA.W Powamp.functionTimer,X                                         ;A8C3AB;
    LDA.W #$0001                                                         ;A8C3AE;
    STA.W Enemy[-1].instTimer,X                                          ;A8C3B1;
    LDA.W #InstList_Powamp_Balloon_StartSinking                          ;A8C3B4;
    STA.W Enemy[-1].instList,X                                           ;A8C3B7;
    BRA .return                                                          ;A8C3BA;

  .continueRising:
    LDA.W Powamp.YSubVelocity,X                                          ;A8C3BC;
    CLC                                                                  ;A8C3BF;
    ADC.W Powamp_YAccel_Rising+2                                         ;A8C3C0;
    STA.W Powamp.YSubVelocity,X                                          ;A8C3C3;
    LDA.W Powamp.YVelocity,X                                             ;A8C3C6;
    ADC.W Powamp_YAccel_Rising                                           ;A8C3C9;
    STA.W Powamp.YVelocity,X                                             ;A8C3CC;
    LDA.W Powamp.YVelocity,X                                             ;A8C3CF; >.<
    STA.B DP_Temp14                                                      ;A8C3D2;
    LDA.W Powamp.YSubVelocity,X                                          ;A8C3D4;
    STA.B DP_Temp12                                                      ;A8C3D7;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8C3D9;

  .return:
    JSR.W HandlePowampBalloonYOffset                                     ;A8C3DD;
    RTL                                                                  ;A8C3E0;


;;; $C3E1: Powamp function - body - grappled - rise to target height ;;;
Function_Powamp_Grappled_RiseToTargetHeight:
    LDA.W Enemy.AI,X                                                     ;A8C3E1;
    BIT.W #$0001                                                         ;A8C3E4;
    BNE .grappleAI                                                       ;A8C3E7;
    LDA.W #Function_Powamp_Inflated_FinishWiggle                         ;A8C3E9;
    STA.W Powamp.function,X                                              ;A8C3EC;
    RTL                                                                  ;A8C3EF;

  .grappleAI:
    DEC.W Powamp.wiggleTimer,X                                           ;A8C3F0;
    BEQ .timerExpired                                                    ;A8C3F3;
    BPL .timerNotExpired                                                 ;A8C3F5;

  .timerExpired:
    LDA.W #$0005                                                         ;A8C3F7;
    STA.W Powamp.wiggleTimer,X                                           ;A8C3FA;
    LDA.W Powamp.wiggleIndex,X                                           ;A8C3FD;
    ASL                                                                  ;A8C400;
    TAY                                                                  ;A8C401;
    LDA.W Enemy[-1].var0,X                                               ;A8C402;
    CLC                                                                  ;A8C405;
    ADC.W PowampWiggleTable,Y                                            ;A8C406;
    STA.W Enemy[-1].XPosition,X                                          ;A8C409;
    STA.W Enemy.XPosition,X                                              ;A8C40C;
    LDA.W Powamp.wiggleIndex,X                                           ;A8C40F;
    INC                                                                  ;A8C412;
    CMP.W #$000C                                                         ;A8C413;
    BMI .storeIndex                                                      ;A8C416;
    LDA.W #$0000                                                         ;A8C418;

  .storeIndex:
    STA.W Powamp.wiggleIndex,X                                           ;A8C41B;

  .timerNotExpired:
    LDA.W Powamp.YSubVelocity,X                                          ;A8C41E;
    CLC                                                                  ;A8C421;
    ADC.W Powamp_YAccel_Rising+2                                         ;A8C422;
    STA.W Powamp.YSubVelocity,X                                          ;A8C425;
    LDA.W Powamp.YVelocity,X                                             ;A8C428;
    ADC.W Powamp_YAccel_Rising                                           ;A8C42B;
    STA.W Powamp.YVelocity,X                                             ;A8C42E;
    LDA.W Powamp.YVelocity,X                                             ;A8C431; >.<
    STA.B DP_Temp14                                                      ;A8C434;
    LDA.W Powamp.YSubVelocity,X                                          ;A8C436;
    STA.B DP_Temp12                                                      ;A8C439;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8C43B;
    BCS .doneSinking                                                     ;A8C43F;
    LDA.W Enemy[-1].var1,X                                               ;A8C441;
    SEC                                                                  ;A8C444;
    SBC.W Enemy[-1].var3,X                                               ;A8C445;
    CMP.W Enemy.YPosition,X                                              ;A8C448;
    BMI .return                                                          ;A8C44B;

  .doneSinking:
    LDA.W Powamp.wiggleIndex,X                                           ;A8C44D;
    BEQ .centered                                                        ;A8C450;
    CMP.W #$0006                                                         ;A8C452;
    BEQ .centered                                                        ;A8C455;
    LDA.W #Function_Powamp_Grappled_FinishWiggle                         ;A8C457;
    STA.W Powamp.function,X                                              ;A8C45A;
    BRA .return                                                          ;A8C45D;

  .centered:
    LDA.W #Function_Powamp_Grappled_Resting                              ;A8C45F;
    STA.W Powamp.function,X                                              ;A8C462;

  .return:
    JSR.W HandlePowampBalloonYOffset                                     ;A8C465;
    RTL                                                                  ;A8C468;


;;; $C469: Powamp function - body - grappled - finish wiggle ;;;
Function_Powamp_Grappled_FinishWiggle:
    LDA.W Enemy.AI,X                                                     ;A8C469;
    BIT.W #$0001                                                         ;A8C46C;
    BNE .GrappleAI                                                       ;A8C46F;
    LDA.W #Function_Powamp_Inflated_FinishWiggle                         ;A8C471;
    STA.W Powamp.function,X                                              ;A8C474;
    RTL                                                                  ;A8C477;

  .GrappleAI:
    DEC.W Powamp.wiggleTimer,X                                           ;A8C478;
    BEQ .timerExpired                                                    ;A8C47B;
    BPL .continueRising                                                  ;A8C47D;

  .timerExpired:
    LDA.W #$0005                                                         ;A8C47F;
    STA.W Powamp.wiggleTimer,X                                           ;A8C482;
    LDA.W Powamp.wiggleIndex,X                                           ;A8C485;
    ASL                                                                  ;A8C488;
    TAY                                                                  ;A8C489;
    LDA.W Enemy[-1].var0,X                                               ;A8C48A;
    CLC                                                                  ;A8C48D;
    ADC.W PowampWiggleTable,Y                                            ;A8C48E;
    STA.W Enemy[-1].XPosition,X                                          ;A8C491;
    STA.W Enemy.XPosition,X                                              ;A8C494;
    LDA.W Powamp.wiggleIndex,X                                           ;A8C497;
    BEQ .centered                                                        ;A8C49A;
    CMP.W #$0006                                                         ;A8C49C;
    BEQ .centered                                                        ;A8C49F;
    INC                                                                  ;A8C4A1;
    CMP.W #$000C                                                         ;A8C4A2;
    BMI .storeIndex                                                      ;A8C4A5;
    LDA.W #$0000                                                         ;A8C4A7;

  .storeIndex:
    STA.W Powamp.wiggleIndex,X                                           ;A8C4AA;
    BRA .continueRising                                                  ;A8C4AD;

  .centered:
    LDA.W #Function_Powamp_Grappled_Resting                              ;A8C4AF;
    STA.W Powamp.function,X                                              ;A8C4B2;
    BRA .return                                                          ;A8C4B5;

  .continueRising:
    LDA.W Powamp.YSubVelocity,X                                          ;A8C4B7;
    CLC                                                                  ;A8C4BA;
    ADC.W Powamp_YAccel_Rising+2                                         ;A8C4BB;
    STA.W Powamp.YSubVelocity,X                                          ;A8C4BE;
    LDA.W Powamp.YVelocity,X                                             ;A8C4C1;
    ADC.W Powamp_YAccel_Rising                                           ;A8C4C4;
    STA.W Powamp.YVelocity,X                                             ;A8C4C7;
    LDA.W Powamp.YVelocity,X                                             ;A8C4CA; >.<
    STA.B DP_Temp14                                                      ;A8C4CD;
    LDA.W Powamp.YSubVelocity,X                                          ;A8C4CF;
    STA.B DP_Temp12                                                      ;A8C4D2;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8C4D4;

  .return:
    JSR.W HandlePowampBalloonYOffset                                     ;A8C4D8;
    RTL                                                                  ;A8C4DB;


;;; $C4DC: Powamp function - body - grappled - resting ;;;
Function_Powamp_Grappled_Resting:
    LDA.W Enemy.AI,X                                                     ;A8C4DC;
    BIT.W #$0001                                                         ;A8C4DF;
    BNE .done                                                            ;A8C4E2;
    LDA.W #Function_Powamp_Deflating                                     ;A8C4E4;
    STA.W Powamp.function,X                                              ;A8C4E7;
    LDA.W #$000A                                                         ;A8C4EA;
    STA.W Powamp.functionTimer,X                                         ;A8C4ED;
    LDA.W #$0001                                                         ;A8C4F0;
    STA.W Enemy[-1].instTimer,X                                          ;A8C4F3;
    LDA.W #InstList_Powamp_Balloon_StartSinking                          ;A8C4F6;
    STA.W Enemy[-1].instList,X                                           ;A8C4F9;

  .done:
    JSR.W HandlePowampBalloonYOffset                                     ;A8C4FC;
    RTL                                                                  ;A8C4FF;


;;; $C500: Powamp function - body - deflating ;;;
Function_Powamp_Deflating:
    DEC.W Powamp.functionTimer,X                                         ;A8C500;
    BEQ .timerExpired                                                    ;A8C503;
    BPL .done                                                            ;A8C505;

  .timerExpired:
    LDA.W #Function_Powamp_Deflated_Sinking                              ;A8C507;
    STA.W Powamp.function,X                                              ;A8C50A;
    LDA.W Powamp_InitialYVelocity_Sinking                                ;A8C50D;
    STA.W Powamp.YVelocity,X                                             ;A8C510;
    LDA.W Powamp_InitialYVelocity_Sinking+2                              ;A8C513;
    STA.W Powamp.YSubVelocity,X                                          ;A8C516;

  .done:
    JSR.W HandlePowampBalloonYOffset                                     ;A8C519;
    RTL                                                                  ;A8C51C;


;;; $C51D: Powamp function - body - deflated - sinking ;;;
Function_Powamp_Deflated_Sinking:
    LDA.W Powamp.YSubVelocity,X                                          ;A8C51D;
    CLC                                                                  ;A8C520;
    ADC.W Powamp_YAccel_Sinking+2                                        ;A8C521;
    STA.W Powamp.YSubVelocity,X                                          ;A8C524;
    LDA.W Powamp.YVelocity,X                                             ;A8C527;
    ADC.W Powamp_YAccel_Sinking                                          ;A8C52A;
    STA.W Powamp.YVelocity,X                                             ;A8C52D;
    LDA.W Powamp.YVelocity,X                                             ;A8C530; >.<
    STA.B DP_Temp14                                                      ;A8C533;
    LDA.W Powamp.YSubVelocity,X                                          ;A8C535;
    STA.B DP_Temp12                                                      ;A8C538;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8C53A;
    LDA.W Enemy.YPosition,X                                              ;A8C53E;
    CMP.W Enemy[-1].var1,X                                               ;A8C541;
    BMI .done                                                            ;A8C544;
    LDA.W Enemy[-1].var1,X                                               ;A8C546;
    STA.W Enemy.YPosition,X                                              ;A8C549;
    LDA.W #Function_Powamp_Deflated_Resting                              ;A8C54C;
    STA.W Powamp.function,X                                              ;A8C54F;
    LDA.W #$003C                                                         ;A8C552;
    STA.W Powamp.functionTimer,X                                         ;A8C555;
    LDA.W #$0001                                                         ;A8C558;
    STA.W Enemy.instTimer,X                                              ;A8C55B;
    LDA.W #InstList_Powamp_Body_SlowAnimation                            ;A8C55E;
    STA.W Enemy.instList,X                                               ;A8C561;

  .done:
    JSR.W HandlePowampBalloonYOffset                                     ;A8C564;
    RTL                                                                  ;A8C567;


;;; $C568: RTL ;;;
RTL_A8C568:
    RTL                                                                  ;A8C568;


;;; $C569: Powamp function - body - fatal damage ;;;
Function_Powamp_FatalDamage:
    LDA.W Enemy[-1].instList,X                                           ;A8C569;
    CMP.W #InstList_Powamp_Balloon_StartSinking                          ;A8C56C;
    BMI +                                                                ;A8C56F;
    SEC                                                                  ;A8C571;
    SBC.W #$0004                                                         ;A8C572;
    SEC                                                                  ;A8C575;
    SBC.W #InstList_Powamp_Balloon_StartSinking                          ;A8C576;
    LSR                                                                  ;A8C579;
    BEQ +                                                                ;A8C57A;
    TAY                                                                  ;A8C57C;
    LDA.W .instListPointers,Y                                            ;A8C57D;
    STA.W Enemy[-1].instList,X                                           ;A8C580;
    LDA.W #$0001                                                         ;A8C583;
    STA.W Enemy[-1].instTimer,X                                          ;A8C586;

+   LDA.W #Function_Powamp_DeathSequence                                 ;A8C589;
    STA.W Powamp.function,X                                              ;A8C58C;
    LDA.W #$0020                                                         ;A8C58F;
    STA.W Powamp.functionTimer,X                                         ;A8C592;
    JSR.W HandlePowampBalloonYOffset                                     ;A8C595;
    RTL                                                                  ;A8C598;

  .instListPointers:
; Pointers to animation frames in inflate instruction list
    dw InstList_Powamp_Balloon_Inflate_2                                 ;A8C599;
    dw InstList_Powamp_Balloon_Inflate_1                                 ;A8C59B;
    dw InstList_Powamp_Balloon_Inflate_0                                 ;A8C59D;


;;; $C59F: Powamp function - body - death sequence ;;;
Function_Powamp_DeathSequence:
    DEC.W Powamp.functionTimer,X                                         ;A8C59F;
    BEQ .timerExpired                                                    ;A8C5A2;
    BPL .done                                                            ;A8C5A4;

  .timerExpired:
    STZ.W Enemy[-1].health,X                                             ;A8C5A6;
    LDA.W Enemy[-1].properties,X                                         ;A8C5A9;
    ORA.W #$0200                                                         ;A8C5AC;
    STA.W Enemy[-1].properties,X                                         ;A8C5AF;
    JSR.W FirePowampSpikesIn8Directions                                  ;A8C5B2;
    JSL.L EnemyDeath                                                     ;A8C5B5;
    RTL                                                                  ;A8C5B9;

  .done:
    JSR.W HandlePowampBalloonYOffset                                     ;A8C5BA;
    RTL                                                                  ;A8C5BD;


;;; $C5BE: Enemy touch - enemy $E8BF (powamp) ;;;
EnemyTouch_Powamp:
    LDX.W EnemyIndex                                                     ;A8C5BE;
    LDA.W Enemy.init1,X                                                  ;A8C5C1;
    BNE .return                                                          ;A8C5C4;
    LDA.W Enemy.palette,X                                                ;A8C5C6;
    PHA                                                                  ;A8C5C9;
    JSL.L NormalEnemyTouchAI_Internal                                    ;A8C5CA;
    LDX.W EnemyIndex                                                     ;A8C5CE;
    LDA.W Enemy.health,X                                                 ;A8C5D1;
    BEQ .dead                                                            ;A8C5D4;
    PLA                                                                  ;A8C5D6;
    RTL                                                                  ;A8C5D7;

  .dead:
    LDA.W Enemy[-1].properties,X                                         ;A8C5D8;
    ORA.W #$0200                                                         ;A8C5DB;
    STA.W Enemy[-1].properties,X                                         ;A8C5DE;
    PLA                                                                  ;A8C5E1;
    STA.W Enemy.palette,X                                                ;A8C5E2;
    JSR.W FirePowampSpikesIn8Directions                                  ;A8C5E5;
    LDA.W #$0A00                                                         ;A8C5E8;
    STA.W Enemy.palette,X                                                ;A8C5EB;

  .return:
    RTL                                                                  ;A8C5EE;


;;; $C5EF: Enemy shot - enemy $E8BF (powamp) ;;;
EnemyShot_Powamp:
    PHB                                                                  ;A8C5EF;
    LDX.W EnemyIndex                                                     ;A8C5F0;
    LDA.W Enemy.init1,X                                                  ;A8C5F3;
    BEQ .body                                                            ;A8C5F6;
    PLB                                                                  ;A8C5F8;
    RTL                                                                  ;A8C5F9;

  .body:
    JSL.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External     ;A8C5FA;
    LDA.W Enemy.AI,X                                                     ;A8C5FE;
    BIT.W #$0004                                                         ;A8C601;
    BEQ .notFrozenAI                                                     ;A8C604;
    LDA.W Enemy.freezeTimer,X                                            ;A8C606;
    STA.W Enemy[-1].freezeTimer,X                                        ;A8C609;
    LDA.W Enemy[-1].AI,X                                                 ;A8C60C;
    ORA.W #$0004                                                         ;A8C60F;
    STA.W Enemy[-1].AI,X                                                 ;A8C612;

  .notFrozenAI:
    LDA.W Enemy.AI,X                                                     ;A8C615;
    BIT.W #$0002                                                         ;A8C618;
    BEQ .notHurtAI                                                       ;A8C61B;
    LDA.W Enemy.flashTimer,X                                             ;A8C61D;
    STA.W Enemy[-1].flashTimer,X                                         ;A8C620;
    LDA.W Enemy[-1].AI,X                                                 ;A8C623;
    ORA.W #$0002                                                         ;A8C626;
    STA.W Enemy[-1].AI,X                                                 ;A8C629;

  .notHurtAI:
    LDA.W Enemy.health,X                                                 ;A8C62C;
    BNE .return                                                          ;A8C62F;
    LDA.W #Function_Powamp_FatalDamage                                   ;A8C631;
    STA.W Powamp.function,X                                              ;A8C634;
    LDA.W #$0001                                                         ;A8C637;
    STA.W Enemy.init1,X                                                  ;A8C63A;

  .return:
    PLB                                                                  ;A8C63D;
    RTL                                                                  ;A8C63E;


;;; $C63F: Power bomb reaction - enemy $E8BF (powamp) ;;;
PowerBombReaction_Powamp:
    JSL.L CommonA8_NormalEnemyPowerBombAI                                ;A8C63F;
    LDX.W EnemyIndex                                                     ;A8C643;
    LDA.W Enemy.health,X                                                 ;A8C646;
    BNE .notDead                                                         ;A8C649;
    LDA.W Enemy[-1].properties,X                                         ;A8C64B;
    ORA.W #$0200                                                         ;A8C64E;
    STA.W Enemy[-1].properties,X                                         ;A8C651;
    BRA .return                                                          ;A8C654;

  .notDead:
    LDA.W Enemy.shakeTimer,X                                             ;A8C656;
    STA.W Enemy[-1].shakeTimer,X                                         ;A8C659;
    LDA.W Enemy.invincibilityTimer,X                                     ;A8C65C;
    STA.W Enemy[-1].invincibilityTimer,X                                 ;A8C65F;
    LDA.W Enemy.flashTimer,X                                             ;A8C662;
    STA.W Enemy[-1].flashTimer,X                                         ;A8C665;
    LDA.W Enemy.freezeTimer,X                                            ;A8C668;
    STA.W Enemy[-1].freezeTimer,X                                        ;A8C66B;
    LDA.W Enemy.AI,X                                                     ;A8C66E;
    STA.W Enemy[-1].AI,X                                                 ;A8C671;

  .return:
    RTL                                                                  ;A8C674;


;;; $C675: Powamp spritemaps ;;;
Spritemap_Powamp_Body_CheeksLowered:
    dw $0001                                                             ;A8C675;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $100)

Spritemap_Powamp_Body_CheeksLifting:
    dw $0001                                                             ;A8C67C;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $102)

Spritemap_Powamp_Body_CheeksRaised:
    dw $0001                                                             ;A8C683;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $104)

Spritemap_Powamp_Balloon_Deflated:
    dw $0001                                                             ;A8C68A;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $10E)

Spritemap_Powamp_Balloon_Inflating:
    dw $0001                                                             ;A8C691;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $106)

Spritemap_Powamp_Balloon_FullyInflated:
    dw $0005                                                             ;A8C698;
    %spritemapEntry(0, $04, $04, 0, 0, 2, 0, $10D)
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 0, $10C)
    %spritemapEntry(0, $1F4, $04, 0, 0, 2, 0, $10B)
    %spritemapEntry(1, $1FC, $F4, 0, 0, 2, 0, $109)
    %spritemapEntry(1, $1F4, $F4, 0, 0, 2, 0, $108)


;;; $C6B3: Palette - enemy $E8FF/$E93F (work robot) ;;;
Palette_Robot:
    dw $3800,$57FF,$42F7,$0929,$00A5,$4F5A,$36B5,$2610                   ;A8C6B3;
    dw $1DCE,$001F,$0018,$000F,$0008,$000A,$03FF,$02B5                   ;A8C6C3;


;;; $C6D3: Instruction list - work robot deactivated - neutral ;;;
InstList_RobotNoPower_Neutral:
    dw $7FFF,Spritemap_Robot_19                                          ;A8C6D3;
    dw Common_Instruction_Sleep                                          ;A8C6D7;


;;; $C6D9: Instruction list - work robot deactivated - leaning left ;;;
InstList_RobotNoPower_LeaningLeft:
    dw $7FFF,Spritemap_Robot_18                                          ;A8C6D9;
    dw Common_Instruction_Sleep                                          ;A8C6DD;


;;; $C6DF: Instruction list - work robot deactivated - leaning right ;;;
InstList_RobotNoPower_LeaningRight:
    dw $7FFF,Spritemap_Robot_1A                                          ;A8C6DF;
    dw Common_Instruction_Sleep                                          ;A8C6E3;


;;; $C6E5: Instruction list - initial ;;;
InstList_Robot_Initial:
    dw $0020,Spritemap_Robot_1                                           ;A8C6E5;


;;; $C6E9: Instruction list - facing left - walking forwards ;;;
InstList_Robot_FacingLeft_WalkingForwards_0:
    dw $0001,Spritemap_Robot_1                                           ;A8C6E9;

InstList_Robot_FacingLeft_WalkingForwards_1:
    dw $000A,Spritemap_Robot_1                                           ;A8C6ED;
    dw $0001,Spritemap_Robot_2                                           ;A8C6F1;
    dw Instruction_Robot_TryShootingLaserLeft                            ;A8C6F5;
    dw $0009,Spritemap_Robot_2                                           ;A8C6F7;
    dw $0001,Spritemap_Robot_3                                           ;A8C6FB;
    dw Instruction_Robot_TryShootingLaserUpLeft                          ;A8C6FF;
    dw $0009,Spritemap_Robot_3                                           ;A8C701;
    dw $000A,Spritemap_Robot_4                                           ;A8C705;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8C709;
    dw Instruction_Robot_FacingLeft_MoveForward_HandleWallOrFall         ;A8C70B;
    dw $000A,Spritemap_Robot_5                                           ;A8C70D;
    dw Instruction_Robot_FacingLeft_MoveForward_HandleWallOrFall         ;A8C711;
    dw $000A,Spritemap_Robot_6                                           ;A8C713;
    dw $000A,Spritemap_Robot_7                                           ;A8C717;
    dw $000A,Spritemap_Robot_8                                           ;A8C71B;
    dw $000A,Spritemap_Robot_9                                           ;A8C71F;
    dw $000A,Spritemap_Robot_A                                           ;A8C723;
    dw Instruction_Robot_FacingLeft_MoveForward_HandleWallOrFall         ;A8C727;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8C729;
    dw $000A,Spritemap_Robot_B                                           ;A8C72B;
    dw Instruction_Robot_FacingLeft_MoveForward_HandleWallOrFall         ;A8C72F;
    dw $0001,Spritemap_Robot_0                                           ;A8C731;
    dw Instruction_Robot_TryShootingLaserDownLeft                        ;A8C735;
    dw $0009,Spritemap_Robot_0                                           ;A8C737;
    dw Common_Instruction_GotoY                                          ;A8C73B;
    dw InstList_Robot_FacingLeft_WalkingForwards_1                       ;A8C73D;


;;; $C73F: Instruction list - facing left - hit wall moving forwards ;;;
InstList_Robot_FacingLeft_HitWallMovingForwards:
    dw $0001,Spritemap_Robot_B                                           ;A8C73F;
    dw $000A,Spritemap_Robot_B                                           ;A8C743;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8C747;
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleWallOrFall        ;A8C749;
    dw $000A,Spritemap_Robot_A                                           ;A8C74B;
    dw $000A,Spritemap_Robot_9                                           ;A8C74F;
    dw $000A,Spritemap_Robot_8                                           ;A8C753;
    dw $000A,Spritemap_Robot_7                                           ;A8C757;
    dw $000A,Spritemap_Robot_6                                           ;A8C75B;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8C75F;
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleWallOrFall        ;A8C761;
    dw $000A,Spritemap_Robot_5                                           ;A8C763;
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleWallOrFall        ;A8C767;
    dw $000A,Spritemap_Robot_4                                           ;A8C769;
    dw $000A,Spritemap_Robot_3                                           ;A8C76D;
    dw $000A,Spritemap_Robot_2                                           ;A8C771;
    dw $000A,Spritemap_Robot_1                                           ;A8C775;
    dw $000A,Spritemap_Robot_0                                           ;A8C779;
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleWallOrFall        ;A8C77D;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8C77F;
    dw $000A,Spritemap_Robot_B                                           ;A8C781;
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleWallOrFall        ;A8C785;
    dw $000A,Spritemap_Robot_A                                           ;A8C787;
    dw $000A,Spritemap_Robot_9                                           ;A8C78B;
    dw $000A,Spritemap_Robot_8                                           ;A8C78F;
    dw $000A,Spritemap_Robot_7                                           ;A8C793;
    dw $000A,Spritemap_Robot_6                                           ;A8C797;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8C79B;
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleWallOrFall        ;A8C79D;
    dw $000A,Spritemap_Robot_5                                           ;A8C79F;
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleWallOrFall        ;A8C7A3;
    dw $000A,Spritemap_Robot_4                                           ;A8C7A5;
    dw $000A,Spritemap_Robot_3                                           ;A8C7A9;
    dw $000A,Spritemap_Robot_2                                           ;A8C7AD;
    dw $000A,Spritemap_Robot_1                                           ;A8C7B1;
    dw $000A,Spritemap_Robot_0                                           ;A8C7B5;
    dw Instruction_Robot_SetInstListTo_FacingRight_WalkingForwards       ;A8C7B9;


;;; $C7BB: Instruction list - facing left - shot - Samus is ahead ;;;
InstList_Robot_FacingLeft_Shot_SamusIsAhead:
    dw $0005,Spritemap_Robot_B                                           ;A8C7BB;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8C7BF;
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleHittingWall       ;A8C7C1;
    dw $0005,Spritemap_Robot_A                                           ;A8C7C3;
    dw $0005,Spritemap_Robot_9                                           ;A8C7C7;
    dw $0005,Spritemap_Robot_8                                           ;A8C7CB;
    dw $0005,Spritemap_Robot_7                                           ;A8C7CF;
    dw $0005,Spritemap_Robot_6                                           ;A8C7D3;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8C7D7;
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleHittingWall       ;A8C7D9;
    dw $0005,Spritemap_Robot_5                                           ;A8C7DB;
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleHittingWall       ;A8C7DF;
    dw $0005,Spritemap_Robot_4                                           ;A8C7E1;
    dw $0005,Spritemap_Robot_3                                           ;A8C7E5;
    dw $0005,Spritemap_Robot_2                                           ;A8C7E9;
    dw $0005,Spritemap_Robot_1                                           ;A8C7ED;
    dw $0005,Spritemap_Robot_0                                           ;A8C7F1;
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleHittingWall       ;A8C7F5;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8C7F7;
    dw $0005,Spritemap_Robot_B                                           ;A8C7F9;
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleHittingWall       ;A8C7FD;
    dw $0005,Spritemap_Robot_A                                           ;A8C7FF;
    dw $0005,Spritemap_Robot_9                                           ;A8C803;
    dw $0005,Spritemap_Robot_8                                           ;A8C807;
    dw $0005,Spritemap_Robot_7                                           ;A8C80B;
    dw $0005,Spritemap_Robot_6                                           ;A8C80F;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8C813;
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleHittingWall       ;A8C815;
    dw $0005,Spritemap_Robot_5                                           ;A8C817;
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleHittingWall       ;A8C81B;
    dw $0005,Spritemap_Robot_4                                           ;A8C81D;
    dw $0005,Spritemap_Robot_3                                           ;A8C821;
    dw $0005,Spritemap_Robot_2                                           ;A8C825;
    dw $0005,Spritemap_Robot_1                                           ;A8C829;
    dw $0005,Spritemap_Robot_0                                           ;A8C82D;
    dw Instruction_Robot_SetInstListTo_FacingRight_WalkingForwards       ;A8C831;


;;; $C833: Instruction list - facing left - shot - Samus is behind ;;;
InstList_Robot_FacingLeft_Shot_SamusIsBehind:
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8C833;
    dw Instruction_Robot_FacingLeft_MoveForward_HandleHittingWall        ;A8C835;
    dw $0005,Spritemap_Robot_1                                           ;A8C837;
    dw $0005,Spritemap_Robot_2                                           ;A8C83B;
    dw $0005,Spritemap_Robot_3                                           ;A8C83F;
    dw $0005,Spritemap_Robot_4                                           ;A8C843;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8C847;
    dw Instruction_Robot_FacingLeft_MoveForward_HandleHittingWall        ;A8C849;
    dw $0005,Spritemap_Robot_5                                           ;A8C84B;
    dw Instruction_Robot_FacingLeft_MoveForward_HandleHittingWall        ;A8C84F;
    dw $0005,Spritemap_Robot_6                                           ;A8C851;
    dw $0005,Spritemap_Robot_7                                           ;A8C855;
    dw $0005,Spritemap_Robot_8                                           ;A8C859;
    dw $0005,Spritemap_Robot_9                                           ;A8C85D;
    dw $0005,Spritemap_Robot_A                                           ;A8C861;
    dw Instruction_Robot_FacingLeft_MoveForward_HandleHittingWall        ;A8C865;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8C867;
    dw $0005,Spritemap_Robot_B                                           ;A8C869;
    dw Instruction_Robot_FacingLeft_MoveForward_HandleHittingWall        ;A8C86D;
    dw $0005,Spritemap_Robot_0                                           ;A8C86F;
    dw $0005,Spritemap_Robot_1                                           ;A8C873;
    dw $0005,Spritemap_Robot_2                                           ;A8C877;
    dw $0005,Spritemap_Robot_3                                           ;A8C87B;
    dw $0005,Spritemap_Robot_4                                           ;A8C87F;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8C883;
    dw Instruction_Robot_FacingLeft_MoveForward_HandleHittingWall        ;A8C885;
    dw $0005,Spritemap_Robot_5                                           ;A8C887;
    dw Instruction_Robot_FacingLeft_MoveForward_HandleHittingWall        ;A8C88B;
    dw $0005,Spritemap_Robot_6                                           ;A8C88D;
    dw $0005,Spritemap_Robot_7                                           ;A8C891;
    dw $0005,Spritemap_Robot_8                                           ;A8C895;
    dw $0005,Spritemap_Robot_9                                           ;A8C899;
    dw $0005,Spritemap_Robot_A                                           ;A8C89D;
    dw Instruction_Robot_FacingLeft_MoveForward_HandleHittingWall        ;A8C8A1;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8C8A3;
    dw $0005,Spritemap_Robot_B                                           ;A8C8A5;
    dw Instruction_Robot_FacingLeft_MoveForward_HandleHittingWall        ;A8C8A9;
    dw $0005,Spritemap_Robot_0                                           ;A8C8AB;
    dw Instruction_Robot_Goto_FacingLeft_WalkingForwards                 ;A8C8AF;


;;; $C8B1: Instruction list - facing left - shot laser down-left ;;;
InstList_Robot_FacingLeft_ShotLaserDownLeft:
    dw $0005,Spritemap_Robot_0                                           ;A8C8B1;
    dw $0002,Spritemap_Robot_B                                           ;A8C8B5;
    dw Common_Instruction_GotoY                                          ;A8C8B9;
    dw InstList_Robot_FacingLeft_LaserShotRecoil                         ;A8C8BB;


;;; $C8BD: Instruction list - facing left - shot laser left ;;;
InstList_Robot_FacingLeft_ShotLaserLeft:
    dw $0005,Spritemap_Robot_1                                           ;A8C8BD;
    dw $0002,Spritemap_Robot_0                                           ;A8C8C1;
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleWallOrFall        ;A8C8C5;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8C8C7;
    dw $000A,Spritemap_Robot_B                                           ;A8C8C9;
    dw Common_Instruction_GotoY                                          ;A8C8CD;
    dw InstList_Robot_FacingLeft_LaserShotRecoil                         ;A8C8CF;


;;; $C8D1: Instruction list - facing left - shot laser up-left ;;;
InstList_Robot_FacingLeft_ShotLaserUpLeft:
    dw $0005,Spritemap_Robot_3                                           ;A8C8D1;
    dw $0002,Spritemap_Robot_2                                           ;A8C8D5;
    dw $0002,Spritemap_Robot_1                                           ;A8C8D9;
    dw $0004,Spritemap_Robot_0                                           ;A8C8DD;
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleWallOrFall        ;A8C8E1;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8C8E3;
    dw $0004,Spritemap_Robot_B                                           ;A8C8E5;


;;; $C8E9: Instruction list - facing left - laser shot recoil ;;;
InstList_Robot_FacingLeft_LaserShotRecoil:
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleWallOrFall        ;A8C8E9;
    dw $0010,Spritemap_Robot_A                                           ;A8C8EB;
    dw $0005,Spritemap_Robot_9                                           ;A8C8EF;
    dw $0005,Spritemap_Robot_8                                           ;A8C8F3;
    dw $0005,Spritemap_Robot_7                                           ;A8C8F7;
    dw $0005,Spritemap_Robot_6                                           ;A8C8FB;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8C8FF;
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleWallOrFall        ;A8C901;
    dw $000A,Spritemap_Robot_5                                           ;A8C903;
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleWallOrFall        ;A8C907;
    dw $000A,Spritemap_Robot_4                                           ;A8C909;
    dw $000A,Spritemap_Robot_3                                           ;A8C90D;
    dw $0060,Spritemap_Robot_2                                           ;A8C911;
    dw Instruction_Robot_DecrementLaserCooldown                          ;A8C915;
    dw Common_Instruction_GotoY                                          ;A8C917;
    dw InstList_Robot_FacingLeft_WalkingForwards_0                       ;A8C919;


;;; $C91B: Instruction list - approaching a fall to the right ;;;
InstList_Robot_ApproachingAFallToTheRight:
    dw $0080,Spritemap_Robot_C                                           ;A8C91B;
    dw $000A,Spritemap_Robot_D                                           ;A8C91F;
    dw $000A,Spritemap_Robot_E                                           ;A8C923;
    dw Instruction_Robot_DecrementLaserCooldown                          ;A8C927;
    dw Common_Instruction_GotoY                                          ;A8C929;
    dw InstList_Robot_FacingLeft_WalkingForwards_0                       ;A8C92B;


;;; $C92D: Instruction list - facing right - walking forwards ;;;
InstList_Robot_FacingRight_WalkingForwards_0:
    dw $0001,Spritemap_Robot_C                                           ;A8C92D;

InstList_Robot_FacingRight_WalkingForwards_1:
    dw $0001,Spritemap_Robot_C                                           ;A8C931;
    dw Instruction_Robot_TryShootingLaserDownRight                       ;A8C935;
    dw $0009,Spritemap_Robot_C                                           ;A8C937;
    dw Instruction_Robot_DecrementLaserCooldown                          ;A8C93B;
    dw $000A,Spritemap_Robot_D                                           ;A8C93D;
    dw $0001,Spritemap_Robot_E                                           ;A8C941;
    dw Instruction_Robot_TryShootingLaserRight                           ;A8C945;
    dw $0009,Spritemap_Robot_E                                           ;A8C947;
    dw $0001,Spritemap_Robot_F                                           ;A8C94B;
    dw Instruction_Robot_TryShootingLaserUpRight                         ;A8C94F;
    dw $0009,Spritemap_Robot_F                                           ;A8C951;
    dw $000A,Spritemap_Robot_10                                          ;A8C955;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8C959;
    dw Instruction_Robot_FacingRight_MoveForward_HandleWallOrFall        ;A8C95B;
    dw $000A,Spritemap_Robot_11                                          ;A8C95D;
    dw Instruction_Robot_FacingRight_MoveForward_HandleWallOrFall        ;A8C961;
    dw $000A,Spritemap_Robot_12                                          ;A8C963;
    dw $000A,Spritemap_Robot_13                                          ;A8C967;
    dw $000A,Spritemap_Robot_14                                          ;A8C96B;
    dw $000A,Spritemap_Robot_15                                          ;A8C96F;
    dw $000A,Spritemap_Robot_16                                          ;A8C973;
    dw Instruction_Robot_FacingRight_MoveForward_HandleWallOrFall        ;A8C977;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8C979;
    dw $000A,Spritemap_Robot_17                                          ;A8C97B;
    dw Instruction_Robot_FacingRight_MoveForward_HandleWallOrFall        ;A8C97F;
    dw Common_Instruction_GotoY                                          ;A8C981;
    dw InstList_Robot_FacingRight_WalkingForwards_1                      ;A8C983;


;;; $C985: Instruction list - facing right - hit wall moving forwards ;;;
InstList_Robot_FacingRight_HitWallMovingForwards:
    dw $0001,Spritemap_Robot_17                                          ;A8C985;
    dw $000A,Spritemap_Robot_17                                          ;A8C989;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8C98D;
    dw Instruction_Robot_FacingRight_MoveBackward_HandleWallOrFall       ;A8C98F;
    dw $000A,Spritemap_Robot_16                                          ;A8C991;
    dw $000A,Spritemap_Robot_15                                          ;A8C995;
    dw $000A,Spritemap_Robot_14                                          ;A8C999;
    dw $000A,Spritemap_Robot_13                                          ;A8C99D;
    dw $000A,Spritemap_Robot_12                                          ;A8C9A1;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8C9A5;
    dw Instruction_Robot_FacingRight_MoveBackward_HandleWallOrFall       ;A8C9A7;
    dw $000A,Spritemap_Robot_11                                          ;A8C9A9;
    dw Instruction_Robot_FacingRight_MoveBackward_HandleWallOrFall       ;A8C9AD;
    dw $000A,Spritemap_Robot_10                                          ;A8C9AF;
    dw $000A,Spritemap_Robot_F                                           ;A8C9B3;
    dw $000A,Spritemap_Robot_E                                           ;A8C9B7;
    dw $000A,Spritemap_Robot_D                                           ;A8C9BB;
    dw $000A,Spritemap_Robot_C                                           ;A8C9BF;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8C9C3;
    dw Instruction_Robot_FacingRight_MoveBackward_HandleWallOrFall       ;A8C9C5;
    dw $000A,Spritemap_Robot_17                                          ;A8C9C7;
    dw Instruction_Robot_FacingRight_MoveBackward_HandleWallOrFall       ;A8C9CB;
    dw $000A,Spritemap_Robot_16                                          ;A8C9CD;
    dw $000A,Spritemap_Robot_15                                          ;A8C9D1;
    dw $000A,Spritemap_Robot_14                                          ;A8C9D5;
    dw $000A,Spritemap_Robot_13                                          ;A8C9D9;
    dw $000A,Spritemap_Robot_12                                          ;A8C9DD;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8C9E1;
    dw Instruction_Robot_FacingRight_MoveBackward_HandleWallOrFall       ;A8C9E3;
    dw $000A,Spritemap_Robot_11                                          ;A8C9E5;
    dw Instruction_Robot_FacingRight_MoveBackward_HandleWallOrFall       ;A8C9E9;
    dw $000A,Spritemap_Robot_10                                          ;A8C9EB;
    dw $000A,Spritemap_Robot_F                                           ;A8C9EF;
    dw $000A,Spritemap_Robot_E                                           ;A8C9F3;
    dw $000A,Spritemap_Robot_D                                           ;A8C9F7;
    dw $000A,Spritemap_Robot_C                                           ;A8C9FB;
    dw Instruction_Robot_Goto_FacingLeft_WalkingForwards                 ;A8C9FF;


;;; $CA01: Instruction list - facing right - shot - Samus is ahead ;;;
InstList_Robot_FacingRight_Shot_SamusIsAhead:
    dw $0001,Spritemap_Robot_17                                          ;A8CA01;
    dw $0005,Spritemap_Robot_17                                          ;A8CA05;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8CA09;
    dw Instruction_Robot_FacingRight_MoveBackward_HandleHittingWall      ;A8CA0B;
    dw $0005,Spritemap_Robot_16                                          ;A8CA0D;
    dw $0005,Spritemap_Robot_15                                          ;A8CA11;
    dw $0005,Spritemap_Robot_14                                          ;A8CA15;
    dw $0005,Spritemap_Robot_13                                          ;A8CA19;
    dw $0005,Spritemap_Robot_12                                          ;A8CA1D;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8CA21;
    dw Instruction_Robot_FacingRight_MoveBackward_HandleHittingWall      ;A8CA23;
    dw $0005,Spritemap_Robot_11                                          ;A8CA25;
    dw Instruction_Robot_FacingRight_MoveBackward_HandleHittingWall      ;A8CA29;
    dw $0005,Spritemap_Robot_10                                          ;A8CA2B;
    dw $0005,Spritemap_Robot_F                                           ;A8CA2F;
    dw $0005,Spritemap_Robot_E                                           ;A8CA33;
    dw $0005,Spritemap_Robot_D                                           ;A8CA37;
    dw $0005,Spritemap_Robot_C                                           ;A8CA3B;
    dw Instruction_Robot_FacingRight_MoveBackward_HandleHittingWall      ;A8CA3F;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8CA41;
    dw $0005,Spritemap_Robot_17                                          ;A8CA43;
    dw Instruction_Robot_FacingRight_MoveBackward_HandleHittingWall      ;A8CA47;
    dw $0005,Spritemap_Robot_16                                          ;A8CA49;
    dw $0005,Spritemap_Robot_15                                          ;A8CA4D;
    dw $0005,Spritemap_Robot_14                                          ;A8CA51;
    dw $0005,Spritemap_Robot_13                                          ;A8CA55;
    dw $0005,Spritemap_Robot_12                                          ;A8CA59;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8CA5D;
    dw Instruction_Robot_FacingRight_MoveBackward_HandleHittingWall      ;A8CA5F;
    dw $000A,Spritemap_Robot_11                                          ;A8CA61;
    dw Instruction_Robot_FacingRight_MoveBackward_HandleHittingWall      ;A8CA65;
    dw $0005,Spritemap_Robot_10                                          ;A8CA67;
    dw $0005,Spritemap_Robot_F                                           ;A8CA6B;
    dw $0005,Spritemap_Robot_E                                           ;A8CA6F;
    dw $0005,Spritemap_Robot_D                                           ;A8CA73;
    dw $0005,Spritemap_Robot_C                                           ;A8CA77;
    dw Instruction_Robot_Goto_FacingLeft_WalkingForwards                 ;A8CA7B;


;;; $CA7D: Instruction list - facing right - shot - Samus is behind ;;;
InstList_Robot_FacingRight_Shot_SamusIsBehind:
    dw Instruction_Robot_FacingRight_MoveForward_HandleHittingWall       ;A8CA7D;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8CA7F;
    dw $0005,Spritemap_Robot_C                                           ;A8CA81;
    dw $0005,Spritemap_Robot_D                                           ;A8CA85;
    dw $0005,Spritemap_Robot_E                                           ;A8CA89;
    dw $0005,Spritemap_Robot_F                                           ;A8CA8D;
    dw $0005,Spritemap_Robot_10                                          ;A8CA91;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8CA95;
    dw Instruction_Robot_FacingRight_MoveForward_HandleHittingWall       ;A8CA97;
    dw $0005,Spritemap_Robot_11                                          ;A8CA99;
    dw Instruction_Robot_FacingRight_MoveForward_HandleHittingWall       ;A8CA9D;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8CA9F;
    dw $0005,Spritemap_Robot_12                                          ;A8CAA1;
    dw $0005,Spritemap_Robot_13                                          ;A8CAA5;
    dw $0005,Spritemap_Robot_14                                          ;A8CAA9;
    dw $0005,Spritemap_Robot_15                                          ;A8CAAD;
    dw $0005,Spritemap_Robot_16                                          ;A8CAB1;
    dw Instruction_Robot_FacingRight_MoveForward_HandleHittingWall       ;A8CAB5;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8CAB7;
    dw $0005,Spritemap_Robot_17                                          ;A8CAB9;
    dw Instruction_Robot_FacingRight_MoveForward_HandleHittingWall       ;A8CABD;
    dw $0005,Spritemap_Robot_C                                           ;A8CABF;
    dw $0005,Spritemap_Robot_D                                           ;A8CAC3;
    dw $0005,Spritemap_Robot_E                                           ;A8CAC7;
    dw $0005,Spritemap_Robot_F                                           ;A8CACB;
    dw $0005,Spritemap_Robot_10                                          ;A8CACF;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8CAD3;
    dw Instruction_Robot_FacingRight_MoveForward_HandleHittingWall       ;A8CAD5;
    dw $0005,Spritemap_Robot_11                                          ;A8CAD7;
    dw Instruction_Robot_FacingRight_MoveForward_HandleHittingWall       ;A8CADB;
    dw $0005,Spritemap_Robot_12                                          ;A8CADD;
    dw $0005,Spritemap_Robot_13                                          ;A8CAE1;
    dw $0005,Spritemap_Robot_14                                          ;A8CAE5;
    dw $0005,Spritemap_Robot_15                                          ;A8CAE9;
    dw $0005,Spritemap_Robot_16                                          ;A8CAED;
    dw Instruction_Robot_FacingRight_MoveForward_HandleHittingWall       ;A8CAF1;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8CAF3;
    dw $0005,Spritemap_Robot_17                                          ;A8CAF5;
    dw Instruction_Robot_FacingRight_MoveForward_HandleHittingWall       ;A8CAF9;
    dw Instruction_Robot_SetInstListTo_FacingRight_WalkingForwards       ;A8CAFB;


;;; $CAFD: Instruction list - facing right - shot laser down-right ;;;
InstList_Robot_FacingRight_ShotLaserDownRight:
    dw $0005,Spritemap_Robot_C                                           ;A8CAFD;
    dw $0002,Spritemap_Robot_17                                          ;A8CB01;
    dw Common_Instruction_GotoY                                          ;A8CB05;
    dw InstList_Robot_FacingRight_LaserShotRecoil                        ;A8CB07;


;;; $CB09: Instruction list - facing right - shot laser right ;;;
InstList_Robot_FacingRight_ShotLaserRight:
    dw $0005,Spritemap_Robot_D                                           ;A8CB09;
    dw $0002,Spritemap_Robot_C                                           ;A8CB0D;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8CB11;
    dw Instruction_Robot_FacingRight_MoveBackward_HandleWallOrFall       ;A8CB13;
    dw $000A,Spritemap_Robot_17                                          ;A8CB15;
    dw Common_Instruction_GotoY                                          ;A8CB19;
    dw InstList_Robot_FacingRight_LaserShotRecoil                        ;A8CB1B;


;;; $CB1D: Instruction list - facing right - shot laser up-right ;;;
InstList_Robot_FacingRight_ShotLaserUpRight:
    dw $0005,Spritemap_Robot_F                                           ;A8CB1D;
    dw $0002,Spritemap_Robot_E                                           ;A8CB21;
    dw $0002,Spritemap_Robot_D                                           ;A8CB25;
    dw $0004,Spritemap_Robot_C                                           ;A8CB29;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8CB2D;
    dw Instruction_Robot_FacingRight_MoveBackward_HandleWallOrFall       ;A8CB2F;
    dw $0004,Spritemap_Robot_17                                          ;A8CB31;


;;; $CB35: Instruction list - facing right - laser shot recoil ;;;
InstList_Robot_FacingRight_LaserShotRecoil:
    dw Instruction_Robot_FacingRight_MoveBackward_HandleWallOrFall       ;A8CB35;
    dw $0010,Spritemap_Robot_16                                          ;A8CB37;
    dw $0005,Spritemap_Robot_15                                          ;A8CB3B;
    dw $0005,Spritemap_Robot_14                                          ;A8CB3F;
    dw $0005,Spritemap_Robot_13                                          ;A8CB43;
    dw $0005,Spritemap_Robot_12                                          ;A8CB47;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8CB4B;
    dw Instruction_Robot_FacingRight_MoveBackward_HandleWallOrFall       ;A8CB4D;
    dw $000A,Spritemap_Robot_11                                          ;A8CB4F;
    dw Instruction_Robot_FacingRight_MoveBackward_HandleWallOrFall       ;A8CB53;
    dw $000A,Spritemap_Robot_10                                          ;A8CB55;
    dw $000A,Spritemap_Robot_F                                           ;A8CB59;
    dw $0060,Spritemap_Robot_E                                           ;A8CB5D;
    dw Common_Instruction_GotoY                                          ;A8CB61;
    dw InstList_Robot_FacingRight_WalkingForwards_0                      ;A8CB63;


;;; $CB65: Instruction list - approaching a fall to the left ;;;
InstList_Robot_ApproachingAFallToTheLeft:
    dw $0080,Spritemap_Robot_0                                           ;A8CB65;
    dw $000A,Spritemap_Robot_1                                           ;A8CB69;
    dw $000A,Spritemap_Robot_2                                           ;A8CB6D;
    dw Instruction_Robot_DecrementLaserCooldown                          ;A8CB71;
    dw Common_Instruction_GotoY                                          ;A8CB73;
    dw InstList_Robot_FacingRight_WalkingForwards_0                      ;A8CB75;


;;; $CB77: Initialisation AI - enemy $E8FF (work robot) ;;;
InitAI_Robot:
    LDX.W AreaIndex                                                      ;A8CB77;
    LDA.L SRAMMirror_Boss,X                                              ;A8CB7A;
    BIT.W #$0001                                                         ;A8CB7E;
    BEQ InitAI_RobotNoPower                                              ;A8CB81;
    LDX.W EnemyIndex                                                     ;A8CB83;
    SEP #$20                                                             ;A8CB86;
    LDA.B #EnemyGraphicsDrawnHook_Robot_PeriodicallyCyclePalettes>>16    ;A8CB88;
    STA.W EnemyGraphicsDrawnHook+2                                       ;A8CB8A;
    REP #$20                                                             ;A8CB8D;
    LDA.W #EnemyGraphicsDrawnHook_Robot_PeriodicallyCyclePalettes        ;A8CB8F;
    STA.W EnemyGraphicsDrawnHook                                         ;A8CB92;
    LDA.W Enemy.properties,X                                             ;A8CB95;
    ORA.W #$A000                                                         ;A8CB98;
    STA.W Enemy.properties,X                                             ;A8CB9B;
    LDA.W #$0004                                                         ;A8CB9E;
    STA.W Enemy.instTimer,X                                              ;A8CBA1;
    STZ.W Enemy.loopCounter,X                                            ;A8CBA4;
    LDA.W #InstList_Robot_Initial                                        ;A8CBA7;
    STA.W Enemy.instList,X                                               ;A8CBAA;
    LDA.W #$FE00                                                         ;A8CBAD;
    STA.W Robot.laserXVelocity,X                                         ;A8CBB0;
    LDA.W #$0001                                                         ;A8CBB3;
    STA.L RobotPaletteAnimationTimer                                     ;A8CBB6;
    LDA.W #$0000                                                         ;A8CBBA;
    STA.L RobotPaletteAnimationTableIndex                                ;A8CBBD;
    STA.W Robot.laserCooldown,X                                          ;A8CBC1;
    LDA.W Enemy.palette,X                                                ;A8CBC4;
    STA.L RobotPaletteAnimationPaletteIndex                              ;A8CBC7;
    RTL                                                                  ;A8CBCB;


;;; $CBCC: Initialisation AI - enemy $E93F (work robot deactivated) ;;;
InitAI_RobotNoPower:
; The color writes at $A8:CC1C have no effect for multiple reasons:
;     It writes to the active palette RAM instead of the target palette RAM, so room fade in immediately overwrites any changes
;     $7E:D652 is 0 until an *activated* robot gets initialised, so this effectively hardcodes the palette index to 0, but the robots never use palette 0
;     Even if there was an activated robot loaded at some point in some previous room, that robot's palette index would be unrelated to the current room's one
;     It wouldn't have any effect if there was an activated robot in the same room either, due to the active palette animation
;     In the pre-Phantoon hall, they use the roach's palette, so it has yellow eyes in that room(!)
    LDX.W EnemyIndex                                                     ;A8CBCC;
    LDA.W Enemy.init0,X                                                  ;A8CBCF;
    CMP.W #$0000                                                         ;A8CBD2;
    BMI .zeroParam1                                                      ;A8CBD5;
    CMP.W #$0004                                                         ;A8CBD7;
    BMI .valid                                                           ;A8CBDA;

  .zeroParam1:
    LDA.W #$0000                                                         ;A8CBDC;

  .valid:
    STA.W Enemy.init0,X                                                  ;A8CBDF;
    ASL                                                                  ;A8CBE2;
    TAY                                                                  ;A8CBE3;
    LDA.W .pointers,Y                                                    ;A8CBE4;
    STA.W Enemy.instList,X                                               ;A8CBE7;
    LDA.W Enemy.properties,X                                             ;A8CBEA;
    ORA.W #$8000                                                         ;A8CBED;
    STA.W Enemy.properties,X                                             ;A8CBF0;
    LDA.W #$0001                                                         ;A8CBF3;
    STA.W Enemy.instTimer,X                                              ;A8CBF6;
    STZ.W Enemy.loopCounter,X                                            ;A8CBF9;
    LDA.W #$0000                                                         ;A8CBFC;
    STA.L RobotPaletteAnimationTimer                                     ;A8CBFF;
    LDA.W #$0000                                                         ;A8CC03;
    STA.W Robot.YSubVelocity,X                                           ;A8CC06;
    LDA.W #$0001                                                         ;A8CC09;
    STA.W Robot.YVelocity,X                                              ;A8CC0C;
    LDA.L RobotPaletteAnimationPaletteIndex                              ;A8CC0F;
    AND.W #$FF00                                                         ;A8CC13;
    XBA                                                                  ;A8CC16;
    ASL                                                                  ;A8CC17;
    ASL                                                                  ;A8CC18;
    ASL                                                                  ;A8CC19;
    ASL                                                                  ;A8CC1A;
    TAX                                                                  ;A8CC1B;
    LDA.W #$000A                                                         ;A8CC1C;
    STA.L Palettes_SpriteP0+$12,X                                        ;A8CC1F;
    STA.L Palettes_SpriteP0+$14,X                                        ;A8CC23;
    STA.L Palettes_SpriteP0+$16,X                                        ;A8CC27;
    STA.L Palettes_SpriteP0+$18,X                                        ;A8CC2B;
    RTL                                                                  ;A8CC2F;

  .pointers:
; Instruction list pointers. Indexed by [enemy parameter 1] * 2
    dw InstList_RobotNoPower_Neutral                                     ;A8CC30;
    dw InstList_RobotNoPower_LeaningLeft                                 ;A8CC32;
    dw InstList_RobotNoPower_LeaningRight                                ;A8CC34;


;;; $CC36: Main AI - enemy $E8FF (work robot) ;;;
MainAI_Robot:
    LDX.W EnemyIndex                                                     ;A8CC36;
    LDA.W Robot.YSubVelocity,X                                           ;A8CC39;
    STA.B DP_Temp12                                                      ;A8CC3C;
    LDA.W Robot.YVelocity,X                                              ;A8CC3E;
    STA.B DP_Temp14                                                      ;A8CC41;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8CC43;
    BCS RTL_A8CC66                                                       ;A8CC47;
    LDX.W EnemyIndex                                                     ;A8CC49;
    LDA.W Enemy.instTimer,X                                              ;A8CC4C;
    INC                                                                  ;A8CC4F;
    STA.W Enemy.instTimer,X                                              ;A8CC50;
    LDA.W Robot.YSubVelocity,X                                           ;A8CC53;
    CLC                                                                  ;A8CC56;
    ADC.W #$8000                                                         ;A8CC57;
    STA.W Robot.YSubVelocity,X                                           ;A8CC5A;
    LDA.W Robot.YVelocity,X                                              ;A8CC5D;
    ADC.W #$0000                                                         ;A8CC60;
    STA.W Robot.YVelocity,X                                              ;A8CC63; fallthrough to MainAI_RobotNoPower


;;; $CC66: RTL. Main AI - enemy $E93F (work robot deactivated) ;;;
RTL_A8CC66:
    RTL                                                                  ;A8CC66;


;;; $CC67: Enemy graphics drawn hook - work robot - periodically cycle between palettes ;;;
EnemyGraphicsDrawnHook_Robot_PeriodicallyCyclePalettes:
    LDA.W DoorTransitionFlagEnemiesPause                                 ;A8CC67;
    BNE .return                                                          ;A8CC6A;
    LDA.L RobotPaletteAnimationTimer                                     ;A8CC6C;
    BEQ .return                                                          ;A8CC70;
    DEC                                                                  ;A8CC72;
    STA.L RobotPaletteAnimationTimer                                     ;A8CC73;
    BNE .return                                                          ;A8CC77;
    PHX                                                                  ;A8CC79;
    LDA.L RobotPaletteAnimationPaletteIndex                              ;A8CC7A;
    AND.W #$FF00                                                         ;A8CC7E;
    XBA                                                                  ;A8CC81;
    ASL                                                                  ;A8CC82;
    ASL                                                                  ;A8CC83;
    ASL                                                                  ;A8CC84;
    ASL                                                                  ;A8CC85;
    TAX                                                                  ;A8CC86;
    LDA.L RobotPaletteAnimationTableIndex                                ;A8CC87;
    TAY                                                                  ;A8CC8B;

  .again:
    LDA.W .paletteColor9,Y                                               ;A8CC8C;
    BMI .zero                                                            ;A8CC8F;
    STA.L Palettes_SpriteP0+$12,X                                        ;A8CC91;
    LDA.W .paletteColorA,Y                                               ;A8CC95;
    STA.L Palettes_SpriteP0+$14,X                                        ;A8CC98;
    LDA.W .paletteColorB,Y                                               ;A8CC9C;
    STA.L Palettes_SpriteP0+$16,X                                        ;A8CC9F;
    LDA.W .paletteColorC,Y                                               ;A8CCA3;
    STA.L Palettes_SpriteP0+$18,X                                        ;A8CCA6;
    LDA.W .timer,Y                                                       ;A8CCAA;
    STA.L RobotPaletteAnimationTimer                                     ;A8CCAD;
    TYA                                                                  ;A8CCB1;
    CLC                                                                  ;A8CCB2;
    ADC.W #$000A                                                         ;A8CCB3;
    STA.L RobotPaletteAnimationTableIndex                                ;A8CCB6;
    PLX                                                                  ;A8CCBA;

  .return:
    RTL                                                                  ;A8CCBB;

  .zero:
    LDY.W #$0000                                                         ;A8CCBC;
    BRA .again                                                           ;A8CCBF;

; Robot palette animation table
;        ____________________________ Palette colours 9..Ch. Negative = terminator
;       |                         ___ Timer
;       |                        |
  .paletteColor9:
    dw $001F                                                             ;A8CCC1;
  .paletteColorA:
    dw       $0018                                                       ;A8CCC3;
  .paletteColorB:
    dw             $000F                                                 ;A8CCC5;
  .paletteColorC:
    dw                   $0008                                           ;A8CCC7;
  .timer:
    dw                          $0040                                    ;A8CCC9;
    dw $0018,$000F,$0008,$001F, $0010
    dw $000F,$0008,$001F,$0018, $0010
    dw $0008,$001F,$0018,$000F, $0040
    dw $000F,$0008,$001F,$0018, $0010
    dw $0018,$000F,$0008,$001F, $0010
    dw $FFFF


;;; $CCFF: Decrement enemy laser cooldown ;;;
DecrementRobotLaserCooldown:
    LDA.W Robot.laserCooldown,X                                          ;A8CCFF;
    BEQ .return                                                          ;A8CD02;
    DEC                                                                  ;A8CD04;
    STA.W Robot.laserCooldown,X                                          ;A8CD05;

  .return:
    RTS                                                                  ;A8CD08;


;;; $CD09: Instruction - facing left - move forwards, go to $C73F if hit wall, go to $CB65 if approaching a fall ;;;
Instruction_Robot_FacingLeft_MoveForward_HandleWallOrFall:
    PHX                                                                  ;A8CD09;
    PHY                                                                  ;A8CD0A;
    LDX.W EnemyIndex                                                     ;A8CD0B;
    JSR.W DecrementRobotLaserCooldown                                    ;A8CD0E;
    LDA.W #$FE00                                                         ;A8CD11;
    STA.W Robot.laserXVelocity,X                                         ;A8CD14;
    LDA.W #$0000                                                         ;A8CD17;
    STA.B DP_Temp12                                                      ;A8CD1A;
    LDA.W #$FFFC                                                         ;A8CD1C;
    STA.B DP_Temp14                                                      ;A8CD1F;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A8CD21;
    BCC .notCollidedWithWall                                             ;A8CD25;
    LDA.W Robot.laserCooldown,X                                          ;A8CD27;
    CLC                                                                  ;A8CD2A;
    ADC.W #$0008                                                         ;A8CD2B;
    STA.W Robot.laserCooldown,X                                          ;A8CD2E;
    PLY                                                                  ;A8CD31;
    LDY.W #InstList_Robot_FacingLeft_HitWallMovingForwards               ;A8CD32;
    PLX                                                                  ;A8CD35;
    RTL                                                                  ;A8CD36;

  .notCollidedWithWall:
    JSL.L CheckIfEnemyIsTouchingSamusFromBelow                           ;A8CD37;
    AND.W #$FFFF                                                         ;A8CD3B;
    BEQ .notTouchingSamusFromBelow                                       ;A8CD3E;
    LDA.W #$0000                                                         ;A8CD40;
    STA.W ExtraSamusXSubDisplacement                                     ;A8CD43;
    LDA.W #$FFFC                                                         ;A8CD46;
    STA.W ExtraSamusXDisplacement                                        ;A8CD49;

  .notTouchingSamusFromBelow:
    LDA.W Enemy.YPosition,X                                              ;A8CD4C;
    STA.W Enemy.var3,X                                                   ;A8CD4F;
    LDA.W Enemy.XPosition,X                                              ;A8CD52;
    STA.W Robot.backupXPosition,X                                        ;A8CD55;
    SEC                                                                  ;A8CD58;
    SBC.W Enemy.XHitboxRadius,X                                          ;A8CD59;
    SEC                                                                  ;A8CD5C;
    SBC.W Enemy.XHitboxRadius,X                                          ;A8CD5D;
    STA.W Enemy.XPosition,X                                              ;A8CD60;
    STZ.B DP_Temp12                                                      ;A8CD63;
    LDA.W #$0001                                                         ;A8CD65;
    STA.B DP_Temp14                                                      ;A8CD68;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8CD6A;
    BCS .collidedWithBlock                                               ;A8CD6E;
    LDA.W Robot.laserCooldown,X                                          ;A8CD70;
    CLC                                                                  ;A8CD73;
    ADC.W #$0008                                                         ;A8CD74;
    STA.W Robot.laserCooldown,X                                          ;A8CD77;
    LDA.W Robot.backupXPosition,X                                        ;A8CD7A;
    STA.W Enemy.XPosition,X                                              ;A8CD7D;
    LDA.W Enemy.var3,X                                                   ;A8CD80;
    STA.W Enemy.YPosition,X                                              ;A8CD83;
    PLY                                                                  ;A8CD86;
    LDX.W EnemyIndex                                                     ;A8CD87;
    LDA.W #$0200                                                         ;A8CD8A;
    STA.W Robot.laserXVelocity,X                                         ;A8CD8D;
    LDY.W #InstList_Robot_ApproachingAFallToTheLeft                      ;A8CD90;
    PLX                                                                  ;A8CD93;
    RTL                                                                  ;A8CD94;

  .collidedWithBlock:
    LDA.W Robot.backupXPosition,X                                        ;A8CD95;
    STA.W Enemy.XPosition,X                                              ;A8CD98;
    LDA.W Enemy.var3,X                                                   ;A8CD9B;
    STA.W Enemy.YPosition,X                                              ;A8CD9E;
    PLY                                                                  ;A8CDA1;
    PLX                                                                  ;A8CDA2;
    RTL                                                                  ;A8CDA3;


;;; $CDA4: Instruction - facing left - move forwards, go to $C73F if hit wall ;;;
Instruction_Robot_FacingLeft_MoveForward_HandleHittingWall:
    PHX                                                                  ;A8CDA4;
    PHY                                                                  ;A8CDA5;
    LDX.W EnemyIndex                                                     ;A8CDA6;
    JSR.W DecrementRobotLaserCooldown                                    ;A8CDA9;
    LDA.W #$FE00                                                         ;A8CDAC;
    STA.W Robot.laserXVelocity,X                                         ;A8CDAF;
    LDA.W #$0000                                                         ;A8CDB2;
    STA.B DP_Temp12                                                      ;A8CDB5;
    LDA.W #$FFFC                                                         ;A8CDB7;
    STA.B DP_Temp14                                                      ;A8CDBA;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A8CDBC;
    BCC .notCollidedWtihWall                                             ;A8CDC0;
    LDA.W Robot.laserCooldown,X                                          ;A8CDC2;
    CLC                                                                  ;A8CDC5;
    ADC.W #$0008                                                         ;A8CDC6;
    STA.W Robot.laserCooldown,X                                          ;A8CDC9;
    PLY                                                                  ;A8CDCC;
    LDY.W #InstList_Robot_FacingLeft_HitWallMovingForwards               ;A8CDCD;
    PLX                                                                  ;A8CDD0;
    RTL                                                                  ;A8CDD1;

  .notCollidedWtihWall:
    JSL.L CheckIfEnemyIsTouchingSamusFromBelow                           ;A8CDD2;
    AND.W #$FFFF                                                         ;A8CDD6;
    BEQ .return                                                          ;A8CDD9;
    LDA.W #$0000                                                         ;A8CDDB;
    STA.W ExtraSamusXSubDisplacement                                     ;A8CDDE;
    LDA.W #$FFFC                                                         ;A8CDE1;
    STA.W ExtraSamusXDisplacement                                        ;A8CDE4;

  .return:
    PLY                                                                  ;A8CDE7;
    PLX                                                                  ;A8CDE8;
    RTL                                                                  ;A8CDE9;


;;; $CDEA: Instruction - facing left - move backwards, go to $C6E9 if hit wall, go to $C91B if approaching a fall ;;;
Instruction_Robot_FacingLeft_MoveBackward_HandleWallOrFall:
    PHX                                                                  ;A8CDEA;
    PHY                                                                  ;A8CDEB;
    LDX.W EnemyIndex                                                     ;A8CDEC;
    JSR.W DecrementRobotLaserCooldown                                    ;A8CDEF;
    LDA.W #$FE00                                                         ;A8CDF2;
    STA.W Robot.laserXVelocity,X                                         ;A8CDF5;
    LDA.W #$0000                                                         ;A8CDF8;
    STA.B DP_Temp12                                                      ;A8CDFB;
    LDA.W #$0004                                                         ;A8CDFD;
    STA.B DP_Temp14                                                      ;A8CE00;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A8CE02;
    BCC .notCollidedWithWall                                             ;A8CE06;
    LDA.W Robot.laserCooldown,X                                          ;A8CE08;
    CLC                                                                  ;A8CE0B;
    ADC.W #$0008                                                         ;A8CE0C;
    STA.W Robot.laserCooldown,X                                          ;A8CE0F;
    PLY                                                                  ;A8CE12;
    LDY.W #InstList_Robot_FacingLeft_WalkingForwards_0                   ;A8CE13;
    PLX                                                                  ;A8CE16;
    RTL                                                                  ;A8CE17;

  .notCollidedWithWall:
    JSL.L CheckIfEnemyIsTouchingSamusFromBelow                           ;A8CE18;
    AND.W #$FFFF                                                         ;A8CE1C;
    BEQ .notTouchingSamusFromBelow                                       ;A8CE1F;
    LDA.W #$0000                                                         ;A8CE21;
    STA.W ExtraSamusXSubDisplacement                                     ;A8CE24;
    LDA.W #$0004                                                         ;A8CE27;
    STA.W ExtraSamusXDisplacement                                        ;A8CE2A;

  .notTouchingSamusFromBelow:
    LDA.W Enemy.YPosition,X                                              ;A8CE2D;
    STA.W Enemy.var3,X                                                   ;A8CE30;
    LDA.W Enemy.XPosition,X                                              ;A8CE33;
    STA.W Robot.backupXPosition,X                                        ;A8CE36;
    CLC                                                                  ;A8CE39;
    ADC.W Enemy.XHitboxRadius,X                                          ;A8CE3A;
    CLC                                                                  ;A8CE3D;
    ADC.W Enemy.XHitboxRadius,X                                          ;A8CE3E;
    STA.W Enemy.XPosition,X                                              ;A8CE41;
    STZ.B DP_Temp12                                                      ;A8CE44;
    LDA.W #$0001                                                         ;A8CE46;
    STA.B DP_Temp14                                                      ;A8CE49;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8CE4B;
    BCS .collidedWithBlock                                               ;A8CE4F;
    LDA.W Robot.laserCooldown,X                                          ;A8CE51;
    CLC                                                                  ;A8CE54;
    ADC.W #$0008                                                         ;A8CE55;
    STA.W Robot.laserCooldown,X                                          ;A8CE58;
    LDA.W Robot.backupXPosition,X                                        ;A8CE5B;
    STA.W Enemy.XPosition,X                                              ;A8CE5E;
    LDA.W Enemy.var3,X                                                   ;A8CE61;
    STA.W Enemy.YPosition,X                                              ;A8CE64;
    PLY                                                                  ;A8CE67;
    LDX.W EnemyIndex                                                     ;A8CE68;
    LDA.W #$FE00                                                         ;A8CE6B;
    STA.W Robot.laserXVelocity,X                                         ;A8CE6E;
    LDY.W #InstList_Robot_ApproachingAFallToTheRight                     ;A8CE71;
    PLX                                                                  ;A8CE74;
    RTL                                                                  ;A8CE75;

  .collidedWithBlock:
    LDA.W Robot.backupXPosition,X                                        ;A8CE76;
    STA.W Enemy.XPosition,X                                              ;A8CE79;
    LDA.W Enemy.var3,X                                                   ;A8CE7C;
    STA.W Enemy.YPosition,X                                              ;A8CE7F;
    PLY                                                                  ;A8CE82;
    PLX                                                                  ;A8CE83;
    RTL                                                                  ;A8CE84;


;;; $CE85: Instruction - facing left - move backwards, go to $C6E9 if hit wall ;;;
Instruction_Robot_FacingLeft_MoveBackward_HandleHittingWall:
    PHX                                                                  ;A8CE85;
    PHY                                                                  ;A8CE86;
    LDX.W EnemyIndex                                                     ;A8CE87;
    JSR.W DecrementRobotLaserCooldown                                    ;A8CE8A;
    LDA.W #$FE00                                                         ;A8CE8D;
    STA.W Robot.laserXVelocity,X                                         ;A8CE90;
    LDA.W #$0000                                                         ;A8CE93;
    STA.B DP_Temp12                                                      ;A8CE96;
    LDA.W #$0004                                                         ;A8CE98;
    STA.B DP_Temp14                                                      ;A8CE9B;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A8CE9D;
    BCC .notCollidedWithWall                                             ;A8CEA1;
    LDA.W Robot.laserCooldown,X                                          ;A8CEA3;
    CLC                                                                  ;A8CEA6;
    ADC.W #$0008                                                         ;A8CEA7;
    STA.W Robot.laserCooldown,X                                          ;A8CEAA;
    PLY                                                                  ;A8CEAD;
    LDY.W #InstList_Robot_FacingLeft_WalkingForwards_0                   ;A8CEAE;
    PLX                                                                  ;A8CEB1;
    RTL                                                                  ;A8CEB2;

  .notCollidedWithWall:
    JSL.L CheckIfEnemyIsTouchingSamusFromBelow                           ;A8CEB3;
    AND.W #$FFFF                                                         ;A8CEB7;
    BEQ .return                                                          ;A8CEBA;
    LDA.W #$0000                                                         ;A8CEBC;
    STA.W ExtraSamusXSubDisplacement                                     ;A8CEBF;
    LDA.W #$0004                                                         ;A8CEC2;
    STA.W ExtraSamusXDisplacement                                        ;A8CEC5;

  .return:
    PLY                                                                  ;A8CEC8;
    PLX                                                                  ;A8CEC9;
    RTL                                                                  ;A8CECA;


;;; $CECB: Instruction - go to InstList_Robot_FacingRight_WalkingForwards_0 ;;;
Instruction_Robot_SetInstListTo_FacingRight_WalkingForwards:
    LDY.W #InstList_Robot_FacingRight_WalkingForwards_0                  ;A8CECB;
    RTL                                                                  ;A8CECE;


;;; $CECF: Instruction - facing right - move forwards, go to $C985 if hit wall, go to $C91B if approaching a fall ;;;
Instruction_Robot_FacingRight_MoveForward_HandleWallOrFall:
    PHX                                                                  ;A8CECF;
    PHY                                                                  ;A8CED0;
    LDX.W EnemyIndex                                                     ;A8CED1;
    JSR.W DecrementRobotLaserCooldown                                    ;A8CED4;
    LDA.W #$0200                                                         ;A8CED7;
    STA.W Robot.laserXVelocity,X                                         ;A8CEDA;
    LDA.W #$0000                                                         ;A8CEDD;
    STA.B DP_Temp12                                                      ;A8CEE0;
    LDA.W #$0004                                                         ;A8CEE2;
    STA.B DP_Temp14                                                      ;A8CEE5;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A8CEE7;
    BCC .notCollidedWithWall                                             ;A8CEEB;
    LDA.W Robot.laserCooldown,X                                          ;A8CEED;
    CLC                                                                  ;A8CEF0;
    ADC.W #$0008                                                         ;A8CEF1;
    STA.W Robot.laserCooldown,X                                          ;A8CEF4;
    PLY                                                                  ;A8CEF7;
    LDY.W #InstList_Robot_FacingRight_HitWallMovingForwards              ;A8CEF8;
    PLX                                                                  ;A8CEFB;
    RTL                                                                  ;A8CEFC;

  .notCollidedWithWall:
    JSL.L CheckIfEnemyIsTouchingSamusFromBelow                           ;A8CEFD;
    AND.W #$FFFF                                                         ;A8CF01;
    BEQ .notTouchingSamusFromBelow                                       ;A8CF04;
    LDA.W #$0000                                                         ;A8CF06;
    STA.W ExtraSamusXSubDisplacement                                     ;A8CF09;
    LDA.W #$0004                                                         ;A8CF0C;
    STA.W ExtraSamusXDisplacement                                        ;A8CF0F;

  .notTouchingSamusFromBelow:
    LDA.W Enemy.YPosition,X                                              ;A8CF12;
    STA.W Enemy.var3,X                                                   ;A8CF15;
    LDA.W Enemy.XPosition,X                                              ;A8CF18;
    STA.W Robot.backupXPosition,X                                        ;A8CF1B;
    CLC                                                                  ;A8CF1E;
    ADC.W Enemy.XHitboxRadius,X                                          ;A8CF1F;
    CLC                                                                  ;A8CF22;
    ADC.W Enemy.XHitboxRadius,X                                          ;A8CF23;
    STA.W Enemy.XPosition,X                                              ;A8CF26;
    STZ.B DP_Temp12                                                      ;A8CF29;
    LDA.W #$0001                                                         ;A8CF2B;
    STA.B DP_Temp14                                                      ;A8CF2E;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8CF30;
    BCS .collidedWithBlock                                               ;A8CF34;
    LDA.W Robot.laserCooldown,X                                          ;A8CF36;
    CLC                                                                  ;A8CF39;
    ADC.W #$0008                                                         ;A8CF3A;
    STA.W Robot.laserCooldown,X                                          ;A8CF3D;
    LDA.W Robot.backupXPosition,X                                        ;A8CF40;
    STA.W Enemy.XPosition,X                                              ;A8CF43;
    LDA.W Enemy.var3,X                                                   ;A8CF46;
    STA.W Enemy.YPosition,X                                              ;A8CF49;
    PLY                                                                  ;A8CF4C;
    LDX.W EnemyIndex                                                     ;A8CF4D;
    LDA.W #$FE00                                                         ;A8CF50;
    STA.W Robot.laserXVelocity,X                                         ;A8CF53;
    LDY.W #InstList_Robot_ApproachingAFallToTheRight                     ;A8CF56;
    PLX                                                                  ;A8CF59;
    RTL                                                                  ;A8CF5A;

  .collidedWithBlock:
    LDA.W Robot.backupXPosition,X                                        ;A8CF5B;
    STA.W Enemy.XPosition,X                                              ;A8CF5E;
    LDA.W Enemy.var3,X                                                   ;A8CF61;
    STA.W Enemy.YPosition,X                                              ;A8CF64;
    PLY                                                                  ;A8CF67;
    PLX                                                                  ;A8CF68;
    RTL                                                                  ;A8CF69;


;;; $CF6A: Instruction - facing right - move forwards, go to $C985 if hit wall ;;;
Instruction_Robot_FacingRight_MoveForward_HandleHittingWall:
    PHX                                                                  ;A8CF6A;
    PHY                                                                  ;A8CF6B;
    LDX.W EnemyIndex                                                     ;A8CF6C;
    JSR.W DecrementRobotLaserCooldown                                    ;A8CF6F;
    LDA.W #$0200                                                         ;A8CF72;
    STA.W Robot.laserXVelocity,X                                         ;A8CF75;
    LDA.W #$0000                                                         ;A8CF78;
    STA.B DP_Temp12                                                      ;A8CF7B;
    LDA.W #$0004                                                         ;A8CF7D;
    STA.B DP_Temp14                                                      ;A8CF80;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A8CF82;
    BCC .notCollidedWithWall                                             ;A8CF86;
    LDA.W Robot.laserCooldown,X                                          ;A8CF88;
    CLC                                                                  ;A8CF8B;
    ADC.W #$0008                                                         ;A8CF8C;
    STA.W Robot.laserCooldown,X                                          ;A8CF8F;
    PLY                                                                  ;A8CF92;
    LDY.W #InstList_Robot_FacingRight_HitWallMovingForwards              ;A8CF93;
    PLX                                                                  ;A8CF96;
    RTL                                                                  ;A8CF97;

  .notCollidedWithWall:
    JSL.L CheckIfEnemyIsTouchingSamusFromBelow                           ;A8CF98;
    AND.W #$FFFF                                                         ;A8CF9C;
    BEQ .return                                                          ;A8CF9F;
    LDA.W #$0000                                                         ;A8CFA1;
    STA.W ExtraSamusXSubDisplacement                                     ;A8CFA4;
    LDA.W #$0004                                                         ;A8CFA7;
    STA.W ExtraSamusXDisplacement                                        ;A8CFAA;

  .return:
    PLY                                                                  ;A8CFAD;
    PLX                                                                  ;A8CFAE;
    RTL                                                                  ;A8CFAF;


;;; $CFB0: Instruction - facing right - move backwards, go to $C6E9 if hit wall, go to $CB65 if approaching a fall ;;;
Instruction_Robot_FacingRight_MoveBackward_HandleWallOrFall:
    PHX                                                                  ;A8CFB0;
    PHY                                                                  ;A8CFB1;
    LDX.W EnemyIndex                                                     ;A8CFB2;
    JSR.W DecrementRobotLaserCooldown                                    ;A8CFB5;
    LDA.W #$0200                                                         ;A8CFB8;
    STA.W Robot.laserXVelocity,X                                         ;A8CFBB;
    LDA.W #$0000                                                         ;A8CFBE;
    STA.B DP_Temp12                                                      ;A8CFC1;
    LDA.W #$FFFC                                                         ;A8CFC3;
    STA.B DP_Temp14                                                      ;A8CFC6;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A8CFC8;
    BCC .notCollidedWithWall                                             ;A8CFCC;
    LDA.W Robot.laserCooldown,X                                          ;A8CFCE;
    CLC                                                                  ;A8CFD1;
    ADC.W #$0008                                                         ;A8CFD2;
    STA.W Robot.laserCooldown,X                                          ;A8CFD5;
    PLY                                                                  ;A8CFD8;
    LDY.W #InstList_Robot_FacingLeft_WalkingForwards_0                   ;A8CFD9;
    PLX                                                                  ;A8CFDC;
    RTL                                                                  ;A8CFDD;

  .notCollidedWithWall:
    JSL.L CheckIfEnemyIsTouchingSamusFromBelow                           ;A8CFDE;
    AND.W #$FFFF                                                         ;A8CFE2;
    BEQ .notTouchingSamusFromBelow                                       ;A8CFE5;
    LDA.W #$0000                                                         ;A8CFE7;
    STA.W ExtraSamusXSubDisplacement                                     ;A8CFEA;
    LDA.W #$FFFC                                                         ;A8CFED;
    STA.W ExtraSamusXDisplacement                                        ;A8CFF0;

  .notTouchingSamusFromBelow:
    LDA.W Enemy.YPosition,X                                              ;A8CFF3;
    STA.W Enemy.var3,X                                                   ;A8CFF6;
    LDA.W Enemy.XPosition,X                                              ;A8CFF9;
    STA.W Robot.backupXPosition,X                                        ;A8CFFC;
    SEC                                                                  ;A8CFFF;
    SBC.W Enemy.XHitboxRadius,X                                          ;A8D000;
    SEC                                                                  ;A8D003;
    SBC.W Enemy.XHitboxRadius,X                                          ;A8D004;
    STA.W Enemy.XPosition,X                                              ;A8D007;
    STZ.B DP_Temp12                                                      ;A8D00A;
    LDA.W #$0001                                                         ;A8D00C;
    STA.B DP_Temp14                                                      ;A8D00F;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8D011;
    BCS .collidedWithBlock                                               ;A8D015;
    LDA.W Robot.laserCooldown,X                                          ;A8D017;
    CLC                                                                  ;A8D01A;
    ADC.W #$0008                                                         ;A8D01B;
    STA.W Robot.laserCooldown,X                                          ;A8D01E;
    LDA.W Enemy.var3,X                                                   ;A8D021;
    STA.W Enemy.YPosition,X                                              ;A8D024;
    LDA.W Robot.backupXPosition,X                                        ;A8D027;
    STA.W Enemy.XPosition,X                                              ;A8D02A;
    PLY                                                                  ;A8D02D;
    LDX.W EnemyIndex                                                     ;A8D02E;
    LDA.W #$0200                                                         ;A8D031;
    STA.W Robot.laserXVelocity,X                                         ;A8D034;
    LDY.W #InstList_Robot_ApproachingAFallToTheLeft                      ;A8D037;
    PLX                                                                  ;A8D03A;
    RTL                                                                  ;A8D03B;

  .collidedWithBlock:
    LDA.W Enemy.var3,X                                                   ;A8D03C;
    STA.W Enemy.YPosition,X                                              ;A8D03F;
    LDA.W Robot.backupXPosition,X                                        ;A8D042;
    STA.W Enemy.XPosition,X                                              ;A8D045;
    PLY                                                                  ;A8D048;
    PLX                                                                  ;A8D049;
    RTL                                                                  ;A8D04A;


;;; $D04B: Instruction - facing right - move backwards, go to $C6E9 if hit wall ;;;
Instruction_Robot_FacingRight_MoveBackward_HandleHittingWall:
    PHX                                                                  ;A8D04B;
    PHY                                                                  ;A8D04C;
    LDX.W EnemyIndex                                                     ;A8D04D;
    JSR.W DecrementRobotLaserCooldown                                    ;A8D050;
    LDA.W #$0200                                                         ;A8D053;
    STA.W Robot.laserXVelocity,X                                         ;A8D056;
    LDA.W #$0000                                                         ;A8D059;
    STA.B DP_Temp12                                                      ;A8D05C;
    LDA.W #$FFFC                                                         ;A8D05E;
    STA.B DP_Temp14                                                      ;A8D061;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A8D063;
    BCC .notCollidedWithWall                                             ;A8D067;
    LDA.W Robot.laserCooldown,X                                          ;A8D069;
    CLC                                                                  ;A8D06C;
    ADC.W #$0008                                                         ;A8D06D;
    STA.W Robot.laserCooldown,X                                          ;A8D070;
    PLY                                                                  ;A8D073;
    LDY.W #InstList_Robot_FacingLeft_WalkingForwards_0                   ;A8D074;
    PLX                                                                  ;A8D077;
    RTL                                                                  ;A8D078;

  .notCollidedWithWall:
    JSL.L CheckIfEnemyIsTouchingSamusFromBelow                           ;A8D079;
    AND.W #$FFFF                                                         ;A8D07D;
    BEQ .return                                                          ;A8D080;
    LDA.W #$0000                                                         ;A8D082;
    STA.W ExtraSamusXSubDisplacement                                     ;A8D085;
    LDA.W #$FFFC                                                         ;A8D088;
    STA.W ExtraSamusXDisplacement                                        ;A8D08B;

  .return:
    PLY                                                                  ;A8D08E;
    PLX                                                                  ;A8D08F;
    RTL                                                                  ;A8D090;


;;; $D091: Instruction - queue work robot sound effect if on screen ;;;
Instruction_Robot_PlaySFXIfOnScreen:
    PHX                                                                  ;A8D091;
    PHY                                                                  ;A8D092;
    LDX.W EnemyIndex                                                     ;A8D093;
    LDA.W Layer1XPosition                                                ;A8D096;
    CMP.W Enemy.XPosition,X                                              ;A8D099;
    BPL .return                                                          ;A8D09C;
    CLC                                                                  ;A8D09E;
    ADC.W #$0100                                                         ;A8D09F;
    CMP.W Enemy.XPosition,X                                              ;A8D0A2;
    BMI .return                                                          ;A8D0A5;
    LDA.W Layer1YPosition                                                ;A8D0A7;
    CMP.W Enemy.YPosition,X                                              ;A8D0AA;
    BPL .return                                                          ;A8D0AD;
    CLC                                                                  ;A8D0AF;
    ADC.W #$00E0                                                         ;A8D0B0;
    CMP.W Enemy.YPosition,X                                              ;A8D0B3;
    BMI .return                                                          ;A8D0B6;
    LDA.W #$0068                                                         ;A8D0B8;
    JSL.L QueueSound_Lib2_Max6                                           ;A8D0BB;

  .return:
    PLY                                                                  ;A8D0BF;
    PLX                                                                  ;A8D0C0;
    RTL                                                                  ;A8D0C1;


;;; $D0C2: Instruction - go to InstList_Robot_FacingLeft_WalkingForwards_0 ;;;
Instruction_Robot_Goto_FacingLeft_WalkingForwards:
    LDY.W #InstList_Robot_FacingLeft_WalkingForwards_0                   ;A8D0C2;
    RTL                                                                  ;A8D0C5;


;;; $D0C6: Instruction - try shooting laser up-right and go to $CB1D if so ;;;
Instruction_Robot_TryShootingLaserUpRight:
    LDA.W #InstList_Robot_FacingRight_ShotLaserUpRight                   ;A8D0C6;
    STA.B DP_Temp32                                                      ;A8D0C9;
    LDA.W #EnemyProjectile_RobotLaser_UpRight                            ;A8D0CB;
    STA.B DP_Temp30                                                      ;A8D0CE;
    BRA HandleFiringLaser_Upwards                                        ;A8D0D0;


;;; $D0D2: Instruction - try shooting laser up-left and go to $C8D1 if so ;;;
Instruction_Robot_TryShootingLaserUpLeft:
    LDA.W #InstList_Robot_FacingLeft_ShotLaserUpLeft                     ;A8D0D2;
    STA.B DP_Temp32                                                      ;A8D0D5;
    LDA.W #EnemyProjectile_RobotLaser_UpLeft                             ;A8D0D7;
    STA.B DP_Temp30                                                      ;A8D0DA; fallthrough to HandleFiringLaser_Upwards


;;; $D0DC: Handle firing laser - upwards ;;;
HandleFiringLaser_Upwards:
    LDA.W Robot.laserCooldown,X                                          ;A8D0DC;
    BNE .timerNotExpired                                                 ;A8D0DF;
    LDA.W RandomNumberSeed                                               ;A8D0E1;
    AND.W #$001F                                                         ;A8D0E4;
    CLC                                                                  ;A8D0E7;
    ADC.W #$0010                                                         ;A8D0E8;
    STA.W Robot.laserCooldown,X                                          ;A8D0EB;
    PHX                                                                  ;A8D0EE;
    LDY.B DP_Temp30                                                      ;A8D0EF;
    LDX.W EnemyIndex                                                     ;A8D0F1;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A8D0F4;
    PLX                                                                  ;A8D0F8;
    LDY.B DP_Temp32                                                      ;A8D0F9;
    RTL                                                                  ;A8D0FB;

  .timerNotExpired:
    JSR.W DecrementRobotLaserCooldown                                    ;A8D0FC;
    RTL                                                                  ;A8D0FF;


;;; $D100: Instruction - try shooting laser horizontally and go to $CB09 if so ;;;
Instruction_Robot_TryShootingLaserRight:
    LDA.W #InstList_Robot_FacingRight_ShotLaserRight                     ;A8D100;
    STA.B DP_Temp32                                                      ;A8D103;
    BRA HandleFiringLaser_Horizontal                                     ;A8D105;


;;; $D107: Instruction - try shooting laser horizontally and go to $C8BD if so ;;;
Instruction_Robot_TryShootingLaserLeft:
    LDA.W #InstList_Robot_FacingLeft_ShotLaserLeft                       ;A8D107;
    STA.B DP_Temp32                                                      ;A8D10A; fallthrough to HandleFiringLaser_Horizontal


;;; $D10C: Handle firing laser - horizontal ;;;
HandleFiringLaser_Horizontal:
    LDA.W Robot.laserCooldown,X                                          ;A8D10C;
    BNE .timerNotExpired                                                 ;A8D10F;
    LDA.W RandomNumberSeed                                               ;A8D111;
    AND.W #$001F                                                         ;A8D114;
    CLC                                                                  ;A8D117;
    ADC.W #$0010                                                         ;A8D118;
    STA.W Robot.laserCooldown,X                                          ;A8D11B;
    PHX                                                                  ;A8D11E;
    LDY.W #EnemyProjectile_RobotLaser_Horizontal                         ;A8D11F;
    LDX.W EnemyIndex                                                     ;A8D122;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A8D125;
    PLX                                                                  ;A8D129;
    LDY.B DP_Temp32                                                      ;A8D12A;
    RTL                                                                  ;A8D12C;

  .timerNotExpired:
    JSR.W DecrementRobotLaserCooldown                                    ;A8D12D;
    RTL                                                                  ;A8D130;


;;; $D131: Instruction - try shooting laser down-right and go to $CAFD if so ;;;
Instruction_Robot_TryShootingLaserDownRight:
    LDA.W #EnemyProjectile_RobotLaser_DownRight                          ;A8D131;
    STA.B DP_Temp30                                                      ;A8D134;
    LDA.W #InstList_Robot_FacingRight_ShotLaserDownRight                 ;A8D136;
    STA.B DP_Temp32                                                      ;A8D139;
    BRA HandleFiringLaser_Downwards                                      ;A8D13B;


;;; $D13D: Instruction - try shooting laser down-left and go to $C8B1 if so ;;;
Instruction_Robot_TryShootingLaserDownLeft:
    LDA.W #EnemyProjectile_RobotLaser_DownLeft                           ;A8D13D;
    STA.B DP_Temp30                                                      ;A8D140;
    LDA.W #InstList_Robot_FacingLeft_ShotLaserDownLeft                   ;A8D142;
    STA.B DP_Temp32                                                      ;A8D145; fallthrough to HandleFiringLaser_Downwards


;;; $D147: Handle firing laser - downwards ;;;
HandleFiringLaser_Downwards:
    LDA.W Robot.laserCooldown,X                                          ;A8D147;
    BNE .timerNotExpired                                                 ;A8D14A;
    LDA.W RandomNumberSeed                                               ;A8D14C;
    AND.W #$001F                                                         ;A8D14F;
    CLC                                                                  ;A8D152;
    ADC.W #$0010                                                         ;A8D153;
    STA.W Robot.laserCooldown,X                                          ;A8D156;
    PHX                                                                  ;A8D159;
    LDY.B DP_Temp30                                                      ;A8D15A;
    LDX.W EnemyIndex                                                     ;A8D15C;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A8D15F;
    LDY.B DP_Temp32                                                      ;A8D163;
    PLX                                                                  ;A8D165;
    RTL                                                                  ;A8D166;

  .timerNotExpired:
    JSR.W DecrementRobotLaserCooldown                                    ;A8D167;
    RTL                                                                  ;A8D16A;


;;; $D16B: Instruction - decrement enemy laser cooldown ;;;
Instruction_Robot_DecrementLaserCooldown:
    PHX                                                                  ;A8D16B;
    LDX.W EnemyIndex                                                     ;A8D16C;
    JSR.W DecrementRobotLaserCooldown                                    ;A8D16F;
    PLX                                                                  ;A8D172;
    RTL                                                                  ;A8D173;


;;; $D174: Enemy touch - enemy $E8FF/$E93F (work robot) ;;;
EnemyTouch_Robot:
    LDX.W EnemyIndex                                                     ;A8D174;
    LDA.W Enemy.XPosition,X                                              ;A8D177;
    CMP.W SamusXPosition                                                 ;A8D17A;
    BMI .rightOfSamus                                                    ;A8D17D;
    LDA.W #$FFFC                                                         ;A8D17F;
    STA.W ExtraSamusXDisplacement                                        ;A8D182;
    RTL                                                                  ;A8D185;

  .rightOfSamus:
    LDA.W #$0004                                                         ;A8D186;
    STA.W ExtraSamusXDisplacement                                        ;A8D189;
    RTL                                                                  ;A8D18C;


;;; $D18D: Enemy shot - enemy $E93F (work robot deactivated) ;;;
EnemyShot_RobotNoPower:
    JSL.L NormalEnemyShotAI_Internal                                     ;A8D18D;
    RTL                                                                  ;A8D191;


;;; $D192: Enemy shot - enemy $E8FF (work robot) ;;;
EnemyShot_Robot:
    REP #$30                                                             ;A8D192;
    PHX                                                                  ;A8D194;
    PHY                                                                  ;A8D195;
    LDX.W AreaIndex                                                      ;A8D196;
    LDA.L SRAMMirror_Boss,X                                              ;A8D199;
    BIT.W #$0001                                                         ;A8D19D;
    BEQ .return                                                          ;A8D1A0;
    LDX.W EnemyIndex                                                     ;A8D1A2;
    JSL.L NormalEnemyShotAI_Internal                                     ;A8D1A5;
    LDX.W EnemyIndex                                                     ;A8D1A9;
    LDA.W Enemy.health,X                                                 ;A8D1AC;
    BEQ .return                                                          ;A8D1AF;
    LDA.W Robot.laserXVelocity,X                                         ;A8D1B1;
    BMI .facingLeft                                                      ;A8D1B4;
    LDA.W SamusXPosition                                                 ;A8D1B6;
    CMP.W Enemy.XPosition,X                                              ;A8D1B9;
    BMI .facingRight_behind                                              ;A8D1BC;
    LDA.W #InstList_Robot_FacingRight_Shot_SamusIsAhead                  ;A8D1BE;
    BRA .merge                                                           ;A8D1C1;

  .facingRight_behind:
    LDA.W #InstList_Robot_FacingRight_Shot_SamusIsBehind                 ;A8D1C3;
    BRA .merge                                                           ;A8D1C6;

  .return:
    PLY                                                                  ;A8D1C8;
    PLX                                                                  ;A8D1C9;
    RTL                                                                  ;A8D1CA;

  .facingLeft:
    LDA.W SamusXPosition                                                 ;A8D1CB;
    CMP.W Enemy.XPosition,X                                              ;A8D1CE;
    BPL .facingLeft_behind                                               ;A8D1D1;
    LDA.W #InstList_Robot_FacingLeft_Shot_SamusIsAhead                   ;A8D1D3;

  .merge:
    STA.W Enemy.instList,X                                               ;A8D1D6;
    LDA.W #$0001                                                         ;A8D1D9;
    STA.W Enemy.instTimer,X                                              ;A8D1DC;
    LDA.W Robot.laserCooldown,X                                          ;A8D1DF;
    CLC                                                                  ;A8D1E2;
    ADC.W #$0040                                                         ;A8D1E3;
    STA.W Robot.laserCooldown,X                                          ;A8D1E6;
    PLY                                                                  ;A8D1E9;
    PLX                                                                  ;A8D1EA;
    RTL                                                                  ;A8D1EB;

  .facingLeft_behind:
    LDA.W #InstList_Robot_FacingLeft_Shot_SamusIsBehind                  ;A8D1EC;
    BRA .merge                                                           ;A8D1EF;


;;; $D1F1: Work robot spritemaps ;;;
Spritemap_Robot_0:
    dw $000C                                                             ;A8D1F1;
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
    dw $000C                                                             ;A8D22F;
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
    dw $000C                                                             ;A8D26D;
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
    dw $000C                                                             ;A8D2AB;
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
    dw $000C                                                             ;A8D2E9;
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
    dw $000C                                                             ;A8D327;
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
    dw $000C                                                             ;A8D365;
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
    dw $000C                                                             ;A8D3A3;
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
    dw $000C                                                             ;A8D3E1;
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
    dw $000C                                                             ;A8D41F;
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
    dw $000C                                                             ;A8D45D;
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
    dw $000C                                                             ;A8D49B;
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
    dw $000C                                                             ;A8D4D9;
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
    dw $000C                                                             ;A8D517;
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
    dw $000C                                                             ;A8D555;
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
    dw $000C                                                             ;A8D593;
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
    dw $000C                                                             ;A8D5D1;
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
    dw $000C                                                             ;A8D60F;
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
    dw $000C                                                             ;A8D64D;
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
    dw $000C                                                             ;A8D68B;
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
    dw $000C                                                             ;A8D6C9;
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
    dw $000C                                                             ;A8D707;
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
    dw $000C                                                             ;A8D745;
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
    dw $000C                                                             ;A8D783;
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
    dw $0006                                                             ;A8D7C1;
    %spritemapEntry(1, $00, $01, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F0, $01, 0, 0, 2, 0, $12C)
    %spritemapEntry(1, $00, $F1, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1F0, $F1, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $00, $E1, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F0, $E1, 0, 0, 2, 0, $100)

Spritemap_Robot_19:
    dw $0006                                                             ;A8D7E1;
    %spritemapEntry(1, $00, $01, 0, 0, 2, 0, $146)
    %spritemapEntry(1, $1F0, $01, 0, 0, 2, 0, $144)
    %spritemapEntry(1, $00, $F1, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1F0, $F1, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $00, $E1, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1F0, $E1, 0, 0, 2, 0, $104)

Spritemap_Robot_1A:
    dw $0006                                                             ;A8D801;
    %spritemapEntry(1, $00, $01, 0, 0, 2, 0, $142)
    %spritemapEntry(1, $1F0, $01, 0, 0, 2, 0, $140)
    %spritemapEntry(1, $00, $F1, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $1F0, $F1, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $00, $E1, 0, 0, 2, 0, $10A)
    %spritemapEntry(1, $1F0, $E1, 0, 0, 2, 0, $108)


;;; $D821: Palette - enemy $E97F (bull) ;;;
Palette_Bull:
    dw $3800,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166                   ;A8D821;
    dw $0924,$435A,$3694,$15AD,$0508,$03FF,$0237,$00D1                   ;A8D831;


;;; $D841: Instruction list - normal ;;;
InstList_Bull_Normal:
    dw $000A,Spritemap_Bull_0                                            ;A8D841;
    dw $000A,Spritemap_Bull_1                                            ;A8D845;
    dw $000A,Spritemap_Bull_0                                            ;A8D849;
    dw $000A,Spritemap_Bull_2                                            ;A8D84D;
    dw Common_Instruction_GotoY                                          ;A8D851;
    dw InstList_Bull_Normal                                              ;A8D853;


;;; $D855: Instruction list - shot ;;;
InstList_Bull_Shot_0:
    dw Common_Instruction_TimerInY,$0005                                 ;A8D855;

InstList_Bull_Shot_1:
    dw $0003,Spritemap_Bull_0                                            ;A8D859;
    dw $0003,Spritemap_Bull_1                                            ;A8D85D;
    dw $0003,Spritemap_Bull_0                                            ;A8D861;
    dw $0003,Spritemap_Bull_2                                            ;A8D865;
    dw Common_Instruction_DecrementTimer_GotoYIfNonZero_duplicate        ;A8D869;
    dw InstList_Bull_Shot_1                                              ;A8D86B;
    dw Common_Instruction_GotoY                                          ;A8D86D;
    dw InstList_Bull_Normal                                              ;A8D86F;


;;; $D871: Bull constants ;;;
BullConstants:
  .AngleToMove:
; Angle to move when shot by non-damaging projectile
  ..upFacingRight:
    dw $00C0                                                             ;A8D871;
  ..upRight:
    dw $00E0                                                             ;A8D873;
  ..right:
    dw $0000                                                             ;A8D875;
  ..downRight:
    dw $0020                                                             ;A8D877;
  ..downFacingRight:
    dw $0040                                                             ;A8D879;
  ..downFacingLeft:
    dw $0040                                                             ;A8D87B;
  ..downLeft:
    dw $0060                                                             ;A8D87D;
  ..left:
    dw $0080                                                             ;A8D87F;
  ..upLeft:
    dw $00A0                                                             ;A8D881;
  ..upFacingLeft:
    dw $00C0                                                             ;A8D883;

  .MaxSpeeds:
; Max speeds. Indexed by [enemy parameter 2] * 2
    dw $03FF,$04FF,$05FF,$06FF,$07FF,$08FF,$09FF,$0AFF                   ;A8D885;


;;; $D895: Bull acceleration interval table ;;;
BullAccelerationIntervalTable:
; Indexed by [enemy parameter 1] * 4
;        _________ Acceleration interval timer reset value
;       |      ___ Deceleration interval timer reset value
;       |     |
  .accel:
    dw $0003                                                             ;A8D895;
  .decel:
    dw       $0001                                                       ;A8D897;
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
    LDX.W EnemyIndex                                                     ;A8D8C9;
    LDA.W #$0001                                                         ;A8D8CC;
    STA.W Enemy.instTimer,X                                              ;A8D8CF;
    STZ.W Enemy.loopCounter,X                                            ;A8D8D2;
    LDA.W #InstList_Bull_Normal                                          ;A8D8D5;
    STA.W Enemy.instList,X                                               ;A8D8D8;
    LDA.W Enemy.init0,X                                                  ;A8D8DB;
    ASL                                                                  ;A8D8DE;
    ASL                                                                  ;A8D8DF;
    TAY                                                                  ;A8D8E0;
    LDA.W BullAccelerationIntervalTable_accel,Y                          ;A8D8E1;
    STA.L Bull.accelerationIntervalTimerResetValue,X                     ;A8D8E4;
    STA.W Bull.accelerationIntervalTimer,X                               ;A8D8E8;
    LDA.W BullAccelerationIntervalTable_decel,Y                          ;A8D8EB;
    STA.L Bull.decelerationIntervalTimerResetValue,X                     ;A8D8EE;
    LDA.W #$0010                                                         ;A8D8F2;
    STA.W Bull.activationTimer,X                                         ;A8D8F5;
    LDA.W #Function_Bull_MovementDelay                                   ;A8D8F8;
    STA.W Bull.function,X                                                ;A8D8FB;
    LDA.W Enemy.init1,X                                                  ;A8D8FE;
    ASL                                                                  ;A8D901;
    TAY                                                                  ;A8D902;
    LDA.W BullConstants_MaxSpeeds,Y                                      ;A8D903;
    STA.L Bull.maxSpeed,X                                                ;A8D906;
    RTL                                                                  ;A8D90A;


;;; $D90B: Main AI - enemy $E97F (bull) ;;;
MainAI_Bull:
    LDX.W EnemyIndex                                                     ;A8D90B;
    LDA.L Bull.shotReactionDisableTimer,X                                ;A8D90E;
    DEC                                                                  ;A8D912;
    STA.L Bull.shotReactionDisableTimer,X                                ;A8D913;
    BNE .function                                                        ;A8D917;
    LDA.W #$0001                                                         ;A8D919;
    STA.L Bull.shotReactionDisableTimer,X                                ;A8D91C;
    LDA.W #$0000                                                         ;A8D920;
    STA.L Bull.shotReactionDisableFlag,X                                 ;A8D923;

  .function:
    JSR.W (Bull.function,X)                                              ;A8D927;
    RTL                                                                  ;A8D92A;


;;; $D92B: Bull function - movement delay ;;;
Function_Bull_MovementDelay:
    LDX.W EnemyIndex                                                     ;A8D92B;
    DEC.W Bull.activationTimer,X                                         ;A8D92E;
    BNE .return                                                          ;A8D931;
    LDA.W #$0010                                                         ;A8D933;
    STA.W Bull.activationTimer,X                                         ;A8D936;
    LDA.W #Function_Bull_TargetSamus                                     ;A8D939;
    STA.W Bull.function,X                                                ;A8D93C;

  .return:
    RTS                                                                  ;A8D93F;


;;; $D940: Bull function - target Samus ;;;
Function_Bull_TargetSamus:
    LDX.W EnemyIndex                                                     ;A8D940;
    JSL.L CalculateAngleOfSamusFromEnemy                                 ;A8D943;
    SEC                                                                  ;A8D947;
    SBC.W #$0040                                                         ;A8D948;
    AND.W #$00FF                                                         ;A8D94B;
    STA.L Bull.angleToSamus,X                                            ;A8D94E;
    STA.L Bull.angle,X                                                   ;A8D952;
    LDA.W #Function_Bull_Accelerating                                    ;A8D956;
    STA.W Bull.function,X                                                ;A8D959;
    LDA.W #$0018                                                         ;A8D95C;
    STA.W Bull.accelerationDelta,X                                       ;A8D95F;
    RTS                                                                  ;A8D962;


;;; $D963: Bull function - accelerating ;;;
Function_Bull_Accelerating:
    LDX.W EnemyIndex                                                     ;A8D963;
    LDA.W Bull.speed,X                                                   ;A8D966;
    CMP.L Bull.maxSpeed,X                                                ;A8D969;
    BPL .maxSpeed                                                        ;A8D96D;
    JSR.W AccelerateBull                                                 ;A8D96F;

  .maxSpeed:
    JSR.W BullXMovement                                                  ;A8D972;
    JSR.W BullYMovement                                                  ;A8D975;
    JSR.W TriggerBullDecelerationIfTooFarOffTarget                       ;A8D978;
    RTS                                                                  ;A8D97B;


;;; $D97C: Bull function - decelerating ;;;
Function_Bull_Decelerating:
    LDX.W EnemyIndex                                                     ;A8D97C;
    LDA.W Bull.speed,X                                                   ;A8D97F;
    BEQ .stopped                                                         ;A8D982;
    BMI .stopped                                                         ;A8D984;
    LDA.W Bull.acceleration,X                                            ;A8D986;
    BEQ .stopped                                                         ;A8D989;
    BPL .decelerate                                                      ;A8D98B;

  .stopped:
    LDA.W #Function_Bull_MovementDelay                                   ;A8D98D;
    STA.W Bull.function,X                                                ;A8D990;
    LDA.W #$0000                                                         ;A8D993;
    STA.W Bull.acceleration,X                                            ;A8D996;
    STA.W Bull.accelerationDelta,X                                       ;A8D999;
    STA.W Bull.speed,X                                                   ;A8D99C;
    RTS                                                                  ;A8D99F;

  .decelerate:
    JSR.W BullXMovement                                                  ;A8D9A0;
    JSR.W BullYMovement                                                  ;A8D9A3;
    JSR.W DecelerateBull                                                 ;A8D9A6;
    RTS                                                                  ;A8D9A9;


;;; $D9AA: Trigger bull deceleration if too far off target ;;;
TriggerBullDecelerationIfTooFarOffTarget:
    LDX.W EnemyIndex                                                     ;A8D9AA;
    JSL.L CalculateAngleOfSamusFromEnemy                                 ;A8D9AD;
    SEC                                                                  ;A8D9B1;
    SBC.W #$0040                                                         ;A8D9B2;
    AND.W #$00FF                                                         ;A8D9B5;
    STA.L Bull.angleToSamus,X                                            ;A8D9B8;
    SEC                                                                  ;A8D9BC;
    SBC.L Bull.angle,X                                                   ;A8D9BD;
    JSL.L Sign_Extend_A                                                  ;A8D9C1;
    JSL.L NegateA_A0B067                                                 ;A8D9C5;
    CMP.W #$0030                                                         ;A8D9C9;
    BMI .return                                                          ;A8D9CC;
    LDA.W #Function_Bull_Decelerating                                    ;A8D9CE;
    STA.W Bull.function,X                                                ;A8D9D1;
    LDA.W #$0018                                                         ;A8D9D4;
    STA.W Bull.accelerationDelta,X                                       ;A8D9D7;

  .return:
    RTS                                                                  ;A8D9DA;


;;; $D9DB: Bull X movement ;;;
BullXMovement:
    LDX.W EnemyIndex                                                     ;A8D9DB;
    STZ.B DP_Temp1A                                                      ;A8D9DE;
    LDA.L Bull.angle,X                                                   ;A8D9E0;
    PHX                                                                  ;A8D9E4;
    CLC                                                                  ;A8D9E5;
    ADC.W #$0040                                                         ;A8D9E6;
    AND.W #$00FF                                                         ;A8D9E9;
    ASL                                                                  ;A8D9EC;
    TAX                                                                  ;A8D9ED;
    LDA.L SineCosineTables_16bitSine,X                                   ;A8D9EE;
    STA.B DP_Temp12                                                      ;A8D9F2;
    PLX                                                                  ;A8D9F4;
    LDA.B DP_Temp12                                                      ;A8D9F5;
    BPL .positive                                                        ;A8D9F7;
    INC.B DP_Temp1A                                                      ;A8D9F9;

  .positive:
    LDA.B DP_Temp12                                                      ;A8D9FB;
    JSL.L NegateA_A0B067                                                 ;A8D9FD;
    AND.W #$FF00                                                         ;A8DA01;
    XBA                                                                  ;A8DA04;
    STA.B DP_Temp16                                                      ;A8DA05;
    LDA.W Bull.speed,X                                                   ;A8DA07;
    STA.B DP_Temp18                                                      ;A8DA0A;
    JSR.W Math_24Bit_UnsignedMultiplication_A8DAB3                       ;A8DA0C;
    LDA.B DP_Temp1A                                                      ;A8DA0F;
    BEQ .notLeft                                                         ;A8DA11;
    JSR.W Negate_1E_1C_A8DAF6                                            ;A8DA13;

  .notLeft:
    CLC                                                                  ;A8DA16;
    LDA.W Enemy.XSubPosition,X                                           ;A8DA17;
    ADC.B DP_Temp1C                                                      ;A8DA1A;
    STA.W Enemy.XSubPosition,X                                           ;A8DA1C;
    LDA.W Enemy.XPosition,X                                              ;A8DA1F;
    ADC.B DP_Temp1E                                                      ;A8DA22;
    STA.W Enemy.XPosition,X                                              ;A8DA24;
    RTS                                                                  ;A8DA27;


;;; $DA28: Bull Y movement ;;;
BullYMovement:
    LDX.W EnemyIndex                                                     ;A8DA28;
    STZ.B DP_Temp1A                                                      ;A8DA2B;
    LDA.L Bull.angle,X                                                   ;A8DA2D;
    PHX                                                                  ;A8DA31;
    AND.W #$00FF                                                         ;A8DA32;
    ASL                                                                  ;A8DA35;
    TAX                                                                  ;A8DA36;
    LDA.L SineCosineTables_16bitSine,X                                   ;A8DA37;
    STA.B DP_Temp12                                                      ;A8DA3B;
    PLX                                                                  ;A8DA3D;
    LDA.B DP_Temp12                                                      ;A8DA3E;
    BPL .positive                                                        ;A8DA40;
    INC.B DP_Temp1A                                                      ;A8DA42;

  .positive:
    LDA.B DP_Temp12                                                      ;A8DA44;
    JSL.L NegateA_A0B067                                                 ;A8DA46;
    AND.W #$FF00                                                         ;A8DA4A;
    XBA                                                                  ;A8DA4D;
    STA.B DP_Temp16                                                      ;A8DA4E;
    LDA.W Bull.speed,X                                                   ;A8DA50;
    STA.B DP_Temp18                                                      ;A8DA53;
    JSR.W Math_24Bit_UnsignedMultiplication_A8DAB3                       ;A8DA55;
    LDA.B DP_Temp1A                                                      ;A8DA58;
    BEQ .notUp                                                           ;A8DA5A;
    JSR.W Negate_1E_1C_A8DAF6                                            ;A8DA5C;

  .notUp:
    CLC                                                                  ;A8DA5F;
    LDA.W Enemy.YSubPosition,X                                           ;A8DA60;
    ADC.B DP_Temp1C                                                      ;A8DA63;
    STA.W Enemy.YSubPosition,X                                           ;A8DA65;
    LDA.W Enemy.YPosition,X                                              ;A8DA68;
    ADC.B DP_Temp1E                                                      ;A8DA6B;
    STA.W Enemy.YPosition,X                                              ;A8DA6D;
    RTS                                                                  ;A8DA70;


;;; $DA71: Accelerate bull ;;;
AccelerateBull:
    DEC.W Bull.accelerationIntervalTimer,X                               ;A8DA71;
    BNE .return                                                          ;A8DA74;
    LDA.L Bull.accelerationIntervalTimerResetValue,X                     ;A8DA76;
    STA.W Bull.accelerationIntervalTimer,X                               ;A8DA7A;
    LDA.W Bull.acceleration,X                                            ;A8DA7D;
    CLC                                                                  ;A8DA80;
    ADC.W Bull.accelerationDelta,X                                       ;A8DA81;
    STA.W Bull.acceleration,X                                            ;A8DA84;
    LDA.W Bull.speed,X                                                   ;A8DA87;
    CLC                                                                  ;A8DA8A;
    ADC.W Bull.acceleration,X                                            ;A8DA8B;
    STA.W Bull.speed,X                                                   ;A8DA8E;

  .return:
    RTS                                                                  ;A8DA91;


;;; $DA92: Decelerate bull ;;;
DecelerateBull:
    DEC.W Bull.accelerationIntervalTimer,X                               ;A8DA92;
    BNE .return                                                          ;A8DA95;
    LDA.L Bull.decelerationIntervalTimerResetValue,X                     ;A8DA97;
    STA.W Bull.accelerationIntervalTimer,X                               ;A8DA9B;
    LDA.W Bull.acceleration,X                                            ;A8DA9E;
    SEC                                                                  ;A8DAA1;
    SBC.W Bull.accelerationDelta,X                                       ;A8DAA2;
    STA.W Bull.acceleration,X                                            ;A8DAA5;
    LDA.W Bull.speed,X                                                   ;A8DAA8;
    SEC                                                                  ;A8DAAB;
    SBC.W Bull.acceleration,X                                            ;A8DAAC;
    STA.W Bull.speed,X                                                   ;A8DAAF;

  .return:
    RTS                                                                  ;A8DAB2;


;;; $DAB3: $1E.$1C = [$16] * [$18] / 10000h (24-bit unsigned multiplication) ;;;
Math_24Bit_UnsignedMultiplication_A8DAB3:
; Let:
;     $16 = a
;     $18 = b + c * 100h
    PHP                                                                  ;A8DAB3;
    SEP #$20                                                             ;A8DAB4;
    LDA.B DP_Temp16                                                      ;A8DAB6;
    STA.W $4202                                                          ;A8DAB8;
    LDA.B DP_Temp18                                                      ;A8DABB;
    STA.W $4203                                                          ;A8DABD;
    NOP                                                                  ;A8DAC0;
    NOP                                                                  ;A8DAC1;
    NOP                                                                  ;A8DAC2;
    REP #$20                                                             ;A8DAC3;
    LDA.W $4216                                                          ;A8DAC5;
    STA.B DP_Temp1C                                                      ;A8DAC8;
    SEP #$20                                                             ;A8DACA;
    LDA.B DP_Temp16                                                      ;A8DACC;
    STA.W $4202                                                          ;A8DACE;
    LDA.B DP_Temp19                                                      ;A8DAD1;
    STA.W $4203                                                          ;A8DAD3;
    NOP                                                                  ;A8DAD6;
    NOP                                                                  ;A8DAD7;
    NOP                                                                  ;A8DAD8;
    REP #$20                                                             ;A8DAD9;
    LDA.W $4216                                                          ;A8DADB;
    AND.W #$FF00                                                         ;A8DADE;
    XBA                                                                  ;A8DAE1;
    STA.B DP_Temp1E                                                      ;A8DAE2;
    LDA.W $4216                                                          ;A8DAE4;
    AND.W #$00FF                                                         ;A8DAE7;
    XBA                                                                  ;A8DAEA;
    CLC                                                                  ;A8DAEB;
    ADC.B DP_Temp1C                                                      ;A8DAEC;
    STA.B DP_Temp1C                                                      ;A8DAEE;
    BCC .return                                                          ;A8DAF0;
    INC.B DP_Temp1E                                                      ;A8DAF2;

  .return:
    PLP                                                                  ;A8DAF4;
    RTS                                                                  ;A8DAF5;


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
    LDA.B DP_Temp1C                                                      ;A8DAF6;
    BNE .nonZero                                                         ;A8DAF8;
    LDA.B DP_Temp1E                                                      ;A8DAFA;
    BEQ .return                                                          ;A8DAFC;
    DEC.B DP_Temp1C                                                      ;A8DAFE;
    BRA +                                                                ;A8DB00;

  .nonZero:
    LDA.B DP_Temp1C                                                      ;A8DB02; >.<
    LDA.W #$0000                                                         ;A8DB04;
    SEC                                                                  ;A8DB07;
    SBC.B DP_Temp1C                                                      ;A8DB08;
    STA.B DP_Temp1C                                                      ;A8DB0A;

+   LDA.B DP_Temp1E                                                      ;A8DB0C;
    EOR.W #$FFFF                                                         ;A8DB0E;
    STA.B DP_Temp1E                                                      ;A8DB11;

  .return:
    RTS                                                                  ;A8DB13;


;;; $DB14: Enemy shot - enemy $E97F (bull) ;;;
EnemyShot_Bull:
    LDX.W EnemyIndex                                                     ;A8DB14;
    LDA.W Enemy.health,X                                                 ;A8DB17;
    STA.L Bull.previousHealth,X                                          ;A8DB1A;
    JSL.L CommonA8_NormalEnemyShotAI                                     ;A8DB1E;
    LDA.W Enemy.health,X                                                 ;A8DB22;
    CMP.L Bull.previousHealth,X                                          ;A8DB25;
    BEQ .noDamage                                                        ;A8DB29;
    RTL                                                                  ;A8DB2B;

  .noDamage:
    LDA.L Bull.shotReactionDisableFlag,X                                 ;A8DB2C;
    BNE .return                                                          ;A8DB30;
    LDA.W #$0001                                                         ;A8DB32;
    STA.W Enemy.instTimer,X                                              ;A8DB35;
    STZ.W Enemy.loopCounter,X                                            ;A8DB38;
    LDA.W #InstList_Bull_Shot_0                                          ;A8DB3B;
    STA.W Enemy.instList,X                                               ;A8DB3E;
    LDA.W CollisionIndex                                                 ;A8DB41;
    ASL                                                                  ;A8DB44;
    TAY                                                                  ;A8DB45;
    LDA.W SamusProjectile_Directions,Y                                   ;A8DB46;
    AND.W #$000F                                                         ;A8DB49;
    ASL                                                                  ;A8DB4C;
    TAY                                                                  ;A8DB4D;
    LDA.W BullConstants_AngleToMove_upFacingRight,Y                      ;A8DB4E;
    STA.L Bull.angle,X                                                   ;A8DB51;
    LDA.W #$0100                                                         ;A8DB55;
    STA.W Bull.acceleration,X                                            ;A8DB58;
    LDA.W #$0600                                                         ;A8DB5B;
    STA.W Bull.speed,X                                                   ;A8DB5E;
    LDA.W #Function_Bull_Decelerating                                    ;A8DB61;
    STA.W Bull.function,X                                                ;A8DB64;
    LDA.W #$0030                                                         ;A8DB67;
    STA.L Bull.shotReactionDisableTimer,X                                ;A8DB6A;
    LDA.W #$0001                                                         ;A8DB6E;
    STA.L Bull.shotReactionDisableFlag,X                                 ;A8DB71;

  .return:
    RTL                                                                  ;A8DB75;


;;; $DB76: Bull spritemaps ;;;
Spritemap_Bull_0:
    dw $0004                                                             ;A8DB76;
    %spritemapEntry(1, $1F8, $00, 0, 0, 2, 0, $10A)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $109)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $107)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $106)

Spritemap_Bull_1:
    dw $0004                                                             ;A8DB8C;
    %spritemapEntry(1, $1F8, $00, 0, 0, 2, 0, $10D)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $103)

Spritemap_Bull_2:
    dw $0007                                                             ;A8DBA2;
    %spritemapEntry(0, $00, $08, 0, 0, 2, 0, $11F)
    %spritemapEntry(0, $00, $00, 0, 0, 2, 0, $10F)
    %spritemapEntry(0, $1F8, $08, 0, 0, 2, 0, $123)
    %spritemapEntry(0, $1F0, $08, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 2, 0, $110)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $101)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $100)


;;; $DBC7: Palette - enemy $E9BF (alcoon) ;;;
Palette_Alcoon:
    dw $3800,$02FF,$01BF,$000F,$0008,$01BF,$011B,$00BA                   ;A8DBC7;
    dw $0011,$5A5C,$41B4,$290D,$1065,$03FF,$0237,$00D1                   ;A8DBD7;


;;; $DBE7: Instruction list - facing left - walking ;;;
InstList_Alcoon_FacingLeft_Walking_0:
    dw Instruction_Alcoon_MoveHorizontally_TurnIfWallCollision           ;A8DBE7;

InstList_Alcoon_FacingLeft_Walking_1:
    dw $000A,Spritemap_Alcoon_FacingLeft_FrontFootForward                ;A8DBE9;
    dw Instruction_Alcoon_MoveHorizontally_TurnIfWallCollision           ;A8DBED;
    dw $000A,Spritemap_Alcoon_FacingLeft_FeetTogether_FrontFootDown      ;A8DBEF;
    dw Instruction_Alcoon_MoveHorizontally_TurnIfWallCollision           ;A8DBF3;
    dw $000A,Spritemap_Alcoon_FacingLeft_FrontFootBack                   ;A8DBF5;
    dw Instruction_Alcoon_DecrementStepCounter_MoveHorizontally          ;A8DBF9;
    dw $000A,Spritemap_Alcoon_FacingLeft_FeetTogether_BackFootForward    ;A8DBFB;
    dw Common_Instruction_GotoY                                          ;A8DBFF;
    dw InstList_Alcoon_FacingLeft_Walking_0                              ;A8DC01;


;;; $DC03: Instruction list - facing left - spawn fireballs ;;;
InstList_Alcoon_FacingLeft_SpawnFireballs:
    dw $0014,Spritemap_Alcoon_FacingLeft_WingFullyExtended_BackFootFoward;A8DC03;
    dw $0009,Spritemap_Alcoon_FacingLeft_WingMovingForward_MouthEnlarging;A8DC07;
    dw $0010,Spritemap_Alcoon_FacingLeft_WingForward_AboutToSpit         ;A8DC0B;
    dw $0003,Spritemap_Alcoon_FacingLeft_WingMovingForward_MouthEnlarging;A8DC0F;
    dw Instruction_Alcoon_SpawnAlcoonFireballHorizontally                ;A8DC13;
    dw $000A,Spritemap_Alcoon_FacingLeft_WingExtended_MouthJustSpit      ;A8DC15;
    dw $000A,Spritemap_Alcoon_FacingLeft_WingFullyExtended_BackFootFoward;A8DC19;
    dw $0009,Spritemap_Alcoon_FacingLeft_WingMovingForward_MouthEnlarging;A8DC1D;
    dw $0010,Spritemap_Alcoon_FacingLeft_WingForward_AboutToSpit         ;A8DC21;
    dw $0003,Spritemap_Alcoon_FacingLeft_WingMovingForward_MouthEnlarging;A8DC25;
    dw Instruction_Alcoon_SpawnAlcoonFireballUpward                      ;A8DC29;
    dw $000A,Spritemap_Alcoon_FacingLeft_WingExtended_MouthJustSpit      ;A8DC2B;
    dw $000A,Spritemap_Alcoon_FacingLeft_WingFullyExtended_BackFootFoward;A8DC2F;
    dw $0009,Spritemap_Alcoon_FacingLeft_WingMovingForward_MouthEnlarging;A8DC33;
    dw $0010,Spritemap_Alcoon_FacingLeft_WingForward_AboutToSpit         ;A8DC37;
    dw $0003,Spritemap_Alcoon_FacingLeft_WingMovingForward_MouthEnlarging;A8DC3B;
    dw Instruction_Alcoon_SpawnAlcoonFireballDownward                    ;A8DC3F;
    dw $0028,Spritemap_Alcoon_FacingLeft_WingExtended_MouthJustSpit      ;A8DC41;
    dw Instruction_Alcoon_StartWalking                                   ;A8DC45;
    dw $0001,Spritemap_Alcoon_FacingLeft_WingExtended_MouthJustSpit      ;A8DC47;


;;; $DC4B: Instruction list - facing left - airborne - looking up ;;;
InstList_Alcoon_FacingLeft_Airborne_LookingUp:
    dw $7FFF,Spritemap_Alcoon_FacingLeft_LookingUp                       ;A8DC4B;
    dw Common_Instruction_Sleep                                          ;A8DC4F;


;;; $DC51: Instruction list - facing left - airborne - looking forward ;;;
InstList_Alcoon_FacingLeft_Airborne_LookingForward:
    dw $7FFF,Spritemap_Alcoon_FacingLeft_FeetTogether_BackFootForward    ;A8DC51;
    dw Common_Instruction_Sleep                                          ;A8DC55;


;;; $DC57: Instruction list - facing right - walking ;;;
InstList_Alcoon_FacingRight_Walking_0:
    dw Instruction_Alcoon_MoveHorizontally_TurnIfWallCollision           ;A8DC57;

InstList_Alcoon_FacingRight_Walking_1:
    dw $000A,Spritemap_Alcoon_FacingRight_FrontFootFoward                ;A8DC59;
    dw Instruction_Alcoon_MoveHorizontally_TurnIfWallCollision           ;A8DC5D;
    dw $000A,Spritemap_Alcoon_FacingRight_FeetTogether_FrontFootBack     ;A8DC5F;
    dw Instruction_Alcoon_MoveHorizontally_TurnIfWallCollision           ;A8DC63;
    dw $000A,Spritemap_Alcoon_FacingRight_FrontFootBack                  ;A8DC65;
    dw Instruction_Alcoon_DecrementStepCounter_MoveHorizontally          ;A8DC69;
    dw $000A,Spritemap_Alcoon_FacingRight_FrontFootUp                    ;A8DC6B;
    dw Common_Instruction_GotoY                                          ;A8DC6F;
    dw InstList_Alcoon_FacingRight_Walking_0                             ;A8DC71;


;;; $DC73: Instruction list - facing right - spawn fireballs ;;;
InstList_Alcoon_FacingRight_SpawnFireballs:
    dw $0014,Spritemap_Alcoon_FaceRight_WingFullyExtended_BackFootForward;A8DC73;
    dw $0009,Spritemap_Alcoon_FaceRight_WingMovingForward_MouthEnlarging ;A8DC77;
    dw $0010,Spritemap_Alcoon_FacingRight_WingForward_AboutToSpit        ;A8DC7B;
    dw $0003,Spritemap_Alcoon_FaceRight_WingMovingForward_MouthEnlarging ;A8DC7F;
    dw Instruction_Alcoon_SpawnAlcoonFireballHorizontally                ;A8DC83;
    dw $000A,Spritemap_Alcoon_FacingRight_WingExtended_MouthJustSpit     ;A8DC85;
    dw $000A,Spritemap_Alcoon_FaceRight_WingFullyExtended_BackFootForward;A8DC89;
    dw $0009,Spritemap_Alcoon_FaceRight_WingMovingForward_MouthEnlarging ;A8DC8D;
    dw $0010,Spritemap_Alcoon_FacingRight_WingForward_AboutToSpit        ;A8DC91;
    dw $0003,Spritemap_Alcoon_FaceRight_WingMovingForward_MouthEnlarging ;A8DC95;
    dw Instruction_Alcoon_SpawnAlcoonFireballUpward                      ;A8DC99;
    dw $000A,Spritemap_Alcoon_FacingRight_WingExtended_MouthJustSpit     ;A8DC9B;
    dw $000A,Spritemap_Alcoon_FaceRight_WingFullyExtended_BackFootForward;A8DC9F;
    dw $0009,Spritemap_Alcoon_FaceRight_WingMovingForward_MouthEnlarging ;A8DCA3;
    dw $0010,Spritemap_Alcoon_FacingRight_WingForward_AboutToSpit        ;A8DCA7;
    dw $0003,Spritemap_Alcoon_FaceRight_WingMovingForward_MouthEnlarging ;A8DCAB;
    dw Instruction_Alcoon_SpawnAlcoonFireballDownward                    ;A8DCAF;
    dw $0028,Spritemap_Alcoon_FacingRight_WingExtended_MouthJustSpit     ;A8DCB1;
    dw Instruction_Alcoon_StartWalking                                   ;A8DCB5;
    dw $0001,Spritemap_Alcoon_FacingRight_WingExtended_MouthJustSpit     ;A8DCB7;


;;; $DCBB: Instruction list - facing right - airborne - looking up ;;;
InstList_Alcoon_FacingRight_Airborne_LookingUp:
    dw $7FFF,Spritemap_Alcoon_FacingRight_LookingUp                      ;A8DCBB;
    dw Common_Instruction_Sleep                                          ;A8DCBF;


;;; $DCC1: Instruction list - facing right - airborne - looking forward ;;;
InstList_Alcoon_FacingRight_Airborne_LookingForward:
    dw $7FFF,Spritemap_Alcoon_FacingRight_FrontFootUp                    ;A8DCC1;
    dw Common_Instruction_Sleep                                          ;A8DCC5;


;;; $DCC7: Alcoon constants ;;;
AlcoonConstants_XThresholdToEmerge:
    dw $0050                                                             ;A8DCC7;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_AlcoonConstants_A8DCC9:
    dw $0040                                                             ;A8DCC9;
endif ; !FEATURE_KEEP_UNREFERENCED

AlcoonConstants_XThresholdToHide:
    dw $0070                                                             ;A8DCCB;


;;; $DCCD: Initialisation AI - enemy $E9BF (alcoon) ;;;
InitAI_Alcoon:
    LDX.W EnemyIndex                                                     ;A8DCCD;
    LDA.W #$0000                                                         ;A8DCD0;
    STA.L Alcoon.stepCounter,X                                           ;A8DCD3;
    LDA.W Enemy.YPosition,X                                              ;A8DCD7;
    STA.W Alcoon.spawnYPosition,X                                        ;A8DCDA;
    LDA.W Enemy.XPosition,X                                              ;A8DCDD;
    STA.L Alcoon.spawnXPosition,X                                        ;A8DCE0;
    LDA.W Enemy.properties,X                                             ;A8DCE4;
    ORA.W #$2000                                                         ;A8DCE7;
    STA.W Enemy.properties,X                                             ;A8DCEA;
    LDA.W #InstList_Alcoon_FacingLeft_Walking_0                          ;A8DCED;
    STA.W Enemy.instList,X                                               ;A8DCF0;
    LDA.W #Function_Alcoon_WaitForSamusToGetNear                         ;A8DCF3;
    STA.W Alcoon.function,X                                              ;A8DCF6;
    JSR.W SetupAlcoonJumpMovement                                        ;A8DCF9;

  .loopRising:
    LDA.W Alcoon.YSubVelocity,X                                          ;A8DCFC;
    CLC                                                                  ;A8DCFF;
    ADC.W Enemy.YSubPosition,X                                           ;A8DD00;
    STA.W Enemy.YSubPosition,X                                           ;A8DD03;
    LDA.W Alcoon.YVelocity,X                                             ;A8DD06;
    ADC.W Enemy.YPosition,X                                              ;A8DD09;
    STA.W Enemy.YPosition,X                                              ;A8DD0C;
    JSR.W AlcoonYAcceleration                                            ;A8DD0F;
    BMI .loopRising                                                      ;A8DD12;

  .loopFalling:
    LDA.W Alcoon.YSubVelocity,X                                          ;A8DD14;
    STA.B DP_Temp12                                                      ;A8DD17;
    LDA.W Alcoon.YVelocity,X                                             ;A8DD19;
    STA.B DP_Temp14                                                      ;A8DD1C;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8DD1E;
    BCS .collidedWithBlock                                               ;A8DD22;
    JSR.W AlcoonYAcceleration                                            ;A8DD24;
    BRA .loopFalling                                                     ;A8DD27;

  .collidedWithBlock:
    LDA.W Enemy.YPosition,X                                              ;A8DD29;
    STA.L Alcoon.landingYPosition,X                                      ;A8DD2C;
    LDA.W Alcoon.spawnYPosition,X                                        ;A8DD30;
    STA.W Enemy.YPosition,X                                              ;A8DD33;
    RTL                                                                  ;A8DD36;


;;; $DD37: Set up jump movement ;;;
SetupAlcoonJumpMovement:
    LDA.W #$FFF4                                                         ;A8DD37;
    STA.W Alcoon.YVelocity,X                                             ;A8DD3A;
    LDA.W #$0000                                                         ;A8DD3D;
    STA.W Alcoon.YSubVelocity,X                                          ;A8DD40;
    STA.W Alcoon.XVelocity,X                                             ;A8DD43;
    STA.W Enemy.var4,X                                                   ;A8DD46;
    STA.L Alcoon.YAcceleration,X                                         ;A8DD49;
    LDA.W #$8000                                                         ;A8DD4D;
    STA.L Alcoon.YSubAcceleration,X                                      ;A8DD50;
    RTS                                                                  ;A8DD54;


;;; $DD55: Alcoon Y acceleration ;;;
AlcoonYAcceleration:
    LDA.W Alcoon.YSubVelocity,X                                          ;A8DD55;
    CLC                                                                  ;A8DD58;
    ADC.L Alcoon.YSubAcceleration,X                                      ;A8DD59;
    STA.W Alcoon.YSubVelocity,X                                          ;A8DD5D;
    LDA.W Alcoon.YVelocity,X                                             ;A8DD60;
    ADC.L Alcoon.YAcceleration,X                                         ;A8DD63;
    STA.W Alcoon.YVelocity,X                                             ;A8DD67;
    RTS                                                                  ;A8DD6A;


;;; $DD6B: Main AI - enemy $E9BF (alcoon) ;;;
MainAI_Alcoon:
    LDX.W EnemyIndex                                                     ;A8DD6B;
    JMP.W (Alcoon.function,X)                                            ;A8DD6E;


;;; $DD71: Alcoon function - wait for Samus to get near ;;;
Function_Alcoon_WaitForSamusToGetNear:
    LDA.L Alcoon.landingYPosition,X                                      ;A8DD71;
    SEC                                                                  ;A8DD75;
    SBC.W SamusYPosition                                                 ;A8DD76;
    BPL .SamusBelowSpawn                                                 ;A8DD79;
    EOR.W #$FFFF                                                         ;A8DD7B;
    INC                                                                  ;A8DD7E;

  .SamusBelowSpawn:
    CMP.W #$0020                                                         ;A8DD7F;
    BPL .return                                                          ;A8DD82;
    LDA.W SamusXPosition                                                 ;A8DD84;
    SEC                                                                  ;A8DD87;
    SBC.W Enemy.XPosition,X                                              ;A8DD88;
    PHP                                                                  ;A8DD8B;
    BPL +                                                                ;A8DD8C;
    EOR.W #$FFFF                                                         ;A8DD8E;
    INC                                                                  ;A8DD91;

+   CMP.W AlcoonConstants_XThresholdToEmerge                             ;A8DD92;
    BPL .returnPLP                                                       ;A8DD95;
    JSR.W SetupAlcoonJumpMovement                                        ;A8DD97;
    LDY.W #InstList_Alcoon_FacingLeft_Airborne_LookingUp                 ;A8DD9A;
    LDA.W #$FFFE                                                         ;A8DD9D;
    PLP                                                                  ;A8DDA0;
    BMI .SamusToTheRight                                                 ;A8DDA1;
    LDY.W #InstList_Alcoon_FacingRight_Airborne_LookingUp                ;A8DDA3;
    LDA.W #$0002                                                         ;A8DDA6;

  .SamusToTheRight:
    STA.W Alcoon.XVelocity,X                                             ;A8DDA9;
    TYA                                                                  ;A8DDAC;
    STA.W Enemy.instList,X                                               ;A8DDAD;
    LDA.W #$0001                                                         ;A8DDB0;
    STA.W Enemy.instTimer,X                                              ;A8DDB3;
    LDA.W #Function_Alcoon_Emerging_Rising                               ;A8DDB6;
    STA.W Alcoon.function,X                                              ;A8DDB9;
    LDA.W #$005E                                                         ;A8DDBC;
    JSL.L QueueSound_Lib2_Max6                                           ;A8DDBF;

  .return:
    RTL                                                                  ;A8DDC3;

  .returnPLP:
    PLP                                                                  ;A8DDC4;
    RTL                                                                  ;A8DDC5;


;;; $DDC6: Alcoon function - emerging - rising ;;;
Function_Alcoon_Emerging_Rising:
    LDA.W Alcoon.YSubVelocity,X                                          ;A8DDC6;
    CLC                                                                  ;A8DDC9;
    ADC.W Enemy.YSubPosition,X                                           ;A8DDCA;
    STA.W Enemy.YSubPosition,X                                           ;A8DDCD;
    LDA.W Alcoon.YVelocity,X                                             ;A8DDD0;
    ADC.W Enemy.YPosition,X                                              ;A8DDD3;
    STA.W Enemy.YPosition,X                                              ;A8DDD6;
    JSR.W AlcoonYAcceleration                                            ;A8DDD9;
    BMI .return                                                          ;A8DDDC;

  .falling:
    LDA.W #Function_Alcoon_Emerging_Falling                              ;A8DDDE;
    STA.W Alcoon.function,X                                              ;A8DDE1;
    LDY.W #InstList_Alcoon_FacingLeft_Airborne_LookingForward            ;A8DDE4;
    LDA.W Alcoon.XVelocity,X                                             ;A8DDE7;
    BMI .keepLeft                                                        ;A8DDEA;
    LDY.W #InstList_Alcoon_FacingRight_Airborne_LookingForward           ;A8DDEC;

  .keepLeft:
    TYA                                                                  ;A8DDEF;
    STA.W Enemy.instList,X                                               ;A8DDF0;
    LDA.W #$0001                                                         ;A8DDF3;
    STA.W Enemy.instTimer,X                                              ;A8DDF6;

  .return:
    RTL                                                                  ;A8DDF9;

; Nothing points here
    LDA.W #$0000                                                         ;A8DDFA; dead code
    STA.W Alcoon.YVelocity,X                                             ;A8DDFD;
    STA.W Alcoon.YSubVelocity,X                                          ;A8DE00;
    BRA .falling                                                         ;A8DE03;


;;; $DE05: Alcoon function - emerging - falling ;;;
Function_Alcoon_Emerging_Falling:
    LDA.W Alcoon.YSubVelocity,X                                          ;A8DE05;
    STA.B DP_Temp12                                                      ;A8DE08;
    LDA.W Alcoon.YVelocity,X                                             ;A8DE0A;
    STA.B DP_Temp14                                                      ;A8DE0D;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8DE0F;
    BCS .collidedWithBlock                                               ;A8DE13;
    JSR.W AlcoonYAcceleration                                            ;A8DE15;
    RTL                                                                  ;A8DE18;

  .collidedWithBlock:
    LDA.W SamusXPosition                                                 ;A8DE19;
    SEC                                                                  ;A8DE1C;
    SBC.W Enemy.XPosition,X                                              ;A8DE1D;
    PHP                                                                  ;A8DE20;
    LDY.W #InstList_Alcoon_FacingLeft_Walking_0                          ;A8DE21;
    LDA.W #$FFFE                                                         ;A8DE24;
    PLP                                                                  ;A8DE27;
    BMI .directionChosen                                                 ;A8DE28;
    LDA.W #$0002                                                         ;A8DE2A;
    LDY.W #InstList_Alcoon_FacingRight_Walking_0                         ;A8DE2D;

  .directionChosen:
    STA.W Alcoon.XVelocity,X                                             ;A8DE30;
    TYA                                                                  ;A8DE33;
    STA.W Enemy.instList,X                                               ;A8DE34;
    LDA.W #$0001                                                         ;A8DE37;
    STA.W Enemy.instTimer,X                                              ;A8DE3A;
    LDA.W #Function_Alcoon_MoveHorizontally_SpitFireballsAtSamus         ;A8DE3D;
    STA.W Alcoon.function,X                                              ;A8DE40;
    LDA.W #$0001                                                         ;A8DE43;
    STA.L Alcoon.stepCounter,X                                           ;A8DE46;
    RTL                                                                  ;A8DE4A;


;;; $DE4B: Alcoon function - emerged ;;;
Function_Alcoon_MoveHorizontally_SpitFireballsAtSamus:
    STZ.B DP_Temp12                                                      ;A8DE4B;
    LDA.W #$0002                                                         ;A8DE4D;
    STA.B DP_Temp14                                                      ;A8DE50;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8DE52;
    LDA.L Alcoon.spawnXPosition,X                                        ;A8DE56;
    SEC                                                                  ;A8DE5A;
    SBC.W Enemy.XPosition,X                                              ;A8DE5B;
    BPL +                                                                ;A8DE5E;
    EOR.W #$FFFF                                                         ;A8DE60;
    INC                                                                  ;A8DE63;

+   CMP.W AlcoonConstants_XThresholdToHide                               ;A8DE64;
    BPL .farAway                                                         ;A8DE67;
    LDA.W SamusXPosition                                                 ;A8DE69;
    SEC                                                                  ;A8DE6C;
    SBC.W Enemy.XPosition,X                                              ;A8DE6D;
    PHP                                                                  ;A8DE70;
    BPL +                                                                ;A8DE71;
    EOR.W #$FFFF                                                         ;A8DE73;
    INC                                                                  ;A8DE76;

+   LDA.L Alcoon.stepCounter,X                                           ;A8DE77;
    BNE .returnPLP                                                       ;A8DE7B;
    PLP                                                                  ;A8DE7D;
    BMI .facingLeft                                                      ;A8DE7E;
    LDY.W #InstList_Alcoon_FacingRight_SpawnFireballs                    ;A8DE80;
    LDA.W Alcoon.XVelocity,X                                             ;A8DE83;
    BPL .fireballs                                                       ;A8DE86;
    RTL                                                                  ;A8DE88;

  .returnPLP:
    PLP                                                                  ;A8DE89;
    RTL                                                                  ;A8DE8A;

  .facingLeft:
    LDY.W #InstList_Alcoon_FacingLeft_SpawnFireballs                     ;A8DE8B;
    LDA.W Alcoon.XVelocity,X                                             ;A8DE8E;
    BPL .return                                                          ;A8DE91;

  .fireballs:
    TYA                                                                  ;A8DE93;
    STA.W Enemy.instList,X                                               ;A8DE94;
    LDA.W #$0001                                                         ;A8DE97;
    STA.W Enemy.instTimer,X                                              ;A8DE9A;
    LDA.W #RTL_A8DECC                                                    ;A8DE9D;
    STA.W Alcoon.function,X                                              ;A8DEA0;

  .return:
    RTL                                                                  ;A8DEA3;

  .farAway:
    LDA.W #Function_Alcoon_Hiding_Rising                                 ;A8DEA4;
    STA.W Alcoon.function,X                                              ;A8DEA7;
    LDA.W #$FFFC                                                         ;A8DEAA;
    STA.W Alcoon.YVelocity,X                                             ;A8DEAD;
    LDA.W #$0000                                                         ;A8DEB0;
    STA.W Alcoon.YSubVelocity,X                                          ;A8DEB3;
    LDY.W #InstList_Alcoon_FacingLeft_Airborne_LookingForward            ;A8DEB6;
    LDA.W Alcoon.XVelocity,X                                             ;A8DEB9;
    BMI +                                                                ;A8DEBC;
    LDY.W #InstList_Alcoon_FacingRight_Airborne_LookingForward           ;A8DEBE;

+   TYA                                                                  ;A8DEC1;
    STA.W Enemy.instList,X                                               ;A8DEC2;
    LDA.W #$0001                                                         ;A8DEC5;
    STA.W Enemy.instTimer,X                                              ;A8DEC8;
    RTL                                                                  ;A8DECB;


;;; $DECC: RTL ;;;
RTL_A8DECC:
    RTL                                                                  ;A8DECC;


;;; $DECD: Alcoon function - hiding - rising ;;;
Function_Alcoon_Hiding_Rising:
    LDA.W Alcoon.YSubVelocity,X                                          ;A8DECD;
    CLC                                                                  ;A8DED0;
    ADC.W Enemy.YSubPosition,X                                           ;A8DED1;
    STA.W Enemy.YSubPosition,X                                           ;A8DED4;
    LDA.W Alcoon.YVelocity,X                                             ;A8DED7;
    ADC.W Enemy.YPosition,X                                              ;A8DEDA;
    STA.W Enemy.YPosition,X                                              ;A8DEDD;
    JSR.W AlcoonYAcceleration                                            ;A8DEE0;
    BMI .return                                                          ;A8DEE3;
    LDA.W #Function_Alcoon_Hiding_Falling                                ;A8DEE5;
    STA.W Alcoon.function,X                                              ;A8DEE8;

  .return:
    RTL                                                                  ;A8DEEB;


;;; $DEEC: Alcoon function - hiding - falling ;;;
Function_Alcoon_Hiding_Falling:
    LDA.W Alcoon.YSubVelocity,X                                          ;A8DEEC;
    CLC                                                                  ;A8DEEF;
    ADC.W Enemy.YSubPosition,X                                           ;A8DEF0;
    STA.W Enemy.YSubPosition,X                                           ;A8DEF3;
    LDA.W Alcoon.YVelocity,X                                             ;A8DEF6;
    ADC.W Enemy.YPosition,X                                              ;A8DEF9;
    STA.W Enemy.YPosition,X                                              ;A8DEFC;
    CMP.W Alcoon.spawnYPosition,X                                        ;A8DEFF;
    BPL .reachedTargetY                                                  ;A8DF02;
    JSR.W AlcoonYAcceleration                                            ;A8DF04;
    RTL                                                                  ;A8DF07;

  .reachedTargetY:
    LDA.W Alcoon.spawnYPosition,X                                        ;A8DF08;
    STA.W Enemy.YPosition,X                                              ;A8DF0B;
    LDA.L Alcoon.spawnXPosition,X                                        ;A8DF0E;
    STA.W Enemy.XPosition,X                                              ;A8DF12;
    LDA.W #Function_Alcoon_WaitForSamusToGetNear                         ;A8DF15;
    STA.W Alcoon.function,X                                              ;A8DF18;
    RTL                                                                  ;A8DF1B;


;;; $DF1C: Instruction - spawn alcoon fireball with Y velocity index 0 ;;;
Instruction_Alcoon_SpawnAlcoonFireballUpward:
    PHY                                                                  ;A8DF1C;
    LDA.W #$0000                                                         ;A8DF1D; fallthrough to Instruction_Alcoon_SpawnAlcoonFireballUpward_loop


;;; $DF20: Spawn alcoon fireball with Y velocity index [A] ;;;
Instruction_Alcoon_SpawnAlcoonFireballUpward_loop:
;; Parameters:
;;     A: Y velocity index

; Expects a pushed Y
    LDY.W #EnemyProjectile_AlcoonFireball                                ;A8DF20;
    LDX.W EnemyIndex                                                     ;A8DF23;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A8DF26;
    LDA.W #$003F                                                         ;A8DF2A;
    JSL.L QueueSound_Lib2_Max6                                           ;A8DF2D;
    PLY                                                                  ;A8DF31;
    RTL                                                                  ;A8DF32;


;;; $DF33: Instruction - spawn alcoon fireball with Y velocity index 2 ;;;
Instruction_Alcoon_SpawnAlcoonFireballHorizontally:
    PHY                                                                  ;A8DF33;
    LDA.W #$0002                                                         ;A8DF34;
    BRA Instruction_Alcoon_SpawnAlcoonFireballUpward_loop                ;A8DF37;


;;; $DF39: Instruction - spawn alcoon fireball with Y velocity index 4 ;;;
Instruction_Alcoon_SpawnAlcoonFireballDownward:
    PHY                                                                  ;A8DF39;
    LDA.W #$0004                                                         ;A8DF3A;
    BRA Instruction_Alcoon_SpawnAlcoonFireballUpward_loop                ;A8DF3D;


;;; $DF3F: Instruction - start walking ;;;
Instruction_Alcoon_StartWalking:
    LDX.W EnemyIndex                                                     ;A8DF3F;
    LDA.W #Function_Alcoon_MoveHorizontally_SpitFireballsAtSamus         ;A8DF42;
    STA.W Alcoon.function,X                                              ;A8DF45;
    LDA.W RandomNumberSeed                                               ;A8DF48;
    AND.W #$0003                                                         ;A8DF4B;
    BNE +                                                                ;A8DF4E;
    LDA.W #$0002                                                         ;A8DF50;

+   STA.L Alcoon.stepCounter,X                                           ;A8DF53;
    LDY.W #InstList_Alcoon_FacingLeft_Walking_0                          ;A8DF57;
    LDA.W Alcoon.XVelocity,X                                             ;A8DF5A;
    BMI .return                                                          ;A8DF5D;
    LDY.W #InstList_Alcoon_FacingRight_Walking_0                         ;A8DF5F;

  .return:
    RTL                                                                  ;A8DF62;


;;; $DF63: Instruction - decrement step counter and move horizontally ;;;
Instruction_Alcoon_DecrementStepCounter_MoveHorizontally:
    LDX.W EnemyIndex                                                     ;A8DF63;
    LDA.L Alcoon.stepCounter,X                                           ;A8DF66;
    BEQ Instruction_Alcoon_MoveHorizontally_TurnIfWallCollision          ;A8DF6A;
    DEC                                                                  ;A8DF6C;
    STA.L Alcoon.stepCounter,X                                           ;A8DF6D; fallthrough to Instruction_Alcoon_MoveHorizontally_TurnIfWallCollision


;;; $DF71: Instruction - move horizontally ;;;
Instruction_Alcoon_MoveHorizontally_TurnIfWallCollision:
    PHY                                                                  ;A8DF71;
    LDX.W EnemyIndex                                                     ;A8DF72;
    STZ.B DP_Temp12                                                      ;A8DF75;
    LDA.W Alcoon.XVelocity,X                                             ;A8DF77;
    STA.B DP_Temp14                                                      ;A8DF7A;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A8DF7C;
    BCS .turnAround                                                      ;A8DF80;
    JSL.L AlignEnemyYPositionWIthNonSquareSlope                          ;A8DF82;
    PLY                                                                  ;A8DF86;
    RTL                                                                  ;A8DF87;

  .turnAround:
    PLY                                                                  ;A8DF88;
    LDY.W #InstList_Alcoon_FacingLeft_Walking_1                          ;A8DF89;
    LDA.W Alcoon.XVelocity,X                                             ;A8DF8C;
    BPL .directionChosen                                                 ;A8DF8F;
    LDY.W #InstList_Alcoon_FacingRight_Walking_1                         ;A8DF91;

  .directionChosen:
    EOR.W #$FFFF                                                         ;A8DF94;
    INC                                                                  ;A8DF97;
    STA.W Alcoon.XVelocity,X                                             ;A8DF98;
    RTL                                                                  ;A8DF9B;


;;; $DF9C: RTL ;;;
RTL_A8DF9C:
    RTL                                                                  ;A8DF9C;


if !FEATURE_KEEP_UNREFERENCED
;;; $DF9D: Unused. Normal enemy shot AI ;;;
UNUSED_NormalEnemyShotAI_A8DF9D:
    JSL.L NormalEnemyShotAI_Internal                                     ;A8DF9D;
    RTL                                                                  ;A8DFA1;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $DFA2: Alcoon spritemaps ;;;
Spritemap_Alcoon_FacingLeft_FrontFootForward:
    dw $0006                                                             ;A8DFA2;
    %spritemapEntry(1, $1FD, $F3, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $04, $FC, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10A)
    %spritemapEntry(1, $1F8, $08, 0, 0, 2, 0, $102)
    %spritemapEntry(0, $1ED, $F0, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $1F5, $E8, 0, 0, 2, 0, $100)

Spritemap_Alcoon_FacingLeft_FeetTogether_FrontFootDown:
    dw $0006                                                             ;A8DFC2;
    %spritemapEntry(1, $04, $FB, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1FD, $F2, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1F8, $07, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1F8, $F7, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $1EE, $EF, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $1F6, $E7, 0, 0, 2, 0, $100)

Spritemap_Alcoon_FacingLeft_FrontFootBack:
    dw $0007                                                             ;A8DFE2;
    %spritemapEntry(0, $1FD, $FB, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1FD, $F3, 0, 0, 2, 0, $13C)
    %spritemapEntry(1, $04, $FC, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1F8, $08, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $1EF, $F0, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $1F7, $E8, 0, 0, 2, 0, $100)

Spritemap_Alcoon_FacingLeft_FeetTogether_BackFootForward:
    dw $0006                                                             ;A8E007;
    %spritemapEntry(1, $04, $FB, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1FD, $F2, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1F8, $07, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $1F8, $F7, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $1EE, $EF, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $1F6, $E7, 0, 0, 2, 0, $100)

Spritemap_Alcoon_FacingLeft_WingFullyExtended_BackFootFoward:
    dw $0006                                                             ;A8E027;
    %spritemapEntry(1, $1FD, $F3, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $04, $FC, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $08, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $1EE, $F0, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $1F6, $E8, 0, 0, 2, 0, $100)

Spritemap_Alcoon_FacingLeft_WingMovingForward_MouthEnlarging:
    dw $0007                                                             ;A8E047;
    %spritemapEntry(1, $1FE, $F3, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $05, $FC, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1F7, $F0, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F8, $08, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1F9, $F8, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $1F0, $F0, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $1F7, $E8, 0, 0, 2, 0, $100)

Spritemap_Alcoon_FacingLeft_WingForward_AboutToSpit:
    dw $0009                                                             ;A8E06C;
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
    dw $0006                                                             ;A8E09B;
    %spritemapEntry(1, $1FD, $F3, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $04, $FC, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $1EE, $F0, 0, 0, 2, 0, $12B)
    %spritemapEntry(1, $1F8, $08, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10A)
    %spritemapEntry(1, $1F6, $E8, 0, 0, 2, 0, $100)

Spritemap_Alcoon_FacingLeft_LookingUp:
    dw $0006                                                             ;A8E0BB;
    %spritemapEntry(1, $1FD, $F3, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $1FA, $E4, 0, 1, 2, 0, $13A)
    %spritemapEntry(1, $1FA, $EC, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $04, $FC, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1F8, $08, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10A)

Spritemap_Alcoon_FacingRight_FrontFootFoward:
    dw $0006                                                             ;A8E0DB;
    %spritemapEntry(1, $1F3, $F3, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $1EC, $FC, 0, 1, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $10A)
    %spritemapEntry(1, $1F8, $08, 0, 1, 2, 0, $102)
    %spritemapEntry(0, $0B, $F0, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $1FB, $E8, 0, 1, 2, 0, $100)

Spritemap_Alcoon_FacingRight_FeetTogether_FrontFootBack:
    dw $0006                                                             ;A8E0FB;
    %spritemapEntry(1, $1EC, $FB, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $1F3, $F2, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $1F8, $07, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $1F8, $F7, 0, 1, 2, 0, $10A)
    %spritemapEntry(0, $0A, $EF, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $1FA, $E7, 0, 1, 2, 0, $100)

Spritemap_Alcoon_FacingRight_FrontFootBack:
    dw $0007                                                             ;A8E11B;
    %spritemapEntry(0, $1FB, $FB, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $1FB, $F3, 0, 1, 2, 0, $13C)
    %spritemapEntry(1, $1EC, $FC, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $1F8, $08, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $10A)
    %spritemapEntry(0, $09, $F0, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $1F9, $E8, 0, 1, 2, 0, $100)

Spritemap_Alcoon_FacingRight_FrontFootUp:
    dw $0006                                                             ;A8E140;
    %spritemapEntry(1, $1EC, $FB, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $1F3, $F2, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $1F8, $07, 0, 1, 2, 0, $108)
    %spritemapEntry(1, $1F8, $F7, 0, 1, 2, 0, $10A)
    %spritemapEntry(0, $0A, $EF, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $1FA, $E7, 0, 1, 2, 0, $100)

Spritemap_Alcoon_FaceRight_WingFullyExtended_BackFootForward:
    dw $0006                                                             ;A8E160;
    %spritemapEntry(1, $1F3, $F3, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $1EC, $FC, 0, 1, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $08, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $10A)
    %spritemapEntry(0, $0A, $F0, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $1FA, $E8, 0, 1, 2, 0, $100)

Spritemap_Alcoon_FaceRight_WingMovingForward_MouthEnlarging:
    dw $0007                                                             ;A8E180;
    %spritemapEntry(1, $1F2, $F3, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $1EB, $FC, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $01, $F0, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $1F8, $08, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $1F7, $F8, 0, 1, 2, 0, $10A)
    %spritemapEntry(0, $08, $F0, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $1F9, $E8, 0, 1, 2, 0, $100)

Spritemap_Alcoon_FacingRight_WingForward_AboutToSpit:
    dw $0009                                                             ;A8E1A5;
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
    dw $0006                                                             ;A8E1D4;
    %spritemapEntry(1, $1F3, $F3, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $1EC, $FC, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $0A, $F0, 0, 1, 2, 0, $12B)
    %spritemapEntry(1, $1F8, $08, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $10A)
    %spritemapEntry(1, $1FA, $E8, 0, 1, 2, 0, $100)

Spritemap_Alcoon_FacingRight_LookingUp:
    dw $0006                                                             ;A8E1F4;
    %spritemapEntry(1, $1F3, $F3, 0, 1, 2, 0, $124)
    %spritemapEntry(0, $1FE, $E4, 0, 0, 2, 0, $13A)
    %spritemapEntry(1, $1F6, $EC, 0, 1, 2, 0, $128)
    %spritemapEntry(1, $1EC, $FC, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $1F8, $08, 0, 1, 2, 0, $108)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $10A)

; Unused. X flipped version of the alcoon fireball enemy projectile
if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Alcoon_FireballProjectile_0_A8E214:
    dw $0001                                                             ;A8E214;
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 0, $12C)

UNUSED_Spritemap_Alcoon_FireballProjectile_1_A8E21B:
    dw $0001                                                             ;A8E21B;
    %spritemapEntry(0, $1FC, $FC, 1, 1, 2, 0, $12D)

UNUSED_Spritemap_Alcoon_FireballProjectile_2_A8E222:
    dw $0001                                                             ;A8E222;
    %spritemapEntry(0, $1FC, $FC, 1, 0, 2, 0, $12C)

UNUSED_Spritemap_Alcoon_FireballProjectile_3_A8E229:
    dw $0001                                                             ;A8E229;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $12D)
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $E230: Palette - enemy $E9FF (atomic) ;;;
Palette_Atomic:
    dw $3800,$7FFF,$56E0,$3180,$18C0,$6BC0,$5EC0,$4A20                   ;A8E230;
    dw $35A0,$7FFF,$039C,$0237,$00D1,$03FF,$0237,$00D1                   ;A8E240;


if !FEATURE_KEEP_UNREFERENCED
;;; $E250: Palettes - atomic ;;;
UNUSED_Palettes_Atomic_A8E250:
    dw $3800,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;A8E250;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;A8E260;
    dw $3800,$7FFF,$6A40,$44E0,$2C20,$7F20,$7220,$5D80                   ;A8E270;
    dw $4900,$03FF,$001F,$0016,$000E,$03FF,$0237,$00D1                   ;A8E280;
    dw $3800,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166                   ;A8E290;
    dw $0924,$435A,$3694,$15AD,$0508,$03FF,$0237,$00D1                   ;A8E2A0;
    dw $3800,$7FFF,$6A40,$44E0,$2C20,$7F20,$7220,$5D80                   ;A8E2B0;
    dw $4900,$7FFF,$039C,$0237,$00D1,$03FF,$0237,$00D1                   ;A8E2C0;
    dw $3800,$02FF,$01BF,$000F,$0008,$01BF,$011B,$00BA                   ;A8E2D0;
    dw $0011,$7FFF,$039C,$0237,$00D1,$03FF,$0237,$00D1                   ;A8E2E0;
    dw $3800,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;A8E2F0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;A8E300;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $E310: Instruction list - spinning up-right ;;;
InstList_Atomic_SpinningUpRight:
    dw $0008,Spritemap_Atomic_0                                          ;A8E310;
    dw $0008,Spritemap_Atomic_1                                          ;A8E314;
    dw $0008,Spritemap_Atomic_2                                          ;A8E318;
    dw $0008,Spritemap_Atomic_3                                          ;A8E31C;
    dw $0008,Spritemap_Atomic_4                                          ;A8E320;
    dw $0008,Spritemap_Atomic_5                                          ;A8E324;
    dw Common_Instruction_GotoY                                          ;A8E328;
    dw InstList_Atomic_SpinningUpRight                                   ;A8E32A;


;;; $E32C: Instruction list - spinning up-left ;;;
InstList_Atomic_SpinningUpLeft:
    dw $0008,Spritemap_Atomic_6                                          ;A8E32C;
    dw $0008,Spritemap_Atomic_7                                          ;A8E330;
    dw $0008,Spritemap_Atomic_8                                          ;A8E334;
    dw $0008,Spritemap_Atomic_9                                          ;A8E338;
    dw $0008,Spritemap_Atomic_A                                          ;A8E33C;
    dw $0008,Spritemap_Atomic_B                                          ;A8E340;
    dw Common_Instruction_GotoY                                          ;A8E344;
    dw InstList_Atomic_SpinningUpLeft                                    ;A8E346;


;;; $E348: Instruction list - spinning down-left ;;;
InstList_Atomic_SpinningDownLeft:
    dw $0008,Spritemap_Atomic_5                                          ;A8E348;
    dw $0008,Spritemap_Atomic_4                                          ;A8E34C;
    dw $0008,Spritemap_Atomic_3                                          ;A8E350;
    dw $0008,Spritemap_Atomic_2                                          ;A8E354;
    dw $0008,Spritemap_Atomic_1                                          ;A8E358;
    dw $0008,Spritemap_Atomic_0                                          ;A8E35C;
    dw Common_Instruction_GotoY                                          ;A8E360;
    dw InstList_Atomic_SpinningDownLeft                                  ;A8E362;


;;; $E364: Instruction list - spinning down-right ;;;
InstList_Atomic_SpinningDownRight:
    dw $0008,Spritemap_Atomic_B                                          ;A8E364;
    dw $0008,Spritemap_Atomic_A                                          ;A8E368;
    dw $0008,Spritemap_Atomic_9                                          ;A8E36C;
    dw $0008,Spritemap_Atomic_8                                          ;A8E370;
    dw $0008,Spritemap_Atomic_7                                          ;A8E374;
    dw $0008,Spritemap_Atomic_6                                          ;A8E378;
    dw Common_Instruction_GotoY                                          ;A8E37C;
    dw InstList_Atomic_SpinningDownRight                                 ;A8E37E;


;;; $E380: Atomic instruction list pointers ;;;
AtomicInstListPointers:
; Indexed by [enemy parameter 1] * 2
    dw InstList_Atomic_SpinningUpRight                                   ;A8E380;
    dw InstList_Atomic_SpinningUpLeft                                    ;A8E382;
    dw InstList_Atomic_SpinningDownLeft                                  ;A8E384;
    dw InstList_Atomic_SpinningDownRight                                 ;A8E386;


;;; $E388: Initialisation AI - enemy $E9FF (atomic) ;;;
InitAI_Atomic:
    LDX.W EnemyIndex                                                     ;A8E388;
    LDA.W #$0001                                                         ;A8E38B;
    STA.W Enemy.instTimer,X                                              ;A8E38E;
    STZ.W Enemy.loopCounter,X                                            ;A8E391;
    LDA.W Enemy.init0,X                                                  ;A8E394;
    ASL                                                                  ;A8E397;
    TAY                                                                  ;A8E398;
    LDA.W AtomicInstListPointers,Y                                       ;A8E399;
    STA.W Enemy.instList,X                                               ;A8E39C;
    LDA.W Enemy.init1,X                                                  ;A8E39F;
    ASL                                                                  ;A8E3A2;
    ASL                                                                  ;A8E3A3;
    ASL                                                                  ;A8E3A4;
    TAY                                                                  ;A8E3A5;
    LDA.W Common_EnemySpeeds_LinearlyIncreasing,Y                         ;A8E3A6;
    STA.L Atomic.speed,X                                                 ;A8E3A9;
    LDA.W Common_EnemySpeeds_LinearlyIncreasing+2,Y                       ;A8E3AD;
    STA.L Atomic.subSpeed,X                                              ;A8E3B0;
    LDA.W Common_EnemySpeeds_LinearlyIncreasing+4,Y                       ;A8E3B4;
    STA.L Atomic.negativeSpeed,X                                         ;A8E3B7;
    LDA.W Common_EnemySpeeds_LinearlyIncreasing+6,Y                       ;A8E3BB;
    STA.L Atomic.negativeSubSpeed,X                                      ;A8E3BE;
    RTL                                                                  ;A8E3C2;


;;; $E3C3: Main AI - enemy $E9FF (atomic) ;;;
MainAI_Atomic:
    LDX.W EnemyIndex                                                     ;A8E3C3;
    JSR.W ChooseAtomicYMovementFunction                                  ;A8E3C6;
    JSR.W ChooseAtomicXMovementFunction                                  ;A8E3C9;
    LDX.W EnemyIndex                                                     ;A8E3CC;
    JSR.W (Atomic.XMovementFunction,X)                                   ;A8E3CF;
    LDX.W EnemyIndex                                                     ;A8E3D2;
    JSR.W (Atomic.YMovementFunction,X)                                   ;A8E3D5;
    RTL                                                                  ;A8E3D8;


;;; $E3D9: Set atomic Y movement function ;;;
ChooseAtomicYMovementFunction:
    LDX.W EnemyIndex                                                     ;A8E3D9;
    LDA.W #Function_Atomic_MoveUp                                        ;A8E3DC;
    STA.W Atomic.XMovementFunction,X                                     ;A8E3DF;
    JSL.L Get_SamusY_minus_EnemyY                                        ;A8E3E2;
    BMI .return                                                          ;A8E3E6;
    LDA.W #Function_Atomic_MoveDown                                      ;A8E3E8;
    STA.W Atomic.XMovementFunction,X                                     ;A8E3EB;

  .return:
    RTS                                                                  ;A8E3EE;


;;; $E3EF: Set atomic X movement function ;;;
ChooseAtomicXMovementFunction:
    LDX.W EnemyIndex                                                     ;A8E3EF;
    LDA.W #Function_Atomic_MoveLeft                                      ;A8E3F2;
    STA.W Atomic.YMovementFunction,X                                     ;A8E3F5;
    JSL.L Get_SamusX_minus_EnemyX                                        ;A8E3F8;
    BMI .return                                                          ;A8E3FC;
    LDA.W #Function_Atomic_MoveRight                                     ;A8E3FE;
    STA.W Atomic.YMovementFunction,X                                     ;A8E401;

  .return:
    RTS                                                                  ;A8E404;


;;; $E405: Atomic Y movement function - move up ;;;
Function_Atomic_MoveUp:
    LDX.W EnemyIndex                                                     ;A8E405;
    LDA.W Enemy.YPosition,X                                              ;A8E408;
    CLC                                                                  ;A8E40B;
    ADC.L Atomic.negativeSpeed,X                                         ;A8E40C;
    STA.W Enemy.YPosition,X                                              ;A8E410;
    LDA.W Enemy.YSubPosition,X                                           ;A8E413;
    CLC                                                                  ;A8E416;
    ADC.L Atomic.negativeSubSpeed,X                                      ;A8E417;
    BCC .done                                                            ;A8E41B;
    INC.W Enemy.YPosition,X                                              ;A8E41D;

  .done:
    STA.W Enemy.YSubPosition,X                                           ;A8E420;
    RTS                                                                  ;A8E423;


;;; $E424: Atomic Y movement function - move down ;;;
Function_Atomic_MoveDown:
    LDX.W EnemyIndex                                                     ;A8E424;
    LDA.W Enemy.YPosition,X                                              ;A8E427;
    CLC                                                                  ;A8E42A;
    ADC.L Atomic.speed,X                                                 ;A8E42B;
    STA.W Enemy.YPosition,X                                              ;A8E42F;
    LDA.W Enemy.YSubPosition,X                                           ;A8E432;
    CLC                                                                  ;A8E435;
    ADC.L Atomic.subSpeed,X                                              ;A8E436;
    BCC .done                                                            ;A8E43A;
    INC.W Enemy.YPosition,X                                              ;A8E43C;

  .done:
    STA.W Enemy.YSubPosition,X                                           ;A8E43F;
    RTS                                                                  ;A8E442;


;;; $E443: Atomic X movement function - move left ;;;
Function_Atomic_MoveLeft:
    LDX.W EnemyIndex                                                     ;A8E443;
    LDA.W Enemy.XPosition,X                                              ;A8E446;
    CLC                                                                  ;A8E449;
    ADC.L Atomic.negativeSpeed,X                                         ;A8E44A;
    STA.W Enemy.XPosition,X                                              ;A8E44E;
    LDA.W Enemy.XSubPosition,X                                           ;A8E451;
    CLC                                                                  ;A8E454;
    ADC.L Atomic.negativeSubSpeed,X                                      ;A8E455;
    BCC .done                                                            ;A8E459;
    INC.W Enemy.XPosition,X                                              ;A8E45B;

  .done:
    STA.W Enemy.XSubPosition,X                                           ;A8E45E;
    RTS                                                                  ;A8E461;


;;; $E462: Atomic X movement function - move right ;;;
Function_Atomic_MoveRight:
    LDX.W EnemyIndex                                                     ;A8E462;
    LDA.W Enemy.XPosition,X                                              ;A8E465;
    CLC                                                                  ;A8E468;
    ADC.L Atomic.speed,X                                                 ;A8E469;
    STA.W Enemy.XPosition,X                                              ;A8E46D;
    LDA.W Enemy.XSubPosition,X                                           ;A8E470;
    CLC                                                                  ;A8E473;
    ADC.L Atomic.subSpeed,X                                              ;A8E474;
    BCC .done                                                            ;A8E478;
    INC.W Enemy.XPosition,X                                              ;A8E47A;

  .done:
    STA.W Enemy.XSubPosition,X                                           ;A8E47D;
    RTS                                                                  ;A8E480;


if !FEATURE_KEEP_UNREFERENCED
;;; $E481: Unused. RTL ;;;
UNUSED_Atomic_GetEnemyIndex_A8E481:
    LDX.W EnemyIndex                                                     ;A8E481;
    RTL                                                                  ;A8E484;


;;; $E485: Unused. RTL ;;;
UNUSED_Atomic_GetEnemyIndex_A8E485:
    LDX.W EnemyIndex                                                     ;A8E485;
    RTL                                                                  ;A8E488;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $E489: Spritemaps - atomic ;;;
Spritemap_Atomic_0:
    dw $0004                                                             ;A8E489;
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 0, $103)
    %spritemapEntry(0, $04, $FC, 0, 0, 2, 0, $103)

Spritemap_Atomic_1:
    dw $0004                                                             ;A8E49F;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $103)
    %spritemapEntry(0, $00, $00, 0, 0, 2, 0, $103)

Spritemap_Atomic_2:
    dw $0004                                                             ;A8E4B5;
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 0, $103)
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 0, $103)

Spritemap_Atomic_3:
    dw $0004                                                             ;A8E4CB;
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 0, $102)
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $01, $F7, 0, 0, 2, 0, $103)

Spritemap_Atomic_4:
    dw $0003                                                             ;A8E4E1;
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $102)
    %spritemapEntry(0, $00, $00, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $100)

Spritemap_Atomic_5:
    dw $0004                                                             ;A8E4F2;
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 0, $102)
    %spritemapEntry(0, $04, $FC, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $1F7, $01, 0, 0, 2, 0, $103)

Spritemap_Atomic_6:
    dw $0004                                                             ;A8E508;
    %spritemapEntry(0, $00, $00, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 0, $103)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 0, $103)

Spritemap_Atomic_7:
    dw $0004                                                             ;A8E51E;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $103)
    %spritemapEntry(0, $1F8, $00, 0, 1, 2, 0, $103)

Spritemap_Atomic_8:
    dw $0004                                                             ;A8E534;
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $04, $FC, 0, 0, 2, 0, $103)
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 0, $103)

Spritemap_Atomic_9:
    dw $0004                                                             ;A8E54A;
    %spritemapEntry(0, $04, $FC, 0, 0, 2, 0, $102)
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $1F7, $F7, 0, 0, 2, 0, $103)

Spritemap_Atomic_A:
    dw $0003                                                             ;A8E560;
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $102)
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $100)

Spritemap_Atomic_B:
    dw $0004                                                             ;A8E571;
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 0, $102)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $01, $01, 0, 0, 2, 0, $103)


;;; $E587: Palette - enemy $EA3F (Wrecked Ship spark) ;;;
Palette_Spark:
    dw $3800,$7FFF,$3BE0,$2680,$1580,$6BFA,$4BF2,$2BEA                   ;A8E587;
    dw $03E0,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;A8E597;


;;; $E5A7: Instruction list - activate ;;;
InstList_Spark_FlickerOn:
    dw Instruction_Spark_SetAsTangible                                   ;A8E5A7;
    dw $0001,Spritemap_Spark_Flickering_0                                ;A8E5A9;
    dw $0002,Common_Spritemap_Nothing                                    ;A8E5AD;
    dw $0001,Spritemap_Spark_Flickering_0                                ;A8E5B1;
    dw $0002,Common_Spritemap_Nothing                                    ;A8E5B5;
    dw $0001,Spritemap_Spark_Flickering_1                                ;A8E5B9;
    dw $0002,Common_Spritemap_Nothing                                    ;A8E5BD;
    dw $0001,Spritemap_Spark_Flickering_1                                ;A8E5C1;
    dw $0001,Common_Spritemap_Nothing                                    ;A8E5C5;
    dw $0002,Spritemap_Spark_Flickering_2                                ;A8E5C9;
    dw $0002,Spritemap_Spark_Flickering_3                                ;A8E5CD;


;;; $E5D1: Instruction list - active ;;;
InstList_Spark_Constant:
    dw $0003,Spritemap_Spark_Constant_0                                  ;A8E5D1;
    dw $0003,Spritemap_Spark_Constant_1                                  ;A8E5D5;
    dw $0003,Spritemap_Spark_Constant_2                                  ;A8E5D9;
    dw $0003,Spritemap_Spark_Constant_3                                  ;A8E5DD;
    dw Common_Instruction_GotoY                                          ;A8E5E1;
    dw InstList_Spark_Constant                                           ;A8E5E3;


;;; $E5E5: Instruction list - deactivate ;;;
InstList_Spark_FlickerOut:
    dw $0001,Spritemap_Spark_Flickering_0                                ;A8E5E5;
    dw $0001,Spritemap_Spark_Flickering_0                                ;A8E5E9;
    dw $0001,Spritemap_Spark_Flickering_1                                ;A8E5ED;
    dw $0001,Spritemap_Spark_Flickering_1                                ;A8E5F1;
    dw $0001,Spritemap_Spark_Flickering_2                                ;A8E5F5;
    dw $0001,Common_Spritemap_Nothing                                    ;A8E5F9;
    dw $0001,Spritemap_Spark_Flickering_2                                ;A8E5FD;
    dw $0001,Common_Spritemap_Nothing                                    ;A8E601;
    dw Instruction_Spark_SetAsIntangible                                 ;A8E605;
    dw Common_Instruction_Sleep                                          ;A8E607;


;;; $E609: Instruction list - emit falling sparks ;;;
InstList_Spark_EmitFallingSparks:
    dw $0003,Spritemap_Spark_Flickering_0                                ;A8E609;
    dw $0003,Spritemap_Spark_Flickering_1                                ;A8E60D;
    dw $0003,Spritemap_Spark_Flickering_2                                ;A8E611;
    dw $0003,Spritemap_Spark_Flickering_3                                ;A8E615;
    dw Common_Instruction_GotoY                                          ;A8E619;
    dw InstList_Spark_EmitFallingSparks                                  ;A8E61B;


;;; $E61D: Instruction - set enemy as intangible ;;;
Instruction_Spark_SetAsIntangible:
    LDX.W EnemyIndex                                                     ;A8E61D;
    LDA.W Enemy.properties,X                                             ;A8E620;
    ORA.W #$0400                                                         ;A8E623;
    STA.W Enemy.properties,X                                             ;A8E626;
    RTL                                                                  ;A8E629;


;;; $E62A: Instruction - set enemy as tangible ;;;
Instruction_Spark_SetAsTangible:
    LDX.W EnemyIndex                                                     ;A8E62A;
    LDA.W Enemy.properties,X                                             ;A8E62D;
    AND.W #$FBFF                                                         ;A8E630;
    STA.W Enemy.properties,X                                             ;A8E633;
    RTL                                                                  ;A8E636;


;;; $E637: Initialisation AI - enemy $EA3F (Wrecked Ship spark) ;;;
InitAI_Spark:
    LDX.W EnemyIndex                                                     ;A8E637;
    LDA.W Enemy.init0,X                                                  ;A8E63A;
    AND.W #$0003                                                         ;A8E63D;
    ASL                                                                  ;A8E640;
    TAY                                                                  ;A8E641;
    LDA.W .functionPointers,Y                                            ;A8E642;
    STA.W Spark.function,X                                               ;A8E645;
    LDA.W Enemy.init1,X                                                  ;A8E648;
    STA.W Spark.baseFunctionTime,X                                       ;A8E64B;
    STZ.B DP_Temp12                                                      ;A8E64E;
    JSR.W SetSparkFunctionTimer                                          ;A8E650;
    LDA.W #$0001                                                         ;A8E653;
    STA.W Enemy.instTimer,X                                              ;A8E656;
    LDA.W .instListPointers,Y                                            ;A8E659;
    STA.W Enemy.instList,X                                               ;A8E65C;
    STZ.W Enemy.loopCounter,X                                            ;A8E65F;
    LDA.W #$0001                                                         ;A8E662;
    STA.W Enemy.instTimer,X                                              ;A8E665;
    LDX.W AreaIndex                                                      ;A8E668;
    LDA.L SRAMMirror_Boss,X                                              ;A8E66B;
    AND.W #$0001                                                         ;A8E66F;
    BEQ .PhantoonAlive                                                   ;A8E672;
    RTL                                                                  ;A8E674;

  .PhantoonAlive:
    LDX.W EnemyIndex                                                     ;A8E675;
    LDA.W Enemy.properties,X                                             ;A8E678;
    ORA.W $0100                                                          ;A8E67B; >_<
    STA.W Enemy.properties,X                                             ;A8E67E;
    RTL                                                                  ;A8E681;

  .instListPointers:
    dw InstList_Spark_Constant                                           ;A8E682;
    dw InstList_Spark_Constant                                           ;A8E684;
    dw InstList_Spark_EmitFallingSparks                                  ;A8E686;

  .functionPointers:
    dw RTL_A8E694                                                        ;A8E688;
    dw Function_Spark_Intermittent_Active                                ;A8E68A;
    dw Function_Spark_EmitFallingSparks                                  ;A8E68C;


;;; $E68E: Main AI - enemy $EA3F (Wrecked Ship spark) ;;;
MainAI_Spark:
    LDX.W EnemyIndex                                                     ;A8E68E;
    JMP.W (Spark.function,X)                                             ;A8E691;


;;; $E694: RTL. Wrecked Ship spark function - always active ;;;
RTL_A8E694:
    RTL                                                                  ;A8E694;


;;; $E695: Wrecked Ship spark function - intermittent - inactive ;;;
Function_Spark_Intermittent_Inactive:
    LDA.W Spark.functionTimer,X                                          ;A8E695;
    DEC                                                                  ;A8E698;
    BEQ .timerExpired                                                    ;A8E699;
    STA.W Spark.functionTimer,X                                          ;A8E69B;
    RTL                                                                  ;A8E69E;

  .timerExpired:
    LDA.W #Function_Spark_Intermittent_Active                            ;A8E69F;
    STA.W Spark.function,X                                               ;A8E6A2;
    LDA.W #InstList_Spark_FlickerOn                                      ;A8E6A5;
    STA.W Enemy.instList,X                                               ;A8E6A8;
    LDA.W #$0001                                                         ;A8E6AB;
    STA.W Enemy.instTimer,X                                              ;A8E6AE;
    STZ.B DP_Temp12                                                      ;A8E6B1;
    JSR.W SetSparkFunctionTimer                                          ;A8E6B3;
    RTL                                                                  ;A8E6B6;


;;; $E6B7: Wrecked Ship spark function - intermittent - active ;;;
Function_Spark_Intermittent_Active:
    LDA.W Spark.functionTimer,X                                          ;A8E6B7;
    DEC                                                                  ;A8E6BA;
    BEQ .timerExpired                                                    ;A8E6BB;
    STA.W Spark.functionTimer,X                                          ;A8E6BD;
    RTL                                                                  ;A8E6C0;

  .timerExpired:
    LDA.W #Function_Spark_Intermittent_Inactive                          ;A8E6C1;
    STA.W Spark.function,X                                               ;A8E6C4;
    LDA.W #InstList_Spark_FlickerOut                                     ;A8E6C7;
    STA.W Enemy.instList,X                                               ;A8E6CA;
    LDA.W #$0001                                                         ;A8E6CD;
    STA.W Enemy.instTimer,X                                              ;A8E6D0;
    LDA.W #$0008                                                         ;A8E6D3;
    STA.B DP_Temp12                                                      ;A8E6D6;
    JSR.W SetSparkFunctionTimer                                          ;A8E6D8;
    RTL                                                                  ;A8E6DB;


;;; $E6DC: Wrecked Ship spark function - emit falling sparks ;;;
Function_Spark_EmitFallingSparks:
    LDA.W Spark.functionTimer,X                                          ;A8E6DC;
    DEC                                                                  ;A8E6DF;
    BEQ .timerExpired                                                    ;A8E6E0;
    STA.W Spark.functionTimer,X                                          ;A8E6E2;
    RTL                                                                  ;A8E6E5;

  .timerExpired:
    LDX.W EnemyIndex                                                     ;A8E6E6;
    LDY.W #EnemyProjectile_FallingSpark                                  ;A8E6E9;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A8E6EC;
    STZ.B DP_Temp12                                                      ;A8E6F0;
    JSR.W SetSparkFunctionTimer                                          ;A8E6F2;
    RTL                                                                  ;A8E6F5;


;;; $E6F6: Set Wrecked Ship spark function timer ;;;
SetSparkFunctionTimer:
;; Parameters:
;;     $12: Additional function time
    LDA.W Spark.baseFunctionTime,X                                       ;A8E6F6;
    BPL .noRNG                                                           ;A8E6F9;
    JSL.L GenerateRandomNumber                                           ;A8E6FB;
    AND.W #$003F                                                         ;A8E6FF;
    CLC                                                                  ;A8E702;
    ADC.W #$0004                                                         ;A8E703;

  .noRNG:
    CLC                                                                  ;A8E706;
    ADC.B DP_Temp12                                                      ;A8E707;
    STA.W Spark.functionTimer,X                                          ;A8E709;
    RTS                                                                  ;A8E70C;


;;; $E70D: RTL ;;;
RTL_A8E70D:
    RTL                                                                  ;A8E70D;


;;; $E70E: Enemy shot - enemy $EA3F (Wrecked Ship spark) ;;;
EnemyShot_Spark:
    PHX                                                                  ;A8E70E;
    LDA.W CollisionIndex                                                 ;A8E70F;
    ASL                                                                  ;A8E712;
    TAX                                                                  ;A8E713;
    LDA.W SamusProjectile_Directions,X                                   ;A8E714;
    AND.W #$FFEF                                                         ;A8E717;
    STA.W SamusProjectile_Directions,X                                   ;A8E71A;
    PLX                                                                  ;A8E71D;
    RTL                                                                  ;A8E71E;


;;; $E71F: Spritemaps - Wrecked Ship spark ;;;
; Active
Spritemap_Spark_Constant_0:
    dw $0002                                                             ;A8E71F;
    %spritemapEntry(0, $1FC, $01, 0, 0, 3, 0, $103)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $100)

Spritemap_Spark_Constant_1:
    dw $0002                                                             ;A8E72B;
    %spritemapEntry(0, $1FC, $06, 0, 1, 3, 0, $104)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $101)

Spritemap_Spark_Constant_2:
    dw $0002                                                             ;A8E737;
    %spritemapEntry(0, $1FC, $08, 0, 0, 3, 0, $105)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $102)

Spritemap_Spark_Constant_3:
    dw $0002                                                             ;A8E743;
    %spritemapEntry(0, $1FC, $0A, 0, 0, 3, 0, $106)
    %spritemapEntry(0, $1FC, $FC, 0, 1, 3, 0, $101)

; Activate / deactivate / emit falling sparks
Spritemap_Spark_Flickering_0:
    dw $0005                                                             ;A8E74F;
    %spritemapEntry(0, $02, $FE, 0, 0, 3, 0, $109)
    %spritemapEntry(0, $1F6, $FC, 0, 0, 3, 0, $108)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 0, $107)
    %spritemapEntry(0, $1FC, $03, 0, 0, 3, 0, $103)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $100)

Spritemap_Spark_Flickering_1:
    dw $0005                                                             ;A8E76A;
    %spritemapEntry(0, $1F4, $FC, 0, 0, 3, 0, $109)
    %spritemapEntry(0, $04, $00, 0, 0, 3, 0, $10A)
    %spritemapEntry(0, $02, $F6, 0, 0, 3, 0, $108)
    %spritemapEntry(0, $1FC, $06, 0, 1, 3, 0, $104)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $101)

Spritemap_Spark_Flickering_2:
    dw $0004                                                             ;A8E785;
    %spritemapEntry(0, $1F4, $FC, 0, 0, 3, 0, $10A)
    %spritemapEntry(0, $04, $F4, 0, 0, 3, 0, $109)
    %spritemapEntry(0, $1FC, $09, 0, 0, 3, 0, $105)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $102)

Spritemap_Spark_Flickering_3:
    dw $0003                                                             ;A8E79B;
    %spritemapEntry(0, $04, $F4, 0, 0, 3, 0, $10A)
    %spritemapEntry(0, $1FC, $0E, 0, 0, 3, 0, $106)
    %spritemapEntry(0, $1FC, $FC, 0, 1, 3, 0, $101)


;;; $E7AC: Palette - enemy $EA7F (blue Brinstar face block) ;;;
Palette_FaceBlock:
    dw $3800,$72B2,$71C7,$2461,$1840,$7A8E,$660B,$4D03                   ;A8E7AC;
    dw $30A4,$30A4,$2461,$1840,$0800,$0000,$0000,$0000                   ;A8E7BC;


;;; $E7CC: Blue Brinstar face block glow colours ;;;
FaceBlockGlowColors:                                                     ;A8E7CC;
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
    dw $0030,Spritemap_FaceBlock_FacingForward                           ;A8E80C;
    dw $0010,Spritemap_FaceBlock_TurningLeft                             ;A8E810;
    dw $0010,Spritemap_FaceBlock_FacingLeft                              ;A8E814;
    dw Common_Instruction_Sleep                                          ;A8E818;


;;; $E81A: Instruction list - turning right ;;;
InstList_FaceBlock_TurningRight:
    dw $0030,Spritemap_FaceBlock_FacingForward                           ;A8E81A;
    dw $0010,Spritemap_FaceBlock_TurningRight                            ;A8E81E;
    dw $0010,Spritemap_FaceBlock_FacingRight                             ;A8E822;
    dw Common_Instruction_Sleep                                          ;A8E826;


;;; $E828: Instruction list - facing forward ;;;
InstList_FaceBlock_FacingForward:
    dw $0001,Spritemap_FaceBlock_FacingForward                           ;A8E828;
    dw Common_Instruction_Sleep                                          ;A8E82C;


;;; $E82E: Initialisation AI - enemy $EA7F (blue Brinstar face block) ;;;
InitAI_FaceBlock:
    LDX.W EnemyIndex                                                     ;A8E82E;
    LDA.W #InstList_FaceBlock_FacingForward                              ;A8E831;
    STA.W Enemy.instList,X                                               ;A8E834;
    LDY.W #EnemyGraphicsDrawnHook_FaceBlock_PeriodicallyCyclePalettes    ;A8E837;
    LDA.W CollectedItems                                                 ;A8E83A;
    BIT.W #$0004                                                         ;A8E83D;
    BNE .morphBallCollected                                              ;A8E840;
    LDY.W #Common_RTL_A0804C                                                    ;A8E842;

  .morphBallCollected:
    STY.W EnemyGraphicsDrawnHook                                         ;A8E845;
    LDA.W #EnemyGraphicsDrawnHook_FaceBlock_PeriodicallyCyclePalettes>>16;A8E848;
    STA.W EnemyGraphicsDrawnHook+2                                       ;A8E84B;
    LDA.W Enemy.palette,X                                                ;A8E84E;
    ASL                                                                  ;A8E851;
    ASL                                                                  ;A8E852;
    ASL                                                                  ;A8E853;
    ASL                                                                  ;A8E854;
    AND.W #$FF00                                                         ;A8E855;
    XBA                                                                  ;A8E858;
    STA.W EnemyPaletteCycle_PaletteIndex                                 ;A8E859;
    LDA.W #$0010                                                         ;A8E85C;
    STA.W EnemyPaletteCycle_Timer                                        ;A8E85F;
    LDA.W FaceBlock.directionToNotTurn,X                                 ;A8E862;
    AND.W #$0001                                                         ;A8E865;
    ROR                                                                  ;A8E868;
    ROR                                                                  ;A8E869;
    STA.W FaceBlock.directionToNotTurn,X                                 ;A8E86A;
    RTL                                                                  ;A8E86D;


;;; $E86E: Enemy graphics drawn hook - blue Brinstar face block - periodically cycle between palettes ;;;
EnemyGraphicsDrawnHook_FaceBlock_PeriodicallyCyclePalettes:
; This enemy doesn't set EnemyPaletteCycle_ColorSetIndex to zero anywhere,
; so visiting a magdollite can cause this routine to execute with EnemyPaletteCycle_ColorSetIndex >= 8,
; giving this enemy a glitch palette for its first palette cycle
    LDA.W DoorTransitionFlagEnemiesPause                                 ;A8E86E;
    BNE .return                                                          ;A8E871;
    LDA.W EnemyPaletteCycle_Timer                                        ;A8E873;
    DEC                                                                  ;A8E876;
    STA.W EnemyPaletteCycle_Timer                                        ;A8E877;
    BNE .return                                                          ;A8E87A;
    LDA.W #$0010                                                         ;A8E87C;
    STA.W EnemyPaletteCycle_Timer                                        ;A8E87F;
    LDA.W EnemyPaletteCycle_PaletteIndex                                 ;A8E882;
    TAX                                                                  ;A8E885;
    LDA.W EnemyPaletteCycle_ColorSetIndex                                ;A8E886;
    ASL                                                                  ;A8E889;
    ASL                                                                  ;A8E88A;
    ASL                                                                  ;A8E88B;
    TAY                                                                  ;A8E88C;
    LDA.W #$0004                                                         ;A8E88D;
    STA.W LoopCounterEnemyDeath                                          ;A8E890;

  .loopColors:
    LDA.W FaceBlockGlowColors,Y                                          ;A8E893;
    STA.L Palettes_SpriteP0+$12,X                                        ;A8E896;
    INY                                                                  ;A8E89A;
    INY                                                                  ;A8E89B;
    INX                                                                  ;A8E89C;
    INX                                                                  ;A8E89D;
    DEC.W LoopCounterEnemyDeath                                          ;A8E89E;
    BNE .loopColors                                                      ;A8E8A1;
    LDA.W EnemyPaletteCycle_ColorSetIndex                                ;A8E8A3;
    INC                                                                  ;A8E8A6;
    AND.W #$0007                                                         ;A8E8A7;
    STA.W EnemyPaletteCycle_ColorSetIndex                                ;A8E8AA;

  .return:
    RTL                                                                  ;A8E8AD;


;;; $E8AE: Main AI - enemy $EA7F (blue Brinstar face block) ;;;
MainAI_FaceBlock:
    LDX.W EnemyIndex                                                     ;A8E8AE;
    LDA.W CollectedItems                                                 ;A8E8B1;
    BIT.W #$0004                                                         ;A8E8B4;
    BEQ .return                                                          ;A8E8B7;
    LDY.W #EnemyGraphicsDrawnHook_FaceBlock_PeriodicallyCyclePalettes    ;A8E8B9;
    STY.W EnemyGraphicsDrawnHook                                         ;A8E8BC;
    LDA.W Enemy.palette,X                                                ;A8E8BF;
    ASL                                                                  ;A8E8C2;
    ASL                                                                  ;A8E8C3;
    ASL                                                                  ;A8E8C4;
    ASL                                                                  ;A8E8C5;
    AND.W #$FF00                                                         ;A8E8C6;
    XBA                                                                  ;A8E8C9;
    STA.W EnemyPaletteCycle_PaletteIndex                                 ;A8E8CA;
    LDA.W FaceBlock.activatedFlag,X                                      ;A8E8CD;
    BNE .return                                                          ;A8E8D0;
    JSL.L Get_SamusY_minus_EnemyY                                        ;A8E8D2;
    JSL.L NegateA_A0B067                                                 ;A8E8D6;
    CMP.W Enemy.init0,X                                                  ;A8E8DA;
    BPL .return                                                          ;A8E8DD;
    JSL.L Get_SamusX_minus_EnemyX                                        ;A8E8DF;
    STA.W FaceBlock.directionToSamus,X                                   ;A8E8E3;
    JSL.L NegateA_A0B067                                                 ;A8E8E6;
    CMP.W Enemy.init0,X                                                  ;A8E8EA;
    BPL .return                                                          ;A8E8ED;
    LDA.W FaceBlock.directionToSamus,X                                   ;A8E8EF;
    AND.W #$8000                                                         ;A8E8F2;
    CMP.W FaceBlock.directionToNotTurn,X                                 ;A8E8F5;
    BEQ .return                                                          ;A8E8F8;
    LDY.W #InstList_FaceBlock_TurningLeft                                ;A8E8FA;
    LDA.W FaceBlock.directionToSamus,X                                   ;A8E8FD;
    BMI .keepLeft                                                        ;A8E900;
    LDY.W #InstList_FaceBlock_TurningRight                               ;A8E902;

  .keepLeft:
    TYA                                                                  ;A8E905;
    STA.W Enemy.instList,X                                               ;A8E906;
    LDA.W #$0001                                                         ;A8E909;
    STA.W Enemy.instTimer,X                                              ;A8E90C;
    LDA.W #$0001                                                         ;A8E90F;
    STA.W FaceBlock.activatedFlag,X                                      ;A8E912;
    LDA.W #$0010                                                         ;A8E915;
    STA.W EnemyPaletteCycle_Timer                                        ;A8E918;

  .return:
    RTL                                                                  ;A8E91B;


;;; $E91C: RTL ;;;
RTL_A8E91C:
    RTL                                                                  ;A8E91C;


;;; $E91D: Enemy shot - enemy $EA7F (blue Brinstar face block) ;;;
EnemyShot_FaceBlock:
; Undeletes the collided projectile!
    LDA.W CollisionIndex                                                 ;A8E91D;
    ASL                                                                  ;A8E920;
    TAX                                                                  ;A8E921;
    LDA.W SamusProjectile_Directions,X                                   ;A8E922;
    AND.W #$FFEF                                                         ;A8E925;
    STA.W SamusProjectile_Directions,X                                   ;A8E928;
    RTL                                                                  ;A8E92B;


;;; $E92C: Blue Brinstar face block spritemaps ;;;
Spritemap_FaceBlock_FacingForward:
    dw $0004                                                             ;A8E92C;
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $107)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 0, $106)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 0, $101)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $100)

Spritemap_FaceBlock_TurningLeft:
    dw $0004                                                             ;A8E942;
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $109)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 0, $108)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 0, $103)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $102)

Spritemap_FaceBlock_FacingLeft:
    dw $0004                                                             ;A8E958;
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $10B)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 0, $10A)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 0, $105)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $104)

Spritemap_FaceBlock_TurningRight:
    dw $0004                                                             ;A8E96E;
    %spritemapEntry(0, $1F8, $00, 0, 1, 3, 0, $109)
    %spritemapEntry(0, $00, $00, 0, 1, 3, 0, $108)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 3, 0, $103)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 0, $102)

Spritemap_FaceBlock_FacingRight:
    dw $0004                                                             ;A8E984;
    %spritemapEntry(0, $1F8, $00, 0, 1, 3, 0, $10B)
    %spritemapEntry(0, $00, $00, 0, 1, 3, 0, $10A)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 3, 0, $105)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 0, $104)


;;; $E99A: Palette - enemy $EABF/$EAFF (green ki-hunter) ;;;
Palette_KihunterGreen:
    dw $3800,$4B57,$3A4D,$0CE2,$0040,$46B0,$2E0B,$1D66                   ;A8E99A;
    dw $1524,$48FF,$38B6,$246E,$1448,$03FF,$0237,$00D1                   ;A8E9AA;


;;; $E9BA: Palette - enemy $EB3F/$EB7F (yellow ki-hunter) ;;;
Palette_KihunterYellow:
    dw $3800,$57FF,$42F7,$158C,$00A5,$4F5A,$36B5,$2610                   ;A8E9BA;
    dw $1DCE,$03E0,$0301,$01A1,$00C1,$6BFA,$42B0,$1545                   ;A8E9CA;


;;; $E9DA: Palette - enemy $EB7F/$EBBF (red ki-hunter) ;;;
Palette_KihunterRed:
    dw $3800,$5ADF,$3975,$0C0A,$0006,$4E1A,$2D33,$1C8E                   ;A8E9DA;
    dw $102B,$6F11,$522A,$3124,$1824,$02FF,$01BF,$000F                   ;A8E9EA;


;;; $E9FA: Instruction list - ki-hunter - idling - facing left ;;;
InstList_Kihunter_Idling_FacingLeft:
    dw $0002,Spritemap_Kihunter_Idling_FacingLeft_0                      ;A8E9FA;
    dw $0002,Spritemap_Kihunter_Idling_FacingLeft_1                      ;A8E9FE;
    dw $0001,Spritemap_Kihunter_Idling_FacingLeft_2                      ;A8EA02;
    dw Instruction_Kihunter_SetIdlingInstListsFacingForwards             ;A8EA06;


;;; $EA08: Instruction list - ki-hunter - swiping - facing left ;;;
InstList_Kihunter_Swiping_FacingLeft:
    dw $0002,Spritemap_Kihunter_Swiping_FacingLeft_1                     ;A8EA08;
    dw $0006,Spritemap_Kihunter_Swiping_FacingLeft_2                     ;A8EA0C;
    dw $0002,Spritemap_Kihunter_Swiping_FacingLeft_1                     ;A8EA10;
    dw $0002,Spritemap_Kihunter_Swiping_FacingLeft_0                     ;A8EA14;
    dw $0002,Spritemap_Kihunter_Swiping_FacingLeft_3                     ;A8EA18;
    dw $0020,Spritemap_Kihunter_Swiping_FacingLeft_4                     ;A8EA1C;
    dw Common_Instruction_GotoY                                          ;A8EA20;
    dw InstList_Kihunter_Idling_FacingLeft                               ;A8EA22;


;;; $EA24: Instruction list - ki-hunter - idling - facing right ;;;
InstList_Kihunter_Idling_FacingRight:
    dw $0002,Spritemap_Kihunter_Idling_FacingRight_0                     ;A8EA24;
    dw $0002,Spritemap_Kihunter_Idling_FacingRight_1                     ;A8EA28;
    dw $0001,Spritemap_Kihunter_Idling_FacingRight_2                     ;A8EA2C;
    dw Instruction_Kihunter_SetIdlingInstListsFacingForwards             ;A8EA30;


;;; $EA32: Instruction list - ki-hunter - swiping - facing right ;;;
InstList_Kihunter_Swiping_FacingRight:
    dw $0002,Spritemap_Kihunter_Swiping_FacingRight_1                    ;A8EA32;
    dw $0006,Spritemap_Kihunter_Swiping_FacingRight_2                    ;A8EA36;
    dw $0002,Spritemap_Kihunter_Swiping_FacingRight_1                    ;A8EA3A;
    dw $0002,Spritemap_Kihunter_Swiping_FacingRight_0                    ;A8EA3E;
    dw $0002,Spritemap_Kihunter_Swiping_FacingRight_3                    ;A8EA42;
    dw $0020,Spritemap_Kihunter_Swiping_FacingRight_4                    ;A8EA46;
    dw Common_Instruction_GotoY                                          ;A8EA4A;
    dw InstList_Kihunter_Idling_FacingRight                              ;A8EA4C;


;;; $EA4E: Instruction list - ki-hunter wings - facing left ;;;
InstList_KihunterWings_FacingLeft:
    dw $0002,Spritemap_KihunterWings_FacingLeft_0                        ;A8EA4E;
    dw $0002,Spritemap_KihunterWings_FacingLeft_1                        ;A8EA52;
    dw $0001,Spritemap_KihunterWings_FacingLeft_2                        ;A8EA56;
    dw Common_Instruction_GotoY                                          ;A8EA5A;
    dw InstList_KihunterWings_FacingLeft                                 ;A8EA5C;


;;; $EA5E: Instruction list - ki-hunter wings - facing right ;;;
InstList_KihunterWings_FacingRight:
    dw $0002,Spritemap_KihunterWings_FacingRight_0                       ;A8EA5E;
    dw $0002,Spritemap_KihunterWings_FacingRight_1                       ;A8EA62;
    dw $0001,Spritemap_KihunterWings_FacingRight_2                       ;A8EA66;
    dw Common_Instruction_GotoY                                          ;A8EA6A;
    dw InstList_KihunterWings_FacingRight                                ;A8EA6C;


if !FEATURE_KEEP_UNREFERENCED
;;; $EA6E: Unused. Instruction list - ki-hunter wings - falling - X flipped ;;;
UNUSED_InstList_KihunterWings_Falling_XFlipped_A8EA6E:
    dw $0010,UNUSED_Spritemap_KihunterWings_Falling_XFlipped_A8EBDF      ;A8EA6E;
    dw Common_Instruction_GotoY                                          ;A8EA72;
    dw UNUSED_InstList_KihunterWings_Falling_XFlipped_A8EA6E             ;A8EA74;


;;; $EA76: Unused. Instruction list - ki-hunter wings - falling - X flipped ;;;
UNUSED_InstList_KihunterWings_Falling_XFlipped_A8EA76:
; Spritemap UNUSED_Spritemap_KihunterWings_Falling_XFlipped_A8EBEB is a clone of Spritemap_Kihunter_6, so this instruction list is a clone of UNUSED_InstList_KihunterWings_Falling_XFlipped_A8EA6E
    dw $0010,UNUSED_Spritemap_KihunterWings_Falling_XFlipped_A8EBEB      ;A8EA76;
    dw Common_Instruction_GotoY                                          ;A8EA7A;
    dw UNUSED_InstList_KihunterWings_Falling_XFlipped_A8EA76             ;A8EA7C;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $EA7E: Instruction list - ki-hunter wings - falling ;;;
InstList_KihunterWings_Falling:
    dw $0001,Spritemap_KihunterWings_Falling                             ;A8EA7E;
    dw Common_Instruction_Sleep                                          ;A8EA82;


if !FEATURE_KEEP_UNREFERENCED
;;; $EA84: Unused. Instruction list - ki-hunter wings - falling ;;;
UNUSED_InstList_KihunterWings_Falling_A8EA84:
; Spritemap UNUSED_Spritemap_KihunterWings_Falling_A8ECB4 is a clone of Spritemap_KihunterWings_Falling, so this instruction list is a clone of InstList_KihunterWings_Falling
    dw $0001,UNUSED_Spritemap_KihunterWings_Falling_A8ECB4               ;A8EA84;
    dw Common_Instruction_Sleep                                          ;A8EA88;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $EA8A: Instruction list - ki-hunter - hop - facing left ;;;
InstList_Kihunter_Hop_FacingLeft:
    dw $0008,Spritemap_Kihunter_Hop_FacingLeft_0                         ;A8EA8A;
    dw $0008,Spritemap_Kihunter_Hop_FacingLeft_1                         ;A8EA8E;
    dw $000B,Spritemap_Kihunter_Hop_FacingLeft_2                         ;A8EA92;
    dw $0002,Spritemap_Kihunter_Hop_FacingLeft_1                         ;A8EA96;
    dw $0002,Spritemap_Kihunter_Hop_FacingLeft_0                         ;A8EA9A;
    dw Instruction_Kihunter_SetFunctionToHop                             ;A8EA9E;
    dw $0001,Spritemap_Kihunter_Hop_FacingLeft_3                         ;A8EAA0;
    dw Common_Instruction_Sleep                                          ;A8EAA4;


;;; $EAA6: Instruction list - ki-hunter - hop - facing right ;;;
InstList_Kihunter_Hop_FacingRight:
    dw $0008,Spritemap_Kihunter_Hop_FacingRight_0                        ;A8EAA6;
    dw $0008,Spritemap_Kihunter_Hop_FacingRight_1                        ;A8EAAA;
    dw $000B,Spritemap_Kihunter_Hop_FacingRight_2                        ;A8EAAE;
    dw $0002,Spritemap_Kihunter_Hop_FacingRight_1                        ;A8EAB2;
    dw $0002,Spritemap_Kihunter_Hop_FacingRight_0                        ;A8EAB6;
    dw Instruction_Kihunter_SetFunctionToHop                             ;A8EABA;
    dw $0001,Spritemap_Kihunter_Hop_FacingRight_3                        ;A8EABC;
    dw Common_Instruction_Sleep                                          ;A8EAC0;


;;; $EAC2: Instruction list - ki-hunter - landed from hop - facing left ;;;
InstList_Kihunter_LandedFromHop_FacingLeft:
    dw $0008,Spritemap_Kihunter_Hop_FacingLeft_0                         ;A8EAC2;
    dw $0008,Spritemap_Kihunter_Hop_FacingLeft_1                         ;A8EAC6;
    dw $000B,Spritemap_Kihunter_Hop_FacingLeft_2                         ;A8EACA;
    dw $0008,Spritemap_Kihunter_Hop_FacingLeft_1                         ;A8EACE;
    dw Instruction_Kihunter_SetFunctionTo_Wingless_Thinking              ;A8EAD2;
    dw $0001,Spritemap_Kihunter_Hop_FacingLeft_0                         ;A8EAD4;
    dw Common_Instruction_Sleep                                          ;A8EAD8;


;;; $EADA: Instruction list - ki-hunter - landed from hop - facing right ;;;
InstList_Kihunter_LandedFromHop_FacingRight:
    dw $0008,Spritemap_Kihunter_Hop_FacingRight_0                        ;A8EADA;
    dw $0008,Spritemap_Kihunter_Hop_FacingRight_1                        ;A8EADE;
    dw $000B,Spritemap_Kihunter_Hop_FacingRight_2                        ;A8EAE2;
    dw $0008,Spritemap_Kihunter_Hop_FacingRight_1                        ;A8EAE6;
    dw Instruction_Kihunter_SetFunctionTo_Wingless_Thinking              ;A8EAEA;
    dw $0001,Spritemap_Kihunter_Hop_FacingRight_0                        ;A8EAEC;
    dw Common_Instruction_Sleep                                          ;A8EAF0;


;;; $EAF2: Instruction list - acid spit attack - facing left ;;;
InstList_Kihunter_AcidSpitAttack_FacingLeft:
    dw $0020,Spritemap_Kihunter_AcidSpitAttack_FacingLeft_0              ;A8EAF2;
    dw $0006,Spritemap_Kihunter_AcidSpitAttack_FacingLeft_1              ;A8EAF6;
    dw $0010,Spritemap_Kihunter_AcidSpitAttack_FacingLeft_2              ;A8EAFA;
    dw $0002,Spritemap_Kihunter_AcidSpitAttack_FacingLeft_3              ;A8EAFE;
    dw Instruction_Kihunter_FireAcidSpitLeft                             ;A8EB02;
    dw $0018,Spritemap_Kihunter_AcidSpitAttack_FacingLeft_4              ;A8EB04;
    dw Instruction_Kihunter_SetFunctionTo_Wingless_Thinking              ;A8EB08;
    dw $0001,Spritemap_Kihunter_AcidSpitAttack_FacingLeft_0              ;A8EB0A;
    dw Common_Instruction_Sleep                                          ;A8EB0E;


;;; $EB10: Instruction list - acid spit attack - facing right ;;;
InstList_Kihunter_AcidSpitAttack_FacingRight:
    dw $0020,Spritemap_Kihunter_AcidSpitAttack_FacingRight_0             ;A8EB10;
    dw $0006,Spritemap_Kihunter_AcidSpitAttack_FacingRight_1             ;A8EB14;
    dw $0010,Spritemap_Kihunter_AcidSpitAttack_FacingRight_2             ;A8EB18;
    dw $0002,Spritemap_Kihunter_AcidSpitAttack_FacingRight_3             ;A8EB1C;
    dw Instruction_Kihunter_FireAcidSpitRight                            ;A8EB20;
    dw $0018,Spritemap_Kihunter_AcidSpitAttack_FacingRight_4             ;A8EB22;
    dw Instruction_Kihunter_SetFunctionTo_Wingless_Thinking              ;A8EB26;
    dw $0001,Spritemap_Kihunter_AcidSpitAttack_FacingRight_0             ;A8EB28;
    dw Common_Instruction_Sleep                                          ;A8EB2C;


;;; $EB2E: Ki-hunter spritemaps ;;;
Spritemap_Kihunter_Idling_FacingLeft_0:
    dw $0008                                                             ;A8EB2E;
    %spritemapEntry(0, $1E5, $03, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $43EB, $FE, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $43F4, $F8, 0, 0, 2, 0, $12C)
    %spritemapEntry(1, $43FD, $01, 0, 0, 2, 0, $11E)
    %spritemapEntry(1, $43FD, $09, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $4200, $00, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $43EF, $F0, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $1E2, $02, 0, 0, 2, 0, $10E)

Spritemap_Kihunter_Idling_FacingLeft_1:
    dw $0008                                                             ;A8EB58;
    %spritemapEntry(0, $1E5, $02, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $43EB, $FD, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $43F4, $F7, 0, 0, 2, 0, $12C)
    %spritemapEntry(1, $43FD, $00, 0, 0, 2, 0, $11E)
    %spritemapEntry(1, $43FD, $08, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $4200, $FF, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $43EF, $EF, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $1E2, $01, 0, 0, 2, 0, $10E)

Spritemap_Kihunter_Idling_FacingLeft_2:
    dw $0008                                                             ;A8EB82;
    %spritemapEntry(0, $1E5, $03, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $43EB, $FE, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $43F4, $F8, 0, 0, 2, 0, $12C)
    %spritemapEntry(1, $43FD, $01, 0, 0, 2, 0, $11E)
    %spritemapEntry(1, $43FD, $09, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $4200, $00, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $43EF, $F0, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $1E2, $02, 0, 0, 2, 0, $10E)

Spritemap_KihunterWings_FacingLeft_0:
    dw $0004                                                             ;A8EBAC;
    %spritemapEntry(0, $0B, $E3, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $01, $E3, 0, 0, 2, 0, $143)
    %spritemapEntry(1, $4209, $EB, 0, 0, 2, 0, $141)
    %spritemapEntry(1, $4201, $EB, 0, 0, 2, 0, $140)

Spritemap_KihunterWings_FacingLeft_1:
    dw $0002                                                             ;A8EBC2;
    %spritemapEntry(0, $12, $FB, 0, 0, 2, 0, $145)
    %spritemapEntry(1, $4202, $F3, 0, 0, 2, 0, $146)

Spritemap_KihunterWings_FacingLeft_2:
    dw $0003                                                             ;A8EBCE;
    %spritemapEntry(0, $11, $F3, 0, 0, 2, 0, $155)
    %spritemapEntry(0, $09, $F3, 0, 0, 2, 0, $154)
    %spritemapEntry(0, $01, $F3, 0, 0, 2, 0, $153)

UNUSED_Spritemap_KihunterWings_Falling_XFlipped_A8EBDF:
    dw $0002                                                             ;A8EBDF;
    %spritemapEntry(1, $43FC, $F8, 0, 0, 2, 0, $149)
    %spritemapEntry(1, $43F4, $F8, 0, 0, 2, 0, $148)

UNUSED_Spritemap_KihunterWings_Falling_XFlipped_A8EBEB:
    dw $0002                                                             ;A8EBEB;
    %spritemapEntry(1, $43FC, $F8, 0, 0, 2, 0, $149)
    %spritemapEntry(1, $43F4, $F8, 0, 0, 2, 0, $148)

Spritemap_Kihunter_Idling_FacingRight_0:
    dw $0008                                                             ;A8EBF7;
    %spritemapEntry(0, $13, $03, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $4205, $FE, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $43FC, $F8, 0, 1, 2, 0, $12C)
    %spritemapEntry(1, $43F3, $01, 0, 1, 2, 0, $11E)
    %spritemapEntry(1, $43F3, $09, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $43F0, $00, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $4201, $F0, 0, 1, 2, 0, $100)
    %spritemapEntry(0, $16, $02, 0, 1, 2, 0, $10E)

Spritemap_Kihunter_Idling_FacingRight_1:
    dw $0008                                                             ;A8EC21;
    %spritemapEntry(0, $13, $02, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $4205, $FD, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $43FC, $F7, 0, 1, 2, 0, $12C)
    %spritemapEntry(1, $43F3, $00, 0, 1, 2, 0, $11E)
    %spritemapEntry(1, $43F3, $08, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $43F0, $FF, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $4201, $EF, 0, 1, 2, 0, $100)
    %spritemapEntry(0, $16, $01, 0, 1, 2, 0, $10E)

Spritemap_Kihunter_Idling_FacingRight_2:
    dw $0008                                                             ;A8EC4B;
    %spritemapEntry(0, $13, $03, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $4205, $FE, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $43FC, $F8, 0, 1, 2, 0, $12C)
    %spritemapEntry(1, $43F3, $01, 0, 1, 2, 0, $11E)
    %spritemapEntry(1, $43F3, $09, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $43F0, $00, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $4201, $F0, 0, 1, 2, 0, $100)
    %spritemapEntry(0, $16, $02, 0, 1, 2, 0, $10E)

Spritemap_KihunterWings_FacingRight_0:
    dw $0004                                                             ;A8EC75;
    %spritemapEntry(0, $1ED, $E3, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1F7, $E3, 0, 1, 2, 0, $143)
    %spritemapEntry(1, $43E7, $EB, 0, 1, 2, 0, $141)
    %spritemapEntry(1, $43EF, $EB, 0, 1, 2, 0, $140)

Spritemap_KihunterWings_FacingRight_1:
    dw $0002                                                             ;A8EC8B;
    %spritemapEntry(0, $1E6, $FB, 0, 1, 2, 0, $145)
    %spritemapEntry(1, $43EE, $F3, 0, 1, 2, 0, $146)

Spritemap_KihunterWings_FacingRight_2:
    dw $0003                                                             ;A8EC97;
    %spritemapEntry(0, $1E7, $F3, 0, 1, 2, 0, $155)
    %spritemapEntry(0, $1EF, $F3, 0, 1, 2, 0, $154)
    %spritemapEntry(0, $1F7, $F3, 0, 1, 2, 0, $153)

Spritemap_KihunterWings_Falling:
    dw $0002                                                             ;A8ECA8;
    %spritemapEntry(1, $43F4, $F8, 0, 1, 2, 0, $149)
    %spritemapEntry(1, $43FC, $F8, 0, 1, 2, 0, $148)

UNUSED_Spritemap_KihunterWings_Falling_A8ECB4:
    dw $0002                                                             ;A8ECB4;
    %spritemapEntry(1, $43F4, $F8, 0, 1, 2, 0, $149)
    %spritemapEntry(1, $43FC, $F8, 0, 1, 2, 0, $148)

Spritemap_Kihunter_Swiping_FacingLeft_0:
    dw $0008                                                             ;A8ECC0;
    %spritemapEntry(0, $1E5, $03, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $43EB, $FE, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $43F4, $F8, 0, 0, 2, 0, $12C)
    %spritemapEntry(1, $43FD, $01, 0, 0, 2, 0, $11E)
    %spritemapEntry(1, $43FD, $09, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $4200, $00, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $43EF, $F0, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $1E2, $02, 0, 0, 2, 0, $10E)

Spritemap_Kihunter_Swiping_FacingLeft_1:
    dw $0008                                                             ;A8ECEA;
    %spritemapEntry(0, $1E9, $F5, 0, 0, 2, 0, $10F)
    %spritemapEntry(1, $43EC, $FA, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $43F4, $F8, 0, 0, 2, 0, $12C)
    %spritemapEntry(1, $43FD, $01, 0, 0, 2, 0, $11E)
    %spritemapEntry(1, $43FD, $09, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $4200, $00, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $43EF, $F0, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $1E6, $F4, 0, 0, 2, 0, $10F)

Spritemap_Kihunter_Swiping_FacingLeft_2:
    dw $0008                                                             ;A8ED14;
    %spritemapEntry(0, $1F0, $F5, 0, 0, 2, 0, $14F)
    %spritemapEntry(1, $43EC, $FA, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $43F4, $F8, 0, 0, 2, 0, $12C)
    %spritemapEntry(1, $43FD, $01, 0, 0, 2, 0, $11E)
    %spritemapEntry(1, $43FD, $09, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $4200, $00, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $43EF, $F0, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $1ED, $F4, 0, 0, 2, 0, $14F)

Spritemap_Kihunter_Swiping_FacingLeft_3:
    dw $0008                                                             ;A8ED3E;
    %spritemapEntry(0, $1E8, $0F, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $43ED, $03, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $43F4, $F9, 0, 0, 2, 0, $12C)
    %spritemapEntry(1, $43FD, $01, 0, 0, 2, 0, $11E)
    %spritemapEntry(1, $43FD, $09, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $4200, $00, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $43EF, $F1, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $1E5, $0E, 0, 0, 2, 0, $10E)

Spritemap_Kihunter_Swiping_FacingLeft_4:
    dw $0008                                                             ;A8ED68;
    %spritemapEntry(1, $43ED, $03, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $1F0, $0F, 0, 0, 2, 0, $14E)
    %spritemapEntry(1, $43F4, $F9, 0, 0, 2, 0, $12C)
    %spritemapEntry(1, $43FD, $02, 0, 0, 2, 0, $11E)
    %spritemapEntry(1, $43FD, $0A, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $4200, $01, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $43EF, $F2, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $1ED, $0E, 0, 0, 2, 0, $14E)

Spritemap_Kihunter_Swiping_FacingRight_0:
    dw $0008                                                             ;A8ED92;
    %spritemapEntry(0, $13, $03, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $4205, $FE, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $43FC, $F8, 0, 1, 2, 0, $12C)
    %spritemapEntry(1, $43F3, $01, 0, 1, 2, 0, $11E)
    %spritemapEntry(1, $43F3, $09, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $43F0, $00, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $4201, $F0, 0, 1, 2, 0, $100)
    %spritemapEntry(0, $16, $02, 0, 1, 2, 0, $10E)

Spritemap_Kihunter_Swiping_FacingRight_1:
    dw $0008                                                             ;A8EDBC;
    %spritemapEntry(0, $0F, $F5, 0, 1, 2, 0, $10F)
    %spritemapEntry(1, $4204, $FA, 0, 1, 2, 0, $128)
    %spritemapEntry(1, $43FC, $F8, 0, 1, 2, 0, $12C)
    %spritemapEntry(1, $43F3, $01, 0, 1, 2, 0, $11E)
    %spritemapEntry(1, $43F3, $09, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $43F0, $00, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $4201, $F0, 0, 1, 2, 0, $100)
    %spritemapEntry(0, $12, $F4, 0, 1, 2, 0, $10F)

Spritemap_Kihunter_Swiping_FacingRight_2:
    dw $0008                                                             ;A8EDE6;
    %spritemapEntry(0, $08, $F5, 0, 1, 2, 0, $14F)
    %spritemapEntry(1, $4204, $FA, 0, 1, 2, 0, $128)
    %spritemapEntry(1, $43FC, $F8, 0, 1, 2, 0, $12C)
    %spritemapEntry(1, $43F3, $01, 0, 1, 2, 0, $11E)
    %spritemapEntry(1, $43F3, $09, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $43F0, $00, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $4201, $F0, 0, 1, 2, 0, $100)
    %spritemapEntry(0, $0B, $F4, 0, 1, 2, 0, $14F)

Spritemap_Kihunter_Swiping_FacingRight_3:
    dw $0008                                                             ;A8EE10;
    %spritemapEntry(0, $10, $0F, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $4203, $03, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $43FC, $F9, 0, 1, 2, 0, $12C)
    %spritemapEntry(1, $43F3, $01, 0, 1, 2, 0, $11E)
    %spritemapEntry(1, $43F3, $09, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $43F0, $00, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $4201, $F1, 0, 1, 2, 0, $100)
    %spritemapEntry(0, $13, $0E, 0, 1, 2, 0, $10E)

Spritemap_Kihunter_Swiping_FacingRight_4:
    dw $0008                                                             ;A8EE3A;
    %spritemapEntry(1, $4203, $03, 0, 1, 2, 0, $124)
    %spritemapEntry(0, $08, $0F, 0, 1, 2, 0, $14E)
    %spritemapEntry(1, $43FC, $F9, 0, 1, 2, 0, $12C)
    %spritemapEntry(1, $43F3, $02, 0, 1, 2, 0, $11E)
    %spritemapEntry(1, $43F3, $0A, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $43F0, $01, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $4201, $F2, 0, 1, 2, 0, $100)
    %spritemapEntry(0, $0B, $0E, 0, 1, 2, 0, $14E)

Spritemap_Kihunter_Hop_FacingLeft_0:
    dw $0008                                                             ;A8EE64;
    %spritemapEntry(0, $1E3, $FF, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $43E9, $FA, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $43F2, $F4, 0, 0, 2, 0, $12C)
    %spritemapEntry(1, $43FA, $F8, 0, 0, 2, 0, $15E)
    %spritemapEntry(1, $43FA, $00, 0, 0, 2, 0, $16E)
    %spritemapEntry(1, $43FE, $FC, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $43EE, $ED, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $1E0, $FE, 0, 0, 2, 0, $10E)

Spritemap_Kihunter_Hop_FacingLeft_1:
    dw $0008                                                             ;A8EE8E;
    %spritemapEntry(0, $1E3, $04, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $43E9, $FF, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $43F2, $F9, 0, 0, 2, 0, $12C)
    %spritemapEntry(1, $43FB, $00, 0, 0, 2, 0, $162)
    %spritemapEntry(1, $43FE, $01, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $43ED, $F1, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $1E0, $03, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $43F9, $FF, 0, 0, 2, 0, $162)

Spritemap_Kihunter_Hop_FacingLeft_2:
    dw $0008                                                             ;A8EEB8;
    %spritemapEntry(0, $1E3, $07, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $43E9, $02, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $43F2, $FC, 0, 0, 2, 0, $12C)
    %spritemapEntry(1, $43FB, $00, 0, 0, 2, 0, $160)
    %spritemapEntry(1, $43FE, $04, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $43ED, $F4, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $1E0, $06, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $43F9, $FF, 0, 0, 2, 0, $160)

Spritemap_Kihunter_Hop_FacingLeft_3:
    dw $0008                                                             ;A8EEE2;
    %spritemapEntry(0, $1E8, $00, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $43EE, $FB, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $43F7, $F5, 0, 0, 2, 0, $12C)
    %spritemapEntry(1, $4200, $FE, 0, 0, 2, 0, $11E)
    %spritemapEntry(1, $4200, $06, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $4203, $FD, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $43F3, $EE, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $1E5, $FF, 0, 0, 2, 0, $10E)

Spritemap_Kihunter_Hop_FacingRight_0:
    dw $0008                                                             ;A8EF0C;
    %spritemapEntry(0, $15, $FF, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $4207, $FA, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $43FE, $F4, 0, 1, 2, 0, $12C)
    %spritemapEntry(1, $43F6, $F8, 0, 1, 2, 0, $15E)
    %spritemapEntry(1, $43F6, $00, 0, 1, 2, 0, $16E)
    %spritemapEntry(1, $43F2, $FC, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $4202, $ED, 0, 1, 2, 0, $100)
    %spritemapEntry(0, $18, $FE, 0, 1, 2, 0, $10E)

Spritemap_Kihunter_Hop_FacingRight_1:
    dw $0008                                                             ;A8EF36;
    %spritemapEntry(0, $15, $04, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $4207, $FF, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $43FE, $F9, 0, 1, 2, 0, $12C)
    %spritemapEntry(1, $43F5, $00, 0, 1, 2, 0, $162)
    %spritemapEntry(1, $43F2, $01, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $4203, $F1, 0, 1, 2, 0, $100)
    %spritemapEntry(0, $18, $03, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $43F7, $FF, 0, 1, 2, 0, $162)

Spritemap_Kihunter_Hop_FacingRight_2:
    dw $0008                                                             ;A8EF60;
    %spritemapEntry(0, $15, $07, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $4207, $02, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $43FE, $FC, 0, 1, 2, 0, $12C)
    %spritemapEntry(1, $43F5, $00, 0, 1, 2, 0, $160)
    %spritemapEntry(1, $43F2, $04, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $4203, $F4, 0, 1, 2, 0, $100)
    %spritemapEntry(0, $18, $06, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $43F7, $FF, 0, 1, 2, 0, $160)

Spritemap_Kihunter_Hop_FacingRight_3:
    dw $0008                                                             ;A8EF8A;
    %spritemapEntry(0, $12, $FF, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $4204, $FA, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $43FB, $F4, 0, 1, 2, 0, $12C)
    %spritemapEntry(1, $43F0, $FE, 0, 1, 2, 0, $11E)
    %spritemapEntry(1, $43F0, $06, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $43EF, $FC, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $43FF, $ED, 0, 1, 2, 0, $100)
    %spritemapEntry(0, $15, $FE, 0, 1, 2, 0, $10E)

Spritemap_Kihunter_AcidSpitAttack_FacingLeft_0:
    dw $0008                                                             ;A8EFB4;
    %spritemapEntry(0, $1E3, $FF, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $43E9, $FA, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $43F2, $F4, 0, 0, 2, 0, $12C)
    %spritemapEntry(1, $43FA, $F8, 0, 0, 2, 0, $15E)
    %spritemapEntry(1, $43FA, $00, 0, 0, 2, 0, $16E)
    %spritemapEntry(1, $43FE, $FC, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $43EE, $ED, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $1E0, $FE, 0, 0, 2, 0, $10E)

Spritemap_Kihunter_AcidSpitAttack_FacingLeft_1:
    dw $0009                                                             ;A8EFDE;
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
    dw $0009                                                             ;A8F00D;
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
    dw $0009                                                             ;A8F03C;
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
    dw $0009                                                             ;A8F06B;
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
    dw $0008                                                             ;A8F09A;
    %spritemapEntry(0, $15, $FF, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $4207, $FA, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $43FE, $F4, 0, 1, 2, 0, $12C)
    %spritemapEntry(1, $43F6, $F8, 0, 1, 2, 0, $15E)
    %spritemapEntry(1, $43F6, $00, 0, 1, 2, 0, $16E)
    %spritemapEntry(1, $43F2, $FC, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $4202, $ED, 0, 1, 2, 0, $100)
    %spritemapEntry(0, $18, $FE, 0, 1, 2, 0, $10E)

Spritemap_Kihunter_AcidSpitAttack_FacingRight_1:
    dw $0009                                                             ;A8F0C4;
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
    dw $0009                                                             ;A8F0F3;
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
    dw $0009                                                             ;A8F122;
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
    dw $0009                                                             ;A8F151;
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
    dw $0060                                                             ;A8F180;
  .fallingAcceleration_hop:
    dw $E000                                                             ;A8F182;
  .fallingAcceleration_wingsClipped:
    dw $0000                                                             ;A8F184;
  .fallingWingsArcRadius:
    dw $0030                                                             ;A8F186;


;;; $F188: Initialisation AI - enemy $EABF/$EB3F/$EBBF (ki-hunter) ;;;
InitAI_Kihunter:
    LDX.W EnemyIndex                                                     ;A8F188;
    LDA.W Enemy.properties,X                                             ;A8F18B;
    ORA.W #$2000                                                         ;A8F18E;
    STA.W Enemy.properties,X                                             ;A8F191;
    LDA.W #$0000                                                         ;A8F194;
    STA.L Kihunter.winglessFlag,X                                        ;A8F197;
    LDA.W #$0001                                                         ;A8F19B;
    STA.W Enemy.instTimer,X                                              ;A8F19E;
    STZ.W Enemy.loopCounter,X                                            ;A8F1A1;
    LDA.W #InstList_Kihunter_Idling_FacingLeft                           ;A8F1A4;
    STA.W Enemy.instList,X                                               ;A8F1A7;
    LDA.W #$0000                                                         ;A8F1AA;
    STA.W Kihunter.arcAngle,X                                            ;A8F1AD;
    LDA.W #Function_Kihunter_Winged_IdleFlying                           ;A8F1B0;
    STA.W Kihunter.function,X                                            ;A8F1B3;
    LDA.W #$0000                                                         ;A8F1B6;
    STA.L Kihunter.YSubVelocity,X                                        ;A8F1B9;
    LDA.W #$0001                                                         ;A8F1BD;
    STA.L Kihunter.YVelocity,X                                           ;A8F1C0;
    LDA.W #$0000                                                         ;A8F1C4;
    STA.L Kihunter.XSubVelocity,X                                        ;A8F1C7;
    LDA.W #$FFFF                                                         ;A8F1CB;
    STA.L Kihunter.XVelocity,X                                           ;A8F1CE;
    LDA.W Enemy.YPosition,X                                              ;A8F1D2;
    SEC                                                                  ;A8F1D5;
    SBC.W #$0010                                                         ;A8F1D6;
    STA.L Kihunter.idleZoneTopPosition,X                                 ;A8F1D9;
    CLC                                                                  ;A8F1DD;
    ADC.W #$0020                                                         ;A8F1DE;
    STA.L Kihunter.idleZoneBottomPosition,X                              ;A8F1E1;
    LDA.W Enemy.XPosition,X                                              ;A8F1E5;
    STA.L Kihunter.spawnXPosition,X                                      ;A8F1E8;
    LDA.W Enemy.YPosition,X                                              ;A8F1EC;
    STA.L Kihunter.spawnYPosition,X                                      ;A8F1EF;
    LDA.W Enemy.init0,X                                                  ;A8F1F3;
    BPL .return                                                          ;A8F1F6;
    LDA.W #$0001                                                         ;A8F1F8;
    STA.L Kihunter.winglessFlag,X                                        ;A8F1FB;
    LDA.W #Function_Kihunter_Wingless_InitialFalling                     ;A8F1FF;
    STA.W Kihunter.function,X                                            ;A8F202;
    LDA.W #$0000                                                         ;A8F205;
    STA.L Kihunter.YSubVelocity,X                                        ;A8F208;
    LDA.W #$0001                                                         ;A8F20C;
    STA.L Kihunter.YVelocity,X                                           ;A8F20F;

  .return:
    RTL                                                                  ;A8F213;


;;; $F214: Initialisation AI - enemy $EAFF/$EB7F/$EBFF (ki-hunter wings) ;;;
InitAI_KihunterWings:
    LDX.W EnemyIndex                                                     ;A8F214;
    LDA.W Enemy.properties,X                                             ;A8F217;
    ORA.W #$2000                                                         ;A8F21A;
    STA.W Enemy.properties,X                                             ;A8F21D;
    LDA.W #$0001                                                         ;A8F220;
    STA.W Enemy.instTimer,X                                              ;A8F223;
    STZ.W Enemy.loopCounter,X                                            ;A8F226;
    LDA.W #InstList_KihunterWings_FacingLeft                             ;A8F229;
    STA.W Enemy.instList,X                                               ;A8F22C;
    LDA.W Enemy[-1].YPosition,X                                          ;A8F22F;
    STA.W Enemy.YPosition,X                                              ;A8F232;
    LDA.W Enemy[-1].XPosition,X                                          ;A8F235;
    STA.W Enemy.XPosition,X                                              ;A8F238;
    LDA.W #Function_KihunterWings_Attached                               ;A8F23B;
    STA.W KihunterWings.function,X                                       ;A8F23E;
    LDA.W Enemy[-1].palette,X                                            ;A8F241;
    STA.W Enemy.palette,X                                                ;A8F244;
    LDA.W Enemy[-1].GFXOffset,X                                          ;A8F247;
    STA.W Enemy.GFXOffset,X                                              ;A8F24A;
    LDA.W Enemy[-1].init0,X                                              ;A8F24D;
    BPL .return                                                          ;A8F250;
    LDA.W Enemy.properties,X                                             ;A8F252;
    ORA.W #$0200                                                         ;A8F255;
    STA.W Enemy.properties,X                                             ;A8F258;

  .return:
    RTL                                                                  ;A8F25B;


;;; $F25C: Main AI - enemy $EABF/$EB3F/$EBBF (ki-hunter) ;;;
MainAI_Kihunter:
    LDX.W EnemyIndex                                                     ;A8F25C;
    JMP.W (Kihunter.function,X)                                          ;A8F25F;


;;; $F262: Main AI - enemy $EAFF/$EB7F/$EBFF (ki-hunter wings) ;;;
MainAI_KihunterWings:
    LDX.W EnemyIndex                                                     ;A8F262;
    JMP.W (KihunterWings.function,X)                                     ;A8F265;


;;; $F268: Ki-hunter function - winged - idle flying ;;;
Function_Kihunter_Winged_IdleFlying:
    LDA.L Kihunter.YSubVelocity,X                                        ;A8F268;
    STA.B DP_Temp12                                                      ;A8F26C;
    LDA.L Kihunter.YVelocity,X                                           ;A8F26E;
    STA.B DP_Temp14                                                      ;A8F272;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8F274;
    BCS .collidedWithBlock                                               ;A8F278;
    LDA.W Enemy.YPosition,X                                              ;A8F27A;
    CMP.L Kihunter.idleZoneTopPosition,X                                 ;A8F27D;
    BMI .idleDown                                                        ;A8F281;
    CMP.L Kihunter.idleZoneBottomPosition,X                              ;A8F283;
    BMI .noChangeY                                                       ;A8F287;
    LDA.W #$FFFF                                                         ;A8F289;
    BRA .changeY                                                         ;A8F28C;

  .collidedWithBlock:
    LDA.L Kihunter.YVelocity,X                                           ;A8F28E;
    EOR.W #$FFFF                                                         ;A8F292;
    INC                                                                  ;A8F295;
    BRA .changeY                                                         ;A8F296;

  .idleDown:
    LDA.W #$0001                                                         ;A8F298;

  .changeY:
    STA.L Kihunter.YVelocity,X                                           ;A8F29B;

  .noChangeY:
    LDA.L Kihunter.XSubVelocity,X                                        ;A8F29F;
    STA.B DP_Temp12                                                      ;A8F2A3;
    LDA.L Kihunter.XVelocity,X                                           ;A8F2A5;
    STA.B DP_Temp14                                                      ;A8F2A9;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A8F2AB;
    BCC .noCollision                                                     ;A8F2AF;
    LDY.W #$0000                                                         ;A8F2B1;
    LDA.L Kihunter.XVelocity,X                                           ;A8F2B4;
    EOR.W #$FFFF                                                         ;A8F2B8;
    INC                                                                  ;A8F2BB;
    STA.L Kihunter.XVelocity,X                                           ;A8F2BC;
    BMI .movingLeft                                                      ;A8F2C0;
    LDY.W #$0004                                                         ;A8F2C2;

  .movingLeft:
    LDA.W .instListPointers_kihunter,Y                                   ;A8F2C5;
    STA.W Enemy.instList,X                                               ;A8F2C8;
    LDA.W .instListPointers_wings,Y                                      ;A8F2CB;
    STA.W Enemy[1].instList,X                                            ;A8F2CE;
    LDA.W #$0001                                                         ;A8F2D1;
    STA.W Enemy.instTimer,X                                              ;A8F2D4;
    STA.W Enemy[1].instTimer,X                                           ;A8F2D7;

  .noCollision:
    JSL.L AlignEnemyYPositionWIthNonSquareSlope                          ;A8F2DA;
    LDA.W SamusXPosition                                                 ;A8F2DE;
    SEC                                                                  ;A8F2E1;
    SBC.W Enemy.XPosition,X                                              ;A8F2E2;
    STA.B DP_Temp12                                                      ;A8F2E5;
    BPL +                                                                ;A8F2E7;
    EOR.W #$FFFF                                                         ;A8F2E9;
    INC                                                                  ;A8F2EC;

+   STA.B DP_Temp14                                                      ;A8F2ED;
    CMP.W KihunterConstants_XProximityToActivateSwoop                    ;A8F2EF;
    BMI +                                                                ;A8F2F2;
    RTL                                                                  ;A8F2F4;

+   LDA.W SamusYPosition                                                 ;A8F2F5;
    SEC                                                                  ;A8F2F8;
    SBC.W Enemy.YPosition,X                                              ;A8F2F9;
    CMP.W #$0020                                                         ;A8F2FC;
    BPL .outsideRange                                                    ;A8F2FF;
    RTL                                                                  ;A8F301;

  .outsideRange:
    STA.B DP_Temp18                                                      ;A8F302;
    LDA.B DP_Temp12                                                      ;A8F304;
    BMI .rightOfSamus                                                    ;A8F306;
    LDA.W #$0002                                                         ;A8F308;
    STA.L Kihunter.arcAngularVelocityCap,X                               ;A8F30B;
    LDA.W #$0000                                                         ;A8F30F;
    STA.L Kihunter.arcAngularVelocity,X                                  ;A8F312;
    STA.L Kihunter.arcAngularSubVelocity,X                               ;A8F316;
    STA.L Kihunter.arcAngularAcceleration,X                              ;A8F31A;
    LDA.W #$2000                                                         ;A8F31E;
    STA.L Kihunter.arcAngularSubAcceleration,X                           ;A8F321;
    LDA.W #$0080                                                         ;A8F325;
    STA.W Kihunter.arcAngle,X                                            ;A8F328;
    LDA.W #$0001                                                         ;A8F32B;
    STA.L Kihunter.XVelocity,X                                           ;A8F32E;
    LDA.W #$0090                                                         ;A8F332;
    STA.L Kihunter.swipeTriggerAngle,X                                   ;A8F335;
    LDY.W #$0004                                                         ;A8F339;
    BRA +                                                                ;A8F33C;

  .rightOfSamus:
    LDA.W #$FFFE                                                         ;A8F33E;
    STA.L Kihunter.arcAngularVelocityCap,X                               ;A8F341;
    LDA.W #$0000                                                         ;A8F345;
    STA.L Kihunter.arcAngularVelocity,X                                  ;A8F348;
    STA.L Kihunter.arcAngularSubVelocity,X                               ;A8F34C;
    LDA.W #$FFFF                                                         ;A8F350;
    STA.L Kihunter.arcAngularAcceleration,X                              ;A8F353;
    STA.L Kihunter.XVelocity,X                                           ;A8F357;
    LDA.W #$E000                                                         ;A8F35B;
    STA.L Kihunter.arcAngularSubAcceleration,X                           ;A8F35E;
    LDA.W #$00FF                                                         ;A8F362;
    STA.W Kihunter.arcAngle,X                                            ;A8F365;
    LDA.W #$00F0                                                         ;A8F368;
    STA.L Kihunter.swipeTriggerAngle,X                                   ;A8F36B;
    LDY.W #$0000                                                         ;A8F36F;

+   LDA.W .instListPointers_kihunter,Y                                   ;A8F372;
    STA.W Enemy.instList,X                                               ;A8F375;
    LDA.W .instListPointers_wings,Y                                      ;A8F378;
    STA.W Enemy[1].instList,X                                            ;A8F37B;
    LDA.W #$0001                                                         ;A8F37E;
    STA.W Enemy.instTimer,X                                              ;A8F381;
    STA.W Enemy[1].instTimer,X                                           ;A8F384;
    LDA.W Enemy.XPosition,X                                              ;A8F387;
    CLC                                                                  ;A8F38A;
    ADC.B DP_Temp12                                                      ;A8F38B;
    STA.W Kihunter.arcCenterXPosition,X                                  ;A8F38D;
    LDA.W Enemy.YPosition,X                                              ;A8F390;
    STA.W Kihunter.arcCenterYPosition,X                                  ;A8F393;
    LDA.W #Function_Kihunter_Winged_Swoop                                ;A8F396;
    STA.W Kihunter.function,X                                            ;A8F399;
    LDA.B DP_Temp18                                                      ;A8F39C;
    STA.L Kihunter.arcYRadius,X                                          ;A8F39E;
    LDA.B DP_Temp14                                                      ;A8F3A2;
    STA.L Kihunter.arcXRadius,X                                          ;A8F3A4;
    LDA.W #$0000                                                         ;A8F3A8;
    STA.L Kihunter.swoopSwipeFlag,X                                      ;A8F3AB;
    RTL                                                                  ;A8F3AF;

  .instListPointers_kihunter:
    dw InstList_Kihunter_Idling_FacingLeft                               ;A8F3B0;
  .instListPointers_wings:
    dw InstList_KihunterWings_FacingLeft                                 ;A8F3B2;
    dw InstList_Kihunter_Idling_FacingRight                              ;A8F3B4;
    dw InstList_KihunterWings_FacingRight                                ;A8F3B6;


;;; $F3B8: Ki-hunter function - winged - swoop ;;;
Function_Kihunter_Winged_Swoop:
    LDA.L Kihunter.arcAngularAcceleration,X                              ;A8F3B8;
    BPL .arcingRight                                                     ;A8F3BC;
    LDA.W Kihunter.arcAngle,X                                            ;A8F3BE;
    CMP.L Kihunter.swipeTriggerAngle,X                                   ;A8F3C1;
    BPL .noInstListChange                                                ;A8F3C5;
    BRA +                                                                ;A8F3C7;

  .arcingRight:
    LDA.W Kihunter.arcAngle,X                                            ;A8F3C9;
    CMP.L Kihunter.swipeTriggerAngle,X                                   ;A8F3CC;
    BMI .noInstListChange                                                ;A8F3D0;

+   LDA.L Kihunter.swoopSwipeFlag,X                                      ;A8F3D2;
    BNE .noInstListChange                                                ;A8F3D6;
    LDA.W #$0001                                                         ;A8F3D8;
    STA.L Kihunter.swoopSwipeFlag,X                                      ;A8F3DB;
    LDY.W #InstList_Kihunter_Swiping_FacingRight                         ;A8F3DF;
    LDA.L Kihunter.arcAngularAcceleration,X                              ;A8F3E2;
    BPL .keepRight                                                       ;A8F3E6;
    LDY.W #InstList_Kihunter_Swiping_FacingLeft                          ;A8F3E8;

  .keepRight:
    TYA                                                                  ;A8F3EB;
    STA.W Enemy.instList,X                                               ;A8F3EC;
    LDA.W #$0001                                                         ;A8F3EF;
    STA.W Enemy.instTimer,X                                              ;A8F3F2;

  .noInstListChange:
    LDA.L Kihunter.arcAngularAcceleration,X                              ;A8F3F5;
    BPL .rightwards                                                      ;A8F3F9;
    LDA.L Kihunter.arcAngularSubVelocity,X                               ;A8F3FB;
    CLC                                                                  ;A8F3FF;
    ADC.L Kihunter.arcAngularSubAcceleration,X                           ;A8F400;
    STA.L Kihunter.arcAngularSubVelocity,X                               ;A8F404;
    LDA.L Kihunter.arcAngularVelocity,X                                  ;A8F408;
    ADC.L Kihunter.arcAngularAcceleration,X                              ;A8F40C;
    CMP.L Kihunter.arcAngularVelocityCap,X                               ;A8F410;
    BPL +                                                                ;A8F414;
    LDA.L Kihunter.arcAngularVelocityCap,X                               ;A8F416;

+   STA.L Kihunter.arcAngularVelocity,X                                  ;A8F41A;
    LDA.W Kihunter.arcAngle,X                                            ;A8F41E;
    CLC                                                                  ;A8F421;
    ADC.L Kihunter.arcAngularVelocity,X                                  ;A8F422;
    STA.W Kihunter.arcAngle,X                                            ;A8F426;
    CMP.W #$0080                                                         ;A8F429;
    BPL .swoopContinues                                                  ;A8F42C;
    LDA.W #Function_Kihunter_Winged_IdleFlying                           ;A8F42E;
    STA.W Kihunter.function,X                                            ;A8F431;
    RTL                                                                  ;A8F434;

  .rightwards:
    LDA.L Kihunter.arcAngularSubVelocity,X                               ;A8F435;
    CLC                                                                  ;A8F439;
    ADC.L Kihunter.arcAngularSubAcceleration,X                           ;A8F43A;
    STA.L Kihunter.arcAngularSubVelocity,X                               ;A8F43E;
    LDA.L Kihunter.arcAngularVelocity,X                                  ;A8F442;
    ADC.L Kihunter.arcAngularAcceleration,X                              ;A8F446;
    CMP.L Kihunter.arcAngularVelocityCap,X                               ;A8F44A;
    BMI +                                                                ;A8F44E;
    LDA.L Kihunter.arcAngularVelocityCap,X                               ;A8F450;

+   STA.L Kihunter.arcAngularVelocity,X                                  ;A8F454;
    LDA.W Kihunter.arcAngle,X                                            ;A8F458;
    CLC                                                                  ;A8F45B;
    ADC.L Kihunter.arcAngularVelocity,X                                  ;A8F45C;
    STA.W Kihunter.arcAngle,X                                            ;A8F460;
    CMP.W #$0100                                                         ;A8F463;
    BMI .swoopContinues                                                  ;A8F466;
    LDA.W #Function_Kihunter_Winged_IdleFlying                           ;A8F468;
    STA.W Kihunter.function,X                                            ;A8F46B;
    RTL                                                                  ;A8F46E;

  .swoopContinues:
    LDA.L Kihunter.arcXRadius,X                                          ;A8F46F;
    STA.W Temp_Unknown0E32                                               ;A8F473;
    LDA.W Kihunter.arcAngle,X                                            ;A8F476;
    JSL.L EightBitCosineMultiplication_A0B0B2                            ;A8F479;
    CLC                                                                  ;A8F47D;
    ADC.W Kihunter.arcCenterXPosition,X                                  ;A8F47E;
    SEC                                                                  ;A8F481;
    SBC.W Enemy.XPosition,X                                              ;A8F482;
    STA.B DP_Temp14                                                      ;A8F485;
    STZ.B DP_Temp12                                                      ;A8F487;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A8F489;
    BCS .collidedHorizontally                                            ;A8F48D;
    JSL.L AlignEnemyYPositionWIthNonSquareSlope                          ;A8F48F;
    LDA.L Kihunter.arcYRadius,X                                          ;A8F493;
    STA.W Temp_Unknown0E32                                               ;A8F497;
    LDA.W Kihunter.arcAngle,X                                            ;A8F49A;
    JSL.L EightBitNegativeSineMultiplication_A0B0C6                      ;A8F49D;
    CLC                                                                  ;A8F4A1;
    ADC.W Kihunter.arcCenterYPosition,X                                  ;A8F4A2;
    SEC                                                                  ;A8F4A5;
    SBC.W Enemy.YPosition,X                                              ;A8F4A6;
    STA.B DP_Temp14                                                      ;A8F4A9;
    STZ.B DP_Temp12                                                      ;A8F4AB;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8F4AD;
    BCS .collidedVertically                                              ;A8F4B1;
    RTL                                                                  ;A8F4B3;

  .collidedHorizontally:
    LDA.L Kihunter.arcAngularAcceleration,X                              ;A8F4B4;
    BPL .arcRight                                                        ;A8F4B8;
    LDA.W #$0000                                                         ;A8F4BA;
    STA.L Kihunter.XSubVelocity,X                                        ;A8F4BD;
    LDA.W #$0001                                                         ;A8F4C1;
    STA.L Kihunter.XVelocity,X                                           ;A8F4C4;
    BRA .collidedVertically                                              ;A8F4C8;

  .arcRight:
    LDA.W #$0000                                                         ;A8F4CA;
    STA.L Kihunter.XSubVelocity,X                                        ;A8F4CD;
    LDA.W #$FFFF                                                         ;A8F4D1;
    STA.L Kihunter.XVelocity,X                                           ;A8F4D4;

  .collidedVertically:
    LDA.W #Function_Kihunter_Winged_BackOff                              ;A8F4D8;
    STA.W Kihunter.function,X                                            ;A8F4DB;
    LDA.W #$0000                                                         ;A8F4DE;
    STA.L Kihunter.YSubVelocity,X                                        ;A8F4E1;
    LDA.W #$FFFF                                                         ;A8F4E5;
    STA.L Kihunter.YVelocity,X                                           ;A8F4E8;
    RTL                                                                  ;A8F4EC;


;;; $F4ED: Ki-hunter function - winged - back off ;;;
Function_Kihunter_Winged_BackOff:
    LDA.L Kihunter.XSubVelocity,X                                        ;A8F4ED;
    STA.B DP_Temp12                                                      ;A8F4F1;
    LDA.L Kihunter.XVelocity,X                                           ;A8F4F3;
    STA.B DP_Temp14                                                      ;A8F4F7;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A8F4F9;
    BCS .collidedWithBlock                                               ;A8F4FD;
    JSL.L AlignEnemyYPositionWIthNonSquareSlope                          ;A8F4FF;
    LDA.L Kihunter.YSubVelocity,X                                        ;A8F503;
    STA.B DP_Temp12                                                      ;A8F507;
    LDA.L Kihunter.YVelocity,X                                           ;A8F509;
    STA.B DP_Temp14                                                      ;A8F50D;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8F50F;
    BCS .collidedWithBlock                                               ;A8F513;
    LDA.W Enemy.YPosition,X                                              ;A8F515;
    CMP.L Kihunter.spawnYPosition,X                                      ;A8F518;
    BMI .collidedWithBlock                                               ;A8F51C;
    RTL                                                                  ;A8F51E;

  .collidedWithBlock:
    LDA.W #Function_Kihunter_Winged_IdleFlying                           ;A8F51F;
    STA.W Kihunter.function,X                                            ;A8F522;
    RTL                                                                  ;A8F525;


;;; $F526: Instruction - set idling instruction lists facing forwards ;;;
Instruction_Kihunter_SetIdlingInstListsFacingForwards:
    LDY.W #InstList_Kihunter_Idling_FacingLeft                           ;A8F526;
    LDA.W #InstList_KihunterWings_FacingLeft                             ;A8F529;
    STA.B DP_Temp12                                                      ;A8F52C;
    LDA.L Kihunter.XVelocity,X                                           ;A8F52E;
    BMI .keepLeft                                                        ;A8F532;
    LDY.W #InstList_Kihunter_Idling_FacingRight                          ;A8F534;
    LDA.W #InstList_KihunterWings_FacingRight                            ;A8F537;
    STA.B DP_Temp12                                                      ;A8F53A;

  .keepLeft:
    TYA                                                                  ;A8F53C;
    STA.W Enemy.instList,X                                               ;A8F53D;
    LDA.W #$0001                                                         ;A8F540;
    STA.W Enemy.instTimer,X                                              ;A8F543;
    LDA.W Enemy[1].var0,X                                                ;A8F546;
    CMP.W #Function_KihunterWings_Attached                               ;A8F549;
    BNE .return                                                          ;A8F54C;
    LDA.B DP_Temp12                                                      ;A8F54E;
    STA.W Enemy[1].instList,X                                            ;A8F550;
    LDA.W #$0001                                                         ;A8F553;
    STA.W Enemy[1].instTimer,X                                           ;A8F556;

  .return:
    RTL                                                                  ;A8F559;


;;; $F55A: Ki-hunter function - wingless - initial falling ;;;
Function_Kihunter_Wingless_InitialFalling:
    LDA.L Kihunter.YSubVelocity,X                                        ;A8F55A;
    STA.B DP_Temp12                                                      ;A8F55E;
    LDA.L Kihunter.YVelocity,X                                           ;A8F560;
    STA.B DP_Temp14                                                      ;A8F564;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8F566;
    BCC .notCollidedWithBlock                                            ;A8F56A;
    LDA.W #Function_Kihunter_Wingless_PrepareToHop                       ;A8F56C;
    STA.W Kihunter.function,X                                            ;A8F56F;
    RTL                                                                  ;A8F572;

  .notCollidedWithBlock:
    LDA.L Kihunter.YSubVelocity,X                                        ;A8F573;
    CLC                                                                  ;A8F577;
    ADC.W KihunterConstants_fallingAcceleration_hop                      ;A8F578;
    STA.L Kihunter.YSubVelocity,X                                        ;A8F57B;
    LDA.L Kihunter.YVelocity,X                                           ;A8F57F;
    ADC.W KihunterConstants_fallingAcceleration_wingsClipped             ;A8F583;
    STA.L Kihunter.YVelocity,X                                           ;A8F586;
    RTL                                                                  ;A8F58A;


;;; $F58B: Ki-hunter function - wingless - prepare to hop ;;;
Function_Kihunter_Wingless_PrepareToHop:
    LDA.W #RTL_A8F5E3                                                    ;A8F58B;
    STA.W Kihunter.function,X                                            ;A8F58E;
    LDA.W #$0000                                                         ;A8F591;
    STA.L Kihunter.YSubVelocity,X                                        ;A8F594;
    LDA.W RandomNumberSeed                                               ;A8F598;
    AND.W #$0001                                                         ;A8F59B;
    CLC                                                                  ;A8F59E;
    ADC.W #$FFF8                                                         ;A8F59F;
    STA.L Kihunter.YVelocity,X                                           ;A8F5A2;
    LDA.W Enemy.XPosition,X                                              ;A8F5A6;
    CMP.W SamusXPosition                                                 ;A8F5A9;
    BPL .rightOfSamus                                                    ;A8F5AC;
    LDA.W #$0000                                                         ;A8F5AE;
    STA.L Kihunter.XSubVelocity,X                                        ;A8F5B1;
    LDA.W #$0002                                                         ;A8F5B5;
    STA.L Kihunter.XVelocity,X                                           ;A8F5B8;
    LDA.W #InstList_Kihunter_Hop_FacingRight                             ;A8F5BC;
    STA.W Enemy.instList,X                                               ;A8F5BF;
    LDA.W #$0001                                                         ;A8F5C2;
    STA.W Enemy.instTimer,X                                              ;A8F5C5;
    RTL                                                                  ;A8F5C8;

  .rightOfSamus:
    LDA.W #$0000                                                         ;A8F5C9;
    STA.L Kihunter.XSubVelocity,X                                        ;A8F5CC;
    LDA.W #$FFFE                                                         ;A8F5D0;
    STA.L Kihunter.XVelocity,X                                           ;A8F5D3;
    LDA.W #InstList_Kihunter_Hop_FacingLeft                              ;A8F5D7;
    STA.W Enemy.instList,X                                               ;A8F5DA;
    LDA.W #$0001                                                         ;A8F5DD;
    STA.W Enemy.instTimer,X                                              ;A8F5E0; fallthrough to RTL_A8F5E3


RTL_A8F5E3:
    RTL                                                                  ;A8F5E3;


;;; $F5E4: Instruction - enemy function = hop ;;;
Instruction_Kihunter_SetFunctionToHop:
    PHX                                                                  ;A8F5E4;
    LDX.W EnemyIndex                                                     ;A8F5E5;
    LDA.W #Function_Kihunter_Wingless_Hop                                ;A8F5E8;
    STA.W Kihunter.function,X                                            ;A8F5EB;
    PLX                                                                  ;A8F5EE;
    RTL                                                                  ;A8F5EF;


;;; $F5F0: Ki-hunter function - wingless - hop ;;;
Function_Kihunter_Wingless_Hop:
    LDA.L Kihunter.YSubVelocity,X                                        ;A8F5F0;
    STA.B DP_Temp12                                                      ;A8F5F4;
    LDA.L Kihunter.YVelocity,X                                           ;A8F5F6;
    STA.B DP_Temp14                                                      ;A8F5FA;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8F5FC;
    BCS .collidedVertically                                              ;A8F600;
    LDA.L Kihunter.XSubVelocity,X                                        ;A8F602;
    STA.B DP_Temp12                                                      ;A8F606;
    LDA.L Kihunter.XVelocity,X                                           ;A8F608;
    STA.B DP_Temp14                                                      ;A8F60C;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A8F60E;
    BCS .collidedHorizontally                                            ;A8F612;
    JSL.L AlignEnemyYPositionWIthNonSquareSlope                          ;A8F614;
    LDA.L Kihunter.YSubVelocity,X                                        ;A8F618;
    CLC                                                                  ;A8F61C;
    ADC.W KihunterConstants_fallingAcceleration_hop                      ;A8F61D;
    STA.L Kihunter.YSubVelocity,X                                        ;A8F620;
    LDA.L Kihunter.YVelocity,X                                           ;A8F624;
    ADC.W KihunterConstants_fallingAcceleration_wingsClipped             ;A8F628;
    STA.L Kihunter.YVelocity,X                                           ;A8F62B;
    RTL                                                                  ;A8F62F;

  .collidedHorizontally:
    LDA.L Kihunter.XVelocity,X                                           ;A8F630;
    EOR.W #$FFFF                                                         ;A8F634;
    INC                                                                  ;A8F637;
    STA.L Kihunter.XVelocity,X                                           ;A8F638;
    RTL                                                                  ;A8F63C;

  .collidedVertically:
    LDA.L Kihunter.YVelocity,X                                           ;A8F63D;
    BMI .hitCeiling                                                      ;A8F641;
    LDA.W #$0000                                                         ;A8F643;
    STA.L Kihunter.YSubVelocity,X                                        ;A8F646;
    LDA.W #$FFFC                                                         ;A8F64A;
    STA.L Kihunter.YVelocity,X                                           ;A8F64D;
    LDA.W #RTL_A8F5E3                                                    ;A8F651;
    STA.W Kihunter.function,X                                            ;A8F654;
    LDA.W #$000C                                                         ;A8F657;
    STA.L Kihunter.thinkingTimer,X                                       ;A8F65A;
    LDY.W #InstList_Kihunter_LandedFromHop_FacingLeft                    ;A8F65E;
    LDA.W Enemy.instList,X                                               ;A8F661;
    CMP.W #InstList_Kihunter_Hop_FacingRight                             ;A8F664;
    BMI .keepLeft                                                        ;A8F667;
    LDY.W #InstList_Kihunter_LandedFromHop_FacingRight                   ;A8F669;

  .keepLeft:
    TYA                                                                  ;A8F66C;
    STA.W Enemy.instList,X                                               ;A8F66D;
    LDA.W #$0001                                                         ;A8F670;
    STA.W Enemy.instTimer,X                                              ;A8F673;
    RTL                                                                  ;A8F676;

  .hitCeiling:
    LDA.W #$0001                                                         ;A8F677;
    STA.L Kihunter.YVelocity,X                                           ;A8F67A;
    RTL                                                                  ;A8F67E;


;;; $F67F: Instruction - enemy function = wingless - thinking ;;;
Instruction_Kihunter_SetFunctionTo_Wingless_Thinking:
    PHX                                                                  ;A8F67F;
    LDX.W EnemyIndex                                                     ;A8F680;
    LDA.W #Function_Kihunter_Wingless_Thinking                           ;A8F683;
    STA.W Kihunter.function,X                                            ;A8F686;
    PLX                                                                  ;A8F689;
    RTL                                                                  ;A8F68A;


;;; $F68B: Ki-hunter function - wingless - thinking ;;;
Function_Kihunter_Wingless_Thinking:
    LDA.L Kihunter.thinkingTimer,X                                       ;A8F68B;
    DEC                                                                  ;A8F68F;
    STA.L Kihunter.thinkingTimer,X                                       ;A8F690;
    BNE .return                                                          ;A8F694;
    LDY.W #Function_Kihunter_Wingless_PrepareToHop                       ;A8F696;
    LDA.W Enemy.XPosition,X                                              ;A8F699;
    SEC                                                                  ;A8F69C;
    SBC.W SamusXPosition                                                 ;A8F69D;
    BPL +                                                                ;A8F6A0;
    EOR.W #$FFFF                                                         ;A8F6A2;
    INC                                                                  ;A8F6A5;

+   CMP.W #$0060                                                         ;A8F6A6;
    BPL .keepHop                                                         ;A8F6A9;
    LDY.W #Function_Kihunter_Wingless_FireAcidSpit                       ;A8F6AB;

  .keepHop:
    TYA                                                                  ;A8F6AE;
    STA.W Kihunter.function,X                                            ;A8F6AF;

  .return:
    RTL                                                                  ;A8F6B2;


;;; $F6B3: Ki-hunter function - wingless - fire acid spit ;;;
Function_Kihunter_Wingless_FireAcidSpit:
    LDY.W #InstList_Kihunter_AcidSpitAttack_FacingLeft                   ;A8F6B3;
    LDA.W Enemy.XPosition,X                                              ;A8F6B6;
    CMP.W SamusXPosition                                                 ;A8F6B9;
    BPL .keepLeft                                                        ;A8F6BC;
    LDY.W #InstList_Kihunter_AcidSpitAttack_FacingRight                  ;A8F6BE;

  .keepLeft:
    TYA                                                                  ;A8F6C1;
    STA.W Enemy.instList,X                                               ;A8F6C2;
    LDA.W #$0001                                                         ;A8F6C5;
    STA.W Enemy.instTimer,X                                              ;A8F6C8;
    LDA.W #RTL_A8F5E3                                                    ;A8F6CB;
    STA.W Kihunter.function,X                                            ;A8F6CE;
    RTL                                                                  ;A8F6D1;


;;; $F6D2: Instruction - fire acid spit left ;;;
Instruction_Kihunter_FireAcidSpitLeft:
    PHY                                                                  ;A8F6D2;
    LDY.W #EnemyProjectile_KiHunterAcidSpit_Left                         ;A8F6D3;
    BRA FireAcidSpit                                                     ;A8F6D6;


;;; $F6D8: Instruction - fire acid spit right ;;;
Instruction_Kihunter_FireAcidSpitRight:
    PHY                                                                  ;A8F6D8;
    LDY.W #EnemyProjectile_KiHunterAcidSpit_Right                        ;A8F6D9; fallthrough to FireAcidSpit


;;; $F6DC: Fire acid spit ;;;
FireAcidSpit:
;; Parameters:
;;     Y: Enemy projectile ID

; Expects a pushed instruction list pointer
    LDA.W #$004C                                                         ;A8F6DC;
    JSL.L QueueSound_Lib2_Max6                                           ;A8F6DF;
    LDX.W EnemyIndex                                                     ;A8F6E3;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A8F6E6;
    LDA.W #$0018                                                         ;A8F6EA;
    STA.L Kihunter.thinkingTimer,X                                       ;A8F6ED;
    PLY                                                                  ;A8F6F1;
    RTL                                                                  ;A8F6F2;


;;; $F6F3: Ki-hunter wings function - attached ;;;
Function_KihunterWings_Attached:
    LDA.W Enemy[-1].XPosition,X                                          ;A8F6F3;
    STA.W Enemy.XPosition,X                                              ;A8F6F6;
    LDA.W Enemy[-1].YPosition,X                                          ;A8F6F9;
    STA.W Enemy.YPosition,X                                              ;A8F6FC;
    RTL                                                                  ;A8F6FF;


;;; $F700: RTL ;;;
RTL_A8F700:
    RTL                                                                  ;A8F700;


;;; $F701: Enemy shot - enemy $EABF/$EB3F/$EBBF (ki-hunter) ;;;
EnemyShot_Kihunter:
    JSL.L NormalEnemyShotAI_Internal                                     ;A8F701;
    LDX.W EnemyIndex                                                     ;A8F705;
    LDA.W Enemy.health,X                                                 ;A8F708;
    BEQ .dead                                                            ;A8F70B;
    CMP.W Enemy[1].init0,X                                               ;A8F70D;
    BEQ .clipWings                                                       ;A8F710;
    BMI .clipWings                                                       ;A8F712;
    LDA.W Enemy.AI,X                                                     ;A8F714;
    STA.W Enemy[1].AI,X                                                  ;A8F717;
    LDA.W Enemy.freezeTimer,X                                            ;A8F71A;
    STA.W Enemy[1].freezeTimer,X                                         ;A8F71D;
    LDA.W Enemy.invincibilityTimer,X                                     ;A8F720;
    STA.W Enemy[1].invincibilityTimer,X                                  ;A8F723;
    LDA.W Enemy.flashTimer,X                                             ;A8F726;
    STA.W Enemy[1].flashTimer,X                                          ;A8F729;

  .returnUpper:
    RTL                                                                  ;A8F72C;

  .dead:
    LDA.W #$0200                                                         ;A8F72D;
    STA.W Enemy[1].properties,X                                          ;A8F730;
    RTL                                                                  ;A8F733;

  .clipWings:
    LDA.L Kihunter.winglessFlag,X                                        ;A8F734;
    BNE .returnUpper                                                     ;A8F738;
    LDA.W #$0001                                                         ;A8F73A;
    STA.L Kihunter.winglessFlag,X                                        ;A8F73D;
    LDA.W #Function_Kihunter_Wingless_InitialFalling                     ;A8F741;
    STA.W Kihunter.function,X                                            ;A8F744;
    LDA.W #$0000                                                         ;A8F747;
    STA.L Kihunter.YSubVelocity,X                                        ;A8F74A;
    LDA.W #$0001                                                         ;A8F74E;
    STA.L Kihunter.YVelocity,X                                           ;A8F751;
    PHX                                                                  ;A8F755;
    TXA                                                                  ;A8F756;
    CLC                                                                  ;A8F757;
    ADC.W #$0040                                                         ;A8F758;
    STA.W EnemyIndex                                                     ;A8F75B;
    TAX                                                                  ;A8F75E;
    LDA.W KihunterWings.function,X                                       ;A8F75F;
    CMP.W #Function_KihunterWings_Falling                                ;A8F762;
    BEQ .returnLower                                                     ;A8F765;
    LDA.W Enemy.YPosition,X                                              ;A8F767;
    STA.L Kihunter.XVelocity,X                                           ;A8F76A;
    LDA.W Enemy.XPosition,X                                              ;A8F76E;
    STA.L Kihunter.YSubVelocity,X                                        ;A8F771;
    JSR.W DetermineFallingKihunterWingsSpeedTableIndexResetValue         ;A8F775;
    JSR.W DetermineFallingKihunterWingsLeftArcCenterOffsets              ;A8F778;
    JSR.W DetermineFallingKihunterWingsRightArcCenterOffsets             ;A8F77B;
    LDA.W #$E000                                                         ;A8F77E;
    STA.W KihunterWings.arcAngle,X                                       ;A8F781;
    LDA.W #Function_KihunterWings_Falling                                ;A8F784;
    STA.W KihunterWings.function,X                                       ;A8F787;
    LDA.W #Function_KihunterWings_Falling_DriftingLeft                   ;A8F78A;
    STA.L KihunterWings.fallingFunction,X                                ;A8F78D;
    LDA.L Kihunter.XVelocity,X                                           ;A8F791;
    SEC                                                                  ;A8F795;
    SBC.L Kihunter.idleZoneBottomPosition,X                              ;A8F796;
    STA.L Kihunter.XSubVelocity,X                                        ;A8F79A;
    LDA.W Enemy.XPosition,X                                              ;A8F79E;
    STA.L Kihunter.arcAngularSubAcceleration,X                           ;A8F7A1;
    LDA.L KihunterWings.speedTableResetValue,X                           ;A8F7A5;
    STA.W KihunterWings.speedTableIndex,X                                ;A8F7A9;
    LDA.W #InstList_KihunterWings_Falling                                ;A8F7AC;
    STA.W Enemy.instList,X                                               ;A8F7AF;
    LDA.W #Common_Spritemap_Nothing                                      ;A8F7B2;
    STA.W Enemy.spritemap,X                                              ;A8F7B5;
    LDA.W #$0001                                                         ;A8F7B8;
    STA.W Enemy.instTimer,X                                              ;A8F7BB;
    STZ.W Enemy.loopCounter,X                                            ;A8F7BE;
    LDA.W Enemy.properties,X                                             ;A8F7C1;
    ORA.W #$0800                                                         ;A8F7C4;
    STA.W Enemy.properties,X                                             ;A8F7C7;

  .returnLower:
    PLA                                                                  ;A8F7CA;
    STA.W EnemyIndex                                                     ;A8F7CB;
    RTL                                                                  ;A8F7CE;


;;; $F7CF: Ki-hunter wings function - falling ;;;
Function_KihunterWings_Falling:
    LDX.W EnemyIndex                                                     ;A8F7CF;
    LDA.L KihunterWings.fallingFunction,X                                ;A8F7D2;
    STA.B DP_Temp12                                                      ;A8F7D6;
    JMP.W (DP_Temp12)                                                        ;A8F7D8;


;;; $F7DB: Ki-hunter wings falling function - drifting left ;;;
Function_KihunterWings_Falling_DriftingLeft:
    LDX.W EnemyIndex                                                     ;A8F7DB;
    LDA.W KihunterWings.speedTableIndex,X                                ;A8F7DE;
    AND.W #$FF00                                                         ;A8F7E1;
    XBA                                                                  ;A8F7E4;
    ASL                                                                  ;A8F7E5;
    ASL                                                                  ;A8F7E6;
    ASL                                                                  ;A8F7E7;
    TAY                                                                  ;A8F7E8;
    LDA.W KihunterWings.arcAngle,X                                       ;A8F7E9;
    CLC                                                                  ;A8F7EC;
    ADC.W Common_EnemySpeeds_QuadraticallyIncreasing+5,Y                  ;A8F7ED;
    STA.W KihunterWings.arcAngle,X                                       ;A8F7F0;
    LDA.W KihunterConstants_fallingWingsArcRadius                        ;A8F7F3;
    AND.W #$00FF                                                         ;A8F7F6;
    STA.W Temp_Unknown0E32                                               ;A8F7F9;
    LDA.W KihunterWings.arcAngle,X                                       ;A8F7FC;
    XBA                                                                  ;A8F7FF;
    AND.W #$00FF                                                         ;A8F800;
    JSL.L EightBitNegativeSineMultiplication_A0B0C6                      ;A8F803;
    SEC                                                                  ;A8F807;
    SBC.L KihunterWings.leftArcCenterYOffset,X                           ;A8F808;
    CLC                                                                  ;A8F80C;
    ADC.L KihunterWings.arcStartYPosition,X                              ;A8F80D;
    STA.W Enemy.YPosition,X                                              ;A8F811;
    LDA.W KihunterConstants_fallingWingsArcRadius                        ;A8F814;
    AND.W #$00FF                                                         ;A8F817;
    STA.W Temp_Unknown0E32                                               ;A8F81A;
    LDA.W KihunterWings.arcAngle,X                                       ;A8F81D;
    XBA                                                                  ;A8F820;
    AND.W #$00FF                                                         ;A8F821;
    JSL.L EightBitCosineMultiplication_A0B0B2                            ;A8F824;
    SEC                                                                  ;A8F828;
    SBC.L KihunterWings.leftArcCenterXOffset,X                           ;A8F829;
    CLC                                                                  ;A8F82D;
    ADC.L KihunterWings.arcStartXPosition,X                              ;A8F82E;
    STA.W Enemy.XPosition,X                                              ;A8F832;
    LDA.W KihunterWings.arcAngle,X                                       ;A8F835;
    CMP.W #$C000                                                         ;A8F838;
    BPL +                                                                ;A8F83B;
    JSR.W SetupFallingKihunterWingsDriftingRight                         ;A8F83D;
    RTL                                                                  ;A8F840;

+   LDA.W KihunterWings.speedTableIndex,X                                ;A8F841;
    SEC                                                                  ;A8F844;
    SBC.W #$0180                                                         ;A8F845;
    BPL .return                                                          ;A8F848;
    LDA.W #$0100                                                         ;A8F84A;

  .return:
    STA.W KihunterWings.speedTableIndex,X                                ;A8F84D;
    RTL                                                                  ;A8F850;


;;; $F851: Determine falling ki-hunter wings left arc centre offsets ;;;
DetermineFallingKihunterWingsLeftArcCenterOffsets:
    LDX.W EnemyIndex                                                     ;A8F851;
    LDA.W KihunterConstants_fallingWingsArcRadius                        ;A8F854;
    AND.W #$00FF                                                         ;A8F857;
    STA.W Temp_Unknown0E32                                               ;A8F85A;
    LDA.W #$E000                                                         ;A8F85D;
    XBA                                                                  ;A8F860;
    JSL.L EightBitCosineMultiplication_A0B0B2                            ;A8F861;
    STA.L KihunterWings.leftArcCenterXOffset,X                           ;A8F865;
    LDA.W KihunterConstants_fallingWingsArcRadius                        ;A8F869;
    AND.W #$00FF                                                         ;A8F86C;
    STA.W Temp_Unknown0E32                                               ;A8F86F;
    LDA.W #$E000                                                         ;A8F872;
    XBA                                                                  ;A8F875;
    JSL.L EightBitNegativeSineMultiplication_A0B0C6                      ;A8F876;
    STA.L KihunterWings.leftArcCenterYOffset,X                           ;A8F87A;
    RTS                                                                  ;A8F87E;


;;; $F87F: Determine falling ki-hunter wings right arc centre offsets ;;;
DetermineFallingKihunterWingsRightArcCenterOffsets:
    LDX.W EnemyIndex                                                     ;A8F87F;
    LDA.W KihunterConstants_fallingWingsArcRadius                        ;A8F882;
    AND.W #$00FF                                                         ;A8F885;
    STA.W Temp_Unknown0E32                                               ;A8F888;
    LDA.W #$A000                                                         ;A8F88B;
    XBA                                                                  ;A8F88E;
    JSL.L EightBitCosineMultiplication_A0B0B2                            ;A8F88F;
    STA.L KihunterWings.rightArcCenterXOffset,X                          ;A8F893;
    LDA.W KihunterConstants_fallingWingsArcRadius                        ;A8F897;
    AND.W #$00FF                                                         ;A8F89A;
    STA.W Temp_Unknown0E32                                               ;A8F89D;
    LDA.W #$A000                                                         ;A8F8A0;
    XBA                                                                  ;A8F8A3;
    JSL.L EightBitNegativeSineMultiplication_A0B0C6                      ;A8F8A4;
    STA.L KihunterWings.rightArcCenterYOffset,X                          ;A8F8A8;
    RTS                                                                  ;A8F8AC;


;;; $F8AD: Ki-hunter wings falling function - drifting right ;;;
Function_KihunterWings_Falling_DriftingRight:
    LDX.W EnemyIndex                                                     ;A8F8AD;
    LDA.W KihunterWings.speedTableIndex,X                                ;A8F8B0;
    AND.W #$FF00                                                         ;A8F8B3;
    XBA                                                                  ;A8F8B6;
    ASL                                                                  ;A8F8B7;
    ASL                                                                  ;A8F8B8;
    ASL                                                                  ;A8F8B9;
    TAY                                                                  ;A8F8BA;
    LDA.W KihunterWings.arcAngle,X                                       ;A8F8BB;
    CLC                                                                  ;A8F8BE;
    ADC.W Common_EnemySpeeds_QuadraticallyIncreasing+1,Y                  ;A8F8BF;
    STA.W KihunterWings.arcAngle,X                                       ;A8F8C2;
    LDA.W KihunterConstants_fallingWingsArcRadius                        ;A8F8C5;
    AND.W #$00FF                                                         ;A8F8C8;
    STA.W Temp_Unknown0E32                                               ;A8F8CB;
    LDA.W KihunterWings.arcAngle,X                                       ;A8F8CE;
    XBA                                                                  ;A8F8D1;
    AND.W #$00FF                                                         ;A8F8D2;
    JSL.L EightBitNegativeSineMultiplication_A0B0C6                      ;A8F8D5;
    SEC                                                                  ;A8F8D9;
    SBC.L KihunterWings.rightArcCenterYOffset,X                          ;A8F8DA;
    CLC                                                                  ;A8F8DE;
    ADC.L KihunterWings.arcStartYPosition,X                              ;A8F8DF;
    SEC                                                                  ;A8F8E3;
    SBC.W Enemy.YPosition,X                                              ;A8F8E4;
    STA.B DP_Temp14                                                      ;A8F8E7;
    STZ.B DP_Temp12                                                      ;A8F8E9;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8F8EB;
    BCS .collidedVertically                                              ;A8F8EF;
    LDA.W KihunterConstants_fallingWingsArcRadius                        ;A8F8F1;
    AND.W #$00FF                                                         ;A8F8F4;
    STA.W Temp_Unknown0E32                                               ;A8F8F7;
    LDA.W KihunterWings.arcAngle,X                                       ;A8F8FA;
    XBA                                                                  ;A8F8FD;
    AND.W #$00FF                                                         ;A8F8FE;
    JSL.L EightBitCosineMultiplication_A0B0B2                            ;A8F901;
    SEC                                                                  ;A8F905;
    SBC.L KihunterWings.rightArcCenterXOffset,X                          ;A8F906;
    CLC                                                                  ;A8F90A;
    ADC.L KihunterWings.arcStartXPosition,X                              ;A8F90B;
    STA.W Enemy.XPosition,X                                              ;A8F90F;
    LDA.W KihunterWings.arcAngle,X                                       ;A8F912;
    CMP.W #$C000                                                         ;A8F915;
    BMI +                                                                ;A8F918;
    JSR.W SetupFallingKihunterWingsDriftingLeft                          ;A8F91A;
    RTL                                                                  ;A8F91D;

+   LDA.W KihunterWings.speedTableIndex,X                                ;A8F91E;
    SEC                                                                  ;A8F921;
    SBC.W #$0180                                                         ;A8F922;
    BPL .return                                                          ;A8F925;
    LDA.W #$0100                                                         ;A8F927;

  .return:
    STA.W KihunterWings.speedTableIndex,X                                ;A8F92A;
    RTL                                                                  ;A8F92D;

  .collidedVertically:
    LDA.W Enemy.properties,X                                             ;A8F92E;
    ORA.W #$0200                                                         ;A8F931;
    STA.W Enemy.properties,X                                             ;A8F934;
    LDA.L KihunterWings.fallStartYPosition,X                             ;A8F937;
    STA.W Enemy.XPosition,X                                              ;A8F93B;
    LDA.L KihunterWings.fallStartXPosition,X                             ;A8F93E;
    STA.W Enemy.YPosition,X                                              ;A8F942;
    BRA .return                                                          ;A8F945;


;;; $F947: Set up falling ki-hunter wings drifting left ;;;
SetupFallingKihunterWingsDriftingLeft:
    LDA.W #Function_KihunterWings_Falling_DriftingLeft                   ;A8F947;
    STA.L KihunterWings.fallingFunction,X                                ;A8F94A;
    LDA.L KihunterWings.speedTableResetValue,X                           ;A8F94E;
    STA.W KihunterWings.speedTableIndex,X                                ;A8F952;
    LDA.W #$E000                                                         ;A8F955;
    STA.W KihunterWings.arcAngle,X                                       ;A8F958;
    LDA.W Enemy.XPosition,X                                              ;A8F95B;
    STA.L KihunterWings.arcStartXPosition,X                              ;A8F95E;
    LDA.W Enemy.YPosition,X                                              ;A8F962;
    STA.L KihunterWings.arcStartYPosition,X                              ;A8F965;
    RTS                                                                  ;A8F969;


;;; $F96A: Set up falling ki-hunter wings drifting right ;;;
SetupFallingKihunterWingsDriftingRight:
    LDA.W #Function_KihunterWings_Falling_DriftingRight                  ;A8F96A;
    STA.L KihunterWings.fallingFunction,X                                ;A8F96D;
    LDA.L KihunterWings.speedTableResetValue,X                           ;A8F971;
    STA.W KihunterWings.speedTableIndex,X                                ;A8F975;
    LDA.W #$A000                                                         ;A8F978;
    STA.W KihunterWings.arcAngle,X                                       ;A8F97B;
    LDA.W Enemy.XPosition,X                                              ;A8F97E;
    STA.L KihunterWings.arcStartXPosition,X                              ;A8F981;
    LDA.W Enemy.YPosition,X                                              ;A8F985;
    STA.L KihunterWings.arcStartYPosition,X                              ;A8F988;
    RTS                                                                  ;A8F98C;


;;; $F98D: Determine falling ki-hunter wings speed table index reset value ;;;
DetermineFallingKihunterWingsSpeedTableIndexResetValue:
    LDX.W EnemyIndex                                                     ;A8F98D;
    LDA.W #$0000                                                         ;A8F990;
    STA.L KihunterWings.speedTableResetValue,X                           ;A8F993;
    STA.W KihunterWings.speedTableIndex,X                                ;A8F997;

  .loop:
    LDA.L KihunterWings.speedTableResetValue,X                           ;A8F99A;
    CLC                                                                  ;A8F99E;
    ADC.W #$0180                                                         ;A8F99F;
    STA.L KihunterWings.speedTableResetValue,X                           ;A8F9A2;
    AND.W #$FF00                                                         ;A8F9A6;
    XBA                                                                  ;A8F9A9;
    ASL                                                                  ;A8F9AA;
    ASL                                                                  ;A8F9AB;
    ASL                                                                  ;A8F9AC;
    TAY                                                                  ;A8F9AD;
    LDA.W KihunterWings.angleAccumulator,X                               ;A8F9AE;
    CLC                                                                  ;A8F9B1;
    ADC.W Common_EnemySpeeds_QuadraticallyIncreasing+1,Y                  ;A8F9B2;
    STA.W KihunterWings.angleAccumulator,X                               ;A8F9B5;
    CMP.W #$2000                                                         ;A8F9B8;
    BMI .loop                                                            ;A8F9BB;
    RTS                                                                  ;A8F9BD;


Freespace_BankA8_F9BE:                                                   ;A8F9BE;
; $642 bytes
