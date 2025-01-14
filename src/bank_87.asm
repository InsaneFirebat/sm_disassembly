
org $878000


Enable_AnimatedTilesObjects:
    PHP                                                                  ;878000;
    REP #$20                                                             ;878001;
    LDA.W #$8000                                                         ;878003;
    TSB.W $1EF1                                                          ;878006;
    PLP                                                                  ;878009;
    RTL                                                                  ;87800A;


Disable_AnimatedTilesObjects:
    PHP                                                                  ;87800B;
    REP #$20                                                             ;87800C;
    LDA.W #$8000                                                         ;87800E;
    TRB.W $1EF1                                                          ;878011;
    PLP                                                                  ;878014;
    RTL                                                                  ;878015;


Clear_AnimatedTilesObjects:
    PHP                                                                  ;878016;
    REP #$30                                                             ;878017;
    PHX                                                                  ;878019;
    LDX.W #$000A                                                         ;87801A;

.loop:
    STZ.W $1EF5,X                                                        ;87801D;
    DEX                                                                  ;878020;
    DEX                                                                  ;878021;
    BPL .loop                                                            ;878022;
    PLX                                                                  ;878024;
    PLP                                                                  ;878025;
    RTL                                                                  ;878026;


Spawn_AnimatedTilesObject:
    PHP                                                                  ;878027;
    PHB                                                                  ;878028;
    PHX                                                                  ;878029;
    PHK                                                                  ;87802A;
    PLB                                                                  ;87802B;
    LDX.W #$000A                                                         ;87802C;

.loop:
    LDA.W $1EF5,X                                                        ;87802F;
    BEQ .found                                                           ;878032;
    DEX                                                                  ;878034;
    DEX                                                                  ;878035;
    BPL .loop                                                            ;878036;
    PLX                                                                  ;878038;
    PLB                                                                  ;878039;
    PLP                                                                  ;87803A;
    SEC                                                                  ;87803B;
    RTL                                                                  ;87803C;


.found:
    TYA                                                                  ;87803D;
    STA.W $1EF5,X                                                        ;87803E;
    STZ.W $1F01,X                                                        ;878041;
    LDA.W $0000,Y                                                        ;878044;
    STA.W $1F0D,X                                                        ;878047;
    STZ.W $1F25,X                                                        ;87804A;
    LDA.W $0002,Y                                                        ;87804D;
    STA.W $1F31,X                                                        ;878050;
    LDA.W $0004,Y                                                        ;878053;
    STA.W $1F3D,X                                                        ;878056;
    LDA.W #$0001                                                         ;878059;
    STA.W $1F19,X                                                        ;87805C;
    PLX                                                                  ;87805F;
    PLB                                                                  ;878060;
    PLP                                                                  ;878061;
    CLC                                                                  ;878062;
    RTL                                                                  ;878063;


AnimatedTilesObject_Handler:
    PHP                                                                  ;878064;
    PHB                                                                  ;878065;
    PHK                                                                  ;878066;
    PLB                                                                  ;878067;
    BIT.W $1EF1                                                          ;878068;
    BPL .return                                                          ;87806B;
    LDX.W #$000A                                                         ;87806D;

.loop:
    STX.W $1EF3                                                          ;878070;
    LDA.W $1EF5,X                                                        ;878073;
    BEQ .next                                                            ;878076;
    JSR.W Process_AnimatedTilesObject                                    ;878078;
    LDX.W $1EF3                                                          ;87807B;

.next:
    DEX                                                                  ;87807E;
    DEX                                                                  ;87807F;
    BPL .loop                                                            ;878080;

.return:
    PLB                                                                  ;878082;
    PLP                                                                  ;878083;
    RTL                                                                  ;878084;


Process_AnimatedTilesObject:
    LDX.W $1EF3                                                          ;878085;
    DEC.W $1F19,X                                                        ;878088;
    BNE .return                                                          ;87808B;
    LDY.W $1F0D,X                                                        ;87808D;

.loop:
    LDA.W $0000,Y                                                        ;878090;
    BPL .notInstruction                                                  ;878093;
    STA.W $1F49                                                          ;878095;
    INY                                                                  ;878098;
    INY                                                                  ;878099;
    PEA.W .loop-1                                                        ;87809A;
    JMP.W ($1F49)                                                        ;87809D;


.notInstruction:
    STA.W $1F19,X                                                        ;8780A0;
    LDA.W $0002,Y                                                        ;8780A3;
    STA.W $1F25,X                                                        ;8780A6;
    TYA                                                                  ;8780A9;
    CLC                                                                  ;8780AA;
    ADC.W #$0004                                                         ;8780AB;
    STA.W $1F0D,X                                                        ;8780AE;

.return:
    RTS                                                                  ;8780B1;


Instruction_AnimatedTilesObject_Delete:
    STZ.W $1EF5,X                                                        ;8780B2;
    PLA                                                                  ;8780B5;
    RTS                                                                  ;8780B6;


Instruction_AnimatedTilesObject_GotoY:
    LDA.W $0000,Y                                                        ;8780B7;
    TAY                                                                  ;8780BA;
    RTS                                                                  ;8780BB;


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Instruction_AnimatedTilesObject_GotoYPlusY_8780BC:
    STY.W $1F49                                                          ;8780BC;
    DEY                                                                  ;8780BF;
    LDA.W $0000,Y                                                        ;8780C0;
    XBA                                                                  ;8780C3;
    BMI .highByte                                                        ;8780C4;
    AND.W #$00FF                                                         ;8780C6;
    BRA +                                                                ;8780C9;


.highByte:
    ORA.W #$FF00                                                         ;8780CB;

  + CLC                                                                  ;8780CE;
    ADC.W $1F49                                                          ;8780CF;
    TAY                                                                  ;8780D2;
    RTS                                                                  ;8780D3;


UNUSED_Inst_AnimTilesObject_DecTimer_GotoYIfNonZero_8780D4:
    DEC.W $1F01,X                                                        ;8780D4;
    BNE Instruction_AnimatedTilesObject_GotoY                            ;8780D7;
    INY                                                                  ;8780D9;
    INY                                                                  ;8780DA;
    RTS                                                                  ;8780DB;


UNUSED_Inst_AnimTilesObject_DecTimer_GotoYPlusYIfNon0_8780DC:
    DEC.W $1F01,X                                                        ;8780DC;
    BNE UNUSED_Instruction_AnimatedTilesObject_GotoYPlusY_8780BC         ;8780DF;
    INY                                                                  ;8780E1;
    RTS                                                                  ;8780E2;


UNUSED_Instruction_AnimatedTilesObject_TimerInY_8780E3:
    SEP #$20                                                             ;8780E3;
    LDA.W $0000,Y                                                        ;8780E5;
    STA.W $1F01,X                                                        ;8780E8;
    REP #$20                                                             ;8780EB;
    INY                                                                  ;8780ED;
    RTS                                                                  ;8780EE;


