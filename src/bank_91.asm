
org $918000


NormalSamusPoseInputHandler:
    PHP                                                                  ;918000;
    PHB                                                                  ;918001;
    PHK                                                                  ;918002;
    PLB                                                                  ;918003;
    REP #$30                                                             ;918004;
    LDA.W $0A1F                                                          ;918006;
    AND.W #$00FF                                                         ;918009;
    ASL A                                                                ;91800C;
    TAX                                                                  ;91800D;
    JSR.W (.pointers,X)                                                  ;91800E;
    PLB                                                                  ;918011;
    PLP                                                                  ;918012;
    RTL                                                                  ;918013;


.pointers:
    dw NormalSamusPoseInputHandler_Standing                              ;918014;
    dw NormalSamusPoseInputHandler_1_Running                             ;918016;
    dw NormalSamusPoseInputHandler_NormalJumping                         ;918018;
    dw NormalSamusPoseInputHandler_SpinJumping                           ;91801A;
    dw NormalSamusPoseInputHandler_MorphBall_OnGround                    ;91801C;
    dw NormalSamusPoseInputHandler_Crouching                             ;91801E;
    dw NormalSamusPoseInputHandler_Falling                               ;918020;
    dw RTS_918086                                                        ;918022;
    dw NormalSamusPoseInputHandler_MorphBall_Falling                     ;918024;
    dw RTS_918112                                                        ;918026;
    dw NormalSamusPoseInputHandler_Knockback_CrystalFlashEnding          ;918028;
    dw RTS_91812D                                                        ;91802A;
    dw NormalSamusPoseInputHandler_C_DetermineProspectivePose            ;91802C;
    dw NormalSamusPoseInputHandler_D_DetermineProspectivePose            ;91802E;
    dw NormalSamusPoseInputHandler_TurningAround_OnGround                ;918030;
    dw RTS_918146                                                        ;918032;
    dw NormalSamusPoseInputHandler_Moonwalking                           ;918034;
    dw NormalSamusPoseInputHandler_SpringBall_OnGround                   ;918036;
    dw NormalSamusPoseInputHandler_SpringBall_InAir                      ;918038;
    dw NormalSamusPoseInputHandler_SpringBall_Falling                    ;91803A;
    dw NormalSamusPoseInputHandler_WallJumping                           ;91803C;
    dw NormalSamusPoseInputHandler_RanIntoAWall                          ;91803E;
    dw NormalSamusPoseInputHandler_Grappling                             ;918040;
    dw NormalSamusPoseInputHandler_TurningAround_Jumping                 ;918042;
    dw NormalSamusPoseInputHandler_TurningAround_Falling                 ;918044;
    dw NormalSamusPoseInputHandler_DamageBoost                           ;918046;
    dw NormalSamusPoseInputHandler_GrabbedByDraygon                      ;918048;
    dw NormalSamusPoseInputHandler_Shinespark_CF_Drained_DamagedMB       ;91804A;

RTS_91804C:
    RTS                                                                  ;91804C;


NormalSamusPoseInputHandler_Standing:
    PHP                                                                  ;91804D;
    REP #$30                                                             ;91804E;
    LDA.W $0A1C                                                          ;918050;
    BEQ .facingForward                                                   ;918053;
    CMP.W #$009B                                                         ;918055;
    BEQ .facingForward                                                   ;918058;
    BRA .notFacingForward                                                ;91805A;


.facingForward:
    LDA.W $0E18                                                          ;91805C;
    BNE .return                                                          ;91805F;

.notFacingForward:
    JSR.W DetermineProspectivePoseFromTransitionTable                    ;918061;

.return:
    PLP                                                                  ;918064;
    RTS                                                                  ;918065;


NormalSamusPoseInputHandler_1_Running:
    PHP                                                                  ;918066;
    REP #$30                                                             ;918067;
    JSR.W DetermineProspectivePoseFromTransitionTable                    ;918069;
    PLP                                                                  ;91806C;
    RTS                                                                  ;91806D;


NormalSamusPoseInputHandler_NormalJumping:
    PHP                                                                  ;91806E;
    REP #$30                                                             ;91806F;
    JSR.W DetermineProspectivePoseFromTransitionTable                    ;918071;
    PLP                                                                  ;918074;
    RTS                                                                  ;918075;


NormalSamusPoseInputHandler_SpinJumping:
    PHP                                                                  ;918076;
    REP #$30                                                             ;918077;
    JSR.W DetermineProspectivePoseFromTransitionTable                    ;918079;
    PLP                                                                  ;91807C;
    RTS                                                                  ;91807D;


NormalSamusPoseInputHandler_MorphBall_OnGround:
    PHP                                                                  ;91807E;
    REP #$30                                                             ;91807F;
    JSR.W DetermineProspectivePoseFromTransitionTable                    ;918081;
    PLP                                                                  ;918084;
    RTS                                                                  ;918085;


RTS_918086:
    RTS                                                                  ;918086;


NormalSamusPoseInputHandler_Crouching:
    PHP                                                                  ;918087;
    REP #$30                                                             ;918088;
    LDA.W $0A78                                                          ;91808A;
    BNE .timeIsFrozen                                                    ;91808D;
    JSR.W DetermineProspectivePoseFromTransitionTable                    ;91808F;
    LDA.W $0A1F                                                          ;918092;
    AND.W #$00FF                                                         ;918095;
    BNE .return                                                          ;918098;
    LDA.W $0AFA                                                          ;91809A;
    SEC                                                                  ;91809D;
    SBC.W #$0005                                                         ;91809E;
    STA.W $0AFA                                                          ;9180A1;
    LDA.W $0B14                                                          ;9180A4;
    SEC                                                                  ;9180A7;
    SBC.W #$0005                                                         ;9180A8;
    STA.W $0B14                                                          ;9180AB;
    BRA .return                                                          ;9180AE;


.timeIsFrozen:
    JSL.L XraySamusPoseInputHandler                                      ;9180B0;

.return:
    PLP                                                                  ;9180B4;
    RTS                                                                  ;9180B5;


NormalSamusPoseInputHandler_Falling:
    PHP                                                                  ;9180B6;
    REP #$30                                                             ;9180B7;
    JSR.W DetermineProspectivePoseFromTransitionTable                    ;9180B9;
    PLP                                                                  ;9180BC;
    RTS                                                                  ;9180BD;


if !FEATURE_KEEP_UNREFERENCED
UNUSED_AutoJumpFromCrouchFall_9180BE:
    LDA.W $0A1C                                                          ;9180BE;
    CMP.W #$0029                                                         ;9180C1;
    BEQ .fallingNotAiming                                                ;9180C4;
    CMP.W #$002A                                                         ;9180C6;
    BNE .return                                                          ;9180C9;

.fallingNotAiming:
    LDA.W $0A27                                                          ;9180CB;
    AND.W #$00FF                                                         ;9180CE;
    CMP.W #$0005                                                         ;9180D1;
    BEQ .return                                                          ;9180D4;
    LDA.B $8B                                                            ;9180D6;
    BIT.W #$0300                                                         ;9180D8;
    BNE .return                                                          ;9180DB;
    LDA.W $0B2E                                                          ;9180DD;
    BNE .return                                                          ;9180E0;
    LDA.B $8F                                                            ;9180E2;
    BIT.W $09B4                                                          ;9180E4;
    BEQ .return                                                          ;9180E7;
    LDA.W $0A1E                                                          ;9180E9;
    AND.W #$00FF                                                         ;9180EC;
    CMP.W #$0004                                                         ;9180EF;
    BEQ .facingLeft                                                      ;9180F2;
    LDA.W #$004D                                                         ;9180F4;
    STA.W $0A2A                                                          ;9180F7;
    BRA .command4                                                        ;9180FA;


.facingLeft:
    LDA.W #$004E                                                         ;9180FC;
    STA.W $0A2A                                                          ;9180FF;

.command4:
    LDA.W #$0004                                                         ;918102;
    STA.W $0A30                                                          ;918105;

.return:
    PLP                                                                  ;918108;
    RTS                                                                  ;918109;
endif ; !FEATURE_KEEP_UNREFERENCED


NormalSamusPoseInputHandler_MorphBall_Falling:
    PHP                                                                  ;91810A;
    REP #$30                                                             ;91810B;
    JSR.W DetermineProspectivePoseFromTransitionTable                    ;91810D;
    PLP                                                                  ;918110;
    RTS                                                                  ;918111;


RTS_918112:
    RTS                                                                  ;918112;


NormalSamusPoseInputHandler_Knockback_CrystalFlashEnding:
    PHP                                                                  ;918113;
    REP #$30                                                             ;918114;
    JSR.W DetermineProspectivePoseFromTransitionTable                    ;918116;
    LDA.W $0A1F                                                          ;918119;
    AND.W #$00FF                                                         ;91811C;
    CMP.W #$000A                                                         ;91811F;
    BEQ .return                                                          ;918122;
    JSL.L Make_Samus_Jump                                                ;918124;
    STZ.W $18AA                                                          ;918128;

.return:
    PLP                                                                  ;91812B;
    RTS                                                                  ;91812C;


RTS_91812D:
    PHP                                                                  ;91812D;
    REP #$30                                                             ;91812E;
    PLP                                                                  ;918130;
    RTS                                                                  ;918131;


NormalSamusPoseInputHandler_C_DetermineProspectivePose:
    PHP                                                                  ;918132;
    REP #$30                                                             ;918133;
    JSR.W DetermineProspectivePoseFromTransitionTable                    ;918135;
    PLP                                                                  ;918138;
    RTS                                                                  ;918139;


NormalSamusPoseInputHandler_D_DetermineProspectivePose:
    PHP                                                                  ;91813A;
    REP #$30                                                             ;91813B;
    JSR.W DetermineProspectivePoseFromTransitionTable                    ;91813D;
    PLP                                                                  ;918140;
    RTS                                                                  ;918141;


NormalSamusPoseInputHandler_TurningAround_OnGround:
    JSR.W DetermineProspectivePoseFromTransitionTable                    ;918142;
    RTS                                                                  ;918145;


RTS_918146:
    RTS                                                                  ;918146;


NormalSamusPoseInputHandler_Moonwalking:
    PHP                                                                  ;918147;
    REP #$30                                                             ;918148;
    JSR.W DetermineProspectivePoseFromTransitionTable                    ;91814A;
    PLP                                                                  ;91814D;
    RTS                                                                  ;91814E;


NormalSamusPoseInputHandler_SpringBall_OnGround:
    PHP                                                                  ;91814F;
    REP #$30                                                             ;918150;
    JSR.W DetermineProspectivePoseFromTransitionTable                    ;918152;
    PLP                                                                  ;918155;
    RTS                                                                  ;918156;


NormalSamusPoseInputHandler_SpringBall_InAir:
    PHP                                                                  ;918157;
    REP #$30                                                             ;918158;
    JSR.W DetermineProspectivePoseFromTransitionTable                    ;91815A;
    PLP                                                                  ;91815D;
    RTS                                                                  ;91815E;


NormalSamusPoseInputHandler_SpringBall_Falling:
    PHP                                                                  ;91815F;
    REP #$30                                                             ;918160;
    JSR.W DetermineProspectivePoseFromTransitionTable                    ;918162;
    PLP                                                                  ;918165;
    RTS                                                                  ;918166;


NormalSamusPoseInputHandler_WallJumping:
    PHP                                                                  ;918167;
    REP #$30                                                             ;918168;
    JSR.W DetermineProspectivePoseFromTransitionTable                    ;91816A;
    PLP                                                                  ;91816D;
    RTS                                                                  ;91816E;


NormalSamusPoseInputHandler_RanIntoAWall:
    PHP                                                                  ;91816F;
    REP #$30                                                             ;918170;
    LDA.W $0A78                                                          ;918172;
    BNE .timeIsFrozen                                                    ;918175;
    JSR.W DetermineProspectivePoseFromTransitionTable                    ;918177;
    BRA .return                                                          ;91817A;


.timeIsFrozen:
    JSR.W XraySamusPoseInputHandler                                      ;91817C; >_<

.return:
    PLP                                                                  ;91817F;
    RTS                                                                  ;918180;


NormalSamusPoseInputHandler_Grappling:
    PHP                                                                  ;918181;
    REP #$30                                                             ;918182;
    JSR.W DetermineProspectivePoseFromTransitionTable                    ;918184;
    PLP                                                                  ;918187;
    RTS                                                                  ;918188;


NormalSamusPoseInputHandler_TurningAround_Jumping:
    JSR.W DetermineProspectivePoseFromTransitionTable                    ;918189;
    RTS                                                                  ;91818C;


NormalSamusPoseInputHandler_TurningAround_Falling:
    JSR.W DetermineProspectivePoseFromTransitionTable                    ;91818D;
    RTS                                                                  ;918190;


NormalSamusPoseInputHandler_DamageBoost:
    PHP                                                                  ;918191;
    REP #$30                                                             ;918192;
    JSR.W DetermineProspectivePoseFromTransitionTable                    ;918194;
    PLP                                                                  ;918197;
    RTS                                                                  ;918198;


NormalSamusPoseInputHandler_GrabbedByDraygon:
    PHP                                                                  ;918199;
    REP #$30                                                             ;91819A;
    JSR.W DetermineProspectivePoseFromTransitionTable                    ;91819C;
    PLP                                                                  ;91819F;
    RTS                                                                  ;9181A0;


NormalSamusPoseInputHandler_Shinespark_CF_Drained_DamagedMB:
    PHP                                                                  ;9181A1;
    REP #$30                                                             ;9181A2;
    JSR.W DetermineProspectivePoseFromTransitionTable                    ;9181A4;
    PLP                                                                  ;9181A7;
    RTS                                                                  ;9181A8;


DetermineProspectivePoseFromTransitionTable:
    LDA.B $8B                                                            ;9181A9;
    BEQ .noInput                                                         ;9181AB;
    JSR.W TranslateCustomControllerBindingsToDefaultBindings             ;9181AD;
    LDA.W $0A1C                                                          ;9181B0;
    ASL A                                                                ;9181B3;
    TAX                                                                  ;9181B4;
    LDA.W TransitionTable,X                                              ;9181B5;
    TAY                                                                  ;9181B8;
    LDA.W $0000,Y                                                        ;9181B9;
    INC A                                                                ;9181BC;
    BEQ .notFound                                                        ;9181BD;

.loop:
    DEC A                                                                ;9181BF;
    BEQ .input                                                           ;9181C0;
    AND.B $12                                                            ;9181C2;
    BNE .next                                                            ;9181C4;

.input:
    LDA.W $0002,Y                                                        ;9181C6;
    BEQ .foundTransition                                                 ;9181C9;
    AND.B $14                                                            ;9181CB;
    BEQ .foundTransition                                                 ;9181CD;

.next:
    TYA                                                                  ;9181CF;
    CLC                                                                  ;9181D0;
    ADC.W #$0006                                                         ;9181D1;
    TAY                                                                  ;9181D4;
    LDA.W $0000,Y                                                        ;9181D5;
    INC A                                                                ;9181D8;
    BNE .loop                                                            ;9181D9;

.noInput:
    STZ.W $0A18                                                          ;9181DB;
    JSL.L HandleTransitionTableLookupFailure                             ;9181DE;

.notFound:
    CLC                                                                  ;9181E2;
    RTS                                                                  ;9181E3;


.foundTransition:
    LDA.W $0004,Y                                                        ;9181E4;
    CMP.W $0A1C                                                          ;9181E7;
    BEQ .notFound                                                        ;9181EA;
    STA.W $0A28                                                          ;9181EC;
    STZ.W $0A56                                                          ;9181EF;
    SEC                                                                  ;9181F2;
    RTS                                                                  ;9181F3;


TranslateCustomControllerBindingsToDefaultBindings:
    LDA.B $8F                                                            ;9181F4;
    AND.W #$0F00                                                         ;9181F6;
    STA.B $12                                                            ;9181F9;
    LDA.B $8B                                                            ;9181FB;
    AND.W #$0F00                                                         ;9181FD;
    STA.B $14                                                            ;918200;
    LDA.B $8F                                                            ;918202;
    BIT.W $09B2                                                          ;918204;
    BEQ .checkJump12                                                     ;918207;
    LDA.B $12                                                            ;918209;
    ORA.W #$0040                                                         ;91820B;
    STA.B $12                                                            ;91820E;
    LDA.B $8F                                                            ;918210;

.checkJump12:
    BIT.W $09B4                                                          ;918212;
    BEQ .checkRun12                                                      ;918215;
    LDA.B $12                                                            ;918217;
    ORA.W #$0080                                                         ;918219;
    STA.B $12                                                            ;91821C;
    LDA.B $8F                                                            ;91821E;

.checkRun12:
    BIT.W $09B6                                                          ;918220;
    BEQ .checkItemCancel12                                               ;918223;
    LDA.B $12                                                            ;918225;
    ORA.W #$8000                                                         ;918227;
    STA.B $12                                                            ;91822A;
    LDA.B $8F                                                            ;91822C;

.checkItemCancel12:
    BIT.W $09B8                                                          ;91822E;
    BEQ .checkAimUp12                                                    ;918231;
    LDA.B $12                                                            ;918233;
    ORA.W #$4000                                                         ;918235;
    STA.B $12                                                            ;918238;
    LDA.B $8F                                                            ;91823A;

.checkAimUp12:
    BIT.W $09BE                                                          ;91823C;
    BEQ .checkAimDown12                                                  ;91823F;
    LDA.W $09BE                                                          ;918241;
    BIT.W #$0030                                                         ;918244;
    BEQ .reloadNewInputs                                                 ;918247;
    LDA.B $12                                                            ;918249;
    ORA.W #$0010                                                         ;91824B;
    STA.B $12                                                            ;91824E;

.reloadNewInputs:
    LDA.B $8F                                                            ;918250;

.checkAimDown12:
    BIT.W $09BC                                                          ;918252;
    BEQ .checkShot14                                                     ;918255;
    LDA.W $09BC                                                          ;918257;
    BIT.W #$0030                                                         ;91825A;
    BEQ .checkShot14                                                     ;91825D;
    LDA.B $12                                                            ;91825F;
    ORA.W #$0020                                                         ;918261;
    STA.B $12                                                            ;918264;

.checkShot14:
    LDA.B $12                                                            ;918266;
    EOR.W #$FFFF                                                         ;918268;
    STA.B $12                                                            ;91826B;
    LDA.B $8B                                                            ;91826D;
    BIT.W $09B2                                                          ;91826F;
    BEQ .checkJump14                                                     ;918272;
    LDA.B $14                                                            ;918274;
    ORA.W #$0040                                                         ;918276;
    STA.B $14                                                            ;918279;
    LDA.B $8B                                                            ;91827B;

.checkJump14:
    BIT.W $09B4                                                          ;91827D;
    BEQ .checkRun14                                                      ;918280;
    LDA.B $14                                                            ;918282;
    ORA.W #$0080                                                         ;918284;
    STA.B $14                                                            ;918287;
    LDA.B $8B                                                            ;918289;

.checkRun14:
    BIT.W $09B6                                                          ;91828B;
    BEQ .checkItemCancel14                                               ;91828E;
    LDA.B $14                                                            ;918290;
    ORA.W #$8000                                                         ;918292;
    STA.B $14                                                            ;918295;
    LDA.B $8B                                                            ;918297;

.checkItemCancel14:
    BIT.W $09B8                                                          ;918299;
    BEQ .checkAimUp14                                                    ;91829C;
    LDA.B $14                                                            ;91829E;
    ORA.W #$4000                                                         ;9182A0;
    STA.B $14                                                            ;9182A3;
    LDA.B $8B                                                            ;9182A5;

.checkAimUp14:
    BIT.W $09BE                                                          ;9182A7;
    BEQ .checkAimDown14                                                  ;9182AA;
    LDA.W $09BE                                                          ;9182AC;
    BIT.W #$0030                                                         ;9182AF;
    BEQ .reloadPressedInputs                                             ;9182B2;
    LDA.B $14                                                            ;9182B4;
    ORA.W #$0010                                                         ;9182B6;
    STA.B $14                                                            ;9182B9;

.reloadPressedInputs:
    LDA.B $8B                                                            ;9182BB;

.checkAimDown14:
    BIT.W $09BC                                                          ;9182BD;
    BEQ .done                                                            ;9182C0;
    LDA.W $09BC                                                          ;9182C2;
    BIT.W #$0030                                                         ;9182C5;
    BEQ .done                                                            ;9182C8;
    LDA.B $14                                                            ;9182CA;
    ORA.W #$0020                                                         ;9182CC;
    STA.B $14                                                            ;9182CF;

.done:
    LDA.B $14                                                            ;9182D1;
    EOR.W #$FFFF                                                         ;9182D3;
    STA.B $14                                                            ;9182D6;
    RTS                                                                  ;9182D8;


HandleTransitionTableLookupFailure:
    PHP                                                                  ;9182D9;
    PHB                                                                  ;9182DA;
    PHK                                                                  ;9182DB;
    PLB                                                                  ;9182DC;
    REP #$30                                                             ;9182DD;
    JSR.W Set_ProspectivePoseChangeCommand                               ;9182DF;
    BCC .consultPoseDefinition                                           ;9182E2;

.retainCurrentPose:
    LDA.W $0A1C                                                          ;9182E4;
    STA.W $0A28                                                          ;9182E7;
    BRA .return                                                          ;9182EA;


.consultPoseDefinition:
    LDA.W $0A1C                                                          ;9182EC;
    ASL A                                                                ;9182EF;
    ASL A                                                                ;9182F0;
    ASL A                                                                ;9182F1;
    TAX                                                                  ;9182F2;
    LDA.W PoseDefinitions_newPose,X                                      ;9182F3;
    AND.W #$00FF                                                         ;9182F6;
    CMP.W #$00FF                                                         ;9182F9;
    BEQ .retainCurrentPose                                               ;9182FC;
    STA.W $0A28                                                          ;9182FE;

.return:
    PLB                                                                  ;918301;
    PLP                                                                  ;918302;
    RTL                                                                  ;918303;


Set_ProspectivePoseChangeCommand:
    LDA.W $0A1F                                                          ;918304;
    AND.W #$00FF                                                         ;918307;
    TAX                                                                  ;91830A;
    LDA.W .poseChangeCommands,X                                          ;91830B;
    AND.W #$00FF                                                         ;91830E;
    CMP.W #$0001                                                         ;918311;
    BEQ .decelerate                                                      ;918314;

.notRetaining:
    STA.W $0A2E                                                          ;918316;
    CLC                                                                  ;918319;
    RTS                                                                  ;91831A;


.decelerate:
    LDA.W $0B46                                                          ;91831B;
    BNE .done                                                            ;91831E;
    LDA.W $0B48                                                          ;918320;
    BNE .done                                                            ;918323;
    LDA.W #$0002                                                         ;918325;
    BRA .notRetaining                                                    ;918328;


.done:
    LDA.W #$0001                                                         ;91832A;
    STA.W $0A2E                                                          ;91832D;
    SEC                                                                  ;918330;
    RTS                                                                  ;918331;


.poseChangeCommands:
    db $02,$01,$01,$00,$06,$02,$08,$02,$01,$06,$02,$02,$02,$06,$02,$02   ;918332;
    db $02,$06,$06,$06,$06,$02,$06,$02,$02,$02,$02,$02                   ;918342;

Enable_DemoInput:
    PHP                                                                  ;91834E;
    REP #$30                                                             ;91834F;
    LDA.W #SamusPoseInputHandler_Demo                                    ;918351;
    STA.W $0A60                                                          ;918354;
    LDA.W #$8000                                                         ;918357;
    TSB.W $0A88                                                          ;91835A;
    PLP                                                                  ;91835D;
    RTL                                                                  ;91835E;


Disable_DemoInput:
    PHP                                                                  ;91835F;
    REP #$30                                                             ;918360;
    LDA.W #SamusPoseInputHandler_Normal                                  ;918362;
    STA.W $0A60                                                          ;918365;
    LDA.W #$8000                                                         ;918368;
    TRB.W $0A88                                                          ;91836B;
    PLP                                                                  ;91836E;
    RTL                                                                  ;91836F;


Clear_DemoInput_RAM:
    PHP                                                                  ;918370;
    REP #$30                                                             ;918371;
    PHX                                                                  ;918373;
    STZ.W $0A7A                                                          ;918374;
    STZ.W $0A7C                                                          ;918377;
    STZ.W $0A7E                                                          ;91837A;
    STZ.W $0A80                                                          ;91837D;
    STZ.W $0A82                                                          ;918380;
    STZ.W $0A84                                                          ;918383;
    STZ.W $0A86                                                          ;918386;
    STZ.W $0A8C                                                          ;918389;
    STZ.W $0A8E                                                          ;91838C;
    STZ.W $0A88                                                          ;91838F;
    PLX                                                                  ;918392;
    PLP                                                                  ;918393;
    RTL                                                                  ;918394;


Load_DemoInputObject:
    PHP                                                                  ;918395;
    PHB                                                                  ;918396;
    PHK                                                                  ;918397;
    PLB                                                                  ;918398;
    REP #$30                                                             ;918399;
    PHX                                                                  ;91839B;
    STA.W $0A82                                                          ;91839C;
    TYX                                                                  ;91839F;
    LDA.W $0002,X                                                        ;9183A0;
    STA.W $0A7A                                                          ;9183A3;
    LDA.W $0004,X                                                        ;9183A6;
    STA.W $0A7E                                                          ;9183A9;
    LDA.W #$0001                                                         ;9183AC;
    STA.W $0A7C                                                          ;9183AF;
    LDA.W #$0000                                                         ;9183B2;
    STA.W $0A80                                                          ;9183B5;
    JSR.W ($0000,X)                                                      ;9183B8;
    PLX                                                                  ;9183BB;
    PLB                                                                  ;9183BC;
    PLP                                                                  ;9183BD;
    RTL                                                                  ;9183BE;


RTS_9183BF:
    RTS                                                                  ;9183BF;


DemoInputObjectHandler:
    PHP                                                                  ;9183C0;
    PHB                                                                  ;9183C1;
    PHK                                                                  ;9183C2;
    PLB                                                                  ;9183C3;
    REP #$30                                                             ;9183C4;
    BIT.W $0A88                                                          ;9183C6;
    BPL .return                                                          ;9183C9;
    LDA.W $0A7E                                                          ;9183CB;
    BEQ .return                                                          ;9183CE;
    JSR.W ProcessDemoInputObject                                         ;9183D0;
    LDA.W $0A8C                                                          ;9183D3;
    STA.W $0DFE                                                          ;9183D6;
    LDA.W $0A8E                                                          ;9183D9;
    STA.W $0E00                                                          ;9183DC;
    LDA.W $0A84                                                          ;9183DF;
    STA.B $8B                                                            ;9183E2;
    STA.W $0A8C                                                          ;9183E4;
    LDA.W $0A86                                                          ;9183E7;
    STA.B $8F                                                            ;9183EA;
    STA.W $0A8E                                                          ;9183EC;

.return:
    PLB                                                                  ;9183EF;
    PLP                                                                  ;9183F0;
    RTL                                                                  ;9183F1;


ProcessDemoInputObject:
    LDX.W #$0000                                                         ;9183F2;
    JSR.W ($0A7A,X)                                                      ;9183F5;
    DEC.W $0A7C                                                          ;9183F8;
    BNE .return                                                          ;9183FB;
    LDY.W $0A7E                                                          ;9183FD;

.loop:
    LDA.W $0000,Y                                                        ;918400;
    BPL .processInput                                                    ;918403;
    STA.B $12                                                            ;918405;
    INY                                                                  ;918407;
    INY                                                                  ;918408;
    PEA.W .loop-1                                                        ;918409;
    JMP.W ($0012)                                                        ;91840C;


.processInput:
    STA.W $0A7C                                                          ;91840F;
    LDA.W $0002,Y                                                        ;918412;
    STA.W $0A84                                                          ;918415;
    LDA.W $0004,Y                                                        ;918418;
    STA.W $0A86                                                          ;91841B;
    TYA                                                                  ;91841E;
    CLC                                                                  ;91841F;
    ADC.W #$0006                                                         ;918420;
    STA.W $0A7E                                                          ;918423;

.return:
    RTS                                                                  ;918426;


Instruction_DemoInputObject_Delete:
    REP #$30                                                             ;918427;
    STZ.W $0A7E                                                          ;918429;
    STZ.W $0A84                                                          ;91842C;
    STZ.W $0A86                                                          ;91842F;
    PLA                                                                  ;918432;
    RTS                                                                  ;918433;


Instruction_DemoInputObject_PreInstructionInY:
    REP #$30                                                             ;918434;
    LDA.W $0000,Y                                                        ;918436;
    STA.W $0A7A                                                          ;918439;
    INY                                                                  ;91843C;
    INY                                                                  ;91843D;
    RTS                                                                  ;91843E;


Instruction_DemoInputObject_ClearPreInstruction:
    REP #$30                                                             ;91843F;
    LDA.W #RTS_918447                                                    ;918441;
    STA.W $0A7A                                                          ;918444; fallthrough to RTS_918447

RTS_918447:
    RTS                                                                  ;918447;


Instruction_DemoInputObject_GotoY:
    REP #$30                                                             ;918448;
    LDA.W $0000,Y                                                        ;91844A;
    TAY                                                                  ;91844D;
    RTS                                                                  ;91844E;


Instruction_DemoInputObject_DecrementTimer_GotoYIfNonZero:
    REP #$30                                                             ;91844F;
    DEC.W $0A80                                                          ;918451;
    BNE Instruction_DemoInputObject_GotoY                                ;918454;
    INY                                                                  ;918456;
    INY                                                                  ;918457;
    RTS                                                                  ;918458;


Instruction_DemoInputObject_TimerInY:
    REP #$30                                                             ;918459;
    LDA.W $0000,Y                                                        ;91845B;
    STA.W $0A80                                                          ;91845E;
    INY                                                                  ;918461;
    INY                                                                  ;918462;
    RTS                                                                  ;918463;


RecordDemoInputFrame:
    PHP                                                                  ;918464;
    PHB                                                                  ;918465;
    PHK                                                                  ;918466;
    PLB                                                                  ;918467;
    REP #$30                                                             ;918468;
    LDA.W $0A8A                                                          ;91846A;
    AND.W #$7FFF                                                         ;91846D;
    STA.W $0E24                                                          ;918470;
    LDA.W #$00E0                                                         ;918473;
    STA.W $0E20                                                          ;918476;
    LDA.W #$0038                                                         ;918479;
    STA.W $0E22                                                          ;91847C;
    JSR.W Draw_RecordedDemoDuration                                      ;91847F;
    LDA.W $0A8A                                                          ;918482;
    BMI .return                                                          ;918485;
    BNE .record                                                          ;918487;
    LDA.B $91                                                            ;918489;
    BIT.W #$4000                                                         ;91848B;
    BEQ .return                                                          ;91848E;

.record:
    LDA.W $0A8A                                                          ;918490;
    ASL A                                                                ;918493;
    ASL A                                                                ;918494;
    STA.B $12                                                            ;918495;
    ASL A                                                                ;918497;
    ADC.B $12                                                            ;918498;
    TAX                                                                  ;91849A;
    LDA.B $8B                                                            ;91849B;
    STA.L $B88000,X                                                      ;91849D;
    LDA.B $8F                                                            ;9184A1;
    STA.L $B88002,X                                                      ;9184A3;
    LDA.W $0911                                                          ;9184A7;
    STA.L $B88004,X                                                      ;9184AA;
    LDA.W $0915                                                          ;9184AE;
    STA.L $B88006,X                                                      ;9184B1;
    LDA.W $0AF6                                                          ;9184B5;
    STA.L $B88008,X                                                      ;9184B8;
    LDA.W $0AFA                                                          ;9184BC;
    STA.L $B8800A,X                                                      ;9184BF;
    LDA.W $0A8A                                                          ;9184C3;
    INC A                                                                ;9184C6;
    CMP.W #$0A00                                                         ;9184C7;
    BNE .cappedAtA00                                                     ;9184CA;
    LDA.W #$0000                                                         ;9184CC;

.cappedAtA00:
    STA.W $0A8A                                                          ;9184CF;

.return:
    PLB                                                                  ;9184D2;
    PLP                                                                  ;9184D3;
    RTL                                                                  ;9184D4;


Pause_Terminate_Reset_DemoRecorder:
    PHP                                                                  ;9184D5;
    PHB                                                                  ;9184D6;
    PHK                                                                  ;9184D7;
    PLB                                                                  ;9184D8;
    REP #$30                                                             ;9184D9;
    LDA.B $91                                                            ;9184DB;
    BIT.W #$0040                                                         ;9184DD;
    BEQ .checkA                                                          ;9184E0;
    LDA.W $0A8A                                                          ;9184E2;
    ASL A                                                                ;9184E5;
    ASL A                                                                ;9184E6;
    STA.B $12                                                            ;9184E7;
    ASL A                                                                ;9184E9;
    ADC.B $12                                                            ;9184EA;
    TAX                                                                  ;9184EC;
    LDA.W #$FFFF                                                         ;9184ED;
    STA.L $B88000,X                                                      ;9184F0;
    STA.L $B88002,X                                                      ;9184F4;
    STA.L $B88004,X                                                      ;9184F8;
    STA.L $B88006,X                                                      ;9184FC;
    STA.L $B88008,X                                                      ;918500;
    STA.L $B8800A,X                                                      ;918504;
    LDA.W $078F                                                          ;918508;
    STA.L $B8FF00                                                       ;91850B;
    LDA.W $079F                                                          ;91850F;
    STA.L $B8FF02                                                       ;918512;
    LDA.W $0A8A                                                          ;918516;
    ORA.W #$8000                                                         ;918519;
    STA.W $0A8A                                                          ;91851C;

.checkA:
    LDA.B $91                                                            ;91851F;
    BIT.W #$0080                                                         ;918521;
    BEQ .return                                                          ;918524;
    LDA.W #$0000                                                         ;918526;
    STA.W $0A8A                                                          ;918529;

.return:
    PLB                                                                  ;91852C;
    PLP                                                                  ;91852D;
    RTL                                                                  ;91852E;


Draw_RecordedDemoDuration:
    LDA.W $0E20                                                          ;91852F;
    CLC                                                                  ;918532;
    ADC.W #$0000                                                         ;918533;
    STA.B $14                                                            ;918536;
    LDA.W $0E22                                                          ;918538;
    CLC                                                                  ;91853B;
    ADC.W #$0000                                                         ;91853C;
    STA.B $12                                                            ;91853F;
    LDA.W #$0A00                                                         ;918541;
    STA.B $26                                                            ;918544;
    LDA.W $0E24                                                          ;918546;
    AND.W #$F000                                                         ;918549;
    XBA                                                                  ;91854C;
    LSR A                                                                ;91854D;
    LSR A                                                                ;91854E;
    LSR A                                                                ;91854F;
    LSR A                                                                ;918550;
    CLC                                                                  ;918551;
    ADC.W #$0004                                                         ;918552;
    JSL.L Add_Debug_Spritemap_to_OAM                                     ;918555;
    LDA.W $0E20                                                          ;918559;
    CLC                                                                  ;91855C;
    ADC.W #$0008                                                         ;91855D;
    STA.B $14                                                            ;918560;
    LDA.W $0E22                                                          ;918562;
    CLC                                                                  ;918565;
    ADC.W #$0000                                                         ;918566;
    STA.B $12                                                            ;918569;
    LDA.W #$0A00                                                         ;91856B;
    STA.B $26                                                            ;91856E;
    LDA.W $0E24                                                          ;918570;
    AND.W #$0F00                                                         ;918573;
    XBA                                                                  ;918576;
    CLC                                                                  ;918577;
    ADC.W #$0004                                                         ;918578;
    JSL.L Add_Debug_Spritemap_to_OAM                                     ;91857B;
    LDA.W $0E20                                                          ;91857F;
    CLC                                                                  ;918582;
    ADC.W #$0010                                                         ;918583;
    STA.B $14                                                            ;918586;
    LDA.W $0E22                                                          ;918588;
    CLC                                                                  ;91858B;
    ADC.W #$0000                                                         ;91858C;
    STA.B $12                                                            ;91858F;
    LDA.W #$0A00                                                         ;918591;
    STA.B $26                                                            ;918594;
    LDA.W $0E24                                                          ;918596;
    AND.W #$00F0                                                         ;918599;
    LSR A                                                                ;91859C;
    LSR A                                                                ;91859D;
    LSR A                                                                ;91859E;
    LSR A                                                                ;91859F;
    CLC                                                                  ;9185A0;
    ADC.W #$0004                                                         ;9185A1;
    JSL.L Add_Debug_Spritemap_to_OAM                                     ;9185A4;
    LDA.W $0E20                                                          ;9185A8;
    CLC                                                                  ;9185AB;
    ADC.W #$0018                                                         ;9185AC;
    STA.B $14                                                            ;9185AF;
    LDA.W #$0A00                                                         ;9185B1;
    STA.B $26                                                            ;9185B4;
    LDA.W $0E22                                                          ;9185B6;
    CLC                                                                  ;9185B9;
    ADC.W #$0000                                                         ;9185BA;
    STA.B $12                                                            ;9185BD;
    LDA.W $0E24                                                          ;9185BF;
    AND.W #$000F                                                         ;9185C2;
    CLC                                                                  ;9185C5;
    ADC.W #$0004                                                         ;9185C6;
    JSL.L Add_Debug_Spritemap_to_OAM                                     ;9185C9;
    RTS                                                                  ;9185CD;


if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_DemoInput_JumpLeft_GiveControlBack_9185CE:
    dw $001E,$0000,$0000,$0001,$0200,$0200,$001A,$0200                   ;9185CE;
    dw $0000,$0001,$0280,$0080,$0034,$0280,$0000,$001E                   ;9185DE;
    dw $0200,$0000,$0049,$0000,$0000                                     ;9185EE;
    dw Instruction_EndDemoInput_GiveControlBackToPlayer                  ;9185F8;
    dw Instruction_DemoInputObject_Delete                                ;9185FA;

Instruction_EndDemoInput_GiveControlBackToPlayer:
    LDA.W #SamusCurrentStateHandler_Normal                               ;9185FC;
    STA.W $0A42                                                          ;9185FF;
    LDA.W #SamusNewStateHandler_Normal                                   ;918602;
    STA.W $0A44                                                          ;918605;
    JSL.L Disable_DemoInput                                              ;918608;
    RTS                                                                  ;91860C;
endif ; !FEATURE_KEEP_UNREFERENCED


InstList_DemoInput_BabyMetroidDiscovery_RunningLeft_0:
    dw $005A,$0000,$0000,$0001,$0200,$0200                               ;91860D;

InstList_DemoInput_BabyMetroidDiscovery_RunningLeft_1:
    dw $0001,$0200,$0000                                                 ;918619;
    dw Instruction_DemoInputObject_GotoY                                 ;91861F;
    dw InstList_DemoInput_BabyMetroidDiscovery_RunningLeft_1             ;918621;

InstList_DemoInput_BabyMetroidDiscovery_StopAndLook_0:
    dw $012C,$0000,$0000,$0001,$0010,$0010,$00AA,$0010                   ;918623;
    dw $0000,$00F0,$0000,$0000,$0001,$0200,$0200                         ;918633;

InstList_DemoInput_BabyMetroidDiscovery_StopAndLook_1:
    dw $0001,$0200,$0000                                                 ;918641;
    dw Instruction_DemoInputObject_GotoY                                 ;918647;
    dw InstList_DemoInput_BabyMetroidDiscovery_StopAndLook_1             ;918649;

InstList_DemoInput_BabyMetroidDiscovery_End:
    dw Instruction_EndDemoInput                                          ;91864B;
    dw Instruction_DemoInputObject_Delete                                ;91864D;

PreInstruction_DemoInput_BabyMetroidDiscovery_RunningLeft:
    LDA.W $0AF6                                                          ;91864F;
    CMP.W #$00B2                                                         ;918652;
    BPL .return                                                          ;918655;
    LDA.W #PreInstruction_DemoInput_BabyMetroidDiscovery_StopAndLook     ;918657;
    STA.W $0A7A                                                          ;91865A;
    LDA.W #InstList_DemoInput_BabyMetroidDiscovery_StopAndLook_0         ;91865D;
    STA.W $0A7E                                                          ;918660;
    LDA.W #$0001                                                         ;918663;
    STA.W $0A7C                                                          ;918666;

.return:
    RTS                                                                  ;918669;


PreInstruction_DemoInput_BabyMetroidDiscovery_StopAndLook:
    LDA.W $1A4B                                                          ;91866A;
    BNE .return                                                          ;91866D;
    LDA.W #RTS_9183BF                                                    ;91866F;
    STA.W $0A7A                                                          ;918672;
    LDA.W #InstList_DemoInput_BabyMetroidDiscovery_End                   ;918675;
    STA.W $0A7E                                                          ;918678;
    LDA.W #$0001                                                         ;91867B;
    STA.W $0A7C                                                          ;91867E;

.return:
    RTS                                                                  ;918681;


Instruction_EndDemoInput:
    PHX                                                                  ;918682;
    PHY                                                                  ;918683;
    LDA.W #RTL_90E8CD                                                    ;918684;
    STA.W $0A42                                                          ;918687;
    STA.W $0A44                                                          ;91868A;
    JSL.L Disable_DemoInput                                              ;91868D;
    PLY                                                                  ;918691;
    PLX                                                                  ;918692;
    RTS                                                                  ;918693;


InstList_DemoInput_OldMotherBrainFight:
    dw $005A,$0000,$0000,$0001,$0040,$0040,$0028,$0040                   ;918694;
    dw $0000,$0001,$0040,$0040,$001D,$0040,$0000,$0046                   ;9186A4;
    dw $0000,$0000                                                       ;9186B4;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_DemoInput_OldMotherBrainFight_9186B8:
    dw $0014,$0000,$0000,$0001,$0200,$0200,$0007,$0200                   ;9186B8;
    dw $0000,$0001,$0280,$0080,$0007,$0280,$0000,$0004                   ;9186C8;
    dw $0200,$0000,$003C,$0000,$0000,$0001,$0040,$0040                   ;9186D8;
    dw $0028,$0040,$0000,$0001,$0040,$0040,$0013,$0040                   ;9186E8;
    dw $0000                                                             ;9186F8;
    dw Instruction_EndDemoInputWithSamusFacingLeft                       ;9186FA;
    dw Instruction_DemoInputObject_Delete                                ;9186FC;

UNUSED_Instruction_EndDemoInputWithSamusFacingLeft_9186FE:
    PHX                                                                  ;9186FE;
    PHY                                                                  ;9186FF;
    LDA.W #SamusCurrentStateHandler_SamusIsLocked                        ;918700;
    STA.W $0A42                                                          ;918703;
    LDA.W #$0002                                                         ;918706;
    STA.W $0A1C                                                          ;918709;
    JSL.L InitializeSamusPose_1                                          ;91870C;
    JSL.L Set_Samus_AnimationFrame_if_PoseChanged                        ;918710;
    LDA.W $0A20                                                          ;918714;
    STA.W $0A24                                                          ;918717;
    LDA.W $0A22                                                          ;91871A;
    STA.W $0A26                                                          ;91871D;
    LDA.W $0A1C                                                          ;918720;
    STA.W $0A20                                                          ;918723;
    LDA.W $0A1E                                                          ;918726;
    STA.W $0A22                                                          ;918729;
    JSL.L Disable_DemoInput                                              ;91872C;
    LDA.W #RTS_90E90E                                                    ;918730;
    STA.W $0A60                                                          ;918733;
    PLY                                                                  ;918736;
    PLX                                                                  ;918737;
    RTS                                                                  ;918738;
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_EndDemoInputWithSamusFacingLeft:
    PHX                                                                  ;918739;
    PHY                                                                  ;91873A;
    LDA.W #SamusCurrentStateHandler_SamusIsLocked                        ;91873B;
    STA.W $0A42                                                          ;91873E;
    LDA.W #$0002                                                         ;918741;
    STA.W $0A1C                                                          ;918744;
    JSL.L InitializeSamusPose_1                                          ;918747;
    JSL.L Set_Samus_AnimationFrame_if_PoseChanged                        ;91874B;
    LDA.W $0A20                                                          ;91874F;
    STA.W $0A24                                                          ;918752;
    LDA.W $0A22                                                          ;918755;
    STA.W $0A26                                                          ;918758;
    LDA.W $0A1C                                                          ;91875B;
    STA.W $0A20                                                          ;91875E;
    LDA.W $0A1E                                                          ;918761;
    STA.W $0A22                                                          ;918764;
    JSL.L Disable_DemoInput                                              ;918767;
    LDA.W #RTS_90E90E                                                    ;91876B;
    STA.W $0A60                                                          ;91876E;
    PLY                                                                  ;918771;
    PLX                                                                  ;918772;
    RTS                                                                  ;918773;


if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_DemoInput_Delete_918774:
    dw Instruction_DemoInputObject_Delete                                ;918774;
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_DemoInput_Delete:
    dw Instruction_DemoInputObject_Delete                                ;918776;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_DemoInputObject_Intro_JumpLeft_GiveControlBack_918778:
    dw RTS_9183BF                                                        ;918778;
    dw RTS_9183BF                                                        ;91877A;
    dw UNUSED_InstList_DemoInput_JumpLeft_GiveControlBack_9185CE         ;91877C;
endif ; !FEATURE_KEEP_UNREFERENCED

DemoInputObjects_Intro_BabyMetroidDiscovery:
    dw RTS_9183BF                                                        ;91877E;
    dw PreInstruction_DemoInput_BabyMetroidDiscovery_RunningLeft         ;918780;
    dw InstList_DemoInput_BabyMetroidDiscovery_RunningLeft_0             ;918782;

DemoInputObjects_Intro_OldMotherBrainFight:
    dw RTS_9183BF                                                        ;918784;
    dw RTS_9183BF                                                        ;918786;
    dw InstList_DemoInput_OldMotherBrainFight                            ;918788;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_DemoInputObjects_Intro_OldMotherBrainFight_91878A:
    dw RTS_9183BF                                                        ;91878A;
    dw RTS_9183BF                                                        ;91878C;
    dw UNUSED_InstList_DemoInput_OldMotherBrainFight_9186B8              ;91878E;
endif ; !FEATURE_KEEP_UNREFERENCED

LoadDemoData:
    LDA.W $1F57                                                          ;918790;
    ASL A                                                                ;918793;
    ASL A                                                                ;918794;
    ASL A                                                                ;918795;
    ASL A                                                                ;918796;
    STA.B $12                                                            ;918797;
    LDA.W $1F55                                                          ;918799;
    ASL A                                                                ;91879C;
    TAX                                                                  ;91879D;
    LDA.W DemoData_Pointers,X                                            ;91879E;
    CLC                                                                  ;9187A1;
    ADC.B $12                                                            ;9187A2;
    TAX                                                                  ;9187A4;
    LDA.W $0000,X                                                        ;9187A5;
    STA.W $09A4                                                          ;9187A8;
    STA.W $09A2                                                          ;9187AB;
    LDA.W $0002,X                                                        ;9187AE;
    STA.W $09C8                                                          ;9187B1;
    STA.W $09C6                                                          ;9187B4;
    LDA.W $0004,X                                                        ;9187B7;
    STA.W $09CC                                                          ;9187BA;
    STA.W $09CA                                                          ;9187BD;
    LDA.W $0006,X                                                        ;9187C0;
    STA.W $09D0                                                          ;9187C3;
    STA.W $09CE                                                          ;9187C6;
    LDA.W $0008,X                                                        ;9187C9;
    STA.W $09C4                                                          ;9187CC;
    STA.W $09C2                                                          ;9187CF;
    LDA.W $000A,X                                                        ;9187D2;
    STA.W $09A8                                                          ;9187D5;
    LDA.W $000C,X                                                        ;9187D8;
    STA.W $09A6                                                          ;9187DB;
    STZ.W $09D6                                                          ;9187DE;
    PHX                                                                  ;9187E1;
    JSL.L Clear_DemoInput_RAM                                            ;9187E2;
    JSL.L Enable_DemoInput                                               ;9187E6;
    PLX                                                                  ;9187EA;
    LDA.W $000E,X                                                        ;9187EB;
    TAY                                                                  ;9187EE;
    JSL.L Load_DemoInputObject                                           ;9187EF;
    LDA.W $1F57                                                          ;9187F3;
    ASL A                                                                ;9187F6;
    STA.B $12                                                            ;9187F7;
    LDA.W $1F55                                                          ;9187F9;
    ASL A                                                                ;9187FC;
    TAX                                                                  ;9187FD;
    LDA.W DemoSamusSetup_Pointers,X                                      ;9187FE;
    CLC                                                                  ;918801;
    ADC.B $12                                                            ;918802;
    TAX                                                                  ;918804;
    LDA.W $0000,X                                                        ;918805;
    STA.B $12                                                            ;918808;
    PEA.W .manualReturn-1                                                ;91880A;
    JMP.W ($0012)                                                        ;91880D;


.manualReturn:
    LDA.W #SamusCurrentStateHandler_Demo                                 ;918810;
    STA.W $0A42                                                          ;918813;
    LDA.W #SamusNewStateHandler_TitleDemo                                ;918816;
    STA.W $0A44                                                          ;918819;
    STZ.W $0A2E                                                          ;91881C;
    STZ.W $0A30                                                          ;91881F;
    STZ.W $0A32                                                          ;918822;
    JSL.L LoadSamusSuitPalette                                           ;918825;
    JSL.L Update_Beam_Tiles_and_Palette                                  ;918829;
    LDA.W #$0800                                                         ;91882D;
    STA.W $09AA                                                          ;918830;
    LDA.W #$0400                                                         ;918833;
    STA.W $09AC                                                          ;918836;
    LDA.W #$0200                                                         ;918839;
    STA.W $09AE                                                          ;91883C;
    LDA.W #$0100                                                         ;91883F;
    STA.W $09B0                                                          ;918842;
    LDA.W #$0040                                                         ;918845;
    STA.W $09B2                                                          ;918848;
    LDA.W #$0080                                                         ;91884B;
    STA.W $09B4                                                          ;91884E;
    LDA.W #$8000                                                         ;918851;
    STA.W $09B6                                                          ;918854;
    LDA.W #$4000                                                         ;918857;
    STA.W $09B8                                                          ;91885A;
    LDA.W #$2000                                                         ;91885D;
    STA.W $09BA                                                          ;918860;
    LDA.W #$0010                                                         ;918863;
    STA.W $09BE                                                          ;918866;
    LDA.W #$0020                                                         ;918869;
    STA.W $09BC                                                          ;91886C;
    LDA.W #$0001                                                         ;91886F;
    STA.W $09E8                                                          ;918872;
    STA.W $09E6                                                          ;918875;
    STZ.W $09E4                                                          ;918878;
    STZ.W $0DF8                                                          ;91887B;
    STZ.W $0DFA                                                          ;91887E;
    STZ.W $0DFC                                                          ;918881;
    RTS                                                                  ;918884;


DemoData_Pointers:
    dw DemoData_Set0                                                     ;918885;
    dw DemoData_Set1                                                     ;918887;
    dw DemoData_Set2                                                     ;918889;
    dw DemoData_Set3                                                     ;91888B;

DemoData_Set0:
    dw $0000,$0000,$0000,$0000,$0063,$0000,$0000                         ;91888D;
    dw DemoInputObjects_Title_LandingSite                                ;91889B;
    dw $0004,$0005,$0000,$0000,$0063,$0000,$0000                         ;91889D;
    dw DemoInputObjects_Title_MissileDoor                                ;9188AB;
    dw $0004,$000F,$0000,$0000,$00C7,$1000,$1000                         ;9188AD;
    dw DemoInputObjects_Title_PreSporeSpawnHall                          ;9188BB;
    dw $2105,$001E,$0005,$0000,$012B,$1004,$1004                         ;9188BD;
    dw DemoInputObjects_Title_SpeedBooster                               ;9188CB;
    dw $6105,$001E,$0005,$0005,$018F,$1006,$1006                         ;9188CD;
    dw DemoInputObjects_Title_GrappleBeam                                ;9188DB;
    dw $0004,$0014,$0000,$0000,$00C7,$1000,$1000                         ;9188DD;
    dw DemoInputObjects_Title_PseudoScrewAttack                          ;9188EB;

DemoData_Set1:
    dw $2105,$001E,$0005,$0000,$012B,$1006,$1006                         ;9188ED;
    dw DemoInputObjects_Title_IceBeam                                    ;9188FB;
    dw $0004,$000A,$0000,$0000,$00C7,$0000,$0000                         ;9188FD;
    dw DemoInputObjects_Title_FireFleaRoom                               ;91890B;
    dw $0004,$0019,$0005,$0000,$00C7,$1000,$1000                         ;91890D;
    dw DemoInputObjects_Title_BrinstarDiagonalRoom                       ;91891B;
    dw $E325,$004B,$000F,$000A,$0383,$1000,$1000                         ;91891D;
    dw DemoInputObjects_Title_LowerNorfairEntrance                       ;91892B;
    dw $E32D,$0055,$000F,$000A,$03E7,$0000,$0000                         ;91892D;
    dw DemoInputObjects_Title_ScrewAttack                                ;91893B;
    dw $E105,$002D,$0005,$0005,$018F,$1000,$1000                         ;91893D;
    dw DemoInputObjects_Title_Dachora                                    ;91894B;

DemoData_Set2:
    dw $E105,$0037,$0005,$0005,$018F,$1000,$1000                         ;91894D;
    dw DemoInputObjects_Title_WreckedShipBasement                        ;91895B;
    dw $F33F,$0055,$000F,$000A,$03E7,$100F,$1000                         ;91895D;
    dw DemoInputObjects_Title_Shinespark                                 ;91896B;
    dw $0104,$0019,$0005,$0000,$012B,$1004,$1004                         ;91896D;
    dw DemoInputObjects_Title_EyeDoor                                    ;91897B;
    dw $2105,$001E,$0005,$0000,$012B,$0000,$0000                         ;91897D;
    dw DemoInputObjects_Title_RedBrinstarElevator                        ;91898B;
    dw $0104,$0019,$0005,$0000,$012B,$0000,$0000                         ;91898D;
    dw DemoInputObjects_Title_Kraid                                      ;91899B;
    dw $2105,$001E,$0005,$0005,$012B,$1008,$1008                         ;91899D;
    dw DemoInputObjects_Title_TourianEntrance                            ;9189AB;

DemoData_Set3:
    dw $F32D,$0055,$000F,$000A,$03E7,$1000,$1000                         ;9189AD;
    dw DemoInputObjects_Title_GauntletEntrance                           ;9189BB;
    dw $F32D,$0055,$000F,$000A,$03E7,$0000,$0000                         ;9189BD;
    dw DemoInputObjects_Title_AdvancedGrappleBeam                        ;9189CB;
    dw $F32D,$0055,$000F,$000A,$03E7,$0000,$0000                         ;9189CD;
    dw DemoInputObjects_Title_IBJ                                        ;9189DB;
    dw $F32D,$0055,$000F,$000A,$03E7,$1008,$1008                         ;9189DD;
    dw DemoInputObjects_Title_SBA                                        ;9189EB;
    dw $F32D,$0055,$0014,$0014,$03E7,$1000,$1000                         ;9189ED;
    dw DemoInputObjects_Title_CrystalFlash                               ;9189FB;

DemoSamusSetup_Pointers:
    dw DemoSamusSetup_Set0                                               ;9189FD;
    dw DemoSamusSetup_Set1                                               ;9189FF;
    dw DemoSamusSetup_Set2                                               ;918A01;
    dw DemoSamusSetup_Set3                                               ;918A03;

DemoSamusSetup_Set0:
    dw DemoSamusSetup_LandingSite                                        ;918A05;
    dw DemoSamusSetup_StandingFacingRight                                ;918A07;
    dw DemoSamusSetup_StandingFacingRight                                ;918A09;
    dw DemoSamusSetup_StandingFacingLeft                                 ;918A0B;
    dw DemoSamusSetup_StandingFacingRight                                ;918A0D;
    dw DemoSamusSetup_MorphBallFacingLeft                                ;918A0F;

DemoSamusSetup_Set1:
    dw DemoSamusSetup_StandingFacingLeft                                 ;918A11;
    dw DemoSamusSetup_StandingFacingLeft                                 ;918A13;
    dw DemoSamusSetup_StandingFacingRight                                ;918A15;
    dw DemoSamusSetup_StandingFacingLeft                                 ;918A17;
    dw DemoSamusSetup_StandingFacingRight                                ;918A19;
    dw DemoSamusSetup_FallingFacingLeft                                  ;918A1B;

DemoSamusSetup_Set2:
    dw DemoSamusSetup_StandingFacingLeft                                 ;918A1D;
    dw DemoSamusSetup_Shinespark                                         ;918A1F;
    dw DemoSamusSetup_StandingFacingRight                                ;918A21;
    dw DemoSamusSetup_StandingFacingRight                                ;918A23;
    dw DemoSamusSetup_StandingFacingRight                                ;918A25;
    dw DemoSamusSetup_StandingFacingRight                                ;918A27;

DemoSamusSetup_Set3:
    dw DemoSamusSetup_GauntletEntrance                                   ;918A29;
    dw DemoSamusSetup_StandingFacingLeft                                 ;918A2B;
    dw DemoSamusSetup_StandingFacingLeft                                 ;918A2D;
    dw DemoSamusSetup_StandingFacingRight                                ;918A2F;
    dw DemoSamusSetup_StandingFacingLeft_LowEnergy                       ;918A31;

DemoSamusSetup_LandingSite:
    JSL.L MakeSamusFaceForward                                           ;918A33;
    LDA.W #SamusDrawingHandler_Default                                   ;918A37;
    STA.W $0A5C                                                          ;918A3A;
    RTS                                                                  ;918A3D;


DemoSamusSetup_MorphBallFacingLeft:
    LDA.W #$001F                                                         ;918A3E;
    BRA InitializeSamusWithPoseInA                                       ;918A41;


DemoSamusSetup_StandingFacingLeft_LowEnergy:
    LDA.W #$0014                                                         ;918A43;
    STA.W $09C2                                                          ;918A46;

DemoSamusSetup_StandingFacingLeft:
    LDA.W #$0002                                                         ;918A49;
    BRA InitializeSamusWithPoseInA                                       ;918A4C;


DemoSamusSetup_FallingFacingLeft:
    LDA.W #$002A                                                         ;918A4E;
    BRA InitializeSamusWithPoseInA                                       ;918A51;


DemoSamusSetup_StandingFacingRight:
    LDA.W #$0001                                                         ;918A53;

InitializeSamusWithPoseInA:
    STA.W $0A1C                                                          ;918A56;
    JSL.L InitializeSamusPose_1                                          ;918A59;
    JSL.L Set_Samus_AnimationFrame_if_PoseChanged                        ;918A5D;
    LDA.W #SamusDrawingHandler_Default                                   ;918A61;
    STA.W $0A5C                                                          ;918A64;
    RTS                                                                  ;918A67;


DemoSamusSetup_Shinespark:
    LDA.W #SamusDrawingHandler_Default                                   ;918A68;
    STA.W $0A5C                                                          ;918A6B;
    JSL.L TriggerShinesparkWindup                                        ;918A6E;
    LDA.W #$00CD                                                         ;918A72;
    STA.W $0A1C                                                          ;918A75;
    JSL.L InitializeSamusPose_1                                          ;918A78;
    JSL.L Set_Samus_AnimationFrame_if_PoseChanged                        ;918A7C;
    RTS                                                                  ;918A80;


DemoSamusSetup_GauntletEntrance:
    LDA.W #SamusDrawingHandler_Default                                   ;918A81;
    STA.W $0A5C                                                          ;918A84;
    JSL.L TriggerShinesparkWindup                                        ;918A87;
    LDA.W #$00CA                                                         ;918A8B;
    STA.W $0A1C                                                          ;918A8E;
    JSL.L InitializeSamusPose_1                                          ;918A91;
    JSL.L Set_Samus_AnimationFrame_if_PoseChanged                        ;918A95;
    RTS                                                                  ;918A99;


RTS_918A9A:
    RTS                                                                  ;918A9A;


PreInstruction_DemoInput_Normal:
    LDA.W $0998                                                          ;918A9B;
    CMP.W #$002C                                                         ;918A9E;
    BNE .return                                                          ;918AA1;
    LDA.W #InstList_DemoInput_Delete                                     ;918AA3;
    STA.W $0A7E                                                          ;918AA6;
    LDA.W #$0001                                                         ;918AA9;
    STA.W $0A7C                                                          ;918AAC;

.return:
    RTS                                                                  ;918AAF;


PreInstruction_DemoInput_Shinespark:
    LDA.W $0A1F                                                          ;918AB0;
    AND.W #$00FF                                                         ;918AB3;
    CMP.W #$001A                                                         ;918AB6;
    BEQ .return                                                          ;918AB9;
    LDA.W #PreInstruction_DemoInput_Normal                               ;918ABB;
    STA.W $0A7A                                                          ;918ABE;
    LDA.W #UNUSED_InstList_DemoInput_Shinespark_Unseen_919346            ;918AC1;
    STA.W $0A7E                                                          ;918AC4;
    LDA.W #$0001                                                         ;918AC7;
    STA.W $0A7C                                                          ;918ACA;

.return:
    RTS                                                                  ;918ACD;


InstList_DemoInput_LandingSite:
    dw $0121,$0000,$0000,$0001,$0200,$0200,$0006,$0200                   ;918ACE;
    dw $0000,$0001,$0A00,$0800,$0003,$0A00,$0000,$0013                   ;918ADE;
    dw $0200,$0000,$0001,$0280,$0080,$0028,$0280,$0000                   ;918AEE;
    dw $0032,$0200,$0000,$0024,$0000,$0000,$0001,$0100                   ;918AFE;
    dw $0100,$0005,$0100,$0000,$000F,$0000,$0000,$0001                   ;918B0E;
    dw $0200,$0200,$0005,$0200,$0000,$0022,$0000,$0000                   ;918B1E;
    dw $0001,$0200,$0200,$004A,$0200,$0000,$0005,$0000                   ;918B2E;
    dw $0000,$0001,$0100,$0100,$0005,$0100,$0000,$0045                   ;918B3E;
    dw $0000,$0000,$0001,$0200,$0200,$0003,$0200,$0000                   ;918B4E;
    dw $0001,$8200,$8000,$0049,$8200,$0000,$0001,$8A00                   ;918B5E;
    dw $0800,$0003,$8A00,$0000,$0001,$0200,$0000,$0002                   ;918B6E;
    dw $0000,$0000,$0001,$0100,$0100,$0007,$0100,$0000                   ;918B7E;
    dw $000B,$0000,$0000,$0001,$0010,$0010,$001F,$0010                   ;918B8E;
    dw $0000,$0001,$0210,$0200,$0005,$0210,$0000,$001D                   ;918B9E;
    dw $0010,$0000,$0001,$0200,$0200,$005E,$0200,$0000                   ;918BAE;
    dw $0030,$0000,$0000,$0001,$0200,$0200,$002E,$0200                   ;918BBE;
    dw $0000,$001F,$0000,$0000,$0001,$0100,$0100,$0004                   ;918BCE;
    dw $0100,$0000,$0040,$0000,$0000,$0001,$0200,$0200                   ;918BDE;
    dw $0004,$0200,$0000,$0028,$0000,$0000,$0001,$0040                   ;918BEE;
    dw $0040,$0006,$0040,$0000,$002B,$0000,$0000,$0001                   ;918BFE;
    dw $0200,$0200,$0011,$0200,$0000,$0007,$0000,$0000                   ;918C0E;
    dw $0001,$0200,$0200,$0004,$0200,$0000,$0014,$0100                   ;918C1E;
    dw $0000,$0001,$0140,$0040,$0003,$0140,$0000                         ;918C2E;
    dw Instruction_DemoInputObject_Delete                                ;918C3C;

InstList_DemoInput_PseudoScrewAttack:
    dw $0016,$0000,$0000,$0001,$0800,$0800,$0003,$0800                   ;918C3E;
    dw $0000,$0005,$0000,$0000,$0001,$0800,$0800,$0006                   ;918C4E;
    dw $0800,$0000,$0016,$0000,$0000,$0001,$0200,$0200                   ;918C5E;
    dw $0005,$0200,$0000,$000B,$0000,$0000,$0001,$0040                   ;918C6E;
    dw $0040,$004E,$0040,$0000,$0001,$0240,$0200,$000D                   ;918C7E;
    dw $0240,$0000,$0001,$02C0,$0080,$0014,$02C0,$0000                   ;918C8E;
    dw $0014,$0240,$0000,$0020,$0040,$0000,$0001,$0140                   ;918C9E;
    dw $0100,$000F,$0140,$0000,$0001,$01C0,$0080,$0006                   ;918CAE;
    dw $01C0,$0000,$0002,$00C0,$0000,$0001,$02C0,$0200                   ;918CBE;
    dw $001E,$02C0,$0000,$0008,$0240,$0000,$0006,$0040                   ;918CCE;
    dw $0000,$0001,$0140,$0100,$000B,$0140,$0000,$0001                   ;918CDE;
    dw $01C0,$0080,$0023,$01C0,$0000,$003A,$0140,$0000                   ;918CEE;
    dw $0001,$01C0,$0080,$0013,$01C0,$0000,$0001,$09C0                   ;918CFE;
    dw $0800,$0002,$01C0,$0000,$0008,$00C0,$0000,$000D                   ;918D0E;
    dw $0040,$0000,$0001,$0240,$0200,$0029,$0240,$0000                   ;918D1E;
    dw $0001,$02C0,$0080,$0007,$02C0,$0000,$0001,$0AC0                   ;918D2E;
    dw $0800,$0002,$0AC0,$0000,$0001,$08C0,$0000,$0001                   ;918D3E;
    dw $01C0,$0100,$0028,$01C0,$0000,$0010,$0140,$0000                   ;918D4E;
    dw $0006,$0040,$0000,$0001,$00C0,$0080,$0004,$00C0                   ;918D5E;
    dw $0000,$0001,$00E0,$0020,$0012,$00E0,$0000,$002A                   ;918D6E;
    dw $0020,$0000,$0001,$0120,$0100,$0002,$0120,$0000                   ;918D7E;
    dw $0005,$0100,$0000,$0008,$0000,$0000,$0001,$0100                   ;918D8E;
    dw $0100,$0011,$0100,$0000,$0001,$0180,$0080,$000F                   ;918D9E;
    dw $0180,$0000,$0013,$0100,$0000,$0001,$8100,$8000                   ;918DAE;
    dw $0029,$8100,$0000,$0001,$8180,$0080,$0020,$8180                   ;918DBE;
    dw $0000,$0005,$8080,$0000,$0006,$8000,$0000,$0001                   ;918DCE;
    dw $0200,$0200,$000F,$0200,$0000,$0065,$0000,$0000                   ;918DDE;
    dw Instruction_DemoInputObject_Delete                                ;918DEE;

InstList_DemoInput_SpeedBooster:
    dw $0020,$0000,$0000,$0001,$0200,$0200,$0002,$0200                   ;918DF0;
    dw $0000,$0001,$8200,$8000,$00EE,$8200,$0000,$0001                   ;918E00;
    dw $8A00,$0800,$0002,$8200,$0000,$0001,$8100,$0100                   ;918E10;
    dw $0016,$0100,$0000,$0031,$0000,$0000,$0001,$0200                   ;918E20;
    dw $0200,$0005,$0200,$0000,$0013,$0000,$0000,$0001                   ;918E30;
    dw $0040,$0040,$0008,$0040,$0000,$0011,$0000,$0000                   ;918E40;
    dw $0001,$0200,$0200,$001B,$0200,$0000,$0063,$0000                   ;918E50;
    dw $0000                                                             ;918E60;
    dw Instruction_DemoInputObject_Delete                                ;918E62;

InstList_DemoInput_Dachora:
    dw $0008,$0000,$0000,$0001,$0200,$0200,$0001,$0200                   ;918E64;
    dw $0000,$010A,$0000,$0000,$0001,$0100,$0100,$0004                   ;918E74;
    dw $0100,$0000,$0011,$0000,$0000,$0001,$0200,$0200                   ;918E84;
    dw $0004,$0200,$0000,$0038,$0000,$0000,$0001,$0200                   ;918E94;
    dw $0200,$0164,$0200,$0000,$011E,$0000,$0000                         ;918EA4;
    dw Instruction_DemoInputObject_Delete                                ;918EB2;

InstList_DemoInput_RedBrinstarElevator:
    dw $005A,$0000,$0000,$0001,$0100,$0100,$000A,$0100                   ;918EB4;
    dw $0000,$0001,$0180,$0080,$0006,$0180,$0000,$0011                   ;918EC4;
    dw $0100,$0000,$0020,$0000,$0000,$0001,$0200,$0200                   ;918ED4;
    dw $0001,$0200,$0000,$0001,$0280,$0080,$0014,$0280                   ;918EE4;
    dw $0000,$0003,$0200,$0000,$0014,$0000,$0000,$0001                   ;918EF4;
    dw $0100,$0100,$0004,$0100,$0000,$0048,$0000,$0000                   ;918F04;
    dw $0001,$0080,$0080,$0011,$0080,$0000,$0001,$0180                   ;918F14;
    dw $0100,$000A,$0180,$0000,$0016,$0100,$0000,$0200                   ;918F24;
    dw $0000,$0000                                                       ;918F34;
    dw Instruction_DemoInputObject_Delete                                ;918F38;

InstList_DemoInput_WreckedShipBasement:
    dw $003D,$0000,$0000,$0001,$0100,$0100,$0005,$0100                   ;918F3A;
    dw $0000,$000F,$0000,$0000,$0001,$0200,$0200,$0005                   ;918F4A;
    dw $0200,$0000,$0027,$0000,$0000,$0001,$0200,$0200                   ;918F5A;
    dw $0066,$0200,$0000,$0001,$8200,$8000,$0007,$8200                   ;918F6A;
    dw $0000,$004F,$0200,$0000,$0057,$0000,$0000,$0001                   ;918F7A;
    dw $0100,$0100,$0002,$0100,$0000,$0064,$0000,$0000                   ;918F8A;
    dw $0001,$0100,$0100,$004E,$0100,$0000,$0001,$8100                   ;918F9A;
    dw $8000,$0017,$8100,$0000,$0006,$0100,$0000,$0001                   ;918FAA;
    dw $8100,$8000,$0003,$8100,$0000,$0001,$0100,$0000                   ;918FBA;
    dw $0001,$8100,$8000,$0002,$8100,$0000,$0034,$0100                   ;918FCA;
    dw $0000,$00A9,$0000,$0000                                           ;918FDA;
    dw Instruction_DemoInputObject_Delete                                ;918FE2;

InstList_DemoInput_LowerNorfairEntrance:
    dw $0013,$0000,$0000,$0001,$0200,$0200,$0012,$0200                   ;918FE4;
    dw $0000,$0029,$0000,$0000,$0001,$8000,$8000,$0015                   ;918FF4;
    dw $8000,$0000,$000B,$0000,$0000,$0001,$8000,$8000                   ;919004;
    dw $001F,$8000,$0000,$0001,$8200,$0200,$0030,$8200                   ;919014;
    dw $0000,$0003,$8000,$0000,$0001,$8200,$0200,$0007                   ;919024;
    dw $8200,$0000,$0045,$8000,$0000,$0001,$8200,$0200                   ;919034;
    dw $0091,$8200,$0000,$000A,$8000,$0000,$0001,$8200                   ;919044;
    dw $0200,$0006,$8200,$0000,$0036,$8000,$0000,$0001                   ;919054;
    dw $8200,$0200,$0090,$8200,$0000,$0011,$0200,$0000                   ;919064;
    dw $0001,$0280,$0080,$0017,$0280,$0000,$0008,$0080                   ;919074;
    dw $0000,$0001,$0180,$0100,$000E,$0180,$0000,$000F                   ;919084;
    dw $0100,$0000,$0002,$0000,$0000,$0001,$0080,$0080                   ;919094;
    dw $001C,$0080,$0000,$0001,$0280,$0200,$000C,$0280                   ;9190A4;
    dw $0000,$0002,$0200,$0000,$000F,$0000,$0000,$0001                   ;9190B4;
    dw $0080,$0080,$0011,$0080,$0000,$0001,$0180,$0100                   ;9190C4;
    dw $000F,$0180,$0000,$0002,$0080,$0000,$0010,$0000                   ;9190D4;
    dw $0000,$0001,$0080,$0080,$0001,$0280,$0200,$0014                   ;9190E4;
    dw $0280,$0000,$0015,$0200,$0000,$0001,$8200,$8000                   ;9190F4;
    dw $000E,$8200,$0000,$0006,$0200,$0000,$0001,$0280                   ;919104;
    dw $0080,$0004,$0280,$0000,$0011,$0200,$0000,$0001                   ;919114;
    dw $8200,$8000,$0024,$8200,$0000,$0002,$0200,$0000                   ;919124;
    dw $0014,$0200,$0000,$0007,$0000,$0000,$0001,$0100                   ;919134;
    dw $0100,$0009,$0100,$0000,$002D,$0000,$0000                         ;919144;
    dw Instruction_DemoInputObject_Delete                                ;919152;

InstList_DemoInput_EyeDoor:
    dw $000B,$0100,$0000,$0017,$0000,$0000,$0001,$0040                   ;919154;
    dw $0040,$0008,$0040,$0000,$0004,$0000,$0000,$0001                   ;919164;
    dw $0100,$0100,$0002,$0100,$0000,$000C,$0000,$0000                   ;919174;
    dw $0001,$2000,$2000,$0006,$2000,$0000,$000D,$0000                   ;919184;
    dw $0000,$0001,$0100,$0100,$000A,$0100,$0000,$0001                   ;919194;
    dw $0180,$0080,$0006,$0180,$0000,$000E,$0100,$0000                   ;9191A4;
    dw $0010,$0000,$0000,$0001,$0100,$0100,$0002,$0100                   ;9191B4;
    dw $0000,$0001,$0180,$0080,$0006,$0180,$0000,$000D                   ;9191C4;
    dw $0100,$0000,$0010,$0000,$0000,$0001,$0100,$0100                   ;9191D4;
    dw $0002,$0100,$0000,$0001,$0180,$0080,$0008,$0180                   ;9191E4;
    dw $0000,$001C,$0100,$0000,$0020,$0000,$0000,$0001                   ;9191F4;
    dw $0100,$0100,$0001,$0180,$0080,$000B,$0180,$0000                   ;919204;
    dw $0012,$0100,$0000,$0016,$0000,$0000,$0001,$0100                   ;919214;
    dw $0100,$0006,$0100,$0000,$0028,$0000,$0000,$0001                   ;919224;
    dw $0100,$0100,$0006,$0100,$0000,$0001,$0180,$0080                   ;919234;
    dw $0008,$0180,$0000,$0017,$0100,$0000,$000F,$0000                   ;919244;
    dw $0000,$0001,$0080,$0080,$0006,$0080,$0000,$000A                   ;919254;
    dw $0000,$0000,$0001,$0040,$0040,$0006,$0040,$0000                   ;919264;
    dw $0025,$0000,$0000,$0001,$0200,$0200,$0007,$0200                   ;919274;
    dw $0000,$0008,$0000,$0000,$0001,$0100,$0100,$0007                   ;919284;
    dw $0100,$0000,$0052,$0000,$0000,$0001,$0080,$0080                   ;919294;
    dw $0007,$0080,$0000,$0011,$0000,$0000,$0001,$0040                   ;9192A4;
    dw $0040,$0004,$0040,$0000,$000C,$0000,$0000,$0001                   ;9192B4;
    dw $0080,$0080,$000B,$0080,$0000,$001E,$0000,$0000                   ;9192C4;
    dw $0001,$0040,$0040,$0006,$0040,$0000,$000D,$0000                   ;9192D4;
    dw $0000,$0001,$0080,$0080,$0005,$0080,$0000,$000D                   ;9192E4;
    dw $0000,$0000,$0001,$0040,$0040,$0006,$0040,$0000                   ;9192F4;
    dw $007C,$0000,$0000,$0001,$0200,$0200,$0007,$0200                   ;919304;
    dw $0000,$0011,$0000,$0000,$0001,$0100,$0100,$0009                   ;919314;
    dw $0100,$0000,$0001,$0140,$0040,$0003,$0140,$0000                   ;919324;
    dw $0004,$0100,$0000                                                 ;919334;
    dw Instruction_DemoInputObject_Delete                                ;91933A;

InstList_DemoInput_Shinespark:
    dw $00A5,$0000,$0000                                                 ;91933C;
    dw Instruction_DemoInputObject_GotoY                                 ;919342;
    dw InstList_DemoInput_Shinespark                                     ;919344;

UNUSED_InstList_DemoInput_Shinespark_Unseen_919346:
    dw $0096,$0000,$0000,$0001,$0200,$0200,$00CC,$0200                   ;919346;
    dw $0000,$0001,$8200,$8000,$0076,$8200,$0000,$0002                   ;919356;
    dw $8000,$0000,$0001,$8100,$0100,$00B6,$8100,$0000                   ;919366;
    dw $000C,$0100,$0000,$0001,$0180,$0080,$0006,$0180                   ;919376;
    dw $0000,$000E,$0100,$0000,$0024,$0000,$0000,$0001                   ;919386;
    dw $2000,$2000,$0005,$2000,$0000,$000B,$0000,$0000                   ;919396;
    dw $0001,$2000,$2000,$0004,$2000,$0000,$000E,$0000                   ;9193A6;
    dw $0000,$0001,$0040,$0040,$0007,$0040,$0000,$00F0                   ;9193B6;
    dw $0000,$0000                                                       ;9193C6;
    dw Instruction_DemoInputObject_Delete                                ;9193CA;

InstList_DemoInput_MissileDoor:
    dw $0029,$0000,$0000,$0001,$0100,$0100,$0031,$0100                   ;9193CC;
    dw $0000,$0044,$0000,$0000,$0001,$2000,$2000,$0005                   ;9193DC;
    dw $2000,$0000,$0023,$0000,$0000,$0001,$0040,$0040                   ;9193EC;
    dw $0008,$0040,$0000,$000A,$0000,$0000,$0001,$0040                   ;9193FC;
    dw $0040,$0008,$0040,$0000,$0011,$0000,$0000,$0001                   ;91940C;
    dw $0040,$0040,$0007,$0040,$0000,$000D,$0000,$0000                   ;91941C;
    dw $0001,$0040,$0040,$0008,$0040,$0000,$0007,$0000                   ;91942C;
    dw $0000,$0001,$0040,$0040,$0009,$0040,$0000,$0020                   ;91943C;
    dw $0000,$0000,$0001,$8100,$8100,$0011,$8100,$0000                   ;91944C;
    dw $001A,$0000,$0000                                                 ;91945C;
    dw Instruction_DemoInputObject_Delete                                ;919462;

InstList_DemoInput_Kraid:
    dw $0200,$0000,$0000                                                 ;919464;
    dw Instruction_DemoInputObject_Delete                                ;91946A;

InstList_DemoInput_FireFleaRoom:
    dw $002B,$0000,$0000,$0001,$0200,$0200,$0046,$0200                   ;91946C;
    dw $0000,$0037,$0000,$0000,$0001,$0200,$0200,$000C                   ;91947C;
    dw $0200,$0000,$0001,$0280,$0080,$0013,$0280,$0000                   ;91948C;
    dw $0013,$0200,$0000,$0001,$0240,$0040,$000B,$0240                   ;91949C;
    dw $0000,$0005,$0200,$0000,$0001,$0280,$0080,$0015                   ;9194AC;
    dw $0280,$0000,$0025,$0200,$0000,$0001,$0280,$0080                   ;9194BC;
    dw $000E,$0280,$0000,$0021,$0200,$0000,$0001,$0280                   ;9194CC;
    dw $0080,$0009,$0280,$0000,$001D,$0200,$0000,$0008                   ;9194DC;
    dw $0000,$0000,$0001,$0020,$0020,$0001,$0020,$0000                   ;9194EC;
    dw $0001,$0420,$0400,$00C4,$0020,$0000                               ;9194FC;
    dw Instruction_DemoInputObject_Delete                                ;919508;

InstList_DemoInput_ScrewAttack:
    dw $0030,$0000,$0000,$0001,$8100,$8100,$001E,$8100                   ;91950A;
    dw $0000,$0001,$8180,$0080,$000C,$8180,$0000,$001C                   ;91951A;
    dw $8100,$0000,$0001,$8180,$0080,$0017,$8180,$0000                   ;91952A;
    dw $002B,$8100,$0000,$0001,$0400,$0400,$0003,$0000                   ;91953A;
    dw $0000,$0001,$0200,$0200,$0001,$0210,$0010,$009D                   ;91954A;
    dw $0010,$0000                                                       ;91955A;
    dw Instruction_DemoInputObject_Delete                                ;91955E;

InstList_DemoInput_BrinstarDiagonalRoom:
    dw $0029,$0000,$0000,$0001,$0100,$0100,$0012,$0100                   ;919560;
    dw $0000,$0001,$0180,$0080,$0016,$0180,$0000,$0041                   ;919570;
    dw $0100,$0000,$0014,$0000,$0000,$0001,$0010,$0010                   ;919580;
    dw $000A,$0010,$0000,$0001,$0050,$0040,$001D,$0050                   ;919590;
    dw $0000,$0005,$0040,$0000,$0001,$0440,$0400,$0037                   ;9195A0;
    dw $0440,$0000,$00DB,$0000,$0000                                     ;9195B0;
    dw Instruction_DemoInputObject_Delete                                ;9195BA;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_DemoInput_9195BC:
    dw $0029,$0000,$0000,$0001,$0200,$0200,$0018,$0200                   ;9195BC;
    dw $0000,$0011,$0000,$0000,$0001,$0080,$0080,$0018                   ;9195CC;
    dw $0080,$0000,$0001,$0280,$0200,$0005,$0280,$0000                   ;9195DC;
    dw $0010,$0200,$0000,$0020,$0000,$0000,$0001,$0080                   ;9195EC;
    dw $0080,$0009,$0080,$0000,$0001,$0280,$0200,$0015                   ;9195FC;
    dw $0280,$0000,$0016,$0200,$0000,$0014,$0000,$0000                   ;91960C;
    dw $0001,$0100,$0100,$0007,$0100,$0000,$0001,$0180                   ;91961C;
    dw $0080,$0018,$0180,$0000,$001D,$0100,$0000,$0010                   ;91962C;
    dw $0000,$0000,$0001,$0400,$0400,$0005,$0400,$0000                   ;91963C;
    dw $0001,$0600,$0200,$0096,$0000,$0000                               ;91964C;
    dw Instruction_DemoInputObject_Delete                                ;919658;
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_DemoInput_PreSporeSpawnHall:
    dw $001B,$0000,$0000,$0001,$0200,$0200,$0005,$0200                   ;91965A;
    dw $0000,$000F,$0000,$0000,$0001,$0100,$0100,$0005                   ;91966A;
    dw $0100,$0000,$0010,$0000,$0000,$0001,$0100,$0100                   ;91967A;
    dw $000D,$0100,$0000,$002A,$0100,$0000,$0007,$0000                   ;91968A;
    dw $0000,$0001,$0080,$0080,$0015,$0080,$0000,$001E                   ;91969A;
    dw $0000,$0000,$0001,$0200,$0200,$0013,$0200,$0000                   ;9196AA;
    dw $0010,$0000,$0000,$0001,$0100,$0100,$0008,$0100                   ;9196BA;
    dw $0000,$0001,$0180,$0080,$000F,$0180,$0000,$0001                   ;9196CA;
    dw $0080,$0000,$0001,$0280,$0200,$0007,$0280,$0000                   ;9196DA;
    dw $0004,$0200,$0000,$0001,$0000,$0000,$0001,$0100                   ;9196EA;
    dw $0100,$0004,$0100,$0000,$0001,$0140,$0040,$0009                   ;9196FA;
    dw $0140,$0000,$0005,$0140,$0000,$004C,$0040,$0000                   ;91970A;
    dw $0001,$0440,$0400,$0003,$0040,$0000,$0001,$0050                   ;91971A;
    dw $0010,$0004,$0050,$0000,$0084,$0010,$0000                         ;91972A;
    dw Instruction_DemoInputObject_Delete                                ;919738;

InstList_DemoInput_GrappleBeam:
    dw $0010,$0000,$0000,$0001,$2000,$2000,$000C,$0000                   ;91973A;
    dw $0000,$0001,$2000,$2000,$000C,$0000,$0000,$0001                   ;91974A;
    dw $2000,$2000,$000C,$0000,$0000,$0001,$2000,$2000                   ;91975A;
    dw $000C,$0000,$0000,$0001,$0010,$0010,$0022,$0010                   ;91976A;
    dw $0000,$0001,$0050,$0040,$0010,$0050,$0000,$0001                   ;91977A;
    dw $0650,$0600,$0006,$0650,$0000,$000C,$0450,$0000                   ;91978A;
    dw $0001,$0550,$0100,$0004,$0550,$0000,$0012,$0150                   ;91979A;
    dw $0000,$0006,$0110,$0000,$0001,$0150,$0040,$0007                   ;9197AA;
    dw $0150,$0000,$0001,$0550,$0400,$0004,$0550,$0000                   ;9197BA;
    dw $0016,$0450,$0000,$0001,$0550,$0100,$0005,$0550                   ;9197CA;
    dw $0000,$000B,$0150,$0000,$0007,$0110,$0000,$0001                   ;9197DA;
    dw $0150,$0040,$000A,$0150,$0000,$0001,$0550,$0400                   ;9197EA;
    dw $000C,$0550,$0000,$000E,$0150,$0000,$000A,$0110                   ;9197FA;
    dw $0000,$0001,$0150,$0040,$0008,$0150,$0000,$0001                   ;91980A;
    dw $0550,$0400,$000C,$0550,$0000,$000E,$0150,$0000                   ;91981A;
    dw $000A,$0110,$0000,$0001,$0150,$0040,$0008,$0150                   ;91982A;
    dw $0000,$0001,$0550,$0400,$000D,$0550,$0000,$000E                   ;91983A;
    dw $0150,$0000,$000A,$0110,$0000,$0001,$0150,$0040                   ;91984A;
    dw $0009,$0150,$0000,$0001,$0550,$0400,$000C,$0550                   ;91985A;
    dw $0000,$0008,$0150,$0000,$0004,$0100,$0000,$0020                   ;91986A;
    dw $0000,$0000,$0001,$0400,$0400,$0005,$0400,$0000                   ;91987A;
    dw $0001,$0200,$0200,$0005,$0200,$0000,$0028,$0000                   ;91988A;
    dw $0000                                                             ;91989A;
    dw Instruction_DemoInputObject_Delete                                ;91989C;

InstList_DemoInput_IceBeam:
    dw $0021,$0000,$0000,$0001,$0040,$0040,$0005,$0040                   ;91989E;
    dw $0000,$0006,$0000,$0000,$0001,$0040,$0040,$0005                   ;9198AE;
    dw $0040,$0000,$0012,$0000,$0000,$0001,$0200,$0200                   ;9198BE;
    dw $0017,$0200,$0000,$001C,$0000,$0000,$0001,$0080                   ;9198CE;
    dw $0080,$000E,$0080,$0000,$0001,$0480,$0400,$0005                   ;9198DE;
    dw $0480,$0000,$000B,$0400,$0000,$0001,$0440,$0040                   ;9198EE;
    dw $0006,$0440,$0000,$0008,$0400,$0000,$0007,$0000                   ;9198FE;
    dw $0000,$0001,$0200,$0200,$001D,$0200,$0000,$0009                   ;91990E;
    dw $0000,$0000,$0001,$0200,$0200,$000E,$0200,$0000                   ;91991E;
    dw $0001,$0280,$0080,$001D,$0280,$0000,$0038,$0200                   ;91992E;
    dw $0000,$0001,$0280,$0080,$0016,$0280,$0000,$002B                   ;91993E;
    dw $0200,$0000,$0001,$0080,$0080,$0010,$0080,$0000                   ;91994E;
    dw $0001,$0480,$0400,$0008,$0480,$0000,$0005,$0400                   ;91995E;
    dw $0000,$0001,$0440,$0040,$0008,$0440,$0000,$0008                   ;91996E;
    dw $0400,$0000,$0008,$0000,$0000,$0001,$0200,$0200                   ;91997E;
    dw $002B,$0200,$0000,$0001,$0280,$0080,$0010,$0280                   ;91998E;
    dw $0000,$0012,$0200,$0000,$005D,$0000,$0000                         ;91999E;
    dw Instruction_DemoInputObject_Delete                                ;9199AC;

InstList_DemoInput_GauntletEntrance:
    dw $0016,$0000,$0000,$0001,$0100,$0100,$0005,$0100                   ;9199AE;
    dw $0000,$0100,$0000,$0000                                           ;9199BE;
    dw Instruction_DemoInputObject_Delete                                ;9199C6;

InstList_DemoInput_AdvancedGrappleBeam:
    dw $003F,$0000,$0000,$0001,$0100,$0100,$0005,$0100                   ;9199C8;
    dw $0000,$001E,$0000,$0000,$0001,$0200,$0200,$0005                   ;9199D8;
    dw $0200,$0000,$0016,$0000,$0000,$0001,$2000,$2000                   ;9199E8;
    dw $0004,$2000,$0000,$000D,$0000,$0000,$0001,$2000                   ;9199F8;
    dw $2000,$0005,$2000,$0000,$0008,$0000,$0000,$0001                   ;919A08;
    dw $2000,$2000,$0006,$2000,$0000,$0007,$0000,$0000                   ;919A18;
    dw $0001,$2000,$2000,$0005,$2000,$0000,$002F,$0000                   ;919A28;
    dw $0000,$0001,$0200,$0200,$0014,$0200,$0000,$0002                   ;919A38;
    dw $0000,$0000,$0001,$0100,$0100,$0006,$0100,$0000                   ;919A48;
    dw $0009,$0000,$0000,$0001,$0040,$0040,$0019,$0040                   ;919A58;
    dw $0000,$0001,$0440,$0400,$0005,$0440,$0000,$0001                   ;919A68;
    dw $0540,$0100,$0002,$0540,$0000,$0006,$0140,$0000                   ;919A78;
    dw $0027,$0040,$0000,$0001,$0240,$0200,$000D,$0240                   ;919A88;
    dw $0000,$0034,$0040,$0000,$0001,$0140,$0100,$0007                   ;919A98;
    dw $0140,$0000,$0037,$0040,$0000,$0001,$0240,$0200                   ;919AA8;
    dw $000F,$0240,$0000,$002F,$0040,$0000,$0001,$0140                   ;919AB8;
    dw $0100,$00B1,$0140,$0000,$0001,$01C0,$0080,$000B                   ;919AC8;
    dw $01C0,$0000,$00BA,$0180,$0000,$0003,$0100,$0000                   ;919AD8;
    dw $0046,$0000,$0000                                                 ;919AE8;
    dw Instruction_DemoInputObject_Delete                                ;919AEE;

InstList_DemoInput_IBJ:
    dw $0019,$0000,$0000,$0001,$0100,$0100,$0022,$0100                   ;919AF0;
    dw $0000,$0018,$0000,$0000,$0001,$0080,$0080,$000B                   ;919B00;
    dw $0080,$0000,$0001,$0480,$0400,$0007,$0480,$0000                   ;919B10;
    dw $0002,$0080,$0000,$0001,$0480,$0400,$0008,$0480                   ;919B20;
    dw $0000,$0001,$04C0,$0040,$0003,$04C0,$0000,$000A                   ;919B30;
    dw $00C0,$0000,$0002,$0080,$0000,$0020,$0000,$0000                   ;919B40;
    dw $0001,$0040,$0040,$000B,$0040,$0000,$0025,$0000                   ;919B50;
    dw $0000,$0001,$0040,$0040,$0009,$0040,$0000,$0026                   ;919B60;
    dw $0000,$0000,$0001,$0040,$0040,$0009,$0040,$0000                   ;919B70;
    dw $0026,$0000,$0000,$0001,$0040,$0040,$0008,$0040                   ;919B80;
    dw $0000,$0027,$0000,$0000,$0001,$0040,$0040,$0009                   ;919B90;
    dw $0040,$0000,$0028,$0000,$0000,$0001,$0040,$0040                   ;919BA0;
    dw $0008,$0040,$0000,$0028,$0000,$0000,$0001,$0040                   ;919BB0;
    dw $0040,$0009,$0040,$0000,$0026,$0000,$0000,$0001                   ;919BC0;
    dw $0040,$0040,$0008,$0040,$0000,$0028,$0000,$0000                   ;919BD0;
    dw $0001,$0040,$0040,$0007,$0040,$0000,$0029,$0000                   ;919BE0;
    dw $0000,$0001,$0040,$0040,$0007,$0040,$0000,$0029                   ;919BF0;
    dw $0000,$0000,$0001,$0040,$0040,$0007,$0040,$0000                   ;919C00;
    dw $0028,$0000,$0000,$0001,$0040,$0040,$0008,$0040                   ;919C10;
    dw $0000,$0027,$0000,$0000,$0001,$0040,$0040,$0007                   ;919C20;
    dw $0040,$0000,$002A,$0000,$0000,$0001,$0040,$0040                   ;919C30;
    dw $0007,$0040,$0000,$002A,$0000,$0000,$0001,$0040                   ;919C40;
    dw $0040,$0007,$0040,$0000,$0028,$0000,$0000,$0001                   ;919C50;
    dw $0040,$0040,$0007,$0040,$0000,$0028,$0000,$0000                   ;919C60;
    dw $0001,$0040,$0040,$0007,$0040,$0000,$0010,$0000                   ;919C70;
    dw $0000,$0001,$0100,$0100,$001E,$0100,$0000,$0017                   ;919C80;
    dw $0000,$0000,$0001,$0800,$0800,$0009,$0800,$0000                   ;919C90;
    dw $0008,$0000,$0000,$0001,$0800,$0800,$0005,$0800                   ;919CA0;
    dw $0000,$0001,$0000,$0000,$0001,$0800,$0800,$0009                   ;919CB0;
    dw $0000,$0000,$0001,$0200,$0200,$0004,$0200,$0000                   ;919CC0;
    dw $00C4,$0000,$0000                                                 ;919CD0;
    dw Instruction_DemoInputObject_Delete                                ;919CD6;

InstList_DemoInput_SBA:
    dw $001A,$0000,$0000,$0001,$2000,$2000,$0008,$2000                   ;919CD8;
    dw $0000,$0006,$0000,$0000,$0001,$2000,$2000,$0006                   ;919CE8;
    dw $2000,$0000,$0006,$0000,$0000,$0001,$2000,$2000                   ;919CF8;
    dw $0006,$2000,$0000,$0008,$0000,$0000,$0001,$0080                   ;919D08;
    dw $0080,$0003,$0080,$0000,$0001,$0180,$0100,$0023                   ;919D18;
    dw $0180,$0000,$0007,$0100,$0000,$0010,$0000,$0000                   ;919D28;
    dw $0001,$0080,$0080,$0010,$0080,$0000,$0001,$0280                   ;919D38;
    dw $0200,$0007,$0280,$0000,$0001,$02C0,$0040,$0004                   ;919D48;
    dw $02C0,$0000,$000E,$0240,$0000,$0010,$0040,$0000                   ;919D58;
    dw $0001,$00C0,$0080,$0008,$00C0,$0000,$0001,$01C0                   ;919D68;
    dw $0100,$000B,$01C0,$0000,$0014,$0140,$0000,$0015                   ;919D78;
    dw $0040,$0000,$0001,$0440,$0400,$0006,$0440,$0000                   ;919D88;
    dw $0040,$0040,$0000,$0034,$0000,$0000                               ;919D98;
    dw Instruction_DemoInputObject_Delete                                ;919DA4;

InstList_DemoInput_TourianEntrance:
    dw $0195,$0000,$0000                                                 ;919DA6;
    dw Instruction_DemoInputObject_Delete                                ;919DAC;

InstList_DemoInput_CrystalFlash:
    dw $001B,$0000,$0000,$0001,$0400,$0400,$0005,$0400                   ;919DAE;
    dw $0000,$0005,$0000,$0000,$0001,$0400,$0400,$0007                   ;919DBE;
    dw $0400,$0000,$0009,$0000,$0000,$0001,$2000,$2000                   ;919DCE;
    dw $0006,$2000,$0000,$0006,$0000,$0000,$0001,$2000                   ;919DDE;
    dw $2000,$0005,$2000,$0000,$0008,$0000,$0000,$0001                   ;919DEE;
    dw $2000,$2000,$0007,$2000,$0000,$0031,$0000,$0000                   ;919DFE;
    dw $0001,$0430,$0430,$0009,$0430,$0000,$0001,$0470                   ;919E0E;
    dw $0040,$0010,$0470,$0000,$001E,$0430,$0000,$0001                   ;919E1E;
    dw $0470,$0040,$00BE,$0470,$0000,$0003,$0070,$0000                   ;919E2E;
    dw $0001,$0030,$0000,$0001,$0010,$0000,$013C,$0000                   ;919E3E;
    dw $0000                                                             ;919E4E;
    dw Instruction_DemoInputObject_Delete                                ;919E50;

DemoInputObjects_Title_LandingSite:
    dw RTS_9183BF                                                        ;919E52;
    dw PreInstruction_DemoInput_Normal                                   ;919E54;
    dw InstList_DemoInput_LandingSite                                    ;919E56;

DemoInputObjects_Title_PseudoScrewAttack:
    dw RTS_9183BF                                                        ;919E58;
    dw PreInstruction_DemoInput_Normal                                   ;919E5A;
    dw InstList_DemoInput_PseudoScrewAttack                              ;919E5C;

DemoInputObjects_Title_SpeedBooster:
    dw RTS_9183BF                                                        ;919E5E;
    dw PreInstruction_DemoInput_Normal                                   ;919E60;
    dw InstList_DemoInput_SpeedBooster                                   ;919E62;

DemoInputObjects_Title_Dachora:
    dw RTS_9183BF                                                        ;919E64;
    dw PreInstruction_DemoInput_Normal                                   ;919E66;
    dw InstList_DemoInput_Dachora                                        ;919E68;

DemoInputObjects_Title_RedBrinstarElevator:
    dw RTS_9183BF                                                        ;919E6A;
    dw PreInstruction_DemoInput_Normal                                   ;919E6C;
    dw InstList_DemoInput_RedBrinstarElevator                            ;919E6E;

DemoInputObjects_Title_WreckedShipBasement:
    dw RTS_9183BF                                                        ;919E70;
    dw PreInstruction_DemoInput_Normal                                   ;919E72;
    dw InstList_DemoInput_WreckedShipBasement                            ;919E74;

DemoInputObjects_Title_LowerNorfairEntrance:
    dw RTS_9183BF                                                        ;919E76;
    dw PreInstruction_DemoInput_Normal                                   ;919E78;
    dw InstList_DemoInput_LowerNorfairEntrance                           ;919E7A;

DemoInputObjects_Title_EyeDoor:
    dw RTS_9183BF                                                        ;919E7C;
    dw PreInstruction_DemoInput_Normal                                   ;919E7E;
    dw InstList_DemoInput_EyeDoor                                        ;919E80;

DemoInputObjects_Title_Shinespark:
    dw RTS_9183BF                                                        ;919E82;
    dw PreInstruction_DemoInput_Shinespark                               ;919E84;
    dw InstList_DemoInput_Shinespark                                     ;919E86;

DemoInputObjects_Title_MissileDoor:
    dw RTS_9183BF                                                        ;919E88;
    dw PreInstruction_DemoInput_Normal                                   ;919E8A;
    dw InstList_DemoInput_MissileDoor                                    ;919E8C;

DemoInputObjects_Title_Kraid:
    dw RTS_9183BF                                                        ;919E8E;
    dw PreInstruction_DemoInput_Normal                                   ;919E90;
    dw InstList_DemoInput_Kraid                                          ;919E92;

DemoInputObjects_Title_FireFleaRoom:
    dw RTS_9183BF                                                        ;919E94;
    dw PreInstruction_DemoInput_Normal                                   ;919E96;
    dw InstList_DemoInput_FireFleaRoom                                   ;919E98;

DemoInputObjects_Title_ScrewAttack:
    dw RTS_9183BF                                                        ;919E9A;
    dw PreInstruction_DemoInput_Normal                                   ;919E9C;
    dw InstList_DemoInput_ScrewAttack                                    ;919E9E;

DemoInputObjects_Title_BrinstarDiagonalRoom:
    dw RTS_9183BF                                                        ;919EA0;
    dw PreInstruction_DemoInput_Normal                                   ;919EA2;
    dw InstList_DemoInput_BrinstarDiagonalRoom                           ;919EA4;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_DemoInputObjects_Title_919EA6:
    dw RTS_9183BF                                                        ;919EA6;
    dw PreInstruction_DemoInput_Normal                                   ;919EA8;
    dw UNUSED_InstList_DemoInput_9195BC                                  ;919EAA;
endif ; !FEATURE_KEEP_UNREFERENCED

DemoInputObjects_Title_PreSporeSpawnHall:
    dw RTS_9183BF                                                        ;919EAC;
    dw PreInstruction_DemoInput_Normal                                   ;919EAE;
    dw InstList_DemoInput_PreSporeSpawnHall                              ;919EB0;

DemoInputObjects_Title_GrappleBeam:
    dw RTS_9183BF                                                        ;919EB2;
    dw PreInstruction_DemoInput_Normal                                   ;919EB4;
    dw InstList_DemoInput_GrappleBeam                                    ;919EB6;

DemoInputObjects_Title_IceBeam:
    dw RTS_9183BF                                                        ;919EB8;
    dw PreInstruction_DemoInput_Normal                                   ;919EBA;
    dw InstList_DemoInput_IceBeam                                        ;919EBC;

DemoInputObjects_Title_GauntletEntrance:
    dw RTS_9183BF                                                        ;919EBE;
    dw PreInstruction_DemoInput_Normal                                   ;919EC0;
    dw InstList_DemoInput_GauntletEntrance                               ;919EC2;

DemoInputObjects_Title_AdvancedGrappleBeam:
    dw RTS_9183BF                                                        ;919EC4;
    dw PreInstruction_DemoInput_Normal                                   ;919EC6;
    dw InstList_DemoInput_AdvancedGrappleBeam                            ;919EC8;

DemoInputObjects_Title_IBJ:
    dw RTS_9183BF                                                        ;919ECA;
    dw PreInstruction_DemoInput_Normal                                   ;919ECC;
    dw InstList_DemoInput_IBJ                                            ;919ECE;

DemoInputObjects_Title_SBA:
    dw RTS_9183BF                                                        ;919ED0;
    dw PreInstruction_DemoInput_Normal                                   ;919ED2;
    dw InstList_DemoInput_SBA                                            ;919ED4;

DemoInputObjects_Title_TourianEntrance:
    dw RTS_9183BF                                                        ;919ED6;
    dw PreInstruction_DemoInput_Normal                                   ;919ED8;
    dw InstList_DemoInput_TourianEntrance                                ;919EDA;

DemoInputObjects_Title_CrystalFlash:
    dw RTS_9183BF                                                        ;919EDC;
    dw PreInstruction_DemoInput_Normal                                   ;919EDE;
    dw InstList_DemoInput_CrystalFlash                                   ;919EE0;

TransitionTable:
    dw TransitionTable_00_9B_FacingForward                               ;919EE2;
    dw TransitionTable_01_03_05_07_A4_A6_E0_E2_E4_E6_FacingRight         ;919EE4;
    dw TransitionTable_02_04_06_08_A5_A7_E1_E3_E5_E7_FacingLeft          ;919EE6;
    dw TransitionTable_01_03_05_07_A4_A6_E0_E2_E4_E6_FacingRight         ;919EE8;
    dw TransitionTable_02_04_06_08_A5_A7_E1_E3_E5_E7_FacingLeft          ;919EEA;
    dw TransitionTable_01_03_05_07_A4_A6_E0_E2_E4_E6_FacingRight         ;919EEC;
    dw TransitionTable_02_04_06_08_A5_A7_E1_E3_E5_E7_FacingLeft          ;919EEE;
    dw TransitionTable_01_03_05_07_A4_A6_E0_E2_E4_E6_FacingRight         ;919EF0;
    dw TransitionTable_02_04_06_08_A5_A7_E1_E3_E5_E7_FacingLeft          ;919EF2;
    dw TransitionTable_09_0D_0F_11_MovingRight                           ;919EF4;
    dw TransitionTable_0A_0E_10_12_MovingLeft                            ;919EF6;
    dw TransitionTable_0B_MovingRight_GunExtended                        ;919EF8;
    dw TransitionTable_0C_MovingLeft_GunExtended                         ;919EFA;
    dw TransitionTable_09_0D_0F_11_MovingRight                           ;919EFC;
    dw TransitionTable_0A_0E_10_12_MovingLeft                            ;919EFE;
    dw TransitionTable_09_0D_0F_11_MovingRight                           ;919F00;
    dw TransitionTable_0A_0E_10_12_MovingLeft                            ;919F02;
    dw TransitionTable_09_0D_0F_11_MovingRight                           ;919F04;
    dw TransitionTable_0A_0E_10_12_MovingLeft                            ;919F06;
    dw TransitionTable_13_FaceRight_NormalJump_NotMoving_GunExtend       ;919F08;
    dw TransitionTable_14_FacingLeft_NormalJump_NotMoving_GunExtend      ;919F0A;
    dw TransitionTable_15_4D_51_69_6B_FacingRight_NormalJump             ;919F0C;
    dw TransitionTable_16_4E_52_6A_6C_FacingLeft_NormalJump              ;919F0E;
    dw TransitionTable_17_FacingRight_NormalJump_AimingDown              ;919F10;
    dw TransitionTable_18_FacingLeft_NormalJump_AimingDown               ;919F12;
    dw TransitionTable_19_FacingRIght_SpinJump                           ;919F14;
    dw TransitionTable_1A_FacingLeft_SpinJump                            ;919F16;
    dw TransitionTable_1B_FacingRight_SpaceJump                          ;919F18;
    dw TransitionTable_1C_FacingLeft_SpaceJump                           ;919F1A;
    dw TransitionTable_1D_FaceRight_MorphBall_NoSpringBall_OnGround      ;919F1C;
    dw TransitionTable_1E_MoveRight_MorphBall_NoSpringBall_OnGround      ;919F1E;
    dw TransitionTable_1F_MoveLeft_MorphBall_NoSpringBall_OnGround       ;919F20;
    dw UNUSED_TransitionTable_20_21_22_24_91A666                         ;919F22;
    dw UNUSED_TransitionTable_20_21_22_24_91A666                         ;919F24;
    dw UNUSED_TransitionTable_20_21_22_24_91A666                         ;919F26;
    dw UNUSED_TransitionTable_23_91A668                                  ;919F28;
    dw UNUSED_TransitionTable_20_21_22_24_91A666                         ;919F2A;
    dw TransitionTable_25_FacingRight_Turning_Standing                   ;919F2C;
    dw TransitionTable_26_FacingLeft_Turning_Standing                    ;919F2E;
    dw TransitionTable_27_71_73_85_FacingRight_Crouching                 ;919F30;
    dw TransitionTable_28_72_74_86_Crouching                             ;919F32;
    dw TransitionTable_29_2B_6D_6F_FacingRight_Falling                   ;919F34;
    dw TransitionTable_2A_2C_6E_70_FacingLeft_Falling                    ;919F36;
    dw TransitionTable_29_2B_6D_6F_FacingRight_Falling                   ;919F38;
    dw TransitionTable_2A_2C_6E_70_FacingLeft_Falling                    ;919F3A;
    dw TransitionTable_2D_FacingRight_Falling_AimingDown                 ;919F3C;
    dw TransitionTable_2E_FacingLeft_Falling_AimingDown                  ;919F3E;
    dw TransitionTable_Terminator_91A0DE                                 ;919F40;
    dw TransitionTable_Terminator_91A0DE                                 ;919F42;
    dw TransitionTable_31_FacingRight_MorphBall_NoSpringBall_InAir       ;919F44;
    dw TransitionTable_32_FacingLeft_MorphBall_NoSpringBall_InAir        ;919F46;
    dw UNUSED_TransitionTable_33_91A7C8                                  ;919F48;
    dw UNUSED_TransitionTable_34_91A7CA                                  ;919F4A;
    dw TransitionTable_Terminator_91A0DE                                 ;919F4C;
    dw TransitionTable_Terminator_91A0DE                                 ;919F4E;
    dw TransitionTable_Terminator_91A0DE                                 ;919F50;
    dw TransitionTable_Terminator_91A0DE                                 ;919F52;
    dw TransitionTable_Terminator_91A0DE                                 ;919F54;
    dw TransitionTable_Terminator_91A0DE                                 ;919F56;
    dw TransitionTable_Terminator_91A0DE                                 ;919F58;
    dw TransitionTable_Terminator_91A0DE                                 ;919F5A;
    dw TransitionTable_3D_FacingRight_Unmorphing                         ;919F5C;
    dw TransitionTable_3E_FacingLeft_Unmorphing                          ;919F5E;
    dw TransitionTable_Terminator_91A0DE                                 ;919F60;
    dw TransitionTable_Terminator_91A0DE                                 ;919F62;
    dw TransitionTable_1D_FaceLeft_MorphBall_NoSpringBall_OnGround       ;919F64;
    dw UNUSED_TransitionTable_42_91A66A                                  ;919F66;
    dw TransitionTable_Terminator_91A0DE                                 ;919F68;
    dw TransitionTable_Terminator_91A0DE                                 ;919F6A;
    dw UNUSED_TransitionTable_45_91A7CC                                  ;919F6C;
    dw UNUSED_TransitionTable_46_91A7E0                                  ;919F6E;
    dw UNUSED_TransitionTable_47_91A7F4                                  ;919F70;
    dw UNUSED_TransitionTable_48_91A834                                  ;919F72;
    dw TransitionTable_49_75_77_FacingLeft_Moonwalk                      ;919F74;
    dw TransitionTable_4A_76_78_FacingRight_Moonwalk                     ;919F76;
    dw TransitionTable_4B_55_57_59_FacingRight_NormalJumpTransition      ;919F78;
    dw TransitionTable_4C_56_58_5A_FacingLeft_NormalJumpTransition       ;919F7A;
    dw TransitionTable_15_4D_51_69_6B_FacingRight_NormalJump             ;919F7C;
    dw TransitionTable_16_4E_52_6A_6C_FacingLeft_NormalJump              ;919F7E;
    dw TransitionTable_4F_FacingLeft_DamageBoost                         ;919F80;
    dw TransitionTable_50_FacingRight_DamageBoost                        ;919F82;
    dw TransitionTable_15_4D_51_69_6B_FacingRight_NormalJump             ;919F84;
    dw TransitionTable_16_4E_52_6A_6C_FacingLeft_NormalJump              ;919F86;
    dw TransitionTable_53_FacingRight_Knockback                          ;919F88;
    dw TransitionTable_54_FacingLeft_Knockback                           ;919F8A;
    dw TransitionTable_4B_55_57_59_FacingRight_NormalJumpTransition      ;919F8C;
    dw TransitionTable_4C_56_58_5A_FacingLeft_NormalJumpTransition       ;919F8E;
    dw TransitionTable_4B_55_57_59_FacingRight_NormalJumpTransition      ;919F90;
    dw TransitionTable_4C_56_58_5A_FacingLeft_NormalJumpTransition       ;919F92;
    dw TransitionTable_4B_55_57_59_FacingRight_NormalJumpTransition      ;919F94;
    dw TransitionTable_4C_56_58_5A_FacingLeft_NormalJumpTransition       ;919F96;
    dw UNUSED_TransitionTable_5B_91A8FC                                  ;919F98;
    dw UNUSED_TransitionTable_5C_91A904                                  ;919F9A;
    dw TransitionTable_Terminator_91A0DE                                 ;919F9C;
    dw TransitionTable_Terminator_91A0DE                                 ;919F9E;
    dw TransitionTable_Terminator_91A0DE                                 ;919FA0;
    dw TransitionTable_Terminator_91A0DE                                 ;919FA2;
    dw TransitionTable_Terminator_91A0DE                                 ;919FA4;
    dw TransitionTable_Terminator_91A0DE                                 ;919FA6;
    dw UNUSED_TransitionTable_63_91A990                                  ;919FA8;
    dw UNUSED_TransitionTable_64_91A998                                  ;919FAA;
    dw UNUSED_TransitionTable_65_91A9A0                                  ;919FAC;
    dw UNUSED_TransitionTable_66_91A9C6                                  ;919FAE;
    dw TransitionTable_67_FacingRight_Falling_GunExtended                ;919FB0;
    dw TransitionTable_68_FacingLeft_Falling_GunExtended                 ;919FB2;
    dw TransitionTable_15_4D_51_69_6B_FacingRight_NormalJump             ;919FB4;
    dw TransitionTable_16_4E_52_6A_6C_FacingLeft_NormalJump              ;919FB6;
    dw TransitionTable_15_4D_51_69_6B_FacingRight_NormalJump             ;919FB8;
    dw TransitionTable_16_4E_52_6A_6C_FacingLeft_NormalJump              ;919FBA;
    dw TransitionTable_29_2B_6D_6F_FacingRight_Falling                   ;919FBC;
    dw TransitionTable_2A_2C_6E_70_FacingLeft_Falling                    ;919FBE;
    dw TransitionTable_29_2B_6D_6F_FacingRight_Falling                   ;919FC0;
    dw TransitionTable_2A_2C_6E_70_FacingLeft_Falling                    ;919FC2;
    dw TransitionTable_27_71_73_85_FacingRight_Crouching                 ;919FC4;
    dw TransitionTable_28_72_74_86_Crouching                             ;919FC6;
    dw TransitionTable_27_71_73_85_FacingRight_Crouching                 ;919FC8;
    dw TransitionTable_28_72_74_86_Crouching                             ;919FCA;
    dw TransitionTable_49_75_77_FacingLeft_Moonwalk                      ;919FCC;
    dw TransitionTable_4A_76_78_FacingRight_Moonwalk                     ;919FCE;
    dw TransitionTable_49_75_77_FacingLeft_Moonwalk                      ;919FD0;
    dw TransitionTable_4A_76_78_FacingRight_Moonwalk                     ;919FD2;
    dw TransitionTable_79_7B_FacingRight_MorphBall_Spring_OnGround       ;919FD4;
    dw TransitionTable_7A_7C_FacingLeft_MorphBall_Spring_OnGround        ;919FD6;
    dw TransitionTable_79_7B_FacingRight_MorphBall_Spring_OnGround       ;919FD8;
    dw TransitionTable_7A_7C_FacingLeft_MorphBall_Spring_OnGround        ;919FDA;
    dw TransitionTable_7D_FacingRight_MorphBall_SpringBall_Falling       ;919FDC;
    dw TransitionTable_7E_FacingLeft_MorphBall_SpringBall_Falling        ;919FDE;
    dw TransitionTable_7F_FacingRight_MorphBall_SpringBall_InAir         ;919FE0;
    dw TransitionTable_80_FacingLeft_MorphBall_SpringBall_InAir          ;919FE2;
    dw TransitionTable_81_ScrewAttack                                    ;919FE4;
    dw TransitionTable_82_FacingLeft_ScrewAttack                         ;919FE6;
    dw TransitionTable_83_FacingRight_WallJump                           ;919FE8;
    dw TransitionTable_84_FacingLeft_WallJump                            ;919FEA;
    dw TransitionTable_27_71_73_85_FacingRight_Crouching                 ;919FEC;
    dw TransitionTable_28_72_74_86_Crouching                             ;919FEE;
    dw TransitionTable_Terminator_91A0DE                                 ;919FF0;
    dw TransitionTable_Terminator_91A0DE                                 ;919FF2;
    dw TransitionTable_89_CF_D1_FacingRight_RanIntoAWall                 ;919FF4;
    dw TransitionTable_8A_D0_D2_FacingLeft_RanIntoAWall                  ;919FF6;
    dw TransitionTable_8B_FacingRight_Turning_Standing_AimingUp          ;919FF8;
    dw TransitionTable_8C_FacingLeft_Turning_Standing_AimingUp           ;919FFA;
    dw TransitionTable_8D_FacingRight_Turning_Standing_AimDownRight      ;919FFC;
    dw TransitionTable_8E_FacingLeft_Turning_Standing_AimDownLeft        ;919FFE;
    dw TransitionTable_Terminator_91A0DE                                 ;91A000;
    dw TransitionTable_Terminator_91A0DE                                 ;91A002;
    dw TransitionTable_Terminator_91A0DE                                 ;91A004;
    dw TransitionTable_Terminator_91A0DE                                 ;91A006;
    dw TransitionTable_Terminator_91A0DE                                 ;91A008;
    dw TransitionTable_Terminator_91A0DE                                 ;91A00A;
    dw TransitionTable_Terminator_91A0DE                                 ;91A00C;
    dw TransitionTable_Terminator_91A0DE                                 ;91A00E;
    dw TransitionTable_Terminator_91A0DE                                 ;91A010;
    dw TransitionTable_Terminator_91A0DE                                 ;91A012;
    dw TransitionTable_Terminator_91A0DE                                 ;91A014;
    dw TransitionTable_Terminator_91A0DE                                 ;91A016;
    dw TransitionTable_00_9B_FacingForward                               ;91A018;
    dw TransitionTable_Terminator_91A0DE                                 ;91A01A;
    dw TransitionTable_Terminator_91A0DE                                 ;91A01C;
    dw TransitionTable_Terminator_91A0DE                                 ;91A01E;
    dw TransitionTable_Terminator_91A0DE                                 ;91A020;
    dw TransitionTable_Terminator_91A0DE                                 ;91A022;
    dw TransitionTable_Terminator_91A0DE                                 ;91A024;
    dw TransitionTable_Terminator_91A0DE                                 ;91A026;
    dw TransitionTable_Terminator_91A0DE                                 ;91A028;
    dw TransitionTable_01_03_05_07_A4_A6_E0_E2_E4_E6_FacingRight         ;91A02A;
    dw TransitionTable_02_04_06_08_A5_A7_E1_E3_E5_E7_FacingLeft          ;91A02C;
    dw TransitionTable_01_03_05_07_A4_A6_E0_E2_E4_E6_FacingRight         ;91A02E;
    dw TransitionTable_02_04_06_08_A5_A7_E1_E3_E5_E7_FacingLeft          ;91A030;
    dw TransitionTable_Terminator_91A0DE                                 ;91A032;
    dw TransitionTable_Terminator_91A0DE                                 ;91A034;
    dw TransitionTable_Terminator_91A0DE                                 ;91A036;
    dw TransitionTable_Terminator_91A0DE                                 ;91A038;
    dw TransitionTable_Terminator_91A0DE                                 ;91A03A;
    dw TransitionTable_Terminator_91A0DE                                 ;91A03C;
    dw TransitionTable_Terminator_91A0DE                                 ;91A03E;
    dw TransitionTable_Terminator_91A0DE                                 ;91A040;
    dw TransitionTable_Terminator_91A0DE                                 ;91A042;
    dw TransitionTable_Terminator_91A0DE                                 ;91A044;
    dw TransitionTable_Terminator_91A0DE                                 ;91A046;
    dw TransitionTable_Terminator_91A0DE                                 ;91A048;
    dw TransitionTable_Terminator_91A0DE                                 ;91A04A;
    dw TransitionTable_Terminator_91A0DE                                 ;91A04C;
    dw TransitionTable_Terminator_91A0DE                                 ;91A04E;
    dw TransitionTable_Terminator_91A0DE                                 ;91A050;
    dw TransitionTable_Terminator_91A0DE                                 ;91A052;
    dw TransitionTable_Terminator_91A0DE                                 ;91A054;
    dw TransitionTable_BA_BB_BC_BD_BE_FacingLeft_GrabbedByDraygon        ;91A056;
    dw TransitionTable_BA_BB_BC_BD_BE_FacingLeft_GrabbedByDraygon        ;91A058;
    dw TransitionTable_BA_BB_BC_BD_BE_FacingLeft_GrabbedByDraygon        ;91A05A;
    dw TransitionTable_BA_BB_BC_BD_BE_FacingLeft_GrabbedByDraygon        ;91A05C;
    dw TransitionTable_BA_BB_BC_BD_BE_FacingLeft_GrabbedByDraygon        ;91A05E;
    dw TransitionTable_BF_FacingRight_Moonwalking_TurnJumpLeft           ;91A060;
    dw TransitionTable_C0_FacingLeft_Moonwalking_TurnJumpRight           ;91A062;
    dw TransitionTable_C1_FaceRight_Moonwalk_TurnJumpLeft_AimUpRight     ;91A064;
    dw TransitionTable_C2_FaceLeft_Moonwalk_TurnJumpRight_AimUpLeft      ;91A066;
    dw TransitionTable_C3_FaceRight_Moonwalk_TurnJumpLeft_AimDownRight   ;91A068;
    dw TransitionTable_C4_FaceLeft_Moonwalk_TurnJumpRight_AimDownLeft    ;91A06A;
    dw TransitionTable_Terminator_91A0DE                                 ;91A06C;
    dw TransitionTable_Terminator_91A0DE                                 ;91A06E;
    dw TransitionTable_C7_FacingRight_VerticalShinesparkWindup           ;91A070;
    dw TransitionTable_C8_FacingLeft_VerticalShinesparkWindup            ;91A072;
    dw TransitionTable_Terminator_91A0DE                                 ;91A074;
    dw TransitionTable_Terminator_91A0DE                                 ;91A076;
    dw TransitionTable_Terminator_91A0DE                                 ;91A078;
    dw TransitionTable_Terminator_91A0DE                                 ;91A07A;
    dw TransitionTable_Terminator_91A0DE                                 ;91A07C;
    dw TransitionTable_Terminator_91A0DE                                 ;91A07E;
    dw TransitionTable_89_CF_D1_FacingRight_RanIntoAWall                 ;91A080;
    dw TransitionTable_8A_D0_D2_FacingLeft_RanIntoAWall                  ;91A082;
    dw TransitionTable_89_CF_D1_FacingRight_RanIntoAWall                 ;91A084;
    dw TransitionTable_8A_D0_D2_FacingLeft_RanIntoAWall                  ;91A086;
    dw TransitionTable_Terminator_91A0DE                                 ;91A088;
    dw TransitionTable_Terminator_91A0DE                                 ;91A08A;
    dw TransitionTable_Terminator_91A0DE                                 ;91A08C;
    dw TransitionTable_Terminator_91A0DE                                 ;91A08E;
    dw TransitionTable_Terminator_91A0DE                                 ;91A090;
    dw TransitionTable_Terminator_91A0DE                                 ;91A092;
    dw TransitionTable_Terminator_91A0DE                                 ;91A094;
    dw TransitionTable_Terminator_91A0DE                                 ;91A096;
    dw TransitionTable_Terminator_91A0DE                                 ;91A098;
    dw TransitionTable_Terminator_91A0DE                                 ;91A09A;
    dw TransitionTable_Terminator_91A0DE                                 ;91A09C;
    dw TransitionTable_Terminator_91A0DE                                 ;91A09E;
    dw UNUSED_TransitionTable_DF_91AE10                                  ;91A0A0;
    dw TransitionTable_01_03_05_07_A4_A6_E0_E2_E4_E6_FacingRight         ;91A0A2;
    dw TransitionTable_02_04_06_08_A5_A7_E1_E3_E5_E7_FacingLeft          ;91A0A4;
    dw TransitionTable_01_03_05_07_A4_A6_E0_E2_E4_E6_FacingRight         ;91A0A6;
    dw TransitionTable_02_04_06_08_A5_A7_E1_E3_E5_E7_FacingLeft          ;91A0A8;
    dw TransitionTable_01_03_05_07_A4_A6_E0_E2_E4_E6_FacingRight         ;91A0AA;
    dw TransitionTable_02_04_06_08_A5_A7_E1_E3_E5_E7_FacingLeft          ;91A0AC;
    dw TransitionTable_01_03_05_07_A4_A6_E0_E2_E4_E6_FacingRight         ;91A0AE;
    dw TransitionTable_02_04_06_08_A5_A7_E1_E3_E5_E7_FacingLeft          ;91A0B0;
    dw TransitionTable_Terminator_91A0DE                                 ;91A0B2;
    dw TransitionTable_Terminator_91A0DE                                 ;91A0B4;
    dw TransitionTable_Terminator_91A0DE                                 ;91A0B6;
    dw TransitionTable_Terminator_91A0DE                                 ;91A0B8;
    dw TransitionTable_EC_ED_EE_EF_F0_FacingRight_GrabbedByDraygon       ;91A0BA;
    dw TransitionTable_EC_ED_EE_EF_F0_FacingRight_GrabbedByDraygon       ;91A0BC;
    dw TransitionTable_EC_ED_EE_EF_F0_FacingRight_GrabbedByDraygon       ;91A0BE;
    dw TransitionTable_EC_ED_EE_EF_F0_FacingRight_GrabbedByDraygon       ;91A0C0;
    dw TransitionTable_EC_ED_EE_EF_F0_FacingRight_GrabbedByDraygon       ;91A0C2;
    dw TransitionTable_Terminator_91A0DE                                 ;91A0C4;
    dw TransitionTable_Terminator_91A0DE                                 ;91A0C6;
    dw TransitionTable_Terminator_91A0DE                                 ;91A0C8;
    dw TransitionTable_Terminator_91A0DE                                 ;91A0CA;
    dw TransitionTable_Terminator_91A0DE                                 ;91A0CC;
    dw TransitionTable_Terminator_91A0DE                                 ;91A0CE;
    dw TransitionTable_Terminator_91A0DE                                 ;91A0D0;
    dw TransitionTable_Terminator_91A0DE                                 ;91A0D2;
    dw TransitionTable_Terminator_91A0DE                                 ;91A0D4;
    dw TransitionTable_Terminator_91A0DE                                 ;91A0D6;
    dw TransitionTable_Terminator_91A0DE                                 ;91A0D8;
    dw TransitionTable_Terminator_91A0DE                                 ;91A0DA;

TransitionTable_Terminator_91A0DE:
    dw $FFFF                                                             ;91A0DC;

TransitionTable_00_9B_FacingForward:
    dw $0000,$0100,$0026,$0000,$0200,$0025,$FFFF                         ;91A0DE;

TransitionTable_01_03_05_07_A4_A6_E0_E2_E4_E6_FacingRight:
    dw $0080,$0800,$0055,$0080,$0010,$0057,$0080,$0020                   ;91A0EC;
    dw $0059,$0080,$0000,$004B,$0400,$0030,$00F1,$0400                   ;91A0FC;
    dw $0010,$00F3,$0400,$0020,$00F5,$0400,$0000,$0035                   ;91A10C;
    dw $0000,$0260,$0078,$0000,$0250,$0076,$0000,$0230                   ;91A11C;
    dw $0025,$0000,$0030,$0003,$0000,$0110,$000F,$0000                   ;91A12C;
    dw $0120,$0011,$0000,$0900,$000F,$0000,$0500,$0011                   ;91A13C;
    dw $0000,$0240,$004A,$0000,$0200,$0025,$0000,$0800                   ;91A14C;
    dw $0003,$0000,$0010,$0005,$0000,$0020,$0007,$0000                   ;91A15C;
    dw $0100,$0009,$FFFF                                                 ;91A16C;

TransitionTable_02_04_06_08_A5_A7_E1_E3_E5_E7_FacingLeft:
    dw $0080,$0800,$0056,$0080,$0010,$0058,$0080,$0020                   ;91A172;
    dw $005A,$0080,$0000,$004C,$0400,$0030,$00F2,$0400                   ;91A182;
    dw $0010,$00F4,$0400,$0020,$00F6,$0400,$0000,$0036                   ;91A192;
    dw $0000,$0160,$0077,$0000,$0150,$0075,$0000,$0130                   ;91A1A2;
    dw $0026,$0000,$0030,$0004,$0000,$0210,$0010,$0000                   ;91A1B2;
    dw $0220,$0012,$0000,$0A00,$0010,$0000,$0600,$0012                   ;91A1C2;
    dw $0000,$0140,$0049,$0000,$0100,$0026,$0000,$0800                   ;91A1D2;
    dw $0004,$0000,$0010,$0006,$0000,$0020,$0008,$0000                   ;91A1E2;
    dw $0200,$000A,$FFFF                                                 ;91A1F2;

TransitionTable_09_0D_0F_11_MovingRight:
    dw $0400,$0000,$0035,$0080,$0000,$0019,$0000,$0110                   ;91A1F8;
    dw $000F,$0000,$0120,$0011,$0000,$0900,$000F,$0000                   ;91A208;
    dw $0500,$0011,$0000,$0140,$000B,$0000,$0100,$0009                   ;91A218;
    dw $0000,$0200,$0025,$0000,$0800,$0003,$0000,$0010                   ;91A228;
    dw $0005,$0000,$0020,$0007,$FFFF                                     ;91A238;

TransitionTable_0A_0E_10_12_MovingLeft:
    dw $0400,$0000,$0036,$0080,$0000,$001A,$0000,$0210                   ;91A242;
    dw $0010,$0000,$0220,$0012,$0000,$0A00,$0010,$0000                   ;91A252;
    dw $0600,$0012,$0000,$0240,$000C,$0000,$0200,$000A                   ;91A262;
    dw $0000,$0100,$0026,$0000,$0800,$0004,$0000,$0010                   ;91A272;
    dw $0006,$0000,$0020,$0008,$FFFF                                     ;91A282;

TransitionTable_4B_55_57_59_FacingRight_NormalJumpTransition:
    dw $0000,$0280,$002F,$0000,$0880,$0015,$0000,$0480                   ;91A28C;
    dw $0017,$0000,$0090,$0069,$0000,$00A0,$006B,$0000                   ;91A29C;
    dw $0180,$0051,$0000,$00C0,$0013,$0000,$0040,$0013                   ;91A2AC;
    dw $FFFF                                                             ;91A2BC;

TransitionTable_4C_56_58_5A_FacingLeft_NormalJumpTransition:
    dw $0000,$0180,$0030,$0000,$0880,$0016,$0000,$0480                   ;91A2BE;
    dw $0018,$0000,$0090,$006A,$0000,$00A0,$006C,$0000                   ;91A2CE;
    dw $0280,$0052,$0000,$00C0,$0014,$0000,$0100,$0030                   ;91A2DE;
    dw $0000,$0040,$0014,$FFFF                                           ;91A2EE;

TransitionTable_15_4D_51_69_6B_FacingRight_NormalJump:
    dw $0000,$0980,$0069,$0000,$0580,$006B,$0000,$0190                   ;91A2F6;
    dw $0069,$0000,$01A0,$006B,$0000,$0900,$0069,$0000                   ;91A306;
    dw $0500,$006B,$0000,$0280,$002F,$0000,$0880,$0015                   ;91A316;
    dw $0000,$0480,$0017,$0000,$0090,$0069,$0000,$00A0                   ;91A326;
    dw $006B,$0000,$0180,$0051,$0000,$00C0,$0013,$0000                   ;91A336;
    dw $0200,$002F,$0000,$0800,$0015,$0000,$0400,$0017                   ;91A346;
    dw $0000,$0010,$0069,$0000,$0020,$006B,$0000,$0100                   ;91A356;
    dw $0051,$0000,$0080,$004D,$0000,$0040,$0013,$FFFF                   ;91A366;

TransitionTable_16_4E_52_6A_6C_FacingLeft_NormalJump:
    dw $0000,$0A80,$006A,$0000,$0680,$006C,$0000,$0290                   ;91A376;
    dw $006A,$0000,$02A0,$006C,$0000,$0A00,$006A,$0000                   ;91A386;
    dw $0600,$006C,$0000,$0180,$0030,$0000,$0880,$0016                   ;91A396;
    dw $0000,$0480,$0018,$0000,$0090,$006A,$0000,$00A0                   ;91A3A6;
    dw $006C,$0000,$0280,$0052,$0000,$00C0,$0014,$0000                   ;91A3B6;
    dw $0100,$0030,$0000,$0800,$0016,$0000,$0400,$0018                   ;91A3C6;
    dw $0000,$0010,$006A,$0000,$0020,$006C,$0000,$0200                   ;91A3D6;
    dw $0052,$0000,$0080,$004E,$0000,$0040,$0014,$FFFF                   ;91A3E6;

TransitionTable_4F_FacingLeft_DamageBoost:
    dw $0000,$0280,$0052,$0000,$0180,$004F,$0000,$0080                   ;91A3F6;
    dw $004E,$FFFF                                                       ;91A406;

TransitionTable_50_FacingRight_DamageBoost:
    dw $0000,$0280,$0050,$0000,$0180,$0051,$0000,$0080                   ;91A40A;
    dw $004D,$FFFF                                                       ;91A41A;

TransitionTable_19_FacingRIght_SpinJump:
    dw $0040,$0000,$0013,$0040,$0100,$0013,$0000,$0840                   ;91A41E;
    dw $0015,$0000,$0440,$0017,$0000,$0050,$0069,$0000                   ;91A42E;
    dw $0060,$006B,$0000,$0180,$0019,$0000,$0800,$0015                   ;91A43E;
    dw $0000,$0010,$0069,$0000,$0020,$006B,$0000,$0400                   ;91A44E;
    dw $0017,$0000,$0100,$0019,$0000,$0200,$001A,$FFFF                   ;91A45E;

TransitionTable_1A_FacingLeft_SpinJump:
    dw $0040,$0000,$0014,$0040,$0200,$0014,$0000,$0840                   ;91A46E;
    dw $0016,$0000,$0440,$0018,$0000,$0050,$006A,$0000                   ;91A47E;
    dw $0060,$006C,$0000,$0280,$001A,$0000,$0800,$0016                   ;91A48E;
    dw $0000,$0010,$006A,$0000,$0020,$006C,$0000,$0400                   ;91A49E;
    dw $0018,$0000,$0200,$001A,$0000,$0100,$0019,$FFFF                   ;91A4AE;

TransitionTable_1B_FacingRight_SpaceJump:
    dw $0040,$0000,$0013,$0040,$0100,$0013,$0000,$0840                   ;91A4BE;
    dw $0015,$0000,$0440,$0017,$0000,$0050,$0069,$0000                   ;91A4CE;
    dw $0060,$006B,$0000,$0180,$001B,$0000,$0800,$0015                   ;91A4DE;
    dw $0000,$0010,$0069,$0000,$0020,$006B,$0000,$0400                   ;91A4EE;
    dw $0017,$0000,$0100,$001B,$0000,$0200,$001C,$FFFF                   ;91A4FE;

TransitionTable_1C_FacingLeft_SpaceJump:
    dw $0040,$0000,$0014,$0040,$0200,$0014,$0000,$0840                   ;91A50E;
    dw $0016,$0000,$0440,$0018,$0000,$0050,$006A,$0000                   ;91A51E;
    dw $0060,$006C,$0000,$0280,$001C,$0000,$0800,$0016                   ;91A52E;
    dw $0000,$0010,$006A,$0000,$0020,$006C,$0000,$0400                   ;91A53E;
    dw $0018,$0000,$0200,$001C,$0000,$0100,$001B,$FFFF                   ;91A54E;

TransitionTable_81_ScrewAttack:
    dw $0040,$0000,$0013,$0040,$0100,$0013,$0000,$0840                   ;91A55E;
    dw $0015,$0000,$0440,$0017,$0000,$0050,$0069,$0000                   ;91A56E;
    dw $0060,$006B,$0000,$0180,$0081,$0000,$0800,$0015                   ;91A57E;
    dw $0000,$0010,$0069,$0000,$0020,$006B,$0000,$0400                   ;91A58E;
    dw $0017,$0000,$0100,$0081,$0000,$0200,$0082,$FFFF                   ;91A59E;

TransitionTable_82_FacingLeft_ScrewAttack:
    dw $0040,$0000,$0014,$0040,$0200,$0014,$0000,$0840                   ;91A5AE;
    dw $0016,$0000,$0440,$0018,$0000,$0050,$006A,$0000                   ;91A5BE;
    dw $0060,$006C,$0000,$0280,$0082,$0000,$0800,$0016                   ;91A5CE;
    dw $0000,$0010,$006A,$0000,$0020,$006C,$0000,$0400                   ;91A5DE;
    dw $0018,$0000,$0200,$0082,$0000,$0100,$0081,$FFFF                   ;91A5EE;

TransitionTable_1D_FaceRight_MorphBall_NoSpringBall_OnGround:
    dw $0800,$0000,$003D,$0080,$0000,$003D,$0000,$0100                   ;91A5FE;
    dw $001E,$0000,$0200,$001F,$FFFF                                     ;91A60E;

TransitionTable_1E_MoveRight_MorphBall_NoSpringBall_OnGround:
    dw $0800,$0000,$003D,$0080,$0000,$003D,$0000,$0100                   ;91A618;
    dw $001E,$0000,$0200,$001F,$FFFF                                     ;91A628;

TransitionTable_1F_MoveLeft_MorphBall_NoSpringBall_OnGround:
    dw $0800,$0000,$003E,$0080,$0000,$003E,$0000,$0100                   ;91A632;
    dw $001E,$0000,$0200,$001F,$FFFF                                     ;91A642;

TransitionTable_1D_FaceLeft_MorphBall_NoSpringBall_OnGround:
    dw $0800,$0000,$003E,$0080,$0000,$003E,$0000,$0100                   ;91A64C;
    dw $001E,$0000,$0200,$001F,$FFFF                                     ;91A65C;

UNUSED_TransitionTable_20_21_22_24_91A666:
    dw $FFFF                                                             ;91A666;

UNUSED_TransitionTable_23_91A668:
    dw $FFFF                                                             ;91A668;

UNUSED_TransitionTable_42_91A66A:
    dw $FFFF                                                             ;91A66A;

TransitionTable_27_71_73_85_FacingRight_Crouching:
    dw $0800,$0030,$00F7,$0800,$0010,$00F9,$0800,$0020                   ;91A66C;
    dw $00FB,$0800,$0000,$003B,$0200,$0000,$0043,$0400                   ;91A67C;
    dw $0000,$0037,$0080,$0000,$004B,$0000,$0030,$0085                   ;91A68C;
    dw $0000,$0110,$0001,$0000,$0120,$0001,$0000,$0010                   ;91A69C;
    dw $0071,$0000,$0020,$0073,$0000,$0100,$0001,$FFFF                   ;91A6AC;

TransitionTable_28_72_74_86_Crouching:
    dw $0800,$0030,$00F8,$0800,$0010,$00FA,$0800,$0020                   ;91A6BC;
    dw $00FC,$0800,$0000,$003C,$0100,$0000,$0044,$0400                   ;91A6CC;
    dw $0000,$0038,$0080,$0000,$004C,$0000,$0030,$0086                   ;91A6DC;
    dw $0000,$0220,$0002,$0000,$0210,$0002,$0000,$0010                   ;91A6EC;
    dw $0072,$0000,$0020,$0074,$0000,$0200,$0002,$FFFF                   ;91A6FC;

TransitionTable_29_2B_6D_6F_FacingRight_Falling:
    dw $0000,$0900,$006D,$0000,$0500,$006F,$0000,$0A00                   ;91A70C;
    dw $0087,$0000,$0600,$0087,$0000,$0200,$0087,$0000                   ;91A71C;
    dw $0800,$002B,$0000,$0400,$002D,$0000,$0010,$006D                   ;91A72C;
    dw $0000,$0020,$006F,$0000,$0040,$0067,$0000,$0100                   ;91A73C;
    dw $0029,$FFFF                                                       ;91A74C;

TransitionTable_2A_2C_6E_70_FacingLeft_Falling:
    dw $0000,$0A00,$006E,$0000,$0600,$0070,$0000,$0900                   ;91A750;
    dw $0088,$0000,$0500,$0088,$0000,$0100,$0088,$0000                   ;91A760;
    dw $0800,$002C,$0000,$0400,$002E,$0000,$0010,$006E                   ;91A770;
    dw $0000,$0020,$0070,$0000,$0040,$0068,$0000,$0200                   ;91A780;
    dw $002A,$FFFF                                                       ;91A790;

TransitionTable_31_FacingRight_MorphBall_NoSpringBall_InAir:
    dw $0800,$0000,$003D,$0080,$0000,$003D,$0000,$0100                   ;91A794;
    dw $0031,$0000,$0200,$0032,$FFFF                                     ;91A7A4;

TransitionTable_32_FacingLeft_MorphBall_NoSpringBall_InAir:
    dw $0800,$0000,$003E,$0080,$0000,$003E,$0000,$0200                   ;91A7AE;
    dw $0032,$0000,$0100,$0031,$FFFF                                     ;91A7BE;

UNUSED_TransitionTable_33_91A7C8:
    dw $FFFF                                                             ;91A7C8;

UNUSED_TransitionTable_34_91A7CA:
    dw $FFFF                                                             ;91A7CA;

UNUSED_TransitionTable_45_91A7CC:
    dw $0000,$0240,$0045,$0000,$0100,$0009,$0000,$0200                   ;91A7CC;
    dw $0025,$FFFF                                                       ;91A7DC;

UNUSED_TransitionTable_46_91A7E0:
    dw $0000,$0140,$0046,$0000,$0200,$000A,$0000,$0100                   ;91A7E0;
    dw $0026,$FFFF                                                       ;91A7F0;

UNUSED_TransitionTable_47_91A7F4:
    dw $FFFF                                                             ;91A7F4;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_TransitionTable_PossiblyPartOfAbove_91A7F6:
    dw $0080,$0000,$004B,$0400,$0000,$0035,$0000,$0210                   ;91A7F6;
    dw $0078,$0000,$0220,$0076,$0000,$0240,$004A,$0000                   ;91A806;
    dw $0100,$0009,$0000,$0200,$0025,$0000,$0800,$0003                   ;91A816;
    dw $0000,$0010,$0005,$0000,$0020,$0007,$FFFF                         ;91A826;
endif ; !FEATURE_KEEP_UNREFERENCED

UNUSED_TransitionTable_48_91A834:
    dw $FFFF                                                             ;91A834;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_TransitionTable_PossiblyPartOfAbove_91A836:
    dw $0080,$0000,$004C,$0400,$0000,$0036,$0000,$0120                   ;91A836;
    dw $0077,$0000,$0110,$0075,$0000,$0140,$0049,$0000                   ;91A846;
    dw $0200,$000A,$0000,$0100,$0026,$0000,$0800,$0004                   ;91A856;
    dw $0000,$0010,$0006,$0000,$0020,$0008,$FFFF                         ;91A866;
endif ; !FEATURE_KEEP_UNREFERENCED

TransitionTable_49_75_77_FacingLeft_Moonwalk:
    dw $0400,$0000,$0036,$0080,$0000,$00C0,$0080,$0010                   ;91A874;
    dw $00C2,$0080,$0020,$00C4,$0000,$0160,$0077,$0000                   ;91A884;
    dw $0150,$0075,$0000,$0140,$0049,$0000,$0200,$000A                   ;91A894;
    dw $0000,$0100,$0026,$FFFF                                           ;91A8A4;

TransitionTable_4A_76_78_FacingRight_Moonwalk:
    dw $0400,$0000,$0035,$0080,$0000,$00BF,$0080,$0010                   ;91A8AC;
    dw $00C1,$0080,$0020,$00C3,$0000,$0250,$0076,$0000                   ;91A8BC;
    dw $0260,$0078,$0000,$0240,$004A,$0000,$0100,$0009                   ;91A8CC;
    dw $0000,$0200,$0025,$FFFF                                           ;91A8DC;

TransitionTable_53_FacingRight_Knockback:
    dw $0000,$0280,$0050,$FFFF                                           ;91A8E4;

TransitionTable_54_FacingLeft_Knockback:
    dw $0000,$0180,$004F,$FFFF                                           ;91A8EC;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_TransitionTable_91A8F4:
    dw $FFFF                                                             ;91A8F4;

UNUSED_TransitionTable_91A8F6:
    dw $FFFF                                                             ;91A8F6;

UNUSED_TransitionTable_91A8F8:
    dw $FFFF                                                             ;91A8F8;

UNUSED_TransitionTable_91A8FA:
    dw $FFFF                                                             ;91A8FA;
endif ; !FEATURE_KEEP_UNREFERENCED

UNUSED_TransitionTable_5B_91A8FC:
    dw $0000,$0280,$0066,$FFFF                                           ;91A8FC;

UNUSED_TransitionTable_5C_91A904:
    dw $0000,$0180,$0065,$FFFF                                           ;91A904;

TransitionTable_79_7B_FacingRight_MorphBall_Spring_OnGround:
    dw $0800,$0000,$003D,$0080,$0000,$007F,$0000,$0100                   ;91A90C;
    dw $007B,$0000,$0200,$007C,$FFFF                                     ;91A91C;

TransitionTable_7A_7C_FacingLeft_MorphBall_Spring_OnGround:
    dw $0800,$0000,$003E,$0080,$0000,$0080,$0000,$0100                   ;91A926;
    dw $007B,$0000,$0200,$007C,$FFFF                                     ;91A936;

TransitionTable_7D_FacingRight_MorphBall_SpringBall_Falling:
    dw $0800,$0000,$003D,$0000,$0200,$007E,$0000,$0100                   ;91A940;
    dw $007D,$FFFF                                                       ;91A950;

TransitionTable_7E_FacingLeft_MorphBall_SpringBall_Falling:
    dw $0800,$0000,$003E,$0000,$0100,$007D,$0000,$0200                   ;91A954;
    dw $007E,$FFFF                                                       ;91A964;

TransitionTable_7F_FacingRight_MorphBall_SpringBall_InAir:
    dw $0800,$0000,$003D,$0000,$0100,$007F,$0000,$0200                   ;91A968;
    dw $0080,$FFFF                                                       ;91A978;

TransitionTable_80_FacingLeft_MorphBall_SpringBall_InAir:
    dw $0800,$0000,$003E,$0000,$0100,$007F,$0000,$0200                   ;91A97C;
    dw $0080,$FFFF                                                       ;91A98C;

UNUSED_TransitionTable_63_91A990:
    dw $0000,$0280,$0066,$FFFF                                           ;91A990;

UNUSED_TransitionTable_64_91A998:
    dw $0000,$0180,$0065,$FFFF                                           ;91A998;

UNUSED_TransitionTable_65_91A9A0:
    dw $0000,$0180,$0065,$0000,$0010,$0069,$0000,$0020                   ;91A9A0;
    dw $006B,$0000,$0040,$0013,$0000,$0080,$0065,$0000                   ;91A9B0;
    dw $0100,$0065,$FFFF                                                 ;91A9C0;

UNUSED_TransitionTable_66_91A9C6:
    dw $0000,$0280,$0066,$0000,$0010,$006A,$0000,$0020                   ;91A9C6;
    dw $006C,$0000,$0040,$0014,$0000,$0080,$0066,$0000                   ;91A9D6;
    dw $0200,$0066,$FFFF                                                 ;91A9E6;

TransitionTable_83_FacingRight_WallJump:
    dw $0400,$0000,$0037,$0000,$0200,$001A,$0000,$0010                   ;91A9EC;
    dw $0069,$0000,$0020,$006B,$0000,$0040,$0013,$0000                   ;91A9FC;
    dw $0080,$0083,$FFFF                                                 ;91AA0C;

TransitionTable_84_FacingLeft_WallJump:
    dw $0400,$0000,$0038,$0000,$0100,$0019,$0000,$0010                   ;91AA12;
    dw $006A,$0000,$0020,$006C,$0000,$0040,$0014,$0000                   ;91AA22;
    dw $0080,$0084,$FFFF                                                 ;91AA32;

TransitionTable_89_CF_D1_FacingRight_RanIntoAWall:
    dw $0080,$0000,$004B,$0000,$0900,$000F,$0000,$0500                   ;91AA38;
    dw $0011,$0400,$0000,$0035,$0000,$0220,$0078,$0000                   ;91AA48;
    dw $0210,$0076,$0000,$0800,$0003,$0000,$0010,$0005                   ;91AA58;
    dw $0000,$0020,$0007,$0000,$0200,$0025,$0000,$0100                   ;91AA68;
    dw $0009,$FFFF                                                       ;91AA78;

TransitionTable_8A_D0_D2_FacingLeft_RanIntoAWall:
    dw $0080,$0000,$004C,$0000,$0A00,$0010,$0000,$0600                   ;91AA7C;
    dw $0012,$0400,$0000,$0036,$0000,$0120,$0077,$0000                   ;91AA8C;
    dw $0110,$0075,$0000,$0800,$0004,$0000,$0010,$0006                   ;91AA9C;
    dw $0000,$0020,$0008,$0000,$0100,$0026,$0000,$0200                   ;91AAAC;
    dw $000A,$FFFF                                                       ;91AABC;

TransitionTable_13_FaceRight_NormalJump_NotMoving_GunExtend:
    dw $0000,$0980,$0069,$0000,$0580,$006B,$0000,$0190                   ;91AAC0;
    dw $0069,$0000,$01A0,$006B,$0000,$0900,$0069,$0000                   ;91AAD0;
    dw $0500,$006B,$0000,$0280,$002F,$0000,$0880,$0015                   ;91AAE0;
    dw $0000,$0480,$0017,$0000,$0090,$0069,$0000,$00A0                   ;91AAF0;
    dw $006B,$0000,$0180,$0051,$0000,$00C0,$0013,$0000                   ;91AB00;
    dw $0200,$002F,$0000,$0800,$0015,$0000,$0400,$0017                   ;91AB10;
    dw $0000,$0010,$0069,$0000,$0020,$006B,$0000,$0100                   ;91AB20;
    dw $0051,$0000,$0040,$0013,$FFFF                                     ;91AB30;

TransitionTable_14_FacingLeft_NormalJump_NotMoving_GunExtend:
    dw $0000,$0A80,$006A,$0000,$0680,$006C,$0000,$0290                   ;91AB3A;
    dw $006A,$0000,$02A0,$006C,$0000,$0A00,$006A,$0000                   ;91AB4A;
    dw $0600,$006C,$0000,$0180,$0030,$0000,$0880,$0016                   ;91AB5A;
    dw $0000,$0480,$0018,$0000,$0090,$006A,$0000,$00A0                   ;91AB6A;
    dw $006C,$0000,$0280,$0052,$0000,$00C0,$0014,$0000                   ;91AB7A;
    dw $0100,$0030,$0000,$0800,$0016,$0000,$0400,$0018                   ;91AB8A;
    dw $0000,$0010,$006A,$0000,$0020,$006C,$0000,$0200                   ;91AB9A;
    dw $0052,$0000,$0040,$0014,$FFFF                                     ;91ABAA;

TransitionTable_17_FacingRight_NormalJump_AimingDown:
    dw $0400,$0000,$0037,$0000,$0980,$0069,$0000,$0580                   ;91ABB4;
    dw $006B,$0000,$0190,$0069,$0000,$01A0,$006B,$0000                   ;91ABC4;
    dw $01C0,$0013,$0000,$0900,$0069,$0000,$0500,$006B                   ;91ABD4;
    dw $0000,$0280,$002F,$0000,$0880,$0015,$0000,$0480                   ;91ABE4;
    dw $0017,$0000,$0090,$0069,$0000,$00A0,$006B,$0000                   ;91ABF4;
    dw $0180,$0051,$0000,$00C0,$0013,$0000,$0200,$002F                   ;91AC04;
    dw $0000,$0800,$0015,$0000,$0400,$0017,$0000,$0010                   ;91AC14;
    dw $0069,$0000,$0020,$006B,$0000,$0100,$0051,$0000                   ;91AC24;
    dw $0080,$0017,$0000,$0040,$0013,$FFFF                               ;91AC34;

TransitionTable_18_FacingLeft_NormalJump_AimingDown:
    dw $0400,$0000,$0038,$0000,$0A80,$006A,$0000,$0680                   ;91AC40;
    dw $006C,$0000,$0290,$006A,$0000,$02A0,$006C,$0000                   ;91AC50;
    dw $02A0,$006C,$0000,$0A00,$006A,$0000,$0600,$006C                   ;91AC60;
    dw $0000,$0180,$0030,$0000,$0880,$0016,$0000,$0480                   ;91AC70;
    dw $0018,$0000,$0090,$006A,$0000,$00A0,$006C,$0000                   ;91AC80;
    dw $0280,$0052,$0000,$00C0,$0014,$0000,$0100,$0030                   ;91AC90;
    dw $0000,$0800,$0016,$0000,$0400,$0018,$0000,$0010                   ;91ACA0;
    dw $006A,$0000,$0020,$006C,$0000,$0200,$0052,$0000                   ;91ACB0;
    dw $0080,$0018,$0000,$0040,$0014,$FFFF                               ;91ACC0;

TransitionTable_3D_FacingRight_Unmorphing:
    dw $0000,$0140,$0067,$0000,$0840,$002B,$0000,$0440                   ;91ACCC;
    dw $002D,$FFFF                                                       ;91ACDC;

TransitionTable_3E_FacingLeft_Unmorphing:
    dw $0000,$0240,$0068,$0000,$0840,$002C,$0000,$0440                   ;91ACE0;
    dw $002E,$FFFF                                                       ;91ACF0;

TransitionTable_25_FacingRight_Turning_Standing:
    dw $0000,$0280,$001A,$0080,$0000,$004C,$0000,$0200                   ;91ACF4;
    dw $0025,$FFFF                                                       ;91AD04;

TransitionTable_26_FacingLeft_Turning_Standing:
    dw $0000,$0180,$0019,$0080,$0000,$004B,$0000,$0100                   ;91AD08;
    dw $0026,$FFFF                                                       ;91AD18;

TransitionTable_8B_FacingRight_Turning_Standing_AimingUp:
    dw $0080,$0200,$001A,$0080,$0000,$004C,$0000,$0200                   ;91AD1C;
    dw $008B,$FFFF                                                       ;91AD2C;

TransitionTable_8C_FacingLeft_Turning_Standing_AimingUp:
    dw $0080,$0100,$0019,$0080,$0000,$004B,$0000,$0100                   ;91AD30;
    dw $008C,$FFFF                                                       ;91AD40;

TransitionTable_8D_FacingRight_Turning_Standing_AimDownRight:
    dw $0080,$0200,$001A,$0080,$0000,$004C,$0000,$0200                   ;91AD44;
    dw $008D,$FFFF                                                       ;91AD54;

TransitionTable_8E_FacingLeft_Turning_Standing_AimDownLeft:
    dw $0080,$0100,$0019,$0080,$0000,$004B,$0000,$0100                   ;91AD58;
    dw $008E,$FFFF                                                       ;91AD68;

TransitionTable_C7_FacingRight_VerticalShinesparkWindup:
    dw $0000,$0880,$00CB,$0000,$0090,$00CD,$0000,$0180                   ;91AD6C;
    dw $00C9,$FFFF                                                       ;91AD7C;

TransitionTable_C8_FacingLeft_VerticalShinesparkWindup:
    dw $0000,$0880,$00CC,$0000,$0090,$00CE,$0000,$0280                   ;91AD80;
    dw $00CA,$FFFF                                                       ;91AD90;

TransitionTable_2D_FacingRight_Falling_AimingDown:
    dw $0400,$0000,$0037,$0000,$0900,$006D,$0000,$0500                   ;91AD94;
    dw $006F,$0000,$0800,$002B,$0000,$0400,$002D,$0000                   ;91ADA4;
    dw $0200,$0087,$0000,$0010,$006D,$0000,$0020,$006F                   ;91ADB4;
    dw $0000,$0040,$0067,$0000,$0100,$0029,$FFFF                         ;91ADC4;

TransitionTable_2E_FacingLeft_Falling_AimingDown:
    dw $0400,$0000,$0038,$0000,$0A00,$006E,$0000,$0600                   ;91ADD2;
    dw $0070,$0000,$0800,$002C,$0000,$0400,$002E,$0000                   ;91ADE2;
    dw $0100,$0088,$0000,$0010,$006E,$0000,$0020,$0070                   ;91ADF2;
    dw $0000,$0040,$0068,$0000,$0200,$002A,$FFFF                         ;91AE02;

UNUSED_TransitionTable_DF_91AE10:
    dw $0800,$0000,$00DE,$FFFF                                           ;91AE10;

TransitionTable_BA_BB_BC_BD_BE_FacingLeft_GrabbedByDraygon:
    dw $0000,$0A40,$00BB,$0000,$0640,$00BD,$0000,$0240                   ;91AE18;
    dw $00BC,$0000,$0010,$00BB,$0000,$0020,$00BD,$0000                   ;91AE28;
    dw $0040,$00BC,$0000,$0200,$00BE,$0000,$0100,$00BE                   ;91AE38;
    dw $0000,$0800,$00BE,$0000,$0400,$00BE,$FFFF                         ;91AE48;

TransitionTable_EC_ED_EE_EF_F0_FacingRight_GrabbedByDraygon:
    dw $0000,$0940,$00ED,$0000,$0540,$00EF,$0000,$0140                   ;91AE56;
    dw $00EE,$0000,$0010,$00ED,$0000,$0020,$00EF,$0000                   ;91AE66;
    dw $0040,$00EE,$0000,$0200,$00F0,$0000,$0100,$00F0                   ;91AE76;
    dw $0000,$0800,$00F0,$0000,$0400,$00F0,$FFFF                         ;91AE86;

TransitionTable_0B_MovingRight_GunExtended:
    dw $0400,$0000,$0035,$0080,$0000,$0019,$0000,$0110                   ;91AE94;
    dw $000F,$0000,$0120,$0011,$0000,$0900,$000F,$0000                   ;91AEA4;
    dw $0500,$0011,$0000,$0140,$000B,$0000,$0100,$000B                   ;91AEB4;
    dw $0000,$0200,$0025,$0000,$0800,$0003,$0000,$0010                   ;91AEC4;
    dw $0005,$0000,$0020,$0007,$FFFF                                     ;91AED4;

TransitionTable_0C_MovingLeft_GunExtended:
    dw $0400,$0000,$0036,$0080,$0000,$001A,$0000,$0210                   ;91AEDE;
    dw $0010,$0000,$0220,$0012,$0000,$0A00,$0010,$0000                   ;91AEEE;
    dw $0600,$0012,$0000,$0240,$000C,$0000,$0200,$000C                   ;91AEFE;
    dw $0000,$0100,$0026,$0000,$0800,$0004,$0000,$0010                   ;91AF0E;
    dw $0006,$0000,$0020,$0008,$FFFF                                     ;91AF1E;

TransitionTable_67_FacingRight_Falling_GunExtended:
    dw $0000,$0900,$006D,$0000,$0500,$006F,$0000,$0800                   ;91AF28;
    dw $002B,$0000,$0400,$002D,$0000,$0200,$0087,$0000                   ;91AF38;
    dw $0010,$006D,$0000,$0020,$006F,$0000,$0040,$0067                   ;91AF48;
    dw $0000,$0100,$0067,$FFFF                                           ;91AF58;

TransitionTable_68_FacingLeft_Falling_GunExtended:
    dw $0000,$0A00,$006E,$0000,$0600,$0070,$0000,$0800                   ;91AF60;
    dw $002C,$0000,$0400,$002E,$0000,$0100,$0088,$0000                   ;91AF70;
    dw $0010,$006E,$0000,$0020,$0070,$0000,$0040,$0068                   ;91AF80;
    dw $0000,$0200,$0068,$FFFF                                           ;91AF90;

TransitionTable_BF_FacingRight_Moonwalking_TurnJumpLeft:
    dw $0000,$0280,$001A,$0080,$0000,$004C,$0000,$0200                   ;91AF98;
    dw $00BF,$FFFF                                                       ;91AFA8;

TransitionTable_C0_FacingLeft_Moonwalking_TurnJumpRight:
    dw $0000,$0180,$0019,$0080,$0000,$004B,$0000,$0100                   ;91AFAC;
    dw $00C0,$FFFF                                                       ;91AFBC;

TransitionTable_C1_FaceRight_Moonwalk_TurnJumpLeft_AimUpRight:
    dw $0080,$0200,$001A,$0080,$0000,$004C,$0000,$0200                   ;91AFC0;
    dw $00C1,$FFFF                                                       ;91AFD0;

TransitionTable_C2_FaceLeft_Moonwalk_TurnJumpRight_AimUpLeft:
    dw $0080,$0100,$0019,$0080,$0000,$004B,$0000,$0100                   ;91AFD4;
    dw $00C2,$FFFF                                                       ;91AFE4;

TransitionTable_C3_FaceRight_Moonwalk_TurnJumpLeft_AimDownRight:
    dw $0080,$0200,$001A,$0080,$0000,$004C,$0000,$0200                   ;91AFE8;
    dw $00C3,$FFFF                                                       ;91AFF8;

TransitionTable_C4_FaceLeft_Moonwalk_TurnJumpRight_AimDownLeft:
    dw $0080,$0100,$0019,$0080,$0000,$004B,$0000,$0100                   ;91AFFC;
    dw $00C4,$FFFF                                                       ;91B00C;

AnimationDelayTable:
    dw AnimationDelays_0_9B                                              ;91B010;
    dw AnimationDelays_01_02                                             ;91B012;
    dw AnimationDelays_01_02                                             ;91B014;
    dw AnimationDelays_03_04_85_86                                       ;91B016;
    dw AnimationDelays_03_04_85_86                                       ;91B018;
    dw AnimationDelays_Various_91B2B4                                    ;91B01A;
    dw AnimationDelays_Various_91B2B4                                    ;91B01C;
    dw AnimationDelays_Various_91B2B4                                    ;91B01E;
    dw AnimationDelays_Various_91B2B4                                    ;91B020;
    dw AnimationDelays_09_0A_0B_0C_0D_0E_0F_10_11_12_45_46               ;91B022;
    dw AnimationDelays_09_0A_0B_0C_0D_0E_0F_10_11_12_45_46               ;91B024;
    dw AnimationDelays_09_0A_0B_0C_0D_0E_0F_10_11_12_45_46               ;91B026;
    dw AnimationDelays_09_0A_0B_0C_0D_0E_0F_10_11_12_45_46               ;91B028;
    dw AnimationDelays_09_0A_0B_0C_0D_0E_0F_10_11_12_45_46               ;91B02A;
    dw AnimationDelays_09_0A_0B_0C_0D_0E_0F_10_11_12_45_46               ;91B02C;
    dw AnimationDelays_09_0A_0B_0C_0D_0E_0F_10_11_12_45_46               ;91B02E;
    dw AnimationDelays_09_0A_0B_0C_0D_0E_0F_10_11_12_45_46               ;91B030;
    dw AnimationDelays_09_0A_0B_0C_0D_0E_0F_10_11_12_45_46               ;91B032;
    dw AnimationDelays_09_0A_0B_0C_0D_0E_0F_10_11_12_45_46               ;91B034;
    dw AnimationDelays_13_14_69_6A_6B_6C                                 ;91B036;
    dw AnimationDelays_13_14_69_6A_6B_6C                                 ;91B038;
    dw AnimationDelays_15_16                                             ;91B03A;
    dw AnimationDelays_15_16                                             ;91B03C;
    dw AnimationDelays_17_18                                             ;91B03E;
    dw AnimationDelays_17_18                                             ;91B040;
    dw AnimationDelays_19_1A                                             ;91B042;
    dw AnimationDelays_19_1A                                             ;91B044;
    dw AnimationDelays_1B_1C                                             ;91B046;
    dw AnimationDelays_1B_1C                                             ;91B048;
    dw AnimationDelays_Various_91B378                                    ;91B04A;
    dw AnimationDelays_Various_91B378                                    ;91B04C;
    dw AnimationDelays_Various_91B378                                    ;91B04E;
    dw AnimationDelays_Various_91B378                                    ;91B050;
    dw AnimationDelays_Various_91B378                                    ;91B052;
    dw AnimationDelays_Various_91B378                                    ;91B054;
    dw AnimationDelays_Various_91B378                                    ;91B056;
    dw AnimationDelays_Various_91B378                                    ;91B058;
    dw AnimationDelays_25                                                ;91B05A;
    dw AnimationDelays_26                                                ;91B05C;
    dw AnimationDelays_27_28                                             ;91B05E;
    dw AnimationDelays_27_28                                             ;91B060;
    dw AnimationDelays_29_2A                                             ;91B062;
    dw AnimationDelays_29_2A                                             ;91B064;
    dw AnimationDelays_2B_2C                                             ;91B066;
    dw AnimationDelays_2B_2C                                             ;91B068;
    dw AnimationDelays_2D_2E                                             ;91B06A;
    dw AnimationDelays_2D_2E                                             ;91B06C;
    dw AnimationDelays_2F                                                ;91B06E;
    dw AnimationDelays_30                                                ;91B070;
    dw AnimationDelays_Various_91B378                                    ;91B072;
    dw AnimationDelays_Various_91B378                                    ;91B074;
    dw AnimationDelays_Various_91B378                                    ;91B076;
    dw AnimationDelays_Various_91B378                                    ;91B078;
    dw AnimationDelays_35                                                ;91B07A;
    dw AnimationDelays_36                                                ;91B07C;
    dw AnimationDelays_37                                                ;91B07E;
    dw AnimationDelays_38                                                ;91B080;
    dw UNUSED_AnimationDelays_39_91B4DA                                  ;91B082;
    dw UNUSED_AnimationDelays_3A_91B4DD                                  ;91B084;
    dw AnimationDelays_3B                                                ;91B086;
    dw AnimationDelays_3C                                                ;91B088;
    dw AnimationDelays_3D                                                ;91B08A;
    dw AnimationDelays_3E                                                ;91B08C;
    dw UNUSED_AnimationDelays_3F_91B4EE                                  ;91B08E;
    dw UNUSED_AnimationDelays_40_91B4F4                                  ;91B090;
    dw AnimationDelays_Various_91B378                                    ;91B092;
    dw AnimationDelays_Various_91B378                                    ;91B094;
    dw AnimationDelays_43                                                ;91B096;
    dw AnimationDelays_44                                                ;91B098;
    dw AnimationDelays_09_0A_0B_0C_0D_0E_0F_10_11_12_45_46               ;91B09A;
    dw AnimationDelays_09_0A_0B_0C_0D_0E_0F_10_11_12_45_46               ;91B09C;
    dw AnimationDelays_Various_91B2B4                                    ;91B09E;
    dw AnimationDelays_Various_91B2B4                                    ;91B0A0;
    dw AnimationDelays_49_4A_75_76_77_78                                 ;91B0A2;
    dw AnimationDelays_49_4A_75_76_77_78                                 ;91B0A4;
    dw AnimationDelays_4B                                                ;91B0A6;
    dw AnimationDelays_4C                                                ;91B0A8;
    dw AnimationDelays_4D_4E_C7_C8                                       ;91B0AA;
    dw AnimationDelays_4D_4E_C7_C8                                       ;91B0AC;
    dw AnimationDelays_4F_50                                             ;91B0AE;
    dw AnimationDelays_4F_50                                             ;91B0B0;
    dw AnimationDelays_51_52                                             ;91B0B2;
    dw AnimationDelays_51_52                                             ;91B0B4;
    dw AnimationDelays_53_54                                             ;91B0B6;
    dw AnimationDelays_53_54                                             ;91B0B8;
    dw AnimationDelays_55                                                ;91B0BA;
    dw AnimationDelays_56                                                ;91B0BC;
    dw AnimationDelays_57                                                ;91B0BE;
    dw AnimationDelays_58                                                ;91B0C0;
    dw AnimationDelays_59                                                ;91B0C2;
    dw AnimationDelays_5A                                                ;91B0C4;
    dw AnimationDelays_Various_91B378                                    ;91B0C6;
    dw AnimationDelays_Various_91B378                                    ;91B0C8;
    dw AnimationDelays_Various_91B378                                    ;91B0CA;
    dw AnimationDelays_Various_91B378                                    ;91B0CC;
    dw AnimationDelays_Various_91B378                                    ;91B0CE;
    dw AnimationDelays_Various_91B378                                    ;91B0D0;
    dw AnimationDelays_Various_91B378                                    ;91B0D2;
    dw AnimationDelays_Various_91B378                                    ;91B0D4;
    dw UNUSED_AnimationDelays_63_91B47E                                  ;91B0D6;
    dw UNUSED_AnimationDelays_64_91B482                                  ;91B0D8;
    dw UNUSED_AnimationDelays_65_66_91B486                               ;91B0DA;
    dw UNUSED_AnimationDelays_65_66_91B486                               ;91B0DC;
    dw AnimationDelays_67_68                                             ;91B0DE;
    dw AnimationDelays_67_68                                             ;91B0E0;
    dw AnimationDelays_13_14_69_6A_6B_6C                                 ;91B0E2;
    dw AnimationDelays_13_14_69_6A_6B_6C                                 ;91B0E4;
    dw AnimationDelays_13_14_69_6A_6B_6C                                 ;91B0E6;
    dw AnimationDelays_13_14_69_6A_6B_6C                                 ;91B0E8;
    dw AnimationDelays_6D_6E_6F_70                                       ;91B0EA;
    dw AnimationDelays_6D_6E_6F_70                                       ;91B0EC;
    dw AnimationDelays_6D_6E_6F_70                                       ;91B0EE;
    dw AnimationDelays_6D_6E_6F_70                                       ;91B0F0;
    dw AnimationDelays_Various_91B2B4                                    ;91B0F2;
    dw AnimationDelays_Various_91B2B4                                    ;91B0F4;
    dw AnimationDelays_Various_91B2B4                                    ;91B0F6;
    dw AnimationDelays_Various_91B2B4                                    ;91B0F8;
    dw AnimationDelays_49_4A_75_76_77_78                                 ;91B0FA;
    dw AnimationDelays_49_4A_75_76_77_78                                 ;91B0FC;
    dw AnimationDelays_49_4A_75_76_77_78                                 ;91B0FE;
    dw AnimationDelays_49_4A_75_76_77_78                                 ;91B100;
    dw AnimationDelays_Various_91B378                                    ;91B102;
    dw AnimationDelays_Various_91B378                                    ;91B104;
    dw AnimationDelays_Various_91B378                                    ;91B106;
    dw AnimationDelays_Various_91B378                                    ;91B108;
    dw AnimationDelays_Various_91B378                                    ;91B10A;
    dw AnimationDelays_Various_91B378                                    ;91B10C;
    dw AnimationDelays_Various_91B378                                    ;91B10E;
    dw AnimationDelays_Various_91B378                                    ;91B110;
    dw AnimationDelays_81_82                                             ;91B112;
    dw AnimationDelays_81_82                                             ;91B114;
    dw AnimationDelays_83_84                                             ;91B116;
    dw AnimationDelays_83_84                                             ;91B118;
    dw AnimationDelays_03_04_85_86                                       ;91B11A;
    dw AnimationDelays_03_04_85_86                                       ;91B11C;
    dw AnimationDelays_87                                                ;91B11E;
    dw AnimationDelays_88                                                ;91B120;
    dw AnimationDelays_Various_91B2B4                                    ;91B122;
    dw AnimationDelays_Various_91B2B4                                    ;91B124;
    dw AnimationDelays_8B                                                ;91B126;
    dw AnimationDelays_8C                                                ;91B128;
    dw AnimationDelays_8D                                                ;91B12A;
    dw AnimationDelays_8E                                                ;91B12C;
    dw AnimationDelays_8F                                                ;91B12E;
    dw AnimationDelays_90                                                ;91B130;
    dw AnimationDelays_91                                                ;91B132;
    dw AnimationDelays_92                                                ;91B134;
    dw AnimationDelays_93                                                ;91B136;
    dw AnimationDelays_94                                                ;91B138;
    dw AnimationDelays_95                                                ;91B13A;
    dw AnimationDelays_96                                                ;91B13C;
    dw AnimationDelays_97                                                ;91B13E;
    dw AnimationDelays_98                                                ;91B140;
    dw AnimationDelays_99                                                ;91B142;
    dw AnimationDelays_9A                                                ;91B144;
    dw AnimationDelays_0_9B                                              ;91B146;
    dw AnimationDelays_9C                                                ;91B148;
    dw AnimationDelays_9D                                                ;91B14A;
    dw AnimationDelays_9E                                                ;91B14C;
    dw AnimationDelays_9F                                                ;91B14E;
    dw AnimationDelays_A0                                                ;91B150;
    dw AnimationDelays_A1                                                ;91B152;
    dw AnimationDelays_A2                                                ;91B154;
    dw AnimationDelays_A3                                                ;91B156;
    dw AnimationDelays_A4_E6                                             ;91B158;
    dw AnimationDelays_A5_E7                                             ;91B15A;
    dw AnimationDelays_A6                                                ;91B15C;
    dw AnimationDelays_A7                                                ;91B15E;
    dw AnimationDelays_A8_A9_AA_AB                                       ;91B160;
    dw AnimationDelays_A8_A9_AA_AB                                       ;91B162;
    dw AnimationDelays_A8_A9_AA_AB                                       ;91B164;
    dw AnimationDelays_A8_A9_AA_AB                                       ;91B166;
    dw AnimationDelays_AC_AD                                             ;91B168;
    dw AnimationDelays_AC_AD                                             ;91B16A;
    dw AnimationDelays_AE_AF                                             ;91B16C;
    dw AnimationDelays_AE_AF                                             ;91B16E;
    dw AnimationDelays_B0_B1                                             ;91B170;
    dw AnimationDelays_B0_B1                                             ;91B172;
    dw AnimationDelays_B2_B3                                             ;91B174;
    dw AnimationDelays_B2_B3                                             ;91B176;
    dw AnimationDelays_Various_91B2B4                                    ;91B178;
    dw AnimationDelays_Various_91B2B4                                    ;91B17A;
    dw AnimationDelays_Various_91B2B4                                    ;91B17C;
    dw AnimationDelays_Various_91B2B4                                    ;91B17E;
    dw AnimationDelays_Various_91B2B4                                    ;91B180;
    dw AnimationDelays_Various_91B2B4                                    ;91B182;
    dw AnimationDelays_Various_91B2B4                                    ;91B184;
    dw AnimationDelays_Various_91B2B4                                    ;91B186;
    dw AnimationDelays_Various_91B2B4                                    ;91B188;
    dw AnimationDelays_Various_91B2B4                                    ;91B18A;
    dw AnimationDelays_BE_F0                                             ;91B18C;
    dw AnimationDelays_BF                                                ;91B18E;
    dw AnimationDelays_C0                                                ;91B190;
    dw AnimationDelays_C1                                                ;91B192;
    dw AnimationDelays_C2                                                ;91B194;
    dw AnimationDelays_C3                                                ;91B196;
    dw AnimationDelays_C4                                                ;91B198;
    dw AnimationDelays_Various_91B378                                    ;91B19A;
    dw UNUSED_AnimationDelays_C6_91B479                                  ;91B19C;
    dw AnimationDelays_4D_4E_C7_C8                                       ;91B19E;
    dw AnimationDelays_4D_4E_C7_C8                                       ;91B1A0;
    dw AnimationDelays_C9_CA_CB_CC_CD_CE                                 ;91B1A2;
    dw AnimationDelays_C9_CA_CB_CC_CD_CE                                 ;91B1A4;
    dw AnimationDelays_C9_CA_CB_CC_CD_CE                                 ;91B1A6;
    dw AnimationDelays_C9_CA_CB_CC_CD_CE                                 ;91B1A8;
    dw AnimationDelays_C9_CA_CB_CC_CD_CE                                 ;91B1AA;
    dw AnimationDelays_C9_CA_CB_CC_CD_CE                                 ;91B1AC;
    dw AnimationDelays_Various_91B2B4                                    ;91B1AE;
    dw AnimationDelays_Various_91B2B4                                    ;91B1B0;
    dw AnimationDelays_Various_91B2B4                                    ;91B1B2;
    dw AnimationDelays_Various_91B2B4                                    ;91B1B4;
    dw AnimationDelays_D3                                                ;91B1B6;
    dw AnimationDelays_D4                                                ;91B1B8;
    dw AnimationDelays_D5_D6_D9_DA                                       ;91B1BA;
    dw AnimationDelays_D5_D6_D9_DA                                       ;91B1BC;
    dw AnimationDelays_D7_D8                                             ;91B1BE;
    dw AnimationDelays_D7_D8                                             ;91B1C0;
    dw AnimationDelays_D5_D6_D9_DA                                       ;91B1C2;
    dw AnimationDelays_D5_D6_D9_DA                                       ;91B1C4;
    dw UNUSED_AnimationDelays_DB_91B4FA                                  ;91B1C6;
    dw UNUSED_AnimationDelays_DC_91B504                                  ;91B1C8;
    dw UNUSED_AnimationDelays_DD_91B50E                                  ;91B1CA;
    dw UNUSED_AnimationDelays_DE_91B513                                  ;91B1CC;
    dw AnimationDelays_Various_91B378                                    ;91B1CE;
    dw AnimationDelays_E0                                                ;91B1D0;
    dw AnimationDelays_E1                                                ;91B1D2;
    dw AnimationDelays_E2                                                ;91B1D4;
    dw AnimationDelays_E3                                                ;91B1D6;
    dw AnimationDelays_E4                                                ;91B1D8;
    dw AnimationDelays_E5                                                ;91B1DA;
    dw AnimationDelays_A4_E6                                             ;91B1DC;
    dw AnimationDelays_A5_E7                                             ;91B1DE;
    dw AnimationDelays_E8                                                ;91B1E0;
    dw AnimationDelays_E9                                                ;91B1E2;
    dw AnimationDelays_EA                                                ;91B1E4;
    dw AnimationDelays_EB                                                ;91B1E6;
    dw AnimationDelays_Various_91B2B4                                    ;91B1E8;
    dw AnimationDelays_Various_91B2B4                                    ;91B1EA;
    dw AnimationDelays_Various_91B2B4                                    ;91B1EC;
    dw AnimationDelays_Various_91B2B4                                    ;91B1EE;
    dw AnimationDelays_BE_F0                                             ;91B1F0;
    dw AnimationDelays_F1                                                ;91B1F2;
    dw AnimationDelays_F2                                                ;91B1F4;
    dw AnimationDelays_F3                                                ;91B1F6;
    dw AnimationDelays_F4                                                ;91B1F8;
    dw AnimationDelays_F5                                                ;91B1FA;
    dw AnimationDelays_F6                                                ;91B1FC;
    dw AnimationDelays_F7                                                ;91B1FE;
    dw AnimationDelays_F8                                                ;91B200;
    dw AnimationDelays_F9                                                ;91B202;
    dw AnimationDelays_FA                                                ;91B204;
    dw AnimationDelays_FB                                                ;91B206;
    dw AnimationDelays_FC                                                ;91B208;

AnimationDelays_09_0A_0B_0C_0D_0E_0F_10_11_12_45_46:
    db $02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$FF                       ;91B20A;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_AnimationDelays_91B215:
    db $04,$04,$04,$04,$04,$04,$03,$04,$04,$03,$FF,$0A,$FF               ;91B215;
endif ; !FEATURE_KEEP_UNREFERENCED

AnimationDelays_03_04_85_86:
    db $02,$10,$FE,$01                                                   ;91B222;

AnimationDelays_49_4A_75_76_77_78:
    db $10,$10,$10,$10,$10,$10,$FF                                       ;91B226;

AnimationDelays_A4_E6:
    db $05,$02,$F8,$01                                                   ;91B22D;

AnimationDelays_A5_E7:
    db $05,$02,$F8,$02                                                   ;91B231;

AnimationDelays_A6:
    db $03,$05,$02,$F8,$01                                               ;91B235;

AnimationDelays_A7:
    db $03,$05,$02,$F8,$02                                               ;91B23A;

AnimationDelays_E0:
    db $05,$02,$F8,$03                                                   ;91B23F;

AnimationDelays_E1:
    db $05,$02,$F8,$04                                                   ;91B243;

AnimationDelays_E2:
    db $05,$02,$F8,$05                                                   ;91B247;

AnimationDelays_E3:
    db $05,$02,$F8,$06                                                   ;91B24B;

AnimationDelays_E4:
    db $05,$02,$F8,$07                                                   ;91B24F;

AnimationDelays_E5:
    db $05,$02,$F8,$08                                                   ;91B253;

AnimationDelays_E8:
    db $02,$02,$02,$10,$F7,$01,$FE,$01,$10,$10,$10,$10,$FE,$04,$03,$FD   ;91B257;
    db $01                                                               ;91B267;

AnimationDelays_E9:
    db $02,$02,$10,$F7,$01,$FE,$01,$08,$10,$10,$10,$10,$FE,$04,$10,$10   ;91B268;
    db $10,$FD,$02,$10,$10,$10,$10,$10,$FE,$0E,$10,$FE,$11,$10,$FE,$01   ;91B278;

AnimationDelays_EA:
    db $10,$10,$10,$10,$FF,$03,$FD,$01                                   ;91B288;

AnimationDelays_EB:
    db $10,$10,$10,$10,$FF,$03,$FD,$02                                   ;91B290;

AnimationDelays_01_02:
    db $0A,$0A,$0A,$0A,$F6,$08,$08,$08,$08,$FE,$04                       ;91B298;

AnimationDelays_27_28:
    db $0A,$0A,$0A,$0A,$F6,$08,$08,$08,$08,$FE,$04                       ;91B2A3;

AnimationDelays_D5_D6_D9_DA:
    db $0F,$0F,$0F,$0F,$0F,$FF                                           ;91B2AE;

AnimationDelays_Various_91B2B4:
    db $10,$FF                                                           ;91B2B4;

AnimationDelays_A8_A9_AA_AB:
    db $10,$FF                                                           ;91B2B6;

AnimationDelays_AC_AD:
    db $02,$10,$FE,$01                                                   ;91B2B8;

AnimationDelays_AE_AF:
    db $02,$10,$FE,$01                                                   ;91B2BC;

AnimationDelays_B0_B1:
    db $02,$10,$FE,$01                                                   ;91B2C0;

AnimationDelays_B2_B3:
    db $08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08   ;91B2C4;
    db $08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08   ;91B2D4;
    db $08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08   ;91B2E4;
    db $08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08   ;91B2F4;
    db $08,$08,$FE,$01                                                   ;91B304;

AnimationDelays_4B:
    db $01,$FD,$4D                                                       ;91B308;

AnimationDelays_4C:
    db $01,$FD,$4E                                                       ;91B30B;

AnimationDelays_55:
    db $01,$FD,$15,$00                                                   ;91B30E;

AnimationDelays_56:
    db $01,$FD,$16,$00                                                   ;91B312;

AnimationDelays_57:
    db $01,$FD,$69,$00                                                   ;91B316;

AnimationDelays_58:
    db $01,$FD,$6A,$00                                                   ;91B31A;

AnimationDelays_59:
    db $01,$FD,$6B,$00                                                   ;91B31E;

AnimationDelays_5A:
    db $01,$FD,$6C,$00                                                   ;91B322;

AnimationDelays_4D_4E_C7_C8:
    db $03,$04,$04,$04,$04,$50,$FE,$01                                   ;91B326;

AnimationDelays_4F_50:
    db $08,$02,$02,$02,$02,$02,$02,$02,$02,$02,$FE,$01                   ;91B32E;

AnimationDelays_15_16:
    db $02,$10,$FE,$01                                                   ;91B33A;

AnimationDelays_17_18:
    db $02,$10,$FE,$01                                                   ;91B33E;

AnimationDelays_51_52:
    db $02,$03,$FE,$01                                                   ;91B342;

AnimationDelays_13_14_69_6A_6B_6C:
    db $02,$10,$FE,$01                                                   ;91B346;

AnimationDelays_29_2A:
    db $08,$06,$06,$FE,$01,$08,$10,$FE,$01                               ;91B34A;

AnimationDelays_67_68:
    db $08,$06,$06,$FE,$01,$08,$10,$FE,$01                               ;91B353;

AnimationDelays_2B_2C:
    db $02,$10,$10,$FE,$01                                               ;91B35C;

AnimationDelays_6D_6E_6F_70:
    db $02,$F0,$10,$FE,$01                                               ;91B361;

AnimationDelays_2D_2E:
    db $02,$10,$FE,$01                                                   ;91B366;

AnimationDelays_53_54:
    db $02,$10,$FE,$01                                                   ;91B36A;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_AnimationDelays_91B36E:
    db $06,$06,$06,$08,$FF,$08,$08,$FF,$0A,$FF                           ;91B36E;
endif ; !FEATURE_KEEP_UNREFERENCED

AnimationDelays_Various_91B378:
    db $03,$03,$03,$03,$03,$03,$03,$03,$FF,$03,$FE,$0A                   ;91B378;

AnimationDelays_19_1A:
    db $04,$03,$02,$03,$02,$03,$02,$03,$02,$FE,$08,$08,$FF               ;91B384;

AnimationDelays_1B_1C:
    db $04,$01,$01,$01,$01,$01,$01,$01,$01,$FE,$08,$08,$FF               ;91B391;

AnimationDelays_81_82:
    db $04,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01   ;91B39E;
    db $01,$01,$01,$01,$01,$01,$01,$01,$01,$FE,$18,$08,$FF               ;91B3AE;

AnimationDelays_25:
    db $02,$02,$02,$F8,$02                                               ;91B3BB;

AnimationDelays_26:
    db $02,$02,$02,$F8,$01                                               ;91B3C0;

AnimationDelays_2F:
    db $02,$02,$02,$F8,$52                                               ;91B3C5;

AnimationDelays_30:
    db $02,$02,$02,$F8,$51                                               ;91B3CA;

AnimationDelays_43:
    db $02,$02,$02,$F8,$28                                               ;91B3CF;

AnimationDelays_44:
    db $02,$02,$02,$F8,$27                                               ;91B3D4;

AnimationDelays_87:
    db $02,$02,$02,$F8,$2A                                               ;91B3D9;

AnimationDelays_88:
    db $02,$02,$02,$F8,$29                                               ;91B3DE;

AnimationDelays_8B:
    db $02,$02,$02,$F8,$04                                               ;91B3E3;

AnimationDelays_8C:
    db $02,$02,$02,$F8,$03                                               ;91B3E8;

AnimationDelays_8D:
    db $02,$02,$02,$F8,$08                                               ;91B3ED;

AnimationDelays_8E:
    db $02,$02,$02,$F8,$07                                               ;91B3F2;

AnimationDelays_8F:
    db $02,$02,$02,$F8,$16                                               ;91B3F7;

AnimationDelays_90:
    db $02,$02,$02,$F8,$15                                               ;91B3FC;

AnimationDelays_91:
    db $02,$02,$02,$F8,$18                                               ;91B401;

AnimationDelays_92:
    db $02,$02,$02,$F8,$17                                               ;91B406;

AnimationDelays_93:
    db $02,$02,$02,$F8,$2C                                               ;91B40B;

AnimationDelays_94:
    db $02,$02,$02,$F8,$2B                                               ;91B410;

AnimationDelays_95:
    db $02,$02,$02,$F8,$2E                                               ;91B415;

AnimationDelays_96:
    db $02,$02,$02,$F8,$2D                                               ;91B41A;

AnimationDelays_97:
    db $02,$02,$02,$F8,$86                                               ;91B41F;

AnimationDelays_98:
    db $02,$02,$02,$F8,$85                                               ;91B424;

AnimationDelays_99:
    db $02,$02,$02,$F8,$74                                               ;91B429;

AnimationDelays_9A:
    db $02,$02,$02,$F8,$73                                               ;91B42E;

AnimationDelays_9C:
    db $02,$02,$02,$F8,$06                                               ;91B433;

AnimationDelays_9D:
    db $02,$02,$02,$F8,$05                                               ;91B438;

AnimationDelays_9E:
    db $02,$02,$02,$F8,$6A                                               ;91B43D;

AnimationDelays_9F:
    db $02,$02,$02,$F8,$69                                               ;91B442;

AnimationDelays_A0:
    db $02,$02,$02,$F8,$6E                                               ;91B447;

AnimationDelays_A1:
    db $02,$02,$02,$F8,$6D                                               ;91B44C;

AnimationDelays_A2:
    db $02,$02,$02,$F8,$72                                               ;91B451;

AnimationDelays_A3:
    db $02,$02,$02,$F8,$71                                               ;91B456;

AnimationDelays_BF:
    db $02,$02,$02,$F8,$1A                                               ;91B45B;

AnimationDelays_C0:
    db $02,$02,$02,$F8,$19                                               ;91B460;

AnimationDelays_C1:
    db $02,$02,$02,$F8,$1A                                               ;91B465;

AnimationDelays_C2:
    db $02,$02,$02,$F8,$19                                               ;91B46A;

AnimationDelays_C3:
    db $02,$02,$02,$F8,$1A                                               ;91B46F;

AnimationDelays_C4:
    db $02,$02,$02,$F8,$19                                               ;91B474;

UNUSED_AnimationDelays_C6_91B479:
    db $02,$02,$02,$FD,$BA                                               ;91B479;

UNUSED_AnimationDelays_63_91B47E:
    db $04,$03,$FE,$01                                                   ;91B47E;

UNUSED_AnimationDelays_64_91B482:
    db $04,$03,$FE,$01                                                   ;91B482;

UNUSED_AnimationDelays_65_66_91B486:
    db $03,$02,$02,$02,$02,$02,$02,$02,$02,$FE,$08                       ;91B486;

AnimationDelays_83_84:
    db $05,$05,$FB,$03,$02,$03,$02,$03,$02,$03,$02,$FE,$08,$02,$01,$02   ;91B491;
    db $01,$02,$01,$02,$01,$FE,$08,$01,$01,$01,$01,$01,$01,$01,$01,$01   ;91B4A1;
    db $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$FE   ;91B4B1;
    db $18                                                               ;91B4C1;

AnimationDelays_35:
    db $03,$FD,$27                                                       ;91B4C2;

AnimationDelays_36:
    db $03,$FD,$28                                                       ;91B4C5;

AnimationDelays_37:
    db $03,$03,$F9                                                       ;91B4C8;
    dw $0002                                                             ;91B4CB;
    db $1D,$31,$79,$7D                                                   ;91B4CD;

AnimationDelays_38:
    db $03,$03,$F9                                                       ;91B4D1;
    dw $0002                                                             ;91B4D4;
    db $41,$32,$7A,$7E                                                   ;91B4D6;

UNUSED_AnimationDelays_39_91B4DA:
    db $00,$FD,$20                                                       ;91B4DA;

UNUSED_AnimationDelays_3A_91B4DD:
    db $00,$FD,$42                                                       ;91B4DD;

AnimationDelays_3B:
    db $03,$FD,$01                                                       ;91B4E0;

AnimationDelays_3C:
    db $03,$FD,$02                                                       ;91B4E3;

AnimationDelays_3D:
    db $03,$03,$FD,$27                                                   ;91B4E6;

AnimationDelays_3E:
    db $03,$03,$FD,$28                                                   ;91B4EA;

UNUSED_AnimationDelays_3F_91B4EE:
    db $00,$FC                                                           ;91B4EE;
    dw $0002                                                             ;91B4F0;
    db $1D,$79                                                           ;91B4F2;

UNUSED_AnimationDelays_40_91B4F4:
    db $00,$FC                                                           ;91B4F4;
    dw $0002                                                             ;91B4F6;
    db $41,$7A                                                           ;91B4F8;

UNUSED_AnimationDelays_DB_91B4FA:
    db $03,$03,$03,$F9                                                   ;91B4FA;
    dw $0002                                                             ;91B4FE;
    db $1D,$31,$79,$7D                                                   ;91B500;

UNUSED_AnimationDelays_DC_91B504:
    db $03,$03,$03,$F9                                                   ;91B504;
    dw $0002                                                             ;91B508;
    db $DF,$DF,$DF,$DF                                                   ;91B50A;

UNUSED_AnimationDelays_DD_91B50E:
    db $03,$03,$03,$FD,$01                                               ;91B50E;

UNUSED_AnimationDelays_DE_91B513:
    db $03,$03,$03,$FD,$BA                                               ;91B513;

AnimationDelays_F1:
    db $03,$FD,$85                                                       ;91B518;

AnimationDelays_F2:
    db $03,$FD,$86                                                       ;91B51B;

AnimationDelays_F3:
    db $03,$FD,$71                                                       ;91B51E;

AnimationDelays_F4:
    db $03,$FD,$72                                                       ;91B521;

AnimationDelays_F5:
    db $03,$FD,$73                                                       ;91B524;

AnimationDelays_F6:
    db $03,$FD,$74                                                       ;91B527;

AnimationDelays_F7:
    db $03,$FD,$03                                                       ;91B52A;

AnimationDelays_F8:
    db $03,$FD,$04                                                       ;91B52D;

AnimationDelays_F9:
    db $03,$FD,$05                                                       ;91B530;

AnimationDelays_FA:
    db $03,$FD,$06                                                       ;91B533;

AnimationDelays_FB:
    db $03,$FD,$07                                                       ;91B536;

AnimationDelays_FC:
    db $03,$FD,$08                                                       ;91B539;

AnimationDelays_BE_F0:
    db $06,$06,$06,$06,$06,$06,$FF                                       ;91B53C;

AnimationDelays_C9_CA_CB_CC_CD_CE:
    db $08,$FF                                                           ;91B543;

AnimationDelays_D3:
    db $03,$03,$01,$01,$FE,$02,$0C,$0C,$0C,$0C,$FE,$04,$03,$03,$03,$FD   ;91B545;
    db $01                                                               ;91B555;

AnimationDelays_D4:
    db $03,$03,$01,$01,$FE,$02,$0C,$0C,$0C,$0C,$FE,$04,$03,$03,$03,$FD   ;91B556;
    db $02                                                               ;91B566;

AnimationDelays_D7_D8:
    db $02,$02,$02,$02,$02,$02,$FE,$01                                   ;91B567;

AnimationDelays_0_9B:
    db $08,$FF,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03   ;91B56F;
    db $03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03   ;91B57F;
    db $03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03   ;91B58F;
    db $03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03   ;91B59F;
    db $03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03   ;91B5AF;
    db $03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$33,$02,$02,$02,$30   ;91B5BF;
    db $FE,$01                                                           ;91B5CF;

AnimationDelayTable_Running_NoSpeedBooster_pointer:
    dw AnimationDelayTable_Running_NoSpeedBooster                        ;91B5D1;

AnimationDelayTable_Running_NoSpeedBooster:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$FF                       ;91B5D3;

AnimationDelayTable_Running_SpeedBooster_pointers:
    dw AnimationDelayTable_Running_SpeedBooster_0                        ;91B5DE;
    dw AnimationDelayTable_Running_SpeedBooster_1                        ;91B5E0;
    dw AnimationDelayTable_Running_SpeedBooster_2                        ;91B5E2;
    dw AnimationDelayTable_Running_SpeedBooster_3                        ;91B5E4;
    dw AnimationDelayTable_Running_SpeedBooster_4                        ;91B5E6;

AnimationDelayTable_Running_SpeedBooster_0:
    db $03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$FF                       ;91B5E8;

AnimationDelayTable_Running_SpeedBooster_1:
    db $02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$FF                       ;91B5F3;

AnimationDelayTable_Running_SpeedBooster_2:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$FF                       ;91B5FE;

AnimationDelayTable_Running_SpeedBooster_3:
    db $01,$02,$01,$02,$01,$02,$01,$02,$01,$02,$FF                       ;91B609;

AnimationDelayTable_Running_SpeedBooster_4:
    db $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$FF                       ;91B614;

SpeedBoostTimerResetValues:
    dw $0001,$0001,$0001,$0001,$0002                                     ;91B61F;

PoseDefinitions_00_XDirection:
    db $00                                                               ;91B629;

PoseDefinitions_movementType:
    db $00                                                               ;91B62A;

PoseDefinitions_newPose:
    db $FF                                                               ;91B62B;

PoseDefinitions_directionShotsFired:
    db $FF                                                               ;91B62C;

PoseDefinitions_YOffset:
    db $08,$00                                                           ;91B62D;

PoseDefinitions_YRadius:
    db $18,$00                                                           ;91B62F;

PoseDefinitions_01:
    db $08,$00,$FF,$02,$06,$00,$15,$00                                   ;91B631;

PoseDefinitions_02:
    db $04,$00,$FF,$07,$06,$00,$15,$00                                   ;91B639;

PoseDefinitions_03:
    db $08,$00,$01,$00,$06,$00,$15,$00                                   ;91B641;

PoseDefinitions_04:
    db $04,$00,$02,$09,$06,$00,$15,$00                                   ;91B649;

PoseDefinitions_05:
    db $08,$00,$01,$01,$06,$00,$15,$00                                   ;91B651;

PoseDefinitions_06:
    db $04,$00,$02,$08,$06,$00,$15,$00                                   ;91B659;

PoseDefinitions_07:
    db $08,$00,$01,$03,$06,$00,$15,$00                                   ;91B661;

PoseDefinitions_08:
    db $04,$00,$02,$06,$06,$00,$15,$00                                   ;91B669;

PoseDefinitions_09:
    db $08,$01,$01,$02,$06,$00,$15,$00                                   ;91B671;

PoseDefinitions_0A:
    db $04,$01,$02,$07,$06,$00,$15,$00                                   ;91B679;

PoseDefinitions_0B:
    db $08,$01,$01,$02,$06,$00,$15,$00                                   ;91B681;

PoseDefinitions_0C:
    db $04,$01,$02,$07,$06,$00,$15,$00                                   ;91B689;

PoseDefinitions_0D:
    db $08,$01,$01,$00,$06,$00,$15,$00                                   ;91B691;

PoseDefinitions_0E:
    db $04,$01,$02,$09,$06,$00,$15,$00                                   ;91B699;

PoseDefinitions_0F:
    db $08,$01,$01,$01,$06,$00,$15,$00                                   ;91B6A1;

PoseDefinitions_10:
    db $04,$01,$02,$08,$06,$00,$15,$00                                   ;91B6A9;

PoseDefinitions_11:
    db $08,$01,$01,$03,$06,$00,$15,$00                                   ;91B6B1;

PoseDefinitions_12:
    db $04,$01,$02,$06,$06,$00,$15,$00                                   ;91B6B9;

PoseDefinitions_13:
    db $08,$02,$FF,$02,$08,$00,$13,$00                                   ;91B6C1;

PoseDefinitions_14:
    db $04,$02,$FF,$07,$08,$00,$13,$00                                   ;91B6C9;

PoseDefinitions_15:
    db $08,$02,$51,$00,$08,$00,$13,$00                                   ;91B6D1;

PoseDefinitions_16:
    db $04,$02,$52,$09,$08,$00,$13,$00                                   ;91B6D9;

PoseDefinitions_17:
    db $08,$02,$FF,$04,$06,$00,$0A,$00                                   ;91B6E1;

PoseDefinitions_18:
    db $04,$02,$FF,$05,$06,$00,$0A,$00                                   ;91B6E9;

PoseDefinitions_19:
    db $08,$03,$FF,$FF,$00,$00,$0C,$00                                   ;91B6F1;

PoseDefinitions_1A:
    db $04,$03,$FF,$FF,$00,$00,$0C,$00                                   ;91B6F9;

PoseDefinitions_1B:
    db $08,$03,$FF,$FF,$00,$00,$0C,$00                                   ;91B701;

PoseDefinitions_1C:
    db $04,$03,$FF,$FF,$00,$00,$0C,$00                                   ;91B709;

PoseDefinitions_1D:
    db $08,$04,$FF,$FF,$00,$00,$07,$00                                   ;91B711;

PoseDefinitions_1E:
    db $08,$04,$1D,$FF,$00,$00,$07,$00                                   ;91B719;

PoseDefinitions_1F:
    db $04,$04,$41,$FF,$00,$00,$07,$00                                   ;91B721;

UNUSED_PoseDefinitions_20_91B729:
    db $08,$07,$FF,$FF,$00,$00,$07,$00                                   ;91B729;

UNUSED_PoseDefinitions_21_91B731:
    db $01,$07,$20,$FF,$00,$00,$07,$00                                   ;91B731;

UNUSED_PoseDefinitions_22_91B739:
    db $02,$07,$20,$FF,$00,$00,$07,$00                                   ;91B739;

UNUSED_PoseDefinitions_23_91B741:
    db $04,$07,$42,$FF,$00,$00,$07,$00                                   ;91B741;

UNUSED_PoseDefinitions_24_91B749:
    db $08,$07,$20,$FF,$00,$00,$07,$00                                   ;91B749;

PoseDefinitions_25:
    db $04,$0E,$FF,$FB,$06,$00,$15,$00                                   ;91B751;

PoseDefinitions_26:
    db $08,$0E,$FF,$FB,$06,$00,$15,$00                                   ;91B759;

PoseDefinitions_27:
    db $08,$05,$27,$02,$00,$00,$10,$00                                   ;91B761;

PoseDefinitions_28:
    db $04,$05,$28,$07,$00,$00,$10,$00                                   ;91B769;

PoseDefinitions_29:
    db $08,$06,$FF,$02,$08,$00,$13,$00                                   ;91B771;

PoseDefinitions_2A:
    db $04,$06,$FF,$07,$08,$00,$13,$00                                   ;91B779;

PoseDefinitions_2B:
    db $08,$06,$29,$00,$08,$00,$13,$00                                   ;91B781;

PoseDefinitions_2C:
    db $04,$06,$2A,$09,$08,$00,$13,$00                                   ;91B789;

PoseDefinitions_2D:
    db $08,$06,$FF,$04,$06,$00,$0A,$00                                   ;91B791;

PoseDefinitions_2E:
    db $04,$06,$FF,$05,$06,$00,$0A,$00                                   ;91B799;

PoseDefinitions_2F:
    db $04,$17,$FF,$FB,$08,$00,$13,$00                                   ;91B7A1;

PoseDefinitions_30:
    db $08,$17,$FF,$FB,$08,$00,$13,$00                                   ;91B7A9;

PoseDefinitions_31:
    db $08,$08,$FF,$FF,$00,$00,$07,$00                                   ;91B7B1;

PoseDefinitions_32:
    db $04,$08,$FF,$FF,$00,$00,$07,$00                                   ;91B7B9;

UNUSED_PoseDefinitions_33_91B7C1:
    db $08,$09,$FF,$FF,$00,$00,$07,$00                                   ;91B7C1;

UNUSED_PoseDefinitions_34_91B7C9:
    db $04,$09,$FF,$FF,$00,$00,$07,$00                                   ;91B7C9;

PoseDefinitions_35:
    db $08,$0F,$FF,$02,$00,$00,$10,$00                                   ;91B7D1;

PoseDefinitions_36:
    db $04,$0F,$FF,$07,$00,$00,$10,$00                                   ;91B7D9;

PoseDefinitions_37:
    db $08,$0F,$FF,$FF,$00,$00,$07,$00                                   ;91B7E1;

PoseDefinitions_38:
    db $04,$0F,$FF,$FF,$00,$00,$07,$00                                   ;91B7E9;

UNUSED_PoseDefinitions_39_91B7F1:
    db $08,$0F,$FF,$FF,$00,$00,$07,$00                                   ;91B7F1;

UNUSED_PoseDefinitions_3A_91B7F9:
    db $04,$0F,$FF,$FF,$00,$00,$07,$00                                   ;91B7F9;

PoseDefinitions_3B:
    db $08,$0F,$FF,$02,$06,$00,$15,$00                                   ;91B801;

PoseDefinitions_3C:
    db $04,$0F,$FF,$07,$06,$00,$15,$00                                   ;91B809;

PoseDefinitions_3D:
    db $08,$0F,$FF,$FF,$00,$00,$10,$00                                   ;91B811;

PoseDefinitions_3E:
    db $04,$0F,$FF,$FF,$00,$00,$10,$00                                   ;91B819;

UNUSED_PoseDefinitions_3F_91B821:
    db $08,$0F,$FF,$FF,$00,$00,$07,$00                                   ;91B821;

UNUSED_PoseDefinitions_40_91B829:
    db $04,$0F,$FF,$FF,$00,$00,$07,$00                                   ;91B829;

PoseDefinitions_41:
    db $04,$04,$FF,$FF,$00,$00,$07,$00                                   ;91B831;

UNUSED_PoseDefinitions_42_91B839:
    db $04,$07,$FF,$FF,$00,$00,$07,$00                                   ;91B839;

PoseDefinitions_43:
    db $04,$0E,$FF,$FB,$00,$00,$10,$00                                   ;91B841;

PoseDefinitions_44:
    db $08,$0E,$FF,$FB,$00,$00,$10,$00                                   ;91B849;

UNUSED_PoseDefinitions_45_91B851:
    db $08,$01,$01,$07,$06,$00,$15,$00                                   ;91B851;

UNUSED_PoseDefinitions_46_91B859:
    db $04,$01,$02,$02,$06,$00,$15,$00                                   ;91B859;

UNUSED_PoseDefinitions_47_91B861:
    db $08,$00,$FF,$02,$06,$00,$15,$00                                   ;91B861;

UNUSED_PoseDefinitions_48_91B869:
    db $04,$00,$FF,$07,$06,$00,$15,$00                                   ;91B869;

PoseDefinitions_49:
    db $08,$10,$02,$07,$06,$00,$15,$00                                   ;91B871;

PoseDefinitions_4A:
    db $04,$10,$01,$02,$06,$00,$15,$00                                   ;91B879;

PoseDefinitions_4B:
    db $08,$02,$FF,$02,$03,$00,$13,$00                                   ;91B881;

PoseDefinitions_4C:
    db $04,$02,$FF,$07,$03,$00,$13,$00                                   ;91B889;

PoseDefinitions_4D:
    db $08,$02,$FF,$02,$08,$00,$13,$00                                   ;91B891;

PoseDefinitions_4E:
    db $04,$02,$FF,$07,$08,$00,$13,$00                                   ;91B899;

PoseDefinitions_4F:
    db $08,$19,$4E,$FF,$08,$00,$13,$00                                   ;91B8A1;

PoseDefinitions_50:
    db $04,$19,$4D,$FF,$08,$00,$13,$00                                   ;91B8A9;

PoseDefinitions_51:
    db $08,$02,$FF,$02,$08,$00,$13,$00                                   ;91B8B1;

PoseDefinitions_52:
    db $04,$02,$FF,$07,$08,$00,$13,$00                                   ;91B8B9;

PoseDefinitions_53:
    db $08,$0A,$FF,$FF,$06,$00,$15,$00                                   ;91B8C1;

PoseDefinitions_54:
    db $04,$0A,$FF,$FF,$06,$00,$15,$00                                   ;91B8C9;

PoseDefinitions_55:
    db $08,$02,$FF,$00,$03,$00,$13,$00                                   ;91B8D1;

PoseDefinitions_56:
    db $04,$02,$FF,$09,$03,$00,$13,$00                                   ;91B8D9;

PoseDefinitions_57:
    db $08,$02,$FF,$01,$03,$00,$13,$00                                   ;91B8E1;

PoseDefinitions_58:
    db $04,$02,$FF,$08,$03,$00,$13,$00                                   ;91B8E9;

PoseDefinitions_59:
    db $08,$02,$FF,$03,$03,$00,$13,$00                                   ;91B8F1;

PoseDefinitions_5A:
    db $04,$02,$FF,$06,$03,$00,$13,$00                                   ;91B8F9;

UNUSED_PoseDefinitions_5B_91B901:
    db $08,$16,$FF,$FF,$10,$00,$10,$00                                   ;91B901;

UNUSED_PoseDefinitions_5C_91B909:
    db $04,$16,$FF,$FF,$10,$00,$10,$00                                   ;91B909;

UNUSED_PoseDefinitions_5D_91B911:
    db $08,$0B,$5D,$FF,$10,$00,$10,$00                                   ;91B911;

UNUSED_PoseDefinitions_5E_91B919:
    db $04,$0B,$5E,$FF,$10,$00,$10,$00                                   ;91B919;

UNUSED_PoseDefinitions_5F_91B921:
    db $08,$0B,$5F,$FF,$10,$00,$10,$00                                   ;91B921;

UNUSED_PoseDefinitions_60_91B929:
    db $04,$0B,$60,$FF,$10,$00,$10,$00                                   ;91B929;

UNUSED_PoseDefinitions_61_91B931:
    db $08,$16,$B2,$FF,$10,$00,$10,$00                                   ;91B931;

UNUSED_PoseDefinitions_62_91B939:
    db $04,$16,$B3,$FF,$10,$00,$10,$00                                   ;91B939;

UNUSED_PoseDefinitions_63_91B941:
    db $08,$0D,$FF,$FF,$0C,$00,$0C,$00                                   ;91B941;

UNUSED_PoseDefinitions_64_91B949:
    db $04,$0D,$FF,$FF,$0C,$00,$0C,$00                                   ;91B949;

UNUSED_PoseDefinitions_65_91B951:
    db $08,$0D,$29,$FF,$0C,$00,$0C,$00                                   ;91B951;

UNUSED_PoseDefinitions_66_91B959:
    db $04,$0D,$2A,$FF,$0C,$00,$0C,$00                                   ;91B959;

PoseDefinitions_67:
    db $08,$06,$FF,$02,$08,$00,$13,$00                                   ;91B961;

PoseDefinitions_68:
    db $04,$06,$FF,$07,$08,$00,$13,$00                                   ;91B969;

PoseDefinitions_69:
    db $08,$02,$51,$01,$08,$00,$13,$00                                   ;91B971;

PoseDefinitions_6A:
    db $04,$02,$52,$08,$08,$00,$13,$00                                   ;91B979;

PoseDefinitions_6B:
    db $08,$02,$51,$03,$08,$00,$13,$00                                   ;91B981;

PoseDefinitions_6C:
    db $04,$02,$52,$06,$08,$00,$13,$00                                   ;91B989;

PoseDefinitions_6D:
    db $08,$06,$29,$01,$08,$00,$13,$00                                   ;91B991;

PoseDefinitions_6E:
    db $04,$06,$2A,$08,$08,$00,$13,$00                                   ;91B999;

PoseDefinitions_6F:
    db $08,$06,$29,$03,$08,$00,$13,$00                                   ;91B9A1;

PoseDefinitions_70:
    db $04,$06,$2A,$06,$08,$00,$13,$00                                   ;91B9A9;

PoseDefinitions_71:
    db $08,$05,$27,$01,$00,$00,$10,$00                                   ;91B9B1;

PoseDefinitions_72:
    db $04,$05,$28,$08,$00,$00,$10,$00                                   ;91B9B9;

PoseDefinitions_73:
    db $08,$05,$27,$03,$00,$00,$10,$00                                   ;91B9C1;

PoseDefinitions_74:
    db $04,$05,$28,$06,$00,$00,$10,$00                                   ;91B9C9;

PoseDefinitions_75:
    db $08,$10,$06,$08,$06,$00,$15,$00                                   ;91B9D1;

PoseDefinitions_76:
    db $04,$10,$05,$01,$06,$00,$15,$00                                   ;91B9D9;

PoseDefinitions_77:
    db $08,$10,$08,$06,$06,$00,$15,$00                                   ;91B9E1;

PoseDefinitions_78:
    db $04,$10,$07,$03,$06,$00,$15,$00                                   ;91B9E9;

PoseDefinitions_79:
    db $08,$11,$FF,$FF,$00,$00,$07,$00                                   ;91B9F1;

PoseDefinitions_7A:
    db $04,$11,$FF,$FF,$00,$00,$07,$00                                   ;91B9F9;

PoseDefinitions_7B:
    db $08,$11,$79,$FF,$00,$00,$07,$00                                   ;91BA01;

PoseDefinitions_7C:
    db $04,$11,$7A,$FF,$00,$00,$07,$00                                   ;91BA09;

PoseDefinitions_7D:
    db $08,$13,$FF,$FF,$00,$00,$07,$00                                   ;91BA11;

PoseDefinitions_7E:
    db $04,$13,$FF,$FF,$00,$00,$07,$00                                   ;91BA19;

PoseDefinitions_7F:
    db $08,$12,$FF,$FF,$00,$00,$07,$00                                   ;91BA21;

PoseDefinitions_80:
    db $04,$12,$FF,$FF,$00,$00,$07,$00                                   ;91BA29;

PoseDefinitions_81:
    db $08,$03,$FF,$FF,$00,$00,$0C,$00                                   ;91BA31;

PoseDefinitions_82:
    db $04,$03,$FF,$FF,$00,$00,$0C,$00                                   ;91BA39;

PoseDefinitions_83:
    db $08,$14,$19,$FF,$08,$00,$13,$00                                   ;91BA41;

PoseDefinitions_84:
    db $04,$14,$1A,$FF,$08,$00,$13,$00                                   ;91BA49;

PoseDefinitions_85:
    db $08,$05,$27,$00,$00,$00,$10,$00                                   ;91BA51;

PoseDefinitions_86:
    db $04,$05,$28,$09,$00,$00,$10,$00                                   ;91BA59;

PoseDefinitions_87:
    db $04,$18,$FF,$FB,$08,$00,$13,$00                                   ;91BA61;

PoseDefinitions_88:
    db $08,$18,$FF,$FB,$08,$00,$13,$00                                   ;91BA69;

PoseDefinitions_89:
    db $08,$15,$FF,$02,$06,$00,$15,$00                                   ;91BA71;

PoseDefinitions_8A:
    db $04,$15,$FF,$07,$06,$00,$15,$00                                   ;91BA79;

PoseDefinitions_8B:
    db $04,$0E,$FF,$FA,$06,$00,$15,$00                                   ;91BA81;

PoseDefinitions_8C:
    db $08,$0E,$FF,$FA,$06,$00,$15,$00                                   ;91BA89;

PoseDefinitions_8D:
    db $04,$0E,$FF,$FC,$06,$00,$15,$00                                   ;91BA91;

PoseDefinitions_8E:
    db $08,$0E,$FF,$FC,$06,$00,$15,$00                                   ;91BA99;

PoseDefinitions_8F:
    db $04,$17,$FF,$FA,$08,$00,$13,$00                                   ;91BAA1;

PoseDefinitions_90:
    db $08,$17,$FF,$FA,$08,$00,$13,$00                                   ;91BAA9;

PoseDefinitions_91:
    db $04,$17,$FF,$FC,$08,$00,$13,$00                                   ;91BAB1;

PoseDefinitions_92:
    db $08,$17,$FF,$FC,$08,$00,$13,$00                                   ;91BAB9;

PoseDefinitions_93:
    db $04,$18,$FF,$FA,$08,$00,$13,$00                                   ;91BAC1;

PoseDefinitions_94:
    db $08,$18,$FF,$FA,$08,$00,$13,$00                                   ;91BAC9;

PoseDefinitions_95:
    db $04,$18,$FF,$FC,$08,$00,$13,$00                                   ;91BAD1;

PoseDefinitions_96:
    db $08,$18,$FF,$FC,$08,$00,$13,$00                                   ;91BAD9;

PoseDefinitions_97:
    db $04,$17,$28,$FA,$00,$00,$10,$00                                   ;91BAE1;

PoseDefinitions_98:
    db $08,$17,$28,$FA,$00,$00,$10,$00                                   ;91BAE9;

PoseDefinitions_99:
    db $04,$17,$28,$FC,$00,$00,$10,$00                                   ;91BAF1;

PoseDefinitions_9A:
    db $08,$17,$28,$FC,$00,$00,$10,$00                                   ;91BAF9;

PoseDefinitions_9B:
    db $00,$00,$FF,$FF,$08,$00,$18,$00                                   ;91BB01;

PoseDefinitions_9C:
    db $04,$0E,$FF,$FA,$06,$00,$15,$00                                   ;91BB09;

PoseDefinitions_9D:
    db $08,$0E,$FF,$FA,$06,$00,$15,$00                                   ;91BB11;

PoseDefinitions_9E:
    db $04,$17,$FF,$FA,$08,$00,$13,$00                                   ;91BB19;

PoseDefinitions_9F:
    db $08,$17,$FF,$FA,$08,$00,$13,$00                                   ;91BB21;

PoseDefinitions_A0:
    db $04,$18,$FF,$FA,$08,$00,$13,$00                                   ;91BB29;

PoseDefinitions_A1:
    db $08,$18,$FF,$FA,$08,$00,$13,$00                                   ;91BB31;

PoseDefinitions_A2:
    db $04,$17,$28,$FA,$00,$00,$10,$00                                   ;91BB39;

PoseDefinitions_A3:
    db $08,$17,$28,$FA,$00,$00,$10,$00                                   ;91BB41;

PoseDefinitions_A4:
    db $08,$00,$FF,$02,$03,$00,$15,$00                                   ;91BB49;

PoseDefinitions_A5:
    db $04,$00,$FF,$07,$03,$00,$15,$00                                   ;91BB51;

PoseDefinitions_A6:
    db $08,$00,$FF,$02,$03,$00,$15,$00                                   ;91BB59;

PoseDefinitions_A7:
    db $04,$00,$FF,$07,$03,$00,$15,$00                                   ;91BB61;

UNUSED_PoseDefinitions_A8_91BB69:
    db $08,$16,$01,$02,$06,$00,$15,$00                                   ;91BB69;

UNUSED_PoseDefinitions_A9_91BB71:
    db $04,$16,$02,$07,$06,$00,$15,$00                                   ;91BB71;

UNUSED_PoseDefinitions_AA_91BB79:
    db $08,$16,$07,$03,$06,$00,$15,$00                                   ;91BB79;

UNUSED_PoseDefinitions_AB_91BB81:
    db $04,$16,$08,$06,$06,$00,$15,$00                                   ;91BB81;

UNUSED_PoseDefinitions_AC_91BB89:
    db $08,$16,$67,$02,$08,$00,$13,$00                                   ;91BB89;

UNUSED_PoseDefinitions_AD_91BB91:
    db $04,$16,$68,$07,$08,$00,$13,$00                                   ;91BB91;

UNUSED_PoseDefinitions_AE_91BB99:
    db $08,$16,$2D,$04,$06,$00,$0A,$00                                   ;91BB99;

UNUSED_PoseDefinitions_AF_91BBA1:
    db $04,$16,$2E,$05,$06,$00,$0A,$00                                   ;91BBA1;

UNUSED_PoseDefinitions_B0_91BBA9:
    db $08,$16,$6F,$03,$08,$00,$13,$00                                   ;91BBA9;

UNUSED_PoseDefinitions_B1_91BBB1:
    db $04,$16,$70,$06,$08,$00,$13,$00                                   ;91BBB1;

PoseDefinitions_B2:
    db $08,$16,$B2,$FF,$10,$00,$11,$00                                   ;91BBB9;

PoseDefinitions_B3:
    db $04,$16,$B3,$FF,$10,$00,$11,$00                                   ;91BBC1;

UNUSED_PoseDefinitions_B4_91BBC9:
    db $08,$16,$27,$02,$00,$00,$10,$00                                   ;91BBC9;

UNUSED_PoseDefinitions_B5_91BBD1:
    db $04,$16,$28,$07,$00,$00,$10,$00                                   ;91BBD1;

UNUSED_PoseDefinitions_B6_91BBD9:
    db $08,$16,$27,$03,$00,$00,$10,$00                                   ;91BBD9;

UNUSED_PoseDefinitions_B7_91BBE1:
    db $04,$16,$28,$06,$00,$00,$10,$00                                   ;91BBE1;

PoseDefinitions_B8:
    db $08,$16,$FF,$03,$00,$00,$10,$00                                   ;91BBE9;

PoseDefinitions_B9:
    db $04,$16,$FF,$06,$00,$00,$10,$00                                   ;91BBF1;

PoseDefinitions_BA:
    db $04,$1A,$FF,$07,$06,$00,$15,$00                                   ;91BBF9;

PoseDefinitions_BB:
    db $04,$1A,$BA,$08,$06,$00,$15,$00                                   ;91BC01;

PoseDefinitions_BC:
    db $04,$1A,$BA,$07,$06,$00,$15,$00                                   ;91BC09;

PoseDefinitions_BD:
    db $04,$1A,$BA,$06,$06,$00,$15,$00                                   ;91BC11;

PoseDefinitions_BE:
    db $04,$1A,$BA,$FF,$06,$00,$15,$00                                   ;91BC19;

PoseDefinitions_BF:
    db $04,$0E,$FF,$FB,$06,$00,$15,$00                                   ;91BC21;

PoseDefinitions_C0:
    db $08,$0E,$FF,$FB,$06,$00,$15,$00                                   ;91BC29;

PoseDefinitions_C1:
    db $04,$0E,$FF,$FA,$08,$00,$15,$00                                   ;91BC31;

PoseDefinitions_C2:
    db $08,$0E,$FF,$FA,$08,$00,$15,$00                                   ;91BC39;

PoseDefinitions_C3:
    db $04,$0E,$FF,$FC,$08,$00,$15,$00                                   ;91BC41;

PoseDefinitions_C4:
    db $08,$0E,$FF,$FC,$08,$00,$15,$00                                   ;91BC49;

UNUSED_PoseDefinitions_C5_91BC51:
    db $04,$1A,$FF,$FF,$00,$00,$07,$00                                   ;91BC51;

UNUSED_PoseDefinitions_C6_91BC59:
    db $04,$1A,$FF,$FB,$06,$00,$15,$00                                   ;91BC59;

PoseDefinitions_C7:
    db $08,$1B,$FF,$FF,$08,$00,$13,$00                                   ;91BC61;

PoseDefinitions_C8:
    db $04,$1B,$FF,$FF,$08,$00,$13,$00                                   ;91BC69;

PoseDefinitions_C9:
    db $08,$1B,$FF,$02,$08,$00,$13,$00                                   ;91BC71;

PoseDefinitions_CA:
    db $04,$1B,$FF,$07,$08,$00,$13,$00                                   ;91BC79;

PoseDefinitions_CB:
    db $08,$1B,$FF,$00,$08,$00,$13,$00                                   ;91BC81;

PoseDefinitions_CC:
    db $04,$1B,$FF,$09,$08,$00,$13,$00                                   ;91BC89;

PoseDefinitions_CD:
    db $08,$1B,$FF,$01,$08,$00,$13,$00                                   ;91BC91;

PoseDefinitions_CE:
    db $04,$1B,$FF,$08,$08,$00,$13,$00                                   ;91BC99;

PoseDefinitions_CF:
    db $08,$15,$89,$01,$06,$00,$15,$00                                   ;91BCA1;

PoseDefinitions_D0:
    db $04,$15,$8A,$08,$06,$00,$15,$00                                   ;91BCA9;

PoseDefinitions_D1:
    db $08,$15,$89,$03,$06,$00,$15,$00                                   ;91BCB1;

PoseDefinitions_D2:
    db $04,$15,$8A,$06,$06,$00,$15,$00                                   ;91BCB9;

PoseDefinitions_D3:
    db $08,$1B,$FF,$FF,$06,$00,$15,$00                                   ;91BCC1;

PoseDefinitions_D4:
    db $04,$1B,$FF,$FF,$06,$00,$15,$00                                   ;91BCC9;

PoseDefinitions_D5:
    db $08,$00,$FF,$02,$06,$00,$15,$00                                   ;91BCD1;

PoseDefinitions_D6:
    db $04,$00,$FF,$07,$06,$00,$15,$00                                   ;91BCD9;

PoseDefinitions_D7:
    db $08,$0A,$FF,$02,$06,$00,$15,$00                                   ;91BCE1;

PoseDefinitions_D8:
    db $04,$0A,$FF,$07,$06,$00,$15,$00                                   ;91BCE9;

PoseDefinitions_D9:
    db $08,$05,$FF,$02,$00,$00,$10,$00                                   ;91BCF1;

PoseDefinitions_DA:
    db $04,$05,$FF,$07,$00,$00,$10,$00                                   ;91BCF9;

UNUSED_PoseDefinitions_DB_91BD01:
    db $08,$0F,$FF,$FF,$00,$00,$07,$00                                   ;91BD01;

UNUSED_PoseDefinitions_DC_91BD09:
    db $04,$0F,$FF,$FF,$00,$00,$07,$00                                   ;91BD09;

UNUSED_PoseDefinitions_DD_91BD11:
    db $08,$0F,$FF,$FF,$06,$00,$15,$00                                   ;91BD11;

UNUSED_PoseDefinitions_DE_91BD19:
    db $04,$0F,$FF,$FF,$06,$00,$15,$00                                   ;91BD19;

UNUSED_PoseDefinitions_DF_91BD21:
    db $04,$1A,$FF,$FF,$00,$00,$07,$00                                   ;91BD21;

PoseDefinitions_E0:
    db $08,$00,$FF,$00,$03,$00,$15,$00                                   ;91BD29;

PoseDefinitions_E1:
    db $04,$00,$FF,$09,$03,$00,$15,$00                                   ;91BD31;

PoseDefinitions_E2:
    db $08,$00,$FF,$01,$03,$00,$15,$00                                   ;91BD39;

PoseDefinitions_E3:
    db $04,$00,$FF,$08,$03,$00,$15,$00                                   ;91BD41;

PoseDefinitions_E4:
    db $08,$00,$FF,$03,$03,$00,$15,$00                                   ;91BD49;

PoseDefinitions_E5:
    db $04,$00,$FF,$06,$03,$00,$15,$00                                   ;91BD51;

PoseDefinitions_E6:
    db $08,$00,$FF,$02,$03,$00,$15,$00                                   ;91BD59;

PoseDefinitions_E7:
    db $04,$00,$FF,$07,$03,$00,$15,$00                                   ;91BD61;

PoseDefinitions_E8:
    db $08,$1B,$FF,$FF,$FC,$00,$15,$00                                   ;91BD69;

PoseDefinitions_E9:
    db $04,$1B,$FF,$FF,$FC,$00,$15,$00                                   ;91BD71;

PoseDefinitions_EA:
    db $08,$1B,$FF,$FF,$FC,$00,$15,$00                                   ;91BD79;

PoseDefinitions_EB:
    db $04,$1B,$FF,$FF,$FC,$00,$15,$00                                   ;91BD81;

PoseDefinitions_EC:
    db $08,$1A,$FF,$02,$06,$00,$15,$00                                   ;91BD89;

PoseDefinitions_ED:
    db $08,$1A,$EC,$01,$06,$00,$15,$00                                   ;91BD91;

PoseDefinitions_EE:
    db $08,$1A,$EC,$02,$06,$00,$15,$00                                   ;91BD99;

PoseDefinitionse_EF:
    db $08,$1A,$EC,$03,$06,$00,$15,$00                                   ;91BDA1;

PoseDefinitions_F0:
    db $08,$1A,$EC,$FF,$06,$00,$15,$00                                   ;91BDA9;

PoseDefinitions_F1:
    db $08,$0F,$FF,$00,$08,$00,$10,$00                                   ;91BDB1;

PoseDefinitions_F2:
    db $04,$0F,$FF,$09,$08,$00,$10,$00                                   ;91BDB9;

PoseDefinitions_F3:
    db $08,$0F,$FF,$01,$08,$00,$10,$00                                   ;91BDC1;

PoseDefinitions_F4:
    db $04,$0F,$FF,$08,$08,$00,$10,$00                                   ;91BDC9;

PoseDefinitions_F5:
    db $08,$0F,$FF,$03,$08,$00,$10,$00                                   ;91BDD1;

PoseDefinitions_F6:
    db $04,$0F,$FF,$06,$08,$00,$10,$00                                   ;91BDD9;

PoseDefinitions_F7:
    db $08,$0F,$FF,$00,$03,$00,$15,$00                                   ;91BDE1;

PoseDefinitions_F8:
    db $04,$0F,$FF,$09,$03,$00,$15,$00                                   ;91BDE9;

PoseDefinitions_F9:
    db $08,$0F,$FF,$01,$03,$00,$15,$00                                   ;91BDF1;

PoseDefinitions_FA:
    db $04,$0F,$FF,$08,$03,$00,$15,$00                                   ;91BDF9;

PoseDefinitions_FB:
    db $08,$0F,$FF,$03,$03,$00,$15,$00                                   ;91BE01;

PoseDefinitions_FC:
    db $04,$0F,$FF,$06,$03,$00,$15,$00                                   ;91BE09;

Calc_Xray_HDMADataTable_OffScreen:
    PHP                                                                  ;91BE11;
    PHB                                                                  ;91BE12;
    PHK                                                                  ;91BE13;
    PLB                                                                  ;91BE14;
    REP #$30                                                             ;91BE15;
    TXA                                                                  ;91BE17;
    XBA                                                                  ;91BE18;
    AND.W #$FF00                                                         ;91BE19;
    STA.B $16                                                            ;91BE1C;
    STY.B $18                                                            ;91BE1E;
    LDA.B $12                                                            ;91BE20;
    SEC                                                                  ;91BE22;
    SBC.B $14                                                            ;91BE23;
    STA.B $1A                                                            ;91BE25;
    BPL +                                                                ;91BE27;
    LDA.W #$0100                                                         ;91BE29;
    CLC                                                                  ;91BE2C;
    ADC.B $1A                                                            ;91BE2D;
    STA.B $1A                                                            ;91BE2F;

  + LDA.B $12                                                            ;91BE31;
    CLC                                                                  ;91BE33;
    ADC.B $14                                                            ;91BE34;
    STA.B $1C                                                            ;91BE36;
    CMP.W #$0101                                                         ;91BE38;
    BMI +                                                                ;91BE3B;
    SEC                                                                  ;91BE3D;
    SBC.W #$0100                                                         ;91BE3E;
    STA.B $1C                                                            ;91BE41;

  + LDA.B $14                                                            ;91BE43;
    BNE +                                                                ;91BE45;
    LDA.B $12                                                            ;91BE47;
    CMP.W #$0040                                                         ;91BE49;
    BEQ .strictlyHorizontal                                              ;91BE4C;
    CMP.W #$00C0                                                         ;91BE4E;
    BEQ .strictlyHorizontal                                              ;91BE51;

  + LDA.B $1A                                                            ;91BE53;
    CMP.W #$0080                                                         ;91BE55;
    BPL +                                                                ;91BE58;
    CMP.W #$0040                                                         ;91BE5A;
    BPL .bottomHalf                                                      ;91BE5D;
    LDA.B $1C                                                            ;91BE5F;
    CMP.W #$0040                                                         ;91BE61;
    BMI .topHalf                                                         ;91BE64;
    BRA .right                                                           ;91BE66;


  + CMP.W #$00C0                                                         ;91BE68;
    BPL .topHalf                                                         ;91BE6B;
    LDA.B $1C                                                            ;91BE6D;
    CMP.W #$00C0                                                         ;91BE6F;
    BMI .bottomHalf                                                      ;91BE72;
    BRA .left                                                            ;91BE74;


.right:
    LDY.W #$0000                                                         ;91BE76;
    BRA .merge                                                           ;91BE79;


.topHalf:
    LDY.W #$0002                                                         ;91BE7B;
    BRA .merge                                                           ;91BE7E;


.bottomHalf:
    LDY.W #$0004                                                         ;91BE80;
    BRA .merge                                                           ;91BE83;


.left:
    LDY.W #$0006                                                         ;91BE85;
    BRA .merge                                                           ;91BE88;


.strictlyHorizontal:
    LDY.W #$0008                                                         ;91BE8A;

.merge:
    LDA.B $1A                                                            ;91BE8D;
    CMP.W #$0080                                                         ;91BE8F;
    BMI +                                                                ;91BE92;
    SEC                                                                  ;91BE94;
    SBC.W #$0080                                                         ;91BE95;

  + ASL A                                                                ;91BE98;
    TAX                                                                  ;91BE99;
    LDA.W AbsoluteTangentTable,X                                         ;91BE9A;
    STA.B $1E                                                            ;91BE9D;
    LDA.B $1C                                                            ;91BE9F;
    CMP.W #$0080                                                         ;91BEA1;
    BMI +                                                                ;91BEA4;
    SEC                                                                  ;91BEA6;
    SBC.W #$0080                                                         ;91BEA7;

  + ASL A                                                                ;91BEAA;
    TAX                                                                  ;91BEAB;
    LDA.W AbsoluteTangentTable,X                                         ;91BEAC;
    STA.B $20                                                            ;91BEAF;
    TYX                                                                  ;91BEB1;
    JSR.W (.pointers,X)                                                  ;91BEB2;
    PLB                                                                  ;91BEB5;
    PLP                                                                  ;91BEB6;
    RTL                                                                  ;91BEB7;


.pointers:
    dw Calc_Xray_HDMADataTable_OffScreen_AimedRight                      ;91BEB8;
    dw Calc_Xray_HDMADataTable_OffScreen_AimedUpwards                    ;91BEBA;
    dw Calc_Xray_HDMADataTable_OffScreen_AimedDownwards                  ;91BEBC;
    dw Calc_Xray_HDMADataTable_OffScreen_AimedLeft                       ;91BEBE;
    dw Calc_Xray_HDMADataTable_OffScreen_HorizontalLine                  ;91BEC0;

Calc_Xray_HDMADataTable_OffScreen_AimedRight:
    PHP                                                                  ;91BEC2;
    REP #$30                                                             ;91BEC3;
    LDA.B $18                                                            ;91BEC5;
    DEC A                                                                ;91BEC7;
    ASL A                                                                ;91BEC8;
    TAY                                                                  ;91BEC9;
    LDA.B $16                                                            ;91BECA;
    STA.B $22                                                            ;91BECC;
    STA.B $24                                                            ;91BECE;

.loopLeftOffScreen:
    LDA.B $22                                                            ;91BED0;
    CLC                                                                  ;91BED2;
    ADC.B $1E                                                            ;91BED3;
    STA.B $22                                                            ;91BED5;
    BCS +                                                                ;91BED7;
    DEY                                                                  ;91BED9;
    DEY                                                                  ;91BEDA;
    BPL .loopLeftOffScreen                                               ;91BEDB;
    STZ.B $12                                                            ;91BEDD;
    JMP.W .leftEdgeEnd                                                   ;91BEDF;


  + LDA.B $23                                                            ;91BEE2;
    ORA.W #$FF00                                                         ;91BEE4;
    STA.B [$00],Y                                                        ;91BEE7;
    INY                                                                  ;91BEE9;
    INY                                                                  ;91BEEA;
    STY.B $12                                                            ;91BEEB;
    TYA                                                                  ;91BEED;
    SEC                                                                  ;91BEEE;
    SBC.W #$0004                                                         ;91BEEF;
    TAY                                                                  ;91BEF2;

.loopLeftOnScreen:
    LDA.B $22                                                            ;91BEF3;
    CLC                                                                  ;91BEF5;
    ADC.B $1E                                                            ;91BEF6;
    STA.B $22                                                            ;91BEF8;
    BCS ..loop                                                           ;91BEFA;
    LDA.B $23                                                            ;91BEFC;
    ORA.W #$FF00                                                         ;91BEFE;
    STA.B [$00],Y                                                        ;91BF01;
    DEY                                                                  ;91BF03;
    DEY                                                                  ;91BF04;
    BPL .loopLeftOnScreen                                                ;91BF05;
    BRA .leftEdgeEnd                                                     ;91BF07;


..loop:
    LDA.W #$00FF                                                         ;91BF09;
    STA.B [$00],Y                                                        ;91BF0C;
    DEY                                                                  ;91BF0E;
    DEY                                                                  ;91BF0F;
    BPL ..loop                                                           ;91BF10;

.leftEdgeEnd:
    LDA.B $18                                                            ;91BF12;
    ASL A                                                                ;91BF14;
    TAY                                                                  ;91BF15;

.loopRightOffScreen:
    LDA.B $24                                                            ;91BF16;
    CLC                                                                  ;91BF18;
    ADC.B $20                                                            ;91BF19;
    STA.B $24                                                            ;91BF1B;
    BCS +                                                                ;91BF1D;
    INY                                                                  ;91BF1F;
    INY                                                                  ;91BF20;
    CPY.W #$01CC                                                         ;91BF21;
    BMI .loopRightOffScreen                                              ;91BF24;
    STY.B $14                                                            ;91BF26;
    JMP.W .rightEdgeEnd                                                  ;91BF28;


  + LDA.B $25                                                            ;91BF2B;
    ORA.W #$FF00                                                         ;91BF2D;
    STA.B [$00],Y                                                        ;91BF30;
    DEY                                                                  ;91BF32;
    DEY                                                                  ;91BF33;
    STY.B $14                                                            ;91BF34;
    TYA                                                                  ;91BF36;
    CLC                                                                  ;91BF37;
    ADC.W #$0004                                                         ;91BF38;
    TAY                                                                  ;91BF3B;

.loopRightOnScreen:
    LDA.B $24                                                            ;91BF3C;
    CLC                                                                  ;91BF3E;
    ADC.B $20                                                            ;91BF3F;
    STA.B $24                                                            ;91BF41;
    BCS ..loop                                                           ;91BF43;
    LDA.B $25                                                            ;91BF45;
    ORA.W #$FF00                                                         ;91BF47;
    STA.B [$00],Y                                                        ;91BF4A;
    INY                                                                  ;91BF4C;
    INY                                                                  ;91BF4D;
    CPY.W #$01CC                                                         ;91BF4E;
    BMI .loopRightOnScreen                                               ;91BF51;
    BRA .rightEdgeEnd                                                    ;91BF53;


..loop:
    LDA.W #$00FF                                                         ;91BF55;
    STA.B [$00],Y                                                        ;91BF58;
    INY                                                                  ;91BF5A;
    INY                                                                  ;91BF5B;
    CPY.W #$01CC                                                         ;91BF5C;
    BMI ..loop                                                           ;91BF5F;

.rightEdgeEnd:
    LDY.B $12                                                            ;91BF61;

..loop:
    LDA.W #$FF00                                                         ;91BF63;
    STA.B [$00],Y                                                        ;91BF66;
    INY                                                                  ;91BF68;
    INY                                                                  ;91BF69;
    CPY.B $14                                                            ;91BF6A;
    BMI ..loop                                                           ;91BF6C;
    BEQ ..loop                                                           ;91BF6E;
    PLP                                                                  ;91BF70;
    RTS                                                                  ;91BF71;


Calc_Xray_HDMADataTable_OffScreen_AimedLeft:
    PHP                                                                  ;91BF72;
    REP #$30                                                             ;91BF73;
    LDA.B $18                                                            ;91BF75;
    DEC A                                                                ;91BF77;
    ASL A                                                                ;91BF78;
    TAY                                                                  ;91BF79;
    LDA.B $16                                                            ;91BF7A;
    STA.B $22                                                            ;91BF7C;
    STA.B $24                                                            ;91BF7E;

.loopRightOffScreen:
    LDA.B $24                                                            ;91BF80;
    SEC                                                                  ;91BF82;
    SBC.B $20                                                            ;91BF83;
    STA.B $24                                                            ;91BF85;
    BCC +                                                                ;91BF87;
    DEY                                                                  ;91BF89;
    DEY                                                                  ;91BF8A;
    BPL .loopRightOffScreen                                              ;91BF8B;
    STZ.B $12                                                            ;91BF8D;
    JMP.W .rightEdgeEnd                                                  ;91BF8F;


  + LDA.B $24                                                            ;91BF92;
    AND.W #$FF00                                                         ;91BF94;
    STA.B [$00],Y                                                        ;91BF97;
    INY                                                                  ;91BF99;
    INY                                                                  ;91BF9A;
    STY.B $12                                                            ;91BF9B;
    TYA                                                                  ;91BF9D;
    SEC                                                                  ;91BF9E;
    SBC.W #$0004                                                         ;91BF9F;
    TAY                                                                  ;91BFA2;

.loopRightOnScreen:
    LDA.B $24                                                            ;91BFA3;
    SEC                                                                  ;91BFA5;
    SBC.B $20                                                            ;91BFA6;
    STA.B $24                                                            ;91BFA8;
    BCC ..loop                                                           ;91BFAA;
    LDA.B $24                                                            ;91BFAC;
    AND.W #$FF00                                                         ;91BFAE;
    STA.B [$00],Y                                                        ;91BFB1;
    DEY                                                                  ;91BFB3;
    DEY                                                                  ;91BFB4;
    BPL .loopRightOnScreen                                               ;91BFB5;
    BRA .rightEdgeEnd                                                    ;91BFB7;


..loop:
    LDA.W #$00FF                                                         ;91BFB9;
    STA.B [$00],Y                                                        ;91BFBC;
    DEY                                                                  ;91BFBE;
    DEY                                                                  ;91BFBF;
    BPL ..loop                                                           ;91BFC0;

.rightEdgeEnd:
    LDA.B $18                                                            ;91BFC2;
    ASL A                                                                ;91BFC4;
    TAY                                                                  ;91BFC5;

.loopLeftOffScreen:
    LDA.B $22                                                            ;91BFC6;
    SEC                                                                  ;91BFC8;
    SBC.B $1E                                                            ;91BFC9;
    STA.B $22                                                            ;91BFCB;
    BCC +                                                                ;91BFCD;
    INY                                                                  ;91BFCF;
    INY                                                                  ;91BFD0;
    CPY.W #$01CC                                                         ;91BFD1;
    BMI .loopLeftOffScreen                                               ;91BFD4;
    STY.B $14                                                            ;91BFD6;
    JMP.W .leftEdgeEnd                                                   ;91BFD8;


  + LDA.B $22                                                            ;91BFDB;
    AND.W #$FF00                                                         ;91BFDD;
    STA.B [$00],Y                                                        ;91BFE0;
    DEY                                                                  ;91BFE2;
    DEY                                                                  ;91BFE3;
    STY.B $14                                                            ;91BFE4;
    TYA                                                                  ;91BFE6;
    CLC                                                                  ;91BFE7;
    ADC.W #$0004                                                         ;91BFE8;
    TAY                                                                  ;91BFEB;

.leftOnScreen:
    LDA.B $22                                                            ;91BFEC;
    SEC                                                                  ;91BFEE;
    SBC.B $1E                                                            ;91BFEF;
    STA.B $22                                                            ;91BFF1;
    BCC ..loop                                                           ;91BFF3;
    LDA.B $22                                                            ;91BFF5;
    AND.W #$FF00                                                         ;91BFF7;
    STA.B [$00],Y                                                        ;91BFFA;
    INY                                                                  ;91BFFC;
    INY                                                                  ;91BFFD;
    CPY.W #$01CC                                                         ;91BFFE;
    BMI .leftOnScreen                                                    ;91C001;
    BRA .leftEdgeEnd                                                     ;91C003;


..loop:
    LDA.W #$00FF                                                         ;91C005;
    STA.B [$00],Y                                                        ;91C008;
    INY                                                                  ;91C00A;
    INY                                                                  ;91C00B;
    CPY.W #$01CC                                                         ;91C00C;
    BMI ..loop                                                           ;91C00F;

.leftEdgeEnd:
    LDY.B $12                                                            ;91C011;

.leftHighByteFF:
    LDA.W #$FF00                                                         ;91C013;
    STA.B [$00],Y                                                        ;91C016;
    INY                                                                  ;91C018;
    INY                                                                  ;91C019;
    CPY.B $14                                                            ;91C01A;
    BMI .leftHighByteFF                                                  ;91C01C;
    BEQ .leftHighByteFF                                                  ;91C01E;
    PLP                                                                  ;91C020;
    RTS                                                                  ;91C021;


Calc_Xray_HDMADataTable_OffScreen_AimedUpwards:
    PHP                                                                  ;91C022;
    REP #$30                                                             ;91C023;
    LDA.B $18                                                            ;91C025;
    DEC A                                                                ;91C027;
    ASL A                                                                ;91C028;
    TAY                                                                  ;91C029;
    LDA.B $16                                                            ;91C02A;
    STA.B $22                                                            ;91C02C;
    STA.B $24                                                            ;91C02E;
    LDA.B $1A                                                            ;91C030;
    CMP.W #$00C0                                                         ;91C032;
    BPL +                                                                ;91C035;
    LDX.W #$0000                                                         ;91C037;
    BRA .merge                                                           ;91C03A;


  + LDA.B $1C                                                            ;91C03C;
    CMP.W #$00C0                                                         ;91C03E;
    BPL +                                                                ;91C041;
    LDX.W #$0002                                                         ;91C043;
    BRA .merge                                                           ;91C046;


  + LDX.W #$0004                                                         ;91C048;

.merge:
    LDA.B $18                                                            ;91C04B;
    ASL A                                                                ;91C04D;
    STA.B $1A                                                            ;91C04E;
    JSR.W (.pointers,X)                                                  ;91C050;
    LDY.B $12                                                            ;91C053;

.loop:
    LDA.W #$00FF                                                         ;91C055;
    STA.B [$00],Y                                                        ;91C058;
    INY                                                                  ;91C05A;
    INY                                                                  ;91C05B;
    CPY.W #$01CC                                                         ;91C05C;
    BMI .loop                                                            ;91C05F;
    PLP                                                                  ;91C061;
    RTS                                                                  ;91C062;


.pointers:
    dw Calc_Xray_HDMADataTable_OffScreen_AimedUpwards_UpRight            ;91C063;
    dw Calc_Xray_HDMADataTable_OffScreen_AimedUpwards_Up                 ;91C065;
    dw Calc_Xray_HDMADataTable_OffScreen_AimedUpwards_UpLeft             ;91C067;

Calc_Xray_HDMADataTable_OffScreen_AimedUpwards_UpRight:
    PHP                                                                  ;91C069;
    REP #$30                                                             ;91C06A;
    PHY                                                                  ;91C06C;

.loopLeftOffScreen:
    LDA.B $22                                                            ;91C06D;
    CLC                                                                  ;91C06F;
    ADC.B $1E                                                            ;91C070;
    STA.B $22                                                            ;91C072;
    BCS +                                                                ;91C074;
    DEY                                                                  ;91C076;
    DEY                                                                  ;91C077;
    BPL .loopLeftOffScreen                                               ;91C078;
    STZ.B $12                                                            ;91C07A;
    BRA .leftEdgeEnd                                                     ;91C07C;


  + SEP #$20                                                             ;91C07E;
    LDA.B $23                                                            ;91C080;
    STA.B [$00],Y                                                        ;91C082;
    REP #$20                                                             ;91C084;
    DEY                                                                  ;91C086;
    DEY                                                                  ;91C087;
    BPL +                                                                ;91C088;
    LDA.W #$0002                                                         ;91C08A;
    STA.B $12                                                            ;91C08D;
    BRA .leftEdgeEnd                                                     ;91C08F;


  + TYA                                                                  ;91C091;
    CLC                                                                  ;91C092;
    ADC.W #$0004                                                         ;91C093;
    STA.B $12                                                            ;91C096;

.loopLeftOnScreen:
    LDA.B $22                                                            ;91C098;
    CLC                                                                  ;91C09A;
    ADC.B $1E                                                            ;91C09B;
    STA.B $22                                                            ;91C09D;
    BCS .left8Bit                                                        ;91C09F;
    SEP #$20                                                             ;91C0A1;
    LDA.B $23                                                            ;91C0A3;
    STA.B [$00],Y                                                        ;91C0A5;
    REP #$20                                                             ;91C0A7;
    DEY                                                                  ;91C0A9;
    DEY                                                                  ;91C0AA;
    BPL .loopLeftOnScreen                                                ;91C0AB;
    BRA .leftEdgeEnd                                                     ;91C0AD;


.left8Bit:
    SEP #$20                                                             ;91C0AF;

.loopLeft:
    LDA.B #$FF                                                           ;91C0B1;
    STA.B [$00],Y                                                        ;91C0B3;
    DEY                                                                  ;91C0B5;
    DEY                                                                  ;91C0B6;
    BPL .loopLeft                                                        ;91C0B7;

.leftEdgeEnd:
    REP #$20                                                             ;91C0B9;
    PLY                                                                  ;91C0BB;
    INY                                                                  ;91C0BC;

.loopRightOffScreen:
    LDA.B $24                                                            ;91C0BD;
    CLC                                                                  ;91C0BF;
    ADC.B $20                                                            ;91C0C0;
    STA.B $24                                                            ;91C0C2;
    BCS +                                                                ;91C0C4;
    DEY                                                                  ;91C0C6;
    DEY                                                                  ;91C0C7;
    BPL .loopRightOffScreen                                              ;91C0C8;
    LDA.W #$0001                                                         ;91C0CA;
    STA.B $14                                                            ;91C0CD;
    BRA .rightEdgeEnd                                                    ;91C0CF;


  + SEP #$20                                                             ;91C0D1;
    LDA.B $25                                                            ;91C0D3;
    STA.B [$00],Y                                                        ;91C0D5;
    REP #$20                                                             ;91C0D7;
    DEY                                                                  ;91C0D9;
    DEY                                                                  ;91C0DA;
    BPL +                                                                ;91C0DB;
    LDA.W #$0003                                                         ;91C0DD;
    STA.B $14                                                            ;91C0E0;
    BRA .rightEdgeEnd                                                    ;91C0E2;


  + TYA                                                                  ;91C0E4;
    CLC                                                                  ;91C0E5;
    ADC.W #$0004                                                         ;91C0E6;
    STA.B $14                                                            ;91C0E9;

.loopRightOnScreen:
    LDA.B $24                                                            ;91C0EB;
    CLC                                                                  ;91C0ED;
    ADC.B $20                                                            ;91C0EE;
    STA.B $24                                                            ;91C0F0;
    BCS .right8Bit                                                       ;91C0F2;
    SEP #$20                                                             ;91C0F4;
    LDA.B $25                                                            ;91C0F6;
    STA.B [$00],Y                                                        ;91C0F8;
    REP #$20                                                             ;91C0FA;
    DEY                                                                  ;91C0FC;
    DEY                                                                  ;91C0FD;
    BPL .loopRightOnScreen                                               ;91C0FE;
    BRA .rightEdgeEnd                                                    ;91C100;


.right8Bit:
    SEP #$20                                                             ;91C102;

.loopFF:
    LDA.B #$FF                                                           ;91C104;
    STA.B [$00],Y                                                        ;91C106;
    DEY                                                                  ;91C108;
    DEY                                                                  ;91C109;
    BPL .loopFF                                                          ;91C10A;

.rightEdgeEnd:
    SEP #$20                                                             ;91C10C;
    LDY.B $12                                                            ;91C10E;

.loop00:
    LDA.B #$00                                                           ;91C110;
    STA.B [$00],Y                                                        ;91C112;
    INY                                                                  ;91C114;
    INY                                                                  ;91C115;
    CPY.B $14                                                            ;91C116;
    BMI .loop00                                                          ;91C118;
    REP #$20                                                             ;91C11A;
    LDA.B $14                                                            ;91C11C;
    DEC A                                                                ;91C11E;
    STA.B $12                                                            ;91C11F;
    PLP                                                                  ;91C121;
    RTS                                                                  ;91C122;


Calc_Xray_HDMADataTable_OffScreen_AimedUpwards_Up:
    PHP                                                                  ;91C123;
    REP #$30                                                             ;91C124;
    PHY                                                                  ;91C126;

.loopLeftOffScreen:
    LDA.B $22                                                            ;91C127;
    SEC                                                                  ;91C129;
    SBC.B $1E                                                            ;91C12A;
    STA.B $22                                                            ;91C12C;
    BCC +                                                                ;91C12E;
    DEY                                                                  ;91C130;
    DEY                                                                  ;91C131;
    BPL .loopLeftOffScreen                                               ;91C132;
    STZ.B $12                                                            ;91C134;
    BRA .leftEdgeEnd                                                     ;91C136;


  + SEP #$20                                                             ;91C138;
    LDA.B $23                                                            ;91C13A;
    STA.B [$00],Y                                                        ;91C13C;
    REP #$20                                                             ;91C13E;
    DEY                                                                  ;91C140;
    DEY                                                                  ;91C141;
    BPL +                                                                ;91C142;
    LDA.W #$0002                                                         ;91C144;
    STA.B $12                                                            ;91C147;
    BRA .leftEdgeEnd                                                     ;91C149;


  + TYA                                                                  ;91C14B;
    CLC                                                                  ;91C14C;
    ADC.W #$0004                                                         ;91C14D;
    STA.B $12                                                            ;91C150;

.loopLeftOnScreen:
    LDA.B $22                                                            ;91C152;
    SEC                                                                  ;91C154;
    SBC.B $1E                                                            ;91C155;
    STA.B $22                                                            ;91C157;
    BCC +                                                                ;91C159;
    SEP #$20                                                             ;91C15B;
    LDA.B $23                                                            ;91C15D;
    STA.B [$00],Y                                                        ;91C15F;
    REP #$20                                                             ;91C161;
    DEY                                                                  ;91C163;
    DEY                                                                  ;91C164;
    BPL .loopLeftOnScreen                                                ;91C165;
    BRA .leftEdgeEnd                                                     ;91C167;


  + SEP #$20                                                             ;91C169;

.loopLeft:
    LDA.B #$00                                                           ;91C16B;
    STA.B [$00],Y                                                        ;91C16D;
    DEY                                                                  ;91C16F;
    DEY                                                                  ;91C170;
    BPL .loopLeft                                                        ;91C171;

.leftEdgeEnd:
    REP #$20                                                             ;91C173;
    PLY                                                                  ;91C175;
    INY                                                                  ;91C176;

.loopRightOffScreen:
    LDA.B $24                                                            ;91C177;
    CLC                                                                  ;91C179;
    ADC.B $20                                                            ;91C17A;
    STA.B $24                                                            ;91C17C;
    BCS +                                                                ;91C17E;
    DEY                                                                  ;91C180;
    DEY                                                                  ;91C181;
    BPL .loopRightOffScreen                                              ;91C182;
    LDA.W #$0001                                                         ;91C184;
    STA.B $14                                                            ;91C187;
    BRA .return                                                          ;91C189;


  + SEP #$20                                                             ;91C18B;
    LDA.B $25                                                            ;91C18D;
    STA.B [$00],Y                                                        ;91C18F;
    REP #$20                                                             ;91C191;
    DEY                                                                  ;91C193;
    DEY                                                                  ;91C194;
    BPL +                                                                ;91C195;
    LDA.W #$0003                                                         ;91C197;
    STA.B $14                                                            ;91C19A;
    BRA .return                                                          ;91C19C;


  + TYA                                                                  ;91C19E;
    CLC                                                                  ;91C19F;
    ADC.W #$0004                                                         ;91C1A0;
    STA.B $14                                                            ;91C1A3;

.loopRightOnScreen:
    LDA.B $24                                                            ;91C1A5;
    CLC                                                                  ;91C1A7;
    ADC.B $20                                                            ;91C1A8;
    STA.B $24                                                            ;91C1AA;
    BCS +                                                                ;91C1AC;
    SEP #$20                                                             ;91C1AE;
    LDA.B $25                                                            ;91C1B0;
    STA.B [$00],Y                                                        ;91C1B2;
    REP #$20                                                             ;91C1B4;
    DEY                                                                  ;91C1B6;
    DEY                                                                  ;91C1B7;
    BPL .loopRightOnScreen                                               ;91C1B8;
    BRA .return                                                          ;91C1BA;


  + SEP #$20                                                             ;91C1BC;

.loopRight:
    LDA.B #$FF                                                           ;91C1BE;
    STA.B [$00],Y                                                        ;91C1C0;
    DEY                                                                  ;91C1C2;
    DEY                                                                  ;91C1C3;
    BPL .loopRight                                                       ;91C1C4;

.return:
    REP #$20                                                             ;91C1C6;
    PLP                                                                  ;91C1C8;
    RTS                                                                  ;91C1C9;


Calc_Xray_HDMADataTable_OffScreen_AimedUpwards_UpLeft:
    PHP                                                                  ;91C1CA;
    REP #$30                                                             ;91C1CB;
    PHY                                                                  ;91C1CD;

.loopLeftOffScreen:
    LDA.B $22                                                            ;91C1CE;
    SEC                                                                  ;91C1D0;
    SBC.B $1E                                                            ;91C1D1;
    STA.B $22                                                            ;91C1D3;
    BCC +                                                                ;91C1D5;
    DEY                                                                  ;91C1D7;
    DEY                                                                  ;91C1D8;
    BPL .loopLeftOffScreen                                               ;91C1D9;
    STZ.B $12                                                            ;91C1DB;
    BRA .leftEdgeEnd                                                     ;91C1DD;


  + SEP #$20                                                             ;91C1DF;
    LDA.B $23                                                            ;91C1E1;
    STA.B [$00],Y                                                        ;91C1E3;
    REP #$20                                                             ;91C1E5;
    DEY                                                                  ;91C1E7;
    DEY                                                                  ;91C1E8;
    BPL +                                                                ;91C1E9;
    LDA.W #$0002                                                         ;91C1EB;
    STA.B $12                                                            ;91C1EE;
    BRA .leftEdgeEnd                                                     ;91C1F0;


  + TYA                                                                  ;91C1F2;
    CLC                                                                  ;91C1F3;
    ADC.W #$0004                                                         ;91C1F4;
    STA.B $12                                                            ;91C1F7;

.loopLeftOnScreen:
    LDA.B $22                                                            ;91C1F9;
    SEC                                                                  ;91C1FB;
    SBC.B $1E                                                            ;91C1FC;
    STA.B $22                                                            ;91C1FE;
    BCC +                                                                ;91C200;
    SEP #$20                                                             ;91C202;
    LDA.B $23                                                            ;91C204;
    STA.B [$00],Y                                                        ;91C206;
    REP #$20                                                             ;91C208;
    DEY                                                                  ;91C20A;
    DEY                                                                  ;91C20B;
    BPL .loopLeftOnScreen                                                ;91C20C;
    BRA .leftEdgeEnd                                                     ;91C20E;


  + SEP #$20                                                             ;91C210;

.loopLeft:
    LDA.B #$00                                                           ;91C212;
    STA.B [$00],Y                                                        ;91C214;
    DEY                                                                  ;91C216;
    DEY                                                                  ;91C217;
    BPL .loopLeft                                                        ;91C218;

.leftEdgeEnd:
    REP #$20                                                             ;91C21A;
    PLY                                                                  ;91C21C;
    INY                                                                  ;91C21D;

.loopRightOffScreen:
    LDA.B $24                                                            ;91C21E;
    SEC                                                                  ;91C220;
    SBC.B $20                                                            ;91C221;
    STA.B $24                                                            ;91C223;
    BCC +                                                                ;91C225;
    DEY                                                                  ;91C227;
    DEY                                                                  ;91C228;
    BPL .loopRightOffScreen                                              ;91C229;
    LDA.W #$0001                                                         ;91C22B;
    STA.B $14                                                            ;91C22E;
    BRA .rightEdgeEnd                                                    ;91C230;


  + SEP #$20                                                             ;91C232;
    LDA.B $23                                                            ;91C234;
    STA.B [$00],Y                                                        ;91C236;
    REP #$20                                                             ;91C238;
    DEY                                                                  ;91C23A;
    DEY                                                                  ;91C23B;
    BPL +                                                                ;91C23C;
    LDA.W #$0003                                                         ;91C23E;
    STA.B $14                                                            ;91C241;
    BRA .rightEdgeEnd                                                    ;91C243;


  + TYA                                                                  ;91C245;
    CLC                                                                  ;91C246;
    ADC.W #$0004                                                         ;91C247;
    STA.B $14                                                            ;91C24A;

.loopRightOnScreen:
    LDA.B $24                                                            ;91C24C;
    SEC                                                                  ;91C24E;
    SBC.B $20                                                            ;91C24F;
    STA.B $24                                                            ;91C251;
    BCC +                                                                ;91C253;
    SEP #$20                                                             ;91C255;
    LDA.B $25                                                            ;91C257;
    STA.B [$00],Y                                                        ;91C259;
    REP #$20                                                             ;91C25B;
    DEY                                                                  ;91C25D;
    DEY                                                                  ;91C25E;
    BPL .loopRightOnScreen                                               ;91C25F;
    BRA .rightEdgeEnd                                                    ;91C261;


  + SEP #$20                                                             ;91C263;

.loopRight:
    LDA.B #$00                                                           ;91C265;
    STA.B [$00],Y                                                        ;91C267;
    DEY                                                                  ;91C269;
    DEY                                                                  ;91C26A;
    BPL .loopRight                                                       ;91C26B;

.rightEdgeEnd:
    SEP #$20                                                             ;91C26D;
    LDY.B $14                                                            ;91C26F;

.endLoop:
    LDA.B #$FF                                                           ;91C271;
    STA.B [$00],Y                                                        ;91C273;
    INY                                                                  ;91C275;
    INY                                                                  ;91C276;
    CPY.B $12                                                            ;91C277;
    BMI .endLoop                                                         ;91C279;
    REP #$20                                                             ;91C27B;
    PLP                                                                  ;91C27D;
    RTS                                                                  ;91C27E;


Calc_Xray_HDMADataTable_OffScreen_AimedDownwards:
    PHP                                                                  ;91C27F;
    REP #$30                                                             ;91C280;
    LDA.B $18                                                            ;91C282;
    ASL A                                                                ;91C284;
    TAY                                                                  ;91C285;
    LDA.B $16                                                            ;91C286;
    STA.B $22                                                            ;91C288;
    STA.B $24                                                            ;91C28A;
    LDA.B $1C                                                            ;91C28C;
    CMP.W #$0080                                                         ;91C28E;
    BPL +                                                                ;91C291;
    LDX.W #$0000                                                         ;91C293;
    BRA .merge                                                           ;91C296;


  + LDA.B $1A                                                            ;91C298;
    CMP.W #$0080                                                         ;91C29A;
    BPL .index4                                                          ;91C29D;
    LDX.W #$0002                                                         ;91C29F;
    BRA .merge                                                           ;91C2A2;


.index4:
    LDX.W #$0004                                                         ;91C2A4;

.merge:
    JSR.W (.pointers,X)                                                  ;91C2A7;
    LDY.B $12                                                            ;91C2AA;
    LDA.W #$00FF                                                         ;91C2AC;

.loop:
    STA.B [$00],Y                                                        ;91C2AF;
    DEY                                                                  ;91C2B1;
    DEY                                                                  ;91C2B2;
    BPL .loop                                                            ;91C2B3;
    PLP                                                                  ;91C2B5;
    RTS                                                                  ;91C2B6;


.pointers:
    dw Calc_Xray_HDMADataTable_OffScreen_AimedDownwards_DownRight        ;91C2B7;
    dw Calc_Xray_HDMADataTable_OffScreen_AimedDownwards_Down             ;91C2B9;
    dw Calc_Xray_HDMADataTable_OffScreen_AimedDownwards_DownLeft         ;91C2BB;

Calc_Xray_HDMADataTable_OffScreen_AimedDownwards_DownRight:
    PHP                                                                  ;91C2BD;
    REP #$30                                                             ;91C2BE;
    PHY                                                                  ;91C2C0;

.loopRightOffScreen:
    LDA.B $24                                                            ;91C2C1;
    CLC                                                                  ;91C2C3;
    ADC.B $20                                                            ;91C2C4;
    STA.B $24                                                            ;91C2C6;
    BCS +                                                                ;91C2C8;
    INY                                                                  ;91C2CA;
    INY                                                                  ;91C2CB;
    CPY.W #$01CC                                                         ;91C2CC;
    BMI .loopRightOffScreen                                              ;91C2CF;
    STY.B $12                                                            ;91C2D1;
    BRA .rightEdgeEnd                                                    ;91C2D3;


  + LDA.B $25                                                            ;91C2D5;
    STA.B [$00],Y                                                        ;91C2D7;
    INY                                                                  ;91C2D9;
    INY                                                                  ;91C2DA;
    CPY.W #$01CC                                                         ;91C2DB;
    BMI +                                                                ;91C2DE;
    LDA.W #$01CA                                                         ;91C2E0;
    STA.B $12                                                            ;91C2E3;
    BRA .rightEdgeEnd                                                    ;91C2E5;


  + TYA                                                                  ;91C2E7;
    SEC                                                                  ;91C2E8;
    SBC.W #$0004                                                         ;91C2E9;
    STA.B $12                                                            ;91C2EC;

.loopRightOnScreen:
    LDA.B $24                                                            ;91C2EE;
    CLC                                                                  ;91C2F0;
    ADC.B $20                                                            ;91C2F1;
    STA.B $24                                                            ;91C2F3;
    BCS .loopRight                                                       ;91C2F5;
    LDA.B $25                                                            ;91C2F7;
    STA.B [$00],Y                                                        ;91C2F9;
    INY                                                                  ;91C2FB;
    INY                                                                  ;91C2FC;
    CPY.W #$01CC                                                         ;91C2FD;
    BMI .loopRightOnScreen                                               ;91C300;
    BRA .rightEdgeEnd                                                    ;91C302;


.loopRight:
    LDA.W #$00FF                                                         ;91C304;
    STA.B [$00],Y                                                        ;91C307;
    INY                                                                  ;91C309;
    INY                                                                  ;91C30A;
    CPY.W #$01CC                                                         ;91C30B;
    BMI .loopRight                                                       ;91C30E;

.rightEdgeEnd:
    PLY                                                                  ;91C310;
    INY                                                                  ;91C311;

.loopLeftOffScreen:
    LDA.B $22                                                            ;91C312;
    CLC                                                                  ;91C314;
    ADC.B $1E                                                            ;91C315;
    STA.B $22                                                            ;91C317;
    BCS +                                                                ;91C319;
    INY                                                                  ;91C31B;
    INY                                                                  ;91C31C;
    CPY.W #$01CC                                                         ;91C31D;
    BMI .loopLeftOffScreen                                               ;91C320;
    STY.B $14                                                            ;91C322;
    BRA .leftEdgeEnd                                                     ;91C324;


  + SEP #$20                                                             ;91C326;
    LDA.B $23                                                            ;91C328;
    STA.B [$00],Y                                                        ;91C32A;
    REP #$20                                                             ;91C32C;
    INY                                                                  ;91C32E;
    INY                                                                  ;91C32F;
    CPY.W #$01CC                                                         ;91C330;
    BMI +                                                                ;91C333;
    LDA.W #$01CB                                                         ;91C335;
    STA.B $14                                                            ;91C338;
    BRA .leftEdgeEnd                                                     ;91C33A;


  + TYA                                                                  ;91C33C;
    SEC                                                                  ;91C33D;
    SBC.W #$0004                                                         ;91C33E;
    STA.B $14                                                            ;91C341;

.loopLeftOnScreen:
    LDA.B $22                                                            ;91C343;
    CLC                                                                  ;91C345;
    ADC.B $1E                                                            ;91C346;
    STA.B $22                                                            ;91C348;
    BCS +                                                                ;91C34A;
    SEP #$20                                                             ;91C34C;
    LDA.B $23                                                            ;91C34E;
    STA.B [$00],Y                                                        ;91C350;
    REP #$20                                                             ;91C352;
    INY                                                                  ;91C354;
    INY                                                                  ;91C355;
    CPY.W #$01CC                                                         ;91C356;
    BMI .loopLeftOnScreen                                                ;91C359;
    BRA .leftEdgeEnd                                                     ;91C35B;


  + SEP #$20                                                             ;91C35D;

.loopLeft:
    LDA.B #$FF                                                           ;91C35F;
    STA.B [$00],Y                                                        ;91C361;
    INY                                                                  ;91C363;
    INY                                                                  ;91C364;
    CPY.W #$01CC                                                         ;91C365;
    BMI .loopLeft                                                        ;91C368;

.leftEdgeEnd:
    SEP #$20                                                             ;91C36A;
    LDY.B $12                                                            ;91C36C;

.loopEnd:
    LDA.B #$00                                                           ;91C36E;
    STA.B [$00],Y                                                        ;91C370;
    DEY                                                                  ;91C372;
    DEY                                                                  ;91C373;
    CPY.B $14                                                            ;91C374;
    BPL .loopEnd                                                         ;91C376;
    REP #$20                                                             ;91C378;
    LDA.B $14                                                            ;91C37A;
    DEC A                                                                ;91C37C;
    STA.B $12                                                            ;91C37D;
    PLP                                                                  ;91C37F;
    RTS                                                                  ;91C380;


Calc_Xray_HDMADataTable_OffScreen_AimedDownwards_Down:
    PHP                                                                  ;91C381;
    REP #$30                                                             ;91C382;
    PHY                                                                  ;91C384;
    LDA.B $20                                                            ;91C385;
    BNE .loopRightOffScreen                                              ;91C387;
    STY.B $12                                                            ;91C389;
    LDA.W #$0000                                                         ;91C38B;

.loopClear:
    STA.B [$00],Y                                                        ;91C38E;
    INY                                                                  ;91C390;
    INY                                                                  ;91C391;
    CPY.W #$01CC                                                         ;91C392;
    BMI .loopClear                                                       ;91C395;
    BRA .rightEdgeEnd                                                    ;91C397;


.loopRightOffScreen:
    LDA.B $24                                                            ;91C399;
    SEC                                                                  ;91C39B;
    SBC.B $20                                                            ;91C39C;
    STA.B $24                                                            ;91C39E;
    BCC +                                                                ;91C3A0;
    INY                                                                  ;91C3A2;
    INY                                                                  ;91C3A3;
    CPY.W #$01CC                                                         ;91C3A4;
    BMI .loopRightOffScreen                                              ;91C3A7;
    STY.B $12                                                            ;91C3A9;
    BRA .rightEdgeEnd                                                    ;91C3AB;


  + LDA.B $25                                                            ;91C3AD;
    STA.B [$00],Y                                                        ;91C3AF;
    INY                                                                  ;91C3B1;
    INY                                                                  ;91C3B2;
    CPY.W #$01CC                                                         ;91C3B3;
    BMI +                                                                ;91C3B6;
    LDA.W #$01CA                                                         ;91C3B8;
    STA.B $12                                                            ;91C3BB;
    BRA .rightEdgeEnd                                                    ;91C3BD;


  + TYA                                                                  ;91C3BF;
    SEC                                                                  ;91C3C0;
    SBC.W #$0004                                                         ;91C3C1;
    STA.B $12                                                            ;91C3C4;

.loopRightOnScreen:
    LDA.B $24                                                            ;91C3C6;
    SEC                                                                  ;91C3C8;
    SBC.B $20                                                            ;91C3C9;
    STA.B $24                                                            ;91C3CB;
    BCC ..loop                                                           ;91C3CD;
    LDA.B $25                                                            ;91C3CF;
    STA.B [$00],Y                                                        ;91C3D1;
    INY                                                                  ;91C3D3;
    INY                                                                  ;91C3D4;
    CPY.W #$01CC                                                         ;91C3D5;
    BMI .loopRightOnScreen                                               ;91C3D8;
    BRA .rightEdgeEnd                                                    ;91C3DA;


..loop:
    LDA.W #$0000                                                         ;91C3DC;
    STA.B [$00],Y                                                        ;91C3DF;
    INY                                                                  ;91C3E1;
    INY                                                                  ;91C3E2;
    CPY.W #$01CC                                                         ;91C3E3;
    BMI ..loop                                                           ;91C3E6;

.rightEdgeEnd:
    PLY                                                                  ;91C3E8;
    INY                                                                  ;91C3E9;

.loopLeftOffScreen:
    LDA.B $22                                                            ;91C3EA;
    CLC                                                                  ;91C3EC;
    ADC.B $1E                                                            ;91C3ED;
    STA.B $22                                                            ;91C3EF;
    BCS +                                                                ;91C3F1;
    INY                                                                  ;91C3F3;
    INY                                                                  ;91C3F4;
    CPY.W #$01CC                                                         ;91C3F5;
    BMI .loopLeftOffScreen                                               ;91C3F8;
    STY.B $14                                                            ;91C3FA;
    BRA .return                                                          ;91C3FC;


  + SEP #$20                                                             ;91C3FE;
    LDA.B $23                                                            ;91C400;
    STA.B [$00],Y                                                        ;91C402;
    REP #$20                                                             ;91C404;
    INY                                                                  ;91C406;
    INY                                                                  ;91C407;
    CPY.W #$01CC                                                         ;91C408;
    BMI +                                                                ;91C40B;
    LDA.W #$01CB                                                         ;91C40D;
    STA.B $14                                                            ;91C410;
    BRA .return                                                          ;91C412;


  + TYA                                                                  ;91C414;
    SEC                                                                  ;91C415;
    SBC.W #$0004                                                         ;91C416;
    STA.B $14                                                            ;91C419;

.loopLeftOnScreen:
    LDA.B $22                                                            ;91C41B;
    CLC                                                                  ;91C41D;
    ADC.B $1E                                                            ;91C41E;
    STA.B $22                                                            ;91C420;
    BCS +                                                                ;91C422;
    SEP #$20                                                             ;91C424;
    LDA.B $23                                                            ;91C426;
    STA.B [$00],Y                                                        ;91C428;
    REP #$20                                                             ;91C42A;
    INY                                                                  ;91C42C;
    INY                                                                  ;91C42D;
    CPY.W #$01CC                                                         ;91C42E;
    BMI .loopLeftOnScreen                                                ;91C431;
    BRA .return                                                          ;91C433;


  + SEP #$20                                                             ;91C435;
    LDA.B #$FF                                                           ;91C437;

..loop:
    STA.B [$00],Y                                                        ;91C439;
    INY                                                                  ;91C43B;
    INY                                                                  ;91C43C;
    CPY.W #$01CC                                                         ;91C43D;
    BMI ..loop                                                           ;91C440;
    REP #$20                                                             ;91C442;

.return:
    PLP                                                                  ;91C444;
    RTS                                                                  ;91C445;


Calc_Xray_HDMADataTable_OffScreen_AimedDownwards_DownLeft:
    PHP                                                                  ;91C446;
    REP #$30                                                             ;91C447;
    PHY                                                                  ;91C449;

.loopRightOffScreen:
    LDA.B $24                                                            ;91C44A;
    SEC                                                                  ;91C44C;
    SBC.B $20                                                            ;91C44D;
    STA.B $24                                                            ;91C44F;
    BCC +                                                                ;91C451;
    INY                                                                  ;91C453;
    INY                                                                  ;91C454;
    CPY.W #$01CC                                                         ;91C455;
    BMI .loopRightOffScreen                                              ;91C458;
    STY.B $12                                                            ;91C45A;
    BRA .rightEdgeEnd                                                    ;91C45C;


  + LDA.B $25                                                            ;91C45E;
    STA.B [$00],Y                                                        ;91C460;
    INY                                                                  ;91C462;
    INY                                                                  ;91C463;
    CPY.W #$01CC                                                         ;91C464;
    BMI +                                                                ;91C467;
    LDA.W #$01CA                                                         ;91C469;
    STA.B $12                                                            ;91C46C;
    BRA .rightEdgeEnd                                                    ;91C46E;


  + TYA                                                                  ;91C470;
    SEC                                                                  ;91C471;
    SBC.W #$0004                                                         ;91C472;
    STA.B $12                                                            ;91C475;

.loopRightOnScreen:
    LDA.B $24                                                            ;91C477;
    SEC                                                                  ;91C479;
    SBC.B $20                                                            ;91C47A;
    STA.B $24                                                            ;91C47C;
    BCC .loopRight                                                       ;91C47E;
    LDA.B $25                                                            ;91C480;
    STA.B [$00],Y                                                        ;91C482;
    INY                                                                  ;91C484;
    INY                                                                  ;91C485;
    CPY.W #$01CC                                                         ;91C486;
    BMI .loopRightOnScreen                                               ;91C489;
    BRA .rightEdgeEnd                                                    ;91C48B;


.loopRight:
    LDA.W #$0000                                                         ;91C48D;
    STA.B [$00],Y                                                        ;91C490;
    INY                                                                  ;91C492;
    INY                                                                  ;91C493;
    CPY.W #$01CC                                                         ;91C494;
    BMI .loopRight                                                       ;91C497;

.rightEdgeEnd:
    PLY                                                                  ;91C499;
    INY                                                                  ;91C49A;

.loopLeftOffScreen:
    LDA.B $22                                                            ;91C49B;
    SEC                                                                  ;91C49D;
    SBC.B $1E                                                            ;91C49E;
    STA.B $22                                                            ;91C4A0;
    BCC +                                                                ;91C4A2;
    INY                                                                  ;91C4A4;
    INY                                                                  ;91C4A5;
    CPY.W #$01CC                                                         ;91C4A6;
    BMI .loopLeftOffScreen                                               ;91C4A9;
    STY.B $14                                                            ;91C4AB;
    BRA .leftEdgeEnd                                                     ;91C4AD;


  + SEP #$20                                                             ;91C4AF;
    LDA.B $23                                                            ;91C4B1;
    STA.B [$00],Y                                                        ;91C4B3;
    REP #$20                                                             ;91C4B5;
    INY                                                                  ;91C4B7;
    INY                                                                  ;91C4B8;
    CPY.W #$01CC                                                         ;91C4B9;
    BMI +                                                                ;91C4BC;
    LDA.W #$01CB                                                         ;91C4BE;
    STA.B $14                                                            ;91C4C1;
    BRA .leftEdgeEnd                                                     ;91C4C3;


  + TYA                                                                  ;91C4C5;
    SEC                                                                  ;91C4C6;
    SBC.W #$0004                                                         ;91C4C7;
    STA.B $14                                                            ;91C4CA;

.loopLeftOnScreen:
    LDA.B $22                                                            ;91C4CC;
    SEC                                                                  ;91C4CE;
    SBC.B $1E                                                            ;91C4CF;
    STA.B $22                                                            ;91C4D1;
    BCC +                                                                ;91C4D3;
    SEP #$20                                                             ;91C4D5;
    LDA.B $23                                                            ;91C4D7;
    STA.B [$00],Y                                                        ;91C4D9;
    REP #$20                                                             ;91C4DB;
    INY                                                                  ;91C4DD;
    INY                                                                  ;91C4DE;
    CPY.W #$01CC                                                         ;91C4DF;
    BMI .loopLeftOnScreen                                                ;91C4E2;
    BRA .leftEdgeEnd                                                     ;91C4E4;


  + SEP #$20                                                             ;91C4E6;

.loopLeft:
    LDA.B #$00                                                           ;91C4E8;
    STA.B [$00],Y                                                        ;91C4EA;
    INY                                                                  ;91C4EC;
    INY                                                                  ;91C4ED;
    CPY.W #$01CC                                                         ;91C4EE;
    BMI .loopLeft                                                        ;91C4F1;

.leftEdgeEnd:
    SEP #$20                                                             ;91C4F3;
    LDY.B $14                                                            ;91C4F5;

.loopEnd:
    LDA.B #$FF                                                           ;91C4F7;
    STA.B [$00],Y                                                        ;91C4F9;
    DEY                                                                  ;91C4FB;
    DEY                                                                  ;91C4FC;
    CPY.B $12                                                            ;91C4FD;
    BPL .loopEnd                                                         ;91C4FF;
    REP #$20                                                             ;91C501;
    PLP                                                                  ;91C503;
    RTS                                                                  ;91C504;


Calc_Xray_HDMADataTable_OffScreen_HorizontalLine:
    PHP                                                                  ;91C505;
    REP #$30                                                             ;91C506;
    LDA.B $18                                                            ;91C508;
    DEC A                                                                ;91C50A;
    ASL A                                                                ;91C50B;
    TAY                                                                  ;91C50C;
    LDA.B $12                                                            ;91C50D;
    CMP.W #$0040                                                         ;91C50F;
    BNE +                                                                ;91C512;
    LDA.W #$FF00                                                         ;91C514;
    STA.B [$00],Y                                                        ;91C517;
    BRA .next                                                            ;91C519;


  + LDA.W #$FF00                                                         ;91C51B;
    STA.B [$00],Y                                                        ;91C51E;

.next:
    DEY                                                                  ;91C520;
    DEY                                                                  ;91C521;

.loopTop:
    LDA.B [$00],Y                                                        ;91C522;
    CMP.W #$00FF                                                         ;91C524;
    BEQ .loopBottom                                                      ;91C527;
    LDA.W #$00FF                                                         ;91C529;
    STA.B [$00],Y                                                        ;91C52C;
    DEY                                                                  ;91C52E;
    DEY                                                                  ;91C52F;
    BPL .loopTop                                                         ;91C530;

.loopBottom:
    LDA.B $18                                                            ;91C532;
    ASL A                                                                ;91C534;
    TAY                                                                  ;91C535;

.loop:
    LDA.B [$00],Y                                                        ;91C536;
    CMP.W #$00FF                                                         ;91C538;
    BEQ .return                                                          ;91C53B;
    LDA.W #$00FF                                                         ;91C53D;
    STA.B [$00],Y                                                        ;91C540;
    INY                                                                  ;91C542;
    INY                                                                  ;91C543;
    CPY.W #$01CC                                                         ;91C544;
    BMI .loop                                                            ;91C547;

.return:
    PLP                                                                  ;91C549;
    RTS                                                                  ;91C54A;


Calc_Xray_HDMADataTable_OnScreen:
    PHP                                                                  ;91C54B;
    PHB                                                                  ;91C54C;
    PHK                                                                  ;91C54D;
    PLB                                                                  ;91C54E;
    REP #$30                                                             ;91C54F;
    TXA                                                                  ;91C551;
    XBA                                                                  ;91C552;
    AND.W #$FF00                                                         ;91C553;
    STA.B $16                                                            ;91C556;
    STY.B $18                                                            ;91C558;
    LDA.B $12                                                            ;91C55A;
    SEC                                                                  ;91C55C;
    SBC.B $14                                                            ;91C55D;
    STA.B $1A                                                            ;91C55F;
    BPL +                                                                ;91C561;
    LDA.W #$0100                                                         ;91C563;
    CLC                                                                  ;91C566;
    ADC.B $1A                                                            ;91C567;
    STA.B $1A                                                            ;91C569;

  + LDA.B $12                                                            ;91C56B;
    CLC                                                                  ;91C56D;
    ADC.B $14                                                            ;91C56E;
    STA.B $1C                                                            ;91C570;
    CMP.W #$0101                                                         ;91C572;
    BMI +                                                                ;91C575;
    SEC                                                                  ;91C577;
    SBC.W #$0100                                                         ;91C578;
    STA.B $1C                                                            ;91C57B;

  + LDA.B $14                                                            ;91C57D;
    BNE +                                                                ;91C57F;
    LDA.B $12                                                            ;91C581;
    CMP.W #$0040                                                         ;91C583;
    BEQ .strictlyHorizontal                                              ;91C586;
    CMP.W #$00C0                                                         ;91C588;
    BEQ .strictlyHorizontal                                              ;91C58B;

  + LDA.B $1A                                                            ;91C58D;
    CMP.W #$0080                                                         ;91C58F;
    BPL +                                                                ;91C592;
    CMP.W #$0040                                                         ;91C594;
    BPL .bottomHalf                                                      ;91C597;
    LDA.B $1C                                                            ;91C599;
    CMP.W #$0040                                                         ;91C59B;
    BMI .topHalf                                                         ;91C59E;
    BRA .right                                                           ;91C5A0;


  + CMP.W #$00C0                                                         ;91C5A2;
    BPL .topHalf                                                         ;91C5A5;
    LDA.B $1C                                                            ;91C5A7;
    CMP.W #$00C0                                                         ;91C5A9;
    BMI .bottomHalf                                                      ;91C5AC;
    BRA .left                                                            ;91C5AE;


.right:
    LDY.W #$0000                                                         ;91C5B0;
    BRA .merge                                                           ;91C5B3;


.topHalf:
    LDY.W #$0002                                                         ;91C5B5;
    BRA .merge                                                           ;91C5B8;


.bottomHalf:
    LDY.W #$0004                                                         ;91C5BA;
    BRA .merge                                                           ;91C5BD;


.left:
    LDY.W #$0006                                                         ;91C5BF;
    BRA .merge                                                           ;91C5C2;


.strictlyHorizontal:
    LDY.W #$0008                                                         ;91C5C4;

.merge:
    LDA.B $1A                                                            ;91C5C7;
    CMP.W #$0080                                                         ;91C5C9;
    BMI +                                                                ;91C5CC;
    SEC                                                                  ;91C5CE;
    SBC.W #$0080                                                         ;91C5CF;

  + ASL A                                                                ;91C5D2;
    TAX                                                                  ;91C5D3;
    LDA.W AbsoluteTangentTable,X                                         ;91C5D4;
    STA.B $1E                                                            ;91C5D7;
    LDA.B $1C                                                            ;91C5D9;
    CMP.W #$0080                                                         ;91C5DB;
    BMI +                                                                ;91C5DE;
    SEC                                                                  ;91C5E0;
    SBC.W #$0080                                                         ;91C5E1;

  + ASL A                                                                ;91C5E4;
    TAX                                                                  ;91C5E5;
    LDA.W AbsoluteTangentTable,X                                         ;91C5E6;
    STA.B $20                                                            ;91C5E9;
    TYX                                                                  ;91C5EB;
    STZ.W $0D1E                                                          ;91C5EC;
    JSR.W (.pointers,X)                                                  ;91C5EF;
    PLB                                                                  ;91C5F2;
    PLP                                                                  ;91C5F3;
    RTL                                                                  ;91C5F4;


.pointers:
    dw Calc_Xray_HDMADataTable_OnScreen_AimedRight                       ;91C5F5;
    dw Calc_Xray_HDMADataTable_OnScreen_AimedUpwards                     ;91C5F7;
    dw Calc_Xray_HDMADataTable_OnScreen_AimedDownwards                   ;91C5F9;
    dw Calc_Xray_HDMADataTable_OnScreen_AimedLeft                        ;91C5FB;
    dw Calc_Xray_HDMADataTable_OnScreen_HorizontalLine                   ;91C5FD;

Calc_Xray_HDMADataTable_OnScreen_AimedRight:
    PHP                                                                  ;91C5FF;
    REP #$30                                                             ;91C600;
    LDA.B $18                                                            ;91C602;
    DEC A                                                                ;91C604;
    ASL A                                                                ;91C605;
    TAY                                                                  ;91C606;
    LDA.B $17                                                            ;91C607;
    ORA.W #$FF00                                                         ;91C609;
    STA.B [$00],Y                                                        ;91C60C;
    DEY                                                                  ;91C60E;
    DEY                                                                  ;91C60F;
    LDA.B $16                                                            ;91C610;
    STA.B $22                                                            ;91C612;
    STA.B $24                                                            ;91C614;

.loopLeftOnScreen:
    LDA.B $22                                                            ;91C616;
    CLC                                                                  ;91C618;
    ADC.B $1E                                                            ;91C619;
    STA.B $22                                                            ;91C61B;
    BCS .loopLeft                                                        ;91C61D;
    LDA.B $23                                                            ;91C61F;
    ORA.W #$FF00                                                         ;91C621;
    STA.B [$00],Y                                                        ;91C624;
    DEY                                                                  ;91C626;
    DEY                                                                  ;91C627;
    BPL .loopLeftOnScreen                                                ;91C628;
    BRA .leftEdgeEnd                                                     ;91C62A;


.loopLeft:
    LDA.W #$00FF                                                         ;91C62C;
    STA.B [$00],Y                                                        ;91C62F;
    DEY                                                                  ;91C631;
    DEY                                                                  ;91C632;
    BPL .loopLeft                                                        ;91C633;

.leftEdgeEnd:
    LDA.B $18                                                            ;91C635;
    ASL A                                                                ;91C637;
    TAY                                                                  ;91C638;

.loopRightOnScreen:
    LDA.B $24                                                            ;91C639;
    CLC                                                                  ;91C63B;
    ADC.B $20                                                            ;91C63C;
    STA.B $24                                                            ;91C63E;
    BCS .loopRight                                                       ;91C640;
    LDA.B $25                                                            ;91C642;
    ORA.W #$FF00                                                         ;91C644;
    STA.B [$00],Y                                                        ;91C647;
    INY                                                                  ;91C649;
    INY                                                                  ;91C64A;
    CPY.W #$01CC                                                         ;91C64B;
    BMI .loopRightOnScreen                                               ;91C64E;
    BRA .return                                                          ;91C650;


.loopRight:
    LDA.W #$00FF                                                         ;91C652;
    STA.B [$00],Y                                                        ;91C655;
    INY                                                                  ;91C657;
    INY                                                                  ;91C658;
    CPY.W #$01CC                                                         ;91C659;
    BMI .loopRight                                                       ;91C65C;

.return:
    PLP                                                                  ;91C65E;
    RTS                                                                  ;91C65F;


Calc_Xray_HDMADataTable_OnScreen_AimedLeft:
    PHP                                                                  ;91C660;
    REP #$30                                                             ;91C661;
    LDA.B $18                                                            ;91C663;
    DEC A                                                                ;91C665;
    ASL A                                                                ;91C666;
    TAY                                                                  ;91C667;
    LDA.B $16                                                            ;91C668;
    AND.W #$FF00                                                         ;91C66A;
    STA.B [$00],Y                                                        ;91C66D;
    DEY                                                                  ;91C66F;
    DEY                                                                  ;91C670;
    LDA.B $16                                                            ;91C671;
    STA.B $22                                                            ;91C673;
    STA.B $24                                                            ;91C675;

.loopRightOnScreen:
    LDA.B $24                                                            ;91C677;
    SEC                                                                  ;91C679;
    SBC.B $20                                                            ;91C67A;
    STA.B $24                                                            ;91C67C;
    BCC .loopRight                                                       ;91C67E;
    LDA.B $24                                                            ;91C680;
    AND.W #$FF00                                                         ;91C682;
    STA.B [$00],Y                                                        ;91C685;
    DEY                                                                  ;91C687;
    DEY                                                                  ;91C688;
    BPL .loopRightOnScreen                                               ;91C689;
    BRA .rightEdgeEnd                                                    ;91C68B;


.loopRight:
    LDA.W #$00FF                                                         ;91C68D;
    STA.B [$00],Y                                                        ;91C690;
    DEY                                                                  ;91C692;
    DEY                                                                  ;91C693;
    BPL .loopRight                                                       ;91C694;

.rightEdgeEnd:
    LDA.B $18                                                            ;91C696;
    ASL A                                                                ;91C698;
    TAY                                                                  ;91C699;

.loopLeftOnScreen:
    LDA.B $22                                                            ;91C69A;
    SEC                                                                  ;91C69C;
    SBC.B $1E                                                            ;91C69D;
    STA.B $22                                                            ;91C69F;
    BCC .loopLeft                                                        ;91C6A1;
    LDA.B $22                                                            ;91C6A3;
    AND.W #$FF00                                                         ;91C6A5;
    STA.B [$00],Y                                                        ;91C6A8;
    INY                                                                  ;91C6AA;
    INY                                                                  ;91C6AB;
    CPY.W #$01CC                                                         ;91C6AC;
    BMI .loopLeftOnScreen                                                ;91C6AF;
    BRA .return                                                          ;91C6B1;


.loopLeft:
    LDA.W #$00FF                                                         ;91C6B3;
    STA.B [$00],Y                                                        ;91C6B6;
    INY                                                                  ;91C6B8;
    INY                                                                  ;91C6B9;
    CPY.W #$01CC                                                         ;91C6BA;
    BMI .loopLeft                                                        ;91C6BD;

.return:
    PLP                                                                  ;91C6BF;
    RTS                                                                  ;91C6C0;


Calc_Xray_HDMADataTable_OnScreen_AimedUpwards:
    PHP                                                                  ;91C6C1;
    REP #$30                                                             ;91C6C2;
    LDA.B $18                                                            ;91C6C4;
    DEC A                                                                ;91C6C6;
    ASL A                                                                ;91C6C7;
    TAY                                                                  ;91C6C8;
    SEP #$20                                                             ;91C6C9;
    LDA.B $17                                                            ;91C6CB;
    STA.B [$00],Y                                                        ;91C6CD;
    INY                                                                  ;91C6CF;
    LDA.B $17                                                            ;91C6D0;
    STA.B [$00],Y                                                        ;91C6D2;
    REP #$20                                                             ;91C6D4;
    DEY                                                                  ;91C6D6;
    DEY                                                                  ;91C6D7;
    DEY                                                                  ;91C6D8;
    LDA.B $16                                                            ;91C6D9;
    STA.B $22                                                            ;91C6DB;
    STA.B $24                                                            ;91C6DD;
    LDA.B $1A                                                            ;91C6DF;
    CMP.W #$00C0                                                         ;91C6E1;
    BPL +                                                                ;91C6E4;
    LDX.W #$0000                                                         ;91C6E6;
    BRA .merge                                                           ;91C6E9;


  + LDA.B $1C                                                            ;91C6EB;
    CMP.W #$00C0                                                         ;91C6ED;
    BPL +                                                                ;91C6F0;
    LDX.W #$0002                                                         ;91C6F2;
    BRA .merge                                                           ;91C6F5;


  + LDX.W #$0004                                                         ;91C6F7;

.merge:
    JSR.W (.pointers,X)                                                  ;91C6FA;
    LDA.B $18                                                            ;91C6FD;
    ASL A                                                                ;91C6FF;
    TAY                                                                  ;91C700;

.loop:
    LDA.B [$00],Y                                                        ;91C701;
    CMP.W #$00FF                                                         ;91C703;
    BEQ .return                                                          ;91C706;
    LDA.W #$00FF                                                         ;91C708;
    STA.B [$00],Y                                                        ;91C70B;
    INY                                                                  ;91C70D;
    INY                                                                  ;91C70E;
    CPY.W #$01CC                                                         ;91C70F;
    BMI .loop                                                            ;91C712;

.return:
    PLP                                                                  ;91C714;
    RTS                                                                  ;91C715;


.pointers:
    dw Calc_Xray_HDMADataTable_OnScreen_AimedUpwards_UpRight             ;91C716;
    dw Calc_Xray_HDMADataTable_OnScreen_AimedUpwards_Up                  ;91C718;
    dw Calc_Xray_HDMADataTable_OnScreen_AimedUpwards_UpLeft              ;91C71A;

Calc_Xray_HDMADataTable_OnScreen_AimedUpwards_UpRight:
    PHP                                                                  ;91C71C;
    REP #$30                                                             ;91C71D;
    PHY                                                                  ;91C71F;

.loopLeftOnScreen:
    LDA.B $22                                                            ;91C720;
    CLC                                                                  ;91C722;
    ADC.B $1E                                                            ;91C723;
    STA.B $22                                                            ;91C725;
    BCS +                                                                ;91C727;
    SEP #$20                                                             ;91C729;
    LDA.B $23                                                            ;91C72B;
    STA.B [$00],Y                                                        ;91C72D;
    REP #$20                                                             ;91C72F;
    DEY                                                                  ;91C731;
    DEY                                                                  ;91C732;
    BPL .loopLeftOnScreen                                                ;91C733;
    BRA .leftEdgeEnd                                                     ;91C735;


  + STY.W $0D1E                                                          ;91C737;
    SEP #$20                                                             ;91C73A;
    LDA.B #$FF                                                           ;91C73C;

.loopLeft:
    STA.B [$00],Y                                                        ;91C73E;
    DEY                                                                  ;91C740;
    DEY                                                                  ;91C741;
    BPL .loopLeft                                                        ;91C742;
    REP #$20                                                             ;91C744;

.leftEdgeEnd:
    PLY                                                                  ;91C746;
    INY                                                                  ;91C747;

.loopRightOnScreen:
    LDA.B $24                                                            ;91C748;
    CLC                                                                  ;91C74A;
    ADC.B $20                                                            ;91C74B;
    STA.B $24                                                            ;91C74D;
    BCS +                                                                ;91C74F;
    SEP #$20                                                             ;91C751;
    LDA.B $25                                                            ;91C753;
    STA.B [$00],Y                                                        ;91C755;
    REP #$20                                                             ;91C757;
    DEY                                                                  ;91C759;
    DEY                                                                  ;91C75A;
    BPL .loopRightOnScreen                                               ;91C75B;
    BRA .return                                                          ;91C75D;


  + SEP #$20                                                             ;91C75F;

.loopRight:
    LDA.B #$FF                                                           ;91C761;
    STA.B [$00],Y                                                        ;91C763;
    DEY                                                                  ;91C765;
    DEY                                                                  ;91C766;
    BPL .loopRight                                                       ;91C767;
    REP #$20                                                             ;91C769;
    LDY.W $0D1E                                                          ;91C76B;
    BEQ .return                                                          ;91C76E;
    DEY                                                                  ;91C770;
    DEY                                                                  ;91C771;
    BMI .return                                                          ;91C772;
    LDA.W #$00FF                                                         ;91C774;

.loopEnd:
    STA.B [$00],Y                                                        ;91C777;
    DEY                                                                  ;91C779;
    DEY                                                                  ;91C77A;
    BPL .loopEnd                                                         ;91C77B;

.return:
    PLP                                                                  ;91C77D;
    RTS                                                                  ;91C77E;


Calc_Xray_HDMADataTable_OnScreen_AimedUpwards_Up:
    PHP                                                                  ;91C77F;
    REP #$30                                                             ;91C780;
    PHY                                                                  ;91C782;

.loopLeftOnScreen:
    LDA.B $22                                                            ;91C783;
    SEC                                                                  ;91C785;
    SBC.B $1E                                                            ;91C786;
    STA.B $22                                                            ;91C788;
    BCC +                                                                ;91C78A;
    SEP #$20                                                             ;91C78C;
    LDA.B $23                                                            ;91C78E;
    STA.B [$00],Y                                                        ;91C790;
    REP #$20                                                             ;91C792;
    DEY                                                                  ;91C794;
    DEY                                                                  ;91C795;
    BPL .loopLeftOnScreen                                                ;91C796;
    BRA .leftEdgeEnd                                                     ;91C798;


  + SEP #$20                                                             ;91C79A;

.loopLeft:
    LDA.B #$00                                                           ;91C79C;
    STA.B [$00],Y                                                        ;91C79E;
    DEY                                                                  ;91C7A0;
    DEY                                                                  ;91C7A1;
    BPL .loopLeft                                                        ;91C7A2;
    REP #$20                                                             ;91C7A4;

.leftEdgeEnd:
    PLY                                                                  ;91C7A6;
    INY                                                                  ;91C7A7;

.loopRightOnScreen:
    LDA.B $24                                                            ;91C7A8;
    CLC                                                                  ;91C7AA;
    ADC.B $20                                                            ;91C7AB;
    STA.B $24                                                            ;91C7AD;
    BCS +                                                                ;91C7AF;
    SEP #$20                                                             ;91C7B1;
    LDA.B $25                                                            ;91C7B3;
    STA.B [$00],Y                                                        ;91C7B5;
    REP #$20                                                             ;91C7B7;
    DEY                                                                  ;91C7B9;
    DEY                                                                  ;91C7BA;
    BPL .loopRightOnScreen                                               ;91C7BB;
    BRA .return                                                          ;91C7BD;


  + SEP #$20                                                             ;91C7BF;

.loopRIght:
    LDA.B #$FF                                                           ;91C7C1;
    STA.B [$00],Y                                                        ;91C7C3;
    DEY                                                                  ;91C7C5;
    DEY                                                                  ;91C7C6;
    BPL .loopRIght                                                       ;91C7C7;

.return:
    PLP                                                                  ;91C7C9;
    RTS                                                                  ;91C7CA;


Calc_Xray_HDMADataTable_OnScreen_AimedUpwards_UpLeft:
    PHP                                                                  ;91C7CB;
    REP #$30                                                             ;91C7CC;
    PHY                                                                  ;91C7CE;

.loopLeftOnScreen:
    LDA.B $22                                                            ;91C7CF;
    SEC                                                                  ;91C7D1;
    SBC.B $1E                                                            ;91C7D2;
    STA.B $22                                                            ;91C7D4;
    BCC +                                                                ;91C7D6;
    SEP #$20                                                             ;91C7D8;
    LDA.B $23                                                            ;91C7DA;
    STA.B [$00],Y                                                        ;91C7DC;
    REP #$20                                                             ;91C7DE;
    DEY                                                                  ;91C7E0;
    DEY                                                                  ;91C7E1;
    BPL .loopLeftOnScreen                                                ;91C7E2;
    BRA .leftEdgeEnd                                                     ;91C7E4;


  + SEP #$20                                                             ;91C7E6;
    LDA.B #$00                                                           ;91C7E8;

.loopLeft:
    STA.B [$00],Y                                                        ;91C7EA;
    DEY                                                                  ;91C7EC;
    DEY                                                                  ;91C7ED;
    BPL .loopLeft                                                        ;91C7EE;
    REP #$20                                                             ;91C7F0;

.leftEdgeEnd:
    PLY                                                                  ;91C7F2;
    INY                                                                  ;91C7F3;

.loopRightOnScreen:
    LDA.B $24                                                            ;91C7F4;
    SEC                                                                  ;91C7F6;
    SBC.B $20                                                            ;91C7F7;
    STA.B $24                                                            ;91C7F9;
    BCC +                                                                ;91C7FB;
    SEP #$20                                                             ;91C7FD;
    LDA.B $25                                                            ;91C7FF;
    STA.B [$00],Y                                                        ;91C801;
    REP #$20                                                             ;91C803;
    DEY                                                                  ;91C805;
    DEY                                                                  ;91C806;
    BPL .loopRightOnScreen                                               ;91C807;
    BRA .return                                                          ;91C809;


  + SEP #$20                                                             ;91C80B;
    PHY                                                                  ;91C80D;
    LDA.B #$00                                                           ;91C80E;

.loopRight:
    STA.B [$00],Y                                                        ;91C810;
    DEY                                                                  ;91C812;
    DEY                                                                  ;91C813;
    BPL .loopRight                                                       ;91C814;
    PLY                                                                  ;91C816;
    DEY                                                                  ;91C817;
    LDA.B #$FF                                                           ;91C818;

.loopEnd:
    STA.B [$00],Y                                                        ;91C81A;
    DEY                                                                  ;91C81C;
    DEY                                                                  ;91C81D;
    BPL .loopEnd                                                         ;91C81E;

.return:
    PLP                                                                  ;91C820;
    RTS                                                                  ;91C821;


Calc_Xray_HDMADataTable_OnScreen_AimedDownwards:
    PHP                                                                  ;91C822;
    REP #$30                                                             ;91C823;
    LDA.B $18                                                            ;91C825;
    DEC A                                                                ;91C827;
    ASL A                                                                ;91C828;
    TAY                                                                  ;91C829;
    SEP #$20                                                             ;91C82A;
    LDA.B $17                                                            ;91C82C;
    STA.B [$00],Y                                                        ;91C82E;
    INY                                                                  ;91C830;
    LDA.B $17                                                            ;91C831;
    STA.B [$00],Y                                                        ;91C833;
    REP #$20                                                             ;91C835;
    INY                                                                  ;91C837;
    LDA.B $16                                                            ;91C838;
    STA.B $22                                                            ;91C83A;
    STA.B $24                                                            ;91C83C;
    LDA.B $1C                                                            ;91C83E;
    CMP.W #$0080                                                         ;91C840;
    BPL +                                                                ;91C843;
    LDX.W #$0000                                                         ;91C845;
    BRA .merge                                                           ;91C848;


  + LDA.B $1A                                                            ;91C84A;
    CMP.W #$0080                                                         ;91C84C;
    BPL +                                                                ;91C84F;
    LDX.W #$0002                                                         ;91C851;
    BRA .merge                                                           ;91C854;


  + LDX.W #$0004                                                         ;91C856;

.merge:
    JSR.W (.pointers,X)                                                  ;91C859;
    LDA.B $18                                                            ;91C85C;
    DEC A                                                                ;91C85E;
    DEC A                                                                ;91C85F;
    ASL A                                                                ;91C860;
    TAY                                                                  ;91C861;

.loop:
    LDA.B [$00],Y                                                        ;91C862;
    CMP.W #$00FF                                                         ;91C864;
    BEQ .return                                                          ;91C867;
    LDA.W #$00FF                                                         ;91C869;
    STA.B [$00],Y                                                        ;91C86C;
    DEY                                                                  ;91C86E;
    DEY                                                                  ;91C86F;
    BPL .loop                                                            ;91C870;

.return:
    PLP                                                                  ;91C872;
    RTS                                                                  ;91C873;


.pointers:
    dw Calc_Xray_HDMADataTable_OnScreen_AimedDownwards_DownRight         ;91C874;
    dw Calc_Xray_HDMADataTable_OnScreen_AimedDownwards_Down              ;91C876;
    dw Calc_Xray_HDMADataTable_OnScreen_AimedDownwards_DownLeft          ;91C878;

Calc_Xray_HDMADataTable_OnScreen_AimedDownwards_DownRight:
    PHP                                                                  ;91C87A;
    REP #$30                                                             ;91C87B;
    PHY                                                                  ;91C87D;

.loopRightOnScreen:
    LDA.B $24                                                            ;91C87E;
    CLC                                                                  ;91C880;
    ADC.B $20                                                            ;91C881;
    STA.B $24                                                            ;91C883;
    BCS +                                                                ;91C885;
    LDA.B $25                                                            ;91C887;
    STA.B [$00],Y                                                        ;91C889;
    INY                                                                  ;91C88B;
    INY                                                                  ;91C88C;
    CPY.W #$01CC                                                         ;91C88D;
    BMI .loopRightOnScreen                                               ;91C890;
    BRA .rightEdgeEnd                                                    ;91C892;


  + STY.W $0D1E                                                          ;91C894;
    LDA.W #$00FF                                                         ;91C897;

.loopRight:
    STA.B [$00],Y                                                        ;91C89A;
    INY                                                                  ;91C89C;
    INY                                                                  ;91C89D;
    CPY.W #$01CC                                                         ;91C89E;
    BMI .loopRight                                                       ;91C8A1;

.rightEdgeEnd:
    PLY                                                                  ;91C8A3;
    INY                                                                  ;91C8A4;

.loopLeftOnScreen:
    LDA.B $22                                                            ;91C8A5;
    CLC                                                                  ;91C8A7;
    ADC.B $1E                                                            ;91C8A8;
    STA.B $22                                                            ;91C8AA;
    BCS +                                                                ;91C8AC;
    SEP #$20                                                             ;91C8AE;
    LDA.B $23                                                            ;91C8B0;
    STA.B [$00],Y                                                        ;91C8B2;
    REP #$20                                                             ;91C8B4;
    INY                                                                  ;91C8B6;
    INY                                                                  ;91C8B7;
    CPY.W #$01CC                                                         ;91C8B8;
    BMI .loopLeftOnScreen                                                ;91C8BB;
    BRA .return                                                          ;91C8BD;


  + SEP #$20                                                             ;91C8BF;

.loopLeft:
    LDA.B #$FF                                                           ;91C8C1;
    STA.B [$00],Y                                                        ;91C8C3;
    INY                                                                  ;91C8C5;
    INY                                                                  ;91C8C6;
    CPY.W #$01CC                                                         ;91C8C7;
    BMI .loopLeft                                                        ;91C8CA;
    REP #$20                                                             ;91C8CC;
    LDY.W $0D1E                                                          ;91C8CE;
    BEQ .return                                                          ;91C8D1;
    INY                                                                  ;91C8D3;
    INY                                                                  ;91C8D4;
    CPY.W #$01CC                                                         ;91C8D5;
    BPL .return                                                          ;91C8D8;
    LDA.W #$00FF                                                         ;91C8DA;

.loopEnd:
    STA.B [$00],Y                                                        ;91C8DD;
    INY                                                                  ;91C8DF;
    INY                                                                  ;91C8E0;
    CPY.W #$01CC                                                         ;91C8E1;
    BMI .loopEnd                                                         ;91C8E4;

.return:
    PLP                                                                  ;91C8E6;
    RTS                                                                  ;91C8E7;


Calc_Xray_HDMADataTable_OnScreen_AimedDownwards_Down:
    PHP                                                                  ;91C8E8;
    REP #$30                                                             ;91C8E9;
    PHY                                                                  ;91C8EB;

.loopRightOnScreen:
    LDA.B $24                                                            ;91C8EC;
    SEC                                                                  ;91C8EE;
    SBC.B $20                                                            ;91C8EF;
    STA.B $24                                                            ;91C8F1;
    BCC .loopRight                                                       ;91C8F3;
    LDA.B $25                                                            ;91C8F5;
    STA.B [$00],Y                                                        ;91C8F7;
    INY                                                                  ;91C8F9;
    INY                                                                  ;91C8FA;
    CPY.W #$01CC                                                         ;91C8FB;
    BMI .loopRightOnScreen                                               ;91C8FE;
    BRA .rightEdgeEnd                                                    ;91C900;


.loopRight:
    LDA.W #$0000                                                         ;91C902;
    STA.B [$00],Y                                                        ;91C905;
    INY                                                                  ;91C907;
    INY                                                                  ;91C908;
    CPY.W #$01CC                                                         ;91C909;
    BMI .loopRight                                                       ;91C90C;

.rightEdgeEnd:
    PLY                                                                  ;91C90E;
    INY                                                                  ;91C90F;

.loopLeftOnScreen:
    LDA.B $22                                                            ;91C910;
    CLC                                                                  ;91C912;
    ADC.B $1E                                                            ;91C913;
    STA.B $22                                                            ;91C915;
    BCS +                                                                ;91C917;
    SEP #$20                                                             ;91C919;
    LDA.B $23                                                            ;91C91B;
    STA.B [$00],Y                                                        ;91C91D;
    REP #$20                                                             ;91C91F;
    INY                                                                  ;91C921;
    INY                                                                  ;91C922;
    CPY.W #$01CC                                                         ;91C923;
    BMI .loopLeftOnScreen                                                ;91C926;
    BRA .return                                                          ;91C928;


  + SEP #$20                                                             ;91C92A;

.loopLeft:
    LDA.B #$FF                                                           ;91C92C;
    STA.B [$00],Y                                                        ;91C92E;
    INY                                                                  ;91C930;
    INY                                                                  ;91C931;
    CPY.W #$01CC                                                         ;91C932;
    BMI .loopLeft                                                        ;91C935;

.return:
    PLP                                                                  ;91C937;
    RTS                                                                  ;91C938;


Calc_Xray_HDMADataTable_OnScreen_AimedDownwards_DownLeft:
    PHP                                                                  ;91C939;
    REP #$30                                                             ;91C93A;
    PHY                                                                  ;91C93C;

.loopRightOnScreen:
    LDA.B $24                                                            ;91C93D;
    SEC                                                                  ;91C93F;
    SBC.B $20                                                            ;91C940;
    STA.B $24                                                            ;91C942;
    BCC .loopRight                                                       ;91C944;
    LDA.B $25                                                            ;91C946;
    STA.B [$00],Y                                                        ;91C948;
    INY                                                                  ;91C94A;
    INY                                                                  ;91C94B;
    CPY.W #$01CC                                                         ;91C94C;
    BMI .loopRightOnScreen                                               ;91C94F;
    BRA .rightEdgeEnd                                                    ;91C951;


.loopRight:
    LDA.W #$0000                                                         ;91C953;
    STA.B [$00],Y                                                        ;91C956;
    INY                                                                  ;91C958;
    INY                                                                  ;91C959;
    CPY.W #$01CC                                                         ;91C95A;
    BMI .loopRight                                                       ;91C95D;

.rightEdgeEnd:
    PLY                                                                  ;91C95F;
    INY                                                                  ;91C960;

.loopLeftOnScreen:
    LDA.B $22                                                            ;91C961;
    SEC                                                                  ;91C963;
    SBC.B $1E                                                            ;91C964;
    STA.B $22                                                            ;91C966;
    BCC +                                                                ;91C968;
    SEP #$20                                                             ;91C96A;
    LDA.B $23                                                            ;91C96C;
    STA.B [$00],Y                                                        ;91C96E;
    REP #$20                                                             ;91C970;
    INY                                                                  ;91C972;
    INY                                                                  ;91C973;
    CPY.W #$01CC                                                         ;91C974;
    BMI .loopLeftOnScreen                                                ;91C977;
    BRA .return                                                          ;91C979;


  + SEP #$20                                                             ;91C97B;
    PHY                                                                  ;91C97D;
    LDA.B #$00                                                           ;91C97E;

.loopLeft:
    STA.B [$00],Y                                                        ;91C980;
    INY                                                                  ;91C982;
    INY                                                                  ;91C983;
    CPY.W #$01CC                                                         ;91C984;
    BMI .loopLeft                                                        ;91C987;
    PLY                                                                  ;91C989;
    DEY                                                                  ;91C98A;
    LDA.B #$FF                                                           ;91C98B;

.loopEnd:
    STA.B [$00],Y                                                        ;91C98D;
    INY                                                                  ;91C98F;
    INY                                                                  ;91C990;
    CPY.W #$01CC                                                         ;91C991;
    BMI .loopEnd                                                         ;91C994;

.return:
    PLP                                                                  ;91C996;
    RTS                                                                  ;91C997;


Calc_Xray_HDMADataTable_OnScreen_HorizontalLine:
    PHP                                                                  ;91C998;
    REP #$30                                                             ;91C999;
    LDA.B $18                                                            ;91C99B;
    DEC A                                                                ;91C99D;
    ASL A                                                                ;91C99E;
    TAY                                                                  ;91C99F;
    LDA.B $12                                                            ;91C9A0;
    CMP.W #$0040                                                         ;91C9A2;
    BNE .not40                                                           ;91C9A5;
    LDA.B $17                                                            ;91C9A7;
    ORA.W #$FF00                                                         ;91C9A9;
    STA.B [$00],Y                                                        ;91C9AC;
    BRA +                                                                ;91C9AE;


.not40:
    LDA.B $16                                                            ;91C9B0;
    AND.W #$FF00                                                         ;91C9B2;
    STA.B [$00],Y                                                        ;91C9B5;

  + DEY                                                                  ;91C9B7;
    DEY                                                                  ;91C9B8;
    LDA.W #$00FF                                                         ;91C9B9;

.loopUpper:
    STA.B [$00],Y                                                        ;91C9BC;
    DEY                                                                  ;91C9BE;
    DEY                                                                  ;91C9BF;
    BPL .loopUpper                                                       ;91C9C0;
    LDA.B $18                                                            ;91C9C2;
    ASL A                                                                ;91C9C4;
    TAY                                                                  ;91C9C5;
    LDA.W #$00FF                                                         ;91C9C6;

.loopLower:
    STA.B [$00],Y                                                        ;91C9C9;
    INY                                                                  ;91C9CB;
    INY                                                                  ;91C9CC;
    CPY.W #$01CC                                                         ;91C9CD;
    BMI .loopLower                                                       ;91C9D0;
    PLP                                                                  ;91C9D2;
    RTS                                                                  ;91C9D3;


AbsoluteTangentTable:
    dw $0000,$0006,$000C,$0012,$0019,$001F,$0025,$002C                   ;91C9D4;
    dw $0032,$0039,$0040,$0046,$004D,$0054,$005B,$0062                   ;91C9E4;
    dw $006A,$0071,$0079,$0080,$0088,$0091,$0099,$00A2                   ;91C9F4;
    dw $00AB,$00B4,$00BD,$00C7,$00D2,$00DC,$00E8,$00F3                   ;91CA04;
    dw $0100,$010C,$011A,$0128,$0137,$0148,$0159,$016B                   ;91CA14;
    dw $017F,$0194,$01AB,$01C3,$01DE,$01FC,$021D,$0241                   ;91CA24;
    dw $026A,$0297,$02CB,$0306,$034B,$039D,$03FE,$0474                   ;91CA34;
    dw $0506,$05C3,$06BD,$081B,$0A27,$0D8E,$145A,$28BB                   ;91CA44;
    dw $3C00,$28BB,$145A,$0D8E,$0A27,$081B,$06BD,$05C3                   ;91CA54;
    dw $0506,$0474,$03FE,$039D,$034B,$0306,$02CB,$0297                   ;91CA64;
    dw $026A,$0241,$021D,$01FC,$01DE,$01C3,$01AB,$0194                   ;91CA74;
    dw $017F,$016B,$0159,$0148,$0137,$0128,$011A,$010C                   ;91CA84;
    dw $0100,$00F3,$00E8,$00DC,$00D2,$00C7,$00BD,$00B4                   ;91CA94;
    dw $00AB,$00A2,$0099,$0091,$0088,$0080,$0079,$0071                   ;91CAA4;
    dw $006A,$0062,$005B,$0054,$004D,$0046,$0040,$0039                   ;91CAB4;
    dw $0032,$002C,$0025,$001F,$0019,$0012,$000C,$0006                   ;91CAC4;
    dw $0000                                                             ;91CAD4;

XrayHandler:
    PHP                                                                  ;91CAD6;
    PHB                                                                  ;91CAD7;
    PHK                                                                  ;91CAD8;
    PLB                                                                  ;91CAD9;
    REP #$30                                                             ;91CADA;
    LDA.W $0A78                                                          ;91CADC;
    BNE .return                                                          ;91CADF;
    LDA.B $8B                                                            ;91CAE1;
    BIT.W $09B6                                                          ;91CAE3;
    BEQ .return                                                          ;91CAE6;
    JSL.L XraySetup                                                      ;91CAE8;
    BCC .return                                                          ;91CAEC;
    JSL.L Spawn_HDMAObject                                               ;91CAEE;
    db $41,$28                                                           ;91CAF2;
    dw InstList_HDMAObject_Xray_0                                        ;91CAF4;

.return:
    PLB                                                                  ;91CAF6;
    PLP                                                                  ;91CAF7;
    RTL                                                                  ;91CAF8;


XraySetup_1_FreezeTime_BackupBG2Registers:
    PHP                                                                  ;91CAF9;
    SEP #$30                                                             ;91CAFA;
    LDA.B #$01                                                           ;91CAFC;
    STA.W $0A78                                                          ;91CAFE;
    LDA.B $B5                                                            ;91CB01;
    STA.W $1914,X                                                        ;91CB03;
    LDA.B $B6                                                            ;91CB06;
    STA.W $1915,X                                                        ;91CB08;
    LDA.B $B7                                                            ;91CB0B;
    STA.W $1920,X                                                        ;91CB0D;
    LDA.B $B8                                                            ;91CB10;
    STA.W $1921,X                                                        ;91CB12;
    LDA.B $59                                                            ;91CB15;
    STA.W $192C,X                                                        ;91CB17;
    PLP                                                                  ;91CB1A;
    RTL                                                                  ;91CB1B;


XraySetup_2_ReadBG1Tilemap_2ndScreen:
    PHP                                                                  ;91CB1C;
    REP #$30                                                             ;91CB1D;
    LDX.W $0360                                                          ;91CB1F;
    LDA.B $58                                                            ;91CB22;
    AND.W #$00FC                                                         ;91CB24;
    XBA                                                                  ;91CB27;
    CLC                                                                  ;91CB28;
    ADC.W #$0400                                                         ;91CB29;
    STA.W $0340,X                                                        ;91CB2C;
    LDA.W #$0081                                                         ;91CB2F;
    STA.W $0342,X                                                        ;91CB32;
    LDA.W #$0039                                                         ;91CB35;
    STA.W $0343,X                                                        ;91CB38;
    LDA.W #$6800                                                         ;91CB3B;
    STA.W $0344,X                                                        ;91CB3E;
    LDA.W #$007E                                                         ;91CB41;
    STA.W $0346,X                                                        ;91CB44;
    LDA.W #$0800                                                         ;91CB47;
    STA.W $0347,X                                                        ;91CB4A;
    TXA                                                                  ;91CB4D;
    CLC                                                                  ;91CB4E;
    ADC.W #$0009                                                         ;91CB4F;
    STA.W $0360                                                          ;91CB52;
    PLP                                                                  ;91CB55;
    RTL                                                                  ;91CB56;


XraySetup_3_ReadBG1Tilemap_1stScreen:
    PHP                                                                  ;91CB57;
    REP #$30                                                             ;91CB58;
    LDX.W $0360                                                          ;91CB5A;
    LDA.B $58                                                            ;91CB5D;
    AND.W #$00FC                                                         ;91CB5F;
    XBA                                                                  ;91CB62;
    STA.W $0340,X                                                        ;91CB63;
    LDA.W #$0081                                                         ;91CB66;
    STA.W $0342,X                                                        ;91CB69;
    LDA.W #$0039                                                         ;91CB6C;
    STA.W $0343,X                                                        ;91CB6F;
    LDA.W #$6000                                                         ;91CB72;
    STA.W $0344,X                                                        ;91CB75;
    LDA.W #$007E                                                         ;91CB78;
    STA.W $0346,X                                                        ;91CB7B;
    LDA.W #$0800                                                         ;91CB7E;
    STA.W $0347,X                                                        ;91CB81;
    TXA                                                                  ;91CB84;
    CLC                                                                  ;91CB85;
    ADC.W #$0009                                                         ;91CB86;
    STA.W $0360                                                          ;91CB89;
    PLP                                                                  ;91CB8C;
    RTL                                                                  ;91CB8D;


XraySetup_4_BuildBG2Tilemap_ReadBG2Tilemap_1stScreen:
    PHP                                                                  ;91CB8E;
    REP #$30                                                             ;91CB8F;
    LDA.W $091F                                                          ;91CB91;
    CLC                                                                  ;91CB94;
    ADC.W $0915                                                          ;91CB95;
    AND.W #$00F0                                                         ;91CB98;
    ASL A                                                                ;91CB9B;
    ASL A                                                                ;91CB9C;
    STA.B $18                                                            ;91CB9D;
    LDA.W $091D                                                          ;91CB9F;
    CLC                                                                  ;91CBA2;
    ADC.W $0911                                                          ;91CBA3;
    AND.W #$00F0                                                         ;91CBA6;
    LSR A                                                                ;91CBA9;
    LSR A                                                                ;91CBAA;
    LSR A                                                                ;91CBAB;
    CLC                                                                  ;91CBAC;
    ADC.B $18                                                            ;91CBAD;
    STA.B $18                                                            ;91CBAF;
    LDA.W $091D                                                          ;91CBB1;
    CLC                                                                  ;91CBB4;
    ADC.W $0911                                                          ;91CBB5;
    AND.W #$0100                                                         ;91CBB8;
    ASL A                                                                ;91CBBB;
    ASL A                                                                ;91CBBC;
    CLC                                                                  ;91CBBD;
    ADC.B $18                                                            ;91CBBE;
    STA.B $18                                                            ;91CBC0;
    STZ.B $16                                                            ;91CBC2;
    LDA.W #$0010                                                         ;91CBC4;
    STA.B $14                                                            ;91CBC7;

.loopCopyBG1Row:
    LDA.W #$0010                                                         ;91CBC9;
    STA.B $12                                                            ;91CBCC;
    LDA.B $18                                                            ;91CBCE;
    AND.W #$07E0                                                         ;91CBD0;
    STA.B $1A                                                            ;91CBD3;
    LDA.B $18                                                            ;91CBD5;
    AND.W #$001F                                                         ;91CBD7;
    STA.B $1C                                                            ;91CBDA;
    STZ.B $1E                                                            ;91CBDC;

.loopCopyBG1Column:
    LDA.B $1C                                                            ;91CBDE;
    CLC                                                                  ;91CBE0;
    ADC.B $1E                                                            ;91CBE1;
    CMP.W #$0020                                                         ;91CBE3;
    BMI +                                                                ;91CBE6;
    LDA.B $1A                                                            ;91CBE8;
    CLC                                                                  ;91CBEA;
    ADC.W #$0400                                                         ;91CBEB;
    AND.W #$07E0                                                         ;91CBEE;
    STA.B $1A                                                            ;91CBF1;
    LDA.W #$0000                                                         ;91CBF3;
    STA.B $1C                                                            ;91CBF6;
    STA.B $1E                                                            ;91CBF8;

  + LDA.B $1A                                                            ;91CBFA;
    CLC                                                                  ;91CBFC;
    ADC.B $1C                                                            ;91CBFD;
    ADC.B $1E                                                            ;91CBFF;
    ASL A                                                                ;91CC01;
    TAX                                                                  ;91CC02;
    LDA.L $7E6000,X                                                      ;91CC03;
    PHA                                                                  ;91CC07;
    LDA.L $7E6002,X                                                      ;91CC08;
    PHA                                                                  ;91CC0C;
    LDA.L $7E6040,X                                                      ;91CC0D;
    PHA                                                                  ;91CC11;
    LDA.L $7E6042,X                                                      ;91CC12;
    LDX.B $16                                                            ;91CC16;
    STA.L $7E4042,X                                                      ;91CC18;
    PLA                                                                  ;91CC1C;
    STA.L $7E4040,X                                                      ;91CC1D;
    PLA                                                                  ;91CC21;
    STA.L $7E4002,X                                                      ;91CC22;
    PLA                                                                  ;91CC26;
    STA.L $7E4000,X                                                      ;91CC27;
    LDA.B $16                                                            ;91CC2B;
    CLC                                                                  ;91CC2D;
    ADC.W #$0004                                                         ;91CC2E;
    STA.B $16                                                            ;91CC31;
    LDA.B $1E                                                            ;91CC33;
    ADC.W #$0002                                                         ;91CC35;
    STA.B $1E                                                            ;91CC38;
    DEC.B $12                                                            ;91CC3A;
    BNE .loopCopyBG1Column                                               ;91CC3C;
    JSR.W CopyLastBG1BlockOfRowToXrayBG2Tilemap                          ;91CC3E;
    LDA.B $18                                                            ;91CC41;
    AND.W #$0400                                                         ;91CC43;
    STA.B $20                                                            ;91CC46;
    LDA.B $18                                                            ;91CC48;
    CLC                                                                  ;91CC4A;
    ADC.W #$0040                                                         ;91CC4B;
    AND.W #$03FF                                                         ;91CC4E;
    CLC                                                                  ;91CC51;
    ADC.B $20                                                            ;91CC52;
    STA.B $18                                                            ;91CC54;
    LDA.B $16                                                            ;91CC56;
    CLC                                                                  ;91CC58;
    ADC.W #$0040                                                         ;91CC59;
    STA.B $16                                                            ;91CC5C;
    DEC.B $14                                                            ;91CC5E;
    BEQ +                                                                ;91CC60;
    JMP.W .loopCopyBG1Row                                                ;91CC62;


  + LDA.W $0915                                                          ;91CC65;
    LSR A                                                                ;91CC68;
    LSR A                                                                ;91CC69;
    LSR A                                                                ;91CC6A;
    LSR A                                                                ;91CC6B;
    XBA                                                                  ;91CC6C;
    ORA.W $07A5                                                          ;91CC6D;
    STA.W $4202                                                          ;91CC70;
    LDA.W $0911                                                          ;91CC73;
    LSR A                                                                ;91CC76;
    LSR A                                                                ;91CC77;
    LSR A                                                                ;91CC78;
    LSR A                                                                ;91CC79;
    CLC                                                                  ;91CC7A;
    ADC.W $4216                                                          ;91CC7B;
    STA.B $22                                                            ;91CC7E;
    STZ.B $16                                                            ;91CC80;
    LDA.W #$0010                                                         ;91CC82;
    STA.B $14                                                            ;91CC85;

.loopRevealedRow:
    JSR.W LoadRightHalfOfRevealed2xNBlock                                ;91CC87;
    LDA.W #$0010                                                         ;91CC8A;
    STA.B $12                                                            ;91CC8D;
    LDA.B $22                                                            ;91CC8F;
    STA.B $24                                                            ;91CC91;

.loopRevealedColumn:
    JSR.W LoadRevealedBlock                                              ;91CC93;
    DEC.B $12                                                            ;91CC96;
    BNE .loopRevealedColumn                                              ;91CC98;
    LDA.B $16                                                            ;91CC9A;
    PHA                                                                  ;91CC9C;
    CLC                                                                  ;91CC9D;
    ADC.W #$07C0                                                         ;91CC9E;
    STA.B $16                                                            ;91CCA1;
    JSR.W LoadRevealedBlock                                              ;91CCA3;
    PLA                                                                  ;91CCA6;
    CLC                                                                  ;91CCA7;
    ADC.W #$0040                                                         ;91CCA8;
    STA.B $16                                                            ;91CCAB;
    LDA.B $22                                                            ;91CCAD;
    CLC                                                                  ;91CCAF;
    ADC.W $07A5                                                          ;91CCB0;
    STA.B $22                                                            ;91CCB3;
    DEC.B $14                                                            ;91CCB5;
    BNE .loopRevealedRow                                                 ;91CCB7;
    JSL.L Load_Item_and_Room_Special_Xray_Blocks                         ;91CCB9;
    LDX.W $0360                                                          ;91CCBD;
    LDA.B $59                                                            ;91CCC0;
    AND.W #$00FC                                                         ;91CCC2;
    XBA                                                                  ;91CCC5;
    STA.W $0340,X                                                        ;91CCC6;
    LDA.W #$0081                                                         ;91CCC9;
    STA.W $0342,X                                                        ;91CCCC;
    LDA.W #$0039                                                         ;91CCCF;
    STA.W $0343,X                                                        ;91CCD2;
    LDA.W #$5000                                                         ;91CCD5;
    STA.W $0344,X                                                        ;91CCD8;
    LDA.W #$007E                                                         ;91CCDB;
    STA.W $0346,X                                                        ;91CCDE;
    LDA.W #$0800                                                         ;91CCE1;
    STA.W $0347,X                                                        ;91CCE4;
    TXA                                                                  ;91CCE7;
    CLC                                                                  ;91CCE8;
    ADC.W #$0009                                                         ;91CCE9;
    STA.W $0360                                                          ;91CCEC;
    PLP                                                                  ;91CCEF;
    RTL                                                                  ;91CCF0;


CopyLastBG1BlockOfRowToXrayBG2Tilemap:
    LDA.B $1A                                                            ;91CCF1;
    STA.B $20                                                            ;91CCF3;
    LDA.B $1C                                                            ;91CCF5;
    CLC                                                                  ;91CCF7;
    ADC.B $1E                                                            ;91CCF8;
    CMP.W #$0020                                                         ;91CCFA;
    BMI +                                                                ;91CCFD;
    LDA.B $20                                                            ;91CCFF;
    CLC                                                                  ;91CD01;
    ADC.W #$0400                                                         ;91CD02;
    AND.W #$07E0                                                         ;91CD05;
    STA.B $20                                                            ;91CD08;
    LDA.W #$0000                                                         ;91CD0A;

  + CLC                                                                  ;91CD0D;
    ADC.B $20                                                            ;91CD0E;
    ASL A                                                                ;91CD10;
    TAX                                                                  ;91CD11;
    LDA.L $7E6000,X                                                      ;91CD12;
    PHA                                                                  ;91CD16;
    LDA.L $7E6002,X                                                      ;91CD17;
    PHA                                                                  ;91CD1B;
    LDA.L $7E6040,X                                                      ;91CD1C;
    PHA                                                                  ;91CD20;
    LDA.L $7E6042,X                                                      ;91CD21;
    PHA                                                                  ;91CD25;
    LDA.B $16                                                            ;91CD26;
    CLC                                                                  ;91CD28;
    ADC.W #$07C0                                                         ;91CD29;
    TAX                                                                  ;91CD2C;
    PLA                                                                  ;91CD2D;
    STA.L $7E4042,X                                                      ;91CD2E;
    PLA                                                                  ;91CD32;
    STA.L $7E4040,X                                                      ;91CD33;
    PLA                                                                  ;91CD37;
    STA.L $7E4002,X                                                      ;91CD38;
    PLA                                                                  ;91CD3C;
    STA.L $7E4000,X                                                      ;91CD3D;
    RTS                                                                  ;91CD41;


LoadRightHalfOfRevealed2xNBlock:
    LDX.B $22                                                            ;91CD42;
    DEX                                                                  ;91CD44;
    JSR.W LoadRevealedBlockCommand                                       ;91CD45;
    CMP.W #RevealedBlockCommand_Copy2x1BlockToXrayBG2Tilemap             ;91CD48;
    BEQ .2x1                                                             ;91CD4B;
    CMP.W #RevealedBlockCommand_Copy2x2BlockToXrayBG2Tilemap             ;91CD4D;
    BEQ .2x2                                                             ;91CD50;
    RTS                                                                  ;91CD52;


.2x2:
    PHY                                                                  ;91CD53;
    TYA                                                                  ;91CD54;
    CLC                                                                  ;91CD55;
    ADC.W #$0008                                                         ;91CD56;
    TAY                                                                  ;91CD59;
    LDA.B ($03),Y                                                        ;91CD5A;
    ASL A                                                                ;91CD5C;
    ASL A                                                                ;91CD5D;
    ASL A                                                                ;91CD5E;
    TAX                                                                  ;91CD5F;
    LDA.L $7EA000,X                                                      ;91CD60;
    PHA                                                                  ;91CD64;
    LDA.L $7EA002,X                                                      ;91CD65;
    PHA                                                                  ;91CD69;
    LDA.L $7EA004,X                                                      ;91CD6A;
    PHA                                                                  ;91CD6E;
    LDA.L $7EA006,X                                                      ;91CD6F;
    LDX.B $16                                                            ;91CD73;
    STA.L $7E40C2,X                                                      ;91CD75;
    PLA                                                                  ;91CD79;
    STA.L $7E40C0,X                                                      ;91CD7A;
    PLA                                                                  ;91CD7E;
    STA.L $7E4082,X                                                      ;91CD7F;
    PLA                                                                  ;91CD83;
    STA.L $7E4080,X                                                      ;91CD84;
    PLY                                                                  ;91CD88;

.2x1:
    TYA                                                                  ;91CD89;
    CLC                                                                  ;91CD8A;
    ADC.W #$0004                                                         ;91CD8B;
    TAY                                                                  ;91CD8E;
    LDA.B ($03),Y                                                        ;91CD8F;
    ASL A                                                                ;91CD91;
    ASL A                                                                ;91CD92;
    ASL A                                                                ;91CD93;
    TAX                                                                  ;91CD94;
    LDA.L $7EA000,X                                                      ;91CD95;
    PHA                                                                  ;91CD99;
    LDA.L $7EA002,X                                                      ;91CD9A;
    PHA                                                                  ;91CD9E;
    LDA.L $7EA004,X                                                      ;91CD9F;
    PHA                                                                  ;91CDA3;
    LDA.L $7EA006,X                                                      ;91CDA4;
    LDX.B $16                                                            ;91CDA8;
    STA.L $7E4042,X                                                      ;91CDAA;
    PLA                                                                  ;91CDAE;
    STA.L $7E4040,X                                                      ;91CDAF;
    PLA                                                                  ;91CDB3;
    STA.L $7E4002,X                                                      ;91CDB4;
    PLA                                                                  ;91CDB8;
    STA.L $7E4000,X                                                      ;91CDB9;
    RTS                                                                  ;91CDBD;


LoadRevealedBlock:
    LDX.B $24                                                            ;91CDBE;
    JSR.W LoadRevealedBlockCommand                                       ;91CDC0;
    CMP.W #$FFFF                                                         ;91CDC3;
    BEQ LoadRevealedBlock_Done                                           ;91CDC6;
    JMP.W ($0000)                                                        ;91CDC8;


LoadRevealedBlock_Done:
    LDA.B $16                                                            ;91CDCB;
    CLC                                                                  ;91CDCD;
    ADC.W #$0004                                                         ;91CDCE;
    STA.B $16                                                            ;91CDD1;
    INC.B $24                                                            ;91CDD3;
    RTS                                                                  ;91CDD5;


LoadRevealedBlockCommand:
    LDA.L $7F6402,X                                                      ;91CDD6;
    AND.W #$00FF                                                         ;91CDDA;
    STA.B $26                                                            ;91CDDD;
    TXA                                                                  ;91CDDF;
    ASL A                                                                ;91CDE0;
    TAX                                                                  ;91CDE1;
    LDA.L $7F0002,X                                                      ;91CDE2;
    AND.W #$F000                                                         ;91CDE6;
    STA.B $28                                                            ;91CDE9;
    LDX.W #$0000                                                         ;91CDEB;

.loopBlockType:
    LDA.W RevealedBlockTable_0_blockType,X                               ;91CDEE;
    CMP.W #$FFFF                                                         ;91CDF1;
    BEQ .return                                                          ;91CDF4;
    CMP.B $28                                                            ;91CDF6;
    BEQ +                                                                ;91CDF8;
    INX                                                                  ;91CDFA;
    INX                                                                  ;91CDFB;
    INX                                                                  ;91CDFC;
    INX                                                                  ;91CDFD;
    BRA .loopBlockType                                                   ;91CDFE;


  + LDA.W RevealedBlockTable_0_pointers,X                                ;91CE00;
    STA.B $00                                                            ;91CE03;
    LDY.W #$0000                                                         ;91CE05;

.loopBTS:
    LDA.B ($00),Y                                                        ;91CE08;
    CMP.W #$FFFF                                                         ;91CE0A;
    BEQ .return                                                          ;91CE0D;
    CMP.W #$FF00                                                         ;91CE0F;
    BEQ +                                                                ;91CE12;
    CMP.B $26                                                            ;91CE14;
    BEQ +                                                                ;91CE16;
    INY                                                                  ;91CE18;
    INY                                                                  ;91CE19;
    INY                                                                  ;91CE1A;
    INY                                                                  ;91CE1B;
    BRA .loopBTS                                                         ;91CE1C;


  + INY                                                                  ;91CE1E;
    INY                                                                  ;91CE1F;
    LDA.B ($00),Y                                                        ;91CE20;
    STA.B $03                                                            ;91CE22;
    LDY.W #$0000                                                         ;91CE24;
    LDA.B ($03),Y                                                        ;91CE27;
    STA.B $00                                                            ;91CE29;

.return:
    RTS                                                                  ;91CE2B;


CalculateBlockCoordinates:
    SEP #$20                                                             ;91CE2C;
    LDA.B $24                                                            ;91CE2E;
    STA.W $4204                                                          ;91CE30;
    LDA.B $25                                                            ;91CE33;
    STA.W $4205                                                          ;91CE35;
    LDA.W $07A5                                                          ;91CE38;
    STA.W $4206                                                          ;91CE3B;
    REP #$20                                                             ;91CE3E;
    NOP                                                                  ;91CE40;
    NOP                                                                  ;91CE41;
    NOP                                                                  ;91CE42;
    NOP                                                                  ;91CE43;
    NOP                                                                  ;91CE44;
    NOP                                                                  ;91CE45;
    LDA.W $4214                                                          ;91CE46;
    STA.B $2C                                                            ;91CE49;
    LDA.W $4216                                                          ;91CE4B;
    STA.B $2A                                                            ;91CE4E;
    RTS                                                                  ;91CE50;


GetBlockTypeAndBTS:
    LDA.B $2C                                                            ;91CE51;
    XBA                                                                  ;91CE53;
    ORA.W $07A5                                                          ;91CE54;
    STA.W $4202                                                          ;91CE57;
    NOP                                                                  ;91CE5A;
    NOP                                                                  ;91CE5B;
    LDA.B $2A                                                            ;91CE5C;
    CLC                                                                  ;91CE5E;
    ADC.W $4216                                                          ;91CE5F;
    TAX                                                                  ;91CE62;
    LDA.L $7F6402,X                                                      ;91CE63;
    AND.W #$00FF                                                         ;91CE67;
    STA.B $2E                                                            ;91CE6A;
    TXA                                                                  ;91CE6C;
    ASL A                                                                ;91CE6D;
    TAX                                                                  ;91CE6E;
    LDA.L $7F0002,X                                                      ;91CE6F;
    AND.W #$F000                                                         ;91CE73;
    STA.B $30                                                            ;91CE76;
    RTS                                                                  ;91CE78;


RevealedBlockCommand_VerticalExtension:
    JSR.W CalculateBlockCoordinates                                      ;91CE79;
    LDA.B $28                                                            ;91CE7C;
    STA.B $30                                                            ;91CE7E;
    LDA.B $26                                                            ;91CE80;
    BEQ Copy1x1BlockToXrayBG2TilemapIfScrollPLMTrigger                   ;91CE82;
    BIT.W #$0080                                                         ;91CE84;
    BEQ +                                                                ;91CE87;
    ORA.W #$FF00                                                         ;91CE89;

  + STA.B $2E                                                            ;91CE8C;

RevealedBlockExtensionLoop_Vertical:
    LDA.B $2C                                                            ;91CE8E;
    CLC                                                                  ;91CE90;
    ADC.B $2E                                                            ;91CE91;
    BPL +                                                                ;91CE93;
    LDA.W #$00FF                                                         ;91CE95;
    JSR.W CopyBlockToXrayBG2Tilemap                                      ;91CE98;
    JMP.W LoadRevealedBlock_Done                                         ;91CE9B;


  + STA.B $2C                                                            ;91CE9E;
    JSR.W GetBlockTypeAndBTS                                             ;91CEA0;
    CMP.W #$D000                                                         ;91CEA3;
    BEQ RevealedBlockExtensionLoop_Vertical                              ;91CEA6;
    CMP.W #$5000                                                         ;91CEA8;
    BNE Copy1x1BlockToXrayBG2TilemapIfScrollPLMTrigger                   ;91CEAB;
    LDA.B $2E                                                            ;91CEAD;
    BIT.W #$0080                                                         ;91CEAF;
    BEQ RevealedBlockExtensionLoop_Vertical                              ;91CEB2;
    EOR.W #$FF00                                                         ;91CEB4;
    STA.B $2E                                                            ;91CEB7;
    BRA RevealedBlockExtensionLoop_Horizontal                            ;91CEB9;


RevealedBlockCommand_HorizontalExtension:
    JSR.W CalculateBlockCoordinates                                      ;91CEBB;
    LDA.B $28                                                            ;91CEBE;
    STA.B $30                                                            ;91CEC0;
    LDA.B $26                                                            ;91CEC2;
    BEQ Copy1x1BlockToXrayBG2TilemapIfScrollPLMTrigger                   ;91CEC4;
    BIT.W #$0080                                                         ;91CEC6;
    BEQ +                                                                ;91CEC9;
    ORA.W #$FF00                                                         ;91CECB;

  + STA.B $2E                                                            ;91CECE;

RevealedBlockExtensionLoop_Horizontal:
    LDA.B $2A                                                            ;91CED0;
    CLC                                                                  ;91CED2;
    ADC.B $2E                                                            ;91CED3;
    BPL +                                                                ;91CED5;
    LDA.W #$00FF                                                         ;91CED7;
    JSR.W CopyBlockToXrayBG2Tilemap                                      ;91CEDA;
    JMP.W LoadRevealedBlock_Done                                         ;91CEDD;


  + STA.B $2A                                                            ;91CEE0;
    JSR.W GetBlockTypeAndBTS                                             ;91CEE2;
    CMP.W #$D000                                                         ;91CEE5;
    BEQ RevealedBlockExtensionLoop_Vertical                              ;91CEE8;
    CMP.W #$5000                                                         ;91CEEA;
    BNE Copy1x1BlockToXrayBG2TilemapIfScrollPLMTrigger                   ;91CEED;
    LDA.B $2E                                                            ;91CEEF;
    BIT.W #$0080                                                         ;91CEF1;
    BEQ RevealedBlockExtensionLoop_Horizontal                            ;91CEF4;
    EOR.W #$FF00                                                         ;91CEF6;
    STA.B $2E                                                            ;91CEF9;
    BRA RevealedBlockExtensionLoop_Horizontal                            ;91CEFB;


Copy1x1BlockToXrayBG2TilemapIfScrollPLMTrigger:
    LDA.W RevealedBlockTable_1_blockType                                 ;91CEFD;
    CMP.B $30                                                            ;91CF00;
    BNE .gotoDone                                                        ;91CF02;
    LDA.W RevealedBlockTable_1_pointers                                  ;91CF04;
    STA.B $00                                                            ;91CF07;
    LDY.W #$0000                                                         ;91CF09;

.loop:
    LDA.B ($00),Y                                                        ;91CF0C;
    CMP.W #$FFFF                                                         ;91CF0E;
    BEQ .gotoDone                                                        ;91CF11;
    CMP.W #$FF00                                                         ;91CF13;
    BEQ +                                                                ;91CF16;
    CMP.B $2E                                                            ;91CF18;
    BEQ +                                                                ;91CF1A;
    INY                                                                  ;91CF1C;
    INY                                                                  ;91CF1D;
    INY                                                                  ;91CF1E;
    INY                                                                  ;91CF1F;
    BRA .loop                                                            ;91CF20;


  + INY                                                                  ;91CF22;
    INY                                                                  ;91CF23;
    LDA.B ($00),Y                                                        ;91CF24;
    INC A                                                                ;91CF26;
    INC A                                                                ;91CF27;
    STA.B $03                                                            ;91CF28;
    LDY.W #$0000                                                         ;91CF2A;
    JSR.W CopyRevealedBlockCommandArgumentToXrayBG2Tilemap               ;91CF2D;
    JMP.W LoadRevealedBlock_Done                                         ;91CF30;


.gotoDone:
    JMP.W LoadRevealedBlock_Done                                         ;91CF33;


RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap:
    INY                                                                  ;91CF36;
    INY                                                                  ;91CF37;
    JSR.W CopyRevealedBlockCommandArgumentToXrayBG2Tilemap               ;91CF38;
    JMP.W LoadRevealedBlock_Done                                         ;91CF3B;


RevealedBlockCommand_Copy1x1BlockToXrayBG2TilemapIfBrinstar:
    INY                                                                  ;91CF3E;
    INY                                                                  ;91CF3F;
    LDA.W $079F                                                          ;91CF40;
    CMP.W #$0001                                                         ;91CF43;
    BNE .gotoDone                                                        ;91CF46;
    JSR.W CopyRevealedBlockCommandArgumentToXrayBG2Tilemap               ;91CF48;

.gotoDone:
    JMP.W LoadRevealedBlock_Done                                         ;91CF4B;


RevealedBlockCommand_Copy2x1BlockToXrayBG2Tilemap:
    INY                                                                  ;91CF4E;
    INY                                                                  ;91CF4F;
    JSR.W CopyRevealedBlockCommandArgumentToXrayBG2Tilemap               ;91CF50;
    LDA.B $12                                                            ;91CF53;
    CMP.W #$0001                                                         ;91CF55;
    BEQ .gotoDone                                                        ;91CF58;
    INY                                                                  ;91CF5A;
    INY                                                                  ;91CF5B;
    JSR.W CopyRevealedBlockCommandArgumentToXrayBG2Tilemap_1BlockRight   ;91CF5C;

.gotoDone:
    JMP.W LoadRevealedBlock_Done                                         ;91CF5F;


RevealedBlockCommand_Copy1x2BlockToXrayBG2Tilemap:
    INY                                                                  ;91CF62;
    INY                                                                  ;91CF63;
    JSR.W CopyRevealedBlockCommandArgumentToXrayBG2Tilemap               ;91CF64;
    INY                                                                  ;91CF67;
    INY                                                                  ;91CF68;
    JSR.W CopyRevealedBlockCommandArgumentToXrayBG2Tilemap_1BlockDown    ;91CF69;
    JMP.W LoadRevealedBlock_Done                                         ;91CF6C;


RevealedBlockCommand_Copy2x2BlockToXrayBG2Tilemap:
    INY                                                                  ;91CF6F;
    INY                                                                  ;91CF70;
    JSR.W CopyRevealedBlockCommandArgumentToXrayBG2Tilemap               ;91CF71;
    INY                                                                  ;91CF74;
    INY                                                                  ;91CF75;
    LDA.B $12                                                            ;91CF76;
    CMP.W #$0001                                                         ;91CF78;
    BEQ +                                                                ;91CF7B;
    JSR.W CopyRevealedBlockCommandArgumentToXrayBG2Tilemap_1BlockRight   ;91CF7D;

  + INY                                                                  ;91CF80;
    INY                                                                  ;91CF81;
    JSR.W CopyRevealedBlockCommandArgumentToXrayBG2Tilemap_1BlockDown    ;91CF82;
    INY                                                                  ;91CF85;
    INY                                                                  ;91CF86;
    LDA.B $12                                                            ;91CF87;
    CMP.W #$0001                                                         ;91CF89;
    BEQ .gotoDone                                                        ;91CF8C;
    LDA.B ($03),Y                                                        ;91CF8E;
    ASL A                                                                ;91CF90;
    ASL A                                                                ;91CF91;
    ASL A                                                                ;91CF92;
    TAX                                                                  ;91CF93;
    LDA.L $7EA000,X                                                      ;91CF94;
    PHA                                                                  ;91CF98;
    LDA.L $7EA002,X                                                      ;91CF99;
    PHA                                                                  ;91CF9D;
    LDA.L $7EA004,X                                                      ;91CF9E;
    PHA                                                                  ;91CFA2;
    LDA.L $7EA006,X                                                      ;91CFA3;
    LDX.B $16                                                            ;91CFA7;
    STA.L $7E40C6,X                                                      ;91CFA9;
    PLA                                                                  ;91CFAD;
    STA.L $7E40C4,X                                                      ;91CFAE;
    PLA                                                                  ;91CFB2;
    STA.L $7E4086,X                                                      ;91CFB3;
    PLA                                                                  ;91CFB7;
    STA.L $7E4084,X                                                      ;91CFB8;

.gotoDone:
    JMP.W LoadRevealedBlock_Done                                         ;91CFBC;


CopyRevealedBlockCommandArgumentToXrayBG2Tilemap:
    LDA.B ($03),Y                                                        ;91CFBF;

CopyBlockToXrayBG2Tilemap:
    ASL A                                                                ;91CFC1;
    ASL A                                                                ;91CFC2;
    ASL A                                                                ;91CFC3;
    TAX                                                                  ;91CFC4;
    LDA.L $7EA000,X                                                      ;91CFC5;
    PHA                                                                  ;91CFC9;
    LDA.L $7EA002,X                                                      ;91CFCA;
    PHA                                                                  ;91CFCE;
    LDA.L $7EA004,X                                                      ;91CFCF;
    PHA                                                                  ;91CFD3;
    LDA.L $7EA006,X                                                      ;91CFD4;
    LDX.B $16                                                            ;91CFD8;
    STA.L $7E4042,X                                                      ;91CFDA;
    PLA                                                                  ;91CFDE;
    STA.L $7E4040,X                                                      ;91CFDF;
    PLA                                                                  ;91CFE3;
    STA.L $7E4002,X                                                      ;91CFE4;
    PLA                                                                  ;91CFE8;
    STA.L $7E4000,X                                                      ;91CFE9;
    RTS                                                                  ;91CFED;


CopyRevealedBlockCommandArgumentToXrayBG2Tilemap_1BlockRight:
    LDA.B ($03),Y                                                        ;91CFEE;
    ASL A                                                                ;91CFF0;
    ASL A                                                                ;91CFF1;
    ASL A                                                                ;91CFF2;
    TAX                                                                  ;91CFF3;
    LDA.L $7EA000,X                                                      ;91CFF4;
    PHA                                                                  ;91CFF8;
    LDA.L $7EA002,X                                                      ;91CFF9;
    PHA                                                                  ;91CFFD;
    LDA.L $7EA004,X                                                      ;91CFFE;
    PHA                                                                  ;91D002;
    LDA.L $7EA006,X                                                      ;91D003;
    LDX.B $16                                                            ;91D007;
    STA.L $7E4046,X                                                      ;91D009;
    PLA                                                                  ;91D00D;
    STA.L $7E4044,X                                                      ;91D00E;
    PLA                                                                  ;91D012;
    STA.L $7E4006,X                                                      ;91D013;
    PLA                                                                  ;91D017;
    STA.L $7E4004,X                                                      ;91D018;
    RTS                                                                  ;91D01C;


CopyRevealedBlockCommandArgumentToXrayBG2Tilemap_1BlockDown:
    LDA.B ($03),Y                                                        ;91D01D;
    ASL A                                                                ;91D01F;
    ASL A                                                                ;91D020;
    ASL A                                                                ;91D021;
    TAX                                                                  ;91D022;
    LDA.L $7EA000,X                                                      ;91D023;
    PHA                                                                  ;91D027;
    LDA.L $7EA002,X                                                      ;91D028;
    PHA                                                                  ;91D02C;
    LDA.L $7EA004,X                                                      ;91D02D;
    PHA                                                                  ;91D031;
    LDA.L $7EA006,X                                                      ;91D032;
    LDX.B $16                                                            ;91D036;
    STA.L $7E40C2,X                                                      ;91D038;
    PLA                                                                  ;91D03C;
    STA.L $7E40C0,X                                                      ;91D03D;
    PLA                                                                  ;91D041;
    STA.L $7E4082,X                                                      ;91D042;
    PLA                                                                  ;91D046;
    STA.L $7E4080,X                                                      ;91D047;
    RTS                                                                  ;91D04B;


LoadBlockToXrayBG2Tilemap:
    PHP                                                                  ;91D04C;
    PHX                                                                  ;91D04D;
    PHY                                                                  ;91D04E;
    REP #$30                                                             ;91D04F;
    STA.B $28                                                            ;91D051;
    LDA.W $0911                                                          ;91D053;
    LSR A                                                                ;91D056;
    LSR A                                                                ;91D057;
    LSR A                                                                ;91D058;
    LSR A                                                                ;91D059;
    STA.B $18                                                            ;91D05A;
    TXA                                                                  ;91D05C;
    SEC                                                                  ;91D05D;
    SBC.B $18                                                            ;91D05E;
    BMI .return                                                          ;91D060;
    STA.B $18                                                            ;91D062;
    SBC.W #$0010                                                         ;91D064;
    BPL .return                                                          ;91D067;
    LDA.W $0915                                                          ;91D069;
    LSR A                                                                ;91D06C;
    LSR A                                                                ;91D06D;
    LSR A                                                                ;91D06E;
    LSR A                                                                ;91D06F;
    STA.B $1A                                                            ;91D070;
    TYA                                                                  ;91D072;
    SEC                                                                  ;91D073;
    SBC.B $1A                                                            ;91D074;
    BMI .return                                                          ;91D076;
    STA.B $1A                                                            ;91D078;
    SBC.W #$0010                                                         ;91D07A;
    BPL .return                                                          ;91D07D;
    LDA.B $1A                                                            ;91D07F;
    ASL A                                                                ;91D081;
    ASL A                                                                ;91D082;
    ASL A                                                                ;91D083;
    ASL A                                                                ;91D084;
    ASL A                                                                ;91D085;
    CLC                                                                  ;91D086;
    ADC.B $18                                                            ;91D087;
    ASL A                                                                ;91D089;
    ASL A                                                                ;91D08A;
    STA.B $16                                                            ;91D08B;
    LDA.B $28                                                            ;91D08D;
    BIT.W #$0800                                                         ;91D08F;
    BNE .YFlipped                                                        ;91D092;
    AND.W #$03FF                                                         ;91D094;
    JSR.W CopyBlockToXrayBG2Tilemap                                      ;91D097;
    BRA .return                                                          ;91D09A;


.YFlipped:
    AND.W #$03FF                                                         ;91D09C;
    JSR.W CopyYFlippedBlockToXrayBG2Tilemap                              ;91D09F;

.return:
    PLY                                                                  ;91D0A2;
    PLX                                                                  ;91D0A3;
    PLP                                                                  ;91D0A4;
    RTL                                                                  ;91D0A5;


CopyYFlippedBlockToXrayBG2Tilemap:
    ASL A                                                                ;91D0A6;
    ASL A                                                                ;91D0A7;
    ASL A                                                                ;91D0A8;
    TAX                                                                  ;91D0A9;
    LDA.L $7EA000,X                                                      ;91D0AA;
    PHA                                                                  ;91D0AE;
    LDA.L $7EA002,X                                                      ;91D0AF;
    PHA                                                                  ;91D0B3;
    LDA.L $7EA004,X                                                      ;91D0B4;
    PHA                                                                  ;91D0B8;
    LDA.L $7EA006,X                                                      ;91D0B9;
    LDX.B $16                                                            ;91D0BD;
    STA.L $7E4002,X                                                      ;91D0BF;
    PLA                                                                  ;91D0C3;
    STA.L $7E4000,X                                                      ;91D0C4;
    PLA                                                                  ;91D0C8;
    STA.L $7E4042,X                                                      ;91D0C9;
    PLA                                                                  ;91D0CD;
    STA.L $7E4040,X                                                      ;91D0CE;
    RTS                                                                  ;91D0D2;


XraySetup_5_ReadBG2Tilemap_2ndScreen:
    PHP                                                                  ;91D0D3;
    REP #$30                                                             ;91D0D4;
    JSL.L CheckIfXrayShouldShowAnyBlocks                                 ;91D0D6;
    BEQ .noReveal                                                        ;91D0DA;
    LDA.W $1840                                                          ;91D0DC;
    BEQ +                                                                ;91D0DF;
    LDA.W $091D                                                          ;91D0E1;
    CLC                                                                  ;91D0E4;
    ADC.W $0911                                                          ;91D0E5;
    STA.B $B1                                                            ;91D0E8;
    LDA.W $091F                                                          ;91D0EA;
    CLC                                                                  ;91D0ED;
    ADC.W $0915                                                          ;91D0EE;
    STA.B $B3                                                            ;91D0F1;

  + LDA.B $B1                                                            ;91D0F3;
    AND.W #$000F                                                         ;91D0F5;
    STA.B $B5                                                            ;91D0F8;
    LDA.B $B3                                                            ;91D0FA;
    AND.W #$000F                                                         ;91D0FC;
    STA.B $B7                                                            ;91D0FF;
    SEP #$20                                                             ;91D101;
    LDA.B #$49                                                           ;91D103;
    STA.B $59                                                            ;91D105;
    REP #$20                                                             ;91D107;

.noReveal:
    LDX.W $0360                                                          ;91D109;
    LDA.B $59                                                            ;91D10C;
    AND.W #$00FC                                                         ;91D10E;
    XBA                                                                  ;91D111;
    CLC                                                                  ;91D112;
    ADC.W #$0400                                                         ;91D113;
    STA.W $0340,X                                                        ;91D116;
    LDA.W #$0081                                                         ;91D119;
    STA.W $0342,X                                                        ;91D11C;
    LDA.W #$0039                                                         ;91D11F;
    STA.W $0343,X                                                        ;91D122;
    LDA.W #$5800                                                         ;91D125;
    STA.W $0344,X                                                        ;91D128;
    LDA.W #$007E                                                         ;91D12B;
    STA.W $0346,X                                                        ;91D12E;
    LDA.W #$0800                                                         ;91D131;
    STA.W $0347,X                                                        ;91D134;
    TXA                                                                  ;91D137;
    CLC                                                                  ;91D138;
    ADC.W #$0009                                                         ;91D139;
    STA.W $0360                                                          ;91D13C;
    PLP                                                                  ;91D13F;
    RTL                                                                  ;91D140;


REP30_91D141:
    REP #$30                                                             ;91D141;

CheckIfXrayShouldShowAnyBlocks:
    LDA.W $079B                                                          ;91D143;
    CMP.W #RoomHeader_Statues                                            ;91D146;
    BEQ .return                                                          ;91D149;
    CMP.W #RoomHeader_GlassTunnel                                        ;91D14B;
    BEQ .return                                                          ;91D14E;
    LDA.W $196E                                                          ;91D150;
    CMP.W #$0024                                                         ;91D153;
    BEQ .return                                                          ;91D156;
    LDA.W $179C                                                          ;91D158;
    CMP.W #$0003                                                         ;91D15B;
    BEQ .return                                                          ;91D15E;
    CMP.W #$0006                                                         ;91D160;
    BEQ .return                                                          ;91D163;
    CMP.W #$0007                                                         ;91D165;
    BEQ .return                                                          ;91D168;
    CMP.W #$0008                                                         ;91D16A;
    BEQ .return                                                          ;91D16D;
    CMP.W #$000A                                                         ;91D16F;

.return:
    RTL                                                                  ;91D172;


XraySetup_6_TransferXrayTilemap_1stScreen:
    PHP                                                                  ;91D173;
    REP #$30                                                             ;91D174;
    JSL.L CheckIfXrayShouldShowAnyBlocks                                 ;91D176;
    BEQ .return                                                          ;91D17A;
    LDX.W $0330                                                          ;91D17C;
    LDA.W #$0800                                                         ;91D17F;
    STA.B $D0,X                                                          ;91D182;
    LDA.W #$4000                                                         ;91D184;
    STA.B $D2,X                                                          ;91D187;
    LDA.W #$007E                                                         ;91D189;
    STA.B $D4,X                                                          ;91D18C;
    LDA.B $59                                                            ;91D18E;
    AND.W #$00FC                                                         ;91D190;
    XBA                                                                  ;91D193;
    STA.B $D5,X                                                          ;91D194;
    TXA                                                                  ;91D196;
    CLC                                                                  ;91D197;
    ADC.W #$0007                                                         ;91D198;
    STA.W $0330                                                          ;91D19B;

.return:
    PLP                                                                  ;91D19E;
    RTL                                                                  ;91D19F;


XraySetup_7_InitializeXray_TransferXrayTilemap_2ndScreen:
    PHP                                                                  ;91D1A0;
    REP #$30                                                             ;91D1A1;
    JSL.L CheckIfXrayShouldShowAnyBlocks                                 ;91D1A3;
    BEQ .dontShowBlocks                                                  ;91D1A7;
    LDX.W $0330                                                          ;91D1A9;
    LDA.W #$0800                                                         ;91D1AC;
    STA.B $D0,X                                                          ;91D1AF;
    LDA.W #$4800                                                         ;91D1B1;
    STA.B $D2,X                                                          ;91D1B4;
    LDA.W #$007E                                                         ;91D1B6;
    STA.B $D4,X                                                          ;91D1B9;
    LDA.B $59                                                            ;91D1BB;
    AND.W #$00FC                                                         ;91D1BD;
    XBA                                                                  ;91D1C0;
    CLC                                                                  ;91D1C1;
    ADC.W #$0400                                                         ;91D1C2;
    STA.B $D5,X                                                          ;91D1C5;
    TXA                                                                  ;91D1C7;
    CLC                                                                  ;91D1C8;
    ADC.W #$0007                                                         ;91D1C9;
    STA.W $0330                                                          ;91D1CC;

.dontShowBlocks:
    LDA.W #$00E4                                                         ;91D1CF;
    STA.W $0A88                                                          ;91D1D2;
    LDA.W #$9800                                                         ;91D1D5; $7E
    STA.W $0A89                                                          ;91D1D8;
    LDA.W #$00E4                                                         ;91D1DB;
    STA.W $0A8B                                                          ;91D1DE;
    LDA.W #$98C8                                                         ;91D1E1; $7E
    STA.W $0A8C                                                          ;91D1E4;
    LDA.W #$0098                                                         ;91D1E7;
    STA.W $0A8E                                                          ;91D1EA;
    LDA.W #$9990                                                         ;91D1ED; $7E
    STA.W $0A8F                                                          ;91D1F0;
    STZ.W $0A91                                                          ;91D1F3;
    STZ.W $0A7A                                                          ;91D1F6;
    STZ.W $0A7C                                                          ;91D1F9;
    STZ.W $0A7E                                                          ;91D1FC;
    LDA.W #$0000                                                         ;91D1FF;
    STA.W $0A84                                                          ;91D202;
    STZ.W $0A86                                                          ;91D205;
    LDA.W $0A1E                                                          ;91D208;
    AND.W #$00FF                                                         ;91D20B;
    CMP.W #$0004                                                         ;91D20E;
    BEQ .facingLeft                                                      ;91D211;
    LDA.W #$0040                                                         ;91D213;
    STA.W $0A82                                                          ;91D216;
    BRA .return                                                          ;91D219;


.facingLeft:
    LDA.W #$00C0                                                         ;91D21B;
    STA.W $0A82                                                          ;91D21E;

.return:
    PLP                                                                  ;91D221;
    RTL                                                                  ;91D222;


InstList_HDMAObject_Xray_0:
    dw Instruction_HDMAObject_HDMATableBank                              ;91D223;
    db $00                                                               ;91D225;
    dw Instruction_HDMAObject_IndirectHDMATableBank                      ;91D226;
    db $7E                                                               ;91D228;
    dw Instruction_HDMAObject_PreInstructionInY                          ;91D229;
    dl PreInstruction_HDMAObject_XraySetup                               ;91D22B;
    dw Instruction_HDMAObject_CallExternalFunctionInY                    ;91D22E;
    dl XraySetup_1_FreezeTime_BackupBG2Registers                         ;91D230;
    dw $0001,$0A88                                                       ;91D233;
    dw Instruction_HDMAObject_CallExternalFunctionInY                    ;91D237;
    dl XraySetup_2_ReadBG1Tilemap_2ndScreen                              ;91D239;
    dw $0001,$0A88                                                       ;91D23C;
    dw Instruction_HDMAObject_CallExternalFunctionInY                    ;91D240;
    dl XraySetup_3_ReadBG1Tilemap_1stScreen                              ;91D242;
    dw $0001,$0A88                                                       ;91D245;
    dw Instruction_HDMAObject_CallExternalFunctionInY                    ;91D249;
    dl XraySetup_4_BuildBG2Tilemap_ReadBG2Tilemap_1stScreen              ;91D24B;
    dw $0001,$0A88                                                       ;91D24E;
    dw Instruction_HDMAObject_CallExternalFunctionInY                    ;91D252;
    dl XraySetup_5_ReadBG2Tilemap_2ndScreen                              ;91D254;
    dw $0001,$0A88                                                       ;91D257;
    dw Instruction_HDMAObject_CallExternalFunctionInY                    ;91D25B;
    dl XraySetup_6_TransferXrayTilemap_1stScreen                         ;91D25D;
    dw $0001,$0A88                                                       ;91D260;
    dw Instruction_HDMAObject_CallExternalFunctionInY                    ;91D264;
    dl XraySetup_7_InitializeXray_TransferXrayTilemap_2ndScreen          ;91D266;
    dw $0001,$0A88                                                       ;91D269;
    dw Instruction_HDMAObject_CallExternalFunctionInY                    ;91D26D;
    dl XraySetup_8_BackdropColor                                         ;91D26F;
    dw Instruction_HDMAObject_PreInstructionInY                          ;91D272;
    dl PreInstruction_Xray_Main                                          ;91D274;

InstList_HDMAObject_Xray_1:
    dw $0001,$0A88                                                       ;91D277;
    dw Instruction_HDMAObject_GotoY                                      ;91D27B;
    dw InstList_HDMAObject_Xray_1                                        ;91D27D;

PreInstruction_HDMAObject_XraySetup:
    PHP                                                                  ;91D27F;
    REP #$30                                                             ;91D280;
    PHX                                                                  ;91D282;
    LDX.W #$1000                                                         ;91D283;
    LDA.W $196E                                                          ;91D286;
    CMP.W #$0024                                                         ;91D289;
    BEQ .fireflea                                                        ;91D28C;
    LDX.W #$2000                                                         ;91D28E;
    JSL.L CheckIfXrayShouldShowAnyBlocks                                 ;91D291;
    BEQ .setBackdropColorEnd                                             ;91D295;
    LDX.W #$4000                                                         ;91D297;

.setBackdropColor:
    LDA.W #$0027                                                         ;91D29A;
    STA.B $74                                                            ;91D29D;
    LDA.W #$0047                                                         ;91D29F;
    STA.B $75                                                            ;91D2A2;
    LDA.W #$0087                                                         ;91D2A4;
    STA.B $76                                                            ;91D2A7;

.setBackdropColorEnd:
    TXA                                                                  ;91D2A9;
    TSB.W $1986                                                          ;91D2AA;
    PLX                                                                  ;91D2AD;
    PLP                                                                  ;91D2AE;
    RTL                                                                  ;91D2AF;


.fireflea:
    LDA.B $74                                                            ;91D2B0;
    AND.W #$001F                                                         ;91D2B2;
    CMP.W #$0007                                                         ;91D2B5;
    BPL .setBackdropColorEnd                                             ;91D2B8;
    BRA .setBackdropColor                                                ;91D2BA;


XraySetup_8_BackdropColor:
    PHP                                                                  ;91D2BC;
    PHX                                                                  ;91D2BD;
    PHY                                                                  ;91D2BE;
    SEP #$20                                                             ;91D2BF;
    LDA.B #$63                                                           ;91D2C1;
    STA.L $7EC000                                                        ;91D2C3;
    LDA.B #$0C                                                           ;91D2C7;
    STA.L $7EC001                                                        ;91D2C9;
    PLY                                                                  ;91D2CD;
    PLX                                                                  ;91D2CE;
    PLP                                                                  ;91D2CF;
    RTL                                                                  ;91D2D0;


RTS_91D2D1:
    PHP                                                                  ;91D2D1;
    REP #$30                                                             ;91D2D2;
    PLP                                                                  ;91D2D4;
    RTS                                                                  ;91D2D5;


RevealedBlockTable_0_blockType:
    dw $0000                                                             ;91D2D6;

RevealedBlockTable_0_pointers:
    dw RevealedBlockTable_Air_0                                          ;91D2D8;

RevealedBlockTable_1_blockType:
    dw $3000                                                             ;91D2DA;

RevealedBlockTable_1_pointers:
    dw RevealedBlockTable_SpecialAir_0                                   ;91D2DC;
    dw $5000                                                             ;91D2DE;
    dw RevealedBlockTable_HorizontalExtension_0                          ;91D2E0;
    dw $A000                                                             ;91D2E2;
    dw RevealedBlockTable_SpikeBlock_0                                   ;91D2E4;
    dw $B000                                                             ;91D2E6;
    dw RevealedBlockTable_SpecialBlock                                   ;91D2E8;
    dw $C000                                                             ;91D2EA;
    dw RevealedBlockTable_ShootableBlock                                 ;91D2EC;
    dw $D000                                                             ;91D2EE;
    dw RevealedBlockTable_VerticalExtension_0                            ;91D2F0;
    dw $E000                                                             ;91D2F2;
    dw RevealedBlockTable_GrappleBlock                                   ;91D2F4;
    dw $F000                                                             ;91D2F6;
    dw RevealedBlockTable_BombableBlock                                  ;91D2F8;
    dw $FFFF                                                             ;91D2FA;

RevealedBlockTable_Air_0:
    dw $FF00                                                             ;91D2FC;
    dw RevealedBlockTable_Air_1                                          ;91D2FE;
    dw $FFFF                                                             ;91D300;

RevealedBlockTable_Air_1:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap                 ;91D302;
    dw $00FF                                                             ;91D304;

RevealedBlockTable_SpecialAir_0:
    dw $0046                                                             ;91D306;
    dw RevealedBlockTable_SpecialAir_1                                   ;91D308;
    dw $FFFF                                                             ;91D30A;

RevealedBlockTable_SpecialAir_1:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap                 ;91D30C;
    dw $00FF                                                             ;91D30E;

RevealedBlockTable_HorizontalExtension_0:
    dw $FF00                                                             ;91D310;
    dw RevealedBlockTable_HorizontalExtension_1                          ;91D312;
    dw $FFFF                                                             ;91D314;

RevealedBlockTable_HorizontalExtension_1:
    dw RevealedBlockCommand_HorizontalExtension                          ;91D316;

RevealedBlockTable_SpikeBlock_0:
    dw $000E                                                             ;91D318;
    dw RevealedBlockTable_SpikeBlock_1                                   ;91D31A;
    dw $FFFF                                                             ;91D31C;

RevealedBlockTable_SpikeBlock_1:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap                 ;91D31E;
    dw $005F                                                             ;91D320;

RevealedBlockTable_SpecialBlock:
    dw $0000                                                             ;91D322;
    dw RevealedBlockTable_SpecialBlock_0                                 ;91D324;
    dw $0001                                                             ;91D326;
    dw RevealedBlockTable_SpecialBlock_1                                 ;91D328;
    dw $0002                                                             ;91D32A;
    dw RevealedBlockTable_SpecialBlock_2                                 ;91D32C;
    dw $0003                                                             ;91D32E;
    dw RevealedBlockTable_SpecialBlock_3                                 ;91D330;
    dw $0004                                                             ;91D332;
    dw RevealedBlockTable_SpecialBlock_4                                 ;91D334;
    dw $0005                                                             ;91D336;
    dw RevealedBlockTable_SpecialBlock_5                                 ;91D338;
    dw $0006                                                             ;91D33A;
    dw RevealedBlockTable_SpecialBlock_6                                 ;91D33C;
    dw $0007                                                             ;91D33E;
    dw RevealedBlockTable_SpecialBlock_7                                 ;91D340;
    dw $0008                                                             ;91D342;
    dw RevealedBlockTable_SpecialBlock_8                                 ;91D344;
    dw $0009                                                             ;91D346;
    dw RevealedBlockTable_SpecialBlock_9                                 ;91D348;
    dw $000A                                                             ;91D34A;
    dw RevealedBlockTable_SpecialBlock_A                                 ;91D34C;
    dw $000B                                                             ;91D34E;
    dw RevealedBlockTable_SpecialBlock_B                                 ;91D350;
    dw $000C                                                             ;91D352;
    dw RevealedBlockTable_SpecialBlock_C                                 ;91D354;
    dw $000D                                                             ;91D356;
    dw RevealedBlockTable_SpecialBlock_D                                 ;91D358;
    dw $000E                                                             ;91D35A;
    dw RevealedBlockTable_SpecialBlock_E                                 ;91D35C;
    dw $000F                                                             ;91D35E;
    dw RevealedBlockTable_SpecialBlock_F                                 ;91D360;
    dw $0082                                                             ;91D362;
    dw RevealedBlockTable_SpecialBlock_Brinstar                          ;91D364;
    dw $0083                                                             ;91D366;
    dw RevealedBlockTable_SpecialBlock_Brinstar                          ;91D368;
    dw $0084                                                             ;91D36A;
    dw RevealedBlockTable_SpecialBlock_Brinstar                          ;91D36C;
    dw $0085                                                             ;91D36E;
    dw RevealedBlockTable_SpecialBlock_Brinstar                          ;91D370;
    dw $FFFF                                                             ;91D372;

RevealedBlockTable_SpecialBlock_0:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap                 ;91D374;
    dw $00BC                                                             ;91D376;

RevealedBlockTable_SpecialBlock_1:
    dw RevealedBlockCommand_Copy2x1BlockToXrayBG2Tilemap                 ;91D378;
    dw $00BC,$00BC                                                       ;91D37A;

RevealedBlockTable_SpecialBlock_2:
    dw RevealedBlockCommand_Copy1x2BlockToXrayBG2Tilemap                 ;91D37E;
    dw $00BC,$00BC                                                       ;91D380;

RevealedBlockTable_SpecialBlock_3:
    dw RevealedBlockCommand_Copy2x2BlockToXrayBG2Tilemap                 ;91D384;
    dw $00BC,$00BC,$00BC,$00BC                                           ;91D386;

RevealedBlockTable_SpecialBlock_4:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap                 ;91D38E;
    dw $00BC                                                             ;91D390;

RevealedBlockTable_SpecialBlock_5:
    dw RevealedBlockCommand_Copy2x1BlockToXrayBG2Tilemap                 ;91D392;
    dw $00BC,$00BC                                                       ;91D394;

RevealedBlockTable_SpecialBlock_6:
    dw RevealedBlockCommand_Copy1x2BlockToXrayBG2Tilemap                 ;91D398;
    dw $00BC,$00BC                                                       ;91D39A;

RevealedBlockTable_SpecialBlock_7:
    dw RevealedBlockCommand_Copy2x2BlockToXrayBG2Tilemap                 ;91D39E;
    dw $00BC,$00BC,$00BC,$00BC                                           ;91D3A0;

RevealedBlockTable_SpecialBlock_8:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap                 ;91D3A8;
    dw $00BC                                                             ;91D3AA;

RevealedBlockTable_SpecialBlock_9:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap                 ;91D3AC;
    dw $00BC                                                             ;91D3AE;

RevealedBlockTable_SpecialBlock_A:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap                 ;91D3B0;
    dw $00BC                                                             ;91D3B2;

RevealedBlockTable_SpecialBlock_B:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap                 ;91D3B4;
    dw $00BC                                                             ;91D3B6;

RevealedBlockTable_SpecialBlock_C:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap                 ;91D3B8;
    dw $00BC                                                             ;91D3BA;

RevealedBlockTable_SpecialBlock_D:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap                 ;91D3BC;
    dw $00BC                                                             ;91D3BE;

RevealedBlockTable_SpecialBlock_E:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap                 ;91D3C0;
    dw $00B6                                                             ;91D3C2;

RevealedBlockTable_SpecialBlock_F:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap                 ;91D3C4;
    dw $00B6                                                             ;91D3C6;

RevealedBlockTable_SpecialBlock_Brinstar:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2TilemapIfBrinstar       ;91D3C8;
    dw $00B6                                                             ;91D3CA;

RevealedBlockTable_ShootableBlock:
    dw $0000                                                             ;91D3CC;
    dw RevealedBlockTable_ShootableBlock_0                               ;91D3CE;
    dw $0001                                                             ;91D3D0;
    dw RevealedBlockTable_ShootableBlock_1                               ;91D3D2;
    dw $0002                                                             ;91D3D4;
    dw RevealedBlockTable_ShootableBlock_2                               ;91D3D6;
    dw $0003                                                             ;91D3D8;
    dw RevealedBlockTable_ShootableBlock_3                               ;91D3DA;
    dw $0004                                                             ;91D3DC;
    dw RevealedBlockTable_ShootableBlock_4                               ;91D3DE;
    dw $0005                                                             ;91D3E0;
    dw RevealedBlockTable_ShootableBlock_5                               ;91D3E2;
    dw $0006                                                             ;91D3E4;
    dw RevealedBlockTable_ShootableBlock_6                               ;91D3E6;
    dw $0007                                                             ;91D3E8;
    dw RevealedBlockTable_ShootableBlock_7                               ;91D3EA;
    dw $0008                                                             ;91D3EC;
    dw RevealedBlockTable_ShootableBlock_8                               ;91D3EE;
    dw $0009                                                             ;91D3F0;
    dw RevealedBlockTable_ShootableBlock_9                               ;91D3F2;
    dw $000A                                                             ;91D3F4;
    dw RevealedBlockTable_ShootableBlock_A                               ;91D3F6;
    dw $000B                                                             ;91D3F8;
    dw RevealedBlockTable_ShootableBlock_B                               ;91D3FA;
    dw $000C                                                             ;91D3FC;
    dw RevealedBlockTable_ShootableBlock_C                               ;91D3FE;
    dw $000D                                                             ;91D400;
    dw RevealedBlockTable_ShootableBlock_D                               ;91D402;
    dw $000E                                                             ;91D404;
    dw RevealedBlockTable_ShootableBlock_E                               ;91D406;
    dw $000F                                                             ;91D408;
    dw RevealedBlockTable_ShootableBlock_F                               ;91D40A;
    dw $FFFF                                                             ;91D40C;

RevealedBlockTable_ShootableBlock_0:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap                 ;91D40E;
    dw $0052                                                             ;91D410;

RevealedBlockTable_ShootableBlock_1:
    dw RevealedBlockCommand_Copy2x1BlockToXrayBG2Tilemap                 ;91D412;
    dw $0096,$0097                                                       ;91D414;

RevealedBlockTable_ShootableBlock_2:
    dw RevealedBlockCommand_Copy1x2BlockToXrayBG2Tilemap                 ;91D418;
    dw $0098,$00B8                                                       ;91D41A;

RevealedBlockTable_ShootableBlock_3:
    dw RevealedBlockCommand_Copy2x2BlockToXrayBG2Tilemap                 ;91D41E;
    dw $0099,$009A,$00B9,$00BA                                           ;91D420;

RevealedBlockTable_ShootableBlock_4:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap                 ;91D428;
    dw $0052                                                             ;91D42A;

RevealedBlockTable_ShootableBlock_5:
    dw RevealedBlockCommand_Copy2x1BlockToXrayBG2Tilemap                 ;91D42C;
    dw $0096,$0097                                                       ;91D42E;

RevealedBlockTable_ShootableBlock_6:
    dw RevealedBlockCommand_Copy1x2BlockToXrayBG2Tilemap                 ;91D432;
    dw $0098,$00B8                                                       ;91D434;

RevealedBlockTable_ShootableBlock_7:
    dw RevealedBlockCommand_Copy2x2BlockToXrayBG2Tilemap                 ;91D438;
    dw $0099,$009A,$00B9,$00BA                                           ;91D43A;

RevealedBlockTable_ShootableBlock_8:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap                 ;91D442;
    dw $0057                                                             ;91D444;

RevealedBlockTable_ShootableBlock_9:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap                 ;91D446;
    dw $0057                                                             ;91D448;

RevealedBlockTable_ShootableBlock_A:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap                 ;91D44A;
    dw $009F                                                             ;91D44C;

RevealedBlockTable_ShootableBlock_B:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap                 ;91D44E;
    dw $009F                                                             ;91D450;

RevealedBlockTable_ShootableBlock_C:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap                 ;91D452;
    dw $009F                                                             ;91D454;

RevealedBlockTable_ShootableBlock_D:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap                 ;91D456;
    dw $009F                                                             ;91D458;

RevealedBlockTable_ShootableBlock_E:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap                 ;91D45A;
    dw $009F                                                             ;91D45C;

RevealedBlockTable_ShootableBlock_F:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap                 ;91D45E;
    dw $009F                                                             ;91D460;

RevealedBlockTable_VerticalExtension_0:
    dw $FF00                                                             ;91D462;
    dw RevealedBlockTable_VerticalExtension_1                            ;91D464;
    dw $FFFF                                                             ;91D466;

RevealedBlockTable_VerticalExtension_1:
    dw RevealedBlockCommand_VerticalExtension                            ;91D468;

RevealedBlockTable_GrappleBlock:
    dw $0000                                                             ;91D46A;
    dw RevealedBlockTable_GrappleBlock_0                                 ;91D46C;
    dw $0001                                                             ;91D46E;
    dw RevealedBlockTable_GrappleBlock_1                                 ;91D470;
    dw $0002                                                             ;91D472;
    dw RevealedBlockTable_GrappleBlock_2                                 ;91D474;
    dw $FFFF                                                             ;91D476;

RevealedBlockTable_GrappleBlock_0:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap                 ;91D478;
    dw $009B                                                             ;91D47A;

RevealedBlockTable_GrappleBlock_1:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap                 ;91D47C;
    dw $00B7                                                             ;91D47E;

RevealedBlockTable_GrappleBlock_2:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap                 ;91D480;
    dw $00B7                                                             ;91D482;

RevealedBlockTable_BombableBlock:
    dw $0000                                                             ;91D484;
    dw RevealedBlockTable_BombableBlock_0                                ;91D486;
    dw $0001                                                             ;91D488;
    dw RevealedBlockTable_BombableBlock_1                                ;91D48A;
    dw $0002                                                             ;91D48C;
    dw RevealedBlockTable_BombableBlock_2                                ;91D48E;
    dw $0003                                                             ;91D490;
    dw RevealedBlockTable_BombableBlock_3                                ;91D492;
    dw $0004                                                             ;91D494;
    dw RevealedBlockTable_BombableBlock_4                                ;91D496;
    dw $0005                                                             ;91D498;
    dw RevealedBlockTable_BombableBlock_5                                ;91D49A;
    dw $0006                                                             ;91D49C;
    dw RevealedBlockTable_BombableBlock_6                                ;91D49E;
    dw $0007                                                             ;91D4A0;
    dw RevealedBlockTable_BombableBlock_7                                ;91D4A2;
    dw $FFFF                                                             ;91D4A4;

RevealedBlockTable_BombableBlock_0:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap                 ;91D4A6;
    dw $0058                                                             ;91D4A8;

RevealedBlockTable_BombableBlock_1:
    dw RevealedBlockCommand_Copy2x1BlockToXrayBG2Tilemap                 ;91D4AA;
    dw $0058,$0058                                                       ;91D4AC;

RevealedBlockTable_BombableBlock_2:
    dw RevealedBlockCommand_Copy1x2BlockToXrayBG2Tilemap                 ;91D4B0;
    dw $0058,$0058                                                       ;91D4B2;

RevealedBlockTable_BombableBlock_3:
    dw RevealedBlockCommand_Copy2x2BlockToXrayBG2Tilemap                 ;91D4B6;
    dw $0058,$0058,$0058,$0058                                           ;91D4B8;

RevealedBlockTable_BombableBlock_4:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap                 ;91D4C0;
    dw $0058                                                             ;91D4C2;

RevealedBlockTable_BombableBlock_5:
    dw RevealedBlockCommand_Copy2x1BlockToXrayBG2Tilemap                 ;91D4C4;
    dw $0058,$0058                                                       ;91D4C6;

RevealedBlockTable_BombableBlock_6:
    dw RevealedBlockCommand_Copy1x2BlockToXrayBG2Tilemap                 ;91D4CA;
    dw $0058,$0058                                                       ;91D4CC;

RevealedBlockTable_BombableBlock_7:
    dw RevealedBlockCommand_Copy2x2BlockToXrayBG2Tilemap                 ;91D4D0;
    dw $0058,$0058,$0058,$0058                                           ;91D4D2;

UNUSED_GameState1C_91D4DA:
    PHP                                                                  ;91D4DA;
    REP #$30                                                             ;91D4DB;
    JMP.W ($0DEA)                                                        ;91D4DD;


PLPRTL_91D4E0:
    PLP                                                                  ;91D4E0;
    RTL                                                                  ;91D4E1;


PLPRTL_91D4E2:
    PLP                                                                  ;91D4E2;
    RTL                                                                  ;91D4E3;


VariaSuit_Pickup:
    PHP                                                                  ;91D4E4;
    PHB                                                                  ;91D4E5;
    PHK                                                                  ;91D4E6;
    PLB                                                                  ;91D4E7;
    SEP #$30                                                             ;91D4E8;
    LDA.B #$30                                                           ;91D4EA;
    STA.W $0DF0                                                          ;91D4EC;
    LDA.B #$50                                                           ;91D4EF;
    STA.W $0DF1                                                          ;91D4F1;
    LDA.B #$80                                                           ;91D4F4;
    STA.W $0DF2                                                          ;91D4F6;
    STZ.W $0DF3                                                          ;91D4F9;
    REP #$30                                                             ;91D4FC;
    JSL.L Cancel_SpeedBoosting                                           ;91D4FE;
    STZ.W $0B42                                                          ;91D502;
    STZ.W $0B44                                                          ;91D505;
    STZ.W $0B46                                                          ;91D508;
    STZ.W $0B48                                                          ;91D50B;
    STZ.W $0B2C                                                          ;91D50E;
    STZ.W $0B2E                                                          ;91D511;
    STZ.W $0B36                                                          ;91D514;
    STZ.W $0B20                                                          ;91D517;
    STZ.W $0B4A                                                          ;91D51A;
    STZ.W $0E18                                                          ;91D51D;
    STZ.W $0DEC                                                          ;91D520;
    STZ.W $0DEE                                                          ;91D523;
    LDA.W #$0100                                                         ;91D526;
    STA.W $0DDC                                                          ;91D529;
    LDX.W #$01FE                                                         ;91D52C;
    LDA.W #$00FF                                                         ;91D52F;

.loop:
    STA.L $7E9800,X                                                      ;91D532;
    DEX                                                                  ;91D536;
    DEX                                                                  ;91D537;
    BPL .loop                                                            ;91D538;
    LDA.W $0A1F                                                          ;91D53A;
    AND.W #$00FF                                                         ;91D53D;
    CMP.W #$0003                                                         ;91D540;
    BEQ .playSFX                                                         ;91D543;
    CMP.W #$0014                                                         ;91D545;
    BNE notSpinning                                                      ;91D548;

.playSFX:
    LDA.W #$0032                                                         ;91D54A;
    JSL.L QueueSound_Lib1_Max9                                           ;91D54D;

notSpinning:
    LDA.W $09A2                                                          ;91D551;
    BIT.W #$0020                                                         ;91D554;
    BNE .gravitySuitEquipped                                             ;91D557;
    LDA.W #$0000                                                         ;91D559;
    STA.W $0A1C                                                          ;91D55C;
    BRA .initSamus                                                       ;91D55F;


.gravitySuitEquipped:
    LDA.W #$009B                                                         ;91D561;
    STA.W $0A1C                                                          ;91D564;

.initSamus:
    JSL.L InitializeSamusPose_1                                          ;91D567;
    JSL.L Set_Samus_AnimationFrame_if_PoseChanged                        ;91D56B;
    LDA.W #$0015                                                         ;91D56F;
    JSL.L Run_Samus_Command                                              ;91D572;
    LDA.W $0911                                                          ;91D576;
    CLC                                                                  ;91D579;
    ADC.W #$0078                                                         ;91D57A;
    STA.W $0AF6                                                          ;91D57D;
    STA.W $0B10                                                          ;91D580;
    LDA.W $0915                                                          ;91D583;
    CLC                                                                  ;91D586;
    ADC.W #$0088                                                         ;91D587;
    STA.W $0AFA                                                          ;91D58A;
    STA.W $0B14                                                          ;91D58D;
    LDA.W #$0056                                                         ;91D590;
    JSL.L QueueSound_Lib2_Max6                                           ;91D593;
    JSL.L Spawn_HDMAObject                                               ;91D597;
    db $41,$26                                                           ;91D59B;
    dw InstList_HDMAObject_Window1Position_VariaSuitPickup               ;91D59D;
    PLB                                                                  ;91D59F;
    PLP                                                                  ;91D5A0;
    RTL                                                                  ;91D5A1;


InstList_HDMAObject_Window1Position_VariaSuitPickup:
    dw Instruction_HDMAObject_HDMATableBank                              ;91D5A2;
    db $00                                                               ;91D5A4;
    dw Instruction_HDMAObject_IndirectHDMATableBank                      ;91D5A5;
    db $7E                                                               ;91D5A7;
    dw Instruction_HDMAObject_CallExternalFunctionInY                    ;91D5A8;
    dl InitializeSuitPickupHDMA                                          ;91D5AA;
    dw $0001,$0A88                                                       ;91D5AD;
    dw Instruction_HDMAObject_PreInstructionInY                          ;91D5B1;
    dl PreInstruction_VariaSuitPickup                                    ;91D5B3;
    dw Instruction_HDMAObject_Sleep                                      ;91D5B6;
    dw Instruction_HDMAObject_Delete                                     ;91D5B8;

GravitySuit_Pickup:
    PHP                                                                  ;91D5BA;
    PHB                                                                  ;91D5BB;
    PHK                                                                  ;91D5BC;
    PLB                                                                  ;91D5BD;
    SEP #$30                                                             ;91D5BE;
    LDA.B #$30                                                           ;91D5C0;
    STA.W $0DF0                                                          ;91D5C2;
    LDA.B #$49                                                           ;91D5C5;
    STA.W $0DF1                                                          ;91D5C7;
    LDA.B #$90                                                           ;91D5CA;
    STA.W $0DF2                                                          ;91D5CC;
    LDA.B #$01                                                           ;91D5CF;
    STA.W $0DF3                                                          ;91D5D1;
    REP #$30                                                             ;91D5D4;
    JSL.L Cancel_SpeedBoosting                                           ;91D5D6;
    STZ.W $0B42                                                          ;91D5DA;
    STZ.W $0B44                                                          ;91D5DD;
    STZ.W $0B46                                                          ;91D5E0;
    STZ.W $0B48                                                          ;91D5E3;
    STZ.W $0B2C                                                          ;91D5E6;
    STZ.W $0B2E                                                          ;91D5E9;
    STZ.W $0B36                                                          ;91D5EC;
    STZ.W $0B20                                                          ;91D5EF;
    STZ.W $0B4A                                                          ;91D5F2;
    STZ.W $0E18                                                          ;91D5F5;
    STZ.W $0DEC                                                          ;91D5F8;
    STZ.W $0DEE                                                          ;91D5FB;
    LDA.W #$0100                                                         ;91D5FE;
    STA.W $0DDC                                                          ;91D601;
    LDX.W #$01FE                                                         ;91D604;
    LDA.W #$00FF                                                         ;91D607;

.loop:
    STA.L $7E9800,X                                                      ;91D60A;
    DEX                                                                  ;91D60E;
    DEX                                                                  ;91D60F;
    BPL .loop                                                            ;91D610;
    LDA.W $0A1F                                                          ;91D612;
    AND.W #$00FF                                                         ;91D615;
    CMP.W #$0003                                                         ;91D618;
    BEQ .playSFX                                                         ;91D61B;
    CMP.W #$0014                                                         ;91D61D;
    BNE .notSpinning                                                     ;91D620;

.playSFX:
    LDA.W #$0032                                                         ;91D622;
    JSL.L QueueSound_Lib1_Max9                                           ;91D625;

.notSpinning:
    LDA.W $09A2                                                          ;91D629;
    BIT.W #$0001                                                         ;91D62C;
    BNE .gravitySuitEquipped                                             ;91D62F;
    LDA.W #$0000                                                         ;91D631;
    STA.W $0A1C                                                          ;91D634;
    BRA .initSamus                                                       ;91D637;


.gravitySuitEquipped:
    LDA.W #$009B                                                         ;91D639;
    STA.W $0A1C                                                          ;91D63C;

.initSamus:
    JSL.L InitializeSamusPose_1                                          ;91D63F;
    JSL.L Set_Samus_AnimationFrame_if_PoseChanged                        ;91D643;
    LDA.W #$0015                                                         ;91D647;
    JSL.L Run_Samus_Command                                              ;91D64A;
    LDA.W $0911                                                          ;91D64E;
    CLC                                                                  ;91D651;
    ADC.W #$0078                                                         ;91D652;
    STA.W $0AF6                                                          ;91D655;
    STA.W $0B10                                                          ;91D658;
    LDA.W $0915                                                          ;91D65B;
    CLC                                                                  ;91D65E;
    ADC.W #$0088                                                         ;91D65F;
    STA.W $0AFA                                                          ;91D662;
    STA.W $0B14                                                          ;91D665;
    LDA.W #$0056                                                         ;91D668;
    JSL.L QueueSound_Lib2_Max6                                           ;91D66B;
    JSL.L Spawn_HDMAObject                                               ;91D66F;
    db $41,$26                                                           ;91D673;
    dw InstList_HDMAObject_Window1Position_GravitySuitPickup             ;91D675;
    PLB                                                                  ;91D677;
    PLP                                                                  ;91D678;
    RTL                                                                  ;91D679;


InstList_HDMAObject_Window1Position_GravitySuitPickup:
    dw Instruction_HDMAObject_HDMATableBank                              ;91D67A;
    db $00                                                               ;91D67C;
    dw Instruction_HDMAObject_IndirectHDMATableBank                      ;91D67D;
    db $7E                                                               ;91D67F;
    dw Instruction_HDMAObject_CallExternalFunctionInY                    ;91D680;
    dl InitializeSuitPickupHDMA                                          ;91D682;
    dw $0001,$0A88                                                       ;91D685;
    dw Instruction_HDMAObject_PreInstructionInY                          ;91D689;
    dl PreInstruction_GravitySuitPickup                                  ;91D68B;
    dw Instruction_HDMAObject_Sleep                                      ;91D68E;
    dw Instruction_HDMAObject_Delete                                     ;91D690;

InitializeSuitPickupHDMA:
    PHP                                                                  ;91D692;
    PHB                                                                  ;91D693;
    PHK                                                                  ;91D694;
    PLB                                                                  ;91D695;
    SEP #$30                                                             ;91D696;
    LDA.B #$13                                                           ;91D698;
    STA.B $69                                                            ;91D69A;
    LDA.B #$13                                                           ;91D69C;
    STA.B $6C                                                            ;91D69E;
    LDA.B #$04                                                           ;91D6A0;
    STA.B $6B                                                            ;91D6A2;
    LDA.B #$04                                                           ;91D6A4;
    STA.B $6D                                                            ;91D6A6;
    LDA.B #$10                                                           ;91D6A8;
    STA.B $6E                                                            ;91D6AA;
    LDA.B #$00                                                           ;91D6AC;
    STA.B $60                                                            ;91D6AE;
    LDA.B #$02                                                           ;91D6B0;
    STA.B $61                                                            ;91D6B2;
    LDA.B #$20                                                           ;91D6B4;
    STA.B $62                                                            ;91D6B6;
    LDA.B #$33                                                           ;91D6B8;
    STA.B $71                                                            ;91D6BA;
    LDA.W $0DF0                                                          ;91D6BC;
    STA.B $74                                                            ;91D6BF;
    LDA.W $0DF1                                                          ;91D6C1;
    STA.B $75                                                            ;91D6C4;
    LDA.W $0DF2                                                          ;91D6C6;
    STA.B $76                                                            ;91D6C9;
    REP #$30                                                             ;91D6CB;
    LDA.W #$00E4                                                         ;91D6CD;
    STA.W $0A88                                                          ;91D6D0;
    LDA.W #$9800                                                         ;91D6D3; $7E
    STA.W $0A89                                                          ;91D6D6;
    LDA.W #$00E4                                                         ;91D6D9;
    STA.W $0A8B                                                          ;91D6DC;
    LDA.W #$98C8                                                         ;91D6DF; $7E
    STA.W $0A8C                                                          ;91D6E2;
    LDA.W #$0098                                                         ;91D6E5;
    STA.W $0A8E                                                          ;91D6E8;
    LDA.W #$9990                                                         ;91D6EB; $7E
    STA.W $0A8F                                                          ;91D6EE;
    STZ.W $0A91                                                          ;91D6F1;
    PLB                                                                  ;91D6F4;
    PLP                                                                  ;91D6F5;
    RTL                                                                  ;91D6F6;


HandleSamusPalette:
    PHP                                                                  ;91D6F7;
    PHB                                                                  ;91D6F8;
    PHK                                                                  ;91D6F9;
    PLB                                                                  ;91D6FA;
    REP #$30                                                             ;91D6FB;
    LDA.W $0A4A                                                          ;91D6FD;
    BPL .notHyper                                                        ;91D700;
    JSR.W HandleMiscSamusPalette                                         ;91D702;
    PLB                                                                  ;91D705;
    PLP                                                                  ;91D706;
    RTL                                                                  ;91D707;


.notHyper:
    JSR.W HandleBeamChargePalettes                                       ;91D708;
    BCS .glowEnded                                                       ;91D70B;
    LDA.W $0ACC                                                          ;91D70D;
    ASL A                                                                ;91D710;
    TAX                                                                  ;91D711;
    JSR.W (.special,X)                                                   ;91D712;
    BCS .return                                                          ;91D715;

.glowEnded:
    LDX.W $0A74                                                          ;91D717;
    LDA.W .suits,X                                                       ;91D71A;
    TAX                                                                  ;91D71D;
    JSR.W Load20BytesOfSamusPaletteInX                                   ;91D71E;

.return:
    JSR.W HandleMiscSamusPalette                                         ;91D721;
    PLB                                                                  ;91D724;
    PLP                                                                  ;91D725;
    RTL                                                                  ;91D726;


.suits:
    dw SamusPalettes_PowerSuit                                           ;91D727;
    dw SamusPalettes_VariaSuit                                           ;91D729;
    dw SamusPalettes_GravitySuit                                         ;91D72B;

.special:
    dw Handle_ScrewAttack_SpeedBoosting_Palette                          ;91D72D;
    dw HandleSpeedBoosterShinePalette                                    ;91D72F;
    dw HandleMiscSamusPalette                                            ;91D731;
    dw $0000                                                             ;91D733;
    dw $0000                                                             ;91D735;
    dw $0000                                                             ;91D737;
    dw HandleShinesparkingPalette                                        ;91D739;
    dw HandleCrystalFlashPalette                                         ;91D73B;
    dw HandleXrayPalette                                                 ;91D73D;
    dw HandleVisorPalette                                                ;91D73F;
    dw RTS_91DD31                                                        ;91D741;

HandleBeamChargePalettes:
    LDA.W $0B18                                                          ;91D743;
    BNE .chargedShotGlow                                                 ;91D746;
    LDA.W $0D32                                                          ;91D748;
    CMP.W #GrappleBeamFunction_Inactive                                  ;91D74B;
    BNE .noChargeGlow                                                    ;91D74E;
    LDA.W $0CD0                                                          ;91D750;
    BEQ .noChargeGlow                                                    ;91D753;
    CMP.W #$003C                                                         ;91D755;
    BMI .noChargeGlow                                                    ;91D758;
    LDA.W $0A6E                                                          ;91D75A;
    CMP.W #$0004                                                         ;91D75D;
    BNE .notPseudoScrew                                                  ;91D760;
    LDX.W $0A74                                                          ;91D762;
    LDA.W SamusPaletteTable_PseudoScrewAttack_pointers,X                 ;91D765;
    STA.B $24                                                            ;91D768;
    BRA +                                                                ;91D76A;


.notPseudoScrew:
    LDX.W $0A74                                                          ;91D76C;
    LDA.W SamusPaletteTable_BeamCharge_pointers,X                        ;91D76F;
    STA.B $24                                                            ;91D772;

  + LDA.W $0B62                                                          ;91D774;
    CLC                                                                  ;91D777;
    ADC.B $24                                                            ;91D778;
    TAX                                                                  ;91D77A;
    LDA.W $0000,X                                                        ;91D77B;
    TAX                                                                  ;91D77E;
    JSR.W Load20BytesOfSamusPaletteInX                                   ;91D77F;
    LDA.W $0B62                                                          ;91D782;
    INC A                                                                ;91D785;
    INC A                                                                ;91D786;
    CMP.W #$000C                                                         ;91D787;
    BMI .setPaletteIndex                                                 ;91D78A;
    LDA.W #$0000                                                         ;91D78C;

.setPaletteIndex:
    STA.W $0B62                                                          ;91D78F;
    CLC                                                                  ;91D792;
    RTS                                                                  ;91D793;


.chargedShotGlow:
    LDA.W $0A76                                                          ;91D794;
    BNE .hyperBeam                                                       ;91D797;
    DEC.W $0B18                                                          ;91D799;
    BEQ .returnCarrySet                                                  ;91D79C;
    LDX.W #$001C                                                         ;91D79E;
    LDA.W #$03FF                                                         ;91D7A1;

.loop:
    STA.L $7EC182,X                                                      ;91D7A4;
    DEX                                                                  ;91D7A8;
    DEX                                                                  ;91D7A9;
    BPL .loop                                                            ;91D7AA;
    CLC                                                                  ;91D7AC;
    RTS                                                                  ;91D7AD;


.returnCarrySet:
    SEC                                                                  ;91D7AE;
    RTS                                                                  ;91D7AF;


.noChargeGlow:
    STZ.W $0B62                                                          ;91D7B0;
    JMP.W HandleVisorPalette                                             ;91D7B3;


.hyperBeam:
    LDA.W $0B18                                                          ;91D7B6;
    BIT.W #$0001                                                         ;91D7B9;
    BNE .decGlowTimer                                                    ;91D7BC;
    AND.W #$001E                                                         ;91D7BE;
    BEQ .endGlow                                                         ;91D7C1;
    TAY                                                                  ;91D7C3;
    LDA.W SamusPaletteTable_HyperBeam,Y                                  ;91D7C4;
    TAX                                                                  ;91D7C7;
    JSR.W Load20BytesOfSamusPaletteInX                                   ;91D7C8;

.decGlowTimer:
    DEC.W $0B18                                                          ;91D7CB;
    CLC                                                                  ;91D7CE;
    RTS                                                                  ;91D7CF;


.endGlow:
    STZ.W $0B18                                                          ;91D7D0;
    SEC                                                                  ;91D7D3;
    RTS                                                                  ;91D7D4;


SamusPaletteTable_BeamCharge_pointers:
    dw SamusPaletteTable_BeamCharge_powerSuit                            ;91D7D5;
    dw SamusPaletteTable_BeamCharge_variaSuit                            ;91D7D7;
    dw SamusPaletteTable_BeamCharge_gravitySuit                          ;91D7D9;

SamusPaletteTable_BeamCharge_powerSuit:
    dw SamusPalettes_PowerSuit_DeathSequence_BeamCharging_0              ;91D7DB;
    dw SamusPalettes_PowerSuit_DeathSequence_BeamCharging_1              ;91D7DD;
    dw SamusPalettes_PowerSuit_DeathSequence_BeamCharging_2              ;91D7DF;
    dw SamusPalettes_PowerSuit_DeathSequence_BeamCharging_3              ;91D7E1;
    dw SamusPalettes_PowerSuit_DeathSequence_BeamCharging_2              ;91D7E3;
    dw SamusPalettes_PowerSuit_DeathSequence_BeamCharging_1              ;91D7E5;

SamusPaletteTable_BeamCharge_variaSuit:
    dw SamusPalettes_VariaSuit_DeathSequence_BeamCharging_0              ;91D7E7;
    dw SamusPalettes_VariaSuit_DeathSequence_BeamCharging_1              ;91D7E9;
    dw SamusPalettes_VariaSuit_DeathSequence_BeamCharging_2              ;91D7EB;
    dw SamusPalettes_VariaSuit_DeathSequence_BeamCharging_3              ;91D7ED;
    dw SamusPalettes_VariaSuit_DeathSequence_BeamCharging_2              ;91D7EF;
    dw SamusPalettes_VariaSuit_DeathSequence_BeamCharging_1              ;91D7F1;

SamusPaletteTable_BeamCharge_gravitySuit:
    dw SamusPalettes_GravitySuit_DeathSequence_BeamCharging_0            ;91D7F3;
    dw SamusPalettes_GravitySuit_DeathSequence_BeamCharging_1            ;91D7F5;
    dw SamusPalettes_GravitySuit_DeathSequence_BeamCharging_2            ;91D7F7;
    dw SamusPalettes_GravitySuit_DeathSequence_BeamCharging_3            ;91D7F9;
    dw SamusPalettes_GravitySuit_DeathSequence_BeamCharging_2            ;91D7FB;
    dw SamusPalettes_GravitySuit_DeathSequence_BeamCharging_1            ;91D7FD;

SamusPaletteTable_PseudoScrewAttack_pointers:
    dw SamusPaletteTable_PseudoScrewAttack_powerSuit                     ;91D7FF;
    dw SamusPaletteTable_PseudoScrewAttack_variaSuit                     ;91D801;
    dw SamusPaletteTable_PseudoScrewAttack_gravitySuit                   ;91D803;

SamusPaletteTable_PseudoScrewAttack_powerSuit:
    dw SamusPalettes_PowerSuit_Shinespark_PseudoScrewAttack_3            ;91D805;
    dw SamusPalettes_PowerSuit_Shinespark_PseudoScrewAttack_3            ;91D807;
    dw SamusPalettes_PowerSuit_Shinespark_PseudoScrewAttack_3            ;91D809;
    dw SamusPalettes_PowerSuit                                           ;91D80B;
    dw SamusPalettes_PowerSuit                                           ;91D80D;
    dw SamusPalettes_PowerSuit                                           ;91D80F;

SamusPaletteTable_PseudoScrewAttack_variaSuit:
    dw SamusPalettes_VariaSuit_Shinespark_PseudoScrewAttack_3            ;91D811;
    dw SamusPalettes_VariaSuit_Shinespark_PseudoScrewAttack_3            ;91D813;
    dw SamusPalettes_VariaSuit_Shinespark_PseudoScrewAttack_3            ;91D815;
    dw SamusPalettes_VariaSuit                                           ;91D817;
    dw SamusPalettes_VariaSuit                                           ;91D819;
    dw SamusPalettes_VariaSuit                                           ;91D81B;

SamusPaletteTable_PseudoScrewAttack_gravitySuit:
    dw SamusPalettes_GravitySuit_Shinespark_3                            ;91D81D;
    dw SamusPalettes_GravitySuit_Shinespark_3                            ;91D81F;
    dw SamusPalettes_GravitySuit_Shinespark_3                            ;91D821;
    dw SamusPalettes_GravitySuit                                         ;91D823;
    dw SamusPalettes_GravitySuit                                         ;91D825;
    dw SamusPalettes_GravitySuit                                         ;91D827;

SamusPaletteTable_HyperBeam:
    dw $0000                                                             ;91D829;
    dw SamusPalettes_HyperBeam_9                                         ;91D82B;
    dw SamusPalettes_HyperBeam_8                                         ;91D82D;
    dw SamusPalettes_HyperBeam_7                                         ;91D82F;
    dw SamusPalettes_HyperBeam_6                                         ;91D831;
    dw SamusPalettes_HyperBeam_5                                         ;91D833;
    dw SamusPalettes_HyperBeam_4                                         ;91D835;
    dw SamusPalettes_HyperBeam_3                                         ;91D837;
    dw SamusPalettes_HyperBeam_2                                         ;91D839;
    dw SamusPalettes_HyperBeam_1                                         ;91D83B;
    dw SamusPalettes_HyperBeam_0                                         ;91D83D;

HandleVisorPalette:
    LDA.W $0ACC                                                          ;91D83F;
    CMP.W #$0008                                                         ;91D842;
    BNE +                                                                ;91D845;

.return:
    CLC                                                                  ;91D847;
    RTS                                                                  ;91D848;


  + LDA.W $1982                                                          ;91D849;
    CMP.W #$0028                                                         ;91D84C;
    BEQ +                                                                ;91D84F;
    CMP.W #$002A                                                         ;91D851;
    BNE .normal                                                          ;91D854;

  + LDA.W $0A72                                                          ;91D856;
    DEC A                                                                ;91D859;
    STA.W $0A72                                                          ;91D85A;
    BIT.W #$00FF                                                         ;91D85D;
    BEQ +                                                                ;91D860;
    BNE .return                                                          ;91D862;

  + ORA.W #$0005                                                         ;91D864;
    STA.W $0A72                                                          ;91D867;
    XBA                                                                  ;91D86A;
    AND.W #$00FF                                                         ;91D86B;
    TAX                                                                  ;91D86E;
    LDA.L SamusPalettes_Visor,X                                          ;91D86F;
    STA.L $7EC188                                                        ;91D873;
    TXA                                                                  ;91D877;
    INC A                                                                ;91D878;
    INC A                                                                ;91D879;
    CMP.W #$000C                                                         ;91D87A;
    BMI +                                                                ;91D87D;
    LDA.W $0A72                                                          ;91D87F;
    AND.W #$00FF                                                         ;91D882;
    ORA.W #$0600                                                         ;91D885;
    STA.W $0A72                                                          ;91D888;
    CLC                                                                  ;91D88B;
    RTS                                                                  ;91D88C;


  + XBA                                                                  ;91D88D;
    STA.B $12                                                            ;91D88E;
    LDA.W $0A72                                                          ;91D890;
    AND.W #$00FF                                                         ;91D893;
    ORA.B $12                                                            ;91D896;
    STA.W $0A72                                                          ;91D898;
    CLC                                                                  ;91D89B;
    RTS                                                                  ;91D89C;


.normal:
    LDA.W #$0601                                                         ;91D89D;
    STA.W $0A72                                                          ;91D8A0;
    CLC                                                                  ;91D8A3;
    RTS                                                                  ;91D8A4;


HandleMiscSamusPalette:
    LDA.W $0A4A                                                          ;91D8A5;
    BNE .gotoSuperSpecial                                                ;91D8A8;
    LDA.W $0A48                                                          ;91D8AA;
    BNE .timerNotExpired                                                 ;91D8AD;
    RTS                                                                  ;91D8AF;


.gotoSuperSpecial:
    JMP.W .superSpecial                                                  ;91D8B0;


.timerNotExpired:
    CMP.W #$0002                                                         ;91D8B3;
    BNE .notHurtFrame2                                                   ;91D8B6;
    LDA.W $1F51                                                          ;91D8B8;
    BNE .noSFX                                                           ;91D8BB;
    LDA.W $0A44                                                          ;91D8BD;
    CMP.W #RTL_90E8D9                                                    ;91D8C0;
    BNE .notDrained                                                      ;91D8C3;
    LDA.W $0A1C                                                          ;91D8C5;
    CMP.W #$0054                                                         ;91D8C8;
    BEQ .noSFX                                                           ;91D8CB;

.notDrained:
    LDA.W #$0035                                                         ;91D8CD;
    JSL.L QueueSound_Lib1_Max6                                           ;91D8D0;
    BRA .notHurtFlash                                                    ;91D8D4;


.noSFX:
    LDA.W $0A48                                                          ;91D8D6;

.notHurtFrame2:
    CMP.W #$0007                                                         ;91D8D9;
    BPL .hurtFlashDone                                                   ;91D8DC;
    BIT.W #$0001                                                         ;91D8DE;
    BEQ .notHurtFlash                                                    ;91D8E1;
    LDX.W #SamusPalettes_HurtFlash                                       ;91D8E3;
    JSR.W Load20BytesOfSamusPaletteInX                                   ;91D8E6;
    BRA .hurtFlashDone                                                   ;91D8E9;


.notHurtFlash:
    LDA.W $1F51                                                          ;91D8EB;
    BEQ .loadPalette                                                     ;91D8EE;
    LDX.W #SamusPalettes_Intro                                           ;91D8F0;
    JSR.W Load20BytesOfSamusPaletteInX                                   ;91D8F3;
    BRA .hurtFlashDone                                                   ;91D8F6;


.loadPalette:
    JSL.L LoadSamusSuitPalette                                           ;91D8F8;

.hurtFlashDone:
    LDA.W $0A48                                                          ;91D8FC;
    INC A                                                                ;91D8FF;
    STA.W $0A48                                                          ;91D900;
    CMP.W #$0028                                                         ;91D903;
    BEQ .nonHurtSFX                                                      ;91D906;
    CMP.W #$003C                                                         ;91D908;
    BMI .returnUpper                                                     ;91D90B;
    STZ.W $0A48                                                          ;91D90D;

.returnUpper:
    RTS                                                                  ;91D910;


.nonHurtSFX:
    LDA.W $0D32                                                          ;91D911;
    CMP.W #GrappleBeamFunction_Inactive                                  ;91D914;
    BNE .grappleActive                                                   ;91D917;
    LDA.W $0A1F                                                          ;91D919;
    AND.W #$00FF                                                         ;91D91C;
    CMP.W #$0003                                                         ;91D91F;
    BEQ .spinning                                                        ;91D922;
    CMP.W #$0014                                                         ;91D924;
    BEQ .spinning                                                        ;91D927;
    LDA.W $0CD0                                                          ;91D929;
    CMP.W #$0010                                                         ;91D92C;
    BMI .returnUpper                                                     ;91D92F;
    LDA.B $8B                                                            ;91D931;
    BIT.W $09B2                                                          ;91D933;
    BEQ .returnUpper                                                     ;91D936;
    LDA.W #$0001                                                         ;91D938;
    STA.W $0DC0                                                          ;91D93B;
    RTS                                                                  ;91D93E;


.grappleActive:
    CMP.W #GrappleBeamFunction_HitNothing_Cancel                         ;91D93F;
    BPL .returnUpper                                                     ;91D942;
    LDA.W #$0006                                                         ;91D944;
    JSL.L QueueSound_Lib1_Max9                                           ;91D947;
    RTS                                                                  ;91D94B;


.spinning:
    LDA.W #$001C                                                         ;91D94C;
    JSL.L Run_Samus_Command                                              ;91D94F;
    RTS                                                                  ;91D953;


.superSpecial:
    BMI .acquiringHyperBeam                                              ;91D954;
    BIT.W #$0001                                                         ;91D956;
    BEQ .loadPalette2                                                    ;91D959;
    LDX.W $0A74                                                          ;91D95B;
    LDA.W .pointers,X                                                    ;91D95E;
    TAX                                                                  ;91D961;
    JSR.W Load20BytesOfSamusPaletteInX                                   ;91D962;
    BRA .incSuperSpecialFlags                                            ;91D965;


.loadPalette2:
    JSL.L LoadSamusSuitPalette                                           ;91D967;

.incSuperSpecialFlags:
    INC.W $0A4A                                                          ;91D96B;
    RTS                                                                  ;91D96E;


.acquiringHyperBeam:
    LDA.W $0B62                                                          ;91D96F;
    ASL A                                                                ;91D972;
    TAY                                                                  ;91D973;
    LDA.W .hyperBeamPalettes,Y                                           ;91D974;
    TAX                                                                  ;91D977;
    JSR.W Load20BytesOfSamusPaletteInX                                   ;91D978;
    DEC.W $0AD0                                                          ;91D97B;
    BEQ .timerExpired                                                    ;91D97E;
    BPL .returnLower                                                     ;91D980;

.timerExpired:
    LDA.W $0ACE                                                          ;91D982;
    STA.W $0AD0                                                          ;91D985;
    LDA.W $0B62                                                          ;91D988;
    INC A                                                                ;91D98B;
    STA.W $0B62                                                          ;91D98C;
    CMP.W #$000A                                                         ;91D98F;
    BMI .returnLower                                                     ;91D992;
    STZ.W $0B62                                                          ;91D994;

.returnLower:
    RTS                                                                  ;91D997;


.pointers:
    dw SamusPalettes_PowerSuit_SpeedBoosting_BabyMetroidDrain_3          ;91D998;
    dw SamusPalettes_VariaSuit_SpeedBoosting_BabyMetroidDrain_3          ;91D99A;
    dw SamusPalettes_GravitySuit_SpeedBoosting_BabyMetroidDrain_3        ;91D99C;

.hyperBeamPalettes:
    dw SamusPalettes_HyperBeam_9                                         ;91D99E;
    dw SamusPalettes_HyperBeam_8                                         ;91D9A0;
    dw SamusPalettes_HyperBeam_7                                         ;91D9A2;
    dw SamusPalettes_HyperBeam_6                                         ;91D9A4;
    dw SamusPalettes_HyperBeam_5                                         ;91D9A6;
    dw SamusPalettes_HyperBeam_4                                         ;91D9A8;
    dw SamusPalettes_HyperBeam_3                                         ;91D9AA;
    dw SamusPalettes_HyperBeam_2                                         ;91D9AC;
    dw SamusPalettes_HyperBeam_1                                         ;91D9AE;
    dw SamusPalettes_HyperBeam_0                                         ;91D9B0;

Handle_ScrewAttack_SpeedBoosting_Palette:
    LDA.W $0A74                                                          ;91D9B2;
    BIT.W #$0004                                                         ;91D9B5;
    BNE .nonLiquidPhysics                                                ;91D9B8;
    JSL.L Get_Samus_BottomTop_Boundary                                   ;91D9BA;
    LDA.W $195E                                                          ;91D9BE;
    BMI .negativeYPosition                                               ;91D9C1;
    CMP.B $14                                                            ;91D9C3;
    BPL .nonLiquidPhysics                                                ;91D9C5;
    LDA.W $197E                                                          ;91D9C7;
    BIT.W #$0004                                                         ;91D9CA;
    BNE .nonLiquidPhysics                                                ;91D9CD;
    BRA .whyAreWeHere                                                    ;91D9CF;


.negativeYPosition:
    LDA.W $1962                                                          ;91D9D1;
    BMI .nonLiquidPhysics                                                ;91D9D4;
    CMP.B $14                                                            ;91D9D6;
    BMI .whyAreWeHere                                                    ;91D9D8;

.nonLiquidPhysics:
    LDA.W $0A1F                                                          ;91D9DA;
    AND.W #$00FF                                                         ;91D9DD;
    CMP.W #$0003                                                         ;91D9E0;
    BEQ .spinJumping                                                     ;91D9E3;
    CMP.W #$0014                                                         ;91D9E5;
    BEQ .wallJumping                                                     ;91D9E8;

.notScrewAttacking:
    LDA.W $0B3E                                                          ;91D9EA;
    AND.W #$FF00                                                         ;91D9ED;
    CMP.W #$0400                                                         ;91D9F0;
    BEQ .speedBoosting                                                   ;91D9F3;

.whyAreWeHere:
    SEC                                                                  ;91D9F5;
    RTS                                                                  ;91D9F6;


.spinJumping:
    LDA.W $09A2                                                          ;91D9F7;
    BIT.W #$0008                                                         ;91D9FA;
    BEQ .notScrewAttacking                                               ;91D9FD;
    LDA.W $0A96                                                          ;91D9FF;
    BEQ .resetIndex                                                      ;91DA02;
    CMP.W #$001B                                                         ;91DA04;
    BPL .returnNormalPalette                                             ;91DA07;
    BRA .merge                                                           ;91DA09;


.wallJumping:
    LDA.W $09A2                                                          ;91DA0B;
    BIT.W #$0008                                                         ;91DA0E;
    BEQ .returnWallJump                                                  ;91DA11;
    LDA.W $0A96                                                          ;91DA13;
    CMP.W #$0003                                                         ;91DA16;
    BMI .resetIndex                                                      ;91DA19;

.merge:
    LDX.W $0A74                                                          ;91DA1B;
    LDA.W .screwAttackPaletteTablePointers,X                             ;91DA1E;
    STA.B $24                                                            ;91DA21;
    LDA.W $0ACE                                                          ;91DA23;
    CLC                                                                  ;91DA26;
    ADC.B $24                                                            ;91DA27;
    TAX                                                                  ;91DA29;
    LDA.W $0000,X                                                        ;91DA2A;
    TAX                                                                  ;91DA2D;
    JSR.W Load20BytesOfSamusPaletteInX                                   ;91DA2E;
    LDA.W $0ACE                                                          ;91DA31;
    INC A                                                                ;91DA34;
    INC A                                                                ;91DA35;
    CMP.W #$000C                                                         ;91DA36;
    BMI .storeIndex                                                      ;91DA39;
    LDA.W #$0000                                                         ;91DA3B;

.storeIndex:
    STA.W $0ACE                                                          ;91DA3E;
    SEC                                                                  ;91DA41;
    RTS                                                                  ;91DA42;


.resetIndex:
    STZ.W $0ACE                                                          ;91DA43;

.returnWallJump:
    SEC                                                                  ;91DA46;
    RTS                                                                  ;91DA47;


.returnNormalPalette:
    CLC                                                                  ;91DA48;
    RTS                                                                  ;91DA49;


.screwAttackPaletteTablePointers:
    dw ..powerSuit                                                       ;91DA4A;
    dw ..variaSuit                                                       ;91DA4C;
    dw ..gravitySuit                                                     ;91DA4E;

..powerSuit:
    dw SamusPalettes_PowerSuit_ScrewAttack_0                             ;91DA50;
    dw SamusPalettes_PowerSuit_ScrewAttack_1                             ;91DA52;
    dw SamusPalettes_PowerSuit_ScrewAttack_2                             ;91DA54;
    dw SamusPalettes_PowerSuit_ScrewAttack_3                             ;91DA56;
    dw SamusPalettes_PowerSuit_ScrewAttack_2                             ;91DA58;
    dw SamusPalettes_PowerSuit_ScrewAttack_1                             ;91DA5A;

..variaSuit:
    dw SamusPalettes_VariaSuit_ScrewAttack_0                             ;91DA5C;
    dw SamusPalettes_VariaSuit_ScrewAttack_1                             ;91DA5E;
    dw SamusPalettes_VariaSuit_ScrewAttack_2                             ;91DA60;
    dw SamusPalettes_VariaSuit_ScrewAttack_3                             ;91DA62;
    dw SamusPalettes_VariaSuit_ScrewAttack_2                             ;91DA64;
    dw SamusPalettes_VariaSuit_ScrewAttack_1                             ;91DA66;

..gravitySuit:
    dw SamusPalettes_GravitySuit_ScrewAttack_0                           ;91DA68;
    dw SamusPalettes_GravitySuit_ScrewAttack_1                           ;91DA6A;
    dw SamusPalettes_GravitySuit_ScrewAttack_2                           ;91DA6C;
    dw SamusPalettes_GravitySuit_ScrewAttack_3                           ;91DA6E;
    dw SamusPalettes_GravitySuit_ScrewAttack_2                           ;91DA70;
    dw SamusPalettes_GravitySuit_ScrewAttack_1                           ;91DA72;

.speedBoosting:
    DEC.W $0AD0                                                          ;91DA74;
    BEQ .timerExpired                                                    ;91DA77;
    BPL .returnSpeedBooster                                              ;91DA79;

.timerExpired:
    LDA.W #$0004                                                         ;91DA7B;
    STA.W $0AD0                                                          ;91DA7E;
    LDX.W $0A74                                                          ;91DA81;
    LDA.W .speedBoosterPaletteTablePointers,X                            ;91DA84;
    STA.B $24                                                            ;91DA87;
    LDA.W $0ACE                                                          ;91DA89;
    CLC                                                                  ;91DA8C;
    ADC.B $24                                                            ;91DA8D;
    TAX                                                                  ;91DA8F;
    LDA.W $0000,X                                                        ;91DA90;
    TAX                                                                  ;91DA93;
    JSR.W Load20BytesOfSamusPaletteInX                                   ;91DA94;
    LDA.W $0ACE                                                          ;91DA97;
    INC A                                                                ;91DA9A;
    INC A                                                                ;91DA9B;
    CMP.W #$0008                                                         ;91DA9C;
    BMI .storeIndexSpeedBooster                                          ;91DA9F;
    LDA.W #$0006                                                         ;91DAA1;

.storeIndexSpeedBooster:
    STA.W $0ACE                                                          ;91DAA4;

.returnSpeedBooster:
    SEC                                                                  ;91DAA7;
    RTS                                                                  ;91DAA8;


.speedBoosterPaletteTablePointers:
    dw ..powerSuit                                                       ;91DAA9;
    dw ..variaSuit                                                       ;91DAAB;
    dw ..gravitySuit                                                     ;91DAAD;

..powerSuit:
    dw SamusPalettes_PowerSuit_SpeedBoosting_BabyMetroidDrain_0          ;91DAAF;
    dw SamusPalettes_PowerSuit_SpeedBoosting_BabyMetroidDrain_1          ;91DAB1;
    dw SamusPalettes_PowerSuit_SpeedBoosting_BabyMetroidDrain_2          ;91DAB3;
    dw SamusPalettes_PowerSuit_SpeedBoosting_BabyMetroidDrain_3          ;91DAB5;

..variaSuit:
    dw SamusPalettes_VariaSuit_SpeedBoosting_BabyMetroidDrain_0          ;91DAB7;
    dw SamusPalettes_VariaSuit_SpeedBoosting_BabyMetroidDrain_1          ;91DAB9;
    dw SamusPalettes_VariaSuit_SpeedBoosting_BabyMetroidDrain_2          ;91DABB;
    dw SamusPalettes_VariaSuit_SpeedBoosting_BabyMetroidDrain_3          ;91DABD;

..gravitySuit:
    dw SamusPalettes_GravitySuit_SpeedBoosting_BabyMetroidDrain_0        ;91DABF;
    dw SamusPalettes_GravitySuit_SpeedBoosting_BabyMetroidDrain_1        ;91DAC1;
    dw SamusPalettes_GravitySuit_SpeedBoosting_BabyMetroidDrain_2        ;91DAC3;
    dw SamusPalettes_GravitySuit_SpeedBoosting_BabyMetroidDrain_3        ;91DAC5;

HandleSpeedBoosterShinePalette:
    LDA.W $0A68                                                          ;91DAC7;
    CMP.W #$00AA                                                         ;91DACA;
    BNE .notAA                                                           ;91DACD;
    PHA                                                                  ;91DACF;
    LDA.W #$000C                                                         ;91DAD0;
    JSL.L QueueSound_Lib3_Max9                                           ;91DAD3;
    PLA                                                                  ;91DAD7;

.notAA:
    DEC A                                                                ;91DAD8;
    STA.W $0A68                                                          ;91DAD9;
    BEQ .finish                                                          ;91DADC;
    BMI .finish                                                          ;91DADE;
    LDX.W $0A74                                                          ;91DAE0;
    LDA.W .speedBoosterShinePaletteTablePointers,X                       ;91DAE3;
    STA.B $24                                                            ;91DAE6;
    LDA.W $0ACE                                                          ;91DAE8;
    CLC                                                                  ;91DAEB;
    ADC.B $24                                                            ;91DAEC;
    TAX                                                                  ;91DAEE;
    LDA.W $0000,X                                                        ;91DAEF;
    TAX                                                                  ;91DAF2;
    JSR.W Load20BytesOfSamusPaletteInX                                   ;91DAF3;
    LDA.W $0ACE                                                          ;91DAF6;
    INC A                                                                ;91DAF9;
    INC A                                                                ;91DAFA;
    CMP.W #$000C                                                         ;91DAFB;
    BMI .storeIndex                                                      ;91DAFE;
    LDA.W #$0000                                                         ;91DB00;

.storeIndex:
    STA.W $0ACE                                                          ;91DB03;
    SEC                                                                  ;91DB06;
    RTS                                                                  ;91DB07;


.finish:
    STZ.W $0ACE                                                          ;91DB08;
    STZ.W $0ACC                                                          ;91DB0B;
    CLC                                                                  ;91DB0E;
    RTS                                                                  ;91DB0F;


.speedBoosterShinePaletteTablePointers:
    dw ..powerSuit                                                       ;91DB10;
    dw ..variaSuit                                                       ;91DB12;
    dw ..gravitySuit                                                     ;91DB14;

..powerSuit:
    dw SamusPalettes_PowerSuit_SpeedBoosterShine_0                       ;91DB16;
    dw SamusPalettes_PowerSuit_SpeedBoosterShine_1                       ;91DB18;
    dw SamusPalettes_PowerSuit_SpeedBoosterShine_2                       ;91DB1A;
    dw SamusPalettes_PowerSuit_SpeedBoosterShine_3                       ;91DB1C;
    dw SamusPalettes_PowerSuit_SpeedBoosterShine_2                       ;91DB1E;
    dw SamusPalettes_PowerSuit_SpeedBoosterShine_1                       ;91DB20;

..variaSuit:
    dw SamusPalettes_VariaSuit_SpeedBoosterShine_0                       ;91DB22;
    dw SamusPalettes_VariaSuit_SpeedBoosterShine_1                       ;91DB24;
    dw SamusPalettes_VariaSuit_SpeedBoosterShine_2                       ;91DB26;
    dw SamusPalettes_VariaSuit_SpeedBoosterShine_3                       ;91DB28;
    dw SamusPalettes_VariaSuit_SpeedBoosterShine_2                       ;91DB2A;
    dw SamusPalettes_VariaSuit_SpeedBoosterShine_1                       ;91DB2C;

..gravitySuit:
    dw SamusPalettes_GravitySuit_SpeedBoosterShine_0                     ;91DB2E;
    dw SamusPalettes_GravitySuit_SpeedBoosterShine_1                     ;91DB30;
    dw SamusPalettes_GravitySuit_SpeedBoosterShine_2                     ;91DB32;
    dw SamusPalettes_GravitySuit_SpeedBoosterShine_3                     ;91DB34;
    dw SamusPalettes_GravitySuit_SpeedBoosterShine_2                     ;91DB36;
    dw SamusPalettes_GravitySuit_SpeedBoosterShine_1                     ;91DB38;

HandleShinesparkingPalette:
    LDA.W $0A68                                                          ;91DB3A;
    DEC A                                                                ;91DB3D;
    STA.W $0A68                                                          ;91DB3E;
    BEQ .finish                                                          ;91DB41;
    BMI .finish                                                          ;91DB43;
    LDX.W $0A74                                                          ;91DB45;
    LDA.W .shinesparkPaletteTablePointers,X                              ;91DB48;
    STA.B $24                                                            ;91DB4B;
    LDA.W $0ACE                                                          ;91DB4D;
    CLC                                                                  ;91DB50;
    ADC.B $24                                                            ;91DB51;
    TAX                                                                  ;91DB53;
    LDA.W $0000,X                                                        ;91DB54;
    TAX                                                                  ;91DB57;
    JSR.W Load20BytesOfSamusPaletteInX                                   ;91DB58;
    LDA.W $0ACE                                                          ;91DB5B;
    INC A                                                                ;91DB5E;
    INC A                                                                ;91DB5F;
    CMP.W #$0008                                                         ;91DB60;
    BMI .storeIndex                                                      ;91DB63;
    LDA.W #$0000                                                         ;91DB65;

.storeIndex:
    STA.W $0ACE                                                          ;91DB68;
    SEC                                                                  ;91DB6B;
    RTS                                                                  ;91DB6C;


.finish:
    STZ.W $0ACC                                                          ;91DB6D;
    STZ.W $0ACE                                                          ;91DB70;
    CLC                                                                  ;91DB73;
    RTS                                                                  ;91DB74;


.shinesparkPaletteTablePointers:
    dw ..powerSuit                                                       ;91DB75;
    dw ..variaSuit                                                       ;91DB77;
    dw ..gravitySuit                                                     ;91DB79;

..powerSuit:
    dw SamusPalettes_PowerSuit_Shinespark_PseudoScrewAttack_0            ;91DB7B;
    dw SamusPalettes_PowerSuit_Shinespark_PseudoScrewAttack_1            ;91DB7D;
    dw SamusPalettes_PowerSuit_Shinespark_PseudoScrewAttack_2            ;91DB7F;
    dw SamusPalettes_PowerSuit_Shinespark_PseudoScrewAttack_3            ;91DB81;

..variaSuit:
    dw SamusPalettes_VariaSuit_Shinespark_PseudoScrewAttack_0            ;91DB83;
    dw SamusPalettes_VariaSuit_Shinespark_PseudoScrewAttack_1            ;91DB85;
    dw SamusPalettes_VariaSuit_Shinespark_PseudoScrewAttack_2            ;91DB87;
    dw SamusPalettes_VariaSuit_Shinespark_PseudoScrewAttack_3            ;91DB89;

..gravitySuit:
    dw SamusPalettes_GravitySuit_Shinespark_0                            ;91DB8B;
    dw SamusPalettes_GravitySuit_Shinespark_1                            ;91DB8D;
    dw SamusPalettes_GravitySuit_Shinespark_2                            ;91DB8F;
    dw SamusPalettes_GravitySuit_Shinespark_3                            ;91DB91;

HandleCrystalFlashPalette:
    LDA.W $0A68                                                          ;91DB93;
    BMI .finish                                                          ;91DB96;
    DEC A                                                                ;91DB98;
    STA.W $0A68                                                          ;91DB99;
    BEQ .specialPaletteTimerExpired                                      ;91DB9C;
    BPL .bubbleEnd                                                       ;91DB9E;

.specialPaletteTimerExpired:
    LDA.W #$0005                                                         ;91DBA0;
    STA.W $0A68                                                          ;91DBA3;
    LDX.W $0ACE                                                          ;91DBA6;
    LDA.W .bubblePaletteTablePointers,X                                  ;91DBA9;
    TAY                                                                  ;91DBAC;
    JSR.W SetCrystalFlashBubbleColors                                    ;91DBAD;
    LDA.W $0ACE                                                          ;91DBB0;
    INC A                                                                ;91DBB3;
    INC A                                                                ;91DBB4;
    CMP.W #$000C                                                         ;91DBB5;
    BMI .storeIndex                                                      ;91DBB8;
    LDA.W #$0000                                                         ;91DBBA;

.storeIndex:
    STA.W $0ACE                                                          ;91DBBD;

.bubbleEnd:
    DEC.W $0DF2                                                          ;91DBC0;
    BEQ .CFPaletteTimerExpired                                           ;91DBC3;
    BPL .returnCarrySet                                                  ;91DBC5;

.CFPaletteTimerExpired:
    LDX.W $0AD0                                                          ;91DBC7;
    LDA.W .crystalFlashPaletteTable_timers,X                             ;91DBCA;
    STA.W $0DF2                                                          ;91DBCD;
    LDA.W .crystalFlashPaletteTable_pointers,X                           ;91DBD0;
    TAY                                                                  ;91DBD3;
    JSR.W SetCrystalFlashSamusColors                                     ;91DBD4;
    LDA.W $0AD0                                                          ;91DBD7;
    CLC                                                                  ;91DBDA;
    ADC.W #$0004                                                         ;91DBDB;
    CMP.W #$0028                                                         ;91DBDE;
    BMI .storeTimer                                                      ;91DBE1;
    LDA.W #$0000                                                         ;91DBE3;

.storeTimer:
    STA.W $0AD0                                                          ;91DBE6;

.returnCarrySet:
    SEC                                                                  ;91DBE9;
    RTS                                                                  ;91DBEA;


.finish:
    LDA.W $09A6                                                          ;91DBEB;
    JSL.L Load_Beam_Palette_Setup                                        ;91DBEE;
    STZ.W $0ACC                                                          ;91DBF2;
    STZ.W $0ACE                                                          ;91DBF5;
    STZ.W $0AD0                                                          ;91DBF8;
    STZ.W $0A68                                                          ;91DBFB;
    CLC                                                                  ;91DBFE;
    RTS                                                                  ;91DBFF;


.crystalFlashPaletteTable_pointers:
    dw SamusPalettes_CrystalFlash_0                                      ;91DC00;

.crystalFlashPaletteTable_timers:
    dw $000A                                                             ;91DC02;
    dw SamusPalettes_CrystalFlash_1                                      ;91DC04;
    dw $000A                                                             ;91DC06;
    dw SamusPalettes_CrystalFlash_2                                      ;91DC08;
    dw $000A                                                             ;91DC0A;
    dw SamusPalettes_CrystalFlash_3                                      ;91DC0C;
    dw $000A                                                             ;91DC0E;
    dw SamusPalettes_CrystalFlash_4                                      ;91DC10;
    dw $000A                                                             ;91DC12;
    dw SamusPalettes_CrystalFlash_5                                      ;91DC14;
    dw $000A                                                             ;91DC16;
    dw SamusPalettes_CrystalFlash_4                                      ;91DC18;
    dw $000A                                                             ;91DC1A;
    dw SamusPalettes_CrystalFlash_3                                      ;91DC1C;
    dw $000A                                                             ;91DC1E;
    dw SamusPalettes_CrystalFlash_2                                      ;91DC20;
    dw $000A                                                             ;91DC22;
    dw SamusPalettes_CrystalFlash_1                                      ;91DC24;
    dw $000A                                                             ;91DC26;

.bubblePaletteTablePointers:
    dw SamusPalettes_CrystalFlash_0_bubble                               ;91DC28;
    dw SamusPalettes_CrystalFlash_1_bubble                               ;91DC2A;
    dw SamusPalettes_CrystalFlash_2_bubble                               ;91DC2C;
    dw SamusPalettes_CrystalFlash_3_bubble                               ;91DC2E;
    dw SamusPalettes_CrystalFlash_4_bubble                               ;91DC30;
    dw SamusPalettes_CrystalFlash_5_bubble                               ;91DC32;

SetCrystalFlashSamusColors:
    PHB                                                                  ;91DC34;
    PEA.W $9B00                                                          ;91DC35;
    PLB                                                                  ;91DC38;
    PLB                                                                  ;91DC39;
    LDA.W $0000,Y                                                        ;91DC3A;
    STA.L $7EC1C0                                                        ;91DC3D;
    LDA.W $0002,Y                                                        ;91DC41;
    STA.L $7EC1C2                                                        ;91DC44;
    LDA.W $0004,Y                                                        ;91DC48;
    STA.L $7EC1C4                                                        ;91DC4B;
    LDA.W $0006,Y                                                        ;91DC4F;
    STA.L $7EC1C6                                                        ;91DC52;
    LDA.W $0008,Y                                                        ;91DC56;
    STA.L $7EC1C8                                                        ;91DC59;
    LDA.W $000A,Y                                                        ;91DC5D;
    STA.L $7EC1CA                                                        ;91DC60;
    LDA.W $000C,Y                                                        ;91DC64;
    STA.L $7EC1CC                                                        ;91DC67;
    LDA.W $000E,Y                                                        ;91DC6B;
    STA.L $7EC1CE                                                        ;91DC6E;
    LDA.W $0010,Y                                                        ;91DC72;
    STA.L $7EC1D0                                                        ;91DC75;
    LDA.W $0012,Y                                                        ;91DC79;
    STA.L $7EC1D2                                                        ;91DC7C;
    PLB                                                                  ;91DC80;
    RTS                                                                  ;91DC81;


SetCrystalFlashBubbleColors:
    PHB                                                                  ;91DC82;
    PEA.W $9B00                                                          ;91DC83;
    PLB                                                                  ;91DC86;
    PLB                                                                  ;91DC87;
    LDA.W $0000,Y                                                        ;91DC88;
    STA.L $7EC1D4                                                        ;91DC8B;
    LDA.W $0002,Y                                                        ;91DC8F;
    STA.L $7EC1D6                                                        ;91DC92;
    LDA.W $0004,Y                                                        ;91DC96;
    STA.L $7EC1D8                                                        ;91DC99;
    LDA.W $0006,Y                                                        ;91DC9D;
    STA.L $7EC1DA                                                        ;91DCA0;
    LDA.W $0008,Y                                                        ;91DCA4;
    STA.L $7EC1DC                                                        ;91DCA7;
    LDA.W $000A,Y                                                        ;91DCAB;
    STA.L $7EC1DE                                                        ;91DCAE;
    PLB                                                                  ;91DCB2;
    RTS                                                                  ;91DCB3;


HandleXrayPalette:
    LDA.W $0A80                                                          ;91DCB4;
    BMI .finish                                                          ;91DCB7;
    BNE .paletteSet                                                      ;91DCB9;
    LDA.W $0A7A                                                          ;91DCBB;
    CMP.W #$0002                                                         ;91DCBE;
    BPL .notWidening                                                     ;91DCC1;
    DEC.W $0AD0                                                          ;91DCC3;
    BEQ .timerExpired                                                    ;91DCC6;
    BPL .returnCarrySet                                                  ;91DCC8;

.timerExpired:
    LDA.W #$0005                                                         ;91DCCA;
    STA.W $0AD0                                                          ;91DCCD;
    LDX.W $0ACE                                                          ;91DCD0;
    LDA.L SamusPalettes_Visor,X                                          ;91DCD3;
    STA.L $7EC188                                                        ;91DCD7;
    LDA.W $0ACE                                                          ;91DCDB;
    CMP.W #$0004                                                         ;91DCDE;
    BPL .returnCarrySet                                                  ;91DCE1;
    INC A                                                                ;91DCE3;
    INC A                                                                ;91DCE4;
    STA.W $0ACE                                                          ;91DCE5;

.returnCarrySet:
    SEC                                                                  ;91DCE8;
    RTS                                                                  ;91DCE9;


.notWidening:
    LDA.W #$0006                                                         ;91DCEA;
    STA.W $0ACE                                                          ;91DCED;
    LDA.W #$0001                                                         ;91DCF0;
    STA.W $0AD0                                                          ;91DCF3;
    STA.W $0A80                                                          ;91DCF6;

.paletteSet:
    DEC.W $0AD0                                                          ;91DCF9;
    BEQ .resetTimer                                                      ;91DCFC;
    BPL .returnCarrySet                                                  ;91DCFE;

.resetTimer:
    LDA.W #$0005                                                         ;91DD00;
    STA.W $0AD0                                                          ;91DD03;
    LDX.W $0ACE                                                          ;91DD06;
    LDA.L SamusPalettes_Visor,X                                          ;91DD09;
    STA.L $7EC188                                                        ;91DD0D;
    LDA.W $0ACE                                                          ;91DD11;
    INC A                                                                ;91DD14;
    INC A                                                                ;91DD15;
    CMP.W #$000C                                                         ;91DD16;
    BMI .storeIndex                                                      ;91DD19;
    LDA.W #$0006                                                         ;91DD1B;

.storeIndex:
    STA.W $0ACE                                                          ;91DD1E;
    SEC                                                                  ;91DD21;
    RTS                                                                  ;91DD22;


.finish:
    STZ.W $0ACC                                                          ;91DD23;
    STZ.W $0ACE                                                          ;91DD26;
    STZ.W $0AD0                                                          ;91DD29;
    STZ.W $0A80                                                          ;91DD2C;
    CLC                                                                  ;91DD2F;
    RTS                                                                  ;91DD30;


RTS_91DD31:
    RTS                                                                  ;91DD31;


if !FEATURE_KEEP_UNREFERENCED
UNUSED_91DD32:
    db $01,$00,$00,$01,$00,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00   ;91DD32;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00                           ;91DD42;

UNUSED_SetSamusPaletteToSolidWhite_91DD4C:
    PHP                                                                  ;91DD4C;
    PHB                                                                  ;91DD4D;
    PHK                                                                  ;91DD4E;
    PLB                                                                  ;91DD4F;
    REP #$30                                                             ;91DD50;
    LDX.W #UNUSED_SamusPalettes_9B9500                                   ;91DD52;
    JSR.W Load20BytesOfSamusPaletteInX                                   ;91DD55;
    PLB                                                                  ;91DD58;
    PLP                                                                  ;91DD59;
    RTL                                                                  ;91DD5A;
endif ; !FEATURE_KEEP_UNREFERENCED


Load20BytesOfSamusPaletteInX:
    PHP                                                                  ;91DD5B;
    REP #$30                                                             ;91DD5C;
    PHB                                                                  ;91DD5E;
    PEA.W $9B00                                                          ;91DD5F;
    PLB                                                                  ;91DD62;
    PLB                                                                  ;91DD63;
    LDA.W $0000,X                                                        ;91DD64;
    STA.L $7EC180                                                        ;91DD67;
    LDA.W $0002,X                                                        ;91DD6B;
    STA.L $7EC182                                                        ;91DD6E;
    LDA.W $0004,X                                                        ;91DD72;
    STA.L $7EC184                                                        ;91DD75;
    LDA.W $0006,X                                                        ;91DD79;
    STA.L $7EC186                                                        ;91DD7C;
    LDA.W $0008,X                                                        ;91DD80;
    STA.L $7EC188                                                        ;91DD83;
    LDA.W $000A,X                                                        ;91DD87;
    STA.L $7EC18A                                                        ;91DD8A;
    LDA.W $000C,X                                                        ;91DD8E;
    STA.L $7EC18C                                                        ;91DD91;
    LDA.W $000E,X                                                        ;91DD95;
    STA.L $7EC18E                                                        ;91DD98;
    LDA.W $0010,X                                                        ;91DD9C;
    STA.L $7EC190                                                        ;91DD9F;
    LDA.W $0012,X                                                        ;91DDA3;
    STA.L $7EC192                                                        ;91DDA6;
    LDA.W $0014,X                                                        ;91DDAA;
    STA.L $7EC194                                                        ;91DDAD;
    LDA.W $0016,X                                                        ;91DDB1;
    STA.L $7EC196                                                        ;91DDB4;
    LDA.W $0018,X                                                        ;91DDB8;
    STA.L $7EC198                                                        ;91DDBB;
    LDA.W $001A,X                                                        ;91DDBF;
    STA.L $7EC19A                                                        ;91DDC2;
    LDA.W $001C,X                                                        ;91DDC6;
    STA.L $7EC19C                                                        ;91DDC9;
    LDA.W $001E,X                                                        ;91DDCD;
    STA.L $7EC19E                                                        ;91DDD0;
    PLB                                                                  ;91DDD4;
    PLP                                                                  ;91DDD5;
    RTS                                                                  ;91DDD6;


Load20BytesOfSamusTargetPaletteInX:
    PHP                                                                  ;91DDD7;
    REP #$30                                                             ;91DDD8;
    PHB                                                                  ;91DDDA;
    PEA.W $9B00                                                          ;91DDDB;
    PLB                                                                  ;91DDDE;
    PLB                                                                  ;91DDDF;
    LDA.W $0000,X                                                        ;91DDE0;
    STA.L $7EC380                                                        ;91DDE3;
    LDA.W $0002,X                                                        ;91DDE7;
    STA.L $7EC382                                                        ;91DDEA;
    LDA.W $0004,X                                                        ;91DDEE;
    STA.L $7EC384                                                        ;91DDF1;
    LDA.W $0006,X                                                        ;91DDF5;
    STA.L $7EC386                                                        ;91DDF8;
    LDA.W $0008,X                                                        ;91DDFC;
    STA.L $7EC388                                                        ;91DDFF;
    LDA.W $000A,X                                                        ;91DE03;
    STA.L $7EC38A                                                        ;91DE06;
    LDA.W $000C,X                                                        ;91DE0A;
    STA.L $7EC38C                                                        ;91DE0D;
    LDA.W $000E,X                                                        ;91DE11;
    STA.L $7EC38E                                                        ;91DE14;
    LDA.W $0010,X                                                        ;91DE18;
    STA.L $7EC390                                                        ;91DE1B;
    LDA.W $0012,X                                                        ;91DE1F;
    STA.L $7EC392                                                        ;91DE22;
    LDA.W $0014,X                                                        ;91DE26;
    STA.L $7EC394                                                        ;91DE29;
    LDA.W $0016,X                                                        ;91DE2D;
    STA.L $7EC396                                                        ;91DE30;
    LDA.W $0018,X                                                        ;91DE34;
    STA.L $7EC398                                                        ;91DE37;
    LDA.W $001A,X                                                        ;91DE3B;
    STA.L $7EC39A                                                        ;91DE3E;
    LDA.W $001C,X                                                        ;91DE42;
    STA.L $7EC39C                                                        ;91DE45;
    LDA.W $001E,X                                                        ;91DE49;
    STA.L $7EC39E                                                        ;91DE4C;
    PLB                                                                  ;91DE50;
    PLP                                                                  ;91DE51;
    RTS                                                                  ;91DE52;


Cancel_SpeedBoosting:
    PHP                                                                  ;91DE53;
    PHB                                                                  ;91DE54;
    PHK                                                                  ;91DE55;
    PLB                                                                  ;91DE56;
    REP #$30                                                             ;91DE57;
    LDA.W $0B3C                                                          ;91DE59;
    BEQ .merge                                                           ;91DE5C;
    STZ.W $0B3C                                                          ;91DE5E;
    STZ.W $0B3E                                                          ;91DE61;
    STZ.W $0ACE                                                          ;91DE64;
    STZ.W $0AD0                                                          ;91DE67;
    LDA.W $09A2                                                          ;91DE6A;
    BIT.W #$0020                                                         ;91DE6D;
    BNE .gravity                                                         ;91DE70;
    BIT.W #$0001                                                         ;91DE72;
    BNE .varia                                                           ;91DE75;
    LDX.W #SamusPalettes_PowerSuit                                       ;91DE77;
    JSR.W Load20BytesOfSamusPaletteInX                                   ;91DE7A;
    BRA .merge                                                           ;91DE7D;


.varia:
    LDX.W #SamusPalettes_VariaSuit                                       ;91DE7F;
    JSR.W Load20BytesOfSamusPaletteInX                                   ;91DE82;
    BRA .merge                                                           ;91DE85;


.gravity:
    LDX.W #SamusPalettes_GravitySuit                                     ;91DE87;
    JSR.W Load20BytesOfSamusPaletteInX                                   ;91DE8A;

.merge:
    LDA.W $0AAE                                                          ;91DE8D;
    BMI .return                                                          ;91DE90;
    LDA.W #$FFFF                                                         ;91DE92;
    STA.W $0AAE                                                          ;91DE95;
    LDA.W $0A1E                                                          ;91DE98;
    AND.W #$00FF                                                         ;91DE9B;
    CMP.W #$0004                                                         ;91DE9E;
    BEQ .negative8                                                       ;91DEA1;
    LDA.W #$0008                                                         ;91DEA3;
    STA.W $0AC0                                                          ;91DEA6;
    STA.W $0AC2                                                          ;91DEA9;
    BRA .return                                                          ;91DEAC;


.negative8:
    LDA.W #$FFF8                                                         ;91DEAE;
    STA.W $0AC0                                                          ;91DEB1;
    STA.W $0AC2                                                          ;91DEB4;

.return:
    PLB                                                                  ;91DEB7;
    PLP                                                                  ;91DEB8;
    RTL                                                                  ;91DEB9;


LoadSamusSuitPalette:
    PHP                                                                  ;91DEBA;
    PHB                                                                  ;91DEBB;
    PHK                                                                  ;91DEBC;
    PLB                                                                  ;91DEBD;
    REP #$30                                                             ;91DEBE;
    LDA.W $09A2                                                          ;91DEC0;
    BIT.W #$0020                                                         ;91DEC3;
    BNE .gravitySuit                                                     ;91DEC6;
    BIT.W #$0001                                                         ;91DEC8;
    BNE .variaSuit                                                       ;91DECB;
    LDX.W #SamusPalettes_PowerSuit                                       ;91DECD;
    JSR.W Load20BytesOfSamusPaletteInX                                   ;91DED0;
    BRA .return                                                          ;91DED3;


.variaSuit:
    LDX.W #SamusPalettes_VariaSuit                                       ;91DED5;
    JSR.W Load20BytesOfSamusPaletteInX                                   ;91DED8;
    BRA .return                                                          ;91DEDB;


.gravitySuit:
    LDX.W #SamusPalettes_GravitySuit                                     ;91DEDD;
    JSR.W Load20BytesOfSamusPaletteInX                                   ;91DEE0;

.return:
    PLB                                                                  ;91DEE3;
    PLP                                                                  ;91DEE4;
    RTL                                                                  ;91DEE5;


LoadSamusSuitTargetPalette:
    PHP                                                                  ;91DEE6;
    PHB                                                                  ;91DEE7;
    PHK                                                                  ;91DEE8;
    PLB                                                                  ;91DEE9;
    REP #$30                                                             ;91DEEA;
    LDA.W $09A2                                                          ;91DEEC;
    BIT.W #$0020                                                         ;91DEEF;
    BNE .gravitySuit                                                     ;91DEF2;
    BIT.W #$0001                                                         ;91DEF4;
    BNE .variaSuit                                                       ;91DEF7;
    LDX.W #SamusPalettes_PowerSuit                                       ;91DEF9;
    JSR.W Load20BytesOfSamusTargetPaletteInX                             ;91DEFC;
    BRA .return                                                          ;91DEFF;


.variaSuit:
    LDX.W #SamusPalettes_VariaSuit                                       ;91DF01;
    JSR.W Load20BytesOfSamusTargetPaletteInX                             ;91DF04;
    BRA .return                                                          ;91DF07;


.gravitySuit:
    LDX.W #SamusPalettes_GravitySuit                                     ;91DF09;
    JSR.W Load20BytesOfSamusTargetPaletteInX                             ;91DF0C;

.return:
    PLB                                                                  ;91DF0F;
    PLP                                                                  ;91DF10;
    RTL                                                                  ;91DF11;


Restore_A_Energy_ToSamus:
    PHP                                                                  ;91DF12;
    PHB                                                                  ;91DF13;
    PHK                                                                  ;91DF14;
    PLB                                                                  ;91DF15;
    REP #$30                                                             ;91DF16;
    STA.B $12                                                            ;91DF18;
    LDA.W $09C2                                                          ;91DF1A;
    CLC                                                                  ;91DF1D;
    ADC.B $12                                                            ;91DF1E;
    STA.W $09C2                                                          ;91DF20;
    CMP.W $09C4                                                          ;91DF23;
    BMI .return                                                          ;91DF26;
    SEC                                                                  ;91DF28;
    SBC.W $09C4                                                          ;91DF29;
    CLC                                                                  ;91DF2C;
    ADC.W $09D6                                                          ;91DF2D;
    CMP.W $09D4                                                          ;91DF30;
    BMI .maxReserve                                                      ;91DF33;
    LDA.W $09D4                                                          ;91DF35;

.maxReserve:
    STA.W $09D6                                                          ;91DF38;
    BEQ .maxEnergy                                                       ;91DF3B;
    LDA.W $09C0                                                          ;91DF3D;
    BNE .maxEnergy                                                       ;91DF40;
    LDA.W #$0001                                                         ;91DF42;
    STA.W $09C0                                                          ;91DF45;

.maxEnergy:
    LDA.W $09C4                                                          ;91DF48;
    STA.W $09C2                                                          ;91DF4B;

.return:
    PLB                                                                  ;91DF4E;
    PLP                                                                  ;91DF4F;
    RTL                                                                  ;91DF50;


Deal_A_Damage_to_Samus:
    PHP                                                                  ;91DF51;
    PHB                                                                  ;91DF52;
    PHK                                                                  ;91DF53;
    PLB                                                                  ;91DF54;
    REP #$30                                                             ;91DF55;
    PHX                                                                  ;91DF57;
    STA.B $12                                                            ;91DF58;
    TAX                                                                  ;91DF5A;
    BPL .noCrash                                                         ;91DF5B;
    JML.L Crash_Handler                                                  ;91DF5D;


.noCrash:
    CMP.W #$012C                                                         ;91DF61;
    BEQ .noDamage                                                        ;91DF64;
    LDA.W $0A78                                                          ;91DF66;
    BNE .return                                                          ;91DF69;
    LDA.W $09C2                                                          ;91DF6B;
    SEC                                                                  ;91DF6E;
    SBC.B $12                                                            ;91DF6F;
    STA.W $09C2                                                          ;91DF71;
    BPL .return                                                          ;91DF74;
    STZ.W $09C2                                                          ;91DF76;

.return:
    PLX                                                                  ;91DF79;
    PLB                                                                  ;91DF7A;
    PLP                                                                  ;91DF7B;
    RTL                                                                  ;91DF7C;


.noDamage:
    NOP                                                                  ;91DF7D; >.<
    BRA .return                                                          ;91DF7E;


Restore_A_Missiles_ToSamus:
    PHP                                                                  ;91DF80;
    PHB                                                                  ;91DF81;
    PHK                                                                  ;91DF82;
    PLB                                                                  ;91DF83;
    REP #$30                                                             ;91DF84;
    CLC                                                                  ;91DF86;
    ADC.W $09C6                                                          ;91DF87;
    STA.W $09C6                                                          ;91DF8A;
    CMP.W $09C8                                                          ;91DF8D;
    BMI .return                                                          ;91DF90;
    SEC                                                                  ;91DF92;
    SBC.W $09C8                                                          ;91DF93;
    STA.B $12                                                            ;91DF96;
    LDA.W $09C8                                                          ;91DF98;
    CMP.W #$0063                                                         ;91DF9B;
    BMI .lessThan99                                                      ;91DF9E;
    LDA.B $12                                                            ;91DFA0;
    CLC                                                                  ;91DFA2;
    ADC.W $09D8                                                          ;91DFA3;
    STA.W $09D8                                                          ;91DFA6;
    CMP.W #$0063                                                         ;91DFA9;
    BMI .maxMissiles                                                     ;91DFAC;
    LDA.W #$0063                                                         ;91DFAE;
    STA.W $09D8                                                          ;91DFB1;
    BRA .maxMissiles                                                     ;91DFB4;


.lessThan99:
    LDA.B $12                                                            ;91DFB6;
    CLC                                                                  ;91DFB8;
    ADC.W $09D8                                                          ;91DFB9;
    STA.W $09D8                                                          ;91DFBC;
    CMP.W $09C8                                                          ;91DFBF;
    BMI .maxMissiles                                                     ;91DFC2;
    LDA.W $09C8                                                          ;91DFC4;
    STA.W $09D8                                                          ;91DFC7;

.maxMissiles:
    LDA.W $09C8                                                          ;91DFCA;
    STA.W $09C6                                                          ;91DFCD;

.return:
    PLB                                                                  ;91DFD0;
    PLP                                                                  ;91DFD1;
    RTL                                                                  ;91DFD2;


Restore_A_SuperMissiles_ToSamus:
    PHP                                                                  ;91DFD3;
    PHB                                                                  ;91DFD4;
    PHK                                                                  ;91DFD5;
    PLB                                                                  ;91DFD6;
    REP #$30                                                             ;91DFD7;
    CLC                                                                  ;91DFD9;
    ADC.W $09CA                                                          ;91DFDA;
    STA.W $09CA                                                          ;91DFDD;
    CMP.W $09CC                                                          ;91DFE0;
    BMI .return                                                          ;91DFE3;
    BEQ .return                                                          ;91DFE5;
    LDA.W $09CC                                                          ;91DFE7;
    STA.W $09CA                                                          ;91DFEA;

.return:
    PLB                                                                  ;91DFED;
    PLP                                                                  ;91DFEE;
    RTL                                                                  ;91DFEF;


Restore_A_PowerBombs_ToSamus:
    PHP                                                                  ;91DFF0;
    PHB                                                                  ;91DFF1;
    PHK                                                                  ;91DFF2;
    PLB                                                                  ;91DFF3;
    REP #$30                                                             ;91DFF4;
    CLC                                                                  ;91DFF6;
    ADC.W $09CE                                                          ;91DFF7;
    STA.W $09CE                                                          ;91DFFA;
    CMP.W $09D0                                                          ;91DFFD;
    BMI .return                                                          ;91E000;
    BEQ .return                                                          ;91E002;
    LDA.W $09D0                                                          ;91E004;
    STA.W $09CE                                                          ;91E007;

.return:
    PLB                                                                  ;91E00A;
    PLP                                                                  ;91E00B;
    RTL                                                                  ;91E00C;


InitializeSamus:
    PHP                                                                  ;91E00D;
    PHB                                                                  ;91E00E;
    PHK                                                                  ;91E00F;
    PLB                                                                  ;91E010;
    REP #$30                                                             ;91E011;
    LDA.W $0DE0                                                          ;91E013;
    STA.B $12                                                            ;91E016;
    LDX.W #$0E0B                                                         ;91E018;
    SEP #$20                                                             ;91E01B;
    LDA.B #$00                                                           ;91E01D;

.loopClearSamusRAM:
    STA.W $0000,X                                                        ;91E01F;
    DEX                                                                  ;91E022;
    CPX.W #$0A02                                                         ;91E023;
    BPL .loopClearSamusRAM                                               ;91E026;
    REP #$20                                                             ;91E028;
    LDA.W $0998                                                          ;91E02A;
    CMP.W #$0028                                                         ;91E02D;
    BEQ .demo                                                            ;91E030;
    LDA.L $7ED914                                                        ;91E032;
    CMP.W #$0022                                                         ;91E036;
    BNE .notZebesLanding                                                 ;91E039;
    LDA.W #RTL_90E8CD                                                    ;91E03B;
    STA.W $0A42                                                          ;91E03E;
    LDA.W #SamusNewStateHandler_SamusIsLocked                            ;91E041;
    STA.W $0A44                                                          ;91E044;
    LDA.W #SamusDrawingHandler_Default                                   ;91E047;
    STA.W $0A5C                                                          ;91E04A;
    LDA.W #$FFFF                                                         ;91E04D;
    STA.W $0A2E                                                          ;91E050;
    STZ.W $0A30                                                          ;91E053;
    STZ.W $0A32                                                          ;91E056;
    JSL.L LoadSamusSuitPalette                                           ;91E059;
    LDA.W #SamusPoseInputHandler_Normal                                  ;91E05D;
    STA.W $0A60                                                          ;91E060;
    BRA .demo                                                            ;91E063;


.notZebesLanding:
    LDA.W #RTL_90E8CD                                                    ;91E065;
    STA.W $0A42                                                          ;91E068;
    LDA.W #SamusNewStateHandler_SamusAppearance                          ;91E06B;
    STA.W $0A44                                                          ;91E06E;
    LDA.W #SamusDrawingHandler_Default                                   ;91E071;
    STA.W $0A5C                                                          ;91E074;
    STZ.W $0A2E                                                          ;91E077;
    STZ.W $0A30                                                          ;91E07A;
    STZ.W $0A32                                                          ;91E07D;
    LDA.W #SamusPoseInputHandler_Normal                                  ;91E080;
    STA.W $0A60                                                          ;91E083;
    LDA.B $12                                                            ;91E086;
    STA.W $0DE0                                                          ;91E088;

.demo:
    LDA.W #$FFFF                                                         ;91E08B;
    STA.W $0A28                                                          ;91E08E;
    STA.W $0A2A                                                          ;91E091;
    STA.W $0A2C                                                          ;91E094;
    LDA.W $079F                                                          ;91E097;
    CMP.W #$0006                                                         ;91E09A;
    BNE .notCeres                                                        ;91E09D;
    LDA.W #SamusTimerHackHandler_HandleTimer                             ;91E09F;
    STA.W $0A5A                                                          ;91E0A2;
    BRA +                                                                ;91E0A5;


.notCeres:
    LDA.W #RTS_90E90E                                                    ;91E0A7;
    STA.W $0A5A                                                          ;91E0AA;

  + LDA.W #SamusMovementHandler_Normal                                   ;91E0AD;
    STA.W $0A58                                                          ;91E0B0;
    LDA.W #RTS_90F534                                                    ;91E0B3;
    STA.W $0A5E                                                          ;91E0B6;
    LDA.W #$0032                                                         ;91E0B9;
    STA.W $0A12                                                          ;91E0BC;
    LDA.W #$0601                                                         ;91E0BF;
    STA.W $0A72                                                          ;91E0C2;
    LDX.W #$0000                                                         ;91E0C5;

.loopProjectilePreInstructions:
    LDA.W #RTS_90B169                                                    ;91E0C8;
    STA.W $0C68,X                                                        ;91E0CB;
    INX                                                                  ;91E0CE;
    INX                                                                  ;91E0CF;
    CPX.W #$0014                                                         ;91E0D0;
    BMI .loopProjectilePreInstructions                                   ;91E0D3;
    LDA.W #GrappleBeamFunction_Inactive                                  ;91E0D5;
    STA.W $0D32                                                          ;91E0D8;
    LDA.W #$0003                                                         ;91E0DB;
    STA.W $0A46                                                          ;91E0DE;
    STZ.W $0A48                                                          ;91E0E1;
    STZ.W $0A4A                                                          ;91E0E4;
    LDA.L SamusPhysicsConstants_CameraXSubOffsetFromSamusWhenTurning     ;91E0E7;
    STA.W $0DA4                                                          ;91E0EB;
    LDA.L SamusPhysicsConstants_CameraXOffsetFromSamusWhenTurning        ;91E0EE;
    STA.W $0DA2                                                          ;91E0F2;
    LDA.L SamusPhysicsConstants_CameraYSubOffsetFromSamusWhenTurning     ;91E0F5;
    STA.W $0DA8                                                          ;91E0F9;
    LDA.L SamusPhysicsConstants_CameraYOffsetFromSamusWhenTurning        ;91E0FC;
    STA.W $0DA6                                                          ;91E100;
    LDX.W #$01FE                                                         ;91E103;
    LDA.W #$00FF                                                         ;91E106;

.loopSamusHDMATables:
    STA.L $7E9800,X                                                      ;91E109;
    DEX                                                                  ;91E10D;
    DEX                                                                  ;91E10E;
    BPL .loopSamusHDMATables                                             ;91E10F;
    LDA.L SamusPhysicsConstants_YSubAccelerationInAir                    ;91E111;
    STA.W $0B32                                                          ;91E115;
    LDA.L SamusPhysicsConstants_YAccelerationInAir                       ;91E118;
    STA.W $0B34                                                          ;91E11C;
    LDA.W #$FFFF                                                         ;91E11F;
    STA.W $195E                                                          ;91E122;
    STA.W $1962                                                          ;91E125;
    JSL.L Update_Beam_Tiles_and_Palette                                  ;91E128;
    STZ.W $1F51                                                          ;91E12C;
    STZ.W $0A1C                                                          ;91E12F;
    STZ.W $0A1E                                                          ;91E132;
    STZ.W $0A20                                                          ;91E135;
    STZ.W $0A22                                                          ;91E138;
    STZ.W $0A24                                                          ;91E13B;
    STZ.W $0A26                                                          ;91E13E;
    LDA.W #$FFFF                                                         ;91E141;
    STA.W $0E1C                                                          ;91E144;
    STZ.W $09D2                                                          ;91E147;
    STZ.W $0A04                                                          ;91E14A;
    STZ.W $18A8                                                          ;91E14D;
    STZ.W $18AA                                                          ;91E150;
    STZ.W $0A48                                                          ;91E153;
    STZ.W $0DE0                                                          ;91E156;
    LDA.W $0998                                                          ;91E159;
    CMP.W #$0028                                                         ;91E15C;
    BNE .notDemo                                                         ;91E15F;
    JSR.W LoadDemoData                                                   ;91E161;

.notDemo:
    LDA.W $09C2                                                          ;91E164;
    STA.W $0A12                                                          ;91E167;
    PLB                                                                  ;91E16A;
    PLP                                                                  ;91E16B;
    RTL                                                                  ;91E16C;


XraySetup:
    PHP                                                                  ;91E16D;
    PHB                                                                  ;91E16E;
    PHK                                                                  ;91E16F;
    PLB                                                                  ;91E170;
    REP #$30                                                             ;91E171;
    LDA.W $0CCC                                                          ;91E173;
    CMP.W #$0007                                                         ;91E176;
    BNE +                                                                ;91E179;
    LDA.W $0CD2                                                          ;91E17B;
    CMP.W #$0005                                                         ;91E17E;
    BNE +                                                                ;91E181;
    LDA.W $0A66                                                          ;91E183;
    CMP.W #$0002                                                         ;91E186;
    BEQ .returnCarryClear                                                ;91E189;

  + LDA.W $0A1C                                                          ;91E18B;
    CMP.W #$00A4                                                         ;91E18E;
    BMI .notLanding                                                      ;91E191;
    CMP.W #$00A8                                                         ;91E193;
    BMI .returnCarryClear                                                ;91E196;
    CMP.W #$00E0                                                         ;91E198;
    BMI .notLanding                                                      ;91E19B;
    CMP.W #$00E8                                                         ;91E19D;
    BMI .returnCarryClear                                                ;91E1A0;

.notLanding:
    LDA.W $0998                                                          ;91E1A2;
    CMP.W #$0008                                                         ;91E1A5;
    BNE .returnCarryClear                                                ;91E1A8;
    LDA.W $0592                                                          ;91E1AA;
    BNE .returnCarryClear                                                ;91E1AD;
    LDA.W $0B2E                                                          ;91E1AF;
    BNE .returnCarryClear                                                ;91E1B2;
    LDA.W $0B2C                                                          ;91E1B4;
    BNE .returnCarryClear                                                ;91E1B7;
    LDA.W $0A11                                                          ;91E1B9;
    AND.W #$00FF                                                         ;91E1BC;
    TAX                                                                  ;91E1BF;
    LDA.W .allowedPoses,X                                                ;91E1C0;
    AND.W #$00FF                                                         ;91E1C3;
    BEQ .returnCarryClear                                                ;91E1C6;
    LDA.W $0A1F                                                          ;91E1C8;
    AND.W #$00FF                                                         ;91E1CB;
    TAX                                                                  ;91E1CE;
    LDA.W .allowedPoses,X                                                ;91E1CF;
    AND.W #$00FF                                                         ;91E1D2;
    CMP.W #$0001                                                         ;91E1D5;
    BEQ .standing                                                        ;91E1D8;
    CMP.W #$0002                                                         ;91E1DA;
    BEQ .crouching                                                       ;91E1DD;

.returnCarryClear:
    PLB                                                                  ;91E1DF;
    PLP                                                                  ;91E1E0;
    CLC                                                                  ;91E1E1;
    RTL                                                                  ;91E1E2;


.standing:
    LDA.W $0A1E                                                          ;91E1E3;
    AND.W #$00FF                                                         ;91E1E6;
    CMP.W #$0004                                                         ;91E1E9;
    BEQ .standingLeft                                                    ;91E1EC;
    LDA.W #$00D5                                                         ;91E1EE;
    STA.W $0A2A                                                          ;91E1F1;
    BRA .merge                                                           ;91E1F4;


.standingLeft:
    LDA.W #$00D6                                                         ;91E1F6;
    STA.W $0A2A                                                          ;91E1F9;
    BRA .merge                                                           ;91E1FC;


.crouching:
    LDA.W $0A1E                                                          ;91E1FE;
    AND.W #$00FF                                                         ;91E201;
    CMP.W #$0004                                                         ;91E204;
    BEQ .crouchingLeft                                                   ;91E207;
    LDA.W #$00D9                                                         ;91E209;
    STA.W $0A2A                                                          ;91E20C;
    BRA .merge                                                           ;91E20F;


.crouchingLeft:
    LDA.W #$00DA                                                         ;91E211;
    STA.W $0A2A                                                          ;91E214;

.merge:
    LDA.W #$0001                                                         ;91E217;
    STA.W $0A78                                                          ;91E21A;
    LDA.W #$0005                                                         ;91E21D;
    STA.W $0A30                                                          ;91E220;
    LDX.W #$01FE                                                         ;91E223;

.loop:
    LDA.W #$00FF                                                         ;91E226;
    STA.L $7E9800,X                                                      ;91E229;
    DEX                                                                  ;91E22D;
    DEX                                                                  ;91E22E;
    BPL .loop                                                            ;91E22F;
    JSL.L Disable_Enemy_Projectiles                                      ;91E231;
    JSL.L Disable_PLMs                                                   ;91E235;
    JSL.L Disable_AnimatedTilesObjects                                   ;91E239;
    JSL.L Disable_PaletteFXObjects                                       ;91E23D;
    LDA.W #$0001                                                         ;91E241;
    STA.W $0A88                                                          ;91E244;
    LDA.W #$9800                                                         ;91E247; $7E
    STA.W $0A89                                                          ;91E24A;
    STZ.W $0A8B                                                          ;91E24D;
    LDA.W #$98C8                                                         ;91E250; $7E
    STA.W $0A8C                                                          ;91E253;
    LDA.W #$0098                                                         ;91E256;
    STA.W $0A8E                                                          ;91E259;
    LDA.W #$9990                                                         ;91E25C; $7E
    STA.W $0A8F                                                          ;91E25F;
    STZ.W $0A91                                                          ;91E262;
    STZ.W $0A7A                                                          ;91E265;
    STZ.W $0A7C                                                          ;91E268;
    STZ.W $0A7E                                                          ;91E26B;
    STZ.W $0A84                                                          ;91E26E;
    STZ.W $0A86                                                          ;91E271;
    LDA.W $0A1E                                                          ;91E274;
    AND.W #$00FF                                                         ;91E277;
    CMP.W #$0004                                                         ;91E27A;
    BEQ +                                                                ;91E27D;
    LDA.W #$0040                                                         ;91E27F;
    STA.W $0A82                                                          ;91E282;
    BRA .returnCarrySet                                                  ;91E285;


  + LDA.W #$00C0                                                         ;91E287;

.facingLeft:
    STA.W $0A82                                                          ;91E28A;

.returnCarrySet:
    PLB                                                                  ;91E28D;
    PLP                                                                  ;91E28E;
    SEC                                                                  ;91E28F;
    RTL                                                                  ;91E290;


.allowedPoses:
    db $01,$01,$00,$00,$00,$02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;91E291;
    db $00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$00,$00                   ;91E2A1;

Set_NonXray_SamusPose:
    PHP                                                                  ;91E2AD;
    REP #$30                                                             ;91E2AE;
    LDA.W $0A1F                                                          ;91E2B0;
    AND.W #$00FF                                                         ;91E2B3;
    CMP.W #$0005                                                         ;91E2B6;
    BEQ .crouching                                                       ;91E2B9;
    LDA.W $0A1E                                                          ;91E2BB;
    AND.W #$00FF                                                         ;91E2BE;
    CMP.W #$0004                                                         ;91E2C1;
    BEQ .facingLeft                                                      ;91E2C4;
    LDA.W #$0001                                                         ;91E2C6;
    STA.W $0A1C                                                          ;91E2C9;
    BRA .merge                                                           ;91E2CC;


.facingLeft:
    LDA.W #$0002                                                         ;91E2CE;
    STA.W $0A1C                                                          ;91E2D1;
    BRA .merge                                                           ;91E2D4;


.crouching:
    LDA.W $0A1E                                                          ;91E2D6;
    AND.W #$00FF                                                         ;91E2D9;
    CMP.W #$0004                                                         ;91E2DC;
    BEQ .crouchingFacingLeft                                             ;91E2DF;
    LDA.W #$0027                                                         ;91E2E1;
    STA.W $0A1C                                                          ;91E2E4;
    BRA .merge                                                           ;91E2E7;


.crouchingFacingLeft:
    LDA.W #$0028                                                         ;91E2E9;
    STA.W $0A1C                                                          ;91E2EC;

.merge:
    JSL.L InitializeSamusPose_1                                          ;91E2EF;
    JSL.L Set_Samus_AnimationFrame_if_PoseChanged                        ;91E2F3;
    LDA.W $0A20                                                          ;91E2F7;
    STA.W $0A24                                                          ;91E2FA;
    LDA.W $0A22                                                          ;91E2FD;
    STA.W $0A26                                                          ;91E300;
    LDA.W $0A1C                                                          ;91E303;
    STA.W $0A20                                                          ;91E306;
    LDA.W $0A1E                                                          ;91E309;
    STA.W $0A22                                                          ;91E30C;
    LDA.W #SamusMovementHandler_Normal                                   ;91E30F;
    STA.W $0A58                                                          ;91E312;
    LDA.W #SamusPoseInputHandler_Normal                                  ;91E315;
    STA.W $0A60                                                          ;91E318;
    LDA.W #$FFFF                                                         ;91E31B;
    STA.W $0A80                                                          ;91E31E;
    LDA.W $0A1C                                                          ;91E321;
    ASL A                                                                ;91E324;
    ASL A                                                                ;91E325;
    ASL A                                                                ;91E326;
    TAX                                                                  ;91E327;
    LDA.L PoseDefinitions_YRadius,X                                      ;91E328;
    AND.W #$00FF                                                         ;91E32C;
    SEC                                                                  ;91E32F;
    SBC.W $0B00                                                          ;91E330;
    STA.B $12                                                            ;91E333;
    BMI .unfreezeEnvironment                                             ;91E335;
    LDA.W $0AFA                                                          ;91E337;
    SEC                                                                  ;91E33A;
    SBC.B $12                                                            ;91E33B;
    STA.W $0AFA                                                          ;91E33D;
    STA.W $0B14                                                          ;91E340;

.unfreezeEnvironment:
    JSL.L Enable_Enemy_Projectiles                                       ;91E343;
    JSL.L Enable_PLMs                                                    ;91E347;
    JSL.L Enable_AnimatedTilesObjects                                    ;91E34B;
    JSL.L Enable_PaletteFXObjects                                        ;91E34F;
    PLP                                                                  ;91E353;
    RTL                                                                  ;91E354;


Debug_HandleSelectL_B:
    PHP                                                                  ;91E355;
    REP #$30                                                             ;91E356;
    LDA.W $05C5                                                          ;91E358;
    AND.W #$8000                                                         ;91E35B;
    BNE .checkTileViewer                                                 ;91E35E;
    JMP.W .handledInput                                                  ;91E360;


.checkTileViewer:
    LDA.W $0DF6                                                          ;91E363;
    BEQ .toggleOn                                                        ;91E366;
    JMP.W .toggleOff                                                     ;91E368;


.toggleOn:
    LDA.W #$0001                                                         ;91E36B;
    STA.W $0DF6                                                          ;91E36E;
    LDA.W $09A6                                                          ;91E371;
    INC A                                                                ;91E374;
    STA.W $09A6                                                          ;91E375;
    AND.W #$0FFF                                                         ;91E378;
    CMP.W #$000C                                                         ;91E37B;
    BMI +                                                                ;91E37E;
    LDA.W $09A6                                                          ;91E380;
    AND.W #$F000                                                         ;91E383;
    STA.W $09A6                                                          ;91E386;

  + JSL.L Update_Beam_Tiles_and_Palette                                  ;91E389;
    LDA.W #$F33F                                                         ;91E38D; Same extra bit (10) as GT Code
    STA.W $09A4                                                          ;91E390;
    STA.W $09A2                                                          ;91E393;
    LDA.W #$0384                                                         ;91E396;
    STA.W $09C8                                                          ;91E399;
    STA.W $09C6                                                          ;91E39C;
    LDA.W #$005A                                                         ;91E39F;
    STA.W $09CC                                                          ;91E3A2;
    STA.W $09CA                                                          ;91E3A5;
    LDA.W #$005A                                                         ;91E3A8;
    STA.W $09D0                                                          ;91E3AB;
    STA.W $09CE                                                          ;91E3AE;
    LDA.W #$044B                                                         ;91E3B1;
    STA.W $09C4                                                          ;91E3B4;
    STA.W $09C2                                                          ;91E3B7;
    LDA.W #$01F3                                                         ;91E3BA;
    STA.W $09D6                                                          ;91E3BD;
    STZ.W $09D8                                                          ;91E3C0;
    LDA.W #$100F                                                         ;91E3C3;
    STA.W $09A8                                                          ;91E3C6;
    LDA.W $09A6                                                          ;91E3C9;
    ORA.W #$1000                                                         ;91E3CC;
    STA.W $09A6                                                          ;91E3CF;
    JSL.L AddGrappleToHUDTilemap                                         ;91E3D2;
    JSL.L AddXrayToHUDTilemap                                            ;91E3D6;
    JSL.L AddMissilesToHUDTilemap                                        ;91E3DA;
    JSL.L AddSuperMissilesToHUDTilemap                                   ;91E3DE;
    JSL.L AddPowerBombsToHUDTilemap                                      ;91E3E2;
    BRA .handledInput                                                    ;91E3E6;


.toggleOff:
    STZ.W $0DF6                                                          ;91E3E8;

.handledInput:
    LDA.W $0DF6                                                          ;91E3EB;
    BEQ .return                                                          ;91E3EE;
    JSL.L Debug_SamusTileViewer                                          ;91E3F0;

.return:
    PLP                                                                  ;91E3F4;
    RTL                                                                  ;91E3F5;


MakeSamusFaceForward:
    PHP                                                                  ;91E3F6;
    PHB                                                                  ;91E3F7;
    PHK                                                                  ;91E3F8;
    PLB                                                                  ;91E3F9;
    REP #$30                                                             ;91E3FA;
    PHX                                                                  ;91E3FC;
    LDA.W $09A2                                                          ;91E3FD;
    BIT.W #$0020                                                         ;91E400;
    BNE .suited                                                          ;91E403;
    BIT.W #$0001                                                         ;91E405;
    BNE .suited                                                          ;91E408;
    LDA.W #$0000                                                         ;91E40A;
    STA.W $0A1C                                                          ;91E40D;
    BRA .initSamus                                                       ;91E410;


.suited:
    LDA.W #$009B                                                         ;91E412;
    STA.W $0A1C                                                          ;91E415;

.initSamus:
    JSL.L InitializeSamusPose_1                                          ;91E418;
    JSL.L Set_Samus_AnimationFrame_if_PoseChanged                        ;91E41C;
    LDA.W $0A20                                                          ;91E420;
    STA.W $0A24                                                          ;91E423;
    LDA.W $0A22                                                          ;91E426;
    STA.W $0A26                                                          ;91E429;
    LDA.W $0A1C                                                          ;91E42C;
    STA.W $0A20                                                          ;91E42F;
    LDA.W $0A1E                                                          ;91E432;
    STA.W $0A22                                                          ;91E435;
    LDA.W $0B00                                                          ;91E438;
    CMP.W #$0018                                                         ;91E43B;
    BEQ .facingForwardRadius18                                           ;91E43E;
    LDA.W $0AFA                                                          ;91E440;
    SEC                                                                  ;91E443;
    SBC.W #$0003                                                         ;91E444;
    STA.W $0AFA                                                          ;91E447;
    STA.W $0B14                                                          ;91E44A;

.facingForwardRadius18:
    LDA.W #SamusCurrentStateHandler_SamusIsLocked                        ;91E44D;
    STA.W $0A42                                                          ;91E450;
    LDA.W #SamusNewStateHandler_SamusIsLocked                            ;91E453;
    STA.W $0A44                                                          ;91E456;
    LDA.W #$FFFF                                                         ;91E459;
    STA.W $0A28                                                          ;91E45C;
    STA.W $0A2A                                                          ;91E45F;
    STA.W $0A2C                                                          ;91E462;
    STZ.W $0A2E                                                          ;91E465;
    STZ.W $0A30                                                          ;91E468;
    STZ.W $0A32                                                          ;91E46B;
    LDA.W #$001F                                                         ;91E46E;
    JSL.L Run_Samus_Command                                              ;91E471;
    STZ.W $0B42                                                          ;91E475;
    STZ.W $0B44                                                          ;91E478;
    STZ.W $0B46                                                          ;91E47B;
    STZ.W $0B48                                                          ;91E47E;
    STZ.W $0B2C                                                          ;91E481;
    STZ.W $0B2E                                                          ;91E484;
    STZ.W $0B36                                                          ;91E487;
    STZ.W $0B20                                                          ;91E48A;
    STZ.W $0B4A                                                          ;91E48D;
    STZ.W $0CD0                                                          ;91E490;
    STZ.W $0CD6                                                          ;91E493;
    STZ.W $0CD8                                                          ;91E496;
    STZ.W $0CDA                                                          ;91E499;
    STZ.W $0CDC                                                          ;91E49C;
    STZ.W $0CDE                                                          ;91E49F;
    STZ.W $0CE0                                                          ;91E4A2;
    JSL.L LoadSamusSuitPalette                                           ;91E4A5;
    PLX                                                                  ;91E4A9;
    PLB                                                                  ;91E4AA;
    PLP                                                                  ;91E4AB;
    RTL                                                                  ;91E4AC;


DrainedSamusController:
    PHP                                                                  ;91E4AD;
    PHB                                                                  ;91E4AE;
    PHK                                                                  ;91E4AF;
    PLB                                                                  ;91E4B0;
    REP #$30                                                             ;91E4B1;
    PHX                                                                  ;91E4B3;
    PHY                                                                  ;91E4B4;
    ASL A                                                                ;91E4B5;
    TAX                                                                  ;91E4B6;
    JSR.W (.pointers,X)                                                  ;91E4B7;
    BCC .return                                                          ;91E4BA;
    LDA.W $0A20                                                          ;91E4BC;
    STA.W $0A24                                                          ;91E4BF;
    LDA.W $0A22                                                          ;91E4C2;
    STA.W $0A26                                                          ;91E4C5;
    LDA.W $0A1C                                                          ;91E4C8;
    STA.W $0A20                                                          ;91E4CB;
    LDA.W $0A1E                                                          ;91E4CE;
    STA.W $0A22                                                          ;91E4D1;
    LDA.W #$FFFF                                                         ;91E4D4;
    STA.W $0A28                                                          ;91E4D7;
    STA.W $0A2A                                                          ;91E4DA;
    STA.W $0A2C                                                          ;91E4DD;
    STZ.W $0A2E                                                          ;91E4E0;
    STZ.W $0A30                                                          ;91E4E3;
    STZ.W $0A32                                                          ;91E4E6;

.return:
    PLY                                                                  ;91E4E9;
    PLX                                                                  ;91E4EA;
    PLB                                                                  ;91E4EB;
    PLP                                                                  ;91E4EC;
    RTL                                                                  ;91E4ED;


.pointers:
    dw DrainedSamusController_0_LetDrainedSamusFall                      ;91E4EE;
    dw DrainedSamusController_1_PutSamusIntoStandingDrainedPose          ;91E4F0;
    dw DrainedSamusController_2_ReleaseSamusFromDrainedPose              ;91E4F2;
    dw DrainedSamusController_3_EnableHyperBeam                          ;91E4F4;
    dw DrainedSamusController_4_SetSamusCrouchingFallingDrainedPose      ;91E4F6;

DrainedSamusController_0_LetDrainedSamusFall:
    LDA.W #$0015                                                         ;91E4F8;
    SEC                                                                  ;91E4FB;
    SBC.W $0B00                                                          ;91E4FC;
    STA.B $12                                                            ;91E4FF;
    LDA.W $0AFA                                                          ;91E501;
    SEC                                                                  ;91E504;
    SBC.B $12                                                            ;91E505;
    STA.W $0AFA                                                          ;91E507;
    STA.W $0B14                                                          ;91E50A;
    LDA.W $0A1E                                                          ;91E50D;
    AND.W #$00FF                                                         ;91E510;
    CMP.W #$0004                                                         ;91E513;
    BEQ .facingLeft                                                      ;91E516;
    LDA.W #$00E8                                                         ;91E518;
    STA.W $0A1C                                                          ;91E51B;
    BRA +                                                                ;91E51E;


.facingLeft:
    LDA.W #$00E9                                                         ;91E520;
    STA.W $0A1C                                                          ;91E523;

  + LDA.W #$0002                                                         ;91E526;
    STA.W $0A9A                                                          ;91E529;
    JSL.L InitializeSamusPose_1                                          ;91E52C;
    JSL.L Set_Samus_AnimationFrame_if_PoseChanged                        ;91E530;
    LDA.W $0A1C                                                          ;91E534;
    ASL A                                                                ;91E537;
    ASL A                                                                ;91E538;
    ASL A                                                                ;91E539;
    TAX                                                                  ;91E53A;
    LDA.W PoseDefinitions_YRadius,X                                      ;91E53B;
    AND.W #$00FF                                                         ;91E53E;
    STA.W $0B00                                                          ;91E541;
    STZ.W $0B46                                                          ;91E544;
    STZ.W $0B48                                                          ;91E547;
    STZ.W $0B2C                                                          ;91E54A;
    STZ.W $0B2E                                                          ;91E54D;
    LDA.W #$0002                                                         ;91E550;
    STA.W $0B36                                                          ;91E553;
    STZ.W $0CD0                                                          ;91E556;
    STZ.W $0CD6                                                          ;91E559;
    STZ.W $0CD8                                                          ;91E55C;
    STZ.W $0CDA                                                          ;91E55F;
    STZ.W $0CDC                                                          ;91E562;
    STZ.W $0CDE                                                          ;91E565;
    STZ.W $0CE0                                                          ;91E568;
    JSL.L LoadSamusSuitPalette                                           ;91E56B;
    SEC                                                                  ;91E56F;
    RTS                                                                  ;91E570;


DrainedSamusController_1_PutSamusIntoStandingDrainedPose:
    LDA.W #$0010                                                         ;91E571;
    STA.W $0A94                                                          ;91E574;
    STZ.W $0A96                                                          ;91E577;
    LDA.W $0A1E                                                          ;91E57A;
    AND.W #$00FF                                                         ;91E57D;
    CMP.W #$0004                                                         ;91E580;
    BEQ .facingLeft                                                      ;91E583;
    LDA.W #$00EA                                                         ;91E585;
    STA.W $0A1C                                                          ;91E588;
    BRA +                                                                ;91E58B;


.facingLeft:
    LDA.W #$00EB                                                         ;91E58D;
    STA.W $0A1C                                                          ;91E590;

  + LDA.W #RTS_90E90E                                                    ;91E593;
    STA.W $0A5A                                                          ;91E596;
    SEC                                                                  ;91E599;
    RTS                                                                  ;91E59A;


DrainedSamusController_2_ReleaseSamusFromDrainedPose:
    LDA.W $0A1C                                                          ;91E59B;
    CMP.W #$00E8                                                         ;91E59E;
    BEQ .crouchingFalling                                                ;91E5A1;
    CMP.W #$00E9                                                         ;91E5A3;
    BEQ .crouchingFalling                                                ;91E5A6;
    CMP.W #$00EA                                                         ;91E5A8;
    BEQ .drainedStanding                                                 ;91E5AB;
    CMP.W #$00EB                                                         ;91E5AD;
    BNE .merge                                                           ;91E5B0;

.drainedStanding:
    LDA.W #$0001                                                         ;91E5B2;
    STA.W $0A94                                                          ;91E5B5;
    LDA.W #$0004                                                         ;91E5B8;
    STA.W $0A96                                                          ;91E5BB;
    BRA .merge                                                           ;91E5BE;


.crouchingFalling:
    LDA.W #$0001                                                         ;91E5C0;
    STA.W $0A94                                                          ;91E5C3;
    LDA.W #$000D                                                         ;91E5C6;
    STA.W $0A96                                                          ;91E5C9;

.merge:
    LDA.W $0A1C                                                          ;91E5CC;
    ASL A                                                                ;91E5CF;
    ASL A                                                                ;91E5D0;
    ASL A                                                                ;91E5D1;
    TAX                                                                  ;91E5D2;
    LDA.W PoseDefinitions_YRadius,X                                      ;91E5D3;
    AND.W #$00FF                                                         ;91E5D6;
    STA.W $0B00                                                          ;91E5D9;
    STZ.W $0B46                                                          ;91E5DC;
    STZ.W $0B48                                                          ;91E5DF;
    STZ.W $0B2C                                                          ;91E5E2;
    STZ.W $0B2E                                                          ;91E5E5;
    LDA.W #$0002                                                         ;91E5E8;
    STA.W $0B36                                                          ;91E5EB;
    SEC                                                                  ;91E5EE;
    RTS                                                                  ;91E5EF;


DrainedSamusController_3_EnableHyperBeam:
    LDA.W #$1009                                                         ;91E5F0;
    STA.W $09A6                                                          ;91E5F3;
    JSL.L Update_Beam_Tiles_and_Palette                                  ;91E5F6;
    LDY.W #PaletteFXObjects_HyperBeam                                    ;91E5FA;
    JSL.L Spawn_PaletteFXObject                                          ;91E5FD;
    LDA.W #$8000                                                         ;91E601;
    STA.W $0A76                                                          ;91E604;
    STZ.W $0DC0                                                          ;91E607;
    CLC                                                                  ;91E60A;
    RTS                                                                  ;91E60B;


DrainedSamusController_4_SetSamusCrouchingFallingDrainedPose:
    LDA.W #$0010                                                         ;91E60C;
    STA.W $0A94                                                          ;91E60F;
    LDA.W #$0008                                                         ;91E612;
    STA.W $0A96                                                          ;91E615;
    LDA.W $0A1E                                                          ;91E618;
    AND.W #$00FF                                                         ;91E61B;
    CMP.W #$0004                                                         ;91E61E;
    BEQ .facingLeft                                                      ;91E621;
    LDA.W #$00E8                                                         ;91E623;
    STA.W $0A1C                                                          ;91E626;
    SEC                                                                  ;91E629;
    RTS                                                                  ;91E62A;


.facingLeft:
    LDA.W #$00E9                                                         ;91E62B;
    STA.W $0A1C                                                          ;91E62E;
    SEC                                                                  ;91E631;
    RTS                                                                  ;91E632;


UpdateSamusPoseDueToChangeOfEquipment:
    PHP                                                                  ;91E633;
    PHB                                                                  ;91E634;
    PHK                                                                  ;91E635;
    PLB                                                                  ;91E636;
    REP #$30                                                             ;91E637;
    LDA.W $0A1F                                                          ;91E639;
    AND.W #$00FF                                                         ;91E63C;
    ASL A                                                                ;91E63F;
    TAX                                                                  ;91E640;
    JSR.W (.pointers,X)                                                  ;91E641;
    LDA.W $09A2                                                          ;91E644;
    BIT.W #$2000                                                         ;91E647;
    BNE .speedBoosterEquipped                                            ;91E64A;
    STZ.W $0AAE                                                          ;91E64C;
    STZ.W $0AC0                                                          ;91E64F;
    STZ.W $0AC2                                                          ;91E652;
    STZ.W $0B3C                                                          ;91E655;
    STZ.W $0B3E                                                          ;91E658;
    STZ.W $0ACE                                                          ;91E65B;
    STZ.W $0AD0                                                          ;91E65E;
    STZ.W $0AB0                                                          ;91E661;
    STZ.W $0AB2                                                          ;91E664;
    STZ.W $0AB8                                                          ;91E667;
    STZ.W $0ABA                                                          ;91E66A;
    BRA +                                                                ;91E66D;


.speedBoosterEquipped:
    LDA.W $0B3C                                                          ;91E66F;
    BEQ +                                                                ;91E672;
    LDA.W $0B3E                                                          ;91E674;
    BNE +                                                                ;91E677;
    STA.W $0AD0                                                          ;91E679;
    STZ.W $0ACE                                                          ;91E67C;
    LDA.W SpeedBoostTimerResetValues                                     ;91E67F;
    STA.W $0B3E                                                          ;91E682;

  + LDA.W $0D32                                                          ;91E685;
    CMP.W #GrappleBeamFunction_Inactive                                  ;91E688;
    BEQ .checkCharge                                                     ;91E68B;
    LDA.W #$0002                                                         ;91E68D;
    JSL.L Load_Beam_Palette_External                                     ;91E690;
    LDA.W #$0006                                                         ;91E694;
    JSL.L QueueSound_Lib1_Max6                                           ;91E697;
    BRA .playedSFX                                                       ;91E69B;


.checkCharge:
    LDA.W $09A6                                                          ;91E69D;
    BIT.W #$1000                                                         ;91E6A0;
    BNE .chargeEquipped                                                  ;91E6A3;
    STZ.W $0CD0                                                          ;91E6A5;
    STZ.W $0CD6                                                          ;91E6A8;
    STZ.W $0CD8                                                          ;91E6AB;
    STZ.W $0CDA                                                          ;91E6AE;
    STZ.W $0CDC                                                          ;91E6B1;
    STZ.W $0CDE                                                          ;91E6B4;
    STZ.W $0CE0                                                          ;91E6B7;
    BRA .playedSFX                                                       ;91E6BA;


.chargeEquipped:
    LDA.W $0CD0                                                          ;91E6BC;
    CMP.W #$0010                                                         ;91E6BF;
    BMI .playedSFX                                                       ;91E6C2;
    LDA.W #$0041                                                         ;91E6C4;
    JSL.L QueueSound_Lib1_Max6                                           ;91E6C7;

.playedSFX:
    JSL.L LoadSamusSuitPalette                                           ;91E6CB;
    LDA.W $09C2                                                          ;91E6CF;
    CMP.W #$001F                                                         ;91E6D2;
    BPL .return                                                          ;91E6D5;
    LDA.W #$0002                                                         ;91E6D7;
    JSL.L QueueSound_Lib3_Max6                                           ;91E6DA;

.return:
    PLB                                                                  ;91E6DE;
    PLP                                                                  ;91E6DF;
    RTL                                                                  ;91E6E0;


.pointers:
    dw UpdateSamusPoseEquipment_Standing                                 ;91E6E1;
    dw RTS_91E732                                                        ;91E6E3;
    dw RTS_91E732                                                        ;91E6E5;
    dw UpdateSamusPoseEquipment_SpinJumping                              ;91E6E7;
    dw UpdateSamusPoseEquipment_MorphBall                                ;91E6E9;
    dw RTS_91E732                                                        ;91E6EB;
    dw RTS_91E732                                                        ;91E6ED;
    dw RTS_91E732                                                        ;91E6EF;
    dw UpdateSamusPoseEquipment_MorphBall                                ;91E6F1;
    dw RTS_91E732                                                        ;91E6F3;
    dw RTS_91E732                                                        ;91E6F5;
    dw RTS_91E732                                                        ;91E6F7;
    dw RTS_91E732                                                        ;91E6F9;
    dw RTS_91E732                                                        ;91E6FB;
    dw RTS_91E732                                                        ;91E6FD;
    dw RTS_91E732                                                        ;91E6FF;
    dw RTS_91E732                                                        ;91E701;
    dw UpdateSamusPoseEquipment_SpringBall                               ;91E703;
    dw UpdateSamusPoseEquipment_SpringBall                               ;91E705;
    dw UpdateSamusPoseEquipment_SpringBall                               ;91E707;
    dw UpdateSamusPoseEquipment_WallJumping                              ;91E709;
    dw RTS_91E732                                                        ;91E70B;
    dw RTS_91E732                                                        ;91E70D;
    dw RTS_91E732                                                        ;91E70F;
    dw RTS_91E732                                                        ;91E711;
    dw RTS_91E732                                                        ;91E713;
    dw RTS_91E732                                                        ;91E715;
    dw RTS_91E732                                                        ;91E717;

UpdateSamusPreviousPose:
    LDA.W $0A20                                                          ;91E719;
    STA.W $0A24                                                          ;91E71C;
    LDA.W $0A22                                                          ;91E71F;
    STA.W $0A26                                                          ;91E722;
    LDA.W $0A1C                                                          ;91E725;
    STA.W $0A20                                                          ;91E728;
    LDA.W $0A1E                                                          ;91E72B;
    STA.W $0A22                                                          ;91E72E;
    RTS                                                                  ;91E731;


RTS_91E732:
    RTS                                                                  ;91E732;


UpdateSamusPoseEquipment_Standing:
    LDA.W $0A1C                                                          ;91E733;
    CMP.W #$0000                                                         ;91E736; >.<
    BEQ .facingForward                                                   ;91E739;
    CMP.W #$009B                                                         ;91E73B;
    BEQ .suited                                                          ;91E73E;
    RTS                                                                  ;91E740;


.facingForward:
    LDA.W $09A2                                                          ;91E741;
    BIT.W #$0001                                                         ;91E744;
    BNE .upgradeSuit                                                     ;91E747;
    BIT.W #$0020                                                         ;91E749;
    BNE .upgradeSuit                                                     ;91E74C;
    RTS                                                                  ;91E74E;


.upgradeSuit:
    LDA.W #$009B                                                         ;91E74F;
    STA.W $0A1C                                                          ;91E752;
    BRA .poseChanged                                                     ;91E755;


.suited:
    LDA.W $09A2                                                          ;91E757;
    BIT.W #$0001                                                         ;91E75A;
    BNE .return                                                          ;91E75D;
    BIT.W #$0020                                                         ;91E75F;
    BNE .return                                                          ;91E762;
    LDA.W #$0000                                                         ;91E764;
    STA.W $0A1C                                                          ;91E767;

.poseChanged:
    JSL.L InitializeSamusPose_1                                          ;91E76A;
    JSL.L Set_Samus_AnimationFrame_if_PoseChanged                        ;91E76E;
    JSR.W UpdateSamusPreviousPose                                        ;91E772;

.return:
    RTS                                                                  ;91E775;


UpdateSamusPoseEquipment_SpinJumping:
    LDA.W $0A1E                                                          ;91E776;
    AND.W #$00FF                                                         ;91E779;
    CMP.W #$0004                                                         ;91E77C;
    BEQ .facingLeft                                                      ;91E77F;
    LDA.W #$0108                                                         ;91E781;
    STA.W $0A22                                                          ;91E784;
    BRA .checkSpaceScrew                                                 ;91E787;


.facingLeft:
    LDA.W #$0104                                                         ;91E789;
    STA.W $0A22                                                          ;91E78C;

.checkSpaceScrew:
    LDA.W $0A1C                                                          ;91E78F;
    CMP.W #$0081                                                         ;91E792;
    BEQ .screwAttack                                                     ;91E795;
    CMP.W #$0082                                                         ;91E797;
    BEQ .screwAttack                                                     ;91E79A;
    CMP.W #$001B                                                         ;91E79C;
    BEQ .spaceJump                                                       ;91E79F;
    CMP.W #$001C                                                         ;91E7A1;
    BEQ .spaceJump                                                       ;91E7A4;
    BRA .merge                                                           ;91E7A6;


.spaceJump:
    LDA.W $09A2                                                          ;91E7A8;
    BIT.W #$0008                                                         ;91E7AB;
    BNE .changeToScrewAttack                                             ;91E7AE;
    BIT.W #$0200                                                         ;91E7B0;
    BEQ .changeToSpinJump                                                ;91E7B3;
    BRA .merge                                                           ;91E7B5;


.screwAttack:
    LDA.W $09A2                                                          ;91E7B7;
    BIT.W #$0008                                                         ;91E7BA;
    BNE .merge                                                           ;91E7BD;
    BIT.W #$0200                                                         ;91E7BF;
    BNE .changeToSpaceJump                                               ;91E7C2;
    BRA .changeToSpinJump                                                ;91E7C4;


.changeToScrewAttack:
    LDA.W $0A1E                                                          ;91E7C6;
    AND.W #$00FF                                                         ;91E7C9;
    CMP.W #$0004                                                         ;91E7CC;
    BEQ ..facingLeft                                                     ;91E7CF;
    LDA.W #$0081                                                         ;91E7D1;
    STA.W $0A1C                                                          ;91E7D4;
    BRA .merge                                                           ;91E7D7;


..facingLeft:
    LDA.W #$0082                                                         ;91E7D9;
    STA.W $0A1C                                                          ;91E7DC;
    BRA .merge                                                           ;91E7DF;


.changeToSpaceJump:
    LDA.W $0A1E                                                          ;91E7E1;
    AND.W #$00FF                                                         ;91E7E4;
    CMP.W #$0004                                                         ;91E7E7;
    BEQ ..facingLeft                                                     ;91E7EA;
    LDA.W #$001B                                                         ;91E7EC;
    STA.W $0A1C                                                          ;91E7EF;
    BRA .merge                                                           ;91E7F2;


..facingLeft:
    LDA.W #$001C                                                         ;91E7F4;
    STA.W $0A1C                                                          ;91E7F7;
    BRA .merge                                                           ;91E7FA;


.changeToSpinJump:
    LDA.W $0A1E                                                          ;91E7FC;
    AND.W #$00FF                                                         ;91E7FF;
    CMP.W #$0004                                                         ;91E802;
    BEQ ..facingLeft                                                     ;91E805;
    LDA.W #$0019                                                         ;91E807;
    STA.W $0A1C                                                          ;91E80A;
    BRA .merge                                                           ;91E80D;


..facingLeft:
    LDA.W #$001A                                                         ;91E80F;
    STA.W $0A1C                                                          ;91E812;

.merge:
    JSL.L InitializeSamusPose_1                                          ;91E815;
    JSL.L Set_Samus_AnimationFrame_if_PoseChanged                        ;91E819;
    LDA.W $0A1E                                                          ;91E81D;
    AND.W #$00FF                                                         ;91E820;
    CMP.W #$0004                                                         ;91E823;
    BEQ ..facingLeft                                                     ;91E826;
    LDA.W #$0308                                                         ;91E828;
    STA.W $0A22                                                          ;91E82B;
    BRA +                                                                ;91E82E;


..facingLeft:
    LDA.W #$0304                                                         ;91E830;
    STA.W $0A22                                                          ;91E833;

  + JSR.W UpdateSamusPreviousPose                                        ;91E836;
    RTS                                                                  ;91E839;


UpdateSamusPoseEquipment_MorphBall:
    LDA.W $09A2                                                          ;91E83A;
    BIT.W #$0002                                                         ;91E83D;
    BEQ .return                                                          ;91E840;
    LDA.W $0A1E                                                          ;91E842;
    AND.W #$00FF                                                         ;91E845;
    CMP.W #$0004                                                         ;91E848;
    BEQ .facingLeft                                                      ;91E84B;
    LDA.W #$0079                                                         ;91E84D;
    STA.W $0A1C                                                          ;91E850;
    BRA +                                                                ;91E853;


.facingLeft:
    LDA.W #$007A                                                         ;91E855;
    STA.W $0A1C                                                          ;91E858;

  + JSL.L InitializeSamusPose_1                                          ;91E85B;
    JSL.L Set_Samus_AnimationFrame_if_PoseChanged                        ;91E85F;
    JSR.W UpdateSamusPreviousPose                                        ;91E863;

.return:
    RTS                                                                  ;91E866;


UpdateSamusPoseEquipment_SpringBall:
    LDA.W $09A2                                                          ;91E867;
    BIT.W #$0002                                                         ;91E86A;
    BNE .return                                                          ;91E86D;
    LDA.W $0A1E                                                          ;91E86F;
    AND.W #$00FF                                                         ;91E872;
    CMP.W #$0004                                                         ;91E875;
    BEQ .facingLeft                                                      ;91E878;
    LDA.W #$001D                                                         ;91E87A;
    STA.W $0A1C                                                          ;91E87D;
    BRA +                                                                ;91E880;


.facingLeft:
    LDA.W #$0041                                                         ;91E882;
    STA.W $0A1C                                                          ;91E885;

  + JSL.L InitializeSamusPose_1                                          ;91E888;
    JSL.L Set_Samus_AnimationFrame_if_PoseChanged                        ;91E88C;
    JSR.W UpdateSamusPreviousPose                                        ;91E890;

.return:
    RTS                                                                  ;91E893;


UpdateSamusPoseEquipment_WallJumping:
    LDA.W $09A2                                                          ;91E894;
    BIT.W #$0008                                                         ;91E897;
    BNE .screwAttack                                                     ;91E89A;
    BIT.W #$0200                                                         ;91E89C;
    BNE .spaceJump                                                       ;91E89F;
    LDA.W #$0003                                                         ;91E8A1;
    STA.W $0A96                                                          ;91E8A4;
    RTS                                                                  ;91E8A7;


.spaceJump:
    LDA.W #$000D                                                         ;91E8A8;
    STA.W $0A96                                                          ;91E8AB;
    RTS                                                                  ;91E8AE;


.screwAttack:
    LDA.W #$0017                                                         ;91E8AF;
    STA.W $0A96                                                          ;91E8B2;
    RTS                                                                  ;91E8B5;


SetProspectiveSamusPoseAccordingToSolidVerticalCollision_PSP:
    PHP                                                                  ;91E8B6;
    PHB                                                                  ;91E8B7;
    PHK                                                                  ;91E8B8;
    PLB                                                                  ;91E8B9;
    REP #$30                                                             ;91E8BA;
    LDA.W $0DC6                                                          ;91E8BC;
    BEQ .return                                                          ;91E8BF;
    AND.W #$00FF                                                         ;91E8C1;
    ASL A                                                                ;91E8C4;
    TAX                                                                  ;91E8C5;
    JSR.W (.pointers,X)                                                  ;91E8C6;

.return:
    PLB                                                                  ;91E8C9;
    PLP                                                                  ;91E8CA;
    RTL                                                                  ;91E8CB;


.pointers:
    dw RTS_91EFC3                                                        ;91E8CC;
    dw PSP_Landed                                                        ;91E8CE;
    dw PSP_Falling                                                       ;91E8D0;
    dw UNUSED_PSP_91E8D8                                                 ;91E8D2;
    dw PSP_HitCeiling                                                    ;91E8D4;
    dw PSP_WallJumpTriggered                                             ;91E8D6;

UNUSED_PSP_91E8D8:
    LDA.W $0A1C                                                          ;91E8D8;
    STA.W $0A28                                                          ;91E8DB;
    LDA.W #$0005                                                         ;91E8DE;
    STA.W $0A2E                                                          ;91E8E1;
    RTS                                                                  ;91E8E4;


PSP_HitCeiling:
    LDA.W $0A1C                                                          ;91E8E5;
    STA.W $0A28                                                          ;91E8E8;
    LDA.W #$0005                                                         ;91E8EB;
    STA.W $0A2E                                                          ;91E8EE;
    RTS                                                                  ;91E8F1;


PSP_Falling:
    LDA.W $0DC7                                                          ;91E8F2;
    AND.W #$00FF                                                         ;91E8F5;
    CMP.W #$0004                                                         ;91E8F8;
    BNE .changed                                                         ;91E8FB;
    RTS                                                                  ;91E8FD;


.changed:
    ASL A                                                                ;91E8FE;
    ASL A                                                                ;91E8FF;
    TAX                                                                  ;91E900;
    LDA.W $0A1E                                                          ;91E901;
    AND.W #$00FF                                                         ;91E904;
    CMP.W #$0004                                                         ;91E907;
    BEQ .facingLeft                                                      ;91E90A;
    LDA.W .right,X                                                       ;91E90C;
    STA.W $0A28                                                          ;91E90F;
    BRA +                                                                ;91E912;


.facingLeft:
    LDA.W .left,X                                                        ;91E914;
    STA.W $0A28                                                          ;91E917;

  + LDA.W #$0005                                                         ;91E91A;
    STA.W $0A2E                                                          ;91E91D;
    RTS                                                                  ;91E920;


.right:
    dw $0029                                                             ;91E921;

.left:
    dw $002A,$0031,$0032,$0033,$0034,$007D,$007E                         ;91E923;

PSP_Landed:
    LDA.W $0DC7                                                          ;91E931;
    AND.W #$00FF                                                         ;91E934;
    CMP.W #$0004                                                         ;91E937;
    BEQ .return                                                          ;91E93A;
    ASL A                                                                ;91E93C;
    TAX                                                                  ;91E93D;
    JSR.W (.pointers,X)                                                  ;91E93E;
    BCC .solidVerticalCollision                                          ;91E941;
    LDA.W #$0000                                                         ;91E943;
    STA.W $0A2E                                                          ;91E946;
    RTS                                                                  ;91E949;


.solidVerticalCollision:
    LDA.W #$0005                                                         ;91E94A;
    STA.W $0A2E                                                          ;91E94D;

.return:
    RTS                                                                  ;91E950;


.pointers:
    dw PSP_Landed_Grounded                                               ;91E951;
    dw PSP_Landed_MorphBallGrounded                                      ;91E953;
    dw UNUSED_PSP_Landed_91EA48                                          ;91E955;
    dw PSP_Landed_SpringBallGrounded                                     ;91E957;
    dw RTS_91EFC3                                                        ;91E959;
    dw UNUSED_PSP_Landed_5_91EAB6                                        ;91E95B;

PSP_Landed_Grounded:
    LDA.W $0A23                                                          ;91E95D;
    AND.W #$00FF                                                         ;91E960;
    CMP.W #$0003                                                         ;91E963;
    BEQ .wasSpinning                                                     ;91E966;
    CMP.W #$0014                                                         ;91E968;
    BEQ .wasSpinning                                                     ;91E96B;
    LDA.W $0A1C                                                          ;91E96D;
    ASL A                                                                ;91E970;
    ASL A                                                                ;91E971;
    ASL A                                                                ;91E972;
    TAX                                                                  ;91E973;
    LDA.W PoseDefinitions_directionShotsFired,X                          ;91E974;
    AND.W #$00FF                                                         ;91E977;
    CMP.W #$00FF                                                         ;91E97A;
    BEQ .noAim                                                           ;91E97D;
    CMP.W #$0002                                                         ;91E97F;
    BEQ .aimHorizontal                                                   ;91E982;
    CMP.W #$0007                                                         ;91E984;
    BEQ .aimHorizontal                                                   ;91E987;

.landingFromNormalJumpNoFire:
    ASL A                                                                ;91E989;
    TAX                                                                  ;91E98A;
    LDA.W .directions,X                                                  ;91E98B;
    STA.W $0A28                                                          ;91E98E;
    CLC                                                                  ;91E991;
    RTS                                                                  ;91E992;


.landingFromNormalJumpNoShot:
    LDA.W PoseDefinitions_directionShotsFired,X                          ;91E993;
    AND.W #$00FF                                                         ;91E996;
    BRA .landingFromNormalJumpNoFire                                     ;91E999;


.aimHorizontal:
    LDA.B $8B                                                            ;91E99B;
    BIT.W $09B2                                                          ;91E99D;
    BEQ .landingFromNormalJumpNoShot                                     ;91E9A0;
    LDA.W $0A1E                                                          ;91E9A2;
    AND.W #$00FF                                                         ;91E9A5;
    CMP.W #$0004                                                         ;91E9A8;
    BEQ ..facingLeft                                                     ;91E9AB;
    LDA.W #$00E6                                                         ;91E9AD;
    STA.W $0A28                                                          ;91E9B0;
    CLC                                                                  ;91E9B3;
    RTS                                                                  ;91E9B4;


..facingLeft:
    LDA.W #$00E7                                                         ;91E9B5;
    STA.W $0A28                                                          ;91E9B8;
    CLC                                                                  ;91E9BB;
    RTS                                                                  ;91E9BC;


.noAim:
    LDA.W $0A1E                                                          ;91E9BD;
    AND.W #$00FF                                                         ;91E9C0;
    CMP.W #$0004                                                         ;91E9C3;
    BEQ ..facingLeft                                                     ;91E9C6;
    LDA.W #$00A4                                                         ;91E9C8;
    STA.W $0A28                                                          ;91E9CB;
    CLC                                                                  ;91E9CE;
    RTS                                                                  ;91E9CF;


..facingLeft:
    LDA.W #$00A5                                                         ;91E9D0;
    STA.W $0A28                                                          ;91E9D3;
    CLC                                                                  ;91E9D6;
    RTS                                                                  ;91E9D7;


.wasSpinning:
    LDA.W $0A1E                                                          ;91E9D8;
    AND.W #$00FF                                                         ;91E9DB;
    CMP.W #$0004                                                         ;91E9DE;
    BEQ ..facingLeft                                                     ;91E9E1;
    LDA.W #$00A6                                                         ;91E9E3;
    STA.W $0A28                                                          ;91E9E6;
    CLC                                                                  ;91E9E9;
    RTS                                                                  ;91E9EA;


..facingLeft:
    LDA.W #$00A7                                                         ;91E9EB;
    STA.W $0A28                                                          ;91E9EE;
    CLC                                                                  ;91E9F1;
    RTS                                                                  ;91E9F2;


.directions:
    db $E0,$00,$E2,$00,$A4,$00,$E4,$00,$A4,$00,$A5,$00,$E5,$00,$A5,$00   ;91E9F3;
    db $E3,$00,$E1,$00                                                   ;91EA03;

PSP_Landed_MorphBallGrounded:
    LDA.W $0B20                                                          ;91EA07;
    ASL A                                                                ;91EA0A;
    TAX                                                                  ;91EA0B;
    JMP.W (.pointers,X)                                                  ;91EA0C;


.pointers:
    dw PSP_Landed_MorphBallGrounded_NotBouncing                          ;91EA0F;
    dw PSP_Landed_MorphBallGrounded_FirstBounce                          ;91EA11;
    dw PSP_Landed_MorphBallGrounded_SecondBounce                         ;91EA13;

PSP_Landed_MorphBallGrounded_NotBouncing:
    LDA.W $0B2E                                                          ;91EA15;
    CMP.W #$0003                                                         ;91EA18;
    BMI PSP_Landed_MorphBallGrounded_SecondBounce                        ;91EA1B;
    LDA.W $0A1C                                                          ;91EA1D;
    STA.W $0A28                                                          ;91EA20;
    CLC                                                                  ;91EA23;
    RTS                                                                  ;91EA24;


PSP_Landed_MorphBallGrounded_FirstBounce:
    LDA.W $0A1C                                                          ;91EA25;
    STA.W $0A28                                                          ;91EA28;
    CLC                                                                  ;91EA2B;
    RTS                                                                  ;91EA2C;


PSP_Landed_MorphBallGrounded_SecondBounce:
    LDA.W $0A1E                                                          ;91EA2D;
    AND.W #$00FF                                                         ;91EA30;
    CMP.W #$0004                                                         ;91EA33;
    BEQ .facingLeft                                                      ;91EA36;
    LDA.W #$001D                                                         ;91EA38;
    STA.W $0A28                                                          ;91EA3B;
    BRA .return                                                          ;91EA3E;


.facingLeft:
    LDA.W #$0041                                                         ;91EA40;
    STA.W $0A28                                                          ;91EA43;

.return:
    CLC                                                                  ;91EA46;
    RTS                                                                  ;91EA47;


UNUSED_PSP_Landed_91EA48:
    LDA.W $0A1E                                                          ;91EA48;
    AND.W #$00FF                                                         ;91EA4B;
    CMP.W #$0004                                                         ;91EA4E;
    BEQ .facingLeft                                                      ;91EA51;
    LDA.W #$0020                                                         ;91EA53;
    STA.W $0A28                                                          ;91EA56;
    BRA .return                                                          ;91EA59;


.facingLeft:
    LDA.W #$0042                                                         ;91EA5B;
    STA.W $0A28                                                          ;91EA5E;

.return:
    CLC                                                                  ;91EA61;
    RTS                                                                  ;91EA62;


PSP_Landed_SpringBallGrounded:
    LDA.B $8B                                                            ;91EA63;
    BIT.W $09B4                                                          ;91EA65;
    BEQ .pressingJump                                                    ;91EA68;
    LDA.W $0A1C                                                          ;91EA6A;
    STA.W $0A28                                                          ;91EA6D;
    CLC                                                                  ;91EA70;
    RTS                                                                  ;91EA71;


.pressingJump:
    LDA.W $0B20                                                          ;91EA72;
    AND.W #$00FF                                                         ;91EA75;
    ASL A                                                                ;91EA78;
    TAX                                                                  ;91EA79;
    JMP.W (.pointers,X)                                                  ;91EA7A;


.pointers:
    dw PSP_Landed_SpringBallGrounded_NotBouncing                         ;91EA7D;
    dw PSP_Landed_SpringBallGrounded_FirstBounce                         ;91EA7F;
    dw PSP_Landed_SpringBallGrounded_SecondBounce                        ;91EA81;

PSP_Landed_SpringBallGrounded_NotBouncing:
    LDA.W $0B2E                                                          ;91EA83;
    CMP.W #$0003                                                         ;91EA86;
    BMI PSP_Landed_SpringBallGrounded_SecondBounce                       ;91EA89;
    LDA.W $0A1C                                                          ;91EA8B;
    STA.W $0A28                                                          ;91EA8E;
    CLC                                                                  ;91EA91;
    RTS                                                                  ;91EA92;


PSP_Landed_SpringBallGrounded_FirstBounce:
    LDA.W $0A1C                                                          ;91EA93;
    STA.W $0A28                                                          ;91EA96;
    CLC                                                                  ;91EA99;
    RTS                                                                  ;91EA9A;


PSP_Landed_SpringBallGrounded_SecondBounce:
    LDA.W $0A1E                                                          ;91EA9B;
    AND.W #$00FF                                                         ;91EA9E;
    CMP.W #$0004                                                         ;91EAA1;
    BEQ .facingLeft                                                      ;91EAA4;
    LDA.W #$0079                                                         ;91EAA6;
    STA.W $0A28                                                          ;91EAA9;
    BRA .return                                                          ;91EAAC;


.facingLeft:
    LDA.W #$007A                                                         ;91EAAE;
    STA.W $0A28                                                          ;91EAB1;

.return:
    CLC                                                                  ;91EAB4;
    RTS                                                                  ;91EAB5;


UNUSED_PSP_Landed_5_91EAB6:
    LDA.W $0A1C                                                          ;91EAB6;
    STA.W $0A28                                                          ;91EAB9;
    CLC                                                                  ;91EABC;
    RTS                                                                  ;91EABD;


PSP_WallJumpTriggered:
    LDA.W $0A1E                                                          ;91EABE;
    AND.W #$00FF                                                         ;91EAC1;
    CMP.W #$0004                                                         ;91EAC4;
    BEQ .facingLeft                                                      ;91EAC7;
    LDA.W #$0083                                                         ;91EAC9;
    STA.W $0A28                                                          ;91EACC;
    BRA +                                                                ;91EACF;


.facingLeft:
    LDA.W #$0084                                                         ;91EAD1;
    STA.W $0A28                                                          ;91EAD4;

  + LDA.W #$0005                                                         ;91EAD7;
    STA.W $0A2E                                                          ;91EADA;
    RTS                                                                  ;91EADD;


CheckIfProspectivePoseRunsIntoAWall:
    LDA.W $0DCE                                                          ;91EADE;
    BEQ .notKilledBySolidCollision                                       ;91EAE1;
    LDA.W $0A1F                                                          ;91EAE3;
    AND.W #$00FF                                                         ;91EAE6;
    CMP.W #$0001                                                         ;91EAE9;
    BEQ .ranIntoWall                                                     ;91EAEC;

.notKilledBySolidCollision:
    LDA.W $0A28                                                          ;91EAEE;
    CMP.W #$FFFF                                                         ;91EAF1;
    BEQ .returnPoseUnchanged                                             ;91EAF4;
    ASL A                                                                ;91EAF6;
    ASL A                                                                ;91EAF7;
    ASL A                                                                ;91EAF8;
    TAX                                                                  ;91EAF9;
    LDA.W PoseDefinitions_movementType,X                                 ;91EAFA;
    AND.W #$00FF                                                         ;91EAFD;
    CMP.W #$0001                                                         ;91EB00;
    BNE .returnPoseUnchanged                                             ;91EB03;
    LDA.W $0A1E                                                          ;91EB05;
    AND.W #$00FF                                                         ;91EB08;
    CMP.W #$0004                                                         ;91EB0B;
    BEQ .facingLeft                                                      ;91EB0E;
    LDA.W #$0001                                                         ;91EB10;
    STA.B $12                                                            ;91EB13;
    STA.W $0B02                                                          ;91EB15;
    STZ.B $14                                                            ;91EB18;
    JSL.L Samus_vs_SolidEnemy_CollisionDetection                         ;91EB1A;
    TAX                                                                  ;91EB1E;
    BNE .prospectivePoseRanIntoWall                                      ;91EB1F;
    LDA.W #$0001                                                         ;91EB21;
    STA.B $12                                                            ;91EB24;
    STA.W $0B02                                                          ;91EB26;
    STZ.B $14                                                            ;91EB29;
    BRA .moveSamus                                                       ;91EB2B;


.facingLeft:
    LDA.W #$0001                                                         ;91EB2D;
    STA.B $12                                                            ;91EB30;
    STZ.B $14                                                            ;91EB32;
    STZ.W $0B02                                                          ;91EB34;
    JSL.L Samus_vs_SolidEnemy_CollisionDetection                         ;91EB37;
    TAX                                                                  ;91EB3B;
    BNE .prospectivePoseRanIntoWall                                      ;91EB3C;
    LDA.W #$FFFF                                                         ;91EB3E;
    STA.B $12                                                            ;91EB41;
    STZ.B $14                                                            ;91EB43;
    STZ.W $0B02                                                          ;91EB45;

.moveSamus:
    JSL.L MoveSamusRight_NoSolidEnemyCollision                           ;91EB48;
    BCC .returnPoseUnchanged                                             ;91EB4C;

.prospectivePoseRanIntoWall:
    LDA.W $0A28                                                          ;91EB4E;
    BRA .setRanIntoWallPose                                              ;91EB51;


.ranIntoWall:
    LDA.W $0A1C                                                          ;91EB53;

.setRanIntoWallPose:
    ASL A                                                                ;91EB56;
    ASL A                                                                ;91EB57;
    ASL A                                                                ;91EB58;
    TAX                                                                  ;91EB59;
    LDA.W PoseDefinitions_directionShotsFired,X                          ;91EB5A;
    AND.W #$00FF                                                         ;91EB5D;
    ASL A                                                                ;91EB60;
    TAX                                                                  ;91EB61;
    LDA.W .poses,X                                                       ;91EB62;
    STA.W $0A28                                                          ;91EB65;
    BRA .returnPoseChanged                                               ;91EB68;


.returnPoseUnchanged:
    STZ.W $0DCE                                                          ;91EB6A;
    CLC                                                                  ;91EB6D;
    RTS                                                                  ;91EB6E;


.returnPoseChanged:
    STZ.W $0DCE                                                          ;91EB6F;
    SEC                                                                  ;91EB72;
    RTS                                                                  ;91EB73;


.poses:
    dw $0003,$00CF,$0089,$00D1,$0089,$008A,$00D2,$008A                   ;91EB74;
    dw $00D0,$0004                                                       ;91EB84;

UpdateSamusPose:
    PHP                                                                  ;91EB88;
    PHB                                                                  ;91EB89;
    PHK                                                                  ;91EB8A;
    PLB                                                                  ;91EB8B;
    REP #$30                                                             ;91EB8C;
    LDA.W $0A2C                                                          ;91EB8E;
    BMI .notSuperSpecialProspectivePose                                  ;91EB91;
    PHA                                                                  ;91EB93;
    LDA.W $0A32                                                          ;91EB94;
    CMP.W #$0003                                                         ;91EB97;
    BEQ .animationFinished                                               ;91EB9A;
    CMP.W #$0001                                                         ;91EB9C;
    BNE .superSpecialProspectivePose                                     ;91EB9F;
    PLA                                                                  ;91EBA1;
    BRA .knockbackFinished                                               ;91EBA2;


.animationFinished:
    LDA.W $0A30                                                          ;91EBA4;
    CMP.W #$0009                                                         ;91EBA7;
    BNE .superSpecialProspectivePose                                     ;91EBAA;
    PLA                                                                  ;91EBAC;
    BRA .notSuperSpecialProspectivePose                                  ;91EBAD;


.superSpecialProspectivePose:
    PLA                                                                  ;91EBAF;
    STA.W $0A1C                                                          ;91EBB0;
    JSL.L InitializeSamusPose_1                                          ;91EBB3;
    JSL.L Set_Samus_AnimationFrame_if_PoseChanged                        ;91EBB7;

.knockbackFinished:
    LDA.W $0A32                                                          ;91EBBB;
    ASL A                                                                ;91EBBE;
    TAX                                                                  ;91EBBF;
    JSR.W (.superSpecialProspectivePoseChangeCommand,X)                  ;91EBC0;
    BRA .poseChanged                                                     ;91EBC3;


.notSuperSpecialProspectivePose:
    LDA.W $0A2A                                                          ;91EBC5;
    BPL .specialProspectivePose                                          ;91EBC8;
    JSR.W CheckIfProspectivePoseRunsIntoAWall                            ;91EBCA;
    LDA.W $0A28                                                          ;91EBCD;
    BMI .return                                                          ;91EBD0;
    BRA .prospectivePose                                                 ;91EBD2;


.specialProspectivePose:
    STA.W $0A1C                                                          ;91EBD4;
    JSL.L HandleSamusPoseChange                                          ;91EBD7;
    BCS .poseChanged                                                     ;91EBDB;
    LDA.W $0A30                                                          ;91EBDD;
    ASL A                                                                ;91EBE0;
    TAX                                                                  ;91EBE1;
    JSR.W (.specialProspectivePoseChangeCommand,X)                       ;91EBE2;
    BRA .poseChanged                                                     ;91EBE5;


.prospectivePose:
    STA.W $0A1C                                                          ;91EBE7;
    JSL.L HandleSamusPoseChange                                          ;91EBEA;
    BCS .poseChanged                                                     ;91EBEE;
    LDA.W $0A2E                                                          ;91EBF0;
    ASL A                                                                ;91EBF3;
    TAX                                                                  ;91EBF4;
    JSR.W (.prospectivePoseChangeCommand,X)                              ;91EBF5;

.poseChanged:
    LDA.W $0A20                                                          ;91EBF8;
    STA.W $0A24                                                          ;91EBFB;
    LDA.W $0A22                                                          ;91EBFE;
    STA.W $0A26                                                          ;91EC01;
    LDA.W $0A1C                                                          ;91EC04;
    STA.W $0A20                                                          ;91EC07;
    LDA.W $0A1E                                                          ;91EC0A;
    STA.W $0A22                                                          ;91EC0D;

.return:
    STZ.W $0DC6                                                          ;91EC10;
    PLB                                                                  ;91EC13;
    PLP                                                                  ;91EC14;
    RTL                                                                  ;91EC15;


.prospectivePoseChangeCommand:
    dw RTS_91EFC3                                                        ;91EC16;
    dw ProspectivePoseCmd_1_Decelerate                                   ;91EC18;
    dw ProspectivePoseCmd_2_Stop                                         ;91EC1A;
    dw RTS_91ECD8                                                        ;91EC1C;
    dw RTS_91ECD9                                                        ;91EC1E;
    dw SpecialProspectivePoseCmd_5_SolidVerticalCollision                ;91EC20;
    dw ProspectivePoseCmd_6_KillXSpeed                                   ;91EC22;
    dw ProspectivePoseCmd_7_StartTransitionAnimation                     ;91EC24;
    dw ProspectivePoseCmd_8_KillRunSpeed                                 ;91EC26;

.specialProspectivePoseChangeCommand:
    dw RTS_91EFC3                                                        ;91EC28;
    dw SpecialProspectivePoseCmd_1_StartKnockback                        ;91EC2A;
    dw UNUSED_SpecialProspectivePoseCmd_2_91EE69                         ;91EC2C;
    dw SpecialProspectivePoseCmd_3_StartBombJump                         ;91EC2E;
    dw UNUSED_SpecialProspectivePoseCmd_4_91EEA1                         ;91EC30;
    dw SpecialProspectivePoseCmd_5_Xray                                  ;91EC32;
    dw RTS_91EF39                                                        ;91EC34;
    dw RTS_91EF3A                                                        ;91EC36;
    dw UNUSED_SpecialProspectivePoseCmd_8_91EF3B                         ;91EC38;
    dw SpecialProspectivePoseCmd_9_ConnectingGrapple_Swinging            ;91EC3A;
    dw SpecialProspectivePoseCmd_A_ConnectingGrapple_StuckInPlace        ;91EC3C;

.superSpecialProspectivePoseChangeCommand:
    dw RTS_91EFC3                                                        ;91EC3E;
    dw SuperSpecialProspectivePoseCmd_1_KnockbackFinished                ;91EC40;
    dw SuperSpecialProspectivePoseCmd_2_ShinesparkFinished               ;91EC42;
    dw SuperSpecialProspectivePoseCmd_3_TransitionAnimationFinished      ;91EC44;
    dw SuperSpecialProspectivePoseCmd_4                                  ;91EC46;
    dw SuperSpecialProspectivePoseCmd_5                                  ;91EC48;
    dw SuperSpecialProspectivePoseCmd_6_StartGrappleWallJump             ;91EC4A;
    dw SuperSpecialProspectivePoseCmd_7_StartReleaseGrappleSwing         ;91EC4C;
    dw SuperSpecialProspectivePoseCmd_8_KnockbackAndTransAnimFinish      ;91EC4E;

ProspectivePoseCmd_1_Decelerate:
    LDA.W $0B46                                                          ;91EC50;
    BNE .nonZeroXSpeed                                                   ;91EC53;
    LDA.W $0B48                                                          ;91EC55;
    BNE .nonZeroXSpeed                                                   ;91EC58;
    JMP.W ProspectivePoseCmd_2_Stop                                      ;91EC5A;


.nonZeroXSpeed:
    LDA.W $0B44                                                          ;91EC5D;
    CLC                                                                  ;91EC60;
    ADC.W $0B48                                                          ;91EC61;
    STA.W $0B48                                                          ;91EC64;
    LDA.W $0B42                                                          ;91EC67;
    ADC.W $0B46                                                          ;91EC6A;
    STA.W $0B46                                                          ;91EC6D;
    LDA.W #$0002                                                         ;91EC70;
    STA.W $0B4A                                                          ;91EC73;
    JSL.L Cancel_SpeedBoosting                                           ;91EC76;
    STZ.W $0B44                                                          ;91EC7A;
    STZ.W $0B42                                                          ;91EC7D;
    JSL.L PossiblyNoPurpose_91FB8E                                       ;91EC80;
    RTS                                                                  ;91EC84;


ProspectivePoseCmd_6_KillXSpeed:
    STZ.W $0B4A                                                          ;91EC85;
    STZ.W $0B46                                                          ;91EC88;
    STZ.W $0B48                                                          ;91EC8B; fallthrough to ProspectivePoseCmd_8_KillRunSpeed

ProspectivePoseCmd_8_KillRunSpeed:
    JSL.L Cancel_SpeedBoosting                                           ;91EC8E;
    STZ.W $0B44                                                          ;91EC92;
    STZ.W $0B42                                                          ;91EC95;
    JSL.L PossiblyNoPurpose_91FB8E                                       ;91EC98;
    RTS                                                                  ;91EC9C;


if !FEATURE_KEEP_UNREFERENCED
UNUSED_91EC9D:
    LDA.W $0A1F                                                          ;91EC9D;
    AND.W #$00FF                                                         ;91ECA0;
    TAX                                                                  ;91ECA3;
    LDA.W .data,X                                                        ;91ECA4;
    AND.W #$00FF                                                         ;91ECA7;
    BNE +                                                                ;91ECAA;
    RTS                                                                  ;91ECAC;


  + LDA.W #$0004                                                         ;91ECAD;
    STA.W $0A94                                                          ;91ECB0;
    RTS                                                                  ;91ECB3;


.data:
    db $00,$00,$02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;91ECB4;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$02,$00,$00                   ;91ECC4;
endif ; !FEATURE_KEEP_UNREFERENCED

ProspectivePoseCmd_2_Stop:
    STZ.W $0B4A                                                          ;91ECD0;
    JSL.L Cancel_SpeedBoosting                                           ;91ECD3;
    RTS                                                                  ;91ECD7;


RTS_91ECD8:
    RTS                                                                  ;91ECD8;


RTS_91ECD9:
    RTS                                                                  ;91ECD9;


ProspectivePoseCmd_7_StartTransitionAnimation:
    LDA.W $0A1C                                                          ;91ECDA;
    CMP.W #$00DB                                                         ;91ECDD;
    BPL .aiming                                                          ;91ECE0;
    SEC                                                                  ;91ECE2;
    SBC.W #$0035                                                         ;91ECE3;
    ASL A                                                                ;91ECE6;
    TAX                                                                  ;91ECE7;
    LDA.W .YRadii,X                                                      ;91ECE8;
    STA.B $12                                                            ;91ECEB;
    BEQ .notShrinking                                                    ;91ECED;
    STZ.B $14                                                            ;91ECEF;

.shrinking:
    LDA.W $0A1C                                                          ;91ECF1;
    ASL A                                                                ;91ECF4;
    ASL A                                                                ;91ECF5;
    ASL A                                                                ;91ECF6;
    TAX                                                                  ;91ECF7;
    LDA.W PoseDefinitions_YRadius,X                                      ;91ECF8;
    AND.W #$00FF                                                         ;91ECFB;
    STA.W $0B00                                                          ;91ECFE;
    JSL.L BlockCollisionDetectionDueToChangeOfPose                       ;91ED01;

.notShrinking:
    LDA.W $0AFA                                                          ;91ED05;
    CLC                                                                  ;91ED08;
    ADC.B $12                                                            ;91ED09;
    STA.W $0AFA                                                          ;91ED0B;
    STA.W $0B14                                                          ;91ED0E;
    LDA.W $0B20                                                          ;91ED11;
    BEQ .return                                                          ;91ED14;
    STZ.W $0B20                                                          ;91ED16;
    STZ.W $0B2C                                                          ;91ED19;
    STZ.W $0B2E                                                          ;91ED1C;
    STZ.W $0B36                                                          ;91ED1F;

.return:
    RTS                                                                  ;91ED22;


.aiming:
    CMP.W #$00F1                                                         ;91ED23;
    BMI .return                                                          ;91ED26;
    CMP.W #$00F7                                                         ;91ED28;
    BPL .return                                                          ;91ED2B;
    LDA.W #$0005                                                         ;91ED2D;
    STA.B $12                                                            ;91ED30;
    STZ.B $14                                                            ;91ED32;
    BRA .shrinking                                                       ;91ED34;


.YRadii:
    dw $0005,$0005,$0009,$0009,$0000,$0000,$0000,$0000                   ;91ED36;
    dw $0000,$0000,$0000,$0000                                           ;91ED46;

SpecialProspectivePoseCmd_1_StartKnockback:
    LDA.W $0A23                                                          ;91ED4E;
    AND.W #$00FF                                                         ;91ED51;
    ASL A                                                                ;91ED54;
    TAX                                                                  ;91ED55;
    JSR.W (.pointers,X)                                                  ;91ED56;
    JSL.L SetSamusYSpeedForKnockback                                     ;91ED59;
    STZ.W $0A56                                                          ;91ED5D;
    STZ.W $0A6E                                                          ;91ED60;
    LDA.W #$0001                                                         ;91ED63;
    STA.W $0A48                                                          ;91ED66;
    RTS                                                                  ;91ED69;


.pointers:
    dw DetermineKnockbackDirection_Normal                                ;91ED6A;
    dw DetermineKnockbackDirection_Normal                                ;91ED6C;
    dw DetermineKnockbackDirection_Normal                                ;91ED6E;
    dw DetermineKnockbackDirection_Normal                                ;91ED70;
    dw DetermineKnockbackDirection_Morphed                               ;91ED72;
    dw DetermineKnockbackDirection_Normal                                ;91ED74;
    dw DetermineKnockbackDirection_Falling                               ;91ED76;
    dw UNUSED_DetermineKnockbackDirection_MovementType7_91EE48           ;91ED78;
    dw DetermineKnockbackDirection_Morphed                               ;91ED7A;
    dw DetermineKnockbackDirection_Morphed                               ;91ED7C;
    dw CLCRTS_91EDA2                                                     ;91ED7E;
    dw CLCRTS_91EDA4                                                     ;91ED80;
    dw CLCRTS_91EDA4                                                     ;91ED82;
    dw DetermineKnockbackDirection_Normal                                ;91ED84;
    dw CLCRTS_91EDA4                                                     ;91ED86;
    dw CLCRTS_91EDA4                                                     ;91ED88;
    dw DetermineKnockbackDirection_Normal                                ;91ED8A;
    dw DetermineKnockbackDirection_Morphed                               ;91ED8C;
    dw DetermineKnockbackDirection_Morphed                               ;91ED8E;
    dw DetermineKnockbackDirection_Morphed                               ;91ED90;
    dw DetermineKnockbackDirection_Normal                                ;91ED92;
    dw DetermineKnockbackDirection_Normal                                ;91ED94;
    dw CLCRTS_91EDA2                                                     ;91ED96;
    dw CLCRTS_91EDA4                                                     ;91ED98;
    dw CLCRTS_91EDA4                                                     ;91ED9A;
    dw CLCRTS_91EDA4                                                     ;91ED9C;
    dw CLCRTS_91EDA4                                                     ;91ED9E;
    dw CLCRTS_91EDA4                                                     ;91EDA0;

CLCRTS_91EDA2:
    CLC                                                                  ;91EDA2;
    RTS                                                                  ;91EDA3;


CLCRTS_91EDA4:
    CLC                                                                  ;91EDA4;
    RTS                                                                  ;91EDA5;


DetermineKnockbackDirection_Falling:
    LDA.W $0A5A                                                          ;91EDA6;
    CMP.W #UNUSED_SamusTimerHackHandler_SpecialFalling_90E41B            ;91EDA9;
    BNE DetermineKnockbackDirection_Normal                               ;91EDAC;
    CLC                                                                  ;91EDAE;
    RTS                                                                  ;91EDAF;


DetermineKnockbackDirection_Normal:
    LDA.W $0A1E                                                          ;91EDB0;
    AND.W #$00FF                                                         ;91EDB3;
    CMP.W #$0004                                                         ;91EDB6;
    BEQ .facingLeft                                                      ;91EDB9;
    LDA.W $0A54                                                          ;91EDBB;
    BEQ .facingRightKnockbackLeft                                        ;91EDBE;
    LDA.B $8B                                                            ;91EDC0;
    BIT.W #$0100                                                         ;91EDC2;
    BNE .pressingRight                                                   ;91EDC5;
    LDA.W #$0002                                                         ;91EDC7;
    STA.W $0A52                                                          ;91EDCA;
    BRA +                                                                ;91EDCD;


.pressingRight:
    LDA.W #$0005                                                         ;91EDCF;
    STA.W $0A52                                                          ;91EDD2;
    BRA +                                                                ;91EDD5;


.facingRightKnockbackLeft:
    LDA.B $8B                                                            ;91EDD7;
    BIT.W #$0100                                                         ;91EDD9;
    BNE ..pressingRight                                                  ;91EDDC;
    LDA.W #$0001                                                         ;91EDDE;
    STA.W $0A52                                                          ;91EDE1;
    BRA +                                                                ;91EDE4;


..pressingRight:
    LDA.W #$0004                                                         ;91EDE6;
    STA.W $0A52                                                          ;91EDE9;
    BRA +                                                                ;91EDEC;


.facingLeft:
    LDA.W $0A54                                                          ;91EDEE;
    BEQ .facingLeftKnockbackLeft                                         ;91EDF1;
    LDA.B $8B                                                            ;91EDF3;
    BIT.W #$0200                                                         ;91EDF5;
    BNE ..pressingLeft                                                   ;91EDF8;
    LDA.W #$0002                                                         ;91EDFA;
    STA.W $0A52                                                          ;91EDFD;
    BRA +                                                                ;91EE00;


..pressingLeft:
    LDA.W #$0005                                                         ;91EE02;
    STA.W $0A52                                                          ;91EE05;
    BRA +                                                                ;91EE08;


.facingLeftKnockbackLeft:
    LDA.B $8B                                                            ;91EE0A;
    BIT.W #$0200                                                         ;91EE0C;
    BNE ..pressingLeft                                                   ;91EE0F;
    LDA.W #$0001                                                         ;91EE11;
    STA.W $0A52                                                          ;91EE14;
    BRA +                                                                ;91EE17;


..pressingLeft:
    LDA.W #$0004                                                         ;91EE19;
    STA.W $0A52                                                          ;91EE1C;

  + LDA.W #SamusMovementHandler_Knockback                                ;91EE1F;
    STA.W $0A58                                                          ;91EE22;
    SEC                                                                  ;91EE25;
    RTS                                                                  ;91EE26;


DetermineKnockbackDirection_Morphed:
    LDA.W $0A1E                                                          ;91EE27;
    AND.W #$00FF                                                         ;91EE2A;
    CMP.W #$0004                                                         ;91EE2D;
    BEQ .facingLeft                                                      ;91EE30;
    LDA.W #$0002                                                         ;91EE32;
    STA.W $0A52                                                          ;91EE35;
    BRA +                                                                ;91EE38;


.facingLeft:
    LDA.W #$0001                                                         ;91EE3A;
    STA.W $0A52                                                          ;91EE3D;

  + LDA.W #SamusMovementHandler_Knockback                                ;91EE40;
    STA.W $0A58                                                          ;91EE43;
    CLC                                                                  ;91EE46;
    RTS                                                                  ;91EE47;


UNUSED_DetermineKnockbackDirection_MovementType7_91EE48:
    LDA.W $0A1E                                                          ;91EE48;
    AND.W #$00FF                                                         ;91EE4B;
    CMP.W #$0004                                                         ;91EE4E;
    BEQ .facingLeft                                                      ;91EE51;
    LDA.W #$0002                                                         ;91EE53;
    STA.W $0A52                                                          ;91EE56;
    BRA +                                                                ;91EE59;


.facingLeft:
    LDA.W #$0001                                                         ;91EE5B;
    STA.W $0A52                                                          ;91EE5E;

  + LDA.W #SamusMovementHandler_Knockback                                ;91EE61;
    STA.W $0A58                                                          ;91EE64;
    SEC                                                                  ;91EE67;
    RTS                                                                  ;91EE68;


UNUSED_SpecialProspectivePoseCmd_2_91EE69:
    STZ.W $0A52                                                          ;91EE69;
    LDA.W #SamusMovementHandler_Normal                                   ;91EE6C;
    STA.W $0A58                                                          ;91EE6F;
    STZ.W $0B2E                                                          ;91EE72;
    STZ.W $0B2C                                                          ;91EE75;
    STZ.W $0B36                                                          ;91EE78;
    JSL.L AlignSamusBottomPositionWithPreviousPose                       ;91EE7B;
    RTS                                                                  ;91EE7F;


SpecialProspectivePoseCmd_3_StartBombJump:
    LDA.W $0A56                                                          ;91EE80;
    AND.W #$00FF                                                         ;91EE83;
    ORA.W #$0800                                                         ;91EE86;
    STA.W $0A56                                                          ;91EE89;
    LDA.W #SamusMovementHandler_BombJump_Start                           ;91EE8C;
    STA.W $0A58                                                          ;91EE8F;
    LDA.W $0A60                                                          ;91EE92;
    CMP.W #SamusPoseInputHandler_Demo                                    ;91EE95;
    BEQ .return                                                          ;91EE98;
    LDA.W #RTS_90E90E                                                    ;91EE9A;
    STA.W $0A60                                                          ;91EE9D;

.return:
    RTS                                                                  ;91EEA0;


UNUSED_SpecialProspectivePoseCmd_4_91EEA1:
    JSL.L Make_Samus_Jump                                                ;91EEA1;
    RTS                                                                  ;91EEA5;


SpecialProspectivePoseCmd_5_Xray:
    LDA.W $0A1F                                                          ;91EEA6;
    AND.W #$00FF                                                         ;91EEA9;
    BEQ .standing                                                        ;91EEAC;
    CMP.W #$0005                                                         ;91EEAE;
    BEQ .crouching                                                       ;91EEB1;
    CMP.W #$0015                                                         ;91EEB3;
    BEQ .standing                                                        ;91EEB6;
    CMP.W #$0001                                                         ;91EEB8;
    BEQ .standing                                                        ;91EEBB;
    RTS                                                                  ;91EEBD;


.standing:
    LDA.W $0A1E                                                          ;91EEBE;
    AND.W #$00FF                                                         ;91EEC1;
    CMP.W #$0004                                                         ;91EEC4;
    BEQ ..facingLeft                                                     ;91EEC7;
    LDA.W #$0040                                                         ;91EEC9;
    STA.W $0A82                                                          ;91EECC;
    BRA .merge                                                           ;91EECF;


..facingLeft:
    LDA.W #$00C0                                                         ;91EED1;
    STA.W $0A82                                                          ;91EED4;
    BRA .merge                                                           ;91EED7;


.crouching:
    LDA.W $0A1E                                                          ;91EED9;
    AND.W #$00FF                                                         ;91EEDC;
    CMP.W #$0004                                                         ;91EEDF;
    BEQ ..facingLeft                                                     ;91EEE2;
    LDA.W #$0040                                                         ;91EEE4;
    STA.W $0A82                                                          ;91EEE7;
    BRA .merge                                                           ;91EEEA;


..facingLeft:
    LDA.W #$00C0                                                         ;91EEEC;
    STA.W $0A82                                                          ;91EEEF;

.merge:
    LDA.W #$0002                                                         ;91EEF2;
    STA.W $0A96                                                          ;91EEF5;
    LDA.W #$003F                                                         ;91EEF8;
    STA.W $0A94                                                          ;91EEFB;
    LDA.W #SamusMovementHandler_Xray                                     ;91EEFE;
    STA.W $0A58                                                          ;91EF01;
    LDA.W #SamusPoseInputHandler_Xray                                    ;91EF04;
    STA.W $0A60                                                          ;91EF07;
    LDA.W #$0008                                                         ;91EF0A;
    STA.W $0ACC                                                          ;91EF0D;
    LDA.W #$0001                                                         ;91EF10;
    STA.W $0AD0                                                          ;91EF13;
    STZ.W $0ACE                                                          ;91EF16;
    STZ.W $0A68                                                          ;91EF19;
    STZ.W $0CD0                                                          ;91EF1C;
    STZ.W $0CD6                                                          ;91EF1F;
    STZ.W $0CD8                                                          ;91EF22;
    STZ.W $0CDA                                                          ;91EF25;
    STZ.W $0CDC                                                          ;91EF28;
    STZ.W $0CDE                                                          ;91EF2B;
    STZ.W $0CE0                                                          ;91EF2E;
    LDA.W #$0009                                                         ;91EF31;
    JSL.L QueueSound_Lib1_Max6                                           ;91EF34;
    RTS                                                                  ;91EF38;


RTS_91EF39:
    RTS                                                                  ;91EF39;


RTS_91EF3A:
    RTS                                                                  ;91EF3A;


UNUSED_SpecialProspectivePoseCmd_8_91EF3B:
    LDA.W $0AFA                                                          ;91EF3B;
    SEC                                                                  ;91EF3E;
    SBC.W #$0005                                                         ;91EF3F;
    STA.W $0AFA                                                          ;91EF42;
    STA.W $0B14                                                          ;91EF45;
    LDA.W #RTL_90E8CD                                                    ;91EF48;
    STA.W $0A42                                                          ;91EF4B;
    RTS                                                                  ;91EF4E;


SpecialProspectivePoseCmd_9_ConnectingGrapple_Swinging:
    JSL.L SetSamusAnimationFrameAndPositionDuringGrappleSwinging         ;91EF4F;

ConnectingGrapple_KillSpeed_ClampScrollingSpeed:
    LDA.W $0AF6                                                          ;91EF53;
    SEC                                                                  ;91EF56;
    SBC.W $0B10                                                          ;91EF57;
    BMI +                                                                ;91EF5A;
    CMP.W #$000D                                                         ;91EF5C;
    BMI .YPosition                                                       ;91EF5F;
    LDA.W $0AF6                                                          ;91EF61;
    SEC                                                                  ;91EF64;
    SBC.W #$000C                                                         ;91EF65;
    STA.W $0B10                                                          ;91EF68;
    BRA .YPosition                                                       ;91EF6B;


  + CMP.W #$FFF4                                                         ;91EF6D;
    BPL .YPosition                                                       ;91EF70;
    LDA.W $0AF6                                                          ;91EF72;
    CLC                                                                  ;91EF75;
    ADC.W #$000C                                                         ;91EF76;
    STA.W $0B10                                                          ;91EF79;

.YPosition:
    LDA.W $0AFA                                                          ;91EF7C;
    SEC                                                                  ;91EF7F;
    SBC.W $0B14                                                          ;91EF80;
    BMI +                                                                ;91EF83;
    CMP.W #$000D                                                         ;91EF85;
    BMI .killSpeed                                                       ;91EF88;
    LDA.W $0AFA                                                          ;91EF8A;
    SEC                                                                  ;91EF8D;
    SBC.W #$000C                                                         ;91EF8E;
    STA.W $0B14                                                          ;91EF91;
    BRA .killSpeed                                                       ;91EF94;


  + CMP.W #$FFF4                                                         ;91EF96;
    BPL .killSpeed                                                       ;91EF99;
    LDA.W $0AFA                                                          ;91EF9B;
    CLC                                                                  ;91EF9E;
    ADC.W #$000C                                                         ;91EF9F;
    STA.W $0B14                                                          ;91EFA2;

.killSpeed:
    JSL.L Cancel_SpeedBoosting                                           ;91EFA5;
    STZ.W $0B46                                                          ;91EFA9;
    STZ.W $0B48                                                          ;91EFAC;
    STZ.W $0B2C                                                          ;91EFAF;
    STZ.W $0B2E                                                          ;91EFB2;
    STZ.W $0B42                                                          ;91EFB5;
    STZ.W $0B44                                                          ;91EFB8;
    RTS                                                                  ;91EFBB;


SpecialProspectivePoseCmd_A_ConnectingGrapple_StuckInPlace:
    JSL.L SetSamusAnimationFrameAndPositionForConnectingGrapple_Stuck    ;91EFBC;
    JMP.W ConnectingGrapple_KillSpeed_ClampScrollingSpeed                ;91EFC0;


RTS_91EFC3:
    RTS                                                                  ;91EFC3;


SpecialProspectivePoseCmd_5_SolidVerticalCollision:
    LDA.W $0DC6                                                          ;91EFC4;
    AND.W #$00FF                                                         ;91EFC7;
    ASL A                                                                ;91EFCA;
    TAX                                                                  ;91EFCB;
    JSR.W (.pointers,X)                                                  ;91EFCC;
    RTS                                                                  ;91EFCF;


.pointers:
    dw RTS_91EFC3                                                        ;91EFD0;
    dw SolidVerticalCollision_Landed                                     ;91EFD2;
    dw SolidVerticalCollision_Falling                                    ;91EFD4;
    dw RTS_91EFDE                                                        ;91EFD6;
    dw SolidVerticalCollision_HitCeiling                                 ;91EFD8;
    dw SolidVerticalCollision_WallJumpTriggered                          ;91EFDA;
    dw SolidVerticalCollision_6                                          ;91EFDC;

RTS_91EFDE:
    RTS                                                                  ;91EFDE;


SolidVerticalCollision_HitCeiling:
    STZ.W $0B2C                                                          ;91EFDF;
    STZ.W $0B2E                                                          ;91EFE2;
    STZ.W $0B1A                                                          ;91EFE5;
    LDA.W #$0002                                                         ;91EFE8;
    STA.W $0B36                                                          ;91EFEB;
    RTS                                                                  ;91EFEE;


SolidVerticalCollision_Falling:
    LDA.W $0B36                                                          ;91EFEF;
    CMP.W #$0001                                                         ;91EFF2;
    BEQ .fallingUp                                                       ;91EFF5;
    STZ.W $0B20                                                          ;91EFF7;
    STZ.W $0B2C                                                          ;91EFFA;
    STZ.W $0B2E                                                          ;91EFFD;
    LDA.W #$0001                                                         ;91F000;
    STA.W $0B22                                                          ;91F003;
    LDA.W #$0002                                                         ;91F006;
    STA.W $0B36                                                          ;91F009;

.fallingUp:
    STZ.W $0A18                                                          ;91F00C;
    RTS                                                                  ;91F00F;


SolidVerticalCollision_Landed:
    JSR.W HandleLandingSoundEffectsAndGraphics                           ;91F010;
    LDA.W $0DC7                                                          ;91F013;
    AND.W #$00FF                                                         ;91F016;
    CMP.W #$0004                                                         ;91F019;
    BNE .change                                                          ;91F01C;
    JSR.W SolidVerticalCollision_Landed_SetSamusAsNotBouncing            ;91F01E;
    RTS                                                                  ;91F021;


.change:
    ASL A                                                                ;91F022;
    TAX                                                                  ;91F023;
    JSR.W (.pointers,X)                                                  ;91F024;
    BCC .carryClear                                                      ;91F027;
    RTS                                                                  ;91F029;


.carryClear:
    STZ.W $0A18                                                          ;91F02A;
    STZ.W $0B4A                                                          ;91F02D;
    STZ.W $0B46                                                          ;91F030;
    STZ.W $0B48                                                          ;91F033;
    JSR.W SolidVerticalCollision_Landed_SetSamusAsNotBouncing            ;91F036;
    RTS                                                                  ;91F039;


.pointers:
    dw SolidVerticalCollision_Landed_Grounded                            ;91F03A;
    dw SolidVerticalCollision_Landed_MorphBallGrounded                   ;91F03C;
    dw SolidVerticalCollision_Landed_2                                   ;91F03E;
    dw SolidVerticalCollision_Landed_SpringBallGrounded                  ;91F040;
    dw RTS_91EFC3                                                        ;91F042;
    dw SolidVerticalCollision_5                                          ;91F044;

HandleLandingSoundEffectsAndGraphics:
    LDA.W $0A23                                                          ;91F046;
    AND.W #$00FF                                                         ;91F049;
    CMP.W #$0003                                                         ;91F04C;
    BEQ .spinJumping                                                     ;91F04F;
    CMP.W #$0014                                                         ;91F051;
    BNE .notEndingSFX                                                    ;91F054;

.spinJumping:
    LDA.W $1F51                                                          ;91F056;
    BNE .notEndingSFX                                                    ;91F059;
    LDA.W $0A20                                                          ;91F05B;
    CMP.W #$0081                                                         ;91F05E;
    BEQ .screwAttack                                                     ;91F061;
    CMP.W #$0082                                                         ;91F063;
    BEQ .screwAttack                                                     ;91F066;
    LDA.W #$0032                                                         ;91F068;
    JSL.L QueueSound_Lib1_Max6                                           ;91F06B;
    BRA .notEndingSFX                                                    ;91F06F;


.screwAttack:
    LDA.W #$0034                                                         ;91F071;
    JSL.L QueueSound_Lib1_Max6                                           ;91F074;

.notEndingSFX:
    LDA.W $0B2E                                                          ;91F078;
    BEQ .zeroYSpeed                                                      ;91F07B;
    CMP.W #$0005                                                         ;91F07D;
    BPL .hardLanding                                                     ;91F080;

.zeroYSpeed:
    LDA.W $0B2C                                                          ;91F082;
    BEQ .return                                                          ;91F085;
    LDA.W $1F51                                                          ;91F087;
    BNE .merge                                                           ;91F08A;
    LDA.W #$0005                                                         ;91F08C;
    JSL.L QueueSound_Lib3_Max6                                           ;91F08F;
    BRA .merge                                                           ;91F093;


.hardLanding:
    LDA.W $1F51                                                          ;91F095;
    BNE .merge                                                           ;91F098;
    LDA.W #$0004                                                         ;91F09A;
    JSL.L QueueSound_Lib3_Max6                                           ;91F09D;

.merge:
    JSR.W HandleLandingGraphics                                          ;91F0A1;

.return:
    RTS                                                                  ;91F0A4;


HandleLandingGraphics:
    LDA.W $079F                                                          ;91F0A5;
    ASL A                                                                ;91F0A8;
    TAX                                                                  ;91F0A9;
    JSR.W (.areaPointers,X)                                              ;91F0AA;
    RTS                                                                  ;91F0AD;


.areaPointers:
    dw HandleLandingGraphics_Crateria                                    ;91F0AE;
    dw HandleLandingGraphics_Brinstar                                    ;91F0B0;
    dw HandleLandingGraphics_Norfair_WreckedShip_HandleLandingDust       ;91F0B2;
    dw HandleLandingGraphics_Norfair_WreckedShip_HandleLandingDust       ;91F0B4;
    dw HandleLandingGraphics_Maridia_HandleLandingFootstepSplashes       ;91F0B6;
    dw HandleLandingGraphics_Tourian                                     ;91F0B8;
    dw DeleteLandingAtmosphericGraphics                                  ;91F0BA;
    dw DeleteLandingAtmosphericGraphics                                  ;91F0BC;

DeleteLandingAtmosphericGraphics:
    STZ.W $0AF0                                                          ;91F0BE;
    STZ.W $0AF2                                                          ;91F0C1;
    RTS                                                                  ;91F0C4;


HandleLandingGraphics_Crateria:
    LDA.W $1F51                                                          ;91F0C5;
    BNE DeleteLandingAtmosphericGraphics                                 ;91F0C8;
    LDA.W $079D                                                          ;91F0CA;
    CMP.W #$001C                                                         ;91F0CD;
    BEQ .crateriaSpacePirateShaft                                        ;91F0D0;
    TAX                                                                  ;91F0D2;
    CPX.W #$0010                                                         ;91F0D3;
    BPL .gotoDelete                                                      ;91F0D6;
    LDA.W .data,X                                                        ;91F0D8;
    AND.W #$00FF                                                         ;91F0DB;
    BIT.W #$0001                                                         ;91F0DE;
    BNE .landingSite                                                     ;91F0E1;
    BIT.W #$0002                                                         ;91F0E3;
    BNE .wreckedShipEntrance                                             ;91F0E6;
    BIT.W #$0004                                                         ;91F0E8;
    BNE HandleLandingGraphics_Maridia_HandleLandingFootstepSplashes      ;91F0EB;

.gotoDelete:
    JMP.W DeleteLandingAtmosphericGraphics                               ;91F0ED;


.crateriaSpacePirateShaft:
    JMP.W HandleLandingGraphics_Norfair_WreckedShip_HandleLandingDust    ;91F0F0;


.data:
    db $01,$00,$00,$00,$00,$02,$00,$04,$00,$04,$04,$04,$04,$00,$04,$00   ;91F0F3;
    db $00                                                               ;91F103;

.wreckedShipEntrance:
    LDA.W $0AFA                                                          ;91F104;
    CMP.W #$03B0                                                         ;91F107;
    BPL HandleLandingGraphics_Maridia_HandleLandingFootstepSplashes      ;91F10A;
    BRA DeleteLandingAtmosphericGraphics                                 ;91F10C;


.landingSite:
    LDA.W $196E                                                          ;91F10E;
    CMP.W #$000A                                                         ;91F111;
    BNE DeleteLandingAtmosphericGraphics                                 ;91F114;

HandleLandingGraphics_Maridia_HandleLandingFootstepSplashes:
    JSL.L Get_Samus_Bottom_Boundary                                      ;91F116;
    LDA.W $195E                                                          ;91F11A;
    BMI .negativeYPosition                                               ;91F11D;
    CMP.B $12                                                            ;91F11F;
    BPL .nonLiquidPhysics                                                ;91F121;
    LDA.W $197E                                                          ;91F123;
    BIT.W #$0004                                                         ;91F126;
    BNE .nonLiquidPhysics                                                ;91F129;
    BRA .return                                                          ;91F12B;


.negativeYPosition:
    LDA.W $1962                                                          ;91F12D;
    BMI .nonLiquidPhysics                                                ;91F130;
    CMP.B $12                                                            ;91F132;
    BMI .return                                                          ;91F134;

.nonLiquidPhysics:
    LDA.W #$0100                                                         ;91F136;
    STA.W $0AF0                                                          ;91F139;
    STA.W $0AF2                                                          ;91F13C;
    LDA.W #$0003                                                         ;91F13F;
    STA.W $0AD8                                                          ;91F142;
    STA.W $0ADA                                                          ;91F145;
    LDA.W $0AF6                                                          ;91F148;
    CLC                                                                  ;91F14B;
    ADC.W #$0004                                                         ;91F14C;
    STA.W $0AE0                                                          ;91F14F;
    SEC                                                                  ;91F152;
    SBC.W #$0007                                                         ;91F153;
    STA.W $0AE2                                                          ;91F156;
    LDA.B $12                                                            ;91F159;
    SEC                                                                  ;91F15B;
    SBC.W #$0004                                                         ;91F15C;
    STA.W $0AE8                                                          ;91F15F;
    STA.W $0AEA                                                          ;91F162;

.return:
    RTS                                                                  ;91F165;


HandleLandingGraphics_Norfair_WreckedShip_HandleLandingDust:
    JSL.L Get_Samus_Bottom_Boundary                                      ;91F166;
    LDA.W $195E                                                          ;91F16A;
    BMI .negativeYPosition                                               ;91F16D;
    CMP.B $12                                                            ;91F16F;
    BPL .nonLiquidPhysics                                                ;91F171;
    LDA.W $197E                                                          ;91F173;
    BIT.W #$0004                                                         ;91F176;
    BNE .nonLiquidPhysics                                                ;91F179;
    BRA .return                                                          ;91F17B;


.negativeYPosition:
    LDA.W $1962                                                          ;91F17D;
    BMI .nonLiquidPhysics                                                ;91F180;
    CMP.B $12                                                            ;91F182;
    BMI .return                                                          ;91F184;

.nonLiquidPhysics:
    LDA.W #$0600                                                         ;91F186;
    STA.W $0AF0                                                          ;91F189;
    STA.W $0AF2                                                          ;91F18C;
    LDA.W #$0003                                                         ;91F18F;
    STA.W $0AD8                                                          ;91F192;
    STA.W $0ADA                                                          ;91F195;
    LDA.W $0AF6                                                          ;91F198;
    CLC                                                                  ;91F19B;
    ADC.W #$0008                                                         ;91F19C;
    STA.W $0AE0                                                          ;91F19F;
    SEC                                                                  ;91F1A2;
    SBC.W #$0010                                                         ;91F1A3;
    STA.W $0AE2                                                          ;91F1A6;
    LDA.B $12                                                            ;91F1A9;
    STA.W $0AE8                                                          ;91F1AB;
    STA.W $0AEA                                                          ;91F1AE;

.return:
    RTS                                                                  ;91F1B1;


HandleLandingGraphics_Brinstar:
    LDA.W $079D                                                          ;91F1B2;
    CMP.W #$0008                                                         ;91F1B5;
    BEQ HandleLandingGraphics_Norfair_WreckedShip_HandleLandingDust      ;91F1B8; fallthrough to HandleLandingGraphics_Tourian

HandleLandingGraphics_Tourian:
    LDA.W $079D                                                          ;91F1BA;
    CMP.W #$0005                                                         ;91F1BD;
    BMI .greaterThan4                                                    ;91F1C0;
    CMP.W #$0009                                                         ;91F1C2;
    BMI HandleLandingGraphics_Norfair_WreckedShip_HandleLandingDust      ;91F1C5;
    CMP.W #$000B                                                         ;91F1C7;
    BEQ HandleLandingGraphics_Norfair_WreckedShip_HandleLandingDust      ;91F1CA;

.greaterThan4:
    STZ.W $0AF0                                                          ;91F1CC;
    STZ.W $0AF2                                                          ;91F1CF;
    RTS                                                                  ;91F1D2;


SolidVerticalCollision_Landed_SetSamusAsNotBouncing:
    STZ.W $0B22                                                          ;91F1D3;
    STZ.W $0B1A                                                          ;91F1D6;
    STZ.W $0B2A                                                          ;91F1D9;
    STZ.W $0B2C                                                          ;91F1DC;
    STZ.W $0B2E                                                          ;91F1DF;
    STZ.W $0B36                                                          ;91F1E2;
    STZ.W $0B38                                                          ;91F1E5;
    STZ.W $0B20                                                          ;91F1E8;
    RTS                                                                  ;91F1EB;


SolidVerticalCollision_Landed_Grounded:
    LDA.W $0A60                                                          ;91F1EC;
    CMP.W #SamusPoseInputHandler_Demo                                    ;91F1EF;
    BEQ .return                                                          ;91F1F2;
    LDA.W #SamusPoseInputHandler_AutoJumpHack                            ;91F1F4;
    STA.W $0A60                                                          ;91F1F7;

.return:
    CLC                                                                  ;91F1FA;
    RTS                                                                  ;91F1FB;


SolidVerticalCollision_Landed_MorphBallGrounded:
    LDA.W $0B20                                                          ;91F1FC;
    ASL A                                                                ;91F1FF;
    TAX                                                                  ;91F200;
    JMP.W (.pointers,X)                                                  ;91F201;


.pointers:
    dw MorphBallBounce_MorphBall_NotBouncing                             ;91F204;
    dw MorphBallBounce_MorphBall_FirstBounce                             ;91F206;
    dw MorphBallBounce_MorphBall_SecondBounce                            ;91F208;

MorphBallBounce_MorphBall_NotBouncing:
    LDA.W $0B2E                                                          ;91F20A;
    CMP.W #$0003                                                         ;91F20D;
    BMI MorphBallBounce_MorphBall_SecondBounce                           ;91F210;
    INC.W $0B20                                                          ;91F212;
    LDA.W #$0001                                                         ;91F215;
    STA.W $0B36                                                          ;91F218;
    LDA.L SamusPhysicsConstants_YSubSpeedWhenBouncingInMorphBall         ;91F21B;
    STA.W $0B2C                                                          ;91F21F;
    LDA.L SamusPhysicsConstants_YSpeedWhenBouncingInMorphBall            ;91F222;
    STA.W $0B2E                                                          ;91F226;
    SEC                                                                  ;91F229;
    RTS                                                                  ;91F22A;


MorphBallBounce_MorphBall_FirstBounce:
    INC.W $0B20                                                          ;91F22B;
    LDA.W #$0001                                                         ;91F22E;
    STA.W $0B36                                                          ;91F231;
    LDA.L SamusPhysicsConstants_YSubSpeedWhenBouncingInMorphBall         ;91F234;
    STA.W $0B2C                                                          ;91F238;
    LDA.L SamusPhysicsConstants_YSpeedWhenBouncingInMorphBall            ;91F23B;
    DEC A                                                                ;91F23F;
    STA.W $0B2E                                                          ;91F240;
    SEC                                                                  ;91F243;
    RTS                                                                  ;91F244;


MorphBallBounce_MorphBall_SecondBounce:
    STZ.W $0B20                                                          ;91F245;
    STZ.W $0B36                                                          ;91F248;
    STZ.W $0B2C                                                          ;91F24B;
    STZ.W $0B2E                                                          ;91F24E;
    CLC                                                                  ;91F251;
    RTS                                                                  ;91F252;


SolidVerticalCollision_Landed_2:
    STZ.W $0B20                                                          ;91F253;
    LDA.W #$0003                                                         ;91F256;
    STA.W $0A46                                                          ;91F259;
    CLC                                                                  ;91F25C;
    RTS                                                                  ;91F25D;


SolidVerticalCollision_Landed_SpringBallGrounded:
    LDA.B $8B                                                            ;91F25E;
    BIT.W $09B4                                                          ;91F260;
    BEQ .notPressingJump                                                 ;91F263;
    STZ.W $0B20                                                          ;91F265;
    JSL.L Make_Samus_Jump                                                ;91F268;
    SEC                                                                  ;91F26C;
    RTS                                                                  ;91F26D;


.notPressingJump:
    LDA.W $0B20                                                          ;91F26E;
    AND.W #$00FF                                                         ;91F271;
    ASL A                                                                ;91F274;
    TAX                                                                  ;91F275;
    JMP.W (.pointers,X)                                                  ;91F276;


.pointers:
    dw MorphBallBounce_SpringBall_NotBouncing                            ;91F279;
    dw MorphBallBounce_SpringBall_FirstBounce                            ;91F27B;
    dw MorphBallBounce_SpringBall_SecondBounce                           ;91F27D;

MorphBallBounce_SpringBall_NotBouncing:
    LDA.W $0B2E                                                          ;91F27F;
    CMP.W #$0003                                                         ;91F282;
    BMI MorphBallBounce_SpringBall_SecondBounce                          ;91F285;
    LDA.W #$0601                                                         ;91F287;
    STA.W $0B20                                                          ;91F28A;
    LDA.W #$0001                                                         ;91F28D;
    STA.W $0B36                                                          ;91F290;
    LDA.L SamusPhysicsConstants_YSubSpeedWhenBouncingInMorphBall         ;91F293;
    STA.W $0B2C                                                          ;91F297;
    LDA.L SamusPhysicsConstants_YSpeedWhenBouncingInMorphBall            ;91F29A;
    STA.W $0B2E                                                          ;91F29E;
    SEC                                                                  ;91F2A1;
    RTS                                                                  ;91F2A2;


MorphBallBounce_SpringBall_FirstBounce:
    LDA.W #$0602                                                         ;91F2A3;
    STA.W $0B20                                                          ;91F2A6;
    LDA.W #$0001                                                         ;91F2A9;
    STA.W $0B36                                                          ;91F2AC;
    LDA.L SamusPhysicsConstants_YSubSpeedWhenBouncingInMorphBall         ;91F2AF;
    STA.W $0B2C                                                          ;91F2B3;
    LDA.L SamusPhysicsConstants_YSpeedWhenBouncingInMorphBall            ;91F2B6;
    DEC A                                                                ;91F2BA;
    STA.W $0B2E                                                          ;91F2BB;
    SEC                                                                  ;91F2BE;
    RTS                                                                  ;91F2BF;


MorphBallBounce_SpringBall_SecondBounce:
    STZ.W $0B20                                                          ;91F2C0;
    STZ.W $0B36                                                          ;91F2C3;
    STZ.W $0B2C                                                          ;91F2C6;
    STZ.W $0B2E                                                          ;91F2C9;
    CLC                                                                  ;91F2CC;
    RTS                                                                  ;91F2CD;


SolidVerticalCollision_5:
    STZ.W $0B20                                                          ;91F2CE;
    CLC                                                                  ;91F2D1;
    RTS                                                                  ;91F2D2;


SolidVerticalCollision_WallJumpTriggered:
    STZ.W $0B4A                                                          ;91F2D3;
    STZ.W $0DCE                                                          ;91F2D6;
    STZ.W $0B22                                                          ;91F2D9;
    STZ.W $0B1A                                                          ;91F2DC;
    STZ.W $0B46                                                          ;91F2DF;
    STZ.W $0B48                                                          ;91F2E2;
    STZ.W $0A18                                                          ;91F2E5;
    LDA.W #$0005                                                         ;91F2E8;
    JSL.L QueueSound_Lib3_Max6                                           ;91F2EB;
    RTS                                                                  ;91F2EF;


SolidVerticalCollision_6:
    LDA.W $0DCE                                                          ;91F2F0;
    BEQ .return                                                          ;91F2F3;
    LDA.W $0A23                                                          ;91F2F5;
    AND.W #$00FF                                                         ;91F2F8;
    CMP.W #$0009                                                         ;91F2FB;
    BNE .return                                                          ;91F2FE;
    LDA.W $0A1E                                                          ;91F300;
    AND.W #$00FF                                                         ;91F303;
    CMP.W #$0004                                                         ;91F306;
    BEQ .disableHorizontalSlopeDetection                                 ;91F309;
    LDA.W #$0001                                                         ;91F30B;
    STA.W $0A46                                                          ;91F30E;
    BRA .returnClear0A18                                                 ;91F311;


.disableHorizontalSlopeDetection:
    STZ.W $0A46                                                          ;91F313;
    BRA .returnClear0A18                                                 ;91F316;


.return:
    RTS                                                                  ;91F318;


.returnClear0A18:
    STZ.W $0A18                                                          ;91F319;
    RTS                                                                  ;91F31C;


SuperSpecialProspectivePoseCmd_1_KnockbackFinished:
    STZ.W $0A52                                                          ;91F31D;
    LDA.W #SamusMovementHandler_Normal                                   ;91F320;
    STA.W $0A58                                                          ;91F323;
    STZ.W $0B20                                                          ;91F326;
    STZ.W $0B2C                                                          ;91F329;
    STZ.W $0B2E                                                          ;91F32C;
    LDA.W #$0001                                                         ;91F32F;
    STA.W $0B22                                                          ;91F332;
    LDA.W #$0002                                                         ;91F335;
    STA.W $0B36                                                          ;91F338;
    JSL.L AlignSamusBottomPositionWithPreviousPose                       ;91F33B;
    LDA.W $0A60                                                          ;91F33F;
    CMP.W #SamusPoseInputHandler_Demo                                    ;91F342;
    BEQ .return                                                          ;91F345;
    LDA.W #SamusPoseInputHandler_Normal                                  ;91F347;
    STA.W $0A60                                                          ;91F34A;

.return:
    RTS                                                                  ;91F34D;


SuperSpecialProspectivePoseCmd_2_ShinesparkFinished:
    JSL.L AlignSamusBottomPositionWithPreviousPose                       ;91F34E;
    LDA.W #SamusMovementHandler_Normal                                   ;91F352;
    STA.W $0A58                                                          ;91F355;
    LDA.W $0998                                                          ;91F358;
    CMP.W #$002A                                                         ;91F35B;
    BEQ .demo                                                            ;91F35E;
    LDA.W #SamusPoseInputHandler_Normal                                  ;91F360;
    STA.W $0A60                                                          ;91F363;
    RTS                                                                  ;91F366;


.demo:
    LDA.W #SamusPoseInputHandler_Demo                                    ;91F367;
    STA.W $0A60                                                          ;91F36A;
    RTS                                                                  ;91F36D;


SuperSpecialProspectivePoseCmd_3_TransitionAnimationFinished:
    STZ.W $0B20                                                          ;91F36E;
    LDA.W $0A94                                                          ;91F371;
    CLC                                                                  ;91F374;
    ADC.W $0A9C                                                          ;91F375;
    STA.W $0A94                                                          ;91F378;
    RTS                                                                  ;91F37B;


SuperSpecialProspectivePoseCmd_4:
    LDA.W $0911                                                          ;91F37C;
    CLC                                                                  ;91F37F;
    ADC.W #$0080                                                         ;91F380;
    STA.W $0AF6                                                          ;91F383;
    STA.W $0B10                                                          ;91F386;
    LDA.W $0915                                                          ;91F389;
    CLC                                                                  ;91F38C;
    ADC.W #$0080                                                         ;91F38D;
    STA.W $0AFA                                                          ;91F390;
    STA.W $0B14                                                          ;91F393;
    RTS                                                                  ;91F396;


SuperSpecialProspectivePoseCmd_5:
    LDA.W $0AFA                                                          ;91F397;
    CLC                                                                  ;91F39A;
    ADC.W #$0005                                                         ;91F39B;
    STA.W $0AFA                                                          ;91F39E;
    STA.W $0B14                                                          ;91F3A1;
    RTS                                                                  ;91F3A4;


SuperSpecialProspectivePoseCmd_6_StartGrappleWallJump:
    JSL.L HandleJumpTransition                                           ;91F3A5;
    RTS                                                                  ;91F3A9;


SuperSpecialProspectivePoseCmd_7_StartReleaseGrappleSwing:
    LDA.W $0AF6                                                          ;91F3AA;
    SEC                                                                  ;91F3AD;
    SBC.W $0B10                                                          ;91F3AE;
    BMI +                                                                ;91F3B1;
    CMP.W #$000D                                                         ;91F3B3;
    BMI .YPosition                                                       ;91F3B6;
    LDA.W $0AF6                                                          ;91F3B8;
    SEC                                                                  ;91F3BB;
    SBC.W #$000C                                                         ;91F3BC;
    STA.W $0B10                                                          ;91F3BF;
    BRA .YPosition                                                       ;91F3C2;


  + CMP.W #$FFF4                                                         ;91F3C4;
    BPL .YPosition                                                       ;91F3C7;
    LDA.W $0AF6                                                          ;91F3C9;
    CLC                                                                  ;91F3CC;
    ADC.W #$000C                                                         ;91F3CD;
    STA.W $0B10                                                          ;91F3D0;

.YPosition:
    LDA.W $0AFA                                                          ;91F3D3;
    SEC                                                                  ;91F3D6;
    SBC.W $0B14                                                          ;91F3D7;
    BMI +                                                                ;91F3DA;
    CMP.W #$000D                                                         ;91F3DC;
    BMI .return                                                          ;91F3DF;
    LDA.W $0AFA                                                          ;91F3E1;
    SEC                                                                  ;91F3E4;
    SBC.W #$000C                                                         ;91F3E5;
    STA.W $0B14                                                          ;91F3E8;
    BRA .return                                                          ;91F3EB;


  + CMP.W #$FFF4                                                         ;91F3ED;
    BPL .return                                                          ;91F3F0;
    LDA.W $0AFA                                                          ;91F3F2;
    CLC                                                                  ;91F3F5;
    ADC.W #$000C                                                         ;91F3F6;
    STA.W $0B14                                                          ;91F3F9;

.return:
    RTS                                                                  ;91F3FC;


SuperSpecialProspectivePoseCmd_8_KnockbackAndTransAnimFinish:
    JSR.W SuperSpecialProspectivePoseCmd_1_KnockbackFinished             ;91F3FD;
    JSR.W SuperSpecialProspectivePoseCmd_3_TransitionAnimationFinished   ;91F400;
    RTS                                                                  ;91F403;


HandleSamusPoseChange:
    PHP                                                                  ;91F404;
    PHB                                                                  ;91F405;
    PHK                                                                  ;91F406;
    PLB                                                                  ;91F407;
    REP #$30                                                             ;91F408;
    LDA.W $0A1C                                                          ;91F40A;
    PHA                                                                  ;91F40D;
    CMP.W $0A20                                                          ;91F40E;
    BEQ .noChange                                                        ;91F411;
    JSR.W HandlePoseChangeCollision                                      ;91F413;
    JSL.L InitializeSamusPose_1                                          ;91F416;
    JSL.L HandleJumpTransition                                           ;91F41A;
    JSL.L Set_Samus_AnimationFrame_if_PoseChanged                        ;91F41E;
    STZ.W $0A9A                                                          ;91F422;

.noChange:
    PLA                                                                  ;91F425;
    CMP.W $0A1C                                                          ;91F426;
    BNE .poseChange                                                      ;91F429;
    PLB                                                                  ;91F42B;
    PLP                                                                  ;91F42C;
    CLC                                                                  ;91F42D;
    RTL                                                                  ;91F42E;


.poseChange:
    PLB                                                                  ;91F42F;
    PLP                                                                  ;91F430;
    SEC                                                                  ;91F431;
    RTL                                                                  ;91F432;


InitializeSamusPose_1:
    PHP                                                                  ;91F433;
    PHB                                                                  ;91F434;
    PHK                                                                  ;91F435;
    PLB                                                                  ;91F436;
    REP #$30                                                             ;91F437;
    LDA.W $0A1C                                                          ;91F439;
    ASL A                                                                ;91F43C;
    ASL A                                                                ;91F43D;
    ASL A                                                                ;91F43E;
    TAX                                                                  ;91F43F;
    LDA.W PoseDefinitions_00_XDirection,X                                ;91F440;
    STA.W $0A1E                                                          ;91F443;
    JSR.W InitializeSamusPose_2                                          ;91F446;
    LDA.W $0A23                                                          ;91F449;
    AND.W #$00FF                                                         ;91F44C;
    CMP.W #$0003                                                         ;91F44F;
    BEQ .spinJumping                                                     ;91F452;
    CMP.W #$0014                                                         ;91F454;
    BNE .return                                                          ;91F457;

.spinJumping:
    LDA.W $09A2                                                          ;91F459;
    BIT.W #$0008                                                         ;91F45C;
    BEQ .return                                                          ;91F45F;
    JSL.L LoadSamusSuitPalette                                           ;91F461;

.return:
    PLB                                                                  ;91F465;
    PLP                                                                  ;91F466;
    RTL                                                                  ;91F467;


InitializeSamusPose_2:
    PHP                                                                  ;91F468;
    REP #$30                                                             ;91F469;
    LDA.W $0A1F                                                          ;91F46B;
    AND.W #$00FF                                                         ;91F46E;
    ASL A                                                                ;91F471;
    TAX                                                                  ;91F472;
    JSR.W (.pointers,X)                                                  ;91F473;
    BCC .return                                                          ;91F476;
    LDA.W $0A1C                                                          ;91F478;
    ASL A                                                                ;91F47B;
    ASL A                                                                ;91F47C;
    ASL A                                                                ;91F47D;
    TAX                                                                  ;91F47E;
    LDA.W PoseDefinitions_00_XDirection,X                                ;91F47F;
    STA.W $0A1E                                                          ;91F482;
    AND.W #$FF00                                                         ;91F485;
    CMP.W #$0E00                                                         ;91F488;
    BNE .return                                                          ;91F48B;
    XBA                                                                  ;91F48D;
    ASL A                                                                ;91F48E;
    TAX                                                                  ;91F48F;
    JSR.W (.pointers,X)                                                  ;91F490;
    LDA.W $0A1C                                                          ;91F493;
    ASL A                                                                ;91F496;
    ASL A                                                                ;91F497;
    ASL A                                                                ;91F498;
    TAX                                                                  ;91F499;
    LDA.W PoseDefinitions_00_XDirection,X                                ;91F49A;
    STA.W $0A1E                                                          ;91F49D;

.return:
    PLP                                                                  ;91F4A0;
    RTS                                                                  ;91F4A1;


.pointers:
    dw InitializeSamusPose_Standing                                      ;91F4A2;
    dw InitializeSamusPose_Running                                       ;91F4A4;
    dw InitializeSamusPose_NormalJumping                                 ;91F4A6;
    dw InitializeSamusPose_SpinJumping                                   ;91F4A8;
    dw InitializeSamusPose_MorphBall                                     ;91F4AA;
    dw InitializeSamusPose_Crouching                                     ;91F4AC;
    dw InitializeSamusPose_Falling                                       ;91F4AE;
    dw CLCRTS_91F4DA                                                     ;91F4B0;
    dw InitializeSamusPose_MorphBall                                     ;91F4B2;
    dw CLCRTS_91F4DA                                                     ;91F4B4;
    dw CLCRTS_91F4DA                                                     ;91F4B6;
    dw CLCRTS_91F4DA                                                     ;91F4B8;
    dw CLCRTS_91F4DA                                                     ;91F4BA;
    dw CLCRTS_91F4DA                                                     ;91F4BC;
    dw InitializeSamusPose_TurningAround_OnGround                        ;91F4BE;
    dw InitializeSamusPose_TransitionPoses                               ;91F4C0;
    dw InitializeSamusPose_Moonwalking                                   ;91F4C2;
    dw InitializeSamusPose_SpringBall                                    ;91F4C4;
    dw InitializeSamusPose_SpringBall                                    ;91F4C6;
    dw InitializeSamusPose_SpringBall                                    ;91F4C8;
    dw InitializeSamusPose_WallJumping                                   ;91F4CA;
    dw CLCRTS_91F4DA                                                     ;91F4CC;
    dw CLCRTS_91F4DA                                                     ;91F4CE;
    dw InitializeSamusPose_TurningAround_Jumping                         ;91F4D0;
    dw InitializeSamusPose_TurningAround_Falling                         ;91F4D2;
    dw InitializeSamusPose_DamageBoost                                   ;91F4D4;
    dw CLCRTS_91F4DA                                                     ;91F4D6;
    dw InitializeSamusPose_Shinespark_CF_Drained_DamagedMB               ;91F4D8;

CLCRTS_91F4DA:
    CLC                                                                  ;91F4DA;
    RTS                                                                  ;91F4DB;


InitializeSamusPose_Standing:
    LDA.W $0A1C                                                          ;91F4DC;
    ASL A                                                                ;91F4DF;
    ASL A                                                                ;91F4E0;
    ASL A                                                                ;91F4E1;
    TAX                                                                  ;91F4E2;
    LDA.W PoseDefinitions_directionShotsFired,X                          ;91F4E3;
    AND.W #$00FF                                                         ;91F4E6;
    BEQ +                                                                ;91F4E9;
    CMP.W #$0009                                                         ;91F4EB;
    BNE .returnCarryClear                                                ;91F4EE;

  + LDA.W $0A20                                                          ;91F4F0;
    ASL A                                                                ;91F4F3;
    ASL A                                                                ;91F4F4;
    ASL A                                                                ;91F4F5;
    TAX                                                                  ;91F4F6;
    LDA.W PoseDefinitions_directionShotsFired,X                          ;91F4F7;
    AND.W #$00FF                                                         ;91F4FA;
    BEQ .up                                                              ;91F4FD;
    CMP.W #$0009                                                         ;91F4FF;
    BNE .returnCarryClear                                                ;91F502;

.up:
    LDA.W #$0001                                                         ;91F504;
    STA.W $0A9A                                                          ;91F507;

.returnCarryClear:
    CLC                                                                  ;91F50A;
    RTS                                                                  ;91F50B;


InitializeSamusPose_Running:
    LDA.W $0A23                                                          ;91F50C;
    AND.W #$00FF                                                         ;91F50F;
    CMP.W #$0001                                                         ;91F512;
    BNE .notRunning                                                      ;91F515;
    LDA.W #$8000                                                         ;91F517;
    STA.W $0A9A                                                          ;91F51A;

.notRunning:
    LDA.W $0DF8                                                          ;91F51D;
    BEQ .returnCarryClear                                                ;91F520;
    LDA.W $0A1C                                                          ;91F522;
    CMP.W #$0045                                                         ;91F525;
    BEQ .turnLeft                                                        ;91F528;
    CMP.W #$0046                                                         ;91F52A;
    BEQ .turnRight                                                       ;91F52D;
    BRA .returnCarryClear                                                ;91F52F;


.turnLeft:
    LDA.W #$0025                                                         ;91F531;
    STA.W $0A1C                                                          ;91F534;
    BRA .returnCarrySet                                                  ;91F537;


.turnRight:
    LDA.W #$0026                                                         ;91F539;
    STA.W $0A1C                                                          ;91F53C;

.returnCarrySet:
    SEC                                                                  ;91F53F;
    RTS                                                                  ;91F540;


.returnCarryClear:
    CLC                                                                  ;91F541;
    RTS                                                                  ;91F542;


InitializeSamusPose_NormalJumping:
    LDA.W $0A1C                                                          ;91F543;
    CMP.W #$004E                                                         ;91F546;
    BEQ .shinesparkFacingLeft                                            ;91F549;
    CMP.W #$004D                                                         ;91F54B;
    BEQ .shinesparkFacingRight                                           ;91F54E;
    CMP.W #$0015                                                         ;91F550;
    BEQ .shinesparkFacingRight                                           ;91F553;
    CMP.W #$0016                                                         ;91F555;
    BEQ .shinesparkFacingLeft                                            ;91F558;
    CMP.W #$006A                                                         ;91F55A;
    BEQ .shinesparkFacingLeft                                            ;91F55D;
    CMP.W #$0069                                                         ;91F55F;
    BNE .notShinespark                                                   ;91F562;

.shinesparkFacingRight:
    LDA.W $0A68                                                          ;91F564;
    BEQ .notShinespark                                                   ;91F567;
    LDA.W #$00C7                                                         ;91F569;
    STA.W $0A1C                                                          ;91F56C;
    BRA .shinesparkMerge                                                 ;91F56F;


.shinesparkFacingLeft:
    LDA.W $0A68                                                          ;91F571;
    BEQ .notShinespark                                                   ;91F574;
    LDA.W #$00C8                                                         ;91F576;
    STA.W $0A1C                                                          ;91F579;

.shinesparkMerge:
    JSL.L TriggerShinesparkWindup                                        ;91F57C;
    LDA.W $0A23                                                          ;91F580;
    AND.W #$00FF                                                         ;91F583;
    CMP.W #$0002                                                         ;91F586;
    BNE .returnCarrySet                                                  ;91F589;
    LDA.W $0AFA                                                          ;91F58B;
    SEC                                                                  ;91F58E;
    SBC.W #$0001                                                         ;91F58F;
    STA.W $0AFA                                                          ;91F592;
    STA.W $0B14                                                          ;91F595;

.returnCarrySet:
    SEC                                                                  ;91F598;
    RTS                                                                  ;91F599;


.notShinespark:
    LDA.W $0B42                                                          ;91F59A;
    BNE .nonZeroExtraRunSpeed                                            ;91F59D;
    LDA.W $0B44                                                          ;91F59F;
    BNE .nonZeroExtraRunSpeed                                            ;91F5A2;
    STZ.W $0B4A                                                          ;91F5A4;
    BRA +                                                                ;91F5A7;


.nonZeroExtraRunSpeed:
    LDA.W #$0002                                                         ;91F5A9;
    STA.W $0B4A                                                          ;91F5AC;

  + LDA.W $0A1C                                                          ;91F5AF;
    CMP.W #$0015                                                         ;91F5B2;
    BEQ .normalJump                                                      ;91F5B5;
    CMP.W #$0016                                                         ;91F5B7;
    BNE .noAnimationSkip                                                 ;91F5BA;

.normalJump:
    LDA.W $0A20                                                          ;91F5BC;
    CMP.W #$0055                                                         ;91F5BF;
    BEQ .skipArmCannonMovingUp                                           ;91F5C2;
    CMP.W #$0056                                                         ;91F5C4;
    BNE .noAnimationSkip                                                 ;91F5C7;

.skipArmCannonMovingUp:
    LDA.W #$0001                                                         ;91F5C9;
    STA.W $0A9A                                                          ;91F5CC;

.noAnimationSkip:
    LDA.B $8F                                                            ;91F5CF;
    BIT.W $09B2                                                          ;91F5D1;
    BEQ .returnCarryClear                                                ;91F5D4;
    LDA.W $0A1C                                                          ;91F5D6;
    ASL A                                                                ;91F5D9;
    ASL A                                                                ;91F5DA;
    ASL A                                                                ;91F5DB;
    TAX                                                                  ;91F5DC;
    LDA.W PoseDefinitions_directionShotsFired,X                          ;91F5DD;
    AND.W #$00FF                                                         ;91F5E0;
    ORA.W #$8000                                                         ;91F5E3;
    STA.W $0B5E                                                          ;91F5E6;

.returnCarryClear:
    CLC                                                                  ;91F5E9;
    RTS                                                                  ;91F5EA;


InitializeSamusPose_Crouching:
    LDA.W $0A1C                                                          ;91F5EB;
    CMP.W #$0085                                                         ;91F5EE;
    BEQ .crouchingAimingUp                                               ;91F5F1;
    CMP.W #$0086                                                         ;91F5F3;
    BNE .returnCarryClear                                                ;91F5F6;

.crouchingAimingUp:
    LDA.W $0A20                                                          ;91F5F8;
    CMP.W #$00F1                                                         ;91F5FB;
    BEQ .skipArmCannonMovingUp                                           ;91F5FE;
    CMP.W #$00F2                                                         ;91F600;
    BNE .returnCarryClear                                                ;91F603;

.skipArmCannonMovingUp:
    LDA.W #$0001                                                         ;91F605;
    STA.W $0A9A                                                          ;91F608;

.returnCarryClear:
    CLC                                                                  ;91F60B;
    RTS                                                                  ;91F60C;


InitializeSamusPose_Falling:
    LDA.W $0B42                                                          ;91F60D;
    BNE .nonZeroExtraRunSpeed                                            ;91F610;
    LDA.W $0B44                                                          ;91F612;
    BNE .nonZeroExtraRunSpeed                                            ;91F615;
    STZ.W $0B4A                                                          ;91F617;
    BRA .returnCarryClear                                                ;91F61A;


.nonZeroExtraRunSpeed:
    LDA.W #$0002                                                         ;91F61C;
    STA.W $0B4A                                                          ;91F61F;

.returnCarryClear:
    CLC                                                                  ;91F622;
    RTS                                                                  ;91F623;


InitializeSamusPose_SpinJumping:
    LDA.W $0A23                                                          ;91F624;
    AND.W #$00FF                                                         ;91F627;
    CMP.W #$0003                                                         ;91F62A;
    BEQ .spinJumping                                                     ;91F62D;
    CMP.W #$0014                                                         ;91F62F;
    BNE .notTurningAround                                                ;91F632;

.spinJumping:
    LDA.W #$0001                                                         ;91F634;
    STA.W $0A9A                                                          ;91F637;
    LDA.W $0A22                                                          ;91F63A;
    AND.W #$000F                                                         ;91F63D;
    CMP.W #$0008                                                         ;91F640;
    BEQ +                                                                ;91F643;
    CMP.W #$0004                                                         ;91F645;
    BNE .notTurningAround                                                ;91F648;
    LDA.W $0A1E                                                          ;91F64A;
    CMP.W #$0308                                                         ;91F64D;
    BEQ .speed                                                           ;91F650;
    BRA .notTurningAround                                                ;91F652;


  + LDA.W $0A1E                                                          ;91F654;
    CMP.W #$0304                                                         ;91F657;
    BNE .notTurningAround                                                ;91F65A;

.speed:
    LDA.W $0B44                                                          ;91F65C;
    CLC                                                                  ;91F65F;
    ADC.W $0B48                                                          ;91F660;
    STA.W $0B48                                                          ;91F663;
    LDA.W $0B42                                                          ;91F666;
    ADC.W $0B46                                                          ;91F669;
    STA.W $0B46                                                          ;91F66C;
    JSL.L Cancel_SpeedBoosting                                           ;91F66F;
    STZ.W $0B44                                                          ;91F673;
    STZ.W $0B42                                                          ;91F676;
    LDA.W #$0001                                                         ;91F679;
    STA.W $0B4A                                                          ;91F67C;

.notTurningAround:
    LDA.W $0A1E                                                          ;91F67F;
    AND.W #$00FF                                                         ;91F682;
    CMP.W #$0004                                                         ;91F685;
    BEQ .facingLeft                                                      ;91F688;
    LDA.W $09A2                                                          ;91F68A;
    BIT.W #$0020                                                         ;91F68D;
    BNE .nonLiquidPhysicsRight                                           ;91F690;
    JSL.L Get_Samus_BottomTop_Boundary                                   ;91F692;
    LDA.W $195E                                                          ;91F696;
    BMI .negativeYPosition                                               ;91F699;
    CMP.B $14                                                            ;91F69B;
    BPL .nonLiquidPhysicsRight                                           ;91F69D;
    LDA.W $197E                                                          ;91F69F;
    BIT.W #$0004                                                         ;91F6A2;
    BNE .nonLiquidPhysicsRight                                           ;91F6A5;
    BRA .returnUpperCarryClear                                           ;91F6A7;


.negativeYPosition:
    LDA.W $1962                                                          ;91F6A9;
    BMI .nonLiquidPhysicsRight                                           ;91F6AC;
    CMP.B $14                                                            ;91F6AE;
    BMI .returnUpperCarryClear                                           ;91F6B0;

.nonLiquidPhysicsRight:
    LDA.W $09A2                                                          ;91F6B2;
    BIT.W #$0008                                                         ;91F6B5;
    BNE .screwAttackRight                                                ;91F6B8;
    BIT.W #$0200                                                         ;91F6BA;
    BNE .spaceJumpRight                                                  ;91F6BD;
    LDA.W $0A9A                                                          ;91F6BF;
    BEQ .spinJumpRight                                                   ;91F6C2;

.returnUpperCarryClear:
    CLC                                                                  ;91F6C4;
    RTS                                                                  ;91F6C5;


.spinJumpRight:
    LDA.W $1F51                                                          ;91F6C6;
    BNE .returnUpperCarryClear                                           ;91F6C9;
    LDA.W #$0031                                                         ;91F6CB;
    JSL.L QueueSound_Lib1_Max6                                           ;91F6CE;
    CLC                                                                  ;91F6D2;
    RTS                                                                  ;91F6D3;


.spaceJumpRight:
    LDA.W #$003E                                                         ;91F6D4;
    JSL.L QueueSound_Lib1_Max6                                           ;91F6D7;
    LDA.W #$001B                                                         ;91F6DB;
    STA.W $0A1C                                                          ;91F6DE;
    CLC                                                                  ;91F6E1;
    RTS                                                                  ;91F6E2;


.screwAttackRight:
    LDA.W #$0081                                                         ;91F6E3;
    STA.W $0A1C                                                          ;91F6E6;
    BRA .screwAttackSFX                                                  ;91F6E9;


.facingLeft:
    LDA.W $09A2                                                          ;91F6EB;
    BIT.W #$0020                                                         ;91F6EE;
    BNE .nonLiquidPhysicsLeft                                            ;91F6F1;
    JSL.L Get_Samus_BottomTop_Boundary                                   ;91F6F3;
    LDA.W $195E                                                          ;91F6F7;
    BMI .negativeYPosition2                                              ;91F6FA;
    CMP.B $14                                                            ;91F6FC;
    BPL .nonLiquidPhysicsLeft                                            ;91F6FE;
    LDA.W $197E                                                          ;91F700;
    BIT.W #$0004                                                         ;91F703;
    BNE .nonLiquidPhysicsLeft                                            ;91F706;
    BRA .returnMiddleCarryClear                                          ;91F708;


.negativeYPosition2:
    LDA.W $1962                                                          ;91F70A;
    BMI .nonLiquidPhysicsLeft                                            ;91F70D;
    CMP.B $14                                                            ;91F70F;
    BMI .returnMiddleCarryClear                                          ;91F711;

.nonLiquidPhysicsLeft:
    LDA.W $09A2                                                          ;91F713;
    BIT.W #$0008                                                         ;91F716;
    BNE .screwAttackLeft                                                 ;91F719;
    BIT.W #$0200                                                         ;91F71B;
    BNE .spaceJumpLeft                                                   ;91F71E;
    LDA.W $0A9A                                                          ;91F720;
    BEQ .spinJumpLeft                                                    ;91F723;

.returnMiddleCarryClear:
    CLC                                                                  ;91F725;
    RTS                                                                  ;91F726;


.spinJumpLeft:
    LDA.W $1F51                                                          ;91F727;
    BNE .returnMiddleCarryClear                                          ;91F72A;
    LDA.W #$0031                                                         ;91F72C;
    JSL.L QueueSound_Lib1_Max6                                           ;91F72F;
    CLC                                                                  ;91F733;
    RTS                                                                  ;91F734;


.spaceJumpLeft:
    LDA.W #$003E                                                         ;91F735;
    JSL.L QueueSound_Lib1_Max6                                           ;91F738;
    LDA.W #$001C                                                         ;91F73C;
    STA.W $0A1C                                                          ;91F73F;
    CLC                                                                  ;91F742;
    RTS                                                                  ;91F743;


.screwAttackLeft:
    LDA.W #$0082                                                         ;91F744;
    STA.W $0A1C                                                          ;91F747;

.screwAttackSFX:
    LDA.W $0A9A                                                          ;91F74A;
    BNE .returnLowerCarryClear                                           ;91F74D;
    LDA.W #$0033                                                         ;91F74F;
    JSL.L QueueSound_Lib1_Max6                                           ;91F752;

.returnLowerCarryClear:
    CLC                                                                  ;91F756;
    RTS                                                                  ;91F757;


InitializeSamusPose_TransitionPoses:
    LDA.W $0A1C                                                          ;91F758;
    CMP.W #$00F1                                                         ;91F75B;
    BPL .aiming                                                          ;91F75E;
    CMP.W #$00DB                                                         ;91F760;
    BPL .unused                                                          ;91F763;
    SEC                                                                  ;91F765;
    SBC.W #$0035                                                         ;91F766;
    ASL A                                                                ;91F769;
    TAX                                                                  ;91F76A;

  - LDA.W #$0007                                                         ;91F76B;
    STA.W $0A2E                                                          ;91F76E;
    JSR.W (.pointers,X)                                                  ;91F771;
    RTS                                                                  ;91F774;


.unused:
    SEC                                                                  ;91F775;
    SBC.W #$00DB                                                         ;91F776;
    ASL A                                                                ;91F779;
    TAX                                                                  ;91F77A;
    JSR.W (.unusedPointers,X)                                            ;91F77B;
    RTS                                                                  ;91F77E;


.aiming:
    CMP.W #$00F7                                                         ;91F77F;
    BPL .startTransition                                                 ;91F782;
    LDX.W #$0000                                                         ;91F784;
    BRA -                                                                ;91F787;


.startTransition:
    LDA.W #$0007                                                         ;91F789;
    STA.W $0A2E                                                          ;91F78C;
    RTS                                                                  ;91F78F;


.pointers:
    dw InitializeSamusPose_CrouchingTransition                           ;91F790;
    dw InitializeSamusPose_CrouchingTransition                           ;91F792;
    dw InitializeSamusPose_MorphingTransition                            ;91F794;
    dw InitializeSamusPose_MorphingTransition                            ;91F796;
    dw UNUSED_InitializeSamusPose_UnusedPose39_91F7F4                    ;91F798;
    dw UNUSED_InitializeSamusPose_UnusedPose3A_91F840                    ;91F79A;
    dw CLCRTS_91F7CC                                                     ;91F79C;
    dw CLCRTS_91F7CC                                                     ;91F79E;
    dw CLCRTS_91F7CC                                                     ;91F7A0;
    dw CLCRTS_91F7CC                                                     ;91F7A2;
    dw CLCRTS_91F7CC                                                     ;91F7A4;
    dw CLCRTS_91F7CC                                                     ;91F7A6;

.unusedPointers:
    dw InitializeSamusPose_MorphingTransition                            ;91F7A8; Unused poses D8-DE
    dw InitializeSamusPose_MorphingTransition                            ;91F7AA;
    dw CLCRTS_91F7CC                                                     ;91F7AC;
    dw CLCRTS_91F7CC                                                     ;91F7AE;

InitializeSamusPose_CrouchingTransition:
    LDA.W $0B3E                                                          ;91F7B0;
    AND.W #$FF00                                                         ;91F7B3;
    CMP.W #$0400                                                         ;91F7B6;
    BMI .returnCarryClear                                                ;91F7B9;
    LDA.W #$00B4                                                         ;91F7BB;
    STA.W $0A68                                                          ;91F7BE;
    LDA.W #$0001                                                         ;91F7C1;
    STA.W $0ACC                                                          ;91F7C4;
    STZ.W $0ACE                                                          ;91F7C7;

.returnCarryClear:
    CLC                                                                  ;91F7CA;
    RTS                                                                  ;91F7CB;


CLCRTS_91F7CC:
    CLC                                                                  ;91F7CC;
    RTS                                                                  ;91F7CD;


InitializeSamusPose_MorphingTransition:
    LDA.W $09A2                                                          ;91F7CE;
    BIT.W #$0004                                                         ;91F7D1;
    BEQ .noMorphBall                                                     ;91F7D4;
    LDA.W $0A23                                                          ;91F7D6;
    AND.W #$00FF                                                         ;91F7D9;
    CMP.W #$0003                                                         ;91F7DC;
    BNE .spinJumping                                                     ;91F7DF;
    LDA.W #$0002                                                         ;91F7E1;
    STA.W $0B4A                                                          ;91F7E4;

.spinJumping:
    STZ.W $0CD4                                                          ;91F7E7;
    CLC                                                                  ;91F7EA;
    RTS                                                                  ;91F7EB;


.noMorphBall:
    LDA.W $0A20                                                          ;91F7EC;
    STA.W $0A1C                                                          ;91F7EF;
    SEC                                                                  ;91F7F2;
    RTS                                                                  ;91F7F3;


UNUSED_InitializeSamusPose_UnusedPose39_91F7F4:
    LDA.W $0A23                                                          ;91F7F4;
    AND.W #$00FF                                                         ;91F7F7;
    CMP.W #$0008                                                         ;91F7FA;
    BEQ .wasFalling                                                      ;91F7FD;
    CMP.W #$0013                                                         ;91F7FF;
    BEQ .wasFalling                                                      ;91F802;
    LDA.W $09A2                                                          ;91F804;
    BIT.W #$0000                                                         ;91F807;
    BNE .returnCarryClear                                                ;91F80A;
    BIT.W #$0002                                                         ;91F80C;
    BNE .facingRight                                                     ;91F80F;
    LDA.W #$001D                                                         ;91F811;
    STA.W $0A1C                                                          ;91F814;
    BRA .returnCarrySet                                                  ;91F817;


.facingRight:
    LDA.W #$0079                                                         ;91F819;
    STA.W $0A1C                                                          ;91F81C;
    BRA .returnCarrySet                                                  ;91F81F;


.wasFalling:
    LDA.W $09A2                                                          ;91F821;
    BIT.W #$0000                                                         ;91F824;
    BNE .returnCarryClear                                                ;91F827;
    BIT.W #$0002                                                         ;91F829;
    BNE ..facingRight                                                    ;91F82C;
    LDA.W #$0031                                                         ;91F82E;
    STA.W $0A1C                                                          ;91F831;
    BRA .returnCarrySet                                                  ;91F834;


..facingRight:
    LDA.W #$007D                                                         ;91F836;
    STA.W $0A1C                                                          ;91F839;

.returnCarrySet:
    SEC                                                                  ;91F83C;
    RTS                                                                  ;91F83D;


.returnCarryClear:
    CLC                                                                  ;91F83E;
    RTS                                                                  ;91F83F;


UNUSED_InitializeSamusPose_UnusedPose3A_91F840:
    LDA.W $0A23                                                          ;91F840;
    AND.W #$00FF                                                         ;91F843;
    CMP.W #$0008                                                         ;91F846;
    BEQ .wasFalling                                                      ;91F849;
    CMP.W #$0013                                                         ;91F84B;
    BEQ .wasFalling                                                      ;91F84E;
    LDA.W $09A2                                                          ;91F850;
    BIT.W #$0000                                                         ;91F853;
    BNE .returnCarryClear                                                ;91F856;
    BIT.W #$0002                                                         ;91F858;
    BNE .springBall                                                      ;91F85B;
    LDA.W #$0041                                                         ;91F85D;
    STA.W $0A1C                                                          ;91F860;
    BRA .returnCarrySet                                                  ;91F863;


.springBall:
    LDA.W #$007A                                                         ;91F865;
    STA.W $0A1C                                                          ;91F868;
    BRA .returnCarrySet                                                  ;91F86B;


.wasFalling:
    LDA.W $09A2                                                          ;91F86D;
    BIT.W #$0000                                                         ;91F870;
    BNE .returnCarryClear                                                ;91F873;
    BIT.W #$0002                                                         ;91F875;
    BNE ..springBall                                                     ;91F878;
    LDA.W #$0032                                                         ;91F87A;
    STA.W $0A1C                                                          ;91F87D;
    BRA .returnCarrySet                                                  ;91F880;


..springBall:
    LDA.W #$007E                                                         ;91F882;
    STA.W $0A1C                                                          ;91F885;

.returnCarrySet:
    SEC                                                                  ;91F888;
    RTS                                                                  ;91F889;


.returnCarryClear:
    CLC                                                                  ;91F88A;
    RTS                                                                  ;91F88B;


InitializeSamusPose_Moonwalking:
    LDA.W $09E4                                                          ;91F88C;
    BEQ .enabled                                                         ;91F88F;
    CLC                                                                  ;91F891;
    RTS                                                                  ;91F892;


.enabled:
    LDA.W $0A1E                                                          ;91F893;
    AND.W #$00FF                                                         ;91F896;
    CMP.W #$0004                                                         ;91F899;
    BEQ .facingLeft                                                      ;91F89C;
    LDA.W #$0026                                                         ;91F89E;
    STA.W $0A1C                                                          ;91F8A1;
    BRA .returnCarrySet                                                  ;91F8A4;


.facingLeft:
    LDA.W #$0025                                                         ;91F8A6;
    STA.W $0A1C                                                          ;91F8A9;

.returnCarrySet:
    SEC                                                                  ;91F8AC;
    RTS                                                                  ;91F8AD;


InitializeSamusPose_DamageBoost:
    BRA .nonDeadCode                                                     ;91F8AE;

    LDA.W $0A1E                                                          ;91F8B0;
    AND.W #$00FF                                                         ;91F8B3;
    CMP.W #$0004                                                         ;91F8B6;
    BEQ .facingLeft                                                      ;91F8B9;
    LDA.W #$0053                                                         ;91F8BB;
    STA.W $0A1C                                                          ;91F8BE;
    BRA .returnCarrySet                                                  ;91F8C1;


.facingLeft:
    LDA.W #$0054                                                         ;91F8C3;
    STA.W $0A1C                                                          ;91F8C6;

.returnCarrySet:
    SEC                                                                  ;91F8C9;
    RTS                                                                  ;91F8CA;


.nonDeadCode:
    LDA.W #SamusMovementHandler_Normal                                   ;91F8CB;
    STA.W $0A58                                                          ;91F8CE;
    CLC                                                                  ;91F8D1;
    RTS                                                                  ;91F8D2;


InitializeSamusPose_TurningAround_OnGround:
    LDA.W $0A20                                                          ;91F8D3;
    BEQ .done                                                            ;91F8D6;
    CMP.W #$009B                                                         ;91F8D8;
    BEQ .done                                                            ;91F8DB;
    ASL A                                                                ;91F8DD;
    ASL A                                                                ;91F8DE;
    ASL A                                                                ;91F8DF;
    TAX                                                                  ;91F8E0;
    LDA.W PoseDefinitions_directionShotsFired,X                          ;91F8E1;
    AND.W #$00FF                                                         ;91F8E4;
    TAX                                                                  ;91F8E7;
    LDA.W $0A23                                                          ;91F8E8;
    AND.W #$00FF                                                         ;91F8EB;
    CMP.W #$0010                                                         ;91F8EE;
    BNE .notMoonwalking                                                  ;91F8F1;
    LDA.W $0A20                                                          ;91F8F3;
    ASL A                                                                ;91F8F6;
    ASL A                                                                ;91F8F7;
    ASL A                                                                ;91F8F8;
    TAY                                                                  ;91F8F9;
    LDA.W PoseDefinitions_directionShotsFired,Y                          ;91F8FA;
    AND.W #$00FF                                                         ;91F8FD;
    ORA.W #$0100                                                         ;91F900;
    STA.W $0B5E                                                          ;91F903;
    LDA.B $8B                                                            ;91F906;
    BIT.W $09B4                                                          ;91F908;
    BEQ .standing                                                        ;91F90B;
    LDA.W TurningSamusPoses_moonwalk,X                                   ;91F90D;
    AND.W #$00FF                                                         ;91F910;
    STA.W $0A1C                                                          ;91F913;
    BRA .done                                                            ;91F916;


.notMoonwalking:
    CMP.W #$0005                                                         ;91F918;
    BEQ .crouching                                                       ;91F91B;

.standing:
    LDA.W TurningSamusPoses_standing,X                                   ;91F91D;
    AND.W #$00FF                                                         ;91F920;
    STA.W $0A1C                                                          ;91F923;
    BRA .done                                                            ;91F926;


.crouching:
    LDA.W TurningSamusPoses_crouching,X                                  ;91F928;
    AND.W #$00FF                                                         ;91F92B;
    STA.W $0A1C                                                          ;91F92E;

.done:
    LDA.W $0B44                                                          ;91F931;
    CLC                                                                  ;91F934;
    ADC.W $0B48                                                          ;91F935;
    STA.W $0B48                                                          ;91F938;
    LDA.W $0B42                                                          ;91F93B;
    ADC.W $0B46                                                          ;91F93E;
    STA.W $0B46                                                          ;91F941;
    STZ.W $0B44                                                          ;91F944;
    STZ.W $0B42                                                          ;91F947;
    LDA.W #$0001                                                         ;91F94A;
    STA.W $0B4A                                                          ;91F94D;
    SEC                                                                  ;91F950;
    RTS                                                                  ;91F951;


InitializeSamusPose_TurningAround_Jumping:
    LDA.W $0A20                                                          ;91F952;
    ASL A                                                                ;91F955;
    ASL A                                                                ;91F956;
    ASL A                                                                ;91F957;
    TAX                                                                  ;91F958;
    LDA.W PoseDefinitions_directionShotsFired,X                          ;91F959;
    AND.W #$00FF                                                         ;91F95C;
    TAX                                                                  ;91F95F;
    LDA.W TurningSamusPoses_jumpingInAir,X                               ;91F960;
    AND.W #$00FF                                                         ;91F963;
    STA.W $0A1C                                                          ;91F966;
    LDA.W $0B44                                                          ;91F969;
    CLC                                                                  ;91F96C;
    ADC.W $0B48                                                          ;91F96D;
    STA.W $0B48                                                          ;91F970;
    LDA.W $0B42                                                          ;91F973;
    ADC.W $0B46                                                          ;91F976;
    STA.W $0B46                                                          ;91F979;
    STZ.W $0B44                                                          ;91F97C;
    STZ.W $0B42                                                          ;91F97F;
    LDA.W #$0001                                                         ;91F982;
    STA.W $0B4A                                                          ;91F985;
    SEC                                                                  ;91F988;
    RTS                                                                  ;91F989;


InitializeSamusPose_TurningAround_Falling:
    LDA.W $0A20                                                          ;91F98A;
    ASL A                                                                ;91F98D;
    ASL A                                                                ;91F98E;
    ASL A                                                                ;91F98F;
    TAX                                                                  ;91F990;
    LDA.W PoseDefinitions_directionShotsFired,X                          ;91F991;
    AND.W #$00FF                                                         ;91F994;
    TAX                                                                  ;91F997;
    LDA.W TurningSamusPoses_falling,X                                    ;91F998;
    AND.W #$00FF                                                         ;91F99B;
    STA.W $0A1C                                                          ;91F99E;
    LDA.W $0B44                                                          ;91F9A1;
    CLC                                                                  ;91F9A4;
    ADC.W $0B48                                                          ;91F9A5;
    STA.W $0B48                                                          ;91F9A8;
    LDA.W $0B42                                                          ;91F9AB;
    ADC.W $0B46                                                          ;91F9AE;
    STA.W $0B46                                                          ;91F9B1;
    STZ.W $0B44                                                          ;91F9B4;
    STZ.W $0B42                                                          ;91F9B7;
    LDA.W #$0001                                                         ;91F9BA;
    STA.W $0B4A                                                          ;91F9BD;
    SEC                                                                  ;91F9C0;
    RTS                                                                  ;91F9C1;


TurningSamusPoses_standing:
    db $8B,$9C,$25,$8D,$8D,$8E,$8E,$26,$9D,$8C                           ;91F9C2;

TurningSamusPoses_crouching:
    db $97,$A2,$43,$99,$99,$9A,$9A,$44,$A3,$98                           ;91F9CC;

TurningSamusPoses_jumpingInAir:
    db $8F,$9E,$2F,$91,$91,$92,$92,$30,$9F,$90                           ;91F9D6;

TurningSamusPoses_falling:
    db $93,$A0,$87,$95,$95,$96,$96,$88,$A1,$94                           ;91F9E0;

TurningSamusPoses_moonwalk:
    db $C1,$C1,$BF,$C3,$8D,$8E,$C4,$C0,$C2,$C2                           ;91F9EA;

InitializeSamusPose_MorphBall:
    LDA.W $0A23                                                          ;91F9F4;
    AND.W #$00FF                                                         ;91F9F7;
    CMP.W #$0004                                                         ;91F9FA;
    BEQ .preserveAnimationFrame                                          ;91F9FD;
    CMP.W #$0008                                                         ;91F9FF;
    BNE .wasNotMorphBall                                                 ;91FA02;

.preserveAnimationFrame:
    LDA.W #$8000                                                         ;91FA04;
    STA.W $0A9A                                                          ;91FA07;

.wasNotMorphBall:
    JSR.W ApplyMomentumIfTurningInMorphBall                              ;91FA0A;
    CLC                                                                  ;91FA0D;
    RTS                                                                  ;91FA0E;


ApplyMomentumIfTurningInMorphBall:
    LDA.W $0A22                                                          ;91FA0F;
    AND.W #$00FF                                                         ;91FA12;
    CMP.W #$0008                                                         ;91FA15;
    BEQ .directionChanged                                                ;91FA18;
    LDA.W $0A1E                                                          ;91FA1A;
    AND.W #$00FF                                                         ;91FA1D;
    CMP.W #$0008                                                         ;91FA20;
    BEQ .speed                                                           ;91FA23;
    BRA .return                                                          ;91FA25;


.directionChanged:
    LDA.W $0A1E                                                          ;91FA27;
    AND.W #$00FF                                                         ;91FA2A;
    CMP.W #$0004                                                         ;91FA2D;
    BNE .return                                                          ;91FA30;

.speed:
    LDA.W $0B44                                                          ;91FA32;
    CLC                                                                  ;91FA35;
    ADC.W $0B48                                                          ;91FA36;
    STA.W $0B48                                                          ;91FA39;
    LDA.W $0B42                                                          ;91FA3C;
    ADC.W $0B46                                                          ;91FA3F;
    STA.W $0B46                                                          ;91FA42;
    JSL.L Cancel_SpeedBoosting                                           ;91FA45;
    STZ.W $0B44                                                          ;91FA49;
    STZ.W $0B42                                                          ;91FA4C;
    LDA.W #$0001                                                         ;91FA4F;
    STA.W $0B4A                                                          ;91FA52;

.return:
    RTS                                                                  ;91FA55;


InitializeSamusPose_SpringBall:
    LDA.W $0A23                                                          ;91FA56;
    AND.W #$00FF                                                         ;91FA59;
    CMP.W #$0011                                                         ;91FA5C;
    BEQ .preserveAnimationFrame                                          ;91FA5F;
    CMP.W #$0012                                                         ;91FA61;
    BEQ .preserveAnimationFrame                                          ;91FA64;
    CMP.W #$0013                                                         ;91FA66;
    BNE .wasNotSpringBall                                                ;91FA69;

.preserveAnimationFrame:
    LDA.W #$8000                                                         ;91FA6B;
    STA.W $0A9A                                                          ;91FA6E;

.wasNotSpringBall:
    JSR.W ApplyMomentumIfTurningInMorphBall                              ;91FA71;
    CLC                                                                  ;91FA74;
    RTS                                                                  ;91FA75;


InitializeSamusPose_WallJumping:
    JSL.L Get_Samus_Bottom_Boundary                                      ;91FA76;
    LDA.W $195E                                                          ;91FA7A;
    BMI .negativeYPosition                                               ;91FA7D;
    CMP.B $12                                                            ;91FA7F;
    BPL .nonLiquidPhysics                                                ;91FA81;
    LDA.W $197E                                                          ;91FA83;
    BIT.W #$0004                                                         ;91FA86;
    BNE .nonLiquidPhysics                                                ;91FA89;
    BRA .returnCarryClear                                                ;91FA8B;


.negativeYPosition:
    LDA.W $1962                                                          ;91FA8D;
    BMI .nonLiquidPhysics                                                ;91FA90;
    CMP.B $12                                                            ;91FA92;
    BMI .returnCarryClear                                                ;91FA94;

.nonLiquidPhysics:
    LDA.W #$0600                                                         ;91FA96;
    STA.W $0AF2                                                          ;91FA99;
    LDA.W #$0003                                                         ;91FA9C;
    STA.W $0ADA                                                          ;91FA9F;
    LDA.B $12                                                            ;91FAA2;
    STA.W $0AEA                                                          ;91FAA4;
    LDA.W $0A1E                                                          ;91FAA7;
    AND.W #$00FF                                                         ;91FAAA;
    CMP.W #$0008                                                         ;91FAAD;
    BEQ .facingRight                                                     ;91FAB0;
    LDA.W $0AF6                                                          ;91FAB2;
    CLC                                                                  ;91FAB5;
    ADC.W #$0006                                                         ;91FAB6;
    STA.W $0AE2                                                          ;91FAB9;
    CLC                                                                  ;91FABC;
    RTS                                                                  ;91FABD;


.facingRight:
    LDA.W $0AF6                                                          ;91FABE;
    SEC                                                                  ;91FAC1;
    SBC.W #$0006                                                         ;91FAC2;
    STA.W $0AE2                                                          ;91FAC5;

.returnCarryClear:
    CLC                                                                  ;91FAC8;
    RTS                                                                  ;91FAC9;


InitializeSamusPose_Shinespark_CF_Drained_DamagedMB:
    LDA.W $0A1C                                                          ;91FACA;
    CMP.W #$00CF                                                         ;91FACD;
    BPL .returnCarryClear                                                ;91FAD0;
    SEC                                                                  ;91FAD2;
    SBC.W #$00C9                                                         ;91FAD3;
    ASL A                                                                ;91FAD6;
    TAX                                                                  ;91FAD7;
    LDA.W .pointers,X                                                    ;91FAD8;
    STA.W $0A58                                                          ;91FADB;
    LDA.W #RTS_90E90E                                                    ;91FADE;
    STA.W $0A60                                                          ;91FAE1;
    STZ.W $0AAE                                                          ;91FAE4;
    STZ.W $0AC0                                                          ;91FAE7;
    STZ.W $0AC2                                                          ;91FAEA;
    STZ.W $0AB0                                                          ;91FAED;
    STZ.W $0AB2                                                          ;91FAF0;
    LDA.W #$000F                                                         ;91FAF3;
    JSL.L QueueSound_Lib3_Max9                                           ;91FAF6;

.returnCarryClear:
    CLC                                                                  ;91FAFA;
    RTS                                                                  ;91FAFB;


.pointers:
    dw SamusMovementHandler_HorizontalShinespark                         ;91FAFC;
    dw SamusMovementHandler_HorizontalShinespark                         ;91FAFE;
    dw SamusMovementHandler_VerticalShinespark                           ;91FB00;
    dw SamusMovementHandler_VerticalShinespark                           ;91FB02;
    dw SamusMovementHandler_DiagonalShinespark                           ;91FB04;
    dw SamusMovementHandler_DiagonalShinespark                           ;91FB06;

Set_Samus_AnimationFrame_if_PoseChanged:
    PHP                                                                  ;91FB08;
    PHB                                                                  ;91FB09;
    PHK                                                                  ;91FB0A;
    PLB                                                                  ;91FB0B;
    REP #$30                                                             ;91FB0C;
    LDA.W $09A2                                                          ;91FB0E;
    BIT.W #$0020                                                         ;91FB11;
    BNE .normalGravity                                                   ;91FB14;
    LDA.W $0A1C                                                          ;91FB16;
    ASL A                                                                ;91FB19;
    ASL A                                                                ;91FB1A;
    ASL A                                                                ;91FB1B;
    TAX                                                                  ;91FB1C;
    LDA.L PoseDefinitions_YRadius,X                                      ;91FB1D;
    AND.W #$00FF                                                         ;91FB21;
    CLC                                                                  ;91FB24;
    ADC.W $0AFA                                                          ;91FB25;
    DEC A                                                                ;91FB28;
    STA.B $12                                                            ;91FB29;
    LDA.W $195E                                                          ;91FB2B;
    BMI .negativeYPosition                                               ;91FB2E;
    CMP.B $12                                                            ;91FB30;
    BMI .submergedInWater                                                ;91FB32;
    BRA .normalGravity                                                   ;91FB34;


.negativeYPosition:
    LDA.W $1962                                                          ;91FB36;
    BMI .normalGravity                                                   ;91FB39;
    CMP.B $12                                                            ;91FB3B;
    BMI .submergedInAcidLava                                             ;91FB3D;

.normalGravity:
    LDA.W $0A66                                                          ;91FB3F;
    STA.B $12                                                            ;91FB42;
    BRA .merge                                                           ;91FB44;


.submergedInWater:
    LDA.W $197E                                                          ;91FB46;
    BIT.W #$0004                                                         ;91FB49;
    BNE .normalGravity                                                   ;91FB4C;
    LDA.L SamusPhysicsConstants_AnimationDelayInWater                    ;91FB4E;
    STA.B $12                                                            ;91FB52;
    BRA .merge                                                           ;91FB54;


.submergedInAcidLava:
    LDA.L SamusPhysicsConstants_AnimationDelayInLavaAcid                 ;91FB56;
    STA.B $12                                                            ;91FB5A;

.merge:
    LDA.W $0A9A                                                          ;91FB5C;
    BMI .return                                                          ;91FB5F;
    LDA.W $0A1C                                                          ;91FB61;
    CMP.W $0A20                                                          ;91FB64;
    BEQ .return                                                          ;91FB67;
    LDA.W #$0000                                                         ;91FB69;
    CLC                                                                  ;91FB6C;
    ADC.W $0A9A                                                          ;91FB6D;
    STA.W $0A96                                                          ;91FB70;
    TAY                                                                  ;91FB73;
    LDA.W $0A1C                                                          ;91FB74;
    ASL A                                                                ;91FB77;
    TAX                                                                  ;91FB78;
    TYA                                                                  ;91FB79;
    CLC                                                                  ;91FB7A;
    ADC.W AnimationDelayTable,X                                          ;91FB7B;
    TAY                                                                  ;91FB7E;
    LDA.W $0000,Y                                                        ;91FB7F;
    AND.W #$00FF                                                         ;91FB82;
    CLC                                                                  ;91FB85;
    ADC.B $12                                                            ;91FB86;
    STA.W $0A94                                                          ;91FB88;

.return:
    PLB                                                                  ;91FB8B;
    PLP                                                                  ;91FB8C;
    RTL                                                                  ;91FB8D;


PossiblyNoPurpose_91FB8E:
    PHP                                                                  ;91FB8E;
    PHB                                                                  ;91FB8F;
    PHK                                                                  ;91FB90;
    PLB                                                                  ;91FB91;
    REP #$30                                                             ;91FB92;
    LDA.W $0A23                                                          ;91FB94;
    AND.W #$00FF                                                         ;91FB97;
    CMP.W #$0006                                                         ;91FB9A;
    BEQ .return                                                          ;91FB9D;
    LDA.W $0A1F                                                          ;91FB9F;
    AND.W #$00FF                                                         ;91FBA2;
    CMP.W #$0006                                                         ;91FBA5;
    BEQ .falling                                                         ;91FBA8;
    BRA .return                                                          ;91FBAA;


.falling:
    STZ.W $0B2C                                                          ;91FBAC;
    STZ.W $0B2E                                                          ;91FBAF;
    LDA.W #$0002                                                         ;91FBB2;
    STA.W $0B36                                                          ;91FBB5;

.return:
    PLB                                                                  ;91FBB8;
    PLP                                                                  ;91FBB9;
    RTL                                                                  ;91FBBA;


HandleJumpTransition:
    PHP                                                                  ;91FBBB;
    PHB                                                                  ;91FBBC;
    PHK                                                                  ;91FBBD;
    PLB                                                                  ;91FBBE;
    REP #$30                                                             ;91FBBF;
    LDA.W $0A1F                                                          ;91FBC1;
    AND.W #$00FF                                                         ;91FBC4;
    ASL A                                                                ;91FBC7;
    TAX                                                                  ;91FBC8;
    JSR.W (.pointers,X)                                                  ;91FBC9;
    PLB                                                                  ;91FBCC;
    PLP                                                                  ;91FBCD;
    RTL                                                                  ;91FBCE;


.pointers:
    dw RTS_91FC07                                                        ;91FBCF;
    dw RTS_91FC07                                                        ;91FBD1;
    dw HandleJumpTransition_NormalJumping                                ;91FBD3;
    dw HandleJumpTransition_SpinJumping                                  ;91FBD5;
    dw RTS_91FC07                                                        ;91FBD7;
    dw RTS_91FC07                                                        ;91FBD9;
    dw RTS_91FC07                                                        ;91FBDB;
    dw RTS_91FC07                                                        ;91FBDD;
    dw RTS_91FC07                                                        ;91FBDF;
    dw RTS_91FC07                                                        ;91FBE1;
    dw RTS_91FC07                                                        ;91FBE3;
    dw RTS_91FC07                                                        ;91FBE5;
    dw RTS_91FC07                                                        ;91FBE7;
    dw UNUSED_HandleJumpTransition_MovementTypeD_91FC42                  ;91FBE9;
    dw RTS_91FC07                                                        ;91FBEB;
    dw RTS_91FC07                                                        ;91FBED;
    dw RTS_91FC07                                                        ;91FBEF;
    dw RTS_91FC07                                                        ;91FBF1;
    dw HandleJumpTransition_SpringBall_InAir                             ;91FBF3;
    dw RTS_91FC07                                                        ;91FBF5;
    dw HandleJumpTransition_WallJumping                                  ;91FBF7;
    dw RTS_91FC07                                                        ;91FBF9;
    dw RTS_91FC07                                                        ;91FBFB;
    dw RTS_91FC07                                                        ;91FBFD;
    dw RTS_91FC07                                                        ;91FBFF;
    dw RTS_91FCAE                                                        ;91FC01;
    dw RTS_91FC07                                                        ;91FC03;
    dw RTS_91FC07                                                        ;91FC05;

RTS_91FC07:
    RTS                                                                  ;91FC07;


HandleJumpTransition_WallJumping:
    LDA.W $0A23                                                          ;91FC08;
    AND.W #$00FF                                                         ;91FC0B;
    CMP.W #$0014                                                         ;91FC0E;
    BEQ .return                                                          ;91FC11;
    JSL.L Make_Samus_WallJump                                            ;91FC13;

.return:
    RTS                                                                  ;91FC17;


HandleJumpTransition_SpringBall_InAir:
    LDA.W $0A1C                                                          ;91FC18;
    CMP.W #$007F                                                         ;91FC1B;
    BNE .facingLeft                                                      ;91FC1E;
    LDA.W $0A23                                                          ;91FC20;
    AND.W #$00FF                                                         ;91FC23;
    CMP.W #$0011                                                         ;91FC26;
    BEQ .jump                                                            ;91FC29;
    BRA .return                                                          ;91FC2B;


.facingLeft:
    CMP.W #$0080                                                         ;91FC2D;
    BNE .return                                                          ;91FC30;
    LDA.W $0A23                                                          ;91FC32;
    AND.W #$00FF                                                         ;91FC35;
    CMP.W #$0011                                                         ;91FC38;
    BNE .return                                                          ;91FC3B;

.jump:
    JSL.L Make_Samus_Jump                                                ;91FC3D;

.return:
    RTS                                                                  ;91FC41;


UNUSED_HandleJumpTransition_MovementTypeD_91FC42:
    LDA.W $0A1C                                                          ;91FC42;
    CMP.W #$0065                                                         ;91FC45;
    BNE .notPose65                                                       ;91FC48;
    LDA.W $0A20                                                          ;91FC4A;
    CMP.W #$0064                                                         ;91FC4D;
    BEQ .jump                                                            ;91FC50;
    BRA .return                                                          ;91FC52;


.notPose65:
    CMP.W #$0066                                                         ;91FC54;
    BNE .return                                                          ;91FC57;
    LDA.W $0A20                                                          ;91FC59;
    CMP.W #$0063                                                         ;91FC5C;
    BNE .return                                                          ;91FC5F;

.jump:
    JSL.L Make_Samus_Jump                                                ;91FC61;

.return:
    RTS                                                                  ;91FC65;


HandleJumpTransition_NormalJumping:
    LDA.W $0A1C                                                          ;91FC66;
    CMP.W #$004B                                                         ;91FC69;
    BEQ .normalJump                                                      ;91FC6C;
    CMP.W #$004C                                                         ;91FC6E;
    BEQ .normalJump                                                      ;91FC71;
    CMP.W #$0055                                                         ;91FC73;
    BMI .return                                                          ;91FC76;
    CMP.W #$005B                                                         ;91FC78;
    BPL .return                                                          ;91FC7B;

.normalJump:
    LDA.W $0A20                                                          ;91FC7D;
    CMP.W #$0027                                                         ;91FC80;
    BEQ .crouchJump                                                      ;91FC83;
    CMP.W #$0028                                                         ;91FC85;
    BNE .jump                                                            ;91FC88;

.crouchJump:
    LDA.W $0AFA                                                          ;91FC8A;
    SEC                                                                  ;91FC8D;
    SBC.W #$000A                                                         ;91FC8E;
    STA.W $0AFA                                                          ;91FC91;

.jump:
    JSL.L Make_Samus_Jump                                                ;91FC94;

.return:
    RTS                                                                  ;91FC98;


HandleJumpTransition_SpinJumping:
    LDA.W $0A23                                                          ;91FC99;
    AND.W #$00FF                                                         ;91FC9C;
    CMP.W #$0003                                                         ;91FC9F;
    BEQ .return                                                          ;91FCA2;
    CMP.W #$0014                                                         ;91FCA4;
    BEQ .return                                                          ;91FCA7;
    JSL.L Make_Samus_Jump                                                ;91FCA9;

.return:
    RTS                                                                  ;91FCAD;


RTS_91FCAE:
    RTS                                                                  ;91FCAE;


XraySamusPoseInputHandler:
    PHP                                                                  ;91FCAF;
    REP #$30                                                             ;91FCB0;
    LDA.W $0A1F                                                          ;91FCB2;
    AND.W #$00FF                                                         ;91FCB5;
    CMP.W #$000E                                                         ;91FCB8;
    BNE .notTurningOnGround                                              ;91FCBB;
    JMP.W .turningOnGround                                               ;91FCBD;


.notTurningOnGround:
    LDA.W $0A1E                                                          ;91FCC0;
    AND.W #$00FF                                                         ;91FCC3;
    CMP.W #$0004                                                         ;91FCC6;
    BEQ .notTurningFacingLeft                                            ;91FCC9;
    LDA.B $8B                                                            ;91FCCB;
    BIT.W $09AE                                                          ;91FCCD;
    BEQ .returnMiddle                                                    ;91FCD0;
    LDA.W #$0100                                                         ;91FCD2;
    SEC                                                                  ;91FCD5;
    SBC.W $0A82                                                          ;91FCD6;
    STA.W $0A82                                                          ;91FCD9;
    LDA.W $0A1F                                                          ;91FCDC;
    AND.W #$00FF                                                         ;91FCDF;
    CMP.W #$0005                                                         ;91FCE2;
    BEQ ..crouching                                                      ;91FCE5;
    LDA.W #$0025                                                         ;91FCE7;
    STA.W $0A1C                                                          ;91FCEA;
    BRA .notTurningMerge                                                 ;91FCED;


..crouching:
    LDA.W #$0043                                                         ;91FCEF;
    STA.W $0A1C                                                          ;91FCF2;
    BRA .notTurningMerge                                                 ;91FCF5;


.notTurningFacingLeft:
    LDA.B $8B                                                            ;91FCF7;
    BIT.W $09B0                                                          ;91FCF9;
    BEQ .returnMiddle                                                    ;91FCFC;
    LDA.W #$0100                                                         ;91FCFE;
    SEC                                                                  ;91FD01;
    SBC.W $0A82                                                          ;91FD02;
    STA.W $0A82                                                          ;91FD05;
    LDA.W $0A1F                                                          ;91FD08;
    AND.W #$00FF                                                         ;91FD0B;
    CMP.W #$0005                                                         ;91FD0E;
    BEQ ..crouching                                                      ;91FD11;
    LDA.W #$0026                                                         ;91FD13;
    STA.W $0A1C                                                          ;91FD16;
    BRA .notTurningMerge                                                 ;91FD19;


..crouching:
    LDA.W #$0044                                                         ;91FD1B;
    STA.W $0A1C                                                          ;91FD1E;

.notTurningMerge:
    JSL.L InitializeSamusPose_1                                          ;91FD21;
    JSL.L Set_Samus_AnimationFrame_if_PoseChanged                        ;91FD25;
    LDA.W $0A20                                                          ;91FD29;
    STA.W $0A24                                                          ;91FD2C;
    LDA.W $0A22                                                          ;91FD2F;
    STA.W $0A26                                                          ;91FD32;
    LDA.W $0A1C                                                          ;91FD35;
    STA.W $0A20                                                          ;91FD38;
    LDA.W $0A1E                                                          ;91FD3B;
    STA.W $0A22                                                          ;91FD3E;

.returnMiddle:
    PLP                                                                  ;91FD41;
    RTL                                                                  ;91FD42;


.turningOnGround:
    LDA.W $0A96                                                          ;91FD43;
    CMP.W #$0002                                                         ;91FD46;
    BNE .returnLower                                                     ;91FD49;
    LDA.W $0A94                                                          ;91FD4B;
    CMP.W #$0001                                                         ;91FD4E;
    BNE .returnLower                                                     ;91FD51;
    LDA.W $0A1E                                                          ;91FD53;
    AND.W #$00FF                                                         ;91FD56;
    CMP.W #$0004                                                         ;91FD59;
    BEQ .turningFacingLeft                                               ;91FD5C;
    LDA.W $0A1C                                                          ;91FD5E;
    CMP.W #$0026                                                         ;91FD61;
    BNE ..crouching                                                      ;91FD64;
    LDA.W #$00D5                                                         ;91FD66;
    STA.W $0A1C                                                          ;91FD69;
    BRA .turningMerge                                                    ;91FD6C;


..crouching:
    LDA.W #$00D9                                                         ;91FD6E;
    STA.W $0A1C                                                          ;91FD71;
    BRA .turningMerge                                                    ;91FD74;


.turningFacingLeft:
    LDA.W $0A1C                                                          ;91FD76;
    CMP.W #$0025                                                         ;91FD79;
    BNE ..XrayCrouching                                                  ;91FD7C;
    LDA.W #$00D6                                                         ;91FD7E;
    STA.W $0A1C                                                          ;91FD81;
    BRA .turningMerge                                                    ;91FD84;


..XrayCrouching:
    LDA.W #$00DA                                                         ;91FD86;
    STA.W $0A1C                                                          ;91FD89;

.turningMerge:
    JSL.L InitializeSamusPose_1                                          ;91FD8C;
    JSL.L Set_Samus_AnimationFrame_if_PoseChanged                        ;91FD90;
    LDA.W $0A20                                                          ;91FD94;
    STA.W $0A24                                                          ;91FD97;
    LDA.W $0A22                                                          ;91FD9A;
    STA.W $0A26                                                          ;91FD9D;
    LDA.W $0A1C                                                          ;91FDA0;
    STA.W $0A20                                                          ;91FDA3;
    LDA.W $0A1E                                                          ;91FDA6;
    STA.W $0A22                                                          ;91FDA9;

.returnLower:
    PLP                                                                  ;91FDAC;
    RTL                                                                  ;91FDAD;


HandlePoseChangeCollision:
    PHP                                                                  ;91FDAE;
    REP #$30                                                             ;91FDAF;
    LDA.W $0A1C                                                          ;91FDB1;
    BEQ .returnUpper                                                     ;91FDB4;
    CMP.W #$009B                                                         ;91FDB6;
    BNE .notFacingForward                                                ;91FDB9;

.returnUpper:
    PLP                                                                  ;91FDBB;
    RTS                                                                  ;91FDBC;


.notFacingForward:
    STZ.W $0A34                                                          ;91FDBD;
    STZ.W $0A36                                                          ;91FDC0;
    LDA.W $0A1C                                                          ;91FDC3;
    ASL A                                                                ;91FDC6;
    ASL A                                                                ;91FDC7;
    ASL A                                                                ;91FDC8;
    TAX                                                                  ;91FDC9;
    LDA.L PoseDefinitions_YRadius,X                                      ;91FDCA;
    AND.W #$00FF                                                         ;91FDCE;
    STA.B $12                                                            ;91FDD1;
    LDA.W $0A20                                                          ;91FDD3;
    ASL A                                                                ;91FDD6;
    ASL A                                                                ;91FDD7;
    ASL A                                                                ;91FDD8;
    TAX                                                                  ;91FDD9;
    LDA.L PoseDefinitions_YRadius,X                                      ;91FDDA;
    AND.W #$00FF                                                         ;91FDDE;
    CMP.B $12                                                            ;91FDE1;
    BMI .larger                                                          ;91FDE3;
    PLP                                                                  ;91FDE5;
    RTS                                                                  ;91FDE6;


.larger:
    STA.W $0B00                                                          ;91FDE7;
    LDA.B $12                                                            ;91FDEA;
    SEC                                                                  ;91FDEC;
    SBC.W $0B00                                                          ;91FDED;
    STA.W $0A3A                                                          ;91FDF0;
    STA.B $12                                                            ;91FDF3;
    STZ.B $14                                                            ;91FDF5;
    LDA.W #$0002                                                         ;91FDF7;
    STA.W $0B02                                                          ;91FDFA;
    JSL.L Samus_vs_SolidEnemy_CollisionDetection                         ;91FDFD;
    STA.W $0DD0                                                          ;91FE01;
    TAX                                                                  ;91FE04;
    BEQ .noCollision                                                     ;91FE05;
    LDA.W #$0001                                                         ;91FE07;
    STA.W $0A34                                                          ;91FE0A;

.noCollision:
    LDA.B $12                                                            ;91FE0D;
    STA.W $0A3E                                                          ;91FE0F;
    LDA.W $0A3A                                                          ;91FE12;
    STA.B $12                                                            ;91FE15;
    STZ.B $14                                                            ;91FE17;
    LDA.W #$0003                                                         ;91FE19;
    STA.W $0B02                                                          ;91FE1C;
    JSL.L Samus_vs_SolidEnemy_CollisionDetection                         ;91FE1F;
    STA.W $0DD0                                                          ;91FE23;
    TAX                                                                  ;91FE26;
    BEQ .stillNoCollision                                                ;91FE27;
    LDA.W $0A34                                                          ;91FE29;
    ORA.W #$0002                                                         ;91FE2C;
    STA.W $0A34                                                          ;91FE2F;

.stillNoCollision:
    LDA.B $12                                                            ;91FE32;
    STA.W $0A40                                                          ;91FE34;
    LDA.W $0A34                                                          ;91FE37;
    ASL A                                                                ;91FE3A;
    TAX                                                                  ;91FE3B;
    JSR.W (.solidEnemyPointers,X)                                        ;91FE3C;
    BCS .revertPose                                                      ;91FE3F;
    LDA.W $0A3A                                                          ;91FE41;
    EOR.W #$FFFF                                                         ;91FE44;
    INC A                                                                ;91FE47;
    STA.B $12                                                            ;91FE48;
    STZ.B $14                                                            ;91FE4A;
    JSL.L BlockCollisionDetectionDueToChangeOfPose                       ;91FE4C;
    BCC .noCollisionAgain                                                ;91FE50;
    LDA.W #$0001                                                         ;91FE52;
    STA.W $0A36                                                          ;91FE55;

.noCollisionAgain:
    LDA.B $12                                                            ;91FE58;
    STA.W $0A38                                                          ;91FE5A;
    LDA.W $0A3A                                                          ;91FE5D;
    STA.B $12                                                            ;91FE60;
    STZ.B $14                                                            ;91FE62;
    JSL.L BlockCollisionDetectionDueToChangeOfPose                       ;91FE64;
    BCC .noCollisionFinal                                                ;91FE68;
    LDA.W $0A36                                                          ;91FE6A;
    ORA.W #$0002                                                         ;91FE6D;
    STA.W $0A36                                                          ;91FE70;

.noCollisionFinal:
    LDA.B $12                                                            ;91FE73;
    STA.W $0A3C                                                          ;91FE75;
    LDA.W $0A36                                                          ;91FE78;
    ASL A                                                                ;91FE7B;
    TAX                                                                  ;91FE7C;
    JSR.W (.blockPointers,X)                                             ;91FE7D;
    BCC .return                                                          ;91FE80;

.revertPose:
    LDA.W $0A20                                                          ;91FE82;
    STA.W $0A1C                                                          ;91FE85;

.return:
    PLP                                                                  ;91FE88;
    RTS                                                                  ;91FE89;


.solidEnemyPointers:
    dw CLCRTS_91FE9A                                                     ;91FE8A;
    dw PoseChangeCollision_SolidEnemy_FromAbove                          ;91FE8C;
    dw PoseChangeCollision_SolidEnemy_FromBelow                          ;91FE8E;
    dw CLCRTS_91FE9C                                                     ;91FE90;

.blockPointers:
    dw PoseChangeCollision_NoCollision                                   ;91FE92;
    dw PoseChangeCollision_Block_FromAbove                               ;91FE94;
    dw PoseChangeCollision_Block_FromBelow                               ;91FE96;
    dw HandleCollisionFromBothSidesDueToPoseChange                       ;91FE98;

CLCRTS_91FE9A:
    CLC                                                                  ;91FE9A;
    RTS                                                                  ;91FE9B;


CLCRTS_91FE9C:
    CLC                                                                  ;91FE9C;
    RTS                                                                  ;91FE9D;


PoseChangeCollision_SolidEnemy_FromAbove:
    LDA.W $0A3A                                                          ;91FE9E;
    SEC                                                                  ;91FEA1;
    SBC.W $0A3E                                                          ;91FEA2;
    STA.B $12                                                            ;91FEA5;
    STZ.B $14                                                            ;91FEA7;
    LDA.W $0B00                                                          ;91FEA9;
    PHA                                                                  ;91FEAC;
    LDA.W $0A1C                                                          ;91FEAD;
    ASL A                                                                ;91FEB0;
    ASL A                                                                ;91FEB1;
    ASL A                                                                ;91FEB2;
    TAX                                                                  ;91FEB3;
    LDA.L PoseDefinitions_YRadius,X                                      ;91FEB4;
    AND.W #$00FF                                                         ;91FEB8;
    STA.W $0B00                                                          ;91FEBB;
    LDA.W #$0003                                                         ;91FEBE;
    STA.W $0B02                                                          ;91FEC1;
    JSL.L Samus_vs_SolidEnemy_CollisionDetection                         ;91FEC4;
    STA.W $0DD0                                                          ;91FEC8;
    TAX                                                                  ;91FECB;
    BNE .collision                                                       ;91FECC;
    LDA.B $12                                                            ;91FECE;
    STA.W $0A3E                                                          ;91FED0;
    PLA                                                                  ;91FED3;
    STA.W $0B00                                                          ;91FED4;
    CLC                                                                  ;91FED7;
    RTS                                                                  ;91FED8;


.collision:
    PLA                                                                  ;91FED9;
    STA.W $0B00                                                          ;91FEDA;
    SEC                                                                  ;91FEDD;
    RTS                                                                  ;91FEDE;


PoseChangeCollision_SolidEnemy_FromBelow:
    LDA.W $0A3A                                                          ;91FEDF;
    SEC                                                                  ;91FEE2;
    SBC.W $0A40                                                          ;91FEE3;
    STA.B $12                                                            ;91FEE6;
    STZ.B $14                                                            ;91FEE8;
    LDA.W $0B00                                                          ;91FEEA;
    PHA                                                                  ;91FEED;
    LDA.W $0A1C                                                          ;91FEEE;
    ASL A                                                                ;91FEF1;
    ASL A                                                                ;91FEF2;
    ASL A                                                                ;91FEF3;
    TAX                                                                  ;91FEF4;
    LDA.L PoseDefinitions_YRadius,X                                      ;91FEF5;
    AND.W #$00FF                                                         ;91FEF9;
    STA.W $0B00                                                          ;91FEFC;
    LDA.W #$0002                                                         ;91FEFF;
    STA.W $0B02                                                          ;91FF02;
    JSL.L Samus_vs_SolidEnemy_CollisionDetection                         ;91FF05;
    STA.W $0DD0                                                          ;91FF09;
    TAX                                                                  ;91FF0C;
    BNE .collision                                                       ;91FF0D;
    LDA.B $12                                                            ;91FF0F;
    STA.W $0A40                                                          ;91FF11;
    PLA                                                                  ;91FF14;
    STA.W $0B00                                                          ;91FF15;
    CLC                                                                  ;91FF18;
    RTS                                                                  ;91FF19;


.collision:
    PLA                                                                  ;91FF1A;
    STA.W $0B00                                                          ;91FF1B;
    SEC                                                                  ;91FF1E;
    RTS                                                                  ;91FF1F;


PoseChangeCollision_Block_FromAbove:
    LDA.W $0A3A                                                          ;91FF20;
    SEC                                                                  ;91FF23;
    SBC.W $0A38                                                          ;91FF24;
    STA.B $12                                                            ;91FF27;
    STZ.B $14                                                            ;91FF29;
    JSL.L BlockCollisionDetectionDueToChangeOfPose                       ;91FF2B;
    BCS .returnCarrySet                                                  ;91FF2F;
    LDA.W $0A34                                                          ;91FF31;
    BIT.W #$0002                                                         ;91FF34;
    BNE HandleCollisionFromBothSidesDueToPoseChange                      ;91FF37;
    LDA.W $0AFA                                                          ;91FF39;
    CLC                                                                  ;91FF3C;
    ADC.B $12                                                            ;91FF3D;
    STA.W $0AFA                                                          ;91FF3F;
    STA.W $0B14                                                          ;91FF42;
    CLC                                                                  ;91FF45;
    RTS                                                                  ;91FF46;


.returnCarrySet:
    SEC                                                                  ;91FF47;
    RTS                                                                  ;91FF48;


PoseChangeCollision_Block_FromBelow:
    LDA.W $0A3A                                                          ;91FF49;
    SEC                                                                  ;91FF4C;
    SBC.W $0A3C                                                          ;91FF4D;
    EOR.W #$FFFF                                                         ;91FF50;
    INC A                                                                ;91FF53;
    STA.B $12                                                            ;91FF54;
    STZ.B $14                                                            ;91FF56;
    JSL.L BlockCollisionDetectionDueToChangeOfPose                       ;91FF58;
    BCS .returnCarrySet                                                  ;91FF5C;
    LDA.W $0A34                                                          ;91FF5E;
    BIT.W #$0001                                                         ;91FF61;
    BNE HandleCollisionFromBothSidesDueToPoseChange                      ;91FF64;
    LDA.W $0AFA                                                          ;91FF66;
    SEC                                                                  ;91FF69;
    SBC.B $12                                                            ;91FF6A;
    STA.W $0AFA                                                          ;91FF6C;
    STA.W $0B14                                                          ;91FF6F;
    CLC                                                                  ;91FF72;
    RTS                                                                  ;91FF73;


.returnCarrySet:
    SEC                                                                  ;91FF74;
    RTS                                                                  ;91FF75;


PoseChangeCollision_NoCollision:
    LDA.W $0A34                                                          ;91FF76;
    ASL A                                                                ;91FF79;
    TAX                                                                  ;91FF7A;
    JMP.W (.pointers,X)                                                  ;91FF7B;

    RTS                                                                  ;91FF7E; >.<


.pointers:
    dw CLCRTS_91FF87                                                     ;91FF7F;
    dw HandleBlockCollisionToPoseChange_NoCollision_Enemy_FromAbove      ;91FF81;
    dw HandleBlockCollisionToPoseChange_NoCollision_Enemy_FromBelow      ;91FF83;
    dw HandleCollisionFromBothSidesDueToPoseChange                       ;91FF85;

CLCRTS_91FF87:
    CLC                                                                  ;91FF87;
    RTS                                                                  ;91FF88;


HandleBlockCollisionToPoseChange_NoCollision_Enemy_FromAbove:
    LDA.W $0AFA                                                          ;91FF89;
    CLC                                                                  ;91FF8C;
    ADC.W $0A3E                                                          ;91FF8D;
    STA.W $0AFA                                                          ;91FF90;
    STA.W $0B14                                                          ;91FF93;
    CLC                                                                  ;91FF96;
    RTS                                                                  ;91FF97;


HandleBlockCollisionToPoseChange_NoCollision_Enemy_FromBelow:
    LDA.W $0AFA                                                          ;91FF98;
    SEC                                                                  ;91FF9B;
    SBC.W $0A40                                                          ;91FF9C;
    STA.W $0AFA                                                          ;91FF9F;
    STA.W $0B14                                                          ;91FFA2;
    CLC                                                                  ;91FFA5;
    RTS                                                                  ;91FFA6;


HandleCollisionFromBothSidesDueToPoseChange:
    LDA.W $0B00                                                          ;91FFA7;
    CMP.W #$0008                                                         ;91FFAA;
    BPL .notMorphBall                                                    ;91FFAD;
    SEC                                                                  ;91FFAF;
    RTS                                                                  ;91FFB0;


.notMorphBall:
    LDA.W $0A1E                                                          ;91FFB1;
    AND.W #$00FF                                                         ;91FFB4;
    CMP.W #$0004                                                         ;91FFB7;
    BEQ .facingLeft                                                      ;91FFBA;
    LDA.W #$0027                                                         ;91FFBC;
    BRA +                                                                ;91FFBF;


.facingLeft:
    LDA.W #$0028                                                         ;91FFC1;

  + STA.W $0A1C                                                          ;91FFC4;
    ASL A                                                                ;91FFC7;
    ASL A                                                                ;91FFC8;
    ASL A                                                                ;91FFC9;
    TAX                                                                  ;91FFCA;
    LDA.L PoseDefinitions_YRadius,X                                      ;91FFCB;
    AND.W #$00FF                                                         ;91FFCF;
    STA.B $12                                                            ;91FFD2;
    LDA.W $0B00                                                          ;91FFD4;
    CMP.B $12                                                            ;91FFD7;
    BPL .returnCarryClear                                                ;91FFD9;
    SEC                                                                  ;91FFDB;
    SBC.B $12                                                            ;91FFDC;
    STA.B $12                                                            ;91FFDE;
    LDA.W $0AFA                                                          ;91FFE0;
    CLC                                                                  ;91FFE3;
    ADC.B $12                                                            ;91FFE4;
    STA.W $0AFA                                                          ;91FFE6;
    STA.W $0B14                                                          ;91FFE9;

.returnCarryClear:
    CLC                                                                  ;91FFEC;
    RTS                                                                  ;91FFED;


Freespace_Bank91_FFEE:                                                   ;91FFEE;
; $12 bytes
