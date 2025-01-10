
org $A78000


CommonA7_GrappleAI_NoInteraction:
    JSL.L GrappleAI_SwitchEnemyAIToMainAI                                ;A78000;
    RTL                                                                  ;A78004;


CommonA7_GrappleAI_SamusLatchesOn:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple                            ;A78005;
    RTL                                                                  ;A78009;


CommonA7_GrappleAI_KillEnemy:
    JSL.L GrappleAI_EnemyGrappleDeath                                    ;A7800A;
    RTL                                                                  ;A7800E;


CommonA7_GrappleAI_CancelGrappleBeam:
    JSL.L GrappleAI_SwitchToFrozenAI                                     ;A7800F;
    RTL                                                                  ;A78013;


CommonA7_GrappleAI_SamusLatchesOn_NoInvincibility:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple_NoInvincibility            ;A78014;
    RTL                                                                  ;A78018;


UNUSED_CommonA7_GrappleAI_SamusLatchesOn_ParalyzeEnemy_A78019:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple_ParalyzeEnemy              ;A78019;
    RTL                                                                  ;A7801D;


CommonA7_GrappleAI_HurtSamus:
    JSL.L GrappleAI_SwitchToFrozenAI_duplicate                           ;A7801E;
    RTL                                                                  ;A78022;


CommonA7_NormalEnemyTouchAI:
    JSL.L NormalEnemyTouchAI                                             ;A78023;
    RTL                                                                  ;A78027;


CommonA7_NormalTouchAI_NoDeathCheck:
    JSL.L NormalEnemyTouchAI_NoDeathCheck_External                       ;A78028;
    RTL                                                                  ;A7802C;


CommonA7_NormalEnemyShotAI:
    JSL.L NormalEnemyShotAI                                              ;A7802D;
    RTL                                                                  ;A78031;


CommonA7_NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic:
    JSL.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External     ;A78032;
    RTL                                                                  ;A78036;


CommonA7_NormalEnemyPowerBombAI:
    JSL.L NormalEnemyPowerBombAI                                         ;A78037;
    RTL                                                                  ;A7803B;


CommonA7_NormalEnemyPowerBombAI_NoDeathCheck:
    JSL.L NormalEnemyPowerBombAI_NoDeathCheck_External                   ;A7803C;
    RTL                                                                  ;A78040;


CommonA7_NormalEnemyFrozenAI:
    JSL.L NormalEnemyFrozenAI                                            ;A78041;
    RTL                                                                  ;A78045;


CommonA7_CreateADudShot:
    JSL.L CreateADudShot                                                 ;A78046;
    RTL                                                                  ;A7804A;


RTS_A7804B:
    RTS                                                                  ;A7804B;


RTL_A7804C:
    RTL                                                                  ;A7804C;


Spritemap_CommonA7_Nothing:
    dw $0000                                                             ;A7804D;

ExtendedSpritemap_CommonA7_Nothing:
    dw $0001,$0000,$0000                                                 ;A7804F;
    dw Spritemap_CommonA7_Nothing                                        ;A78055;
    dw Hitbox_CommonA7_Nothing                                           ;A78057;

Hitbox_CommonA7_Nothing:
    dw $0001,$0000,$0000,$0000,$0000                                     ;A78059;
    dw CommonA7_NormalEnemyTouchAI                                       ;A78063;
    dw CommonA7_NormalEnemyShotAI                                        ;A78065;

InstList_CommonA7_DeleteEnemy:
    dw Instruction_CommonA7_DeleteEnemy                                  ;A78067;

NOPNOP_A78069:
    NOP                                                                  ;A78069;
    NOP                                                                  ;A7806A;

Instruction_CommonA7_Enemy0FB2_InY:
    LDA.W $0000,Y                                                        ;A7806B;
    STA.W EnemyData.work5,X                                              ;A7806E;
    INY                                                                  ;A78071;
    INY                                                                  ;A78072;
    RTL                                                                  ;A78073;


Instruction_CommonA7_SetEnemy0FB2ToRTS:
    LDA.W #RTS_A7807B                                                    ;A78074;
    STA.W EnemyData.work5,X                                              ;A78077;
    RTL                                                                  ;A7807A;


RTS_A7807B:
    RTS                                                                  ;A7807B;


Instruction_CommonA7_DeleteEnemy:
    LDA.W EnemyData.properties,X                                         ;A7807C;
    ORA.W #$0200                                                         ;A7807F;
    STA.W EnemyData.properties,X                                         ;A78082;
    PLA                                                                  ;A78085;
    PEA.W ProcessEnemyInstructions_return-1                              ;A78086;
    RTL                                                                  ;A78089;


Instruction_CommonA7_CallFunctionInY:
    LDA.W $0000,Y                                                        ;A7808A;
    STA.B $12                                                            ;A7808D;
    PHY                                                                  ;A7808F;
    PHX                                                                  ;A78090;
    PEA.W .manualReturn-1                                                ;A78091;
    JMP.W ($0012)                                                        ;A78094;


.manualReturn:
    PLX                                                                  ;A78097;
    PLY                                                                  ;A78098;
    INY                                                                  ;A78099;
    INY                                                                  ;A7809A;
    RTL                                                                  ;A7809B;


Instruction_CommonA7_CallFunctionInY_WithA:
    LDA.W $0000,Y                                                        ;A7809C;
    STA.B $12                                                            ;A7809F;
    LDA.W $0002,Y                                                        ;A780A1;
    PHY                                                                  ;A780A4;
    PHX                                                                  ;A780A5;
    PEA.W .manualReturn-1                                                ;A780A6;
    JMP.W ($0012)                                                        ;A780A9;


.manualReturn:
    PLX                                                                  ;A780AC;
    PLY                                                                  ;A780AD;
    TYA                                                                  ;A780AE;
    CLC                                                                  ;A780AF;
    ADC.W #$0004                                                         ;A780B0;
    TAY                                                                  ;A780B3;
    RTL                                                                  ;A780B4;


UNUSED_Instruction_CommonA7_CallExternalFunctionInY_A780B5:
    LDA.W $0000,Y                                                        ;A780B5;
    STA.B $12                                                            ;A780B8;
    LDA.W $0001,Y                                                        ;A780BA;
    STA.B $13                                                            ;A780BD;
    PHX                                                                  ;A780BF;
    PHY                                                                  ;A780C0;
    JSL.L .externalFunction                                              ;A780C1;
    PLY                                                                  ;A780C5;
    PLX                                                                  ;A780C6;
    INY                                                                  ;A780C7;
    INY                                                                  ;A780C8;
    INY                                                                  ;A780C9;
    RTL                                                                  ;A780CA;


.externalFunction:
    JML.W [$0012]                                                        ;A780CB;


UNUSED_Inst_CommonA7_CallExternalFunctionInY_WithA_A780CE:
    LDA.W $0000,Y                                                        ;A780CE;
    STA.B $12                                                            ;A780D1;
    LDA.W $0001,Y                                                        ;A780D3;
    STA.B $13                                                            ;A780D6;
    LDA.W $0003,Y                                                        ;A780D8;
    PHX                                                                  ;A780DB;
    PHY                                                                  ;A780DC;
    JSL.L .externalFunction                                              ;A780DD;
    PLY                                                                  ;A780E1;
    PLX                                                                  ;A780E2;
    TYA                                                                  ;A780E3;
    CLC                                                                  ;A780E4;
    ADC.W #$0005                                                         ;A780E5;
    TAY                                                                  ;A780E8;
    RTL                                                                  ;A780E9;


.externalFunction:
    JML.W [$0012]                                                        ;A780EA;


Instruction_CommonA7_GotoY:
    LDA.W $0000,Y                                                        ;A780ED;
    TAY                                                                  ;A780F0;
    RTL                                                                  ;A780F1;


Instruction_CommonA7_GotoY_PlusY:
    STY.B $12                                                            ;A780F2;
    DEY                                                                  ;A780F4;
    LDA.W $0000,Y                                                        ;A780F5;
    XBA                                                                  ;A780F8;
    BMI .highByte                                                        ;A780F9;
    AND.W #$00FF                                                         ;A780FB;
    BRA +                                                                ;A780FE;


.highByte:
    ORA.W #$FF00                                                         ;A78100;

  + CLC                                                                  ;A78103;
    ADC.B $12                                                            ;A78104;
    TAY                                                                  ;A78106;
    RTL                                                                  ;A78107;


Instruction_CommonA7_DecrementTimer_GotoYIfNonZero:
    DEC.W EnemyData.loopCounter,X                                        ;A78108;
    BNE Instruction_CommonA7_GotoY                                       ;A7810B;
    INY                                                                  ;A7810D;
    INY                                                                  ;A7810E;
    RTL                                                                  ;A7810F;


Instruction_CommonA7_DecrementTimer_GotoYIfNonZero_duplicate:
    DEC.W EnemyData.loopCounter,X                                        ;A78110;
    BNE Instruction_CommonA7_GotoY                                       ;A78113;
    INY                                                                  ;A78115;
    INY                                                                  ;A78116;
    RTL                                                                  ;A78117;


Instruction_CommonA7_DecrementTimer_GotoY_PlusY_IfNonZero:
    SEP #$20                                                             ;A78118;
    DEC.W EnemyData.loopCounter,X                                        ;A7811A;
    REP #$20                                                             ;A7811D;
    BNE Instruction_CommonA7_GotoY_PlusY                                 ;A7811F;
    INY                                                                  ;A78121;
    RTL                                                                  ;A78122;


Instruction_CommonA7_TimerInY:
    LDA.W $0000,Y                                                        ;A78123;
    STA.W EnemyData.loopCounter,X                                        ;A78126;
    INY                                                                  ;A78129;
    INY                                                                  ;A7812A;
    RTL                                                                  ;A7812B;


Instruction_CommonA7_SkipNextInstruction:
    INY                                                                  ;A7812C;
    INY                                                                  ;A7812D;
    RTL                                                                  ;A7812E;


Instruction_CommonA7_Sleep:
    DEY                                                                  ;A7812F;
    DEY                                                                  ;A78130;
    TYA                                                                  ;A78131;
    STA.W EnemyData.pInstList,X                                          ;A78132;
    PLA                                                                  ;A78135;
    PEA.W ProcessEnemyInstructions_return-1                              ;A78136;
    RTL                                                                  ;A78139;


Instruction_CommonA7_WaitYFrames:
    LDA.W $0000,Y                                                        ;A7813A;
    STA.W EnemyData.instTimer,X                                          ;A7813D;
    INY                                                                  ;A78140;
    INY                                                                  ;A78141;
    TYA                                                                  ;A78142;
    STA.W EnemyData.pInstList,X                                          ;A78143;
    PLA                                                                  ;A78146;
    PEA.W ProcessEnemyInstructions_return-1                              ;A78147;
    RTL                                                                  ;A7814A;


Instruction_CommonA7_TransferYBytesInYToVRAM:
    PHX                                                                  ;A7814B;
    LDX.W $0330                                                          ;A7814C;
    LDA.W $0000,Y                                                        ;A7814F;
    STA.B $D0,X                                                          ;A78152;
    LDA.W $0002,Y                                                        ;A78154;
    STA.B $D2,X                                                          ;A78157;
    LDA.W $0003,Y                                                        ;A78159;
    STA.B $D3,X                                                          ;A7815C;
    LDA.W $0005,Y                                                        ;A7815E;
    STA.B $D5,X                                                          ;A78161;
    TXA                                                                  ;A78163;
    CLC                                                                  ;A78164;
    ADC.W #$0007                                                         ;A78165;
    STA.W $0330                                                          ;A78168;
    TYA                                                                  ;A7816B;
    CLC                                                                  ;A7816C;
    ADC.W #$0007                                                         ;A7816D;
    TAY                                                                  ;A78170;
    PLX                                                                  ;A78171;
    RTL                                                                  ;A78172;


Instruction_CommonA7_EnableOffScreenProcessing:
    LDA.W EnemyData.properties,X                                         ;A78173;
    ORA.W #$0800                                                         ;A78176;
    STA.W EnemyData.properties,X                                         ;A78179;
    RTL                                                                  ;A7817C;


Instruction_CommonA7_DisableOffScreenProcessing:
    LDA.W EnemyData.properties,X                                         ;A7817D;
    AND.W #$F7FF                                                         ;A78180;
    STA.W EnemyData.properties,X                                         ;A78183;
    RTL                                                                  ;A78186;


CommonA7EnemySpeeds_LinearlyIncreasing:
    dw $0000,$0000,$0000,$0000,$0000,$1000,$FFFF,$F000                   ;A78187;
    dw $0000,$2000,$FFFF,$E000,$0000,$3000,$FFFF,$D000                   ;A78197;
    dw $0000,$4000,$FFFF,$C000,$0000,$5000,$FFFF,$B000                   ;A781A7;
    dw $0000,$6000,$FFFF,$A000,$0000,$7000,$FFFF,$9000                   ;A781B7;
    dw $0000,$8000,$FFFF,$8000,$0000,$9000,$FFFF,$7000                   ;A781C7;
    dw $0000,$A000,$FFFF,$6000,$0000,$B000,$FFFF,$5000                   ;A781D7;
    dw $0000,$C000,$FFFF,$4000,$0000,$D000,$FFFF,$3000                   ;A781E7;
    dw $0000,$E000,$FFFF,$2000,$0000,$F000,$FFFF,$1000                   ;A781F7;
    dw $0001,$0000,$FFFF,$0000,$0001,$1000,$FFFE,$F000                   ;A78207;
    dw $0001,$2000,$FFFE,$E000,$0001,$3000,$FFFE,$D000                   ;A78217;
    dw $0001,$4000,$FFFE,$C000,$0001,$5000,$FFFE,$B000                   ;A78227;
    dw $0001,$6000,$FFFE,$A000,$0001,$7000,$FFFE,$9000                   ;A78237;
    dw $0001,$8000,$FFFE,$8000,$0001,$9000,$FFFE,$7000                   ;A78247;
    dw $0001,$A000,$FFFE,$6000,$0001,$B000,$FFFE,$5000                   ;A78257;
    dw $0001,$C000,$FFFE,$4000,$0001,$D000,$FFFE,$3000                   ;A78267;
    dw $0001,$E000,$FFFE,$2000,$0001,$F000,$FFFE,$1000                   ;A78277;
    dw $0002,$0000,$FFFE,$0000,$0002,$1000,$FFFD,$F000                   ;A78287;
    dw $0002,$2000,$FFFD,$E000,$0002,$3000,$FFFD,$D000                   ;A78297;
    dw $0002,$4000,$FFFD,$C000,$0002,$5000,$FFFD,$B000                   ;A782A7;
    dw $0002,$6000,$FFFD,$A000,$0002,$7000,$FFFD,$9000                   ;A782B7;
    dw $0002,$8000,$FFFD,$8000,$0002,$9000,$FFFD,$7000                   ;A782C7;
    dw $0002,$A000,$FFFD,$6000,$0002,$B000,$FFFD,$5000                   ;A782D7;
    dw $0002,$C000,$FFFD,$4000,$0002,$D000,$FFFD,$3000                   ;A782E7;
    dw $0002,$E000,$FFFD,$2000,$0002,$F000,$FFFD,$1000                   ;A782F7;
    dw $0003,$0000,$FFFD,$0000,$0003,$1000,$FFFC,$F000                   ;A78307;
    dw $0003,$2000,$FFFC,$E000,$0003,$3000,$FFFC,$D000                   ;A78317;
    dw $0003,$4000,$FFFC,$C000,$0003,$5000,$FFFC,$B000                   ;A78327;
    dw $0003,$6000,$FFFC,$A000,$0003,$7000,$FFFC,$9000                   ;A78337;
    dw $0003,$8000,$FFFC,$8000,$0003,$9000,$FFFC,$7000                   ;A78347;
    dw $0003,$A000,$FFFC,$6000,$0003,$B000,$FFFC,$5000                   ;A78357;
    dw $0003,$C000,$FFFC,$4000,$0003,$D000,$FFFC,$3000                   ;A78367;
    dw $0003,$E000,$FFFC,$2000,$0003,$F000,$FFFC,$1000                   ;A78377;
    dw $0004,$0000,$FFFC,$0000                                           ;A78387;

CommonA7EnemySpeeds_QuadraticallyIncreasing:
    dw $0000,$0000,$0000,$0000,$0109,$0000,$FEF7,$FFFF                   ;A7838F;
    dw $031B,$0000,$FCE5,$FFFF,$0636,$0000,$F9CA,$FFFF                   ;A7839F;
    dw $0A5A,$0000,$F5A6,$FFFF,$0F87,$0000,$F079,$FFFF                   ;A783AF;
    dw $15BD,$0000,$EA43,$FFFF,$1CFC,$0000,$E304,$FFFF                   ;A783BF;
    dw $2544,$0000,$DABC,$FFFF,$2E95,$0000,$D16B,$FFFF                   ;A783CF;
    dw $38EF,$0000,$C711,$FFFF,$4452,$0000,$BBAE,$FFFF                   ;A783DF;
    dw $50BE,$0000,$AF42,$FFFF,$5E33,$0000,$A1CD,$FFFF                   ;A783EF;
    dw $6CB1,$0000,$934F,$FFFF,$7C38,$0000,$83C8,$FFFF                   ;A783FF;
    dw $8CC8,$0000,$7338,$FFFF,$9E61,$0000,$619F,$FFFF                   ;A7840F;
    dw $B103,$0000,$4EFD,$FFFF,$C4AE,$0000,$3B52,$FFFF                   ;A7841F;
    dw $D962,$0000,$269E,$FFFF,$EF1F,$0000,$10E1,$FFFF                   ;A7842F;
    dw $05E5,$0000,$FA1B,$FFFF,$14B4,$0001,$EB4C,$FFFE                   ;A7843F;
    dw $2D8C,$0001,$D274,$FFFE,$476D,$0001,$B893,$FFFE                   ;A7844F;
    dw $6257,$0001,$9DA9,$FFFE,$7E4A,$0001,$81B6,$FFFE                   ;A7845F;
    dw $9B46,$0001,$64BA,$FFFE,$B94B,$0001,$46B5,$FFFE                   ;A7846F;
    dw $D859,$0001,$27A7,$FFFE,$F870,$0001,$0790,$FFFE                   ;A7847F;
    dw $1090,$0002,$EF70,$FFFD,$32B9,$0002,$CD47,$FFFD                   ;A7848F;
    dw $55EB,$0002,$AA15,$FFFD,$7A26,$0002,$85DA,$FFFD                   ;A7849F;
    dw $9F6A,$0002,$6096,$FFFD,$C5B7,$0002,$3A49,$FFFD                   ;A784AF;
    dw $ED0D,$0002,$12F3,$FFFD,$0C6C,$0003,$F394,$FFFC                   ;A784BF;
    dw $35D4,$0003,$CA2C,$FFFC,$6045,$0003,$9FBB,$FFFC                   ;A784CF;
    dw $8BBF,$0003,$7441,$FFFC,$B842,$0003,$47BE,$FFFC                   ;A784DF;
    dw $E5CE,$0003,$1A32,$FFFC,$0B63,$0004,$F49D,$FFFB                   ;A784EF;
    dw $3B01,$0004,$C4FF,$FFFB,$6BA8,$0004,$9458,$FFFB                   ;A784FF;
    dw $9D58,$0004,$62A8,$FFFB,$D011,$0004,$2FEF,$FFFB                   ;A7850F;
    dw $03D3,$0004,$FC2D,$FFFB,$2F9E,$0005,$D062,$FFFA                   ;A7851F;
    dw $6572,$0005,$9A8E,$FFFA,$9C4F,$0005,$63B1,$FFFA                   ;A7852F;
    dw $D435,$0005,$2BCB,$FFFA,$0424,$0006,$FBDC,$FFF9                   ;A7853F;
    dw $3E1C,$0006,$C1E4,$FFF9,$791D,$0006,$86E3,$FFF9                   ;A7854F;
    dw $B527,$0006,$4AD9,$FFF9,$F23A,$0006,$0DC6,$FFF9                   ;A7855F;
    dw $2756,$0007,$D8AA,$FFF8,$667B,$0007,$9985,$FFF8                   ;A7856F;
    dw $A6A9,$0007,$5957,$FFF8,$E7E0,$0007,$1820,$FFF8                   ;A7857F;
    dw $2120,$0008,$DEE0,$FFF7,$6469,$0008,$9B97,$FFF7                   ;A7858F;
    dw $A8BB,$0008,$5745,$FFF7,$EE16,$0008,$11EA,$FFF7                   ;A7859F;
    dw $2B7A,$0009,$D486,$FFF6,$72E7,$0009,$8D19,$FFF6                   ;A785AF;
    dw $BB5D,$0009,$44A3,$FFF6,$04DC,$0009,$FB24,$FFF6                   ;A785BF;
    dw $4664,$000A,$B99C,$FFF5,$91F5,$000A,$6E0B,$FFF5                   ;A785CF;
    dw $DE8F,$000A,$2171,$FFF5,$2332,$000B,$DCCE,$FFF4                   ;A785DF;
    dw $71DE,$000B,$8E22,$FFF4,$C193,$000B,$3E6D,$FFF4                   ;A785EF;
    dw $0951,$000C,$F6AF,$FFF3,$5B18,$000C,$A4E8,$FFF3                   ;A785FF;
    dw $ADE8,$000C,$5218,$FFF3,$01C1,$000C,$FE3F,$FFF3                   ;A7860F;
    dw $4DA3,$000D,$B25D,$FFF2,$A38E,$000D,$5C72,$FFF2                   ;A7861F;
    dw $FA82,$000D,$057E,$FFF2,$497F,$000E,$B681,$FFF1                   ;A7862F;
    dw $A285,$000E,$5D7B,$FFF1,$FC94,$000E,$036C,$FFF1                   ;A7863F;
    dw $4EAC,$000F,$B154,$FFF0,$AACD,$000F,$5533,$FFF0                   ;A7864F;
    dw $07F7,$000F,$F809,$FFF0,$5D2A,$0010,$A2D6,$FFEF                   ;A7865F;
    dw $BC66,$0010,$439A,$FFEF,$13AB,$0011,$EC55,$FFEE                   ;A7866F;
    dw $74F9,$0011,$8B07,$FFEE                                           ;A7867F;

Palette_Kraid:
    dw $3800,$559D,$1816,$100D,$4B9F,$3F37,$36D0,$2E69                   ;A78687;
    dw $2608,$1DA6,$1125,$08C5,$0003,$6318,$7FFF,$0000                   ;A78697;

UNUSED_Palette_Kraid_A786A7:
    dw $3800,$559D,$1816,$100D,$4B9F,$3F37,$36D0,$2E69                   ;A786A7;
    dw $2608,$1DA6,$1125,$08C5,$0003,$6318,$7FFF,$0000                   ;A786B7;

Palette_KraidRoomBackground:
    dw $0400,$2D6B,$2D6B,$2D6B,$1986,$14C2,$0840,$0400                   ;A786C7;
    dw $31ED,$18C6,$10C3,$0420,$0252,$2D6B,$4A52,$0000                   ;A786D7;

InstList_KraidFoot_Initial:
    dw $7FFF                                                             ;A786E7;
    dw ExtendedSpritemap_KraidFoot_Initial                               ;A786E9;
    dw Instruction_Common_Sleep                                          ;A786EB;

InstList_KraidFoot_KraidIsBig_Neutral:
    dw $7FFF                                                             ;A786ED;
    dw ExtendedSpritemap_KraidFoot_0                                     ;A786EF;
    dw Instruction_Common_Sleep                                          ;A786F1;

InstList_KraidFoot_KraidIsBig_WalkingForward_0:
    dw Instruction_Kraid_NOP_A7B633                                      ;A786F3;
    dw $0004                                                             ;A786F5;
    dw ExtendedSpritemap_KraidFoot_0                                     ;A786F7;
    dw $0004                                                             ;A786F9;
    dw ExtendedSpritemap_KraidFoot_1                                     ;A786FB;
    dw $0004                                                             ;A786FD;
    dw ExtendedSpritemap_KraidFoot_2                                     ;A786FF;
    dw $0004                                                             ;A78701;
    dw ExtendedSpritemap_KraidFoot_3                                     ;A78703;
    dw $0004                                                             ;A78705;
    dw ExtendedSpritemap_KraidFoot_4                                     ;A78707;
    dw $0004                                                             ;A78709;
    dw ExtendedSpritemap_KraidFoot_5                                     ;A7870B;
    dw $0004                                                             ;A7870D;
    dw ExtendedSpritemap_KraidFoot_6                                     ;A7870F;
    dw $0004                                                             ;A78711;
    dw ExtendedSpritemap_KraidFoot_7                                     ;A78713;
    dw $0004                                                             ;A78715;
    dw ExtendedSpritemap_KraidFoot_8                                     ;A78717;
    dw $0004                                                             ;A78719;
    dw ExtendedSpritemap_KraidFoot_9                                     ;A7871B;
    dw $0004                                                             ;A7871D;
    dw ExtendedSpritemap_KraidFoot_A                                     ;A7871F;
    dw $0003                                                             ;A78721;
    dw ExtendedSpritemap_KraidFoot_B                                     ;A78723;
    dw $0001                                                             ;A78725;
    dw ExtendedSpritemap_KraidFoot_C                                     ;A78727;
    dw $0001                                                             ;A78729;
    dw ExtendedSpritemap_KraidFoot_D                                     ;A7872B;
    dw $0001                                                             ;A7872D;
    dw ExtendedSpritemap_KraidFoot_E                                     ;A7872F;
    dw $0001                                                             ;A78731;
    dw ExtendedSpritemap_KraidFoot_F                                     ;A78733;
    dw $0001                                                             ;A78735;
    dw ExtendedSpritemap_KraidFoot_10                                    ;A78737;
    dw $0010                                                             ;A78739;
    dw ExtendedSpritemap_KraidFoot_11                                    ;A7873B;
    dw Instruction_Kraid_DecrementYPosition                              ;A7873D;
    dw Instruction_Kraid_XPositionMinus3                                 ;A7873F;
    dw $0001                                                             ;A78741;
    dw ExtendedSpritemap_KraidFoot_12                                    ;A78743;
    dw Instruction_Kraid_DecrementYPosition                              ;A78745;
    dw Instruction_Kraid_XPositionMinus3                                 ;A78747;
    dw $0001                                                             ;A78749;
    dw ExtendedSpritemap_KraidFoot_13                                    ;A7874B;
    dw Instruction_Kraid_NOP_A7B633                                      ;A7874D;
    dw $0003                                                             ;A7874F;
    dw ExtendedSpritemap_KraidFoot_13                                    ;A78751;
    dw Instruction_Kraid_DecrementYPosition                              ;A78753;
    dw Instruction_Kraid_XPositionMinus3                                 ;A78755;
    dw $0001                                                             ;A78757;
    dw ExtendedSpritemap_KraidFoot_13                                    ;A78759;
    dw Instruction_Kraid_NOP_A7B633                                      ;A7875B;
    dw $0003                                                             ;A7875D;
    dw ExtendedSpritemap_KraidFoot_13                                    ;A7875F;
    dw Instruction_Kraid_DecrementYPosition                              ;A78761;
    dw Instruction_Kraid_XPositionMinus3                                 ;A78763;
    dw $0001                                                             ;A78765;
    dw ExtendedSpritemap_KraidFoot_15                                    ;A78767;
    dw Instruction_Kraid_NOP_A7B633                                      ;A78769;
    dw $0003                                                             ;A7876B;
    dw ExtendedSpritemap_KraidFoot_15                                    ;A7876D;
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking             ;A7876F;
    dw Instruction_Kraid_XPositionMinus3                                 ;A78771;
    dw $0001                                                             ;A78773;
    dw ExtendedSpritemap_KraidFoot_16                                    ;A78775;
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking             ;A78777;
    dw Instruction_Kraid_XPositionMinus3                                 ;A78779;
    dw $0001                                                             ;A7877B;
    dw ExtendedSpritemap_KraidFoot_17                                    ;A7877D;
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking             ;A7877F;
    dw Instruction_Kraid_XPositionMinus3                                 ;A78781;
    dw $0001                                                             ;A78783;
    dw ExtendedSpritemap_KraidFoot_18                                    ;A78785;
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking             ;A78787;
    dw Instruction_Kraid_XPositionMinus3                                 ;A78789;
    dw Instruction_Kraid_QueueSFX76_Lib2_Max6                            ;A7878B;
    dw $0001                                                             ;A7878D;
    dw ExtendedSpritemap_KraidFoot_19                                    ;A7878F;
    dw Instruction_Kraid_NOP_A7B633                                      ;A78791;
    dw Instruction_Kraid_XPositionMinus3                                 ;A78793;
    dw $0001                                                             ;A78795;
    dw ExtendedSpritemap_KraidFoot_1A                                    ;A78797;
    dw Instruction_Kraid_XPositionMinus3                                 ;A78799;
    dw $0001                                                             ;A7879B;
    dw ExtendedSpritemap_KraidFoot_1B                                    ;A7879D;
    dw Instruction_Kraid_XPositionMinus3                                 ;A7879F;
    dw $0001                                                             ;A787A1;
    dw ExtendedSpritemap_KraidFoot_1C                                    ;A787A3;
    dw Instruction_Kraid_XPositionMinus3                                 ;A787A5;
    dw $0001                                                             ;A787A7;
    dw ExtendedSpritemap_KraidFoot_1D                                    ;A787A9;
    dw Instruction_Kraid_XPositionMinus3                                 ;A787AB;
    dw $0001                                                             ;A787AD;
    dw ExtendedSpritemap_KraidFoot_1E                                    ;A787AF;
    dw Instruction_Kraid_XPositionMinus3                                 ;A787B1;
    dw $0001                                                             ;A787B3;
    dw ExtendedSpritemap_KraidFoot_1F                                    ;A787B5;
    dw $0001                                                             ;A787B7;
    dw ExtendedSpritemap_KraidFoot_0                                     ;A787B9;

InstList_KraidFoot_KraidIsBig_WalkingForward_1:
    dw Instruction_Common_Sleep                                          ;A787BB;

InstList_KraidFoot_LungeForward_0:
    dw Instruction_Kraid_NOP_A7B633                                      ;A787BD;
    dw $0001                                                             ;A787BF;
    dw ExtendedSpritemap_KraidFoot_0                                     ;A787C1;
    dw $0001                                                             ;A787C3;
    dw ExtendedSpritemap_KraidFoot_1                                     ;A787C5;
    dw $0001                                                             ;A787C7;
    dw ExtendedSpritemap_KraidFoot_2                                     ;A787C9;
    dw $0001                                                             ;A787CB;
    dw ExtendedSpritemap_KraidFoot_3                                     ;A787CD;
    dw $0001                                                             ;A787CF;
    dw ExtendedSpritemap_KraidFoot_4                                     ;A787D1;
    dw $0001                                                             ;A787D3;
    dw ExtendedSpritemap_KraidFoot_5                                     ;A787D5;
    dw $0001                                                             ;A787D7;
    dw ExtendedSpritemap_KraidFoot_6                                     ;A787D9;
    dw $0001                                                             ;A787DB;
    dw ExtendedSpritemap_KraidFoot_7                                     ;A787DD;
    dw $0001                                                             ;A787DF;
    dw ExtendedSpritemap_KraidFoot_8                                     ;A787E1;
    dw $0001                                                             ;A787E3;
    dw ExtendedSpritemap_KraidFoot_9                                     ;A787E5;
    dw $0001                                                             ;A787E7;
    dw ExtendedSpritemap_KraidFoot_A                                     ;A787E9;
    dw $0001                                                             ;A787EB;
    dw ExtendedSpritemap_KraidFoot_B                                     ;A787ED;
    dw $0001                                                             ;A787EF;
    dw ExtendedSpritemap_KraidFoot_C                                     ;A787F1;
    dw $0001                                                             ;A787F3;
    dw ExtendedSpritemap_KraidFoot_D                                     ;A787F5;
    dw $0001                                                             ;A787F7;
    dw ExtendedSpritemap_KraidFoot_E                                     ;A787F9;
    dw $0001                                                             ;A787FB;
    dw ExtendedSpritemap_KraidFoot_F                                     ;A787FD;
    dw $0001                                                             ;A787FF;
    dw ExtendedSpritemap_KraidFoot_10                                    ;A78801;
    dw $0004                                                             ;A78803;
    dw ExtendedSpritemap_KraidFoot_11                                    ;A78805;
    dw Instruction_Kraid_DecrementYPosition                              ;A78807;
    dw Instruction_Kraid_XPositionMinus3_duplicate                       ;A78809;
    dw $0001                                                             ;A7880B;
    dw ExtendedSpritemap_KraidFoot_12                                    ;A7880D;
    dw Instruction_Kraid_DecrementYPosition                              ;A7880F;
    dw Instruction_Kraid_XPositionMinus3_duplicate                       ;A78811;
    dw $0001                                                             ;A78813;
    dw ExtendedSpritemap_KraidFoot_13                                    ;A78815;
    dw Instruction_Kraid_NOP_A7B633                                      ;A78817;
    dw $0001                                                             ;A78819;
    dw ExtendedSpritemap_KraidFoot_13                                    ;A7881B;
    dw Instruction_Kraid_DecrementYPosition                              ;A7881D;
    dw Instruction_Kraid_XPositionMinus3_duplicate                       ;A7881F;
    dw $0001                                                             ;A78821;
    dw ExtendedSpritemap_KraidFoot_13                                    ;A78823;
    dw Instruction_Kraid_NOP_A7B633                                      ;A78825;
    dw $0001                                                             ;A78827;
    dw ExtendedSpritemap_KraidFoot_13                                    ;A78829;
    dw Instruction_Kraid_DecrementYPosition                              ;A7882B;
    dw Instruction_Kraid_XPositionMinus3_duplicate                       ;A7882D;
    dw $0001                                                             ;A7882F;
    dw ExtendedSpritemap_KraidFoot_15                                    ;A78831;
    dw Instruction_Kraid_NOP_A7B633                                      ;A78833;
    dw $0001                                                             ;A78835;
    dw ExtendedSpritemap_KraidFoot_15                                    ;A78837;
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking             ;A78839;
    dw Instruction_Kraid_XPositionMinus3_duplicate                       ;A7883B;
    dw $0001                                                             ;A7883D;
    dw ExtendedSpritemap_KraidFoot_16                                    ;A7883F;
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking             ;A78841;
    dw Instruction_Kraid_XPositionMinus3_duplicate                       ;A78843;
    dw $0001                                                             ;A78845;
    dw ExtendedSpritemap_KraidFoot_17                                    ;A78847;
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking             ;A78849;
    dw Instruction_Kraid_XPositionMinus3_duplicate                       ;A7884B;
    dw $0001                                                             ;A7884D;
    dw ExtendedSpritemap_KraidFoot_18                                    ;A7884F;
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking             ;A78851;
    dw Instruction_Kraid_XPositionMinus3_duplicate                       ;A78853;
    dw Instruction_Kraid_QueueSFX76_Lib2_Max6                            ;A78855;
    dw $0001                                                             ;A78857;
    dw ExtendedSpritemap_KraidFoot_19                                    ;A78859;
    dw Instruction_Kraid_NOP_A7B633                                      ;A7885B;
    dw Instruction_Kraid_XPositionMinus3_duplicate                       ;A7885D;
    dw $0001                                                             ;A7885F;
    dw ExtendedSpritemap_KraidFoot_1A                                    ;A78861;
    dw Instruction_Kraid_XPositionMinus3_duplicate                       ;A78863;
    dw $0001                                                             ;A78865;
    dw ExtendedSpritemap_KraidFoot_1B                                    ;A78867;
    dw Instruction_Kraid_XPositionMinus3_duplicate                       ;A78869;
    dw $0001                                                             ;A7886B;
    dw ExtendedSpritemap_KraidFoot_1C                                    ;A7886D;
    dw Instruction_Kraid_XPositionMinus3_duplicate                       ;A7886F;
    dw $0001                                                             ;A78871;
    dw ExtendedSpritemap_KraidFoot_1D                                    ;A78873;
    dw Instruction_Kraid_XPositionMinus3_duplicate                       ;A78875;
    dw $0001                                                             ;A78877;
    dw ExtendedSpritemap_KraidFoot_1E                                    ;A78879;
    dw $0001                                                             ;A7887B;
    dw ExtendedSpritemap_KraidFoot_1F                                    ;A7887D;
    dw Instruction_Kraid_XPositionMinus3_duplicate                       ;A7887F;
    dw $0001                                                             ;A78881;
    dw ExtendedSpritemap_KraidFoot_0                                     ;A78883;

InstList_KraidFoot_LungeForward_1:
    dw Instruction_Common_Sleep                                          ;A78885;

InstList_KraidFoot_KraidIsBig_WalkingBackwards_0:
    dw Instruction_Kraid_NOP_A7B633                                      ;A78887;
    dw Instruction_Kraid_XPositionPlus3                                  ;A78889;
    dw $0004                                                             ;A7888B;
    dw ExtendedSpritemap_KraidFoot_22                                    ;A7888D;
    dw Instruction_Kraid_XPositionPlus3                                  ;A7888F;
    dw $0001                                                             ;A78891;
    dw ExtendedSpritemap_KraidFoot_20                                    ;A78893;
    dw Instruction_Kraid_XPositionPlus3                                  ;A78895;
    dw $0001                                                             ;A78897;
    dw ExtendedSpritemap_KraidFoot_1E                                    ;A78899;
    dw Instruction_Kraid_XPositionPlus3                                  ;A7889B;
    dw $0001                                                             ;A7889D;
    dw ExtendedSpritemap_KraidFoot_1D                                    ;A7889F;
    dw Instruction_Kraid_XPositionPlus3                                  ;A788A1;
    dw $0001                                                             ;A788A3;
    dw ExtendedSpritemap_KraidFoot_1C                                    ;A788A5;
    dw Instruction_Kraid_XPositionPlus3                                  ;A788A7;
    dw $0001                                                             ;A788A9;
    dw ExtendedSpritemap_KraidFoot_1B                                    ;A788AB;
    dw Instruction_Kraid_XPositionPlus3                                  ;A788AD;
    dw $0001                                                             ;A788AF;
    dw ExtendedSpritemap_KraidFoot_1A                                    ;A788B1;
    dw Instruction_Kraid_DecrementYPosition                              ;A788B3;
    dw Instruction_Kraid_XPositionPlus3                                  ;A788B5;
    dw $0001                                                             ;A788B7;
    dw ExtendedSpritemap_KraidFoot_19                                    ;A788B9;
    dw Instruction_Kraid_DecrementYPosition                              ;A788BB;
    dw Instruction_Kraid_XPositionPlus3                                  ;A788BD;
    dw $0001                                                             ;A788BF;
    dw ExtendedSpritemap_KraidFoot_18                                    ;A788C1;
    dw Instruction_Kraid_DecrementYPosition                              ;A788C3;
    dw Instruction_Kraid_XPositionPlus3                                  ;A788C5;
    dw $0001                                                             ;A788C7;
    dw ExtendedSpritemap_KraidFoot_17                                    ;A788C9;
    dw Instruction_Kraid_DecrementYPosition                              ;A788CB;
    dw Instruction_Kraid_XPositionPlus3                                  ;A788CD;
    dw $0001                                                             ;A788CF;
    dw ExtendedSpritemap_KraidFoot_16                                    ;A788D1;
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking             ;A788D3;
    dw Instruction_Kraid_XPositionPlus3                                  ;A788D5;
    dw $0001                                                             ;A788D7;
    dw ExtendedSpritemap_KraidFoot_15                                    ;A788D9;
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking             ;A788DB;
    dw Instruction_Kraid_XPositionPlus3                                  ;A788DD;
    dw $0001                                                             ;A788DF;
    dw ExtendedSpritemap_KraidFoot_14                                    ;A788E1;
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking             ;A788E3;
    dw Instruction_Kraid_XPositionPlus3                                  ;A788E5;
    dw $0001                                                             ;A788E7;
    dw ExtendedSpritemap_KraidFoot_13                                    ;A788E9;
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking             ;A788EB;
    dw Instruction_Kraid_QueueSFX76_Lib2_Max6                            ;A788ED;
    dw $0001                                                             ;A788EF;
    dw ExtendedSpritemap_KraidFoot_12                                    ;A788F1;
    dw Instruction_Kraid_NOP_A7B633                                      ;A788F3;
    dw $0014                                                             ;A788F5;
    dw ExtendedSpritemap_KraidFoot_11                                    ;A788F7;
    dw $0004                                                             ;A788F9;
    dw ExtendedSpritemap_KraidFoot_10                                    ;A788FB;
    dw $0004                                                             ;A788FD;
    dw ExtendedSpritemap_KraidFoot_F                                     ;A788FF;
    dw $0004                                                             ;A78901;
    dw ExtendedSpritemap_KraidFoot_E                                     ;A78903;
    dw $0004                                                             ;A78905;
    dw ExtendedSpritemap_KraidFoot_D                                     ;A78907;
    dw $0004                                                             ;A78909;
    dw ExtendedSpritemap_KraidFoot_C                                     ;A7890B;
    dw $0004                                                             ;A7890D;
    dw ExtendedSpritemap_KraidFoot_B                                     ;A7890F;
    dw $0004                                                             ;A78911;
    dw ExtendedSpritemap_KraidFoot_A                                     ;A78913;
    dw $0004                                                             ;A78915;
    dw ExtendedSpritemap_KraidFoot_9                                     ;A78917;
    dw $0001                                                             ;A78919;
    dw ExtendedSpritemap_KraidFoot_8                                     ;A7891B;
    dw $0001                                                             ;A7891D;
    dw ExtendedSpritemap_KraidFoot_7                                     ;A7891F;
    dw $0001                                                             ;A78921;
    dw ExtendedSpritemap_KraidFoot_6                                     ;A78923;
    dw $0001                                                             ;A78925;
    dw ExtendedSpritemap_KraidFoot_5                                     ;A78927;
    dw $0001                                                             ;A78929;
    dw ExtendedSpritemap_KraidFoot_4                                     ;A7892B;
    dw $0001                                                             ;A7892D;
    dw ExtendedSpritemap_KraidFoot_3                                     ;A7892F;
    dw $0001                                                             ;A78931;
    dw ExtendedSpritemap_KraidFoot_2                                     ;A78933;
    dw $0001                                                             ;A78935;
    dw ExtendedSpritemap_KraidFoot_1                                     ;A78937;

InstList_KraidFoot_KraidIsBig_WalkingBackwards_1:
    dw Instruction_Common_GotoY                                          ;A78939;
    dw InstList_KraidFoot_KraidIsBig_WalkingBackwards_0                  ;A7893B;

UNUSED_InstList_KraidFoot_WalkingBackwards_Fast_A7893D:
    dw Instruction_Kraid_NOP_A7B633                                      ;A7893D;
    dw UNUSED_Instruction_Kraid_MoveRight_A7B683                         ;A7893F;
    dw $0004                                                             ;A78941;
    dw ExtendedSpritemap_KraidFoot_22                                    ;A78943;
    dw UNUSED_Instruction_Kraid_MoveRight_A7B683                         ;A78945;
    dw $0001                                                             ;A78947;
    dw ExtendedSpritemap_KraidFoot_20                                    ;A78949;
    dw UNUSED_Instruction_Kraid_MoveRight_A7B683                         ;A7894B;
    dw $0001                                                             ;A7894D;
    dw ExtendedSpritemap_KraidFoot_1E                                    ;A7894F;
    dw UNUSED_Instruction_Kraid_MoveRight_A7B683                         ;A78951;
    dw $0001                                                             ;A78953;
    dw ExtendedSpritemap_KraidFoot_1D                                    ;A78955;
    dw UNUSED_Instruction_Kraid_MoveRight_A7B683                         ;A78957;
    dw $0001                                                             ;A78959;
    dw ExtendedSpritemap_KraidFoot_1C                                    ;A7895B;
    dw UNUSED_Instruction_Kraid_MoveRight_A7B683                         ;A7895D;
    dw $0001                                                             ;A7895F;
    dw ExtendedSpritemap_KraidFoot_1B                                    ;A78961;
    dw UNUSED_Instruction_Kraid_MoveRight_A7B683                         ;A78963;
    dw $0001                                                             ;A78965;
    dw ExtendedSpritemap_KraidFoot_1A                                    ;A78967;
    dw Instruction_Kraid_DecrementYPosition                              ;A78969;
    dw UNUSED_Instruction_Kraid_MoveRight_A7B683                         ;A7896B;
    dw $0001                                                             ;A7896D;
    dw ExtendedSpritemap_KraidFoot_19                                    ;A7896F;
    dw Instruction_Kraid_DecrementYPosition                              ;A78971;
    dw UNUSED_Instruction_Kraid_MoveRight_A7B683                         ;A78973;
    dw $0001                                                             ;A78975;
    dw ExtendedSpritemap_KraidFoot_18                                    ;A78977;
    dw Instruction_Kraid_DecrementYPosition                              ;A78979;
    dw UNUSED_Instruction_Kraid_MoveRight_A7B683                         ;A7897B;
    dw $0001                                                             ;A7897D;
    dw ExtendedSpritemap_KraidFoot_17                                    ;A7897F;
    dw Instruction_Kraid_DecrementYPosition                              ;A78981;
    dw UNUSED_Instruction_Kraid_MoveRight_A7B683                         ;A78983;
    dw $0001                                                             ;A78985;
    dw ExtendedSpritemap_KraidFoot_16                                    ;A78987;
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking             ;A78989;
    dw UNUSED_Instruction_Kraid_MoveRight_A7B683                         ;A7898B;
    dw $0001                                                             ;A7898D;
    dw ExtendedSpritemap_KraidFoot_15                                    ;A7898F;
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking             ;A78991;
    dw UNUSED_Instruction_Kraid_MoveRight_A7B683                         ;A78993;
    dw $0001                                                             ;A78995;
    dw ExtendedSpritemap_KraidFoot_14                                    ;A78997;
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking             ;A78999;
    dw UNUSED_Instruction_Kraid_MoveRight_A7B683                         ;A7899B;
    dw $0001                                                             ;A7899D;
    dw ExtendedSpritemap_KraidFoot_13                                    ;A7899F;
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking             ;A789A1;
    dw Instruction_Kraid_QueueSFX76_Lib2_Max6                            ;A789A3;
    dw $0001                                                             ;A789A5;
    dw ExtendedSpritemap_KraidFoot_12                                    ;A789A7;
    dw Instruction_Kraid_NOP_A7B633                                      ;A789A9;
    dw $0014                                                             ;A789AB;
    dw ExtendedSpritemap_KraidFoot_11                                    ;A789AD;
    dw $0004                                                             ;A789AF;
    dw ExtendedSpritemap_KraidFoot_10                                    ;A789B1;
    dw $0004                                                             ;A789B3;
    dw ExtendedSpritemap_KraidFoot_F                                     ;A789B5;
    dw $0004                                                             ;A789B7;
    dw ExtendedSpritemap_KraidFoot_E                                     ;A789B9;
    dw $0004                                                             ;A789BB;
    dw ExtendedSpritemap_KraidFoot_D                                     ;A789BD;
    dw $0004                                                             ;A789BF;
    dw ExtendedSpritemap_KraidFoot_C                                     ;A789C1;
    dw $0004                                                             ;A789C3;
    dw ExtendedSpritemap_KraidFoot_B                                     ;A789C5;
    dw $0004                                                             ;A789C7;
    dw ExtendedSpritemap_KraidFoot_A                                     ;A789C9;
    dw $0004                                                             ;A789CB;
    dw ExtendedSpritemap_KraidFoot_9                                     ;A789CD;
    dw $0001                                                             ;A789CF;
    dw ExtendedSpritemap_KraidFoot_8                                     ;A789D1;
    dw $0001                                                             ;A789D3;
    dw ExtendedSpritemap_KraidFoot_7                                     ;A789D5;
    dw $0001                                                             ;A789D7;
    dw ExtendedSpritemap_KraidFoot_6                                     ;A789D9;
    dw $0001                                                             ;A789DB;
    dw ExtendedSpritemap_KraidFoot_5                                     ;A789DD;
    dw $0001                                                             ;A789DF;
    dw ExtendedSpritemap_KraidFoot_4                                     ;A789E1;
    dw $0001                                                             ;A789E3;
    dw ExtendedSpritemap_KraidFoot_3                                     ;A789E5;
    dw $0001                                                             ;A789E7;
    dw ExtendedSpritemap_KraidFoot_2                                     ;A789E9;
    dw $0001                                                             ;A789EB;
    dw ExtendedSpritemap_KraidFoot_1                                     ;A789ED;
    dw Instruction_Common_GotoY                                          ;A789EF;
    dw UNUSED_InstList_KraidFoot_WalkingBackwards_Fast_A7893D            ;A789F1;

InstList_KraidArm_Normal_0:
    dw $0006                                                             ;A789F3;
    dw ExtendedSpritemap_KraidArm_General_0                              ;A789F5;
    dw $0006                                                             ;A789F7;
    dw ExtendedSpritemap_KraidArm_General_1                              ;A789F9;
    dw $0006                                                             ;A789FB;
    dw ExtendedSpritemap_KraidArm_General_2                              ;A789FD;
    dw $0006                                                             ;A789FF;
    dw ExtendedSpritemap_KraidArm_General_3                              ;A78A01;
    dw $0006                                                             ;A78A03;
    dw ExtendedSpritemap_KraidArm_General_4                              ;A78A05;
    dw $0006                                                             ;A78A07;
    dw ExtendedSpritemap_KraidArm_General_5                              ;A78A09;
    dw $0006                                                             ;A78A0B;
    dw ExtendedSpritemap_KraidArm_General_6                              ;A78A0D;
    dw $0006                                                             ;A78A0F;
    dw ExtendedSpritemap_KraidArm_General_7                              ;A78A11;
    dw $0006                                                             ;A78A13;
    dw ExtendedSpritemap_KraidArm_General_8                              ;A78A15;
    dw $0006                                                             ;A78A17;
    dw ExtendedSpritemap_KraidArm_General_9                              ;A78A19;
    dw $0006                                                             ;A78A1B;
    dw ExtendedSpritemap_KraidArm_General_7                              ;A78A1D;
    dw $0006                                                             ;A78A1F;
    dw ExtendedSpritemap_KraidArm_General_6                              ;A78A21;
    dw $0006                                                             ;A78A23;
    dw ExtendedSpritemap_KraidArm_General_5                              ;A78A25;
    dw $0006                                                             ;A78A27;
    dw ExtendedSpritemap_KraidArm_General_4                              ;A78A29;
    dw $0006                                                             ;A78A2B;
    dw ExtendedSpritemap_KraidArm_General_3                              ;A78A2D;
    dw $0006                                                             ;A78A2F;
    dw ExtendedSpritemap_KraidArm_General_2                              ;A78A31;
    dw $0006                                                             ;A78A33;
    dw ExtendedSpritemap_KraidArm_General_1                              ;A78A35;

InstList_KraidArm_Normal_1:
    dw $0020                                                             ;A78A37;
    dw ExtendedSpritemap_KraidArm_General_0                              ;A78A39;
    dw Instruction_KraidArm_SlowArmIfLessThanHalfHealth                  ;A78A3B;
    dw Instruction_Common_GotoY                                          ;A78A3D;
    dw InstList_KraidArm_Normal_0                                        ;A78A3F;

InstList_KraidArm_Slow:
    dw $0008                                                             ;A78A41;
    dw ExtendedSpritemap_KraidArm_General_0                              ;A78A43;
    dw $0008                                                             ;A78A45;
    dw ExtendedSpritemap_KraidArm_General_1                              ;A78A47;
    dw $0008                                                             ;A78A49;
    dw ExtendedSpritemap_KraidArm_General_2                              ;A78A4B;
    dw $0008                                                             ;A78A4D;
    dw ExtendedSpritemap_KraidArm_General_3                              ;A78A4F;
    dw $0008                                                             ;A78A51;
    dw ExtendedSpritemap_KraidArm_General_4                              ;A78A53;
    dw $0008                                                             ;A78A55;
    dw ExtendedSpritemap_KraidArm_General_5                              ;A78A57;
    dw $0008                                                             ;A78A59;
    dw ExtendedSpritemap_KraidArm_General_6                              ;A78A5B;
    dw $0008                                                             ;A78A5D;
    dw ExtendedSpritemap_KraidArm_General_7                              ;A78A5F;
    dw $0008                                                             ;A78A61;
    dw ExtendedSpritemap_KraidArm_General_8                              ;A78A63;
    dw $0008                                                             ;A78A65;
    dw ExtendedSpritemap_KraidArm_General_9                              ;A78A67;
    dw $0008                                                             ;A78A69;
    dw ExtendedSpritemap_KraidArm_General_7                              ;A78A6B;
    dw $0008                                                             ;A78A6D;
    dw ExtendedSpritemap_KraidArm_General_6                              ;A78A6F;
    dw $0008                                                             ;A78A71;
    dw ExtendedSpritemap_KraidArm_General_5                              ;A78A73;
    dw $0008                                                             ;A78A75;
    dw ExtendedSpritemap_KraidArm_General_4                              ;A78A77;
    dw $0008                                                             ;A78A79;
    dw ExtendedSpritemap_KraidArm_General_3                              ;A78A7B;
    dw $0008                                                             ;A78A7D;
    dw ExtendedSpritemap_KraidArm_General_2                              ;A78A7F;
    dw $0008                                                             ;A78A81;
    dw ExtendedSpritemap_KraidArm_General_1                              ;A78A83;
    dw $0030                                                             ;A78A85;
    dw ExtendedSpritemap_KraidArm_General_0                              ;A78A87;
    dw Instruction_KraidArm_SlowArmIfLessThanHalfHealth                  ;A78A89;
    dw Instruction_Common_GotoY                                          ;A78A8B;
    dw InstList_KraidArm_Slow                                            ;A78A8D;

Instruction_KraidArm_SlowArmIfLessThanHalfHealth:
    LDA.W $0F8C                                                          ;A78A8F;
    CMP.L $7E7812                                                        ;A78A92;
    BPL .return                                                          ;A78A96;
    LDA.W $0FD2                                                          ;A78A98;
    CMP.W #InstList_KraidArm_Slow                                        ;A78A9B;
    BPL .return                                                          ;A78A9E;
    LDY.W #InstList_KraidArm_Slow                                        ;A78AA0;

.return:
    RTL                                                                  ;A78AA3;


InstList_KraidArm_RisingSinking:
    dw $0006                                                             ;A78AA4;
    dw ExtendedSpritemap_KraidArm_RisingSinking_0                        ;A78AA6;
    dw $0006                                                             ;A78AA8;
    dw ExtendedSpritemap_KraidArm_RisingSinking_1                        ;A78AAA;
    dw $0006                                                             ;A78AAC;
    dw ExtendedSpritemap_KraidArm_RisingSinking_2                        ;A78AAE;
    dw $0006                                                             ;A78AB0;
    dw ExtendedSpritemap_KraidArm_RisingSinking_3                        ;A78AB2;
    dw $0006                                                             ;A78AB4;
    dw ExtendedSpritemap_KraidArm_RisingSinking_4                        ;A78AB6;
    dw $0006                                                             ;A78AB8;
    dw ExtendedSpritemap_KraidArm_RisingSinking_5                        ;A78ABA;
    dw $0006                                                             ;A78ABC;
    dw ExtendedSpritemap_KraidArm_RisingSinking_6                        ;A78ABE;
    dw $0006                                                             ;A78AC0;
    dw ExtendedSpritemap_KraidArm_RisingSinking_7                        ;A78AC2;
    dw $0006                                                             ;A78AC4;
    dw ExtendedSpritemap_KraidArm_RisingSinking_8                        ;A78AC6;
    dw $0006                                                             ;A78AC8;
    dw ExtendedSpritemap_KraidArm_RisingSinking_9                        ;A78ACA;
    dw $0006                                                             ;A78ACC;
    dw ExtendedSpritemap_KraidArm_RisingSinking_7                        ;A78ACE;
    dw $0006                                                             ;A78AD0;
    dw ExtendedSpritemap_KraidArm_RisingSinking_6                        ;A78AD2;
    dw $0006                                                             ;A78AD4;
    dw ExtendedSpritemap_KraidArm_RisingSinking_5                        ;A78AD6;
    dw $0006                                                             ;A78AD8;
    dw ExtendedSpritemap_KraidArm_RisingSinking_4                        ;A78ADA;
    dw $0006                                                             ;A78ADC;
    dw ExtendedSpritemap_KraidArm_RisingSinking_3                        ;A78ADE;
    dw $0006                                                             ;A78AE0;
    dw ExtendedSpritemap_KraidArm_RisingSinking_2                        ;A78AE2;
    dw $0006                                                             ;A78AE4;
    dw ExtendedSpritemap_KraidArm_RisingSinking_1                        ;A78AE6;
    dw $0020                                                             ;A78AE8;
    dw ExtendedSpritemap_KraidArm_RisingSinking_0                        ;A78AEA;
    dw Instruction_Common_GotoY                                          ;A78AEC;
    dw InstList_KraidArm_RisingSinking                                   ;A78AEE;

InstList_KraidArm_Dying_PreparingToLungeForward:
    dw $0006                                                             ;A78AF0;
    dw ExtendedSpritemap_KraidArm_General_0                              ;A78AF2;
    dw $0006                                                             ;A78AF4;
    dw ExtendedSpritemap_KraidArm_Dying_PreparingToLungeForward_0        ;A78AF6;
    dw $7FFF                                                             ;A78AF8;
    dw ExtendedSpritemap_KraidArm_Dying_PreparingToLungeForward_1        ;A78AFA;
    dw Instruction_Common_Sleep                                          ;A78AFC;

InstList_KraidLint_Initial:
    dw $7FFF                                                             ;A78AFE;
    dw Spritemap_KraidLint_Initial                                       ;A78B00;
    dw Instruction_Common_Sleep                                          ;A78B02;

InstList_KraidLint_KraidIsBig:
    dw $7FFF                                                             ;A78B04;
    dw ExtendedSpritemap_KraidLint_KraidIsBig                            ;A78B06;
    dw Instruction_Common_Sleep                                          ;A78B08;

InstList_KraidNail:
    dw $0003                                                             ;A78B0A;
    dw Spritemap_KraidNail_0                                             ;A78B0C;
    dw $0003                                                             ;A78B0E;
    dw Spritemap_KraidNail_1                                             ;A78B10;
    dw $0003                                                             ;A78B12;
    dw Spritemap_KraidNail_2                                             ;A78B14;
    dw $0003                                                             ;A78B16;
    dw Spritemap_KraidNail_3                                             ;A78B18;
    dw $0003                                                             ;A78B1A;
    dw Spritemap_KraidNail_4                                             ;A78B1C;
    dw $0003                                                             ;A78B1E;
    dw Spritemap_KraidNail_5                                             ;A78B20;
    dw $0003                                                             ;A78B22;
    dw Spritemap_KraidNail_6                                             ;A78B24;
    dw $0003                                                             ;A78B26;
    dw Spritemap_KraidNail_7                                             ;A78B28;
    dw Instruction_Common_GotoY                                          ;A78B2A;
    dw InstList_KraidNail                                                ;A78B2C;

UNUSED_ExtendedSpritemap_KraidArm_A78B2E:
    dw $0002,$0000,$0000                                                 ;A78B2E;
    dw Spritemap_KraidArm_General_A                                      ;A78B34;
    dw Hitbox_KraidArm_F                                                 ;A78B36;
    dw $FFF7,$FFF6                                                       ;A78B38;
    dw Spritemap_KraidArm_General_0                                      ;A78B3C;
    dw Hitbox_KraidArm_0                                                 ;A78B3E;

UNUSED_ExtendedSpritemap_KraidArm_A78B40:
    dw $0002,$FFF9,$FFF8                                                 ;A78B40;
    dw Spritemap_KraidArm_General_1                                      ;A78B46;
    dw Hitbox_KraidArm_1                                                 ;A78B48;
    dw $0001,$0000                                                       ;A78B4A;
    dw Spritemap_KraidArm_General_A                                      ;A78B4E;
    dw Hitbox_KraidArm_F                                                 ;A78B50;

UNUSED_ExtendedSpritemap_KraidArm_A78B52:
    dw $0002,$FFF8,$FFF8                                                 ;A78B52;
    dw Spritemap_KraidArm_General_2                                      ;A78B58;
    dw Hitbox_KraidArm_2                                                 ;A78B5A;
    dw $0000,$0000                                                       ;A78B5C;
    dw Spritemap_KraidArm_General_A                                      ;A78B60;
    dw Hitbox_KraidArm_F                                                 ;A78B62;

UNUSED_ExtendedSpritemap_KraidArm_A78B64:
    dw $0002,$FFF8,$FFF8                                                 ;A78B64;
    dw Spritemap_KraidArm_General_3                                      ;A78B6A;
    dw Hitbox_KraidArm_3                                                 ;A78B6C;
    dw $0000,$0000                                                       ;A78B6E;
    dw Spritemap_KraidArm_General_A                                      ;A78B72;
    dw Hitbox_KraidArm_F                                                 ;A78B74;

UNUSED_ExtendedSpritemap_KraidArm_A78B76:
    dw $0002,$FFF6,$0001                                                 ;A78B76;
    dw Spritemap_KraidArm_General_1                                      ;A78B7C;
    dw Hitbox_KraidArm_1                                                 ;A78B7E;
    dw $0000,$0000                                                       ;A78B80;
    dw Spritemap_KraidArm_General_7                                      ;A78B84;
    dw Hitbox_KraidArm_8                                                 ;A78B86;

UNUSED_ExtendedSpritemap_KraidArm_A78B88:
    dw $0002,$FFF6,$0000                                                 ;A78B88;
    dw Spritemap_KraidArm_General_2                                      ;A78B8E;
    dw Hitbox_KraidArm_2                                                 ;A78B90;
    dw $0000,$0000                                                       ;A78B92;
    dw Spritemap_KraidArm_General_7                                      ;A78B96;
    dw Hitbox_KraidArm_8                                                 ;A78B98;

UNUSED_ExtendedSpritemap_KraidArm_A78B9A:
    dw $0002,$FFF6,$0000                                                 ;A78B9A;
    dw Spritemap_KraidArm_General_3                                      ;A78BA0;
    dw Hitbox_KraidArm_3                                                 ;A78BA2;
    dw $0000,$0000                                                       ;A78BA4;
    dw Spritemap_KraidArm_General_7                                      ;A78BA8;
    dw Hitbox_KraidArm_8                                                 ;A78BAA;

UNUSED_ExtendedSpritemap_KraidArm_A78BAC:
    dw $0002,$FFF6,$0000                                                 ;A78BAC;
    dw Spritemap_KraidArm_General_4                                      ;A78BB2;
    dw Hitbox_KraidArm_4                                                 ;A78BB4;
    dw $0000,$0000                                                       ;A78BB6;
    dw Spritemap_KraidArm_General_7                                      ;A78BBA;
    dw Hitbox_KraidArm_8                                                 ;A78BBC;

UNUSED_ExtendedSpritemap_KraidArm_A78BBE:
    dw $0002,$FFFA,$0006                                                 ;A78BBE;
    dw Spritemap_KraidArm_General_2                                      ;A78BC4;
    dw Hitbox_KraidArm_2                                                 ;A78BC6;
    dw $0000,$0000                                                       ;A78BC8;
    dw Spritemap_KraidArm_General_8                                      ;A78BCC;
    dw Hitbox_KraidArm_9                                                 ;A78BCE;

UNUSED_ExtendedSpritemap_KraidArm_A78BD0:
    dw $0002,$FFFA,$0006                                                 ;A78BD0;
    dw Spritemap_KraidArm_General_3                                      ;A78BD6;
    dw Hitbox_KraidArm_3                                                 ;A78BD8;
    dw $0000,$0000                                                       ;A78BDA;
    dw Spritemap_KraidArm_General_8                                      ;A78BDE;
    dw Hitbox_KraidArm_9                                                 ;A78BE0;

UNUSED_ExtendedSpritemap_KraidArm_A78BE2:
    dw $0002,$FFF8,$0006                                                 ;A78BE2;
    dw Spritemap_KraidArm_General_4                                      ;A78BE8;
    dw Hitbox_KraidArm_4                                                 ;A78BEA;
    dw $0000,$0000                                                       ;A78BEC;
    dw Spritemap_KraidArm_General_8                                      ;A78BF0;
    dw Hitbox_KraidArm_9                                                 ;A78BF2;

UNUSED_ExtendedSpritemap_KraidArm_A78BF4:
    dw $0002,$FFF8,$0006                                                 ;A78BF4;
    dw Spritemap_KraidArm_General_5                                      ;A78BFA;
    dw Hitbox_KraidArm_5                                                 ;A78BFC;
    dw $0000,$0000                                                       ;A78BFE;
    dw Spritemap_KraidArm_General_8                                      ;A78C02;
    dw Hitbox_KraidArm_9                                                 ;A78C04;

UNUSED_ExtendedSpritemap_KraidArm_A78C06:
    dw $0002,$0001,$000A                                                 ;A78C06;
    dw Spritemap_KraidArm_General_3                                      ;A78C0C;
    dw Hitbox_KraidArm_3                                                 ;A78C0E;
    dw $0000,$0000                                                       ;A78C10;
    dw Spritemap_KraidArm_General_9                                      ;A78C14;
    dw Hitbox_KraidArm_A                                                 ;A78C16;

UNUSED_ExtendedSpritemap_KraidArm_A78C18:
    dw $0002,$0000,$000A                                                 ;A78C18;
    dw Spritemap_KraidArm_General_4                                      ;A78C1E;
    dw Hitbox_KraidArm_4                                                 ;A78C20;
    dw $0000,$0000                                                       ;A78C22;
    dw Spritemap_KraidArm_General_9                                      ;A78C26;
    dw Hitbox_KraidArm_A                                                 ;A78C28;

UNUSED_ExtendedSpritemap_KraidArm_A78C2A:
    dw $0002,$FFFF,$000C                                                 ;A78C2A;
    dw Spritemap_KraidArm_General_5                                      ;A78C30;
    dw Hitbox_KraidArm_5                                                 ;A78C32;
    dw $0000,$0000                                                       ;A78C34;
    dw Spritemap_KraidArm_General_9                                      ;A78C38;
    dw Hitbox_KraidArm_A                                                 ;A78C3A;

UNUSED_ExtendedSpritemap_KraidArm_A78C3C:
    dw $0002,$0000,$000B                                                 ;A78C3C;
    dw Spritemap_KraidArm_General_6                                      ;A78C42;
    dw Hitbox_KraidArm_6                                                 ;A78C44;
    dw $0000,$0000                                                       ;A78C46;
    dw Spritemap_KraidArm_General_9                                      ;A78C4A;
    dw Hitbox_KraidArm_A                                                 ;A78C4C;

UNUSED_ExtendedSpritemap_KraidArm_A78C4E:
    dw $0001,$0000,$0000                                                 ;A78C4E;
    dw Spritemap_KraidArm_General_D                                      ;A78C54;
    dw Hitbox_KraidArm_12                                                ;A78C56;

UNUSED_ExtendedSpritemap_KraidArm_A78C58:
    dw $0001,$0000,$0000                                                 ;A78C58;
    dw Spritemap_KraidArm_General_C                                      ;A78C5E;
    dw Hitbox_KraidArm_11                                                ;A78C60;

UNUSED_ExtendedSpritemap_KraidArm_A78C62:
    dw $0001,$0000,$0000                                                 ;A78C62;
    dw Spritemap_KraidArm_General_B                                      ;A78C68;
    dw Hitbox_KraidArm_10                                                ;A78C6A;

ExtendedSpritemap_KraidLint_KraidIsBig:
    dw $0005,$01F4                                                       ;A78C6C;
    db $08                                                               ;A78C70;
    dw $21C2,$81E4                                                       ;A78C71;
    db $00                                                               ;A78C75;
    dw $21B0,$81F4                                                       ;A78C76;
    db $F8                                                               ;A78C7A;
    dw $21A2,$81E4                                                       ;A78C7B;
    db $F8                                                               ;A78C7F;
    dw $21A0,$8004                                                       ;A78C80;
    db $F8                                                               ;A78C84;
    dw $21A9                                                             ;A78C85;

UNUSED_ExtendedSpritemap_KraidFoot_A78C87:
    dw $0001,$0000,$0000                                                 ;A78C87;
    dw UNUSED_Spritemap_KraidFoot_A794DA                                 ;A78C8D;
    dw UNUSED_Hitbox_KraidFoot                                           ;A78C8F;

UNUSED_ExtendedSpritemap_KraidFoot_A78C91:
    dw $0002,$0000,$0000                                                 ;A78C91;
    dw Spritemap_KraidFoot_0                                             ;A78C97;
    dw UNUSED_Hitbox_KraidFoot                                           ;A78C99;
    dw $000C,$0030                                                       ;A78C9B;
    dw Spritemap_KraidFoot_4                                             ;A78C9F;
    dw UNUSED_Hitbox_KraidFoot                                           ;A78CA1;

UNUSED_ExtendedSpritemap_KraidFoot_A78CA3:
    dw $0002,$0000,$0000                                                 ;A78CA3;
    dw Spritemap_KraidFoot_1                                             ;A78CA9;
    dw UNUSED_Hitbox_KraidFoot                                           ;A78CAB;
    dw $0000,$0039                                                       ;A78CAD;
    dw Spritemap_KraidFoot_4                                             ;A78CB1;
    dw UNUSED_Hitbox_KraidFoot                                           ;A78CB3;

UNUSED_ExtendedSpritemap_KraidFoot_A78CB5:
    dw $0002,$0000,$0000                                                 ;A78CB5;
    dw Spritemap_KraidFoot_2                                             ;A78CBB;
    dw UNUSED_Hitbox_KraidFoot                                           ;A78CBD;
    dw $FFF0,$003F                                                       ;A78CBF;
    dw Spritemap_KraidFoot_4                                             ;A78CC3;
    dw UNUSED_Hitbox_KraidFoot                                           ;A78CC5;

UNUSED_ExtendedSpritemap_KraidFoot_A78CC7:
    dw $0002,$0000,$0000                                                 ;A78CC7;
    dw Spritemap_KraidFoot_3                                             ;A78CCD;
    dw UNUSED_Hitbox_KraidFoot                                           ;A78CCF;
    dw $FFDF,$003D                                                       ;A78CD1;
    dw Spritemap_KraidFoot_4                                             ;A78CD5;
    dw UNUSED_Hitbox_KraidFoot                                           ;A78CD7;

UNUSED_ExtendedSpritemap_KraidFoot_A78CD9:
    dw $0001,$0000,$0000                                                 ;A78CD9;
    dw UNUSED_Spritemap_KraidFoot_A796CB                                 ;A78CDF;
    dw UNUSED_Hitbox_KraidFoot_A79461                                    ;A78CE1;

ExtendedSpritemap_KraidFoot_0:
    dw $0002,$0008,$0028                                                 ;A78CE3;
    dw Spritemap_KraidFoot_4                                             ;A78CE9;
    dw Hitbox_KraidFoot                                                  ;A78CEB;
    dw $0000,$0000                                                       ;A78CED;
    dw Spritemap_KraidFoot_0                                             ;A78CF1;
    dw Hitbox_KraidFoot                                                  ;A78CF3;

ExtendedSpritemap_KraidFoot_1:
    dw $0002,$0006,$0027                                                 ;A78CF5;
    dw Spritemap_KraidFoot_4                                             ;A78CFB;
    dw Hitbox_KraidFoot                                                  ;A78CFD;
    dw $FFFE,$FFFF                                                       ;A78CFF;
    dw Spritemap_KraidFoot_0                                             ;A78D03;
    dw Hitbox_KraidFoot                                                  ;A78D05;

ExtendedSpritemap_KraidFoot_2:
    dw $0002,$0004,$0026                                                 ;A78D07;
    dw Spritemap_KraidFoot_4                                             ;A78D0D;
    dw Hitbox_KraidFoot                                                  ;A78D0F;
    dw $FFFC,$FFFE                                                       ;A78D11;
    dw Spritemap_KraidFoot_0                                             ;A78D15;
    dw Hitbox_KraidFoot                                                  ;A78D17;

ExtendedSpritemap_KraidFoot_3:
    dw $0002,$0002,$0025                                                 ;A78D19;
    dw Spritemap_KraidFoot_4                                             ;A78D1F;
    dw Hitbox_KraidFoot                                                  ;A78D21;
    dw $FFFA,$FFFD                                                       ;A78D23;
    dw Spritemap_KraidFoot_0                                             ;A78D27;
    dw Hitbox_KraidFoot                                                  ;A78D29;

ExtendedSpritemap_KraidFoot_4:
    dw $0002,$0000,$0024                                                 ;A78D2B;
    dw Spritemap_KraidFoot_4                                             ;A78D31;
    dw Hitbox_KraidFoot                                                  ;A78D33;
    dw $FFF8,$FFFC                                                       ;A78D35;
    dw Spritemap_KraidFoot_0                                             ;A78D39;
    dw Hitbox_KraidFoot                                                  ;A78D3B;

ExtendedSpritemap_KraidFoot_5:
    dw $0002,$FFFE,$0023                                                 ;A78D3D;
    dw Spritemap_KraidFoot_4                                             ;A78D43;
    dw Hitbox_KraidFoot                                                  ;A78D45;
    dw $0005,$FFF1                                                       ;A78D47;
    dw Spritemap_KraidFoot_1                                             ;A78D4B;
    dw Hitbox_KraidFoot                                                  ;A78D4D;

ExtendedSpritemap_KraidFoot_6:
    dw $0002,$FFFC,$0022                                                 ;A78D4F;
    dw Spritemap_KraidFoot_4                                             ;A78D55;
    dw Hitbox_KraidFoot                                                  ;A78D57;
    dw $0003,$FFF0                                                       ;A78D59;
    dw Spritemap_KraidFoot_1                                             ;A78D5D;
    dw Hitbox_KraidFoot                                                  ;A78D5F;

ExtendedSpritemap_KraidFoot_7:
    dw $0002,$FFFA,$0021                                                 ;A78D61;
    dw Spritemap_KraidFoot_4                                             ;A78D67;
    dw Hitbox_KraidFoot                                                  ;A78D69;
    dw $0001,$FFEF                                                       ;A78D6B;
    dw Spritemap_KraidFoot_1                                             ;A78D6F;
    dw Hitbox_KraidFoot                                                  ;A78D71;

ExtendedSpritemap_KraidFoot_8:
    dw $0002,$FFF8,$0020                                                 ;A78D73;
    dw Spritemap_KraidFoot_4                                             ;A78D79;
    dw Hitbox_KraidFoot                                                  ;A78D7B;
    dw $FFFF,$FFEE                                                       ;A78D7D;
    dw Spritemap_KraidFoot_1                                             ;A78D81;
    dw Hitbox_KraidFoot                                                  ;A78D83;

ExtendedSpritemap_KraidFoot_9:
    dw $0002,$FFF6,$001F                                                 ;A78D85;
    dw Spritemap_KraidFoot_4                                             ;A78D8B;
    dw Hitbox_KraidFoot                                                  ;A78D8D;
    dw $FFFD,$FFED                                                       ;A78D8F;
    dw Spritemap_KraidFoot_1                                             ;A78D93;
    dw Hitbox_KraidFoot                                                  ;A78D95;

ExtendedSpritemap_KraidFoot_A:
    dw $0002,$FFF4,$001D                                                 ;A78D97;
    dw Spritemap_KraidFoot_4                                             ;A78D9D;
    dw Hitbox_KraidFoot                                                  ;A78D9F;
    dw $000C,$FFE6                                                       ;A78DA1;
    dw Spritemap_KraidFoot_2                                             ;A78DA5;
    dw Hitbox_KraidFoot                                                  ;A78DA7;

ExtendedSpritemap_KraidFoot_B:
    dw $0002,$FFF2,$001C                                                 ;A78DA9;
    dw Spritemap_KraidFoot_4                                             ;A78DAF;
    dw Hitbox_KraidFoot                                                  ;A78DB1;
    dw $001A,$FFE9                                                       ;A78DB3;
    dw Spritemap_KraidFoot_3                                             ;A78DB7;
    dw Hitbox_KraidFoot                                                  ;A78DB9;

ExtendedSpritemap_KraidFoot_C:
    dw $0002,$FFF0,$001E                                                 ;A78DBB;
    dw Spritemap_KraidFoot_4                                             ;A78DC1;
    dw Hitbox_KraidFoot                                                  ;A78DC3;
    dw $0018,$FFEB                                                       ;A78DC5;
    dw Spritemap_KraidFoot_3                                             ;A78DC9;
    dw Hitbox_KraidFoot                                                  ;A78DCB;

ExtendedSpritemap_KraidFoot_D:
    dw $0002,$FFEE,$0020                                                 ;A78DCD;
    dw Spritemap_KraidFoot_4                                             ;A78DD3;
    dw Hitbox_KraidFoot                                                  ;A78DD5;
    dw $0016,$FFED                                                       ;A78DD7;
    dw Spritemap_KraidFoot_3                                             ;A78DDB;
    dw Hitbox_KraidFoot                                                  ;A78DDD;

ExtendedSpritemap_KraidFoot_E:
    dw $0002,$FFEC,$0022                                                 ;A78DDF;
    dw Spritemap_KraidFoot_4                                             ;A78DE5;
    dw Hitbox_KraidFoot                                                  ;A78DE7;
    dw $0014,$FFEF                                                       ;A78DE9;
    dw Spritemap_KraidFoot_3                                             ;A78DED;
    dw Hitbox_KraidFoot                                                  ;A78DEF;

ExtendedSpritemap_KraidFoot_F:
    dw $0002,$FFEA,$0024                                                 ;A78DF1;
    dw Spritemap_KraidFoot_4                                             ;A78DF7;
    dw Hitbox_KraidFoot                                                  ;A78DF9;
    dw $0012,$FFF1                                                       ;A78DFB;
    dw Spritemap_KraidFoot_3                                             ;A78DFF;
    dw Hitbox_KraidFoot                                                  ;A78E01;

ExtendedSpritemap_KraidFoot_10:
    dw $0002,$FFE8,$0026                                                 ;A78E03;
    dw Spritemap_KraidFoot_4                                             ;A78E09;
    dw Hitbox_KraidFoot                                                  ;A78E0B;
    dw $0010,$FFF3                                                       ;A78E0D;
    dw Spritemap_KraidFoot_3                                             ;A78E11;
    dw Hitbox_KraidFoot                                                  ;A78E13;

ExtendedSpritemap_KraidFoot_11:
    dw $0002,$FFE6,$0028                                                 ;A78E15;
    dw Spritemap_KraidFoot_4                                             ;A78E1B;
    dw Hitbox_KraidFoot                                                  ;A78E1D;
    dw $000E,$FFF5                                                       ;A78E1F;
    dw Spritemap_KraidFoot_3                                             ;A78E23;
    dw Hitbox_KraidFoot                                                  ;A78E25;

ExtendedSpritemap_KraidFoot_12:
    dw $0002,$FFE8,$0028                                                 ;A78E27;
    dw Spritemap_KraidFoot_4                                             ;A78E2D;
    dw Hitbox_KraidFoot                                                  ;A78E2F;
    dw $0010,$FFF6                                                       ;A78E31;
    dw Spritemap_KraidFoot_3                                             ;A78E35;
    dw Hitbox_KraidFoot                                                  ;A78E37;

ExtendedSpritemap_KraidFoot_13:
    dw $0002,$FFEA,$0028                                                 ;A78E39;
    dw Spritemap_KraidFoot_4                                             ;A78E3F;
    dw Hitbox_KraidFoot                                                  ;A78E41;
    dw $0012,$FFF6                                                       ;A78E43;
    dw Spritemap_KraidFoot_3                                             ;A78E47;
    dw Hitbox_KraidFoot                                                  ;A78E49;

ExtendedSpritemap_KraidFoot_14:
    dw $0002,$FFEC,$0028                                                 ;A78E4B;
    dw Spritemap_KraidFoot_4                                             ;A78E51;
    dw Hitbox_KraidFoot                                                  ;A78E53;
    dw $0014,$FFF6                                                       ;A78E55;
    dw Spritemap_KraidFoot_3                                             ;A78E59;
    dw Hitbox_KraidFoot                                                  ;A78E5B;

ExtendedSpritemap_KraidFoot_15:
    dw $0002,$FFEE,$0028                                                 ;A78E5D;
    dw Spritemap_KraidFoot_4                                             ;A78E63;
    dw Hitbox_KraidFoot                                                  ;A78E65;
    dw $0006,$FFF1                                                       ;A78E67;
    dw Spritemap_KraidFoot_2                                             ;A78E6B;
    dw Hitbox_KraidFoot                                                  ;A78E6D;

ExtendedSpritemap_KraidFoot_16:
    dw $0002,$FFF0,$0028                                                 ;A78E6F;
    dw Spritemap_KraidFoot_4                                             ;A78E75;
    dw Hitbox_KraidFoot                                                  ;A78E77;
    dw $0008,$FFF1                                                       ;A78E79;
    dw Spritemap_KraidFoot_2                                             ;A78E7D;
    dw Hitbox_KraidFoot                                                  ;A78E7F;

ExtendedSpritemap_KraidFoot_17:
    dw $0002,$FFF2,$0028                                                 ;A78E81;
    dw Spritemap_KraidFoot_4                                             ;A78E87;
    dw Hitbox_KraidFoot                                                  ;A78E89;
    dw $FFF9,$FFF6                                                       ;A78E8B;
    dw Spritemap_KraidFoot_1                                             ;A78E8F;
    dw Hitbox_KraidFoot                                                  ;A78E91;

ExtendedSpritemap_KraidFoot_18:
    dw $0002,$FFF4,$0028                                                 ;A78E93;
    dw Spritemap_KraidFoot_4                                             ;A78E99;
    dw Hitbox_KraidFoot                                                  ;A78E9B;
    dw $FFFB,$FFF6                                                       ;A78E9D;
    dw Spritemap_KraidFoot_1                                             ;A78EA1;
    dw Hitbox_KraidFoot                                                  ;A78EA3;

ExtendedSpritemap_KraidFoot_19:
    dw $0002,$FFF6,$0028                                                 ;A78EA5;
    dw Spritemap_KraidFoot_4                                             ;A78EAB;
    dw Hitbox_KraidFoot                                                  ;A78EAD;
    dw $FFFD,$FFF6                                                       ;A78EAF;
    dw Spritemap_KraidFoot_1                                             ;A78EB3;
    dw Hitbox_KraidFoot                                                  ;A78EB5;

ExtendedSpritemap_KraidFoot_1A:
    dw $0002,$FFF8,$0028                                                 ;A78EB7;
    dw Spritemap_KraidFoot_4                                             ;A78EBD;
    dw Hitbox_KraidFoot                                                  ;A78EBF;
    dw $FFFF,$FFF6                                                       ;A78EC1;
    dw Spritemap_KraidFoot_1                                             ;A78EC5;
    dw Hitbox_KraidFoot                                                  ;A78EC7;

ExtendedSpritemap_KraidFoot_1B:
    dw $0002,$FFFA,$0028                                                 ;A78EC9;
    dw Spritemap_KraidFoot_4                                             ;A78ECF;
    dw Hitbox_KraidFoot                                                  ;A78ED1;
    dw $0001,$FFF6                                                       ;A78ED3;
    dw Spritemap_KraidFoot_1                                             ;A78ED7;
    dw Hitbox_KraidFoot                                                  ;A78ED9;

ExtendedSpritemap_KraidFoot_1C:
    dw $0002,$FFFC,$0028                                                 ;A78EDB;
    dw Spritemap_KraidFoot_4                                             ;A78EE1;
    dw Hitbox_KraidFoot                                                  ;A78EE3;
    dw $0003,$FFF6                                                       ;A78EE5;
    dw Spritemap_KraidFoot_1                                             ;A78EE9;
    dw Hitbox_KraidFoot                                                  ;A78EEB;

ExtendedSpritemap_KraidFoot_1D:
    dw $0002,$FFFE,$0028                                                 ;A78EED;
    dw Spritemap_KraidFoot_4                                             ;A78EF3;
    dw Hitbox_KraidFoot                                                  ;A78EF5;
    dw $0005,$FFF6                                                       ;A78EF7;
    dw Spritemap_KraidFoot_1                                             ;A78EFB;
    dw Hitbox_KraidFoot                                                  ;A78EFD;

ExtendedSpritemap_KraidFoot_1E:
    dw $0002,$0000,$0028                                                 ;A78EFF;
    dw Spritemap_KraidFoot_4                                             ;A78F05;
    dw Hitbox_KraidFoot                                                  ;A78F07;
    dw $0007,$FFF6                                                       ;A78F09;
    dw Spritemap_KraidFoot_1                                             ;A78F0D;
    dw Hitbox_KraidFoot                                                  ;A78F0F;

ExtendedSpritemap_KraidFoot_1F:
    dw $0002,$0002,$0028                                                 ;A78F11;
    dw Spritemap_KraidFoot_4                                             ;A78F17;
    dw Hitbox_KraidFoot                                                  ;A78F19;
    dw $FFFA,$0000                                                       ;A78F1B;
    dw Spritemap_KraidFoot_0                                             ;A78F1F;
    dw Hitbox_KraidFoot                                                  ;A78F21;

ExtendedSpritemap_KraidFoot_20:
    dw $0002,$0004,$0028                                                 ;A78F23;
    dw Spritemap_KraidFoot_4                                             ;A78F29;
    dw Hitbox_KraidFoot                                                  ;A78F2B;
    dw $FFFC,$0000                                                       ;A78F2D;
    dw Spritemap_KraidFoot_0                                             ;A78F31;
    dw Hitbox_KraidFoot                                                  ;A78F33;

ExtendedSpritemap_KraidFoot_21:
    dw $0002,$0006,$0028                                                 ;A78F35;
    dw Spritemap_KraidFoot_4                                             ;A78F3B;
    dw Hitbox_KraidFoot                                                  ;A78F3D;
    dw $FFFE,$0000                                                       ;A78F3F;
    dw Spritemap_KraidFoot_0                                             ;A78F43;
    dw Hitbox_KraidFoot                                                  ;A78F45;

ExtendedSpritemap_KraidFoot_22:
    dw $0002,$0008,$0028                                                 ;A78F47;
    dw Spritemap_KraidFoot_4                                             ;A78F4D;
    dw Hitbox_KraidFoot                                                  ;A78F4F;
    dw $0000,$0000                                                       ;A78F51;
    dw Spritemap_KraidFoot_0                                             ;A78F55;
    dw Hitbox_KraidFoot                                                  ;A78F57;

ExtendedSpritemap_KraidArm_General_0:
    dw $0005,$FFDC,$FFDF                                                 ;A78F59;
    dw Spritemap_KraidArm_General_0                                      ;A78F5F;
    dw Hitbox_KraidArm_0                                                 ;A78F61;
    dw $FFE4,$FFE8                                                       ;A78F63;
    dw Spritemap_KraidArm_General_A                                      ;A78F67;
    dw Hitbox_KraidArm_F                                                 ;A78F69;
    dw $0000,$0000                                                       ;A78F6B;
    dw Spritemap_KraidArm_General_D                                      ;A78F6F;
    dw Hitbox_KraidArm_12                                                ;A78F71;
    dw $FFDC,$FFD8                                                       ;A78F73;
    dw Spritemap_KraidArm_General_0                                      ;A78F77;
    dw Hitbox_KraidArm_0                                                 ;A78F79;
    dw $FFE4,$FFE1                                                       ;A78F7B;
    dw Spritemap_KraidArm_General_A                                      ;A78F7F;
    dw Hitbox_KraidArm_F                                                 ;A78F81;

ExtendedSpritemap_KraidArm_General_1:
    dw $0005,$FFDA,$FFDF                                                 ;A78F83;
    dw Spritemap_KraidArm_General_1                                      ;A78F89;
    dw Hitbox_KraidArm_1                                                 ;A78F8B;
    dw $FFE2,$FFE6                                                       ;A78F8D;
    dw Spritemap_KraidArm_General_A                                      ;A78F91;
    dw Hitbox_KraidArm_F                                                 ;A78F93;
    dw $0000,$0000                                                       ;A78F95;
    dw Spritemap_KraidArm_General_D                                      ;A78F99;
    dw Hitbox_KraidArm_12                                                ;A78F9B;
    dw $FFDC,$FFD8                                                       ;A78F9D;
    dw Spritemap_KraidArm_General_0                                      ;A78FA1;
    dw Hitbox_KraidArm_0                                                 ;A78FA3;
    dw $FFE4,$FFE1                                                       ;A78FA5;
    dw Spritemap_KraidArm_General_A                                      ;A78FA9;
    dw Hitbox_KraidArm_F                                                 ;A78FAB;

ExtendedSpritemap_KraidArm_General_2:
    dw $0005,$FFD0,$FFF3                                                 ;A78FAD;
    dw Spritemap_KraidArm_General_2                                      ;A78FB3;
    dw Hitbox_KraidArm_2                                                 ;A78FB5;
    dw $FFDA,$FFF3                                                       ;A78FB7;
    dw Spritemap_KraidArm_General_7                                      ;A78FBB;
    dw Hitbox_KraidArm_8                                                 ;A78FBD;
    dw $0000,$0000                                                       ;A78FBF;
    dw Spritemap_KraidArm_General_C                                      ;A78FC3;
    dw Hitbox_KraidArm_11                                                ;A78FC5;
    dw $FFD3,$FFE5                                                       ;A78FC7;
    dw Spritemap_KraidArm_General_1                                      ;A78FCB;
    dw Hitbox_KraidArm_1                                                 ;A78FCD;
    dw $FFDB,$FFED                                                       ;A78FCF;
    dw Spritemap_KraidArm_General_A                                      ;A78FD3;
    dw Hitbox_KraidArm_F                                                 ;A78FD5;

ExtendedSpritemap_KraidArm_General_3:
    dw $0005,$FFD2,$FFF3                                                 ;A78FD7;
    dw Spritemap_KraidArm_General_3                                      ;A78FDD;
    dw Hitbox_KraidArm_3                                                 ;A78FDF;
    dw $FFDB,$FFF3                                                       ;A78FE1;
    dw Spritemap_KraidArm_General_7                                      ;A78FE5;
    dw Hitbox_KraidArm_8                                                 ;A78FE7;
    dw $0000,$0000                                                       ;A78FE9;
    dw Spritemap_KraidArm_General_C                                      ;A78FED;
    dw Hitbox_KraidArm_11                                                ;A78FEF;
    dw $FFD3,$FFED                                                       ;A78FF1;
    dw Spritemap_KraidArm_General_2                                      ;A78FF5;
    dw Hitbox_KraidArm_2                                                 ;A78FF7;
    dw $FFDC,$FFEE                                                       ;A78FF9;
    dw Spritemap_KraidArm_General_7                                      ;A78FFD;
    dw Hitbox_KraidArm_8                                                 ;A78FFF;

ExtendedSpritemap_KraidArm_General_4:
    dw $0005,$FFD3,$0008                                                 ;A79001;
    dw Spritemap_KraidArm_General_4                                      ;A79007;
    dw Hitbox_KraidArm_4                                                 ;A79009;
    dw $FFDA,$0002                                                       ;A7900B;
    dw Spritemap_KraidArm_General_8                                      ;A7900F;
    dw Hitbox_KraidArm_9                                                 ;A79011;
    dw $0000,$0000                                                       ;A79013;
    dw Spritemap_KraidArm_General_B                                      ;A79017;
    dw Hitbox_KraidArm_10                                                ;A79019;
    dw $FFD2,$0003                                                       ;A7901B;
    dw Spritemap_KraidArm_General_3                                      ;A7901F;
    dw Hitbox_KraidArm_3                                                 ;A79021;
    dw $FFD9,$FFFD                                                       ;A79023;
    dw Spritemap_KraidArm_General_8                                      ;A79027;
    dw Hitbox_KraidArm_9                                                 ;A79029;

ExtendedSpritemap_KraidArm_General_5:
    dw $0005,$FFD4,$0008                                                 ;A7902B;
    dw Spritemap_KraidArm_General_4                                      ;A79031;
    dw Hitbox_KraidArm_4                                                 ;A79033;
    dw $FFDB,$0002                                                       ;A79035;
    dw Spritemap_KraidArm_General_8                                      ;A79039;
    dw Hitbox_KraidArm_9                                                 ;A7903B;
    dw $0000,$0000                                                       ;A7903D;
    dw Spritemap_KraidArm_General_B                                      ;A79041;
    dw Hitbox_KraidArm_10                                                ;A79043;
    dw $FFD2,$0004                                                       ;A79045;
    dw Spritemap_KraidArm_General_4                                      ;A79049;
    dw Hitbox_KraidArm_4                                                 ;A7904B;
    dw $FFD9,$FFFE                                                       ;A7904D;
    dw Spritemap_KraidArm_General_8                                      ;A79051;
    dw Hitbox_KraidArm_9                                                 ;A79053;

ExtendedSpritemap_KraidArm_General_6:
    dw $0005,$FFD9,$000A                                                 ;A79055;
    dw Spritemap_KraidArm_General_5                                      ;A7905B;
    dw Hitbox_KraidArm_5                                                 ;A7905D;
    dw $FFDA,$0000                                                       ;A7905F;
    dw Spritemap_KraidArm_General_9                                      ;A79063;
    dw Hitbox_KraidArm_A                                                 ;A79065;
    dw $0000,$0000                                                       ;A79067;
    dw Spritemap_KraidArm_General_B                                      ;A7906B;
    dw Hitbox_KraidArm_10                                                ;A7906D;
    dw $FFD5,$000A                                                       ;A7906F;
    dw Spritemap_KraidArm_General_5                                      ;A79073;
    dw Hitbox_KraidArm_5                                                 ;A79075;
    dw $FFD7,$FFFE                                                       ;A79077;
    dw Spritemap_KraidArm_General_9                                      ;A7907B;
    dw Hitbox_KraidArm_A                                                 ;A7907D;

ExtendedSpritemap_KraidArm_General_7:
    dw $0005,$FFD9,$000A                                                 ;A7907F;
    dw Spritemap_KraidArm_General_5                                      ;A79085;
    dw Hitbox_KraidArm_5                                                 ;A79087;
    dw $FFDA,$0000                                                       ;A79089;
    dw Spritemap_KraidArm_General_9                                      ;A7908D;
    dw Hitbox_KraidArm_A                                                 ;A7908F;
    dw $0000,$0000                                                       ;A79091;
    dw Spritemap_KraidArm_General_B                                      ;A79095;
    dw Hitbox_KraidArm_10                                                ;A79097;
    dw $FFD5,$0009                                                       ;A79099;
    dw Spritemap_KraidArm_General_5                                      ;A7909D;
    dw Hitbox_KraidArm_5                                                 ;A7909F;
    dw $FFD7,$FFFE                                                       ;A790A1;
    dw Spritemap_KraidArm_General_9                                      ;A790A5;
    dw Hitbox_KraidArm_A                                                 ;A790A7;

ExtendedSpritemap_KraidArm_General_8:
    dw $0005,$FFD9,$000A                                                 ;A790A9;
    dw Spritemap_KraidArm_General_6                                      ;A790AF;
    dw Hitbox_KraidArm_6                                                 ;A790B1;
    dw $FFDA,$0000                                                       ;A790B3;
    dw Spritemap_KraidArm_General_9                                      ;A790B7;
    dw Hitbox_KraidArm_A                                                 ;A790B9;
    dw $0000,$0000                                                       ;A790BB;
    dw Spritemap_KraidArm_General_B                                      ;A790BF;
    dw Hitbox_KraidArm_10                                                ;A790C1;
    dw $FFD5,$0009                                                       ;A790C3;
    dw Spritemap_KraidArm_General_5                                      ;A790C7;
    dw Hitbox_KraidArm_5                                                 ;A790C9;
    dw $FFD7,$FFFE                                                       ;A790CB;
    dw Spritemap_KraidArm_General_9                                      ;A790CF;
    dw Hitbox_KraidArm_A                                                 ;A790D1;

ExtendedSpritemap_KraidArm_General_9:
    dw $0005,$FFD9,$000A                                                 ;A790D3;
    dw Spritemap_KraidArm_General_6                                      ;A790D9;
    dw Hitbox_KraidArm_6                                                 ;A790DB;
    dw $FFDA,$0000                                                       ;A790DD;
    dw Spritemap_KraidArm_General_9                                      ;A790E1;
    dw Hitbox_KraidArm_A                                                 ;A790E3;
    dw $0000,$0000                                                       ;A790E5;
    dw Spritemap_KraidArm_General_B                                      ;A790E9;
    dw Hitbox_KraidArm_10                                                ;A790EB;
    dw $FFD6,$0009                                                       ;A790ED;
    dw Spritemap_KraidArm_General_6                                      ;A790F1;
    dw Hitbox_KraidArm_6                                                 ;A790F3;
    dw $FFD6,$FFFE                                                       ;A790F5;
    dw Spritemap_KraidArm_General_9                                      ;A790F9;
    dw Hitbox_KraidArm_A                                                 ;A790FB;

ExtendedSpritemap_KraidArm_RisingSinking_0:
    dw $0005,$FFDC,$FFDF                                                 ;A790FD;
    dw Spritemap_KraidArm_RisingSinking_0                                ;A79103;
    dw Hitbox_KraidArm_0                                                 ;A79105;
    dw $FFE4,$FFE8                                                       ;A79107;
    dw Spritemap_KraidArm_RisingSinking_A                                ;A7910B;
    dw Hitbox_KraidArm_F                                                 ;A7910D;
    dw $0000,$0000                                                       ;A7910F;
    dw Spritemap_KraidArm_RisingSinking_D                                ;A79113;
    dw Hitbox_KraidArm_12                                                ;A79115;
    dw $FFDC,$FFD8                                                       ;A79117;
    dw Spritemap_KraidArm_RisingSinking_0                                ;A7911B;
    dw Hitbox_KraidArm_0                                                 ;A7911D;
    dw $FFE4,$FFE1                                                       ;A7911F;
    dw Spritemap_KraidArm_RisingSinking_A                                ;A79123;
    dw Hitbox_KraidArm_F                                                 ;A79125;

ExtendedSpritemap_KraidArm_RisingSinking_1:
    dw $0005,$FFDA,$FFDF                                                 ;A79127;
    dw Spritemap_KraidArm_RisingSinking_1                                ;A7912D;
    dw Hitbox_KraidArm_1                                                 ;A7912F;
    dw $FFE2,$FFE6                                                       ;A79131;
    dw Spritemap_KraidArm_RisingSinking_A                                ;A79135;
    dw Hitbox_KraidArm_F                                                 ;A79137;
    dw $0000,$0000                                                       ;A79139;
    dw Spritemap_KraidArm_RisingSinking_D                                ;A7913D;
    dw Hitbox_KraidArm_12                                                ;A7913F;
    dw $FFDC,$FFD8                                                       ;A79141;
    dw Spritemap_KraidArm_RisingSinking_0                                ;A79145;
    dw Hitbox_KraidArm_0                                                 ;A79147;
    dw $FFE4,$FFE1                                                       ;A79149;
    dw Spritemap_KraidArm_RisingSinking_A                                ;A7914D;
    dw Hitbox_KraidArm_F                                                 ;A7914F;

ExtendedSpritemap_KraidArm_RisingSinking_2:
    dw $0005,$FFD0,$FFF3                                                 ;A79151;
    dw Spritemap_KraidArm_RisingSinking_2                                ;A79157;
    dw Hitbox_KraidArm_2                                                 ;A79159;
    dw $FFDA,$FFF3                                                       ;A7915B;
    dw Spritemap_KraidArm_RisingSinking_7                                ;A7915F;
    dw Hitbox_KraidArm_8                                                 ;A79161;
    dw $0000,$0000                                                       ;A79163;
    dw Spritemap_KraidArm_RisingSinking_C                                ;A79167;
    dw Hitbox_KraidArm_11                                                ;A79169;
    dw $FFD3,$FFE5                                                       ;A7916B;
    dw Spritemap_KraidArm_RisingSinking_1                                ;A7916F;
    dw Hitbox_KraidArm_1                                                 ;A79171;
    dw $FFDB,$FFED                                                       ;A79173;
    dw Spritemap_KraidArm_RisingSinking_A                                ;A79177;
    dw Hitbox_KraidArm_F                                                 ;A79179;

ExtendedSpritemap_KraidArm_RisingSinking_3:
    dw $0005,$FFD2,$FFF3                                                 ;A7917B;
    dw Spritemap_KraidArm_RisingSinking_3                                ;A79181;
    dw Hitbox_KraidArm_3                                                 ;A79183;
    dw $FFDB,$FFF3                                                       ;A79185;
    dw Spritemap_KraidArm_RisingSinking_7                                ;A79189;
    dw Hitbox_KraidArm_8                                                 ;A7918B;
    dw $0000,$0000                                                       ;A7918D;
    dw Spritemap_KraidArm_RisingSinking_C                                ;A79191;
    dw Hitbox_KraidArm_11                                                ;A79193;
    dw $FFD3,$FFED                                                       ;A79195;
    dw Spritemap_KraidArm_RisingSinking_2                                ;A79199;
    dw Hitbox_KraidArm_2                                                 ;A7919B;
    dw $FFDC,$FFEE                                                       ;A7919D;
    dw Spritemap_KraidArm_RisingSinking_7                                ;A791A1;
    dw Hitbox_KraidArm_8                                                 ;A791A3;

ExtendedSpritemap_KraidArm_RisingSinking_4:
    dw $0005,$FFD3,$0008                                                 ;A791A5;
    dw Spritemap_KraidArm_RisingSinking_4                                ;A791AB;
    dw Hitbox_KraidArm_4                                                 ;A791AD;
    dw $FFDA,$0002                                                       ;A791AF;
    dw Spritemap_KraidArm_RisingSinking_8                                ;A791B3;
    dw Hitbox_KraidArm_9                                                 ;A791B5;
    dw $0000,$0000                                                       ;A791B7;
    dw Spritemap_KraidArm_RisingSinking_B                                ;A791BB;
    dw Hitbox_KraidArm_10                                                ;A791BD;
    dw $FFD2,$0003                                                       ;A791BF;
    dw Spritemap_KraidArm_RisingSinking_3                                ;A791C3;
    dw Hitbox_KraidArm_3                                                 ;A791C5;
    dw $FFD9,$FFFD                                                       ;A791C7;
    dw Spritemap_KraidArm_RisingSinking_8                                ;A791CB;
    dw Hitbox_KraidArm_9                                                 ;A791CD;

ExtendedSpritemap_KraidArm_RisingSinking_5:
    dw $0005,$FFD4,$0008                                                 ;A791CF;
    dw Spritemap_KraidArm_RisingSinking_4                                ;A791D5;
    dw Hitbox_KraidArm_4                                                 ;A791D7;
    dw $FFDB,$0002                                                       ;A791D9;
    dw Spritemap_KraidArm_RisingSinking_8                                ;A791DD;
    dw Hitbox_KraidArm_9                                                 ;A791DF;
    dw $0000,$0000                                                       ;A791E1;
    dw Spritemap_KraidArm_RisingSinking_B                                ;A791E5;
    dw Hitbox_KraidArm_10                                                ;A791E7;
    dw $FFD2,$0004                                                       ;A791E9;
    dw Spritemap_KraidArm_RisingSinking_4                                ;A791ED;
    dw Hitbox_KraidArm_4                                                 ;A791EF;
    dw $FFD9,$FFFE                                                       ;A791F1;
    dw Spritemap_KraidArm_RisingSinking_8                                ;A791F5;
    dw Hitbox_KraidArm_9                                                 ;A791F7;

ExtendedSpritemap_KraidArm_RisingSinking_6:
    dw $0005,$FFD9,$000A                                                 ;A791F9;
    dw Spritemap_KraidArm_RisingSinking_5                                ;A791FF;
    dw Hitbox_KraidArm_5                                                 ;A79201;
    dw $FFDA,$0000                                                       ;A79203;
    dw Spritemap_KraidArm_RisingSinking_9                                ;A79207;
    dw Hitbox_KraidArm_A                                                 ;A79209;
    dw $0000,$0000                                                       ;A7920B;
    dw Spritemap_KraidArm_RisingSinking_B                                ;A7920F;
    dw Hitbox_KraidArm_10                                                ;A79211;
    dw $FFD5,$000A                                                       ;A79213;
    dw Spritemap_KraidArm_RisingSinking_5                                ;A79217;
    dw Hitbox_KraidArm_5                                                 ;A79219;
    dw $FFD7,$FFFE                                                       ;A7921B;
    dw Spritemap_KraidArm_RisingSinking_9                                ;A7921F;
    dw Hitbox_KraidArm_A                                                 ;A79221;

ExtendedSpritemap_KraidArm_RisingSinking_7:
    dw $0005,$FFD9,$000A                                                 ;A79223;
    dw Spritemap_KraidArm_RisingSinking_5                                ;A79229;
    dw Hitbox_KraidArm_5                                                 ;A7922B;
    dw $FFDA,$0000                                                       ;A7922D;
    dw Spritemap_KraidArm_RisingSinking_9                                ;A79231;
    dw Hitbox_KraidArm_A                                                 ;A79233;
    dw $0000,$0000                                                       ;A79235;
    dw Spritemap_KraidArm_RisingSinking_B                                ;A79239;
    dw Hitbox_KraidArm_10                                                ;A7923B;
    dw $FFD5,$0009                                                       ;A7923D;
    dw Spritemap_KraidArm_RisingSinking_5                                ;A79241;
    dw Hitbox_KraidArm_5                                                 ;A79243;
    dw $FFD7,$FFFE                                                       ;A79245;
    dw Spritemap_KraidArm_RisingSinking_9                                ;A79249;
    dw Hitbox_KraidArm_A                                                 ;A7924B;

ExtendedSpritemap_KraidArm_RisingSinking_8:
    dw $0005,$FFD9,$000A                                                 ;A7924D;
    dw Spritemap_KraidArm_RisingSinking_6                                ;A79253;
    dw Hitbox_KraidArm_6                                                 ;A79255;
    dw $FFDA,$0000                                                       ;A79257;
    dw Spritemap_KraidArm_RisingSinking_9                                ;A7925B;
    dw Hitbox_KraidArm_A                                                 ;A7925D;
    dw $0000,$0000                                                       ;A7925F;
    dw Spritemap_KraidArm_RisingSinking_B                                ;A79263;
    dw Hitbox_KraidArm_10                                                ;A79265;
    dw $FFD5,$0009                                                       ;A79267;
    dw Spritemap_KraidArm_RisingSinking_5                                ;A7926B;
    dw Hitbox_KraidArm_5                                                 ;A7926D;
    dw $FFD7,$FFFE                                                       ;A7926F;
    dw Spritemap_KraidArm_RisingSinking_9                                ;A79273;
    dw Hitbox_KraidArm_A                                                 ;A79275;

ExtendedSpritemap_KraidArm_RisingSinking_9:
    dw $0005,$FFD9,$000A                                                 ;A79277;
    dw Spritemap_KraidArm_RisingSinking_6                                ;A7927D;
    dw Hitbox_KraidArm_6                                                 ;A7927F;
    dw $FFDA,$0000                                                       ;A79281;
    dw Spritemap_KraidArm_RisingSinking_9                                ;A79285;
    dw Hitbox_KraidArm_A                                                 ;A79287;
    dw $0000,$0000                                                       ;A79289;
    dw Spritemap_KraidArm_RisingSinking_B                                ;A7928D;
    dw Hitbox_KraidArm_10                                                ;A7928F;
    dw $FFD6,$0009                                                       ;A79291;
    dw Spritemap_KraidArm_RisingSinking_6                                ;A79295;
    dw Hitbox_KraidArm_6                                                 ;A79297;
    dw $FFD6,$FFFE                                                       ;A79299;
    dw Spritemap_KraidArm_RisingSinking_9                                ;A7929D;
    dw Hitbox_KraidArm_A                                                 ;A7929F;

ExtendedSpritemap_KraidArm_Dying_PreparingToLungeForward_0:
    dw $0001,$0000,$0000                                                 ;A792A1;
    dw Spritemap_KraidArm_Dying_PreparingToLunge_0                       ;A792A7;
    dw Hitbox_KraidArm_Dying_PreparingToLungeForward_0                   ;A792A9;

ExtendedSpritemap_KraidArm_Dying_PreparingToLungeForward_1:
    dw $0001,$0000,$0000                                                 ;A792AB;
    dw Spritemap_KraidArm_Dying_PreparingToLunge_1                       ;A792B1;
    dw Hitbox_KraidArm_Dying_PreparingToLungeForward_1                   ;A792B3;

Hitbox_KraidLint:
    dw $0001                                                             ;A792B5;
    dw $FFE8,$FFFC,$0004,$0006                                           ;A792B7;
    dw EnemyTouch_KraidArm_KraidFoot_Normal                              ;A792BF;
    dw RTL_A794B5                                                        ;A792C1;

UNUSED_Hitbox_KraidFoot:
    dw $0001,$FFF8,$FFF8,$0007,$0007                                     ;A792C3;
    dw EnemyTouch_KraidArm_KraidFoot_Normal                              ;A792CD;
    dw RTL_A794B5                                                        ;A792CF;

Hitbox_KraidArm_0:
    dw $0002,$FFF3,$FFF5,$FFFD,$FFFB                                     ;A792D1;
    dw EnemyTouch_KraidArm                                               ;A792DB;
    dw EnemyShot_KraidArm                                                ;A792DD;
    dw $FFF7,$FFFB,$0001,$0002                                           ;A792DF;
    dw EnemyTouch_KraidArm                                               ;A792E7;
    dw EnemyShot_KraidArm                                                ;A792E9;

Hitbox_KraidArm_1:
    dw $0001,$FFF0,$FFFB,$0001,$0002                                     ;A792EB;
    dw EnemyTouch_KraidArm                                               ;A792F5;
    dw EnemyShot_KraidArm                                                ;A792F7;

Hitbox_KraidArm_2:
    dw $0002,$FFF7,$FFFE,$0001,$0007                                     ;A792F9;
    dw EnemyTouch_KraidArm                                               ;A79303;
    dw EnemyShot_KraidArm                                                ;A79305;
    dw $FFF4,$0003,$FFFA,$000C                                           ;A79307;
    dw EnemyTouch_KraidArm                                               ;A7930F;
    dw EnemyShot_KraidArm                                                ;A79311;

Hitbox_KraidArm_3:
    dw $0001,$FFFA,$FFFF,$0001,$000E                                     ;A79313;
    dw EnemyTouch_KraidArm                                               ;A7931D;
    dw EnemyShot_KraidArm                                                ;A7931F;

Hitbox_KraidArm_4:
    dw $0002,$FFFD,$FFFE,$0006,$0009                                     ;A79321;
    dw EnemyTouch_KraidArm                                               ;A7932B;
    dw EnemyShot_KraidArm                                                ;A7932D;
    dw $0002,$0007,$000B,$000B                                           ;A7932F;
    dw EnemyTouch_KraidArm                                               ;A79337;
    dw EnemyShot_KraidArm                                                ;A79339;

Hitbox_KraidArm_5:
    dw $0001,$FFFF,$FFFC,$000E,$0004                                     ;A7933B;
    dw EnemyTouch_KraidArm                                               ;A79345;
    dw EnemyShot_KraidArm                                                ;A79347;

Hitbox_KraidArm_6:
    dw $0002,$FFFD,$FFF9,$0006,$0002                                     ;A79349;
    dw EnemyTouch_KraidArm                                               ;A79353;
    dw EnemyShot_KraidArm                                                ;A79355;
    dw $0004,$FFF4,$000A,$FFFF                                           ;A79357;
    dw EnemyTouch_KraidArm                                               ;A7935F;
    dw EnemyShot_KraidArm                                                ;A79361;

Hitbox_KraidArm_7:
    dw $0001,$FFFC,$FFF2,$0003,$0001                                     ;A79363;
    dw EnemyTouch_KraidArm_KraidFoot_Normal                              ;A7936D;
    dw EnemyShot_KraidArm                                                ;A7936F;

Hitbox_KraidArm_8:
    dw $0001,$FFF1,$FFFB,$0002,$0004                                     ;A79371;
    dw EnemyTouch_KraidArm                                               ;A7937B;
    dw EnemyShot_KraidArm                                                ;A7937D;

Hitbox_KraidArm_9:
    dw $0002,$FFF5,$0002,$FFFC,$000A                                     ;A7937F;
    dw EnemyTouch_KraidArm                                               ;A79389;
    dw EnemyShot_KraidArm                                                ;A7938B;
    dw $FFFA,$FFFD,$0003,$0005                                           ;A7938D;
    dw EnemyTouch_KraidArm                                               ;A79395;
    dw EnemyShot_KraidArm                                                ;A79397;

Hitbox_KraidArm_A:
    dw $0001,$FFFC,$FFFE,$0003,$000D                                     ;A79399;
    dw EnemyTouch_KraidArm                                               ;A793A3;
    dw EnemyShot_KraidArm                                                ;A793A5;

Hitbox_KraidArm_B:
    dw $0002,$0003,$0002,$000A,$000B                                     ;A793A7;
    dw EnemyTouch_KraidArm_KraidFoot_Normal                              ;A793B1;
    dw EnemyShot_KraidArm                                                ;A793B3;
    dw $FFFD,$FFFD,$0005,$0005                                           ;A793B5;
    dw EnemyTouch_KraidArm_KraidFoot_Normal                              ;A793BD;
    dw EnemyShot_KraidArm                                                ;A793BF;

Hitbox_KraidArm_C:
    dw $0001,$FFFD,$FFFB,$000E,$0004                                     ;A793C1;
    dw EnemyTouch_KraidArm_KraidFoot_Normal                              ;A793CB;
    dw EnemyShot_KraidArm                                                ;A793CD;

Hitbox_KraidArm_D:
    dw $0002,$0002,$FFF4,$000B,$FFFC                                     ;A793CF;
    dw EnemyTouch_KraidArm_KraidFoot_Normal                              ;A793D9;
    dw EnemyShot_KraidArm                                                ;A793DB;
    dw $FFFD,$FFF9,$0004,$0002                                           ;A793DD;
    dw EnemyTouch_KraidArm_KraidFoot_Normal                              ;A793E5;
    dw EnemyShot_KraidArm                                                ;A793E7;

Hitbox_KraidArm_E:
    dw $0001,$FFFC,$FFF1,$0005,$0002                                     ;A793E9;
    dw EnemyTouch_KraidArm_KraidFoot_Normal                              ;A793F3;
    dw EnemyShot_KraidArm                                                ;A793F5;

Hitbox_KraidArm_F:
    dw $0002,$FFF4,$FFF4,$FFFD,$FFFD                                     ;A793F7;
    dw EnemyTouch_KraidArm                                               ;A79401;
    dw EnemyShot_KraidArm                                                ;A79403;
    dw $FFFA,$FFFA,$0003,$0002                                           ;A79405;
    dw EnemyTouch_KraidArm                                               ;A7940D;
    dw EnemyShot_KraidArm                                                ;A7940F;

Hitbox_KraidArm_10:
    dw $0001,$FFD3,$FFF7,$0004,$0008                                     ;A79411;
    dw EnemyTouch_KraidArm_KraidFoot_Normal                              ;A7941B;
    dw EnemyShot_KraidArm                                                ;A7941D;

Hitbox_KraidArm_11:
    dw $0002,$FFE4,$FFEF,$FFF4,$0000                                     ;A7941F;
    dw EnemyTouch_KraidArm_KraidFoot_Normal                              ;A79429;
    dw EnemyShot_KraidArm                                                ;A7942B;
    dw $FFD6,$FFE9,$FFE4,$FFFA                                           ;A7942D;
    dw EnemyTouch_KraidArm_KraidFoot_Normal                              ;A79435;
    dw EnemyShot_KraidArm                                                ;A79437;

Hitbox_KraidArm_12:
    dw $0002,$FFEA,$FFE7,$FFF8,$FFFB                                     ;A79439;
    dw EnemyTouch_KraidArm_KraidFoot_Normal                              ;A79443;
    dw EnemyShot_KraidArm                                                ;A79445;
    dw $FFDD,$FFDD,$FFED,$FFEF                                           ;A79447;
    dw EnemyTouch_KraidArm_KraidFoot_Normal                              ;A7944F;
    dw EnemyShot_KraidArm                                                ;A79451;

Hitbox_KraidFoot:
    dw $0001,$FFFA,$FFFA,$0006,$0006                                     ;A79453;
    dw EnemyTouch_KraidArm_KraidFoot_Normal                              ;A7945D;
    dw RTL_A794B5                                                        ;A7945F;

UNUSED_Hitbox_KraidFoot_A79461:
    dw $0001,$FFFE,$FFFD,$0002,$0003                                     ;A79461;
    dw EnemyTouch_KraidArm_KraidFoot_Normal                              ;A7946B;
    dw RTL_A794B5                                                        ;A7946D;

Hitbox_KraidArm_Dying_PreparingToLungeForward_0:
    dw $0001,$FFC0,$FFD0,$FFE0,$FFF0                                     ;A7946F;
    dw EnemyTouch_KraidArm_KraidFoot_Normal                              ;A79479;
    dw EnemyShot_KraidArm                                                ;A7947B;

Hitbox_KraidArm_Dying_PreparingToLungeForward_1:
    dw $0001,$FFC0,$FFFC,$0000,$0004                                     ;A7947D;
    dw EnemyTouch_KraidArm_KraidFoot_Normal                              ;A79487;
    dw EnemyShot_KraidArm                                                ;A79489;

EnemyTouch_KraidArm_KraidFoot_Normal:
    JSL.L NormalEnemyTouchAI                                             ;A7948B; fallthrough to RTL_A7948F

RTL_A7948F:
    RTL                                                                  ;A7948F;


EnemyTouch_KraidArm:
    LDA.W $18A8                                                          ;A79490;
    BEQ .SamusInvincible                                                 ;A79493;
    RTL                                                                  ;A79495;


.SamusInvincible:
    JSR.W PushSamusBack                                                  ;A79496;
    LDA.W #Function_KraidLint_FireLint                                   ;A79499;
    STA.W $10A8                                                          ;A7949C;

EnemyTouch_Kraid:
    JSL.L NormalEnemyTouchAI_NoDeathCheck_External                       ;A7949F;
    RTL                                                                  ;A794A3;


PushSamusBack:
    LDA.W #$0004                                                         ;A794A4;
    STA.W $0B58                                                          ;A794A7;
    LDA.W #$FFF8                                                         ;A794AA;
    STA.W $0B5C                                                          ;A794AD;
    RTS                                                                  ;A794B0;


NormalEnemyShot:
    JSL.L NormalEnemyShotAI                                              ;A794B1; fallthrough to RTL_A794B5

RTL_A794B5:
    RTL                                                                  ;A794B5;


EnemyShot_KraidArm:
    TYX                                                                  ;A794B6;
    JSR.W SpawnExplosionProjectile                                       ;A794B7;
    LDA.W $0C04,Y                                                        ;A794BA;
    ORA.W #$0010                                                         ;A794BD;
    STA.W $0C04,Y                                                        ;A794C0;
    RTL                                                                  ;A794C3;


UNUSED_Spritemap_KraidLint_A794C4:
    dw $0004,$0000                                                       ;A794C4;
    db $08                                                               ;A794C8;
    dw $21C2,$81F0                                                       ;A794C9;
    db $00                                                               ;A794CD;
    dw $21B0,$8000                                                       ;A794CE;
    db $F8                                                               ;A794D2;
    dw $21A2,$81F0                                                       ;A794D3;
    db $F8                                                               ;A794D7;
    dw $21A0                                                             ;A794D8;

UNUSED_Spritemap_KraidFoot_A794DA:
    dw $0001,$81F8                                                       ;A794DA;
    db $F8                                                               ;A794DE;
    dw $21A9                                                             ;A794DF;

Spritemap_KraidArm_General_0:
    dw $0001,$81F2                                                       ;A794E1;
    db $F4                                                               ;A794E5;
    dw $3126                                                             ;A794E6;

Spritemap_KraidArm_General_1:
    dw $0002,$01F9                                                       ;A794E8;
    db $FB                                                               ;A794EC;
    dw $3129,$01F1                                                       ;A794ED;
    db $FB                                                               ;A794F1;
    dw $3128                                                             ;A794F2;

Spritemap_KraidArm_General_2:
    dw $0001,$81F2                                                       ;A794F4;
    db $FD                                                               ;A794F8;
    dw $312A                                                             ;A794F9;

Spritemap_KraidArm_General_3:
    dw $0002,$01FA                                                       ;A794FB;
    db $07                                                               ;A794FF;
    dw $3139,$01FA                                                       ;A79500;
    db $FF                                                               ;A79504;
    dw $3138                                                             ;A79505;

Spritemap_KraidArm_General_4:
    dw $0001,$81FD                                                       ;A79507;
    db $FD                                                               ;A7950B;
    dw $F126                                                             ;A7950C;

Spritemap_KraidArm_General_5:
    dw $0002,$01FF                                                       ;A7950E;
    db $FD                                                               ;A79512;
    dw $F129,$0007                                                       ;A79513;
    db $FD                                                               ;A79517;
    dw $F128                                                             ;A79518;

Spritemap_KraidArm_General_6:
    dw $0001,$81FD                                                       ;A7951A;
    db $F4                                                               ;A7951E;
    dw $F12A                                                             ;A7951F;

UNUSED_Spritemap_KraidArm_General_A79521:
    dw $0002,$01FC                                                       ;A79521;
    db $F2                                                               ;A79525;
    dw $F139,$01FC                                                       ;A79526;
    db $FA                                                               ;A7952A;
    dw $F138                                                             ;A7952B;

Spritemap_KraidArm_General_7:
    dw $0002,$01FA                                                       ;A7952D;
    db $FC                                                               ;A79531;
    dw $F12E,$01F2                                                       ;A79532;
    db $FC                                                               ;A79536;
    dw $B12E                                                             ;A79537;

Spritemap_KraidArm_General_8:
    dw $0001,$81F4                                                       ;A79539;
    db $FC                                                               ;A7953D;
    dw $B12C                                                             ;A7953E;

Spritemap_KraidArm_General_9:
    dw $0002,$01FC                                                       ;A79540;
    db $06                                                               ;A79544;
    dw $B13E,$01FC                                                       ;A79545;
    db $FE                                                               ;A79549;
    dw $313E                                                             ;A7954A;

UNUSED_Spritemap_KraidArm_General_A7954C:
    dw $0001,$81FC                                                       ;A7954C;
    db $FC                                                               ;A79550;
    dw $312C                                                             ;A79551;

UNUSED_Spritemap_KraidArm_General_A79553:
    dw $0002,$0006                                                       ;A79553;
    db $FC                                                               ;A79557;
    dw $712E,$01FE                                                       ;A79558;
    db $FC                                                               ;A7955C;
    dw $312E                                                             ;A7955D;

UNUSED_Spritemap_KraidArm_General_A7955F:
    dw $0001,$81FC                                                       ;A7955F;
    db $F4                                                               ;A79563;
    dw $712C                                                             ;A79564;

UNUSED_Spritemap_KraidArm_General_A79566:
    dw $0002,$01FD                                                       ;A79566;
    db $FA                                                               ;A7956A;
    dw $F13E,$01FD                                                       ;A7956B;
    db $F2                                                               ;A7956F;
    dw $713E                                                             ;A79570;

Spritemap_KraidArm_General_A:
    dw $0001,$81F4                                                       ;A79572;
    db $F4                                                               ;A79576;
    dw $312C                                                             ;A79577;

Spritemap_KraidArm_General_B:
    dw $0003,$81F4                                                       ;A79579;
    db $F8                                                               ;A7957D;
    dw $3104,$81E4                                                       ;A7957E;
    db $F8                                                               ;A79582;
    dw $3102,$81D4                                                       ;A79583;
    db $F8                                                               ;A79587;
    dw $3100                                                             ;A79588;

Spritemap_KraidArm_General_C:
    dw $0008,$01EC                                                       ;A7958A;
    db $00                                                               ;A7958E;
    dw $311C,$01FC                                                       ;A7958F;
    db $F0                                                               ;A79593;
    dw $310F,$01F4                                                       ;A79594;
    db $F0                                                               ;A79598;
    dw $310E,$01E4                                                       ;A79599;
    db $E8                                                               ;A7959D;
    dw $310D,$01DC                                                       ;A7959E;
    db $F8                                                               ;A795A2;
    dw $310C,$81F4                                                       ;A795A3;
    db $F8                                                               ;A795A7;
    dw $310A,$81E4                                                       ;A795A8;
    db $F0                                                               ;A795AC;
    dw $3108,$81D4                                                       ;A795AD;
    db $E8                                                               ;A795B1;
    dw $3106                                                             ;A795B2;

Spritemap_KraidArm_General_D:
    dw $0008,$01FC                                                       ;A795B4;
    db $ED                                                               ;A795B8;
    dw $313F,$01EC                                                       ;A795B9;
    db $FD                                                               ;A795BD;
    dw $312F,$01EC                                                       ;A795BE;
    db $F5                                                               ;A795C2;
    dw $311F,$01EC                                                       ;A795C3;
    db $DD                                                               ;A795C7;
    dw $311E,$01E4                                                       ;A795C8;
    db $ED                                                               ;A795CC;
    dw $311D,$81F4                                                       ;A795CD;
    db $F5                                                               ;A795D1;
    dw $3124,$81EC                                                       ;A795D2;
    db $E5                                                               ;A795D6;
    dw $3122,$81DC                                                       ;A795D7;
    db $DD                                                               ;A795DB;
    dw $3120                                                             ;A795DC;

Spritemap_KraidFoot_0:
    dw $0008,$8020                                                       ;A795DE;
    db $1C                                                               ;A795E2;
    dw $315A,$8020                                                       ;A795E3;
    db $14                                                               ;A795E7;
    dw $314A,$8010                                                       ;A795E8;
    db $1C                                                               ;A795EC;
    dw $3148,$01F8                                                       ;A795ED;
    db $0C                                                               ;A795F1;
    dw $314C,$8010                                                       ;A795F2;
    db $0C                                                               ;A795F6;
    dw $3146,$8000                                                       ;A795F7;
    db $0C                                                               ;A795FB;
    dw $3144,$8008                                                       ;A795FC;
    db $FC                                                               ;A79600;
    dw $3142,$81F8                                                       ;A79601;
    db $FC                                                               ;A79605;
    dw $3140                                                             ;A79606;

Spritemap_KraidFoot_1:
    dw $0008,$8012                                                       ;A79608;
    db $28                                                               ;A7960C;
    dw $3168,$800A                                                       ;A7960D;
    db $28                                                               ;A79611;
    dw $3167,$8010                                                       ;A79612;
    db $18                                                               ;A79616;
    dw $3182,$8000                                                       ;A79617;
    db $18                                                               ;A7961B;
    dw $3180,$8008                                                       ;A7961C;
    db $08                                                               ;A79620;
    dw $3165,$81F8                                                       ;A79621;
    db $08                                                               ;A79625;
    dw $3163,$8000                                                       ;A79626;
    db $F8                                                               ;A7962A;
    dw $3161,$81F8                                                       ;A7962B;
    db $F8                                                               ;A7962F;
    dw $3160                                                             ;A79630;

Spritemap_KraidFoot_2:
    dw $0008,$81F9                                                       ;A79632;
    db $2C                                                               ;A79636;
    dw $31AD,$81F8                                                       ;A79637;
    db $1C                                                               ;A7963B;
    dw $318D,$81F8                                                       ;A7963C;
    db $0C                                                               ;A79640;
    dw $316D,$81F8                                                       ;A79641;
    db $FC                                                               ;A79645;
    dw $314D,$8001                                                       ;A79646;
    db $2C                                                               ;A7964A;
    dw $31AE,$8000                                                       ;A7964B;
    db $1C                                                               ;A7964F;
    dw $318E,$8000                                                       ;A79650;
    db $0C                                                               ;A79654;
    dw $316E,$8000                                                       ;A79655;
    db $FC                                                               ;A79659;
    dw $314E                                                             ;A7965A;

Spritemap_KraidFoot_3:
    dw $0008,$81F0                                                       ;A7965C;
    db $2C                                                               ;A79660;
    dw $31A5,$81E8                                                       ;A79661;
    db $2C                                                               ;A79665;
    dw $31A4,$81F8                                                       ;A79666;
    db $1C                                                               ;A7966A;
    dw $31CE,$81E8                                                       ;A7966B;
    db $1C                                                               ;A7966F;
    dw $31CC,$8000                                                       ;A79670;
    db $0C                                                               ;A79674;
    dw $317A,$81F0                                                       ;A79675;
    db $0C                                                               ;A79679;
    dw $3188,$8000                                                       ;A7967A;
    db $FC                                                               ;A7967E;
    dw $3186,$81F0                                                       ;A7967F;
    db $FC                                                               ;A79683;
    dw $3184                                                             ;A79684;

Spritemap_KraidFoot_4:
    dw $000C,$01D8                                                       ;A79686;
    db $F4                                                               ;A7968A;
    dw $31C3,$0018                                                       ;A7968B;
    db $F4                                                               ;A7968F;
    dw $319A,$8000                                                       ;A79690;
    db $F4                                                               ;A79694;
    dw $31C8,$81F0                                                       ;A79695;
    db $F4                                                               ;A79699;
    dw $31C6,$81E0                                                       ;A7969A;
    db $F4                                                               ;A7969E;
    dw $31C4,$81D0                                                       ;A7969F;
    db $FC                                                               ;A796A3;
    dw $31A7,$8020                                                       ;A796A4;
    db $FC                                                               ;A796A8;
    dw $31AB,$8020                                                       ;A796A9;
    db $F4                                                               ;A796AD;
    dw $319B,$8010                                                       ;A796AE;
    db $FC                                                               ;A796B2;
    dw $31DA,$8000                                                       ;A796B3;
    db $FC                                                               ;A796B7;
    dw $31D8,$81F0                                                       ;A796B8;
    db $FC                                                               ;A796BC;
    dw $31D6,$81E0                                                       ;A796BD;
    db $FC                                                               ;A796C1;
    dw $31D4                                                             ;A796C2;

UNUSED_Spritemap_KraidFoot_A796C4:
    dw $0001,$81F8                                                       ;A796C4;
    db $F8                                                               ;A796C8;
    dw $21D0                                                             ;A796C9;

UNUSED_Spritemap_KraidFoot_A796CB:
    dw $0001,$01FC                                                       ;A796CB;
    db $FC                                                               ;A796CF;
    dw $21D2                                                             ;A796D0;

InstList_Kraid_Roar_0:
    dw $000A                                                             ;A796D2;
    dw Tilemap_KraidHead_0                                               ;A796D4;
    dw Hitbox_KraidMouth_0                                               ;A796D6;
    dw $FFFF                                                             ;A796D8;

InstList_Kraid_Roar_1:
    dw $000A                                                             ;A796DA;
    dw Tilemap_KraidHead_1                                               ;A796DC;
    dw Hitbox_KraidMouth_1                                               ;A796DE;
    dw Hitbox_KraidMouth_5                                               ;A796E0;

InstList_Kraid_Roar_2:
    dw $000A                                                             ;A796E2;
    dw Tilemap_KraidHead_2                                               ;A796E4;
    dw Hitbox_KraidMouth_2                                               ;A796E6;
    dw Hitbox_KraidMouth_6                                               ;A796E8;

InstList_Kraid_Roar_3:
    dw Instruction_Kraid_PlayRoarSFX                                     ;A796EA;

InstList_Kraid_Roar_4:
    dw $0040                                                             ;A796EC;
    dw Tilemap_KraidHead_3                                               ;A796EE;
    dw Hitbox_KraidMouth_3                                               ;A796F0;
    dw Hitbox_KraidMouth_7                                               ;A796F2;

InstList_Kraid_Roar_5:
    dw $000A                                                             ;A796F4;
    dw Tilemap_KraidHead_2                                               ;A796F6;
    dw Hitbox_KraidMouth_2                                               ;A796F8;
    dw Hitbox_KraidMouth_6                                               ;A796FA;

InstList_Kraid_Roar_6:
    dw $000A                                                             ;A796FC;
    dw Tilemap_KraidHead_1                                               ;A796FE;
    dw Hitbox_KraidMouth_1                                               ;A79700;
    dw Hitbox_KraidMouth_5                                               ;A79702;

InstList_Kraid_Roar_7:
    dw $000A                                                             ;A79704;
    dw Tilemap_KraidHead_0                                               ;A79706;
    dw Hitbox_KraidMouth_0                                               ;A79708;
    dw $FFFF                                                             ;A7970A;

InstList_Kraid_Roar_8:
    dw $FFFF                                                             ;A7970C;

InstList_Kraid_DyingRoar_0:
    dw $0014                                                             ;A7970E;
    dw Tilemap_KraidHead_0                                               ;A79710;
    dw Hitbox_KraidMouth_0                                               ;A79712;
    dw $FFFF                                                             ;A79714;

InstList_Kraid_DyingRoar_1:
    dw $0014                                                             ;A79716;
    dw Tilemap_KraidHead_1                                               ;A79718;
    dw Hitbox_KraidMouth_1                                               ;A7971A;
    dw Hitbox_KraidMouth_5                                               ;A7971C;
    dw $0014                                                             ;A7971E;
    dw Tilemap_KraidHead_2                                               ;A79720;
    dw Hitbox_KraidMouth_2                                               ;A79722;
    dw Hitbox_KraidMouth_6                                               ;A79724;
    dw Instruction_Kraid_PlayRoarSFX                                     ;A79726;
    dw $00C0                                                             ;A79728;
    dw Tilemap_KraidHead_3                                               ;A7972A;
    dw Hitbox_KraidMouth_3                                               ;A7972C;
    dw Hitbox_KraidMouth_7                                               ;A7972E;
    dw $0014                                                             ;A79730;
    dw Tilemap_KraidHead_2                                               ;A79732;
    dw Hitbox_KraidMouth_2                                               ;A79734;
    dw Hitbox_KraidMouth_6                                               ;A79736;
    dw $0014                                                             ;A79738;
    dw Tilemap_KraidHead_1                                               ;A7973A;
    dw Hitbox_KraidMouth_1                                               ;A7973C;
    dw Hitbox_KraidMouth_5                                               ;A7973E;
    dw $0014                                                             ;A79740;
    dw Tilemap_KraidHead_0                                               ;A79742;
    dw Hitbox_KraidMouth_0                                               ;A79744;
    dw $FFFF,$FFFF                                                       ;A79746;

InstList_Kraid_EyeGlowing_0:
    dw $0005                                                             ;A7974A;
    dw Tilemap_KraidHead_0                                               ;A7974C;
    dw Hitbox_KraidMouth_0                                               ;A7974E;
    dw $FFFF                                                             ;A79750;

InstList_Kraid_EyeGlowing_1:
    dw $000A                                                             ;A79752;
    dw Tilemap_KraidHead_1                                               ;A79754;
    dw Hitbox_KraidMouth_1                                               ;A79756;
    dw Hitbox_KraidMouth_5                                               ;A79758;
    dw $0005                                                             ;A7975A;
    dw Tilemap_KraidHead_0                                               ;A7975C;
    dw Hitbox_KraidMouth_0                                               ;A7975E;
    dw $FFFF,$FFFF                                                       ;A79760;

InstList_Kraid_Dying_0:
    dw $0019                                                             ;A79764;
    dw Tilemap_KraidHead_0                                               ;A79766;
    dw Hitbox_KraidMouth_0                                               ;A79768;
    dw $FFFF                                                             ;A7976A;

InstList_Kraid_Dying_1:
    dw $0019                                                             ;A7976C;
    dw Tilemap_KraidHead_1                                               ;A7976E;
    dw Hitbox_KraidMouth_1                                               ;A79770;
    dw Hitbox_KraidMouth_5                                               ;A79772;
    dw $0019                                                             ;A79774;
    dw Tilemap_KraidHead_2                                               ;A79776;
    dw Hitbox_KraidMouth_2                                               ;A79778;
    dw Hitbox_KraidMouth_6                                               ;A7977A;
    dw Instruction_Kraid_PlayDyingSFX                                    ;A7977C;
    dw $0040                                                             ;A7977E;
    dw Tilemap_KraidHead_3                                               ;A79780;
    dw Hitbox_KraidMouth_3                                               ;A79782;
    dw Hitbox_KraidMouth_7                                               ;A79784;
    dw $FFFF                                                             ;A79786;

Hitbox_KraidMouth_0:
    dw $0010,$FF88,$0028,$FFA8                                           ;A79788;

Hitbox_KraidMouth_1:
    dw $0010,$FF88,$0028,$FF98                                           ;A79790;

Hitbox_KraidMouth_2:
    dw $0010,$FF80,$0028,$FF90                                           ;A79798;

Hitbox_KraidMouth_3:
    dw $0010,$FF80,$0028,$FF88                                           ;A797A0;

Hitbox_KraidMouth_4:
    dw $0000,$0000,$0000,$0000                                           ;A797A8;

Hitbox_KraidMouth_5:
    dw $0006,$FFA0,$0020,$FFB0                                           ;A797B0;

Hitbox_KraidMouth_6:
    dw $0000,$FF98,$0020,$FFB0                                           ;A797B8;

Hitbox_KraidMouth_7:
    dw $0000,$FF90,$0020,$FFB0                                           ;A797C0;

Tilemap_KraidHead_0:
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A797C8;
    dw $0338,$0338,$0338,$0338,$3C00,$3C01,$3C02,$3C03                   ;A797D8;
    dw $3C04,$3C05,$0338,$0338,$0338,$0338,$0338,$0338                   ;A797E8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A797F8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79808;
    dw $0338,$0338,$3C06,$3C07,$3C08,$3C09,$3C0A,$3C0B                   ;A79818;
    dw $3C0C,$3C0D,$3C0E,$0338,$0338,$0338,$0338,$0338                   ;A79828;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79838;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79848;
    dw $0338,$0338,$3C0F,$3C10,$3C11,$3C12,$3C13,$3C14                   ;A79858;
    dw $3C15,$3C16,$3C17,$0338,$0338,$0338,$0338,$0338                   ;A79868;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79878;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79888;
    dw $0338,$3C18,$3C19,$3C1A,$3C1B,$3C1C,$3C1D,$3C1E                   ;A79898;
    dw $3C1F,$3C20,$3C21,$0338,$0338,$0338,$0338,$0338                   ;A798A8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A798B8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A798C8;
    dw $0338,$3C22,$3C23,$3C24,$3C25,$3C26,$3C27,$3C28                   ;A798D8;
    dw $3C29,$3C2A,$0338,$0338,$0338,$0338,$0338,$0338                   ;A798E8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A798F8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79908;
    dw $3C2B,$3C2C,$3C2D,$3C2E,$3C2F,$3C30,$3C31,$3C32                   ;A79918;
    dw $3C33,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79928;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79938;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79948;
    dw $0338,$3C34,$3C35,$3C36,$3C37,$3C38,$3C39,$3C3A                   ;A79958;
    dw $3C3B,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79968;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79978;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3C3C                   ;A79988;
    dw $3C3D,$3C3E,$3C3F,$3C40,$3C41,$3C42,$3C43,$3C44                   ;A79998;
    dw $3C45,$3C46,$0338,$0338,$0338,$0338,$0338,$0338                   ;A799A8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A799B8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3C47                   ;A799C8;
    dw $3C48,$3C49,$3C4A,$3C4B,$3C4C,$3C4D,$3C4E,$3C4F                   ;A799D8;
    dw $3C50,$3C51,$3C52,$0338,$0338,$0338,$0338,$0338                   ;A799E8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A799F8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3C53                   ;A79A08;
    dw $3C54,$3C55,$3C56,$3C57,$3C58,$3C59,$3C5A,$3C5B                   ;A79A18;
    dw $3C5C,$3C5D,$3C5E,$0338,$0338,$0338,$0338,$0338                   ;A79A28;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79A38;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3C5F                   ;A79A48;
    dw $3C60,$3C61,$3D50,$3D50,$3C62,$3C63,$3C64,$3C65                   ;A79A58;
    dw $3C66,$3C67,$3C68,$0338,$0338,$0338,$0338,$0338                   ;A79A68;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79A78;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$3C69,$3C6A                   ;A79A88;
    dw $3D50,$3D50,$3D50,$3C6B,$3C6C,$3C6D,$3C6E,$3C6F                   ;A79A98;
    dw $3C70,$3C71,$3C72,$0338,$0338,$0338,$0338,$0338                   ;A79AA8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79AB8;

Tilemap_KraidHead_1:
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79AC8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79AD8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79AE8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79AF8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79B08;
    dw $0338,$0338,$0338,$0338,$3C73,$3C74,$3C75,$3C76                   ;A79B18;
    dw $3C77,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79B28;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79B38;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79B48;
    dw $0338,$0338,$0338,$3C78,$3C79,$3C7A,$3C7B,$3C7C                   ;A79B58;
    dw $3C7D,$3C7E,$3C7F,$0338,$0338,$0338,$0338,$0338                   ;A79B68;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79B78;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79B88;
    dw $0338,$0338,$3C80,$3C81,$3C82,$3C83,$3C84,$3C85                   ;A79B98;
    dw $3C86,$3C87,$3C88,$3C89,$0338,$0338,$0338,$0338                   ;A79BA8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79BB8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79BC8;
    dw $0338,$3C8A,$3C8B,$3C8C,$3C8D,$3C8E,$3C8F,$3C90                   ;A79BD8;
    dw $3C91,$3C92,$3C93,$3C94,$0338,$0338,$0338,$0338                   ;A79BE8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79BF8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3C95                   ;A79C08;
    dw $0338,$3C96,$3C97,$3C98,$3C99,$3C9A,$3C9B,$3C9C                   ;A79C18;
    dw $3C9D,$3C9E,$3C9F,$3CA0,$0338,$0338,$0338,$0338                   ;A79C28;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79C38;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3CA1                   ;A79C48;
    dw $3CA2,$3CA3,$3CA4,$3CA5,$3CA6,$3CA7,$3CA8,$3CA9                   ;A79C58;
    dw $3CAA,$3CAB,$3CAC,$3CAD,$0338,$0338,$0338,$0338                   ;A79C68;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79C78;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3CAE                   ;A79C88;
    dw $3CAF,$3CB0,$3CB1,$3CB2,$3CB3,$3CB4,$3C43,$3C44                   ;A79C98;
    dw $3C45,$3C46,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79CA8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79CB8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79CC8;
    dw $3CB5,$3CB6,$3CB7,$3CB8,$3C4C,$3C4D,$3C4E,$3C4F                   ;A79CD8;
    dw $3C50,$3C51,$3C52,$0338,$0338,$0338,$0338,$0338                   ;A79CE8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79CF8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3CB9                   ;A79D08;
    dw $3CBA,$3CBB,$3C56,$3C57,$3C58,$3C59,$3C5A,$3C5B                   ;A79D18;
    dw $3C5C,$3C5D,$3C5E,$0338,$0338,$0338,$0338,$0338                   ;A79D28;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79D38;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3C5F                   ;A79D48;
    dw $3C60,$3C61,$3D50,$3D50,$3C62,$3C63,$3C64,$3C65                   ;A79D58;
    dw $3C66,$3C67,$3C68,$0338,$0338,$0338,$0338,$0338                   ;A79D68;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79D78;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$3C69,$3C6A                   ;A79D88;
    dw $3D50,$3D50,$3D50,$3C6B,$3C6C,$3C6D,$3C6E,$3C6F                   ;A79D98;
    dw $3C70,$3C71,$3C72,$0338,$0338,$0338,$0338,$0338                   ;A79DA8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79DB8;

Tilemap_KraidHead_2:
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79DC8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79DD8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79DE8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79DF8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79E08;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$3CBC,$0338                   ;A79E18;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79E28;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79E38;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79E48;
    dw $0338,$0338,$0338,$0338,$3CBD,$3CBE,$3CBF,$3CC0                   ;A79E58;
    dw $3CC1,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79E68;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79E78;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79E88;
    dw $0338,$0338,$3CC2,$3CC3,$3CC4,$3CC5,$3CC6,$3CC7                   ;A79E98;
    dw $3CC8,$3CC9,$3CCA,$0338,$0338,$0338,$0338,$0338                   ;A79EA8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79EB8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79EC8;
    dw $3CCB,$3CCC,$3CCD,$3CCE,$3CCF,$3CD0,$3CD1,$3CD2                   ;A79ED8;
    dw $3CD3,$3CD4,$3D43,$0338,$0338,$0338,$0338,$0338                   ;A79EE8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79EF8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3CD5                   ;A79F08;
    dw $3CD6,$3CD7,$3CD8,$3CD9,$3CDA,$3CDB,$3CDC,$3CDD                   ;A79F18;
    dw $3CDE,$3CDF,$3CE0,$3CE1,$0338,$0338,$0338,$0338                   ;A79F28;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79F38;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3CE2                   ;A79F48;
    dw $3CE3,$3CE4,$3CE5,$3CE6,$3CE7,$3CE8,$3CE9,$3CEA                   ;A79F58;
    dw $3CEB,$3CEC,$3CED,$3CEE,$3CEF,$0338,$0338,$0338                   ;A79F68;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79F78;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79F88;
    dw $0338,$0338,$3CF0,$3CF1,$3CF2,$3CF3,$3CF4,$3CF5                   ;A79F98;
    dw $3CF6,$3CF7,$3CF8,$3CF9,$3CFA,$0338,$0338,$0338                   ;A79FA8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79FB8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79FC8;
    dw $3CFB,$3CFC,$3CB7,$3CFD,$3CFE,$3C4D,$3C4E,$3C4F                   ;A79FD8;
    dw $3C50,$3C51,$3CFF,$3D00,$3D44,$0338,$0338,$0338                   ;A79FE8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79FF8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3CB9                   ;A7A008;
    dw $3CBA,$3CBB,$3C56,$3C57,$3C58,$3C59,$3C5A,$3C5B                   ;A7A018;
    dw $3C5C,$3C5D,$3C5E,$0338,$0338,$0338,$0338,$0338                   ;A7A028;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A038;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3C5F                   ;A7A048;
    dw $3C60,$3C61,$3D50,$3D50,$3C62,$3C63,$3C64,$3C65                   ;A7A058;
    dw $3C66,$3C67,$3C68,$0338,$0338,$0338,$0338,$0338                   ;A7A068;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A078;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$3C69,$3C6A                   ;A7A088;
    dw $3D50,$3D50,$3D50,$3C6B,$3C6C,$3C6D,$3C6E,$3C6F                   ;A7A098;
    dw $3C70,$3C71,$3C72,$0338,$0338,$0338,$0338,$0338                   ;A7A0A8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A0B8;

Tilemap_KraidHead_3:
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A0C8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A0D8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A0E8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A0F8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A108;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A118;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A128;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A138;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A148;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A158;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A168;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A178;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A188;
    dw $3D01,$3D02,$0338,$3D03,$3D04,$3D05,$3D06,$3D07                   ;A7A198;
    dw $3D08,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A1A8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A1B8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A1C8;
    dw $3D09,$3D0A,$3D0B,$3D0C,$3D0D,$3D0E,$3D0F,$3D10                   ;A7A1D8;
    dw $3D11,$3D12,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A1E8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A1F8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A208;
    dw $3D13,$3D14,$3D15,$3D16,$3D17,$3D18,$3D19,$3D1A                   ;A7A218;
    dw $3D1B,$3D1C,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A228;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A238;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A248;
    dw $0338,$0338,$3D1D,$3D1E,$3D1F,$3D20,$3D21,$3D22                   ;A7A258;
    dw $3D23,$3D24,$3D25,$0338,$0338,$0338,$0338,$0338                   ;A7A268;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A278;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A288;
    dw $0338,$0338,$3D26,$3D27,$3D28,$3D29,$3D2A,$3D2B                   ;A7A298;
    dw $3D2C,$3D2D,$3D2E,$0338,$0338,$0338,$0338,$0338                   ;A7A2A8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A2B8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A2C8;
    dw $3D2F,$3D30,$3CB7,$3D31,$3D32,$3D33,$3D34,$3D35                   ;A7A2D8;
    dw $3D36,$3C51,$3D37,$3D38,$0338,$0338,$0338,$0338                   ;A7A2E8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A2F8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3CB9                   ;A7A308;
    dw $3CBA,$3CBB,$3C56,$3C57,$3C58,$3C59,$3D39,$3D3A                   ;A7A318;
    dw $3D3B,$3D3C,$3D3D,$3D3E,$0338,$0338,$0338,$0338                   ;A7A328;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A338;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3C5F                   ;A7A348;
    dw $3C60,$3C61,$3D50,$3D50,$3C62,$3C63,$3C64,$3C65                   ;A7A358;
    dw $3C66,$3D3F,$3D40,$3D41,$0338,$0338,$0338,$0338                   ;A7A368;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A378;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$3C69,$3C6A                   ;A7A388;
    dw $3D50,$3D50,$3D50,$3C6B,$3C6C,$3C6D,$3C6E,$3C6F                   ;A7A398;
    dw $3C70,$3C71,$3D42,$0338,$0338,$0338,$0338,$0338                   ;A7A3A8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A3B8;

UNUSED_ExtendedSpritemap_KraidArm_A7A3C8:
    dw $0002,$0000,$0000                                                 ;A7A3C8;
    dw Spritemap_KraidArm_RisingSinking_A                                ;A7A3CE;
    dw Hitbox_KraidArm_F                                                 ;A7A3D0;
    dw $FFF7,$FFF6                                                       ;A7A3D2;
    dw Spritemap_KraidArm_RisingSinking_0                                ;A7A3D6;
    dw Hitbox_KraidArm_0                                                 ;A7A3D8;

UNUSED_ExtendedSpritemap_KraidArm_A7A3DA:
    dw $0002,$FFF9,$FFF8                                                 ;A7A3DA;
    dw Spritemap_KraidArm_RisingSinking_1                                ;A7A3E0;
    dw Hitbox_KraidArm_1                                                 ;A7A3E2;
    dw $0001,$0000                                                       ;A7A3E4;
    dw Spritemap_KraidArm_RisingSinking_A                                ;A7A3E8;
    dw Hitbox_KraidArm_F                                                 ;A7A3EA;

UNUSED_ExtendedSpritemap_KraidArm_A7A3EC:
    dw $0002,$FFF6,$0001                                                 ;A7A3EC;
    dw Spritemap_KraidArm_RisingSinking_1                                ;A7A3F2;
    dw Hitbox_KraidArm_1                                                 ;A7A3F4;
    dw $0000,$0000                                                       ;A7A3F6;
    dw Spritemap_KraidArm_RisingSinking_7                                ;A7A3FA;
    dw Hitbox_KraidArm_8                                                 ;A7A3FC;

UNUSED_ExtendedSpritemap_KraidArm_A7A3FE:
    dw $0002,$FFF6,$0000                                                 ;A7A3FE;
    dw Spritemap_KraidArm_RisingSinking_2                                ;A7A404;
    dw Hitbox_KraidArm_2                                                 ;A7A406;
    dw $0000,$0000                                                       ;A7A408;
    dw Spritemap_KraidArm_RisingSinking_7                                ;A7A40C;
    dw Hitbox_KraidArm_8                                                 ;A7A40E;

UNUSED_ExtendedSpritemap_KraidArm_A7A410:
    dw $0002,$FFF6,$0000                                                 ;A7A410;
    dw Spritemap_KraidArm_RisingSinking_3                                ;A7A416;
    dw Hitbox_KraidArm_3                                                 ;A7A418;
    dw $0000,$0000                                                       ;A7A41A;
    dw Spritemap_KraidArm_RisingSinking_7                                ;A7A41E;
    dw Hitbox_KraidArm_8                                                 ;A7A420;

UNUSED_ExtendedSpritemap_KraidArm_A7A422:
    dw $0002,$FFFA,$0006                                                 ;A7A422;
    dw Spritemap_KraidArm_RisingSinking_3                                ;A7A428;
    dw Hitbox_KraidArm_3                                                 ;A7A42A;
    dw $0000,$0000                                                       ;A7A42C;
    dw Spritemap_KraidArm_RisingSinking_8                                ;A7A430;
    dw Hitbox_KraidArm_9                                                 ;A7A432;

UNUSED_ExtendedSpritemap_KraidArm_A7A434:
    dw $0002,$FFF8,$0006                                                 ;A7A434;
    dw Spritemap_KraidArm_RisingSinking_4                                ;A7A43A;
    dw Hitbox_KraidArm_4                                                 ;A7A43C;
    dw $0000,$0000                                                       ;A7A43E;
    dw Spritemap_KraidArm_RisingSinking_8                                ;A7A442;
    dw Hitbox_KraidArm_9                                                 ;A7A444;

UNUSED_ExtendedSpritemap_KraidArm_A7A446:
    dw $0002,$FFF8,$0006                                                 ;A7A446;
    dw Spritemap_KraidArm_RisingSinking_5                                ;A7A44C;
    dw Hitbox_KraidArm_5                                                 ;A7A44E;
    dw $0000,$0000                                                       ;A7A450;
    dw Spritemap_KraidArm_RisingSinking_8                                ;A7A454;
    dw Hitbox_KraidArm_9                                                 ;A7A456;

UNUSED_ExtendedSpritemap_KraidArm_A7A458:
    dw $0002,$FFFF,$000C                                                 ;A7A458;
    dw Spritemap_KraidArm_RisingSinking_5                                ;A7A45E;
    dw Hitbox_KraidArm_5                                                 ;A7A460;
    dw $0000,$0000                                                       ;A7A462;
    dw Spritemap_KraidArm_RisingSinking_9                                ;A7A466;
    dw Hitbox_KraidArm_A                                                 ;A7A468;

UNUSED_ExtendedSpritemap_KraidArm_A7A46A:
    dw $0002,$0000,$000B                                                 ;A7A46A;
    dw Spritemap_KraidArm_RisingSinking_6                                ;A7A470;
    dw Hitbox_KraidArm_6                                                 ;A7A472;
    dw $0000,$0000                                                       ;A7A474;
    dw Spritemap_KraidArm_RisingSinking_9                                ;A7A478;
    dw Hitbox_KraidArm_A                                                 ;A7A47A;

Spritemap_KraidArm_RisingSinking_0:
    dw $0001,$81F2                                                       ;A7A47C;
    db $F4                                                               ;A7A480;
    dw $2126                                                             ;A7A481;

Spritemap_KraidArm_RisingSinking_1:
    dw $0002,$01F9                                                       ;A7A483;
    db $FB                                                               ;A7A487;
    dw $2129,$01F1                                                       ;A7A488;
    db $FB                                                               ;A7A48C;
    dw $2128                                                             ;A7A48D;

Spritemap_KraidArm_RisingSinking_2:
    dw $0001,$81F2                                                       ;A7A48F;
    db $FD                                                               ;A7A493;
    dw $212A                                                             ;A7A494;

Spritemap_KraidArm_RisingSinking_3:
    dw $0002,$01FA                                                       ;A7A496;
    db $07                                                               ;A7A49A;
    dw $2139,$01FA                                                       ;A7A49B;
    db $FF                                                               ;A7A49F;
    dw $2138                                                             ;A7A4A0;

Spritemap_KraidArm_RisingSinking_4:
    dw $0001,$81FD                                                       ;A7A4A2;
    db $FD                                                               ;A7A4A6;
    dw $E126                                                             ;A7A4A7;

Spritemap_KraidArm_RisingSinking_5:
    dw $0002,$01FF                                                       ;A7A4A9;
    db $FD                                                               ;A7A4AD;
    dw $E129,$0007                                                       ;A7A4AE;
    db $FD                                                               ;A7A4B2;
    dw $E128                                                             ;A7A4B3;

Spritemap_KraidArm_RisingSinking_6:
    dw $0001,$81FD                                                       ;A7A4B5;
    db $F4                                                               ;A7A4B9;
    dw $E12A                                                             ;A7A4BA;

Spritemap_KraidArm_RisingSinking_7:
    dw $0002,$01FA                                                       ;A7A4BC;
    db $FC                                                               ;A7A4C0;
    dw $E12E,$01F2                                                       ;A7A4C1;
    db $FC                                                               ;A7A4C5;
    dw $A12E                                                             ;A7A4C6;

Spritemap_KraidArm_RisingSinking_8:
    dw $0001,$81F4                                                       ;A7A4C8;
    db $FC                                                               ;A7A4CC;
    dw $A12C                                                             ;A7A4CD;

Spritemap_KraidArm_RisingSinking_9:
    dw $0002,$01FC                                                       ;A7A4CF;
    db $06                                                               ;A7A4D3;
    dw $A13E,$01FC                                                       ;A7A4D4;
    db $FE                                                               ;A7A4D8;
    dw $213E                                                             ;A7A4D9;

Spritemap_KraidArm_RisingSinking_A:
    dw $0001,$81F4                                                       ;A7A4DB;
    db $F4                                                               ;A7A4DF;
    dw $212C                                                             ;A7A4E0;

UNUSED_ExtendedSpritemap_KraidArm_A7A4E2:
    dw $0001,$0000,$0000                                                 ;A7A4E2;
    dw Spritemap_KraidArm_RisingSinking_D                                ;A7A4E8;
    dw Hitbox_KraidArm_12                                                ;A7A4EA;

UNUSED_ExtendedSpritemap_KraidArm_A7A4EC:
    dw $0001,$0000,$0000                                                 ;A7A4EC;
    dw Spritemap_KraidArm_RisingSinking_C                                ;A7A4F2;
    dw Hitbox_KraidArm_11                                                ;A7A4F4;

UNUSED_ExtendedSpritemap_KraidArm_A7A4F6:
    dw $0001,$0000,$0000                                                 ;A7A4F6;
    dw Spritemap_KraidArm_RisingSinking_B                                ;A7A4FC;
    dw Hitbox_KraidArm_10                                                ;A7A4FE;

Spritemap_KraidArm_RisingSinking_B:
    dw $0003,$81F4                                                       ;A7A500;
    db $F8                                                               ;A7A504;
    dw $2104,$81E4                                                       ;A7A505;
    db $F8                                                               ;A7A509;
    dw $2102,$81D4                                                       ;A7A50A;
    db $F8                                                               ;A7A50E;
    dw $2100                                                             ;A7A50F;

Spritemap_KraidArm_RisingSinking_C:
    dw $0008,$01EC                                                       ;A7A511;
    db $00                                                               ;A7A515;
    dw $211C,$01FC                                                       ;A7A516;
    db $F0                                                               ;A7A51A;
    dw $210F,$01F4                                                       ;A7A51B;
    db $F0                                                               ;A7A51F;
    dw $210E,$01E4                                                       ;A7A520;
    db $E8                                                               ;A7A524;
    dw $210D,$01DC                                                       ;A7A525;
    db $F8                                                               ;A7A529;
    dw $210C,$81F4                                                       ;A7A52A;
    db $F8                                                               ;A7A52E;
    dw $210A,$81E4                                                       ;A7A52F;
    db $F0                                                               ;A7A533;
    dw $2108,$81D4                                                       ;A7A534;
    db $E8                                                               ;A7A538;
    dw $2106                                                             ;A7A539;

Spritemap_KraidArm_RisingSinking_D:
    dw $0008,$01FC                                                       ;A7A53B;
    db $ED                                                               ;A7A53F;
    dw $213F,$01EC                                                       ;A7A540;
    db $FD                                                               ;A7A544;
    dw $212F,$01EC                                                       ;A7A545;
    db $F5                                                               ;A7A549;
    dw $211F,$01EC                                                       ;A7A54A;
    db $DD                                                               ;A7A54E;
    dw $211E,$01E4                                                       ;A7A54F;
    db $ED                                                               ;A7A553;
    dw $211D,$81F4                                                       ;A7A554;
    db $F5                                                               ;A7A558;
    dw $2124,$81EC                                                       ;A7A559;
    db $E5                                                               ;A7A55D;
    dw $2122,$81DC                                                       ;A7A55E;
    db $DD                                                               ;A7A562;
    dw $2120                                                             ;A7A563;

ExtendedSpritemap_KraidFoot_Initial:
    dw $0002,$0008,$0028                                                 ;A7A565;
    dw Spritemap_KraidFoot_6                                             ;A7A56B;
    dw Hitbox_KraidFoot                                                  ;A7A56D;
    dw $0000,$0000                                                       ;A7A56F;
    dw Spritemap_KraidFoot_5                                             ;A7A573;
    dw Hitbox_KraidFoot                                                  ;A7A575;

Spritemap_KraidFoot_5:
    dw $0008,$8020                                                       ;A7A577;
    db $1C                                                               ;A7A57B;
    dw $215A,$8020                                                       ;A7A57C;
    db $14                                                               ;A7A580;
    dw $214A,$8010                                                       ;A7A581;
    db $1C                                                               ;A7A585;
    dw $2148,$01F8                                                       ;A7A586;
    db $0C                                                               ;A7A58A;
    dw $214C,$8010                                                       ;A7A58B;
    db $0C                                                               ;A7A58F;
    dw $2146,$8000                                                       ;A7A590;
    db $0C                                                               ;A7A594;
    dw $2144,$8008                                                       ;A7A595;
    db $FC                                                               ;A7A599;
    dw $2142,$81F8                                                       ;A7A59A;
    db $FC                                                               ;A7A59E;
    dw $2140                                                             ;A7A59F;

Spritemap_KraidFoot_6:
    dw $000C,$01D8                                                       ;A7A5A1;
    db $F4                                                               ;A7A5A5;
    dw $21C3,$0018                                                       ;A7A5A6;
    db $F4                                                               ;A7A5AA;
    dw $219A,$8000                                                       ;A7A5AB;
    db $F4                                                               ;A7A5AF;
    dw $21C8,$81F0                                                       ;A7A5B0;
    db $F4                                                               ;A7A5B4;
    dw $21C6,$81E0                                                       ;A7A5B5;
    db $F4                                                               ;A7A5B9;
    dw $21C4,$81D0                                                       ;A7A5BA;
    db $FC                                                               ;A7A5BE;
    dw $21A7,$8020                                                       ;A7A5BF;
    db $FC                                                               ;A7A5C3;
    dw $21AB,$8020                                                       ;A7A5C4;
    db $F4                                                               ;A7A5C8;
    dw $219B,$8010                                                       ;A7A5C9;
    db $FC                                                               ;A7A5CD;
    dw $21DA,$8000                                                       ;A7A5CE;
    db $FC                                                               ;A7A5D2;
    dw $21D8,$81F0                                                       ;A7A5D3;
    db $FC                                                               ;A7A5D7;
    dw $21D6,$81E0                                                       ;A7A5D8;
    db $FC                                                               ;A7A5DC;
    dw $21D4                                                             ;A7A5DD;

Spritemap_KraidLint_Initial:
    dw $0005,$0000                                                       ;A7A5DF;
    db $08                                                               ;A7A5E3;
    dw $11C2,$81F0                                                       ;A7A5E4;
    db $00                                                               ;A7A5E8;
    dw $11B0,$8000                                                       ;A7A5E9;
    db $F8                                                               ;A7A5ED;
    dw $11A2,$81F0                                                       ;A7A5EE;
    db $F8                                                               ;A7A5F2;
    dw $11A0,$8000                                                       ;A7A5F3;
    db $08                                                               ;A7A5F7;
    dw $11A9                                                             ;A7A5F8;

UNUSED_Spritemap_KraidLint_A7A5FA:
    dw $0004,$0000                                                       ;A7A5FA;
    db $08                                                               ;A7A5FE;
    dw $11C2,$81F0                                                       ;A7A5FF;
    db $00                                                               ;A7A603;
    dw $11B0,$8000                                                       ;A7A604;
    db $F8                                                               ;A7A608;
    dw $11A2,$81F0                                                       ;A7A609;
    db $F8                                                               ;A7A60D;
    dw $11A0                                                             ;A7A60E;

UNUSED_Spritemap_KraidLint_A7A610:
    dw $0001,$81F8                                                       ;A7A610;
    db $F8                                                               ;A7A614;
    dw $11A9                                                             ;A7A615;

Spritemap_KraidNail_0:
    dw $0002,$C3F4                                                       ;A7A617;
    db $F8                                                               ;A7A61B;
    dw $212A,$C3FC                                                       ;A7A61C;
    db $F8                                                               ;A7A620;
    dw $212C                                                             ;A7A621;

Spritemap_KraidNail_1:
    dw $0004,$01F9                                                       ;A7A623;
    db $FB                                                               ;A7A627;
    dw $2138,$01F9                                                       ;A7A628;
    db $03                                                               ;A7A62C;
    dw $2139,$0002                                                       ;A7A62D;
    db $F9                                                               ;A7A631;
    dw $612E,$01FA                                                       ;A7A632;
    db $F9                                                               ;A7A636;
    dw $212E                                                             ;A7A637;

Spritemap_KraidNail_2:
    dw $0002,$C3F9                                                       ;A7A639;
    db $FB                                                               ;A7A63D;
    dw $E126,$C3F9                                                       ;A7A63E;
    db $F4                                                               ;A7A642;
    dw $612C                                                             ;A7A643;

Spritemap_KraidNail_3:
    dw $0004,$01FC                                                       ;A7A645;
    db $FF                                                               ;A7A649;
    dw $E129,$0004                                                       ;A7A64A;
    db $FF                                                               ;A7A64E;
    dw $E128,$01F9                                                       ;A7A64F;
    db $FE                                                               ;A7A653;
    dw $E13E,$01F9                                                       ;A7A654;
    db $F6                                                               ;A7A658;
    dw $613E                                                             ;A7A659;

Spritemap_KraidNail_4:
    dw $0002,$C3FC                                                       ;A7A65B;
    db $F8                                                               ;A7A65F;
    dw $E12A,$C3F4                                                       ;A7A660;
    db $F8                                                               ;A7A664;
    dw $212C                                                             ;A7A665;

Spritemap_KraidNail_5:
    dw $0004,$01FF                                                       ;A7A667;
    db $FD                                                               ;A7A66B;
    dw $E138,$01FF                                                       ;A7A66C;
    db $F5                                                               ;A7A670;
    dw $E139,$01FD                                                       ;A7A671;
    db $FF                                                               ;A7A675;
    dw $E12E,$01F5                                                       ;A7A676;
    db $FF                                                               ;A7A67A;
    dw $A12E                                                             ;A7A67B;

Spritemap_KraidNail_6:
    dw $0002,$C3F7                                                       ;A7A67D;
    db $F4                                                               ;A7A681;
    dw $2126,$C3F7                                                       ;A7A682;
    db $FC                                                               ;A7A686;
    dw $A12C                                                             ;A7A687;

Spritemap_KraidNail_7:
    dw $0004,$01FD                                                       ;A7A689;
    db $F9                                                               ;A7A68D;
    dw $2129,$01F5                                                       ;A7A68E;
    db $F9                                                               ;A7A692;
    dw $2128,$01FF                                                       ;A7A693;
    db $03                                                               ;A7A697;
    dw $A13E,$01FF                                                       ;A7A698;
    db $FB                                                               ;A7A69C;
    dw $213E                                                             ;A7A69D;

Spritemap_KraidArm_Dying_PreparingToLunge_0:
    dw $000C,$C3C1                                                       ;A7A69F;
    db $D8                                                               ;A7A6A3;
    dw $3326,$C3CE                                                       ;A7A6A4;
    db $E3                                                               ;A7A6A8;
    dw $332C,$C3C2                                                       ;A7A6A9;
    db $D2                                                               ;A7A6AD;
    dw $3326,$C3CF                                                       ;A7A6AE;
    db $DD                                                               ;A7A6B2;
    dw $332C,$01FF                                                       ;A7A6B3;
    db $EF                                                               ;A7A6B7;
    dw $330F,$01F7                                                       ;A7A6B8;
    db $EF                                                               ;A7A6BC;
    dw $330E,$01EF                                                       ;A7A6BD;
    db $FF                                                               ;A7A6C1;
    dw $331C,$01DF                                                       ;A7A6C2;
    db $F7                                                               ;A7A6C6;
    dw $330C,$01E7                                                       ;A7A6C7;
    db $E7                                                               ;A7A6CB;
    dw $330D,$C3F7                                                       ;A7A6CC;
    db $F7                                                               ;A7A6D0;
    dw $330A,$C3E7                                                       ;A7A6D1;
    db $EF                                                               ;A7A6D5;
    dw $3308,$C3D7                                                       ;A7A6D6;
    db $E7                                                               ;A7A6DA;
    dw $3306                                                             ;A7A6DB;

Spritemap_KraidArm_Dying_PreparingToLunge_1:
    dw $000B,$01BD                                                       ;A7A6DD;
    db $FE                                                               ;A7A6E1;
    dw $3328,$01C5                                                       ;A7A6E2;
    db $FE                                                               ;A7A6E6;
    dw $3329,$01D4                                                       ;A7A6E7;
    db $FE                                                               ;A7A6EB;
    dw $732E,$01CC                                                       ;A7A6EC;
    db $FE                                                               ;A7A6F0;
    dw $332E,$01B9                                                       ;A7A6F1;
    db $F9                                                               ;A7A6F5;
    dw $3328,$01C1                                                       ;A7A6F6;
    db $F9                                                               ;A7A6FA;
    dw $3329,$01D0                                                       ;A7A6FB;
    db $F9                                                               ;A7A6FF;
    dw $732E,$01C8                                                       ;A7A700;
    db $F9                                                               ;A7A704;
    dw $332E,$C3F4                                                       ;A7A705;
    db $F8                                                               ;A7A709;
    dw $3304,$C3E4                                                       ;A7A70A;
    db $F8                                                               ;A7A70E;
    dw $3302,$C3D4                                                       ;A7A70F;
    db $F8                                                               ;A7A713;
    dw $3300                                                             ;A7A714;

Tiles_KraidRoomBackground:
    db $3F,$FF,$4C,$F3,$5F,$E0,$CB,$F0,$B9,$C0,$8F,$F0,$B6,$C9,$B1,$CE   ;A7A716;
    db $00,$FF,$3F,$C0,$39,$C6,$3C,$C3,$76,$89,$71,$8E,$7F,$80,$7F,$80   ;A7A726;
    db $FF,$FF,$3F,$FF,$8F,$7F,$4E,$BF,$E7,$1F,$EF,$1F,$CF,$3F,$1F,$FF   ;A7A736;
    db $03,$FC,$FB,$04,$FF,$00,$FF,$00,$FE,$01,$FD,$02,$F3,$0C,$E8,$17   ;A7A746;
    db $07,$FF,$8F,$FF,$FE,$FF,$FE,$FF,$FF,$FF,$FF,$FF,$F6,$FF,$C3,$FF   ;A7A756;
    db $FE,$01,$FE,$01,$FD,$02,$FD,$02,$FF,$00,$BB,$44,$0F,$F0,$3F,$C0   ;A7A766;
    db $FF,$F9,$07,$FE,$13,$EF,$29,$D7,$BD,$C3,$D5,$EB,$E1,$FF,$61,$FF   ;A7A776;
    db $06,$F9,$F9,$06,$FC,$03,$FE,$01,$7E,$81,$BE,$41,$DE,$21,$DE,$21   ;A7A786;
    db $8D,$F2,$0B,$F4,$E0,$FF,$0F,$FF,$E7,$1F,$5B,$A7,$B4,$4B,$FC,$03   ;A7A796;
    db $7F,$80,$7F,$80,$1F,$E0,$F0,$0F,$FE,$01,$FF,$00,$FF,$00,$CF,$30   ;A7A7A6;
    db $3E,$FF,$3E,$FD,$7F,$F8,$FB,$F4,$F9,$F6,$EF,$F0,$E5,$FA,$E3,$FC   ;A7A7B6;
    db $D1,$2E,$E3,$1C,$C7,$38,$CF,$30,$4E,$B1,$3E,$C1,$9F,$60,$DF,$20   ;A7A7C6;
    db $E1,$1F,$EC,$13,$7A,$85,$9E,$01,$99,$06,$FF,$00,$FE,$01,$F8,$87   ;A7A7D6;
    db $FF,$00,$FF,$00,$9F,$60,$6F,$D0,$67,$98,$07,$F8,$8F,$70,$FF,$00   ;A7A7E6;
    db $E1,$FF,$A3,$FF,$FC,$FF,$70,$FF,$60,$FF,$66,$F9,$43,$FC,$4F,$F0   ;A7A7F6;
    db $DE,$21,$FC,$03,$E3,$1C,$EF,$10,$FF,$00,$DF,$20,$FF,$00,$FD,$02   ;A7A806;
    db $4E,$81,$CE,$01,$F8,$07,$B4,$4B,$B1,$4F,$23,$DF,$02,$FF,$0F,$FF   ;A7A816;
    db $B7,$68,$B7,$48,$CF,$30,$FF,$00,$FE,$01,$FD,$02,$FD,$02,$F1,$0E   ;A7A826;
    db $66,$F9,$71,$FE,$70,$FF,$FC,$FF,$87,$FF,$03,$FF,$1D,$C3,$3E,$C1   ;A7A836;
    db $FF,$00,$EF,$10,$CF,$30,$CB,$34,$FF,$00,$FF,$00,$EF,$10,$CF,$30   ;A7A846;
    db $EC,$13,$68,$97,$41,$BF,$03,$FF,$8F,$FF,$FE,$FF,$F8,$FF,$F1,$FE   ;A7A856;
    db $FF,$00,$FF,$00,$FF,$00,$FE,$01,$F7,$08,$FF,$00,$FF,$00,$FF,$00   ;A7A866;
    db $CF,$F0,$EF,$F0,$E3,$FC,$E2,$FD,$F1,$FE,$02,$FF,$EA,$17,$9D,$03   ;A7A876;
    db $FC,$03,$9E,$61,$1F,$E0,$1F,$E0,$8F,$70,$FD,$02,$FD,$02,$FE,$41   ;A7A886;
    db $3F,$FF,$FF,$FF,$C7,$F9,$9F,$E0,$9F,$E0,$8E,$F1,$C3,$FF,$FF,$7F   ;A7A896;
    db $C1,$3E,$01,$FE,$3E,$C1,$7F,$80,$77,$88,$7F,$80,$3C,$C3,$80,$7F   ;A7A8A6;
    db $74,$8B,$B9,$C7,$C1,$FF,$FB,$FF,$FF,$FF,$9F,$FF,$FE,$FF,$3C,$FF   ;A7A8B6;
    db $FF,$00,$FF,$00,$FF,$00,$E7,$18,$27,$D8,$6F,$90,$0F,$F0,$DF,$20   ;A7A8C6;
    db $F3,$FC,$F2,$FD,$79,$FE,$F9,$FF,$F8,$FF,$FC,$FF,$3F,$FF,$0F,$FD   ;A7A8D6;
    db $DF,$20,$DF,$20,$C7,$38,$07,$F8,$C7,$38,$E3,$1C,$F8,$07,$F2,$0D   ;A7A8E6;
    db $9D,$03,$F5,$0B,$B9,$47,$D3,$2F,$A7,$DF,$0F,$FF,$1F,$F9,$FF,$EF   ;A7A8F6;
    db $6E,$91,$8E,$71,$FE,$01,$FC,$03,$F8,$07,$F0,$0F,$E6,$19,$10,$EF   ;A7A906;

KraidLint_InitialFunctionTimers_top:
    dw $0120                                                             ;A7A916;

KraidLint_InitialFunctionTimers_middle:
    dw $00A0                                                             ;A7A918;

KraidLint_InitialFunctionTimers_bottom:
    dw $0040                                                             ;A7A91A;

KraidForwardsSpeed:
    dw $0003                                                             ;A7A91C;

UNUSED_KraidConstant_A7A91E:
    dw $0005                                                             ;A7A91E;

KraidBackwardsSpeed:
    dw $0003                                                             ;A7A920;

UNUSED_KraidBackwardsFastSpeed_A7A922:
    dw $0004                                                             ;A7A922;

UNUSED_KraidConstant_A7A924:
    dw $0110                                                             ;A7A924;

KraidLint_XSubSpeed:
    dw $8000                                                             ;A7A926;

KraidLint_XSpeed:
    dw $0003                                                             ;A7A928;

UNUSED_REP30_A7A92A:
    REP #$30                                                             ;A7A92A;

CheckIfKraidHasDied:
    PHX                                                                  ;A7A92C;
    LDX.W $079F                                                          ;A7A92D;
    LDA.L $7ED828,X                                                      ;A7A930;
    BIT.W #$0001                                                         ;A7A934;
    BEQ .returnAlive                                                     ;A7A937;
    PLX                                                                  ;A7A939;
    LDA.W #$0001                                                         ;A7A93A;
    RTS                                                                  ;A7A93D;


.returnAlive:
    PLX                                                                  ;A7A93E;
    LDA.W #$0000                                                         ;A7A93F;
    RTS                                                                  ;A7A942;


SetEnemyPropertiesToDead:
    LDX.W $0E54                                                          ;A7A943;
    LDA.W EnemyData.properties,X                                         ;A7A946;
    ORA.W #$0700                                                         ;A7A949;
    AND.W #$F7FF                                                         ;A7A94C; >.< $57FF
    AND.W #$DFFF                                                         ;A7A94F;
    AND.W #$7FFF                                                         ;A7A952;
    STA.W EnemyData.properties,X                                         ;A7A955;
    RTS                                                                  ;A7A958;


InitAI_Kraid:
    SEP #$20                                                             ;A7A959;
    LDA.B #$A7                                                           ;A7A95B;
    STA.W $0606                                                          ;A7A95D;
    LDA.B #$A7                                                           ;A7A960;
    STA.W $0603                                                          ;A7A962;
    REP #$20                                                             ;A7A965;
    LDA.W #UnpauseHook_KraidIsAlive                                      ;A7A967;
    STA.W $0604                                                          ;A7A96A;
    LDA.W #PauseHook_Kraid                                               ;A7A96D;
    STA.W $0601                                                          ;A7A970;
    JSR.W CheckIfKraidHasDied                                            ;A7A973;
    BNE .dead                                                            ;A7A976;
    JMP.W .alive                                                         ;A7A978;


.dead:
    LDX.W #$00C0                                                         ;A7A97B;
    LDY.W #$0000                                                         ;A7A97E;

.loopBGPalette6:
    LDA.W Palette_KraidRoomBackground,Y                                  ;A7A981;
    STA.L $7EC200,X                                                      ;A7A984;
    INX                                                                  ;A7A988;
    INX                                                                  ;A7A989;
    INY                                                                  ;A7A98A;
    INY                                                                  ;A7A98B;
    CPY.W #$0020                                                         ;A7A98C;
    BMI .loopBGPalette6                                                  ;A7A98F;
    LDX.W #$07FE                                                         ;A7A991;
    LDA.W #$0338                                                         ;A7A994;

.loopBG2Tilemap:
    STA.L $7E2000,X                                                      ;A7A997;
    DEX                                                                  ;A7A99B;
    DEX                                                                  ;A7A99C;
    BPL .loopBG2Tilemap                                                  ;A7A99D;
    LDA.W #$0000                                                         ;A7A99F;
    STA.L $7E7804                                                        ;A7A9A2;
    LDX.W $0330                                                          ;A7A9A6;
    LDA.W #$0200                                                         ;A7A9A9;
    STA.B $D0,X                                                          ;A7A9AC;
    LDA.W #Tiles_KraidRoomBackground                                     ;A7A9AE;
    STA.B $D2,X                                                          ;A7A9B1;
    SEP #$20                                                             ;A7A9B3;
    LDA.B #Tiles_KraidRoomBackground>>16                                 ;A7A9B5;
    STA.B $D4,X                                                          ;A7A9B7;
    REP #$20                                                             ;A7A9B9;
    LDA.B $5D                                                            ;A7A9BB;
    AND.W #$000F                                                         ;A7A9BD;
    XBA                                                                  ;A7A9C0;
    CLC                                                                  ;A7A9C1;
    ADC.W #$3F00                                                         ;A7A9C2;
    STA.B $D5,X                                                          ;A7A9C5;
    TXA                                                                  ;A7A9C7;
    CLC                                                                  ;A7A9C8;
    ADC.W #$0007                                                         ;A7A9C9;
    STA.W $0330                                                          ;A7A9CC;
    JSR.W SpawnPLMToClearTheCeiling                                      ;A7A9CF;
    JSR.W SpawnPLMToClearTheSpikes                                       ;A7A9D2;
    LDA.W #Function_Kraid_FadeInRegularBG_ClearBG2TilemapTopHalf         ;A7A9D5;
    STA.W $0FA8                                                          ;A7A9D8;
    RTL                                                                  ;A7A9DB;


.alive:
    SEP #$20                                                             ;A7A9DC;
    LDA.B #$43                                                           ;A7A9DE;
    STA.B $59                                                            ;A7A9E0;
    REP #$20                                                             ;A7A9E2;
    LDA.W #$0002                                                         ;A7A9E4;
    STA.W $0941                                                          ;A7A9E7;
    LDA.W #$0000                                                         ;A7A9EA;
    STA.L $7ECD20                                                        ;A7A9ED;
    LDA.W #$0001                                                         ;A7A9F1;
    STA.L $7ECD22                                                        ;A7A9F4;
    LDA.W #$0144                                                         ;A7A9F8;
    STA.L $7E7808                                                        ;A7A9FB;
    LDX.W #$0000                                                         ;A7A9FF;
    LDA.W $0F8C                                                          ;A7AA02;
    LSR A                                                                ;A7AA05;
    LSR A                                                                ;A7AA06;
    LSR A                                                                ;A7AA07;
    STA.B $12                                                            ;A7AA08;

.loopKraidHealth:
    STA.L $7E780C,X                                                      ;A7AA0A;
    CLC                                                                  ;A7AA0E;
    ADC.B $12                                                            ;A7AA0F;
    INX                                                                  ;A7AA11;
    INX                                                                  ;A7AA12;
    CPX.W #$0010                                                         ;A7AA13;
    BMI .loopKraidHealth                                                 ;A7AA16;
    LDA.W #$DFFF                                                         ;A7AA18;
    STA.B $12                                                            ;A7AA1B;
    LDX.W $0E54                                                          ;A7AA1D;
    JSR.W SetupKraidGFXWithTheTilePriorityCleared                        ;A7AA20;
    LDA.W $0F8C                                                          ;A7AA23;
    LSR A                                                                ;A7AA26;
    LSR A                                                                ;A7AA27;
    STA.L $7E7820                                                        ;A7AA28;
    CLC                                                                  ;A7AA2C;
    ADC.L $7E7820                                                        ;A7AA2D;
    STA.L $7E7822                                                        ;A7AA31;
    CLC                                                                  ;A7AA35;
    ADC.L $7E7820                                                        ;A7AA36;
    STA.L $7E7824                                                        ;A7AA3A;
    CLC                                                                  ;A7AA3E;
    ADC.L $7E7820                                                        ;A7AA3F;
    STA.L $7E7826                                                        ;A7AA43;
    LDA.W #$0000                                                         ;A7AA47;
    STA.L $7E783E                                                        ;A7AA4A;
    LDA.W #$00B0                                                         ;A7AA4E;
    STA.W $0F7A                                                          ;A7AA51;
    LDA.W #$0250                                                         ;A7AA54;
    STA.W $0F7E                                                          ;A7AA57;
    LDA.W $0F86                                                          ;A7AA5A;
    ORA.W #$0400                                                         ;A7AA5D;
    STA.W $0F86                                                          ;A7AA60;
    LDA.W #Function_Kraid_RestrictSamusXPositionToFirstScreen            ;A7AA63;
    STA.W $0FA8                                                          ;A7AA66;
    LDA.W #$012C                                                         ;A7AA69;
    STA.W $0FB2                                                          ;A7AA6C;
    LDA.W #Function_Kraid_RaiseThruFloor_LoadTilemapTopHalf              ;A7AA6F;
    STA.L $7E7800                                                        ;A7AA72;
    LDA.W #$0040                                                         ;A7AA76;
    STA.W $0FAC                                                          ;A7AA79;
    JSL.L DisableMinimap_MarkBossRoomTilesExplored                       ;A7AA7C;
    LDX.W #$003E                                                         ;A7AA80;
    LDA.W #$0338                                                         ;A7AA83;

.loopKraidGFX:
    STA.L $7E2FC0,X                                                      ;A7AA86;
    DEX                                                                  ;A7AA8A;
    DEX                                                                  ;A7AA8B;
    BPL .loopKraidGFX                                                    ;A7AA8C;
    LDA.W #$0005                                                         ;A7AA8E;
    STA.W $183E                                                          ;A7AA91;
    LDX.W #$0000                                                         ;A7AA94;

.loopSpritePalette3:
    LDA.W .spritePalette3,X                                              ;A7AA97;
    STA.L $7EC360,X                                                      ;A7AA9A;
    INX                                                                  ;A7AA9E;
    INX                                                                  ;A7AA9F;
    CPX.W #$0020                                                         ;A7AAA0;
    BMI .loopSpritePalette3                                              ;A7AAA3;
    RTL                                                                  ;A7AAA5;


.spritePalette3:
    dw $0000,$0000,$0000,$0000,$0000,$0DF6,$0D92,$0CEC                   ;A7AAA6;
    dw $0CA9,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;A7AAB6;

SetupKraidGFXWithTheTilePriorityCleared:
    SEP #$20                                                             ;A7AAC6;
    LDA.B #$38                                                           ;A7AAC8;
    STA.L $000047                                                        ;A7AACA;
    LDA.B #$FA                                                           ;A7AACE;
    STA.L $000048                                                        ;A7AAD0;
    LDA.B #$B9                                                           ;A7AAD4;
    STA.L $000049                                                        ;A7AAD6;
    LDA.B #$00                                                           ;A7AADA;
    STA.L $00004C                                                        ;A7AADC;
    LDA.B #$40                                                           ;A7AAE0;
    STA.L $00004D                                                        ;A7AAE2;
    JSL.L Decompression_VariableDestination                              ;A7AAE6;
    LDA.B #$3E                                                           ;A7AAEA;
    STA.L $000047                                                        ;A7AAEC;
    LDA.B #$FE                                                           ;A7AAF0;
    STA.L $000048                                                        ;A7AAF2;
    LDA.B #$B9                                                           ;A7AAF6;
    STA.L $000049                                                        ;A7AAF8;
    LDA.B #$00                                                           ;A7AAFC;
    STA.L $00004C                                                        ;A7AAFE;
    LDA.B #$20                                                           ;A7AB02;
    STA.L $00004D                                                        ;A7AB04;
    JSL.L Decompression_VariableDestination                              ;A7AB08;
    REP #$20                                                             ;A7AB0C;
    LDA.W #$0000                                                         ;A7AB0E;
    STA.L $7E782A                                                        ;A7AB11;
    STA.L $7E782C                                                        ;A7AB15;
    LDX.W #$0000                                                         ;A7AB19;

.loop0:
    LDA.L $7E2000,X                                                      ;A7AB1C;
    AND.W #$DFFF                                                         ;A7AB20;
    STA.L $7E2800,X                                                      ;A7AB23;
    INX                                                                  ;A7AB27;
    INX                                                                  ;A7AB28;
    CPX.W #$0600                                                         ;A7AB29;
    BMI .loop0                                                           ;A7AB2C;
    LDX.W #$0000                                                         ;A7AB2E;

.loop1:
    LDA.L $7E4000,X                                                      ;A7AB31;
    AND.B $12                                                            ;A7AB35;
    STA.L $7E2000,X                                                      ;A7AB37;
    INX                                                                  ;A7AB3B;
    INX                                                                  ;A7AB3C;
    CPX.W #$0800                                                         ;A7AB3D;
    BMI .loop1                                                           ;A7AB40;
    RTS                                                                  ;A7AB42;


InitAI_KraidArm:
    JSR.W CheckIfKraidHasDied                                            ;A7AB43;
    BNE .dead                                                            ;A7AB46;
    LDA.W $0F96                                                          ;A7AB48;
    STA.W $0FD6                                                          ;A7AB4B;
    LDA.W #RTL_A7BA2D                                                    ;A7AB4E;
    STA.W $0FE8                                                          ;A7AB51;
    LDA.W #InstList_KraidArm_RisingSinking                               ;A7AB54;
    STA.W $0FD2                                                          ;A7AB57;
    LDA.W #$0001                                                         ;A7AB5A;
    STA.W $0FD4                                                          ;A7AB5D;
    STZ.W $0FEA                                                          ;A7AB60;
    RTL                                                                  ;A7AB63;


.dead:
    JSR.W SetEnemyPropertiesToDead                                       ;A7AB64;
    RTL                                                                  ;A7AB67;


InitAI_KraidLintTop:
    JSR.W CheckIfKraidHasDied                                            ;A7AB68;
    BNE .dead                                                            ;A7AB6B;
    LDA.W $0F96                                                          ;A7AB6D;
    STA.W $1016                                                          ;A7AB70;
    LDA.W #$7FFF                                                         ;A7AB73;
    STA.W $1014                                                          ;A7AB76;
    LDA.W #InstList_KraidLint_Initial                                    ;A7AB79;
    STA.W $1012                                                          ;A7AB7C;
    LDA.W #Spritemap_KraidLint_Initial                                   ;A7AB7F;
    STA.W $100E                                                          ;A7AB82;
    LDA.W #RTL_A7B831                                                    ;A7AB85;
    STA.W $1028                                                          ;A7AB88;
    LDA.W #$7FFF                                                         ;A7AB8B;
    STA.W $1032                                                          ;A7AB8E;
    LDA.W #$0000                                                         ;A7AB91;
    STA.W $102C                                                          ;A7AB94;
    RTL                                                                  ;A7AB97;


.dead:
    JSR.W SetEnemyPropertiesToDead                                       ;A7AB98;
    RTL                                                                  ;A7AB9B;


InitAI_KraidLintMiddle:
    JSR.W CheckIfKraidHasDied                                            ;A7AB9C;
    BNE .dead                                                            ;A7AB9F;
    LDA.W $0F96                                                          ;A7ABA1;
    STA.W $1056                                                          ;A7ABA4;
    LDA.W #$7FFF                                                         ;A7ABA7;
    STA.W $1054                                                          ;A7ABAA;
    LDA.W #InstList_KraidLint_Initial                                    ;A7ABAD;
    STA.W $1052                                                          ;A7ABB0;
    LDA.W #Spritemap_KraidLint_Initial                                   ;A7ABB3;
    STA.W $104E                                                          ;A7ABB6;
    LDA.W #RTL_A7B831                                                    ;A7ABB9;
    STA.W $1068                                                          ;A7ABBC;
    LDA.W #$FFF0                                                         ;A7ABBF;
    STA.W $106C                                                          ;A7ABC2;
    RTL                                                                  ;A7ABC5;


.dead:
    JSR.W SetEnemyPropertiesToDead                                       ;A7ABC6;
    RTL                                                                  ;A7ABC9;


InitAI_KraidLintBottom:
    JSR.W CheckIfKraidHasDied                                            ;A7ABCA;
    BNE .dead                                                            ;A7ABCD;
    LDA.W $0F96                                                          ;A7ABCF;
    STA.W $1096                                                          ;A7ABD2;
    LDA.W #$7FFF                                                         ;A7ABD5;
    STA.W $1094                                                          ;A7ABD8;
    LDA.W #InstList_KraidLint_Initial                                    ;A7ABDB;
    STA.W $1092                                                          ;A7ABDE;
    LDA.W #Spritemap_KraidLint_Initial                                   ;A7ABE1;
    STA.W $108E                                                          ;A7ABE4;
    LDA.W #RTL_A7B831                                                    ;A7ABE7;
    STA.W $10A8                                                          ;A7ABEA;
    LDA.W #$FFF0                                                         ;A7ABED;
    STA.W $10AC                                                          ;A7ABF0;
    RTL                                                                  ;A7ABF3;


.dead:
    JSR.W SetEnemyPropertiesToDead                                       ;A7ABF4;
    RTL                                                                  ;A7ABF7;


InitAI_KraidFoot:
    JSR.W CheckIfKraidHasDied                                            ;A7ABF8;
    BNE .dead                                                            ;A7ABFB;
    LDA.W $0F96                                                          ;A7ABFD;
    STA.W $10D6                                                          ;A7AC00;
    LDA.W #InstList_KraidFoot_Initial                                    ;A7AC03;
    STA.W $10D2                                                          ;A7AC06;
    LDA.W #$0001                                                         ;A7AC09;
    STA.W $10D4                                                          ;A7AC0C;
    LDA.W #RTL_A7BA2D                                                    ;A7AC0F;
    STA.W $10E8                                                          ;A7AC12;
    LDA.W #$0000                                                         ;A7AC15;
    STA.L $7E7940                                                        ;A7AC18;
    RTL                                                                  ;A7AC1C;


.dead:
    JSR.W SetEnemyPropertiesToDead                                       ;A7AC1D;
    RTL                                                                  ;A7AC20;


MainAI_Kraid:
    JSR.W KraidsMouth_vs_Projectile_CollisionHandling                    ;A7AC21;
    JSR.W KraidPaletteHandling                                           ;A7AC24;
    JSR.W KraidBody_vs_Projectile_CollisionHandling                      ;A7AC27;
    JSR.W KraidBody_vs_Samus_CollisionHandling                           ;A7AC2A;
    LDX.W $0E54                                                          ;A7AC2D;
    LDA.B $B1                                                            ;A7AC30;
    SEC                                                                  ;A7AC32;
    SBC.W $091D                                                          ;A7AC33;
    SBC.W $0F7A                                                          ;A7AC36;
    ADC.W $0F82                                                          ;A7AC39;
    STA.B $B5                                                            ;A7AC3C;
    LDA.W $0915                                                          ;A7AC3E;
    SEC                                                                  ;A7AC41;
    SBC.W $0F7E                                                          ;A7AC42;
    ADC.W #$0098                                                         ;A7AC45;
    STA.B $B7                                                            ;A7AC48;
    JMP.W ($0FA8)                                                        ;A7AC4A;


Function_Kraid_KraidGetsBig_BreakCeilingIntoPlatforms:
    LDA.W $05B6                                                          ;A7AC4D;
    AND.W #$0007                                                         ;A7AC50;
    BNE .nonZeroCounter                                                  ;A7AC53;
    JSR.W SpawnRandomEarthquakeProjectile                                ;A7AC55;

.nonZeroCounter:
    LDY.W #$0001                                                         ;A7AC58;
    LDA.W $0F7E                                                          ;A7AC5B;
    BIT.W #$0002                                                         ;A7AC5E;
    BEQ +                                                                ;A7AC61;
    LDY.W #$FFFF                                                         ;A7AC63;

  + STY.B $12                                                            ;A7AC66;
    LDA.W $0F7A                                                          ;A7AC68;
    CLC                                                                  ;A7AC6B;
    ADC.B $12                                                            ;A7AC6C;
    STA.W $0F7A                                                          ;A7AC6E;
    DEC.W $0F7E                                                          ;A7AC71;
    LDA.W $0F7E                                                          ;A7AC74;
    AND.W #$0003                                                         ;A7AC77;
    BNE .done                                                            ;A7AC7A;
    LDX.W $0FB2                                                          ;A7AC7C;
    CPX.W #$0012                                                         ;A7AC7F;
    BPL .done                                                            ;A7AC82;
    LDA.W .XPositions,X                                                  ;A7AC84;
    LDY.W #EnemyProjectile_KraidCeilingRocks                             ;A7AC87;
    LDX.W $0E54                                                          ;A7AC8A;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A7AC8D;
    LDX.W $0FB2                                                          ;A7AC91;
    LDA.W .functionPointers,X                                            ;A7AC94;
    STA.B $12                                                            ;A7AC97;
    JMP.W ($0012)                                                        ;A7AC99;


.manualReturn:
    LDX.W $0FB2                                                          ;A7AC9C;
    INX                                                                  ;A7AC9F;
    INX                                                                  ;A7ACA0;
    STX.W $0FB2                                                          ;A7ACA1;

.done:
    LDA.W $0F7E                                                          ;A7ACA4;
    CMP.W #$0128                                                         ;A7ACA7;
    BPL .return                                                          ;A7ACAA;
    LDA.W #Function_Kraid_KraidGetsBig_SetBG2TilemapPriorityBits         ;A7ACAC;
    STA.W $0FA8                                                          ;A7ACAF;

.return:
    RTL                                                                  ;A7ACB2;


.XPositions:
    dw $0068,$00D8,$0028,$00A8,$0058,$00C8,$0038,$00B8                   ;A7ACB3;
    dw $0048                                                             ;A7ACC3;

.functionPointers:
    dw .spawnPLM4                                                        ;A7ACC5;
    dw .spawnPLM8                                                        ;A7ACC7;
    dw .spawnPLM0                                                        ;A7ACC9;
    dw .spawnPLM5                                                        ;A7ACCB;
    dw .spawnPLM3                                                        ;A7ACCD;
    dw .spawnPLM7                                                        ;A7ACCF;
    dw .spawnPLM1                                                        ;A7ACD1;
    dw .spawnPLM6                                                        ;A7ACD3;
    dw .spawnPLM2                                                        ;A7ACD5;

.spawnPLM0:
    JSL.L Spawn_Hardcoded_PLM                                            ;A7ACD7;
    db $02,$12                                                           ;A7ACDB;
    dw PLMEntries_crumbleKraidCeilingBlockIntoBackground1                ;A7ACDD;
    JMP.W .manualReturn                                                  ;A7ACDF;


.spawnPLM1:
    JSL.L Spawn_Hardcoded_PLM                                            ;A7ACE2;
    db $03,$12                                                           ;A7ACE6;
    dw PLMEntries_crumbleKraidCeilingBlockIntoBackground2                ;A7ACE8;
    JMP.W .manualReturn                                                  ;A7ACEA;


.spawnPLM2:
    JSL.L Spawn_Hardcoded_PLM                                            ;A7ACED;
    db $04,$12                                                           ;A7ACF1;
    dw PLMEntries_crumbleKraidCeilingBlockIntoBackground3                ;A7ACF3;
    JMP.W .manualReturn                                                  ;A7ACF5;


.spawnPLM3:
    JSL.L Spawn_Hardcoded_PLM                                            ;A7ACF8;
    db $05,$12                                                           ;A7ACFC;
    dw PLMEntries_crumbleKraidCeilingBlockIntoBackground2                ;A7ACFE;
    JMP.W .manualReturn                                                  ;A7AD00;


.spawnPLM4:
    JSL.L Spawn_Hardcoded_PLM                                            ;A7AD03;
    db $06,$12                                                           ;A7AD07;
    dw PLMEntries_crumbleKraidCeilingBlockIntoBackground3                ;A7AD09;
    JMP.W .manualReturn                                                  ;A7AD0B;


.spawnPLM5:
    JSL.L Spawn_Hardcoded_PLM                                            ;A7AD0E;
    db $0A,$12                                                           ;A7AD12;
    dw PLMEntries_crumbleKraidCeilingBlockIntoBackground3                ;A7AD14;
    JMP.W .manualReturn                                                  ;A7AD16;


.spawnPLM6:
    JSL.L Spawn_Hardcoded_PLM                                            ;A7AD19;
    db $0B,$12                                                           ;A7AD1D;
    dw PLMEntries_crumbleKraidCeilingBlockIntoBackground2                ;A7AD1F;
    JMP.W .manualReturn                                                  ;A7AD21;


.spawnPLM7:
    JSL.L Spawn_Hardcoded_PLM                                            ;A7AD24;
    db $0C,$12                                                           ;A7AD28;
    dw PLMEntries_crumbleKraidCeilingBlockIntoBackground3                ;A7AD2A;
    JMP.W .manualReturn                                                  ;A7AD2C;


.spawnPLM8:
    JSL.L Spawn_Hardcoded_PLM                                            ;A7AD2F;
    db $0D,$12                                                           ;A7AD33;
    dw PLMEntries_crumbleKraidCeilingBlockIntoBackground2                ;A7AD35;
    JMP.W .manualReturn                                                  ;A7AD37;


Function_Kraid_KraidGetsBig_SetBG2TilemapPriorityBits:
    LDX.W #$0000                                                         ;A7AD3A;

.loop:
    LDA.L $7E2000,X                                                      ;A7AD3D;
    ORA.W #$2000                                                         ;A7AD41;
    STA.L $7E2000,X                                                      ;A7AD44;
    INX                                                                  ;A7AD48;
    INX                                                                  ;A7AD49;
    CPX.W #$1000                                                         ;A7AD4A;
    BMI .loop                                                            ;A7AD4D;
    LDA.W $0FC6                                                          ;A7AD4F;
    AND.W #$FBFF                                                         ;A7AD52;
    STA.W $0FC6                                                          ;A7AD55;
    LDA.W #Function_Kraid_KraidGetsBig_FinishUpdatingBG2Tilemap          ;A7AD58;
    STA.W $0FA8                                                          ;A7AD5B;
    JMP.W UpdateBG2TilemapTopHalf                                        ;A7AD5E;


Function_Kraid_KraidGetsBig_FinishUpdatingBG2Tilemap:
    LDA.W #Function_Kraid_KraidGetsBig_DrawRoomBackground                ;A7AD61;
    STA.W $0FA8                                                          ;A7AD64;
    LDA.W #$0001                                                         ;A7AD67;
    STA.W $10D4                                                          ;A7AD6A;
    LDA.W #InstList_KraidFoot_KraidIsBig_Neutral                         ;A7AD6D;
    STA.W $10D2                                                          ;A7AD70;
    LDA.W #InstList_KraidLint_KraidIsBig                                 ;A7AD73;
    STA.W $1012                                                          ;A7AD76;
    STA.W $1052                                                          ;A7AD79;
    STA.W $1092                                                          ;A7AD7C;
    LDA.W #ExtendedSpritemap_KraidLint_KraidIsBig                        ;A7AD7F;
    STA.W $100E                                                          ;A7AD82;
    STA.W $104E                                                          ;A7AD85;
    STA.W $108E                                                          ;A7AD88;
    JMP.W UpdateBG2TilemapBottomHalf                                     ;A7AD8B;


Function_Kraid_KraidGetsBig_DrawRoomBackground:
    LDA.W #Function_Kraid_KraidGetsBig_FadeInRoomBackground              ;A7AD8E;
    STA.W $0FA8                                                          ;A7AD91;
    STZ.W $0FB0                                                          ;A7AD94;
    STZ.W $0FB2                                                          ;A7AD97; fallthrough to DrawKraidsRoomBackground

DrawKraidsRoomBackground:
    LDX.W #$00C0                                                         ;A7AD9A;
    LDY.W #$0000                                                         ;A7AD9D;

.loop:
    LDA.W Palette_KraidRoomBackground,Y                                  ;A7ADA0;
    STA.L $7EC200,X                                                      ;A7ADA3;
    INX                                                                  ;A7ADA7;
    INX                                                                  ;A7ADA8;
    INY                                                                  ;A7ADA9;
    INY                                                                  ;A7ADAA;
    CPY.W #$0020                                                         ;A7ADAB;
    BMI .loop                                                            ;A7ADAE;
    LDA.W #$0000                                                         ;A7ADB0;
    STA.L $7EC400                                                        ;A7ADB3;
    LDX.W $0330                                                          ;A7ADB7;
    LDA.W #$0200                                                         ;A7ADBA;
    STA.B $D0,X                                                          ;A7ADBD;
    LDA.W #Tiles_KraidRoomBackground                                     ;A7ADBF;
    STA.B $D2,X                                                          ;A7ADC2;
    SEP #$20                                                             ;A7ADC4;
    LDA.B #Tiles_KraidRoomBackground>>16                                 ;A7ADC6;
    STA.B $D4,X                                                          ;A7ADC8;
    REP #$20                                                             ;A7ADCA;
    LDA.B $5D                                                            ;A7ADCC;
    AND.W #$000F                                                         ;A7ADCE;
    XBA                                                                  ;A7ADD1;
    CLC                                                                  ;A7ADD2;
    ADC.W #$3F00                                                         ;A7ADD3;
    STA.B $D5,X                                                          ;A7ADD6;
    TXA                                                                  ;A7ADD8;
    CLC                                                                  ;A7ADD9;
    ADC.W #$0007                                                         ;A7ADDA;
    STA.W $0330                                                          ;A7ADDD;
    RTL                                                                  ;A7ADE0;


SetupKraidGetsBig_Thinking:
    LDA.W #Function_Kraid_KraidGetsBig_Thinking                          ;A7ADE1;
    STA.W $0FA8                                                          ;A7ADE4;
    BRA SetLintYPositionsAndRandomThinkingTimer                          ;A7ADE7;


SetupKraidMainLoop_Thinking:
    LDA.W #Function_Kraid_MainLoop_Thinking                              ;A7ADE9;
    STA.W $0FA8                                                          ;A7ADEC;

SetLintYPositionsAndRandomThinkingTimer:
    LDA.W $0F7E                                                          ;A7ADEF;
    SEC                                                                  ;A7ADF2;
    SBC.W #$0014                                                         ;A7ADF3;
    STA.W $0FFE                                                          ;A7ADF6;
    LDA.W $0F7E                                                          ;A7ADF9;
    CLC                                                                  ;A7ADFC;
    ADC.W #$002E                                                         ;A7ADFD;
    STA.W $103E                                                          ;A7AE00;
    LDA.W $0F7E                                                          ;A7AE03;
    CLC                                                                  ;A7AE06;
    ADC.W #$0070                                                         ;A7AE07;
    STA.W $107E                                                          ;A7AE0A;
    LDA.W $05E5                                                          ;A7AE0D;
    AND.W #$0007                                                         ;A7AE10;
    BNE .multiplyBy40                                                    ;A7AE13;
    LDA.W #$0002                                                         ;A7AE15;

.multiplyBy40:
    ASL A                                                                ;A7AE18;
    ASL A                                                                ;A7AE19;
    ASL A                                                                ;A7AE1A;
    ASL A                                                                ;A7AE1B;
    ASL A                                                                ;A7AE1C;
    ASL A                                                                ;A7AE1D;
    STA.L $7E7806                                                        ;A7AE1E;
    RTS                                                                  ;A7AE22;


Function_Kraid_KraidGetsBig_FadeInRoomBackground:
    REP #$30                                                             ;A7AE23;
    JSL.L Advance_GradualColorChange_ofBGPalette6                        ;A7AE25;
    BCS .reachedTargetColor                                              ;A7AE29;
    RTL                                                                  ;A7AE2B;


.reachedTargetColor:
    JSR.W SetupKraidGetsBig_Thinking                                     ;A7AE2C;
    LDX.W #$0080                                                         ;A7AE2F;
    LDA.W KraidLint_InitialFunctionTimers_top                            ;A7AE32;
    JSR.W EnableKraidLints                                               ;A7AE35;
    LDX.W #$00C0                                                         ;A7AE38;
    LDA.W KraidLint_InitialFunctionTimers_middle                         ;A7AE3B;
    JSR.W EnableKraidLints                                               ;A7AE3E;
    LDX.W #$0100                                                         ;A7AE41;
    LDA.W KraidLint_InitialFunctionTimers_bottom                         ;A7AE44;
    JSR.W EnableKraidLints                                               ;A7AE47;
    LDA.W #Function_KraidNail_Initialize                                 ;A7AE4A;
    STA.L $7E7980                                                        ;A7AE4D;
    STA.L $7E79C0                                                        ;A7AE51;
    LDA.W #Function_Kraid_HandleFunctionTimer                            ;A7AE55;
    STA.W $1128                                                          ;A7AE58;
    STA.W $1168                                                          ;A7AE5B;
    LDA.W #$0040                                                         ;A7AE5E;
    STA.W $1132                                                          ;A7AE61;
    LDA.W #$0080                                                         ;A7AE64;
    STA.W $1172                                                          ;A7AE67;
    LDA.W #$0001                                                         ;A7AE6A;
    STA.W $0FEC                                                          ;A7AE6D;
    LDA.W #InstList_Kraid_Roar_1                                         ;A7AE70;
    STA.W $0FAA                                                          ;A7AE73;
    LDA.W #$0120                                                         ;A7AE76;
    STA.L $7E781E                                                        ;A7AE79;
    LDA.W #Function_KraidFoot_Phase2Setup_WalkToStartingPoint            ;A7AE7D;
    STA.W $10E8                                                          ;A7AE80;
    LDA.W #$0001                                                         ;A7AE83;
    STA.W $10D4                                                          ;A7AE86;
    LDA.W #InstList_KraidFoot_KraidIsBig_WalkingBackwards_0              ;A7AE89;
    STA.W $10D2                                                          ;A7AE8C;
    RTL                                                                  ;A7AE8F;


EnableKraidLints:
    STA.W EnemyData.work5,X                                              ;A7AE90;
    LDA.W #Function_KraidNail_HorizontallyAlignEnemyToKraid              ;A7AE93;
    STA.W EnemyData.work0,X                                              ;A7AE96;
    LDA.W #Function_KraidLint_ProduceLint                                ;A7AE99;
    STA.L $7E7800,X                                                      ;A7AE9C;
    STZ.W EnemyData.work1,X                                              ;A7AEA0;
    RTS                                                                  ;A7AEA3;


Function_Kraid_MainLoop_Thinking:
    LDA.L $7E7806                                                        ;A7AEA4;
    BEQ .return                                                          ;A7AEA8;
    DEC A                                                                ;A7AEAA;
    STA.L $7E7806                                                        ;A7AEAB;
    BNE .return                                                          ;A7AEAF;
    LDA.W #Function_KraidMainLoop_AttackingWithMouthOpen                 ;A7AEB1;
    STA.W $0FA8                                                          ;A7AEB4;
    LDA.W #InstList_Kraid_Roar_1                                         ;A7AEB7;
    STA.W $0FAA                                                          ;A7AEBA;
    LDA.W InstList_Kraid_Roar_0                                          ;A7AEBD;
    STA.W $0FAC                                                          ;A7AEC0;

.return:
    RTL                                                                  ;A7AEC3;


Function_Kraid_KraidGetsBig_Thinking:
    LDA.L $7E7806                                                        ;A7AEC4;
    BEQ .return                                                          ;A7AEC8;
    DEC A                                                                ;A7AECA;
    STA.L $7E7806                                                        ;A7AECB;
    BNE .return                                                          ;A7AECF;
    LDA.W #Function_Kraid_KraidShot_KraidsMouthIsOpen                    ;A7AED1;
    STA.W $0FA8                                                          ;A7AED4;
    LDA.W #InstList_Kraid_Roar_1                                         ;A7AED7;
    STA.W $0FAA                                                          ;A7AEDA;
    LDA.W InstList_Kraid_Roar_0                                          ;A7AEDD;
    STA.W $0FAC                                                          ;A7AEE0;

.return:
    RTL                                                                  ;A7AEE3;


Function_Kraid_KraidShot_KraidsMouthIsOpen:
    JSR.W KraidInstListHandling                                          ;A7AEE4;
    CMP.W #$FFFF                                                         ;A7AEE7;
    BNE .return                                                          ;A7AEEA;
    LDA.W #Function_Kraid_MainLoop_Thinking                              ;A7AEEC;
    STA.W $0FA8                                                          ;A7AEEF;
    LDA.W #$005A                                                         ;A7AEF2;
    STA.W $0FAC                                                          ;A7AEF5;
    LDA.L $7E780A                                                        ;A7AEF8;
    BIT.W #$0004                                                         ;A7AEFC;
    BEQ .done                                                            ;A7AEFF;
    SEC                                                                  ;A7AF01;
    SBC.W #$0100                                                         ;A7AF02;
    STA.L $7E780A                                                        ;A7AF05;
    AND.W #$FF00                                                         ;A7AF09;
    BEQ .done                                                            ;A7AF0C;
    LDA.W #Function_Kraid_HandleFunctionTimer                            ;A7AF0E;
    STA.W $0FA8                                                          ;A7AF11;
    LDA.W #$0040                                                         ;A7AF14;
    STA.W $0FB2                                                          ;A7AF17;
    LDA.W #Function_Kraid_KraidShot_InitializeEyeGlowing                 ;A7AF1A;
    STA.L $7E7800                                                        ;A7AF1D;
    LDA.W #$0002                                                         ;A7AF21;
    STA.L $7E7802                                                        ;A7AF24;

.return:
    RTL                                                                  ;A7AF28;


.done:
    LDA.W #$0000                                                         ;A7AF29;
    STA.L $7E780A                                                        ;A7AF2C;
    BRA .return                                                          ;A7AF30;


KraidInstListHandling:
    LDA.W $0FAC                                                          ;A7AF32;
    BEQ .return                                                          ;A7AF35;
    DEC.W $0FAC                                                          ;A7AF37;
    BEQ ProcessKraidInstList                                             ;A7AF3A;

.return:
    RTS                                                                  ;A7AF3C;


ProcessKraidInstList:
    LDX.W $0FAA                                                          ;A7AF3D;
    LDA.W $0000,X                                                        ;A7AF40;
    CMP.W #$FFFF                                                         ;A7AF43;
    BEQ .return                                                          ;A7AF46;
    BMI .ASMInstruction                                                  ;A7AF48;
    STA.W $0FAC                                                          ;A7AF4A;
    TXA                                                                  ;A7AF4D;
    CLC                                                                  ;A7AF4E;
    ADC.W #$0008                                                         ;A7AF4F;
    STA.W $0FAA                                                          ;A7AF52;
    LDA.W $0002,X                                                        ;A7AF55;
    TAY                                                                  ;A7AF58;
    PHX                                                                  ;A7AF59;
    LDX.W $0330                                                          ;A7AF5A;
    LDA.W #$02C0                                                         ;A7AF5D;
    STA.B $D0,X                                                          ;A7AF60;
    INX                                                                  ;A7AF62;
    INX                                                                  ;A7AF63;
    STY.B $D0,X                                                          ;A7AF64;
    INX                                                                  ;A7AF66;
    INX                                                                  ;A7AF67;
    SEP #$20                                                             ;A7AF68;
    LDA.B #$A7                                                           ;A7AF6A;
    STA.B $D0,X                                                          ;A7AF6C;
    REP #$20                                                             ;A7AF6E;
    INX                                                                  ;A7AF70;
    LDA.B $59                                                            ;A7AF71;
    AND.W #$00FC                                                         ;A7AF73;
    XBA                                                                  ;A7AF76;
    STA.B $D0,X                                                          ;A7AF77;
    INX                                                                  ;A7AF79;
    INX                                                                  ;A7AF7A;
    STX.W $0330                                                          ;A7AF7B;
    PLX                                                                  ;A7AF7E;
    LDA.W #$0001                                                         ;A7AF7F;

.return:
    RTS                                                                  ;A7AF82;


.ASMInstruction:
    STA.B $12                                                            ;A7AF83;
    JMP.W ($0012)                                                        ;A7AF85;


ProcessNextKraidInstruction:
    LDA.W $0FAA                                                          ;A7AF88;
    CLC                                                                  ;A7AF8B;
    ADC.W #$0002                                                         ;A7AF8C;
    STA.W $0FAA                                                          ;A7AF8F;
    BRA ProcessKraidInstList                                             ;A7AF92;


Instruction_Kraid_PlayRoarSFX:
    PHX                                                                  ;A7AF94;
    LDA.W #$002D                                                         ;A7AF95;
    JSL.L QueueSound_Lib2_Max6                                           ;A7AF98;
    PLX                                                                  ;A7AF9C;
    BRA ProcessNextKraidInstruction                                      ;A7AF9D;


Instruction_Kraid_PlayDyingSFX:
    PHX                                                                  ;A7AF9F;
    LDA.W #$002E                                                         ;A7AFA0;
    JSL.L QueueSound_Lib2_Max15                                          ;A7AFA3;
    PLX                                                                  ;A7AFA7;
    BRA ProcessNextKraidInstruction                                      ;A7AFA8;


KraidsMouth_vs_Projectile_CollisionHandling:
    REP #$30                                                             ;A7AFAA;
    PHX                                                                  ;A7AFAC;
    LDA.W $0FA8                                                          ;A7AFAD;
    CMP.W #KraidDeath_SinkThroughFloor                                   ;A7AFB0;
    BMI .notDying                                                        ;A7AFB3;
    PLX                                                                  ;A7AFB5;
    RTS                                                                  ;A7AFB6;


.notDying:
    LDA.W $0FAA                                                          ;A7AFB7;
    SEC                                                                  ;A7AFBA;
    SBC.W #$0008                                                         ;A7AFBB;
    TAX                                                                  ;A7AFBE;
    LDA.W $0006,X                                                        ;A7AFBF;
    CMP.W #$FFFF                                                         ;A7AFC2;
    BNE .notTerminator                                                   ;A7AFC5;
    LDY.W #$0000                                                         ;A7AFC7;
    JMP.W .noProjectiles                                                 ;A7AFCA;


.notTerminator:
    TAX                                                                  ;A7AFCD;
    LDA.W #$0001                                                         ;A7AFCE;
    STA.W $0FB0                                                          ;A7AFD1;
    LDY.W #$0000                                                         ;A7AFD4;
    LDA.W $0000,X                                                        ;A7AFD7;
    CLC                                                                  ;A7AFDA;
    ADC.W $0F7A                                                          ;A7AFDB;
    STA.B $16                                                            ;A7AFDE;
    LDA.W $0002,X                                                        ;A7AFE0;
    CLC                                                                  ;A7AFE3;
    ADC.W $0F7E                                                          ;A7AFE4;
    STA.B $14                                                            ;A7AFE7;
    LDA.W $0006,X                                                        ;A7AFE9;
    CLC                                                                  ;A7AFEC;
    ADC.W $0F7E                                                          ;A7AFED;
    STA.B $12                                                            ;A7AFF0;
    LDA.W $0CCE                                                          ;A7AFF2;
    BEQ .noProjectiles                                                   ;A7AFF5;
    ASL A                                                                ;A7AFF7;
    TAX                                                                  ;A7AFF8;

.loop:
    LDA.W $0B78,X                                                        ;A7AFF9;
    SEC                                                                  ;A7AFFC;
    SBC.W $0BC8,X                                                        ;A7AFFD;
    DEC A                                                                ;A7B000;
    CMP.B $12                                                            ;A7B001;
    BPL .next                                                            ;A7B003;
    LDA.W $0B78,X                                                        ;A7B005;
    CLC                                                                  ;A7B008;
    ADC.W $0BC8,X                                                        ;A7B009;
    CMP.B $14                                                            ;A7B00C;
    BMI .next                                                            ;A7B00E;
    LDA.W $0B64,X                                                        ;A7B010;
    CLC                                                                  ;A7B013;
    ADC.W $0BB4,X                                                        ;A7B014;
    CMP.B $16                                                            ;A7B017;
    BMI .next                                                            ;A7B019;
    LDA.W $0C18,X                                                        ;A7B01B;
    BIT.W #$0F00                                                         ;A7B01E;
    BNE .notBeam                                                         ;A7B021;
    BIT.W #$0010                                                         ;A7B023;
    BEQ .next                                                            ;A7B026;
    LDA.L $7E780A                                                        ;A7B028;
    ORA.W #$0001                                                         ;A7B02C;
    STA.L $7E780A                                                        ;A7B02F;

.notBeam:
    PHX                                                                  ;A7B033;
    TXA                                                                  ;A7B034;
    LSR A                                                                ;A7B035;
    STA.W $18A6                                                          ;A7B036;
    PHP                                                                  ;A7B039;
    JSL.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External     ;A7B03A;
    PLP                                                                  ;A7B03E;
    PLX                                                                  ;A7B03F;
    LDA.W $0C04,X                                                        ;A7B040;
    ORA.W #$0010                                                         ;A7B043;
    STA.W $0C04,X                                                        ;A7B046;
    LDY.W #$0001                                                         ;A7B049;

.next:
    DEX                                                                  ;A7B04C;
    DEX                                                                  ;A7B04D;
    BPL .loop                                                            ;A7B04E;

.noProjectiles:
    PLX                                                                  ;A7B050;
    CPY.W #$0000                                                         ;A7B051;
    BNE .collision                                                       ;A7B054;
    RTS                                                                  ;A7B056;


.collision:
    LDA.W #$0006                                                         ;A7B057;
    STA.L $7E782A                                                        ;A7B05A;
    LDA.W #$0002                                                         ;A7B05E;
    STA.L $7E782C                                                        ;A7B061;
    LDA.L $7E780A                                                        ;A7B065;
    BIT.W #$0002                                                         ;A7B069;
    BEQ .notChargedBeam                                                  ;A7B06C;
    ORA.W #$0004                                                         ;A7B06E;
    STA.L $7E780A                                                        ;A7B071;

.notChargedBeam:
    LDA.W $0F8C                                                          ;A7B075;
    CMP.W #$0001                                                         ;A7B078;
    BMI .dead                                                            ;A7B07B;
    RTS                                                                  ;A7B07D;


.dead:
    LDA.W $0FA8                                                          ;A7B07E;
    CMP.W #KraidDeath_Initialize                                         ;A7B081;
    BPL .return                                                          ;A7B084;
    LDA.W #KraidDeath_Initialize                                         ;A7B086;
    STA.W $0FA8                                                          ;A7B089;
    LDA.W #$0000                                                         ;A7B08C;
    STA.L $7E780A                                                        ;A7B08F;
    LDA.W $0F86                                                          ;A7B093;
    ORA.W #$0400                                                         ;A7B096;
    STA.W $0F86                                                          ;A7B099;
    LDA.W #$DFFF                                                         ;A7B09C;
    STA.B $12                                                            ;A7B09F;
    JSR.W SetupKraidGFXWithTheTilePriorityCleared                        ;A7B0A1;
    LDX.W #$0000                                                         ;A7B0A4;

.loopSetIntangible:
    LDA.W EnemyData.properties,X                                         ;A7B0A7;
    ORA.W #$0400                                                         ;A7B0AA;
    STA.W EnemyData.properties,X                                         ;A7B0AD;
    TXA                                                                  ;A7B0B0;
    CLC                                                                  ;A7B0B1;
    ADC.W #$0040                                                         ;A7B0B2;
    TAX                                                                  ;A7B0B5;
    CPX.W #$0180                                                         ;A7B0B6;
    BMI .loopSetIntangible                                               ;A7B0B9;
    LDA.W $0FAA                                                          ;A7B0BB;
    CMP.W #InstList_Kraid_DyingRoar_0                                    ;A7B0BE;
    BPL .return                                                          ;A7B0C1;
    CLC                                                                  ;A7B0C3;
    ADC.W #$003C                                                         ;A7B0C4;
    STA.W $0FAA                                                          ;A7B0C7;

.return:
    RTS                                                                  ;A7B0CA;


SpawnExplosionProjectile:
    LDA.W $0B64,X                                                        ;A7B0CB;
    STA.B $12                                                            ;A7B0CE;
    LDA.W $0B78,X                                                        ;A7B0D0;
    STA.B $14                                                            ;A7B0D3;
    LDA.W $0C18,X                                                        ;A7B0D5;
    LDY.W #$001D                                                         ;A7B0D8;
    BIT.W #$0200                                                         ;A7B0DB;
    BNE .superMissile                                                    ;A7B0DE;
    LDY.W #$0006                                                         ;A7B0E0;

.superMissile:
    TYA                                                                  ;A7B0E3;
    LDY.W #EnemyProjectile_MiscDust                                      ;A7B0E4;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A7B0E7;
    LDA.W #$003D                                                         ;A7B0EB;
    JSL.L QueueSound_Lib1_Max6                                           ;A7B0EE;
    RTS                                                                  ;A7B0F2;


KraidBody_vs_Samus_CollisionHandling:
    LDA.W $0FA8                                                          ;A7B0F3;
    CMP.W #KraidDeath_Initialize                                         ;A7B0F6;
    BPL .return0                                                         ;A7B0F9;
    LDA.W $0AF6                                                          ;A7B0FB;
    CLC                                                                  ;A7B0FE;
    ADC.W $0AFE                                                          ;A7B0FF;
    STA.B $12                                                            ;A7B102;
    LDA.W $0AFA                                                          ;A7B104;
    SEC                                                                  ;A7B107;
    SBC.W $0F7E                                                          ;A7B108;
    LDX.W #$0000                                                         ;A7B10B;

.loop:
    CMP.W HitboxDefinitionTable_KraidBody_bottom,X                       ;A7B10E;
    BPL +                                                                ;A7B111;
    CMP.W HitboxDefinitionTable_KraidBody_top,X                          ;A7B113;
    BPL +                                                                ;A7B116;
    INX                                                                  ;A7B118;
    INX                                                                  ;A7B119;
    INX                                                                  ;A7B11A;
    INX                                                                  ;A7B11B;
    BRA .loop                                                            ;A7B11C;


  + LDA.W HitboxDefinitionTable_KraidBody_left,X                         ;A7B11E;
    CLC                                                                  ;A7B121;
    ADC.W $0F7A                                                          ;A7B122;
    SEC                                                                  ;A7B125;
    SBC.B $12                                                            ;A7B126;
    BPL .return1                                                         ;A7B128;
    LDA.W $0AF6                                                          ;A7B12A;
    CMP.W #$0028                                                         ;A7B12D;
    BMI .lessThan28                                                      ;A7B130;
    SEC                                                                  ;A7B132;
    SBC.W #$0008                                                         ;A7B133;
    STA.W $0AF6                                                          ;A7B136;
    STA.W $0B10                                                          ;A7B139;

.lessThan28:
    LDA.W $0AFA                                                          ;A7B13C;
    SEC                                                                  ;A7B13F;
    SBC.W #$0008                                                         ;A7B140;
    CMP.L $7E7808                                                        ;A7B143;
    BPL +                                                                ;A7B147;
    LDA.L $7E7808                                                        ;A7B149;

  + STA.W $0AFA                                                          ;A7B14D;
    STA.W $0B14                                                          ;A7B150;
    JSR.W PushSamusBack                                                  ;A7B153;
    LDA.W $18A8                                                          ;A7B156;
    BNE .return1                                                         ;A7B159;
    JSL.L NormalEnemyTouchAI                                             ;A7B15B;

.return0:
    RTS                                                                  ;A7B15F;


.return1:
    RTS                                                                  ;A7B160;


HitboxDefinitionTable_KraidBody_bottom:
    dw $03FF                                                             ;A7B161;

HitboxDefinitionTable_KraidBody_left:
    dw $FFD0                                                             ;A7B163;

HitboxDefinitionTable_KraidBody_top:
    dw $0010,$FFD0,$0000,$FFE0,$FFE0,$FFE8,$FFD0,$FFF8                   ;A7B165;
    dw $FFB0,$0000,$FF90,$0008,$8000,$0008                               ;A7B175;

KraidBody_vs_Projectile_CollisionHandling:
    PHX                                                                  ;A7B181;
    LDA.W $0FA8                                                          ;A7B182;
    CMP.W #KraidDeath_SinkThroughFloor                                   ;A7B185;
    BMI .lessThanC537                                                    ;A7B188;
    PLX                                                                  ;A7B18A;
    RTS                                                                  ;A7B18B;


.lessThanC537:
    STZ.W $0FB0                                                          ;A7B18C;
    LDA.L $7E780A                                                        ;A7B18F;
    AND.W #$FFFE                                                         ;A7B193;
    STA.L $7E780A                                                        ;A7B196;
    STZ.B $30                                                            ;A7B19A;
    LDA.W $0FAA                                                          ;A7B19C;
    SEC                                                                  ;A7B19F;
    SBC.W #$0008                                                         ;A7B1A0;
    TAX                                                                  ;A7B1A3;
    LDA.W $0004,X                                                        ;A7B1A4;
    TAX                                                                  ;A7B1A7;
    LDA.W $0000,X                                                        ;A7B1A8;
    CLC                                                                  ;A7B1AB;
    ADC.W $0F7A                                                          ;A7B1AC;
    STA.B $16                                                            ;A7B1AF;
    LDA.W $0002,X                                                        ;A7B1B1;
    CLC                                                                  ;A7B1B4;
    ADC.W $0F7E                                                          ;A7B1B5;
    STA.B $14                                                            ;A7B1B8;
    LDA.W $0006,X                                                        ;A7B1BA;
    CLC                                                                  ;A7B1BD;
    ADC.W $0F7E                                                          ;A7B1BE;
    STA.B $12                                                            ;A7B1C1;
    LDA.W $0CCE                                                          ;A7B1C3;
    BEQ .noProjectiles                                                   ;A7B1C6;
    ASL A                                                                ;A7B1C8;
    TAX                                                                  ;A7B1C9;

.loop:
    LDA.W $0B78,X                                                        ;A7B1CA;
    SEC                                                                  ;A7B1CD;
    SBC.W $0BC8,X                                                        ;A7B1CE;
    DEC A                                                                ;A7B1D1;
    CMP.B $12                                                            ;A7B1D2;
    BPL .body                                                            ;A7B1D4;
    LDA.W $0B78,X                                                        ;A7B1D6;
    CLC                                                                  ;A7B1D9;
    ADC.W $0BC8,X                                                        ;A7B1DA;
    CMP.B $14                                                            ;A7B1DD;
    BMI .next                                                            ;A7B1DF;
    LDA.W $0B64,X                                                        ;A7B1E1;
    CLC                                                                  ;A7B1E4;
    ADC.W $0BB4,X                                                        ;A7B1E5;
    CMP.B $16                                                            ;A7B1E8;
    BMI .next                                                            ;A7B1EA;

.hit:
    JSR.W SpawnExplosionProjectile                                       ;A7B1EC;
    LDA.W $0C04,X                                                        ;A7B1EF;
    ORA.W #$0010                                                         ;A7B1F2;
    STA.W $0C04,X                                                        ;A7B1F5;
    LDA.W $0C18,X                                                        ;A7B1F8;
    BIT.W #$0010                                                         ;A7B1FB;
    BEQ +                                                                ;A7B1FE;
    LDA.L $7E780A                                                        ;A7B200;
    ORA.W #$0001                                                         ;A7B204;
    STA.L $7E780A                                                        ;A7B207;

  + INC.B $30                                                            ;A7B20B;

.next:
    DEX                                                                  ;A7B20D;
    DEX                                                                  ;A7B20E;
    BPL .loop                                                            ;A7B20F;

.noProjectiles:
    PLX                                                                  ;A7B211;
    LDY.B $30                                                            ;A7B212;
    CPY.W #$0000                                                         ;A7B214;
    BEQ .return                                                          ;A7B217;
    LDA.W $0FA8                                                          ;A7B219;
    CMP.W #Function_Kraid_MainLoop_Thinking                              ;A7B21C;
    BNE .return                                                          ;A7B21F;
    LDA.W #Function_Kraid_KraidShot_InitializeEyeGlowing                 ;A7B221;
    STA.W $0FA8                                                          ;A7B224;
    LDA.L $7E780A                                                        ;A7B227;
    BIT.W #$0001                                                         ;A7B22B;
    BEQ .return                                                          ;A7B22E;
    ORA.W #$0302                                                         ;A7B230;
    STA.L $7E780A                                                        ;A7B233;

.return:
    RTS                                                                  ;A7B237;


.body:
    LDA.W $0B64,X                                                        ;A7B238;
    CLC                                                                  ;A7B23B;
    ADC.W $0BB4,X                                                        ;A7B23C;
    STA.B $12                                                            ;A7B23F;
    LDA.W $0B78,X                                                        ;A7B241;
    SEC                                                                  ;A7B244;
    SBC.W $0F7E                                                          ;A7B245;
    LDY.W #$0000                                                         ;A7B248;

.loopBody:
    CMP.W HitboxDefinitionTable_KraidBody_bottom,Y                       ;A7B24B;
    BPL +                                                                ;A7B24E;
    CMP.W HitboxDefinitionTable_KraidBody_top,Y                          ;A7B250;
    BPL +                                                                ;A7B253;
    INY                                                                  ;A7B255;
    INY                                                                  ;A7B256;
    INY                                                                  ;A7B257;
    INY                                                                  ;A7B258;
    BRA .loopBody                                                        ;A7B259;


  + LDA.W HitboxDefinitionTable_KraidBody_left,Y                         ;A7B25B;
    CLC                                                                  ;A7B25E;
    ADC.W $0F7A                                                          ;A7B25F;
    SEC                                                                  ;A7B262;
    SBC.B $12                                                            ;A7B263;
    BPL .next                                                            ;A7B265;
    BRA .hit                                                             ;A7B267;


UNUSED_HandleProjectileDamageAndSound:
    PHX                                                                  ;A7B269;
    PHY                                                                  ;A7B26A;
    TXY                                                                  ;A7B26B;
    LDX.W $0E54                                                          ;A7B26C;
    LDA.W $0C2C,Y                                                        ;A7B26F;
    STA.W $187A                                                          ;A7B272;
    LDA.W $0C18,Y                                                        ;A7B275;
    STA.B $12                                                            ;A7B278;
    LDA.W $0C18,Y                                                        ;A7B27A;
    BIT.W #$0018                                                         ;A7B27D;
    BEQ .notPlasmaOrCharge                                               ;A7B280;
    LDA.W #$0010                                                         ;A7B282;
    STA.W $0FA0                                                          ;A7B285;

.notPlasmaOrCharge:
    LDX.W $0F78                                                          ;A7B288;
    LDA.L $A0003C,X                                                      ;A7B28B;
    BNE .vulnerabilities                                                 ;A7B28F;
    LDA.W #EnemyVulnerabilities                                          ;A7B291;

.vulnerabilities:
    STA.B $14                                                            ;A7B294;
    LDA.B $12                                                            ;A7B296;
    BIT.W #$0F00                                                         ;A7B298;
    BNE .notBeam                                                         ;A7B29B;
    AND.W #$00FF                                                         ;A7B29D;
    CLC                                                                  ;A7B2A0;
    ADC.B $14                                                            ;A7B2A1;
    TAX                                                                  ;A7B2A3;
    LDA.L $B40000,X                                                      ;A7B2A4;
    BRA .determinedVulnerability                                         ;A7B2A8;


.notBeam:
    AND.W #$0F00                                                         ;A7B2AA;
    CMP.W #$0100                                                         ;A7B2AD;
    BEQ .superMissile                                                    ;A7B2B0;
    CMP.W #$0200                                                         ;A7B2B2;
    BNE .missileEnd                                                      ;A7B2B5;

.superMissile:
    XBA                                                                  ;A7B2B7;
    CLC                                                                  ;A7B2B8;
    ADC.B $14                                                            ;A7B2B9;
    TAX                                                                  ;A7B2BB;
    LDA.L $B4000B,X                                                      ;A7B2BC;
    BRA .determinedVulnerability                                         ;A7B2C0;


.missileEnd:
    CMP.W #$0300                                                         ;A7B2C2;
    BNE .notPowerBomb                                                    ;A7B2C5;
    LDX.B $14                                                            ;A7B2C7;
    LDA.L $B4000E,X                                                      ;A7B2C9;
    BRA .determinedVulnerability                                         ;A7B2CD;


.notPowerBomb:
    CMP.W #$0500                                                         ;A7B2CF;
    BNE .return                                                          ;A7B2D2;
    LDX.B $14                                                            ;A7B2D4;
    LDA.L $B4000F,X                                                      ;A7B2D6;

.determinedVulnerability:
    AND.W #$00FF                                                         ;A7B2DA;
    STA.W $0E32                                                          ;A7B2DD;
    BEQ .return                                                          ;A7B2E0;
    LDA.W $187A                                                          ;A7B2E2;
    LSR A                                                                ;A7B2E5;
    STA.W HW_WRMPYA                                                      ;A7B2E6;
    SEP #$20                                                             ;A7B2E9;
    LDA.W $0E32                                                          ;A7B2EB;
    STA.W HW_WRMPYB                                                      ;A7B2EE;
    NOP                                                                  ;A7B2F1;
    NOP                                                                  ;A7B2F2;
    NOP                                                                  ;A7B2F3;
    NOP                                                                  ;A7B2F4;
    NOP                                                                  ;A7B2F5;
    REP #$20                                                             ;A7B2F6;
    LDA.W HW_RDMPY                                                       ;A7B2F8;
    BEQ .return                                                          ;A7B2FB;
    STA.W $187A                                                          ;A7B2FD;
    LDA.W $0F8C                                                          ;A7B300;
    SEC                                                                  ;A7B303;
    SBC.W $187A                                                          ;A7B304;
    LDA.W $0F8C                                                          ;A7B307;
    SEC                                                                  ;A7B30A;
    SBC.W $187A                                                          ;A7B30B;
    STA.W $0F8C                                                          ;A7B30E;
    LDA.W $0FB0                                                          ;A7B311;
    BEQ .tripleDamageEnd                                                 ;A7B314;
    LDA.W $0F8C                                                          ;A7B316;
    SEC                                                                  ;A7B319;
    SBC.W $187A                                                          ;A7B31A;
    SEC                                                                  ;A7B31D;
    SBC.W $187A                                                          ;A7B31E;
    BPL .storeHealth                                                     ;A7B321;
    LDA.W #$0000                                                         ;A7B323;

.storeHealth:
    STA.W $0F8C                                                          ;A7B326;

.tripleDamageEnd:
    LDX.W $0F78                                                          ;A7B329;
    LDA.L $A0000E,X                                                      ;A7B32C;
    JSL.L QueueSound_Lib2_Max6                                           ;A7B330;

.return:
    PLY                                                                  ;A7B334;
    PLX                                                                  ;A7B335;
    RTS                                                                  ;A7B336;


KraidPaletteHandling:
    PHX                                                                  ;A7B337;
    PHY                                                                  ;A7B338;
    LDA.W $0F8C                                                          ;A7B339;
    CMP.W #$0001                                                         ;A7B33C;
    BPL .alive                                                           ;A7B33F;
    STA.L $7E782A                                                        ;A7B341;
    BRA +                                                                ;A7B345;


.alive:
    LDA.L $7E782A                                                        ;A7B347;
    BEQ .return                                                          ;A7B34B;
    LDA.L $7E782C                                                        ;A7B34D;
    DEC A                                                                ;A7B351;
    STA.L $7E782C                                                        ;A7B352;
    BNE .return                                                          ;A7B356;
    LDA.W #$0002                                                         ;A7B358;
    STA.L $7E782C                                                        ;A7B35B;
    LDA.L $7E782A                                                        ;A7B35F;
    DEC A                                                                ;A7B363;
    STA.L $7E782A                                                        ;A7B364;

  + JSR.W KraidHurtFlashHandling                                         ;A7B368;
    JSR.W KraidHealthBasedPaletteHandling                                ;A7B36B;

.return:
    PLY                                                                  ;A7B36E;
    PLX                                                                  ;A7B36F;
    RTS                                                                  ;A7B370;


KraidHurtFlashHandling:
    LDY.W #$0000                                                         ;A7B371;
    LDA.L $7E782A                                                        ;A7B374;
    BIT.W #$0001                                                         ;A7B378;
    BNE .loopSetup                                                       ;A7B37B;
    LDY.W #$0020                                                         ;A7B37D;

.loopSetup:
    LDX.W #$0000                                                         ;A7B380;

.loop:
    LDA.W Palette_Kraid_Sprite_HurtFlash,Y                               ;A7B383;
    STA.L $7EC1E0,X                                                      ;A7B386;
    INX                                                                  ;A7B38A;
    INX                                                                  ;A7B38B;
    INY                                                                  ;A7B38C;
    INY                                                                  ;A7B38D;
    CPX.W #$0020                                                         ;A7B38E;
    BMI .loop                                                            ;A7B391;
    RTS                                                                  ;A7B393;


KraidHealthBasedPaletteHandling:
    LDY.W #$0000                                                         ;A7B394;
    LDA.L $7E782A                                                        ;A7B397;
    BIT.W #$0001                                                         ;A7B39B;
    BNE .hurtFlashFrame                                                  ;A7B39E;
    LDX.W #$000E                                                         ;A7B3A0;
    LDA.W $0F8C                                                          ;A7B3A3;

.loop:
    CMP.L $7E780C,X                                                      ;A7B3A6;
    BPL .getIndex                                                        ;A7B3AA;
    DEX                                                                  ;A7B3AC;
    DEX                                                                  ;A7B3AD;
    BNE .loop                                                            ;A7B3AE;

.getIndex:
    INX                                                                  ;A7B3B0;
    INX                                                                  ;A7B3B1;
    TXA                                                                  ;A7B3B2;
    ASL A                                                                ;A7B3B3;
    ASL A                                                                ;A7B3B4;
    ASL A                                                                ;A7B3B5;
    ASL A                                                                ;A7B3B6;
    TAY                                                                  ;A7B3B7;

.hurtFlashFrame:
    LDX.W #$0000                                                         ;A7B3B8;

.loopPalette:
    LDA.W Palette_Kraid_BG_HurtFlash,Y                                   ;A7B3BB;
    STA.L $7EC0E0,X                                                      ;A7B3BE;
    LDA.W Palette_Kraid_Sprite_HurtFlash,Y                               ;A7B3C2;
    STA.L $7EC1E0,X                                                      ;A7B3C5;
    INY                                                                  ;A7B3C9;
    INY                                                                  ;A7B3CA;
    INX                                                                  ;A7B3CB;
    INX                                                                  ;A7B3CC;
    CPX.W #$0020                                                         ;A7B3CD;
    BMI .loopPalette                                                     ;A7B3D0;
    RTS                                                                  ;A7B3D2;


Palette_Kraid_BG_HurtFlash:
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF                   ;A7B3D3;
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF                   ;A7B3D3;

Palette_Kraid_BG_1_8:
    dw $0000,$559D,$1816,$100D,$127A,$0E17,$0DD3,$0970                   ;A7B3F3;
    dw $092D,$04CA,$0486,$0023,$0443,$3E52,$4AD5,$0000                   ;A7B403;

Palette_Kraid_BG_2_8:
    dw $3800,$559D,$1816,$100D,$1A9B,$1637,$11F3,$0D8F                   ;A7B413;
    dw $0D4C,$08E9,$04A6,$0043,$0443,$4273,$52F6,$0000                   ;A7B423;

Palette_Kraid_BG_3_8:
    dw $3800,$559D,$1816,$100D,$22DB,$1A77,$1A12,$15AE                   ;A7B433;
    dw $116C,$0D09,$08A6,$0444,$0423,$4A94,$5B38,$0000                   ;A7B443;

Palette_Kraid_BG_4_8:
    dw $3800,$559D,$1816,$100D,$2AFC,$2297,$1E32,$19CD                   ;A7B453;
    dw $158B,$1128,$08C6,$0464,$0423,$4EB5,$6359,$0000                   ;A7B463;

Palette_Kraid_BG_5_8:
    dw $3800,$559D,$1816,$100D,$331D,$2AB7,$2A91,$1E0C                   ;A7B473;
    dw $19AA,$1148,$0CE5,$0484,$0023,$52B5,$677B,$0000                   ;A7B483;

Palette_Kraid_BG_6_8:
    dw $3800,$559D,$1816,$100D,$3B3E,$32D7,$32B0,$222B                   ;A7B493;
    dw $1DC9,$1567,$0D05,$04A4,$0023,$56D6,$6F9C,$0000                   ;A7B4A3;

Palette_Kraid_BG_7_8:
    dw $3800,$559D,$1816,$100D,$437E,$3717,$32B0,$2A4A                   ;A7B4B3;
    dw $21E9,$1987,$1105,$08A5,$0003,$5EF7,$77DE,$0000                   ;A7B4C3;

Palette_Kraid_BG_8_8:
    dw $3800,$559D,$1816,$100D,$4B9F,$3F37,$36D0,$2E69                   ;A7B4D3;
    dw $2608,$1DA6,$1125,$08C5,$0003,$6318,$7FFF,$0000                   ;A7B4E3;

Palette_Kraid_Death:
    dw $3800,$0807,$0404,$0000,$127A,$0E17,$0DD3,$0970                   ;A7B4F3;
    dw $092D,$04CA,$0486,$0023,$0443,$3E52,$4AD5,$0000                   ;A7B503;

Palette_Kraid_Sprite_HurtFlash:
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF                   ;A7B513;
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF                   ;A7B523;

Palette_Kraid_Sprite_1_8:
    dw $0000,$559D,$1816,$100D,$127A,$0E17,$0DD3,$0970                   ;A7B533;
    dw $092D,$04CA,$0486,$0023,$0443,$3E52,$4AD5,$0000                   ;A7B543;

Palette_Kraid_Sprite_2_8:
    dw $3800,$559D,$1816,$100D,$1A9B,$1637,$11F3,$0D8F                   ;A7B553;
    dw $0D4C,$08E9,$04A6,$0043,$0443,$4273,$52F6,$0000                   ;A7B563;

Palette_Kraid_Sprite_3_8:
    dw $3800,$559D,$1816,$100D,$22DB,$1A77,$1A12,$15AE                   ;A7B573;
    dw $116C,$0D09,$08A6,$0444,$0423,$4A94,$5B38,$0000                   ;A7B583;

Palette_Kraid_Sprite_4_8:
    dw $3800,$559D,$1816,$100D,$2AFC,$2297,$1E32,$19CD                   ;A7B593;
    dw $158B,$1128,$08C6,$0464,$0423,$4EB5,$6359,$0000                   ;A7B5A3;

Palette_Kraid_Sprite_5_8:
    dw $3800,$559D,$1816,$100D,$331D,$2AB7,$2A91,$1E0C                   ;A7B5B3;
    dw $19AA,$1148,$0CE5,$0484,$0023,$52B5,$677B,$0000                   ;A7B5C3;

Palette_Kraid_Sprite_6_8:
    dw $3800,$559D,$1816,$100D,$3B3E,$32D7,$32B0,$222B                   ;A7B5D3;
    dw $1DC9,$1567,$0D05,$04A4,$0023,$56D6,$6F9C,$0000                   ;A7B5E3;

Palette_Kraid_Sprite_7_8:
    dw $3800,$559D,$1816,$100D,$437E,$3717,$32B0,$2A4A                   ;A7B5F3;
    dw $21E9,$1987,$1105,$08A5,$0003,$5EF7,$77DE,$0000                   ;A7B603;

Palette_Kraid_Sprite_8_8:
    dw $3800,$559D,$1816,$100D,$4B9F,$3F37,$36D0,$2E69                   ;A7B613;
    dw $2608,$1DA6,$1125,$08C5,$0003,$6318,$7FFF,$0000                   ;A7B623;

Instruction_Kraid_NOP_A7B633:
    PHX                                                                  ;A7B633;
    PLX                                                                  ;A7B634;
    RTL                                                                  ;A7B635;


Instruction_Kraid_DecrementYPosition:
    PHX                                                                  ;A7B636;
    DEC.W $0F7E                                                          ;A7B637;
    PLX                                                                  ;A7B63A;
    RTL                                                                  ;A7B63B;


Instruction_Kraid_IncrementYPosition_SetScreenShaking:
    PHX                                                                  ;A7B63C;
    INC.W $0F7E                                                          ;A7B63D;
    LDA.W #$0001                                                         ;A7B640;
    STA.W $183E                                                          ;A7B643;
    LDA.W #$000A                                                         ;A7B646;
    STA.W $1840                                                          ;A7B649;
    PLX                                                                  ;A7B64C;
    RTL                                                                  ;A7B64D;


Instruction_Kraid_QueueSFX76_Lib2_Max6:
    PHX                                                                  ;A7B64E;
    PHY                                                                  ;A7B64F;
    LDA.W #$0076                                                         ;A7B650;
    JSL.L QueueSound_Lib2_Max6                                           ;A7B653;
    PLY                                                                  ;A7B657;
    PLX                                                                  ;A7B658;
    RTL                                                                  ;A7B659;


Instruction_Kraid_XPositionMinus3:
    PHX                                                                  ;A7B65A;
    LDA.W $0F7A                                                          ;A7B65B;
    SEC                                                                  ;A7B65E;
    SBC.W KraidForwardsSpeed                                             ;A7B65F;
    STA.W $0F7A                                                          ;A7B662;
    PLX                                                                  ;A7B665;
    RTL                                                                  ;A7B666;


Instruction_Kraid_XPositionMinus3_duplicate:
    PHX                                                                  ;A7B667;
    LDA.W $0F7A                                                          ;A7B668;
    SEC                                                                  ;A7B66B;
    SBC.W KraidForwardsSpeed                                             ;A7B66C;
    STA.W $0F7A                                                          ;A7B66F;
    PLX                                                                  ;A7B672;
    RTL                                                                  ;A7B673;


Instruction_Kraid_XPositionPlus3:
    PHX                                                                  ;A7B674;
    PHY                                                                  ;A7B675;
    LDA.W KraidBackwardsSpeed                                            ;A7B676;
    CLC                                                                  ;A7B679;
    ADC.W $0F7A                                                          ;A7B67A;
    STA.W $0F7A                                                          ;A7B67D;
    PLY                                                                  ;A7B680;
    PLX                                                                  ;A7B681;
    RTL                                                                  ;A7B682;


UNUSED_Instruction_Kraid_MoveRight_A7B683:
    PHX                                                                  ;A7B683;
    PHY                                                                  ;A7B684;
    LDA.W $0F7A                                                          ;A7B685;
    CMP.W #$0140                                                         ;A7B688;
    BMI .leftScreen                                                      ;A7B68B;
    LDA.L $7E781E                                                        ;A7B68D;
    DEC A                                                                ;A7B691;
    STA.L $7E781E                                                        ;A7B692;
    BNE .return                                                          ;A7B696;

.leftScreen:
    LDX.W #$0000                                                         ;A7B698;
    STZ.B $12                                                            ;A7B69B;
    LDA.W UNUSED_KraidBackwardsFastSpeed_A7A922                          ;A7B69D;
    STA.B $14                                                            ;A7B6A0;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A7B6A2;
    BCS .collision                                                       ;A7B6A6;

.return:
    PLY                                                                  ;A7B6A8;
    PLX                                                                  ;A7B6A9;
    RTL                                                                  ;A7B6AA;


.collision:
    LDA.W #$0000                                                         ;A7B6AB;
    STA.W $183E                                                          ;A7B6AE;
    LDA.W #$0007                                                         ;A7B6B1;
    STA.W $1840                                                          ;A7B6B4;
    LDA.W $0F7A                                                          ;A7B6B7;
    STA.W $10BA                                                          ;A7B6BA;
    BRA .return                                                          ;A7B6BD;


Function_Kraid_KraidShot_InitializeEyeGlowing:
    LDA.W #Function_Kraid_KraidShot_KraidsMouthIsOpen                    ;A7B6BF;
    STA.W $0FA8                                                          ;A7B6C2;
    LDA.W #Function_Kraid_KraidShot_GlowEye                              ;A7B6C5;
    STA.W $0FA8                                                          ;A7B6C8;
    LDA.W #InstList_Kraid_EyeGlowing_1                                   ;A7B6CB;
    STA.W $0FAA                                                          ;A7B6CE;
    LDA.W InstList_Kraid_EyeGlowing_0                                    ;A7B6D1;
    STA.W $0FAC                                                          ;A7B6D4; fallthrough to Function_Kraid_KraidShot_GlowEye

Function_Kraid_KraidShot_GlowEye:
    PHX                                                                  ;A7B6D7;
    PHY                                                                  ;A7B6D8;
    JSR.W KraidInstListHandling                                          ;A7B6D9;
    CMP.W #$FFFF                                                         ;A7B6DC;
    BNE .notTerminator                                                   ;A7B6DF;
    LDA.W #$0100                                                         ;A7B6E1;
    LDA.W $0FAC                                                          ;A7B6E4;

.notTerminator:
    LDX.W #$00E2                                                         ;A7B6E7;
    LDY.W #$0000                                                         ;A7B6EA;

.loop:
    LDA.L $7EC000,X                                                      ;A7B6ED;
    AND.W #$001F                                                         ;A7B6F1;
    CLC                                                                  ;A7B6F4;
    ADC.W #$0001                                                         ;A7B6F5;
    CMP.W #$001F                                                         ;A7B6F8;
    BMI +                                                                ;A7B6FB;
    INY                                                                  ;A7B6FD;
    LDA.W #$001F                                                         ;A7B6FE;

  + STA.B $12                                                            ;A7B701;
    LDA.L $7EC000,X                                                      ;A7B703;
    AND.W #$03E0                                                         ;A7B707;
    CLC                                                                  ;A7B70A;
    ADC.W #$0020                                                         ;A7B70B;
    CMP.W #$03E0                                                         ;A7B70E;
    BMI +                                                                ;A7B711;
    INY                                                                  ;A7B713;
    LDA.W #$03E0                                                         ;A7B714;

  + STA.B $14                                                            ;A7B717;
    LDA.L $7EC000,X                                                      ;A7B719;
    AND.W #$FC00                                                         ;A7B71D;
    ORA.B $12                                                            ;A7B720;
    ORA.B $14                                                            ;A7B722;
    STA.L $7EC000,X                                                      ;A7B724;
    INX                                                                  ;A7B728;
    INX                                                                  ;A7B729;
    CPX.W #$00E8                                                         ;A7B72A;
    BMI .loop                                                            ;A7B72D;
    CPY.W #$0006                                                         ;A7B72F;
    BMI .return                                                          ;A7B732;
    LDA.W #Function_Kraid_KraidShot_UnglowEye                            ;A7B734;
    STA.W $0FA8                                                          ;A7B737;

.return:
    PLY                                                                  ;A7B73A;
    PLX                                                                  ;A7B73B;
    RTL                                                                  ;A7B73C;


Function_Kraid_KraidShot_UnglowEye:
    PHX                                                                  ;A7B73D;
    PHY                                                                  ;A7B73E;
    LDX.W #$000E                                                         ;A7B73F;
    LDA.W $0F8C                                                          ;A7B742;

.loopHealth:
    CMP.L $7E780C,X                                                      ;A7B745;
    BPL .getIndexY                                                       ;A7B749;
    DEX                                                                  ;A7B74B;
    DEX                                                                  ;A7B74C;
    BNE .loopHealth                                                      ;A7B74D;

.getIndexY:
    INX                                                                  ;A7B74F;
    INX                                                                  ;A7B750;
    TXA                                                                  ;A7B751;
    ASL A                                                                ;A7B752;
    ASL A                                                                ;A7B753;
    ASL A                                                                ;A7B754;
    ASL A                                                                ;A7B755;
    TAY                                                                  ;A7B756;
    LDX.W #$00E2                                                         ;A7B757;
    STZ.B $14                                                            ;A7B75A;

.loop:
    LDA.L $7EC000,X                                                      ;A7B75C;
    AND.W #$001F                                                         ;A7B760;
    STA.B $12                                                            ;A7B763;
    LDA.W Palette_Kraid_BG_HurtFlash+2,Y                                 ;A7B765;
    AND.W #$001F                                                         ;A7B768;
    CMP.B $12                                                            ;A7B76B;
    BEQ +                                                                ;A7B76D;
    INC.B $14                                                            ;A7B76F;
    LDA.L $7EC000,X                                                      ;A7B771;
    DEC A                                                                ;A7B775;
    STA.L $7EC000,X                                                      ;A7B776;

  + LDA.L $7EC000,X                                                      ;A7B77A;
    AND.W #$03E0                                                         ;A7B77E;
    STA.B $12                                                            ;A7B781;
    LDA.W Palette_Kraid_BG_HurtFlash+2,Y                                 ;A7B783;
    AND.W #$03E0                                                         ;A7B786;
    CMP.B $12                                                            ;A7B789;
    BEQ .next                                                            ;A7B78B;
    INC.B $14                                                            ;A7B78D;
    LDA.L $7EC000,X                                                      ;A7B78F;
    SEC                                                                  ;A7B793;
    SBC.W #$0020                                                         ;A7B794;
    STA.L $7EC000,X                                                      ;A7B797;

.next:
    INX                                                                  ;A7B79B;
    INX                                                                  ;A7B79C;
    INY                                                                  ;A7B79D;
    INY                                                                  ;A7B79E;
    CPX.W #$00E8                                                         ;A7B79F;
    BMI .loop                                                            ;A7B7A2;
    LDA.B $14                                                            ;A7B7A4;
    BNE .return                                                          ;A7B7A6;
    LDA.W #Function_Kraid_KraidShot_KraidsMouthIsOpen                    ;A7B7A8;
    STA.W $0FA8                                                          ;A7B7AB;
    LDA.W #InstList_Kraid_Roar_1                                         ;A7B7AE;
    STA.W $0FAA                                                          ;A7B7B1;
    LDA.W InstList_Kraid_Roar_0                                          ;A7B7B4;
    STA.W $0FAC                                                          ;A7B7B7;

.return:
    PLY                                                                  ;A7B7BA;
    PLX                                                                  ;A7B7BB;
    RTL                                                                  ;A7B7BC;


MainAI_KraidArm:
    LDA.W $0915                                                          ;A7B7BD;
    CLC                                                                  ;A7B7C0;
    ADC.W #$00E0                                                         ;A7B7C1;
    STA.B $12                                                            ;A7B7C4;
    LDA.W $0F7E                                                          ;A7B7C6;
    SEC                                                                  ;A7B7C9;
    SBC.W #$002C                                                         ;A7B7CA;
    STA.W $0FBE                                                          ;A7B7CD;
    TAY                                                                  ;A7B7D0;
    LDA.W $0FC6                                                          ;A7B7D1;
    ORA.W #$0100                                                         ;A7B7D4;
    CPY.W $0915                                                          ;A7B7D7;
    BMI +                                                                ;A7B7DA;
    CPY.B $12                                                            ;A7B7DC;
    BPL +                                                                ;A7B7DE;
    AND.W #$FEFF                                                         ;A7B7E0;

  + STA.W $0FC6                                                          ;A7B7E3;
    LDA.W $0F7A                                                          ;A7B7E6;
    CLC                                                                  ;A7B7E9;
    ADC.W #$0000                                                         ;A7B7EA;
    STA.W $0FBA                                                          ;A7B7ED;
    LDA.L $7E780A                                                        ;A7B7F0;
    BIT.W #$FF00                                                         ;A7B7F4;
    BEQ .return                                                          ;A7B7F7;
    LDA.W $0FD4                                                          ;A7B7F9;
    INC A                                                                ;A7B7FC;
    STA.W $0FD4                                                          ;A7B7FD;

.return:
    RTL                                                                  ;A7B800;


MainAI_KraidLintTop:
    LDX.W #$0080                                                         ;A7B801;
    LDA.W #$7FFF                                                         ;A7B804;
    STA.W EnemyData.instTimer,X                                          ;A7B807;
    JMP.W MainAI_KraidLintCommon                                         ;A7B80A;


MainAI_KraidLintMiddle:
    LDX.W #$00C0                                                         ;A7B80D;
    LDA.W #$7FFF                                                         ;A7B810;
    STA.W EnemyData.instTimer,X                                          ;A7B813;
    JMP.W MainAI_KraidLintCommon                                         ;A7B816;


MainAI_KraidLintBottom:
    LDX.W #$0100                                                         ;A7B819;
    LDA.W #$7FFF                                                         ;A7B81C;
    STA.W EnemyData.instTimer,X                                          ;A7B81F;

MainAI_KraidLintCommon:
    JSR.W KraidLint_vs_Samus_CollisionHandling                           ;A7B822;
    LDA.W $0915                                                          ;A7B825;
    CLC                                                                  ;A7B828;
    ADC.W #$00E0                                                         ;A7B829;
    STA.B $12                                                            ;A7B82C;
    JMP.W ($0FA8,X)                                                      ;A7B82E;

RTL_A7B831:
    RTL                                                                  ;A7B831;


Function_KraidLint_ProduceLint:
    LDA.W EnemyData.properties,X                                         ;A7B832;
    AND.W #$FEFF                                                         ;A7B835; >.< #$FAFF
    AND.W #$FBFF                                                         ;A7B838;
    STA.W EnemyData.properties,X                                         ;A7B83B;
    LDA.W $0F7A                                                          ;A7B83E;
    CLC                                                                  ;A7B841;
    ADC.W EnemyData.work2,X                                              ;A7B842;
    SEC                                                                  ;A7B845;
    SBC.W EnemyData.work1,X                                              ;A7B846;
    STA.W EnemyData.xPosition,X                                          ;A7B849;
    LDA.W EnemyData.work1,X                                              ;A7B84C;
    CLC                                                                  ;A7B84F;
    ADC.W #$0001                                                         ;A7B850;
    STA.W EnemyData.work1,X                                              ;A7B853;
    CMP.W #$0020                                                         ;A7B856;
    BMI .return                                                          ;A7B859;
    LDA.W #Function_KraidLint_ChargeLint                                 ;A7B85B;
    STA.W EnemyData.work0,X                                              ;A7B85E;
    LDA.W #$001E                                                         ;A7B861;
    STA.W EnemyData.work5,X                                              ;A7B864;

.return:
    RTL                                                                  ;A7B867;


Function_KraidLint_ChargeLint:
    LDY.W #$0000                                                         ;A7B868;
    LDA.W EnemyData.work5,X                                              ;A7B86B;
    BIT.W #$0001                                                         ;A7B86E;
    BEQ .zeroTimer                                                       ;A7B871;
    LDY.W #$0E00                                                         ;A7B873;

.zeroTimer:
    TYA                                                                  ;A7B876;
    STA.W EnemyData.palette,X                                            ;A7B877;
    LDA.W $0F7A                                                          ;A7B87A;
    CLC                                                                  ;A7B87D;
    ADC.W EnemyData.work2,X                                              ;A7B87E;
    SEC                                                                  ;A7B881;
    SBC.W EnemyData.work1,X                                              ;A7B882;
    STA.W EnemyData.xPosition,X                                          ;A7B885;
    DEC.W EnemyData.work5,X                                              ;A7B888;
    BNE .return                                                          ;A7B88B;
    LDA.W #Function_KraidLint_FireLint                                   ;A7B88D;
    STA.W EnemyData.work0,X                                              ;A7B890;
    LDA.W #$001F                                                         ;A7B893;
    JSL.L QueueSound_Lib3_Max6                                           ;A7B896;

.return:
    RTL                                                                  ;A7B89A;


Function_KraidLint_FireLint:
    LDA.W EnemyData.xSubPosition,X                                       ;A7B89B;
    SEC                                                                  ;A7B89E;
    SBC.W KraidLint_XSubSpeed                                            ;A7B89F;
    STA.W EnemyData.xSubPosition,X                                       ;A7B8A2;
    LDA.W EnemyData.xPosition,X                                          ;A7B8A5;
    SBC.W KraidLint_XSpeed                                               ;A7B8A8;
    STA.W EnemyData.xPosition,X                                          ;A7B8AB;
    CMP.W #$0038                                                         ;A7B8AE;
    BPL .greaterThanEqualTo38                                            ;A7B8B1;
    PHA                                                                  ;A7B8B3;
    LDA.W EnemyData.properties,X                                         ;A7B8B4;
    ORA.W #$0400                                                         ;A7B8B7;
    STA.W EnemyData.properties,X                                         ;A7B8BA;
    PLA                                                                  ;A7B8BD;

.greaterThanEqualTo38:
    CMP.W #$0020                                                         ;A7B8BE;
    BPL .greaterThanEqualTo20                                            ;A7B8C1;
    LDA.W EnemyData.properties,X                                         ;A7B8C3;
    ORA.W #$0100                                                         ;A7B8C6;
    STA.W EnemyData.properties,X                                         ;A7B8C9;
    LDA.W #Function_KraidNail_HorizontallyAlignEnemyToKraid              ;A7B8CC;
    STA.W EnemyData.work0,X                                              ;A7B8CF;
    LDA.W #$012C                                                         ;A7B8D2;
    STA.W EnemyData.work5,X                                              ;A7B8D5;
    LDA.W #Function_KraidLint_ProduceLint                                ;A7B8D8;
    STA.L $7E7800,X                                                      ;A7B8DB;
    STZ.W EnemyData.work1,X                                              ;A7B8DF;

.greaterThanEqualTo20:
    JSL.L CheckIfEnemyIsTouchingSamusFromBelow                           ;A7B8E2;
    AND.W #$FFFF                                                         ;A7B8E6;
    BEQ .return                                                          ;A7B8E9;
    LDA.W $0B56                                                          ;A7B8EB;
    SEC                                                                  ;A7B8EE;
    SBC.W KraidLint_XSubSpeed                                            ;A7B8EF;
    STA.W $0B56                                                          ;A7B8F2;
    LDA.W $0B58                                                          ;A7B8F5;
    SBC.W KraidLint_XSpeed                                               ;A7B8F8;
    CMP.W #$FFF0                                                         ;A7B8FB;
    BPL .storeExtraDisplacement                                          ;A7B8FE;
    LDA.W #$FFF0                                                         ;A7B900;

.storeExtraDisplacement:
    STA.W $0B58                                                          ;A7B903;

.return:
    RTL                                                                  ;A7B906;


Function_KraidNail_WaitUntilTopLintXPosition100Plus:
    LDA.W $0FFA                                                          ;A7B907;
    CMP.W #$0100                                                         ;A7B90A;
    BMI .return                                                          ;A7B90D;
    LDA.L $7E7800,X                                                      ;A7B90F;
    STA.W EnemyData.work0,X                                              ;A7B913;
    LDA.W EnemyData.properties,X                                         ;A7B916;
    AND.W #$FEFF                                                         ;A7B919; >.< #$FAFF
    AND.W #$FBFF                                                         ;A7B91C;
    STA.W EnemyData.properties,X                                         ;A7B91F;

.return:
    RTL                                                                  ;A7B922;


Function_KraidNail_HorizontallyAlignEnemyToKraid:
    LDA.W $0F7A                                                          ;A7B923;
    SEC                                                                  ;A7B926;
    SBC.W EnemyData.xHitboxRadius,X                                      ;A7B927;
    STA.W EnemyData.xPosition,X                                          ;A7B92A; fallthrough to Function_Kraid_HandleFunctionTimer

Function_Kraid_HandleFunctionTimer:
    LDA.W EnemyData.work5,X                                              ;A7B92D;
    BEQ .return                                                          ;A7B930;
    DEC.W EnemyData.work5,X                                              ;A7B932;
    BNE .return                                                          ;A7B935;
    LDA.L $7E7800,X                                                      ;A7B937;
    STA.W EnemyData.work0,X                                              ;A7B93B;

.return:
    RTL                                                                  ;A7B93E;


Function_KraidFoot_StartRetreat:
    LDX.W $0E54                                                          ;A7B93F;
    LDA.W EnemyData.work5,X                                              ;A7B942;
    BEQ .return                                                          ;A7B945;
    DEC.W EnemyData.work5,X                                              ;A7B947;
    BNE .return                                                          ;A7B94A;
    LDA.L $7E7800,X                                                      ;A7B94C;
    STA.W EnemyData.work0,X                                              ;A7B950;
    LDA.W #InstList_KraidFoot_KraidIsBig_WalkingBackwards_0              ;A7B953;
    STA.W EnemyData.pInstList,X                                          ;A7B956;
    LDA.W #$0001                                                         ;A7B959;
    STA.W EnemyData.instTimer,X                                          ;A7B95C;

.return:
    RTL                                                                  ;A7B95F;


Function_KraidFoot_Phase1_Thinking:
    JSR.W HandleKraidPhase1                                              ;A7B960;
    BRA Function_Kraid_HandleFunctionTimer                               ;A7B963;


Function_Kraid_ProcessKraidInstruction:
    JSR.W KraidInstListHandling                                          ;A7B965;
    BRA Function_Kraid_HandleFunctionTimer                               ;A7B968;


KraidLint_vs_Samus_CollisionHandling:
    LDA.W EnemyData.properties,X                                         ;A7B96A;
    BIT.W #$0400                                                         ;A7B96D;
    BEQ .notIntangible                                                   ;A7B970;
    RTS                                                                  ;A7B972;


.notIntangible:
    LDA.W $18A8                                                          ;A7B973;
    BNE .return                                                          ;A7B976;
    LDA.W EnemyData.xPosition,X                                          ;A7B978;
    CLC                                                                  ;A7B97B;
    ADC.W Hitbox_KraidLint+2                                             ;A7B97C;
    SEC                                                                  ;A7B97F;
    SBC.W #$0002                                                         ;A7B980;
    STA.B $12                                                            ;A7B983;
    LDA.W $0AF6                                                          ;A7B985;
    CLC                                                                  ;A7B988;
    ADC.W $0AFE                                                          ;A7B989;
    CMP.B $12                                                            ;A7B98C;
    BMI .return                                                          ;A7B98E;
    LDA.W $0AF6                                                          ;A7B990;
    SEC                                                                  ;A7B993;
    SBC.W $0AFE                                                          ;A7B994;
    CMP.B $12                                                            ;A7B997;
    BPL .return                                                          ;A7B999;
    LDA.W EnemyData.yPosition,X                                          ;A7B99B;
    CLC                                                                  ;A7B99E;
    ADC.W Hitbox_KraidLint+4                                             ;A7B99F;
    CLC                                                                  ;A7B9A2;
    ADC.W #$0002                                                         ;A7B9A3;
    STA.B $16                                                            ;A7B9A6;
    LDA.W $0AFA                                                          ;A7B9A8;
    CLC                                                                  ;A7B9AB;
    ADC.W $0B00                                                          ;A7B9AC;
    CMP.B $16                                                            ;A7B9AF;
    BMI .return                                                          ;A7B9B1;
    LDA.W EnemyData.yPosition,X                                          ;A7B9B3;
    CLC                                                                  ;A7B9B6;
    ADC.W Hitbox_KraidLint+8                                             ;A7B9B7;
    SEC                                                                  ;A7B9BA;
    SBC.W #$0002                                                         ;A7B9BB;
    STA.B $18                                                            ;A7B9BE;
    LDA.W $0AFA                                                          ;A7B9C0;
    SEC                                                                  ;A7B9C3;
    SBC.W $0B00                                                          ;A7B9C4;
    CMP.B $18                                                            ;A7B9C7;
    BPL .return                                                          ;A7B9C9;
    LDA.W $0AFE                                                          ;A7B9CB;
    CLC                                                                  ;A7B9CE;
    ADC.W #$0010                                                         ;A7B9CF;
    EOR.W #$FFFF                                                         ;A7B9D2;
    CLC                                                                  ;A7B9D5;
    ADC.W $0B58                                                          ;A7B9D6;
    CMP.W #$0010                                                         ;A7B9D9;
    BMI +                                                                ;A7B9DC;
    LDA.W #$0010                                                         ;A7B9DE;

  + STA.W $0B58                                                          ;A7B9E1;
    PHX                                                                  ;A7B9E4;
    PHP                                                                  ;A7B9E5;
    JSL.L NormalEnemyTouchAI                                             ;A7B9E6;
    PLP                                                                  ;A7B9EA;
    PLX                                                                  ;A7B9EB;
    LDA.W EnemyData.properties,X                                         ;A7B9EC;
    ORA.W #$0400                                                         ;A7B9EF;
    STA.W EnemyData.properties,X                                         ;A7B9F2;

.return:
    RTS                                                                  ;A7B9F5;


MainAI_KraidFoot:
    LDA.W $0F7A                                                          ;A7B9F6;
    STA.W $10BA                                                          ;A7B9F9;
    LDA.W $0F7E                                                          ;A7B9FC;
    CLC                                                                  ;A7B9FF;
    ADC.W #$0064                                                         ;A7BA00;
    STA.W $10BE                                                          ;A7BA03;
    TAY                                                                  ;A7BA06;
    SEC                                                                  ;A7BA07;
    SBC.W #$00E0                                                         ;A7BA08;
    TAX                                                                  ;A7BA0B;
    LDA.W $10C6                                                          ;A7BA0C;
    AND.W #$FEFF                                                         ;A7BA0F;
    CPY.W $0915                                                          ;A7BA12;
    BPL .offScreen                                                       ;A7BA15;
    ORA.W #$0100                                                         ;A7BA17;
    BRA +                                                                ;A7BA1A;


.offScreen:
    CPX.W $0915                                                          ;A7BA1C;
    BMI +                                                                ;A7BA1F;
    ORA.W #$0100                                                         ;A7BA21;

  + STA.W $10C6                                                          ;A7BA24;
    LDX.W $0E54                                                          ;A7BA27;
    JMP.W ($10E8)                                                        ;A7BA2A;


RTL_A7BA2D:
    RTL                                                                  ;A7BA2D;


Function_KraidFoot_Phase2_Thinking:
    LDA.L $7E7940                                                        ;A7BA2E;
    DEC A                                                                ;A7BA32;
    STA.L $7E7940                                                        ;A7BA33;
    BNE .return                                                          ;A7BA37;
    LDX.W #$0000                                                         ;A7BA39;

.loopXPositions:
    LDA.W $0F7A                                                          ;A7BA3C;
    CMP.W .XPosition,X                                                   ;A7BA3F;
    BEQ +                                                                ;A7BA42;
    INX                                                                  ;A7BA44;
    INX                                                                  ;A7BA45;
    INX                                                                  ;A7BA46;
    INX                                                                  ;A7BA47;
    CPX.W #$0018                                                         ;A7BA48;
    BMI .loopXPositions                                                  ;A7BA4B;
    LDX.W #$0004                                                         ;A7BA4D;

  + LDA.W $05E5                                                          ;A7BA50;
    AND.W #$001C                                                         ;A7BA53;
    CMP.W #$0010                                                         ;A7BA56;
    BMI +                                                                ;A7BA59;
    LDA.W #$0010                                                         ;A7BA5B;

  + CLC                                                                  ;A7BA5E;
    ADC.W .movementDataPointer,X                                         ;A7BA5F;
    TAX                                                                  ;A7BA62;
    LDA.W $0002,X                                                        ;A7BA63;
    TAY                                                                  ;A7BA66;
    LDA.W $0000,X                                                        ;A7BA67;
    CMP.W $0F7A                                                          ;A7BA6A;
    BPL .backwards                                                       ;A7BA6D;
    LDA.W $0000,X                                                        ;A7BA6F;
    JSR.W SetKraidWalkingForwards                                        ;A7BA72;
    RTL                                                                  ;A7BA75;


.backwards:
    LDA.W $0000,X                                                        ;A7BA76;
    JSR.W SetKraidWalkingBackwards                                       ;A7BA79;

.return:
    RTL                                                                  ;A7BA7C;


.XPosition:
    dw $00F0                                                             ;A7BA7D;

.movementDataPointer:
    dw .movementData0                                                    ;A7BA7F;
    dw $0160                                                             ;A7BA81;
    dw .movementData1                                                    ;A7BA83;
    dw $0180                                                             ;A7BA85;
    dw .movementData2                                                    ;A7BA87;
    dw $00D0                                                             ;A7BA89;
    dw .movementData3                                                    ;A7BA8B;
    dw $0140                                                             ;A7BA8D;
    dw .movementData4                                                    ;A7BA8F;
    dw $0170                                                             ;A7BA91;
    dw .movementData5                                                    ;A7BA93;

.movementData0:
    dw $0180,$0158,$0180,$0158,$00D0,$002C,$0170,$002C                   ;A7BA95;
    dw $0170,$002C                                                       ;A7BAA5;

.movementData1:
    dw $00F0,$0100,$0180,$0158,$00D0,$002C,$0140,$002C                   ;A7BAA9;
    dw $0170,$002C                                                       ;A7BAB9;

.movementData2:
    dw $00F0,$0100,$0160,$0158,$00D0,$002C,$0140,$002C                   ;A7BABD;
    dw $0170,$002C                                                       ;A7BACD;

.movementData3:
    dw $00F0,$0100,$0160,$0158,$0180,$0158,$0140,$002C                   ;A7BAD1;
    dw $0170,$002C                                                       ;A7BAE1;

.movementData4:
    dw $00F0,$0100,$0160,$0158,$0180,$0158,$00D0,$002C                   ;A7BAE5;
    dw $0170,$002C                                                       ;A7BAF5;

.movementData5:
    dw $00F0,$0100,$0180,$0158,$0170,$0158,$00D0,$002C                   ;A7BAF9;
    dw $0140,$002C                                                       ;A7BB09;

SetKraidWalkingBackwards:
    STA.L $7E781E                                                        ;A7BB0D;
    TYA                                                                  ;A7BB11;
    STA.L $7E7940                                                        ;A7BB12;
    LDA.W #Function_KraidFoot_Phase2_WalkingBackward                     ;A7BB16;
    STA.W $10E8                                                          ;A7BB19;
    LDA.W #$0001                                                         ;A7BB1C;
    STA.W $10D4                                                          ;A7BB1F;
    LDA.W #InstList_KraidFoot_KraidIsBig_WalkingBackwards_0              ;A7BB22;
    STA.W $10D2                                                          ;A7BB25;
    RTS                                                                  ;A7BB28;


SetKraidWalkingForwards:
    STA.L $7E781E                                                        ;A7BB29;
    TYA                                                                  ;A7BB2D;
    STA.L $7E7940                                                        ;A7BB2E;
    LDA.W #Function_KraidFoot_Phase2_WalkingForward                      ;A7BB32;
    STA.W $10E8                                                          ;A7BB35;
    LDA.W #$0001                                                         ;A7BB38;
    STA.W $10D4                                                          ;A7BB3B;
    LDA.W #InstList_KraidFoot_KraidIsBig_WalkingForward_0                ;A7BB3E;
    STA.W $10D2                                                          ;A7BB41;
    RTS                                                                  ;A7BB44;


Function_KraidFoot_Phase2_WalkingBackward:
    LDA.L $7E781E                                                        ;A7BB45;
    CMP.W $0F7A                                                          ;A7BB49;
    BEQ .walking                                                         ;A7BB4C;
    BPL .return                                                          ;A7BB4E;
    STA.W $0F7A                                                          ;A7BB50;

.walking:
    LDA.W $10D2                                                          ;A7BB53;
    CMP.W #InstList_KraidFoot_KraidIsBig_WalkingBackwards_1              ;A7BB56;
    BMI .return                                                          ;A7BB59;
    LDA.W #Function_KraidFoot_Phase2_Thinking                            ;A7BB5B;
    STA.W $10E8                                                          ;A7BB5E;
    LDA.W #$0001                                                         ;A7BB61;
    STA.W $10D4                                                          ;A7BB64;
    LDA.W #InstList_KraidFoot_KraidIsBig_Neutral                         ;A7BB67;
    STA.W $10D2                                                          ;A7BB6A;

.return:
    RTL                                                                  ;A7BB6D;


Function_KraidFoot_Phase2Setup_WalkToStartingPoint:
    LDA.L $7E781E                                                        ;A7BB6E;
    CMP.W $0F7A                                                          ;A7BB72;
    BEQ .walking                                                         ;A7BB75;
    BPL .return                                                          ;A7BB77;
    STA.W $0F7A                                                          ;A7BB79;

.walking:
    LDA.W $10D2                                                          ;A7BB7C;
    CMP.W #InstList_KraidFoot_KraidIsBig_WalkingBackwards_1              ;A7BB7F;
    BMI .return                                                          ;A7BB82;
    LDA.W #Function_Kraid_HandleFunctionTimer                            ;A7BB84;
    STA.W $10E8                                                          ;A7BB87;
    LDA.W #$00B4                                                         ;A7BB8A;
    STA.W $10F2                                                          ;A7BB8D;
    LDA.W #Function_KraidFoot_Phase2Setup_InitializePhase2               ;A7BB90;
    STA.L $7E7940                                                        ;A7BB93;
    LDA.W #$0001                                                         ;A7BB97;
    STA.W $10D4                                                          ;A7BB9A;
    LDA.W #InstList_KraidFoot_KraidIsBig_Neutral                         ;A7BB9D;
    STA.W $10D2                                                          ;A7BBA0;

.return:
    RTL                                                                  ;A7BBA3;


Function_KraidFoot_Phase2Setup_InitializePhase2:
    LDA.W #$0160                                                         ;A7BBA4;
    LDY.W #$00B4                                                         ;A7BBA7;
    JSR.W SetKraidWalkingBackwards                                       ;A7BBAA;
    RTL                                                                  ;A7BBAD;


Function_KraidFoot_Phase2_WalkingForward:
    LDA.L $7E781E                                                        ;A7BBAE;
    CMP.W $0F7A                                                          ;A7BBB2;
    BMI .forwards                                                        ;A7BBB5;
    STA.W $0F7A                                                          ;A7BBB7;
    LDA.W $10D2                                                          ;A7BBBA;
    CMP.W #InstList_KraidFoot_KraidIsBig_WalkingForward_1                ;A7BBBD;
    BNE .return                                                          ;A7BBC0;
    LDA.W #Function_KraidFoot_Phase2_Thinking                            ;A7BBC2;
    STA.W $10E8                                                          ;A7BBC5;
    LDA.W #$0001                                                         ;A7BBC8;
    STA.W $10D4                                                          ;A7BBCB;
    LDA.W #InstList_KraidFoot_KraidIsBig_Neutral                         ;A7BBCE;
    STA.W $10D2                                                          ;A7BBD1;

.return:
    RTL                                                                  ;A7BBD4;


.forwards:
    LDA.W $10D2                                                          ;A7BBD5;
    CMP.W #InstList_KraidFoot_KraidIsBig_WalkingForward_1                ;A7BBD8;
    BNE .return                                                          ;A7BBDB;
    LDA.W #InstList_KraidFoot_KraidIsBig_WalkingForward_0                ;A7BBDD;
    STA.W $10D2                                                          ;A7BBE0;
    LDA.W #$0001                                                         ;A7BBE3;
    STA.W $10D4                                                          ;A7BBE6;
    RTL                                                                  ;A7BBE9;


Function_KraidMainLoop_AttackingWithMouthOpen:
    JSR.W KraidInstListHandling                                          ;A7BBEA;
    CMP.W #$FFFF                                                         ;A7BBED;
    BEQ .finishedInstructions                                            ;A7BBF0;
    LDA.W $0FAA                                                          ;A7BBF2;
    SEC                                                                  ;A7BBF5;
    SBC.W #$0008                                                         ;A7BBF6;
    TAX                                                                  ;A7BBF9;
    LDA.W $0002,X                                                        ;A7BBFA;
    CMP.W #Tilemap_KraidHead_3                                           ;A7BBFD;
    BNE .return                                                          ;A7BC00;
    LDA.W $0FAC                                                          ;A7BC02;
    AND.W #$000F                                                         ;A7BC05;
    BNE .return                                                          ;A7BC08;
    LDY.W #EnemyProjectile_KraidRockSpit                                 ;A7BC0A;
    LDA.W $05E5                                                          ;A7BC0D;
    AND.W #$000E                                                         ;A7BC10;
    TAX                                                                  ;A7BC13;
    LDA.W .rockSpitXVelocities,X                                         ;A7BC14;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A7BC17;
    LDA.W #$001E                                                         ;A7BC1B;
    JSL.L QueueSound_Lib3_Max6                                           ;A7BC1E;

.return:
    RTL                                                                  ;A7BC22;


.finishedInstructions:
    JSR.W SetupKraidMainLoop_Thinking                                    ;A7BC23;
    LDA.W #$005A                                                         ;A7BC26;
    STA.W $0FAC                                                          ;A7BC29;
    LDA.L $7E780A                                                        ;A7BC2C;
    BIT.W #$0004                                                         ;A7BC30;
    BEQ .done                                                            ;A7BC33;
    SEC                                                                  ;A7BC35;
    SBC.W #$0100                                                         ;A7BC36;
    STA.L $7E780A                                                        ;A7BC39;
    AND.W #$FF00                                                         ;A7BC3D;
    BEQ .done                                                            ;A7BC40;
    LDA.W #Function_Kraid_HandleFunctionTimer                            ;A7BC42;
    STA.W $0FA8                                                          ;A7BC45;
    LDA.W #$0040                                                         ;A7BC48;
    STA.W $0FB2                                                          ;A7BC4B;
    LDA.W #Function_Kraid_KraidShot_InitializeEyeGlowing                 ;A7BC4E;
    STA.L $7E7800                                                        ;A7BC51;
    LDA.W #$0002                                                         ;A7BC55;
    STA.L $7E7802                                                        ;A7BC58;
    RTL                                                                  ;A7BC5C;


.done:
    LDA.W #$0000                                                         ;A7BC5D;
    STA.L $7E780A                                                        ;A7BC60;
    RTL                                                                  ;A7BC64;


.rockSpitXVelocities:
    dw $FC00,$FC40,$FB40,$FB80,$FB40,$FC00,$FB80,$FC40                   ;A7BC65;

UNUSED_KraidFoot_LungeForwardIfSamusIsNotInvincible_A7BC75:
    LDA.W $10D2                                                          ;A7BC75;
    CMP.W #InstList_KraidFoot_LungeForward_1                             ;A7BC78;
    BMI .return                                                          ;A7BC7B;
    LDA.W $18A8                                                          ;A7BC7D;
    BEQ .lunge                                                           ;A7BC80;
    LDA.W #Function_KraidFoot_Phase2_WalkingBackward                     ;A7BC82;
    STA.W $10E8                                                          ;A7BC85;
    LDA.W $0911                                                          ;A7BC88;
    CLC                                                                  ;A7BC8B;
    ADC.W #$0120                                                         ;A7BC8C;
    CMP.W #$0120                                                         ;A7BC8F;
    BMI +                                                                ;A7BC92;
    LDA.W #$0120                                                         ;A7BC94;

  + STA.L $7E781E                                                        ;A7BC97;
    LDA.W #$0001                                                         ;A7BC9B;
    STA.W $10D4                                                          ;A7BC9E;
    LDA.W #InstList_KraidFoot_KraidIsBig_WalkingBackwards_0              ;A7BCA1;
    STA.W $10D2                                                          ;A7BCA4;

.return:
    RTL                                                                  ;A7BCA7;


.lunge:
    LDA.W #$0001                                                         ;A7BCA8;
    STA.W $10D4                                                          ;A7BCAB;
    LDA.W #InstList_KraidFoot_LungeForward_0                             ;A7BCAE;
    STA.W $10D2                                                          ;A7BCB1;
    RTL                                                                  ;A7BCB4;


UNUSED_Kraid_FireLintAfterAFrames_A7BCB5:
    STA.W EnemyData.work5,X                                              ;A7BCB5;
    LDA.W #Function_KraidNail_HorizontallyAlignEnemyToKraid              ;A7BCB8;
    STA.W EnemyData.work0,X                                              ;A7BCBB;
    LDA.W #Function_KraidLint_FireLint                                   ;A7BCBE;
    STA.L $7E7800,X                                                      ;A7BCC1;
    LDA.W EnemyData.properties,X                                         ;A7BCC5;
    ORA.W #$0100                                                         ;A7BCC8;
    STA.W EnemyData.properties,X                                         ;A7BCCB;
    RTS                                                                  ;A7BCCE;


EnemyTouch_KraidNail:
    JSL.L NormalEnemyTouchAI                                             ;A7BCCF;
    LDX.W $0E54                                                          ;A7BCD3;
    JSL.L EnemyDeath                                                     ;A7BCD6;
    LDX.W $0E54                                                          ;A7BCDA;
    RTL                                                                  ;A7BCDD;


EnemyTouch_KraidNailBad:
    JSL.L NormalEnemyTouchAI                                             ;A7BCDE;
    LDX.W $0E54                                                          ;A7BCE2;
    JSL.L EnemyDeath                                                     ;A7BCE5;
    LDX.W $0E54                                                          ;A7BCE9;
    RTL                                                                  ;A7BCEC;


RTL_A7BCED:
    RTL                                                                  ;A7BCED;


RTL_A7BCEE:
    RTL                                                                  ;A7BCEE;


InitAI_KraidNail:
    LDX.W $0E54                                                          ;A7BCEF; fallthrough to InitAI_KraidNail_WithoutLoadingEnemyIndex

InitAI_KraidNail_Common:
    LDA.W $0F96                                                          ;A7BCF2;
    STA.W EnemyData.palette,X                                            ;A7BCF5;
    LDA.W #$0028                                                         ;A7BCF8;
    STA.W EnemyData.work1,X                                              ;A7BCFB;
    LDA.W EnemyData.properties,X                                         ;A7BCFE;
    ORA.W #$0100                                                         ;A7BD01;
    STA.W EnemyData.properties,X                                         ;A7BD04;
    LDA.W #$7FFF                                                         ;A7BD07;
    STA.W EnemyData.instTimer,X                                          ;A7BD0A;
    LDA.W #InstList_KraidNail                                            ;A7BD0D;
    STA.W EnemyData.pInstList,X                                          ;A7BD10;
    LDA.W InstList_KraidNail+2                                           ;A7BD13;
    STA.W EnemyData.pSpritemap,X                                         ;A7BD16;
    LDA.W #Function_KraidNail_Initialize                                 ;A7BD19;
    STA.L $7E7800,X                                                      ;A7BD1C;
    LDA.W #Function_Kraid_HandleFunctionTimer                            ;A7BD20;
    STA.W EnemyData.work0,X                                              ;A7BD23;
    LDA.W #$0040                                                         ;A7BD26;
    STA.W EnemyData.work5,X                                              ;A7BD29;
    RTL                                                                  ;A7BD2C;


InitAI_KraidNailBad:
    LDX.W $0E54                                                          ;A7BD2D;
    BRA InitAI_KraidNail_Common                                          ;A7BD30;


MainAI_KraidNail:
    REP #$30                                                             ;A7BD32;
    LDA.W $0F8C                                                          ;A7BD34;
    CMP.W #$0001                                                         ;A7BD37;
    BMI .delete                                                          ;A7BD3A;
    JMP.W ($1128)                                                        ;A7BD3C;


.delete:
    LDA.W $1106                                                          ;A7BD3F;
    ORA.W #$0300                                                         ;A7BD42;
    STA.W $1106                                                          ;A7BD45;
    RTL                                                                  ;A7BD48;


MainAI_KraidNailBad:
    REP #$30                                                             ;A7BD49;
    LDA.W $0F8C                                                          ;A7BD4B;
    CMP.W #$0001                                                         ;A7BD4E;
    BMI .delete                                                          ;A7BD51;
    JMP.W ($1168)                                                        ;A7BD53;


.delete:
    LDA.W $1146                                                          ;A7BD56;
    ORA.W #$0300                                                         ;A7BD59;
    STA.W $1146                                                          ;A7BD5C;
    RTL                                                                  ;A7BD5F;


Function_KraidNail_Initialize:
    LDA.W $05E5                                                          ;A7BD60;
    AND.W #$0006                                                         ;A7BD63;
    TAY                                                                  ;A7BD66;
    LDA.W $1130                                                          ;A7BD67;
    LDX.W $0E54                                                          ;A7BD6A;
    CPX.W #$0180                                                         ;A7BD6D;
    BNE +                                                                ;A7BD70;
    LDA.W $1170                                                          ;A7BD72;

  + CMP.W #$0000                                                         ;A7BD75;
    BPL .positiveYVelocity                                               ;A7BD78;
    LDA.W .upwardsVelocityPointers,Y                                     ;A7BD7A;
    BRA +                                                                ;A7BD7D;


.positiveYVelocity:
    LDA.W .downwardsVelocityPointers,Y                                   ;A7BD7F;

  + TAY                                                                  ;A7BD82;
    LDA.W $0000,Y                                                        ;A7BD83;
    STA.W EnemyData.work1,X                                              ;A7BD86;
    LDA.W $0002,Y                                                        ;A7BD89;
    STA.W EnemyData.work2,X                                              ;A7BD8C;
    LDA.W $0004,Y                                                        ;A7BD8F;
    STA.W EnemyData.work3,X                                              ;A7BD92;
    LDA.W $0006,Y                                                        ;A7BD95;
    STA.W EnemyData.work4,X                                              ;A7BD98;
    LDA.W #$0001                                                         ;A7BD9B;
    STA.W EnemyData.initParam0,X                                         ;A7BD9E;
    LDA.W EnemyData.properties,X                                         ;A7BDA1;
    AND.W #$FEFF                                                         ;A7BDA4; >.< #$FAFF
    AND.W #$FBFF                                                         ;A7BDA7;
    STA.W EnemyData.properties,X                                         ;A7BDAA;
    LDA.W #$0001                                                         ;A7BDAD;
    STA.W EnemyData.instTimer,X                                          ;A7BDB0;
    LDA.W #InstList_KraidNail                                            ;A7BDB3;
    STA.W EnemyData.pInstList,X                                          ;A7BDB6;
    LDA.W #Function_KraidNail_Fire                                       ;A7BDB9;
    STA.W EnemyData.work0,X                                              ;A7BDBC;
    LDA.W $05E5                                                          ;A7BDBF;
    BIT.W #$0001                                                         ;A7BDC2;
    BNE .horizontal                                                      ;A7BDC5;

.diagonal:
    LDA.W #$0000                                                         ;A7BDC7;
    STA.L $7E780E,X                                                      ;A7BDCA;
    LDA.W $0F7A                                                          ;A7BDCE;
    SEC                                                                  ;A7BDD1;
    SBC.W $0F82                                                          ;A7BDD2;
    SEC                                                                  ;A7BDD5;
    SBC.W EnemyData.xHitboxRadius,X                                      ;A7BDD6;
    AND.W #$FFF0                                                         ;A7BDD9;
    STA.W EnemyData.xPosition,X                                          ;A7BDDC;
    LDA.W $0FBE                                                          ;A7BDDF;
    CLC                                                                  ;A7BDE2;
    ADC.W #$0080                                                         ;A7BDE3;
    STA.W EnemyData.yPosition,X                                          ;A7BDE6;
    RTL                                                                  ;A7BDE9;


.horizontal:
    LDA.L $7E798E                                                        ;A7BDEA;
    CPX.W #$01C0                                                         ;A7BDEE;
    BEQ .notKraidNailBad                                                 ;A7BDF1;
    LDA.L $7E79CE                                                        ;A7BDF3;

.notKraidNailBad:
    CMP.W #$0001                                                         ;A7BDF7;
    BEQ .diagonal                                                        ;A7BDFA;
    LDA.W #$0001                                                         ;A7BDFC;
    STA.L $7E780E,X                                                      ;A7BDFF;
    LDA.W #$0032                                                         ;A7BE03;
    STA.W EnemyData.xPosition,X                                          ;A7BE06;
    LDA.W #$00F0                                                         ;A7BE09;
    STA.W EnemyData.yPosition,X                                          ;A7BE0C;
    LDA.W #$0000                                                         ;A7BE0F;
    STA.W EnemyData.work1,X                                              ;A7BE12;
    LDA.W #$0001                                                         ;A7BE15;
    STA.W EnemyData.work2,X                                              ;A7BE18;
    LDA.W #$0000                                                         ;A7BE1B;
    STA.W EnemyData.work3,X                                              ;A7BE1E;
    LDA.W #$0000                                                         ;A7BE21;
    STA.W EnemyData.work4,X                                              ;A7BE24;
    LDA.W #Function_KraidNail_WaitUntilTopLintXPosition100Plus           ;A7BE27;
    STA.W EnemyData.work0,X                                              ;A7BE2A;
    LDA.W #Function_KraidNail_Fire                                       ;A7BE2D;
    STA.L $7E7800,X                                                      ;A7BE30;
    LDA.W EnemyData.properties,X                                         ;A7BE34;
    ORA.W #$0500                                                         ;A7BE37;
    STA.W EnemyData.properties,X                                         ;A7BE3A;
    RTL                                                                  ;A7BE3D;


.upwardsVelocityPointers:
    dw .upwards0                                                         ;A7BE3E;
    dw .upwards1                                                         ;A7BE40;
    dw .upwards2                                                         ;A7BE42;
    dw .upwards3                                                         ;A7BE44;

.downwardsVelocityPointers:
    dw .downwards0                                                       ;A7BE46;
    dw .downwards1                                                       ;A7BE48;
    dw .downwards2                                                       ;A7BE4A;
    dw .downwards3                                                       ;A7BE4C;

.upwards0:
    dw $0000,$FFFF,$0000,$0001                                           ;A7BE4E;

.downwards0:
    dw $0000,$FFFF,$0000,$FFFF                                           ;A7BE56;

.upwards1:
    dw $0000,$FFFF,$0000,$0001                                           ;A7BE5E;

.downwards1:
    dw $0000,$FFFF,$0000,$FFFF                                           ;A7BE66;

.upwards2:
    dw $0000,$FFFF,$0000,$0001                                           ;A7BE6E;

.downwards2:
    dw $0000,$FFFF,$0000,$FFFF                                           ;A7BE76;

.upwards3:
    dw $0000,$FFFF,$0000,$0001                                           ;A7BE7E;

.downwards3:
    dw $0000,$FFFF,$0000,$FFFF                                           ;A7BE86;

Function_KraidNail_Fire:
    LDA.W EnemyData.work1,X                                              ;A7BE8E;
    STA.B $12                                                            ;A7BE91;
    LDA.W EnemyData.work2,X                                              ;A7BE93;
    STA.B $14                                                            ;A7BE96;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A7BE98;
    BCC .loopSetup                                                       ;A7BE9C;
    LDA.W EnemyData.work1,X                                              ;A7BE9E;
    EOR.W #$FFFF                                                         ;A7BEA1;
    INC A                                                                ;A7BEA4;
    STA.W EnemyData.work1,X                                              ;A7BEA5;
    LDA.W EnemyData.work2,X                                              ;A7BEA8;
    EOR.W #$FFFF                                                         ;A7BEAB;
    INC A                                                                ;A7BEAE;
    STA.W EnemyData.work2,X                                              ;A7BEAF;
    BRA .bounced                                                         ;A7BEB2;


.loopSetup:
    LDY.W #$0000                                                         ;A7BEB4;

.loop:
    LDA.W $0F7E                                                          ;A7BEB7;
    CLC                                                                  ;A7BEBA;
    ADC.W .topBoundaryOffset,Y                                           ;A7BEBB;
    CMP.W EnemyData.yPosition,X                                          ;A7BEBE;
    BMI +                                                                ;A7BEC1;
    INY                                                                  ;A7BEC3;
    INY                                                                  ;A7BEC4;
    INY                                                                  ;A7BEC5;
    INY                                                                  ;A7BEC6;
    BRA .loop                                                            ;A7BEC7;


  + LDA.W $0F7A                                                          ;A7BEC9;
    CLC                                                                  ;A7BECC;
    ADC.W .leftBoundaryOffset,Y                                          ;A7BECD;
    STA.B $12                                                            ;A7BED0;
    LDA.W EnemyData.xPosition,X                                          ;A7BED2;
    CLC                                                                  ;A7BED5;
    ADC.W EnemyData.xHitboxRadius,X                                      ;A7BED6;
    CMP.B $12                                                            ;A7BED9;
    BMI .bounced                                                         ;A7BEDB;
    LDA.W EnemyData.work2,X                                              ;A7BEDD;
    BMI .bounced                                                         ;A7BEE0;
    LDA.W EnemyData.work1,X                                              ;A7BEE2;
    EOR.W #$FFFF                                                         ;A7BEE5;
    INC A                                                                ;A7BEE8;
    STA.W EnemyData.work1,X                                              ;A7BEE9;
    LDA.W EnemyData.work2,X                                              ;A7BEEC;
    EOR.W #$FFFF                                                         ;A7BEEF;
    INC A                                                                ;A7BEF2;
    STA.W EnemyData.work2,X                                              ;A7BEF3;

.bounced:
    LDA.W EnemyData.work3,X                                              ;A7BEF6;
    STA.B $12                                                            ;A7BEF9;
    LDA.W EnemyData.work4,X                                              ;A7BEFB;
    STA.B $14                                                            ;A7BEFE;
    JSL.L MoveEnemyDownBy_14_12                                          ;A7BF00;
    BCC .return                                                          ;A7BF04;
    LDA.W EnemyData.work3,X                                              ;A7BF06;
    EOR.W #$FFFF                                                         ;A7BF09;
    INC A                                                                ;A7BF0C;
    STA.W EnemyData.work3,X                                              ;A7BF0D;
    LDA.W EnemyData.work4,X                                              ;A7BF10;
    EOR.W #$FFFF                                                         ;A7BF13;
    ADC.W #$0000                                                         ;A7BF16;
    STA.W EnemyData.work4,X                                              ;A7BF19;

.return:
    RTL                                                                  ;A7BF1C;


.leftBoundaryOffset:
    dw $FFC0                                                             ;A7BF1D;

.topBoundaryOffset:
    dw $0010,$FFD8,$FFD8,$FFF0,$FFA0,$0008,$FF80                         ;A7BF1F;

Function_KraidFoot_Phase1_PrepareToLungeForward:
    JSR.W HandleKraidPhase1                                              ;A7BF2D;
    LDA.W $0FD2                                                          ;A7BF30;
    CMP.W #InstList_KraidArm_Normal_1                                    ;A7BF33;
    BMI .return                                                          ;A7BF36;
    LDA.W #InstList_KraidArm_Dying_PreparingToLungeForward               ;A7BF38;
    STA.W $0FD2                                                          ;A7BF3B;
    LDA.W #$0001                                                         ;A7BF3E;
    STA.W $0FD4                                                          ;A7BF41;
    LDA.W #$0001                                                         ;A7BF44;
    STA.W $10D4                                                          ;A7BF47;
    LDA.W #InstList_KraidFoot_LungeForward_0                             ;A7BF4A;
    STA.W $10D2                                                          ;A7BF4D;
    LDA.W #Function_KraidFoot_Phase1_LungeForward                        ;A7BF50;
    STA.W $10E8                                                          ;A7BF53;
    LDA.W #$0000                                                         ;A7BF56;
    STA.W $10F2                                                          ;A7BF59;

.return:
    RTL                                                                  ;A7BF5C;


Function_KraidFoot_Phase1_LungeForward:
    JSR.W HandleKraidPhase1                                              ;A7BF5D;
    LDA.W $0F7A                                                          ;A7BF60;
    CMP.W #$005C                                                         ;A7BF63;
    BPL +                                                                ;A7BF66;
    LDA.W #$005C                                                         ;A7BF68;
    STA.W $0F7A                                                          ;A7BF6B;

  + LDA.W $10D2                                                          ;A7BF6E;
    CMP.W #InstList_KraidFoot_LungeForward_1                             ;A7BF71;
    BNE .return                                                          ;A7BF74;
    LDA.W $0F7A                                                          ;A7BF76;
    CMP.W #$005C                                                         ;A7BF79;
    BEQ .done                                                            ;A7BF7C;
    LDA.W #$0001                                                         ;A7BF7E;
    STA.W $10D4                                                          ;A7BF81;
    LDA.W #InstList_KraidFoot_LungeForward_0                             ;A7BF84;
    STA.W $10D2                                                          ;A7BF87;
    RTL                                                                  ;A7BF8A;


.done:
    LDA.W #Function_KraidFoot_Phase1_RetreatFromLunge                    ;A7BF8B;
    STA.L $7E7940                                                        ;A7BF8E;
    LDA.W #Function_KraidFoot_StartRetreat                               ;A7BF92;
    STA.W $10E8                                                          ;A7BF95;
    LDA.W #$0001                                                         ;A7BF98;
    STA.W $10F2                                                          ;A7BF9B;
    LDA.W #$0001                                                         ;A7BF9E;
    STA.W $10D4                                                          ;A7BFA1;
    LDA.W #InstList_KraidFoot_KraidIsBig_Neutral                         ;A7BFA4;
    STA.W $10D2                                                          ;A7BFA7;

.return:
    RTL                                                                  ;A7BFAA;


Function_KraidFoot_Phase1_RetreatFromLunge:
    JSR.W HandleKraidPhase1                                              ;A7BFAB;
    LDA.W $0F7A                                                          ;A7BFAE;
    CMP.W #$00B0                                                         ;A7BFB1;
    BMI +                                                                ;A7BFB4;
    LDA.W #$00B0                                                         ;A7BFB6;
    STA.W $0F7A                                                          ;A7BFB9;

  + LDA.W $10D2                                                          ;A7BFBC;
    CMP.W #InstList_KraidFoot_KraidIsBig_WalkingBackwards_1              ;A7BFBF;
    BMI .return                                                          ;A7BFC2;
    LDA.W $0F7A                                                          ;A7BFC4;
    CMP.W #$00B0                                                         ;A7BFC7;
    BEQ .done                                                            ;A7BFCA;
    LDA.W #InstList_KraidFoot_KraidIsBig_WalkingBackwards_0              ;A7BFCC;
    STA.W EnemyData.pInstList,X                                          ;A7BFCF;
    LDA.W #$0001                                                         ;A7BFD2;
    STA.W EnemyData.instTimer,X                                          ;A7BFD5;
    RTL                                                                  ;A7BFD8;


.done:
    LDA.W #InstList_KraidArm_Normal_0                                    ;A7BFD9;
    STA.W $0FD2                                                          ;A7BFDC;
    LDA.W #$0001                                                         ;A7BFDF;
    STA.W $0FD4                                                          ;A7BFE2;
    LDA.W #$0001                                                         ;A7BFE5;
    STA.W $10D4                                                          ;A7BFE8;
    LDA.W #InstList_KraidFoot_KraidIsBig_Neutral                         ;A7BFEB;
    STA.W $10D2                                                          ;A7BFEE;
    LDA.W #Function_KraidFoot_Phase1_Thinking                            ;A7BFF1;
    STA.W $10E8                                                          ;A7BFF4;
    LDA.W #$012C                                                         ;A7BFF7;
    STA.W $10F2                                                          ;A7BFFA;
    LDA.W #Function_KraidFoot_Phase1_PrepareToLungeForward               ;A7BFFD;
    STA.L $7E7940                                                        ;A7C000;

.return:
    RTL                                                                  ;A7C004;


HandleKraidPhase1:
    LDA.W $0F8C                                                          ;A7C005;
    CMP.L $7E7818                                                        ;A7C008;
    BMI .getBig                                                          ;A7C00C;
    RTS                                                                  ;A7C00E;


.getBig:
    LDA.W #Function_Kraid_ProcessKraidInstruction                        ;A7C00F;
    STA.W $0FA8                                                          ;A7C012;
    LDA.W #$00B4                                                         ;A7C015;
    STA.W $0FB2                                                          ;A7C018;
    LDA.W #Function_Kraid_GetBig_ReleaseCamera                           ;A7C01B;
    STA.L $7E7800                                                        ;A7C01E;
    LDA.W $0FAA                                                          ;A7C022;
    TAX                                                                  ;A7C025;
    LDA.W $0002,X                                                        ;A7C026;
    LDY.W #$0032                                                         ;A7C029;
    CMP.W #Tilemap_KraidHead_0                                           ;A7C02C;
    BEQ +                                                                ;A7C02F;
    LDY.W #$002A                                                         ;A7C031;
    CMP.W #Tilemap_KraidHead_1                                           ;A7C034;
    BEQ +                                                                ;A7C037;
    LDY.W #$0022                                                         ;A7C039;
    CMP.W #Tilemap_KraidHead_2                                           ;A7C03C;
    BEQ +                                                                ;A7C03F;
    LDY.W #$001A                                                         ;A7C041;

  + TYA                                                                  ;A7C044;
    CLC                                                                  ;A7C045;
    ADC.W #InstList_Kraid_Roar_1                                         ;A7C046;
    STA.W $0FAA                                                          ;A7C049;
    LDA.W InstList_Kraid_Roar_0,Y                                        ;A7C04C;
    STA.W $0FAC                                                          ;A7C04F;
    LDA.W #$0004                                                         ;A7C052;
    STA.W $183E                                                          ;A7C055;
    LDA.W #$0154                                                         ;A7C058;
    STA.W $1840                                                          ;A7C05B;
    LDA.W #InstList_KraidFoot_Initial                                    ;A7C05E;
    STA.W $10D2                                                          ;A7C061;
    LDA.W #$0001                                                         ;A7C064;
    STA.W $10D4                                                          ;A7C067;
    LDA.W #RTL_A7BA2D                                                    ;A7C06A;
    STA.W $10E8                                                          ;A7C06D;
    LDA.W #InstList_KraidArm_Normal_0                                    ;A7C070;
    STA.W $0FD2                                                          ;A7C073;
    LDA.W #$0001                                                         ;A7C076;
    STA.W $0FD4                                                          ;A7C079;
    LDA.W $1006                                                          ;A7C07C;
    ORA.W #$0100                                                         ;A7C07F;
    STA.W $1006                                                          ;A7C082;
    LDA.W $1046                                                          ;A7C085;
    ORA.W #$0100                                                         ;A7C088;
    STA.W $1046                                                          ;A7C08B;
    LDA.W $1086                                                          ;A7C08E;
    ORA.W #$0100                                                         ;A7C091;
    STA.W $1086                                                          ;A7C094;
    LDA.W $0FC6                                                          ;A7C097;
    ORA.W #$0400                                                         ;A7C09A;
    STA.W $0FC6                                                          ;A7C09D;
    RTS                                                                  ;A7C0A0;


Function_Kraid_GetBig_ReleaseCamera:
    LDA.W #Function_Kraid_KraidGetsBig_BreakCeilingIntoPlatforms         ;A7C0A1;
    STA.W $0FA8                                                          ;A7C0A4;
    LDA.W #$0202                                                         ;A7C0A7;
    STA.L $7ECD20                                                        ;A7C0AA;
    LDA.W #$0101                                                         ;A7C0AE;
    STA.L $7ECD22                                                        ;A7C0B1;
    LDA.W #$00A4                                                         ;A7C0B5;
    STA.L $7E7808                                                        ;A7C0B8;
    RTL                                                                  ;A7C0BC;


UNUSED_CrumbleFirstSectionOfKraidsSpikeFloor_A7C0BD:
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C0BD;
    db $06,$1B                                                           ;A7C0C1;
    dw PLMEntries_crumbleKraidSpikeBlocks                                ;A7C0C3;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C0C5;
    db $07,$1B                                                           ;A7C0C9;
    dw PLMEntries_crumbleKraidSpikeBlocks                                ;A7C0CB;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C0CD;
    db $08,$1B                                                           ;A7C0D1;
    dw PLMEntries_crumbleKraidSpikeBlocks                                ;A7C0D3;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C0D5;
    db $09,$1B                                                           ;A7C0D9;
    dw PLMEntries_crumbleKraidSpikeBlocks                                ;A7C0DB;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C0DD;
    db $0A,$1B                                                           ;A7C0E1;
    dw PLMEntries_crumbleKraidSpikeBlocks                                ;A7C0E3;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C0E5;
    db $0B,$1B                                                           ;A7C0E9;
    dw PLMEntries_crumbleKraidSpikeBlocks                                ;A7C0EB;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C0ED;
    db $0C,$1B                                                           ;A7C0F1;
    dw PLMEntries_crumbleKraidSpikeBlocks                                ;A7C0F3;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C0F5;
    db $0D,$1B                                                           ;A7C0F9;
    dw PLMEntries_crumbleKraidSpikeBlocks                                ;A7C0FB;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C0FD;
    db $0E,$1B                                                           ;A7C101;
    dw PLMEntries_crumbleKraidSpikeBlocks                                ;A7C103;
    RTS                                                                  ;A7C105;

    JSL.L Spawn_Hardcoded_PLM                                            ;A7C106;
    db $0F,$1B                                                           ;A7C10A;
    dw PLMEntries_crumbleKraidSpikeBlocks                                ;A7C10C;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C10E;
    db $10,$1B                                                           ;A7C112;
    dw PLMEntries_crumbleKraidSpikeBlocks                                ;A7C114;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C116;
    db $11,$1B                                                           ;A7C11A;
    dw PLMEntries_crumbleKraidSpikeBlocks                                ;A7C11C;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C11E;
    db $12,$1B                                                           ;A7C122;
    dw PLMEntries_crumbleKraidSpikeBlocks                                ;A7C124;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C126;
    db $13,$1B                                                           ;A7C12A;
    dw PLMEntries_crumbleKraidSpikeBlocks                                ;A7C12C;
    RTS                                                                  ;A7C12E;

    JSL.L Spawn_Hardcoded_PLM                                            ;A7C12F;
    db $14,$1B                                                           ;A7C133;
    dw PLMEntries_crumbleKraidSpikeBlocks                                ;A7C135;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C137;
    db $15,$1B                                                           ;A7C13B;
    dw PLMEntries_crumbleKraidSpikeBlocks                                ;A7C13D;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C13F;
    db $16,$1B                                                           ;A7C143;
    dw PLMEntries_crumbleKraidSpikeBlocks                                ;A7C145;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C147;
    db $17,$1B                                                           ;A7C14B;
    dw PLMEntries_crumbleKraidSpikeBlocks                                ;A7C14D;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C14F;
    db $18,$1B                                                           ;A7C153;
    dw PLMEntries_crumbleKraidSpikeBlocks                                ;A7C155;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C157;
    db $19,$1B                                                           ;A7C15B;
    dw PLMEntries_crumbleKraidSpikeBlocks                                ;A7C15D;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C15F;
    db $1A,$1B                                                           ;A7C163;
    dw PLMEntries_crumbleKraidSpikeBlocks                                ;A7C165;
    RTS                                                                  ;A7C167;


SpawnPLMToClearTheCeiling:
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C168;
    db $02,$12                                                           ;A7C16C;
    dw PLMEntries_clearKraidCeilingBlocks                                ;A7C16E;
    RTS                                                                  ;A7C170;


SpawnPLMToClearTheSpikes:
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C171;
    db $05,$1B                                                           ;A7C175;
    dw PLMEntries_clearKraidSpikeBlocks                                  ;A7C177;
    RTS                                                                  ;A7C179;


UNUSED_ClearSomeOfTheSpikeBlocks_A7C17A:
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C17A;
    db $0B,$1B                                                           ;A7C17E;
    dw PLMEntries_clearKraidSpikeBlocks                                  ;A7C180;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C182;
    db $0C,$1B                                                           ;A7C186;
    dw PLMEntries_clearKraidSpikeBlocks                                  ;A7C188;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C18A;
    db $0D,$1B                                                           ;A7C18E;
    dw PLMEntries_clearKraidSpikeBlocks                                  ;A7C190;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C192;
    db $0E,$1B                                                           ;A7C196;
    dw PLMEntries_clearKraidSpikeBlocks                                  ;A7C198;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C19A;
    db $0F,$1B                                                           ;A7C19E;
    dw PLMEntries_clearKraidSpikeBlocks                                  ;A7C1A0;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C1A2;
    db $10,$1B                                                           ;A7C1A6;
    dw PLMEntries_clearKraidSpikeBlocks                                  ;A7C1A8;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C1AA;
    db $11,$1B                                                           ;A7C1AE;
    dw PLMEntries_clearKraidSpikeBlocks                                  ;A7C1B0;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C1B2;
    db $12,$1B                                                           ;A7C1B6;
    dw PLMEntries_clearKraidSpikeBlocks                                  ;A7C1B8;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C1BA;
    db $13,$1B                                                           ;A7C1BE;
    dw PLMEntries_clearKraidSpikeBlocks                                  ;A7C1C0;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C1C2;
    db $14,$1B                                                           ;A7C1C6;
    dw PLMEntries_clearKraidSpikeBlocks                                  ;A7C1C8;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C1CA;
    db $15,$1B                                                           ;A7C1CE;
    dw PLMEntries_clearKraidSpikeBlocks                                  ;A7C1D0;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C1D2;
    db $16,$1B                                                           ;A7C1D6;
    dw PLMEntries_clearKraidSpikeBlocks                                  ;A7C1D8;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C1DA;
    db $17,$1B                                                           ;A7C1DE;
    dw PLMEntries_clearKraidSpikeBlocks                                  ;A7C1E0;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C1E2;
    db $18,$1B                                                           ;A7C1E6;
    dw PLMEntries_clearKraidSpikeBlocks                                  ;A7C1E8;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C1EA;
    db $19,$1B                                                           ;A7C1EE;
    dw PLMEntries_clearKraidSpikeBlocks                                  ;A7C1F0;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C1F2;
    db $1A,$1B                                                           ;A7C1F6;
    dw PLMEntries_clearKraidSpikeBlocks                                  ;A7C1F8;
    RTS                                                                  ;A7C1FA;


UnpauseHook_KraidIsDead:
    PHP                                                                  ;A7C1FB;
    SEP #$20                                                             ;A7C1FC;
    JSL.L SetForceBlankAndWaitForNMI                                     ;A7C1FE;
    LDA.B #$00                                                           ;A7C202;
    STA.W $2116                                                          ;A7C204;
    LDA.B $5D                                                            ;A7C207;
    AND.B #$0F                                                           ;A7C209;
    ASL A                                                                ;A7C20B;
    ASL A                                                                ;A7C20C;
    ASL A                                                                ;A7C20D;
    ASL A                                                                ;A7C20E;
    CLC                                                                  ;A7C20F;
    ADC.B #$3F                                                           ;A7C210;
    STA.W $2117                                                          ;A7C212;
    LDA.B #$80                                                           ;A7C215;
    STA.W $2115                                                          ;A7C217;
    JSL.L SetupHDMATransfer                                              ;A7C21A;
    db $01,$01,$18                                                       ;A7C21E;
    dl Tiles_KraidRoomBackground                                         ;A7C221;
    dw $0200                                                             ;A7C224;
    LDA.B #$02                                                           ;A7C226;
    STA.W HW_MDMAEN                                                      ;A7C228;
    LDA.B #$00                                                           ;A7C22B;
    STA.W $2116                                                          ;A7C22D;
    LDA.B #$40                                                           ;A7C230;
    STA.W $2117                                                          ;A7C232;
    LDA.B #$80                                                           ;A7C235;
    STA.W $2115                                                          ;A7C237;
    JSL.L SetupHDMATransfer                                              ;A7C23A;
    db $01,$01,$18                                                       ;A7C23E;
    dl Tiles_Standard_BG3                                                ;A7C241;
    dw $0800                                                             ;A7C244;
    LDA.B #$02                                                           ;A7C246;
    STA.W HW_MDMAEN                                                      ;A7C248;
    JMP.W TransferKraidTopHalfTilemapToVRAM                              ;A7C24B;


UnpauseHook_KraidIsAlive:
    PHP                                                                  ;A7C24E;
    SEP #$20                                                             ;A7C24F;
    JSL.L SetForceBlankAndWaitForNMI                                     ;A7C251;
    LDA.B #$00                                                           ;A7C255;
    STA.W $2116                                                          ;A7C257;
    LDA.B $5D                                                            ;A7C25A;
    CLC                                                                  ;A7C25C;
    ADC.B #$3E                                                           ;A7C25D;
    STA.W $2117                                                          ;A7C25F;
    LDA.B #$80                                                           ;A7C262;
    STA.W $2115                                                          ;A7C264;
    JSL.L SetupHDMATransfer                                              ;A7C267;
    db $01,$01,$18                                                       ;A7C26B;
    dl $7E5000                                                           ;A7C26E;
    dw $0400                                                             ;A7C271;
    LDA.B #$02                                                           ;A7C273;
    STA.W HW_MDMAEN                                                      ;A7C275; fallthrough to TransferKraidTopHalfTilemapToVRAM

TransferKraidTopHalfTilemapToVRAM:
    LDA.B #$00                                                           ;A7C278;
    STA.W $2116                                                          ;A7C27A;
    LDA.B $59                                                            ;A7C27D;
    AND.B #$FC                                                           ;A7C27F;
    STA.W $2117                                                          ;A7C281;
    LDA.B #$80                                                           ;A7C284;
    STA.W $2115                                                          ;A7C286;
    JSL.L SetupHDMATransfer                                              ;A7C289;
    db $01,$01,$18                                                       ;A7C28D;
    dl $7E2000                                                           ;A7C290;
    dw $0800                                                             ;A7C293;
    LDA.B #$02                                                           ;A7C295;
    STA.W HW_MDMAEN                                                      ;A7C297;
    JSL.L ClearForceBlankAndWaitForNMI                                   ;A7C29A;
    PLP                                                                  ;A7C29E;
    RTL                                                                  ;A7C29F;


UnpauseHook_KraidIsSinking:
    PHP                                                                  ;A7C2A0;
    SEP #$20                                                             ;A7C2A1;
    JSL.L SetForceBlankAndWaitForNMI                                     ;A7C2A3;
    LDA.B #$00                                                           ;A7C2A7;
    STA.W $2116                                                          ;A7C2A9;
    LDA.B $5D                                                            ;A7C2AC;
    CLC                                                                  ;A7C2AE;
    ADC.B #$3E                                                           ;A7C2AF;
    STA.W $2117                                                          ;A7C2B1;
    LDA.B #$80                                                           ;A7C2B4;
    STA.W $2115                                                          ;A7C2B6;
    JSL.L SetupHDMATransfer                                              ;A7C2B9;
    db $01,$01,$18                                                       ;A7C2BD;
    dl $7E5000                                                           ;A7C2C0;
    dw $0400                                                             ;A7C2C3;
    LDA.B #$02                                                           ;A7C2C5;
    STA.W HW_MDMAEN                                                      ;A7C2C7;
    REP #$30                                                             ;A7C2CA;
    PHB                                                                  ;A7C2CC;
    PHK                                                                  ;A7C2CD;
    PLB                                                                  ;A7C2CE;
    LDA.W $0F7E                                                          ;A7C2CF;
    CMP.W ShrinkingKraidTable_KraidYPosition                             ;A7C2D2;
    BMI .return                                                          ;A7C2D5;
    LDY.W #$0000                                                         ;A7C2D7;
    LDX.W $0330                                                          ;A7C2DA;

.loop:
    REP #$30                                                             ;A7C2DD;
    LDA.W ShrinkingKraidTable_KraidYPosition,Y                           ;A7C2DF;
    CMP.W #$FFFF                                                         ;A7C2E2;
    BEQ .return                                                          ;A7C2E5;
    LDA.W $0F7E                                                          ;A7C2E7;
    CMP.W ShrinkingKraidTable_KraidYPosition,Y                           ;A7C2EA;
    BMI .return                                                          ;A7C2ED;
    LDA.W #$0040                                                         ;A7C2EF;
    STA.B $D0,X                                                          ;A7C2F2;
    LDA.W #$2FC0                                                         ;A7C2F4;
    STA.B $D2,X                                                          ;A7C2F7;
    LDA.W #$007E                                                         ;A7C2F9;
    STA.B $D4,X                                                          ;A7C2FC;
    LDA.B $59                                                            ;A7C2FE;
    AND.W #$00FC                                                         ;A7C300;
    XBA                                                                  ;A7C303;
    CLC                                                                  ;A7C304;
    ADC.W ShrinkingKraidTable_VRAMBG2TilemapOffset,Y                     ;A7C305;
    STA.B $D5,X                                                          ;A7C308;
    TXA                                                                  ;A7C30A;
    CLC                                                                  ;A7C30B;
    ADC.W #$0007                                                         ;A7C30C;
    STA.W $0330                                                          ;A7C30F;
    JSL.L WaitForNMI                                                     ;A7C312;
    TYA                                                                  ;A7C316;
    CLC                                                                  ;A7C317;
    ADC.W #$0006                                                         ;A7C318;
    TAY                                                                  ;A7C31B;
    BRA .loop                                                            ;A7C31C;


.return:
    PLB                                                                  ;A7C31E;
    JSL.L SetForceBlankAndWaitForNMI                                     ;A7C31F;
    PLP                                                                  ;A7C323;
    RTL                                                                  ;A7C324;


PauseHook_Kraid:
    PHP                                                                  ;A7C325;
    REP #$30                                                             ;A7C326;
    LDX.W $0360                                                          ;A7C328;
    LDA.B $5D                                                            ;A7C32B;
    AND.W #$00FC                                                         ;A7C32D;
    XBA                                                                  ;A7C330;
    CLC                                                                  ;A7C331;
    ADC.W #$3E00                                                         ;A7C332;
    STA.W $0340,X                                                        ;A7C335;
    LDA.W #$0081                                                         ;A7C338;
    STA.W $0342,X                                                        ;A7C33B;
    LDA.W #$0039                                                         ;A7C33E;
    STA.W $0343,X                                                        ;A7C341;
    LDA.W #$5000                                                         ;A7C344;
    STA.W $0344,X                                                        ;A7C347;
    LDA.W #$007E                                                         ;A7C34A;
    STA.W $0346,X                                                        ;A7C34D;
    LDA.W #$0400                                                         ;A7C350;
    STA.W $0347,X                                                        ;A7C353;
    TXA                                                                  ;A7C356;
    CLC                                                                  ;A7C357;
    ADC.W #$0009                                                         ;A7C358;
    STA.W $0360                                                          ;A7C35B;
    PLP                                                                  ;A7C35E;
    RTL                                                                  ;A7C35F;


KraidDeath_Initialize:
    LDA.L $7E782A                                                        ;A7C360;
    BEQ .notHurtFrame                                                    ;A7C364;
    RTL                                                                  ;A7C366;


.notHurtFrame:
    LDX.W #$00C0                                                         ;A7C367;
    LDA.W #$0000                                                         ;A7C36A;

.loopPalette6:
    STA.L $7EC200,X                                                      ;A7C36D;
    INX                                                                  ;A7C371;
    INX                                                                  ;A7C372;
    CPX.W #$00E0                                                         ;A7C373;
    BMI .loopPalette6                                                    ;A7C376;
    LDX.W #$001E                                                         ;A7C378;

.loopPalette7:
    LDA.W Palette_Kraid_Death,X                                          ;A7C37B;
    STA.L $7EC0E0,X                                                      ;A7C37E;
    DEX                                                                  ;A7C382;
    DEX                                                                  ;A7C383;
    BPL .loopPalette7                                                    ;A7C384;
    LDA.W #InstList_KraidArm_Dying_PreparingToLungeForward               ;A7C386;
    STA.W $0FD2                                                          ;A7C389;
    LDA.W #$0001                                                         ;A7C38C;
    STA.W $0FD4                                                          ;A7C38F;
    LDA.W #KraidDeath_FadeOutBackground                                  ;A7C392;
    STA.W $0FA8                                                          ;A7C395;
    LDA.W #InstList_Kraid_Dying_1                                        ;A7C398;
    STA.W $0FAA                                                          ;A7C39B;
    LDA.W InstList_Kraid_Dying_0                                         ;A7C39E;
    STA.W $0FAC                                                          ;A7C3A1;
    LDX.W $0E54                                                          ;A7C3A4;
    PHX                                                                  ;A7C3A7;
    LDA.W $1106                                                          ;A7C3A8;
    AND.W #$BFFF                                                         ;A7C3AB;
    STA.W $1106                                                          ;A7C3AE;
    LDA.W #$0180                                                         ;A7C3B1;
    STA.W $0E54                                                          ;A7C3B4;
    JSL.L EnemyDeath                                                     ;A7C3B7;
    LDA.W $1146                                                          ;A7C3BB;
    AND.W #$BFFF                                                         ;A7C3BE;
    STA.W $1146                                                          ;A7C3C1;
    LDA.W #$01C0                                                         ;A7C3C4;
    STA.W $0E54                                                          ;A7C3C7;
    JSL.L EnemyDeath                                                     ;A7C3CA;
    LDA.W #$0080                                                         ;A7C3CE;
    STA.W $0E54                                                          ;A7C3D1;
    JSL.L EnemyDeath                                                     ;A7C3D4;
    LDA.W #$00C0                                                         ;A7C3D8;
    STA.W $0E54                                                          ;A7C3DB;
    JSL.L EnemyDeath                                                     ;A7C3DE;
    LDA.W #$0100                                                         ;A7C3E2;
    STA.W $0E54                                                          ;A7C3E5;
    JSL.L EnemyDeath                                                     ;A7C3E8;
    PLA                                                                  ;A7C3EC;
    STA.W $0E54                                                          ;A7C3ED;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C3F0;
    db $05,$1B                                                           ;A7C3F4;
    dw PLMEntries_crumbleKraidSpikeBlocks                                ;A7C3F6;
    RTL                                                                  ;A7C3F8;


KraidDeath_FadeOutBackground:
    JSR.W KraidInstListHandling                                          ;A7C3F9;
    JSL.L Advance_GradualColorChange_ofBGPalette6                        ;A7C3FC;
    BCC .return                                                          ;A7C400;
    LDA.W #KraidDeath_UpdateBG2TilemapTopHalf                            ;A7C402;
    STA.W $0FA8                                                          ;A7C405;
    LDA.W #$0001                                                         ;A7C408;
    STA.L $7E782C                                                        ;A7C40B;
    STA.L $7E782A                                                        ;A7C40F;
    JSR.W KraidPaletteHandling                                           ;A7C413;
    LDX.W #$0000                                                         ;A7C416;
    LDA.W #$0000                                                         ;A7C419;

.loopClearRoomBackground:
    STA.L $7E4000,X                                                      ;A7C41C;
    STA.L $7E4002,X                                                      ;A7C420;
    INX                                                                  ;A7C424;
    INX                                                                  ;A7C425;
    INX                                                                  ;A7C426;
    INX                                                                  ;A7C427;
    CPX.W #$0200                                                         ;A7C428;
    BMI .loopClearRoomBackground                                         ;A7C42B;
    LDX.W $0330                                                          ;A7C42D;
    LDA.W #$0200                                                         ;A7C430;
    STA.B $D0,X                                                          ;A7C433;
    LDA.W #$4000                                                         ;A7C435;
    STA.B $D2,X                                                          ;A7C438;
    SEP #$20                                                             ;A7C43A;
    LDA.B #$7E                                                           ;A7C43C;
    STA.B $D4,X                                                          ;A7C43E;
    REP #$20                                                             ;A7C440;
    LDA.B $5D                                                            ;A7C442;
    AND.W #$000F                                                         ;A7C444;
    XBA                                                                  ;A7C447;
    CLC                                                                  ;A7C448;
    ADC.W #$3F00                                                         ;A7C449;
    STA.B $D5,X                                                          ;A7C44C;
    TXA                                                                  ;A7C44E;
    CLC                                                                  ;A7C44F;
    ADC.W #$0007                                                         ;A7C450;
    STA.W $0330                                                          ;A7C453;

.return:
    RTL                                                                  ;A7C456;


UNUSED_ProcessKraidInstruction_WithNoASMInstructions_A7C457:
    LDA.W $0FAC                                                          ;A7C457;
    BEQ .return                                                          ;A7C45A;
    DEC.W $0FAC                                                          ;A7C45C;
    BNE .return                                                          ;A7C45F;
    LDX.W $0FAA                                                          ;A7C461;
    LDA.W $0000,X                                                        ;A7C464;
    BPL .timer                                                           ;A7C467;
    LDA.W #$0000                                                         ;A7C469;
    STA.W $0FAC                                                          ;A7C46C;
    RTS                                                                  ;A7C46F;


.timer:
    STA.W $0FAC                                                          ;A7C470;
    TXA                                                                  ;A7C473;
    CLC                                                                  ;A7C474;
    ADC.W #$0008                                                         ;A7C475;
    STA.W $0FAA                                                          ;A7C478;
    LDA.W $0002,X                                                        ;A7C47B;
    TAY                                                                  ;A7C47E;
    LDX.W $0330                                                          ;A7C47F;
    LDA.W #$02C0                                                         ;A7C482;
    STA.B $D0,X                                                          ;A7C485;
    INX                                                                  ;A7C487;
    INX                                                                  ;A7C488;
    STY.B $D0,X                                                          ;A7C489;
    INX                                                                  ;A7C48B;
    INX                                                                  ;A7C48C;
    SEP #$20                                                             ;A7C48D;
    LDA.B #$A7                                                           ;A7C48F;
    STA.B $D0,X                                                          ;A7C491;
    REP #$20                                                             ;A7C493;
    INX                                                                  ;A7C495;
    LDA.B $59                                                            ;A7C496;
    AND.W #$00FC                                                         ;A7C498;
    XBA                                                                  ;A7C49B;
    STA.B $D0,X                                                          ;A7C49C;
    INX                                                                  ;A7C49E;
    INX                                                                  ;A7C49F;
    STX.W $0330                                                          ;A7C4A0;

.return:
    RTS                                                                  ;A7C4A3;


KraidDeath_UpdateBG2TilemapTopHalf:
    JSR.W KraidInstListHandling                                          ;A7C4A4;
    LDA.W #KraidDeath_UpdateBG2TilemapBottomHalf                         ;A7C4A7;
    STA.W $0FA8                                                          ;A7C4AA;
    LDA.W #Function_KraidNail_HorizontallyAlignEnemyToKraid              ;A7C4AD;
    STA.W $1028                                                          ;A7C4B0;
    STA.W $1068                                                          ;A7C4B3;
    STA.W $10A8                                                          ;A7C4B6;
    LDA.W #$7FFF                                                         ;A7C4B9;
    STA.W $1032                                                          ;A7C4BC;
    STA.W $1072                                                          ;A7C4BF;
    STA.W $10B2                                                          ;A7C4C2;
    JMP.W UpdateBG2TilemapTopHalf                                        ;A7C4C5;


KraidDeath_UpdateBG2TilemapBottomHalf:
    JSR.W KraidInstListHandling                                          ;A7C4C8;
    SEP #$20                                                             ;A7C4CB;
    LDA.B #$A7                                                           ;A7C4CD;
    STA.W $0606                                                          ;A7C4CF;
    REP #$20                                                             ;A7C4D2;
    LDA.W #UnpauseHook_KraidIsSinking                                    ;A7C4D4;
    STA.W $0604                                                          ;A7C4D7;
    LDA.W #KraidDeath_SinkThroughFloor                                   ;A7C4DA;
    STA.W $0FA8                                                          ;A7C4DD;
    LDA.W #$002B                                                         ;A7C4E0;
    STA.L $7E9000                                                        ;A7C4E3;
    LDA.W $0F86                                                          ;A7C4E7;
    ORA.W #$8000                                                         ;A7C4EA;
    STA.W $0F86                                                          ;A7C4ED;
    LDA.W #$0001                                                         ;A7C4F0;
    STA.W $183E                                                          ;A7C4F3;
    LDA.W #$0100                                                         ;A7C4F6;
    STA.W $1840                                                          ;A7C4F9;
    LDA.W #InstList_KraidArm_RisingSinking                               ;A7C4FC;
    STA.W $0FD2                                                          ;A7C4FF;
    LDA.W #$0001                                                         ;A7C502;
    STA.W $0FD4                                                          ;A7C505;
    LDA.W #InstList_KraidFoot_Initial                                    ;A7C508;
    STA.W $10D2                                                          ;A7C50B;
    LDA.W #$0001                                                         ;A7C50E;
    STA.W $10D4                                                          ;A7C511;
    LDA.W #RTL_A7BA2D                                                    ;A7C514;
    STA.W $10E8                                                          ;A7C517;
    JMP.W UpdateBG2TilemapBottomHalf                                     ;A7C51A;


PlaySoundEveryHalfSecond:
    LDA.L $7E9000                                                        ;A7C51D;
    DEC A                                                                ;A7C521;
    STA.L $7E9000                                                        ;A7C522;
    BNE .return                                                          ;A7C526;
    LDA.W #$001E                                                         ;A7C528;
    JSL.L QueueSound_Lib3_Max6                                           ;A7C52B;
    LDA.W #$001E                                                         ;A7C52F;
    STA.L $7E9000                                                        ;A7C532;

.return:
    RTS                                                                  ;A7C536;


KraidDeath_SinkThroughFloor:
    JSR.W KraidInstListHandling                                          ;A7C537;
    JSR.W PlaySoundEveryHalfSecond                                       ;A7C53A;
    JSR.W HandleKraidSinking                                             ;A7C53D;
    INC.W $0F7E                                                          ;A7C540;
    LDA.W $0F7E                                                          ;A7C543;
    CMP.W #$0260                                                         ;A7C546;
    BMI .return                                                          ;A7C549;
    LDA.W $0F86                                                          ;A7C54B;
    AND.W #$FBFF                                                         ;A7C54E;
    STA.W $0F86                                                          ;A7C551;
    LDA.W #$0002                                                         ;A7C554;
    STA.W $179A                                                          ;A7C557;
    LDY.W $0E54                                                          ;A7C55A;
    LDX.W EnemyData.pId,Y                                                ;A7C55D;
    LDA.W #RTL_A7804C                                                    ;A7C560;
    STA.L $A00032,X                                                      ;A7C563;
    LDA.W $0FC6                                                          ;A7C567;
    ORA.W #$0200                                                         ;A7C56A;
    ORA.W #$0400                                                         ;A7C56D;
    STA.W $0FC6                                                          ;A7C570;
    ORA.W #$0200                                                         ;A7C573;
    ORA.W #$0400                                                         ;A7C576;
    AND.W #$F7FF                                                         ;A7C579; >.< #$57FF
    AND.W #$DFFF                                                         ;A7C57C;
    AND.W #$7FFF                                                         ;A7C57F;
    STA.W $1006                                                          ;A7C582;
    STA.W $1046                                                          ;A7C585;
    STA.W $1086                                                          ;A7C588;
    STA.W $10C6                                                          ;A7C58B;
    LDA.W #Function_Kraid_FadeInRegularBG_ClearBG2TilemapTopHalf         ;A7C58E;
    STA.W $0FA8                                                          ;A7C591;
    STZ.W $0941                                                          ;A7C594;
    JSL.L KraidDeathItemDropRoutine                                      ;A7C597;
    JMP.W DrawKraidsRoomBackground                                       ;A7C59B;


.return:
    RTL                                                                  ;A7C59E;


HandleKraidSinking:
    LDY.W #$0000                                                         ;A7C59F;

.loop:
    LDA.W ShrinkingKraidTable_KraidYPosition,Y                           ;A7C5A2;
    BMI .return                                                          ;A7C5A5;
    CMP.W $0F7E                                                          ;A7C5A7;
    BEQ .found                                                           ;A7C5AA;
    TYA                                                                  ;A7C5AC;
    CLC                                                                  ;A7C5AD;
    ADC.W #$0006                                                         ;A7C5AE;
    TAY                                                                  ;A7C5B1;
    BRA .loop                                                            ;A7C5B2;


.found:
    LDA.W ShrinkingKraidTable_VRAMBG2TilemapOffset,Y                     ;A7C5B4;
    BMI .executeFunction                                                 ;A7C5B7;
    LDX.W $0330                                                          ;A7C5B9;
    LDA.W #$0040                                                         ;A7C5BC;
    STA.B $D0,X                                                          ;A7C5BF;
    LDA.W #$2FC0                                                         ;A7C5C1;
    STA.B $D2,X                                                          ;A7C5C4;
    SEP #$20                                                             ;A7C5C6;
    LDA.B #$7E                                                           ;A7C5C8;
    STA.B $D4,X                                                          ;A7C5CA;
    REP #$20                                                             ;A7C5CC;
    LDA.B $59                                                            ;A7C5CE;
    AND.W #$00FC                                                         ;A7C5D0;
    XBA                                                                  ;A7C5D3;
    CLC                                                                  ;A7C5D4;
    ADC.W ShrinkingKraidTable_VRAMBG2TilemapOffset,Y                     ;A7C5D5;
    STA.B $D5,X                                                          ;A7C5D8;
    TXA                                                                  ;A7C5DA;
    CLC                                                                  ;A7C5DB;
    ADC.W #$0007                                                         ;A7C5DC;
    STA.W $0330                                                          ;A7C5DF;

.executeFunction:
    TYX                                                                  ;A7C5E2;
    JSR.W (ShrinkingKraidTable_functionPointer,X)                        ;A7C5E3;

.return:
    RTS                                                                  ;A7C5E6;


ShrinkingKraidTable_KraidYPosition:
    dw $0130                                                             ;A7C5E7;

ShrinkingKraidTable_VRAMBG2TilemapOffset:
    dw $08A0                                                             ;A7C5E9;

ShrinkingKraidTable_functionPointer:
    dw CrumbleLeftPlatform_Left                                          ;A7C5EB;
    dw $0138,$0880                                                       ;A7C5ED;
    dw RTS_A7C6A6                                                        ;A7C5F1;
    dw $0140,$0860                                                       ;A7C5F3;
    dw RTS_A7C6A6                                                        ;A7C5F7;
    dw $0148,$0840                                                       ;A7C5F9;
    dw CrumbleRightPlatform_Middle                                       ;A7C5FD;
    dw $0150,$0820                                                       ;A7C5FF;
    dw RTS_A7C6A6                                                        ;A7C603;
    dw $0158,$0800                                                       ;A7C605;
    dw RTS_A7C6A6                                                        ;A7C609;
    dw $0160,$03E0                                                       ;A7C60B;
    dw CrumbleRightPlatform_Left                                         ;A7C60F;
    dw $0168,$03C0                                                       ;A7C611;
    dw RTS_A7C6A6                                                        ;A7C615;
    dw $0170,$03A0                                                       ;A7C617;
    dw RTS_A7C6A6                                                        ;A7C61B;
    dw $0178,$0380                                                       ;A7C61D;
    dw RTS_A7C6A6                                                        ;A7C621;
    dw $0180,$0360                                                       ;A7C623;
    dw CrumbleLeftPlatform_Right                                         ;A7C627;
    dw $0188,$0340                                                       ;A7C629;
    dw RTS_A7C6A6                                                        ;A7C62D;
    dw $0190,$0320                                                       ;A7C62F;
    dw RTS_A7C6A6                                                        ;A7C633;
    dw $0198,$0300                                                       ;A7C635;
    dw CrumbleLeftPlatform_Middle                                        ;A7C639;
    dw $01A0,$02E0                                                       ;A7C63B;
    dw RTS_A7C6A6                                                        ;A7C63F;
    dw $01A8,$02C0                                                       ;A7C641;
    dw RTS_A7C6A6                                                        ;A7C645;
    dw $01B0,$02A0                                                       ;A7C647;
    dw CrumbleRightPlatform_Right                                        ;A7C64B;
    dw $01B8,$0280                                                       ;A7C64D;
    dw RTS_A7C6A6                                                        ;A7C651;
    dw $01C0,$0260                                                       ;A7C653;
    dw RTS_A7C6A6                                                        ;A7C657;
    dw $01C8,$0240                                                       ;A7C659;
    dw RTS_A7C6A6                                                        ;A7C65D;
    dw $01D0,$0220                                                       ;A7C65F;
    dw RTS_A7C6A6                                                        ;A7C663;
    dw $01D8,$0200                                                       ;A7C665;
    dw RTS_A7C6A6                                                        ;A7C669;
    dw $01E0,$01E0                                                       ;A7C66B;
    dw RTS_A7C6A6                                                        ;A7C66F;
    dw $01E8,$01C0                                                       ;A7C671;
    dw RTS_A7C6A6                                                        ;A7C675;
    dw $01F0,$01A0                                                       ;A7C677;
    dw RTS_A7C6A6                                                        ;A7C67B;
    dw $01F8,$0180                                                       ;A7C67D;
    dw RTS_A7C6A6                                                        ;A7C681;
    dw $0200,$0160                                                       ;A7C683;
    dw RTS_A7C6A6                                                        ;A7C687;
    dw $0208,$0140                                                       ;A7C689;
    dw RTS_A7C6A6                                                        ;A7C68D;
    dw $FFFF                                                             ;A7C68F;

CrumbleLeftPlatform_Left:
    LDA.W #$0070                                                         ;A7C691;
    LDY.W #EnemyProjectile_KraidCeilingRocks                             ;A7C694;
    LDX.W $0E54                                                          ;A7C697;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A7C69A;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C69E; fallthrough to RTS_A7C6A6
    db $07,$12                                                           ;A7C6A2;
    dw PLMEntries_setKraidCeilingBlockToBackground2                      ;A7C6A4;

RTS_A7C6A6:
    RTS                                                                  ;A7C6A6;


CrumbleRightPlatform_Middle:
    LDA.W #$00F0                                                         ;A7C6A7;
    LDY.W #EnemyProjectile_KraidCeilingRocks                             ;A7C6AA;
    LDX.W $0E54                                                          ;A7C6AD;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A7C6B0;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C6B4;
    db $0F,$12                                                           ;A7C6B8;
    dw PLMEntries_setKraidCeilingBlockToBackground2                      ;A7C6BA;
    RTS                                                                  ;A7C6BC;


CrumbleRightPlatform_Left:
    LDA.W #$00E0                                                         ;A7C6BD;
    LDY.W #EnemyProjectile_KraidCeilingRocks                             ;A7C6C0;
    LDX.W $0E54                                                          ;A7C6C3;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A7C6C6;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C6CA;
    db $0E,$12                                                           ;A7C6CE;
    dw PLMEntries_SetKraidCeilingBlockToBackground3                      ;A7C6D0;
    RTS                                                                  ;A7C6D2;


CrumbleLeftPlatform_Right:
    LDA.W #$0090                                                         ;A7C6D3;
    LDY.W #EnemyProjectile_KraidCeilingRocks                             ;A7C6D6;
    LDX.W $0E54                                                          ;A7C6D9;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A7C6DC;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C6E0;
    db $09,$12                                                           ;A7C6E4;
    dw PLMEntries_setKraidCeilingBlockToBackground2                      ;A7C6E6;
    RTS                                                                  ;A7C6E8;


CrumbleLeftPlatform_Middle:
    LDA.W #$0080                                                         ;A7C6E9;
    LDY.W #EnemyProjectile_KraidCeilingRocks                             ;A7C6EC;
    LDX.W $0E54                                                          ;A7C6EF;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A7C6F2;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C6F6;
    db $08,$12                                                           ;A7C6FA;
    dw PLMEntries_SetKraidCeilingBlockToBackground3                      ;A7C6FC;
    RTS                                                                  ;A7C6FE;


CrumbleRightPlatform_Right:
    LDA.W #$0100                                                         ;A7C6FF;
    LDY.W #EnemyProjectile_KraidCeilingRocks                             ;A7C702;
    LDX.W $0E54                                                          ;A7C705;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A7C708;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C70C;
    db $10,$12                                                           ;A7C710;
    dw PLMEntries_SetKraidCeilingBlockToBackground3                      ;A7C712;
    RTS                                                                  ;A7C714;


Function_Kraid_FadeInRegularBG_ClearBG2TilemapTopHalf:
    SEP #$20                                                             ;A7C715;
    LDA.B #$48                                                           ;A7C717;
    STA.B $59                                                            ;A7C719;
    REP #$20                                                             ;A7C71B;
    LDX.W #$07FE                                                         ;A7C71D;
    LDA.W #$0338                                                         ;A7C720;

.loop:
    STA.L $7E2000,X                                                      ;A7C723;
    DEX                                                                  ;A7C727;
    DEX                                                                  ;A7C728;
    BPL .loop                                                            ;A7C729;
    LDX.W $0330                                                          ;A7C72B;
    LDA.W #$0400                                                         ;A7C72E;
    STA.B $D0,X                                                          ;A7C731;
    LDA.W #$2000                                                         ;A7C733;
    STA.B $D2,X                                                          ;A7C736;
    LDA.W #$007E                                                         ;A7C738;
    STA.B $D4,X                                                          ;A7C73B;
    LDA.W #$4800                                                         ;A7C73D;
    STA.B $D5,X                                                          ;A7C740;
    TXA                                                                  ;A7C742;
    CLC                                                                  ;A7C743;
    ADC.W #$0007                                                         ;A7C744;
    STA.W $0330                                                          ;A7C747;
    LDA.W #Function_Kraid_FadeInRegularBG_ClearBG2TilemapBottomHalf      ;A7C74A;
    STA.W $0FA8                                                          ;A7C74D;
    RTL                                                                  ;A7C750;


Function_Kraid_FadeInRegularBG_ClearBG2TilemapBottomHalf:
    LDX.W $0330                                                          ;A7C751;
    LDA.W #$0400                                                         ;A7C754;
    STA.B $D0,X                                                          ;A7C757;
    LDA.W #$2000                                                         ;A7C759;
    STA.B $D2,X                                                          ;A7C75C;
    LDA.W #$007E                                                         ;A7C75E;
    STA.B $D4,X                                                          ;A7C761;
    LDA.W #$4A00                                                         ;A7C763;
    STA.B $D5,X                                                          ;A7C766;
    TXA                                                                  ;A7C768;
    CLC                                                                  ;A7C769;
    ADC.W #$0007                                                         ;A7C76A;
    STA.W $0330                                                          ;A7C76D;
    LDA.W #Function_Kraid_FadeInRegularBG_LoadStandardBG3Tiles_0         ;A7C770;
    STA.W $0FA8                                                          ;A7C773;
    RTL                                                                  ;A7C776;


Function_Kraid_FadeInRegularBG_LoadStandardBG3Tiles_0:
    LDA.W #UnpauseHook_KraidIsDead                                       ;A7C777;
    STA.W $0604                                                          ;A7C77A;
    LDA.W #Function_Kraid_FadeInRegularBG_LoadStandardBG3Tiles_1         ;A7C77D;
    STA.W $0FA8                                                          ;A7C780;
    LDX.W $0330                                                          ;A7C783;
    LDA.W #$0400                                                         ;A7C786;
    STA.B $D0,X                                                          ;A7C789;
    LDA.W #Tiles_Standard_BG3                                            ;A7C78B;
    STA.B $D2,X                                                          ;A7C78E;
    LDA.W #Tiles_Standard_BG3>>16                                        ;A7C790;
    STA.B $D4,X                                                          ;A7C793;
    LDA.W #$4000                                                         ;A7C795;
    STA.B $D5,X                                                          ;A7C798;
    TXA                                                                  ;A7C79A;
    CLC                                                                  ;A7C79B;
    ADC.W #$0007                                                         ;A7C79C;
    STA.W $0330                                                          ;A7C79F;
    RTL                                                                  ;A7C7A2;


Function_Kraid_FadeInRegularBG_LoadStandardBG3Tiles_1:
    LDA.W #Function_Kraid_FadeInRegularBG_LoadStandardBG3Tiles_2         ;A7C7A3;
    STA.W $0FA8                                                          ;A7C7A6;
    LDX.W $0330                                                          ;A7C7A9;
    LDA.W #$0400                                                         ;A7C7AC;
    STA.B $D0,X                                                          ;A7C7AF;
    LDA.W #Tiles_Standard_BG3+$400                                       ;A7C7B1;
    STA.B $D2,X                                                          ;A7C7B4;
    LDA.W #Tiles_Standard_BG3>>16                                        ;A7C7B6;
    STA.B $D4,X                                                          ;A7C7B9;
    LDA.W #$4200                                                         ;A7C7BB;
    STA.B $D5,X                                                          ;A7C7BE;
    TXA                                                                  ;A7C7C0;
    CLC                                                                  ;A7C7C1;
    ADC.W #$0007                                                         ;A7C7C2;
    STA.W $0330                                                          ;A7C7C5;
    RTL                                                                  ;A7C7C8;


Function_Kraid_FadeInRegularBG_LoadStandardBG3Tiles_2:
    LDA.W #Function_Kraid_FadeInRegularBG_LoadStandardBG3Tiles_3         ;A7C7C9;
    STA.W $0FA8                                                          ;A7C7CC;
    LDX.W $0330                                                          ;A7C7CF;
    LDA.W #$0400                                                         ;A7C7D2;
    STA.B $D0,X                                                          ;A7C7D5;
    LDA.W #Tiles_Standard_BG3+$800                                       ;A7C7D7;
    STA.B $D2,X                                                          ;A7C7DA;
    LDA.W #Tiles_Standard_BG3>>16                                        ;A7C7DC;
    STA.B $D4,X                                                          ;A7C7DF;
    LDA.W #$4400                                                         ;A7C7E1;
    STA.B $D5,X                                                          ;A7C7E4;
    TXA                                                                  ;A7C7E6;
    CLC                                                                  ;A7C7E7;
    ADC.W #$0007                                                         ;A7C7E8;
    STA.W $0330                                                          ;A7C7EB;
    RTL                                                                  ;A7C7EE;


Function_Kraid_FadeInRegularBG_LoadStandardBG3Tiles_3:
    LDA.W #Function_Kraid_FadeInRegularBG_FadeInBGPalette6               ;A7C7EF;
    STA.W $0FA8                                                          ;A7C7F2;
    LDX.W $0330                                                          ;A7C7F5;
    LDA.W #$0400                                                         ;A7C7F8;
    STA.B $D0,X                                                          ;A7C7FB;
    LDA.W #Tiles_Standard_BG3+$C00                                       ;A7C7FD;
    STA.B $D2,X                                                          ;A7C800;
    LDA.W #Tiles_Standard_BG3>>16                                        ;A7C802;
    STA.B $D4,X                                                          ;A7C805;
    LDA.W #$4600                                                         ;A7C807;
    STA.B $D5,X                                                          ;A7C80A;
    TXA                                                                  ;A7C80C;
    CLC                                                                  ;A7C80D;
    ADC.W #$0007                                                         ;A7C80E;
    STA.W $0330                                                          ;A7C811;
    RTL                                                                  ;A7C814;


Function_Kraid_FadeInRegularBG_FadeInBGPalette6:
    JSL.L Advance_GradualColorChange_ofBGPalette6                        ;A7C815;
    BCC .return                                                          ;A7C819;
    LDA.W #$0003                                                         ;A7C81B;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;A7C81E;
    LDX.W $079F                                                          ;A7C822;
    LDA.L $7ED828,X                                                      ;A7C825;
    BIT.W #$0001                                                         ;A7C829;
    BNE .KraidIsDead                                                     ;A7C82C;
    ORA.W #$0001                                                         ;A7C82E;
    STA.L $7ED828,X                                                      ;A7C831;
    LDA.W #Function_Kraid_FadeInRegularBG_SetToDead_KraidWasAlive        ;A7C835;
    STA.W $0FA8                                                          ;A7C838;

.return:
    RTL                                                                  ;A7C83B;


.KraidIsDead:
    LDA.W #Function_Kraid_FadeInRegularBG_SetToDead_KraidWasDead         ;A7C83C;
    STA.W $0FA8                                                          ;A7C83F;
    RTL                                                                  ;A7C842;


Function_Kraid_FadeInRegularBG_SetToDead_KraidWasAlive:
    JSR.W CheckIfKraidHasDied                                            ;A7C843;
    BEQ .setToDead                                                       ;A7C846;
    LDA.W $0911                                                          ;A7C848;
    BEQ .return                                                          ;A7C84B;

.setToDead:
    JSR.W SetEnemyPropertiesToDead                                       ;A7C84D;

.return:
    RTL                                                                  ;A7C850;


Function_Kraid_FadeInRegularBG_SetToDead_KraidWasDead:
    JSR.W CheckIfKraidHasDied                                            ;A7C851;
    BEQ .setToDead                                                       ;A7C854;
    LDA.W $0911                                                          ;A7C856;
    BEQ .return                                                          ;A7C859;

.setToDead:
    JSR.W SetEnemyPropertiesToDead                                       ;A7C85B;

.return:
    LDA.W #$FFFF                                                         ;A7C85E;
    STA.W $08FF                                                          ;A7C861;
    RTL                                                                  ;A7C864;


Function_Kraid_RestrictSamusXPositionToFirstScreen:
    JSR.W RestrictSamusXPositionToFirstScreen                            ;A7C865;
    JMP.W Function_Kraid_HandleFunctionTimer                             ;A7C868;


Function_Kraid_RaiseThruFloor_LoadTilemapTopHalf:
    JSR.W RestrictSamusXPositionToFirstScreen                            ;A7C86B;
    LDA.W #Function_Kraid_RaiseThruFloor_LoadTilemapBottomHalf_ShakeScn  ;A7C86E;
    STA.W $0FA8                                                          ;A7C871; fallthrough to UpdateBG2TilemapTopHalf

UpdateBG2TilemapTopHalf:
    LDX.W $0330                                                          ;A7C874;
    LDA.W #$0800                                                         ;A7C877;
    STA.B $D0,X                                                          ;A7C87A;
    LDA.W #$2000                                                         ;A7C87C;
    STA.B $D2,X                                                          ;A7C87F;
    SEP #$20                                                             ;A7C881;
    LDA.B #$7E                                                           ;A7C883;
    STA.B $D4,X                                                          ;A7C885;
    REP #$20                                                             ;A7C887;
    LDA.B $59                                                            ;A7C889;
    AND.W #$00FC                                                         ;A7C88B;
    XBA                                                                  ;A7C88E;
    STA.B $D5,X                                                          ;A7C88F;
    TXA                                                                  ;A7C891;
    CLC                                                                  ;A7C892;
    ADC.W #$0007                                                         ;A7C893;
    STA.W $0330                                                          ;A7C896;
    RTL                                                                  ;A7C899;


Function_Kraid_RaiseThruFloor_LoadTilemapBottomHalf_ShakeScn:
    JSR.W RestrictSamusXPositionToFirstScreen                            ;A7C89A;
    LDA.W #Function_Kraid_RaiseThruFloor_SpawnRNGEarthquakeProjEvery10f  ;A7C89D;
    STA.W $0FA8                                                          ;A7C8A0;
    LDA.W #$0078                                                         ;A7C8A3;
    STA.W $0FB2                                                          ;A7C8A6;
    LDA.W #$01F0                                                         ;A7C8A9;
    STA.W $1840                                                          ;A7C8AC;
    LDA.W #$0005                                                         ;A7C8AF;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;A7C8B2; fallthrough to UpdateBG2TilemapBottomHalf

UpdateBG2TilemapBottomHalf:
    LDX.W $0330                                                          ;A7C8B6;
    LDA.W #$0800                                                         ;A7C8B9;
    STA.B $D0,X                                                          ;A7C8BC;
    LDA.W #$2800                                                         ;A7C8BE;
    STA.B $D2,X                                                          ;A7C8C1;
    SEP #$20                                                             ;A7C8C3;
    LDA.B #$7E                                                           ;A7C8C5;
    STA.B $D4,X                                                          ;A7C8C7;
    REP #$20                                                             ;A7C8C9;
    LDA.B $59                                                            ;A7C8CB;
    AND.W #$00FC                                                         ;A7C8CD;
    XBA                                                                  ;A7C8D0;
    CLC                                                                  ;A7C8D1;
    ADC.W #$0800                                                         ;A7C8D2;
    STA.B $D5,X                                                          ;A7C8D5;
    TXA                                                                  ;A7C8D7;
    CLC                                                                  ;A7C8D8;
    ADC.W #$0007                                                         ;A7C8D9;
    STA.W $0330                                                          ;A7C8DC;
    RTL                                                                  ;A7C8DF;


Function_Kraid_RaiseThruFloor_SpawnRNGEarthquakeProjEvery10f:
    JSR.W RestrictSamusXPositionToFirstScreen                            ;A7C8E0;
    LDA.W $0FB2                                                          ;A7C8E3;
    DEC A                                                                ;A7C8E6;
    STA.W $0FB2                                                          ;A7C8E7;
    BNE .timerNotExpired                                                 ;A7C8EA;
    LDA.W #Function_Kraid_RaiseThruFloor_SpawnRNGEarthquakeProjEvery8f   ;A7C8EC;
    STA.W $0FA8                                                          ;A7C8EF;
    LDA.W #$0060                                                         ;A7C8F2;
    STA.W $0FB2                                                          ;A7C8F5;
    RTL                                                                  ;A7C8F8;


.timerNotExpired:
    AND.W #$000F                                                         ;A7C8F9;
    BNE .return                                                          ;A7C8FC;
    JSR.W SpawnRandomEarthquakeProjectile                                ;A7C8FE;

.return:
    RTL                                                                  ;A7C901;


Function_Kraid_RaiseThruFloor_SpawnRNGEarthquakeProjEvery8f:
    JSR.W RestrictSamusXPositionToFirstScreen                            ;A7C902;
    LDA.W $0FB2                                                          ;A7C905;
    DEC A                                                                ;A7C908;
    STA.W $0FB2                                                          ;A7C909;
    BNE .timerNotExpired                                                 ;A7C90C;
    LDA.W #Function_Kraid_RaiseThruFloor_RaiseKraid                      ;A7C90E;
    STA.W $0FA8                                                          ;A7C911;
    LDA.W #$0120                                                         ;A7C914;
    STA.W $0FB2                                                          ;A7C917;
    RTL                                                                  ;A7C91A;


.timerNotExpired:
    AND.W #$0007                                                         ;A7C91B;
    BNE .return                                                          ;A7C91E;
    JSR.W SpawnRandomEarthquakeProjectile                                ;A7C920;

.return:
    RTL                                                                  ;A7C923;


Function_Kraid_RaiseThruFloor_RaiseKraid:
    JSR.W RestrictSamusXPositionToFirstScreen                            ;A7C924;
    LDA.W $1840                                                          ;A7C927;
    BIT.W #$0005                                                         ;A7C92A;
    BNE +                                                                ;A7C92D;
    JSR.W SpawnRandomEarthquakeProjectile                                ;A7C92F;

  + LDY.W #$0001                                                         ;A7C932;
    LDA.W $0F7E                                                          ;A7C935;
    BIT.W #$0002                                                         ;A7C938;
    BNE +                                                                ;A7C93B;
    LDY.W #$FFFF                                                         ;A7C93D;

  + STY.B $12                                                            ;A7C940;
    LDA.W $0F7A                                                          ;A7C942;
    CLC                                                                  ;A7C945;
    ADC.B $12                                                            ;A7C946;
    STA.W $0F7A                                                          ;A7C948;
    LDA.W $0F80                                                          ;A7C94B;
    SEC                                                                  ;A7C94E;
    SBC.W #$8000                                                         ;A7C94F;
    STA.W $0F80                                                          ;A7C952;
    LDA.W $0F7E                                                          ;A7C955;
    SBC.W #$0000                                                         ;A7C958;
    STA.W $0F7E                                                          ;A7C95B;
    LDA.W $0F7E                                                          ;A7C95E;
    CMP.W #$01C9                                                         ;A7C961;
    BPL .return                                                          ;A7C964;
    LDA.W #$00B0                                                         ;A7C966;
    STA.W $0F7A                                                          ;A7C969;
    LDA.W #Function_KraidFoot_Phase1_Thinking                            ;A7C96C;
    STA.W $10E8                                                          ;A7C96F;
    LDA.W #$012C                                                         ;A7C972;
    STA.W $10F2                                                          ;A7C975;
    LDA.W #Function_KraidFoot_Phase1_PrepareToLungeForward               ;A7C978;
    STA.L $7E7940                                                        ;A7C97B;
    LDA.W #InstList_Kraid_Roar_1                                         ;A7C97F;
    STA.W $0FAA                                                          ;A7C982;
    JSR.W SetupKraidMainLoop_Thinking                                    ;A7C985;
    LDA.W #InstList_KraidArm_Normal_0                                    ;A7C988;
    STA.W $0FD2                                                          ;A7C98B;
    LDA.W #$0001                                                         ;A7C98E;
    STA.W $0FD4                                                          ;A7C991;

.return:
    RTL                                                                  ;A7C994;


SpawnRandomEarthquakeProjectile:
    LDA.W $05B5                                                          ;A7C995;
    BIT.W #$0002                                                         ;A7C998;
    LDA.W $05E5                                                          ;A7C99B;
    AND.W #$003F                                                         ;A7C99E;
    TAX                                                                  ;A7C9A1;
    LDA.W $05E5                                                          ;A7C9A2;
    BIT.W #$0002                                                         ;A7C9A5;
    BNE +                                                                ;A7C9A8;
    TXA                                                                  ;A7C9AA;
    EOR.W #$FFFF                                                         ;A7C9AB;
    TAX                                                                  ;A7C9AE;

  + TXA                                                                  ;A7C9AF;
    CLC                                                                  ;A7C9B0;
    ADC.W $0F7A                                                          ;A7C9B1;
    STA.B $12                                                            ;A7C9B4;
    LDA.W $05E5                                                          ;A7C9B6;
    AND.W #$3F00                                                         ;A7C9B9;
    XBA                                                                  ;A7C9BC;
    STA.B $14                                                            ;A7C9BD;
    LDA.W #$01C0                                                         ;A7C9BF;
    SEC                                                                  ;A7C9C2;
    SBC.B $14                                                            ;A7C9C3;
    STA.B $14                                                            ;A7C9C5;
    LDA.W #$0015                                                         ;A7C9C7;
    STA.B $16                                                            ;A7C9CA;
    STZ.B $18                                                            ;A7C9CC;
    JSL.L Create_Sprite_Object                                           ;A7C9CE;
    LDY.W #EnemyProjectile_KraidFloorRocks_Left                          ;A7C9D2;
    LDA.W $05E5                                                          ;A7C9D5;
    BIT.W #$0010                                                         ;A7C9D8;
    BEQ .keepLeft                                                        ;A7C9DB;
    LDY.W #EnemyProjectile_KraidFloorRocks_Right                         ;A7C9DD;

.keepLeft:
    LDX.W $0E54                                                          ;A7C9E0;
    LDA.W $05E5                                                          ;A7C9E3;
    AND.W #$03F0                                                         ;A7C9E6;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A7C9E9;
    RTS                                                                  ;A7C9ED;


RestrictSamusXPositionToFirstScreen:
    LDA.W $0AF6                                                          ;A7C9EE;
    SEC                                                                  ;A7C9F1;
    SBC.W #$0100                                                         ;A7C9F2;
    BMI .return                                                          ;A7C9F5;
    LDA.W #$0100                                                         ;A7C9F7;
    STA.W $0AF6                                                          ;A7C9FA;
    STA.W $0B10                                                          ;A7C9FD;

.return:
    RTS                                                                  ;A7CA00;


Palette_Phantoon:
    dw $3800,$7FFF,$7EC0,$6DE0,$54E0,$0000,$0000,$0000                   ;A7CA01;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;A7CA11;

UNUSED_Palette_Phantoon_A7CA21:
    dw $0000,$477B,$2E52,$00C6,$0063,$3AB5,$2210,$116B                   ;A7CA21;
    dw $0508,$7FFF,$36B5,$19AD,$0929,$381D,$1814,$000A                   ;A7CA31;

Palette_Phantoon_FadeOutTarget:
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;A7CA41;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;A7CA51;

Palette_WreckedShipPoweredOn:
    dw $0000,$02DF,$01D7,$00AC,$5EBB,$3DB3,$292E,$1486                   ;A7CA61;
    dw $0BB1,$48FB,$7FFF,$0000,$7FFF,$44E5,$7FFF,$0000                   ;A7CA71;
    dw $2003,$0BB1,$1EA9,$0145,$5EBB,$3DB3,$292E,$1486                   ;A7CA81;
    dw $6318,$1CE7,$1084,$0000,$7FFF,$02DF,$001F,$0000                   ;A7CA91;
    dw $2003,$72BC,$48FB,$1816,$6318,$6318,$6318,$6318                   ;A7CAA1;
    dw $6318,$6318,$6318,$6318,$6318,$6318,$7FFF,$0000                   ;A7CAB1;
    dw $0000,$72B2,$71C7,$4D03,$6318,$6318,$6318,$6318                   ;A7CAC1;
    dw $6318,$6318,$6318,$6318,$6318,$6318,$7FFF,$0000                   ;A7CAD1;
    dw $0000,$3EF4,$262E,$0D68,$3E94,$25CE,$0D08,$1484                   ;A7CAE1;
    dw $6E94,$55CE,$3D08,$2C84,$1EA9,$0BB1,$7FFF,$0000                   ;A7CAF1;
    dw $0000,$1246,$0145,$00C0,$3652,$1D8C,$04C6,$0484                   ;A7CB01;
    dw $6231,$496B,$30A5,$2021,$0015,$025B,$7FFF,$0000                   ;A7CB11;
    dw $0000,$6318,$6318,$6318,$6318,$6318,$6318,$6318                   ;A7CB21;
    dw $6318,$6318,$6318,$6318,$6318,$6318,$7FFF,$0000                   ;A7CB31;

Palette_Phantoon_HealthBased_0:
    dw $000E,$25DC,$1538,$0071,$0030,$1D79,$1117,$08B4                   ;A7CB41;
    dw $0092,$421F,$1D79,$0CF5,$0493,$1C1D,$0C19,$0013                   ;A7CB51;

Palette_Phantoon_HealthBased_1:
    dw $000C,$2A1C,$1957,$0070,$002E,$2199,$1136,$08D3                   ;A7CB61;
    dw $0091,$4A5F,$1D99,$0CF4,$04B1,$201D,$0C18,$0012                   ;A7CB71;

Palette_Phantoon_HealthBased_2:
    dw $000A,$2E5C,$1D96,$008E,$004C,$25D8,$1555,$08F1                   ;A7CB81;
    dw $00AF,$529F,$21D8,$1113,$04D0,$241D,$1017,$0011                   ;A7CB91;

Palette_Phantoon_HealthBased_3:
    dw $0008,$327C,$21B5,$008C,$004A,$29F7,$1574,$0D10                   ;A7CBA1;
    dw $00AE,$5ADF,$25F7,$1131,$04CE,$281D,$1016,$000F                   ;A7CBB1;

Palette_Phantoon_HealthBased_4:
    dw $0006,$36BB,$21D4,$008B,$0048,$2E17,$1993,$0D0F                   ;A7CBC1;
    dw $00CC,$631F,$2A17,$1150,$04ED,$2C1D,$1016,$000E                   ;A7CBD1;

Palette_Phantoon_HealthBased_5:
    dw $0004,$3AFB,$25F3,$00A9,$0046,$3256,$1DB2,$0D2D                   ;A7CBE1;
    dw $00EB,$6B5F,$2E56,$156F,$04EB,$301D,$1415,$000C                   ;A7CBF1;

Palette_Phantoon_HealthBased_6:
    dw $0002,$3F3B,$2A12,$00A7,$0044,$3675,$1DF1,$0D4C                   ;A7CC01;
    dw $04E9,$77BF,$3275,$158E,$050A,$341D,$1414,$000B                   ;A7CC11;

Palette_Phantoon_HealthBased_7:
    dw $0000,$477B,$2E52,$00C6,$0063,$3AB5,$2210,$116B                   ;A7CC21;
    dw $0508,$7FFF,$36B5,$19AD,$0929,$381D,$1814,$000A                   ;A7CC31;

InstList_Phantoon_Body_Invulnerable:
    dw $0001                                                             ;A7CC41;
    dw ExtendedSpritemap_Phantoon_Body_Invulnerable                      ;A7CC43;
    dw Instruction_Common_Sleep                                          ;A7CC45;

InstList_Phantoon_Body_FullHitbox:
    dw $0001                                                             ;A7CC47;
    dw ExtendedSpritemap_Phantoon_Body_FullHitbox                        ;A7CC49;
    dw Instruction_CommonA7_Sleep                                        ;A7CC4B;

InstList_Phantoon_Body_EyeHitboxOnly:
    dw $0001                                                             ;A7CC4D;
    dw ExtendedSpritemap_Phantoon_Body_EyeHitbox                         ;A7CC4F;
    dw Instruction_CommonA7_Sleep                                        ;A7CC51;

InstList_Phantoon_Eye_Open:
    dw $000A                                                             ;A7CC53;
    dw ExtendedSpritemap_Phantoon_Eye_Opening                            ;A7CC55;
    dw $000A                                                             ;A7CC57;
    dw ExtendedSpritemap_Phantoon_Eye_OpeningClosing                     ;A7CC59;
    dw $0001                                                             ;A7CC5B;
    dw ExtendedSpritemap_Phantoon_Eye_Open                               ;A7CC5D;
    dw Instruction_Common_CallFunctionInY                                ;A7CC5F;
    dw PlayPhantoonMaterializationSFX                                    ;A7CC61;
    dw Instruction_Common_CallFunctionInY                                ;A7CC63;
    dw SetupEyeOpenPhantoonState                                         ;A7CC65;
    dw Instruction_Common_Sleep                                          ;A7CC67;

UNUSED_InstList_Phantoon_Eye_Open_IgnoringSamus_A7CC69:
    dw $000A                                                             ;A7CC69;
    dw ExtendedSpritemap_Phantoon_Eye_Opening                            ;A7CC6B;
    dw $000A                                                             ;A7CC6D;
    dw ExtendedSpritemap_Phantoon_Eye_OpeningClosing                     ;A7CC6F;
    dw $0001                                                             ;A7CC71;
    dw ExtendedSpritemap_Phantoon_Eye_Open                               ;A7CC73;
    dw Instruction_Common_CallFunctionInY                                ;A7CC75;
    dw PlayPhantoonMaterializationSFX                                    ;A7CC77;
    dw Instruction_CommonA7_Sleep                                        ;A7CC79;

InstList_Phantoon_Eye_Closed:
    dw $0001                                                             ;A7CC7B;
    dw ExtendedSpritemap_Phantoon_Eye_Closed                             ;A7CC7D;
    dw Instruction_Common_Sleep                                          ;A7CC7F;

InstList_Phantoon_Eye_Close_PickNewPattern:
    dw $0001                                                             ;A7CC81;
    dw ExtendedSpritemap_Phantoon_Eye_Open                               ;A7CC83;
    dw $000A                                                             ;A7CC85;
    dw ExtendedSpritemap_Phantoon_Eye_OpeningClosing                     ;A7CC87;
    dw Instruction_Common_CallFunctionInY                                ;A7CC89;
    dw PickNewPhantoonPattern                                            ;A7CC8B;
    dw Instruction_Common_GotoY                                          ;A7CC8D;
    dw InstList_Phantoon_Eye_Closed                                      ;A7CC8F;

InstList_Phantoon_Eye_Close:
    dw $0001                                                             ;A7CC91;
    dw ExtendedSpritemap_Phantoon_Eye_Open                               ;A7CC93;
    dw $000A                                                             ;A7CC95;
    dw ExtendedSpritemap_Phantoon_Eye_OpeningClosing                     ;A7CC97;
    dw Instruction_Common_GotoY                                          ;A7CC99;
    dw InstList_Phantoon_Eye_Closed                                      ;A7CC9B;

InstList_Phantoon_Eyeball_Centered:
    dw $0001                                                             ;A7CC9D;
    dw ExtendedSpritemap_Phantoon_Eyeball_Centered                       ;A7CC9F;
    dw Instruction_Common_CallFunctionInY                                ;A7CCA1;
    dw PlayPhantoonMaterializationSFX                                    ;A7CCA3;
    dw Instruction_Common_Sleep                                          ;A7CCA5;

InstList_Phantoon_Eyeball_LookingUp:
    dw $0001                                                             ;A7CCA7;
    dw ExtendedSpritemap_Phantoon_Eyeball_LookingUp                      ;A7CCA9;
    dw Instruction_Common_Sleep                                          ;A7CCAB;

InstList_Phantoon_Eyeball_LookingUpRight:
    dw $0001                                                             ;A7CCAD;
    dw ExtendedSpritemap_Phantoon_Eyeball_LookingUpRight                 ;A7CCAF;
    dw Instruction_CommonA7_Sleep                                        ;A7CCB1;

InstList_Phantoon_Eyeball_LookingRight:
    dw $0001                                                             ;A7CCB3;
    dw ExtendedSpritemap_Phantoon_Eyeball_LookingRight                   ;A7CCB5;
    dw Instruction_CommonA7_Sleep                                        ;A7CCB7;

InstList_Phantoon_Eyeball_LookingDownRight:
    dw $0001                                                             ;A7CCB9;
    dw ExtendedSpritemap_Phantoon_Eyeball_LookingDownRight               ;A7CCBB;
    dw Instruction_Common_Sleep                                          ;A7CCBD;

InstList_Phantoon_Eyeball_LookingDown:
    dw $0001                                                             ;A7CCBF;
    dw ExtendedSpritemap_Phantoon_Eyeball_LookingDown                    ;A7CCC1;
    dw Instruction_Common_Sleep                                          ;A7CCC3;

InstList_Phantoon_Eyeball_LookingDownLeft:
    dw $0001                                                             ;A7CCC5;
    dw ExtendedSpritemap_Phantoon_Eyeball_LookingDownLeft                ;A7CCC7;
    dw Instruction_CommonA7_Sleep                                        ;A7CCC9;

InstList_Phantoon_Eyeball_LookingLeft:
    dw $0001                                                             ;A7CCCB;
    dw ExtendedSpritemap_Phantoon_Eyeball_LookingLeft                    ;A7CCCD;
    dw Instruction_CommonA7_Sleep                                        ;A7CCCF;

InstList_Phantoon_Eyeball_LookingUpLeft:
    dw $0001                                                             ;A7CCD1;
    dw ExtendedSpritemap_Phantoon_Eyeball_LookingUpLeft                  ;A7CCD3;
    dw Instruction_CommonA7_Sleep                                        ;A7CCD5;

InstList_Phantoon_Tentacles:
    dw $0008                                                             ;A7CCD7;
    dw ExtendedSpritemap_Phantoon_Tentacles_0                            ;A7CCD9;
    dw $0008                                                             ;A7CCDB;
    dw ExtendedSpritemap_Phantoon_Tentacles_1                            ;A7CCDD;
    dw $0008                                                             ;A7CCDF;
    dw ExtendedSpritemap_Phantoon_Tentacles_2                            ;A7CCE1;
    dw $0008                                                             ;A7CCE3;
    dw ExtendedSpritemap_Phantoon_Tentacles_1                            ;A7CCE5;
    dw Instruction_Common_GotoY                                          ;A7CCE7;
    dw InstList_Phantoon_Tentacles                                       ;A7CCE9;

InstList_Phantoon_Mouth_SpawnFlame:
    dw $0005                                                             ;A7CCEB;
    dw ExtendedSpritemap_Phantoon_Mouth_SpawningFlame_1                  ;A7CCED;
    dw $0005                                                             ;A7CCEF;
    dw ExtendedSpritemap_Phantoon_Mouth_SpawningFlame_0                  ;A7CCF1;
    dw Instruction_Common_CallFunctionInY                                ;A7CCF3;
    dw SpawnCasualFlame                                                  ;A7CCF5;

InstList_Phantoon_Mouth_Initial:
    dw $0001                                                             ;A7CCF7;
    dw ExtendedSpritemap_Phantoon_Mouth_Normal                           ;A7CCF9;
    dw Instruction_CommonA7_Sleep                                        ;A7CCFB;

CasualFlameTimers_pointers:
    dw CasualFlameTimers_pattern0                                        ;A7CCFD;
    dw CasualFlameTimers_pattern1                                        ;A7CCFF;
    dw CasualFlameTimers_pattern2                                        ;A7CD01;
    dw CasualFlameTimers_pattern3                                        ;A7CD03;

CasualFlameTimers_pattern0:
    dw $0005,$00B4,$0020,$0020,$0020,$0020,$0020                         ;A7CD05;

CasualFlameTimers_pattern1:
    dw $0003,$00B4,$0010,$0010,$0010                                     ;A7CD13;

CasualFlameTimers_pattern2:
    dw $0007,$00B4,$0030,$0030,$0030,$0030,$0030,$0030                   ;A7CD1D;
    dw $0030                                                             ;A7CD2D;

CasualFlameTimers_pattern3:
    dw $0007,$00B4,$0010,$0040,$0020,$0040,$0020,$0010                   ;A7CD2F;
    dw $0020                                                             ;A7CD3F;

Phantoon_Figure8_VulnerableWindowTimers:
    dw $003C,$001E,$000F,$001E,$003C,$001E,$000F,$003C                   ;A7CD41;

EmptyHDMATable:
    db $00,$00                                                           ;A7CD51;

Phantoon_EyeClosedTimers:
    dw $02D0,$003C,$0168,$02D0,$0168,$003C,$0168,$02D0                   ;A7CD53;

Phantoon_FlameRain_HidingTimers:
    dw $003C,$0078,$001E,$003C,$001E,$003C,$001E,$001E                   ;A7CD63;

Phantoon_Figure8_SubAcceleration_SlowStage:
    dw $0600                                                             ;A7CD73;

Phantoon_Figure8_Acceleration_SlowStage:
    dw $0000                                                             ;A7CD75;

Phantoon_Figure8_SubAcceleration_FastStages:
    dw $1000                                                             ;A7CD77;

Phantoon_Figure8_Acceleration_FastStages:
    dw $0000                                                             ;A7CD79;

Phantoon_Figure8_SpeedCaps_Stage0Max:
    dw $0002                                                             ;A7CD7B;

Phantoon_Figure8_SpeedCaps_Stage1Max:
    dw $0007                                                             ;A7CD7D;

Phantoon_Figure8_SpeedCaps_Stage2Min:
    dw $0000                                                             ;A7CD7F;

Phantoon_ReverseFigure8_SubAcceleration_SlowStage:
    dw $0600                                                             ;A7CD81;

Phantoon_ReverseFigure8_Acceleration_SlowStage:
    dw $0000                                                             ;A7CD83;

Phantoon_ReverseFigure8_SubAcceleration_FastStages:
    dw $1000                                                             ;A7CD85;

Phantoon_ReverseFigure8_Acceleration_FastStages:
    dw $0000                                                             ;A7CD87;

Phantoon_ReverseFigure8_SpeedCaps_Stage0Max:
    dw $FFFE                                                             ;A7CD89;

Phantoon_ReverseFigure8_SpeedCaps_Stage1Max:
    dw $FFF9                                                             ;A7CD8B;

Phantoon_ReverseFigure8_SpeedCaps_Stage2Min:
    dw $0000                                                             ;A7CD8D;

UNUSED_Phantoon_A7CD8F:
    dw $8000,$0000,$000B,$8000,$0000,$FFF5                               ;A7CD8F;

WavyPhantoonConstants_Intro_amplitudeDelta:
    dw $0040                                                             ;A7CD9B;

WavyPhantoonConstants_Intro_maxAmplitude:
    dw $0C00                                                             ;A7CD9D;

WavyPhantoonConstants_Dying_amplitudeDelta:
    dw $0100                                                             ;A7CD9F;

WavyPhantoonConstants_Dying_maxAmplitude:
    dw $F000                                                             ;A7CDA1;

WavyPhantoonConstants_phaseDelta:
    dw $0008                                                             ;A7CDA3;

Phantoon_Unknown0FEAValues_A7CDA5:
    db $06,$06,$08,$08,$06,$08,$06,$08                                   ;A7CDA5;

Phantoon_FlameRain_PositionTable_index:
    dw $0001                                                             ;A7CDAD;

Phantoon_FlameRain_PositionTable_XPosition:
    dw $0080                                                             ;A7CDAF;

Phantoon_FlameRain_PositionTable_YPosition:
    dw $0060,$0000,$0047,$00A8,$0040,$0000,$0088,$00D0                   ;A7CDB1;
    dw $0060,$0000,$00C9,$00A8,$0080,$0000,$0001,$0080                   ;A7CDC1;
    dw $0060,$0000,$014E,$0058,$0040,$0000,$018F,$0030                   ;A7CDD1;
    dw $0060,$0000,$01D1,$0058,$0080,$0000                               ;A7CDE1;

Phantoon_MaterializationSFX:
    dw $0079,$007A,$007B                                                 ;A7CDED;

InitAI_PhantoonBody:
    LDX.W #$0FFE                                                         ;A7CDF3;
    LDA.W #$0338                                                         ;A7CDF6;

.loopBG2Tilemap:
    STA.L $7E2000,X                                                      ;A7CDF9;
    DEX                                                                  ;A7CDFD;
    DEX                                                                  ;A7CDFE;
    BPL .loopBG2Tilemap                                                  ;A7CDFF;
    LDX.W #$07FE                                                         ;A7CE01;
    LDA.W #$0000                                                         ;A7CE04;

.loop9000:
    STA.L $7E9000,X                                                      ;A7CE07;
    DEX                                                                  ;A7CE0B;
    DEX                                                                  ;A7CE0C;
    BPL .loop9000                                                        ;A7CE0D;
    LDX.W #$001E                                                         ;A7CE0F;
    LDA.W #$0000                                                         ;A7CE12;

.loopBGPalette:
    STA.L $7EC2E0,X                                                      ;A7CE15;
    DEX                                                                  ;A7CE19;
    DEX                                                                  ;A7CE1A;
    BPL .loopBGPalette                                                   ;A7CE1B;
    LDA.W #$0360                                                         ;A7CE1D;
    STA.L $00179A                                                        ;A7CE20;
    JSL.L DisableMinimap_MarkBossRoomTilesExplored                       ;A7CE24;
    LDX.W $0E54                                                          ;A7CE28;
    LDA.W #$0078                                                         ;A7CE2B;
    STA.W EnemyData.work4,X                                              ;A7CE2E;
    STZ.W EnemyData.work0,X                                              ;A7CE31;
    STZ.W EnemyData.work1,X                                              ;A7CE34;
    LDA.W #$0000                                                         ;A7CE37;
    STA.L $7E9032                                                        ;A7CE3A;
    STZ.W $0FF4                                                          ;A7CE3E;
    STZ.W $0FF6                                                          ;A7CE41;
    LDA.W $0F86                                                          ;A7CE44;
    ORA.W #$0400                                                         ;A7CE47;
    STA.W $0F86                                                          ;A7CE4A;
    JSL.L Spawn_HDMAObject                                               ;A7CE4D;
    db $01,$14                                                           ;A7CE51;
    dw HDMAObjectInstList_Phantoon_SemiTransparency                      ;A7CE53;

InitAI_Phantoon_Eye_Tentacles_Mouth:
    LDX.W $0E54                                                          ;A7CE55;
    LDA.W #Spritemap_CommonA7_Nothing                                    ;A7CE58;
    STA.W EnemyData.pSpritemap,X                                         ;A7CE5B;
    LDA.W #$0001                                                         ;A7CE5E;
    STA.W EnemyData.instTimer,X                                          ;A7CE61;
    STZ.W EnemyData.loopCounter,X                                        ;A7CE64;
    LDA.W $0F96                                                          ;A7CE67;
    STA.W EnemyData.palette,X                                            ;A7CE6A;
    LDA.W $0F98                                                          ;A7CE6D;
    STA.W EnemyData.gfxOffset,X                                          ;A7CE70;
    LDA.W EnemyData.initParam1,X                                         ;A7CE73;
    ASL A                                                                ;A7CE76;
    TAY                                                                  ;A7CE77;
    LDA.W .instListPointers,Y                                            ;A7CE78;
    STA.W EnemyData.pInstList,X                                          ;A7CE7B;
    LDA.W #Function_Phantoon_FightIntro_SpawnCircleOfFlames              ;A7CE7E;
    STA.W EnemyData.work5,X                                              ;A7CE81;
    STZ.W $1074                                                          ;A7CE84;
    LDA.W #$FFFF                                                         ;A7CE87;
    STA.W $106C                                                          ;A7CE8A;
    RTL                                                                  ;A7CE8D;


.instListPointers:
    dw InstList_Phantoon_Body_Invulnerable                               ;A7CE8E;
    dw InstList_Phantoon_Eye_Closed                                      ;A7CE90;
    dw InstList_Phantoon_Tentacles                                       ;A7CE92;
    dw InstList_Phantoon_Mouth_Initial                                   ;A7CE94;

HDMAObjectInstList_Phantoon_SemiTransparency:
    dw Instruction_HDMAObject_HDMATableBank                              ;A7CE96;
    db $A7                                                               ;A7CE98;
    dw $0001                                                             ;A7CE99;
    dw EmptyHDMATable                                                    ;A7CE9B;
    dw Instruction_HDMAObject_PreInstructionInY                          ;A7CE9D;
    dl PreInstruction_PhantoonSemiTransparency                           ;A7CE9F;
    dw Instruction_HDMAObject_Sleep                                      ;A7CEA2;
    dw Instruction_HDMAObject_Delete                                     ;A7CEA4;

MainAI_Phantoon:
    LDX.W $0E54                                                          ;A7CEA6;
    JSR.W Phantoon_BrokenNothingness                                     ;A7CEA9;
    PEA.W .manualReturn-1                                                ;A7CEAC;
    JMP.W ($0FB2,X)                                                      ;A7CEAF;


.manualReturn:
    TXA                                                                  ;A7CEB2;
    BNE .return                                                          ;A7CEB3;
    LDA.W EnemyData.xPosition,X                                          ;A7CEB5;
    STA.W $0FBA,X                                                        ;A7CEB8;
    STA.W $0FFA,X                                                        ;A7CEBB;
    STA.W $103A,X                                                        ;A7CEBE;
    LDA.W EnemyData.yPosition,X                                          ;A7CEC1;
    STA.W $0FBE,X                                                        ;A7CEC4;
    STA.W $0FFE,X                                                        ;A7CEC7;
    STA.W $103E,X                                                        ;A7CECA;
    LDA.W $0FF4                                                          ;A7CECD;
    BNE .return                                                          ;A7CED0;
    LDA.W $0911                                                          ;A7CED2;
    SEC                                                                  ;A7CED5;
    SBC.W EnemyData.xPosition,X                                          ;A7CED6;
    SEC                                                                  ;A7CED9;
    SBC.W #$FFD8                                                         ;A7CEDA;
    STA.B $B5                                                            ;A7CEDD;
    LDA.W $0915                                                          ;A7CEDF;
    SEC                                                                  ;A7CEE2;
    SBC.W EnemyData.yPosition,X                                          ;A7CEE3;
    SEC                                                                  ;A7CEE6;
    SBC.W #$FFD8                                                         ;A7CEE7;
    STA.B $B7                                                            ;A7CEEA;

.return:
    RTL                                                                  ;A7CEEC;


PlayPhantoonMaterializationSFX:
    LDA.L $7E9032                                                        ;A7CEED;
    ASL A                                                                ;A7CEF1;
    TAY                                                                  ;A7CEF2;
    LDA.W Phantoon_MaterializationSFX,Y                                  ;A7CEF3;
    JSL.L QueueSound_Lib2_Max6                                           ;A7CEF6;
    LDA.L $7E9032                                                        ;A7CEFA;
    INC A                                                                ;A7CEFE;
    CMP.W #$0003                                                         ;A7CEFF;
    BMI .storeIndex                                                      ;A7CF02;
    LDA.W #$0000                                                         ;A7CF04;

.storeIndex:
    STA.L $7E9032                                                        ;A7CF07;
    RTS                                                                  ;A7CF0B;


Phantoon_BrokenNothingness:
    TXA                                                                  ;A7CF0C;
    BNE .return                                                          ;A7CF0D;
    LDA.B $8F                                                            ;A7CF0F;
    BIT.W #$4000                                                         ;A7CF11;
    BEQ .return                                                          ;A7CF14;
    LDA.W $9030,X                                                        ;A7CF16;
    BNE .nonZero                                                         ;A7CF19;
    LDA.W #$0001                                                         ;A7CF1B;
    STA.W $9030,X                                                        ;A7CF1E;
    BRA .return                                                          ;A7CF21;


.nonZero:
    STZ.W $9030,X                                                        ;A7CF23;

.return:
    RTS                                                                  ;A7CF26;


GrowShrinkPhantoonWaveAmplitude:
    LDA.W $1070                                                          ;A7CF27;
    BNE .shrinking                                                       ;A7CF2A;
    LDA.B $14                                                            ;A7CF2C;
    AND.W #$FF00                                                         ;A7CF2E;
    XBA                                                                  ;A7CF31;
    STA.B $16                                                            ;A7CF32;
    LDA.W $106E                                                          ;A7CF34;
    CLC                                                                  ;A7CF37;
    ADC.B $12                                                            ;A7CF38;
    STA.W $106E                                                          ;A7CF3A;
    AND.W #$FF00                                                         ;A7CF3D;
    XBA                                                                  ;A7CF40;
    CMP.B $16                                                            ;A7CF41;
    BMI .returnNotCompletedCycle                                         ;A7CF43;
    LDA.B $14                                                            ;A7CF45;
    STA.W $106E                                                          ;A7CF47;
    BRA .returnNotCompletedCycle                                         ;A7CF4A;


.shrinking:
    LDA.W $106E                                                          ;A7CF4C;
    SEC                                                                  ;A7CF4F;
    SBC.B $12                                                            ;A7CF50;
    STA.W $106E                                                          ;A7CF52;
    BCS .returnNotCompletedCycle                                         ;A7CF55;
    STZ.W $106E                                                          ;A7CF57;
    SEC                                                                  ;A7CF5A;
    RTS                                                                  ;A7CF5B;


.returnNotCompletedCycle:
    CLC                                                                  ;A7CF5C;
    RTS                                                                  ;A7CF5D;


SpawnCasualFlame:
    LDA.W #$0000                                                         ;A7CF5E;
    LDY.W #EnemyProjectile_PhantoonDestroyableFlames                     ;A7CF61;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A7CF64;
    LDA.W #$001D                                                         ;A7CF68;
    JSL.L QueueSound_Lib3_Max6                                           ;A7CF6B;
    RTS                                                                  ;A7CF6F;


PhantoonMaterializationFlameSpiral:
    LDY.W #$0007                                                         ;A7CF70;

.loop:
    PHY                                                                  ;A7CF73;
    TYA                                                                  ;A7CF74;
    ORA.W #$0600                                                         ;A7CF75;
    LDY.W #EnemyProjectile_PhantoonDestroyableFlames                     ;A7CF78;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A7CF7B;
    PLY                                                                  ;A7CF7F;
    DEY                                                                  ;A7CF80;
    BPL .loop                                                            ;A7CF81;
    LDA.W #$0028                                                         ;A7CF83;
    JSL.L QueueSound_Lib3_Max6                                           ;A7CF86;
    RTS                                                                  ;A7CF8A;


SpawnFlameRainProjectiles:
    TAY                                                                  ;A7CF8B;
    LDA.W .firstFlamePositions,Y                                         ;A7CF8C;
    AND.W #$00FF                                                         ;A7CF8F;
    TAY                                                                  ;A7CF92;
    LDA.W #$0007                                                         ;A7CF93;
    STA.B $12                                                            ;A7CF96;
    LDA.W #$0010                                                         ;A7CF98;
    STA.B $14                                                            ;A7CF9B;

.loop:
    TYA                                                                  ;A7CF9D;
    ORA.W #$0400                                                         ;A7CF9E;
    ORA.B $14                                                            ;A7CFA1;
    PHY                                                                  ;A7CFA3;
    LDY.W #EnemyProjectile_PhantoonDestroyableFlames                     ;A7CFA4;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A7CFA7;
    PLY                                                                  ;A7CFAB;
    INY                                                                  ;A7CFAC;
    CPY.W #$0009                                                         ;A7CFAD;
    BMI +                                                                ;A7CFB0;
    LDY.W #$0000                                                         ;A7CFB2;

  + LDA.B $14                                                            ;A7CFB5;
    CLC                                                                  ;A7CFB7;
    ADC.W #$0010                                                         ;A7CFB8;
    STA.B $14                                                            ;A7CFBB;
    DEC.B $12                                                            ;A7CFBD;
    BPL .loop                                                            ;A7CFBF;
    RTS                                                                  ;A7CFC1;


.firstFlamePositions:
    db $05,$07,$00,$07,$05,$03,$01,$03                                   ;A7CFC2;

HandleCasualFlames:
    DEC.W $106A,X                                                        ;A7CFCA;
    BEQ .timerExpired                                                    ;A7CFCD;
    BPL .return                                                          ;A7CFCF;

.timerExpired:
    LDA.W $106C,X                                                        ;A7CFD1;
    BPL .positiveIndex                                                   ;A7CFD4;
    JSL.L GenerateRandomNumber                                           ;A7CFD6;
    AND.W #$0003                                                         ;A7CFDA;
    STA.W $1068,X                                                        ;A7CFDD;
    ASL A                                                                ;A7CFE0;
    TAY                                                                  ;A7CFE1;
    LDA.W CasualFlameTimers_pointers,Y                                   ;A7CFE2;
    TAY                                                                  ;A7CFE5;
    LDA.W $0000,Y                                                        ;A7CFE6;
    STA.W $106C,X                                                        ;A7CFE9;
    ASL A                                                                ;A7CFEC;
    STA.B $12                                                            ;A7CFED;
    TYA                                                                  ;A7CFEF;
    CLC                                                                  ;A7CFF0;
    ADC.B $12                                                            ;A7CFF1;
    TAY                                                                  ;A7CFF3;
    LDA.W $0002,Y                                                        ;A7CFF4;
    STA.W $106A,X                                                        ;A7CFF7;
    BRA .return                                                          ;A7CFFA;


.positiveIndex:
    DEC.W $106C,X                                                        ;A7CFFC;
    BEQ .indexReachedZero                                                ;A7CFFF;
    BPL .nonZeroTimer                                                    ;A7D001;

.indexReachedZero:
    LDA.W #$FFFF                                                         ;A7D003;
    STA.W $106C,X                                                        ;A7D006;
    LDA.W $1068,X                                                        ;A7D009;
    ASL A                                                                ;A7D00C;
    TAY                                                                  ;A7D00D;
    LDA.W CasualFlameTimers_pointers,Y                                   ;A7D00E;
    TAY                                                                  ;A7D011;
    LDA.W $0002,Y                                                        ;A7D012;
    STA.W $106A,X                                                        ;A7D015;
    BRA +                                                                ;A7D018;


.nonZeroTimer:
    LDA.W $106C,X                                                        ;A7D01A;
    ASL A                                                                ;A7D01D;
    STA.B $12                                                            ;A7D01E;
    LDA.W $1068,X                                                        ;A7D020;
    ASL A                                                                ;A7D023;
    TAY                                                                  ;A7D024;
    LDA.W CasualFlameTimers_pointers,Y                                   ;A7D025;
    CLC                                                                  ;A7D028;
    ADC.B $12                                                            ;A7D029;
    TAY                                                                  ;A7D02B;
    LDA.W $0002,Y                                                        ;A7D02C;
    STA.W $106A,X                                                        ;A7D02F;

  + LDA.W #$0001                                                         ;A7D032;
    STA.W $1054,X                                                        ;A7D035;
    LDA.W #InstList_Phantoon_Mouth_SpawnFlame                            ;A7D038;
    STA.W $1052,X                                                        ;A7D03B;

.return:
    RTS                                                                  ;A7D03E;


SetupEyeOpenPhantoonState:
    STZ.W $1028                                                          ;A7D03F;
    LDA.W #$0001                                                         ;A7D042;
    STA.W $0F94                                                          ;A7D045;
    STA.W $0FD4                                                          ;A7D048;
    LDA.W #InstList_Phantoon_Body_EyeHitboxOnly                          ;A7D04B;
    STA.W $0F92                                                          ;A7D04E;
    LDA.W #InstList_Phantoon_Eyeball_Centered                            ;A7D051;
    STA.W $0FD2                                                          ;A7D054;
    LDA.W $0F86                                                          ;A7D057;
    AND.W #$FBFF                                                         ;A7D05A;
    STA.W $0F86                                                          ;A7D05D;
    JSL.L GenerateRandomNumber                                           ;A7D060;
    AND.W #$0007                                                         ;A7D064;
    ASL A                                                                ;A7D067;
    TAY                                                                  ;A7D068;
    LDA.W Phantoon_Figure8_VulnerableWindowTimers,Y                      ;A7D069;
    STA.W $0FB0                                                          ;A7D06C;
    LDA.W #Function_Phantoon_Figure8_VulnerableWindow                    ;A7D06F;
    STA.W $0FB2                                                          ;A7D072;
    RTS                                                                  ;A7D075;


PickNewPhantoonPattern:
    LDA.W #$003C                                                         ;A7D076;
    STA.W $0FB0                                                          ;A7D079;
    JSL.L GenerateRandomNumber                                           ;A7D07C;
    AND.W #$0007                                                         ;A7D080;
    ASL A                                                                ;A7D083;
    TAY                                                                  ;A7D084;
    LDA.W Phantoon_EyeClosedTimers,Y                                     ;A7D085;
    STA.W $0FE8                                                          ;A7D088;
    LDA.W $05B6                                                          ;A7D08B;
    BIT.W #$0001                                                         ;A7D08E;
    BNE .reversed                                                        ;A7D091;
    LDA.W $0FEC                                                          ;A7D093;
    BEQ +                                                                ;A7D096;
    LDA.W $0FA8                                                          ;A7D098;
    INC A                                                                ;A7D09B;
    STA.W $0FA8                                                          ;A7D09C;
    CMP.W #$0216                                                         ;A7D09F;
    BMI +                                                                ;A7D0A2;
    STZ.W $0FA8                                                          ;A7D0A4;

  + LDA.W #$0001                                                         ;A7D0A7;
    STA.W $0FAC                                                          ;A7D0AA;
    STZ.W $0FAA                                                          ;A7D0AD;
    STZ.W $0FAE                                                          ;A7D0B0;
    STZ.W $0FEC                                                          ;A7D0B3;
    BRA .merge                                                           ;A7D0B6;


.reversed:
    LDA.W $0FEC                                                          ;A7D0B8;
    BNE +                                                                ;A7D0BB;
    LDA.W $0FA8                                                          ;A7D0BD;
    DEC A                                                                ;A7D0C0;
    STA.W $0FA8                                                          ;A7D0C1;
    BPL +                                                                ;A7D0C4;
    LDA.W #$0215                                                         ;A7D0C6;
    STA.W $0FA8                                                          ;A7D0C9;

  + STZ.W $0FAC                                                          ;A7D0CC;
    STZ.W $0FAA                                                          ;A7D0CF;
    STZ.W $0FAE                                                          ;A7D0D2;
    LDA.W #$0001                                                         ;A7D0D5;
    STA.W $0FEC                                                          ;A7D0D8;

.merge:
    LDA.W $0FB6                                                          ;A7D0DB;
    BNE +                                                                ;A7D0DE;
    LDA.W #Function_Phantoon_Figure8_Moving                              ;A7D0E0;
    STA.W $0FB2                                                          ;A7D0E3;
    RTS                                                                  ;A7D0E6;


  + STZ.W $0FF2                                                          ;A7D0E7;
    LDA.W #Function_Phantoon_FlameRain_InitialFlameRain                  ;A7D0EA;
    STA.W $0FB2                                                          ;A7D0ED;
    RTS                                                                  ;A7D0F0;


AdjustSpeedAndMovePhantoonInFigure8:
    LDA.W $0FEC                                                          ;A7D0F1;
    BNE .reversed                                                        ;A7D0F4;
    JSR.W UpdateFigure8PhantoonSpeed                                     ;A7D0F6;
    LDY.W #PhantoonMovementData                                          ;A7D0F9;
    LDA.W #$0216                                                         ;A7D0FC;
    STA.B $14                                                            ;A7D0FF;
    JSR.W MovePhantoonInFigure8                                          ;A7D101;
    RTS                                                                  ;A7D104;


.reversed:
    JSR.W UpdateReversedFigure8PhantoonSpeed                             ;A7D105;
    LDY.W #PhantoonMovementData                                          ;A7D108;
    LDA.W #$0215                                                         ;A7D10B;
    STA.B $14                                                            ;A7D10E;
    JSR.W MovePhantoonInReverseFigure8                                   ;A7D110;
    RTS                                                                  ;A7D113;


UpdateFigure8PhantoonSpeed:
    LDA.W $0FAE                                                          ;A7D114;
    BEQ .stage0                                                          ;A7D117;
    BIT.W #$0001                                                         ;A7D119;
    BNE .stage1                                                          ;A7D11C;
    BRA .stage2                                                          ;A7D11E;


.stage0:
    LDA.W $0FAA                                                          ;A7D120;
    CLC                                                                  ;A7D123;
    ADC.W Phantoon_Figure8_SubAcceleration_SlowStage                     ;A7D124;
    STA.W $0FAA                                                          ;A7D127;
    LDA.W $0FAC                                                          ;A7D12A;
    ADC.W Phantoon_Figure8_Acceleration_SlowStage                        ;A7D12D;
    STA.W $0FAC                                                          ;A7D130;
    CMP.W Phantoon_Figure8_SpeedCaps_Stage0Max                           ;A7D133;
    BMI ..return                                                         ;A7D136;
    LDA.W Phantoon_Figure8_SpeedCaps_Stage0Max                           ;A7D138;
    DEC A                                                                ;A7D13B;
    STA.W $0FAC                                                          ;A7D13C;
    STZ.W $0FAA                                                          ;A7D13F;
    INC.W $0FAE                                                          ;A7D142;

..return:
    RTS                                                                  ;A7D145;


.stage1:
    LDA.W $0FAA                                                          ;A7D146;
    CLC                                                                  ;A7D149;
    ADC.W Phantoon_Figure8_SubAcceleration_FastStages                    ;A7D14A;
    STA.W $0FAA                                                          ;A7D14D;
    LDA.W $0FAC                                                          ;A7D150;
    ADC.W Phantoon_Figure8_Acceleration_FastStages                       ;A7D153;
    STA.W $0FAC                                                          ;A7D156;
    CMP.W Phantoon_Figure8_SpeedCaps_Stage1Max                           ;A7D159;
    BMI ..return                                                         ;A7D15C;
    LDA.W Phantoon_Figure8_SpeedCaps_Stage1Max                           ;A7D15E;
    STA.W $0FAC                                                          ;A7D161;
    STZ.W $0FAA                                                          ;A7D164;
    INC.W $0FAE                                                          ;A7D167;

..return:
    RTS                                                                  ;A7D16A;


.stage2:
    LDA.W $0FAA                                                          ;A7D16B;
    SEC                                                                  ;A7D16E;
    SBC.W Phantoon_Figure8_SubAcceleration_FastStages                    ;A7D16F;
    STA.W $0FAA                                                          ;A7D172;
    LDA.W $0FAC                                                          ;A7D175;
    SBC.W Phantoon_Figure8_Acceleration_FastStages                       ;A7D178;
    STA.W $0FAC                                                          ;A7D17B;
    CMP.W Phantoon_Figure8_SpeedCaps_Stage2Min                           ;A7D17E;
    BEQ .negativeSpeed                                                   ;A7D181;
    BPL .return                                                          ;A7D183;

.negativeSpeed:
    LDA.W Phantoon_Figure8_SpeedCaps_Stage2Min                           ;A7D185;
    INC A                                                                ;A7D188;
    STA.W $0FAC                                                          ;A7D189;
    STZ.W $0FAA                                                          ;A7D18C;
    STZ.W $0FAE                                                          ;A7D18F;

.return:
    RTS                                                                  ;A7D192;


UpdateReversedFigure8PhantoonSpeed:
    LDA.W $0FAE                                                          ;A7D193;
    BEQ .stage0                                                          ;A7D196;
    BIT.W #$0001                                                         ;A7D198;
    BNE .stage1                                                          ;A7D19B;
    BRA .stage2                                                          ;A7D19D;


.stage0:
    LDA.W $0FAA                                                          ;A7D19F;
    SEC                                                                  ;A7D1A2;
    SBC.W Phantoon_ReverseFigure8_SubAcceleration_SlowStage              ;A7D1A3;
    STA.W $0FAA                                                          ;A7D1A6;
    LDA.W $0FAC                                                          ;A7D1A9;
    SBC.W Phantoon_ReverseFigure8_Acceleration_SlowStage                 ;A7D1AC;
    STA.W $0FAC                                                          ;A7D1AF;
    CMP.W Phantoon_ReverseFigure8_SpeedCaps_Stage0Max                    ;A7D1B2;
    BEQ +                                                                ;A7D1B5;
    BPL .stage0_return                                                   ;A7D1B7;

  + LDA.W Phantoon_ReverseFigure8_SpeedCaps_Stage0Max                    ;A7D1B9;
    INC A                                                                ;A7D1BC;
    INC A                                                                ;A7D1BD;
    STA.W $0FAC                                                          ;A7D1BE;
    STZ.W $0FAA                                                          ;A7D1C1;
    INC.W $0FAE                                                          ;A7D1C4;

.stage0_return:
    RTS                                                                  ;A7D1C7;


.stage1:
    LDA.W $0FAA                                                          ;A7D1C8;
    SEC                                                                  ;A7D1CB;
    SBC.W Phantoon_ReverseFigure8_SubAcceleration_FastStages             ;A7D1CC;
    STA.W $0FAA                                                          ;A7D1CF;
    LDA.W $0FAC                                                          ;A7D1D2;
    SBC.W Phantoon_ReverseFigure8_Acceleration_FastStages                ;A7D1D5;
    STA.W $0FAC                                                          ;A7D1D8;
    CMP.W Phantoon_ReverseFigure8_SpeedCaps_Stage1Max                    ;A7D1DB;
    BEQ +                                                                ;A7D1DE;
    BPL .stage1_return                                                   ;A7D1E0;

  + LDA.W Phantoon_ReverseFigure8_SpeedCaps_Stage1Max                    ;A7D1E2;
    INC A                                                                ;A7D1E5;
    STA.W $0FAC                                                          ;A7D1E6;
    STZ.W $0FAA                                                          ;A7D1E9;
    INC.W $0FAE                                                          ;A7D1EC;

.stage1_return:
    RTS                                                                  ;A7D1EF;


.stage2:
    LDA.W $0FAA                                                          ;A7D1F0;
    CLC                                                                  ;A7D1F3;
    ADC.W Phantoon_ReverseFigure8_SubAcceleration_FastStages             ;A7D1F4;
    STA.W $0FAA                                                          ;A7D1F7;
    LDA.W $0FAC                                                          ;A7D1FA;
    ADC.W Phantoon_ReverseFigure8_Acceleration_FastStages                ;A7D1FD;
    STA.W $0FAC                                                          ;A7D200;
    CMP.W Phantoon_ReverseFigure8_SpeedCaps_Stage2Min                    ;A7D203;
    BMI ..return                                                         ;A7D206;
    LDA.W Phantoon_ReverseFigure8_SpeedCaps_Stage2Min                    ;A7D208;
    STA.W $0FAC                                                          ;A7D20B;
    STZ.W $0FAA                                                          ;A7D20E;
    STZ.W $0FAE                                                          ;A7D211;

..return:
    RTS                                                                  ;A7D214;


MovePhantoonInFigure8:
    LDA.W $0FAC                                                          ;A7D215;
    STA.B $16                                                            ;A7D218;
    BNE .loop                                                            ;A7D21A;
    RTS                                                                  ;A7D21C;


.loop:
    PHY                                                                  ;A7D21D;
    LDA.W $0FA8                                                          ;A7D21E;
    ASL A                                                                ;A7D221;
    STA.B $12                                                            ;A7D222;
    TYA                                                                  ;A7D224;
    CLC                                                                  ;A7D225;
    ADC.B $12                                                            ;A7D226;
    TAY                                                                  ;A7D228;
    LDA.W $0000,Y                                                        ;A7D229;
    AND.W #$00FF                                                         ;A7D22C;
    BIT.W #$0080                                                         ;A7D22F;
    BEQ +                                                                ;A7D232;
    ORA.W #$FF00                                                         ;A7D234;

  + STA.B $12                                                            ;A7D237;
    LDA.W $0F7A                                                          ;A7D239;
    CLC                                                                  ;A7D23C;
    ADC.B $12                                                            ;A7D23D;
    STA.W $0F7A                                                          ;A7D23F;
    LDA.W $0001,Y                                                        ;A7D242;
    AND.W #$00FF                                                         ;A7D245;
    BIT.W #$0080                                                         ;A7D248;
    BEQ +                                                                ;A7D24B;
    ORA.W #$FF00                                                         ;A7D24D;

  + STA.B $12                                                            ;A7D250;
    LDA.W $0F7E                                                          ;A7D252;
    CLC                                                                  ;A7D255;
    ADC.B $12                                                            ;A7D256;
    STA.W $0F7E                                                          ;A7D258;
    LDA.W $0FA8                                                          ;A7D25B;
    INC A                                                                ;A7D25E;
    STA.W $0FA8                                                          ;A7D25F;
    CMP.B $14                                                            ;A7D262;
    BMI +                                                                ;A7D264;
    STZ.W $0FA8                                                          ;A7D266;

  + PLY                                                                  ;A7D269;
    DEC.B $16                                                            ;A7D26A;
    BEQ .return                                                          ;A7D26C;
    BRA .loop                                                            ;A7D26E;


.return:
    RTS                                                                  ;A7D270;


MovePhantoonInReverseFigure8:
    LDA.W $0FAC                                                          ;A7D271;
    EOR.W #$FFFF                                                         ;A7D274;
    INC A                                                                ;A7D277;
    STA.B $16                                                            ;A7D278;
    BNE .loop                                                            ;A7D27A;
    RTS                                                                  ;A7D27C;


.loop:
    PHY                                                                  ;A7D27D;
    LDA.W $0FA8                                                          ;A7D27E;
    ASL A                                                                ;A7D281;
    STA.B $12                                                            ;A7D282;
    TYA                                                                  ;A7D284;
    CLC                                                                  ;A7D285;
    ADC.B $12                                                            ;A7D286;
    TAY                                                                  ;A7D288;
    LDA.W $0000,Y                                                        ;A7D289;
    AND.W #$00FF                                                         ;A7D28C;
    BIT.W #$0080                                                         ;A7D28F;
    BEQ +                                                                ;A7D292;
    ORA.W #$FF00                                                         ;A7D294;

  + STA.B $12                                                            ;A7D297;
    LDA.W $0F7A                                                          ;A7D299;
    SEC                                                                  ;A7D29C;
    SBC.B $12                                                            ;A7D29D;
    STA.W $0F7A                                                          ;A7D29F;
    LDA.W $0001,Y                                                        ;A7D2A2;
    AND.W #$00FF                                                         ;A7D2A5;
    BIT.W #$0080                                                         ;A7D2A8;
    BEQ +                                                                ;A7D2AB;
    ORA.W #$FF00                                                         ;A7D2AD;

  + STA.B $12                                                            ;A7D2B0;
    LDA.W $0F7E                                                          ;A7D2B2;
    SEC                                                                  ;A7D2B5;
    SBC.B $12                                                            ;A7D2B6;
    STA.W $0F7E                                                          ;A7D2B8;
    LDA.W $0FA8                                                          ;A7D2BB;
    DEC A                                                                ;A7D2BE;
    STA.W $0FA8                                                          ;A7D2BF;
    BPL +                                                                ;A7D2C2;
    LDA.B $14                                                            ;A7D2C4;
    STA.W $0FA8                                                          ;A7D2C6;

  + PLY                                                                  ;A7D2C9;
    DEC.B $16                                                            ;A7D2CA;
    BEQ .return                                                          ;A7D2CC;
    BRA .loop                                                            ;A7D2CE;


.return:
    RTS                                                                  ;A7D2D0;


MovePhantoonInSwoopingPattern:
    LDA.W $1030                                                          ;A7D2D1;
    BMI .targetXNegative                                                 ;A7D2D4;
    CLC                                                                  ;A7D2D6;
    ADC.W #$0002                                                         ;A7D2D7;
    STA.W $1030                                                          ;A7D2DA;
    CMP.W #$0100                                                         ;A7D2DD;
    BMI .targetCalculated                                                ;A7D2E0;
    ORA.W #$8000                                                         ;A7D2E2;
    STA.W $1030                                                          ;A7D2E5;
    AND.W #$7FFF                                                         ;A7D2E8;
    BRA .targetCalculated                                                ;A7D2EB;


.targetXNegative:
    SEC                                                                  ;A7D2ED;
    SBC.W #$0002                                                         ;A7D2EE;
    STA.W $1030                                                          ;A7D2F1;
    AND.W #$7FFF                                                         ;A7D2F4;
    BEQ +                                                                ;A7D2F7;
    BPL .targetCalculated                                                ;A7D2F9;

  + LDA.W #$0000                                                         ;A7D2FB;
    STA.W $1030                                                          ;A7D2FE;

.targetCalculated:
    CMP.W $0F7A                                                          ;A7D301;
    BMI .lessThanX                                                       ;A7D304;
    LDA.W $102C                                                          ;A7D306;
    CMP.W #$0800                                                         ;A7D309;
    BPL +                                                                ;A7D30C;
    CLC                                                                  ;A7D30E;
    ADC.W #$0020                                                         ;A7D30F;
    STA.W $102C                                                          ;A7D312;
    BRA +                                                                ;A7D315;


.lessThanX:
    LDA.W $102C                                                          ;A7D317;
    CMP.W #$F801                                                         ;A7D31A;
    BMI +                                                                ;A7D31D;
    SEC                                                                  ;A7D31F;
    SBC.W #$0020                                                         ;A7D320;
    STA.W $102C                                                          ;A7D323;

  + LDA.W $102C                                                          ;A7D326;
    XBA                                                                  ;A7D329;
    PHA                                                                  ;A7D32A;
    AND.W #$FF00                                                         ;A7D32B;
    STA.B $14                                                            ;A7D32E;
    PLA                                                                  ;A7D330;
    AND.W #$00FF                                                         ;A7D331;
    BIT.W #$0080                                                         ;A7D334;
    BEQ +                                                                ;A7D337;
    ORA.W #$FF00                                                         ;A7D339;

  + STA.B $12                                                            ;A7D33C;
    LDA.W $0F7C                                                          ;A7D33E;
    CLC                                                                  ;A7D341;
    ADC.B $14                                                            ;A7D342;
    STA.W $0F7C                                                          ;A7D344;
    LDA.W $0F7A                                                          ;A7D347;
    ADC.B $12                                                            ;A7D34A;
    STA.W $0F7A                                                          ;A7D34C;
    CMP.W #$FFC0                                                         ;A7D34F;
    BPL +                                                                ;A7D352;
    LDA.W #$FFC0                                                         ;A7D354;
    STA.W $0F7A                                                          ;A7D357;
    BRA .checkDead                                                       ;A7D35A;


  + CMP.W #$01C0                                                         ;A7D35C;
    BMI .checkDead                                                       ;A7D35F;
    LDA.W #$01C0                                                         ;A7D361;
    STA.W $0F7A                                                          ;A7D364;

.checkDead:
    LDA.W EnemyData.work5,X                                              ;A7D367;
    CMP.W #Function_Phantoon_Swooping_FatalDamage                        ;A7D36A;
    BNE .notDeathSwoop                                                   ;A7D36D;
    LDA.W #$0070                                                         ;A7D36F;
    BRA +                                                                ;A7D372;


.notDeathSwoop:
    LDA.W $0AFA                                                          ;A7D374;
    SEC                                                                  ;A7D377;
    SBC.W #$0030                                                         ;A7D378;

  + CMP.W $0F7E                                                          ;A7D37B;
    BMI .lessThanY                                                       ;A7D37E;
    LDA.W $102E                                                          ;A7D380;
    CMP.W #$0600                                                         ;A7D383;
    BPL +                                                                ;A7D386;
    CLC                                                                  ;A7D388;
    ADC.W #$0040                                                         ;A7D389;
    STA.W $102E                                                          ;A7D38C;
    BRA +                                                                ;A7D38F;


.lessThanY:
    LDA.W $102E                                                          ;A7D391;
    CMP.W #$FA01                                                         ;A7D394;
    BMI +                                                                ;A7D397;
    SEC                                                                  ;A7D399;
    SBC.W #$0040                                                         ;A7D39A;
    STA.W $102E                                                          ;A7D39D;

  + LDA.W $102E                                                          ;A7D3A0;
    XBA                                                                  ;A7D3A3;
    PHA                                                                  ;A7D3A4;
    AND.W #$FF00                                                         ;A7D3A5;
    STA.B $14                                                            ;A7D3A8;
    PLA                                                                  ;A7D3AA;
    AND.W #$00FF                                                         ;A7D3AB;
    BIT.W #$0080                                                         ;A7D3AE;
    BEQ +                                                                ;A7D3B1;
    ORA.W #$FF00                                                         ;A7D3B3;

  + STA.B $12                                                            ;A7D3B6;
    LDA.W $0F80                                                          ;A7D3B8;
    CLC                                                                  ;A7D3BB;
    ADC.B $14                                                            ;A7D3BC;
    STA.W $0F80                                                          ;A7D3BE;
    LDA.W $0F7E                                                          ;A7D3C1;
    ADC.B $12                                                            ;A7D3C4;
    STA.W $0F7E                                                          ;A7D3C6;
    CMP.W #$0040                                                         ;A7D3C9;
    BPL +                                                                ;A7D3CC;
    LDA.W #$0040                                                         ;A7D3CE;
    STA.W $0F7E                                                          ;A7D3D1;
    RTS                                                                  ;A7D3D4;


  + CMP.W #$00D8                                                         ;A7D3D5;
    BMI .return                                                          ;A7D3D8;
    LDA.W #$00D8                                                         ;A7D3DA;
    STA.W $0F7E                                                          ;A7D3DD;

.return:
    RTS                                                                  ;A7D3E0;


StartPhantoonSwoopingPattern:
    LDA.W #$0400                                                         ;A7D3E1;
    STA.W $102C                                                          ;A7D3E4;
    STA.W $102E                                                          ;A7D3E7;
    STZ.W $1030                                                          ;A7D3EA;
    LDA.W #Function_Phantoon_Swooping_Opaque                             ;A7D3ED;
    STA.W EnemyData.work5,X                                              ;A7D3F0;
    LDA.W #$0168                                                         ;A7D3F3;
    STA.W EnemyData.work4,X                                              ;A7D3F6;
    RTS                                                                  ;A7D3F9;


MakePhantoonLookTowardsSamus:
    JSL.L DetermineDirectionOfSamusFromEnemy                             ;A7D3FA;
    ASL A                                                                ;A7D3FE;
    TAY                                                                  ;A7D3FF;
    LDA.W #$0001                                                         ;A7D400;
    STA.W $0FD4                                                          ;A7D403;
    LDA.W .directionPointers,Y                                           ;A7D406;
    STA.W $0FD2                                                          ;A7D409;
    RTS                                                                  ;A7D40C;


.directionPointers:
    dw InstList_Phantoon_Eyeball_LookingUp                               ;A7D40D;
    dw InstList_Phantoon_Eyeball_LookingUpRight                          ;A7D40F;
    dw InstList_Phantoon_Eyeball_LookingRight                            ;A7D411;
    dw InstList_Phantoon_Eyeball_LookingDownRight                        ;A7D413;
    dw InstList_Phantoon_Eyeball_LookingDown                             ;A7D415;
    dw InstList_Phantoon_Eyeball_LookingDown                             ;A7D417;
    dw InstList_Phantoon_Eyeball_LookingDownLeft                         ;A7D419;
    dw InstList_Phantoon_Eyeball_LookingLeft                             ;A7D41B;
    dw InstList_Phantoon_Eyeball_LookingUpLeft                           ;A7D41D;
    dw InstList_Phantoon_Eyeball_LookingUp                               ;A7D41F;

StartPhantoonDeathSequence:
    PHX                                                                  ;A7D421;
    LDA.W EnemyData.work5,X                                              ;A7D422;
    CMP.W #Function_Phantoon_Swooping_Opaque                             ;A7D425;
    BEQ .swooping                                                        ;A7D428;
    CMP.W #Function_Phantoon_Swooping_FadeOut                            ;A7D42A;
    BEQ .swooping                                                        ;A7D42D;
    LDA.W #Function_Phantoon_DeathSequence_FadingInAndOut                ;A7D42F;
    STA.W EnemyData.work5,X                                              ;A7D432;
    BRA +                                                                ;A7D435;


.swooping:
    LDA.W #Function_Phantoon_Swooping_FatalDamage                        ;A7D437;
    STA.W EnemyData.work5,X                                              ;A7D43A;

  + STZ.W $0FEC                                                          ;A7D43D;
    STZ.W $0FF2                                                          ;A7D440;
    JSR.W MakePhantoonLookTowardsSamus                                   ;A7D443;
    LDX.W #$01FE                                                         ;A7D446;
    LDA.B $B5                                                            ;A7D449;

.loopBG2XScroll:
    STA.L $7E9100,X                                                      ;A7D44B;
    DEX                                                                  ;A7D44F;
    DEX                                                                  ;A7D450;
    BPL .loopBG2XScroll                                                  ;A7D451;
    LDA.W $1988                                                          ;A7D453;
    ORA.W #$4000                                                         ;A7D456;
    STA.W $1988                                                          ;A7D459;
    LDA.W #$0001                                                         ;A7D45C;
    STA.W $1076                                                          ;A7D45F;
    PLX                                                                  ;A7D462;
    RTS                                                                  ;A7D463;


AdvancePhantoonFadeOut_DenominatorInA:
    PHX                                                                  ;A7D464;
    STA.B $12                                                            ;A7D465;
    LDA.W $05B6                                                          ;A7D467;
    BIT.W #$0001                                                         ;A7D46A;
    BNE .return                                                          ;A7D46D;
    LDA.W $0FF2                                                          ;A7D46F;
    BNE .return                                                          ;A7D472;
    LDA.B $12                                                            ;A7D474;
    STA.W $0FEE                                                          ;A7D476;
    JSR.W AdvancePhantoonFadeOut                                         ;A7D479;
    BCC .return                                                          ;A7D47C;
    LDA.W #$0001                                                         ;A7D47E;
    STA.W $0FF2                                                          ;A7D481;

.return:
    PLX                                                                  ;A7D484;
    RTS                                                                  ;A7D485;


AdvancePhantoonFadeIn_DenominatorInA:
    PHX                                                                  ;A7D486;
    STA.B $12                                                            ;A7D487;
    LDA.W $05B6                                                          ;A7D489;
    BIT.W #$0001                                                         ;A7D48C;
    BNE .return                                                          ;A7D48F;
    LDA.W $0FF2                                                          ;A7D491;
    BNE .return                                                          ;A7D494;
    LDA.B $12                                                            ;A7D496;
    STA.W $0FEE                                                          ;A7D498;
    JSR.W AdvancePhantoonFadeIn                                          ;A7D49B;
    BCC .return                                                          ;A7D49E;
    LDA.W #$0001                                                         ;A7D4A0;
    STA.W $0FF2                                                          ;A7D4A3;

.return:
    PLX                                                                  ;A7D4A6;
    RTS                                                                  ;A7D4A7;


RTS_A7D4A8:
    RTS                                                                  ;A7D4A8;


Function_Phantoon_FightIntro_SpawnCircleOfFlames:
    DEC.W EnemyData.work4,X                                              ;A7D4A9;
    BEQ .timerExpired                                                    ;A7D4AC;
    BPL .return                                                          ;A7D4AE;

.timerExpired:
    LDA.W $0FA8                                                          ;A7D4B0;
    LDY.W #EnemyProjectile_PhantoonStartingFlames                        ;A7D4B3;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A7D4B6;
    LDA.W #$001D                                                         ;A7D4BA;
    JSL.L QueueSound_Lib3_Max6                                           ;A7D4BD;
    LDA.W #$001E                                                         ;A7D4C1;
    STA.W EnemyData.work4,X                                              ;A7D4C4;
    LDA.W $0FA8                                                          ;A7D4C7;
    INC A                                                                ;A7D4CA;
    STA.W $0FA8                                                          ;A7D4CB;
    CMP.W #$0008                                                         ;A7D4CE;
    BMI .return                                                          ;A7D4D1;
    STZ.W $0FA8                                                          ;A7D4D3;
    STZ.W $102A,X                                                        ;A7D4D6;
    LDA.W #Function_Phantoon_FightIntro_SpinCircleOfFlames               ;A7D4D9;
    STA.W EnemyData.work5,X                                              ;A7D4DC;
    LDA.W #$001E                                                         ;A7D4DF;
    STA.W EnemyData.work4,X                                              ;A7D4E2;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7D4E5;
    db $00,$06                                                           ;A7D4E9;
    dw PLMEntries_drawPhantoonsDoorDuringBossFight                       ;A7D4EB;

.return:
    RTS                                                                  ;A7D4ED;


Function_Phantoon_FightIntro_SpinCircleOfFlames:
    DEC.W EnemyData.work4,X                                              ;A7D4EE;
    BEQ .timerExpired                                                    ;A7D4F1;
    BPL .return                                                          ;A7D4F3;

.timerExpired:
    LDA.W #$00F0                                                         ;A7D4F5;
    STA.W EnemyData.work4,X                                              ;A7D4F8;
    LDA.W #$0001                                                         ;A7D4FB;
    STA.W EnemyData.work1,X                                              ;A7D4FE;
    LDA.W #Function_Phantoon_FightIntro_StartWavyFadeIn                  ;A7D501;
    STA.W EnemyData.work5,X                                              ;A7D504;

.return:
    RTS                                                                  ;A7D507;


Function_Phantoon_FightIntro_StartWavyFadeIn:
    DEC.W EnemyData.work4,X                                              ;A7D508;
    BEQ .timerExpired                                                    ;A7D50B;
    BPL .return                                                          ;A7D50D;

.timerExpired:
    STZ.W EnemyData.work1,X                                              ;A7D50F;
    LDA.W $1988                                                          ;A7D512;
    ORA.W #$4000                                                         ;A7D515;
    STA.W $1988                                                          ;A7D518;
    LDA.W #Function_Phantoon_FightIntro_WavyFadeIn                       ;A7D51B;
    STA.W EnemyData.work5,X                                              ;A7D51E;
    LDA.W #$8001                                                         ;A7D521;
    STA.W $1074                                                          ;A7D524;
    LDA.W #$0078                                                         ;A7D527;
    STA.W EnemyData.work4,X                                              ;A7D52A;
    LDA.W WavyPhantoonConstants_phaseDelta                               ;A7D52D;
    STA.B $16                                                            ;A7D530;
    LDA.W #$0002                                                         ;A7D532;
    JSL.L Spawn_WavyPhantoon_HDMAObject                                  ;A7D535;
    LDA.W WavyPhantoonConstants_Intro_maxAmplitude                       ;A7D539;
    STA.W $106E                                                          ;A7D53C;
    STZ.W $0FF2                                                          ;A7D53F;
    LDA.W #$0005                                                         ;A7D542;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;A7D545;

.return:
    RTS                                                                  ;A7D549;


Function_Phantoon_FightIntro_WavyFadeIn:
    LDA.W #$000C                                                         ;A7D54A;
    JSR.W AdvancePhantoonFadeIn_DenominatorInA                           ;A7D54D;
    LDA.W WavyPhantoonConstants_Intro_amplitudeDelta                     ;A7D550;
    STA.B $12                                                            ;A7D553;
    LDA.W WavyPhantoonConstants_Intro_maxAmplitude                       ;A7D555;
    STA.B $14                                                            ;A7D558;
    JSR.W GrowShrinkPhantoonWaveAmplitude                                ;A7D55A;
    BCS .done                                                            ;A7D55D;
    DEC.W EnemyData.work4,X                                              ;A7D55F;
    BEQ .shrinking                                                       ;A7D562;
    BPL .return                                                          ;A7D564;

.shrinking:
    LDA.W #$0001                                                         ;A7D566;
    STA.W $1070                                                          ;A7D569;
    BRA .return                                                          ;A7D56C;


.done:
    LDA.W #Function_Phantoon_FightIntro_PickFirstPattern                 ;A7D56E;
    STA.W EnemyData.work5,X                                              ;A7D571;
    LDA.W #$0001                                                         ;A7D574;
    STA.W $1074                                                          ;A7D577;
    LDA.W #$001E                                                         ;A7D57A;
    STA.W EnemyData.work4,X                                              ;A7D57D;

.return:
    RTS                                                                  ;A7D580;


UNUSED_Function_Phantoon_FightIntro_A7D581:
    LDX.W #$01FE                                                         ;A7D581;
    LDA.W #$0000                                                         ;A7D584;

.loop:
    STA.L $7E9100,X                                                      ;A7D587;
    DEX                                                                  ;A7D58B;
    DEX                                                                  ;A7D58C;
    BPL .loop                                                            ;A7D58D;
    LDA.W #Function_Phantoon_FightIntro_PickFirstPattern                 ;A7D58F;
    STA.W EnemyData.work5,X                                              ;A7D592;
    RTS                                                                  ;A7D595;


Function_Phantoon_FightIntro_PickFirstPattern:
    DEC.W EnemyData.work4,X                                              ;A7D596;
    BEQ .timerExpired                                                    ;A7D599;
    BPL .return                                                          ;A7D59B;

.timerExpired:
    STZ.W $0FF4                                                          ;A7D59D;
    LDA.W #Function_Phantoon_Figure8_Moving                              ;A7D5A0;
    STA.W EnemyData.work5,X                                              ;A7D5A3;
    LDA.W $05B6                                                          ;A7D5A6;
    LSR A                                                                ;A7D5A9;
    AND.W #$0003                                                         ;A7D5AA;
    ASL A                                                                ;A7D5AD;
    TAY                                                                  ;A7D5AE;
    LDA.W Phantoon_EyeClosedTimers,Y                                     ;A7D5AF;
    STA.W $0FE8                                                          ;A7D5B2;
    JSL.L GenerateRandomNumber                                           ;A7D5B5;
    BIT.W #$0001                                                         ;A7D5B9;
    BNE .reversed                                                        ;A7D5BC;
    LDA.W #$0001                                                         ;A7D5BE;
    STA.W $0FAC                                                          ;A7D5C1;
    STZ.W $0FAA                                                          ;A7D5C4;
    STZ.W $0FAE                                                          ;A7D5C7;
    STZ.W $0FEC                                                          ;A7D5CA;
    STZ.W $0FA8                                                          ;A7D5CD;
    RTS                                                                  ;A7D5D0;


.reversed:
    STZ.W $0FAC                                                          ;A7D5D1;
    STZ.W $0FAA                                                          ;A7D5D4;
    STZ.W $0FAE                                                          ;A7D5D7;
    LDA.W #$0001                                                         ;A7D5DA;
    STA.W $0FEC                                                          ;A7D5DD;
    LDA.W #$0215                                                         ;A7D5E0;
    STA.W $0FA8                                                          ;A7D5E3;

.return:
    RTS                                                                  ;A7D5E6;


Function_Phantoon_Figure8_Moving:
    JSR.W AdjustSpeedAndMovePhantoonInFigure8                            ;A7D5E7;
    JSR.W HandleCasualFlames                                             ;A7D5EA;
    DEC.W $0FE8                                                          ;A7D5ED;
    BEQ .timerExpired                                                    ;A7D5F0;
    BPL .return                                                          ;A7D5F2;

.timerExpired:
    LDA.W #RTS_A7D4A8                                                    ;A7D5F4;
    STA.W EnemyData.work5,X                                              ;A7D5F7;
    LDA.W #$0001                                                         ;A7D5FA;
    STA.W $0FD4                                                          ;A7D5FD;
    LDA.W #InstList_Phantoon_Eye_Open                                    ;A7D600;
    STA.W $0FD2                                                          ;A7D603;
    STZ.W $0FB6                                                          ;A7D606;
    JSR.W PhantoonMaterializationFlameSpiral                             ;A7D609;

.return:
    RTS                                                                  ;A7D60C;


Function_Phantoon_Figure8_VulnerableWindow:
    DEC.W EnemyData.work4,X                                              ;A7D60D;
    BEQ .timerExpired                                                    ;A7D610;
    BPL .waiting                                                         ;A7D612;

.timerExpired:
    STZ.W $102A,X                                                        ;A7D614;
    LDA.W $1028                                                          ;A7D617;
    BEQ .swoopingNotTriggered                                            ;A7D61A;
    STZ.W $1028                                                          ;A7D61C;
    LDA.W #$003C                                                         ;A7D61F;
    STA.W EnemyData.work4,X                                              ;A7D622;
    LDA.W #Function_Phantoon_Figure8_SwoopingTriggered                   ;A7D625;
    STA.W EnemyData.work5,X                                              ;A7D628;
    BRA .waiting                                                         ;A7D62B;


.swoopingNotTriggered:
    LDA.W #RTS_A7D4A8                                                    ;A7D62D;
    STA.W EnemyData.work5,X                                              ;A7D630;
    LDA.W #$0001                                                         ;A7D633;
    STA.W $0F94                                                          ;A7D636;
    STA.W $0FD4                                                          ;A7D639;
    LDA.W #InstList_Phantoon_Body_Invulnerable                           ;A7D63C;
    STA.W $0F92                                                          ;A7D63F;
    LDA.W #InstList_Phantoon_Eye_Close_PickNewPattern                    ;A7D642;
    STA.W $0FD2                                                          ;A7D645;
    LDA.W $0F86                                                          ;A7D648;
    ORA.W #$0400                                                         ;A7D64B;
    STA.W $0F86                                                          ;A7D64E;
    LDA.W #$0001                                                         ;A7D651;
    STA.W $0FB6                                                          ;A7D654;
    RTS                                                                  ;A7D657;


.waiting:
    JSR.W MakePhantoonLookTowardsSamus                                   ;A7D658;
    RTS                                                                  ;A7D65B;


Function_Phantoon_Figure8_SwoopingTriggered:
    JSR.W MakePhantoonLookTowardsSamus                                   ;A7D65C;
    LDA.W $1988                                                          ;A7D65F;
    AND.W #$BFFF                                                         ;A7D662;
    STA.W $1988                                                          ;A7D665;
    JSR.W StartPhantoonSwoopingPattern                                   ;A7D668;
    LDA.W #$0001                                                         ;A7D66B;
    STA.W $0F94                                                          ;A7D66E;
    LDA.W #InstList_Phantoon_Body_FullHitbox                             ;A7D671;
    STA.W $0F92                                                          ;A7D674;
    RTS                                                                  ;A7D677;


Function_Phantoon_Swooping_Opaque:
    JSR.W MakePhantoonLookTowardsSamus                                   ;A7D678;
    JSR.W MovePhantoonInSwoopingPattern                                  ;A7D67B;
    DEC.W EnemyData.work4,X                                              ;A7D67E;
    BEQ .timerExpired                                                    ;A7D681;
    BPL .return                                                          ;A7D683;

.timerExpired:
    LDA.W #Function_Phantoon_Swooping_FadeOut                            ;A7D685;
    STA.W EnemyData.work5,X                                              ;A7D688;
    LDA.W $1988                                                          ;A7D68B;
    ORA.W #$4000                                                         ;A7D68E;
    STA.W $1988                                                          ;A7D691;
    LDA.W #$0001                                                         ;A7D694;
    STA.W $0F94                                                          ;A7D697;
    STA.W $0FD4                                                          ;A7D69A;
    LDA.W #InstList_Phantoon_Body_Invulnerable                           ;A7D69D;
    STA.W $0F92                                                          ;A7D6A0;
    LDA.W #InstList_Phantoon_Eye_Close                                   ;A7D6A3;
    STA.W $0FD2                                                          ;A7D6A6;
    LDA.W $0F86                                                          ;A7D6A9;
    ORA.W #$0400                                                         ;A7D6AC;
    STA.W $0F86                                                          ;A7D6AF;
    STZ.W $0FF2                                                          ;A7D6B2;
    STZ.W $102A,X                                                        ;A7D6B5;

.return:
    RTS                                                                  ;A7D6B8;


Function_Phantoon_Swooping_FadeOut:
    JSR.W MovePhantoonInSwoopingPattern                                  ;A7D6B9;
    LDA.W #$000C                                                         ;A7D6BC;
    JSR.W AdvancePhantoonFadeOut_DenominatorInA                          ;A7D6BF;
    LDA.W $0FF2                                                          ;A7D6C2;
    BEQ .return                                                          ;A7D6C5;
    LDA.W #Function_Phantoon_HidingBeforeFigure8_Hiding                  ;A7D6C7;
    STA.W EnemyData.work5,X                                              ;A7D6CA;
    LDA.W #$0078                                                         ;A7D6CD;
    STA.W EnemyData.work4,X                                              ;A7D6D0;

.return:
    RTS                                                                  ;A7D6D3;


Function_Phantoon_HidingBeforeFigure8_Hiding:
    DEC.W EnemyData.work4,X                                              ;A7D6D4;
    BEQ .timerExpired                                                    ;A7D6D7;
    BPL .return                                                          ;A7D6D9;

.timerExpired:
    LDA.W #Function_Phantoon_HidingBeforeFigure8_PlacePhantoon           ;A7D6DB;
    STA.W EnemyData.work5,X                                              ;A7D6DE;

.return:
    RTS                                                                  ;A7D6E1;


Function_Phantoon_HidingBeforeFigure8_PlacePhantoon:
    JSL.L GenerateRandomNumber                                           ;A7D6E2;
    BIT.W #$0001                                                         ;A7D6E6;
    BEQ .leftSidePattern                                                 ;A7D6E9;
    LDA.W #$0088                                                         ;A7D6EB;
    STA.W $0FA8                                                          ;A7D6EE;
    LDA.W #$00D0                                                         ;A7D6F1;
    STA.W $0F7A                                                          ;A7D6F4;
    LDA.W #$0060                                                         ;A7D6F7;
    STA.W $0F7E                                                          ;A7D6FA;
    BRA +                                                                ;A7D6FD;


.leftSidePattern:
    LDA.W #$018F                                                         ;A7D6FF;
    STA.W $0FA8                                                          ;A7D702;
    LDA.W #$0030                                                         ;A7D705;
    STA.W $0F7A                                                          ;A7D708;
    LDA.W #$0060                                                         ;A7D70B;
    STA.W $0F7E                                                          ;A7D70E;

  + STZ.W $0FEC                                                          ;A7D711;
    LDA.W #$0001                                                         ;A7D714;
    STA.W $0FAC                                                          ;A7D717;
    STZ.W $0FAA                                                          ;A7D71A;
    STZ.W $0FB6                                                          ;A7D71D;
    JSR.W PickNewPhantoonPattern                                         ;A7D720;
    LDA.W #Function_Phantoon_HidingBeforeFigure8_FadingIn                ;A7D723;
    STA.W EnemyData.work5,X                                              ;A7D726;
    STZ.W $0FF2                                                          ;A7D729;
    RTS                                                                  ;A7D72C;


Function_Phantoon_HidingBeforeFigure8_FadingIn:
    LDA.W #$000C                                                         ;A7D72D;
    JSR.W AdvancePhantoonFadeIn_DenominatorInA                           ;A7D730;
    LDA.W $0FF2                                                          ;A7D733;
    BEQ .return                                                          ;A7D736;
    LDA.W #Function_Phantoon_Figure8_Moving                              ;A7D738;
    STA.W $0FB2                                                          ;A7D73B;

.return:
    RTS                                                                  ;A7D73E;


Function_Phantoon_FlameRain_ShowPhantoon:
    STZ.W $0FF2                                                          ;A7D73F;
    LDA.W $1988                                                          ;A7D742;
    AND.W #$BFFF                                                         ;A7D745;
    STA.W $1988                                                          ;A7D748;
    LDA.W #$0001                                                         ;A7D74B;
    STA.W $0F94                                                          ;A7D74E;
    STA.W $0FD4                                                          ;A7D751;
    LDA.W #InstList_Phantoon_Body_FullHitbox                             ;A7D754;
    STA.W $0F92                                                          ;A7D757;
    LDA.W #InstList_Phantoon_Eyeball_Centered                            ;A7D75A;
    STA.W $0FD2                                                          ;A7D75D;
    LDA.W #Function_Phantoon_FlameRain_MakePhantoonVulnerable            ;A7D760;
    STA.W EnemyData.work5,X                                              ;A7D763;
    RTS                                                                  ;A7D766;


Function_Phantoon_FlameRain_MakePhantoonVulnerable:
    LDA.W #$0001                                                         ;A7D767;
    JSR.W AdvancePhantoonFadeIn_DenominatorInA                           ;A7D76A;
    LDA.W $0FF2                                                          ;A7D76D;
    BEQ .return                                                          ;A7D770;
    LDA.W $0F86                                                          ;A7D772;
    AND.W #$FBFF                                                         ;A7D775;
    STA.W $0F86                                                          ;A7D778;
    LDA.W #Function_Phantoon_FlameRain_VulnerableWindow                  ;A7D77B;
    STA.W EnemyData.work5,X                                              ;A7D77E;
    LDA.W #$005A                                                         ;A7D781;
    STA.W $0FB0                                                          ;A7D784;

.return:
    RTS                                                                  ;A7D787;


Function_Phantoon_FlameRain_VulnerableWindow:
    DEC.W EnemyData.work4,X                                              ;A7D788;
    BEQ .timerExpired                                                    ;A7D78B;
    BPL .return                                                          ;A7D78D;

.timerExpired:
    STZ.W $102A,X                                                        ;A7D78F;
    LDA.W $1028                                                          ;A7D792;
    BEQ .endVulnerableWindow                                             ;A7D795;
    STZ.W $1028                                                          ;A7D797;
    LDA.W #$0001                                                         ;A7D79A;
    STA.W $0FB6                                                          ;A7D79D;
    JSR.W StartPhantoonSwoopingPattern                                   ;A7D7A0;
    RTS                                                                  ;A7D7A3;


.endVulnerableWindow:
    LDA.W #Function_Phantoon_FlameRain_FadingOut                         ;A7D7A4;
    STA.W EnemyData.work5,X                                              ;A7D7A7;
    STZ.W $0FF2                                                          ;A7D7AA;
    LDA.W #$0001                                                         ;A7D7AD;
    STA.W $0F94                                                          ;A7D7B0;
    STA.W $0FD4                                                          ;A7D7B3;
    LDA.W #InstList_Phantoon_Body_Invulnerable                           ;A7D7B6;
    STA.W $0F92                                                          ;A7D7B9;
    LDA.W #InstList_Phantoon_Eye_Close                                   ;A7D7BC;
    STA.W $0FD2                                                          ;A7D7BF;
    LDA.W $0F86                                                          ;A7D7C2;
    ORA.W #$0400                                                         ;A7D7C5;
    STA.W $0F86                                                          ;A7D7C8;
    LDA.W $1988                                                          ;A7D7CB;
    ORA.W #$4000                                                         ;A7D7CE;
    STA.W $1988                                                          ;A7D7D1;

.return:
    RTS                                                                  ;A7D7D4;


Function_Phantoon_FlameRain_FadingOut:
    LDA.W #$000C                                                         ;A7D7D5;
    JSR.W AdvancePhantoonFadeOut_DenominatorInA                          ;A7D7D8;
    LDA.W $0FF2                                                          ;A7D7DB;
    BNE .fadeComplete                                                    ;A7D7DE;
    RTS                                                                  ;A7D7E0;


.fadeComplete:
    LDA.W #Function_Phantoon_FlameRain_SubsequentFlameRain               ;A7D7E1;
    STA.W EnemyData.work5,X                                              ;A7D7E4;
    JSL.L GenerateRandomNumber                                           ;A7D7E7;
    AND.W #$0007                                                         ;A7D7EB;
    ASL A                                                                ;A7D7EE;
    TAY                                                                  ;A7D7EF;
    LDA.W Phantoon_FlameRain_HidingTimers,Y                              ;A7D7F0;
    STA.W EnemyData.work4,X                                              ;A7D7F3;
    RTS                                                                  ;A7D7F6;


Function_Phantoon_FlameRain_SubsequentFlameRain:
    DEC.W EnemyData.work4,X                                              ;A7D7F7;
    BEQ .timerExpired                                                    ;A7D7FA;
    BPL .return                                                          ;A7D7FC;

.timerExpired:
    JSL.L GenerateRandomNumber                                           ;A7D7FE;
    AND.W #$0007                                                         ;A7D802;
    PHA                                                                  ;A7D805;
    ASL A                                                                ;A7D806;
    ASL A                                                                ;A7D807;
    ASL A                                                                ;A7D808;
    TAY                                                                  ;A7D809;
    LDA.W Phantoon_FlameRain_PositionTable_index,Y                       ;A7D80A;
    STA.W $0FA8                                                          ;A7D80D;
    LDA.W Phantoon_FlameRain_PositionTable_XPosition,Y                   ;A7D810;
    STA.W $0F7A                                                          ;A7D813;
    LDA.W Phantoon_FlameRain_PositionTable_YPosition,Y                   ;A7D816;
    STA.W $0F7E                                                          ;A7D819;
    STZ.W $0FEC                                                          ;A7D81C;
    LDA.W #Function_Phantoon_FlameRain_ShowPhantoon                      ;A7D81F;
    STA.W EnemyData.work5,X                                              ;A7D822;
    PLA                                                                  ;A7D825;
    JSR.W SpawnFlameRainProjectiles                                      ;A7D826;

.return:
    RTS                                                                  ;A7D829;


Function_Phantoon_FlameRain_InitialFlameRain:
    LDA.W #$000C                                                         ;A7D82A;
    JSR.W AdvancePhantoonFadeOut_DenominatorInA                          ;A7D82D;
    JSR.W AdjustSpeedAndMovePhantoonInFigure8                            ;A7D830;
    JSR.W HandleCasualFlames                                             ;A7D833;
    DEC.W $0FE8                                                          ;A7D836;
    BEQ .timerExpired                                                    ;A7D839;
    BPL .return                                                          ;A7D83B;

.timerExpired:
    STZ.W $1028                                                          ;A7D83D;
    LDA.W #Function_Phantoon_FlameRain_ShowPhantoon                      ;A7D840;
    STA.W EnemyData.work5,X                                              ;A7D843;
    LDA.W $0F7A                                                          ;A7D846;
    CMP.W #$0080                                                         ;A7D849;
    BMI .pattern0                                                        ;A7D84C;
    LDA.W #$0002                                                         ;A7D84E;
    JSR.W SpawnFlameRainProjectiles                                      ;A7D851;
    RTS                                                                  ;A7D854;


.pattern0:
    LDA.W #$0000                                                         ;A7D855;
    JSR.W SpawnFlameRainProjectiles                                      ;A7D858;

.return:
    RTS                                                                  ;A7D85B;


Function_Phantoon_Enraged_FadingOutBeforeRage:
    LDA.W #$000C                                                         ;A7D85C;
    JSR.W AdvancePhantoonFadeOut_DenominatorInA                          ;A7D85F;
    LDA.W $0FF2                                                          ;A7D862;
    BEQ .return                                                          ;A7D865;
    LDA.W #Function_Phantoon_Enraged_Hiding                              ;A7D867;
    STA.W EnemyData.work5,X                                              ;A7D86A;
    LDA.W #$0078                                                         ;A7D86D;
    STA.W EnemyData.work4,X                                              ;A7D870;

.return:
    RTS                                                                  ;A7D873;


Function_Phantoon_Enraged_Hiding:
    DEC.W EnemyData.work4,X                                              ;A7D874;
    BEQ .timerExpired                                                    ;A7D877;
    BPL .return                                                          ;A7D879;

.timerExpired:
    LDA.W #Function_Phantoon_Enraged_FadingIn                            ;A7D87B;
    STA.W EnemyData.work5,X                                              ;A7D87E;
    LDA.W #$0080                                                         ;A7D881;
    STA.W $0F7A                                                          ;A7D884;
    LDA.W #$0020                                                         ;A7D887;
    STA.W $0F7E                                                          ;A7D88A;
    STZ.W $0FF2                                                          ;A7D88D;

.return:
    RTS                                                                  ;A7D890;


Function_Phantoon_Enraged_FadingIn:
    LDA.W #$000C                                                         ;A7D891;
    JSR.W AdvancePhantoonFadeIn_DenominatorInA                           ;A7D894;
    LDA.W $0FF2                                                          ;A7D897;
    BEQ .return                                                          ;A7D89A;
    LDA.W #Function_Phantoon_Enraged_Rage                                ;A7D89C;
    STA.W $0FB2                                                          ;A7D89F;
    LDA.W #$0004                                                         ;A7D8A2;
    STA.W EnemyData.work4,X                                              ;A7D8A5;
    STZ.W $0FF2                                                          ;A7D8A8;

.return:
    RTS                                                                  ;A7D8AB;


Function_Phantoon_Enraged_Rage:
    DEC.W EnemyData.work4,X                                              ;A7D8AC;
    BEQ .timerExpired                                                    ;A7D8AF;
    BPL .return                                                          ;A7D8B1;

.timerExpired:
    LDA.W $0FF2                                                          ;A7D8B3;
    BIT.W #$0001                                                         ;A7D8B6;
    BNE .oddWave                                                         ;A7D8B9;
    LDY.W #$0006                                                         ;A7D8BB;

.loopEvenWave:
    PHY                                                                  ;A7D8BE;
    TYA                                                                  ;A7D8BF;
    ORA.W #$0200                                                         ;A7D8C0;
    LDY.W #EnemyProjectile_PhantoonDestroyableFlames                     ;A7D8C3;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A7D8C6;
    PLY                                                                  ;A7D8CA;
    DEY                                                                  ;A7D8CB;
    BPL .loopEvenWave                                                    ;A7D8CC;
    BRA .merge                                                           ;A7D8CE;


.oddWave:
    LDY.W #$000F                                                         ;A7D8D0;

.loopOddWave:
    PHY                                                                  ;A7D8D3;
    TYA                                                                  ;A7D8D4;
    ORA.W #$0200                                                         ;A7D8D5;
    LDY.W #EnemyProjectile_PhantoonDestroyableFlames                     ;A7D8D8;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A7D8DB;
    PLY                                                                  ;A7D8DF;
    DEY                                                                  ;A7D8E0;
    CPY.W #$0008                                                         ;A7D8E1;
    BPL .loopOddWave                                                     ;A7D8E4;

.merge:
    LDA.W #$0029                                                         ;A7D8E6;
    JSL.L QueueSound_Lib3_Max6                                           ;A7D8E9;
    LDA.W $0FF2                                                          ;A7D8ED;
    INC A                                                                ;A7D8F0;
    STA.W $0FF2                                                          ;A7D8F1;
    CMP.W #$0008                                                         ;A7D8F4;
    BPL .doneRaging                                                      ;A7D8F7;
    LDA.W #$0080                                                         ;A7D8F9;
    STA.W EnemyData.work4,X                                              ;A7D8FC;
    RTS                                                                  ;A7D8FF;


.doneRaging:
    LDA.W #$0001                                                         ;A7D900;
    STA.W $0FD4                                                          ;A7D903;
    LDA.W #InstList_Phantoon_Eye_Close                                   ;A7D906;
    STA.W $0FD2                                                          ;A7D909;
    STZ.W $0FF2                                                          ;A7D90C;
    LDA.W #Function_Phantoon_Enraged_FadingOutAfterRage                  ;A7D90F;
    STA.W EnemyData.work5,X                                              ;A7D912;

.return:
    RTS                                                                  ;A7D915;


Function_Phantoon_Enraged_FadingOutAfterRage:
    LDA.W #$000C                                                         ;A7D916;
    JSR.W AdvancePhantoonFadeOut_DenominatorInA                          ;A7D919;
    LDA.W $0FF2                                                          ;A7D91C;
    BEQ .return                                                          ;A7D91F;
    LDA.W #Function_Phantoon_HidingBeforeFigure8_Hiding                  ;A7D921;
    STA.W EnemyData.work5,X                                              ;A7D924;
    LDA.W #$0078                                                         ;A7D927;
    STA.W EnemyData.work4,X                                              ;A7D92A;

.return:
    RTS                                                                  ;A7D92D;


Function_Phantoon_Swooping_FatalDamage:
    JSR.W MakePhantoonLookTowardsSamus                                   ;A7D92E;
    JSR.W MovePhantoonInSwoopingPattern                                  ;A7D931;
    LDA.W $0F7A                                                          ;A7D934;
    CMP.W #$0060                                                         ;A7D937;
    BMI .return                                                          ;A7D93A;
    CMP.W #$00A0                                                         ;A7D93C;
    BPL .return                                                          ;A7D93F;
    LDA.W #Function_Phantoon_DeathSequence_FadingInAndOut                ;A7D941;
    STA.W EnemyData.work5,X                                              ;A7D944;

.return:
    RTS                                                                  ;A7D947;


Function_Phantoon_DeathSequence_FadingInAndOut:
    NOP                                                                  ;A7D948;
    LDA.W $0FEC                                                          ;A7D949;
    BIT.W #$0001                                                         ;A7D94C;
    BNE .advanceFade                                                     ;A7D94F;
    LDA.W #$000C                                                         ;A7D951;
    JSR.W AdvancePhantoonFadeOut_DenominatorInA                          ;A7D954;
    LDA.W $0FF2                                                          ;A7D957;
    BNE .fadeComplete                                                    ;A7D95A;
    BRA .return                                                          ;A7D95C;


.advanceFade:
    LDA.W #$000C                                                         ;A7D95E;
    JSR.W AdvancePhantoonFadeIn_DenominatorInA                           ;A7D961;
    LDA.W $0FF2                                                          ;A7D964;
    BEQ .return                                                          ;A7D967;

.fadeComplete:
    STZ.W $0FF2                                                          ;A7D969;
    LDA.W $0FEC                                                          ;A7D96C;
    INC A                                                                ;A7D96F;
    STA.W $0FEC                                                          ;A7D970;
    CMP.W #$000A                                                         ;A7D973;
    BMI .return                                                          ;A7D976;
    LDA.W #Function_Phantoon_DeathSequence_Exploding                     ;A7D978;
    STA.W EnemyData.work5,X                                              ;A7D97B;
    LDA.W #$000F                                                         ;A7D97E;
    STA.W EnemyData.work4,X                                              ;A7D981;
    STZ.W $1032                                                          ;A7D984;
    STZ.W $0FA8                                                          ;A7D987;

.return:
    RTS                                                                  ;A7D98A;


Function_Phantoon_DeathSequence_Exploding:
    DEC.W EnemyData.work4,X                                              ;A7D98B;
    BEQ .timerExpired                                                    ;A7D98E;
    BMI .timerExpired                                                    ;A7D990;
    RTS                                                                  ;A7D992;


.timerExpired:
    LDA.W $1032                                                          ;A7D993;
    ASL A                                                                ;A7D996;
    ASL A                                                                ;A7D997;
    TAY                                                                  ;A7D998;
    LDA.W .XOffset,Y                                                     ;A7D999;
    AND.W #$00FF                                                         ;A7D99C;
    BIT.W #$0080                                                         ;A7D99F;
    BEQ +                                                                ;A7D9A2;
    ORA.W #$FF00                                                         ;A7D9A4;

  + STA.B $12                                                            ;A7D9A7;
    LDA.W $0F7A                                                          ;A7D9A9;
    CLC                                                                  ;A7D9AC;
    ADC.B $12                                                            ;A7D9AD;
    STA.B $12                                                            ;A7D9AF;
    LDA.W .YOffset,Y                                                     ;A7D9B1;
    AND.W #$00FF                                                         ;A7D9B4;
    BIT.W #$0080                                                         ;A7D9B7;
    BEQ +                                                                ;A7D9BA;
    ORA.W #$FF00                                                         ;A7D9BC;

  + STA.B $14                                                            ;A7D9BF;
    LDA.W $0F7E                                                          ;A7D9C1;
    CLC                                                                  ;A7D9C4;
    ADC.B $14                                                            ;A7D9C5;
    STA.B $14                                                            ;A7D9C7;
    PHY                                                                  ;A7D9C9;
    LDA.W .explosionType,Y                                               ;A7D9CA;
    AND.W #$00FF                                                         ;A7D9CD;
    PHA                                                                  ;A7D9D0;
    LDY.W #EnemyProjectile_MiscDust                                      ;A7D9D1;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A7D9D4;
    PLA                                                                  ;A7D9D8;
    CMP.W #$001D                                                         ;A7D9D9;
    BNE .PhantoonExplosion                                               ;A7D9DC;
    LDA.W #$0024                                                         ;A7D9DE;
    JSL.L QueueSound_Lib2_Max6                                           ;A7D9E1;
    BRA +                                                                ;A7D9E5;


.PhantoonExplosion:
    LDA.W #$002B                                                         ;A7D9E7;
    JSL.L QueueSound_Lib2_Max6                                           ;A7D9EA;

  + PLY                                                                  ;A7D9EE;
    LDA.W .timer,Y                                                       ;A7D9EF;
    AND.W #$00FF                                                         ;A7D9F2;
    STA.W EnemyData.work4,X                                              ;A7D9F5;
    LDA.W $1032                                                          ;A7D9F8;
    INC A                                                                ;A7D9FB;
    STA.W $1032                                                          ;A7D9FC;
    CMP.W #$000D                                                         ;A7D9FF;
    BMI .return                                                          ;A7DA02;
    LDA.W #$0005                                                         ;A7DA04;
    STA.W $1032                                                          ;A7DA07;
    LDA.W $0FA8                                                          ;A7DA0A;
    INC A                                                                ;A7DA0D;
    STA.W $0FA8                                                          ;A7DA0E;
    CMP.W #$0003                                                         ;A7DA11;
    BMI .return                                                          ;A7DA14;
    LDA.W #Function_Phantoon_DeathSequence_SetupWavyMosaicPhantoon       ;A7DA16;
    STA.W EnemyData.work5,X                                              ;A7DA19;

.return:
    RTS                                                                  ;A7DA1C;


.XOffset:
    db $00                                                               ;A7DA1D;

.YOffset:
    db $00                                                               ;A7DA1E;

.explosionType:
    db $1D                                                               ;A7DA1F;

.timer:
    db $10,$20,$E0,$1D,$10,$E0,$20,$1D,$10,$E0,$E0,$1D,$10,$20,$20,$1D   ;A7DA20;
    db $20,$E0,$F8,$1D,$08,$00,$00,$03,$08,$20,$F8,$1D,$08,$00,$00,$03   ;A7DA30;
    db $08,$00,$18,$03,$08,$00,$30,$1D,$08,$E8,$18,$03,$08,$18,$18,$03   ;A7DA40;
    db $08                                                               ;A7DA50;

Function_Phantoon_DeathSequence_SetupWavyMosaicPhantoon:
    LDA.W WavyPhantoonConstants_phaseDelta                               ;A7DA51;
    STA.B $16                                                            ;A7DA54;
    LDA.W #$0001                                                         ;A7DA56;
    JSL.L Spawn_WavyPhantoon_HDMAObject                                  ;A7DA59;
    STZ.W $106E                                                          ;A7DA5D;
    LDA.W #Function_Phantoon_DeathSequence_WavyMosaicPhantoon            ;A7DA60;
    STA.W EnemyData.work5,X                                              ;A7DA63;
    LDA.W #$0002                                                         ;A7DA66;
    STA.W $0FEC                                                          ;A7DA69;
    LDA.W $0F86                                                          ;A7DA6C;
    AND.W #$DFFF                                                         ;A7DA6F;
    ORA.W #$0500                                                         ;A7DA72;
    STA.W $0FC6                                                          ;A7DA75;
    STA.W $1006                                                          ;A7DA78;
    STA.W $1046                                                          ;A7DA7B;
    LDA.W #$007E                                                         ;A7DA7E;
    JSL.L QueueSound_Lib2_Max6                                           ;A7DA81;
    RTS                                                                  ;A7DA85;


Function_Phantoon_DeathSequence_WavyMosaicPhantoon:
    LDA.W WavyPhantoonConstants_Dying_amplitudeDelta                     ;A7DA86;
    STA.B $12                                                            ;A7DA89;
    LDA.W WavyPhantoonConstants_Dying_maxAmplitude                       ;A7DA8B;
    STA.B $14                                                            ;A7DA8E;
    JSR.W GrowShrinkPhantoonWaveAmplitude                                ;A7DA90;
    LDA.W $0FEC                                                          ;A7DA93;
    CMP.W #$FFFF                                                         ;A7DA96;
    BEQ .doneMosaic                                                      ;A7DA99;
    LDA.W $05B6                                                          ;A7DA9B;
    BIT.W #$000F                                                         ;A7DA9E;
    BNE .return                                                          ;A7DAA1;
    SEP #$20                                                             ;A7DAA3;
    LDA.W $0FEC                                                          ;A7DAA5;
    CMP.B #$F2                                                           ;A7DAA8;
    BEQ .mosaicF2                                                        ;A7DAAA;
    CLC                                                                  ;A7DAAC;
    ADC.B #$10                                                           ;A7DAAD;
    STA.W $0FEC                                                          ;A7DAAF;
    STA.B $57                                                            ;A7DAB2;
    REP #$20                                                             ;A7DAB4;
    BRA .return                                                          ;A7DAB6;


.mosaicF2:
    REP #$20                                                             ;A7DAB8;
    LDA.W #$FFFF                                                         ;A7DABA;
    STA.W $0FEC                                                          ;A7DABD;
    STZ.W $0FF2                                                          ;A7DAC0;
    BRA .return                                                          ;A7DAC3;


.doneMosaic:
    LDA.W #$000C                                                         ;A7DAC5;
    JSR.W AdvancePhantoonFadeOut_DenominatorInA                          ;A7DAC8;
    LDA.W $0FF2                                                          ;A7DACB;
    BEQ .return                                                          ;A7DACE;
    LDA.W #Function_Phantoon_DeathSequence_ClearGraphics                 ;A7DAD0;
    STA.W EnemyData.work5,X                                              ;A7DAD3;

.return:
    RTS                                                                  ;A7DAD6;


Function_Phantoon_DeathSequence_ClearGraphics:
    SEP #$20                                                             ;A7DAD7;
    STZ.B $57                                                            ;A7DAD9;
    REP #$20                                                             ;A7DADB;
    STZ.W $0FF4                                                          ;A7DADD;
    LDA.W $1988                                                          ;A7DAE0;
    AND.W #$BFFF                                                         ;A7DAE3;
    STA.W $1988                                                          ;A7DAE6;
    LDA.W #$FFFF                                                         ;A7DAE9;
    STA.W $1074                                                          ;A7DAEC;
    LDA.W #Function_Phantoon_DeathSequence_ActivateWreckedShip           ;A7DAEF;
    STA.W EnemyData.work5,X                                              ;A7DAF2;
    LDA.W #$003C                                                         ;A7DAF5;
    STA.W EnemyData.work4,X                                              ;A7DAF8;
    STZ.W $0FF2                                                          ;A7DAFB;
    LDA.W #$0180                                                         ;A7DAFE;
    STA.W $0F7A                                                          ;A7DB01;
    LDA.W #$0080                                                         ;A7DB04;
    STA.W $0F7E                                                          ;A7DB07;
    LDX.W #$03FE                                                         ;A7DB0A;
    LDA.W #$0338                                                         ;A7DB0D;

.loop:
    STA.L $7E2000,X                                                      ;A7DB10;
    DEX                                                                  ;A7DB14;
    DEX                                                                  ;A7DB15;
    BPL .loop                                                            ;A7DB16;
    LDX.W $0330                                                          ;A7DB18;
    LDA.W #$0400                                                         ;A7DB1B;
    STA.B $D0,X                                                          ;A7DB1E;
    INX                                                                  ;A7DB20;
    INX                                                                  ;A7DB21;
    LDA.W #$2000                                                         ;A7DB22;
    STA.B $D0,X                                                          ;A7DB25;
    INX                                                                  ;A7DB27;
    INX                                                                  ;A7DB28;
    SEP #$20                                                             ;A7DB29;
    LDA.B #$7E                                                           ;A7DB2B;
    STA.B $D0,X                                                          ;A7DB2D;
    REP #$20                                                             ;A7DB2F;
    INX                                                                  ;A7DB31;
    LDA.W #$4800                                                         ;A7DB32;
    STA.B $D0,X                                                          ;A7DB35;
    INX                                                                  ;A7DB37;
    INX                                                                  ;A7DB38;
    STX.W $0330                                                          ;A7DB39;
    RTS                                                                  ;A7DB3C;


Function_Phantoon_DeathSequence_ActivateWreckedShip:
    PHX                                                                  ;A7DB3D;
    LDA.W EnemyData.work4,X                                              ;A7DB3E;
    BEQ .timerExpired                                                    ;A7DB41;
    DEC.W EnemyData.work4,X                                              ;A7DB43;
    PLX                                                                  ;A7DB46;
    RTS                                                                  ;A7DB47;


.timerExpired:
    LDA.W $05B6                                                          ;A7DB48;
    BIT.W #$0003                                                         ;A7DB4B;
    BNE .return                                                          ;A7DB4E;
    LDA.W #$000C                                                         ;A7DB50;
    STA.W $0FEE                                                          ;A7DB53;
    JSR.W AdvanceWreckedShipPowerOnPaletteTransition                     ;A7DB56;
    BCC .return                                                          ;A7DB59;
    SEP #$20                                                             ;A7DB5B;
    LDA.B $69                                                            ;A7DB5D;
    ORA.B #$02                                                           ;A7DB5F;
    STA.B $69                                                            ;A7DB61;
    REP #$20                                                             ;A7DB63;
    JSL.L PhantoonDeathItemDropRoutine                                   ;A7DB65;
    LDA.W $0F86                                                          ;A7DB69;
    ORA.W #$0200                                                         ;A7DB6C;
    STA.W $0F86                                                          ;A7DB6F;
    STA.W $0FC6                                                          ;A7DB72;
    STA.W $1006                                                          ;A7DB75;
    STA.W $1046                                                          ;A7DB78;
    LDX.W $079F                                                          ;A7DB7B;
    LDA.L $7ED828,X                                                      ;A7DB7E;
    ORA.W #$0001                                                         ;A7DB82;
    STA.L $7ED828,X                                                      ;A7DB85;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7DB89;
    db $00,$06                                                           ;A7DB8D;
    dw PLMEntries_restorePhantoonsDoorDuringBossFight                    ;A7DB8F;
    LDA.W #$0003                                                         ;A7DB91;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;A7DB94;

.return:
    PLX                                                                  ;A7DB98;
    RTS                                                                  ;A7DB99;


AdvancePhantoonFadeOut:
    REP #$30                                                             ;A7DB9A;
    LDA.W $0FEE                                                          ;A7DB9C;
    INC A                                                                ;A7DB9F;
    CMP.W $0FF0                                                          ;A7DBA0;
    BCS .advance                                                         ;A7DBA3;
    LDA.W #$0000                                                         ;A7DBA5;
    STA.W $0FF0                                                          ;A7DBA8;
    SEC                                                                  ;A7DBAB;
    RTS                                                                  ;A7DBAC;


.advance:
    LDX.W #$0000                                                         ;A7DBAD;

.loop:
    PHX                                                                  ;A7DBB0;
    LDA.W Palette_Phantoon_FadeOutTarget,X                               ;A7DBB1;
    TAY                                                                  ;A7DBB4;
    LDA.L $7EC0E0,X                                                      ;A7DBB5;
    TAX                                                                  ;A7DBB9;
    LDA.W $0FF0                                                          ;A7DBBA;
    JSR.W CalculateAthTransitionalColorFromXToY                          ;A7DBBD;
    PLX                                                                  ;A7DBC0;
    STA.L $7EC0E0,X                                                      ;A7DBC1;
    INX                                                                  ;A7DBC5;
    INX                                                                  ;A7DBC6;
    CPX.W #$0020                                                         ;A7DBC7;
    BCC .loop                                                            ;A7DBCA;
    LDA.W $0FF0                                                          ;A7DBCC;
    INC A                                                                ;A7DBCF;
    STA.W $0FF0                                                          ;A7DBD0;
    CLC                                                                  ;A7DBD3;
    RTS                                                                  ;A7DBD4;


AdvancePhantoonFadeIn:
    REP #$30                                                             ;A7DBD5;
    LDA.W $0FEE                                                          ;A7DBD7;
    INC A                                                                ;A7DBDA;
    CMP.W $0FF0                                                          ;A7DBDB;
    BCS .advance                                                         ;A7DBDE;
    LDA.W #$0000                                                         ;A7DBE0;
    STA.W $0FF0                                                          ;A7DBE3;
    SEC                                                                  ;A7DBE6;
    RTS                                                                  ;A7DBE7;


.advance:
    LDX.W #$0000                                                         ;A7DBE8;

.loop:
    PHX                                                                  ;A7DBEB;
    JSR.W GetPhantoonHealthBasedPaletteColor                             ;A7DBEC;
    LDA.L $7EC0E0,X                                                      ;A7DBEF;
    TAX                                                                  ;A7DBF3;
    LDA.W $0FF0                                                          ;A7DBF4;
    JSR.W CalculateAthTransitionalColorFromXToY                          ;A7DBF7;
    PLX                                                                  ;A7DBFA;
    STA.L $7EC0E0,X                                                      ;A7DBFB;
    INX                                                                  ;A7DBFF;
    INX                                                                  ;A7DC00;
    CPX.W #$0020                                                         ;A7DC01;
    BCC .loop                                                            ;A7DC04;
    LDA.W $0FF0                                                          ;A7DC06;
    INC A                                                                ;A7DC09;
    STA.W $0FF0                                                          ;A7DC0A;
    CLC                                                                  ;A7DC0D;
    RTS                                                                  ;A7DC0E;


GetPhantoonHealthBasedPaletteColor:
    STX.B $18                                                            ;A7DC0F;
    LDX.W $0E54                                                          ;A7DC11;
    LDA.W #$09C4                                                         ;A7DC14;
    LSR A                                                                ;A7DC17;
    LSR A                                                                ;A7DC18;
    LSR A                                                                ;A7DC19;
    STA.B $12                                                            ;A7DC1A;
    STA.B $14                                                            ;A7DC1C;
    STZ.B $16                                                            ;A7DC1E;

.loop:
    LDA.B $14                                                            ;A7DC20;
    CMP.W EnemyData.health,X                                             ;A7DC22;
    BPL .getPointer                                                      ;A7DC25;
    LDA.B $14                                                            ;A7DC27;
    CLC                                                                  ;A7DC29;
    ADC.B $12                                                            ;A7DC2A;
    STA.B $14                                                            ;A7DC2C;
    LDA.B $16                                                            ;A7DC2E;
    INC A                                                                ;A7DC30;
    STA.B $16                                                            ;A7DC31;
    CMP.W #$0007                                                         ;A7DC33;
    BMI .loop                                                            ;A7DC36;

.getPointer:
    LDA.B $16                                                            ;A7DC38;
    ASL A                                                                ;A7DC3A;
    TAY                                                                  ;A7DC3B;
    LDA.W .palettePointers,Y                                             ;A7DC3C;
    CLC                                                                  ;A7DC3F;
    ADC.B $18                                                            ;A7DC40;
    TAY                                                                  ;A7DC42;
    LDA.W $0000,Y                                                        ;A7DC43;
    TAY                                                                  ;A7DC46;
    LDX.B $18                                                            ;A7DC47;
    RTS                                                                  ;A7DC49;


.palettePointers:
    dw Palette_Phantoon_HealthBased_0                                    ;A7DC4A;
    dw Palette_Phantoon_HealthBased_1                                    ;A7DC4C;
    dw Palette_Phantoon_HealthBased_2                                    ;A7DC4E;
    dw Palette_Phantoon_HealthBased_3                                    ;A7DC50;
    dw Palette_Phantoon_HealthBased_4                                    ;A7DC52;
    dw Palette_Phantoon_HealthBased_5                                    ;A7DC54;
    dw Palette_Phantoon_HealthBased_6                                    ;A7DC56;
    dw Palette_Phantoon_HealthBased_7                                    ;A7DC58;

AdvanceWreckedShipPowerOnPaletteTransition:
    REP #$30                                                             ;A7DC5A;
    LDA.W $0FEE                                                          ;A7DC5C;
    INC A                                                                ;A7DC5F;
    CMP.W $0FF0                                                          ;A7DC60;
    BCS .advance                                                         ;A7DC63;
    LDA.W #$0000                                                         ;A7DC65;
    STA.W $0FF0                                                          ;A7DC68;
    SEC                                                                  ;A7DC6B;
    RTS                                                                  ;A7DC6C;


.advance:
    LDX.W #$0000                                                         ;A7DC6D;

.loop:
    PHX                                                                  ;A7DC70;
    LDA.W Palette_WreckedShipPoweredOn,X                                 ;A7DC71;
    TAY                                                                  ;A7DC74;
    LDA.L $7EC000,X                                                      ;A7DC75;
    TAX                                                                  ;A7DC79;
    LDA.W $0FF0                                                          ;A7DC7A;
    JSR.W CalculateAthTransitionalColorFromXToY                          ;A7DC7D;
    PLX                                                                  ;A7DC80;
    STA.L $7EC000,X                                                      ;A7DC81;
    INX                                                                  ;A7DC85;
    INX                                                                  ;A7DC86;
    CPX.W #$00E0                                                         ;A7DC87;
    BCC .loop                                                            ;A7DC8A;
    LDA.W $0FF0                                                          ;A7DC8C;
    INC A                                                                ;A7DC8F;
    STA.W $0FF0                                                          ;A7DC90;
    CLC                                                                  ;A7DC93;
    RTS                                                                  ;A7DC94;


CalculateAthTransitionalColorFromXToY:
    PHA                                                                  ;A7DC95;
    PHA                                                                  ;A7DC96;
    PHX                                                                  ;A7DC97;
    PHY                                                                  ;A7DC98;
    LDA.B $01,S                                                          ;A7DC99;
    AND.W #$001F                                                         ;A7DC9B;
    TAY                                                                  ;A7DC9E;
    LDA.B $03,S                                                          ;A7DC9F;
    AND.W #$001F                                                         ;A7DCA1;
    TAX                                                                  ;A7DCA4;
    LDA.B $05,S                                                          ;A7DCA5;
    JSR.W CalculateTheAthTransitionalColorComponentFromXToY              ;A7DCA7;
    STA.B $07,S                                                          ;A7DCAA;
    LDA.B $01,S                                                          ;A7DCAC;
    ASL A                                                                ;A7DCAE;
    ASL A                                                                ;A7DCAF;
    ASL A                                                                ;A7DCB0;
    XBA                                                                  ;A7DCB1;
    AND.W #$001F                                                         ;A7DCB2;
    TAY                                                                  ;A7DCB5;
    LDA.B $03,S                                                          ;A7DCB6;
    ASL A                                                                ;A7DCB8;
    ASL A                                                                ;A7DCB9;
    ASL A                                                                ;A7DCBA;
    XBA                                                                  ;A7DCBB;
    AND.W #$001F                                                         ;A7DCBC;
    TAX                                                                  ;A7DCBF;
    LDA.B $05,S                                                          ;A7DCC0;
    JSR.W CalculateTheAthTransitionalColorComponentFromXToY              ;A7DCC2;
    ASL A                                                                ;A7DCC5;
    ASL A                                                                ;A7DCC6;
    ASL A                                                                ;A7DCC7;
    ASL A                                                                ;A7DCC8;
    ASL A                                                                ;A7DCC9;
    ORA.B $07,S                                                          ;A7DCCA;
    STA.B $07,S                                                          ;A7DCCC;
    LDA.B $01,S                                                          ;A7DCCE;
    LSR A                                                                ;A7DCD0;
    LSR A                                                                ;A7DCD1;
    XBA                                                                  ;A7DCD2;
    AND.W #$001F                                                         ;A7DCD3;
    TAY                                                                  ;A7DCD6;
    LDA.B $03,S                                                          ;A7DCD7;
    LSR A                                                                ;A7DCD9;
    LSR A                                                                ;A7DCDA;
    XBA                                                                  ;A7DCDB;
    AND.W #$001F                                                         ;A7DCDC;
    TAX                                                                  ;A7DCDF;
    LDA.B $05,S                                                          ;A7DCE0;
    JSR.W CalculateTheAthTransitionalColorComponentFromXToY              ;A7DCE2;
    ASL A                                                                ;A7DCE5;
    ASL A                                                                ;A7DCE6;
    XBA                                                                  ;A7DCE7;
    ORA.B $07,S                                                          ;A7DCE8;
    STA.B $07,S                                                          ;A7DCEA;
    PLY                                                                  ;A7DCEC;
    PLX                                                                  ;A7DCED;
    PLA                                                                  ;A7DCEE;
    PLA                                                                  ;A7DCEF;
    RTS                                                                  ;A7DCF0;


CalculateTheAthTransitionalColorComponentFromXToY:
    CMP.W #$0000                                                         ;A7DCF1;
    BNE .notZero                                                         ;A7DCF4;
    TXA                                                                  ;A7DCF6;
    RTS                                                                  ;A7DCF7;


.notZero:
    DEC A                                                                ;A7DCF8;
    CMP.W $0FEE                                                          ;A7DCF9;
    BNE +                                                                ;A7DCFC;
    TYA                                                                  ;A7DCFE;
    RTS                                                                  ;A7DCFF;


  + PHX                                                                  ;A7DD00;
    INC A                                                                ;A7DD01;
    STA.B $14                                                            ;A7DD02;
    TYA                                                                  ;A7DD04;
    SEC                                                                  ;A7DD05;
    SBC.B $01,S                                                          ;A7DD06;
    STA.B $12                                                            ;A7DD08;
    BPL +                                                                ;A7DD0A;
    EOR.W #$FFFF                                                         ;A7DD0C;
    INC A                                                                ;A7DD0F;

  + SEP #$21                                                             ;A7DD10;
    STZ.W HW_WRDIV                                                       ;A7DD12;
    STA.W $4205                                                          ;A7DD15;
    LDA.W $0FEE                                                          ;A7DD18;
    SBC.B $14                                                            ;A7DD1B;
    INC A                                                                ;A7DD1D;
    STA.W HW_WRDIVB                                                      ;A7DD1E;
    REP #$20                                                             ;A7DD21;
    NOP                                                                  ;A7DD23;
    NOP                                                                  ;A7DD24;
    NOP                                                                  ;A7DD25;
    NOP                                                                  ;A7DD26;
    NOP                                                                  ;A7DD27;
    LDA.W $4214                                                          ;A7DD28;
    BIT.B $12                                                            ;A7DD2B;
    BPL +                                                                ;A7DD2D;
    EOR.W #$FFFF                                                         ;A7DD2F;
    INC A                                                                ;A7DD32;

  + STA.B $12                                                            ;A7DD33;
    PLA                                                                  ;A7DD35;
    XBA                                                                  ;A7DD36;
    CLC                                                                  ;A7DD37;
    ADC.B $12                                                            ;A7DD38;
    XBA                                                                  ;A7DD3A;
    AND.W #$00FF                                                         ;A7DD3B;
    RTS                                                                  ;A7DD3E;


HurtAI_Phantoon:
    PHP                                                                  ;A7DD3F;
    REP #$30                                                             ;A7DD40;
    LDA.W $0F9C                                                          ;A7DD42;
    CMP.W #$0008                                                         ;A7DD45;
    BEQ .healthBased                                                     ;A7DD48;
    LDA.W $0FA4                                                          ;A7DD4A;
    BIT.W #$0002                                                         ;A7DD4D;
    BNE .white                                                           ;A7DD50;
    LDA.W $1036                                                          ;A7DD52;
    BIT.W #$FF00                                                         ;A7DD55;
    BEQ .return                                                          ;A7DD58;

.healthBased:
    LDX.W #$001E                                                         ;A7DD5A;

.loopPalette:
    JSR.W GetPhantoonHealthBasedPaletteColor                             ;A7DD5D;
    TYA                                                                  ;A7DD60;
    STA.L $7EC0E0,X                                                      ;A7DD61;
    DEX                                                                  ;A7DD65;
    DEX                                                                  ;A7DD66;
    BPL .loopPalette                                                     ;A7DD67;
    LDA.W $1036                                                          ;A7DD69;
    AND.W #$00FF                                                         ;A7DD6C;
    STA.W $1036                                                          ;A7DD6F;
    BRA .return                                                          ;A7DD72;


.white:
    LDA.W $1036                                                          ;A7DD74;
    BIT.W #$FF00                                                         ;A7DD77;
    BNE .return                                                          ;A7DD7A;
    LDX.W #$001E                                                         ;A7DD7C;

.loopWhite:
    LDA.W #$7FFF                                                         ;A7DD7F;
    STA.L $7EC0E0,X                                                      ;A7DD82;
    DEX                                                                  ;A7DD86;
    DEX                                                                  ;A7DD87;
    BPL .loopWhite                                                       ;A7DD88;
    LDA.W $1036                                                          ;A7DD8A;
    ORA.W #$0100                                                         ;A7DD8D;
    STA.W $1036                                                          ;A7DD90;

.return:
    PLP                                                                  ;A7DD93;
    RTL                                                                  ;A7DD94;


EnemyTouch_Phantoon:
    JSL.L NormalEnemyTouchAI_NoDeathCheck_External                       ;A7DD95;
    RTL                                                                  ;A7DD99;


RTL_A7DD9A:
    RTL                                                                  ;A7DD9A;


EnemyShot_Phantoon:
    PHB                                                                  ;A7DD9B;
    LDA.W $0FB2                                                          ;A7DD9C;
    CMP.W #Function_Phantoon_DeathSequence_FadingInAndOut                ;A7DD9F;
    BMI .notDead                                                         ;A7DDA2;
    PLB                                                                  ;A7DDA4;
    RTL                                                                  ;A7DDA5;


.notDead:
    LDX.W $0E54                                                          ;A7DDA6;
    LDA.W EnemyData.health,X                                             ;A7DDA9;
    PHA                                                                  ;A7DDAC;
    JSL.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External     ;A7DDAD;
    PLA                                                                  ;A7DDB1;
    STA.B $12                                                            ;A7DDB2;
    LDA.W EnemyData.health,X                                             ;A7DDB4;
    BNE .alive                                                           ;A7DDB7;
    LDA.W #$0073                                                         ;A7DDB9;
    JSL.L QueueSound_Lib2_Max6                                           ;A7DDBC;
    LDA.W #$0001                                                         ;A7DDC0;
    STA.W $1036                                                          ;A7DDC3;
    LDA.W $0F86                                                          ;A7DDC6;
    ORA.W #$0400                                                         ;A7DDC9;
    STA.W $0F86                                                          ;A7DDCC;
    JSR.W StartPhantoonDeathSequence                                     ;A7DDCF;

.returnUpper:
    PLB                                                                  ;A7DDD2;
    RTL                                                                  ;A7DDD3;


.alive:
    LDA.W EnemyData.ai,X                                                 ;A7DDD4;
    BIT.W #$0002                                                         ;A7DDD7;
    BEQ .returnUpper                                                     ;A7DDDA;
    LDA.W #$0073                                                         ;A7DDDC;
    JSL.L QueueSound_Lib2_Max6                                           ;A7DDDF;
    LDA.W EnemyData.work5,X                                              ;A7DDE3;
    CMP.W #Function_Phantoon_Figure8_VulnerableWindow                    ;A7DDE6;
    BEQ .vulnerableWindow                                                ;A7DDE9;
    CMP.W #Function_Phantoon_FlameRain_VulnerableWindow                  ;A7DDEB;
    BEQ .vulnerableWindow                                                ;A7DDEE;
    CMP.W #Function_Phantoon_Swooping_Opaque                             ;A7DDF0;
    BEQ .swooping                                                        ;A7DDF3;
    JMP.W .return1036_2                                                  ;A7DDF5;


.swooping:
    LDA.B $12                                                            ;A7DDF8;
    SEC                                                                  ;A7DDFA;
    SBC.W EnemyData.health,X                                             ;A7DDFB;
    STA.B $12                                                            ;A7DDFE;
    CMP.W #$012C                                                         ;A7DE00;
    BMI .overDamaged                                                     ;A7DE03;
    LDA.W $18A6                                                          ;A7DE05;
    ASL A                                                                ;A7DE08;
    TAY                                                                  ;A7DE09;
    LDA.W $0C18,Y                                                        ;A7DE0A;
    AND.W #$0F00                                                         ;A7DE0D;
    CMP.W #$0200                                                         ;A7DE10;
    BNE .overDamaged                                                     ;A7DE13;
    JMP.W .enraged                                                       ;A7DE15;


.overDamaged:
    LDA.W $102A,X                                                        ;A7DE18;
    CLC                                                                  ;A7DE1B;
    ADC.B $12                                                            ;A7DE1C;
    STA.W $102A,X                                                        ;A7DE1E;
    CMP.W #$012C                                                         ;A7DE21;
    BMI .return1036_2                                                    ;A7DE24;
    LDA.W #$0001                                                         ;A7DE26;
    STA.W EnemyData.work4,X                                              ;A7DE29;
    BRA .return1036_2                                                    ;A7DE2C;


.vulnerableWindow:
    LDA.B $12                                                            ;A7DE2E;
    SEC                                                                  ;A7DE30;
    SBC.W EnemyData.health,X                                             ;A7DE31;
    STA.B $12                                                            ;A7DE34;
    CMP.W #$012C                                                         ;A7DE36;
    BMI +                                                                ;A7DE39;
    LDA.W $18A6                                                          ;A7DE3B;
    ASL A                                                                ;A7DE3E;
    TAY                                                                  ;A7DE3F;
    LDA.W $0C18,Y                                                        ;A7DE40;
    AND.W #$0F00                                                         ;A7DE43;
    CMP.W #$0200                                                         ;A7DE46;
    BNE +                                                                ;A7DE49;
    JMP.W .enraged                                                       ;A7DE4B;


  + LDA.W $102A,X                                                        ;A7DE4E;
    CLC                                                                  ;A7DE51;
    ADC.B $12                                                            ;A7DE52;
    STA.W $102A,X                                                        ;A7DE54;
    CMP.W #$012C                                                         ;A7DE57;
    BPL .nextRound                                                       ;A7DE5A;
    JSL.L GenerateRandomNumber                                           ;A7DE5C;
    AND.W #$0007                                                         ;A7DE60;
    TAY                                                                  ;A7DE63;
    LDA.W Phantoon_Unknown0FEAValues_A7CDA5,Y                            ;A7DE64;
    AND.W #$00FF                                                         ;A7DE67;
    STA.W $0FEA                                                          ;A7DE6A;
    TYA                                                                  ;A7DE6D;
    STA.W $1076                                                          ;A7DE6E;
    LDA.W #$0001                                                         ;A7DE71;
    STA.W $1036                                                          ;A7DE74;
    LDA.W $1028                                                          ;A7DE77;
    BNE .returnLower                                                     ;A7DE7A;
    LDA.W #$0001                                                         ;A7DE7C;
    STA.W $1028                                                          ;A7DE7F;
    LDA.W EnemyData.work4,X                                              ;A7DE82;
    CMP.W #$0010                                                         ;A7DE85;
    BMI .returnLower                                                     ;A7DE88;
    LDA.W #$0010                                                         ;A7DE8A;
    STA.W EnemyData.work4,X                                              ;A7DE8D;

.returnLower:
    PLB                                                                  ;A7DE90;
    RTL                                                                  ;A7DE91;


.return1036_2:
    LDA.W #$0002                                                         ;A7DE92;
    STA.W $1036                                                          ;A7DE95;
    PLB                                                                  ;A7DE98;
    RTL                                                                  ;A7DE99;


.nextRound:
    LDA.W #Function_Phantoon_Swooping_FadeOut                            ;A7DE9A;
    STA.W EnemyData.work5,X                                              ;A7DE9D;

.nextRoundOrEnraged:
    STZ.W EnemyData.work4,X                                              ;A7DEA0;
    STZ.W $1028                                                          ;A7DEA3;
    STZ.W $102A,X                                                        ;A7DEA6;
    LDA.W $1988                                                          ;A7DEA9;
    ORA.W #$4000                                                         ;A7DEAC;
    STA.W $1988                                                          ;A7DEAF;
    LDA.W #$0001                                                         ;A7DEB2;
    STA.W $0F94                                                          ;A7DEB5;
    STA.W $0FD4                                                          ;A7DEB8;
    LDA.W #InstList_Phantoon_Body_Invulnerable                           ;A7DEBB;
    STA.W $0F92                                                          ;A7DEBE;
    LDA.W #InstList_Phantoon_Eye_Close                                   ;A7DEC1;
    STA.W $0FD2                                                          ;A7DEC4;
    LDA.W $0F86                                                          ;A7DEC7;
    ORA.W #$0400                                                         ;A7DECA;
    STA.W $0F86                                                          ;A7DECD;
    STZ.W $0FF2                                                          ;A7DED0;
    BRA .return1036_2                                                    ;A7DED3;


.enraged:
    LDA.W #Function_Phantoon_Enraged_FadingOutBeforeRage                 ;A7DED5;
    STA.W EnemyData.work5,X                                              ;A7DED8;
    BRA .nextRoundOrEnraged                                              ;A7DEDB;


ExtendedSpritemap_Phantoon_Body_Invulnerable:
    dw $0001,$0000,$0000                                                 ;A7DEDD;
    dw ExtendedTilemap_Phantoon_Body                                     ;A7DEE3;
    dw Hitbox_Phantoon_0                                                 ;A7DEE5;

ExtendedSpritemap_Phantoon_Body_FullHitbox:
    dw $0001,$0000,$0000                                                 ;A7DEE7;
    dw ExtendedTilemap_Phantoon_Body                                     ;A7DEED;
    dw Hitbox_Phantoon_1                                                 ;A7DEEF;

ExtendedSpritemap_Phantoon_Body_EyeHitbox:
    dw $0001,$0000,$0000                                                 ;A7DEF1;
    dw ExtendedTilemap_Phantoon_Body                                     ;A7DEF7;
    dw Hitbox_Phantoon_2                                                 ;A7DEF9;

ExtendedSpritemap_Phantoon_Eye_Closed:
    dw $0001,$0000,$0000                                                 ;A7DEFB;
    dw ExtendedTilemap_Phantoon_Eye_Closed                               ;A7DF01;
    dw Hitbox_Phantoon_0                                                 ;A7DF03;

ExtendedSpritemap_Phantoon_Eye_Opening:
    dw $0001,$0000,$0000                                                 ;A7DF05;
    dw ExtendedTilemap_Phantoon_Eye_Closed                               ;A7DF0B;
    dw Hitbox_Phantoon_0                                                 ;A7DF0D;

ExtendedSpritemap_Phantoon_Eye_OpeningClosing:
    dw $0001,$0000,$0000                                                 ;A7DF0F;
    dw ExtendedTilemap_Phantoon_Eye_OpeningClosing                       ;A7DF15;
    dw Hitbox_Phantoon_0                                                 ;A7DF17;

ExtendedSpritemap_Phantoon_Eye_Open:
    dw $0001,$0000,$0000                                                 ;A7DF19;
    dw ExtendedTilemap_Phantoon_Eye_Open                                 ;A7DF1F;
    dw Hitbox_Phantoon_0                                                 ;A7DF21;

ExtendedSpritemap_Phantoon_Eyeball_Centered:
    dw $0001,$0000,$0000                                                 ;A7DF23;
    dw ExtendedTilemap_Phantoon_Eyeball_Centered                         ;A7DF29;
    dw Hitbox_Phantoon_0                                                 ;A7DF2B;

ExtendedSpritemap_Phantoon_Eyeball_LookingUp:
    dw $0001,$0000,$0000                                                 ;A7DF2D;
    dw ExtendedTilemap_Phantoon_Eyeball_LookingUp                        ;A7DF33;
    dw Hitbox_Phantoon_0                                                 ;A7DF35;

ExtendedSpritemap_Phantoon_Eyeball_LookingDown:
    dw $0001,$0000,$0000                                                 ;A7DF37;
    dw ExtendedTilemap_Phantoon_Eyeball_LookingDown                      ;A7DF3D;
    dw Hitbox_Phantoon_0                                                 ;A7DF3F;

ExtendedSpritemap_Phantoon_Eyeball_LookingLeft:
    dw $0001,$0000,$0000                                                 ;A7DF41;
    dw ExtendedTilemap_Phantoon_Eyeball_LookingLeft                      ;A7DF47;
    dw Hitbox_Phantoon_0                                                 ;A7DF49;

ExtendedSpritemap_Phantoon_Eyeball_LookingRight:
    dw $0001,$0000,$0000                                                 ;A7DF4B;
    dw ExtendedTilemap_Phantoon_Eyeball_LookingRight                     ;A7DF51;
    dw Hitbox_Phantoon_0                                                 ;A7DF53;

ExtendedSpritemap_Phantoon_Eyeball_LookingDownLeft:
    dw $0001,$0000,$0000                                                 ;A7DF55;
    dw ExtendedTilemap_Phantoon_Eyeball_LookingDownLeft                  ;A7DF5B;
    dw Hitbox_Phantoon_0                                                 ;A7DF5D;

ExtendedSpritemap_Phantoon_Eyeball_LookingDownRight:
    dw $0001,$0000,$0000                                                 ;A7DF5F;
    dw ExtendedTilemap_Phantoon_Eyeball_LookingDownRight                 ;A7DF65;
    dw Hitbox_Phantoon_0                                                 ;A7DF67;

ExtendedSpritemap_Phantoon_Eyeball_LookingUpLeft:
    dw $0001,$0000,$0000                                                 ;A7DF69;
    dw ExtendedTilemap_Phantoon_Eyeball_LookingUpLeft                    ;A7DF6F;
    dw Hitbox_Phantoon_0                                                 ;A7DF71;

ExtendedSpritemap_Phantoon_Eyeball_LookingUpRight:
    dw $0001,$0000,$0000                                                 ;A7DF73;
    dw ExtendedTilemap_Phantoon_Eyeball_LookingUpRight                   ;A7DF79;
    dw Hitbox_Phantoon_0                                                 ;A7DF7B;

UNUSED_ExtendedSpritemap_Phantoon_Tentacles_A7DF7D:
    dw $0002,$0000,$0000                                                 ;A7DF7D;
    dw ExtendedTilemap_Phantoon_Tentacle_Left_0                          ;A7DF83;
    dw Hitbox_Phantoon_0                                                 ;A7DF85;
    dw $0000,$0000                                                       ;A7DF87;
    dw ExtendedTilemap_Phantoon_Tentacle_Right_0                         ;A7DF8B;
    dw Hitbox_Phantoon_0                                                 ;A7DF8D;

UNUSED_ExtendedSpritemap_Phantoon_Tentacles_A7DF8F:
    dw $0002,$0000,$0000                                                 ;A7DF8F;
    dw ExtendedTilemap_Phantoon_Tentacle_Left_1                          ;A7DF95;
    dw Hitbox_Phantoon_0                                                 ;A7DF97;
    dw $0000,$0000                                                       ;A7DF99;
    dw ExtendedTilemap_Phantoon_Tentacle_Right_1                         ;A7DF9D;
    dw Hitbox_Phantoon_0                                                 ;A7DF9F;

UNUSED_ExtendedSpritemap_Phantoon_Tentacles_A7DFA1:
    dw $0002,$0000,$0000                                                 ;A7DFA1;
    dw ExtendedTilemap_Phantoon_Tentacle_Left_2                          ;A7DFA7;
    dw Hitbox_Phantoon_0                                                 ;A7DFA9;
    dw $0000,$0000                                                       ;A7DFAB;
    dw ExtendedTilemap_Phantoon_Tentacle_Right_2                         ;A7DFAF;
    dw Hitbox_Phantoon_0                                                 ;A7DFB1;

ExtendedSpritemap_Phantoon_Tentacles_0:
    dw $0002,$0000,$0000                                                 ;A7DFB3;
    dw ExtendedTilemap_Phantoon_Tentacle_Left_0                          ;A7DFB9;
    dw Hitbox_Phantoon_0                                                 ;A7DFBB;
    dw $0000,$0000                                                       ;A7DFBD;
    dw ExtendedTilemap_Phantoon_Tentacle_Right_0                         ;A7DFC1;
    dw Hitbox_Phantoon_0                                                 ;A7DFC3;

ExtendedSpritemap_Phantoon_Tentacles_1:
    dw $0002,$0000,$0000                                                 ;A7DFC5;
    dw ExtendedTilemap_Phantoon_Tentacle_Left_1                          ;A7DFCB;
    dw Hitbox_Phantoon_0                                                 ;A7DFCD;
    dw $0000,$0000                                                       ;A7DFCF;
    dw ExtendedTilemap_Phantoon_Tentacle_Right_1                         ;A7DFD3;
    dw Hitbox_Phantoon_0                                                 ;A7DFD5;

ExtendedSpritemap_Phantoon_Tentacles_2:
    dw $0002,$0000,$0000                                                 ;A7DFD7;
    dw ExtendedTilemap_Phantoon_Tentacle_Left_2                          ;A7DFDD;
    dw Hitbox_Phantoon_0                                                 ;A7DFDF;
    dw $0000,$0000                                                       ;A7DFE1;
    dw ExtendedTilemap_Phantoon_Tentacle_Right_2                         ;A7DFE5;
    dw Hitbox_Phantoon_0                                                 ;A7DFE7;

ExtendedSpritemap_Phantoon_Mouth_Normal:
    dw $0001,$0000,$0000                                                 ;A7DFE9;
    dw ExtendedTilemap_Phantoon_Mouth_0                                  ;A7DFEF;
    dw Hitbox_Phantoon_0                                                 ;A7DFF1;

ExtendedSpritemap_Phantoon_Mouth_SpawningFlame_0:
    dw $0001,$0000,$0000                                                 ;A7DFF3;
    dw ExtendedTilemap_Phantoon_Mouth_1                                  ;A7DFF9;
    dw Hitbox_Phantoon_0                                                 ;A7DFFB;

ExtendedSpritemap_Phantoon_Mouth_SpawningFlame_1:
    dw $0001,$0000,$0000                                                 ;A7DFFD;
    dw ExtendedTilemap_Phantoon_Mouth_2                                  ;A7E003;
    dw Hitbox_Phantoon_0                                                 ;A7E005;

UNUSED_ExtendedSpritemap_Phantoon_Mouth_SpawningFlame_A7E007:
    dw $0001,$0000,$0000                                                 ;A7E007;
    dw ExtendedTilemap_Phantoon_Mouth_0                                  ;A7E00D;
    dw Hitbox_Phantoon_0                                                 ;A7E00F;

RTL_A7E011:
    RTL                                                                  ;A7E011;


UNUSED_Hitbox_Phantoon_A7E012:
    dw $0001,$FFF7,$FFF0,$0008,$0010                                     ;A7E012;
    dw EnemyTouch_Phantoon                                               ;A7E01C;
    dw EnemyShot_Phantoon                                                ;A7E01E;

Hitbox_Phantoon_0:
    dw $0001,$0000,$0000,$0000,$0000                                     ;A7E020;
    dw RTL_A7804C                                                        ;A7E02A;
    dw RTL_A7804C                                                        ;A7E02C;

Hitbox_Phantoon_1:
    dw $0005,$FFDF,$FFD8,$0020,$0038                                     ;A7E02E;
    dw EnemyTouch_Phantoon                                               ;A7E038;
    dw EnemyShot_Phantoon                                                ;A7E03A;
    dw $FFF7,$0016,$0008,$0027                                           ;A7E03C;
    dw EnemyTouch_Phantoon                                               ;A7E044;
    dw EnemyShot_Phantoon                                                ;A7E046;
    dw $FFE9,$0034,$FFF0,$0047                                           ;A7E048;
    dw EnemyTouch_Phantoon                                               ;A7E050;
    dw EnemyShot_Phantoon                                                ;A7E052;
    dw $000F,$0035,$0016,$0046                                           ;A7E054;
    dw EnemyTouch_Phantoon                                               ;A7E05C;
    dw EnemyShot_Phantoon                                                ;A7E05E;
    dw $FFF4,$0035,$000B,$0045                                           ;A7E060;
    dw EnemyTouch_Phantoon                                               ;A7E068;
    dw EnemyShot_Phantoon                                                ;A7E06A;

Hitbox_Phantoon_2:
    dw $0001,$FFF7,$0016,$0008,$0027                                     ;A7E06C;
    dw EnemyTouch_Phantoon                                               ;A7E076;
    dw EnemyShot_Phantoon                                                ;A7E078;

UNUSED_Spritemap_PhantoonFlame_A7E07A:
    dw $0002,$81F8                                                       ;A7E07A;
    db $00                                                               ;A7E07E;
    dw $2106,$81F8                                                       ;A7E07F;
    db $F0                                                               ;A7E083;
    dw $2100                                                             ;A7E084;

UNUSED_Spritemap_PhantoonFlame_A7E086:
    dw $0002,$81F8                                                       ;A7E086;
    db $00                                                               ;A7E08A;
    dw $2108,$81F8                                                       ;A7E08B;
    db $F0                                                               ;A7E08F;
    dw $2102                                                             ;A7E090;

UNUSED_Spritemap_PhantoonFlame_A7E092:
    dw $0002,$81F8                                                       ;A7E092;
    db $00                                                               ;A7E096;
    dw $210A,$81F8                                                       ;A7E097;
    db $F0                                                               ;A7E09B;
    dw $2104                                                             ;A7E09C;

UNUSED_Spritemap_PhantoonFlame_A7E09E:
    dw $0002,$8000                                                       ;A7E09E;
    db $F8                                                               ;A7E0A2;
    dw $610C,$81F0                                                       ;A7E0A3;
    db $F8                                                               ;A7E0A7;
    dw $210C                                                             ;A7E0A8;

ExtendedTilemap_Phantoon_Body:
    dw $FFFE,$2000,$000A,$2338,$2338,$2338,$3D32,$3D33                   ;A7E0AA;
    dw $7D33,$7D32,$2338,$2338,$2338,$2040,$000A,$2338                   ;A7E0BA;
    dw $3D40,$3D41,$3D42,$3D43,$7D43,$7D42,$7D41,$7D40                   ;A7E0CA;
    dw $2338,$2080,$000A,$2338,$3D50,$3D51,$3D52,$3D53                   ;A7E0DA;
    dw $7D53,$7D52,$7D51,$7D50,$2338,$20C0,$000A,$3D78                   ;A7E0EA;
    dw $3D60,$3D61,$3D62,$3D63,$7D63,$7D62,$7D61,$7D60                   ;A7E0FA;
    dw $7D78,$2100,$000A,$3D79,$3D70,$3D71,$3D72,$3D73                   ;A7E10A;
    dw $7D73,$7D72,$7D71,$7D70,$7D79,$2140,$000A,$BD78                   ;A7E11A;
    dw $3D34,$3D35,$3D36,$3D37,$7D37,$7D36,$7D35,$7D34                   ;A7E12A;
    dw $FD78,$2180,$000A,$2338,$3D44,$3D45,$3D46,$3D47                   ;A7E13A;
    dw $7D47,$7D46,$7D45,$7D44,$2338,$21C0,$000A,$2338                   ;A7E14A;
    dw $3D54,$3D55,$3D56,$3D57,$7D57,$7D56,$7D55,$7D54                   ;A7E15A;
    dw $2338,$2200,$000A,$2338,$3D64,$3D65,$3D66,$2338                   ;A7E16A;
    dw $2338,$7D66,$7D65,$7D64,$2338,$2240,$000A,$2338                   ;A7E17A;
    dw $3D74,$3D75,$3D76,$2338,$2338,$7D76,$7D75,$7D74                   ;A7E18A;
    dw $2338,$2280,$000A,$2338,$2338,$3D38,$3D39,$3D3A                   ;A7E19A;
    dw $7D3A,$7D39,$7D38,$2338,$2338,$22C0,$000A,$2338                   ;A7E1AA;
    dw $2338,$3D48,$3D49,$3D4A,$7D4A,$7D49,$7D48,$2338                   ;A7E1BA;
    dw $2338,$FFFF                                                       ;A7E1CA;

ExtendedTilemap_Phantoon_Eye_Open:
    dw $FFFE,$21C6,$0004,$3D56,$3D57,$7D57,$7D56,$2206                   ;A7E1CE;
    dw $0004,$3D66,$3D67,$3D3F,$7D66,$2246,$0004,$3D76                   ;A7E1DE;
    dw $3D77,$3D4F,$7D76,$2286,$0004,$3D39,$3D3A,$7D3A                   ;A7E1EE;
    dw $7D39,$FFFF                                                       ;A7E1FE;

ExtendedTilemap_Phantoon_Eye_OpeningClosing:
    dw $FFFE,$21C6,$0004,$3D3D,$3D3E,$7D3E,$7D3D,$2206                   ;A7E202;
    dw $0004,$3D4D,$3D4E,$3D5F,$7D4D,$2246,$0004,$3D5D                   ;A7E212;
    dw $3D5E,$3D6F,$7D5D,$2286,$0004,$3D6D,$3D6E,$7D6E                   ;A7E222;
    dw $7D6D,$FFFF                                                       ;A7E232;

ExtendedTilemap_Phantoon_Eye_Closed:
    dw $FFFE,$21C6,$0004,$3D3B,$3D3C,$7D3C,$7D3B,$2206                   ;A7E236;
    dw $0004,$3D4B,$3D4C,$7D4C,$7D4B,$2246,$0004,$3D5B                   ;A7E246;
    dw $3D5C,$7D5C,$7D5B,$2286,$0004,$3D6B,$3D6C,$7D6C                   ;A7E256;
    dw $7D6B,$FFFF                                                       ;A7E266;

ExtendedTilemap_Phantoon_Eyeball_Centered:
    dw $FFFE,$2208,$0002,$3D67,$3D3F,$2248,$0002,$3D77                   ;A7E26A;
    dw $3D4F,$FFFF                                                       ;A7E27A;

ExtendedTilemap_Phantoon_Eyeball_LookingUp:
    dw $FFFE,$2208,$0002,$3D10,$3D11,$2248,$0002,$3D20                   ;A7E27E;
    dw $3D21,$FFFF                                                       ;A7E28E;

ExtendedTilemap_Phantoon_Eyeball_LookingDown:
    dw $FFFE,$2208,$0002,$3D12,$3D13,$2248,$0002,$3D22                   ;A7E292;
    dw $3D23,$FFFF                                                       ;A7E2A2;

ExtendedTilemap_Phantoon_Eyeball_LookingLeft:
    dw $FFFE,$2208,$0002,$3D14,$3D15,$2248,$0002,$3D24                   ;A7E2A6;
    dw $3D25,$FFFF                                                       ;A7E2B6;

ExtendedTilemap_Phantoon_Eyeball_LookingRight:
    dw $FFFE,$2208,$0002,$3D16,$3D17,$2248,$0002,$3D26                   ;A7E2BA;
    dw $3D27,$FFFF                                                       ;A7E2CA;

ExtendedTilemap_Phantoon_Eyeball_LookingDownLeft:
    dw $FFFE,$2208,$0002,$3D18,$3D19,$2248,$0002,$3D28                   ;A7E2CE;
    dw $3D29,$FFFF                                                       ;A7E2DE;

ExtendedTilemap_Phantoon_Eyeball_LookingDownRight:
    dw $FFFE,$2208,$0002,$3D1A,$3D1B,$2248,$0002,$3D2A                   ;A7E2E2;
    dw $3D2B,$FFFF                                                       ;A7E2F2;

ExtendedTilemap_Phantoon_Eyeball_LookingUpLeft:
    dw $FFFE,$2208,$0002,$3D1C,$3D1D,$2248,$0002,$3D2C                   ;A7E2F6;
    dw $3D2D,$FFFF                                                       ;A7E306;

ExtendedTilemap_Phantoon_Eyeball_LookingUpRight:
    dw $FFFE,$2208,$0002,$3D1E,$3D1F,$2248,$0002,$3D2E                   ;A7E30A;
    dw $3D2F,$FFFF                                                       ;A7E31A;

ExtendedTilemap_Phantoon_Tentacle_Left_0:
    dw $FFFE,$2304,$0001,$3D58,$2344,$0001,$3D68,$FFFF                   ;A7E31E;

ExtendedTilemap_Phantoon_Tentacle_Left_1:
    dw $FFFE,$2304,$0001,$3D81,$2344,$0001,$3D83,$FFFF                   ;A7E32E;

ExtendedTilemap_Phantoon_Tentacle_Left_2:
    dw $FFFE,$2304,$0001,$3D80,$2344,$0001,$3D82,$FFFF                   ;A7E33E;

ExtendedTilemap_Phantoon_Tentacle_Right_0:
    dw $FFFE,$230E,$0001,$7D58,$234E,$0001,$7D68,$FFFF                   ;A7E34E;

ExtendedTilemap_Phantoon_Tentacle_Right_1:
    dw $FFFE,$230E,$0001,$7D81,$234E,$0001,$7D83,$FFFF                   ;A7E35E;

ExtendedTilemap_Phantoon_Tentacle_Right_2:
    dw $FFFE,$230E,$0001,$7D80,$234E,$0001,$7D82,$FFFF                   ;A7E36E;

ExtendedTilemap_Phantoon_Mouth_0:
    dw $FFFE,$2306,$0004,$3D59,$3D5A,$7D5A,$7D59,$2346                   ;A7E37E;
    dw $0004,$3D69,$3D6A,$7D6A,$7D69,$FFFF                               ;A7E38E;

ExtendedTilemap_Phantoon_Mouth_1:
    dw $FFFE,$2306,$0004,$3D7A,$3D7B,$7D7B,$7D7A,$2346                   ;A7E39A;
    dw $0004,$3D7C,$3D7D,$7D7D,$7D7C,$FFFF                               ;A7E3AA;

ExtendedTilemap_Phantoon_Mouth_2:
    dw $FFFE,$2306,$0004,$3D7E,$3D7F,$7D7F,$7D7E,$2346                   ;A7E3B6;
    dw $0004,$3D30,$3D31,$7D31,$7D30,$FFFF                               ;A7E3C6;

PhantoonMovementData:
    db $00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$FF,$00,$FF,$01,$00   ;A7E3D2;
    db $00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF   ;A7E3E2;
    db $01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00   ;A7E3F2;
    db $00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF   ;A7E402;
    db $01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF   ;A7E412;
    db $01,$00,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00   ;A7E422;
    db $00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00   ;A7E432;
    db $01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00   ;A7E442;
    db $01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;A7E452;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$01,$01,$00,$01,$00,$01,$00   ;A7E462;
    db $01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00   ;A7E472;
    db $00,$01,$01,$00,$01,$00,$01,$01,$01,$00,$01,$01,$01,$00,$00,$01   ;A7E482;
    db $01,$00,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01   ;A7E492;
    db $01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$01,$01,$01,$01,$01,$01   ;A7E4A2;
    db $01,$01,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01   ;A7E4B2;
    db $00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00   ;A7E4C2;
    db $00,$01,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$00,$01,$00,$01   ;A7E4D2;
    db $00,$01,$00,$01,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$00,$01   ;A7E4E2;
    db $FF,$00,$00,$01,$00,$01,$FF,$01,$00,$01,$FF,$00,$00,$01,$00,$01   ;A7E4F2;
    db $FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$01,$00,$01   ;A7E502;
    db $FF,$00,$FF,$01,$FF,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00   ;A7E512;
    db $00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$FF,$00   ;A7E522;
    db $00,$01,$FF,$00,$FF,$01,$FF,$00,$FF,$01,$FF,$00,$FF,$00,$00,$01   ;A7E532;
    db $FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00   ;A7E542;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00   ;A7E552;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00   ;A7E562;
    db $FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00   ;A7E572;
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$FF,$FF,$00   ;A7E582;
    db $00,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$FF,$FF,$FF,$FF,$00,$00,$FF   ;A7E592;
    db $FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$FF,$FF,$FF,$00,$FF,$FF,$00   ;A7E5A2;
    db $00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$FF   ;A7E5B2;
    db $00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$00,$FF   ;A7E5C2;
    db $FF,$00,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$FF,$00   ;A7E5D2;
    db $00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF   ;A7E5E2;
    db $FF,$FF,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00   ;A7E5F2;
    db $00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$FF,$00,$FF,$FF,$00   ;A7E602;
    db $00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$FF   ;A7E612;
    db $00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00   ;A7E622;
    db $00,$FF,$FF,$00,$FF,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00   ;A7E632;
    db $FF,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00   ;A7E642;
    db $00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$FF,$00   ;A7E652;
    db $00,$FF,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00   ;A7E662;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00   ;A7E672;
    db $00,$01,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01   ;A7E682;
    db $FF,$00,$FF,$00,$FF,$01,$FF,$00,$FF,$01,$FF,$00,$00,$01,$FF,$00   ;A7E692;
    db $FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00   ;A7E6A2;
    db $00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$FF,$01,$FF,$01   ;A7E6B2;
    db $FF,$01,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01   ;A7E6C2;
    db $00,$01,$FF,$00,$00,$01,$FF,$01,$00,$01,$00,$01,$FF,$00,$00,$01   ;A7E6D2;
    db $00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;A7E6E2;
    db $00,$01,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$00,$01,$01,$00   ;A7E6F2;
    db $00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01   ;A7E702;
    db $01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$01,$01,$01   ;A7E712;
    db $00,$01,$01,$00,$01,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00   ;A7E722;
    db $00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$01,$00   ;A7E732;
    db $00,$01,$01,$00,$01,$01,$01,$00,$01,$01,$01,$00,$01,$00,$00,$01   ;A7E742;
    db $01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00   ;A7E752;
    db $01,$00,$01,$00,$01,$00,$01,$01,$01,$00,$01,$00,$01,$00,$01,$00   ;A7E762;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00   ;A7E772;
    db $01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00   ;A7E782;
    db $01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF   ;A7E792;
    db $01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$01,$FF   ;A7E7A2;
    db $01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF   ;A7E7B2;
    db $01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00   ;A7E7C2;
    db $00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF   ;A7E7D2;
    db $01,$00,$00,$FF,$01,$FF,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF   ;A7E7E2;
    db $01,$FF,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF                   ;A7E7F2;

Palette_Etecoon:
    dw $3800,$5F97,$56F2,$2987,$00A0,$6355,$4AB0,$3A0B                   ;A7E7FE;
    dw $31C9,$57FF,$42F7,$2610,$158C,$03FF,$0279,$0029                   ;A7E80E;

InstList_Etecoon_LookRightAtSamusAndRunLeft:
    dw $0005                                                             ;A7E81E;
    dw Spritemap_Etecoon_C                                               ;A7E820;
    dw Instruction_Common_Sleep                                          ;A7E822;
    dw $0001                                                             ;A7E824;
    dw Spritemap_Etecoon_D                                               ;A7E826;

InstList_Etecoon_RunningLeft:
    dw $0005                                                             ;A7E828;
    dw Spritemap_Etecoon_0                                               ;A7E82A;
    dw $0005                                                             ;A7E82C;
    dw Spritemap_Etecoon_1                                               ;A7E82E;
    dw $0005                                                             ;A7E830;
    dw Spritemap_Etecoon_2                                               ;A7E832;
    dw $0005                                                             ;A7E834;
    dw Spritemap_Etecoon_1                                               ;A7E836;
    dw Instruction_Common_GotoY                                          ;A7E838;
    dw InstList_Etecoon_RunningLeft                                      ;A7E83A;

InstList_Etecoon_WallJump_0:
    dw $0008                                                             ;A7E83C;
    dw Spritemap_Etecoon_7                                               ;A7E83E;

InstList_Etecoon_WallJump_1:
    dw $0003                                                             ;A7E840;
    dw Spritemap_Etecoon_3                                               ;A7E842;
    dw $0003                                                             ;A7E844;
    dw Spritemap_Etecoon_4                                               ;A7E846;
    dw $0003                                                             ;A7E848;
    dw Spritemap_Etecoon_5                                               ;A7E84A;
    dw $0003                                                             ;A7E84C;
    dw Spritemap_Etecoon_6                                               ;A7E84E;
    dw Instruction_Common_GotoY                                          ;A7E850;
    dw InstList_Etecoon_WallJump_1                                       ;A7E852;

InstList_Etecoon_Hopping_FacingLeft:
    dw $0001                                                             ;A7E854;
    dw Spritemap_Etecoon_8                                               ;A7E856;
    dw Instruction_Common_Sleep                                          ;A7E858;
    dw $000C                                                             ;A7E85A;
    dw Spritemap_Etecoon_9                                               ;A7E85C;
    dw $000C                                                             ;A7E85E;
    dw Spritemap_Etecoon_A                                               ;A7E860;

InstList_Etecoon_HitCeiling:
    dw $0006                                                             ;A7E862;
    dw Spritemap_Etecoon_B                                               ;A7E864;
    dw $000C                                                             ;A7E866;
    dw Spritemap_Etecoon_A                                               ;A7E868;
    dw $000C                                                             ;A7E86A;
    dw Spritemap_Etecoon_9                                               ;A7E86C;
    dw Instruction_Common_Sleep                                          ;A7E86E;

InstList_Etecoon_WallJumpLeftEligible:
    dw $0001                                                             ;A7E870;
    dw Spritemap_Etecoon_F                                               ;A7E872;
    dw Instruction_Common_Sleep                                          ;A7E874;

InstList_Etecoon_LookLeftAtSamusAndRunRight:
    dw $0005                                                             ;A7E876;
    dw Spritemap_Etecoon_1E                                              ;A7E878;
    dw Instruction_CommonA7_Sleep                                        ;A7E87A;
    dw $0001                                                             ;A7E87C;
    dw Spritemap_Etecoon_1D                                              ;A7E87E;

InstList_Etecoon_RunningRight:
    dw $0005                                                             ;A7E880;
    dw Spritemap_Etecoon_10                                              ;A7E882;
    dw $0005                                                             ;A7E884;
    dw Spritemap_Etecoon_11                                              ;A7E886;
    dw $0005                                                             ;A7E888;
    dw Spritemap_Etecoon_12                                              ;A7E88A;
    dw $0005                                                             ;A7E88C;
    dw Spritemap_Etecoon_11                                              ;A7E88E;
    dw Instruction_Common_GotoY                                          ;A7E890;
    dw InstList_Etecoon_RunningRight                                     ;A7E892;

InstList_Etecoon_WallJumpRight:
    dw $0008                                                             ;A7E894;
    dw Spritemap_Etecoon_17                                              ;A7E896;

InstList_Etecoon_JumpingRight:
    dw $0003                                                             ;A7E898;
    dw Spritemap_Etecoon_13                                              ;A7E89A;
    dw $0003                                                             ;A7E89C;
    dw Spritemap_Etecoon_14                                              ;A7E89E;
    dw $0003                                                             ;A7E8A0;
    dw Spritemap_Etecoon_15                                              ;A7E8A2;
    dw $0003                                                             ;A7E8A4;
    dw Spritemap_Etecoon_16                                              ;A7E8A6;
    dw Instruction_Common_GotoY                                          ;A7E8A8;
    dw InstList_Etecoon_JumpingRight                                     ;A7E8AA;

InstList_Etecoon_Hopping_FacingRight:
    dw $0001                                                             ;A7E8AC;
    dw Spritemap_Etecoon_18                                              ;A7E8AE;
    dw Instruction_Common_Sleep                                          ;A7E8B0;
    dw $000C                                                             ;A7E8B2;
    dw Spritemap_Etecoon_19                                              ;A7E8B4;
    dw $000C                                                             ;A7E8B6;
    dw Spritemap_Etecoon_1A                                              ;A7E8B8;
    dw $0006                                                             ;A7E8BA;
    dw Spritemap_Etecoon_1B                                              ;A7E8BC;
    dw $000C                                                             ;A7E8BE;
    dw Spritemap_Etecoon_1A                                              ;A7E8C0;
    dw $000C                                                             ;A7E8C2;
    dw Spritemap_Etecoon_19                                              ;A7E8C4;
    dw Instruction_CommonA7_Sleep                                        ;A7E8C6;

InstList_Etecoon_WallJumpRightEligible:
    dw $0001                                                             ;A7E8C8;
    dw Spritemap_Etecoon_1F                                              ;A7E8CA;
    dw Instruction_Common_Sleep                                          ;A7E8CC;

InstList_Etecoon_Initial:
    dw $0008                                                             ;A7E8CE;
    dw Spritemap_Etecoon_18                                              ;A7E8D0;
    dw Instruction_Common_GotoY                                          ;A7E8D2;
    dw InstList_Etecoon_Initial                                          ;A7E8D4;

InstList_Etecoon_Flexing_0:
    dw Instruction_Common_TimerInY                                       ;A7E8D6;
    dw $0004                                                             ;A7E8D8;

InstList_Etecoon_Flexing_1:
    dw $0008                                                             ;A7E8DA;
    dw Spritemap_Etecoon_18                                              ;A7E8DC;
    dw $0008                                                             ;A7E8DE;
    dw Spritemap_Etecoon_19                                              ;A7E8E0;
    dw $0008                                                             ;A7E8E2;
    dw Spritemap_Etecoon_1A                                              ;A7E8E4;
    dw $0008                                                             ;A7E8E6;
    dw Spritemap_Etecoon_1B                                              ;A7E8E8;
    dw $0008                                                             ;A7E8EA;
    dw Spritemap_Etecoon_1A                                              ;A7E8EC;
    dw $0008                                                             ;A7E8EE;
    dw Spritemap_Etecoon_19                                              ;A7E8F0;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;A7E8F2;
    dw InstList_Etecoon_Flexing_1                                        ;A7E8F4;
    dw $0020                                                             ;A7E8F6;
    dw Spritemap_Etecoon_1C                                              ;A7E8F8;
    dw $0020                                                             ;A7E8FA;
    dw Spritemap_Etecoon_1E                                              ;A7E8FC;
    dw Instruction_Common_Sleep                                          ;A7E8FE;

EtecoonConstants_initialYVelocityOfHopsAndFailedJumps:
    dw $FFFD,$0000                                                       ;A7E900;

EtecoonConstants_initialYVelocityOfSuccessfulJump:
    dw $FFFC,$0000                                                       ;A7E904;

EtecoonConstants_XVelocityRight:
    dw $0002,$0000                                                       ;A7E908;

EtecoonConstants_XVelocityLeft:
    dw $FFFE,$0000                                                       ;A7E90C;

EtecoonConstants_SamusXProximityThresholdAtBottomOfRoom:
    dw $0040                                                             ;A7E910;

InitAI_Etecoon:
    LDX.W $0E54                                                          ;A7E912;
    LDA.W EnemyData.properties,X                                         ;A7E915;
    ORA.W #$2000                                                         ;A7E918;
    STA.W EnemyData.properties,X                                         ;A7E91B;
    LDA.W #Spritemap_CommonA7_Nothing                                    ;A7E91E;
    STA.W EnemyData.pSpritemap,X                                         ;A7E921;
    LDA.W #$0001                                                         ;A7E924;
    STA.W EnemyData.instTimer,X                                          ;A7E927;
    STZ.W EnemyData.loopCounter,X                                        ;A7E92A;
    LDA.W #InstList_Etecoon_Initial                                      ;A7E92D;
    STA.W EnemyData.pInstList,X                                          ;A7E930;
    LDA.W #Function_Etecoon_Initial                                      ;A7E933;
    STA.W EnemyData.work5,X                                              ;A7E936;
    LDA.W #$FFFF                                                         ;A7E939;
    STA.W EnemyData.work4,X                                              ;A7E93C;
    RTL                                                                  ;A7E93F;


MainAI_Etecoon:
    LDX.W $0E54                                                          ;A7E940;
    LDA.W EnemyData.initParam1,X                                         ;A7E943;
    BIT.W #$FF00                                                         ;A7E946;
    BEQ .executeFunction                                                 ;A7E949;
    SEC                                                                  ;A7E94B;
    SBC.W #$0100                                                         ;A7E94C;
    STA.W EnemyData.initParam1,X                                         ;A7E94F;
    BRA .return                                                          ;A7E952;


.executeFunction:
    JMP.W ($0FB2,X)                                                      ;A7E954;


.return:
    RTL                                                                  ;A7E957;


FreezeEtecoonIfQuakeActive:
    LDA.W $1840                                                          ;A7E958;
    BEQ .return                                                          ;A7E95B;
    LDA.W EnemyData.initParam1,X                                         ;A7E95D;
    AND.W #$00FF                                                         ;A7E960;
    ORA.W #$8000                                                         ;A7E963;
    STA.W EnemyData.initParam1,X                                         ;A7E966;
    LDA.W EnemyData.instTimer,X                                          ;A7E969;
    CLC                                                                  ;A7E96C;
    ADC.W #$0080                                                         ;A7E96D;
    STA.W EnemyData.instTimer,X                                          ;A7E970;

.return:
    RTS                                                                  ;A7E973;


EtecoonHorizontalMovement:
    LDA.W EnemyData.work2,X                                              ;A7E974;
    STA.B $14                                                            ;A7E977;
    LDA.W EnemyData.work3,X                                              ;A7E979;
    STA.B $12                                                            ;A7E97C;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A7E97E;
    RTS                                                                  ;A7E982;


EtecoonVerticalMovement:
    LDA.W EnemyData.work0,X                                              ;A7E983;
    STA.B $14                                                            ;A7E986;
    LDA.W EnemyData.work1,X                                              ;A7E988;
    STA.B $12                                                            ;A7E98B;
    LDA.W EnemyData.work0,X                                              ;A7E98D;
    CMP.W #$0005                                                         ;A7E990;
    BPL .move                                                            ;A7E993;
    LDA.W EnemyData.work1,X                                              ;A7E995;
    CLC                                                                  ;A7E998;
    ADC.L $000B32                                                        ;A7E999;
    STA.W EnemyData.work1,X                                              ;A7E99D;
    LDA.W EnemyData.work0,X                                              ;A7E9A0;
    ADC.L $000B34                                                        ;A7E9A3;
    STA.W EnemyData.work0,X                                              ;A7E9A7;

.move:
    JSL.L MoveEnemyDownBy_14_12                                          ;A7E9AA;
    RTS                                                                  ;A7E9AE;


Function_Etecoon_Initial:
    LDA.W $0797                                                          ;A7E9AF;
    BEQ .notDoorTransition                                               ;A7E9B2;
    RTL                                                                  ;A7E9B4;


.notDoorTransition:
    LDA.W EnemyData.work4,X                                              ;A7E9B5;
    BPL .positive                                                        ;A7E9B8;
    LDA.W #$0080                                                         ;A7E9BA;
    JSL.L IsSamusWithingAPixelRowsOfEnemy                                ;A7E9BD;
    TAY                                                                  ;A7E9C1;
    BEQ .return                                                          ;A7E9C2;
    LDA.W EnemyData.initParam1,X                                         ;A7E9C4;
    BIT.W #$0003                                                         ;A7E9C7;
    BNE .flex                                                            ;A7E9CA;
    LDA.W #$0035                                                         ;A7E9CC;
    JSL.L QueueSound_Lib2_Max15                                          ;A7E9CF;

.flex:
    LDA.W #$0001                                                         ;A7E9D3;
    STA.W EnemyData.instTimer,X                                          ;A7E9D6;
    LDA.W #InstList_Etecoon_Flexing_0                                    ;A7E9D9;
    STA.W EnemyData.pInstList,X                                          ;A7E9DC;
    LDA.W #$0100                                                         ;A7E9DF;
    STA.W EnemyData.work4,X                                              ;A7E9E2;
    RTL                                                                  ;A7E9E5;


.positive:
    DEC.W EnemyData.work4,X                                              ;A7E9E6;
    BEQ .hop                                                             ;A7E9E9;
    BPL .return                                                          ;A7E9EB;

.hop:
    LDA.W #InstList_Etecoon_Hopping_FacingLeft                           ;A7E9ED;
    STA.W EnemyData.pInstList,X                                          ;A7E9F0;
    LDA.W #Function_Etecoon_StartHop_BottomOfRoom                        ;A7E9F3;
    STA.W EnemyData.work5,X                                              ;A7E9F6;
    LDA.W #$000B                                                         ;A7E9F9;
    STA.W EnemyData.work4,X                                              ;A7E9FC;

.return:
    RTL                                                                  ;A7E9FF;


Function_Etecoon_StartHop_BottomOfRoom:
    DEC.W EnemyData.work4,X                                              ;A7EA00;
    BEQ .timerExpired                                                    ;A7EA03;
    BPL .return                                                          ;A7EA05;

.timerExpired:
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps          ;A7EA07;
    STA.W EnemyData.work0,X                                              ;A7EA0A;
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps+2        ;A7EA0D;
    STA.W EnemyData.work1,X                                              ;A7EA10;
    LDA.W EnemyData.pInstList,X                                          ;A7EA13;
    INC A                                                                ;A7EA16;
    INC A                                                                ;A7EA17;
    STA.W EnemyData.pInstList,X                                          ;A7EA18;
    LDA.W #$0001                                                         ;A7EA1B;
    STA.W EnemyData.instTimer,X                                          ;A7EA1E;
    LDA.W #Function_Etecoon_Hopping_BottomOfRoom                         ;A7EA21;
    STA.W EnemyData.work5,X                                              ;A7EA24;
    LDA.W $0AF6                                                          ;A7EA27;
    CMP.W #$0100                                                         ;A7EA2A;
    BMI .return                                                          ;A7EA2D;
    LDA.W #$0033                                                         ;A7EA2F;
    JSL.L QueueSound_Lib2_Max6                                           ;A7EA32;

.return:
    RTL                                                                  ;A7EA36;


Function_Etecoon_Hopping_BottomOfRoom:
    JSR.W EtecoonVerticalMovement                                        ;A7EA37;
    BCS .collision                                                       ;A7EA3A;
    RTL                                                                  ;A7EA3C;


.collision:
    LDA.W EnemyData.work0,X                                              ;A7EA3D;
    BPL .notRising                                                       ;A7EA40;
    STZ.W EnemyData.work0,X                                              ;A7EA42;
    STZ.W EnemyData.work1,X                                              ;A7EA45;
    LDA.W #$0003                                                         ;A7EA48;
    STA.W EnemyData.instTimer,X                                          ;A7EA4B;
    LDA.W #InstList_Etecoon_HitCeiling                                   ;A7EA4E;
    STA.W EnemyData.pInstList,X                                          ;A7EA51;
    RTL                                                                  ;A7EA54;


.notRising:
    LDA.W #$0040                                                         ;A7EA55;
    JSL.L IsSamusWithingAPixelRowsOfEnemy                                ;A7EA58;
    TAY                                                                  ;A7EA5C;
    BEQ .hopMore                                                         ;A7EA5D;
    LDA.W EtecoonConstants_SamusXProximityThresholdAtBottomOfRoom        ;A7EA5F;
    JSL.L IsSamusWithinAPixelColumnsOfEnemy                              ;A7EA62;
    TAY                                                                  ;A7EA66;
    BEQ .hopMore                                                         ;A7EA67;
    JSL.L DetermineDirectionOfSamusFromEnemy                             ;A7EA69;
    CMP.W #$0005                                                         ;A7EA6D;
    BPL .left                                                            ;A7EA70;
    LDA.W #InstList_Etecoon_LookRightAtSamusAndRunLeft                   ;A7EA72;
    STA.W EnemyData.pInstList,X                                          ;A7EA75;
    STZ.W EnemyData.initParam0,X                                         ;A7EA78;
    BRA +                                                                ;A7EA7B;


.left:
    LDA.W #InstList_Etecoon_LookLeftAtSamusAndRunRight                   ;A7EA7D;
    STA.W EnemyData.pInstList,X                                          ;A7EA80;
    LDA.W #$0001                                                         ;A7EA83;
    STA.W EnemyData.initParam0,X                                         ;A7EA86;

  + LDA.W #$0020                                                         ;A7EA89;
    STA.W EnemyData.work4,X                                              ;A7EA8C;
    LDA.W #$0001                                                         ;A7EA8F;
    STA.W EnemyData.instTimer,X                                          ;A7EA92;
    LDA.W #Function_Etecoon_LookAtSamus                                  ;A7EA95;
    STA.W EnemyData.work5,X                                              ;A7EA98;
    RTL                                                                  ;A7EA9B;


.hopMore:
    LDA.W #$000B                                                         ;A7EA9C;
    STA.W EnemyData.work4,X                                              ;A7EA9F;
    LDA.W #Function_Etecoon_StartHop_BottomOfRoom                        ;A7EAA2;
    STA.W EnemyData.work5,X                                              ;A7EAA5;
    LDA.W #$0001                                                         ;A7EAA8;
    STA.W EnemyData.instTimer,X                                          ;A7EAAB;
    LDA.W #InstList_Etecoon_Hopping_FacingLeft                           ;A7EAAE;
    STA.W EnemyData.pInstList,X                                          ;A7EAB1;
    RTL                                                                  ;A7EAB4;


Function_Etecoon_LookAtSamus:
    DEC.W EnemyData.work4,X                                              ;A7EAB5;
    BEQ .timerExpired                                                    ;A7EAB8;
    BPL .return                                                          ;A7EABA;

.timerExpired:
    LDA.W EnemyData.pInstList,X                                          ;A7EABC;
    INC A                                                                ;A7EABF;
    INC A                                                                ;A7EAC0;
    STA.W EnemyData.pInstList,X                                          ;A7EAC1;
    LDA.W #$0001                                                         ;A7EAC4;
    STA.W EnemyData.instTimer,X                                          ;A7EAC7;
    LDA.W EnemyData.initParam0,X                                         ;A7EACA;
    BEQ .left                                                            ;A7EACD;
    LDA.W EtecoonConstants_XVelocityRight                                ;A7EACF;
    STA.W EnemyData.work2,X                                              ;A7EAD2;
    LDA.W EtecoonConstants_XVelocityRight+2                              ;A7EAD5;
    STA.W EnemyData.work3,X                                              ;A7EAD8;
    LDA.W #Function_Etecoon_RunningRight                                 ;A7EADB;
    STA.W EnemyData.work5,X                                              ;A7EADE;
    BRA +                                                                ;A7EAE1;


.left:
    LDA.W EtecoonConstants_XVelocityLeft                                 ;A7EAE3;
    STA.W EnemyData.work2,X                                              ;A7EAE6;
    LDA.W EtecoonConstants_XVelocityLeft+2                               ;A7EAE9;
    STA.W EnemyData.work3,X                                              ;A7EAEC;
    LDA.W #Function_Etecoon_RunningLeft                                  ;A7EAEF;
    STA.W EnemyData.work5,X                                              ;A7EAF2;

  + LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps          ;A7EAF5;
    STA.W EnemyData.work0,X                                              ;A7EAF8;
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps+2        ;A7EAFB;
    STA.W EnemyData.work1,X                                              ;A7EAFE;

.return:
    RTL                                                                  ;A7EB01;


Function_Etecoon_RunningLeft:
    JSR.W EtecoonHorizontalMovement                                      ;A7EB02;
    BCC .return                                                          ;A7EB05;
    LDA.W EtecoonConstants_XVelocityRight                                ;A7EB07;
    STA.W EnemyData.work2,X                                              ;A7EB0A;
    LDA.W EtecoonConstants_XVelocityRight+2                              ;A7EB0D;
    STA.W EnemyData.work3,X                                              ;A7EB10;
    LDA.W #Function_Etecoon_RunningRight                                 ;A7EB13;
    STA.W EnemyData.work5,X                                              ;A7EB16;
    LDA.W #$0001                                                         ;A7EB19;
    STA.W EnemyData.instTimer,X                                          ;A7EB1C;
    LDA.W #InstList_Etecoon_RunningRight                                 ;A7EB1F;
    STA.W EnemyData.pInstList,X                                          ;A7EB22;
    LDA.W #$0001                                                         ;A7EB25;
    STA.W EnemyData.initParam0,X                                         ;A7EB28;

.return:
    RTL                                                                  ;A7EB2B;


Function_Etecoon_RunningRight:
    LDA.W #$0020                                                         ;A7EB2C;
    STA.B $14                                                            ;A7EB2F;
    STZ.B $12                                                            ;A7EB31;
    JSL.L CheckForHorizontalSolidBlockCollision                          ;A7EB33;
    BCC .move                                                            ;A7EB37;
    LDA.W #$0001                                                         ;A7EB39;
    STA.W EnemyData.instTimer,X                                          ;A7EB3C;
    LDA.W #InstList_Etecoon_JumpingRight                                 ;A7EB3F;
    STA.W EnemyData.pInstList,X                                          ;A7EB42;
    LDA.W #Function_Etecoon_Jumping                                      ;A7EB45;
    STA.W EnemyData.work5,X                                              ;A7EB48;
    RTL                                                                  ;A7EB4B;


.move:
    JSR.W EtecoonHorizontalMovement                                      ;A7EB4C;
    RTL                                                                  ;A7EB4F;


Function_Etecoon_Jumping:
    JSR.W FreezeEtecoonIfQuakeActive                                     ;A7EB50;
    JSR.W EtecoonHorizontalMovement                                      ;A7EB53;
    BCC .noWall                                                          ;A7EB56;
    LDA.W EnemyData.initParam0,X                                         ;A7EB58;
    BNE .leftEligible                                                    ;A7EB5B;
    LDA.W #InstList_Etecoon_WallJumpRightEligible                        ;A7EB5D;
    STA.W EnemyData.pInstList,X                                          ;A7EB60;
    LDA.W #$0001                                                         ;A7EB63;
    STA.W EnemyData.initParam0,X                                         ;A7EB66;
    BRA +                                                                ;A7EB69;


.leftEligible:
    LDA.W #InstList_Etecoon_WallJumpLeftEligible                         ;A7EB6B;
    STA.W EnemyData.pInstList,X                                          ;A7EB6E;
    STZ.W EnemyData.initParam0,X                                         ;A7EB71;

  + LDA.W #$0001                                                         ;A7EB74;
    STA.W EnemyData.instTimer,X                                          ;A7EB77;
    LDA.W #Function_Etecoon_WallJump                                     ;A7EB7A;
    STA.W EnemyData.work5,X                                              ;A7EB7D;
    LDA.W #$0008                                                         ;A7EB80;
    STA.W EnemyData.work4,X                                              ;A7EB83;
    LDA.W $0AF6                                                          ;A7EB86;
    CMP.W #$0100                                                         ;A7EB89;
    BMI .returnUpper                                                     ;A7EB8C;
    LDA.W #$0032                                                         ;A7EB8E;
    JSL.L QueueSound_Lib2_Max6                                           ;A7EB91;

.returnUpper:
    RTL                                                                  ;A7EB95;


.noWall:
    JSR.W EtecoonVerticalMovement                                        ;A7EB96;
    BCC .returnLower                                                     ;A7EB99;
    LDA.W EnemyData.initParam0,X                                         ;A7EB9B;
    BNE .hopLeft                                                         ;A7EB9E;
    LDA.W #InstList_Etecoon_Hopping_FacingRight                          ;A7EBA0;
    STA.W EnemyData.pInstList,X                                          ;A7EBA3;
    BRA +                                                                ;A7EBA6;


.hopLeft:
    LDA.W #InstList_Etecoon_Hopping_FacingLeft                           ;A7EBA8;
    STA.W EnemyData.pInstList,X                                          ;A7EBAB;

  + LDA.W #$0001                                                         ;A7EBAE;
    STA.W EnemyData.instTimer,X                                          ;A7EBB1;
    LDA.W #$000B                                                         ;A7EBB4;
    STA.W EnemyData.work4,X                                              ;A7EBB7;
    LDA.W #Function_Etecoon_LandedFromJump                               ;A7EBBA;
    STA.W EnemyData.work5,X                                              ;A7EBBD;
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps          ;A7EBC0;
    STA.W EnemyData.work0,X                                              ;A7EBC3;
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps+2        ;A7EBC6;
    STA.W EnemyData.work1,X                                              ;A7EBC9;

.returnLower:
    RTL                                                                  ;A7EBCC;


Function_Etecoon_WallJump:
    JSR.W FreezeEtecoonIfQuakeActive                                     ;A7EBCD;
    DEC.W EnemyData.work4,X                                              ;A7EBD0;
    BEQ .timerExpired                                                    ;A7EBD3;
    BPL .return                                                          ;A7EBD5;

.timerExpired:
    LDA.W EnemyData.initParam0,X                                         ;A7EBD7;
    BEQ .left                                                            ;A7EBDA;
    LDA.W #InstList_Etecoon_WallJumpRight                                ;A7EBDC;
    STA.W EnemyData.pInstList,X                                          ;A7EBDF;
    LDA.W EtecoonConstants_XVelocityRight                                ;A7EBE2;
    STA.W EnemyData.work2,X                                              ;A7EBE5;
    LDA.W EtecoonConstants_XVelocityRight+2                              ;A7EBE8;
    STA.W EnemyData.work3,X                                              ;A7EBEB;
    BRA +                                                                ;A7EBEE;


.left:
    LDA.W #InstList_Etecoon_WallJump_0                                   ;A7EBF0;
    STA.W EnemyData.pInstList,X                                          ;A7EBF3;
    LDA.W EtecoonConstants_XVelocityLeft                                 ;A7EBF6;
    STA.W EnemyData.work2,X                                              ;A7EBF9;
    LDA.W EtecoonConstants_XVelocityLeft+2                               ;A7EBFC;
    STA.W EnemyData.work3,X                                              ;A7EBFF;

  + LDA.W #$0001                                                         ;A7EC02;
    STA.W EnemyData.instTimer,X                                          ;A7EC05;
    LDA.W #Function_Etecoon_Jumping                                      ;A7EC08;
    STA.W EnemyData.work5,X                                              ;A7EC0B;
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps          ;A7EC0E;
    STA.W EnemyData.work0,X                                              ;A7EC11;
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps+2        ;A7EC14;
    STA.W EnemyData.work1,X                                              ;A7EC17;

.return:
    RTL                                                                  ;A7EC1A;


Function_Etecoon_LandedFromJump:
    DEC.W EnemyData.work4,X                                              ;A7EC1B;
    BEQ .timerExpired                                                    ;A7EC1E;
    BPL .return                                                          ;A7EC20;

.timerExpired:
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps          ;A7EC22;
    STA.W EnemyData.work0,X                                              ;A7EC25;
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps+2        ;A7EC28;
    STA.W EnemyData.work1,X                                              ;A7EC2B;
    TXY                                                                  ;A7EC2E;
    LDA.W EnemyData.initParam1,X                                         ;A7EC2F;
    AND.W #$00FF                                                         ;A7EC32;
    ASL A                                                                ;A7EC35;
    TAX                                                                  ;A7EC36;
    JSR.W (.pointers,X)                                                  ;A7EC37;
    LDA.W #$0001                                                         ;A7EC3A;
    STA.W EnemyData.instTimer,X                                          ;A7EC3D;

.return:
    RTL                                                                  ;A7EC40;


.pointers:
    dw RunToLeftRunUpPoint                                               ;A7EC41;
    dw RunToRightRunUpPoint                                              ;A7EC43;
    dw HopAtCenterRunUpPoint                                             ;A7EC45;

RunToLeftRunUpPoint:
    TYX                                                                  ;A7EC47;
    LDA.W #Function_Etecoon_RunToLeftRunUpPoint                          ;A7EC48;
    STA.W EnemyData.work5,X                                              ;A7EC4B;
    LDA.W #InstList_Etecoon_RunningLeft                                  ;A7EC4E;
    STA.W EnemyData.pInstList,X                                          ;A7EC51;
    LDA.W EtecoonConstants_XVelocityLeft                                 ;A7EC54;
    STA.W EnemyData.work2,X                                              ;A7EC57;
    LDA.W EtecoonConstants_XVelocityLeft+2                               ;A7EC5A;
    STA.W EnemyData.work3,X                                              ;A7EC5D;
    RTS                                                                  ;A7EC60;


RunToRightRunUpPoint:
    TYX                                                                  ;A7EC61;
    LDA.W #Function_Etecoon_RunToRightRunUpPoint                         ;A7EC62;
    STA.W EnemyData.work5,X                                              ;A7EC65;
    LDA.W #InstList_Etecoon_RunningRight                                 ;A7EC68;
    STA.W EnemyData.pInstList,X                                          ;A7EC6B;
    LDA.W EtecoonConstants_XVelocityRight                                ;A7EC6E;
    STA.W EnemyData.work2,X                                              ;A7EC71;
    LDA.W EtecoonConstants_XVelocityRight+2                              ;A7EC74;
    STA.W EnemyData.work3,X                                              ;A7EC77;
    RTS                                                                  ;A7EC7A;


HopAtCenterRunUpPoint:
    TYX                                                                  ;A7EC7B;
    LDA.W #Function_Etecoon_Hopping_TopOfRoom                            ;A7EC7C;
    STA.W EnemyData.work5,X                                              ;A7EC7F;
    LDA.W EnemyData.pInstList,X                                          ;A7EC82;
    INC A                                                                ;A7EC85;
    INC A                                                                ;A7EC86;
    STA.W EnemyData.pInstList,X                                          ;A7EC87;
    LDA.W EtecoonConstants_XVelocityRight                                ;A7EC8A;
    STA.W EnemyData.work2,X                                              ;A7EC8D;
    LDA.W EtecoonConstants_XVelocityRight+2                              ;A7EC90;
    STA.W EnemyData.work3,X                                              ;A7EC93;
    RTS                                                                  ;A7EC96;


Function_Etecoon_RunToLeftRunUpPoint:
    JSR.W EtecoonHorizontalMovement                                      ;A7EC97;
    LDA.W EnemyData.xPosition,X                                          ;A7EC9A;
    CMP.W #$0219                                                         ;A7EC9D;
    BPL .return                                                          ;A7ECA0;
    LDA.W #$000B                                                         ;A7ECA2;
    STA.W EnemyData.work4,X                                              ;A7ECA5;
    LDA.W #Function_Etecoon_StartHop_TopOfRoom                           ;A7ECA8;
    STA.W EnemyData.work5,X                                              ;A7ECAB;
    LDA.W #$0001                                                         ;A7ECAE;
    STA.W EnemyData.instTimer,X                                          ;A7ECB1;
    LDA.W #InstList_Etecoon_Hopping_FacingLeft                           ;A7ECB4;
    STA.W EnemyData.pInstList,X                                          ;A7ECB7;

.return:
    RTL                                                                  ;A7ECBA;


Function_Etecoon_RunToRightRunUpPoint:
    JSR.W EtecoonHorizontalMovement                                      ;A7ECBB;
    LDA.W EnemyData.xPosition,X                                          ;A7ECBE;
    CMP.W #$0258                                                         ;A7ECC1;
    BMI .return                                                          ;A7ECC4;
    LDA.W #$000B                                                         ;A7ECC6;
    STA.W EnemyData.work4,X                                              ;A7ECC9;
    LDA.W #Function_Etecoon_StartHop_TopOfRoom                           ;A7ECCC;
    STA.W EnemyData.work5,X                                              ;A7ECCF;
    LDA.W #$0001                                                         ;A7ECD2;
    STA.W EnemyData.instTimer,X                                          ;A7ECD5;
    LDA.W #InstList_Etecoon_Hopping_FacingLeft                           ;A7ECD8;
    STA.W EnemyData.pInstList,X                                          ;A7ECDB;

.return:
    RTL                                                                  ;A7ECDE;


Function_Etecoon_RunningForSuccessfulMorphTunnelJump:
    JSR.W EtecoonHorizontalMovement                                      ;A7ECDF;
    LDA.W EnemyData.xPosition,X                                          ;A7ECE2;
    CMP.W #$0258                                                         ;A7ECE5;
    BMI .return                                                          ;A7ECE8;
    LDA.W #Function_Etecoon_SuccessfulMorphTunnelJump                    ;A7ECEA;
    STA.W EnemyData.work5,X                                              ;A7ECED;
    LDA.W EtecoonConstants_initialYVelocityOfSuccessfulJump              ;A7ECF0;
    STA.W EnemyData.work0,X                                              ;A7ECF3;
    LDA.W EtecoonConstants_initialYVelocityOfSuccessfulJump+2            ;A7ECF6;
    STA.W EnemyData.work1,X                                              ;A7ECF9;
    LDA.W #$0001                                                         ;A7ECFC;
    STA.W EnemyData.instTimer,X                                          ;A7ECFF;
    LDA.W #InstList_Etecoon_JumpingRight                                 ;A7ED02;
    STA.W EnemyData.pInstList,X                                          ;A7ED05;

.return:
    RTL                                                                  ;A7ED08;


Function_Etecoon_SuccessfulMorphTunnelJump:
    JSR.W EtecoonHorizontalMovement                                      ;A7ED09;
    JSR.W EtecoonVerticalMovement                                        ;A7ED0C;
    LDA.W EnemyData.xPosition,X                                          ;A7ED0F;
    CMP.W #$02A8                                                         ;A7ED12;
    BMI .return                                                          ;A7ED15;
    LDA.W #$0001                                                         ;A7ED17;
    STA.W EnemyData.instTimer,X                                          ;A7ED1A;
    LDA.W #InstList_Etecoon_RunningRight                                 ;A7ED1D;
    STA.W EnemyData.pInstList,X                                          ;A7ED20;
    LDA.W #Function_Etecoon_RunningThroughMorphTunnel                    ;A7ED23;
    STA.W EnemyData.work5,X                                              ;A7ED26;

.return:
    RTL                                                                  ;A7ED29;


Function_Etecoon_RunningThroughMorphTunnel:
    JSR.W EtecoonHorizontalMovement                                      ;A7ED2A;
    LDA.W EnemyData.xPosition,X                                          ;A7ED2D;
    CMP.W #$0348                                                         ;A7ED30;
    BMI .return                                                          ;A7ED33;
    LDA.W #$0001                                                         ;A7ED35;
    STA.W EnemyData.instTimer,X                                          ;A7ED38;
    LDA.W #InstList_Etecoon_JumpingRight                                 ;A7ED3B;
    STA.W EnemyData.pInstList,X                                          ;A7ED3E;
    LDA.W #Function_Etecoon_FallingFromMorphTunnelLedge                  ;A7ED41;
    STA.W EnemyData.work5,X                                              ;A7ED44;
    LDA.W #$FFFF                                                         ;A7ED47;
    STA.W EnemyData.work0,X                                              ;A7ED4A;
    LDA.W EtecoonConstants_initialYVelocityOfSuccessfulJump+2            ;A7ED4D;
    STA.W EnemyData.work1,X                                              ;A7ED50;

.return:
    RTL                                                                  ;A7ED53;


Function_Etecoon_FallingFromMorphTunnelLedge:
    JSR.W EtecoonHorizontalMovement                                      ;A7ED54;
    JSR.W EtecoonVerticalMovement                                        ;A7ED57;
    BCC .return                                                          ;A7ED5A;
    LDA.W #$000B                                                         ;A7ED5C;
    STA.W EnemyData.work4,X                                              ;A7ED5F;
    LDA.W #$0001                                                         ;A7ED62;
    STA.W EnemyData.instTimer,X                                          ;A7ED65;
    LDA.W #InstList_Etecoon_Hopping_FacingLeft                           ;A7ED68;
    STA.W EnemyData.pInstList,X                                          ;A7ED6B;
    LDA.W #Function_Etecoon_StartHop_TopOfRoom                           ;A7ED6E;
    STA.W EnemyData.work5,X                                              ;A7ED71;

.return:
    RTL                                                                  ;A7ED74;


Function_Etecoon_Hopping_TopOfRoom:
    JSR.W FreezeEtecoonIfQuakeActive                                     ;A7ED75;
    JSR.W EtecoonVerticalMovement                                        ;A7ED78;
    BCS .collision                                                       ;A7ED7B;
    RTL                                                                  ;A7ED7D;


.collision:
    LDA.W EnemyData.work0,X                                              ;A7ED7E;
    BPL .rising                                                          ;A7ED81;
    STZ.W EnemyData.work0,X                                              ;A7ED83;
    STZ.W EnemyData.work1,X                                              ;A7ED86;
    LDA.W #$0003                                                         ;A7ED89;
    STA.W EnemyData.instTimer,X                                          ;A7ED8C;
    LDA.W #InstList_Etecoon_HitCeiling                                   ;A7ED8F;
    STA.W EnemyData.pInstList,X                                          ;A7ED92;
    RTL                                                                  ;A7ED95;


.rising:
    LDA.W #$000B                                                         ;A7ED96;
    STA.W EnemyData.work4,X                                              ;A7ED99;
    LDA.W #$0001                                                         ;A7ED9C;
    STA.W EnemyData.instTimer,X                                          ;A7ED9F;
    LDA.W #InstList_Etecoon_Hopping_FacingLeft                           ;A7EDA2;
    STA.W EnemyData.pInstList,X                                          ;A7EDA5;
    LDA.W EnemyData.initParam1,X                                         ;A7EDA8;
    BIT.W #$0002                                                         ;A7EDAB;
    BNE .successEtecoon                                                  ;A7EDAE;

.hop:
    LDA.W #Function_Etecoon_StartHop_TopOfRoom                           ;A7EDB0;
    STA.W EnemyData.work5,X                                              ;A7EDB3;
    BRA .return                                                          ;A7EDB6;


.successEtecoon:
    LDA.W EnemyData.xPosition,X                                          ;A7EDB8;
    CMP.W #$0340                                                         ;A7EDBB;
    BPL .hop                                                             ;A7EDBE;
    LDA.W #Function_Etecoon_HopUntilSamusIsNear                          ;A7EDC0;
    STA.W EnemyData.work5,X                                              ;A7EDC3;

.return:
    RTL                                                                  ;A7EDC6;


Function_Etecoon_StartHop_TopOfRoom:
    JSR.W FreezeEtecoonIfQuakeActive                                     ;A7EDC7;
    DEC.W EnemyData.work4,X                                              ;A7EDCA;
    BEQ .timerExpired                                                    ;A7EDCD;
    BPL .return                                                          ;A7EDCF;

.timerExpired:
    LDA.W EnemyData.initParam0,X                                         ;A7EDD1;
    CLC                                                                  ;A7EDD4;
    ADC.W #$0100                                                         ;A7EDD5;
    STA.W EnemyData.initParam0,X                                         ;A7EDD8;
    AND.W #$FF00                                                         ;A7EDDB;
    CMP.W #$0400                                                         ;A7EDDE;
    BMI .notFailedJump                                                   ;A7EDE1;
    LDA.W EnemyData.initParam0,X                                         ;A7EDE3;
    AND.W #$00FF                                                         ;A7EDE6;
    STA.W EnemyData.initParam0,X                                         ;A7EDE9;
    LDA.W EnemyData.initParam1,X                                         ;A7EDEC;
    BIT.W #$0002                                                         ;A7EDEF;
    BNE .notFailedJump                                                   ;A7EDF2;
    LDA.W #Function_Etecoon_RunningForFailedMorphTunnelJump              ;A7EDF4;
    STA.W EnemyData.work5,X                                              ;A7EDF7;
    LDA.W #InstList_Etecoon_RunningRight                                 ;A7EDFA;
    STA.W EnemyData.pInstList,X                                          ;A7EDFD;
    LDA.W EtecoonConstants_XVelocityRight                                ;A7EE00;
    STA.W EnemyData.work2,X                                              ;A7EE03;
    LDA.W EtecoonConstants_XVelocityRight+2                              ;A7EE06;
    STA.W EnemyData.work3,X                                              ;A7EE09;
    BRA .merge                                                           ;A7EE0C;


.notFailedJump:
    LDA.W #Function_Etecoon_Hopping_TopOfRoom                            ;A7EE0E;
    STA.W EnemyData.work5,X                                              ;A7EE11;
    LDA.W EnemyData.pInstList,X                                          ;A7EE14;
    INC A                                                                ;A7EE17;
    INC A                                                                ;A7EE18;
    STA.W EnemyData.pInstList,X                                          ;A7EE19;

.merge:
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps          ;A7EE1C;
    STA.W EnemyData.work0,X                                              ;A7EE1F;
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps+2        ;A7EE22;
    STA.W EnemyData.work1,X                                              ;A7EE25;
    LDA.W #$0001                                                         ;A7EE28;
    STA.W EnemyData.instTimer,X                                          ;A7EE2B;
    LDA.W $0AF6                                                          ;A7EE2E;
    CMP.W #$0100                                                         ;A7EE31;
    BMI .return                                                          ;A7EE34;
    LDA.W #$0033                                                         ;A7EE36;
    JSL.L QueueSound_Lib2_Max6                                           ;A7EE39;

.return:
    RTL                                                                  ;A7EE3D;


Function_Etecoon_HopUntilSamusIsNear:
    JSR.W FreezeEtecoonIfQuakeActive                                     ;A7EE3E;
    DEC.W EnemyData.work4,X                                              ;A7EE41;
    BEQ .timerExpired                                                    ;A7EE44;
    BPL .return                                                          ;A7EE46;

.timerExpired:
    LDA.W #$0040                                                         ;A7EE48;
    JSL.L IsSamusWithingAPixelRowsOfEnemy                                ;A7EE4B;
    TAY                                                                  ;A7EE4F;
    BEQ .notClose                                                        ;A7EE50;
    LDA.W #$0030                                                         ;A7EE52;
    JSL.L IsSamusWithinAPixelColumnsOfEnemy                              ;A7EE55;
    TAY                                                                  ;A7EE59;
    BEQ .notClose                                                        ;A7EE5A;
    LDA.W #InstList_Etecoon_RunningRight                                 ;A7EE5C;
    STA.W EnemyData.pInstList,X                                          ;A7EE5F;
    LDA.W #Function_Etecoon_RunningForSuccessfulMorphTunnelJump          ;A7EE62;
    STA.W EnemyData.work5,X                                              ;A7EE65;
    BRA .skipSFX                                                         ;A7EE68;


.notClose:
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps          ;A7EE6A;
    STA.W EnemyData.work0,X                                              ;A7EE6D;
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps+2        ;A7EE70;
    STA.W EnemyData.work1,X                                              ;A7EE73;
    LDA.W EnemyData.pInstList,X                                          ;A7EE76;
    INC A                                                                ;A7EE79;
    INC A                                                                ;A7EE7A;
    STA.W EnemyData.pInstList,X                                          ;A7EE7B;
    LDA.W #Function_Etecoon_Hopping_TopOfRoom                            ;A7EE7E;
    STA.W EnemyData.work5,X                                              ;A7EE81;
    LDA.W $0AF6                                                          ;A7EE84;
    CMP.W #$0100                                                         ;A7EE87;
    BMI .skipSFX                                                         ;A7EE8A;
    LDA.W #$0033                                                         ;A7EE8C;
    JSL.L QueueSound_Lib2_Max6                                           ;A7EE8F;

.skipSFX:
    LDA.W #$0001                                                         ;A7EE93;
    STA.W EnemyData.instTimer,X                                          ;A7EE96;

.return:
    RTL                                                                  ;A7EE99;


Function_Etecoon_RunningForFailedMorphTunnelJump:
    JSR.W EtecoonHorizontalMovement                                      ;A7EE9A;
    LDA.W EnemyData.xPosition,X                                          ;A7EE9D;
    CMP.W #$0258                                                         ;A7EEA0;
    BMI .return                                                          ;A7EEA3;
    LDA.W #Function_Etecoon_FailedTunnelJump                             ;A7EEA5;
    STA.W EnemyData.work5,X                                              ;A7EEA8;
    LDA.W #$0001                                                         ;A7EEAB;
    STA.W EnemyData.instTimer,X                                          ;A7EEAE;
    LDA.W #InstList_Etecoon_JumpingRight                                 ;A7EEB1;
    STA.W EnemyData.pInstList,X                                          ;A7EEB4;

.return:
    RTL                                                                  ;A7EEB7;


Function_Etecoon_FailedTunnelJump:
    JSR.W EtecoonHorizontalMovement                                      ;A7EEB8;
    JSR.W EtecoonVerticalMovement                                        ;A7EEBB;
    BCC .return                                                          ;A7EEBE;
    LDA.W EtecoonConstants_XVelocityLeft                                 ;A7EEC0;
    STA.W EnemyData.work2,X                                              ;A7EEC3;
    LDA.W EtecoonConstants_XVelocityLeft+2                               ;A7EEC6;
    STA.W EnemyData.work3,X                                              ;A7EEC9;
    LDA.W #Function_Etecoon_RunningLeft                                  ;A7EECC;
    STA.W EnemyData.work5,X                                              ;A7EECF;
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps          ;A7EED2;
    STA.W EnemyData.work0,X                                              ;A7EED5;
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps+2        ;A7EED8;
    STA.W EnemyData.work1,X                                              ;A7EEDB;
    LDA.W #$0001                                                         ;A7EEDE;
    STA.W EnemyData.instTimer,X                                          ;A7EEE1;
    LDA.W #InstList_Etecoon_RunningLeft                                  ;A7EEE4;
    STA.W EnemyData.pInstList,X                                          ;A7EEE7;

.return:
    RTL                                                                  ;A7EEEA;


RTL_A7EEEB:
    RTL                                                                  ;A7EEEB;


RTL_A7EEEC:
    RTL                                                                  ;A7EEEC;


Spritemap_Etecoon_0:
    dw $0003,$01F2                                                       ;A7EEED;
    db $FF                                                               ;A7EEF1;
    dw $3329,$C3F5                                                       ;A7EEF2;
    db $EF                                                               ;A7EEF6;
    dw $3300,$C3FA                                                       ;A7EEF7;
    db $F7                                                               ;A7EEFB;
    dw $3302                                                             ;A7EEFC;

Spritemap_Etecoon_1:
    dw $0002,$C3F5                                                       ;A7EEFE;
    db $F0                                                               ;A7EF02;
    dw $3300,$C3FA                                                       ;A7EF03;
    db $F8                                                               ;A7EF07;
    dw $3304                                                             ;A7EF08;

Spritemap_Etecoon_2:
    dw $0002,$C3F5                                                       ;A7EF0A;
    db $F1                                                               ;A7EF0E;
    dw $3300,$C3FA                                                       ;A7EF0F;
    db $F9                                                               ;A7EF13;
    dw $3306                                                             ;A7EF14;

Spritemap_Etecoon_3:
    dw $0003,$0000                                                       ;A7EF16;
    db $06                                                               ;A7EF1A;
    dw $3326,$01F8                                                       ;A7EF1B;
    db $06                                                               ;A7EF1F;
    dw $3325,$C3F8                                                       ;A7EF20;
    db $F6                                                               ;A7EF24;
    dw $3308                                                             ;A7EF25;

Spritemap_Etecoon_4:
    dw $0003,$0006                                                       ;A7EF27;
    db $F8                                                               ;A7EF2B;
    dw $3327,$0006                                                       ;A7EF2C;
    db $00                                                               ;A7EF30;
    dw $3328,$C3F6                                                       ;A7EF31;
    db $F8                                                               ;A7EF35;
    dw $330A                                                             ;A7EF36;

Spritemap_Etecoon_5:
    dw $0003,$0000                                                       ;A7EF38;
    db $F2                                                               ;A7EF3C;
    dw $B326,$01F8                                                       ;A7EF3D;
    db $F2                                                               ;A7EF41;
    dw $B325,$C3F8                                                       ;A7EF42;
    db $FA                                                               ;A7EF46;
    dw $F308                                                             ;A7EF47;

Spritemap_Etecoon_6:
    dw $0003,$01F2                                                       ;A7EF49;
    db $F8                                                               ;A7EF4D;
    dw $7327,$01F2                                                       ;A7EF4E;
    db $00                                                               ;A7EF52;
    dw $7328,$C3FA                                                       ;A7EF53;
    db $F8                                                               ;A7EF57;
    dw $F30A                                                             ;A7EF58;

Spritemap_Etecoon_7:
    dw $0003,$0008                                                       ;A7EF5A;
    db $02                                                               ;A7EF5E;
    dw $332E,$C3F3                                                       ;A7EF5F;
    db $F3                                                               ;A7EF63;
    dw $3300,$C3F8                                                       ;A7EF64;
    db $FA                                                               ;A7EF68;
    dw $330E                                                             ;A7EF69;

Spritemap_Etecoon_8:
    dw $0007,$0001                                                       ;A7EF6B;
    db $FE                                                               ;A7EF6F;
    dw $7322,$01F8                                                       ;A7EF70;
    db $FE                                                               ;A7EF74;
    dw $3322,$C3F8                                                       ;A7EF75;
    db $F2                                                               ;A7EF79;
    dw $730C,$01F9                                                       ;A7EF7A;
    db $01                                                               ;A7EF7E;
    dw $3324,$0000                                                       ;A7EF7F;
    db $01                                                               ;A7EF83;
    dw $7324,$01F9                                                       ;A7EF84;
    db $FA                                                               ;A7EF88;
    dw $3320,$0000                                                       ;A7EF89;
    db $FA                                                               ;A7EF8D;
    dw $7320                                                             ;A7EF8E;

Spritemap_Etecoon_9:
    dw $0007,$01F7                                                       ;A7EF90;
    db $FC                                                               ;A7EF94;
    dw $3322,$0002                                                       ;A7EF95;
    db $FC                                                               ;A7EF99;
    dw $7322,$C3F8                                                       ;A7EF9A;
    db $F1                                                               ;A7EF9E;
    dw $730C,$01F9                                                       ;A7EF9F;
    db $01                                                               ;A7EFA3;
    dw $3323,$0000                                                       ;A7EFA4;
    db $01                                                               ;A7EFA8;
    dw $7323,$01F9                                                       ;A7EFA9;
    db $FA                                                               ;A7EFAD;
    dw $3320,$0000                                                       ;A7EFAE;
    db $FA                                                               ;A7EFB2;
    dw $7320                                                             ;A7EFB3;

Spritemap_Etecoon_A:
    dw $0007,$01F9                                                       ;A7EFB5;
    db $01                                                               ;A7EFB9;
    dw $3323,$0000                                                       ;A7EFBA;
    db $01                                                               ;A7EFBE;
    dw $7323,$C3F8                                                       ;A7EFBF;
    db $EF                                                               ;A7EFC3;
    dw $730C,$01F9                                                       ;A7EFC4;
    db $F9                                                               ;A7EFC8;
    dw $3320,$0000                                                       ;A7EFC9;
    db $F9                                                               ;A7EFCD;
    dw $7320,$01F5                                                       ;A7EFCE;
    db $F9                                                               ;A7EFD2;
    dw $3321,$0004                                                       ;A7EFD3;
    db $F9                                                               ;A7EFD7;
    dw $7321                                                             ;A7EFD8;

Spritemap_Etecoon_B:
    dw $0007,$01F9                                                       ;A7EFDA;
    db $01                                                               ;A7EFDE;
    dw $3323,$0000                                                       ;A7EFDF;
    db $01                                                               ;A7EFE3;
    dw $7323,$C3F8                                                       ;A7EFE4;
    db $EF                                                               ;A7EFE8;
    dw $730C,$01F9                                                       ;A7EFE9;
    db $F9                                                               ;A7EFED;
    dw $3320,$0000                                                       ;A7EFEE;
    db $F9                                                               ;A7EFF2;
    dw $7320,$01F5                                                       ;A7EFF3;
    db $F7                                                               ;A7EFF7;
    dw $3321,$0004                                                       ;A7EFF8;
    db $F7                                                               ;A7EFFC;
    dw $7321                                                             ;A7EFFD;

Spritemap_Etecoon_C:
    dw $0007,$C3F8                                                       ;A7EFFF;
    db $F0                                                               ;A7F003;
    dw $3300,$0002                                                       ;A7F004;
    db $FC                                                               ;A7F008;
    dw $7322,$01F7                                                       ;A7F009;
    db $FC                                                               ;A7F00D;
    dw $3322,$01F9                                                       ;A7F00E;
    db $02                                                               ;A7F012;
    dw $3324,$0000                                                       ;A7F013;
    db $02                                                               ;A7F017;
    dw $7324,$01F9                                                       ;A7F018;
    db $FA                                                               ;A7F01C;
    dw $3320,$0000                                                       ;A7F01D;
    db $FA                                                               ;A7F021;
    dw $7320                                                             ;A7F022;

Spritemap_Etecoon_D:
    dw $0007,$0002                                                       ;A7F024;
    db $FC                                                               ;A7F028;
    dw $7322,$01F7                                                       ;A7F029;
    db $FC                                                               ;A7F02D;
    dw $3322,$C3F8                                                       ;A7F02E;
    db $F0                                                               ;A7F032;
    dw $730C,$01F9                                                       ;A7F033;
    db $02                                                               ;A7F037;
    dw $3324,$0000                                                       ;A7F038;
    db $02                                                               ;A7F03C;
    dw $7324,$01F9                                                       ;A7F03D;
    db $FA                                                               ;A7F041;
    dw $3320,$0000                                                       ;A7F042;
    db $FA                                                               ;A7F046;
    dw $7320                                                             ;A7F047;

Spritemap_Etecoon_E:
    dw $0007,$C3F8                                                       ;A7F049;
    db $F0                                                               ;A7F04D;
    dw $7300,$0002                                                       ;A7F04E;
    db $FC                                                               ;A7F052;
    dw $7322,$01F7                                                       ;A7F053;
    db $FC                                                               ;A7F057;
    dw $3322,$01F9                                                       ;A7F058;
    db $02                                                               ;A7F05C;
    dw $3324,$0000                                                       ;A7F05D;
    db $02                                                               ;A7F061;
    dw $7324,$01F9                                                       ;A7F062;
    db $FA                                                               ;A7F066;
    dw $3320,$0000                                                       ;A7F067;
    db $FA                                                               ;A7F06B;
    dw $7320                                                             ;A7F06C;

Spritemap_Etecoon_F:
    dw $0005,$C3F6                                                       ;A7F06E;
    db $F2                                                               ;A7F072;
    dw $3300,$0000                                                       ;A7F073;
    db $00                                                               ;A7F077;
    dw $332D,$01F8                                                       ;A7F078;
    db $00                                                               ;A7F07C;
    dw $332C,$0000                                                       ;A7F07D;
    db $F8                                                               ;A7F081;
    dw $332B,$01F8                                                       ;A7F082;
    db $F8                                                               ;A7F086;
    dw $332A                                                             ;A7F087;

Spritemap_Etecoon_10:
    dw $0003,$0006                                                       ;A7F089;
    db $FF                                                               ;A7F08D;
    dw $7329,$C3FB                                                       ;A7F08E;
    db $EF                                                               ;A7F092;
    dw $7300,$C3F6                                                       ;A7F093;
    db $F7                                                               ;A7F097;
    dw $7302                                                             ;A7F098;

Spritemap_Etecoon_11:
    dw $0002,$C3FB                                                       ;A7F09A;
    db $F0                                                               ;A7F09E;
    dw $7300,$C3F6                                                       ;A7F09F;
    db $F8                                                               ;A7F0A3;
    dw $7304                                                             ;A7F0A4;

Spritemap_Etecoon_12:
    dw $0002,$C3FB                                                       ;A7F0A6;
    db $F1                                                               ;A7F0AA;
    dw $7300,$C3F6                                                       ;A7F0AB;
    db $F9                                                               ;A7F0AF;
    dw $7306                                                             ;A7F0B0;

Spritemap_Etecoon_13:
    dw $0003,$01F8                                                       ;A7F0B2;
    db $06                                                               ;A7F0B6;
    dw $7326,$0000                                                       ;A7F0B7;
    db $06                                                               ;A7F0BB;
    dw $7325,$C3F8                                                       ;A7F0BC;
    db $F6                                                               ;A7F0C0;
    dw $7308                                                             ;A7F0C1;

Spritemap_Etecoon_14:
    dw $0003,$01F2                                                       ;A7F0C3;
    db $F8                                                               ;A7F0C7;
    dw $7327,$01F2                                                       ;A7F0C8;
    db $00                                                               ;A7F0CC;
    dw $7328,$C3FA                                                       ;A7F0CD;
    db $F8                                                               ;A7F0D1;
    dw $730A                                                             ;A7F0D2;

Spritemap_Etecoon_15:
    dw $0003,$01F8                                                       ;A7F0D4;
    db $F2                                                               ;A7F0D8;
    dw $F326,$0000                                                       ;A7F0D9;
    db $F2                                                               ;A7F0DD;
    dw $F325,$C3F8                                                       ;A7F0DE;
    db $FA                                                               ;A7F0E2;
    dw $B308                                                             ;A7F0E3;

Spritemap_Etecoon_16:
    dw $0003,$0006                                                       ;A7F0E5;
    db $F8                                                               ;A7F0E9;
    dw $3327,$0006                                                       ;A7F0EA;
    db $00                                                               ;A7F0EE;
    dw $3328,$C3F6                                                       ;A7F0EF;
    db $F8                                                               ;A7F0F3;
    dw $B30A                                                             ;A7F0F4;

Spritemap_Etecoon_17:
    dw $0003,$01F0                                                       ;A7F0F6;
    db $02                                                               ;A7F0FA;
    dw $732E,$C3FD                                                       ;A7F0FB;
    db $F3                                                               ;A7F0FF;
    dw $7300,$C3F8                                                       ;A7F100;
    db $FA                                                               ;A7F104;
    dw $730E                                                             ;A7F105;

Spritemap_Etecoon_18:
    dw $0007,$01F7                                                       ;A7F107;
    db $FE                                                               ;A7F10B;
    dw $3322,$0000                                                       ;A7F10C;
    db $FE                                                               ;A7F110;
    dw $7322,$C3F8                                                       ;A7F111;
    db $F2                                                               ;A7F115;
    dw $330C,$01FF                                                       ;A7F116;
    db $01                                                               ;A7F11A;
    dw $7324,$01F8                                                       ;A7F11B;
    db $01                                                               ;A7F11F;
    dw $3324,$01FF                                                       ;A7F120;
    db $FA                                                               ;A7F124;
    dw $7320,$01F8                                                       ;A7F125;
    db $FA                                                               ;A7F129;
    dw $3320                                                             ;A7F12A;

Spritemap_Etecoon_19:
    dw $0007,$0001                                                       ;A7F12C;
    db $FC                                                               ;A7F130;
    dw $7322,$01F6                                                       ;A7F131;
    db $FC                                                               ;A7F135;
    dw $3322,$C3F8                                                       ;A7F136;
    db $F1                                                               ;A7F13A;
    dw $330C,$01FF                                                       ;A7F13B;
    db $01                                                               ;A7F13F;
    dw $7323,$01F8                                                       ;A7F140;
    db $01                                                               ;A7F144;
    dw $3323,$01FF                                                       ;A7F145;
    db $FA                                                               ;A7F149;
    dw $7320,$01F8                                                       ;A7F14A;
    db $FA                                                               ;A7F14E;
    dw $3320                                                             ;A7F14F;

Spritemap_Etecoon_1A:
    dw $0007,$01FF                                                       ;A7F151;
    db $01                                                               ;A7F155;
    dw $7323,$01F8                                                       ;A7F156;
    db $01                                                               ;A7F15A;
    dw $3323,$C3F8                                                       ;A7F15B;
    db $EF                                                               ;A7F15F;
    dw $330C,$01FF                                                       ;A7F160;
    db $F9                                                               ;A7F164;
    dw $7320,$01F8                                                       ;A7F165;
    db $F9                                                               ;A7F169;
    dw $3320,$0003                                                       ;A7F16A;
    db $F9                                                               ;A7F16E;
    dw $7321,$01F4                                                       ;A7F16F;
    db $F9                                                               ;A7F173;
    dw $3321                                                             ;A7F174;

Spritemap_Etecoon_1B:
    dw $0007,$01FF                                                       ;A7F176;
    db $01                                                               ;A7F17A;
    dw $7323,$01F8                                                       ;A7F17B;
    db $01                                                               ;A7F17F;
    dw $3323,$C3F8                                                       ;A7F180;
    db $EF                                                               ;A7F184;
    dw $330C,$01FF                                                       ;A7F185;
    db $F9                                                               ;A7F189;
    dw $7320,$01F8                                                       ;A7F18A;
    db $F9                                                               ;A7F18E;
    dw $3320,$0003                                                       ;A7F18F;
    db $F7                                                               ;A7F193;
    dw $7321,$01F4                                                       ;A7F194;
    db $F7                                                               ;A7F198;
    dw $3321                                                             ;A7F199;

Spritemap_Etecoon_1C:
    dw $0007,$C3F8                                                       ;A7F19B;
    db $F0                                                               ;A7F19F;
    dw $7300,$01F6                                                       ;A7F1A0;
    db $FC                                                               ;A7F1A4;
    dw $3322,$0001                                                       ;A7F1A5;
    db $FC                                                               ;A7F1A9;
    dw $7322,$01FF                                                       ;A7F1AA;
    db $02                                                               ;A7F1AE;
    dw $7324,$01F8                                                       ;A7F1AF;
    db $02                                                               ;A7F1B3;
    dw $3324,$01FF                                                       ;A7F1B4;
    db $FA                                                               ;A7F1B8;
    dw $7320,$01F8                                                       ;A7F1B9;
    db $FA                                                               ;A7F1BD;
    dw $3320                                                             ;A7F1BE;

Spritemap_Etecoon_1D:
    dw $0007,$01F6                                                       ;A7F1C0;
    db $FC                                                               ;A7F1C4;
    dw $3322,$0001                                                       ;A7F1C5;
    db $FC                                                               ;A7F1C9;
    dw $7322,$C3F8                                                       ;A7F1CA;
    db $F0                                                               ;A7F1CE;
    dw $330C,$01FF                                                       ;A7F1CF;
    db $02                                                               ;A7F1D3;
    dw $7324,$01F8                                                       ;A7F1D4;
    db $02                                                               ;A7F1D8;
    dw $3324,$01FF                                                       ;A7F1D9;
    db $FA                                                               ;A7F1DD;
    dw $7320,$01F8                                                       ;A7F1DE;
    db $FA                                                               ;A7F1E2;
    dw $3320                                                             ;A7F1E3;

Spritemap_Etecoon_1E:
    dw $0007,$C3F8                                                       ;A7F1E5;
    db $F0                                                               ;A7F1E9;
    dw $3300,$01F6                                                       ;A7F1EA;
    db $FC                                                               ;A7F1EE;
    dw $3322,$0001                                                       ;A7F1EF;
    db $FC                                                               ;A7F1F3;
    dw $7322,$01FF                                                       ;A7F1F4;
    db $02                                                               ;A7F1F8;
    dw $7324,$01F8                                                       ;A7F1F9;
    db $02                                                               ;A7F1FD;
    dw $3324,$01FF                                                       ;A7F1FE;
    db $FA                                                               ;A7F202;
    dw $7320,$01F8                                                       ;A7F203;
    db $FA                                                               ;A7F207;
    dw $3320                                                             ;A7F208;

Spritemap_Etecoon_1F:
    dw $0005,$C3FA                                                       ;A7F20A;
    db $F2                                                               ;A7F20E;
    dw $7300,$01F8                                                       ;A7F20F;
    db $00                                                               ;A7F213;
    dw $732D,$0000                                                       ;A7F214;
    db $00                                                               ;A7F218;
    dw $732C,$01F8                                                       ;A7F219;
    db $F8                                                               ;A7F21D;
    dw $732B,$0000                                                       ;A7F21E;
    db $F8                                                               ;A7F222;
    dw $732A                                                             ;A7F223;

Palette_Dachora:
    dw $3800,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166                   ;A7F225;
    dw $0924,$57FF,$42F7,$2610,$158C,$7C1F,$6018,$300A                   ;A7F235;

Palette_Dachora_SpeedBoosting_0:
    dw $1580,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166                   ;A7F245;
    dw $0924,$57FF,$42F7,$2610,$158C,$7C1F,$6018,$300A                   ;A7F255;

Palette_Dachora_SpeedBoosting_1:
    dw $3800,$5357,$424D,$14E2,$1460,$4EB0,$360B,$2566                   ;A7F265;
    dw $1D24,$63FF,$56F7,$3A10,$298C,$7C1F,$6818,$440A                   ;A7F275;

Palette_Dachora_SpeedBoosting_2:
    dw $3800,$6B57,$5A4D,$2CE2,$2C60,$66B0,$4E0B,$3D66                   ;A7F285;
    dw $3524,$73FF,$6AF7,$5210,$418C,$7C1F,$7418,$5C0A                   ;A7F295;

Palette_Dachora_SpeedBoosting_3:
    dw $3800,$7F57,$6E4D,$40E2,$4060,$7AB0,$620B,$5166                   ;A7F2A5;
    dw $4924,$7FFF,$7EF7,$6610,$558C,$7C1F,$7C18,$700A                   ;A7F2B5;

Palette_Dachora_Shine_0:
    dw $3800,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166                   ;A7F2C5;
    dw $0924,$57FF,$42F7,$2610,$158C,$7C1F,$6018,$300A                   ;A7F2D5;

Palette_Dachora_Shine_1:
    dw $3800,$4B78,$3E90,$1967,$1906,$46F3,$326F,$25EB                   ;A7F2E5;
    dw $1DA9,$5FFF,$4F18,$3673,$29EF,$7CDF,$64D9,$3CCE                   ;A7F2F5;

Palette_Dachora_Shine_2:
    dw $3800,$579A,$4EF4,$320D,$31CC,$5336,$46D3,$3A70                   ;A7F305;
    dw $362E,$67FF,$5B5A,$46D6,$3E73,$7D9F,$699A,$4D92                   ;A7F315;

Palette_Dachora_Shine_3:
    dw $3800,$63BB,$5F37,$4AB3,$4A72,$6379,$5737,$52F5                   ;A7F325;
    dw $4ED4,$6FFF,$677B,$5B39,$52F7,$7E5F,$725C,$5E56                   ;A7F335;

InstList_Dachora_RunningLeft:
    dw $0005                                                             ;A7F345;
    dw Spritemap_Dachora_0                                               ;A7F347;
    dw $0005                                                             ;A7F349;
    dw Spritemap_Dachora_1                                               ;A7F34B;
    dw $0005                                                             ;A7F34D;
    dw Spritemap_Dachora_2                                               ;A7F34F;
    dw $0005                                                             ;A7F351;
    dw Spritemap_Dachora_3                                               ;A7F353;
    dw $0005                                                             ;A7F355;
    dw Spritemap_Dachora_4                                               ;A7F357;
    dw $0005                                                             ;A7F359;
    dw Spritemap_Dachora_5                                               ;A7F35B;
    dw Instruction_Common_GotoY                                          ;A7F35D;
    dw InstList_Dachora_RunningLeft                                      ;A7F35F;

InstList_Dachora_RunningLeft_FastAnimation:
    dw $0003                                                             ;A7F361;
    dw Spritemap_Dachora_0                                               ;A7F363;
    dw $0003                                                             ;A7F365;
    dw Spritemap_Dachora_1                                               ;A7F367;
    dw $0003                                                             ;A7F369;
    dw Spritemap_Dachora_2                                               ;A7F36B;
    dw $0003                                                             ;A7F36D;
    dw Spritemap_Dachora_3                                               ;A7F36F;
    dw $0003                                                             ;A7F371;
    dw Spritemap_Dachora_4                                               ;A7F373;
    dw $0003                                                             ;A7F375;
    dw Spritemap_Dachora_5                                               ;A7F377;
    dw Instruction_Common_GotoY                                          ;A7F379;
    dw InstList_Dachora_RunningLeft_FastAnimation                        ;A7F37B;

InstList_Dachora_RunningLeft_VeryFastAnimation:
    dw $0001                                                             ;A7F37D;
    dw Spritemap_Dachora_0                                               ;A7F37F;
    dw $0001                                                             ;A7F381;
    dw Spritemap_Dachora_1                                               ;A7F383;
    dw $0001                                                             ;A7F385;
    dw Spritemap_Dachora_2                                               ;A7F387;
    dw $0001                                                             ;A7F389;
    dw Spritemap_Dachora_3                                               ;A7F38B;
    dw $0001                                                             ;A7F38D;
    dw Spritemap_Dachora_4                                               ;A7F38F;
    dw $0001                                                             ;A7F391;
    dw Spritemap_Dachora_5                                               ;A7F393;
    dw Instruction_Common_GotoY                                          ;A7F395;
    dw InstList_Dachora_RunningLeft_VeryFastAnimation                    ;A7F397;

InstList_Dachora_Idling_FacingLeft:
    dw $0030                                                             ;A7F399;
    dw Spritemap_Dachora_8                                               ;A7F39B;
    dw $000A                                                             ;A7F39D;
    dw Spritemap_Dachora_B                                               ;A7F39F;
    dw $0007                                                             ;A7F3A1;
    dw Spritemap_Dachora_C                                               ;A7F3A3;
    dw $0007                                                             ;A7F3A5;
    dw Spritemap_Dachora_D                                               ;A7F3A7;
    dw $0007                                                             ;A7F3A9;
    dw Spritemap_Dachora_E                                               ;A7F3AB;
    dw $0007                                                             ;A7F3AD;
    dw Spritemap_Dachora_D                                               ;A7F3AF;
    dw $0007                                                             ;A7F3B1;
    dw Spritemap_Dachora_C                                               ;A7F3B3;
    dw $0007                                                             ;A7F3B5;
    dw Spritemap_Dachora_D                                               ;A7F3B7;
    dw $0007                                                             ;A7F3B9;
    dw Spritemap_Dachora_E                                               ;A7F3BB;
    dw $0007                                                             ;A7F3BD;
    dw Spritemap_Dachora_D                                               ;A7F3BF;
    dw $000A                                                             ;A7F3C1;
    dw Spritemap_Dachora_B                                               ;A7F3C3;
    dw Instruction_Common_GotoY                                          ;A7F3C5;
    dw InstList_Dachora_Idling_FacingLeft                                ;A7F3C7;

InstList_Dachora_Blinking_FacingLeft:
    dw $000B                                                             ;A7F3C9;
    dw Spritemap_Dachora_8                                               ;A7F3CB;
    dw $0008                                                             ;A7F3CD;
    dw Spritemap_Dachora_9                                               ;A7F3CF;
    dw $0008                                                             ;A7F3D1;
    dw Spritemap_Dachora_A                                               ;A7F3D3;
    dw $0004                                                             ;A7F3D5;
    dw Spritemap_Dachora_8                                               ;A7F3D7;
    dw $0004                                                             ;A7F3D9;
    dw Spritemap_Dachora_9                                               ;A7F3DB;
    dw $0004                                                             ;A7F3DD;
    dw Spritemap_Dachora_A                                               ;A7F3DF;
    dw $000A                                                             ;A7F3E1;
    dw Spritemap_Dachora_8                                               ;A7F3E3;
    dw $0005                                                             ;A7F3E5;
    dw Spritemap_Dachora_9                                               ;A7F3E7;
    dw $000B                                                             ;A7F3E9;
    dw Spritemap_Dachora_A                                               ;A7F3EB;
    dw Instruction_Common_GotoY                                          ;A7F3ED;
    dw InstList_Dachora_Blinking_FacingLeft                              ;A7F3EF;

UNUSED_InstList_Dachora_ChargeShinespark_FacingLeft_A7F3F1:
    dw $0001                                                             ;A7F3F1;
    dw Spritemap_Dachora_6                                               ;A7F3F3;
    dw Instruction_Common_Sleep                                          ;A7F3F5;

InstList_Dachora_Echo_FacingLeft:
    dw $000A                                                             ;A7F3F7;
    dw Spritemap_Dachora_7                                               ;A7F3F9;
    dw Instruction_Common_GotoY                                          ;A7F3FB;
    dw InstList_Dachora_Echo_FacingLeft                                  ;A7F3FD;

InstList_Dachora_Falling_FacingLeft:
    dw $0005                                                             ;A7F3FF;
    dw Spritemap_Dachora_4                                               ;A7F401;
    dw Instruction_Common_GotoY                                          ;A7F403;
    dw InstList_Dachora_Falling_FacingLeft                               ;A7F405;

InstList_Dachora_RunningRight:
    dw $0005                                                             ;A7F407;
    dw Spritemap_Dachora_F                                               ;A7F409;
    dw $0005                                                             ;A7F40B;
    dw Spritemap_Dachora_10                                              ;A7F40D;
    dw $0005                                                             ;A7F40F;
    dw Spritemap_Dachora_11                                              ;A7F411;
    dw $0005                                                             ;A7F413;
    dw Spritemap_Dachora_12                                              ;A7F415;
    dw $0005                                                             ;A7F417;
    dw Spritemap_Dachora_13                                              ;A7F419;
    dw $0005                                                             ;A7F41B;
    dw Spritemap_Dachora_14                                              ;A7F41D;
    dw Instruction_Common_GotoY                                          ;A7F41F;
    dw InstList_Dachora_RunningRight                                     ;A7F421;

InstList_Dachora_RunningRight_FastAnimation:
    dw $0003                                                             ;A7F423;
    dw Spritemap_Dachora_F                                               ;A7F425;
    dw $0003                                                             ;A7F427;
    dw Spritemap_Dachora_10                                              ;A7F429;
    dw $0003                                                             ;A7F42B;
    dw Spritemap_Dachora_11                                              ;A7F42D;
    dw $0003                                                             ;A7F42F;
    dw Spritemap_Dachora_12                                              ;A7F431;
    dw $0003                                                             ;A7F433;
    dw Spritemap_Dachora_13                                              ;A7F435;
    dw $0003                                                             ;A7F437;
    dw Spritemap_Dachora_14                                              ;A7F439;
    dw Instruction_Common_GotoY                                          ;A7F43B;
    dw InstList_Dachora_RunningRight_FastAnimation                       ;A7F43D;

InstList_Dachora_RunningRight_VeryFastAnimation:
    dw $0001                                                             ;A7F43F;
    dw Spritemap_Dachora_F                                               ;A7F441;
    dw $0001                                                             ;A7F443;
    dw Spritemap_Dachora_10                                              ;A7F445;
    dw $0001                                                             ;A7F447;
    dw Spritemap_Dachora_11                                              ;A7F449;
    dw $0001                                                             ;A7F44B;
    dw Spritemap_Dachora_12                                              ;A7F44D;
    dw $0001                                                             ;A7F44F;
    dw Spritemap_Dachora_13                                              ;A7F451;
    dw $0001                                                             ;A7F453;
    dw Spritemap_Dachora_14                                              ;A7F455;
    dw Instruction_Common_GotoY                                          ;A7F457;
    dw InstList_Dachora_RunningRight_VeryFastAnimation                   ;A7F459;

InstList_Dachora_Idling_FacingRight:
    dw $0030                                                             ;A7F45B;
    dw Spritemap_Dachora_17                                              ;A7F45D;
    dw $000A                                                             ;A7F45F;
    dw Spritemap_Dachora_1A                                              ;A7F461;
    dw $0007                                                             ;A7F463;
    dw Spritemap_Dachora_1B                                              ;A7F465;
    dw $0007                                                             ;A7F467;
    dw Spritemap_Dachora_1C                                              ;A7F469;
    dw $0007                                                             ;A7F46B;
    dw Spritemap_Dachora_1D                                              ;A7F46D;
    dw $0007                                                             ;A7F46F;
    dw Spritemap_Dachora_1C                                              ;A7F471;
    dw $0007                                                             ;A7F473;
    dw Spritemap_Dachora_1B                                              ;A7F475;
    dw $0007                                                             ;A7F477;
    dw Spritemap_Dachora_1C                                              ;A7F479;
    dw $0007                                                             ;A7F47B;
    dw Spritemap_Dachora_1D                                              ;A7F47D;
    dw $0007                                                             ;A7F47F;
    dw Spritemap_Dachora_1C                                              ;A7F481;
    dw $000A                                                             ;A7F483;
    dw Spritemap_Dachora_1A                                              ;A7F485;
    dw Instruction_Common_GotoY                                          ;A7F487;
    dw InstList_Dachora_Idling_FacingRight                               ;A7F489;

InstList_Dachora_Blinking_FacingRight:
    dw $000B                                                             ;A7F48B;
    dw Spritemap_Dachora_17                                              ;A7F48D;
    dw $0008                                                             ;A7F48F;
    dw Spritemap_Dachora_18                                              ;A7F491;
    dw $0008                                                             ;A7F493;
    dw Spritemap_Dachora_19                                              ;A7F495;
    dw $0004                                                             ;A7F497;
    dw Spritemap_Dachora_17                                              ;A7F499;
    dw $0004                                                             ;A7F49B;
    dw Spritemap_Dachora_18                                              ;A7F49D;
    dw $0004                                                             ;A7F49F;
    dw Spritemap_Dachora_19                                              ;A7F4A1;
    dw $000A                                                             ;A7F4A3;
    dw Spritemap_Dachora_17                                              ;A7F4A5;
    dw $0005                                                             ;A7F4A7;
    dw Spritemap_Dachora_18                                              ;A7F4A9;
    dw $000B                                                             ;A7F4AB;
    dw Spritemap_Dachora_19                                              ;A7F4AD;
    dw Instruction_Common_GotoY                                          ;A7F4AF;
    dw InstList_Dachora_Blinking_FacingRight                             ;A7F4B1;

InstList_Dachora_ChargeShinespark_FacingRight:
    dw $0001                                                             ;A7F4B3;
    dw Spritemap_Dachora_15                                              ;A7F4B5;
    dw Instruction_Common_Sleep                                          ;A7F4B7;

InstList_Dachora_Echo_FacingRight:
    dw $000A                                                             ;A7F4B9;
    dw Spritemap_Dachora_16                                              ;A7F4BB;
    dw Instruction_Common_GotoY                                          ;A7F4BD;
    dw InstList_Dachora_Echo_FacingRight                                 ;A7F4BF;

InstList_Dachora_Falling_FacingRight:
    dw $0005                                                             ;A7F4C1;
    dw Spritemap_Dachora_13                                              ;A7F4C3;
    dw Instruction_Common_GotoY                                          ;A7F4C5;
    dw InstList_Dachora_Falling_FacingRight                              ;A7F4C7;

DachoraConstants_SamusProximityXThreshold:
    dw $0060                                                             ;A7F4C9;

UNUSED_DachoraConstants_maxXDistanceFromSamusToStop_A7F4CB:
    dw $0060                                                             ;A7F4CB;

DachoraConstants_blinkingDuration:
    dw $0078                                                             ;A7F4CD;

DachoraConstants_delayBeforeActivatingShinespark:
    dw $003C                                                             ;A7F4CF;

DachoraConstants_echoPositionUpdateInterval:
    dw $0001                                                             ;A7F4D1;

DachoraConstants_echoLifetime:
    dw $0008                                                             ;A7F4D3;

DachoraConstants_maxXSpeed:
    dw $0008,$0000                                                       ;A7F4D5;

DachoraConstants_XAcceleration:
    dw $0000,$1000                                                       ;A7F4D9;

InitAI_Dachora:
    LDX.W $0E54                                                          ;A7F4DD;
    LDA.W EnemyData.properties,X                                         ;A7F4E0;
    ORA.W #$2000                                                         ;A7F4E3;
    STA.W EnemyData.properties,X                                         ;A7F4E6;
    LDA.W #Spritemap_CommonA7_Nothing                                    ;A7F4E9;
    STA.W EnemyData.pSpritemap,X                                         ;A7F4EC;
    LDA.W #$0001                                                         ;A7F4EF;
    STA.W EnemyData.instTimer,X                                          ;A7F4F2;
    STZ.W EnemyData.loopCounter,X                                        ;A7F4F5;
    LDA.W EnemyData.initParam0,X                                         ;A7F4F8;
    BMI .echo                                                            ;A7F4FB;
    BEQ .left                                                            ;A7F4FD;
    LDA.W #InstList_Dachora_Idling_FacingRight                           ;A7F4FF;
    STA.W EnemyData.pInstList,X                                          ;A7F502;
    BRA +                                                                ;A7F505;


.left:
    LDA.W #InstList_Dachora_Idling_FacingLeft                            ;A7F507;
    STA.W EnemyData.pInstList,X                                          ;A7F50A;

  + LDA.W #Function_Dachora_WaitForSamusToBeNear                         ;A7F50D;
    STA.W EnemyData.work5,X                                              ;A7F510;
    RTL                                                                  ;A7F513;


.echo:
    BIT.W #$0001                                                         ;A7F514;
    BEQ ..left                                                           ;A7F517;
    LDA.W #InstList_Dachora_Echo_FacingRight                             ;A7F519;
    STA.W EnemyData.pInstList,X                                          ;A7F51C;
    BRA +                                                                ;A7F51F;


..left:
    LDA.W #InstList_Dachora_Echo_FacingLeft                              ;A7F521;
    STA.W EnemyData.pInstList,X                                          ;A7F524;

  + LDA.W #Function_Dachora_Echo                                         ;A7F527;
    STA.W EnemyData.work5,X                                              ;A7F52A;
    RTL                                                                  ;A7F52D;


MainAI_Dachora:
    LDX.W $0E54                                                          ;A7F52E;
    JMP.W ($0FB2,X)                                                      ;A7F531;


RTL_A7F534:
    RTL                                                                  ;A7F534;


LoadDachoraPalette:
    PHP                                                                  ;A7F535;
    REP #$30                                                             ;A7F536;
    PHX                                                                  ;A7F538;
    LDA.W #$7E00                                                         ;A7F539;
    STA.B $01                                                            ;A7F53C;
    LDA.W EnemyData.palette,X                                            ;A7F53E;
    XBA                                                                  ;A7F541;
    LSR A                                                                ;A7F542;
    ASL A                                                                ;A7F543;
    TAX                                                                  ;A7F544;
    LDA.W .pointers,X                                                    ;A7F545;
    STA.B $00                                                            ;A7F548;
    TYX                                                                  ;A7F54A;
    LDY.W #$0000                                                         ;A7F54B;

.loop:
    LDA.W $0000,X                                                        ;A7F54E;
    STA.B [$00],Y                                                        ;A7F551;
    INX                                                                  ;A7F553;
    INX                                                                  ;A7F554;
    INY                                                                  ;A7F555;
    INY                                                                  ;A7F556;
    CPY.W #$0020                                                         ;A7F557;
    BMI .loop                                                            ;A7F55A;
    PLX                                                                  ;A7F55C;
    PLP                                                                  ;A7F55D;
    RTS                                                                  ;A7F55E;


.pointers:
    dw $C100                                                             ;A7F55F;
    dw $C120                                                             ;A7F561;
    dw $C140                                                             ;A7F563;
    dw $C160                                                             ;A7F565;
    dw $C180                                                             ;A7F567;
    dw $C1A0                                                             ;A7F569;
    dw $C1C0                                                             ;A7F56B;
    dw $C1E0                                                             ;A7F56D;

RTL_A7F56F:
    RTL                                                                  ;A7F56F;


Function_Dachora_WaitForSamusToBeNear:
    LDA.W #$0001                                                         ;A7F570;
    STA.B $14                                                            ;A7F573;
    STZ.B $12                                                            ;A7F575;
    JSL.L MoveEnemyDownBy_14_12                                          ;A7F577;
    LDA.W #$0040                                                         ;A7F57B;
    JSL.L IsSamusWithingAPixelRowsOfEnemy                                ;A7F57E;
    TAY                                                                  ;A7F582;
    BEQ .return                                                          ;A7F583;
    LDA.W DachoraConstants_SamusProximityXThreshold                      ;A7F585;
    JSL.L IsSamusWithinAPixelColumnsOfEnemy                              ;A7F588;
    TAY                                                                  ;A7F58C;
    BEQ .return                                                          ;A7F58D;
    LDA.W EnemyData.initParam0,X                                         ;A7F58F;
    BEQ .left                                                            ;A7F592;
    LDA.W #InstList_Dachora_Blinking_FacingRight                         ;A7F594;
    STA.W EnemyData.pInstList,X                                          ;A7F597;
    BRA +                                                                ;A7F59A;


.left:
    LDA.W #InstList_Dachora_Blinking_FacingLeft                          ;A7F59C;
    STA.W EnemyData.pInstList,X                                          ;A7F59F;

  + LDA.W #$0001                                                         ;A7F5A2;
    STA.W EnemyData.instTimer,X                                          ;A7F5A5;
    LDA.W #Function_Dachora_StartRunning                                 ;A7F5A8;
    STA.W EnemyData.work5,X                                              ;A7F5AB;
    LDA.W DachoraConstants_blinkingDuration                              ;A7F5AE;
    STA.W EnemyData.work0,X                                              ;A7F5B1;
    LDA.W #$001D                                                         ;A7F5B4;
    JSL.L QueueSound_Lib2_Max15                                          ;A7F5B7;

.return:
    RTL                                                                  ;A7F5BB;


Function_Dachora_StartRunning:
    DEC.W EnemyData.work0,X                                              ;A7F5BC;
    BNE .return                                                          ;A7F5BF;
    LDA.W EnemyData.initParam0,X                                         ;A7F5C1;
    BEQ .left                                                            ;A7F5C4;
    LDA.W #InstList_Dachora_RunningRight                                 ;A7F5C6;
    STA.W EnemyData.pInstList,X                                          ;A7F5C9;
    LDA.W #Function_Dachora_RunningRight                                 ;A7F5CC;
    STA.W EnemyData.work5,X                                              ;A7F5CF;
    BRA +                                                                ;A7F5D2;


.left:
    LDA.W #InstList_Dachora_RunningLeft                                  ;A7F5D4;
    STA.W EnemyData.pInstList,X                                          ;A7F5D7;
    LDA.W #Function_Dachora_RunningLeft                                  ;A7F5DA;
    STA.W EnemyData.work5,X                                              ;A7F5DD;

  + LDA.W #$0001                                                         ;A7F5E0;
    STA.W EnemyData.instTimer,X                                          ;A7F5E3;
    LDA.W #$0001                                                         ;A7F5E6;
    STA.W EnemyData.work4,X                                              ;A7F5E9;

.return:
    RTL                                                                  ;A7F5EC;


Function_Dachora_RunningLeft:
    JSR.W AccelerateRunningDachora                                       ;A7F5ED;
    LDA.B $14                                                            ;A7F5F0;
    EOR.W #$FFFF                                                         ;A7F5F2;
    STA.B $14                                                            ;A7F5F5;
    LDA.B $12                                                            ;A7F5F7;
    EOR.W #$FFFF                                                         ;A7F5F9;
    INC A                                                                ;A7F5FC;
    STA.B $12                                                            ;A7F5FD;
    BNE +                                                                ;A7F5FF;
    INC.B $14                                                            ;A7F601;

  + JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A7F603;
    BCS .stop                                                            ;A7F607;
    JSL.L AlignEnemyYPositionWIthNonSquareSlope                          ;A7F609;
    BRA .noWall                                                          ;A7F60D;


.stop:
    LDA.W #InstList_Dachora_RunningRight                                 ;A7F60F;
    STA.W EnemyData.pInstList,X                                          ;A7F612;
    LDA.W #Function_Dachora_RunningRight                                 ;A7F615;
    STA.W EnemyData.work5,X                                              ;A7F618;
    LDA.W #$0001                                                         ;A7F61B;
    STA.W EnemyData.work4,X                                              ;A7F61E;

.merge:
    LDA.W #$0001                                                         ;A7F621;
    STA.W EnemyData.initParam0,X                                         ;A7F624;
    LDA.W #$0001                                                         ;A7F627;
    STA.W EnemyData.instTimer,X                                          ;A7F62A;
    STZ.W EnemyData.work0,X                                              ;A7F62D;
    STZ.W EnemyData.work1,X                                              ;A7F630;
    LDY.W #Palette_Dachora                                               ;A7F633;
    JSR.W LoadDachoraPalette                                             ;A7F636;
    RTL                                                                  ;A7F639;


.noWall:
    LDA.W EnemyData.xPosition,X                                          ;A7F63A;
    CMP.W #$0060                                                         ;A7F63D;
    BMI .stop                                                            ;A7F640;
    RTL                                                                  ;A7F642;

    LDA.W UNUSED_DachoraConstants_maxXDistanceFromSamusToStop_A7F4CB     ;A7F643; dead code
    JSL.L IsSamusWithinAPixelColumnsOfEnemy                              ;A7F646;
    TAY                                                                  ;A7F64A;
    BNE .stop                                                            ;A7F64B;
    LDA.W #InstList_Dachora_Idling_FacingRight                           ;A7F64D;
    STA.W EnemyData.pInstList,X                                          ;A7F650;
    LDA.W #Function_Dachora_WaitForSamusToBeNear                         ;A7F653;
    STA.W EnemyData.work5,X                                              ;A7F656;
    STZ.W EnemyData.work4,X                                              ;A7F659;
    BRA .merge                                                           ;A7F65C;


Function_Dachora_RunningRight:
    JSR.W AccelerateRunningDachora                                       ;A7F65E;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A7F661;
    BCS .collision                                                       ;A7F665;
    JSL.L AlignEnemyYPositionWIthNonSquareSlope                          ;A7F667;
    BRA .noWall                                                          ;A7F66B;


.collision:
    LDA.W #$0071                                                         ;A7F66D;
    JSL.L QueueSound_Lib2_Max15                                          ;A7F670;
    LDA.W #InstList_Dachora_RunningLeft                                  ;A7F674;
    STA.W EnemyData.pInstList,X                                          ;A7F677;
    LDA.W #Function_Dachora_RunningLeft                                  ;A7F67A;
    STA.W EnemyData.work5,X                                              ;A7F67D;

.merge:
    STZ.W EnemyData.initParam0,X                                         ;A7F680;
    STZ.W EnemyData.work0,X                                              ;A7F683;
    LDY.W #Palette_Dachora                                               ;A7F686;
    JSR.W LoadDachoraPalette                                             ;A7F689;

.newAnimation:
    STZ.W EnemyData.work4,X                                              ;A7F68C;
    STZ.W EnemyData.work1,X                                              ;A7F68F;
    LDA.W #$0001                                                         ;A7F692;
    STA.W EnemyData.instTimer,X                                          ;A7F695;
    RTL                                                                  ;A7F698;


.noWall:
    LDA.W EnemyData.xPosition,X                                          ;A7F699;
    CMP.W #$0480                                                         ;A7F69C;
    BPL +                                                                ;A7F69F;
    RTL                                                                  ;A7F6A1;


  + LDA.W #InstList_Dachora_ChargeShinespark_FacingRight                 ;A7F6A2;
    STA.W EnemyData.pInstList,X                                          ;A7F6A5;
    LDA.W #Function_Dachora_ActivateShinespark                           ;A7F6A8;
    STA.W EnemyData.work5,X                                              ;A7F6AB;
    LDA.W DachoraConstants_delayBeforeActivatingShinespark               ;A7F6AE;
    STA.W EnemyData.work0,X                                              ;A7F6B1;
    LDA.W EnemyData.yPosition,X                                          ;A7F6B4;
    CLC                                                                  ;A7F6B7;
    ADC.W #$0008                                                         ;A7F6B8;
    STA.W EnemyData.yPosition,X                                          ;A7F6BB;
    LDA.W #$003D                                                         ;A7F6BE;
    JSL.L QueueSound_Lib2_Max6                                           ;A7F6C1;
    BRA .newAnimation                                                    ;A7F6C5;

    LDA.W #InstList_Dachora_Idling_FacingLeft                            ;A7F6C7; dead code
    STA.W EnemyData.pInstList,X                                          ;A7F6CA;
    LDA.W #Function_Dachora_WaitForSamusToBeNear                         ;A7F6CD;
    STA.W EnemyData.work5,X                                              ;A7F6D0;
    BRA .merge                                                           ;A7F6D3;


AccelerateRunningDachora:
    LDA.W EnemyData.work0,X                                              ;A7F6D5;
    CMP.W DachoraConstants_maxXSpeed                                     ;A7F6D8;
    BMI .noPaletteChange                                                 ;A7F6DB;
    LDA.W EnemyData.work4,X                                              ;A7F6DD;
    CMP.W #$0001                                                         ;A7F6E0;
    BNE .animTimer                                                       ;A7F6E3;
    LDA.W #$0039                                                         ;A7F6E5;
    JSL.L QueueSound_Lib2_Max6                                           ;A7F6E8;

.animTimer:
    LDA.W EnemyData.work4,X                                              ;A7F6EC;
    DEC A                                                                ;A7F6EF;
    STA.W EnemyData.work4,X                                              ;A7F6F0;
    AND.W #$00FF                                                         ;A7F6F3;
    BEQ .loadPalette                                                     ;A7F6F6;
    BPL .noPaletteChange                                                 ;A7F6F8;

.loadPalette:
    LDA.W EnemyData.work4,X                                              ;A7F6FA;
    XBA                                                                  ;A7F6FD;
    AND.W #$00FF                                                         ;A7F6FE;
    ASL A                                                                ;A7F701;
    TAY                                                                  ;A7F702;
    LDA.W .pointers,Y                                                    ;A7F703;
    TAY                                                                  ;A7F706;
    JSR.W LoadDachoraPalette                                             ;A7F707;
    LDA.W EnemyData.work4,X                                              ;A7F70A;
    CLC                                                                  ;A7F70D;
    ADC.W #$0110                                                         ;A7F70E;
    STA.W EnemyData.work4,X                                              ;A7F711;
    CMP.W #$0410                                                         ;A7F714;
    BMI .noPaletteChange                                                 ;A7F717;
    LDA.W #$0310                                                         ;A7F719;
    STA.W EnemyData.work4,X                                              ;A7F71C;

.noPaletteChange:
    LDA.W #$0001                                                         ;A7F71F;
    STA.B $14                                                            ;A7F722;
    STZ.B $12                                                            ;A7F724;
    JSL.L MoveEnemyDownBy_14_12                                          ;A7F726;
    LDA.W EnemyData.work0,X                                              ;A7F72A;
    CMP.W DachoraConstants_maxXSpeed                                     ;A7F72D;
    BMI .increaseSpeed                                                   ;A7F730;
    LDA.W EnemyData.work1,X                                              ;A7F732;
    CMP.W DachoraConstants_maxXSpeed+2                                   ;A7F735;
    BMI .increaseSpeed                                                   ;A7F738;
    LDA.W DachoraConstants_maxXSpeed                                     ;A7F73A;
    STA.W EnemyData.work0,X                                              ;A7F73D;
    STA.B $14                                                            ;A7F740;
    LDA.W DachoraConstants_maxXSpeed+2                                   ;A7F742;
    STA.W EnemyData.work1,X                                              ;A7F745;
    STA.B $12                                                            ;A7F748;
    BRA .return                                                          ;A7F74A;


.increaseSpeed:
    LDA.W EnemyData.work1,X                                              ;A7F74C;
    CLC                                                                  ;A7F74F;
    ADC.W DachoraConstants_XAcceleration+2                               ;A7F750;
    STA.W EnemyData.work1,X                                              ;A7F753;
    STA.B $12                                                            ;A7F756;
    LDA.W EnemyData.work0,X                                              ;A7F758;
    ADC.W DachoraConstants_XAcceleration                                 ;A7F75B;
    STA.W EnemyData.work0,X                                              ;A7F75E;
    STA.B $14                                                            ;A7F761;
    CMP.W #$0004                                                         ;A7F763;
    BNE .checkMaxSpeed                                                   ;A7F766;
    LDA.B $12                                                            ;A7F768;
    CMP.W #$0000                                                         ;A7F76A;
    BNE .return                                                          ;A7F76D;

.maxSpeed:
    LDA.W EnemyData.pInstList,X                                          ;A7F76F;
    CLC                                                                  ;A7F772;
    ADC.W #$001C                                                         ;A7F773;
    STA.W EnemyData.pInstList,X                                          ;A7F776;
    RTS                                                                  ;A7F779;


.checkMaxSpeed:
    CMP.W #$0008                                                         ;A7F77A;
    BNE .return                                                          ;A7F77D;
    LDA.B $12                                                            ;A7F77F;
    CMP.W #$0000                                                         ;A7F781;
    BEQ .maxSpeed                                                        ;A7F784;

.return:
    RTS                                                                  ;A7F786;


.pointers:
    dw Palette_Dachora_SpeedBoosting_0                                   ;A7F787;
    dw Palette_Dachora_SpeedBoosting_1                                   ;A7F789;
    dw Palette_Dachora_SpeedBoosting_2                                   ;A7F78B;
    dw Palette_Dachora_SpeedBoosting_3                                   ;A7F78D;

Function_Dachora_ActivateShinespark:
    JSR.W LoadDachoraShinePalette                                        ;A7F78F;
    DEC.W EnemyData.work0,X                                              ;A7F792;
    BNE .return                                                          ;A7F795;
    LDA.W EnemyData.pInstList,X                                          ;A7F797;
    INC A                                                                ;A7F79A;
    INC A                                                                ;A7F79B;
    STA.W EnemyData.pInstList,X                                          ;A7F79C;
    LDA.W #$0001                                                         ;A7F79F;
    STA.W EnemyData.instTimer,X                                          ;A7F7A2;
    LDA.W #Function_Dachora_Shinesparking                                ;A7F7A5;
    STA.W EnemyData.work5,X                                              ;A7F7A8;
    STZ.W $0FE8,X                                                        ;A7F7AB;
    STZ.W $0FEE,X                                                        ;A7F7AE;
    STZ.W $102E,X                                                        ;A7F7B1;
    STZ.W $106E,X                                                        ;A7F7B4;
    STZ.W $10AE,X                                                        ;A7F7B7;
    STZ.W EnemyData.work2,X                                              ;A7F7BA;
    STZ.W EnemyData.work3,X                                              ;A7F7BD;
    LDA.W EnemyData.yPosition,X                                          ;A7F7C0;
    SEC                                                                  ;A7F7C3;
    SBC.W #$0008                                                         ;A7F7C4;
    STA.W EnemyData.yPosition,X                                          ;A7F7C7;
    LDA.W #$003B                                                         ;A7F7CA;
    JSL.L QueueSound_Lib2_Max6                                           ;A7F7CD;
    LDA.W EnemyData.initParam0,X                                         ;A7F7D1;
    BEQ .left                                                            ;A7F7D4;
    LDA.W #InstList_Dachora_Echo_FacingRight                             ;A7F7D6;
    STA.W $0FD2,X                                                        ;A7F7D9;
    STA.W $1012,X                                                        ;A7F7DC;
    STA.W $1052,X                                                        ;A7F7DF;
    STA.W $1092,X                                                        ;A7F7E2;
    BRA +                                                                ;A7F7E5;


.left:
    LDA.W #InstList_Dachora_Echo_FacingLeft                              ;A7F7E7;
    STA.W $0FD2,X                                                        ;A7F7EA;
    STA.W $1012,X                                                        ;A7F7ED;
    STA.W $1052,X                                                        ;A7F7F0;
    STA.W $1092,X                                                        ;A7F7F3;

  + LDA.W #$0001                                                         ;A7F7F6;
    STA.W $0FD4,X                                                        ;A7F7F9;
    STA.W $1014,X                                                        ;A7F7FC;
    STA.W $1054,X                                                        ;A7F7FF;
    STA.W $1094,X                                                        ;A7F802;

.return:
    RTL                                                                  ;A7F805;


Function_Dachora_Shinesparking:
    JSR.W LoadDachoraShinePalette                                        ;A7F806;
    JSR.W UpdateDachoraEchoPositions                                     ;A7F809;
    LDA.W EnemyData.work3,X                                              ;A7F80C;
    CLC                                                                  ;A7F80F;
    ADC.L $000B32                                                        ;A7F810;
    STA.W EnemyData.work3,X                                              ;A7F814;
    LDA.W EnemyData.work2,X                                              ;A7F817;
    ADC.L $000B34                                                        ;A7F81A;
    STA.W EnemyData.work2,X                                              ;A7F81E;
    LDA.W EnemyData.work1,X                                              ;A7F821;
    CLC                                                                  ;A7F824;
    ADC.W EnemyData.work3,X                                              ;A7F825;
    STA.W EnemyData.work1,X                                              ;A7F828;
    STA.B $12                                                            ;A7F82B;
    LDA.W EnemyData.work0,X                                              ;A7F82D;
    ADC.W EnemyData.work2,X                                              ;A7F830;
    STA.W EnemyData.work0,X                                              ;A7F833;
    STA.B $14                                                            ;A7F836;
    CMP.W #$000F                                                         ;A7F838;
    BMI +                                                                ;A7F83B;
    LDA.W #$000F                                                         ;A7F83D;
    STA.B $14                                                            ;A7F840;

  + LDA.B $14                                                            ;A7F842;
    EOR.W #$FFFF                                                         ;A7F844;
    STA.B $14                                                            ;A7F847;
    LDA.B $12                                                            ;A7F849;
    EOR.W #$FFFF                                                         ;A7F84B;
    INC A                                                                ;A7F84E;
    STA.B $12                                                            ;A7F84F;
    BNE .move                                                            ;A7F851;
    INC.B $14                                                            ;A7F853;

.move:
    JSL.L MoveEnemyDownBy_14_12                                          ;A7F855;
    BCC .return                                                          ;A7F859;
    LDA.W EnemyData.initParam0,X                                         ;A7F85B;
    BNE .right                                                           ;A7F85E;
    LDA.W #InstList_Dachora_Falling_FacingRight                          ;A7F860;
    STA.W EnemyData.pInstList,X                                          ;A7F863;
    LDA.W #$0001                                                         ;A7F866;
    STA.W EnemyData.initParam0,X                                         ;A7F869;
    BRA +                                                                ;A7F86C;


.right:
    LDA.W #InstList_Dachora_Falling_FacingLeft                           ;A7F86E;
    STA.W EnemyData.pInstList,X                                          ;A7F871;
    STZ.W EnemyData.initParam0,X                                         ;A7F874;

  + LDA.W #Function_Dachora_Falling                                      ;A7F877;
    STA.W EnemyData.work5,X                                              ;A7F87A;
    LDA.W #$0001                                                         ;A7F87D;
    STA.W EnemyData.instTimer,X                                          ;A7F880;
    STZ.W EnemyData.work0,X                                              ;A7F883;
    STZ.W EnemyData.work1,X                                              ;A7F886;
    STZ.W EnemyData.work4,X                                              ;A7F889;
    LDY.W #Palette_Dachora                                               ;A7F88C;
    JSR.W LoadDachoraPalette                                             ;A7F88F;
    LDA.W #$003C                                                         ;A7F892;
    JSL.L QueueSound_Lib2_Max6                                           ;A7F895;

.return:
    RTL                                                                  ;A7F899;


UpdateDachoraEchoPositions:
    LDA.W $0FE8,X                                                        ;A7F89A;
    BEQ .timerExpired                                                    ;A7F89D;
    DEC A                                                                ;A7F89F;
    STA.W $0FE8,X                                                        ;A7F8A0;
    RTS                                                                  ;A7F8A3;


.timerExpired:
    LDA.W DachoraConstants_echoPositionUpdateInterval                    ;A7F8A4;
    STA.W $0FE8,X                                                        ;A7F8A7;
    LDA.W $0FEE,X                                                        ;A7F8AA;
    BNE .echo1                                                           ;A7F8AD;
    LDA.W EnemyData.xPosition,X                                          ;A7F8AF;
    STA.W $0FBA,X                                                        ;A7F8B2;
    LDA.W EnemyData.yPosition,X                                          ;A7F8B5;
    STA.W $0FBE,X                                                        ;A7F8B8;
    LDA.W DachoraConstants_echoLifetime                                  ;A7F8BB;
    STA.W $0FEE,X                                                        ;A7F8BE;
    RTS                                                                  ;A7F8C1;


.echo1:
    LDA.W $102E,X                                                        ;A7F8C2;
    BNE .echo2                                                           ;A7F8C5;
    LDA.W EnemyData.xPosition,X                                          ;A7F8C7;
    STA.W $0FFA,X                                                        ;A7F8CA;
    LDA.W EnemyData.yPosition,X                                          ;A7F8CD;
    STA.W $0FFE,X                                                        ;A7F8D0;
    LDA.W DachoraConstants_echoLifetime                                  ;A7F8D3;
    STA.W $102E,X                                                        ;A7F8D6;
    RTS                                                                  ;A7F8D9;


.echo2:
    LDA.W $106E,X                                                        ;A7F8DA;
    BNE .echo3                                                           ;A7F8DD;
    LDA.W EnemyData.xPosition,X                                          ;A7F8DF;
    STA.W $103A,X                                                        ;A7F8E2;
    LDA.W EnemyData.yPosition,X                                          ;A7F8E5;
    STA.W $103E,X                                                        ;A7F8E8;
    LDA.W DachoraConstants_echoLifetime                                  ;A7F8EB;
    STA.W $106E,X                                                        ;A7F8EE;
    RTS                                                                  ;A7F8F1;


.echo3:
    LDA.W $10AE,X                                                        ;A7F8F2;
    BNE .return                                                          ;A7F8F5;
    LDA.W EnemyData.xPosition,X                                          ;A7F8F7;
    STA.W $107A,X                                                        ;A7F8FA;
    LDA.W EnemyData.yPosition,X                                          ;A7F8FD;
    STA.W $107E,X                                                        ;A7F900;
    LDA.W DachoraConstants_echoLifetime                                  ;A7F903;
    STA.W $10AE,X                                                        ;A7F906;

.return:
    RTS                                                                  ;A7F909;


LoadDachoraShinePalette:
    LDA.W EnemyData.work4,X                                              ;A7F90A;
    XBA                                                                  ;A7F90D;
    AND.W #$00FF                                                         ;A7F90E;
    ASL A                                                                ;A7F911;
    TAY                                                                  ;A7F912;
    LDA.W .pointers,Y                                                    ;A7F913;
    TAY                                                                  ;A7F916;
    JSR.W LoadDachoraPalette                                             ;A7F917;
    LDA.W EnemyData.work4,X                                              ;A7F91A;
    CLC                                                                  ;A7F91D;
    ADC.W #$0100                                                         ;A7F91E;
    STA.W EnemyData.work4,X                                              ;A7F921;
    CMP.W #$0400                                                         ;A7F924;
    BMI .return                                                          ;A7F927;
    STZ.W EnemyData.work4,X                                              ;A7F929;

.return:
    RTS                                                                  ;A7F92C;


.pointers:
    dw Palette_Dachora_Shine_0                                           ;A7F92D;
    dw Palette_Dachora_Shine_1                                           ;A7F92F;
    dw Palette_Dachora_Shine_2                                           ;A7F931;
    dw Palette_Dachora_Shine_3                                           ;A7F933;

Function_Dachora_Falling:
    LDA.W EnemyData.work1,X                                              ;A7F935;
    CLC                                                                  ;A7F938;
    ADC.L $000B32                                                        ;A7F939;
    STA.W EnemyData.work1,X                                              ;A7F93D;
    STA.B $12                                                            ;A7F940;
    LDA.W EnemyData.work0,X                                              ;A7F942;
    ADC.L $000B34                                                        ;A7F945;
    STA.W EnemyData.work0,X                                              ;A7F949;
    STA.B $14                                                            ;A7F94C;
    CMP.W #$000A                                                         ;A7F94E;
    BMI +                                                                ;A7F951;
    LDA.W #$000A                                                         ;A7F953;
    STA.B $14                                                            ;A7F956;
    STZ.B $12                                                            ;A7F958;

  + JSL.L MoveEnemyDownBy_14_12                                          ;A7F95A;
    BCC .return                                                          ;A7F95E;
    LDA.W EnemyData.initParam0,X                                         ;A7F960;
    BEQ .left                                                            ;A7F963;
    LDA.W #InstList_Dachora_RunningRight                                 ;A7F965;
    STA.W EnemyData.pInstList,X                                          ;A7F968;
    LDA.W #Function_Dachora_RunningRight                                 ;A7F96B;
    STA.W EnemyData.work5,X                                              ;A7F96E;
    BRA +                                                                ;A7F971;


.left:
    LDA.W #InstList_Dachora_RunningLeft                                  ;A7F973;
    STA.W EnemyData.pInstList,X                                          ;A7F976;
    LDA.W #Function_Dachora_RunningLeft                                  ;A7F979;
    STA.W EnemyData.work5,X                                              ;A7F97C;

  + LDA.W #$0001                                                         ;A7F97F;
    STA.W EnemyData.instTimer,X                                          ;A7F982;
    STZ.W EnemyData.work0,X                                              ;A7F985;
    STZ.W EnemyData.work1,X                                              ;A7F988;

.return:
    RTL                                                                  ;A7F98B;


Function_Dachora_Echo:
    LDA.W EnemyData.work3,X                                              ;A7F98C;
    BEQ .invisible                                                       ;A7F98F;
    DEC A                                                                ;A7F991;
    STA.W EnemyData.work3,X                                              ;A7F992;
    TXA                                                                  ;A7F995;
    BIT.W #$0040                                                         ;A7F996;
    BEQ +                                                                ;A7F999;
    LDA.W $05B6                                                          ;A7F99B;
    BIT.W #$0001                                                         ;A7F99E;
    BNE .visible                                                         ;A7F9A1;
    BRA .invisible                                                       ;A7F9A3;


  + LDA.W $05B6                                                          ;A7F9A5;
    BIT.W #$0001                                                         ;A7F9A8;
    BEQ .visible                                                         ;A7F9AB;

.invisible:
    LDA.W EnemyData.properties,X                                         ;A7F9AD;
    ORA.W #$0100                                                         ;A7F9B0;
    STA.W EnemyData.properties,X                                         ;A7F9B3;
    BRA .return                                                          ;A7F9B6;


.visible:
    LDA.W EnemyData.properties,X                                         ;A7F9B8;
    AND.W #$FEFF                                                         ;A7F9BB;
    STA.W EnemyData.properties,X                                         ;A7F9BE;

.return:
    RTL                                                                  ;A7F9C1;


RTL_A7F9C2:
    RTL                                                                  ;A7F9C2;


RTL_A7F9C3:
    RTL                                                                  ;A7F9C3;


Spritemap_Dachora_0:
    dw $0009,$01F0                                                       ;A7F9C4;
    db $F2                                                               ;A7F9C8;
    dw $3310,$C3F8                                                       ;A7F9C9;
    db $EA                                                               ;A7F9CD;
    dw $3301,$0002                                                       ;A7F9CE;
    db $F7                                                               ;A7F9D2;
    dw $331E,$01FA                                                       ;A7F9D3;
    db $F7                                                               ;A7F9D7;
    dw $330E,$01F2                                                       ;A7F9D8;
    db $03                                                               ;A7F9DC;
    dw $331F,$01F2                                                       ;A7F9DD;
    db $FB                                                               ;A7F9E1;
    dw $330F,$01F2                                                       ;A7F9E2;
    db $0F                                                               ;A7F9E6;
    dw $3322,$C3FA                                                       ;A7F9E7;
    db $07                                                               ;A7F9EB;
    dw $3313,$C3FA                                                       ;A7F9EC;
    db $FF                                                               ;A7F9F0;
    dw $3303                                                             ;A7F9F1;

Spritemap_Dachora_1:
    dw $0009,$01EF                                                       ;A7F9F3;
    db $F3                                                               ;A7F9F7;
    dw $3310,$C3F7                                                       ;A7F9F8;
    db $EB                                                               ;A7F9FC;
    dw $3301,$0002                                                       ;A7F9FD;
    db $F8                                                               ;A7FA01;
    dw $335F,$01FA                                                       ;A7FA02;
    db $F8                                                               ;A7FA06;
    dw $335E,$01F2                                                       ;A7FA07;
    db $04                                                               ;A7FA0B;
    dw $331F,$01F2                                                       ;A7FA0C;
    db $FC                                                               ;A7FA10;
    dw $330F,$C3FA                                                       ;A7FA11;
    db $08                                                               ;A7FA15;
    dw $3316,$01F2                                                       ;A7FA16;
    db $08                                                               ;A7FA1A;
    dw $3315,$C3FA                                                       ;A7FA1B;
    db $00                                                               ;A7FA1F;
    dw $3306                                                             ;A7FA20;

Spritemap_Dachora_2:
    dw $000B,$01EE                                                       ;A7FA22;
    db $F1                                                               ;A7FA26;
    dw $3310,$C3F6                                                       ;A7FA27;
    db $E9                                                               ;A7FA2B;
    dw $3301,$01EA                                                       ;A7FA2C;
    db $0E                                                               ;A7FA30;
    dw $332D,$0002                                                       ;A7FA31;
    db $F6                                                               ;A7FA35;
    dw $331E,$01FA                                                       ;A7FA36;
    db $F6                                                               ;A7FA3A;
    dw $330E,$01F2                                                       ;A7FA3B;
    db $FA                                                               ;A7FA3F;
    dw $330F,$C3FA                                                       ;A7FA40;
    db $FE                                                               ;A7FA44;
    dw $3309,$C3F2                                                       ;A7FA45;
    db $FE                                                               ;A7FA49;
    dw $3308,$000A                                                       ;A7FA4A;
    db $0E                                                               ;A7FA4E;
    dw $332B,$000A                                                       ;A7FA4F;
    db $06                                                               ;A7FA53;
    dw $331B,$C3F2                                                       ;A7FA54;
    db $06                                                               ;A7FA58;
    dw $3318                                                             ;A7FA59;

Spritemap_Dachora_3:
    dw $0009,$01F0                                                       ;A7FA5B;
    db $F2                                                               ;A7FA5F;
    dw $3310,$C3F8                                                       ;A7FA60;
    db $EA                                                               ;A7FA64;
    dw $3301,$0002                                                       ;A7FA65;
    db $F7                                                               ;A7FA69;
    dw $335F,$01FA                                                       ;A7FA6A;
    db $F7                                                               ;A7FA6E;
    dw $335E,$01F2                                                       ;A7FA6F;
    db $0F                                                               ;A7FA73;
    dw $3352,$01F2                                                       ;A7FA74;
    db $03                                                               ;A7FA78;
    dw $331F,$01F2                                                       ;A7FA79;
    db $FB                                                               ;A7FA7D;
    dw $330F,$C3FA                                                       ;A7FA7E;
    db $07                                                               ;A7FA82;
    dw $3343,$C3FA                                                       ;A7FA83;
    db $FF                                                               ;A7FA87;
    dw $3333                                                             ;A7FA88;

Spritemap_Dachora_4:
    dw $0009,$01EF                                                       ;A7FA8A;
    db $F3                                                               ;A7FA8E;
    dw $3310,$C3F7                                                       ;A7FA8F;
    db $EB                                                               ;A7FA93;
    dw $3301,$01F4                                                       ;A7FA94;
    db $10                                                               ;A7FA98;
    dw $3352,$01F2                                                       ;A7FA99;
    db $04                                                               ;A7FA9D;
    dw $331F,$01F2                                                       ;A7FA9E;
    db $FC                                                               ;A7FAA2;
    dw $330F,$0002                                                       ;A7FAA3;
    db $F8                                                               ;A7FAA7;
    dw $331E,$01FA                                                       ;A7FAA8;
    db $F8                                                               ;A7FAAC;
    dw $330E,$C3FA                                                       ;A7FAAD;
    db $08                                                               ;A7FAB1;
    dw $3346,$C3FA                                                       ;A7FAB2;
    db $00                                                               ;A7FAB6;
    dw $3336                                                             ;A7FAB7;

Spritemap_Dachora_5:
    dw $000B,$01EE                                                       ;A7FAB9;
    db $F1                                                               ;A7FABD;
    dw $3310,$C3F6                                                       ;A7FABE;
    db $E9                                                               ;A7FAC2;
    dw $3301,$0002                                                       ;A7FAC3;
    db $F6                                                               ;A7FAC7;
    dw $335F,$01FA                                                       ;A7FAC8;
    db $F6                                                               ;A7FACC;
    dw $335E,$01EA                                                       ;A7FACD;
    db $0E                                                               ;A7FAD1;
    dw $335A,$01F2                                                       ;A7FAD2;
    db $FA                                                               ;A7FAD6;
    dw $330F,$C3FA                                                       ;A7FAD7;
    db $FE                                                               ;A7FADB;
    dw $3339,$C3F2                                                       ;A7FADC;
    db $06                                                               ;A7FAE0;
    dw $3348,$000A                                                       ;A7FAE1;
    db $06                                                               ;A7FAE5;
    dw $334B,$000A                                                       ;A7FAE6;
    db $0E                                                               ;A7FAEA;
    dw $335B,$C3F2                                                       ;A7FAEB;
    db $FE                                                               ;A7FAEF;
    dw $3338                                                             ;A7FAF0;

Spritemap_Dachora_6:
    dw $0008,$01F6                                                       ;A7FAF2;
    db $FD                                                               ;A7FAF6;
    dw $3305,$01ED                                                       ;A7FAF7;
    db $FD                                                               ;A7FAFB;
    dw $3310,$C3F5                                                       ;A7FAFC;
    db $F5                                                               ;A7FB00;
    dw $3301,$01F3                                                       ;A7FB01;
    db $08                                                               ;A7FB05;
    dw $331F,$01F3                                                       ;A7FB06;
    db $00                                                               ;A7FB0A;
    dw $330F,$0003                                                       ;A7FB0B;
    db $FD                                                               ;A7FB0F;
    dw $331E,$01FB                                                       ;A7FB10;
    db $FD                                                               ;A7FB14;
    dw $330E,$C3FB                                                       ;A7FB15;
    db $05                                                               ;A7FB19;
    dw $330C                                                             ;A7FB1A;

Spritemap_Dachora_7:
    dw $000A,$0003                                                       ;A7FB1C;
    db $F1                                                               ;A7FB20;
    dw $331E,$01FB                                                       ;A7FB21;
    db $F1                                                               ;A7FB25;
    dw $330E,$01F3                                                       ;A7FB26;
    db $FD                                                               ;A7FB2A;
    dw $331F,$01F3                                                       ;A7FB2B;
    db $F5                                                               ;A7FB2F;
    dw $330F,$C3FB                                                       ;A7FB30;
    db $F9                                                               ;A7FB34;
    dw $333C,$01FE                                                       ;A7FB35;
    db $DF                                                               ;A7FB39;
    dw $F341,$C3FE                                                       ;A7FB3A;
    db $E7                                                               ;A7FB3E;
    dw $F320,$0003                                                       ;A7FB3F;
    db $09                                                               ;A7FB43;
    dw $335D,$01FB                                                       ;A7FB44;
    db $09                                                               ;A7FB48;
    dw $3350,$01FB                                                       ;A7FB49;
    db $11                                                               ;A7FB4D;
    dw $3325                                                             ;A7FB4E;

Spritemap_Dachora_8:
    dw $0009,$01F0                                                       ;A7FB50;
    db $F3                                                               ;A7FB54;
    dw $3310,$C3F8                                                       ;A7FB55;
    db $EB                                                               ;A7FB59;
    dw $3301,$01F3                                                       ;A7FB5A;
    db $10                                                               ;A7FB5E;
    dw $3351,$0003                                                       ;A7FB5F;
    db $F8                                                               ;A7FB63;
    dw $331E,$01FB                                                       ;A7FB64;
    db $F8                                                               ;A7FB68;
    dw $330E,$01F3                                                       ;A7FB69;
    db $04                                                               ;A7FB6D;
    dw $331F,$01F3                                                       ;A7FB6E;
    db $FC                                                               ;A7FB72;
    dw $330F,$C3FB                                                       ;A7FB73;
    db $08                                                               ;A7FB77;
    dw $334C,$C3FB                                                       ;A7FB78;
    db $00                                                               ;A7FB7C;
    dw $333C                                                             ;A7FB7D;

Spritemap_Dachora_9:
    dw $000A,$01F9                                                       ;A7FB7F;
    db $F3                                                               ;A7FB83;
    dw $3340,$01F0                                                       ;A7FB84;
    db $F3                                                               ;A7FB88;
    dw $3310,$C3F8                                                       ;A7FB89;
    db $EB                                                               ;A7FB8D;
    dw $3301,$01F3                                                       ;A7FB8E;
    db $10                                                               ;A7FB92;
    dw $3351,$0003                                                       ;A7FB93;
    db $F8                                                               ;A7FB97;
    dw $331E,$01FB                                                       ;A7FB98;
    db $F8                                                               ;A7FB9C;
    dw $330E,$01F3                                                       ;A7FB9D;
    db $04                                                               ;A7FBA1;
    dw $331F,$01F3                                                       ;A7FBA2;
    db $FC                                                               ;A7FBA6;
    dw $330F,$C3FB                                                       ;A7FBA7;
    db $08                                                               ;A7FBAB;
    dw $334C,$C3FB                                                       ;A7FBAC;
    db $00                                                               ;A7FBB0;
    dw $333C                                                             ;A7FBB1;

Spritemap_Dachora_A:
    dw $000A,$01F9                                                       ;A7FBB3;
    db $F3                                                               ;A7FBB7;
    dw $3305,$01F0                                                       ;A7FBB8;
    db $F3                                                               ;A7FBBC;
    dw $3310,$C3F8                                                       ;A7FBBD;
    db $EB                                                               ;A7FBC1;
    dw $3301,$01F3                                                       ;A7FBC2;
    db $10                                                               ;A7FBC6;
    dw $3351,$0003                                                       ;A7FBC7;
    db $F8                                                               ;A7FBCB;
    dw $331E,$01FB                                                       ;A7FBCC;
    db $F8                                                               ;A7FBD0;
    dw $330E,$01F3                                                       ;A7FBD1;
    db $04                                                               ;A7FBD5;
    dw $331F,$01F3                                                       ;A7FBD6;
    db $FC                                                               ;A7FBDA;
    dw $330F,$C3FB                                                       ;A7FBDB;
    db $08                                                               ;A7FBDF;
    dw $334C,$C3FB                                                       ;A7FBE0;
    db $00                                                               ;A7FBE4;
    dw $333C                                                             ;A7FBE5;

Spritemap_Dachora_B:
    dw $0009,$01E5                                                       ;A7FBE7;
    db $09                                                               ;A7FBEB;
    dw $332A,$C3E3                                                       ;A7FBEC;
    db $F9                                                               ;A7FBF0;
    dw $333E,$0003                                                       ;A7FBF1;
    db $F8                                                               ;A7FBF5;
    dw $332F,$01FB                                                       ;A7FBF6;
    db $F8                                                               ;A7FBFA;
    dw $332E,$01F3                                                       ;A7FBFB;
    db $08                                                               ;A7FBFF;
    dw $3345,$01F3                                                       ;A7FC00;
    db $00                                                               ;A7FC04;
    dw $3335,$01F3                                                       ;A7FC05;
    db $10                                                               ;A7FC09;
    dw $3351,$C3FB                                                       ;A7FC0A;
    db $08                                                               ;A7FC0E;
    dw $334C,$C3FB                                                       ;A7FC0F;
    db $00                                                               ;A7FC13;
    dw $333C                                                             ;A7FC14;

Spritemap_Dachora_C:
    dw $0009,$0003                                                       ;A7FC16;
    db $F8                                                               ;A7FC1A;
    dw $332F,$01FB                                                       ;A7FC1B;
    db $F8                                                               ;A7FC1F;
    dw $332E,$01EB                                                       ;A7FC20;
    db $11                                                               ;A7FC24;
    dw $3341,$C3E3                                                       ;A7FC25;
    db $01                                                               ;A7FC29;
    dw $3320,$01F3                                                       ;A7FC2A;
    db $08                                                               ;A7FC2E;
    dw $3342,$01F3                                                       ;A7FC2F;
    db $00                                                               ;A7FC33;
    dw $3332,$01F3                                                       ;A7FC34;
    db $10                                                               ;A7FC38;
    dw $3351,$C3FB                                                       ;A7FC39;
    db $08                                                               ;A7FC3D;
    dw $334C,$C3FB                                                       ;A7FC3E;
    db $00                                                               ;A7FC42;
    dw $333C                                                             ;A7FC43;

Spritemap_Dachora_D:
    dw $0009,$0003                                                       ;A7FC45;
    db $F8                                                               ;A7FC49;
    dw $332F,$01FB                                                       ;A7FC4A;
    db $F8                                                               ;A7FC4E;
    dw $332E,$01EB                                                       ;A7FC4F;
    db $12                                                               ;A7FC53;
    dw $3341,$C3E3                                                       ;A7FC54;
    db $02                                                               ;A7FC58;
    dw $3320,$01F3                                                       ;A7FC59;
    db $08                                                               ;A7FC5D;
    dw $3342,$01F3                                                       ;A7FC5E;
    db $00                                                               ;A7FC62;
    dw $3332,$01F3                                                       ;A7FC63;
    db $10                                                               ;A7FC67;
    dw $3351,$C3FB                                                       ;A7FC68;
    db $08                                                               ;A7FC6C;
    dw $334C,$C3FB                                                       ;A7FC6D;
    db $00                                                               ;A7FC71;
    dw $333C                                                             ;A7FC72;

Spritemap_Dachora_E:
    dw $0009,$0003                                                       ;A7FC74;
    db $F8                                                               ;A7FC78;
    dw $332F,$01FB                                                       ;A7FC79;
    db $F8                                                               ;A7FC7D;
    dw $332E,$01EB                                                       ;A7FC7E;
    db $13                                                               ;A7FC82;
    dw $3341,$C3E3                                                       ;A7FC83;
    db $03                                                               ;A7FC87;
    dw $3320,$01F3                                                       ;A7FC88;
    db $08                                                               ;A7FC8C;
    dw $3342,$01F3                                                       ;A7FC8D;
    db $00                                                               ;A7FC91;
    dw $3332,$01F3                                                       ;A7FC92;
    db $10                                                               ;A7FC96;
    dw $3351,$C3FB                                                       ;A7FC97;
    db $08                                                               ;A7FC9B;
    dw $334C,$C3FB                                                       ;A7FC9C;
    db $00                                                               ;A7FCA0;
    dw $333C                                                             ;A7FCA1;

Spritemap_Dachora_F:
    dw $0009,$0008                                                       ;A7FCA3;
    db $F2                                                               ;A7FCA7;
    dw $7310,$C3F8                                                       ;A7FCA8;
    db $EA                                                               ;A7FCAC;
    dw $7301,$01F6                                                       ;A7FCAD;
    db $F7                                                               ;A7FCB1;
    dw $731E,$01FE                                                       ;A7FCB2;
    db $F7                                                               ;A7FCB6;
    dw $730E,$0006                                                       ;A7FCB7;
    db $03                                                               ;A7FCBB;
    dw $731F,$0006                                                       ;A7FCBC;
    db $FB                                                               ;A7FCC0;
    dw $730F,$0006                                                       ;A7FCC1;
    db $0F                                                               ;A7FCC5;
    dw $7322,$C3F6                                                       ;A7FCC6;
    db $07                                                               ;A7FCCA;
    dw $7313,$C3F6                                                       ;A7FCCB;
    db $FF                                                               ;A7FCCF;
    dw $7303                                                             ;A7FCD0;

Spritemap_Dachora_10:
    dw $0009,$0009                                                       ;A7FCD2;
    db $F3                                                               ;A7FCD6;
    dw $7310,$C3F9                                                       ;A7FCD7;
    db $EB                                                               ;A7FCDB;
    dw $7301,$01F6                                                       ;A7FCDC;
    db $F8                                                               ;A7FCE0;
    dw $735F,$01FE                                                       ;A7FCE1;
    db $F8                                                               ;A7FCE5;
    dw $735E,$0006                                                       ;A7FCE6;
    db $04                                                               ;A7FCEA;
    dw $731F,$0006                                                       ;A7FCEB;
    db $FC                                                               ;A7FCEF;
    dw $730F,$C3F6                                                       ;A7FCF0;
    db $08                                                               ;A7FCF4;
    dw $7316,$0006                                                       ;A7FCF5;
    db $08                                                               ;A7FCF9;
    dw $7315,$C3F6                                                       ;A7FCFA;
    db $00                                                               ;A7FCFE;
    dw $7306                                                             ;A7FCFF;

Spritemap_Dachora_11:
    dw $000B,$000A                                                       ;A7FD01;
    db $F1                                                               ;A7FD05;
    dw $7310,$C3FA                                                       ;A7FD06;
    db $E9                                                               ;A7FD0A;
    dw $7301,$000E                                                       ;A7FD0B;
    db $0E                                                               ;A7FD0F;
    dw $732D,$01F6                                                       ;A7FD10;
    db $F6                                                               ;A7FD14;
    dw $731E,$01FE                                                       ;A7FD15;
    db $F6                                                               ;A7FD19;
    dw $730E,$0006                                                       ;A7FD1A;
    db $FA                                                               ;A7FD1E;
    dw $730F,$C3F6                                                       ;A7FD1F;
    db $FE                                                               ;A7FD23;
    dw $7309,$C3FE                                                       ;A7FD24;
    db $FE                                                               ;A7FD28;
    dw $7308,$01EE                                                       ;A7FD29;
    db $0E                                                               ;A7FD2D;
    dw $732B,$01EE                                                       ;A7FD2E;
    db $06                                                               ;A7FD32;
    dw $731B,$C3FE                                                       ;A7FD33;
    db $06                                                               ;A7FD37;
    dw $7318                                                             ;A7FD38;

Spritemap_Dachora_12:
    dw $0009,$0008                                                       ;A7FD3A;
    db $F2                                                               ;A7FD3E;
    dw $7310,$C3F8                                                       ;A7FD3F;
    db $EA                                                               ;A7FD43;
    dw $7301,$01F6                                                       ;A7FD44;
    db $F7                                                               ;A7FD48;
    dw $735F,$01FE                                                       ;A7FD49;
    db $F7                                                               ;A7FD4D;
    dw $735E,$0006                                                       ;A7FD4E;
    db $0F                                                               ;A7FD52;
    dw $7352,$0006                                                       ;A7FD53;
    db $03                                                               ;A7FD57;
    dw $731F,$0006                                                       ;A7FD58;
    db $FB                                                               ;A7FD5C;
    dw $730F,$C3F6                                                       ;A7FD5D;
    db $07                                                               ;A7FD61;
    dw $7343,$C3F6                                                       ;A7FD62;
    db $FF                                                               ;A7FD66;
    dw $7333                                                             ;A7FD67;

Spritemap_Dachora_13:
    dw $0009,$0009                                                       ;A7FD69;
    db $F3                                                               ;A7FD6D;
    dw $7310,$C3F9                                                       ;A7FD6E;
    db $EB                                                               ;A7FD72;
    dw $7301,$0004                                                       ;A7FD73;
    db $10                                                               ;A7FD77;
    dw $7352,$0006                                                       ;A7FD78;
    db $04                                                               ;A7FD7C;
    dw $731F,$0006                                                       ;A7FD7D;
    db $FC                                                               ;A7FD81;
    dw $730F,$01F6                                                       ;A7FD82;
    db $F8                                                               ;A7FD86;
    dw $731E,$01FE                                                       ;A7FD87;
    db $F8                                                               ;A7FD8B;
    dw $730E,$C3F6                                                       ;A7FD8C;
    db $08                                                               ;A7FD90;
    dw $7346,$C3F6                                                       ;A7FD91;
    db $00                                                               ;A7FD95;
    dw $7336                                                             ;A7FD96;

Spritemap_Dachora_14:
    dw $000B,$000A                                                       ;A7FD98;
    db $F1                                                               ;A7FD9C;
    dw $7310,$C3FA                                                       ;A7FD9D;
    db $E9                                                               ;A7FDA1;
    dw $7301,$01F6                                                       ;A7FDA2;
    db $F6                                                               ;A7FDA6;
    dw $735F,$01FE                                                       ;A7FDA7;
    db $F6                                                               ;A7FDAB;
    dw $735E,$000E                                                       ;A7FDAC;
    db $0E                                                               ;A7FDB0;
    dw $735A,$0006                                                       ;A7FDB1;
    db $FA                                                               ;A7FDB5;
    dw $730F,$C3F6                                                       ;A7FDB6;
    db $FE                                                               ;A7FDBA;
    dw $7339,$C3FE                                                       ;A7FDBB;
    db $06                                                               ;A7FDBF;
    dw $7348,$01EE                                                       ;A7FDC0;
    db $06                                                               ;A7FDC4;
    dw $734B,$01EE                                                       ;A7FDC5;
    db $0E                                                               ;A7FDC9;
    dw $735B,$C3FE                                                       ;A7FDCA;
    db $FE                                                               ;A7FDCE;
    dw $7338                                                             ;A7FDCF;

Spritemap_Dachora_15:
    dw $0008,$0002                                                       ;A7FDD1;
    db $FD                                                               ;A7FDD5;
    dw $7305,$000B                                                       ;A7FDD6;
    db $FD                                                               ;A7FDDA;
    dw $7310,$C3FB                                                       ;A7FDDB;
    db $F5                                                               ;A7FDDF;
    dw $7301,$0005                                                       ;A7FDE0;
    db $08                                                               ;A7FDE4;
    dw $731F,$0005                                                       ;A7FDE5;
    db $00                                                               ;A7FDE9;
    dw $730F,$01F5                                                       ;A7FDEA;
    db $FD                                                               ;A7FDEE;
    dw $731E,$01FD                                                       ;A7FDEF;
    db $FD                                                               ;A7FDF3;
    dw $730E,$C3F5                                                       ;A7FDF4;
    db $05                                                               ;A7FDF8;
    dw $730C                                                             ;A7FDF9;

Spritemap_Dachora_16:
    dw $000A,$01F5                                                       ;A7FDFB;
    db $F1                                                               ;A7FDFF;
    dw $731E,$01FD                                                       ;A7FE00;
    db $F1                                                               ;A7FE04;
    dw $730E,$0005                                                       ;A7FE05;
    db $FD                                                               ;A7FE09;
    dw $731F,$0005                                                       ;A7FE0A;
    db $F5                                                               ;A7FE0E;
    dw $730F,$C3F5                                                       ;A7FE0F;
    db $F9                                                               ;A7FE13;
    dw $733C,$01FA                                                       ;A7FE14;
    db $DF                                                               ;A7FE18;
    dw $B341,$C3F2                                                       ;A7FE19;
    db $E7                                                               ;A7FE1D;
    dw $B320,$01F5                                                       ;A7FE1E;
    db $09                                                               ;A7FE22;
    dw $735D,$01FD                                                       ;A7FE23;
    db $09                                                               ;A7FE27;
    dw $7350,$01FD                                                       ;A7FE28;
    db $11                                                               ;A7FE2C;
    dw $7325                                                             ;A7FE2D;

Spritemap_Dachora_17:
    dw $0009,$0008                                                       ;A7FE2F;
    db $F3                                                               ;A7FE33;
    dw $7310,$C3F8                                                       ;A7FE34;
    db $EB                                                               ;A7FE38;
    dw $7301,$0005                                                       ;A7FE39;
    db $10                                                               ;A7FE3D;
    dw $7351,$01F5                                                       ;A7FE3E;
    db $F8                                                               ;A7FE42;
    dw $731E,$01FD                                                       ;A7FE43;
    db $F8                                                               ;A7FE47;
    dw $730E,$0005                                                       ;A7FE48;
    db $04                                                               ;A7FE4C;
    dw $731F,$0005                                                       ;A7FE4D;
    db $FC                                                               ;A7FE51;
    dw $730F,$C3F5                                                       ;A7FE52;
    db $08                                                               ;A7FE56;
    dw $734C,$C3F5                                                       ;A7FE57;
    db $00                                                               ;A7FE5B;
    dw $733C                                                             ;A7FE5C;

Spritemap_Dachora_18:
    dw $000A,$01FF                                                       ;A7FE5E;
    db $F3                                                               ;A7FE62;
    dw $7340,$0008                                                       ;A7FE63;
    db $F3                                                               ;A7FE67;
    dw $7310,$C3F8                                                       ;A7FE68;
    db $EB                                                               ;A7FE6C;
    dw $7301,$0005                                                       ;A7FE6D;
    db $10                                                               ;A7FE71;
    dw $7351,$01F5                                                       ;A7FE72;
    db $F8                                                               ;A7FE76;
    dw $731E,$01FD                                                       ;A7FE77;
    db $F8                                                               ;A7FE7B;
    dw $730E,$0005                                                       ;A7FE7C;
    db $04                                                               ;A7FE80;
    dw $731F,$0005                                                       ;A7FE81;
    db $FC                                                               ;A7FE85;
    dw $730F,$C3F5                                                       ;A7FE86;
    db $08                                                               ;A7FE8A;
    dw $734C,$C3F5                                                       ;A7FE8B;
    db $00                                                               ;A7FE8F;
    dw $733C                                                             ;A7FE90;

Spritemap_Dachora_19:
    dw $000A,$01FF                                                       ;A7FE92;
    db $F3                                                               ;A7FE96;
    dw $7305,$0008                                                       ;A7FE97;
    db $F3                                                               ;A7FE9B;
    dw $7310,$C3F8                                                       ;A7FE9C;
    db $EB                                                               ;A7FEA0;
    dw $7301,$0005                                                       ;A7FEA1;
    db $10                                                               ;A7FEA5;
    dw $7351,$01F5                                                       ;A7FEA6;
    db $F8                                                               ;A7FEAA;
    dw $731E,$01FD                                                       ;A7FEAB;
    db $F8                                                               ;A7FEAF;
    dw $730E,$0005                                                       ;A7FEB0;
    db $04                                                               ;A7FEB4;
    dw $731F,$0005                                                       ;A7FEB5;
    db $FC                                                               ;A7FEB9;
    dw $730F,$C3F5                                                       ;A7FEBA;
    db $08                                                               ;A7FEBE;
    dw $734C,$C3F5                                                       ;A7FEBF;
    db $00                                                               ;A7FEC3;
    dw $733C                                                             ;A7FEC4;

Spritemap_Dachora_1A:
    dw $0009,$0013                                                       ;A7FEC6;
    db $09                                                               ;A7FECA;
    dw $732A,$C20D                                                       ;A7FECB;
    db $F9                                                               ;A7FECF;
    dw $733E,$01F5                                                       ;A7FED0;
    db $F8                                                               ;A7FED4;
    dw $732F,$01FD                                                       ;A7FED5;
    db $F8                                                               ;A7FED9;
    dw $732E,$0005                                                       ;A7FEDA;
    db $08                                                               ;A7FEDE;
    dw $7345,$0005                                                       ;A7FEDF;
    db $00                                                               ;A7FEE3;
    dw $7335,$0005                                                       ;A7FEE4;
    db $10                                                               ;A7FEE8;
    dw $7351,$C3F5                                                       ;A7FEE9;
    db $08                                                               ;A7FEED;
    dw $734C,$C3F5                                                       ;A7FEEE;
    db $00                                                               ;A7FEF2;
    dw $733C                                                             ;A7FEF3;

Spritemap_Dachora_1B:
    dw $0009,$01F5                                                       ;A7FEF5;
    db $F8                                                               ;A7FEF9;
    dw $732F,$01FD                                                       ;A7FEFA;
    db $F8                                                               ;A7FEFE;
    dw $732E,$000D                                                       ;A7FEFF;
    db $11                                                               ;A7FF03;
    dw $7341,$C20D                                                       ;A7FF04;
    db $01                                                               ;A7FF08;
    dw $7320,$0005                                                       ;A7FF09;
    db $08                                                               ;A7FF0D;
    dw $7342,$0005                                                       ;A7FF0E;
    db $00                                                               ;A7FF12;
    dw $7332,$0005                                                       ;A7FF13;
    db $10                                                               ;A7FF17;
    dw $7351,$C3F5                                                       ;A7FF18;
    db $08                                                               ;A7FF1C;
    dw $734C,$C3F5                                                       ;A7FF1D;
    db $00                                                               ;A7FF21;
    dw $733C                                                             ;A7FF22;

Spritemap_Dachora_1C:
    dw $0009,$01F5                                                       ;A7FF24;
    db $F8                                                               ;A7FF28;
    dw $732F,$01FD                                                       ;A7FF29;
    db $F8                                                               ;A7FF2D;
    dw $732E,$000D                                                       ;A7FF2E;
    db $12                                                               ;A7FF32;
    dw $7341,$C20D                                                       ;A7FF33;
    db $02                                                               ;A7FF37;
    dw $7320,$0005                                                       ;A7FF38;
    db $08                                                               ;A7FF3C;
    dw $7342,$0005                                                       ;A7FF3D;
    db $00                                                               ;A7FF41;
    dw $7332,$0005                                                       ;A7FF42;
    db $10                                                               ;A7FF46;
    dw $7351,$C3F5                                                       ;A7FF47;
    db $08                                                               ;A7FF4B;
    dw $734C,$C3F5                                                       ;A7FF4C;
    db $00                                                               ;A7FF50;
    dw $733C                                                             ;A7FF51;

Spritemap_Dachora_1D:
    dw $0009,$01F5                                                       ;A7FF53;
    db $F8                                                               ;A7FF57;
    dw $732F,$01FD                                                       ;A7FF58;
    db $F8                                                               ;A7FF5C;
    dw $732E,$000D                                                       ;A7FF5D;
    db $13                                                               ;A7FF61;
    dw $7341,$C20D                                                       ;A7FF62;
    db $03                                                               ;A7FF66;
    dw $7320,$0005                                                       ;A7FF67;
    db $08                                                               ;A7FF6B;
    dw $7342,$0005                                                       ;A7FF6C;
    db $00                                                               ;A7FF70;
    dw $7332,$0005                                                       ;A7FF71;
    db $10                                                               ;A7FF75;
    dw $7351,$C3F5                                                       ;A7FF76;
    db $08                                                               ;A7FF7A;
    dw $734C,$C3F5                                                       ;A7FF7B;
    db $00                                                               ;A7FF7F;
    dw $733C                                                             ;A7FF80;

Freespace_BankA7_FF82:                                                   ;A7FF82;
; $7E bytes