UNUSED_RTS_8780EF:
    RTS                                                                  ;8780EF;


UNUSED_Instruction_AnimatedTilesObject_QueueMusicTrackInY:
    LDA.W $0000,Y                                                        ;8780F0;
    AND.W #$00FF                                                         ;8780F3;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;8780F6;
    INY                                                                  ;8780FA;
    RTS                                                                  ;8780FB;


UNUSED_Inst_AnimTilesObject_QueueSoundInY_Lib1_Max6_8780FC:
    LDA.W $0000,Y                                                        ;8780FC;
    AND.W #$00FF                                                         ;8780FF;
    JSL.L QueueSound_Lib1_Max6                                           ;878102;
    INY                                                                  ;878106;
    RTS                                                                  ;878107;


UNUSED_Inst_AnimTilesObject_QueueSoundInY_Lib2_Max6_878108:
    LDA.W $0000,Y                                                        ;878108;
    AND.W #$00FF                                                         ;87810B;
    JSL.L QueueSound_Lib2_Max6                                           ;87810E;
    INY                                                                  ;878112;
    RTS                                                                  ;878113;


UNUSED_Inst_AnimTilesObject_QueueSoundInY_Lib3_Max6_878114:
    LDA.W $0000,Y                                                        ;878114;
    AND.W #$00FF                                                         ;878117;
    JSL.L QueueSound_Lib3_Max6                                           ;87811A;
    INY                                                                  ;87811E;
    RTS                                                                  ;87811F;


UNUSED_Inst_AnimTilesObject_GotoYIfBossBitsInYSet_878120:
    LDA.W $0000,Y                                                        ;878120;
    INY                                                                  ;878123;
    AND.W #$00FF                                                         ;878124;
    JSL.L CheckIfBossBitsForCurrentAreaMatchAnyBitsInA                   ;878127;
    BCC .notSet                                                          ;87812B;
    JMP.W Instruction_AnimatedTilesObject_GotoY                          ;87812D;


.notSet:
    INY                                                                  ;878130;
    INY                                                                  ;878131;
    RTS                                                                  ;878132;


UNUSED_Instruction_AnimatedTilesObject_SetBossBitsY_878133:
    LDA.W $0000,Y                                                        ;878133;
    AND.W #$00FF                                                         ;878136;
    JSL.L SetBossBitsInAForCurrentArea                                   ;878139;
    INY                                                                  ;87813D;
    RTS                                                                  ;87813E;
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_AnimatedTilesObject_GotoYIfEventYSet:
    LDA.W $0000,Y                                                        ;87813F;
    INY                                                                  ;878142;
    INY                                                                  ;878143;
    JSL.L CheckIfEvent_inA_HasHappened                                   ;878144;
    BCC .notSet                                                          ;878148;
    JMP.W Instruction_AnimatedTilesObject_GotoY                          ;87814A;


.notSet:
    INY                                                                  ;87814D;
    INY                                                                  ;87814E;
    RTS                                                                  ;87814F;


Instruction_AnimatedTilesObject_SetEventY:
    LDA.W $0000,Y                                                        ;878150;
    JSL.L MarkEvent_inA                                                  ;878153;
    INY                                                                  ;878157;
    INY                                                                  ;878158;
    RTS                                                                  ;878159;


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Instruction_AnimatedTilesObject_LockSamus_87815A:
    LDA.W #$0000                                                         ;87815A;
    JSL.L Run_Samus_Command                                              ;87815D;
    RTS                                                                  ;878161;


UNUSED_Instruction_AnimatedTilesObject_UnlockSamus_878162:
    LDA.W #$0001                                                         ;878162;
    JSL.L Run_Samus_Command                                              ;878165;
    RTS                                                                  ;878169;
endif ; !FEATURE_KEEP_UNREFERENCED


InstList_AnimatedTilesObject_VerticalSpikes:
    dw $0008,AnimatedTiles_VerticalSpikes_0                              ;87816A;
    dw $0008,AnimatedTiles_VerticalSpikes_1                              ;87816E;
    dw $0008,AnimatedTiles_VerticalSpikes_2                              ;878172;
    dw $0008,AnimatedTiles_VerticalSpikes_1                              ;878176;
    dw Instruction_AnimatedTilesObject_GotoY                             ;87817A;
    dw InstList_AnimatedTilesObject_VerticalSpikes                       ;87817C;

InstList_AnimatedTilesObject_HorizontalSpikes:
    dw $0008,AnimatedTiles_HorizontalSpikes_0                            ;87817E;
    dw $0008,AnimatedTiles_HorizontalSpikes_1                            ;878182;
    dw $0008,AnimatedTiles_HorizontalSpikes_2                            ;878186;
    dw $0008,AnimatedTiles_HorizontalSpikes_1                            ;87818A;
    dw Instruction_AnimatedTilesObject_GotoY                             ;87818E;
    dw InstList_AnimatedTilesObject_HorizontalSpikes                     ;878190;

InstList_AnimatedTilesObject_CrateriaLake:
    dw $000A,AnimatedTiles_CrateriaLake_0                                ;878192;
    dw $000A,AnimatedTiles_CrateriaLake_1                                ;878196;
    dw $000A,AnimatedTiles_CrateriaLake_2                                ;87819A;
    dw $000A,AnimatedTiles_CrateriaLake_1                                ;87819E;
    dw Instruction_AnimatedTilesObject_GotoY                             ;8781A2;
    dw InstList_AnimatedTilesObject_CrateriaLake                         ;8781A4;

UNUSED_InstList_AnimatedTilesObject_CrateriaLava_8781A6:
    dw $000A,UNUSED_AnimatedTiles_CrateriaLava_0_878B64                  ;8781A6;
    dw $000A,UNUSED_AnimatedTiles_CrateriaLava_1_878C24                  ;8781AA;
    dw $000A,UNUSED_AnimatedTiles_CrateriaLava_2_878CE4                  ;8781AE;
    dw $000A,UNUSED_AnimatedTiles_CrateriaLava_3_878DA4                  ;8781B2;
    dw Instruction_AnimatedTilesObject_GotoY                             ;8781B6;
    dw UNUSED_InstList_AnimatedTilesObject_CrateriaLava_8781A6           ;8781B8;

Instruction_AnimatedTilesObject_WaitUntilAreaBossIsDead:
    LDA.W #$0001                                                         ;8781BA;
    JSL.L CheckIfBossBitsForCurrentAreaMatchAnyBitsInA                   ;8781BD;
    BCS .return                                                          ;8781C1;
    PLA                                                                  ;8781C3;
    LDA.W #$0001                                                         ;8781C4;
    STA.W $1F19,X                                                        ;8781C7;

.return:
    RTS                                                                  ;8781CA;


InstList_AnimatedTilesObject_WreckedShipScreen_0:
    dw Instruction_AnimatedTilesObject_WaitUntilAreaBossIsDead           ;8781CB;

InstList_AnimatedTilesObject_WreckedShipScreen_1:
    dw $000A,AnimatedTiles_WreckedShipScreen_0                           ;8781CD;
    dw $000A,AnimatedTiles_WreckedShipScreen_1                           ;8781D1;
    dw $000A,AnimatedTiles_WreckedShipScreen_2                           ;8781D5;
    dw $000A,AnimatedTiles_WreckedShipScreen_1                           ;8781D9;
    dw Instruction_AnimatedTilesObject_GotoY                             ;8781DD;
    dw InstList_AnimatedTilesObject_WreckedShipScreen_1                  ;8781DF;

InstList_AnimTilesObject_WreckedShipTreadmill_Rightwards_0:
    dw Instruction_AnimatedTilesObject_WaitUntilAreaBossIsDead           ;8781E1;

InstList_AnimTilesObject_WreckedShipTreadmill_Rightwards_1:
    dw $0001,AnimatedTiles_WreckedShipTreadmill_0                        ;8781E3;
    dw $0001,AnimatedTiles_WreckedShipTreadmill_1                        ;8781E7;
    dw $0001,AnimatedTiles_WreckedShipTreadmill_2                        ;8781EB;
    dw $0001,AnimatedTiles_WreckedShipTreadmill_3                        ;8781EF;
    dw Instruction_AnimatedTilesObject_GotoY                             ;8781F3;
    dw InstList_AnimTilesObject_WreckedShipTreadmill_Rightwards_1        ;8781F5;

InstList_AnimTilesObject_WreckedShipTreadmill_Leftwards_0:
    dw Instruction_AnimatedTilesObject_WaitUntilAreaBossIsDead           ;8781F7;

InstList_AnimTilesObject_WreckedShipTreadmill_Leftwards_1:
    dw $0001,AnimatedTiles_WreckedShipTreadmill_3                        ;8781F9;
    dw $0001,AnimatedTiles_WreckedShipTreadmill_2                        ;8781FD;
    dw $0001,AnimatedTiles_WreckedShipTreadmill_1                        ;878201;
    dw $0001,AnimatedTiles_WreckedShipTreadmill_0                        ;878205;
    dw Instruction_AnimatedTilesObject_GotoY                             ;878209;
    dw InstList_AnimTilesObject_WreckedShipTreadmill_Leftwards_1         ;87820B;

InstList_AnimatedTilesObject_BrinstarMouth:
    dw $0010,AnimatedTiles_BrinstarMouth_0                               ;87820D;
    dw $0010,AnimatedTiles_BrinstarMouth_1                               ;878211;
    dw $0010,AnimatedTiles_BrinstarMouth_2                               ;878215;
    dw $0010,AnimatedTiles_BrinstarMouth_1                               ;878219;
    dw Instruction_AnimatedTilesObject_GotoY                             ;87821D;
    dw InstList_AnimatedTilesObject_BrinstarMouth                        ;87821F;

InstList_AnimatedTilesObject_MaridiaSandCeiling:
    dw $000A,AnimatedTiles_MaridiaSandCeiling_0                          ;878221;
    dw $000A,AnimatedTiles_MaridiaSandCeiling_1                          ;878225;
    dw $000A,AnimatedTiles_MaridiaSandCeiling_2                          ;878229;
    dw $000A,AnimatedTiles_MaridiaSandCeiling_3                          ;87822D;
    dw Instruction_AnimatedTilesObject_GotoY                             ;878231;
    dw InstList_AnimatedTilesObject_MaridiaSandCeiling                   ;878233;

InstList_AnimatedTilesObject_MaridiaSandFalling:
    dw $000A,AnimatedTiles_MaridiaSandFalling_0                          ;878235;
    dw $000A,AnimatedTiles_MaridiaSandFalling_1                          ;878239;
    dw $000A,AnimatedTiles_MaridiaSandFalling_2                          ;87823D;
    dw $000A,AnimatedTiles_MaridiaSandFalling_3                          ;878241;
    dw Instruction_AnimatedTilesObject_GotoY                             ;878245;
    dw InstList_AnimatedTilesObject_MaridiaSandFalling                   ;878247;

InstList_AnimatedTilesObject_Nothing:
    dw Instruction_AnimatedTilesObject_Delete                            ;878249;

AnimatedTilesObjects_FX_nothing:
    dw InstList_AnimatedTilesObject_Nothing                              ;87824B;
    dw $0000,$0000                                                       ;87824D;

AnimatedTilesObjects_FX_verticalSpikes:
    dw InstList_AnimatedTilesObject_VerticalSpikes                       ;878251;
    dw $0080,$3880                                                       ;878253;

AnimatedTilesObjects_FX_horizontalSpikes:
    dw InstList_AnimatedTilesObject_HorizontalSpikes                     ;878257;
    dw $0080,$3D60                                                       ;878259;

AnimatedTilesObjects_FX_crateriaLake:
    dw InstList_AnimatedTilesObject_CrateriaLake                         ;87825D;
    dw $0200,$1B00                                                       ;87825F;

UNUSED_AnimatedTilesObjects_FX_unusedCrateriaLava_0_878263:
    dw UNUSED_InstList_AnimatedTilesObject_CrateriaLava_8781A6           ;878263;
    dw $00C0,$0A00                                                       ;878265;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_AnimatedTilesObjects_FX_unusedCrateriaLava_1_878269:
    dw UNUSED_InstList_AnimatedTilesObject_CrateriaLava_8781A6           ;878269;
    dw $00C0,$0640                                                       ;87826B;
endif ; !FEATURE_KEEP_UNREFERENCED

AnimatedTilesObjects_FX_wreckedShipScreen:
    dw InstList_AnimatedTilesObject_WreckedShipScreen_0                  ;87826F;
    dw $0080,$19C0                                                       ;878271;

AnimatedTilesObjects_FX_wreckedShipTreadmillRightwards:
    dw InstList_AnimTilesObject_WreckedShipTreadmill_Rightwards_0        ;878275;
    dw $0020,$00E0                                                       ;878277;

AnimatedTilesObjects_FX_wreckedShipTreadmillLeftwards:
    dw InstList_AnimTilesObject_WreckedShipTreadmill_Leftwards_0         ;87827B;
    dw $0020,$00E0                                                       ;87827D;

AnimatedTilesObjects_FX_brinstarMouth:
    dw InstList_AnimatedTilesObject_BrinstarMouth                        ;878281;
    dw $00E0,$0410                                                       ;878283;

AnimatedTilesObjects_FX_maridiaSandCeiling:
    dw InstList_AnimatedTilesObject_MaridiaSandCeiling                   ;878287;
    dw $0040,$1000                                                       ;878289;

AnimatedTilesObjects_FX_maridiaSandFalling:
    dw InstList_AnimatedTilesObject_MaridiaSandFalling                   ;87828D;
    dw $0020,$1020                                                       ;87828F;

InstList_AnimatedTilesObject_Lava:
    dw $000D,AnimatedTiles_Lava_0                                        ;878293;
    dw $000D,AnimatedTiles_Lava_1                                        ;878297;
    dw $000D,AnimatedTiles_Lava_2                                        ;87829B;
    dw $000D,AnimatedTiles_Lava_3                                        ;87829F;
    dw $000D,AnimatedTiles_Lava_4                                        ;8782A3;
    dw Instruction_AnimatedTilesObject_GotoY                             ;8782A7;
    dw InstList_AnimatedTilesObject_Lava                                 ;8782A9;

AnimatedTilesObject_Lava:
    dw InstList_AnimatedTilesObject_Lava                                 ;8782AB;
    dw $0040,$4280                                                       ;8782AD;

InstList_AnimatedTilesObject_Acid:
    dw $000A,AnimatedTiles_Acid_0                                        ;8782B1;
    dw $000A,AnimatedTiles_Acid_1                                        ;8782B5;
    dw $000A,AnimatedTiles_Acid_2                                        ;8782B9;
    dw $000A,AnimatedTiles_Acid_3                                        ;8782BD;
    dw $000A,AnimatedTiles_Acid_4                                        ;8782C1;
    dw Instruction_AnimatedTilesObject_GotoY                             ;8782C5;
    dw InstList_AnimatedTilesObject_Acid                                 ;8782C7;

AnimatedTilesObject_Acid:
    dw InstList_AnimatedTilesObject_Acid                                 ;8782C9;
    dw $0040,$4280                                                       ;8782CB;

InstList_AnimatedTilesObject_Rain:
    dw $000A,AnimatedTiles_Rain_0                                        ;8782CF;
    dw $000A,AnimatedTiles_Rain_1                                        ;8782D3;
    dw $000A,AnimatedTiles_Rain_2                                        ;8782D7;
    dw $000A,AnimatedTiles_Rain_3                                        ;8782DB;
    dw $000A,AnimatedTiles_Rain_4                                        ;8782DF;
    dw Instruction_AnimatedTilesObject_GotoY                             ;8782E3;
    dw InstList_AnimatedTilesObject_Rain                                 ;8782E5;

AnimatedTilesObject_Rain:
    dw InstList_AnimatedTilesObject_Rain                                 ;8782E7;
    dw $0050,$4280                                                       ;8782E9;

InstList_AnimatedTilesObject_Spores:
    dw $000A,AnimatedTiles_Spores_0                                      ;8782ED;
    dw $000A,AnimatedTiles_Spores_1                                      ;8782F1;
    dw $000A,AnimatedTiles_Spores_2                                      ;8782F5;
    dw Instruction_AnimatedTilesObject_GotoY                             ;8782F9;
    dw InstList_AnimatedTilesObject_Spores                               ;8782FB;

AnimatedTilesObject_Spores:
    dw InstList_AnimatedTilesObject_Spores                               ;8782FD;
    dw $0030,$4280                                                       ;8782FF;

Instruction_AnimTilesObject_GotoYIfAnyBossBitsYSetForAreaY:
    PHX                                                                  ;878303;
    LDA.W $0001,Y                                                        ;878304;
    AND.W #$00FF                                                         ;878307;
    TAX                                                                  ;87830A;
    LDA.L $7ED828,X                                                      ;87830B;
    PLX                                                                  ;87830F;
    AND.W $0000,Y                                                        ;878310;
    INY                                                                  ;878313;
    INY                                                                  ;878314;
    AND.W #$00FF                                                         ;878315;
    BEQ .notSet                                                          ;878318;
    JMP.W Instruction_AnimatedTilesObject_GotoY                          ;87831A;


.notSet:
    INY                                                                  ;87831D;
    INY                                                                  ;87831E;
    RTS                                                                  ;87831F;


Instruction_AnimTilesObject_SpawnTourianStatueEyeGlowParamY:
    PHY                                                                  ;878320;
    LDA.W $0000,Y                                                        ;878321;
    LDY.W #EnemyProjectile_TourianStatueEyeGlow                          ;878324;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;878327;
    PLY                                                                  ;87832B;
    INY                                                                  ;87832C;
    INY                                                                  ;87832D;
    RTS                                                                  ;87832E;


Instruction_AnimTilesObject_SpawnTourianStatuesSoulParamY:
    PHY                                                                  ;87832F;
    LDA.W $0000,Y                                                        ;878330;
    LDY.W #EnemyProjectile_TourianStatueSoul                             ;878333;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;878336;
    PLY                                                                  ;87833A;
    INY                                                                  ;87833B;
    INY                                                                  ;87833C;
    RTS                                                                  ;87833D;


Instruction_AnimatedTilesObject_GotoYIfTourianStatueBusy:
    LDA.W $1E6F                                                          ;87833E;
    BPL .notBusy                                                         ;878341;
    JMP.W Instruction_AnimatedTilesObject_GotoY                          ;878343;


.notBusy:
    INY                                                                  ;878346;
    INY                                                                  ;878347;
    RTS                                                                  ;878348;


Instruction_AnimatedTilesObject_TourianStatueSetAnimStateY:
    LDA.W $0000,Y                                                        ;878349;
    TSB.W $1E6F                                                          ;87834C;
    INY                                                                  ;87834F;
    INY                                                                  ;878350;
    RTS                                                                  ;878351;


Instruction_AnimatedTilesObject_TourianStatueResetAnimStateY:
    LDA.W $0000,Y                                                        ;878352;
    TRB.W $1E6F                                                          ;878355;
    INY                                                                  ;878358;
    INY                                                                  ;878359;
    RTS                                                                  ;87835A;


Instruction_AnimatedTilesObject_Clear3ColorsOfPaletteData:
    PHX                                                                  ;87835B;
    LDX.W $0000,Y                                                        ;87835C;
    LDA.W #$0000                                                         ;87835F;
    STA.L $7EC000,X                                                      ;878362;
    STA.L $7EC002,X                                                      ;878366;
    STA.L $7EC004,X                                                      ;87836A;
    PLX                                                                  ;87836E;
    INY                                                                  ;87836F;
    INY                                                                  ;878370;
    RTS                                                                  ;878371;


Instruction_AnimatedTilesObject_SpawnPaletteFXObjectInY:
    PHY                                                                  ;878372;
    LDA.W $0000,Y                                                        ;878373;
    TAY                                                                  ;878376;
    JSL.L Spawn_PaletteFXObject                                          ;878377;
    PLY                                                                  ;87837B;
    INY                                                                  ;87837C;
    INY                                                                  ;87837D;
    RTS                                                                  ;87837E;


Instruction_AnimatedTilesObject_Write8ColorsOfTargetPaletteD:
    PHX                                                                  ;87837F;
    PHY                                                                  ;878380;
    LDX.W $0000,Y                                                        ;878381;
    LDY.W #$0000                                                         ;878384;

.loop:
    LDA.W .palleteData,Y                                                 ;878387;
    STA.L $7EC200,X                                                      ;87838A;
    INX                                                                  ;87838E;
    INX                                                                  ;87838F;
    INY                                                                  ;878390;
    INY                                                                  ;878391;
    CPY.W #$0010                                                         ;878392;
    BNE .loop                                                            ;878395;
    PLY                                                                  ;878397;
    PLX                                                                  ;878398;
    INY                                                                  ;878399;
    INY                                                                  ;87839A;
    RTS                                                                  ;87839B;


.palleteData:
    dw $3800,$7F58,$6ED5,$5A71,$49EE,$356A,$24E7,$1083                   ;87839C;

InstList_AnimatedTilesObject_TourianStatuePhantoon:
    dw Instruction_AnimatedTilesObject_TourianStatueSetAnimStateY,$0001  ;8783AC;
    dw Instruction_AnimatedTilesObject_GotoYIfEventYSet,$0006            ;8783B0;
    dw InstList_AnimatedTilesObject_TourianStatuePhantoon_grey           ;8783B4;
    dw $0006,AnimatedTiles_PhantoonStatue_0                              ;8783B6;

InstList_AnimatedTilesObject_TourianStatuePhantoon_loop:
    dw $000C,AnimatedTiles_PhantoonStatue_1                              ;8783BA;
    dw $000C,AnimatedTiles_PhantoonStatue_2                              ;8783BE;
    dw $000C,AnimatedTiles_PhantoonStatue_1                              ;8783C2;
    dw $0010,AnimatedTiles_PhantoonStatue_0                              ;8783C6;
    dw Instruction_AnimTilesObject_GotoYIfAnyBossBitsYSetForAreaY        ;8783CA;
    db $01,$03                                                           ;8783CC;
    dw InstList_AnimatedTilesObject_TourianStatuePhantoon_dead           ;8783CE;
    dw Instruction_AnimatedTilesObject_TourianStatueResetAnimStateY,$0001 ;8783D0;
    dw Instruction_AnimatedTilesObject_GotoY                             ;8783D4;
    dw InstList_AnimatedTilesObject_TourianStatuePhantoon_loop           ;8783D6;

InstList_AnimatedTilesObject_TourianStatuePhantoon_dead:
    dw Instruction_AnimatedTilesObject_GotoYIfTourianStatueBusy          ;8783D8;
    dw InstList_AnimatedTilesObject_TourianStatuePhantoon_loop           ;8783DA;
    dw Instruction_AnimatedTilesObject_TourianStatueSetAnimStateY,$8000  ;8783DC;
    dw Instruction_AnimatedTilesObject_Clear3ColorsOfPaletteData,$0158   ;8783E0;
    dw $0010,AnimatedTiles_PhantoonStatue_1                              ;8783E2;
    dw $0010,AnimatedTiles_PhantoonStatue_2                              ;8783E8;
    dw Instruction_AnimTilesObject_SpawnTourianStatueEyeGlowParamY,$0000 ;8783EC;
    dw $00C0,AnimatedTiles_PhantoonStatue_Other                          ;8783EE;
    dw Instruction_AnimTilesObject_SpawnTourianStatuesSoulParamY,$0000   ;8783F4;
    dw Instruction_AnimatedTilesObject_SpawnPaletteFXObjectInY           ;8783F8;
    dw PaletteFXObjects_GreyOutTourianStatue_Phantoon                    ;8783FA;
    dw $0080,AnimatedTiles_PhantoonStatue_Other                          ;8783FC;
    dw Instruction_AnimatedTilesObject_SetEventY,$0006                   ;878400;
    dw Instruction_AnimatedTilesObject_TourianStatueResetAnimStateY,$8001 ;878404;
    dw Instruction_AnimatedTilesObject_Delete                            ;878408;

InstList_AnimatedTilesObject_TourianStatuePhantoon_grey:
    dw Instruction_AnimatedTilesObject_TourianStatueResetAnimStateY,$8001 ;87840A;
    dw Instruction_AnimatedTilesObject_Write8ColorsOfTargetPaletteD,$0140 ;87840E;
    dw Instruction_AnimatedTilesObject_Delete                            ;878412;

InstList_AnimatedTilesObject_TourianStatueRidley:
    dw Instruction_AnimatedTilesObject_TourianStatueSetAnimStateY,$0002  ;878414;
    dw Instruction_AnimatedTilesObject_GotoYIfEventYSet,$0007            ;878418;
    dw InstList_AnimatedTilesObject_TourianStatueRidley_grey             ;87841C;
    dw $000A,AnimatedTiles_RidleyStatue_0                                ;87841E;

InstList_AnimatedTilesObject_TourianStatueRidley_loopWait:
    dw $000C,AnimatedTiles_RidleyStatue_1                                ;878422;
    dw $000C,AnimatedTiles_RidleyStatue_2                                ;878426;
    dw $000C,AnimatedTiles_RidleyStatue_1                                ;87842A;
    dw $0010,AnimatedTiles_RidleyStatue_0                                ;87842E;
    dw Instruction_AnimTilesObject_GotoYIfAnyBossBitsYSetForAreaY        ;878432;
    db $01,$02                                                           ;878434;
    dw InstList_AnimatedTilesObject_TourianStatueRidley_dead             ;878436;
    dw Instruction_AnimatedTilesObject_TourianStatueResetAnimStateY,$0002 ;878438;
    dw Instruction_AnimatedTilesObject_GotoY                             ;87843C;
    dw InstList_AnimatedTilesObject_TourianStatueRidley_loopWait         ;87843E;

InstList_AnimatedTilesObject_TourianStatueRidley_dead:
    dw Instruction_AnimatedTilesObject_GotoYIfTourianStatueBusy          ;878440;
    dw InstList_AnimatedTilesObject_TourianStatueRidley_loopWait         ;878442;
    dw Instruction_AnimatedTilesObject_TourianStatueSetAnimStateY,$8000  ;878444;
    dw Instruction_AnimatedTilesObject_Clear3ColorsOfPaletteData,$0132   ;878448;
    dw $0010,AnimatedTiles_RidleyStatue_1                                ;87844A;
    dw $0010,AnimatedTiles_RidleyStatue_2                                ;878450;
    dw Instruction_AnimTilesObject_SpawnTourianStatueEyeGlowParamY,$0002 ;878454;
    dw $00C0,AnimatedTiles_RidleyStatue_Other                            ;878456;
    dw Instruction_AnimTilesObject_SpawnTourianStatuesSoulParamY,$0002   ;87845C;
    dw Instruction_AnimatedTilesObject_SpawnPaletteFXObjectInY           ;878460;
    dw PaletteFXObjects_GreyOutTourianStatue_Ridley                      ;878462;
    dw $0080,                                                            ;878464;
    dw AnimatedTiles_RidleyStatue_Other                                  ;878466;
    dw Instruction_AnimatedTilesObject_SetEventY,$0007                   ;878468;
    dw Instruction_AnimatedTilesObject_TourianStatueResetAnimStateY,$8002 ;87846C;
    dw Instruction_AnimatedTilesObject_Delete                            ;878470;

InstList_AnimatedTilesObject_TourianStatueRidley_grey:
    dw Instruction_AnimatedTilesObject_TourianStatueResetAnimStateY,$8002 ;878472;
    dw Instruction_AnimatedTilesObject_Write8ColorsOfTargetPaletteD,$0120 ;878476;
    dw Instruction_AnimatedTilesObject_Delete                            ;87847A;

InstList_AnimatedTilesObject_TourianStatueKraid:
    dw Instruction_AnimatedTilesObject_TourianStatueSetAnimStateY,$0004  ;87847C;
    dw Instruction_AnimatedTilesObject_GotoYIfEventYSet,$0009            ;878480;
    dw InstList_AnimatedTilesObject_TourianStatueKraid_grey              ;878484;
    dw $0004,AnimatedTiles_KraidStatue_0                                 ;878486;

InstList_AnimatedTilesObject_TourianStatueKraid_loopWait:
    dw $000C,AnimatedTiles_KraidStatue_1                                 ;87848A;
    dw $000C,AnimatedTiles_KraidStatue_2                                 ;87848E;
    dw $000C,AnimatedTiles_KraidStatue_1                                 ;878492;
    dw $0010,AnimatedTiles_KraidStatue_0                                 ;878496;
    dw Instruction_AnimTilesObject_GotoYIfAnyBossBitsYSetForAreaY        ;87849A;
    db $01,$01                                                           ;87849C;
    dw InstList_AnimatedTilesObject_TourianStatueKraid_dead              ;87849E;
    dw Instruction_AnimatedTilesObject_TourianStatueResetAnimStateY,$0004 ;8784A0;
    dw Instruction_AnimatedTilesObject_GotoY                             ;8784A4;
    dw InstList_AnimatedTilesObject_TourianStatueKraid_loopWait          ;8784A6;

InstList_AnimatedTilesObject_TourianStatueKraid_dead:
    dw Instruction_AnimatedTilesObject_GotoYIfTourianStatueBusy          ;8784A8;
    dw InstList_AnimatedTilesObject_TourianStatueKraid_loopWait          ;8784AA;
    dw Instruction_AnimatedTilesObject_TourianStatueSetAnimStateY,$8000  ;8784AC;
    dw Instruction_AnimatedTilesObject_Clear3ColorsOfPaletteData,$00F8   ;8784B0;
    dw $0010,AnimatedTiles_KraidStatue_1                                 ;8784B2;
    dw $0010,AnimatedTiles_KraidStatue_2                                 ;8784B8;
    dw Instruction_AnimTilesObject_SpawnTourianStatueEyeGlowParamY,$0006 ;8784BC;
    dw $00C0,AnimatedTiles_DraygonStatue_Other                           ;8784BE;
    dw Instruction_AnimTilesObject_SpawnTourianStatuesSoulParamY,$0006   ;8784C4;
    dw Instruction_AnimatedTilesObject_SpawnPaletteFXObjectInY           ;8784C8;
    dw PaletteFXObjects_GreyOutTourianStatue_Kraid                       ;8784CA;
    dw $0080,AnimatedTiles_DraygonStatue_Other                           ;8784CC;
    dw Instruction_AnimatedTilesObject_SetEventY,$0009                   ;8784D0;
    dw Instruction_AnimatedTilesObject_TourianStatueResetAnimStateY,$8004 ;8784D4;
    dw Instruction_AnimatedTilesObject_Delete                            ;8784D8;

InstList_AnimatedTilesObject_TourianStatueKraid_grey:
    dw Instruction_AnimatedTilesObject_TourianStatueResetAnimStateY,$8004 ;8784DA;
    dw Instruction_AnimatedTilesObject_Write8ColorsOfTargetPaletteD,$00E0 ;8784DE;
    dw Instruction_AnimatedTilesObject_Delete                            ;8784E2;

InstList_AnimatedTilesObject_TourianStatueDraygon:
    dw Instruction_AnimatedTilesObject_TourianStatueSetAnimStateY,$0008  ;8784E4;
    dw Instruction_AnimatedTilesObject_GotoYIfEventYSet,$0008            ;8784E8;
    dw InstList_AnimatedTilesObject_TourianStatueDraygon_grey            ;8784EC;
    dw $0008,AnimatedTiles_DraygonStatue_0                               ;8784EE;

InstList_AnimatedTilesObject_TourianStatueDraygon_loopWait:
    dw $000C,AnimatedTiles_DraygonStatue_1                               ;8784F2;
    dw $000C,AnimatedTiles_DraygonStatue_2                               ;8784F6;
    dw $000C,AnimatedTiles_DraygonStatue_1                               ;8784FA;
    dw $0010,AnimatedTiles_DraygonStatue_0                               ;8784FE;
    dw Instruction_AnimTilesObject_GotoYIfAnyBossBitsYSetForAreaY        ;878502;
    db $01,$04                                                           ;878504;
    dw InstList_AnimatedTilesObject_TourianStatueDraygon_dead            ;878506;
    dw Instruction_AnimatedTilesObject_TourianStatueResetAnimStateY,$0008 ;878508;
    dw Instruction_AnimatedTilesObject_GotoY                             ;87850C;
    dw InstList_AnimatedTilesObject_TourianStatueDraygon_loopWait        ;87850E;

InstList_AnimatedTilesObject_TourianStatueDraygon_dead:
    dw Instruction_AnimatedTilesObject_GotoYIfTourianStatueBusy          ;878510;
    dw InstList_AnimatedTilesObject_TourianStatueDraygon_loopWait        ;878512;
    dw Instruction_AnimatedTilesObject_TourianStatueSetAnimStateY,$8000  ;878514;
    dw Instruction_AnimatedTilesObject_Clear3ColorsOfPaletteData,$00D2   ;878518;
    dw $0010,AnimatedTiles_DraygonStatue_1                               ;87851A;
    dw $0010,AnimatedTiles_DraygonStatue_2                               ;878520;
    dw Instruction_AnimTilesObject_SpawnTourianStatueEyeGlowParamY,$0004 ;878524;
    dw $00C0,AnimatedTiles_KraidStatue_Other                             ;878526;
    dw Instruction_AnimTilesObject_SpawnTourianStatuesSoulParamY,$0004   ;87852C;
    dw Instruction_AnimatedTilesObject_SpawnPaletteFXObjectInY           ;878530;
    dw PaletteFXObjects_GreyOutTourianStatue_Draygon                     ;878532;
    dw $0080,AnimatedTiles_KraidStatue_Other                             ;878534;
    dw Instruction_AnimatedTilesObject_SetEventY,$0008                   ;878538;
    dw Instruction_AnimatedTilesObject_TourianStatueResetAnimStateY,$8008 ;87853C;
    dw Instruction_AnimatedTilesObject_Delete                            ;878540;

InstList_AnimatedTilesObject_TourianStatueDraygon_grey:
    dw Instruction_AnimatedTilesObject_TourianStatueResetAnimStateY,$8008 ;878542;
    dw Instruction_AnimatedTilesObject_Write8ColorsOfTargetPaletteD,$00C0 ;878546;
    dw Instruction_AnimatedTilesObject_Delete                            ;87854A;

AnimatedTilesObject_TourianStatuePhantoon:
    dw InstList_AnimatedTilesObject_TourianStatuePhantoon                ;87854C;
    dw $0080,$7800                                                       ;87854E;

AnimatedTilesObject_TourianStatueRidley:
    dw InstList_AnimatedTilesObject_TourianStatueRidley                  ;878552;
    dw $0040,$7220                                                       ;878554;

AnimatedTilesObject_TourianStatueKraid:
    dw InstList_AnimatedTilesObject_TourianStatueKraid                   ;878558;
    dw $0040,$0B40                                                       ;87855A;

AnimatedTilesObject_TourianStatueDraygon:
    dw InstList_AnimatedTilesObject_TourianStatueDraygon                 ;87855E;
    dw $0080,$0CA0                                                       ;878560;

AnimatedTiles_CrateriaLake_0:
incbin "../data/AnimatedTiles_CrateriaLake_0.bin" ; $200 bytes

AnimatedTiles_CrateriaLake_1:
incbin "../data/AnimatedTiles_CrateriaLake_1.bin" ; $200 bytes

AnimatedTiles_CrateriaLake_2:
incbin "../data/AnimatedTiles_CrateriaLake_2.bin" ; $200 bytes

UNUSED_AnimatedTiles_CrateriaLava_0_878B64:
incbin "../data/UNUSED_AnimatedTiles_CrateriaLava_0.bin" ; $C0 bytes

UNUSED_AnimatedTiles_CrateriaLava_1_878C24:
incbin "../data/UNUSED_AnimatedTiles_CrateriaLava_1.bin" ; $C0 bytes

UNUSED_AnimatedTiles_CrateriaLava_2_878CE4:
incbin "../data/UNUSED_AnimatedTiles_CrateriaLava_2.bin" ; $C0 bytes

UNUSED_AnimatedTiles_CrateriaLava_3_878DA4:
incbin "../data/UNUSED_AnimatedTiles_CrateriaLava_3.bin" ; $C0 bytes

AnimatedTiles_WreckedShipTreadmill_0:
incbin "../data/AnimatedTiles_WreckedShipTreadmill_0.bin" ; $20 bytes

AnimatedTiles_WreckedShipTreadmill_1:
incbin "../data/AnimatedTiles_WreckedShipTreadmill_1.bin" ; $20 bytes

AnimatedTiles_WreckedShipTreadmill_2:
incbin "../data/AnimatedTiles_WreckedShipTreadmill_2.bin" ; $20 bytes

AnimatedTiles_WreckedShipTreadmill_3:
incbin "../data/AnimatedTiles_WreckedShipTreadmill_3.bin" ; $20 bytes

AnimatedTiles_WreckedShipScreen_0:
incbin "../data/AnimatedTiles_WreckedShipScreen_0.bin" ; $80 bytes

AnimatedTiles_WreckedShipScreen_1:
incbin "../data/AnimatedTiles_WreckedShipScreen_1.bin" ; $80 bytes

AnimatedTiles_WreckedShipScreen_2:
incbin "../data/AnimatedTiles_WreckedShipScreen_2.bin" ; $80 bytes

if !FEATURE_KEEP_UNREFERENCED
UNUSED_AnimatedTiles_X_879064:
incbin "../data/AnimatedTiles_X_879064.bin" ; $100 bytes
endif ; !FEATURE_KEEP_UNREFERENCED

AnimatedTiles_MaridiaSandFalling_0:
incbin "../data/AnimatedTiles_MaridiaSandFalling_0.bin" ; $20 bytes

AnimatedTiles_MaridiaSandFalling_1:
incbin "../data/AnimatedTiles_MaridiaSandFalling_1.bin" ; $20 bytes

AnimatedTiles_MaridiaSandFalling_2:
incbin "../data/AnimatedTiles_MaridiaSandFalling_2.bin" ; $20 bytes

AnimatedTiles_MaridiaSandFalling_3:
incbin "../data/AnimatedTiles_MaridiaSandFalling_3.bin" ; $20 bytes

AnimatedTiles_MaridiaSandCeiling_0:
incbin "../data/AnimatedTiles_MaridiaSandCeiling_0.bin" ; $40 bytes

AnimatedTiles_MaridiaSandCeiling_1:
incbin "../data/AnimatedTiles_MaridiaSandCeiling_1.bin" ; $40 bytes

AnimatedTiles_MaridiaSandCeiling_2:
incbin "../data/AnimatedTiles_MaridiaSandCeiling_2.bin" ; $40 bytes

AnimatedTiles_MaridiaSandCeiling_3:
incbin "../data/AnimatedTiles_MaridiaSandCeiling_3.bin" ; $40 bytes

if !FEATURE_KEEP_UNREFERENCED
UNUSED_AnimatedTiles_X_8792E4:
incbin "../data/AnimatedTiles_X_8792E4.bin" ; $80 bytes
endif ; !FEATURE_KEEP_UNREFERENCED

AnimatedTiles_PhantoonStatue_0:
incbin "../data/AnimatedTiles_PhantoonStatue_0.bin" ; $80 bytes

AnimatedTiles_PhantoonStatue_1:
incbin "../data/AnimatedTiles_PhantoonStatue_1.bin" ; $80 bytes

AnimatedTiles_PhantoonStatue_2:
incbin "../data/AnimatedTiles_PhantoonStatue_2.bin" ; $80 bytes

AnimatedTiles_RidleyStatue_0:
incbin "../data/AnimatedTiles_RidleyStatue_0.bin" ; $40 bytes

AnimatedTiles_RidleyStatue_1:
incbin "../data/AnimatedTiles_RidleyStatue_1.bin" ; $40 bytes

AnimatedTiles_RidleyStatue_2:
incbin "../data/AnimatedTiles_RidleyStatue_2.bin" ; $40 bytes

AnimatedTiles_DraygonStatue_0:
incbin "../data/AnimatedTiles_DraygonStatue_0.bin" ; $80 bytes

AnimatedTiles_DraygonStatue_1:
incbin "../data/AnimatedTiles_DraygonStatue_1.bin" ; $80 bytes

AnimatedTiles_DraygonStatue_2:
incbin "../data/AnimatedTiles_DraygonStatue_2.bin" ; $80 bytes

AnimatedTiles_KraidStatue_0:
incbin "../data/AnimatedTiles_KraidStatue_0.bin" ; $40 bytes

AnimatedTiles_KraidStatue_1:
incbin "../data/AnimatedTiles_KraidStatue_1.bin" ; $40 bytes

AnimatedTiles_KraidStatue_2:
incbin "../data/AnimatedTiles_KraidStatue_2.bin" ; $40 bytes

AnimatedTiles_PhantoonStatue_Other:
incbin "../data/AnimatedTiles_PhantoonStatue_Other.bin" ; $80 bytes

AnimatedTiles_RidleyStatue_Other:
incbin "../data/AnimatedTiles_RidleyStatue_Other.bin" ; $40 bytes

AnimatedTiles_DraygonStatue_Other:
incbin "../data/AnimatedTiles_DraygonStatue_Other.bin" ; $40 bytes

AnimatedTiles_KraidStatue_Other:
incbin "../data/AnimatedTiles_KraidStatue_Other.bin" ; $80 bytes

AnimatedTiles_BrinstarMouth_0:
incbin "../data/AnimatedTiles_BrinstarMouth_0.bin" ; $E0 bytes

AnimatedTiles_BrinstarMouth_1:
incbin "../data/AnimatedTiles_BrinstarMouth_1.bin" ; $E0 bytes

AnimatedTiles_BrinstarMouth_2:
incbin "../data/AnimatedTiles_BrinstarMouth_2.bin" ; $E0 bytes

AnimatedTiles_VerticalSpikes_0:
incbin "../data/AnimatedTiles_VerticalSpikes_0.bin" ; $80 bytes

AnimatedTiles_VerticalSpikes_1:
incbin "../data/AnimatedTiles_VerticalSpikes_1.bin" ; $80 bytes

AnimatedTiles_VerticalSpikes_2:
incbin "../data/AnimatedTiles_VerticalSpikes_2.bin" ; $80 bytes

AnimatedTiles_HorizontalSpikes_0:
incbin "../data/AnimatedTiles_HorizontalSpikes_0.bin" ; $80 bytes

AnimatedTiles_HorizontalSpikes_1:
incbin "../data/AnimatedTiles_HorizontalSpikes_1.bin" ; $80 bytes

AnimatedTiles_HorizontalSpikes_2:
incbin "../data/AnimatedTiles_HorizontalSpikes_2.bin" ; $80 bytes

if !FEATURE_KEEP_UNREFERENCED
UNUSED_AnimatedTiles_X_879F04:
incbin "../data/AnimatedTiles_X_879F04.bin" ; $660 bytes
endif ; !FEATURE_KEEP_UNREFERENCED

AnimatedTiles_Lava_0:
incbin "../data/AnimatedTiles_Lava_0.bin" ; $40 bytes

AnimatedTiles_Lava_1:
incbin "../data/AnimatedTiles_Lava_1.bin" ; $40 bytes

AnimatedTiles_Lava_2:
incbin "../data/AnimatedTiles_Lava_2.bin" ; $40 bytes

AnimatedTiles_Lava_3:
incbin "../data/AnimatedTiles_Lava_3.bin" ; $40 bytes

AnimatedTiles_Lava_4:
incbin "../data/AnimatedTiles_Lava_4.bin" ; $40 bytes

AnimatedTiles_Acid_0:
incbin "../data/AnimatedTiles_Acid_0.bin" ; $40 bytes

AnimatedTiles_Acid_1:
incbin "../data/AnimatedTiles_Acid_1.bin" ; $40 bytes

AnimatedTiles_Acid_2:
incbin "../data/AnimatedTiles_Acid_2.bin" ; $40 bytes

AnimatedTiles_Acid_3:
incbin "../data/AnimatedTiles_Acid_3.bin" ; $40 bytes

AnimatedTiles_Acid_4:
incbin "../data/AnimatedTiles_Acid_4.bin" ; $40 bytes

AnimatedTiles_Spores_0:
incbin "../data/AnimatedTiles_Spores_0.bin" ; $30 bytes

AnimatedTiles_Spores_1:
incbin "../data/AnimatedTiles_Spores_1.bin" ; $30 bytes

AnimatedTiles_Spores_2:
incbin "../data/AnimatedTiles_Spores_2.bin" ; $30 bytes

AnimatedTiles_Rain_0:
incbin "../data/AnimatedTiles_Rain_0.bin" ; $50 bytes

AnimatedTiles_Rain_1:
incbin "../data/AnimatedTiles_Rain_1.bin" ; $50 bytes

AnimatedTiles_Rain_2:
incbin "../data/AnimatedTiles_Rain_2.bin" ; $50 bytes

AnimatedTiles_Rain_3:
incbin "../data/AnimatedTiles_Rain_3.bin" ; $50 bytes

AnimatedTiles_Rain_4:
incbin "../data/AnimatedTiles_Rain_4.bin" ; $50 bytes

Freespace_Bank87_AA04:
; $360 zero bytes
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;87AA04;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;87AA14;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;87AA24;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;87AA34;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;87AA44;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;87AA54;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;87AA64;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;87AA74;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;87AA84;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;87AA94;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;87AAA4;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;87AAB4;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;87AAC4;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;87AAD4;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;87AAE4;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;87AAF4;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;87AB04;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;87AB14;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;87AB24;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;87AB34;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;87AB44;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;87AB54;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;87AB64;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;87AB74;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;87AB84;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;87AB94;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;87ABA4;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;87ABB4;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;87ABC4;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;87ABD4;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;87ABE4;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;87ABF4;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;87AC04;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;87AC14;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;87AC24;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;87AC34;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;87AC44;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;87AC54;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;87AC64;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;87AC74;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;87AC84;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;87AC94;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;87ACA4;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;87ACB4;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;87ACC4;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;87ACD4;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;87ACE4;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;87ACF4;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;87AD04;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;87AD14;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;87AD24;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;87AD34;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;87AD44;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;87AD54;

Tiles_TourianStatuesSoul:
incbin "../data/Tiles_TourianEntranceStatueGhost.bin" ; $600 bytes

Tiles_TourianStatue:
incbin "../data/Tiles_TourianEntranceStatue.bin" ; $1600 bytes

Freespace_Bank87_C964:                                                   ;87C964;
; $369C bytes
